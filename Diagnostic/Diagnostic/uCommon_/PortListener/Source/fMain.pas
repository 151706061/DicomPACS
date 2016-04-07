// 2012/07/07 23:59:35,00:00:00,26,89508625134,I,380808,380808,,0,308220,0,E281,Virage,T9004,Линия 1.4,0,0, ,
unit fMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  Oracle, IniFiles, Sockets, DB, DBClient;

type
  TCallsListener = class(TService)
    os: TOracleSession;
    TcpServer1: TTcpServer;
    procedure ServiceExecute(Sender: TService);
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceDestroy(Sender: TObject);
    procedure ServiceShutdown(Sender: TService);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure TcpServer1Accept(Sender: TObject; ClientSocket: TCustomIpClient);
  private
    sPort, sHost : string;
    bOnlyIn : Integer; // настройка 0 - записываем все звонки, 1 - только входящие
    procedure DoInsertData(s : AnsiString);
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  CallsListener: TCallsListener;

implementation

{$R *.DFM}

procedure LogEvents (p_strs : AnsiString; p_filename : AnsiString = '');
var F : TextFile;
    v_filename : AnsiString;
const c_delim = '-------------------------------------------------------------------------------';
begin
  if p_filename = '' then
    begin
      v_filename := ExtractFilePath(paramstr(0))+'ListenerEvents.log';
    end else
    begin
      v_filename := p_filename;
    end;
  if FileExists(v_filename) then
    begin
      AssignFile(F, v_filename);
      Append(F);
    end else
    begin
      AssignFile(F, v_filename);
      rewrite(F);
    end;
  writeln(F, DateTimeToStr(Now)+' '+p_strs);
  CloseFile(F);
end;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  CallsListener.Controller(CtrlCode);
end;

procedure TCallsListener.DoInsertData(s: AnsiString);
var oq : TOracleQuery;
    str : TStringList;
    i : Integer;
    strR, sYear, sMonth, sDay, sTime, sDate : string;
begin
  oq := TOracleQuery.Create(nil);
  str := TStringList.Create;
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' insert into taxi.tcalls(fd_date, fc_duration, fn_time, fc_cli, fc_direction, fc_ddi1, fc_ddi2, fc_kod, fn_inside, fn_uid, '+#13+
                   '                         fn_then, fc_p1, fc_name_p1, fc_p2, fc_name_p2, fn_time1, fn_time2) ' +#13+
                   ' values(:pfd_date, :pfc_duration, :pfn_time, :pfc_cli, :pfc_direction, :pfc_ddi1, :pfc_ddi2, :pfc_kod, :pfn_inside, :pfn_uid, '+#13+
                   '        :pfn_then, :pfc_p1, :pfc_name_p1, :pfc_p2, :pfc_name_p2, :pfn_time1, :pfn_time2) ';
    str.CommaText := StringReplace(s, ' ', '_', [rfReplaceAll, rfIgnoreCase]);
    if bOnlyIn = 1 then
      begin
        if str.Strings[4] <> 'I' then
          exit;
      end;
// Дата и время поступления вызова
    strR := StringReplace(str.Strings[0], '_', ' ', [rfReplaceAll, rfIgnoreCase]);
    sYear := copy(strR, 1, Pos('/', strR)-1);
    sMonth := copy(strR, Length(sYear)+2, 2);
    sDay := copy(strR, Length(sYear)+2+Length(sMonth)+1, 2);
    sTime := copy(strR, Length(sYear)+2+Length(sMonth)+1+Length(sDay)+1, Length(strR)-(Length(sYear)+2+Length(sMonth)+1+Length(sDay))+1);
    sDate := sDay+'.'+sMonth+'.'+sYear+' '+sTime;
    oq.DeclareAndSet('pfd_date', otDate, StrToDateTime(sDate));
// Продолжительность вызова
    oq.DeclareAndSet('pfc_duration', otString, StringReplace(str.Strings[1], '_', ' ', [rfReplaceAll, rfIgnoreCase]));
// Время звонка в секундах
    oq.DeclareAndSet('pfn_time', otString, StringReplace(str.Strings[2], '_', ' ', [rfReplaceAll, rfIgnoreCase]));
// Номер вызывающего абонента (CLI-номер (АОН))
    oq.DeclareAndSet('pfc_cli', otString, StringReplace(str.Strings[3], '_', ' ', [rfReplaceAll, rfIgnoreCase]));
// Направление (I - входящий, O - исходящий)
    oq.DeclareAndSet('pfc_direction', otString, StringReplace(str.Strings[4], '_', ' ', [rfReplaceAll, rfIgnoreCase]));
// Набираемый номер (DDI1)
    oq.DeclareAndSet('pfc_ddi1', otString, StringReplace(str.Strings[5], '_', ' ', [rfReplaceAll, rfIgnoreCase]));
// Набранный номер (DDI2)
    oq.DeclareAndSet('pfc_ddi2', otString, StringReplace(str.Strings[6], '_', ' ', [rfReplaceAll, rfIgnoreCase]));
// Учетная запись
    oq.DeclareAndSet('pfc_kod', otString, StringReplace(str.Strings[7], '_', ' ', [rfReplaceAll, rfIgnoreCase]));
// 0 или 1 - Внутренний (I 0 - Входящий внешний вызов; O 1 - Внутренний вызов; O 0 - Исходящий внешний вызов)
    oq.DeclareAndSet('pfn_inside', otInteger, StrToInt(StringReplace(str.Strings[8], '_', ' ', [rfReplaceAll, rfIgnoreCase])));
// UID вызова (Перезапускается с 1.000.000, если перезапускается система), увеличивается на 1 за каждый уникальный вызов
    oq.DeclareAndSet('pfn_uid', otInteger, StrToInt(StringReplace(str.Strings[9], '_', ' ', [rfReplaceAll, rfIgnoreCase])));
// Далее (Продолжительность: 1 Если для этого ID вызова существуют другие записи, 0 в ином случае)
    oq.DeclareAndSet('pfn_then', otInteger, StrToInt(StringReplace(str.Strings[10], '_', ' ', [rfReplaceAll, rfIgnoreCase])));
// Идентификатор P1 (Устройство абонента 1)
    oq.DeclareAndSet('pfc_p1', otString, StringReplace(str.Strings[11], '_', ' ', [rfReplaceAll, rfIgnoreCase]));
// Имя абонента 1 (Название такси)
    oq.DeclareAndSet('pfc_name_p1', otString, StringReplace(str.Strings[12], '_', ' ', [rfReplaceAll, rfIgnoreCase]));
// Идентификатор P2 (Устройство абонента 2)
    oq.DeclareAndSet('pfc_p2', otString, StringReplace(str.Strings[13], '_', ' ', [rfReplaceAll, rfIgnoreCase]));
// Имя абонента 2
    oq.DeclareAndSet('pfc_name_p2', otString, StringReplace(str.Strings[14], '_', ' ', [rfReplaceAll, rfIgnoreCase]));
// Время удержания
    oq.DeclareAndSet('pfn_time1', otString, StringReplace(str.Strings[15], '_', ' ', [rfReplaceAll, rfIgnoreCase]));
// Время временной постановки на ожидание
    oq.DeclareAndSet('pfn_time2', otString, StringReplace(str.Strings[16], '_', ' ', [rfReplaceAll, rfIgnoreCase]));
    try
      oq.Execute;
    except
      on E : Exception do
        LogEvents('Error: '+E.ClassName+' error raised, with message: '+E.Message+#13#10+s);
    end;
    os.Commit;
  finally
    oq.Free;
    str.Free;
  end;
end;

function TCallsListener.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TCallsListener.ServiceCreate(Sender: TObject);
begin
  LogEvents('ServiceCreate');
end;

procedure TCallsListener.ServiceDestroy(Sender: TObject);
begin
  LogEvents('ServiceDestroy');
end;

procedure TCallsListener.ServiceExecute(Sender: TService);
var Ini : TIniFile;
begin
  LogEvents('ServiceExecute');
  sleep(10000);  // !!! нужно для дебага, запускаем сервис в службах, потом лезем в проект и делаем attach
  os.LogOn;
  LogEvents('os.LogOn');
//-- 1. Поднимаем настройки
    Ini := TIniFile.Create(ExtractFilePath(paramstr(0))+'Settings.ini');
    try
      sPort := Ini.ReadString('CONNECT', 'PORT', '8082');
      sHost := Ini.ReadString('CONNECT', 'HOST', '192.168.0.10');
      bOnlyIn := Ini.ReadInteger('WORK', 'ONLY_INCOMING', 0);
      LogEvents('PORT='+sPort);
      LogEvents('HOST='+sHost);
      LogEvents('ONLY_INCOMING='+IntTostr(bOnlyIn));
    finally
      Ini.Free;
    end;
// -- 2. Включаем сервер на прослушку порта
  TcpServer1.LocalHost := sHost;
  TcpServer1.LocalPort := sPort;
  TcpServer1.Active := True;           //слушаем порт
  LogEvents('TcpServer1.Active := True');
// --
  while not terminated do
    ServiceThread.ProcessRequests(true);
end;

procedure TCallsListener.ServiceShutdown(Sender: TService);
begin
  LogEvents('ServiceShutdown');
end;

procedure TCallsListener.ServiceStart(Sender: TService; var Started: Boolean);
begin
  LogEvents('ServiceStart');
end;

procedure TCallsListener.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  LogEvents('ServiceStop');
end;

procedure TCallsListener.TcpServer1Accept(Sender: TObject; ClientSocket: TCustomIpClient);
var txt : AnsiString;
begin
  txt := ClientSocket.Receiveln;                           //возьмем текст присланный нам
  DoInsertData(txt);
end;

end.
