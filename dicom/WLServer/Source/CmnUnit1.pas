unit CmnUnit1;

interface 

Uses SysUtils, DCM_Attributes, Classes, DateUtils, pFIBQuery, FIBDatabase, fMain,
     pFIBProps, Registry, Windows, Variants, IBDatabase, IBCustomDataSet, IBQuery,
     pFIBDatabase, IniFiles, DCM_Server, Uni, DB_CMN ;

// ������� ������������ ������ �� ������� � SQL-�������
function lg_SQL1( const FIBQuery:TIBQuery; const p_ClassName:AnsiString; const p_Message:AnsiString ):AnsiString;

// ������� ������������ ������ �� ������� � SQL-�������
function lg_SQL( const FIBQuery:TpFIBQuery; const p_ClassName:AnsiString; const p_Message:AnsiString ):AnsiString;

function TranslitEng( const s: AnsiString ): ansistring;

// ��������� ��������� ������� ������������
procedure f_upd_status( const p_BSTATE: ansistring; const P_PID: ansistring; const p_UIDFIELD: ansistring; AClientThread: TDicomClientThread );

{ ������� �������� AETITLE ����������� � ������ devices
}
function chk_AETITLE_lst ( const p_aetitle : ansistring; const p_AAddress: ansistring;
                            AClientThread: TDicomClientThread ) : Boolean;

{ ��������� ������ ���������� �� ��������
}
//procedure Read_Registry_Params;

{ ������ ������� � ������� events_wl
  ��������� :
  sEvent - �������
  nType - ��� ������� (1-DicomAssociation, 2-DicomFind)
  dDate - ����/����� �������
  sRemark - �����������
}
procedure EventLogIns( const sEvent: ansistring; const nType: Integer; const dDate: TDateTime; const sRemark: ansistring; AClientThread: TDicomClientThread=nil );

{ ��������� ��� ������ � ���� ��������� ��������� �������
  ��������� :
    p_strs     : ansistring  - ������ ������� ����������
    p_filename : ansistring  - ��� ����� - ��-���������  myevents.log � �������� ���������
    p_is_delim : Boolean     - ������ ����������� ����� ����������� - ��-��������� - ���
                               (������ ������������ ����� � ��������� ����� �����)
}
procedure Lg_ev ( const p_strs : ansistring;
                  const p_filename : ansistring = '';
                  const p_is_delim : Boolean = False );

{ ��������� ������ � ��� ������
}
procedure Log_ins( const p_strs : AnsiString;
                   const p_filename : ansistring = '' );

{ ������ ���� ������������
}
procedure Log_test_ins( const p_strs : AnsiString;
                        const p_filename : ansistring = '' );

{ ��������� ���������������� ������ ����� DICOM-������������
}
procedure ds_sav ( const ADataset: TDicomAttributes;
                   const ARequestDatasets: TList = nil;
                   const AResponseDatasets: TList = nil;
                   const p_suffix : string = '.dcm' );
                   
// ������� �������� ������ � ������������� �������� � ������ ��������
function f_strtoint ( const p_val:AnsiString ) : Integer;

// ������� "�������������� ����������"
procedure CmtTrans (const p_Trans : TpFIBTransaction);

procedure ini_log_read;

// ��� ������� �������� � ������� ������ * �� %
function SpSymbRepl (const p_str : AnsiString ):AnsiString;

// ����������� ������� � ���� �������� �����
procedure ShowBusy(blBusy: boolean);

const c_delim = '-------------------------------------------------------------------------------';
      // ������� ������������
      c_BSTATE_INPROGRESS = 1;
      c_BSTATE_COMPLETE   = 2;

var v_ds_i : Integer;
    //
    v_AE_TITLE_WL : AnsiString;
    v_chk_AETITLE : integer;

implementation

Uses Forms, Controls;

// ����������� ������� � ���� �������� �����
procedure ShowBusy(blBusy: boolean);
begin
   if blBusy then
      screen.cursor := crHourglass
   else
      screen.cursor := crDefault;
end;

// ��� ������� �������� � ������� ������ * �� %
function SpSymbRepl (const p_str : AnsiString ):AnsiString;
begin
  SpSymbRepl:=StringReplace(p_str,'*','%',[rfReplaceAll, rfIgnoreCase]);
end;

procedure ini_log_read;
const c_razd = '��������';
      c_dataset_log  = 'datasets in log files (1-��)';
      c_db_log       = 'events_wl (1-��)';
   //   c_txt_log      = 'log files (1-��)';
      c_4_razdel   = 'WORKLIST' ;
      c_4_1_IP_Worklist = 'IP_Worklist';
      c_4_2_PORT_Worklist   = 'PORT_Worklist';
      c_4_3_AETITLE_Worklist = 'AETITLE_Worklist';
      c_4_4_CheckAE_Worklist = 'CheckAE_Worklist';
      c_4_5_LOGWorklist = 'LOG_Worklist';
var Ini : TIniFile;
    v_Lis_ds_log,
    v_Lis_log,
    v_Lis_db_log : integer;
begin
  fMain.v_is_ds_log := True;  // �� ��������� �������� �������
  fMain.v_is_log    := True;
  fMain.v_is_db_log := True;
  Ini := TIniFile.Create(ExtractFilePath(paramstr(0))+'Settings.ini');
  try
    v_Lis_ds_log := Ini.ReadInteger(c_4_razdel, c_dataset_log, 0);
    v_Lis_db_log := Ini.ReadInteger(c_4_razdel, c_db_log     , 0);
    v_Lis_log    := Ini.ReadInteger(c_4_razdel, c_4_5_LOGWorklist    , 0);
    //
    Ini.WriteInteger(c_4_razdel, c_dataset_log,v_Lis_ds_log);
    Ini.WriteInteger(c_4_razdel, c_db_log     ,v_Lis_db_log);
    Ini.WriteInteger(c_4_razdel, c_4_5_LOGWorklist    ,v_Lis_log);
  finally
    Ini.Free;
  end;
  fMain.v_is_ds_log := (v_Lis_ds_log=1);
  fMain.v_is_log    := (v_Lis_log=1);
  fMain.v_is_db_log := (v_Lis_db_log=1);
end;

// ������� "�������������� ����������"
procedure CmtTrans (const p_Trans : TpFIBTransaction);
begin
  try
    if p_Trans.Active then begin
      p_Trans.Commit;
    end;
    p_Trans.StartTransaction;
  except
    on E : Exception do
      Lg_ev('ERROR '+E.ClassName+' CmtTrans - transaction error raised, with message : '+E.Message);
  end;
end;

procedure Lg_ev ( const p_strs : ansistring;
                  const p_filename : ansistring = '';
                  const p_is_delim : Boolean = False );
var F : TextFile;
    v_filename : ansistring;
begin
  if fMain.v_is_log then begin
    try
      if p_filename='' then begin
        v_filename:=ExtractFilePath(paramstr(0))+'WLevents.log';
      end else begin
        v_filename:=p_filename;
      end;
      if FileExists(v_filename) then begin
        AssignFile(F, v_filename);
        Append(F);
      end else begin
        AssignFile(F, v_filename);
        rewrite(F);
      end;
      if p_is_delim then writeln(F,c_delim);
      writeln(F,DateTimeToStr(Now)+' '+p_strs);
      CloseFile(F);
    except
      on E : Exception do
        EventLogIns('�������. error',
                  1,
                  Now,
                  E.ClassName+' error raised, with message : '+E.Message);
    end;
  end;
end;

procedure Log_ins( const p_strs : AnsiString;
                   const p_filename : ansistring = '' );
begin
  if trim(p_filename)='' then begin
    Lg_ev(p_strs,ExtractFilePath(paramstr(0))+'WLServer.log');
  end else begin
    Lg_ev(p_strs,p_filename);
  end;
end;

procedure Log_test_ins( const p_strs : AnsiString;
                        const p_filename : ansistring = '' );
begin
  if trim(p_filename)='' then begin
    Lg_ev(p_strs,ExtractFilePath(paramstr(0))+'WLTest.log');
  end else begin
    Lg_ev(p_strs,p_filename);
  end;
end;

procedure ds_sav ( const ADataset: TDicomAttributes;
                   const ARequestDatasets:  TList = nil;
                   const AResponseDatasets: TList = nil;
                   const p_suffix : string = '.dcm' );
var v_tm_str, v_dir : AnsiString; rq, rq1 : TDicomAttributes; v_TStr : TStringList; v_I:integer; //v_filename:AnsiString;
  function gt_filename (const p_str_in : ansistring) : AnsiString;
  begin
    gt_filename := v_dir +
                   inttostr(CmnUnit1.v_ds_i)+'_'+
                   v_tm_str+'_'+
                   p_str_in+'_'+
                   inttostr(v_I)+
                   p_suffix;
  end;
begin
  If fMain.v_is_ds_log then begin
    if ADataset<>nil then
    try
      inc(CmnUnit1.v_ds_i);
      v_tm_str:=inttostr(HourOf(Now))+inttostr(MinuteOf(Now))+inttostr(SecondOf(Now));
      v_dir:=ExtractFilePath(paramstr(0))+'WL_log\';
      if not DirectoryExists(v_dir) then begin
        CreateDir(v_dir);
      end;
      for v_I := 0 to ADataset.Count - 1 do begin
        ADataset.ItemByIndex[v_i].SaveToFile(gt_filename('ds'));
      end;
      v_I := 0;
      Lg_ev('ds '+inttostr(CmnUnit1.v_ds_i));
      //
      try
        v_TStr := TStringList.Create;
        v_TStr.Clear;
        ADataset.ListAttrinute('receive Command: ', v_TStr);
        v_TStr.SaveToFile(gt_filename('cmd'));
        //
        v_TStr.Clear;
        if ARequestDatasets<>nil then begin
          if ARequestDatasets.Count>0 then begin
            rq := TDicomAttributes(ARequestDatasets[0]);
            rq.ListAttrinute('Receive Data: ', v_TStr);
            v_TStr.SaveToFile(gt_filename('Rcv'));
          end;
        end;
        //
        v_TStr.Clear;
        if AResponseDatasets<>nil then begin
          if AResponseDatasets.Count>0 then begin
            rq1 := TDicomAttributes(AResponseDatasets[0]);
            rq1.ListAttrinute('Response Data: ', v_TStr);
            v_TStr.SaveToFile(gt_filename('rsp'));
          end;
        end;
        //
      finally
        FreeAndNil(v_TStr);
      end;
      //
    except
      on E : Exception do
        Lg_ev('error save dataset : '+E.ClassName+' error raised, with message : '+E.Message);
    end;
  end;
end;

function chk_AETITLE_lst ( const p_aetitle : ansistring; const p_AAddress: ansistring;
                            AClientThread: TDicomClientThread ) : Boolean;
var FIBQuery : TpFIBQuery; v_UniQr : TUniQuery;
    v_res : Boolean;
begin
  if DB_CMN.v_isPostgres then begin
    v_UniQr := TUniQuery.Create(nil);
    try
      if AClientThread=nil then begin
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
      end else begin
        v_UniQr.Connection:=AClientThread.PGconn;
        v_UniQr.Transaction:=AClientThread.PGTrans;
      end;
      v_UniQr.SQL.Text := 'select 1 from '+v_pg_Schema+'.DEVICES where '+gt_fld_name('DEVICES','FC_TITLE')+'=:FC_TITLE and FC_IP=:p_FC_IP';
      v_UniQr.ParamByName('FC_TITLE').AsString := UpperCase(p_aetitle);
      v_UniQr.ParamByName('p_FC_IP').AsString := UpperCase(p_AAddress);
      try
        v_UniQr.Transaction.StartTransaction;
        v_UniQr.ExecSQL;
        if v_UniQr.Transaction.Active then
              v_UniQr.Transaction.Commit;
      except
        on e:Exception do
          begin
            v_UniQr.Transaction.Rollback;
            Lg_ev(e.Message);
            Exit;
          end;
      end;
    finally
      v_UniQr.Free;
    end;
  end else begin
    try
      FIBQuery := TpFIBQuery.Create(nil);
      v_res:=False;
      if AClientThread=nil then begin
        FIBQuery.Database := DB;
        CmtTrans(DB_CMN.trRead);
        FIBQuery.Transaction := DB_CMN.trRead;
      end else begin
        FIBQuery.Database := (AClientThread.v_ClThr_DB as TFIBDatabase) ;
        CmtTrans(AClientThread.v_ClThr_trRead as TpFIBTransaction);
        FIBQuery.Transaction := (AClientThread.v_ClThr_trRead as TpFIBTransaction);
      end;
      FIBQuery.SQL.Clear;
      FIBQuery.SQL.Text := 'select 1 from DEVICES where FC_TITLE=:FC_TITLE and FC_IP=:p_FC_IP';
      FIBQuery.ParamByName('FC_TITLE').AsString := UpperCase(p_aetitle);
      FIBQuery.ParamByName('p_FC_IP').AsString := UpperCase(p_AAddress);
      try
        FIBQuery.ExecQuery;
        v_res:=not FIBQuery.Eof;
      except
        on e:Exception do
          begin
            Lg_ev('error in chk_AETITLE_lst: '+e.Message);
            chk_AETITLE_lst:=False;
            Exit;
          end;
      end;
    finally
      //
      CmtTrans(DB_CMN.trRead);
      //
      FIBQuery.Close;
      FreeAndNil(FIBQuery);
    end;
  end;
  chk_AETITLE_lst:=v_res;
end;

procedure EventLogIns( const sEvent: ansistring; const nType: Integer; const dDate: TDateTime; const sRemark: ansistring; AClientThread: TDicomClientThread=nil );
var FIBQuery : TpFIBQuery; v_UniQr : TUniQuery;
    v_str : ansistring;
begin
  if fMain.v_is_db_log then begin
    v_str := '';
    if v_isPostgres then begin
      v_UniQr := TUniQuery.Create(nil);
      try
        if AClientThread=nil then begin
          v_UniQr.Connection:=DB_CMN.PGconn;
          v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        end else begin
          v_UniQr.Connection:=AClientThread.PGconn;
          v_UniQr.Transaction:=AClientThread.PGTrans;
        end;
        v_UniQr.SQL.Text := 'INSERT INTO '+v_pg_Schema+'.events_wl ('+
                             gt_fld_name('EVENTS_WL','FC_NAME')+', '+
                             gt_fld_name('EVENTS_WL','FN_TYPE')+', '+
                             gt_fld_name('EVENTS_WL','FD_DATE')+', '+
                             gt_fld_name('EVENTS_WL','FC_REMARK')+') '+
                             ' VALUES(:FC_NAME, :FN_TYPE, :FD_DATE, :FC_REMARK) ';
        v_UniQr.ParamByName('FC_NAME').AsString := sEvent;
        v_UniQr.ParamByName('FN_TYPE').AsInteger := nType;
        v_UniQr.ParamByName('FD_DATE').AsDateTime := dDate;
        v_UniQr.ParamByName('FC_REMARK').AsString := sRemark;
        v_str := 'fc_name='+sEvent+'; fn_type='+IntToStr(nType)+'; fd_date='+DateTimeToStr(dDate)+'; fc_remark='+sRemark;
        Lg_ev(v_str);
        try
          v_UniQr.Transaction.StartTransaction;
          v_UniQr.ExecSQL;
          if v_UniQr.Transaction.Active then
              v_UniQr.Transaction.Commit;
        except
          on e:Exception do
            begin
              v_UniQr.Transaction.Rollback;
              Lg_ev(e.Message);
              Exit;
            end;
        end;
      finally
        v_UniQr.Free;
      end;
    end else begin
      try
        FIBQuery := TpFIBQuery.Create(nil);
        FIBQuery.Close;
        if AClientThread=nil then begin
          FIBQuery.Database := LOGDB;
          CmtTrans(DB_CMN.LOGtrWrite);
          FIBQuery.Transaction := DB_CMN.LOGtrWrite;
        end else begin
          FIBQuery.Database := (AClientThread.v_ClThr_LOGDB as TFIBDatabase) ;
          CmtTrans(AClientThread.v_ClThr_LOGtrWrite as TpFIBTransaction);
          FIBQuery.Transaction := (AClientThread.v_ClThr_LOGtrWrite as TpFIBTransaction);
        end;
        //
        FibQuery.Options := FibQuery.Options + [qoAutoCommit];
        FIBQuery.SQL.Clear;
        FIBQuery.SQL.Text := ' INSERT INTO EVENTS_WL(FC_NAME, FN_TYPE, FD_DATE, FC_REMARK) '+#13+
                             ' VALUES(:FC_NAME, :FN_TYPE, :FD_DATE, :FC_REMARK) ';
        FIBQuery.ParamByName('FC_NAME').AsString := sEvent;
        FIBQuery.ParamByName('FN_TYPE').AsInteger := nType;
        FIBQuery.ParamByName('FD_DATE').AsDateTime := dDate;
        FIBQuery.ParamByName('FC_REMARK').AsString := sRemark;
        v_str := 'fc_name='+sEvent+'; fn_type='+IntToStr(nType)+'; fd_date='+DateTimeToStr(dDate)+'; fc_remark='+sRemark;
        Lg_ev(v_str);
        try
          FIBQuery.ExecQuery;
        except
          on e:Exception do
            begin
              Lg_ev(e.Message);
              Exit;
            end;
        end;
      finally
        if AClientThread=nil then begin
          CmtTrans(DB_CMN.LOGtrWrite);
        end else begin
          CmtTrans(AClientThread.v_ClThr_LOGtrWrite as TpFIBTransaction);
        end;
        //
        FIBQuery.Close;
        FreeAndNil(FIBQuery);
      end;
    end;
  end;
end;
 {
procedure Read_Registry_Params;
const c_regkey_mn = '\Software\Softmaster\DicomServer';
      c_regkey = c_regkey_mn+'\';
      c_aetitle = 'AE_TITLE';
      c_IS_DEVICES_CHECK = 'IS_DEVICES_CHECK';
Var   v_Reg : TRegistry;
begin
  v_Reg := TRegistry.Create;
  Try 
    //���������� �������� � ��������  ��. Wow6432Node !!!
    v_Reg.RootKey := HKEY_LOCAL_MACHINE; //  HKEY_CURRENT_USER
    v_Reg.OpenKey(c_regkey_mn, true);
    try
      CmnUnit.v_AE_TITLE_WL:=v_Reg.ReadString(c_aetitle);
    except
    end;
    try
      CmnUnit.v_chk_AETITLE:=v_Reg.ReadInteger(c_IS_DEVICES_CHECK);
    except
      CmnUnit.v_chk_AETITLE:=f_strtoint(v_Reg.ReadString(c_IS_DEVICES_CHECK));
    end;

    Lg_ev('������������� v_AE_TITLE_WL='+CmnUnit.v_AE_TITLE_WL);
    Lg_ev('������������� v_chk_AETITLE='+inttostr(CmnUnit.v_chk_AETITLE));

    v_Reg.WriteString(c_aetitle,CmnUnit.v_AE_TITLE_WL);
    v_Reg.WriteInteger(c_IS_DEVICES_CHECK,CmnUnit.v_chk_AETITLE);

  Finally
    v_Reg.Free;
  End;
end;   }


 { Reg := TRegIniFile.Create;
//  Reg.RootKey:=HKEY_CURRENT_USER;
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  if not Reg.OpenKey(c_regkey, False) then Reg.CreateKey(c_regkey_mn);
  try
    CmnUnit.v_AE_TITLE_WL := Reg.ReadString(c_regkey_mn, c_aetitle,'');
    CmnUnit.v_chk_AETITLE := Reg.ReadInteger(c_regkey_mn, c_IS_DEVICES_CHECK,0);
    //
    Lg_ev('������������� v_AE_TITLE_WL='+CmnUnit.v_AE_TITLE_WL);
    Lg_ev('������������� v_chk_AETITLE='+inttostr(CmnUnit.v_chk_AETITLE));
    //
    Reg.WriteString(c_regkey_mn, c_aetitle,  CmnUnit.v_AE_TITLE_WL);
    Reg.WriteInteger(c_regkey_mn, c_IS_DEVICES_CHECK, CmnUnit.v_chk_AETITLE);
  finally
    Reg.CloseKey;
    FreeAndNil(Reg);
  end;   }


// ������� �������� ������ � ������������� �������� � ������ ��������
function f_strtoint ( const p_val:AnsiString ) : Integer;
begin
  if Trim(p_val)='' then begin
    f_strtoint:=0;
  end else begin
    try
      f_strtoint:=StrToInt(StringReplace(p_val,' ','',[rfReplaceAll, rfIgnoreCase]));
    except
      f_strtoint:=0;
    end;
  end;
end;

// ������� ������������ ������ �� ������� � SQL-�������
function lg_SQL( const FIBQuery:TpFIBQuery; const p_ClassName:AnsiString; const p_Message:AnsiString ):AnsiString;
var i:Integer; v_res, v_paramname : AnsiString;
const c_eol = #13;
begin
  if p_Message<>'' then begin
    v_res:='error raised : '+p_ClassName+' message : '+p_Message+' SQL: '''+FIBQuery.SQL.Text+''' '+c_eol;
  end else begin
    v_res:=' SQL: '''+FIBQuery.SQL.Text+''' '+c_eol;
  end;
  for I := 0 to FIBQuery.ParamCount - 1 do begin
    v_paramname:=FIBQuery.ParamName(i);
    if not VarIsNull(FIBQuery.ParamValue(v_paramname)) then
      v_res:= v_res + 'ParamName='''+v_paramname+''' ParamValue='''+vartostr(FIBQuery.ParamValue(v_paramname))+''''+c_eol;
  end;
  lg_SQL:= v_res;
end;

// ������� ������������ ������ �� ������� � SQL-�������
function lg_SQL1( const FIBQuery:TIBQuery; const p_ClassName:AnsiString; const p_Message:AnsiString ):AnsiString;
var i:Integer; v_res, v_paramname : AnsiString;
const c_eol = #13;
begin
  if p_Message<>'' then begin
    v_res:='error raised : '+p_ClassName+' message : '+p_Message+' SQL: '''+FIBQuery.SQL.Text+''' '+c_eol;
  end else begin
    v_res:=' SQL: '''+FIBQuery.SQL.Text+''' '+c_eol;
  end;
  for I := 0 to FIBQuery.ParamCount - 1 do begin
    v_paramname:=FIBQuery.Params.Items[i].Name;
    if not VarIsNull(FIBQuery.ParamByName(v_paramname).Value) then
      v_res:= v_res + 'ParamName='''+v_paramname+''' ParamValue='''+vartostr(FIBQuery.ParamByName(v_paramname).Value)+''''+c_eol;
  end;
  lg_SQL1:= v_res;
end;

// ��������� ��������� ������� ������������
procedure f_upd_status( const p_BSTATE: ansistring; const P_PID: ansistring; const p_UIDFIELD: ansistring; AClientThread: TDicomClientThread );
var FIBQuery : TpFIBQuery; v_UniQr : TUniQuery;
    v_str : ansistring;
begin
  v_str := '';
  if v_isPostgres then
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
      v_UniQr.SQL.Text := ' Update '+v_pg_Schema+'.applytable '+
        ' set '+gt_fld_name('APPLYTABLE','bstate')+'=:p_BSTATE where '+
        ' '+gt_fld_name('APPLYTABLE','patientid')+'=:P_PID and '+
        gt_fld_name('APPLYTABLE','uid')+'=:p_UIDFIELD ';
      v_UniQr.ParamByName('p_BSTATE').AsString := p_BSTATE;
      v_UniQr.ParamByName('P_PID').AsString := P_PID;
      v_UniQr.ParamByName('p_UIDFIELD').AsString := p_UIDFIELD;
      try
        v_UniQr.Transaction.StartTransaction;
        v_UniQr.ExecSQL;
        if v_UniQr.Transaction.Active then
              v_UniQr.Transaction.Commit;
      except
        on e:Exception do
          begin
            v_UniQr.Transaction.Rollback;
            Lg_ev(e.Message);
            Exit;
          end;
      end;
    finally
      v_UniQr.Free;
    end;
  end else
  begin
    try
      FIBQuery := TpFIBQuery.Create(nil);
      FIBQuery.Close;
      if AClientThread=nil then
      begin
        FIBQuery.Database := (AClientThread.v_ClThr_DB as TpFIBDatabase);
        FIBQuery.Transaction := (AClientThread.v_ClThr_trWrite as TpFIBTransaction);
      end else begin
        FIBQuery.Database := (AClientThread.v_ClThr_DB as TpFIBDatabase);
        FIBQuery.Transaction := (AClientThread.v_ClThr_trWrite as TpFIBTransaction);
      end;
      //
      CmtTrans(FIBQuery.Transaction as TpFIBTransaction);
      //
      FibQuery.Options := FibQuery.Options + [qoAutoCommit];
      FIBQuery.SQL.Clear;
      FIBQuery.SQL.Text := ' Update APPLYTABLE set BSTATE=:p_BSTATE where P_PID=:P_PID and UIDFIELD=:p_UIDFIELD ';
      FIBQuery.ParamByName('p_BSTATE').AsString := p_BSTATE;
      FIBQuery.ParamByName('P_PID').AsString := P_PID;
      FIBQuery.ParamByName('p_UIDFIELD').AsString := p_UIDFIELD;
      try
        FIBQuery.ExecQuery;
      except
        on e:Exception do
          begin
            Lg_ev(e.Message);
            Exit;
          end;
      end;
    finally
      //
      CmtTrans(AClientThread.v_ClThr_trWrite as TpFIBTransaction);
      //
      FIBQuery.Close;
      FreeAndNil(FIBQuery);
    end;
  end;
end;

function TranslitEng( const s: AnsiString ): ansistring;
var StrL, StrU : ansistring;
begin
  StrU := StringReplace((StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(s,
                       'ya', '�', [rfReplaceAll, rfIgnoreCase])),
                       'yu', '�', [rfReplaceAll, rfIgnoreCase])),
                       'e', '�', [rfReplaceAll, rfIgnoreCase])),
                       'eh', '�', [rfReplaceAll, rfIgnoreCase])),
                       'shh', '�', [rfReplaceAll, rfIgnoreCase])),
                       'sh', '�', [rfReplaceAll, rfIgnoreCase])),
                       'ch', '�', [rfReplaceAll, rfIgnoreCase])),
                       'zh', '�', [rfReplaceAll, rfIgnoreCase])),
                       'jo', '�', [rfReplaceAll, rfIgnoreCase])),
                       '''', '�', [rfReplaceAll, rfIgnoreCase])),
                       'y', '�', [rfReplaceAll, rfIgnoreCase])),
                       '"', '�', [rfReplaceAll, rfIgnoreCase])),
                       'h', '�', [rfReplaceAll, rfIgnoreCase])),
                       'c', '�', [rfReplaceAll, rfIgnoreCase])),
                       'f', '�', [rfReplaceAll, rfIgnoreCase])),
                       'u', '�', [rfReplaceAll, rfIgnoreCase])),
                       't', '�', [rfReplaceAll, rfIgnoreCase])),
                       's', '�', [rfReplaceAll, rfIgnoreCase])),
                       'r', '�', [rfReplaceAll, rfIgnoreCase])),
                       'p', '�', [rfReplaceAll, rfIgnoreCase])),
                       'o', '�', [rfReplaceAll, rfIgnoreCase])),
                       'n', '�', [rfReplaceAll, rfIgnoreCase])),
                       'm', '�', [rfReplaceAll, rfIgnoreCase])),
                       'l', '�', [rfReplaceAll, rfIgnoreCase])),
                       'k', '�', [rfReplaceAll, rfIgnoreCase])),
                       'j', '�', [rfReplaceAll, rfIgnoreCase])),
                       'i', '�', [rfReplaceAll, rfIgnoreCase])),
                       'z', '�', [rfReplaceAll, rfIgnoreCase])),
                       'd', '�', [rfReplaceAll, rfIgnoreCase])),
                       'g', '�', [rfReplaceAll, rfIgnoreCase])),
                       'v', '�', [rfReplaceAll, rfIgnoreCase])),
                       'b', '�', [rfReplaceAll, rfIgnoreCase])),
                       'a', '�', [rfReplaceAll, rfIgnoreCase]);

  StrL := StringReplace((StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(StrU,
                       'ya', '�', [rfReplaceAll, rfIgnoreCase])),
                       'yu', '�', [rfReplaceAll, rfIgnoreCase])),
                       'e', '�', [rfReplaceAll, rfIgnoreCase])),
                       'eh', '�', [rfReplaceAll, rfIgnoreCase])),
                       'shh', '�', [rfReplaceAll, rfIgnoreCase])),
                       'sh', '�', [rfReplaceAll, rfIgnoreCase])),
                       'ch', '�', [rfReplaceAll, rfIgnoreCase])),
                       'zh', '�', [rfReplaceAll, rfIgnoreCase])),
                       'jo', '�', [rfReplaceAll, rfIgnoreCase])),
                       '''', '�', [rfReplaceAll, rfIgnoreCase])),
                       'y', '�', [rfReplaceAll, rfIgnoreCase])),
                       '"', '�', [rfReplaceAll, rfIgnoreCase])),
                       'h', '�', [rfReplaceAll, rfIgnoreCase])),
                       'c', '�', [rfReplaceAll, rfIgnoreCase])),
                       'f', '�', [rfReplaceAll, rfIgnoreCase])),
                       'u', '�', [rfReplaceAll, rfIgnoreCase])),
                       't', '�', [rfReplaceAll, rfIgnoreCase])),
                       's', '�', [rfReplaceAll, rfIgnoreCase])),
                       'r', '�', [rfReplaceAll, rfIgnoreCase])),
                       'p', '�', [rfReplaceAll, rfIgnoreCase])),
                       'o', '�', [rfReplaceAll, rfIgnoreCase])),
                       'n', '�', [rfReplaceAll, rfIgnoreCase])),
                       'm', '�', [rfReplaceAll, rfIgnoreCase])),
                       'l', '�', [rfReplaceAll, rfIgnoreCase])),
                       'k', '�', [rfReplaceAll, rfIgnoreCase])),
                       'j', '�', [rfReplaceAll, rfIgnoreCase])),
                       'i', '�', [rfReplaceAll, rfIgnoreCase])),
                       'z', '�', [rfReplaceAll, rfIgnoreCase])),
                       'd', '�', [rfReplaceAll, rfIgnoreCase])),
                       'g', '�', [rfReplaceAll, rfIgnoreCase])),
                       'v', '�', [rfReplaceAll, rfIgnoreCase])),
                       'b', '�', [rfReplaceAll, rfIgnoreCase])),
                       'a', '�', [rfReplaceAll, rfIgnoreCase]);

  TranslitEng := UpperCase(StrL);
end;

end.
