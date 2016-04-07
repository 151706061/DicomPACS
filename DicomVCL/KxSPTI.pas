{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}

unit KxSPTI;
{$DEFINE ___DEBUGINFO}
{$IFNDEF ___DEBUGINFO}
{$D-}
{$O+}
{$L-}{$Y-}
{$REFERENCEINFO OFF} {DEFINITIONINFO OFF}
{$ENDIF}
{$ALIGN ON}

interface
{$I DEFINES.INC}
uses
  Windows;

const
  SPTI = 'SCSI BY Burner';

var
  tgn: byte = 0;
  CloseFH: Boolean = True;
  inqData: array[0..1024] of AnsiChar = SPTI;

const
  SENSE_LEN = 24; { Default sense buffer length}
  SRB_DIR_SCSI = $00; { Direction determined by SCSI}
  SRB_POSTING = $01; { Enable ASPI posting}
  SRB_ENABLE_RESIDUAL_COUNT = $04; { Enable residual byte count reporting}
  SRB_DIR_IN = $08; { Transfer from SCSI target to host}
  SRB_DIR_OUT = $10; { Transfer from host to SCSI target}
  SRB_EVENT_NOTIFY = $40; { Enable ASPI event notification}
  RESIDUAL_COUNT_SUPPORTED = $02; { Extended buffer flag}
  MAX_SRB_TIMEOUT = 108000; { 30 hour maximum timeout in sec}
  DEFAULT_SRB_TIMEOUT = 108000; { Max timeout by default}

  {******************************************************************************}
  {                             ASPI Command Definitions                         }
  {******************************************************************************}

  SC_HA_INQUIRY = $00; { Host adapter inquiry}
  SC_GET_DEV_TYPE = $01; { Get device type}
  SC_EXEC_SCSI_CMD = $02; { Execute SCSI command}
  SC_ABORT_SRB = $03; { Abort an SRB}
  SC_RESET_DEV = $04; { SCSI bus device reset}
  SC_SET_HA_PARMS = $05; { Set HA parameters}
  SC_GET_DISK_INFO = $06; { Get Disk information}
  SC_RESCAN_SCSI_BUS = $07; { ReBuild SCSI device map}
  SC_GETSET_TIMEOUTS = $08; { Get/Set target timeouts}

  {******************************************************************************}
  {                                  SRB Status                                  }
  {******************************************************************************}

  SS_PENDING = $00; { SRB being processed}
  SS_COMP = $01; { SRB completed without error}
  SS_ABORTED = $02; { SRB aborted}
  SS_ABORT_FAIL = $03; { Unable to abort SRB}
  SS_ERR = $04; { SRB completed with error}

  SS_INVALID_CMD = $80; { Invalid ASPI command}
  SS_INVALID_HA = $81; { Invalid host adapter number}
  SS_NO_DEVICE = $82; { SCSI device not installed}

  SS_INVALID_SRB = $E0; { Invalid parameter set in SRB}
  SS_OLD_MANAGER = $E1; { ASPI manager doesn't support Windows}
  SS_BUFFER_ALIGN = $E1; { Buffer not aligned (replaces OLD_MANAGER in Win32)}
  SS_ILLEGAL_MODE = $E2; { Unsupported Windows mode}
  SS_NO_ASPI = $E3; { No ASPI managers resident}
  SS_FAILED_INIT = $E4; { ASPI for windows failed init}
  SS_ASPI_IS_BUSY = $E5; { No resources available to execute cmd}
  SS_BUFFER_TO_BIG = $E6; { Buffer size to big to handle!}
  SS_MISMATCHED_COMPONENTS = $E7; { The DLLs/EXEs of ASPI don't version check}
  SS_NO_ADAPTERS = $E8; { No host adapters to manage}
  SS_INSUFFICIENT_RESOURCES = $E9; { Couldn't allocate resources needed to init}
  SS_ASPI_IS_SHUTDOWN = $EA; { Call came to ASPI after PROCESS_DETACH}
  SS_BAD_INSTALL = $EB; { The DLL or other components are installed wrong}
  (*
  {******************************************************************************}
  {                              Host Adapter Status                             }
  {******************************************************************************}

    HASTAT_OK                   = $00; { Host adapter did not detect an  error}
    HASTAT_SEL_TO               = $11; { Selection Timeout}
    HASTAT_DO_DU                = $12; { Data overrun data underrun}
    HASTAT_BUS_FREE             = $13; { Unexpected bus free}
    HASTAT_PHASE_ERR            = $14; { Target bus phase sequence  failure}
    HASTAT_TIMEOUT              = $09; { Timed out while SRB was waiting to beprocessed.}
    HASTAT_COMMAND_TIMEOUT      = $0B; { Adapter timed out processing SRB.}
    HASTAT_MESSAGE_REJECT       = $0D; { While processing SRB, the  adapter received a MESSAGE}
    HASTAT_BUS_RESET            = $0E; { A bus reset was detected.}
    HASTAT_PARITY_ERROR         = $00; { A parity error was detected.}
    HASTAT_REQUEST_SENSE_FAILED = $10; { The adapter failed in issuing}
  *)

  DTYPE_DASD = $00; { Disk Device               }
  DTYPE_SEQD = $01; { Tape Device               }
  DTYPE_PRNT = $02; { Printer                   }
  DTYPE_PROC = $03; { Processor                 }
  DTYPE_WORM = $04; { Write-once read-multiple  }
  DTYPE_CROM = $05; { CD-ROM device             }
  DTYPE_CDROM = $05; { CD-ROM device             }
  DTYPE_SCAN = $06; { Scanner device            }
  DTYPE_OPTI = $07; { Optical memory device     }
  DTYPE_JUKE = $08; { Medium Changer device     }
  DTYPE_COMM = $09; { Communications device     }
  DTYPE_RESL = $0A; { Reserved (low)            }
  DTYPE_RESH = $1E; { Reserved (high)           }
  DTYPE_UNKNOWN = $1F; { Unknown or no device type }

  SCSI_INQUIRY = $12;
  (*
    SCG_RECV_DATA               = $0001;	{ DMA direction to Sun }
    SCG_DISRE_ENA               = $0002;	{ enable disconnect/reconnect }
    SCG_SILENT                  = $0004;	{ be silent on errors }
    SCG_CMD_RETRY               = $0008;	{ enable retries }
    SCG_NOPARITY                = $0010;	{ disable parity for this command }
    SC_G0_CDBLEN                = 06;        { Len of Group 0 commands }
    SC_G1_CDBLEN                = 10;        { Len of Group 1 commands }
    SC_G5_CDBLEN                = 12;        { Len of Group 5 commands }
    DEF_SENSE_LEN               = 16;        { Default Sense Len }
    CCS_SENSE_LEN               = 18;        { Sense Len for CCS compatible devices }
  *)
  //***************************************************************************
  //                      %%% Request Sense Data Format %%%
  //***************************************************************************
type
  TSenseArea = packed record
    ErrorCode, // Error Code (70H or 71H)
    SegmentNum, // Number of current segment descriptor
    SenseKey, // Sense Key(See bit definitions too)
    InfoByte0, // Information MSB
    InfoByte1, // Information MID
    InfoByte2, // Information MID
    InfoByte3, // Information LSB
    AddSenLen, // Additional Sense Length
    ComSpecInf0, // Command Specific Information MSB
    ComSpecInf1, // Command Specific Information MID
    ComSpecInf2, // Command Specific Information MID
    ComSpecInf3, // Command Specific Information LSB
    AddSenseCode, // Additional Sense Code
    AddSenQual, // Additional Sense Code Qualifier
    FieldRepUCode, // Field Replaceable Unit Code
    SenKeySpec15, // Sense Key Specific 15th byte
    SenKeySpec16, // Sense Key Specific 16th byte
    SenKeySpec17: Byte; // Sense Key Specific 17th byte
    AddSenseBytes: // Additional Sense Bytes
    array[18..$20] of byte;
  end;

  {*****************************************************************************}
  {                 SRB - HOST ADAPTER INQUIRY - SC_HA_INQUIRY (0)              }
  {*****************************************************************************}
type
  PSRB_HAInquiry = ^TSRB_HAInquiry;
  TSRB_HAInquiry = packed record
    Command: BYTE;
    Status: BYTE;
    HaId: BYTE;
    Flags: BYTE;
    Hdr_Rsvd: LongInt;
    HA_Count: BYTE;
    HA_SCSI_ID: BYTE;
    HA_ManagerId: array[0..15] of AnsiChar;
    HA_Identifier: array[0..15] of AnsiChar;
    HA_Unique: array[0..15] of AnsiChar;
    HA_Rsvd1: Word;
  end;
  {******************************************************************************}
  {                    SRB - GET DEVICE TYPE - SC_GET_DEV_TYPE (1)               }
  {******************************************************************************}
type
  PSRB_GDEVBlock = ^TSRB_GDEVBlock;
  TSRB_GDEVBlock = packed record
    Command: BYTE;
    Status: BYTE;
    HaId: BYTE;
    Flags: BYTE;
    Hdr_Rsvd: LongInt;
    Target: BYTE;
    Lun: BYTE;
    DeviceType: BYTE;
    Rsvd1: BYTE;
  end;
  {*****************************************************************************}
  {                 SRB - EXECUTE SCSI COMMAND - SC_EXEC_SCSI_CMD (2)           }
  {*****************************************************************************}
type
  TSRB_ExecSCSICmd = packed record
    Command: BYTE;
    Status: BYTE;
    HaId: BYTE;
    Flags: BYTE;
    Hdr_Rsvd: LongInt;
    Target: BYTE;
    Lun: BYTE;
    Rsvd1: Word;
    BufLen: LongInt;
    BufPointer: pAnsiChar;
    SenseLen: BYTE;
    CDBLen: BYTE;
    HaStat: BYTE;
    TargStat: BYTE;
    PostProc: Cardinal;
    Rsvd2: array[0..19] of byte;
    CDBCmd: Byte;
    CDBByte: array[1..15] of byte;
    SenseArea: TSenseArea;
  end;

  {******************************************************************************}
  {                       SRB - ABORT AN SRB - SC_ABORT_SRB (3)                  }
  {******************************************************************************}
type
  TSRB_Abort = packed record
    Command: BYTE;
    Status: BYTE;
    HaId: BYTE;
    Flags: BYTE;
    Hdr_Rsvd: LongInt;
    ToAbort: Pointer;
  end;
  {*****************************************************************************}
  {                    SRB - BUS DEVICE RESET - SC_RESET_DEV (4)                }
  {*****************************************************************************}
type
  SRB_BusDeviceReset = packed record
    Command: BYTE;
    Status: BYTE;
    HaId: BYTE;
    Flags: BYTE;
    Hdr_Rsvd: LongInt;
    Target: BYTE;
    Lun: BYTE;
    Rsvd1: array[0..12 - 1] of BYTE;
    HaStat: BYTE;
    TargStat: BYTE;
    PostProc: Pointer;
    Rsvd2: array[0..36 - 1] of BYTE;
  end;
  {******************************************************************************}
  {                SRB - GET DISK INFORMATION - SC_GET_DISK_INFO                 }
  {******************************************************************************}
type
  TSRB_GetDiskInfo = packed record
    Command: BYTE;
    Status: BYTE;
    HaId: BYTE;
    Flags: BYTE;
    Hdr_Rsvd: LongInt;
    Target: BYTE;
    Lun: BYTE;
    DriveFlags: BYTE;
    Int13HDriveInfo: BYTE;
    Heads: BYTE;
    Sectors: BYTE;
    Rsvd1: array[0..9] of BYTE;
  end {SRB_GetDiskInfo};

  {******************************************************************************}
  {                      SRB - RESCAN SCSI BUS(ES) ON SCSIPORT                   }
  {******************************************************************************}

type
  SRB_RescanPort = packed record
    Command: BYTE;
    Status: BYTE;
    HaId: BYTE;
    Flags: BYTE;
    Hdr_Rsvd: LongInt;
  end {RescanPort};

  {******************************************************************************}
  {                         SRB - GET/SET TARGET TIMEOUTS                        }
  {******************************************************************************}
type
  TSRB_GetSetTimeouts = packed record
    Command: BYTE;
    Status: BYTE;
    HaId: BYTE;
    Flags: BYTE;
    Hdr_Rsvd: LongInt;
    Target: BYTE;
    Lun: BYTE;
    Timeout: LongInt;
  end;
  {******************************************************************************}
  {                 ASPIBUFF - Structure For Controllng I/O Buffers              }
  {******************************************************************************}

type
  tag_ASPI32BUFF = packed record
    AB_BufPointer: Pointer;
    AB_BufLen: LongInt;
    AB_ZeroFill: LongInt;
    AB_Reserved: LongInt;
  end;
  PSRB_EXECSCSICMD = ^TSRB_EXECSCSICMD;
const
  SCSI_IOCTL_DATA_OUT = 0;
  SCSI_IOCTL_DATA_IN = 1;
  SCSI_IOCTL_DATA_UNSPECIFIED = 2;
  IOCTL_SCSI_PASS_THROUGH_DIRECT = 315412;
  IOCTL_SCSI_GET_ADDRESS = 266264;
type
  {$A+}
  TSCSIDRIVE = record
    HA,
      Target,
      LUN: Byte;
    Drive: AnsiChar;
    Used: Boolean;
    DeviceHandle: THANDLE;
    inqData: array[0..64] of AnsiChar;
  end;
  TSCSIDRIVES = record
    numAdapters: Byte;
    drive: array[0..26] of TSCSIDRIVE;
  end;

  PSCSI_PASS_THROUGH = ^SCSI_PASS_THROUGH;

  SCSI_PASS_THROUGH = record
    Length: WORD;
    ScsiStatus,
      PathId, TargetId, Lun,
      CdbLength, SenseInfoLength,
      DataIn: Byte;
    DataTransferLength,
      TimeOutValue: Cardinal;
    DataBufferOffset: pAnsiChar;
    SenseInfoOffset: Cardinal;
    Cdb: array[0..15] of byte;
  end;

  SCSI_PASS_THROUGH_DIRECT = record
    Length: WORD;
    ScsiStatus,
      PathId, TargetId, Lun,
      CdbLength, SenseInfoLength,
      DataIn: Byte;
    DataTransferLength,
      TimeOutValue: Cardinal;
    DataBuffer: pAnsiChar;
    SenseInfoOffset: Cardinal;
    Cdb: array[0..15] of byte;
  end;

  PSCSI_PASS_THROUGH_DIRECT_WITH_BUFFER = ^SCSI_PASS_THROUGH_DIRECT_WITH_BUFFER;
  SCSI_PASS_THROUGH_DIRECT_WITH_BUFFER = record
    spt: SCSI_PASS_THROUGH_DIRECT;
    Filler: Cardinal;
    ucSenseBuf: array[0..31] of byte;
  end;

  PSCSI_ADDRESS = ^SCSI_ADDRESS;
  SCSI_ADDRESS = packed record
    Length: Cardinal;
    PortNumber,
      PathId,
      TargetId,
      Lun: Byte;
  end;

var
  ScsiDrives: TScsiDrives;
  SPTIAvailable: Boolean = False;
function __SendASPI32Command(lpsrb: PSRB_EXECSCSICMD): Cardinal; cdecl;
function __GetASPI32SupportInfo: Cardinal; cdecl;
function SPTIInit: Byte;
function SPTIDeInit: Integer;
function GetDriveLetterBMASPI(h, t, l: Byte): AnsiChar;

implementation

function GetDriveLetterBMASPI(h, t, l: Byte): AnsiChar;
var
  i: Integer;
begin
  for i := 2 to 26 do
  begin
    if (ScsiDrives.Drive[i].Ha = h) and (ScsiDrives.Drive[i].Target = t) and (ScsiDrives.Drive[i].LUN = l) then
    begin
      result := AnsiChar(Chr(Ord(ScsiDrives.Drive[i].Drive) + 65));
      exit;
    end;
  end;
  result := #127;
end;

const
  s = 0;

function GetFileHandle(i: byte): Cardinal;
var
  buf: string;
begin
  buf := '\\.\' + AnsiChar(i + 65) + ':'#0;
  result := CreateFile(@buf[1], GENERIC_WRITE or GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if (result = INVALID_HANDLE_VALUE) then
    result := CreateFile(@buf[1], GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);

end;

//*********************************************************************************************************************

procedure GetDriveInformation(i: byte; var pDrive: TSCSIDRIVE);
var
  fh: THandle;
  buf: array[0..1023] of AnsiChar;
  pswb: PSCSI_PASS_THROUGH_DIRECT_WITH_BUFFER;
  pscsiAddr: PSCSI_ADDRESS;
  Length, returned: Cardinal;
  status: Boolean;
begin
  fh := GetFileHandle(i);
  if (fh = INVALID_HANDLE_VALUE) then
    Exit;
  ZeroMemory(@buf, 1024);
  ZeroMemory(@inqData, SizeOf(inqData));
  pswb := @buf;
  pswb.spt.Length := SizeOf(SCSI_PASS_THROUGH);
  pswb.spt.CdbLength := 6;
  pswb.spt.SenseInfoLength := 24;
  pswb.spt.DataIn := SCSI_IOCTL_DATA_IN;
  pswb.spt.DataTransferLength := 96;
  pswb.spt.TimeOutValue := 120;
  pswb.spt.DataBuffer := @inqData;
  pswb.spt.SenseInfoOffset := 48;
  pswb.spt.Cdb[0] := SCSI_INQUIRY;
  pswb.spt.Cdb[4] := 96;

  Length := SizeOf(SCSI_PASS_THROUGH_DIRECT_WITH_BUFFER);
  status := DeviceIoControl(fh, IOCTL_SCSI_PASS_THROUGH_DIRECT, pswb, Length, pswb, Length, returned, nil);
  if (not status) then
  begin
    CloseHandle(fh);
    Exit;
  end;

  Move(inqData, pDrive.inqData, 40);
  FillChar(buf, SizeOf(buf), 0);
  pscsiAddr := @buf;
  pscsiAddr.Length := SizeOf(SCSI_ADDRESS);
  if (DeviceIoControl(fh, IOCTL_SCSI_GET_ADDRESS, nil, 0, pscsiAddr, SizeOf(SCSI_ADDRESS), returned, nil)) then
  begin
    pDrive.Used := True;
    pDrive.ha := pscsiAddr.PortNumber;
    pDrive.Target := pscsiAddr.TargetId;
    pDrive.LUN := pscsiAddr.LUN;
    pDrive.Drive := AnsiChar(Chr(i));
    pDrive.DeviceHandle := INVALID_HANDLE_VALUE;
  end
  else
  begin
    pDrive.Used := True;
    pDrive.ha := 0;
    pDrive.Target := tgn;
    pDrive.LUN := 250;
    pDrive.Drive := AnsiChar(Chr(i));
    pDrive.DeviceHandle := INVALID_HANDLE_VALUE;
    inc(tgn);
  end;
  CloseHandle(fh);

end;

function NtHandleHaInquiry(xpsrb: Pointer): DWord;
var
  lpsrb: PSRB_HAInquiry;
begin
  lpsrb := xpsrb;
  lpsrb.HA_Count := ScsiDrives.numAdapters;
  if (lpsrb.HaId >= ScsiDrives.numAdapters) then
  begin
    lpsrb.status := SS_INVALID_HA;
    result := SS_INVALID_HA;
    Exit;
  end;
  lpsrb.HA_SCSI_ID := 7;
  lpsrb.HA_ManagerId := SPTI;
  lpsrb.HA_Identifier := 'SPTI  '#0#0#0#0#0#0#0#0#0;
  lpsrb.HA_Identifier[5] := AnsiChar($30 + lpsrb.HaId);
  FillChar(lpsrb.HA_Unique, 13, 0);
  lpsrb.HA_Unique[0] := #7; // buffer alignment
  lpsrb.HA_Unique[3] := #8; // scsi targets
  lpsrb.HA_Unique[4] := #00;
  lpsrb.HA_Unique[5] := #00;
  lpsrb.HA_Unique[6] := #$FF;
  lpsrb.status := SS_COMP;
  result := SS_COMP;
end;
//*************************************************************************************************

function GetDeviceIndex(ha, tgt, LUN: byte): byte;
var
  i: byte;
  lpd: TSCSIDRIVE;
begin
  for i := 2 to 26 do
  begin
    if (ScsiDrives.Drive[i].Used) then
    begin
      lpd := ScsiDrives.Drive[i];
      if ((lpd.ha = ha) and (lpd.Target = tgt) and (lpd.LUN = LUN)) then
      begin
        result := i;
        Exit;
      end;
    end
  end;
  result := 0;
end;
//*************************************************************************************************

function GetDeviceType(xlpsrb: Pointer): DWord;
var
  lpsrb: PSRB_GDEVBlock;
begin
  lpsrb := xlpsrb;
  lpsrb.status := SS_NO_DEVICE;
  if (GetDeviceIndex(lpsrb.HaId, lpsrb.Target, lpsrb.LUN) <> 0) then
    lpsrb.status := SS_COMP;
  if (lpsrb.status = SS_COMP) then
    lpsrb.DeviceType := DTYPE_CDROM
  else
    lpsrb.DeviceType := DTYPE_UNKNOWN;

  result := lpsrb.status;
end;
//*******************************************************************************************************

function SendASPI32Command(lpsrb: PSRB_EXECSCSICMD; Again: Boolean): DWord;
var
  status: Boolean;
  swb: SCSI_PASS_THROUGH_DIRECT_WITH_BUFFER;
  Length, returned: Cardinal;
  index: byte;
label
  ExecCommand;
begin
  if (lpsrb = nil) then
  begin
    result := SS_ERR;
    Exit;
  end;

  case lpsrb.Command of
    SC_EXEC_SCSI_CMD:
      goto ExecCommand;

    SC_HA_INQUIRY:
      begin
        result := NtHandleHaInquiry(lpsrb);
        Exit;
      end;

    SC_GET_DEV_TYPE:
      begin
        result := GetDeviceType(lpsrb);
        Exit;
      end;

    SC_GET_DISK_INFO:
      begin
        //result := GetDeviceType( lpsrb );
        lpsrb.status := $0;
        result := $4;
        Exit;
      end;

  else
    begin
      lpsrb.status := SS_ERR;
      result := SS_ERR;
      Exit;
    end;
  end;

  ExecCommand:
  index := GetDeviceIndex(lpsrb.HaId, lpsrb.Target, lpsrb.LUN);
  if (index = 0) then
  begin
    lpsrb.status := SS_NO_DEVICE;
    result := SS_NO_DEVICE;
    Exit;
  end;

  if (lpsrb.CDBCmd = SCSI_INQUIRY) then
  begin
    if (lpsrb.HaId >= ScsiDrives.numAdapters) then
    begin
      lpsrb.status := SS_INVALID_HA;
      result := SS_INVALID_HA;
      Exit;
    end;
    lpsrb.status := SS_COMP;
    Move(ScsiDrives.Drive[index].inqData, lpsrb.BufPointer[0], 36);
    result := SS_COMP;
    Exit;
  end;

  if (ScsiDrives.Drive[index].DeviceHandle = INVALID_HANDLE_VALUE) then
    ScsiDrives.Drive[index].DeviceHandle := GetFileHandle(Ord(ScsiDrives.Drive[index].Drive));

  FillChar(swb, SizeOf(swb), 0);
  if (lpsrb.Flags and SRB_DIR_IN <> 0) then
    swb.spt.DataIn := SCSI_IOCTL_DATA_IN
  else
    if (lpsrb.Flags and SRB_DIR_OUT <> 0) then
    swb.spt.DataIn := SCSI_IOCTL_DATA_OUT
  else
    swb.spt.DataIn := SCSI_IOCTL_DATA_UNSPECIFIED;

  swb.spt.Length := SizeOf(SCSI_PASS_THROUGH_DIRECT);
  swb.spt.CdbLength := lpsrb.CDBLen;
  swb.spt.SenseInfoLength := lpsrb.SenseLen;
  swb.spt.DataTransferLength := lpsrb.BufLen;
  swb.spt.TimeOutValue := 120;
  swb.spt.DataBuffer := lpsrb.BufPointer;
  swb.spt.SenseInfoOffset := 48;
  Move(lpsrb.CDBCmd, swb.spt.Cdb, lpsrb.CDBLen);
  Length := SizeOf(swb);
  status := DeviceIoControl(ScsiDrives.Drive[index].DeviceHandle, IOCTL_SCSI_PASS_THROUGH_DIRECT, @swb, Length, @swb, Length, returned, nil);
  if (swb.spt.ScsiStatus = 0) and status then
    lpsrb.status := SS_COMP
  else
  begin
    lpsrb.status := SS_ERR;
    Move(swb.ucSenseBuf, lpsrb.SenseArea, swb.spt.SenseInfoLength);
    lpsrb.TargStat := swb.spt.ScsiStatus;
  end;
  if CloseFH and (ScsiDrives.Drive[index].DeviceHandle <> INVALID_HANDLE_VALUE) then
  begin
    if CloseHandle(ScsiDrives.Drive[index].DeviceHandle) then
      ScsiDrives.Drive[index].DeviceHandle := INVALID_HANDLE_VALUE;
  end;
  result := lpsrb.status;
end;

function __SendASPI32Command(lpsrb: PSRB_EXECSCSICMD): DWord;
begin
  result := SendASPI32Command(lpsrb, false);
end;

//******************************************************************

function __GetASPI32SupportInfo: DWord;
begin
  if (ScsiDrives.numAdapters = 0) then
    result := (MAKEWORD(0, SS_NO_ADAPTERS))
  else
    result := (MAKEWORD(ScsiDrives.numAdapters, SS_COMP));
end;

function SPTIGetNumAdapters: byte;
var
  i: WORD;
  numAdapters: byte;
begin
  numAdapters := 0;
  for i := 1 to 26 do
  begin
    if numAdapters < ScsiDrives.Drive[i].ha then
      numAdapters := ScsiDrives.Drive[i].ha;
  end;
  inc(numAdapters);
  result := numAdapters;
  Exit;
end;

function SPTIInit: byte;
var
  i: byte;
  buf: string;
  uDriveType: byte;
  retVal: byte;

begin
  if (SPTIAvailable) then
  begin
    result := 0;
    Exit;
  end;
  retVal := 0;
  tgn := 0;
  FillChar(ScsiDrives, SizeOf(ScsiDrives), 0);
  for i := 0 to 26 do
    ScsiDrives.Drive[i].DeviceHandle := INVALID_HANDLE_VALUE;

  for i := 2 to 26 do
  begin
    buf := AnsiChar(65 + i) + ':\';
    uDriveType := GetDriveType(@buf[1]);
    if (uDriveType = DRIVE_CDROM) {or ( uDriveType = DRIVE_FIXED )} then
    begin
      GetDriveInformation(i, ScsiDrives.Drive[i]);
      if (ScsiDrives.Drive[i].Used) then
        inc(retVal);
    end
    else
      ScsiDrives.Drive[i].Target := 120;
  end;
  ScsiDrives.numAdapters := SPTIGetNumAdapters;
  if tgn <> 0 then
  begin
    for i := 2 to 26 do
    begin
      if (ScsiDrives.Drive[i].Used) then
        if ScsiDrives.Drive[i].LUN = 250 then
        begin
          ScsiDrives.Drive[i].LUN := 0;
          ScsiDrives.Drive[i].ha := ScsiDrives.numAdapters;
        end;
    end;
    ScsiDrives.numAdapters := SPTIGetNumAdapters;
  end;

  SPTIAvailable := True;

  result := retVal;
end;

function SPTIDeInit: Integer;
var
  i: Integer;
begin
  if (not SPTIAvailable) then
  begin
    result := 0;
    Exit;
  end;
  for i := 2 to 26 do
    if (ScsiDrives.Drive[i].Used) then
      if ScsiDrives.Drive[i].DeviceHandle <> INVALID_HANDLE_VALUE then
        CloseHandle(ScsiDrives.Drive[i].DeviceHandle);

  ScsiDrives.numAdapters := SPTIGetNumAdapters();

  FillChar(ScsiDrives, SizeOf(ScsiDrives), 0);
  SPTIAvailable := false;
  result := -1;
end;

initialization
  SPTIAvailable := false;

finalization
  if SPTIAvailable then
    SPTIDeInit;

end.


