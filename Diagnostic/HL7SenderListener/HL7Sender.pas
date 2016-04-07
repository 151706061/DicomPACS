{ *********************************************************************** }

{ Makhaon HL7 Sender Component                                            }

{ Copyright (c) 2009-2010 Makhaon Software                                }

{ http://www.makhaon.com                                                  }

{ *********************************************************************** }

unit HL7Sender;

interface

uses
  SysUtils, Classes, IdTCPClient, uPushPop, IdException, StrUtils, IdExceptionCore, IdGlobal;

type
  THL7Sender = class;

  TNotifyContinue = procedure(Sender: TObject; var Continue: Boolean) of object;

  THL7SenderThread = class(TThread)
  PRIVATE
    FClient: TIdTCPClient;
    FOwner: THL7Sender;
  PROTECTED
    procedure Execute; OVERRIDE;
  PUBLIC
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy; OVERRIDE;
    procedure Start; //SI
  end;

  THL7Sender = class(TComponent)
  PRIVATE
    { Private declarations }
    FSendThread: THL7SenderThread;
    FPort: Integer;
    FHost: String;
    FPushPop: TPushPop;
    FConnectTimeout: Integer;
    FACKTimeout: Integer;
    FOnError: TNotifyEvent;
    FLastMessage: String;
    FWaitForACK: Boolean;
    FACKResponse: TStringList;
    FOnACKResponse: TNotifyEvent;
    FCurrSendStr: String;
    FOnLog: TNotifyEvent;
    procedure OnTerminate(Sender: TObject);
    procedure SetHost(const Value: String);
    procedure SetPort(const Value: Integer);
    procedure Log(const s: String);
    procedure Error(const s: String);

  PROTECTED
    { Protected declarations }
  PUBLIC
    { Public declarations }
    constructor Create(AOwner: TComponent); OVERRIDE;
    destructor Destroy; OVERRIDE;
    procedure SendMessage(const Msg: String);
    procedure SendFile(const FileName: String);
    property LastMessage: String READ FLastMessage WRITE FLastMessage;
    property CurrSendStr: String READ FCurrSendStr;
    property ACKResponse: TStringList READ FACKResponse;
  PUBLISHED
    { Published declarations }
    property Port: Integer READ FPort WRITE SetPort DEFAULT 23456;
    property Host: String READ FHost WRITE SetHost;
    property ConnectTimeout: Integer READ FConnectTimeout WRITE FConnectTimeout DEFAULT 5000;
    property ACKTimeout: Integer READ FACKTimeout WRITE FACKTimeout DEFAULT 1000;
    property WaitForACK: Boolean READ FWaitForACK WRITE FWaitForACK DEFAULT TRUE;
    property OnError: TNotifyEvent READ FOnError WRITE FOnError;
    property OnLog: TNotifyEvent READ FOnLog WRITE FOnLog;
    property OnACKResponse: TNotifyEvent READ FOnACKResponse WRITE FOnACKResponse;
  end;

procedure Register;

implementation

const
  MSG_START = #$0B;
  MSG_END = #$1C#$0D;

procedure Register;
begin
  RegisterComponents('Makhaon', [THL7Sender]);
end;

{ THL7Sender }

constructor THL7Sender.Create(AOwner: TComponent);
begin
  inherited;
  FPushPop := TPushPop.Create;
  FACKResponse := TStringList.Create;
  FACKTimeout := 1000;
  FConnectTimeout := 5000;
  FHost := '127.0.0.1';
  FPort := 23456;
  FWaitForACK := TRUE;
end;

destructor THL7Sender.Destroy;
begin
  FSendThread.Free;
  FPushPop.Free;
  FACKResponse.Free;
  inherited;
end;

procedure THL7Sender.Error(const s: String);
begin
  FLastMessage := s;
  if Assigned(FOnError) then
    FOnError(Self);
end;

procedure THL7Sender.Log(const s: String);
begin
  FLastMessage := s;
  if Assigned(FOnLog) then
    FOnLog(Self);
end;

procedure THL7Sender.OnTerminate(Sender: TObject);
begin
  FSendThread := NIL;
end;

procedure THL7Sender.SendFile(const FileName: String);
var
  SL: TStringList;
begin
  SL := TStringList.Create;
  try
    SL.LoadFromFile(FileName);
    SendMessage(SL.Text);
  finally
    SL.Free;
  end;
end;

procedure THL7Sender.SendMessage(const Msg: String);
begin
  FPushPop.Push(Msg);
  if not Assigned(FSendThread) then
  begin
    FSendThread := THL7SenderThread.Create(TRUE);
    FSendThread.FClient.Port := FPort;
    FSendThread.FClient.Host := FHost;
    FSendThread.FClient.ConnectTimeout := FConnectTimeout;
    FSendThread.FOwner := Self;
    FSendThread.OnTerminate := OnTerminate;
    FSendThread.Start;
  end;
end;

procedure THL7Sender.SetHost(const Value: String);
begin
  FHost := Value;
  if (not (csDesigning in ComponentState)) and Assigned(FSendThread) then
    FSendThread.FClient.Host := FHost;
end;

procedure THL7Sender.SetPort(const Value: Integer);
begin
  FPort := Value;
  if (not (csDesigning in ComponentState)) and Assigned(FSendThread) then
    FSendThread.FClient.Port := FPort;
end;

{ THL7SenderThread }

constructor THL7SenderThread.Create(CreateSuspended: Boolean);
begin
  inherited;
  FClient := TIdTCPClient.Create(NIL);
end;

destructor THL7SenderThread.Destroy;
begin
  inherited;
  FClient.Free;
  FClient := NIL;
end;

procedure THL7SenderThread.Execute;
var
  s: String;
  ErrorOccured: Boolean;
begin
  repeat
    if FOwner.FPushPop.Count = 0 then
    begin
      Sleep(1000);
      Continue;
    end;
    ErrorOccured := FALSE;
    try
      if not FClient.Connected then
      begin
        FOwner.Log(Format('Try to connect to host %s, port %d.', [FClient.Host, FClient.Port]));
        FClient.Connect;
      end
      else
        FOwner.Log('Connection already estabilished');
    except
      FOwner.Error(Format('Error occured while connect to host %s, port %d.', [FClient.Host, FClient.Port]));
      Sleep(30000);
      Continue;
    end;
    FOwner.FCurrSendStr := AnsiReplaceStr(FOwner.FPushPop.Pop, #$0A, '');
    if (Length(FOwner.FCurrSendStr) > 1) and (FOwner.FCurrSendStr[Length(FOwner.FCurrSendStr)] <> #$0D) then
      FOwner.FCurrSendStr := FOwner.FCurrSendStr + #$0D;
    try
      FClient.IOHandler.Write(MSG_START + FOwner.FCurrSendStr + MSG_END); //, TIdTextEncoding.Default);
    except
      FOwner.Log('Error occured while write message to peer');
    end;
    FOwner.Log('Message has been written to peer');
    if FOwner.FWaitForACK then
    begin
      FOwner.FACKResponse.Clear;
      FOwner.Log('Start waiting for ACK');
      repeat
        try
          s := FClient.IOHandler.ReadLn(#13, FOwner.FACKTimeout);
        except
          on EIdNotConnected do
          begin
            ErrorOccured := TRUE;
            FOwner.LastMessage := 'Disconnect occured while wait for ACK';
          end;
          on EIdReadTimeout do
          begin
            ErrorOccured := TRUE;
            FOwner.LastMessage := 'Timeout occured while wait for ACK';
          end;
          on EIdConnClosedGracefully do
            Break;
          on E: Exception do
          begin
            ErrorOccured := TRUE;
            FOwner.LastMessage := 'Except occured while wait for ACK: ' + E.ClassName + ' ' + E.Message;
          end;
        end;
        if ErrorOccured then
        begin
          FOwner.Error(FOwner.LastMessage);
          Break;
        end;
        if s = '' then
        else
          if (s[1] = MSG_START) then
          begin
            FOwner.FACKResponse.Clear;
            Delete(s, 1, 1);
            FOwner.FACKResponse.Add(s);
          end
          else
            if (s <> #$1C) then
              FOwner.FACKResponse.Add(s);
      until (s = #$1C) or Terminated;
      if not Terminated and Assigned(FOwner.FOnACKResponse) then
      begin
        FOwner.Log('ACK received');
        FOwner.FOnACKResponse(FOwner);
      end;
    end;
    if not Terminated and ErrorOccured then
      FOwner.FPushPop.Push(FOwner.FCurrSendStr);
    FClient.Disconnect;
  until Terminated;
  FClient.Disconnect;
end;

//SI
procedure THL7SenderThread.Start;
begin
  Resume;
end;

end.
