{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit VideoConferenceBaseForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DCM_ConferenceServer, DCM_Attributes, DCM_Wado;

type
  TSendMessageEvent = procedure(Sender: TObject; AConferenceID: Integer; AUserID: array of integer; ADataset: TDicomAttributes) of object;
  TVideoConferenceForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FCanSendVideo: Boolean;
    FCanSendImageSynchronization: Boolean;
    FCanSendAudio: Boolean;
    FCanReceiveVideo: Boolean;
    FCanReceiveImageSynchronization: Boolean;
    FCanReceiveAudio: Boolean;
    function GetFriends(index: Integer): TDcmConferenceUserInfo;
    function GetFriendCount: integer;
  protected
    fOnSendMessage: TSendMessageEvent;
    fFriendList: TList;
    fConferenceID: integer;
    FConferenceClient: TDCMConferenceClient;
    FOwnerInfo: TDcmConferenceUserInfo;

    procedure SetCanReceiveAudio(const Value: Boolean); virtual;
    procedure SetCanReceiveImageSynchronization(const Value: Boolean); virtual;
    procedure SetCanReceiveVideo(const Value: Boolean); virtual;
    function GetCanReceiveAudio: Boolean; virtual;
    function GetCanReceiveImageSynchronization: Boolean; virtual;
    function GetCanReceiveVideo: Boolean; virtual;

    procedure SetCanSendAudio(const Value: Boolean); virtual;
    procedure SetCanSendImageSynchronization(const Value: Boolean); virtual;
    procedure SetCanSendVideo(const Value: Boolean); virtual;
    function GetCanSendAudio: Boolean; virtual;
    function GetCanSendImageSynchronization: Boolean; virtual;
    function GetCanSendVideo: Boolean; virtual;

    procedure SetfOnSendMessage(const Value: TSendMessageEvent);
    procedure SetConferenceID(const Value: integer);
    procedure SetConferenceClient(const Value: TDCMConferenceClient);
    procedure SetOwnerInfo(const Value: TDcmConferenceUserInfo);
    { Private declarations }
  public
    { Public declarations }
    procedure AddConferenceUser(AValue: TDcmConferenceUserInfo);
    procedure InformConferenceUsers(AClient: TDCMConferenceClient; AConferenceID: Integer);

    procedure AddAndInformConferenceUsers(AValue: TDcmConferenceUserInfo;
      AClient: TDCMConferenceClient; AConferenceID: Integer);
    procedure DeleteAndInformConferenceUsers(AValue: TDcmConferenceUserInfo;
      AClient: TDCMConferenceClient; AConferenceID: Integer);
    procedure RemoveAllUsers;

    procedure AddDialogUser(Value: TDcmConferenceUserInfo); virtual;
    procedure DeleteDialogUser(AValue: TDcmConferenceUserInfo); virtual;

    procedure EnableSpeakButton(AValue: Boolean; ARequestUserName: string); virtual;
    procedure RequestToSpeak(AValue: Boolean);

    function FindDialogByUserID(AUserID: Integer): TDcmConferenceUserInfo;

    procedure SendMessageToServer(ADataset: TDicomAttributes);

    procedure DoVideoDataAvailable(ClientThread: TDCMConferenceClient;
      HeaderInfo: THeaderInfo; ABuffer: Pointer; ABufferCount: Integer); virtual;
    procedure DoAudioDataAvailable(ClientThread: TDCMConferenceClient;
      HeaderInfo: THeaderInfo; ABuffer: Pointer; ABufferCount: Integer); virtual;
    procedure DoMouseDataAvailable(ClientThread: TDCMConferenceClient;
      HeaderInfo: THeaderInfo; ABuffer: Pointer; ABufferCount: Integer); virtual;

    procedure DoDatasetAvailable(ClientThread: TDCMConferenceClient;
      HeaderInfo: THeaderInfo; ARequestDataset: TDicomAttributes); virtual;

    property FriendCount: integer read GetFriendCount;
    property Friends[index: Integer]: TDcmConferenceUserInfo read GetFriends;
    property OwnerInfo: TDcmConferenceUserInfo read FOwnerInfo write SetOwnerInfo;
    property ConferenceID: integer read FConferenceID write SetConferenceID;
    property OnSendMessage: TSendMessageEvent read fOnSendMessage write SetfOnSendMessage;
    property ConferenceClient: TDCMConferenceClient read FConferenceClient write SetConferenceClient;

    property CanSendAudio: Boolean read GetCanSendAudio write SetCanSendAudio;
    property CanSendVideo: Boolean read GetCanSendVideo write SetCanSendVideo;
    property CanSendImageSynchronization: Boolean read GetCanSendImageSynchronization write SetCanSendImageSynchronization;

    property CanReceiveAudio: Boolean read GetCanReceiveAudio write SetCanReceiveAudio;
    property CanReceiveVideo: Boolean read GetCanReceiveVideo write SetCanReceiveVideo;
    property CanReceiveImageSynchronization: Boolean read GetCanReceiveImageSynchronization write SetCanReceiveImageSynchronization;
  end;

implementation

{$R *.dfm}

{ TVideoConferenceForm }

procedure TVideoConferenceForm.DoAudioDataAvailable(
  ClientThread: TDCMConferenceClient; HeaderInfo: THeaderInfo;
  ABuffer: Pointer; ABufferCount: Integer);
begin

end;

procedure TVideoConferenceForm.DoDatasetAvailable(
  ClientThread: TDCMConferenceClient; HeaderInfo: THeaderInfo;
  ARequestDataset: TDicomAttributes);
var
  str1: string;
  v1: TDcmConferenceUserInfo;
begin
  str1 := ARequestDataset.GetString($2817, 4);
  if str1 = 'SPEAK' then
  begin
    EnableSpeakButton(ARequestDataset.GetString($2817, $1009) = 'T', ARequestDataset.GetString($2817, $3));
  end;
end;

procedure TVideoConferenceForm.DoMouseDataAvailable(
  ClientThread: TDCMConferenceClient; HeaderInfo: THeaderInfo;
  ABuffer: Pointer; ABufferCount: Integer);
begin

end;

procedure TVideoConferenceForm.DoVideoDataAvailable(
  ClientThread: TDCMConferenceClient; HeaderInfo: THeaderInfo;
  ABuffer: Pointer; ABufferCount: Integer);
begin

end;

procedure TVideoConferenceForm.SendMessageToServer(
  ADataset: TDicomAttributes);
var
  k1: array of Integer;
  i: Integer;
begin
  if assigned(fOnSendMessage) then
  begin
    SetLength(k1, fFriendList.Count);
    for i := 0 to fFriendList.Count - 1 do
      k1[i] := TDcmConferenceUserInfo(fFriendList[i]).ConnectionID;
    fOnSendMessage(self, FConferenceID, k1, ADataset);
  end
  else
    raise Exception.Create('the send event not set!');
end;

procedure TVideoConferenceForm.SetfOnSendMessage(
  const Value: TSendMessageEvent);
begin
  fOnSendMessage := Value;
end;

procedure TVideoConferenceForm.FormCreate(Sender: TObject);
begin
  OwnerInfo := nil;
  fConferenceID := 0;
  fFriendList := TList.Create;

  FCanSendVideo := false;
  FCanSendImageSynchronization := false;
  FCanSendAudio := false;
end;

procedure TVideoConferenceForm.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to fFriendList.Count - 1 do
    TDcmConferenceUserInfo(fFriendList[i]).Free;
  fFriendList.Clear;
  fFriendList.Free;
end;

procedure TVideoConferenceForm.AddDialogUser(Value: TDcmConferenceUserInfo);
begin
  fFriendList.Add(Value);
end;

procedure TVideoConferenceForm.AddConferenceUser(AValue: TDcmConferenceUserInfo);
var
  v1: TDcmConferenceUserInfo;
begin
  v1 := TDcmConferenceUserInfo.Create;
  v1.ConnectionID := AValue.ConnectionID;
  v1.UserID := AValue.UserID;
  v1.UserCode := AValue.UserCode;
  v1.UserName := AValue.UserName;
  v1.GroupName := AValue.GroupName;
  //fFriendList.Add(v1);
  AddDialogUser(v1);
end;

procedure TVideoConferenceForm.InformConferenceUsers(AClient: TDCMConferenceClient; AConferenceID: Integer);
var
  das1: TDicomAttributes;
  v1: TDcmConferenceUserInfo;
  k1: array of Integer;
  i, i1, i2: integer;
begin
  SetLength(k1, fFriendList.Count);
  for i := 0 to fFriendList.Count - 1 do
    k1[i] := TDcmConferenceUserInfo(fFriendList[i]).UserID;

  //send self info
  das1 := TDicomAttributes.Create;

  das1.AddVariant($2817, $4, 'ADDCON');

  //das1.AddVariant($2817, $1, v1.ConnectionID);
  das1.AddVariant($2817, $2, AClient.UserID);
  das1.AddVariant($2817, $8, AClient.UserCode);
  das1.AddVariant($2817, $3, AClient.UserName);
  //das1.AddVariant($2817, $B, AClient.GroupName);
  das1.AddVariant($2817, $A, AConferenceID);

  if assigned(fOnSendMessage) then
  begin
    fOnSendMessage(self, $7F000000, k1, das1);
  end
  else
    raise Exception.Create('the send event not set!');

  //send all other user info
  SetLength(k1, 0);
  SetLength(k1, fFriendList.Count - 1);
  for i1 := 0 to fFriendList.Count - 1 do
  begin
    v1 := TDcmConferenceUserInfo(fFriendList[i1]);

    i2 := 0;
    for i := 0 to fFriendList.Count - 1 do
    begin
      if v1.UserID <> TDcmConferenceUserInfo(fFriendList[i]).UserID then
      begin
        k1[i2] := TDcmConferenceUserInfo(fFriendList[i]).UserID;
        inc(i2);
      end;
    end;

    das1 := TDicomAttributes.Create;

    das1.AddVariant($2817, $4, 'ADDCON');

    //das1.AddVariant($2817, $1, v1.ConnectionID);
    das1.AddVariant($2817, $2, v1.UserID);
    das1.AddVariant($2817, $8, v1.UserCode);
    das1.AddVariant($2817, $3, v1.UserName);
    //das1.AddVariant($2817, $B, v1.GroupName);
    das1.AddVariant($2817, $A, AConferenceID);

    if assigned(fOnSendMessage) then
    begin
      fOnSendMessage(self, $7F000000, k1, das1);
    end
    else
      raise Exception.Create('the send event not set!');

  end;

  SetLength(k1, 0);
end;

function TVideoConferenceForm.FindDialogByUserID(
  AUserID: Integer): TDcmConferenceUserInfo;
var
  i: integer;
  n1: TDcmConferenceUserInfo;
begin
  for i := 0 to fFriendList.Count - 1 do
  begin
    n1 := TDcmConferenceUserInfo(fFriendList[i]);
    if n1.UserID = AUserID then
    begin
      Result := n1;
      break;
    end;
  end;
end;

procedure TVideoConferenceForm.SetConferenceID(const Value: integer);
begin
  FConferenceID := Value;
end;

procedure TVideoConferenceForm.AddAndInformConferenceUsers(
  AValue: TDcmConferenceUserInfo; AClient: TDCMConferenceClient;
  AConferenceID: Integer);
var
  das1: TDicomAttributes;
  v1: TDcmConferenceUserInfo;
  k1: array of Integer;
  i, i1, i2: integer;
begin
  //imform all old users
  SetLength(k1, fFriendList.Count);
  for i := 0 to fFriendList.Count - 1 do
    k1[i] := TDcmConferenceUserInfo(fFriendList[i]).UserID;

  das1 := TDicomAttributes.Create;

  das1.AddVariant($2817, $4, 'ADDCON');

  das1.AddVariant($2817, $2, AValue.UserID);
  das1.AddVariant($2817, $8, AValue.UserCode);
  das1.AddVariant($2817, $3, AValue.UserName);
  das1.AddVariant($2817, $A, AConferenceID);

  if assigned(fOnSendMessage) then
  begin
    fOnSendMessage(self, $7F000000, k1, das1);
  end
  else
    raise Exception.Create('the send event not set!');

  AddConferenceUser(AValue);

  //send self info
  das1 := TDicomAttributes.Create;

  das1.AddVariant($2817, $4, 'ADDCON');

  das1.AddVariant($2817, $2, AClient.UserID);
  das1.AddVariant($2817, $8, AClient.UserCode);
  das1.AddVariant($2817, $3, AClient.UserName);
  das1.AddVariant($2817, $A, AConferenceID);

  if assigned(fOnSendMessage) then
  begin
    fOnSendMessage(self, $7F000000, [AValue.UserID], das1);
  end
  else
    raise Exception.Create('the send event not set!');

  for i1 := 0 to fFriendList.Count - 1 do
  begin
    v1 := TDcmConferenceUserInfo(fFriendList[i1]);

    das1 := TDicomAttributes.Create;

    das1.AddVariant($2817, $4, 'ADDCON');

    das1.AddVariant($2817, $2, v1.UserID);
    das1.AddVariant($2817, $8, v1.UserCode);
    das1.AddVariant($2817, $3, v1.UserName);
    das1.AddVariant($2817, $A, AConferenceID);

    if assigned(fOnSendMessage) then
    begin
      fOnSendMessage(self, $7F000000, [AValue.UserID], das1);
    end
    else
      raise Exception.Create('the send event not set!');

  end;

  SetLength(k1, 0);
end;

procedure TVideoConferenceForm.DeleteAndInformConferenceUsers(
  AValue: TDcmConferenceUserInfo; AClient: TDCMConferenceClient;
  AConferenceID: Integer);
var
  das1: TDicomAttributes;
  v1: TDcmConferenceUserInfo;
  k1: array of Integer;
  i: integer;
begin
  //imform all old users
  SetLength(k1, fFriendList.Count);
  for i := 0 to fFriendList.Count - 1 do
  begin
    k1[i] := TDcmConferenceUserInfo(fFriendList[i]).UserID;
  end;
  das1 := TDicomAttributes.Create;

  das1.AddVariant($2817, $4, 'DELCON');

  das1.AddVariant($2817, $2, AValue.UserID);
  das1.AddVariant($2817, $8, AValue.UserCode);
  das1.AddVariant($2817, $3, AValue.UserName);
  das1.AddVariant($2817, $A, AConferenceID);

  if assigned(fOnSendMessage) then
  begin
    fOnSendMessage(self, $7F000000, k1, das1);
  end
  else
    raise Exception.Create('the send event not set!');

  DeleteDialogUser(AValue);

  SetLength(k1, 0);
end;

procedure TVideoConferenceForm.SetConferenceClient(
  const Value: TDCMConferenceClient);
begin
  FConferenceClient := Value;
end;

procedure TVideoConferenceForm.EnableSpeakButton(AValue: Boolean; ARequestUserName: string);
begin

end;

procedure TVideoConferenceForm.RequestToSpeak(AValue: Boolean);
var
  das1: TDicomAttributes;
  k1: array of Integer;
  i: integer;
begin
  SetLength(k1, fFriendList.Count);
  for i := 0 to fFriendList.Count - 1 do
    k1[i] := TDcmConferenceUserInfo(fFriendList[i]).UserID;

  das1 := TDicomAttributes.Create;
  das1.AddVariant($2817, 4, 'SPEAK');
  if AValue then
    das1.AddVariant($2817, $1009, 'F')
  else
    das1.AddVariant($2817, $1009, 'T');

  das1.AddVariant($2817, $2, ConferenceClient.UserID);
  das1.AddVariant($2817, $8, ConferenceClient.UserCode);
  das1.AddVariant($2817, $3, ConferenceClient.UserName);
  das1.AddVariant($2817, $A, ConferenceID);

  if assigned(fOnSendMessage) then
  begin
    fOnSendMessage(self, ConferenceID, k1, das1);
  end
  else
    raise Exception.Create('the send event not set!');
end;

procedure TVideoConferenceForm.SetOwnerInfo(
  const Value: TDcmConferenceUserInfo);
begin
  FOwnerInfo := Value;
end;

procedure TVideoConferenceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if OwnerInfo <> nil then
  begin
    OwnerInfo.DialogForm := nil;
    Action := caFree;
  end;
end;

procedure TVideoConferenceForm.DeleteDialogUser(
  AValue: TDcmConferenceUserInfo);
begin
  fFriendList.Remove(AValue);
end;

function TVideoConferenceForm.GetFriends(
  index: Integer): TDcmConferenceUserInfo;
begin
  Result := TDcmConferenceUserInfo(fFriendList[index]);
end;

procedure TVideoConferenceForm.RemoveAllUsers;
var
  i: Integer;
begin
  for i := FriendCount - 1 downto 0 do
    DeleteAndInformConferenceUsers(Friends[i],
      ConferenceClient, ConferenceID);
end;

function TVideoConferenceForm.GetFriendCount: integer;
begin
  Result := fFriendList.Count;
end;

procedure TVideoConferenceForm.SetCanSendAudio(const Value: Boolean);
begin
  FCanSendAudio := Value;
end;

procedure TVideoConferenceForm.SetCanSendImageSynchronization(
  const Value: Boolean);
begin
  FCanSendImageSynchronization := Value;
end;

procedure TVideoConferenceForm.SetCanSendVideo(const Value: Boolean);
begin
  FCanSendVideo := Value;
end;

function TVideoConferenceForm.GetCanSendAudio: Boolean;
begin
  Result := FCanSendAudio;
end;

function TVideoConferenceForm.GetCanSendImageSynchronization: Boolean;
begin
  Result := FCanSendImageSynchronization;
end;

function TVideoConferenceForm.GetCanSendVideo: Boolean;
begin
  Result := FCanSendVideo;
end;

procedure TVideoConferenceForm.SetCanReceiveAudio(const Value: Boolean);
begin
  FCanReceiveAudio := Value;
end;

procedure TVideoConferenceForm.SetCanReceiveImageSynchronization(
  const Value: Boolean);
begin
  FCanReceiveImageSynchronization := Value;
end;

procedure TVideoConferenceForm.SetCanReceiveVideo(const Value: Boolean);
begin
  FCanReceiveVideo := Value;
end;

function TVideoConferenceForm.GetCanReceiveAudio: Boolean;
begin
  Result := FCanReceiveAudio;
end;

function TVideoConferenceForm.GetCanReceiveImageSynchronization: Boolean;
begin
  Result := FCanReceiveImageSynchronization;
end;

function TVideoConferenceForm.GetCanReceiveVideo: Boolean;
begin
  Result := FCanReceiveVideo;
end;

end.

