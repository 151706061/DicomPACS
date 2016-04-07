{ *********************************************************************** }

{ Makhaon HL7 Listener Component                                          }

{ Copyright (c) 2009-2010 Makhaon Software                                }

{ http://www.makhaon.com                                                  }

{ *********************************************************************** }

unit HL7Listener;

interface

uses
  SysUtils, Classes, StrUtils, SyncObjs, IdContext, IdTCPServer, IdException,
  IdExceptionCore, IdServerInterceptLogFile, IdGlobal;

type
  THL7Listener = class(TComponent)
  private
    FServer: TIdTCPServer;
    FIdLogFile: TIdServerInterceptLogFile;
    FPort: Integer;
    FLastError: String;
    FACKResponse: TStringList;
    FMsg: TStringList;
    FOnError: TNotifyEvent;
    FOnMsgReceived: TNotifyEvent;
    FSendACK: Boolean;
    FReceiveTimeOut: Integer;
    FExecCriticalSection: TCriticalSection;
    FLogFileName: String;
    FLogEnabled: Boolean;
    procedure OnExecute(AContext: TIdContext);
    procedure OnConnect(AContext: TIdContext);
    procedure OnDisconnect(AContext: TIdContext);
    procedure SetPort(const Value: Integer);
    procedure SetLogEnabled(const Value: Boolean);
    procedure SetLogFileName(const Value: String);
    procedure CreteLogger;
    { private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    property LastError: String read FLastError write FLastError;
    property ACKResponse: TStringList read FACKResponse;
    property Msg: TStringList read FMsg;
  published
    { Published declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start;
    property Port: Integer read FPort write SetPort default 23456;
    property SendACK: Boolean read FSendACK write FSendACK default TRUE;
    property OnError: TNotifyEvent read FOnError write FOnError;
    property OnMsgReceived: TNotifyEvent read FOnMsgReceived write FOnMsgReceived;
    property ReceiveTimeOut: Integer read FReceiveTimeOut write FReceiveTimeOut default 1000;
    property LogFileName: String read FLogFileName write SetLogFileName;
    property LogEnabled: Boolean read FLogEnabled write SetLogEnabled;
  end;

  THL7ListenerEx = class(THL7Listener)
  public
    procedure Stop;
  end;
procedure Register;

implementation

const
  MSG_START = #$0B;
  MSG_END = #$1C#$0D;

procedure Register;
begin
  RegisterComponents('Makhaon', [THL7Listener]);
end;

{ THL7Listener }

constructor THL7Listener.Create(AOwner: TComponent);
begin
  inherited;
  FExecCriticalSection := TCriticalSection.Create;
  FServer := TIdTCPServer.Create(NIL);
  FServer.OnExecute := OnExecute;
  FServer.OnConnect := OnConnect;
  FServer.OnDisconnect := OnDisconnect;
  if FLogEnabled then
    CreteLogger;
  FACKResponse := TStringList.Create;
  FPort := 23456;
  FReceiveTimeOut := 1000;
  FSendACK := TRUE;
end;

destructor THL7Listener.Destroy;
begin
  FreeAndNil(FIdLogFile);
  FreeAndNil(FServer);
  FreeAndNil(FExecCriticalSection);
  FreeAndNil(FACKResponse);
  inherited;
end;

procedure THL7Listener.CreteLogger;
begin
  FIdLogFile := TIdServerInterceptLogFile.Create(NIL);
  FIdLogFile.Filename := LogFileName;
  FServer.Intercept := FIdLogFile;
end;

procedure THL7Listener.OnConnect(AContext: TIdContext);
begin
  AContext.Data := TStringList.Create;
end;

procedure THL7Listener.OnDisconnect(AContext: TIdContext);
begin
  TStringList(AContext.Data).Free;
  AContext.Data := NIL;
end;

procedure THL7Listener.OnExecute(AContext: TIdContext);
var
  s: String;

  procedure _DoSendACK;
  begin
    try
      AContext.Connection.IOHandler.Write(MSG_START + AnsiReplaceStr(FACKResponse.Text, #$0A, '') + MSG_END);
    except
      on EIdNotConnected do
        LastError := 'Disconnect occured while sending ACK Response';
      on EIdReadTimeout do
        LastError := 'Timeout occured while sending ACK Response';
      on EIdConnClosedGracefully do
        LastError := 'Connection closed gracefully while sending ACK Response';
      else
        LastError := 'Exception occured while sending ACK Response';
    end;
  end;

begin
  FExecCriticalSection.Enter;
  try
    FMsg := TStringList(AContext.Data);
    LastError := '';
    try
      s := AContext.Connection.IOHandler.ReadLn(#13, FReceiveTimeOut, -1); //, TIdTextEncoding.Default);
    except
      on EIdNotConnected do
        LastError := 'Disconnect occured while wait for string';
      on EIdReadTimeout do
        LastError := 'Timeout occured while wait for string';
      on EIdConnClosedGracefully do
        Exit;
      else
        LastError := 'Exception occured while wait for string';
    end;
    if s = '' then
      Exit;
    if LastError <> '' then
      if Assigned(FOnError) then
        FOnError(Self)
      else
    else
      if (s[1] = MSG_START) then
      begin
        FMsg.Clear;
        Delete(s, 1, 1);
        FMsg.Add(s);
      end
      else
        if (s = #$1C) then
        begin
          if Assigned(FOnMsgReceived) then
            FOnMsgReceived(Self);
          if SendACK then
          begin
            _DoSendACK;
            if LastError <> '' then
              if Assigned(FOnError) then
                FOnError(Self);
          end;
          FMsg.Clear;
        end
        else
          FMsg.Add(s);
  finally
    FExecCriticalSection.Leave;
  end;
end;

procedure THL7Listener.SetLogEnabled(const Value: Boolean);
begin
  FLogEnabled := Value;
  if FLogEnabled then
    CreteLogger
  else
  begin
    FServer.Intercept := NIL;
    FreeAndNil(FIdLogFile);
  end;
end;

procedure THL7Listener.SetLogFileName(const Value: String);
begin
  FLogFileName := Value;
  if Assigned(FIdLogFile) then
    FIdLogFile.Filename := FLogFileName;
end;

procedure THL7Listener.SetPort(const Value: Integer);
var
  Temp: Boolean;
begin
  FPort := Value;
  if not (csDesigning in ComponentState) then
  begin
    Temp := FServer.Active;
    FServer.DefaultPort := FPort;
    FServer.Active := FALSE;
    FServer.Bindings.Clear;
    if Temp then
      FServer.Active := TRUE;
  end;
end;

procedure THL7Listener.Start;
begin
  FServer.Active := TRUE;
end;

{ THL7ListenerEx }

procedure THL7ListenerEx.Stop;
begin
  FServer.Active := False;
end;

end.
