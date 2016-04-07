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
// -- записываем в текст
    TBlobField(odsZakl.FieldByName('fb_text')).LoadFromStream(memStream);
    memStream.Position := 0;
// -- записываем в HTML
    rve.LoadTextFromStream(memStream, 0, 0, True);
    memStream.Position := 0;
    rve.SaveHTMLToStream(memStream, '', '', '', [rvsoOverrideImages,rvsoMiddleOnly,rvsoUseCheckpointsNames]);
    memStream.Position := 0;
    TBlobField(odsZakl.FieldByName('fb_html')).LoadFromStream(memStream);
// -- записываем в BLOB
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

procedure TExchangeUZI.Log_ins(p_strs, p_filename: ansistring); // логи
begin
  if trim(p_filename)='' then
    begin
      MnLg_ev(p_strs,ExtractFilePath(paramstr(0))+'ExchangeService.log');
    end else
    begin
      MnLg_ev(p_strs,p_filename);
    end;
end;

procedure TExchangeUZI.MnLg_ev(p_strs, p_filename: ansistring; p_is_delim, p_is_DT: boolean); // логи
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

procedure TExchangeUZI.ServiceExecute(Sender: TService); // запуск сервиса, подключение к БД
var Ini : TIniFile;
begin
//  sleep(10000);  // !!! нужно для дебага, запускаем сервис в службах, потом лезем в проект и делаем attach
//-- 1. Поднимаем настройки
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
//-- 2. Создаем и коннектимся к БД
  Log_ins('Start connect database MySQL');
  if Trim(sHost)='' then
    begin
      Log_ins('Не задан IP адрес MySQL сервера в файле '+ExtractFilePath(paramstr(0))+'ExchangeSettings.ini');
      Exit;
    end;
  if Trim(IntToStr(nPort))='' then
    begin
      Log_ins('Не задан порт MySQL сервера в файле '+ExtractFilePath(paramstr(0))+'ExchangeSettings.ini');
      Exit;
    end;
  if Trim(sLogin)='' then
    begin
      Log_ins('Не задан LOGIN MySQL сервера в файле '+ExtractFilePath(paramstr(0))+'ExchangeSettings.ini');
      Exit;
    end;
  if Trim(sPass)='' then
    begin
      Log_ins('Не задан PASSWORD MySQL сервера в файле '+ExtractFilePath(paramstr(0))+'ExchangeSettings.ini');
      Exit;
    end;
  if Trim(sAlias)='' then
    begin
      Log_ins('Не задан ALIAS MySQL сервера в файле '+ExtractFilePath(paramstr(0))+'ExchangeSettings.ini');
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

procedure TExchangeUZI.Timer1Timer(Sender: TObject); // перенос исследований
var qSel : TUniQuery;
    ods : TOracleDataSet;
    DateEdit, DateSave : TDateTime;
begin
  qSel := TUniQuery.Create(nil);
  qSel.Connection := UniConnection1;
  try
// -- находим исследования для переноса
    qSel.SQL.Text := ' select * from исследования, пациенты '+#13+
                     '  where исследования.`времяРедактирования` = исследования.`времяСохранения` '+#13+
                     '    and date_format(исследования.`ДатаИсследования`, ''%d.%m.%Y'') = date_format(now(), ''%d.%m.%Y'') '+#13+
                     '    and исследования.`КодПациента` = пациенты.`КодПациента` ';
    qSel.Execute;
    if qSel.RecordCount > 0 then
      begin
//        Log_ins('Выбрано записей для переноса '+IntToStr(qSel.RecordCount));
        qSel.First;
          while not qSel.Eof do
            begin
              ods := TOracleDataSet.Create(nil);
              try
                ods.Session := os;
                ods.SQL.Text := ' select * from asu.texch_uzi_tomsk where fn_codeissl = :pfn_codeissl ';
                ods.DeclareAndSet('pfn_codeissl', otInteger, qSel.FieldByName('КодИсследования').AsInteger);
                ods.Open;
                DateEdit := ods.FieldByName('fd_timeedit').AsDateTime;
                DateSave := ods.FieldByName('fd_timesave').AsDateTime;
                if ods.RecordCount = 0 then // если еще не переносили исследование, то INSERT ============================
                  begin
                    oqIns.SetVariable('pfn_codeissl', qSel.FieldByName('КодИсследования').AsInteger);
                    oqIns.SetVariable('pfn_codepac', qSel.FieldByName('КодПациента').AsInteger);
                    oqIns.SetVariable('pfn_codesotr', qSel.FieldByName('КодВрача').AsInteger);
                    oqIns.SetVariable('pfd_dateissl', qSel.FieldByName('ДатаИсследования').AsDateTime);
                    oqIns.SetVariable('pfn_codeotdel', qSel.FieldByName('КодОтделения').AsInteger);
                    oqIns.SetVariable('pfn_codeblank', qSel.FieldByName('КодБланка').AsInteger);
                    oqIns.SetVariable('pfd_timeedit', qSel.FieldByName('времяРедактирования').AsDateTime);
                    oqIns.SetVariable('pfd_timesave', qSel.FieldByName('времяСохранения').AsDateTime);
                    if (qSel.FieldByName('КодОтделения').AsInteger = 6) or (qSel.FieldByName('КодОтделения').AsInteger = 10) then // !!! поликлинические отделения
                      oqIns.SetVariable('pfn_typepac', 2)
                    else
                      oqIns.SetVariable('pfn_typepac', 1);
                    oqIns.SetVariable('pfc_fam', qSel.FieldByName('ФамилияПациента').AsString);
                    oqIns.SetVariable('pfc_name', qSel.FieldByName('ИмяПациента').AsString);
                    oqIns.SetVariable('pfc_otch', qSel.FieldByName('ОтчествоПациента').AsString);
                    oqIns.SetVariable('pfd_rojd', trunc(qSel.FieldByName('ДатаРождения').AsDateTime));
                    try
                      oqIns.Execute;
                    except
                      on e:Exception do
                        begin
                          Log_ins('error insert error: '+E.ClassName+' with message : '+E.Message);
                          Exit;
                        end;
                    end;
                    DoZakl(qSel.FieldByName('КодИсследования').AsInteger, qSel.FieldByName('Заключение').AsWideString, 1); // -- добавляем заключение
                    oqInsData.SetVariable('pKodIssl', qSel.FieldByName('КодИсследования').AsInteger);
                    oqInsData.SetVariable('pKodPac', qSel.FieldByName('КодПациента').AsInteger);
                    oqInsData.SetVariable('pKodSotr', qSel.FieldByName('КодВрача').AsInteger);
                    oqInsData.SetVariable('pDate', qSel.FieldByName('ДатаИсследования').AsDateTime);
                    oqInsData.SetVariable('pKodOtdel', qSel.FieldByName('КодОтделения').AsInteger);
                    oqInsData.SetVariable('pKodBlank', qSel.FieldByName('КодБланка').AsInteger);
                    if (qSel.FieldByName('КодОтделения').AsInteger = 6) or (qSel.FieldByName('КодОтделения').AsInteger = 10) then // !!! поликлинические отделения
                      oqInsData.SetVariable('pType', 2)
                    else
                      oqInsData.SetVariable('pType', 1);
                    oqInsData.SetVariable('pFam', qSel.FieldByName('ФамилияПациента').AsString);
                    oqInsData.SetVariable('pIm', qSel.FieldByName('ИмяПациента').AsString);
                    oqInsData.SetVariable('pOtch', qSel.FieldByName('ОтчествоПациента').AsString);
                    oqInsData.SetVariable('pDateRojd', trunc(qSel.FieldByName('ДатаРождения').AsDateTime));
                    oqInsData.SetVariable('pNazID', ods.FieldByName('fk_nazid').AsInteger);
                    oqInsData.SetVariable('pSex', qSel.FieldByName('Пол').AsString);
                    try
                      oqInsData.Execute;
                    except
                      on e:Exception do
                        begin
                          Log_ins('error insert error: '+E.ClassName+' with message : '+E.Message);
                          Exit;
                        end;
                    end;
                  end else // если у нас в базе уже есть такое исследование определяем надо ли апдейтить и если надо делаем UPDATE =============================
                  begin
                    if (DateEdit <> qSel.FieldByName('времяРедактирования').AsDateTime) and (DateSave <> qSel.FieldByName('времяСохранения').AsDateTime) then
                      begin
                        oqUpd.SetVariable('pfd_timeedit', qSel.FieldByName('времяРедактирования').AsDateTime);
                        oqUpd.SetVariable('pfd_timesave', qSel.FieldByName('времяСохранения').AsDateTime);
                        oqUpd.SetVariable('pfn_codeissl', qSel.FieldByName('КодИсследования').AsInteger);
                        try
                          oqUpd.Execute;
                        except
                          on e:Exception do
                            begin
                              Log_ins('error update error: '+E.ClassName+' with message : '+E.Message);
                              Exit;                   
                            end;
                        end;
                        DoZakl(qSel.FieldByName('КодИсследования').AsInteger, qSel.FieldByName('Заключение').AsWideString, 2); // -- изменяем заключение
                        oqInsData.SetVariable('pKodIssl', qSel.FieldByName('КодИсследования').AsInteger);
                        oqInsData.SetVariable('pKodPac', qSel.FieldByName('КодПациента').AsInteger);
                        oqInsData.SetVariable('pKodSotr', qSel.FieldByName('КодВрача').AsInteger);
                        oqInsData.SetVariable('pDate', qSel.FieldByName('ДатаИсследования').AsDateTime);
                        oqInsData.SetVariable('pKodOtdel', qSel.FieldByName('КодОтделения').AsInteger);
                        oqInsData.SetVariable('pKodBlank', qSel.FieldByName('КодБланка').AsInteger);
                        if (qSel.FieldByName('КодОтделения').AsInteger = 6) or (qSel.FieldByName('КодОтделения').AsInteger = 10) then // !!! поликлинические отделения
                          oqInsData.SetVariable('pType', 2)
                        else
                          oqInsData.SetVariable('pType', 1);
                        oqInsData.SetVariable('pFam', qSel.FieldByName('ФамилияПациента').AsString);
                        oqInsData.SetVariable('pIm', qSel.FieldByName('ИмяПациента').AsString);
                        oqInsData.SetVariable('pOtch', qSel.FieldByName('ОтчествоПациента').AsString);
                        oqInsData.SetVariable('pDateRojd', trunc(qSel.FieldByName('ДатаРождения').AsDateTime));
                        oqInsData.SetVariable('pNazID', ods.FieldByName('fk_nazid').AsInteger);
                        oqInsData.SetVariable('pSex', qSel.FieldByName('Пол').AsString);
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
        Log_ins('Выбрано записей для переноса 0');
      end;
  finally
    qSel.Free;
  end;
end;

end.
