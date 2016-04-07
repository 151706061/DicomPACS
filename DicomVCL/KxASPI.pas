{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}

unit KxASPI;
{$I DEFINES.INC}
interface

uses
  KxSPTI,
  Windows;

const
  SENSE_LEN                 =  24; { Default sense buffer length}
  SRB_DIR_SCSI              = $00; { Direction determined by SCSI}
  SRB_POSTING               = $01; { Enable ASPI posting}
  SRB_ENABLE_RESIDUAL_COUNT = $04; { Enable residual byte count reporting}
  SRB_DIR_IN                = $08; { Transfer from SCSI target to host}
  SRB_DIR_OUT               = $10; { Transfer from host to SCSI target}
  SRB_EVENT_NOTIFY          = $40; { Enable ASPI event notification}
  RESIDUAL_COUNT_SUPPORTED  = $02; { Extended buffer flag}
  MAX_SRB_TIMEOUT           = 108000; { 30 hour maximum timeout in sec}
  DEFAULT_SRB_TIMEOUT       = 108000; { Max timeout by default}
   
{******************************************************************************}
{                             ASPI Command Definitions                         }
{******************************************************************************}

  SC_HA_INQUIRY             = $00; { Host adapter inquiry}
  SC_GET_DEV_TYPE           = $01; { Get device type}
  SC_EXEC_SCSI_CMD          = $02; { Execute SCSI command}
  SC_ABORT_SRB              = $03; { Abort an SRB}
  SC_RESET_DEV              = $04; { SCSI bus device reset}
  SC_SET_HA_PARMS           = $05; { Set HA parameters}
  SC_GET_DISK_INFO          = $06; { Get Disk information}
  SC_RESCAN_SCSI_BUS        = $07; { ReBuild SCSI device map}
  SC_GETSET_TIMEOUTS        = $08; { Get/Set target timeouts}

{******************************************************************************}
{                                  SRB Status                                  }
{******************************************************************************}

  SS_PENDING                = $00; { SRB being processed}
  SS_COMP                   = $01; { SRB completed without error}
  SS_ABORTED                = $02; { SRB aborted}
  SS_ABORT_FAIL             = $03; { Unable to abort SRB}
  SS_ERR                    = $04; { SRB completed with error}

  SS_INVALID_CMD            = $80; { Invalid ASPI command}
  SS_INVALID_HA             = $81; { Invalid host adapter number}
  SS_NO_DEVICE              = $82; { SCSI device not installed}

  SS_INVALID_SRB            = $E0; { Invalid parameter set in SRB}
  SS_OLD_MANAGER            = $E1; { ASPI manager doesn't support Windows}
  SS_BUFFER_ALIGN           = $E1; { Buffer not aligned (replaces OLD_MANAGER in Win32)}
  SS_ILLEGAL_MODE           = $E2; { Unsupported Windows mode}
  SS_NO_ASPI                = $E3; { No ASPI managers resident}
  SS_FAILED_INIT            = $E4; { ASPI for windows failed init}
  SS_ASPI_IS_BUSY           = $E5; { No resources available to execute cmd}
  SS_BUFFER_TO_BIG          = $E6; { Buffer size to big to handle!}
  SS_MISMATCHED_COMPONENTS  = $E7; { The DLLs/EXEs of ASPI don't version check}
  SS_NO_ADAPTERS            = $E8; { No host adapters to manage}
  SS_INSUFFICIENT_RESOURCES = $E9; { Couldn't allocate resources needed to init}
  SS_ASPI_IS_SHUTDOWN       = $EA; { Call came to ASPI after PROCESS_DETACH}
  SS_BAD_INSTALL            = $EB; { The DLL or other components are installed wrong}

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

  DTYPE_DASD                  = $00;   { Disk Device               }
  DTYPE_SEQD                  = $01;   { Tape Device               }
  DTYPE_PRNT                  = $02;   { Printer                   }
  DTYPE_PROC                  = $03;   { Processor                 }
  DTYPE_WORM                  = $04;   { Write-once read-multiple  }
  DTYPE_CROM                  = $05;   { CD-ROM device             }
  DTYPE_CDROM                 = $05;   { CD-ROM device             }
  DTYPE_SCAN                  = $06;   { Scanner device            }
  DTYPE_OPTI                  = $07;   { Optical memory device     }
  DTYPE_JUKE                  = $08;   { Medium Changer device     }
  DTYPE_COMM                  = $09;   { Communications device     }
  DTYPE_RESL                  = $0A;   { Reserved (low)            }
  DTYPE_RESH                  = $1E;   { Reserved (high)           }
  DTYPE_UNKNOWN               = $1F;   { Unknown or no device type }

  SCSI_INQUIRY                = $12;

  DEF_SENSE_LEN               = 16;        { Default Sense Len }

{***************************************************************************}
{                          Request Sense Data Format                        }
{***************************************************************************}
  type TSenseArea = packed record
    ErrorCode,       
    SegmentNum,      
    SenseKey,        
    InfoByte0,       
    InfoByte1,       
    InfoByte2,       
    InfoByte3,
    AddSenLen,       
    ComSpecInf0,      
    ComSpecInf1,       
    ComSpecInf2,        
    ComSpecInf3,        
    AddSenseCode,       
    AddSenQual,         
    FieldRepUCode,      
    SenKeySpec15,       
    SenKeySpec16,       
    SenKeySpec17: Byte; 
    AddSenseBytes: Array[18..$20] of byte;
  end;

{*****************************************************************************}
{                 SRB - HOST ADAPTER INQUIRY - SC_HA_INQUIRY (0)              }
{*****************************************************************************}
type
  TSRB_HAInquiry = packed record
    Command: BYTE;
    Status: BYTE;
    HaId: BYTE;
    Flags: BYTE;
    Hdr_Rsvd: LongInt;
    HA_Count: BYTE;
    HA_SCSI_ID: BYTE;
    HA_ManagerId: Array[0..15] of char;
    HA_Identifier: Array[0..15] of char;
    HA_Unique: Array[0..15] of char;
    HA_Rsvd1: Word;
  end;
{******************************************************************************}
{                    SRB - GET DEVICE TYPE - SC_GET_DEV_TYPE (1)               }
{******************************************************************************}
type
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
    BufPointer: PChar;
    SenseLen: BYTE;
    CDBLen: BYTE;
    HaStat: BYTE;
    TargStat: BYTE;
    PostProc: THandle;
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
    Rsvd1: Array[0..12-1] of BYTE;
    HaStat: BYTE;
    TargStat: BYTE;
    PostProc: Pointer;
    Rsvd2: Array[0..36-1] of BYTE;
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
    Rsvd1: Array[0..9] of BYTE;
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

type
  TDiscInformation = record
    DataLen: Word;
    DiscStatus: Byte;
    FirstTrack: Byte;
    Sessions: Byte;
    FirstTrackOfLastSession: Byte;
    LastTrackOfLastSession: Byte;
    InformationValidity: Byte;
    DiscType: Byte;
    Resvd: array [0..2] of Byte;
    DiscIdentification: array [0..3] of Byte;
    Resvd2: array [12..50] of Byte;
  end;
type
  TTrackInformationBlock = packed record
   DataLength: Word;
   TrackNumber,
   SessionNumber,
   Reserved1,
   TrackMode,
   DataMode,
   Reserved2: Byte;
   TrackStartAddress,
   NextWritableAddress,
   FreeBlocks,
   FixedPacketSize,
   TrackSize,
   LastRecordedAddress: LongWord;
   TrackNumber2,
   SessionNumber2,
   Res3, Res4, Res5, Res6, Res7, Res8: Byte;
end;
type
  TTOCPMATIP0100 = packed record
    DataLength: Word;
    FirstSession, LastSession: Byte;
    Field0: Byte;
    Field1: Byte;
    Field2: Byte;
    Reserved: Byte;
    StMin: Byte;
    StSec: Byte;
    StFrame: Byte;
    Reseved2: Byte;
    EdMin: Byte;
    EdSec: Byte;
    EdFrame: Byte;
    Others: array[0..10] of byte;
  end;
  TModePage05 = packed record
    PageCode,
    PageLen: byte;
    WriteType : Byte;
    TrackMode : Byte;
    DBType : Byte;
    LinkSize: Byte;
    Res6: Byte;
    Host_App_Code: Byte;
    SessionFormat: Byte;
    Res9: Byte;
    PacketSize: LongWord;
    PauseLen: Word;
    MediaCatNumber: array[1..16] of char;
    ISRC: array[1..14] of char;
    sub_header: array[1..4] of char;
    vendor_uniq: array[1..4] of char;
  end;
  TTEST = packed record
    Res1: Byte;
    Res2: Byte;
    Speed: WORD;
  end;
  TModePage2A = packed record   // CD Capabilities
    PageCode: Byte;	      //0
    PageLen: Byte;	      //1
    DiscReadCaps: Byte;   //2
    DiscWriteCaps: Byte;  //3
    AudioPlay: Byte;	    //4
    CDDASupported: Byte;  //5
    Lock: Byte;	          //6
    SepChanVol: Byte;	    //7
    MaxReadSpeed: Word;	  //8-9
    NumVolLevels: Word;   //10-11
    BufferSize:Word;	    //12-13
    CurReadSpeed: Word;	  //14-15
    Reserved16: Byte;     //16
    BCKF: Byte;	          //17
    MaxWriteSpeed: Word;  //18-19
    CurWriteSpeed: Word;  //20-21
    CMRS: WORD;           //22-23
    RES24: BYTE; RES25: BYTE; RES26: BYTE;  //24-26
    RCS: BYTE;            //27
    CWSS: WORD;           //28-29
    WW: Word;             //30-31
    WriteSpeeds:array [0..120] of Ttest;
  end;
  TInquiryData = packed record
    PeripheralData: Byte;
    RMB: Byte;
    Version: Byte;
    Byte3: Byte;
    AdditionalLen: Byte;
    Byte5: Byte;
    Byte6: Byte;
    Byte7: Byte;
    VendorID: array[8..15] of char;
    ProductID: array[16..31] of char;
    ProductRev: array[32..35] of char;
    VendorSpecific: array[36..55] of char;
    Byte56: Byte;
    Reseverd: Byte;
    v1, v2, v3, v4: Word;
    OtherVData: array [0..62] of byte;
    DeviceType: ShortInt;  //PeripheralData
    Qulifier: Byte;
  end;
type
  TTOCData0000 = packed record
    DataLength : Word;
    FirstTrackNumber: Byte;
    LastTrackNumber: Byte;
    Res1, Res2: Byte;
    TrackNumber: Byte;
    Res3: Byte;      
    TrackStartAddress: Cardinal;
    OtherData: array[0..101] of byte;
  end;
  TTOCData0001 = packed record
    DataLength : Word;
    FirstTrackNumber: Byte;
    LastTrackNumber: Byte;
  end;
  PSCSI_ADDRESS = ^SCSI_ADDRESS;
  SCSI_ADDRESS = packed record
    Length: Cardinal;
    PortNumber,
    PathId,
    TargetId,
    Lun: Byte;
  end;

  
type
  TDisc = record
    Capacity: Integer;
    DiscStatus,
    LastSession
    : Byte;
    BackgroundFormat: Byte;
    Eraseable: Boolean;
  end;
var
  ASPILayerName: String;
  TryInternalASPIFirst: Boolean;
  SendASPI32Command: function(LPSRB: Pointer):DWORD; cdecl;
  GetASPI32SupportInfo: function: DWORD; cdecl;
  ASPIDLLLoaded: Boolean  = False;

function _InitializeASPI(InternalFirst: Boolean; AspiPath: String): Boolean;
function _ReInitializeASPI: Boolean;
function _DeInitializeASPI: Boolean;

implementation
var
  ASPIDLLHandle: DWORD = 0;

{******************************************************************************}
{                              _InitializeASPI                                 }
{******************************************************************************}
function _InitializeASPI(InternalFirst: Boolean; AspiPath: String): Boolean;
var
  ErrorMode: DWORD;
begin
  ErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
  if InternalFirst and (SPTIInit <> 0) then
  begin
    @GetASPI32SupportInfo := @__GetASPI32SupportInfo;
    @SendASPI32Command := @__SendASPI32Command;
    ASPIDLLLoaded := True;
    ASPILayerName := 'BMASPI32';
  end;
  if not ASPIDLLLoaded then
  begin
    ASPIDLLHandle := 0;
    try
      if (AspiPath <> '')
        then ASPIDLLHandle := LoadLibrary(pchar(AspiPath));
      if (ASPIDLLHandle = 0)
        then ASPIDLLHandle := LoadLibrary('.\WNASPI32.DLL');
      if ASPIDLLHandle = 0 then
        ASPIDLLHandle := LoadLibrary('WNASPI32.DLL');
    except
      ASPIDLLHandle := 0;
    end;
    if ASPIDLLHandle > 31 then
    begin
      ASPILayerName := 'WNASPI32.DLL';
      ASPIDLLLoaded := True;
      @GetASPI32SupportInfo := GetProcAddress(ASPIDLLHandle, 'GetASPI32SupportInfo');
      @SendASPI32Command := GetProcAddress(ASPIDLLHandle, 'SendASPI32Command');
      Assert(@GetASPI32SupportInfo <> nil);
      Assert(@SendASPI32Command <> nil);
    end
    else
    begin
      (*
      ASPIDLLHandle := LoadLibrary('ASAPI.DLL');
      if ASPIDLLHandle > 31 then
      begin
        ASPILayerName := 'ASAPI.DLL';
        ASPIDLLLoaded := True;
        @GetASPI32SupportInfo := GetProcAddress(ASPIDLLHandle, 'GetASAPI32SupportInfo');
        Assert(@GetASPI32SupportInfo <> nil);
        @SendASPI32Command := GetProcAddress(ASPIDLLHandle, 'SendASAPI32Command');
        Assert(@SendASPI32Command <> nil);
      end;  *)
    end;
    if (not ASPIDLLLoaded) and (SPTIInit <> 0) then
    begin
      @GetASPI32SupportInfo := @__GetASPI32SupportInfo;
      @SendASPI32Command := @__SendASPI32Command;
      ASPIDLLLoaded := True;
      ASPILayerName := 'BMASPI32';
    end;
  end;
  if ASPIDLLLoaded then
    GetASPI32SupportInfo;
  result := ASPIDLLLoaded;
  TryInternalASPIFirst := InternalFirst;
  SetErrorMode(ErrorMode);
end;

function _ReInitializeASPI: Boolean;
begin
  if ASPILayerName = 'BMASPI32' then
  begin
    ASPIDLLLoaded := False;
    SPTIDeInit;
  end
  else
  begin
    _DeInitializeASPI;
  end;
  _InitializeASPI(TryInternalASPIFirst, '');
  result := True;

end;

function _DeInitializeASPI: Boolean;
begin
  result := true;
  if ASPIDLLLoaded and (ASPIDLLHandle <> 0) then
  begin
    ASPIDLLLoaded := False;
    Result := FreeLibrary(ASPIDLLHandle);
    ASPIDLLHandle := 0;
  end;
end;

initialization
  ASPIDLLLoaded := False;

finalization
  if ASPIDLLLoaded and (ASPIDLLHandle <> 0) then
    FreeLibrary(ASPIDLLHandle);
end.

