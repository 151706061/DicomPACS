{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
{$DEFINE ASM8086}

////////////////////////////////////////////////////////////////////////////////
{$IFDEF VER90}
{$DEFINE VER100}
{$ENDIF}
{$IFDEF VER105}
{$DEFINE VER100}
{$ENDIF}

unit KXString;

{$WARNINGS OFF}
interface

uses
  {$IFNDEF LINUX}
  Windows,
  {$ENDIF}
  Classes,
  SyncObjs,
  SysUtils,
  DCM_log;

const
  DICOM_RELEASE_DATE = '2008-11-15'; {YYYY-MM-DD}

  ///////////////////////////////////////////////////////////////////////////////
  // Brain Patchwork - Just so you can verify which release you have at run-time.
  ///////////////////////////////////////////////////////////////////////////////
type
  TKXCritical = class(TObject)
  private
    {$IFDEF VER100}
    Synchronizer: TCriticalSection;
    {$ELSE}
    // Borland has screwed the pooch on TMultiReadExclusiveWriteSynchronizer
    // so bad that we will not support it!
    Synchronizer: TCriticalSection; // TMultiReadExclusiveWriteSynchronizer;
    {$ENDIF}
  public
    constructor Create;
    destructor Destroy; override;
    procedure StartingRead;
    procedure FinishedRead;
    procedure StartingWrite;
    procedure FinishedWrite;
  end;
  {$IFDEF OBJECTS_ONLY}
  TKXComponent = class(TObject)
    {$ELSE}
  TKXComponent = class(TComponent)
    {$ENDIF}
  private
  public
    MyCriticalSection: TKXCritical;
    constructor Create(AOwner: TComponent);
    {$IFNDEF OBJECTS_ONLY} override;
    {$ENDIF}
    destructor Destroy; override;
  published

  end;

  ///////////////////////////////////////////////////////////////////////////////
  // Routines to centralize "Windows" calls
  ///////////////////////////////////////////////////////////////////////////////
  {$IFDEF LINUX}
type
  DWord = LongWord;
  TThreadPriority = (tpIdle, tpLowest, tpLower, tpNormal, tpHigher, tpHighest, pTimeCritical);
  {$ELSE}
type
  PInteger = Windows.PInteger;
  //  DWORD = Windows.DWord;
  {$ENDIF}

  // LINUX:
function LocalTimeZoneBias: Integer;
// WINDOWS:
procedure ProcessWindowsMessageQueue;
function HiByteOfWord(const W: Word): Byte;
function MakeBytesToWord(const A, B: Byte): Word;
function WindowsWriteFile(hFile: THandle;
  const Buffer; nNumberOfBytesToWrite: DWORD;
  var lpNumberOfBytesWritten: DWORD): Boolean;
procedure ShowMessageWindow(const Caption, Message: AnsiString);
procedure DoSleepEX(const Interval: DWord);
{$IFNDEF LINUX}
function GetRegistryString(const Key: HKey; const SubKey: AnsiString): AnsiString;
function SetRegistryString(const Key: HKey; SubKey, Value: AnsiString): Boolean;
function RegistryStringGet(const Key: HKey; SubKey: AnsiString): AnsiString;
function RegistryStringSet(const Key: HKey; SubKey, Value: AnsiString): Boolean;
function LaunchWebBrowser(const URL: AnsiString; const WindowState: Integer): Boolean;
{$ENDIF}
{$IFNDEF VER90}
function MakeUUID: AnsiString;
function RawUUID: AnsiString;
function MakeUUIDPacked: AnsiString;
{$ENDIF}

///////////////////////////////////////////////////////////////////////////////
// Numeric Routines
///////////////////////////////////////////////////////////////////////////////
function IsCharAlphaNumeric(const c: ansichar): Boolean;
function IsCharAlpha(const c: AnsiChar): Boolean;
function IsNumeric(const c: Ansichar): Boolean;
function isNumericString(const S: Ansistring): Boolean;
function Min(const I1, I2: Integer): Integer;
function Max(const I1, I2: Integer): Integer;
function StringToInteger(const S: AnsiString): Integer;
procedure SwapMove(Source: Word; var Dest);
function IntToCommaStr(const Number: Integer): AnsiString;
function BinaryToString(const Number: Byte): AnsiString;
function StringToBinary(S: AnsiString): Byte;
function LRot16(X: Word; c: longint): Word;
function RRot16(X: Word; c: longint): Word;
function LRot32(X: DWord; c: longint): DWord;
function RRot32(X: DWord; c: longint): DWord;
function SwapDWord(X: DWord): DWord;
procedure DivMod(Dividend: Integer; Divisor: Word; var Result, Remainder: Word);

///////////////////////////////////////////////////////////////////////////////
// AnsiString Routines
///////////////////////////////////////////////////////////////////////////////
function QuickPos(const aFindString, aSourceString: AnsiString): integer;
function CharPos(const C: AnsiChar; const aSource: Ansistring): Integer;
function Fetch(var S: AnsiString; const Sub: AnsiString; const IgnoreCase: Boolean): AnsiString;
function FetchByChar(var S: Ansistring; const Sub: AnsiChar; const IgnoreCase: Boolean): AnsiString;
function Uppercase(const S: Ansistring): AnsiString;
function Lowercase(const S: Ansistring): AnsiString;
function ProperCase(const S: Ansistring): AnsiString;
function Trim(const S: AnsiString): AnsiString;
function NoCRLF(const S: AnsiString): AnsiString;
function NoAngleBrackets(const S: AnsiString): AnsiString;
function InStrArray(const SearchStr: AnsiString; const KnownCommands: array of AnsiString): Integer;
procedure InverseString(var S: AnsiString; Count: Integer);
function HexDump(const S: AnsiString): AnsiString;
function ReplaceChar(const Source: AnsiString; const OldChar, NewChar: AnsiChar): AnsiString;
function ExtractLeft(const aSourceString: AnsiString; const Size: Integer): AnsiString;
function ExtractRight(const aSourceString: AnsiString; const Size: Integer): AnsiString;
function ExtractWordAt(const Text: AnsiString; Position: Integer): AnsiString;
function LeftJustify(const S: AnsiString; const MaxLength: Integer): AnsiString;
function RightJustify(const S: AnsiString; const MaxLength: Integer): AnsiString;
function CleanChar(const InChar: AnsiChar): AnsiChar;
function CleanStr(const InStr: Ansistring): Ansistring;
function PosLastChar(const Ch: AnsiChar; const S: AnsiString): Integer;
function AsciiToOem(const ax: AnsiString): AnsiString;
function OemToAscii(const ax: AnsiString): AnsiString;
function WordCount(const S: AnsiString): Integer;
function CRC32ByChar(const Ch: Char; const starting_crc: LONGINT): LONGINT;
function CRC32ByString(const S: AnsiString; const starting_crc: LONGINT): LONGINT;
function CRC16ByChar(const Ch: Char; const starting_crc: word): word;
function CRC16ByString(const S: AnsiString; const starting_crc: word): word;
function CRCARCByChar(const Ch: Char; const starting_crc: word): word;
function CRCARCByString(const S: AnsiString; const starting_crc: word): word;
procedure SetLongBit(var L: LongInt; const Bit: Byte; const Setting: Boolean);
function GetLongBit(const L: LongInt; const Bit: Byte): Boolean;
procedure SetWordBit(var L: Word; const Bit: Byte; const Setting: Boolean);
function GetWordBit(const L: Word; const Bit: Byte): Boolean;
procedure SetByteBit(var L: Byte; const Bit: Byte; const Setting: Boolean);
function GetByteBit(const L: Byte; const Bit: Byte): Boolean;
function Replicate(const Source: AnsiString; NumberOfTimes: Integer): AnsiString;
function IsWildCard(const Source: AnsiString): Boolean;
function PCharLen(Str: PChar): integer;
function WildCompare(LookingFor, SourceStr: AnsiString): Boolean;
function SizeStamp(CPS: Integer): AnsiString;

///////////////////////////////////////////////////////////////////////////////
// Internet Routines
///////////////////////////////////////////////////////////////////////////////
function GetIndex(const c: Ansichar): Integer;
function Base64ToString(const S: Ansistring): Ansistring;
function StringToBase64(const S1: Ansistring): Ansistring;
function FixDottedIP(const S: AnsiString): AnsiString;
function IPStringFormated(S: AnsiString): AnsiString;
function IPAddressFormatted(const I1, I2, I3, I4: Integer): AnsiString;
function EscapeDecode(const S: AnsiString): AnsiString;
function EscapeEncode(const S: AnsiString): AnsiString;
function EncodeDomain(S: AnsiString): AnsiString;
function EncodeAddress(S: AnsiString): AnsiString;
function DecodeDomain(S: AnsiString): AnsiString;
function GetActualEmailAddress(Parm, Command: AnsiString): AnsiString;

///////////////////////////////////////////////////////////////////////////////
// Date and/or Time Routines
///////////////////////////////////////////////////////////////////////////////
function TimeZone: AnsiString;
function TimeZoneBias: Ansistring;
function ShortTimeZone: Ansistring;
function DateTimeToGMTRFC822(const DT: TDateTime): AnsiString;
function DateTimeToGMTRFC850(const DT: TDateTime): AnsiString;
function DateTimeToRFC850(const DT: TDateTime): AnsiString;
function DateTimeToRFC850Bias(const DT: TDateTime): AnsiString;
function RFCToDateTime(S: Ansistring): TDateTime;
procedure Unpacktime(const P: Longint; var DT: TDatetime);
procedure Packtime(var DT: TDatetime; var P: Longint);
function GetDosDate: LongInt;
function GetDOW: Word;
function TimeOut(const MyTime: Comp): Boolean;
function TimeCounter: Comp;
function IsLeapYear(const Year: Word): Boolean;
function DateTimeToGMT(const DT: TDateTime): TDateTime;
function DateTimeToLocal(const DT: TDateTime): TDateTime;
function IsTimeAM(const DT: TDateTime): Boolean;
function IsTimePM(const DT: TDateTime): Boolean;
function IsTimeNoon(const DT: TDateTime): Boolean;
function IsTimeMidnight(const DT: TDateTime): Boolean;
function DaysThisMonth(const DT: TDateTime): Integer;
function DaysLeftThisMonth(const DT: TDateTime): Integer;
function DayOfTheYear(const DT: TDateTime): Integer;
function DaysLeftThisYear(const DT: TDateTime): Integer;

///////////////////////////////////////////////////////////////////////////////
// File/Disk Routines
///////////////////////////////////////////////////////////////////////////////
function AddBackSlash(const S: AnsiString): AnsiString;
function NoBackSlash(const S: AnsiString): AnsiString;
function ToOSSlashes(const S: AnsiString): AnsiString;
function ToUnixSlashes(const S: AnsiString): AnsiString;
function ToDOSSlashes(const S: AnsiString): AnsiString;
function ChangeDir(const S, RP: AnsiString): AnsiString;

{$IFDEF VER100}
type
  TReplaceFlags = set of (rfReplaceAll, rfIgnoreCase);

function StringReplace(const S, OldPattern, NewPattern: AnsiString;
  Flags: TReplaceFlags): AnsiString;
procedure FreeAndNil(var Obj);
{$ELSE}
{$ENDIF}
{$IFDEF LINUX}
function CoCreateGuid(var GUID: TGUID): HResult;
{$ELSE}
{$IFDEF VER90}
function CoCreateGuid(var guid: Pointer): HResult; stdcall;
{$ELSE}
function CoCreateGuid(var guid: TGUID): HResult; stdcall;
{$ENDIF}
{$ENDIF}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
type
  CharSet = set of Char;

function Center(S: AnsiString; MaxWidth: Integer): AnsiString;
function LeftJustifyCh(const S: AnsiString; const Ch: Char; const MaxLength: Integer): AnsiString;
function RightJustifyCh(const S: AnsiString; const Ch: Char; const MaxLength: Integer): AnsiString;
function EncodeTabs(S: AnsiString; TabSize: Byte): AnsiString;
function DecodeTabs(S: AnsiString; TabSize: Byte): AnsiString;
function Filter(S: AnsiString; CS: CharSet): AnsiString;
function SoundEx(S: AnsiString): AnsiString;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function GetUserName: AnsiString;
function GetComputerName: AnsiString;
function GetAbsoluteFileName(CurrentDir, RelativeName: AnsiString): AnsiString;
function GetTempDirectory: AnsiString;
function GetTempFile(const ThreeLetterPrefix: AnsiString): AnsiString;
function ConvertBase64ToBitmap(AStr: AnsiString): TBitmap;

implementation

{$IFDEF LINUX}
uses
  Libc,
  QForms,
  QDialogs;
{$ELSE}
uses
  Registry; {to avoid Win2K security issue!}
{$ENDIF}

const
  Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
  AlphabetLength = 64;
  {$IFDEF VER100}
  TIME_ZONE_ID_STANDARD = 1;
  TIME_ZONE_ID_DAYLIGHT = 2;
  {$ENDIF}
  {$IFNDEF VER90}
  ole32 = 'ole32.dll';
  {$ENDIF}
  crc_32_tab: array[0..255] of LONGINT = (
    $00000000, $77073096, $EE0E612C, $990951BA, $076DC419, $706AF48F, $E963A535, $9E6495A3,
    $0EDB8832, $79DCB8A4, $E0D5E91E, $97D2D988, $09B64C2B, $7EB17CBD, $E7B82D07, $90BF1D91,
    $1DB71064, $6AB020F2, $F3B97148, $84BE41DE, $1ADAD47D, $6DDDE4EB, $F4D4B551, $83D385C7,
    $136C9856, $646BA8C0, $FD62F97A, $8A65C9EC, $14015C4F, $63066CD9, $FA0F3D63, $8D080DF5,
    $3B6E20C8, $4C69105E, $D56041E4, $A2677172, $3C03E4D1, $4B04D447, $D20D85FD, $A50AB56B,
    $35B5A8FA, $42B2986C, $DBBBC9D6, $ACBCF940, $32D86CE3, $45DF5C75, $DCD60DCF, $ABD13D59,
    $26D930AC, $51DE003A, $C8D75180, $BFD06116, $21B4F4B5, $56B3C423, $CFBA9599, $B8BDA50F,
    $2802B89E, $5F058808, $C60CD9B2, $B10BE924, $2F6F7C87, $58684C11, $C1611DAB, $B6662D3D,
    $76DC4190, $01DB7106, $98D220BC, $EFD5102A, $71B18589, $06B6B51F, $9FBFE4A5, $E8B8D433,
    $7807C9A2, $0F00F934, $9609A88E, $E10E9818, $7F6A0DBB, $086D3D2D, $91646C97, $E6635C01,
    $6B6B51F4, $1C6C6162, $856530D8, $F262004E, $6C0695ED, $1B01A57B, $8208F4C1, $F50FC457,
    $65B0D9C6, $12B7E950, $8BBEB8EA, $FCB9887C, $62DD1DDF, $15DA2D49, $8CD37CF3, $FBD44C65,
    $4DB26158, $3AB551CE, $A3BC0074, $D4BB30E2, $4ADFA541, $3DD895D7, $A4D1C46D, $D3D6F4FB,
    $4369E96A, $346ED9FC, $AD678846, $DA60B8D0, $44042D73, $33031DE5, $AA0A4C5F, $DD0D7CC9,
    $5005713C, $270241AA, $BE0B1010, $C90C2086, $5768B525, $206F85B3, $B966D409, $CE61E49F,
    $5EDEF90E, $29D9C998, $B0D09822, $C7D7A8B4, $59B33D17, $2EB40D81, $B7BD5C3B, $C0BA6CAD,
    $EDB88320, $9ABFB3B6, $03B6E20C, $74B1D29A, $EAD54739, $9DD277AF, $04DB2615, $73DC1683,
    $E3630B12, $94643B84, $0D6D6A3E, $7A6A5AA8, $E40ECF0B, $9309FF9D, $0A00AE27, $7D079EB1,
    $F00F9344, $8708A3D2, $1E01F268, $6906C2FE, $F762575D, $806567CB, $196C3671, $6E6B06E7,
    $FED41B76, $89D32BE0, $10DA7A5A, $67DD4ACC, $F9B9DF6F, $8EBEEFF9, $17B7BE43, $60B08ED5,
    $D6D6A3E8, $A1D1937E, $38D8C2C4, $4FDFF252, $D1BB67F1, $A6BC5767, $3FB506DD, $48B2364B,
    $D80D2BDA, $AF0A1B4C, $36034AF6, $41047A60, $DF60EFC3, $A867DF55, $316E8EEF, $4669BE79,
    $CB61B38C, $BC66831A, $256FD2A0, $5268E236, $CC0C7795, $BB0B4703, $220216B9, $5505262F,
    $C5BA3BBE, $B2BD0B28, $2BB45A92, $5CB36A04, $C2D7FFA7, $B5D0CF31, $2CD99E8B, $5BDEAE1D,
    $9B64C2B0, $EC63F226, $756AA39C, $026D930A, $9C0906A9, $EB0E363F, $72076785, $05005713,
    $95BF4A82, $E2B87A14, $7BB12BAE, $0CB61B38, $92D28E9B, $E5D5BE0D, $7CDCEFB7, $0BDBDF21,
    $86D3D2D4, $F1D4E242, $68DDB3F8, $1FDA836E, $81BE16CD, $F6B9265B, $6FB077E1, $18B74777,
    $88085AE6, $FF0F6A70, $66063BCA, $11010B5C, $8F659EFF, $F862AE69, $616BFFD3, $166CCF45,
    $A00AE278, $D70DD2EE, $4E048354, $3903B3C2, $A7672661, $D06016F7, $4969474D, $3E6E77DB,
    $AED16A4A, $D9D65ADC, $40DF0B66, $37D83BF0, $A9BCAE53, $DEBB9EC5, $47B2CF7F, $30B5FFE9,
    $BDBDF21C, $CABAC28A, $53B39330, $24B4A3A6, $BAD03605, $CDD70693, $54DE5729, $23D967BF,
    $B3667A2E, $C4614AB8, $5D681B02, $2A6F2B94, $B40BBE37, $C30C8EA1, $5A05DF1B, $2D02EF8D);
  crc_arc_tab: array[0..$FF] of Word =
  ($00000, $0C0C1, $0C181, $00140, $0C301, $003C0, $00280, $0C241,
    $0C601, $006C0, $00780, $0C741, $00500, $0C5C1, $0C481, $00440,
    $0CC01, $00CC0, $00D80, $0CD41, $00F00, $0CFC1, $0CE81, $00E40,
    $00A00, $0CAC1, $0CB81, $00B40, $0C901, $009C0, $00880, $0C841,
    $0D801, $018C0, $01980, $0D941, $01B00, $0DBC1, $0DA81, $01A40,
    $01E00, $0DEC1, $0DF81, $01F40, $0DD01, $01DC0, $01C80, $0DC41,
    $01400, $0D4C1, $0D581, $01540, $0D701, $017C0, $01680, $0D641,
    $0D201, $012C0, $01380, $0D341, $01100, $0D1C1, $0D081, $01040,
    $0F001, $030C0, $03180, $0F141, $03300, $0F3C1, $0F281, $03240,
    $03600, $0F6C1, $0F781, $03740, $0F501, $035C0, $03480, $0F441,
    $03C00, $0FCC1, $0FD81, $03D40, $0FF01, $03FC0, $03E80, $0FE41,
    $0FA01, $03AC0, $03B80, $0FB41, $03900, $0F9C1, $0F881, $03840,
    $02800, $0E8C1, $0E981, $02940, $0EB01, $02BC0, $02A80, $0EA41,
    $0EE01, $02EC0, $02F80, $0EF41, $02D00, $0EDC1, $0EC81, $02C40,
    $0E401, $024C0, $02580, $0E541, $02700, $0E7C1, $0E681, $02640,
    $02200, $0E2C1, $0E381, $02340, $0E101, $021C0, $02080, $0E041,
    $0A001, $060C0, $06180, $0A141, $06300, $0A3C1, $0A281, $06240,
    $06600, $0A6C1, $0A781, $06740, $0A501, $065C0, $06480, $0A441,
    $06C00, $0ACC1, $0AD81, $06D40, $0AF01, $06FC0, $06E80, $0AE41,
    $0AA01, $06AC0, $06B80, $0AB41, $06900, $0A9C1, $0A881, $06840,
    $07800, $0B8C1, $0B981, $07940, $0BB01, $07BC0, $07A80, $0BA41,
    $0BE01, $07EC0, $07F80, $0BF41, $07D00, $0BDC1, $0BC81, $07C40,
    $0B401, $074C0, $07580, $0B541, $07700, $0B7C1, $0B681, $07640,
    $07200, $0B2C1, $0B381, $07340, $0B101, $071C0, $07080, $0B041,
    $05000, $090C1, $09181, $05140, $09301, $053C0, $05280, $09241,
    $09601, $056C0, $05780, $09741, $05500, $095C1, $09481, $05440,
    $09C01, $05CC0, $05D80, $09D41, $05F00, $09FC1, $09E81, $05E40,
    $05A00, $09AC1, $09B81, $05B40, $09901, $059C0, $05880, $09841,
    $08801, $048C0, $04980, $08941, $04B00, $08BC1, $08A81, $04A40,
    $04E00, $08EC1, $08F81, $04F40, $08D01, $04DC0, $04C80, $08C41,
    $04400, $084C1, $08581, $04540, $08701, $047C0, $04680, $08641,
    $08201, $042C0, $04380, $08341, $04100, $081C1, $08081, $04040);
  crc_16_tab: array[0..$FF] of Word =
  ($00000, $01021, $02042, $03063, $04084, $050A5, $060C6, $070E7,
    $08108, $09129, $0A14A, $0B16B, $0C18C, $0D1AD, $0E1CE, $0F1EF,
    $01231, $00210, $03273, $02252, $052B5, $04294, $072F7, $062D6,
    $09339, $08318, $0B37B, $0A35A, $0D3BD, $0C39C, $0F3FF, $0E3DE,
    $02462, $03443, $00420, $01401, $064E6, $074C7, $044A4, $05485,
    $0A56A, $0B54B, $08528, $09509, $0E5EE, $0F5CF, $0C5AC, $0D58D,
    $03653, $02672, $01611, $00630, $076D7, $066F6, $05695, $046B4,
    $0B75B, $0A77A, $09719, $08738, $0F7DF, $0E7FE, $0D79D, $0C7BC,
    $048C4, $058E5, $06886, $078A7, $00840, $01861, $02802, $03823,
    $0C9CC, $0D9ED, $0E98E, $0F9AF, $08948, $09969, $0A90A, $0B92B,
    $05AF5, $04AD4, $07AB7, $06A96, $01A71, $00A50, $03A33, $02A12,
    $0DBFD, $0CBDC, $0FBBF, $0EB9E, $09B79, $08B58, $0BB3B, $0AB1A,
    $06CA6, $07C87, $04CE4, $05CC5, $02C22, $03C03, $00C60, $01C41,
    $0EDAE, $0FD8F, $0CDEC, $0DDCD, $0AD2A, $0BD0B, $08D68, $09D49,
    $07E97, $06EB6, $05ED5, $04EF4, $03E13, $02E32, $01E51, $00E70,
    $0FF9F, $0EFBE, $0DFDD, $0CFFC, $0BF1B, $0AF3A, $09F59, $08F78,
    $09188, $081A9, $0B1CA, $0A1EB, $0D10C, $0C12D, $0F14E, $0E16F,
    $01080, $000A1, $030C2, $020E3, $05004, $04025, $07046, $06067,
    $083B9, $09398, $0A3FB, $0B3DA, $0C33D, $0D31C, $0E37F, $0F35E,
    $002B1, $01290, $022F3, $032D2, $04235, $05214, $06277, $07256,
    $0B5EA, $0A5CB, $095A8, $08589, $0F56E, $0E54F, $0D52C, $0C50D,
    $034E2, $024C3, $014A0, $00481, $07466, $06447, $05424, $04405,
    $0A7DB, $0B7FA, $08799, $097B8, $0E75F, $0F77E, $0C71D, $0D73C,
    $026D3, $036F2, $00691, $016B0, $06657, $07676, $04615, $05634,
    $0D94C, $0C96D, $0F90E, $0E92F, $099C8, $089E9, $0B98A, $0A9AB,
    $05844, $04865, $07806, $06827, $018C0, $008E1, $03882, $028A3,
    $0CB7D, $0DB5C, $0EB3F, $0FB1E, $08BF9, $09BD8, $0ABBB, $0BB9A,
    $04A75, $05A54, $06A37, $07A16, $00AF1, $01AD0, $02AB3, $03A92,
    $0FD2E, $0ED0F, $0DD6C, $0CD4D, $0BDAA, $0AD8B, $09DE8, $08DC9,
    $07C26, $06C07, $05C64, $04C45, $03CA2, $02C83, $01CE0, $00CC1,
    $0EF1F, $0FF3E, $0CF5D, $0DF7C, $0AF9B, $0BFBA, $08FD9, $09FF8,
    $06E17, $07E36, $04E55, $05E74, $02E93, $03EB2, $00ED1, $01EF0);

  ///////////////////////////////////////////////////////////////////////////////
  // Internal Version Control Routines (used for DCU's mainly)
  ///////////////////////////////////////////////////////////////////////////////

constructor TKXComponent.Create(AOwner: TComponent);
begin
  {$IFDEF OBJECTS_ONLY}
  inherited create;
  {$ELSE}
  inherited create(AOwner);
  {$ENDIF}
  MyCriticalSection := TKXCritical.Create;
end;

destructor TKXComponent.Destroy;
begin
  MyCriticalSection.Free;
  MyCriticalSection := nil;
  inherited;
end;

constructor TKXCritical.Create;
begin
  inherited;

  {$IFDEF VER100}
  Synchronizer := TCriticalSection.Create;
  {$ELSE}
  Synchronizer := TCriticalSection.Create; // TMultiReadExclusiveWriteSynchronizer.Create;
  {$ENDIF}
end;

destructor TKXCritical.Destroy;
begin
  try
    Synchronizer.Free;
  except
  end;
  inherited;
end;

procedure TKXCritical.StartingRead;
begin
  {$IFDEF VER100}
  Synchronizer.Acquire;
  {$ELSE}
  Synchronizer.Acquire; //BeginRead;
  {$ENDIF}
end;

procedure TKXCritical.FinishedRead;
begin
  {$IFDEF VER100}
  Synchronizer.Release;
  {$ELSE}
  Synchronizer.Release; //EndRead;
  {$ENDIF}
end;

procedure TKXCritical.StartingWrite;
begin
  {$IFDEF VER100}
  Synchronizer.Acquire;
  {$ELSE}
  Synchronizer.Acquire; //BeginWrite;
  {$ENDIF}
end;

procedure TKXCritical.FinishedWrite;
begin
  {$IFDEF VER100}
  Synchronizer.Release;
  {$ELSE}
  Synchronizer.Release; //EndWrite;
  {$ENDIF}
end;

///////////////////////////////////////////////////////////////////////////////
// Windows/Operating System Routines
///////////////////////////////////////////////////////////////////////////////

procedure ProcessWindowsMessageQueue;
{$IFDEF LINUX}
begin
  Application.ProcessMessages;
end;
{$ELSE}
var
  MsgRec: TMsg;

begin
  if not IsConsole then
    while PeekMessage(MsgRec, 0, 0, 0, PM_REMOVE) do
    begin
      TranslateMessage(MsgRec);
      DispatchMessage(MsgRec)
    end;
end;
{$ENDIF}

function HiByteOfWord(const W: Word): Byte;
begin
  Result := Hi(W);
end;

function MakeBytesToWord(const A, B: Byte): Word;
begin
  Result := (A shl 8) + B;
end;

function WindowsWriteFile(hFile: THandle; const Buffer; nNumberOfBytesToWrite: DWORD;
  var lpNumberOfBytesWritten: DWORD): Boolean;
begin
  {$IFDEF LINUX}
  lpNumberOfBytesWritten := FileWrite(hFile, Buffer, nNumberOfBytesToWrite);
  Result := lpNumberOfBytesWritten = nNumberOfBytesToWrite;
  {$ELSE}
  Result := WriteFile(hFile, Buffer, nNumberOfBytesToWrite, lpNumberOfBytesWritten, nil);
  {$ENDIF}
end;

procedure ShowMessageWindow(const Caption, Message: AnsiString);
begin
  {$IFDEF LINUX}
  MessageDlg(Caption, Message, mtError, [mbOk], 0);
  {$ELSE}
  MessageBox(0, PChar(Message), PChar(Caption), MB_ICONEXCLAMATION or MB_SYSTEMMODAL);
  {$ENDIF}
end;

procedure DoSleepEX(const Interval: DWord);
begin
  {$IFDEF LINUX}
  Sleep(Interval);
  {$ELSE}
  SleepEx(Interval, False {True});
  {$ENDIF}
end;

{$IFNDEF LINUX}

function RegistryStringGet(const Key: HKey; SubKey: AnsiString): AnsiString;
var
  Reg: TRegistry;
  lResult: AnsiString;
  DValue: AnsiString;

begin
  lResult := '';
  DValue := SubKey;
  Delete(DValue, 1, PosLastChar('\', SubKey));
  Delete(SubKey, PosLastChar('\', SubKey), length(DValue) + 1);
  Reg := TRegistry.Create;
  try
    Reg.RootKey := Key;
    if Reg.OpenKey(SubKey, True) then
      lresult := Reg.ReadString(DValue);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  result := lresult;
end;

function RegistryStringSet(const Key: HKey; SubKey, Value: AnsiString): Boolean;
var
  Reg: TRegistry;
  DValue: AnsiString;

begin
  DValue := SubKey;
  Delete(DValue, 1, PosLastChar('\', SubKey));
  Delete(SubKey, PosLastChar('\', SubKey), length(DValue) + 1);
  Reg := TRegistry.Create;
  Result := False;
  try
    Reg.RootKey := Key;
    if Reg.OpenKey(SubKey, True) then
    begin
      Reg.WriteString(DValue, Value);
      Result := True;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

function GetRegistryString(const Key: HKey; const SubKey: AnsiString): AnsiString;
begin
  Result := RegistryStringGet(Key, SubKey);
end;

function SetRegistryString(const Key: HKey; SubKey, Value: AnsiString): Boolean;
begin
  Result := RegistryStringSet(Key, SubKey, Value);
end;

function LaunchWebBrowser(const URL: AnsiString; const WindowState: Integer): Boolean;
var
  sLaunch: AnsiString;
  iPos: integer;

begin
  Result := False;
  sLaunch := GetRegistryString(HKEY_CLASSES_ROOT, '.htm');
  if sLaunch <> '' then
  begin
    sLaunch := sLaunch + '\shell\open\command';
    sLaunch := GetRegistryString(HKEY_CLASSES_ROOT, sLaunch);
    if sLaunch <> '' then
    begin
      iPos := QuickPos('"%1"', sLaunch);
      if iPos = 0 then
        iPos := QuickPos('%1', sLaunch);
      if iPos <> 0 then
        sLaunch := Copy(sLaunch, 1, iPos - 1);
      sLaunch := sLaunch + #32 + URL;
      Result := WinExec(PAnsiChar(sLaunch), WindowState) > 31;
    end;
  end;
end;
{$ENDIF}

{$IFNDEF VER90}
///////////////////////////////////////////////////////////////////////////////
// References the external symbol to MS CoCreateGUID function which creates MS-style UUID's
///////////////////////////////////////////////////////////////////////////////
{$IFNDEF LINUX}
function CoCreateGuid; external ole32 name 'CoCreateGuid';
{$ENDIF}

function MakeUUID: AnsiString;
var
  UUIDVar: TGUID;
  UUID_String: AnsiString;
  k: Integer;

begin
  CoCreateGuid(UUIDVar);
  UUID_String := IntToHex(UUIDVar.D1, 8) + '-' +
    IntToHex(UUIDVar.D2, 4) + '-' +
    IntToHex(UUIDVar.D3, 4) + '-';
  for k := 0 to 1 do
    UUID_String := UUID_String + IntToHex(UUIDVar.D4[k], 2);
  UUID_String := UUID_String + '-';
  for k := 2 to 7 do
    UUID_String := UUID_String + IntToHex(UUIDVar.D4[k], 2);
  Result := UUID_String;
end;

function RawUUID: AnsiString;
var
  UUIDVar: TGUID;
  UUID_String: AnsiString;
  k: Integer;

begin
  CoCreateGuid(UUIDVar);
  UUID_String := IntToHex(UUIDVar.D1, 8) +
    IntToHex(UUIDVar.D2, 4) +
    IntToHex(UUIDVar.D3, 4);
  for k := 0 to 1 do
    UUID_String := UUID_String + IntToHex(UUIDVar.D4[k], 2);
  for k := 2 to 7 do
    UUID_String := UUID_String + IntToHex(UUIDVar.D4[k], 2);
  Result := UUID_String;
end;

function MakeUUIDPacked: AnsiString;
var
  UUIDVar: TGUID;

begin
  CoCreateGuid(UUIDVar);
  SetLength(Result, 16);
  Move(UUIDVar.D1, Result[1], 4);
  Move(UUIDVar.D2, Result[5], 2);
  Move(UUIDVar.D3, Result[7], 2);
  Move(UUIDVar.D4, Result[9], 8);
end;
{$ENDIF}

{$IFDEF LINUX}

function CoCreateGuid(var GUID: TGUID): HResult;
begin
  Result := CreateGUID(GUID);
end;
{$ENDIF}

///////////////////////////////////////////////////////////////////////////////
// Numeric Routines
///////////////////////////////////////////////////////////////////////////////

function IsCharAlphaNumeric(const C: ansichar): Boolean;
begin
  {$IFNDEF ASM8086}
  Result := C in ['0'..'9', 'A'..'Z', 'a'..'z'];
  {$ELSE}
  asm
   mov AL,C
   cmp AL, $30   // 0
   jl @NoMatch   // it's before '0' so Result=False/Exit
   cmp AL, $7A   // z
   jg @NoMatch   // it's after 'z' so Result=False/Exit
   cmp AL, $39   // 9
   jg @TryAlpha  // it's after '9' so see if it is Alpha now
   jmp @Matched  // it's 0..9 so Result=True/Exit
@TryAlpha:
   cmp AL, $41   // A
   jl @NoMatch   // it's before 'A' so Result=False/Exit
   cmp AL, $5A   // Z
   jg @TryLower  // it's after 'Z' so see if it is lowecase Alpha
   jmp @Matched  // it's 'A'..'Z' so Result=True/Exit
@TryLower:
   cmp AL, $61   // a
   jl @NoMatch   // it's before 'a' so Result=False/Exit
   jmp @Matched  // it's 'a'..'z' so Result=True/Exit
@NoMatch:
   mov Result,0
   jmp @TheEnd
@Matched:
   mov Result,1
@TheEnd:
   end{asm}
{$ENDIF}
  end;

function IsCharAlpha(const c: AnsiChar): Boolean;
begin
  {$IFNDEF ASM8086}
  Result := C in ['A'..'Z', 'a'..'z'];
  {$ELSE}
  asm
   mov AL,C
   cmp AL, $41   // A
   jl @NoMatch   // it's before 'A' so Result=False/Exit
   cmp AL, $7A   // z
   jg @NoMatch   // it's after 'z' so Result=False/Exit
   cmp AL, $5A   // Z
   jg @TryLower  // it's after 'Z' so see if it is lower now
   jmp @Matched  // it's A..Z so Result=True/Exit
@TryLower:
   cmp AL, $61   // a
   jl @NoMatch   // it's before 'a' so Result=False/Exit
   jmp @Matched  // it's 'a'..'z' so Result=True/Exit
@NoMatch:
   mov Result,0
   jmp @TheEnd
@Matched:
   mov Result,1
@TheEnd:
   end{asm}
{$ENDIF}
  end;

function IsNumeric(const c: Ansichar): Boolean;
begin
  {$IFNDEF ASM8086}
  Result := IsCharAlphaNumeric(c) and not IsCharAlpha(c);
  {$ELSE}
  asm
   mov AL,C
   cmp AL, $30   // 0
   jl @NoMatch   // it's before '0' so Result=False/Exit
   cmp AL, $39   // 9
   jg @NoMatch   // it's after '9' so Result=False/Exit
   jmp @Matched  // it's 0..9 so Result=True/Exit
@NoMatch:
   mov Result,0
   jmp @TheEnd
@Matched:
   mov Result,1
@TheEnd:
   end{asm}
{$ENDIF}
  end;

function isNumericString(const S: Ansistring): Boolean;
var
  Loop, MaxLoop: Integer;

begin
  Result := True;
  MaxLoop := Length(S);
  Loop := 0;
  while (Loop < MaxLoop) and (Result) do
  begin
    if S[Loop + 1] <> '.' then
      Result := IsNumeric(S[Loop + 1]);
    Inc(Loop);
  end;
end;

function Min(const I1, I2: Integer): Integer;
begin
  {$IFNDEF ASM8086}
  if I1 < I2 then
    Result := I1
  else
    Result := I2;
  {$ELSE}
  Result := I1;
  asm
   mov ECX, I2    // Store I2 in ECX
   mov EDX, I1    // Store I1 in EDX
   cmp EDX, ECX   // compare I2 to I1
   jl @TheEnd     // if I2<I1 then Exit {result already set}
@ItIsLess:
   mov Result,ECX // result=I2/Exit
@TheEnd:
  end; {asm}
  {$ENDIF}
end;

function Max(const I1, I2: Integer): Integer;

begin
  {$IFNDEF ASM8086}
  if I1 > I2 then
    Result := I1
  else
    Result := I2;
  {$ELSE}
  Result := I1;
  asm
   mov ECX, I2    // Store I2 in ECX
   mov EDX, I1    // Store I1 in EDX
   cmp EDX, ECX   // compare I2 to I1
   jg @TheEnd     // if I2>I1 then Exit {result already set}
@ItIsLess:
   mov Result,ECX // result=I2/Exit
@TheEnd:
  end; {asm}
  {$ENDIF}
end;

function StringToInteger(const S: AnsiString): Integer;
var
  E: Integer;

begin
  Val(S, Result, E);
end;

procedure SwapMove(Source: Word; var Dest);
begin
  Source := (HI(Source)) + (LO(Source) * 256);
  Move(Source, Dest, 2);
end;

function IntToCommaStr(const Number: Integer): AnsiString;
var
  StrPos: Integer;

begin
  Result := IntToStr(Number);
  StrPos := Length(Result) - 2;
  while StrPos > 1 do
  begin
    Insert(',', Result, StrPos);
    StrPos := StrPos - 3;
  end;
end;

function BinaryToString(const Number: Byte): AnsiString;
var
  Temp2: Byte;
  i: Word;

begin
  Setlength(Result, 8);
  FillChar(Result[1], 8, '0');
  Temp2 := $80;
  for i := 1 to 8 do
  begin
    if (Number and Temp2) <> 0 then
      Result[i] := '1';
    Temp2 := Temp2 shr 1;
  end;
end;

function StringToBinary(S: AnsiString): Byte;
var
  i: Word;
  Temp1: Byte;
  Temp2: Byte;

begin
  S := Trim(S);
  while Length(S) < 8 do
    S := '0' + S;
  Temp1 := 0;
  Temp2 := $80;
  for i := 1 to 8 do
  begin
    if S[i] = '1' then
      Inc(Temp1, Temp2);
    Temp2 := Temp2 shr 1;
  end;
  Result := Temp1;
end;

///////////////////////////////////////////////////////////////////////////////
// AnsiString Routines
///////////////////////////////////////////////////////////////////////////////

function QuickPos(const aFindString, aSourceString: AnsiString): integer;
var
  SourceLen, aSourceLen, aFindLen, StartPos: integer;

begin
  {$IFNDEF ASM8086}
  Result := Pos(aFindString, aSourceString);
  {$ELSE}
  Result := 0;
  aSourceLen := Length(aSourceString);
  if aSourceLen = 0 then
    Exit;
  aFindLen := Length(aFindString);
  if (aFindLen = 0) or (aFindlen > AsourceLen) then
    Exit; {GSW FIX!}
  StartPos := 1;
  SourceLen := aSourceLen - aFindLen;
  SourceLen := (SourceLen - StartPos) + 2;

  asm
   push ESI
   push EDI
   push EBX
   mov EDI, aSourceString
   add EDI, StartPos
   dec EDI
   mov ESI, aFindString
   mov ECX, SourceLen
   mov Al, [ESI]
@ScaSB:
   mov Ah, [EDI]
   cmp Ah,Al
   jne @NextChar
@CompareStrings:
   mov EBX, aFindLen
   dec EBX
   jz @FullMatch
@CompareNext:
   mov Al, [ESI+EBX]
   mov Ah, [EDI+EBX]
   cmp Al, Ah
   jz @Matches
   mov Al, [ESI]
   jmp @NextChar
@Matches:
   dec EBX
   jnz @CompareNext
@FullMatch:
   mov EAX, EDI
   sub EAX, aSourceString
   inc EAX
   mov Result, EAX
   jmp @TheEnd
@NextChar:
   inc EDI
   dec ECX
   jnz @ScaSB
   mov Result,0
@TheEnd:
   pop EBX
   pop EDI
   pop ESI
  end; {asm}
  {$ENDIF}
end;

function CharPos(const C: AnsiChar; const aSource: Ansistring): Integer;
var
  L: Integer;
begin
  L := Length(aSource);
  Result := 0;
  if L = 0 then
    exit;

  asm
  PUSH EDI                 //Preserve this register
  mov  EDI, aSource        //Point EDI at aSource
  mov  ECX, L              //Make a note of how many chars to search through
  mov  AL,  C              //and which char we want
@Loop:
  mov  AH, [EDI]
  inc  EDI
  xor  AH, AL
  jz   @Found
  dec  ECX
  jnz  @Loop
  jmp  @NotFound
@Found:
  sub  EDI, aSource        //EDI has been incremented, so EDI-OrigAdress = Char pos !
  mov  Result,   EDI
  jmp @TheEnd
@NotFound:
  mov  Result, 0 // fix (ozz)
@TheEnd:
  POP  EDI
  end;
end;

function Fetch(var S: AnsiString; const Sub: AnsiString; const IgnoreCase: Boolean): AnsiString;
var
  P: Integer;

begin
  if IgnoreCase then
    P := QuickPos(Uppercase(Sub), Uppercase(S))
  else
    P := QuickPos(Sub, S);
  if (P = 0) then
  begin
    Result := S;
    S := '';
  end
  else
  begin
    Result := Copy(S, 1, P - 1);
    Delete(S, 1, P + (Length(Sub) - 1));
  end;
end;

function FetchByChar(var S: Ansistring; const Sub: AnsiChar; const IgnoreCase: Boolean): AnsiString;
var
  P: Integer;

begin
  if IgnoreCase then
    P := CharPos(Upcase(Sub), Uppercase(S))
  else
    P := CharPos(Sub, S);
  if (P = 0) then
  begin
    Result := S;
    S := '';
  end
  else
  begin
    Result := Copy(S, 1, P - 1);
    Delete(S, 1, P);
  end;
end;

function Uppercase(const S: Ansistring): AnsiString;
{$IFNDEF ASM8086}
var
  Loop: Integer;
  MaxLoop: Integer;

begin
  Result := S;
  MaxLoop := Length(Result);
  for Loop := MaxLoop downto 1 do
    if Result[Loop] in ['a'..'z'] then
      Dec(Result[Loop], 32);
end;
{$ELSE}
var
  LenOfString: Integer;
  FirstSource, FirstDest: Pointer;

  begin
    LenOfString := Length(S);
    if LenOfString = 0 then
    begin
      Result := '';
      Exit;
    end;
    SetLength(Result, LenOfString);
    FirstSource := Pointer(s);
    FirstDest := Pointer(Result);
    asm
   PUSH ESI            //Firstly and most importantly
   PUSH EDI            //Delphi uses EBX, ESI, EDI extensively, so we need to
                       //push them onto the stack, and then pop them off after
   mov ESI, FirstSource//Move the address of Result into ESI
   mov EDI, FirstDest  //ESI and EDI are 2 generic "data moving" registers
                       //ESI = Source, EDI = Destination
                       //MovSB (MoveString Byte, there is also, MovSW word and MovSD double)
                       //MovXX copy from EDI to ESI, and then INC *both* ESI and EDI
                       //  and also DEC ECX (generic AnsiString length counter)
                       //But I will not use these as I need to Uppercase the results
   mov ECX, LenOfString//ECX will contain a count of how many chars left to do
@NextChar:
   mov AL, [ESI]       //Move ESI^ into AL
                       //  AL = Char, AX = Word, EAX = DWord, all different parts
                       //  of the same register
   cmp AL, $61
   jl  @NoUpper        // < 'a' don't convert
   cmp AL, $7A
   jg  @NoUpper        // > 'z' don't convert
   and AL, $DF         // Convert to uppercase
@NoUpper:
   mov [EDI], AL       // Put AL back into EDI^  (That's what [] means)
   Inc ESI             //Point to next character
   Inc EDI
   Dec ECX             //Decrement the count, if it reaches 0, the ZERO flag will be set
   jnz @NextChar       //"J"ump if "n"ot "z"ero to the next character
   POP EDI
   POP ESI
    end; {asm}
  end;
  {$ENDIF}

function Lowercase(const S: Ansistring): AnsiString;
{$IFNDEF ASM8086}
var
  Loop: Integer;
  MaxLoop: Integer;

begin
  Result := S;
  MaxLoop := Length(Result);
  for Loop := MaxLoop downto 1 do
    if Result[Loop] in ['A'..'Z'] then
      Inc(Result[Loop], 32);
end;
{$ELSE}
var
  LenOfString: Integer;
  FirstSource, FirstDest: Pointer;

  begin
    LenOfString := Length(S);
    if LenOfString = 0 then
    begin
      Result := '';
      Exit;
    end;
    SetLength(Result, LenOfString);
    FirstSource := Pointer(S);
    FirstDest := Pointer(Result);
    asm
   PUSH ESI            //Firstly and most importantly
   PUSH EDI            //Delphi uses EBX, ESI, EDI extensively, so we need to
                       //push them onto the stack, and then pop them off after
   mov ESI, FirstSource//Move the address of Result into ESI
   mov EDI, FirstDest  //ESI and EDI are 2 generic "data moving" registers
                       //ESI = Source, EDI = Destination
                       //MovSB (MoveString Byte, there is also, MovSW word and MovSD double)
                       //MovXX copy from EDI to ESI, and then INC *both* ESI and EDI
                       //  and also DEC ECX (generic AnsiString length counter)
                       //But I will not use these as I need to Uppercase the results
   mov ECX, LenOfString//ECX will contain a count of how many chars left to do
@NextChar:
   mov AL, [ESI]       //Move ESI^ into AL
                       //  AL = Char, AX = Word, EAX = DWord, all different parts
                       //  of the same register
   cmp AL, 'A'
   jl  @NoUpper        // < 'a' don't convert
   cmp AL, 'Z'
   jg  @NoUpper        // > 'z' don't convert
   xor AL, $20         // Convert to lowercase
@NoUpper:
   mov [EDI], AL       // Put AL back into EDI^  (That's what [] means)
   Inc ESI             //Point to next character
   Inc EDI
   Dec ECX             //Decrement the count, if it reaches 0, the ZERO flag will be set
   jnz @NextChar       //"J"ump if "n"ot "z"ero to the next character
   POP EDI
   POP ESI
    end; {asm}
  end;
  {$ENDIF}

function ProperCase(const S: Ansistring): AnsiString;
var
  Len: Integer;
  MaxLen: Integer;

begin
  Len := Length(S);
  MaxLen := Len;
  SetLength(Result, Len);
  Result := Lowercase(S);
  while Len > 0 do
  begin
    if not (Result[Len] in ['a'..'z']) and (Len < MaxLen) then
      Result[Len + 1] := Upcase(Result[Len + 1]);
    Dec(Len);
  end;
  if (MaxLen > 0) and (Result[1] in ['a'..'z']) then
    Result[1] := Upcase(Result[1]);
end;

function Trim(const S: AnsiString): AnsiString;
var
  I, L: Integer;
begin
  L := Length(S);
  I := 1;
  while (I <= L) and (S[I] <= ' ') do
    Inc(I);
  if I > L then
    Result := ''
  else
  begin
    while S[L] <= ' ' do
      Dec(L);
    Result := Copy(S, I, L - I + 1);
  end;
end;

function NoCRLF(const S: AnsiString): AnsiString;
begin
  Result := StringReplace(S, #13#10, '', [rfReplaceAll]);
end;

function NoAngleBrackets(const S: AnsiString): AnsiString;
var
  LenOfStr: Integer;

begin
  Result := S;
  LenOfStr := Length(Result);
  if LenOfStr > 1 then
    if (Result[1] = '<') and (Result[LenOfStr] = '>') then
      Result := Copy(Result, 2, LenOfStr - 2);
end;

// Known Commands should be a 0 based array!
// For testing Winshoes products against ours, this command is useless to our
// engine. We use a dynamic parser which provides a much more flexible
// development solution for you.

function InStrArray(const SearchStr: AnsiString; const KnownCommands: array of AnsiString): Integer;
begin
  for Result := High(KnownCommands) downto Low(KnownCommands) do
    if SearchStr = KnownCommands[Result] then
      Exit;
  Result := -1;
end;

procedure InverseString(var S: AnsiString; Count: Integer);
var
  TmpStr: AnsiString;
  Ctr: Integer;
  Ch: AnsiChar;

begin
  TmpStr := Copy(S, 1, Count);
  Ctr := 0;
  while Count > 0 do
  begin
    Ch := TmpStr[Count];
    Dec(Count);
    Move(Ch, S[Ctr + 1], 1);
    Inc(Ctr);
  end;
end;

function HexDump(const S: AnsiString): AnsiString;
var
  Loop: Integer;
  MaxLoop: Integer;

begin
  Result := '';
  Loop := 0;
  MaxLoop := Length(S);
  while Loop < MaxLoop do
  begin
    Result := Result + IntToHex(Ord(S[Loop + 1]), 2) + #32;
    Inc(Loop);
  end;
end;

function ReplaceChar(const Source: AnsiString; const OldChar, NewChar: AnsiChar): AnsiString;
var
  Loop: Integer;

begin
  Result := Source;
  if OldChar = NewChar then
    Exit;
  Loop := Length(Source);
  while Loop > 0 do
  begin
    if Result[Loop] = OldChar then
      Result[Loop] := NewChar;
    Dec(loop);
  end;
end;

function ExtractLeft(const aSourceString: AnsiString; const Size: Integer): AnsiString;
begin
  if Size > Length(aSourceString) then
    Result := aSourceString
  else
  begin
    Setlength(Result, Size);
    Move(aSourceString[1], Result[1], Size);
  end;
end;

function ExtractRight(const aSourceString: AnsiString; const Size: Integer): AnsiString;
var
  Len: Integer;

begin
  Len := Length(aSourceString);
  if Size > Len then
    Result := aSourceString
  else
  begin
    Setlength(Result, Size);
    Move(aSourceString[Len - Pred(Size)], Result[1], Size);
  end;
end;

function ExtractWordAt(const Text: AnsiString; Position: Integer): AnsiString;
var
  Done: Boolean;
  StartAt: Integer;
  Len: Integer;
  OrgPosition: Integer;

begin
  Len := Length(Text);
  Result := '';
  Done := not (UpCase(Text[Position]) in ['A'..'Z', '0'..'9']);
  if (Position > 0) and (Position <= Len) and not Done then
  begin
    OrgPosition := Position;
    while (Position > 0) and not Done do
    begin
      Done := not (UpCase(Text[Position]) in ['A'..'Z', '0'..'9']);
      if not Done then
        Dec(Position);
    end;
    StartAt := Position;
    Position := OrgPosition;
    Done := False;
    while (Position <= Len) and not Done do
    begin
      Done := not (UpCase(Text[Position]) in ['A'..'Z', '0'..'9']);
      if not Done then
        Inc(Position);
    end;
    Result := Copy(Text, StartAt + 1, Pred(Position) - StartAt);
  end;
end;

function LeftJustify(const S: AnsiString; const MaxLength: Integer): AnsiString;
begin
  Result := LeftJustifyCh(S, #32, MaxLength);
end;

function RightJustify(const S: AnsiString; const MaxLength: Integer): AnsiString;
begin
  Result := RightJustifyCh(S, #32, MaxLength);
end;

function CleanChar(const InChar: AnsiChar): AnsiChar;
const
  CtlChars: string[32] = 'oooooooooXoollo><|!Pg*|^v><-^v';
  HiChars: string[64] = 'CueaaaageeeiiiAAEaaooouuyOUcLYPfarounNao?--//!<>***|||||||||||||';
  HiChars2: string[64] = '|--|-+||||=+|=++-=--==-||||*****abcnEduto0nd80En=+><fj/~oo.vn2* ';

begin
  case InChar of
    #0..#31: Result := CtlChars[Ord(InChar) + 1];
    #128..#191: Result := HiChars[Ord(InChar) - 127];
    #192..#255: Result := HiChars2[Ord(InChar) - 191];
  else
    Result := InChar;
  end;
end;

function CleanStr(const InStr: Ansistring): Ansistring;
begin
  Result := '';
  while Length(Result) < Length(InStr) do
    Result := Result + CleanChar(InStr[Length(Result) + 1]);
end;

function PosLastChar(const Ch: AnsiChar; const S: AnsiString): Integer;
var
  I: Integer;

begin
  i := Length(S);
  while ((i > 0) and (s[i] <> ch)) do
    Dec(i);
  Result := I;
end;

function AsciiToOem(const ax: AnsiString): AnsiString;
var
  i: integer;

begin
  Result := AX;
  for i := Length(Result) downto 1 do
  begin
    case Ord(Result[i]) of
      132: Result[i] := Char(228);
      142: Result[i] := Char(196);
      129: Result[i] := Char(252);
      154: Result[i] := Char(220);
      148: Result[i] := Char(246);
      153: Result[i] := Char(214);
      225: Result[i] := Char(223);
    end;
  end;
end;

function OemToAscii(const ax: AnsiString): AnsiString;
var
  i: integer;

begin
  Result := AX;
  for i := Length(Result) downto 1 do
  begin
    case Ord(Result[i]) of
      228: Result[i] := Char(132);
      196: Result[i] := Char(142);
      252: Result[i] := Char(129);
      220: Result[i] := Char(154);
      246: Result[i] := Char(148);
      214: Result[i] := Char(153);
      223: Result[i] := Char(225);
    end;
  end;
end;

function WordCount(const S: AnsiString): Integer;
var
  I, Len: Integer;

begin
  Len := Length(S);
  Result := 0;
  I := 1;
  while I <= Len do
  begin
    while (i <= len) and ((S[i] = #32) or (S[i] = #9) or (S[i] = ';')) do
      inc(i);
    if I <= len then
      inc(Result);
    while (I <= len) and (S[i] <> #32) and (S[i] <> #9) and (S[i] <> ';') do
      inc(i);
  end;
end;

function CRC32ByChar(const Ch: Char; const starting_crc: LONGINT): LONGINT;
begin
  Result := crc_32_tab[BYTE(starting_crc xor LONGINT(Ord(Ch)))] xor ((starting_crc shr 8) and $00FFFFFF);
end;

function CRC32ByString(const S: AnsiString; const starting_crc: LONGINT): LONGINT;
var
  Loop: Integer;
  MaxLoop: Integer;

begin
  Result := starting_crc;
  MaxLoop := Length(S);
  for Loop := 1 to MaxLoop do
    //      Result:=CRC32ByChar(S[Loop],Result);
    Result := crc_32_tab[BYTE(Result xor LONGINT(Ord(S[Loop])))] xor ((Result shr 8) and $00FFFFFF);
end;

function CRC16ByChar(const Ch: Char; const starting_crc: word): word;
begin
  Result := crc_16_tab[BYTE(starting_crc xor Word(Ord(Ch)))] xor ((starting_crc shr 8) and $00FF)
end;

function CRC16ByString(const S: AnsiString; const starting_crc: word): word;
var
  Loop: Integer;
  MaxLoop: Integer;

begin
  Result := starting_crc;
  MaxLoop := Length(S);
  for Loop := 1 to MaxLoop do
    //      Result:=CRC16ByChar(S[Loop],Result);
    Result := crc_16_tab[BYTE(Result xor Word(Ord(S[Loop])))] xor ((Result shr 8) and $00FF)
end;

function CRCARCByChar(const Ch: Char; const starting_crc: word): word;
begin
  Result := crc_arc_tab[BYTE(starting_crc xor Word(Ord(Ch)))] xor ((starting_crc shr 8) and $00FF)
end;

function CRCARCByString(const S: AnsiString; const starting_crc: word): word;
var
  Loop: Integer;
  MaxLoop: Integer;

begin
  Result := starting_crc;
  MaxLoop := Length(S);
  for Loop := 1 to MaxLoop do
    //      Result:=CRCARCByChar(S[Loop],Result);
    Result := crc_arc_tab[BYTE(Result xor Word(Ord(S[Loop])))] xor ((Result shr 8) and $00FF)
end;

procedure SetLongBit(var L: LongInt; const Bit: Byte; const Setting: Boolean);
var
  Mask: LongInt;

begin
  Mask := 1;
  Mask := Mask shl (Bit - 1);
  if Setting then
    L := L or Mask
  else
    L := (L and (not Mask));
end;

function GetLongBit(const L: LongInt; const Bit: Byte): Boolean;
var
  Mask: LongInt;

begin
  Mask := 1;
  Mask := Mask shl (Bit - 1);
  Result := (L and Mask) <> 0;
end;

procedure SetWordBit(var L: Word; const Bit: Byte; const Setting: Boolean);
var
  Mask: Word;

begin
  Mask := 1;
  Mask := Mask shl (Bit - 1);
  if Setting then
    L := L or Mask
  else
    L := (L and (not Mask));
end;

function GetWordBit(const L: Word; const Bit: Byte): Boolean;
var
  Mask: Word;

begin
  Mask := 1;
  Mask := Mask shl (Bit - 1);
  Result := (L and Mask) <> 0;
end;

procedure SetByteBit(var L: Byte; const Bit: Byte; const Setting: Boolean);
var
  Mask: Byte;

begin
  Mask := 1;
  Mask := Mask shl (Bit - 1);
  if Setting then
    L := L or Mask
  else
    L := (L and (not Mask));
end;

function GetByteBit(const L: Byte; const Bit: Byte): Boolean;
var
  Mask: Byte;

begin
  Mask := 1;
  Mask := Mask shl (Bit - 1);
  Result := (L and Mask) <> 0;
end;

function Replicate(const Source: AnsiString; NumberOfTimes: Integer): AnsiString;
var
  SourceLength: Integer;
  Dest: Integer;

begin
  Dest := 1;
  SourceLength := Length(Source);
  SetLength(Result, SourceLength * NumberOfTimes);
  while NumberOfTimes > 0 do
  begin
    Move(Source[1], Result[Dest], SourceLength);
    Inc(Dest, SourceLength);
    Dec(NumberOfTimes);
  end;
end;

function IsWildCard(const Source: AnsiString): Boolean;
begin
  Result := CharPos('*', Source) + CharPos('?', Source) + CharPos('%', Source) > 0;
end;

///////////////////////////////////////////////////////////////////////////////
// Internet Routines
///////////////////////////////////////////////////////////////////////////////

function GetIndex(const c: Ansichar): Integer;
var
  i: Integer;
  {$IFDEF ASM8086}
  S: AnsiString;
  {$ENDIF}

begin
  {$IFNDEF ASM8086}
  i := CharPos(c, Alphabet); //overkill for just 1 character
  {$ELSE}
  S := Alphabet;
  asm
   PUSH EDI                 //Preserve this register
   mov  EDI, S              //Point EDI at Alphabet AnsiString
   mov  ECX, AlphaBetLength //Tell CPU how big Alphabet is
   mov  AL,  C              //and which char we want
   RepNE ScaSB              //"Rep"eat while "N"ot "E"qual
                            //this is the same as
                            //While (EDI^ <> AL) and (ECX>0) do begin
                            //  Inc(EDI);
                            //  Dec(ECX);
                            //end;
   jnz  @NotFound           //Zero flag will be set if there was a match
   sub  EDI, S              //EDI has been incremented, so EDI-OrigAdress = Char pos !
   mov  I,   EDI
@NotFound:
   POP  EDI
  end;
  {$ENDIF}
  if (i > 0) then
    Dec(i);
  result := i;
end;

function Base64ToString(const S: Ansistring): Ansistring;
var
  i: Integer;

  function DecodeUnit(const InStr: Ansistring): AnsiString;
  var
    a, b, c, d: Byte;

  begin
    a := GetIndex(InStr[1]);
    b := GetIndex(InStr[2]);
    if InStr[3] = '=' then
    begin
      SetLength(Result, 1);
      result[1] := AnsiChar(chr((a shl 2) or (b shr 4)));
    end
    else
      if InStr[4] = '=' then
    begin
      SetLength(Result, 2);
      c := GetIndex(InStr[3]);
      result[1] := AnsiChar(chr((a shl 2) or (b shr 4)));
      result[2] := AnsiChar(chr((b shl 4) or (c shr 2)));
    end
    else
    begin
      c := GetIndex(InStr[3]);
      d := GetIndex(InStr[4]);
      SetLength(result, 3);
      result[1] := AnsiChar(chr((a shl 2) or (b shr 4)));
      result[2] := AnsiChar(chr((b shl 4) or (c shr 2)));
      result[3] := AnsiChar(chr((c shl 6) or d));
    end;
  end;

begin
  Result := '';
  for i := ((Length(s) div 4) - 1) downto 0 do
    Result := DecodeUnit(Copy(s, i * 4 + 1, 4)) + Result;
end;

function StringToBase64(const S1: Ansistring): Ansistring;
const
  Table: AnsiString = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

var
  I, K, L: Integer;
  S: AnsiString;

begin
  L := Length(S1);
  if L mod 3 <> 0 then
    Inc(L, 3);
  SetLength(S, (L div 3) * 4);
  FillChar(S[1], Length(S), '=');
  I := 0;
  K := 1;
  while I < Length(S1) do
  begin
    S[K] := Table[1 + (Ord(S1[I + 1]) shr 2)];
    S[K + 1] := Table[1 + (((Ord(S1[I + 1]) and $03) shl 4) or (Ord(S1[I + 2]) shr 4))];
    if I + 1 >= Length(S1) then
      Break;
    S[K + 2] := Table[1 + (((Ord(S1[I + 2]) and $0F) shl 2) or (Ord(S1[I + 3]) shr 6))];
    if I + 2 >= Length(S1) then
      Break;
    S[K + 3] := Table[1 + (Ord(S1[I + 3]) and $3F)];
    Inc(I, 3);
    Inc(K, 4);
  end;
  Result := S;
end;

function FixDottedIP(const S: AnsiString): AnsiString;
var
  n: Cardinal;

begin
  Result := '.' + S;
  n := QuickPos('.0', Result);
  while n > 0 do
  begin
    Delete(Result, n + 1, 1);
    n := QuickPos('.0', Result);
  end;
  n := QuickPos('..', Result);
  while N > 0 do
  begin
    Insert('0', Result, n + 1);
    n := QuickPos('..', Result);
  end;
  if Result[Length(Result)] = '.' then
    Result := Result + '0';
  Delete(Result, 1, 1);
end;

function IPStringFormated(S: AnsiString): AnsiString;
var
  n1, n2, n3, n4: Integer;

begin
  N1 := StrToInt(Copy(S, 1, CharPos('.', S) - 1));
  Delete(S, 1, CharPos('.', S));
  N2 := StrToInt(Copy(S, 1, CharPos('.', S) - 1));
  Delete(S, 1, CharPos('.', S));
  N3 := StrToInt(Copy(S, 1, CharPos('.', S) - 1));
  Delete(S, 1, CharPos('.', S));
  N4 := StringToInteger(S);
  Result := IPAddressFormatted(N1, N2, N3, N4);
end;

function IPAddressFormatted(const I1, I2, I3, I4: Integer): AnsiString;
begin
  Result := IntToStr(I4);
  while Length(Result) < 3 do
    Result := '0' + Result;
  Result := IntToStr(I3) + '.' + Result;
  while Length(Result) < 7 do
    Result := '0' + Result;
  Result := IntToStr(I2) + '.' + Result;
  while Length(Result) < 11 do
    Result := '0' + Result;
  Result := IntToStr(I1) + '.' + Result;
  while Length(Result) < 15 do
    Result := '0' + Result;
end;

function EscapeDecode(const S: AnsiString): AnsiString;
var
  ch: Char;
  val: AnsiString;
  I: Integer;

begin
  Result := S;
  I := CharPos('%', Result);
  while I > 0 do
  begin
    Val := '$' + Copy(Result, I + 1, 2);
    try
      Ch := Char(StrToInt(Val));
    except
      Ch := 'a';
    end;
    Result := Copy(Result, 1, I - 1) + Ch + Copy(Result, I + 3, Length(Result));
    I := CharPos('%', Result);
  end;
  I := CharPos('+', Result);
  while I > 0 do
  begin
    Result := Copy(Result, 1, I - 1) + #32 + Copy(Result, I + 1, Length(Result));
    I := CharPos('+', Result);
  end;
end;

function EscapeEncode(const S: AnsiString): AnsiString;
var
  Loop: Integer;
  MaxLoop: Integer;

begin
  Result := '';
  MaxLoop := Length(S);
  for Loop := 1 to MaxLoop do
    if S[Loop] in ['0'..'9', '.', '-'] then
      Result := Result + S[Loop]
    else
      if S[Loop] = #32 then
      Result := Result + '+'
    else
      if (S[Loop] < #21) or
      (S[Loop] > #127) then
      Result := Result + '%' + IntToHex(Ord(S[Loop]), 2)
    else
      Result := Result + S[Loop]
end;

function EncodeDomain(S: AnsiString): AnsiString;
var
  Dot: Integer;

begin
  Result := '';
  while (S <> '') do
  begin
    Dot := CharPos('.', S);
    case Dot of
      0:
        begin
          Result := Result + Chr(Length(S)) + S;
          S := '';
        end;
    else
      begin
        Result := Result + Chr(Dot - 1) + Copy(S, 1, Dot - 1);
        Delete(S, 1, Dot);
      end;
    end;
  end;
  Result := Result + #0;
end;

function EncodeAddress(S: AnsiString): AnsiString;
var
  Dot: Integer;

begin
  Result := '';
  while (S <> '') do
  begin
    Dot := Pos('.', S);
    case Dot of
      0:
        begin
          Result := Result + Chr(Length(S)) + S;
          S := '';
        end;
    else
      begin
        Result := Result + Chr(Dot - 1) + Copy(S, 1, Dot - 1);
        Delete(S, 1, Dot);
      end;
    end;
  end;
  Result := Result + #7'in-addr'#4'arpa'#0;
end;

function DecodeDomain(S: AnsiString): AnsiString;
var
  L: Integer;

begin
  Result := '';
  while Length(S) > 0 do
  begin
    L := Ord(S[1]);
    if L > Length(S) then
    begin
      Result := '';
      Exit;
    end;
    Result := Result + Copy(S, 2, L) + '.';
    Delete(S, 1, L + 1);
  end;
  if Copy(Result, Length(Result), 1) = '.' then
    Delete(Result, Length(Result), 1);
end;

function GetActualEmailAddress(Parm, Command: AnsiString): AnsiString;
var
  Colon, Quote: Integer;

begin
  // posibilities are:
  // [cmd]:<mailadrress>
  // [cmd] :<mailadrress>
  // [cmd]: <mailadrress>
  // [cmd] : <mailadrress>
  // [cmd] <mailadrress>
  // [cmd]<mailadrress>
  // you can also have "firstname lastname" in there also
  Quote := CharPos('"', Parm);
  if Quote > 0 then
  begin
    if CharPos('>', Parm) > Quote then
    begin
      Delete(Parm, 1, Quote);
      Delete(Parm, 1, CharPos('"', Parm));
    end
    else
    begin
      Colon := PosLastChar('"', Parm);
      Delete(Parm, Quote, Colon - Pred(Quote));
    end;
  end;
  // check if space, if so let remove everything before
  Trim(Parm);
  // ok now possibilities are:
  // [cmd]:<mailadrress>
  // :<mailadrress>
  // : <mailadrress>
  // [cmd]<mailadrress>
  Colon := CharPos(':', Parm);
  // check if colon, if so let remove everything before
  if Colon > 0 then
    Delete(Parm, 1, Colon);
  // ok now possibilities are:
  //  <mailadrress>
  // [cmd]<mailadrress>
  // now let check if we have a command
  if lowercase(copy(parm, 1, length(command))) = lowercase(command) then
    delete(Parm, 1, length(command));
  // we trim to make sure we dont have any space left in there
  Parm := Trim(Parm);
  // and return the result with no brackets
  Result := NoAngleBrackets(Parm);
end;

///////////////////////////////////////////////////////////////////////////////
// Date and/or Time Routines
///////////////////////////////////////////////////////////////////////////////

function DayOfTheYear(const DT: TDateTime): Integer;
var
  J, Y: Word;

begin
  DecodeDate(DT, Y, J, J);
  Result := Trunc(DT) - Trunc(EncodeDate(Y, 1, 1)) + 1;
end;

function DaysLeftThisYear(const DT: TDateTime): Integer;
var
  J, Y: Word;

begin
  DecodeDate(DT, Y, J, J);
  case IsLeapYear(Y) of
    True: Result := 366 - DayOfTheYear(DT);
    False: Result := 365 - DayOfTheYear(DT);
  end;
end;

function DaysThisMonth(const DT: TDateTime): Integer;
var
  J, M, Y: Word;

begin
  DecodeDate(DT, Y, M, J);
  case M of
    2:
      if IsLeapYear(Y) then
        Result := 29
      else
        Result := 28;
    4, 6, 9, 11: Result := 30;
  else
    Result := 31;
  end;
end;

function DaysLeftThisMonth(const DT: TDateTime): Integer;
var
  J, M, Y: Word;

begin
  DecodeDate(DT, Y, M, J);
  case M of
    2:
      if IsLeapYear(Y) then
        Result := 29
      else
        Result := 28;
    4, 6, 9, 11: Result := 30;
  else
    Result := 31;
  end;
  Result := Result - J;
end;

function IsTimeAM(const DT: TDateTime): Boolean;
begin
  Result := Frac(DT) < 0.5;
end;

function IsTimePM(const DT: TDateTime): Boolean;
begin
  Result := Frac(DT) > 0.5;
end;

function IsTimeNoon(const DT: TDateTime): Boolean;
begin
  Result := Frac(DT) = 0.5;
end;

function IsTimeMidnight(const DT: TDateTime): Boolean;
begin
  Result := Frac(DT) = 0.0;
end;

function DateTimeToGMT(const DT: TDateTime): TDateTime;
begin
  Result := DT + LocalTimeZoneBias / 1440;
end;

function DateTimeToLocal(const DT: TDateTime): TDateTime;
begin
  Result := DT - LocalTimeZoneBias / 1440;
end;

function IsLeapYear(const Year: Word): Boolean;
begin
  Result := ((Year and 3) = 0) and ((Year mod 100 > 0) or (Year mod 400 = 0));
end;

function LocalTimeZoneBias: Integer;
{$IFDEF LINUX}
var
  TV: TTimeval;
  TZ: TTimezone;

begin
  gettimeofday(TV, TZ);
  Result := TZ.tz_minuteswest;
end;
{$ELSE}
var
  TimeZoneInformation: TTimeZoneInformation;
  Bias: Longint;

  begin
    case GetTimeZoneInformation(TimeZoneInformation) of
      TIME_ZONE_ID_STANDARD: Bias := TimeZoneInformation.Bias + TimeZoneInformation.StandardBias;
      TIME_ZONE_ID_DAYLIGHT: Bias := TimeZoneInformation.Bias + ((TimeZoneInformation.DaylightBias div 60) * -100);
    else
      Bias := TimeZoneInformation.Bias;
    end;
    Result := Bias;
  end;
  {$ENDIF}

function TimeZone: AnsiString;
{$IFDEF LINUX}
begin
  Result := ShortTimeZone;
end;
{$ELSE}
var
  lpTimeZoneInfo: TTimeZoneInformation;

  begin
    Result := '';
    if GetTimeZoneInformation(lpTimeZoneInfo) = TIME_ZONE_ID_STANDARD then
      {$IFDEF VER90}
      Result := WideCharToString({@}Pointer(lpTimeZoneInfo.StandardName))
        {$ELSE}
      Result := lpTimeZoneInfo.StandardName
        {$ENDIF}
    else
      if GetTimeZoneInformation(lpTimeZoneInfo) = TIME_ZONE_ID_DAYLIGHT then
      {$IFDEF VER90}
      Result := WideCharToString({@}Pointer(lpTimeZoneInfo.DaylightName));
    {$ELSE}
    Result := lpTimeZoneInfo.DaylightName;
    {$ENDIF}
  end;
  {$ENDIF}

function ShortTimeZone: Ansistring;
{$IFDEF LINUX}
var
  T: TTime_T;
  UT: TUnixTime;
begin
  __time(@T);
  localtime_r(@T, UT);
  Result := PChar(UT.__tm_zone);
end;
{$ELSE}
var
  TPos: Integer;

  begin
    Result := TimeZone;
    TPos := 1;
    while TPos <= Length(Result) do
      if not (Result[TPos] in ['A'..'Z']) then
        Delete(Result, TPos, 1)
      else
        Inc(TPos);
  end;
  {$ENDIF}

function TimeZoneBias: Ansistring;
begin
  Result := IntToStr(LocalTimeZoneBIAS);
  while Length(Result) < 4 do
    Result := '0' + Result;
  if IsNumeric(Result[1]) then
    Result := '-' + Result;
end;

function ToUnixSlashes(const S: AnsiString): AnsiString;
{.$IFNDEF ASM8086}
var
  Loop: Integer;
  MaxLoop: Integer;

begin
  Result := S;
  MaxLoop := Length(Result);
  for Loop := 1 to MaxLoop do
    if Result[Loop] = '\' then
      Result[Loop] := '/';
end;
(*
{$ElSE}
Var
   LenOfResult:Integer;
   FirstChar:Pointer;

Begin
   Result:=S;
   LenOfResult:=Length(Result);
   If LenOfResult<1 then Exit;
   FirstChar:=Pointer(Result);
asm
   push ESI
   mov  ESI, FirstChar;
   mov  ECX, LenOfResult
@Loop:
   mov  Al, [ESI]
   cmp  Al, '\'
   jne  @NoChange
   mov  Al, '/'
   mov  [ESI], Al
@NoChange:
   Inc  ESI
   Dec  ECX
   jnz  @Loop
   pop  ESI
end;
End;
{$ENDIF}
*)

function ToDOSSlashes(const S: AnsiString): AnsiString;
{.$IFNDEF ASM8086}
var
  Loop: Integer;
  MaxLoop: Integer;

begin
  Result := S;
  MaxLoop := Length(Result);
  for Loop := 1 to MaxLoop do
    if Result[Loop] = '/' then
      Result[Loop] := '\';
end;
(*
{$ElSE}
Var
   LenOfResult:Integer;
   FirstChar:Pointer;

Begin
   Result:=S;
   LenOfResult:=Length(Result);
   If LenOfResult<1 then Exit;
   FirstChar:=Pointer(Result);
asm
   push ESI
   mov  ESI, FirstChar;
   mov  ECX, LenOfResult
@Loop:
   mov  Al, [ESI]
   cmp  Al, '/'
   jne  @NoChange
   mov  Al, '\'
   mov  [ESI], Al
@NoChange:
   Inc  ESI
   Dec  ECX
   jnz  @Loop
   pop  ESI
end;
End;
{$ENDIF}
*)

function ToOSSlashes(const S: AnsiString): AnsiString;
begin
  {$IFDEF LINUX}
  Result := ToUnixSlashes(S);
  {$ELSE}
  Result := ToDOSSlashes(S);
  {$ENDIF}
end;

(******************************************************************************
CHANGEDIR: {Rewritten to call Windows.API for the result!}
          The GetFullPathName function merges the name of the current drive and
          directory with the specified filename to determine the full path and
          filename of the specified file. It also calculates the address of the
          filename portion of the full path and filename. This function does not
          verify that the resulting path and filename are valid or that they
          refer to an existing file on the associated volume.
******************************************************************************)

function ChangeDir(const S, RP: AnsiString): AnsiString;
{$IFDEF LINUX}
begin
  Result := ''; // redesign
end;
{$ELSE}
var
  FileName: AnsiString;
  FName: PChar;
  Buffer: array[0..MAX_PATH - 1] of Char;

  begin
    FileName := ToDOSSlashes(S + RP);
    SetString(Result, Buffer, GetFullPathName(PChar(FileName), SizeOf(Buffer),
      Buffer, FName));
  end;
  {$ENDIF}

function DateTimeToGMTRFC822(const DT: TDateTime): AnsiString;
begin
  Result := FormatDateTime('ddd, dd mmm yyyy hh:nn:ss', DateTimeToGMT(DT)) + ' GMT';
end;

function DateTimeToGMTRFC850(const DT: TDateTime): AnsiString;
begin
  Result := FormatDateTime('dddd, dd-mmm-yy hh:nn:ss', DateTimeToGMT(DT)) + ' GMT';
end;

function DateTimeToRFC850(const DT: TDateTime): AnsiString;
begin
  Result := FormatDateTime('dddd, dd-mmm-yy hh:nn:ss', DT) + #32 + ShortTimeZone;
end;

function DateTimeToRFC850Bias(const DT: TDateTime): AnsiString;
begin
  Result := FormatDateTime('ddd, dd mmm yyyy hh:nn:ss', DT) + #32 + TimeZoneBias;
end;

function RFCToDateTime(S: Ansistring): TDateTime;
var
  M, D, Y: Word;
  H, N, Sc, T: Word;
  Ch, CHtag: AnsiChar;
  Ts: AnsiString;
  PosCh: integer;

begin
  posch := CharPos(';', S);
  if posch > 0 then
    delete(s, posCH, length(s) - posCh + 1);
  T := 0;
  Ch := S[3];
  S := Uppercase(S);
  if Ch = #32 then
  begin
    Delete(S, 1, 4);
    Ts := Copy(S, 1, CharPos(#32, S) - 1);
    Delete(S, 1, Length(TS));
    S := Trim(S);
    M := QuickPos(TS, #32#32'JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC') div 3;
    Ts := Copy(S, 1, CharPos(#32, S) - 1);
    Delete(S, 1, Length(TS) + 1);
    S := Trim(S);
    try
      D := StrToInt(TS);
    except
      D := 1;
    end;
    Ch := S[3];
    if Ch <> ':' then
    begin
      Ts := Copy(S, 1, CharPos(#32, S) - 1);
      Delete(S, 1, Length(TS) + 1);
      S := Trim(S);
      try
        Y := StrToInt(TS);
      except
        DecodeDate(Now, Y, T, T);
        T := 0;
      end;
    end;
    Ts := Copy(S, 1, CharPos(':', S) - 1);
    Delete(S, 1, Length(TS) + 1);
    S := Trim(S);
    try
      H := StrToInt(TS);
    except
      H := 0;
    end;
    Ts := Copy(S, 1, 2);
    Delete(S, 1, Length(TS) + 1);
    S := Trim(S);
    try
      N := StrToInt(TS);
    except
      N := 0;
    end;
    Ts := Copy(S, 1, 2);
    Delete(S, 1, Length(TS) + 1);
    S := Trim(S);
    try
      Sc := StrToInt(TS);
    except
      Sc := 0;
    end;
    if S <> '' then
    begin
      Ch := S[1];
      if Ch in ['0'..'9'] then
      begin
        try
          Y := StrToInt(S);
        except
          DecodeDate(Now, Y, T, T);
          T := 0;
        end;
      end;
    end;
  end
  else
    if Ch = ',' then
  begin // RFC 822 or RFC 1123
    Delete(S, 1, CharPos(#32, S));
    S := Trim(S);
    Ts := Copy(S, 1, CharPos(#32, S) - 1);
    Delete(S, 1, Length(TS) + 1);
    S := Trim(S);
    try
      D := StrToInt(TS);
    except
      D := 1;
    end;
    Ts := Copy(S, 1, CharPos(#32, S) - 1);
    Delete(S, 1, Length(TS) + 1);
    S := Trim(S);
    M := QuickPos(TS, #32#32'JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC') div 3;
    Ts := Copy(S, 1, CharPos(#32, S) - 1);
    Delete(S, 1, Length(TS) + 1);
    S := Trim(S);
    try
      Y := StrToInt(TS);
    except
      DecodeDate(Now, Y, T, T);
      T := 0;
    end;
    Ts := Copy(S, 1, CharPos(':', S) - 1);
    Delete(S, 1, Length(TS) + 1);
    S := Trim(S);
    try
      H := StrToInt(TS);
    except
      H := 0;
    end;
    Ts := Copy(S, 1, 2);
    Delete(S, 1, Length(TS) + 1);
    S := Trim(S);
    try
      N := StrToInt(TS);
    except
      N := 0;
    end;
    Ts := Copy(S, 1, 2);
    Delete(S, 1, Length(TS) + 1);
    S := Trim(S);
    try
      Sc := StrToInt(TS);
    except
      Sc := 0;
    end;
  end
  else
  begin // RFC 850 or RFC 1036
    Delete(S, 1, CharPos(#32, S));
    S := Trim(S);
    chtag := '-';
    posCh := charpos(chtag, S);
    if (posCH > 0) and (posCh < 5) then
      chtag := '-'
    else
      chtag := ' ';
    Ts := Copy(S, 1, CharPos(chtag, S) - 1);
    Delete(S, 1, Length(TS) + 1);
    S := Trim(S);
    try
      D := StrToInt(TS);
    except
      D := 1;
    end;
    Ts := Copy(S, 1, CharPos(chtag, S) - 1);
    Delete(S, 1, Length(TS) + 1);
    S := Trim(S);
    M := QuickPos(TS, #32#32'JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC') div 3;
    Ts := Copy(S, 1, CharPos(#32, S) - 1);
    Delete(S, 1, Length(TS) + 1);
    S := Trim(S);
    try
      Y := StrToInt(TS);
    except
      DecodeDate(Now, Y, T, T);
      T := 0;
    end;
    Ts := Copy(S, 1, CharPos(':', S) - 1);
    Delete(S, 1, Length(TS) + 1);
    S := Trim(S);
    try
      H := StrToInt(TS);
    except
      H := 0;
    end;
    Ts := Copy(S, 1, 2);
    Delete(S, 1, Length(TS) + 1);
    S := Trim(S);
    try
      N := StrToInt(TS);
    except
      N := 0;
    end;
    Ts := Copy(S, 1, 2);
    Delete(S, 1, Length(TS) + 1);
    S := Trim(S);
    try
      Sc := StrToInt(TS);
    except
      Sc := 0;
    end;
  end;
  if Y < 100 then
  begin
    DecodeDate(Now, Y, T, T);
  end;
  try
    Result := EncodeDate(Y, M, D) + EncodeTime(H, N, Sc, T);
  except
    result := now;
  end;
end;

procedure UNPACKTIME(const P: LONGINT; var DT: TDATETIME);
begin
  DT := FILEDATETODATETIME(P);
end;

procedure PACKTIME(var DT: TDATETIME; var P: LONGINT);
begin
  P := DATETIMETOFILEDATE(DT);
end;

function GetDosDate: LongInt;
begin
  Result := DATETIMETOFILEDATE(Now);
end;

function GetDOW: Word;
begin
  Result := DayOfWeek(Now);
end;

function TimeOut(const MyTime: Comp): Boolean;
begin
  Result := MyTime <= TimeCounter;
end;

function TimeCounter: Comp;
begin
  Result := TimeStampToMSecs(DateTimeToTimeStamp(Now));
end;

function AddBackSlash(const S: AnsiString): AnsiString;
begin
  Result := S;
  if Copy(Result, Length(Result), 1) <> '\' then
    Result := Result + '\';
end;

function NoBackSlash(const S: AnsiString): AnsiString;
var
  I: Integer;

begin
  Result := S;
  I := Length(S);
  if I > 0 then
    if Result[I] = '\' then
      Delete(Result, Length(Result), 1);
end;

{$IFDEF VER100}

function StringReplace(const S, OldPattern, NewPattern: AnsiString;
  Flags: TReplaceFlags): AnsiString;
var
  SearchStr, Patt, NewStr: AnsiString;
  Offset: Integer;
begin
  if rfIgnoreCase in Flags then
  begin
    SearchStr := AnsiUpperCase(S);
    Patt := AnsiUpperCase(OldPattern);
  end
  else
  begin
    SearchStr := S;
    Patt := OldPattern;
  end;
  NewStr := S;
  Result := '';
  while SearchStr <> '' do
  begin
    {$IFDEF VER90}
    Offset := Pos(Patt, SearchStr);
    {$ELSE}
    Offset := AnsiPos(Patt, SearchStr);
    {$ENDIF}
    if Offset = 0 then
    begin
      Result := Result + NewStr;
      Break;
    end;
    Result := Result + Copy(NewStr, 1, Offset - 1) + NewPattern;
    NewStr := Copy(NewStr, Offset + Length(OldPattern), MaxInt);
    if not (rfReplaceAll in Flags) then
    begin
      Result := Result + NewStr;
      Break;
    end;
    SearchStr := Copy(SearchStr, Offset + Length(Patt), MaxInt);
  end;
end;

procedure FreeAndNil(var Obj);
var
  Temp: TObject;

begin
  Temp := TObject(Obj);
  Pointer(Obj) := nil;
  Temp.Free;
end;
{$ENDIF}

function PCharLen(Str: PChar): integer;
{$IFDEF ASM8086}
asm
      MOV     EDX,7
      ADD     EDX,EAX                   { pointer+7 used in the end }
      PUSH    EBX                       { is necessary; even in your version}
      MOV     EBX,[EAX]                 { read first 4 bytes}
      ADD     EAX,4                     { increment pointer}
@L1:  LEA     ECX,[EBX-$01010101]       { subtract 1 from each byte}
      XOR     EBX,-1                    { invert all bytes}
      AND     ECX,EBX                   { and these two}
      MOV     EBX,[EAX]                 { read next 4 bytes}
      ADD     EAX,4                     { increment pointer}
      AND     ECX,80808080H             { test all sign bits}
      JZ      @L1                       { no zero bytes, continue loop}
      TEST    ECX,00008080H             { test first two bytes}
      JNZ     @L2                       { *was JNZ SHORT @L2*}
      SHR     ECX,16                    { not in the first 2 bytes}
      ADD     EAX,2
@L2:  SHL     CL,1                      { use carry flag to avoid a branch}
      POP     EBX                       { Likewise; see above}
      SBB     EAX,EDX                   { compute length}
end;
{$ELSE}
var
  p: ^cardinal;
  q: pchar;
  bytes, r1, r2: cardinal;
  begin
    p := pointer(tStr);
    repeat
      q := pchar(p^);
      r2 := cardinal({@}Pointer(q[-$01010101]));
      r1 := cardinal(q) xor $FFFFFFFF;
      bytes := r1 and r2;
      inc(p);
    until (bytes and $80808080) <> 0;
    result := integer(p) - integer(tStr) - 4;
    if (bytes and $00008080) = 0 then
    begin
      bytes := bytes shr 16;
      inc(result, 2);
    end;
    if (bytes and $80) = 0 then
      inc(result);
  end;
  {$ENDIF}

  {$IFDEF ASM8086}

function LRot16(X: Word; c: longint): Word; assembler;
asm
  mov ecx,&c
  mov ax,&X
  rol ax,cl
  mov &Result,ax
end;

function RRot16(X: Word; c: longint): Word; assembler;
asm
  mov ecx,&c
  mov ax,&X
  ror ax,cl
  mov &Result,ax
end;

function LRot32(X: DWord; c: longint): DWord; register; assembler;
asm
  mov ecx, edx
  rol eax, cl
end;

function RRot32(X: DWord; c: longint): DWord; register; assembler;
asm
  mov ecx, edx
  ror eax, cl
end;

function SwapDWord(X: DWord): DWord; register; assembler;
asm
  xchg al,ah
  rol  eax,16
  xchg al,ah
end;
{$ELSE}

function LRot16(X: Word; c: longint): Word;
begin
  LRot16 := (X shl c) or (X shr (16 - c));
end;

function RRot16(X: Word; c: longint): Word;
begin
  RRot16 := (X shr c) or (X shl (16 - c));
end;

function LRot32(X: DWord; c: longint): DWord;
begin
  LRot32 := (X shl c) or (X shr (32 - c));
end;

function RRot32(X: DWord; c: longint): DWord;
begin
  RRot32 := (X shr c) or (X shl (32 - c));
end;

function SwapDWord(X: DWord): DWord;
begin
  Result := (X shr 24) or ((X shr 8) and $FF00) or ((X shl 8) and $FF0000) or (X shl 24);
end;
{$ENDIF}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

function Center(S: AnsiString; MaxWidth: Integer): AnsiString;
var
  I: Integer;
  Ws: AnsiString;

begin
  if Length(S) mod 2 = 0 then
    Result := S
  else
    Result := S + #32;
  if Length(Result) >= MaxWidth then
    Exit;
  I := MaxWidth - Length(Result);
  if I mod 2 <> 0 then
  begin
    Result := Result + #32;
    Dec(I);
  end;
  if I > 0 then
  begin
    SetLength(Ws, I div 2);
    FillChar(Ws[1], I div 2, #32);
    Result := Ws + Result + Ws;
  end;
end;

function LeftJustifyCh(const S: AnsiString; const Ch: Char; const MaxLength: Integer): AnsiString;
begin
  if MaxLength < Length(S) then
  begin
    Result := Copy(S, 1, MaxLength);
    Exit;
  end;
  SetLength(Result, MaxLength);
  FillChar(Result[1], MaxLength, Ch);
  Move(S[1], Result[1], Min(MaxLength, Length(S)));
end;

function RightJustifyCh(const S: AnsiString; const Ch: Char; const MaxLength: Integer): AnsiString;
begin
  if MaxLength < Length(S) then
  begin
    Result := Copy(S, 1, MaxLength);
    Exit;
  end;
  SetLength(Result, MaxLength);
  FillChar(Result[1], MaxLength, Ch);
  Move(S[1], Result[MaxLength - Pred(Length(S))], Min(MaxLength, Length(S)));
end;

function EncodeTabs(S: AnsiString; TabSize: Byte): AnsiString;
var
  Ws: AnsiString;

begin
  Setlength(Ws, Tabsize);
  FillChar(Ws[1], TabSize, #32);
  Result := StringReplace(S, Ws, #9, [rfReplaceAll]);
end;

function DecodeTabs(S: AnsiString; TabSize: Byte): AnsiString;
var
  Ws: AnsiString;

begin
  Setlength(Ws, Tabsize);
  FillChar(Ws[1], TabSize, #32);
  Result := StringReplace(S, #9, Ws, [rfReplaceAll]);
end;

function Filter(S: AnsiString; CS: CharSet): AnsiString;
var
  Loop: Integer;

begin
  Result := '';
  for Loop := 1 to Length(S) do
  begin
    if not (S[Loop] in CS) then
    begin
      Result := Result + S[Loop];
    end;
  end;
end;

function SoundEx(S: AnsiString): AnsiString;
const
  Table: array[1..26] of AnsiChar = '.123.12..22455.12623.1.2.2';

var
  SoundString: AnsiString;
  I1: Integer;
  I2: Integer;
  isNum: boolean;
  Ch: AnsiChar;

begin
  Result := S;
  if S = '' then
    Exit;
  isNum := true;
  repeat
    Ch := UpCase(S[1]);
    if Ch > #64 then
      isNum := false
    else
      Delete(S, 1, 1);
  until (isNum = false) or (S = '');
  Result := S;
  if S = '' then
    Exit;
  //SoundString[0] := #255;
  SetLength(SoundString, 255);

  FillChar(SoundString[1], 255, '0');
  // Step 1: ASCII to Soundex
  for I1 := 1 to Length(S) - 1 do
  begin
    I2 := Ord(UpCase(S[I1 + 1])) - 64;
    if ((I2 < 1) or (I2 > 26)) then
      I2 := 1;
    SoundString[I1] := Table[I2];
  end;
  // Initialize for second pass
  I1 := 1;
  repeat
    while (SoundString[I1] = '.') do
      Delete(SoundString, I1, 1);
    while ((SoundString[I1] = SoundString[I1 + 1]) and (SoundString[I1] <> '0')) do
      Delete(SoundString, I1, 1);
    Inc(I1);
  until (SoundString[I1] = '0');
  Result := Ch + Copy(SoundString, 1, 3);
end;

function WildCompare(LookingFor, SourceStr: AnsiString): Boolean;
var
  Ws: AnsiString;
  MaxInputWord: Integer;
  MaxWild: Integer;
  cInput: Integer;
  cWild: Integer;
  HelpWild: AnsiString;
  LengthHelpWild: Integer;
  Q: Integer;

  function FindPart(helpwilds, input_word: AnsiString): integer;
  var
    Q1, Q2, Q3: Integer;
    Diff: Integer;

  begin
    Q1 := CharPos('?', helpwilds);
    if Q1 = 0 then
      Result := QuickPos(helpwilds, input_word)
    else
    begin
      Q3 := Length(helpwilds);
      Diff := Length(input_word) - Q3;
      if Diff < 0 then
      begin
        Result := 0;
        Exit;
      end;
      for Q1 := 0 to Diff do
      begin
        for Q2 := 1 to Q3 do
        begin
          if (input_word[Q1 + Q2] = helpwilds[Q2]) or
            (helpwilds[Q2] = '?') then
          begin
            if Q2 = Q3 then
            begin
              Result := Q1 + 1;
              Exit;
            end;
          end
          else
            Break;
        end;
      end;
      Result := 0;
    end;
  end;

  function SearchNext(var WildS: AnsiString): Integer;
  begin
    Result := CharPos('*', WildS);
    if Result <> 0 then
      WildS := Copy(WildS, 1, Result - 1);
  end;

begin
  Ws := LookingFor;
  while CharPos('%', Ws) > 0 do
    Ws[CharPos('%', Ws)] := '*';
  while QuickPos('**', Ws) > 0 do
    Delete(Ws, QuickPos('**', Ws), 1);
  MaxInputWord := Length(SourceStr);
  MaxWild := Length(Ws);
  cInput := 1;
  cWild := 1;
  Result := True;
  repeat
    if SourceStr[cInput] = Ws[cWild] then
    begin
      inc(cWild);
      inc(cInput);
      continue;
    end
    else
      if Ws[cWild] = '?' then
    begin
      inc(cWild);
      inc(cInput);
      continue;
    end
    else
      if Ws[cWild] = '*' then
    begin
      HelpWild := Copy(Ws, cWild + 1, MaxWild);
      q := SearchNext(HelpWild);
      LengthHelpWild := Length(HelpWild);
      if Q = 0 then
      begin
        if HelpWild = '' then
          Exit;
        for Q := 0 to LengthHelpWild - 1 do
          if (HelpWild[LengthHelpWild - Q] <> SourceStr[MaxInputWord - Q]) and
            (HelpWild[LengthHelpWild - Q] <> '?') then
          begin
            Result := False;
            Exit;
          end;
        Exit;
      end;
      Inc(cWild, 1 + LengthHelpWild);
      Q := FindPart(HelpWild, Copy(SourceStr, cInput, Length(SourceStr)));
      if Q = 0 then
      begin
        Result := False;
        Exit;
      end;
      cInput := Q + LengthHelpWild;
      Continue;
    end;
    Result := False;
    Exit;
  until (cInput > MaxInputWord) or (cWild > MaxWild);
  if cInput <= MaxInputWord then
    Result := False
  else
    if cWild <= MaxWild then
    Result := False;
end;

function SizeStamp(CPS: Integer): AnsiString;
begin
  if CPS < 1024 then
    Result := IntToStr(CPS) + 'bps'
  else
    if CPS < 1024000 then
    Result := IntToStr(CPS div 1024) + 'kbps'
  else
    if CPS < 1024000000 then
    Result := IntToStr(CPS div 1024000) + 'mbps'
  else
    Result := IntToStr(CPS div 1024000000) + 'gbps';
end;

procedure DivMod(Dividend: Integer; Divisor: Word;
  var Result, Remainder: Word);
asm
   PUSH    EBX
   MOV     EBX,EDX
   MOV     EDX,EAX
   SHR     EDX,16
   DIV     BX
   MOV     EBX,Remainder
   MOV     [ECX],AX
   MOV     [EBX],DX
   POP     EBX
end;

function GetUserName: AnsiString;
var
  N: DWord;
  Buf: array[0..1023] of {$IFDEF LEVEL12}WideChar{$ELSE}Char{$ENDIF};
begin
  N := SizeOf(Buf) - 1;
  Windows.GetUserName(Buf, N);
  Result := PChar(@Buf[0]);
end;

function GetComputerName: AnsiString;
var
  N: DWORD;
  Buf: array[0..16] of {$IFDEF LEVEL12}WideChar{$ELSE}Char{$ENDIF};
begin
  N := SizeOf(Buf) - 1;
  Windows.GetComputerName(Buf, N);
  Result := PChar(@Buf[0]);
end;

function GetAbsoluteFileName(CurrentDir, RelativeName: AnsiString): AnsiString;

  function IncPtr(P: Pointer; Delta: Longint): Pointer; register;
  asm
   add   eax, edx
  end;

  function IsAbsoluteFileName(FileName: AnsiString): Boolean;
  var
    P: PWord;
  begin
    P := PWord(PChar(FileName));
    Result := P^ = $5C5C; // Network name
    if not Result then
    begin
      P := IncPtr(P, 1);
      Result := P^ = $5C3A; // Local name
    end;
  end;

  procedure RemoveLastSubDir(var Dir: AnsiString);
  var
    P: Longint;
  begin
    P := Length(Dir);
    while (P > 0) and (Dir[P] <> '\') do
      Dec(P);
    if P = 0 then
      Dir := ''
    else
      Dir := Copy(Dir, 1, P - 1);
  end;

  function FindDots(Name: AnsiString; var P: Longint): Longint;
  var
    Ptr: PInteger;
  begin
    Ptr := IncPtr(PChar(Name), P);
    while (P >= 0) and ((Ptr^ and $00FFFFFF) <> $5C2E2E) do
    begin
      Dec(P);
      Ptr := IncPtr(Ptr, -1);
    end;
    Inc(P);
    Result := P;
  end;

var
  Drive: AnsiString;

begin
  if IsAbsoluteFileName(RelativeName) then
    Result := RelativeName
  else
  begin
    if Copy(CurrentDir, Length(CurrentDir), 1) = '\' then
      Delete(CurrentDir, Length(CurrentDir), 1);
    if Copy(RelativeName, 1, 1) = '\' then
      Delete(RelativeName, 1, 1);
    Drive := ExtractFileDrive(CurrentDir);
    Delete(CurrentDir, 1, Length(Drive) + 1);
    Result := IncludeTrailingBackslash(Drive + '\' + CurrentDir) + RelativeName;
  end;
end;

function GetTempDirectory: AnsiString;
var
  Buf: array[0..MAX_PATH - 1] of AnsiChar;
begin
  GetTempPath(SizeOf(Buf), @Buf);
  Result := IncludeTrailingBackslash(PChar(@Buf));
end;

function GetTempFile(const ThreeLetterPrefix: AnsiString): AnsiString;
var
  Buf: array[0..MAX_PATH - 1] of AnsiChar;
begin
  GetTempFileName(PChar(GetTempDirectory), PChar(ThreeLetterPrefix), 0, @Buf);
  Result := PChar(@Buf);
end;

function ConvertBase64ToBitmap(AStr: AnsiString): TBitmap;
var
  str1{, str2}: AnsiString;
  strs1, strs2: TStringList;
  i: Integer;
begin
  strs1 := TStringList.Create;
  strs1.text := StringReplace(astr, '|', #13#10, [rfReplaceAll]);

  strs2 := TStringList.Create;
  strs2.text := StringReplace(strs1[5], '^', #13#10, [rfReplaceAll]);

  str1 := StringToBase64(strs2[4]);
  for i := 0 to Length(str1) - 1 do
  begin

  end;
end;

end.

