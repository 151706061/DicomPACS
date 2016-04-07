unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, FIBDatabase, pFIBDatabase, StdCtrls, ExtDlgs, Oracle,
  FIBQuery, pFIBQuery, DB, FIBDataSet, pFIBDataSet, Math, DBAccess, Uni,
  PostgreSQLUniProvider, MemDS;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    Label1: TLabel;
    OpenTextFileDialog1: TOpenTextFileDialog;
    edDBFB: TEdit;
    Button1: TButton;
    Label2: TLabel;
    edFBUsername: TEdit;
    Label3: TLabel;
    adPswFB: TEdit;
    btnConnFB: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    edUser: TEdit;
    edPsw: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edSchema: TEdit;
    btnConnORA: TButton;
    OracleSession1: TOracleSession;
    Button2: TButton;
    Memo1: TMemo;
    pFIBQuery1: TpFIBQuery;
    pFIBTransaction2: TpFIBTransaction;
    OracleQuery1: TOracleQuery;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    edUserPostgres: TEdit;
    Label9: TLabel;
    edPasswPostgres: TEdit;
    Label10: TLabel;
    edDatabasePostgres: TEdit;
    btnConnPostgres: TButton;
    Button4: TButton;
    Label11: TLabel;
    edSchemaPostgres: TEdit;
    Label12: TLabel;
    edPortPostgres: TEdit;
    Label13: TLabel;
    edServerPostgres: TEdit;
    UniConnection1: TUniConnection;
    UniQuery1: TUniQuery;
    UniTransaction1: TUniTransaction;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btnConnFBClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConnORAClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnConnPostgresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure pFrmSeq( pFld, pTab, pGen : string );
    procedure pFrmSeqPostgres( pFld, pTab, pGen : string );
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    vPostgreSchema : string;
    procedure tbRswp( pTabName : string );
    procedure TLog ( pStr:string );
    procedure tbPostgresRswp( pTabName : string );
    procedure ConvertANSIFileToUTF8File(AInputFileName, AOutputFileName: TFileName);
  end;

var
  Form1: TForm1;

const c_sql_fields = 'select a.rdb$field_name as fname, a.rdb$field_position, a.rdb$null_flag, '+
                  ' a.rdb$field_source, a.rdb$default_source, b.rdb$computed_source,'+
                  ' b.rdb$field_length, b.rdb$field_scale, c.RDB$TYPE_NAME as tname, B.rdb$field_sub_type'+
                  ' from rdb$relation_fields a, rdb$fields b, RDB$TYPES c '+
                  ' where (a.rdb$field_source = b.rdb$field_name) and (b.RDB$FIELD_TYPE = c.rdb$type) '+
                     ' and (c.RDB$FIELD_NAME = ''RDB$FIELD_TYPE'') '+
                     ' and (a.rdb$relation_name = :pTabName)  '+
                  ' order by a.rdb$field_position asc';
      c_sql_tables = 'select rdb$relation_name as tbname from rdb$relations '+
                         ' where rdb$system_flag = 0 ' +
                         ' order by rdb$relation_name asc;';

implementation

{$R *.dfm}

procedure TForm1.TLog ( pStr:string );
begin
  Memo1.Lines.Append(pStr);
  Application.ProcessMessages;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin // Выбрать Файл БД Firebird
  OpenTextFileDialog1.initialDir:=ExtractFilePath(Application.ExeName);
  if OpenTextFileDialog1.Execute then
    edDBFB.Text:=OpenTextFileDialog1.FileName;
end;

procedure TForm1.tbRswp( pTabName : string );
var v_str1, v_str2, vfname, vFileName : AnsiString;
    vStr, vStr1 : TStringList;
    i,j, cnt, vi : Integer;
    vFIBQr : TpFIBQuery;
    vFIBDS : TpFIBDataSet;
    vObjList : TList;
    vFileList : TStringList ;
begin
  pFIBTransaction2.StartTransaction;
  vStr := TStringList.Create;
  vStr1 := TStringList.Create;
  vFIBQr:= TpFIBQuery.Create(nil);
  vFIBDS := TpFIBDataSet.Create(nil);
  try
    try
      vFIBQr.Database    := pFIBDatabase1 ;
      vFIBQr.Transaction := pFIBTransaction2 ;
      vFIBQr.SQL.Clear;
      vFIBQr.SQL.Text := c_sql_fields ;
      vFIBQr.ParamByName('pTabName').AsString := pTabName;
      vFIBQr.ExecQuery;
      v_str1:='';
      while not vFIBQr.Eof do
      begin
        vfname:=Trim(vFIBQr.FieldByName('fname').AsString);
        v_str1:=v_str1+vfname+',';
        v_str2:=v_str2+':p'+vfname+',';
        vStr.Append(vfname);
        vStr1.Append(Trim(vFIBQr.FieldByName('tname').AsString));
        vFIBQr.Next;
      end;
      v_str1:=Copy(v_str1,1,length(v_str1)-1);
      v_str2:=Copy(v_str2,1,length(v_str2)-1);
      vFIBQr.Close;
      OracleQuery1.SQL.Clear;
      OracleQuery1.DeleteVariables;
      OracleQuery1.SQL.Text := 'truncate table pacs.'+pTabName;   // удалим старый мусор
      try
        OracleQuery1.Execute;
      except
        on E:Exception do
          TLog( 'ERROR ' + E.Message );
      end;
      OracleQuery1.SQL.Clear;
      OracleQuery1.SQL.Text := 'insert into pacs.'+pTabName+' ('+v_str1+') values ('+v_str2+')' ;

      vFIBDS.Database    := pFIBDatabase1 ;
      vFIBDS.Transaction := pFIBTransaction2 ;
      vFIBDS.SelectSQL.Clear;
      vFIBDS.SelectSQL.Text := 'select * from '+pTabName;
      pFIBTransaction2.StartTransaction;
      try
        vFIBDS.Open;
      except
        on E:Exception do
          TLog( 'ERROR ' + E.Message );
      end;
      cnt:=0;
      while not vFIBDS.Eof do
      begin
        vObjList := TList.Create;
        vFileList := TStringList.Create ;
        try
          Inc(cnt);
          if (cnt mod 1000)=0 then
            TLog( 'recno='+inttostr(cnt) );
          for I := 0 to vStr.Count - 1 do
            if vStr1[i]='VARYING' then
              OracleQuery1.DeclareAndSet( 'p'+vStr[i], otString, vFIBDS.FieldByName(vStr[i]).AsString )
            else if vStr1[i]='TIMESTAMP' then
              OracleQuery1.DeclareAndSet( 'p'+vStr[i], otDate, vFIBDS.FieldByName(vStr[i]).AsDateTime )
            else if vStr1[i]='TEXT' then
              OracleQuery1.DeclareAndSet( 'p'+vStr[i], otString, vFIBDS.FieldByName(vStr[i]).AsString )
            else if vStr1[i]='SHORT' then
              OracleQuery1.DeclareAndSet( 'p'+vStr[i], otInteger, vFIBDS.FieldByName(vStr[i]).AsInteger )
            else if vStr1[i]='LONG' then
              OracleQuery1.DeclareAndSet( 'p'+vStr[i], otInteger, vFIBDS.FieldByName(vStr[i]).AsInteger )
            else if vStr1[i]='DOUBLE' then
              OracleQuery1.DeclareAndSet( 'p'+vStr[i], otFloat, vFIBDS.FieldByName(vStr[i]).AsFloat )
            else if vStr1[i]='DATE' then
              OracleQuery1.DeclareAndSet( 'p'+vStr[i], otDate, vFIBDS.FieldByName(vStr[i]).AsDateTime )
            else if vStr1[i]='BLOB' then
            begin
              vFileName := ExtractFilePath(Application.ExeName)+inttostr(GetTickCount)+'.tmp';
              vFileList.Append(vFileName);
              TBlobField(vFIBDS.FieldByName(vStr[i])).SaveToFile(vFileName);
              vObjList.Add ( TLOBLocator.CreateTemporary(OracleSession1, otBLOB,True) );
              vi := vObjList.Count-1;
              TLOBLocator(vObjList[vi]).LoadFromFile(vFileList[vi]);
              OracleQuery1.DeclareVariable('p'+vStr[i], otBLOB );
              OracleQuery1.SetComplexVariable('p'+vStr[i], TLOBLocator(vObjList[vi]) );
            end
            else
            begin
              TLog('Не найден тип поля '+vStr1[i]);
              Exit;
            end;
          OracleQuery1.Execute;
          if (cnt mod 1000)=0 then OracleQuery1.Session.Commit;
        finally
          for j := 0 to vObjList.Count - 1 do
            TLOBLocator(vObjList[j]).Free;
          for j := 0 to vFileList.Count - 1 do
            if FileExists(vFileList[j]) then
              DeleteFile(vFileList[j]);
          vObjList.Free;
          vFileList.Free;
          OracleSession1.Commit;
        end;
        vFIBDS.Next;
      end;
    finally
      pFIBTransaction2.Commit;
    end;
  finally
    vStr.Free;
    vStr1.Free;
    vFIBQr.Free;
    vFIBDS.Free;
  end;
end;

procedure TForm1.pFrmSeq( pFld, pTab, pGen : string );
var vNumMax, vSeq, i : Integer;
label l1;
begin
  TLog('Выравниваем последовательность '+pGen+' таблицы '+pTab);
  with TOracleQuery.Create(nil) do
  try
    Session := OracleSession1;
    SQL.Text := 'Select Max('+pFld+') as nn from '+pTab;
    Execute;
    if Eof then
      vNumMax:=0
    else
      vNumMax:=FieldAsInteger('nn');
  finally
    Free;
  end;
  i:=0; vSeq:=0;
  l1:
  with TOracleQuery.Create(nil) do
  try
    Inc(i);
    if (i mod 1000)=0 then
      TLog( 'seq : '+floattostr(RoundTo(100*(vSeq)/vNumMax,-2))+' : '+inttostr(vSeq+i)+' / '+inttostr(vNumMax) );
    Session := OracleSession1;
    SQL.Text := 'Select '+pGen+'.nextval as nnn from dual';
    Execute;
    vSeq:=FieldAsInteger('nnn');
  finally
    Free;
  end;
  if vSeq<=vNumMax then goto l1;
end;

procedure TForm1.Button2Click(Sender: TObject);
var vTabName : string;
begin  // Перенос ORACLE
  Memo1.Clear;
  pFIBTransaction1.StartTransaction;
  try
    TLog('перенос начат');
    pFIBQuery1.SQL.Text := c_sql_tables ;
    pFIBQuery1.Database    := pFIBDatabase1 ;
    pFIBQuery1.Transaction := pFIBTransaction1 ;
    pFIBQuery1.ExecQuery;
    while not pFIBQuery1.Eof do
    begin
      vTabName := trim(pFIBQuery1.FieldByName('tbname').AsString) ;
      if Pos('$',vTabName)<=0 then  // не рассматриваем мусор
      begin
        TLog('перенос таблицы '+vTabName);
        try
          tbRswp(vTabName);
        except
          on E:Exception do
            MessageDlg('ERROR : таблица '+vTabName+' '+E.Message, mtError, [mbOK], 0);
        end;
      end;
      pFIBQuery1.Next;
    end;
    pFrmSeq( 'FK_ID', 'CONCLUSIONS', 'GEN_CONCLUSIONS_ID');
    pFrmSeq( 'FK_ID', 'DEVICES', 'GEN_DEVICES_ID');
    pFrmSeq( 'FK_ID', 'EVENTS', 'GEN_EVENTS_ID');
    pFrmSeq( 'FK_ID', 'EVENTS_RSND', 'GEN_EVENTS_RSND_ID');
    pFrmSeq( 'FK_ID', 'EVENTS_WL', 'GEN_EVENTSWL_ID');
    pFrmSeq( 'P_ID',  'HOSPITALS', 'GEN_HOSPITALS_ID');
    pFrmSeq( 'FK_ID', 'RULES', 'GEN_RULES_ID');
    pFrmSeq( 'FK_ID', 'TEMPLATES', 'GEN_TEMPLATES_ID');
    pFrmSeq( 'FK_ID', 'USERS', 'GEN_USERS_ID');
    pFrmSeq( 'FK_ID', 'WORKLIST', 'GEN_WORKLIST_ID');
  finally
    pFIBTransaction1.Commit;
    TLog('перенос закончен');
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
  procedure UniPostgreClrTbl ( pTab : string );
  begin
    TLog('Очитска таблицы '+pTab );
    with TUniQuery.Create(nil) do
    try
      Connection := UniConnection1;
      Transaction := UniTransaction1;
      if not UniTransaction1.Active then
        UniTransaction1.StartTransaction;
      SQL.Text := 'delete from '+edSchemaPostgres.Text+'.'+pTab;
      ExecSQL;
      UniTransaction1.Commit;
      TLog('Успешно ...' );
    finally
      Free;
    end;
  end;
begin  //  Очитска
  UniPostgreClrTbl ( 'patients' );
  UniPostgreClrTbl ( 'studies' );
  UniPostgreClrTbl ( 'series' );
  UniPostgreClrTbl ( 'images' );
  UniPostgreClrTbl ( 'events' );
  UniPostgreClrTbl ( 'events_rsnd' );
  UniPostgreClrTbl ( 'events_rsnd_err_lst' );
  UniPostgreClrTbl ( 'conclusions' );
  UniPostgreClrTbl ( 'applytable' );
end;

procedure TForm1.pFrmSeqPostgres( pFld, pTab, pGen : string );
var vNumMax, vSeq, i : Integer;
label l1;
begin
  TLog('Выравниваем последовательность '+pGen+' таблицы '+pTab);
  with TUniQuery.Create(nil) do
  try
    Connection := UniConnection1;
    Transaction := UniTransaction1;
    if not UniTransaction1.Active then
      UniTransaction1.StartTransaction;
    SQL.Text := 'Select Max('+pFld+') as nn from '+pTab;
    Open; First;
    if Eof then
      vNumMax:=0
    else
      vNumMax:=FieldByName('nn').AsInteger;
    Close;
    UniTransaction1.Commit;
  finally
    Free;
  end;
  i:=0; vSeq:=0;
  l1:
  with TUniQuery.Create(nil) do
  try
    Connection := UniConnection1;
    Transaction := UniTransaction1;
    if not UniTransaction1.Active then
      UniTransaction1.StartTransaction;
    Inc(i);
    if (i mod 1000)=0 then
      TLog( 'seq : '+floattostr(RoundTo(100*(vSeq)/vNumMax,-2))+' : '+inttostr(vSeq+i)+' / '+inttostr(vNumMax) );
    SQL.Text := 'Select nextval('''+vPostgreSchema+'.'+pGen+''') as nnn';
    Open; First;
    vSeq:=FieldByName('nnn').AsInteger;
    Close;
    UniTransaction1.Commit;
  finally
    Free;
  end;
  if vSeq<=vNumMax then goto l1;
end;

procedure TForm1.ConvertANSIFileToUTF8File(AInputFileName, AOutputFileName: TFileName);
var
  Strings: TStringList;
begin
  Strings := TStringList.Create;
  try
    Strings.LoadFromFile(AInputFileName);
    Strings.Text := UTF8Encode(Strings.Text);
    Strings.SaveToFile(AOutputFileName);
  finally
    Strings.Free;
  end;
end;

procedure TForm1.tbPostgresRswp( pTabName : string );
var v_str1, v_str2, vfname : AnsiString;
    vStr, vStr1 : TStringList;
    i,cnt : Integer;
    vFIBQr : TpFIBQuery;
    vFIBDS : TpFIBDataSet;
begin
  pFIBTransaction2.StartTransaction;
  vStr := TStringList.Create;
  vStr1 := TStringList.Create;
  vFIBQr:= TpFIBQuery.Create(nil);
  vFIBDS := TpFIBDataSet.Create(nil);
  try
    try
      vFIBQr.Database    := pFIBDatabase1 ;
      vFIBQr.Transaction := pFIBTransaction2 ;
      vFIBQr.SQL.Clear;
      vFIBQr.SQL.Text := c_sql_fields ;
      vFIBQr.ParamByName('pTabName').AsString := pTabName;
      vFIBQr.ExecQuery;
      v_str1:='';
      while not vFIBQr.Eof do
      begin
        vfname:=Trim(vFIBQr.FieldByName('fname').AsString);
        v_str1:=v_str1+vfname+',';
        v_str2:=v_str2+':p'+vfname+',';
        vStr.Append(vfname);
        vStr1.Append(Trim(vFIBQr.FieldByName('tname').AsString));
        vFIBQr.Next;
      end;
      v_str1:=Copy(v_str1,1,length(v_str1)-1);
      v_str2:=Copy(v_str2,1,length(v_str2)-1);
      vFIBQr.Close;
      UniQuery1.SQL.Clear;
      UniQuery1.Params.Clear;
      UniQuery1.SQL.Text := 'truncate table '+vPostgreSchema+'.'+LowerCase(pTabName);   // удалим старый мусор
      try
        UniQuery1.Execute;
        UniTransaction1.Commit;
        UniTransaction1.StartTransaction;
      except
        on E:Exception do
          TLog( 'ERROR ' + E.Message );
      end;
      UniQuery1.SQL.Clear;
      UniQuery1.Params.Clear;
      UniQuery1.SQL.Text := 'insert into '+vPostgreSchema+'.'+pTabName+' ('+v_str1+') values ('+v_str2+')' ;

      vFIBDS.Database    := pFIBDatabase1 ;
      vFIBDS.Transaction := pFIBTransaction2 ;
      vFIBDS.SelectSQL.Clear;
      vFIBDS.SelectSQL.Text := 'select * from '+pTabName;
      pFIBTransaction2.StartTransaction;
      try
        vFIBDS.Open;
      except
        on E:Exception do
          TLog( 'ERROR ' + E.Message );
      end;
      cnt:=0;
      while not vFIBDS.Eof do
      begin
          Inc(cnt);
          if (cnt mod 1000)=0 then
            TLog( 'recno='+inttostr(cnt) );
          for I := 0 to vStr.Count - 1 do
            if vStr1[i]='VARYING' then
              UniQuery1.ParamByName('p'+vStr[i]).AsString := vFIBDS.FieldByName(vStr[i]).AsString
            else if vStr1[i]='TIMESTAMP' then
              UniQuery1.ParamByName('p'+vStr[i]).AsDateTime := vFIBDS.FieldByName(vStr[i]).AsDateTime
            else if vStr1[i]='TEXT' then
              UniQuery1.ParamByName('p'+vStr[i]).AsString := vFIBDS.FieldByName(vStr[i]).AsString
            else if vStr1[i]='SHORT' then
              UniQuery1.ParamByName('p'+vStr[i]).AsInteger := vFIBDS.FieldByName(vStr[i]).AsInteger
            else if vStr1[i]='LONG' then
              UniQuery1.ParamByName('p'+vStr[i]).AsInteger := vFIBDS.FieldByName(vStr[i]).AsInteger
            else if vStr1[i]='DOUBLE' then
              UniQuery1.ParamByName('p'+vStr[i]).AsString := vFIBDS.FieldByName(vStr[i]).AsString
            else if vStr1[i]='DATE' then
              UniQuery1.ParamByName('p'+vStr[i]).AsDateTime := vFIBDS.FieldByName(vStr[i]).AsDateTime
            else if vStr1[i]='BLOB' then
            begin
              vfname:= ExtractFilePath(Application.ExeName)+inttostr(GetTickCount)+'.tmp';
              try
                TBlobField(vFIBDS.FieldByName(vStr[i])).SaveToFile(vfname);
                ConvertANSIFileToUTF8File(vfname,vfname+'1');
                UniQuery1.ParamByName('p'+vStr[i]).LoadFromFile( vfname+'1', ftBlob );
              finally
                DeleteFile(vfname);
                DeleteFile(vfname+'1');
              end;
            end
            else
            begin
              TLog('Не найден тип поля '+vStr1[i]);
              Exit;
            end;
          UniQuery1.ExecSQL;
          if (cnt mod 1000)=0 then
          begin
            UniTransaction1.Commit;
            UniTransaction1.StartTransaction;
          end;
        vFIBDS.Next;
      end;
    finally
      UniTransaction1.Commit;
      UniTransaction1.StartTransaction;
    end;
  finally
    vStr.Free;
    vStr1.Free;
    vFIBQr.Free;
    vFIBDS.Free;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var vTabName : string;
begin  // Перенос Postgres
  Memo1.Clear;
  pFIBTransaction1.StartTransaction;
  try
    TLog('перенос начат');
    pFIBQuery1.SQL.Text := c_sql_tables ;
    pFIBQuery1.Database    := pFIBDatabase1 ;
    pFIBQuery1.Transaction := pFIBTransaction1 ;
    pFIBQuery1.ExecQuery;
    UniTransaction1.StartTransaction;
    while not pFIBQuery1.Eof do
    begin
      vTabName := trim(pFIBQuery1.FieldByName('tbname').AsString) ;
      if Pos('$',vTabName)<=0 then  // не рассматриваем мусор
      begin
        TLog('перенос таблицы '+vTabName);
        try
          tbPostgresRswp(vTabName);
        except
          on E:Exception do
            MessageDlg('ERROR : таблица '+vTabName+' '+E.Message, mtError, [mbOK], 0);
        end;
      end;
      pFIBQuery1.Next;
    end;
    pFrmSeqPostgres( 'fk_id', 'conclusions', 'gen_conclusions_id');
    pFrmSeqPostgres( 'fk_id', 'devices',     'gen_devices_id');
    pFrmSeqPostgres( 'fk_id', 'devices',     'gen_diagnoz_id');
    pFrmSeqPostgres( 'fk_id', 'events',      'gen_events_id');
    pFrmSeqPostgres( 'fk_id', 'events_rsnd', 'gen_events_rsnd_id');
    pFrmSeqPostgres( 'fk_id', 'events_wl',   'gen_eventswl_id');
    pFrmSeqPostgres( 'p_id',  'hospitals',   'gen_hospitals_id');
    // patients
    pFrmSeqPostgres( 'fk_id', 'rules',       'gen_rules_id');
    pFrmSeqPostgres( 'fk_id', 'templates',   'gen_templates_id');
    pFrmSeqPostgres( 'fk_id', 'users',       'gen_users_id');
    pFrmSeqPostgres( 'fk_id', 'worklist',    'gen_worklist_id');
  finally
    pFIBTransaction1.Commit;
    TLog('перенос закончен');
  end;
end;

procedure TForm1.btnConnPostgresClick(Sender: TObject);
begin // connect to Postgres
  UniConnection1.Server   := edServerPostgres.Text ;
  UniConnection1.Port     := StrToInt( Trim( edPortPostgres.Text ) ) ;
  UniConnection1.Database := edDatabasePostgres.Text ;
  UniConnection1.Username := edUserPostgres.Text ;
  UniConnection1.Password := edPasswPostgres.Text ;
  vPostgreSchema := edSchemaPostgres.Text ;
  UniConnection1.SpecificOptions.Values['Schema'] := vPostgreSchema;
  UniConnection1.SpecificOptions.Values['UseUnicode'] := 'True';
  try
    UniConnection1.Connect;
  except
    on E:Exception do
      TLog( 'ERROR ' + E.Message );
  end;
  btnConnPostgres.Caption := 'Connected';
  btnConnPostgres.Enabled := False;
end;

procedure TForm1.btnConnORAClick(Sender: TObject);
begin
  OracleSession1.LogonUsername := edUser.Text ;
  OracleSession1.LogonPassword := edPsw.Text ;
  OracleSession1.LogonDatabase := edSchema.Text ;
  try
    OracleSession1.Connected:=True;
  except
    on E:Exception do
      TLog( 'ERROR ' + E.Message );
  end;
  btnConnORA.Caption := 'Connected';
  btnConnORA.Enabled := False;

end;

procedure TForm1.btnConnFBClick(Sender: TObject);
begin // firebird Connect
  if ((Trim(edDBFB.Text)='') or (not FileExists(edDBFB.Text))) then Exit;

  pFIBDatabase1.DBName := 'localhost:'+edDBFB.Text ;
  pFIBDatabase1.DBParams.Clear;
  pFIBDatabase1.DBParams.Append('user_name='+edFBUsername.Text);
  pFIBDatabase1.DBParams.Append('password='+adPswFB.Text);
  try
    pFIBDatabase1.Connected:=True;
  except
    on E:Exception do
      TLog( 'ERROR ' + E.Message );
  end;
  btnConnFB.Caption := 'Connected';
  btnConnFB.Enabled := False;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if pFIBDatabase1.Connected then pFIBDatabase1.Connected:=False;
  if OracleSession1.Connected then OracleSession1.Connected:=False;
  if UniConnection1.Connected then UniConnection1.Connected:=False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=0;
end;

end.
