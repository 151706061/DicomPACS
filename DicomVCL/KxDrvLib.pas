{*******************************************************************************
  Unit        : mbSCSILib.pas
  Date        : Jul 2001 - Apr 2004
  Author      : Ehsan Khan
  Description :
  Copyright   : 2001-04 Binary Magic, All rights reserved.
{******************************************************************************}
Unit KxDrvLib;

Interface
{$I DEFINES.INC}
{$DEFINE DEBUG}

Uses
  Windows, Messages, SysUtils, Classes, KxASPI, Math, SyncObjs, KxConst, KxSPTI;

Var
  CommandName: Array[0..254] Of String;
  TrialMCDB: Boolean = True;
  TrialMCB: Boolean = True;
  GenerateLogs: Boolean = False;

Const
  etQuick = 1;
  etComplete = 0;
  etTrack = 2;

  dsEmptyDisc = 0;
  dsIncompleteDisc = 1;
  dsCompleteDisc = 2;
  dsOther = 3;
  lsEmptySession = 0;
  lsIncompleteLastSession = 1;
  lsDamagedLastSession = 2;
  lsCompleteLastSession = 3;
  bfNoRewriteable = 0;
  bfError = 1;
  bfInProgress = 2;
  bfDone = 3;

  dtNoDevice = -1;
  dtUnKnown = -2;
  dtDirectAccess = 0;
  dtSeqAccess = 1;
  dtPrinter = 2;
  dtProcessor = 3;
  dtWORM = 4;
  dtCDROM = 5;

  mtUNKNOWN = 0;
  mtCD_ROM = 1;
  mtCD_R = 2;
  mtCD_RW = 3;
  mtDVD_ROM = 4;
  mtDVD_R = 5;
  mtDVD_RAM = 6;
  mtDVD_RW = 7;
  mtDVD_RW_RO = 8;
  mtDVD_RW_SR = 9;
  mtDVD_PLUSRW = 10;
  mtDVD_PLUSR = 11;
  mtDVD_PLUSRDL = 12;
  mtDDCD_ROM = 13;
  mtDDCD_R = 14;
  mtDDCD_RW = 15;

  DiscTypeString: Array[0..15] Of String =
  (
    'UNKNOWN',
    'CD-ROM',
    'CD-R',
    'CD-RW',
    'DVD-ROM',
    'DVD-R',
    'DVD-RAM',
    'DVD-RW',
    'DVD-RW',
    'DVD-RW',
    'DVD+RW',
    'DVD+R',
    'DVD+R DL',
    'DDCD-ROM',
    'DDCD-R',
    'DDCD-RW'
    );

Type
  TScsiDeviceCapabilities = (dcReadCDR, dcReadCDRW, dcReadMethod2, dcReadDVD, dcReadDVDR, dcReadDVDRW, dcReadDVDRAM, dcReadDVDPLUSR, dcReadDVDPLUSRDL, dcReadDVDPLUSRW, dcWriteCDR, dcWriteCDRW, dcWriteTest, dcWriteDVDR, dcWriteDVDRW, dcWriteDVDRAM, dcWriteDVDPLUSR, dcWriteDVDPLUSRDL, dcWriteDVDPLUSRW, dcWriteISRC, dcUnderrunProtection);

  TDeviceCapabilities = Set Of TScsiDeviceCapabilities;
  TWriteMethod = (wmDAO, wmSAO, wmTAO);
  TWriteMethods = Set Of TWriteMethod;
  TEraseDoneEvent = Procedure(Sender: TObject; WithError: Boolean) Of Object;
  TOnDebugMsg = Procedure(Sender: TObject; Message: String; mType: Byte) Of Object;
  TDeviceChangedEvent = Procedure(Sender: TObject) Of Object;

  TDisc = Record
    Valid: Boolean;
    TotalBlocks: Cardinal;
    UsedBlocks: Cardinal;
    BlockLength: Cardinal;
    FirstCompleteSession,
      LastCompleteSession,
      DiscStatus,
      LastSession: Byte;
    DiscTypeCode: Word;
    DiscType: String;
    Eraseable: Boolean;
  End;
Type
  TSenseInfo = Packed Record
    ResponseCode: Byte;                 // 0
    B1: Byte;                           // 1
    SenseKey: Byte;                     // 2
    Information: DWORD;                 // 3-6
    AddSenseLen: Byte;                  // 7
    CommandSpecific: DWORD;             // 8-11
    ASC: Byte;                          // 12
    ASQ: Byte;                          // 13
    FRUC: Byte;                         // 14
    B15, B16, B17: Byte;                // 15-17
    B18n: Array[0..16] Of Byte;         // 18 -
    P: DWORD;
    B19n: Byte;                         // 18 -
  End;

  TDicomSCSIDevice = Class;

  PAPerformaceDescriptor = ^TAPerformaceDescriptor;

  TAPerformaceDescriptor = Packed Record
    OtherInfo: Byte;
    Reserverd: Packed Array[0..2] Of Byte;
    StartLBA: LongWord;
    EndLBA: LongWord;
    ReadSize: LongWord;
    ReadTime: LongWord;
    WriteSize: LongWord;
    WriteTime: LongWord;
  End;

  TDicomEraseThread = Class(TThread)
  Private
    fProgress: Integer;
    Medium: Byte;
    Device: TDicomSCSIDevice;
    AproxSecs: Word;
    EraseDoneWithError: Boolean;
    Procedure EraseDoneEvent;

  Protected
    Procedure Execute; Override;
    Property Progress: Integer Read fProgress Write fProgress;
  End;

  TDicomSCSIDevice = Class(TComponent)
  Private
    { Private declarations }
    fDriveLetters: Array[0..26] Of String;
    fDeviceSubType: ShortInt;
    fHaID,
      fTarget,
      fLun: Byte;
    EraseType_: Byte;
    fAdapters: ShortInt;
    ModePage2A: TModePage2A;
    ModePage05: TModePage05;
    fUnderrunProtection,
      fTestWrite: Boolean;
    fErrorString,
      fDevice: String;
    fDeviceType: ShortInt;
    fDeviceName: String;
    fInquiryData: TInquiryData;
    fDoDebug: Boolean;
    fDevCaps: TDeviceCapabilities;
    fDevices: TStrings;
    fTargetBusy: Boolean;
    fOnDeviceChange: TDeviceChangedEvent;
    fHAInquiry: TSRB_HAInquiry;
    fSCAbort: TSRB_Abort;
    fEraseDone: TEraseDoneEvent;
    fDisc: TDisc;
    fTrackInformation: TTrackInformationBlock;
    fTOC100: TTOCPMATIP0100;
    fDeviceMaxWriteSpeed,
      fDeviceMaxReadSpeed: Word;
    fDeviceBufferSize, fDeviceFreeBufferSize: Cardinal;
    fFinalizeDisc, fErasing: Boolean;
    fLastSense: TSenseArea;
    fOnDebugMsg: TOnDebugMsg;
    fWriteMethod: TWriteMethod;
    fWriteMethods: TWriteMethods;
    Function GetHostAdapterInfo(HA: Byte): ShortInt;
    Function AbortSCSICommand(srb: TSRB_ExecSCSICmd): Boolean;
    Function GetASPIInitialized: Boolean;
    Function GetDriveLetter: AnsiChar;
    Function SetDeviceByDriveLetter(DriveLetter: AnsiChar): Boolean;
    Function GetWriteMethods: Boolean;
    Function CheckWriteMethod(wm: TWriteMethod): Boolean;
    Procedure SetDriveLetter(Value: AnsiChar);
    Procedure DeviceChanged;
    Procedure SetDeviceID(Value: String);
    Procedure SetWriteSpeed(Value: Word);

  Protected
    { Protected declarations }
    fReadSpeed, fWriteSpeed: Word;
    CriticalSection: TCriticalSection;
    Procedure Notification(aComponent: TComponent; Operation: TOperation); Override;
    Function GetConfigData(RT: Byte; Profile: Word; buf: Pointer; buflen: Integer): Boolean;
  Public
    { Public declarations }
    PDVR103,
      SonyCRX100E,
      TEAC512EB,
      SonyPowerBurn: Boolean;
    DontShowError, ConsoleApplication: Boolean;

    Constructor Create(AOwner: TComponent); Override;
    Destructor Destroy; Override;

    Procedure Lock;
    Procedure Unlock;
    Procedure Rewind;
    Procedure ScanDevices;
    //function CalcFreeDiscSpace: Int64;
    Property Erasing: Boolean Read fErasing;
    Property Disc: TDisc Read fDisc;
    Property DeviceMaxWriteSpeed: Word Read fDeviceMaxWriteSpeed;
    Property DeviceMaxReadSpeed: Word Read fDeviceMaxReadSpeed;
    Property ASPIInitialized: Boolean Read GetASPIInitialized;
    Property DeviceType: ShortInt Read fDeviceType;
    Property DeviceSubType: ShortInt Read fDeviceSubType;
    Property DeviceName: String Read fDeviceName;
    Property Device: String Read fDevice Write SetDeviceID;
    Property Devices: TStrings Read fDevices;
    Property HostAdapters: ShortInt Read fAdapters;
    Property DeviceCapabilities: TDeviceCapabilities Read fDevCaps;
    Property InquriyData: TInquiryData Read fInquiryData Write fInquiryData;
    Property TestWrite: Boolean Read fTestWrite Write fTestWrite;
    Property UnderrunProtection: Boolean Read fUnderrunProtection Write fUnderrunProtection;
    Property DoDebug: Boolean Read fDoDebug Write fDoDebug Default False;
    Property OnDeviceChange: TDeviceChangedEvent Read fOnDeviceChange Write fOnDeviceChange;
    Property OnEraseDone: TEraseDoneEvent Read fEraseDone Write fEraseDone;
    Property ReadSpeed: Word Read fReadSpeed Write fReadSpeed;
    Property WriteSpeed: Word Read fWriteSpeed Write SetWriteSpeed;
    Property FinalizeDisc: Boolean Read fFinalizeDisc Write fFinalizeDisc;
    Property DeviceBufferSize: Cardinal Read fDeviceBufferSize Write fDeviceBufferSize;
    Property DeviceFreeBufferSize: Cardinal Read fDeviceFreeBufferSize Write fDeviceFreeBufferSize;
    Property TargetBusy: Boolean Read fTargetBusy;
    Property DeviceByDriveLetter: AnsiChar Read GetDriveLetter Write SetDriveLetter;
    Function GetDiskLetter(H, T, L: Byte): Byte;
    Function InitializeASPI(InternalFirst: Boolean = False; AspiPath: String = ''): Boolean;
    Function DeInitializeASPI: Boolean;
    Function GetDiskInformation: Boolean;
    Function ExecScsiCommand(Var sc: TSRB_ExecSCSICmd; TimeOut: Integer): Integer;
    Function ModeSense10(PageCode: Byte; Var buf: Array Of Byte; buflen: Integer; PS: Boolean = False): Boolean;
    Function ModeSelect10(Buffer: pAnsichar; buflen: Integer): Boolean;
    Function SetStreaming(Buffer: Pointer; BufLength: Word): Boolean;
    Function SetPerformance(StartLBA: LongWord; EndLBA: LongWord; ReadSize: LongWord; WriteSize: LongWord; ReadTime: LongWord; WriteTime: LongWord): Boolean;
    Function SendCueSheet(Buffer: pAnsichar; BufferLength: Integer): Boolean;
    Function ReadDVDStructure(Layer, Format: Byte; buf: Pointer; BufLength: Word): Boolean;
    Function SendDVDStructure(Format: Byte; buf: Pointer; BufLength: Word): Boolean;
    Function SendDVDStructureTimeStamp(Time: TDateTime): Boolean;
    Function Inquiry: Boolean;
    Function SessionsOnDisc: Smallint;
    Function UsedBlocksOnDisc: Cardinal;
    Function FreeBlocksOnDisc: Cardinal;
    Function TotalBlocksOnDisc: Cardinal;
    Function Erasable: Boolean;
    Function DiscType: Byte;
    Function ScsiReset: Integer;
    Function DiscStatus: Smallint;
    Function LastSessionStatus: Smallint;
    Function GetDeviceCapabilities(Physical: Boolean = False): Boolean;
    Function IsJustLinkCapable: Boolean;
    Function SetWriteParams(TestWrite, UnderrunProtected, MultiSession: Boolean; MediumIs: Smallint): Boolean;
    Function GetLastRecordedAddress: Cardinal;
    Function DecodeSense(scm: TSRB_ExecSCSICmd): String;
    Function GetAspiError(Status, HaStat, TargStat: Byte): String;
    Function AdditionalSenseInformation(scm: TSRB_ExecSCSICmd): String;
    Function MaxWriteSpeed: Word;
    Function MaxReadSpeed: Word;
    Function CurrentWriteSpeed: Word;
    Function CurrentReadSpeed: Word;
    Function TestUnitReady(TimeOut: Integer = 5000): Boolean;
    Function WaitForReady(TimeOut: Integer = 10000; Step: Integer = 5000): Boolean;
    Function LockMedium(Unlock: Boolean = False): Boolean;
    Procedure LockDrive(Unlock: Boolean = True);
    Function LoadMedium(Eject: Boolean = False): Boolean;
    Function EraseDisc(EraseType: Byte = etQuick): Boolean;
    Function ReadCapacity(Var Capacity, SectorSize: Cardinal): Boolean;
    Function ReserveTrack(ReservationSize: Cardinal): Boolean;
    Function Read10(LBA: Cardinal; TransferLength: Word; Buffer: pAnsichar; buflen: Cardinal): Boolean;
    Function ReadCD(LBA: Cardinal; TransferLength: Word; Buffer: pAnsichar; buflen: Cardinal; SecType, Other, SubChannelsSelection: Byte): Boolean;
    Function Write10(LBA: Cardinal; TransferLength: Word; Buffer: pAnsichar; buflen: Cardinal; Flags: Byte = $50): Boolean;
    Function FlushCache(TimeOut: Integer = 60 * 1000 * 5; Immed: Boolean = False): Boolean;
    Function FormatUnit(FormatCode: Byte; Buffer: pAnsiChar; Length: Integer): Boolean;
    Function CloseTrack(Session: Boolean = False; Immed: Boolean = True; DVDPR: Boolean = False; TrackNo: Byte = 0): Boolean;
    Function CloseTrackDVD(Immed: Boolean; b2, b3, b4, b5: Byte): Boolean;
    Function SetCDSpeed(ReadSpeed, WriteSpeed: Cardinal): Boolean;
    Function SendOPC: Boolean;
    Function ReadBufferCapacity(Var BufferLength, BlankBufferLength: Cardinal): Boolean;
    Function GetFormatCapacity(Var Capacity: Cardinal; Var SectorSize: Cardinal): Boolean;
    Function ReadTrackInformation(TrackNumber: Byte): Boolean;
    Function ReadTOC(Format: Byte; Buffer: pAnsiChar; BufferLength: Integer; SessionTrackNumber: Byte = 0; Time: Boolean = False; Control: Byte = 0): Boolean;
    Function ReadDiscInformation: Boolean;
    Function ReadDiscInformationRaw(Buffer: pAnsiChar; BufferLength: Integer): Boolean;
    Function RequestSense(Buffer: pAnsiChar; Len: Byte): Boolean;
    Function GetDiscInformation: TDisc;
    Function EraseProgress: Integer;
    Function SelectDevice(sDevice: String): Boolean;

    Procedure DebugMsg(Msg: String; mType: Byte);
  Published
    { Published declarations }
    Property TrackInformation: TTrackInformationBlock Read fTrackInformation;
    Property ErrorString: String Read fErrorString Write fErrorString;
    Property LastSense: TSenseArea Read fLastSense;
    Property WriteMethod: TWriteMethod Read fWriteMethod Write fWriteMethod;

    Property WriteMethods: TWriteMethods Read fWriteMethods;
    Property OnDebugMessage: TOnDebugMsg Read fOnDebugMsg Write fOnDebugMsg;
  End;

Var
  buf1: Array[0..$FF0] Of AnsiChar;
  buf2: Array[0..$FF00] Of AnsiChar;
  buf3: Array[0..$FF] Of Byte;
  buf4: Packed Array[0..65534] Of AnsiChar;
  tmps: Array[0..1000] Of AnsiChar;
  wms: Boolean = False;
  fwms: Boolean = False;
  _SenseInfo: TSenseInfo;
  DiscInfo: TDiscInformation;
  MediumIs: Smallint;
  fImmedCT: Boolean;

Function L2MDW(DW: DWORD): DWORD;
Function L2MW(W: Word): Word;

Implementation

Type
  TConfigHeader = Packed Record
    DataLength: DWORD;
    Res1: Word;
    CurrentProfile: Word;
    FeatureCode: Word;
    Version: Byte;
    AdditionalLength: Byte;
    otherData: Array[0..101] Of Byte
  End;

Var
  dtBuf: TConfigHeader;
  Wait02: Boolean;

  //------------------------------------------------------------------------------
Function L2MW(W: Word): Word;
Begin
  result := ((W Shl 8) And $FF00) Or ((W Shr 8) And $00FF);
End;

//------------------------------------------------------------------------------
Function L2MDW(DW: DWORD): DWORD;
Begin
  result := ((DW Shl 24) And $FF000000)
    Or ((DW Shl 8) And $00FF0000)
    Or ((DW Shr 8) And $0000FF00)
    Or ((DW Shr 24) And $000000FF);
End;
//------------------------------------------------------------------------------

Procedure CvtEndians(Const Src; Var Dest; Count: Integer);
Var
  pSrc,
    pDst: pAnsiChar;
  i: Integer;
Begin
  pSrc := @Src;
  pDst := pAnsiChar(@Dest) + Count;
  For i := 0 To Count - 1 Do
  Begin
    Dec(pDst);
    pDst^ := pSrc^;
    Inc(pSrc);
  End;
End;

{******************************************************************************}
{                                                                              }
{******************************************************************************}
Function TDicomSCSIDevice.InitializeASPI(InternalFirst: Boolean = False; AspiPath: String = ''): Boolean;
Begin
  Try
    result := _InitializeASPI(InternalFirst, AspiPath);
  Except
    result := False;
  End;
  If result Then
  Begin
    GetHostAdapterInfo(0);
    ScanDevices;
  End;
End;
{******************************************************************************}
{                              Set Write Parametes                             }
{******************************************************************************}
Var
  ModeSenseBuf1, ModeSenseBuf2: Array[0..$200 - 1] Of Byte;

  {******************************************************************************}
  {                                                                              }
  {******************************************************************************}
Function TDicomSCSIDevice.CheckWriteMethod(wm: TWriteMethod): Boolean;
Var
  s, i: Integer;
Begin
  result := False;
  FillChar(ModeSenseBuf1, SizeOf(ModeSenseBuf1), 0);
  FillChar(ModeSenseBuf2, SizeOf(ModeSenseBuf2), 0);
  If ModeSense10($05, ModeSenseBuf1, SizeOf(ModeSenseBuf1)) Then
  Begin
    If ModeSenseBuf1[16] = $05 Then s := 16
    Else If ModeSenseBuf1[8] = $05 Then s := 8
    Else s := 8;
    For i := 0 To SizeOf(ModeSenseBuf1) - s - 1 Do ModeSenseBuf2[i] := ModeSenseBuf1[i + s];
    Move(ModeSenseBuf2, ModePage05, SizeOf(ModePage05));
    ModePage05.DBType := $00;
    If wm = wmTAO Then
      ModePage05.WriteType := $01
    Else If wm = wmSAO Then
      ModePage05.WriteType := $02
    Else
    Begin
      ModePage05.DBType := 1;
      ModePage05.WriteType := $03;
    End;
    ModePage05.TrackMode := $10;
    ModePage05.SessionFormat := $0;
    ModePage05.Res9 := $0;
    ModePage05.PauseLen := $9600;       // Pause
    ModePage05.TrackMode := $0;
    Move(ModePage05, ModeSenseBuf2, ModePage05.PageLen + s + 1);
    FillChar(ModeSenseBuf1, SizeOf(ModeSenseBuf1), 0);
    For i := 0 To $3C - s Do ModeSenseBuf1[i + 8] := ModeSenseBuf2[i];
    If ModeSelect10(@ModeSenseBuf1[0], ModePage05.PageLen + 10) Then
      result := True;
  End;
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Function TDicomSCSIDevice.GetWriteMethods: Boolean;
Begin
  fWriteMethods := [];
  If CheckWriteMethod(wmDAO) Then Include(fWriteMethods, wmDAO);
  If CheckWriteMethod(wmSAO) Then Include(fWriteMethods, wmSAO);
  If CheckWriteMethod(wmTAO) Then Include(fWriteMethods, wmTAO);
  result := True;

End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Function TDicomSCSIDevice.GetDriveLetter: AnsiChar;
Var
  fh: THandle;
  buf: Array[0..63] Of AnsiChar;
  tmp: String;
  pscsiAddr: PSCSI_ADDRESS;
  returned: Cardinal;
  DriveLetter: Byte;
Begin
  result := #0;
  If ASPILayerName = 'BMASPI32' Then
  Begin
    result := GetDriveLetterBMASPI(fHaID, fTarget, fLun);
    Exit;
  End;
  For DriveLetter := 2 To 26 Do
  Begin
    tmp := '\\.\' + Chr(DriveLetter + 64) + ':' + #0;
    fh := CreateFile(@tmp[1], GENERIC_WRITE Or GENERIC_READ, FILE_SHARE_READ Or FILE_SHARE_WRITE, Nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    If (fh = INVALID_HANDLE_VALUE) Then
      fh := CreateFile(@tmp[1], GENERIC_READ, FILE_SHARE_READ, Nil, OPEN_EXISTING, 0, 0);
    If (fh <> INVALID_HANDLE_VALUE) Then
    Begin
      FillChar(buf, SizeOf(buf), 0);
      pscsiAddr := @buf;
      pscsiAddr.Length := SizeOf(SCSI_ADDRESS);
      If (DeviceIoControl(fh, 266264, Nil, 0, pscsiAddr, SizeOf(SCSI_ADDRESS), returned, Nil)) Then
      Begin
        If (pscsiAddr.PortNumber = fHaID) And (pscsiAddr.TargetId = fTarget) Then
        Begin
          result := AnsiChar(Chr(DriveLetter + 64));
          CloseHandle(fh);
          Exit;
        End;
      End;
      CloseHandle(fh);
    End;
  End;
  DriveLetter := GetDiskLetter(fHaID, fTarget, fLun);
  If DriveLetter <> 128 Then
    result := AnsiChar(Chr(DriveLetter + 65));
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Procedure TDicomSCSIDevice.Notification(aComponent: TComponent; Operation: TOperation);
Begin
  Inherited Notification(aComponent, Operation);
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Procedure TDicomSCSIDevice.SetDriveLetter(Value: AnsiChar);
Begin
  SetDeviceByDriveLetter(Value);
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Var
  xdi: TSRB_GetDiskInfo;

Function TDicomSCSIDevice.SetDeviceByDriveLetter(DriveLetter: AnsiChar): Boolean;
Var
  fh: THandle;
  buf: Array[0..63] Of AnsiChar;
  tmp: String;
  pscsiAddr: PSCSI_ADDRESS;
  returned: Cardinal;
  i, T, L, HA: Integer;
Begin
  result := False;
  tmp := '\\.\' + DriveLetter + ':' + #0;
  fh := CreateFile(@tmp[1], GENERIC_WRITE Or GENERIC_READ, FILE_SHARE_READ Or FILE_SHARE_WRITE, Nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  If (fh = INVALID_HANDLE_VALUE) Then
    fh := CreateFile(@tmp[1], GENERIC_READ, FILE_SHARE_READ, Nil, OPEN_EXISTING, 0, 0);
  If (fh = INVALID_HANDLE_VALUE) Then
  Begin
    i := Byte(DriveLetter) - 64;
    If fDriveLetters[i] <> '' Then
    Begin
      Device := fDriveLetters[i];
      CloseHandle(fh);
      result := True;
    End;
    For HA := 0 To fAdapters - 1 Do
    Begin
      For T := 0 To 7 Do
        For L := 0 To 7 Do
        Begin
          FillChar(xdi, SizeOf(xdi), 0);
          xdi.Command := SC_GET_DISK_INFO;
          xdi.HaID := HA;
          xdi.Target := T;
          xdi.Lun := L;
          SendASPI32Command(@xdi);
          If xdi.Status = 1 Then
          Begin
            If xdi.Int13HDriveInfo = Ord(DriveLetter) - 65 Then
            Begin
              tmp := IntToStr(HA) + ':' + IntToStr(T) + ':' + IntToStr(L) + ' ' + DriveLetter + ':';
              Device := tmp;
              result := True;
              Exit;
            End;
          End;
        End;
    End;
  End
  Else
  Begin
    result := True;
    Exit;
  End;
  FillChar(buf, SizeOf(buf), 0);
  pscsiAddr := @buf;
  pscsiAddr.Length := SizeOf(SCSI_ADDRESS);
  If (DeviceIoControl(fh, 266264, Nil, 0, pscsiAddr, SizeOf(SCSI_ADDRESS), returned, Nil)) Then
  Begin
    tmp := IntToStr(pscsiAddr.PortNumber) + ':' + IntToStr(pscsiAddr.TargetId) + ':' + IntToStr(pscsiAddr.Lun) + ' ' + DriveLetter + ':';
    Device := tmp;
    result := True;
  End;
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Function TDicomSCSIDevice.SelectDevice(sDevice: String): Boolean;
Begin
  Device := sDevice;
  result := True;
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Function TDicomSCSIDevice.GetDiskLetter(H, T, L: Byte): Byte;
Begin
  FillChar(xdi, SizeOf(xdi), 0);
  xdi.Command := SC_GET_DISK_INFO;
  xdi.HaID := H;
  xdi.Target := T;
  xdi.Lun := L;
  SendASPI32Command(@xdi);
  If xdi.Status = 1 Then
    result := xdi.Int13HDriveInfo
  Else
    result := 128;
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Function TDicomSCSIDevice.GetASPIInitialized: Boolean;
Begin
  result := ASPIDLLLoaded;
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Function TDicomSCSIDevice.MaxWriteSpeed: Word;
Begin
  If GetDeviceCapabilities Then
    result := ModePage2A.MaxWriteSpeed
  Else
    result := 0;
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Procedure TDicomSCSIDevice.SetWriteSpeed;
Begin
  SetCDSpeed(fReadSpeed, Value);
  fWriteSpeed := Value;
End;

{******************************************************************************}
{                                                                              }
{******************************************************************************}
Function TDicomSCSIDevice.MaxReadSpeed: Word;
Begin
  If GetDeviceCapabilities Then
  Begin
    result := ModePage2A.MaxReadSpeed;
  End
  Else
    result := 0;
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Function TDicomSCSIDevice.CurrentReadSpeed;
Begin
  If GetDeviceCapabilities Then
    result := ModePage2A.CurReadSpeed
  Else
    result := 0;
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Function TDicomSCSIDevice.CurrentWriteSpeed: Word;
Begin
  If GetDeviceCapabilities Then
    result := ModePage2A.CurWriteSpeed
  Else
    result := 0;
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Procedure TDicomSCSIDevice.ScanDevices;
Var
  HA, T, L: Integer;
  llun, lha, lt: Integer;
  Str: String;
  sDrvLtr: String;
Begin
  fDevices.Clear;
  lha := fHaID;
  lt := fTarget;
  llun := fLun;
  fLun := 0;
  If DoDebug Then DebugMsg('>>> ' + ASPILayerName, mtMESSAGE);
  For HA := 0 To fAdapters - 1 Do
  Begin
    GetHostAdapterInfo(HA);
    Str := fHAInquiry.HA_Identifier;
    Str := Trim(Str);
    If DoDebug Then DebugMsg('>>> ' + fHAInquiry.HA_ManagerId + ' (' + Str + ')', mtMESSAGE);
    For T := 0 To 7 Do
      For L := 0 To 7 Do
      Begin
        fHaID := HA;
        fTarget := T;
        fLun := L;
        FillChar(fInquiryData, SizeOf(fInquiryData), 0);
        If Inquiry Then
        Begin
          //Str := IntToStr(ha)+':'+IntToStr(t)+':'+IntToStr(l)+' - '+fInquiryData.VendorID+' '+fInquiryData.ProductID+' '+fInquiryData.ProductRev;        //Writeln(str);
          If (fInquiryData.PeripheralData = 5) Or (fInquiryData.PeripheralData = 4) Then
          Begin
            sDrvLtr := GetDriveLetter;
            If sDrvLtr = #0 Then
              sDrvLtr := '?:'
            Else
              sDrvLtr := sDrvLtr + ':';
            Str := IntToStr(HA) + ':' + IntToStr(T) + ':' + IntToStr(L) + ',' + sDrvLtr + ' ' + fInquiryData.VendorID + '' + fInquiryData.ProductID + '' + fInquiryData.ProductRev;
            If fInquiryData.PeripheralData = 4 Then
              Str := Str + ' (not supported)';
            fDevices.Add(Str);
          End;
        End;
      End;
  End;
  fHaID := lha;
  fTarget := lt;
  fLun := llun;
  {  if fDevices.Count > 0 then  SetDeviceID(fDevices[0]);}// auto select first device if any
  fErrorString := '';
  ErrorString := '';

End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Procedure TDicomSCSIDevice.DebugMsg;
Begin
  If Assigned(fOnDebugMsg) Then
    fOnDebugMsg(Self, Msg, mType);
End;
{******************************************************************************}
{                            Get Disk Information                              }
{******************************************************************************}
Function TDicomSCSIDevice.GetDiskInformation: Boolean;
Var
  lsrb: TSRB_GetDiskInfo;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Command := SC_GET_DISK_INFO;
  lsrb.HaID := fHaID;
  lsrb.Target := fTarget;
  SendASPI32Command(@lsrb);
  result := lsrb.Status = SS_COMP;
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Constructor TDicomSCSIDevice.Create;
Begin
  Inherited Create(AOwner);
  CriticalSection := TCriticalSection.Create;
  fErasing := False;
  fHaID := 254;
  fTarget := 254;
  fLun := 254;
  fDoDebug := False;
  fDevices := TStringList.Create;
  If GetASPIInitialized Then
  Begin
    GetHostAdapterInfo(0);
    ScanDevices;
  End;
End;
{******************************************************************************}
{                                 FormatUnit                                   }
{******************************************************************************}
Function TDicomSCSIDevice.FormatUnit(FormatCode: Byte; Buffer: pAnsiChar; Length: Integer): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := $50;
  lsrb.CDBLen := $6;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.buflen := Length;
  lsrb.BufPointer := @Buffer[0];
  lsrb.CDBCmd := $04;
  lsrb.CDBByte[1] := FormatCode;
  ExecScsiCommand(lsrb, 10000);
  result := lsrb.Status = SS_COMP;
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Destructor TDicomSCSIDevice.Destroy;
Begin
  fDevices.Free;
  CriticalSection.Destroy;
  Inherited;
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Procedure TDicomSCSIDevice.Rewind;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := SRB_EVENT_NOTIFY;
  lsrb.CDBLen := 06;
  lsrb.CDBCmd := $01;
  lsrb.SenseLen := SENSE_LEN;
  ExecScsiCommand(lsrb, 10000);
End;

Function TDicomSCSIDevice.GetHostAdapterInfo;
Begin
  FillChar(fHAInquiry, SizeOf(fHAInquiry), 0);
  fHAInquiry.Command := SC_HA_INQUIRY;
  fHAInquiry.HaID := HA;
  SendASPI32Command(@fHAInquiry);
  If fHAInquiry.Status = 1 Then
    result := fHAInquiry.HA_Count
  Else
    result := -1;
  fAdapters := result;
  If fAdapters = 0 Then fAdapters := 7;
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Function TDicomSCSIDevice.AbortSCSICommand;
Begin
  FillChar(fSCAbort, SizeOf(fSCAbort), 0);
  fSCAbort.Command := SC_ABORT_SRB;
  fSCAbort.HaID := fHaID;
  fSCAbort.ToAbort := @srb;
  //SendASPI32Command (@fSCAbort);
  result := fSCAbort.Status = 1;
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Procedure TDicomSCSIDevice.SetDeviceID;
Var
  P: String;
  v: String;
Begin
  If Length(Value) < 5 Then
  Begin
    If Value <> '' Then
      DebugMsg(ERR_INVALIDDEVICE, mtUNKNOWN);
    fHaID := 254;
    fTarget := 254;
    fLun := 254;
    fDevice := '';
    fDeviceName := '';
    fDeviceType := 127;
  End
  Else
  Begin
    Try
      fHaID := StrToInt(Value[1]);
      fTarget := StrToInt(Value[3]);
      fLun := StrToInt(Value[5]);
      fDevice := Value;
      DeviceChanged;
      If (fInquiryData.PeripheralData = 5) Or (fInquiryData.PeripheralData = 4) Then
      Begin
        P := fInquiryData.ProductID;
        P := Trim(P);
        v := fInquiryData.VendorID;
        v := Trim(v);
        If (P = 'CD-W512EB') Then
          TEAC512EB := True
        Else
          TEAC512EB := False;
        If (P = 'CRX175E') Or (P = 'CD-RW  CRX800E') Then
          SonyPowerBurn := True
        Else
          SonyPowerBurn := False;
        If Length(v) < 3 Then
          v := '     ';
        If
          ((P[1] = 'U') And (P[2] = 'J') And (P[3] = 'D') And (P[4] = 'A')) Or
          ((v[1] = 'T') And (v[2] = 'D') And (v[3] = 'K')) Then
          Wait02 := True
        Else
          Wait02 := False;
        If (P = 'CD-RW  CRX100E') Then
          SonyCRX100E := True
        Else
          SonyCRX100E := False;
        If (P = 'CDRW321040X') Then
          fImmedCT := False
        Else
          fImmedCT := True;
        If (fInquiryData.ProductID = 'DVD-RW  DVR-103 ') Or (fInquiryData.ProductID = 'DVD-RW  DVR-104 ') Then
        Begin
          PDVR103 := True;
          fImmedCT := True;
        End
        Else
          PDVR103 := False;
        If Assigned(fOnDeviceChange) Then
          fOnDeviceChange(Self);
        GetWriteMethods;
      End
      Else
      Begin
        DebugMsg(ERR_INVALIDDEVICE, mtUNKNOWN);
        fDevice := '';
        fDeviceName := '';
        fDeviceType := 127;
        fHaID := 254;
        fTarget := 254;
        fLun := 254;
      End;
    Except
      DebugMsg(ERR_INVALIDDEVICE, mtUNKNOWN);
      fDevice := '';
      fDeviceName := '';
      fDeviceType := 127;
      fHaID := 254;
      fTarget := 254;
      fLun := 254;
    End;

  End;
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Procedure TDicomSCSIDevice.DeviceChanged;
Var
  Str: String;
  i: Integer;
Begin
  GetDeviceCapabilities;
  If Inquiry Then
  Begin
    fDeviceType := fInquiryData.PeripheralData;
    With fInquiryData Do
    Begin
      For i := 8 To 15 Do If VendorID[i] < #32 Then VendorID[i] := #32;
      For i := 16 To 31 Do If ProductID[i] < #32 Then ProductID[i] := #32;
      For i := 32 To 35 Do If ProductRev[i] < #32 Then ProductRev[i] := #32;
      For i := 36 To 55 Do If VendorSpecific[i] < #32 Then VendorSpecific[i] := #32;
    End;

    Str := string(fInquiryData.VendorID) + ' ' + fInquiryData.ProductID + ' ' + fInquiryData.ProductRev;
    fDeviceName := Str;
  End
  Else
    fDeviceName := ErrorString;
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Function TDicomSCSIDevice.GetAspiError(Status, HaStat, TargStat: Byte): String;
Begin
  fTargetBusy := False;
  result := ERR_UNKNOWN;
  Case Status Of
    0, 1: result := ERR_NONE;
    2, 3: result := ERR_ABORTED;
    $80: result := ERR_INVALIDREQUEST;
    $81: result := ERR_INVALIDHA;
    $82: result := ERR_NODEVICE;
    $E0: result := ERR_INVALIDSRB;
    $E1: result := ERR_BUFFERALIGNMENT;
    $E5: result := ERR_ASPIBUSY;
    $E6: result := ERR_BUFFERTOOBIG;
    4: Case HaStat Of
        $09: result := ERR_TIMEOUT;
        $0B: result := ERR_SRBTIMEOUT;
        $0D: result := ERR_MESSAGEREJECT;
        $0E: result := ERR_BUSRESET;
        $0F: result := ERR_PARITYERR;
        $10: result := ERR_REQUESTSENSEFAILED;
        $11: result := ERR_SELECTIONTIMEOUT;
        $12: result := ERR_DATAOVERRUN;
        $13: result := ERR_UNEXPECTEDBUSFREE;
        $00: Case TargStat Of
            0, 2: result := ERR_CHECKCONDITION;
            $08:
              Begin
                result := ERR_TARGETBUSY;
                fTargetBusy := True;
              End;
            $18: result := ERR_TARGETCONFLICT;
            $28: result := ERR_QUEFULL;
          End;
      End;
  End;
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Function TDicomSCSIDevice.AdditionalSenseInformation(scm: TSRB_ExecSCSICmd): String;
Var
  s: TSenseArea;
  ErrStr: String;
Begin
  s := scm.SenseArea;
  ErrStr := '';

Case s.AddSenseCode of
  $00:
  begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_00_00;
      $06: ErrStr := ERR_AS_00_06;
      $11: ErrStr := ERR_AS_00_11;
      $12: ErrStr := ERR_AS_00_12;
      $13: ErrStr := ERR_AS_00_13;
      $14: ErrStr := ERR_AS_00_14;
      $15: ErrStr := ERR_AS_00_15;
      $16: ErrStr := ERR_AS_00_16;
      $17: ErrStr := ERR_AS_00_17;
    end;
  end;
  $02: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_02_00;
    end;
  end;
  $04: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_04_00;
      $01: ErrStr := ERR_AS_04_01;
      $02: ErrStr := ERR_AS_04_02;
      $03: ErrStr := ERR_AS_04_03;
      $04: ErrStr := ERR_AS_04_04;
      $07: ErrStr := ERR_AS_04_07;
      $08: ErrStr := ERR_AS_04_08;
      $09: ErrStr := ERR_AS_04_09;
    end;
  end;
  $05: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_05_00;
    end;
  end;
  $06: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_06_00;
    end;
  end;
  $07: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_07_00;
    end;
  end;
  $08: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_08_00;
      $01: ErrStr := ERR_AS_08_01;
      $02: ErrStr := ERR_AS_08_02;
      $03: ErrStr := ERR_AS_08_03;
      $04: ErrStr := ERR_AS_08_04;
    end;
  end;
  $09: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_09_00;
      $01: ErrStr := ERR_AS_09_01;
      $02: ErrStr := ERR_AS_09_02;
      $03: ErrStr := ERR_AS_09_03;
      $04: ErrStr := ERR_AS_09_04;
    end;
  end;
  $0A: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_0A_00;
    end;
  end;
  $0B: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_0B_00;
      $01: ErrStr := ERR_AS_0B_01;
      $02: ErrStr := ERR_AS_0B_02;
    end;
  end;
  $0C: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_0C_00;
      $07: ErrStr := ERR_AS_0C_07;
      $08: ErrStr := ERR_AS_0C_08;
      $09: ErrStr := ERR_AS_0C_09;
      $0A: ErrStr := ERR_AS_0C_0A;
    end;
  end;
  $0D: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_0D_00;
      $01: ErrStr := ERR_AS_0D_01;
      $02: ErrStr := ERR_AS_0D_02;
      $03: ErrStr := ERR_AS_0D_03;
      $04: ErrStr := ERR_AS_0D_04;
      $05: ErrStr := ERR_AS_0D_05;
    end;
  end;
  $11: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_11_00;
      $01: ErrStr := ERR_AS_11_01;
      $02: ErrStr := ERR_AS_11_02;
      $05: ErrStr := ERR_AS_11_05;
      $06: ErrStr := ERR_AS_11_06;
      $0D: ErrStr := ERR_AS_11_0D;
      $0E: ErrStr := ERR_AS_11_0E;
      $0F: ErrStr := ERR_AS_11_0F;
      $10: ErrStr := ERR_AS_11_10;
      $11: ErrStr := ERR_AS_11_11;
    end;
  end;
  $14: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_14_00;
      $01: ErrStr := ERR_AS_14_01;
    end;
  end;
  $15: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_15_00;
      $01: ErrStr := ERR_AS_15_01;
      $02: ErrStr := ERR_AS_15_02;
    end;
  end;
  $17: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_17_00;
      $01: ErrStr := ERR_AS_17_01;
      $02: ErrStr := ERR_AS_17_02;
      $03: ErrStr := ERR_AS_17_03;
      $04: ErrStr := ERR_AS_17_04;
      $05: ErrStr := ERR_AS_17_05;
      $07: ErrStr := ERR_AS_17_07;
      $08: ErrStr := ERR_AS_17_08;
      $09: ErrStr := ERR_AS_17_09;
    end;
  end;
  $18: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_18_00;
      $01: ErrStr := ERR_AS_18_01;
      $02: ErrStr := ERR_AS_18_02;
      $03: ErrStr := ERR_AS_18_03;
      $04: ErrStr := ERR_AS_18_04;
      $05: ErrStr := ERR_AS_18_05;
      $06: ErrStr := ERR_AS_18_06;
      $08: ErrStr := ERR_AS_18_08;
    end;
  end;
  $1A: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_1A_00;
    end;
  end;
  $1B: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_1B_00;
    end;
  end;
  $1D: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_1D_00;
    end;
  end;
  $20: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_20_00;
    end;
  end;
  $21: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_21_00;
      $01: ErrStr := ERR_AS_21_01;
      $02: ErrStr := ERR_AS_21_02;
    end;
  end;
  $24: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_24_00;
      $01: ErrStr := ERR_AS_24_01;
    end;
  end;
  $25: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_25_00;
    end;
  end;
  $26: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_26_00;
      $01: ErrStr := ERR_AS_26_01;
      $02: ErrStr := ERR_AS_26_02;
      $03: ErrStr := ERR_AS_26_03;
      $04: ErrStr := ERR_AS_26_04;
      $05: ErrStr := ERR_AS_26_05;
      $06: ErrStr := ERR_AS_26_06;
      $07: ErrStr := ERR_AS_26_07;
      $08: ErrStr := ERR_AS_26_08;
      $09: ErrStr := ERR_AS_26_09;
      $0A: ErrStr := ERR_AS_26_0A;
      $0B: ErrStr := ERR_AS_26_0B;
      $0C: ErrStr := ERR_AS_26_0C;
      $0D: ErrStr := ERR_AS_26_0D;
    end;
  end;
  $27: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_27_00;
      $01: ErrStr := ERR_AS_27_01;
      $02: ErrStr := ERR_AS_27_02;
      $03: ErrStr := ERR_AS_27_03;
      $04: ErrStr := ERR_AS_27_04;
      $05: ErrStr := ERR_AS_27_05;
      $06: ErrStr := ERR_AS_27_06;
    end;
  end;
  $28: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_28_00;
      $01: ErrStr := ERR_AS_28_01;
    end;
  end;
  $29: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_29_00;
      $01: ErrStr := ERR_AS_29_01;
      $02: ErrStr := ERR_AS_29_02;
      $03: ErrStr := ERR_AS_29_03;
      $04: ErrStr := ERR_AS_29_04;
      $05: ErrStr := ERR_AS_29_05;
      $06: ErrStr := ERR_AS_29_06;
    end;
  end;
  $2A: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_2A_00;
      $01: ErrStr := ERR_AS_2A_01;
      $02: ErrStr := ERR_AS_2A_02;
      $03: ErrStr := ERR_AS_2A_03;
      $04: ErrStr := ERR_AS_2A_04;
      $05: ErrStr := ERR_AS_2A_05;
    end;
  end;
  $2B: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_2B_00;
    end;
  end;
  $2C: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_2C_00;
      $03: ErrStr := ERR_AS_2C_03;
      $04: ErrStr := ERR_AS_2C_04;
      $06: ErrStr := ERR_AS_2C_06;
    end;
  end;
  $2E: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_2E_00;
    end;
  end;
  $2F: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_2F_00;
    end;
  end;
  $30: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_30_00;
      $01: ErrStr := ERR_AS_30_01;
      $02: ErrStr := ERR_AS_30_02;
      $03: ErrStr := ERR_AS_30_03;
      $04: ErrStr := ERR_AS_30_04;
      $05: ErrStr := ERR_AS_30_05;
      $06: ErrStr := ERR_AS_30_06;
      $07: ErrStr := ERR_AS_30_07;
      $08: ErrStr := ERR_AS_30_08;
      $09: ErrStr := ERR_AS_30_09;
      $10: ErrStr := ERR_AS_30_10;
    end;
  end;
  $31: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_31_00;
      $01: ErrStr := ERR_AS_31_01;
      $02: ErrStr := ERR_AS_31_02;
    end;
  end;
  $34: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_34_00;
    end;
  end;
  $35: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_35_00;
      $01: ErrStr := ERR_AS_35_01;
      $02: ErrStr := ERR_AS_35_02;
      $03: ErrStr := ERR_AS_35_03;
      $04: ErrStr := ERR_AS_35_04;
    end;
  end;
  $37: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_37_00;
    end;
  end;
  $39: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_39_00;
    end;
  end;
  $3A: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_3A_00;
      $01: ErrStr := ERR_AS_3A_01;
      $02: ErrStr := ERR_AS_3A_02;
      $03: ErrStr := ERR_AS_3A_03;
      $04: ErrStr := ERR_AS_3A_04;
    end;
  end;
  $3B: begin
    Case s.AddSenQual of
      $0D: ErrStr := ERR_AS_3B_0D;
      $0E: ErrStr := ERR_AS_3B_0E;
      $0F: ErrStr := ERR_AS_3B_0F;
      $11: ErrStr := ERR_AS_3B_11;
      $12: ErrStr := ERR_AS_3B_12;
      $13: ErrStr := ERR_AS_3B_13;
      $14: ErrStr := ERR_AS_3B_14;
      $15: ErrStr := ERR_AS_3B_15;
      $16: ErrStr := ERR_AS_3B_16;
    end;
  end;
  $3D: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_3D_00;
    end;
  end;
  $3E: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_3E_00;
      $01: ErrStr := ERR_AS_3E_01;
      $02: ErrStr := ERR_AS_3E_02;
      $03: ErrStr := ERR_AS_3E_03;
      $04: ErrStr := ERR_AS_3E_04;
    end;
  end;
  $3F: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_3F_00;
      $01: ErrStr := ERR_AS_3F_01;
      $02: ErrStr := ERR_AS_3F_02;
      $03: ErrStr := ERR_AS_3F_03;
      $04: ErrStr := ERR_AS_3F_04;
      $05: ErrStr := ERR_AS_3F_05;
      $06: ErrStr := ERR_AS_3F_06;
      $07: ErrStr := ERR_AS_3F_07;
      $08: ErrStr := ERR_AS_3F_08;
      $09: ErrStr := ERR_AS_3F_09;
      $0A: ErrStr := ERR_AS_3F_0A;
      $0B: ErrStr := ERR_AS_3F_0B;
      $0C: ErrStr := ERR_AS_3F_0C;
      $0D: ErrStr := ERR_AS_3F_0D;
      $0E: ErrStr := ERR_AS_3F_0E;
      $0F: ErrStr := ERR_AS_3F_0F;
      $10: ErrStr := ERR_AS_3F_10;
      $11: ErrStr := ERR_AS_3F_11;
    end;
  end;
  $43: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_43_00;
    end;
  end;
  $44: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_44_00;
    end;
  end;
  $45: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_45_00;
    end;
  end;
  $46: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_46_00;
    end;
  end;
  $47: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_47_00;
      $01: ErrStr := ERR_AS_47_01;
      $02: ErrStr := ERR_AS_47_02;
      $03: ErrStr := ERR_AS_47_03;
      $04: ErrStr := ERR_AS_47_04;
    end;
  end;
  $48: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_48_00;
    end;
  end;
  $49: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_49_00;
    end;
  end;
  $4A: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_4A_00;
    end;
  end;
  $4B: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_4B_00;
    end;
  end;
  $4C: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_4C_00;
    end;
  end;
  $4E: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_4E_00;
    end;
  end;
  $51: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_51_00;
      $01: ErrStr := ERR_AS_51_01;
    end;
  end;
  $53: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_53_00;
      $02: ErrStr := ERR_AS_53_02;
    end;
  end;
  $55: begin
    Case s.AddSenQual of
      $02: ErrStr := ERR_AS_55_02;
      $03: ErrStr := ERR_AS_55_03;
      $04: ErrStr := ERR_AS_55_04;
    end;
  end;
  $57: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_57_00;
    end;
  end;
  $5A: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_5A_00;
      $01: ErrStr := ERR_AS_5A_01;
      $02: ErrStr := ERR_AS_5A_02;
      $03: ErrStr := ERR_AS_5A_03;
    end;
  end;
  $5B: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_5B_00;
      $01: ErrStr := ERR_AS_5B_01;
      $02: ErrStr := ERR_AS_5B_02;
      $03: ErrStr := ERR_AS_5B_03;
    end;
  end;
  $5D: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_5D_00;
      $01: ErrStr := ERR_AS_5D_01;
      $02: ErrStr := ERR_AS_5D_02;
      $03: ErrStr := ERR_AS_5D_03;
      $FF: ErrStr := ERR_AS_5D_FF;
    end;
  end;
  $5E: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_5E_00;
      $01: ErrStr := ERR_AS_5E_01;
      $02: ErrStr := ERR_AS_5E_02;
      $03: ErrStr := ERR_AS_5E_03;
      $04: ErrStr := ERR_AS_5E_04;
    end;
  end;
  $63: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_63_00;
      $01: ErrStr := ERR_AS_63_01;
    end;
  end;
  $64: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_64_00;
      $01: ErrStr := ERR_AS_64_01;
    end;
  end;
  $65: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_65_00;
    end;
  end;
  $6F: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_6F_00;
      $01: ErrStr := ERR_AS_6F_01;
      $02: ErrStr := ERR_AS_6F_02;
      $03: ErrStr := ERR_AS_6F_03;
      $04: ErrStr := ERR_AS_6F_04;
      $05: ErrStr := ERR_AS_6F_05;
    end;
  end;
  $72: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_72_00;
      $01: ErrStr := ERR_AS_72_01;
      $02: ErrStr := ERR_AS_72_02;
      $03: ErrStr := ERR_AS_72_03;
      $04: ErrStr := ERR_AS_72_04;
      $05: ErrStr := ERR_AS_72_05;
    end;
  end;
  $73: begin
    Case s.AddSenQual of
      $00: ErrStr := ERR_AS_73_00;
      $01: ErrStr := ERR_AS_73_01;
      $02: ErrStr := ERR_AS_73_02;
      $03: ErrStr := ERR_AS_73_03;
      $04: ErrStr := ERR_AS_73_04;
      $05: ErrStr := ERR_AS_73_05;
      $06: ErrStr := ERR_AS_73_06;
    end;
  end;
end;


  
  fLastSense := s;
  If ErrStr = '' Then ErrStr := IntToStr(s.AddSenseCode) + ',' + IntToStr(s.AddSenQual);
  If s.AddSenLen <> 0 Then
    fErrorString := fErrorString + ' (' + ErrStr + ')';
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Function TDicomSCSIDevice.DecodeSense(scm: TSRB_ExecSCSICmd): String;
Var
  s: TSenseArea;
Begin
  s := scm.SenseArea;
  result := GetAspiError(scm.Status, scm.HaStat, scm.TargStat);
  If (result = ERR_CHECKCONDITION) Then
    If s.ErrorCode = 0 Then
      result := ERR_NONE
    Else
      If (s.ErrorCode And $7E) <> $70 Then result := ERR_UNKNOWN
      Else
        Case (s.SenseKey And $0F) Of
          0:
            Begin
              If (s.SenseKey And $80) <> 0 Then result := ERR_FILEMARK
              Else If (s.SenseKey And $40) <> 0 Then result := ERR_ENDOFMEDIA
              Else If (s.SenseKey And $20) <> 0 Then result := ERR_ILLEGALLENGTH
              Else If (s.SenseKey And $80) <> 0 Then result := ERR_INCORRECTLENGTH
              Else result := ERR_AS_00_00;
            End;
          1: result := ERR_RECOVEREDERROR;
          2: result := ERR_NOTREADY;
          3: result := ERR_MEDIUMERROR;
          4: result := ERR_HARDWAREERROR;
          5: result := ERR_ILLEGALREQUEST;
          6: result := ERR_UNITATTENTION;
          7: result := ERR_DATAPROTECT;
          8: result := ERR_ERASECHECK;
          10: result := ERR_COPYABORTED;
          11: result := ERR_ABORTEDCOMMAND;
          13: result := ERR_VOLUMEOVERFLOW;
          14: result := ERR_MISCOMPARE;
          15: result := ERR_RESERVED;
        End;
  fErrorString := result;
  AdditionalSenseInformation(scm);
End;
{******************************************************************************}
{                             Execute Scsi Command                             }
{******************************************************************************}
Function TDicomSCSIDevice.ExecScsiCommand;
Var
  Event: THandle;
  EventNotify: Boolean;
  {$IFDEF DEBUG}
  i: Integer;
  s: String;
  {$ENDIF}
Begin
  fErrorString := '';
  Event := 0;
  fTargetBusy := False;
  FillChar(fLastSense, SizeOf(fLastSense), 0);
  If (Not GetASPIInitialized) Or (fHaID = 254) Then
  Begin
    result := $E2;
    Exit;
  End;
  EventNotify := sc.Flags And $40 = $40;
  If EventNotify Then
  Begin
    Event := CreateEvent(Nil, True, False, Nil);
    ResetEvent(Event);
    sc.PostProc := Event;
  End
  Else
    sc.PostProc := 0;
  sc.Command := SC_EXEC_SCSI_CMD;
  sc.Target := fTarget;
  sc.HaID := fHaID;
  sc.Lun := fLun;
  sc.SenseLen := SENSE_LEN;
  If TimeOut <= 10000 Then
    TimeOut := 10000;

  sc.CDBByte[1] := ((fLun And 7) Shl 5) Or (sc.CDBByte[1] And $1F);
  {$DEFINE NOWRITE1}
  {$IFDEF NOWRITE}
  If (sc.CDBCmd <> $2A) And (sc.CDBCmd <> $5B) And (sc.CDBCmd <> $53) Then
    SendASPI32Command(@sc)
  Else
    sc.Status := 1;
  {$ELSE}
  SendASPI32Command(@sc);
  {$ENDIF}
  If EventNotify Then
  Begin
    If sc.Status = ss_pending Then
      WaitForSingleObject(Event, TimeOut);
  End;
  If (sc.Status <> 1) And (sc.Status <> 0) Then
    DecodeSense(sc);
  If GenerateLogs Then
  Begin
    s := IntToStr(sc.HaID) + ':' + IntToHex(sc.Target, 1) + ':' + IntToStr(sc.Lun) + ' <' + IntToHex(sc.Status, 2) + '>' + ' [' + IntToHex(sc.buflen, 5) + ']';
    s := '(' + IntToHex(sc.CDBCmd, 2) + ') {' + IntToHex(sc.Flags, 2) + '|' + IntToHex(sc.CDBLen, 2) + '} - ' + s + ' ';
    For i := 1 To 15 Do s := s + IntToHex(sc.CDBByte[i], 2) + ' ';
    s := CommandName[sc.CDBCmd] + ' ' + s + ' ';
    s := s + '|';
    If sc.buflen <> 0 Then
    Begin
      For i := 0 To Min($100, sc.buflen - 1) Do s := s + IntToHex(Byte(sc.BufPointer[i]), 2) + ' ';
    End;
    DebugMsg('<<< ' + FormatDateTime('nn:ss:zzz ', Now) + s + '= '
      + IntToHex(sc.HaStat, 2) + ' ' + IntToHex(sc.TargStat, 2) + ' ' + IntToHex(sc.SenseArea.ErrorCode, 2) + ' ' + IntToHex(sc.SenseArea.SenseKey, 2) + ' '
      + 'ASC:' + IntToHex(sc.SenseArea.AddSenseCode, 2) + ',ASQ:' + IntToHex(sc.SenseArea.AddSenQual, 2) + ' '
      + fErrorString, mtUNKNOWN);
  End
  Else
  Begin
    If Not DontShowError Then
    Begin
      DontShowError := True;
      If (sc.Status <> 1) And (sc.Status <> 0) Then
        If (sc.CDBCmd <> $5C) And (sc.CDBCmd <> $12) And (sc.CDBCmd <> $35) Then
          If (sc.CDBCmd <> $BB) And (sc.CDBCmd <> $5A) And (sc.CDBCmd <> $35) Then
            If (sc.CDBCmd <> $B6) And (sc.CDBCmd <> $1E) And (sc.CDBCmd <> $55) Then
              If (sc.CDBCmd <> $00) And (sc.CDBCmd <> $01) And (sc.CDBCmd <> $23) Then
                If (sc.CDBCmd <> $43) And (sc.CDBCmd <> $04) And (sc.CDBCmd <> $46) Then
                  If (sc.CDBCmd <> $52) And (sc.CDBCmd <> $1B) And (sc.CDBCmd <> $51) Then
                    If Not ((sc.SenseArea.AddSenseCode = 04) And (sc.SenseArea.AddSenQual = 08)) Then
                    Begin
                      s := IntToStr(sc.HaID) + ':' + IntToHex(sc.Target, 1) + ':' + IntToStr(sc.Lun) + ' <' + IntToHex(sc.Status, 2) + '>' + ' [' + IntToHex(sc.buflen, 5) + ']';
                      s := '(' + IntToHex(sc.CDBCmd, 2) + ') {' + IntToHex(sc.Flags, 2) + '|' + IntToHex(sc.CDBLen, 2) + '} - ' + s + ' ';
                      For i := 1 To 15 Do s := s + IntToHex(sc.CDBByte[i], 2) + ' ';
                      s := CommandName[sc.CDBCmd] + ' ' + s + ' ';
                      s := s + '|';
                      If sc.buflen <> 0 Then
                      Begin
                        For i := 0 To Min($100, sc.buflen - 1) Do s := s + IntToHex(Byte(sc.BufPointer[i]), 2) + ' ';
                      End;
                      DebugMsg('<<< ' + s + '= '
                        + IntToHex(sc.HaStat, 2) + ' ' + IntToHex(sc.TargStat, 2) + ' ' + IntToHex(sc.SenseArea.ErrorCode, 2) + ' ' + IntToHex(sc.SenseArea.SenseKey, 2) + ' '
                        + 'ASC:' + IntToHex(sc.SenseArea.AddSenseCode, 2) + ',ASQ:' + IntToHex(sc.SenseArea.AddSenQual, 2) + ' '
                        + fErrorString, mtUNKNOWN);
                    End;
    End;
  End;

  If sc.Status = 0 Then
  Begin
    If EventNotify Then
    Begin
      CloseHandle(Event);
      ResetEvent(Event);
    End;
    AbortSCSICommand(sc);
    sc.Status := 4;
    sc.HaStat := HASTAT_TIMEOUT;
  End
  Else
  Begin
    CloseHandle(Event);
  End;
  result := 1;
  If Integer(sc.BufPointer) Mod 4 <> 0 Then
    DebugMsg('aaaa' + IntToStr(Integer(sc.BufPointer)), 0);
End;

{******************************************************************************}
{                                                                              }
{******************************************************************************}
Function TDicomSCSIDevice.SendCueSheet(Buffer: pAnsiChar; BufferLength: Integer): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := $50;
  lsrb.CDBLen := $0A;
  lsrb.buflen := BufferLength;
  lsrb.BufPointer := Buffer;
  lsrb.CDBCmd := $5D;
  lsrb.CDBByte[7] := HiByte(BufferLength);
  lsrb.CDBByte[8] := LoByte(BufferLength);
  ExecScsiCommand(lsrb, 30000);
  result := lsrb.Status = SS_COMP;
End;
{******************************************************************************}
{                                Is Unit Ready ?                               }
{******************************************************************************}
Function TDicomSCSIDevice.TestUnitReady;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := SRB_EVENT_NOTIFY;
  lsrb.CDBLen := 06;
  lsrb.SenseLen := SENSE_LEN;
  ExecScsiCommand(lsrb, TimeOut);
  result := lsrb.Status = SS_COMP;
End;
{******************************************************************************}
{                                Is Unit Ready ?                               }
{******************************************************************************}

Function TDicomSCSIDevice.WaitForReady(TimeOut: Integer = 10000; Step: Integer = 5000): Boolean;
Var
  OTO: Integer;
Label
  Wait02End;
Begin
  result := False;
  OTO := TimeOut;
  FillChar(_SenseInfo, SizeOf(_SenseInfo), 0);
  If (PDVR103) Or (Wait02) Then
  Begin
    Repeat
      SleepEx(1500, False);
      Dec(OTO, 1500);
      If OTO < 0 Then Goto Wait02End;
      TestUnitReady;
    Until (LastSense.AddSenseCode <> 4);
  End;
  Wait02End:
  If (MediumIs <> mtDVD_RAM) Then
  Begin
    Repeat
      SleepEx(Step, False);
      ReadDiscInformation;
      Dec(OTO, Step);
      If OTO < 0 Then Exit;
    Until (LastSense.AddSenseCode <> 4);
  End
  Else
    _SenseInfo.ASC := 4;
  If Not TestUnitReady Or (_SenseInfo.ASC <> 0) Then
  Begin
    Repeat
      SleepEx(Step, False);
      Dec(OTO, Step);
      If OTO < 0 Then Exit;
      TestUnitReady;
    Until (LastSense.AddSenseCode <> 4);
    Repeat
      FillChar(_SenseInfo, SizeOf(_SenseInfo), 0);
      RequestSense(@_SenseInfo, SizeOf(_SenseInfo));
      Dec(OTO, Step);
      If OTO < 0 Then Exit;
      If _SenseInfo.ResponseCode = $F0 Then
        _SenseInfo.ASC := 04;
      If _SenseInfo.ASC = 4 Then
        SleepEx(Step, False);
    Until (_SenseInfo.ASC = 0);
  End;
  result := True;
End;
{******************************************************************************}
{                               Reset SCSI Device                              }
{******************************************************************************}
Function TDicomSCSIDevice.ScsiReset: Integer;
Var
  srb: SRB_BusDeviceReset;
  res: Integer;
Begin
  FillChar(srb, SizeOf(SRB_BusDeviceReset), 0);
  srb.Target := fTarget;
  srb.Command := SC_RESET_DEV;
  srb.Flags := SRB_DIR_SCSI;
  srb.Lun := fLun;
  srb.HaID := fHaID;
  res := SendASPI32Command(@srb);
  result := res;
End;
{******************************************************************************}
{                               Erase CD/DVD                                   }
{******************************************************************************}
Var
  th: TDicomEraseThread;

Function TDicomSCSIDevice.EraseProgress: Integer;
Begin
  If Not Erasing Then
    result := 0
  Else
    result := th.Progress;
End;

Procedure TDicomEraseThread.EraseDoneEvent;
Begin
  Device.fErasing := False;
  If Assigned(Device.fEraseDone) Then
    Device.fEraseDone(Device, EraseDoneWithError);

End;
{******************************************************************************}
{                    Wait for Erase to be completed                            }
{******************************************************************************}

Procedure TDicomEraseThread.Execute;
Var
  Seconds: Double;
  i: Integer;
Label
  endoferase;
Begin
  fProgress := 0;
  Seconds := 0;
  If (MediumIs = mtDVD_RW_RO) Or (MediumIs = mtDVD_RW_SR) Then
  Begin
    Repeat
      fProgress := Round(Seconds / AproxSecs * 100);
      Seconds := Seconds + 1;
      If Not Device.TestUnitReady Then
        SleepEx(2000, False);
      fProgress := Round(Seconds / AproxSecs * 100);
    Until (Device.LastSense.AddSenseCode <> 4) Or (AproxSecs < Seconds);
    SleepEx(5000, False);
    Repeat
      fProgress := Round(Seconds / AproxSecs * 100);
      Seconds := Seconds + 1;
      If Not Device.TestUnitReady Then
        SleepEx(2000, False);
    Until (Device.LastSense.AddSenseCode <> 4) Or (AproxSecs < Seconds);

  End
  Else If ((MediumIs = mtDVD_PLUSRW)) Then
  Begin
    buf1 := #$00#$82#$00#$08#$00#$23#$05#$40#$98#$00#$00#$00;
    //if (device.FormatUnit($11, @buf1, 12)) then
    Repeat
      Sleep(2000);
      Seconds := Seconds + 2;
      Device.ReadDiscInformation;
      fProgress := Round(Seconds / AproxSecs * 100);
    Until (Device.LastSense.AddSenseCode <> 04);

    FillChar(buf2, $FF00, 0);
    If (Device.EraseType_ = etQuick) Then
    Begin
      For i := 0 To 64 Do
        If Not Device.Write10(i * 32, 32, buf2, 32 * 2048) Then
          Goto endoferase;
      SleepEx(300, False);
      fProgress := Round(Seconds / AproxSecs * 100);
      Seconds := Seconds + 1;
    End
    Else
    Begin
      For i := 0 To 71000 Do
        If Not Device.Write10(i * 32, 32, buf2, 32 * 2048) Then
          Goto endoferase;
      SleepEx(300, False);
      Seconds := Seconds + 1;
      fProgress := Round(Seconds / AproxSecs * 100);
    End;
    Device.FlushCache(30000, False);
    Device.CloseTrackDVD(False, 03, 0, 0, 0);

  End Else If ((MediumIs = mtDVD_RAM)) And (Device.EraseType_ = etQuick) Then
  Begin
    FillChar(buf2, $FF00, 0);
    For i := 0 To 64 Do
    Begin
      Device.Write10(i * 32, 32, buf2, 32 * 2048);
    End;
    Device.FlushCache(30000, False);
  End;
  endoferase:
  If Wait02 Then
  Begin
    Repeat
      fProgress := Round(Seconds / AproxSecs * 100);
      Seconds := Seconds + 2;
      If Not Device.TestUnitReady Then
        SleepEx(2000, False);
    Until (Device.LastSense.AddSenseCode <> 4) Or (AproxSecs < Seconds);
    Device.ReadDiscInformation;
    SleepEx(5000, False);
  End;
  If Not Device.TestUnitReady Or Not Device.ReadDiscInformation Then
  Begin
    If (Medium <> mtDVD_RAM) Then
    Begin
      Repeat
        fProgress := Round(Seconds / AproxSecs * 100);
        Device.ReadDiscInformation;
        Seconds := Seconds + 5;
        If Device.LastSense.AddSenseCode = 4 Then
          SleepEx(5000, False);
      Until (Device.LastSense.AddSenseCode <> 4) Or (AproxSecs < Seconds);
    End;
    Repeat
      fProgress := Round(Seconds / AproxSecs * 100);
      Seconds := Seconds + 2;
      If Not Device.TestUnitReady Then
        SleepEx(2000, False);
    Until (Device.LastSense.AddSenseCode <> 4) Or (AproxSecs < Seconds);

    Repeat
      fProgress := Round(Seconds / AproxSecs * 100);
      FillChar(_SenseInfo, SizeOf(_SenseInfo), 0);
      Device.RequestSense(@_SenseInfo, SizeOf(_SenseInfo));
      Seconds := Seconds + 2;
      If _SenseInfo.ResponseCode = $F0 Then
        _SenseInfo.ASC := 04;
      If _SenseInfo.ASC = 4 Then
        SleepEx(2000, False)
      Else
        SleepEx(2000, False);
    Until (_SenseInfo.ASC = 0) Or (AproxSecs < Seconds);
  End;

  If ASPILayerName = 'BMASPI32' Then
    _ReInitializeASPI;
  fProgress := 100;
  Device.SetWriteParams(False, False, False, 1);
  Device.SetCDSpeed(Device.MaxReadSpeed, 2);
  Device.Rewind;
  Device.LockMedium(True);
  Device.LoadMedium;
  Device.Rewind;
  Device.TestUnitReady;
  Device.fErasing := False;
  If Device.ConsoleApplication Then
  Begin
    If Assigned(Device.fEraseDone) Then
      Device.fEraseDone(Device, EraseDoneWithError);
  End
  Else
    Synchronize(EraseDoneEvent);
End;
{******************************************************************************}
{                                 Erase Disc                                   }
{******************************************************************************}
Function TDicomSCSIDevice.EraseDisc;
Var
  lsrb: TSRB_ExecSCSICmd;
  WriteSpeed, i: Integer;
Begin
  TestUnitReady;
  LoadMedium;
  MediumIs := DiscType;
  result := False;
  EraseType_ := EraseType;
  If Not TestUnitReady Then
  Begin
    If Not WaitForReady(30000) Then
    Begin
      result := False;
      Exit;
    End;
  End;
  If (MediumIs <> mtDVD_RAM) Then
  Begin
    SetCDSpeed(fReadSpeed, fWriteSpeed);
    SetWriteParams(False, False, False, MediumIs);
  End;
  WriteSpeed := CurrentWriteSpeed;
  If Not TestUnitReady Then
  Begin
    If Not WaitForReady(30000) Then
    Begin
      result := False;
      Exit;
    End;
  End;
  If (MediumIs = mtDVD_RAM) Or (MediumIs = mtDVD_RW) Or (MediumIs = mtDVD_RW_RO) Or (MediumIs = mtDVD_RW_SR) Or (MediumIs = mtDVD_PLUSRW) Then
    DebugMsg('>>> ' + Format(MSG_ERASESTART, [DiscTypeString[MediumIs], FormatFloat('0.0X', WriteSpeed / 1385) + FormatFloat('(#,##0 KB/s)', WriteSpeed)]), mtMESSAGE)
  Else
    DebugMsg('>>> ' + Format(MSG_ERASESTART, [DiscTypeString[MediumIs], FormatFloat('0X', WriteSpeed / 176.4) + FormatFloat('(#,##0 KB/s)', WriteSpeed)]), mtMESSAGE);
  If (MediumIs <> mtDVD_RAM) And (MediumIs <> mtDVD_PLUSRW) Then
  Begin
    FillChar(lsrb, SizeOf(lsrb), 0);
    lsrb.Flags := SRB_EVENT_NOTIFY;
    lsrb.CDBLen := $0C;
    lsrb.SenseLen := SENSE_LEN;
    lsrb.CDBCmd := $A1;
    lsrb.CDBByte[1] := Byte(EraseType);
    lsrb.CDBByte[1] := lsrb.CDBByte[1] Or 16; //16 for Background Erase
    ExecScsiCommand(lsrb, (60 * 1000) * 80); // max timeout 80 mins
    result := (lsrb.Status = SS_COMP) Or (lsrb.Status = ss_pending);
  End
  Else
  Begin
    If (MediumIs = mtDVD_RAM) Then
    Begin
      If EraseType = etQuick Then
      Begin
        FillChar(buf2, $FF00, 0);
        For i := 0 To 10 Do
        Begin
          Write10(i * 32, 32, buf2, 32 * 2048);
          result := True;
        End;
        FlushCache(30000, False);
      End
      Else
      Begin
        buf1 := #$00#$82#$00#$08#$00#$22#$21#$20#$00#$00#$08#$00;
        result := FormatUnit($11, buf1, 12);
      End;
    End
    Else If (MediumIs = mtDVD_PLUSRW) Then
    Begin
      buf1 := #$00#$82#$00#$08#$00#$23#$05#$40#$98#$00#$00#$00;
      result := FormatUnit($11, @buf1, 12);
      If (Not result) Then
      Begin
        Rewind;
        Sleep(1000);
        result := FormatUnit($11, @buf1, 12);
      End;

    End;
  End;
  If result Then
  Begin
    th := TDicomEraseThread.Create(True);
    th.Medium := MediumIs;
    th.FreeOnTerminate := True;
    th.Device := Self;
    If MediumIs < 4 Then
    Begin
      th.AproxSecs := 75 * 60;
      If EraseType = etQuick Then
        th.AproxSecs := 150;
      If EraseType = etComplete Then
        th.AproxSecs := 75 * 60;
    End
    Else
    Begin
      th.AproxSecs := 74 * 60 * 2;
      If EraseType = etQuick Then
      Begin
        th.AproxSecs := 600;
        If MediumIs = mtDVD_RW Then
          th.AproxSecs := 60 * 3;
      End;
      If EraseType = etComplete Then
        th.AproxSecs := 74 * 60;
    End;
    fErasing := True;
    th.Resume;
  End
  Else
  Begin
    fErasing := False;
    If Assigned(fEraseDone) Then
      fEraseDone(Self, True);

  End;

End;
{******************************************************************************}
{                         Prevent/Allow Medium Removal                         }
{******************************************************************************}
Function TDicomSCSIDevice.LockMedium(Unlock: Boolean = False): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  If Unlock Then
    CloseFH := True;
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := SRB_EVENT_NOTIFY;
  lsrb.CDBLen := $06;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.CDBCmd := $1E;
  If Not Unlock Then
    lsrb.CDBByte[4] := 1;
  ExecScsiCommand(lsrb, 10000);
  result := lsrb.Status = SS_COMP;
  CloseFH := False;
End;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
Procedure TDicomSCSIDevice.LockDrive(Unlock: Boolean = True);
Begin
  KxSPTI.CloseFH := Unlock;
End;
{******************************************************************************}
{                                  Inquiry                                     }
{******************************************************************************}
Function TDicomSCSIDevice.Inquiry: Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := $48;
  lsrb.CDBLen := $06;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.buflen := 128;
  lsrb.BufPointer := @fInquiryData;
  lsrb.CDBCmd := $12;
  lsrb.CDBByte[4] := 128;
  ExecScsiCommand(lsrb, 10000);
  result := lsrb.Status = SS_COMP;
End;
{******************************************************************************}
{                                Mode Sense10                                  }
{******************************************************************************}
Function TDicomSCSIDevice.ModeSense10;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  FillChar(buf, SizeOf(buf), 0);
  lsrb.Flags := $48;
  lsrb.CDBLen := $0A;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.buflen := buflen;
  lsrb.BufPointer := @buf2;
  lsrb.CDBCmd := $5A;
  If PS Then
    lsrb.CDBByte[2] := PageCode + 128
  Else
    lsrb.CDBByte[2] := PageCode;
  lsrb.CDBByte[7] := HiByte(buflen);
  lsrb.CDBByte[8] := LoByte(buflen);
  ExecScsiCommand(lsrb, 20000);
  result := lsrb.Status = SS_COMP;
  If result Then
  Begin
    Move(buf2, buf, buflen);
  End;
End;
{******************************************************************************}
{                              Get Configuration                               }
{******************************************************************************}
Function TDicomSCSIDevice.GetConfigData(RT: Byte; Profile: Word; buf: Pointer; buflen: Integer): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := $48;
  lsrb.CDBLen := $0A;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.buflen := buflen;
  lsrb.BufPointer := buf;
  lsrb.CDBCmd := $46;
  lsrb.CDBByte[1] := RT;
  lsrb.CDBByte[3] := Profile;
  lsrb.CDBByte[8] := buflen;            //.. word
  ExecScsiCommand(lsrb, 30000);
  result := lsrb.Status = SS_COMP;
End;
{******************************************************************************}
{                                Set Streaming                                 }
{******************************************************************************}
Function TDicomSCSIDevice.SetStreaming(Buffer: Pointer; BufLength: Word): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := $50;
  lsrb.CDBLen := 12;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.buflen := BufLength;
  lsrb.BufPointer := Buffer;
  lsrb.CDBCmd := $B6;
  CvtEndians(BufLength, lsrb.CDBByte[9], 2);
  ExecScsiCommand(lsrb, 10000);
  result := lsrb.Status = SS_COMP;
End;

Function TDicomSCSIDevice.SetPerformance(StartLBA: LongWord; EndLBA: LongWord; ReadSize: LongWord; WriteSize: LongWord; ReadTime: LongWord; WriteTime: LongWord): Boolean;
Var
  buf1: Packed Array[0..79] Of Byte;
  pd: TAPerformaceDescriptor;
Begin
  Move(buf1[0], pd.OtherInfo, 28);
  pd.StartLBA := 0;
  pd.EndLBA := L2MDW(pd.EndLBA);
  pd.ReadSize := L2MDW(pd.ReadSize);
  pd.ReadTime := L2MDW(ReadTime);
  pd.WriteSize := L2MDW(pd.WriteSize);
  pd.WriteTime := L2MDW(WriteTime);
  Move(pd.OtherInfo, buf4, 28);
  result := SetStreaming(@buf4, 28);
End;
{******************************************************************************}
{                               Read DVD Structure                             }
{******************************************************************************}
Function TDicomSCSIDevice.SendDVDStructure(Format: Byte; buf: Pointer; BufLength: Word): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := $50;
  lsrb.CDBLen := 12;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.buflen := BufLength;
  lsrb.BufPointer := buf;
  lsrb.CDBCmd := $BF;
  lsrb.CDBByte[7] := Format;
  CvtEndians(BufLength, lsrb.CDBByte[8], 2);
  ExecScsiCommand(lsrb, 10000);
  result := lsrb.Status = SS_COMP;
End;
{******************************************************************************}
{                             Read DVD Structure TS                            }
{******************************************************************************}
Function TDicomSCSIDevice.SendDVDStructureTimeStamp(Time: TDateTime): Boolean;
Var
  Str: String;
Begin
  Str := FormatDateTime('yyyymmddhhnnss', Time);
  buf1 := #$00 + #$14 + #$00 + #$00 + #$00 + #$00 + #$00 + #$00;
  Move(Str[1], buf1[8], 14);
  result := SendDVDStructure($0F, @buf1, $16);
End;
{******************************************************************************}
{                               Read DVD Structure                             }
{******************************************************************************}
Function TDicomSCSIDevice.ReadDVDStructure(Layer, Format: Byte; buf: Pointer; BufLength: Word): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := $48;
  lsrb.CDBLen := $0C;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.buflen := BufLength;
  lsrb.BufPointer := buf;
  lsrb.CDBCmd := $AD;
  lsrb.CDBByte[7] := Format;
  lsrb.CDBByte[6] := Layer;
  CvtEndians(BufLength, lsrb.CDBByte[8], 2);
  ExecScsiCommand(lsrb, 10000);
  result := lsrb.Status = SS_COMP;
End;
{******************************************************************************}
{                                Mode Select10                                 }
{******************************************************************************}
Function TDicomSCSIDevice.ModeSelect10;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  Move(Buffer[0], buf2[0], buflen);
  lsrb.Flags := $50;
  lsrb.CDBLen := $0A;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.buflen := buflen;
  lsrb.BufPointer := buf2;
  lsrb.CDBCmd := $55;
  lsrb.CDBByte[1] := 16;
  lsrb.CDBByte[8] := buflen;            //.. word
  ExecScsiCommand(lsrb, 10000);
  result := lsrb.Status = SS_COMP;
End;
{******************************************************************************}
{                           Check for JustLink                                 }
{******************************************************************************}
Function TDicomSCSIDevice.IsJustLinkCapable: Boolean;
Var
  page: Byte;
  s: Integer;
Begin
  page := $30;
  result := False;
  FillChar(buf3, $80, 0);
  If ModeSense10(page, buf3, $80, False) Then
  Begin
    If buf3[16] = page Then s := 16
    Else If buf3[8] = page Then s := 8
    Else If buf3[7] = page Then s := 7
    Else s := 0;
    If s <> 0 Then
      result := True;
  End;
End;
{******************************************************************************}
{                           Get Device Capabilities                            }
{******************************************************************************}
Function TDicomSCSIDevice.GetDeviceCapabilities;
Var
  i: Integer;
  s: Byte;
  page: Integer;
Begin
  fDevCaps := [];
  s := 15;
  page := $2A;
  fDeviceMaxWriteSpeed := 0;
  fDeviceMaxReadSpeed := 0;
  FillChar(ModePage2A, SizeOf(ModePage2A), 0);
  FillChar(buf3, 255, 0);
  If ModeSense10(page, buf3, $FF, True) Then
  Begin
    If buf3[16] = page Then s := 16
    Else If buf3[8] = page Then s := 8
    Else If buf3[7] = page Then s := 7
    Else s := 8;
    For i := 0 To 254 - s Do buf3[i] := buf3[i + s];
    Move(buf3, ModePage2A, SizeOf(ModePage2A));
    If (ModePage2A.DiscReadCaps And $01 = $01) Then Include(fDevCaps, dcReadCDR);
    If (ModePage2A.DiscReadCaps And $02 = $02) Then Include(fDevCaps, dcReadCDRW);
    If (ModePage2A.DiscReadCaps And $04 = $04) Then Include(fDevCaps, dcReadMethod2);
    If (ModePage2A.DiscReadCaps And $08 = $08) Then Include(fDevCaps, dcReadDVD);
    If (ModePage2A.DiscReadCaps And $10 = $10) Then
    Begin
      Include(fDevCaps, dcReadDVDR);
      Include(fDevCaps, dcReadDVDRW);
    End;
    If (ModePage2A.DiscReadCaps And $20 = $20) Then Include(fDevCaps, dcReadDVDRAM);

    If (ModePage2A.DiscWriteCaps And $01 = $01) Then Include(fDevCaps, dcWriteCDR);
    If (ModePage2A.DiscWriteCaps And $02 = $02) Then Include(fDevCaps, dcWriteCDRW);
    If (ModePage2A.DiscWriteCaps And $04 = $04) Then Include(fDevCaps, dcWriteTest);
    If (ModePage2A.DiscWriteCaps And $10 = $10) Then
    Begin
      Include(fDevCaps, dcWriteDVDR);
      Include(fDevCaps, dcWriteDVDRW);
    End;
    If (ModePage2A.DiscWriteCaps And $20 = $20) Then Include(fDevCaps, dcWriteDVDRAM);
    If (ModePage2A.AudioPlay And $80 = $80) Then Include(fDevCaps, dcUnderrunProtection);
    If IsJustLinkCapable Or TEAC512EB Then
      Include(fDevCaps, dcUnderrunProtection);
    If ModePage2A.MaxWriteSpeed = 0 Then
    Begin
      If (ModePage2A.DiscWriteCaps And $20 = $20) Then
        fDeviceMaxWriteSpeed := 1;
    End
    Else
      fDeviceMaxWriteSpeed := L2MW(ModePage2A.MaxWriteSpeed);

    If ModePage2A.MaxReadSpeed = 0 Then
    Begin
      If (ModePage2A.DiscWriteCaps And $20 = $20) Then
        fDeviceMaxReadSpeed := 1;
    End
    Else
      fDeviceMaxReadSpeed := L2MW(ModePage2A.MaxReadSpeed);
    If GetConfigData(2, $2A, @dtBuf, SizeOf(dtBuf)) Then
    Begin
      dtBuf.CurrentProfile := L2MW(dtBuf.CurrentProfile);
      dtBuf.FeatureCode := L2MW(dtBuf.FeatureCode);
      If (dtBuf.FeatureCode = $2A) Then
      Begin
        Include(fDevCaps, dcReadDVDPLUSR);
        Include(fDevCaps, dcReadDVDPLUSRW);
        If dtBuf.otherData[0] = 1 Then
        Begin
          Include(fDevCaps, dcWriteDVDPLUSR);
          Include(fDevCaps, dcWriteDVDPLUSRW);
        End;
      End;
    End;
    If GetConfigData(2, $3B, @dtBuf, SizeOf(dtBuf)) Then
    Begin
      dtBuf.CurrentProfile := L2MW(dtBuf.CurrentProfile);
      dtBuf.FeatureCode := L2MW(dtBuf.FeatureCode);
      If (dtBuf.FeatureCode = $3B) Then
      Begin
        Include(fDevCaps, dcReadDVDPLUSRDL);
        If dtBuf.otherData[0] = 1 Then
          Include(fDevCaps, dcWriteDVDPLUSRDL);
      End;
    End;
    If GetConfigData(2, $2F, @dtBuf, SizeOf(dtBuf)) Then
    Begin
      dtBuf.CurrentProfile := L2MW(dtBuf.CurrentProfile);
      dtBuf.FeatureCode := L2MW(dtBuf.FeatureCode);
      If (dtBuf.FeatureCode = $2F) Then
      Begin
        Include(fDevCaps, dcReadDVDR);
        Include(fDevCaps, dcReadDVDRW);
        If dtBuf.otherData[0] = 1 Then
        Begin
          Include(fDevCaps, dcWriteDVDR);
          Include(fDevCaps, dcWriteDVDRW);
        End;
      End;
    End;

  End
  Else
  Begin
    fDeviceMaxWriteSpeed := 0;
    fDeviceMaxReadSpeed := 0;
  End;
  FillChar(buf3, 255, 0);
  If ModeSense10(page, buf3, $80) Then
  Begin
    If buf3[16] = page Then s := 16
    Else If buf3[8] = page Then s := 8
    Else If buf3[7] = page Then s := 7;
    For i := 0 To 254 - s Do buf3[i] := buf3[i + s];
    Move(buf3, ModePage2A, SizeOf(ModePage2A));
    If ModePage2A.CurWriteSpeed = 0 Then
      ModePage2A.CurWriteSpeed := 1385;
    If ModePage2A.MaxWriteSpeed = 0 Then
      ModePage2A.MaxWriteSpeed := 1385;
    ModePage2A.CurWriteSpeed := L2MW(ModePage2A.CurWriteSpeed);
    ModePage2A.MaxWriteSpeed := L2MW(ModePage2A.MaxWriteSpeed);

    ModePage2A.CurReadSpeed := L2MW(ModePage2A.CurReadSpeed);
    ModePage2A.MaxReadSpeed := L2MW(ModePage2A.MaxReadSpeed);
    ModePage2A.BufferSize := L2MW(ModePage2A.BufferSize);
    FillChar(buf3, 255, 0);
    result := True;
    If fDeviceMaxWriteSpeed < ModePage2A.MaxWriteSpeed Then
      fDeviceMaxWriteSpeed := ModePage2A.MaxWriteSpeed;
    If fDeviceMaxReadSpeed < ModePage2A.MaxReadSpeed Then
      fDeviceMaxReadSpeed := ModePage2A.MaxReadSpeed;

  End
  Else
    result := False;
End;
{******************************************************************************}
{                              Set Write Parametes                             }
{******************************************************************************}
Function TDicomSCSIDevice.SetWriteParams(TestWrite, UnderrunProtected, MultiSession: Boolean; MediumIs: Smallint): Boolean;
Var
  s, i: Integer;
Begin
  If MediumIs = mtDVD_RAM Then
  Begin
    result := True;
    Exit;
  End;
  result := False;
  FillChar(ModeSenseBuf1, SizeOf(ModeSenseBuf1), 0);
  FillChar(ModeSenseBuf2, SizeOf(ModeSenseBuf2), 0);
  If ModeSense10($05, ModeSenseBuf1, SizeOf(ModeSenseBuf1)) Then
  Begin
    If ModeSenseBuf1[16] = $05 Then s := 16
    Else If ModeSenseBuf1[8] = $05 Then s := 8
    Else If ModeSenseBuf1[7] = $05 Then s := 7 Else s := 8;
    For i := 0 To SizeOf(ModeSenseBuf1) - s - 1 Do ModeSenseBuf2[i] := ModeSenseBuf1[i + s];
    Move(ModeSenseBuf2, ModePage05, SizeOf(ModePage05));
    ModePage05.PageLen := $32;
    If (MediumIs = mtDVD_R) Then
    Begin
      ModePage05.WriteType := $60;
      ModePage05.TrackMode := $E5;
      ModePage05.LinkSize := $10;
      ModePage05.PacketSize := $10000000;
    End
    Else
    Begin
      ModePage05.WriteType := 1;
      ModePage05.TrackMode := 4;
      ModePage05.LinkSize := 0;
      ModePage05.PacketSize := 0;
    End;
    ModePage05.DBType := 8;

    If fwms Then
    Begin
      ModePage05.WriteType := 02;
      ModePage05.DBType := 0;
    End;
    If (MediumIs = mtDVD_RW) And (MediumIs = mtDVD_RW_RO) Then
    Begin
      ModePage05.WriteType := $20;
      ModePage05.TrackMode := $05;
    End
    Else If (MediumIs = mtDVD_PLUSR) Or (MediumIs = mtDVD_PLUSRW) Then
    Begin
      ModePage05.WriteType := $22;
      ModePage05.TrackMode := ModePage05.TrackMode Or $C0
    End;

    If SonyPowerBurn Then
      ModePage05.WriteType := ModePage05.WriteType Or $20;
    If (MediumIs <> mtDVD_R) And (MediumIs <> mtDVD_RW) And (MediumIs <> mtDVD_RW_RO) And (MediumIs <> mtDVD_RW_SR) And (MediumIs <> mtDVD_PLUSR) Then
    Begin
      If Not TestWrite Then
      Begin
        If Not fFinalizeDisc Then
          ModePage05.TrackMode := ModePage05.TrackMode Or $C0
        Else
          If ModePage05.TrackMode And $C0 = $C0 Then ModePage05.TrackMode := ModePage05.TrackMode - $C0;
      End
      Else
        If ModePage05.TrackMode And $C0 = $C0 Then ModePage05.TrackMode := ModePage05.TrackMode - $C0;
    End
    Else
    Begin
      ModePage05.TrackMode := ModePage05.TrackMode Or $E0;
    End;
    If (dcUnderrunProtection In fDevCaps) And (UnderrunProtected) Then
      ModePage05.WriteType := ModePage05.WriteType Or $40
    Else
      If ModePage05.WriteType And $40 = $40 Then ModePage05.WriteType := ModePage05.WriteType - $40;
    If (dcWriteTest In fDevCaps) And (TestWrite) Then
      ModePage05.WriteType := ModePage05.WriteType Or $10
    Else
      If ModePage05.WriteType And $10 = $10 Then ModePage05.WriteType := ModePage05.WriteType - $10;
    ModePage05.SessionFormat := 0;

    ModePage05.Res6 := 0;
    ModePage05.Res9 := 0;
    ModePage05.Host_App_Code := 0;
    If (MediumIs = mtDVD_PLUSR) Then
    Begin
      ModePage05.Res6 := $10;
      ModePage05.PacketSize := $10000000;
    End;

    If (MediumIs = mtDVD_RW_RO) Or (MediumIs = mtDVD_RW_SR) Then
    Begin
      ModePage05.TrackMode := $4;
      ModePage05.WriteType := $20;
      ModePage05.TrackMode := $C5;
      ModePage05.LinkSize := $10;
    End;

    If (MediumIs = mtDVD_PLUSR) Then
    Begin
      ModePage05.TrackMode := $C4;
      ModePage05.Res6 := $0;
    End;

    If (MediumIs = mtDVD_PLUSRDL) Then
    Begin
      ModePage05.WriteType := ModePage05.WriteType And $F0;
      ModePage05.WriteType := ModePage05.WriteType Or $02;
      ModePage05.TrackMode := ModePage05.TrackMode And $F0;
      ModePage05.TrackMode := ModePage05.TrackMode Or $04;
      ModePage05.Res6 := $0;
      ModePage05.WriteType := ModePage05.WriteType Or $20;
      ModePage05.LinkSize := $0;
      ModePage05.TrackMode := ModePage05.TrackMode And $DF;
      ModePage05.PacketSize := 0;
      If MultiSession Then
        ModePage05.TrackMode := ModePage05.TrackMode Or $C0
      Else
        ModePage05.TrackMode := ModePage05.TrackMode And $3F;
    End
    Else
    Begin
      If UnderrunProtected Then
        If (ModePage2A.AudioPlay And $80 = $80) Then
          ModePage05.WriteType := ModePage05.WriteType Or $40;
    End;

    If (MediumIs = mtDVD_PLUSRW) Then
    Begin
      ModePage05.TrackMode := $4;
      ModePage05.LinkSize := $10;
    End;

    ModePage05.PauseLen := $9600;
    Move(ModePage05, ModeSenseBuf2, ModePage05.PageLen + s + 1);
    FillChar(ModeSenseBuf1, 64, 0);
    For i := 0 To $3C - s Do ModeSenseBuf1[i + 8] := ModeSenseBuf2[i];
    If ModeSelect10(@ModeSenseBuf1[0], ModePage05.PageLen + 10) Then
      result := True;
  End;
End;
{******************************************************************************}
{                                Send OPC                                      }
{******************************************************************************}
Function TDicomSCSIDevice.SendOPC;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := $40;
  lsrb.CDBLen := $0A;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.CDBCmd := $54;
  lsrb.CDBByte[1] := $01;
  ExecScsiCommand(lsrb, 150000);
  result := lsrb.Status = SS_COMP;
End;
{******************************************************************************}
{                          Close Track/Session                                 }
{******************************************************************************}
Function TDicomSCSIDevice.CloseTrack(Session: Boolean = False; Immed: Boolean = True; DVDPR: Boolean = False; TrackNo: Byte = 0): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Command := 2;
  lsrb.Flags := $40;
  lsrb.CDBLen := $0A;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.CDBCmd := $5B;
  If Immed Then
    lsrb.CDBByte[1] := $01;             //  1 = immed 0 = Wait
  If DVDPR Then
  Begin
    lsrb.CDBByte[2] := $05;
  End
  Else
  Begin
    If Session Then
      lsrb.CDBByte[2] := $01
    Else
      lsrb.CDBByte[2] := $02;           //  1 = sessiom : 2 = : track 3 = ???
  End;
  lsrb.CDBByte[4] := $00;               //   Track Number.
  If Session Then
    lsrb.CDBByte[5] := $FF;
  ExecScsiCommand(lsrb, 180000);
  result := lsrb.Status = SS_COMP;
End;
{******************************************************************************}
{                          Close Track/Session                                 }
{******************************************************************************}
Function TDicomSCSIDevice.CloseTrackDVD(Immed: Boolean; b2, b3, b4, b5: Byte): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Command := 2;
  lsrb.Flags := $40;
  lsrb.CDBLen := $0A;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.CDBCmd := $5B;
  If Immed Then
    lsrb.CDBByte[1] := $01;
  lsrb.CDBByte[2] := b2;
  lsrb.CDBByte[3] := b3;
  lsrb.CDBByte[4] := b4;
  lsrb.CDBByte[5] := b5;
  ExecScsiCommand(lsrb, 180000);
  result := lsrb.Status = SS_COMP;
End;

{******************************************************************************}
{                               Load/Eject Medium                              }
{******************************************************************************}
Function TDicomSCSIDevice.LoadMedium(Eject: Boolean = False): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  CloseFH := True;
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Command := 2;
  lsrb.Flags := $40;
  lsrb.CDBLen := $06;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.CDBCmd := $1B;
  lsrb.CDBByte[1] := $00;               // can be immed
  If Eject Then
    lsrb.CDBByte[4] := $02
  Else
    lsrb.CDBByte[4] := $03;
  ExecScsiCommand(lsrb, 20000);
  result := lsrb.Status = SS_COMP;
  CloseFH := False;
End;
{******************************************************************************}
{                                   Read10                                     }
{******************************************************************************}
Function TDicomSCSIDevice.Read10(LBA: Cardinal; TransferLength: Word; Buffer: pAnsiChar; buflen: Cardinal): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := $48;
  lsrb.CDBLen := $0A;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.buflen := buflen;
  lsrb.BufPointer := Buffer;
  lsrb.CDBCmd := $28;
  CvtEndians(LBA, lsrb.CDBByte[2], 4);
  lsrb.CDBByte[7] := HiByte(TransferLength);
  lsrb.CDBByte[8] := LoByte(TransferLength);
  ExecScsiCommand(lsrb, 10000);
  result := lsrb.Status = SS_COMP;
End;
{******************************************************************************}
{                                   ReadCD                                     }
{******************************************************************************}
Function TDicomSCSIDevice.ReadCD(LBA: Cardinal; TransferLength: Word; Buffer: pAnsiChar; buflen: Cardinal; SecType, Other, SubChannelsSelection: Byte): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := $48;
  lsrb.CDBLen := $0C;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.buflen := buflen;
  lsrb.BufPointer := Buffer;
  lsrb.CDBCmd := $BE;
  CvtEndians(LBA, lsrb.CDBByte[2], 4);
  lsrb.CDBByte[1] := SecType;
  lsrb.CDBByte[7] := HiByte(TransferLength);
  lsrb.CDBByte[8] := LoByte(TransferLength);
  lsrb.CDBByte[9] := Other;
  lsrb.CDBByte[10] := SubChannelsSelection;
  ExecScsiCommand(lsrb, 10000);
  result := lsrb.Status = SS_COMP;
End;
{******************************************************************************}
{                               Reserve Track                                  }
{******************************************************************************}
Function TDicomSCSIDevice.ReserveTrack(ReservationSize: Cardinal): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := $40;
  lsrb.CDBLen := $C;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.CDBCmd := $53;
  CvtEndians(ReservationSize, lsrb.CDBByte[5], 4);
  ExecScsiCommand(lsrb, 10000);
  result := lsrb.Status = SS_COMP;
End;
{******************************************************************************}
{                               Read Capacity                                  }
{******************************************************************************}
Function TDicomSCSIDevice.ReadCapacity(Var Capacity, SectorSize: Cardinal): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := $48;
  lsrb.CDBLen := $A;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.buflen := 8;
  lsrb.BufPointer := @buf1;
  lsrb.CDBCmd := $25;
  ExecScsiCommand(lsrb, 10000);
  result := lsrb.Status = SS_COMP;
  If result Then
  Begin
    CvtEndians(buf1[4], SectorSize, 4);
    CvtEndians(buf1, Capacity, 4);
  End;
End;
{******************************************************************************}
{                                    Write 10                                  }
{******************************************************************************}
Function TDicomSCSIDevice.Write10(LBA: Cardinal; TransferLength: Word; Buffer: pAnsichar; buflen: Cardinal; Flags: Byte = $50): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
  {$IFDEF TRIAL}
  LBAi: Integer;
  LBA_W: Word;
  {$ENDIF}
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := Flags;
  lsrb.CDBLen := $0A;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.buflen := buflen;
  lsrb.BufPointer := Buffer;
  lsrb.CDBCmd := $2A;
  {$IFDEF TRIAL}
  LBAi := LBA;
  If LBAi > High(Word) Then
  Begin
    DebugMsg('>>> ' + ERR_TRIALLIMIT, mtFATALERROR);
    result := False;
    lsrb.Status := $04;
    Exit;
  End;
  If LBAi < 0 Then
  Begin
    lsrb.CDBByte[2] := $FF;
    lsrb.CDBByte[3] := $FF;
  End;
  LBA_W := loWord(LBA);
  CvtEndians(LBA_W, lsrb.CDBByte[4], 2);
  {$ELSE}
  CvtEndians(LBA, lsrb.CDBByte[2], 4);
  {$ENDIF}
  CvtEndians(TransferLength, lsrb.CDBByte[7], 2);
  ExecScsiCommand(lsrb, 120000);
  result := (lsrb.Status = SS_COMP) Or (lsrb.Status = ss_pending);
End;
{******************************************************************************}
{                               Synch/Flush Cache                              }
{******************************************************************************}
Function TDicomSCSIDevice.FlushCache;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := $40;
  lsrb.CDBLen := $0A;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.CDBCmd := $35;
  If Immed Then
    lsrb.CDBByte[1] := $2;
  ExecScsiCommand(lsrb, TimeOut);
  result := lsrb.Status = SS_COMP;
End;
{******************************************************************************}
{                          Set CD Speed,Read/Write                             }
{******************************************************************************}
Function TDicomSCSIDevice.SetCDSpeed(ReadSpeed, WriteSpeed: Cardinal): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  If WriteSpeed = 0 Then WriteSpeed := $FFFF Else WriteSpeed := WriteSpeed;
  If ReadSpeed = 0 Then ReadSpeed := $FFFF Else ReadSpeed := ReadSpeed;
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := $40;
  lsrb.CDBLen := $0C;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.CDBCmd := $BB;
  lsrb.CDBByte[2] := HiByte(ReadSpeed);
  lsrb.CDBByte[3] := LoByte(ReadSpeed);
  lsrb.CDBByte[4] := HiByte(WriteSpeed);
  lsrb.CDBByte[5] := LoByte(WriteSpeed);
  ExecScsiCommand(lsrb, 10000);
  result := lsrb.Status = SS_COMP;
End;
{******************************************************************************}
{                              Read Buffer Capactiy                            }
{******************************************************************************}
Function TDicomSCSIDevice.ReadBufferCapacity(Var BufferLength, BlankBufferLength: Cardinal): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  FillChar(buf1, $20, 0);
  lsrb.Flags := $48;
  lsrb.CDBLen := $0A;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.buflen := $20;
  lsrb.BufPointer := @buf1;
  lsrb.CDBCmd := $5C;
  lsrb.CDBByte[8] := $20;
  ExecScsiCommand(lsrb, 10000);
  result := lsrb.Status = SS_COMP;
  If result Then
  Begin
    CvtEndians(buf1[4], BufferLength, 4);
    CvtEndians(buf1[8], BlankBufferLength, 4);
    fDeviceBufferSize := BufferLength;
    fDeviceFreeBufferSize := BlankBufferLength;
    If BlankBufferLength = $FFFFFFFF Then
      fDeviceFreeBufferSize := BufferLength;
  End
  Else
  Begin
    fDeviceFreeBufferSize := 0;

  End;
End;
{******************************************************************************}
{                              Get Format Capactiy                             }
{******************************************************************************}

Type
  TFormatCapacity = Packed Record
    Res1, Res2, Res3,
      CapacityListLength: Byte;
    NumberOfBlocks: Cardinal;
    BlockLength: Cardinal;
    NumberOfBlocks2: Cardinal;
    BlockLength2: Cardinal;
    NumberOfBlocks3: Cardinal;
    BlockLength3: Cardinal;
  End;

Var
  bufFormatCapacity: TFormatCapacity;

Function TDicomSCSIDevice.GetFormatCapacity(Var Capacity: Cardinal; Var SectorSize: Cardinal): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  FillChar(bufFormatCapacity, SizeOf(bufFormatCapacity), 0);
  lsrb.Flags := $48;
  lsrb.CDBLen := $A;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.buflen := 248;
  lsrb.BufPointer := @bufFormatCapacity;
  lsrb.CDBCmd := $23;
  lsrb.CDBByte[8] := 248;
  ExecScsiCommand(lsrb, 10000);
  result := lsrb.Status = SS_COMP;
  If result Then
  Begin
    bufFormatCapacity.NumberOfBlocks := L2MDW(bufFormatCapacity.NumberOfBlocks);
    bufFormatCapacity.NumberOfBlocks2 := L2MDW(bufFormatCapacity.NumberOfBlocks2);
    bufFormatCapacity.NumberOfBlocks3 := L2MDW(bufFormatCapacity.NumberOfBlocks3);
    SectorSize := 2048;
    If bufFormatCapacity.BlockLength = $080000 Then
      Capacity := bufFormatCapacity.NumberOfBlocks
    Else If (bufFormatCapacity.BlockLength2 = $080000) Or (bufFormatCapacity.BlockLength2 = 152) Then
      Capacity := bufFormatCapacity.NumberOfBlocks2
    Else If bufFormatCapacity.BlockLength3 = $080000 Then
      Capacity := bufFormatCapacity.NumberOfBlocks3
    Else
      Capacity := bufFormatCapacity.NumberOfBlocks
  End;
End;
{******************************************************************************}
{                             Read Track Information                           }
{******************************************************************************}
Function TDicomSCSIDevice.ReadTrackInformation;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  FillChar(fTrackInformation, SizeOf(fTrackInformation), 0);
  lsrb.Flags := $48;
  lsrb.CDBLen := $0A;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.buflen := SizeOf(fTrackInformation);
  lsrb.BufPointer := @fTrackInformation;
  lsrb.CDBCmd := $52;
  lsrb.CDBByte[1] := $01;
  lsrb.CDBByte[2] := HiByte(HiWord(TrackNumber));
  lsrb.CDBByte[3] := LoByte(HiWord(TrackNumber));
  lsrb.CDBByte[4] := HiByte(loWord(TrackNumber));
  lsrb.CDBByte[5] := LoByte(loWord(TrackNumber));
  lsrb.CDBByte[8] := SizeOf(fTrackInformation);
  ExecScsiCommand(lsrb, 60000);
  //sss := #$00#$1A#$01#$01#$00#$04#$4F#$01#$00#$00#$00#$00#$00#$00#$00#$00#$00#$05#$1C#$FA#$00#$00#$00#$00#$00#$05#$1C#$FA#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00;
  //move(sss, fTrackInformation, sizeof(fTrackInformation));
  result := lsrb.Status = SS_COMP;
  If result Then
  Begin
    fTrackInformation.DataLength := L2MW(fTrackInformation.DataLength);
    fTrackInformation.TrackSize := L2MDW(fTrackInformation.TrackSize);
    fTrackInformation.FreeBlocks := L2MDW(fTrackInformation.FreeBlocks);
    fTrackInformation.TrackStartAddress := L2MDW(fTrackInformation.TrackStartAddress);
    fTrackInformation.NextWritableAddress := L2MDW(fTrackInformation.NextWritableAddress);
    fTrackInformation.FixedpacketSize := L2MDW(fTrackInformation.FixedpacketSize);
    fTrackInformation.LastRecordedAddress := L2MDW(fTrackInformation.LastRecordedAddress);
  End;
End;

Function MSF2LBA(H, m, s, f: Byte): Cardinal;
Begin
  result := (H * 60 * 60 * 75) + (m * 60 * 75) + (s * 75) + (f);
End;
{******************************************************************************}
{                               Get Disc Information                           }
{******************************************************************************}
Var
  TOCData0000: TTOCData0000;
  TOCData0001: TTOCData0001;

Function TDicomSCSIDevice.GetDiscInformation: TDisc;
Var
  ti, dt: Byte;
Begin
  FillChar(fDisc, SizeOf(fDisc), 0);
  fDisc.DiscType := '';
  If TestUnitReady Then
    fDisc.Valid := True
  Else
  Begin
    WaitForReady(3000);
    If TestUnitReady Then
      fDisc.Valid := True
    Else
    Begin
      fDisc.Valid := False;
      Exit;
    End;
  End;
  //fillchar(buf1, sizeof(buf1), 0);
  FillChar(TOCData0000, SizeOf(TOCData0000), 0);
  If ReadTOC(0, @TOCData0000, SizeOf(TOCData0000)) Then
  Begin
    TOCData0000.DataLength := L2MW(TOCData0000.DataLength);
    If ReadTOC(0, @TOCData0000, SizeOf(TOCData0000), TOCData0000.LastTrackNumber) Then
    Begin
      TOCData0000.DataLength := L2MW(TOCData0000.DataLength);
      TOCData0000.TrackStartAddress := L2MDW(TOCData0000.TrackStartAddress);
    End;
    If ReadTOC(1, @TOCData0001, SizeOf(TOCData0001)) Then
    Begin
      fDisc.FirstCompleteSession := TOCData0001.FirstTrackNumber;
      fDisc.LastCompleteSession := TOCData0001.LastTrackNumber;
    End;
    If ReadTOC(4, @fTOC100, SizeOf(fTOC100), 0, True) Then
      fDisc.TotalBlocks := MSF2LBA(0, fTOC100.EdMin, fTOC100.EdSec, fTOC100.EdFrame)
    Else
      fDisc.TotalBlocks := 0;
    fDisc.DiscType := 'CD-ROM';
  End;
  FillChar(dtBuf, SizeOf(dtBuf), 0);
  If GetConfigData(2, 0, @dtBuf, SizeOf(dtBuf)) Then
  Begin
    dtBuf.CurrentProfile := L2MW(dtBuf.CurrentProfile);
    Case dtBuf.CurrentProfile Of
      $0001: fDisc.DiscType := 'Non-removable disk';
      $0002: fDisc.DiscType := 'Removable disk';
      $0003:
        Begin
          fDisc.DiscType := 'MO Eraseable';
          fDisc.Eraseable := True;
        End;
      $0004: fDisc.DiscType := 'MO Write Once';
      $0005: fDisc.DiscType := 'AS-MO';
      $0008: fDisc.DiscType := 'CD-ROM';
      $0009: fDisc.DiscType := 'CD-R';
      $000A:
        Begin
          fDisc.DiscType := 'CD-RW';
          fDisc.Eraseable := True;
        End;
      $0010: fDisc.DiscType := 'DVD-ROM';
      $0011: fDisc.DiscType := 'DVD-R';
      $0012: fDisc.DiscType := 'DVD-RAM';
      $0013:
        Begin
          fDisc.DiscType := 'DVD-RW Restricted Overwrite';
          fDisc.Eraseable := True;
        End;
      $0014:
        Begin
          fDisc.DiscType := 'DVD-RW Sequential Recording';
          fDisc.Eraseable := True;
        End;
      $001A:
        Begin
          fDisc.DiscType := 'DVD+RW';
          fDisc.Eraseable := True;
        End;
      $001B: fDisc.DiscType := 'DVD+RW';
      $0020: fDisc.DiscType := 'DDCD-ROM';
      $0021: fDisc.DiscType := 'DDCD-R';
      $0022:
        Begin
          fDisc.DiscType := 'DDCD-RW';
          fDisc.Eraseable := True;
        End;
    Else fDisc.DiscType := '???????';
    End;
    fDisc.DiscTypeCode := dtBuf.CurrentProfile;
    dt := DiscType;
    If dt >= mtDVD_ROM Then
      ti := 1
    Else
      ti := $FF;
    If Not ReadTrackInformation(ti) Then
    Begin
      fDisc.UsedBlocks := fTrackInformation.NextWritableAddress;
      fDisc.TotalBlocks := fTrackInformation.NextWritableAddress + fTrackInformation.FreeBlocks;
      fDisc.BlockLength := 2048;
      ReadDiscInformation;
    End
    Else
    Begin
      If GetFormatCapacity(fDisc.UsedBlocks, fDisc.BlockLength) Then
        If fDisc.TotalBlocks < fDisc.UsedBlocks Then
          fDisc.TotalBlocks := fDisc.UsedBlocks;
    End;
  End;
  If ReadDiscInformation Then With fDisc Do
    Begin

      If ((DiscInfo.DiscStatus And 00) = 00) Then DiscStatus := dsEmptyDisc;
      If ((DiscInfo.DiscStatus And 01) = 01) Then DiscStatus := dsIncompleteDisc; //..dvd
      If ((DiscInfo.DiscStatus And 02) = 02) Then DiscStatus := dsCompleteDisc;
      If ((DiscInfo.DiscStatus And 03) = 03) Then DiscStatus := dsOther;

      If ((DiscInfo.DiscStatus And 16) = 16) Then Eraseable := True Else Eraseable := False; //***
      DiscStatus := DiscStatus Shl 4;
      DiscStatus := DiscStatus Shr 6;
      If ((DiscInfo.DiscStatus And 00) = 00) Then LastSession := lsEmptySession;
      If ((DiscInfo.DiscStatus And 01) = 01) Then LastSession := lsIncompleteLastSession;
      If ((DiscInfo.DiscStatus And 02) = 02) Then LastSession := lsDamagedLastSession;
      If ((DiscInfo.DiscStatus And 03) = 03) Then LastSession := lsCompleteLastSession;

    End
  Else
  Begin
    ReadCapacity(fDisc.UsedBlocks, fDisc.BlockLength);
    If ReadTrackInformation($0) Then
      fDisc.DiscType := 'CD-ROM';
  End;
  If fDisc.TotalBlocks < fDisc.UsedBlocks Then
    fDisc.TotalBlocks := fDisc.UsedBlocks;
  result := fDisc;
End;
{******************************************************************************}
{                                Read Disk Information                         }
{******************************************************************************}
Function TDicomSCSIDevice.ReadDiscInformationRaw(Buffer: pAnsiChar; BufferLength: Integer): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  FillChar(DiscInfo, SizeOf(DiscInfo), 0);
  lsrb.Flags := $48;
  lsrb.CDBLen := $0A;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.buflen := BufferLength;
  lsrb.BufPointer := Buffer;
  lsrb.CDBCmd := $51;
  lsrb.CDBByte[8] := BufferLength;
  ExecScsiCommand(lsrb, 10000);
  result := lsrb.Status = SS_COMP;
End;
{******************************************************************************}
{                                Read Disk Information                         }
{******************************************************************************}
Function TDicomSCSIDevice.ReadDiscInformation: Boolean;
Begin
  FillChar(DiscInfo, SizeOf(DiscInfo), 0);
  result := ReadDiscInformationRaw(@DiscInfo, SizeOf(DiscInfo));
  If result Then
  Begin
    DiscInfo.Datalen := L2MW(DiscInfo.Datalen);
  End;
End;
{$R-}
{******************************************************************************}
{                             Last Sessoin Status                              }
{******************************************************************************}
Function TDicomSCSIDevice.LastSessionStatus: Smallint;
Var
  LastSession: Byte;
Begin

  If ReadDiscInformation Then
  Begin
    LastSession := lsEmptySession;
    DiscInfo.DiscStatus := DiscInfo.DiscStatus Shl 4;
    DiscInfo.DiscStatus := DiscInfo.DiscStatus Shr 6;
    If ((DiscInfo.DiscStatus And 01) = 01) Then LastSession := lsIncompleteLastSession;
    If ((DiscInfo.DiscStatus And 02) = 02) Then LastSession := lsDamagedLastSession;
    If ((DiscInfo.DiscStatus And 03) = 03) Then LastSession := lsCompleteLastSession;
    result := LastSession;
  End
  Else
    result := -1;
End;

{******************************************************************************}
{                                  Disc Status                                 }
{******************************************************************************}
Function TDicomSCSIDevice.DiscStatus: Smallint;
Var
  tDiscStatus: Byte;

Begin
  If ReadDiscInformation Then
  Begin
    tDiscStatus := dsEmptyDisc;
    If ((DiscInfo.DiscStatus And 01) = 01) Then
      tDiscStatus := dsIncompleteDisc;  //..dvd
    If ((DiscInfo.DiscStatus And 02) = 02) Then
      tDiscStatus := dsCompleteDisc;
    If ((DiscInfo.DiscStatus And 03) = 03) Then
      tDiscStatus := dsOther;
    result := tDiscStatus;
  End
  Else
    result := -1;
End;
{******************************************************************************}
{                            Number of Sessions on CD                          }
{******************************************************************************}
Function TDicomSCSIDevice.SessionsOnDisc: Smallint;
Var
  DiscStatus, LastSession: Byte;
Begin
  If ReadDiscInformation Then
  Begin
    DiscStatus := dsEmptyDisc;
    If ((DiscInfo.DiscStatus And 01) = 01) Then
      DiscStatus := dsIncompleteDisc;
    If ((DiscInfo.DiscStatus And 02) = 02) Then
      DiscStatus := dsCompleteDisc;
    If ((DiscInfo.DiscStatus And 03) = 03) Then
      DiscStatus := dsOther;
    DiscInfo.DiscStatus := DiscInfo.DiscStatus Shl 4;
    DiscInfo.DiscStatus := DiscInfo.DiscStatus Shr 6;
    LastSession := lsEmptySession;
    If ((DiscInfo.DiscStatus And 01) = 01) Then LastSession := lsIncompleteLastSession;
    If ((DiscInfo.DiscStatus And 02) = 02) Then LastSession := lsDamagedLastSession;
    If ((DiscInfo.DiscStatus And 03) = 03) Then LastSession := lsCompleteLastSession;
    If (DiscStatus = dsEmptyDisc) Then
    Begin
      result := 0;
      Exit;
    End;
    result := DiscInfo.Sessions;
    If (LastSession = lsEmptySession) And (result > 0) Then
      Dec(result);
  End
  Else
    result := 0;
End;
{$R+}
Type
  TVDesc = Packed Record
    pdType: Byte;                       //   1 -   1
    Identifier: Array[1..5] Of AnsiChar;    //   2 -   6
    Version: Byte;                      //   7 -   7
    VolumeFlag: Byte;                   //   8 -   8
    IdSystem: Array[0..31] Of AnsiChar;     //   9 -  40
    IdVolume: Array[0..31] Of AnsiChar;     //  41 -  72
    IdBC: Array[0..7] Of AnsiChar;          //  73 -  80
    NoOfSectors: LongWord;              //  81 -  84
    NoOfSectorsBE: LongWord;            //  85 -  88
    Reserved: Array[0..2048] Of AnsiChar;
  End;
Var
  impvd: TVDesc;
  {******************************************************************************}
  {                            Number of Used Blocks                             }
  {******************************************************************************}
Function TDicomSCSIDevice.GetLastRecordedAddress: Cardinal;
Var
  i: Integer;
Begin
  For i := 16 To 32 Do
  Begin
    FillChar(impvd, SizeOf(impvd), 0);
    If Read10(i, 1, @impvd, 2048) Then
      With impvd Do If (Identifier[1] = 'C') And (Identifier[2] = 'D') And (Identifier[3] = '0') And (Identifier[4] = '0') And (Identifier[5] = '1') Then If (pdType = 2) Or (pdType = 1) Then
          Begin
            result := impvd.NoOfSectors;
            Exit;
          End;
  End;
  result := 0;
End;

Function TDicomSCSIDevice.UsedBlocksOnDisc: Cardinal;
Var
  dt, ti: Byte;
  OrgFin: Boolean;
  SectorSize, UsedBlocks: Cardinal;

Begin
  dt := DiscType;
  OrgFin := FinalizeDisc;
  FinalizeDisc := True;
  SetWriteParams(False, UnderrunProtection, FinalizeDisc, MediumIs);
  FinalizeDisc := OrgFin;
  DiscInfo.LastTrackOfLastSession := 0;
  ReadDiscInformation;
  result := 0;

  If (dt < mtDVD_ROM) Then
  Begin
    result := 0;
    ti := SessionsOnDisc + 1;
    If ReadTrackInformation(ti) Then
    Begin
      result := fTrackInformation.NextWritableAddress;
      If fTrackInformation.NextWritableAddress = $FFFFFFFF Then
        result := fTrackInformation.TrackSize;
      If Not ((ti <> 1) And (result = 0)) Then
        Exit;
    End;
    If Not ReadCapacity(UsedBlocks, SectorSize) Then
    Begin
      ti := SessionsOnDisc + 1;
      If ReadTrackInformation(ti) Then
        result := fTrackInformation.FreeBlocks;
    End
    Else
    Begin
      If UsedBlocks > $7F000000 Then
      Begin
        If GetFormatCapacity(UsedBlocks, SectorSize) Then
          result := UsedBlocks
        Else
          result := 0;
      End
      Else
        result := UsedBlocks;
    End;
    //DebugMsg('>>> USED BLOCKS ON DISC ARE '+ IntToStr(result)+' ('+ IntToStr(result * 2048 div 1024 div 1024)+' MB)', mtMessage);
    Exit;
  End;
  If ReadTrackInformation(DiscInfo.LastTrackOfLastSession) Then
  Begin
    If fTrackInformation.TrackSize = $FFFFFFFF Then
    Begin
      result := 0;
      Exit;
    End;
    If (dt = mtDVD_RW_RO) Then
    Begin
      If GetFormatCapacity(UsedBlocks, SectorSize) Then
      Begin
        If fTrackInformation.TrackSize = fTrackInformation.FreeBlocks Then
        Begin
          result := 0;
        End
        Else
          result := fTrackInformation.TrackSize;
        Exit;
      End;
    End
    Else If (dt = mtDVD_RW_SR) Then
    Begin
      If GetFormatCapacity(UsedBlocks, SectorSize) Then
      Begin
        If fTrackInformation.TrackSize = fTrackInformation.FreeBlocks Then
        Begin
          result := 0;
        End
        Else
          result := fTrackInformation.TrackSize;
        Exit;
      End;
    End
    Else If (dt = mtDVD_RAM) Or (dt = mtDVD_PLUSRW) Then
    Begin
      result := GetLastRecordedAddress;
      Exit;
    End;
    result := fTrackInformation.NextWritableAddress;
  End;
  //DebugMsg('>>> USED BLOCKS ON DISC ARE '+ IntToStr(result)+' ('+ IntToStr(result * 2048 div 1024 div 1024)+' MB)', mtMessage);
End;
{******************************************************************************}
{                            Number of Free Blocks                             }
{******************************************************************************}
Function TDicomSCSIDevice.FreeBlocksOnDisc: Cardinal;
Var
  dt, ti: Byte;
  OrgFin: Boolean;
  TotalBlocks, UsedBlocks, SectorSize: Cardinal;
Begin
  dt := DiscType;
  OrgFin := FinalizeDisc;
  FinalizeDisc := True;
  SetWriteParams(False, UnderrunProtection, FinalizeDisc, MediumIs);
  FinalizeDisc := OrgFin;
  DiscInfo.LastTrackOfLastSession := 0;
  ReadDiscInformation;
  result := 0;
  If (dt < mtDVD_ROM) Then
  Begin
    OrgFin := FinalizeDisc;
    FinalizeDisc := True;
    SetWriteParams(False, UnderrunProtection, FinalizeDisc, MediumIs);
    FinalizeDisc := OrgFin;
    If (DiscStatus = dsCompleteDisc) Then
    Begin
      result := 0;
      Exit;
    End;
    ReadDiscInformation;
    ti := DiscInfo.LastTrackOfLastSession;
    If ReadTrackInformation(ti) Then
    Begin
      result := fTrackInformation.FreeBlocks;
      If fTrackInformation.FreeBlocks < fTrackInformation.TrackSize Then
        result := fTrackInformation.TrackSize;
    End
    Else
    Begin
      If ReadTrackInformation(ti) Then
      Begin
        result := fTrackInformation.FreeBlocks;
        If fTrackInformation.FreeBlocks < fTrackInformation.TrackSize Then
          result := fTrackInformation.TrackSize;
      End
      Else
        result := 0;
    End;
    If fTrackInformation.FreeBlocks < fTrackInformation.TrackSize Then
      result := fTrackInformation.TrackSize;
    Exit;
  End;
  If ReadTrackInformation(DiscInfo.LastTrackOfLastSession) Then
  Begin
    If (dt = mtDVD_RW_RO) Then
    Begin
      If (fTrackInformation.NextWritableAddress <> 0) Then
      Begin
        result := fTrackInformation.FreeBlocks;
        Exit;
      End;
      If GetFormatCapacity(TotalBlocks, SectorSize) Then
      Begin
        If fTrackInformation.TrackSize <> fTrackInformation.FreeBlocks Then
          result := TotalBlocks - fTrackInformation.TrackSize
        Else
          result := fTrackInformation.FreeBlocks;
        Exit;
      End;
    End
    Else If (dt = mtDVD_RAM) Or (dt = mtDVD_PLUSRW) Then
    Begin
      UsedBlocks := GetLastRecordedAddress;
      result := fTrackInformation.TrackSize - UsedBlocks;
      Exit;
    End;
    If fTrackInformation.TrackSize = $FFFFFFFF Then
    Begin
      result := 0;
      Exit;
    End;
    If fTrackInformation.LastRecordedAddress = 0 Then
      result := fTrackInformation.TrackSize
    Else
      result := fTrackInformation.FreeBlocks;
  End;

End;
{******************************************************************************}
{                           Total Number of Blocks                             }
{******************************************************************************}

Function TDicomSCSIDevice.TotalBlocksOnDisc: Cardinal;
Var
  dt, ti: Byte;
  OrgFin: Boolean;
  a, b: Cardinal;
  TotalBlocks, SectorSize: Cardinal;
Label
  skip;
Begin
  dt := DiscType;
  OrgFin := FinalizeDisc;
  FinalizeDisc := True;
  SetWriteParams(False, UnderrunProtection, FinalizeDisc, MediumIs);
  FinalizeDisc := OrgFin;
  DiscInfo.LastTrackOfLastSession := 0;
  ReadDiscInformation;
  result := 0;
  If (dt < mtDVD_ROM) Then
  Begin
    ti := SessionsOnDisc;
    If ReadTOC(4, @fTOC100, SizeOf(fTOC100), 0, True) Then
    Begin
      result := MSF2LBA(0, fTOC100.EdMin, fTOC100.EdSec, fTOC100.EdFrame);
      If result < 20000 Then If ReadCapacity(a, b) Then
          If a > result Then result := a;
    End
    Else If GetFormatCapacity(result, result) Then
    Begin
      If (result = 4294770689) Then
      Begin
        result := 0;
        If ReadTrackInformation(ti + 1) Then
          result := fTrackInformation.FreeBlocks + fTrackInformation.TrackStartAddress
        Else
          If ReadTrackInformation(ti) Then
            result := fTrackInformation.FreeBlocks + fTrackInformation.TrackStartAddress;
      End;
      Goto skip
    End
    Else If ReadTrackInformation(ti) Then //--
    Begin
      result := fTrackInformation.FreeBlocks + fTrackInformation.TrackStartAddress;
      Exit;
    End
    Else If GetFormatCapacity(result, result) Then
      Exit;
    skip:
    If result = $FFFFFFFF Then
      result := UsedBlocksOnDisc;
    Exit;

  End;
  If ReadTrackInformation(DiscInfo.LastTrackOfLastSession) Then
  Begin
    If (dt = mtDVD_RAM) Or (dt = mtDVD_PLUSRW) Or (dt = mtDVD_RW_RO) Then
    Begin
      If GetFormatCapacity(TotalBlocks, SectorSize) Then
      Begin
        result := TotalBlocks;
        Exit;
      End;
    End;
    result := fTrackInformation.FreeBlocks + fTrackInformation.NextWritableAddress;
  End;
  //DebugMsg('>>> TOTAL BLOCKS ON DISC ARE '+ IntToStr(result)+' ('+ IntToStr(result * 2048 div 1024 div 1024)+' MB)', mtMessage);
End;
{******************************************************************************}
{                            De-InitializeASPI                                 }
{******************************************************************************}
Function TDicomSCSIDevice.DeInitializeASPI: Boolean;
Begin
  result := _DeInitializeASPI;
End;
{******************************************************************************}
{                            CD/DVD Erasable ?                                 }
{******************************************************************************}
Function TDicomSCSIDevice.Erasable: Boolean;
Begin
  result := False;
  If ReadDiscInformation Then
  Begin
    If ((DiscInfo.DiscStatus And 16) = 16) Then
      result := True;
  End
  Else
  Begin
    MediumIs := DiscType;
    If (MediumIs = mtDVD_RAM) Or (MediumIs = mtDVD_RW_RO) Or (MediumIs = mtDVD_RW_SR) Or (MediumIs = mtDVD_PLUSRW) Then
      result := True;
  End;
End;
{******************************************************************************}
{                                Disc Type                                     }
{******************************************************************************}
Function TDicomSCSIDevice.DiscType: Byte;
Var
  res: Boolean;
Begin
  result := 0;
  res := GetConfigData(2, 0, @dtBuf, SizeOf(dtBuf));
  If res Then
  Begin
    dtBuf.CurrentProfile := L2MW(dtBuf.CurrentProfile);
    Case dtBuf.CurrentProfile Of
      $0008: result := mtCD_ROM;
      $0009: result := mtCD_R;
      $000A: result := mtCD_RW;
      $0010: result := mtDVD_ROM;
      $0011: result := mtDVD_R;
      $0012: result := mtDVD_RAM;
      $0013: result := mtDVD_RW_RO;
      $0014: result := mtDVD_RW_SR;
      $001A: result := mtDVD_PLUSRW;
      $001B: result := mtDVD_PLUSR;
      $0020: result := mtDDCD_ROM;
      $0021: result := mtDDCD_R;
      $0022: result := mtDDCD_RW;
      $002B: result := mtDVD_PLUSRDL;
    Else result := mtUNKNOWN;
    End;
  End;
  If result = 0 Then
  Begin
    If ReadTOC(4, @fTOC100, SizeOf(fTOC100), 0, True) Then
    Begin
      If (fTOC100.Field2 And 128 = 128) Then //valid bit
      Begin
        If (fTOC100.Field2 And 64 = 64) Then
          result := mtCD_RW
        Else
          result := mtCD_R;
      End
      Else
        result := mtCD_ROM;
    End;

    If ReadDiscInformation And (result = 0) Then
    Begin
      If ((DiscInfo.DiscStatus And 16) = 16) Then
        result := mtCD_RW
      Else
        result := mtCD_R;
    End;

    If (result = 0) And TestUnitReady Then
      result := mtCD_ROM
  End;
End;

Procedure TDicomSCSIDevice.Lock;
Begin
  CriticalSection.Enter;
End;

Procedure TDicomSCSIDevice.Unlock;
Begin
  CriticalSection.Leave;
End;

{******************************************************************************}
{                            Read TOC/PMA etc.                                 }
{******************************************************************************}
Function TDicomSCSIDevice.ReadTOC(Format: Byte; Buffer: pAnsiChar; BufferLength: Integer; SessionTrackNumber: Byte = 0; Time: Boolean = False; Control: Byte = 0): Boolean;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := $48;
  lsrb.CDBLen := $0A;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.buflen := BufferLength;
  lsrb.BufPointer := Buffer;
  lsrb.CDBCmd := $43;
  If Time Then
    lsrb.CDBByte[1] := 2;
  lsrb.CDBByte[2] := Format;
  lsrb.CDBByte[6] := SessionTrackNumber;
  lsrb.CDBByte[8] := BufferLength;
  lsrb.CDBByte[9] := Control;
  ExecScsiCommand(lsrb, 10000);
  result := lsrb.Status = SS_COMP;
End;
{******************************************************************************}
{                            Request Sense                                     }
{******************************************************************************}
Function TDicomSCSIDevice.RequestSense;
Var
  lsrb: TSRB_ExecSCSICmd;
Begin
  FillChar(lsrb, SizeOf(lsrb), 0);
  lsrb.Flags := $48;
  lsrb.CDBLen := $06;
  lsrb.SenseLen := SENSE_LEN;
  lsrb.buflen := Len;
  lsrb.BufPointer := Buffer;
  lsrb.CDBCmd := $03;
  lsrb.CDBByte[4] := Len;
  ExecScsiCommand(lsrb, 10000);
  result := lsrb.Status = SS_COMP;
End;
(*
{******************************************************************************}
{                             Calc Free space                                  }
{******************************************************************************}
function TDicomSCSIDevice.CalcFreeDiscSpace: Int64;
var
  ii, i: Integer;
  bs: Integer;
  Disc: TDisc;
  a, b: Int64;
begin
  bs := SessionsOnDisc+1;
  ReadTrackInformation(bs);
  ReadTrackInformation(bs);
  Disc := GetDiscInformation;
  if not Disc.Valid then
  begin
    result := -1;
    exit;
  end;
  for i:= Disc.FirstCompleteSession to Disc.LastCompleteSession do
  begin
    fillchar(buf3, sizeof(buf3), 0);
    if ReadTOC(0, @buf3[0], 248, i, True) then
      a := MSF2LBA(0, buf3[9], buf3[10], buf3[11])
    else
      a := 0;
    result := 0;
    if a <> 0 then
    begin
      dec(a, 150);
      ReadTrackInformation(i);
      for ii := 16 to 32 do
      begin
        //if (Read10(a+ii, 1, @vd, 2048)) and (vd.NoOfSectors <> 0) then
        begin
          //inc(result, vd.NoOfSectors);
          break;
        end;
      end;
    end;
  end;
end;
*)
Var
  res: Integer;
  Str: String;
Begin
  {$IFDEF TRIAL}
  TrialMCDB := True;
  TrialMCB := True;
  {$ELSE}
  TrialMCDB := False;
  TrialMCB := False;
  {$ENDIF}
  Str := '';
  //exit;
  For res := 0 To 254 Do
    CommandName[res] := {'                  '+} IntToHex(res, 2);
  CommandName[$00] := 'TEST UNIT READY       ';
  CommandName[$01] := 'REWIND UNIT           ';
  CommandName[$03] := 'REQUEST SENSE         ';
  CommandName[$04] := 'FORMAT UNIT           ';
  CommandName[$12] := 'INQUIRY               ';
  CommandName[$1B] := 'START STOP UNIT       ';
  CommandName[$1E] := 'PREVENT/ALLOW REMOVAL ';
  CommandName[$23] := 'READ FORMAT CAPACITIES';
  CommandName[$25] := 'READ CAPACITY         ';
  CommandName[$28] := 'READ (10)             ';
  CommandName[$2A] := 'WRITE (10)            ';
  CommandName[$2B] := 'SEEK (10)             ';
  CommandName[$2E] := 'WRITE AND VERIFY (10) ';
  CommandName[$2F] := 'VERIFY (10)           ';
  CommandName[$35] := 'SYNCHRONIZE CACHE     ';
  CommandName[$42] := 'READ SUB-CHANNEL      ';
  CommandName[$43] := 'READ TOC/PMA/ATIP     ';
  CommandName[$45] := 'PLAY AUDIO (10)       ';
  CommandName[$46] := 'GET CONFIGURATION     ';
  CommandName[$47] := 'PLAY AUDIO MSF        ';
  CommandName[$4A] := 'GET EVENT/STATUS NOTIF';
  CommandName[$4B] := 'PAUSE/RESUME          ';
  CommandName[$4E] := 'STOP PLAY/SCAN        ';
  CommandName[$51] := 'READ DISC INFORMATION ';
  CommandName[$52] := 'READ TRACK INFORMATION';
  CommandName[$53] := 'RESERVE TRACK         ';
  CommandName[$54] := 'SEND OPC INFORMATION  ';
  CommandName[$55] := 'MODE SELECT (10)      ';
  CommandName[$58] := 'REPAIR TRACK          ';
  CommandName[$5A] := 'MODE SENSE (10)       ';
  CommandName[$5B] := 'CLOSE TRACK/SESSION   ';
  CommandName[$5C] := 'READ BUFFER CAPACITY  ';
  CommandName[$5D] := 'SEND CUE SHEET        ';
  CommandName[$A1] := 'BLANK                 ';
  CommandName[$A2] := 'SEND EVENT            ';
  CommandName[$A3] := 'SEND KEY              ';
  CommandName[$A4] := 'REPORT KEY            ';
  CommandName[$A5] := 'PLAY AUDIO (12)       ';
  CommandName[$A6] := 'LOAD/UNLOAD CD/DVD    ';
  CommandName[$A7] := 'SET READ AHEAD        ';
  CommandName[$A8] := 'READ (12)             ';
  CommandName[$AA] := 'WRITE (12)            ';
  CommandName[$AC] := 'GET PERFORMANCE       ';
  CommandName[$AD] := 'READ DVD STRUCTURE    ';
  CommandName[$B6] := 'SET STREAMING         ';
  CommandName[$B9] := 'READ CD MSF           ';
  CommandName[$BA] := 'SCAN                  ';
  CommandName[$BB] := 'SET CD SPEED          ';
  CommandName[$BD] := 'MECHANISM STATUS      ';
  CommandName[$BE] := 'READ CD               ';
  CommandName[$BF] := 'SEND DVD STRUCTURE    ';

End.

