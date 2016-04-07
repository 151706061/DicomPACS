unit uPhone;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Controls,
 TAPI3Lib_TLB, OleServer, ActiveX, StdCtrls, ComObj, Dialogs;

type
  TPhone = class(TComponent, ITTAPIEventNotification)
  private
    FTapi : TTAPI;
    FAddressIndex :Integer;
    FAddressName : string;
    FCP : IConnectionPoint;
    FAdvise : Integer;
    FRegisterCallNotifycation:Integer;
    FIsBusy : Boolean;
    FOnOffering:TGetStrProc;
    FOnConnected:TGetStrProc;
    FOnDisconected:TGetStrProc;
    FOnHold:TGetStrProc;
    FOnEvent:TGetStrProc;
    pSeeCall : ITCallInfo;

    function GetIsInitialize():Boolean;
    function GetCurrentAddress():ITAddress;
  protected
    procedure DoOnOffering(aPhoneNumber:String);
    procedure DoOnConnected(aPhoneNumber:String);
    procedure DoOnDisconected(aPhoneNumber:String);
    procedure DoOnHold(aPhoneNumber:String);
    procedure DoOnEvent(aPhoneNumber:String);
    function Event(TapiEvent : TAPI_EVENT; const pEvent : IDispatch) : HRESULT; stdcall;
  public
    constructor Create(AOwner: TComponent);override;
    destructor Destroy();override;

    function Init(aAddressName:string):Boolean;
    procedure MakeCall( Number:string);
    procedure Transfer( Number:string);

    property IsBusy:Boolean read FIsBusy;
    property IsInitialize:Boolean read GetIsInitialize;
    property OnOffering:TGetStrProc read FOnOffering write FOnOffering;
    property OnConnected:TGetStrProc read FOnConnected write FOnConnected;
    property OnDisconected:TGetStrProc read FOnDisconected write FOnDisconected;
    property OnHold:TGetStrProc read FOnHold write FOnHold;
    property OnEvent:TGetStrProc read FOnEvent write FOnEvent;
  end;

const
  TAPI_E_NOT_INITIALIZED = $80040059;
  TAPIMEDIATYPE_AUDIO = $8;
  TAPIMEDIATYPE_VEDIO = $8000;
  TAPIMEDIATYPE_DATEMODEM = $10;
  TAPIMEDIATYPE_G3FAX = $20;
  LINEADDRESSTYPE_PHONENUMBER = $00000001;

  CS_IDLE	= 0;
  CS_INPROGRESS	= 1;
  CS_CONNECTED	= 2;
  CS_DISCONNECTED	= 3;
  CS_OFFERING	= 4;
  CS_HOLD	= 5;
  CS_QUEUED	= 6;
  CS_LASTITEM	= 6;

 IID_IConnectionPointContainer : TGUID = '{B196B284-BAB4-101A-B69C-00AA00341D07}';

implementation
uses fMain;

function VerboseCallState(aState:CALL_STATE) : string;
begin
  case aState of
    CS_IDLE : Result := 'CS_IDLE';
    CS_INPROGRESS : Result := 'CS_INPROGRESS';
    CS_CONNECTED : Result := 'CS_CONNECTED';
    CS_DISCONNECTED : Result := 'CS_DISCONNECTED';
    CS_OFFERING : Result := 'CS_OFFERING';
    CS_HOLD : Result := 'CS_HOLD';
    CS_QUEUED : Result := 'CS_QUEUED,CS_LASTITEM';
    else  Result := 'Unknown State = ' + IntToStr(aState);
  end;
  frmMain.Lg_ev('VerboseCallState '+Result, 'c:\Taxi\uPhone.log');  
end;

constructor TPhone.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);

  FTapi := TTAPI.Create(Self);
  FTapi.Initialize;
  FAddressIndex := -1;
  FIsBusy := false;
end;

destructor TPhone.Destroy();
var idAddress:ITAddress;
begin
  pSeeCall := nil;
  if (IsInitialize) then
    begin
      idAddress := GetCurrentAddress();
      if (idAddress<>nil) then
        begin
          FTapi.UnregisterNotifications(FRegisterCallNotifycation);
        end;
      if (FCP<>nil) then
        begin
          FCP.Unadvise(FAdvise);
        end;
    end;
  FTapi.Shutdown;
  FTapi.Free;
  inherited Destroy();
end;

function TPhone.Init(aAddressName:string):Boolean;
var i : Integer;
    cAddresses : ITCollection;
    Addresses : IDispatch;
    Address : IDispatch;
    idAddress : ITAddress;
    pCPC : IConnectionPointContainer;
    pUnk : ITTAPIEventNotification;
    hr : HRESULT;

  procedure DoFalseResult();
    begin
      Result := False;
      FAddressIndex := -1;
    end;
begin
  DoFalseResult();
  FAddressName := aAddressName;
  try
    Addresses := FTapi.Addresses;
    cAddresses := Addresses as ITCollection;
    for i := 1 to cAddresses.Count do
      begin
        Address := cAddresses.Get_Item(i);
        idAddress := Address as ITAddress;
        if idAddress <> nil then
          begin
            if (idAddress.AddressName = FAddressName) then
              begin
                FAddressIndex := i;  // для второго телефона тут -1 Prihodko
                Result := true;
                Break;
              end;
          end;
      end;
  except
    on E : Exception do
     Result := false;
  end;
  if FAddressIndex > 0 then
    begin
      try
        hr := FTapi.DefaultInterface.QueryInterface(IID_IConnectionPointContainer, pCPC);
        if hr <> s_ok then
          begin
            DoFalseResult();
          end;
        hr := pCPC.FindConnectionPoint(IID_ITTAPIEventNotification, FCP);
        if hr <> s_ok then
          begin
            DoFalseResult();
          end;
        hr := Self.QueryInterface(IID_ITTAPIEventNotification, pUnk);
        if hr <> s_ok then
          begin
            DoFalseResult();
          end;
        hr := FCP.Advise(pUnk, FAdvise);
        if hr <> s_ok then
          begin
            DoFalseResult();
          end;

        FTapi.EventFilter := TE_TAPIOBJECT or
                             TE_ADDRESS or
                             TE_CALLNOTIFICATION or
                             TE_CALLSTATE or
                             TE_CALLMEDIA or
                             TE_CALLHUB or
                             TE_CALLINFOCHANGE or
                             TE_PRIVATE or
                             TE_REQUEST or
                             TE_AGENT or
                             TE_AGENTSESSION or
                             TE_QOSEVENT or
                             TE_AGENTHANDLER or
                             TE_ACDGROUP or
                             TE_QUEUE or
                             TE_DIGITEVENT or
                             TE_GENERATEEVENT or
                             TE_ASRTERMINAL or
                             TE_TTSTERMINAL or
                             TE_FILETERMINAL or
                             TE_TONETERMINAL or
                             TE_PHONEEVENT or
                             TE_TONEEVENT or
                             TE_GATHERDIGITS or
                             TE_ADDRESSDEVSPECIFIC or
                             TE_PHONEDEVSPECIFIC;
        idAddress := GetCurrentAddress();
        FRegisterCallNotifycation := FTapi.RegisterCallNotifications(idAddress, true, true, $8, FAdvise);
      except
        on E:Exception do
          begin
            ShowMessage(e.Message);
            DoFalseResult();
          end;
      end;
   end;
end;

function TPhone.GetIsInitialize():Boolean;
begin
  Result := FAddressIndex > 0;
end;

function TPhone.Event(TapiEvent : TAPI_EVENT; const pEvent : IDispatch) : HRESULT;
var pNotify : ITCallNotificationEvent;
    pNotifyState : ITCallStateEvent;
    pCallInfo : ITCallInfo;
    hr : HRESULT;
    call_number:WideString;

  procedure DescribeCall();
    begin
      if pCallInfo <> nil then
        begin
          DoOnEvent(VerboseCallState(pCallInfo.CallState));
          if pCallInfo.CallState = CS_CONNECTED then
            DoOnConnected(call_number);
          if pCallInfo.CallState=CS_HOLD then
            DoOnHold(call_number);
          if pCallInfo.CallState=CS_DISCONNECTED then
            begin
              pSeeCall := nil;
              DoOnDisconected(call_number);
            end;
        end;
    end;
begin
  Result := S_OK;
  case TapiEvent of
    TE_CALLNOTIFICATION : // 4
    begin
      frmMain.Lg_ev(DateTimeToStr(Date)+' TPhone.Event TE_CALLNOTIFICATION', 'c:\Taxi\uPhone.log');
      hr := pEvent.QueryInterface(IID_ITCallNotificationEvent, pNotify);
      if hr <> s_ok then
        Exit;
      pCallInfo := pNotify.Call;
      pSeeCall := pNotify.Call;
      try
        call_number := pCallInfo.CallInfoString[CIS_CALLERIDNUMBER]
      except
        call_number := 'н/о';
      end;
      DoOnOffering(call_number);
      DescribeCall();
    end;

    TE_CALLSTATE : // 8
    begin
      frmMain.Lg_ev(DateTimeToStr(Date)+'TPhone.Event TE_CALLSTATE', 'c:\Taxi\uPhone.log');
      hr := pEvent.QueryInterface(IID_ITCallStateEvent, pNotifyState);
      if hr <> s_ok then
        Exit;
      pCallInfo := pNotifyState.Call;
      try
        call_number := pCallInfo.CallInfoString[CIS_CALLERIDNUMBER]
      except
        call_number := 'н/о';
      end;
      DescribeCall();
    end;

    TE_CALLINFOCHANGE:
    begin
      frmMain.Lg_ev(DateTimeToStr(Date)+'TPhone.Event TE_CALLINFOCHANGE', 'c:\Taxi\uPhone.log');
      DescribeCall();
    end;

    TE_CALLHUB:
    begin
      frmMain.Lg_ev(DateTimeToStr(Date)+'TPhone.Event TE_CALLHUB', 'c:\Taxi\uPhone.log');
      DescribeCall();
    end;

    TE_QUEUE:
    begin
      frmMain.Lg_ev(DateTimeToStr(Date)+'TPhone.Event TE_QUEUE', 'c:\Taxi\uPhone.log');
    end;
 end;
end;

function TPhone.GetCurrentAddress():ITAddress;
var cAddresses : ITCollection;
    Addresses: IDispatch;
    idAddress : IDispatch;
begin
  if IsInitialize then
    begin
      Addresses := FTapi.Addresses;
      cAddresses := Addresses as ITCollection;
      idAddress := cAddresses.Get_Item(FAddressIndex);
      Result := idAddress as ITAddress;
    end else
    begin
      Result := nil;
    end;
end;

procedure TPhone.MakeCall(Number:string);
var Address:ITAddress;
    pCall:ITBasicCallControl;
begin
  if not (IsInitialize) then
    Exit;
  Address := GetCurrentAddress();
  if Address <> nil then
    begin                                  // !!! смотреть Prihodko
      pCall := Address.CreateCall(Number, LINEADDRESSTYPE_PHONENUMBER, TAPIMEDIATYPE_AUDIO);
      pCall.Connect(False);
    end;
end;

procedure TPhone.Transfer(Number:string);
var Address : ITAddress;
    CallInfo : ITCallInfo;
    pCall : ITBasicCallControl;
    EnumCall : IEnumCall;
    dummy : Cardinal;
begin
  Address := GetCurrentAddress();
  if Address<>nil then
    begin
      EnumCall := Address.EnumerateCalls;
      while true do
        begin
          EnumCall.Next(1, CallInfo, dummy);
          if CallInfo = nil then
            Exit
          else
            Break;
        end;

      if CallInfo <> nil then
        begin
          pCall := CallInfo as ITBasicCallControl;
          if (CallInfo.CallState in [CS_CONNECTED]) and (pCall<>nil) then
            begin
              pCall.BlindTransfer(Number);
            end;
        end;
    end;
end;

procedure TPhone.DoOnOffering(aPhoneNumber:String);
begin
  FIsBusy := True;
  if Assigned(FOnOffering) then
    FOnOffering(aPhoneNumber);
end;

procedure TPhone.DoOnConnected(aPhoneNumber:String);
begin
  FIsBusy := True;
  if Assigned(FOnConnected) then
    FOnConnected(aPhoneNumber);
end;

procedure TPhone.DoOnDisconected(aPhoneNumber:String);
begin
  FIsBusy := False;
  if Assigned(FOnDisconected) then
    FOnDisconected(aPhoneNumber);
end;

procedure TPhone.DoOnHold(aPhoneNumber:String);
begin
  FIsBusy := True;
  if Assigned(FOnHold) then
    FOnHold(aPhoneNumber);
end;

procedure TPhone.DoOnEvent(aPhoneNumber:String);
begin
  if Assigned(FOnEvent) then
    FOnEvent(aPhoneNumber);
end;

end.
