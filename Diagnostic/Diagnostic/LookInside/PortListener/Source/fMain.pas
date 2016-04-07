unit fMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs, ServiceAPI,
  Oracle, DB, OracleData, HL7Listener, Hl7Parser;

type
  THL7MsgType = (hmtUnknown, //неизветсное сообщение
                 hmtBind, //связывание иследованиея и пациента
                 hmtUnbind, //отсоединение исследования от пациента
                 hmtStudyNew, //новое исследование
                 hmtStudyUpdate, //обновление существующего исследования
                 hmtStudyDone, //исследование завершено
                 hmtStudyCancelled //иссследование отменено
                 );
  TPortListener = class(TService)
    os: TOracleSession;
    HL7Listener1: THL7Listener;
    odsInfo: TOracleDataSet;
    oqUpdate: TOracleQuery;
    oqUnbind: TOracleQuery;
    oqBind: TOracleQuery;
    oqNaz: TOracleQuery;
    procedure ServiceExecute(Sender: TService);
    procedure HL7Listener1MsgReceived(Sender: TObject);
    procedure HL7Listener1Error(Sender: TObject);
  private
    function GetParserMsgType(const Parser: THl7MessageParserEx): THL7MsgType;
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;
const
  MISEXCHANGE = 'SERVICEUSER';

var
  PortListener: TPortListener;

implementation

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  PortListener.Controller(CtrlCode);
end;

function TPortListener.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TPortListener.HL7Listener1Error(Sender: TObject);
begin
  // !!! сделать логирование
end;

procedure TPortListener.HL7Listener1MsgReceived(Sender: TObject);
var Parser: THl7MessageParserEx;
    hmt: THL7MsgType;
    s : string;
begin
  Parser := THl7MessageParserEx.Create;   //создаем парсер
  try
    Parser.ParseMessage(HL7Listener1.Msg); //и разбираем сообщение
    hmt := GetParserMsgType(Parser);
    if hmt = hmtStudyDone then // исследование выполнено (снимки пришли на архив)
      begin
        try
          if Parser.HIS_ID <> '' then
            oqUpdate.SetVariable('pfk_nazid', StrToInt(Parser.HIS_ID))
          else
            oqUpdate.SetVariable('pfk_nazid', 0);
          oqUpdate.SetVariable('pfk_risguid', Parser.DicomUID);
          oqUpdate.Execute;
          os.Commit;
        except
        end;
      end;
    if hmt = hmtBind then // исследование сопоставлено
      begin
        try
          oqBind.SetVariable('pfk_nazid', StrToInt(Parser.HIS_ID));
          oqBind.SetVariable('pfk_risguid', Parser.DicomUID);
          oqBind.Execute;
          oqNaz.SetVariable('pfk_nazid', StrToInt(Parser.HIS_ID));
          oqNaz.SetVariable('pfk_resultid', 2);
          oqNaz.Execute;
          os.Commit;
        except
        end;
      end;
    if hmt = hmtUnbind then // удалено ручное сопоставление
      begin
        try
          oqUnbind.SetVariable('pfk_nazid', StrToInt(Parser.HIS_ID));
          oqUnbind.Execute;
          oqNaz.SetVariable('pfk_nazid', StrToInt(Parser.HIS_ID));
          oqNaz.SetVariable('pfk_resultid', -1);
          oqNaz.Execute;
          os.Commit;
        except
        end;
      end;
// -- отсылаем сообщение-подтверждение архиву о том, что приняли сообщение от него :)
    s := FormatDateTime('yyyymmddhhmmss', Now);
    HL7Listener1.ACKResponse.Clear;
    HL7Listener1.ACKResponse.Add('MSH|^~\&|LookInside-HL7|LookInside-HL7|||' + s + '||ACK^A01|1|P|2.3||');
    HL7Listener1.ACKResponse.Add('MSA|AA|1|||');
  finally
    Parser.Free; //удаляем парсер
  end;
end;

procedure TPortListener.ServiceExecute(Sender: TService);
begin
  sleep(10000); // !!! потом убрать
  GetServiceSession(os, MISEXCHANGE, 'ASU', MISEXCHANGE, '123');
  odsInfo.Close;
  odsInfo.Open;
  HL7Listener1.Port := StrToInt(odsInfo.FieldByName('fc_value').AsString);
  HL7Listener1.Start;
  while not terminated do
    ServiceThread.ProcessRequests(true);
end;

function TPortListener.GetParserMsgType(const Parser: THl7MessageParserEx): THL7MsgType;
begin
  //здесь сомнительное место, так как HIS_ID необязательно целое число
  //но пока сделано так
  if StrToIntDef(Parser.HIS_ID, 0) = 0 then
  begin
    if Parser.StudyIsNew then
      Result := hmtStudyNew
    else if Parser.StudyIsUpdate then
      Result := hmtStudyUpdate
    else if Parser.StudyIsDone then
      Result := hmtStudyDone
    else if Parser.StudyIsCancelled then
      Result := hmtStudyCancelled;
  end else
  begin
    if Pos('NULL', AnsiUpperCase(Parser.StudyID)) = 0 then
      Result := hmtBind
    else
      Result := hmtUnbind;
  end;
end;

end.
