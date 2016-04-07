unit fMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs, IniFiles,
  DB, DBAccess, Uni, UniProvider, MySQLUniProvider, ExtCtrls, Oracle, OracleData, RVEdit,
  RVStyle;

type
  TExchangeUZI = class(TService)
    UniConnection1: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
    Timer1: TTimer;
    os: TOracleSession;
    oqIns: TOracleQuery;
    oqUpd: TOracleQuery;
    odsZakl: TOracleDataSet;
    odsZaklFK_CODEISSL: TFloatField;
    odsZaklFB_TEXT: TMemoField;
    odsZaklFB_HTML: TMemoField;
    odsZaklFB_BLOB: TBlobField;
    rvs: TRVStyle;
    oqInsData: TOracleQuery;
    procedure ServiceExecute(Sender: TService);
    procedure Timer1Timer(Sender: TObject);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceShutdown(Sender: TService);
  private
    procedure Log_ins(p_strs : AnsiString; p_filename : ansistring = '');
    procedure MnLg_ev(p_strs : ansistring; p_filename : ansistring = ''; p_is_delim : Boolean = False; p_is_DT : boolean = True);
    procedure DoZakl(nID : Integer; v_str : WideString; nType : Integer);
    { Private declarations }
  public
    sHost, sLogin, sPass, sAlias : string;
    nPort, nTimer : Integer;
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  ExchangeUZI: TExchangeUZI;

implementation

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ExchangeUZI.Controller(CtrlCode);
end;

procedure TExchangeUZI.DoZakl(nID: Integer; v_str : WideString; nType : Integer);
var memStream : TMemoryStream;
    sl : TStringList;
    rve : TRichViewEdit;
begin
  odsZakl.Close;
  odsZakl.SetVariable('fk_codeissl', nID);
  odsZakl.Open;
  memStream := TMemoryStream.Create;
  memStream.Position := 0;
  rve := TRichViewEdit.Create(nil);
  rve.Style := rvs;

  sl := TStringList.Create;
  try
    sl.Add(v_str);
    sl.SaveToStream(memStream);
    if nType = 1 then
      odsZakl.Insert
    else
      odsZakl.Edit;
// -- ���������� � �����
    TBlobField(odsZakl.FieldByName('fb_text')).LoadFromStream(memStream);
    memStream.Position := 0;
// -- ���������� � HTML
    rve.LoadTextFromStream(memStream, 0, 0, True);
    memStream.Position := 0;
    rve.SaveHTMLToStream(memStream, '', '', '', [rvsoOverrideImages,rvsoMiddleOnly,rvsoUseCheckpointsNames]);
    memStream.Position := 0;
    TBlobField(odsZakl.FieldByName('fb_html')).LoadFromStream(memStream);
// -- ���������� � BLOB
    memStream.Position := 0;
    rve.SaveRVFToStream(memStream, False);
    memStream.Position := 0;
    TBlobField(odsZakl.FieldByName('fb_blob')).LoadFromStream(memStream);
    odsZakl.FieldByName('fk_codeissl').AsInteger := nID;
    try
      odsZakl.Post;
    except
      on e:Exception do
        begin
          Log_ins('error odsZakl.Post error: '+E.ClassName+' with message : '+E.Message);
          Exit;
        end;
    end;
  finally
    memStream.Free;
    sl.Free;
    rve.Free;
  end;
end;

function TExchangeUZI.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TExchangeUZI.Log_ins(p_strs, p_filename: ansistring); // ����
begin
  if trim(p_filename)='' then
    begin
      MnLg_ev(p_strs,ExtractFilePath(paramstr(0))+'ExchangeService.log');
    end else
    begin
      MnLg_ev(p_strs,p_filename);
    end;
end;

procedure TExchangeUZI.MnLg_ev(p_strs, p_filename: ansistring; p_is_delim, p_is_DT: boolean); // ����
var F : TextFile;
const c_delim = '-------------------------------------------------------------------------------';
begin
  try
    if Trim(p_filename)<>'' then
      begin
        if FileExists(p_filename) then
          begin
            AssignFile(F, p_filename);
            Append(F);
          end else
          begin
            AssignFile(F, p_filename);
            rewrite(F);
          end;
        if p_is_delim then
          writeln(F,c_delim);
        if p_is_DT then
          writeln(F,DateTimeToStr(Now)+' '+p_strs)
      else
        writeln(F,p_strs);
        Flush(F);
        CloseFile(F);
      end;
  except
    on E:Exception do begin
      try
        AssignFile(F, p_filename+'_err');
        Append(F);
        writeln(F,DateTimeToStr(Now)+' ERROR : '+E.Message);
        writeln(F,DateTimeToStr(Now)+' original message : '+p_strs);
        Flush(F);
        CloseFile(F);
      except
      end;
    end;
  end;
end;

procedure TExchangeUZI.ServiceExecute(Sender: TService); // ������ �������, ����������� � ��
var Ini : TIniFile;
begin
//  sleep(10000);  // !!! ����� ��� ������, ��������� ������ � �������, ����� ����� � ������ � ������ attach
//-- 1. ��������� ���������
  Log_ins('Read settings');
  Ini := TIniFile.Create(ExtractFilePath(paramstr(0))+'ExchangeSettings.ini');
  try
    sHost := Ini.ReadString('MAIN', 'HOST', '');
    nPort := Ini.ReadInteger('MAIN', 'PORT', 0);
    sLogin := Ini.ReadString('MAIN', 'LOGIN', '');
    sPass := Ini.ReadString('MAIN', 'PASS', '');
    sAlias := Ini.ReadString('MAIN', 'ALIAS', '');
    nTimer := Ini.ReadInteger('TIMER', 'INTERVAL', 0);
  finally
    Ini.Free;
  end;
  Log_ins('---Host='+sHost);
  Log_ins('---Port='+IntToStr(nPort));
  Log_ins('---Login='+sLogin);
  Log_ins('---Pass='+sPass);
  Log_ins('---Alias='+sAlias);
  Log_ins('---Timer interval='+IntToStr(nTimer));
  Log_ins('End read settings');
//-- 2. ������� � ����������� � ��
  Log_ins('Start connect database MySQL');
  if Trim(sHost)='' then
    begin
      Log_ins('�� ����� IP ����� MySQL ������� � ����� '+ExtractFilePath(paramstr(0))+'ExchangeSettings.ini');
      Exit;
    end;
  if Trim(IntToStr(nPort))='' then
    begin
      Log_ins('�� ����� ���� MySQL ������� � ����� '+ExtractFilePath(paramstr(0))+'ExchangeSettings.ini');
      Exit;
    end;
  if Trim(sLogin)='' then
    begin
      Log_ins('�� ����� LOGIN MySQL ������� � ����� '+ExtractFilePath(paramstr(0))+'ExchangeSettings.ini');
      Exit;
    end;
  if Trim(sPass)='' then
    begin
      Log_ins('�� ����� PASSWORD MySQL ������� � ����� '+ExtractFilePath(paramstr(0))+'ExchangeSettings.ini');
      Exit;
    end;
  if Trim(sAlias)='' then
    begin
      Log_ins('�� ����� ALIAS MySQL ������� � ����� '+ExtractFilePath(paramstr(0))+'ExchangeSettings.ini');
      Exit;
    end;

  UniConnection1.Server := sHost;
  UniConnection1.Port := nPort;
  UniConnection1.Username := sLogin;
  UniConnection1.Password := sPass;
  UniConnection1.Database := sAlias;
  try
    UniConnection1.Connected := True;
  except
    on e:Exception do
      begin
        Log_ins('error connect to database ALIAS='+UniConnection1.Database+' error: '+E.ClassName+' with message : '+E.Message);
        Exit;
      end;
  end;
  Log_ins('Connected to database MySQL');

  Log_ins('Start connect database Oracle');
  try
    os.Connected := True;
  except
    on e:Exception do
      begin
        Log_ins('error connect to database Oracle error: '+E.ClassName+' with message : '+E.Message);
        Exit;
      end;
  end;
  Log_ins('Connected to database Oracle');
  Log_ins('End start server');
  Log_ins('End start service');
  Timer1.Interval := nTimer;
  Timer1.Enabled := True;
  while not terminated do
    ServiceThread.ProcessRequests(True);
end;

procedure TExchangeUZI.ServiceShutdown(Sender: TService);
begin
  Log_ins('!!! Service shutdown');
end;

procedure TExchangeUZI.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  Log_ins('!!! Service stop');
end;

procedure TExchangeUZI.Timer1Timer(Sender: TObject); // ������� ������������
var qSel : TUniQuery;
    ods : TOracleDataSet;
    DateEdit, DateSave : TDateTime;
begin
  qSel := TUniQuery.Create(nil);
  qSel.Connection := UniConnection1;
  try
// -- ������� ������������ ��� ��������
    qSel.SQL.Text := ' select * from ������������, �������� '+#13+
                     '  where ������������.`�������������������` = ������������.`���������������` '+#13+
                     '    and date_format(������������.`����������������`, ''%d.%m.%Y'') = date_format(now(), ''%d.%m.%Y'') '+#13+
                     '    and ������������.`�����������` = ��������.`�����������` ';
    qSel.Execute;
    if qSel.RecordCount > 0 then
      begin
//        Log_ins('������� ������� ��� �������� '+IntToStr(qSel.RecordCount));
        qSel.First;
          while not qSel.Eof do
            begin
              ods := TOracleDataSet.Create(nil);
              try
                ods.Session := os;
                ods.SQL.Text := ' select * from asu.texch_uzi_tomsk where fn_codeissl = :pfn_codeissl ';
                ods.DeclareAndSet('pfn_codeissl', otInteger, qSel.FieldByName('���������������').AsInteger);
                ods.Open;
                DateEdit := ods.FieldByName('fd_timeedit').AsDateTime;
                DateSave := ods.FieldByName('fd_timesave').AsDateTime;
                if ods.RecordCount = 0 then // ���� ��� �� ���������� ������������, �� INSERT ============================
                  begin
                    oqIns.SetVariable('pfn_codeissl', qSel.FieldByName('���������������').AsInteger);
                    oqIns.SetVariable('pfn_codepac', qSel.FieldByName('�����������').AsInteger);
                    oqIns.SetVariable('pfn_codesotr', qSel.FieldByName('��������').AsInteger);
                    oqIns.SetVariable('pfd_dateissl', qSel.FieldByName('����������������').AsDateTime);
                    oqIns.SetVariable('pfn_codeotdel', qSel.FieldByName('������������').AsInteger);
                    oqIns.SetVariable('pfn_codeblank', qSel.FieldByName('���������').AsInteger);
                    oqIns.SetVariable('pfd_timeedit', qSel.FieldByName('�������������������').AsDateTime);
                    oqIns.SetVariable('pfd_timesave', qSel.FieldByName('���������������').AsDateTime);
                    if (qSel.FieldByName('������������').AsInteger = 6) or (qSel.FieldByName('������������').AsInteger = 10) then // !!! ��������������� ���������
                      oqIns.SetVariable('pfn_typepac', 2)
                    else
                      oqIns.SetVariable('pfn_typepac', 1);
                    oqIns.SetVariable('pfc_fam', qSel.FieldByName('���������������').AsString);
                    oqIns.SetVariable('pfc_name', qSel.FieldByName('�����������').AsString);
                    oqIns.SetVariable('pfc_otch', qSel.FieldByName('����������������').AsString);
                    oqIns.SetVariable('pfd_rojd', trunc(qSel.FieldByName('������������').AsDateTime));
                    try
                      oqIns.Execute;
                    except
                      on e:Exception do
                        begin
                          Log_ins('error insert error: '+E.ClassName+' with message : '+E.Message);
                          Exit;
                        end;
                    end;
                    DoZakl(qSel.FieldByName('���������������').AsInteger, qSel.FieldByName('����������').AsWideString, 1); // -- ��������� ����������
                    oqInsData.SetVariable('pKodIssl', qSel.FieldByName('���������������').AsInteger);
                    oqInsData.SetVariable('pKodPac', qSel.FieldByName('�����������').AsInteger);
                    oqInsData.SetVariable('pKodSotr', qSel.FieldByName('��������').AsInteger);
                    oqInsData.SetVariable('pDate', qSel.FieldByName('����������������').AsDateTime);
                    oqInsData.SetVariable('pKodOtdel', qSel.FieldByName('������������').AsInteger);
                    oqInsData.SetVariable('pKodBlank', qSel.FieldByName('���������').AsInteger);
                    if (qSel.FieldByName('������������').AsInteger = 6) or (qSel.FieldByName('������������').AsInteger = 10) then // !!! ��������������� ���������
                      oqInsData.SetVariable('pType', 2)
                    else
                      oqInsData.SetVariable('pType', 1);
                    oqInsData.SetVariable('pFam', qSel.FieldByName('���������������').AsString);
                    oqInsData.SetVariable('pIm', qSel.FieldByName('�����������').AsString);
                    oqInsData.SetVariable('pOtch', qSel.FieldByName('����������������').AsString);
                    oqInsData.SetVariable('pDateRojd', trunc(qSel.FieldByName('������������').AsDateTime));
                    oqInsData.SetVariable('pNazID', ods.FieldByName('fk_nazid').AsInteger);
                    oqInsData.SetVariable('pSex', qSel.FieldByName('���').AsString);
                    try
                      oqInsData.Execute;
                    except
                      on e:Exception do
                        begin
                          Log_ins('error insert error: '+E.ClassName+' with message : '+E.Message);
                          Exit;
                        end;
                    end;
                  end else // ���� � ��� � ���� ��� ���� ����� ������������ ���������� ���� �� ��������� � ���� ���� ������ UPDATE =============================
                  begin
                    if (DateEdit <> qSel.FieldByName('�������������������').AsDateTime) and (DateSave <> qSel.FieldByName('���������������').AsDateTime) then
                      begin
                        oqUpd.SetVariable('pfd_timeedit', qSel.FieldByName('�������������������').AsDateTime);
                        oqUpd.SetVariable('pfd_timesave', qSel.FieldByName('���������������').AsDateTime);
                        oqUpd.SetVariable('pfn_codeissl', qSel.FieldByName('���������������').AsInteger);
                        try
                          oqUpd.Execute;
                        except
                          on e:Exception do
                            begin
                              Log_ins('error update error: '+E.ClassName+' with message : '+E.Message);
                              Exit;                   
                            end;
                        end;
                        DoZakl(qSel.FieldByName('���������������').AsInteger, qSel.FieldByName('����������').AsWideString, 2); // -- �������� ����������
                        oqInsData.SetVariable('pKodIssl', qSel.FieldByName('���������������').AsInteger);
                        oqInsData.SetVariable('pKodPac', qSel.FieldByName('�����������').AsInteger);
                        oqInsData.SetVariable('pKodSotr', qSel.FieldByName('��������').AsInteger);
                        oqInsData.SetVariable('pDate', qSel.FieldByName('����������������').AsDateTime);
                        oqInsData.SetVariable('pKodOtdel', qSel.FieldByName('������������').AsInteger);
                        oqInsData.SetVariable('pKodBlank', qSel.FieldByName('���������').AsInteger);
                        if (qSel.FieldByName('������������').AsInteger = 6) or (qSel.FieldByName('������������').AsInteger = 10) then // !!! ��������������� ���������
                          oqInsData.SetVariable('pType', 2)
                        else
                          oqInsData.SetVariable('pType', 1);
                        oqInsData.SetVariable('pFam', qSel.FieldByName('���������������').AsString);
                        oqInsData.SetVariable('pIm', qSel.FieldByName('�����������').AsString);
                        oqInsData.SetVariable('pOtch', qSel.FieldByName('����������������').AsString);
                        oqInsData.SetVariable('pDateRojd', trunc(qSel.FieldByName('������������').AsDateTime));
                        oqInsData.SetVariable('pNazID', ods.FieldByName('fk_nazid').AsInteger);
                        oqInsData.SetVariable('pSex', qSel.FieldByName('���').AsString);
                        try
                          oqInsData.Execute;
                        except
                          on e:Exception do
                            begin
                              Log_ins('error insert error: '+E.ClassName+' with message : '+E.Message);
                              Exit;
                            end;
                        end;
                      end;
                  end;
              finally
                ods.Free;
              end;
              os.Commit;
              qSel.Next;
            end;
      end else
      begin
        Log_ins('������� ������� ��� �������� 0');
      end;
  finally
    qSel.Free;
  end;
end;

end.
