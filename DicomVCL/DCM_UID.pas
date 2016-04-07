{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DCM_UID;
{$I DicomPack.inc}
interface

uses classes, sysutils, DCM_Hash, Dialogs;

const
  Verification = 4097;
  MediaStorageDirectoryStorage = 4098;
  BasicStudyContentNotification = 4099;
  StorageCommitmentPushModel = 4100;
  StorageCommitmentPullModel = 4101;
  DetachedPatientManagement = 4102;
  DetachedVisitManagement = 4103;
  DetachedStudyManagement = 4104;
  StudyComponentManagement = 4105;
  DetachedResultsManagement = 4106;
  DetachedInterpretationManagement = 4107;
  BasicFilmSession = 4108;
  BasicFilmBox = 4109;
  BasicGrayscaleImageBox = 4110;
  BasicColorImageBox = 4111;
  ReferencedImageBox = 4112;
  PrintJob = 4113;
  BasicAnnotationBox = 4114;
  uidPrinter = 4115;
  VOILUTBox = 4116;
  ImageOverlayBox = 4117;
  ComputedRadiographyImageStorage = 4118;
  CTImageStorage = 4119;
  UltrasoundMultiframeImageStorage = 4120;
  MRImageStorage = 4121;
  UltrasoundImageStorage = 4122;
  SecondaryCaptureImageStorage = 4123;
  StandaloneOverlayStorage = 4124;
  StandaloneCurveStorage = 4125;
  StandaloneModalityLUTStorage = 4126;
  StandaloneVOILUTStorage = 4127;
  XRayAngiographicImageStorage = 4128;
  XRayRadiofluoroscopicImageStorage = 4129;
  XRayAngiographicBiPlaneImageStorage = 4130;
  NuclearMedicineImageStorage = 4131;
  PatientRootQueryRetrieveInformationModelFIND = 4132;
  PatientRootQueryRetrieveInformationModelMOVE = 4133;
  PatientRootQueryRetrieveInformationModelGET = 4134;
  StudyRootQueryRetrieveInformationModelFIND = 4135;
  StudyRootQueryRetrieveInformationModelMOVE = 4136;
  StudyRootQueryRetrieveInformationModelGET = 4137;
  PatientStudyOnlyQueryRetrieveInformationModelFIND = 4138;
  PatientStudyOnlyQueryRetrieveInformationModelMOVE = 4139;
  PatientStudyOnlyQueryRetrieveInformationModelGET = 4140;
  ModalityWorklistInformationModelFIND = 4141;
  ModalityPerformedProcedureStep = 4142;
  ModalityPerformedProcedureStepRetrieve = 4143;
  ModalityPerformedProcedureStepNotification = 4144;
  PresentationLUT = 4145;
  PrintQueueManagement = 4146;
  StoredPrintStorage = 4147;
  HardcopyGrayscaleImageStorage = 4148;
  HardcopyColorImageStorage = 4149;
  PullPrintRequest = 4150;
  PositronEmissionTomographyImageStorage = 4151;
  StandalonePETCurveStorage = 4152;
  RTImageStorage = 4153;
  RTDoseStorage = 4154;
  RTStructureSetStorage = 4155;
  RTPlanStorage = 4156;
  UltrasoundMultiframeImageStorage_Retired = 4157;
  NuclearMedicineImageStorage_Retired = 4158;
  UltrasoundImageStorage_Retired = 4159;
  BasicPrintImageOverlayBox = 4160;
  VLEndoscopicImageStorage = 4161;
  VLMicroscopicImageStorage = 4162;
  VLSlideCoordinatesMicroscopicImageStorage = 4163;
  VLPhotographicImageStorage = 4164;
  GrayscaleSoftcopyPresentationState = 4165;
  BasicTextSR = 4166;
  EnhancedSR = 4167;
  ComprehensiveSR = 4168;
  TwelveLeadECGWaveformStorage = 4169;
  GeneralECGWaveformStorage = 4170;
  AmbulatoryECGWaveformStorage = 4171;
  HemodynamicWaveformStorage = 4172;
  CardiacElectrophysiologyWaveformStorage = 4173;
  BasicVoiceAudioWaveformStorage = 4174;
  PrinterConfigurationRetrieval = 4175;
  DXImageStorageForPresentation = 4176;
  DXImageStorageForProcessing = 4177;
  DXMammographyImageStorageForPresentation = 4178;
  DXMammographyImageStorageForProcessing = 4179;
  DXIntraOralImageStorageForPresentation = 4180;
  DXIntraOralImageStorageForProcessing = 4181;
  RTBeamsTreatmentRecordStorage = 4182;
  RTBrachyTreatmentRecordStorage = 4183;
  RTTreatmentRecordSummaryStorage = 4184;
  TianiMediaStorageDirectoryStorage = 4185;
  TianiSecondaryCaptureImageStorage = 4192;
  TianiStudyRootQueryRetrieveInformationModelMOVE = 4193;
  KeyObjectSelectionDocument = 4194;

  DBS_Verification = 4601;

  StorageCommitmentPushModelModelSOPInstance = 16385;
  StorageCommitmentPullModelModelSOPInstance = 16386;
  PrinterModelSOPInstance = 16387;
  PrintQueueModelSOPInstance = 16388;
  PrinterConfigurationRetrievalModelSOPInstance = 16389;

  DetachedPatientManagementMetaSOPClass = 12289;
  DetachedResultsManagementMetaSOPClass = 12290;
  DetachedStudyManagementMetaSOPClass = 12291;
  BasicGrayscalePrintManagementMetaSOPClass = 12292;
  ReferencedGrayscalePrintManagementMetaSOPClass = 12293;
  BasicColorPrintManagementMetaSOPClass = 12294;
  ReferencedColorPrintManagementMetaSOPClass = 12295;
  PullStoredPrintManagementMetaSOPClass = 12296;

  MPEG2MainProgileMainLevel = 12297;

  PrivateTransferSyntax = 8192;
  ImplicitVRLittleEndian = 8193;
  ExplicitVRLittleEndian = 8194;
  ExplicitVRBigEndian = 8195;
  RLELossless = 8198;
  //JPEG_1 = 8196;
  JPEGBaseline = 8196;
  //JPEG_14_SelectionValue1 = 8197;
  JPEGLossless = 8197;
  JPEGExtendedProcess_2_4 = 8199;
  JPEG_3_5 = 8200;
  JPEG_6_8 = 8201;
  JPEG_7_9 = 8202;
  JPEG_10_12 = 8203;
  JPEG_11_13 = 8204;
  JPEGLossless14 = 8205;
  JPEGLossless15 = 8206;
  JPEG_16_18 = 8207;
  JPEG_17_19 = 8208;
  JPEG_20_22 = 8209;
  JPEG_21_23 = 8210;
  JPEG_24_26 = 8211;
  JPEG_25_27 = 8212;
  JPEG_28 = 8213;
  JPEG_29 = 8214;
  {$IFDEF ECLZLIBTransferSyntax}
  zlibFastestTransferSyntax = 8215;
  ppmFastestTransferSyntax = 8216;
  bzipFastestTransferSyntax = 8217;

  zlibMaxTransferSyntax = 8222;
  ppmMaxTransferSyntax = 8223;
  bzipMaxTransferSyntax = 8224;

  zlibNormalTransferSyntax = 8225;
  ppmNormalTransferSyntax = 8226;
  bzipNormalTransferSyntax = 8227;
  {$ENDIF}
  JPEGLossless80 = 8218;
  JPEGNearLossless81 = 8219;
  JPEG2000Irreversible = 8220; //.90 lossless
  JPEG2000Reversible = 8221; //.91 losy

  cWorklistStateInProgress = 'IN PROGRESS';
  cWorklistStateDiscounted = 'DISCONTINUED';
  cWorklistStateCompleted  = 'COMPLETED';

  // 8218
type
  TUIDEntry = class;
  TUIDEntry = class
  private
    FConstant: Integer;
    FValue: AnsiString;
    FName: AnsiString;
    FShortName: AnsiString;
    FUIDType: Integer;
  protected
    SOPClass: Integer;
    WellknownSOPInstance: Integer;
    TransferSyntax: Integer;
    MetaSOPClass: Integer;
    ApplicationContextName: Integer;
  public
    { Public declarations }

    { public function declarations }
    constructor Create(i: Integer; s: AnsiString; s1: AnsiString; s2: AnsiString; j: Integer);
    function equals(obj: TUIDEntry): Boolean;
    function AsString: AnsiString;
    function AsLongString: AnsiString;

    property Constant: Integer read FConstant;
    property Value: AnsiString read FValue;
    property Name: AnsiString read FName;
    property ShortName: AnsiString read FShortName;
    property UIDType: Integer read FUIDType;
  end;
  TUIDEntryArray = array of TUIDEntry;
  TUID = class
  private
    fUnknownUID: Integer;
    DICOMApplicationContextName: Integer;
    FList: TList;
    FValueList: THashList;
    function getUIDEntryByIndex1(AIndex: Integer): TUIDEntry;
  protected
    procedure AddSOPInstance;
    procedure AddSOPClass;
    procedure AddMetaSOPClass;
    procedure AddTransferSyntax;
    function getUIDEntryByConstant(i: Integer): TUIDEntry;
    function getUIDEntryByValue(s: AnsiString): TUIDEntry;
    function GetUIDEntryByShortName(s: AnsiString): TUIDEntry;

  public
    { Public declarations }
    { public function declarations }
    procedure addEntry(i: Integer; uidentry: TUIDEntry);
    procedure Refresh;

    constructor Create;
    destructor Destroy; override;

    function Count:integer;
    procedure UserAddEntry(i: Integer; uidentry: TUIDEntry);
    function AsString(i: Integer): AnsiString;
    property Items[AValue: AnsiString]: TUIDEntry read getUIDEntryByValue;
    property ItemByConstant[AIndex: Integer]: TUIDEntry read getUIDEntryByConstant;

    property ItemByIndex1[AIndex: Integer]: TUIDEntry read getUIDEntryByIndex1;
  end;
var
  UIDS: TUID;
  UnknownUid: TUIDEntry;

  // процедура записи в лог-файл
procedure MnLg_ev ( const p_strs : ansistring;
                  const p_filename : ansistring = '';
                  const p_is_delim : Boolean = False;
                  const p_is_DT : boolean = True );

implementation

// процедура записи в лог-файл
procedure MnLg_ev ( const p_strs : ansistring;
                  const p_filename : ansistring = '';
                  const p_is_delim : Boolean = False;
                  const p_is_DT : boolean = True );
var F : TextFile; v_is_ex : Boolean;
const c_delim = '-------------------------------------------------------------------------------';
 { function GetFreeDiskSize: Int64;
  var free_size, total_size: Int64;
      RootPath: array[0..4] of Char;
      RootPtr: PChar;
      current_dir, v_tmp: string;
      drive: char;
  begin
    v_tmp := Trim(GetCurrentDir);
    drive:=v_tmp[1];
    RootPath[0] := Drive;
    RootPath[1] := ':';
    RootPath[2] := '\';
    RootPath[3] := #0;
    RootPtr := RootPath;
    current_dir := GetCurrentDir;
    if SetCurrentDir(drive + ':\') then
    begin
      GetDiskFreeSpaceEx(RootPtr, Free_size, Total_size, nil);
      // this to turn back to original dir
      SetCurrentDir(current_dir);
      Result := Trunc( Free_size/(1024 * 1024 * 1024) );
    end
    else
    begin
      Result := 0;
      Free_size  := -1;
      Total_size := -1;
    end;
  end;   }
  procedure wrt_err(p_str:ansistring);
  begin
  {  try
        AssignFile(F, p_filename+IntToStr(GetTickCount)+'_err');
        rewrite(F);
        writeln(F,DateTimeToStr(Now)+' '+p_str);
        Flush(F);
        CloseFile(F);
      except
      end;  }
  end;
const c_free_space = 5; // свободное место на диске - если меньше - не пишем логи
begin
  try
  //  if GetFreeDiskSize<c_free_space then Exit; // если места меньше  Gigabytes
    if Trim(p_filename)<>'' then begin
      v_is_ex:=FileExists(p_filename);
      AssignFile(F, p_filename);
      try
        try
          if v_is_ex then begin
            Append(F);
          end else begin
            rewrite(F);
          end;
          if p_is_delim then writeln(F,c_delim);
          if p_is_DT then
            writeln(F,DateTimeToStr(Now)+' '+p_strs)
          else
            writeln(F,p_strs);
          Flush(F);
        except
          on E:Exception do
            wrt_err(DateTimeToStr(Now)+' ERROR (append/rewrite): '+E.Message+#13+
                 ' original message : '+p_strs);
        end;
      finally
        try
          CloseFile(F);
        except
          on E:Exception do
            wrt_err(DateTimeToStr(Now)+' ERROR (CloseFile) : '+E.Message+#13+
                 ' original message : '+p_strs);
        end;
      end;
    end;
  except
    on E:Exception do
      wrt_err(DateTimeToStr(Now)+' ERROR (summary): '+E.Message+#13+
                 ' original message : '+p_strs);
  end;   
end;

function CompareUID(l, r: Pointer): Integer;
var
  u1, u2: TUIDEntry;
begin
  u1 := TUIDEntry(l);
  u2 := TUIDEntry(r);
  if u1.Constant > u2.Constant then
    Result := 1
  else
    if u1.Constant < u2.Constant then
    Result := -1
  else
    Result := 0;
end;

destructor TUID.Destroy;
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
    TUIDEntry(FList[i]).Free;
  FList.Free;
  if assigned(FValueList) then
    FValueList.Free;
  inherited Destroy;
end;

procedure TUID.Refresh;
var
  I: Integer;
  p1: TUIDEntry;
begin
  FList.Sort(CompareUID);
  if assigned(FValueList) then
    FValueList.Free;
  FValueList := THashList.Create(FList.Count, nil, nil);
  for I := 0 to FList.Count - 1 do // Iterate
  begin
    p1 := TUIDEntry(FList[i]);
    FValueList.Add(p1.Value, p1);
  end; // for
end;

procedure TUID.AddSOPClass;
begin
  addEntry(4097, TUIDEntry.Create(4097, '1.2.840.10008.1.1', 'Verification SOP Class', 'VE', 1));
  addEntry(4098, TUIDEntry.Create(4098, '1.2.840.10008.1.3.10', 'Media Storage Directory Storage SOP Class', 'MS', 1));
  addEntry(4099, TUIDEntry.Create(4099, '1.2.840.10008.1.9', 'Basic Study Content Notification SOP Class', 'CN', 1));
  addEntry(4100, TUIDEntry.Create(4100, '1.2.840.10008.1.20.1', 'Storage Commitment Push Model SOP Class', 'SP', 1));
  addEntry(4101, TUIDEntry.Create(4101, '1.2.840.10008.1.20.2', 'Storage Commitment Pull Model SOP Class', 'SP', 1));
  addEntry(4102, TUIDEntry.Create(4102, '1.2.840.10008.3.1.2.1.1', 'Detached Patient Management SOP Class', 'PM', 1));
  addEntry(4103, TUIDEntry.Create(4103, '1.2.840.10008.3.1.2.2.1', 'Detached Visit Management SOP Class', 'VM', 1));
  addEntry(4104, TUIDEntry.Create(4104, '1.2.840.10008.3.1.2.3.1', 'Detached Study Management SOP Class', 'SM', 1));
  addEntry(4105, TUIDEntry.Create(4105, '1.2.840.10008.3.1.2.3.2', 'Study Component Management SOP Class', 'SM', 1));
  addEntry(4106, TUIDEntry.Create(4106, '1.2.840.10008.3.1.2.5.1', 'Detached Results Management SOP Class', 'RM', 1));
  addEntry(4107, TUIDEntry.Create(4107, '1.2.840.10008.3.1.2.6.1', 'Detached Interpretation Management SOP Class', 'IM', 1));
  addEntry(4108, TUIDEntry.Create(4108, '1.2.840.10008.5.1.1.1', 'Basic Film Session SOP Class', 'FS', 1));
  addEntry(4109, TUIDEntry.Create(4109, '1.2.840.10008.5.1.1.2', 'Basic Film Box SOP Class', 'FB', 1));
  addEntry(4110, TUIDEntry.Create(4110, '1.2.840.10008.5.1.1.4', 'Basic Grayscale Image Box SOP Class', 'GI', 1));
  addEntry(4111, TUIDEntry.Create(4111, '1.2.840.10008.5.1.1.4.1', 'Basic Color ImageBox SOP Class', 'CI', 1));
  addEntry(4112, TUIDEntry.Create(4112, '1.2.840.10008.5.1.1.4.2', 'Referenced Image Box SOP Class', 'RI', 1));
  addEntry(4113, TUIDEntry.Create(4113, '1.2.840.10008.5.1.1.14', 'Print Job SOP Class', 'PJ', 1));
  addEntry(4114, TUIDEntry.Create(4114, '1.2.840.10008.5.1.1.15', 'Basic Annotation Box SOP Class', 'AB', 1));
  addEntry(4115, TUIDEntry.Create(4115, '1.2.840.10008.5.1.1.16', 'Printer SOP Class', 'P ', 1));
  addEntry(4116, TUIDEntry.Create(4116, '1.2.840.10008.5.1.1.22', 'VOI LUT Box SOP Class', 'VL', 1));
  addEntry(4117, TUIDEntry.Create(4117, '1.2.840.10008.5.1.1.24', 'Image Overlay Box SOP Class', 'IO', 1));
  addEntry(4118, TUIDEntry.Create(4118, '1.2.840.10008.5.1.4.1.1.1', 'Computed Radiography Image Storage SOP Class', 'CR', 1));
  addEntry(4119, TUIDEntry.Create(4119, '1.2.840.10008.5.1.4.1.1.2', 'CT Image Storage SOP Class', 'CT', 1));
  addEntry(4120, TUIDEntry.Create(4120, '1.2.840.10008.5.1.4.1.1.3.1', 'Ultrasound Multi-frame Image Storage SOP Class', 'US', 1));
  addEntry(4121, TUIDEntry.Create(4121, '1.2.840.10008.5.1.4.1.1.4', 'MR Image Storage SOP Class', 'MR', 1));
  addEntry(4122, TUIDEntry.Create(4122, '1.2.840.10008.5.1.4.1.1.6.1', 'Ultrasound Image Storage SOP Class', 'US', 1));
  addEntry(4123, TUIDEntry.Create(4123, '1.2.840.10008.5.1.4.1.1.7', 'Secondary Capture Image Storage SOP Class', 'SC', 1));
  addEntry(4124, TUIDEntry.Create(4124, '1.2.840.10008.5.1.4.1.1.8', 'Standalone Overlay Storage SOP Class', 'SO', 1));
  addEntry(4125, TUIDEntry.Create(4125, '1.2.840.10008.5.1.4.1.1.9', 'Standalone Curve Storage SOP Class', 'SC', 1));
  addEntry(4126, TUIDEntry.Create(4126, '1.2.840.10008.5.1.4.1.1.10', 'Standalone Modality LUT Storage SOP Class', 'ML', 1));
  addEntry(4127, TUIDEntry.Create(4127, '1.2.840.10008.5.1.4.1.1.11', 'Standalone VOI LUT Storage SOP Class', 'VL', 1));
  addEntry(4128, TUIDEntry.Create(4128, '1.2.840.10008.5.1.4.1.1.12.1', 'X-Ray Angiographic Image Storage SOP Class', 'XA', 1));
  addEntry(4129, TUIDEntry.Create(4129, '1.2.840.10008.5.1.4.1.1.12.2', 'X-Ray Radiofluoroscopic Image Storage SOP Class', 'XR', 1));
  addEntry(4130, TUIDEntry.Create(4130, '1.2.840.10008.5.1.4.1.1.12.3', 'X-Ray Angiographic Bi-Plane Image Storage SOP Class', 'XA', 1));
  addEntry(4131, TUIDEntry.Create(4131, '1.2.840.10008.5.1.4.1.1.20', 'Nuclear Medicine Image Storage SOP Class', 'NM', 1));
  addEntry(4132, TUIDEntry.Create(4132, '1.2.840.10008.5.1.4.1.2.1.1', 'Patient Root Query/Retrieve Information Model - FIND SOP Class', 'PF', 1));
  addEntry(4133, TUIDEntry.Create(4133, '1.2.840.10008.5.1.4.1.2.1.2', 'Patient Root Query/Retrieve Information Model - MOVE SOP Class', 'PM', 1));
  addEntry(4134, TUIDEntry.Create(4134, '1.2.840.10008.5.1.4.1.2.1.3', 'Patient Root Query/Retrieve Information Model - GET SOP Class', 'PG', 1));
  addEntry(4135, TUIDEntry.Create(4135, '1.2.840.10008.5.1.4.1.2.2.1', 'Study Root Query/Retrieve Information Model - FIND SOP Class', 'SF', 1));
  addEntry(4136, TUIDEntry.Create(4136, '1.2.840.10008.5.1.4.1.2.2.2', 'Study Root Query/Retrieve Information Model - MOVE SOP Class', 'SM', 1));
  addEntry(4137, TUIDEntry.Create(4137, '1.2.840.10008.5.1.4.1.2.2.3', 'Study Root Query/Retrieve Information Model - GET SOP Class', 'SG', 1));
  addEntry(4138, TUIDEntry.Create(4138, '1.2.840.10008.5.1.4.1.2.3.1', 'Patient/Study Only Query/Retrieve Information Model - FIND SOP Class', 'F ', 1));
  addEntry(4139, TUIDEntry.Create(4139, '1.2.840.10008.5.1.4.1.2.3.2', 'Patient/Study Only Query/Retrieve Information Model - MOVE SOP Class', 'M ', 1));
  addEntry(4140, TUIDEntry.Create(4140, '1.2.840.10008.5.1.4.1.2.3.3', 'Patient/Study Only Query/Retrieve Information Model - GET SOP Class', 'G ', 1));
  addEntry(4141, TUIDEntry.Create(4141, '1.2.840.10008.5.1.4.31', 'Modality Worklist Information Model - FIND SOP Class', 'MW', 1));
  addEntry(4142, TUIDEntry.Create(4142, '1.2.840.10008.3.1.2.3.3', 'Modality Performed Procedure Step SOP Class', 'MP', 1));
  addEntry(4143, TUIDEntry.Create(4143, '1.2.840.10008.3.1.2.3.4', 'Modality Performed Procedure Step Retrieve  SOP Class', 'PR', 1));
  addEntry(4144, TUIDEntry.Create(4144, '1.2.840.10008.3.1.2.3.5', 'Modality Performed Procedure Step Notification SOP Class', 'PN', 1));
  addEntry(4145, TUIDEntry.Create(4145, '1.2.840.10008.5.1.1.23', 'Presentation LUT SOP Class', 'PL', 1));
  addEntry(4146, TUIDEntry.Create(4146, '1.2.840.10008.5.1.1.26', 'Print Queue Management SOP Class', 'PQ', 1));
  addEntry(4147, TUIDEntry.Create(4147, '1.2.840.10008.5.1.1.27', 'Stored Print Storage SOP Class', 'SP', 1));
  addEntry(4148, TUIDEntry.Create(4148, '1.2.840.10008.5.1.1.29', 'Hardcopy Grayscale Image Storage SOP Class', 'HG', 1));
  addEntry(4149, TUIDEntry.Create(4149, '1.2.840.10008.5.1.1.30', 'Hardcopy Color Image Storage SOP Class', 'HC', 1));
  addEntry(4150, TUIDEntry.Create(4150, '1.2.840.10008.5.1.1.31', 'Pull Print Request SOP Class', 'PP', 1));
  addEntry(4151, TUIDEntry.Create(4151, '1.2.840.10008.5.1.4.1.1.128', 'Positron Emission Tomography Image Storage SOP Class', 'PE', 1));
  addEntry(4152, TUIDEntry.Create(4152, '1.2.840.10008.5.1.4.1.1.129', 'Standalone PET Curve Storage SOP Class', 'PC', 1));
  addEntry(4153, TUIDEntry.Create(4153, '1.2.840.10008.5.1.4.1.1.481.1', 'RT Image Storage SOP Class', 'RI', 1));
  addEntry(4154, TUIDEntry.Create(4154, '1.2.840.10008.5.1.4.1.1.481.2', 'RT Dose Storage SOP Class', 'RD', 1));
  addEntry(4155, TUIDEntry.Create(4155, '1.2.840.10008.5.1.4.1.1.481.3', 'RT Structure Set Storage SOP Class', 'RS', 1));
  addEntry(4156, TUIDEntry.Create(4156, '1.2.840.10008.5.1.4.1.1.481.5', 'RT Plan Storage SOP Class', 'RP', 1));
  addEntry(4157, TUIDEntry.Create(4157, '1.2.840.10008.5.1.4.1.1.3', 'Ultrasound Multi-frame Image Storage Retired SOP Class', 'UM', 1));
  addEntry(4158, TUIDEntry.Create(4158, '1.2.840.10008.5.1.4.1.1.5', 'Nuclear Medicine Image Storage Retired SOP Class', 'NM', 1));
  addEntry(4159, TUIDEntry.Create(4159, '1.2.840.10008.5.1.4.1.1.6', 'Ultrasound Image Storage Retired SOP Class', 'US', 1));
  addEntry(4160, TUIDEntry.Create(4160, '1.2.840.10008.5.1.1.24.1', 'Basic Print Image Overlay Box SOP Class', 'OB', 1));
  addEntry(4161, TUIDEntry.Create(4161, '1.2.840.10008.5.1.4.1.1.77.1.1', 'Visible Light Endoscopic Image Storage SOP Class', 'VL', 1));
  addEntry(4162, TUIDEntry.Create(4162, '1.2.840.10008.5.1.4.1.1.77.1.2', 'Visible Light Microscopic Image Storage SOP Class', 'VL', 1));
  addEntry(4163, TUIDEntry.Create(4163, '1.2.840.10008.5.1.4.1.1.77.1.3', 'Visible Light Slide Coordinates Microscopic Image Storage SOP Class', 'VL', 1));
  addEntry(4164, TUIDEntry.Create(4164, '1.2.840.10008.5.1.4.1.1.77.1.4', 'Visible Light Photographic Image Storage SOP Class', 'US', 1));
  addEntry(4165, TUIDEntry.Create(4165, '1.2.840.10008.5.1.4.1.1.11.1', 'Grayscale Softcopy Presentation State SOP Class', 'PS', 1));
  addEntry(4166, TUIDEntry.Create(4166, '1.2.840.10008.5.1.4.1.1.88.11', 'Basic Text SR SOP Class', 'BT', 1));
  addEntry(4167, TUIDEntry.Create(4167, '1.2.840.10008.5.1.4.1.1.88.22', 'Enhanced SR SOP Class', 'ES', 1));
  addEntry(4168, TUIDEntry.Create(4168, '1.2.840.10008.5.1.4.1.1.88.33', 'Comprehensive SR SOP Class', 'CS', 1));
  addEntry(4169, TUIDEntry.Create(4169, '1.2.840.10008.5.1.4.1.1.9.1.1', '12-lead ECG Waveform Storage SOP Class', 'TW', 1));
  addEntry(4170, TUIDEntry.Create(4170, '1.2.840.10008.5.1.4.1.1.9.1.2', 'General ECG Waveform Storage SOP Class', 'GW', 1));
  addEntry(4171, TUIDEntry.Create(4171, '1.2.840.10008.5.1.4.1.1.9.1.3', 'Ambulatory ECG Waveform Storage SOP Class', 'AW', 1));
  addEntry(4172, TUIDEntry.Create(4172, '1.2.840.10008.5.1.4.1.1.9.2.1', 'Hemodynamic Waveform Storage SOP Class', 'HW', 1));
  addEntry(4173, TUIDEntry.Create(4173, '1.2.840.10008.5.1.4.1.1.9.3.1', 'Cardiac Electrophysiology Waveform Storage SOP Class', 'CW', 1));
  addEntry(4174, TUIDEntry.Create(4174, '1.2.840.10008.5.1.4.1.1.9.4.1', 'Basic Voice Audio Waveform Storage SOP Class', 'VW', 1));
  addEntry(4175, TUIDEntry.Create(4175, '1.2.840.10008.5.1.1.16.376', 'Printer Configuration Retrieval SOP Class', 'CP', 1));
  addEntry(4176, TUIDEntry.Create(4176, '1.2.840.10008.5.1.4.1.1.1.1', 'Digital X-Ray Image Storage - For Presentation', 'X ', 1));
  addEntry(4177, TUIDEntry.Create(4177, '1.2.840.10008.5.1.4.1.1.1.1.1', 'Digital X-Ray Image Storage - For Processing', 'XP', 1));
  addEntry(4178, TUIDEntry.Create(4178, '1.2.840.10008.5.1.4.1.1.1.2', 'Digital Mammography Image Storage - For Presentation', 'M ', 1));
  addEntry(4179, TUIDEntry.Create(4179, '1.2.840.10008.5.1.4.1.1.1.2.1', 'Digital Mammography Image Storage - For Processing', 'MP', 1));
  addEntry(4180, TUIDEntry.Create(4180, '1.2.840.10008.5.1.4.1.1.1.3', 'Digital Intra-oral X-Ray Image Storage - For Presentation', 'O ', 1));
  addEntry(4181, TUIDEntry.Create(4181, '1.2.840.10008.5.1.4.1.1.1.3.1', 'Digital Intra-oral X-Ray Image Storage - For Processing', 'OP', 1));
  addEntry(4182, TUIDEntry.Create(4182, '1.2.840.10008.5.1.4.1.1.481.4', 'RT Beams Treatment Record Storage', 'T1', 1));
  addEntry(4183, TUIDEntry.Create(4183, '1.2.840.10008.5.1.4.1.1.481.6', 'RT Brachy Treatment Record Storage', 'T2', 1));
  addEntry(4184, TUIDEntry.Create(4184, '1.2.840.10008.5.1.4.1.1.481.7', 'RT Treatment Summary Record Storage', 'T3', 1));
  addEntry(4185, TUIDEntry.Create(4185, '1.2.40.0.13.0.1.3.10', 'Tiani Media Storage Directory Storage SOP Class', 'MS', 1));
  addEntry(4192, TUIDEntry.Create(4192, '1.2.40.0.13.0.5.1.4.1.1.7', 'Tiani Secondary Capture Image Storage SOP Class', 'SC', 1));
  addEntry(4193, TUIDEntry.Create(4193, '1.2.40.0.13.0.5.1.4.1.2.2.2', 'Tiani Study Root Query/Retrieve Information Model - MOVE SOP Class', 'SM', 1));
  addEntry(4194, TUIDEntry.Create(4194, '1.2.840.10008.5.1.4.1.1.88.59', 'Key Object Selection Document', 'KO', 1));

  addEntry(4195, TUIDEntry.Create(4195, '1.2.840.10008.5.1.4.1.1.88.40', 'ProcedureLogStorage', 'K1', 1));
  addEntry(4195, TUIDEntry.Create(4195, '1.2.840.10008.5.1.4.1.1.88.50', 'MammographyCADSR', 'K1', 1));
  addEntry(4196, TUIDEntry.Create(4196, '1.2.840.10008.5.1.4.1.1.88.65', 'ChestCADSR', 'K2', 1));

  addEntry(4601, TUIDEntry.Create(4601, '1.2.840.2809.1', 'DBS_Verification', 'DV', 1));

  addEntry(4602, TUIDEntry.Create(4602, '1.2.840.10008.5.1.4.1.1.104.1', 'PDF encapsulated Storage SOP Class', 'MR', 1));

end;

procedure TUID.AddSOPInstance;
begin
  addEntry(16385, TUIDEntry.Create(16385, '1.2.840.10008.1.20.1.1', 'Storage Commitment Push Model SOP Instance', 'SP', 2));
  addEntry(16386, TUIDEntry.Create(16386, '1.2.840.10008.1.20.2.1', 'Storage Commitment Pull Model SOP Instance', 'SP', 2));
  addEntry(16387, TUIDEntry.Create(16387, '1.2.840.10008.5.1.1.17', 'Printer SOP Instance', 'P ', 2));
  addEntry(16388, TUIDEntry.Create(16388, '1.2.840.10008.5.1.1.25', 'Print Queue SOP Instance', 'DP', 2));
  addEntry(16389, TUIDEntry.Create(16389, '1.2.840.10008.5.1.1.17.376', 'Printer Configuration Retrieval SOP Class', 'CP', 2));
end;

procedure TUID.AddMetaSOPClass;
begin
  addEntry(12289, TUIDEntry.Create(12289, '1.2.840.10008.3.1.2.1.4', 'Detached Patient Management Meta SOP Class', 'DP', 4));
  addEntry(12290, TUIDEntry.Create(12290, '1.2.840.10008.3.1.2.5.4', 'Detached Results Management Meta SOP Class', 'DR', 4));
  addEntry(12291, TUIDEntry.Create(12291, '1.2.840.10008.3.1.2.5.5', 'Detached Study Management Meta SOP Class', 'DS', 4));
  addEntry(12292, TUIDEntry.Create(12292, '1.2.840.10008.5.1.1.9', 'Basic Grayscale Print Management Meta SOP Class', 'BG', 4));
  addEntry(12293, TUIDEntry.Create(12293, '1.2.840.10008.5.1.1.9.1', 'Referenced Grayscale Print Management Meta SOP Class', 'RG', 4));
  addEntry(12294, TUIDEntry.Create(12294, '1.2.840.10008.5.1.1.18', 'Basic Color Print Management Meta SOP Class', 'BC', 4));
  addEntry(12295, TUIDEntry.Create(12295, '1.2.840.10008.5.1.1.18.1', 'Referenced Color Print Management Meta SOP Class', 'RC', 4));
  addEntry(12296, TUIDEntry.Create(12296, '1.2.840.10008.5.1.1.32', 'Pull Stored Print Management Meta SOP Class', 'PS', 4));
end;

procedure TUID.AddTransferSyntax;
begin
  addEntry(8192, TUIDEntry.Create(8192, 'private', 'Private Transfer Syntax', 'PR', 3));
  addEntry(8193, TUIDEntry.Create(8193, '1.2.840.10008.1.2', 'Implicit VR Little Endian Transfer Syntax', 'IL', 3));
  addEntry(8194, TUIDEntry.Create(8194, '1.2.840.10008.1.2.1', 'Explicit VR Little Endian Transfer Syntax', 'EL', 3));
  addEntry(8195, TUIDEntry.Create(8195, '1.2.840.10008.1.2.2', 'Explicit VR Big Endian Transfer Syntax', 'EB', 3));
  addEntry(8196, TUIDEntry.Create(8196, '1.2.840.10008.1.2.4.50', 'JPEG Baseline Transfer Syntax (Process 1)', 'JB', 3));
  addEntry(8197, TUIDEntry.Create(8197, '1.2.840.10008.1.2.4.70', 'JPEG Lossless Transfer Syntax (Process 14, Selection Value 1)', 'JL', 3));
  addEntry(8198, TUIDEntry.Create(8198, '1.2.840.10008.1.2.5', 'RLE Lossless Transfer Syntax', 'RL', 3));
  addEntry(8199, TUIDEntry.Create(8199, '1.2.840.10008.1.2.4.51', 'JPEG Extended (Process 2 & 4)', 'JP_2_4', 3));
  addEntry(8200, TUIDEntry.Create(8200, '1.2.840.10008.1.2.4.52', 'JPEG Extended (Process 3 & 5)', 'JP_3_5', 3));
  addEntry(8201, TUIDEntry.Create(8201, '1.2.840.10008.1.2.4.53', 'JPEG Spectral Selection, Non-Hierarchical (Process 6 & 8)', 'JP_6_8', 3));
  addEntry(8202, TUIDEntry.Create(8202, '1.2.840.10008.1.2.4.54', 'JPEG Spectral Selection, Non-Hierarchical (Process 7 & 9)', 'JP_7_9', 3));
  addEntry(8203, TUIDEntry.Create(8203, '1.2.840.10008.1.2.4.55', 'JPEG Full Progression, Non-Hierarchical (Process 10 & 12)', 'JP_10_12', 3));
  addEntry(8204, TUIDEntry.Create(8204, '1.2.840.10008.1.2.4.56', 'JPEG Full Progression, Non-Hierarchical (Process 11 & 13)', 'JP_11_13', 3));
  addEntry(8205, TUIDEntry.Create(8205, '1.2.840.10008.1.2.4.57', 'JPEG Lossless, Non-Hierarchical (Process 14)', 'JP_14', 3));
  addEntry(8206, TUIDEntry.Create(8206, '1.2.840.10008.1.2.4.58', 'JPEG Lossless, Non-Hierarchical (Process 15)', 'JP_15', 3));
  addEntry(8207, TUIDEntry.Create(8207, '1.2.840.10008.1.2.4.59', 'JPEG Extended, Hierarchical (Process 16 & 18)', 'JP_16_18', 3));
  addEntry(8208, TUIDEntry.Create(8208, '1.2.840.10008.1.2.4.60', 'JPEG Extended, Hierarchical (Process 17 & 19)', 'JP_17_19', 3));
  addEntry(8209, TUIDEntry.Create(8209, '1.2.840.10008.1.2.4.61', 'JPEG Spectral Selection, Hierarchical (Process 20 & 22)', 'JP_20_22', 3));
  addEntry(8210, TUIDEntry.Create(8210, '1.2.840.10008.1.2.4.62', 'JPEG Spectral Selection, Hierarchical (Process 21 & 23)', 'JP_21_23', 3));
  addEntry(8211, TUIDEntry.Create(8211, '1.2.840.10008.1.2.4.63', 'JPEG Full Progression, Hierarchical (Process 24 & 26)', 'JP_24_26', 3));
  addEntry(8212, TUIDEntry.Create(8212, '1.2.840.10008.1.2.4.64', 'JPEG Full Progression, Hierarchical (Process 25 & 27)', 'JP_25_27', 3));
  addEntry(8213, TUIDEntry.Create(8213, '1.2.840.10008.1.2.4.65', 'JPEG Lossless, Hierarchical (Process 28)', 'JP_28', 3));
  addEntry(8214, TUIDEntry.Create(8214, '1.2.840.10008.1.2.4.66', 'JPEG Lossless, Hierarchical (Process 29)', 'JP_29', 3));

  // добавлено для рабочей станции Osirix
  addEntry(MPEG2MainProgileMainLevel, TUIDEntry.Create(MPEG2MainProgileMainLevel, '1.2.840.10008.1.2.4.100', 'MPEG2 Main Profile @ Main Level (1.2.840.10008.1.2.4.10)', 'MPEG2', 3));

  {$IFDEF ECLZLIBTransferSyntax}
  addEntry(zlibFastestTransferSyntax, TUIDEntry.Create(zlibFastestTransferSyntax, '1.2.840.10008.1.2.5.1', 'ZLIB algorithm, fastest compresssion', 'ZLIB', 3));
  addEntry(ppmFastestTransferSyntax, TUIDEntry.Create(ppmFastestTransferSyntax, '1.2.840.10008.1.2.5.2', 'PPM algorithm, fastest compresssion', 'PPM', 3));
  addEntry(bzipFastestTransferSyntax, TUIDEntry.Create(bzipFastestTransferSyntax, '1.2.840.10008.1.2.5.3', 'BZIP algorithm, fastest compresssion', 'BZIP', 3));

  addEntry(zlibMaxTransferSyntax, TUIDEntry.Create(zlibMaxTransferSyntax, '1.2.840.10008.1.2.5.4', 'ZLIB algorithm, max compresssion', 'ZLIB1', 3));
  addEntry(ppmMaxTransferSyntax, TUIDEntry.Create(ppmMaxTransferSyntax, '1.2.840.10008.1.2.5.5', 'PPM algorithm, max compresssion', 'PPM1', 3));
  addEntry(bzipMaxTransferSyntax, TUIDEntry.Create(bzipMaxTransferSyntax, '1.2.840.10008.1.2.5.6', 'BZIP algorithm, max compresssion', 'BZIP1', 3));

  addEntry(zlibNormalTransferSyntax, TUIDEntry.Create(zlibNormalTransferSyntax, '1.2.840.10008.1.2.5.7', 'ZLIB algorithm, Normal compresssion', 'ZLIB2', 3));
  addEntry(ppmNormalTransferSyntax, TUIDEntry.Create(ppmNormalTransferSyntax, '1.2.840.10008.1.2.5.8', 'PPM algorithm, Normal compresssion', 'PPM2', 3));
  addEntry(bzipNormalTransferSyntax, TUIDEntry.Create(bzipNormalTransferSyntax, '1.2.840.10008.1.2.5.9', 'BZIP algorithm, Normal compresssion', 'BZIP2', 3));
  {$ENDIF}
  addEntry(8218, TUIDEntry.Create(8218, '1.2.840.10008.1.2.4.80', 'JPEG Lossless80, lossless', 'JP_SL', 3));
  addEntry(8219, TUIDEntry.Create(8219, '1.2.840.10008.1.2.4.81', 'JPEG Lossless81, near-lossless', 'JP_SN', 3));
  addEntry(8220, TUIDEntry.Create(8220, '1.2.840.10008.1.2.4.90', 'JPEG 2000, irreversible', 'JP_KI', 3));
  addEntry(8221, TUIDEntry.Create(8221, '1.2.840.10008.1.2.4.91', 'JPEG 2000, reversible', 'JP_KR', 3));
end;

constructor TUID.Create;
begin
  FList := TList.Create;
  FValueList := nil;
  fUnknownUID := 0;
  DICOMApplicationContextName := 20481;
  AddSOPInstance;
  AddSOPClass;
  AddMetaSOPClass;
  AddTransferSyntax;
end;

function TUID.getUIDEntryByConstant(i: Integer): TUIDEntry;
var
  k1, l1, h1, m1: Integer;
begin
  l1 := 0;
  h1 := Flist.Count - 1;
  Result := nil;
  while l1 <= h1 do
  begin
    m1 := (l1 + h1) div 2;
    k1 := TUIDEntry(FList[m1]).Constant;
    if k1 > i then
      h1 := m1 - 1
    else
      if k1 < i then
      l1 := m1 + 1
    else
    begin
      Result := TUIDEntry(FList[m1]);
      exit;
    end;
  end; // while
  if result = nil then
  begin
    // raise Exception.Create('UID not found : '+inttostr(i)+' Count : '+inttostr(Flist.Count));
    MnLg_ev('UID not found : '+inttostr(i)+' Count : '+inttostr(Flist.Count),
             ExtractFilePath(paramstr(0))+'dcm_uid.log',
             True );
  end
end; 

function TUID.getUIDEntryByValue(s: AnsiString): TUIDEntry;
begin
  Result := TUIDEntry(FValueList.Data[s]);
  // FOMIN 11.07.2012
  if not assigned(Result) then
        Result := UnknownUid;
//    raise Exception.Create('Unknown UID: ''' + s + '''') {UnknownUIDException};
end;

function TUID.GetUIDEntryByShortName(s: AnsiString): TUIDEntry;
begin
  Result := nil;
end; //end of F_a(s:AnsiString)

procedure TUID.addEntry(i: Integer; uidentry: TUIDEntry);
begin
  Flist.Add(uidentry);
end;

procedure TUID.UserAddEntry(i: Integer; uidentry: TUIDEntry);
begin
  Flist.Add(uidentry);

  FList.Sort(CompareUID);
  FValueList.Add(uidentry.Value, uidentry);
end;

function TUID.AsString(i: Integer): AnsiString;
begin
  result := getUIDEntryByConstant(i).Value;
end; //end of toString(i:Integer)

constructor TUIDEntry.Create(i: Integer; s: AnsiString; s1: AnsiString; s2: AnsiString; j: Integer);
begin
  SOPClass := 1;
  WellknownSOPInstance := 2;
  TransferSyntax := 3;
  MetaSOPClass := 4;
  ApplicationContextName := 5;

  FConstant := i;
  FValue := s;
  FName := s1;
  FShortName := s2;
  FUIDType := j;
end;

function TUIDEntry.equals(obj: TUIDEntry): Boolean;
begin
  result := FConstant = (TUIDEntry(obj)).Constant;
end; //end of equals(obj:TObject)

function TUIDEntry.AsString: AnsiString;
begin
  result := FValue;
end; //end of toString

function TUIDEntry.AsLongString: AnsiString;
begin
  result := FValue + ':' + FShortName + ':' + FName;
end; //end of toLongString

function TUID.getUIDEntryByIndex1(AIndex: Integer): TUIDEntry;
begin
 Result := TUIDEntry(FList[AIndex]);
end;

function TUID.Count: integer;
begin
  Result := FList.Count;
end;

initialization
  UIDS := TUID.Create;
  UIDS.addEntry(4201, TUIDEntry.Create(4201, '1.2.840.113619.4.2', 'GE MR Document', 'GM', 1));
  UIDS.addEntry(4202, TUIDEntry.Create(4202, '1.3.12.2.1107.5.9.1', 'Siemens DSA Document', 'SM', 1));

  UIDS.addEntry(4203, TUIDEntry.Create(4203, '1.2.840.113619.5.2', 'GE CT Document', 'GM', 1));
  UIDS.addEntry(4204, TUIDEntry.Create(4204, '1.2.840.113619.4.30', 'GE CT Document', 'GM', 1));

  UIDS.addEntry(4205, TUIDEntry.Create(4205, '1.2.840.10008.5.1.4.1.1.11.2', 'ColorSoftcopyPresentationStateStorage', 'GM', 1));
  UIDS.addEntry(4209, TUIDEntry.Create(4209, '1.2.840.10008.5.1.4.1.1.11.3', 'PseudoColorSoftcopyPresentationStateStorage', 'GM', 1));
  UIDS.addEntry(4210, TUIDEntry.Create(4210, '1.2.840.10008.5.1.4.1.1.11.4', 'BlendingSoftcopyPresentationStateStorage ', 'GM', 1));

  UIDS.addEntry(4206, TUIDEntry.Create(4206, '1.2.840.5.1.4.1.1.4.2', 'GE CT Document', 'GM', 1));
  UIDS.addEntry(4207, TUIDEntry.Create(4207, '1.2.840.10008.5.1.4.1.1.4.1', 'GE CT Document', 'GM', 1));

  UIDS.addEntry(4211, TUIDEntry.Create(4211, '1.2.840.10008.5.1.4.1.1.66', 'RawDataStorage', 'GM', 1));
  UIDS.addEntry(4212, TUIDEntry.Create(4212, '1.2.840.10008.5.1.4.1.1.66.1', 'SpatialRegistrationStorage', 'GM', 1));
  UIDS.addEntry(4213, TUIDEntry.Create(4213, '1.2.840.10008.5.1.4.1.1.66.2', 'SpatialFiducialsStorage', 'GM', 1));
  UIDS.addEntry(4214, TUIDEntry.Create(4214, '1.2.840.10008.5.1.4.1.1.67', 'RealWorldValueMappingStorage', 'GM', 1));
  UIDS.addEntry(4215, TUIDEntry.Create(4215, '1.2.840.10008.5.1.4.1.1.77.1.5.1', 'OphthalmicPhotography8BitImageStorage', 'GM', 1));
  UIDS.addEntry(4216, TUIDEntry.Create(4216, '1.2.840.10008.5.1.4.1.1.77.1.5.2', 'OphthalmicPhotography16BitImageStorage', 'GM', 1));
  UIDS.addEntry(4217, TUIDEntry.Create(4217, '1.2.840.10008.5.1.4.1.1.77.1.5.3', 'StereometricRelationshipStorage', 'GM', 1));

  UIDS.addEntry(4218, TUIDEntry.Create(4218, '1.2.840.10008.5.1.4.1.1.88.1', 'DRAFT_SRTextStorage', 'GM', 1));
  UIDS.addEntry(4219, TUIDEntry.Create(4219, '1.2.840.10008.5.1.4.1.1.88.2', 'DRAFT_SRAudioStorage', 'GM', 1));
  UIDS.addEntry(4220, TUIDEntry.Create(4220, '1.2.840.10008.5.1.4.1.1.88.3', 'DRAFT_SRDetailStorage', 'GM', 1));
  UIDS.addEntry(4221, TUIDEntry.Create(4221, '1.2.840.10008.5.1.4.1.1.88.4', 'DRAFT_SRComprehensiveStorage', 'GM', 1));

  UIDS.addEntry(4222, TUIDEntry.Create(4222, '1.2.840.10008.5.1.4.1.1.88.67', 'XRayRadiationDoseSR ', 'K2', 1));

  UIDS.addEntry(4223, TUIDEntry.Create(4223, '1.3.46.670589.11.0.0.12.1', 'Phylips MR Doc', 'K3', 1));
  UIDS.addEntry(4224, TUIDEntry.Create(4224, '1.3.46.670589.11.0.0.12.2', 'Phylips MR Doc', 'K4', 1));
  UIDS.addEntry(4225, TUIDEntry.Create(4225, '1.2.840.10008.5.1.4.1.1.4.2', 'Phylips MR Doc', 'K5', 1));
  //UIDS.addEntry(4226, TUIDEntry.Create(4226, '1.2.840.10008.5.1.4.1.1.88.67', 'XRayRadiationDoseSR ', 'K6', 1));

  UIDS.Refresh;
  UnknownUid := TUIDEntry.Create(0, '', 'unknown uid', '??', 1);
finalization
  UIDs.Free;
  UnknownUid.Free;
end.

