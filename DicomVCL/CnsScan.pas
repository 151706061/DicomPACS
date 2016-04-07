{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit CnsScan;

interface

uses
  Windows, { for THandle }
  Classes, { for TStringList }
  SysUtils, { for Exception }
  CnsTwain, { for TTwainData }
  CnsMisc; { for TImageFormat, AddBackSlashToPath, TSingleRect }

type

  TScanner = class(TObject)
  protected
    FTwainData: TTwainData;

    { FCreated is set True when the object is properly created. This
      is used when destroying a partially created TScanner }
    FCreated: Boolean;

    FScanners: TStringList;

    FScannerIndex: Integer;

    procedure LoadTwain;
    procedure UnloadTwain;

    procedure SetScannerIndexFromDefault;

    function GetShowUI: Boolean;
    procedure SetShowUI(const Show: Boolean);

    function GetRequestedXDpi: Word;
    procedure SetRequestedXDpi(const Dpi: Word);

    function GetRequestedYDpi: Word;
    procedure SetRequestedYDpi(const Dpi: Word);

    function GetRequestedImageFormat: TImageFormat;
    procedure SetRequestedImageFormat(const ImageFormat: TImageFormat);

    function GetProductName: string;
    procedure SetProductName(const Name: string);

    procedure SetScannerIndex(const Index: Integer);

  public
    constructor Create;
    destructor Destroy; override;

    { IsConfigured returns True if the scanner drivers are configured on
      computer. }
    function IsConfigured: Boolean;

    { Displays a modal dialog box which allows the user to select the
      scanner. Returns False on user cancel.}
    function SelectScanner: Boolean;

    property Scanners: TStringList read FScanners;

    property ScannerIndex: Integer read FScannerIndex
      write SetScannerIndex;

    procedure Acquire(const AcquireEvent: TAcquireEvent;
      const CallBackData: LongInt);

    { OpenSource, AcquireWithSouceOpen, and CloseSource may be used instead
      of Acquire, to leave the twain source opened between scans. }
    procedure OpenSource;
    procedure AcquireWithSourceOpen(const AcquireEvent: TAcquireEvent;
      const CallBackData: LongInt);
    procedure CloseSource;

    property ShowUI: Boolean read GetShowUI
      write SetShowUI;

    { these options are used  when ShowUI is set False before invoking
      Acquire.

      Defaults: RequestedXDpi        = 200
                RequestedYDpi        = 200
                RequestedImageFormat = ifBlackWhite

    }
    property RequestedXDpi: Word read GetRequestedXDpi
      write SetRequestedXDpi;

    property RequestedYDpi: Word read GetRequestedYDpi
      write SetRequestedYDpi;

    property RequestedImageFormat: TImageFormat
      read GetRequestedImageFormat
      write SetRequestedImageFormat;

    { The ProductName may appear in the scanners interface. }
    property ProductName: string read GetProductName
      write SetProductName;

    { Get/Set the image layout (scanning area). If a scanner is not selected,
      the user will be requested to select one }
    function GetImageLayout(var Rect: TSingleRect): Boolean;
    function SetImageLayout(const Rect: TSingleRect): Boolean;

    function EnableFeeder: Boolean;
    function DisableFeeder: Boolean;
    function FeederLoaded: Boolean;

  end;

  EScannerError = class(Exception);

  { Access to the global scanner. Only created on first call }
function Scanner: TScanner;

{--------------------------------------------------------------------------}

implementation

uses
  Dialogs, { for MessageDlg }
  CnsMsg; { msgXXXX }

var

  InstanceCreated: Boolean;

  GlobalScanner: TScanner;

  {--------------------------------------------------------------------------}

function Scanner: TScanner;
begin
  if GlobalScanner = nil then
    GlobalScanner := TScanner.Create;

  Result := GlobalScanner;
end;

{--------------------------------------------------------------------------}

constructor TScanner.Create;
begin
  inherited Create;

  if InstanceCreated then
    raise EScannerError.Create(msgOnlyOneScannerObjectPermitted);

  FScanners := TStringList.Create;

  FScannerIndex := -1;

  FillChar(FTwainData, SizeOf(FTwainData), 0);
  with FTwainData.AppId do
  begin
    Id := 0;
    Version.MajorNum := 1;
    Version.MinorNum := 0;
    Version.Language := TWLG_ENG;
    Version.Country := TWCY_USA;
    {$WARNINGS Off}
    StrPCopy(@Version.Info, '');
    {$WARNINGS On}
    ProtocolMajor := TWON_PROTOCOLMAJOR;
    ProtocolMinor := TWON_PROTOCOLMINOR;
    SupportedGroups := DG_IMAGE or DG_CONTROL;
    {$WARNINGS Off}
    StrPCopy(@Manufacturer, '');
    StrPCopy(@ProductFamily, '');
    StrPCopy(@ProductName, '');
    {$WARNINGS On}
  end;

  ShowUI := True;
  RequestedXDpi := 200;
  RequestedYDpi := 200;
  RequestedImageFormat := ifBlackWhite;

  InstanceCreated := True;

  FCreated := True;

  { the drivers are only loaded upon the first usage }
end;

{--------------------------------------------------------------------------}

destructor TScanner.Destroy;
var
  Index: Integer;
begin
  UnloadTwain;

  if FCreated then
    InstanceCreated := False;

  for Index := 0 to (FScanners.Count - 1) do
    {$WARNINGS Off}
    FreeMem(Pointer(FScanners.Objects[Index]));
  {$WARNINGS On}

  FScanners.Free;

  inherited Destroy;
end;

{--------------------------------------------------------------------------}

function TScanner.GetProductName: string;
begin
  {$WARNINGS Off}
  Result := PChar(@FTwainData.AppId.ProductName);
  {$WARNINGS On}
end;

{--------------------------------------------------------------------------}

procedure TScanner.SetProductName(const Name: string);
var
  Str32: string[32];
begin
  Str32 := Name;
  {$WARNINGS Off}
  StrPCopy(@FTwainData.AppId.ProductName, Str32);
  {$WARNINGS On}
end;

{--------------------------------------------------------------------------}

function TScanner.GetShowUI: Boolean;
begin
  Result := FTwainData.ShowUI;
end;

{--------------------------------------------------------------------------}

procedure TScanner.SetShowUI(const Show: Boolean);
begin
  FTwainData.ShowUI := Show;
end;

{--------------------------------------------------------------------------}

function TScanner.GetRequestedXDpi: Word;
begin
  Result := FTwainData.XDpi;
end;

{--------------------------------------------------------------------------}

procedure TScanner.SetRequestedXDpi(const Dpi: Word);
begin
  FTwainData.XDpi := Dpi;
end;

{--------------------------------------------------------------------------}

function TScanner.GetRequestedYDpi: Word;
begin
  Result := FTwainData.YDpi;
end;

{--------------------------------------------------------------------------}

procedure TScanner.SetRequestedYDpi(const Dpi: Word);
begin
  FTwainData.YDpi := Dpi;
end;

{--------------------------------------------------------------------------}

function TScanner.GetRequestedImageFormat: TImageFormat;
begin
  Result := FTwainData.ImageFormat;
end;

{--------------------------------------------------------------------------}

procedure TScanner.SetRequestedImageFormat(const ImageFormat: TImageFormat);
begin
  FTwainData.ImageFormat := ImageFormat;
end;

{--------------------------------------------------------------------------}

procedure TScanner.LoadTwain;
var
  TempStr: string;
  Handle32: TW_INT32;
  Identity: TW_IDENTITY;
  pIdentity: ^TW_IDENTITY;
begin
  if FTwainData.DllHandle <> 0 then
    Exit; { already loaded }

  SetLength(TempStr, 255);

  {$WARNINGS Off}
  if GetWindowsDirectory(PChar(TempStr), 255) = 0 then
    {$WARNINGS On}
    raise EScannerError.Create('GetWindowsDirectory failed');

  {$WARNINGS Off}
  SetLength(TempStr, StrLen(PChar(TempStr)));
  {$WARNINGS On}

  TempStr := AddBackSlashToPath(TempStr) + CTwainDllFileName;

  {$WARNINGS Off}
  FTwainData.DllHandle := LoadLibrary(PChar(TempStr));
  {$WARNINGS On}

  if FTwainData.DllHandle <= HINSTANCE_ERROR then
  begin
    { set DllHandle to 0 for proper clean up in UnloadTwain}
    FTwainData.DllHandle := 0;
    raise EScannerError.Create('LoadLibrary(' + TempStr + ') failed');
  end;

  TempStr := 'DSM_Entry';

  {$WARNINGS Off}
  FTwainData.DSMEntry := TDSM_Entry(GetProcAddress(
    FTwainData.DLLHandle, PChar(TempStr)));
  {$WARNINGS On}

  {$WARNINGS Off}
  if @FTwainData.DSMEntry = nil then
    raise EScannerError.Create('GetProcAddress failed: ' + TempStr);
  {$WARNINGS On}

  {$WARNINGS Off}
  FTwainData.ParentHandle := CreateWindow(
    PChar('STATIC'), PChar('Twain Window'),
    WS_POPUPWINDOW,
    Integer(CW_USEDEFAULT), Integer(CW_USEDEFAULT),
    Integer(CW_USEDEFAULT), Integer(CW_USEDEFAULT),
    HWND_DESKTOP,
    0,
    hInstance,
    nil);
  {$WARNINGS On}
  if FTwainData.ParentHandle = 0 then
    raise EScannerError.Create('CreateWindow failed');

  Handle32 := FTwainData.ParentHandle;
  {$WARNINGS Off}
  if not CallTriplet(nil, @FTwainData.AppId,
    DG_CONTROL, DAT_PARENT, MSG_OPENDSM,
    @Handle32, nil, FTwainData.DsmEntry) then
    raise EScannerError.Create(msgUnableToOpenTWAINSourceManager);
  {$WARNINGS On}

  { assert: TWAIN is currently in state 3, 'Source Manager Opened' }

  { get list of scanners }
  {$WARNINGS Off}
  if CallTriplet(nil, @FTwainData.AppId,
    DG_CONTROL, DAT_IDENTITY, MSG_GETFIRST,
    @Identity, nil, FTwainData.DsmEntry) then
    repeat
      FScanners.Add(Identity.ProductName);

      GetMem(pIdentity, SizeOf(TW_IDENTITY));
      pIdentity^ := Identity;

      FScanners.Objects[FScanners.Count - 1] := TObject(pIdentity);
    until not CallTriplet(nil, @FTwainData.AppId,
      DG_CONTROL, DAT_IDENTITY, MSG_GETNEXT,
      @Identity, nil, FTwainData.DsmEntry);
  {$WARNINGS On}

  SetScannerIndexFromDefault;

end;

{--------------------------------------------------------------------------}

procedure TScanner.UnloadTwain;
var
  Handle32: TW_INT32;
begin
  if FTwainData.ParentHandle <> 0 then
  begin
    Handle32 := FTwainData.ParentHandle;
    {$WARNINGS Off}
    CallTriplet(nil, @FTwainData.AppId,
      DG_CONTROL, DAT_PARENT, MSG_CLOSEDSM, @Handle32,
      nil, FTwainData.DsmEntry);
    {$WARNINGS On}

    DestroyWindow(FTwainData.ParentHandle);
    FTwainData.ParentHandle := 0;
  end;

  if FTwainData.DLLHandle <> 0 then
  begin
    FreeLibrary(FTwainData.DLLHandle);

    FTwainData.DLLHandle := 0;
    FTwainData.DSMEntry := nil;
  end;
end;

{--------------------------------------------------------------------------}

function TScanner.SelectScanner: Boolean;
begin
  LoadTwain;

  FillChar(FTwainData.SourceId, SizeOf(FTwainData.SourceId), 0);

  {$WARNINGS Off}
  Result := CallTriplet(nil, @FTwainData.AppId,
    DG_CONTROL, DAT_IDENTITY, MSG_USERSELECT,
    @FTwainData.SourceId, nil, FTwainData.DsmEntry);
  {$WARNINGS On}

  SetScannerIndexFromDefault;
end;

{--------------------------------------------------------------------------}

procedure TScanner.SetScannerIndexFromDefault;
var
  Identity: TW_IDENTITY;
  Index: Integer;
begin
  {$WARNINGS Off}
  if not CallTriplet(nil, @FTwainData.AppId,
    DG_CONTROL, DAT_IDENTITY, MSG_GETDEFAULT,
    @Identity, nil, FTwainData.DsmEntry) then
    {$WARNINGS On}
    raise EScannerError.Create(msgUnableToGetTwainDefaultSource);

  Index := FScanners.IndexOf(Identity.ProductName);
  if Index >= 0 then
    FScannerIndex := Index;
end;

{--------------------------------------------------------------------------}

procedure TScanner.SetScannerIndex(const Index: Integer);
begin
  if (Index < 0) or (Index >= FScanners.Count) then
    Exit;

  FScannerIndex := Index;
end;

{--------------------------------------------------------------------------}

function TScanner.IsConfigured: Boolean;
begin
  { check is loaded first }
  Result := (FTwainData.DLLHandle <> 0);

  if not Result then
  begin
    Result := True;
    try
      LoadTwain;
    except
      Result := False;
    end;
  end;
end;

{--------------------------------------------------------------------------}

function Fix32ToSingle(const Fix32: TW_FIX32): Single;
begin
  Result := 1.0 * Fix32.Whole + (1.0 * Fix32.Frac / 65536.0);
end;

{--------------------------------------------------------------------------}

function SingleToFix32(const SingleValue: Single): TW_FIX32;
var
  Value: TW_INT32;
begin
  Value := TW_INT32(Round(SingleValue * 65536.0 + 0.50));
  Result.Whole := LOWORD(Value shr 16);
  Result.Frac := LOWORD(Value and $0000FFFF);
end;

{--------------------------------------------------------------------------}

{ for debugging }

procedure ShowLayout(const Layout: TW_ImageLayout);
var
  Str: string;
begin
  Str := 'Frame.Left: ' + FloatToStr(Fix32ToSingle(Layout.Frame.Left)) + #13 +
    'Frame.Top: ' + FloatToStr(Fix32ToSingle(Layout.Frame.Top)) + #13 +
    'Frame.Top: ' + FloatToStr(Fix32ToSingle(Layout.Frame.Right)) + #13 +
    'Frame.Top: ' + FloatToStr(Fix32ToSingle(Layout.Frame.Bottom)) + #13 +
    Format('DocumentNumber: %d', [Layout.DocumentNumber]) + #13 +
    Format('PageNumber: %d', [Layout.PageNumber]) + #13 +
    Format('FrameNumber: %d', [Layout.FrameNumber]);

  MessageDlg(Str, mtInformation, [mbOk], 0);

end;

{--------------------------------------------------------------------------}

function TScanner.GetImageLayout(var Rect: TSingleRect): Boolean;
var
  twRC: TW_UINT16;
  twImageLayout: TW_IMAGELAYOUT;
begin
  if FTwainData.SourceID.ID = 0 then
    raise EScannerError.Create(msgTwainSourceMustBeOpen);

  FillChar(twImageLayout, SizeOf(twImageLayout), 0);
  {$WARNINGS Off}
  twRc := FTwainData.DsmEntry(@FTwainData.AppId, @FTwainData.SourceId,
    DG_IMAGE, DAT_IMAGELAYOUT, MSG_GET, @twImageLayout);
  {$WARNINGS On}
  case twRC of
    TWRC_SUCCESS:
      begin
        Rect.Left := FIX32ToSingle(twImageLayout.Frame.Left);
        Rect.Top := FIX32ToSingle(twImageLayout.Frame.Top);
        Rect.Right := FIX32ToSingle(twImageLayout.Frame.Right);
        Rect.Bottom := FIX32ToSingle(twImageLayout.Frame.Bottom);
        Result := True;

        ShowLayout(twImageLayout);
      end
  else
    begin
      Rect.Left := -1;
      Rect.Top := -1;
      Rect.Right := -1;
      Rect.Bottom := -1;
      Result := False;
    end;
  end;
end;

{--------------------------------------------------------------------------}

function TScanner.SetImageLayout(const Rect: TSingleRect): Boolean;
var
  twRC: TW_UINT16;
  twImageLayout: TW_IMAGELAYOUT;
begin
  if FTwainData.SourceID.ID = 0 then
    raise EScannerError.Create(msgTwainSourceMustBeOpen);

  FillChar(twImageLayout, SizeOf(twImageLayout), 0);
  {$WARNINGS Off}
  FTwainData.DsmEntry(@FTwainData.AppId, @FTwainData.SourceId, DG_IMAGE,
    DAT_IMAGELAYOUT, MSG_GET, @twImageLayout);
  {$WARNINGS On}

  twImageLayout.Frame.Left := SingleToFix32(Rect.Left);
  twImageLayout.Frame.Top := SingleToFix32(Rect.Top);
  twImageLayout.Frame.Right := SingleToFix32(Rect.Right);
  twImageLayout.Frame.Bottom := SingleToFix32(Rect.Bottom);

  {$WARNINGS Off}
  twRc := FTwainData.DsmEntry(@FTwainData.AppId, @FTwainData.SourceId,
    DG_IMAGE, DAT_IMAGELAYOUT, MSG_SET, @twImageLayout);
  {$WARNINGS On}
  Result := (twRC = TWRC_SUCCESS);
end;

{--------------------------------------------------------------------------}

{ MB Feb 26, 2001. Moved from .Acquire is this routine is now shared
  applies the current options in pTwainData^ to the currently opened
  source. }

procedure ApplyOptions(var TwainData: TTwainData);
var
  Fix32: TW_FIX32;
  PixelType: TW_UINT16;
  BitDepth: TW_UINT16;

begin
  Fix32.Whole := TwainData.XDpi;
  Fix32.Frac := 0;
  {$WARNINGS Off}
  SetSingleValueCap(ICAP_XRESOLUTION, TWTY_FIX32, Fix32.Long,
    @TwainData.SourceId, @TwainData.AppId, TwainData.DsmEntry);
  {$WARNINGS On}

  Fix32.Whole := TwainData.YDpi;
  Fix32.Frac := 0;
  {$WARNINGS Off}
  SetSingleValueCap(ICAP_YRESOLUTION, TWTY_FIX32, Fix32.Long,
    @TwainData.SourceId, @TwainData.AppId, TwainData.DsmEntry);
  {$WARNINGS On}

  case TwainData.ImageFormat of

    ifBlackWhite:
      begin
        PixelType := TWPT_BW;
        BitDepth := 1;
      end;

    ifGray16:
      begin
        PixelType := TWPT_GRAY;
        BitDepth := 4;
      end;

    ifGray256:
      begin
        PixelType := TWPT_GRAY;
        BitDepth := 8;
      end;

    ifColor16:
      begin
        PixelType := TWPT_PALETTE;
        BitDepth := 4;
      end;

    ifColor256:
      begin
        PixelType := TWPT_PALETTE;
        BitDepth := 8;
      end;

    ifTrueColor:
      begin
        PixelType := TWPT_RGB;
        BitDepth := 24;
      end;

  else
    raise ETwainError.Create('Invalid image type');
  end; { case }

  { NOTE: pixel type must be set before bit depth }
  {$WARNINGS Off}
  SetSingleValueCap(ICAP_PIXELTYPE, TWTY_UINT16, PixelType,
    @TwainData.SourceId, @TwainData.AppId, TwainData.DsmEntry);
  SetSingleValueCap(ICAP_BITDEPTH, TWTY_UINT16, BitDepth,
    @TwainData.SourceId, @TwainData.AppId, TwainData.DsmEntry);
  {$WARNINGS On}
end; { ApplyOptions }

{--------------------------------------------------------------------------}

procedure TScanner.Acquire(const AcquireEvent: TAcquireEvent;
  const CallBackData: LongInt);
var
  WasEnabled: Boolean;
  TwainUI: TW_USERINTERFACE;
  pSourceID: PTW_IDENTITY;

begin
  LoadTwain;

  {$WARNINGS Off}
  pSourceID := Pointer(FScanners.Objects[FScannerIndex]);
  {$WARNINGS On}

  { The twain documentation on dg_control|dat_identity|msg_opends seems to
    indicate to pass the complete pSourceID obtained before to select
    explicitely the scanner. After testing, this was giving an error, and
    simply setting the ProductName seems to work fine. }
  FTwainData.SourceID.ProductName := pSourceID^.ProductName;

  {$WARNINGS Off}
  if not CallTriplet(nil, @FTwainData.AppId, DG_CONTROL, DAT_IDENTITY, MSG_OPENDS,
    @FTwainData.SourceID, nil, FTwainData.DsmEntry) then
    {$WARNINGS On}
    raise ETwainError.Create(msgUnableToOpenTwainSource);

  try
    WasEnabled := not EnableWindow(FTwainData.ParentHandle, False);
    try
      { ensure native transfer mode is used }
      {$WARNINGS Off}
      SetSingleValueCap(ICAP_XFERMECH, TWTY_UINT16, TWSX_NATIVE,
        @FTwainData.SourceId, @FTwainData.AppId, FTwainData.DsmEntry);

      { ensure any number of images may be scanned }
      SetSingleValueCap(CAP_XFERCOUNT, TWTY_INT16, -1,
        @FTwainData.SourceId, @FTwainData.AppId, FTwainData.DsmEntry);

      { ensure units is inches }
      SetSingleValueCap(ICAP_UNITS, TWTY_UINT16, TWUN_INCHES,
        @FTwainData.SourceId, @FTwainData.AppId, FTwainData.DsmEntry);
      {$WARNINGS On}

      if not FTwainData.ShowUI then
        ApplyOptions(FTwainData);

      FillChar(TwainUI, SizeOf(TwainUI), 0);
      TwainUI.ShowUI := FTwainData.ShowUI;
      TwainUI.hParent := FTwainData.ParentHandle;

      {$WARNINGS Off}
      if not CallTriplet(@FTwainData.SourceId, @FTwainData.AppId,
        DG_CONTROL, DAT_USERINTERFACE,
        MSG_ENABLEDS, @TwainUI, nil, FTwainData.DsmEntry) then
        {$WARNINGS On}
        raise ETwainError.Create('Unable to enable twain source.');

      try
        {$WARNINGS Off}
        ProcessImages(AcquireEvent,
          @FTwainData.SourceId, @FTwainData.AppId,
          FTwainData.DsmEntry, CallBackData);
        {$WARNINGS On}
      finally
        {$WARNINGS Off}
        CallTriplet(
          @FTwainData.SourceId, @FTwainData.AppId,
          DG_CONTROL, DAT_USERINTERFACE, MSG_DISABLEDS, @TwainUI,
          nil, FTwainData.DsmEntry);
        {$WARNINGS On}
      end;

    finally
      EnableWindow(FTwainData.ParentHandle, WasEnabled);
    end;

  finally
    if FTwainData.SourceId.Id <> 0 then
    begin
      {$WARNINGS Off}
      if not CallTriplet(nil, @FTwainData.AppId, DG_CONTROL, DAT_IDENTITY, MSG_CLOSEDS,
        @FTwainData.SourceId, nil, FTwainData.DsmEntry) then
        {$WARNINGS On}
        raise ETwainError.Create('Unable to close TWAIN data source');

      FillChar(FTwainData.SourceId, SizeOf(FTwainData.SourceId), 0);
    end;
  end;
end;

{--------------------------------------------------------------------------}

procedure TScanner.OpenSource;
var
  pSourceID: ^TW_IDENTITY;

begin
  LoadTwain;

  {$WARNINGS Off}
  pSourceID := Pointer(FScanners.Objects[FScannerIndex]);
  {$WARNINGS On}

  { The twain documentation on dg_control|dat_identity|msg_opends seems to
    indicate to pass the complete pSourceID obtained before to select
    explicitely the scanner. After testing, this was giving an error, and
    simply setting the ProductName seems to work fine. }
  FTwainData.SourceID.ProductName := pSourceID^.ProductName;

  {$WARNINGS Off}
  if not CallTriplet(nil, @FTwainData.AppId, DG_CONTROL, DAT_IDENTITY, MSG_OPENDS,
    @FTwainData.SourceID, nil, FTwainData.DsmEntry) then
    {$WARNINGS On}
    raise ETwainError.Create(msgUnableToOpenTwainSource);
  try
    { ensure native transfer mode is used }
    {$WARNINGS Off}
    SetSingleValueCap(ICAP_XFERMECH, TWTY_UINT16, TWSX_NATIVE,
      @FTwainData.SourceId, @FTwainData.AppId, FTwainData.DsmEntry);

    { ensure any number of images may be scanned }
    SetSingleValueCap(CAP_XFERCOUNT, TWTY_INT16, -1,
      @FTwainData.SourceId, @FTwainData.AppId, FTwainData.DsmEntry);

    { ensure units is inches }
    SetSingleValueCap(ICAP_UNITS, TWTY_UINT16, TWUN_INCHES,
      @FTwainData.SourceId, @FTwainData.AppId, FTwainData.DsmEntry);
    {$WARNINGS On}

    { apply the options even if ShowUI is True, as this may set the default
      in the scanner's interface. }
    ApplyOptions(FTwainData);

  except
    CloseSource;
  end;
end;

{--------------------------------------------------------------------------}

procedure TScanner.AcquireWithSourceOpen(const AcquireEvent: TAcquireEvent;
  const CallBackData: LongInt);
var
  TwainUI: TW_USERINTERFACE;
begin
  if FTwainData.SourceID.ID = 0 then
    raise EScannerError.Create(msgTwainSourceMustBeOpen);

  try
    FillChar(TwainUI, SizeOf(TwainUI), 0);
    TwainUI.ShowUI := FTwainData.ShowUI;
    TwainUI.hParent := FTwainData.ParentHandle;

    {$WARNINGS Off}
    if not CallTriplet(@FTwainData.SourceId, @FTwainData.AppId,
      DG_CONTROL, DAT_USERINTERFACE,
      MSG_ENABLEDS, @TwainUI, nil, FTwainData.DsmEntry) then
      {$WARNINGS On}
      raise ETwainError.Create('Unable to enable twain source.');

    {$WARNINGS Off}
    ProcessImages(AcquireEvent,
      @FTwainData.SourceId, @FTwainData.AppId,
      FTwainData.DsmEntry, CallBackData);
    {$WARNINGS On}

  finally
    {$WARNINGS Off}
    CallTriplet(@FTwainData.SourceId, @FTwainData.AppId,
      DG_CONTROL, DAT_USERINTERFACE,
      MSG_DISABLEDS, @TwainUI, nil, FTwainData.DsmEntry);
    {$WARNINGS On}
  end;
end;

{--------------------------------------------------------------------------}

procedure TScanner.CloseSource;
var
  TwainUI: TW_USERINTERFACE;
begin
  if FTwainData.SourceId.Id <> 0 then
  begin
    try
      FillChar(TwainUI, SizeOf(TwainUI), 0);
      TwainUI.ShowUI := FTwainData.ShowUI;
      TwainUI.hParent := FTwainData.ParentHandle;

      {$WARNINGS Off}
      CallTriplet(
        @FTwainData.SourceId, @FTwainData.AppId,
        DG_CONTROL, DAT_USERINTERFACE, MSG_DISABLEDS, @TwainUI,
        nil, FTwainData.DsmEntry);
      {$WARNINGS On}

    finally
      {$WARNINGS Off}
      if not CallTriplet(nil, @FTwainData.AppId, DG_CONTROL, DAT_IDENTITY, MSG_CLOSEDS,
        @FTwainData.SourceId, nil, FTwainData.DsmEntry) then
        {$WARNINGS On}
        raise ETwainError.Create('Unable to close TWAIN data source');

      FillChar(FTwainData.SourceId, SizeOf(FTwainData.SourceId), 0);
    end;
  end;
end;

{--------------------------------------------------------------------------}

function TScanner.EnableFeeder: Boolean;
var
  Cap: TW_CAPABILITY;
  p: pTW_ONEVALUE;
  Status: TW_INT16;
begin
  LoadTwain;
  Cap.Cap := CAP_FEEDERENABLED;
  Cap.ConType := TWON_ONEVALUE;
  Cap.hContainer := 0;
  {$WARNINGS Off}
  status := FTwainData.DsmEntry(@FTwainData.AppId, @FTwainData.SourceId,
    DG_CONTROL, DAT_CAPABILITY, MSG_GET,
    TW_MEMREF(@Cap));
  {$WARNINGS On}
  if Status <> TWRC_SUCCESS then
  begin
    GlobalFree(Cap.hContainer);
    Result := False;
  end
  else
  begin
    p := pTW_ONEVALUE(GlobalLock(cap.hContainer));
    if Boolean(p^.Item) = True then
    begin
      GlobalUnlock(cap.hContainer);
      GlobalFree(cap.hContainer);
      Result := True;
    end
    else
    begin
      p^.ItemType := TWTY_BOOL;
      p^.Item := Cardinal(True);
      GlobalUnlock(cap.hContainer);
      {$WARNINGS Off}
      status := FTwainData.DsmEntry(@FTwainData.appID, @FTwainData.SourceId,
        DG_CONTROL, DAT_CAPABILITY, MSG_SET,
        TW_MEMREF(@cap));
      {$WARNINGS On}
      GlobalFree(cap.hContainer);
      if Status = TWRC_SUCCESS then
        Result := True
      else
        Result := False;
    end;
  end;
end;

{--------------------------------------------------------------------------}

function TScanner.DisableFeeder: Boolean;
var
  Cap: TW_CAPABILITY;
  p: pTW_ONEVALUE;
  Status: TW_INT16;
begin
  LoadTwain;
  Cap.Cap := CAP_FEEDERENABLED;
  Cap.ConType := TWON_ONEVALUE;
  Cap.hContainer := 0;
  { get feeder status }
  {$WARNINGS Off}
  Status := FTwainData.DsmEntry(@FTwainData.AppId,
    @FTwainData.SourceId, DG_CONTROL, DAT_CAPABILITY, MSG_GET,
    TW_MEMREF(@Cap));
  {$WARNINGS On}
  if Status <> TWRC_SUCCESS then
  begin
    { error or no feeder support }
    GlobalFree(CAp.hContainer);
    Result := False;
  end
  else
  begin
    { check feeder status }
    p := pTW_ONEVALUE(GlobalLock(cap.hContainer));
    if Boolean(p^.Item) = True then
    begin
      { feeder is enabled }
      GlobalUnlock(cap.hContainer);
      p.ItemType := TWTY_BOOL;
      p.Item := Cardinal(False);
      GlobalUnlock(cap.hContainer);
      { disable feeder }
      {$WARNINGS Off}
      Status := FTwainData.DsmEntry(@FTwainData.appID,
        @FTwainData.SourceId, DG_CONTROL, DAT_CAPABILITY, MSG_SET,
        TW_MEMREF(@cap));
      {$WARNINGS On}
      GlobalFree(cap.hContainer);
      if Status = TWRC_SUCCESS then
        Result := True
      else
        Result := False;

      GlobalFree(cap.hContainer);
      Cap.Cap := CAP_FEEDERENABLED;
      Cap.ConType := TWON_ONEVALUE;
      Cap.hContainer := 0;
      { check if feeder is really disabled }
      {$WARNINGS Off}
      status := FTwainData.DsmEntry(@FTwainData.AppId,
        @FTwainData.SourceId, DG_CONTROL, DAT_CAPABILITY, MSG_GET,
        TW_MEMREF(@Cap));
      {$WARNINGS On}
      if Status = TWRC_SUCCESS then
      begin
        p := pTW_ONEVALUE(GlobalLock(cap.hContainer));
        if Boolean(p.Item) = True then
          Result := False
        else
          Result := True;
      end;
    end
    else
    begin
      Result := True;
      GlobalUnlock(cap.hContainer);
      GlobalFree(cap.hContainer);
    end;
  end;
end;

{--------------------------------------------------------------------------}

function TScanner.FeederLoaded: Boolean;
var
  Cap: TW_CAPABILITY;
  Status: TW_INT16;
  p: pTW_ONEVALUE;
begin
  LoadTwain;
  Cap.Cap := CAP_FEEDERLOADED;
  Cap.ConType := TWON_DONTCARE16;
  {$WARNINGS Off}
  status := FTwainData.DsmEntry(@FTwainData.AppId,
    @FTwainData.SourceId, DG_CONTROL, DAT_CAPABILITY, MSG_GET,
    @Cap);
  {$WARNINGS On}
  if status <> TWRC_SUCCESS then
    Result := False
  else
  begin
    p := pTW_ONEVALUE(GlobalLock(Cap.hContainer));
    if Boolean(p^.Item) = True then
      Result := True
    else
      Result := False;
    GlobalUnlock(cap.hContainer);
    GlobalFree(cap.hContainer);
  end;
end;

{--------------------------------------------------------------------------}

initialization

  InstanceCreated := False;
  GlobalScanner := nil;

finalization

  if GlobalScanner <> nil then
    GlobalScanner.Free;

end.

