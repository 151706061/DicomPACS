unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  FIBDatabase, pFIBDatabase, KXString, KXServerCore, DCM_WADO, DCM_Attributes,
  pFIBDataSet, DB, pFIBQuery, pFIBProps, IB_Services, DCM_Client, ExtCtrls, Uni;

type
  TWADOServer = class(TService)
    WADOServerCore1: TWADOServerCore;
    Timer1: TTimer;
    procedure ServiceExecute(Sender: TService);
    procedure ServiceShutdown(Sender: TService);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure WADOServerCore1CommandGET(ClientThread: THTTPClientThread;
      HeaderInfo: THeaderInfo; var EnableKeepAlive: Boolean);
    procedure WADOServerCore1FindImage(studyUID, seriesUID, objectUID: string;
      var ADataset: TDicomDataset);
    procedure WADOServerCore1CommandPOST(ClientThread: THTTPClientThread;
      HeaderInfo: THeaderInfo; var EnableKeepAlive: Boolean);
    procedure Timer1Timer(Sender: TObject);
  private
    vAmmConnections : Integer;
    vUseSync        : Boolean;
    vDateTimeLastCheck : TDateTime;
    function fStopExecution:Boolean;
  public
    vLckFilesDel : Boolean;
    function GetServiceController: TServiceController; override;
    function TestDcmFileDir(AQuery: TDataset; var AImageDir: string): Boolean;
    function TestDcmFileDirMy(AQuery: TpFIBDataSet; var AImageDir: string): Boolean;
    function TestFile(Query1: TDataset; basedir: string): string;
    function TestFileMy(Query1: TpFIBDataSet; basedir: string): string;
    procedure TmplIns (p_string:string; p_resHTML:TStrings);
    function fStrNorm (pStrIn:string) : string;
    procedure pFrmStructuredReportWebBrowserFrm ( das: TDicomDataset; pFileName:string );
    procedure IncConnections;
    procedure DecConnections;
  end;

const c_pk_log = 'PACS_log'; // папка где будут храниться дополнительные логи
      c_ini_file = 'Settings.ini';
      c_BEGIN_DEBUG = 'BEGIN_DEBUG';
      c_END_DEBUG = 'END_DEBUG';
      c_not_found = 'Страница не найдена. Проверьте настройки WADO сервера.';
      c_tmpl = '@';  // признак tempkate
      c_fltp = 'tmpl'; // расштрение файла с template

var
  WADOServer: TWADOServer;

  v_storage_folder,
  v_template_catalog : AnsiString;
  v_ip_fb : string;
  v_wado_port : Integer;
  v_IS_LOG_WRITE : Boolean;
  v_Log_Block, vImgLock : Boolean;

  v_filepath : AnsiString;
  v_GetLocalHostName,
  v_localIP : string;

  vTryLog : Boolean;

implementation

Uses IniFiles, CmnUnit, KXSocket, DateUtils, StrUtils, uMD5, DCM_Dict, DICOM_CMN,
     Dicom_Charset, jpeg, DB_CMN;

{$R *.DFM}

procedure Lg_ev  ( const p_strs : ansistring;
                   const p_filename : ansistring = '';
                   const p_is_delim : Boolean = False );
var v_dir : AnsiString; vi : Integer;
    vD:TDateTime;
begin
  if v_IS_LOG_WRITE then
  begin
    vD:=Now;
    while (vTryLog and (SecondsBetween(vD,Now)<3)) do Sleep(10);
    vTryLog:=True;
    try
      vi :=0;
      while ( v_Log_Block and (vi<1000) ) do
      begin
        Inc(vi); Sleep(5);
      end;
      v_Log_Block:=True;
      try
        v_dir:=ExtractFilePath(paramstr(0))+'log\';
        if not DirectoryExists(v_dir) then
          CreateDir(v_dir);
        if trim(p_filename)='' then begin
          MnLg_ev(p_strs,v_dir+'wadoevents.log');
        end else begin
          MnLg_ev(p_strs,p_filename);
        end;
      finally
        v_Log_Block:=False;
      end;
    finally
      vTryLog:=False;
    end;
  end;
end;

procedure logs_writes ( pStr:ansistring; pIsExtended:Boolean=False );
var vDirTmp:string;
begin
  vDirTmp := ExtractFilePath(paramstr(0))+'log';
  if not DirectoryExists(vDirTmp) then
    try
      CreateDir(vDirTmp);
    except
      on E:Exception do
        Lg_ev( 'Каталог не создан : ' + vDirTmp + ' ошибка '+E.Message );
    end;
  if not DirectoryExists(vDirTmp) then
  begin
    Lg_ev( 'Каталог не создан : ' + vDirTmp );
  end;
  if v_IS_LOG_WRITE then
    if pIsExtended then
    begin
      Lg_ev( pStr, vDirTmp+'/ExtEvents.log' );
    end else
      Lg_ev( pStr, vDirTmp+'/dcmevents.log' );
end;

procedure log_html_write ( pstrHtml:TStrings; p_comm:string );
var vDirTmp, vFlName:string;
begin
  if v_IS_LOG_WRITE then
  begin
    vDirTmp := ExtractFilePath(paramstr(0))+'log\tmp';
    if not DirectoryExists(vDirTmp) then
      try
        CreateDir(vDirTmp);
      except
        on E:Exception do
          Lg_ev( 'Каталог не создан : ' + vDirTmp + ' ошибка '+E.Message );
      end;
    if not DirectoryExists(vDirTmp) then
    begin
      Lg_ev( 'Каталог не создан : ' + vDirTmp );
    end;
    //
    vFlName:=vDirTmp+'\H'+inttostr(GetTickCount)+'_tmp.html';
    pstrHtml.SaveToFile(vFlName);
    logs_writes('выполнен запрос : '+p_comm+' результат здесь : '+vFlName);
  end;
end;

function TWADOServer.fStopExecution:Boolean;
begin
  if ((vAmmConnections>vWADO_max_connections) and (vWADO_max_connections>0)) then    // 1 - проверка на кол-во соединений
  begin
    Result:=True;
  end else
  if ( (vWADOMinFreeMemory>0) and (gtFreeVirtualMemory<vWADOMinFreeMemory) ) then // 2 - проверка на свободную память
  begin
    Result:=True;
  end else
    Result:=False;
end;

procedure TWADOServer.IncConnections;
var vTime : TDateTime;
begin
  if vAmmConnections>0 then
  begin
    vTime:=Now;
    if (Abs(MinutesBetween(vDateTimeLastCheck,vTime))>30) then
    begin
      vAmmConnections:=0;
      vDateTimeLastCheck:=Now;
    end;
    while (vUseSync or fStopExecution) and (SecondsBetween(vTime,Now)<=vWADOMaxTimeoutThreadWait)
      do Sleep(100);
    vUseSync:=True;
    Inc(vAmmConnections);
    logs_writes('inc vAmmConnections : '+inttostr(vAmmConnections), True);
    vUseSync:=False;
  end;
end;

procedure TWADOServer.DecConnections;
var vTime : TDateTime;
begin
  if vAmmConnections>0 then
  begin
    vTime:=Now;
    while vUseSync and (SecondsBetween(vTime,Now)<=vWADOMaxTimeoutThreadWait)
      do Sleep(100);
    vUseSync:=True;
    if vAmmConnections>0 then
      Dec(vAmmConnections);
    logs_writes('Dec vAmmConnections : '+inttostr(vAmmConnections), True);
    vUseSync:=False;
  end;
end;

function TWADOServer.fStrNorm (pStrIn:string) : string;
var vStr : string;
begin
  vStr := pStrIn;
  vStr := StringReplace(pStrIn,'''','',[rfReplaceAll, rfIgnoreCase]);
  Result := vStr;
end;

procedure SetActToStudy ( p_DB1 : TpFIBDatabase;
                          p_trWrite1 : TpFIBTransaction;
                          p_setstatus : Integer;
                          p_studyuid : string
                        );
var FIBQuery : TpFIBQuery;
    v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
begin
  if v_isPostgres then
  begin
    v_PGconn := DB_CMN.PgConnCrt;
    v_PGTrans := PGTransCreate (v_PGconn) ;
    v_PGTrans.DefaultConnection:=v_PGconn;
    try
      if v_PGconn<>nil then
        if v_PGconn.Connected then
        begin
          v_UniQr := TUniQuery.Create(nil);
          try
            v_UniQr.Connection:=v_PGconn;
            v_UniQr.Transaction:=v_PGTrans;   //
            v_UniQr.SQL.Text := 'update '+v_pg_schema+'.studies set actuality=:p_actuality where studyuid=:p_studyuid';
            v_UniQr.ParamByName('p_ACTUALITY').AsInteger:= p_setstatus;
            v_UniQr.ParamByName('p_STUDYUID').AsString:= p_studyuid;
            try
              v_UniQr.ExecSQL;
            except
            on e:Exception do
              logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
            end;
          finally
            v_UniQr.Close;
            v_UniQr.Free;
          end;
        end else
          logs_writes( 'ERROR : not connected to PostgreSQL');
    finally
      DB_CMN.PgFree(v_PGconn,v_PGTrans);
    end;
  end else begin
    FIBQuery := TpFIBQuery.Create(nil);
    FIBQuery.Database := p_DB1;
    try
      FIBQuery.Transaction := p_trWrite1;
      FIBQuery.SQL.Text := 'update studies set ACTUALITY=:p_ACTUALITY where STUDYUID=:p_STUDYUID';
      FIBQuery.ParamByName('p_ACTUALITY').AsInteger:= p_setstatus;
      FIBQuery.ParamByName('p_STUDYUID').AsString:= p_studyuid;
      try
        FIBQuery.ExecQuery;
      except
      on e:Exception do
        logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
      end;
    finally
      FreeAndNil(FIBQuery);
    end;
  end;
end;

function GtAct ( p_DB1 : TpFIBDatabase;
                  p_trRead1 : TpFIBTransaction;
                  p_studyuid : string
                ):integer;
var FIBQuery : TpFIBQuery;
    v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
begin
  if v_isPostgres then
  begin
    v_PGconn := DB_CMN.PgConnCrt;
    v_PGTrans := PGTransCreate (v_PGconn) ;
    v_PGTrans.DefaultConnection:=v_PGconn;
    try
      if v_PGconn<>nil then
        if v_PGconn.Connected then
        begin
          v_UniQr := TUniQuery.Create(nil);
          try
            v_UniQr.Connection:=v_PGconn;
            v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
            v_UniQr.SQL.Text := 'select actuality from '+v_pg_schema+'.studies where studyuid=:p_studyuid';
            v_UniQr.ParamByName('p_STUDYUID').AsString:= p_studyuid;
            try
              v_UniQr.Open;
              if not v_UniQr.Eof then
              begin
                Result:=v_UniQr.FieldByName('actuality').AsInteger;
              end else
              begin
                Result:=0;
              end;

            except
            on e:Exception do
              logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
            end;
          finally
            v_UniQr.Close;
            v_UniQr.Free;
          end;
        end else
          logs_writes( 'ERROR : not connected to PostgreSQL');
    finally
      DB_CMN.PgFree(v_PGconn,v_PGTrans);
    end;
  end else begin
    FIBQuery := TpFIBQuery.Create(nil);
    FIBQuery.Database := p_DB1;
    try
      FIBQuery.Transaction := p_trRead1;
      FIBQuery.SQL.Text := 'select actuality from studies where STUDYUID=:p_STUDYUID';
      FIBQuery.ParamByName('p_STUDYUID').AsString:= p_studyuid;
      FIBQuery.ExecQuery;
      if not FIBQuery.Eof then
      begin
        Result:=FIBQuery.FieldByName('actuality').AsInteger;
      end else
      begin
        Result:=0;
      end;
    finally
      FreeAndNil(FIBQuery);
    end;
  end;
end;

procedure TWADOServer.TmplIns ( p_string:string; p_resHTML:TStrings );
var v_tmpl_strlst : TStringList; i:Integer;
    v_file_name_tmp, v_templ_tmp, vCurDir : AnsiString;
begin
  if Pos('@gmail.com',p_string)>0 then Exit;
  v_templ_tmp:=Trim(Copy( p_string, Pos(c_tmpl,p_string)+1 ));
  v_file_name_tmp := v_template_catalog+'\'+v_templ_tmp+'.'+c_fltp;
  v_file_name_tmp := StringReplace(v_file_name_tmp,'\\','\',[rfReplaceAll, rfIgnoreCase]);
  // шаблоны берем в каталоге v_template_catalog  расширение файла - c_fltp
  if FileExists(v_file_name_tmp) then
  begin
    v_tmpl_strlst := TStringList.Create;
    try
      logs_writes('#1 discover template '+v_file_name_tmp);
      if not FileExists(v_file_name_tmp) then
      begin
        logs_writes('template_catalog : '+v_template_catalog);
        logs_writes('file not found : '+v_file_name_tmp);
        if not DirectoryExists(v_template_catalog) then
          logs_writes('template_catalog NOT FOUND : '+v_template_catalog);
      end;
      vCurDir:=GetCurrentDir;
      try
        SetCurrentDir(v_template_catalog);
        logs_writes('#2 загрузка template '+v_file_name_tmp);
        v_tmpl_strlst.LoadFromFile(v_file_name_tmp);
      finally
        SetCurrentDir(vCurDir);
      end;
      logs_writes('#3 перед вставкой template ');
      for I := 0 to v_tmpl_strlst.Count - 1 do
      begin
        // проверим наличие шаблонов
        if ( (Pos(c_tmpl,v_tmpl_strlst[i])>0) and
             (Pos('.js',v_file_name_tmp)<=0) and
             (Pos('.css',v_file_name_tmp)<=0)
           )
        then
          TmplIns( v_tmpl_strlst[i], p_resHTML )
        else
          p_resHTML.Append(v_tmpl_strlst[i]);
      end;
      logs_writes('#4 после вставки template ');
    finally
      v_tmpl_strlst.Free;
    end;
  end else
    logs_writes('!!! ERROR : file '+v_file_name_tmp+' not exists');
  logs_writes('#5');  
end;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  WADOServer.Controller(CtrlCode);
end;

function TWADOServer.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TWADOServer.ServiceExecute(Sender: TService);
const c_ini_file = 'Settings.ini';
var Ini : TIniFile;
begin
  vTryLog:=False;
  vDateTimeLastCheck:=Now;
  vAmmConnections:=0;
  vUseSync:=False;
  sleep(10000);  // !!! нужно для дебага, запускаем сервис в службах, потом лезем в проект и делаем attach
  v_Log_Block:=False; vImgLock:=False;
  vLckFilesDel:=False;
  Timer1.Enabled:=False;
 // Timer1.Interval:=Trunc(1000*60*60*24*2); // каждые 2 суток чистим каталог
  Timer1.Enabled:=True;
//  v_GetLocalHostName:=GetLocalHostName;
  DCM_WADO.v_nnn:=0;
  Dicom_Charset.v_TempFileList := TStringList.Create;
  // читаем настройки
  v_filepath := ExtractFilePath(paramstr(0));
  Ini := TIniFile.Create(v_filepath+c_ini_file);
  try
    v_ip_fb := Ini.ReadString( 'MAIN', 'IP_DATABASE', '' );
    v_storage_folder := Ini.ReadString('MAIN', c_1_3_STORAGE_FOLDER, ''); ;
    v_GetLocalHostName := Ini.ReadString( c_5_razdel, c_5_1_host, GetLocalHostName );
    v_wado_port := Ini.ReadInteger(c_5_razdel, c_5_2_port, 0);
    v_IS_LOG_WRITE := (Ini.ReadInteger( c_5_razdel, c_5_3_is_log, 0 )=1);
    v_template_catalog := v_filepath + Ini.ReadString( c_5_razdel, c_5_4_temp_dir, '' );
    if Ini.ReadString( c_5_razdel, c_5_4_temp_dir, '' )='' then
      v_template_catalog := v_filepath + 'WADOtemplates';
    if not DirectoryExists(v_template_catalog) then
      logs_writes( '!!! Нет каталога '+v_template_catalog );
    //
    cmn_db_params_read(Ini);
   // v_isPostgres:=True;
    //
    v_pg_database := vWADO_pg_database;
    v_pg_port     := vWADO_pg_port;
    v_pg_server   := vWADO_pg_server;
    v_pg_user     := vWADO_pg_user;
    v_pg_password := vWADO_pg_password;
    v_pg_Schema   := vWADO_pg_Schema;
    //
  finally
    Ini.Free;
  end;
  //v_filepath := ExtractFilePath(paramstr(0))+'log\';
  logs_writes('Параметры WADO сервера :'+#13+
         'port='+inttostr(v_wado_port)+#13+
         'storage_folder='+v_storage_folder+#13+
         'template_catalog='+v_template_catalog  );
  // Стартуем сервер
  WADOServerCore1.ServerPort:=v_wado_port;
  try
    WADOServerCore1.Start;
    logs_writes('WADO server started : '+'http://' + v_GetLocalHostName + ':' +IntToStr(WADOServerCore1.ServerPort)+'/');
  except
    on e:Exception do
      begin
        logs_writes('error WADOServerCore1.Start error: '+E.ClassName+' with message : '+E.Message);
        Exit;
      end;
  end;
  while not terminated do
    ServiceThread.ProcessRequests(true);
end;

procedure TWADOServer.ServiceShutdown(Sender: TService);
begin
  Timer1.Enabled:=False;
  Sleep(1000*10); // ждем 10 секунд
  Dicom_Charset.v_TempFileList.Free;
  logs_writes('ServiceShutdown');
end;

procedure TWADOServer.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  logs_writes('ServiceStop');
end;

// завершение транзакции
procedure MyEndTrans(const p_FIBTransaction : TpFIBTransaction);
begin
  try
    if p_FIBTransaction.Active then p_FIBTransaction.Commit;
  except
    on E : Exception do
      begin
        logs_writes('Ошибка транзакции : ' + E.Message);
      end;
  end;
end;

// старт транзакции
procedure MyStartTrans(const p_FIBTransaction : TpFIBTransaction);
begin
  try
    if not p_FIBTransaction.Active then p_FIBTransaction.StartTransaction;
  except
    on E : Exception do
      begin
        logs_writes('Ошибка транзакции : ' + E.Message);
      end;
  end;
end;

// закрытие соединения с базой
procedure MyDBDisconnect(const p_FIBDatabase: TpFIBDatabase);
begin
  try
    p_FIBDatabase.Connected := False;
  except
  on e: Exception do
    begin
      logs_writes('Ошибка соединения с БД : ' + E.Message);
    end;
  end;
end;

// открытие соединения с базой
procedure MyDbConnect(const p_FIBDatabase: TpFIBDatabase);
begin
  try
    p_FIBDatabase.Connected := true;
  except
  on e: Exception do
    begin
      logs_writes('Ошибка соединения с БД : ' + E.Message);
    end;
  end;
end;

// commit и start транзакции Read
procedure Cmn_Commit(const p_FIBTransaction : TpFIBTransaction);
begin
  MyEndTrans(p_FIBTransaction);
  MyStartTrans(p_FIBTransaction);
end;

function gt_user_code ( p_DB       : TpFIBDatabase;
                        p_Trans    : TpFIBTransaction;
                        p_username : string;
                        var p_fam : string;
                        var p_nam : string;
                        var p_surn : string;
                        var p_ISQUERIES : Integer;
                        var p_ISCONCL   : Integer
                      ) : Integer;
var v_FIBDataSet : TpFIBDataSet; v_res:Integer;
    v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
begin
  try
    if v_isPostgres then
    begin
      //
      p_username:='SYSDBA';
      v_res:=0;
      p_fam:=Uppercase(p_username);
      p_ISQUERIES:=1;
      p_ISCONCL:=1;
      //
    {  v_PGconn := DB_CMN.PgConnCrt;
      v_PGTrans := PGTransCreate (v_PGconn) ;
      v_PGTrans.DefaultConnection:=v_PGconn;
      try
        if v_PGconn<>nil then
          if v_PGconn.Connected then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
              v_UniQr.SQL.Text := 'select fk_id,fc_fam,fc_im,fc_otch,fn_isqueries,fn_isconcl '+
                 ' from '+v_pg_schema+'.users where upper(fc_login)=upper(:p_fc_login) '+
                 ' and (fn_del=0) and (fn_iswado=1) ';
              v_UniQr.ParamByName('p_FC_LOGIN').AsString:=p_username;
              try
                v_UniQr.Open;
              except
              on e:Exception do
                logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
              end;
              p_fam :='';
              p_nam :='';
              p_surn:='';
              if not v_UniQr.Eof then
              begin
                v_res:=v_UniQr.FieldByName('FK_ID').AsInteger;
                p_fam :=v_UniQr.FieldByName('FC_FAM').AsString;
                p_nam :=v_UniQr.FieldByName('FC_IM').AsString;
                p_surn:=v_UniQr.FieldByName('FC_OTCH').AsString;
                p_ISQUERIES:=v_UniQr.FieldByName('FN_ISQUERIES').AsInteger;
                p_ISCONCL:=v_UniQr.FieldByName('FN_ISCONCL').AsInteger;
              end
              else
              begin
                if Uppercase(p_username)='SYSDBA' then
                begin
                  v_res:=0;
                  p_fam:=Uppercase(p_username);
                  p_ISQUERIES:=1;
                  p_ISCONCL:=1;
                end
                else
                  v_res:=-1;
              end;
            finally
              v_UniQr.Close;
              v_UniQr.Free;
            end;
          end else
            logs_writes( 'ERROR : not connected to PostgreSQL');
      finally
        DB_CMN.PgFree(v_PGconn,v_PGTrans);
      end;   }
    end else begin
      v_FIBDataSet := TpFIBDataSet.Create(nil);
      try
        v_FIBDataSet.Database := p_DB;
        v_FIBDataSet.Transaction := p_Trans;
        v_FIBDataSet.SQLs.SelectSQL.Text := 'select FK_ID,FC_FAM,FC_IM,FC_OTCH,FN_ISQUERIES,FN_ISCONCL '+
                 ' from users where upper(cast(FC_LOGIN as varchar(250) character set WIN1251))=upper(:p_FC_LOGIN) and (fn_del=0) and (FN_ISWADO=1) ';
        v_FIBDataSet.ParamByName('p_FC_LOGIN').AsString:=p_username;
        v_FIBDataSet.Open;
        p_fam :='';
        p_nam :='';
        p_surn:='';
        if not v_FIBDataSet.Eof then
        begin
          v_res:=v_FIBDataSet.FieldByName('FK_ID').AsInteger;
          p_fam :=v_FIBDataSet.FieldByName('FC_FAM').AsString;
          p_nam :=v_FIBDataSet.FieldByName('FC_IM').AsString;
          p_surn:=v_FIBDataSet.FieldByName('FC_OTCH').AsString;
          p_ISQUERIES:=v_FIBDataSet.FieldByName('FN_ISQUERIES').AsInteger;
          p_ISCONCL:=v_FIBDataSet.FieldByName('FN_ISCONCL').AsInteger;
        end
        else
        begin
          if Uppercase(p_username)='SYSDBA' then
          begin
            v_res:=0;
            p_fam:=Uppercase(p_username);
            p_ISQUERIES:=1;
            p_ISCONCL:=1;
          end
          else
            v_res:=-1;
        end;
      finally
        v_FIBDataSet.Close;
        v_FIBDataSet.Free;
      end;
    end;
  except
    v_res:=0;
  end;
  Result:=v_res;
end;

function gt_str_from_crypt (p_str:string):string;
var v_res : string;
    i, v_nmb : Integer;
    strs1 : TStringList;
begin
  if Length(p_str)>1 then
  begin
    v_res:='';
    strs1 := TStringList.Create;
    try
      strBreakApart(p_str, 'f', strs1);
      for I := 0 to strs1.Count - 1 do
      begin
        v_nmb:= 0;
        try
          if Trim(strs1[i])<>'' then
            v_nmb:= StrToInt(strs1[i]);
        except
        end;
        v_res:=v_res+Chr(v_nmb);
      end;
    finally
      strs1.Free;
    end;
  end else
     v_res:=p_str;
  Result:=v_res;
end;

function chkUserPsw ( AParam:TStrings;
                      var p_user:string;
                      var p_password:string
                    ) : Boolean;
begin
  p_user := gt_str_from_crypt(AParam.Values['fld1']);
  if Copy(p_user,Length(p_user),1)=#0 then
    p_user:=Copy(p_user,1,Length(p_user)-1);
  p_password := gt_str_from_crypt(AParam.Values['fld2']);
  if Copy(p_password,Length(p_password),1)=#0 then
    p_password:=Copy(p_password,1,Length(p_password)-1);
  Result := ((Trim(p_user)='') or (Trim(p_password)=''));
end;

function setConnectCMN ( p_user : string;
                         p_password : string;
                         p_ip_fb : string;
                         var p_DB1 : TpFIBDatabase;
                         var p_trRead1 : TpFIBTransaction;
                         var p_is_sysdba : boolean;
                         var p_ResultHtmlDoc: TStrings
                       ) : Boolean;
begin
  if v_isPostgres then
  begin // вставить проверку безопасности postgres
    Result:=True;
  end else
  begin
    p_DB1.DefaultTransaction := p_trRead1;
    p_trRead1.DefaultDatabase := p_DB1;
    p_DB1.DBParams.Add('user_name='+Uppercase(p_user)); // юзер
    p_is_sysdba:=(Uppercase(p_user) = 'SYSDBA');
    if p_is_sysdba then
    begin
      p_DB1.DBParams.Add('password='+p_password);
   //   p_DB1.ConnectParams.RoleName := 'ROLE_USER'; // роль юзеров
    end else
    begin   // шифрованный пароль для др. юзеров
      p_DB1.DBParams.Add('password='+LeftStr(uMD5.MD5DigestToStr(MD5String(p_password)),20)); // шифрованный пароль для др. юзеров
      p_DB1.ConnectParams.RoleName := 'ROLE_USER'; // роль юзеров
    end;
    p_DB1.DBName := p_ip_fb+':PACSBASE';
    try
      p_DB1.Connected := True;
      logs_writes('Connected to database ALIAS='+p_DB1.AliasName+' DBName := '+v_ip_fb+':PACSBASE'+#13+
           'UserName='+p_user+#13+
           'Password='+p_password );
    except
      on e:Exception do
        begin
          if p_ResultHtmlDoc<>nil then
            p_ResultHtmlDoc.Add('-1'); // Access violated !
          logs_writes('user='+p_user+#13+'password='+p_password+#13+'dbname='+p_DB1.DBName+#13+e.Message);
          Result:=False;
          Exit;
        end;
    end;
    logs_writes('Connected to database ');
    p_trRead1.TRParams.Add('isc_tpb_read');
    p_trRead1.TRParams.Add('isc_tpb_nowait');
    p_trRead1.TRParams.Add('isc_tpb_read_committed');
    p_trRead1.TRParams.Add('isc_tpb_rec_version');
    MyStartTrans(p_trRead1);
    Result:=True;
  end;
end;

function gt_charcode (val:string):string;
var v_res_tmp, v_ch:string; i:Integer;
begin
  v_res_tmp:='';
  v_ch:='';
  for I := 0 to Length(val) - 1 do
  begin
    v_ch := IntToStr(Ord(val[i]))+'f';
    v_res_tmp:=v_res_tmp+v_ch;
  end;
  Result := v_res_tmp;
end;

procedure TWADOServer.WADOServerCore1CommandGET(ClientThread: THTTPClientThread;
  HeaderInfo: THeaderInfo; var EnableKeepAlive: Boolean);
var DB1 : TpFIBDatabase;
    trRead1, trWrite1 : TpFIBTransaction;
    ResultHtmlDoc: TStringList;
    strs1{, strs2} : TStringList;
    strx, strx1, v_p0, v_p1, v_p2, v_p3,
    v_fam,v_nam,v_surn: string;
  procedure RetFlStrm( p_filename:string; ResultHtmlDoc: TStringList);
  var filename: string;
  begin
    filename := StringReplace(p_filename,'/','\',[rfReplaceAll, rfIgnoreCase]);
    if copy(filename,1,1)='\' then
      filename := copy(filename,2,Length(filename)-1);

    filename := StringReplace( filename, '&amp;icon=1', '', [rfReplaceAll, rfIgnoreCase] );
//    filename := StringReplace( filename, '&amp;icon=1', '', [rfReplaceAll, rfIgnoreCase] );

    filename := ExtractFilePath(paramstr(0))+filename;
    if FileExists(filename) then
    begin
      //Result := FilenameToContentType(FileName);
      try
        ClientThread.DocStream := TFileStream.Create(filename, fmOpenRead);
      except
        on E : Exception do begin
          logs_writes(E.ClassName+' ошибка с сообщением : '+E.Message);
        end;
      end;
    end
    else
    begin
      ResultHtmlDoc.Add(Format('File %s can not open', [filename]));
      logs_writes(Format('File %s can not open', [filename]));
      exit;
    end;
  end;
  procedure ReturnWorkList(AParam, ResultHtmlDoc: TStrings);
  var contentType,
      v_patientid,
      v_patientname,
      v_accessionnumber,
      v_date1, v_date2,
      sql1,
      v_str_ok, v_str_not,
      v_studyuid,
      v_description,
      v_txtasc  : string;
      FIBDataSet : TpFIBDataSet;
      v_frm_str: ansistring ;
      v_sort, v_i : Integer;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
    const c_amm=100;
    procedure gtMOD (p_par:string);
    begin
      if AParam.Values[p_par]='1' then
      begin
        v_str_ok:=v_str_ok+'(modality='''+p_par+''') or ';
      end else
      begin
        v_str_not:=v_str_not+'(modality<>'''+p_par+''') and ';
      end;
    end;
  begin
    contentType := AParam.Values['contentType'];

    v_patientid := AParam.Values['patientid'];
    v_patientname := Utf8ToAnsi( AParam.Values['patientname'] );
    v_accessionnumber := AParam.Values['accessionnumber'];
    v_date1 := AParam.Values['date1'];
    v_date2 := AParam.Values['date2'];
    v_studyuid    := UpperCase(Utf8ToAnsi( AParam.Values['studyuid']));
    v_description := Utf8ToAnsi( AParam.Values['description']);
    try
      v_sort    := StrToInt(trim(AParam.Values['s']));
    except
      v_sort    := 0;
    end;
    //
    sql1 := 'select coalesce((select sum(1) from ###conclusions c where s.studyuid=c.fk_studyuid),0) as id_concl, s.* '+
            ' from studies s where 1=1 ';
    //
    // upper(cast( as varchar(64) character set win1251))
    if trim(v_patientid)<>'' then
      sql1:=sql1+' and p_pid=:p_p_pid';
    if trim(v_patientname)<>'' then
      sql1:=sql1+' and upper(cast(p_ename_rus as varchar(250) character set win1251)) like upper(:p_p_ename)';
    if trim(v_accessionnumber)<>'' then
      sql1:=sql1+' and accessionnumber=:p_accessionnumber';
    if trim(v_date1)<>'' then
      sql1:=sql1+' and ldate>=:p_ldate1';
    if trim(v_date2)<>'' then
      sql1:=sql1+' and ldate<:p_ldate2';
    if trim(v_studyuid)<>'' then
      sql1:=sql1+' and studyuid=:p_studyuid';
    if trim(v_description)<>'' then
      sql1:=sql1+' and  upper(cast(studydescription as varchar(250) character set win1251)) like upper(:p_description)';
    //
    v_str_ok  :='';
    v_str_not :='';
    // modality
    gtmod('cr');
    gtmod('dx');
    gtmod('io');
    gtmod('mr');
    gtmod('ot');
    gtmod('rf');
    gtmod('sc');
    gtmod('xa');
    gtmod('ct');
    gtmod('es');
    gtmod('mg');
    gtmod('nm');
    gtmod('px');
    gtmod('rg');
    gtmod('us');
    gtmod('xc');
  //  gtmod('sr');
  //  gtmod('ecg');
    v_str_ok:=copy(v_str_ok,1,length(v_str_ok)-3);
    v_str_not:=copy(v_str_not,1,length(v_str_not)-4);
    if trim(v_str_not)='' then v_str_not:='1=1';
    if trim(v_str_ok)='' then v_str_ok:='1=1';
    sql1:=sql1+' and (('+v_str_ok+') and ('+v_str_not+'))';
    //   
    if (v_sort<0) then v_txtasc:='desc' else v_txtasc:='';
    if v_sort=0 then  // по умолчанию
    begin
      sql1:=sql1+' order by s.ldate desc';
    end else if abs(v_sort)=1 then  // &nbsp
    begin
      sql1:=sql1+' order by s.ldate desc';
    end else if abs(v_sort)=2 then  // карта
    begin
      sql1:=sql1+' order by s.p_pid '+v_txtasc+',s.ldate desc';
    end else if abs(v_sort)=3 then  // пациент
    begin
      sql1:=sql1+' order by s.p_ename_rus '+v_txtasc+',s.ldate desc';
    end else if abs(v_sort)=4 then  // дата рождения
    begin
      sql1:=sql1+' order by s.p_dateborn '+v_txtasc+',s.ldate desc';
    end else if abs(v_sort)=5 then  // №
    begin
      sql1:=sql1+' order by s.accessionnumber '+v_txtasc+',s.ldate desc';
    end else if abs(v_sort)=6 then  // тип
    begin
      sql1:=sql1+' order by s.studies_image_type '+v_txtasc+',s.ldate desc';
    end else if abs(v_sort)=7 then  // описание
    begin
      sql1:=sql1+' order by s.studydescription '+v_txtasc+',s.ldate desc';
    end else if abs(v_sort)=8 then  // дата
    begin
      sql1:=sql1+' order by s.ldate '+v_txtasc;
    end;
    //
    if v_isPostgres then
    begin
      v_PGconn := DB_CMN.PgConnCrt;
      v_PGTrans := PGTransCreate (v_PGconn) ;
      v_PGTrans.DefaultConnection:=v_PGconn;
      try
        if v_PGconn<>nil then
          if v_PGconn.Connected then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
              v_UniQr.SQL.Text := StringReplace(sql1,'###',v_pg_schema+'.',[rfReplaceAll, rfIgnoreCase]);
              if Trim(v_patientid)<>'' then
                v_UniQr.ParamByName('p_P_PID').AsString:=v_patientid;
              if Trim(v_patientname)<>'' then
                v_UniQr.ParamByName('p_P_ENAME').AsString:='%'+v_patientname+'%';
              if Trim(v_accessionnumber)<>'' then
                v_UniQr.ParamByName('p_ACCESSIONNUMBER').AsString:=v_accessionnumber;
              if Trim(v_date1)<>'' then
                v_UniQr.ParamByName('p_LDATE1').AsDateTime:=DateOf(StrToDateDef(v_date1,EncodeDate(1900,1,1)));
              if Trim(v_date2)<>'' then
                v_UniQr.ParamByName('p_LDATE2').AsDateTime:=IncDay(DateOf(StrToDateDef(v_date2,EncodeDate(2100,1,1))),1);
              if Trim(v_studyuid)<>'' then
                v_UniQr.ParamByName('p_studyuid').AsString:=v_studyuid;
              if Trim(v_description)<>'' then
                v_UniQr.ParamByName('p_description').AsString:='%'+v_description+'%';
              try
                v_UniQr.Open; 
              except
              on e:Exception do
                logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
              end;
              v_frm_str := '';
              v_i:=0;
              while not v_UniQr.Eof do
              begin        // формируем строку с массивом а-ля JSON  ansitoutf8
                Inc(v_i);
                v_frm_str:= v_frm_str +
                   IntToStr( v_UniQr.FieldByName('id_concl').AsInteger )+'<;>'+
                   v_UniQr.FieldByName('P_PID').AsString+'<;>'+                    // Patient ID
                   fStrNorm( StringReplace(v_UniQr.FieldByName('P_ENAME_RUS').AsString,'^',' ',[rfReplaceAll, rfIgnoreCase]) )+'<;>'+                  // Name
                   DateToStr(v_UniQr.FieldByName('P_DATEBORN').AsDateTime)+'<;>'+  // DateBorn
                   v_UniQr.FieldByName('ACCESSIONNUMBER').AsString+'<;>'+      // AccessionNumber
                   v_UniQr.FieldByName('STUDIES_IMAGE_TYPE').AsString+'<;>'+   // Mod
                   DateToStr(v_UniQr.FieldByName('LDATE').AsDateTime)+'<;>'+   // StudyDate
                   v_UniQr.FieldByName('STUDYUID').AsString+'<;>'+             // STUDYUID
                   v_UniQr.FieldByName('STUDYDESCRIPTION').AsString+'<;>'+     // Description
                   IntToStr( v_UniQr.FieldByName('ACTUALITY').AsInteger )+'<;>'+     // ACTUALITY
                   '<|>';
                v_UniQr.Next;
                if (v_i>c_amm) then Break;
              end;
              v_frm_str:=Copy(v_frm_str,1,Length(v_frm_str)-3);
              v_UniQr.Close;
              // а-ля JSON к отправке
              ResultHtmlDoc.Add(AnsiToUtf8(v_frm_str));
            finally
              v_UniQr.Close;
              v_UniQr.Free;
            end;
          end else
            logs_writes( 'ERROR : not connected to PostgreSQL');
      finally
        DB_CMN.PgFree(v_PGconn,v_PGTrans);
      end;
    end else begin
      FIBDataSet := TpFIBDataSet.Create(nil);
      FIBDataSet.Database := DB1;
      try
        FIBDataSet.Transaction := trRead1;
        FIBDataSet.SQLs.SelectSQL.Text := StringReplace(sql1,'###','',[rfReplaceAll, rfIgnoreCase]);
        if Trim(v_patientid)<>'' then
          FIBDataSet.ParamByName('p_P_PID').AsString:=v_patientid;
        if Trim(v_patientname)<>'' then
          FIBDataSet.ParamByName('p_P_ENAME').AsString:='%'+v_patientname+'%';
        if Trim(v_accessionnumber)<>'' then
          FIBDataSet.ParamByName('p_ACCESSIONNUMBER').AsString:=v_accessionnumber;
        if Trim(v_date1)<>'' then
          FIBDataSet.ParamByName('p_LDATE1').AsDateTime:=DateOf(StrToDateDef(v_date1,EncodeDate(1900,1,1)));
        if Trim(v_date2)<>'' then
          FIBDataSet.ParamByName('p_LDATE2').AsDateTime:=IncDay(DateOf(StrToDateDef(v_date2,EncodeDate(2100,1,1))),1);
        if Trim(v_studyuid)<>'' then
          FIBDataSet.ParamByName('p_studyuid').AsString:=v_studyuid;
        if Trim(v_description)<>'' then
          FIBDataSet.ParamByName('p_description').AsString:='%'+v_description+'%';
        //
        FIBDataSet.Open;
        v_frm_str := '';
        v_i:=0;
        while not FIBDataSet.Eof do
        begin        // формируем строку с массивом а-ля JSON  ansitoutf8
          Inc(v_i);
          v_frm_str:= v_frm_str +
             IntToStr( FIBDataSet.FieldByName('id_concl').AsInteger )+'<;>'+
             FIBDataSet.FieldByName('P_PID').AsString+'<;>'+                    // Patient ID
             fStrNorm( StringReplace(FIBDataSet.FieldByName('P_ENAME_RUS').AsString,'^',' ',[rfReplaceAll, rfIgnoreCase]) )+'<;>'+                  // Name
             DateToStr(FIBDataSet.FieldByName('P_DATEBORN').AsDateTime)+'<;>'+  // DateBorn
             FIBDataSet.FieldByName('ACCESSIONNUMBER').AsString+'<;>'+      // AccessionNumber
             FIBDataSet.FieldByName('STUDIES_IMAGE_TYPE').AsString+'<;>'+   // Mod
             DateToStr(FIBDataSet.FieldByName('LDATE').AsDateTime)+'<;>'+   // StudyDate
             FIBDataSet.FieldByName('STUDYUID').AsString+'<;>'+             // STUDYUID
             FIBDataSet.FieldByName('STUDYDESCRIPTION').AsString+'<;>'+     // Description
             IntToStr( FIBDataSet.FieldByName('ACTUALITY').AsInteger )+'<;>'+     // ACTUALITY
             '<|>';
          FIBDataSet.Next;
          if (v_i>c_amm) then Break;
        end;
        v_frm_str:=Copy(v_frm_str,1,Length(v_frm_str)-3);
        FIBDataSet.Close;
        // а-ля JSON к отправке
        ResultHtmlDoc.Add(AnsiToUtf8(v_frm_str));
      finally
        FreeAndNil(FIBDataSet);
      end;
    end;
  end;
  procedure ReturnIMGLIST(AParam, ResultHtmlDoc: TStrings);
  var contentType,
      v_patientid,
      v_patientname,
      v_accessionnumber,
      v_date1, v_date2,
      sql1,
      v_str_ok, v_str_not,
      v_studyuid,
      v_description, v_chain,
      v_is_zakl, v_txtasc  : string;
      FIBDataSet : TpFIBDataSet;
      v_frm_str: ansistring ;
      v_sort, v_i : Integer;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr : TUniQuery;
    const c_amm=100;
    procedure gtMOD (p_par:string);
    begin
      if AParam.Values[p_par]='1' then
      begin
        v_str_ok:=v_str_ok+'(studies_image_type='''+p_par+''') or ';
      end else
      begin
        v_str_not:=v_str_not+'(studies_image_type<>'''+p_par+''') and ';
      end;
    end;
  begin
    contentType := AParam.Values['contentType'];
    v_accessionnumber := AParam.Values['accessionnumber'];
    //
    sql1 := 'SELECT distinct i.instanceuid '+
       ' from ###studies s, ###images i '+
       ' where s.studyuid=i.studyuid and s.accessionnumber=:p_accessionnumber '+
       ' order by i.instanceuid ';
    //
    if v_isPostgres then
    begin

      v_PGconn := DB_CMN.PgConnCrt;
      if v_PGconn=nil then
      begin
        logs_writes('error connect to database = '+v_pg_database+
            ' Port = '+inttostr(v_pg_port)+
            ' Server = '+v_pg_server+
            ' Schema = '+v_pg_Schema+
            ' Username := '+v_pg_user+
            ' Password := '+v_pg_password);
      end;
      v_PGTrans := PGTransCreate (v_PGconn) ;
      v_PGTrans.DefaultConnection:=v_PGconn;
      try
        if v_PGconn<>nil then
          if v_PGconn.Connected then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
              v_UniQr.SQL.Text := StringReplace(sql1,'###',v_pg_schema+'.',[rfReplaceAll, rfIgnoreCase]);
              v_UniQr.ParamByName('p_ACCESSIONNUMBER').AsString:=v_accessionnumber;
              //
              logs_writes('запрос списка снимков');
              try
                v_UniQr.Open;
              except
              on e:Exception do
                logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
              end;
              v_frm_str := '';
              v_i:=0;
              if v_UniQr.Eof then logs_writes('СПИСОК снимков ПУСТ');
              while not v_UniQr.Eof do
              begin        // формируем строку с массивом а-ля JSON  ansitoutf8
                Inc(v_i);
                v_frm_str:= v_frm_str + v_UniQr.FieldByName('instanceuid').AsString+'<|>';
                v_UniQr.Next;
                if (v_i>c_amm) then Break;
              end;
              v_frm_str:=Copy(v_frm_str,1,Length(v_frm_str)-3);
              v_UniQr.Close;
              // а-ля JSON к отправке
              ResultHtmlDoc.Add(AnsiToUtf8(v_frm_str));
              log_html_write(ResultHtmlDoc,'studylist jquery result');
            finally
              v_UniQr.Close;
              v_UniQr.Free;
            end;
          end else
            logs_writes( 'ERROR : not connected to PostgreSQL');
      finally
        log_html_write(ResultHtmlDoc,'studylist json ');
        DB_CMN.PgFree(v_PGconn,v_PGTrans);
      end;
    end;
  end;
  procedure ReturnDICOMINFO(AParam, ResultHtmlDoc: TStrings);
  var contentType,
      v_patientid,
      v_patientname,
      v_accessionnumber,
      v_date1, v_date2, sql1,
      v_str_ok, v_str_not,
      v_studyuid, v_objectuid,
      v_description, v_chain,
      v_is_zakl, v_txtasc, v_MN_Group  : string;
      FIBDataSet : TpFIBDataSet;
      v_frm_str: ansistring ;
      v_sort, v_i : Integer;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction;
      v_UniQr : TUniQuery;
      das1: TDicomDataset;
      i:Integer;
    const c_amm=100;
    procedure gtMOD (p_par:string);
    begin
      if AParam.Values[p_par]='1' then
      begin
        v_str_ok:=v_str_ok+'(studies_image_type='''+p_par+''') or ';
      end else
      begin
        v_str_not:=v_str_not+'(studies_image_type<>'''+p_par+''') and ';
      end;
    end;
    procedure attr_tree_crt ( p_DicomAttributes : TDicomAttributes;
                              p_parent : string = ''
                            );
    var i, v_Index :Integer;
//        v_cxTreeListNode : string;
        v_Group, v_Element : string;
      function add_nl ( p_str:string; p_amm:Integer ):string;
      var s:string; i:Integer;
      begin
        s:=p_str;
        for I := 1 to p_amm do s:='0'+s;
        Result:=s;
      end;
      procedure line_add(vMN:string);
      begin
      //  if p_parent<>'' then
      //    v_frm_str:=v_frm_str+'<parent>'+p_parent+'</parent>';
//        v_frm_str:=v_frm_str+'<tags>'+vMN+'</tags>';
        if vMN<>'' then        
          v_frm_str:=v_frm_str+vMN;
        v_frm_str:=v_frm_str+'<typeelement>'+p_DicomAttributes.ItemByIndex[i].FDict.getVR+'</typeelement>';
        v_frm_str:=v_frm_str+'<description>'+p_DicomAttributes.ItemByIndex[i].FDict.Description+'</description>';
        v_frm_str:=v_frm_str+'<value>'+p_DicomAttributes.ItemByIndex[i].GetAsStrings+'</value>';
      {  if p_DicomAttributes.ItemByIndex[i].GetString($08, $05)<>'' then
          v_frm_str:=v_frm_str+'<charset>'+
          p_DicomAttributes.ItemByIndex[i].GetString($08, $05)
          //Copy(gt_charset_value(p_DicomAttributes, p_DicomAttributes.ItemByIndex[i].AsString[0]), 1, 100)
          +'</charset>'; }
      end;
    begin
      if not assigned(p_DicomAttributes) then
        exit;
      p_DicomAttributes.Sort;
      for I := 0 to p_DicomAttributes.Count - 1 do // Iterate
      begin
        v_Group   := IntToStr(p_DicomAttributes.ItemByIndex[i].FDict.getGroup);
        v_Element := IntToStr(p_DicomAttributes.ItemByIndex[i].FDict.getElement);
        v_MN_Group := '<Group>'+add_nl(v_Group,4-length(v_Group))+'</Group><Element>'+
                                add_nl(v_Element,4-length(v_Element))+'</Element>';
        v_frm_str:=v_frm_str+'<record>';
        try
          line_add(v_MN_Group);
          if p_DicomAttributes.ItemByIndex[i].DataType = ddtAttributes then
            attr_tree_crt( p_DicomAttributes.ItemByIndex[i].Attributes[0], v_MN_Group );
        finally
          v_frm_str:=v_frm_str+'</record>';
        end;
      end;
    end;
  begin
    contentType := AParam.Values['contentType'];
    v_accessionnumber := AParam.Values['accessionnumber'];
    v_objectuid := AParam.Values['objectuid'];
    //
    sql1 := 'SELECT distinct i.studyuid, i.instanceuid as objectuid, s.studies_image_type as modality, i.seriesuid '+
       ' from ###studies s, ###images i '+
       ' where s.studyuid=i.studyuid and s.accessionnumber=:p_accessionnumber and instanceuid=:p_objectuid '+
       ' order by i.seriesuid,i.instanceuid ';
    //
    if v_isPostgres then
    begin

      v_PGconn := DB_CMN.PgConnCrt;
      if v_PGconn=nil then
      begin
        logs_writes('error connect to database = '+v_pg_database+
            ' Port = '+inttostr(v_pg_port)+
            ' Server = '+v_pg_server+
            ' Schema = '+v_pg_Schema+
            ' Username := '+v_pg_user+
            ' Password := '+v_pg_password);
      end;
      v_PGTrans := PGTransCreate (v_PGconn) ;
      v_PGTrans.DefaultConnection:=v_PGconn;
      try
        if v_PGconn<>nil then
          if v_PGconn.Connected then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
              v_UniQr.SQL.Text := StringReplace(sql1,'###',v_pg_schema+'.',[rfReplaceAll, rfIgnoreCase]);
              v_UniQr.ParamByName('p_ACCESSIONNUMBER').AsString:=v_accessionnumber;
              v_UniQr.ParamByName('p_objectuid').AsString:=v_objectuid;
              //
              logs_writes('запрос списка снимков');
              try
                v_UniQr.Open;
              except
              on e:Exception do
                logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
              end;
              v_frm_str := '';
              v_i:=0;
              if v_UniQr.Eof then
              begin
                logs_writes('СПИСОК снимков ПУСТ');
                v_frm_str:='<eof>';
              end else
              begin        // формируем строку с массивом а-ля JSON  ansitoutf8

                das1 := WADOServerCore1.DoFindImage( v_UniQr.FieldByName('studyuid').AsString,
                                     v_UniQr.FieldByName('seriesuid').AsString,
                                     v_UniQr.FieldByName('objectuid').AsString);
                if das1 <> nil then
                begin
                  attr_tree_crt( das1.InfoAttributes );
                  // FAttributes
                  attr_tree_crt( das1.Attributes );
                end;
              end;
              v_UniQr.Close;
              // а-ля JSON к отправке
              ResultHtmlDoc.Add(AnsiToUtf8(v_frm_str));
              log_html_write(ResultHtmlDoc,'studylist jquery result');
            finally
              v_UniQr.Close;
              v_UniQr.Free;
            end;
          end else
            logs_writes( 'ERROR : not connected to PostgreSQL');
      finally
        log_html_write(ResultHtmlDoc,'studylist json ');
        DB_CMN.PgFree(v_PGconn,v_PGTrans);
      end;
    end;
  end;
  procedure ReturnEXTIMGLIST(AParam, ResultHtmlDoc: TStrings);
  var contentType,
      v_patientid,
      v_patientname,
      v_accessionnumber,
      v_date1, v_date2,
      sql1,
      v_str_ok, v_str_not,
      v_studyuid,
      v_description, v_chain,
      v_is_zakl, v_txtasc  : string;
      FIBDataSet : TpFIBDataSet;
      v_frm_str: ansistring ;
      v_sort, v_i : Integer;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr : TUniQuery;
    const c_amm=100;
    procedure gtMOD (p_par:string);
    begin
      if AParam.Values[p_par]='1' then
      begin
        v_str_ok:=v_str_ok+'(studies_image_type='''+p_par+''') or ';
      end else
      begin
        v_str_not:=v_str_not+'(studies_image_type<>'''+p_par+''') and ';
      end;
    end;
  var das1 : TDicomDataset;  v_PixelSpacingX, v_PixelSpacingY ,
      vRescaleSlope : Extended;
      vFileNameTmps, vTitleDoc, vModTmp, vDicomFileName, basedir,
      vstudyUIDTmp, vseriesUIDTmp, vobjectuidTmp, vFnamejpeg    : String;
      vFrameCount, vImgWidth, vImgHeight, vADicomImage_height, vADicomImage_Width,
      vADicomImage_WindowWidth, vADicomImage_WindowCenter, vITmp,
      v_koeff_horiz, v_koeff_vert : Integer;
      daPDF, daDATA : TDicomAttribute;
      CnsDMTable1 : TCnsDMTable;
      img1 : TImage;
      v_ecg_acts : array of t_ecg_actions;
      JpegImg : TJpegImage;
  begin
    contentType := AParam.Values['contentType'];
    v_accessionnumber := AParam.Values['accessionnumber'];
    //
    basedir:='';
    sql1 := 'SELECT distinct i.studyuid, i.seriesuid, i.instanceuid as objectuid, '+
       ' s.studies_image_type as modality, i.INSTANCEUID, i.IMGNO, '+
       ' s.studies_image_type as IMAGETYPE, s.ldate as STUDIESDATE, s.ldate as IMAGEDATE '+
       ' from ###studies s, ###images i '+
       ' where s.studyuid=i.studyuid and s.accessionnumber=:p_accessionnumber '+
       ' order by i.seriesuid,i.instanceuid ';
    //
    if v_isPostgres then
    begin   
      v_PGconn := DB_CMN.PgConnCrt;
      if v_PGconn=nil then
      begin
        logs_writes('error connect to database = '+v_pg_database+
            ' Port = '+inttostr(v_pg_port)+
            ' Server = '+v_pg_server+
            ' Schema = '+v_pg_Schema+
            ' Username := '+v_pg_user+
            ' Password := '+v_pg_password);
      end;
      v_PGTrans := PGTransCreate (v_PGconn) ;
      v_PGTrans.DefaultConnection:=v_PGconn;
      try
        if v_PGconn<>nil then
          if v_PGconn.Connected then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
              v_UniQr.SQL.Text := StringReplace(sql1,'###',v_pg_schema+'.',[rfReplaceAll, rfIgnoreCase]);
              v_UniQr.ParamByName('p_ACCESSIONNUMBER').AsString:=v_accessionnumber;
              //
              logs_writes('запрос списка снимков');
              try
                v_UniQr.Open;
              except
              on e:Exception do
                logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
              end;
              v_frm_str := '';
              v_i:=0;
              if v_UniQr.Eof then
              begin
                logs_writes('СПИСОК снимков ПУСТ');
                v_frm_str:='<eof>';
              end;
              vITmp:=0;
              while not v_UniQr.Eof do
              begin        // формируем строку с массивом а-ля JSON  ansitoutf8
                Inc(v_i); Inc(vITmp);
                vstudyUIDTmp  := v_UniQr.FieldByName('studyUID').AsString;
                vseriesUIDTmp := v_UniQr.FieldByName('seriesUID').AsString;
                vobjectuidTmp := v_UniQr.FieldByName('objectuid').AsString;
                vModTmp := v_UniQr.FieldByName('modality').AsString;
                das1 := WADOServerCore1.DoFindImage( vstudyUIDTmp,
                                     vseriesUIDTmp,
                                     vobjectuidTmp);
                try
                  if das1.Attributes.ImageData=nil then
                  begin
                    vFrameCount:=0;
                    v_PixelSpacingX := 0.040234375 ;
                    v_PixelSpacingY := v_PixelSpacingX ;
                    vImgWidth:=512;
                    vImgHeight:=512;
                    vRescaleSlope:=0.04;
                    // размеры изображения
                    vADicomImage_height:=512;
                    vADicomImage_Width:=512;
                    vADicomImage_WindowWidth:=512;
                    vADicomImage_WindowCenter:=989;
                  end else
                  begin
                    if das1.Attributes.ImageData.FrameCount>10 then
                      vFrameCount := das1.Attributes.ImageData.FrameCount-1
                    else
                      vFrameCount := das1.Attributes.ImageData.FrameCount;
                    v_PixelSpacingX := das1.Attributes.ImageData.PixelSpacingX ;
                    v_PixelSpacingY := das1.Attributes.ImageData.PixelSpacingY ;
                    vImgWidth:=das1.Attributes.ImageData.Width;
                    vImgHeight:=das1.Attributes.ImageData.Height;
                    vRescaleSlope := das1.Attributes.ImageData.RescaleSlope;
                    // размеры изображения
                    vADicomImage_height:=das1.Attributes.ImageData.height;
                    vADicomImage_Width:=das1.Attributes.ImageData.Width;
                    vADicomImage_WindowWidth:=das1.Attributes.ImageData.WindowWidth;
                    vADicomImage_WindowCenter:=das1.Attributes.ImageData.WindowCenter;
                  end;
                  vFileNameTmps:=''; vTitleDoc := '';
                  if ( (vModTmp='OT') or
                       (vModTmp='ECG') or
                       (vModTmp='SR')
                     ) then
                  begin
                    if (das1 <> nil) then begin
                      if ((vModTmp='OT') and
                           Assigned(das1.Attributes.item[ $42, $12 ]) )
                      then
                      begin
                        logs_writes( 'Найдено исследование модальности ''OT'' тип документа ' +
                                      das1.Attributes.GetString( $42, $12 )
                                   );
                        if Assigned(das1.Attributes.item[ $42, $10 ]) then  // Document Title
                          vTitleDoc := das1.Attributes.GetString( $42, $10 );
                        if  ((das1.Attributes.GetString( $42, $12 )='application/pdf') and
                             Assigned(das1.Attributes.item[ $42, $11 ]) )
                        then
                        begin
                          vFileNameTmps := 'temp/'+
                                 IntToStr(YearOf(Date))+
                                 IntToStr(MonthOf(Date))+
                                 IntToStr(DayOf(Date))+
                                 IntToStr(HourOf(Now))+
                                 IntToStr(MinuteOf(Now))+
                                 IntToStr(GetTickCount)+
                                 '.pdf';
                          daPDF := das1.Attributes.Item[ $42,$11 ];
                          daPDF.SaveToFile( ExtractFilePath(paramstr(0))+vFileNameTmps );
                        end;
                      end else if vModTmp='ECG' then
                      begin
                        if assigned(das1.Attributes.Item[ $5400,$100 ]) then
                        begin
                          v_koeff_horiz := 25;
                          v_koeff_vert  := 10;
                          SetLength(v_ecg_acts,0);

                          CnsDMTable1 := TCnsDMTable.Create(nil);
                          img1        := TImage.Create(nil);
                          v_font_ECG:= TFont.Create;     // Шрифт
                          try
                            if TestDcmFileDir(v_UniQr, basedir) then
                            begin
                                vDicomFileName := TestFile(v_UniQr, basedir);
                                if (vDicomFileName <> '') then
                                  CnsDMTable1.LoadFromFile(vDicomFileName);
                            end;
                            // отрисовка ЭКГ
                            pIniEcgDrawParameters;
                            pECGdraw ( CnsDMTable1,            // массив DICOM с данными исследования
                                       img1,                   // Bitmap для отрисовки ECG
                                       v_ecg_acts,             // array of t_ecg_actions
                                       v_koeff_horiz,          // масштаб горизонтально мм/с
                                       v_koeff_vert,           // масштаб вертикально мм/мВ
                                       False,                  // filter Savitsky
                                       False,                  // Показать точки Q,R,S
                                       False );                // не на форме просмотровщика - убираем те отрисовки на канве
                            // сохраним в файл
                            vFnamejpeg := 'temp/'+ IntToStr(YearOf(Date))+
                                                   IntToStr(MonthOf(Date))+
                                                   IntToStr(DayOf(Date))+
                                                   IntToStr(HourOf(Now))+
                                                   IntToStr(MinuteOf(Now))+
                                                   IntToStr(GetTickCount)+ '.jpg';
                            JpegImg := TJpegImage.Create;
                            try
                              JpegImg.Assign(img1.Picture.Bitmap) ;
                              JpegImg.SaveToFile( ExtractFilePath(paramstr(0))+vFnamejpeg ) ;
                            finally
                              JpegImg.Free;
                            end;
                            vFileNameTmps := vFnamejpeg;
                          finally
                            v_font_ECG.Free;
                            CnsDMTable1.Free;
                            img1.Free;
                          end;


                        end;
                      end else if vModTmp='SR' then
                      begin
                        if ( Assigned( das1.Attributes.Item[ $8, $1199 ] ) or
                             Assigned( das1.Attributes.Item[ $40, $A073 ] ) or
                             Assigned( das1.Attributes.Item[ $40,$A043 ]) or
                             Assigned( das1.Attributes.Item[ $40,$A730 ])  )
                        then begin
                          vFileNameTmps := 'temp/'+
                                           IntToStr(YearOf(Date))+
                                           IntToStr(MonthOf(Date))+
                                           IntToStr(DayOf(Date))+
                                           IntToStr(HourOf(Now))+
                                           IntToStr(MinuteOf(Now))+
                                           IntToStr(GetTickCount)+
                                           '.html';
                          pFrmStructuredReportWebBrowserFrm ( das1, ExtractFilePath(paramstr(0))+vFileNameTmps );
                        end;
                      end;
                    end;
                  end;
                finally
                  try
                    das1.Free;
                  except
                  end;
                end;
                // если файла нет то по эти модальностям
                // выводим только первый фрагмент
                if ( (vITmp<=1) or
                     ( (vModTmp<>'OT') and
                       (vModTmp<>'ECG') and
                       (vModTmp<>'SR')
                     ) or FileExists(ExtractFilePath(paramstr(0))+vFileNameTmps)
                   )
                then
                  v_frm_str:= v_frm_str + vstudyUIDTmp+'^'+
                                          vseriesUIDTmp+'^'+
                                          vobjectuidTmp+'^'+
                                          vModTmp+'^'+
                                          IntToStr(vFrameCount)+'^'+
                                          StringReplace( FloatToStr(v_PixelSpacingX),
                                            ',','.',[rfReplaceAll, rfIgnoreCase])+'^'+
                                          StringReplace( FloatToStr(v_PixelSpacingY),
                                            ',','.',[rfReplaceAll, rfIgnoreCase])+'^'+
                                          IntToStr(vImgWidth)+'^'+
                                          IntToStr(vImgHeight)+'^'+
                                          StringReplace( FloatToStr(vRescaleSlope),
                                            ',','.',[rfReplaceAll, rfIgnoreCase])+'^'+
                                          // размеры изображения
                                          IntToStr(vADicomImage_height)+'^'+
                                          IntToStr(vADicomImage_Width)+'^'+
                                          IntToStr(vADicomImage_WindowWidth)+'^'+
                                          IntToStr(vADicomImage_WindowCenter)+'^'+
                                          vFileNameTmps+'^'+
                                          vTitleDoc+
                                          '|';
                v_UniQr.Next;
                if (v_i>c_amm) then Break;
              end;
              v_frm_str:=Copy(v_frm_str,1,Length(v_frm_str)-1);
              v_UniQr.Close;
              // а-ля JSON к отправке
              ResultHtmlDoc.Add(AnsiToUtf8(v_frm_str));
              log_html_write(ResultHtmlDoc,'studylist jquery result');
            finally
              v_UniQr.Close;
              v_UniQr.Free;
            end;
          end else
            logs_writes( 'ERROR : not connected to PostgreSQL');
      finally
        log_html_write(ResultHtmlDoc,'studylist json ');
        DB_CMN.PgFree(v_PGconn,v_PGTrans);
      end;
    end;
  end;
  procedure ReturnStudies(AParam, ResultHtmlDoc: TStrings);
  var contentType,
      v_patientid,
      v_patientname,
      v_accessionnumber,
      v_date1, v_date2,
      sql1,
      v_str_ok, v_str_not,
      v_studyuid,
      v_description, v_chain,
      v_is_zakl, v_txtasc  : string;
      FIBDataSet : TpFIBDataSet;
      v_frm_str: ansistring ;
      v_sort, v_i : Integer;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr : TUniQuery;
    const c_amm=100;
    procedure gtMOD (p_par:string);
    begin
      if AParam.Values[p_par]='1' then
      begin
        v_str_ok:=v_str_ok+'(studies_image_type='''+p_par+''') or ';
      end else
      begin
        v_str_not:=v_str_not+'(studies_image_type<>'''+p_par+''') and ';
      end;
    end;
  begin

    logs_writes('#1 resstudylist');

    contentType := AParam.Values['contentType'];

    v_chain:= Trim(AParam.Values['chain']);
    v_patientid := AParam.Values['patientid'];
    v_patientname := Utf8ToAnsi( AParam.Values['patientname'] );
    v_accessionnumber := AParam.Values['accessionnumber'];
    v_date1 := AParam.Values['date1'];
    v_date2 := AParam.Values['date2'];
    v_studyuid    := UpperCase(Utf8ToAnsi( AParam.Values['studyuid']));
    v_description := Utf8ToAnsi( AParam.Values['description']);
    v_is_zakl := AParam.Values['zakl'];
    try
      v_sort    := StrToInt(trim(AParam.Values['s']));
    except
      v_sort    := 0;
    end;

    logs_writes('#2 resstudylist');

    //
    sql1 := 'select coalesce((select sum(1) from ###conclusions c where s.studyuid=c.fk_studyuid),0) as id_concl, s.* '+
            ' from studies s where 1=1 ';
    //
    if (v_chain='1') then begin           // очередь
      sql1:=sql1+' and ((actuality>0) and (actuality<4)) ';
    end else if (v_chain='2') then begin  // плановые
      sql1:=sql1+' and actuality=1 ';
    end else if (v_chain='3') then begin  // срочные
      sql1:=sql1+' and actuality=2 ';
    end else if (v_chain='4') then begin  // экстренные
      sql1:=sql1+' and actuality=3 ';
    end else if (v_chain='5') then begin  // завершенные
      sql1:=sql1+' and actuality=4 ';
    end else if (v_chain='6') then begin  // установленные
      sql1:=sql1+' and (actuality>0) ';
    end else if (v_chain='7') then begin  // не установленные
      sql1:=sql1+' and (coalesce(actuality,0)=0) ';
    end;
    //
    if (v_is_zakl='2') then
    begin
      sql1:=sql1+' and exists(select 1 from ###conclusions c1 where s.studyuid=c1.fk_studyuid) ';
    end else
    if (v_is_zakl='3') then
    begin
      sql1:=sql1+' and not exists(select 1 from ###conclusions c1 where s.studyuid=c1.fk_studyuid) ';
    end;
    // upper(cast( as varchar(64) character set win1251))
    if trim(v_patientid)<>'' then
      sql1:=sql1+' and p_pid=:p_p_pid';
    if trim(v_patientname)<>'' then
      sql1:=sql1+' and upper(cast(p_ename_rus as varchar(250) character set win1251)) like upper(:p_p_ename)';
    if trim(v_accessionnumber)<>'' then
      sql1:=sql1+' and accessionnumber=:p_accessionnumber';
    if trim(v_date1)<>'' then
      sql1:=sql1+' and ldate>=:p_ldate1';
    if trim(v_date2)<>'' then
      sql1:=sql1+' and ldate<:p_ldate2';
    if trim(v_studyuid)<>'' then
      sql1:=sql1+' and studyuid=:p_studyuid';
    if trim(v_description)<>'' then
      sql1:=sql1+' and  upper(cast(studydescription as varchar(250) character set win1251)) like upper(:p_description)';
    //
    v_str_ok  :='';
    v_str_not :='';
    // modality
    gtMOD('CR');
    gtMOD('DX');
    gtMOD('IO');
    gtMOD('MR');
    gtMOD('OT');
    gtMOD('RF');
    gtMOD('SC');
    gtMOD('XA');
    gtMOD('CT');
    gtMOD('ES');
    gtMOD('MG');
    gtMOD('NM');
    gtMOD('PX');
    gtMOD('RG');
    gtMOD('US');
    gtMOD('XC');
  //  gtMOD('SR');
  //  gtMOD('ECG');
    v_str_ok:=Copy(v_str_ok,1,Length(v_str_ok)-3);
    v_str_not:=Copy(v_str_not,1,Length(v_str_not)-4);
    if Trim(v_str_not)='' then v_str_not:='1=1';
    if Trim(v_str_ok)='' then v_str_ok:='1=1';
    sql1:=sql1+' and (('+v_str_ok+') and ('+v_str_not+'))';
    //
    if (v_sort<0) then v_txtasc:='desc' else v_txtasc:='';
    if v_sort=0 then  // по умолчанию
    begin
      sql1:=sql1+' order by s.ldate desc';
    end else if abs(v_sort)=1 then  // &nbsp
    begin
      sql1:=sql1+' order by s.ldate desc';
    end else if abs(v_sort)=2 then  // карта
    begin
      sql1:=sql1+' order by s.p_pid '+v_txtasc+',s.ldate desc';
    end else if abs(v_sort)=3 then  // пациент
    begin
      sql1:=sql1+' order by s.p_ename_rus '+v_txtasc+',s.ldate desc';
    end else if abs(v_sort)=4 then  // дата рождения
    begin
      sql1:=sql1+' order by s.p_dateborn '+v_txtasc+',s.ldate desc';
    end else if abs(v_sort)=5 then  // №
    begin
      sql1:=sql1+' order by s.accessionnumber '+v_txtasc+',s.ldate desc';
    end else if abs(v_sort)=6 then  // тип
    begin
      sql1:=sql1+' order by s.studies_image_type '+v_txtasc+',s.ldate desc';
    end else if abs(v_sort)=7 then  // описание
    begin
      sql1:=sql1+' order by s.studydescription '+v_txtasc+',s.ldate desc';
    end else if abs(v_sort)=8 then  // дата
    begin
      sql1:=sql1+' order by s.ldate '+v_txtasc;
    end;
    //

    logs_writes('#3 resstudylist');

    if v_isPostgres then
    begin

    logs_writes('#3.1 resstudylist');

      v_PGconn := DB_CMN.PgConnCrt;
      if v_PGconn=nil then
      begin
        logs_writes('error connect to database = '+v_pg_database+
            ' Port = '+inttostr(v_pg_port)+
            ' Server = '+v_pg_server+
            ' Schema = '+v_pg_Schema+
            ' Username := '+v_pg_user+
            ' Password := '+v_pg_password);
      end;

    logs_writes('#3.2 resstudylist');

      v_PGTrans := PGTransCreate (v_PGconn) ;

    logs_writes('#3.3 resstudylist');

      v_PGTrans.DefaultConnection:=v_PGconn;

    logs_writes('#3.4 resstudylist');

      try
        if v_PGconn<>nil then

    logs_writes('#4 resstudylist');

          if v_PGconn.Connected then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try

    logs_writes('#5 resstudylist');

              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
              v_UniQr.SQL.Text := StringReplace(sql1,'###',v_pg_schema+'.',[rfReplaceAll, rfIgnoreCase]);
              if Trim(v_patientid)<>'' then
                v_UniQr.ParamByName('p_P_PID').AsString:=v_patientid;
              if Trim(v_patientname)<>'' then
                v_UniQr.ParamByName('p_P_ENAME').AsString:='%'+v_patientname+'%';
              if Trim(v_accessionnumber)<>'' then
                v_UniQr.ParamByName('p_ACCESSIONNUMBER').AsString:=v_accessionnumber;
              if Trim(v_date1)<>'' then
                v_UniQr.ParamByName('p_LDATE1').AsDateTime:=DateOf(StrToDateDef(v_date1,EncodeDate(1900,1,1)));
              if Trim(v_date2)<>'' then
                v_UniQr.ParamByName('p_LDATE2').AsDateTime:=IncDay(DateOf(StrToDateDef(v_date2,EncodeDate(2100,1,1))),1);
              if Trim(v_studyuid)<>'' then
                v_UniQr.ParamByName('p_studyuid').AsString:=v_studyuid;
              if Trim(v_description)<>'' then
                v_UniQr.ParamByName('p_description').AsString:='%'+v_description+'%';
              //
              logs_writes('запрос списка исследований');
              try

    logs_writes('#6 resstudylist');

                v_UniQr.Open;
              except
              on e:Exception do
                logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
              end;
              v_frm_str := '';
              v_i:=0;
              if v_UniQr.Eof then logs_writes('СПИСОК исследований ПУСТ');

    logs_writes('#7 resstudylist');

              while not v_UniQr.Eof do
              begin        // формируем строку с массивом а-ля JSON  ansitoutf8


    logs_writes('#8 v_i='+inttostr(v_i));

                Inc(v_i);
                v_frm_str:= v_frm_str +
                   IntToStr( v_UniQr.FieldByName('id_concl').AsInteger )+'<;>'+
                   v_UniQr.FieldByName('P_PID').AsString+'<;>'+                    // Patient ID
                   fStrNorm( StringReplace(v_UniQr.FieldByName('P_ENAME_RUS').AsString,'^',' ',[rfReplaceAll, rfIgnoreCase]) )+'<;>'+                  // Name
                   DateToStr(v_UniQr.FieldByName('P_DATEBORN').AsDateTime)+'<;>'+  // DateBorn
                   v_UniQr.FieldByName('ACCESSIONNUMBER').AsString+'<;>'+      // AccessionNumber
                   v_UniQr.FieldByName('STUDIES_IMAGE_TYPE').AsString+'<;>'+   // Mod
                   DateToStr(v_UniQr.FieldByName('LDATE').AsDateTime)+'<;>'+   // StudyDate
                   v_UniQr.FieldByName('STUDYUID').AsString+'<;>'+             // STUDYUID
                   v_UniQr.FieldByName('STUDYDESCRIPTION').AsString+'<;>'+     // Description
                   IntToStr( v_UniQr.FieldByName('ACTUALITY').AsInteger )+'<;>'+     // ACTUALITY
                   '<|>';
                v_UniQr.Next;
                if (v_i>c_amm) then Break;
              end;

    logs_writes('#9 resstudylist');

              v_frm_str:=Copy(v_frm_str,1,Length(v_frm_str)-3);
              v_UniQr.Close;
              // а-ля JSON к отправке
              ResultHtmlDoc.Add(AnsiToUtf8(v_frm_str));
              log_html_write(ResultHtmlDoc,'studylist jquery result');
            finally
              v_UniQr.Close;
              v_UniQr.Free;
            end;
          end else
            logs_writes( 'ERROR : not connected to PostgreSQL');
      finally
        log_html_write(ResultHtmlDoc,'studylist json ');
        DB_CMN.PgFree(v_PGconn,v_PGTrans);
      end;
    end else begin
      FIBDataSet := TpFIBDataSet.Create(nil);
      FIBDataSet.Database := DB1;
      try
        FIBDataSet.Transaction := trRead1;
        FIBDataSet.SQLs.SelectSQL.Text := StringReplace(sql1,'###','',[rfReplaceAll, rfIgnoreCase]);
        if Trim(v_patientid)<>'' then
          FIBDataSet.ParamByName('p_P_PID').AsString:=v_patientid;
        if Trim(v_patientname)<>'' then
          FIBDataSet.ParamByName('p_P_ENAME').AsString:='%'+v_patientname+'%';
        if Trim(v_accessionnumber)<>'' then
          FIBDataSet.ParamByName('p_ACCESSIONNUMBER').AsString:=v_accessionnumber;
        if Trim(v_date1)<>'' then
          FIBDataSet.ParamByName('p_LDATE1').AsDateTime:=DateOf(StrToDateDef(v_date1,EncodeDate(1900,1,1)));
        if Trim(v_date2)<>'' then
          FIBDataSet.ParamByName('p_LDATE2').AsDateTime:=IncDay(DateOf(StrToDateDef(v_date2,EncodeDate(2100,1,1))),1);
        if Trim(v_studyuid)<>'' then
          FIBDataSet.ParamByName('p_studyuid').AsString:=v_studyuid;
        if Trim(v_description)<>'' then
          FIBDataSet.ParamByName('p_description').AsString:='%'+v_description+'%';
        //
        logs_writes('запрос списка исследований');
        FIBDataSet.Open;
        v_frm_str := '';
        v_i:=0;
        if FIBDataSet.Eof then logs_writes('СПИСОК исследований ПУСТ');
        while not FIBDataSet.Eof do
        begin        // формируем строку с массивом а-ля JSON  ansitoutf8
          Inc(v_i);
          v_frm_str:= v_frm_str +
             IntToStr( FIBDataSet.FieldByName('id_concl').AsInteger )+'<;>'+
             FIBDataSet.FieldByName('P_PID').AsString+'<;>'+                    // Patient ID
             fStrNorm( StringReplace(FIBDataSet.FieldByName('P_ENAME_RUS').AsString,'^',' ',[rfReplaceAll, rfIgnoreCase]) )+'<;>'+                  // Name
             DateToStr(FIBDataSet.FieldByName('P_DATEBORN').AsDateTime)+'<;>'+  // DateBorn
             FIBDataSet.FieldByName('ACCESSIONNUMBER').AsString+'<;>'+      // AccessionNumber
             FIBDataSet.FieldByName('STUDIES_IMAGE_TYPE').AsString+'<;>'+   // Mod
             DateToStr(FIBDataSet.FieldByName('LDATE').AsDateTime)+'<;>'+   // StudyDate
             FIBDataSet.FieldByName('STUDYUID').AsString+'<;>'+             // STUDYUID
             FIBDataSet.FieldByName('STUDYDESCRIPTION').AsString+'<;>'+     // Description
             IntToStr( FIBDataSet.FieldByName('ACTUALITY').AsInteger )+'<;>'+     // ACTUALITY
             '<|>';
          logs_writes('иссл '+inttostr(v_i)+' : '+v_frm_str);
          FIBDataSet.Next;
          if (v_i>c_amm) then Break;
        end;
        v_frm_str:=Copy(v_frm_str,1,Length(v_frm_str)-3);
        FIBDataSet.Close;
        // а-ля JSON к отправке
        ResultHtmlDoc.Add(AnsiToUtf8(v_frm_str));
      finally
        FreeAndNil(FIBDataSet);
      end;
    end;
  end;
  procedure ReturnUsersDATAHTML(AParam, ResultHtmlDoc: TStrings);
  var contentType,
      v_patientid,
      v_accessionnumber,
      sql1,
      v_str_ok, v_str_not,
      v_studyuid,
      v_description,
      v_is_zakl, v_txtasc,
      v_username,	v_spec,	v_uslugi,	v_org, v_doljn  : string;
      FIBDataSet : TpFIBDataSet;
      v_frm_str, v_s_tmp : ansistring ;
      v_sort, v_i : Integer;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
    const c_amm=100;

    // frm_mod_str2('CR','FN_CR')

    function frm_mod_str2( name_mod:string; fldname:string ):string;
    begin
      if AParam.Values[name_mod]='1' then
      begin
        v_s_tmp:=v_s_tmp+' and s.'+Lowercase(fldname)+'=1 ';     
      end;
    end; 
  begin
    contentType := AParam.Values['contentType'];
    // AnsiUpperCase
    v_username := AnsiUpperCase( Utf8ToAnsi( AParam.Values['username'] ));
		v_spec := AnsiUpperCase( Utf8ToAnsi( AParam.Values['spec'] ));
		v_uslugi := AnsiUpperCase( Utf8ToAnsi( AParam.Values['uslugi'] ));
		v_org := AnsiUpperCase( Utf8ToAnsi( AParam.Values['org'] ));
	  v_doljn := AnsiUpperCase( Utf8ToAnsi( AParam.Values['doljn'] ));
    try
      v_sort    := StrToInt(trim(AParam.Values['s']));
    except
      v_sort    := 0;
    end;     
    //
    sql1 := 'select s.* from ###users s where (fn_del=0) and (fn_iswado=1) ';  //   fn_iswado=1 and
    // upper(cast( as varchar(64) character set win1251))
    if trim(v_username)<>'' then
      sql1:=sql1+' and upper(cast(s.fc_fam||'' ''||s.fc_im||'' ''||s.fc_otch as varchar(250) character set win1251)) like :p_username ';
    if trim(v_spec)<>'' then
      sql1:=sql1+' and upper(cast(s.fc_specializations as varchar(250) character set win1251)) like :p_fc_specializations ';
    if trim(v_uslugi)<>'' then
      sql1:=sql1+' and  upper(cast(s.fc_uslugi as varchar(250) character set win1251)) like :p_fc_uslugi';
    if trim(v_org)<>'' then
      sql1:=sql1+' and upper(cast(s.fc_firma as varchar(250) character set win1251)) like :p_fc_firma';
    if trim(v_doljn)<>'' then
      sql1:=sql1+' and upper(cast(s.fc_doljn as varchar(250) character set win1251)) like :p_fc_doljn';
    //
    v_str_ok  :='';
    v_str_not :='';
    // modality
    v_s_tmp:=v_s_tmp+frm_mod_str2('CR','FN_CR');
    v_s_tmp:=v_s_tmp+frm_mod_str2('DX','FN_DX');
    v_s_tmp:=v_s_tmp+frm_mod_str2('IO','FN_IO');
    v_s_tmp:=v_s_tmp+frm_mod_str2('MR','FN_MR');
    v_s_tmp:=v_s_tmp+frm_mod_str2('OT','FN_OT');
    v_s_tmp:=v_s_tmp+frm_mod_str2('RF','FN_RF');
    v_s_tmp:=v_s_tmp+frm_mod_str2('SC','FN_SC');
    v_s_tmp:=v_s_tmp+frm_mod_str2('XA','FN_XA');
    v_s_tmp:=v_s_tmp+frm_mod_str2('CT','FN_CT');
    v_s_tmp:=v_s_tmp+frm_mod_str2('ES','FN_ES');
    v_s_tmp:=v_s_tmp+frm_mod_str2('MG','FN_MG');
    v_s_tmp:=v_s_tmp+frm_mod_str2('NM','FN_NM');
    v_s_tmp:=v_s_tmp+frm_mod_str2('PX','FN_PX');
    v_s_tmp:=v_s_tmp+frm_mod_str2('RG','FN_RG');
    v_s_tmp:=v_s_tmp+frm_mod_str2('US','FN_US');
    v_s_tmp:=v_s_tmp+frm_mod_str2('XC','FN_XC');
  //  v_s_tmp:=v_s_tmp+frm_mod_str2('SR','FN_SR');
  //  v_s_tmp:=v_s_tmp+frm_mod_str2('ECG','FN_ECG');
    if (length(trim(v_s_tmp))>3) then
      sql1:=sql1+' and ( 1=1 '+v_s_tmp+' ) ';
    //
    if (v_sort<0) then v_txtasc:='desc' else v_txtasc:='';
    if v_sort=0 then  // по умолчанию
    begin
      sql1:=sql1+' order by s.fc_fam||'' ''||s.fc_im||'' ''||s.fc_otch ';
    end else if abs(v_sort)=1 then  // &nbsp
    begin
      sql1:=sql1+' order by s.fc_fam||'' ''||s.fc_im||'' ''||s.fc_otch '+v_txtasc;
    end else if abs(v_sort)=2 then  // организация
    begin
      sql1:=sql1+' order by s.fc_firma '+v_txtasc;
    end else if abs(v_sort)=3 then  // услуги
    begin
      sql1:=sql1+' order by s.fc_uslugi '+v_txtasc;
    end;
    //
    if v_isPostgres then
    begin
      v_PGconn := DB_CMN.PgConnCrt;
      v_PGTrans := PGTransCreate (v_PGconn) ;
      v_PGTrans.DefaultConnection:=v_PGconn;
      try
        if v_PGconn<>nil then
          if v_PGconn.Connected then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
              v_UniQr.SQL.Text := StringReplace(sql1,'###',v_pg_schema+'.',[rfReplaceAll, rfIgnoreCase]);

              if Trim(v_username)<>'' then
                v_UniQr.ParamByName('p_username').AsString:= '%'+v_username+'%';
              if Trim(v_spec)<>'' then
                v_UniQr.ParamByName('p_FC_SPECIALIZATIONS').AsString:= '%'+v_spec+'%';
              if Trim(v_uslugi)<>'' then
                v_UniQr.ParamByName('p_FC_USLUGI').AsString:= '%'+v_uslugi+'%';
              if Trim(v_org)<>'' then
                v_UniQr.ParamByName('p_FC_FIRMA').AsString:= '%'+v_org+'%';
              if Trim(v_doljn)<>'' then
                v_UniQr.ParamByName('p_FC_DOLJN').AsString:= '%'+v_doljn+'%';
              //
              try
                v_UniQr.Open;
              except
              on e:Exception do
                logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
              end;
              v_UniQr.First;
              v_frm_str := '';
              v_i:=0;
              while not v_UniQr.Eof do
              begin        // формируем строку с массивом а-ля JSON  ansitoutf8
                Inc(v_i);
                v_frm_str:= v_frm_str +
                  v_UniQr.FieldByName('FC_FAM').AsString+'<;>'+
                  v_UniQr.FieldByName('FC_IM').AsString+'<;>'+
                  v_UniQr.FieldByName('FC_OTCH').AsString+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FK_ID').AsInteger )+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_ISQUERIES').AsInteger )+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_ISCONCL').AsInteger )+'<;>'+
                  v_UniQr.FieldByName('FC_FIRMA').AsString+'<;>'+
                  v_UniQr.FieldByName('FC_DOLJN').AsString+'<;>'+
                  v_UniQr.FieldByName('FC_USLUGI').AsString+'<;>'+
                  v_UniQr.FieldByName('FC_SPECIALIZATIONS').AsString+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_CR').AsInteger )+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_DX').AsInteger )+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_IO').AsInteger )+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_MR').AsInteger )+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_OT').AsInteger )+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_SC').AsInteger )+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_XA').AsInteger )+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_CT').AsInteger )+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_ES').AsInteger )+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_MG').AsInteger )+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_NM').AsInteger )+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_PX').AsInteger )+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_RG').AsInteger )+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_US').AsInteger )+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_XC').AsInteger )+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_RF').AsInteger )+'<;>'+
                  v_UniQr.FieldByName('FC_LOGIN').AsString+
                   '<|>';
                v_UniQr.Next;
                if (v_i>c_amm) then Break;
              end;
              v_frm_str:=Copy(v_frm_str,1,Length(v_frm_str)-3);
              v_UniQr.Close;
              // а-ля JSON к отправке
              ResultHtmlDoc.Add(AnsiToUtf8(v_frm_str));
            finally
              v_UniQr.Close;
              v_UniQr.Free;
            end;
          end else
            logs_writes( 'ERROR : not connected to PostgreSQL');
      finally
        DB_CMN.PgFree(v_PGconn,v_PGTrans);
      end;
    end else begin
      FIBDataSet := TpFIBDataSet.Create(nil);
      FIBDataSet.Database := DB1;
      try
        FIBDataSet.Transaction := trRead1;
        FIBDataSet.SQLs.SelectSQL.Text := StringReplace(sql1,'###','',[rfReplaceAll, rfIgnoreCase]);
        if Trim(v_username)<>'' then
          FIBDataSet.ParamByName('p_username').AsString:= '%'+v_username+'%';
        if Trim(v_spec)<>'' then
          FIBDataSet.ParamByName('p_FC_SPECIALIZATIONS').AsString:= '%'+v_spec+'%';
        if Trim(v_uslugi)<>'' then
          FIBDataSet.ParamByName('p_FC_USLUGI').AsString:= '%'+v_uslugi+'%';
        if Trim(v_org)<>'' then
          FIBDataSet.ParamByName('p_FC_FIRMA').AsString:= '%'+v_org+'%';
        if Trim(v_doljn)<>'' then
          FIBDataSet.ParamByName('p_FC_DOLJN').AsString:= '%'+v_doljn+'%';
        //
        FIBDataSet.Open; FIBDataSet.First;
        v_frm_str := '';
        v_i:=0;
        while not FIBDataSet.Eof do
        begin        // формируем строку с массивом а-ля JSON  ansitoutf8
          Inc(v_i);
          v_frm_str:= v_frm_str +
            FIBDataSet.FieldByName('FC_FAM').AsString+'<;>'+
            FIBDataSet.FieldByName('FC_IM').AsString+'<;>'+
            FIBDataSet.FieldByName('FC_OTCH').AsString+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FK_ID').AsInteger )+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_ISQUERIES').AsInteger )+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_ISCONCL').AsInteger )+'<;>'+
            FIBDataSet.FieldByName('FC_FIRMA').AsString+'<;>'+
            FIBDataSet.FieldByName('FC_DOLJN').AsString+'<;>'+
            FIBDataSet.FieldByName('FC_USLUGI').AsString+'<;>'+
            FIBDataSet.FieldByName('FC_SPECIALIZATIONS').AsString+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_CR').AsInteger )+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_DX').AsInteger )+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_IO').AsInteger )+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_MR').AsInteger )+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_OT').AsInteger )+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_SC').AsInteger )+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_XA').AsInteger )+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_CT').AsInteger )+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_ES').AsInteger )+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_MG').AsInteger )+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_NM').AsInteger )+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_PX').AsInteger )+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_RG').AsInteger )+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_US').AsInteger )+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_XC').AsInteger )+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_RF').AsInteger )+'<;>'+
            FIBDataSet.FieldByName('FC_LOGIN').AsString+
             '<|>';
          FIBDataSet.Next;
          if (v_i>c_amm) then Break;
        end;
        v_frm_str:=Copy(v_frm_str,1,Length(v_frm_str)-3);
        FIBDataSet.Close;
        // а-ля JSON к отправке
        ResultHtmlDoc.Add(AnsiToUtf8(v_frm_str));
      finally
        FreeAndNil(FIBDataSet);
      end;
    end;
  end;
  procedure ReturnNEXTCONCLUSION(AParam, ResultHtmlDoc: TStrings;p_is_next:boolean=true);
  var contentType,
      v_patientid,
      v_patientname,
      v_accessionnumber,
      v_date1, v_date2,
      sql1,
      v_str_ok, v_str_not,
      v_studyuid,
      v_description,
      v_is_zakl, v_txtasc,
      v_prntid, v_setstatus : string;
      FIBDataSet : TpFIBDataSet;
      FIBQuery : TpFIBQuery;
      v_frm_str: ansistring ;
      v_sort, v_i : Integer;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
    const c_amm=100;
  begin
    contentType := AParam.Values['contentType'];
    v_studyuid := Trim(AParam.Values['studyuid']);
    v_setstatus := Trim(AParam.Values['setstatus']);
    sql1 := 'select ldate, actuality, studies_image_type, studyuid '+
      ' from ###studies  order by actuality desc,ldate';  // where ((ACTUALITY>=1) and (ACTUALITY<=3))
    //
    if v_isPostgres then
    begin
      v_PGconn := DB_CMN.PgConnCrt;
      v_PGTrans := PGTransCreate (v_PGconn) ;
      v_PGTrans.DefaultConnection:=v_PGconn;
      try
        if v_PGconn<>nil then
          if v_PGconn.Connected then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
              v_UniQr.SQL.Text := StringReplace(sql1,'###',v_pg_schema+'.',[rfReplaceAll, rfIgnoreCase]);
              try
                v_UniQr.Open;
              except
              on e:Exception do
                logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
              end;
              v_frm_str := '';
              while not v_UniQr.Eof do
              begin        // формируем строку с массивом а-ля JSON  ansitoutf8
                if (v_studyuid=v_UniQr.FieldByName('STUDYUID').AsString) then
                begin
                  if p_is_next then
                  begin
                    v_UniQr.Next;
                    while (((not v_UniQr.Eof) and (not v_UniQr.Bof)) and
                           (not (v_UniQr.FieldByName('ACTUALITY').AsInteger in [1,2,3])))
                    do
                    begin
                      v_UniQr.Next;
                    end;
                    if ((not v_UniQr.Eof) and (not v_UniQr.Bof)) then
                    begin
                      v_frm_str:= Trim(v_UniQr.FieldByName('STUDYUID').AsString);
                    end else
                    begin
                      v_UniQr.First;
                      if ((not v_UniQr.Eof) and (v_studyuid<>v_UniQr.FieldByName('STUDYUID').AsString)) then
                      begin
                        v_frm_str:= Trim(v_UniQr.FieldByName('STUDYUID').AsString);
                      end;
                    end;
                    Break;
                  end else
                  begin
                    v_UniQr.Prior;
                    while (((not v_UniQr.Eof) and (not v_UniQr.Bof)) and
                           (not (v_UniQr.FieldByName('ACTUALITY').AsInteger in [1,2,3])))
                    do
                    begin
                      v_UniQr.Prior;
                    end;
                    if ((not v_UniQr.Eof) and (not v_UniQr.Bof)) then
                    begin
                      v_frm_str:= Trim(v_UniQr.FieldByName('STUDYUID').AsString);
                    end else
                    begin
                      v_UniQr.Last;
                      if ((not v_UniQr.Eof) and (v_studyuid<>v_UniQr.FieldByName('STUDYUID').AsString)) then
                      begin
                        v_frm_str:= Trim(v_UniQr.FieldByName('STUDYUID').AsString);
                      end;
                    end;
                    Break;
                  end;
                end;
                v_UniQr.Next;
              end;
              v_UniQr.Close;
              if v_setstatus<>'' then
                SetActToStudy ( DB1, trWrite1, StrToInt(v_setstatus), v_studyuid );
              // а-ля JSON к отправке
              ResultHtmlDoc.Add(v_frm_str); 
            finally
              v_UniQr.Close;
              v_UniQr.Free;
            end;
          end else
            logs_writes( 'ERROR : not connected to PostgreSQL');
      finally
        DB_CMN.PgFree(v_PGconn,v_PGTrans);
      end;
    end else begin
      FIBDataSet := TpFIBDataSet.Create(nil);
      FIBDataSet.Database := DB1;
      try
        FIBDataSet.Transaction := trRead1;
        FIBDataSet.SQLs.SelectSQL.Text := StringReplace(sql1,'###','',[rfReplaceAll, rfIgnoreCase]);
        //
        FIBDataSet.Open;
        v_frm_str := '';
        while not FIBDataSet.Eof do
        begin        // формируем строку с массивом а-ля JSON  ansitoutf8
          if (v_studyuid=FIBDataSet.FieldByName('STUDYUID').AsString) then
          begin
            if p_is_next then
            begin
              FIBDataSet.Next;
              while (((not FIBDataSet.Eof) and (not FIBDataSet.Bof)) and
                     (not (FIBDataSet.FieldByName('ACTUALITY').AsInteger in [1,2,3])))
              do
              begin
                FIBDataSet.Next;
              end;
              if ((not FIBDataSet.Eof) and (not FIBDataSet.Bof)) then
              begin
                v_frm_str:= Trim(FIBDataSet.FieldByName('STUDYUID').AsString);
              end else
              begin
                FIBDataSet.First;
                if ((not FIBDataSet.Eof) and (v_studyuid<>FIBDataSet.FieldByName('STUDYUID').AsString)) then
                begin
                  v_frm_str:= Trim(FIBDataSet.FieldByName('STUDYUID').AsString);
                end;
              end;
              Break;
            end else
            begin
              FIBDataSet.Prior;
              while (((not FIBDataSet.Eof) and (not FIBDataSet.Bof)) and
                     (not (FIBDataSet.FieldByName('ACTUALITY').AsInteger in [1,2,3])))
              do
              begin
                FIBDataSet.Prior;
              end;
              if ((not FIBDataSet.Eof) and (not FIBDataSet.Bof)) then
              begin
                v_frm_str:= Trim(FIBDataSet.FieldByName('STUDYUID').AsString);
              end else
              begin
                FIBDataSet.Last;
                if ((not FIBDataSet.Eof) and (v_studyuid<>FIBDataSet.FieldByName('STUDYUID').AsString)) then
                begin
                  v_frm_str:= Trim(FIBDataSet.FieldByName('STUDYUID').AsString);
                end;
              end;
              Break;
            end;
          end;
          FIBDataSet.Next;
        end;
        FIBDataSet.Close;
        if v_setstatus<>'' then
          SetActToStudy ( DB1, trWrite1, StrToInt(v_setstatus), v_studyuid );
        // а-ля JSON к отправке
        ResultHtmlDoc.Add(v_frm_str);
      finally
        FreeAndNil(FIBDataSet);
      end;
    end;
  end;
  procedure ReturnTEMPLDATAHTML(AParam, ResultHtmlDoc: TStrings);
  var contentType,
      v_patientid,
      v_patientname,
      v_accessionnumber,
      v_date1, v_date2,
      sql1,
      v_str_ok, v_str_not,
      v_studyuid,
      v_description,
      v_is_zakl, v_txtasc,
      v_prntid  : string;
      FIBDataSet : TpFIBDataSet;
      v_frm_str: ansistring ;
      v_sort, v_i : Integer;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
    const c_amm=100;
  begin
    contentType := AParam.Values['contentType'];
    //
    sql1 := 'select fk_id, studies_image_type, fc_comm '+
      ' from ###templates where coalesce(fn_is_del,0)=0 order by studies_image_type';
    //
    if v_isPostgres then
    begin
      v_PGconn := DB_CMN.PgConnCrt;
      v_PGTrans := PGTransCreate (v_PGconn) ;
      v_PGTrans.DefaultConnection:=v_PGconn;
      try
        if v_PGconn<>nil then
          if v_PGconn.Connected then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
              v_UniQr.SQL.Text := StringReplace(sql1,'###',v_pg_schema+'.',[rfReplaceAll, rfIgnoreCase]);
              try
                v_UniQr.Open;
              except
              on e:Exception do
                logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
              end;
              v_frm_str := '';
              v_i:=0;
              while not v_UniQr.Eof do
              begin        // формируем строку с массивом а-ля JSON  ansitoutf8
                Inc(v_i);
                v_frm_str:= v_frm_str +
                  IntToStr( v_UniQr.FieldByName('FK_ID').AsInteger )+'<;>'+
                  Trim(v_UniQr.FieldByName('STUDIES_IMAGE_TYPE').AsString)+'<;>'+
                  Trim(v_UniQr.FieldByName('FC_COMM').AsString)+
                  '<|>';
                v_UniQr.Next;
                if (v_i>c_amm) then Break;
              end;
              v_frm_str:=Copy(v_frm_str,1,Length(v_frm_str)-3);
              v_UniQr.Close;
              // а-ля JSON к отправке
              ResultHtmlDoc.Add(AnsiToUtf8(v_frm_str));
            finally
              v_UniQr.Close;
              v_UniQr.Free;
            end;
          end else
            logs_writes( 'ERROR : not connected to PostgreSQL');
      finally
        DB_CMN.PgFree(v_PGconn,v_PGTrans);
      end;
    end else begin
      FIBDataSet := TpFIBDataSet.Create(nil);
      FIBDataSet.Database := DB1;
      try
        FIBDataSet.Transaction := trRead1;
        FIBDataSet.SQLs.SelectSQL.Text := StringReplace(sql1,'###','',[rfReplaceAll, rfIgnoreCase]);
        //
        FIBDataSet.Open;
        v_frm_str := '';
        v_i:=0;
        while not FIBDataSet.Eof do
        begin        // формируем строку с массивом а-ля JSON  ansitoutf8
          Inc(v_i);
          v_frm_str:= v_frm_str +
            IntToStr( FIBDataSet.FieldByName('FK_ID').AsInteger )+'<;>'+
            Trim(FIBDataSet.FieldByName('STUDIES_IMAGE_TYPE').AsString)+'<;>'+
            Trim(FIBDataSet.FieldByName('FC_COMM').AsString)+
            '<|>';
          FIBDataSet.Next;
          if (v_i>c_amm) then Break;
        end;
        v_frm_str:=Copy(v_frm_str,1,Length(v_frm_str)-3);
        FIBDataSet.Close;
        // а-ля JSON к отправке
        ResultHtmlDoc.Add(AnsiToUtf8(v_frm_str));
      finally
        FreeAndNil(FIBDataSet);
      end;
    end;
  end;
  procedure ReturnLPUDATAHTML(AParam, ResultHtmlDoc: TStrings);
  var contentType,
      v_patientid,
      v_patientname,
      v_accessionnumber,
      v_date1, v_date2,
      sql1,
      v_str_ok, v_str_not,
      v_studyuid,
      v_description,
      v_is_zakl, v_txtasc,
      v_prntid  : string;
      FIBDataSet : TpFIBDataSet;
      v_frm_str: ansistring ;
      v_sort, v_i : Integer;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
    const c_amm=100;
  begin
    contentType := AParam.Values['contentType'];

    v_prntid := AParam.Values['prntid'];
    if Trim(v_prntid)='' then v_prntid:='0';    
    //
    sql1 := 'select coalesce((select count(1) from ###hospitals c where c.fn_parentid=s.p_id),0) as amm_child, s.* '+
            ' from ###hospitals s where fn_parentid=:p_fn_parentid order by fn_type';
    //
    if v_isPostgres then
    begin
      v_PGconn := DB_CMN.PgConnCrt;
      v_PGTrans := PGTransCreate (v_PGconn) ;
      v_PGTrans.DefaultConnection:=v_PGconn;
      try
        if v_PGconn<>nil then
          if v_PGconn.Connected then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
              v_UniQr.SQL.Text := StringReplace(sql1,'###',v_pg_schema+'.',[rfReplaceAll, rfIgnoreCase]);
              v_UniQr.ParamByName('p_FN_PARENTID').AsInteger:= StrToInt(v_prntid);
              try
                v_UniQr.Open;
              except
              on e:Exception do
                logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
              end;
              v_frm_str := '';
              v_i:=0;
              while not v_UniQr.Eof do
              begin        // формируем строку с массивом а-ля JSON  ansitoutf8
                Inc(v_i);
                v_frm_str:= v_frm_str +
                  IntToStr( v_UniQr.FieldByName('amm_child').AsInteger )+'<;>'+
                  IntToStr( v_UniQr.FieldByName('P_ID').AsInteger )+'<;>'+
                  v_UniQr.FieldByName('FC_NAME').AsString+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_TYPE').AsInteger )+'<;>'+
                  v_UniQr.FieldByName('STUDIES_IMAGE_TYPE').AsString+'<;>'+
                  IntToStr( v_UniQr.FieldByName('FN_PARENTID').AsInteger )+
                  '<|>';
                v_UniQr.Next;
                if (v_i>c_amm) then Break;
              end;
              v_frm_str:=Copy(v_frm_str,1,Length(v_frm_str)-3);
              v_UniQr.Close;
              // а-ля JSON к отправке
              ResultHtmlDoc.Add(AnsiToUtf8(v_frm_str));
            finally
              v_UniQr.Close;
              v_UniQr.Free;
            end;
          end else
            logs_writes( 'ERROR : not connected to PostgreSQL');
      finally
        DB_CMN.PgFree(v_PGconn,v_PGTrans);
      end;
    end else begin
      FIBDataSet := TpFIBDataSet.Create(nil);
      FIBDataSet.Database := DB1;
      try
        FIBDataSet.Transaction := trRead1;
        FIBDataSet.SQLs.SelectSQL.Text := StringReplace(sql1,'###','',[rfReplaceAll, rfIgnoreCase]);
        FIBDataSet.ParamByName('p_FN_PARENTID').AsInteger:= StrToInt(v_prntid);
        //
        FIBDataSet.Open;
        v_frm_str := '';
        v_i:=0;
        while not FIBDataSet.Eof do
        begin        // формируем строку с массивом а-ля JSON  ansitoutf8
          Inc(v_i);
          v_frm_str:= v_frm_str +
            IntToStr( FIBDataSet.FieldByName('amm_child').AsInteger )+'<;>'+
            IntToStr( FIBDataSet.FieldByName('P_ID').AsInteger )+'<;>'+
            FIBDataSet.FieldByName('FC_NAME').AsString+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_TYPE').AsInteger )+'<;>'+
            FIBDataSet.FieldByName('STUDIES_IMAGE_TYPE').AsString+'<;>'+
            IntToStr( FIBDataSet.FieldByName('FN_PARENTID').AsInteger )+
            '<|>';
          FIBDataSet.Next;
          if (v_i>c_amm) then Break;
        end;
        v_frm_str:=Copy(v_frm_str,1,Length(v_frm_str)-3);
        FIBDataSet.Close;
        // а-ля JSON к отправке
        ResultHtmlDoc.Add(AnsiToUtf8(v_frm_str));
  //      ResultHtmlDoc.Add(AnsiToUtf8('[{	"data":"РОССИЯ (код оборудования - если есть)","attr":{"id": "4","rel": "folder","title":"РОССИЯ"},"state":"closed"}] ,'+
   //                                  ' [{	"data":"Оборудование MG","attr":{"id": "7","rel": "default","title":"Оборудование"},"state":""}]'));
  //      ResultHtmlDoc.Add(v_frm_str);
      finally
        FreeAndNil(FIBDataSet);
      end;
    end;
  end;
  procedure ReturnAddConclusion(AParam, ResultHtmlDoc: TStrings);
    var v_studyuid, v_ui, v_s_tmp : string;
      v_userid : Integer;
      FIBQuery : TpFIBQuery;
      FIBDataSet : TpFIBDataSet;
      v_str_tmp : string;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
  begin
    v_studyuid:=AParam.Values['studyuid'];
    v_ui:=Trim(AParam.Values['ui']);
    //
    if v_isPostgres then
    begin
      v_PGconn := DB_CMN.PgConnCrt;
      v_PGTrans := PGTransCreate (v_PGconn) ;
      v_PGTrans.DefaultConnection:=v_PGconn;
      try
        if v_PGconn<>nil then
          if v_PGconn.Connected then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
              v_UniQr.SQL.Text := 'select fc_fam,fc_im,fc_otch from '+v_pg_schema+
                  '.users where fk_id=:p_fk_id and (fn_del=0) and (fn_iswado=1) ';
              v_UniQr.ParamByName('p_FK_ID').AsInteger:=v_userid;
              try
                v_UniQr.Open;

              except
              on e:Exception do
                logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
              end;
              v_s_tmp:='';
              if not v_UniQr.Eof then
              begin
                v_s_tmp:=v_UniQr.FieldByName('FC_FAM').AsString+'<;>'+
                         v_UniQr.FieldByName('FC_IM').AsString+'<;>'+
                         v_UniQr.FieldByName('FC_OTCH').AsString;
              end else begin
                v_s_tmp:='SYSDBA';
              end;
            finally
              v_UniQr.Close;
              v_UniQr.Free;
            end;
          end else
            logs_writes( 'ERROR : not connected to PostgreSQL');
      finally
        DB_CMN.PgFree(v_PGconn,v_PGTrans);
      end;

    end else begin
      FIBDataSet := TpFIBDataSet.Create(nil);
      FIBDataSet.Database := DB1;
      if (v_ui='0') then
      begin
        v_s_tmp:=AnsiToUtf8('sysdba<;><;>');
      end else
      try
        try
          v_userid:=StrToInt(v_ui);
        except
          v_userid:=0;
        end;
        FIBDataSet.Transaction := trRead1;
        FIBDataSet.SQLs.SelectSQL.Text := 'select FC_FAM,FC_IM,FC_OTCH from '+
             ' USERS where FK_ID=:p_FK_ID and (fn_del=0) and (FN_ISWADO=1) ';
        FIBDataSet.ParamByName('p_FK_ID').AsInteger:=v_userid;
        FIBDataSet.Open;
        v_s_tmp:='';
        if not FIBDataSet.Eof then
        begin
          v_s_tmp:=FIBDataSet.FieldByName('FC_FAM').AsString+'<;>'+
                   FIBDataSet.FieldByName('FC_IM').AsString+'<;>'+
                   FIBDataSet.FieldByName('FC_OTCH').AsString;
        end else begin
          v_s_tmp:='SYSDBA';
        end;
      finally
        FIBDataSet.Free;
      end;
      //
      FIBQuery := TpFIBQuery.Create(nil);
      FIBQuery.Database := DB1;
      try
        FIBQuery.Transaction := trWrite1;
        FIBQuery.SQL.Text := ' insert into CONCLUSIONS ('+
          ' FD_DATE, FK_USERID, FK_STUDYUID ) values ('+
          ' :p_FD_DATE, :p_FK_USERID, :p_FK_STUDYUID ) '+
          ' RETURNING FK_ID';
        FIBQuery.ParamByName('p_FD_DATE').AsTimeStamp:=DateTimeToTimeStamp(Now);
        v_str_tmp:=DateTimeToStr(Now);
        try
          v_userid:=StrToInt(v_ui);
        except
          v_userid:=0;
        end;
        FIBQuery.ParamByName('p_FK_USERID').AsInteger:=v_userid;
        FIBQuery.ParamByName('p_FK_STUDYUID').AsString:=v_studyuid;
        try
          FIBQuery.ExecQuery;
          ResultHtmlDoc.Add( AnsiToUtf8(
                               IntToStr( FIBQuery.FieldByName('FK_ID').AsInteger )+'<;>'+
                               DateTimeToStr(Now)+'<;>'+
                               IntToStr( v_userid )+'<;>'+
                               v_s_tmp
                             )
                           );
        except
          on e:Exception do
            ResultHtmlDoc.Add(E.ClassName+' '+E.Message);
        end;
      finally
        FreeAndNil(FIBQuery);
      end;
    end;
  end;
  procedure ReturnSETACTUALITY(AParam, ResultHtmlDoc: TStrings);
    var v_id, v_studyuid, v_ui, v_act : string;
      v_userid, v_id_int : Integer;
      FIBQuery : TpFIBQuery;
  begin
    v_STUDYUID := Trim(AParam.Values['STUDYUID']);
    v_act := Trim(AParam.Values['act']);
    try
      SetActToStudy ( DB1, trWrite1, StrToInt(v_act), v_studyuid );
      ResultHtmlDoc.Add( '0' );
    except
      on e:Exception do
            ResultHtmlDoc.Add(E.ClassName+' '+E.Message);
    end;
  end;
  procedure ReturnDELTEMPL(AParam, ResultHtmlDoc: TStrings);
    var v_id, v_studyuid, v_ui : string;
      v_userid, v_id_int : Integer;
      FIBQuery : TpFIBQuery;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
  begin
    v_id := Trim(AParam.Values['id']);
    if Trim(v_id)='' then v_id:='0';
    try
      v_id_int:=StrToInt(v_id);
    except
      v_id_int:=0;
    end;
    //
    if (v_id_int>0) then
    begin
      if v_isPostgres then
      begin
        v_PGconn := DB_CMN.PgConnCrt;
        v_PGTrans := PGTransCreate (v_PGconn) ;
        v_PGTrans.DefaultConnection:=v_PGconn;
        try
          if v_PGconn<>nil then
            if v_PGconn.Connected then
            begin
              v_UniQr := TUniQuery.Create(nil);
              try
                v_UniQr.Connection:=v_PGconn;
                v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
                v_UniQr.SQL.Text := 'update '+v_pg_schema+
                  '.templates set fn_is_del=1 where fk_id=:p_fk_id';
                v_UniQr.ParamByName('p_FK_ID').AsInteger:=v_id_int;
                try
                  v_UniQr.ExecSQL;
                  ResultHtmlDoc.Add( '0' );
                except
                  on e:Exception do
                    ResultHtmlDoc.Add(E.ClassName+' '+E.Message);
                end;
              finally
                v_UniQr.Close;
                v_UniQr.Free;
              end;
            end else
              logs_writes( 'ERROR : not connected to PostgreSQL');
        finally
          DB_CMN.PgFree(v_PGconn,v_PGTrans);
        end;

      end else begin
        FIBQuery := TpFIBQuery.Create(nil);
        FIBQuery.Database := DB1;
        try
          FIBQuery.Transaction := trWrite1;
          FIBQuery.SQL.Text := 'UPDATE TEMPLATES set FN_IS_DEL=1 where FK_ID=:p_FK_ID';
          FIBQuery.ParamByName('p_FK_ID').AsInteger:=v_id_int;
          try
            FIBQuery.ExecQuery;
            ResultHtmlDoc.Add( '0' );
          except
            on e:Exception do
              ResultHtmlDoc.Add(E.ClassName+' '+E.Message);
          end;
        finally
          FreeAndNil(FIBQuery);
        end;
      end;
    end else
      ResultHtmlDoc.Add( '-1' );
  end;
  procedure ReturnADDUSER(AParam, ResultHtmlDoc: TStrings);
    var v_id, v_FC_PSW,
        v_FAM, v_IM, v_OT, v_FIRMA, v_DOLJN,
        v_USLUGI, v_SPEC, v_CR, v_DX, v_IO, v_MR,
        v_OTCH, v_RF, v_SC, v_XA, v_CT, v_ES, v_MG, v_NM,
        v_PX, v_RG, v_US, v_XC,
        v_SR, v_ECG,
        v_isqr, v_ISCONCL, v_LOGIN : string;
      v_id_int : Integer;
      FIBQuery, qGrant : TpFIBQuery;
      v_sql_str : AnsiString;
      ss : TpFIBSecurityService;
      v_is_add_user : Boolean;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
    function gt_myint ( p_nn : string ) : integer;
    var v_res : Integer; v_nn:string;
    begin
      v_nn:=Trim(p_nn);
      if Trim(v_nn)='' then v_nn:='0';     
      try
        v_res:=StrToInt(v_nn);
      except
        v_res:=0;
      end;
      Result:=v_res;
    end;  
  begin
    v_id := Trim(AParam.Values['id']);
    if Trim(v_id)='' then v_id:='0';    
    try
      v_id_int:=StrToInt(v_id);
    except
      v_id_int:=0;
    end;
    v_FAM := fStrNorm( Utf8ToAnsi(Trim(AParam.Values['FAM'])) );
		v_IM := fStrNorm( Utf8ToAnsi(Trim(AParam.Values['IM'])) );
		v_OTCH := fStrNorm( Utf8ToAnsi(Trim(AParam.Values['OTCH'])) );
		v_FIRMA := fStrNorm( Utf8ToAnsi(Trim(AParam.Values['FIRMA'])) );
		v_DOLJN := fStrNorm( Utf8ToAnsi(Trim(AParam.Values['DOLJN'])) );
		v_USLUGI := fStrNorm( Utf8ToAnsi(Trim(AParam.Values['USLUGI'])) );
		v_SPEC := fStrNorm( Utf8ToAnsi(Trim(AParam.Values['SPEC'])) );
		v_CR := Trim(AParam.Values['CR']);
		v_DX := Trim(AParam.Values['DX']);
		v_IO := Trim(AParam.Values['IO']);
		v_MR := Trim(AParam.Values['MR']);
		v_OT := Trim(AParam.Values['OT']);
		v_RF := Trim(AParam.Values['RF']);
		v_SC := Trim(AParam.Values['SC']);
		v_XA := Trim(AParam.Values['XA']);
		v_CT := Trim(AParam.Values['CT']);
		v_ES := Trim(AParam.Values['ES']);
		v_MG := Trim(AParam.Values['MG']);
		v_NM := Trim(AParam.Values['NM']);
		v_PX := Trim(AParam.Values['PX']);
		v_RG := Trim(AParam.Values['RG']);
		v_US := Trim(AParam.Values['US']);
		v_XC := Trim(AParam.Values['XC']);
	//	v_SR := Trim(AParam.Values['SR']);
	//	v_ECG := Trim(AParam.Values['ECG']);
		v_isqr := Trim(AParam.Values['isqr']);
		v_ISCONCL := Trim(AParam.Values['ISCONCL']);
    v_LOGIN := Trim(AParam.Values['LOGIN']);
    v_FC_PSW := Trim(AParam.Values['FC_PSW']);
    if v_id_int=-1 then
    begin
      v_sql_str := 'insert into users (FC_FAM, FC_IM, '+
                  'FC_OTCH, FN_ISWADO, FN_ISQUERIES, FN_ISCONCL, '+
                  'FC_FIRMA, FC_DOLJN, FC_USLUGI, FC_SPECIALIZATIONS, '+
                  'FN_CR, FN_DX, FN_IO, FN_MR, FN_OT, FN_SC, FN_XA, FN_CT, '+
                  'FN_ES, FN_MG, FN_NM, FN_PX, FN_RG, FN_US, FN_XC, FN_RF, FC_LOGIN)  '+
                  'values ( :p_FC_FAM, :p_FC_IM, '+
                  ':p_FC_OTCH, :p_FN_ISWADO, :p_FN_ISQUERIES, :p_FN_ISCONCL, '+
                  ':p_FC_FIRMA, :p_FC_DOLJN, :p_FC_USLUGI, :p_FC_SPECIALIZATIONS, '+
                  ':p_FN_CR, :p_FN_DX, :p_FN_IO, :p_FN_MR, :p_FN_OT, :p_FN_SC, :p_FN_XA, :p_FN_CT, '+
                  ':p_FN_ES, :p_FN_MG, :p_FN_NM, :p_FN_PX, :p_FN_RG, :p_FN_US, :p_FN_XC, :p_FN_RF , :p_FC_LOGIN'+
                  ') RETURNING FK_ID';
    end else begin
      v_sql_str := 'update ###users set '+
                     ' fc_login = :p_fc_login, '+
                     ' fc_fam = :p_fc_fam, '+
                     ' fc_im = :p_fc_im,  '+
                     ' fc_otch = :p_fc_otch, '+
                     ' fn_iswado = :p_fn_iswado,  '+
                     ' fn_isqueries = :p_fn_isqueries,  '+
                     ' fn_isconcl = :p_fn_isconcl,  '+
                     ' fc_firma = :p_fc_firma,  '+
                     ' fc_doljn = :p_fc_doljn, '+
                     ' fc_uslugi = :p_fc_uslugi,  '+
                     ' fc_specializations = :p_fc_specializations, '+
                     ' fn_cr = :p_fn_cr,  '+
                     ' fn_dx = :p_fn_dx,  '+
                     ' fn_io = :p_fn_io,  '+
                     ' fn_mr = :p_fn_mr,  '+
                     ' fn_ot = :p_fn_ot,  '+
                     ' fn_sc = :p_fn_sc,  '+
                     ' fn_xa = :p_fn_xa,  '+
                     ' fn_ct = :p_fn_ct,  '+
                     ' fn_es = :p_fn_es,  '+
                     ' fn_mg = :p_fn_mg,  '+
                     ' fn_nm = :p_fn_nm,  '+
                     ' fn_px = :p_fn_px,  '+
                     ' fn_rg = :p_fn_rg,  '+
                     ' fn_us = :p_fn_us,  '+
                     ' fn_xc = :p_fn_xc,  '+
                     ' fn_rf = :p_fn_rf  '+
                   ' where fk_id=:p_id';
    end;
    if v_isPostgres then
    begin
      v_PGconn := DB_CMN.PgConnCrt;
      v_PGTrans := PGTransCreate (v_PGconn) ;
      v_PGTrans.DefaultConnection:=v_PGconn;
      try
        if v_PGconn<>nil then
          if v_PGconn.Connected then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
              v_UniQr.SQL.Text := StringReplace(v_sql_str,'###',v_pg_schema+'.',[rfReplaceAll, rfIgnoreCase]);

              v_UniQr.ParamByName('p_FC_LOGIN').AsString:=v_LOGIN;
              v_UniQr.ParamByName('p_FC_FAM').AsString:=v_FAM;
              v_UniQr.ParamByName('p_FC_IM').AsString:=v_IM;
              v_UniQr.ParamByName('p_FC_OTCH').AsString:=v_OTCH;
              v_UniQr.ParamByName('p_FN_ISWADO').AsInteger:=1;
              v_UniQr.ParamByName('p_FN_ISQUERIES').AsInteger:=gt_myint(v_isqr);
              v_UniQr.ParamByName('p_FN_ISCONCL').AsInteger:=gt_myint(v_ISCONCL);
              v_UniQr.ParamByName('p_FC_FIRMA').AsString:=v_FIRMA;
              v_UniQr.ParamByName('p_FC_DOLJN').AsString:=v_DOLJN;
              v_UniQr.ParamByName('p_FC_USLUGI').AsString:=v_USLUGI;
              v_UniQr.ParamByName('p_FC_SPECIALIZATIONS').AsString:=v_SPEC;
              v_UniQr.ParamByName('p_FN_CR').AsInteger:=gt_myint(v_CR);
              v_UniQr.ParamByName('p_FN_DX').AsInteger:=gt_myint(v_DX);
              v_UniQr.ParamByName('p_FN_IO').AsInteger:=gt_myint(v_IO);
              v_UniQr.ParamByName('p_FN_MR').AsInteger:=gt_myint(v_MR);
              v_UniQr.ParamByName('p_FN_OT').AsInteger:=gt_myint(v_OT);
              v_UniQr.ParamByName('p_FN_SC').AsInteger:=gt_myint(v_SC);
              v_UniQr.ParamByName('p_FN_XA').AsInteger:=gt_myint(v_XA);
              v_UniQr.ParamByName('p_FN_CT').AsInteger:=gt_myint(v_CT);
              v_UniQr.ParamByName('p_FN_ES').AsInteger:=gt_myint(v_ES);
              v_UniQr.ParamByName('p_FN_MG').AsInteger:=gt_myint(v_MG);
              v_UniQr.ParamByName('p_FN_NM').AsInteger:=gt_myint(v_NM);
              v_UniQr.ParamByName('p_FN_PX').AsInteger:=gt_myint(v_PX);
              v_UniQr.ParamByName('p_FN_RG').AsInteger:=gt_myint(v_RG);
              v_UniQr.ParamByName('p_FN_US').AsInteger:=gt_myint(v_US);
              v_UniQr.ParamByName('p_FN_XC').AsInteger:=gt_myint(v_XC);
              v_UniQr.ParamByName('p_FN_RF').AsInteger:=gt_myint(v_RF);
              //
              v_is_add_user := not (v_id_int>0);
              if v_id_int>0 then
                v_UniQr.ParamByName('p_ID').AsInteger:=v_id_int;
              try
                v_UniQr.ExecSQL;
                if v_id_int<0 then
                  v_id_int:=v_UniQr.FieldByName('FK_ID').AsInteger ;
                ResultHtmlDoc.Add( '0' );
              except
                on e:Exception do
                  ResultHtmlDoc.Add(E.ClassName+' '+E.Message);
              end;
            finally
              v_UniQr.Close;
              v_UniQr.Free;
            end;
          end else
            logs_writes( 'ERROR : not connected to PostgreSQL');
      finally
        DB_CMN.PgFree(v_PGconn,v_PGTrans);
      end;

    end else begin
      FIBQuery := TpFIBQuery.Create(nil);
      FIBQuery.Database := DB1;
      try
        FIBQuery.Transaction := trWrite1;
        FIBQuery.SQL.Text := StringReplace(v_sql_str,'###','',[rfReplaceAll, rfIgnoreCase]);
        //
        FIBQuery.ParamByName('p_FC_LOGIN').AsString:=v_LOGIN;
        FIBQuery.ParamByName('p_FC_FAM').AsString:=v_FAM;
        FIBQuery.ParamByName('p_FC_IM').AsString:=v_IM;
        FIBQuery.ParamByName('p_FC_OTCH').AsString:=v_OTCH;
        FIBQuery.ParamByName('p_FN_ISWADO').AsInteger:=1;
        FIBQuery.ParamByName('p_FN_ISQUERIES').AsInteger:=gt_myint(v_isqr);
        FIBQuery.ParamByName('p_FN_ISCONCL').AsInteger:=gt_myint(v_ISCONCL);
        FIBQuery.ParamByName('p_FC_FIRMA').AsString:=v_FIRMA;
        FIBQuery.ParamByName('p_FC_DOLJN').AsString:=v_DOLJN;
        FIBQuery.ParamByName('p_FC_USLUGI').AsString:=v_USLUGI;
        FIBQuery.ParamByName('p_FC_SPECIALIZATIONS').AsString:=v_SPEC;
        FIBQuery.ParamByName('p_FN_CR').AsInteger:=gt_myint(v_CR);
        FIBQuery.ParamByName('p_FN_DX').AsInteger:=gt_myint(v_DX);
        FIBQuery.ParamByName('p_FN_IO').AsInteger:=gt_myint(v_IO);
        FIBQuery.ParamByName('p_FN_MR').AsInteger:=gt_myint(v_MR);
        FIBQuery.ParamByName('p_FN_OT').AsInteger:=gt_myint(v_OT);
        FIBQuery.ParamByName('p_FN_SC').AsInteger:=gt_myint(v_SC);
        FIBQuery.ParamByName('p_FN_XA').AsInteger:=gt_myint(v_XA);
        FIBQuery.ParamByName('p_FN_CT').AsInteger:=gt_myint(v_CT);
        FIBQuery.ParamByName('p_FN_ES').AsInteger:=gt_myint(v_ES);
        FIBQuery.ParamByName('p_FN_MG').AsInteger:=gt_myint(v_MG);
        FIBQuery.ParamByName('p_FN_NM').AsInteger:=gt_myint(v_NM);
        FIBQuery.ParamByName('p_FN_PX').AsInteger:=gt_myint(v_PX);
        FIBQuery.ParamByName('p_FN_RG').AsInteger:=gt_myint(v_RG);
        FIBQuery.ParamByName('p_FN_US').AsInteger:=gt_myint(v_US);
        FIBQuery.ParamByName('p_FN_XC').AsInteger:=gt_myint(v_XC);
        FIBQuery.ParamByName('p_FN_RF').AsInteger:=gt_myint(v_RF);
        //
        v_is_add_user := not (v_id_int>0);
        if v_id_int>0 then
          FIBQuery.ParamByName('p_ID').AsInteger:=v_id_int;
        try
          FIBQuery.ExecQuery;
          if v_id_int<0 then
            v_id_int:=FIBQuery.FieldByName('FK_ID').AsInteger ;
          //-->> 2 С помощью Security Service изменяем пользователя
            try
                  ss := TpFIBSecurityService.Create(nil);
                  try
                    ss.LoginPrompt := False;
                    ss.Protocol := TCP;
                    ss.ServerName := 'localhost'; // устанавливаем IP-адрес к БД
                    ss.Params.Clear;
                    ss.Params.Add('user_name='+'sysdba');
                    ss.Params.Add('password='+'masterkey');
                    ss.UserName := v_LOGIN;
                    ss.Password := LeftStr(uMD5.MD5DigestToStr(MD5String(v_FC_PSW)),20);
                    ss.Active := True;
                    try
                      if v_is_add_user then begin
                        ss.AddUser; // метод управления пользователями в БД (добавление)
                      end else begin
                        ss.ModifyUser;
                      end;
                    except
                      on e: Exception do
                        logs_writes('Ошибка! '+#13+#10+e.Message);
                    end;
                    ss.Active := False;
                  finally
                    ss.Free;
                  end;
            except
              on e: Exception do
                logs_writes('Ошибка! '+#13+#10+e.Message);
            end;
            //
            if v_is_add_user then begin
              //-->> 2 Устанавливаем роль для созданного юзера
              qGrant := TpFIBQuery.Create(nil);
              try
                qGrant.Database := DB1;
                qGrant.Transaction := trWrite1;
                qGrant.Options :=  qGrant.Options + [qoAutoCommit];
                if trWrite1.Active = False then
                  trWrite1.Active := True;
                qGrant.Close;
                qGrant.SQL.Clear;
                qGrant.SQL.Add(' GRANT ROLE_USER TO '+v_LOGIN);
                try
                  qGrant.ExecQuery;
                except
                  on e: Exception do
                    begin
                      MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
                      Exit;
                    end;
                end;
              finally
                qGrant.Free;
              end;
            end;
          ResultHtmlDoc.Add( '0' );
        except
          on e:Exception do
            ResultHtmlDoc.Add(E.ClassName+' '+E.Message);
        end;
      finally
        FreeAndNil(FIBQuery);
      end;
    end;
  end;
  procedure ReturnDELUSER(AParam, ResultHtmlDoc: TStrings);
    var v_id : string;
      v_id_int : Integer;
      FIBQuery : TpFIBQuery;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
  begin
    v_id := Trim(AParam.Values['id']);
    if Trim(v_id)='' then v_id:='0';    
    try
      v_id_int:=StrToInt(v_id);
    except
      v_id_int:=0;
    end;
    //
    if (v_id_int>0) then
    begin
      if v_isPostgres then
      begin
        v_PGconn := DB_CMN.PgConnCrt;
        v_PGTrans := PGTransCreate (v_PGconn) ;
        v_PGTrans.DefaultConnection:=v_PGconn;
        try
          if v_PGconn<>nil then
            if v_PGconn.Connected then
            begin
              v_UniQr := TUniQuery.Create(nil);
              try
                v_UniQr.Connection:=v_PGconn;
                v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
                v_UniQr.SQL.Text := 'update '+v_pg_schema+'.users set fn_del=1 '+
                     ' where fk_id=:p_fk_id and (fn_del=0) and (fn_iswado=1)';
                v_UniQr.ParamByName('p_FK_ID').AsInteger:=v_id_int;
                try
                  v_UniQr.ExecSQL;
                  ResultHtmlDoc.Add( '0' );
                except
                  on e:Exception do
                    ResultHtmlDoc.Add(E.ClassName+' '+E.Message);
                end;
              finally
                v_UniQr.Close;
                v_UniQr.Free;
              end;
            end else
              logs_writes( 'ERROR : not connected to PostgreSQL');
        finally
          DB_CMN.PgFree(v_PGconn,v_PGTrans);
        end;

      end else begin
        FIBQuery := TpFIBQuery.Create(nil);
        FIBQuery.Database := DB1;
        try
          FIBQuery.Transaction := trWrite1;
          FIBQuery.SQL.Text := 'UPDATE users set FN_DEL=1 where FK_ID=:p_FK_ID and (fn_del=0) and (FN_ISWADO=1)';
          FIBQuery.ParamByName('p_FK_ID').AsInteger:=v_id_int;
          try
            FIBQuery.ExecQuery;
            ResultHtmlDoc.Add( '0' );
          except
            on e:Exception do
              ResultHtmlDoc.Add(E.ClassName+' '+E.Message);
          end;
        finally
          FreeAndNil(FIBQuery);
        end;
      end;
    end else
      ResultHtmlDoc.Add( '-1' );
  end;
  procedure ReturnDelConclusion(AParam, ResultHtmlDoc: TStrings);
    var v_id, v_studyuid, v_ui : string;
      v_userid, v_id_int : Integer;
      FIBQuery : TpFIBQuery;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
  begin
    v_studyuid := Trim(AParam.Values['studyuid']);
    v_ui := Trim(AParam.Values['ui']);
    try
      v_userid:=StrToInt(v_ui);
    except
      v_userid:=0;
    end;
    v_id := Trim(AParam.Values['id']);
    try
      v_id_int:=StrToInt(v_id);
    except
      v_id_int:=0;
    end;
    //
    if ((v_id_int>0) and (v_userid>=0) and (v_studyuid<>'')) then
    begin
      if v_isPostgres then
      begin
        v_PGconn := DB_CMN.PgConnCrt;
        v_PGTrans := PGTransCreate (v_PGconn) ;
        v_PGTrans.DefaultConnection:=v_PGconn;
        try
          if v_PGconn<>nil then
            if v_PGconn.Connected then
            begin
              v_UniQr := TUniQuery.Create(nil);
              try
                v_UniQr.Connection:=v_PGconn;
                v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
                v_UniQr.SQL.Text := 'delete from '+v_pg_schema+'.conclusions '+
                     ' where fk_id=:p_fk_id and fk_studyuid=:p_fk_studyuid';
                v_UniQr.ParamByName('p_FK_ID').AsInteger:=v_id_int;
             //   v_UniQr.ParamByName('p_FK_USERID').AsInteger:=v_userid;  and FK_USERID=:p_FK_USERID
                v_UniQr.ParamByName('p_FK_STUDYUID').AsString:=v_studyuid;
                try
                  v_UniQr.ExecSQL;
                  ResultHtmlDoc.Add( '0' );
                except
                  on e:Exception do
                    ResultHtmlDoc.Add(E.ClassName+' '+E.Message);
                end;
              finally
                v_UniQr.Close;
                v_UniQr.Free;
              end;
            end else
              logs_writes( 'ERROR : not connected to PostgreSQL');
        finally
          DB_CMN.PgFree(v_PGconn,v_PGTrans);
        end;

      end else begin
        FIBQuery := TpFIBQuery.Create(nil);
        FIBQuery.Database := DB1;
        try
          FIBQuery.Transaction := trWrite1;
          FIBQuery.SQL.Text := 'delete from conclusions where fk_id=:p_fk_id and fk_studyuid=:p_fk_studyuid';
          FIBQuery.ParamByName('p_FK_ID').AsInteger:=v_id_int;
       //   FIBQuery.ParamByName('p_FK_USERID').AsInteger:=v_userid;  and FK_USERID=:p_FK_USERID
          FIBQuery.ParamByName('p_FK_STUDYUID').AsString:=v_studyuid;
          try
            FIBQuery.ExecQuery;
            ResultHtmlDoc.Add( '0' );
          except
            on e:Exception do
              ResultHtmlDoc.Add(E.ClassName+' '+E.Message);
          end;
        finally
          FreeAndNil(FIBQuery);
        end;
      end;
    end else
      ResultHtmlDoc.Add( '-1' );
  end;
  procedure ReturnFullMODTemplate(AParam, ResultHtmlDoc: TStrings);
  var v_mod   : string;
      i : Integer;
      FIBDataSet : TpFIBDataSet;
      v_filename: ansistring ;
      v_strlst : TStringList;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
  begin
    v_mod:=AParam.Values['MOD'];
    v_filename := ExtractFilePath(paramstr(0))+'f'+IntToStr(gettickcount)+'.tmp';
    if v_isPostgres then
    begin
      v_PGconn := DB_CMN.PgConnCrt;
      v_PGTrans := PGTransCreate (v_PGconn) ;
      v_PGTrans.DefaultConnection:=v_PGconn;
      v_strlst := TStringList.Create;
      try
        if v_PGconn<>nil then
          if v_PGconn.Connected then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
              v_UniQr.SQL.Text := 'select fc_notes from '+v_pg_schema+'.templates '+
                  ' where studies_image_type=:p_studies_image_type ';
              v_UniQr.ParamByName('p_STUDIES_IMAGE_TYPE').AsString:=v_mod;
              v_UniQr.Open;
              if not v_UniQr.Eof then
              begin
                if not v_UniQr.FieldByName('FC_NOTES').IsNull then
                begin
                  TBlobField(v_UniQr.FieldByName('FC_NOTES')).SaveToFile(v_filename);
                  v_strlst.LoadFromFile(v_filename);
                  for I := 0 to v_strlst.Count - 1 do
                    ResultHtmlDoc.Add( v_strlst[i] );
        //            ResultHtmlDoc.Add( AnsiToUtf8( v_strlst[i] ) );
                end else
                  ResultHtmlDoc.Add(' ');
              end else ResultHtmlDoc.Add(' ');
            finally
              v_UniQr.Close;
              v_UniQr.Free;
            end;
          end else
            logs_writes( 'ERROR : not connected to PostgreSQL');
      finally
        DB_CMN.PgFree(v_PGconn,v_PGTrans);
        v_strlst.Free;
        if FileExists(v_filename) then
          try
            DeleteFile(v_filename);
          except
          end;
      end;

    end else begin
      FIBDataSet := TpFIBDataSet.Create(nil);
      FIBDataSet.Database := DB1;
      v_strlst := TStringList.Create;
      try
        FIBDataSet.Transaction := trRead1;
        FIBDataSet.SQLs.SelectSQL.Text := 'select FC_NOTES from TEMPLATES where STUDIES_IMAGE_TYPE=:p_STUDIES_IMAGE_TYPE ';
        FIBDataSet.ParamByName('p_STUDIES_IMAGE_TYPE').AsString:=v_mod;
        FIBDataSet.Open;
        if not FIBDataSet.Eof then
        begin
          if not FIBDataSet.FieldByName('FC_NOTES').IsNull then
          begin
            TBlobField(FIBDataSet.FieldByName('FC_NOTES')).SaveToFile(v_filename);
            v_strlst.LoadFromFile(v_filename);
            for I := 0 to v_strlst.Count - 1 do
              ResultHtmlDoc.Add( v_strlst[i] );
  //            ResultHtmlDoc.Add( AnsiToUtf8( v_strlst[i] ) );
          end else
            ResultHtmlDoc.Add(' ');
        end else ResultHtmlDoc.Add(' ');
        FIBDataSet.Close;
      finally
        FreeAndNil(FIBDataSet);
        v_strlst.Free;
        if FileExists(v_filename) then
          try
            DeleteFile(v_filename);
          except
          end;
      end;
    end;
  end;
  procedure ReturnFullTemplate(AParam, ResultHtmlDoc: TStrings);
  var v_id   : string;
      v_id_tmp, i : Integer;
      FIBDataSet : TpFIBDataSet;
      v_filename: ansistring ;
      v_strlst : TStringList;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
  begin
    v_id:=AParam.Values['id'];
    if v_id='' then v_id:='0';
    try
      v_id_tmp:=StrToInt(v_id);
    except
      v_id_tmp:=0;
    end;
    v_filename := ExtractFilePath(paramstr(0))+'f'+IntToStr(gettickcount)+'.tmp';
    if v_isPostgres then
    begin
      v_PGconn := DB_CMN.PgConnCrt;
      v_PGTrans := PGTransCreate (v_PGconn) ;
      v_PGTrans.DefaultConnection:=v_PGconn;
      v_strlst := TStringList.Create;
      try
        if v_PGconn<>nil then
          if v_PGconn.Connected then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
              v_UniQr.SQL.Text := 'select fc_notes from '+v_pg_schema+'.templates where fk_id=:p_fk_id ';
              v_UniQr.ParamByName('p_FK_ID').AsInteger:=v_id_tmp;
              try
                v_UniQr.Open;
              except
              on e:Exception do
                logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
              end;
              if not v_UniQr.Eof then
              begin
                if not v_UniQr.FieldByName('FC_NOTES').IsNull then
                begin
                  TBlobField(v_UniQr.FieldByName('FC_NOTES')).SaveToFile(v_filename);
                  v_strlst.LoadFromFile(v_filename);
                  for I := 0 to v_strlst.Count - 1 do
                    ResultHtmlDoc.Add( v_strlst[i] );
        //            ResultHtmlDoc.Add( AnsiToUtf8( v_strlst[i] ) );
                end else
                  ResultHtmlDoc.Add(' ');
              end;
            finally
              v_UniQr.Close;
              v_UniQr.Free;
            end;
          end else
            logs_writes( 'ERROR : not connected to PostgreSQL');
      finally
        DB_CMN.PgFree(v_PGconn,v_PGTrans);
        v_strlst.Free;
        if FileExists(v_filename) then
          try
            DeleteFile(v_filename);
          except
          end;
      end;

    end else begin
      FIBDataSet := TpFIBDataSet.Create(nil);
      FIBDataSet.Database := DB1;
      v_strlst := TStringList.Create;
      try
        FIBDataSet.Transaction := trRead1;
        FIBDataSet.SQLs.SelectSQL.Text := 'select FC_NOTES from TEMPLATES where FK_ID=:p_FK_ID ';
        FIBDataSet.ParamByName('p_FK_ID').AsInteger:=v_id_tmp;
        FIBDataSet.Open;
        if not FIBDataSet.Eof then
        begin
          if not FIBDataSet.FieldByName('FC_NOTES').IsNull then
          begin
            TBlobField(FIBDataSet.FieldByName('FC_NOTES')).SaveToFile(v_filename);
            v_strlst.LoadFromFile(v_filename);
            for I := 0 to v_strlst.Count - 1 do
              ResultHtmlDoc.Add( v_strlst[i] );
  //            ResultHtmlDoc.Add( AnsiToUtf8( v_strlst[i] ) );
          end else
            ResultHtmlDoc.Add(' ');
        end;
        FIBDataSet.Close;
      finally
        FreeAndNil(FIBDataSet);
        v_strlst.Free;
        if FileExists(v_filename) then
          try
            DeleteFile(v_filename);
          except
          end;
      end;
    end;
  end;
  procedure ReturnFullConclusion(AParam, ResultHtmlDoc: TStrings);
  var v_id, v_studyuid   : string;
      v_id_tmp, i : Integer;
      FIBDataSet : TpFIBDataSet;
      v_filename: ansistring ;
      v_strlst : TStringList;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
  begin
    v_id:=AParam.Values['id'];
    v_studyuid:=AParam.Values['studyuid'];
    if v_id='' then v_id:='0';
    try
      v_id_tmp:=StrToInt(v_id);
    except
      v_id_tmp:=0;
    end;
    v_filename := ExtractFilePath(paramstr(0))+'f'+IntToStr(gettickcount)+'.tmp';
    if v_isPostgres then
    begin
      v_PGconn := DB_CMN.PgConnCrt;
      v_PGTrans := PGTransCreate (v_PGconn) ;
      v_PGTrans.DefaultConnection:=v_PGconn;
      v_strlst := TStringList.Create;
      try
        if v_PGconn<>nil then
          if v_PGconn.Connected then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
              v_UniQr.SQL.Text := 'select fc_notes from '+v_pg_schema+'.conclusions '+
                  ' where fk_id=:p_fk_id and fk_studyuid=:p_fk_studyuid';
              v_UniQr.ParamByName('p_FK_ID').AsInteger:=v_id_tmp;
              v_UniQr.ParamByName('p_FK_STUDYUID').AsString:=v_studyuid;
              try
                v_UniQr.Open;
              except
              on e:Exception do
                logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
              end;
              if not v_UniQr.Eof then
              begin
                if not v_UniQr.FieldByName('FC_NOTES').IsNull then
                begin
                  TBlobField(v_UniQr.FieldByName('FC_NOTES')).SaveToFile(v_filename);
                  v_strlst.LoadFromFile(v_filename);
                  for I := 0 to v_strlst.Count - 1 do
                    ResultHtmlDoc.Add( v_strlst[i] );
        //            ResultHtmlDoc.Add( AnsiToUtf8( v_strlst[i] ) );
                end else
                  ResultHtmlDoc.Add(' ');
              end;
            finally
              v_UniQr.Close;
              v_UniQr.Free;
            end;
          end else
            logs_writes( 'ERROR : not connected to PostgreSQL');
      finally
        DB_CMN.PgFree(v_PGconn,v_PGTrans);
        v_strlst.Free;
        if FileExists(v_filename) then
          try
            DeleteFile(v_filename);
          except
          end;
      end;

    end else begin
      FIBDataSet := TpFIBDataSet.Create(nil);
      FIBDataSet.Database := DB1;
      v_strlst := TStringList.Create;
      try
        FIBDataSet.Transaction := trRead1;
        FIBDataSet.SQLs.SelectSQL.Text := 'select FC_NOTES from CONCLUSIONS where FK_ID=:p_FK_ID and FK_STUDYUID=:p_FK_STUDYUID';
        FIBDataSet.ParamByName('p_FK_ID').AsInteger:=v_id_tmp;
        FIBDataSet.ParamByName('p_FK_STUDYUID').AsString:=v_studyuid;
        FIBDataSet.Open;
        if not FIBDataSet.Eof then
        begin
          if not FIBDataSet.FieldByName('FC_NOTES').IsNull then
          begin
            TBlobField(FIBDataSet.FieldByName('FC_NOTES')).SaveToFile(v_filename);
            v_strlst.LoadFromFile(v_filename);
            for I := 0 to v_strlst.Count - 1 do
              ResultHtmlDoc.Add( v_strlst[i] );
  //            ResultHtmlDoc.Add( AnsiToUtf8( v_strlst[i] ) );
          end else
            ResultHtmlDoc.Add(' ');
        end;
        FIBDataSet.Close;
      finally
        FreeAndNil(FIBDataSet);
        v_strlst.Free;
        if FileExists(v_filename) then
          try
            DeleteFile(v_filename);
          except
          end;
      end;
    end;
  end;
  procedure ReturnCONCLUSIONSList(AParam, ResultHtmlDoc: TStrings);
  var v_filename ,
    v_http_path : AnsiString;
    v_resHTML : TStringList;
    i : Integer;
    v_user, v_password, v_studyuid, v_mod : string;
    v_is_sysdba : Boolean;
    FIBQuery : TpFIBQuery;
    v_ISQUERIES, v_ISCONCL   : Integer;
    v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
  const c_file = 'conclusions.html';
  procedure cmn_fpart1;
  label l1;
  begin
    v_http_path:='http://' + v_GetLocalHostName + ':' +IntToStr(WADOServerCore1.ServerPort)+'/';
    v_filename := v_filepath+c_file;
    if FileExists(v_filename) then
    begin
      v_resHTML := TStringList.Create;
      try
        v_resHTML.LoadFromFile(v_filename);
        i:=0;
        l1:
        while I <= (v_resHTML.Count-1) do
        begin
          // проверим наличие шаблонов
          if Pos(c_tmpl,v_resHTML[i])>0 then
          begin
            TmplIns( v_resHTML[i], ResultHtmlDoc );
            Inc(i);
            goto l1;
          end;
          //
          if Pos(c_BEGIN_DEBUG,v_resHTML[i])>0 then
          begin
            // пропускаем отладочные операторы
            while ((Pos(c_END_DEBUG,v_resHTML[i])<=0) and (I <= (v_resHTML.Count-1))) do
              Inc(i);
            ResultHtmlDoc.Add('var v_url = "'+v_http_path+'";');
            ResultHtmlDoc.Add('var v_ui = "'+
               inttostr(gt_user_code(DB1,trRead1,v_user,v_fam,v_nam,v_surn, v_ISQUERIES, v_ISCONCL))+'";');
            ResultHtmlDoc.Add('var v_up = "'+AParam.Values['fld2']+'";');
            ResultHtmlDoc.Add('var v_un = "'+AParam.Values['fld1']+'";');
            ResultHtmlDoc.Add('var v_username = "'+v_user+'";');
            ResultHtmlDoc.Add('var v_fam = "'+AnsiToUtf8(v_fam)+'";');
            ResultHtmlDoc.Add('var v_nam = "'+AnsiToUtf8(v_nam)+'";');
            ResultHtmlDoc.Add('var v_surn = "'+AnsiToUtf8(v_surn)+'";');
            ResultHtmlDoc.Add('var v_main_studyuid ="'+v_studyuid+'";');
            ResultHtmlDoc.Add('var v_mod='''+v_mod+'''');
            ResultHtmlDoc.Add('var v_ISQUERIES='+inttostr(v_ISQUERIES)+';');
            ResultHtmlDoc.Add('var v_ISCONCL='+inttostr(v_ISCONCL)+';');
            if v_is_sysdba then
              ResultHtmlDoc.Add('var v_adm=1;')
            else
              ResultHtmlDoc.Add('var v_adm=0;');
          end;
          ResultHtmlDoc.Add(v_resHTML[i]);
          Inc(i);
        end;
      finally
        v_resHTML.Free;
      end;
    end else
    begin
      ResultHtmlDoc.Add(c_not_found);
      logs_writes('File '+v_filename+' not found');
    end;
  end;
  begin
    v_studyuid := Trim(AParam.Values['STUDYUID']);
    if chkUserPsw(AParam,v_user,v_password) then
      ResultHtmlDoc.Add('-1')
    else
    begin
      if v_isPostgres then
      begin
        v_PGconn := DB_CMN.PgConnCrt;
        v_PGTrans := PGTransCreate (v_PGconn) ;
        v_PGTrans.DefaultConnection:=v_PGconn;
        try
          if v_PGconn<>nil then
            if v_PGconn.Connected then
            begin
              v_UniQr := TUniQuery.Create(nil);
              try
                v_UniQr.Connection:=v_PGconn;
                v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
                v_mod:='';
                v_UniQr.SQL.Text := 'select s.studies_image_type from '+v_pg_schema+'.studies s '+
                     ' where s.studyuid=:p_studyuid';
                v_UniQr.ParamByName('p_studyuid').AsString:=v_studyuid;
                try
                  v_UniQr.Open;
                except
                on e:Exception do
                  logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
                end;
                if not v_UniQr.Eof then
                  v_mod:=Trim(v_UniQr.FieldByName('STUDIES_IMAGE_TYPE').AsString);
              finally
                v_UniQr.Close;
                v_UniQr.Free;
              end;
            end else
              logs_writes( 'ERROR : not connected to PostgreSQL');
        finally
          DB_CMN.PgFree(v_PGconn,v_PGTrans);
        end;
        // -----------------------------------------------------------------------
        cmn_fpart1;
      end else begin
        DB1:= TpFIBDatabase.Create(nil);
        trRead1:= TpFIBTransaction.Create(nil);
        if setConnectCMN ( v_user,
                           v_password,
                           v_ip_fb,
                           DB1,
                           trRead1,
                           v_is_sysdba,
                           ResultHtmlDoc
                         ) then
        begin
          // получение модальности
          v_mod:='';
          FIBQuery := TpFIBQuery.Create(nil);
          FIBQuery.Database := DB1;
          try
            FIBQuery.Transaction := trRead1;
            FIBQuery.SQL.Text :=
              'SELECT s.STUDIES_IMAGE_TYPE FROM STUDIES s where s.studyuid=:p_studyuid';
            FIBQuery.ParamByName('p_studyuid').AsString:=v_studyuid;
            FIBQuery.ExecQuery;
            if not FIBQuery.Eof then
              v_mod:=Trim(FIBQuery.FieldByName('STUDIES_IMAGE_TYPE').AsString);
          finally
            FIBQuery.Close;
            FreeAndNil(FIBQuery);
          end;
        end;
        //
        try
          // -----------------------------------------------------------------------
          cmn_fpart1;
        finally
          MyEndTrans(trRead1);
          MyDBDisconnect(DB1);
          trRead1.Free;
          DB1.Free;
        end;
      end;
    end;
  end;
  function strtransf( p_val:string ):string;
  begin
    if Length(p_val)=1 then
    begin
      Result:='0'+p_val;
    end else
    begin
      Result:=p_val;
    end;
    
  end;
  procedure ReturnJQRCONCLLst(AParam, ResultHtmlDoc: TStrings);
  var contentType,
      sql1,
      v_studyuid,
      v_ui  : string;
      FIBDataSet : TpFIBDataSet;
      v_frm_str: ansistring ;
      v_i : integer;
      v_dt : TDateTime;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
  const c_amm = 100;
  begin
    contentType := AParam.Values['contentType'];
    v_studyuid    := AParam.Values['studyuid'];
    v_ui          := AParam.Values['ui'];
    sql1 := 'select c.fk_id,c.fd_date,c.fk_userid, '
            +' coalesce(u.fc_fam,''sysdba'') as fc_fam,'
            +' coalesce(u.fc_im,'''') as fc_im,'
            +' coalesce(u.fc_otch,'''') as fc_otch '
            +' from ###conclusions c left join ###users u '
            +' on u.fk_id=c.fk_userid where fk_studyuid=:p_fk_studyuid '
            +' order by fk_id desc ' ;
    if v_isPostgres then
    begin
      v_PGconn := DB_CMN.PgConnCrt;
      v_PGTrans := PGTransCreate (v_PGconn) ;
      v_PGTrans.DefaultConnection:=v_PGconn;
      try
        if v_PGconn<>nil then
          if v_PGconn.Connected then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
              v_UniQr.SQL.Text := StringReplace(sql1,'###',v_pg_schema+'.',[rfReplaceAll, rfIgnoreCase]);
              v_UniQr.ParamByName('p_FK_STUDYUID').AsString:=v_studyuid;
              //
              v_UniQr.Open;
              v_frm_str := '';
              v_i:=0;
              logs_writes('Запрос '+sql1+#13+'p_FK_STUDYUID='+v_studyuid);
              while not v_UniQr.Eof do
              begin        // формируем строку с массивом а-ля JSON
                Inc(v_i);
                v_dt:=v_UniQr.FieldByName('FD_DATE').AsDateTime;
                v_frm_str:= v_frm_str +
                   IntToStr(v_UniQr.FieldByName('FK_ID').AsInteger)+'<;>'+
                   DateToStr(v_dt)+' '+
                        strtransf(IntToStr(Hourof(v_dt)))+':'+
                        strtransf(IntToStr(Minuteof(v_dt)))+'<;>'+
                   IntToStr(v_UniQr.FieldByName('FK_USERID').AsInteger)+'<;>'+
                   v_UniQr.FieldByName('FC_FAM').AsString+'<;>'+
                   v_UniQr.FieldByName('FC_IM').AsString+'<;>'+
                   v_UniQr.FieldByName('FC_OTCH').AsString+
                   '<|>';
                if (v_i>c_amm) then Break;
                v_UniQr.Next;
              end;
              v_frm_str := Copy(v_frm_str,1,Length(v_frm_str)-3);
              v_UniQr.Close;
              logs_writes('Результат:'+#13+v_frm_str);
              ResultHtmlDoc.Add( AnsiToUtf8(v_frm_str) );
            finally
              v_UniQr.Close;
              v_UniQr.Free;
            end;
          end else
            logs_writes( 'ERROR : not connected to PostgreSQL');
      finally
        DB_CMN.PgFree(v_PGconn,v_PGTrans);
      end;

    end else begin
      FIBDataSet := TpFIBDataSet.Create(nil);
      FIBDataSet.Database := DB1;
      try
        FIBDataSet.Transaction := trRead1;
        FIBDataSet.SQLs.SelectSQL.Text := StringReplace(sql1,'###','',[rfReplaceAll, rfIgnoreCase]);
        FIBDataSet.ParamByName('p_FK_STUDYUID').AsString:=v_studyuid;
        //
        FIBDataSet.Open;
        v_frm_str := '';
        v_i:=0;
        logs_writes('Запрос '+sql1+#13+'p_FK_STUDYUID='+v_studyuid);
        while not FIBDataSet.Eof do
        begin        // формируем строку с массивом а-ля JSON
          Inc(v_i);
          v_dt:=FIBDataSet.FieldByName('FD_DATE').AsDateTime;
          v_frm_str:= v_frm_str +
             IntToStr(FIBDataSet.FieldByName('FK_ID').AsInteger)+'<;>'+
             DateToStr(v_dt)+' '+
                  strtransf(IntToStr(Hourof(v_dt)))+':'+
                  strtransf(IntToStr(Minuteof(v_dt)))+'<;>'+
             IntToStr(FIBDataSet.FieldByName('FK_USERID').AsInteger)+'<;>'+
             FIBDataSet.FieldByName('FC_FAM').AsString+'<;>'+
             FIBDataSet.FieldByName('FC_IM').AsString+'<;>'+
             FIBDataSet.FieldByName('FC_OTCH').AsString+
             '<|>';
          if (v_i>c_amm) then Break;
          FIBDataSet.Next;
        end;
        v_frm_str := Copy(v_frm_str,1,Length(v_frm_str)-3);
        FIBDataSet.Close;
        logs_writes('Результат:'+#13+v_frm_str);
        ResultHtmlDoc.Add( AnsiToUtf8(v_frm_str) );
      finally
        FreeAndNil(FIBDataSet);
      end;
    end;
  end;
  procedure ReturnCONCLLIST(AParam, ResultHtmlDoc: TStrings);
  var v_filename ,
    v_http_path,
    v_str_tmp : AnsiString;
    v_resHTML : TStringList;
    i : Integer;
    v_user, v_password : string;
    v_is_sysdba:Boolean;
    v_ISQUERIES, v_ISCONCL   : Integer;
  const c_file = 'conclusions.html';
  begin
    if chkUserPsw(AParam,v_user,v_password) then
      ResultHtmlDoc.Add('-1')
    else
    begin
      DB1:= TpFIBDatabase.Create(nil);
      trRead1:= TpFIBTransaction.Create(nil);
      DB1.DefaultTransaction := trRead1;
      trRead1.DefaultDatabase := DB1;

      if setConnectCMN ( v_user,
                         v_password,
                         v_ip_fb,
                         DB1,
                         trRead1,
                         v_is_sysdba,
                         ResultHtmlDoc
                       ) then
      begin
        try
          // -----------------------------------------------------------------------
          v_http_path:='http://' + v_GetLocalHostName + ':' +IntToStr(WADOServerCore1.ServerPort)+'/';
          v_filename := v_filepath+c_file;
          if FileExists(v_filename) then
          begin
            v_resHTML := TStringList.Create;
            try
              v_resHTML.LoadFromFile(v_filename);
              i:=0;
              while I <= (v_resHTML.Count-1) do
              begin
                v_str_tmp:=v_resHTML[i];
                if Pos(c_BEGIN_DEBUG,v_resHTML[i])>0 then
                begin
                  // пропускаем отладочные операторы
                  while ((Pos(c_END_DEBUG,v_resHTML[i])<=0) and (I <= (v_resHTML.Count-1))) do
                    Inc(i);
                  ResultHtmlDoc.Add('var v_url = "'+v_http_path+'";');
                  ResultHtmlDoc.Add('var v_ui = "'+
                     inttostr(gt_user_code(DB1,trRead1,v_user,v_fam,v_nam,v_surn, v_ISQUERIES, v_ISCONCL))+'";');
                  ResultHtmlDoc.Add('var v_up = "'+AParam.Values['fld2']+'";');
                  ResultHtmlDoc.Add('var v_un = "'+AParam.Values['fld1']+'";');
                  ResultHtmlDoc.Add('var v_username = "'+v_user+'";');
                  ResultHtmlDoc.Add('var v_fam = "'+AnsiToUtf8(v_fam)+'";');
                  ResultHtmlDoc.Add('var v_nam = "'+AnsiToUtf8(v_nam)+'";');
                  ResultHtmlDoc.Add('var v_surn = "'+AnsiToUtf8(v_surn)+'";');
                  ResultHtmlDoc.Add('var v_ISQUERIES='+inttostr(v_ISQUERIES)+';');
                  ResultHtmlDoc.Add('var v_ISCONCL='+inttostr(v_ISCONCL)+';');
                end;
                ResultHtmlDoc.Add(v_resHTML[i]);
                Inc(i);
              end;
            finally
              v_resHTML.Free;
            end;
          end else
          begin
            ResultHtmlDoc.Add(c_not_found);
            logs_writes('File '+v_filename+' not found');
          end;
        finally
          MyEndTrans(trRead1);
          MyDBDisconnect(DB1);
          trRead1.Free;
          DB1.Free;
        end;
      end;
    end;
  end;
  procedure ReturnWorkListForm(AParam, ResultHtmlDoc: TStrings);
  var v_filename ,
    v_http_path,
    v_str_tmp : AnsiString;
    v_resHTML : TStringList;
    i : Integer;
    v_user, v_password : string;
    v_is_sysdba : Boolean;
    v_ISQUERIES, v_ISCONCL   : Integer;
  const c_file = 'worklist.html';
  label l1;
  begin
    if chkUserPsw(AParam,v_user,v_password) then
      ResultHtmlDoc.Add('-1')
    else
    begin
      DB1:= TpFIBDatabase.Create(nil);
      trRead1:= TpFIBTransaction.Create(nil);
      DB1.DefaultTransaction := trRead1;
      trRead1.DefaultDatabase := DB1;

      if setConnectCMN ( v_user,
                         v_password,
                         v_ip_fb,
                         DB1,
                         trRead1,
                         v_is_sysdba,
                         ResultHtmlDoc
                       ) then
      begin
        try
          // -----------------------------------------------------------------------
          v_http_path:='http://' + v_GetLocalHostName + ':' +IntToStr(WADOServerCore1.ServerPort)+'/';
          v_filename := v_filepath+c_file;
          if FileExists(v_filename) then
          begin
            v_resHTML := TStringList.Create;
            try
              v_resHTML.LoadFromFile(v_filename);
              i:=0;
              l1:
              while I <= (v_resHTML.Count-1) do
              begin
                v_str_tmp:=v_resHTML[i];
                // проверим наличие шаблонов
                if Pos(c_tmpl,v_resHTML[i])>0 then
                begin
                  TmplIns( v_resHTML[i], ResultHtmlDoc );
                  Inc(i);
                  goto l1;
                end;
                //
                if Pos(c_BEGIN_DEBUG,v_resHTML[i])>0 then
                begin
                  // пропускаем отладочные операторы
                  while ((Pos(c_END_DEBUG,v_resHTML[i])<=0) and (I <= (v_resHTML.Count-1))) do
                    Inc(i);
                  ResultHtmlDoc.Add('var v_url = "'+v_http_path+'";');
                  ResultHtmlDoc.Add('var v_ui = "'+
                     inttostr(gt_user_code(DB1,trRead1,v_user,v_fam,v_nam,v_surn, v_ISQUERIES, v_ISCONCL))+'";');
                  ResultHtmlDoc.Add('var v_up = "'+AParam.Values['fld2']+'";');
                  ResultHtmlDoc.Add('var v_un = "'+AParam.Values['fld1']+'";');
                  ResultHtmlDoc.Add('var v_username = "'+v_user+'";');
                  ResultHtmlDoc.Add('var v_fam = "'+AnsiToUtf8(v_fam)+'";');
                  ResultHtmlDoc.Add('var v_nam = "'+AnsiToUtf8(v_nam)+'";');
                  ResultHtmlDoc.Add('var v_surn = "'+AnsiToUtf8(v_surn)+'";');
                  ResultHtmlDoc.Add('var v_ISQUERIES='+inttostr(v_ISQUERIES)+';');
                  ResultHtmlDoc.Add('var v_ISCONCL='+inttostr(v_ISCONCL)+';');
                  if v_is_sysdba then
                    ResultHtmlDoc.Add('var v_adm=1')
                  else
                    ResultHtmlDoc.Add('var v_adm=0');
                end;
                ResultHtmlDoc.Add(v_resHTML[i]);
                Inc(i);
              end;
            finally
              v_resHTML.Free;
            end;
          end else
          begin
            ResultHtmlDoc.Add(c_not_found);
            logs_writes('File '+v_filename+' not found');
          end;
        finally
          MyEndTrans(trRead1);
          MyDBDisconnect(DB1);
          trRead1.Free;
          DB1.Free;
        end;
      end;
    end;

  //  ResultHtmlDoc.SaveToFile('c:\1.html');

  end;
  procedure ReturnStudyList(AParam, ResultHtmlDoc: TStrings);
  var v_filename, v_http_path, v_str_tmp : AnsiString;
    v_resHTML : TStringList;
    v_user, v_password : string;
    v_is_sysdba : Boolean;
    i, v_ISQUERIES, v_ISCONCL   : Integer;
  const c_file = 'studylist.html';
  label l1;
  begin
    if chkUserPsw(AParam,v_user,v_password) then
      ResultHtmlDoc.Add('-1')
    else
    begin
      if v_isPostgres then
      begin
      end else begin
        DB1:= TpFIBDatabase.Create(nil);
        trRead1:= TpFIBTransaction.Create(nil);
        DB1.DefaultTransaction := trRead1;
        trRead1.DefaultDatabase := DB1;
      end;
      //
      if setConnectCMN ( v_user,
                         v_password,
                         v_ip_fb,
                         DB1,
                         trRead1,
                         v_is_sysdba,
                         ResultHtmlDoc
                       ) then
      begin
        try
          // -----------------------------------------------------------------------
          v_http_path:='http://' + v_GetLocalHostName + ':' +IntToStr(WADOServerCore1.ServerPort)+'/';
          v_filename := v_filepath+c_file;
          if FileExists(v_filename) then
          begin
            v_resHTML := TStringList.Create;
            try
              logs_writes('Load from file : '+v_filename );
              v_resHTML.LoadFromFile(v_filename);

              logs_writes('#1 загружено '+inttostr(v_resHTML.Count)+' строк');

              log_html_write(ResultHtmlDoc,'studylist json 1 : file = '+v_filename);
              logs_writes('загружено '+IntToStr(v_resHTML.Count)+' строк');
              i:=0;
              l1:
              logs_writes('перед while I <= (v_resHTML.Count-1) do | i='+inttostr(i));
              while I <= (v_resHTML.Count-1) do
              begin

                logs_writes('нашли строку '+inttostr(i)+' строка : '+v_resHTML[i]);

                v_str_tmp:=v_resHTML[i];
                // проверим наличие шаблонов
                if Pos(c_tmpl,v_resHTML[i])>0 then
                begin

                  logs_writes('нашли шаблон '+inttostr(ResultHtmlDoc.Count));

                  TmplIns( v_resHTML[i], ResultHtmlDoc );
                  Inc(i);
                  goto l1;
                end;
                //

                logs_writes('*** перед вставкой javascript : '+
                        'всего позиций max_pos='+inttostr(v_resHTML.Count)+
                        '     line  :   '+v_resHTML[i]
                        );

                if Pos(c_BEGIN_DEBUG,v_resHTML[i])>0 then
                begin

                  logs_writes('*** Перед вставкой шаблонов javascript (i='+inttostr(i)+'): '+v_resHTML[i] );
                  // пропускаем отладочные операторы
                  while ((Pos(c_END_DEBUG,v_resHTML[i])<=0) and (I <= (v_resHTML.Count-1))) do
                  begin
                    Inc(i);
                  end;

                  logs_writes('установлена позиция i='+inttostr(i)+' из - max_pos = '+inttostr(v_resHTML.Count));

                  ResultHtmlDoc.Add('var v_url = "'+v_http_path+'";');

                  logs_writes('## 1');

                  ResultHtmlDoc.Add('var v_ui = "'+
                     inttostr(gt_user_code(DB1,trRead1,v_user,v_fam,v_nam,v_surn, v_ISQUERIES, v_ISCONCL))+'";');

                  logs_writes('## 2');

                  ResultHtmlDoc.Add('var v_up = "'+AParam.Values['fld2']+'";');
                  ResultHtmlDoc.Add('var v_un = "'+AParam.Values['fld1']+'";');
                  ResultHtmlDoc.Add('var v_username = "'+v_user+'";');
                  ResultHtmlDoc.Add('var v_fam = "'+AnsiToUtf8(v_fam)+'";');
                  ResultHtmlDoc.Add('var v_nam = "'+AnsiToUtf8(v_nam)+'";');
                  ResultHtmlDoc.Add('var v_surn = "'+AnsiToUtf8(v_surn)+'";');
                  ResultHtmlDoc.Add('var v_ISQUERIES='+inttostr(v_ISQUERIES)+';');
                  ResultHtmlDoc.Add('var v_ISCONCL='+inttostr(v_ISCONCL)+';');
                  if v_is_sysdba then
                    ResultHtmlDoc.Add('var v_adm=1')
                  else
                    ResultHtmlDoc.Add('var v_adm=0');
                end;
                ResultHtmlDoc.Add(v_resHTML[i]);

                logs_writes('добавили строку '+v_resHTML[i]);

                Inc(i);
              end;
//              log_html_write(ResultHtmlDoc,'studylist json 2 ');
            finally
              v_resHTML.Free;
            end;

            logs_writes('#1 ok');

          end else
          begin
            ResultHtmlDoc.Add(c_not_found);
            logs_writes('File '+v_filename+' not found');
          end;
        finally

          logs_writes('#2 ok');

          log_html_write(ResultHtmlDoc,'studylist');
          if v_isPostgres then
          begin
          end else begin
            MyEndTrans(trRead1);
            MyDBDisconnect(DB1);
            trRead1.Free;
            DB1.Free;
          end;
        end;
      end;
    end;
  end;
  procedure ReturnLogin(AParam, ResultHtmlDoc: TStrings);
  var v_filename ,
    v_http_path,
    v_str_tmp : AnsiString;
    v_resHTML : TStringList;
    i : Integer;
  const c_file = 'login.html';
  label l1;
  begin
    v_http_path:='http://' + v_GetLocalHostName + ':' +IntToStr(WADOServerCore1.ServerPort)+'/';
    v_filename := v_filepath+c_file;
    if FileExists(v_filename) then
    begin
      v_resHTML := TStringList.Create;
      try
        v_resHTML.LoadFromFile(v_filename);
        i:=0;
        l1:
        while I <= (v_resHTML.Count-1) do
        begin
          v_str_tmp:=v_resHTML[i];
          // проверим наличие шаблонов
          if Pos(c_tmpl,v_resHTML[i])>0 then
          begin
            TmplIns( v_resHTML[i], ResultHtmlDoc );
            Inc(i);
            goto l1;
          end;
          if Pos(c_BEGIN_DEBUG,v_resHTML[i])>0 then
          begin
            // пропускаем отладочные операторы
            while ((Pos(c_END_DEBUG,v_resHTML[i])<=0) and (I <= (v_resHTML.Count-1))) do
              Inc(i);
            ResultHtmlDoc.Add('var v_url = "'+v_http_path+'";');
          end;
          ResultHtmlDoc.Add(v_resHTML[i]);
          Inc(i);
        end;
      finally
        v_resHTML.Free;
      end;
    end else
    begin
      ResultHtmlDoc.Add(c_not_found);
      logs_writes('File '+v_filename+' not found');
    end;
  end;
  procedure ReturnLPUHTML(AParam, ResultHtmlDoc: TStrings);
  var v_filename ,
    v_http_path : AnsiString;
    v_resHTML : TStringList;
    i : Integer;
    v_user, v_password : string;
    v_is_sysdba : Boolean;
    v_ISQUERIES, v_ISCONCL   : Integer;
  label l1;
  const c_file = 'HospitalList.html';
  begin
    if chkUserPsw(AParam,v_user,v_password) then
      ResultHtmlDoc.Add('-1')
    else
    begin
      DB1:= TpFIBDatabase.Create(nil);
      trRead1:= TpFIBTransaction.Create(nil);
      if setConnectCMN ( v_user,
                         v_password,
                         v_ip_fb,
                         DB1,
                         trRead1,
                         v_is_sysdba,
                         ResultHtmlDoc
                       ) then
      begin
        try
          // -----------------------------------------------------------------------
          v_http_path:='http://' + v_GetLocalHostName + ':' +IntToStr(WADOServerCore1.ServerPort)+'/';
          v_filename := v_filepath+c_file;
          if FileExists(v_filename) then
          begin
            v_resHTML := TStringList.Create;
            try
              v_resHTML.LoadFromFile(v_filename);
              i:=0;
              l1:
              while I <= (v_resHTML.Count-1) do
              begin
                // проверим наличие шаблонов
                if Pos(c_tmpl,v_resHTML[i])>0 then
                begin
                  TmplIns( v_resHTML[i], ResultHtmlDoc );
                  Inc(i);
                  goto l1;
                end;
                //
                if Pos(c_BEGIN_DEBUG,v_resHTML[i])>0 then
                begin
                  // пропускаем отладочные операторы
                  while ((Pos(c_END_DEBUG,v_resHTML[i])<=0) and (I <= (v_resHTML.Count-1))) do
                    Inc(i);
                  ResultHtmlDoc.Add('var v_url = "'+v_http_path+'";');
                  ResultHtmlDoc.Add('var v_ui = "'+
                     inttostr(gt_user_code(DB1,trRead1,v_user,v_fam,v_nam,v_surn, v_ISQUERIES, v_ISCONCL))+'";');
                  ResultHtmlDoc.Add('var v_up = "'+AParam.Values['fld2']+'";');
                  ResultHtmlDoc.Add('var v_un = "'+AParam.Values['fld1']+'";');
                  ResultHtmlDoc.Add('var v_username = "'+v_user+'";');
                  ResultHtmlDoc.Add('var v_fam = "'+AnsiToUtf8(v_fam)+'";');
                  ResultHtmlDoc.Add('var v_nam = "'+AnsiToUtf8(v_nam)+'";');
                  ResultHtmlDoc.Add('var v_surn = "'+AnsiToUtf8(v_surn)+'";');
                  ResultHtmlDoc.Add('var v_ISQUERIES='+inttostr(v_ISQUERIES)+';');
                  ResultHtmlDoc.Add('var v_ISCONCL='+inttostr(v_ISCONCL)+';');
                  if v_is_sysdba then
                    ResultHtmlDoc.Add('var v_adm=1')
                  else
                    ResultHtmlDoc.Add('var v_adm=0');
                end;
                ResultHtmlDoc.Add(v_resHTML[i]);
                Inc(i);
              end;
            finally
              v_resHTML.Free;
            end;
          end else
          begin
            ResultHtmlDoc.Add(c_not_found);
            logs_writes('File '+v_filename+' not found');
          end;
        finally
          MyEndTrans(trRead1);
          MyDBDisconnect(DB1);
          trRead1.Free;
          DB1.Free;
        end;
      end;
    end;
  end;
  procedure ReturnUsersHTML(AParam, ResultHtmlDoc: TStrings);
  var v_filename ,
    v_http_path : AnsiString;
    v_resHTML : TStringList;
    i : Integer;
    v_user, v_password : string;
    v_is_sysdba : Boolean;
    v_ISQUERIES, v_ISCONCL   : Integer;
  label l1;
  const c_file = 'userlist.html';
  begin
    if chkUserPsw(AParam,v_user,v_password) then
      ResultHtmlDoc.Add('-1')
    else
    begin
      DB1:= TpFIBDatabase.Create(nil);
      trRead1:= TpFIBTransaction.Create(nil);
      if setConnectCMN ( v_user,
                         v_password,
                         v_ip_fb,
                         DB1,
                         trRead1,
                         v_is_sysdba,
                         ResultHtmlDoc
                       ) then
      begin
        try
          // -----------------------------------------------------------------------
          v_http_path:='http://' + v_GetLocalHostName + ':' +IntToStr(WADOServerCore1.ServerPort)+'/';
          v_filename := v_filepath+c_file;
          if FileExists(v_filename) then
          begin
            v_resHTML := TStringList.Create;
            try
              v_resHTML.LoadFromFile(v_filename);
              i:=0;
              l1:
              while I <= (v_resHTML.Count-1) do
              begin
                // проверим наличие шаблонов
                if Pos(c_tmpl,v_resHTML[i])>0 then
                begin
                  TmplIns( v_resHTML[i], ResultHtmlDoc );
                  Inc(i);
                  goto l1;
                end;
                //
                if Pos(c_BEGIN_DEBUG,v_resHTML[i])>0 then
                begin
                  // пропускаем отладочные операторы
                  while ((Pos(c_END_DEBUG,v_resHTML[i])<=0) and (I <= (v_resHTML.Count-1))) do
                    Inc(i);
                  ResultHtmlDoc.Add('var v_url = "'+v_http_path+'";');
                  ResultHtmlDoc.Add('var v_ui = "'+
                     inttostr(gt_user_code(DB1,trRead1,v_user,v_fam,v_nam,v_surn, v_ISQUERIES, v_ISCONCL))+'";');
                  ResultHtmlDoc.Add('var v_up = "'+AParam.Values['fld2']+'";');
                  ResultHtmlDoc.Add('var v_un = "'+AParam.Values['fld1']+'";');
                  ResultHtmlDoc.Add('var v_username = "'+v_user+'";');
                  ResultHtmlDoc.Add('var v_fam = "'+AnsiToUtf8(v_fam)+'";');
                  ResultHtmlDoc.Add('var v_nam = "'+AnsiToUtf8(v_nam)+'";');
                  ResultHtmlDoc.Add('var v_surn = "'+AnsiToUtf8(v_surn)+'";');
                  ResultHtmlDoc.Add('var v_ISQUERIES='+inttostr(v_ISQUERIES)+';');
                  ResultHtmlDoc.Add('var v_ISCONCL='+inttostr(v_ISCONCL)+';');
                  if v_is_sysdba then
                    ResultHtmlDoc.Add('var v_adm=1')
                  else
                    ResultHtmlDoc.Add('var v_adm=0');
                end;
                ResultHtmlDoc.Add(v_resHTML[i]);
                Inc(i);
              end;
            finally
              v_resHTML.Free;
            end;
          end else
          begin
            ResultHtmlDoc.Add(c_not_found);
            logs_writes('File '+v_filename+' not found');
          end;
        finally
          MyEndTrans(trRead1);
          MyDBDisconnect(DB1);
          trRead1.Free;
          DB1.Free;
        end;
      end;
    end;
  end;
  procedure ReturnTemplatesHTML(AParam, ResultHtmlDoc: TStrings);
  var v_filename ,
    v_http_path : AnsiString;
    v_resHTML : TStringList;
    i : Integer;
    v_user, v_password : string;
    v_is_sysdba : Boolean;
    v_ISQUERIES, v_ISCONCL   : Integer;
  label l1;  
  const c_file = 'templlist.html';
  begin
    if chkUserPsw(AParam,v_user,v_password) then
      ResultHtmlDoc.Add('-1')
    else
    begin
      DB1:= TpFIBDatabase.Create(nil);
      trRead1:= TpFIBTransaction.Create(nil);
      DB1.DefaultTransaction := trRead1;
      trRead1.DefaultDatabase := DB1;

      if setConnectCMN ( v_user,
                         v_password,
                         v_ip_fb,
                         DB1,
                         trRead1,
                         v_is_sysdba,
                         ResultHtmlDoc
                       ) then
      begin
        try
          // -----------------------------------------------------------------------
          v_http_path:='http://' + v_GetLocalHostName + ':' +IntToStr(WADOServerCore1.ServerPort)+'/';
          v_filename := v_filepath+c_file;
          if FileExists(v_filename) then
          begin
            v_resHTML := TStringList.Create;
            try
              v_resHTML.LoadFromFile(v_filename);
              i:=0;
              l1:
              while I <= (v_resHTML.Count-1) do
              begin
                // проверим наличие шаблонов
                if Pos(c_tmpl,v_resHTML[i])>0 then
                begin
                  TmplIns( v_resHTML[i], ResultHtmlDoc );
                  Inc(i);
                  goto l1;
                end;
                //
                if Pos(c_BEGIN_DEBUG,v_resHTML[i])>0 then
                begin
                  // пропускаем отладочные операторы
                  while ((Pos(c_END_DEBUG,v_resHTML[i])<=0) and (I <= (v_resHTML.Count-1))) do
                    Inc(i);
                  ResultHtmlDoc.Add('var v_url = "'+v_http_path+'";');
                  ResultHtmlDoc.Add('var v_ui = "'+
                     inttostr(gt_user_code(DB1,trRead1,v_user,v_fam,v_nam,v_surn, v_ISQUERIES, v_ISCONCL))+'";');
                  ResultHtmlDoc.Add('var v_up = "'+AParam.Values['fld2']+'";');
                  ResultHtmlDoc.Add('var v_un = "'+AParam.Values['fld1']+'";');
                  ResultHtmlDoc.Add('var v_username = "'+v_user+'";');
                  ResultHtmlDoc.Add('var v_fam = "'+AnsiToUtf8(v_fam)+'";');
                  ResultHtmlDoc.Add('var v_nam = "'+AnsiToUtf8(v_nam)+'";');
                  ResultHtmlDoc.Add('var v_surn = "'+AnsiToUtf8(v_surn)+'";');
                //  ResultHtmlDoc.Add('var v_main_studyuid ="'+v_studyuid+'";');
                  ResultHtmlDoc.Add('var v_ISQUERIES='+inttostr(v_ISQUERIES)+';');
                  ResultHtmlDoc.Add('var v_ISCONCL='+inttostr(v_ISCONCL)+';');
                  if v_is_sysdba then
                    ResultHtmlDoc.Add('var v_adm=1')
                  else
                    ResultHtmlDoc.Add('var v_adm=0');
                end;
                ResultHtmlDoc.Add(v_resHTML[i]);
                Inc(i);
              end;
            finally
              v_resHTML.Free;
            end;
          end else
          begin
            ResultHtmlDoc.Add(c_not_found);
            logs_writes('File '+v_filename+' not found');
          end;
        finally
          MyEndTrans(trRead1);
          MyDBDisconnect(DB1);
          trRead1.Free;
          DB1.Free;
        end;
      end;
    end;
  end;
  procedure ReturnImagePage(AParam, ResultHtmlDoc: TStrings);
  var i, v_amm, v_pos, m, n : Integer;
    str1, sql1, contentType,
    v_PixelSpacingX,
    v_PixelSpacingY : string;
    FIBDataSet : TpFIBDataSet;
    v_resHTML : TStringList;
    das1, das2f : TDicomDataset;
    da1, da3, da4, da6, da7 : TDicomAttribute;
    vda1, vda3, vda4, vda6, vda7 : Integer;
    v_http_path : AnsiString;
    v_ISQUERIES, v_ISCONCL, v_Datalen   : Integer;
    label l1;
    procedure html_ins_fr_file ( p_filename : ansistring );
    var v_str:TStringList;
        i :Integer;
    const c_imgdir1 = 'background-image:url(img/';  
    begin
      v_str:=TStringList.create;
      try
        if FileExists( p_filename ) then
        begin
          v_str.LoadFromFile(p_filename);
          for I := 0 to v_str.Count - 1 do
            ResultHtmlDoc.Add( v_str[i] );
        end;
      finally
        v_str.Free;
      end;
    end;
  type MyType = SmallInt;
  var v_shbln, v_smallpicts, v_img_vis, vSRtext, vTmp : TStringList;
      v_tempList : TStrings;
      kkk,kkk1, n_tmp, v_nn, vWTmp,vHTmp,
      vEcgI1, vEcgI2,vEcgI3, vEcgI4, vEcgI5,
      vEcgI6, v_n_chnl, v_n_group, vi, l : Integer;
      v_str_tmps, v_str_tmps1, v_SeriesUID, v_Modality,
      v_user, v_password, v_studyuid,s1,s2, vPacFIO,
      v_accessionnumber,
      v_pdftitle, vFnamePdf, vFnamejpeg, v_freq : string;
      daPDF, daDATA : TDicomAttribute;
      v_is_sysdba : Boolean;
      v_WaveformData : TDicomWaveForm;
      pname, basedir : string;
      b1 : TOBStream;
      fBuffer : Pointer;
      fBufferSize, v_cmn_ln,
      v_AmmChannels, y, y1, x1,
      v_NumberofWaveformChannels,
      v_NumberofWaveformSamples,
      v_koeff_horiz, v_koeff_vert  : Integer;
      vArrAmm : array of integer;
      v_var_tmp : MyType;
      v_ecg_acts : array of t_ecg_actions;
      CnsDMTable1 : TCnsDMTable;
      img1 : TImage;
      vDicomFileName : string;
      JpegImg: TJpegImage;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
  begin
    vi :=0;
    while ( vImgLock and (vi<10000) ) do
    begin
      Inc(vi); Sleep(5);
    end;
    vImgLock:=True;
    try
      v_accessionnumber := AParam.Values['ACCESSIONNUMBER'];
      v_studyuid := AParam.Values['STUDYUID'];
      v_amm:=0;
      v_SeriesUID := '';
      chkUserPsw(AParam,v_user,v_password);
      v_is_sysdba:=(Uppercase(v_user) = 'SYSDBA');
        v_smallpicts := TStringList.Create;
        v_shbln      := TStringList.Create;
        v_img_vis := TStringList.Create;
        try
          v_smallpicts.Clear;

          v_http_path:='http://' + v_GetLocalHostName + ':' +IntToStr(WADOServerCore1.ServerPort)+'/';
          str1 := '';
          contentType := AParam.Values['contentType'];

          if (contentType = '') then
          begin
            if ( (v_studyuid = '') and 
                 (AParam.Values['SERIESUID'] = '') and 
                 (v_accessionnumber='') ) 
            then
            begin
              logs_writes('WARNING !!!   No Images Found!');
              ResultHtmlDoc.Add('No Images Found!');
            end
            else
            begin
              if (AParam.Values['SERIESUID'] <> '') then
                sql1:= 'select * from ###images i where i.seriesuid='''+aparam.values['seriesuid']+''''+
                  ' and i.studyuid='''+v_studyuid+''''
              else 
                sql1:= 'select * from ###images i where '+
                  ' ((i.accessionnumber=upper('''+v_accessionnumber+''')) or (i.studyuid=upper('''+v_studyuid+'''))) ';
              v_resHTML := TStringList.Create;
              try
                if not FileExists(v_filepath+'dicomviwer.html') then
                  logs_writes('File '+v_filepath+'dicomviwer.html'+' not found');
                v_resHTML.LoadFromFile(v_filepath+'dicomviwer.html');
                i:=0;
                l1:
                while I <= (v_resHTML.Count-1) do
                begin
                  // проверим наличие шаблонов
                  if Pos(c_tmpl,v_resHTML[i])>0 then
                  begin
                    TmplIns( v_resHTML[i], ResultHtmlDoc );
                    Inc(i);
                    goto l1;
                  end;
                  //
                  if Pos('BEGIN-SHABLON-PICTS',v_resHTML[i])>0 then
                  begin
                    // пропускаем отладочные операторы
                    while ((Pos('END-SHABLON-PICTS',v_resHTML[i])<=0) and (I <= (v_resHTML.Count-1))) do
                    begin
                      v_shbln.Add(v_resHTML[i]);
                      //v_smallpicts.Add( StringReplace(v_resHTML[i],'',v_smallpicts[v_strt_nn]+'&icon=1',[]) );
                      Inc(i);
                    end;
                    for kkk := 0 to v_smallpicts.Count - 1 do
                    begin
                      for kkk1 := 0 to v_shbln.Count - 1 do
                      begin
                        v_str_tmps1:=StringReplace(v_shbln[kkk1],'##SRC##',v_smallpicts[kkk]+'&icon=1',[rfReplaceAll, rfIgnoreCase]);
                        v_str_tmps1:=StringReplace(v_str_tmps1,'##ID##',IntToStr(kkk+1),[rfReplaceAll, rfIgnoreCase]);

                      //  v_str_tmps1:=StringReplace(v_str_tmps1,'ST##DEF##','',[rfReplaceAll, rfIgnoreCase]);

                        if Pos('ST##DEF##',v_str_tmps1)>0 then
                        begin
                          n_tmp:=Pos('id="',v_str_tmps1);
                          if n_tmp>0 then
                          begin
                            s1:=Copy(v_str_tmps1,n_tmp+5);
                            s2:=Trim(Copy(s1,1,pos('"',s1)-1));
                            try
                              v_nn:=StrToInt(s2);
                              if (v_img_vis[v_nn-1]='1') then
                              begin
                                v_str_tmps1:=StringReplace(v_str_tmps1,'ST##DEF##','',[rfReplaceAll, rfIgnoreCase]);
                              end else  // !!! снимки вверху
                              begin
                                v_str_tmps1:=StringReplace(v_str_tmps1,'ST##DEF##','display:none',[rfReplaceAll, rfIgnoreCase]);
                              end;

                            except
                            end;
                          end;
                        end;  
                        ResultHtmlDoc.Add(v_str_tmps1);
                      end;
                    end;
                  end else
                  if Pos(c_BEGIN_DEBUG,v_resHTML[i])>0 then
                  begin
                    // пропускаем отладочные операторы
                    while ((Pos(c_END_DEBUG,v_resHTML[i])<=0) and (I <= (v_resHTML.Count-1))) do
                      Inc(i);
                    // кол-во снимков
                    if v_isPostgres then
                    begin
                      v_PGconn := DB_CMN.PgConnCrt;
                      v_PGTrans := PGTransCreate (v_PGconn) ;
                      v_PGTrans.DefaultConnection:=v_PGconn;
                      try
                        if v_PGconn<>nil then
                          if v_PGconn.Connected then
                          begin
                            v_UniQr := TUniQuery.Create(nil);
                            try
                              v_UniQr.Connection:=v_PGconn;
                              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
                              v_UniQr.SQL.Text :=
                                StringReplace(
                                    StringReplace(Lowercase(sql1),'*','count(*) as nmb',[rfReplaceAll, rfIgnoreCase]),
                                    '###',v_pg_schema+'.',[rfReplaceAll, rfIgnoreCase]);
                              v_UniQr.Open;
                              v_UniQr.First;
                              if v_UniQr.eof then
                              begin
                                v_amm:=0;
                                logs_writes('WARNING !!!   No Images Found during select !');
                                Break;
                              end else
                                v_amm:=v_UniQr.FieldByName('nmb').AsInteger;
                                logs_writes('Find '+inttostr(v_amm)+' images !!!');
                            finally
                              v_UniQr.Close;
                              v_UniQr.Free;
                            end;
                          end else
                            logs_writes( 'ERROR : not connected to PostgreSQL');
                      finally
                        DB_CMN.PgFree(v_PGconn,v_PGTrans);
                      end;

                    end else begin
                      FIBDataSet := TpFIBDataSet.Create(nil);
                      FIBDataSet.Database := DB1;
                      try
                        FIBDataSet.Transaction := trRead1;
                        FIBDataSet.SQLs.SelectSQL.Text :=
                          StringReplace(
                                    StringReplace(Lowercase(sql1),'*','count(*) as nmb',[rfReplaceAll, rfIgnoreCase]),
                                    '###','',[rfReplaceAll, rfIgnoreCase]);
                        FIBDataSet.Open;
                        FIBDataSet.First;
                        if FIBDataSet.eof then
                        begin
                          v_amm:=0;
                          logs_writes('WARNING !!!   No Images Found during select !');
                          Break;
                        end else
                          v_amm:=FIBDataSet.FieldByName('nmb').AsInteger;
                          logs_writes('Find '+inttostr(v_amm)+' images');
                      finally
                        FIBDataSet.Close;
                        FreeAndNil(FIBDataSet);
                      end;
                    end;
                    // ---------------------------------------------------------------
                    // собственно вставим снимки
                    // ---------------------------------------------------------------
                    // кол-во снимков - для javascript
                    ResultHtmlDoc.Add('var v_max_pos = '+inttostr(v_amm)+';');
                    ResultHtmlDoc.Add('var v_url = "'+v_http_path+'";');  // http://afomin:11115
                    ResultHtmlDoc.Add('var v_ui = "'+
                       inttostr(gt_user_code(DB1,trRead1,v_user,v_fam,v_nam,v_surn, v_ISQUERIES, v_ISCONCL))+'";');
                    ResultHtmlDoc.Add('var v_up = "'+AParam.Values['fld2']+'";');
                    ResultHtmlDoc.Add('var v_un = "'+AParam.Values['fld1']+'";');
                    ResultHtmlDoc.Add('var v_username = "'+v_user+'";');
                    ResultHtmlDoc.Add('var v_fam = "'+AnsiToUtf8(v_fam)+'";');
                    ResultHtmlDoc.Add('var v_nam = "'+AnsiToUtf8(v_nam)+'";');
                    ResultHtmlDoc.Add('var v_surn = "'+AnsiToUtf8(v_surn)+'";');
                    ResultHtmlDoc.Add('var v_main_studyuid ="'+v_studyuid+'";');
                    ResultHtmlDoc.Add('var v_ISQUERIES='+inttostr(v_ISQUERIES)+';');
                    ResultHtmlDoc.Add('var v_ISCONCL='+inttostr(v_ISCONCL)+';');
                    if v_is_sysdba then
                      ResultHtmlDoc.Add('var v_adm=1;')
                    else
                      ResultHtmlDoc.Add('var v_adm=0;');
                    // ---------------------------------------------------------------
                    if v_isPostgres then
                    begin
                      v_PGconn := DB_CMN.PgConnCrt;
                      v_PGTrans := PGTransCreate (v_PGconn) ;
                      v_PGTrans.DefaultConnection:=v_PGconn;
                      try
                        if v_PGconn<>nil then
                          if v_PGconn.Connected then
                          begin
                            v_UniQr := TUniQuery.Create(nil);
                            try
                              v_UniQr.Connection:=v_PGconn;
                              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
                              v_UniQr.SQL.Text :=
                                     StringReplace( Lowercase(sql1), '###',v_pg_schema+'.',[rfReplaceAll, rfIgnoreCase]);
                              try
                                v_UniQr.Open;

                              except
                              on e:Exception do
                                logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
                              end;
                              v_UniQr.First;
                              v_pos:=0;
                              if v_UniQr.Eof then
                              begin
                                logs_writes('WARNING !!!   No Images Found during select 2 !');
                              end else
                              begin
                                  ResultHtmlDoc.Add('var v_actuality = '+
                                    IntToStr(GtAct( DB1, trRead1, v_studyuid ))+';');
                              end;
                              while not v_UniQr.Eof do
                              begin
                                das1 := WADOServerCore1.DoFindImage(
                                         v_UniQr.FieldByName('studyUID').AsString,
                                         v_UniQr.FieldByName('seriesUID').AsString,
                                         v_UniQr.FieldByName('INSTANCEUID').AsString
                                         );
                                try
                                  if das1 <> nil then
                                  begin
                                    if ((v_SeriesUID='') or (v_SeriesUID<>das1.Attributes.GetString($0020, $000E))) then
                                    begin
                                      ResultHtmlDoc.Add( ' v_img_vis['+inttostr(v_pos)+']=1;');
                                      v_img_vis.Add('1');
                                    end else
                                    begin
                                      ResultHtmlDoc.Add( ' v_img_vis['+inttostr(v_pos)+']=0;');
                                      v_img_vis.Add('0');
                                    end;
                                    v_SeriesUID:= das1.Attributes.GetString($0020, $000E);
                                    ResultHtmlDoc.Add('// ------------------------------------------------------------------------------');
                                    Inc(v_pos);
                                    v_Modality := das1.Attributes.GetString( $0008, $0060 );
                                    ResultHtmlDoc.Add(' v_etcstr['+inttostr(v_pos)+'-1] = '''+''';' );
                                    ResultHtmlDoc.Add(' v_etctitle['+inttostr(v_pos)+'-1] = '''+''';' );
                                    ResultHtmlDoc.Add(' v_etctype['+inttostr(v_pos)+'-1] = 0;' );
                                    ResultHtmlDoc.Add(' v_srtext['+inttostr(v_pos)+'-1] = '''+''';' );
                                    if v_Modality = 'PR' then
                                    begin  // no_image
                                      v_str_tmps:= v_http_path+'pic/MyPicPrivTAGS.jpg#';
                                    end else
                                    if ( (v_Modality = 'OT') and
                                         Assigned(das1.Attributes.item[ $42, $12 ]) and
                                         (das1.Attributes.GetString( $42, $12 )='application/pdf') and
                                         Assigned(das1.Attributes.item[ $42, $11 ])
                                       ) then
                                    begin
                                      v_str_tmps:= v_http_path+'pic/MyPicPDF.jpg#';
                                      ResultHtmlDoc.Add(' v_etctype['+inttostr(v_pos)+'-1] = 1;' );  // 1 - incapsulated PDF
                                      if Assigned(das1.Attributes.item[ $42, $10 ]) then  // Document Title
                                        v_pdftitle := das1.Attributes.GetString( $42, $10 )
                                      else
                                        v_pdftitle := '';
                                      vFnamePdf := 'temp/'+
                                             IntToStr(YearOf(Date))+
                                             IntToStr(MonthOf(Date))+
                                             IntToStr(DayOf(Date))+
                                             IntToStr(HourOf(Now))+
                                             IntToStr(MinuteOf(Now))+
                                             IntToStr(GetTickCount)+
                                             '.pdf';
                                      daPDF := das1.Attributes.Item[ $42,$11 ];
                                      daPDF.SaveToFile( ExtractFilePath(paramstr(0))+vFnamePdf );
                                      ResultHtmlDoc.Add(' v_etcstr['+inttostr(v_pos)+'-1] = '+
                                          ' '''+v_http_path+vFnamePdf+''';' );
                                      logs_writes('prepared mod=OT file '+v_http_path+vFnamePdf);
                                      ResultHtmlDoc.Add(' v_etctitle['+inttostr(v_pos)+'-1] = '''+v_pdftitle+''';' );

                                    end else
                                    if ( (v_Modality = 'ECG') and assigned(das1.Attributes.Item[ $5400,$100 ]) ) then
                                    begin
                                      ResultHtmlDoc.Add(' v_etctype['+inttostr(v_pos)+'-1] = 3;' );  // 3 - ECG

                                      v_koeff_horiz := 25;
                                      v_koeff_vert  := 10;
                                      SetLength(v_ecg_acts,0);

                                      CnsDMTable1 := TCnsDMTable.Create(nil);
                                      img1        := TImage.Create(nil);
                                      v_font_ECG:= TFont.Create;     // Шрифт
                                      try
                                        if TestDcmFileDir(FIBDataSet, basedir) then
                                        begin
                                            vDicomFileName := TestFile(FIBDataSet, basedir);
                                            if (vDicomFileName <> '') then
                                              CnsDMTable1.LoadFromFile(vDicomFileName);
                                        end;
                                        // отрисовка ЭКГ
                                        pIniEcgDrawParameters;
                                        pECGdraw ( CnsDMTable1,            // массив DICOM с данными исследования
                                                   img1,                   // Bitmap для отрисовки ECG
                                                   v_ecg_acts,             // array of t_ecg_actions
                                                   v_koeff_horiz,          // масштаб горизонтально мм/с
                                                   v_koeff_vert,           // масштаб вертикально мм/мВ
                                                   False,                  // filter Savitsky
                                                   False,                  // Показать точки Q,R,S
                                                   False );                // не на форме просмотровщика - убираем те отрисовки на канве
                                        // сохраним в файл
                                      //  vFnamePdf := 'temp/'+ IntToStr(YearOf(Date))+ IntToStr(MonthOf(Date))+ IntToStr(DayOf(Date))+
                                      //       IntToStr(HourOf(Now))+ IntToStr(MinuteOf(Now))+ IntToStr(GetTickCount)+ '.bmp';
                                        vFnamejpeg := 'temp/'+ IntToStr(YearOf(Date))+ IntToStr(MonthOf(Date))+ IntToStr(DayOf(Date))+
                                             IntToStr(HourOf(Now))+ IntToStr(MinuteOf(Now))+ IntToStr(GetTickCount)+ '.jpg';
                                       // img1.Picture.Bitmap.SaveToFile( ExtractFilePath(paramstr(0))+vFnamePdf );

                                        JpegImg := TJpegImage.Create;
                                        try
                                          JpegImg.Assign(img1.Picture.Bitmap) ;
                                          JpegImg.SaveToFile( ExtractFilePath(paramstr(0))+vFnamejpeg ) ;
                                        finally
                                          JpegImg.Free;
                                        end;

                                        v_str_tmps:= v_http_path+vFnamejpeg+'#';
                                        ResultHtmlDoc.Add(' v_etcstr['+inttostr(v_pos)+'-1] = '+
                                          ' '''+v_http_path+vFnamejpeg+''';' );
                                        logs_writes('prepared mod=ECG file '+v_http_path+vFnamejpeg);
                                      finally
                                        v_font_ECG.Free;
                                        CnsDMTable1.Free;
                                        img1.Free;
                                      end;
                                    end else
                                    if ((v_modality='SR') and (
                                      Assigned( das1.Attributes.Item[ $8, $1199 ] ) or
                                      Assigned( das1.Attributes.Item[ $40, $A073 ] ) or
                                      Assigned( das1.Attributes.Item[ $40,$A043 ]) or
                                      Assigned( das1.Attributes.Item[ $40,$A730 ])
                                    ))
                                    then
                                    begin
                                      v_str_tmps:= v_http_path+'pic/MyPicSR.jpg#';
                                      ResultHtmlDoc.Add(' v_etctype['+inttostr(v_pos)+'-1] = 2;' );  // 2 - Structured report
                                      vFnamePdf := 'temp/'+
                                             IntToStr(YearOf(Date))+
                                             IntToStr(MonthOf(Date))+
                                             IntToStr(DayOf(Date))+
                                             IntToStr(HourOf(Now))+
                                             IntToStr(MinuteOf(Now))+
                                             IntToStr(GetTickCount)+
                                             '.html';
                                      pFrmStructuredReportWebBrowserFrm ( das1, ExtractFilePath(paramstr(0))+vFnamePdf );
                                      if FileExists(ExtractFilePath(paramstr(0))+vFnamePdf) then
                                        ResultHtmlDoc.Add(' v_etcstr['+inttostr(v_pos)+'-1] = '+
                                        ' '''+v_http_path+vFnamePdf+''';' );
                                      logs_writes('prepared mod=SR file '+v_http_path+vFnamePdf);
                                    end else
                                    if das1.Attributes.ImageData=nil then
                                    begin
                                      v_str_tmps:= v_http_path+'pic/MyPicPrivTAGS.jpg#';
                                      logs_writes('ERROR das1.Attributes.ImageData=nil !!! ');
                                    end else
                                    begin
                                      v_str_tmps:= v_http_path+'WADO?requestType=WADO' +
                                        '&studyUID=' + v_UniQr.FieldByName('STUDYUID').asstring +
                                        '&seriesUID=' + v_UniQr.FieldByName('SERIESUID').asstring +
                                        '&objectUID=' + v_UniQr.FieldByName('INSTANCEUID').asstring;
                                      logs_writes('prepare link '+v_str_tmps);
                                    end;
                                    v_smallpicts.Add( v_str_tmps );
                                    ResultHtmlDoc.Add( ' imgarr['+inttostr(v_pos)+'-1] = '''+v_str_tmps+''';' );
                                    //
                                    logs_writes('insert link into image imgarr['+inttostr(v_pos-1)+']= '+v_str_tmps );
                                    //
                                    ResultHtmlDoc.Add( 'StudyInstanceUID['+inttostr(v_pos)+'-1] = '''+das1.Attributes.GetString($0008, $0018)+''';' );
                                    //
                                    ResultHtmlDoc.Add( ' v_pos_x['+inttostr(v_pos)+'-1]=0;');
                                    ResultHtmlDoc.Add( ' v_pos_y['+inttostr(v_pos)+'-1]=0;');
                                    ResultHtmlDoc.Add( ' v_scale_set['+inttostr(v_pos)+'-1]=1;');
                                    //
                                    if das1.Attributes.ImageData=nil then
                                    begin
                                      vWTmp := 512;
                                      vHTmp := 512;
                                      ResultHtmlDoc.Add(' FrameCount['+inttostr(v_pos)+'-1] = '+
                                        IntToStr(0) + ';' );
          //                            v_PixelSpacingX := FloatToStr(0.15625) ;
                                      v_PixelSpacingX := FloatToStr(0.040234375) ;
                                      v_PixelSpacingY := v_PixelSpacingX ;
                                      ResultHtmlDoc.Add(' ImgWidth['+inttostr(v_pos)+'-1] = '+
                                        IntToStr(vWTmp) + ';' );
                                      ResultHtmlDoc.Add(' ImgHeight['+inttostr(v_pos)+'-1] = '+
                                        IntToStr(vHTmp) + ';' );
                                      ResultHtmlDoc.Add(' RescaleSlope['+inttostr(v_pos)+'-1] = '+
                                        FloatToStr(0.04) + ';' );
                                      // размеры изображения
                                      ResultHtmlDoc.Add(' ADicomImage_height['+inttostr(v_pos)+'-1] = '''+
                                        inttostr(vHTmp)+''';');
                                      ResultHtmlDoc.Add(' ADicomImage_Width['+inttostr(v_pos)+'-1] = '''+
                                        inttostr(vWTmp)+''';');
                                      ResultHtmlDoc.Add(' ADicomImage_WindowWidth['+inttostr(v_pos)+'-1] = '''+
                                        inttostr(vWTmp)+''';');
                                      ResultHtmlDoc.Add(' ADicomImage_WindowCenter['+inttostr(v_pos)+'-1] = '''+
                                        inttostr(989)+''';');
                                    end else
                                    begin
                                      if das1.Attributes.ImageData.FrameCount>10 then
                                        ResultHtmlDoc.Add(' FrameCount['+inttostr(v_pos)+'-1] = '+
                                          IntToStr(das1.Attributes.ImageData.FrameCount-1) + ';' )
                                      else
                                        ResultHtmlDoc.Add(' FrameCount['+inttostr(v_pos)+'-1] = '+
                                          IntToStr(das1.Attributes.ImageData.FrameCount) + ';' );
                                      v_PixelSpacingX := FloatToStr(das1.Attributes.ImageData.PixelSpacingX) ;
                                      v_PixelSpacingY := FloatToStr(das1.Attributes.ImageData.PixelSpacingY) ;
                                      ResultHtmlDoc.Add(' ImgWidth['+inttostr(v_pos)+'-1] = '+
                                        IntToStr(das1.Attributes.ImageData.Width) + ';' );
                                      ResultHtmlDoc.Add(' ImgHeight['+inttostr(v_pos)+'-1] = '+
                                        IntToStr(das1.Attributes.ImageData.Height) + ';' );
                                      ResultHtmlDoc.Add(' RescaleSlope['+inttostr(v_pos)+'-1] = '+
                                        FloatToStr(das1.Attributes.ImageData.RescaleSlope) + ';' );
                                      // размеры изображения
                                      ResultHtmlDoc.Add(' ADicomImage_height['+inttostr(v_pos)+'-1] = '''+
                                        inttostr(das1.Attributes.ImageData.height)+''';');
                                      ResultHtmlDoc.Add(' ADicomImage_Width['+inttostr(v_pos)+'-1] = '''+
                                        inttostr(das1.Attributes.ImageData.Width)+''';');
                                      ResultHtmlDoc.Add(' ADicomImage_WindowWidth['+inttostr(v_pos)+'-1] = '''+
                                        inttostr(das1.Attributes.ImageData.WindowWidth)+''';');
                                      ResultHtmlDoc.Add(' ADicomImage_WindowCenter['+inttostr(v_pos)+'-1] = '''+
                                        inttostr(das1.Attributes.ImageData.WindowCenter)+''';');
                                    end;
                                    //
                                    vPacFIO := das1.Attributes.GetString($10, $10);
                                    vPacFIO := StringReplace( vPacFIO,'^',' ',[rfReplaceAll, rfIgnoreCase]);
                                    vPacFIO := fStrNorm( vPacFIO );
                                    ResultHtmlDoc.Add(' p_ename['+inttostr(v_pos)+'-1]  ='''+  // ФИО пациента (Patient Name)
                                      vPacFIO + ''';' );
                                    ResultHtmlDoc.Add(' patientid['+inttostr(v_pos)+'-1] ='''+
                                      das1.Attributes.GetString($10, $20)+''';');  //
                                    ResultHtmlDoc.Add(' p_databrn['+inttostr(v_pos)+'-1] ='''+
                                      das1.Attributes.GetString(dPatientBirthDate)+''';');  //
                                    ResultHtmlDoc.Add(' studyUID['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0020, $000D)+''';');  //
                                    v_PixelSpacingX:= StringReplace( v_PixelSpacingX,
                                      ',','.',[rfReplaceAll, rfIgnoreCase]); //  SysUtils.DecimalSeparator
                                    v_PixelSpacingY := StringReplace( v_PixelSpacingY,
                                      ',','.',[rfReplaceAll, rfIgnoreCase]);
                                    ResultHtmlDoc.Add(' PixelSpacingX['+inttostr(v_pos)+'-1] = '+
                                      v_PixelSpacingX + ';' );
                                    ResultHtmlDoc.Add(' PixelSpacingY['+inttostr(v_pos)+'-1] = '+
                                      v_PixelSpacingY + ';' );
                                    // данные атрибутов для вывода на снимке -------------------------
                                    // Modality
                                    ResultHtmlDoc.Add(' Modality['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString(8, $60)+''';');
                                    // Manufacturer
                                    ResultHtmlDoc.Add(' Manufacturer['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString(8, $70)+''';');
                                    ResultHtmlDoc.Add(' PatientAge['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0010, $1010)+''';');
                                    ResultHtmlDoc.Add(' PatientSize['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0010, $1020)+''';');
                                    ResultHtmlDoc.Add(' PatientWeight['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0010, $1030)+''';');
                                    ResultHtmlDoc.Add(' StudyID['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0020, $0010)+''';');
                                    ResultHtmlDoc.Add(' ContentDate['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0008, $0023)+''';');
                                    ResultHtmlDoc.Add(' StudyDate['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0008, $0020)+''';');
                                    ResultHtmlDoc.Add(' StudyTime['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0008, $0030)+''';');
                                    ResultHtmlDoc.Add(' InstitutionName['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0008, $0080)+''';');
                                    ResultHtmlDoc.Add(' GraphicsSign['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($2811, $020D)+''';');
                                    ResultHtmlDoc.Add(' BodyPartExamined['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $0015)+''';');
                                    ResultHtmlDoc.Add(' SeriesDescription['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0008, $103E)+''';');
                                    // для CT дополнительно тянем
                                    ResultHtmlDoc.Add(' AcquisitionDate['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0008, $0022)+''';');
                                    ResultHtmlDoc.Add(' ContentDate['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0008, $0023)+''';');
                                    ResultHtmlDoc.Add(' AcquisitionTime['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0008, $0032)+''';');
                                    ResultHtmlDoc.Add(' ContentTime['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0008, $0033)+''';');
                                    ResultHtmlDoc.Add(' SliceLocation['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0020, $1041)+''';');
                                    ResultHtmlDoc.Add(' SeriesNumber['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0020, $0011)+''';');
                                    ResultHtmlDoc.Add(' SeriesUID['+inttostr(v_pos)+'-1] = '''+
                                      v_SeriesUID+'''');
                                    ResultHtmlDoc.Add(' InstanceNumber['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0020, $0013)+''';');
                                    ResultHtmlDoc.Add(' AcquisitionNumber['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0020, $0012)+''';');
                                    ResultHtmlDoc.Add(' ManufacturerModelName['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0008, $1090)+''';');
                                    ResultHtmlDoc.Add(' SoftwareVersion['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $1020)+''';');
                                    ResultHtmlDoc.Add(' KVP['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $0060)+''';');
                                    ResultHtmlDoc.Add(' XRayTubeCurrent['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $1151)+''';');
                                    ResultHtmlDoc.Add(' SliceThickness['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $0050)+''';');
                                    ResultHtmlDoc.Add(' GantryDetectorTilt['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $1120)+''';');
                                    ResultHtmlDoc.Add(' SiemensData['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0021, $1011)+''';');
                                    ResultHtmlDoc.Add(' SiemensData1['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0021, $1120)+''';');
                                    ResultHtmlDoc.Add(' ConvolutionKernel['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $1210)+''';');
                                    // для MR
                                    ResultHtmlDoc.Add(' ReceivingCoil['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $1250)+''';');
                                    ResultHtmlDoc.Add(' SequenceName['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $0024)+''';');
                                    ResultHtmlDoc.Add(' ScanningSequence['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $0020)+''';');
                                    ResultHtmlDoc.Add(' RepetitionTime['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $0080)+''';');
                                    ResultHtmlDoc.Add(' EchoTime['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $0081)+''';');
                                    ResultHtmlDoc.Add(' FlipAngle['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $1314)+''';');
                                    ResultHtmlDoc.Add(' PhaseEncodingDirection['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $1312)+''';');
                                    ResultHtmlDoc.Add(' GantryDetectorTilt['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $1120)+''';');
                                    ResultHtmlDoc.Add(' ImageComments['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0020, $4000)+''';');
                                    // GE
                                    ResultHtmlDoc.Add(' AcquisitionMatrix['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $1310)+''';');
                                    ResultHtmlDoc.Add(' PixelBandwidth['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $0095)+''';');
                                    ResultHtmlDoc.Add(' SliceThickness['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $0050)+''';');
                                    ResultHtmlDoc.Add(' ReceivingCoil['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $1250)+''';');
                                    ResultHtmlDoc.Add(' EchoNumber['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $0086)+''';');
                                    ResultHtmlDoc.Add(' GE_Sequence_Name['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0019, $109C)+''';');
                                    ResultHtmlDoc.Add(' SequenceVariant['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $0021)+''';');
                                    ResultHtmlDoc.Add(' SeriesDate['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0008, $0021)+''';');
                                    ResultHtmlDoc.Add(' SeriesTime['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0008, $0031)+''';');
                                    ResultHtmlDoc.Add(' PatientSex['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0010, $0040)+''';');
                                    ResultHtmlDoc.Add(' EchoTrainLength['+inttostr(v_pos)+'-1] = '''+
                                      das1.Attributes.GetString($0018, $0091)+''';');
                                    // конец блока вывода атрибутов dicom
                                    // инициализация
                                    ResultHtmlDoc.Add(' v_vert_mirror['+inttostr(v_pos)+'-1] = false;');
                                    ResultHtmlDoc.Add(' v_horiz_mirror['+inttostr(v_pos)+'-1] = false;');
                                    ResultHtmlDoc.Add(' v_povorot['+inttostr(v_pos)+'-1] = 0;');
                                    ResultHtmlDoc.Add(' v_inversion['+inttostr(v_pos)+'-1] = false;');
                                    ResultHtmlDoc.Add(' v_corr_light['+inttostr(v_pos)+'-1] = 0;');
                                    ResultHtmlDoc.Add(' v_corr_contrast['+inttostr(v_pos)+'-1] = 0;');
                                  end;
                                finally
                                  das1.Free;
                                end;
                                v_UniQr.Next;
                              end;
                            finally
                              v_UniQr.Close;
                              v_UniQr.Free;
                            end;
                          end else
                            logs_writes( 'ERROR : not connected to PostgreSQL');
                      finally
                        DB_CMN.PgFree(v_PGconn,v_PGTrans);
                      end;

                    end else begin
                      FIBDataSet := TpFIBDataSet.Create(nil);
                      FIBDataSet.Database := DB1;
                      try
                        FIBDataSet.Transaction := trRead1;
                        FIBDataSet.SQLs.SelectSQL.Text :=
                          StringReplace( Lowercase(sql1), '###','',[rfReplaceAll, rfIgnoreCase]);
                        FIBDataSet.Open;
                        FIBDataSet.First;
                        v_pos:=0;
                        if FIBDataSet.Eof then
                        begin
                          logs_writes('WARNING !!!   No Images Found during select 2 !');
                        end else
                        begin
                            ResultHtmlDoc.Add('var v_actuality = '+
                              IntToStr(GtAct( DB1, trRead1, v_studyuid ))+';');
                        end;
                        while not FIBDataSet.Eof do
                        begin
                          das1 := WADOServerCore1.DoFindImage(
                                   FIBDataSet.FieldByName('studyUID').AsString,
                                   FIBDataSet.FieldByName('seriesUID').AsString,
                                   FIBDataSet.FieldByName('INSTANCEUID').AsString
                                   );
                          try
                            if das1 <> nil then
                            begin
                              if ((v_SeriesUID='') or (v_SeriesUID<>das1.Attributes.GetString($0020, $000E))) then
                              begin
                                ResultHtmlDoc.Add( ' v_img_vis['+inttostr(v_pos)+']=1;');
                                v_img_vis.Add('1');
                              end else
                              begin
                                ResultHtmlDoc.Add( ' v_img_vis['+inttostr(v_pos)+']=0;');
                                v_img_vis.Add('0');
                              end;
                              v_SeriesUID:= das1.Attributes.GetString($0020, $000E);
                              ResultHtmlDoc.Add('// ------------------------------------------------------------------------------');
                              Inc(v_pos);
                              v_Modality := das1.Attributes.GetString( $0008, $0060 );
                              ResultHtmlDoc.Add(' v_etcstr['+inttostr(v_pos)+'-1] = '''+''';' );
                              ResultHtmlDoc.Add(' v_etctitle['+inttostr(v_pos)+'-1] = '''+''';' );
                              ResultHtmlDoc.Add(' v_etctype['+inttostr(v_pos)+'-1] = 0;' );
                              ResultHtmlDoc.Add(' v_srtext['+inttostr(v_pos)+'-1] = '''+''';' );
                              if v_Modality = 'PR' then
                              begin  // no_image
                                v_str_tmps:= v_http_path+'pic/MyPicPrivTAGS.jpg#';
                              end else
                              if ( (v_Modality = 'OT') and
                                   Assigned(das1.Attributes.item[ $42, $12 ]) and
                                   (das1.Attributes.GetString( $42, $12 )='application/pdf') and
                                   Assigned(das1.Attributes.item[ $42, $11 ])
                                 ) then
                              begin
                                v_str_tmps:= v_http_path+'pic/MyPicPDF.jpg#';
                                ResultHtmlDoc.Add(' v_etctype['+inttostr(v_pos)+'-1] = 1;' );  // 1 - incapsulated PDF
                                if Assigned(das1.Attributes.item[ $42, $10 ]) then  // Document Title
                                  v_pdftitle := das1.Attributes.GetString( $42, $10 )
                                else
                                  v_pdftitle := '';
                                vFnamePdf := 'temp/'+
                                       IntToStr(YearOf(Date))+
                                       IntToStr(MonthOf(Date))+
                                       IntToStr(DayOf(Date))+
                                       IntToStr(HourOf(Now))+
                                       IntToStr(MinuteOf(Now))+
                                       IntToStr(GetTickCount)+
                                       '.pdf';
                                daPDF := das1.Attributes.Item[ $42,$11 ];
                                daPDF.SaveToFile( ExtractFilePath(paramstr(0))+vFnamePdf );
                                ResultHtmlDoc.Add(' v_etcstr['+inttostr(v_pos)+'-1] = '+
                                    ' '''+v_http_path+vFnamePdf+''';' );
                                ResultHtmlDoc.Add(' v_etctitle['+inttostr(v_pos)+'-1] = '''+v_pdftitle+''';' );

                              end else
                              if ( (v_Modality = 'ECG') and assigned(das1.Attributes.Item[ $5400,$100 ]) ) then
                              begin
                                ResultHtmlDoc.Add(' v_etctype['+inttostr(v_pos)+'-1] = 3;' );  // 3 - ECG

                                v_koeff_horiz := 25;
                                v_koeff_vert  := 10;
                                SetLength(v_ecg_acts,0);

                                CnsDMTable1 := TCnsDMTable.Create(nil);
                                img1        := TImage.Create(nil);
                                v_font_ECG:= TFont.Create;     // Шрифт
                                try
                                  if TestDcmFileDir(FIBDataSet, basedir) then
                                  begin
                                      vDicomFileName := TestFile(FIBDataSet, basedir);
                                      if (vDicomFileName <> '') then
                                        CnsDMTable1.LoadFromFile(vDicomFileName);
                                  end;
                                  // отрисовка ЭКГ
                                  pIniEcgDrawParameters;
                                  pECGdraw ( CnsDMTable1,            // массив DICOM с данными исследования
                                             img1,                   // Bitmap для отрисовки ECG
                                             v_ecg_acts,             // array of t_ecg_actions
                                             v_koeff_horiz,          // масштаб горизонтально мм/с
                                             v_koeff_vert,           // масштаб вертикально мм/мВ
                                             False,                  // filter Savitsky
                                             False,                  // Показать точки Q,R,S
                                             False );                // не на форме просмотровщика - убираем те отрисовки на канве
                                  // сохраним в файл
                                //  vFnamePdf := 'temp/'+ IntToStr(YearOf(Date))+ IntToStr(MonthOf(Date))+ IntToStr(DayOf(Date))+
                                //       IntToStr(HourOf(Now))+ IntToStr(MinuteOf(Now))+ IntToStr(GetTickCount)+ '.bmp';
                                  vFnamejpeg := 'temp/'+ IntToStr(YearOf(Date))+ IntToStr(MonthOf(Date))+ IntToStr(DayOf(Date))+
                                       IntToStr(HourOf(Now))+ IntToStr(MinuteOf(Now))+ IntToStr(GetTickCount)+ '.jpg';
                                 // img1.Picture.Bitmap.SaveToFile( ExtractFilePath(paramstr(0))+vFnamePdf );

                                  JpegImg := TJpegImage.Create;
                                  try
                                    JpegImg.Assign(img1.Picture.Bitmap) ;
                                    JpegImg.SaveToFile( ExtractFilePath(paramstr(0))+vFnamejpeg ) ;
                                  finally
                                    JpegImg.Free;
                                  end;

                                  v_str_tmps:= v_http_path+vFnamejpeg+'#';
                                  ResultHtmlDoc.Add(' v_etcstr['+inttostr(v_pos)+'-1] = '+
                                    ' '''+v_http_path+vFnamejpeg+''';' );
                                finally
                                  v_font_ECG.Free;
                                  CnsDMTable1.Free;
                                  img1.Free;
                                end;
                              end else
                              if ((v_modality='SR') and (
                                Assigned( das1.Attributes.Item[ $8, $1199 ] ) or
                                Assigned( das1.Attributes.Item[ $40, $A073 ] ) or
                                Assigned( das1.Attributes.Item[ $40,$A043 ]) or
                                Assigned( das1.Attributes.Item[ $40,$A730 ])
                              ))
                              then
                              begin
                                v_str_tmps:= v_http_path+'pic/MyPicSR.jpg#';
                                ResultHtmlDoc.Add(' v_etctype['+inttostr(v_pos)+'-1] = 2;' );  // 2 - Structured report
                                vFnamePdf := 'temp/'+
                                       IntToStr(YearOf(Date))+
                                       IntToStr(MonthOf(Date))+
                                       IntToStr(DayOf(Date))+
                                       IntToStr(HourOf(Now))+
                                       IntToStr(MinuteOf(Now))+
                                       IntToStr(GetTickCount)+
                                       '.html';
                                pFrmStructuredReportWebBrowserFrm ( das1, ExtractFilePath(paramstr(0))+vFnamePdf );
                                if FileExists(ExtractFilePath(paramstr(0))+vFnamePdf) then
                                  ResultHtmlDoc.Add(' v_etcstr['+inttostr(v_pos)+'-1] = '+
                                  ' '''+v_http_path+vFnamePdf+''';' );
                              end else
                              if das1.Attributes.ImageData=nil then
                              begin
                                v_str_tmps:= v_http_path+'pic/MyPicPrivTAGS.jpg#';
                              end else
                              begin
                                v_str_tmps:= v_http_path+'WADO?requestType=WADO' +
                                  '&studyUID=' + FIBDataSet.FieldByName('STUDYUID').asstring +
                                  '&seriesUID=' + FIBDataSet.FieldByName('SERIESUID').asstring +
                                  '&objectUID=' + FIBDataSet.FieldByName('INSTANCEUID').asstring;
                              end;
                              v_smallpicts.Add( v_str_tmps );
                              ResultHtmlDoc.Add( ' imgarr['+inttostr(v_pos)+'-1] = '''+v_str_tmps+''';' );
                              //
                              ResultHtmlDoc.Add( 'StudyInstanceUID['+inttostr(v_pos)+'-1] = '''+das1.Attributes.GetString($0008, $0018)+''';' );
                              //
                              ResultHtmlDoc.Add( ' v_pos_x['+inttostr(v_pos)+'-1]=0;');
                              ResultHtmlDoc.Add( ' v_pos_y['+inttostr(v_pos)+'-1]=0;');
                              ResultHtmlDoc.Add( ' v_scale_set['+inttostr(v_pos)+'-1]=1;');
                              //
                              if das1.Attributes.ImageData=nil then
                              begin
                                vWTmp := 512;
                                vHTmp := 512;
                                ResultHtmlDoc.Add(' FrameCount['+inttostr(v_pos)+'-1] = '+
                                  IntToStr(0) + ';' );
    //                            v_PixelSpacingX := FloatToStr(0.15625) ;
                                v_PixelSpacingX := FloatToStr(0.040234375) ;
                                v_PixelSpacingY := v_PixelSpacingX ;
                                ResultHtmlDoc.Add(' ImgWidth['+inttostr(v_pos)+'-1] = '+
                                  IntToStr(vWTmp) + ';' );
                                ResultHtmlDoc.Add(' ImgHeight['+inttostr(v_pos)+'-1] = '+
                                  IntToStr(vHTmp) + ';' );
                                ResultHtmlDoc.Add(' RescaleSlope['+inttostr(v_pos)+'-1] = '+
                                  FloatToStr(0.04) + ';' );
                                // размеры изображения
                                ResultHtmlDoc.Add(' ADicomImage_height['+inttostr(v_pos)+'-1] = '''+
                                  inttostr(vHTmp)+''';');
                                ResultHtmlDoc.Add(' ADicomImage_Width['+inttostr(v_pos)+'-1] = '''+
                                  inttostr(vWTmp)+''';');
                                ResultHtmlDoc.Add(' ADicomImage_WindowWidth['+inttostr(v_pos)+'-1] = '''+
                                  inttostr(vWTmp)+''';');
                                ResultHtmlDoc.Add(' ADicomImage_WindowCenter['+inttostr(v_pos)+'-1] = '''+
                                  inttostr(989)+''';');
                              end else
                              begin
                                ResultHtmlDoc.Add(' FrameCount['+inttostr(v_pos)+'-1] = '+
                                  IntToStr(das1.Attributes.ImageData.FrameCount) + ';' );
                                v_PixelSpacingX := FloatToStr(das1.Attributes.ImageData.PixelSpacingX) ;
                                v_PixelSpacingY := FloatToStr(das1.Attributes.ImageData.PixelSpacingY) ;
                                ResultHtmlDoc.Add(' ImgWidth['+inttostr(v_pos)+'-1] = '+
                                  IntToStr(das1.Attributes.ImageData.Width) + ';' );
                                ResultHtmlDoc.Add(' ImgHeight['+inttostr(v_pos)+'-1] = '+
                                  IntToStr(das1.Attributes.ImageData.Height) + ';' );
                                ResultHtmlDoc.Add(' RescaleSlope['+inttostr(v_pos)+'-1] = '+
                                  FloatToStr(das1.Attributes.ImageData.RescaleSlope) + ';' );
                                // размеры изображения
                                ResultHtmlDoc.Add(' ADicomImage_height['+inttostr(v_pos)+'-1] = '''+
                                  inttostr(das1.Attributes.ImageData.height)+''';');
                                ResultHtmlDoc.Add(' ADicomImage_Width['+inttostr(v_pos)+'-1] = '''+
                                  inttostr(das1.Attributes.ImageData.Width)+''';');
                                ResultHtmlDoc.Add(' ADicomImage_WindowWidth['+inttostr(v_pos)+'-1] = '''+
                                  inttostr(das1.Attributes.ImageData.WindowWidth)+''';');
                                ResultHtmlDoc.Add(' ADicomImage_WindowCenter['+inttostr(v_pos)+'-1] = '''+
                                  inttostr(das1.Attributes.ImageData.WindowCenter)+''';');
                              end;
                              //
                              vPacFIO := das1.Attributes.GetString($10, $10);
                              vPacFIO := StringReplace( vPacFIO,'^',' ',[rfReplaceAll, rfIgnoreCase]);
                              vPacFIO := fStrNorm( vPacFIO );
                              ResultHtmlDoc.Add(' p_ename['+inttostr(v_pos)+'-1]  ='''+  // ФИО пациента (Patient Name)
                                vPacFIO + ''';' );
                              ResultHtmlDoc.Add(' patientid['+inttostr(v_pos)+'-1] ='''+
                                das1.Attributes.GetString($10, $20)+''';');  //
                              ResultHtmlDoc.Add(' p_databrn['+inttostr(v_pos)+'-1] ='''+
                                das1.Attributes.GetString(dPatientBirthDate)+''';');  //
                              ResultHtmlDoc.Add(' studyUID['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0020, $000D)+''';');  //
                              v_PixelSpacingX:= StringReplace( v_PixelSpacingX,
                                ',','.',[rfReplaceAll, rfIgnoreCase]); //  SysUtils.DecimalSeparator
                              v_PixelSpacingY := StringReplace( v_PixelSpacingY,
                                ',','.',[rfReplaceAll, rfIgnoreCase]);
                              ResultHtmlDoc.Add(' PixelSpacingX['+inttostr(v_pos)+'-1] = '+
                                v_PixelSpacingX + ';' );
                              ResultHtmlDoc.Add(' PixelSpacingY['+inttostr(v_pos)+'-1] = '+
                                v_PixelSpacingY + ';' );
                              // данные атрибутов для вывода на снимке -------------------------
                              // Modality
                              ResultHtmlDoc.Add(' Modality['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString(8, $60)+''';');
                              // Manufacturer
                              ResultHtmlDoc.Add(' Manufacturer['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString(8, $70)+''';');
                              ResultHtmlDoc.Add(' PatientAge['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0010, $1010)+''';');
                              ResultHtmlDoc.Add(' PatientSize['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0010, $1020)+''';');
                              ResultHtmlDoc.Add(' PatientWeight['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0010, $1030)+''';');
                              ResultHtmlDoc.Add(' StudyID['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0020, $0010)+''';');
                              ResultHtmlDoc.Add(' ContentDate['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0008, $0023)+''';');
                              ResultHtmlDoc.Add(' StudyDate['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0008, $0020)+''';');
                              ResultHtmlDoc.Add(' StudyTime['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0008, $0030)+''';');
                              ResultHtmlDoc.Add(' InstitutionName['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0008, $0080)+''';');
                              ResultHtmlDoc.Add(' GraphicsSign['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($2811, $020D)+''';');
                              ResultHtmlDoc.Add(' BodyPartExamined['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $0015)+''';');
                              ResultHtmlDoc.Add(' SeriesDescription['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0008, $103E)+''';');
                              // для CT дополнительно тянем
                              ResultHtmlDoc.Add(' AcquisitionDate['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0008, $0022)+''';');
                              ResultHtmlDoc.Add(' ContentDate['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0008, $0023)+''';');
                              ResultHtmlDoc.Add(' AcquisitionTime['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0008, $0032)+''';');
                              ResultHtmlDoc.Add(' ContentTime['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0008, $0033)+''';');
                              ResultHtmlDoc.Add(' SliceLocation['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0020, $1041)+''';');
                              ResultHtmlDoc.Add(' SeriesNumber['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0020, $0011)+''';');
                              ResultHtmlDoc.Add(' SeriesUID['+inttostr(v_pos)+'-1] = '''+
                                v_SeriesUID+'''');
                              ResultHtmlDoc.Add(' InstanceNumber['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0020, $0013)+''';');
                              ResultHtmlDoc.Add(' AcquisitionNumber['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0020, $0012)+''';');
                              ResultHtmlDoc.Add(' ManufacturerModelName['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0008, $1090)+''';');
                              ResultHtmlDoc.Add(' SoftwareVersion['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $1020)+''';');
                              ResultHtmlDoc.Add(' KVP['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $0060)+''';');
                              ResultHtmlDoc.Add(' XRayTubeCurrent['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $1151)+''';');
                              ResultHtmlDoc.Add(' SliceThickness['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $0050)+''';');
                              ResultHtmlDoc.Add(' GantryDetectorTilt['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $1120)+''';');
                              ResultHtmlDoc.Add(' SiemensData['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0021, $1011)+''';');
                              ResultHtmlDoc.Add(' SiemensData1['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0021, $1120)+''';');
                              ResultHtmlDoc.Add(' ConvolutionKernel['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $1210)+''';');
                              // для MR
                              ResultHtmlDoc.Add(' ReceivingCoil['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $1250)+''';');
                              ResultHtmlDoc.Add(' SequenceName['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $0024)+''';');
                              ResultHtmlDoc.Add(' ScanningSequence['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $0020)+''';');
                              ResultHtmlDoc.Add(' RepetitionTime['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $0080)+''';');
                              ResultHtmlDoc.Add(' EchoTime['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $0081)+''';');
                              ResultHtmlDoc.Add(' FlipAngle['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $1314)+''';');
                              ResultHtmlDoc.Add(' PhaseEncodingDirection['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $1312)+''';');
                              ResultHtmlDoc.Add(' GantryDetectorTilt['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $1120)+''';');
                              ResultHtmlDoc.Add(' ImageComments['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0020, $4000)+''';');
                              // GE
                              ResultHtmlDoc.Add(' AcquisitionMatrix['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $1310)+''';');
                              ResultHtmlDoc.Add(' PixelBandwidth['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $0095)+''';');
                              ResultHtmlDoc.Add(' SliceThickness['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $0050)+''';');
                              ResultHtmlDoc.Add(' ReceivingCoil['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $1250)+''';');
                              ResultHtmlDoc.Add(' EchoNumber['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $0086)+''';');
                              ResultHtmlDoc.Add(' GE_Sequence_Name['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0019, $109C)+''';');
                              ResultHtmlDoc.Add(' SequenceVariant['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $0021)+''';');
                              ResultHtmlDoc.Add(' SeriesDate['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0008, $0021)+''';');
                              ResultHtmlDoc.Add(' SeriesTime['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0008, $0031)+''';');
                              ResultHtmlDoc.Add(' PatientSex['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0010, $0040)+''';');
                              ResultHtmlDoc.Add(' EchoTrainLength['+inttostr(v_pos)+'-1] = '''+
                                das1.Attributes.GetString($0018, $0091)+''';');
                              // конец блока вывода атрибутов dicom
                              // инициализация
                              ResultHtmlDoc.Add(' v_vert_mirror['+inttostr(v_pos)+'-1] = false;');
                              ResultHtmlDoc.Add(' v_horiz_mirror['+inttostr(v_pos)+'-1] = false;');
                              ResultHtmlDoc.Add(' v_povorot['+inttostr(v_pos)+'-1] = 0;');
                              ResultHtmlDoc.Add(' v_inversion['+inttostr(v_pos)+'-1] = false;');
                              ResultHtmlDoc.Add(' v_corr_light['+inttostr(v_pos)+'-1] = 0;');
                              ResultHtmlDoc.Add(' v_corr_contrast['+inttostr(v_pos)+'-1] = 0;');
                            end;
                          finally
                            das1.Free;
                          end;
                          FIBDataSet.Next;
                        end;
                      finally
                        FIBDataSet.Close;
                        FreeAndNil(FIBDataSet);
                      end;
                    end;
                    // ---------------------------------------------------------------
                  end;
                  ResultHtmlDoc.Add(v_resHTML[i]);
                  Inc(i);
                end;
                if v_amm=0 then
                begin
                  ResultHtmlDoc.Clear;
                  ResultHtmlDoc.Add('No Images Found!');
                  logs_writes('No Images Found!');
                end;
              finally
                v_resHTML.Free;
              end;
            end;
          end
          else
            ResultHtmlDoc.Add('No Images Found!');

        finally
          v_smallpicts.Free;
          v_shbln.Free;
          v_img_vis.free;
        end;
     // end;

    finally
      vImgLock:=False;
    end;
  end;
  function chk_not_conn : Boolean;
  begin
    Result := ((Pos('.css',HeaderInfo.URI)>0) or
          (Pos('.js',HeaderInfo.URI)>0) or
          (Pos('.png',HeaderInfo.URI)>0) or
          (Pos('.woff',HeaderInfo.URI)>0) or
          (Pos('.ttf',HeaderInfo.URI)>0) or
          (Pos('.gif',HeaderInfo.URI)>0) or
          (Pos('.jpeg',HeaderInfo.URI)>0) or
          (Pos('.jpg',HeaderInfo.URI)>0) or
          (Pos('.pdf',HeaderInfo.URI)>0)
         );
  end;
var v_icon,v_frame, v_strs11, vWidth,vHeight, v_is_avi :string;
begin
  IncConnections;
  try
    ResultHtmlDoc := TStringList.Create;
    strs1 := TStringList.Create;
  //  strs2 := TStringList.Create;
    strx1 := '';
    strBreakApart(HeaderInfo.URI, '/', strs1);
    if not chk_not_conn then
    begin
      if v_isPostgres then
      begin

      end else begin
        DB1:= TpFIBDatabase.Create(nil);
        trWrite1:= TpFIBTransaction.Create(nil);
        trWrite1.DefaultDatabase := DB1;
        trWrite1.TimeoutAction := TARollback ;
        trWrite1.TPBMode := tpbReadCommitted ;
        trRead1:= TpFIBTransaction.Create(nil);
        DB1.DefaultTransaction := trRead1;
        trRead1.DefaultDatabase := DB1;
        DB1.ConnectParams.UserName := 'sysdba';
        DB1.ConnectParams.Password := 'masterkey';
        DB1.ConnectParams.CharSet:='WIN1251';
      end;
    end;
    try
      clr_temp_files; // чистка временных файлов
      if not chk_not_conn then
      begin
        if v_isPostgres then
        begin

        end else begin
          DB1.DBName := v_ip_fb+':PACSBASE';
          if ((strs1[1] <> 'LOGIN') and (strs1[1] <> 'STUDYLIST')) then // для этих форм не коннектимся
          begin
            try
              DB1.Connected := True;
              logs_writes('Connected to database ALIAS='+DB1.AliasName+#13+
                   'DBName := '+v_ip_fb+' :PACSBASE'+#13+
                   'UserName='+DB1.ConnectParams.UserName+#13+
                   'Password='+DB1.ConnectParams.Password );
            except
              on e:Exception do
                begin
                  logs_writes('error connect to database ALIAS='+DB1.AliasName+#13+' error: '+E.ClassName+#13+' with message : '+E.Message);
                  Exit;
                end;
            end;
            //
            MyStartTrans(trWrite1);
            trRead1.TRParams.Add('isc_tpb_read');
            trRead1.TRParams.Add('isc_tpb_nowait');
            trRead1.TRParams.Add('isc_tpb_read_committed');
            trRead1.TRParams.Add('isc_tpb_rec_version');
            MyStartTrans(trRead1);
          end;
        end;
      end;
      // ------------------------------------------------------------------------------------------
      v_p0 := strs1[0];
      v_p1 := strs1[1];
      try
        if v_IS_LOG_WRITE then begin
          logs_writes(DateTimeToStr(Now)+' : Получен Get-запрос '+v_p0+' : '+#13+
             v_p1+#13+'HeaderInfo '+HeaderInfo.URI);
        end;
      except
      end;
      v_strs11:=Uppercase(strs1[1]);
      try
        logs_writes( 'запрос : '+v_strs11 );
        if chk_not_conn or ((v_strs11='TEMP') and (Pos('.html',HeaderInfo.URI)>0)) then
        begin
          v_p2 := strs1[2];
          v_p3:=HeaderInfo.URI;
          if v_p3 <> '' then
          begin
            strs1.Text := 'filename=' + v_p3;
            RetFlStrm(v_p3, ResultHtmlDoc);
            if ClientThread.DocStream <> nil then
            begin
                if (Pos('.pdf',HeaderInfo.URI)>0) then
                begin
                  ClientThread.AnswerStream('', 'application/pdf', '');
                end else
                if (Pos('.js',HeaderInfo.URI)>0) then
                begin
                  ClientThread.AnswerStream('', 'application/javascript', '');
                end else
                if (Pos('.css',HeaderInfo.URI)>0) then
                begin
                  ClientThread.AnswerStream('', '	text/css', '');
                end else
                if (Pos('.png',HeaderInfo.URI)>0) then
                begin
                  ClientThread.AnswerStream('', ' image/png', '');
                end else
                if (Pos('.ttf',HeaderInfo.URI)>0) then
                begin
                  ClientThread.AnswerStream('', ' ', '');
                end else
                if (Pos('.gif',HeaderInfo.URI)>0) then
                begin
                  ClientThread.AnswerStream('', ' image/gif', '');
                end else
                if (Pos('.jpg',HeaderInfo.URI)>0) then
                begin
                  ClientThread.AnswerStream('', ' image/jpeg', '');
                end else
                if (Pos('.html',HeaderInfo.URI)>0) then
                begin
                  ClientThread.AnswerStream('', '', '');
                end else
                if (Pos('.woff',HeaderInfo.URI)>0) then
                begin
                  ClientThread.AnswerStream('', ' ', '');
                end;
            end;
          end
        end else
        if (v_strs11 = 'SETACTUALITY') then    // установка актуальности
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnSETACTUALITY(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'NEXTCONCLUSION') then    // запрос данных - следующее исследование
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnNEXTCONCLUSION(strs1, ResultHtmlDoc, True);
        end
        else
        if (v_strs11 = 'PREVCONCLUSION') then    // запрос данных - следующее исследование
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnNEXTCONCLUSION(strs1, ResultHtmlDoc, False);
        end
        else
        if (v_strs11 = 'JQRTEMPL') then    // запрос данных - список шаблонов
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnTEMPLDATAHTML(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'DELTEMPL') then    // удаление шаблона
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnDELTEMPL(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'DELUSER') then    // удаление пользователя
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnDELUSER(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'ADDUSER') then    // добавление пользователя
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnADDUSER(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'LPUDATA') then    // запрос данных - список ЛПУ
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnLPUDATAHTML(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'USERLISTDATA') then    // запрос данных - список пользователей
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnUsersDATAHTML(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'LPULIST') then    // список ЛПУ
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnLPUHTML(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'USERLIST') then    // список пользователей
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnUsersHTML(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'TEMPLLIST') then    // список шаблонов
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnTemplatesHTML(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'JQRCONCL') then   // запрос данных - заключения
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnJQRCONCLLst(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'LOGIN') then        // форма логина
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnLogin(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'CONCLUSIONS') then  // список протоколов/заключений
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnCONCLUSIONSList(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'STUDYLIST') then   // форма со списком исследований
        begin

          logs_writes('!!! ask STUDYLIST');

          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnStudyList(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'CONCLLIST') then    // форма со списком заключений
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnCONCLLIST(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'STUDIES') then      // запрос списка - исследования
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnStudies(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'GETIMGLIST') then      // запрос списка - изображений
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnIMGLIST(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'GETEXTIMGLIST') then      // запрос списка - изображений - расширенная информация
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnEXTIMGLIST(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'GETDICOMINFO') then      // запрос полного списка тегов исследования - расширенная информация
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnDICOMINFO(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'WORKLISTLIST') then   // форма со списком worklist
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnWorkListForm(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'WORKLIST') then      // запрос списка - worklist
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnWorkList(strs1, ResultHtmlDoc);
        end
        else
        if (v_strs11 = 'IMAGES') then  // форма со снимками
        begin
          if HeaderInfo.QueryString <> '' then
          begin
            strBreakApart(HeaderInfo.QueryString, '&', strs1);
            ReturnImagePage(strs1, ResultHtmlDoc);
          end;
        end
        else
        if (v_strs11 = 'WADO') then      // запрос данных - снимок
        begin
          if HeaderInfo.QueryString <> '' then
          begin
            strBreakApart(HeaderInfo.QueryString, '&', strs1);
            v_icon:=strs1.Values['icon'];
            vWidth:=strs1.Values['width'];
            vHeight:=strs1.Values['height'];
            v_frame:=strs1.Values['frame'];
            v_is_avi:=strs1.Values['avi'];
            logs_writes('REQUEST WADO '+HeaderInfo.QueryString);
            ClientThread.DocStream :=
              WADOServerCore1.SaveToWADOStream(strs1,
                            ResultHtmlDoc,
                            strx,
                            (v_icon='1'),
                            v_frame,
                            vWidth,
                            vHeight,
                            (v_is_avi='1') );
            ClientThread.AnswerStream('', 'image/jpeg', '');
          end;
        end
        else
        if (v_strs11 = 'DELCONCLUSION') then       // удалить заключение
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnDelConclusion(strs1, ResultHtmlDoc);
        end else
        if (v_strs11 = 'ADDCONCLUSION') then       // добавить заключение
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnAddConclusion(strs1, ResultHtmlDoc);
        end else
        if (v_strs11 = 'FULLCONCLUSION') then    // данные заключения
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnFullConclusion(strs1, ResultHtmlDoc);
        end else
        if (v_strs11 = 'FULLTEMPLATESMOD') then    // данные шаблона по модальности
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnFullMODTemplate(strs1, ResultHtmlDoc);
        end else

        if (v_strs11 = 'FULLTEMPLATES') then    // данные шаблона
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          ReturnFullTemplate(strs1, ResultHtmlDoc);
        end else
          logs_writes('Метод '+strs1[1]+' не найден ');
      finally
        if ResultHtmlDoc.Count > 0 then
          ClientThread.AnswerString('', '', '', ResultHtmlDoc.Text)
        else
          if ClientThread.DocStream <> nil then
        begin
          if strx1 = '' then
            if (Uppercase(strs1[1]) <> 'WADO') then  // см выше
              ClientThread.AnswerStream('', 'application/dicom', '')
          else
            ClientThread.AnswerStream('', strx1, '')
        end;
      {  else
        begin
          logs_writes('Answer404');
          ClientThread.Answer404;
        end; }

      end;
      // ------------------------------------------------------------------------------------------
    finally
      ResultHtmlDoc.Free;
      strs1.Free;
    //  strs2.Free;
      if not chk_not_conn then
      begin
        if v_isPostgres then
        begin

        end else begin
          MyEndTrans(trRead1);
          MyEndTrans(trWrite1);
          MyDBDisconnect(DB1);
          trWrite1.Free;
          trRead1.Free;
          DB1.Free;
        end;
      end;
    end;
  finally
    DecConnections;
  end;
end;

procedure TWADOServer.WADOServerCore1CommandPOST(ClientThread: THTTPClientThread;
  HeaderInfo: THeaderInfo; var EnableKeepAlive: Boolean);
var DB1 : TpFIBDatabase;
    trRead1, trWrite1 : TpFIBTransaction;
    ResultHtmlDoc: TStringList;
    strs1: TStringList;
    strx1, v_p0, v_p1: string;
  procedure SaveTextAreaTemplate(AParam, ResultHtmlDoc: TStrings);
    var v_id, v_MOD, v_COMM : string;
      v_id_int : Integer;
      FIBQuery : TpFIBQuery;
      v_filename : AnsiString;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
  begin
    v_MOD := Trim(AParam.Values['MOD']);
    v_COMM := Utf8ToAnsi(Trim(AParam.Values['COMM']));
    v_id := Trim(AParam.Values['id']);
    try
      v_id_int:=StrToInt(v_id);
    except
      v_id_int:=0;
    end;
    if (v_id_int=-1) then // добавим заключение
    begin
      if v_isPostgres then
      begin
        v_PGconn := DB_CMN.PgConnCrt;
        v_PGTrans := PGTransCreate (v_PGconn) ;
        v_PGTrans.DefaultConnection:=v_PGconn;
        try
          if v_PGconn<>nil then
            if v_PGconn.Connected then
            begin
              v_UniQr := TUniQuery.Create(nil);
              try
                v_UniQr.Connection:=v_PGconn;
                v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
                v_UniQr.SQL.Text := ' insert into '+v_pg_schema+'.templates ('+
                    ' studies_image_type, fc_comm ) values ('+
                    ' :p_studies_image_type, :p_fc_comm ) '+
                    ' returning fk_id';
                v_UniQr.ParamByName('p_STUDIES_IMAGE_TYPE').AsString:=v_MOD;
                v_UniQr.ParamByName('p_FC_COMM').AsString:=v_COMM;
                try
                  v_UniQr.ExecSQL;
                  v_id_int := v_UniQr.FieldByName('FK_ID').AsInteger;
                except
                  on e:Exception do
                    begin
                      ResultHtmlDoc.Add(E.ClassName+' '+E.Message);
                      Exit;
                    end;
                end;
              finally
                v_UniQr.Close;
                v_UniQr.Free;
              end;
            end else
              logs_writes( 'ERROR : not connected to PostgreSQL');
        finally
          DB_CMN.PgFree(v_PGconn,v_PGTrans);
        end;

      end else begin
        FIBQuery := TpFIBQuery.Create(nil);
        FIBQuery.Database := DB1;
        try
          FIBQuery.Transaction := trWrite1;
          FIBQuery.SQL.Text := ' insert into templates ('+
            ' studies_image_type, fc_comm ) values ('+
            ' :p_studies_image_type, :p_fc_comm ) '+
            ' returning fk_id';
          FIBQuery.ParamByName('p_STUDIES_IMAGE_TYPE').AsString:=v_MOD;
          FIBQuery.ParamByName('p_FC_COMM').AsString:=v_COMM;
          try
            FIBQuery.ExecQuery;
            v_id_int := FIBQuery.FieldByName('FK_ID').AsInteger;
          except
            on e:Exception do
              begin
                ResultHtmlDoc.Add(E.ClassName+' '+E.Message);
                Exit;
              end;
          end;
        finally
          FreeAndNil(FIBQuery);
        end;
      end;
    end;
    if (v_id_int>0) then
    begin
      if v_isPostgres then
      begin
        v_PGconn := DB_CMN.PgConnCrt;
        v_PGTrans := PGTransCreate (v_PGconn) ;
        v_PGTrans.DefaultConnection:=v_PGconn;
        try
          if v_PGconn<>nil then
            if v_PGconn.Connected then
            begin
              v_UniQr := TUniQuery.Create(nil);
              try
                v_filename := ExtractFilePath(paramstr(0))+'f'+IntToStr(gettickcount)+'.tmp';
                HeaderInfo.PostData.SaveToFile(v_filename);
                v_UniQr.Connection:=v_PGconn;
                v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
                v_UniQr.SQL.Text := 'update '+v_pg_schema+'.templates set fc_notes=:p_fc_notes, '+
                    'studies_image_type=:p_studies_image_type, fc_comm=:p_fc_comm where fk_id=:p_fk_id ';
                v_UniQr.ParamByName('p_FC_NOTES').LoadFromFile(v_filename,ftWideMemo);
                v_UniQr.ParamByName('p_FK_ID').AsInteger:=v_id_int;
                v_UniQr.ParamByName('p_STUDIES_IMAGE_TYPE').AsString:=v_MOD;
                v_UniQr.ParamByName('p_FC_COMM').AsString:=v_COMM;
                try
                  v_UniQr.ExecSQL;
                  ResultHtmlDoc.Add( '0' );
                except
                  on e:Exception do
                    ResultHtmlDoc.Add(E.ClassName+' '+E.Message);
                end;
              finally
                v_UniQr.Close;
                v_UniQr.Free;
              end;
            end else
              logs_writes( 'ERROR : not connected to PostgreSQL');
        finally
          DB_CMN.PgFree(v_PGconn,v_PGTrans);
        end;

      end else begin
        FIBQuery := TpFIBQuery.Create(nil);
        try
          v_filename := ExtractFilePath(paramstr(0))+'f'+IntToStr(gettickcount)+'.tmp';
          HeaderInfo.PostData.SaveToFile(v_filename);
          FIBQuery.Database := DB1;
          FIBQuery.Transaction := trWrite1;
          FIBQuery.SQL.Text := 'update TEMPLATES set FC_NOTES=:p_FC_NOTES, '+
            'STUDIES_IMAGE_TYPE=:p_STUDIES_IMAGE_TYPE, FC_COMM=:p_FC_COMM where FK_ID=:p_FK_ID ';
          FIBQuery.ParamByName('p_FC_NOTES').LoadFromFile(v_filename);
          FIBQuery.ParamByName('p_FK_ID').AsInteger:=v_id_int;
          FIBQuery.ParamByName('p_STUDIES_IMAGE_TYPE').AsString:=v_MOD;
          FIBQuery.ParamByName('p_FC_COMM').AsString:=v_COMM;
          try
            FIBQuery.ExecQuery;
            ResultHtmlDoc.Add( '0' );
          except
            on e:Exception do
              ResultHtmlDoc.Add(E.ClassName+' '+E.Message);
          end;
        finally
          FreeAndNil(FIBQuery);
          if FileExists(v_filename) then
            try
              DeleteFile(v_filename);
            except
            end;
        end;
      end;
    end; // else
    //  ResultHtmlDoc.Add( '-1' );
  end;
  procedure SaveTextAreaConclusion(AParam, ResultHtmlDoc: TStrings);
    var v_id, v_studyuid, v_ui : string;
      v_userid, v_id_int : Integer;
      FIBQuery : TpFIBQuery;
      v_filename : AnsiString;
      v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
  begin
    v_studyuid := Trim(AParam.Values['studyuid']);
    v_ui := Trim(AParam.Values['ui']);
    try
      v_userid:=StrToInt(v_ui);
    except
      v_userid:=0;
    end;
    v_id := Trim(AParam.Values['id']);
    try
      v_id_int:=StrToInt(v_id);
    except
      v_id_int:=0;
    end;
    if (v_id_int=-1) then // добавим заключение
    begin
      if v_isPostgres then
      begin
        v_PGconn := DB_CMN.PgConnCrt;
        v_PGTrans := PGTransCreate (v_PGconn) ;
        v_PGTrans.DefaultConnection:=v_PGconn;
        try
          if v_PGconn<>nil then
            if v_PGconn.Connected then
            begin
              v_UniQr := TUniQuery.Create(nil);
              try
                v_UniQr.Connection:=v_PGconn;
                v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
                v_UniQr.SQL.Text := ' insert into '+v_pg_schema+'.conclusions ('+
                  ' fd_date, fk_userid, fk_studyuid ) values ('+
                  ' :p_fd_date, :p_fk_userid, :p_fk_studyuid ) '+
                  ' returning fk_id';
                v_UniQr.ParamByName('p_FD_DATE').AsDateTime:=Now;
                try
                  v_userid:=StrToInt(v_ui);
                except
                  v_userid:=0;
                end;
                v_UniQr.ParamByName('p_FK_USERID').AsInteger:=v_userid;
                v_UniQr.ParamByName('p_FK_STUDYUID').AsString:=v_studyuid;
                try
                  v_UniQr.ExecSQL;
                  v_id_int := v_UniQr.FieldByName('FK_ID').AsInteger;
                except
                  on e:Exception do
                    begin
                      ResultHtmlDoc.Add(E.ClassName+' '+E.Message);
                      Exit;
                    end;
                end;
              finally
                v_UniQr.Close;
                v_UniQr.Free;
              end;
            end else
              logs_writes( 'ERROR : not connected to PostgreSQL');
        finally
          DB_CMN.PgFree(v_PGconn,v_PGTrans);
        end;

      end else begin
        FIBQuery := TpFIBQuery.Create(nil);
        FIBQuery.Database := DB1;
        try
          FIBQuery.Transaction := trWrite1;
          FIBQuery.SQL.Text := ' insert into CONCLUSIONS ('+
            ' FD_DATE, FK_USERID, FK_STUDYUID ) values ('+
            ' :p_FD_DATE, :p_FK_USERID, :p_FK_STUDYUID ) '+
            ' RETURNING FK_ID';
          FIBQuery.ParamByName('p_FD_DATE').AsDateTime:=Now;
          try
            v_userid:=StrToInt(v_ui);
          except
            v_userid:=0;
          end;
          FIBQuery.ParamByName('p_FK_USERID').AsInteger:=v_userid;
          FIBQuery.ParamByName('p_FK_STUDYUID').AsString:=v_studyuid;
          try
            FIBQuery.ExecQuery;
            v_id_int := FIBQuery.FieldByName('FK_ID').AsInteger;
          except
            on e:Exception do
              begin
                ResultHtmlDoc.Add(E.ClassName+' '+E.Message);
                Exit;
              end;
          end;
        finally
          FreeAndNil(FIBQuery);
        end;
      end;
    end;
    if ((v_id_int>0) and (v_userid>=0) and (v_studyuid<>'')) then
    begin
      if v_isPostgres then
      begin
        v_PGconn := DB_CMN.PgConnCrt;
        v_PGTrans := PGTransCreate (v_PGconn) ;
        v_PGTrans.DefaultConnection:=v_PGconn;
        try
          if v_PGconn<>nil then
            if v_PGconn.Connected then
            begin
              v_UniQr := TUniQuery.Create(nil);
              try
                v_filename := ExtractFilePath(paramstr(0))+'f'+IntToStr(gettickcount)+'.tmp';
                HeaderInfo.PostData.SaveToFile(v_filename);
                v_UniQr.Connection:=v_PGconn;
                v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
                v_UniQr.SQL.Text := 'update '+v_pg_schema+'.conclusions set fc_notes=:p_fc_notes '+
                  'where fk_id=:p_fk_id and fk_studyuid=:p_fk_studyuid';
                v_UniQr.ParamByName('p_FC_NOTES').LoadFromFile(v_filename,ftWideMemo);
                v_UniQr.ParamByName('p_FK_ID').AsInteger:=v_id_int;
                v_UniQr.ParamByName('p_FK_STUDYUID').AsString:=v_studyuid;
                try
                  v_UniQr.ExecSQL;
                  ResultHtmlDoc.Add( '0' );
                except
                  on e:Exception do
                    ResultHtmlDoc.Add(E.ClassName+' '+E.Message);
                end;
              finally
                v_UniQr.Close;
                v_UniQr.Free;
              end;
            end else
              logs_writes( 'ERROR : not connected to PostgreSQL');
        finally
          DB_CMN.PgFree(v_PGconn,v_PGTrans);
          if FileExists(v_filename) then
            try
              DeleteFile(v_filename);
            except
            end;
        end;

      end else begin
        FIBQuery := TpFIBQuery.Create(nil);
        try
          v_filename := ExtractFilePath(paramstr(0))+'f'+IntToStr(gettickcount)+'.tmp';
          HeaderInfo.PostData.SaveToFile(v_filename);
          FIBQuery.Database := DB1;
          FIBQuery.Transaction := trWrite1;
          FIBQuery.SQL.Text := 'update CONCLUSIONS set FC_NOTES=:p_FC_NOTES '+
            'where FK_ID=:p_FK_ID and FK_STUDYUID=:p_FK_STUDYUID';
          FIBQuery.ParamByName('p_FC_NOTES').LoadFromFile(v_filename);
          FIBQuery.ParamByName('p_FK_ID').AsInteger:=v_id_int;
          FIBQuery.ParamByName('p_FK_STUDYUID').AsString:=v_studyuid;
          try
            FIBQuery.ExecQuery;
            ResultHtmlDoc.Add( '0' );
          except
            on e:Exception do
              ResultHtmlDoc.Add(E.ClassName+' '+E.Message);
          end;
        finally
          FreeAndNil(FIBQuery);
          if FileExists(v_filename) then
            try
              DeleteFile(v_filename);
            except
            end;
        end;
      end;
    end; // else
    //  ResultHtmlDoc.Add( '-1' );
  end;
begin
  IncConnections;
  try
    ResultHtmlDoc := TStringList.Create;
    strs1 := TStringList.Create;
    strx1 := '';
    strBreakApart(HeaderInfo.URI, '/', strs1);

    if v_isPostgres then
    begin

    end else begin
      DB1:= TpFIBDatabase.Create(nil);
      trWrite1:= TpFIBTransaction.Create(nil);
      trWrite1.DefaultDatabase := DB1;
      trWrite1.TimeoutAction := TARollback ;
      trWrite1.TPBMode := tpbReadCommitted ;
      trRead1:= TpFIBTransaction.Create(nil);
      DB1.DefaultTransaction := trRead1;
      trRead1.DefaultDatabase := DB1;
      DB1.ConnectParams.UserName := 'sysdba';
      DB1.ConnectParams.Password := 'masterkey';
      DB1.ConnectParams.CharSet:='WIN1251';
    end;
    try
      if v_isPostgres then
      begin

      end else begin
        DB1.DBName := v_ip_fb+':PACSBASE';
      end;
      if ((strs1[1] <> 'LOGIN') and (strs1[1] <> 'STUDYLIST')) then // для этих форм не коннектимся
      begin
        if v_isPostgres then
        begin

        end else begin
          try
            DB1.Connected := True;
            logs_writes('Connected to database ALIAS='+DB1.AliasName+' DBName := '+v_ip_fb+':PACSBASE'+#13+
                 'UserName='+DB1.ConnectParams.UserName+#13+
                 'Password='+DB1.ConnectParams.Password );

          except
            on e:Exception do
              begin
                logs_writes('error connect to database ALIAS='+DB1.AliasName+' error: '+E.ClassName+' with message : '+E.Message);
                Exit;
              end;
          end;
          logs_writes('Connected to database ');
          MyStartTrans(trWrite1);
          trRead1.TRParams.Add('isc_tpb_read');
          trRead1.TRParams.Add('isc_tpb_nowait');
          trRead1.TRParams.Add('isc_tpb_read_committed');
          trRead1.TRParams.Add('isc_tpb_rec_version');
          MyStartTrans(trRead1);
        end;
      end;
      // ------------------------------------------------------------------------------------------
      try
        if v_IS_LOG_WRITE then
          logs_writes('Получен Get-запрос '+strs1[1]);
      except

      end;
      v_p0 := strs1[0];
      v_p1 := strs1[1];
      try
        if v_p1='SAVECONCLUSION' then
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          SaveTextAreaConclusion(strs1, ResultHtmlDoc);
        end else
        if v_p1='SAVETEMPLATE' then
        begin
          strBreakApart(HeaderInfo.QueryString, '&', strs1);
          SaveTextAreaTemplate(strs1, ResultHtmlDoc);
        end;
      finally
        if ResultHtmlDoc.Count > 0 then
          ClientThread.AnswerString('', '', '', ResultHtmlDoc.Text)
        else
          if ClientThread.DocStream <> nil then
        begin
          if strx1 = '' then
            if (strs1[1] <> 'WADO') then  // см выше
              ClientThread.AnswerStream('', 'application/dicom', '')
          else
            ClientThread.AnswerStream('', strx1, '')
      {  end
        else
        begin
          ClientThread.Answer404;   }
        end;

        ResultHtmlDoc.Free;
        strs1.Free;
      end;
      // ------------------------------------------------------------------------------------------
    finally
      if v_isPostgres then
      begin

      end else begin
        MyEndTrans(trRead1);
        MyEndTrans(trWrite1);
        MyDBDisconnect(DB1);
        trWrite1.Free;
        trRead1.Free;
        DB1.Free;
      end;
    end;
  finally
    DecConnections;
  end;
end;

function TWADOServer.TestFile(Query1: TDataset; basedir: string): string;
var
  pname: string;
begin
  pname := basedir + Trim(Query1.FieldByName('SERIESUID').AsString) + '\' +
      Trim(Query1.FieldByName('INSTANCEUID').asstring) + '.dcm';
  if FileExists(pname) then
  begin
    Result := pname;
    logs_writes('Find file '+pname);
  end else
  begin
    logs_writes('WARNING !!! 1: Not find file '+pname);
    pname := basedir + Trim(Query1.FieldByName('SERIESUID').AsString) + '\' +
    Trim(Query1.FieldByName('IMGNO').asstring) + '.dcm';
    if FileExists(pname) then
    begin
      Result := pname;
      logs_writes('Find file '+pname);
    end else
    begin
      logs_writes('WARNING !!! 2: Not find file '+pname);
      Result:='';
    end;
  end;
end;

function TWADOServer.TestFileMy(Query1: TpFIBDataSet; basedir: string): string;
var
  pname: string;
begin
  pname := basedir + Trim(Query1.FieldByName('SERIESUID').AsString) + '\' +
    Trim(Query1.FieldByName('IMGNO').asstring) + '.dcm';
  if FileExists(pname) then
    Result := pname
  else
  begin
    pname := basedir + Trim(Query1.FieldByName('SERIESUID').AsString) + '\' +
      Trim(Query1.FieldByName('INSTANCEUID').asstring) + '.dcm';
    if FileExists(pname) then
      Result := pname
    else
    begin
      pname := basedir + ' ' + Trim(Query1.FieldByName('SERIESUID').AsString) + '\' +
        Trim(Query1.FieldByName('IMGNO').asstring) + '.dcm';
      if FileExists(pname) then
        Result := pname
      else
        Result := '';
    end;
  end;
end;

procedure TWADOServer.Timer1Timer(Sender: TObject);
  function FileAccessDateToDateTime(FileTime : tFileTime) : tDateTime; 
  var LocalTime : tFileTime; 
      DOSFileTime : DWord;
  begin
    FileTimeToLocalFileTime(FileTime, LocalTime); // Compensate for time zone
    FileTimeToDosDateTime(LocalTime,  LongRec(DOSFileTime).Hi,
       LongRec(DOSFileTime).Lo);
    Result := FileDateToDateTime(DOSFileTime);
  end;
  function KillDir (Dir: AnsiString): boolean;
  var Sr: SysUtils.TSearchRec;
  begin
  {$I-}
    if (Dir <> '') and (Dir[length(Dir)] = '\') then
      Delete(Dir, length(dir), 1);
    if FindFirst(Dir + '\*.*',  faAnyFile, Sr) = 0 then
      repeat
        if (Sr.Name = '.') or (Sr.Name = '..') then
          continue;
        if (Sr.Attr and faDirectory <> faDirectory) then
        begin
//          if DaysBetween( FileAccessDateToDateTime(SR.FindData.ftCreationTime), Now ) > 1 then
            try
              FileSetReadOnly(Dir + '\' + sr.Name, False);
              DeleteFile(Dir + '\' + sr.Name);
            except
            end;
        end;
 //       else
 //         if all then KillDir(Dir + '\' + sr.Name, all);
      until FindNext(sr) <> 0;
    FindClose(sr);
  //  RemoveDir(Dir); // Удалит пустой каталог
    KillDir := (FileGetAttr(Dir) = -1);
  end;
begin
  if not vLckFilesDel then
  begin
    vLckFilesDel:=True;
    try
    //  KillDir( ExtractFilePath(paramstr(0))+'temp\' );
    finally
      vLckFilesDel:=False;
    end;
  end;
end;

function TWADOServer.TestDcmFileDir(AQuery: TDataset; var AImageDir: string): Boolean;
  function TestDir(ADir: string; ADate: TDatetime; ImageType: string): Boolean;
  var
    y, m, d: Word;
    str1: string;
  begin
    DecodeDate(adate, y, m, d);
    Result := false;
    if ADir[Length(ADir)] <> '\' then
      adir := adir + '\';
    if ImageType <> '' then
    begin
      str1 := adir + ImageType + '\' + IntToStr(y) + '\' + IntToStr(m) + '\' + IntToStr(d) + '\' +
        Trim(AQuery.FieldByName('STUDYUID').AsString) + '\';
    end
    else
    begin
      str1 := adir + Trim(AQuery.FieldByName('STUDYUID').AsString) + '\';
    end;
    if DirectoryExists(str1) then
    begin
      AImageDir := str1;
      Result := true;
    end
    else
    begin
      str1 := adir + Trim(AQuery.FieldByName('STUDYUID').AsString) + '\';
      if DirectoryExists(str1) then
      begin
        AImageDir := str1;
        Result := true;
      end else
      begin
        logs_writes('WARNING !!!  Directory '+str1+' not exist');
      end;
    end;
  end;
var
  date1: TDatetime;
  ImageType: string;
  f1: TField;
begin
  {  if AQuery.FieldByName('IMAGEDATE').IsNull then
      date1 := AQuery.FieldByName('LDATE').AsDatetime
    else}
//  AQuery.First;
//  while not AQuery.Eof do
  begin
    f1 := AQuery.FindField('STUDIESDATE');
    if not assigned(f1) then
      f1 := AQuery.FindField('IMAGEDATE');

    date1 := f1.AsDatetime;
    //  ImageType := AQuery.FieldByName('ImageType').AsString;
    ImageType := Trim(AQuery.FieldByName('IMAGETYPE').AsString);
    Result := TestDir(v_storage_folder, date1, ImageType);
    if Result then
      exit;
    {for i := 0 to KXConfig.ImagePathList.Count - 1 do
    begin
      if KXConfig.ImagePathList[i] <> '' then
      begin
        Result := TestDir(KXConfig.ImagePathList[i], date1, ImageType);
        if Result then
          exit;
      end;
    end; }
    //    AQuery.Next;
  end;
  //  AQuery.First;
end;

function TWADOServer.TestDcmFileDirMy(AQuery: TpFIBDataSet; var AImageDir: string): Boolean;
  function TestDir(ADir: string; ADate: TDatetime; ImageType: string): Boolean;
  var
    y, m, d: Word;
    str1: string;
  begin
    DecodeDate(adate, y, m, d);
    Result := false;
    if ADir[Length(ADir)] <> '\' then
      adir := adir + '\';
    if ImageType <> '' then
    begin
      str1 := adir + ImageType + '\' + IntToStr(y) + '\' + IntToStr(m) + '\' + IntToStr(d) + '\' +
        Trim(AQuery.FieldByName('STUDYUID').AsString) + '\';
    end
    else
    begin
      str1 := adir + Trim(AQuery.FieldByName('STUDYUID').AsString) + '\';
    end;
    if DirectoryExists(str1) then
    begin
      AImageDir := str1;
      Result := true;
    end
    else
    begin
      str1 := adir + Trim(AQuery.FieldByName('STUDYUID').AsString) + '\';
      if DirectoryExists(str1) then
      begin
        AImageDir := str1;
        Result := true;
      end;
    end;
  end;
var
  date1: TDatetime;
  ImageType: string;
  f1: TField;
begin
  {  if AQuery.FieldByName('IMAGEDATE').IsNull then
      date1 := AQuery.FieldByName('LDATE').AsDatetime
    else}
//  AQuery.First;
//  while not AQuery.Eof do
  begin
    f1 := AQuery.FindField('STUDIESDATE');
    if not assigned(f1) then
      f1 := AQuery.FindField('IMAGEDATE');

    date1 := f1.AsDatetime;
    //  ImageType := AQuery.FieldByName('ImageType').AsString;
    ImageType := Trim(AQuery.FieldByName('IMAGETYPE').AsString);
    Result := TestDir(v_storage_folder, date1, ImageType);
    if Result then
      exit;
    {for i := 0 to KXConfig.ImagePathList.Count - 1 do
    begin
      if KXConfig.ImagePathList[i] <> '' then
      begin
        Result := TestDir(KXConfig.ImagePathList[i], date1, ImageType);
        if Result then
          exit;
      end;
    end; }
    //    AQuery.Next;
  end;
  //  AQuery.First;
end;

procedure TWADOServer.WADOServerCore1FindImage(studyUID, seriesUID,
  objectUID: string; var ADataset: TDicomDataset);
var
  FIBDataSet : TpFIBDataSet;
  dd1: TDicomDataset;
  str1, sql1, basedir, pname: string;
  DB1: TpFIBDatabase;
//  trWrite1: TpFIBTransaction;
  trRead1: TpFIBTransaction;
//  v_CnsDMTable_tmp : TCnsDMTable;
  v_PGconn: TUniConnection; v_PGTrans : TUniTransaction; v_UniQr   : TUniQuery;
begin
  IncConnections;
  try
    ADataset := nil;
    {if studyUID <> '' then
      str1 := 'STUDYUID = ''' + studyUID + ''''
    else
      if seriesUID <> '' then
      str1 := 'SeriesUID = ''' + seriesUID + ''''
    else
      if objectUID <> '' then }
    str1 := 'instanceuid = ''' + objectUID + '''';
    if str1 = '' then
    begin
      exit;
    end;
    //
    if v_isPostgres then
    begin
      v_PGconn := DB_CMN.PgConnCrt;
      v_PGTrans := PGTransCreate (v_PGconn) ;
      v_PGTrans.DefaultConnection:=v_PGconn;
      try
        if v_PGconn<>nil then
          if v_PGconn.Connected then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_PGTrans;   // v_pg_schema
              v_UniQr.SQL.Text := 'select * from '+v_pg_schema+'.images where ' + str1 + ' order by seriesuid,imgno';
              try
                v_UniQr.Open;
              except
              on e:Exception do
                logs_writes( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
              end;
              v_UniQr.First;
              while not v_UniQr.eof do
              begin
                if TestDcmFileDir(v_UniQr, basedir) then
                begin
                  dd1 := TDicomDataset.Create;
                //  while not FIBDataSet.Eof do
                //  begin
                    pname := TestFile(v_UniQr, basedir);
                    if (pname <> '') then
                    begin
                      if dd1.LoadFromFile(pname) then
                      begin
                        ADataset := dd1;
                        exit;
                      end;
                    end;
                //    FIBDataSet.Next;
                //  end;
                end;
                v_UniQr.Next;
              end;
            finally
              v_UniQr.Close;
              v_UniQr.Free;
            end;
          end else
            logs_writes( 'ERROR : not connected to PostgreSQL');
      finally
        DB_CMN.PgFree(v_PGconn,v_PGTrans);
      end;
    end else begin
      DB1:= TpFIBDatabase.Create(nil);
    //  trWrite1:= TpFIBTransaction.Create(nil);
      trRead1:= TpFIBTransaction.Create(nil);
      DB1.DefaultTransaction := trRead1;
      trRead1.DefaultDatabase := DB1;
      DB1.ConnectParams.UserName := 'sysdba';
      DB1.ConnectParams.Password := 'masterkey';
      DB1.ConnectParams.CharSet:='WIN1251';
      try
        DB1.DBName := v_ip_fb+':PACSBASE';
        try
          DB1.Connected := True;
          logs_writes('Connected to database ALIAS='+DB1.AliasName+' DBName := '+v_ip_fb+':PACSBASE'+#13+
                 'UserName='+DB1.ConnectParams.UserName+#13+
                 'Password='+DB1.ConnectParams.Password );
        except
          on e:Exception do
            begin
              logs_writes('error connect to database ALIAS='+DB1.AliasName+' error: '+E.ClassName+' with message : '+E.Message);
              Exit;
            end;
        end;
        logs_writes('Connected to database ');
    //    MyStartTrans(trWrite1);
        trRead1.TRParams.Add('isc_tpb_read');
        trRead1.TRParams.Add('isc_tpb_nowait');
        trRead1.TRParams.Add('isc_tpb_read_committed');
        trRead1.TRParams.Add('isc_tpb_rec_version');
        MyStartTrans(trRead1);

        sql1 := 'SELECT * FROM IMAGES WHERE ' + str1 + ' ORDER BY SERIESUID,IMGNO';
        FIBDataSet := TpFIBDataSet.Create(nil);
        FIBDataSet.Database := DB1;
        try
          FIBDataSet.Transaction := trRead1;
          FIBDataSet.SQLs.SelectSQL.Clear;

          FIBDataSet.SQLs.SelectSQL.Text := sql1;
          FIBDataSet.Open;

          FIBDataSet.First;
          while not FIBDataSet.eof do
          begin
            if TestDcmFileDir(FIBDataSet, basedir) then
            begin
              dd1 := TDicomDataset.Create;
            //  while not FIBDataSet.Eof do
            //  begin
                pname := TestFile(FIBDataSet, basedir);
                if (pname <> '') then
                begin
                  if dd1.LoadFromFile(pname) then
                  begin
                    ADataset := dd1;
                    exit;
                  end;
                end;
            //    FIBDataSet.Next;
            //  end;
            end;
            FIBDataSet.Next;
          end;
        finally
          FreeAndNil(FIBDataSet);
        end;

      finally
        MyEndTrans(trRead1);
    //    MyEndTrans(trWrite1);
        MyDBDisconnect(DB1);
    //    trWrite1.Free;
        trRead1.Free;
        DB1.Free;
      end;
    end;

  finally
    DecConnections;
  end;
end;

// -----------------------------------------------------------------------------
// ------------------------  STRUCTURED REPORTS  -------------------------------
// -----------------------------------------------------------------------------

// формирование файла structured reports для отображения в webbrowser
procedure TWADOServer.pFrmStructuredReportWebBrowserFrm ( das: TDicomDataset; pFileName:string );
var FF : TextFile;
  procedure wrtHead;
  begin
    Writeln( FF, '<html><head><title>Comprehensive SR Document</title>'+
                 '<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">'+
                 '<meta name="generator" content="Dicom VCL"></head><body>' );
  end;
  procedure wrtFooter;
  begin
    Writeln( FF, '</body>' );
  end;    
  // Сохранение текста в файл для вывода в браузере
  // pTxt          - текст
  // pTypeText     - тип шрифта 0-обычный 1-обычный BOLD 2-большой bold 3-маленький 4-under 5-upper small
  // pIsBreakLine  - =True перенос строки после текста
  procedure wrtSrText ( pTxt : AnsiString; pTypeText:Integer=0; pIsBreakLine:Boolean=False );
  var vTxtTmp : string;
  begin
    vTxtTmp:= AnsiToUtf8(pTxt); // 
    if ((Trim(pTxt)='') and pIsBreakLine) then Exit;
    if pTypeText=0 then
      Writeln( FF, vTxtTmp )
    else if pTypeText=1 then
      Writeln( FF, '<b>'+vTxtTmp+'</b>' )
    else if pTypeText=2 then
      Writeln( FF, '<h1>'+vTxtTmp+'</h1>' )
    else if pTypeText=3 then
      Writeln( FF, '<p><small>'+vTxtTmp+'</small></p>' )
    else if pTypeText=4 then
      Writeln( FF, '<p><small><span class="under">'+vTxtTmp+'</span></small></p>' )
    else if pTypeText=5 then
      Writeln( FF, '<a><sup><small>'+vTxtTmp+'</a></sup></small>' );
    if pIsBreakLine then  Writeln( FF, '</BR>' );    
  end;
  procedure shHeadInfo ( pGrp, pEl : Integer; pTxt : string );
  begin
    if Assigned(das.Attributes.Item[ pGrp, pEl ] ) then
        if das.Attributes.GetString( pGrp, pEl )<>'' then
        begin
          wrtSrText ( pTxt, 1, False );
          wrtSrText ( das.Attributes.GetString( pGrp, pEl ), 0, True );
        end;
  end;
  procedure DcmFrmTree ( pDicomAttribute : TDicomAttribute; pShowTextTags:Boolean=False );
  var i:Integer; vValueType : string;
    procedure strTagWrt ( pfsDicomAttribute : TDicomAttribute;
                          pi       : Integer;
                          pGrp     : Word;
                          pEl      : Word;
                          pStr     : string ='';
                          pStrAft  : string ='';
                          pFont    : integer = 0;
                          pNewLine : boolean = True );
    begin
      if Assigned(pfsDicomAttribute.Attributes[pi].Item[ pGrp, pEl ] ) then
        if pfsDicomAttribute.Attributes[pi].GetString( pGrp, pEl )<>'' then
          if pStr='' then
            wrtSrText ( Trim( pfsDicomAttribute.Attributes[pi].GetString( pGrp, pEl )+' '+pStrAft ) , pFont, pNewLine )
          else
            wrtSrText ( Trim( pStr+' '+pfsDicomAttribute.Attributes[pi].GetString( pGrp, pEl )+' '+pStrAft ) , pFont, pNewLine );
    end;
    function GtStrTag ( pfsDicomAttribute : TDicomAttribute; pi:Integer; pGrp, pEl : Word; pStr:string ='' ):string;
    begin
      if Assigned(pfsDicomAttribute.Attributes[pi].Item[ pGrp, pEl ] ) then
        Result := pStr+pfsDicomAttribute.Attributes[pi].GetString( pGrp, pEl )
      else
        Result := '';
    end;
    procedure strTagTreeLoop ( pfsDicomAttribute : TDicomAttribute; pi:Integer; pGrp, pEl : Word; pNewLine:Boolean=True );
    begin
      if Assigned(pfsDicomAttribute.Attributes[pi].Item[ pGrp, pEl ] ) then
      begin
        if pNewLine then wrtSrText ( '', 0, True );
        DcmFrmTree( pfsDicomAttribute.Attributes[pi].Item[ pGrp, pEl ] );
      end;
    end;
    procedure pValTypeShow ( pHeaderStr:string; pfDicomAttribute : TDicomAttribute; pi:Integer; pValueType:string; pRelShow:Word=0 );
    var vStrTmp :string;
      function MyChkAss ( pGrp,pEl:Integer ):Boolean;
      begin
        Result:=Assigned(pfDicomAttribute.Attributes[pi].Item[ pGrp, pEl ] );
      end;
      function gtStr( pStr:string ):string;
      begin
        if pStr='Text Code' then Result:=''
        else if pStr='Code' then Result:=''
        else Result:=pStr;
      end;
    begin
      if pHeaderStr<>'' then wrtSrText ( pHeaderStr, 0, True );
    //  strTagWrt ( pfDicomAttribute, pi, $40, $A30A );   // NumericValue
      strTagTreeLoop( pfDicomAttribute, pi, $40, $A073 );
      strTagTreeLoop( pfDicomAttribute, pi, $40, $A043 );

      strTagTreeLoop( pfDicomAttribute, pi, $40, $A300 );
      strTagTreeLoop( pfDicomAttribute, pi, $40, $A730 ); // ContentSequence
      strTagTreeLoop( pfDicomAttribute, pi, $8, $1199 );  // ReferencedSOPSequence
    //  strTagTreeLoop( pfDicomAttribute, pi, $40, $A168 );
      //
      if MyChkAss( $40, $A168 ) then
      begin
        vStrTmp := gtStr ( TDicomAttribute(pfDicomAttribute.Attributes[pi].Item[ $0040, $A168 ]).Attributes[0].GetString($0008, $0104) ) ;
        if vStrTmp<>'Sample Code' then                         // !!!!!!!!!!!!!!!!!!!!
          wrtSrText ( Trim( vStrTmp ) , 0, True );
      end else
      if ((pValueType='TEXT') and MyChkAss($0040, $A160 ) and MyChkAss($0040, $A043 ) )
      then begin
        vStrTmp := ''; // gtStr ( TDicomAttribute(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ]).Attributes[0].GetString($0008, $0104) ) ;
        strTagWrt ( pfDicomAttribute, pi, $40, $A160, vStrTmp );
      end else
      //
      if MyChkAss( $0040, $A043 ) and  MyChkAss( $0040, $A300 )
      then begin
        vStrTmp := gtStr ( TDicomAttribute(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ]).Attributes[0].GetString($0008, $0104) ) ;
        wrtSrText ( Trim( vStrTmp ) , 0, True );
      end else
      if ( Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $A30A ] ) and
           Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $08EA ] ) )    // MeasurementUnitsCodeSequence
      then begin
        vStrTmp := TDicomAttribute(pfDicomAttribute.Attributes[pi].Item[ $0040, $08EA ]).Attributes[0].GetString($0008, $0100) ;
        strTagWrt ( pfDicomAttribute, pi, $40, $A30A, '', vStrTmp);
      end else
      //
     if Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ] ) and // Sequence Data
         Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $A120 ] )    // DateTime
     then begin
        strTagWrt ( pfDicomAttribute, pi, $40, $A120, ' ' );
      end else
      if Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ] ) and // Sequence Data
         Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $A121 ] )    // Date
      then begin
        strTagWrt ( pfDicomAttribute, pi, $40, $A121, ' ' );
      end else
      if Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ] ) and // Sequence Data
         Assigned(pfDicomAttribute.Attributes[pi].Item[ $40, $A122 ] )      // Time
      then begin
        strTagWrt ( pfDicomAttribute, pi, $40, $A122, ' ' );
      end else
      if Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ] ) and // Sequence Data
         Assigned(pfDicomAttribute.Attributes[pi].Item[ $40, $A123 ] )      // PersonName
      then begin
        strTagWrt ( pfDicomAttribute, pi, $40, $A123, ' ' );
      end else
      if pValueType='UIDREF' then begin
        vStrTmp := '' ; // TDicomAttribute(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ]).Attributes[0].GetString($0008, $0104) ;
        if Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ]) then
          strTagWrt ( pfDicomAttribute, pi, $40, $A124, vStrTmp )
        else
          strTagWrt ( pfDicomAttribute, pi, $40, $A124, '' );
      end else if pValueType='CONTAINER' then begin
        strTagTreeLoop( pfDicomAttribute, pi, $40, $A124, False );  
      end else if pValueType='TEXT' then begin
        if Assigned(pfDicomAttribute.Attributes[pi].Item[ $08, $0104 ] ) then
          if ((pfDicomAttribute.Attributes[pi].GetString( $08, $0104 ) <> 'Text Code')
          and (pfDicomAttribute.Attributes[pi].GetString( $08, $0104 ) <> 'Code')
          and (pfDicomAttribute.Attributes[pi].GetString( $08, $0104 ) <> 'Sample Code'))
          then
            strTagWrt ( pfDicomAttribute, pi, $08, $0104, '', '', 1, False );
      end else if pValueType='COMPOSITE' then begin
        wrtSrText ( 'COMPOSITE (references to other composite objects, such as reports) : ', 0, True );
      end else if pValueType='IMAGE' then begin
      //  RichView1.AddNL( 'Снимок (references to image objects) :' ,0,0);
      end else if pValueType='CODE' then begin
      //  RichView1.AddNL( 'coded entries :' ,0,0);
      end else if pValueType='NUM' then begin
      //  RichView1.AddNL( 'numeric measurements with units :' ,0,0);
      end else if pValueType='PNAME' then begin
        strTagWrt ( pfDicomAttribute, pi, $0040, $A123, 'Person Name :' );
      end else if pValueType='DATE' then begin
        strTagWrt ( pfDicomAttribute, pi, $40, $A121 );
      end else if pValueType='TIME' then begin
        strTagWrt ( pfDicomAttribute, pi, $40, $A122 );
      end else if pValueType='DATETIME' then begin
        strTagWrt ( pfDicomAttribute, pi, $40, $A120 );
      end else if pValueType='WAVEFORM' then begin
        wrtSrText ( 'references to waveforms :', 0, True );
      end else if pValueType='SCOORD' then begin
        wrtSrText ( 'spatial coordinates :', 0, True );
      end else if pValueType='TCOORD' then begin
        wrtSrText ( 'temporal coordinates :', 0, True );
      end else begin
     {   if vValueType<>'' then
          wrtSrText ( ' ОШИБКА : ТИП НЕ ОПРЕДЕЛЕН : '+vValueType, 0, True );
      end else
      begin  }
      //  strTagWrt ( pfDicomAttribute, pi, $40, $A160 );   // TextValue
        strTagWrt ( pfDicomAttribute, pi, $08, $0104, '', ' ', 1, True );  // CodeMeaning - text comment
      end;
    end;
  var v_tmp, v_str : string;
  begin
    if (Assigned(pDicomAttribute) and (pDicomAttribute<>nil)) then
    for I := 0 to pDicomAttribute.GetCount - 1 do
    begin
      if pDicomAttribute.Attributes[i].GetString( $8, $A104 )='Length Unit'
      then begin
        strTagWrt ( pDicomAttribute, i, $8, $100, '', ' ' );
      end else
      if Assigned(pDicomAttribute.Attributes[i].Item[ $08, $0104 ] ) and pShowTextTags then
        strTagWrt ( pDicomAttribute, i, $08, $0104, '', ' ', 1, False );
      vValueType:=GtStrTag ( pDicomAttribute, i, $40, $A040 );
      v_str := GtStrTag ( pDicomAttribute, i, $40, $A030 )+' '+
                          StringReplace( GtStrTag ( pDicomAttribute, i, $40, $A075, ' ' ), '^',' ', [rfReplaceAll, rfIgnoreCase])+' '+
                          GtStrTag ( pDicomAttribute, i, $40, $A027, ' ' ) ;
      if Trim(v_str)<>'' then wrtSrText ( 'Verifying Observers : '+v_str, 0, True );
      if Assigned(pDicomAttribute.Attributes[i].Item[ $40, $A010 ] ) then begin  //  Relationship Types
        v_tmp := pDicomAttribute.Attributes[i].GetString( $40, $A010 ) ;
        if v_tmp='HAS OBS CONTEXT' then begin
          pValTypeShow ( 'OBSERVATION CONTEXT :', pDicomAttribute, i, vValueType, 1 );
        end else if v_tmp='HAS ACQ CONTEXT' then begin
          pValTypeShow ( 'ACQUISITION CONTEXT :', pDicomAttribute, i, vValueType, 2 );
        end else if v_tmp='CONTAINS' then begin
          pValTypeShow ( '', pDicomAttribute, i, vValueType, 3 );
        end else if v_tmp='INFERRED FROM' then begin
          pValTypeShow ( 'INFERRED : ', pDicomAttribute, i, vValueType, 4 );
        end else if v_tmp='HAS PROPERTIES' then begin
          pValTypeShow ( 'Properties : ', pDicomAttribute, i, vValueType, 5 );
        end else if v_tmp='SELECTED FROM' then begin
          pValTypeShow ( 'SELECTED FROM : ', pDicomAttribute, i, vValueType, 6 );
        end else if v_tmp='HAS CONCEPT MOD' then begin
          pValTypeShow ( '', pDicomAttribute, i, vValueType, 7 ); //  Concept Modifier :
        end else begin
          pValTypeShow ( '', pDicomAttribute, i, vValueType );
        end;
      end else
        pValTypeShow ( '', pDicomAttribute, i, vValueType );
      strTagWrt ( pDicomAttribute, i, $8, $1150, 'SOPClassUID :' );      // ReferencedSOPClassUID
      strTagWrt ( pDicomAttribute, i, $8, $1155, 'SOPInstanceUID :' );   // ReferencedSOPInstanceUID
    end;
  end;
begin
  AssignFile( FF, pFileName );
  try
    Rewrite(FF);

    // wrtHead;

    if Assigned(das.Attributes.Item[ $10, $10 ] ) then
    begin
      wrtSrText ( 'Пациент : ', 1, False );
      wrtSrText ( StringReplace( das.Attributes.GetString( $10, $10 ), '^',' ',[rfReplaceAll, rfIgnoreCase]), 0, True );
    end;

    shHeadInfo ( $10, $30, 'Дата рождения : ' );

    if Assigned(das.Attributes.Item[ $10, $40 ] ) then
      if das.Attributes.GetString( $10, $40 )='F' then begin
        wrtSrText ( 'Пол : ', 1, False );
        wrtSrText ( 'женский', 0, True );
      end else begin
        wrtSrText ( 'Пол : ', 1, False );
        wrtSrText ( 'мужской', 0, True );
      end;

    shHeadInfo ( $8, $1030, 'Исследование : ' );
    shHeadInfo ( $8, $103E, 'Серия : ' );
    shHeadInfo ( $40, $A491, 'Completion Flag : ' );
    shHeadInfo ( $40, $A493, 'Verification Flag : ' );

    if das.Attributes.GetString( $8, $20 )<>'' then
    begin
      wrtSrText ( 'Дата исследования : ', 1, False );
      wrtSrText ( das.Attributes.GetString( $8, $20 )+' '+das.Attributes.GetString( $8, $30 ), 0, True );
    end;

    shHeadInfo ( $40, $A032, 'Observation Date : ' );

    if das.Attributes.GetString( $8, $23 )<>'' then
    begin
      wrtSrText ( 'Content Date : ', 1, False );
      wrtSrText ( das.Attributes.GetString( $8, $23 )+' '+das.Attributes.GetString( $8, $33 ), 0, True );
    end;

    shHeadInfo ( $0040, $A027, 'Verifying Organization : ' );
    shHeadInfo ( $0040, $A030, 'Verification Date Time : ' );
    shHeadInfo ( $0040, $A032, 'Observation Date Time : ' );

    wrtSrText ( '<hr>', 0, True );

    // das.SaveToFile('d:\test.dcm',True, JPEGLossless, 100 );

    if Assigned(das.Attributes.Item[ $8, $1199 ] ) then
      DcmFrmTree( das.Attributes.Item[ $8, $1199 ] );
    if Assigned(das.Attributes.Item[ $40, $A073 ] ) then
      DcmFrmTree( das.Attributes.Item[ $40, $A073 ] );
    if Assigned(das.Attributes.Item[ $40,$A043 ]) then
      DcmFrmTree ( das.Attributes.Item[ $40,$A043 ] ); //
    if Assigned(das.Attributes.Item[ $40,$A730 ]) then
      DcmFrmTree ( das.Attributes.Item[ $40,$A730 ] ); //

    // wrtFooter;
  finally
    CloseFile(FF);
  end;
end;

end.


// ECG 
                            {  v_n_chnl:=0;
                              //v_n_group:=0;
                              // SEQ Waveform Sequence
                               da1 := das1.Attributes.Item[ $5400,$100 ];
                              if assigned(da1) then
                              begin
                                vda1:=da1.GetCount;
                                ResultHtmlDoc.Add(' v_NumberofWaveformGroups['+inttostr(v_pos)+'-1]  = ' + IntToStr(vda1)+';' );   // общее кол-во каналов
                                SetLength(vArrAmm,vda1);
                                for l := 0 to vda1 - 1 do
                                begin
                                  // ------------------------------------------------------
                                  if Trim( da1.Attributes[l].GetString( $3A,$5 ) )<>'' then  // общее кол-во каналов
                                    ResultHtmlDoc.Add(' v_NumberofWaveformChannels[['+inttostr(v_pos)+'-1],['+inttostr(l)+']]  = ' + da1.Attributes[l].GetString( $3A,$5 )+';' )
                                  else
                                    ResultHtmlDoc.Add(' v_NumberofWaveformChannels[['+inttostr(v_pos)+'-1],['+inttostr(l)+']]  = 0;' );
                                  if Trim( da1.Attributes[l].GetString( $3A,$5 ) )<>'' then  // кол-во измерений в каналах
                                  begin
                                    if not TryStrToInt(da1.Attributes[l].GetString( $3A,$10 ),vArrAmm[l]) then
                                      vArrAmm[l] := 0;
                                    ResultHtmlDoc.Add(' v_NumberofWaveformSamples[['+inttostr(v_pos)+'-1],['+inttostr(l)+']]   = ' + da1.Attributes[l].GetString( $3A,$10 )+';' );
                                  end else
                                  begin
                                    vArrAmm[l] := 0;
                                    ResultHtmlDoc.Add(' v_NumberofWaveformSamples[['+inttostr(v_pos)+'-1],['+inttostr(l)+']]   = 0;' );
                                  end;
                                  // ------------------------------------------------------




                                  // ------------------------------------------------------
                                  if assigned(da1.Attributes[l].Item[ $3A,$1A ]) then
                                    v_freq := da1.Attributes[l].GetString( $3A,$1A )
                                  else
                                    v_freq := '500';
                                  if Trim(v_freq)='' then v_freq := '500';
                                  //
                                  v_n_chnl:=0;
                                  da3 := da1.Attributes[l].Item[ $3A, $200 ];  // ChannelDefinitionSequence
                                  if assigned(da3) then
                                  begin
                                    vda3:=da3.GetCount;
                                    for m := 0 to vda3 - 1 do
                                    begin
                                      da4 := da3.Attributes[m].Item[ $3A, $208 ];  // ChannelSourceSequence
                                      if assigned(da4) then
                                      begin
                                        vda4:=da4.GetCount;
                                        for n := 0 to vda4 - 1 do
                                        begin
                                          if da4.Attributes[n].GetString( $8,$0102 ) = 'SCPECG' then  // --------------------------------------------------------
                                          begin
                                            Inc(v_n_chnl);
                                            ResultHtmlDoc.Add(' v_freq = [['+inttostr(v_pos)+'-1],['+inttostr(v_n_chnl)+']]='+v_freq+';');
                                            ResultHtmlDoc.Add(' v_ECG_channelName = [['+inttostr(v_pos)+'-1],['+inttostr(v_n_chnl)+']]='''+da4.Attributes[n].GetString( $8,$0104 )+'''');
                                          end;
                                        end;
                                      end;
                                    end;
                                  end;
                                  v_AmmChannels := v_n_chnl;

                                  v_Datalen := da1.Attributes[l].GetDatalen( $5400,$1010 );
                                  if v_Datalen > 0 then
                                  begin
                                    daDATA := da1.Attributes[l].Item[$5400, $1010];
                                    if (daDATA <> nil) then
                                    begin
                                      b1 := daDATA.AsOBData[0];
                                      if b1 <> nil then
                                      begin
                                        fBuffer := b1.Memory;
                                        fBufferSize := b1.Size;
                                        // v_n_chnl - кол-во каналов

                                      //  vda1:=Trunc( vda1 * vArrAmm[l] );
                                        ResultHtmlDoc.Add('// --------------------- DATA in group of channels -- '+
                                               'группа='+inttostr(l)+' каналов='+inttostr(v_n_chnl)+' показаний='+inttostr(vArrAmm[l]) );
                                        if vda1>0 then
                                        begin
                                          for y := 0 to Trunc(vArrAmm[l]*v_n_chnl) - 1 do
                                          begin
                                            if v_n_chnl=0 then
                                            begin
                                              y1 := 0 ;
                                              x1 := 0 ;
                                            end else
                                            begin
                                              y1 := y mod v_n_chnl ;
                                              x1 := Trunc(y/v_n_chnl) ;
                                            end;
                                            b1.Read( v_var_tmp, 2 );
                                          //  var v_ECG = [[l],[y1],[x1]];        // [группа,канал,=показания]
                                            ResultHtmlDoc.Add(' v_ECG = [['+inttostr(v_pos)+'-1],['+inttostr(l)+'],['+inttostr(y1)+'],['+inttostr(x1)+']]='+inttostr(v_var_tmp)+';');
                                          end;
                                        end;
                                      end;
                                    end;
                                  end;
                                end;
                              end; }

