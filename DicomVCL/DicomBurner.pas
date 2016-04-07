{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DicomBurner;
{$I DEFINES.INC}
interface

uses
  Windows, Messages, SysUtils, Classes, forms,
  KxISOLib, KxStreamEx, Math, KxDrvLib, KxCache, KxConst,
  {KxISOBurner,}KxSPTI, Mmsystem;

type

  TRdStatus = (rdBegin, rdDataing, rdEnd);
  TOptimizProgressEvent = procedure(Sender: TObject; PercentDone: Smallint) of object;
  TRipDiskProgressEvent = procedure(Sender: TObject; Buffer: Pointer; BufLen,
    CurrentSector, PercentDone: Integer; RdStatus: TRdStatus) of object;

  TDevice_Status = (cr_Open, cr_Close);
  TFileAttributes = (fa_Normal, fa_Hidden, fa_AdvHidden, fa_All);
  TMediumType = (mt_185MB, mt_210MB, mt_650MB, mt_703MB, mt_791MB, mt_870MB,
    mt_1_4GB, mt_2_8GB, mt_3_95GB, mt_4_7GB, mt_8_5GB, mt_9_4GB);
  TISOLevelX = (ISOLevel01, ISOLevel02, ISOLevel_1999);
  TBootPlatformX = (btpPC80_86, btpPowerPC, btpMac);
  TBootImageTypeEmulationX = (biAuto, biNoEmulation, biFloppy1_20MB, biFloppy1_44MB, Floppy2_88MB, HardDisc);

  {$IFNDEF ACTIVEX}
  TAddFileEvent = procedure(Sender: TObject; const FullPath: AnsiString; var LongFileName, ShortFileName: AnsiString; var DateTime: TDateTime; Attr: Integer; FileSize: Int64; var Skip: Boolean) of object;
  {$ELSE}
  TAddFileEvent = procedure(Sender: TObject; const FullPath: AnsiString; var LongFileName, ShortFileName: AnsiString; var DateTime: TDateTime; Attr: Integer; FileSize: Integer; var Skip: Boolean) of object;
  {$ENDIF}
  TAddDirEvent = procedure(Sender: TObject; var LongName, ShortName: AnsiString; var Skip: Boolean) of object;
  TFileTestFailedEvent = procedure(Sender: TObject; const FullPath: AnsiString; var Stop: Boolean) of object;
  TWriteDoneEvent = procedure(Sender: TObject; Error: AnsiString) of object;

  TDicomThWrite = class(TThread)
  private
    fImageSize: Int64;
    fCacheSize: Integer;
    fSaveISO: Boolean;
  protected
    procedure Execute; override;
    property ImageSize: Int64 read fImageSize write fImageSize;
  end;

  TCnsCDBurner = class(TDicomSCSIDevice)
  private
    { Private declarations }
    fOnAddFile: TAddFileEvent;
    fOnAddDir: TAddDirEvent;
    fOnTestFileFails: TFileTestFailedEvent;

    //2008-08-18  ADD
    fOnOptimizProgress: TOptimizProgressEvent;
    fOnRipDiskProgress: TRipDiskProgressEvent;

    fMediumType: TMediumType;
    fIsoLevel: TISOLevelX;
    fBootPlatform: TBootPlatformX;
    fBootImageType: TBootImageTypeEmulationX;

    fIdVolume,
      fIdSystem,
      fIdVolumeSet,
      fIdPublisher,
      fIdPreparer,
      fIdApplication,
      fApplicationData2,
      fFileCopyright,
      fFileAbstract,
      fFileBibliographic: AnsiString;
    fDateCreation,
      fDateModification,
      fDateEffective,
      fDateExpiration: TDateTime;
    SettingsCanBeChanged,
      fParentDirectoryOnly,
      fJoliet: Boolean;
    fPrepared: Boolean;
    Depth: Integer;
    fBufferSize: Integer;
    fFilesSizeOnDisc: Int64;
    fStartAddress: Cardinal;
    BootCatalogLocation,
      BootImageLocation,
      BootImageSize,
      PathTableRecsLocationL,
      PathTableRecsLocationM,
      PathTableRecsLocationJL,
      PathTableRecsLocationJM,
      iPathTableSize,
      iPathTableSizeJ,
      FileDirDescriptorLocation,
      FileDirDescriptorLocationJ,
      iFileAndDirDescriptorWidth,
      iFileAndDirDescriptorWidthJ,
      fDataLocation: Integer;
    TotalNoOfSectors: Int64;
    fISOFileName: AnsiString;
    fRoot: PDirEntry;
    fOnWriteDone: TWriteDoneEvent;
    fOnFinalizingTrack: TNotifyEvent;
    fFinalizeTrack,
      fBootable,
      fReplaceFile,
      fWritePostGap,
      fPerformOPC,

    fNoUseLowerFile, //2008-08-18  ADD
    fNoUseISOVersionNumber,
      fUseDosCharset,
      fJolietExpand110, fOptimized: Boolean;

    fSessionToImport: Smallint;
    FFilesSize: Int64;
    fBootImage: AnsiString;
    impVD: TVolumeDescriptor;
    fImageSize,
      fBytesWritten: Int64;
    GetAddress, WithOldSession: Boolean;
    fMCDBVersion: AnsiString;
    WriteDoneError: AnsiString;
    fFileInProcess: AnsiString;
    BuildHeaderISOFile: Boolean;
    BuildHeaderTargetDir: PDirEntry;
    procedure WriteDoneEvent;

  protected
    { Protected declarations }
    FileDirDescriptorExtentStart, FileDirDescriptorExtentEnd: Cardinal;
    ISOHeader: TMemoryStream;
    CurrentFile: PFileEntry;
    fAborted: Boolean;
    //Pads: Int64;         //2008-08-18  DEL
  private
    { Private declarations }

    procedure New_D(var P: PDirEntry);
    procedure New_F(var P: PFileEntry);
    procedure SetFileAddress;
    function ImportSessionDirectoryJ(DirLocation, Size: Integer; DestinationDir: PDirEntry): Boolean;
    function ImportSessionDirectory(DirLocation, Size: Integer; DestinationDir: PDirEntry): Boolean;
    function GetNextWritableAddress: Boolean;
    function GetLastRecordedAddress: DWORD;
    function PathTableWidth: Integer;
    function PathTableWidthJ: Integer;
    function FileAndDirDescriptorWidth: Integer;
    function FileAndDirDescriptorWidthJ: Integer;
    function DoBurn(ISO: Boolean): Boolean;
    function GetDirsCount: Integer;
    function GetFilesCount: Integer;
    function GetImageSize: Int64;
    procedure WritePVD;
    procedure WriteJVD;
    procedure WriteTVD;
    procedure WriteBVD;
    procedure WriteBootCatalog;
    procedure WritePathTable(Start: Integer; Most: Boolean);
    procedure WritePathTableJ(Start: Integer; Most: Boolean);
    procedure WriteFileAndDirDescriptor_r(D: PDirEntry; Start, FileStart: Integer);
    procedure WriteFileAndDirDescriptor(Start, FileStart: Integer);
    procedure WriteFileAndDirDescriptorJ_r(D: PDirEntry; Start, FileStart: Integer);
    procedure WriteFileAndDirDescriptorJ(Start, FileStart: Integer);
    function WriteFiles: Boolean;
    procedure SetBufferSize(Value: Integer);
    procedure Print_Files(Files: PFileEntry);
    procedure SetMCDBVersion(Value: AnsiString);
    function MakeDir(DirName: AnsiString): PDirEntry;

    //2008-08-18  ADD
    function GetMediumSize(const Value: TMediumType): DWORD;
    procedure SetNoUseISOVersionNumber(const Value: Boolean);
    procedure DoOptimiz;
    procedure DoDebugMsg(Msg: AnsiString; mType: Byte);
  protected

  public
    { Pufblic declarations }
    procedure Print_D1;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Abort;

    //2008-1-1
    procedure ShowDeviceCaps;
    procedure ShowDeviceSetting;


    function Initialize: Boolean;
    //2008-08-18 ADD
    function ControlDeviceDoor(DriveLetter: AnsiChar; Status: TDevice_Status): Boolean;
    function SaveISOBootimageToDisk(ISOFileName, BootOutputFileName: AnsiString): Boolean;
    function RipDiskToISOImage(ISOFileName: AnsiString; BackupISO: Boolean = false): Boolean;
    function RipAudioTrack(TrackIndex: Integer; TracksOutPath: AnsiString): Boolean;
    function RipAllAudioTracks(TracksOutPath: AnsiString): Boolean;
    function GetFileSize(const FileName: AnsiString): Int64;
    function GetDirSize(Path: AnsiString): Int64;
    function StrToSpeed(SpeedStr: AnsiString): Word;
    function GetSupportWriteSpeedList(Strings: TStrings; DefaultItemIndex: Integer): Integer;

    function CreateDir(DestinationPath: PDirEntry; DirName: AnsiString; Attr: Integer = faDirectory): PDirEntry; overload;
    function CreateDir(DestinationPath: AnsiString; DirName: AnsiString): PDirEntry; overload;
    function CreateDir(DirName: AnsiString): PDirEntry; overload;
    function CreateDir(DestinationPath: PDirEntry; sr: TSearchRec): PDirEntry; overload;

    function MoveFile(DestinationPath, SourcePath: PDirEntry; SourceFile: PFileEntry): Boolean; overload;
    function MoveFile(DestinationPath, SourcePath, SourceFile: AnsiString): Boolean; overload;

    //2008-08-18  ADD
    function HiddenFileOrDir(SourceDir, SourceFileOrDir: AnsiString; IsDir: Boolean; FileAttributes: TFileAttributes): Boolean; overload;
    function HiddenFileOrDir(SourceDir: PDirEntry; SourceFileOrDir: AnsiString; IsDir: Boolean; FileAttributes: TFileAttributes): Boolean; overload;

    function RemoveFile(SourceDir: AnsiString; SourceFile: AnsiString): Boolean; overload;
    function RemoveFile(var SourceDir: PDirEntry; var SourceFile: PFileEntry): Boolean; overload;
    function RemoveDir(var SourceDir: PDirEntry): Boolean; overload;
    function RemoveDir(SourceDir: AnsiString): Boolean; overload;
    function RemoveEmptyDirs: Boolean;
    function ResetFilesArchiveBit: Boolean;
    function TestFiles: Boolean;
    function ResetAllFilesArchiveBit: Boolean;
    function RemoveDir_r(var SourceFile: PFileEntry): Boolean;

    function RenameFile(SourceDir, SourceFile: AnsiString; NewLongName, NewShortName: AnsiString): Boolean; overload;
    function RenameFile(SourceFile: PFileEntry; NewLongName, NewShortName: AnsiString): Boolean; overload;

    function InsertFile(DestinationPath: AnsiString; FilePath: AnsiString; SavePath: Boolean = false): Integer; overload;
    function InsertFile(DestinationPath: PDirEntry; sr: TSearchRec; FilePath: AnsiString; OrignalAddress: Integer = 0; ResetArchiveBit: Boolean = false): Integer; overload;
    function InsertFileWithName(DestinationPath: AnsiString; FilePath: AnsiString; ShortNameOnDisc, LongNameOnDisc: AnsiString): Integer;
    function InsertMemoryFile(DestinationPath, LongFileName, ShortFileName: AnsiString; Attr: Byte; Memory: Pointer; Size: Cardinal): Integer;

    function InsertDir(DestinationPath, SourcePath: AnsiString; FileSpecs: AnsiString = '*.*'; Attr: Integer = faAnyFile; Recursive: Boolean = True; SavePath: Boolean = false; ArchiveOnly: Boolean = false): Integer; overload;
    function InsertDir(DestinationPath: PDirEntry; SourcePath: AnsiString; FileSpecs: AnsiString = '*.*'; Attr: Integer = faAnyFile; Recursive: Boolean = True; SavePath: Boolean = false; ArchiveOnly: Boolean = false): Integer; overload;

    function FindFile(Dir: PDirEntry; FileName: AnsiString): PFileEntry;
    function FindDir(DirName: AnsiString): PDirEntry;

    function ExtractFile(FileToExtract: PFileEntry; TargetFile: AnsiString): Boolean;
    function BurnISOImage(ISOFileName: AnsiString): Boolean;
    function Prepare(ISOFile: Boolean = false; TargetDir: PDirEntry = nil): Boolean;
    function PrepareHeader(ISOFile: Boolean = false; TargetDir: PDirEntry = nil): Boolean;
    function BuildHeader(ISOFile: Boolean = false; TargetDir: PDirEntry = nil): Boolean;
    function PrepareCD: Boolean;
    function PrepareISO: Boolean;
    function BurnCD: Boolean;
    function SaveToISOFile(ISOFileName: AnsiString; BackupISO: Boolean = false; QuickSave: Boolean = false): Boolean;

    function ClearAll(Max_Files: Integer = 65535; Max_Dirs: Integer = 8191): Boolean;
    function BufferProgress: Integer;
    function ImportSession(SessionNo: ShortInt; DestinationDir: PDirEntry): Boolean;
    function GetDevice(Num: Byte): AnsiString;
    function DevicesFound: Byte; overload;
    property ApplicationData2: AnsiString read fApplicationData2 write fApplicationData2;
    property SessionToImport: Smallint read fSessionToImport write fSessionToImport;
    property RootDir: PDirEntry read fRoot;
    property BytesWritten: Int64 read fBytesWritten;
    property ImageSize: Int64 read GetImageSize;
    property DirsCount: Integer read GetDirsCount;
    property FilesCount: Integer read GetFilesCount;
    property FilesSize: Int64 read FFilesSize;
    property FileInProcess: AnsiString read fFileInProcess;
    property Bootable: Boolean read fBootable write fBootable default false;
    property ParentDirectoryOnly: Boolean read fParentDirectoryOnly write fParentDirectoryOnly default false;
    property BootImage: AnsiString read fBootImage write fBootImage;
    property Disc;
    property Devices;
    property DeviceName;
    property HostAdapters;
    property ErrorString;
    property DeviceCapabilities;
    property InquriyData;

  published
    { Published declarations }
    property ASPIInitialized;
    property DeviceMaxWriteSpeed;
    property DeviceMaxReadSpeed;
    property DeviceBufferSize;
    property DeviceFreeBufferSize;
    property UnderrunProtection;
    property DoDebug;
    property OnDeviceChange;
    property OnEraseDone;
    property ReadSpeed;
    property WriteSpeed;
    property Erasing;
    property FinalizeDisc;
    property TestWrite;
    property ReplaceFile: Boolean read fReplaceFile write fReplaceFile;
    property FinalizeTrack: Boolean read fFinalizeTrack write fFinalizeTrack default True;
    property PerformOPC: Boolean read fPerformOPC write fPerformOPC;
    property IdVolume: AnsiString read fIdVolume write fIdVolume;
    property IdSystem: AnsiString read fIdSystem write fIdSystem;
    property IdVolumeSet: AnsiString read fIdVolumeSet write fIdVolumeSet;
    property IdPublisher: AnsiString read fIdPublisher write fIdPublisher;
    property IdPreparer: AnsiString read fIdPreparer write fIdPreparer;
    property IdApplication: AnsiString read fIdApplication write fIdApplication;
    property FileCopyright: AnsiString read fFileCopyright write fFileCopyright;
    property FileAbstract: AnsiString read fFileAbstract write fFileAbstract;
    property FileBibliographic: AnsiString read fFileBibliographic write fFileBibliographic;
    property DateCreation: TDateTime read fDateCreation write fDateCreation;
    property DateModification: TDateTime read fDateModification write fDateModification;
    property DateEffective: TDateTime read fDateEffective write fDateEffective;
    property DateExpiration: TDateTime read fDateExpiration write fDateExpiration;
    property CacheSize: Integer read fBufferSize write SetBufferSize;
    property ISOFileName: AnsiString read fISOFileName write fISOFileName;
    property JolietFileSystem: Boolean read fJoliet write fJoliet default True;
    property OnAddFile: TAddFileEvent read fOnAddFile write fOnAddFile;
    property OnAddDir: TAddDirEvent read fOnAddDir write fOnAddDir;
    property OnWriteDone: TWriteDoneEvent read fOnWriteDone write fOnWriteDone;
    property OnFinalizingTrack: TNotifyEvent read fOnFinalizingTrack write fOnFinalizingTrack;
    property Version: AnsiString read fMCDBVersion write SetMCDBVersion;
    property WritePostGap: Boolean read fWritePostGap write fWritePostGap;

    //2008-08-18  ADD
    property OnOptimizProgress: TOptimizProgressEvent read fOnOptimizProgress write fOnOptimizProgress;
    property OnRipDiskProgress: TRipDiskProgressEvent read fOnRipDiskProgress write fOnRipDiskProgress;
    property NoUseLowerFile: Boolean read fNoUseLowerFile write fNoUseLowerFile;
    property NoUseISOVersionNumber: Boolean read fNoUseISOVersionNumber write SetNoUseISOVersionNumber;
    property MediumType: TMediumType read fMediumType write fMediumType;
    property BootImageType: TBootImageTypeEmulationX read fBootImageType write fBootImageType;
    property UseDosCharset: Boolean read fUseDosCharset write fUseDosCharset;
    property ISOLevel: TISOLevelX read fIsoLevel write fIsoLevel;
    property BootPlatform: TBootPlatformX read fBootPlatform write fBootPlatform;
    property JolietExpand110: Boolean read fJolietExpand110 write fJolietExpand110;
    property Optimized: Boolean read fOptimized write fOptimized;
  end;

//const
//  DefDateTime = '1899-12-30 00:00:00';

var
  fSuf: AnsiString; //2008-08-18  NoISOVersionNumber
  Buffer: array[0..253] of Byte;
  WriteBuffer: array[0..MaxWord * 100] of AnsiChar;
  vds: array[0..32 * 2048] of AnsiChar;
  vdsSize: Integer;
  IsPrev: Boolean = false;
  Valid: Boolean = True;
  ELen: Integer = 0;

  SessionToImport: ShortInt;
  QuickSaveISO: Boolean = false;
  ccEject, ccShowFiles, ccImportSession: Boolean;

  oArchiveFiles, oImportSession: Boolean;

implementation


{******************************************************************************}
uses KxASPI, KxDriverInfo, KxDeviceCaps;

const
  ZerosHeaderSize = 16;

var
  MCDBurner: TCnsCDBurner;
  ZEROS: array[0..DefaultSectorSize - 1] of AnsiChar; //2008-08-18  FIX
  F: file;
  WT: TDicomThWrite;
  Burning: Boolean = false;
  {******************************************************************************}
  {                                                                              }
  {******************************************************************************}
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.SetMCDBVersion(Value: AnsiString);
begin
  Value := Value;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.GetDevice(Num: Byte): AnsiString;
begin
  Result := Devices[Num];
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.DevicesFound: Byte;
begin
  Result := Devices.Count;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

constructor TCnsCDBurner.Create;
begin
  ISOHeader := TMemoryStream.Create;
  ISOHeader.SetSize(16777216 * 4);
  fWritePostGap := false;
  fNoUseLowerFile := True; //2008-08-18  ADD
  SetNoUseISOVersionNumber(True);
  fMediumType := mt_650MB;
  fBootImageType := biAuto;
  fIsoLevel := ISOLevel01;
  fBootPlatform := btpPC80_86;
  fJolietExpand110 := false;
  fOptimized := false;
  fDateCreation := now;//StrToDateTime(DefDateTime);
  fDateModification := fDateCreation;
  Initialize;
  SetBufferSize(4 * 1024 * 1024); // 4 MB
  fJoliet := True;
  fFinalizeTrack := True;
  fMCDBVersion := sVersion;
  UnderrunProtection := True;
  inherited;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.GetDirsCount: Integer;
begin
  Result := DirCounter - 1;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.GetFilesCount: Integer;
begin
  Result := FileCounter;
end;

function TCnsCDBurner.GetImageSize: Int64;
begin
  if fWritePostGap and (fImageSize < 300) then
    Result := 300
  else
    Result := fImageSize;
end;

{******************************************************************************}
{                                                                              }
{******************************************************************************}

destructor TCnsCDBurner.Destroy;
var
  I: Integer;
  D: PDirEntry;
  F: PFileEntry;
begin
  ISOHeader.Clear;
  ISOHeader.SetSize(16777216 * 4);
  for I := 0 to DirCounter - 1 do
  begin
    if Dirs[I] <> nil then
    begin
      D := Dirs[I];
      D.ShortName := '';
      D.LongName := '';
      D.Path := '';
      Dispose(Dirs[I]);
      Dirs[I] := nil;
    end;
  end;

  for I := 0 to FileCounter - 1 do
  begin
    if Files[I] <> nil then
    begin
      F := Files[I];
      F.Path := '';
      F.ShortName := '';
      F.LongName := '';
      Dispose(Files[I]);
      Files[I] := nil;
    end;
  end;
  ISOHeader.Free;
  inherited;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function LToMW(W: Word): Word;
begin
  Result := ((W shl 8) and $FF00) or ((W shr 8) and $00FF);
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.SetBufferSize(Value: Integer);
begin
  if Value < 2 * 1024 * 1024 then
    Value := 2 * 1024 * 1024;
  Value := Value div DefaultSectorSize;
  Value := Value * DefaultSectorSize;
  fBufferSize := Value;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.ClearAll(Max_Files, Max_Dirs: Integer): Boolean;
var
  I: Integer;
  D: PDirEntry;
  F: PFileEntry;
begin
  GetTimeZoneInformation(TimeZoneInformation);
  TimeZoneDiff := (-TimeZoneInformation.Bias div 15) {+ (-TimeZoneInformation.DaylightBias div 15)};
  ISOHeader.Clear;
  for I := 0 to DirCounter - 1 do
  begin
    if Dirs[I] <> nil then
    begin
      D := Dirs[I];
      D.ShortName := '';
      D.LongName := '';
      D.Path := '';
      Dispose(Dirs[I]);
      Dirs[I] := nil;
    end;
  end;
  for I := 0 to FileCounter - 1 do
  begin
    if Files[I] <> nil then
    begin
      F := Files[I];
      F.ShortName := '';
      F.LongName := '';
      F.Path := '';
      Dispose(Files[I]);
      Files[I] := nil;
    end;
  end;
  SetLength(Dirs, 0);
  SetLength(PathTable, 0);
  SetLength(PathTableJ, 0);
  SetLength(Files, 0);
  MaxDirs := Max_Dirs;
  MaxFiles := Max_Files;
  SetLength(Dirs, Max_Dirs);
  SetLength(PathTable, Max_Dirs);
  SetLength(PathTableJ, Max_Dirs);
  SetLength(Files, Max_Files);

  FFilesSize := 0;
  SettingsCanBeChanged := True;
  FileCounter := 0;
  DirCounter := 0;
  FillChar(ZEROS, DefaultSectorSize, 0);
  Depth := 1;
  New_D(fRoot);
  fRoot.Files := nil;
  fRoot.Path := '\';
  fRoot.ShortName := 'CD_ROOT';
  fRoot.LongName := 'CD Root Directory';
  if fNoUseLowerFile then //2008-08-18  ADD
    fRoot.LongName := UpperCase(fRoot.LongName);
  fRoot.Depth := Depth;
  fRoot.Parent := fRoot;
  Result := True;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.New_D(var P: PDirEntry);
begin
  if DirCounter >= MaxDirs then
  begin
    DebugMsg(Format('>>> ' + ERR_MAXDIRS, [MaxDirs]), mtNONFATALERROR);
    P := nil;
    Exit;
  end;
  New(P);
  P.Imported := false;
  P.Order := 0;
  Dirs[DirCounter] := P;
  PathTable[DirCounter] := P;
  PathTableJ[DirCounter] := P;
  Inc(DirCounter);
  SettingsCanBeChanged := false;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.New_F(var P: PFileEntry);
begin
  if FileCounter >= MaxFiles then
  begin
    DebugMsg(Format(ERR_MAXFILES, [MaxFiles]), mtNONFATALERROR);
    P := nil;
    Exit;
  end;
  New(P);
  Files[FileCounter] := P;
  Inc(FileCounter);
  P.Imported := false;
  P.Prev := false;
  P.SpaceReqOnDisc := 0;
  P.Buffer := nil;
  P.FileAttr := 0;
  P.CrcChecksum := $FFFFFFFF;
  P.SameID := 0;
  P.SameIndex := 0;
  SettingsCanBeChanged := false;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.WriteFiles: Boolean; //2008-08-18  FIX
  function WriteFile(P: PFileEntry): Boolean;
  var
    ChunkSize: Integer;
    BytesLeft, BytesToRead: Integer;
    NumRead, NumWritten: Integer;
    Buf: array[1..128 * 1024] of AnsiChar;
    Src: file;
    DataAddr: Integer;
    WrittenSize: Int64;
  begin
    Result := false;
    DataAddr := fDataLocation;
    if fBootable and (CompareText(P.Path, fBootImage) = 0) then
      Dec(DataAddr, BootImageSize);

    if (P.AddressJ + (DataAddr)) <> FilePos(F) div DefaultSectorSize then
    begin
      DebugMsg('>>> ' + ERR_4 + ' ' + P.Path + ' ' + IntToStr(P.AddressJ + (DataAddr)) + '<>' + IntToStr(FilePos(F) div 2048), mtFATALERROR);
      Exit;
    end;

    ChunkSize := 128 * 1024;
    FileMode := $0;
    try
      AssignFile(Src, P.Path);
      Reset(Src, 1);
      FileMode := $2;
      WrittenSize := 0;
      BytesLeft := P.FileSize;
      if P.FileSize <> 0 then
      begin
        repeat
          if ChunkSize > BytesLeft then
          begin
            BytesToRead := BytesLeft;
            FillChar(Buf[BytesToRead], ChunkSize - BytesLeft, 0);
          end
          else
            BytesToRead := ChunkSize;
          BlockRead(Src, Buf, BytesToRead, NumRead);
          BytesLeft := BytesLeft - BytesToRead;
          BlockWrite(F, Buf, Sectors(BytesToRead) * DefaultSectorSize, NumWritten);
          Inc(WrittenSize, NumRead);
        until (NumRead = 0) or (Sectors(BytesToRead) * DefaultSectorSize <> NumRead) or (BytesLeft = 0);
      end;
      CloseFile(Src);
      Result := WrittenSize = P.FileSize;
    except
      Result := false;
      Exit;
    end;
  end;
var
  I: Integer;
  Bp: PFileEntry;
  IsBp: Boolean;
begin
  Result := false;
  if fBootable then
  begin
    New(Bp);
    Bp.Path := fBootImage;
    Bp.FileSize := BootImageSize * DefaultSectorSize;
    Bp.Address := 0;
    Bp.AddressJ := Bp.Address;
    IsBp := WriteFile(Bp);
    Dispose(Bp);
    if not IsBp then
      Exit;
  end;

  for I := 0 to FileCounter - 1 do
    if ((Files[I].Attr and faDirectory) <> faDirectory) then
      if not WriteFile(Files[I]) then
        Exit;
  Result := True;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function FileAndDirDescriptorWidth_r(D: PDirEntry): Integer;
var
  l, W, Bytes: Integer;
  P: PFileEntry;
  FN: AnsiString;
begin
  P := D.Files;
  if (D.Files = nil) or (P.ShortName <> '.') then
  begin
    W := 68 + ELen + ELen;
    Bytes := DefaultSectorSize - W;
  end
  else
  begin
    Bytes := DefaultSectorSize;
    W := 0;
  end;
  while P <> nil do
  begin
    if (P.Attr and faDirectory <> faDirectory) then
      FN := P.ShortName + fSuf
    else
      FN := P.ShortName;
    l := Length(FN);
    if (FN = '.') or (FN = '..') then
      l := 1
    else
      if l mod 2 = 0 then
      l := l + 1;
    l := l + 33 + ELen;
    if Bytes - l < 0 then
    begin
      W := W + Bytes + l;
      Bytes := DefaultSectorSize - l;
    end
    else
    begin
      Bytes := Bytes - l;
      W := W + l;
    end;
    P := P.Next;
  end;
  W := W + Bytes;
  Result := Sectors(W) * DefaultSectorSize;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.FileAndDirDescriptorWidth: Integer;
var
  I: Integer;
  A, W, ww: Integer;
  D: PDirEntry;
begin
  ww := 0;
  A := 0;
  for I := 0 to DirCounter - 1 do
  begin
    D := Dirs[I];
    W := FileAndDirDescriptorWidth_r(D);
    ww := ww + W;
    D.Address := A;
    D.Size := W;
    A := A + W div DefaultSectorSize;
  end;
  Result := ww;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function SetExt(Buffer: PAnsiChar; Flag: Word; Ext: Boolean; Number: Byte): Boolean;
begin
  if (Flag and 2) = 2 then
    Buffer[5] :=AnsiChar( Chr(ELen + 127) )
  else
    if Ext then
    Buffer[5] := AnsiChar(Chr(ELen + 7))
  else
    Buffer[5] := AnsiChar(Chr(ELen - 1));
  Buffer[1] := #0;
  Buffer[2] := #0;
  Buffer[3] := #0;
  Buffer[4] := #0;
  Buffer[6] := AnsiChar(Chr(ELen + 71));
  Buffer[7] := AnsiChar(Chr(ELen + 74));
  Buffer[8] :=AnsiChar( Chr(ELen + 51));
  Buffer[9] := AnsiChar(Chr(Number));
  Buffer[10] := #0;
  Buffer[11] := #0;
  Buffer[12] := #0;
  Buffer[13] := #0;
  Buffer[14] := #0;
  if ((Flag and 2) = 2) or not Ext then
    Buffer[9] := #0;
  Result := True;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.WriteFileAndDirDescriptor_r(D: PDirEntry; Start, FileStart: Integer);
var
  l, ll, Bytes: Integer;
  P: PFileEntry;
  FN: AnsiString;
  FD: TDirectoryDescriptor;
begin
  ll := 0;
  P := D.Files;
  FillChar(FD, SizeOf(FD), 0);
  FD.FileUnitSize := 0;
  FD.InterleaveGap := 0;
  if (D.Files = nil) or (P.ShortName <> '.') then
  begin
    FD.LenDr := 34 + ELen;
    FD.FileName[0] := #0;
    FD.LenOfFileIdentifier := 1;
    FD.FileFlag := 2;
    FD.Address := D.Address + Start;
    FD.AddressBE := L2MDW(D.Address + Start);
    FD.DataLength := D.Size;
    FD.DataLengthBE := L2MDW(D.Size);
    FD.VolSeqnumber := 1;
    FD.VolSeqnumberBE := 256;
    SetDateTime(Now, FD);
    if ELen <> 0 then
      SetExt(@FD.FileName[0], FD.FileFlag, false, 0);
    ISOHeader.Write(FD, 34 + ELen);
    FD.FileName[0] := #1;
    FD.Address := D.Parent.Address + Start;
    FD.AddressBE := L2MDW(D.Parent.Address + Start);
    FD.DataLength := D.Parent.Size;
    FD.DataLengthBE := L2MDW(D.Parent.Size);
    if ELen <> 0 then
      SetExt(@FD.FileName[0], FD.FileFlag, false, 0);
    ISOHeader.Write(FD, 34 + ELen);
    Bytes := DefaultSectorSize - (68 + ELen + ELen);
  end
  else
  begin
    Bytes := DefaultSectorSize;
  end;
  while P <> nil do
  begin
    if P.Imported then
      FillChar(FD, SizeOf(FD), 0);
    if (P.Attr and faDirectory <> faDirectory) then
    begin
      FN := P.ShortName + fSuf;
      FD.FileFlag := 0;
      if not P.Imported then
      begin
        FD.Address := P.Address + FileStart;
        FD.AddressBE := L2MDW(P.Address + FileStart);
      end
      else
      begin
        FD.Address := P.Address;
        FD.AddressBE := L2MDW(P.Address);
      end;
      FD.DataLength := P.FileSize;
      FD.DataLengthBE := L2MDW(P.FileSize);
    end
    else
    begin
      FD.FileFlag := 2;
      FN := P.ShortName;
      FD.Address := P.Address + Start;
      FD.AddressBE := L2MDW(P.Address + Start);
      FD.DataLength := P.FileSize;
      FD.DataLengthBE := L2MDW(P.FileSize);
    end;
    l := Length(FN);
    if FN = '.' then
    begin
      l := 1;
      FD.FileName[0] := #0;
      FD.LenOfFileIdentifier := l;
    end
    else
      if FN = '..' then
    begin
      l := 1;
      FD.FileName[0] := #1;
      FD.LenOfFileIdentifier := l;
    end
    else
      if l mod 2 = 0 then
    begin
      CopyToArray(FN, FD.FileName, l);
      FD.FileName[l] := #0;
      FD.LenOfFileIdentifier := l;
      l := l + 1;
      ll := 0;
    end
    else
    begin
      CopyToArray(FN, FD.FileName, l);
      FD.LenOfFileIdentifier := l;
      ll := -1;
    end;

    if P.FileAttr <> 0 then //2008-08-21  FIX
      FD.FileFlag := P.FileAttr
    else
      if (P.Attr and faHidden = faHidden) then
      FD.FileFlag := FD.FileFlag or 1;

    l := l + 33 + ELen;
    if ELen <> 0 then
      SetExt(@FD.FileName[FD.LenOfFileIdentifier + ll], FD.FileFlag, P.Prev, 1);

    if Bytes - l < 0 then
    begin
      ISOHeader.Write(ZEROS, Bytes);
      Bytes := DefaultSectorSize - l;
    end
    else
    begin
      Bytes := Bytes - l;
    end;
    FD.Extended := 0;
    FD.LenDr := l;
    FD.VolSeqnumber := 1;
    FD.VolSeqnumberBE := 256;
    if (P.Attr and faDirectory <> faDirectory) and (P.FileSize = 0) then
    begin
      FD.Address := 0;
      FD.AddressBE := 0;
    end;
    SetDateTime(P.Time, FD);
    ISOHeader.Write(FD, l);
    P := P.Next;
  end;
  ISOHeader.Write(ZEROS, Bytes);
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.WriteFileAndDirDescriptor(Start, FileStart: Integer);
var
  I: Integer;
  D: PDirEntry;
begin
  for I := 0 to DirCounter - 1 do
  begin
    D := Dirs[I];
    WriteFileAndDirDescriptor_r(D, Start, FileStart);
  end;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function FileAndDirDescriptorWidthJ_r(D: PDirEntry): Integer;
var
  l, W, Bytes: Integer;
  P: PFileEntry;
  FN: AnsiString;
  wfn: WideString;
begin
  P := D.Files;
  if (D.Files = nil) or (P.LongName <> '.') then
  begin
    W := 68 + ELen + ELen;
    Bytes := DefaultSectorSize - W;
  end
  else
  begin
    Bytes := DefaultSectorSize;
    W := 0;
  end;
  while P <> nil do
  begin
    if (P.Attr and faDirectory <> faDirectory) then
      FN := P.LongName + fSuf
    else
      FN := P.LongName;
    wfn := FN;
    l := Length(wfn) * 2;
    if (FN = '.') or (FN = '..') then
      l := 1
    else
      if l mod 2 = 0 then
      l := l + 1;
    l := l + 33 + ELen;
    if Bytes - l < 0 then
    begin
      W := W + Bytes + l;
      Bytes := DefaultSectorSize - l;
    end
    else
    begin
      Bytes := Bytes - l;
      W := W + l;
    end;
    P := P.Next;
  end;
  W := W + Bytes;
  Result := Sectors(W) * DefaultSectorSize;

end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.FileAndDirDescriptorWidthJ: Integer;
var
  I: Integer;
  A, W, ww: Integer;
  D: PDirEntry;
begin
  ww := 0;
  A := 0;
  for I := 0 to DirCounter - 1 do
  begin
    D := Dirs[I];
    W := FileAndDirDescriptorWidthJ_r(D);
    ww := ww + W;
    D.AddressJ := A;
    D.SizeJ := W;
    A := A + W div DefaultSectorSize;
  end;
  Result := ww;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.WriteFileAndDirDescriptorJ_r(D: PDirEntry; Start, FileStart: Integer);
var
  l, ll, Bytes: Integer;
  P: PFileEntry;
  FN: AnsiString;
  wfn: WideString;
  FD: TDirectoryDescriptor;
begin
  ll := 0;
  FillChar(FD, SizeOf(FD), 0);
  P := D.Files;
  FD.FileUnitSize := 0;
  FD.InterleaveGap := 0;
  if (D.Files = nil) or (P.LongName <> '.') then
  begin
    FD.LenDr := 34 + ELen;
    FD.FileName[0] := #0;
    FD.LenOfFileIdentifier := 1;
    FD.FileFlag := 2;
    FD.Address := D.AddressJ + Start;
    FD.AddressBE := L2MDW(D.AddressJ + Start);
    FD.DataLength := D.SizeJ;
    FD.DataLengthBE := L2MDW(D.Size);
    FD.VolSeqnumber := 1;
    FD.VolSeqnumberBE := 256;
    SetDateTime(Now, FD);
    if ELen <> 0 then
      SetExt(@FD.FileName[0], FD.FileFlag, false, 0);
    ISOHeader.Write(FD, 34 + ELen);

    FD.FileName[0] := #1;
    FD.Address := D.Parent.AddressJ + Start;
    FD.AddressBE := L2MDW(D.Parent.AddressJ + Start);
    FD.DataLength := D.Parent.SizeJ;
    FD.DataLengthBE := L2MDW(D.Parent.Size);
    if ELen <> 0 then
      SetExt(@FD.FileName[0], FD.FileFlag, false, 1);
    ISOHeader.Write(FD, 34 + ELen);
    Bytes := DefaultSectorSize - (68 + ELen + ELen);
  end
  else
    Bytes := DefaultSectorSize;
  while P <> nil do
  begin
    FillChar(FD, SizeOf(FD), 0);
    if (P.Attr and faDirectory <> faDirectory) then
    begin
      FN := P.LongName + fSuf;
      FD.FileFlag := 0;
      if not P.Imported then
      begin
        FD.Address := P.AddressJ + FileStart;
        FD.AddressBE := L2MDW(P.AddressJ + FileStart);
      end
      else
      begin
        FD.Address := P.AddressJ;
        FD.AddressBE := L2MDW(P.AddressJ);
      end;
      FD.DataLength := P.FileSizeJ;
      FD.DataLengthBE := L2MDW(P.FileSizeJ);
    end
    else
    begin
      FD.FileFlag := 2;
      FN := P.LongName;
      FD.Address := P.AddressJ + Start;
      FD.AddressBE := L2MDW(P.AddressJ + Start);
      FD.DataLength := P.FileSizeJ;
      if P.dirRec.SizeJ <> P.FileSizeJ then
      begin
        //.. error
      end;
      FD.DataLengthBE := L2MDW(P.FileSizeJ);
    end;
    wfn := FN;
    l := Length(wfn) * 2;
    if FN = '.' then
    begin
      l := 1;
      FD.FileName[0] := #0;
      FD.LenOfFileIdentifier := l;
    end
    else
      if FN = '..' then
    begin
      l := 1;
      FD.FileName[0] := #1;
      FD.LenOfFileIdentifier := l;
    end
    else
      if l mod 2 = 0 then
    begin
      CopyToArrayW(FN, FD.FileName, l);
      FD.FileName[l] := #0;
      FD.LenOfFileIdentifier := l;
      l := l + 1;
      ll := 0;
    end
    else
    begin
      CopyToArrayW(FN, FD.FileName, l);
      FD.LenOfFileIdentifier := l;
      ll := -1;
    end;

    if P.FileAttr <> 0 then //2008-08-21  FIX
      FD.FileFlag := P.FileAttr
    else
      if (P.Attr and faHidden = faHidden) then
      FD.FileFlag := FD.FileFlag or 1;

    FD.LenDr := l + ELen;
    l := l + 33 + ELen;
    if ELen <> 0 then
      SetExt(@FD.FileName[FD.LenOfFileIdentifier + ll], FD.FileFlag, P.Prev, 1);

    if Bytes - l < 0 then
    begin
      ISOHeader.Write(ZEROS, Bytes);
      Bytes := DefaultSectorSize - l;
    end
    else
    begin
      Bytes := Bytes - l;
    end;
    FD.Extended := 0;
    if (l > 230) then
      l := l;
    FD.LenDr := l;
    FD.VolSeqnumber := 1;
    FD.VolSeqnumberBE := 256;
    SetDateTime(P.Time, FD);
    if (P.Attr and faDirectory <> faDirectory) and (P.FileSize = 0) then
    begin
      FD.Address := 0;
      FD.AddressBE := 0;
    end;
    ISOHeader.Write(FD, l);
    P := P.Next;
  end;
  ISOHeader.Write(ZEROS, Bytes);
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.WriteFileAndDirDescriptorJ(Start, FileStart: Integer);
var
  I: Integer;
  D: PDirEntry;
begin
  for I := 0 to DirCounter - 1 do
  begin
    D := Dirs[I];
    WriteFileAndDirDescriptorJ_r(D, Start, FileStart);
  end;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.PathTableWidthJ: Integer;
var
  I, Len, TotalLen: Integer;
  P: PDirEntry;
  wfn: WideString;
begin
  TotalLen := 10;
  for I := 1 to DirCounter - 1 do
  begin
    P := Dirs[I];
    wfn := P.LongName;
    Len := Length(wfn) * 2;
    if Len mod 2 <> 0 then
      Len := Len + 1;
    Len := Len + 8;
    TotalLen := TotalLen + Len;
  end;
  iPathTableSizeJ := TotalLen;
  Result := Sectors(TotalLen) * DefaultSectorSize;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.WritePathTableJ(Start: Integer; Most: Boolean);
var
  I, TotalLen, Len: Integer;
  P: PDirEntry;
  wfn: WideString;
  pt: TPathTableRecord;
begin
  TotalLen := 10;
  pt.Name[0] := #0;
  pt.Name[1] := #0;
  pt.ExtAttr := 0;
  if Most then
  begin
    pt.Address := L2MDW(Start);
    pt.ParentNumber := LToMW(1);
  end
  else
  begin
    pt.Address := Start;
    pt.ParentNumber := 1;
  end;
  pt.LenDI := 1;
  ISOHeader.Write(pt, 10);
  for I := 1 to DirCounter - 1 do
  begin
    P := PathTableJ[I];
    wfn := P.LongName;
    Len := Length(wfn) * 2;
    CopyToArrayW(P.LongName, pt.Name, Len);
    pt.LenDI := Len;
    if Len mod 2 <> 0 then
    begin
      Len := Len + 1;
      pt.Name[Len - 1] := #0;
    end;
    Len := Len + 8;
    if Most then
    begin
      pt.Address := L2MDW(P.AddressJ + Start);
      pt.ParentNumber := LToMW(P.Parent.Number);
    end
    else
    begin
      pt.Address := P.AddressJ + Start;
      pt.ParentNumber := P.Parent.Number;
    end;
    ISOHeader.Write(pt, Len);
    TotalLen := TotalLen + Len;
  end;
  if TotalLen - DefaultSectorSize <> 0 then
    ISOHeader.Write(ZEROS, DefaultSectorSize - (TotalLen mod DefaultSectorSize));
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.PathTableWidth: Integer;
var
  I, Len, TotalLen: Integer;
  P: PDirEntry;
begin
  TotalLen := 10;
  for I := 1 to DirCounter - 1 do
  begin
    P := Dirs[I];
    Len := Length(P.ShortName);
    if Len mod 2 <> 0 then
      Len := Len + 1;
    Len := Len + 8;
    TotalLen := TotalLen + Len;
  end;
  iPathTableSize := TotalLen;
  Result := Sectors(TotalLen) * DefaultSectorSize;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.WritePathTable(Start: Integer; Most: Boolean);
var
  I, TotalLen, Len: Integer;
  P: PDirEntry;
  pt: TPathTableRecord;
begin

  TotalLen := 10;
  pt.Name[0] := #0;
  pt.Name[1] := #0;
  pt.ExtAttr := 0;
  if Most then
  begin
    pt.Address := L2MDW(Start);
    pt.ParentNumber := LToMW(1);
  end
  else
  begin
    pt.Address := Start;
    pt.ParentNumber := 1;
  end;
  pt.LenDI := 1;
  ISOHeader.Write(pt, 10);
  for I := 1 to DirCounter - 1 do
  begin
    P := PathTable[I];
    Len := Length(P.ShortName);
    CopyToArray(P.ShortName, pt.Name, Len);
    pt.LenDI := Len;
    if Len mod 2 <> 0 then
    begin
      Len := Len + 1;
      pt.Name[Len - 1] := #0;
    end;
    Len := Len + 8;
    if Most then
    begin
      pt.Address := L2MDW(P.Address + Start);
      pt.ParentNumber := LToMW(P.Parent.Number);
    end
    else
    begin
      pt.Address := P.Address + Start;
      pt.ParentNumber := P.Parent.Number;
    end;
    ISOHeader.Write(pt, Len);
    TotalLen := TotalLen + Len;
  end;
  if TotalLen - DefaultSectorSize <> 0 then
    ISOHeader.Write(ZEROS, DefaultSectorSize - (TotalLen mod DefaultSectorSize));
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.SetFileAddress;
  procedure EnumFileAddr(Index: Integer);
  var
    J: Integer;
  begin
    for J := 0 to FileCounter - 1 do
      if (Files[J].Attr and faDirectory <> faDirectory) then
        if Files[J].SameID = 2 then
          if Files[J].SameIndex = Files[Index].SameIndex then
          begin
            Files[J].Address := Files[Index].Address;
            Files[J].AddressJ := Files[J].Address;
          end;
  end;

var
  I: Integer;
  P: PFileEntry;
begin
  fFilesSizeOnDisc := 0;
  for I := 0 to FileCounter - 1 do
  begin
    P := Files[I];
    if not P.Imported then
    begin
      if (P.Attr and faDirectory <> faDirectory) then
      begin
        if P.FileSize = 0 then
        begin
          P.FileSizeJ := 0;
          P.Address := 0;
          P.AddressJ := 0;
        end
        else
        begin
          P.FileSizeJ := P.FileSize;
          if P.SameID = 0 then
          begin
            P.Address := fFilesSizeOnDisc;
            P.AddressJ := P.Address;
          end;
        end;
      end
      else
      begin
        P.Address := P.dirRec.Address;
        P.AddressJ := P.dirRec.AddressJ;
        P.FileSize := P.dirRec.Size;
        P.FileSizeJ := P.dirRec.SizeJ;
      end;
      if (P.Attr and faDirectory <> faDirectory) then
      begin
        if P.Prev then
          fFilesSizeOnDisc := fFilesSizeOnDisc + Sectors2(P)
        else
        begin
          if P.SameID = 0 then
          begin
            fFilesSizeOnDisc := fFilesSizeOnDisc + Sectors(P.FileSize);
            if fOptimized then
              EnumFileAddr(I);
          end;
        end;
      end;
    end;
  end;
end;

{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.WritePVD;
var
  I: Integer;
  rd: PDirEntry;
  PVD: TVolumeDescriptor;
begin // 2008-08-18  FIX
  FillChar(PVD, SizeOf(PVD), 0);
  with PVD do
  begin
    pdType := 1;
    Identifier := 'CD001';
    Version := 1;
    VolumeFlag := 0;
    CopyToArray(UpperCase(fIdSystem), IdSystem, SizeOf(PVD.IdSystem));
    CopyToArray(UpperCase(fIdVolume), IdVolume, SizeOf(PVD.IdVolume));
    NoOfSectors := TotalNoOfSectors;
    NoOfSectorsBE := L2MDW(TotalNoOfSectors);
    {If fJoliet Then
    Begin
      EscapeChars[0] := '%';
      EscapeChars[1] := '/';
      EscapeChars[2] := '@';
    End;}
    VolSetSize := 1;
    VolSetSizeBE := 256;
    VolSeqnumber := 1;
    VolSeqnumberBE := 256;
    SectorSize := DefaultSectorSize;
    SectorSizeBE := LToMW(DefaultSectorSize);
    PathTableSize := iPathTableSize;
    PathTableSizeBE := L2MDW(iPathTableSize);
    Type1PathTable := PathTableRecsLocationL; // Path Table Records Location (Least)
    //Type1PathTableBE := L2MDW(PathTableRecsLocationL);
    TypeMPathTable := L2MDW(PathTableRecsLocationM); //Path Table Records Location (Most)
    TypeMPathTableBE := 0;
    rd := Dirs[0];
    RootDirRec.LenDr := 34;
    RootDirRec.Extended := 0;
    RootDirRec.Address := FileDirDescriptorLocation;
    RootDirRec.AddressBE := L2MDW(FileDirDescriptorLocation);
    RootDirRec.DataLength := rd.Size;
    RootDirRec.DataLengthBE := L2MDW(rd.Size);
    SetDateTime2(Now, RootDirRec);
    RootDirRec.FileFlag := 2;
    RootDirRec.VolSeqnumber := 1;
    RootDirRec.VolSeqnumberBE := 256;
    RootDirRec.LenOfFileIdentifier := 1;

    CopyToArray(UpperCase(fIdVolumeSet), IdVolumeSet, SizeOf(PVD.IdVolumeSet));
    CopyToArray(UpperCase(fIdPublisher), IdPublisher, SizeOf(PVD.IdPublisher));
    CopyToArray(UpperCase(fIdPreparer), IdPreparer, SizeOf(PVD.IdPreparer));
    CopyToArray(UpperCase(fIdApplication), IdApplication, SizeOf(PVD.IdApplication));
    CopyToArray(UpperCase(fFileCopyright), FileCopyright, SizeOf(PVD.FileCopyright));
    CopyToArray(UpperCase(fFileAbstract), FileAbstract, SizeOf(PVD.FileAbstract));
    CopyToArray(UpperCase(fFileBibliographic), FileBibliographic, SizeOf(PVD.FileBibliographic));
//    if fDateCreation <> 0 then
//      fDateCreation := Now;
//    if fDateModification <> 0 then
//      fDateModification := Now;
    CopyToArray(FormatDateTime('yyyymmddhhnnss00', fDateCreation), DateCreation, 17);
    CopyToArray(FormatDateTime('yyyymmddhhnnss00', fDateModification), DateModification, 17);
    CopyToArray('0000000000000000', DateExpiration, 16);
    CopyToArray('0000000000000000', DateEffective, 16);

    FileStructureVer := 1;
    //以下文件名称存在时对 Windows/Unix(31) 功能有效
    CopyToArray('ULTRAISO' + #0 + '0.0.0.0000', AppDataName, 19);
    MediumSize := GetMediumSize(fMediumType);
    if fIsoLevel = ISOLevel01 then
    begin
      ApplicationData[0] := Chr($0);
      ApplicationData[4] := Chr($1F);
    end
    else
      if fIsoLevel = ISOLevel02 then
    begin
      ApplicationData[0] := Chr($1); //0=DOS(8.3) 1=Windows/Unix(31)
      ApplicationData[4] := Chr($1F); //1F=Windows/Unix(31) DD=Max(221)
    end
    else
      if fIsoLevel = ISOLevel_1999 then
    begin
      ApplicationData[0] := Chr($1);
      ApplicationData[4] := Chr($DD);
    end;

    if not fNoUseLowerFile then
      ApplicationData[8] := Chr($1); //1=允许小写字母
    if fNoUseISOVersionNumber then
      ApplicationData[9] := Chr($1); //1=省略ISO9660版本号
    if fJoliet then
      ApplicationData[10] := Chr($1); //1=JolietFileSystem
    if fJolietExpand110 then
      ApplicationData[11] := Chr($1); //1=Joliet格式扩展110
    if fOptimized then
      ApplicationData[12] := Chr($1); //1=优化
    if UseDosCharset then
      ApplicationData[16] := Chr($1); // 1=启用DOS字符集

    for I := 20 to 116 do
      ApplicationData[I] := ' ';
    CopyToArray(UpperCase(fApplicationData2), ApplicationData2, 8);
    CopyToArray('', ApplicationData3, 107);
    ApplicationData3[107] := Chr($2F);
  end;
  ISOHeader.Write(PVD, SizeOf(PVD)); // First Copy
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.WriteJVD;
var
  I: Integer;
  rd: PDirEntry;
  JVD: TVolumeDescriptor;
begin // 2008-08-18  FIX
  FillChar(JVD, SizeOf(JVD), 0);
  with JVD do
  begin
    pdType := 2;
    Identifier := 'CD001';
    Version := 1;
    VolumeFlag := 0;
    CopyToArrayW(fIdSystem, IdSystem, SizeOf(JVD.IdSystem));
    CopyToArrayW(fIdVolume, IdVolume, SizeOf(JVD.IdVolume));
    NoOfSectors := TotalNoOfSectors;
    NoOfSectorsBE := L2MDW(TotalNoOfSectors);
    EscapeChars[0] := '%';
    EscapeChars[1] := '/';
    EscapeChars[2] := 'E';
    VolSetSize := 1;
    VolSetSizeBE := 256;
    VolSeqnumber := 1;
    VolSeqnumberBE := 256;
    SectorSize := DefaultSectorSize;
    SectorSizeBE := LToMW(DefaultSectorSize);
    PathTableSize := iPathTableSizeJ;
    PathTableSizeBE := L2MDW(iPathTableSizeJ);
    Type1PathTable := PathTableRecsLocationJL;
    TypeMPathTable := L2MDW(PathTableRecsLocationJM);
    TypeMPathTableBE := 0;
    rd := Dirs[0];
    RootDirRec.LenDr := 34;
    RootDirRec.Extended := 0;
    RootDirRec.Address := FileDirDescriptorLocationJ;
    RootDirRec.AddressBE := L2MDW(FileDirDescriptorLocationJ);
    RootDirRec.DataLength := rd.SizeJ;
    RootDirRec.DataLengthBE := L2MDW(rd.SizeJ);
    SetDateTime2(Now, RootDirRec);
    RootDirRec.FileFlag := 2;
    RootDirRec.VolSeqnumber := 1;
    RootDirRec.VolSeqnumberBE := 256;
    RootDirRec.LenOfFileIdentifier := 1;

    CopyToArrayW(fIdVolumeSet, IdVolumeSet, SizeOf(JVD.IdVolumeSet));
    CopyToArrayW(fIdPublisher, IdPublisher, SizeOf(JVD.IdPublisher));
    CopyToArrayW(fIdPreparer, IdPreparer, SizeOf(JVD.IdPreparer));
    CopyToArrayW(fIdApplication, IdApplication, SizeOf(JVD.IdApplication));
    CopyToArrayW(fFileCopyright, FileCopyright, SizeOf(JVD.FileCopyright));
    CopyToArrayW(fFileAbstract, FileAbstract, SizeOf(JVD.FileAbstract));
    CopyToArrayW(fFileBibliographic, FileBibliographic, SizeOf(JVD.FileBibliographic));

    CopyToArray(FormatDateTime('yyyymmddhhnnss00', fDateCreation), DateCreation, 17);
    CopyToArray(FormatDateTime('yyyymmddhhnnss00', fDateModification), DateModification, 17);
    CopyToArray('0000000000000000', DateExpiration, 16);
    CopyToArray('0000000000000000', DateEffective, 16);

    FileStructureVer := 1;
    //以下文件名称存在时对 Windows/Unix(31) 功能有效
    CopyToArray('ULTRAISO' + #0 + '0.0.0.0000', AppDataName, 19);
    MediumSize := GetMediumSize(fMediumType);
    if fIsoLevel = ISOLevel01 then
    begin
      ApplicationData[0] := Chr($0);
      ApplicationData[4] := Chr($1F);
    end
    else
      if fIsoLevel = ISOLevel02 then
    begin
      ApplicationData[0] := Chr($1); //0=DOS(8.3) 1=Windows/Unix(31)
      ApplicationData[4] := Chr($1F); //1F=Windows/Unix(31) DD=Max(221)
    end
    else
      if fIsoLevel = ISOLevel_1999 then
    begin
      ApplicationData[0] := Chr($1);
      ApplicationData[4] := Chr($DD);
    end;

    if not fNoUseLowerFile then
      ApplicationData[8] := Chr($1); //1=允许小写字母
    if fNoUseISOVersionNumber then
      ApplicationData[9] := Chr($1); //1=省略ISO9660版本号
    if fJoliet then
      ApplicationData[10] := Chr($1); //1=JolietFileSystem
    if fJolietExpand110 then
      ApplicationData[11] := Chr($1); //1=Joliet格式扩展110
    if fOptimized then
      ApplicationData[12] := Chr($1); //1=优化
    if fUseDosCharset then
      ApplicationData[16] := Chr($1); // 1=启用DOS字符集

    for I := 20 to 116 do
      ApplicationData[I] := ' ';
    CopyToArray(UpperCase(fApplicationData2), ApplicationData2, 8);
    CopyToArray('', ApplicationData3, 107);
    ApplicationData3[107] := Chr($2F);
  end;
  ISOHeader.Write(JVD, SizeOf(JVD));
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.WriteTVD;
var
  TVD: TVolumeDescriptor;
begin
  FillChar(TVD, SizeOf(TVD), 0);
  with TVD do
  begin
    pdType := 255;
    Identifier := 'CD001';
    Version := 1;
  end;
  ISOHeader.Write(TVD, SizeOf(TVD)); // Terminator Vol Descriptor Location
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.WriteBootCatalog;
var
  BootCatalog: TBootCatalog;
  tmp: array[0..$1F] of Byte;
  I: Integer;
  W: Word;
  t: Integer;
begin
  t := 0;
  FillChar(BootCatalog, SizeOf(BootCatalog), 0);
  with BootCatalog do
  begin
    Header := 1;
    //Developer := 'Magic CD/DVD Burner'#0#0#0#0#0; //留空
    KeyByte1 := $55;
    KeyByte2 := $AA;
    BootIndicator := $88;
    LoadSegment := $07C0;
    SectorCount := 1;
    SystemType := Integer(fBootPlatform);
    if fBootImageType = biAuto then
    begin
      if BootImageSize = 1 then //自动识别引导文件类型
      begin
        BootMediaType := 0; //2008-08-18  FIX
        SectorCount := 4;
      end
      else
        if BootImageSize = 600 then
        BootMediaType := 1
      else
        if BootImageSize = 720 then
        BootMediaType := 2
      else
        if BootImageSize = 1440 then
        BootMediaType := 3
      else
      begin
        BootMediaType := 4;
        SectorCount := 4;
      end;
    end
    else
    begin
      BootMediaType := Integer(fBootImageType) - 1;
      case BootMediaType of
        0, 4: SectorCount := 4;
        1, 2, 3: SectorCount := 1;
      end;
    end;
    LoadRBA := BootImageLocation;
  end;
  Move(BootCatalog, tmp, 32);
  I := 0;
  while I < 32 do
  begin
    Move(tmp[I], W, 2);
    t := t + W;
    Inc(I, 2);
  end;
  W := (MaxWord + 1) - Word(t);
  BootCatalog.Checksum := W;
  ISOHeader.Write(BootCatalog, SizeOf(BootCatalog));
end;

{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.WriteBVD;
var
  BVD: TBootVolumeDescriptor;
begin
  FillChar(BVD, SizeOf(BVD), 0);
  with BVD do
  begin
    pdType := 00;
    Identifier := 'CD001';
    Version := 1;
    Ident := 'EL TORITO SPECIFICATION'#0#0#0#0#0#0#0#0#0;
    BootCatLocation := BootCatalogLocation;
  end;
  ISOHeader.Write(BVD, SizeOf(BVD)); // Terminator
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function spc(s: AnsiString; I: Integer): AnsiString;
begin
  Result := Copy(s + '                                                                           ', 1, I);
end;

procedure TCnsCDBurner.Print_Files(Files: PFileEntry);
var
  I: Integer;
begin
  I := 0;
  while Files <> nil do
  begin
    Inc(I);
    if Files.Attr = faDirectory then
      DebugMsg(IntToDec(I, 3, ' ') + ' ' + spc(Files.LongName, 40) + '  <<dir>> ', mtMessage)
    else
      DebugMsg(IntToDec(I, 3, ' ') + ' ' + spc(Files.LongName, 40) + ' ' + IntToDec(Files.FileSize, 8, ' ') + '   ' + Files.Path, mtMessage);
    Files := Files.Next;
  end;
  DebugMsg(' ', mtMessage);

end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.Print_D1;
var
  I: Integer;
  P: PDirEntry;
begin
  for I := 0 to DirCounter - 1 do
  begin
    P := Dirs[I];
    DebugMsg('(' + IntToDec(I + 1, 2, ' ') + ') ' + P.Path, mtMessage);
    DebugMsg('------------------------------------------------------------------------------------------------------', mtMessage);
    if P.Files <> nil then
      Print_Files(P.Files)
  end;
  DebugMsg(' ', mtMessage);
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.Initialize;
begin
  Result := True;
  ClearAll;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.GetLastRecordedAddress;
var
  I: Integer;
begin
  for I := 32 downto 16 do
  begin
    FillChar(impVD, SizeOf(impVD), 0);
    if Read10(I, 1, @impVD, DefaultSectorSize) then
      with impVD do
        if (Identifier[1] = 'C') and (Identifier[2] = 'D') and (Identifier[3] = '0') and (Identifier[4] = '0') and (Identifier[5] = '1') then
          if (pdType = 2) or (pdType = 1) then
          begin
            Result := impVD.NoOfSectors;
            Exit;
          end;
  end;
  Result := 0;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.GetNextWritableAddress;
var
  OrgFin: Boolean;
  ti: Integer;
  dt: Byte;
begin
  fStartAddress := 0;
  WaitForReady(10000, 500);
  dt := DiscType;
  OrgFin := FinalizeDisc;
  FinalizeDisc := True;
  SetWriteParams(TestWrite, UnderrunProtection, FinalizeDisc, MediumIs);
  FinalizeDisc := OrgFin;
  WaitForReady(10000, 500);
  if (dt = mtDVD_RAM) or (dt = mtDVD_PLUSRW) then
  begin
    fStartAddress := GetLastRecordedAddress;
    Result := True;
    Exit;
  end;
  ReadDiscInformation;
  if (dt = mtDVD_RW_RO) or (dt = mtDVD_RW_SR) then
  begin
    Result := ReadTrackInformation(1);
    if Result then
    begin
      if TrackInformation.NextWritableAddress <> 0 then
        fStartAddress := TrackInformation.NextWritableAddress;
      Exit;
    end;
  end
  else
  begin
    ti := SessionsOnDisc + 1;
    Result := ReadTrackInformation(ti);
    if Result then
      fStartAddress := TrackInformation.NextWritableAddress
    else
      fStartAddress := 0;
  end;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.PrepareISO: Boolean;
begin
  Prepare(True, nil);
  Result := True;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.PrepareCD: Boolean;
begin
  Prepare(false, nil);
  Result := True;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.PrepareHeader(ISOFile: Boolean = false; TargetDir: PDirEntry = nil): Boolean;
var
  iCursor: Int64;
  I: Integer;
  P: PDirEntry;
  lp, Ln: Integer;
label
  SortAgain, SortAgainJ;
begin
  Valid := True;
  if not FileExists(fBootImage) then
  begin
    fBootable := false;
  end
  else
    if (fBootImage = '') then
    fBootable := false;
  //DoDebug := False;
  fStartAddress := 0;
  if not ISOFile then
  begin
    MediumIs := DiscType;
    if (GetAddress) then
    begin
      if not GetNextWritableAddress then
        DebugMsg('>>> ' + ERR_NEXTADRESS, mtUNKNOWN);
      if fStartAddress > $FF000000 then
        fStartAddress := 0;
    end;
    if (fSessionToImport <> 0) then
    begin
      ImportSession(fSessionToImport, TargetDir);
      WithOldSession := True;
    end
    else
      WithOldSession := false;
  end;
  DoDebugMsg(IntToStr(FileCounter) + ' Files Added to CD, now sorting', mtMessage);
  DoDebugMsg('Sorting .... ISO9660 LN-PN', mtMessage); /// Sort Path Table Record - 6.9.1
  SortLN(PathTable, DirCounter - 1, false);
  SortPN(PathTable, DirCounter - 1, false);
  DoDebugMsg('Sorting .... Joliet  LN-PN', mtMessage);
  SortLN(PathTableJ, DirCounter - 1, True);
  SortPN(PathTableJ, DirCounter - 1, True);
  SortAgain:
  DoDebugMsg('Sorting .... ISO9660', mtMessage);
  SortNumber(PathTable, DirCounter - 1);
  SortParent(PathTable, DirCounter - 1);
  SortNumber(PathTable, DirCounter - 1);
  SortPN(PathTable, DirCounter - 1, false);
  lp := 0;
  Ln := 0;
  for I := 1 to DirCounter - 1 do
  begin
    P := PathTable[I];
    if lp > P.Parent.Number then
      goto SortAgain;
    if Ln > P.Number then
      goto SortAgain;
    lp := P.Parent.Number;
    Ln := P.Number;
  end;
  SortAgainJ:
  DoDebugMsg('Sorting .... Joliet', mtMessage);
  SortNumber(PathTableJ, DirCounter - 1);
  SortParent(PathTableJ, DirCounter - 1);
  lp := 0;
  Ln := 0;
  for I := 0 to DirCounter - 1 do
  begin
    P := PathTableJ[I];
    if lp > P.Parent.Number then
      goto SortAgain;
    if Ln > P.Number then
      goto SortAgain;
    lp := P.Parent.Number;
    Ln := P.Number;
  end;
  //// ..........................................................................
  DoDebugMsg('Sorting .... Done', mtMessage);
  DoOptimiz;
  iCursor := fStartAddress + ZerosHeaderSize;
  iCursor := iCursor;
  DoDebugMsg(' Primary Volume Descriptor Location   :' + IntToDec(iCursor, 8) + '   0x' + IntToHex(iCursor * DefaultSectorSize, 8), mtMessage);
  if fBootable then
  begin
    iCursor := iCursor + 1;
    DoDebugMsg(' Boot Record    Descriptor Location   :' + IntToDec(iCursor, 8) + '   0x' + IntToHex(iCursor * DefaultSectorSize, 8), mtMessage);
  end;
  { iCursor := iCursor + DefaultSectorSize;  Prim2VDLocation := iCursor;
  DoDebugMsg(' Secondry Volume Descriptor Location  :'+IntToHex(iCursor, 8) + '   0x' + IntToHex(iCursor * DefaultSectorSize, 8), mtMESSAGE); }
  if fJoliet then
  begin
    iCursor := iCursor + 1;
    DoDebugMsg(' Joliet Volume Descriptor Location    :' + IntToDec(iCursor, 8) + '   0x' + IntToHex(iCursor * DefaultSectorSize, 8), mtMessage);
  end;
  iCursor := iCursor + 1;
  DoDebugMsg(' Terminator Vol Descriptor Location   :' + IntToDec(iCursor, 8) + '   0x' + IntToHex(iCursor * DefaultSectorSize, 8), mtMessage);

  if fBootable then
  begin //2008-08-18  ADD
    iCursor := iCursor + 1;
    BootImageSize := Sectors(GetFileSize(fBootImage));
    BootCatalogLocation := iCursor;
    DoDebugMsg(' Bootable Catalog Location            :' + IntToDec(iCursor, 8) + '   0x' + IntToHex(iCursor * DefaultSectorSize, 8), mtMessage);
  end;

  // XYZ-FS iCursor := iCursor + $0000;
  // DoDebugMsg(' XYZ-FS                            :' + IntToDex(iCursor, 8) + '   0x' + IntToHex(iCursor * DefaultSectorSize, 8), mtMessage);
  // .......................................................................................
  iCursor := iCursor + 1;
  PathTableRecsLocationL := iCursor;
  DoDebugMsg(' Path Table Records Location (Least)  :' + IntToDec(iCursor, 8) + '   0x' + IntToHex(iCursor * DefaultSectorSize, 8), mtMessage);
  PathTableWidth;
  iCursor := iCursor + Sectors(iPathTableSize);
  PathTableRecsLocationM := iCursor;
  DoDebugMsg(' Path Table Records Location (Most)   :' + IntToDec(iCursor, 8) + '   0x' + IntToHex(iCursor * DefaultSectorSize, 8), mtMessage);
  iCursor := iCursor + Sectors(iPathTableSize);
  PathTableRecsLocationJL := iCursor;
  if fJoliet then
  begin
    DoDebugMsg(' Path Table Records Location (Least) J:' + IntToDec(iCursor, 8) + '   0x' + IntToHex(iCursor * DefaultSectorSize, 8), mtMessage);
    PathTableWidthJ;
    iCursor := iCursor + Sectors(iPathTableSizeJ);
    PathTableRecsLocationJM := iCursor;
    DoDebugMsg(' Path Table Records Location (Most)  J:' + IntToDec(iCursor, 8) + '   0x' + IntToHex(iCursor * DefaultSectorSize, 8), mtMessage);
    iCursor := iCursor + Sectors(iPathTableSizeJ);
  end;
  FileDirDescriptorExtentStart := iCursor;
  FileDirDescriptorLocation := iCursor;
  DoDebugMsg(' File and Directory Record Location   :' + IntToDec(iCursor, 8) + '   0x' + IntToHex(iCursor * DefaultSectorSize, 8), mtMessage);
  iFileAndDirDescriptorWidth := FileAndDirDescriptorWidth;
  iCursor := iCursor + Sectors(iFileAndDirDescriptorWidth);
  if fJoliet then
  begin
    FileDirDescriptorLocationJ := iCursor;
    DoDebugMsg(' File and Directory Record Location  J:' + IntToDec(iCursor, 8) + '   0x' + IntToHex(iCursor * DefaultSectorSize, 8), mtMessage);
    iFileAndDirDescriptorWidthJ := FileAndDirDescriptorWidthJ;
    iCursor := iCursor + Sectors(iFileAndDirDescriptorWidthJ);
  end;
  FileDirDescriptorExtentEnd := iCursor;
  //----------------------------------------------------------------------- Bootable CD/DVD
  if fBootable then
  begin //2008-08-18  ADD
    BootImageLocation := iCursor;
    DoDebugMsg(' Bootable Image File Location         :' + IntToDec(iCursor, 8) + '   0x' + IntToHex(iCursor * DefaultSectorSize, 8), mtMessage);
    iCursor := iCursor + BootImageSize;
  end;
  //---------------------------------------------------------------------------------------
  fDataLocation := iCursor;
  { //2008-08-18  DEL
  If iCursor < 150 Then
  Begin
    Pads := 150 - iCursor;
    fDataLocation := 150;
    iCursor := fDataLocation;
    Valid := True;
  End
  Else
  Begin
    Pads := 150 - iCursor;
    fDataLocation := iCursor;
    Valid := False;
  End; }

  DoDebugMsg(' First File Location                  :' + IntToDec(iCursor, 8) + '   0x' + IntToHex(iCursor * DefaultSectorSize, 8), mtMessage);
  SetFileAddress;
  TotalNoOfSectors := iCursor + fFilesSizeOnDisc;
  //---------------------------------------------------------------------------------------
  //If Not ISOFile And wms Then
 //   TotalNoOfSectors := TotalNoOfSectors + 150;  //2008-08-18  FIX
  fImageSize := TotalNoOfSectors - (fStartAddress);
  Result := True;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.BuildHeader(ISOFile: Boolean = false; TargetDir: PDirEntry = nil): Boolean;
var
  I: Integer;
begin
  BuildHeaderISOFile := ISOFile;
  BuildHeaderTargetDir := TargetDir;
  ISOHeader.Clear;
  { If wms Then    //2008-08-18  DEL
     For i := 1 To 150 Do
       ISOHeader.Write(ZEROS, DefaultSectorSize);
    }
  for I := 1 to ZerosHeaderSize do
    ISOHeader.Write(ZEROS, DefaultSectorSize);
  WritePVD; //Primary Volume Descriptor Location
  if fBootable then
    WriteBVD; //Boot Record    Descriptor Location
  if fJoliet then
    WriteJVD; //Joliet Volume Descriptor Location
  WriteTVD; //Terminator Vol Descriptor Location
  FillChar(vds, SizeOf(vds), 255);
  ISOHeader.Seek(0, 0);
  ISOHeader.Read(vds[0], ISOHeader.Size);
  vdsSize := ISOHeader.Size;
  if fBootable then
    WriteBootCatalog;
  WritePathTable(FileDirDescriptorLocation, false);
  WritePathTable(FileDirDescriptorLocation, True);
  if fJoliet then
  begin
    WritePathTableJ(FileDirDescriptorLocationJ, false);
    WritePathTableJ(FileDirDescriptorLocationJ, True);
  end;
  WriteFileAndDirDescriptor(FileDirDescriptorLocation, fDataLocation);
  if fJoliet then
    WriteFileAndDirDescriptorJ(FileDirDescriptorLocationJ, fDataLocation);

  {If Pads > 0 Then
  Begin  //2008-08-18  DEL
    For i := 1 To Pads Do
      ISOHeader.Write(ZEROS, DefaultSectorSize);
  End;}
  fImageSize := TotalNoOfSectors - (fStartAddress);
  Result := True;
  fPrepared := True;
  //DoDebug := True;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.Prepare(ISOFile: Boolean = false; TargetDir: PDirEntry = nil): Boolean;
begin
  Result := PrepareHeader(ISOFile, TargetDir);
  //result := BuildHeader(ISOFile, TargetDir);
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function GetLastFile(Files: PFileEntry): PFileEntry;
begin
  Result := nil;
  while Files <> nil do
  begin
    Result := Files;
    Files := Files.Next;
  end;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function CompletePath(D: PDirEntry): AnsiString;
var
  s: AnsiString;
begin
  s := '\';
  while D.Parent <> D do
  begin
    s := '\' + D.LongName + s;
    D := D.Parent;
  end;
  s := Copy(s, 1, Length(s) - 1);
  Result := UpperCase(s);
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.FindDir(DirName: AnsiString): PDirEntry;
var
  I: Integer;
begin
  if (DirName = '') or (DirName = '\') then
  begin
    Result := fRoot;
    Exit;
  end;
  if Copy(DirName, Length(DirName), 1) = '\' then
    DirName := Copy(DirName, 1, Length(DirName) - 1);
  DirName := UpperCase(DirName);
  for I := 1 to DirCounter - 1 do
  begin
    if (Dirs[I] <> nil) and (DirName = PDirEntry(Dirs[I]).Path) then
    begin
      Result := Dirs[I];
      Exit;
    end;
  end;
  Result := nil;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function MakeShortFileName(FileName: String; var sr: TSearchRec): Boolean;
var
  I: Integer;
begin
  for I := 1 to Min(Length(FileName), 13) do
  begin
    sr.FindData.cAlternateFileName[I - 1] := UpCase(FileName[I]); //short name
    if (sr.FindData.cAlternateFileName[I - 1] < #33) or (sr.FindData.cAlternateFileName[I - 1] > 'z') then
      sr.FindData.cAlternateFileName[I - 1] := '_';
  end;
  I := Min(Length(FileName), 13);
  while (I < 13) do
  begin
    sr.FindData.cAlternateFileName[I] := #0;
    Inc(I);
  end;
  sr.FindData.cAlternateFileName[13] := #0;
  Result := True;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.CreateDir(DirName: AnsiString): PDirEntry;
begin
  Result := MakeDir(DirName);
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.CreateDir(DestinationPath: AnsiString; DirName: AnsiString): PDirEntry;
var
  D: PDirEntry;
begin
  D := FindDir(DestinationPath);
  if D = nil then
  begin
    DebugMsg(ERR_INVALIDDESTDIR, mtFATALERROR);
    Result := nil;
    Exit;
  end;
  Result := CreateDir(D, DirName);
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.CreateDir(DestinationPath: PDirEntry; DirName: AnsiString; Attr: Integer = faDirectory): PDirEntry;
var
  sr: TSearchRec;
begin
  if Copy(DirName, 1, 1) = '\' then
    DirName := Copy(DirName, 2, Length(DirName));
  if Copy(DirName, Length(DirName), 1) = '\' then
    DirName := Copy(DirName, 1, Length(DirName) - 1);
  sr.Name := DirName;
  MakeShortFileName(DirName, sr);
  sr.Time := DateTimeToFileDate(Now);
  sr.Attr := Attr;
  Result := CreateDir(DestinationPath, sr);
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.CreateDir(DestinationPath: PDirEntry; sr: TSearchRec): PDirEntry;
var
  D, d1: PDirEntry;
  F, f1: PFileEntry;
  FullPath: AnsiString;
  FileNameJ, FileNameD: AnsiString;
begin
  FullPath := DestinationPath.Path + '\' + sr.Name;
  if Copy(FullPath, 1, 2) = '\\' then
    FullPath := Copy(FullPath, 2, DefaultSectorSize);
  D := FindDir(FullPath);
  if D <> nil then
  begin
    Result := D;
    Exit;
  end;
  Result := D;
  New_D(d1);
  if d1 = nil then
    Exit;
  New_F(f1);
  if f1 = nil then
    Exit;
  if DestinationPath.Files <> nil then
  begin
    F := GetLastFile(DestinationPath.Files);
    F.Next := f1;
  end
  else
    DestinationPath.Files := f1;
  FileNameD := sr.FindData.cAlternateFileName;
  FileNameJ := sr.Name;
  if FileNameD = '' then
    FileNameD := UpperCase(FileNameJ);
  d1.Parent := DestinationPath; //11d1.Child := nil;
  d1.Files := nil;
  d1.LongName := FileNameJ;
  if fNoUseLowerFile then //2008-08-18  ADD
    d1.LongName := UpperCase(d1.LongName);
  d1.ShortName := FileNameD;
  f1.LongName := FileNameJ;
  if fNoUseLowerFile then //2008-08-18  ADD
    f1.LongName := UpperCase(f1.LongName);
  f1.ShortName := FileNameD;
  f1.Attr := sr.Attr;
  f1.FileSize := 0;
  f1.FileSizeJ := 0;
  f1.dirRec := d1;
  f1.FileSize := 0;
  try
    f1.Time := FileDateToDateTime(sr.Time);
  except
    f1.Time := Now;
  end;
  d1.Path := CompletePath(d1);
  f1.Next := nil;
  Result := d1;
  SortFiles(DestinationPath.Files, fJoliet); //文件排序,如不排序会影响引导类型的光盘
  fPrepared := false;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
var
  k: Integer = 0;
  LastFile: PFileEntry;

function TCnsCDBurner.FindFile(Dir: PDirEntry; FileName: AnsiString): PFileEntry;
var
  F: PFileEntry;
begin
  {  if Pos('.', FileName) = 0 then
      FileName := FileName + '.';}
  FileName := UpperCase(FileName);
  F := Dir.Files;
  LastFile := nil;
  while F <> nil do
  begin
    if (UpperCase(F.LongName) = FileName) then
    begin
      Result := F;
      Exit;
    end;
    LastFile := F;
    F := F.Next;
  end;
  Result := nil;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.InsertFile(DestinationPath: PDirEntry; sr: TSearchRec; FilePath: AnsiString; OrignalAddress: Integer = 0; ResetArchiveBit: Boolean = false): Integer;
var
  tmp, F, f2: PFileEntry;
  FileNameD, FileNameJ: AnsiString;
  FileDateTime: TDateTime;
  Overwrite, Skip: Boolean;
label
  SkipThisFile;
begin
  Result := 0;
  if (sr.Attr and faDirectory <> faDirectory) then
  begin
    if Pos('.', FileNameD) = 0 then
      FileNameD := FileNameD + '.';
    if Pos('.', sr.Name) = 0 then
      sr.Name := sr.Name + '.';
  end;
  f2 := FindFile(DestinationPath, sr.Name);
  F := GetLastFile(DestinationPath.Files);
  FileNameD := sr.FindData.cAlternateFileName;
  if FileNameD = '' then
    FileNameD := UpperCase(sr.Name);
  FileNameJ := sr.Name;
  try
    FileDateTime := FileDateToDateTime(sr.Time);
  except
    FileDateTime := Now;
  end;
  Skip := false;
  if (f2 <> nil) and fReplaceFile then
    Overwrite := True
  else
    Overwrite := false;
  if Length(FileNameJ) > 109 then
    Skip := True;
  if Assigned(fOnAddFile) then
    fOnAddFile(Self, FilePath, FileNameJ, FileNameD, FileDateTime, sr.Attr, sr.Size, Skip);
  if Skip then
  begin
    Result := 0;
    goto SkipThisFile;
  end;
  if Overwrite then
    tmp := f2
  else
  begin
    if f2 <> nil then
    begin
      Result := 0;
      goto SkipThisFile;
    end
    else
    begin
      New_F(tmp);
      if tmp = nil then
        Exit;
      if F <> nil then
        F.Next := tmp
      else
        DestinationPath.Files := tmp;
    end;
  end;
  tmp.ShortName := UpperCase(FileNameD);
  tmp.LongName := FileNameJ;
  if fNoUseLowerFile then //2008-08-18  ADD
    tmp.LongName := UpperCase(tmp.LongName);
  tmp.FileSizeJ := (sr.FindData.nFileSizeHigh * MAXDWORD) + sr.FindData.nFileSizeLow;
  tmp.FileSize := tmp.FileSizeJ;
  tmp.Attr := sr.Attr;
  tmp.FileAttr := 0;
  tmp.Time := FileDateTime;
  tmp.Path := FilePath;
  tmp.ResetArchiveBit := ResetArchiveBit;
  tmp.Prev := IsPrev;
  if not Overwrite then
    tmp.Next := nil
  else
    FFilesSize := FFilesSize - Sectors(tmp.FileSizeJ) * DefaultSectorSize;
  if OrignalAddress <> 0 then
  begin
    tmp.Address := OrignalAddress;
    tmp.AddressJ := OrignalAddress;
    tmp.Imported := True;
  end
  else
  begin
    FFilesSize := FFilesSize + Sectors(sr.Size) * DefaultSectorSize;
    tmp.Imported := false;
  end;
  Result := 1;
  SortFiles(DestinationPath.Files, fJoliet); //文件排序,如不排序会影响引导类型的光盘
  fPrepared := false;
  CurrentFile := tmp;
  SkipThisFile:
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.InsertFileWithName(DestinationPath: AnsiString; FilePath: AnsiString; ShortNameOnDisc, LongNameOnDisc: AnsiString): Integer;
var
  sr: TSearchRec;
  D: PDirEntry;
  ShortName: AnsiString;
begin
  Result := 0;
  D := FindDir(DestinationPath);
  if (D = nil) or (LongNameOnDisc = '') then
  begin
    DebugMsg(ERR_INVALIDDESTDIR, mtFATALERROR);
    Exit;
  end
  else
  begin
    if FindFirst(FilePath, faAnyFile, sr) = 0 then
    begin
      sr.Name := LongNameOnDisc;
      FillChar(sr.FindData.cAlternateFileName[0], 13, 0);
      if ShortNameOnDisc = '' then
        ShortNameOnDisc := LongNameOnDisc;
      ShortName := UpperCase(ShortNameOnDisc);
      if Length(ShortNameOnDisc) > 13 then
        Move(ShortName[1], sr.FindData.cAlternateFileName[0], 13)
      else
        Move(ShortName[1], sr.FindData.cAlternateFileName[0], Length(ShortNameOnDisc));
      InsertFile(D, sr, FilePath);
      Result := 1;
    end
    else
      Result := -1;
    FindClose(sr);
  end;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.InsertMemoryFile(DestinationPath, LongFileName, ShortFileName: AnsiString; Attr: Byte; Memory: Pointer; Size: Cardinal): Integer;
var
  sr: TSearchRec;
  D: PDirEntry;
  ShortName: AnsiString;
begin
  Result := 0;
  D := FindDir(DestinationPath);
  if (D = nil) or (LongFileName = '') then
  begin
    DebugMsg(ERR_INVALIDDESTDIR, mtFATALERROR);
    Exit;
  end
  else
  begin
    sr.Name := LongFileName;
    FillChar(sr.FindData.cAlternateFileName[0], 13, 0);
    if ShortFileName = '' then
      ShortFileName := LongFileName;
    ShortName := UpperCase(ShortFileName);
    sr.Size := Size;
    sr.FindData.nFileSizeLow := Size;
    sr.FindData.nFileSizeHigh := 0;
    sr.Time := DateTimeToFileDate(Now);
    sr.Attr := Attr;
    Move(ShortName[1], sr.FindData.cAlternateFileName[0], Length(ShortFileName));
    Result := InsertFile(D, sr, '');
    if Result > 0 then
      CurrentFile.Buffer := Memory;
  end;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.InsertFile(DestinationPath: AnsiString; FilePath: AnsiString; SavePath: Boolean = false): Integer;
var
  sr: TSearchRec;
  D: PDirEntry;
  SourcePath, DirsToMake: AnsiString;
  tmpstr: AnsiString;
begin
  Result := 0;
  if SavePath then
  begin
    SourcePath := ExtractFilePath(FilePath);
    tmpstr := SourcePath;
    if Copy(tmpstr, 1, 2) = '\\' then
    begin
      tmpstr := Copy(tmpstr, 3, 1024);
      tmpstr := Copy(tmpstr, Pos('\', tmpstr) + 1, 1024);
      tmpstr := Copy(tmpstr, Pos('\', tmpstr), 1024);
      DirsToMake := tmpstr;
    end
    else
    begin
      SourcePath := ExtractFilePath(FilePath);
      DirsToMake := Copy(SourcePath, 3, Length(SourcePath));
    end;
    if fParentDirectoryOnly then
      DirsToMake := ExtractLastDir(DirsToMake);
    MakeDir(DirsToMake);
    D := FindDir(DirsToMake);
  end
  else
    D := FindDir(DestinationPath);
  if D = nil then
  begin
    DebugMsg(ERR_INVALIDDESTDIR, mtFATALERROR);
    Exit;
  end
  else
  begin
    if FindFirst(FilePath, faAnyFile, sr) = 0 then
    begin
      InsertFile(D, sr, FilePath);
      Result := 1;
    end
    else
      Result := -1;
    FindClose(sr);
  end;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.InsertDir(DestinationPath: PDirEntry; SourcePath: AnsiString; FileSpecs: AnsiString = '*.*'; Attr: Integer = faAnyFile; Recursive: Boolean = True; SavePath: Boolean = false; ArchiveOnly: Boolean = false): Integer;
var
  sr: TSearchRec;
  Res: Integer;
  dd: PDirEntry;
  Skip: Boolean;
  FileName, ShortFileName: AnsiString;
  DirsToMake: AnsiString;
  tmpstr, Tmpstr2: AnsiString;
label
  SkipEntry, SkipDir;
begin
  Result := 0;
  if SavePath then
  begin
    tmpstr := SourcePath;
    if Copy(tmpstr, 1, 2) = '\\' then
    begin
      tmpstr := Copy(tmpstr, 3, 1024);
      tmpstr := Copy(tmpstr, Pos('\', tmpstr) + 1, 1024);
      tmpstr := Copy(tmpstr, Pos('\', tmpstr), 1024);
      DirsToMake := tmpstr;
    end
    else
    begin
      if Copy(SourcePath, 2, 1) = ':' then
        DirsToMake := Copy(SourcePath, 3, Length(SourcePath))
      else
        DirsToMake := Copy(SourcePath, 1, Length(SourcePath));
    end;
    if (DestinationPath.Path <> '\') and (DestinationPath.Path <> '') then
      DirsToMake := DestinationPath.Path + DirsToMake;
    if fParentDirectoryOnly then
      DirsToMake := ExtractLastDir(DirsToMake);
    MakeDir(DirsToMake);
    dd := FindDir(DirsToMake);
    if dd <> nil then
      DestinationPath := dd
    else
    begin
      DebugMsg(ERR_INVALIDDESTDIR, mtFATALERROR);
      Exit;
    end;
  end;
  if Copy(SourcePath, Length(SourcePath), 1) <> '\' then
    SourcePath := SourcePath + '\';
  if FileSpecs = '' then
    FileSpecs := '*.*';

  //----------------------------------------------------------------------------
  Res := FindFirst(SourcePath + FileSpecs, Attr, sr);
  while Res = 0 do
  begin
    if (sr.Name = '.') or (sr.Name = '..') then
    begin
      Result := 1;
      goto SkipEntry;
    end;
    if ((sr.Attr and faDirectory) <> faDirectory) then
    begin
      if ArchiveOnly and ((sr.Attr and faArchive) <> faArchive) then
        goto SkipEntry;
      Tmpstr2 := SourcePath + sr.Name;
      sr.FindData.cFileName[1] := #1;
      Result := InsertFile(DestinationPath, sr, Tmpstr2, 0, ArchiveOnly);
    end;
    SkipEntry:
    Res := FindNext(sr);
  end;
  FindClose(sr);
  //----------------------------------------------------------------------------
  if Recursive then
  begin
    Res := FindFirst(SourcePath + '*.*', faAnyFile or faDirectory, sr);
    while Res = 0 do
    begin
      Result := 1;
      if ((sr.Attr and faDirectory) = faDirectory) and (sr.Name <> '.') and (sr.Name <> '..') then
      begin
        FileName := sr.Name;
        ShortFileName := sr.FindData.cAlternateFileName;
        Skip := false;
        if ShortFileName = '' then
          ShortFileName := UpperCase(FileName);
        Skip := false;
        if Assigned(fOnAddDir) then
          fOnAddDir(Self, FileName, ShortFileName, Skip);
        if Skip then
          goto SkipDir;
        dd := CreateDir(DestinationPath, sr);
        if dd <> nil then
        begin
          if sr.Name = 'Installer' then
            MessageBeep(0);
          Result := InsertDir(dd, SourcePath + sr.Name, FileSpecs, Attr, Recursive, false, ArchiveOnly);
          if dd.Files = nil then
            RemoveDir(dd);
        end
        else
        begin
          Result := 0;
          Exit;
        end;
        SkipDir:
      end;
      Res := FindNext(sr);
    end;
  end;
  FindClose(sr);
  //----------------------------------------------------------------------------
  SortFiles(DestinationPath.Files, fJoliet); //文件排序,如不排序会影响引导类型的光盘
  fPrepared := false;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.InsertDir(DestinationPath, SourcePath: AnsiString; FileSpecs: AnsiString = '*.*'; Attr: Integer = faAnyFile; Recursive: Boolean = True; SavePath: Boolean = false; ArchiveOnly: Boolean = false): Integer;
var
  D: PDirEntry;
begin
  Result := 0;
  D := FindDir(DestinationPath);
  if D <> nil then
  begin
    Result := InsertDir(D, SourcePath, FileSpecs, Attr, Recursive, SavePath, ArchiveOnly);
  end
  else
  begin
    DebugMsg(ERR_INVALIDDESTDIR, mtFATALERROR);
    Exit;
  end;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.MakeDir(DirName: AnsiString): PDirEntry;
//----------------------------------------------------------------------------
  function Last(What: AnsiString; Where: AnsiString): Integer;
  var
    Ind: Integer;
  begin
    Result := 0;
    for Ind := (Length(Where) - Length(What) + 1) downto 1 do
      if Copy(Where, Ind, Length(What)) = What then
      begin
        Result := Ind;
        Break;
      end;
  end;
  //----------------------------------------------------------------------------
var
  PrevDir, DirToCreate: AnsiString;
  Ind: Integer;
  d1, d2: PDirEntry;
begin
  Result := nil;
  d1 := FindDir(DirName);
  if d1 = nil then
  begin
    Ind := Last('\', DirName); //  Position of the last '\'
    PrevDir := Copy(DirName, 1, Ind - 1); //  Previous directory
    d2 := FindDir(PrevDir);
    if d2 = nil then
      MakeDir(PrevDir);
    d2 := FindDir(PrevDir);
    DirToCreate := Copy(DirName, Ind + 1, Length(DirName));
    if DirToCreate <> '' then
      Result := CreateDir(d2, DirToCreate);
  end
  else
    Result := d1;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}
var
  th: TCacheThread;
  //ith: TISOBurnerThread;
  AbortWrite: Boolean;

function TCnsCDBurner.BufferProgress: Integer;
var
  ct: Integer;
  r: Integer;
begin
  if not Burning then
  begin
    Result := 0;
    Exit;
  end;
  if th = nil then
    Result := 0
  else
  begin
    ct := th.BytesAvailable;
    r := Round((ct / CacheSize) * 100);
    Result := r;
  end;
end;

{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TDicomThWrite.Execute;
var
  tries, Size: Integer;
  I: Cardinal;
  ImageSize: Cardinal;
  CheckBuffer: Integer;
  F: TFileStreamEx;
  xDeviceBufferSize, xDeviceFreeBufferSize: Cardinal;
  OrgFin, fake: Boolean;
  Tracks: Integer;
  Err: AnsiString;
  mm, ss, ff: Byte;
  PVD: TVolumeDescriptor;
  ChkBuffer: Boolean;
  ws, rs: LongWord;

label
  CloseDiscSkipped, TryAgain, tryagain2, again3, retrywrite, closedisc, WaitForReady;

begin
  //ith := nil;
  tries := 0;
  ChkBuffer := false;
  Tracks := 1;
  FreeOnTerminate := True;
  AbortWrite := false;
  fake := false;
  CheckBuffer := 5;
  Burning := True;
  MCDBurner.fBytesWritten := 0;
  th.Error := ERR_NONE;
  F := nil;
  fwms := wms;
  if fSaveISO then
  begin
    try
      F := TFileStreamEx.Create(MCDBurner.fISOFileName, fmCreate);
    except
      th.Error := Format(ERR_CREATEFILE, [MCDBurner.fISOFileName]);
      th.Abort;
      xDeviceBufferSize := 0;
      xDeviceFreeBufferSize := 0;
    end;
    if th.Error <> ERR_NONE then
      goto closedisc;
  end
  else
  begin
    if MCDBurner.ReadBufferCapacity(xDeviceBufferSize, xDeviceFreeBufferSize) then
      ChkBuffer := True
    else
      ChkBuffer := false;

    MediumIs := MCDBurner.DiscType;
    MCDBurner.LoadMedium;
    if (MediumIs <> mtDVD_PLUSRW) then
      MCDBurner.Rewind;
    MCDBurner.SetCDSpeed(MCDBurner.fReadSpeed, MCDBurner.fWriteSpeed);
    MCDBurner.WaitForReady(10000, 1000);
    OrgFin := MCDBurner.FinalizeDisc;
    I := MCDBurner.CurrentWriteSpeed;
    MCDBurner.FinalizeDisc := True;
    MCDBurner.SetWriteParams(MCDBurner.TestWrite, MCDBurner.UnderrunProtection, MCDBurner.FinalizeDisc, MediumIs);
    MCDBurner.FinalizeDisc := OrgFin;

    if (MediumIs = mtDVD_R) or (MediumIs = mtDVD_RW_RO) or (MediumIs = mtDVD_RW_SR) or (MediumIs = mtDVD_PLUSR) or (MediumIs = mtDVD_PLUSRW) or (MediumIs = mtDVD_PLUSRDL) then
    begin
      ws := MCDBurner.fWriteSpeed;
      rs := MCDBurner.fReadSpeed;
      ws := Trunc(ws / 1385 * 1440.25);
      rs := Trunc(rs / 1385 * 1440.25);
      MCDBurner.SetPerformance(MCDBurner.fStartAddress, MCDBurner.GetImageSize + MCDBurner.fStartAddress, rs, ws, 1000, 1000);
    end;

    Tracks := MCDBurner.SessionsOnDisc + 1;
    if (MediumIs = mtDVD_R) then
    begin
      buf1 := #$00#$00#$00#$00#$00#$00#$00#$00#$00#$23#$12#$7F#$00#$00#$AB#$BD#$00#$00#$03#$E8#$00#$00#$05#$8A#$00#$00#$03#$E8;
      MCDBurner.SetStreaming(@buf1, $1C);
      MCDBurner.SendDVDStructureTimeStamp(Now);
      FillChar(buf1, SizeOf(buf1), 0);
      ImageSize := MCDBurner.GetImageSize;
      if ((ImageSize mod 32) <> 0) then
        ImageSize := ((ImageSize div 32) + 1) * 32;
      MCDBurner.ReserveTrack(ImageSize);
      MCDBurner.WaitForReady(10000, 1000);
    end;

    if (MediumIs <> mtDVD_RAM) and (not MCDBurner.TestWrite) and (MCDBurner.fPerformOPC) then
      MCDBurner.SendOPC;
    if (MediumIs <> mtDVD_R) and (MediumIs <> mtDVD_RW_RO) and (MediumIs <> mtDVD_RW_SR) and (MediumIs <> mtDVD_PLUSR) and (MediumIs <> mtDVD_PLUSRW) then
    begin
      if fwms then
      begin
        buf1 := #$41#$00#$00#$14#$00#$00#$00#$00#$41#$01#$00#$10#$00#$00#$00#$00#$41#$01#$01#$10#$00#$00#$02#$00#$41#$AA#$01#$14#$00#$54#$BE#$52;
        if MCDBurner.GetImageSize > 450000 then
        begin
          th.Error := ERR_TOOMUCHDATA;
          th.Abort;
          Sleep(1000);
          goto CloseDiscSkipped;
        end;
        lba2msf(MCDBurner.GetImageSize + 1, mm, ss, ff);
        buf1[29] := AnsiChar(Chr(mm));
        buf1[30] := AnsiChar(Chr(ss));
        buf1[31] := AnsiChar(Chr(ff));
        if MCDBurner.SendCueSheet(buf1, 32) = false then
        begin
          th.Abort;
          Sleep(1000);
          th.Error := CUESEND_ERR;
          goto CloseDiscSkipped;
        end;
      end;
    end;
    if (MediumIs = mtDVD_RAM) or (MediumIs = mtDVD_R) or (MediumIs = mtDVD_RW) or (MediumIs = mtDVD_RW_RO) or (MediumIs = mtDVD_RW_SR) or (MediumIs = mtDVD_PLUSRW) or (MediumIs = mtDVD_PLUSR) then
      MCDBurner.DebugMsg('>>> ' + Format(MSG_WRITESTART, [DiscTypeString[MediumIs], FormatFloat('0.0', I / 1385) + FormatFloat('X (#,##0 KB/s)', I)]), mtMessage)
    else
      MCDBurner.DebugMsg('>>> ' + Format(MSG_WRITESTART, [DiscTypeString[MediumIs], FormatFloat('0', I / 176.4) + FormatFloat('X (#,##0 KB/s)', I)]), mtMessage);
    if MCDBurner.TestWrite then
      MCDBurner.DebugMsg('>>> ' + MSG_TESTWRITE, mtMessage);
  end;
  I := 0;
  MCDBurner.Lock;
  Size := th.GetFirst(@WriteBuffer[0]);
  MCDBurner.Unlock;
  if (th.ISOFileName = '') and (not fSaveISO) then
  begin
    if (MediumIs = mtDVD_PLUSRW) or (MediumIs = mtDVD_RW_RO) or (MediumIs = mtDVD_RW_SR) or (MediumIs = mtDVD_RAM) then
    begin
      //if MCDBurner.fStartAddress <> 0 then
      begin
        Move(vds[$8000 + 2048], PVD, 2048);
        MCDBurner.DontShowError := True;
        again3:
        if not fake and not MCDBurner.Write10(0, Size div 2048, vds, Size) then
        begin

          if ((MCDBurner.LastSense.AddSenseCode = $30) and (MediumIs = mtDVD_PLUSRW)) then
          begin
            buf1 := #$00#$82#$00#$08#$00#$23#$05#$40#$98#$00#$00#$00;
            if (MCDBurner.FormatUnit($11, @buf1, 12)) then
              repeat
                Sleep(2000);
                MCDBurner.ReadDiscInformation;
              until (MCDBurner.LastSense.AddSenseCode <> 04);
            Inc(tries);
            if (tries = 1) then
              goto again3;
          end;

          if (MCDBurner.TargetBusy) or (MCDBurner.LastSense.AddSenseCode = $4) or (MCDBurner.LastSense.AddSenseCode = $0) then
          begin
            Sleep(600);
            Inc(tries);
            if tries < 10000 then
              goto retrywrite;
            th.Abort;
            th.Error := ERR_DEVICEBUSY;
          end
          else
          begin
            th.Abort;
            th.Error := ERR_WRITEERROR + ' [' + MCDBurner.ErrorString + ']';
            {$IFDEF TRIAL}
            if (I + MCDBurner.fStartAddress) > High(Word) then
              th.Error := ERR_TRIALLIMIT;
            {$ENDIF}
          end;
          xDeviceBufferSize := 0;
          xDeviceFreeBufferSize := 0;
          goto closedisc;
        end;
        MCDBurner.FlushCache(60000 * 30, false);
      end;
    end;
  end
  else
    MCDBurner.fStartAddress := 0;

  while Size <> 0 do
  begin
    if (th.ISOFileName = '') then
      if not fSaveISO then
        if (MediumIs <> mtCD_R) and (MediumIs <> mtCD_RW) then
          Size := 32 * 2048;
    MCDBurner.fFileInProcess := th.FileName;
    if Size = -1 then
      goto tryagain2;
    MCDBurner.fBytesWritten := MCDBurner.fBytesWritten + Size;
    if ((MCDBurner.fBytesWritten div 2048) > MCDBurner.ImageSize) then
      MCDBurner.fBytesWritten := MCDBurner.ImageSize * 2048;
    if fSaveISO then
    begin
      F.Write(WriteBuffer[0], Size);
    end
    else
    begin
      if (CheckBuffer = 0) and ChkBuffer and (MCDBurner.ReadBufferCapacity(xDeviceBufferSize, xDeviceFreeBufferSize)) then
        CheckBuffer := 5;
      Dec(CheckBuffer);
      tries := 0;
      retrywrite:
      if AbortWrite then
      begin
        th.Abort;
        th.Error := ERR_ABORTED;
        xDeviceBufferSize := 0;
        xDeviceFreeBufferSize := 0;
        goto closedisc;
      end;
      if not fake and not MCDBurner.Write10(I + MCDBurner.fStartAddress, Size div DefaultSectorSize, WriteBuffer, Size) then
      begin
        if (MCDBurner.TargetBusy) or (MCDBurner.LastSense.AddSenseCode = $4) or (MCDBurner.LastSense.AddSenseCode = $0) then
        begin
          Sleep(600);
          Inc(tries);
          if tries < 10000 then
            goto retrywrite;
          th.Abort;
          th.Error := ERR_DEVICEBUSY;
        end
        else
        begin
          th.Abort;
          th.Error := ERR_WRITEERROR + ' [' + MCDBurner.ErrorString + ']';
          {$IFDEF TRIAL}
          if (I + MCDBurner.fStartAddress) > High(Word) then
            th.Error := ERR_TRIALLIMIT;
          {$ENDIF}
        end;
        xDeviceBufferSize := 0;
        xDeviceFreeBufferSize := 0;
        goto closedisc;
      end;
    end;
    Inc(I, Size div DefaultSectorSize);
    tryagain2:
    if AbortWrite then
    begin
      th.Error := ERR_ABORTED;
      th.Abort;
      xDeviceBufferSize := 0;
      xDeviceFreeBufferSize := 0;
      goto closedisc;
    end;
    MCDBurner.Lock;
    Size := th.GetFirst(@WriteBuffer[0]);
    MCDBurner.Unlock;
    if th.Error <> '' then
      goto closedisc;
    if Size = -1 then
    begin
      Sleep(1);
      goto tryagain2;
    end;
  end;
  if Size mod DefaultSectorSize <> 0 then
  begin
    th.Error := ERR_4;
    th.Abort;
  end;
  if fSaveISO then
    F.Destroy
  else
  begin
    closedisc:
    fwms := false;
    if MediumIs <> mtDVD_RAM then
      MCDBurner.ReadBufferCapacity(xDeviceBufferSize, xDeviceFreeBufferSize);
    if (MediumIs = mtDVD_R) or (MediumIs = mtDVD_RW_RO) or (MediumIs = mtDVD_RW_SR) then
    begin
      //MCDBurner.Lock;
      if Assigned(MCDBurner.fOnFinalizingTrack) then
        MCDBurner.fOnFinalizingTrack(MCDBurner);
      //MCDBurner.UnLock;
      MCDBurner.FlushCache(60000 * 30, True);
      MCDBurner.DeviceFreeBufferSize := MCDBurner.DeviceBufferSize;
      while not MCDBurner.ReadDiscInformation do
      begin
        MCDBurner.DeviceFreeBufferSize := MCDBurner.DeviceFreeBufferSize - (MCDBurner.DeviceBufferSize div 960);
        Sleep(1000);
      end;
    end
    else
    begin
      //MCDBurner.Lock;
      if Assigned(MCDBurner.fOnFinalizingTrack) then
        MCDBurner.fOnFinalizingTrack(MCDBurner);
      if not MCDBurner.FlushCache(60000 * 02, false) then
        MCDBurner.FlushCache(60000 * 02, True);
      //MCDBurner.UnLock;
    end;
    MCDBurner.DeviceBufferSize := 0;
    MCDBurner.DeviceFreeBufferSize := 0;
    if th <> nil then
      if (th.Error <> ERR_NONE) then
        goto CloseDiscSkipped;
    if not fake then
      if (not MCDBurner.TestWrite) then
      begin
        if (MediumIs <> mtDVD_RAM) {nd (MediumIs <> mtDVD_RW_SR) and (MediumIs <> mtDVD_RW_RO)} and MCDBurner.FinalizeTrack then
        begin
          if (MediumIs <> mtDVD_R) and (MediumIs <> mtDVD_R) then
            MCDBurner.SetWriteParams(MCDBurner.TestWrite, MCDBurner.UnderrunProtection, MCDBurner.FinalizeDisc, MediumIs);
          tries := 0;
          WaitForReady:
          if (MediumIs = mtDVD_PLUSR) then
          begin
            MCDBurner.CloseTrackDVD(false, 1, 0, 0, Tracks);
            MCDBurner.CloseTrackDVD(false, 2, 0, 0, $FF);
          end
          else
            if (MediumIs = mtDVD_PLUSRDL) then
          begin
            MCDBurner.CloseTrackDVD(false, 1, 0, 0, Tracks);
            if MCDBurner.FinalizeDisc <> false then
              MCDBurner.CloseTrackDVD(false, 6, 0, 0, 0)
            else
              MCDBurner.CloseTrackDVD(false, 2, 0, 0, 0)
          end
          else
            if (MediumIs = mtDVD_R) then
          begin
            MCDBurner.CloseTrackDVD(True, 1, 0, 0, Tracks);
            MCDBurner.CloseTrackDVD(True, 1, 0, 0, Tracks + 1);
            MCDBurner.CloseTrackDVD(True, 2, 0, 0, Tracks + 2);
          end
          else
            if (MediumIs = mtDVD_RW_RO) or (MediumIs = mtDVD_RW_SR) then
          begin
            MCDBurner.CloseTrackDVD(True, 2, 0, 0, 00);
          end
          else
            if (MediumIs = mtDVD_PLUSRW) then
          begin
            MCDBurner.CloseTrackDVD(false, 3, 0, 0, $FF);
          end
          else
            if not fwms then
          begin
            if not MCDBurner.CloseTrack(false, fImmedCT) then
            begin
              if (MCDBurner.TargetBusy) or (MCDBurner.LastSense.AddSenseCode = $4) then
              begin
                Inc(tries);
                Sleep(1000);
                if tries < 1000 then
                  goto WaitForReady;
              end
              else
              begin
                MCDBurner.CloseTrack(false, fImmedCT);
              end;
            end;
          end;
        end;
      end;
    MCDBurner.WaitForReady(60000 * 4, 5000);
    if MediumIs <> mtDVD_RAM then
      MCDBurner.ReadBufferCapacity(xDeviceBufferSize, xDeviceFreeBufferSize);
    if not fSaveISO then
    begin
      MCDBurner.SetWriteParams(false, false, false, 1);
      MCDBurner.SetCDSpeed(MCDBurner.MaxReadSpeed, 2);
      MCDBurner.Rewind;
      MCDBurner.LockMedium(True);
      MCDBurner.LoadMedium;
      MCDBurner.Rewind;
      MCDBurner.TestUnitReady;
    end;
  end;
  CloseDiscSkipped:
  fwms := false;
  MCDBurner.Lock;
  {  if ASPILayerName = 'BMASPI32' then
      _ReInitializeASPI;}
  if th <> nil then
    MCDBurner.fFileInProcess := th.FileName
  else
    MCDBurner.fFileInProcess := '';
  Err := th.Error;
  MCDBurner.Unlock;
  Burning := false;

  th.WaitFor;
  th.Free;
  th := nil;

  MCDBurner.LockDrive(True);
  MCDBurner.fFileInProcess := '';

  if Assigned(MCDBurner.fOnWriteDone) then
  begin
    if MCDBurner.ConsoleApplication then
    begin
      if (Assigned(MCDBurner.fOnWriteDone)) then
        MCDBurner.fOnWriteDone(Self, MCDBurner.WriteDoneError);
    end
    else
    begin
      MCDBurner.WriteDoneError := Err;
      Synchronize(MCDBurner.WriteDoneEvent);
    end;
  end;
end;

{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.WriteDoneEvent;
begin
  if (Assigned(fOnWriteDone)) then
    fOnWriteDone(Self, WriteDoneError);
end;

{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TCnsCDBurner.Abort;
begin
  AbortWrite := True;
  fAborted := True;
end;

{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.DoBurn;
begin
  WT := TDicomThWrite.Create(True);
  WT.FreeOnTerminate := True;
  WT.Priority := tpTimeCritical;
  WT.fCacheSize := Self.CacheSize;
  WT.fImageSize := TotalNoOfSectors - fStartAddress;
  WT.fSaveISO := ISO;
  WT.Resume;
  Result := True;
end;

{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.BurnISOImage;
var
  b: AnsiString;
  fs: TFileStreamEx;
  dt: Byte;
  MaxPacketSize: Integer;
begin
  MCDBurner := Self;
  MaxPacketSize := 32 * 2048;
  dt := MCDBurner.DiscType;
  if (dt = mtCD_R) or (dt = mtCD_RW) then
    MaxPacketSize := 27 * 2048;
  try
    fs := TFileStreamEx.Create(ISOFileName, fmOpenRead + fmShareDenyNone);
  except
    Result := false;
    if Assigned(MCDBurner.fOnWriteDone) then
      MCDBurner.fOnWriteDone(Self, Format(ERR_FILEINUSE, [ISOFileName]));
    Exit;
  end;
  MCDBurner.fImageSize := Sectors(fs.Size);
  fs.Free;
  MCDBurner := Self;
  th := TCacheThread.Create(Self.CacheSize, RootDir, ISOHeader, MCDBurner.fImageSize * 2048, 0, b, MCDBurner.fWritePostGap, MaxPacketSize, MCDBurner.CriticalSection);
  th.ISOFileName := ISOFileName;
  while not th.CanStart do
  begin
    if th.Error <> ERR_NONE then
    begin
      Result := false;
      MCDBurner.fFileInProcess := th.FileName;
      if Assigned(MCDBurner.fOnWriteDone) then
        MCDBurner.fOnWriteDone(Self, th.Error);
      th.WaitFor;
      th.Free;
      th := nil;
      Exit;
    end;
    Sleep(100);
  end;
  Result := DoBurn(false);
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.BurnCD;
var
  b: AnsiString;
  dt: Byte;
  MaxPacketSize: Integer;
begin
  MCDBurner := Self;
  MaxPacketSize := 32 * 2048;
  dt := MCDBurner.DiscType;
  if (dt = mtCD_R) or (dt = mtCD_RW) then
    MaxPacketSize := 27 * 2048;

  if Bootable then
    b := fBootImage
  else
    b := '';
  if (MediumIs = mtDVD_RW_RO) or (MediumIs = mtDVD_RW_SR) then
  begin
    if (MediumIs = mtDVD_RW_SR) then
      buf1 := #$00#$A2#$00#$08#$00#$00#$03#$E8#$54#$00#$00#$10
    else
      buf1 := #$00#$82#$00#$08#$00#$00#$00#$00#$4C#$00#$00#$10;
    if not (MCDBurner.FormatUnit($11, @buf1, 12)) then
    begin
      buf1 := #$00#$82#$00#$08#$00#$00#$00#$00#$54#$00#$00#$10;
      MCDBurner.FormatUnit($11, @buf1, 12);
    end;
    repeat
      Sleep(5000);
      MCDBurner.ReadDiscInformation;
    until (MCDBurner.LastSense.AddSenseCode <> 04);

  end;
  GetAddress := True;
  //MCDBurner.GetNextWritableAddress;
  PrepareHeader(MCDBurner.BuildHeaderISOFile, MCDBurner.BuildHeaderTargetDir);
  BuildHeader(MCDBurner.BuildHeaderISOFile, MCDBurner.BuildHeaderTargetDir);
  GetAddress := false;
  th := TCacheThread.Create(Self.CacheSize, RootDir, ISOHeader, MCDBurner.fImageSize * DefaultSectorSize, MCDBurner.BootImageSize, b, MCDBurner.fWritePostGap, MaxPacketSize, MCDBurner.CriticalSection);
  th.ISOFileName := '';
  while not th.CanStart do
  begin
    if th.Error <> ERR_NONE then
    begin
      Result := false;
      MCDBurner.fFileInProcess := th.FileName;
      if Assigned(MCDBurner.fOnWriteDone) then
        MCDBurner.fOnWriteDone(Self, th.Error);
      th.WaitFor;
      th.Free;
      th := nil;
      Exit;
    end;
    Sleep(100);
  end;
  Result := DoBurn(false);
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.SaveToISOFile;
var
  b: AnsiString;
begin
  Result := false;
  if BackupISO then
    SysUtils.RenameFile(ISOFileName, ChangeFileExt(ISOFileName, '.bak'));
  if not QuickSave then
  begin
    fISOFileName := ISOFileName;
    PrepareHeader(True, BuildHeaderTargetDir);
    BuildHeader(True, BuildHeaderTargetDir);

    MCDBurner := Self;
    if Bootable then
      b := fBootImage
    else
      b := '';
    th := TCacheThread.Create(Self.CacheSize, RootDir, ISOHeader, fImageSize * DefaultSectorSize, MCDBurner.BootImageSize, b, fWritePostGap, 32 * 2048, MCDBurner.CriticalSection);
    while not th.CanStart do
    begin
      if th.Error <> ERR_NONE then
      begin
        MCDBurner.fFileInProcess := th.FileName;
        if Assigned(MCDBurner.fOnWriteDone) then
          MCDBurner.fOnWriteDone(Self, th.Error);
        th.WaitFor;
        th.Free;
        th := nil;
        Exit;
      end;
      SleepEx(100, false);
    end;
    DoBurn(True);
    while Burning do
      Sleep(100);
    Result := True;
  end
  else
  begin
    PrepareHeader(True, BuildHeaderTargetDir);
    BuildHeader(True, BuildHeaderTargetDir);

    ISOHeader.SaveToFile(ISOFileName);
    AssignFile(F, ISOFileName);
    Reset(F, 1);
    Seek(F, FileSize(F));
    Result := WriteFiles;
    CloseFile(F);
    if not Result then
      DeleteFile(ISOFileName);
    if Assigned(fOnWriteDone) then
      fOnWriteDone(Self, '');
  end;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure ConvertFileNameJ(var dd: TDirectoryDescriptor);
var
  I: Integer;
  t: AnsiChar;
  ws: WideString;
  s: AnsiString;
begin

  SetLength(ws, dd.LenOfFileIdentifier div 2);
  I := 0;
  while (I < dd.LenOfFileIdentifier div 2) do
  begin
    t := dd.FileName[I * 2];
    dd.FileName[I * 2] := dd.FileName[I * 2 + 1];
    dd.FileName[I * 2 + 1] := t;
    Inc(I);
  end;
  Move(dd.FileName, ws[1], dd.LenOfFileIdentifier);
  s := ws;
  FillChar(dd.FileName[0], 250, 0);
  //Move(s[1], dd.FileName, dd.LenOfFileIdentifier Div 2);
  Move(s[1], dd.FileName, Length(s) + 1); //2008-08-22  FIX
  for I := 2 to 249 do
  begin
    if dd.FileName[I] = ';' then
    begin
      FillChar(dd.FileName[I], 250 - I, 0);
      Exit;
    end;
  end;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure ConvertFileName(var dd: TDirectoryDescriptor);
var
  I: Integer;
begin
  I := 0;
  while (I < dd.LenOfFileIdentifier) do
  begin
    dd.FileName[I] := dd.FileName[I];
    Inc(I);
  end;
  FillChar(dd.FileName[I], dd.LenOfFileIdentifier - I, 0);
  for I := 0 to 250 do
  begin
    if dd.FileName[I] = #0 then
      Exit;
    if dd.FileName[I] = ';' then
    begin
      FillChar(dd.FileName[I], dd.LenOfFileIdentifier - I, 0);
      Exit;
    end;
  end;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.ImportSessionDirectoryJ(DirLocation, Size: Integer; DestinationDir: PDirEntry): Boolean;
var
  I: Integer;
  dd: TDirectoryDescriptor;
  tmpDir: PDirEntry;
  tmpDateTime: TDateTime;
  sr: TSearchRec;
  NumberOfSectorsToProcess: Integer;
  LocalBuffer: array[0..2352] of AnsiChar;
label
  noMoreFile, again;
begin
  NumberOfSectorsToProcess := Sectors(Size);
  Result := false;
  I := 0;
  FillChar(dd, SizeOf(dd), 0);
  FillChar(WriteBuffer[0], DefaultSectorSize, 0);
  if not Read10(DirLocation, 1, @WriteBuffer, DefaultSectorSize) then
    Exit;
  Move(WriteBuffer[0], LocalBuffer, DefaultSectorSize);
  Move(LocalBuffer[I], dd, 34);
  I := I + dd.LenDr;
  Move(LocalBuffer[I], dd, 34);
  I := I + dd.LenDr;
  again:
  while I < DefaultSectorSize - 33 do
  begin
    Move(LocalBuffer[I], dd, 33);
    if dd.LenOfFileIdentifier < 215 then
      Move(LocalBuffer[I + 33], dd.FileName, dd.LenOfFileIdentifier)
    else
    begin
      DebugMsg(ERR_INVALIDFILENAME + #10#13 + dd.FileName, mtFATALERROR);
    end;

    if dd.LenDr = 0 then
      goto noMoreFile;
    I := I + dd.LenDr;
    if I > DefaultSectorSize then
      goto noMoreFile;
    Inc(k);
    ConvertFileNameJ(dd);
    sr.Size := dd.DataLength;
    sr.FindData.nFileSizeHigh := 0;
    sr.FindData.nFileSizeLow := dd.DataLength;
    sr.Attr := 0;
    try
      tmpDateTime := EncodeDate(dd.Year + 1900, dd.Month, dd.Day);
    except
      tmpDateTime := 0;
    end;
    tmpDateTime := tmpDateTime + EncodeTime(dd.Hour, dd.Min, dd.Sec, 0);
    sr.Time := DateTimeToFileDate(tmpDateTime);
    sr.Name := dd.FileName;
    MakeShortFileName(sr.Name, sr);
    //2008-08-22  FIX
    if (dd.FileFlag = 1) or (dd.FileFlag = 4) or (dd.FileFlag = 5) then
      sr.Attr := sr.Attr or faHidden;
    if (dd.FileFlag = 2) or (dd.FileFlag = 6) or (dd.FileFlag = 7) then
    begin
      sr.Attr := sr.Attr or faDirectory;
      tmpDir := CreateDir(DestinationDir, sr);
      ImportSessionDirectoryJ(dd.Address, dd.DataLength, tmpDir);
    end
    else
      InsertFile(DestinationDir, sr, '', dd.Address);
    Result := True;
  end;
  noMoreFile:
  Dec(NumberOfSectorsToProcess);
  Inc(DirLocation);
  I := 0;
  if NumberOfSectorsToProcess > 0 then
  begin
    if not Read10(DirLocation, 1, @WriteBuffer, DefaultSectorSize) then
      Exit;
    Move(WriteBuffer[0], LocalBuffer, DefaultSectorSize);
    goto again;
  end;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.ImportSessionDirectory(DirLocation, Size: Integer; DestinationDir: PDirEntry): Boolean;
var
  I: Integer;
  dd: TDirectoryDescriptor;
  tmpDir: PDirEntry;
  tmpDateTime: TDateTime;
  sr: TSearchRec;
  NumberOfSectorsToProcess: Integer;
  LocalBuffer: array[0..2352] of AnsiChar;
label
  noMoreFile, again, Skip;
begin
  NumberOfSectorsToProcess := Sectors(Size);
  Result := false;
  I := 0;
  Move(LocalBuffer[I], dd, 33);
  //i := 34;
  FillChar(dd, SizeOf(dd), 0);
  again:
  FillChar(WriteBuffer[0], DefaultSectorSize, 0);
  if not Read10(DirLocation, 1, @WriteBuffer, DefaultSectorSize) then
    Exit;
  Move(WriteBuffer[0], LocalBuffer, DefaultSectorSize);
  while I < DefaultSectorSize - 33 do
  begin
    if (LocalBuffer[I] = #0) and (LocalBuffer[I + 1] = #0) and (LocalBuffer[I + 2] = #0) and (LocalBuffer[I + 3] = #0) and (LocalBuffer[I + 5] = 'U') and (LocalBuffer[I + 6] = 'X') and (LocalBuffer[I + 7] = 'A') then
    begin
      Inc(I, 14);
      goto Skip;
    end;
    Move(LocalBuffer[I], dd, 33);
    if dd.LenOfFileIdentifier < 240 then
    begin
      if dd.LenOfFileIdentifier mod 2 = 0 then
        dd.LenOfFileIdentifier := dd.LenOfFileIdentifier + 1;
      Move(LocalBuffer[I + 33], dd.FileName, dd.LenOfFileIdentifier);
      dd.FileName[dd.LenOfFileIdentifier] := #0;
    end
    else
    begin
      DebugMsg(ERR_INVALIDFILENAME + #10#13 + dd.FileName, mtFATALERROR);
    end;

    //if FileNum < 2 then goto skip;
    if dd.LenDr = 0 then
      goto noMoreFile;
    I := I + dd.LenDr;
    if I > DefaultSectorSize then
      goto noMoreFile;
    if ((dd.FileName[0] = #1) or (dd.FileName[1] = #0)) and (dd.FileName[2] = #0) then
      goto Skip;
    Inc(k);
    ConvertFileName(dd);
    sr.Size := dd.DataLength;
    sr.FindData.nFileSizeHigh := 0;
    sr.FindData.nFileSizeLow := dd.DataLength;
    sr.Attr := 0;
    tmpDateTime := EncodeDate(dd.Year + 1900, dd.Month, dd.Day);
    tmpDateTime := tmpDateTime + EncodeTime(dd.Hour, dd.Min, dd.Sec, 0);
    sr.Time := DateTimeToFileDate(tmpDateTime);
    sr.Name := dd.FileName;
    MakeShortFileName(sr.Name, sr);
    //2008-08-22  FIX
    if (dd.FileFlag = 1) or (dd.FileFlag = 4) or (dd.FileFlag = 5) then
      sr.Attr := sr.Attr or faHidden;
    if (dd.FileFlag = 2) or (dd.FileFlag = 6) or (dd.FileFlag = 7) then
    begin
      sr.Attr := sr.Attr or faDirectory;
      tmpDir := CreateDir(DestinationDir, sr);
      ImportSessionDirectory(dd.Address, dd.DataLength, tmpDir);
    end
    else
      InsertFile(DestinationDir, sr, '', dd.Address);
    Skip:
    Result := True;
  end;
  noMoreFile:
  Dec(NumberOfSectorsToProcess);
  Inc(DirLocation);
  I := 0;
  if NumberOfSectorsToProcess > 0 then
    goto again;

end;

{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.ImportSession(SessionNo: ShortInt; DestinationDir: PDirEntry): Boolean;
var
  I: Integer;
  FirstSector: Cardinal;
  TryISO: Boolean;
  LastSession: Integer;
label
  again, TermVDFound;
begin
  Result := false;
  TryISO := false;
  if DestinationDir = nil then
    DestinationDir := RootDir;
  LastSession := SessionsOnDisc;
  if (LastSession = 0) then
    Exit;
  if (SessionNo = -1) or (SessionNo > LastSession) then
    SessionNo := LastSession;
  if SessionNo = 0 then
    Exit;
  DebugMsg('>>> ' + Format(MSG_IMPORTINGSESSION, [SessionNo]), mtMessage);
  FillChar(impVD, SizeOf(impVD), 0);
  FillChar(Buffer, SizeOf(Buffer), 0);
  if ReadTrackInformation(SessionNo) then
  begin
    FirstSector := TrackInformation.TrackStartAddress;
  end
  else
  begin
    DebugMsg('>>> ' + ERR_IMPORTSESSION + ' # ' + IntToStr(SessionNo), mtFATALERROR);
    Exit;
  end;
  again:
  for I := FirstSector + ZerosHeaderSize to FirstSector + 36 do
  begin
    FillChar(impVD, SizeOf(impVD), 0);
    if Read10(I, 1, @impVD, DefaultSectorSize) then
      with impVD do
        if not TryISO then
          if (Identifier[1] = 'C') and (Identifier[2] = 'D') and (Identifier[3] = '0') and (Identifier[4] = '0') and (Identifier[5] = '1') then
            if (pdType = 2) then
            begin
              ImportSessionDirectoryJ(impVD.RootDirRec.Address, impVD.RootDirRec.DataLength, DestinationDir);
              Result := True;
              Exit;
            end;
    with impVD do
      if TryISO then
        if (Identifier[1] = 'C') and (Identifier[2] = 'D') and (Identifier[3] = '0') and (Identifier[4] = '0') and (Identifier[5] = '1') then
          if (pdType = 1) then
          begin
            ImportSessionDirectory(impVD.RootDirRec.Address, impVD.RootDirRec.DataLength, DestinationDir);
            Result := True;
            Exit;
          end;
    with impVD do
      if (Identifier[1] = 'C') and (Identifier[2] = 'D') and (Identifier[3] = '0') and (Identifier[4] = '0') and (Identifier[5] = '1') then
        if pdType = 255 then
          goto TermVDFound;
  end;
  TermVDFound:
  if not TryISO then
  begin
    TryISO := True;
    goto again;
  end;
  DebugMsg('>>> ' + Format(ERR_ISOIMAGENOTFOUND, [SessionNo]), mtFATALERROR);
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.MoveFile(DestinationPath, SourcePath: PDirEntry; SourceFile: PFileEntry): Boolean;
var
  F: PFileEntry;
begin
  Result := false;
  F := GetLastFile(DestinationPath.Files);
  if F = nil then
  begin
    DestinationPath.Files := SourceFile;
  end
  else
    F.Next := SourceFile;
  if LastFile <> nil then
  begin
    LastFile.Next := SourceFile.Next;
  end
  else
  begin
    if SourceFile.Next = nil then
      SourcePath.Files := nil
    else
      SourcePath.Files := SourceFile.Next;
  end;
  SourceFile.Next := nil;
  SortFiles(DestinationPath.Files, fJoliet); //文件排序,如不排序会影响引导类型的光盘
  SortFiles(SourcePath.Files, fJoliet);
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.MoveFile(DestinationPath, SourcePath, SourceFile: AnsiString): Boolean;
var
  SrcDir, DestDir: PDirEntry;
  SrcFile: PFileEntry;
begin
  Result := false;
  DestDir := FindDir(DestinationPath);
  SrcDir := FindDir(SourcePath);
  if (DestDir = nil) or (SrcDir = nil) then
    Exit;
  SrcFile := FindFile(SrcDir, SourceFile);
  if SrcFile = nil then
    Exit;
  Result := MoveFile(DestDir, SrcDir, SrcFile);
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function IndexOf_D(F: PDirEntry): Integer;
var
  Found: Boolean;
begin
  Result := 0;
  Found := false;
  while (Result < DirCounter) and (Dirs[Result] <> F) do
  begin
    Found := True;
    Inc(Result);
  end;
  if not Found then
    Result := -1;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure Delete_D(var D: PDirEntry);
var
  Index: Integer;
begin
  Index := IndexOf_D(D);
  Dec(DirCounter);
  Move(Dirs[Index + 1], Dirs[Index], (DirCounter - Index) * 4);
  Move(PathTable[Index + 1], PathTable[Index], (DirCounter - Index) * 4);
  Move(PathTableJ[Index + 1], PathTableJ[Index], (DirCounter - Index) * 4);

  Dispose(D);
  D := nil;
  Dirs[DirCounter] := nil;
  PathTable[DirCounter] := nil;
  PathTableJ[DirCounter] := nil;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function IndexOf_F(F: PFileEntry): Integer;
var
  Found: Boolean;
  I: Integer;
begin
  Result := 0;
  Found := false;
  for I := 0 to FileCounter - 1 do
    if (Files[I] = F) then
    begin
      Found := True;
      Result := I;
      Break;
    end;
  if not Found then
    Result := -1;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure Delete_F(var F: PFileEntry);
var
  Index: Integer;
begin
  Index := IndexOf_F(F);
  if Index >= 0 then
  begin
    Dec(FileCounter);
    Move(Files[Index + 1], Files[Index], (FileCounter - Index) * 4);
    Dispose(F);
    F := nil;
    Files[FileCounter] := nil;
  end;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.RemoveDir(SourceDir: AnsiString): Boolean;
var
  SrcDir: PDirEntry;
begin
  SrcDir := FindDir(SourceDir);
  Result := RemoveDir(SrcDir);
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.RemoveDir(var SourceDir: PDirEntry): Boolean;
var
  F, tmp: PFileEntry;
  D: PDirEntry;
begin
  Result := false;
  if SourceDir.Path = '\' then
    Exit;
  F := SourceDir.Files;
  while F <> nil do
  begin
    tmp := F;
    F := F.Next;
    RemoveFile(SourceDir, tmp);
  end;
  if (SourceDir.Path <> '\') and (SourceDir.Path <> '') then
  begin
    D := SourceDir.Parent;
    RemoveFile(D.Path, SourceDir.LongName);
    SourceDir := nil;
  end
  else
  begin
    SourceDir.Files := nil;
  end;
  Result := True;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.ResetFilesArchiveBit: Boolean;
var
  I: Integer;
  P: PFileEntry;
  Attr: Integer;
begin
  for I := 0 to FilesCount - 1 do
  begin
    P := Files[I];
    Attr := P.Attr;
    if ((P.Attr and faDirectory) <> faDirectory) then
    begin
      if ((P.Attr and faArchive) = faArchive) and P.ResetArchiveBit then
      begin
        Attr := Attr - faArchive;
        P.FileAttr := 0;
        FileSetAttr(P.Path, Attr);
      end;
    end;
  end;
  Result := True;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.TestFiles: Boolean;
var
  I: Integer;
  P: PFileEntry;
  fs: TFileStream;
  Stop: Boolean;
begin
  Result := True;
  for I := 0 to FilesCount - 1 do
  begin
    P := Files[I];
    if ((P.Attr and faDirectory) <> faDirectory) then
    begin
      try
        fs := TFileStream.Create(P.Path, fmOpenRead + fmShareDenyNone);
        fs.Destroy;
      except
        Result := false;
        Stop := True;
        if Assigned(fOnTestFileFails) then
          fOnTestFileFails(Self, P.Path, Stop);
        if Stop then
          Exit;
      end;
    end;
  end;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.ResetAllFilesArchiveBit: Boolean;
var
  I: Integer;
  P: PFileEntry;
  Attr: Integer;
begin
  for I := 0 to FilesCount - 1 do
  begin
    P := Files[I];
    Attr := P.Attr;
    if ((P.Attr and faDirectory) <> faDirectory) then
    begin
      if ((P.Attr and faArchive) = faArchive) then
      begin
        Attr := Attr - faArchive;
        P.FileAttr := 0;
        FileSetAttr(P.Path, Attr);
      end;
    end;
  end;
  Result := True;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.RemoveEmptyDirs: Boolean;
var
  I, J: Integer;
  D: PDirEntry;
  F: Boolean;
label
  Start, again;
begin
  Result := True;
  Start:
  if DirsCount < 1 then
    Exit;
  J := 0;
  F := True;
  while F do
  begin
    F := false;
    for I := 1 to DirsCount do
    begin
      Inc(J);
      D := Dirs[I];
      if (D <> nil) and (D.Files = nil) then
      begin
        RemoveDir(D);
        F := True;
        goto again;
      end;
    end;
    again:
  end;
  D := Dirs[J];
  if DirsCount <> 0 then
    if (D <> nil) and (D.Files = nil) then
    begin
      RemoveDir(D);
      goto Start;
    end;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.RemoveDir_r(var SourceFile: PFileEntry): Boolean;
var
  F, tmp: PFileEntry;
begin
  F := SourceFile.dirRec.Files;
  while F <> nil do
  begin
    tmp := F;
    F := F.Next;
    RemoveFile(SourceFile.dirRec, tmp);
  end;
  SourceFile.dirRec.Files := nil;
  Result := True;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.RemoveFile(var SourceDir: PDirEntry; var SourceFile: PFileEntry): Boolean;
var
  F: PFileEntry;
begin
  Result := True;
  LastFile := nil;
  F := SourceDir.Files;
  while (F <> nil) and (SourceFile <> F) do
  begin
    LastFile := F;
    F := F.Next;
  end;
  if (SourceFile.Attr and faDirectory) = faDirectory then
  begin
    RemoveDir_r(SourceFile);
    Delete_D(SourceFile.dirRec);
  end;
  if LastFile = nil then
  begin
    SourceDir.Files := SourceFile.Next;
  end
  else
    LastFile.Next := SourceFile.Next;
  Delete_F(SourceFile);
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.GetDirSize(Path: AnsiString): Int64;
var
  sr: TSearchRec;
  Res: Integer;
label
  SkipEntry, SkipDir;
begin
  if Copy(Path, Length(Path), 1) = '\' then
    Res := FindFirst(Path + '*.*', faAnyFile or faDirectory, sr)
  else
    Res := FindFirst(Path, faAnyFile or faDirectory, sr);
  Result := 0;
  while Res = 0 do
  begin
    if ((sr.Attr and faDirectory) = faDirectory) and (sr.Name <> '.') and (sr.Name <> '..') then
      Result := Result + GetDirSize(Path + sr.Name + '\')
    else
      Result := Result + (sr.FindData.nFileSizeHigh * MAXDWORD) + sr.FindData.nFileSizeLow;
    Res := FindNext(sr);
  end;
  FindClose(sr);
end;

{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.RemoveFile(SourceDir: AnsiString; SourceFile: AnsiString): Boolean;
var
  SrcDir: PDirEntry;
  SrcFile: PFileEntry;
begin
  Result := false;
  SrcDir := FindDir(SourceDir);
  if SrcDir = nil then
    Exit;
  SrcFile := FindFile(SrcDir, SourceFile);
  if SrcFile = nil then
    Exit;
  Result := RemoveFile(SrcDir, SrcFile);
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.RenameFile(SourceFile: PFileEntry; NewLongName, NewShortName: AnsiString): Boolean;
begin
  Result := false;
  SourceFile.LongName := NewLongName;
  if NewShortName = '' then
    NewShortName := NewLongName;
  if Length(NewShortName) > 13 then
    Exit;
  SourceFile.ShortName := UpperCase(NewShortName);
  SortFiles(SourceFile.dirRec.Files, fJoliet); //文件排序,如不排序会影响引导类型的光盘
  Result := True;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.RenameFile(SourceDir, SourceFile: AnsiString; NewLongName, NewShortName: AnsiString): Boolean;
var
  SrcDir: PDirEntry;
  SrcFile: PFileEntry;
begin
  Result := false;
  SrcDir := FindDir(SourceDir);
  if SrcDir = nil then
    Exit;
  SrcFile := FindFile(SrcDir, SourceFile);
  if SrcFile = nil then
    Exit;
  Result := RenameFile(SrcFile, NewLongName, NewShortName);
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

function TCnsCDBurner.ExtractFile(FileToExtract: PFileEntry; TargetFile: AnsiString): Boolean;
var
  BytesToRead, SectorsToRead, BytesLeft, I: Cardinal;
  Buf: array[0..MaxWord] of AnsiChar;
  F: TFileStream;
begin

  DebugMsg('>>> ' + Format(MSG_EXTRACTING_FILE, [FileToExtract.LongName, TargetFile]), mtMessage);
  I := FileToExtract.Address;
  FillChar(Buf, SizeOf(Buf), 0);
  BytesLeft := FileToExtract.FileSize;
  F := TFileStream.Create(TargetFile, fmCreate);
  while BytesLeft <> 0 do
  begin
    if BytesLeft < 31 * DefaultSectorSize then
      BytesToRead := BytesLeft
    else
      BytesToRead := 31 * DefaultSectorSize;
    SectorsToRead := Sectors(BytesToRead);
    Read10(I, SectorsToRead, Buf, SectorsToRead * DefaultSectorSize);
    F.Write(Buf[0], BytesToRead);
    Inc(I, SectorsToRead);
    Dec(BytesLeft, BytesToRead);
  end;
  FileSetDate(F.Handle, DateTimeToFileDate(FileToExtract.Time));
  F.Destroy;
  Result := True;
end;
{******************************************************************************}
{                                                                              }
{******************************************************************************}

{******************************************************************************}
{                                                                              }
{******************************************************************************}
//2008-08-22  ADD

function TCnsCDBurner.GetMediumSize(const Value: TMediumType): DWORD;
const
  MediumSize: array[TMediumType] of DWORD = ($17124, $1A400, $514C8, $57E40, $62E08, $6CC3C,
    $A8C00, $151800, $1D70A3, $22F5C2, $3F9999, $45EB85);
begin
  Result := MediumSize[Value];
end;

function TCnsCDBurner.HiddenFileOrDir(SourceDir: PDirEntry; SourceFileOrDir: AnsiString; IsDir: Boolean; FileAttributes: TFileAttributes): Boolean;
const
  FileAttr: array[Boolean, TFileAttributes] of Integer = ((0, 1, 4, 5), (2, 3, 6, 7));
var
  SrcFile: PFileEntry;
begin
  Result := false;
  SrcFile := FindFile(SourceDir, SourceFileOrDir);
  if SrcFile = nil then
    Exit;

  SrcFile.FileAttr := FileAttr[IsDir, FileAttributes];
  Result := True;
end;

function TCnsCDBurner.HiddenFileOrDir(SourceDir, SourceFileOrDir: AnsiString; IsDir: Boolean; FileAttributes: TFileAttributes): Boolean;
var
  SrcDir: PDirEntry;
begin
  Result := false;
  SrcDir := FindDir(SourceDir);
  if SrcDir = nil then
    Exit;
  Result := HiddenFileOrDir(SrcDir, SourceFileOrDir, IsDir, FileAttributes);
end;

function TCnsCDBurner.GetFileSize(const FileName: AnsiString): Int64;
begin //获取文件大小
  Result := 0;
  if not FileExists(FileName) then
    Exit;
  with TFileStreamEx.Create(FileName, fmOpenRead or fmShareDenyNone) do
  try
    Result := Size;
  finally Free;
  end;
end;

procedure TCnsCDBurner.SetNoUseISOVersionNumber(const Value: Boolean);
begin
  fNoUseISOVersionNumber := Value;
  if Value then
    fSuf := ''
  else
    fSuf := ';1';
end;

procedure TCnsCDBurner.DoDebugMsg(Msg: AnsiString; mType: Byte);
begin
  if DoDebug then
    DebugMsg(Msg, mType);
end;

function TCnsCDBurner.ControlDeviceDoor(DriveLetter: AnsiChar; Status: TDevice_Status): Boolean;
const
  DoorStatus: array[TDevice_Status] of Integer = (MCI_SET_DOOR_OPEN, MCI_SET_DOOR_CLOSED);
var
  Res: MciError;
  OpenParm: TMCI_OPEN_Parms;
  Flags: DWORD;
  DeviceID: Word;
  Letter: String;
begin
  Result := false;
  Letter := DriveLetter + ':';
  Flags := mci_Open_Type or mci_Open_Element;
  with OpenParm do
  begin
    dwCallBack := 0;
    lpstrDeviceType := 'CDAudio';
    lpstrElementName := PChar(Letter);
  end;
  Res := mciSendCommand(0, mci_Open, Flags, LongInt(@OpenParm));
  if Res <> 0 then
    Exit;
  DeviceID := OpenParm.wDeviceID;
  try
    Res := mciSendCommand(DeviceID, MCI_SET, DoorStatus[Status], 0);
    if Res = 0 then
      Exit;
    Result := True;
  finally
    mciSendCommand(DeviceID, mci_Close, Flags, LongInt(@OpenParm));
  end;
end;

function TCnsCDBurner.SaveISOBootimageToDisk(ISOFileName, BootOutputFileName: AnsiString): Boolean;
var
  ISO_Handle, BOOT_Handle: THandle;
  PVD: TVolumeDescriptor;
  BVD: TBootVolumeDescriptor;
  BC: TBootCatalog;
  ISOFileSize: Int64;
  BootImage: Pointer;
  BootImageSize: Integer;
begin
  Result := false;
  if not FileExists(ISOFileName) then
    Exit;
  if (CompareText(ExtractFileExt(ISOFileName), '.ISO') <> 0) then
    Exit;

  ISO_Handle := FileOpen(ISOFileName, fmOpenRead or fmShareDenyWrite);
  if ISO_Handle = INVALID_HANDLE_VALUE then
    Exit;

  ISOFileSize := Windows.GetFileSize(ISO_Handle, nil);
  FileSeek(ISO_Handle, DefaultSectorSize * ZerosHeaderSize, soFromBeginning);
  FillChar(PVD, SizeOf(PVD), 0);
  FileRead(ISO_Handle, PVD, SizeOf(PVD));
  if PVD.NoOfSectors = Sectors(ISOFileSize) then
  begin
    FillChar(BVD, SizeOf(BVD), 0);
    FileRead(ISO_Handle, BVD, SizeOf(BVD));
    if BVD.BootCatLocation <> 0 then
    begin
      FileSeek(ISO_Handle, PVD.SectorSize * BVD.BootCatLocation, soFromBeginning);
      FillChar(BC, SizeOf(BC), 0);
      FileRead(ISO_Handle, BC, SizeOf(BC));
      if BC.BootIndicator = $88 then
      begin

        FileSeek(ISO_Handle, PVD.SectorSize * BC.LoadRBA, soFromBeginning);
        case BC.BootMediaType of
          0: BootImageSize := DefaultSectorSize;
          1: BootImageSize := 600 * DefaultSectorSize;
          2: BootImageSize := 720 * DefaultSectorSize;
          3: BootImageSize := 1440 * DefaultSectorSize;
        else
          BootImageSize := DefaultSectorSize;
        end;

        BOOT_Handle := FileCreate(BootOutputFileName);
        if BOOT_Handle <> INVALID_HANDLE_VALUE then
        begin
          GetMem(BootImage, BootImageSize);
          if FileRead(ISO_Handle, BootImage^, BootImageSize) <> -1 then
            Result := FileWrite(BOOT_Handle, BootImage^, BootImageSize) <> 0;
          FreeMem(BootImage);
          FileClose(BOOT_Handle);
        end;

      end;
    end;
  end;
  FileClose(ISO_Handle);
end;

const
  MAX_DATABLOCKS = 16;

function TCnsCDBurner.RipDiskToISOImage(ISOFileName: AnsiString; BackupISO: Boolean = false): Boolean;
var
  ISOStream: TFileStreamEx;
  Buf: Pointer;
  BufLen, ByWriteln, SectorSize, DataBlocks, IndexBlock, LastBlock: Integer;
  DataSize: Int64;
begin
  Result := false;
  fAborted := false;
  ISOStream := nil;
  if not TestUnitReady then
    Exit;
  SectorSize := ConvertDataBlock(MODE_1);
  BufLen := MAX_DATABLOCKS * SectorSize;
  LastBlock := UsedBlocksOnDisc;

  if LastBlock < 1 then
    Exit;
  if ISOFileName <> '' then
    ISOStream := TFileStreamEx.Create(ISOFileName, fmCreate);
  try
    GetMem(Buf, BufLen);
    FillChar(Buf^, BufLen, 0);
    IndexBlock := 0;
    DataBlocks := MAX_DATABLOCKS;
    DataSize := 0;
    if Assigned(fOnRipDiskProgress) then
      fOnRipDiskProgress(Self, Buf, BufLen, IndexBlock, 0, rdBegin);
    while IndexBlock < LastBlock - 1 do
    begin
      if ((LastBlock - IndexBlock) < DataBlocks) then
      begin
        DataBlocks := (LastBlock - IndexBlock);
        BufLen := DataBlocks * SectorSize;
      end;

      if Read10(IndexBlock, DataBlocks, Buf, BufLen) then
      begin
        if ISOFileName <> '' then
          ByWriteln := ISOStream.Write(PChar(Buf)^, BufLen)
        else
          ByWriteln := BufLen;
        Inc(DataSize, ByWriteln);
        if Assigned(fOnRipDiskProgress) then
          fOnRipDiskProgress(Self, Buf, BufLen, IndexBlock, (IndexBlock div ((LastBlock - 1) div 100)), rdDataing);
      end;

      IndexBlock := IndexBlock + DataBlocks;
      Application.ProcessMessages;
      if fAborted then
        Break;
    end;
    if (DataSize > 0) and (Sectors(DataSize) = LastBlock) then
      Result := True;

    FillChar(Buf^, BufLen, 0);
    if Assigned(fOnRipDiskProgress) then
      fOnRipDiskProgress(Self, Buf, BufLen, IndexBlock, 100, rdEnd);
    FreeMem(Buf);
  finally
    if ISOFileName <> '' then
      ISOStream.Free;
  end;
end;

type
  TWaveHeader = record
    { RIFF file header }
    RIFFHeader: array[1..4] of AnsiChar; { Must be "RIFF" }
    FileSize: Integer; { Must be "RealFileSize - 8" }
    WAVEHeader: array[1..4] of AnsiChar; { Must be "WAVE" }
    { Format information }
    FormatHeader: array[1..4] of AnsiChar; { Must be "fmt " }
    FormatSize: Integer; { Must be 16 (decimal) }
    FormatCode: Word; { Must be 1 }
    ChannelNumber: Word; { Number of channels }
    SampleRate: Integer; { Sample rate (hz) }
    BytesPerSecond: Integer; { Bytes per second }
    BytesPerSample: Word; { Bytes per Sample }
    BitsPerSample: Word; { Bits per sample }
    { Data area }
    DataHeader: array[1..4] of AnsiChar; { Must be "data" }
    DataSize: Integer; { Data size }
  end;

function CreateWaveHeader: TWaveHeader;
var
  WAVEHeader: TWaveHeader;
begin
  FillChar(WAVEHeader, SizeOf(TWaveHeader), 0);
  WAVEHeader.RIFFHeader := 'RIFF'; { Must be "RIFF" }
  WAVEHeader.FileSize := 0; { Must be "RealFileSize - 8" }
  WAVEHeader.WAVEHeader := 'WAVE'; { Must be "WAVE" }
  { Format information }
  WAVEHeader.FormatHeader := 'fmt '; { Must be "fmt " }
  WAVEHeader.FormatSize := 16; { Must be 16 (decimal) }
  WAVEHeader.FormatCode := WAVE_FORMAT_PCM; { Must be 1 }
  WAVEHeader.ChannelNumber := 2; { Number of channels }
  WAVEHeader.SampleRate := 44100; { Sample rate (hz) }
  WAVEHeader.BytesPerSample := MulDiv(WAVEHeader.ChannelNumber, WAVEHeader.FormatSize, 8); { Bytes per Sample }
  WAVEHeader.BytesPerSecond := (WAVEHeader.SampleRate * WAVEHeader.BytesPerSample); { Bytes per second }
  WAVEHeader.BitsPerSample := WAVEHeader.FormatSize; { Bits per sample }
  { Data area }
  WAVEHeader.DataHeader := 'data'; { Must be "data" }
  WAVEHeader.DataSize := 0; { Data size }
  Result := WAVEHeader;
end;

function TCnsCDBurner.RipAudioTrack(TrackIndex: Integer; TracksOutPath: AnsiString): Boolean;
var
  WaveStream: TFileStreamEx;
  FWaveHeader: TWaveHeader;
  Buf: Pointer;
  BufLen, ByWriteln, SectorSize, DataBlocks, IndexBlock, LastBlock: Integer;
  WavSize: Int64;
  TrackFileName: AnsiString;
begin
  Result := false;
  fAborted := false;
  WaveStream := nil;
  if TrackIndex < 1 then
    Exit;
  if not ReadTrackInformation(TrackIndex) then
    Exit;
  IndexBlock := TrackInformation.TrackStartAddress;
  LastBlock := TrackInformation.TrackStartAddress + TrackInformation.TrackSize;
  if TrackInformation.TrackSize = 0 then
    Exit;

  SectorSize := ConvertDataBlock(RAW_DATA_BLOCK); //音频CD默认区段大小
  BufLen := MAX_DATABLOCKS * SectorSize;

  TrackFileName := IncludeTrailingBackslash(TracksOutPath) + 'Track' + IntToDec(TrackIndex) + '.wav';
  if TracksOutPath <> '' then
  begin
    FWaveHeader := CreateWaveHeader;
    WaveStream := TFileStreamEx.Create(TrackFileName, fmCreate);
    WaveStream.Write(FWaveHeader, SizeOf(FWaveHeader));
  end;
  try
    GetMem(Buf, BufLen);
    FillChar(Buf^, BufLen, 0);
    DataBlocks := MAX_DATABLOCKS;
    WavSize := 0;
    if Assigned(fOnRipDiskProgress) then
      fOnRipDiskProgress(Self, Buf, BufLen, IndexBlock, 0, rdBegin);
    while IndexBlock < LastBlock do
    begin
      if ((LastBlock - IndexBlock) < DataBlocks) then
      begin
        DataBlocks := (LastBlock - IndexBlock);
        BufLen := DataBlocks * SectorSize;
      end;

      if ReadCD(IndexBlock, DataBlocks, Buf, BufLen, 4, $10, 0) then
      begin
        if TracksOutPath <> '' then
          ByWriteln := WaveStream.Write(PChar(Buf)^, BufLen)
        else
          ByWriteln := BufLen;
        Inc(WavSize, ByWriteln);
        if Assigned(fOnRipDiskProgress) then
          fOnRipDiskProgress(Self, Buf, BufLen, IndexBlock, (IndexBlock div ((LastBlock - 1) div 100)), rdDataing);
      end;

      IndexBlock := IndexBlock + DataBlocks;
      if fAborted then
        Break;
      Application.ProcessMessages;
    end;
    if (WavSize > 0) and (WavSize div SectorSize = TrackInformation.TrackSize) then
      Result := True;
    if TracksOutPath <> '' then
    begin
      FWaveHeader.FileSize := (SizeOf(FWaveHeader) + WavSize) - 8;
      FWaveHeader.DataSize := WavSize;
      WaveStream.Position := 0;
      WaveStream.Write(FWaveHeader, SizeOf(FWaveHeader));
    end;

    FillChar(Buf^, BufLen, 0);
    if Assigned(fOnRipDiskProgress) then
      fOnRipDiskProgress(Self, Buf, BufLen, IndexBlock, 100, rdEnd);
    FreeMem(Buf);
  finally
    if TracksOutPath <> '' then
      WaveStream.Free;
  end;
  if Result = false then
    DeleteFile(TrackFileName);
end;

function TCnsCDBurner.RipAllAudioTracks(TracksOutPath: AnsiString): Boolean;
var
  TrackIndex: Integer;
  TOCData0000: TTOCData0000;
begin
  Result := false;
  if not TestUnitReady() then
    Exit;
  FillChar(TOCData0000, SizeOf(TOCData0000), 0);
  if ReadTOC(0, @TOCData0000, SizeOf(TOCData0000)) then
  begin
    for TrackIndex := TOCData0000.FirstTrackNumber to TOCData0000.LastTrackNumber do
    begin
      if not RipAudioTrack(TrackIndex, TracksOutPath) then
      begin
        Result := false;
        Exit;
      end;
      if fAborted then
        Exit;
    end;
    Result := True;
  end;
end;

//========================================
const
  CRC32Table: array[0..255] of DWORD =
  ($00000000, $77073096, $EE0E612C, $990951BA, $076DC419, $706AF48F, $E963A535, $9E6495A3,
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
var
  Crc_Buffer: array[1..8192] of Byte;

procedure CRC32Process(var crc: DWORD; const Size: Integer);
var
  Index: Integer;
begin
  for Index := 1 to Size do
    crc := ((crc shr 8) and $FFFFFF) xor CRC32Table[(crc xor DWORD(Crc_Buffer[Index])) and $FF];
end;

function Crc32Stream(const Stream: TStream): DWORD;
var
  Buf: Integer;
begin
  Result := $FFFFFFFF;
  if Stream.Size < 1 then
    Exit;
  Stream.Position := 0;
  while (Stream.Position <> Stream.Size) do
  begin
    Buf := Stream.Read(Crc_Buffer, SizeOf(Crc_Buffer));
    CRC32Process(Result, Buf);
  end;
  FillChar(Crc_Buffer, SizeOf(Crc_Buffer), 0);
  Result := not Result;
end;

function Crc32File(const FileName: AnsiString): DWORD;
var
  Stream: TFileStream;
begin
  Result := $FFFFFFFF;
  if not FileExists(FileName) then
    Exit;
  try
    Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
    Result := Crc32Stream(Stream);
    Stream.Free;
  except
    Exit;
  end;
end;

procedure TCnsCDBurner.DoOptimiz;
  function IsSameFile(Index: Integer): Boolean;
  var
    J: Integer;
  begin
    Result := false;
    for J := 0 to FileCounter - 1 do
    begin
      if fAborted then
        Break;
      if (J <> Index) and (Files[J].SameID = 0) then
        if (Files[J].Attr and faDirectory <> faDirectory) then
        begin
          if Files[J].CrcChecksum = $FFFFFFFF then
            Files[J].CrcChecksum := Crc32File(Files[J].Path);
          if (Files[J].CrcChecksum = Files[Index].CrcChecksum) then
          begin
            Files[J].SameID := 2;
            Files[J].SameIndex := Files[Index].SameIndex;
          end;
        end;
    end;
  end;
var
  I: Integer;
  P: PFileEntry;
begin
  if not fOptimized then
    Exit;
  DoDebugMsg('Now Optimizing...', mtMessage);
  for I := 0 to FileCounter - 1 do
  begin
    if fAborted then
    begin
      DoDebugMsg('Optimiz Aborted.', mtMessage);
      Exit;
    end;
    P := Files[I];
    if P.SameID <> 2 then
      P.SameIndex := I;
    if (P.Attr and faDirectory <> faDirectory) then
    begin
      if P.CrcChecksum = $FFFFFFFF then
        P.CrcChecksum := Crc32File(P.Path);
      if P.SameID = 0 then
        IsSameFile(I);
      fFileInProcess := P.Path;
      if Assigned(fOnOptimizProgress) then
        fOnOptimizProgress(Self, I * 100 div (FileCounter - 1));
      Application.ProcessMessages;

    end;
  end;
  DoDebugMsg('Optimiz Done.', mtMessage);
end;

function TCnsCDBurner.StrToSpeed(SpeedStr: AnsiString): Word;
var
  Divider: Integer;
begin
  if  (SpeedStr = 'Max') or (SpeedStr = '') then
    Result := 0
  else
  begin
    if DiscType >= mtDVD_ROM then
      Divider := 1385
    else
      Divider := 177;
    Result := Round(StrToFloat(Copy(SpeedStr, 1, Pos('X', SpeedStr) - 1)) * Divider);
  end;
end;

function TCnsCDBurner.GetSupportWriteSpeedList(Strings: TStrings; DefaultItemIndex: Integer): Integer;
var
  li: Integer;
  Speeds, ActSpd: Integer;
  Str: AnsiString;
  Divider: Double;
  Medium: Integer;
begin
  Medium := DiscType;
  if Medium >= mtDVD_ROM then
    Divider := 1385
  else
    Divider := 176.4;
  li := DefaultItemIndex;
  Strings.Clear;
  Strings.Add('Max');
  Speeds := MaxWriteSpeed;
  while Speeds > 0 do
  begin
    WriteSpeed := Speeds;
    ActSpd := CurrentWriteSpeed;
    if Medium >= mtDVD_ROM then
      Str := FormatFloat('0.0X ', ActSpd / Divider) + FormatFloat('(#,##0 KB/s)', ActSpd)
    else
      Str := FormatFloat('0X ', ActSpd / Divider) + FormatFloat('(#,##0 KB/s)', ActSpd);
    if Strings.IndexOf(Str) < 0 then
      Strings.Add(Str);
    if Medium >= mtDVD_ROM then
      Dec(Speeds, 700)
    else
      Dec(Speeds, 176);
  end;

  if li = -1 then
    Result := 0
  else
    if li <= Strings.Count then
    Result := li
  else
    Result := 0;
end;

procedure TCnsCDBurner.ShowDeviceCaps;
begin
  with TDeviceCapsForm.Create(Self) do
  try
    ReadCDR.Checked := dcReadCDR in self.DeviceCapabilities;
    ReadCDRW.Checked := dcReadCDRW in self.DeviceCapabilities;
    ReadDVD.Checked := dcReadDVD in self.DeviceCapabilities;
    ReadDVDR.Checked := dcReadDVDR in self.DeviceCapabilities;
    ReadDVDRW.Checked := dcReadDVDRW in self.DeviceCapabilities;
    ReadDVDRAM.Checked := dcReadDVDRAM in self.DeviceCapabilities;
    ReadDVDPR.Checked := dcReadDVDPLUSR in self.DeviceCapabilities;
    ReadDVDPRW.Checked := dcReadDVDPLUSRW in self.DeviceCapabilities;

    WriteCDR.Checked := dcWriteCDR in self.DeviceCapabilities;
    WriteCDRW.Checked := dcWriteCDRW in self.DeviceCapabilities;
    WriteDVDR.Checked := dcWriteDVDR in self.DeviceCapabilities;
    WriteDVDRW.Checked := dcWriteDVDRW in self.DeviceCapabilities;
    WriteDVDPR.Checked := dcWriteDVDPLUSR in self.DeviceCapabilities;
    WriteDVDPRW.Checked := dcWriteDVDPLUSRW in self.DeviceCapabilities;

    WriteDVDRAM.Checked := dcWriteDVDRAM in self.DeviceCapabilities;
    WriteTest.Checked := dcWriteTest in self.DeviceCapabilities;
    UnderrunProtection.Checked := dcUnderrunProtection in self.DeviceCapabilities;
    Label1.Caption := '  ' + self.Device;
    Label2.Caption := 'Max Write Speed   :  ' + FormatFloat('0x', self.DeviceMaxWriteSpeed);
    Label3.Caption := 'Max Read Speed    :  ' + FormatFloat('0x', self.DeviceMaxReadSpeed);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TCnsCDBurner.ShowDeviceSetting;
begin
  with TfrmSettings.Create(Self) do
  try
    mcdb1 := self;
    cEject.Checked := ccEject;
    cShowFiles.Checked := ccShowFiles;
    cImportSession.Checked := ccImportSession;
    ShowModal;
  finally
    Free;
  end;
end;
end.

