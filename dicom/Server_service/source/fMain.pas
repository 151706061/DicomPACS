unit fMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, pFIBProps, DB, FIBDataSet,
  pFIBDataSet, KXString, KXServerCore, DCM_Server, DCM_Attributes, Printers,
  DCM_Connection, DCM_UID, JvJCLUtils, DCM_Dict, DBTables, IniFiles, Variants,
  DCM_CLient, CnsSQLData, DICOM_charset, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, Uni, PostgreSQLUniProvider, ExtCtrls,
  Oracle, OracleData, DCM_log;

type
  TDicomServer = class(TService)
    DicomServer: TDicomServerCore;
    TimerAuotLoadDir: TTimer;
    tmClrLOG: TTimer;
    procedure ServiceExecute(Sender: TService);
    procedure DicomServerDatabaseSumitSQL(AClientThread: TDicomClientThread;
      ADBStr, ASQL: string; AFetchCount: Integer; UseMultiDatabase: Boolean;
      Params: TDicomAttribute; var AResult: TDataSet);
    procedure DicomServerDicomAssociation(AClientThread: TDicomClientThread;
      AAddress: string; AReg: TRequest; var AHandleType: Integer);
    procedure DicomServerDicomFilmPrint(AClientThread: TDicomClientThread;
      AAddress: string; APrintTask: TDicomPrintTask);
    procedure DicomServerDicomImage(AClientThread: TDicomClientThread;
      AAddress: string; ADataset: TDicomDataset);
    procedure DicomServerDicomFind(AClientThread: TDicomClientThread;
      AAddress: string; ACommand: TDicomAttributes; ARequestDatasets,
      AResponseDatasets: TList);
    procedure DicomServerDicomGet(AClientThread: TDicomClientThread;
      AAddress: string; ACommand: TDicomAttributes; ARequestDatasets,
      AResponseDatasets: TList);
    procedure DicomServerDicomLogit(AClientThread: TDicomClientThread; AIP,
      Msg: string);
    procedure DicomServerClientNewCommand(Sender: TObject;
      AAssociation: TAssociation; ADataset: TDicomAttributes;
      APosition: Integer; AStream: TStream);
    procedure DicomServerNormalisedReceived(AClientThread: TDicomClientThread;
      AAddress: string; ACommand: TDicomAttributes; ARequestDatasets,
      AResponseDatasets: TList);
    procedure DicomServerNormalisedReceivedNAction(
      AClientThread: TDicomClientThread; AAddress: string;
      ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
    procedure DicomServerGetCMoveLocalPort(AClientThread: TDicomClientThread;
      AET: string; var AHost: string; var APort: Integer);
    procedure DicomServerClientNewData(Sender: TObject;
      AAssociation: TAssociation; ADataset: TDicomAttributes;
      APosition: Integer; AStream: TStream);
    procedure ServiceDestroy(Sender: TObject);
    procedure ServiceShutdown(Sender: TService);
    procedure TimerAuotLoadDirTimer(Sender: TObject);
    procedure tmClrLOGTimer(Sender: TObject);
    procedure DicomServerNormalisedReceivedNDelete(
      AClientThread: TDicomClientThread; AAddress: string;
      ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
    procedure ServiceCreate(Sender: TObject);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
  private
    vAmmConnections : Integer;
    vUseSync        : Boolean;
    vDateTimeLastCheck : TDateTime;
    function fStopExecution:Boolean;
    procedure SumitSQL(
      AClientThread: TDicomClientThread; ADBStr, ASQL: string;
      AFetchCount: Integer; UseMultiDatabase: Boolean; Params: TDicomAttribute;
      var AResult: TDataSet);
    function AppendImage(AClientThread: TDicomClientThread;
                         DA: TDicomAttributes;
                         StudyID, PName, PDateBorn,
                         PSex, PatientID: string;
                         StudyDate: TDateTime;
                         pStudyUID, SeriesUID, InstanceUID,
                         ImageType, AID: string;
                         var AModility: string;
                         StudyDescription : string;
                         PhysName : string;
                         AccessionNumber : string;
                         p_Selected2 : integer = 0 ;
                         p_STUDYUID_OLD : string = ''
                        ): TDatetime;
    procedure ExecSQL(asql: string);
    function GetAge(AD1, AD2: TDatetime): string;
//    function TestDcmFileDir(AQuery: TDataset; var AImageDir: string): Boolean;
    function MyTestDcmFileDir( AClientThread: TDicomClientThread;
                               p_STUDYUID    : string;
                               p_STUDIESDATE : TDateTime;
                               p_IMAGEDATE   : TDateTime;
                               p_IMAGETYPE   : string;
                               p_base_dir    : string;
                               var AImageDir : string): Boolean;
//    function TestDcmFileDir_RemoteDir(AQuery: TDataset; var AImageDir: string): Boolean;
//    function TestFile(Query1: TDataset; basedir: string): string;
    function MyTestFile( AClientThread: TDicomClientThread;
                         p_SERIESUID : string;
                         p_INSTANCEUID : string;
                         p_IMGNO : string;
                         basedir : string
                       ): string;
//    procedure MyDisconnectAssociation(const p_CnsDicomConnection : TCnsDicomConnection);
  public
    sDir, sDirRemote, sLogDir,
    v_1_10_autoload_folder,
    v_1_11_autoload_timeout : string;
    vIsGenerateAccessionNumber,
    vAccNmbInPatientID : Boolean;
    nPort : Integer;
  //  DB : TFIBDatabase;
    procedure IncConnections;
    procedure DecConnections;
    procedure Logout(DataBase: TpFIBDatabase);
    procedure MyOnTerminate(Sender: TObject);
    function GetServiceController: TServiceController; override;
    procedure CmnMyDoQueryInsert( sEvent: string;
                           nType: Integer;
                           sRemark: string;
                           pAClientThread: TDicomClientThread = nil
                         );
    procedure SndHL7(  p_pid:string;
                       p_accn:string;
                       p_studyUID:string
                     );
  end;

// поток для отправки инфы в пациент НЕТ о том что исследование выполнено
TPacientNETSendANThread = class(TThread)
public
  f_accessionnumber      : string;
  f_studyuid             : string;
protected
  procedure Execute; override;
end;


// поток для пересылки снимков на другой пакс
TForwardThread = class(TThread)
private
  f_SessionID      : integer;
  f_CallingTitle   : string;
public
  v_studyUID_instance_sav, v_studyUID_instance_err : array of t_snimki1_rec;
protected
  procedure Execute; override;
end;

const c_pk_log = 'PACS_log'; // папка где будут храниться дополнительные логи
      c_ini_file = 'Settings.ini';

var
  DicomServer: TDicomServer;
  //
  v_ip_fb,
  v_AE_TITLE, v_LocAE : string;
  v_LocPort : integer;
  v_IS_DEVICES_CHECK,
  v_1_7_IS_LOG_WRITE,
  v_1_7_ANinPID,
  v_1_7_DCM_NET_LOG_WRITE ,
  v_1_8_IS_CHK_AETITLE,
  v_is_add_tags : Boolean;
  v_cur_tick ,
  v_ds_i : Integer;
  v_chk_snd_HL7 :boolean ;
  v_ip_hl7 : string ;
  v_port_hl7 : Integer ;

implementation

uses DateUtils, DICOM_CMN, CmnUnit, DB_CMN, Forms;

{$R *.DFM}

function TDicomServer.fStopExecution:Boolean;
begin
  if ((vAmmConnections>vPACS_max_connections) and (vPACS_max_connections>0)) then    // 1 - проверка на кол-во соединений
  begin
    Result:=True;
  end else
  if ( (vPACSMinFreeMemory>0) and (gtFreeVirtualMemory<vPACSMinFreeMemory) ) then // 2 - проверка на свободную память
  begin
    Result:=True;
  end else
    Result:=False;
end;

procedure TDicomServer.IncConnections;
var vTime : TDateTime;
begin
  vTime:=Now;
  if ((vAmmConnections>0) and (Abs(MinutesBetween(vDateTimeLastCheck,vTime))>30)) then
  begin
    vAmmConnections:=0;
    vDateTimeLastCheck:=Now;
  end;
  while (vUseSync or fStopExecution) and (SecondsBetween(vTime,Now)<=vPACSMaxTimeoutThreadWait)
    do Sleep(100);
  vUseSync:=True;
  Inc(vAmmConnections);
//  Lg_ev('inc vAmmConnections : '+inttostr(vAmmConnections));
  vUseSync:=False;
end;

procedure TDicomServer.DecConnections;
var vTime : TDateTime;
begin
  vTime:=Now;
  while vUseSync and (SecondsBetween(vTime,Now)<=vPACSMaxTimeoutThreadWait)
    do Sleep(100);
  vUseSync:=True;
  if vAmmConnections>0 then
    Dec(vAmmConnections);
//  Lg_ev('Dec vAmmConnections : '+inttostr(vAmmConnections));
  vUseSync:=False;
end;

{procedure LogSave ( pStr:string; pFileName:string='c:\tmp\_test.log' );
begin
  try
    MnFl_ev(pStr,pFileName);
  except
  end;
end;  }

procedure TDicomServer.Logout(DataBase: TpFIBDatabase);
var i: Integer;
begin
  if not DataBase.Connected then
    Exit;
  for i := 0 to DataBase.TransactionCount - 1 do
    if TpFIBTransaction(DataBase.Transactions[i]).InTransaction then
      TpFIBTransaction(DataBase.Transactions[i]).Commit;
      DataBase.CloseDataSets;
      DataBase.Close;
end;

// запись события в журнал
procedure TDicomServer.CmnMyDoQueryInsert( sEvent: string;
                           nType: Integer;
                           sRemark: string;
                           pAClientThread: TDicomClientThread = nil
                         );
var FIBQuery : TpFIBQuery; v_UniQr : TUniQuery; v_OraQr : TOracleQuery;
begin
  if not v_1_7_IS_LOG_WRITE then Exit;
  if not v_1_7_DB_LOG_WRITE then Exit;
  if v_isOracle then                     // ORACLE
  begin
    v_OraQr := TOracleQuery.Create(nil);
    try
      if pAClientThread=nil then begin
        v_OraQr.Session := DB_CMN.OraConn;
      end else begin
        v_OraQr.Session := pAClientThread.OraConn;
      end;
      v_OraQr.SQL.Text := ' insert into events (fc_name, fn_type, fd_date, fc_remark) '+#13+
                           ' values(:fc_name, :fn_type, :fd_date, :fc_remark) ';
      v_OraQr.DeclareAndSet('FC_NAME', otString , Copy(sEvent,1,250) );
      v_OraQr.DeclareAndSet('FN_TYPE', otInteger , nType );
      v_OraQr.DeclareAndSet('FD_DATE', otTimestamp , Now );
      v_OraQr.DeclareAndSet('FC_REMARK', otString , Copy(sRemark,1,10000) );
      try
        v_OraQr.Execute;
        v_OraQr.Session.Commit;
      except
        on e:Exception do
          begin
            v_OraQr.Session.Rollback;
            if v_1_7_IS_LOG_WRITE then
              MnLg_ev(e.Message);
            Exit;
          end;
      end;
    finally
      v_OraQr.Free;
    end;
  end else if DB_CMN.v_isPostgres then   // Postgres
  begin
    v_UniQr := TUniQuery.Create(nil);
    try
      if pAClientThread=nil then begin
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
      end else begin
        v_UniQr.Connection:=pAClientThread.PGconn;
        v_UniQr.Transaction:=pAClientThread.PGTrans;
      end;
      v_UniQr.SQL.Text := ' insert into '+v_pg_schema+'.events (fc_name, fn_type, fd_date, fc_remark) '+#13+
                           ' values(:fc_name, :fn_type, :fd_date, :fc_remark) ';
      v_UniQr.ParamByName('FC_NAME').AsString := Copy(sEvent,1,250);
      v_UniQr.ParamByName('FN_TYPE').AsInteger := nType;
      v_UniQr.ParamByName('FD_DATE').AsDateTime := Now;
      v_UniQr.ParamByName('FC_REMARK').AsString := Copy(sRemark,1,10000);
      try
        v_UniQr.Transaction.StartTransaction;
        v_UniQr.ExecSQL;
        if v_UniQr.Transaction.Active then
            v_UniQr.Transaction.Commit;
      except
        on e:Exception do
          begin
            v_UniQr.Transaction.Rollback;
            if v_1_7_IS_LOG_WRITE then
              MnLg_ev(e.Message);
            Exit;
          end;
      end;
    finally
      v_UniQr.Free;
    end;
  end else begin
    FIBQuery := TpFIBQuery.Create(nil);
    try
      if pAClientThread=nil then
      begin
        FIBQuery.Database := DB_CMN.LOGDB;
        FIBQuery.Transaction := DB_CMN.LOGtrWrite;
      end else
      begin
        FIBQuery.Database := (pAClientThread.v_ClThr_LOGDB as TpFIBDatabase);
        FIBQuery.Transaction := (pAClientThread.v_ClThr_LOGtrWrite as TpFIBTransaction);
      end;
      if not FIBQuery.Transaction.Active then
        FIBQuery.Transaction.Active:=True;
      FibQuery.Options := FibQuery.Options + [qoAutoCommit];
      FIBQuery.SQL.Text := ' INSERT INTO EVENTS(FC_NAME, FN_TYPE, FD_DATE, FC_REMARK) '+#13+
                           ' VALUES(:FC_NAME, :FN_TYPE, :FD_DATE, :FC_REMARK) ';
      FIBQuery.ParamByName('FC_NAME').AsString := Copy(sEvent,1,250);
      FIBQuery.ParamByName('FN_TYPE').AsInteger := nType;
      FIBQuery.ParamByName('FD_DATE').AsDateTime := Now;
      FIBQuery.ParamByName('FC_REMARK').AsString := Copy(sRemark,1,10000);
      try
        FIBQuery.ExecQuery;
      except
        on E : Exception do
          if v_1_7_IS_LOG_WRITE then
              MnLg_ev('ERROR '+E.Message);
      end;
    finally
      FIBQuery.Free;
    end;

  end;

end;

// для махаона заменить в запросе символ * на %
function SpSymbRepl (const p_str : AnsiString ):AnsiString;
begin
  SpSymbRepl:=StringReplace(p_str,'*','%',[rfReplaceAll, rfIgnoreCase]);
end;

procedure Lg_ev  ( const p_strs : ansistring;
                   const p_filename : ansistring = '';
                   const p_is_delim : Boolean = False );
begin
  try
    Application.ProcessMessages;
    if v_1_7_IS_LOG_WRITE then
    begin
      if trim(p_filename)='' then begin
        MnLg_ev(p_strs,DicomServer.sLogDir+'\'+'dcmevents.log');
      end else begin
        MnLg_ev(p_strs,p_filename);
      end;
    end;
  except
  end;
end;

procedure Log_ins( const p_strs : AnsiString;
                   const p_filename : ansistring = '' );
begin
  // Lg_ev(p_strs,DicomServer.sLogDir+'\'+'DicomServer.log');
  try
    if v_1_7_IS_LOG_WRITE then
    begin
      if trim(p_filename)='' then begin
        MnLg_ev(p_strs,DicomServer.sLogDir+'\'+'DicomServer.log');
      end else begin
        MnLg_ev(p_strs,p_filename);
      end;
    end;
  except
  end;
end;

procedure ds_sav ( const ADataset: TDicomAttributes;
                   const ARequestDatasets:  TList = nil;
                   const AResponseDatasets: TList = nil;
                   const p_suff : string = 'dcm' );
var v_tm_str, v_dir, vDir1 : AnsiString; rq, rq1 : TDicomAttributes;
    v_TStr : TStringList; v_I:integer; 
  function gt_filename (const p_str_in : ansistring) : AnsiString;
  begin
    Inc(v_cur_tick);
    gt_filename := v_dir +
                   inttostr(v_ds_i)+'_'+
                   v_tm_str+'_'+
                   p_str_in+'_'+
                   inttostr(v_I)+'_'+
                   inttostr(v_cur_tick)+'.'+p_suff;
  end;
  procedure pCrtDir;
  begin
    if not DirectoryExists(v_dir) then begin
      CreateDir(v_dir);
      Lg_ev('CreateDir '+v_dir);
    end;
  end;
begin
  if (v_1_7_IS_LOG_WRITE and (ADataset<>nil)) and v_1_7_DCM_NET_LOG_WRITE then
  try
    inc(v_ds_i);
    Lg_ev('ds_i='+inttostr(v_ds_i));
    v_tm_str:=inttostr(HourOf(Now))+inttostr(MinuteOf(Now))+inttostr(SecondOf(Now))+inttostr(MilliSecondOf(Now));
    v_dir:=DicomServer.sLogDir+'\';
    pCrtDir;
    v_dir:=DicomServer.sLogDir+'\'+c_pk_log+'\';
    pCrtDir;
    v_dir := v_dir + DateToStr(Date)+'\';
    pCrtDir;
    v_dir := v_dir + IntToStr(HourOf(Now))+'\';
    pCrtDir;
    Lg_ev( 'ADataset.Count='+IntToStr(ADataset.Count) );
    for v_I := 0 to ADataset.Count - 1 do begin
      ADataset.ItemByIndex[v_i].SaveToFile(gt_filename('ds'));
    end;
    v_I := 0;
    //
    Lg_ev('try to parse receive Command');
    try
      v_TStr := TStringList.Create;
      v_TStr.Clear;
      ADataset.ListAttrinute('receive Command: ', v_TStr);
      v_TStr.SaveToFile(gt_filename('cmd'));
      //
      Lg_ev('try to parse Receive Data');
      v_TStr.Clear;
      if ARequestDatasets<>nil then begin
        if ARequestDatasets.Count>0 then begin
          rq := TDicomAttributes(ARequestDatasets[0]);
          rq.ListAttrinute('Receive Data: ', v_TStr);
          v_TStr.SaveToFile(gt_filename('Rcv'));
        end;
      end else
        Lg_ev('ARequestDatasets=nil');
      Lg_ev('try to parse Response Data');
      v_TStr.Clear;
      if AResponseDatasets<>nil then begin
        if AResponseDatasets.Count>0 then begin
          rq1 := TDicomAttributes(AResponseDatasets[0]);
          rq1.ListAttrinute('Response Data: ', v_TStr);
          v_TStr.SaveToFile(gt_filename('rsp'));
        end;
      end else
        Lg_ev('AResponseDatasets=nil');
    finally
      FreeAndNil(v_TStr);
    end;
  except
    on E : Exception do
      Lg_ev('error save dataset : '+E.ClassName+' error raised, with message : '+E.Message);
  end;
end;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  DicomServer.Controller(CtrlCode);
end;

function TDicomServer.AppendImage( AClientThread: TDicomClientThread;
                                   DA: TDicomAttributes;
                                   StudyID, PName,
                                   PDateBorn, PSex, PatientID: string;
                                   StudyDate: TDateTime;
                                   pStudyUID, SeriesUID,
                                   InstanceUID, ImageType, AID: string;
                                   var AModility: string;
                                   StudyDescription,
                                   PhysName: string;
                                   AccessionNumber : string;
                                   p_Selected2 : integer = 0;
                                   p_STUDYUID_OLD : string = ''
                                 ): TDatetime;
var FIBQuery: TpFIBQuery;
    FIBDataSet: TpFIBDataSet;
    vORADataSet : TOracleDataSet;
    vORAQuery : TOracleQuery;
    DA1: TDicomAttribute;
    v_is_err, v_is_add : Boolean;
    v_SELECTEDINDEX1 : integer;
    vStudyUID : string;
  procedure StartSendToMisPacientNet (pAccessionNumber, pstudyuid :string);
  begin
    if vPACSSendToMisPacNet then
    begin
      with TPacientNETSendANThread.Create(true) do
      begin // поток после выполнения автоматически завершится,
        FreeOnTerminate := True;
        f_accessionnumber := pAccessionNumber;   // объект будет уничтожен
        f_studyuid := pstudyuid;
        FreeOnTerminate:=true;  // tpHigher - высокий         tpIdle - поток работает во время простоя системы
        Priority:=tpNormal;     // tpHighest - очень высокий  tpLowest - очень низкий
        Resume; // запуск потока: Create(true) - дождаться команды
      end;
    end;
  end;
  procedure p_start_write_trans;
  begin
    if AClientThread<>nil then
    begin
      if (AClientThread.v_ClThr_trWrite as TpFIBTransaction).Active = False then
        (AClientThread.v_ClThr_trWrite as TpFIBTransaction).StartTransaction;
    end else
    begin
      if trWrite.Active = False then
        trWrite.StartTransaction;
    end;
  end;
  procedure p_start_read_trans;
  begin
    if AClientThread<>nil then
    begin
      if (AClientThread.v_ClThr_trRead as TpFIBTransaction).Active = False then
        (AClientThread.v_ClThr_trRead as TpFIBTransaction).StartTransaction;
    end else
    begin
      if trRead.Active = False then
        trRead.StartTransaction;
    end;
  end;
  procedure wrt_trans_commit;
  begin
    try
      if AClientThread<>nil then
      begin
        if (AClientThread.v_ClThr_trWrite as TpFIBTransaction).Active then
        begin
          (AClientThread.v_ClThr_trWrite as TpFIBTransaction).Commit;
          (AClientThread.v_ClThr_trWrite as TpFIBTransaction).StartTransaction;
        end;
  //      (AClientThread.v_ClThr_trWrite as TpFIBTransaction).CommitRetaining;
      end else
      begin
  //      trWrite.CommitRetaining;
        if trWrite.Active then
        begin
          trWrite.Commit;
          trWrite.StartTransaction;
        end;
      end;
    except
    end;
  end;
  procedure rd_trans_commit;
  begin
    try
      if AClientThread<>nil then
      begin
        (AClientThread.v_ClThr_trRead as TpFIBTransaction).Commit;
        (AClientThread.v_ClThr_trRead as TpFIBTransaction).StartTransaction;
  //      (AClientThread.v_ClThr_trWrite as TpFIBTransaction).CommitRetaining;
      end else
      begin
  //      trWrite.CommitRetaining;
        trRead.Commit;
        trRead.StartTransaction;
      end;
    except
    end;
  end;
var v_UniQr, v_UniQr1 : TUniQuery; vFamIOGr : string; vDateBrn : TDateTime;
  procedure exec_sel;
  begin
    try
      v_UniQr.Open;
      v_UniQr.First;
    except
      on E : Exception do begin
        Lg_ev('ERROR: '+E.Message+' '+v_UniQr.SQL.Text);
        CmnMyDoQueryInsert ( 'ошибка SQL', 3, E.Message+' '+v_UniQr.SQL.Text, AClientThread );
        v_is_err:=True;
      end;
    end;
  end;
  procedure exec_upd;
  begin
    try
      v_UniQr1.Transaction.StartTransaction;
      v_UniQr1.ExecSQL;
      if v_UniQr1.Transaction.Active then
      v_UniQr1.Transaction.Commit;
    except
      on E : Exception do begin
        Lg_ev('ERROR: '+E.Message+' '+v_UniQr1.SQL.Text);
        CmnMyDoQueryInsert ( 'ошибка SQL', 3, E.Message+' '+v_UniQr1.SQL.Text, AClientThread );
        v_is_err:=True;
      end;
    end;
    v_UniQr1.Close;
  end;
begin
  vStudyUID := pStudyUID;
  v_is_err:=False;
  if v_1_7_IS_LOG_WRITE then
    CmnMyDoQueryInsert ( 'AppendImage',
                  4,
                  ' Patient Name='+PName+
                  ' PatientID='+PatientID +
                  ' StudyUID='+vStudyUID+
                  ' SeriesUID='+SeriesUID+
                  ' InstanceUID='+SeriesUID+
                  ' ImageType='+ImageType+
                  ' AID='+AID+
                  ' StudyDescription='+StudyDescription+
                  ' PhysName='+PhysName+
                  ' AccessionNumber='+AccessionNumber,
                  AClientThread
                );
  if PDateBorn = '' then
    vDateBrn := Now
  else
    vDateBrn := StrToDate(PDateBorn) ;
  vFamIOGr := Copy( ExtractWord(1, Trim(PName), [' ','^','.']), 1, 3 )+
              Copy( ExtractWord(2, Trim(PName), [' ','^','.']), 1, 1 )+
              Copy( ExtractWord(3, Trim(PName), [' ','^','.']), 1, 1 )+
              Copy( IntToStr( YearOf(vDateBrn) ), 3, 2 );
  if v_isOracle then                     // ORACLE
  begin
    vORADataSet := TOracleDataSet.Create(nil);
    vORAQuery := TOracleQuery.Create(nil);
    try
      if AClientThread=nil then begin
        vORADataSet.Session := DB_CMN.OraConn;
        vORAQuery.Session := DB_CMN.OraConn;
      end else begin
        vORADataSet.Session := AClientThread.OraConn;
        vORAQuery.Session := AClientThread.OraConn;
      end;
      Result := StudyDate;
  //1. Пациент (Patients)-->
      if not AClientThread.p_check_patientID(PatientID) then
      begin
        vORADataSet.SQL.Clear;
        vORADataSet.DeleteVariables;
        vORADataSet.SQL.Text := ' SELECT * FROM PATIENTS WHERE P_PID = UPPER(:P_PID) '; // ищем пациента (по P_PID - № МК)
        vORADataSet.DeclareAndSet('P_PID', otString , PatientID );
        try
          vORADataSet.Open;
          vORADataSet.First;
        except
          on E : Exception do begin
            Lg_ev('ERROR: '+E.Message+' '+vORADataSet.SQL.Text);
            CmnMyDoQueryInsert ( 'ошибка SQL', 3, E.Message+' '+vORADataSet.SQL.Text, AClientThread );
            v_is_err:=True;
          end;
        end;
        if not v_is_err then
        if ((vORADataSet.RecordCount <= 0) or (vORADataSet.Eof)) then // если query ничего не вернул (rowcount = 0), то INSERT
          begin
            vORAQuery.Close;
            vORAQuery.DeleteVariables;
            vORAQuery.SQL.Clear;
            vORAQuery.SQL.Add('INSERT INTO PATIENTS(P_ENAME, P_ENAME_RUS, P_SEX, P_PID, P_DATEBORN, P_FAM, P_IM, P_OTCH) '+#13+
                             ' VALUES(UPPER(:P_ENAME), UPPER(:P_ENAME_RUS), :P_SEX, UPPER(:P_PID), :P_DATEBORN, UPPER(:P_FAM), '+#13+
                             ' UPPER(:P_IM), UPPER(:P_OTCH)) ');
            vORAQuery.DeclareAndSet('P_ENAME', otString , PName );
            vORAQuery.DeclareAndSet('P_ENAME_RUS', otString , TranslitEng(PName) );
            if PDateBorn = '' then
              vORAQuery.DeclareAndSet('P_DATEBORN', otDate , Now )
            else
              vORAQuery.DeclareAndSet('P_DATEBORN', otDate , StrToDate(PDateBorn) );
            vORAQuery.DeclareAndSet('P_SEX', otString , pSex );
            vORAQuery.DeclareAndSet('P_PID', otString , PatientID );
            vORAQuery.DeclareAndSet('P_FAM', otString , TranslitEng(ExtractWord(1, PName, [' ','^','.'])) );
            vORAQuery.DeclareAndSet('P_IM', otString , TranslitEng(ExtractWord(2, PName, [' ','^','.'])) );
            vORAQuery.DeclareAndSet('P_OTCH', otString , TranslitEng(ExtractWord(3, PName, [' ','^','.'])) );
          try
            vORAQuery.Execute;
            vORAQuery.Session.Commit;
          except
            on E : Exception do begin
              Lg_ev('ERROR: '+E.Message+' '+vORAQuery.SQL.Text);
              CmnMyDoQueryInsert ( 'ошибка SQL', 3, E.Message+' '+vORAQuery.SQL.Text, AClientThread );
            end;
          end;
          vORADataSet.Close;
        end;
      end;
      v_is_err:=False;
  //2. Исследование (Studies)-->
      if not AClientThread.p_check_studyUID(vStudyUID,PatientID,ImageType) then
      begin
        vORADataSet.Close;
        vORADataSet.SQL.Clear;
        vORADataSet.DeleteVariables;
        vORADataSet.SQL.Text := ' SELECT * FROM STUDIES WHERE STUDYUID = UPPER(:STUDYUID) '; // ищем исследование
        vORADataSet.DeclareAndSet('STUDYUID', otString , vStudyUID );
        try
          vORADataSet.Open;
          vORADataSet.First;
        except
          on E : Exception do begin
            Lg_ev('ERROR: '+E.Message+' '+vORADataSet.SQL.Text);
            CmnMyDoQueryInsert ( 'ошибка SQL', 3, E.Message+' '+vORADataSet.SQL.Text, AClientThread );
            v_is_err:=True;
          end;
        end;
        if not v_is_err then
          if ((vORADataSet.RecordCount <= 0) or (vORADataSet.Eof)) then // если query ничего не вернул (rowcount = 0) то INSERT
          begin
            StartSendToMisPacientNet(AccessionNumber, vStudyUID);
            //
            vORAQuery.Close;
            vORAQuery.DeleteVariables;
            vORAQuery.SQL.Clear;
            vORAQuery.SQL.Add(' INSERT INTO STUDIES(STUDYUID, P_ENAME, P_ENAME_RUS, P_SEX, P_PID, BSTATE, LDATE, STUDYID, STUDIES_IMAGE_TYPE, '+#13+
                             '                     P_DATEBORN, STATUS, STUDYDESCRIPTION, REFERRINGPHYSICIANNAME, ACCESSIONNUMBER, FC_AEAPPARAT, STUDYUID_OLD) ');
            vORAQuery.SQL.Add(' VALUES(UPPER(:STUDYUID), UPPER(:P_ENAME), UPPER(:P_ENAME_RUS), :P_SEX, UPPER(:P_PID), 1, :LDATE, :STUDYID, :IMAGE_TYPE, :P_DATEBORN, 0, '+#13+
                             '        UPPER(:STUDYDESC), UPPER(:PHYSNAME), :PACCESSIONNUMBER, :FC_AEAPPARAT, :STUDYUID_OLD ) ');
            vORAQuery.DeclareAndSet('STUDYUID', otString , vStudyUID ); // Copy(StudyUID,1,80);
            vORAQuery.DeclareAndSet('STUDYUID_OLD', otString , p_STUDYUID_OLD );
            vORAQuery.DeclareAndSet('P_ENAME', otString , Copy(PName,1,50) );
            vORAQuery.DeclareAndSet('P_ENAME_RUS', otString , Copy(TranslitEng(PName),1,50) );
            vORAQuery.DeclareAndSet('P_SEX', otString , PSex );
            vORAQuery.DeclareAndSet('P_PID', otString , PatientID ); // Copy(PatientID,1,80);
            vORAQuery.DeclareAndSet('LDATE', otDate , StudyDate );
            vORAQuery.DeclareAndSet('STUDYID', otString , StudyID );
            vORAQuery.DeclareAndSet('IMAGE_TYPE', otString , ImageType );
            vORAQuery.DeclareAndSet('FC_AEAPPARAT', otString , AClientThread.vAEtitle );
            if PDateBorn = '' then
              vORAQuery.DeclareAndSet('P_DATEBORN', otDate , Now )
            else
              vORAQuery.DeclareAndSet('P_DATEBORN', otDate , StrToDate(PDateBorn) );
            vORAQuery.DeclareAndSet('STUDYDESC', otString , AnsiUpperCase( StudyDescription ) );
            vORAQuery.DeclareAndSet('PHYSNAME', otString , TranslitEng(PhysName) );
            vORAQuery.DeclareAndSet('PACCESSIONNUMBER', otString , AccessionNumber ); //Copy(AccessionNumber,1,20);
            try
              vORAQuery.Execute;
              vORAQuery.Session.Commit;
            except
              on E : Exception do begin
                Lg_ev('ERROR: '+E.Message+' '+vORAQuery.SQL.Text);
                CmnMyDoQueryInsert ( 'ошибка SQL', 3, E.Message+' '+vORAQuery.SQL.Text, AClientThread );
              end;
            end;
            vORADataSet.Close;
            AModility := ImageType;
          end else
          begin
            Result := vORADataSet.FieldByName('LDATE').AsDateTime;
            AModility := vORADataSet.FieldByName('STUDIES_IMAGE_TYPE').AsString;
          end;
      end;
      v_is_err:=False;
  //3. Серия (Series)-->
      if AClientThread.p_check_seriesUID(SeriesUID) then
      begin
        vORADataSet.Close;
        vORADataSet.SQL.Clear;
        vORADataSet.DeleteVariables;
        vORADataSet.SQL.Text := ' SELECT * FROM SERIES WHERE SERIESUID = UPPER(:SERIESUID) ';
        vORADataSet.DeclareAndSet('SERIESUID', otString , SeriesUID );
        try
          vORADataSet.Open;
          vORADataSet.First;
        except
          on E : Exception do begin
            Lg_ev('ERROR: '+E.Message+' '+vORADataSet.SQL.Text);
            CmnMyDoQueryInsert ( 'ошибка SQL', 3, E.Message+' '+vORADataSet.SQL.Text, AClientThread );
            v_is_err:=True;
          end;
        end;
        if not v_is_err then
        if ((vORADataSet.RecordCount <= 0) or (vORADataSet.Eof)) then
        begin
          vORAQuery.Close;
          vORAQuery.DeleteVariables;
          vORAQuery.SQL.Clear;
          vORAQuery.SQL.Add(' INSERT INTO SERIES(STUDYUID, SERIESUID, SERIES_IMAGETYPE, SERIES_DESC, SERIES_DATE, ACCESSIONNUMBER) '+#13+
                           ' VALUES(UPPER(:STUDYUID),UPPER(:SERIESUID),:SERIES_IMAGETYPE,:SERIES_DESC,:SERIES_DATE, :PACCESSIONNUMBER) ');
          vORAQuery.DeclareAndSet('STUDYUID', otString , vStudyUID );
          vORAQuery.DeclareAndSet('SERIESUID', otString , SeriesUID );
          vORAQuery.DeclareAndSet('SERIES_IMAGETYPE', otString , AModility ); //ImageType
          vORAQuery.DeclareAndSet('SERIES_DESC', otString , DA.GetString($0008, $103E) );
          DA1 := DA.Item[$8, $0021]; // Tag Series Date                              !!!!!!!!!!!!!!!!!!!!!  переделать под настройку тегов
          if Assigned(DA1) and (DA1.GetCount > 0) then
            vORAQuery.DeclareAndSet('SERIES_DATE', otDate , DA1.AsDatetime[0] )
          else
            vORAQuery.DeclareAndSet('SERIES_DATE', otDate , Now );
          vORAQuery.DeclareAndSet('PACCESSIONNUMBER', otString , AccessionNumber );
          try
            vORAQuery.Execute;
            vORAQuery.Session.Commit;
          except
            on E : Exception do begin
              Lg_ev('ERROR: '+E.Message+' '+vORAQuery.SQL.Text);
              CmnMyDoQueryInsert ( 'ошибка SQL', 3, E.Message+' '+vORAQuery.SQL.Text, AClientThread );
            end;
          end;
          vORADataSet.Close;
        end;
      end;
      v_is_err:=False;
  //4. Снимок (Images)-->
      v_SELECTEDINDEX1:=0;
      vORADataSet.Close;
      vORADataSet.SQL.Clear;
      vORADataSet.DeleteVariables;
      vORADataSet.SQL.Text := ' SELECT * FROM IMAGES WHERE INSTANCEUID = UPPER(:INSTANCEUID) ';
      vORADataSet.DeclareAndSet('INSTANCEUID', otString , InstanceUID );
      try
        vORADataSet.Open;
        vORADataSet.First;
        if not vORADataSet.Eof then
        begin
          v_SELECTEDINDEX1:=vORADataSet.FieldByName('SELECTEDINDEX1').AsInteger;
        end;
      except
        on E : Exception do begin
          Lg_ev('ERROR: '+E.Message+' '+vORADataSet.SQL.Text);
          CmnMyDoQueryInsert ( 'ошибка SQL', 3, E.Message+' '+vORADataSet.SQL.Text, AClientThread );
          v_is_err:=True;
        end;
      end;
      v_is_add:=False;
      if not v_is_err then
      begin
        if ((vORADataSet.RecordCount <= 0) or (vORADataSet.Eof)) then
        begin
          vORAQuery.Close;
          vORAQuery.DeleteVariables;
          vORAQuery.SQL.Clear;
          vORAQuery.SQL.Add(' INSERT INTO IMAGES (STUDYUID, SERIESUID, INSTANCEUID, IMGNO, IMAGETYPE, IMAGEDATE, '+#13+
                           '                     P_PID, SIZEX, SIZEY, PHOTOMETRIC, BITS, ABITS, BITS_PER_SAMPLE, '+#13+
                           '                      SELECTEDINDEX1, STUDIESDATE, ACCESSIONNUMBER)');
          vORAQuery.SQL.Add(' VALUES(UPPER(:STUDYUID), UPPER(:SERIESUID), UPPER(:INSTANCEUID), :IMGNO, :IMAGE_TYPE, :LDATE, UPPER(:P_PID),' +#13+
                           '        :SIZEX, :SIZEY, :PHOTOMETRIC, :BITS, :ABITS, :BITS_PER_SAMPLE, :SELECTEDINDEX1, '+#13+
                           '                      :STUDIESDATE, :PACCESSIONNUMBER)');
          vORAQuery.DeclareAndSet('STUDYUID', otString , vStudyUID ) ;
          vORAQuery.DeclareAndSet('SERIESUID', otString , SeriesUID ) ;
          vORAQuery.DeclareAndSet('INSTANCEUID', otString , InstanceUID ) ;
          vORAQuery.DeclareAndSet('IMGNO', otInteger , StrToInt(AID) ) ;
          vORAQuery.DeclareAndSet('IMAGE_TYPE', otString , AModility ) ; //ImageType
          vORAQuery.DeclareAndSet('LDATE', otDate , StudyDate ) ;
          vORAQuery.DeclareAndSet('P_PID', otString , PatientID ) ;
          vORAQuery.DeclareAndSet('SIZEX', otInteger , DA.GetInteger($28, $10) ) ; // Tag Rows (Ширина)
          vORAQuery.DeclareAndSet('SIZEY', otInteger , DA.GetInteger($28, $11) ) ; //Tag Columns (Высота)
          vORAQuery.DeclareAndSet('BITS', otInteger , DA.GetInteger($28, $101) ) ; //Tag Bits Stored (занято битов)
          vORAQuery.DeclareAndSet('ABITS', otInteger , DA.GetInteger($28, $100) ) ; //Tag Bits Allocated (выделено, забронировано битов)
          vORAQuery.DeclareAndSet('BITS_PER_SAMPLE', otInteger , DA.GetInteger($28, 2) ) ; //Tag Samples per Pixel
          vORAQuery.DeclareAndSet('STUDIESDATE', otDate , StudyDate ) ;
          vORAQuery.DeclareAndSet('PHOTOMETRIC', otString , DA.GetString($28, 4) ) ; // Photometric Interpretation
          vORAQuery.DeclareAndSet('PACCESSIONNUMBER', otString , AccessionNumber ) ;
          vORAQuery.DeclareAndSet('SELECTEDINDEX1', otInteger  , p_Selected2 ) ;
          try
            vORAQuery.Execute;
            vORAQuery.Session.Commit;
            v_is_add:=True;
          except
            on E : Exception do begin
              Lg_ev('ERROR: '+E.Message+' '+vORAQuery.SQL.Text);
              CmnMyDoQueryInsert ( 'ошибка SQL', 3, E.Message+' '+vORAQuery.SQL.Text, AClientThread );
            end;
          end;
          vORAQuery.Close;
        end;
      end;
      if not v_is_add then
      begin
        if (v_SELECTEDINDEX1<>p_Selected2) then
        begin
          vORAQuery.Close;
          vORAQuery.DeleteVariables;
          vORAQuery.SQL.Clear;
          vORAQuery.SQL.Add(' UPDATE IMAGES SET SELECTEDINDEX1 = :SELECTEDINDEX1 WHERE INSTANCEUID = UPPER(:INSTANCEUID)');
          vORAQuery.DeclareAndSet('INSTANCEUID', otString , InstanceUID ) ;
          vORAQuery.DeclareAndSet('SELECTEDINDEX1', otInteger  , p_Selected2 ) ;
          try
            vORAQuery.Execute;
            vORAQuery.Session.Commit;
          except
            on E : Exception do begin
              Lg_ev('ERROR: '+E.Message+' '+vORAQuery.SQL.Text);
              CmnMyDoQueryInsert ( 'ошибка SQL', 3, E.Message+' '+vORAQuery.SQL.Text, AClientThread );
            end;
          end;
        end;
      end;
    finally
      FreeAndNil(vORAQuery);
      FreeAndNil(vORADataSet);
    end;
  end else if v_isPostgres then begin    // Postgres
    v_UniQr := TUniQuery.Create(nil);
    v_UniQr1 := TUniQuery.Create(nil);
    try
      if AClientThread=nil then begin
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        v_UniQr1.Connection:=DB_CMN.PGconn;
        v_UniQr1.Transaction:=DB_CMN.MnUniTransaction;
      end else begin
        v_UniQr.Connection:=AClientThread.PGconn;
        v_UniQr.Transaction:=AClientThread.PGTrans;
        v_UniQr1.Connection:=AClientThread.PGconn;
        v_UniQr1.Transaction:=AClientThread.PGTrans;
      end;
      Result := StudyDate;
  //1. Пациент (Patients)-->
      if not AClientThread.p_check_patientID(PatientID) then
      begin
        v_UniQr.SQL.Text := ' select * from '+v_pg_schema+'.patients where p_pid = upper(:p_pid) '; // ищем пациента (по p_pid - № мк)
        v_UniQr.ParamByName('P_PID').AsString := PatientID;
        exec_sel;
        if not v_is_err then
        if v_UniQr.Eof then // если query ничего не вернул , то INSERT
          begin
            v_UniQr1.Close;
            v_UniQr1.SQL.Text:= 'insert into '+v_pg_schema+'.patients ( p_ename, p_ename_rus, p_sex, p_pid, p_dateborn, p_fam, p_im, p_otch) '+
                             ' values(upper(:p_ename), upper(:p_ename_rus), :p_sex, upper(:p_pid), :p_dateborn, upper(:p_fam), upper(:p_im), upper(:p_otch)) ';
            v_UniQr1.ParamByName('P_ENAME').AsString := PName;
            v_UniQr1.ParamByName('P_ENAME_RUS').AsString := TranslitEng(PName);
            if PDateBorn = '' then
              v_UniQr1.ParamByName('P_DATEBORN').AsDateTime := Now
            else
              v_UniQr1.ParamByName('P_DATEBORN').AsDateTime := StrToDate(PDateBorn);
            v_UniQr1.ParamByName('P_SEX').AsString := pSex;
            v_UniQr1.ParamByName('P_PID').AsString := PatientID;
            v_UniQr1.ParamByName('P_FAM').AsString := TranslitEng(ExtractWord(1, PName, [' ','^','.']));
            v_UniQr1.ParamByName('P_IM').AsString := TranslitEng(ExtractWord(2, PName, [' ','^','.']));
            v_UniQr1.ParamByName('P_OTCH').AsString := TranslitEng(ExtractWord(3, PName, [' ','^','.']));
          exec_upd;
        end;
      end;
      v_is_err:=False;
  //2. Исследование (Studies)-->
      if not AClientThread.p_check_studyUID(vStudyUID,PatientID,ImageType) then
      begin
        v_UniQr.Close;
        v_UniQr.SQL.Text := ' select * from '+v_pg_schema+'.studies where studyuid = upper(:studyuid) '; // ищем исследование
        v_UniQr.ParamByName('STUDYUID').AsString := vStudyUID;
        exec_sel;
        if not v_is_err then
        if v_UniQr.Eof then // если query ничего не вернул (rowcount = 0) то INSERT
          begin
            StartSendToMisPacientNet(AccessionNumber,vStudyUID);
            //
            v_UniQr1.Close;
            v_UniQr1.SQL.Text := ' insert into '+v_pg_schema+'.studies (studyuid, p_ename, p_ename_rus, p_sex,'+
                             '                     p_pid, bstate, ldate, studyid, studies_image_type, '+
                             '                     p_dateborn, status, studydescription, referringphysicianname, accessionnumber) '+
                             ' values ( upper(:studyuid), upper(:p_ename), upper(:p_ename_rus), :p_sex, upper(:p_pid), '+
                             '        1, :ldate, :studyid, :image_type, :p_dateborn, 0, '+
                             '        upper(:studydesc), upper(:physname), :paccessionnumber ) ';
            v_UniQr1.ParamByName('STUDYUID').AsString := vStudyUID; // Copy(StudyUID,1,80);
            v_UniQr1.ParamByName('P_ENAME').AsString := Copy(PName,1,50);
            v_UniQr1.ParamByName('P_ENAME_RUS').AsString := Copy(TranslitEng(PName),1,50);
            v_UniQr1.ParamByName('P_SEX').AsString := PSex;
            v_UniQr1.ParamByName('P_PID').AsString := PatientID; // Copy(PatientID,1,80);
            v_UniQr1.ParamByName('LDATE').AsDatetime := StudyDate;
            v_UniQr1.ParamByName('STUDYID').AsString := StudyID;
            v_UniQr1.ParamByName('IMAGE_TYPE').AsString := ImageType;
            if PDateBorn = '' then
              v_UniQr1.ParamByName('P_DATEBORN').AsDateTime := Now
            else
              v_UniQr1.ParamByName('P_DATEBORN').AsDateTime := StrToDate(PDateBorn);
            v_UniQr1.ParamByName('STUDYDESC').AsString := AnsiUpperCase( StudyDescription );
            v_UniQr1.ParamByName('PHYSNAME').AsString := TranslitEng(PhysName);
            v_UniQr1.ParamByName('PACCESSIONNUMBER').AsString := AccessionNumber; //Copy(AccessionNumber,1,20);
            exec_upd;
            AModility := ImageType;
          end else
        begin
          Result := v_UniQr.FieldByName('LDATE').AsDatetime;
          AModility := v_UniQr.FieldByName('STUDIES_IMAGE_TYPE').AsString;
        end;
      end;
      v_is_err:=False;
  //3. Серия (Series)-->
      if AClientThread.p_check_seriesUID(SeriesUID) then
      begin
        v_UniQr.Close;
        v_UniQr.SQL.Text := ' select * from '+v_pg_schema+'.series where seriesuid = upper(:seriesuid) ';
        v_UniQr.ParamByName('SERIESUID').AsString := SeriesUID;
        exec_sel;
        if not v_is_err then
        if v_UniQr.Eof then
        begin
          v_UniQr1.Close;
          v_UniQr1.SQL.Text := ' insert into '+v_pg_schema+'.series (studyuid, seriesuid, series_imagetype, '+
                           ' series_desc, series_date, accessionnumber) '+
                           ' values(upper(:studyuid),upper(:seriesuid),:series_imagetype,:series_desc,:series_date, :paccessionnumber) ';
          v_UniQr1.ParamByName('STUDYUID').AsString := vStudyUID;
          v_UniQr1.ParamByName('SERIESUID').AsString := SeriesUID;
          v_UniQr1.ParamByName('SERIES_IMAGETYPE').AsString := AModility; //ImageType
          v_UniQr1.ParamByName('SERIES_DESC').AsString := DA.GetString($0008, $103E);
          DA1 := DA.Item[$8, $0021]; // Tag Series Date
          if Assigned(DA1) and (DA1.GetCount > 0) then
            v_UniQr1.ParamByName('SERIES_DATE').AsDatetime := DA1.AsDatetime[0]
          else
            v_UniQr1.ParamByName('SERIES_DATE').AsDatetime := Now;
          v_UniQr1.ParamByName('PACCESSIONNUMBER').AsString := AccessionNumber;
          exec_upd;
        end;
      end;
      v_is_err:=False;
  //4. Снимок (Images)-->
      v_SELECTEDINDEX1:=0;
      v_UniQr.Close;
      v_UniQr.SQL.Text := ' select * from '+v_pg_schema+'.images where instanceuid = upper(:instanceuid) ';
      v_UniQr.ParamByName('INSTANCEUID').AsString := InstanceUID;
      try
        v_UniQr.Open;
        v_UniQr.First;
        if not v_UniQr.Eof then
        begin
          v_SELECTEDINDEX1:=v_UniQr.FieldByName('SELECTEDINDEX1').AsInteger;
        end;
      except
        on E : Exception do begin
          Lg_ev('ERROR: '+E.Message+' '+v_UniQr.SQL.Text);
          CmnMyDoQueryInsert ( 'ошибка SQL', 3, E.Message+' '+v_UniQr.SQL.Text, AClientThread );
          v_is_err:=True;
        end;
      end;
      v_is_add:=False;
      if not v_is_err then
      begin
        if v_UniQr.Eof then
        begin
          v_UniQr1.Close;
          v_UniQr1.SQL.Text := ' insert into '+v_pg_schema+'.images (studyuid, seriesuid, instanceuid, imgno, imagetype, imagedate, '+
                           '  p_pid, sizex, sizey, photometric, bits, abits, bits_per_sample, selectedindex1, studiesdate, accessionnumber)'+
                           ' values(upper(:studyuid), upper(:seriesuid), upper(:instanceuid), :imgno, :image_type, :ldate, upper(:p_pid),' +
                           '        :sizex, :sizey, :photometric, :bits, :abits, :bits_per_sample, :selectedindex1, '+
                           '                      :studiesdate, :paccessionnumber)';
          v_UniQr1.ParamByName('STUDYUID').AsString := vStudyUID;
          v_UniQr1.ParamByName('SERIESUID').AsString := SeriesUID;
          v_UniQr1.ParamByName('INSTANCEUID').AsString := InstanceUID;
          v_UniQr1.ParamByName('IMGNO').AsInteger := StrToInt(AID);
          v_UniQr1.ParamByName('IMAGE_TYPE').AsString := AModility; //ImageType
          v_UniQr1.ParamByName('LDATE').AsDatetime := StudyDate;
          v_UniQr1.ParamByName('P_PID').AsString := PatientID;
          v_UniQr1.ParamByName('SIZEX').AsInteger := DA.GetInteger($28, $10); // Tag Rows (Ширина)
          v_UniQr1.ParamByName('SIZEY').AsInteger := DA.GetInteger($28, $11); //Tag Columns (Высота)
          v_UniQr1.ParamByName('BITS').AsInteger := DA.GetInteger($28, $101); //Tag Bits Stored (занято битов)
          v_UniQr1.ParamByName('ABITS').AsInteger := DA.GetInteger($28, $100); //Tag Bits Allocated (выделено, забронировано битов)
          v_UniQr1.ParamByName('BITS_PER_SAMPLE').AsInteger := DA.GetInteger($28, 2); //Tag Samples per Pixel
          v_UniQr1.ParamByName('STUDIESDATE').AsDatetime := StudyDate;
          v_UniQr1.ParamByName('PHOTOMETRIC').AsString := DA.GetString($28, 4); // Photometric Interpretation
          v_UniQr1.ParamByName('PACCESSIONNUMBER').AsString := AccessionNumber;
          v_UniQr1.ParamByName('SELECTEDINDEX1').AsInteger  := p_Selected2;
          exec_upd;
        end;
      end;
      if not v_is_add then
      begin
        if (v_SELECTEDINDEX1<>p_Selected2) then
        begin
          v_UniQr1.Close;
          v_UniQr1.SQL.Text := 'update '+v_pg_schema+'.images set selectedindex1 = :selectedindex1 where instanceuid = upper(:instanceuid)';
          v_UniQr1.ParamByName('INSTANCEUID').AsString := InstanceUID;
          v_UniQr1.ParamByName('SELECTEDINDEX1').AsInteger := p_Selected2;
          exec_upd;
        end;
      end;
    finally
      FreeAndNil(v_UniQr);
      FreeAndNil(v_UniQr1);
    end;
  end else begin
    FIBDataSet := TpFIBDataSet.Create(nil);
    FIBQuery := TpFIBQuery.Create(nil);
    try
      rd_trans_commit;
      if AClientThread<>nil then
      begin
        FIBDataSet.Database := (AClientThread.v_ClThr_DB as TpFIBDatabase); // DB;
        FIBDataSet.Transaction := (AClientThread.v_ClThr_trRead as TpFIBTransaction); // trRead ;
        FIBQuery.Database := (AClientThread.v_ClThr_DB as TpFIBDatabase); // DB;
        FIBQuery.Transaction := (AClientThread.v_ClThr_trWrite as TpFIBTransaction) ;
      end else
      begin
        FIBDataSet.Database := DB_CMN.DB;
        FIBDataSet.Transaction := DB_CMN.trRead ;
        FIBQuery.Database := DB_CMN.DB;
        FIBQuery.Transaction := DB_CMN.trWrite ;
      end;
      FIBDataSet.AutoCommit := True;
      Result := StudyDate;
      //trRead.CommitRetaining;         vStudyUID, vModality,
  //1. Пациент (Patients)-->
      if ((AClientThread=nil) or (not AClientThread.p_check_patientID(PatientID))) then
      begin
        FIBDataSet.SQLs.SelectSQL.Clear;
        p_start_read_trans;
        FIBDataSet.SQLs.SelectSQL.Text := ' SELECT * FROM PATIENTS WHERE P_PID = UPPER(:P_PID) '; // ищем пациента (по P_PID - № МК)
        FIBDataSet.ParamByName('P_PID').AsString := PatientID;
        try
          FIBDataSet.Open;
          FIBDataSet.First;
        except
          on E : Exception do begin
            Lg_ev(lg_SQLDS(FIBDataSet,E.ClassName,E.Message));
            CmnMyDoQueryInsert ( 'ошибка SQL', 3, lg_SQLDS(FIBDataSet,E.ClassName,E.Message),
                      AClientThread );
            v_is_err:=True;
          end;
        end;
        if not v_is_err then
        if ((FIBDataSet.RecordCount <= 0) or (FIBDataSet.Eof)) then // если query ничего не вернул (rowcount = 0), то INSERT
        begin
          p_start_write_trans;
          FIBQuery.Close;
          FIBQuery.SQL.Clear;
          FIBQuery.SQL.Add(' INSERT INTO PATIENTS(P_ENAME, P_ENAME_RUS, P_SEX, P_PID, P_DATEBORN, P_FAM, P_IM, P_OTCH) '+#13+
                           ' VALUES(UPPER(:P_ENAME), UPPER(:P_ENAME_RUS), :P_SEX, UPPER(:P_PID), :P_DATEBORN, UPPER(:P_FAM), UPPER(:P_IM), UPPER(:P_OTCH)) ');
          FIBQuery.ParamByName('P_ENAME').AsString := PName;
          FIBQuery.ParamByName('P_ENAME_RUS').AsString := TranslitEng(PName);
          if PDateBorn = '' then
            FIBQuery.ParamByName('P_DATEBORN').AsDateTime := Now
          else
            FIBQuery.ParamByName('P_DATEBORN').AsDateTime := StrToDate(PDateBorn);
          FIBQuery.ParamByName('P_SEX').AsString := pSex;
          FIBQuery.ParamByName('P_PID').AsString := PatientID;
          FIBQuery.ParamByName('P_FAM').AsString := TranslitEng(ExtractWord(1, PName, [' ','^','.']));
          FIBQuery.ParamByName('P_IM').AsString := TranslitEng(ExtractWord(2, PName, [' ','^','.']));
          FIBQuery.ParamByName('P_OTCH').AsString := TranslitEng(ExtractWord(3, PName, [' ','^','.']));
          try
            FIBQuery.ExecQuery;
            wrt_trans_commit;
          except
            on E : Exception do begin
              Lg_ev(lg_SQL(FIBQuery,E.ClassName,E.Message));
              CmnMyDoQueryInsert ( 'ошибка SQL', 3, lg_SQL(FIBQuery,E.ClassName,E.Message),
                      AClientThread );
            //  v_is_err:=True;
            end;
          end;
        end;
      end;
      v_is_err:=False;
  //2. Исследование (Studies)-->
      if ( (AClientThread=nil) or (not AClientThread.p_check_studyUID(vStudyUID,PatientID,ImageType)) ) then // True then 
      begin
        FIBDataSet.Close;
        p_start_read_trans;
        FIBDataSet.SQLs.SelectSQL.Clear;
        FIBDataSet.SQLs.SelectSQL.Text := ' SELECT * FROM STUDIES WHERE STUDYUID = UPPER(:STUDYUID) '; // ищем исследование
        FIBDataSet.ParamByName('STUDYUID').AsString := vStudyUID;
        try
          FIBDataSet.Open;
          FIBDataSet.First;    // STUDIES_IMAGE_TYPE
        except
          on E : Exception do begin
            Lg_ev(lg_SQLDS(FIBDataSet,E.ClassName,E.Message));
            CmnMyDoQueryInsert ( 'ошибка SQL', 3, lg_SQLDS(FIBDataSet,E.ClassName,E.Message),
                      AClientThread );
            v_is_err:=True;
          end;
        end;
        if not v_is_err then
        if ((FIBDataSet.RecordCount <= 0) or (FIBDataSet.Eof)) then // если query ничего не вернул (rowcount = 0) то INSERT
          begin
            StartSendToMisPacientNet(AccessionNumber, vStudyUID);
            //
            p_start_write_trans;
            FIBQuery.Close;
            FIBQuery.SQL.Clear;
            FIBQuery.SQL.Add(' INSERT INTO STUDIES(STUDYUID, P_ENAME, P_ENAME_RUS, P_SEX, P_PID, BSTATE, LDATE, STUDYID, STUDIES_IMAGE_TYPE, '+#13+
                             '                     P_DATEBORN, STATUS, STUDYDESCRIPTION, REFERRINGPHYSICIANNAME, ACCESSIONNUMBER, FC_AEAPPARAT, STUDYUID_OLD) ');
            FIBQuery.SQL.Add(' VALUES(UPPER(:STUDYUID), UPPER(:P_ENAME), UPPER(:P_ENAME_RUS), :P_SEX, UPPER(:P_PID), 1, :LDATE, :STUDYID, :IMAGE_TYPE, :P_DATEBORN, 0, '+#13+
                             '        UPPER(:STUDYDESC), UPPER(:PHYSNAME), :PACCESSIONNUMBER, :FC_AEAPPARAT, :STUDYUID_OLD ) ');
            FIBQuery.ParamByName('STUDYUID').AsString := vStudyUID;
            FIBQuery.ParamByName('STUDYUID_OLD').AsString := p_STUDYUID_OLD;
            FIBQuery.ParamByName('P_ENAME').AsString := Copy(PName,1,50);
            FIBQuery.ParamByName('P_ENAME_RUS').AsString := Copy(TranslitEng(PName),1,50);
            FIBQuery.ParamByName('P_SEX').AsString := PSex;
            FIBQuery.ParamByName('P_PID').AsString := PatientID;
            FIBQuery.ParamByName('LDATE').AsDatetime := StudyDate;
            FIBQuery.ParamByName('STUDYID').AsString := StudyID;
            FIBQuery.ParamByName('IMAGE_TYPE').AsString := ImageType;
            if AClientThread<>nil then            
              FIBQuery.ParamByName('FC_AEAPPARAT').AsString := AClientThread.vAEtitle
            else
              FIBQuery.ParamByName('FC_AEAPPARAT').AsString := '';
            if PDateBorn = '' then
              FIBQuery.ParamByName('P_DATEBORN').AsDateTime := Now 
            else
              FIBQuery.ParamByName('P_DATEBORN').AsDateTime := StrToDate(PDateBorn);
            FIBQuery.ParamByName('STUDYDESC').AsString := AnsiUpperCase( StudyDescription );
            FIBQuery.ParamByName('PHYSNAME').AsString := TranslitEng(PhysName);
            FIBQuery.ParamByName('PACCESSIONNUMBER').AsString := AccessionNumber; //Copy(AccessionNumber,1,20);
            try
              FIBQuery.ExecQuery;

//LogSave( #13+'StudyUID '+vStudyUID+' STUDYUID_OLD='+p_STUDYUID_OLD+' P_PID='+PatientID+' insert '+#13 );

              wrt_trans_commit;
            except
              on E : Exception do begin
                Lg_ev(lg_SQL(FIBQuery,E.ClassName,E.Message));
                CmnMyDoQueryInsert ( 'ошибка SQL', 3, lg_SQL(FIBQuery,E.ClassName,E.Message),
                      AClientThread );
              //  v_is_err:=True;
              end;
            end;
            FIBQuery.Close;
            AModility := ImageType;
          end else
        begin

//LogSave( #13+'StudyUID '+vStudyUID+' found '+#13 );

          Result := FIBDataSet.FieldByName('LDATE').AsDatetime;
          AModility := FIBDataSet.FieldByName('STUDIES_IMAGE_TYPE').AsString;
        end;
      end;
      v_is_err:=False;
  //3. Серия (Series)-->
      if ((AClientThread=nil) or (AClientThread.p_check_seriesUID(SeriesUID))) then
      begin
        FIBDataSet.Close;
        p_start_read_trans;
        FIBDataSet.SQLs.SelectSQL.Clear;
        FIBDataSet.SQLs.SelectSQL.Text := ' SELECT * FROM SERIES WHERE SERIESUID = UPPER(:SERIESUID) ';
        FIBDataSet.ParamByName('SERIESUID').AsString := SeriesUID;
        try
          FIBDataSet.Open;
          FIBDataSet.First;
        except
          on E : Exception do begin
            Lg_ev(lg_SQLDS(FIBDataSet,E.ClassName,E.Message));
            CmnMyDoQueryInsert ( 'ошибка SQL', 3, lg_SQLDS(FIBDataSet,E.ClassName,E.Message),
                      AClientThread );
            v_is_err:=True;
          end;
        end;
        if not v_is_err then
        if ((FIBDataSet.RecordCount <= 0) or (FIBDataSet.Eof)) then
        begin
          p_start_write_trans;
          FIBQuery.Close;
          FIBQuery.SQL.Clear;
          FIBQuery.SQL.Add(' INSERT INTO SERIES(STUDYUID, SERIESUID, SERIES_IMAGETYPE, SERIES_DESC, SERIES_DATE, ACCESSIONNUMBER) '+#13+
                           ' VALUES(UPPER(:STUDYUID),UPPER(:SERIESUID),:SERIES_IMAGETYPE,:SERIES_DESC,:SERIES_DATE, :PACCESSIONNUMBER) ');
          FIBQuery.ParamByName('STUDYUID').AsString := vStudyUID;
          FIBQuery.ParamByName('SERIESUID').AsString := SeriesUID;
          FIBQuery.ParamByName('SERIES_IMAGETYPE').AsString := AModility; //ImageType
          FIBQuery.ParamByName('SERIES_DESC').AsString := DA.GetString($0008, $103E);
          DA1 := DA.Item[$8, $0021]; // Tag Series Date
          if Assigned(DA1) and (DA1.GetCount > 0) then
            FIBQuery.ParamByName('SERIES_DATE').AsDatetime := DA1.AsDatetime[0]
          else
            FIBQuery.ParamByName('SERIES_DATE').AsDatetime := Now;
          FIBQuery.ParamByName('PACCESSIONNUMBER').AsString := AccessionNumber;
          try
            FIBQuery.ExecQuery;
            wrt_trans_commit;
          except
            on E : Exception do begin
              Lg_ev(lg_SQL(FIBQuery,E.ClassName,E.Message));
              CmnMyDoQueryInsert ( 'ошибка SQL', 3, lg_SQL(FIBQuery,E.ClassName,E.Message),
                      AClientThread );
            end;
          end;
          FIBQuery.Close;
        end;
      end;
      v_is_err:=False;
  //4. Снимок (Images)-->
      v_SELECTEDINDEX1:=0;
      FIBDataSet.Close;
      p_start_read_trans;
      FIBDataSet.SQLs.SelectSQL.Clear;
      FIBDataSet.SQLs.SelectSQL.Text := ' SELECT * FROM IMAGES WHERE INSTANCEUID = UPPER(:INSTANCEUID) ';
      FIBDataSet.ParamByName('INSTANCEUID').AsString := InstanceUID;
      try
        FIBDataSet.Open;
        FIBDataSet.First;
        if not FIBDataSet.Eof then
        begin
          v_SELECTEDINDEX1:=FIBDataSet.FieldByName('SELECTEDINDEX1').AsInteger;
        end;
      except
        on E : Exception do begin
          Lg_ev(lg_SQLDS(FIBDataSet,E.ClassName,E.Message));
          CmnMyDoQueryInsert ( 'ошибка SQL InstanceUID='+InstanceUID, 3, lg_SQLDS(FIBDataSet,E.ClassName,E.Message),
                    AClientThread );
          v_is_err:=True;
        end;
      end;
      v_is_add:=False;
      if not v_is_err then
      begin
        if ((FIBDataSet.RecordCount <= 0) or (FIBDataSet.Eof)) then
        begin
          p_start_write_trans;
          FIBQuery.Close;
          FIBQuery.SQL.Clear;
          FIBQuery.SQL.Add(' INSERT INTO IMAGES (STUDYUID, SERIESUID, INSTANCEUID, IMGNO, IMAGETYPE, IMAGEDATE, '+#13+
                           '                     P_PID, SIZEX, SIZEY, PHOTOMETRIC, BITS, ABITS, BITS_PER_SAMPLE, '+#13+
                           '                      SELECTEDINDEX1, STUDIESDATE, ACCESSIONNUMBER)');
          FIBQuery.SQL.Add(' VALUES(UPPER(:STUDYUID), UPPER(:SERIESUID), UPPER(:INSTANCEUID), :IMGNO, :IMAGE_TYPE, :LDATE, UPPER(:P_PID),' +#13+
                           '        :SIZEX, :SIZEY, :PHOTOMETRIC, :BITS, :ABITS, :BITS_PER_SAMPLE, :SELECTEDINDEX1, '+#13+
                           '                      :STUDIESDATE, :PACCESSIONNUMBER)');
          FIBQuery.ParamByName('STUDYUID').AsString := vStudyUID;
          FIBQuery.ParamByName('SERIESUID').AsString := SeriesUID;
          FIBQuery.ParamByName('INSTANCEUID').AsString := InstanceUID;
          FIBQuery.ParamByName('IMGNO').AsInteger := StrToInt(AID);
          FIBQuery.ParamByName('IMAGE_TYPE').AsString := AModility; //ImageType
          FIBQuery.ParamByName('LDATE').AsDatetime := StudyDate;
          FIBQuery.ParamByName('P_PID').AsString := PatientID;
          FIBQuery.ParamByName('SIZEX').AsInteger := DA.GetInteger($28, $10); // Tag Rows (Ширина)
          FIBQuery.ParamByName('SIZEY').AsInteger := DA.GetInteger($28, $11); //Tag Columns (Высота)
          FIBQuery.ParamByName('BITS').AsInteger := DA.GetInteger($28, $101); //Tag Bits Stored (занято битов)
          FIBQuery.ParamByName('ABITS').AsInteger := DA.GetInteger($28, $100); //Tag Bits Allocated (выделено, забронировано битов)
          FIBQuery.ParamByName('BITS_PER_SAMPLE').AsInteger := DA.GetInteger($28, 2); //Tag Samples per Pixel
          FIBQuery.ParamByName('STUDIESDATE').AsDatetime := StudyDate;
          FIBQuery.ParamByName('PHOTOMETRIC').AsString := DA.GetString($28, 4); // Photometric Interpretation
          FIBQuery.ParamByName('PACCESSIONNUMBER').AsString := AccessionNumber;
          FIBQuery.ParamByName('SELECTEDINDEX1').AsInteger  := p_Selected2;
          try
            FIBQuery.ExecQuery;
            wrt_trans_commit;
            v_is_add:=True;
          except
            on E : Exception do begin
              Lg_ev(lg_SQL(FIBQuery,E.ClassName,E.Message));
              CmnMyDoQueryInsert ( 'ошибка SQL', 3, lg_SQL(FIBQuery,E.ClassName,E.Message),
                    AClientThread );
            //  v_is_err:=True;
            end;
          end;
          FIBQuery.Close;
        end;
      end;
      if not v_is_add then
      begin
        if (v_SELECTEDINDEX1<>p_Selected2) then
        begin
          p_start_write_trans;
          FIBQuery.Close;
          FIBQuery.SQL.Clear;
          FIBQuery.SQL.Add(' UPDATE IMAGES SET SELECTEDINDEX1 = :SELECTEDINDEX1 WHERE INSTANCEUID = UPPER(:INSTANCEUID)');
          FIBQuery.ParamByName('INSTANCEUID').AsString := InstanceUID;
          FIBQuery.ParamByName('SELECTEDINDEX1').AsInteger := p_Selected2;
          try
            FIBQuery.ExecQuery;
            wrt_trans_commit;
          except
            on E : Exception do begin
              Lg_ev(lg_SQL(FIBQuery,E.ClassName,E.Message));
              CmnMyDoQueryInsert ( 'ошибка SQL', 3, lg_SQL(FIBQuery,E.ClassName,E.Message),
                    AClientThread );
            end;
          end;
        end;
      end;
    finally
      FreeAndNil(FIBQuery);
      FreeAndNil(FIBDataSet);
    end;
  end;
end;

procedure TDicomServer.DicomServerClientNewCommand(Sender: TObject;
  AAssociation: TAssociation; ADataset: TDicomAttributes; APosition: Integer;
  AStream: TStream);
var v_MoveDestination : AnsiString;
begin
  v_MoveDestination:=ADataset.getString(dMoveDestination);
  AAssociation.Request.MoveDestination:=v_MoveDestination;
  Lg_ev('DicomServerClientNewCommand command= '+
    inttostr(ADataset.getInteger(dCommandField))+' '+
    gt_cmd_name(ADataset.getInteger(dCommandField)) );
  if v_1_7_DCM_NET_LOG_WRITE then   
    Lg_ev('Request '+#13+AAssociation.Request.Text,sLogDir+'\'+c_pk_log+'\request.log');
  ds_sav(ADataset);
end;

procedure TDicomServer.DicomServerClientNewData(Sender: TObject;
  AAssociation: TAssociation; ADataset: TDicomAttributes; APosition: Integer;
  AStream: TStream);
begin
  if v_1_7_IS_LOG_WRITE then
  begin
    Lg_ev('NewData event' );
    if (ADataset=nil) then
    begin
      Lg_ev('ADataset=nil' );
      Exit;
    end;
    if (ADataset.ImageData=nil) then
      Lg_ev('ADataset.ImageData=nil' );
    try
      if ((ADataset<>nil) and (ADataset.ImageData<>nil)) then
        Lg_ev('New Data - TransferSyntax='+IntToStr(ADataset.ImageData.ImageData[0].TransferSyntax) );
    except
    end;
    try
      ds_sav(ADataset,nil,nil,'NewData' );
    except
    end;
  end;
end;

procedure TDicomServer.DicomServerDatabaseSumitSQL(
  AClientThread: TDicomClientThread; ADBStr, ASQL: string; AFetchCount: Integer;
  UseMultiDatabase: Boolean; Params: TDicomAttribute; var AResult: TDataSet);
begin
  SumitSQL(AClientThread, ADBStr, ASQL, AFetchCount, UseMultiDatabase, Params, AResult);
  if v_1_7_IS_LOG_WRITE then
  begin
    Lg_ev('DicomServerDatabaseSumitSQL');
    CmnMyDoQueryInsert('Событие. DatabaseSumitSQL', 4,
                'Событие сервера DatabaseSumitSQL'+#13+
                'DBStr: '+ADBStr+#13+
                'ASQL: '+ASQL,
                AClientThread );
  end;
end;

function chk_AETITLE_lst ( const p_aetitle : ansistring; const p_AAddress: ansistring ) : Boolean;
var v_res : Boolean;
    v_IP_fnd,
    v_port_fnd    : string;
begin
  v_IP_fnd:=''; v_port_fnd:=''; 
  try
    v_res:=gt_device_params ( p_aetitle,
                              p_AAddress,
                              nil,
                              v_IP_fnd,
                              v_port_fnd
                            );
  except
    on e:Exception do
      begin
        Lg_ev('error in chk_AETITLE_lst: '+e.Message);
        chk_AETITLE_lst:=False;
        Exit;
      end;
  end;
  chk_AETITLE_lst:=v_res;
end;

function MyprepareResponse( const request: TRequest;
                            const s: string;
                            const astr: TStrings;
                            const flag: Boolean;
                            const AAddress: string;
                            AClientThread: TDicomClientThread ): TDicomResponse;
var l, k, j1, i1: Integer;
    acknowledge: TAcknowledge;
    uidentry, uidentry1: TUIDEntry;
    flag2: Boolean;
  //  str1: string;
    v_filename_resp : AnsiString;
begin
  AClientThread.vAEtitle := request.CallingTitle; // .CalledTitle;
  v_filename_resp:=DicomServer.sLogDir+'\'+c_pk_log+'\myresponse.log';
  Lg_ev('MyprepareResponse');
  if v_1_7_DCM_NET_LOG_WRITE then
    Lg_ev( 'request : '+request.Text, v_filename_resp, True );
  Lg_ev('Проверка 1 ApplicationContextUid='''+request.ApplicationContextUid+'''');
//  if request.isPrivateApplicationContext then
  if False then
    begin
      Lg_ev('MyprepareResponse : USER_APPLICATIONCONTEXTNAME_NOT_SUPPORTED');
      result := TDicomReject.Create(REJECTED_PERMANENT, DICOM_UL_SERVICE_USER_reject, USER_APPLICATIONCONTEXTNAME_NOT_SUPPORTED);
      if v_1_7_DCM_NET_LOG_WRITE then
        Lg_ev( result.Text, v_filename_resp, True );
      DicomServer.CmnMyDoQueryInsert( 'REJECTED_PERMANENT', 3,
                   'ApplicationContextUid='''+request.ApplicationContextUid+''''+
                   ' USER_APPLICATIONCONTEXTNAME_NOT_SUPPORTED',
                AClientThread);
      exit;
    end;
  // проверка CALLEDAETITLE CALLINGAETITLE
  Lg_ev('Признак проверки AETITLE chk_AETITLE='+MyBoolToStr(v_1_8_IS_CHK_AETITLE));
  if (v_1_8_IS_CHK_AETITLE) then begin
    // проверим AETITLE WL сервера
    Lg_ev('Проверка 2 v_AE_TITLE='+v_AE_TITLE+' request.CalledTitle='+request.CalledTitle);
    if ( Trim(v_AE_TITLE) <> '') and (request.CalledTitle <> v_AE_TITLE) then
    begin
      Lg_ev('MyprepareResponse : USER_CALLED_AETITLE_NOT_RECOGNIZED');
      result := TDicomReject.Create(REJECTED_PERMANENT, DICOM_UL_SERVICE_USER_reject, USER_CALLED_AETITLE_NOT_RECOGNIZED);
      if v_1_7_DCM_NET_LOG_WRITE then
        Lg_ev( result.Text, v_filename_resp, True );
      DicomServer.CmnMyDoQueryInsert( 'REJECTED_PERMANENT', 3,
                   'request.CalledTitle='''+request.CalledTitle+''''+
                   ' MY_AETITLE='+v_AE_TITLE+
                   ' USER_CALLED_AETITLE_NOT_RECOGNIZED',
                AClientThread );
      exit;
    end;
    // проверим AETITLE в списке устройств
    if (v_IS_DEVICES_CHECK) then begin
      Lg_ev('Проверка 3 request.CallingTitle='+request.CallingTitle);
      if ((not chk_AETITLE_lst(request.CallingTitle, AAddress))
        and (Trim(request.CallingTitle)<>''))
      then begin
        Lg_ev('MyprepareResponse : USER_CALLED_AETITLE_NOT_RECOGNIZED');
        result := TDicomReject.Create(REJECTED_PERMANENT, DICOM_UL_SERVICE_USER_reject, USER_CALLING_AETITLE_NOT_RECOGNIZED);
        if v_1_7_DCM_NET_LOG_WRITE then
          Lg_ev( result.Text, v_filename_resp, True );
        DicomServer.CmnMyDoQueryInsert( 'REJECTED_PERMANENT', 3,
                     ' request.CallingTitle='''+request.CallingTitle+''''+
                     ' USER_CALLING_AETITLE_NOT_RECOGNIZED',
                AClientThread );
        exit;
      end;
    end;  
  end;

  acknowledge := TAcknowledge.Create;
  acknowledge.MaxPduSize := request.MaxPduSize;
  acknowledge.CalledTitle := trim(request.CalledTitle);
  acknowledge.CallingTitle := trim(request.CallingTitle);
  acknowledge.ApplicationContextUid := request.ApplicationContextUid;
  // 24_08_2012 FOMIN
  // взято из исходников компонентов
  if acknowledge.MaxPduSize<1048576 then
    acknowledge.MaxPduSize:=1048576;
  //
  Lg_ev( ' ApplicationContextUid '+request.ApplicationContextUid+' acknowledge.MaxPduSize='+inttostr(acknowledge.MaxPduSize));
  //  1.2.392.200039.105.9.2  -- PRIVATE
  for k := 0 to request.getPresentationContexts - 1 do
    begin
      uidentry := request.getAbstractSyntax(k);
      if (uidentry.UIDType = 1) or (uidentry.UIDType = 4) then
      begin
        l := 0;
        for j1 := 0 to request.getTransferSyntaxes(k) - 1 do
          begin
            uidentry1 := request.getTransferSyntax(k, j1);
          //  str1 := Uppercase(request.CalledTitle);
            //if k=0 then
            Lg_ev( ' PRESENTATIONCONTEXTUid '+uidentry1.AsString);
            // вставить потом обязательно проверку
            // 24_08_2012 FOMIN
           // if (uidentry1.Constant = ImplicitVRLittleEndian) then
            //
              if (uidentry1.Value <> '1.2.392.200039.105.9.2') then // private tags HITACHI ALOKA ultrasound system 
              begin
                Lg_ev('add PresentationContext from request : '''+uidentry1.Value+'''');
                acknowledge.addPresentationContext(request.getPresentationContextID(k), 0, uidentry1.Constant);
                Lg_ev('request.PresentationContextID='+inttostr(request.getPresentationContextID(k)));
                inc(l);
              end;
          end;
        if l <= 0 then
        begin
          Lg_ev( 'acknowledge.addPresentationContext k='+inttostr(k) );
          try
            acknowledge.addPresentationContext(request.getPresentationContextID(k), 4, ExplicitVRLittleEndian);
          except
            Lg_ev('error acknowledge.addPresentationContext k='+inttostr(k));
          end;
        end;
      end
      else
      begin
        Lg_ev( '!!! uidentry.UIDType='+inttostr(uidentry.UIDType) );
      end;
    end;
    // 20.08.2012 FOMIN
    if flag then
    begin
      flag2 := TRUE;
      for i1 := 0 to acknowledge.getPresentationContexts - 1 do
        begin
          if acknowledge.getResult(i1) = 0 then
            flag2 := FALSE;
        end;
      if flag2 then
        begin
          Lg_ev('MyprepareResponse : REJECTED_PERMANENT, DICOM_UL_SERVICE_USER_reject, USER_NO_REASON_GIVEN');
          result := TDicomReject.Create(REJECTED_PERMANENT, DICOM_UL_SERVICE_USER_reject, USER_NO_REASON_GIVEN);
          if v_1_7_DCM_NET_LOG_WRITE then
            Lg_ev( result.Text, v_filename_resp, True );
          DicomServer.CmnMyDoQueryInsert( 'REJECTED_PERMANENT', 4,
                   ' проверка acknowledge.getPresentationContexts : '+
                   ' DICOM_UL_SERVICE_USER_reject USER_NO_REASON_GIVEN ',
                AClientThread
                   );
          exit;
        end;
    end;
  if v_1_7_DCM_NET_LOG_WRITE then
    Lg_ev('MyprepareResponse : CalledTitle : '+acknowledge.CalledTitle+
                           ', CallingTitle : '+acknowledge.CallingTitle+
                           ', Reason : '+inttostr(acknowledge.Reason)+
                           ', Text : ' + acknowledge.Text, v_filename_resp, True );
  if v_1_7_IS_LOG_WRITE then
    DicomServer.CmnMyDoQueryInsert( 'MyprepareResponse', 4,
                           'MyprepareResponse : CalledTitle : '+acknowledge.CalledTitle+
                           ', CallingTitle : '+acknowledge.CallingTitle+
                           ', Reason : '+inttostr(acknowledge.Reason)+
                           ', Text : ' + acknowledge.Text,
                AClientThread );
  result := acknowledge;
  Lg_ev( result.Text, v_filename_resp, True );
end;

procedure TDicomServer.DicomServerDicomAssociation(
              AClientThread: TDicomClientThread;
              AAddress: string;
              AReg: TRequest;
              var AHandleType: Integer);
var r: TDicomResponse;
  v_trRead: TpFIBTransaction;
  v_trWrite: TpFIBTransaction;
  v_DB: TpFIBDatabase;
  v_LOGtrRead: TpFIBTransaction;
  v_LOGtrWrite: TpFIBTransaction;
  v_LOGDB: TpFIBDatabase;
  v_PGconn: TUniConnection;
  v_PGTrans : TUniTransaction;
  v_OraConn: TOracleSession;
//  v_now:TDateTime;
begin
 // AClientThread.CallingTitle := AReg.CallingTitle;
  AClientThread.isPg := v_isPostgres;
  AClientThread.isORA := v_isOracle;
  if v_isOracle then     // ORACLE
  begin
    v_OraConn := DB_CMN.OraConnCrt;
    AClientThread.OraConn := v_OraConn;
  end else if v_isPostgres then
  begin
    v_PGconn := DB_CMN.PgConnCrt;
    v_PGTrans := PGTransCreate (v_PGconn) ;
    v_PGTrans.DefaultConnection:=v_PGconn;
    AClientThread.PGconn := v_PGconn;
    AClientThread.PGTrans := v_PGTrans;
  end else
  begin
    v_DB:=f_fb_db_crt(c_alias);
    v_trRead:= f_FbReadTransactCreate( v_DB );
    v_trWrite:= f_FbWriteTransactCreate( v_DB );
    //
    AClientThread.v_ClThr_trRead  := v_trRead ;
    AClientThread.v_ClThr_trWrite := v_trWrite ;
    AClientThread.v_ClThr_DB      := v_DB ;
    //
    if v_crt_log then
    begin
      v_LOGDB:=f_fb_db_crt(c_logalias);
      v_LOGtrRead:= f_FbReadTransactCreate( v_LOGDB );
      v_LOGtrWrite:= f_FbWriteTransactCreate( v_LOGDB );
      //
      AClientThread.v_ClThr_LOGtrRead  := v_LOGtrRead ;
      AClientThread.v_ClThr_LOGtrWrite := v_LOGtrWrite ;
      AClientThread.v_ClThr_LOGDB      := v_LOGDB ;
    end;
  end;
  //
  if not assigned(AClientThread.OnTerminate) then
    AClientThread.OnTerminate := MyOnTerminate; // определяем разрыв соединения
  //
  CmnMyDoQueryInsert ( 'DicomServerDicomAssociation',
          4,
          ' request.CalledTitle='+AReg.CalledTitle+#13+
          ' request.CallingTitle='+AReg.CallingTitle+#13+
          ' ImplementationVersionName='+AReg.ImplementationVersionName+#13+
          ' ImplementationClassUID='+ AReg.ImplementationClassUID +#13+
          ' address: '+AAddress+#13+
          ' AHandleType: '+IntToStr(AHandleType)+#13+
          ' ApplicationContextUid '+AReg.ApplicationContextUid,
                AClientThread
        );
  Lg_ev('DicomServerDicomAssociation : request.CalledTitle='+AReg.CalledTitle+#13+
          ' request.CallingTitle='+AReg.CallingTitle+#13+
          ' ImplementationVersionName='+AReg.ImplementationVersionName+#13+
          ' ImplementationClassUID='+ AReg.ImplementationClassUID +#13+
          ' address: '+AAddress+#13+
          ' AHandleType: '+IntToStr(AHandleType)+#13+
          ' ApplicationContextUid '+AReg.ApplicationContextUid);
  AHandleType := 1; // Access
  AHandleType := -1; //Custom
  r := MyPrepareResponse(AReg, '', nil, true, AAddress, AClientThread);
//  r := MyPrepareResponse(AReg, '', nil, False, AAddress);
  TDicomClientThread(AClientThread).Association.sendAssociateResponse(r);
end;

procedure TDicomServer.DicomServerDicomFilmPrint(
  AClientThread: TDicomClientThread; AAddress: string;
  APrintTask: TDicomPrintTask);
var
  i: Integer;
  das: TDicomDataset;
begin
  CmnMyDoQueryInsert ( 'DicomServerDicomFilmPrint', 4, '',
                AClientThread );
  Lg_ev('DicomServerDicomFilmPrint');
  if (APrintTask.GetCount > 0) then
  begin
    if printer.Printers.Count <= 0 then
    begin
     ShowMessage('IP=' + AAddress + ',a dicom print data comein.but no printer');
    end
    else
    try
      ShowMessage('IP=' + AAddress + ',print image:' + IntToStr(APrintTask.GetCount));
      //print to printer
      if APrintTask.PrintOrientation[1] = 'P' then
        Printer.Orientation := poPortrait
      else
        Printer.Orientation := poLandscape;

      //you can select printer by change printerindex
      //printer.PrinterIndex :=

      Printer.BeginDoc;
      try
        APrintTask.Print(Printer.Canvas, 0, 0, Printer.PageWidth, Printer.PageHeight);
      finally
        Printer.EndDoc;
      end;

      //save to file
      for i := 0 to APrintTask.GetCount - 1 do
      begin
        das := TDicomDataset.Create(APrintTask.Items[i]);
        try
          das.SaveToFile(IntToStr(i) + '.DCM', True, ExplicitVRLittleEndian, 100);
          das.RecreateAttributes;
        finally
          das.Free;
        end;
      end;

    except
      on e: Exception do
        Lg_ev('IP=' + AAddress + ',print Error:' + e.Message);
    end;
  end
  else
    Lg_ev('IP' + AAddress + ',no print image');

end;

procedure TDicomServer.DicomServerDicomFind(AClientThread: TDicomClientThread;
  AAddress: string; ACommand: TDicomAttributes; ARequestDatasets,
  AResponseDatasets: TList);
var
  z1, d1, da1, rq, seq: TDicomAttributes;
  x1, at, at1: TDicomAttribute;
  kk, Root: Integer;
  strSQL, Level, sql1, modility: string;
  Query1: TDataset;
  APPLY_NO, PatientID, Pname, psex: string;
  date1: TDatetime;
  procedure SetParamAsDatetime(AName: string; AValue: TDatetime);
  var
    i: integer;
    str1: string;
    dasx1, dasx2: TDicomAttributes;
  begin
    dasx1 := nil;
    for i := 0 to at1.GetCount - 1 do
    begin
      dasx2 := at1.Attributes[i];
      str1 := dasx2.GetString($2809, $28);
      if str1 = AName then
      begin
        dasx2.Item[$2809, $25].AsDatetime[0] := AValue;
        //        dasx1 := dasx2;
        exit;
      end;
    end;
    if not assigned(dasx1) then
    begin
      dasx1 := TDicomAttributes.Create;
      dasx1.Add($2809, $28).asString[0] := AName;
      dasx1.Add($2809, $29).asInteger[0] := 3;
      dasx1.Add($2809, $25).asDatetime[0] := AValue;
      at1.AddData(dasx1);
    end;
  end;
  procedure DicomApplyTable;
  begin
    CmnMyDoQueryInsert ( 'событие DicomApplyTable ', 4,'',
                AClientThread );
    modility := '';
    at := rq.Item[$40, $100];
    if assigned(at) and (at.GetCount > 0) then // i.e. a sequence
    begin
      seq := at.Attributes[0];
      modility := seq.GetString($8, $60);
    end;
    if modility = '' then
      strSQL := ''
    else
      strSQL := 'MODALITY=''' + modility + '''';
    if (rq.GetString(dPatientID) <> '') then
    begin
      if strSQL <> '' then
        strSQL := strSQL + ' AND ';
      strSQL := strSQL + '( IDField = ''' + rq.GetString(dPatientID) + ''')';
    end;
    if (rq.GetString(dPatientName) <> '') and (rq.GetString(dPatientName) <> '*') then
    begin
      if strSQL <> '' then
        strSQL := strSQL + ' AND ';
        strSQL := strSQL + ' NameField like ''%' + SpSymbRepl(rq.GetString(dPatientName)) + '%''';
    end;
    x1 := rq.Item[$40, $100];
    if assigned(x1) and (x1.GetCount > 0) then
    begin
      z1 := x1.Attributes[0];
      x1 := z1.Item[$40, $2];
      if assigned(x1) and (x1.GetCount > 0) then
      begin
        if strSQL <> '' then
          strSQL := strSQL + ' and ';
        date1 := x1.AsDatetime[0];
        strSQL := strSQL + ' APPLY_TIME >= :CK_DATE1';
        SetParamAsDatetime('CK_DATE1', date1);
        if (x1.GetCount > 1) then
        begin
          date1 := x1.AsDatetime[1];
          strSQL := strSQL + ' AND APPLY_TIME <= :CK_DATE2';
          SetParamAsDatetime('CK_DATE2', date1);
        end;
      end;
    end;
    sql1 := 'SELECT * FROM  APPLYTABLE ';
    if strSQL <> '' then
      sql1 := sql1 + ' WHERE ' + strSQL;
    //        sql1 := sql1 + ' ORDER BY APPLY_TIME DESC';
    if sql1 <> '' then
    begin
      SumitSQL(AClientThread, '', sql1, 0, false, at1, Query1);

      if Assigned(Query1) then
      try
        Query1.First;
        while not Query1.Eof do
        begin
          da1 := TDicomAttributes.Create;
          //da1 := CopyAttributes(rq);

          AResponseDatasets.Add(da1);

          APPLY_NO := Query1.FieldByName('IDField').asstring;
          if (assigned(Query1.FindField('UIDField'))) then
          begin
            if Query1.FieldByName('UIDField').asstring = '' then
            begin
              strSQL := '1.2.40.0.13.' + FormatDatetime('yyyymmddhhnnss', now) + '.' + Apply_No;
              da1.AddVariant($20, $D, strSQL);
              ExecSQL('update APPLYTABLE set ' +
                'UIDField=''' + strSQL + ''' WHERE IDField=' + apply_no);
            end
            else
              da1.AddVariant($20, $D, Query1.FieldByName('UIDField').asstring);
          end
          else
          begin
            break;
          end;

        //  da1.AddVariant($8, $5, 'ISO_IR 100');
          //          da1.AddVariant($8, $54, Association.Request.CallingTitle);

          da1.AddVariant($8, $50, Apply_No);
          //ЙкЗлТЅЙъ
          da1.Add($8, $90);
          da1.Add($8, $1110);
          da1.Add($8, $1120);

          if (assigned(Query1.FindField('ENameField'))) and (Query1.FieldByName('ENameField').asstring <> '') then
            da1.AddVariant($10, $10, Query1.FieldByName('ENameField').asstring)
          else
            if (assigned(Query1.FindField('NameField'))) then
            da1.AddVariant($10, $10, (Query1.FieldByName('NameField').asstring))
          else
            da1.Add($10, $10);

          da1.AddVariant($10, $20, Query1.FieldByName('IDField').asstring);

          da1.Remove($10, $30);
          if (assigned(Query1.FindField('BirthDateField'))) then
          begin
            da1.Add($10, $30).AsDatetime[0] := Query1.FieldByName('BirthDateField').AsDatetime;
            da1.AddVariant($10, $1010, GetAge(Query1.FieldByName('BirthDateField').AsDatetime,
              Query1.FieldByName('APPLY_TIME').AsDatetime));
          end
          else
            da1.Add($10, $30);

          if (assigned(Query1.FindField('SexField'))) then
          begin
            da1.AddVariant($10, $40, Query1.FieldByName('SexField').asstring)
          end
          else
            da1.Add($10, $40);

          da1.Add($10, $1030);
          da1.Add($10, $2000);
          da1.Add($10, $2110);
          da1.Add($10, $21C0);

          //RequestedPhys
          if (assigned(Query1.FindField('DoctorField'))) then
            da1.AddVariant($32, $1032, (Query1.FieldByName('DoctorField').asstring))
          else
            da1.Add($32, $1032);

          //RequestedProcedureDescription
          if (assigned(Query1.FindField('DescField'))) then
            da1.AddVariant($32, $1060, (Query1.FieldByName('DescField').asstring))
          else
            da1.Add($32, $1060);

          da1.Add($32, $1064);

          da1.Add($38, $10);
          da1.Add($38, $50);

          if (assigned(Query1.FindField('DescField'))) then
            da1.AddVariant($38, $300, (Query1.FieldByName('DescField').asstring))
          else
            da1.Add($38, $300);

          da1.Add($38, $500);

          d1 := TDicomAttributes.Create;
          d1.AddVariant($8, $60, Modility);
          //          d1.AddVariant($40, $1, FAssociation.Request.CallingTitle);
          d1.Remove($40, $2);
          d1.Remove($40, $3);
          d1.Add($40, $2).AsDatetime[0] := now;
          d1.Add($40, $3).AsDatetime[0] := now;
          d1.Add($40, $6);
          d1.Add($40, $7); //ScheduledProcedureStepDescription
          d1.Add($40, $8);
          d1.AddVariant($40, $9, Apply_No);
          d1.AddVariant($40, $10, 'CNSPACS');
          da1.Add($40, $100).AddData(d1);
          d1.Add($40, $10);

          da1.AddVariant($40, $1001, Apply_No);
          da1.Add($40, $3001);
          Query1.Next;
        end;
      finally
        Query1.Free;
      end;
    end;
  end; //cns pacs mwl
begin
  IncConnections;
  try
    if v_1_7_IS_LOG_WRITE then
    begin
      Lg_ev('DicomServerDicomFind');
      ds_sav ( ACommand, ARequestDatasets, AResponseDatasets );
    end;

    Root := getAffectedSOPClass(ACommand);
    rq := TDicomAttributes(ARequestDatasets[0]);
    //
    Lg_ev(' codepage='''+rq.GetString($08, $05)+'''');
    //
    Level := Trim(rq.GetString(78));
    modility := '';
    at1 := TDicomAttribute.Create(nil, $2809, $2B);
    try
      if root = ModalityWorklistInformationModelFIND then   // Worklist
        begin
          CmnMyDoQueryInsert('DicomFind',
                        4, 'Событие сервера. DicomFind C-FIND worklist request',
                  AClientThread);
          modility := '';
          at := rq.Item[$40, $100];
          if assigned(at) and (at.GetCount > 0) then // i.e. a sequence
            begin
              seq := at.Attributes[0];
              modility := seq.GetString($8, $60);
            end;
          strSQL := '';
          DicomApplyTable;
        end else
        begin                                                 // PACS
          CmnMyDoQueryInsert('DicomFind', 4,
                        'Событие сервера. DicomFind C-FIND ' + level+';'+#13+
                        'Adress: '+AAddress,
                  AClientThread );
  //-->> 1. LEVEL = PATIENT (Уровень поиска "Пациент")
          if (level = 'PATIENT') then
            begin
              strSQL := '';
              PName := rq.GetString(dPatientName);
              if (PName <> '') and (PName <> '*') then
                begin
                  cmn_ins_add(strSQL);
                  strSQL := MySetSQL('P_ENAME',' like ''%' + SpSymbRepl(PName) + '%''');
              end;
              PatientID := rq.GetString(dPatientID);
              if PatientID <> '' then
                begin
                  cmn_ins_add(strSQL);
                  strSQL := strSQL + MySetSQL('P_PID',' like ''%' + SpSymbRepl(PatientID) + '%''');
                end;
              PSex := rq.GetString(dPatientSex);
              if PSex <> '' then
                begin
                  cmn_ins_add(strSQL);
                  strSQL := strSQL + MySetSQL('P_SEX ','= ''' + PSex + '''');
                end;
              if strSQL <> '' then
                sql1 := 'SELECT * FROM '+gtTabName('STUDIES')+' WHERE ' + strSQL +' order by '+gtFldName('P_ENAME')
              else
                sql1 := 'SELECT * FROM '+gtTabName('STUDIES')+' order by '+gtFldName('P_ENAME');
              SumitSQL(AClientThread, '', sql1, 0, false, at1, Query1);

              if Assigned(Query1) then
                begin
                  try
                    Query1.First;
                    while not Query1.Eof do
                      begin
                        da1 := TDicomAttributes.Create;
                      {  for i := 0 to rq.Count - 1 do
                          begin
                            x1 := rq.ItemByIndex[i];
                            x2 := da1.Add(x1.Group, x1.Element);
                            if x1.AsString[0] <> '' then
                            //  x2.AsString[0] := x1.AsString[0];
                            try
                              x2.AsString[0] := x1.AsString[0];
                            except
                              ll:=0;
                            end;
                          end;  }
                        da1.AddVariant($8, $52, Level);
                      //  da1.AddVariant($8, $5, 'ISO_IR 100');
                        da1.AddVariant($10, $10, Query1.FieldByName('P_ENAME').asstring);
                        da1.AddVariant($10, $20, Query1.FieldByName('P_PID').asstring);
                        da1.AddVariant($10, $40, Query1.FieldByName('P_SEX').asstring);
                        da1.AddVariant($0010, $0030, DateToStr(Dateof(Query1.FieldByName('P_DATEBORN').AsDateTime)));
                        da1.AddVariant($0008, $0060, Query1.FieldByName('STUDIES_IMAGE_TYPE').AsString); // dModality
                        da1.AddVariant($0008, $0050, Query1.FieldByName('ACCESSIONNUMBER').AsString );
                        da1.AddVariant($0020, $000D, Query1.FieldByName('STUDYUID').AsString );
                        da1.AddVariant($20, $10,     Query1.FieldByName('STUDYID').asString);
                        da1.AddVariant($8, $20,      Query1.FieldByName('LDATE').asString);
                        da1.AddVariant($0010, $0030, DateToStr(Dateof(Query1.FieldByName('P_DATEBORN').AsDateTime)));
                        da1.AddVariant($8, $1030,    AnsiUpperCase(Query1.FieldByName('STUDYDESCRIPTION').asstring) );

                        da1.Sort;
                        AResponseDatasets.Add(da1);
                        Query1.Next;
                      end;
                  finally
                    Query1.Free;
                  end;
                end;
            end; // end of level = patient
  //<<-- 1
  //-->> 2. LEVEL = STUDY (Уровень поиска "Исследование")
          if level = 'STUDY' then
            begin
              strSQL := '';
              PName := rq.GetString($8, $61); // 1). модальность (тип исследования) +
              if PName = '' then
                PName := rq.GetString($8, $60); //модальность (тип исследования) +
              if (PName <> '') then
                strSQL := MySetSQL('STUDIES_IMAGE_TYPE',' = ''' + PName + '''');
              x1 := rq.Item[$8, $20]; // 2). даты +
              if assigned(x1) and (x1.GetCount > 0) then
                begin
                  cmn_ins_add(strSQL);
                  date1 := x1.AsDatetime[0];
                  if (x1.GetCount > 1) then
                    begin
                      if v_isOracle then     // ORACLE
                        strSQL := strSQL + MySetSQL(' LDATE',' >= to_date(''' + DateToStr(Trunc(date1)) + ''',''dd.mm.yyyy'') ')
                      else
                        strSQL := strSQL + MySetSQL(' LDATE',' >= ''' + DateTimeToStr(Trunc(date1)) + '''');
                      date1 := x1.AsDatetime[1];
                      if v_isOracle then     // ORACLE
                        strSQL := strSQL + ' AND '+MySetSQL('LDATE',' < to_date(''' + DateToStr(Trunc(IncDay(date1,1))) + ''',''dd.mm.yyyy'') ')
                      else
                        strSQL := strSQL + ' AND '+MySetSQL('LDATE',' < ''' + DateTimeToStr(Trunc(IncDay(date1,1))) + '''');
                    end else
                    begin
                      if v_isOracle then     // ORACLE
                        strSQL := strSQL + MySetSQL(' LDATE',' = to_date(''' + DateToStr(date1) + ''',''dd.mm.yyyy'') ')
                      else
                        strSQL := strSQL + MySetSQL(' LDATE',' = ''' + DateTimeToStr(date1) + '''');
                    end;
                end;
              if rq.GetString(dStudyInstanceUID) <> '' then // 3). UID исследования
                begin
                  cmn_ins_add(strSQL);
                  strSQL := MySetSQL('STUDYUID',' like ''%' + SpSymbRepl(rq.GetString(dStudyInstanceUID)) + '%''');
                end;
              if rq.GetString(dPatientID) <> '' then // 4). Номер исследования
                begin
                  cmn_ins_add(strSQL);
                  strSQL := strSQL + MySetSQL('P_PID',' like ''%' + SpSymbRepl(rq.GetString(dPatientID)) + '%''');
                end;
              if rq.GetString(dPatientName) <> '' then // 5). Фамилия пациента
                begin
                  cmn_ins_add(strSQL);
                  strSQL := strSQL + MySetSQL('P_ENAME',' like ''%' + SpSymbRepl(rq.GetString(dPatientName)) + '%''');
                end;
              if rq.GetString(dPatientSex) <> '' then // 6). Пол пациента
                begin
                  cmn_ins_add(strSQL);
                  strSQL := strSQL + MySetSQL('P_SEX',' = ''' + rq.GetString(dPatientSex)+'''');
                end;
              if rq.GetString(dPatientBirthDate) <> '' then // 7). Дата рождения пациента
                begin
                  cmn_ins_add(strSQL);
                  if v_isOracle then     // ORACLE
                    strSQL := strSQL + MySetSQL('P_DATEBORN',' = to_date(''' + rq.GetString(dPatientBirthDate)+''',''dd.mm.yyyy'') ')
                  else
                    strSQL := strSQL + MySetSQL('P_DATEBORN',' = ''' + rq.GetString(dPatientBirthDate)+'''');
                end;
              if rq.GetString(dStudyDescription) <> '' then // 8). Описание исследования
                begin
                  cmn_ins_add(strSQL);
                  strSQL := strSQL + MySetSQL('STUDYDESCRIPTION',' like ''%' + rq.GetString(dStudyDescription)+'%''');
                end;
              if rq.GetString($8, $90) <> '' then // 9). Врач
                begin
                  cmn_ins_add(strSQL);
                  strSQL := strSQL + MySetSQL('REFERRINGPHYSICIANNAME',' like ''' + rq.GetString($8, $90)+'''');
                end;
              if rq.GetString(dAccessionNumber) <> '' then // 10). dAccessionNumber
                begin
                  cmn_ins_add(strSQL);
                  if v_1_7_ANinPID then   // искать ACCESSIONNUMBER в PATIENTID
                  begin
                    strSQL := strSQL + '(('+MySetSQL('ACCESSIONNUMBER',' like ''%' + rq.GetString(dAccessionNumber)+'%''')+
                                        ') or ('+MySetSQL('P_PID',' like ''%' + rq.GetString(dAccessionNumber)+'%''')+'))';
                  end else begin
                    strSQL := strSQL + MySetSQL('ACCESSIONNUMBER',' like ''%' + rq.GetString(dAccessionNumber)+'%''');
                  end;
                end;
              if strSQL <> '' then
                sql1 := 'SELECT * FROM '+gtTabName('STUDIES')+' WHERE ' + strSQL + ' ORDER BY '+gtFldName('LDATE')
              else
                sql1 := 'SELECT * FROM '+gtTabName('STUDIES')+' ORDER BY '+gtFldName('LDATE');
              SumitSQL(AClientThread, '', sql1, 0, false, at1, Query1);
              if Assigned(Query1) then
                try
                  Query1.First;
                  while not Query1.Eof do
                    begin
                      da1 := TDicomAttributes.Create;
                      da1.AddVariant($8, $52, Level);
                    //  da1.AddVariant($8, $5, 'ISO_IR 100');
                      da1.Remove(8, $61);
                      da1.AddVariant($10, $10,     Query1.FieldByName('P_ENAME').asString);
                      da1.AddVariant($10, $20,     Query1.FieldByName('P_PID').asString);
                      da1.AddVariant($0020, $000D, Query1.FieldByName('STUDYUID').asString);
                      da1.AddVariant($20, $10,     Query1.FieldByName('STUDYID').asString);
                      da1.AddVariant($0008, $0050, Query1.FieldByName('ACCESSIONNUMBER').asstring);
                      da1.AddVariant($8, $20,      Query1.FieldByName('LDATE').asString);
                      da1.AddVariant($8, $60,      Query1.FieldByName('STUDIES_IMAGE_TYPE').asString);
                      da1.AddVariant($10, $40,     Query1.FieldByName('P_SEX').asstring);
                      da1.AddVariant($0010, $0030, DateToStr(Dateof(Query1.FieldByName('P_DATEBORN').AsDateTime)));
                      da1.AddVariant($8, $1030,    AnsiUpperCase(Query1.FieldByName('STUDYDESCRIPTION').asstring) );
                      da1.Sort;
                      AResponseDatasets.Add(da1);
                      Query1.Next;
                    end;
                finally
                  Query1.Free;
                end;
            end; //end of level = study
  //<<-- 2
  //-->> 3. LEVEL = SERIES (Уровень поиска "Серия")
          if level = 'SERIES' then
            begin
              strSQL := '';
              if rq.GetString(dSeriesInstanceUID) <> '' then
                begin
                  cmn_ins_add(strSQL);
                  strSQL := strSQL + MySetSQL('SERIESUID','  =''' + rq.GetString(dSeriesInstanceUID) + '''');
                end else
                  if rq.GetString(dStudyInstanceUID) <> '' then
                    begin
                      strSQL := MySetSQL('STUDYUID',' = ''' + rq.GetString(dStudyInstanceUID) + '''');
                    end;
              if strSQL = '' then
                exit;
              sql1 := 'SELECT * FROM '+gtTabName('SERIES')+' WHERE ' + strSQL;
              SumitSQL(AClientThread, '', sql1, 0, false, at1, Query1);
              kk := 0;
              if Assigned(Query1) then
                try
                  Query1.First;
                  while not Query1.Eof do
                    begin
                      da1 := TDicomAttributes.Create;
                    {  for i := 0 to rq.Count - 1 do
                        begin
                          x1 := rq.ItemByIndex[i];
                          x2 := da1.Add(x1.Group, x1.Element);
                          if x1.AsString[0] <> '' then
                            try
                              x2.AsString[0] := x1.AsString[0];
                            except
                              ll:=0;
                            end;
                        end;  }
                      da1.AddVariant($8, $52, Level);
                    //  da1.AddVariant($8, $5, 'ISO_IR 100');
                      da1.Add($8, $8);
                      da1.Add($8, $70);
                      da1.Add($20, $1002);
                      da1.AddVariant($20, $D, Query1.FieldByName('STUDYUID').asstring);
                      da1.AddVariant($20, $E, Query1.FieldByName('SERIESUID').asstring);
                      da1.AddVariant($8, $60, Query1.FieldByName('SERIES_IMAGETYPE').asstring);
                      da1.Add($8, $0021).AsDatetime[0] := Query1.FieldByName('SERIES_DATE').AsDateTime;
                      da1.AddVariant($8, $103E, Query1.FieldByName('SERIES_DESC').asstring);
                      da1.AddVariant($20, $11, kk);
                      inc(kk);
                      da1.Sort;
                      AResponseDatasets.Add(da1);
                      Query1.Next;
                    end;
                finally
                  Query1.Free;
                end;
            end; //end of series
  //<<-- 3
  //-->> 4. LEVEL = IMAGE (Уровень поиска "Изображение")
          if level = 'IMAGE' then
            begin
              strSQL := '';
              if rq.GetString(dSOPInstanceUID) <> '' then   //   $8, $18
                begin
                  strSQL := MySetSQL('INSTANCEUID',' = ''' + rq.GetString(dSOPInstanceUID) + '''');
                end else
                  if rq.GetString(dSeriesInstanceUID) <> '' then
                    begin
                      cmn_ins_add(strSQL);
                      strSQL := strSQL + MySetSQL('SERIESUID',' = ''' + rq.GetString(dSeriesInstanceUID) + '''');
                    end else
                      if rq.GetString(dStudyInstanceUID) <> '' then
                        begin
                          cmn_ins_add(strSQL);
                          strSQL := strSQL + MySetSQL('STUDYUID',' = ''' + rq.GetString(dStudyInstanceUID) + '''');
                        end else
                          if rq.GetString(dAccessionNumber) <> '' then
                          begin
                            cmn_ins_add(strSQL);
                            strSQL := strSQL + MySetSQL('ACCESSIONNUMBER',' = ''' + rq.GetString(dAccessionNumber) + '''');
                          end;
              if strSQL = '' then
                exit;
              sql1 := 'SELECT * FROM '+gtTabName('IMAGES')+' WHERE ' + strSQL +
                      ' ORDER BY '+gtFldName('SERIESUID')+','+gtFldName('IMGNO');
              SumitSQL(AClientThread, '', sql1, 0, false, at1, Query1);
              if Assigned(Query1) then
                try
                  Query1.First;
                  while not Query1.Eof do
                    begin
                      da1 := TDicomAttributes.Create;
                     { for i := 0 to rq.Count - 1 do
                        begin
                          x1 := rq.ItemByIndex[i];
                          x2 := da1.Add(x1.Group, x1.Element);
                          if x1.AsString[0] <> '' then
                            try
                              x2.AsString[0] := x1.AsString[0];
                            except
                              ll:=0;
                            end;
                        end; }
                      da1.AddVariant($8, $52, Level);
                    //  da1.AddVariant($8, $5, 'ISO_IR 100');
                      da1.Add($8, $8);
                      da1.AddVariant($20, $D, Query1.FieldByName('STUDYUID').asstring);
                      da1.AddVariant($20, $E, Query1.FieldByName('SERIESUID').asstring);
                      da1.AddVariant($8, $60, Query1.FieldByName('IMAGETYPE').asstring);
                      da1.AddVariant($8, $18, Query1.FieldByName('InstanceUID').asstring);
                      da1.AddVariant($20, $13, Query1.FieldByName('IMGNO').asstring);
                      da1.AddVariant($28, $10, Query1.FieldByName('SIZEX').AsInteger);
                      da1.AddVariant($28, $11, Query1.FieldByName('SIZEY').AsInteger);
                      da1.Sort;
                      AResponseDatasets.Add(da1);
                      Query1.Next;
                    end;
                finally
                  Query1.Free;
                end;
            end; //end of level = Image
          end;
    finally
      at1.Free;
    end;
  finally
    DecConnections;
  end;
end;

procedure TDicomServer.DicomServerDicomGet(AClientThread: TDicomClientThread;
  AAddress: string; ACommand: TDicomAttributes; ARequestDatasets,
  AResponseDatasets: TList);
var Dds : TDicomDataset;
    DA : TDicomAttributes;
    MyQuery : TpFIBDataSet;
    BaseDir, {BaseRemoteDir,} pName ,
    Level, v_PatientID, SQL : string;
    Str : AnsiString;
 //   uidentry: TUIDEntry;
  function HaveTheImage(Das: TDicomAttributes): Boolean;
  var i : integer;
  begin
    Result := true;
    for i := 0 to AResponseDatasets.Count - 1 do
      begin
        DA := TDicomAttributes(AResponseDatasets[i]);
        if DA.GetString(8, $18) = das.GetString(8, $18) then
          begin
            Result := False;
            Exit;
          end;
      end;
  end;
  // обработка запросов pack-устройства
var v_UniQr : TUniQuery; v_ORAQr : TOracleDataSet;
  procedure cmn_prt1(p_ds:TDataSet);
 // var k: integer;
    function cmn_prt2 ( p_dir, p_str_comm :AnsiString; p_ds:TDataSet ):Boolean;
    var v_res : Boolean; p_basedir:string;
    begin
      Lg_ev(p_str_comm);
      Lg_ev('cmn_prt2 MyTestDcmFileDir : STUDYUID = '+p_ds.FieldByName('STUDYUID').AsString+#13#10+
                             'STUDIESDATE = '+DateToStr(p_ds.FieldByName('STUDIESDATE').AsDateTime)+#13#10+
                             'IMAGEDATE = '+DateToStr(p_ds.FieldByName('IMAGEDATE').AsDateTime)+#13#10+
                             'IMAGETYPE = '+p_ds.FieldByName('IMAGETYPE').AsString+#13#10+
                             'instanceuid = '+p_ds.FieldByName('instanceuid').AsString+#13#10+
                             'p_basedir='+p_basedir);
      try
        if MyTestDcmFileDir( AClientThread,
                             p_ds.FieldByName('STUDYUID').AsString,
                             p_ds.FieldByName('STUDIESDATE').AsDateTime,
                             p_ds.FieldByName('IMAGEDATE').AsDateTime,
                             p_ds.FieldByName('IMAGETYPE').AsString,
                             p_dir,
                             p_basedir)
        then  // -->> 1. ищем файл в хранилище p_basedir
        begin
          Lg_ev('#2352');
          v_res:=True;
          Dds := TDicomDataset.Create;
          try
            while not p_ds.EOF do
            begin
              Lg_ev('#2358');
              if MyTestDcmFileDir( AClientThread,
                                   p_ds.FieldByName('STUDYUID').AsString,
                                   p_ds.FieldByName('STUDIESDATE').AsDateTime,
                                   p_ds.FieldByName('IMAGEDATE').AsDateTime,
                                   p_ds.FieldByName('IMAGETYPE').AsString,
                                   p_dir,
                                   p_basedir)
              then  // -->> 1. ищем файл в хранилище p_basedir
              begin
                Lg_ev('2.1. not p_ds.EOF - нашли - not p_ds.EOF Npp='+p_ds.FieldByName('IMGNO').AsString+#13#10+
                     '           STUDYUID='+ p_ds.FieldByName('STUDYUID').AsString + #13#10+
                     '           P_PID='+ p_ds.FieldByName('P_PID').AsString + #13#10+
                     '           ACCESSIONNUMBER='+ p_ds.FieldByName('ACCESSIONNUMBER').AsString
                     );
                Application.ProcessMessages;
                //
                pName := MyTestFile(  AClientThread,
                                      p_ds.FieldByName('SERIESUID').AsString,
                                      p_ds.FieldByName('INSTANCEUID').AsString,
                                      p_ds.FieldByName('IMGNO').AsString,
                                      p_basedir);
                AClientThread.v_resp_DS_list.Append(pName);
                Lg_ev('!!! ищем файл '+pName);
              //  if AResponseDatasets.Count<=3 then
                  if Trim(pName)<>'' then
                    if FileExists(pName) then
                    begin
                      Lg_ev('SUCCESS : file found '+pName);
                      if Dds.LoadFromFile(pName) then
                      begin
                        Lg_ev('SUCCESS : file load '+pName);
                        if v_1_7_IS_LOG_WRITE then
                          CmnMyDoQueryInsert('Обработка DicomGet', 4, 'Find file '+pName,
                                        AClientThread );
                        AResponseDatasets.Add(Dds.Attributes);
                        Lg_ev('AResponseDatasets.Add(Dds.Attributes);');
                        Dds.RecreateAttributes;
                        Lg_ev('Dds.RecreateAttributes;');
                      end else begin
                        CmnMyDoQueryInsert('DicomGet', 3, 'file not found '+pName,
                                    AClientThread );
                      end;
                    end else
                    begin
                      Lg_ev('#1 ERROR : file not found '+pName);
                      CmnMyDoQueryInsert('DicomGet', 3, 'file not found '+pName,
                                    AClientThread );
                    end;
                {
                if (pName <> '') then
                begin
                  if Dds.LoadFromFile(pName) then
                  begin
                    if v_private_tags then // грузим изображение "как оно есть" в тег :)
                    begin
                      Dds.Attributes.Add($2006, $0001); //. . := vAttr;
                      Dds.Attributes[$2006, $0001].LoadFromFile(pName);
                    end;
                    AClientThread.v_resp_DS_list.Append(pName);
                    if v_1_7_IS_LOG_WRITE then
                      CmnMyDoQueryInsert('Обработка DicomGet', 4, 'Load from file '+pName,
                                    AClientThread );
                      if ((not AClientThread.v_is_move) or (AResponseDatasets.Count<=3)) then
                      begin
                        AResponseDatasets.Add(Dds.Attributes);
                        Dds.RecreateAttributes;
                      end;
                  end else begin
                    CmnMyDoQueryInsert('DicomGet', 3, 'file not found '+pName,
                                AClientThread );
                  end;
                end;
                }
              end else
              begin
                Lg_ev('#2427 !!!ERROR!!! directory NOT FOUND');
              end;
              p_ds.Next;
            end;
            Lg_ev('#2437 after while -----------------');
          finally
            Dds.Free;
          end;
          Lg_ev('#2441');
        end else
        begin
          v_res:=False;
          Lg_ev('#2 ERROR : NOT MyTestDcmFileDir');
          try
            AClientThread.Association.sendReleaseResponse;
//            TDicomClientThread(AClientThread).Association.sendAssociateResponse( TDicomReject.Create(REJECTED_PERMANENT, DICOM_UL_SERVICE_USER_reject, USER_NO_REASON_GIVEN) );
          except
          on E:Exception do
            Lg_ev('Error close connection : '+E.Message);
          end;
        end;
        Lg_ev('exit cmn_prt2');
      except
      on E:Exception do
        begin
        //  v_res:=False;
          Lg_ev('#3 ERROR : '+E.Message);
        end;
      end;
      Result:=v_res;
    end;
  begin
    if v_1_7_IS_LOG_WRITE
    then
      if v_isPostgres or v_isOracle then
      begin
        CmnMyDoQueryInsert('DicomGet', 4, 'Событие DicomGet'+#13+
                    'Address: '+AAddress+#13+ 'Level: '+Level+#13+
                    Str, AClientThread );
        Lg_ev('Обработка GET запроса : '+Str);
      end else begin
        CmnMyDoQueryInsert('DicomGet', 4, 'Событие DicomGet'+#13+
                    'Address: '+AAddress+#13+ 'Level: '+Level+#13+
                    Str+#13+ lg_SQLDSCMN(MyQuery), AClientThread );
        Lg_ev('Обработка GET запроса : '+Str+' '+lg_SQLDSCMN(MyQuery));
      end;
    try  //  p_ds.SelectSQL.Text
      p_ds.Open;
      p_ds.First;
    except
    on e: Exception do
      begin
        Lg_ev('FailToOpenQuery' + e.Message + '/' + e.ClassName + ':' + SQL);
        Log_ins('FailToOpenQuery' + e.Message + '/' + e.ClassName + ':' + SQL);
        if v_isPostgres or v_isOracle then
          CmnMyDoQueryInsert('Ошибка! Не удалось выполнить запрос!', 3,
                      'FailToOpenQuery ' + e.Message + '/' + e.ClassName + ':' + SQL+#13+
                      Str, AClientThread )
        else
          CmnMyDoQueryInsert('Ошибка! Не удалось выполнить запрос!', 3,
                      'FailToOpenQuery ' + e.Message + '/' + e.ClassName + ':' + SQL+#13+
                      Str+#13+ lg_SQLDSCMN(MyQuery), AClientThread );
        FreeAndNil(p_ds);
        Lg_ev('raise ...');
      //  raise;
      end;
    end;
    try
      Lg_ev('запрос к базе ...');
      if p_ds.EOF then
        Lg_ev('Данные не найдены ' )
      else
      while not p_ds.EOF do
      begin
        if v_1_7_IS_LOG_WRITE
        then
          CmnMyDoQueryInsert('Обработка DicomGet', 4, 'Найдены данные '+inttostr(p_ds.RecordCount)+' записей', AClientThread );
        Lg_ev('Найдены данные '+inttostr(p_ds.RecordCount)+' записей'+#13+
               'instanceuid='+p_ds.FieldByName('instanceuid').AsString );
        Application.ProcessMessages;
        // вставить проверку на рабочее соединение
//        AClientThread.Association.sendReleaseResponse;
        lg_ev('sDir='+sDir);
        lg_ev('BaseDir='+BaseDir);
        if v_1_7_IS_LOG_WRITE
        then
          CmnMyDoQueryInsert('Обработка DicomGet', 4, 'TestDcmFileDir '+BaseDir, AClientThread );
        if not cmn_prt2 ( sDir, 'ищем файл в локальном хранилище', p_ds )  // -->> 1. ищем файл в локальном хранилище
        then
          cmn_prt2 ( sDirRemote, 'ищем файл в глобальном хранилище', p_ds );
     {   if not cmn_prt2 ( sDir, BaseDir, 'ищем файл в локальном хранилище', p_ds )  // -->> 1. ищем файл в локальном хранилище
        then
          cmn_prt2 ( sDirRemote, BaseRemoteDir, 'ищем файл в глобальном хранилище', p_ds );  }
        p_ds.Next;  
      end;
    finally
      Application.ProcessMessages;
    end;
  end;
var v_dStudyInstanceUID, v_dAccessionNumber, v_dSeriesInstanceUID, 
    v_dSOPInstanceUID : AnsiString; // vStrTmp : string;
const //c_rzd_id = '/';
      c_rzd_id  = '\';
      c_rzd_id1 = '\';
//label l1;
  function frm_str_tmp ( p_str : AnsiString ) : AnsiString;
  var v_tmps : AnsiString;
  begin
    v_tmps := StringReplace(p_str,c_rzd_id1,''',''',[rfReplaceAll, rfIgnoreCase]);
    Result := ''''+StringReplace(v_tmps,c_rzd_id,''',''',[rfReplaceAll, rfIgnoreCase])+'''';
  end;
  function chk_rzd_tmp ( p_str:ansistring ) : Boolean;
  begin
    Result:=( (AnsiPos(c_rzd_id,p_str)>0) or (AnsiPos(c_rzd_id1,p_str)>0) );
  end;
//var v_studyuid_myfnd : string;
begin
  IncConnections;
  try
    // ---------------------------------------------------------------------------
    if v_isOracle then begin
      v_ORAQr := TOracleDataSet.Create(nil);
      if AClientThread=nil then begin
        v_ORAQr.Session:=DB_CMN.OraConn;
      end else begin
        v_ORAQr.Session:=AClientThread.OraConn;
      end;
    end else if v_isPostgres then begin
      v_UniQr := TUniQuery.Create(nil);
      if AClientThread=nil then begin
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
      end else begin
        v_UniQr.Connection:=AClientThread.PGconn;
        v_UniQr.Transaction:=AClientThread.PGTrans;
      end;
    end else
    begin
      MyQuery := TpFIBDataSet.Create(nil);
      if AClientThread<>nil then
      begin
        MyQuery.Database := (AClientThread.v_ClThr_DB as TpFIBDatabase);
        MyQuery.Transaction := (AClientThread.v_ClThr_trRead as TpFIBTransaction);
      end else
      begin
        MyQuery.Database := DB_CMN.DB;
        MyQuery.Transaction := DB_CMN.trRead;
      end;
    end;
    // ---------------------------------------------------------------------------
    DA := TDicomAttributes(ARequestDatasets[0]);
    Level := DA.GetString(78); // определяется уровень (patient, study or series)
    if v_1_7_IS_LOG_WRITE then
    begin
      Lg_ev('DicomServerDicomGet Level = '''+Level+'''');  //  +#13+gt_dcm_str(DA)
      CmnMyDoQueryInsert ( 'DicomServerDicomGet', 4, 'Level = '''+Level+'''',
                  AClientThread );
      ds_sav ( ACommand, ARequestDatasets, AResponseDatasets );
    end;
    if Level = 'PATIENT' then
      Str := gtFldName('P_PID')+' = :P_dPatientID '
    else
      if Level = 'STUDY' then
      begin
        // если задан accessionnumber то определим studyuid
      {  if DA.GetString(dAccessionNumber) <> '' then
        begin
          if v_isOracle then begin
          end else if v_isPostgres then begin
          end else begin
            with TpFIBDataSet.Create(nil) do
            try
              if AClientThread<>nil then
              begin
                Database := (AClientThread.v_ClThr_DB as TpFIBDatabase);
                Transaction := (AClientThread.v_ClThr_trRead as TpFIBTransaction);
              end else
              begin
                Database := DB_CMN.DB;
                Transaction := DB_CMN.trRead;
              end;
              SelectSQL.Add('select studyuid from studies s where s.accessionnumber=:p_accessionnumber and studyuid is not null');
              ParamByName('p_accessionnumber').AsString := DA.GetString(dAccessionNumber);
              Prepare;
              Open;
              First;
              if not Eof then
              begin
                v_studyuid_myfnd := FieldByName('studyuid').AsString; // Add(77, $0008, $0050, tSH, 'AccessionNumber', '1');
                DA.Item[$0008, $0050].AsString[0] := '';
                // dStudyInstanceUID = 425;
                DA.Item[$0020, $000D].AsString[0] := v_studyuid_myfnd;  // Add(425, $0020, $000D, tUI, 'StudyInstanceUID', '1');
              end else begin
                v_studyuid_myfnd := '';
              end;
            finally
              Close; Free;
            end;
          end;
        end; }
        if v_1_7_ANinPID then   // искать ACCESSIONNUMBER в PATIENTID
        begin
          Lg_ev('v_1_7_ANinPID');
          if DA.GetString(dAccessionNumber) = '' then // если не выставлен номер протокола то пытаемся найти по Study UID
            Str := gtFldName('STUDYUID')+' = :P_dStudyInstanceUID '
          else
          begin
            Str := '( (' + gtFldName('ACCESSIONNUMBER')+' = :P_dAccessionNumber '+
                     ') OR ('+gtFldName('P_PID')+' = :P_dAccessionNumber ))';
          end;
          Lg_ev('SQL = '+Str);
        end else
        begin
          if DA.GetString(dAccessionNumber) = '' then // если не выставлен номер протокола то пытаемся найти по Study UID
            Str := gtFldName('STUDYUID')+' = :P_dStudyInstanceUID '
          else
            Str := gtFldName('ACCESSIONNUMBER')+' = :P_dAccessionNumber ';
          Lg_ev('SQL = '+Str);
        end;
      end else if Level = 'SERIES' then
        Str := gtFldName('SeriesUID')+' = :P_dSeriesInstanceUID '
      else if Level = 'IMAGE' then
        Str := gtFldName('InstanceUID')+' = :P_dSOPInstanceUID ';
    if DA.GetInteger($2809, $001D)=1 then     // ключевые снимки
      Str:=Str+' and '+gtFldName('SELECTEDINDEX1')+'=1 ';
    if Str = '' then exit;
    SQL := 'SELECT * FROM '+gtTabName('IMAGES')+' WHERE ' + Str + ' ORDER BY '+gtFldName('SERIESUID')+', '+gtFldName('IMGNO');
    // ---------------------------------------------------------------------------
    if v_isOracle then begin
      try
        v_ORAQr.DeleteVariables;
        v_ORAQr.SQL.Text:=SQL;
        Lg_ev('SQL='''+SQL+'''');
        v_PatientID := DA.GetString(dPatientID) ;
        if Level = 'PATIENT' then
        begin
          v_ORAQr.DeclareAndSet('P_dPatientID', otString , v_PatientID );
        end else
        begin
          Lg_ev('StudyInstanceUID='''+DA.GetString(dStudyInstanceUID)+'''');
          if Level = 'STUDY' then
          begin
            v_dAccessionNumber := DA.GetString(dAccessionNumber);
            if v_dAccessionNumber = '' then // если не выставлен номер протокола то пытаемся найти по Study UID
            begin
              v_dStudyInstanceUID := DA.GetString(dStudyInstanceUID);
              if chk_rzd_tmp(v_dStudyInstanceUID) then
              begin
                Str := gtFldName('STUDYUID')+' in ('+frm_str_tmp(v_dStudyInstanceUID)+') ';
                SQL := 'SELECT * FROM '+gtTabName('IMAGES')+' WHERE ' + Str + ' ORDER BY '+gtFldName('SERIESUID')+', '+gtFldName('IMGNO');
                v_ORAQr.SQL.Clear;
                v_ORAQr.SQL.Add(SQL);
              end else
              begin
                v_ORAQr.DeclareAndSet('P_dStudyInstanceUID', otString , v_dStudyInstanceUID );
              end;
            end else
            begin
              if chk_rzd_tmp(v_dAccessionNumber) then
              begin
                Str := gtFldName('ACCESSIONNUMBER')+' in ('+frm_str_tmp(v_dAccessionNumber)+') ';
                SQL := 'SELECT * FROM '+gtTabName('IMAGES')+' WHERE ' + Str + ' ORDER BY '+gtFldName('SERIESUID')+', '+gtFldName('IMGNO');
                v_ORAQr.SQL.Clear;
                v_ORAQr.DeleteVariables;
                v_ORAQr.SQL.Add(SQL);
              end else
              begin
                v_ORAQr.DeclareAndSet('P_dAccessionNumber', otString , v_dAccessionNumber );
              end;
            end;
          end else
          if Level = 'SERIES' then
          begin
            v_dSeriesInstanceUID:=DA.GetString(dSeriesInstanceUID);
            if chk_rzd_tmp(v_dSeriesInstanceUID) then
            begin
              Str := gtFldName('SeriesUID')+' in ('+frm_str_tmp(v_dSeriesInstanceUID)+') ';
              SQL := 'SELECT * FROM '+gtTabName('IMAGES')+' WHERE ' + Str + ' ORDER BY '+gtFldName('SERIESUID')+', '+gtFldName('IMGNO');
              v_ORAQr.SQL.Clear;
              v_ORAQr.DeleteVariables;
              v_ORAQr.SQL.Add(SQL);
            end else
            begin
              v_ORAQr.DeclareAndSet('P_dSeriesInstanceUID', otString , v_dSeriesInstanceUID );
            end;
          end else
          if Level = 'IMAGE' then
          begin
            v_dSOPInstanceUID := DA.GetString(dSOPInstanceUID);
            if chk_rzd_tmp(v_dSOPInstanceUID) then
            begin
              Str := gtFldName('InstanceUID')+' in ('+frm_str_tmp(v_dSOPInstanceUID)+') ';
              SQL := 'SELECT * FROM '+gtTabName('IMAGES')+' WHERE ' + Str + ' ORDER BY '+gtFldName('SERIESUID')+', '+gtFldName('IMGNO');
              v_ORAQr.SQL.Clear;
              v_ORAQr.DeleteVariables;
              v_ORAQr.SQL.Add(SQL);
            end else
            begin
              v_ORAQr.DeclareAndSet('P_dSOPInstanceUID', otString , v_dSOPInstanceUID );
            end;
          end;
        end;
        cmn_prt1(v_ORAQr);
      finally
        FreeAndNil(v_ORAQr);
      end; 
    end else if v_isPostgres then
    begin
      try
        v_UniQr.SQL.Add(SQL);
        if Level = 'PATIENT' then
        begin
          v_PatientID := DA.GetString(dPatientID) ;
          v_UniQr.ParamByName('P_dPatientID').AsString := v_PatientID;
        end else
        begin
          if Level = 'STUDY' then
          begin
            v_dAccessionNumber := DA.GetString(dAccessionNumber);
            Lg_ev('AccessionNumber='+v_dAccessionNumber);
            if v_dAccessionNumber = '' then // если не выставлен номер протокола то пытаемся найти по Study UID
            begin
              v_dStudyInstanceUID := DA.GetString(dStudyInstanceUID);
              if chk_rzd_tmp(v_dStudyInstanceUID) then
              begin
                Str := gtFldName('STUDYUID')+' in ('+frm_str_tmp(v_dStudyInstanceUID)+') ';
                SQL := 'SELECT * FROM '+gtTabName('IMAGES')+' WHERE ' + Str + ' ORDER BY '+gtFldName('SERIESUID')+', '+gtFldName('IMGNO');
                v_UniQr.SQL.Clear;
                v_UniQr.SQL.Add(SQL);
                Lg_ev(SQL);
              end else
              begin
                v_UniQr.ParamByName('P_dStudyInstanceUID').AsString := v_dStudyInstanceUID;
              end;
            end else
            begin
              if chk_rzd_tmp(v_dAccessionNumber) then
              begin
                Str := gtFldName('ACCESSIONNUMBER')+' in ('+frm_str_tmp(v_dAccessionNumber)+') ';
                SQL := 'SELECT * FROM '+gtTabName('IMAGES')+' WHERE ' + Str + ' ORDER BY '+gtFldName('SERIESUID')+', '+gtFldName('IMGNO');
                v_UniQr.SQL.Clear;
                v_UniQr.SQL.Add(SQL);
              end else
              begin
                v_UniQr.ParamByName('P_dAccessionNumber').AsString := v_dAccessionNumber;
              end;
            end;
          end else
          if Level = 'SERIES' then
          begin
            v_dSeriesInstanceUID:=DA.GetString(dSeriesInstanceUID);
            if chk_rzd_tmp(v_dSeriesInstanceUID) then
            begin
              Str := gtFldName('SeriesUID')+' in ('+frm_str_tmp(v_dSeriesInstanceUID)+') ';
              SQL := 'SELECT * FROM '+gtTabName('IMAGES')+' WHERE ' + Str + ' ORDER BY '+gtFldName('SERIESUID')+', '+gtFldName('IMGNO');
              v_UniQr.SQL.Clear;
              v_UniQr.SQL.Add(SQL);
            end else
            begin
              v_UniQr.ParamByName('P_dSeriesInstanceUID').AsString := v_dSeriesInstanceUID;
            end;
          end else
          if Level = 'IMAGE' then
          begin
            v_dSOPInstanceUID := DA.GetString(dSOPInstanceUID);
            if chk_rzd_tmp(v_dSOPInstanceUID) then
            begin
              Str := gtFldName('InstanceUID')+' in ('+frm_str_tmp(v_dSOPInstanceUID)+') ';
              SQL := 'SELECT * FROM '+gtTabName('IMAGES')+' WHERE ' + Str + ' ORDER BY '+gtFldName('SERIESUID')+', '+gtFldName('IMGNO');
              v_UniQr.SQL.Clear;
              v_UniQr.SQL.Add(SQL);
            end else
            begin
              v_UniQr.ParamByName('P_dSOPInstanceUID').AsString := v_dSOPInstanceUID ;
            end;
          end;

        end;
        cmn_prt1(v_UniQr);
      finally
        FreeAndNil(v_UniQr);
      end;
    end else
    begin
      try
        MyQuery.SelectSQL.Add(SQL);
        MyQuery.Prepare;
        if Level = 'PATIENT' then
        begin
          v_PatientID := DA.GetString(dPatientID) ;
          MyQuery.ParamByName('P_dPatientID').AsString := v_PatientID;
        end else
        begin
          if Level = 'STUDY' then
          begin
            v_dAccessionNumber := DA.GetString(dAccessionNumber);
            if v_dAccessionNumber = '' then // если не выставлен номер протокола то пытаемся найти по Study UID
            begin
              v_dStudyInstanceUID := DA.GetString(dStudyInstanceUID);
              if chk_rzd_tmp(v_dStudyInstanceUID) then
              begin
                Str := gtFldName('STUDYUID')+' in ('+frm_str_tmp(v_dStudyInstanceUID)+') ';
                SQL := 'SELECT * FROM '+gtTabName('IMAGES')+' WHERE ' + Str + ' ORDER BY '+gtFldName('SERIESUID')+', '+gtFldName('IMGNO');
                MyQuery.SelectSQL.Clear;
                MyQuery.SelectSQL.Add(SQL);
                MyQuery.Prepare;
              end else
              begin
                MyQuery.ParamByName('P_dStudyInstanceUID').AsString := v_dStudyInstanceUID;
              end;
            end else
            begin
              if chk_rzd_tmp(v_dAccessionNumber) then
              begin
                Str := gtFldName('ACCESSIONNUMBER')+' in ('+frm_str_tmp(v_dAccessionNumber)+') ';
                SQL := 'SELECT * FROM '+gtTabName('IMAGES')+' WHERE ' + Str + ' ORDER BY '+gtFldName('SERIESUID')+', '+gtFldName('IMGNO');
                MyQuery.SelectSQL.Clear;
                MyQuery.SelectSQL.Add(SQL);
                MyQuery.Prepare;
              end else
              begin
                if not vAccNmbInPatientID then
                begin
                  MyQuery.ParamByName('P_dAccessionNumber').AsString := v_dAccessionNumber;
                end else begin
                  Str := 'select * from IMAGES i where i.accessionnumber=:P_dAccessionNumber '+#13#10+
                         ' union '+#13#10+
                         ' select * from IMAGES i where i.p_pid=:P_dAccessionNumber ';
                  MyQuery.SelectSQL.Clear;
                  MyQuery.SelectSQL.Add(SQL);
                  MyQuery.Prepare;
                  MyQuery.ParamByName('P_dAccessionNumber').AsString := v_dAccessionNumber;
                //  MyQuery.ParamByName('p_pid').AsString := v_PatientID;
                end;
              end;
            end;
          end else
          if Level = 'SERIES' then
          begin
            v_dSeriesInstanceUID:=DA.GetString(dSeriesInstanceUID);
            if chk_rzd_tmp(v_dSeriesInstanceUID) then
            begin
              Str := gtFldName('SeriesUID')+' in ('+frm_str_tmp(v_dSeriesInstanceUID)+') ';
              SQL := 'SELECT * FROM '+gtTabName('IMAGES')+' WHERE ' + Str + ' ORDER BY '+gtFldName('SERIESUID')+', '+gtFldName('IMGNO');
              MyQuery.SelectSQL.Clear;
              MyQuery.SelectSQL.Add(SQL);
              MyQuery.Prepare;
            end else
            begin
              MyQuery.ParamByName('P_dSeriesInstanceUID').AsString := v_dSeriesInstanceUID;
            end;
          end else
          if Level = 'IMAGE' then
          begin
            v_dSOPInstanceUID := DA.GetString(dSOPInstanceUID);
            if chk_rzd_tmp(v_dSOPInstanceUID) then
            begin
              Str := gtFldName('InstanceUID')+' in ('+frm_str_tmp(v_dSOPInstanceUID)+') ';
              SQL := 'SELECT * FROM '+gtTabName('IMAGES')+' WHERE ' + Str + ' ORDER BY '+gtFldName('SERIESUID')+', '+gtFldName('IMGNO');
              MyQuery.SelectSQL.Clear;
              MyQuery.SelectSQL.Add(SQL);
              MyQuery.Prepare;
            end else
            begin
              MyQuery.ParamByName('P_dSOPInstanceUID').AsString := v_dSOPInstanceUID ;
            end;
          end;
        end;
        cmn_prt1(MyQuery);
      finally
        FreeAndNil(MyQuery);
      end;
    end;
    lg_ev('exit frm images');
  finally
    DecConnections;
  end;
end;

procedure TPacientNETSendANThread.Execute;
var v_PGconn : TUniConnection;
    v_PGTrans : TUniTransaction;
    v_UniQr : TUniQuery;
    da1 : TDicomAttributes;
    CnsDicomConnection1 : TCnsDicomConnection;
begin
  try
    v_PGconn:= TUniConnection.Create(nil);
    v_PGconn.LoginPrompt:=False;
    v_PGconn.ProviderName := 'PostgreSQL';
    v_PGconn.Database := vPACSSend_pg_database;
    v_PGconn.Port := vPACSSend_pg_port;
    v_PGconn.Server := vPACSSend_pg_server;
    v_PGconn.SpecificOptions.Values['Schema'] := vPACSSend_pg_Schema;
    v_PGconn.SpecificOptions.Values['UseUnicode'] := 'True';
    v_PGconn.Username := vPACSSend_pg_user;
    v_PGconn.Password := vPACSSend_pg_password;
    v_PGconn.Connected := True;
    //
    v_PGTrans := PGTransCreate (v_PGconn) ;
    v_PGTrans.DefaultConnection:=v_PGconn;
    try
      if v_PGconn<>nil then
      begin
        if v_PGconn.Connected then
        begin
          try
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_PGTrans;
              v_UniQr.SQL.Text := 'insert into '+vPACSSend_pg_Schema+
                  '.dicom_wlres_buffer (fdate,accessionnumber) '+
                  ' values (:p_fdate,:p_accessionnumber)';
              v_UniQr.ParamByName('p_fdate').AsDateTime := Now;
              v_UniQr.ParamByName('p_accessionnumber').AsString := f_accessionnumber;
              try
                v_UniQr.ExecSQL;
              except
              on e:Exception do
                Lg_ev( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
              end;
            finally
              v_UniQr.Free;
            end;
          except
            on E:Exception do
              Lg_ev ( '#1q !!! ERROR!!! - '+E.Message+#13+
                      'save accessionnumber to pacientNET '+#13+
                      'f_accessionnumber='+f_accessionnumber
                    );
          end;
        end;
      {  if v_WLSend_pg_days_stored>0 then
          try
            try
              v_UniQr := TUniQuery.Create(nil);
              try
                v_UniQr.Connection:=v_PGconn;
                v_UniQr.Transaction:=v_PGTrans;
                v_UniQr.SQL.Text := 'delete from '+v_WLSend_pg_Schema+
                    '.dicom_wl_buffer where create_date<:p_fdate';
                v_UniQr.ParamByName('create_date').AsDateTime := IncDay(Date,(-1)*v_WLSend_pg_days_stored);
                try
                  v_UniQr.ExecSQL;
                except
                on e:Exception do
                  Lg_ev( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
                end;
              finally
                v_UniQr.Free;
              end;
            except
              on E:Exception do
                Lg_ev ( '#2q !!! ERROR!!! - '+E.Message+#13+
                        'save accessionnumber to pacientNET '+#13+
                        'f_accessionnumber='+f_accessionnumber
                      );
            end;
          except
            on E:Exception do
              Lg_ev ( '#3q !!! ERROR!!! - '+E.Message+#13+
                      'clear accessionnumber table in pacientNET '+#13+
                      'f_accessionnumber='+f_accessionnumber
                    );
          end; }
      end;
    finally
      DB_CMN.PgFree(v_PGconn,v_PGTrans);
    end;
  except
    on E:Exception do
      Lg_ev ( '#2978 !!! ERROR!!! - '+E.Message );
  end;
  if v_AEWORKLIST<>'' then  
  try  // WORKLIST
    da1 := TDicomAttributes.Create;
        da1.Add($0020, $000D); // STUDYUID
        if (Trim(f_studyuid)<>'') then
          da1.Add($0020, $000D).AsString[0] := Trim(f_studyuid)
        else
          da1.Add($0020, $000D);
        //
        if f_studyuid<>'' then
        begin
          CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
          try
            CnsDicomConnection1.v_is_log := v_LOGWorklist;
            CnsDicomConnection1.v_log_filename := ExtractFilePath(paramstr(0))+'N_DELETE.log';
            CnsDicomConnection1.Host := v_teIPWORKLIST;
            CnsDicomConnection1.Port := StrToInt(v_PortWORKLIST);
            CnsDicomConnection1.CalledTitle := v_AEWORKLIST;
            CnsDicomConnection1.CallingTitle := v_LocAE;

            CnsDicomConnection1.ReceiveTimeout := 1000000;
            CnsDicomConnection1.addPresentationContext(ModalityWorklistInformationModelFIND);
            CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStep);
            CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStepRetrieve);
            CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStepNotification);
            if CnsDicomConnection1.N_DELETE(ModalityPerformedProcedureStep, gt_uniq_str, da1)
            then
              Lg_ev('Назначение удалено ... (studyuid='+f_studyuid+')' )
            else
              Lg_ev('ERROR');
          finally
            CnsDicomConnection1.Free;
            //das1.Free;
          end;
        end;
  except
    on E:Exception do
      Lg_ev ( '#4q !!! ERROR!!! - '+E.Message );
  end;
end;

procedure TForwardThread.Execute;
var v_is_err, v_is_ok1, v_is_ok2, v_is_find : Boolean;
  v_trRead, v_trWrite : TpFIBTransaction;
  v_DB: TpFIBDatabase;
  v_LOGtrRead, v_LOGtrWrite : TpFIBTransaction;
  v_LOGDB: TpFIBDatabase;
  v_Modality : String;
  FIBDataSet  : TpFIBDataSet;
  i, k, v_id_transfer_syntax, v_curr_rec,
  v_amm, v_amm_err,
  v_FN_COMPRESS, v_ID_RSND, v_FN_PRC_COMPRESS : Integer;
  DS : TDicomDataset;
  CnsDC : TCnsDicomConnection;
  v_studies : TStringList;
  v_PGconn: TUniConnection;
  v_PGTrans : TUniTransaction;
  v_OraConn: TOracleSession;
//label l1;
  procedure cmn_part;
  var k:integer;
  begin
    if v_amm>0 then
    begin
      // запись по studyUID в лог пересылки
      v_ID_RSND:=EVENTS_RSND_ins (  v_isOracle,
                   v_OraConn,
                   v_isPostgres,
                   v_PGconn,
                   v_PGTrans,
                   v_LOGDB,
                   v_LOGtrWrite,
                   v_studyUID_instance_sav[v_curr_rec].f_CallingTitle,
                   FIBDataSet.FieldByName('fc_title').AsString,
                   v_studyUID_instance_sav[v_curr_rec].f_StudyUID,
                   v_Modality,
                   v_studyUID_instance_sav[v_curr_rec].f_STUDYDATE,
                   Date,
                   v_amm,
                   v_studyUID_instance_sav[v_curr_rec].f_p_pid,
                   v_studyUID_instance_sav[v_curr_rec].f_patientname,
                   v_studyUID_instance_sav[v_curr_rec].f_ename,
                   v_studyUID_instance_sav[v_curr_rec].f_ACCESSIONNUMBER,
                   v_amm_err
                );
      // запись списка ошибочных снимков
      for k := 0 to Length(v_studyUID_instance_err) - 1 do
      begin
        wrtErrSnim ( v_isOracle,
                   v_OraConn,
                   v_isPostgres,
                   v_PGconn,
                   v_PGTrans,
                   v_LOGDB,
                   v_LOGtrWrite,
                   v_ID_RSND,
                   v_studyUID_instance_err[k].f_StudyUID,
                   v_studyUID_instance_err[k].f_instanceUID,
                   v_studyUID_instance_err[k].f_comm,
                   v_studyUID_instance_err[k].f_transfersyntax,
                   v_studyUID_instance_err[k].f_calledtitle
                 );
      end;
    end;
  end;

  procedure cmn_part2( p_FC_TITLE2:string;
                       p_fc_title:string;
                       p_FC_MOD : string;
                       p_FN_PRC_COMPRESS : Integer;
                       p_fc_ip : string;
                       p_fn_port : Integer
                     );
  var k:integer;                   
  begin
    v_amm:=0; v_amm_err:=0; v_curr_rec :=0;
    SetLength(v_studyUID_instance_err,0); // очистим массив с ошибочными снимками
    for k := 0 to Length(v_studyUID_instance_sav) - 1 do // цикл по снимкам
    begin
      if v_studyUID_instance_sav[k].f_StudyUID=v_studies[i] then
      begin  // отбор очередного исследования
        v_curr_rec:=k;
        // условия согласно которым производится пересылка снимков на сторонний PACS
        v_is_ok1:=True;
        if  (p_FC_TITLE2<>'') then
          v_is_ok1 := (p_FC_TITLE2=f_CallingTitle) ;
        v_is_ok2:=True;
        v_Modality:=v_studyUID_instance_sav[k].f_Modality;
        if (p_FC_MOD<>'') then
          v_is_ok2 := (p_FC_MOD=v_Modality) ;
        if v_is_ok1 and v_is_ok2 then
        begin // снимок подходит под правило - отправка
          if FileExists(v_studyUID_instance_sav[k].f_filename) then
          begin
            DS := TDicomDataset.Create;
            try
              DS.LoadFromFile(v_studyUID_instance_sav[k].f_filename);
              if v_FN_COMPRESS>0 then
              begin
                v_id_transfer_syntax:=v_FN_COMPRESS;
                if (v_id_transfer_syntax<=0) then
                  v_id_transfer_syntax := DS.Attributes.ImageData.ImageData[0].TransferSyntax ;
              end else
                v_id_transfer_syntax := DS.Attributes.ImageData.ImageData[0].TransferSyntax ;
              v_FN_PRC_COMPRESS := p_FN_PRC_COMPRESS ;
              if v_FN_PRC_COMPRESS=0 then v_FN_PRC_COMPRESS:=100;
              CnsDC := TCnsDicomConnection.Create( nil );
              CnsDC.MySetTransferSyntax(v_id_transfer_syntax, v_FN_PRC_COMPRESS);
              try // отправка изображения
                CnsDC.Host := p_fc_ip;
                CnsDC.Port := p_fn_port;
                CnsDC.CalledTitle    := p_fc_title;
                CnsDC.CallingTitle   := v_AE_TITLE; // AET самого сервиса
                CnsDC.ReceiveTimeout := c_Timeout;
                DCM_Connection.PDUTempPath:=GetTempDirectory;
                Inc(v_amm);
                try
                  if CnsDC.C_STORAGE( DS.Attributes ) then // отправляем его на пакс
                  begin // успешная отправка
                  end else
                  begin // ощибка при отправке
                    Inc(v_amm_err);
                    SetLength(v_studyUID_instance_err,Length(v_studyUID_instance_err)+1);
                    v_studyUID_instance_err[Length(v_studyUID_instance_err)-1]:=v_studyUID_instance_sav[k];
                    v_studyUID_instance_err[Length(v_studyUID_instance_err)-1].f_comm           :=
                          'ERROR';
                    v_studyUID_instance_err[Length(v_studyUID_instance_err)-1].f_transfersyntax :=
                          v_id_transfer_syntax;
                    v_studyUID_instance_err[Length(v_studyUID_instance_err)-1].f_calledtitle    :=
                          p_fc_title;
                  end;
                except
                  Inc(v_amm_err);
                  SetLength(v_studyUID_instance_err,Length(v_studyUID_instance_err)+1);
                  v_studyUID_instance_err[Length(v_studyUID_instance_err)-1]:=v_studyUID_instance_sav[k];
                  v_studyUID_instance_err[Length(v_studyUID_instance_err)-1].f_comm           :=
                        'ERROR';
                  v_studyUID_instance_err[Length(v_studyUID_instance_err)-1].f_transfersyntax :=
                        v_id_transfer_syntax;
                  v_studyUID_instance_err[Length(v_studyUID_instance_err)-1].f_calledtitle    :=
                        p_fc_title;
                end;
              finally
                MyDisconnectAssociation(CnsDC);
                CnsDC.Free;
              end;
            finally
              DS.Free;
            end;
          end;
        end;
      end;
    end;
  end;
  procedure hl7_cmn( pStudyUID:string );
  var l:Integer;
  begin
    // уведомление по HL7 Р-МИС
    if v_chk_snd_HL7 then
      for l := 0 to Length(v_studyUID_instance_sav) - 1 do
      begin
        if v_studyUID_instance_sav[l].f_StudyUID=pStudyUID then
        begin
          DicomServer.SndHL7( v_studyUID_instance_sav[l].f_p_pid,
                              v_studyUID_instance_sav[l].f_ACCESSIONNUMBER,
                              v_studyUID_instance_sav[l].f_StudyUID
                             );
          Break;
        end;
      end;
  end;
  procedure pMPPS( pStudyUID:string );
  var das1, das2: TDicomAttributes;
      da1: TDicomAttribute;
      CnsDicomConnection1: TCnsDicomConnection;
  begin // MPPS - сообщение WORKLIST - исследование выполнено
    if v_MPPS then
    begin
      //"Complete" Notification
      //Operation Received = N-SET
      das1 := TDicomAttributes.Create;

      // das1.AddVariant($0008, $0060, edModality.Text); // Modality:
      da1 := das1.Add($0008, $1032); // Procedure Code Sequence       : Sequence of 1 items:
      {
      das2 := TDicomAttributes.Create;
      begin
        da1.AddData(das2);
        //---------------
        das2.AddVariant($0008, $0100, edCodeValue.Text); // Code Value:
        das2.AddVariant($0008, $0102, edCodingSchemeDesignator.Text); // Coding Scheme Designator:
        das2.AddVariant($0008, $0104, edCodeMeaning.Text); // Code Meaning:      'procedure Code 1'
        //---------------
      end;
      das1.Add($0008, $1120); // Referenced Patient Sequence   :
      das1.AddVariant($0010, $0010, edPatientName.Text); // Patient's Name                :
      das1.AddVariant($0010, $0020, edPatientID.Text); // Patient ID:
      das1.Add($0010, $0030).asDatetime[0] := dtBirthDate.Date; // Patient's Birth Date          : 1962-12-31
      das1.AddVariant($0010, $0040, edSex.Text); // Patient's Sex                 : M
      das1.AddVariant($0020, $0010, edStudyID.Text); // Study ID:
      das1.AddVariant($0040, $0241, edStationAETitle.Text); // Performed Station AE Title:
      das1.AddVariant($0040, $0242, edStationName.Text); // Performed Station Name:
      das1.AddVariant($0040, $0243, edLocation.Text); // Performed Location:
      das1.Add($0040, $0244).asDatetime[0] := now; // Performedprocedure Step Start: 2008 - 1 - 11
      das1.Add($0040, $0245).asDatetime[0] := now; // Performed procedure Step Start: ?? 10: 05: 59
      das1.Add($040, $0250); // Performed Procedure Step End D:
      das1.Add($0040, $0251); // Performed Procedure Step End T:
      }
      das1.AddVariant($0020, $000D, pStudyUID);
      das1.AddVariant($0040, $0252, 'COMPLETED'); // Performed procedure Step Statu:
      das1.AddVariant($0040, $0253, 1); // Performed procedure Step ID: 1
      {
      das1.AddVariant($0040, $0254, edPPSD.Text);
      // Performed procedure Step Descr:
      das1.AddVariant($0040, $0255, edPPDT.Text);
      // Performed procedure type Descr:
      da1 := das1.Add($0040, $0260);
      // Performed Action Item Sequence: Sequence of 1 items:
      das2 := TDicomAttributes.Create;
      da1.AddData(das2);
      begin
        //---------------
        das2.AddVariant($0008, $0100, 'PAI - 1'); // Code Value:
        das2.AddVariant($0008, $0102, 'DICOMVCL'); // Coding Scheme Designator:
        das2.AddVariant($0008, $0104, 'Performed Action Item 1'); // Code Meaning:
        //---------------
      end;
      da1 := das1.Add($0040, $0270);
      }
      // Scheduled Step Attributes Sequ: Sequence of 1 items:
      das2 := TDicomAttributes.Create;
      da1.AddData(das2);
      begin
        //---------------
        // das2.AddVariant($0008, $0050, edAccessionnumber.Text); // Accession Number:
        // das2.Add($0008, $1110); // Referenced Study Sequence     :
        das2.AddVariant($0020, $000D, pStudyUID);
        // Study Instance UID:
        {
        das2.AddVariant($0032, $1060, edRPD.Text);
        // Requested procedure Descriptio:
        das2.AddVariant($0040, $0007, edSPSD.Text);
        // Scheduled procedure Step Descr:
        das2.Add($0040, $0008); // Scheduled Action Item Code Seq:
        das2.AddVariant($0040, $0009, edSPSID.Text); // Scheduled procedure Step ID:
        das2.AddVariant($0040, $1001, edReqProcStepID.Text); // Requested procedure ID:
        }
        //---------------
      end;
      // das1.Add($0040, $0340); // Performed Series Sequence     : }

      CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
      try

      {
        v_teIPWORKLIST := Ini.ReadString( c_4_razdel, c_4_1_IP_Worklist, 'localhost' ) ;
        v_PortWORKLIST := Ini.ReadString( c_4_razdel, c_4_2_PORT_Worklist, '1112' ) ;
        v_AEWORKLIST   := Ini.ReadString( c_4_razdel, c_4_3_AETITLE_Worklist, 'WLSERVER' ) ;

        v_CheckAEWorklist := ( Ini.ReadString( c_1_razdel, c_4_4_CheckAE_Worklist, '0' ) = '1' ) ;
        v_LOGWorklist     := ( Ini.ReadString( c_1_razdel, c_4_5_LOGWorklist, '0' ) = '1' ) ;
        
      }

        CnsDicomConnection1.Host := v_teIPWORKLIST;
        CnsDicomConnection1.Port := StrToInt(v_PortWORKLIST);
        CnsDicomConnection1.CalledTitle := v_AEWORKLIST;
        CnsDicomConnection1.CallingTitle := v_AE_TITLE;

        CnsDicomConnection1.ReceiveTimeout := 1000000;
        CnsDicomConnection1.ClearPresentationContext;
        CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStep);
        try
          if CnsDicomConnection1.N_SET(ModalityPerformedProcedureStep, '1.2.3.4.5.' +
            FormatDatetime('yyyymmdd.hhnnss.zzz', now), das1)
          then
          begin
            // if v_LOGWorklist then
            if v_1_7_IS_LOG_WRITE then
              Lg_ev ( 'MPPS N-SET command '+#13+
                      'IPWORKLIST='+v_teIPWORKLIST+#13+
                      'PortWORKLIST='+v_PortWORKLIST+#13+
                      'Called AE Title (AEWORKLIST) = '+v_AEWORKLIST+#13+
                      'Calling AE Title='+v_AE_TITLE+#13+
                      'StudyUID='+pStudyUID+#13+
                      'set COMPLETED'
                    );
          end else
              Lg_ev ( '#5q !!! ERROR!!! - MPPS N-SET command '+#13+
                      'IPWORKLIST='+v_teIPWORKLIST+#13+
                      'PortWORKLIST='+v_PortWORKLIST+#13+
                      'Called AE Title (AEWORKLIST) = '+v_AEWORKLIST+#13+
                      'Calling AE Title='+v_AE_TITLE+#13+
                      'StudyUID='+pStudyUID+#13+
                      'set COMPLETED'
                    );
        except
          on E:Exception do
            Lg_ev ( '#6q !!! ERROR!!! - '+E.Message+#13+
                    'MPPS N-SET command '+#13+
                    'IPWORKLIST='+v_teIPWORKLIST+#13+
                    'PortWORKLIST='+v_PortWORKLIST+#13+
                    'Called AE Title (AEWORKLIST) = '+v_AEWORKLIST+#13+
                    'Calling AE Title='+v_AE_TITLE+#13+
                    'StudyUID='+pStudyUID
                  );
        end;
      finally
        CnsDicomConnection1.Free;
        //das1.Free;
      end;

    end;
  end;
const c_sql_cmn0 = 'SELECT FC_TITLE, FC_IP, FN_PORT, FC_MOD, FN_COMPRESS,FN_PRC_COMPRESS, '+#13+
                             ' (select fc_title from  DEVICES as d2  '+#13+
                              ' where d2.FK_ID=RULES.FK_DEVICEID2 ) as FC_TITLE2 '+#13+
                      ' FROM RULES, DEVICES '+#13+
                     ' WHERE RULES.FK_DEVICEID = DEVICES.FK_ID';
var v_UniQr : TUniQuery; v_ORAQr : TOracleDataSet;                     
begin
  v_studies := TStringList.Create;
  try
    // сформируем список с исследованиями (STUDYUID)
    for I := 0 to Length(v_studyUID_instance_sav) - 1 do
    begin
      v_is_find:=False;
      for k := 0 to v_studies.Count - 1 do
        if v_studyUID_instance_sav[i].f_StudyUID=v_studies[k] then
        begin
          v_is_find:=True;
          Break;
        end;
      if not v_is_find then
        v_studies.Add(v_studyUID_instance_sav[i].f_StudyUID);
    end;
    v_is_err:=False;
    //
    if v_isOracle then begin
      v_OraConn := DB_CMN.OraConnCrt;
      if v_OraConn<>nil then
        if v_OraConn.Connected then
        begin
          v_ORAQr := TOracleDataSet.Create(nil);
          try
            v_ORAQr.Session:=v_OraConn;
            v_ORAQr.SQL.Text := 'SELECT FC_TITLE, FC_IP, FN_PORT, FC_MOD, FN_COMPRESS,FN_PRC_COMPRESS,  '+
                            ' (select d2.FC_TITLE from pacs.DEVICES d2  '+
                            '   where d2.FK_ID=r.FK_DEVICEID2 ) as FC_TITLE2  '+
                     '  FROM pacs.RULES r, pacs.DEVICES d  '+
                     ' WHERE r.FK_DEVICEID = d.FK_ID ';
            try
              v_ORAQr.Open;
            except
            on e:Exception do
              begin
                v_is_err:=True;
                Lg_ev( 'ERROR '+E.Message+' SQL: '+c_sql_cmn0);
                CmnMyDoQueryInsertCMN ( 'ошибка SQL', 3, 'ERROR '+E.Message+' SQL: '+c_sql_cmn0,
                          nil, nil, v_isPostgres,v_PGconn,v_PGTrans, v_isOracle, v_OraConn );
              end;
            end;
            if not v_is_err then
            for i := 0 to v_studies.Count - 1 do
            begin  // цикл по исследованиям
              hl7_cmn(v_studies[i]);
              pMPPS(v_studies[i]);
              v_ORAQr.First;
              while not v_ORAQr.Eof do  // цикл по правилам
              begin
                cmn_part2( v_ORAQr.FieldByName('FC_TITLE2').AsString,
                           v_ORAQr.FieldByName('fc_title').AsString,
                           v_ORAQr.FieldByName('FC_MOD').AsString,
                           v_ORAQr.FieldByName('FN_PRC_COMPRESS').AsInteger,
                           v_ORAQr.FieldByName('fc_ip').AsString,
                           v_ORAQr.FieldByName('fn_port').AsInteger
                         );
                cmn_part;
                v_ORAQr.Next;
              end;
            end;
          finally
            v_ORAQr.Close;
            v_ORAQr.Free;
          end;
        end;
    end else if v_isPostgres then
    begin
      v_PGconn := DB_CMN.PgConnCrt;
      v_PGTrans := PGTransCreate (v_PGconn) ;
      v_PGTrans.DefaultConnection:=v_PGconn;
      if v_PGconn<>nil then
        if v_PGconn.Connected then
        begin
          v_UniQr := TUniQuery.Create(nil);
          try
            v_UniQr.Connection:=v_PGconn;
            v_UniQr.Transaction:=v_PGTrans;
            v_UniQr.SQL.Text := 'select d.fc_title, d.fc_ip, d.fn_port, d.fc_mod, r.fn_compress, r.fn_prc_compress,  '+
                            ' (select d2.fc_title from '+v_pg_schema+'.devices d2  '+
                            '   where d2.fk_id=r.fk_deviceid2 ) as fc_title2  '+
                     '  from '+v_pg_schema+'.rules r, '+v_pg_schema+'.devices d  '+
                     ' where r.fk_deviceid = d.fk_id ';
            try
              v_UniQr.Open;
            except
            on e:Exception do
              begin
                v_is_err:=True;
                Lg_ev( 'ERROR '+E.Message+' SQL: '+c_sql_cmn0);
                CmnMyDoQueryInsertCMN ( 'ошибка SQL', 3, 'ERROR '+E.Message+' SQL: '+c_sql_cmn0,
                          nil, nil, v_isPostgres,v_PGconn,v_PGTrans, v_isOracle, v_OraConn );
              end;
            end;
            if not v_is_err then
            for i := 0 to v_studies.Count - 1 do
            begin  // цикл по исследованиям
              hl7_cmn(v_studies[i]);
              pMPPS(v_studies[i]);
              v_UniQr.First;
              while not v_UniQr.Eof do  // цикл по правилам
              begin
                cmn_part2( v_UniQr.FieldByName('FC_TITLE2').AsString,
                           v_UniQr.FieldByName('fc_title').AsString,
                           v_UniQr.FieldByName('FC_MOD').AsString,
                           v_UniQr.FieldByName('FN_PRC_COMPRESS').AsInteger,
                           v_UniQr.FieldByName('fc_ip').AsString,
                           v_UniQr.FieldByName('fn_port').AsInteger
                         );
                cmn_part;
                v_UniQr.Next;
              end;
            end;
          finally
            v_UniQr.Close;
            v_UniQr.Free;
          end;
        end;
    end else
    begin
      v_DB:=f_fb_db_crt(c_alias);
      v_trRead:= f_FbReadTransactCreate( v_DB );
      v_trWrite:= f_FbWriteTransactCreate( v_DB );
      v_LOGDB:=f_fb_db_crt(c_LOGalias);
      v_LOGtrRead:= f_FbReadTransactCreate( v_LOGDB );
      v_LOGtrWrite:= f_FbWriteTransactCreate( v_LOGDB );
      if v_DB<>nil then
        if v_DB.Connected then
        begin
          FIBDataSet  := TpFIBDataSet.Create(nil);
          try
            FIBDataSet.Database    := v_DB;
            FIBDataSet.Transaction := v_trRead ;
            FIBDataSet.SelectSQL.Text := c_sql_cmn0;
            try
              FIBDataSet.Open;
            except
            on e:Exception do
              begin
                v_is_err:=True;
                Lg_ev(lg_SQLDS(FIBDataSet,E.ClassName,E.Message));
                try
                  CmnMyDoQueryInsertCMN ( 'ошибка SQL', 3, lg_SQLDS(FIBDataSet,E.ClassName,E.Message),
                            v_LOGDB, v_LOGtrRead, v_isPostgres,v_PGconn,v_PGTrans, v_isOracle, v_OraConn );
                except
                end;
              end;
            end;
            if not v_is_err then
            for i := 0 to v_studies.Count - 1 do
            begin  // цикл по исследованиям
              hl7_cmn(v_studies[i]);
              pMPPS(v_studies[i]);
              FIBDataSet.First;
              while not FIBDataSet.Eof do  // цикл по правилам
              begin
                cmn_part2( FIBDataSet.FieldByName('FC_TITLE2').AsString,
                           FIBDataSet.FieldByName('fc_title').AsString,
                           FIBDataSet.FieldByName('FC_MOD').AsString,
                           FIBDataSet.FieldByName('FN_PRC_COMPRESS').AsInteger,
                           FIBDataSet.FieldByName('fc_ip').AsString,
                           FIBDataSet.FieldByName('fn_port').AsInteger
                         );
                cmn_part;
                FIBDataSet.Next;
              end;
            end;
          finally
            FIBDataSet.Close;
            FIBDataSet.Free;
          end;
        end;
    end;
    if v_isOracle then begin
      OraFree(v_OraConn);
    end else if v_isPostgres then
    begin
      PgFree ( v_PGconn, v_PGTrans );
    end else
    begin
      p_free_conn_fb ( v_DB ,
                       v_trWrite ,
                       v_trRead
                      );
      p_free_conn_fb ( v_LOGDB ,
                       v_LOGtrWrite ,
                       v_LOGtrRead
                      );
    end;
  finally
    v_studies.Free;
  end;
end;

procedure TDicomServer.MyOnTerminate(Sender: TObject);
var iii, i, v_amm_received, v_SessionID, v_high, v_length : integer;
    v_CallingTitle, v_TransactionUID, v_StudyUID : string;
    v_text : ansistring;
    NewThread: TForwardThread;
begin
  v_high:=Length((Sender as TDicomClientThread).v_studyUID_img_sav_lst);
  if v_high>0 then
  begin
    v_SessionID:=(Sender as TDicomClientThread).SessionID;
  //  v_amm_received   := 0 ;
    v_text           := '' ;
    v_CallingTitle   := '' ;
    v_TransactionUID := '' ;
    v_StudyUID       := '' ;
    for i := 0 to v_high - 1 do
    begin
      if ((Sender as TDicomClientThread).v_studyUID_img_sav_lst[i].f_SessionID=v_SessionID)
      then
      begin
        v_amm_received   := (Sender as TDicomClientThread).v_studyUID_img_sav_lst[i].f_amm_received ;
        v_text           := (Sender as TDicomClientThread).v_studyUID_img_sav_lst[i].f_text ;
        v_CallingTitle   := (Sender as TDicomClientThread).v_studyUID_img_sav_lst[i].f_CallingTitle ;
        v_TransactionUID := (Sender as TDicomClientThread).v_studyUID_img_sav_lst[i].f_TransactionUID ;
        v_StudyUID       := (Sender as TDicomClientThread).v_studyUID_img_sav_lst[i].f_StudyUID ;
        CmnMyDoQueryInsert( 'DicomImage',
                 4,
                 v_text+#13+
                 'Transaction UID: '+v_TransactionUID+#13+
                 'Study Instance UID: '+v_StudyUID+#13+
                 'Принято снимков : '+inttostr(v_amm_received)+#13+
                 (Sender as TDicomClientThread).v_studyUID_img_sav_lst[i].f_patient_info,
                 (Sender as TDicomClientThread)
               );
      end;
    end;
    // запустим отдельный поток                     //  приоритет можно поставить:
    // для пересылки снимков на другой пакс         //  tpTimeCritical - критический   tpLower - низкий
    NewThread:=TForwardThread.Create(true);         //  tpHighest - очень высокий      tpLowest - очень низкий
    NewThread.FreeOnTerminate := True;
    NewThread.f_SessionID := v_SessionID;           //  tpHigher - высокий             tpIdle - поток работает во время простоя системы
    NewThread.f_CallingTitle   := v_CallingTitle;   //  tpNormal - средний
    v_length := Length((Sender as TDicomClientThread).v_studyUID_instance_sav);
    SetLength(NewThread.v_studyUID_instance_sav,v_length);
    for iii := 0 to v_length - 1 do
      NewThread.v_studyUID_instance_sav[iii]:=(Sender as TDicomClientThread).v_studyUID_instance_sav[iii];
    // поток после выполнения автоматически завершится,
    // объект будет уничтожен
    NewThread.FreeOnTerminate:=true;
    NewThread.Priority:=tpNormal;
    NewThread.Resume; // запуск потока: Create(true) - дождаться команды
  end;
  //
  if v_isOracle then     // ORACLE
  begin
    (Sender as TDicomClientThread).ORAconn.Commit;
    (Sender as TDicomClientThread).ORAconn.Connected:=False;
    (Sender as TDicomClientThread).ORAconn.Free;
  end else if v_isPostgres then
  begin
    if (Sender as TDicomClientThread).PGTrans.Active then
      (Sender as TDicomClientThread).PGTrans.Commit;
    (Sender as TDicomClientThread).PGconn.Close;
    (Sender as TDicomClientThread).PGTrans.Free;
    (Sender as TDicomClientThread).PGconn.Free;
  end else
  begin
    p_free_conn_fb ( (Sender as TDicomClientThread).v_ClThr_DB as TpFIBDatabase ,
                     (Sender as TDicomClientThread).v_ClThr_trWrite as TpFIBTransaction ,
                     (Sender as TDicomClientThread).v_ClThr_trRead as TpFIBTransaction
                    );
    if v_crt_log then                   
      p_free_conn_fb ( (Sender as TDicomClientThread).v_ClThr_LOGDB as TpFIBDatabase ,
                       (Sender as TDicomClientThread).v_ClThr_LOGtrWrite as TpFIBTransaction ,
                       (Sender as TDicomClientThread).v_ClThr_LOGtrRead as TpFIBTransaction
                      );
  end;
end;

procedure TDicomServer.DicomServerDicomImage(AClientThread: TDicomClientThread; AAddress: string; ADataset: TDicomDataset);
var InstanceUID, Aid, pName, pDateBorn, pSex, ImageType, StudyID, SeriesUID,
    StudyUID, PatientID, ImageType1, StudyDescription, PhysName, AccessionNumber: string;
    StudyDate: TDatetime;
    DA: TDicomAttribute;
    v_Selected2, v_SessionID : integer;
    y, m, d: Word;
    ImageFilename,
    CurDir ,
    v_StudyDate,
    v_Modality ,
    v_STUDYUID_OLD,
    vNextNmb : string;
  //  vFIBDataSet : TpFIBDataSet;
  function gtNextNmbUID : Integer;
  var v_UniQr : TUniQuery;
 // var FIBDataSet : TpFIBDataSet;
  begin
    try
      if v_isOracle then     // ORACLE
      begin
      end else if v_isPostgres then
      begin
        v_UniQr := TUniQuery.Create(nil);
        try
          if AClientThread=nil then begin
            v_UniQr.Connection:=DB_CMN.PGconn;
            v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
          end else begin
            v_UniQr.Connection:=AClientThread.PGconn;
            v_UniQr.Transaction:=AClientThread.PGTrans;
          end;
          v_UniQr.SQL.Text := 'SELECT NEXTVAL('''+v_pg_Schema+'.gen_nuid'''') as nn';
          v_UniQr.Open; v_UniQr.First;
          if not eof then
            Result:=v_UniQr.FieldByName('nn').AsInteger
          else
            Result:=1;
        finally
          v_UniQr.Free;
        end;
      end else
      begin
        with TpFIBDataSet.Create(nil) do
        begin
          try
            if AClientThread<>nil then
            begin
              Database := (AClientThread.v_ClThr_DB as TpFIBDatabase); // DB;
              Transaction := (AClientThread.v_ClThr_trRead as TpFIBTransaction); // trRead ;
            end else
            begin
              Database := DB_CMN.DB;
              Transaction := DB_CMN.trRead ;
            end;
            AutoCommit := True;
            SQLs.SelectSQL.Text := 'SELECT GEN_ID(GEN_NUID_ID,1) as nn from RDB$DATABASE';
            Open; First;
            Result:=FieldByName('nn').AsInteger;
          finally
            Free;
          end;
        end;
      end;
    except
      try
        Result:=Random(1000000)+GetTickCount;
      except
        Result:=Random(1000000)+Random(1000000)+Random(1000000)+Random(1000000)+Random(1000000)+Random(1000000);
      end;
    end;
  end;
  function gtAccNMB( pStudyUID:string ) : string;
  var v_UniQr : TUniQuery;
 // var FIBDataSet : TpFIBDataSet;
  begin
    if v_isOracle then     // ORACLE
    begin
    end else if v_isPostgres then
    begin
      v_UniQr := TUniQuery.Create(nil);
      try
        if AClientThread=nil then begin
          v_UniQr.Connection:=DB_CMN.PGconn;
          v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        end else begin
          v_UniQr.Connection:=AClientThread.PGconn;
          v_UniQr.Transaction:=AClientThread.PGTrans;
        end;
        v_UniQr.SQL.Text := 'select accessionnumber from '+v_pg_Schema+'.studies where studyuid=:pstudyuid';
        v_UniQr.ParamByName('pSTUDYUID').AsString := pStudyUID;
        v_UniQr.Open; v_UniQr.First;
        if not v_UniQr.eof then
          Result:=v_UniQr.FieldByName('ACCESSIONNUMBER').AsString
        else
          Result:='';
      finally
        v_UniQr.Free;
      end;
    end else
    begin
      with TpFIBDataSet.Create(nil) do
      begin
        try
          if AClientThread<>nil then
          begin
            Database := (AClientThread.v_ClThr_DB as TpFIBDatabase); // DB;
            Transaction := (AClientThread.v_ClThr_trRead as TpFIBTransaction); // trRead ;
          end else
          begin
            Database := DB_CMN.DB;
            Transaction := DB_CMN.trRead ;
          end;
          AutoCommit := True;
          SQLs.SelectSQL.Text := 'SELECT ACCESSIONNUMBER from STUDIES where STUDYUID=:pSTUDYUID';
          ParamByName('pSTUDYUID').AsString := pStudyUID;
          Open; First;
          if not eof then
            Result:=FieldByName('ACCESSIONNUMBER').AsString
          else
            Result:='';
        finally
          Free;
        end;
      end;
    end;
  end;
  function gtModalities( pAETitle : string ):string;
  var v_UniQr : TUniQuery;
  begin
    if v_isOracle then     // ORACLE
    begin
    end else if v_isPostgres then
    begin
      v_UniQr := TUniQuery.Create(nil);
      try
        if AClientThread=nil then begin
          v_UniQr.Connection:=DB_CMN.PGconn;
          v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        end else begin
          v_UniQr.Connection:=AClientThread.PGconn;
          v_UniQr.Transaction:=AClientThread.PGTrans;
        end;
        v_UniQr.SQL.Text := 'select fc_mod from '+v_pg_Schema+'.devices where fc_title=:pfc_title limit 1';
        v_UniQr.ParamByName('pfc_title').AsString := pAETitle;
        v_UniQr.Open; v_UniQr.First;
        if v_UniQr.Eof then
          Result := ''
        else
          Result:= v_UniQr.FieldByName('fc_mod').AsString;
      finally
        v_UniQr.Free;
      end;
    end else
    begin
      Result:='';
    end;
  end;
  function chkStudyUID( pStudyUID:string ) : Boolean;
  var v_UniQr : TUniQuery;
 // var FIBDataSet : TpFIBDataSet;
  begin
    if v_isOracle then     // ORACLE
    begin
    end else if v_isPostgres then
    begin
      v_UniQr := TUniQuery.Create(nil);
      try
        if AClientThread=nil then begin
          v_UniQr.Connection:=DB_CMN.PGconn;
          v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        end else begin
          v_UniQr.Connection:=AClientThread.PGconn;
          v_UniQr.Transaction:=AClientThread.PGTrans;
        end;
        v_UniQr.SQL.Text := 'select 1 from '+v_pg_Schema+'.studies where studyuid=:pstudyuid';
        v_UniQr.ParamByName('pSTUDYUID').AsString := pStudyUID;
        v_UniQr.Open; v_UniQr.First;
        Result:=not v_UniQr.Eof;
      finally
        v_UniQr.Free;
      end;
    end else
    begin
      with TpFIBDataSet.Create(nil) do
      begin
        try
          if AClientThread<>nil then
          begin
            Database := (AClientThread.v_ClThr_DB as TpFIBDatabase); // DB;
            Transaction := (AClientThread.v_ClThr_trRead as TpFIBTransaction); // trRead ;
          end else
          begin
            Database := DB_CMN.DB;
            Transaction := DB_CMN.trRead ;
          end;
          AutoCommit := True;
          SQLs.SelectSQL.Text := 'select 1 from studies where studyuid=:pstudyuid';
          ParamByName('pSTUDYUID').AsString := pStudyUID;
          Open; First;
          Result:=not Eof;
        finally
          Free;
        end;
      end;
    end;
  end;
  procedure chk_studyUID_img_sav_lst ( p_TransactionUID : string;
                                      p_StudyUID : string;
                                      p_CallingTitle : string;
                                      p_text : ansistring;
                                      p_SessionID : integer;
                                      p_patient_info : String;
                                      p_instanceUID    : string;
                                      p_filename : ansistring;
                                      p_Modality : string;
                                      p_STUDYDATE : TDateTime;
                                      p_p_pid          : string;
                                      p_patientname    : string;
                                      p_ename          : string;
                                      p_ACCESSIONNUMBER: string
                                    ) ;
  var i , v_high : integer;
      v_res : boolean;
  begin
    // просто добавим снимок в список для дальнейшей пересылки если потребуется (по правилам)
    v_high:=Length(AClientThread.v_studyUID_instance_sav);
    SetLength(AClientThread.v_studyUID_instance_sav,v_high+1);
    AClientThread.v_studyUID_instance_sav[v_high].f_SessionID      := p_SessionID;
    AClientThread.v_studyUID_instance_sav[v_high].f_instanceUID    := p_instanceUID;
    AClientThread.v_studyUID_instance_sav[v_high].f_filename       := p_filename;
    AClientThread.v_studyUID_instance_sav[v_high].f_Modality       := p_Modality;
    AClientThread.v_studyUID_instance_sav[v_high].f_CallingTitle   := p_CallingTitle ;
    AClientThread.v_studyUID_instance_sav[v_high].f_StudyUID       := p_StudyUID ;
    AClientThread.v_studyUID_instance_sav[v_high].f_STUDYDATE      := p_STUDYDATE;
    AClientThread.v_studyUID_instance_sav[v_high].f_p_pid          := p_p_pid;
    AClientThread.v_studyUID_instance_sav[v_high].f_patientname    := p_patientname;
    AClientThread.v_studyUID_instance_sav[v_high].f_ename := p_ename;
    AClientThread.v_studyUID_instance_sav[v_high].f_ACCESSIONNUMBER := p_ACCESSIONNUMBER;
    // запишем в список по studyUID для протокола
    v_res:=False;
    v_high:=Length(AClientThread.v_studyUID_img_sav_lst);
    for i := 0 to v_high - 1 do
    begin
      if ((AClientThread.v_studyUID_img_sav_lst[i].f_TransactionUID=p_TransactionUID) and
          (AClientThread.v_studyUID_img_sav_lst[i].f_StudyUID=p_StudyUID))
      then
      begin
        // нарастим количество принятых снимков если запись в массиве есть
        AClientThread.v_studyUID_img_sav_lst[i].f_amm_received := AClientThread.v_studyUID_img_sav_lst[i].f_amm_received + 1 ;
        if Pos(p_patient_info,AClientThread.v_studyUID_img_sav_lst[i].f_patient_info)<=0 then
        AClientThread.v_studyUID_img_sav_lst[i].f_patient_info := AClientThread.v_studyUID_img_sav_lst[i].f_patient_info +#13+ p_patient_info ;
        v_res:=True;
        break;
      end;
    end;
    if not v_res then // если записи в массиве нет - добавим запись и пропишем поля
    begin
      v_high:=Length(AClientThread.v_studyUID_img_sav_lst);
      SetLength(AClientThread.v_studyUID_img_sav_lst,v_high+1);
      AClientThread.v_studyUID_img_sav_lst[v_high].f_CallingTitle   := p_CallingTitle ;
      AClientThread.v_studyUID_img_sav_lst[v_high].f_TransactionUID := p_TransactionUID ;
      AClientThread.v_studyUID_img_sav_lst[v_high].f_StudyUID       := p_StudyUID ;
      AClientThread.v_studyUID_img_sav_lst[v_high].f_amm_received   := 1 ;
      AClientThread.v_studyUID_img_sav_lst[v_high].f_text           := p_text ;
      AClientThread.v_studyUID_img_sav_lst[v_high].f_SessionID      := p_SessionID;
      AClientThread.v_studyUID_img_sav_lst[v_high].f_patient_info   := p_patient_info;
    end;
  end;

  procedure SetDir(ADir: string); // если каталога нет - создадим его перед сохранением в него снимка
  begin
    Lg_ev('#point1 CurDir=' + CurDir+' ADir='+ADir );
    if ADir <> '' then
      begin
        if CurDir <> '' then
          begin
            if CurDir[Length(CurDir)] <> '\' then
              CurDir := CurDir + '\';
            CurDir := CurDir + ADir;
          end else
          begin
            CurDir := ADir;
          end;
        Lg_ev('создаем/открываем каталог CurDir=' + CurDir+' ADir='+ADir);
        if not DirectoryExists(CurDir) then
          if not CreateDir(CurDir) then
            Lg_ev('ERROR - Не удаётся создать дирректорию ' + CurDir);
      end;
  end;
var //  v_ibqr : TpFIBQuery;
    //  i : Integer;
      v_errfilename, v_errfilename1, v_errfilename2 : AnsiString;
      v_StringList : TStringList;
      vLenTmp : Integer;
   //   da_tmp : TDicomAttribute;
label l1;
var v_fnd : Boolean; vCurDir : AnsiString; ddS : TDicomAttribute;
  function chkOtherStudyUID ( pStudyUID, pPatientID, pImageType : string ) : Boolean;
  begin
  {  with TpFIBDataSet.Create(nil) do
    try
      try
        if AClientThread<>nil then
        begin
          Database := (AClientThread.v_ClThr_DB as TpFIBDatabase); // DB;
          Transaction := (AClientThread.v_ClThr_trRead as TpFIBTransaction); // trRead ;
        end else
        begin
          Database := DB_CMN.DB;
          Transaction := DB_CMN.trRead ;
        end;
        AutoCommit := True;
        if pImageType='' then
        begin
          SQLs.SelectSQL.Text := ' SELECT STUDYUID FROM STUDIES WHERE (STUDYUID = UPPER(:STUDYUID)) and '+
                                 ' (UPPER(P_PID)<>UPPER(:P_PID))'; // ищем исследование
        end else
        begin
          SQLs.SelectSQL.Text := ' SELECT STUDYUID FROM STUDIES WHERE (STUDYUID = UPPER(:STUDYUID)) and '+
                                 ' ((UPPER(P_PID)<>UPPER(:P_PID)) OR (STUDIES_IMAGE_TYPE<>:STUDIES_IMAGE_TYPE))'; // ищем исследование
          ParamByName('STUDIES_IMAGE_TYPE').AsString := pImageType;
        end;
        ParamByName('STUDYUID').AsString := pStudyUID;
        ParamByName('P_PID').AsString := pPatientID;
        Open; First;
        Result := False; // not Eof ;
      finally
        Free;
      end;
    except
      on E : Exception do begin
        MnFl_ev('!!! ERROR !!! SELECT * FROM STUDIES WHERE STUDYUID = UPPER(:STUDYUID) and '+
                ' ((P_PID<>:P_PID) OR (STUDIES_IMAGE_TYPE<>:STUDIES_IMAGE_TYPE))  - '+
                E.Message, 'error.log' );
      end;
    end;  }

    Result := False;

  end;
label label1;
var vTmp : string; vSuccess : Boolean;
  procedure catlogCmnCreate ( pCurDir : string;
                              pNewDir : string;
                              pPartStr : string
                            );
  const cRzd = '--------------------------------------------------------------';
  var vCurDir : string;
  begin
    vCurDir := pCurDir;
    if ( Copy(vCurDir,Length(vCurDir),1)='\' )  then
      vCurDir := Copy(vCurDir, 0, Length(vCurDir)-1);
    Lg_ev(cRzd);
    if not DirectoryExists(vCurDir) then
    begin
      Lg_ev(' ');
      Lg_ev('ERROR - Ошибка открытия каталога '+ vCurDir);
    end else
    begin
      Lg_ev(' ');
      Lg_ev('#3 Переход в '+vCurDir+#13#10+
          ' Текущий каталог : '+GetCurrentDir);
      if not DirectoryExists(vCurDir+'\'+pNewDir) then
      begin
        if not CreateDir(vCurDir+'\'+pNewDir) then
        begin
          Lg_ev(' ');
          Lg_ev('ERROR - Ошибка создания каталога '+pPartStr+': '+vCurDir+'\'+pNewDir+#13#10+
                ' в каталоге '+vCurDir+#13#10+
              ' Текущий каталог : '+GetCurrentDir);
          vSuccess:=False;
        end else
        begin
          Lg_ev(' ');
          Lg_ev('Создан каталог '+pPartStr+': '+vCurDir+'\'+pNewDir+#13#10+
                ' в каталоге '+vCurDir+#13#10+
              ' Текущий каталог : '+GetCurrentDir);
        end;
      end;
      if not DirectoryExists(vCurDir+'\'+pNewDir) then
      begin
        Lg_ev(' ');
        Lg_ev('ERROR - Ошибка открытия каталога '+ vCurDir+'\'+pNewDir+#13#10+
              ' Текущий каталог : '+GetCurrentDir );
      end else
      begin
        Lg_ev(' ');
        Lg_ev('#8 Переход в '+vCurDir+'\'+pNewDir+#13#10+
              ' Текущий каталог : '+GetCurrentDir);
      end;
    end;
    Lg_ev(' ');
    Lg_ev(cRzd);
  end;
var vTmpStep, vModalities, vDirs1 : string;
  procedure pCrtDirs;
  begin
    if not DirectoryExists(vDirs1) then begin
      CreateDir(vDirs1);
      Lg_ev('CreateDir '+vDirs1);
    end;
  end;
  procedure pFrmDir( pSubDir : string );
  begin
    vDirs1 := sLogDir+'\'+pSubDir+'\';
              pCrtDirs;
              vDirs1 := vDirs1 + AClientThread.vAEtitle +'\';
              pCrtDirs;
              vDirs1 := vDirs1 + ImageType +'\';
              pCrtDirs;
              vDirs1 := vDirs1 + DateToStr(Date)+'\';
              pCrtDirs;
              vDirs1 := vDirs1 + IntToStr(HourOf(Now))+'\';
              pCrtDirs;
              v_errfilename := vDirs1+'error'+trim(IntToStr(GetTickCount))+'_txt.dcm';
              v_errfilename1 := vDirs1+'error'+trim(IntToStr(GetTickCount))+'.dcm';
              v_errfilename2 := vDirs1+'error'+trim(IntToStr(GetTickCount))+'_raw.dcm';
  end;
begin
  Lg_ev('Прием снимка #a1');
  IncConnections;
  Lg_ev('Прием снимка #a2');
  vModalities := gtModalities( AClientThread.vAEtitle );
  Lg_ev('Прием снимка #a3');
  try
    vTmpStep:='0';
    try
      try
        vTmp:='#0';
        Lg_ev('Прием снимка #a4');
        dcmTagIni;
        Lg_ev('Прием снимка #a5');
        dcmTagRead ( AClientThread );
        Lg_ev('Прием снимка #a6');
        vTmp:=vTmp+'#1';
        ImageType := ADataset.Attributes.GetString(v_FC_IMAGETYPE_1, v_FC_IMAGETYPE_2); // Модальность (CS Modality)
        if Trim(ImageType)='' then
        begin
          Lg_ev('!!! error empty MODALITY');
          ImageType:='CT'; // брать с аппарата !!!
        end;
        Lg_ev('Принят снимок : Модальность : ' + ImageType );
        if (Trim(ImageType)<>'PR') then
        try
          //
          //    StrToInt64('$'+EditHex.Text)
          if not assigned(ADataset.Attributes.Item[v_FC_PNAME_1, v_FC_PNAME_2]) then
          begin
            Lg_ev('!!! error empty FC_PNAME');
            pName:='ANONYMOUS';
            ADataset.Attributes.Add(v_FC_PNAME_1, v_FC_PNAME_2);
            ADataset.Attributes.Item[v_FC_PNAME_1, v_FC_PNAME_2].AsString[0] := pName;
          end else
            pName := TranslitRus ( gt_charset_value( ADataset.Attributes, ADataset.Attributes.GetString(v_FC_PNAME_1, v_FC_PNAME_2) ) ) ; // ФИО пациента (Patient Name)
          vTmp:=vTmp+'#2';
          if Trim(pName)='' then
            pName:='ANONYMOUS';
          if not assigned(ADataset.Attributes.Item[v_FC_STUDYID_1, v_FC_STUDYID_2]) then
          begin
            Lg_ev('!!! error empty StudyID');
            StudyID := IntToStr(gtNextNmbUID);
            ADataset.Attributes.Add(v_FC_STUDYID_1, v_FC_STUDYID_2);
            ADataset.Attributes.Item[v_FC_STUDYID_1, v_FC_STUDYID_2].AsString[0] := StudyID;
          end else
            StudyID := ADataset.Attributes.GetString(v_FC_STUDYID_1, v_FC_STUDYID_2); // ID исследования (StudyID)
          vTmp:=vTmp+'#3';
          if not assigned(ADataset.Attributes.Item[v_FC_PATIENTID_1, v_FC_PATIENTID_2]) then
          begin
            Lg_ev('!!! error NOT SET PatientID');
            PatientID := Copy(IntToStr(GetTickCount),1,20); // pName; // IntToStr(gtNextNmbUID);
            ADataset.Attributes.Add(v_FC_PATIENTID_1, v_FC_PATIENTID_2);
            ADataset.Attributes.Item[v_FC_PATIENTID_1, v_FC_PATIENTID_2].AsString[0] := PatientID;
          end else
            PatientID := ADataset.Attributes.GetString(v_FC_PATIENTID_1, v_FC_PATIENTID_2); // ID пациента (PatientID)

          vTmp:=vTmp+'#4';
          if Trim(PatientID)='' then
          begin
            Lg_ev('!!! error empty PatientID');
            PatientID:='EMPTY';
            ADataset.Attributes.Item[v_FC_PATIENTID_1, v_FC_PATIENTID_2].AsString[0] := PatientID;
          end;
          vTmp:=vTmp+'#5';
          if assigned(ADataset.Attributes.Item[v_FC_STUDYDESCRIPTION_1, v_FC_STUDYDESCRIPTION_2]) then
            StudyDescription := AnsiUpperCase( ADataset.Attributes.GetString(v_FC_STUDYDESCRIPTION_1, v_FC_STUDYDESCRIPTION_2) ); // Комментарий-описание к исследованию (Study Description)
          if not assigned(ADataset.Attributes.Item[v_FC_STUDYUID_1, v_FC_STUDYUID_2]) then
          begin
            Lg_ev('!!! error NOT SET StudyUID');
            StudyUID := gt_uniq_str;
            ADataset.Attributes.Add(v_FC_STUDYUID_1, v_FC_STUDYUID_2);
            ADataset.Attributes.Item[v_FC_STUDYUID_1, v_FC_STUDYUID_2].AsString[0] := StudyUID;
          end else
            StudyUID := ADataset.Attributes.GetString(v_FC_STUDYUID_1, v_FC_STUDYUID_2);
          vTmp:=vTmp+'#6';
          if Trim(StudyUID)='' then
          begin
            Lg_ev('!!! error empty StudyUID');
            StudyUID:=gt_uniq_str;
            while chkStudyUID(StudyUID) do StudyUID:=gt_uniq_str;
            ADataset.Attributes.Item[v_FC_STUDYUID_1, v_FC_STUDYUID_2].AsString[0] := StudyUID;
          end;
          vTmp:=vTmp+'#7';
          v_STUDYUID_OLD := StudyUID;
          if not assigned(ADataset.Attributes.Item[v_FC_INSTANCEUID_1, v_FC_INSTANCEUID_2]) then
          begin
            Lg_ev('');
            InstanceUID := gt_uniq_str;
            ADataset.Attributes.Add(v_FC_INSTANCEUID_1, v_FC_INSTANCEUID_2);
            ADataset.Attributes.Item[v_FC_INSTANCEUID_1, v_FC_INSTANCEUID_2].AsString[0] := InstanceUID;
          end else
            InstanceUID := ADataset.Attributes.GetString(v_FC_INSTANCEUID_1, v_FC_INSTANCEUID_2); // SOP Instanse UID
          vTmp:=vTmp+'#8';
          if Trim(InstanceUID)='' then
          begin
            Lg_ev('!!! error empty InstanceUID');
            InstanceUID:=gt_uniq_str;
            ADataset.Attributes.Item[v_FC_INSTANCEUID_1, v_FC_INSTANCEUID_2].AsString[0] := InstanceUID;
          end;
        //LogSave( #13+'StudyUID='+StudyUID+#13+'v_STUDYUID_OLD='+v_STUDYUID_OLD+#13 );

          vTmp:=vTmp+'#9';
          if v_isOracle then                     // ORACLE
          begin
          end else if v_isPostgres then begin    // Postgres
          end else begin                         // FireBird
            // ---------------------------------------------------------------------
            // Проверка дублирования STUDYUID с другим PatientID или другой Modality
            {  v_fnd := chkOtherStudyUID ( StudyUID, PatientID, ImageType );
              if v_fnd then begin
                vNextNmb:=IntToStr(gtNextNmbUID);
                InstanceUID:=InstanceUID+'_'+vNextNmb;
                StudyUID:=StudyUID+'_'+vNextNmb;
                ADataset.Attributes.Item[v_FC_INSTANCEUID_1, v_FC_INSTANCEUID_2].AsString[0] := InstanceUID;
                ADataset.Attributes.Item[v_FC_STUDYUID_1, v_FC_STUDYUID_2].AsString[0] := StudyUID;
              end;  }
            // ---------------------------------------------------------------------
          end;
        except
          on E:Exception do begin
            Lg_ev('!!! ERROR '+E.Message);
          end;
        end;
        if (Trim(ImageType)='PR') then
        begin
            Lg_ev('модальность PR не принимаем !!!');
            goto label1; // модальность PR не принимаем !!!
        end;
        vTmp:=vTmp+'#10';
        Lg_ev('Принят снимок с modality='+ImageType+'  :  vModalities='+vModalities);
        if ((Trim(ImageType)='') or ((vModalities<>'') and (Pos(Trim(ImageType),vModalities)<=0))) then
        begin
          try
            if ((vModalities<>'') and (Pos(Trim(ImageType),vModalities)<=0)) then
            begin
              pFrmDir('UNMOD');
              CmnMyDoQueryInsert('DicomLogit', 3, 'Модальность запрещена в конфигураторе для данного устройства', AClientThread );
            end else begin
              pFrmDir('ERROR');
              CmnMyDoQueryInsert('DicomLogit', 3, 'Модальность не задана (возможно надо запретить BIG ENDIAN на аппарате)', AClientThread );
            end;
            try if FileExists(v_errfilename) then DeleteFile(v_errfilename); except end;
            try if FileExists(v_errfilename1) then DeleteFile(v_errfilename1); except end;
            try if FileExists(v_errfilename2) then DeleteFile(v_errfilename2); except end;
            v_StringList := TStringList.Create;
            try
              try
                ADataset.Attributes.ListAttrinute('', v_StringList);
                try
                  ADataset.SaveAsRawFile(v_errfilename2);
                except
                  CmnMyDoQueryInsert('DicomLogit', 3, 'Ошибка сохранения Dataset в файл SaveAsRawFile '+v_errfilename1, AClientThread );
                end;
                try
                  ADataset.SaveToFile(v_errfilename1,True,ImplicitVRLittleEndian,100);  // ExplicitVRLittleEndian
                except
                  CmnMyDoQueryInsert('DicomLogit', 3, 'Ошибка сохранения Dataset в файл SaveToFile '+v_errfilename1, AClientThread );
                end;
                CmnMyDoQueryInsert('DicomLogit', 3, 'Чтение атрибутов из Dataset', AClientThread );
                v_StringList.SaveToFile(v_errfilename);
                CmnMyDoQueryInsert('DicomLogit', 3, 'Атрибуты сохранены в файл '+v_errfilename, AClientThread );
              except
                CmnMyDoQueryInsert('DicomLogit', 3, 'Ошибка записи в файл '+v_errfilename, AClientThread );
              end;
            finally
              v_StringList.Free;
            end;
          except
          end;
         { try
            if (ADataset.Attributes.ImageData=nil) and (ADataset.Attributes.WaveFormData=nil) then
            begin
              CmnMyDoQueryInsert('DicomLogit', 3, '1 ImageData/WaveFormData не задано', AClientThread );
              da_tmp := ADataset.Attributes.Item[ 0008,0005 ] ; // dicom charset
              CmnMyDoQueryInsert('DicomLogit', 3, '2 dicom charset ( 0008, 0005 ) GetCount = '+inttostr(da_tmp.GetCount), AClientThread );
              for I := 0 to da_tmp.GetCount - 1 do
              begin
                CmnMyDoQueryInsert('DicomLogit', 3, '3 Атрибуты : '+IntToStr(i)+'/'+IntToStr(da_tmp.GetCount), AClientThread );
                v_StringList := TStringList.Create;
                try
                  ADataset.Attributes.ListAttrinute('', v_StringList);
                  v_errfilename := DicomServer.sLogDir+'\'+'error'+trim(IntToStr(GetTickCount))+'_'+inttostr(i)+'.dcm';
                  try
                    da_tmp.Attributes[i].ListAttrinute('', v_StringList);
                  except
                    CmnMyDoQueryInsert('DicomLogit', 3, '4 Ошибка разбора атрибутов (i='+trim(IntToStr(i)), AClientThread );
                  end;
                  v_StringList.SaveToFile(v_errfilename);
                  CmnMyDoQueryInsert('DicomLogit', 3, '5 Атрибуты (i='+trim(IntToStr(i))+') сохранены в файл '+v_errfilename, AClientThread );
                finally
                  v_StringList.Free;
                end;
                if (da_tmp.Attributes[i].ImageData<>nil) or (da_tmp.Attributes[i].WaveFormData<>nil) then
                begin
                  CmnMyDoQueryInsert('DicomLogit', 3, '6 ImageData/WaveFormData найдено : i='+inttostr(i), AClientThread );
                end;
              end;
            end;
          except
          end; }
          AClientThread.Association.SendStatus(FAILURE);
          goto l1;
        end;
        vTmp:=vTmp+'#12';
        if assigned(ADataset.Attributes.Item[v_FC_ACCESSIONNUMBER_1, v_FC_ACCESSIONNUMBER_2]) then
          AccessionNumber := ADataset.Attributes.GetString(v_FC_ACCESSIONNUMBER_1, v_FC_ACCESSIONNUMBER_2); // Номер протокола исследования
        vLenTmp:=Length(Trim(AccessionNumber));
        if ( vIsGenerateAccessionNumber and
             ( (Trim(AccessionNumber)='') or
               (Trim(AccessionNumber)='0') or
               (vLenTmp<2)
             )
           )
        then
        begin
          AccessionNumber:= gtAccNMB(StudyUID);
          if AccessionNumber='' then
            AccessionNumber:=gt_uniq_AccNmb;
          if not assigned(ADataset.Attributes.Item[v_FC_ACCESSIONNUMBER_1, v_FC_ACCESSIONNUMBER_2]) then
            ADataset.Attributes.Add(v_FC_ACCESSIONNUMBER_1, v_FC_ACCESSIONNUMBER_2);
          ADataset.Attributes.Item[v_FC_ACCESSIONNUMBER_1, v_FC_ACCESSIONNUMBER_2].AsString[0] := AccessionNumber;
        end;
        vTmp:=vTmp+'#13';
        if assigned(ADataset.Attributes.Item[v_FC_DA_1, v_FC_DA_2]) then
        begin
          DA := ADataset.Attributes.Item[v_FC_DA_1, v_FC_DA_2]; // Дата исследования (Study Date)
          StudyDate := DA.AsDatetime[0];
          DA := ADataset.Attributes.Item[v_FC_DT_1, v_FC_DT_2]; // Время исследования (Study Time)
          if assigned(DA) then
            StudyDate := StudyDate + DA.AsDatetime[0];
          if Yearof(StudyDate)<=1900 then
          begin
            Lg_ev('!!! error empty StudyDate');
            StudyDate := Now;
            DA.AsDatetime[0] := StudyDate;
          end;
        end else
        begin
          Lg_ev('!!! error NOT SET StudyDate');
          try
            StudyDate := Now;
            DA := ADataset.Attributes.Add(v_FC_DA_1, v_FC_DA_2);
            DA.AsDatetime[0] := StudyDate;
          except
            StudyDate := Now;
          end;
        end;
          //
      //    StrToInt64('$'+EditHex.Text)
          //
       // StudyUID := ADataset.Attributes.GetString(v_FC_STUDYUID_1, v_FC_STUDYUID_2);  // Study Instance UID
        vTmp:=vTmp+'#14';
        try
          if assigned(ADataset.Attributes.Item[v_FC_SERIESUID_1, v_FC_SERIESUID_2]) then
            SeriesUID := ADataset.Attributes.GetString(v_FC_SERIESUID_1, v_FC_SERIESUID_2); // Series Instanse UID
          vTmp:=vTmp+'#14_1';
          if SeriesuID = '' then
            SeriesUID := ADataset.Attributes.GetString(v_FC_SERNUM_1, v_FC_SERNUM_2); // Series Number
        except
          SeriesUID := gt_uniq_str;
        end;
        vTmp:=vTmp+'#14_2';
        if SeriesUID='' then
        begin
          SeriesUID:= gt_uniq_str;
          ADataset.Attributes.Item[v_FC_SERIESUID_1, v_FC_SERIESUID_2].AsString[0] := SeriesUID;
        end;
        vTmp:=vTmp+'#14_3';
        try
          if assigned(ADataset.Attributes.Item[v_FC_PHYSNAME_1, v_FC_PHYSNAME_2]) then
            PhysName := gt_charset_value( ADataset.Attributes, ADataset.Attributes.GetString(v_FC_PHYSNAME_1, v_FC_PHYSNAME_2) ) ; // ФИО врача (Referring Physicians Name)
        except
          PhysName := '';
        end;
        vTmp:=vTmp+'#14_4';
        try
          if assigned(ADataset.Attributes.Item[v_FC_PDATEBORN_1, v_FC_PDATEBORN_2]) then
            pDateBorn := ADataset.Attributes.GetString(v_FC_PDATEBORN_1, v_FC_PDATEBORN_2); // Дата рождения пациента (Patient Birth Date)
        except
          pDateBorn:='01.01.1900';
        end;
        vTmp:=vTmp+'#14_5';
        try
          if assigned(ADataset.Attributes.Item[v_FC_PSEX_1, v_FC_PSEX_2]) then
            pSex := ADataset.Attributes.GetString(v_FC_PSEX_1, v_FC_PSEX_2); // Пол пациента (Patient Sex)
        except
          pSex := 'M';
        end;
        vTmp:=vTmp+'#14_6';
        if PatientID = '' then
          PatientID := 'Unknown';
        vTmp:=vTmp+'#14_7';
        try
          if assigned(ADataset.Attributes.Item[v_FC_AID_1, v_FC_AID_2]) then
            AID := ADataset.Attributes.GetString(v_FC_AID_1, v_FC_AID_2); // Instance Number
          vTmp:=vTmp+'#14_8';
          if aid = '' then
            AID := ADataset.Attributes.GetString(v_FC_ACQNUM_1, v_FC_ACQNUM_2); // Acquisition Number - что это ?
          vTmp:=vTmp+'#14_9';
          if aid = '' then
            aid := '1';
        except
          aid := '1';
        end;
        vTmp:=vTmp+'#14_10';
        Lg_ev('DicomServerDicomImage - AppendImage');
        // делаем запись в БД FireBird
        // KIN $2809, $001D - временный тег
        try
          if assigned(ADataset.Attributes.Item[v_FC_KIN_1, v_FC_KIN_2]) then
            v_Selected2 := ADataset.Attributes.getInteger(v_FC_KIN_1, v_FC_KIN_2) ;
        except
          v_Selected2 := 0;
        end;
       // if trim(StudyID)='' then StudyID:='1';
        if YearOf(StudyDate)<=1900 then StudyDate:=Now;
        ImageType1:=ImageType;
        CmnMyDoQueryInsert('DicomLogit', 4, 'Снимок подготовлен', AClientThread );
        vTmp:=vTmp+'#15';
        vTmpStep:=vTmpStep+'1';
        StudyDate := AppendImage( AClientThread,
                                 ADataset.Attributes,
                                 StudyID,
                                 PName,
                                 pDateBorn,
                                 PSex,
                                 PatientID,
                                 StudyDate,
                                 StudyUID,
                                 SeriesUID,
                                 InstanceUID,
                                 ImageType,
                                 AID,
                                 ImageType1,
                                 StudyDescription,
                                 PhysName,
                                 AccessionNumber,
                                 v_Selected2,
                                 v_STUDYUID_OLD );
        vTmpStep:=vTmpStep+'2';
      //    SetDir(sDir);
        Lg_ev('DicomServerDicomImage - inserted into DB');
        vCurDir := GetCurrentDir ;
        Lg_ev('#1 Текущий каталог vCurDir : '+vCurDir);
        try
          if not DirectoryExists( sDir ) then
            Lg_ev('ERROR - переход в хранилище dicom : sDir : '+sDir+
                  ' getLAstError='+inttostr(getLAstError)+
                  ' : '+SysUtils.SysErrorMessage(getLAstError) );
          Lg_ev('#2 Переход в хранилище dicom : sDir : '+sDir+' GetCurrentDir : '+GetCurrentDir);

          DecodeDate(StudyDate, y, m, d);
          vSuccess:=True;

          catlogCmnCreate ( sDir, ImageType1, 'ImageType1' );
          catlogCmnCreate ( sDir+'\'+ImageType1, IntToStr(y), 'IntToStr(y)' );
          catlogCmnCreate ( sDir+'\'+ImageType1+'\'+IntToStr(y), IntToStr(m), 'IntToStr(m)' );
          catlogCmnCreate ( sDir+'\'+ImageType1+'\'+IntToStr(y)+'\'+IntToStr(m), IntToStr(d), 'IntToStr(d)' );
          catlogCmnCreate ( sDir+'\'+ImageType1+'\'+IntToStr(y)+'\'+IntToStr(m)+'\'+IntToStr(d), StudyuID, 'StudyuID'  ); 
          catlogCmnCreate ( sDir+'\'+ImageType1+'\'+IntToStr(y)+'\'+IntToStr(m)+'\'+IntToStr(d)+'\'+StudyuID, SeriesUID, 'SeriesUID'  );

          ImageFileName := InstanceUID + '.dcm';
          vTmpStep:=vTmpStep+'3';
          if vSuccess then
          begin
            if ( Copy(sDir,Length(sDir),1)='\' )  then
              CurDir := sDir+ImageType1+'\'+IntToStr(y)+'\'+IntToStr(m)+'\'+IntToStr(d)+'\'+StudyuID+'\'+SeriesUID + '\' + ImageFileName
            else
              CurDir := sDir+'\'+ImageType1+'\'+IntToStr(y)+'\'+IntToStr(m)+'\'+IntToStr(d)+'\'+StudyuID+'\'+SeriesUID + '\' + ImageFileName;
          end else
          begin
            if ( Copy(sDir,Length(sDir),1)='\' )  then
              CurDir := sDir+ ImageFileName + IntToStr(GetTickCount)+IntToStr(DayOf(Now))+IntToStr(MonthOf(Now))+IntToStr(YearOf(Now))+IntToStr(HourOf(Now))
            else
              CurDir := sDir+'\'+ ImageFileName + IntToStr(GetTickCount)+IntToStr(DayOf(Now))+IntToStr(MonthOf(Now))+IntToStr(YearOf(Now))+IntToStr(HourOf(Now));
            Lg_ev('#8a ERROR set directory - CurDir = '+CurDir);
          end;
        //  Lg_ev('#9 DicomServerDicomImage - GetCurrentDir : '+GetCurrentDir);
          Lg_ev('#10 DicomServerDicomImage - before save ImageFileName='+CurDir);

          CmnMyDoQueryInsert('DicomLogit', 4, 'Снимок занесен в базу', AClientThread );

          vTmp:=vTmp+'#16';
          //сохраняем DICOM-файл на жесткий диск
          vTmpStep:=vTmpStep+'4';
          if (ADataset.Attributes.ImageData<>nil) then
          begin
            try
              vTmpStep:=vTmpStep+'5';
              Lg_ev('ADataset.Attributes.ImageData NOT nil file='+CurDir);
              ADataset.SaveToFile(CurDir, // FileName
                                  True,
                                  ADataset.Attributes.ImageData.ImageData[0].TransferSyntax, //8197, JPEGLossless
                                  100);  //Quality
              vTmpStep:=vTmpStep+'6';
            except
            on E:Exception do
              begin
                Lg_ev('ERROR - ошибка сохранения данных в файл '+CurDir+' : '+E.Message+ ' '+ADataset.vErrorSaveText);
                try
                  ADataset.SaveToFile(CurDir, // FileName
                                      True,
                                      JPEGLossless, //8197, JPEGLossless
                                      100);  //Quality
                except
                  on E:Exception do
                    Lg_ev('ERROR - ошибка сохранения данных JPEGLossless в файл '+CurDir+' : '+E.Message+ ' '+ADataset.vErrorSaveText);
                end;
              end;
            end;
            Lg_ev('#10a DicomServerDicomImage - saved : ImageData.TransferSyntax='+inttostr(ADataset.Attributes.ImageData.ImageData[0].TransferSyntax));
          end else
          begin
            try
              vTmpStep:=vTmpStep+'7';
              Lg_ev('!!! ERROR maybe - ADataset.Attributes.ImageData == nil file='+CurDir);
              ADataset.SaveToFile(CurDir, // FileName
                                  True,
                                  ImplicitVRLittleEndian,
                                  100);  //Quality
              vTmpStep:=vTmpStep+'8';
            except
            on E:Exception do
              begin
                Lg_ev('ERROR - ошибка сохранения данных в файл '+CurDir+' : '+E.Message+ ' '+ADataset.vErrorSaveText);
                try
                  ADataset.SaveToFile(CurDir, // FileName
                                      True,
                                      ImplicitVRLittleEndian, //8197, JPEGLossless
                                      100);  //Quality
                except
                  on E:Exception do
                    Lg_ev('ERROR - ошибка сохранения данных ImplicitVRLittleEndian в файл '+CurDir+' : '+E.Message+ ' '+ADataset.vErrorSaveText);
                end;
              end;
            end;
            Lg_ev( '#10b DicomServerDicomImage - saved : ImageData.TransferSyntax=ImplicitVRLittleEndian' );
          end;
          vTmpStep:=vTmpStep+'9';
          vTmp:=vTmp+'#17';
          Lg_ev( '#10c снимки сохранены в папке CurDir='+CurDir);
          // запись в лог
          v_SessionID := AClientThread.SessionID;
          AClientThread.OnTerminate := MyOnTerminate; // определяем разрыв соединения
          v_StudyDate:=DateToStr(StudyDate);
          v_Modality:=ADataset.Attributes.GetString(dModality);
          vTmp:=vTmp+'#18';
          vTmpStep:=vTmpStep+'_10_';
          chk_studyUID_img_sav_lst ( ADataset.Attributes.GetString(dTransactionUID),   // dTransactionUID
                                     StudyUID,
                                     AClientThread.Association.Request.CallingTitle ,
                                     'Обработка события сервера DicomImage'+#13+
                                     'Transactionuid='+ADataset.Attributes.GetString(dTransactionUID)+#13+
                                     'CallingTitle='+AClientThread.Association.Request.CallingTitle,
                                     v_SessionID,
                                     'Дата исследования '+v_StudyDate+' '+#13+
                                     'Данные пациента:'+#13+
                                     'CS Modality '+v_Modality+#13+
                                     'PatientID: '+PatientID+#13+
                                     'Patient Name: '+PName+#13+
                                     'Patient Sex: '+pSex,
                                     ADataset.Attributes.GetString(dSOPInstanceUID),
                                     CurDir,
                                     ImageType,
                                     StudyDate,
                                     PatientID,
                                     PName,
                                     TranslitEng(PName),
                                     AccessionNumber
                                    );
          vTmpStep:=vTmpStep+'_11_';
        finally
          SetCurrentDir( vCurDir );
          Lg_ev('#11 Вернулись в каталог vCurDir : '+vCurDir+' : getcurdir : '+GetCurrentDir);
        end;
        vTmp:=vTmp+'#19';
        // сообщим клиенту что все ОК
    label1:
        AClientThread.Association.SendStatus(0);
      l1:
        // процедура пересылки (по таблице маршрутизации)
      //  DoForward( AClientThread, ADataset, v_StudyDate );
      //  Lg_ev('DicomServerDicomImage - end check forvard');
        // запись в лог
        vTmp:=vTmp+'#20';
        vTmpStep:=vTmpStep+'_12_';
      finally
        ADataset.Attributes.Clear;
        ADataset.Free;
      end;
    except
    on E:Exception do
      begin
        CmnMyDoQueryInsert('DicomLogit', 3, 'Ошибка '+vTmp+' : '+E.Message, AClientThread );
        Lg_ev('#4 ERROR : '+vTmp+' : '+E.Message);
      end;
    end;
    if Pos('_12_',vTmpStep)<=0 then
      Lg_ev('#5 ERROR : '+vTmpStep );
  finally
    DecConnections;
  end;
end;

procedure TDicomServer.DicomServerDicomLogit(AClientThread: TDicomClientThread; AIP, Msg: string);
var status:TMemoryStatus;
begin
  Status.dwLength := sizeof(TMemoryStatus);
  GlobalMemoryStatus(Status);

  Lg_ev('DicomServerDicomLogit '+#13+' AIP: '+AIP+#13+' Messsage: '+Msg);

  CmnMyDoQueryInsert('DicomLogit',
                3,
                'Обработка события сервера DicomLogit'+#13+
                'AIP: '+AIP+#13+
                'Msg: '+Msg+#13+
                'Free Ram: ' + IntToStr(Status.dwAvailPhys div 1024417) + 'm',
                AClientThread );
end;

procedure TDicomServer.DicomServerGetCMoveLocalPort(
  AClientThread: TDicomClientThread; AET: string; var AHost: string;
  var APort: Integer);
var v_port:string;
begin
  try
    Lg_ev('try to find dicom device in list');
    if gt_device_params ( AET,
                          '', // p_IP_AE   : string;
                          AClientThread,
                          AHost,
                          v_port
                        )
    then begin
      APort:=MyStrToInt(v_port);
      Lg_ev('Command C_MOVE to '+AET+' will send to ip='+AHost+' port='+inttostr(APort));
      if v_1_7_IS_LOG_WRITE then
        CmnMyDoQueryInsert ( 'DicomServerGetCMoveLocalPort', 4,
              'Command C_MOVE to '+AET+' will send to ip='+AHost+' port='+inttostr(APort),
                AClientThread
            );
    end else begin
      Lg_ev('ERROR - NOT FOUND DEVICE in table DEVICES AET='''+AET+'''' );
      CmnMyDoQueryInsert ( 'error DicomServerGetCMoveLocalPort', 3,
          'ERROR - NOT FOUND DEVICE in table DEVICES AET='''+AET+'''',
                AClientThread
        );
    end;
  except
  on e:Exception do
    begin
      Lg_ev('error in gt_device_params: '+e.Message);
    end;
  end;
end;

procedure TDicomServer.DicomServerNormalisedReceived(
  AClientThread: TDicomClientThread; AAddress: string;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
var v_Lines, v_Lines1 : TStringList;
    rq: TDicomAttributes;
begin
  try
    v_Lines := TStringList.Create;
    v_Lines1 := TStringList.Create;
    ACommand.ListAttrinute('receive Command:', v_Lines);
    rq := TDicomAttributes(ARequestDatasets[0]);
    rq.ListAttrinute('Receive Data;', v_Lines1);
    CmnMyDoQueryInsert ( 'DicomServerNormalisedReceived', 4, v_Lines.Text+#13+v_Lines1.Text,
                AClientThread );
    Lg_ev('DicomServerNormalisedReceived '+#13+v_Lines.Text+#13+v_Lines1.Text);
    ds_sav(ACommand, ARequestDatasets, AResponseDatasets);
  finally
    FreeAndNil(v_Lines);
    FreeAndNil(v_Lines1);
  end;
end;

procedure TDicomServer.DicomServerNormalisedReceivedNAction(
  AClientThread: TDicomClientThread; AAddress: string;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
type
 TSOPInstance = record
    SOPClassUID      : string[250];
    SOPInstanceUID   : string[250];
end;
var
  AffectedSOPInstanceUID,
  v_SOPClassUID,
  v_SOPInstanceUID : string;
  EventTypeID, i: Integer;
  das1, rq, {das2,} das3{, das4}: TDicomAttributes;
  da1, da2, da3: TDicomAttribute;
  v_log_str{, v_log_str_tmp} : AnsiString;
  v_Lines, v_Lines1{, v_Lines2} : TStringList;
  rq1: TDicomAttributes;
  v_arr_SOPsuccess, v_arr_SOPfailed : array of TSOPInstance;
  v_len_success, v_len_failed, v_i_arr : integer;
  //
  procedure p_addSOPInstances(const p_SOPClassUID:AnsiString; const p_SOPInstanceUID:AnsiString; const p_da3: TDicomAttribute);
  var das4:TDicomAttributes;
  begin
    try
      das4 := TDicomAttributes.Create;
      das4.AddVariant($0008, $1150, p_SOPClassUID);
      das4.AddVariant($0008, $1155, p_SOPInstanceUID);
      p_da3.AddData(das4);
    except
      on E:Exception do Lg_ev('ERROR 1 '+E.Message);
    end;
  end;
  //
begin
  IncConnections;
  try
    try
      v_Lines := TStringList.Create;
      v_Lines1 := TStringList.Create;
      ACommand.ListAttrinute('receive Command:', v_Lines);
      rq1 := TDicomAttributes(ARequestDatasets[0]);
      rq1.ListAttrinute('Receive Data;', v_Lines1);
      //
      CmnMyDoQueryInsert ( 'DicomServerNormalisedReceivedNAction', 4, v_Lines.Text+#13+v_Lines1.Text,
                  AClientThread );
      Lg_ev('DicomServerNormalisedReceivedNAction '+#13+v_Lines.Text+#13+v_Lines1.Text);
      //
      ds_sav(ACommand, ARequestDatasets, AResponseDatasets);
    finally
      FreeAndNil(v_Lines);
      FreeAndNil(v_Lines1);
    end;
    //
    v_log_str:='';
    EventTypeID := ACommand.getInteger(0, $1008);
    AffectedSOPInstanceUID := ACommand.GetString(0, $1001);
    if UIDS.Items[AffectedSOPInstanceUID].Constant <> StorageCommitmentPushModelModelSOPInstance then
    begin //send status $112  No such Object Instance
      AClientThread.Association.ReturnStatus := $112;
      v_log_str:=v_log_str+#13+'No such Object Instance ' + AffectedSOPInstanceUID +
        '(AffectedSOPInstanceUID<>StorageCommitmentPushModelModelSOPInstance),' +
        UIDS.Items[AffectedSOPInstanceUID].AsLongString;
    end
    else
    if EventTypeID <> 1 then
    begin //send status $123  No such Action Type
      AClientThread.Association.ReturnStatus := $123;
      v_log_str:=v_log_str+#13+'No such Action Type : EventTypeID='+inttostr(EventTypeID)+' ';
    end
    else
    begin //send status 0
      v_log_str:=v_log_str+#13+'start thread or timer to send N_EVENR_REPORT';
      if ARequestDatasets.Count > 0 then
      begin
        das1 := TDicomAttributes(ARequestDatasets[0]);
        rq := CopyAttributes(das1);
        rq.AddVariant($8, $54, AClientThread.Association.Request.CalledTitle);
        //send rq to  AClientThread.Association.Request.CallingTitle
        v_log_str:=v_log_str+#13+' callingAET '+AClientThread.Association.Request.CallingTitle;
        //
        // Проверка что изображения существуют
        // и формирование списка атрибутов для ответа
          da1 := das1.Item[$0008, $1199];
          try
            v_len_success:=0; v_len_failed:=0;
            if assigned(da1) then
            begin
              for i := 0 to da1.GetCount - 1 do
              begin
                das3:=da1.Attributes[i];
                v_SOPClassUID    := das3.GetString($0008, $1150);
                v_SOPInstanceUID := das3.GetString($0008, $1155);
                Lg_ev('N_EVENT : v_SOPClassUID='+v_SOPClassUID+#13+' v_SOPInstanceUID='+v_SOPInstanceUID);
                if f_chk_instance ( v_SOPClassUID,
                                    v_SOPInstanceUID,
                                    AClientThread,
                                    sDir)<>''
                then
                begin // succeeded instances
                  Inc(v_len_success);
                  SetLength(v_arr_SOPsuccess,v_len_success);
                  v_arr_SOPsuccess[v_len_success-1].SOPClassUID    := v_SOPClassUID;
                  v_arr_SOPsuccess[v_len_success-1].SOPInstanceUID := v_SOPInstanceUID;
                  //
                  if v_1_7_IS_LOG_WRITE then
                    CmnMyDoQueryInsert ( 'событие N_ACTION', 4, 'FIND v_SOPClassUID='+v_SOPClassUID+#13+' v_SOPInstanceUID='+v_SOPInstanceUID,
                       AClientThread );
                end
                else  // failed instances
                begin
                  Inc(v_len_failed);
                  SetLength(v_arr_SOPfailed,v_len_failed);
                  v_arr_SOPfailed[v_len_failed-1].SOPClassUID    := v_SOPClassUID;
                  v_arr_SOPfailed[v_len_failed-1].SOPInstanceUID := v_SOPInstanceUID;
                  // 0008,1197 Failure Reason
                  //
                  if v_1_7_IS_LOG_WRITE then
                    CmnMyDoQueryInsert ( 'событие N_ACTION', 4, 'NOT FIND v_SOPClassUID='+v_SOPClassUID+#13+' v_SOPInstanceUID='+v_SOPInstanceUID,
                        AClientThread );
                end;
              end;
            end;
            rq.Remove($0008, $1198); // clear list of failed instances
            rq.Remove($0008, $1199); // clear list of succeded instances
            // сформируем списки для ответа
            // цикл по failed instances
            if v_len_failed>0
            then
            begin
              da2 := rq.Add($0008, $1198); // list of failed instances
              for v_i_arr := 0 to v_len_failed - 1
              do begin
                p_addSOPInstances(v_arr_SOPfailed[v_i_arr].SOPClassUID, v_arr_SOPfailed[v_i_arr].SOPInstanceUID, da2);
              end;
            end;
            // цикл по succeeded instances
            if v_len_success>0
            then
            begin
              da3 := rq.Add($0008, $1199); // list of succeded instances
              for v_i_arr := 0 to v_len_success - 1
              do begin
                p_addSOPInstances(v_arr_SOPsuccess[v_i_arr].SOPClassUID, v_arr_SOPsuccess[v_i_arr].SOPInstanceUID, da3);
              end;
            end;
          finally
            SetLength(v_arr_SOPsuccess,0); // v_len_success:=0;
            SetLength(v_arr_SOPfailed,0);  // v_len_failed:=0;
          end;
        if f_Storage_commitment_resp (  rq,
                                        AClientThread.Association.Request.CalledTitle,
                                        AClientThread.Association.Request.CallingTitle,
                                        DB_CMN.DB,
                                        DB_CMN.trRead
                                      )
        then begin
          v_log_str:='Storage_commitment_response success';
          CmnMyDoQueryInsert ( 'DicomServerNormalisedReceivedNAction', 4,v_log_str,
                  AClientThread );
          Lg_ev('DicomServerNormalisedReceivedNAction '+#13+v_log_str);
        end else begin
          v_log_str:='ERROR send Storage_commitment_response';
          CmnMyDoQueryInsert ( 'ERROR DicomServerNormalisedReceivedNAction', 3,v_log_str,
                  AClientThread );
          Lg_ev('DicomServerNormalisedReceivedNAction '+#13+v_log_str);
        end;
      end;
    end;
  finally
    DecConnections;
  end;
end;

procedure TDicomServer.ExecSQL(asql: string);
var
  d1: TQuery;
begin
  d1 := TQuery.Create(nil);
  try
    d1.DatabaseName := 'CNSPACS';
    d1.SQL.Text := asql;
    try
      d1.ExecSQL;
    except
      on E : Exception do
        Lg_ev('error TDicomServer.ExecSQL : '+E.ClassName+
            ' with message : '+E.Message+' SQL:'+d1.SQL.Text);
    end;
  finally
    d1.Free;
//    d1 := nil; // Prihodko N.
  end;
end;

function TDicomServer.GetAge(AD1, AD2: TDatetime): string;
var y, m, d, y1, m1, d1: word;
begin
  DecodeDate(ad1, y, m, d);
  DecodeDate(ad2, y1, m1, d1);
  Result := Format('%3dY', [(y1 - y)]);
  for d := 1 to 3 do
    if Result[d] = ' ' then
      Result[d] := '0'
end;

function TDicomServer.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

{procedure TDicomServer.MyDisconnectAssociation(const p_CnsDicomConnection: TCnsDicomConnection);
begin
  p_CnsDicomConnection.Association.Clear;
  p_CnsDicomConnection.Disconnect;
  Application.ProcessMessages;
end;  }

procedure TDicomServer.ServiceCreate(Sender: TObject);
  function GetMyVersion:string;
  type
    TVerInfo=packed record
      Nevazhno: array[0..47] of byte; // ненужные нам 48 байт
      Minor,Major,Build,Release: word; // а тут версия
    end;
  var
    s:TResourceStream;
    v:TVerInfo;
  begin
    result:='';
    try
      s:=TResourceStream.Create(HInstance,'#1',RT_VERSION); // достаём ресурс
      if s.Size>0 then begin
        s.Read(v,SizeOf(v)); // читаем нужные нам байты
        result:=IntToStr(v.Major)+'.'+IntToStr(v.Minor)+'.'+ // вот и версия...
                IntToStr(v.Release)+'.'+IntToStr(v.Build);
      end;
    s.Free;
    except; end;
  end;
begin
  Log_ins(DateTimeToStr(Now)+'#0 Start DICOM PACS');
  Log_ins('Copyright '+#169+' 2003 - '+inttostr(Yearof(Date))+' Medotrade');   // &copy; 	&#169; 	© 	знак copyright
  Log_ins('Версия '+GetMyVersion);
end;

procedure TDicomServer.ServiceDestroy(Sender: TObject);
begin
  Lg_ev('ServiceStop');
  TimerAuotLoadDir.Enabled := False;
  tmClrLOG.Enabled := False;
  if v_isOracle then     // ORACLE
  begin
    OraFree(OraConn);
  end else if v_isPostgres then
  begin
    PgFree ( PGconn, MnUniTransaction );
  end else
  begin
    p_free_conn_fb ( DB_CMN.DB ,
                     DB_CMN.trWrite ,
                     DB_CMN.trRead
                    );
    p_free_conn_fb ( DB_CMN.WLDB ,
                     DB_CMN.WLtrWrite ,
                     DB_CMN.WLtrRead
                    );
    p_free_conn_fb ( DB_CMN.LOGDB ,
                     DB_CMN.LOGtrWrite ,
                     DB_CMN.LOGtrRead
                    );
  end;
end;

procedure TDicomServer.ServiceExecute(Sender: TService);
var Ini : TIniFile;
    v_str_tmp , vIniFileName,
    vDirTmps  :AnsiString;
    vIsTmpLog : Boolean;
{  function MyReadString( p_Section, p_Ident, p_Default : string ) : string;
  begin
    Result := Ini.ReadString(  p_Section, p_Ident, p_Default ) ;
    Ini.WriteString(p_Section, p_Ident, Result);
  end;   }
//var v_size : Int64;
begin
  vDateTimeLastCheck:=Now;
  vAmmConnections:=0;
  vUseSync:=False;
  vIsTmpLog:=True;
  v_ds_i:=0;
  v_cur_tick:=0;
  Log_ins(DateTimeToStr(Now)+'#1 Start DICOM PACS');
  if cDebug then  
    sleep(20000);  // !!! нужно для дебага, запускаем сервис в службах, потом лезем в проект и делаем attach
  SetCurrentDir( ExtractFilePath(Application.ExeName) );
//  v_size := Trunc( GetFreeDiskSize/(1024 * 1024 * 1024) ) ; // GB

  Log_ins('Start service');
  v_str_tmp:='Start service';
//-- 1. Поднимаем настройки
  Log_ins(DateTimeToStr(Now)+'#2');
    vIniFileName := ExtractFilePath(paramstr(0))+c_ini_file;
    Ini := TIniFile.Create(vIniFileName);
      try
        vIsGenerateAccessionNumber := ( Ini.ReadString( c_1_razdel, c_1_13_AutoGenAccNmb, '0' ) = '1' );
        try
          if vIsGenerateAccessionNumber then
            Ini.WriteString( c_1_razdel, c_1_13_AutoGenAccNmb, '1' )
          else
            Ini.WriteString( c_1_razdel, c_1_13_AutoGenAccNmb, '0' );
        except
        end;
        v_1_10_autoload_folder := Ini.ReadString( c_1_razdel, c_1_10_autoload_folder, '' );
        v_1_11_autoload_timeout := Ini.ReadString( c_1_razdel, c_1_11_autoload_timeout, '' );

      {  vAccNmbInPatientID  := ( Ini.ReadString( c_1_razdel, c_1_14_AccNmbInPatientID, '0' ) = '1' );
        if vAccNmbInPatientID then
          Ini.WriteString( c_1_razdel, c_1_14_AccNmbInPatientID, '1' )
        else
          Ini.WriteString( c_1_razdel, c_1_14_AccNmbInPatientID, '0' ); }

        sLogDir := Ini.ReadString(c_1_razdel, c_LOG_FOLDER, ExtractFilePath(Application.ExeName) );
        if sLogDir[Length(sLogDir)-1] in ['\','/'] then
          sLogDir := Copy(sLogDir,0,Length(sLogDir)-1);
        if not DirectoryExists(sLogDir) then
        begin
          // Log_ins('Не существует каталог протоколирования '+sLogDir+' - установлен текущий каталог пакса');
          vIsTmpLog:=False;
        end else
        begin
          DCM_log.vLogDir:=sLogDir;
          if not DirectoryExists(sLogDir+'\'+c_pk_log) then
          begin
            vDirTmps:=GetCurrentDir;
            try
              SetCurrentDir(sLogDir);
              CreateDir(c_pk_log);
              if not DirectoryExists(sLogDir+'\'+c_pk_log) then
                vIsTmpLog:=False;
            finally
              SetCurrentDir(vDirTmps);
            end;
          end;
        end;

        v_ip_fb := Ini.ReadString( c_1_razdel, c_1_1_IP_FB,'' );
        nPort := Ini.ReadInteger(c_1_razdel, c_1_4_SERVER_PORT, 104);
        sDir := Ini.ReadString(c_1_razdel, c_1_3_STORAGE_FOLDER, ExtractFilePath(Application.ExeName) );
        if not DirectoryExists(sDir) then
          Log_ins('Не существует каталог с исследованиями (файлами *.dcm) '+sDir);
        sDirRemote := Ini.ReadString('PACS', 'DIRREMOTESTORAGE', '');
        // чтение параметров соединения с БД
        cmn_db_params_read(Ini);
        // AETitle сервиса
        v_AE_TITLE := Ini.ReadString( c_1_razdel, c_1_5_AE_TITLE, '' );
        //
        v_LocAE := Ini.ReadString( 'DICOM', 'LocalAE', 'TEST1' );
        if Trim(v_LocAE)='' then v_LocAE:='TEST1';
        Ini.WriteString( 'DICOM', 'LocalAE', v_LocAE);
        v_LocPort := ini.ReadInteger( 'DICOM', 'LocalPort', 104 );
        if v_LocPort=0 then v_LocPort:=104;        
        ini.WriteInteger( 'DICOM', 'LocalPort', v_LocPort);
        //
        // признак проверки наличия устройства в списке устройств
        v_IS_DEVICES_CHECK := ( Ini.ReadString( c_1_razdel, c_1_6_IS_DEVICES_CHECK, '0' ) = '1' );
        // признак записи в протокол
        if vIsTmpLog then
        begin
          v_1_7_IS_LOG_WRITE := ( ( Ini.ReadString( c_1_razdel, c_1_7_IS_LOG_WRITE, '0' ) = '1' )  ) ;
          v_1_7_DB_LOG_WRITE := ( ( Ini.ReadString( c_1_razdel, c_1_7_DB_LOG_WRITE, '0' ) = '1' )  ) ;
          v_1_7_DCM_NET_LOG_WRITE := ( ( Ini.ReadString( c_1_razdel, c_1_7_DCM_NET_LOG_WRITE, '0' ) = '1' )  ) ;
        end else
        begin
          v_1_7_IS_LOG_WRITE := False;
          v_1_7_DB_LOG_WRITE := False;
          v_1_7_DCM_NET_LOG_WRITE := False;
        end;
        v_1_7_ANinPID := ( ( Ini.ReadString( c_1_razdel, c_1_7_ANinPID, '0' ) = '1' )  ) ;
        //
        v_crt_log:=v_1_7_IS_LOG_WRITE;   // в классе TDicomServerCore
        DCM_log.vIsLog := v_crt_log;
        v_is_conn_log := v_1_7_IS_LOG_WRITE and v_1_7_DCM_NET_LOG_WRITE;
        if v_crt_log then
          Log_ins('v_crt_log == TRUE');
        // Проверять AETitle сервера при приеме сообщений
        v_1_8_IS_CHK_AETITLE  := ( Ini.ReadString( c_1_razdel, c_1_8_IS_CHK_AETITLE, '0' ) = '1' ) ;
        // параметры пересылки по HL7 в Р-МИС
        v_chk_snd_HL7 := ( Ini.ReadString(  c_3_razdel, 'уведомлять Р-МИС (1/0)', '0' ) = '1' ) ;
        v_ip_hl7      :=   Ini.ReadString(  c_3_razdel, 'IP', '' );
        v_port_hl7    :=   Ini.ReadInteger( c_3_razdel, 'PORT', 0 );
        //
        // WORKLIST
        v_teIPWORKLIST := Ini.ReadString( c_4_razdel, c_4_1_IP_Worklist, 'localhost' ) ;
        v_PortWORKLIST := Ini.ReadString( c_4_razdel, c_4_2_PORT_Worklist, '1112' ) ;
        v_AEWORKLIST   := Ini.ReadString( c_4_razdel, c_4_3_AETITLE_Worklist, 'WLSERVER' ) ;

        v_CheckAEWorklist := ( Ini.ReadString( c_1_razdel, c_4_4_CheckAE_Worklist, '0' ) = '1' ) ;
        v_LOGWorklist     := ( Ini.ReadString( c_1_razdel, c_4_5_LOGWorklist, '0' ) = '1' ) ;

        v_MPPS := ( Ini.ReadString( c_4_razdel, c_4_5_MPPS, '0' ) = '1' );

        v_cbAutoBackup := (Ini.ReadInteger( c_10_razdel, c_10_AutoBackup, 0 )=1);
        v_cbPACS       := (Ini.ReadInteger( c_10_razdel, c_10_PACS, 0 )=1);
        v_cbWORKLIST   := (Ini.ReadInteger( c_10_razdel, c_10_WORKLIST, 0 )=1);
        v_cbWADO       := (Ini.ReadInteger( c_10_razdel, c_10_WADO, 0 )=1);
        v_teCatalogDbBackup  := Ini.ReadString( c_10_razdel, c_10_CatalogDbBackup,         '' );
        v_teHourDbBackup     := Ini.ReadString( c_10_razdel, c_10_HourDbBackup,         '' );
        v_teMinuteDbBackup   := Ini.ReadString( c_10_razdel, c_10_MinuteDbBackup,         '' );

        try
          Ini.WriteString( c_4_razdel, c_4_1_IP_Worklist, v_teIPWORKLIST ) ;
          Ini.WriteString( c_4_razdel, c_4_2_PORT_Worklist, v_PortWORKLIST ) ;
          Ini.WriteString( c_4_razdel, c_4_3_AETITLE_Worklist, v_AEWORKLIST ) ;
          if v_CheckAEWorklist then
            Ini.WriteString( c_1_razdel, c_4_4_CheckAE_Worklist, '1' )
          else
            Ini.WriteString( c_1_razdel, c_4_4_CheckAE_Worklist, '0' );
          if v_LOGWorklist then
            Ini.WriteString( c_1_razdel, c_4_5_LOGWorklist, '1' )
          else
            Ini.WriteString( c_1_razdel, c_4_5_LOGWorklist, '0' );
          if v_MPPS then
            Ini.WriteString( c_4_razdel, c_4_5_MPPS, '1' )
          else
            Ini.WriteString( c_4_razdel, c_4_5_MPPS, '0' );
        except
        end;

        //
        v_is_add_tags :=   (Ini.ReadInteger( c_1_razdel, c_1_12_private_tags, 0 )=1);
        v_private_tags := v_is_add_tags;

      finally
        Ini.Free;
      end;
  Log_ins(DateTimeToStr(Now)+'#3');
    Log_ins('Read settings');
//-- 2. Создаем и коннектимся к БД
    Log_ins('Start connect database');
    //DB := TFIBDatabase.Create(nil);
    if Trim(v_ip_fb)='' then
    begin
      Log_ins('Не задан IP адрес SQL сервера Firebird в файле '+ExtractFilePath(paramstr(0))+c_ini_file);
      Exit;
    end;

    Log_ins(' Start connect database');
    if v_isOracle then     // ORACLE
    begin
      DB_CMN.OraConn := DB_CMN.OraConnCrt ;
    end else if v_isPostgres then
    begin
      DB_CMN.PGconn := DB_CMN.PgConnCrt;
    end else
    begin
      DB_CMN.DB := f_fb_db_crt(v_ip_fb+':'+c_alias);
      DB_CMN.trRead:= f_FbReadTransactCreate( DB_CMN.DB );
      DB_CMN.trWrite:= f_FbWriteTransactCreate( DB_CMN.DB );

      DB_CMN.WLDB := f_fb_db_crt(v_ip_fb+':'+c_wlalias);
      DB_CMN.WLtrRead:= f_FbReadTransactCreate( DB_CMN.WLDB );
      DB_CMN.WLtrWrite:= f_FbWriteTransactCreate( DB_CMN.WLDB );

      DB_CMN.LOGDB := f_fb_db_crt(v_ip_fb+':'+c_logalias);
      DB_CMN.LOGtrRead:= f_FbReadTransactCreate( DB_CMN.LOGDB );
      DB_CMN.LOGtrWrite:= f_FbWriteTransactCreate( DB_CMN.LOGDB );
    end;
    Log_ins(' End connect database');

//-- 3. Создаем и активизируем транзакции (аналог сессии)
    Log_ins(' Start create transaction');
    if v_isOracle then     // ORACLE
    begin
      // для оракла здесь ничего не делаем
    end else if v_isPostgres then
    begin
      DB_CMN.MnUniTransaction := PGTransCreate (DB_CMN.PGconn) ;
    end else
    begin
      try
        DB_CMN.trRead.StartTransaction;
        DB_CMN.trWrite.StartTransaction;
        DB_CMN.LOGtrRead.StartTransaction;
        DB_CMN.LOGtrWrite.StartTransaction;
      except
        on e:Exception do
          begin
            Log_ins(e.Message);
            Exit;
          end;
      end;
    end;
    Log_ins(' End create transaction');
//-- 4. Записываем лог
    // каталог для хранения временных файлов при установлении соединения
    DCM_Connection.PDUTempPath:=GetTempDirectory;
    Log_ins('Start server PDUTempPath='+DCM_Connection.PDUTempPath);
    CmnMyDoQueryInsert('Старт сервера',1,v_str_tmp+#13+'PDUTempPath='+DCM_Connection.PDUTempPath );
    CmnMyDoQueryInsert('Подключение к Базе Данных...', 1, ' Подключение к БД прошло успешно!' );
    Log_ins(DateTimeToStr(Now)+' Подключение к БД прошло успешно! ALIAS=PACSBASE');
    CmnMyDoQueryInsert('Start transaction',1,'Start transaction' );
//-- 6. Стартуем автопроверку каталога для загрузки
    if Trim(v_1_10_autoload_folder)<>'' then
    begin
      if Copy(v_1_10_autoload_folder,Length(v_1_10_autoload_folder),1)<>'\' then
        v_1_10_autoload_folder:=v_1_10_autoload_folder+'\';
      if v_1_11_autoload_timeout='' then v_1_11_autoload_timeout:=IntToStr(5); // время в минутах
      try
        TimerAuotLoadDir.Interval := StrToInt(Trim( v_1_11_autoload_timeout ))*1000;
      except
        TimerAuotLoadDir.Interval := 1000*2; // 60*5;
      end;
      TimerAuotLoadDir.Enabled := True;
    end;
    tmClrLOG.Interval := 1000*60*55; // каждые 55 минут
    tmClrLOG.Enabled := True;
    v_day_clr_log:=Date;
//-- 5. Стартуем сервер
    DicomServer.ServerPort := nPort;
    try
      DicomServer.Start;
    except
      on e:Exception do
        begin
          Lg_ev('error DicomServer.Start error: '+E.ClassName+' with message : '+E.Message);
          CmnMyDoQueryInsert('error DicomServer.Start', 3,
              'error: '+E.ClassName+' with message : '+E.Message );
          Exit;
        end;
    end;
    Log_ins('End start server');
    Log_ins('End start service');
  while not terminated do
  begin
    Lg_ev('#line 5164 before ServiceThread.ProcessRequests ',paramstr(0)+'thread.log');
    ServiceThread.ProcessRequests(true);
    Lg_ev('#line 5166 after ServiceThread.ProcessRequests ',paramstr(0)+'thread.log');
  end;
end;

procedure TDicomServer.ServicePause(Sender: TService; var Paused: Boolean);
begin
  Lg_ev('!!!ERROR!!! ServicePause');
end;

procedure TDicomServer.ServiceShutdown(Sender: TService);
begin
  Lg_ev('ServiceShutdown');
end;

procedure TDicomServer.SumitSQL(AClientThread: TDicomClientThread; ADBStr,
  ASQL: string; AFetchCount: Integer; UseMultiDatabase: Boolean;
  Params: TDicomAttribute; var AResult: TDataSet);
var dsSel: TpFIBDataSet; v_UniQr: TUniQuery; v_ORADS : TOracleDataSet;
begin
  if DB_CMN.v_isOracle then     // ORACLE
  begin  //
    v_ORADS := TOracleDataSet.Create(nil);

      if AClientThread=nil then begin
        v_ORADS.Session:=DB_CMN.ORAconn;
      end else begin
        v_ORADS.Session:=AClientThread.ORAconn;
      end;
      if v_1_7_IS_LOG_WRITE then
      begin
        CmnMyDoQueryInsert ( 'событие SumitSQL', 4, 'Execute sql query : '+ASQL,
                    AClientThread );
        Lg_ev('Execute sql auery : '+ASQL);
      end;
      //
      try
        v_ORADS.SQL.Text := ASQL ;
        v_ORADS.Open;
      except
        on e: Exception do
          begin
            Log_ins('FailToOpenQuery' + e.Message + '/' + e.ClassName + ':' + ASQL);
            CmnMyDoQueryInsert('Ошибка! Не удалось выполнить запрос!',
                          3,
                          'FailToOpenQuery' + e.Message + '/' + e.ClassName + ':' + ASQL,
                    AClientThread );
            v_ORADS.Close;
            FreeAndNil(v_ORADS);
        //  raise;
        end;
      end;
    AResult := v_ORADS;
  end else if DB_CMN.v_isPostgres then
  begin
    v_UniQr := TUniQuery.Create(nil);

      if AClientThread=nil then begin
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
      end else begin
        v_UniQr.Connection:=AClientThread.PGconn;
        v_UniQr.Transaction:=AClientThread.PGTrans;
      end;
      if v_1_7_IS_LOG_WRITE then
      begin
        CmnMyDoQueryInsert ( 'событие SumitSQL', 4, 'Execute sql query : '+ASQL,
                    AClientThread );
        Lg_ev('Execute sql auery : '+ASQL);
      end;
      //
      try
        v_UniQr.SQL.Text := ASQL ;
        v_UniQr.Open;
      except
        on e: Exception do
          begin
            Log_ins('FailToOpenQuery' + e.Message + '/' + e.ClassName + ':' + ASQL);
            CmnMyDoQueryInsert('Ошибка! Не удалось выполнить запрос!',
                          3,
                          'FailToOpenQuery' + e.Message + '/' + e.ClassName + ':' + ASQL,
                    AClientThread );
            v_UniQr.Close;
            FreeAndNil(v_UniQr);
        //  raise;
        end;
      end;
    AResult := v_UniQr;
  end else begin
    dsSel := TpFIBDataSet.Create(nil);

      if AClientThread<>nil then
      begin
        dsSel.Database := (AClientThread.v_ClThr_DB as TpFIBDatabase);
        dsSel.Transaction := (AClientThread.v_ClThr_trRead as TpFIBTransaction);
      end else
      begin
        dsSel.Database := DB_CMN.DB;
        dsSel.Transaction := DB_CMN.trRead;
      end;
      //
      if v_1_7_IS_LOG_WRITE then
      begin
        CmnMyDoQueryInsert ( 'событие SumitSQL', 4, 'Execute sql query : '+ASQL,
                    AClientThread );
        Lg_ev('Execute sql auery : '+ASQL);
      end;
      //
      try
        dsSel.SQLs.SelectSQL.Clear;
        dsSel.SQLs.SelectSQL.Add(ASQL);
        dsSel.Open;
      except
        on e: Exception do
          begin
            Log_ins('FailToOpenQuery' + e.Message + '/' + e.ClassName + ':' + ASQL);
            CmnMyDoQueryInsert('Ошибка! Не удалось выполнить запрос!',
                          3,
                          'FailToOpenQuery' + e.Message + '/' + e.ClassName + ':' + ASQL,
                    AClientThread );
            dsSel.Close;
            FreeAndNil(dsSel);
        //  raise;
        end;
      end;

    AResult := dsSel;
  end;
end;

procedure TDicomServer.TimerAuotLoadDirTimer(Sender: TObject);
var v_str:TStringList;
    fs: TSearchRec;
    i:Integer;
    ADataset: TDicomDataset;
    InstanceUID, Aid, pName, pDateBorn, pSex,
    ImageType, StudyID, SeriesUID,
    StudyUID, PatientID, ImageType1,
    StudyDescription, PhysName, AccessionNumber  : string;
    StudyDate: TDatetime;
    DA: TDicomAttribute;
    v_Selected2{, v_SessionID} : integer;
    y, m, d: Word;
    ImageFilename, CurDir ,
    v_StudyDate, v_Modality,
    v_DevSerNum, // v_str_uniq20,
    v_fio, v_PID, v_MOD, v_cmn : string;
    v_is_cardiojet : Boolean;
    fibds, fibds1 : TpFIBDataSet;
    v_OraQr : TOracleDataSet;
    v_UniQr : TUniQuery;
    vTmpCurDir : ansistring;
    v1,v2,v3,v4, v5 : string;
    v_is_bakulev : Boolean;
    dat:TDateTime;
  procedure SetDir(ADir: string); // если каталога нет - создадим его перед сохранением в него снимка
  begin
    if ADir <> '' then
      begin
        if CurDir <> '' then
          begin
            if CurDir[Length(CurDir)] <> '\' then
              CurDir := CurDir + '\';
            CurDir := CurDir + ADir;
          end else
          begin
            CurDir := ADir;
          end;
        if not DirectoryExists(CurDir) then
          if not CreateDir(CurDir) then
            Lg_ev('ERROR - Не удаётся создать дирректорию ' + CurDir);
      end;
  end;
  procedure ldFromWorkList ( pDS : TDataSet );
  begin
    if not pDS.EOF then
    begin
      v_fio:=pDS.FieldByName('P_ENAME').AsString;
      ADataset.Attributes.AddVariant(v_FC_PNAME_1, v_FC_PNAME_2,v_fio);
      v_PID:=pDS.FieldByName('P_PID').AsString;
      ADataset.Attributes.AddVariant(v_FC_PATIENTID_1, v_FC_PATIENTID_2,v_PID);
      v_MOD:=pDS.FieldByName('MODALITY').AsString;
      ADataset.Attributes.AddVariant(v_FC_IMAGETYPE_1, v_FC_IMAGETYPE_2,v_MOD);
    end else
    begin
      fibds := TpFIBDataSet.Create(nil);
      try
        fibds.Database := DB_CMN.DB;
        fibds.Transaction := DB_CMN.trRead;
        fibds.AutoCommit := True;
        fibds.SQLs.SelectSQL.Text := 'select * from WORKLIST';
        fibds.Prepare;
        try
          fibds.Open; fibds.First;
        except
          on E : Exception do
            if v_1_7_IS_LOG_WRITE then
              MnLg_ev('ERROR '+E.Message);
        end;
        v_fio:='';
        v_PID:='';
        v_MOD:='';
        if not fibds.EOF then
        begin
          v_fio:=fibds.FieldByName('P_ENAME').AsString;
          ADataset.Attributes.AddVariant(v_FC_PNAME_1, v_FC_PNAME_2,v_fio);
          v_PID:=fibds.FieldByName('P_PID').AsString;
          ADataset.Attributes.AddVariant(v_FC_PATIENTID_1, v_FC_PATIENTID_2,v_PID);
          v_MOD:=fibds.FieldByName('MODALITY').AsString;
          ADataset.Attributes.AddVariant(v_FC_IMAGETYPE_1, v_FC_IMAGETYPE_2,v_MOD);
        end else
          Lg_ev( 'Номер '+v_DevSerNum+' в списке worklist не найден' );
      finally
        fibds.Free;
      end;
    end;
  end;
  procedure f_chk_worklist;
  begin
    if v_isOracle then begin
      v_OraQr := TOracleDataSet.Create(nil);
      try
        v_OraQr.Session:=DB_CMN.OraConn;
        v_OraQr.SQL.Text := 'select * from WORKLIST where P_AETITLE = :P_AETITLE';
        v_OraQr.DeclareAndSet('P_AETITLE', otString , Trim(v_DevSerNum) );
        try
          v_OraQr.Open; v_OraQr.First;
        except
          on E : Exception do if v_1_7_IS_LOG_WRITE then MnLg_ev('ERROR '+E.Message);
        end;
        v_fio:=''; v_PID:=''; v_MOD:='';
        ldFromWorkList(v_OraQr);
      finally
        v_OraQr.Free;
      end;
    end else if v_isPostgres then begin
      v_UniQr := TUniQuery.Create(nil);
      try
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        v_UniQr.SQL.Text := 'select * from WORKLIST where P_AETITLE = :P_AETITLE';
        v_UniQr.ParamByName('P_AETITLE').AsString := Trim(v_DevSerNum);
        try
          v_UniQr.Open; v_UniQr.First;
        except
          on E : Exception do if v_1_7_IS_LOG_WRITE then MnLg_ev('ERROR '+E.Message);
        end;
        v_fio:=''; v_PID:=''; v_MOD:='';
        ldFromWorkList(v_UniQr);
      finally
        v_UniQr.Free;
      end;
    end else begin
      fibds1 := TpFIBDataSet.Create(nil);
      try
        fibds1.Database := DB_CMN.DB;
        fibds1.Transaction := DB_CMN.trRead;
        fibds1.AutoCommit := True;
        fibds1.SQLs.SelectSQL.Text := 'select * from WORKLIST where P_AETITLE = :P_AETITLE';
        fibds1.Prepare;
        fibds1.ParamByName('P_AETITLE').AsString := Trim(v_DevSerNum);
        try
          fibds1.Open; fibds1.First;
        except
          on E : Exception do if v_1_7_IS_LOG_WRITE then MnLg_ev('ERROR '+E.Message);
        end;
        v_fio:=''; v_PID:=''; v_MOD:='';
        ldFromWorkList(fibds1);
      finally
        fibds1.Free;
      end;
    end;
  end;
  procedure MyFileCopyCmn;
  begin
    try
      MoveFile( PChar(v_1_10_autoload_folder+v_str[i]), PChar(vTmpCurDir) );  // ПРОЩЕ :)
    except
      Lg_ev('Ошибка копирования файла '+#13+
            'из :'+v_1_10_autoload_folder+v_str[i]+#13+
            ' в '+vTmpCurDir);
    end;
  end;
  procedure dcm_ini;
  begin
    StudyID  := gt_uniq_InstanceUID ;
    PName := 'ANONYMOUS' ;
    pDateBorn := '' ;
    PSex := '' ;
    PatientID := gt_uniq_AccNmb ;
    StudyDate := Date ;
    StudyUID := gt_uniq_StudyUID ;
    SeriesUID := gt_uniq_SeriesUID ;
    InstanceUID := gt_uniq_InstanceUID ;
    ImageType := 'OT' ;
    AID := '' ;
    ImageType1 := 'OT' ;
    StudyDescription := '' ;
    PhysName := '' ;
    AccessionNumber := gt_uniq_AccNmb ;
    v_Selected2 := 0 ;
  end;
  procedure dcm_sav_cmn;
  begin
    ImageType := ADataset.Attributes.GetString(v_FC_IMAGETYPE_1, v_FC_IMAGETYPE_2); // Модальность
    Lg_ev( 'Загружен ...' );
    //
    v_DevSerNum := ADataset.Attributes.GetString ( $18,$1000 );
    Lg_ev('Прибор номер : ' + v_DevSerNum );
  //  f_chk_worklist;
    v_is_cardiojet:=False; // (Trim(v_DevSerNum)<>'');
  //  v_str_uniq20 := 'CJ'+v_DevSerNum+'/'+ IntToStr(GetTickCount);

   // ImageType := ADataset.Attributes.GetString(v_FC_IMAGETYPE_1, v_FC_IMAGETYPE_2); // Модальность (CS Modality)
  {  if (v_is_cardiojet and (Trim(ImageType)='')) then
    begin
      if trim(v_MOD)<>'' then
        ImageType := v_MOD
      else
        ImageType := 'ECG';
      ADataset.Attributes.AddVariant(v_FC_IMAGETYPE_1, v_FC_IMAGETYPE_2,ImageType);
    end; }

    DA := ADataset.Attributes.Item[v_FC_DA_1, v_FC_DA_2]; // Дата исследования (Study Date)
    if assigned(DA) then
    begin
        StudyDate := DA.AsDatetime[0];
        DA := ADataset.Attributes.Item[v_FC_DT_1, v_FC_DT_2]; // Время исследования (Study Time)
        if assigned(DA) then
          StudyDate := StudyDate + DA.AsDatetime[0];
    end
    else
    begin
        StudyDate := Now;
    end;

    v_cmn := v_DevSerNum+{IntToStr(YearOf(StudyDate))+
             IntToStr(MonthOf(StudyDate))+
             IntToStr(DayOf(StudyDate))+
             IntToStr(HourOf(StudyDate))+
             IntToStr(MinuteOf(StudyDate))+
             IntToStr(SecondOf(StudyDate))+  }
             IntToStr(GetTickCount);

    StudyID := ADataset.Attributes.GetString(v_FC_STUDYID_1, v_FC_STUDYID_2); // ID исследования (StudyID)
  {  if (v_is_cardiojet and (Trim(StudyID)='')) then
      StudyID:=IntToStr(GetTickCount); }
    StudyID:=StudyID+v_cmn;

    PatientID := ADataset.Attributes.GetString(v_FC_PATIENTID_1, v_FC_PATIENTID_2); // ID пациента (PatientID)
  {  if (v_is_cardiojet and (Trim(PatientID)='')) then
    begin
      if trim(v_PID)<>'' then
        PatientID:=v_PID
      else
        PatientID:=v_str_uniq20;
    end;  }
  //  if trim(v_PID)<>'' then
  //      PatientID:=v_PID;
  //  PatientID := PatientID + v_cmn;
  //  ADataset.Attributes.AddVariant(v_FC_PATIENTID_1, v_FC_PATIENTID_2,PatientID);

    StudyDescription := AnsiUpperCase( ADataset.Attributes.GetString(v_FC_STUDYDESCRIPTION_1, v_FC_STUDYDESCRIPTION_2) ); // Комментарий-описание к исследованию (Study Description)

    AccessionNumber := ADataset.Attributes.GetString(v_FC_ACCESSIONNUMBER_1, v_FC_ACCESSIONNUMBER_2); // Номер протокола исследования
   { if (v_is_cardiojet and (Trim(AccessionNumber)='')) then
      AccessionNumber := 'CJ'+gt_uniq_AccNmb; }
  //  AccessionNumber:=AccessionNumber+v_cmn;
  //  ADataset.Attributes.AddVariant(v_FC_ACCESSIONNUMBER_1, v_FC_ACCESSIONNUMBER_2,AccessionNumber);

    {   gt_random_str
        v_StudyUID:=gt_uniq_StudyUID;
        v_StudyID:=gt_uniq_StudyID;
        v_AccNmb:=gt_uniq_AccNmb;
        v_SeriesUID:=gt_uniq_SeriesUID;
    }
    StudyUID := ADataset.Attributes.GetString(v_FC_STUDYUID_1, v_FC_STUDYUID_2);  // Study Instance UID
   { if (v_is_cardiojet and (Trim(StudyUID)='')) then
    begin
      StudyUID := 'CJ'+gt_uniq_StudyUID;
    end; }
  //  StudyUID:=StudyUID+v_cmn;
  //  ADataset.Attributes.AddVariant(v_FC_STUDYUID_1, v_FC_STUDYUID_2,StudyUID);

    SeriesUID := ADataset.Attributes.GetString(v_FC_SERIESUID_1, v_FC_SERIESUID_2); // Series Instanse UID
    if SeriesuID = '' then
      SeriesUID := ADataset.Attributes.GetString(v_FC_SERNUM_1, v_FC_SERNUM_2); // Series Number
    if (v_is_cardiojet and (Trim(SeriesUID)='')) then SeriesUID := 'CJ'+gt_uniq_StudyUID;

    PhysName := gt_charset_value( ADataset.Attributes, ADataset.Attributes.GetString(v_FC_PHYSNAME_1, v_FC_PHYSNAME_2) ) ; // ФИО врача (Referring Physicians Name)
    pName := TranslitRus ( gt_charset_value( ADataset.Attributes, ADataset.Attributes.GetString(v_FC_PNAME_1, v_FC_PNAME_2) ) ) ; // ФИО пациента (Patient Name)
 {   if Trim(pName)='' then
    begin
      if Trim(v_fio)<>'' then
        pName := v_fio
      else
        pName := 'Anonymous';
      ADataset.Attributes.AddVariant(v_FC_PNAME_1, v_FC_PNAME_2,pName);
    end; }

    if Trim(v_fio)<>'' then
      pName := v_fio;

    pDateBorn := ADataset.Attributes.GetString(v_FC_PDATEBORN_1, v_FC_PDATEBORN_2); // Дата рождения пациента (Patient Birth Date)
    pSex := ADataset.Attributes.GetString(v_FC_PSEX_1, v_FC_PSEX_2); // Пол пациента (Patient Sex)

    if PatientID = '' then
      PatientID := 'Unknown';
    AID := ADataset.Attributes.GetString(v_FC_AID_1, v_FC_AID_2); // Instance Number
    if aid = '' then
      AID := ADataset.Attributes.GetString(v_FC_ACQNUM_1, v_FC_ACQNUM_2); // Acquisition Number - что это ?
    if aid = '' then
      aid := '1';
    InstanceUID := ADataset.Attributes.GetString(v_FC_INSTANCEUID_1, v_FC_INSTANCEUID_2); // SOP Instanse UID
   { if (v_is_cardiojet and (Trim(InstanceUID)='')) then
      InstanceUID:='CJ'+gt_uniq_str;}
  //  InstanceUID:=InstanceUID+v_cmn;
  //  ADataset.Attributes.AddVariant(v_FC_INSTANCEUID_1, v_FC_INSTANCEUID_2,InstanceUID);

    Lg_ev('DicomServerDicomImage - AppendImage');
    // делаем запись в БД FireBird
    // KIN $2809, $001D - временный тег
    v_Selected2 := ADataset.Attributes.getInteger(v_FC_KIN_1, v_FC_KIN_2) ;
    //
    Lg_ev ( 'StudyID = '+StudyID+#13+
      'PName = '+PName+#13+
      'pDateBorn = '+pDateBorn+#13+
      'PSex = '+PSex+#13+
      'PatientID = '+PatientID+#13+
      'StudyDate = '+DateTimeToStr(StudyDate)+#13+
      'StudyUID = '+StudyUID+#13+
      'SeriesUID = '+SeriesUID+#13+
      'InstanceUID = '+InstanceUID+#13+
      'ImageType = '+ImageType+#13+
      'AccessionNumber = '+AccessionNumber
    );
    StudyDate := AppendImage( nil,
                             ADataset.Attributes,
                             StudyID,
                             PName,
                             pDateBorn,
                             PSex,
                             PatientID,
                             StudyDate,
                             StudyUID,
                             SeriesUID,
                             InstanceUID,
                             ImageType,
                             AID,
                             ImageType1,
                             StudyDescription,
                             PhysName,
                             AccessionNumber,
                             v_Selected2,
                             StudyUID );
    Lg_ev('DicomServerDicomImage - inserted into DB');
    DecodeDate(StudyDate, y, m, d);
    CurDir:='';
    SetDir(sDir);
    SetDir(ImageType1);
    SetDir(IntToStr(y));
    SetDir(IntToStr(m));
    SetDir(IntToStr(d));
    SetDir(StudyuID);
    SetDir(SeriesUID);
    ImageFileName := InstanceUID + '.dcm';
    if CurDir[Length(CurDir)] <> '\' then CurDir := CurDir + '\';
    vTmpCurDir := CurDir + ImageFileName;

    Lg_ev('DicomServerDicomImage - before save ImageFileName='+ImageFileName);
  end;
  procedure Pars2Str ( pStrIn : string; var pstrOut1 : string; var pstrOut2 : string );
  var vPos : Integer;
  const cRzd = '#';
  begin
    vPos := Pos( cRzd, pStrIn );
    pstrOut1 := Copy( pStrIn, 0, vPos-1 ) ;
    pstrOut2 := Copy( pStrIn, vPos+1 ) ;
  end;
  procedure parse4Str (pStrIn : string; var pstrOut1 : string; var pstrOut2 : string; var pstrOut3 : string; var pstrOut4 : string; var pstrOut5 : string  );
  var fv1, fv2, fv3 : string;
  begin
    Pars2Str ( pStrIn, fv1, fv2 );
    pstrOut1 := fv1 ;
    Pars2Str ( fv2, fv3, fv1 );
    pstrOut2 := fv3 ;
    Pars2Str ( fv1, fv2, fv3 );
    pstrOut3 := fv2 ;
    Pars2Str ( fv3, fv2, fv1 );
    pstrOut4 := fv2 ;
    pstrOut5 := StringReplace(fv1,'.pdf','',[rfReplaceAll, rfIgnoreCase]) ;
  end;
  function gtBakComm ( pStr : string ) : string;
  begin
    if Pos('AMB',pStr)>0 then begin
      Result:='АМБ';
    end else if Pos('RES',pStr)>0 then begin
      Result:='ЭКГ';
    end else if Pos('EXE',pStr)>0 then begin
      Result:='НГР';
    end else
      Result:=pStr;
  end;
begin  // проверка каталога
  TimerAuotLoadDir.Enabled := False;
  try
    if DirectoryExists(v_1_10_autoload_folder) then
    begin
      dcmTagIni;
      //
      v_str:=TStringList.Create;
      try
        if FindFirst(v_1_10_autoload_folder+'*.dcm', faAnyFile, fs)=0 then
        repeat
           v_str.Append(fs.Name);
        until FindNext(fs)<>0;
        FindClose(fs);
        for I := 0 to v_str.Count - 1 do
        begin // загрузка файла с именем v_str[i]
          Lg_ev('загрузка файла с именем : ' + v_1_10_autoload_folder+v_str[i] );
        //  CmnMyDoQueryInsert('DicomLogit', 3, 'загрузка файла с именем : ' + v_1_10_autoload_folder+v_str[i] , nil );
          // загрузим в датасет
          ADataset:= TDicomDataset.Create;
          try
            dcm_ini;
            ADataset.LoadFromFile(v_1_10_autoload_folder+v_str[i]);
            //
            dcm_sav_cmn;
            //
            //сохраняем DICOM-файл на жесткий диск
            MyFileCopyCmn;
            if ((not FileExists(vTmpCurDir)) and FileExists(v_1_10_autoload_folder+v_str[i])) then
            begin // вторая попытка - подождем и попробуем
              Sleep(2000);
              MyFileCopyCmn;
            end;
            // проверка скопировался ли файл
            if not FileExists(vTmpCurDir) then
            begin
              ADataset.SaveToFile( vTmpCurDir ,
                      True,
                      JPEGLossless, //8197, //ADataset.Attributes.ImageData.ImageData[0].TransferSyntax, - JPEGLossless
                      100);
            end;
          finally
            ADataset.Free;
          end;
          DeleteFile( PChar(v_1_10_autoload_folder+v_str[i]) );
        end;
      finally
        v_str.Free;
      end;
      // загрузка PDF в DICOM формат
      v_str:=TStringList.Create;
      try
        if FindFirst(v_1_10_autoload_folder+'*.pdf', faAnyFile, fs)=0 then
        repeat
           v_str.Append(fs.Name);
        until FindNext(fs)<>0;
        FindClose(fs);
        for I := 0 to v_str.Count - 1 do
        begin // загрузка файла с именем v_str[i]
          Lg_ev('загрузка файла с именем : ' + v_1_10_autoload_folder+v_str[i] );
          ADataset:= TDicomDataset.Create;
          try
            dcm_ini;
            // парсим ID#ФИО#дата_исследования#тип_исследования.pdf
            parse4Str( v_str[i], v1, v2, v3, v4, v5 );
            v_is_bakulev := ( (Trim(v1)<>'') and (Trim(v2)<>'') and (Trim(v3)<>'') );

            if v_is_bakulev then
            begin
              ADataset.Attributes.Add($10,$20).AsString[0] := Trim(v1) ;   // ID пациента (PatientID)
              ADataset.Attributes.Add($10,$10).AsString[0] := Trim(v2) ;   // ФИО пациента (Patient Name)
              if TryStrToDate(Trim(v3),Dat) then
              begin
                ADataset.Attributes.Add($08, $20).AsDatetime[0] := Dat;
                ADataset.Attributes.Add($08, $23).AsDatetime[0] := Dat;
                ADataset.Attributes.Add($08, $2A).AsDatetime[0] := Dat;
              end else begin
                ADataset.Attributes.Add($08, $20).AsDatetime[0] := Date;
                ADataset.Attributes.Add($08, $23).AsDatetime[0] := Date;
                ADataset.Attributes.Add($08, $2A).AsDatetime[0] := Date;
              end;
              if Trim(v5)='' then
              begin
                ADataset.Attributes.Add($08,$1030).AsString[0] := gtBakComm(Trim(v4)) ; // StudyDescription
              end else begin
                ADataset.Attributes.Add($08,$1030).AsString[0] := gtBakComm(Trim(v5)) ; // StudyDescription
              end;
            end else
            begin
               ADataset.Attributes.Add($10,$20).AsString[0] := 'PID_'+
                          inttostr(YearOf(Date))+
                          inttostr(MonthOf(Date))+
                          inttostr(DayOf(Date))+
                          inttostr(GetTickCount);       // ID пациента (PatientID)
               ADataset.Attributes.Add($10,$10).AsString[0]:= 'ANONYMOUS_'+
                          inttostr(YearOf(Date))+
                          inttostr(MonthOf(Date))+
                          inttostr(DayOf(Date))+
                          inttostr(GetTickCount);       // ФИО пациента (Patient Name)
              ADataset.Attributes.Add($08, $20).AsDatetime[0] := Date;
              ADataset.Attributes.Add($08, $23).AsDatetime[0] := Date;
              ADataset.Attributes.Add($08, $2A).AsDatetime[0] := Date;
              ADataset.Attributes.Add($08,$1030).AsString[0]  := AnsiUpperCase( v_str[i] ) ; // StudyDescription  - пишем имя файла
            end;
            ADataset.Attributes.Add($08,$60).AsString[0] :='OT';               // Modality
            ADataset.Attributes.Add($42,$12).AsString[0] :='application/pdf';  // type of document

            // ADataset.Attributes.Add($08,$90).AsString[0] :=teDoctor.Text;      // ФИО врача (Referring Physicians Name)

            // ADataset.Attributes.Add(8, $30).AsDatetime[0] := Now;              // StudyTime
            // ADataset.Attributes.Add(8, $33).AsDatetime[0] := Now;              // ContentTime

            ADataset.Attributes.Add( $0008, $0018 ).AsString[0]:=  gt_uniq_InstanceUID ;  // dSOPInstanceUID
            ADataset.Attributes.Add( $0020, $000E ).AsString[0]:=  gt_uniq_SeriesUID ;  // dSeriesInstanceUID

            ADataset.Attributes.Add( $08,$70 ).AsString[0]:= 'Medotrade Ltd.' ;
            ADataset.Attributes.Add( $0008, $0016 ).AsString[0]:=  '1.2.840.10008.5.1.4.1.1.104.1' ;  // dSOPClassUID - PDF encapsulated Storage SOP Class

            ADataset.Attributes.Add( $0020, $000D ).AsString[0]:=  gt_uniq_StudyUID ; // dStudyInstanceUID
            ADataset.Attributes.Add( $0008, $0050 ).AsString[0]:=  gt_uniq_StudyUID ; // dAccessionNumber

            ADataset.Attributes.Add( $0020, $0011 ).AsString[0]:='1';   // dSeriesNumber
            ADataset.Attributes.Add( $0020, $0013 ).AsString[0]:='1';   // dInstanceNumber

            ADataset.Attributes.Add( $42, $10 ).AsString[0]:='PDF file';  // TitleDocument

            //ADataset.Attributes.Add($10, $30).AsDatetime[0] := deDateBorn.Date;       // Дата рождения пациента (Patient Birth Date)

            ADataset.Attributes.Add( $0020, $0010 ).AsString[0] := gt_uniq_StudyID ;           // StudyID

            // ADataset.Attributes.Add( $0010, $0010 ).AsString[0] := TranslitRus(teFIOpac.Text); // dPatientName
            // ADataset.Attributes.Add( $0010, $0020 ).AsString[0] :=  tePatientID.Text ;         // dPatientID
            // ADataset.Attributes.Add( $0010, $0030 ).AsDatetime[0] := deDateBorn.Date ;         // dPatientBirthDate

            ADataset.Attributes.Add( $42,$11 );
            ADataset.Attributes.Item[ $42,$11 ].LoadFromFile(v_1_10_autoload_folder+v_str[i]);


            dcm_sav_cmn;

            ADataset.SaveToFile( vTmpCurDir ,
                      True,
                      ImplicitVRLittleEndian,
                      100 );
          finally
            ADataset.Free;
          end;
          DeleteFile( PChar(v_1_10_autoload_folder+v_str[i]) );
        end;
      finally
        v_str.Free;
      end;
      //
    end else
      Lg_ev( 'Каталог '+v_1_10_autoload_folder+' не существует' );
  finally
    TimerAuotLoadDir.Enabled := True;
  end;
end;

procedure TDicomServer.tmClrLOGTimer(Sender: TObject);
var v_DB : TpFIBDatabase;
    v_trRead, v_trWrite : TpFIBTransaction;
    v_max, v_min : integer;
    v_OraConn : TOracleSession;
    v_PGconn : TUniConnection;
    v_PGTrans : TUniTransaction;
begin
  tmClrLOG.Enabled := False;
  if ((HourOf(Now)=1)      // запускаем в час ночи
     and (v_day_clr_log<Date)) then
  begin
    v_day_clr_log:=Date;
    if v_isOracle then begin
      v_OraConn := DB_CMN.OraConnCrt;
      try
        With TOracleQuery.Create(nil) do
        try
          Session := v_OraConn;
          SQL.Text := 'select max(fk_id) as nn, min(fk_id) as mn from events';
          try
            Execute;
          except
            on E : Exception do if v_1_7_IS_LOG_WRITE then MnLg_ev('ERROR '+E.Message);
          end;
          v_max:=0; v_min:=0;
          if not EOF then
          begin
            v_max:=FieldAsInteger('nn'); v_min:=FieldAsInteger('mn');
          end;
        finally
          Free;
        end;
        if (v_max-v_min)>c_log_records then
        begin
          With TOracleQuery.Create(nil) do
          try
            Session := v_OraConn;
            SQL.Text := 'delete from events where fk_id<=:p_fk_id and fk_id>=:p_fk_del_id';
            DeclareAndSet('p_fk_id', otInteger , v_max-c_log_records );                       // уделение записей с id меньше
            DeclareAndSet('p_fk_del_id', otInteger , v_max-c_log_records-c_max_del_records ); // уделение записей с id больше
            try
              Execute;
              Session.Commit;
            except
              on E : Exception do if v_1_7_IS_LOG_WRITE then MnLg_ev('ERROR '+E.Message);
            end;
          finally
            Free;
          end;
        end;
      finally
        OraFree(v_OraConn);
      end;
    end else if v_isPostgres then begin
      v_PGconn := DB_CMN.PgConnCrt;
      v_PGTrans := PGTransCreate (v_PGconn) ;
      v_PGTrans.DefaultConnection:=v_PGconn;
      try
        With TpFIBDataSet.Create(nil) do
        try
          Database := v_DB;
          Transaction := v_trRead;
          AutoCommit := True;
          SQLs.SelectSQL.Text := 'select max(fk_id) as nn, min(fk_id) as mn from events';
          Prepare;
          try
            Open; First;
          except
            on E : Exception do if v_1_7_IS_LOG_WRITE then MnLg_ev('ERROR '+E.Message);
          end;
          v_max:=0; v_min:=0;
          if not EOF then
          begin
            v_max:=FieldByName('nn').AsInteger; v_min:=FieldByName('mn').AsInteger;
          end;
        finally
          Free;
        end;
        if (v_max-v_min)>c_log_records then
        begin
          With TpFIBQuery.Create(nil) do
          try
            Database := v_DB;
            Transaction := v_trWrite;
            Options := Options + [qoAutoCommit];
            SQL.Text := 'delete from events where fk_id<=:p_fk_id and fk_id>=:p_fk_del_id';
            Prepare;
            ParamByName('p_fk_id').AsInteger := v_max-c_log_records;                       // уделение записей с id меньше
            ParamByName('p_fk_del_id').AsInteger := v_max-c_log_records-c_max_del_records; // уделение записей с id больше
            try
              ExecQuery;
            except
              on E : Exception do if v_1_7_IS_LOG_WRITE then MnLg_ev('ERROR '+E.Message);
            end;
          finally
            Free;
          end;
        end;
      finally
        PgFree ( v_PGconn, v_PGTrans );
      end;
    end else begin
      v_DB:=f_fb_db_crt(c_LOGalias);
      v_trRead:= f_FbReadTransactCreate( v_DB );
      v_trWrite:= f_FbWriteTransactCreate( v_DB );
      try
        With TpFIBDataSet.Create(nil) do
        try
          Database := v_DB;
          Transaction := v_trRead;
          AutoCommit := True;
          SQLs.SelectSQL.Text := 'select max(fk_id) as nn, min(fk_id) as mn from events';
          Prepare;
          try
            Open; First;
          except
            on E : Exception do if v_1_7_IS_LOG_WRITE then MnLg_ev('ERROR '+E.Message);
          end;
          v_max:=0; v_min:=0;
          if not EOF then
          begin
            v_max:=FieldByName('nn').AsInteger; v_min:=FieldByName('mn').AsInteger;
          end;
        finally
          Free;
        end;
        if (v_max-v_min)>c_log_records then
        begin
          With TpFIBQuery.Create(nil) do
          try
            Database := v_DB;
            Transaction := v_trWrite;
            Options := Options + [qoAutoCommit];
            SQL.Text := 'delete from events where fk_id<=:p_fk_id and fk_id>=:p_fk_del_id';
            Prepare;
            ParamByName('p_fk_id').AsInteger := v_max-c_log_records;                       // уделение записей с id меньше
            ParamByName('p_fk_del_id').AsInteger := v_max-c_log_records-c_max_del_records; // уделение записей с id больше
            try
              ExecQuery;
            except
              on E : Exception do if v_1_7_IS_LOG_WRITE then MnLg_ev('ERROR '+E.Message);
            end;
          finally
            Free;
          end;
        end;
      finally
        p_free_conn_fb ( v_DB , v_trWrite , v_trRead );
      end;
    end;
  end;
  tmClrLOG.Enabled := True;
end;

{
function TDicomServer.TestDcmFileDir(AQuery: TDataset; var AImageDir: string): Boolean;
function TestDir(ADir: string; ADate: TDatetime; ImageType: string): Boolean;
  var y, m, d: Word;
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
  if v_1_7_IS_LOG_WRITE then
    DoQueryInsert ( 'событие TestDcmFileDir',  4, '' );
  f1 := AQuery.FindField('STUDIESDATE');
  if not assigned(f1) then
    f1 := AQuery.FindField('IMAGEDATE');
  date1 := f1.AsDatetime;
  ImageType := Trim(AQuery.FieldByName('IMAGETYPE').AsString);
  Result := TestDir(sDir, date1, ImageType);
  if Result then
    exit;
end;   

function TDicomServer.TestDcmFileDir_RemoteDir(AQuery: TDataset; var AImageDir: string): Boolean;
function TestDir(ADir: string; ADate: TDatetime; ImageType: string): Boolean;
  var y, m, d: Word;
      str1: string;
  begin
    DecodeDate(adate, y, m, d);
    Result := false;
    try
    if ADir[Length(ADir)] <> '\' then
      adir := adir + '\';
    except
      
    end;
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
  if v_1_7_IS_LOG_WRITE then
    DoQueryInsert ( 'событие TestDcmFileDir_RemoteDir', 4, '' );
  f1 := AQuery.FindField('STUDIESDATE');
  if not assigned(f1) then
    f1 := AQuery.FindField('IMAGEDATE');

  date1 := f1.AsDatetime;
  ImageType := Trim(AQuery.FieldByName('IMAGETYPE').AsString);
  if sDirRemote<>'' then
    Result := TestDir(sDirRemote, date1, ImageType)
  else Result:=False;
  if Result then
    exit;
end;

function TDicomServer.TestFile(Query1: TDataset; basedir: string): string;
var pname, v_SERIESUID, v_IMGNO, v_INSTANCEUID : string;
begin
  // FOMIN
  v_SERIESUID   := Trim( Query1.FieldByName('SERIESUID').AsString );
  v_IMGNO       := Trim(Query1.FieldByName('IMGNO').asstring);
  v_INSTANCEUID := Trim(Query1.FieldByName('INSTANCEUID').asstring);
//  Result := f_chk_instance ( Trim(Query1.FieldByName('INSTANCEUID').asstring),
//                             nil,
//                             BaseDir
//                           );

  pName := BaseDir + v_SERIESUID + '\' + v_IMGNO + '.dcm';
  if v_1_7_IS_LOG_WRITE then
    DoQueryInsert ( 'событие TestFile', 4, 'basedir='+basedir+#13+ 'pName='+pName );
  if FileExists(pname) then
    begin
      Result := pName;
    end else
    begin
      pName := BaseDir + v_SERIESUID + '\' + v_INSTANCEUID + '.dcm';
      if v_1_7_IS_LOG_WRITE then
        DoQueryInsert ( 'TestFile', 4, 'File='+pName );
      if FileExists(pname) then
        begin
          Result := pname;
        end else
        begin
          if v_1_7_IS_LOG_WRITE then
            DoQueryInsert ( 'TestFile', 4, 'File='+pName+' не найден' );
          pName := BaseDir + ' ' + v_SERIESUID + '\' + v_IMGNO + '.dcm';
          if v_1_7_IS_LOG_WRITE then
            DoQueryInsert ( 'TestFile', 4, 'File='+pName );
          if FileExists(pname) then
            Result := pname
          else begin
            Result := '';
            if v_1_7_IS_LOG_WRITE then
              DoQueryInsert ( 'TestFile', 4, 'File='+pName+' не найден' );
          end;
        end;
<<<<<<< .mine
    end; 
end;   }

function TDicomServer.MyTestFile( AClientThread: TDicomClientThread;
                                  p_SERIESUID : string;
                                  p_INSTANCEUID : string;
                                  p_IMGNO : string;
                                  basedir : string
                                ): string;
var pname : string;
begin
  // FOMIN
  pName := BaseDir + p_SERIESUID + '\' + p_INSTANCEUID + '.dcm';
  if FileExists(pname) then
  begin
    Lg_ev('Файл '+pName+' найден');
    Result := pName;
  end else
  begin
    Lg_ev('WARNING : Файл '+pName+' не найден');
    pName := BaseDir + p_SERIESUID + '\' + p_IMGNO + '.dcm';
    if FileExists(pname) then
    begin
      Lg_ev('Файл '+pName+' найден');
      Result := pname;
    end else
    begin
      Lg_ev('#6 ERROR : Файл '+pName+' не найден');
      Result := '';
    end;
  end;
end;

function TDicomServer.MyTestDcmFileDir( AClientThread: TDicomClientThread;
                                        p_STUDYUID    : string;
                                        p_STUDIESDATE : TDateTime;
                                        p_IMAGEDATE   : TDateTime;
                                        p_IMAGETYPE   : string;
                                        p_base_dir    : string;
                                        var AImageDir : string): Boolean;
function TestDir(ADir: string; ADate: TDatetime; ImageType: string): Boolean;
  var y, m, d: Word; vRes : Boolean;
      str1: string;
  begin
    try
      DecodeDate(adate, y, m, d);
    except
      y := YearOf(adate);
      m := MonthOf(adate);
      d := DayOf(adate);
    end;
    Lg_ev('TestDir #2 : adate='+DateToStr(adate)+#13#10+
          'y='+Inttostr(y)+#13#10+
          'm='+Inttostr(m)+#13#10+
          'd='+Inttostr(d)+#13#10+
          'p_STUDYUID='+p_STUDYUID
         );
    Result := false;
    if trim(ADir)='' then
    begin
      Lg_ev('error - empty ADir');
      Exit;
    end;
    if ADir[Length(ADir)] <> '\' then
      adir := adir + '\';
    str1 := adir + ImageType + '\' + IntToStr(y) + '\' + IntToStr(m) + '\' + IntToStr(d) + '\' +
        Trim(p_STUDYUID) + '\';
    Lg_ev('Ищем каталог '+str1);
    vRes := DirectoryExists(str1);
    if not vRes then begin Sleep(100); vRes := DirectoryExists(str1); end;
    if not vRes then begin Sleep(100); vRes := DirectoryExists(str1); end;
    if not vRes then begin Sleep(100); vRes := DirectoryExists(str1); end;
    if not vRes then begin Sleep(100); vRes := DirectoryExists(str1); end;
    if not vRes then begin Sleep(100); vRes := DirectoryExists(str1); end;
    if vRes then
    begin
      Lg_ev('Каталог '+str1+' найден');
      AImageDir := str1;
      Result := true;
    end
    else
    begin
      Lg_ev('Каталог '+str1+' не найден');
      str1 := adir + Trim(p_STUDYUID) + '\';
      AImageDir := str1;
      if DirectoryExists(str1) then
      begin
        Lg_ev('Каталог '+str1+' найден');
        Result := true;
      end else begin
        Lg_ev('Каталог '+str1+' не найден');
        Result := false;
      end;
    end;
  end;
var
  date1: TDatetime;
  ImageType: string;
  f1: TDateTime;
begin
  Lg_ev('событие TestDcmFileDir');
  if v_1_7_IS_LOG_WRITE then
    CmnMyDoQueryInsert ( 'событие TestDcmFileDir', 4, '', AClientThread );
  if Yearof(p_STUDIESDATE)<=1900 then
    f1 := p_IMAGEDATE
  else
    f1 := p_STUDIESDATE;

  date1 := f1;
  ImageType := Trim(p_IMAGETYPE);
  Lg_ev('before TestDir '+#13#10+
        'p_base_dir='+p_base_dir+#13#10+
        'date1='+DateToStr(date1)+#13#10+
        'ImageType='+ImageType+#13#10+
        '!!! p_base_dir = '+p_base_dir
       );
  Result := TestDir(p_base_dir, date1, ImageType);
  Lg_ev('after TestDir');
end;

procedure TDicomServer.SndHL7( p_pid:string;
                               p_accn:string;
                               p_studyUID:string
                             );
const START_BLOCK = #$0B;
      END_BLOCK = #$1C#$0D;
      crlf = #13;
var MsgOut ,
    MsgIn ,
    v_snd_msg_tmp : AnsiString;
    IdTCPClient1: TIdTCPClient;
begin // send message to HL7 server
  if ((Trim(v_ip_hl7)='') or (v_port_hl7=0) or (not v_chk_snd_HL7)) then Exit;
  IdTCPClient1:= TIdTCPClient.Create(nil);
  try
    with IdTCPClient1 do
    begin
      Host := v_ip_hl7;
      Port := v_port_hl7;
     v_snd_msg_tmp := 'MSH|^~\&|PACS SERVER||RMIS||||||GUID'+inttostr(GetTickCount)+'|'+crlf+
        'PID|||'+p_pid+'||'+'|||'+ crlf+
        'ORC||'+p_accn+'|||'+crlf+
        'ZDS|'+p_studyUID;  //   '0-1-2-3'
      MsgOut:=  v_snd_msg_tmp ;
      try
        Connect;
        try
          // Send Message
          IOHandler.Write(START_BLOCK+MsgOut+END_BLOCK);
          // Wait ACK Message
          MsgIn := IOHandler.ReadLn(END_BLOCK);
          //
          Lg_ev('отправка данных:'''+START_BLOCK+MsgOut+END_BLOCK+
             ''' по протоколу HL7 ip='+v_ip_hl7+' port='+inttostr(v_port_hl7));
        finally
          Disconnect;
        end;
      except
      on e:Exception do
        Lg_ev('error - ошибка отправки данных'+E.Message+' :'''+START_BLOCK+MsgOut+END_BLOCK+
             ''' по протоколу HL7 ip='+v_ip_hl7+' port='+inttostr(v_port_hl7));
      end;
    end;
  finally
    IdTCPClient1.Free;
  end;
end;

procedure TDicomServer.DicomServerNormalisedReceivedNDelete(
  AClientThread: TDicomClientThread; AAddress: string;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
var vStudyUID : string; rq : TDicomAttributes; FIBQuery : TpFIBQuery;
begin  // delete study with studyUID
  IncConnections;
  try
    if v_1_7_IS_LOG_WRITE then
    begin
      Lg_ev('DicomServerDicomFind');
      ds_sav ( ACommand, ARequestDatasets, AResponseDatasets );
    end;
  //  Root := getAffectedSOPClass(ACommand);
    rq := TDicomAttributes(ARequestDatasets[0]);
    //
    Lg_ev(' codepage='''+rq.GetString($08, $05)+'''');
    //
    vStudyUID := Trim(rq.GetString(dStudyInstanceUID));
    if Trim(vStudyUID)<>'' then
    begin // собственно удаление
      FIBQuery := TpFIBQuery.Create(nil);
      try
        if AClientThread=nil then
        begin
          FIBQuery.Database := DB_CMN.LOGDB;
          FIBQuery.Transaction := DB_CMN.LOGtrWrite;
        end else
        begin
          FIBQuery.Database := (AClientThread.v_ClThr_DB as TpFIBDatabase);
          FIBQuery.Transaction := (AClientThread.v_ClThr_trWrite as TpFIBTransaction);
        end;
        if not FIBQuery.Transaction.Active then
          FIBQuery.Transaction.Active:=True;
        FibQuery.Options := FibQuery.Options + [qoAutoCommit];
        FIBQuery.SQL.Text := ' delete from STUDIES where STUDYUID=:pSTUDYUID ';
        FIBQuery.ParamByName('pSTUDYUID').AsString := Trim(vStudyUID);
        try
          FIBQuery.ExecQuery;

          // !!! вставить удаление файлов

        except
          on E : Exception do
            if v_1_7_IS_LOG_WRITE then
                MnLg_ev('ERROR '+E.Message);
        end;
      finally
        FIBQuery.Free;
      end;
    end;
  finally
    DecConnections;
  end;
end;

end.

