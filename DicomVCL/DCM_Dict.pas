{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DCM_Dict;
{$I DicomPack.inc}
interface

uses classes, sysutils,Windows{, Types};

type
  TDisplayArea = (daLeftTop, daLeftBottom, daRightTop, daRightBottom, daCenterTop, daCenterBottom);
  TGraphFilter = record
    Values: array[0..2, 0..2] of integer;
    Divisor: integer;
  end;

  WordRA = array[0..0] of Word;
  Wordp = ^WordRA;

  LongWordRA = array[0..0] of LongWord;
  LongWordp = ^LongWordRA;

  TRGB = packed record
    b: byte;
    g: byte;
    r: byte;
  end;
  pRGB = ^TRGB;
  RGBRA = array[0..0] of TRGB;
  RGBp = ^RGBRA;

  ByteRA = array[0..0] of byte;
  Bytep = ^ByteRA;
  //  WordRA = array[0..0] of Word;
  //  Wordp = ^WordRA;
  SmallRA = array[0..0] of SmallInt;
  SmallP = ^SmallRA;
  IntegerRA = array[0..0] of Integer;
  IntegerP = ^IntegerRA;
  LongIntRA = array[0..0] of LongInt;
  LongIntp = ^LongIntRA;
  ShortRA = array[0..0] of ShortInt;
  Shortp = ^ShortRA;

  SingleRA = array[0..0] of Single;
  SingleP = ^SingleRA;

  DoubleRA = array[0..0] of Double;
  DoubleP = ^DoubleRA;

  Byte2DRA = array[0..0, 0..0] of byte;
  Byte2Dp = ^Byte2DRA;
  Word2DRA = array[0..0, 0..0] of Word;
  Word2Dp = ^Word2DRA;
  Small2DRA = array[0..0, 0..0] of SmallInt;
  Small2DP = ^Small2DRA;
  RGB2DRA = array[0..0, 0..0] of TRGB;
  RGB2DP = ^RGB2DRA;

  TDicomImagePalette = class
  public
    FRedTable: ByteP;
    FGreenTable: ByteP;
    FBlueTable: ByteP;
    fRect: TRect;
  public
    constructor Create;
    destructor Destroy; override;
  end;

const
  DicomTypeArray: array[0..28] of AnsiString = ('UNKNOWN', 'UL', 'UI', 'US', 'AE', 'AT', 'LO', 'SH',
    'OB', 'CS', 'SQ', 'DA', 'TM', 'ST', 'PN', 'IS', 'DS', 'AS', 'LT', 'SL'
    , 'FD', 'US_SS', 'OW_OB', 'SS', 'OW', 'NONE', 'FL', 'UT', 'DT');
  tUNKNOWN = 0;
  tUL = 1;
  tUI = 2;
  tUS = 3;
  tAE = 4;
  tAT = 5;
  tLO = 6;
  tSH = 7;
  tOB = 8;
  tCS = 9;
  tSQ = 10;
  tDA = 11;
  tTM = 12;
  tST = 13;
  tPN = 14;
  tIS = 15;
  tDS = 16;
  tAS = 17;
  tLT = 18;
  tSL = 19;
  tFD = 20;
  tUS_SS = 21;
  tOW_OB = 22;
  tSS = 23;
  tOW = 24;
  tNONE = 25;
  tFL = 26;
  tUT = 27;
  tDT = 28;

  dCommandGroupLength = 0;
  dAffectedSOPClassUID = 1;
  dRequestedSOPClassUID = 2;
  dCommandField = 3;
  dMessageID = 4;
  dMessageIDBeingRespondedTo = 5;
  dMoveDestination = 6;
  dPriority = 7;
  dDataSetType = 8;
  dStatus = 9;
  dOffendingElement = 10;
  dErrorComment = 11;
  dErrorID = 12;
  dAffectedSOPInstanceUID = 13;
  dRequestedSOPInstanceUID = 14;
  dEventTypeID = 15;
  dAttributeIdentifierList = 16;
  dModificationList = 17;
  dActionTypeID = 18;
  dNumberOfRemainingSuboperations = 19;
  dNumberOfCompletedSuboperations = 20;
  dNumberOfFailedSuboperations = 21;
  dNumberOfWarningSuboperations = 22;
  dMoveOriginatorApplicationEntityTitle = 23;
  dMoveOriginatorMessageID = 24;
  dMessageSetID = 25;
  dEndMessageSet = 26;
  dMetaElementGroupLength = 27;
  dFileMetaInformationVersion = 28;
  dMediaStorageSOPClassUID = 29;
  dMediaStorageSOPInstanceUID = 30;
  dTransferSyntaxUID = 31;
  dImplementationClassUID = 32;
  dImplementationVersionName = 33;
  dSourceApplicationEntityTitle = 34;
  dPrivateInformationCreatorUID = 35;
  dPrivateInformation = 36;
  dFileSetGroupLength = 37;
  dFileSetID = 38;
  dFileSetDescriptorFileID = 39;
  dFileSetCharacterSet = 40;
  dRootDirectoryFirstRecord = 41;
  dRootDirectoryLastRecord = 42;
  dFileSetConsistencyFlag = 43;
  dDirectoryRecordSequence = 44;
  dNextDirectoryRecordOffset = 45;
  dRecordInUseFlag = 46;
  dLowerLevelDirectoryOffset = 47;
  dDirectoryRecordType = 48;
  dPrivateRecordUID = 49;
  dReferencedFileID = 50;
  dDirectoryRecordOffset = 51;
  dReferencedSOPClassUIDInFile = 52;
  dReferencedSOPInstanceUIDInFile = 53;
  dReferencedTransferSyntaxUIDInFile = 54;
  dNumberOfReferences = 55;
  dIdentifyingGroupLength = 56;
  dSpecificCharacterSet = 57;
  dImageType = 58;
  dInstanceCreationDate = 59;
  dInstanceCreationTime = 60;
  dInstanceCreatorUID = 61;
  dSOPClassUID = 62;
  dSOPInstanceUID = 63;
  dStudyDate = 64;
  dSeriesDate = 65;
  dAcquisitionDate = 66;
  dContentDate = 67;
  dOverlayDate = 68;
  dCurveDate = 69;
  dAcquisitionDatetime = 1459;
  dStudyTime = 70;
  dSeriesTime = 71;
  dAcquisitionTime = 72;
  dContentTime = 73;
  dOverlayTime = 74;
  dCurveTime = 75;
  dOldDataSetType = 1516;
  dOldDataSetSubtype = 1517;
  dNuclearMedicineSeriesType = 76;
  dAccessionNumber = 77;
  dQueryRetrieveLevel = 78;
  dRetrieveAETitle = 79;
  dInstanceAvailability = 1511;
  dFailedSOPInstanceUIDList = 80;
  dModality = 81;
  dModalitiesInStudy = 82;
  dConversionType = 83;
  dPresentationIntentType = 1260;
  dManufacturer = 84;
  dInstitutionName = 85;
  dInstitutionAddress = 86;
  dInstitutionCodeSequence = 87;
  dReferringPhysiciansName = 88;
  dReferringPhysiciansAddress = 89;
  dReferringPhysiciansTelephoneNumber = 90;
  dCodeValue = 91;
  dCodingSchemeDesignator = 92;
  dCodingSchemeVersion = 1337;
  dCodeMeaning = 93;
  dMappingResource = 1338;
  dContextGroupVersion = 1339;
  dContextGroupLocalVersion = 1340;
  dCodeSetExtensionFlag = 1341;
  dPrivateCodingSchemeCreatorUID = 1342;
  dCodeSetExtensionCreatorUID = 1343;
  dContextIdentifier = 1344;
  dStationName = 94;
  dStudyDescription = 95;
  dProcedureCodeSequence = 96;
  dSeriesDescription = 97;
  dInstitutionalDepartmentName = 98;
  dPhysiciansOfRecord = 99;
  dPerformingPhysiciansName = 100;
  dNameOfPhysiciansReadingStudy = 101;
  dOperatorsName = 102;
  dAdmittingDiagnosisDescription = 103;
  dAdmittingDiagnosisCodeSequence = 104;
  dManufacturerModelName = 105;
  dReferencedResultsSequence = 106;
  dReferencedStudySequence = 107;
  dReferencedStudyComponentSequence = 108;
  dReferencedSeriesSequence = 109;
  dReferencedPatientSequence = 110;
  dReferencedVisitSequence = 111;
  dReferencedOverlaySequence = 112;
  dReferencedImageSequence = 113;
  dReferencedCurveSequence = 114;
  dReferencedSOPClassUID = 115;
  dReferencedSOPInstanceUID = 116;
  dSOPClassesSupported = 1345;
  dReferencedFrameNumber = 117;
  dTransactionUID = 118;
  dFailureReason = 119;
  dFailedSOPSequence = 120;
  dReferencedSOPSequence = 121;
  dRETIRED_LossyImageCompression = 1259;
  dDerivationDescription = 122;
  dSourceImageSequence = 123;
  dStageName = 124;
  dStageNumber = 125;
  dNumberOfStages = 126;
  dViewNumber = 127;
  dNumberOfEventTimers = 128;
  dNumberOfViewsInStage = 129;
  dEventElapsedTime = 130;
  dEventTimerName = 131;
  dStartTrim = 132;
  dStopTrim = 133;
  dRecommendedDisplayFrameRate = 134;
  dTransducerPosition = 135;
  dTransducerOrientation = 136;
  dAnatomicStructure = 137;
  dAnatomicRegionSequence = 138;
  dAnatomicRegionModifierSequence = 139;
  dPrimaryAnatomicStructureSequence = 140;
  dAnatomicStructureSpaceOrRegionSequence = 1190;
  dPrimaryAnatomicStructureModifierSequence = 141;
  dTransducerPositionSequence = 142;
  dTransducerPositionModifierSequence = 143;
  dTransducerOrientationSequence = 144;
  dTransducerOrientationModifierSequence = 145;
  dTianiSOPClassUID = 1509;
  dTianiSOPInstanceUID = 1510;
  dPatientGroupLength = 146;
  dPatientName = 147;
  dPatientID = 148;
  dIssuerOfPatientID = 149;
  dPatientBirthDate = 150;
  dPatientBirthTime = 151;
  dPatientSex = 152;
  dPatientInsurancePlanCodeSequence = 153;
  dOtherPatientID = 154;
  dOtherPatientNames = 155;
  dPatientBirthName = 156;
  dPatientAge = 157;
  dPatientSize = 158;
  dPatientWeight = 159;
  dPatientAddress = 160;
  dPatientMotherBirthName = 161;
  dMilitaryRank = 162;
  dBranchOfService = 163;
  dMedicalRecordLocator = 164;
  dMedicalAlerts = 165;
  dContrastAllergies = 166;
  dCountryOfResidence = 167;
  dRegionOfResidence = 168;
  dPatientTelephoneNumber = 169;
  dEthnicGroup = 170;
  dOccupation = 171;
  dSmokingStatus = 172;
  dAdditionalPatientHistory = 173;
  dPregnancyStatus = 174;
  dLastMenstrualDate = 175;
  dPatientReligiousPreference = 176;
  dPatientComments = 177;
  dTianiPatientID = 1506;
  dAcquisitionGroupLength = 178;
  dContrastBolusAgent = 179;
  dContrastBolusAgentSequence = 180;
  dContrastBolusAdministrationRouteSequence = 181;
  dBodyPartExamined = 182;
  dScanningSequence = 183;
  dSequenceVariant = 184;
  dScanOptions = 185;
  dMRAcquisitionType = 186;
  dSequenceName = 187;
  dAngioFlag = 188;
  dInterventionDrugInformationSequence = 189;
  dInterventionDrugStopTime = 190;
  dInterventionDrugDose = 191;
  dInterventionDrugCodeSequence = 192;
  dAdditionalDrugSequence = 193;
  dRadionuclide = 194;
  dRadiopharmaceutical = 195;
  dEnergyWindowCenterline = 196;
  dEnergyWindowTotalWidth = 197;
  dInterventionDrugName = 198;
  dInterventionDrugStartTime = 199;
  dInterventionalTherapySequence = 200;
  dTherapyType = 201;
  dInterventionalStatus = 202;
  dTherapyDescription = 203;
  dCineRate = 204;
  dSliceThickness = 205;
  dKVP = 206;
  dCountsAccumulated = 207;
  dAcquisitionTerminationCondition = 208;
  dEffectiveDuration = 209;
  dAcquisitionStartCondition = 210;
  dAcquisitionStartConditionData = 211;
  dAcquisitionTerminationConditionData = 212;
  dRepetitionTime = 213;
  dEchoTime = 214;
  dInversionTime = 215;
  dNumberOfAverages = 216;
  dImagingFrequency = 217;
  dImagedNucleus = 218;
  dEchoNumber = 219;
  dMagneticFieldStrength = 220;
  dSpacingBetweenSlices = 221;
  dNumberOfPhaseEncodingSteps = 222;
  dDataCollectionDiameter = 223;
  dEchoTrainLength = 224;
  dPercentSampling = 225;
  dPercentPhaseFieldOfView = 226;
  dPixelBandwidth = 227;
  dDeviceSerialNumber = 228;
  dPlateID = 229;
  dSecondaryCaptureDeviceID = 230;
  dHardcopyCreationDeviceID = 1191;
  dDateOfSecondaryCapture = 231;
  dTimeOfSecondaryCapture = 232;
  dSecondaryCaptureDeviceManufacturer = 233;
  dHardcopyDeviceManufacturer = 1192;
  dSecondaryCaptureDeviceManufacturerModelName = 234;
  dSecondaryCaptureDeviceSoftwareVersion = 235;
  dHardcopyDeviceSoftwareVersion = 1193;
  dHardcopyDeviceManfuacturersModelName = 1194;
  dSoftwareVersion = 236;
  dVideoImageFormatAcquired = 237;
  dDigitalImageFormatAcquired = 238;
  dProtocolName = 239;
  dContrastBolusRoute = 240;
  dContrastBolusVolume = 241;
  dContrastBolusStartTime = 242;
  dContrastBolusStopTime = 243;
  dContrastBolusTotalDose = 244;
  dSyringeCounts = 245;
  dContrastFlowRates = 246;
  dContrastFlowDurations = 247;
  dContrastBolusIngredient = 248;
  dContrastBolusIngredientConcentration = 249;
  dSpatialResolution = 250;
  dTriggerTime = 251;
  dTriggerSourceOrType = 252;
  dNominalInterval = 253;
  dFrameTime = 254;
  dFramingType = 255;
  dFrameTimeVector = 256;
  dFrameDelay = 257;
  dImageTriggerDelay = 1460;
  dMultiplexGroupTimeOffset = 1461;
  dTriggerTimeOffset = 1462;
  dSynchronizationTrigger = 1463;
  dSynchronizationChannel = 1464;
  dTriggerSamplePosition = 1465;
  dRadionuclideRoute = 258;
  dRadionuclideVolume = 259;
  dRadiopharmaceuticalStartTime = 260;
  dRadiopharmaceuticalStopTime = 261;
  dRadionuclideTotalDose = 262;
  dRadionuclideHalfLife = 263;
  dRadionuclidePositronFraction = 264;
  dRadiopharmaceuticalSpecificActivity = 265;
  dBeatRejectionFlag = 266;
  dLowRRValue = 267;
  dHighRRValue = 268;
  dIntervalsAcquired = 269;
  dIntervalsRejected = 270;
  dPVCRejection = 271;
  dSkipBeats = 272;
  dHeartRate = 273;
  dCardiacNumberOfImages = 274;
  dTriggerWindow = 275;
  dReconstructionDiameter = 276;
  dDistanceSourceToDetector = 277;
  dDistanceSourceToPatient = 278;
  dEstimatedRadiographicMagnificationFactor = 279;
  dGantryDetectorTilt = 280;
  dGantryDetectorSlew = 281;
  dTableHeight = 282;
  dTableTraverse = 283;
  dTableMotion = 284;
  dTableVerticalIncrement = 285;
  dTableLateralIncrement = 286;
  dTableLongitudinalIncrement = 287;
  dTableAngle = 288;
  dTableType = 1261;
  dRotationDirection = 289;
  dAngularPosition = 290;
  dRadialPosition = 291;
  dScanArc = 292;
  dAngularStep = 293;
  dCenterOfRotationOffset = 294;
  dRotationOffset = 295;
  dFieldOfViewShape = 296;
  dFieldOfViewDimension = 297;
  dExposureTime = 298;
  dXRayTubeCurrent = 299;
  dExposure = 300;
  dExposureinuAs = 1195;
  dAveragePulseWidth = 301;
  dRadiationSetting = 302;
  dRectificationType = 1262;
  dRadiationMode = 303;
  dImageAreaDoseProduct = 304;
  dFilterType = 305;
  dTypeOfFilters = 306;
  dIntensifierSize = 307;
  dImagerPixelSpacing = 308;
  dGrid = 309;
  dGeneratorPower = 310;
  dCollimatorGridName = 311;
  dCollimatorType = 312;
  dFocalDistance = 313;
  dXFocusCenter = 314;
  dYFocusCenter = 315;
  dFocalSpot = 316;
  dAnodeTargetMaterial = 1263;
  dBodyPartThickness = 1264;
  dCompressionForce = 1265;
  dDateOfLastCalibration = 317;
  dTimeOfLastCalibration = 318;
  dConvolutionKernel = 319;
  dActualFrameDuration = 320;
  dCountRate = 321;
  dPreferredPlaybackSequencing = 322;
  dReceivingCoil = 323;
  dTransmittingCoil = 324;
  dPlateType = 325;
  dPhosphorType = 326;
  dScanVelocity = 327;
  dWholeBodyTechnique = 328;
  dScanLength = 329;
  dAcquisitionMatrix = 330;
  dPhaseEncodingDirection = 331;
  dFlipAngle = 332;
  dVariableFlipAngleFlag = 333;
  dSAR = 334;
  ddBdt = 335;
  dAcquisitionDeviceProcessingDescription = 336;
  dAcquisitionDeviceProcessingCode = 337;
  dCassetteOrientation = 338;
  dCassetteSize = 339;
  dExposuresOnPlate = 340;
  dRelativeXrayExposure = 341;
  dColumnAngulation = 1196;
  dTomoLayerHeight = 342;
  dTomoAngle = 343;
  dTomoTime = 344;
  dTomoType = 1266;
  dTomoClass = 1267;
  dNumberofTomosynthesisSourceImages = 1268;
  dPositionerMotion = 345;
  dPositionerType = 1269;
  dPositionerPrimaryAngle = 346;
  dPositionerSecondaryAngle = 347;
  dPositionerPrimaryAngleIncrement = 348;
  dPositionerSecondaryAngleIncrement = 349;
  dDetectorPrimaryAngle = 350;
  dDetectorSecondaryAngle = 351;
  dShutterShape = 352;
  dShutterLeftVerticalEdge = 353;
  dShutterRightVerticalEdge = 354;
  dShutterUpperHorizontalEdge = 355;
  dShutterLowerHorizontalEdge = 356;
  dCenterOfCircularShutter = 357;
  dRadiusOfCircularShutter = 358;
  dVerticesOfThePolygonalShutter = 359;
  dShutterPresentationValue = 1377;
  dShutterOverlayGroup = 1378;
  dCollimatorShape = 360;
  dCollimatorLeftVerticalEdge = 361;
  dCollimatorRightVerticalEdge = 362;
  dCollimatorUpperHorizontalEdge = 363;
  dCollimatorLowerHorizontalEdge = 364;
  dCenterOfCircularCollimator = 365;
  dRadiusOfCircularCollimator = 366;
  dVerticesOfThePolygonalCollimator = 367;
  dAcquisitionTimeSynchronized = 1466;
  dTimeSource = 1468;
  dTimeDistributionProtocol = 1467;
  dOutputPower = 368;
  dTransducerData = 369;
  dFocusDepth = 370;
  dPreprocessingFunction = 371;
  dPostprocessingFunction = 372;
  dMechanicalIndex = 373;
  dBoneThermalIndex = 374;
  dCranialThermalIndex = 375;
  dSoftTissueThermalIndex = 376;
  dSoftTissueFocusThermalIndex = 377;
  dSoftTissueSurfaceThermalIndex = 378;
  dDepthOfScanField = 379;
  dPatientPosition = 380;
  dViewPosition = 381;
  dProjectionEponymousNameCodeSequence = 1270;
  dImageTransformationMatrix = 382;
  dImageTranslationVector = 383;
  dSensitivity = 384;
  dSequenceOfUltrasoundRegions = 385;
  dRegionSpatialFormat = 386;
  dRegionDataType = 387;
  dRegionFlags = 388;
  dRegionLocationMinX0 = 389;
  dRegionLocationMinY0 = 390;
  dRegionLocationMaxX1 = 391;
  dRegionLocationMaxY1 = 392;
  dReferencePixelX0 = 393;
  dReferencePixelY0 = 394;
  dPhysicalUnitsXDirection = 395;
  dPhysicalUnitsYDirection = 396;
  dReferencePixelPhysicalValueX = 397;
  dReferencePixelPhysicalValueY = 398;
  dPhysicalDeltaX = 399;
  dPhysicalDeltaY = 400;
  dTransducerFrequency = 401;
  dTransducerType = 402;
  dPulseRepetitionFrequency = 403;
  dDopplerCorrectionAngle = 404;
  dSteeringAngle = 405;
  dDopplerSampleVolumeXPosition = 406;
  dDopplerSampleVolumeYPosition = 407;
  dTMLinePositionX0 = 408;
  dTMLinePositionY0 = 409;
  dTMLinePositionX1 = 410;
  dTMLinePositionY1 = 411;
  dPixelComponentOrganization = 412;
  dPixelComponentMask = 413;
  dPixelComponentRangeStart = 414;
  dPixelComponentRangeStop = 415;
  dPixelComponentPhysicalUnits = 416;
  dPixelComponentDataType = 417;
  dNumberOfTableBreakPoints = 418;
  dTableOfXBreakPoints = 419;
  dTableOfYBreakPoints = 420;
  dNumberOfTableEntries = 421;
  dTableOfPixelValues = 422;
  dTableOfParameterValues = 423;
  dDetectorConditionsNominalFlag = 1271;
  dDetectorTemperature = 1272;
  dDetectorType = 1273;
  dDetectorConfiguration = 1274;
  dDetectorDescription = 1275;
  dDetectorMode = 1276;
  dDetectorID = 1277;
  dDateofLastDetectorCalibration = 1278;
  dTimeofLastDetectorCalibration = 1279;
  dExposuresOnDetectorSinceLastCalibration = 1280;
  dExposuresOnDetectorSinceManufactured = 1281;
  dDetectorTimeSinceLastExposure = 1282;
  dDetectorActiveTime = 1283;
  dDetectorActivationOffsetFromExposure = 1284;
  dDetectorBinning = 1285;
  dDetectorElementPhysicalSize = 1286;
  dDetectorElementSpacing = 1287;
  dDetectorActiveShape = 1288;
  dDetectorActiveDimensions = 1289;
  dDetectorActiveOrigin = 1290;
  dFieldofViewOrigin = 1291;
  dFieldofViewRotation = 1292;
  dFieldofViewHorizontalFlip = 1293;
  dGridAbsorbingMaterial = 1294;
  dGridSpacingMaterial = 1295;
  dGridThickness = 1296;
  dGridPitch = 1297;
  dGridAspectRatio = 1298;
  dGridPeriod = 1299;
  dGridFocalDistance = 1300;
  dFilterMaterial = 1301;
  dFilterThicknessMinimum = 1302;
  dFilterThicknessMaximum = 1303;
  dExposureControlMode = 1304;
  dExposureControlModeDescription = 1305;
  dExposureStatus = 1306;
  dPhototimerSetting = 1307;
  dImageGroupLength = 424;
  dStudyInstanceUID = 425;
  dSeriesInstanceUID = 426;
  dStudyID = 427;
  dSeriesNumber = 428;
  dAcquisitionNumber = 429;
  dInstanceNumber = 430;
  dIsotopeNumber = 431;
  dPhaseNumber = 432;
  dIntervalNumber = 433;
  dTimeSlotNumber = 434;
  dAngleNumber = 435;
  dItemNumber = 1346;
  dPatientOrientation = 436;
  dOverlayNumber = 437;
  dCurveNumber = 438;
  dLUTNumber = 439;
  dImagePositionPatient = 440;
  dImageOrientationPatient = 441;
  dFrameOfReferenceUID = 442;
  dLaterality = 443;
  dImageLaterality = 1308;
  dTemporalPositionIdentifier = 444;
  dNumberOfTemporalPositions = 445;
  dTemporalResolution = 446;
  dSynchronizationFrameofReferenceUID = 1469;
  dSeriesInStudy = 447;
  dImagesInAcquisition = 448;
  dAcquisitionsInStudy = 449;
  dPositionReferenceIndicator = 450;
  dSliceLocation = 451;
  dOtherStudyNumbers = 452;
  dNumberOfPatientRelatedStudies = 453;
  dNumberOfPatientRelatedSeries = 454;
  dNumberOfPatientRelatedImages = 455;
  dNumberOfStudyRelatedSeries = 456;
  dNumberOfStudyRelatedImages = 457;
  dNumberOfSeriesRelatedImages = 458;
  dImageComments = 459;
  dTianiStudyInstanceUID = 1507;
  dTianiSeriesInstanceUID = 1508;
  dImagePresentationGroupLength = 460;
  dSamplesPerPixel = 461;
  dPhotometricInterpretation = 462;
  dPlanarConfiguration = 463;
  dNumberOfFrames = 464;
  dFrameIncrementPointer = 465;
  dRows = 466;
  dColumns = 467;
  dPlanes = 468;
  dUltrasoundColorDataPresent = 469;
  dPixelSpacing = 470;
  dZoomFactor = 471;
  dZoomCenter = 472;
  dPixelAspectRatio = 473;
  dCorrectedImage = 474;
  dBitsAllocated = 475;
  dBitsStored = 476;
  dHighBit = 477;
  dPixelRepresentation = 478;
  dSmallestImagePixelValue = 479;
  dLargestImagePixelValue = 480;
  dSmallestPixelValueInSeries = 481;
  dLargestPixelValueInSeries = 482;
  dSmallestImagePixelValueInPlane = 483;
  dLargestImagePixelValueInPlane = 484;
  dPixelPaddingValue = 485;
  dQualityControlImage = 1309;
  dBurnedInAnnotation = 1310;
  dPixelIntensityRelationship = 486;
  dPixelIntensityRelationshipSign = 1311;
  dWindowCenter = 487;
  dWindowWidth = 488;
  dRescaleIntercept = 489;
  dRescaleSlope = 490;
  dRescaleType = 491;
  dWindowCenterWidthExplanation = 492;
  dRecommendedViewingMode = 493;
  dRedPaletteColorLookupTableDescriptor = 494;
  dGreenPaletteColorLookupTableDescriptor = 495;
  dBluePaletteColorLookupTableDescriptor = 496;
  dPaletteColorLookupTableUID = 497;
  dRedPaletteColorLookupTableData = 498;
  dGreenPaletteColorLookupTableData = 499;
  dBluePaletteColorLookupTableData = 500;
  dSegmentedRedPaletteColorLookupTableData = 501;
  dSegmentedGreenPaletteColorLookupTableData = 502;
  dSegmentedBluePaletteColorLookupTableData = 503;
  dImplantPresent = 1312;
  dLossyImageCompression = 504;
  dLossyImageCompressionRatio = 1313;
  dModalityLUTSequence = 505;
  dLUTDescriptor = 506;
  dLUTExplanation = 507;
  dModalityLUTType = 508;
  dLUTData = 509;
  dVOILUTSequence = 510;
  dSoftcopyVOILUTSequence = 1408;
  dBiPlaneAcquisitionSequence = 511;
  dRepresentativeFrameNumber = 512;
  dFrameNumbersOfInterestFOI = 513;
  dFrameOfInterestDescription = 514;
  dMaskPointers = 515;
  dRWavePointer = 516;
  dMaskSubtractionSequence = 517;
  dMaskOperation = 518;
  dApplicableFrameRange = 519;
  dMaskFrameNumbers = 520;
  dContrastFrameAveraging = 521;
  dMaskSubPixelShift = 522;
  dTIDOffset = 523;
  dMaskOperationExplanation = 524;
  dTianiWindowCenter = 1512;
  dTianiWindowWidth = 1513;
  dStudyGroupLength = 525;
  dStudyStatusID = 526;
  dStudyPriorityID = 527;
  dStudyIDIssuer = 528;
  dStudyVerifiedDate = 529;
  dStudyVerifiedTime = 530;
  dStudyReadDate = 531;
  dStudyReadTime = 532;
  dScheduledStudyStartDate = 533;
  dScheduledStudyStartTime = 534;
  dScheduledStudyStopDate = 535;
  dScheduledStudyStopTime = 536;
  dScheduledStudyLocation = 537;
  dScheduledStudyLocationAETitle = 538;
  dReasonForStudy = 539;
  dRequestingPhysician = 540;
  dRequestingService = 541;
  dStudyArrivalDate = 542;
  dStudyArrivalTime = 543;
  dStudyCompletionDate = 544;
  dStudyCompletionTime = 545;
  dStudyComponentStatusID = 546;
  dRequestedProcedureDescription = 547;
  dRequestedProcedureCodeSequence = 548;
  dRequestedContrastAgent = 549;
  dStudyComments = 550;
  dVisitGroupLength = 551;
  dReferencedPatientAliasSequence = 552;
  dVisitStatusID = 553;
  dAdmissionID = 554;
  dIssuerOfAdmissionID = 555;
  dRouteOfAdmissions = 556;
  dScheduledAdmissionDate = 557;
  dScheduledAdmissionTime = 558;
  dScheduledDischargeDate = 559;
  dScheduledDischargeTime = 560;
  dScheduledPatientInstitutionResidence = 561;
  dAdmittingDate = 562;
  dAdmittingTime = 563;
  dDischargeDate = 564;
  dDischargeTime = 565;
  dDischargeDiagnosisDescription = 566;
  dDischargeDiagnosisCodeSequence = 567;
  dSpecialNeeds = 568;
  dCurrentPatientLocation = 569;
  dPatientInstitutionResidence = 570;
  dPatientState = 571;
  dVisitComments = 572;
  dWaveformOriginality = 1470;
  dNumberofWaveformChannels = 1471;
  dNumberofWaveformSamples = 1472;
  dSamplingFrequency = 1473;
  dMultiplexGroupLabel = 1474;
  dChannelDefinitionSequence = 1475;
  dWaveformChannelNumber = 1476;
  dChannelLabel = 1477;
  dChannelStatus = 1478;
  dChannelSourceSequence = 1479;
  dChannelSourceModifiersSequence = 1480;
  dSourceWaveformSequence = 1481;
  dChannelDerivationDescription = 1482;
  dChannelSensitivity = 1483;
  dChannelSensitivityUnitsSequence = 1484;
  dChannelSensitivityCorrectionFactor = 1485;
  dChannelBaseline = 1486;
  dChannelTimeSkew = 1487;
  dChannelSampleSkew = 1488;
  dChannelOffset = 1489;
  dWaveformBitsStored = 1490;
  dFilterLowFrequency = 1491;
  dFilterHighFrequency = 1492;
  dNotchFilterFrequency = 1493;
  dNotchFilterBandwidth = 1494;
  dModalityWorklistGroupLength = 573;
  dScheduledStationAETitle = 574;
  dScheduledProcedureStepStartDate = 575;
  dScheduledProcedureStepStartTime = 576;
  dScheduledProcedureStepEndDate = 577;
  dScheduledProcedureStepEndTime = 578;
  dScheduledPerformingPhysiciansName = 579;
  dScheduledProcedureStepDescription = 580;
  dScheduledActionItemCodeSequence = 581;
  dScheduledProcedureStepID = 582;
  dScheduledStationName = 583;
  dScheduledProcedureStepLocation = 584;
  dPreMedication = 585;
  dScheduledProcedureStepStatus = 586;
  dScheduledProcedureStepSequence = 587;
  dReferencedStandaloneSOPInstanceSequence = 1197;
  dPerformedStationAETitle = 1198;
  dPerformedStationName = 1199;
  dPerformedLocation = 1200;
  dPerformedProcedureStepStartDate = 1201;
  dPerformedProcedureStepStartTime = 1202;
  dPerformedProcedureStepEndDate = 1203;
  dPerformedProcedureStepEndTime = 1204;
  dPerformedProcedureStepStatus = 1205;
  dPerformedProcedureStepID = 1206;
  dPerformedProcedureStepDescription = 1207;
  dPerformedProcedureTypeDescription = 1208;
  dPerformedActionItemSequence = 1209;
  dScheduledStepAttributesSequence = 1210;
  dRequestAttributesSequence = 1211;
  dCommentsOnThePerformedProcedureSteps = 1212;
  dQuantitySequence = 1213;
  dQuantity = 1214;
  dMeasuringUnitsSequence = 1215;
  dBillingItemSequence = 1216;
  dTotalTimeOfFluoroscopy = 1217;
  dTotalNumberOfExposures = 1218;
  dEntranceDose = 1219;
  dExposedArea = 1220;
  dDistanceSourceToEntrance = 1221;
  dDistanceSourceToSupport = 1314;
  dCommentsOnRadiationDose = 1222;
  dXRayOutput = 1315;
  dHalfValueLayer = 1316;
  dOrganDose = 1317;
  dOrganExposed = 1318;
  dBillingProcedureStepSequence = 1223;
  dFilmConsumptionSequence = 1224;
  dBillingSuppliesAndDevicesSequence = 1225;
  dReferencedProcedureStepSequence = 1226;
  dPerformedSeriesSequence = 1227;
  dCommentsOnTheScheduledProcedureStep = 588;
  dSpecimenAccessionNumber = 1421;
  dSpecimenSequence = 1422;
  dSpecimenIdentifier = 1423;
  dAcquisitionContextSequence = 1319;
  dAcquisitionContextDescription = 1320;
  dSpecimenTypeCodeSequence = 1424;
  dSlideIdentifier = 1370;
  dImageCenterPointCoordinatesSequence = 1371;
  dXOffsetInSlideCoordinateSystem = 1372;
  dYOffsetInSlideCoordinateSystem = 1373;
  dZOffsetInSlideCoordinateSystem = 1374;
  dPixelSpacingSequence = 1375;
  dCoordinateSystemAxisCodeSequence = 1376;
  dMeasurementUnitsCodeSequence = 1321;
  dRequestedProcedureID = 589;
  dReasonForTheRequestedProcedure = 590;
  dRequestedProcedurePriority = 591;
  dPatientTransportArrangements = 592;
  dRequestedProcedureLocation = 593;
  dPlacerOrderNumberProcedure = 594;
  dFillerOrderNumberProcedure = 595;
  dConfidentialityCode = 596;
  dReportingPriority = 597;
  dNamesOfIntendedRecipientsOfResults = 598;
  dRequestedProcedureComments = 599;
  dReasonForTheImagingServiceRequest = 600;
  dIssueDateOfImagingServiceRequest = 601;
  dIssueTimeOfImagingServiceRequest = 602;
  dPlacerOrderNumberImagingServiceRequest = 603;
  dFillerOrderNumberImagingServiceRequest = 604;
  dOrderEnteredBy = 605;
  dOrderEnterersLocation = 606;
  dOrderCallbackPhoneNumber = 607;
  dPlacerOrderNumber = 1419;
  dFillerOrderNumber = 1420;
  dImagingServiceRequestComments = 608;
  dConfidentialityConstraintOnPatientData = 609;
  dRelationshipType = 1425;
  dVerifyingOrganization = 1426;
  dVerificationDateTime = 1427;
  dObservationDateTime = 1428;
  dValueType = 1429;
  dConceptNameCodeSequence = 1322;
  dContinuityOfContent = 1430;
  dVerifyingObserverSequence = 1431;
  dVerifyingObserverName = 1432;
  dReferencedWaveformChannels = 1495;
  dDateTime = 1434;
  dDate = 1323;
  dTime = 1324;
  dPersonName = 1325;
  dUID = 1435;
  dTemporalRangeType = 1436;
  dReferencedSamplePositions = 1437;
  dReferencedFrameNumbers = 1326;
  dReferencedTimeOffsets = 1438;
  dReferencedDatetime = 1439;
  dTextValue = 1327;
  dConceptCodeSequence = 1328;
  dAnnotationGroupNumber = 1496;
  dModifierCodeSequence = 1497;
  dMeasuredValueSequence = 1440;
  dNumericValue = 1329;
  dPredecessorDocumentsSequence = 1441;
  dReferencedRequestSequence = 1442;
  dPerformedProcedureCodeSequence = 1443;
  dCurrentRequestedProcedureEvidenceSequence = 1444;
  dPertinentOtherEvidenceSequence = 1445;
  dCompletionFlag = 1446;
  dCompletionFlagDescription = 1447;
  dVerificationFlag = 1448;
  dContentTemplateSequence = 1449;
  dIdenticalDocumentsSequence = 1450;
  dContentSequence = 1451;
  dAnnotationSequence = 1498;
  dTemplateIdentifier = 1452;
  dTemplateVersion = 1453;
  dTemplateLocalVersion = 1454;
  dTemplateExtensionFlag = 1455;
  dTemplateExtensionOrganizationUID = 1456;
  dTemplateExtensionCreatorUID = 1457;
  dReferencedContentItemIdentifier = 1458;
  dXRayAngioDeviceGroupLength = 1228;
  dCalibrationObject = 610;
  dDeviceSequence = 611;
  dDeviceLength = 612;
  dDeviceDiameter = 613;
  dDeviceDiameterUnits = 614;
  dDeviceVolume = 615;
  dInterMarkerDistance = 616;
  dDeviceDescription = 617;
  dGroupLength = 618;
  dEnergyWindowVector = 619;
  dNumberOfEnergyWindows = 620;
  dEnergyWindowInformationSequence = 621;
  dEnergyWindowRangeSequence = 622;
  dEnergyWindowLowerLimit = 623;
  dEnergyWindowUpperLimit = 624;
  dRadiopharmaceuticalInformationSequence = 625;
  dResidualSyringeCounts = 626;
  dEnergyWindowName = 627;
  dDetectorVector = 628;
  dNumberOfDetectors = 629;
  dDetectorInformationSequence = 630;
  dPhaseVector = 631;
  dNumberOfPhases = 632;
  dPhaseInformationSequence = 633;
  dNumberOfFramesInPhase = 634;
  dPhaseDelay = 635;
  dPauseBetweenFrames = 636;
  dRotationVector = 637;
  dNumberOfRotations = 638;
  dRotationInformationSequence = 639;
  dNumberOfFramesInRotation = 640;
  dRRIntervalVector = 641;
  dNumberOfRRIntervals = 642;
  dGatedInformationSequence = 643;
  dDataInformationSequence = 644;
  dTimeSlotVector = 645;
  dNumberOfTimeSlots = 646;
  dTimeSlotInformationSequence = 647;
  dTimeSlotTime = 648;
  dSliceVector = 649;
  dNumberOfSlices = 650;
  dAngularViewVector = 651;
  dTimeSliceVector = 652;
  dNumberOfTimeSlices = 653;
  dStartAngle = 654;
  dTypeOfDetectorMotion = 655;
  dTriggerVector = 656;
  dNumberOfTriggersInPhase = 657;
  dViewCodeSequence = 658;
  dViewAngulationModifierCodeSequence = 659;
  dRadionuclideCodeSequence = 660;
  dAdministrationRouteCodeSequence = 661;
  dRadiopharmaceuticalCodeSequence = 662;
  dCalibrationDataSequence = 663;
  dEnergyWindowNumber = 664;
  dImageID = 665;
  dPatientOrientationCodeSequence = 666;
  dPatientOrientationModifierCodeSequence = 667;
  dPatientGantryRelationshipCodeSequence = 668;
  dSeriesType = 669;
  dUnits = 670;
  dCountsSource = 671;
  dReprojectionMethod = 672;
  dRandomsCorrectionMethod = 673;
  dAttenuationCorrectionMethod = 674;
  dDecayCorrection = 675;
  dReconstructionMethod = 676;
  dDetectorLinesOfResponseUsed = 677;
  dScatterCorrectionMethod = 678;
  dAxialAcceptance = 679;
  dAxialMash = 680;
  dTransverseMash = 681;
  dDetectorElementSize = 682;
  dCoincidenceWindowWidth = 683;
  dSecondaryCountsType = 684;
  dFrameReferenceTime = 685;
  dPrimaryPromptsCountsAccumulated = 686;
  dSecondaryCountsAccumulated = 687;
  dSliceSensitivityFactor = 688;
  dDecayFactor = 689;
  dDoseCalibrationFactor = 690;
  dScatterFractionFactor = 691;
  dDeadTimeFactor = 692;
  dImageIndex = 693;
  dCountsIncluded = 694;
  dDeadTimeCorrectionFlag = 695;
  dHistogramSequence = 1330;
  dHistogramNumberofBins = 1331;
  dHistogramFirstBinValue = 1332;
  dHistogramLastBinValue = 1333;
  dHistogramBinWidth = 1334;
  dHistogramExplanation = 1335;
  dHistogramData = 1336;
  dGraphicAnnotationSequence = 1381;
  dGraphicLayer = 1382;
  dBoundingBoxAnnotationUnits = 1383;
  dAnchorPointAnnotationUnits = 1384;
  dGraphicAnnotationUnits = 1385;
  dUnformattedTextValue = 1386;
  dTextObjectSequence = 1387;
  dGraphicObjectSequence = 1388;
  dBoundingBoxTLHC = 1389;
  dBoundingBoxBRHC = 1390;
  dBoundingBoxTHJ = 1409;
  dAnchorPoint = 1391;
  dAnchorPointVisibility = 1392;
  dGraphicDimensions = 1393;
  dNumberOfGraphicPoints = 1394;
  dGraphicData = 1395;
  dGraphicType = 1396;
  dGraphicFilled = 1397;
  dImageHorizontalFlip = 1398;
  dImageRotation = 1410;
  dDisplayedAreaTLHC = 1411;
  dDisplayedAreaBRHC = 1412;
  dDisplayedAreaSelectionSequence = 1413;
  dGraphicLayerSequence = 1399;
  dGraphicLayerOrder = 1400;
  dGraphicLayerRecommendedDisplayGrayScaleValue = 1401;
  dGraphicLayerRecommendedDisplayRGBValue = 1414;
  dGraphicLayerDescription = 1402;
  dPresentationLabel = 1403;
  dPresentationDescription = 1404;
  dPresentationCreationDate = 1405;
  dPresentationCreationTime = 1406;
  dPresentationCreatorsName = 1407;
  dPresentationSizeMode = 1415;
  dPresentationPixelSpacing = 1416;
  dPresentationPixelAspectRatio = 1417;
  dPresentationPixelMagnificationRatio = 1418;
  dStorageGroupLength = 696;
  dStorageMediaFilesetID = 697;
  dStorageMediaFilesetUID = 698;
  dIconImage = 699;
  dTopicTitle = 700;
  dTopicSubject = 701;
  dTopicAuthor = 702;
  dTopicKeyWords = 703;
  dFilmSessionGroupLength = 704;
  dNumberOfCopies = 705;
  dPrinterConfigurationSequence = 1347;
  dPrintPriority = 706;
  dMediumType = 707;
  dFilmDestination = 708;
  dFilmSessionLabel = 709;
  dMemoryAllocation = 710;
  dColorImagePrintingFlag = 1229;
  dCollationFlag = 1230;
  dAnnotationFlag = 1231;
  dImageOverlayFlag = 1232;
  dPresentationLUTFlag = 1233;
  dImageBoxPresentationLUTFlag = 1234;
  dMemoryBitDepth = 1348;
  dPrintingBitDepth = 1349;
  dMediaInstalledSequence = 1350;
  dOtherMediaAvailableSequence = 1351;
  dSupportedImageDisplayFormatsSequence = 1352;
  dReferencedFilmBoxSequence = 711;
  dReferencedStoredPrintSequence = 1235;
  dFilmBoxGroupLength = 712;
  dImageDisplayFormat = 713;
  dAnnotationDisplayFormatID = 714;
  dFilmOrientation = 715;
  dFilmSizeID = 716;
  dPrinterResolutionID = 1353;
  dDefaultPrinterResolutionID = 1354;
  dMagnificationType = 717;
  dSmoothingType = 718;
  dDefaultMagnificationType = 1355;
  dOtherMagnificationTypesAvailable = 1356;
  dDefaultSmoothingType = 1357;
  dOtherSmoothingTypesAvailable = 1358;
  dBorderDensity = 719;
  dEmptyImageDensity = 720;
  dMinDensity = 721;
  dMaxDensity = 722;
  dTrim = 723;
  dConfigurationInformation = 724;
  dConfigurationInformationDescription = 1359;
  dMaximumCollatedFilms = 1360;
  dIllumination = 1236;
  dReflectedAmbientLight = 1237;
  dPrinterPixelSpacing = 1361;
  dReferencedFilmSessionSequence = 725;
  dReferencedImageBoxSequence = 726;
  dReferencedBasicAnnotationBoxSequence = 727;
  dImageBoxGroupLength = 728;
  dImageBoxPosition = 729;
  dPolarity = 730;
  dRequestedImageSize = 731;
  dRequestedDecimateCropBehavior = 1362;
  dRequestedResolutionID = 1363;
  dRequestedImageSizeFlag = 1364;
  dDecimateCropResult = 1365;
  dPreformattedGrayscaleImageSequence = 732;
  dPreformattedColorImageSequence = 733;
  dReferencedImageOverlayBoxSequence = 734;
  dReferencedVOILUTBoxSequence = 735;
  dAnnotationGroupLength = 736;
  dAnnotationPosition = 737;
  dTextString = 738;
  dOverlayBoxGroupLength = 739;
  dReferencedOverlayPlaneSequence = 740;
  dReferencedOverlayPlaneGroups = 741;
  dOverlayPixelDataSequence = 1366;
  dOverlayMagnificationType = 742;
  dOverlaySmoothingType = 743;
  dOverlayOrImageMagnification = 1367;
  dMagnifyToNumberOfColumns = 1368;
  dOverlayForegroundDensity = 744;
  dOverlayBackgroundDensity = 1369;
  dOverlayMode = 745;
  dThresholdDensity = 746;
  dRETIRED_ReferencedImageBoxSequence = 747;
  dPresentationLUTGroupLength = 1238;
  dPresentationLUTSequence = 1239;
  dPresentationLUTShape = 1240;
  dReferencedPresentationLUTSequence = 1241;
  dPrintJobGroupLength = 748;
  dPrintJobID = 749;
  dExecutionStatus = 750;
  dExecutionStatusInfo = 751;
  dCreationDate = 752;
  dCreationTime = 753;
  dOriginator = 754;
  dDestinationAE = 755;
  dOwnerID = 756;
  dNumberOfFilms = 757;
  dReferencedPrintJobSequence = 758;
  dPrinterGroupLength = 759;
  dPrinterStatus = 760;
  dPrinterStatusInfo = 761;
  dPrinterName = 762;
  dPrintQueueID = 763;
  dQueueGroupLength = 1242;
  dQueueStatus = 764;
  dPrintJobDescriptionSequence = 765;
  dQueueReferencedPrintJobSequence = 766;
  dPrintContentGroupLength = 1243;
  dPrintManagementCapabilitiesSequence = 1244;
  dPrinterCharacteristicsSequence = 1245;
  dFilmBoxContentSequence = 1246;
  dImageBoxContentSequence = 1247;
  dAnnotationContentSequence = 1248;
  dImageOverlayBoxContentSequence = 1249;
  dPresentationLUTContentSequence = 1250;
  dProposedStudySequence = 1251;
  dOriginalImageSequence = 1252;
  dRTImageGroupLength = 1253;
  dRTImageLabel = 767;
  dRTImageName = 768;
  dRTImageDescription = 769;
  dReportedValuesOrigin = 770;
  dRTImagePlane = 771;
  dXRayImageReceptorAngle = 772;
  dRTImageOrientation = 773;
  dImagePlanePixelSpacing = 774;
  dRTImagePosition = 775;
  dRadiationMachineName = 776;
  dRadiationMachineSAD = 777;
  dRadiationMachineSSD = 778;
  dRTImageSID = 779;
  dSourceToReferenceObjectDistance = 780;
  dFractionNumber = 781;
  dExposureSequence = 782;
  dMetersetExposure = 783;
  dRTDoseGroupLength = 1254;
  dDVHType = 784;
  dDoseUnits = 785;
  dDoseType = 786;
  dDoseComment = 787;
  dNormalizationPoint = 788;
  dDoseSummationType = 789;
  dGridFrameOffsetVector = 790;
  dDoseGridScaling = 791;
  dRTDoseROISequence = 792;
  dDoseValue = 793;
  dDVHNormalizationPoint = 794;
  dDVHNormalizationDoseValue = 795;
  dDVHSequence = 796;
  dDVHDoseScaling = 797;
  dDVHVolumeUnits = 798;
  dDVHNumberOfBins = 799;
  dDVHData = 800;
  dDVHReferencedROISequence = 801;
  dDVHROIContributionType = 802;
  dDVHMinimumDose = 803;
  dDVHMaximumDose = 804;
  dDVHMeanDose = 805;
  dRTStructureSetGroupLength = 1255;
  dStructureSetLabel = 806;
  dStructureSetName = 807;
  dStructureSetDescription = 808;
  dStructureSetDate = 809;
  dStructureSetTime = 810;
  dReferencedFrameOfReferenceSequence = 811;
  dRTReferencedStudySequence = 812;
  dRTReferencedSeriesSequence = 813;
  dContourImageSequence = 814;
  dStructureSetROISequence = 815;
  dROINumber = 816;
  dReferencedFrameOfReferenceUID = 817;
  dROIName = 818;
  dROIDescription = 819;
  dROIDisplayColor = 820;
  dROIVolume = 821;
  dRTRelatedROISequence = 822;
  dRTROIRelationship = 823;
  dROIGenerationAlgorithm = 824;
  dROIGenerationDescription = 825;
  dROIContourSequence = 826;
  dContourSequence = 827;
  dContourGeometricType = 828;
  dContourSlabThickness = 829;
  dContourOffsetVector = 830;
  dNumberOfContourPoints = 831;
  dContourData = 832;
  dRTROIObservationsSequence = 833;
  dObservationNumber = 834;
  dReferencedROINumber = 835;
  dROIObservationLabel = 836;
  dRTROIIdentificationCodeSequence = 837;
  dROIObservationDescription = 838;
  dRelatedRTROIObservationsSequence = 839;
  dRTROIInterpretedType = 840;
  dROIInterpreter = 841;
  dROIPhysicalPropertiesSequence = 842;
  dROIPhysicalProperty = 843;
  dROIPhysicalPropertyValue = 844;
  dFrameOfReferenceRelationshipSequence = 845;
  dRelatedFrameOfReferenceUID = 846;
  dFrameOfReferenceTransformationType = 847;
  dFrameOfReferenceTransformationMatrix = 848;
  dFrameOfReferenceTransformationComment = 849;
  dRTPlanGroupLength = 1256;
  dRTPlanLabel = 850;
  dRTPlanName = 851;
  dRTPlanDescription = 852;
  dRTPlanDate = 853;
  dRTPlanTime = 854;
  dTreatmentProtocols = 855;
  dTreatmentIntent = 856;
  dTreatmentSites = 857;
  dRTPlanGeometry = 858;
  dPrescriptionDescription = 859;
  dDoseReferenceSequence = 860;
  dDoseReferenceNumber = 861;
  dDoseReferenceStructureType = 862;
  dDoseReferenceDescription = 863;
  dDoseReferencePointCoordinates = 864;
  dNominalPriorDose = 865;
  dDoseReferenceType = 866;
  dConstraintWeight = 867;
  dDeliveryWarningDose = 868;
  dDeliveryMaximumDose = 869;
  dTargetMinimumDose = 870;
  dTargetPrescriptionDose = 871;
  dTargetMaximumDose = 872;
  dTargetUnderdoseVolumeFraction = 873;
  dOrganAtRiskFullVolumeDose = 874;
  dOrganAtRiskLimitDose = 875;
  dOrganAtRiskMaximumDose = 876;
  dOrganAtRiskOverdoseVolumeFraction = 877;
  dToleranceTableSequence = 878;
  dToleranceTableNumber = 879;
  dToleranceTableLabel = 880;
  dGantryAngleTolerance = 881;
  dBeamLimitingDeviceAngleTolerance = 882;
  dBeamLimitingDeviceToleranceSequence = 883;
  dBeamLimitingDevicePositionTolerance = 884;
  dPatientSupportAngleTolerance = 885;
  dTableTopEccentricAngleTolerance = 886;
  dTableTopVerticalPositionTolerance = 887;
  dTableTopLongitudinalPositionTolerance = 888;
  dTableTopLateralPositionTolerance = 889;
  dRTPlanRelationship = 890;
  dFractionGroupSequence = 891;
  dFractionGroupNumber = 892;
  dNumberOfFractionsPlanned = 893;
  dNumberOfFractionsPerDay = 894;
  dRepeatFractionCycleLength = 895;
  dFractionPattern = 896;
  dNumberOfBeams = 897;
  dBeamDoseSpecificationPoint = 898;
  dBeamDose = 899;
  dBeamMeterset = 900;
  dNumberOfBrachyApplicationSetups = 901;
  dBrachyApplicationSetupDoseSpecificationPoint = 902;
  dBrachyApplicationSetupDose = 903;
  dBeamSequence = 904;
  dTreatmentMachineName = 905;
  dPrimaryDosimeterUnit = 906;
  dSource_AxisDistance = 907;
  dBeamLimitingDeviceSequence = 908;
  dRTBeamLimitingDeviceType = 909;
  dSourceToBeamLimitingDeviceDistance = 910;
  dNumberOfLeafJawPairs = 911;
  dLeafPositionBoundaries = 912;
  dBeamNumber = 913;
  dBeamName = 914;
  dBeamDescription = 915;
  dBeamType = 916;
  dRadiationType = 917;
  dReferenceImageNumber = 918;
  dPlannedVerificationImageSequence = 919;
  dImagingDeviceSpecificAcquisitionParameters = 920;
  dTreatmentDeliveryType = 921;
  dNumberOfWedges = 922;
  dWedgeSequence = 923;
  dWedgeNumber = 924;
  dWedgeType = 925;
  dWedgeID = 926;
  dWedgeAngle = 927;
  dWedgeFactor = 928;
  dWedgeOrientation = 929;
  dSourceToWedgeTrayDistance = 930;
  dNumberOfCompensators = 931;
  dMaterialID = 932;
  dTotalCompensatorTrayFactor = 933;
  dCompensatorSequence = 934;
  dCompensatorNumber = 935;
  dCompensatorID = 936;
  dSourceToCompensatorTrayDistance = 937;
  dCompensatorRows = 938;
  dCompensatorColumns = 939;
  dCompensatorPixelSpacing = 940;
  dCompensatorPosition = 941;
  dCompensatorTransmissionData = 942;
  dCompensatorThicknessData = 943;
  dNumberOfBoli = 944;
  dNumberOfBlocks = 945;
  dTotalBlockTrayFactor = 946;
  dBlockSequence = 947;
  dBlockTrayID = 948;
  dSourceToBlockTrayDistance = 949;
  dBlockType = 950;
  dBlockDivergence = 951;
  dBlockNumber = 952;
  dBlockName = 953;
  dBlockThickness = 954;
  dBlockTransmission = 955;
  dBlockNumberOfPoints = 956;
  dBlockData = 957;
  dApplicatorSequence = 958;
  dApplicatorID = 959;
  dApplicatorType = 960;
  dApplicatorDescription = 961;
  dCumulativeDoseReferenceCoefficient = 962;
  dFinalCumulativeMetersetWeight = 963;
  dNumberOfControlPoints = 964;
  dControlPointSequence = 965;
  dControlPointIndex = 966;
  dNominalBeamEnergy = 967;
  dDoseRateSet = 968;
  dWedgePositionSequence = 969;
  dWedgePosition = 970;
  dBeamLimitingDevicePositionSequence = 971;
  dLeafJawPositions = 972;
  dGantryAngle = 973;
  dGantryRotationDirection = 974;
  dBeamLimitingDeviceAngle = 975;
  dBeamLimitingDeviceRotationDirection = 976;
  dPatientSupportAngle = 977;
  dPatientSupportRotationDirection = 978;
  dTableTopEccentricAxisDistance = 979;
  dTableTopEccentricAngle = 980;
  dTableTopEccentricRotationDirection = 981;
  dTableTopVerticalPosition = 982;
  dTableTopLongitudinalPosition = 983;
  dTableTopLateralPosition = 984;
  dIsocenterPosition = 985;
  dSurfaceEntryPoint = 986;
  dSourceToSurfaceDistance = 987;
  dCumulativeMetersetWeight = 988;
  dPatientSetupSequence = 989;
  dPatientSetupNumber = 990;
  dPatientAdditionalPosition = 991;
  dFixationDeviceSequence = 992;
  dFixationDeviceType = 993;
  dFixationDeviceLabel = 994;
  dFixationDeviceDescription = 995;
  dFixationDevicePosition = 996;
  dShieldingDeviceSequence = 997;
  dShieldingDeviceType = 998;
  dShieldingDeviceLabel = 999;
  dShieldingDeviceDescription = 1000;
  dShieldingDevicePosition = 1001;
  dSetupTechnique = 1002;
  dSetupTechniqueDescription = 1003;
  dSetupDeviceSequence = 1004;
  dSetupDeviceType = 1005;
  dSetupDeviceLabel = 1006;
  dSetupDeviceDescription = 1007;
  dSetupDeviceParameter = 1008;
  dSetupReferenceDescription = 1009;
  dTableTopVerticalSetupDisplacement = 1010;
  dTableTopLongitudinalSetupDisplacement = 1011;
  dTableTopLateralSetupDisplacement = 1012;
  dBrachyTreatmentTechnique = 1013;
  dBrachyTreatmentType = 1014;
  dTreatmentMachineSequence = 1015;
  dSourceSequence = 1016;
  dSourceNumber = 1017;
  dSourceType = 1018;
  dSourceManufacturer = 1019;
  dActiveSourceDiameter = 1020;
  dActiveSourceLength = 1021;
  dSourceEncapsulationNominalThickness = 1022;
  dSourceEncapsulationNominalTransmission = 1023;
  dSourceIsotopeName = 1024;
  dSourceIsotopeHalfLife = 1025;
  dReferenceAirKermaRate = 1026;
  dAirKermaRateReferenceDate = 1027;
  dAirKermaRateReferenceTime = 1028;
  dApplicationSetupSequence = 1029;
  dApplicationSetupType = 1030;
  dApplicationSetupNumber = 1031;
  dApplicationSetupName = 1032;
  dApplicationSetupManufacturer = 1033;
  dTemplateNumber = 1034;
  dTemplateType = 1035;
  dTemplateName = 1036;
  dTotalReferenceAirKerma = 1037;
  dBrachyAccessoryDeviceSequence = 1038;
  dBrachyAccessoryDeviceNumber = 1039;
  dBrachyAccessoryDeviceID = 1040;
  dBrachyAccessoryDeviceType = 1041;
  dBrachyAccessoryDeviceName = 1042;
  dBrachyAccessoryDeviceNominalThickness = 1043;
  dBrachyAccessoryDeviceNominalTransmission = 1044;
  dChannelSequence = 1045;
  dChannelNumber = 1046;
  dChannelLength = 1047;
  dChannelTotalTime = 1048;
  dSourceMovementType = 1049;
  dNumberOfPulses = 1050;
  dPulseRepetitionInterval = 1051;
  dSourceApplicatorNumber = 1052;
  dSourceApplicatorID = 1053;
  dSourceApplicatorType = 1054;
  dSourceApplicatorName = 1055;
  dSourceApplicatorLength = 1056;
  dSourceApplicatorManufacturer = 1057;
  dSourceApplicatorWallNominalThickness = 1058;
  dSourceApplicatorWallNominalTransmission = 1059;
  dSourceApplicatorStepSize = 1060;
  dTransferTubeNumber = 1061;
  dTransferTubeLength = 1062;
  dChannelShieldSequence = 1063;
  dChannelShieldNumber = 1064;
  dChannelShieldID = 1065;
  dChannelShieldName = 1066;
  dChannelShieldNominalThickness = 1067;
  dChannelShieldNominalTransmission = 1068;
  dFinalCumulativeTimeWeight = 1069;
  dBrachyControlPointSequence = 1070;
  dControlPointRelativePosition = 1071;
  dControlPoint3DPosition = 1072;
  dCumulativeTimeWeight = 1073;
  dRTRelationshipGroupLength = 1257;
  dReferencedRTPlanSequence = 1074;
  dReferencedBeamSequence = 1075;
  dReferencedBeamNumber = 1076;
  dReferencedReferenceImageNumber = 1077;
  dStartCumulativeMetersetWeight = 1078;
  dEndCumulativeMetersetWeight = 1079;
  dReferencedBrachyApplicationSetupSequence = 1080;
  dReferencedBrachyApplicationSetupNumber = 1081;
  dReferencedSourceNumber = 1082;
  dReferencedFractionGroupSequence = 1083;
  dReferencedFractionGroupNumber = 1084;
  dReferencedVerificationImageSequence = 1085;
  dReferencedReferenceImageSequence = 1086;
  dReferencedDoseReferenceSequence = 1087;
  dReferencedDoseReferenceNumber = 1088;
  dBrachyReferencedDoseReferenceSequence = 1089;
  dReferencedStructureSetSequence = 1090;
  dReferencedPatientSetupNumber = 1091;
  dReferencedDoseSequence = 1092;
  dReferencedToleranceTableNumber = 1093;
  dReferencedBolusSequence = 1094;
  dReferencedWedgeNumber = 1095;
  dReferencedCompensatorNumber = 1096;
  dReferencedBlockNumber = 1097;
  dReferencedControlPointIndex = 1098;
  dRTApprovalGroupLength = 1258;
  dApprovalStatus = 1099;
  dReviewDate = 1100;
  dReviewTime = 1101;
  dReviewerName = 1102;
  dResultsGroupLength = 1103;
  dResultsID = 1104;
  dResultsIDIssuer = 1105;
  dReferencedInterpretationSequence = 1106;
  dInterpretationRecordedDate = 1107;
  dInterpretationRecordedTime = 1108;
  dInterpretationRecorder = 1109;
  dReferenceToRecordedSound = 1110;
  dInterpretationTranscriptionDate = 1111;
  dInterpretationTranscriptionTime = 1112;
  dInterpretationTranscriber = 1113;
  dInterpretationText = 1114;
  dInterpretationAuthor = 1115;
  dInterpretationApproverSequence = 1116;
  dInterpretationApprovalDate = 1117;
  dInterpretationApprovalTime = 1118;
  dPhysicianApprovingInterpretation = 1119;
  dInterpretationDiagnosisDescription = 1120;
  dDiagnosisCodeSequence = 1121;
  dResultsDistributionListSequence = 1122;
  dDistributionName = 1123;
  dDistributionAddress = 1124;
  dInterpretationID = 1125;
  dInterpretationIDIssuer = 1126;
  dInterpretationTypeID = 1127;
  dInterpretationStatusID = 1128;
  dImpressions = 1129;
  dResultsComments = 1130;
  dCurveGroupLength = 1131;
  dCurveDimensions = 1132;
  dNumberOfPoints = 1133;
  dTypeOfData = 1134;
  dCurveDescription = 1135;
  dAxisUnits = 1136;
  dAxisLabels = 1137;
  dDataValueRepresentation = 1138;
  dMinimumCoordinateValue = 1139;
  dMaximumCoordinateValue = 1140;
  dCurveRange = 1141;
  dCurveDataDescriptor = 1142;
  dCoordinateStartValue = 1143;
  dCoordinateStepValue = 1144;
  dCurveActivationLayer = 1379;
  dAudioType = 1145;
  dAudioSampleFormat = 1146;
  dNumberOfChannels = 1147;
  dNumberOfSamples = 1148;
  dSampleRate = 1149;
  dTotalTime = 1150;
  dAudioSampleData = 1151;
  dAudioComments = 1152;
  dCurveLabel = 1153;
  dCurveReferencedOverlaySequence = 1154;
  dCurveReferencedOverlayGroup = 1155;
  dCurveData = 1156;
  dWaveformSequence = 1499;
  dChannelMinimumValue = 1500;
  dChannelMaximumValue = 1501;
  dWaveformBitsAllocated = 1502;
  dWaveformSampleInterpretation = 1503;
  dWaveformPaddingValue = 1504;
  dWaveformData = 1505;
  dOverlayGroupLength = 1157;
  dOverlayRows = 1158;
  dOverlayColumns = 1159;
  dOverlayPlanes = 1160;
  dOverlayNumberOfFrames = 1161;
  dOverlayDescription = 1162;
  dOverlayType = 1163;
  dOverlaySubtype = 1164;
  dOverlayOrigin = 1165;
  dImageFrameOrigin = 1166;
  dOverlayPlaneOrigin = 1167;
  dOverlayBitsAllocated = 1168;
  dOverlayBitPosition = 1169;
  dOverlayActivationLayer = 1380;
  dOverlayDescriptorGray = 1170;
  dOverlayDescriptorRed = 1171;
  dOverlayDescriptorGreen = 1172;
  dOverlayDescriptorBlue = 1173;
  dOverlayGray = 1174;
  dOverlayRed = 1175;
  dOverlayGreen = 1176;
  dOverlayBlue = 1177;
  dROIArea = 1178;
  dROIMean = 1179;
  dROIStandardDeviation = 1180;
  dOverlayLabel = 1181;
  dOverlayData = 1182;
  dPixelDataGroupLength = 1183;
  dPixelData = 1184;
  dDataSetTrailingPadding = 1185;
  dItem = 1186;
  dItemDelimitationItem = 1187;
  dSequenceDelimitationItem = 1188;
  dUndefined = 1189;

type
  TDicomDataType = (ddtString, ddtInteger, ddtSingle, ddtDouble,
    ddtShortInt, ddtDatetime, ddtTime, ddtAttributes,
    ddtOBStream, ddtImage);
  TDicomTypeItem = class
  private
    FTypeString: AnsiString;
    FTypeIndex: Integer;
  public
    constructor Create(ATypeString: AnsiString; ATypeIndex: Integer);
    property TypeString: AnsiString read FTypeString;
    property TypeIndex: Integer read FTypeIndex;
  end;
  TDicomTypeArray = class
  private
    FList: TList;
    FList1: TList;
    procedure Add(ATypeString: AnsiString; ATypeIndex: Integer);
  protected
    function GetItem(AIndex: Integer): TDicomTypeItem;
    function GetCount: Integer;
    function GetItemByContant(AIndex: Integer): TDicomTypeItem;
    function GetItemByString(AValue: AnsiString): TDicomTypeItem;
    procedure AddAllData; virtual;
  public
    constructor Create;
    destructor Destroy; override;

    property Items[Index: Integer]: TDicomTypeItem read GetItem;
    property ItemByContant[Index: Integer]: TDicomTypeItem read GetItemByContant;
    property ItemByString[AValue: AnsiString]: TDicomTypeItem read GetItemByString; default;
    property Count: Integer read GetCount;
  end;

  TDDictEntry = class
  private
    FGroupElement: LongWord;
    FDicomType: Byte;
    FDescription: AnsiString;
    FVM: AnsiString;
    FID: Integer;
  protected
    function getText: AnsiString;
  public
    constructor Create(AGroup: Word; AElement: Word; ADicomType: Byte; ADescription: AnsiString; AVM:
      AnsiString);
    function getGroup: Word;
    function getElement: Word;
    function getVR: AnsiString;

    property Description: AnsiString read FDescription;
    property DicomType: Byte read FDicomType;
    property VM: AnsiString read FVM;
    property GroupElement: LongWord read FGroupElement;
    property Text: AnsiString read getText;
    property ID: Integer read FID;
  end;
  TDDictArray = class
  private
    FList: TList;
    FList1: TList;
    procedure Add(AID: Integer; AGroup: Word; AElement: Word; ADicomType: Byte; ADescription:
      AnsiString; AVM: AnsiString);
  protected
    function GetItem(AIndex: Integer): TDDictEntry;
    function GetItem1(AIndex: Integer): TDDictEntry;
    function GetCount: Integer;
    function GetItemByContant(AIndex: Integer): TDDictEntry;
    function FindItem(AGroup: Word; AElement: Word): TDDictEntry;
    function GetItemByGroupElement(AGroupElement: LongWord): TDDictEntry;
    procedure AddAllData; virtual;
    procedure AddAllData1; virtual;
    procedure AddAllData2; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    function Append(AGroup: Word; AElement: Word; ADicomType: Byte; AVM, ADescription:
      AnsiString): Boolean;
    procedure Refresh;

    property Items[Index: Integer]: TDDictEntry read GetItem;
    property Items1[Index: Integer]: TDDictEntry read GetItem1;
    property ItemByContant[Index: Integer]: TDDictEntry read GetItemByContant;
    property ItemByGroupElement[AGroupElement: LongWord]: TDDictEntry read GetItemByGroupElement;
    property Count: Integer read GetCount;
  end;
function FindDicomType(s1: AnsiString): Integer;
function GetDicomTypeLength(ADicomType: Integer): Integer;
//function SortDictEntry(Item1, Item2: Pointer): Integer;

var
  DDict: TDDictArray;
  UnknowEntry: TDDictEntry;
  GroupLengthEntry: TDDictEntry;

  DType: TDicomTypeArray;
  UnknowType: TDicomTypeItem;

  UserHospitalName: string;
  PacsSoftwareName: string;

implementation

{ TDicomImagePalette }

constructor TDicomImagePalette.Create;
begin
  Getmem(FBlueTable, 256);
  Getmem(FGreenTable, 256);
  Getmem(FRedTable, 256);
  fRect := Rect(0, 0, 0, 0);
end;

destructor TDicomImagePalette.Destroy;
begin
  Freemem(FBlueTable);
  Freemem(FGreenTable);
  Freemem(FRedTable);
  inherited;
end;

function GetDicomTypeLength(ADicomType: Integer): Integer;
begin
  case ADicomType of
    tUS, tUS_SS, tSS:
      result := 2;
    tUL, tAT, tSL, tFL: //tAS
      result := 4;
    tFD:
      result := 8;
    //  2,4,6,7,8,9,10,11,12,13,14,15,16,18,22,24,25:
  else
    result := 0;
  end; //end of case
end;

function SortDictEntry(Item1, Item2: Pointer): Integer;
var
  dd1, dd2: TDDictEntry;
begin
  dd1 := TDDictEntry(Item1);
  dd2 := TDDictEntry(Item2);
  if dd1.GroupElement > dd2.GroupElement then
    Result := 1
  else
    if dd1.GroupElement < dd2.GroupElement then
    Result := -1
  else
    Result := 0;
end;

function SortDicomType1(Item1, Item2: Pointer): Integer;
var
  dd1, dd2: TDicomTypeItem;
begin
  dd1 := TDicomTypeItem(Item1);
  dd2 := TDicomTypeItem(Item2);
  if dd1.TypeString > dd2.TypeString then
    Result := 1
  else
    if dd1.TypeString < dd2.TypeString then
    Result := -1
  else
    Result := 0;
end;

function SortDicomType2(Item1, Item2: Pointer): Integer;
var
  dd1, dd2: TDicomTypeItem;
begin
  dd1 := TDicomTypeItem(Item1);
  dd2 := TDicomTypeItem(Item2);
  if dd1.TypeIndex > dd2.TypeIndex then
    Result := 1
  else
    if dd1.TypeIndex < dd2.TypeIndex then
    Result := -1
  else
    Result := 0;
end;

function SortDictEntry1(Item1, Item2: Pointer): Integer;
var
  dd1, dd2: TDDictEntry;
begin
  dd1 := TDDictEntry(Item1);
  dd2 := TDDictEntry(Item2);
  if dd1.ID > dd2.ID then
    Result := 1
  else
    if dd1.ID < dd2.ID then
    Result := -1
  else
    Result := 0;
end;

constructor TDicomTypeItem.Create(ATypeString: AnsiString; ATypeIndex: Integer);
begin
  FTypeString := ATypeString;
  FTypeIndex := ATypeIndex;
end;

procedure TDicomTypeArray.Add(ATypeString: AnsiString; ATypeIndex: Integer);
var
  v1: TDicomTypeItem;
begin
  v1 := TDicomTypeItem.Create(ATypeString, ATypeIndex);
  FList.Add(v1);
end;

function TDicomTypeArray.GetItem(AIndex: Integer): TDicomTypeItem;
begin
  Result := TDicomTypeItem(FList[AIndex]);
end;

function TDicomTypeArray.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TDicomTypeArray.GetItemByContant(AIndex: Integer): TDicomTypeItem;
var
  k, k1: Integer;
  l1, h1, m1: Integer;
begin
  k := AIndex;
  l1 := 0;
  h1 := Flist.Count - 1;
  Result := nil;
  while l1 <= h1 do
  begin
    m1 := (l1 + h1) div 2;
    k1 := TDicomTypeItem(FList[m1]).TypeIndex;
    if k1 > k then
      h1 := m1 - 1
    else
      if k1 < k then
      l1 := m1 + 1
    else
    begin
      Result := TDicomTypeItem(FList[m1]);
      exit;
    end;
  end; // while
  {  if not assigned(Result) then
    begin
      Result := UnknowType;
    end;}
end;

function TDicomTypeArray.GetItemByString(AValue: AnsiString): TDicomTypeItem;
var
  k, k1: AnsiString;
  l1, h1, m1: Integer;
begin
  k := AValue;
  l1 := 0;
  h1 := Flist.Count - 1;
  Result := nil;
  while l1 <= h1 do
  begin
    m1 := (l1 + h1) div 2;
    k1 := TDicomTypeItem(FList[m1]).TypeString;
    if k1 > k then
      h1 := m1 - 1
    else
      if k1 < k then
      l1 := m1 + 1
    else
    begin
      Result := TDicomTypeItem(FList[m1]);
      exit;
    end;
  end; // while
  {  if not assigned(Result) then
    begin
      Result := UnknowType;
    end;}
end;

procedure TDicomTypeArray.AddAllData;
var
  i: integer;
begin
  for i := 0 to 28 do
    Add(DicomTypeArray[i], i);
  Add('??', tCS);
  Add('UN', tUNKNOWN);
end;

constructor TDicomTypeArray.Create;
begin
  FList := TList.Create;
  FList1 := TList.Create;
  AddAllData;
  FList.Sort(SortDicomType1);
  FList1.Sort(SortDicomType2);
end;

destructor TDicomTypeArray.Destroy;
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
    TDicomTypeItem(FList[i]).Free;
  FList.Free;
  FList1.Free;
  inherited;
end;

// FOMIN äîáàâëåíû ïàðàìåòðû
function FindDicomType(s1: AnsiString): Integer;
var
  v1: TDicomTypeItem;
begin
  v1 := DType.ItemByString[s1];
  if assigned(v1) then
    Result := v1.TypeIndex
  else
  begin
    // FOMIN 09.01.2012
    result := tUNKNOWN;
  //  raise Exception.Create('GetTypeCode: Error DICOM Data type code:"' + s1 + '"')
      {DicomException};
  end; //end of if(s1=('DT'))

  (*  if s1 = ('UL') then
    begin
      result := tUL;
    end //end of if(s1=('UL'))
    else
      if s1 = ('UI') then
    begin
      result := tUI;
    end //end of if(s1=('UI'))
    else
      if s1 = ('LO') then
    begin
      result := tLO;
    end //end of if(s1=('LO'))
    else
      if s1 = ('US') then
    begin
      result := tUS;
    end //end of if(s1=('US'))
    else
      if s1 = ('AE') then
    begin
      result := tAE;
    end //end of if(s1=('AE'))
    else
      if s1 = ('AT') then
    begin
      result := tAT;
    end //end of if(s1=('AT'))
    else
      if s1 = ('SH') then
    begin
      result := tSH;
    end //end of if(s1=('SH'))
    else
      if s1 = ('IS') then
    begin
      result := tIS;
    end //end of if(s1=('IS'))
    else
      if s1 = ('OB') then
    begin
      result := tOB;
    end //end of if(s1=('OB'))
    else
      if s1 = ('DA') then
    begin
      result := tDA;
    end //end of if(s1=('DA'))
    else
      if s1 = ('TM') then
    begin
      result := tTM;
    end //end of if(s1=('TM'))
    else
      if s1 = ('CS') then
    begin
      result := tCS;
    end //end of if(s1=('CS'))
    else
      if s1 = ('SQ') then
    begin
      result := tSQ;
    end //end of if(s1=('SQ'))
    else
      if s1 = ('LT') then
    begin
      result := tLT;
    end //end of if(s1=('LT'))
    else
      if s1 = ('ST') then
    begin
      result := tST;
    end //end of if(s1=('ST'))
    else
      if s1 = ('PN') then
    begin
      result := tPN;
    end //end of if(s1=('PN'))
    else
      if s1 = ('DS') then
    begin
      result := tDS;
    end //end of if(s1=('DS'))
    else
      if s1 = ('AS') then
    begin
      result := tAS;
    end //end of if(s1=('AS'))
    else
      if s1 = ('SL') then
    begin
      result := tSL;
    end //end of if(s1=('SL'))
    else
      if s1 = ('FD') then
    begin
      result := tFD;
    end //end of if(s1=('FD'))
    else
      if s1 = ('FL') then
    begin
      result := tFL;
    end //end of if(s1=('FL'))
    else
      if s1 = ('OW') then
    begin
      result := tOW;
    end //end of if(s1=('OW'))
    else
      if s1 = ('SS') then
    begin
      result := tSS;
    end //end of if(s1=('SS'))
    else
      if s1 = ('UN') then
    begin
      result := tUNKNOWN;
    end //end of if(s1=('UN'))
    else
      if s1 = ('UT') then
    begin
      result := tUT;
    end //end of if(s1=('UT'))
    else
      if s1 = ('DT') then
    begin
      result := tDT;
    end //end of if(s1=('UT'))
    else
      if s1 = ('??') then
    begin
      result := tDS;
    end
    else
    begin
      result := tUNKNOWN;
      raise Exception.Create('getTypeCode: unexpected type ' + s1) {DicomException};
    end; //end of if(s1=('DT')) *)
end; //end of F_a(s1:AnsiString)

function TDDictArray.GetItemByContant(AIndex: Integer): TDDictEntry;
var
  k, k1: LongWord;
  l1, h1, m1: Integer;
begin
  k := AIndex;
  l1 := 0;
  h1 := Flist1.Count - 1;
  Result := nil;
  while l1 <= h1 do
  begin
    m1 := (l1 + h1) div 2;
    k1 := TDDictEntry(FList1[m1]).ID;
    if k1 > k then
      h1 := m1 - 1
    else
      if k1 < k then
      l1 := m1 + 1
    else
    begin
      Result := TDDictEntry(FList1[m1]);
      exit;
    end;
  end; // while
  if not assigned(Result) then
  begin
    Result := UnknowEntry;
  end;
end;

function TDDictArray.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TDDictArray.GetItem(AIndex: Integer): TDDictEntry;
begin
  Result := TDDictEntry(FList[AIndex]);
end;

function TDDictArray.GetItem1(AIndex: Integer): TDDictEntry;
begin
  Result := TDDictEntry(FList1[AIndex]);
end;

function TDDictArray.FindItem(AGroup: Word; AElement: Word): TDDictEntry;
var
  k: LongWord;
begin
  k := AGroup shl 16 + AElement;
  Result := GetItemByGroupElement(k);
end;

function TDDictArray.GetItemByGroupElement(AGroupElement: LongWord): TDDictEntry;
var
  k, k1: LongWord;
  //  d1:TDDictEntry;
  l1, h1, m1: Integer;
begin
  k := AGroupElement;
  l1 := 0;
  h1 := Flist.Count - 1;
  Result := nil;
  while l1 <= h1 do
  begin
    m1 := (l1 + h1) div 2;
    k1 := TDDictEntry(FList[m1]).GroupElement;
    if k1 > k then
      h1 := m1 - 1
    else
      if k1 < k then
      l1 := m1 + 1
    else
    begin
      Result := TDDictEntry(FList[m1]);
      exit;
    end;
  end; // while
  if not assigned(Result) then
  begin
    if (AGroupElement and $FFFF) = 0 then
      Result := GroupLengthEntry
    else
      Result := UnknowEntry;
  end;
end;

function TDDictArray.Append(AGroup: Word; AElement: Word; ADicomType: Byte; AVM, ADescription:
  AnsiString): Boolean;
var
  p1, p2: TDDictEntry;
begin
  Result := false;
  p2 := FindItem(AGroup, AElement);
  if p2 = UnknowEntry then
  begin
    p1 := TDDictEntry.Create(AGroup, AElement, ADicomType, ADescription, AVM);
    p1.FID := FList.Count;
    FList.Add(p1);
    FList1.Add(p1);
    Result := true;
  end;
end;

procedure TDDictArray.Add(AID: Integer; AGroup: Word; AElement: Word; ADicomType: Byte;
  ADescription: AnsiString; AVM: AnsiString);
var
  p1: TDDictEntry;
begin
  p1 := TDDictEntry.Create(AGroup, AElement, ADicomType, ADescription, AVM);
  p1.FID := AID;
  FList.Add(p1);
  FList1.Add(p1);
end;

procedure TDDictArray.Refresh;
begin
  FList.Sort(SortDictEntry);
  FList1.Sort(SortDictEntry1);
end;

destructor TDDictArray.Destroy;
var
  i: integer;
begin
  for i := 0 to FList.Count - 1 do
    TDDictEntry(FList[i]).Free;
  FList.Clear;
  FList.Free;
  FList1.Clear;
  FList1.Free;
  inherited Destroy;
end;

constructor TDDictArray.Create;
begin
  FList := TList.Create;
  FList1 := TList.Create;
  AddAllData;
  //  Refresh;
end;

function TDDictEntry.getText: AnsiString;
begin
  Result := IntToHex(FGroupElement, 8) + '(' + FDescription + ')';
  System.Insert(':', Result, 5);
end;

function TDDictEntry.GetVR: AnsiString;
begin
  Result := DicomTypeArray[FDicomType];
end;

constructor TDDictEntry.Create(AGroup: Word; AElement: Word; ADicomType: Byte; ADescription:
  AnsiString; AVM: AnsiString);
begin
  //  FGroupElement := AGroup;
  FGroupElement := AGroup shl 16 + AElement;
  FDicomType := ADicomType;
  FDescription := ADescription;
  FVM := AVM;
end;

function TDDictEntry.getGroup: Word;
begin
  result := FGroupElement shr 16;
end; //end of getGroup

function TDDictEntry.getElement: Word;
begin
  result := FGroupElement and ($FFFF);
end; //end of getElement

procedure TDDictArray.AddAllData;
begin
  Add(0, $0000, $0000, tUL, 'CommandGroupLength', '1');
  Add(1, $0000, $0002, tUI, 'AffectedSOPClassUID', '1');
  Add(2, $0000, $0003, tUI, 'RequestedSOPClassUID', '1');
  Add(3, $0000, $0100, tUS, 'CommandField', '1');
  Add(4, $0000, $0110, tUS, 'MessageID', '1');
  Add(5, $0000, $0120, tUS, 'MessageIDBeingRespondedTo', '1');
  Add(6, $0000, $0600, tAE, 'MoveDestination', '1');
  Add(7, $0000, $0700, tUS, 'Priority', '1');
  Add(8, $0000, $0800, tUS, 'DataSetType', '1');
  Add(9, $0000, $0900, tUS, 'Status', '1');
  Add(10, $0000, $0901, tAT, 'OffendingElement', '1-n');
  Add(11, $0000, $0902, tLO, 'ErrorComment', '1');
  Add(12, $0000, $0903, tUS, 'ErrorID', '1');
  Add(13, $0000, $1000, tUI, 'AffectedSOPInstanceUID', '1');
  Add(14, $0000, $1001, tUI, 'RequestedSOPInstanceUID', '1');
  Add(15, $0000, $1002, tUS, 'EventTypeID', '1');
  Add(16, $0000, $1005, tAT, 'AttributeIdentifierList', '1-n');
  Add(17, $0000, $1007, tAT, 'ModificationList', '1-n');
  Add(18, $0000, $1008, tUS, 'ActionTypeID', '1');
  Add(19, $0000, $1020, tUS, 'NumberOfRemainingSuboperations', '1');
  Add(20, $0000, $1021, tUS, 'NumberOfCompletedSuboperations', '1');
  Add(21, $0000, $1022, tUS, 'NumberOfFailedSuboperations', '1');
  Add(22, $0000, $1023, tUS, 'NumberOfWarningSuboperations', '1');
  Add(23, $0000, $1030, tAE, 'MoveOriginatorApplicationEntityTitle', '1');
  Add(24, $0000, $1031, tUS, 'MoveOriginatorMessageID', '1');
  Add(25, $0000, $5010, tSH, 'MessageSetID', '1');
  Add(26, $0000, $5020, tSH, 'EndMessageSet', '1');
  Add(27, $0002, $0000, tUL, 'MetaElementGroupLength', '1');
  Add(28, $0002, $0001, tOB, 'FileMetaInformationVersion', '1');
  Add(29, $0002, $0002, tUI, 'MediaStorageSOPClassUID', '1');
  Add(30, $0002, $0003, tUI, 'MediaStorageSOPInstanceUID', '1');
  Add(31, $0002, $0010, tUI, 'TransferSyntaxUID', '1');
  Add(32, $0002, $0012, tUI, 'ImplementationClassUID', '1');
  Add(33, $0002, $0013, tSH, 'ImplementationVersionName', '1');
  Add(34, $0002, $0016, tAE, 'SourceApplicationEntityTitle', '1');
  Add(35, $0002, $0100, tUI, 'PrivateInformationCreatorUID', '1');
  Add(36, $0002, $0102, tOB, 'PrivateInformation', '1');
  Add(37, $0004, $0000, tUL, 'FileSetGroupLength', '1');
  Add(38, $0004, $1130, tCS, 'FileSetID', '1');
  Add(39, $0004, $1141, tCS, 'FileSetDescriptorFileID', '1-8');
  Add(40, $0004, $1142, tCS, 'FileSetCharacterSet', '1');
  Add(41, $0004, $1200, tUL, 'RootDirectoryFirstRecord', '1');
  Add(42, $0004, $1202, tUL, 'RootDirectoryLastRecord', '1');
  Add(43, $0004, $1212, tUS, 'FileSetConsistencyFlag', '1');
  Add(44, $0004, $1220, tSQ, 'DirectoryRecordSequence', '1');
  Add(45, $0004, $1400, tUL, 'NextDirectoryRecordOffset', '1');
  Add(46, $0004, $1410, tUS, 'RecordInUseFlag', '1');
  Add(47, $0004, $1420, tUL, 'LowerLevelDirectoryOffset', '1');
  Add(48, $0004, $1430, tCS, 'DirectoryRecordType', '1');
  Add(49, $0004, $1432, tUI, 'PrivateRecordUID', '1');
  Add(50, $0004, $1500, tCS, 'ReferencedFileID', '1-8');
  Add(51, $0004, $1504, tUL, 'DirectoryRecordOffset', '1');
  Add(52, $0004, $1510, tUI, 'ReferencedSOPClassUIDInFile', '1');
  Add(53, $0004, $1511, tUI, 'ReferencedSOPInstanceUIDInFile', '1');
  Add(54, $0004, $1512, tUI, 'ReferencedTransferSyntaxUIDInFile', '1');
  Add(55, $0004, $1600, tUL, 'NumberOfReferences', '1');
  Add(56, $0008, $0000, tUL, 'IdentifyingGroupLength', '1');
  Add(57, $0008, $0005, tCS, 'SpecificCharacterSet', '1-n');
  Add(58, $0008, $0008, tCS, 'ImageType', '1-n');
  Add(59, $0008, $0012, tDA, 'InstanceCreationDate', '1');
  Add(60, $0008, $0013, tTM, 'InstanceCreationTime', '1');
  Add(61, $0008, $0014, tUI, 'InstanceCreatorUID', '1');
  Add(62, $0008, $0016, tUI, 'SOPClassUID', '1');
  Add(63, $0008, $0018, tUI, 'SOPInstanceUID', '1');
  Add(64, $0008, $0020, tDA, 'StudyDate', '1');
  Add(65, $0008, $0021, tDA, 'SeriesDate', '1');
  Add(66, $0008, $0022, tDA, 'AcquisitionDate', '1');
  Add(67, $0008, $0023, tDA, 'ContentDate', '1');
  Add(68, $0008, $0024, tDA, 'OverlayDate', '1');
  Add(69, $0008, $0025, tDA, 'CurveDate', '1');
  Add(1459, $0008, $002A, tDT, 'AcquisitionDatetime', '1');
  Add(70, $0008, $0030, tTM, 'StudyTime', '1');
  Add(71, $0008, $0031, tTM, 'SeriesTime', '1');
  Add(72, $0008, $0032, tTM, 'AcquisitionTime', '1');
  Add(73, $0008, $0033, tTM, 'ContentTime', '1');
  Add(74, $0008, $0034, tTM, 'OverlayTime', '1');
  Add(75, $0008, $0035, tTM, 'CurveTime', '1');
  Add(1516, $0008, $0040, tUS, 'OldDataSetType', '1');
  Add(1517, $0008, $0041, tLT, 'OldDataSetSubtype', '1');
  Add(76, $0008, $0042, tCS, 'NuclearMedicineSeriesType', '1');
  Add(77, $0008, $0050, tSH, 'AccessionNumber', '1');
  Add(78, $0008, $0052, tCS, 'QueryRetrieveLevel', '1');
  Add(79, $0008, $0054, tAE, 'RetrieveAETitle', '1-n');
  Add(1511, $0008, $0056, tCS, 'InstanceAvailability', '1');
  Add(80, $0008, $0058, tUI, 'FailedSOPInstanceUIDList', '1-n');
  Add(81, $0008, $0060, tCS, 'Modality', '1');
  Add(82, $0008, $0061, tCS, 'ModalitiesInStudy', '1-n');
  Add(83, $0008, $0064, tCS, 'ConversionType', '1');
  Add(1260, $0008, $0068, tCS, 'PresentationIntentType', '1');
  Add(84, $0008, $0070, tLO, 'Manufacturer', '1');
  Add(85, $0008, $0080, tLO, 'InstitutionName', '1');
  Add(86, $0008, $0081, tST, 'InstitutionAddress', '1');
  Add(87, $0008, $0082, tSQ, 'InstitutionCodeSequence', '1');
  Add(88, $0008, $0090, tPN, 'ReferringPhysiciansName', '1');
  Add(89, $0008, $0092, tST, 'ReferringPhysiciansAddress', '1');
  Add(90, $0008, $0094, tSH, 'ReferringPhysiciansTelephoneNumber', '1-n');
  Add(91, $0008, $0100, tSH, 'CodeValue', '1');
  Add(92, $0008, $0102, tSH, 'CodingSchemeDesignator', '1');
  Add(1337, $0008, $0103, tSH, 'CodingSchemeVersion', '1');
  Add(93, $0008, $0104, tLO, 'CodeMeaning', '1');
  Add(1338, $0008, $0105, tCS, 'MappingResource', '1');
  Add(1339, $0008, $0106, tDT, 'ContextGroupVersion', '1');
  Add(1340, $0008, $0107, tDT, 'ContextGroupLocalVersion', '1');
  Add(1341, $0008, $010B, tCS, 'CodeSetExtensionFlag', '1');
  Add(1342, $0008, $010C, tUI, 'PrivateCodingSchemeCreatorUID', '1');
  Add(1343, $0008, $010D, tUI, 'CodeSetExtensionCreatorUID', '1');
  Add(1344, $0008, $010F, tCS, 'ContextIdentifier', '1');
  Add(94, $0008, $1010, tSH, 'StationName', '1');
  Add(95, $0008, $1030, tLO, 'StudyDescription', '1');
  Add(96, $0008, $1032, tSQ, 'ProcedureCodeSequence', '1');
  Add(97, $0008, $103E, tLO, 'SeriesDescription', '1');
  Add(98, $0008, $1040, tLO, 'InstitutionalDepartmentName', '1');
  Add(99, $0008, $1048, tPN, 'PhysiciansOfRecord', '1-n');
  Add(100, $0008, $1050, tPN, 'PerformingPhysiciansName', '1-n');
  Add(101, $0008, $1060, tPN, 'NameOfPhysiciansReadingStudy', '1-n');
  Add(102, $0008, $1070, tPN, 'OperatorsName', '1-n');
  Add(103, $0008, $1080, tLO, 'AdmittingDiagnosisDescription', '1-n');
  Add(104, $0008, $1084, tSQ, 'AdmittingDiagnosisCodeSequence', '1');
  Add(105, $0008, $1090, tLO, 'ManufacturerModelName', '1');
  Add(106, $0008, $1100, tSQ, 'ReferencedResultsSequence', '1');
  Add(107, $0008, $1110, tSQ, 'ReferencedStudySequence', '1');
  Add(108, $0008, $1111, tSQ, 'ReferencedStudyComponentSequence', '1');
  Add(109, $0008, $1115, tSQ, 'ReferencedSeriesSequence', '1');
  Add(110, $0008, $1120, tSQ, 'ReferencedPatientSequence', '1');
  Add(111, $0008, $1125, tSQ, 'ReferencedVisitSequence', '1');
  Add(112, $0008, $1130, tSQ, 'ReferencedOverlaySequence', '1');
  Add(113, $0008, $1140, tSQ, 'ReferencedImageSequence', '1');
  Add(114, $0008, $1145, tSQ, 'ReferencedCurveSequence', '1');
  Add(115, $0008, $1150, tUI, 'ReferencedSOPClassUID', '1');
  Add(116, $0008, $1155, tUI, 'ReferencedSOPInstanceUID', '1');
  Add(1345, $0008, $115A, tUI, 'SOPClassesSupported', '1-n');
  Add(117, $0008, $1160, tIS, 'ReferencedFrameNumber', '1');
  Add(118, $0008, $1195, tUI, 'TransactionUID', '1');
  Add(119, $0008, $1197, tUS, 'FailureReason', '1');
  Add(120, $0008, $1198, tSQ, 'FailedSOPSequence', '1');
  Add(121, $0008, $1199, tSQ, 'ReferencedSOPSequence', '1');
  Add(1259, $0008, $2110, tCS, 'RETIRED_LossyImageCompression', '1');
  Add(122, $0008, $2111, tST, 'DerivationDescription', '1');
  Add(123, $0008, $2112, tSQ, 'SourceImageSequence', '1');
  Add(124, $0008, $2120, tSH, 'StageName', '1');
  Add(125, $0008, $2122, tIS, 'StageNumber', '1');
  Add(126, $0008, $2124, tIS, 'NumberOfStages', '1');
  Add(127, $0008, $2128, tIS, 'ViewNumber', '1');
  Add(128, $0008, $2129, tIS, 'NumberOfEventTimers', '1');
  Add(129, $0008, $212A, tIS, 'NumberOfViewsInStage', '1');
  Add(130, $0008, $2130, tDS, 'EventElapsedTime', '1-n');
  Add(131, $0008, $2132, tLO, 'EventTimerName', '1-n');
  Add(132, $0008, $2142, tIS, 'StartTrim', '1');
  Add(133, $0008, $2143, tIS, 'StopTrim', '1');
  Add(134, $0008, $2144, tIS, 'RecommendedDisplayFrameRate', '1');
  Add(135, $0008, $2200, tCS, 'TransducerPosition', '1');
  Add(136, $0008, $2204, tCS, 'TransducerOrientation', '1');
  Add(137, $0008, $2208, tCS, 'AnatomicStructure', '1');
  Add(138, $0008, $2218, tSQ, 'AnatomicRegionSequence', '1');
  Add(139, $0008, $2220, tSQ, 'AnatomicRegionModifierSequence', '1');
  Add(140, $0008, $2228, tSQ, 'PrimaryAnatomicStructureSequence', '1');
  Add(1190, $0008, $2229, tSQ, 'AnatomicStructureSpaceOrRegionSequence', '1');
  Add(141, $0008, $2230, tSQ, 'PrimaryAnatomicStructureModifierSequence', '1');
  Add(142, $0008, $2240, tSQ, 'TransducerPositionSequence', '1');
  Add(143, $0008, $2242, tSQ, 'TransducerPositionModifierSequence', '1');
  Add(144, $0008, $2244, tSQ, 'TransducerOrientationSequence', '1');
  Add(145, $0008, $2246, tSQ, 'TransducerOrientationModifierSequence', '1');
  Add(1509, $0009, $0016, tLO, 'TianiSOPClassUID', '1');
  Add(1510, $0009, $0018, tLO, 'TianiSOPInstanceUID', '1');
  Add(146, $0010, $0000, tUL, 'PatientGroupLength', '1');
  Add(147, $0010, $0010, tPN, 'PatientName', '1');
  Add(148, $0010, $0020, tLO, 'PatientID', '1');
  Add(149, $0010, $0021, tLO, 'IssuerOfPatientID', '1');
  Add(150, $0010, $0030, tDA, 'PatientBirthDate', '1');
  Add(151, $0010, $0032, tTM, 'PatientBirthTime', '1');
  Add(152, $0010, $0040, tCS, 'PatientSex', '1');
  Add(153, $0010, $0050, tSQ, 'PatientInsurancePlanCodeSequence', '1');
  Add(154, $0010, $1000, tLO, 'OtherPatientID', '1-n');
  Add(155, $0010, $1001, tPN, 'OtherPatientNames', '1-n');
  Add(156, $0010, $1005, tPN, 'PatientBirthName', '1');
  Add(157, $0010, $1010, tAS, 'PatientAge', '1');
  Add(158, $0010, $1020, tDS, 'PatientSize', '1');
  Add(159, $0010, $1030, tDS, 'PatientWeight', '1');
  Add(160, $0010, $1040, tLO, 'PatientAddress', '1');
  Add(161, $0010, $1060, tPN, 'PatientMotherBirthName', '1');
  Add(162, $0010, $1080, tLO, 'MilitaryRank', '1');
  Add(163, $0010, $1081, tLO, 'BranchOfService', '1');
  Add(164, $0010, $1090, tLO, 'MedicalRecordLocator', '1');
  Add(165, $0010, $2000, tLO, 'MedicalAlerts', '1-n');
  Add(166, $0010, $2110, tLO, 'ContrastAllergies', '1-n');
  Add(167, $0010, $2150, tLO, 'CountryOfResidence', '1');
  Add(168, $0010, $2152, tLO, 'RegionOfResidence', '1');
  Add(169, $0010, $2154, tSH, 'PatientTelephoneNumber', '1-n');
  Add(170, $0010, $2160, tSH, 'EthnicGroup', '1');
  Add(171, $0010, $2180, tSH, 'Occupation', '1');
  Add(172, $0010, $21A0, tCS, 'SmokingStatus', '1');
  Add(173, $0010, $21B0, tLT, 'AdditionalPatientHistory', '1');
  Add(174, $0010, $21C0, tUS, 'PregnancyStatus', '1');
  Add(175, $0010, $21D0, tDA, 'LastMenstrualDate', '1');
  Add(176, $0010, $21F0, tLO, 'PatientReligiousPreference', '1');
  Add(177, $0010, $4000, tLT, 'PatientComments', '1');
  Add(1506, $0011, $0020, tLO, 'TianiPatientID', '1');
  Add(178, $0018, $0000, tUL, 'AcquisitionGroupLength', '1');
  Add(179, $0018, $0010, tLO, 'ContrastBolusAgent', '1');
  Add(180, $0018, $0012, tSQ, 'ContrastBolusAgentSequence', '1');
  Add(181, $0018, $0014, tSQ, 'ContrastBolusAdministrationRouteSequence', '1');
  Add(182, $0018, $0015, tCS, 'BodyPartExamined', '1');
  Add(183, $0018, $0020, tCS, 'ScanningSequence', '1-n');
  Add(184, $0018, $0021, tCS, 'SequenceVariant', '1-n');
  Add(185, $0018, $0022, tCS, 'ScanOptions', '1-n');
  Add(186, $0018, $0023, tCS, 'MRAcquisitionType', '1');
  Add(187, $0018, $0024, tSH, 'SequenceName', '1');
  Add(188, $0018, $0025, tCS, 'AngioFlag', '1');
  Add(189, $0018, $0026, tSQ, 'InterventionDrugInformationSequence', '1');
  Add(190, $0018, $0027, tTM, 'InterventionDrugStopTime', '1');
  Add(191, $0018, $0028, tDS, 'InterventionDrugDose', '1');
  Add(192, $0018, $0029, tSQ, 'InterventionDrugCodeSequence', '1');
  Add(193, $0018, $002A, tSQ, 'AdditionalDrugSequence', '1');
  Add(194, $0018, $0030, tLO, 'Radionuclide', '1-n');
  Add(195, $0018, $0031, tLO, 'Radiopharmaceutical', '1-n');
  Add(196, $0018, $0032, tDS, 'EnergyWindowCenterline', '1');
  Add(197, $0018, $0033, tDS, 'EnergyWindowTotalWidth', '1-n');
  Add(198, $0018, $0034, tLO, 'InterventionDrugName', '1');
  Add(199, $0018, $0035, tTM, 'InterventionDrugStartTime', '1');
  Add(200, $0018, $0036, tSQ, 'InterventionalTherapySequence', '1');
  Add(201, $0018, $0037, tCS, 'TherapyType', '1');
  Add(202, $0018, $0038, tCS, 'InterventionalStatus', '1');
  Add(203, $0018, $0039, tCS, 'TherapyDescription', '1');
  Add(204, $0018, $0040, tIS, 'CineRate', '1');
  Add(205, $0018, $0050, tDS, 'SliceThickness', '1');
  Add(206, $0018, $0060, tDS, 'KVP', '1');
  Add(207, $0018, $0070, tIS, 'CountsAccumulated', '1');
  Add(208, $0018, $0071, tCS, 'AcquisitionTerminationCondition', '1');
  Add(209, $0018, $0072, tDS, 'EffectiveDuration', '1');
  Add(210, $0018, $0073, tCS, 'AcquisitionStartCondition', '1');
  Add(211, $0018, $0074, tIS, 'AcquisitionStartConditionData', '1');
  Add(212, $0018, $0075, tIS, 'AcquisitionTerminationConditionData', '1');
  Add(213, $0018, $0080, tDS, 'RepetitionTime', '1');
  Add(214, $0018, $0081, tDS, 'EchoTime', '1');
  Add(215, $0018, $0082, tDS, 'InversionTime', '1');
  Add(216, $0018, $0083, tDS, 'NumberOfAverages', '1');
  Add(217, $0018, $0084, tDS, 'ImagingFrequency', '1');
  Add(218, $0018, $0085, tSH, 'ImagedNucleus', '1');
  Add(219, $0018, $0086, tIS, 'EchoNumber', '1-n');
  Add(220, $0018, $0087, tDS, 'MagneticFieldStrength', '1');
  Add(221, $0018, $0088, tDS, 'SpacingBetweenSlices', '1');
  Add(222, $0018, $0089, tIS, 'NumberOfPhaseEncodingSteps', '1');
  Add(223, $0018, $0090, tDS, 'DataCollectionDiameter', '1');
  Add(224, $0018, $0091, tIS, 'EchoTrainLength', '1');
  Add(225, $0018, $0093, tDS, 'PercentSampling', '1');
  Add(226, $0018, $0094, tDS, 'PercentPhaseFieldOfView', '1');
  Add(227, $0018, $0095, tDS, 'PixelBandwidth', '1');
  Add(228, $0018, $1000, tLO, 'DeviceSerialNumber', '1');
  Add(229, $0018, $1004, tLO, 'PlateID', '1');
  Add(230, $0018, $1010, tLO, 'SecondaryCaptureDeviceID', '1');
  Add(1191, $0018, $1011, tLO, 'HardcopyCreationDeviceID', '1');
  Add(231, $0018, $1012, tDA, 'DateOfSecondaryCapture', '1');
  Add(232, $0018, $1014, tTM, 'TimeOfSecondaryCapture', '1');
  Add(233, $0018, $1016, tLO, 'SecondaryCaptureDeviceManufacturer', '1');
  Add(1192, $0018, $1017, tLO, 'HardcopyDeviceManufacturer', '1');
  Add(234, $0018, $1018, tLO, 'SecondaryCaptureDeviceManufacturerModelName', '1');
  Add(235, $0018, $1019, tLO, 'SecondaryCaptureDeviceSoftwareVersion', '1-n');
  Add(1193, $0018, $101A, tLO, 'HardcopyDeviceSoftwareVersion', '1-n');
  Add(1194, $0018, $101B, tLO, 'HardcopyDeviceManfuacturersModelName', '1');
  Add(236, $0018, $1020, tLO, 'SoftwareVersion', '1-n');
  Add(237, $0018, $1022, tSH, 'VideoImageFormatAcquired', '1');
  Add(238, $0018, $1023, tLO, 'DigitalImageFormatAcquired', '1');
  Add(239, $0018, $1030, tLO, 'ProtocolName', '1');
  Add(240, $0018, $1040, tLO, 'ContrastBolusRoute', '1');
  Add(241, $0018, $1041, tDS, 'ContrastBolusVolume', '1');
  Add(242, $0018, $1042, tTM, 'ContrastBolusStartTime', '1');
  Add(243, $0018, $1043, tTM, 'ContrastBolusStopTime', '1');
  Add(244, $0018, $1044, tDS, 'ContrastBolusTotalDose', '1');
  Add(245, $0018, $1045, tIS, 'SyringeCounts', '1');
  Add(246, $0018, $1046, tDS, 'ContrastFlowRates', '1-n');
  Add(247, $0018, $1047, tDS, 'ContrastFlowDurations', '1-n');
  Add(248, $0018, $1048, tCS, 'ContrastBolusIngredient', '1');
  Add(249, $0018, $1049, tDS, 'ContrastBolusIngredientConcentration', '1');
  Add(250, $0018, $1050, tDS, 'SpatialResolution', '1');
  Add(251, $0018, $1060, tDS, 'TriggerTime', '1');
  Add(252, $0018, $1061, tLO, 'TriggerSourceOrType', '1');
  Add(253, $0018, $1062, tIS, 'NominalInterval', '1');
  Add(254, $0018, $1063, tDS, 'FrameTime', '1');
  Add(255, $0018, $1064, tLO, 'FramingType', '1');
  Add(256, $0018, $1065, tDS, 'FrameTimeVector', '1-n');
  Add(257, $0018, $1066, tDS, 'FrameDelay', '1');
  Add(1460, $0018, $1067, tDS, 'ImageTriggerDelay', '1');
  Add(1461, $0018, $1068, tDS, 'MultiplexGroupTimeOffset', '1');
  Add(1462, $0018, $1069, tDS, 'TriggerTimeOffset', '1');
  Add(1463, $0018, $106A, tCS, 'SynchronizationTrigger', '1');
  Add(1464, $0018, $106C, tUS, 'SynchronizationChannel', '2');
  Add(1465, $0018, $106E, tUL, 'TriggerSamplePosition', '1');
  Add(258, $0018, $1070, tLO, 'RadionuclideRoute', '1-n');
  Add(259, $0018, $1071, tDS, 'RadionuclideVolume', '1-n');
  Add(260, $0018, $1072, tTM, 'RadiopharmaceuticalStartTime', '1');
  Add(261, $0018, $1073, tTM, 'RadiopharmaceuticalStopTime', '1');
  Add(262, $0018, $1074, tDS, 'RadionuclideTotalDose', '1');
  Add(263, $0018, $1075, tDS, 'RadionuclideHalfLife', '1');
  Add(264, $0018, $1076, tDS, 'RadionuclidePositronFraction', '1');
  Add(265, $0018, $1077, tDS, 'RadiopharmaceuticalSpecificActivity', '1');
  Add(266, $0018, $1080, tCS, 'BeatRejectionFlag', '1');
  Add(267, $0018, $1081, tIS, 'LowRRValue', '1');
  Add(268, $0018, $1082, tIS, 'HighRRValue', '1');
  Add(269, $0018, $1083, tIS, 'IntervalsAcquired', '1');
  Add(270, $0018, $1084, tIS, 'IntervalsRejected', '1');
  Add(271, $0018, $1085, tLO, 'PVCRejection', '1');
  Add(272, $0018, $1086, tIS, 'SkipBeats', '1');
  Add(273, $0018, $1088, tIS, 'HeartRate', '1');
  Add(274, $0018, $1090, tIS, 'CardiacNumberOfImages', '1');
  Add(275, $0018, $1094, tIS, 'TriggerWindow', '1');
  Add(276, $0018, $1100, tDS, 'ReconstructionDiameter', '1');
  Add(277, $0018, $1110, tDS, 'DistanceSourceToDetector', '1');
  Add(278, $0018, $1111, tDS, 'DistanceSourceToPatient', '1');
  Add(279, $0018, $1114, tDS, 'EstimatedRadiographicMagnificationFactor', '1');
  Add(280, $0018, $1120, tDS, 'GantryDetectorTilt', '1');
  Add(281, $0018, $1121, tDS, 'GantryDetectorSlew', '1');
  Add(282, $0018, $1130, tDS, 'TableHeight', '1');
  Add(283, $0018, $1131, tDS, 'TableTraverse', '1');
  Add(284, $0018, $1134, tCS, 'TableMotion', '1');
  Add(285, $0018, $1135, tDS, 'TableVerticalIncrement', '1-n');
  Add(286, $0018, $1136, tDS, 'TableLateralIncrement', '1-n');
  Add(287, $0018, $1137, tDS, 'TableLongitudinalIncrement', '1-n');
  Add(288, $0018, $1138, tDS, 'TableAngle', '1');
  Add(1261, $0018, $113A, tCS, 'TableType', '1');
  Add(289, $0018, $1140, tCS, 'RotationDirection', '1');
  Add(290, $0018, $1141, tDS, 'AngularPosition', '1');
  Add(291, $0018, $1142, tDS, 'RadialPosition', '1-n');
  Add(292, $0018, $1143, tDS, 'ScanArc', '1');
  Add(293, $0018, $1144, tDS, 'AngularStep', '1');
  Add(294, $0018, $1145, tDS, 'CenterOfRotationOffset', '1');
  Add(295, $0018, $1146, tDS, 'RotationOffset', '1-n');
  Add(296, $0018, $1147, tCS, 'FieldOfViewShape', '1');
  Add(297, $0018, $1149, tIS, 'FieldOfViewDimension', '1-2');
  Add(298, $0018, $1150, tIS, 'ExposureTime', '1');
  Add(299, $0018, $1151, tIS, 'XRayTubeCurrent', '1');
  Add(300, $0018, $1152, tIS, 'Exposure', '1');
  Add(1195, $0018, $1153, tIS, 'ExposureinuAs', '1');
  Add(301, $0018, $1154, tDS, 'AveragePulseWidth', '1');
  Add(302, $0018, $1155, tCS, 'RadiationSetting', '1');
  Add(1262, $0018, $1156, tCS, 'RectificationType', '1');
  Add(303, $0018, $115A, tCS, 'RadiationMode', '1');
  Add(304, $0018, $115E, tDS, 'ImageAreaDoseProduct', '1');
  Add(305, $0018, $1160, tSH, 'FilterType', '1');
  Add(306, $0018, $1161, tLO, 'TypeOfFilters', '1-n');
  Add(307, $0018, $1162, tDS, 'IntensifierSize', '1');
  Add(308, $0018, $1164, tDS, 'ImagerPixelSpacing', '2');
  Add(309, $0018, $1166, tCS, 'Grid', '1');
  Add(310, $0018, $1170, tIS, 'GeneratorPower', '1');
  Add(311, $0018, $1180, tSH, 'CollimatorGridName', '1');
  Add(312, $0018, $1181, tCS, 'CollimatorType', '1');
  Add(313, $0018, $1182, tIS, 'FocalDistance', '1');
  Add(314, $0018, $1183, tDS, 'XFocusCenter', '1');
  Add(315, $0018, $1184, tDS, 'YFocusCenter', '1');
  Add(316, $0018, $1190, tDS, 'FocalSpot', '1-n');
  Add(1263, $0018, $1191, tCS, 'AnodeTargetMaterial', '1');
  Add(1264, $0018, $11A0, tDS, 'BodyPartThickness', '1');
  Add(1265, $0018, $11A2, tDS, 'CompressionForce', '1');
  Add(317, $0018, $1200, tDA, 'DateOfLastCalibration', '1-n');
  Add(318, $0018, $1201, tTM, 'TimeOfLastCalibration', '1-n');
  Add(319, $0018, $1210, tSH, 'ConvolutionKernel', '1-n');
  Add(320, $0018, $1242, tIS, 'ActualFrameDuration', '1');
  Add(321, $0018, $1243, tIS, 'CountRate', '1');
  Add(322, $0018, $1244, tUS, 'PreferredPlaybackSequencing', '1');
  Add(323, $0018, $1250, tSH, 'ReceivingCoil', '1');
  Add(324, $0018, $1251, tSH, 'TransmittingCoil', '1');
  Add(325, $0018, $1260, tSH, 'PlateType', '1');
  Add(326, $0018, $1261, tLO, 'PhosphorType', '1');
  Add(327, $0018, $1300, tIS, 'ScanVelocity', '1');
  Add(328, $0018, $1301, tCS, 'WholeBodyTechnique', '1-n');
  Add(329, $0018, $1302, tIS, 'ScanLength', '1');
  Add(330, $0018, $1310, tUS, 'AcquisitionMatrix', '4');
  Add(331, $0018, $1312, tCS, 'PhaseEncodingDirection', '1');
  Add(332, $0018, $1314, tDS, 'FlipAngle', '1');
  Add(333, $0018, $1315, tCS, 'VariableFlipAngleFlag', '1');
  Add(334, $0018, $1316, tDS, 'SAR', '1');
  Add(335, $0018, $1318, tDS, 'dBdt', '1');
  Add(336, $0018, $1400, tLO, 'AcquisitionDeviceProcessingDescription', '1');
  Add(337, $0018, $1401, tLO, 'AcquisitionDeviceProcessingCode', '1');
  Add(338, $0018, $1402, tCS, 'CassetteOrientation', '1');
  Add(339, $0018, $1403, tCS, 'CassetteSize', '1');
  Add(340, $0018, $1404, tUS, 'ExposuresOnPlate', '1');
  Add(341, $0018, $1405, tIS, 'RelativeXrayExposure', '1');
  Add(1196, $0018, $1450, tCS, 'ColumnAngulation', '1');
  Add(342, $0018, $1460, tDS, 'TomoLayerHeight', '1');
  Add(343, $0018, $1470, tDS, 'TomoAngle', '1');
  Add(344, $0018, $1480, tDS, 'TomoTime', '1');
  Add(1266, $0018, $1490, tCS, 'TomoType', '1');
  Add(1267, $0018, $1491, tCS, 'TomoClass', '1');
  Add(1268, $0018, $1495, tIS, 'NumberofTomosynthesisSourceImages', '1');
  Add(345, $0018, $1500, tCS, 'PositionerMotion', '1');
  Add(1269, $0018, $1508, tCS, 'PositionerType', '1');
  Add(346, $0018, $1510, tDS, 'PositionerPrimaryAngle', '1');
  Add(347, $0018, $1511, tDS, 'PositionerSecondaryAngle', '1');
  Add(348, $0018, $1520, tDS, 'PositionerPrimaryAngleIncrement', '1-n');
  Add(349, $0018, $1521, tDS, 'PositionerSecondaryAngleIncrement', '1-n');
  Add(350, $0018, $1530, tDS, 'DetectorPrimaryAngle', '1');
  Add(351, $0018, $1531, tDS, 'DetectorSecondaryAngle', '1');
  Add(352, $0018, $1600, tCS, 'ShutterShape', '1-3');
  Add(353, $0018, $1602, tIS, 'ShutterLeftVerticalEdge', '1');
  Add(354, $0018, $1604, tIS, 'ShutterRightVerticalEdge', '1');
  Add(355, $0018, $1606, tIS, 'ShutterUpperHorizontalEdge', '1');
  Add(356, $0018, $1608, tIS, 'ShutterLowerHorizontalEdge', '1');
  Add(357, $0018, $1610, tIS, 'CenterOfCircularShutter', '2');
  Add(358, $0018, $1612, tIS, 'RadiusOfCircularShutter', '1');
  Add(359, $0018, $1620, tIS, 'VerticesOfThePolygonalShutter', '2-2n');
  Add(1377, $0018, $1622, tUS, 'ShutterPresentationValue', '1');
  Add(1378, $0018, $1623, tUS, 'ShutterOverlayGroup', '1');
  Add(360, $0018, $1700, tCS, 'CollimatorShape', '1-3');
  Add(361, $0018, $1702, tIS, 'CollimatorLeftVerticalEdge', '1');
  Add(362, $0018, $1704, tIS, 'CollimatorRightVerticalEdge', '1');
  Add(363, $0018, $1706, tIS, 'CollimatorUpperHorizontalEdge', '1');
  Add(364, $0018, $1708, tIS, 'CollimatorLowerHorizontalEdge', '1');
  Add(365, $0018, $1710, tIS, 'CenterOfCircularCollimator', '2');
  Add(366, $0018, $1712, tIS, 'RadiusOfCircularCollimator', '1');
  Add(367, $0018, $1720, tIS, 'VerticesOfThePolygonalCollimator', '2-2n');
  Add(1466, $0018, $1800, tCS, 'AcquisitionTimeSynchronized', '1');
  Add(1468, $0018, $1801, tSH, 'TimeSource', '1');
  Add(1467, $0018, $1802, tCS, 'TimeDistributionProtocol', '1');
  Add(368, $0018, $5000, tSH, 'OutputPower', '1-n');
  Add(369, $0018, $5010, tLO, 'TransducerData', '3');
  Add(370, $0018, $5012, tDS, 'FocusDepth', '1');
  Add(371, $0018, $5020, tLO, 'PreprocessingFunction', '1');
  Add(372, $0018, $5021, tLO, 'PostprocessingFunction', '1');
  Add(373, $0018, $5022, tDS, 'MechanicalIndex', '1');
  Add(374, $0018, $5024, tDS, 'BoneThermalIndex', '1');
  Add(375, $0018, $5026, tDS, 'CranialThermalIndex', '1');
  Add(376, $0018, $5027, tDS, 'SoftTissueThermalIndex', '1');
  Add(377, $0018, $5028, tDS, 'SoftTissueFocusThermalIndex', '1');
  Add(378, $0018, $5029, tDS, 'SoftTissueSurfaceThermalIndex', '1');
  Add(379, $0018, $5050, tIS, 'DepthOfScanField', '1');
  Add(380, $0018, $5100, tCS, 'PatientPosition', '1');
  Add(381, $0018, $5101, tCS, 'ViewPosition', '1');
  Add(1270, $0018, $5104, tSQ, 'ProjectionEponymousNameCodeSequence', '1');
  Add(382, $0018, $5210, tDS, 'ImageTransformationMatrix', '6');
  Add(383, $0018, $5212, tDS, 'ImageTranslationVector', '3');
  Add(384, $0018, $6000, tDS, 'Sensitivity', '1');
  Add(385, $0018, $6011, tSQ, 'SequenceOfUltrasoundRegions', '1');
  Add(386, $0018, $6012, tUS, 'RegionSpatialFormat', '1');
  Add(387, $0018, $6014, tUS, 'RegionDataType', '1');
  Add(388, $0018, $6016, tUL, 'RegionFlags', '1');
  Add(389, $0018, $6018, tUL, 'RegionLocationMinX0', '1');
  Add(390, $0018, $601A, tUL, 'RegionLocationMinY0', '1');
  Add(391, $0018, $601C, tUL, 'RegionLocationMaxX1', '1');
  Add(392, $0018, $601E, tUL, 'RegionLocationMaxY1', '1');
  Add(393, $0018, $6020, tSL, 'ReferencePixelX0', '1');
  Add(394, $0018, $6022, tSL, 'ReferencePixelY0', '1');
  Add(395, $0018, $6024, tUS, 'PhysicalUnitsXDirection', '1');
  Add(396, $0018, $6026, tUS, 'PhysicalUnitsYDirection', '1');
  Add(397, $0018, $6028, tFD, 'ReferencePixelPhysicalValueX', '1');
  Add(398, $0018, $602A, tFD, 'ReferencePixelPhysicalValueY', '1');
  Add(399, $0018, $602C, tFD, 'PhysicalDeltaX', '1');
  Add(400, $0018, $602E, tFD, 'PhysicalDeltaY', '1');
  Add(401, $0018, $6030, tUL, 'TransducerFrequency', '1');
  Add(402, $0018, $6031, tCS, 'TransducerType', '1');
  Add(403, $0018, $6032, tUL, 'PulseRepetitionFrequency', '1');
  Add(404, $0018, $6034, tFD, 'DopplerCorrectionAngle', '1');
  Add(405, $0018, $6036, tFD, 'SteeringAngle', '1');
  Add(406, $0018, $6038, tUL, 'DopplerSampleVolumeXPosition', '1');
  Add(407, $0018, $603A, tUL, 'DopplerSampleVolumeYPosition', '1');
  Add(408, $0018, $603C, tUL, 'TMLinePositionX0', '1');
  Add(409, $0018, $603E, tUL, 'TMLinePositionY0', '1');
  Add(410, $0018, $6040, tUL, 'TMLinePositionX1', '1');
  Add(411, $0018, $6042, tUL, 'TMLinePositionY1', '1');
  Add(412, $0018, $6044, tUS, 'PixelComponentOrganization', '1');
  Add(413, $0018, $6046, tUL, 'PixelComponentMask', '1');
  Add(414, $0018, $6048, tUL, 'PixelComponentRangeStart', '1');
  Add(415, $0018, $604A, tUL, 'PixelComponentRangeStop', '1');
  Add(416, $0018, $604C, tUS, 'PixelComponentPhysicalUnits', '1');
  Add(417, $0018, $604E, tUS, 'PixelComponentDataType', '1');
  Add(418, $0018, $6050, tUL, 'NumberOfTableBreakPoints', '1');
  Add(419, $0018, $6052, tUL, 'TableOfXBreakPoints', '1-n');
  Add(420, $0018, $6054, tFD, 'TableOfYBreakPoints', '1-n');
  Add(421, $0018, $6056, tUL, 'NumberOfTableEntries', '1');
  Add(422, $0018, $6058, tUL, 'TableOfPixelValues', '1-n');
  Add(423, $0018, $605A, tFL, 'TableOfParameterValues', '1-n');
  Add(1271, $0018, $7000, tCS, 'DetectorConditionsNominalFlag', '1');
  Add(1272, $0018, $7001, tDS, 'DetectorTemperature', '1');
  Add(1273, $0018, $7004, tCS, 'DetectorType', '1');
  Add(1274, $0018, $7005, tCS, 'DetectorConfiguration', '1');
  Add(1275, $0018, $7006, tLT, 'DetectorDescription', '1');
  Add(1276, $0018, $7008, tLT, 'DetectorMode', '1');
  Add(1277, $0018, $700A, tSH, 'DetectorID', '1');
  Add(1278, $0018, $700C, tDA, 'DateofLastDetectorCalibration', '1');
  Add(1279, $0018, $700E, tTM, 'TimeofLastDetectorCalibration', '1');
  Add(1280, $0018, $7010, tIS, 'ExposuresOnDetectorSinceLastCalibration', '1');
  Add(1281, $0018, $7011, tIS, 'ExposuresOnDetectorSinceManufactured', '1');
  Add(1282, $0018, $7012, tDS, 'DetectorTimeSinceLastExposure', '1');
  Add(1283, $0018, $7014, tDS, 'DetectorActiveTime', '1');
  Add(1284, $0018, $7016, tDS, 'DetectorActivationOffsetFromExposure', '1');
  Add(1285, $0018, $701A, tDS, 'DetectorBinning', '2');
  Add(1286, $0018, $7020, tDS, 'DetectorElementPhysicalSize', '2');
  Add(1287, $0018, $7022, tDS, 'DetectorElementSpacing', '2');
  Add(1288, $0018, $7024, tCS, 'DetectorActiveShape', '1');
  Add(1289, $0018, $7026, tDS, 'DetectorActiveDimensions', '1-2');
  Add(1290, $0018, $7028, tDS, 'DetectorActiveOrigin', '2');
  Add(1291, $0018, $7030, tDS, 'FieldofViewOrigin', '2');
  Add(1292, $0018, $7032, tDS, 'FieldofViewRotation', '1');
  Add(1293, $0018, $7034, tCS, 'FieldofViewHorizontalFlip', '1');
  Add(1294, $0018, $7040, tLT, 'GridAbsorbingMaterial', '1');
  Add(1295, $0018, $7041, tLT, 'GridSpacingMaterial', '1');
  Add(1296, $0018, $7042, tDS, 'GridThickness', '1');
  Add(1297, $0018, $7044, tDS, 'GridPitch', '1');
  Add(1298, $0018, $7046, tIS, 'GridAspectRatio', '2');
  Add(1299, $0018, $7048, tDS, 'GridPeriod', '1');
  Add(1300, $0018, $704C, tDS, 'GridFocalDistance', '1');
  Add(1301, $0018, $7050, tLT, 'FilterMaterial', '1-n');
  Add(1302, $0018, $7052, tDS, 'FilterThicknessMinimum', '1-n');
  Add(1303, $0018, $7054, tDS, 'FilterThicknessMaximum', '1-n');
  Add(1304, $0018, $7060, tCS, 'ExposureControlMode', '1');
  Add(1305, $0018, $7062, tLT, 'ExposureControlModeDescription', '1');
  Add(1306, $0018, $7064, tCS, 'ExposureStatus', '1');
  Add(1307, $0018, $7065, tDS, 'PhototimerSetting', '1');
  Add(424, $0020, $0000, tUL, 'ImageGroupLength', '1');
  Add(425, $0020, $000D, tUI, 'StudyInstanceUID', '1');  
  Add(426, $0020, $000E, tUI, 'SeriesInstanceUID', '1');
  Add(427, $0020, $0010, tSH, 'StudyID', '1');
  Add(428, $0020, $0011, tIS, 'SeriesNumber', '1');
  Add(429, $0020, $0012, tIS, 'AcquisitionNumber', '1');
  Add(430, $0020, $0013, tIS, 'InstanceNumber', '1');
  Add(431, $0020, $0014, tIS, 'IsotopeNumber', '1');
  Add(432, $0020, $0015, tIS, 'PhaseNumber', '1');
  Add(433, $0020, $0016, tIS, 'IntervalNumber', '1');
  Add(434, $0020, $0017, tIS, 'TimeSlotNumber', '1');
  Add(435, $0020, $0018, tIS, 'AngleNumber', '1');
  Add(1346, $0020, $0019, tIS, 'ItemNumber', '1');
  Add(436, $0020, $0020, tCS, 'PatientOrientation', '2');
  Add(437, $0020, $0022, tIS, 'OverlayNumber', '1');
  Add(438, $0020, $0024, tIS, 'CurveNumber', '1');
  Add(439, $0020, $0026, tIS, 'LUTNumber', '1');
  Add(440, $0020, $0032, tDS, 'ImagePositionPatient', '3');
  Add(441, $0020, $0037, tDS, 'ImageOrientationPatient', '6');
  Add(442, $0020, $0052, tUI, 'FrameOfReferenceUID', '1');
  Add(443, $0020, $0060, tCS, 'Laterality', '1');
  Add(1308, $0020, $0062, tCS, 'ImageLaterality', '1');
  Add(444, $0020, $0100, tIS, 'TemporalPositionIdentifier', '1');
  Add(445, $0020, $0105, tIS, 'NumberOfTemporalPositions', '1');
  Add(446, $0020, $0110, tDS, 'TemporalResolution', '1');
  Add(1469, $0020, $0200, tUI, 'SynchronizationFrameofReferenceUID', '1');
  Add(447, $0020, $1000, tIS, 'SeriesInStudy', '1');
  Add(448, $0020, $1002, tIS, 'ImagesInAcquisition', '1');
  Add(449, $0020, $1004, tIS, 'AcquisitionsInStudy', '1');
  Add(450, $0020, $1040, tLO, 'PositionReferenceIndicator', '1');
  Add(451, $0020, $1041, tDS, 'SliceLocation', '1');
  Add(452, $0020, $1070, tIS, 'OtherStudyNumbers', '1-n');
  Add(453, $0020, $1200, tIS, 'NumberOfPatientRelatedStudies', '1');
  Add(454, $0020, $1202, tIS, 'NumberOfPatientRelatedSeries', '1');
  Add(455, $0020, $1204, tIS, 'NumberOfPatientRelatedImages', '1');
  Add(456, $0020, $1206, tIS, 'NumberOfStudyRelatedSeries', '1');
  Add(457, $0020, $1208, tIS, 'NumberOfStudyRelatedImages', '1');
  Add(458, $0020, $1209, tIS, 'NumberOfSeriesRelatedImages', '1');
  Add(459, $0020, $4000, tLT, 'ImageComments', '1');
  Add(1507, $0021, $000D, tLO, 'TianiStudyInstanceUID', '1');
  Add(1508, $0021, $000E, tLO, 'TianiSeriesInstanceUID', '1');
  Add(460, $0028, $0000, tUL, 'ImagePresentationGroupLength', '1');
  Add(461, $0028, $0002, tUS, 'SamplesPerPixel', '1');
  Add(462, $0028, $0004, tCS, 'PhotometricInterpretation', '1');
  Add(463, $0028, $0006, tUS, 'PlanarConfiguration', '1');
  Add(464, $0028, $0008, tIS, 'NumberOfFrames', '1');
  Add(465, $0028, $0009, tAT, 'FrameIncrementPointer', '1-n');
  Add(466, $0028, $0010, tUS, 'Rows', '1');
  Add(467, $0028, $0011, tUS, 'Columns', '1');
  Add(468, $0028, $0012, tUS, 'Planes', '1');
  Add(469, $0028, $0014, tUS, 'UltrasoundColorDataPresent', '1');
  Add(470, $0028, $0030, tDS, 'PixelSpacing', '2');
  Add(471, $0028, $0031, tDS, 'ZoomFactor', '2');
  Add(472, $0028, $0032, tDS, 'ZoomCenter', '2');
  Add(473, $0028, $0034, tIS, 'PixelAspectRatio', '2');
  Add(474, $0028, $0051, tCS, 'CorrectedImage', '1');

  Add(475, $0028, $0100, tUS, 'BitsAllocated', '1');
  Add(476, $0028, $0101, tUS, 'BitsStored', '1');
  Add(477, $0028, $0102, tUS, 'HighBit', '1');
  Add(478, $0028, $0103, tUS, 'PixelRepresentation', '1');
  Add(479, $0028, $0106, tUS_SS, 'SmallestImagePixelValue', '1');
  Add(480, $0028, $0107, tUS_SS, 'LargestImagePixelValue', '1');
  Add(481, $0028, $0108, tUS_SS, 'SmallestPixelValueInSeries', '1');
  Add(482, $0028, $0109, tUS_SS, 'LargestPixelValueInSeries', '1');
  Add(483, $0028, $0110, tUS_SS, 'SmallestImagePixelValueInPlane', '1');
  Add(484, $0028, $0111, tUS_SS, 'LargestImagePixelValueInPlane', '1');
  Add(485, $0028, $0120, tUS_SS, 'PixelPaddingValue', '1');
  Add(1309, $0028, $0300, tCS, 'QualityControlImage', '1');
  Add(1310, $0028, $0301, tCS, 'BurnedInAnnotation', '1');
  Add(486, $0028, $1040, tCS, 'PixelIntensityRelationship', '1');
  Add(1311, $0028, $1041, tSS, 'PixelIntensityRelationshipSign', '1');
  Add(487, $0028, $1050, tDS, 'WindowCenter', '1-n');
  Add(488, $0028, $1051, tDS, 'WindowWidth', '1-n');
  Add(489, $0028, $1052, tDS, 'RescaleIntercept', '1');
  Add(490, $0028, $1053, tDS, 'RescaleSlope', '1');
  Add(491, $0028, $1054, tLO, 'RescaleType', '1');
  Add(492, $0028, $1055, tLO, 'WindowCenterWidthExplanation', '1-n');
  Add(493, $0028, $1090, tCS, 'RecommendedViewingMode', '1');
  Add(494, $0028, $1101, tUS_SS, 'RedPaletteColorLookupTableDescriptor', '3');
  Add(495, $0028, $1102, tUS_SS, 'GreenPaletteColorLookupTableDescriptor', '3');
  Add(496, $0028, $1103, tUS_SS, 'BluePaletteColorLookupTableDescriptor', '3');
  Add(497, $0028, $1199, tUI, 'PaletteColorLookupTableUID', '1');
  Add(498, $0028, $1201, tOW, 'RedPaletteColorLookupTableData', '1');
  Add(499, $0028, $1202, tOW, 'GreenPaletteColorLookupTableData', '1');
  Add(500, $0028, $1203, tOW, 'BluePaletteColorLookupTableData', '1');
  Add(501, $0028, $1221, tOW, 'SegmentedRedPaletteColorLookupTableData', '1');
  Add(502, $0028, $1222, tOW, 'SegmentedGreenPaletteColorLookupTableData', '1');
  Add(503, $0028, $1223, tOW, 'SegmentedBluePaletteColorLookupTableData', '1');
  Add(1312, $0028, $1300, tCS, 'ImplantPresent', '1');
  Add(504, $0028, $2110, tCS, 'LossyImageCompression', '1');
  Add(1313, $0028, $2112, tDS, 'LossyImageCompressionRatio', '1-n');
  Add(505, $0028, $3000, tSQ, 'ModalityLUTSequence', '1');
  Add(506, $0028, $3002, tUS_SS, 'LUTDescriptor', '3');
  Add(507, $0028, $3003, tLO, 'LUTExplanation', '1');
  Add(508, $0028, $3004, tLO, 'ModalityLUTType', '1');
  Add(509, $0028, $3006, tUS, 'LUTData', '1-n');
  Add(510, $0028, $3010, tSQ, 'VOILUTSequence', '1');
  Add(1408, $0028, $3110, tSQ, 'SoftcopyVOILUTSequence', '1');
  Add(511, $0028, $5000, tSQ, 'BiPlaneAcquisitionSequence', '1');
  Add(512, $0028, $6010, tUS, 'RepresentativeFrameNumber', '1');
  Add(513, $0028, $6020, tUS, 'FrameNumbersOfInterestFOI', '1-n');
  Add(514, $0028, $6022, tLO, 'FrameOfInterestDescription', '1-n');
  AddAllData1;
end;

procedure TDDictArray.AddAllData1;
begin
  Add(515, $0028, $6030, tUS, 'MaskPointers', '1-n');
  Add(516, $0028, $6040, tUS, 'RWavePointer', '1-n');
  Add(517, $0028, $6100, tSQ, 'MaskSubtractionSequence', '1');
  Add(518, $0028, $6101, tCS, 'MaskOperation', '1');
  Add(519, $0028, $6102, tUS, 'ApplicableFrameRange', '2-2n');
  Add(520, $0028, $6110, tUS, 'MaskFrameNumbers', '1-n');
  Add(521, $0028, $6112, tUS, 'ContrastFrameAveraging', '1');
  Add(522, $0028, $6114, tFL, 'MaskSubPixelShift', '2');
  Add(523, $0028, $6120, tSS, 'TIDOffset', '1');
  Add(524, $0028, $6190, tST, 'MaskOperationExplanation', '1');
  Add(1512, $0029, $1050, tDS, 'TianiWindowCenter', '1');
  Add(1513, $0029, $1051, tDS, 'TianiWindowWidth', '1');
  Add(525, $0032, $0000, tUL, 'StudyGroupLength', '1');
  Add(526, $0032, $000A, tCS, 'StudyStatusID', '1');
  Add(527, $0032, $000C, tCS, 'StudyPriorityID', '1');
  Add(528, $0032, $0012, tLO, 'StudyIDIssuer', '1');
  Add(529, $0032, $0032, tDA, 'StudyVerifiedDate', '1');
  Add(530, $0032, $0033, tTM, 'StudyVerifiedTime', '1');
  Add(531, $0032, $0034, tDA, 'StudyReadDate', '1');
  Add(532, $0032, $0035, tTM, 'StudyReadTime', '1');
  Add(533, $0032, $1000, tDA, 'ScheduledStudyStartDate', '1');
  Add(534, $0032, $1001, tTM, 'ScheduledStudyStartTime', '1');
  Add(535, $0032, $1010, tDA, 'ScheduledStudyStopDate', '1');
  Add(536, $0032, $1011, tTM, 'ScheduledStudyStopTime', '1');
  Add(537, $0032, $1020, tLO, 'ScheduledStudyLocation', '1');
  Add(538, $0032, $1021, tAE, 'ScheduledStudyLocationAETitle', '1-n');
  Add(539, $0032, $1030, tLO, 'ReasonForStudy', '1');
  Add(540, $0032, $1032, tPN, 'RequestingPhysician', '1');
  Add(541, $0032, $1033, tLO, 'RequestingService', '1');
  Add(542, $0032, $1040, tDA, 'StudyArrivalDate', '1');
  Add(543, $0032, $1041, tTM, 'StudyArrivalTime', '1');
  Add(544, $0032, $1050, tDA, 'StudyCompletionDate', '1');
  Add(545, $0032, $1051, tTM, 'StudyCompletionTime', '1');
  Add(546, $0032, $1055, tCS, 'StudyComponentStatusID', '1');
  Add(547, $0032, $1060, tLO, 'RequestedProcedureDescription', '1');
  Add(548, $0032, $1064, tSQ, 'RequestedProcedureCodeSequence', '1');
  Add(549, $0032, $1070, tLO, 'RequestedContrastAgent', '1');
  Add(550, $0032, $4000, tLT, 'StudyComments', '1');
  Add(551, $0038, $0000, tUL, 'VisitGroupLength', '1');
  Add(552, $0038, $0004, tSQ, 'ReferencedPatientAliasSequence', '1');
  Add(553, $0038, $0008, tCS, 'VisitStatusID', '1');
  Add(554, $0038, $0010, tLO, 'AdmissionID', '1');
  Add(555, $0038, $0011, tLO, 'IssuerOfAdmissionID', '1');
  Add(556, $0038, $0016, tLO, 'RouteOfAdmissions', '1');
  Add(557, $0038, $001A, tDA, 'ScheduledAdmissionDate', '1');
  Add(558, $0038, $001B, tTM, 'ScheduledAdmissionTime', '1');
  Add(559, $0038, $001C, tDA, 'ScheduledDischargeDate', '1');
  Add(560, $0038, $001D, tTM, 'ScheduledDischargeTime', '1');
  Add(561, $0038, $001E, tLO, 'ScheduledPatientInstitutionResidence', '1');
  Add(562, $0038, $0020, tDA, 'AdmittingDate', '1');
  Add(563, $0038, $0021, tTM, 'AdmittingTime', '1');
  Add(564, $0038, $0030, tDA, 'DischargeDate', '1');
  Add(565, $0038, $0032, tTM, 'DischargeTime', '1');
  Add(566, $0038, $0040, tLO, 'DischargeDiagnosisDescription', '1');
  Add(567, $0038, $0044, tSQ, 'DischargeDiagnosisCodeSequence', '1');
  Add(568, $0038, $0050, tLO, 'SpecialNeeds', '1');
  Add(569, $0038, $0300, tLO, 'CurrentPatientLocation', '1');
  Add(570, $0038, $0400, tLO, 'PatientInstitutionResidence', '1');
  Add(571, $0038, $0500, tLO, 'PatientState', '1');
  Add(572, $0038, $4000, tLT, 'VisitComments', '1');
  Add(1470, $003A, $0004, tCS, 'WaveformOriginality', '1');
  Add(1471, $003A, $0005, tUS, 'NumberofWaveformChannels', '1');
  Add(1472, $003A, $0010, tUL, 'NumberofWaveformSamples', '1');
  Add(1473, $003A, $001A, tDS, 'SamplingFrequency', '1');
  Add(1474, $003A, $0020, tSH, 'MultiplexGroupLabel', '1');
  Add(1475, $003A, $0200, tSQ, 'ChannelDefinitionSequence', '1');
  Add(1476, $003A, $0202, tIS, 'WaveformChannelNumber', '1');
  Add(1477, $003A, $0203, tSH, 'ChannelLabel', '1');
  Add(1478, $003A, $0205, tCS, 'ChannelStatus', '1-n');
  Add(1479, $003A, $0208, tSQ, 'ChannelSourceSequence', '1');
  Add(1480, $003A, $0209, tSQ, 'ChannelSourceModifiersSequence', '1');
  Add(1481, $003A, $020A, tSQ, 'SourceWaveformSequence', '1');
  Add(1482, $003A, $020C, tLO, 'ChannelDerivationDescription', '1');
  Add(1483, $003A, $0210, tDS, 'ChannelSensitivity', '1');
  Add(1484, $003A, $0211, tSQ, 'ChannelSensitivityUnitsSequence', '1');
  Add(1485, $003A, $0212, tDS, 'ChannelSensitivityCorrectionFactor', '1');
  Add(1486, $003A, $0213, tDS, 'ChannelBaseline', '1');
  Add(1487, $003A, $0214, tDS, 'ChannelTimeSkew', '1');
  Add(1488, $003A, $0215, tDS, 'ChannelSampleSkew', '1');
  Add(1489, $003A, $0218, tDS, 'ChannelOffset', '1');
  Add(1490, $003A, $021A, tUS, 'WaveformBitsStored', '1');
  Add(1491, $003A, $0220, tDS, 'FilterLowFrequency', '1');
  Add(1492, $003A, $0221, tDS, 'FilterHighFrequency', '1');
  Add(1493, $003A, $0222, tDS, 'NotchFilterFrequency', '1');
  Add(1494, $003A, $0223, tDS, 'NotchFilterBandwidth', '1');
  Add(573, $0040, $0000, tUL, 'ModalityWorklistGroupLength', '1');
  Add(574, $0040, $0001, tAE, 'ScheduledStationAETitle', '1-n');
  Add(575, $0040, $0002, tDA, 'ScheduledProcedureStepStartDate', '1');
  Add(576, $0040, $0003, tTM, 'ScheduledProcedureStepStartTime', '1');
  Add(577, $0040, $0004, tDA, 'ScheduledProcedureStepEndDate', '1');
  Add(578, $0040, $0005, tTM, 'ScheduledProcedureStepEndTime', '1');
  Add(579, $0040, $0006, tPN, 'ScheduledPerformingPhysiciansName', '1');
  Add(580, $0040, $0007, tLO, 'ScheduledProcedureStepDescription', '1');
  Add(581, $0040, $0008, tSQ, 'ScheduledActionItemCodeSequence', '1');
  Add(582, $0040, $0009, tSH, 'ScheduledProcedureStepID', '1');
  Add(583, $0040, $0010, tSH, 'ScheduledStationName', '1-n');
  Add(584, $0040, $0011, tSH, 'ScheduledProcedureStepLocation', '1');
  Add(585, $0040, $0012, tLO, 'PreMedication', '1');
  Add(586, $0040, $0020, tCS, 'ScheduledProcedureStepStatus', '1');
  Add(587, $0040, $0100, tSQ, 'ScheduledProcedureStepSequence', '1');
  Add(1197, $0040, $0220, tSQ, 'ReferencedStandaloneSOPInstanceSequence', '1');
  Add(1198, $0040, $0241, tAE, 'PerformedStationAETitle', '1');
  Add(1199, $0040, $0242, tSH, 'PerformedStationName', '1');
  Add(1200, $0040, $0243, tSH, 'PerformedLocation', '1');
  Add(1201, $0040, $0244, tDA, 'PerformedProcedureStepStartDate', '1');
  Add(1202, $0040, $0245, tTM, 'PerformedProcedureStepStartTime', '1');
  Add(1203, $0040, $0250, tDA, 'PerformedProcedureStepEndDate', '1');
  Add(1204, $0040, $0251, tTM, 'PerformedProcedureStepEndTime', '1');
  Add(1205, $0040, $0252, tCS, 'PerformedProcedureStepStatus', '1');
  Add(1206, $0040, $0253, tSH, 'PerformedProcedureStepID', '1');
  Add(1207, $0040, $0254, tLO, 'PerformedProcedureStepDescription', '1');
  Add(1208, $0040, $0255, tLO, 'PerformedProcedureTypeDescription', '1');
  Add(1209, $0040, $0260, tSQ, 'PerformedActionItemSequence', '1');
  Add(1210, $0040, $0270, tSQ, 'ScheduledStepAttributesSequence', '1');
  Add(1211, $0040, $0275, tSQ, 'RequestAttributesSequence', '1');
  Add(1212, $0040, $0280, tST, 'CommentsOnThePerformedProcedureSteps', '1');
  Add(1213, $0040, $0293, tSQ, 'QuantitySequence', '1');
  Add(1214, $0040, $0294, tDS, 'Quantity', '1');
  Add(1215, $0040, $0295, tSQ, 'MeasuringUnitsSequence', '1');
  Add(1216, $0040, $0296, tSQ, 'BillingItemSequence', '1');
  Add(1217, $0040, $0300, tUS, 'TotalTimeOfFluoroscopy', '1');
  Add(1218, $0040, $0301, tUS, 'TotalNumberOfExposures', '1');
  Add(1219, $0040, $0302, tUS, 'EntranceDose', '1');
  Add(1220, $0040, $0303, tUS, 'ExposedArea', '1-2');
  Add(1221, $0040, $0306, tDS, 'DistanceSourceToEntrance', '1');
  Add(1314, $0040, $0307, tDS, 'DistanceSourceToSupport', '1');
  Add(1222, $0040, $0310, tST, 'CommentsOnRadiationDose', '1');
  Add(1315, $0040, $0312, tDS, 'XRayOutput', '1');
  Add(1316, $0040, $0314, tDS, 'HalfValueLayer', '1');
  Add(1317, $0040, $0316, tDS, 'OrganDose', '1');
  Add(1318, $0040, $0318, tCS, 'OrganExposed', '1');
  Add(1223, $0040, $0320, tSQ, 'BillingProcedureStepSequence', '1');
  Add(1224, $0040, $0321, tSQ, 'FilmConsumptionSequence', '1');
  Add(1225, $0040, $0324, tSQ, 'BillingSuppliesAndDevicesSequence', '1');
  Add(1226, $0040, $0330, tSQ, 'ReferencedProcedureStepSequence', '1');
  Add(1227, $0040, $0340, tSQ, 'PerformedSeriesSequence', '1');
  Add(588, $0040, $0400, tLT, 'CommentsOnTheScheduledProcedureStep', '1');
  Add(1421, $0040, $050A, tSH, 'SpecimenAccessionNumber', '1');
  Add(1422, $0040, $0550, tSQ, 'SpecimenSequence', '1');
  Add(1423, $0040, $0551, tLO, 'SpecimenIdentifier', '1');
  Add(1319, $0040, $0555, tSQ, 'AcquisitionContextSequence', '1');
  Add(1320, $0040, $0556, tST, 'AcquisitionContextDescription', '1');
  Add(1424, $0040, $059A, tSQ, 'SpecimenTypeCodeSequence', '1');
  Add(1370, $0040, $06FA, tLO, 'SlideIdentifier', '1');
  Add(1371, $0040, $071A, tSQ, 'ImageCenterPointCoordinatesSequence', '1');
  Add(1372, $0040, $072A, tDS, 'XOffsetInSlideCoordinateSystem', '1');
  Add(1373, $0040, $073A, tDS, 'YOffsetInSlideCoordinateSystem', '1');
  Add(1374, $0040, $074A, tDS, 'ZOffsetInSlideCoordinateSystem', '1');
  Add(1375, $0040, $08D8, tSQ, 'PixelSpacingSequence', '1');
  Add(1376, $0040, $08DA, tSQ, 'CoordinateSystemAxisCodeSequence', '1');
  Add(1321, $0040, $08EA, tSQ, 'MeasurementUnitsCodeSequence', '1');
  Add(589, $0040, $1001, tSH, 'RequestedProcedureID', '1');
  Add(590, $0040, $1002, tLO, 'ReasonForTheRequestedProcedure', '1');
  Add(591, $0040, $1003, tSH, 'RequestedProcedurePriority', '1');
  Add(592, $0040, $1004, tLO, 'PatientTransportArrangements', '1');
  Add(593, $0040, $1005, tLO, 'RequestedProcedureLocation', '1');
  Add(594, $0040, $1006, tSH, 'PlacerOrderNumberProcedure', '1');
  Add(595, $0040, $1007, tSH, 'FillerOrderNumberProcedure', '1');
  Add(596, $0040, $1008, tLO, 'ConfidentialityCode', '1');
  Add(597, $0040, $1009, tSH, 'ReportingPriority', '1');
  Add(598, $0040, $1010, tPN, 'NamesOfIntendedRecipientsOfResults', '1-n');
  Add(599, $0040, $1400, tLT, 'RequestedProcedureComments', '1');
  Add(600, $0040, $2001, tLO, 'ReasonForTheImagingServiceRequest', '1');
  Add(601, $0040, $2004, tDA, 'IssueDateOfImagingServiceRequest', '1');
  Add(602, $0040, $2005, tTM, 'IssueTimeOfImagingServiceRequest', '1');
  Add(603, $0040, $2006, tSH, 'PlacerOrderNumberImagingServiceRequest', '1');
  Add(604, $0040, $2007, tSH, 'FillerOrderNumberImagingServiceRequest', '1');
  Add(605, $0040, $2008, tPN, 'OrderEnteredBy', '1');
  Add(606, $0040, $2009, tSH, 'OrderEnterersLocation', '1');
  Add(607, $0040, $2010, tSH, 'OrderCallbackPhoneNumber', '1');
  Add(1419, $0040, $2016, tLO, 'PlacerOrderNumber', '1');
  Add(1420, $0040, $2017, tLO, 'FillerOrderNumber', '1');
  Add(608, $0040, $2400, tLT, 'ImagingServiceRequestComments', '1');
  Add(609, $0040, $3001, tLO, 'ConfidentialityConstraintOnPatientData', '1');
  Add(1425, $0040, $A010, tCS, 'RelationshipType', '1');
  Add(1426, $0040, $A027, tLO, 'VerifyingOrganization', '1');
  Add(1427, $0040, $A030, tDT, 'VerificationDateTime', '1');
  Add(1428, $0040, $A032, tDT, 'ObservationDateTime', '1');
  Add(1429, $0040, $A040, tCS, 'ValueType', '1');
  Add(1322, $0040, $A043, tSQ, 'ConceptNameCodeSequence', '1');
  Add(1430, $0040, $A050, tCS, 'ContinuityOfContent', '1');
  Add(1431, $0040, $A073, tSQ, 'VerifyingObserverSequence', '1');
  Add(1432, $0040, $A075, tPN, 'VerifyingObserverName', '1');
  Add(1495, $0040, $A0B0, tUS, 'ReferencedWaveformChannels', '2-2n');
  Add(1434, $0040, $A120, tDT, 'DateTime', '1');
  Add(1323, $0040, $A121, tDA, 'Date', '1');
  Add(1324, $0040, $A122, tTM, 'Time', '1');
  Add(1325, $0040, $A123, tPN, 'PersonName', '1');
  Add(1435, $0040, $A124, tUI, 'UID', '1');
  Add(1436, $0040, $A130, tCS, 'TemporalRangeType', '1');
  Add(1437, $0040, $A132, tIS, 'ReferencedSamplePositions', '1-n');
  Add(1326, $0040, $A136, tUS, 'ReferencedFrameNumbers', '1-n');
  Add(1438, $0040, $A138, tDS, 'ReferencedTimeOffsets', '1-n');
  Add(1439, $0040, $A13A, tDT, 'ReferencedDatetime', '1-n');
  Add(1327, $0040, $A160, tUT, 'TextValue', '1');
  Add(1328, $0040, $A168, tSQ, 'ConceptCodeSequence', '1');
  Add(1496, $0040, $A180, tUS, 'AnnotationGroupNumber', '1');
  Add(1497, $0040, $A195, tSQ, 'ModifierCodeSequence', '1');
  Add(1440, $0040, $A300, tSQ, 'MeasuredValueSequence', '1');
  Add(1329, $0040, $A30A, tDS, 'NumericValue', '1-n');
  Add(1441, $0040, $A360, tSQ, 'PredecessorDocumentsSequence', '1');
  Add(1442, $0040, $A370, tSQ, 'ReferencedRequestSequence', '1');
  Add(1443, $0040, $A372, tSQ, 'PerformedProcedureCodeSequence', '1');
  Add(1444, $0040, $A375, tSQ, 'CurrentRequestedProcedureEvidenceSequence', '1');
  Add(1445, $0040, $A385, tSQ, 'PertinentOtherEvidenceSequence', '1');
  Add(1446, $0040, $A491, tCS, 'CompletionFlag', '1');
  Add(1447, $0040, $A492, tLO, 'CompletionFlagDescription', '1');
  Add(1448, $0040, $A493, tCS, 'VerificationFlag', '1');
  Add(1449, $0040, $A504, tSQ, 'ContentTemplateSequence', '1');
  Add(1450, $0040, $A525, tSQ, 'IdenticalDocumentsSequence', '1');
  Add(1451, $0040, $A730, tSQ, 'ContentSequence', '1');
  Add(1498, $0040, $B020, tSQ, 'AnnotationSequence', '1');
  Add(1452, $0040, $DB00, tCS, 'TemplateIdentifier', '1');
  Add(1453, $0040, $DB06, tDT, 'TemplateVersion', '1');
  Add(1454, $0040, $DB07, tDT, 'TemplateLocalVersion', '1');
  Add(1455, $0040, $DB0B, tCS, 'TemplateExtensionFlag', '1');
  Add(1456, $0040, $DB0C, tUI, 'TemplateExtensionOrganizationUID', '1');
  Add(1457, $0040, $DB0D, tUI, 'TemplateExtensionCreatorUID', '1');
  Add(1458, $0040, $DB73, tUL, 'ReferencedContentItemIdentifier', '1-n');
  Add(1228, $0050, $0000, tUL, 'XRayAngioDeviceGroupLength', '1');
  Add(610, $0050, $0004, tCS, 'CalibrationObject', '1');
  Add(611, $0050, $0010, tSQ, 'DeviceSequence', '1');
  Add(612, $0050, $0014, tDS, 'DeviceLength', '1');
  Add(613, $0050, $0016, tDS, 'DeviceDiameter', '1');
  Add(614, $0050, $0017, tCS, 'DeviceDiameterUnits', '1');
  Add(615, $0050, $0018, tDS, 'DeviceVolume', '1');
  Add(616, $0050, $0019, tDS, 'InterMarkerDistance', '1');
  Add(617, $0050, $0020, tLO, 'DeviceDescription', '1');
  Add(618, $0054, $0000, tUL, 'GroupLength', '1');
  Add(619, $0054, $0010, tUS, 'EnergyWindowVector', '1-n');
  Add(620, $0054, $0011, tUS, 'NumberOfEnergyWindows', '1');
  Add(621, $0054, $0012, tSQ, 'EnergyWindowInformationSequence', '1');
  Add(622, $0054, $0013, tSQ, 'EnergyWindowRangeSequence', '1');
  Add(623, $0054, $0014, tDS, 'EnergyWindowLowerLimit', '1');
  Add(624, $0054, $0015, tDS, 'EnergyWindowUpperLimit', '1');
  Add(625, $0054, $0016, tSQ, 'RadiopharmaceuticalInformationSequence', '1');
  Add(626, $0054, $0017, tIS, 'ResidualSyringeCounts', '1');
  Add(627, $0054, $0018, tSH, 'EnergyWindowName', '1');
  Add(628, $0054, $0020, tUS, 'DetectorVector', '1-n');
  Add(629, $0054, $0021, tUS, 'NumberOfDetectors', '1');
  Add(630, $0054, $0022, tSQ, 'DetectorInformationSequence', '1');
  Add(631, $0054, $0030, tUS, 'PhaseVector', '1-n');
  Add(632, $0054, $0031, tUS, 'NumberOfPhases', '1');
  Add(633, $0054, $0032, tSQ, 'PhaseInformationSequence', '1');
  Add(634, $0054, $0033, tUS, 'NumberOfFramesInPhase', '1');
  Add(635, $0054, $0036, tIS, 'PhaseDelay', '1');
  Add(636, $0054, $0038, tIS, 'PauseBetweenFrames', '1');
  Add(637, $0054, $0050, tUS, 'RotationVector', '1-n');
  Add(638, $0054, $0051, tUS, 'NumberOfRotations', '1');
  Add(639, $0054, $0052, tSQ, 'RotationInformationSequence', '1');
  Add(640, $0054, $0053, tUS, 'NumberOfFramesInRotation', '1');
  Add(641, $0054, $0060, tUS, 'RRIntervalVector', '1-n');
  Add(642, $0054, $0061, tUS, 'NumberOfRRIntervals', '1');
  Add(643, $0054, $0062, tSQ, 'GatedInformationSequence', '1');
  Add(644, $0054, $0063, tSQ, 'DataInformationSequence', '1');
  Add(645, $0054, $0070, tUS, 'TimeSlotVector', '1-n');
  Add(646, $0054, $0071, tUS, 'NumberOfTimeSlots', '1');
  Add(647, $0054, $0072, tSQ, 'TimeSlotInformationSequence', '1');
  Add(648, $0054, $0073, tDS, 'TimeSlotTime', '1');
  Add(649, $0054, $0080, tUS, 'SliceVector', '1-n');
  Add(650, $0054, $0081, tUS, 'NumberOfSlices', '1');
  Add(651, $0054, $0090, tUS, 'AngularViewVector', '1-n');
  Add(652, $0054, $0100, tUS, 'TimeSliceVector', '1-n');
  Add(653, $0054, $0101, tUS, 'NumberOfTimeSlices', '1');
  Add(654, $0054, $0200, tDS, 'StartAngle', '1');
  Add(655, $0054, $0202, tCS, 'TypeOfDetectorMotion', '1');
  Add(656, $0054, $0210, tIS, 'TriggerVector', '1-n');
  Add(657, $0054, $0211, tUS, 'NumberOfTriggersInPhase', '1');
  Add(658, $0054, $0220, tSQ, 'ViewCodeSequence', '1');
  Add(659, $0054, $0222, tSQ, 'ViewAngulationModifierCodeSequence', '1');
  Add(660, $0054, $0300, tSQ, 'RadionuclideCodeSequence', '1');
  Add(661, $0054, $0302, tSQ, 'AdministrationRouteCodeSequence', '1');
  Add(662, $0054, $0304, tSQ, 'RadiopharmaceuticalCodeSequence', '1');
  Add(663, $0054, $0306, tSQ, 'CalibrationDataSequence', '1');
  Add(664, $0054, $0308, tUS, 'EnergyWindowNumber', '1');
  Add(665, $0054, $0400, tSH, 'ImageID', '1');
  Add(666, $0054, $0410, tSQ, 'PatientOrientationCodeSequence', '1');
  Add(667, $0054, $0412, tSQ, 'PatientOrientationModifierCodeSequence', '1');
  Add(668, $0054, $0414, tSQ, 'PatientGantryRelationshipCodeSequence', '1');
  Add(669, $0054, $1000, tCS, 'SeriesType', '2');
  Add(670, $0054, $1001, tCS, 'Units', '1');
  Add(671, $0054, $1002, tCS, 'CountsSource', '1');
  Add(672, $0054, $1004, tCS, 'ReprojectionMethod', '1');
  Add(673, $0054, $1100, tCS, 'RandomsCorrectionMethod', '1');
  Add(674, $0054, $1101, tLO, 'AttenuationCorrectionMethod', '1');
  Add(675, $0054, $1102, tCS, 'DecayCorrection', '1');
  Add(676, $0054, $1103, tLO, 'ReconstructionMethod', '1');
  Add(677, $0054, $1104, tLO, 'DetectorLinesOfResponseUsed', '1');
  Add(678, $0054, $1105, tLO, 'ScatterCorrectionMethod', '1');
  Add(679, $0054, $1200, tDS, 'AxialAcceptance', '1');
  Add(680, $0054, $1201, tIS, 'AxialMash', '2');
  Add(681, $0054, $1202, tIS, 'TransverseMash', '1');
  Add(682, $0054, $1203, tDS, 'DetectorElementSize', '2');
  Add(683, $0054, $1210, tDS, 'CoincidenceWindowWidth', '1');
  Add(684, $0054, $1220, tCS, 'SecondaryCountsType', '1-n');
  Add(685, $0054, $1300, tDS, 'FrameReferenceTime', '1');
  Add(686, $0054, $1310, tIS, 'PrimaryPromptsCountsAccumulated', '1');
  Add(687, $0054, $1311, tIS, 'SecondaryCountsAccumulated', '1-n');
  Add(688, $0054, $1320, tDS, 'SliceSensitivityFactor', '1');
  Add(689, $0054, $1321, tDS, 'DecayFactor', '1');
  Add(690, $0054, $1322, tDS, 'DoseCalibrationFactor', '1');
  Add(691, $0054, $1323, tDS, 'ScatterFractionFactor', '1');
  Add(692, $0054, $1324, tDS, 'DeadTimeFactor', '1');
  Add(693, $0054, $1330, tUS, 'ImageIndex', '1');
  Add(694, $0054, $1400, tCS, 'CountsIncluded', '1-n');
  Add(695, $0054, $1401, tCS, 'DeadTimeCorrectionFlag', '1');
  Add(1330, $0060, $3000, tSQ, 'HistogramSequence', '1');
  Add(1331, $0060, $3002, tUS, 'HistogramNumberofBins', '1');
  Add(1332, $0060, $3004, tUS_SS, 'HistogramFirstBinValue', '1');
  Add(1333, $0060, $3006, tUS_SS, 'HistogramLastBinValue', '1');
  Add(1334, $0060, $3008, tUS, 'HistogramBinWidth', '1');
  Add(1335, $0060, $3010, tLO, 'HistogramExplanation', '1');
  Add(1336, $0060, $3020, tUL, 'HistogramData', '1-n');
  Add(1381, $0070, $0001, tSQ, 'GraphicAnnotationSequence', '1');
  Add(1382, $0070, $0002, tCS, 'GraphicLayer', '1');
  Add(1383, $0070, $0003, tCS, 'BoundingBoxAnnotationUnits', '1');
  Add(1384, $0070, $0004, tCS, 'AnchorPointAnnotationUnits', '1');
  Add(1385, $0070, $0005, tCS, 'GraphicAnnotationUnits', '1');
  Add(1386, $0070, $0006, tST, 'UnformattedTextValue', '1');
  Add(1387, $0070, $0008, tSQ, 'TextObjectSequence', '1');
  Add(1388, $0070, $0009, tSQ, 'GraphicObjectSequence', '1');
  Add(1389, $0070, $0010, tFL, 'BoundingBoxTLHC', '2');
  Add(1390, $0070, $0011, tFL, 'BoundingBoxBRHC', '2');
  Add(1409, $0070, $0012, tCS, 'BoundingBoxTHJ', '1');
  Add(1391, $0070, $0014, tFL, 'AnchorPoint', '2');
  Add(1392, $0070, $0015, tCS, 'AnchorPointVisibility', '1');
  Add(1393, $0070, $0020, tUS, 'GraphicDimensions', '1');
  Add(1394, $0070, $0021, tUS, 'NumberOfGraphicPoints', '1');
  Add(1395, $0070, $0022, tFL, 'GraphicData', '2-n');
  Add(1396, $0070, $0023, tCS, 'GraphicType', '1');
  Add(1397, $0070, $0024, tCS, 'GraphicFilled', '1');
  Add(1398, $0070, $0041, tCS, 'ImageHorizontalFlip', '1');
  Add(1410, $0070, $0042, tUS, 'ImageRotation', '1');
  Add(1411, $0070, $0052, tSL, 'DisplayedAreaTLHC', '2');
  Add(1412, $0070, $0053, tSL, 'DisplayedAreaBRHC', '2');
  Add(1413, $0070, $005A, tSQ, 'DisplayedAreaSelectionSequence', '1');
  Add(1399, $0070, $0060, tSQ, 'GraphicLayerSequence', '1');
  Add(1400, $0070, $0062, tIS, 'GraphicLayerOrder', '1');
  Add(1401, $0070, $0066, tUS, 'GraphicLayerRecommendedDisplayGrayScaleValue', '1');
  Add(1414, $0070, $0067, tUS, 'GraphicLayerRecommendedDisplayRGBValue', '3');
  Add(1402, $0070, $0068, tLO, 'GraphicLayerDescription', '1');
  Add(1403, $0070, $0080, tCS, 'PresentationLabel', '1');
  Add(1404, $0070, $0081, tLO, 'PresentationDescription', '1');
  Add(1405, $0070, $0082, tDA, 'PresentationCreationDate', '1');
  Add(1406, $0070, $0083, tTM, 'PresentationCreationTime', '1');
  Add(1407, $0070, $0084, tPN, 'PresentationCreatorsName', '1');
  Add(1415, $0070, $0100, tCS, 'PresentationSizeMode', '1');
  Add(1416, $0070, $0101, tDS, 'PresentationPixelSpacing', '2');
  Add(1417, $0070, $0102, tIS, 'PresentationPixelAspectRatio', '2');
  Add(1418, $0070, $0103, tFL, 'PresentationPixelMagnificationRatio', '1');
  Add(696, $0088, $0000, tUL, 'StorageGroupLength', '1');
  Add(697, $0088, $0130, tSH, 'StorageMediaFilesetID', '1');
  Add(698, $0088, $0140, tUI, 'StorageMediaFilesetUID', '1');
  Add(699, $0088, $0200, tSQ, 'IconImage', '1');
  Add(700, $0088, $0904, tLO, 'TopicTitle', '1');
  Add(701, $0088, $0906, tST, 'TopicSubject', '1');
  Add(702, $0088, $0910, tLO, 'TopicAuthor', '1');
  Add(703, $0088, $0912, tLO, 'TopicKeyWords', '1-32');
  Add(704, $2000, $0000, tUL, 'FilmSessionGroupLength', '1');
  Add(705, $2000, $0010, tIS, 'NumberOfCopies', '1');
  Add(1347, $2000, $001E, tSQ, 'PrinterConfigurationSequence', '1');
  Add(706, $2000, $0020, tCS, 'PrintPriority', '1');
  Add(707, $2000, $0030, tCS, 'MediumType', '1');
  Add(708, $2000, $0040, tCS, 'FilmDestination', '1');
  Add(709, $2000, $0050, tLO, 'FilmSessionLabel', '1');
  Add(710, $2000, $0060, tIS, 'MemoryAllocation', '1');
  Add(1229, $2000, $0062, tCS, 'ColorImagePrintingFlag', '1');
  Add(1230, $2000, $0063, tCS, 'CollationFlag', '1');
  Add(1231, $2000, $0065, tCS, 'AnnotationFlag', '1');
  Add(1232, $2000, $0067, tCS, 'ImageOverlayFlag', '1');
  Add(1233, $2000, $0069, tCS, 'PresentationLUTFlag', '1');
  Add(1234, $2000, $006A, tCS, 'ImageBoxPresentationLUTFlag', '1');
  Add(1348, $2000, $00A0, tUS, 'MemoryBitDepth', '1');
  Add(1349, $2000, $00A1, tUS, 'PrintingBitDepth', '1');
  Add(1350, $2000, $00A2, tSQ, 'MediaInstalledSequence', '1');
  Add(1351, $2000, $00A4, tSQ, 'OtherMediaAvailableSequence', '1');
  Add(1352, $2000, $00A8, tSQ, 'SupportedImageDisplayFormatsSequence', '1');
  Add(711, $2000, $0500, tSQ, 'ReferencedFilmBoxSequence', '1');
  Add(1235, $2000, $0510, tSQ, 'ReferencedStoredPrintSequence', '1');
  Add(712, $2010, $0000, tUL, 'FilmBoxGroupLength', '1');
  Add(713, $2010, $0010, tST, 'ImageDisplayFormat', '1');
  Add(714, $2010, $0030, tCS, 'AnnotationDisplayFormatID', '1');
  Add(715, $2010, $0040, tCS, 'FilmOrientation', '1');
  Add(716, $2010, $0050, tCS, 'FilmSizeID', '1');
  Add(1353, $2010, $0052, tCS, 'PrinterResolutionID', '1');
  Add(1354, $2010, $0054, tCS, 'DefaultPrinterResolutionID', '1');
  Add(717, $2010, $0060, tCS, 'MagnificationType', '1');
  Add(718, $2010, $0080, tCS, 'SmoothingType', '1');
  Add(1355, $2010, $00A6, tCS, 'DefaultMagnificationType', '1');
  Add(1356, $2010, $00A7, tCS, 'OtherMagnificationTypesAvailable', '1-n');
  Add(1357, $2010, $00A8, tCS, 'DefaultSmoothingType', '1');
  Add(1358, $2010, $00A9, tCS, 'OtherSmoothingTypesAvailable', '1-n');
  Add(719, $2010, $0100, tCS, 'BorderDensity', '1');
  Add(720, $2010, $0110, tCS, 'EmptyImageDensity', '1');
  Add(721, $2010, $0120, tUS, 'MinDensity', '1');
  Add(722, $2010, $0130, tUS, 'MaxDensity', '1');
  Add(723, $2010, $0140, tCS, 'Trim', '1');
  Add(724, $2010, $0150, tST, 'ConfigurationInformation', '1');
  Add(1359, $2010, $0152, tLT, 'ConfigurationInformationDescription', '1');
  Add(1360, $2010, $0154, tIS, 'MaximumCollatedFilms', '1');
  Add(1236, $2010, $015E, tUS, 'Illumination', '1');
  Add(1237, $2010, $0160, tUS, 'ReflectedAmbientLight', '1');
  Add(1361, $2010, $0376, tDS, 'PrinterPixelSpacing', '2');
  Add(725, $2010, $0500, tSQ, 'ReferencedFilmSessionSequence', '1');
  Add(726, $2010, $0510, tSQ, 'ReferencedImageBoxSequence', '1');
  Add(727, $2010, $0520, tSQ, 'ReferencedBasicAnnotationBoxSequence', '1');
  Add(728, $2020, $0000, tUL, 'ImageBoxGroupLength', '1');
  Add(729, $2020, $0010, tUS, 'ImageBoxPosition', '1');
  Add(730, $2020, $0020, tCS, 'Polarity', '1');
  Add(731, $2020, $0030, tDS, 'RequestedImageSize', '1');
  Add(1362, $2020, $0040, tCS, 'RequestedDecimateCropBehavior', '1');
  Add(1363, $2020, $0050, tCS, 'RequestedResolutionID', '1');
  Add(1364, $2020, $00A0, tCS, 'RequestedImageSizeFlag', '1');
  Add(1365, $2020, $00A2, tCS, 'DecimateCropResult', '1');
  Add(732, $2020, $0110, tSQ, 'PreformattedGrayscaleImageSequence', '1');
  Add(733, $2020, $0111, tSQ, 'PreformattedColorImageSequence', '1');
  Add(734, $2020, $0130, tSQ, 'ReferencedImageOverlayBoxSequence', '1');
  Add(735, $2020, $0140, tSQ, 'ReferencedVOILUTBoxSequence', '1');
  Add(736, $2030, $0000, tUL, 'AnnotationGroupLength', '1');
  Add(737, $2030, $0010, tUS, 'AnnotationPosition', '1');
  Add(738, $2030, $0020, tLO, 'TextString', '1');
  Add(739, $2040, $0000, tUL, 'OverlayBoxGroupLength', '1');
  Add(740, $2040, $0010, tSQ, 'ReferencedOverlayPlaneSequence', '1');
  Add(741, $2040, $0011, tUS, 'ReferencedOverlayPlaneGroups', '1-99');
  Add(1366, $2040, $0020, tSQ, 'OverlayPixelDataSequence', '1');
  Add(742, $2040, $0060, tCS, 'OverlayMagnificationType', '1');
  Add(743, $2040, $0070, tCS, 'OverlaySmoothingType', '1');
  Add(1367, $2040, $0072, tCS, 'OverlayOrImageMagnification', '1');
  Add(1368, $2040, $0074, tUS, 'MagnifyToNumberOfColumns', '1');
  Add(744, $2040, $0080, tCS, 'OverlayForegroundDensity', '1');
  Add(1369, $2040, $0082, tCS, 'OverlayBackgroundDensity', '1');
  Add(745, $2040, $0090, tCS, 'OverlayMode', '1');
  Add(746, $2040, $0100, tCS, 'ThresholdDensity', '1');
  Add(747, $2040, $0500, tSQ, 'RETIRED_ReferencedImageBoxSequence', '1');
  Add(1238, $2050, $0000, tUL, 'PresentationLUTGroupLength', '1');
  Add(1239, $2050, $0010, tSQ, 'PresentationLUTSequence', '1');
  Add(1240, $2050, $0020, tCS, 'PresentationLUTShape', '1');
  Add(1241, $2050, $0500, tSQ, 'ReferencedPresentationLUTSequence', '1');
  Add(748, $2100, $0000, tUL, 'PrintJobGroupLength', '1');
  Add(749, $2100, $0010, tSH, 'PrintJobID', '1');
  Add(750, $2100, $0020, tCS, 'ExecutionStatus', '1');
  Add(751, $2100, $0030, tCS, 'ExecutionStatusInfo', '1');
  Add(752, $2100, $0040, tDA, 'CreationDate', '1');
  Add(753, $2100, $0050, tTM, 'CreationTime', '1');
  Add(754, $2100, $0070, tAE, 'Originator', '1');
  Add(755, $2100, $0140, tAE, 'DestinationAE', '1');
  Add(756, $2100, $0160, tSH, 'OwnerID', '1');
  Add(757, $2100, $0170, tIS, 'NumberOfFilms', '1');
  Add(758, $2100, $0500, tSQ, 'ReferencedPrintJobSequence', '1');
  Add(759, $2110, $0000, tUL, 'PrinterGroupLength', '1');
  Add(760, $2110, $0010, tCS, 'PrinterStatus', '1');
  Add(761, $2110, $0020, tCS, 'PrinterStatusInfo', '1');
  Add(762, $2110, $0030, tLO, 'PrinterName', '1');
  Add(763, $2110, $0099, tSH, 'PrintQueueID', '1');
  Add(1242, $2120, $0000, tUL, 'QueueGroupLength', '1');
  Add(764, $2120, $0010, tCS, 'QueueStatus', '1');
  Add(765, $2120, $0050, tSQ, 'PrintJobDescriptionSequence', '1');
  Add(766, $2120, $0070, tSQ, 'QueueReferencedPrintJobSequence', '1');
  Add(1243, $2130, $0000, tUL, 'PrintContentGroupLength', '1');
  Add(1244, $2130, $0010, tSQ, 'PrintManagementCapabilitiesSequence', '1');
  Add(1245, $2130, $0015, tSQ, 'PrinterCharacteristicsSequence', '1');
  Add(1246, $2130, $0030, tSQ, 'FilmBoxContentSequence', '1');
  Add(1247, $2130, $0040, tSQ, 'ImageBoxContentSequence', '1');
  Add(1248, $2130, $0050, tSQ, 'AnnotationContentSequence', '1');
  Add(1249, $2130, $0060, tSQ, 'ImageOverlayBoxContentSequence', '1');
  Add(1250, $2130, $0080, tSQ, 'PresentationLUTContentSequence', '1');
  Add(1251, $2130, $00A0, tSQ, 'ProposedStudySequence', '1');
  Add(1252, $2130, $00C0, tSQ, 'OriginalImageSequence', '1');
  Add(1253, $3002, $0000, tUL, 'RTImageGroupLength', '1');
  Add(767, $3002, $0002, tSH, 'RTImageLabel', '1');
  Add(768, $3002, $0003, tLO, 'RTImageName', '1');
  Add(769, $3002, $0004, tST, 'RTImageDescription', '1');
  Add(770, $3002, $000A, tCS, 'ReportedValuesOrigin', '1');
  Add(771, $3002, $000C, tCS, 'RTImagePlane', '1');
  Add(772, $3002, $000E, tDS, 'XRayImageReceptorAngle', '1');
  Add(773, $3002, $0010, tDS, 'RTImageOrientation', '6');
  Add(774, $3002, $0011, tDS, 'ImagePlanePixelSpacing', '2');
  Add(775, $3002, $0012, tDS, 'RTImagePosition', '2');
  Add(776, $3002, $0020, tSH, 'RadiationMachineName', '1');
  Add(777, $3002, $0022, tDS, 'RadiationMachineSAD', '1');
  Add(778, $3002, $0024, tDS, 'RadiationMachineSSD', '1');
  Add(779, $3002, $0026, tDS, 'RTImageSID', '1');
  Add(780, $3002, $0028, tDS, 'SourceToReferenceObjectDistance', '1');
  Add(781, $3002, $0029, tIS, 'FractionNumber', '1');
  Add(782, $3002, $0030, tSQ, 'ExposureSequence', '1');
  Add(783, $3002, $0032, tDS, 'MetersetExposure', '1');
  Add(1254, $3004, $0000, tUL, 'RTDoseGroupLength', '1');
  Add(784, $3004, $0001, tCS, 'DVHType', '1');
  Add(785, $3004, $0002, tCS, 'DoseUnits', '1');
  Add(786, $3004, $0004, tCS, 'DoseType', '1');
  Add(787, $3004, $0006, tLO, 'DoseComment', '1');
  Add(788, $3004, $0008, tDS, 'NormalizationPoint', '3');
  Add(789, $3004, $000A, tCS, 'DoseSummationType', '1');
  Add(790, $3004, $000C, tDS, 'GridFrameOffsetVector', '2-n');
  Add(791, $3004, $000E, tDS, 'DoseGridScaling', '1');
  Add(792, $3004, $0010, tSQ, 'RTDoseROISequence', '1');
  Add(793, $3004, $0012, tDS, 'DoseValue', '1');
  Add(794, $3004, $0040, tDS, 'DVHNormalizationPoint', '3');
  Add(795, $3004, $0042, tDS, 'DVHNormalizationDoseValue', '1');
  Add(796, $3004, $0050, tSQ, 'DVHSequence', '1');
  Add(797, $3004, $0052, tDS, 'DVHDoseScaling', '1');
  Add(798, $3004, $0054, tCS, 'DVHVolumeUnits', '1');
  Add(799, $3004, $0056, tIS, 'DVHNumberOfBins', '1');
  Add(800, $3004, $0058, tDS, 'DVHData', '2-2n');
  Add(801, $3004, $0060, tSQ, 'DVHReferencedROISequence', '1');
  Add(802, $3004, $0062, tCS, 'DVHROIContributionType', '1');
  Add(803, $3004, $0070, tDS, 'DVHMinimumDose', '1');
  Add(804, $3004, $0072, tDS, 'DVHMaximumDose', '1');
  Add(805, $3004, $0074, tDS, 'DVHMeanDose', '1');
  Add(1255, $3006, $0000, tUL, 'RTStructureSetGroupLength', '1');
  Add(806, $3006, $0002, tSH, 'StructureSetLabel', '1');
  Add(807, $3006, $0004, tLO, 'StructureSetName', '1');
  Add(808, $3006, $0006, tST, 'StructureSetDescription', '1');
  Add(809, $3006, $0008, tDA, 'StructureSetDate', '1');
  Add(810, $3006, $0009, tTM, 'StructureSetTime', '1');
  Add(811, $3006, $0010, tSQ, 'ReferencedFrameOfReferenceSequence', '1');
  Add(812, $3006, $0012, tSQ, 'RTReferencedStudySequence', '1');
  Add(813, $3006, $0014, tSQ, 'RTReferencedSeriesSequence', '1');
  Add(814, $3006, $0016, tSQ, 'ContourImageSequence', '1');
  Add(815, $3006, $0020, tSQ, 'StructureSetROISequence', '1');
  Add(816, $3006, $0022, tIS, 'ROINumber', '1');
  Add(817, $3006, $0024, tUI, 'ReferencedFrameOfReferenceUID', '1');
  Add(818, $3006, $0026, tLO, 'ROIName', '1');
  Add(819, $3006, $0028, tST, 'ROIDescription', '1');
  Add(820, $3006, $002A, tIS, 'ROIDisplayColor', '3');
  Add(821, $3006, $002C, tDS, 'ROIVolume', '1');
  Add(822, $3006, $0030, tSQ, 'RTRelatedROISequence', '1');
  Add(823, $3006, $0033, tCS, 'RTROIRelationship', '1');
  Add(824, $3006, $0036, tCS, 'ROIGenerationAlgorithm', '1');
  Add(825, $3006, $0038, tLO, 'ROIGenerationDescription', '1');
  Add(826, $3006, $0039, tSQ, 'ROIContourSequence', '1');
  Add(827, $3006, $0040, tSQ, 'ContourSequence', '1');
  Add(828, $3006, $0042, tCS, 'ContourGeometricType', '1');
  Add(829, $3006, $0044, tDS, 'ContourSlabThickness', '1');
  Add(830, $3006, $0045, tDS, 'ContourOffsetVector', '3');
  Add(831, $3006, $0046, tIS, 'NumberOfContourPoints', '1');
  Add(832, $3006, $0050, tDS, 'ContourData', '3-3n');
  Add(833, $3006, $0080, tSQ, 'RTROIObservationsSequence', '1');
  Add(834, $3006, $0082, tIS, 'ObservationNumber', '1');
  Add(835, $3006, $0084, tIS, 'ReferencedROINumber', '1');
  Add(836, $3006, $0085, tSH, 'ROIObservationLabel', '1');
  Add(837, $3006, $0086, tSQ, 'RTROIIdentificationCodeSequence', '1');
  Add(838, $3006, $0088, tST, 'ROIObservationDescription', '1');
  Add(839, $3006, $00A0, tSQ, 'RelatedRTROIObservationsSequence', '1');
  Add(840, $3006, $00A4, tCS, 'RTROIInterpretedType', '1');
  Add(841, $3006, $00A6, tPN, 'ROIInterpreter', '1');
  Add(842, $3006, $00B0, tSQ, 'ROIPhysicalPropertiesSequence', '1');
  Add(843, $3006, $00B2, tCS, 'ROIPhysicalProperty', '1');
  Add(844, $3006, $00B4, tDS, 'ROIPhysicalPropertyValue', '1');
  Add(845, $3006, $00C0, tSQ, 'FrameOfReferenceRelationshipSequence', '1');
  Add(846, $3006, $00C2, tUI, 'RelatedFrameOfReferenceUID', '1');
  Add(847, $3006, $00C4, tCS, 'FrameOfReferenceTransformationType', '1');
  Add(848, $3006, $00C6, tDS, 'FrameOfReferenceTransformationMatrix', '16');
  Add(849, $3006, $00C8, tLO, 'FrameOfReferenceTransformationComment', '1');
  Add(1256, $300A, $0000, tUL, 'RTPlanGroupLength', '1');
  Add(850, $300A, $0002, tSH, 'RTPlanLabel', '1');
  Add(851, $300A, $0003, tLO, 'RTPlanName', '1');
  Add(852, $300A, $0004, tST, 'RTPlanDescription', '1');
  Add(853, $300A, $0006, tDA, 'RTPlanDate', '1');
  Add(854, $300A, $0007, tTM, 'RTPlanTime', '1');
  Add(855, $300A, $0009, tLO, 'TreatmentProtocols', '1-n');
  Add(856, $300A, $000A, tCS, 'TreatmentIntent', '1');
  Add(857, $300A, $000B, tLO, 'TreatmentSites', '1-n');
  Add(858, $300A, $000C, tCS, 'RTPlanGeometry', '1');
  Add(859, $300A, $000E, tST, 'PrescriptionDescription', '1');
  Add(860, $300A, $0010, tSQ, 'DoseReferenceSequence', '1');
  Add(861, $300A, $0012, tIS, 'DoseReferenceNumber', '1');
  Add(862, $300A, $0014, tCS, 'DoseReferenceStructureType', '1');
  Add(863, $300A, $0016, tLO, 'DoseReferenceDescription', '1');
  Add(864, $300A, $0018, tDS, 'DoseReferencePointCoordinates', '3');
  Add(865, $300A, $001A, tDS, 'NominalPriorDose', '1');
  Add(866, $300A, $0020, tCS, 'DoseReferenceType', '1');
  Add(867, $300A, $0021, tDS, 'ConstraintWeight', '1');
  Add(868, $300A, $0022, tDS, 'DeliveryWarningDose', '1');
  Add(869, $300A, $0023, tDS, 'DeliveryMaximumDose', '1');
  Add(870, $300A, $0025, tDS, 'TargetMinimumDose', '1');
  Add(871, $300A, $0026, tDS, 'TargetPrescriptionDose', '1');
  Add(872, $300A, $0027, tDS, 'TargetMaximumDose', '1');
  Add(873, $300A, $0028, tDS, 'TargetUnderdoseVolumeFraction', '1');
  Add(874, $300A, $002A, tDS, 'OrganAtRiskFullVolumeDose', '1');
  Add(875, $300A, $002B, tDS, 'OrganAtRiskLimitDose', '1');
  Add(876, $300A, $002C, tDS, 'OrganAtRiskMaximumDose', '1');
  Add(877, $300A, $002D, tDS, 'OrganAtRiskOverdoseVolumeFraction', '1');
  Add(878, $300A, $0040, tSQ, 'ToleranceTableSequence', '1');
  Add(879, $300A, $0042, tIS, 'ToleranceTableNumber', '1');
  Add(880, $300A, $0043, tSH, 'ToleranceTableLabel', '1');
  Add(881, $300A, $0044, tDS, 'GantryAngleTolerance', '1');
  Add(882, $300A, $0046, tDS, 'BeamLimitingDeviceAngleTolerance', '1');
  Add(883, $300A, $0048, tSQ, 'BeamLimitingDeviceToleranceSequence', '1');
  Add(884, $300A, $004A, tDS, 'BeamLimitingDevicePositionTolerance', '1');
  Add(885, $300A, $004C, tDS, 'PatientSupportAngleTolerance', '1');
  Add(886, $300A, $004E, tDS, 'TableTopEccentricAngleTolerance', '1');
  Add(887, $300A, $0051, tDS, 'TableTopVerticalPositionTolerance', '1');
  Add(888, $300A, $0052, tDS, 'TableTopLongitudinalPositionTolerance', '1');
  Add(889, $300A, $0053, tDS, 'TableTopLateralPositionTolerance', '1');
  Add(890, $300A, $0055, tCS, 'RTPlanRelationship', '1');
  Add(891, $300A, $0070, tSQ, 'FractionGroupSequence', '1');
  Add(892, $300A, $0071, tIS, 'FractionGroupNumber', '1');
  Add(893, $300A, $0078, tIS, 'NumberOfFractionsPlanned', '1');
  Add(894, $300A, $0079, tIS, 'NumberOfFractionsPerDay', '1');
  Add(895, $300A, $007A, tIS, 'RepeatFractionCycleLength', '1');
  Add(896, $300A, $007B, tLT, 'FractionPattern', '1');
  Add(897, $300A, $0080, tIS, 'NumberOfBeams', '1');
  Add(898, $300A, $0082, tDS, 'BeamDoseSpecificationPoint', '3');
  Add(899, $300A, $0084, tDS, 'BeamDose', '1');
  Add(900, $300A, $0086, tDS, 'BeamMeterset', '1');
  Add(901, $300A, $00A0, tIS, 'NumberOfBrachyApplicationSetups', '1');
  Add(902, $300A, $00A2, tDS, 'BrachyApplicationSetupDoseSpecificationPoint', '3');
  Add(903, $300A, $00A4, tDS, 'BrachyApplicationSetupDose', '1');
  Add(904, $300A, $00B0, tSQ, 'BeamSequence', '1');
  Add(905, $300A, $00B2, tSH, 'TreatmentMachineName', '1');
  Add(906, $300A, $00B3, tCS, 'PrimaryDosimeterUnit', '1');
  Add(907, $300A, $00B4, tDS, 'Source_AxisDistance', '1');
  Add(908, $300A, $00B6, tSQ, 'BeamLimitingDeviceSequence', '1');
  Add(909, $300A, $00B8, tCS, 'RTBeamLimitingDeviceType', '1');
  Add(910, $300A, $00BA, tDS, 'SourceToBeamLimitingDeviceDistance', '1');
  Add(911, $300A, $00BC, tIS, 'NumberOfLeafJawPairs', '1');
  Add(912, $300A, $00BE, tDS, 'LeafPositionBoundaries', '3-n');
  Add(913, $300A, $00C0, tIS, 'BeamNumber', '1');
  Add(914, $300A, $00C2, tLO, 'BeamName', '1');
  Add(915, $300A, $00C3, tST, 'BeamDescription', '1');
  Add(916, $300A, $00C4, tCS, 'BeamType', '1');
  Add(917, $300A, $00C6, tCS, 'RadiationType', '1');
  Add(918, $300A, $00C8, tIS, 'ReferenceImageNumber', '1');
  Add(919, $300A, $00CA, tSQ, 'PlannedVerificationImageSequence', '1');
  Add(920, $300A, $00CC, tLO, 'ImagingDeviceSpecificAcquisitionParameters', '1-n');
  Add(921, $300A, $00CE, tCS, 'TreatmentDeliveryType', '1');
  Add(922, $300A, $00D0, tIS, 'NumberOfWedges', '1');
  Add(923, $300A, $00D1, tSQ, 'WedgeSequence', '1');
  Add(924, $300A, $00D2, tIS, 'WedgeNumber', '1');
  Add(925, $300A, $00D3, tCS, 'WedgeType', '1');
  Add(926, $300A, $00D4, tSH, 'WedgeID', '1');
  Add(927, $300A, $00D5, tIS, 'WedgeAngle', '1');
  Add(928, $300A, $00D6, tDS, 'WedgeFactor', '1');
  Add(929, $300A, $00D8, tDS, 'WedgeOrientation', '1');
  Add(930, $300A, $00DA, tDS, 'SourceToWedgeTrayDistance', '1');
  Add(931, $300A, $00E0, tIS, 'NumberOfCompensators', '1');
  Add(932, $300A, $00E1, tSH, 'MaterialID', '1');
  Add(933, $300A, $00E2, tDS, 'TotalCompensatorTrayFactor', '1');
  Add(934, $300A, $00E3, tSQ, 'CompensatorSequence', '1');
  Add(935, $300A, $00E4, tIS, 'CompensatorNumber', '1');
  Add(936, $300A, $00E5, tSH, 'CompensatorID', '1');
  Add(937, $300A, $00E6, tDS, 'SourceToCompensatorTrayDistance', '1');
  Add(938, $300A, $00E7, tIS, 'CompensatorRows', '1');
  Add(939, $300A, $00E8, tIS, 'CompensatorColumns', '1');
  Add(940, $300A, $00E9, tDS, 'CompensatorPixelSpacing', '2');
  Add(941, $300A, $00EA, tDS, 'CompensatorPosition', '2');
  Add(942, $300A, $00EB, tDS, 'CompensatorTransmissionData', '1-n');
  Add(943, $300A, $00EC, tDS, 'CompensatorThicknessData', '1-n');
  Add(944, $300A, $00ED, tIS, 'NumberOfBoli', '1');
  Add(945, $300A, $00F0, tIS, 'NumberOfBlocks', '1');
  Add(946, $300A, $00F2, tDS, 'TotalBlockTrayFactor', '1');
  Add(947, $300A, $00F4, tSQ, 'BlockSequence', '1');
  Add(948, $300A, $00F5, tSH, 'BlockTrayID', '1');
  Add(949, $300A, $00F6, tDS, 'SourceToBlockTrayDistance', '1');
  Add(950, $300A, $00F8, tCS, 'BlockType', '1');
  Add(951, $300A, $00FA, tCS, 'BlockDivergence', '1');
  Add(952, $300A, $00FC, tIS, 'BlockNumber', '1');
  Add(953, $300A, $00FE, tLO, 'BlockName', '1');
  Add(954, $300A, $0100, tDS, 'BlockThickness', '1');
  Add(955, $300A, $0102, tDS, 'BlockTransmission', '1');
  Add(956, $300A, $0104, tIS, 'BlockNumberOfPoints', '1');
  Add(957, $300A, $0106, tDS, 'BlockData', '2-2n');
  Add(958, $300A, $0107, tSQ, 'ApplicatorSequence', '1');
  Add(959, $300A, $0108, tSH, 'ApplicatorID', '1');
  Add(960, $300A, $0109, tCS, 'ApplicatorType', '1');
  Add(961, $300A, $010A, tLO, 'ApplicatorDescription', '1');
  Add(962, $300A, $010C, tDS, 'CumulativeDoseReferenceCoefficient', '1');
  Add(963, $300A, $010E, tDS, 'FinalCumulativeMetersetWeight', '1');
  Add(964, $300A, $0110, tIS, 'NumberOfControlPoints', '1');
  Add(965, $300A, $0111, tSQ, 'ControlPointSequence', '1');
  Add(966, $300A, $0112, tIS, 'ControlPointIndex', '1');
  Add(967, $300A, $0114, tDS, 'NominalBeamEnergy', '1');
  Add(968, $300A, $0115, tDS, 'DoseRateSet', '1');
  Add(969, $300A, $0116, tSQ, 'WedgePositionSequence', '1');
  Add(970, $300A, $0118, tCS, 'WedgePosition', '1');
  Add(971, $300A, $011A, tSQ, 'BeamLimitingDevicePositionSequence', '1');
  Add(972, $300A, $011C, tDS, 'LeafJawPositions', '2-2n');
  Add(973, $300A, $011E, tDS, 'GantryAngle', '1');
  Add(974, $300A, $011F, tCS, 'GantryRotationDirection', '1');
  Add(975, $300A, $0120, tDS, 'BeamLimitingDeviceAngle', '1');
  Add(976, $300A, $0121, tCS, 'BeamLimitingDeviceRotationDirection', '1');
  Add(977, $300A, $0122, tDS, 'PatientSupportAngle', '1');
  Add(978, $300A, $0123, tCS, 'PatientSupportRotationDirection', '1');
  Add(979, $300A, $0124, tDS, 'TableTopEccentricAxisDistance', '1');
  Add(980, $300A, $0125, tDS, 'TableTopEccentricAngle', '1');
  Add(981, $300A, $0126, tCS, 'TableTopEccentricRotationDirection', '1');
  Add(982, $300A, $0128, tDS, 'TableTopVerticalPosition', '1');
  Add(983, $300A, $0129, tDS, 'TableTopLongitudinalPosition', '1');
  Add(984, $300A, $012A, tDS, 'TableTopLateralPosition', '1');
  Add(985, $300A, $012C, tDS, 'IsocenterPosition', '3');
  Add(986, $300A, $012E, tDS, 'SurfaceEntryPoint', '3');
  Add(987, $300A, $0130, tDS, 'SourceToSurfaceDistance', '1');
  Add(988, $300A, $0134, tDS, 'CumulativeMetersetWeight', '1');
  Add(989, $300A, $0180, tSQ, 'PatientSetupSequence', '1');
  Add(990, $300A, $0182, tIS, 'PatientSetupNumber', '1');
  Add(991, $300A, $0184, tLO, 'PatientAdditionalPosition', '1');
  Add(992, $300A, $0190, tSQ, 'FixationDeviceSequence', '1');
  Add(993, $300A, $0192, tCS, 'FixationDeviceType', '1');
  Add(994, $300A, $0194, tSH, 'FixationDeviceLabel', '1');
  Add(995, $300A, $0196, tST, 'FixationDeviceDescription', '1');
  Add(996, $300A, $0198, tSH, 'FixationDevicePosition', '1');
  Add(997, $300A, $01A0, tSQ, 'ShieldingDeviceSequence', '1');
  Add(998, $300A, $01A2, tCS, 'ShieldingDeviceType', '1');
  Add(999, $300A, $01A4, tSH, 'ShieldingDeviceLabel', '1');
  Add(1000, $300A, $01A6, tST, 'ShieldingDeviceDescription', '1');
  Add(1001, $300A, $01A8, tSH, 'ShieldingDevicePosition', '1');
  Add(1002, $300A, $01B0, tCS, 'SetupTechnique', '1');
  Add(1003, $300A, $01B2, tST, 'SetupTechniqueDescription', '1');
  Add(1004, $300A, $01B4, tSQ, 'SetupDeviceSequence', '1');
  Add(1005, $300A, $01B6, tCS, 'SetupDeviceType', '1');
  Add(1006, $300A, $01B8, tSH, 'SetupDeviceLabel', '1');
  Add(1007, $300A, $01BA, tST, 'SetupDeviceDescription', '1');
  Add(1008, $300A, $01BC, tDS, 'SetupDeviceParameter', '1');
  Add(1009, $300A, $01D0, tST, 'SetupReferenceDescription', '1');
  Add(1010, $300A, $01D2, tDS, 'TableTopVerticalSetupDisplacement', '1');
  Add(1011, $300A, $01D4, tDS, 'TableTopLongitudinalSetupDisplacement', '1');
  Add(1012, $300A, $01D6, tDS, 'TableTopLateralSetupDisplacement', '1');
  Add(1013, $300A, $0200, tCS, 'BrachyTreatmentTechnique', '1');
  Add(1014, $300A, $0202, tCS, 'BrachyTreatmentType', '1');
  Add(1015, $300A, $0206, tSQ, 'TreatmentMachineSequence', '1');
  Add(1016, $300A, $0210, tSQ, 'SourceSequence', '1');
  Add(1017, $300A, $0212, tIS, 'SourceNumber', '1');
  Add(1018, $300A, $0214, tCS, 'SourceType', '1');
  Add(1019, $300A, $0216, tLO, 'SourceManufacturer', '1');
  Add(1020, $300A, $0218, tDS, 'ActiveSourceDiameter', '1');
  Add(1021, $300A, $021A, tDS, 'ActiveSourceLength', '1');
  Add(1022, $300A, $0222, tDS, 'SourceEncapsulationNominalThickness', '1');
  Add(1023, $300A, $0224, tDS, 'SourceEncapsulationNominalTransmission', '1');
  Add(1024, $300A, $0226, tLO, 'SourceIsotopeName', '1');
  Add(1025, $300A, $0228, tDS, 'SourceIsotopeHalfLife', '1');
  Add(1026, $300A, $022A, tDS, 'ReferenceAirKermaRate', '1');
  Add(1027, $300A, $022C, tDA, 'AirKermaRateReferenceDate', '1');
  Add(1028, $300A, $022E, tTM, 'AirKermaRateReferenceTime', '1');
  Add(1029, $300A, $0230, tSQ, 'ApplicationSetupSequence', '1');
  Add(1030, $300A, $0232, tCS, 'ApplicationSetupType', '1');
  Add(1031, $300A, $0234, tIS, 'ApplicationSetupNumber', '1');
  Add(1032, $300A, $0236, tLO, 'ApplicationSetupName', '1');
  Add(1033, $300A, $0238, tLO, 'ApplicationSetupManufacturer', '1');
  Add(1034, $300A, $0240, tIS, 'TemplateNumber', '1');
  Add(1035, $300A, $0242, tSH, 'TemplateType', '1');
  Add(1036, $300A, $0244, tLO, 'TemplateName', '1');
  Add(1037, $300A, $0250, tDS, 'TotalReferenceAirKerma', '1');
  Add(1038, $300A, $0260, tSQ, 'BrachyAccessoryDeviceSequence', '1');
  Add(1039, $300A, $0262, tIS, 'BrachyAccessoryDeviceNumber', '1');
  Add(1040, $300A, $0263, tSH, 'BrachyAccessoryDeviceID', '1');
  Add(1041, $300A, $0264, tCS, 'BrachyAccessoryDeviceType', '1');
  Add(1042, $300A, $0266, tLO, 'BrachyAccessoryDeviceName', '1');
  Add(1043, $300A, $026A, tDS, 'BrachyAccessoryDeviceNominalThickness', '1');
  Add(1044, $300A, $026C, tDS, 'BrachyAccessoryDeviceNominalTransmission', '1');
  Add(1045, $300A, $0280, tSQ, 'ChannelSequence', '1');
  Add(1046, $300A, $0282, tIS, 'ChannelNumber', '1');
  Add(1047, $300A, $0284, tDS, 'ChannelLength', '1');
  Add(1048, $300A, $0286, tDS, 'ChannelTotalTime', '1');
  Add(1049, $300A, $0288, tCS, 'SourceMovementType', '1');
  Add(1050, $300A, $028A, tIS, 'NumberOfPulses', '1');
  Add(1051, $300A, $028C, tDS, 'PulseRepetitionInterval', '1');
  Add(1052, $300A, $0290, tIS, 'SourceApplicatorNumber', '1');
  Add(1053, $300A, $0291, tSH, 'SourceApplicatorID', '1');
  Add(1054, $300A, $0292, tCS, 'SourceApplicatorType', '1');
  Add(1055, $300A, $0294, tLO, 'SourceApplicatorName', '1');
  Add(1056, $300A, $0296, tDS, 'SourceApplicatorLength', '1');
  Add(1057, $300A, $0298, tLO, 'SourceApplicatorManufacturer', '1');
  Add(1058, $300A, $029C, tDS, 'SourceApplicatorWallNominalThickness', '1');
  Add(1059, $300A, $029E, tDS, 'SourceApplicatorWallNominalTransmission', '1');
  Add(1060, $300A, $02A0, tDS, 'SourceApplicatorStepSize', '1');
  Add(1061, $300A, $02A2, tIS, 'TransferTubeNumber', '1');
  Add(1062, $300A, $02A4, tDS, 'TransferTubeLength', '1');
  Add(1063, $300A, $02B0, tSQ, 'ChannelShieldSequence', '1');
  Add(1064, $300A, $02B2, tIS, 'ChannelShieldNumber', '1');
  Add(1065, $300A, $02B3, tSH, 'ChannelShieldID', '1');
  Add(1066, $300A, $02B4, tLO, 'ChannelShieldName', '1');
  Add(1067, $300A, $02B8, tDS, 'ChannelShieldNominalThickness', '1');
  Add(1068, $300A, $02BA, tDS, 'ChannelShieldNominalTransmission', '1');
  Add(1069, $300A, $02C8, tDS, 'FinalCumulativeTimeWeight', '1');
  Add(1070, $300A, $02D0, tSQ, 'BrachyControlPointSequence', '1');
  Add(1071, $300A, $02D2, tDS, 'ControlPointRelativePosition', '1');
  Add(1072, $300A, $02D4, tDS, 'ControlPoint3DPosition', '3');
  Add(1073, $300A, $02D6, tDS, 'CumulativeTimeWeight', '1');
  Add(1257, $300C, $0000, tUL, 'RTRelationshipGroupLength', '1');
  Add(1074, $300C, $0002, tSQ, 'ReferencedRTPlanSequence', '1');
  Add(1075, $300C, $0004, tSQ, 'ReferencedBeamSequence', '1');
  Add(1076, $300C, $0006, tIS, 'ReferencedBeamNumber', '1');
  Add(1077, $300C, $0007, tIS, 'ReferencedReferenceImageNumber', '1');
  Add(1078, $300C, $0008, tDS, 'StartCumulativeMetersetWeight', '1');
  Add(1079, $300C, $0009, tDS, 'EndCumulativeMetersetWeight', '1');
  Add(1080, $300C, $000A, tSQ, 'ReferencedBrachyApplicationSetupSequence', '1');
  Add(1081, $300C, $000C, tIS, 'ReferencedBrachyApplicationSetupNumber', '1');
  Add(1082, $300C, $000E, tIS, 'ReferencedSourceNumber', '1');
  Add(1083, $300C, $0020, tSQ, 'ReferencedFractionGroupSequence', '1');
  Add(1084, $300C, $0022, tIS, 'ReferencedFractionGroupNumber', '1');
  Add(1085, $300C, $0040, tSQ, 'ReferencedVerificationImageSequence', '1');
  Add(1086, $300C, $0042, tSQ, 'ReferencedReferenceImageSequence', '1');
  Add(1087, $300C, $0050, tSQ, 'ReferencedDoseReferenceSequence', '1');
  Add(1088, $300C, $0051, tIS, 'ReferencedDoseReferenceNumber', '1');
  Add(1089, $300C, $0055, tSQ, 'BrachyReferencedDoseReferenceSequence', '1');
  Add(1090, $300C, $0060, tSQ, 'ReferencedStructureSetSequence', '1');
  Add(1091, $300C, $006A, tIS, 'ReferencedPatientSetupNumber', '1');
  AddAllData2;
end;

procedure TDDictArray.AddAllData2;
begin
  Add(1092, $300C, $0080, tSQ, 'ReferencedDoseSequence', '1');
  Add(1093, $300C, $00A0, tIS, 'ReferencedToleranceTableNumber', '1');
  Add(1094, $300C, $00B0, tSQ, 'ReferencedBolusSequence', '1');
  Add(1095, $300C, $00C0, tIS, 'ReferencedWedgeNumber', '1');
  Add(1096, $300C, $00D0, tIS, 'ReferencedCompensatorNumber', '1');
  Add(1097, $300C, $00E0, tIS, 'ReferencedBlockNumber', '1');
  Add(1098, $300C, $00F0, tIS, 'ReferencedControlPointIndex', '1');
  Add(1258, $300E, $0000, tUL, 'RTApprovalGroupLength', '1');
  Add(1099, $300E, $0002, tCS, 'ApprovalStatus', '1');
  Add(1100, $300E, $0004, tDA, 'ReviewDate', '1');
  Add(1101, $300E, $0005, tTM, 'ReviewTime', '1');
  Add(1102, $300E, $0008, tPN, 'ReviewerName', '1');
  Add(1103, $4008, $0000, tUL, 'ResultsGroupLength', '1');
  Add(1104, $4008, $0040, tSH, 'ResultsID', '1');
  Add(1105, $4008, $0042, tLO, 'ResultsIDIssuer', '1');
  Add(1106, $4008, $0050, tSQ, 'ReferencedInterpretationSequence', '1');
  Add(1107, $4008, $0100, tDA, 'InterpretationRecordedDate', '1');
  Add(1108, $4008, $0101, tTM, 'InterpretationRecordedTime', '1');
  Add(1109, $4008, $0102, tPN, 'InterpretationRecorder', '1');
  Add(1110, $4008, $0103, tLO, 'ReferenceToRecordedSound', '1');
  Add(1111, $4008, $0108, tDA, 'InterpretationTranscriptionDate', '1');
  Add(1112, $4008, $0109, tTM, 'InterpretationTranscriptionTime', '1');
  Add(1113, $4008, $010A, tPN, 'InterpretationTranscriber', '1');
  Add(1114, $4008, $010B, tST, 'InterpretationText', '1');
  Add(1115, $4008, $010C, tPN, 'InterpretationAuthor', '1');
  Add(1116, $4008, $0111, tSQ, 'InterpretationApproverSequence', '1');
  Add(1117, $4008, $0112, tDA, 'InterpretationApprovalDate', '1');
  Add(1118, $4008, $0113, tTM, 'InterpretationApprovalTime', '1');
  Add(1119, $4008, $0114, tPN, 'PhysicianApprovingInterpretation', '1');
  Add(1120, $4008, $0115, tLT, 'InterpretationDiagnosisDescription', '1');
  Add(1121, $4008, $0117, tSQ, 'DiagnosisCodeSequence', '1');
  Add(1122, $4008, $0118, tSQ, 'ResultsDistributionListSequence', '1');
  Add(1123, $4008, $0119, tPN, 'DistributionName', '1');
  Add(1124, $4008, $011A, tLO, 'DistributionAddress', '1');
  Add(1125, $4008, $0200, tSH, 'InterpretationID', '1');
  Add(1126, $4008, $0202, tLO, 'InterpretationIDIssuer', '1');
  Add(1127, $4008, $0210, tCS, 'InterpretationTypeID', '1');
  Add(1128, $4008, $0212, tCS, 'InterpretationStatusID', '1');
  Add(1129, $4008, $0300, tST, 'Impressions', '1');
  Add(1130, $4008, $4000, tST, 'ResultsComments', '1');
  Add(1131, $5000, $0000, tUL, 'CurveGroupLength', '1');
  Add(1132, $5000, $0005, tUS, 'CurveDimensions', '1');
  Add(1133, $5000, $0010, tUS, 'NumberOfPoints', '1');
  Add(1134, $5000, $0020, tCS, 'TypeOfData', '1');
  Add(1135, $5000, $0022, tLO, 'CurveDescription', '1');
  Add(1136, $5000, $0030, tSH, 'AxisUnits', '1-n');
  Add(1137, $5000, $0040, tSH, 'AxisLabels', '1-n');
  Add(1138, $5000, $0103, tUS, 'DataValueRepresentation', '1');
  Add(1139, $5000, $0104, tUS, 'MinimumCoordinateValue', '1-n');
  Add(1140, $5000, $0105, tUS, 'MaximumCoordinateValue', '1-n');
  Add(1141, $5000, $0106, tSH, 'CurveRange', '1-n');
  Add(1142, $5000, $0110, tUS, 'CurveDataDescriptor', '1');
  Add(1143, $5000, $0112, tUS, 'CoordinateStartValue', '1');
  Add(1144, $5000, $0114, tUS, 'CoordinateStepValue', '1');
  Add(1379, $5000, $1001, tCS, 'CurveActivationLayer', '1');
  Add(1145, $5000, $2000, tUS, 'AudioType', '1');
  Add(1146, $5000, $2002, tUS, 'AudioSampleFormat', '1');
  Add(1147, $5000, $2004, tUS, 'NumberOfChannels', '1');
  Add(1148, $5000, $2006, tUL, 'NumberOfSamples', '1');
  Add(1149, $5000, $2008, tUL, 'SampleRate', '1');
  Add(1150, $5000, $200A, tUL, 'TotalTime', '1');
  Add(1151, $5000, $200C, tOW_OB, 'AudioSampleData', '1');
  Add(1152, $5000, $200E, tLT, 'AudioComments', '1');
  Add(1153, $5000, $2500, tLO, 'CurveLabel', '1');
  Add(1154, $5000, $2600, tSQ, 'CurveReferencedOverlaySequence', '1');
  Add(1155, $5000, $2610, tUS, 'CurveReferencedOverlayGroup', '1');
  Add(1156, $5000, $3000, tOW_OB, 'CurveData', '1');
  Add(1499, $5400, $0100, tSQ, 'WaveformSequence', '1');
  Add(1500, $5400, $0110, tOW_OB, 'ChannelMinimumValue', '1');
  Add(1501, $5400, $0112, tOW_OB, 'ChannelMaximumValue', '1');
  Add(1502, $5400, $1004, tUS, 'WaveformBitsAllocated', '1');
  Add(1503, $5400, $1006, tCS, 'WaveformSampleInterpretation', '1');
  Add(1504, $5400, $100A, tOW_OB, 'WaveformPaddingValue', '1');
  Add(1505, $5400, $1010, tOW_OB, 'WaveformData', '1');

  Add(1157, $6000, $0000, tUL, 'OverlayGroupLength', '1');
  Add(1158, $6000, $0010, tUS, 'OverlayRows', '1');
  Add(1159, $6000, $0011, tUS, 'OverlayColumns', '1');
  Add(1160, $6000, $0012, tUS, 'OverlayPlanes', '1');
  Add(1161, $6000, $0015, tIS, 'OverlayNumberOfFrames', '1');
  Add(1162, $6000, $0022, tLO, 'OverlayDescription', '1');
  Add(1163, $6000, $0040, tCS, 'OverlayType', '1');
  Add(1164, $6000, $0045, tLO, 'OverlaySubtype', '1');
  Add(1165, $6000, $0050, tSS, 'OverlayOrigin', '2');
  Add(1166, $6000, $0051, tUS, 'ImageFrameOrigin', '1');
  Add(1167, $6000, $0052, tUS, 'OverlayPlaneOrigin', '1');
  Add(1168, $6000, $0100, tUS, 'OverlayBitsAllocated', '1');
  Add(1169, $6000, $0102, tUS, 'OverlayBitPosition', '1');
  Add(1380, $6000, $1001, tCS, 'OverlayActivationLayer', '1');
  Add(1170, $6000, $1100, tUS, 'OverlayDescriptorGray', '1');
  Add(1171, $6000, $1101, tUS, 'OverlayDescriptorRed', '1');
  Add(1172, $6000, $1102, tUS, 'OverlayDescriptorGreen', '1');
  Add(1173, $6000, $1103, tUS, 'OverlayDescriptorBlue', '1');
  Add(1174, $6000, $1200, tUS, 'OverlayGray', '1-n');
  Add(1175, $6000, $1201, tUS, 'OverlayRed', '1-n');
  Add(1176, $6000, $1202, tUS, 'OverlayGreen', '1-n');
  Add(1177, $6000, $1203, tUS, 'OverlayBlue', '1-n');
  Add(1178, $6000, $1301, tIS, 'ROIArea', '1');
  Add(1179, $6000, $1302, tDS, 'ROIMean', '1');
  Add(1180, $6000, $1303, tDS, 'ROIStandardDeviation', '1');
  Add(1181, $6000, $1500, tLO, 'OverlayLabel', '1');
  Add(1182, $6000, $3000, tOW, 'OverlayData', '1');

  Append($6002, $0000, tUL, 'OverlayGroupLength', '1');
  Append($6002, $0010, tUS, 'OverlayRows', '1');
  Append($6002, $0011, tUS, 'OverlayColumns', '1');
  Append($6002, $0012, tUS, 'OverlayPlanes', '1');
  Append($6002, $0015, tIS, 'OverlayNumberOfFrames', '1');
  Append($6002, $0022, tLO, 'OverlayDescription', '1');
  Append($6002, $0040, tCS, 'OverlayType', '1');
  Append($6002, $0045, tLO, 'OverlaySubtype', '1');
  Append($6002, $0050, tSS, 'OverlayOrigin', '2');
  Append($6002, $0051, tUS, 'ImageFrameOrigin', '1');
  Append($6002, $0052, tUS, 'OverlayPlaneOrigin', '1');
  Append($6002, $0100, tUS, 'OverlayBitsAllocated', '1');
  Append($6002, $0102, tUS, 'OverlayBitPosition', '1');
  Append($6002, $1001, tCS, 'OverlayActivationLayer', '1');
  Append($6002, $1100, tUS, 'OverlayDescriptorGray', '1');
  Append($6002, $1101, tUS, 'OverlayDescriptorRed', '1');
  Append($6002, $1102, tUS, 'OverlayDescriptorGreen', '1');
  Append($6002, $1103, tUS, 'OverlayDescriptorBlue', '1');
  Append($6002, $1200, tUS, 'OverlayGray', '1-n');
  Append($6002, $1201, tUS, 'OverlayRed', '1-n');
  Append($6002, $1202, tUS, 'OverlayGreen', '1-n');
  Append($6002, $1203, tUS, 'OverlayBlue', '1-n');
  Append($6002, $1301, tIS, 'ROIArea', '1');
  Append($6002, $1302, tDS, 'ROIMean', '1');
  Append($6002, $1303, tDS, 'ROIStandardDeviation', '1');
  Append($6002, $1500, tLO, 'OverlayLabel', '1');
  Append($6002, $3000, tOW, 'OverlayData', '1');

  Append($6004, $0000, tUL, 'OverlayGroupLength', '1');
  Append($6004, $0010, tUS, 'OverlayRows', '1');
  Append($6004, $0011, tUS, 'OverlayColumns', '1');
  Append($6004, $0012, tUS, 'OverlayPlanes', '1');
  Append($6004, $0015, tIS, 'OverlayNumberOfFrames', '1');
  Append($6004, $0022, tLO, 'OverlayDescription', '1');
  Append($6004, $0040, tCS, 'OverlayType', '1');
  Append($6004, $0045, tLO, 'OverlaySubtype', '1');
  Append($6004, $0050, tSS, 'OverlayOrigin', '2');
  Append($6004, $0051, tUS, 'ImageFrameOrigin', '1');
  Append($6004, $0052, tUS, 'OverlayPlaneOrigin', '1');
  Append($6004, $0100, tUS, 'OverlayBitsAllocated', '1');
  Append($6004, $0102, tUS, 'OverlayBitPosition', '1');
  Append($6004, $1001, tCS, 'OverlayActivationLayer', '1');
  Append($6004, $1100, tUS, 'OverlayDescriptorGray', '1');
  Append($6004, $1101, tUS, 'OverlayDescriptorRed', '1');
  Append($6004, $1102, tUS, 'OverlayDescriptorGreen', '1');
  Append($6004, $1103, tUS, 'OverlayDescriptorBlue', '1');
  Append($6004, $1200, tUS, 'OverlayGray', '1-n');
  Append($6004, $1201, tUS, 'OverlayRed', '1-n');
  Append($6004, $1202, tUS, 'OverlayGreen', '1-n');
  Append($6004, $1203, tUS, 'OverlayBlue', '1-n');
  Append($6004, $1301, tIS, 'ROIArea', '1');
  Append($6004, $1302, tDS, 'ROIMean', '1');
  Append($6004, $1303, tDS, 'ROIStandardDeviation', '1');
  Append($6004, $1500, tLO, 'OverlayLabel', '1');
  Append($6004, $3000, tOW, 'OverlayData', '1');

  Append($6006, $0000, tUL, 'OverlayGroupLength', '1');
  Append($6006, $0010, tUS, 'OverlayRows', '1');
  Append($6006, $0011, tUS, 'OverlayColumns', '1');
  Append($6006, $0012, tUS, 'OverlayPlanes', '1');
  Append($6006, $0015, tIS, 'OverlayNumberOfFrames', '1');
  Append($6006, $0022, tLO, 'OverlayDescription', '1');
  Append($6006, $0040, tCS, 'OverlayType', '1');
  Append($6006, $0045, tLO, 'OverlaySubtype', '1');
  Append($6006, $0050, tSS, 'OverlayOrigin', '2');
  Append($6006, $0051, tUS, 'ImageFrameOrigin', '1');
  Append($6006, $0052, tUS, 'OverlayPlaneOrigin', '1');
  Append($6006, $0100, tUS, 'OverlayBitsAllocated', '1');
  Append($6006, $0102, tUS, 'OverlayBitPosition', '1');
  Append($6006, $1001, tCS, 'OverlayActivationLayer', '1');
  Append($6006, $1100, tUS, 'OverlayDescriptorGray', '1');
  Append($6006, $1101, tUS, 'OverlayDescriptorRed', '1');
  Append($6006, $1102, tUS, 'OverlayDescriptorGreen', '1');
  Append($6006, $1103, tUS, 'OverlayDescriptorBlue', '1');
  Append($6006, $1200, tUS, 'OverlayGray', '1-n');
  Append($6006, $1201, tUS, 'OverlayRed', '1-n');
  Append($6006, $1202, tUS, 'OverlayGreen', '1-n');
  Append($6006, $1203, tUS, 'OverlayBlue', '1-n');
  Append($6006, $1301, tIS, 'ROIArea', '1');
  Append($6006, $1302, tDS, 'ROIMean', '1');
  Append($6006, $1303, tDS, 'ROIStandardDeviation', '1');
  Append($6006, $1500, tLO, 'OverlayLabel', '1');
  Append($6006, $3000, tOW, 'OverlayData', '1');

  Append($6008, $0000, tUL, 'OverlayGroupLength', '1');
  Append($6008, $0010, tUS, 'OverlayRows', '1');
  Append($6008, $0011, tUS, 'OverlayColumns', '1');
  Append($6008, $0012, tUS, 'OverlayPlanes', '1');
  Append($6008, $0015, tIS, 'OverlayNumberOfFrames', '1');
  Append($6008, $0022, tLO, 'OverlayDescription', '1');
  Append($6008, $0040, tCS, 'OverlayType', '1');
  Append($6008, $0045, tLO, 'OverlaySubtype', '1');
  Append($6008, $0050, tSS, 'OverlayOrigin', '2');
  Append($6008, $0051, tUS, 'ImageFrameOrigin', '1');
  Append($6008, $0052, tUS, 'OverlayPlaneOrigin', '1');
  Append($6008, $0100, tUS, 'OverlayBitsAllocated', '1');
  Append($6008, $0102, tUS, 'OverlayBitPosition', '1');
  Append($6008, $1001, tCS, 'OverlayActivationLayer', '1');
  Append($6008, $1100, tUS, 'OverlayDescriptorGray', '1');
  Append($6008, $1101, tUS, 'OverlayDescriptorRed', '1');
  Append($6008, $1102, tUS, 'OverlayDescriptorGreen', '1');
  Append($6008, $1103, tUS, 'OverlayDescriptorBlue', '1');
  Append($6008, $1200, tUS, 'OverlayGray', '1-n');
  Append($6008, $1201, tUS, 'OverlayRed', '1-n');
  Append($6008, $1202, tUS, 'OverlayGreen', '1-n');
  Append($6008, $1203, tUS, 'OverlayBlue', '1-n');
  Append($6008, $1301, tIS, 'ROIArea', '1');
  Append($6008, $1302, tDS, 'ROIMean', '1');
  Append($6008, $1303, tDS, 'ROIStandardDeviation', '1');
  Append($6008, $1500, tLO, 'OverlayLabel', '1');
  Append($6008, $3000, tOW, 'OverlayData', '1');

  Append($6010, $0000, tUL, 'OverlayGroupLength', '1');
  Append($6010, $0010, tUS, 'OverlayRows', '1');
  Append($6010, $0011, tUS, 'OverlayColumns', '1');
  Append($6010, $0012, tUS, 'OverlayPlanes', '1');
  Append($6010, $0015, tIS, 'OverlayNumberOfFrames', '1');
  Append($6010, $0022, tLO, 'OverlayDescription', '1');
  Append($6010, $0040, tCS, 'OverlayType', '1');
  Append($6010, $0045, tLO, 'OverlaySubtype', '1');
  Append($6010, $0050, tSS, 'OverlayOrigin', '2');
  Append($6010, $0051, tUS, 'ImageFrameOrigin', '1');
  Append($6010, $0052, tUS, 'OverlayPlaneOrigin', '1');
  Append($6010, $0100, tUS, 'OverlayBitsAllocated', '1');
  Append($6010, $0102, tUS, 'OverlayBitPosition', '1');
  Append($6010, $1001, tCS, 'OverlayActivationLayer', '1');
  Append($6010, $1100, tUS, 'OverlayDescriptorGray', '1');
  Append($6010, $1101, tUS, 'OverlayDescriptorRed', '1');
  Append($6010, $1102, tUS, 'OverlayDescriptorGreen', '1');
  Append($6010, $1103, tUS, 'OverlayDescriptorBlue', '1');
  Append($6010, $1200, tUS, 'OverlayGray', '1-n');
  Append($6010, $1201, tUS, 'OverlayRed', '1-n');
  Append($6010, $1202, tUS, 'OverlayGreen', '1-n');
  Append($6010, $1203, tUS, 'OverlayBlue', '1-n');
  Append($6010, $1301, tIS, 'ROIArea', '1');
  Append($6010, $1302, tDS, 'ROIMean', '1');
  Append($6010, $1303, tDS, 'ROIStandardDeviation', '1');
  Append($6010, $1500, tLO, 'OverlayLabel', '1');
  Append($6010, $3000, tOW, 'OverlayData', '1');

  Append($6012, $0000, tUL, 'OverlayGroupLength', '1');
  Append($6012, $0010, tUS, 'OverlayRows', '1');
  Append($6012, $0011, tUS, 'OverlayColumns', '1');
  Append($6012, $0012, tUS, 'OverlayPlanes', '1');
  Append($6012, $0015, tIS, 'OverlayNumberOfFrames', '1');
  Append($6012, $0022, tLO, 'OverlayDescription', '1');
  Append($6012, $0040, tCS, 'OverlayType', '1');
  Append($6012, $0045, tLO, 'OverlaySubtype', '1');
  Append($6012, $0050, tSS, 'OverlayOrigin', '2');
  Append($6012, $0051, tUS, 'ImageFrameOrigin', '1');
  Append($6012, $0052, tUS, 'OverlayPlaneOrigin', '1');
  Append($6012, $0100, tUS, 'OverlayBitsAllocated', '1');
  Append($6012, $0102, tUS, 'OverlayBitPosition', '1');
  Append($6012, $1001, tCS, 'OverlayActivationLayer', '1');
  Append($6012, $1100, tUS, 'OverlayDescriptorGray', '1');
  Append($6012, $1101, tUS, 'OverlayDescriptorRed', '1');
  Append($6012, $1102, tUS, 'OverlayDescriptorGreen', '1');
  Append($6012, $1103, tUS, 'OverlayDescriptorBlue', '1');
  Append($6012, $1200, tUS, 'OverlayGray', '1-n');
  Append($6012, $1201, tUS, 'OverlayRed', '1-n');
  Append($6012, $1202, tUS, 'OverlayGreen', '1-n');
  Append($6012, $1203, tUS, 'OverlayBlue', '1-n');
  Append($6012, $1301, tIS, 'ROIArea', '1');
  Append($6012, $1302, tDS, 'ROIMean', '1');
  Append($6012, $1303, tDS, 'ROIStandardDeviation', '1');
  Append($6012, $1500, tLO, 'OverlayLabel', '1');
  Append($6012, $3000, tOW, 'OverlayData', '1');

  Append($6014, $0000, tUL, 'OverlayGroupLength', '1');
  Append($6014, $0010, tUS, 'OverlayRows', '1');
  Append($6014, $0011, tUS, 'OverlayColumns', '1');
  Append($6014, $0012, tUS, 'OverlayPlanes', '1');
  Append($6014, $0015, tIS, 'OverlayNumberOfFrames', '1');
  Append($6014, $0022, tLO, 'OverlayDescription', '1');
  Append($6014, $0040, tCS, 'OverlayType', '1');
  Append($6014, $0045, tLO, 'OverlaySubtype', '1');
  Append($6014, $0050, tSS, 'OverlayOrigin', '2');
  Append($6014, $0051, tUS, 'ImageFrameOrigin', '1');
  Append($6014, $0052, tUS, 'OverlayPlaneOrigin', '1');
  Append($6014, $0100, tUS, 'OverlayBitsAllocated', '1');
  Append($6014, $0102, tUS, 'OverlayBitPosition', '1');
  Append($6014, $1001, tCS, 'OverlayActivationLayer', '1');
  Append($6014, $1100, tUS, 'OverlayDescriptorGray', '1');
  Append($6014, $1101, tUS, 'OverlayDescriptorRed', '1');
  Append($6014, $1102, tUS, 'OverlayDescriptorGreen', '1');
  Append($6014, $1103, tUS, 'OverlayDescriptorBlue', '1');
  Append($6014, $1200, tUS, 'OverlayGray', '1-n');
  Append($6014, $1201, tUS, 'OverlayRed', '1-n');
  Append($6014, $1202, tUS, 'OverlayGreen', '1-n');
  Append($6014, $1203, tUS, 'OverlayBlue', '1-n');
  Append($6014, $1301, tIS, 'ROIArea', '1');
  Append($6014, $1302, tDS, 'ROIMean', '1');
  Append($6014, $1303, tDS, 'ROIStandardDeviation', '1');
  Append($6014, $1500, tLO, 'OverlayLabel', '1');
  Append($6014, $3000, tOW, 'OverlayData', '1');

  Add(1183, $7FE0, $0000, tUL, 'PixelDataGroupLength', '1');
  Add(1184, $7FE0, $0010, tOW_OB, 'PixelData', '1');
  Add(1185, $FFFC, $FFFC, tOB, 'DataSetTrailingPadding', '1');
  Add(1186, $FFFE, $E000, tNONE, 'Item', '1');
  Add(1187, $FFFE, $E00D, tNONE, 'ItemDelimitationItem', '1');
  Add(1188, $FFFE, $E0DD, tNONE, 'SequenceDelimitationItem', '1');
  //  Add(1189, $FFFF, $FFFF, tUNKNOWN, 'Undefined', '1');

  Append($42, $10, tCS, 'TitleDocument', '1');   // 2
  Append($42, $11, tOW_OB, 'DocumentStream', '1');  // 1
  Append($42, $12, tCS, 'TypeDocument', '1');    // 1


end; //end of F_

initialization
  DDict := TDDictArray.Create;
  UnknowEntry := TDDictEntry.Create($FFFF, $FFFF, tUNKNOWN, 'Unknow Item', '1');
  GroupLengthEntry := TDDictEntry.Create($FFFF, $0, tUL, 'Group Length Item', '1');

  DType := TDicomTypeArray.Create;
  UnknowType := TDicomTypeItem.Create('UN', tUNKNOWN);

  DDict.Append($0020, $3401, tLO, '1', 'ModifyingDeviceID');
  DDict.Append($0020, $3402, tLO, '1', 'ModifiedImageID');
  DDict.Append($0020, $3403, tDA, '1', 'ModifiedImageDate');
  DDict.Append($0020, $3404, tLO, '1', 'ModifyingDeviceManufacturer');
  DDict.Append($0020, $3405, tTM, '1', 'ModifiedImageTime');
  DDict.Append($0020, $3406, tLT, '1', 'ModifiedImageDescription');
  DDict.Append($0020, $5000, tAT, '1-n', 'OriginalImageIdentification');
  DDict.Append($0020, $5002, tLO, '1-n', 'OriginalImageIdentificationNomenclature');
  DDict.Append($0020, $0030, tDS, '3', 'ImagePosition');
  DDict.Append($0020, $0035, tDS, '6', 'ImageOrientation');
  DDict.Append($0020, $0050, tDS, '1', 'Location');
  DDict.Append($0020, $0052, tUI, '1', 'FrameofReferenceUID');
  DDict.Append($0020, $0060, tCS, '1', 'Laterality');
  DDict.Append($0020, $0070, tLT, '1', 'ImageGeometryType');
  DDict.Append($0020, $0080, tLO, '1-n', 'MaskingImage');
  DDict.Append($0028, $0040, tLO, '1', 'ImageFormat');
  DDict.Append($0028, $0050, tLT, '1-n', 'ManipulatedImage');

  DDict.Append($0021, $1011, tDS, '1', 'SiemensData');
  DDict.Append($0021, $1120, tDS, '1', 'SiemensData');
  DDict.Append($0021, $10, tLO, '1', 'SiemensData');

  DDict.Append($0021, $1010, tDS, '1', 'SiemensData');
  DDict.Append($0021, $1122, tDS, '1', 'SiemensData');
  DDict.Append($0021, $1124, tDS, '1', 'SiemensData');
  DDict.Append($0021, $1160, tDS, '1', 'SiemensData');
  DDict.Append($0021, $1161, tDS, '1', 'SiemensData');
  DDict.Append($0021, $1163, tDS, '1', 'SiemensData');
  DDict.Append($0021, $116A, tDS, '1', 'SiemensData');
  DDict.Append($0021, $116B, tDS, '1', 'SiemensData');
  DDict.Append($0021, $1210, tDS, '1', 'SiemensData');
  DDict.Append($0021, $1211, tDS, '1', 'SiemensData');
  DDict.Append($0021, $1232, tDS, '1', 'SiemensData');
  DDict.Append($0021, $1240, tDS, '1', 'SiemensData');
  DDict.Append($0021, $12A0, tDS, '1', 'SiemensData');

  //  DDict.Append($0019, $1010, tIS, '1', 'SiemensData');
  DDict.Append($0019, $1060, tIS, '1', 'SiemensData');
  DDict.Append($0019, $1120, tIS, '1', 'SiemensData');
  DDict.Append($0019, $1121, tIS, '1', 'SiemensData');
  DDict.Append($0019, $1162, tIS, '1', 'SiemensData');
  DDict.Append($0019, $1170, tIS, '1', 'SiemensData');
  DDict.Append($0019, $1174, tIS, '1', 'SiemensData');
  DDict.Append($0019, $1175, tIS, '1', 'SiemensData');
  DDict.Append($0019, $1188, tIS, '1', 'SiemensData');
  DDict.Append($0019, $1310, tIS, '1', 'SiemensData');
  DDict.Append($0019, $1311, tIS, '1', 'SiemensData');
  DDict.Append($0019, $1320, tIS, '1', 'SiemensData');
  DDict.Append($0019, $1321, tIS, '1', 'SiemensData');

  DDict.Append($0019, $1322, tDS, '1', 'SiemensData');
  DDict.Append($0019, $1323, tDS, '1', 'SiemensData');
  DDict.Append($0019, $1324, tDS, '1', 'SiemensData');
  DDict.Append($0019, $1352, tDS, '1', 'SiemensData');
  DDict.Append($0019, $1354, tDS, '1', 'SiemensData');

  DDict.Append($0019, $1380, tCS, '1', 'SiemensData');
  DDict.Append($0019, $1382, tCS, '1', 'SiemensData');

  DDict.Append($0019, $1392, tDS, '1', 'SiemensData');
  DDict.Append($0019, $1393, tDS, '1', 'SiemensData');
  DDict.Append($0019, $1394, tIS, '1', 'SiemensData');
  DDict.Append($0019, $13A0, tDS, '1', 'SiemensData');
  DDict.Append($0019, $13A1, tDS, '1', 'SiemensData');
  DDict.Append($0019, $13A4, tDS, '1', 'SiemensData');
  DDict.Append($0019, $13A5, tDS, '1', 'SiemensData');

  DDict.Append($0019, $13A9, tDS, '1', 'SiemensData');
  DDict.Append($0019, $13AA, tCS, '1', 'SiemensData');

  DDict.Append($0019, $13AB, tIS, '1', 'SiemensData');
  DDict.Append($0019, $13AC, tIS, '1', 'SiemensData');
  DDict.Append($0019, $13AD, tIS, '1', 'SiemensData');
  DDict.Append($0019, $13AE, tIS, '1', 'SiemensData');
  DDict.Append($0019, $13AF, tDS, '1', 'SiemensData');
  DDict.Append($0019, $13B0, tDS, '1', 'SiemensData');
  DDict.Append($0019, $13C0, tDS, '1', 'SiemensData');
  DDict.Append($0019, $13C1, tDS, '1', 'SiemensData');

  DDict.Append($0019, $13C5, tCS, '1', 'SiemensData');

  DDict.Append($0019, $10, tLO, '1', 'SiemensData');
  DDict.Append($0019, $11, tCS, '1', 'SiemensData');
  DDict.Append($0019, $13, tCS, '1', 'SiemensData');
  DDict.Append($0019, $15, tCS, '1', 'SiemensData');

  DDict.Append($0011, $10, tCS, '1', 'SiemensData');
  DDict.Append($0011, $11, tCS, '1', 'SiemensData');
  DDict.Append($0011, $12, tCS, '1', 'SiemensData');
  DDict.Append($0011, $1010, tCS, '1', 'SiemensData');

  DDict.Append($0028, $0104, tUS_SS, '1', 'SmallestValidPixelValue');
  DDict.Append($0028, $0105, tUS_SS, '1', 'LargestValidPixelValue');
  DDict.Append($0028, $0060, tLO, '1', 'CompressionCode');
  DDict.Append($0028, $005F, tLO, '1', 'CompressionRecognitionCode');
  DDict.Append($0028, $0060, tLO, '1', 'CompressionCode');
  DDict.Append($0028, $0061, tSH, '1', 'CompressionOriginator');
  DDict.Append($0028, $0062, tSH, '1', 'CompressionLabel');
  DDict.Append($0028, $0063, tSH, '1', 'CompressionDescription');
  DDict.Append($0028, $0065, tLO, '1-n', 'CompressionSequence');
  DDict.Append($0028, $0066, tAT, '1-n', 'CompressionStepPointers');
  DDict.Append($0028, $0068, tUS, '1', 'RepeatInterval');
  DDict.Append($0028, $0069, tUS, '1', 'BitsGrouped');
  DDict.Append($0028, $0070, tUS, '1-n', 'PerimeterTable');
  DDict.Append($0028, $0071, tUS_SS, '1', 'PerimeterValue');
  DDict.Append($0028, $0080, tUS, '1', 'PredictorRows');
  DDict.Append($0028, $0081, tUS, '1', 'PredictorColumns');
  DDict.Append($0028, $0082, tUS, '1-n', 'PredictorConstants');
  DDict.Append($0028, $0090, tLO, '1', 'BlockedPixels');
  DDict.Append($0028, $0091, tUS, '1', 'BlockRows');
  DDict.Append($0028, $0092, tUS, '1', 'BlockColumns');
  DDict.Append($0028, $0093, tUS, '1', 'RowOverlap');
  DDict.Append($0028, $0094, tUS, '1', 'ColumnOverlap');
  DDict.Append($0028, $0200, tUS, '1', 'ImageLocation');
  DDict.Append($0028, $0400, tLO, '1', 'TransformLabel');
  DDict.Append($0028, $0401, tLO, '1', 'TransformVersionNumber');
  DDict.Append($0028, $0402, tUS, '1', 'NumberOfTransformSteps');
  DDict.Append($0028, $0403, tLO, '1-n', 'SequenceOfCompressed Data');
  DDict.Append($0028, $0404, tAT, '1-n', 'DetailsOfCoefficients');
  DDict.Append($0028, $0700, tLO, '1', 'DCTLabel');
  DDict.Append($0028, $0701, tLO, '1-n', 'DataBlockDescription');
  DDict.Append($0028, $0702, tAT, '1-n', 'DataBlock');
  DDict.Append($0028, $0710, tUS, '1', 'NormalizationFactorFormat');
  DDict.Append($0028, $0720, tUS, '1', 'ZonalMapNumberFormat');
  DDict.Append($0028, $0721, tAT, '1-n', 'ZonalMapLocation');
  DDict.Append($0028, $0722, tUS, '1', 'ZonalMapFormat');
  DDict.Append($0028, $0730, tUS, '1', 'AdaptiveMapFormat');
  DDict.Append($0028, $0740, tUS, '1', 'CodeNumberFormat');
  DDict.Append($0008, $0010, tLO, '1', 'RecognitionCode');

  //For DBService
  DDict.Append($2809, $0001, tPN, '1', 'FunctionCode');
  DDict.Append($2809, $0002, tPN, '1', 'DBLinkName');
  DDict.Append($2809, $0003, tUT, '1', 'SQLString');
  DDict.Append($2809, $0004, tPN, '1', 'FileDirectory');

  DDict.Append($2809, $0005, tPN, '1', 'UserName');
  DDict.Append($2809, $0006, tPN, '1', 'UserPassword');
  DDict.Append($2809, $0007, tUT, '1', 'ProfileNames');

  DDict.Append($2809, $0008, tPN, '1', 'ClientApplicationName');
  DDict.Append($2809, $0009, tDS, '1', 'ClientApplicationVersion');

  DDict.Append($2809, $000A, tPN, '1', 'SelectedProfileName');
  DDict.Append($2809, $000B, tPN, '1', 'SelectedStareName');
  DDict.Append($2809, $000C, tUT, '1', 'WhereSQL');
  DDict.Append($2809, $000D, tPN, '1', 'StorageProcdureName');
  DDict.Append($2809, $000E, tPN, '1', 'ParamName');
  DDict.Append($2809, $000F, tPN, '1', 'ParamValue');

  DDict.Append($2809, $0010, tPN, '1', 'CommonParamiter');

  DDict.Append($2809, $0011, tIS, '1', 'FieldCount');
  DDict.Append($2809, $0012, tIS, '1', 'RecordCount');
  DDict.Append($2809, $0013, tSQ, '1-n', 'RecordSequence');
  DDict.Append($2809, $0014, tSQ, '1-n', 'FieldSequence');
  DDict.Append($2809, $0015, tUT, '1', 'Scripter');
  DDict.Append($2809, $0016, tUT, '1', 'TaskDefine');

  DDict.Append($2809, $0017, tPN, '1', 'FileName');
  DDict.Append($2809, $0018, tDT, '1', 'ServerDatetime');

  DDict.Append($2809, $0019, tUT, '1', 'UserGroup');
  DDict.Append($2809, $001A, tUT, '1', 'AnalyzeScripter');
  DDict.Append($2809, $001B, tIS, '1', 'ImageIsSelected0');
  DDict.Append($2809, $001C, tUT, '1', 'ImageSelectedFlag');
  DDict.Append($2809, $001D, tIS, '1', 'ImageIsSelected1');
  DDict.Append($2809, $001E, tIS, '1', 'ImageIsSelected2');
  DDict.Append($2809, $001F, tIS, '1', 'ImageIsSelected3');
  DDict.Append($2809, $2000, tIS, '1', 'LAST_WINDOWS_CENTER');
  DDict.Append($2809, $2001, tIS, '1', 'LAST_WINDOWS_WIDTH');
  DDict.Append($2809, $2002, tOB, '1', 'Icon Data');

  DDict.Append($2006, $0001, tOB, '1', 'DicomVCL private tag image');  //  tSS  tLO

  DDict.Append($2809, $0020, tIS, '1', 'IntegerValue');
  DDict.Append($2809, $0021, tDS, '1', 'DecimalValue');
  DDict.Append($2809, $0022, tPN, '1', 'StringValue');
  DDict.Append($2809, $0023, tUT, '1', 'MemoValue');
  DDict.Append($2809, $0024, tOB, '1', 'BlobValue');
  DDict.Append($2809, $0025, tDT, '1', 'DatetimeValue');
  DDict.Append($2809, $0026, tDA, '1', 'DateValue');
  DDict.Append($2809, $0027, tTM, '1', 'TimeValue');
  DDict.Append($2809, $0028, tPN, '1', 'FieldName');

  DDict.Append($2809, $0029, tIS, '1', 'FetchCount/ParamDataType');
  DDict.Append($2809, $002A, tSQ, '1-n', 'ParamSequence');
  DDict.Append($2809, $002B, tSQ, '1-n', 'CommitSequence');

  DDict.Append($2809, $002C, tIS, '1', 'ServerDatabaseType');

  DDict.Append($2809, $2021, tUT, '1', 'BlobValue');
  DDict.Append($2809, $2022, tUT, '1', 'BlobValue');
  DDict.Append($2809, $2023, tUT, '1', 'BlobValue');
  DDict.Append($2809, $2024, tUT, '1', 'BlobValue');
  DDict.Append($2809, $2025, tUT, '1', 'BlobValue');
  DDict.Append($2809, $2026, tUT, '1', 'BlobValue');
  DDict.Append($2809, $2027, tUT, '1', 'BlobValue');
  DDict.Append($2809, $2028, tUT, '1', 'BlobValue');

  DDict.Append($2809, $0030, tPN, '1', 'ISGROUPER');
  DDict.Append($2809, $0031, tPN, '1', 'ISSYSDBA');
  DDict.Append($2809, $0032, tPN, '1', 'NAME');
  DDict.Append($2809, $0033, tPN, '1', 'USERCLASS');
  DDict.Append($2809, $0034, tUT, '1', 'LIMIT');
  DDict.Append($2809, $0035, tUT, '1', 'OWNERUSER');
  DDict.Append($2809, $0036, tUT, '1', 'UserPemitTask');
  DDict.Append($2809, $0037, tUT, '1', 'UserGroups');

  DDict.Append($2809, $0038, tPN, '1', 'ISSYSDBA1');
  DDict.Append($2809, $0039, tPN, '1', 'ISSYSDBA2');
  DDict.Append($2809, $003A, tPN, '1', 'ISSYSDBA3');
  DDict.Append($2809, $003B, tPN, '1', 'ISSYSDBA4');
  DDict.Append($2809, $003C, tPN, '1', 'ISSYSDBA4');
  DDict.Append($2809, $003D, tPN, '1', 'LIMIT1');
  DDict.Append($2809, $003E, tPN, '1', 'LIMIT2');
  DDict.Append($2809, $003F, tPN, '1', 'LIMIT3');
  DDict.Append($2809, $0040, tPN, '1', 'LIMIT4');
  DDict.Append($2809, $0041, tPN, '1', 'LIMIT5');
  DDict.Append($2809, $0042, tPN, '1', 'LIMIT6');
  DDict.Append($2809, $0043, tPN, '1', 'LIMIT7');
  DDict.Append($2809, $0044, tPN, '1', 'LIMIT8');

  DDict.Append($2809, $0045, tUT, '1', 'Shortcut List');

  DDict.Append($2809, $0800, tIS, '1', 'MousePosX');
  DDict.Append($2809, $0801, tIS, '1', 'MousePosY');
  DDict.Append($2809, $0802, tPN, '1', 'KeyString');

  DDict.Append($2809, $1001, tOB, '1', 'FileStream');
  DDict.Append($2809, $1002, tOB, '1', 'DatasetStream');
  DDict.Append($2809, $1003, tUT, '1', 'OperationMessage');
  DDict.Append($2809, $1004, tIS, '1', 'DBOperationResult');
  DDict.Append($2809, $1005, tIS, '1', 'NeedSendStructure');
  DDict.Append($2809, $1006, tUI, '1', 'DatasetStreamFormat');

  DDict.Append($2809, $3001, tPN, '1', 'ProfileName');

  DDict.Append($2811, $0001, tPN, '1', 'LabMothedCode');
  DDict.Append($2811, $0002, tPN, '1', 'LabMothedName');
  DDict.Append($2811, $0003, tDS, '1', 'LabMothedNormalLowRange');
  DDict.Append($2811, $0004, tDS, '1', 'LabMothedNormalHighRange');
  DDict.Append($2811, $0005, tPN, '1', 'LabMothedAbout');
  DDict.Append($2811, $0006, tPN, '1', 'LabMothedCompareValue');
  DDict.Append($2811, $0007, tPN, '1', 'LabMothedResult');
  DDict.Append($2811, $0008, tPN, '1', 'LabMothedPickList');
  DDict.Append($2811, $0009, tPN, '1', 'LabMothedUnit');
  DDict.Append($2811, $000A, tPN, '1', 'LabMothedLastResult');

  DDict.Append($2811, $0100, tSQ, '1-n', 'LabMothedResultSequence');
  DDict.Append($2811, $0010, tOB, '1', 'BloodWBCGraphics');
  DDict.Append($2811, $0011, tOB, '1', 'BloodRBCGraphics');
  DDict.Append($2811, $0012, tOB, '1', 'BloodPLTGraphics');
  DDict.Append($2811, $0013, tOB, '1', 'BloodWBXGraphics');
  DDict.Append($2811, $0014, tUT, '1', 'LabAbout');
  DDict.Append($2811, $0015, tUT, '1', 'LabAbout1');
  DDict.Append($2811, $0016, tCS, '1', 'ModilityWordClass');

  DDict.Append($2811, $0200, tSQ, '1-n', 'QCResultSequence');
  DDict.Append($2811, $0201, tPN, '1', 'QCMothedCode');
  DDict.Append($2811, $0202, tPN, '1', 'QCMothedname');
  DDict.Append($2811, $0203, tDS, '1', 'QC_X_1');
  DDict.Append($2811, $0204, tDS, '1', 'QC_SD_1');
  DDict.Append($2811, $0205, tDS, '1', 'QC_X_2');
  DDict.Append($2811, $0206, tDS, '1', 'QC_SD_2');
  DDict.Append($2811, $0207, tDS, '1', 'QC_X_3');
  DDict.Append($2811, $0208, tDS, '1', 'QC_SD_3');
  DDict.Append($2811, $0209, tDT, '1', 'QCDate');
  DDict.Append($2811, $020A, tDS, '1', 'QCResult');
  DDict.Append($2811, $020B, tPN, '1', 'QCBatNo');
  DDict.Append($2811, $020C, tPN, '1', 'QCSeries');

  DDict.Append($2811, $020D, tIS, '1', 'GraphicsSign');
  DDict.Append($2811, $020E, tIS, '1', 'PosX');
  DDict.Append($2811, $020F, tIS, '1', 'PosY');
  {  DDict.Append($2811, $0210, tPN, '1', '');
    DDict.Append($2811, $0211, tPN, '1', '');
    DDict.Append($2811, $0212, tPN, '1', '');
  }
  DDict.Append($2811, $7000, tPN, '1', '');
  DDict.Append($2811, $7001, tUT, '1', '');

  DDict.Append($2813, $1, tUL, '1', '');
  DDict.Append($2813, $2, tUI, '1', '');
  DDict.Append($2813, $3, tUS, '1', '');
  DDict.Append($2813, $4, tDA, '1', '');
  DDict.Append($2813, $5, tTM, '1', '');
  DDict.Append($2813, $6, tIS, '1', '');
  DDict.Append($2813, $7, tDS, '1', '');
  DDict.Append($2813, $8, tPN, '1', '');

  DDict.Append($2815, $1, tSQ, '1-n', 'VObject');
  DDict.Append($2815, $2, tIS, '1', 'VObjectItemX');
  DDict.Append($2815, $3, tIS, '1', 'VObjectItemY');
  DDict.Append($2815, $4, tIS, '1', 'VObjectCount');
  DDict.Append($2815, $5, tIS, '1', 'VObjectBeginShape');
  DDict.Append($2815, $6, tIS, '1', 'VObjectEndShape');
  DDict.Append($2815, $7, tIS, '1', 'VObjectShapeWidth');
  DDict.Append($2815, $8, tIS, '1', 'VObjectShapeHeight');
  DDict.Append($2815, $9, tUT, '1', 'VObjectText');
  DDict.Append($2815, $A, tIS, '1', 'VObjectKind');
  //  DDict.Append($2815, $B, tIS, '1', '');
  //  DDict.Append($2815, $C, tIS, '1', '');
  //  DDict.Append($2815, $D, tIS, '1', '');

  DDict.Append($2813, $0100, tSQ, '1-n', 'DatasetFieldDefines');
  DDict.Append($2813, $0101, tPN, '1', 'DatasetFieldName');
  DDict.Append($2813, $0102, tUI, '1', 'DatasetFieldDataType');
  DDict.Append($2813, $0103, tUI, '1', 'DatasetFieldDataSize');
  DDict.Append($2813, $0104, tUI, '1', 'DatasetFieldIndex');
  DDict.Append($2813, $0105, tUI, '1', 'DatasetFieldReqire');

  DDict.Append($2813, $0110, tSQ, '1-n', 'DatasetSendImage');
  DDict.Append($2813, $0111, tSQ, '1-n', 'DatasetQueryImage');
  DDict.Append($2813, $0112, tSQ, '1-n', 'DatasetMRequest');

  DDict.Append($2813, $0120, tIS, '1', 'IntegerValue');
  DDict.Append($2813, $0121, tFD, '1', 'DecimalValue');
  DDict.Append($2813, $0122, tPN, '1', 'StringValue');
  DDict.Append($2813, $0123, tUT, '1', 'MemoValue');
  DDict.Append($2813, $0124, tOB, '1', 'BlobValue');
  DDict.Append($2813, $0125, tDT, '1', 'DatetimeValue');
  DDict.Append($2813, $0126, tDA, '1', 'DateValue');
  DDict.Append($2813, $0127, tTM, '1', 'TimeValue');

  DDict.Append($2813, $0130, tSQ, '1-n', 'EmendRecord');

  DDict.Append($2813, $0131, tPN, '1', 'EmendUser');
  DDict.Append($2813, $0132, tIS, '1', 'EmendColor');

  DDict.Append($2813, $0133, tUT, '1', 'Field Script');
  DDict.Append($2813, $0134, tPN, '1', 'Label');
  DDict.Append($2813, $0135, tIS, '1', 'EditControlType');
  DDict.Append($2813, $0136, tPN, '1', 'LookupTableName');
  DDict.Append($2813, $0137, tPN, '1', 'EditVisible');
  DDict.Append($2813, $0138, tPN, '1', 'EditTabStop');
  DDict.Append($2813, $0139, tIS, '1', 'EditControlLength');
  DDict.Append($2813, $0140, tIS, '1', 'EditIndex');
  DDict.Append($2813, $0141, tPN, '1-n', 'ForGroups');

  DDict.Append($2813, $0151, tPN, '1-n', 'HospitalName');
  DDict.Append($2813, $0152, tSS, '1-n', 'HospitalID');
  DDict.Append($2813, $0153, tDA, '1-n', 'HospitalDate');
  //DDict.Append($2813, $0154, tPN, '1-n', 'ForGroups');
  //DDict.Append($2813, $0155, tPN, '1-n', 'ForGroups');
  //DDict.Append($2813, $0156, tPN, '1-n', 'ForGroups');
  //DDict.Append($2813, $0157, tPN, '1-n', 'ForGroups');

  {$IFDEF FOR_TENFENG_MR}

  DDict.Append($7777, $7702, tFL, '1-n', '±¦·å MR 1?');
  DDict.Append($7777, $7704, tSL, '1-n', '±¦·å MR ½Ç¶È?');
  DDict.Append($7777, $7706, tSL, '1-n', '±¦·å MR Î»ÖÃ?');

  {   PrivateCreatorN               =$0010;
     PositionLineValidN            =$1010;
     PositionLineSineN             =$1011;
     PositionLineNumN              =$1012;
     PositionFirstLineN            =$1013;
     PositionLineDistanceN         =$1015;
     TextAnnotationN               =$1050;
     ArrowAnnotationN              =$1080;
     ImageNumbersN                 =$1090;}

  DDict.Append($0019, $0010, tPN, '1', '±¦·å PrivateCreatorN');
  //  DDict.Append($0019, $1010, tSL, '1', '±¦·å PositionLineValidN');
  DDict.Append($0019, $1011, tFL, '1', '±¦·å¹ÚÊ¸×´Î»±êÖ¾ PositionLineSineN');
  DDict.Append($0019, $1012, tSL, '1', '±¦·å¶¨Î»ÏßÊý PositionLineNumN');
  DDict.Append($0019, $1013, tSL, '1', '±¦·å²ãÎ» PositionFirstLineN');
  DDict.Append($0019, $1015, tSL, '1', '±¦·å²ã¼ä¾Ø PositionLineDistanceN');
  DDict.Append($0019, $1050, tSL, '1', '±¦·å TextAnnotationN');
  DDict.Append($0019, $1080, tSL, '1', '±¦·å ArrowAnnotationN');
  DDict.Append($0019, $1090, tSL, '1', '±¦·å ImageNumbersN');
  {$ENDIF}
  DDict.Append($2813, $1001, tPN, '1', 'LayoutName');
  DDict.Append($2813, $1002, tSQ, '1', 'LayoutSetting-1');

  DDict.Append($2813, $1003, tSQ, '1', 'LayoutSetting-2');
  DDict.Append($2813, $1004, tIS, '1', 'LayoutRow');
  DDict.Append($2813, $1005, tIS, '1', 'LayoutColumn');
  DDict.Append($2813, $1006, tIS, '1', 'LayoutViewerID');
  DDict.Append($2813, $1007, tPN, '1', 'LayoutAlign'); //none,left,top
  DDict.Append($2813, $1008, tIS, '1', 'LayoutSpritPercent');
  DDict.Append($2813, $1009, tPN, '1', 'LayoutDiaplayLabel'); //none,left,top
  DDict.Append($2813, $1010, tPN, '1', 'LayoutOnlyOneSeries'); //none,left,top

  DDict.Append($2813, $2000, tSQ, '1', 'PresentationState');

  //for VideoConference

  DDict.Append($2817, $1, tIS, '1', 'VideoConferenceConnectionID');
  DDict.Append($2817, $2, tIS, '1', 'VideoConferenceUserID');
  DDict.Append($2817, $3, tPN, '1', 'VideoConferenceUserName');
  DDict.Append($2817, $4, tPN, '1', 'ConferenceMessageType');
  DDict.Append($2817, $5, tPN, '1', 'ConferenceErrorID');
  DDict.Append($2817, $6, tPN, '1', 'ConferenceErrorMessage');
  DDict.Append($2817, $7, tPN, '1', 'ConferenceMessage');
  DDict.Append($2817, $8, tPN, '1', 'VideoConferenceUserCode');
  DDict.Append($2817, $9, tPN, '1', 'VideoConferencePassword');
  DDict.Append($2817, $A, tIS, '1', 'VideoConferenceID');
  DDict.Append($2817, $B, tPN, '1', 'VideoConferenceUserGroupName');
  DDict.Append($2817, $C, tPN, '1', 'VideoConferenceUserMobil');

  DDict.Append($2817, $1000, tSQ, '1', 'ConferenceMessageDetail');
  DDict.Append($2817, $1001, tIS, '1', 'VideoConferenceFromConnectionID');
  DDict.Append($2817, $1002, tIS, '1', 'VideoConferenceFromUserID');
  DDict.Append($2817, $1003, tPN, '1', 'VideoConferenceFromUserName');
  DDict.Append($2817, $1004, tPN, '1', 'VideoConferenceFromUserCode');
  DDict.Append($2817, $1005, tPN, '1', 'VideoConferenceFromIPAddress');
  DDict.Append($2817, $1006, tPN, '1', 'VideoConferenceUserGroupName');

  DDict.Append($2817, $1007, tIS, 'n', 'VideoConferenceUserIDs');

  DDict.Append($2817, $1008, tIS, 'n', 'VideoConferenceID');

  DDict.Append($2817, $1009, tPN, 'n', 'VideoConferenceRequestSpeak');

  DDict.Append($2817, $100A, tIS, '1', 'ImageCurrentFrame');
  DDict.Append($2817, $100B, tIS, '1', 'ImageRotate');
  DDict.Append($2817, $100C, tIS, '1', 'ImageVerFlip');
  DDict.Append($2817, $100D, tIS, '1', 'ImageHozFlip');

  DDict.Append($2817, $100E, tPN, '1', 'VideoConferenceUserIPAddress');
  DDict.Append($2817, $100F, tIS, '1', 'VideoConferenceImageCommand');

  DDict.Append($2817, $100F, tIS, '1', 'VideoConferenceImageCommand');
  DDict.Append($2817, $1010, tIS, '1', 'VideoConferenceObjectIndex');
  //DDict.Append($2817, $1011, tIS, '1', 'VideoConferenceImageCommand');

  DDict.Append($2817, $2000, tSQ, 'n', 'ConferenceFriends');
  DDict.Append($2817, $2001, tSQ, 'n', 'ConferenceSeriesLayout');

  DDict.Append($0009, $1000, tLO, '1', 'Private Element Creator');
  DDict.Append($0009, $0001, tLO, '1', 'Full fidelity');
  DDict.Append($0009, $0002, tSH, '1', 'Suite id');
  DDict.Append($0009, $0004, tSH, '1', 'Product id');
  DDict.Append($0009, $0027, tSL, '1', 'Image actual date');
  DDict.Append($0009, $0030, tSH, '1', 'Service id');
  DDict.Append($0009, $0031, tSH, '1', 'Mobile location number');
  DDict.Append($0009, $00E3, tUI, '1', 'Equipment UID');
  DDict.Append($0009, $00E6, tSH, '1', 'Genesis Version ¨C now');
  DDict.Append($0009, $00E7, tUL, '1', 'Exam Record checksum');
  DDict.Append($0009, $00E9, tSL, '1', 'Actual series data time stamp');
  DDict.Append($0011, $1000, tLO, '1', 'Private Element Creator');
  DDict.Append($0011, $0010, tSS, '1', 'Patient Status');
  DDict.Append($0019, $1000, tLO, '1', 'Private Element Creator');
  DDict.Append($0019, $0002, tSL, '1', 'Number of cells I in Detector');
  DDict.Append($0019, $0003, tDS, '1', 'Cell number at Theta');
  DDict.Append($0019, $0004, tDS, '1', 'Cell spacing');
  DDict.Append($0019, $000F, tDS, '1', 'Horiz. frame of ref');
  DDict.Append($0019, $0011, tSS, '1', 'Series contrast');
  DDict.Append($0019, $0013, tSS, '1', 'Start number for baseline');
  DDict.Append($0019, $0014, tSS, '1', 'End number for baseline');
  DDict.Append($0019, $0015, tSS, '1', 'Start number for enhanced scans');
  DDict.Append($0019, $0016, tSS, '1', 'End number for enhanced scans');
  DDict.Append($0019, $0017, tSS, '1', 'Series plane');
  DDict.Append($0019, $0018, tLO, '1', 'First scan RAS');
  DDict.Append($0019, $0019, tDS, '1', 'First scan location');
  DDict.Append($0019, $001A, tLO, '1', 'Last scan RAS');
  DDict.Append($0019, $001B, tDS, '1', 'Last scan loc.');
  DDict.Append($0019, $001E, tDS, '1', 'Display field of view');
  DDict.Append($0019, $0023, tDS, '1', 'Table speed');
  DDict.Append($0019, $0024, tDS, '1', 'Mid scan time');
  DDict.Append($0019, $0025, tSS, '1', 'Mid scan flag');
  DDict.Append($0019, $0026, tSL, '1', 'Degrees of azimuth');
  DDict.Append($0019, $002A, tDS, '1', 'X-Ray On position');
  DDict.Append($0019, $002B, tDS, '1', 'X-Ray Off position');
  DDict.Append($0019, $002C, tSL, '1', 'Number of triggers');
  DDict.Append($0019, $002E, tDS, '1', 'Angle of first view');
  DDict.Append($0019, $002F, tDS, '1', 'Trigger frequency');
  DDict.Append($0019, $0039, tSS, '1', 'Scan FOV type');
  DDict.Append($0019, $0040, tSS, '1', 'Stat recon flag');
  DDict.Append($0019, $0041, tSS, '1', 'Compute type');
  DDict.Append($0019, $0042, tSS, '1', 'Segment number');
  DDict.Append($0019, $0043, tSS, '1', 'Total segments requested');
  DDict.Append($0019, $0044, tDS, '1', 'Interscan delay');
  DDict.Append($0019, $0047, tSS, '1', 'View compression factor');
  DDict.Append($0019, $004A, tSS, '1', 'Total no. of ref channels');
  DDict.Append($0019, $004B, tSL, '1', 'Data size for scan data');
  DDict.Append($0019, $0052, tSS, '1', 'Recon post proc. Flag');
  DDict.Append($0019, $0057, tSS, '1', 'CT water number');
  DDict.Append($0019, $0058, tSS, '1', 'CT bone number');
  DDict.Append($0019, $005E, tSL, '1', 'Number of channels(1...512)');
  DDict.Append($0019, $005F, tSL, '1', 'Increment between channels');
  DDict.Append($0019, $0060, tSL, '1', 'Starting view');
  DDict.Append($0019, $0061, tSL, '1', 'Number of views');
  DDict.Append($0019, $0062, tSL, '1', 'Increment between views');
  DDict.Append($0019, $006A, tSS, '1', 'Dependant on #views processed');
  DDict.Append($0019, $006B, tSS, '1', 'Field of view in detector cells');
  DDict.Append($0019, $0070, tSS, '1', 'Value of back projection button');
  DDict.Append($0019, $0071, tSS, '1', 'Set if fat estimates were used');
  DDict.Append($0019, $0072, tDS, '1', 'Z chan avg. over views');
  DDict.Append($0019, $0073, tDS, '1', 'Avg. of left ref chans over views');
  DDict.Append($0019, $0074, tDS, '1', 'Max left chan over views');
  DDict.Append($0019, $0075, tDS, '1', 'Avg. of right ref chans over views');
  DDict.Append($0019, $0076, tDS, '1', 'Max right chan over views');
  DDict.Append($0019, $00DA, tSS, '1', 'Reference channel used');
  DDict.Append($0019, $00DB, tDS, '1', 'Back projector coefficient');
  DDict.Append($0019, $00DC, tSS, '1', ' Primary speed correction used');
  DDict.Append($0019, $00DD, tSS, '1', 'Overrange correction used');
  DDict.Append($0019, $00DE, tDS, '1', 'Series from which Prescribed');
  DDict.Append($0021, $0005, tSH, '1', 'Genesis Version ¨C now');
  DDict.Append($0021, $0007, tUL, '1', 'Series Record checksum');
  DDict.Append($0021, $0018, tSH, '1', 'Genesis version ¨C Now');
  DDict.Append($0021, $0019, tUL, '1', 'Acqrecon record checksum');
  DDict.Append($0021, $0037, tSS, '1', 'Screen Format');
  DDict.Append($0021, $004A, tLO, '1', 'Anatomical reference for scout');
  DDict.Append($0021, $0090, tSS, '1', 'Tube focal spot position');
  DDict.Append($0021, $0091, tSS, '1', 'Biopsy position');
  DDict.Append($0021, $0092, tFL, '1', 'Biopsy T location');
  DDict.Append($0021, $0093, tFL, '1', 'Biopsy ref location');
  DDict.Append($0023, $1000, tLO, '1', 'Private Element Creator');
  DDict.Append($0023, $0070, tFD, '1', 'Start time(sec) in first axial');
  DDict.Append($0023, $0074, tSL, '1', 'No. of updates to header');
  DDict.Append($0023, $007D, tSS, '1', 'Indicates if the study has complete info (DICOM/genesis)');
  DDict.Append($0025, $1000, tLO, '1', 'Private Element Creator');
  DDict.Append($0025, $0006, tSS, '1', 'Last pulse sequence used');
  DDict.Append($0025, $0007, tSL, '1', 'Images in Series');
  DDict.Append($0025, $0010, tSL, '1', 'Landmark Counter');
  DDict.Append($0025, $0011, tSS, '1', 'Number of Acquisitions');
  DDict.Append($0025, $0017, tSL, '1', 'Series Complete Flag');
  DDict.Append($0025, $0018, tSL, '1', 'Number of images archived');
  DDict.Append($0025, $001A, tSH, '1', 'Primary Receiver Suite and Host');
  DDict.Append($0027, $1000, tLO, '1', 'Private Element Creator');
  DDict.Append($0027, $0006, tSL, '1', 'Image archive flag');
  DDict.Append($0027, $0010, tSS, '1', 'Scout Type');
  DDict.Append($0027, $001C, tSL, '1', 'Vma mamp');
  DDict.Append($0027, $001D, tSS, '1', 'Vma phase');
  DDict.Append($0027, $001E, tSL, '1', 'Vma mod');
  DDict.Append($0027, $001F, tSL, '1', 'Vma clip');
  DDict.Append($0027, $0020, tSS, '1', 'Smart scan ON/OFF flag');
  DDict.Append($0027, $0030, tSH, '1', 'Foreign Image Revision');
  DDict.Append($0027, $0035, tSS, '1', 'Plane Type');
  DDict.Append($0027, $0040, tSH, '1', 'RAS letter of image location');
  DDict.Append($0027, $0041, tFL, '1', 'Image location');

  //confit with wandong dsa
  //DDict.Append($0027, $0042, tFL, '1', 'Center R coord of plane image');

  DDict.Append($0027, $0043, tFL, '1', 'Center A coord of plane image');
  DDict.Append($0027, $0044, tFL, '1', 'Center S coord of plane image');
  DDict.Append($0027, $0045, tFL, '1', 'Normal R coord');
  DDict.Append($0027, $0046, tFL, '1', 'Normal A coord');
  DDict.Append($0027, $0047, tFL, '1', 'Normal S coord');
  DDict.Append($0027, $0048, tFL, '1', 'A Coord of Top Right Corner');
  DDict.Append($0027, $004A, tFL, '1', 'S Coord of Top Right Corner');
  DDict.Append($0027, $004B, tFL, '1', 'R Coord of Bottom Right Corner');
  DDict.Append($0027, $004C, tFL, '1', 'A Coord of Bottom Right Corner');
  DDict.Append($0027, $004D, tFL, '1', 'S Coord of Bottom Right Corner');
  DDict.Append($0027, $0050, tFL, '1', 'Table start location');
  DDict.Append($0027, $0051, tFL, '1', 'Table end location');
  DDict.Append($0027, $0052, tSH, '1', 'RAS letter for side of image');
  DDict.Append($0027, $0053, tSH, '1', 'RAS letter for anterior/posterior');
  DDict.Append($0027, $0054, tSH, '1', 'RAS letter for scout starts loc');
  DDict.Append($0027, $0055, tSH, '1', 'RAS letter for scout end loc.');
  DDict.Append($0029, $1000, tLO, '1', 'Private Element Creator');
  {  DDict.Append($0029, $0004, tSL, '1', 'Lower range of Pixels1');
    DDict.Append($0029, $0005, tDS, '1', 'Lower range of Pixels1');
    DDict.Append($0029, $0006, tDS, '1', 'Lower range of Pixels1');
    DDict.Append($0029, $0007, tSL, '1', 'Lower range of Pixels1');
    DDict.Append($0029, $0008, tSH, '1', 'Lower range of Pixels1');
    DDict.Append($0029, $0009, tSH, '1', 'Lower range of Pixels1');
    DDict.Append($0029, $000A, tSS, ' 1', 'Lower range of Pixels1');

    DDict.Append($0029, $0010, tLO, ' 1', 'PrivateCreator');
    DDict.Append($0029, $0011, tLO, ' 1', 'PrivateCreator');
    DDict.Append($0029, $0012, tLO, ' 1', 'PrivateCreator');    }

  DDict.Append($0029, $0026, tSS, '1', 'Version of the hdr struct');
  DDict.Append($0029, $0034, tSL, '1', 'Advantage comp. Overflow');
  DDict.Append($0043, $1000, tLO, '1', 'Private Element Creator');
  DDict.Append($0043, $0010, tUS, '1', 'Window value');
  DDict.Append($0043, $0011, tUS, '1', 'Total input views');
  DDict.Append($0043, $0012, tSS, '3', 'X-Ray chain');
  DDict.Append($0043, $0013, tSS, '5', 'Decon kernel parametersv');
  DDict.Append($0043, $0014, tSS, ' 3', 'Calibration parameters');
  DDict.Append($0043, $0015, tSS, '3', 'Total output views');
  DDict.Append($0043, $0016, tSS, '5', 'Number of overranges');
  DDict.Append($0043, $0017, tDS, '1', 'IBH image scale factors');
  DDict.Append($0043, $0018, tDS, '3', 'BBH coefficients');
  DDict.Append($0043, $0019, tSS, '1', 'Number of BBH chains to blend');
  DDict.Append($0043, $001A, tSL, '1', 'Starting channel number');
  DDict.Append($0043, $001B, tSS, '1', ' Ppscan parameters');
  DDict.Append($0043, $001C, tSS, '1', 'GE image integrity');
  DDict.Append($0043, $001D, tSS, '1', 'Level value');
  DDict.Append($0043, $001E, tDS, '1', 'Delta start time');
  DDict.Append($0043, $001F, tSL, '1', 'Max overranges in a view');
  DDict.Append($0043, $0020, tDS, '1', 'Avg. overranges all views');
  DDict.Append($0043, $0021, tSS, '1', 'Corrected after glow terms');
  DDict.Append($0043, $0025, tSS, '6 ', 'Reference channelsv');
  DDict.Append($0043, $0026, tUS, '6 ', 'No views ref chans blocked');
  DDict.Append($0043, $0027, tSH, '1', 'Scan pitch ratio');
  DDict.Append($0043, $0028, tOB, '1', 'Unique image iden');
  DDict.Append($0043, $0029, tOB, '1', 'Histogram tables');
  DDict.Append($0043, $002A, tOB, '1 ', 'User defined data');
  DDict.Append($0043, $002B, tSS, '4', 'rivate Scan Optionsv');
  DDict.Append($0043, $0031, tDS, '2', 'RA cord of target recon center');
  DDict.Append($0043, $0040, tFL, '4', 'Trigger on position');
  DDict.Append($0043, $0041, tFL, '4', 'Degree of rotation');
  DDict.Append($0043, $0042, tSL, '4', 'DAS trigger source');
  DDict.Append($0043, $0043, tSL, '4', 'DAS fpa gain');
  DDict.Append($0043, $0044, tSL, '4', 'DAS output source');
  DDict.Append($0043, $0045, tSL, '4', 'DAS ad input');
  DDict.Append($0043, $0046, tSL, '4', 'DAS cal mode');
  DDict.Append($0043, $0047, tSL, '4', 'DAS cal frequency');
  DDict.Append($0043, $0048, tSL, '4', 'DAS reg xm');
  DDict.Append($0043, $0049, tSL, '4', 'DAS auto zero');
  DDict.Append($0043, $004A, tSS, '4', 'Starting channel of view');
  DDict.Append($0043, $004B, tSL, '4', 'DAS xm pattern');
  DDict.Append($0043, $004C, tSS, '4', 'TGGC trigger mode');
  DDict.Append($0043, $004D, tFL, '4', 'Start scan to Xray on delay');
  DDict.Append($0043, $004E, tFL, '4', 'Duration of x-ray on');
  DDict.Append($0043, $0060, tIS, '8', 'slop_int_10...slop_int_17');
  DDict.Append($0045, $1000, tLO, '1', 'Private Element Creator');
  DDict.Append($0045, $0001, tLO, '1', 'Number of Macro rows in detector');
  DDict.Append($0045, $0002, tFL, '1', 'Macro width at ISO center');
  DDict.Append($0045, $0003, tSS, '1', 'DAS Type');
  DDict.Append($0045, $0004, tSS, '1', 'DAS gain');
  DDict.Append($0045, $0005, tSS, '1', 'DAS temperature');
  DDict.Append($0045, $0006, tCS, '1', 'Table direction whether moving in or moving out');
  DDict.Append($0045, $0007, tFL, '1', 'Z smoothing factor');
  DDict.Append($0045, $0008, tSS, '1', 'View weighting mode');
  DDict.Append($0045, $0009, tSS, '2', 'Sigma row number. Which rows were used');
  DDict.Append($0045, $000A, tFL, '1', 'minimum das value found in the scan data');
  DDict.Append($0045, $000B, tFL, '1', 'Maximum offset shift value used');
  DDict.Append($0045, $000C, tSS, '1', 'Number of views shifted');
  DDict.Append($0045, $000D, tSS, '1', 'Z tracking flag');
  DDict.Append($0045, $000E, tFL, '1', 'Mean Z error');
  DDict.Append($0045, $000F, tFL, '1', 'Z tracking maximum error');
  DDict.Append($0045, $0010, tSS, '1', 'starting view for row 2a');
  DDict.Append($0045, $0011, tSS, '1', 'Number of views in row 2a');
  DDict.Append($0045, $0012, tSS, '1', 'starting view for row 1a');
  DDict.Append($0045, $0013, tSS, '1', 'Sigma mode');
  DDict.Append($0045, $0014, tSS, '1', 'Number of views in row 1a');
  DDict.Append($0045, $0015, tSS, '1', 'starting view for row 2b');
  DDict.Append($0045, $0016, tSS, '1', 'Number of views in row 2b');
  DDict.Append($0045, $0017, tSS, '1', 'starting view for row 1b');
  DDict.Append($0045, $0018, tSS, '1', 'Number of views in row 1bv');
  DDict.Append($0045, $0019, tSS, '1', 'Air filter calibration date');
  DDict.Append($0045, $001A, tSS, '1', 'Air filter calibration time');
  DDict.Append($0045, $001B, tSS, '1', 'Phantom calibration date');
  DDict.Append($0045, $001C, tSS, '1', 'Phantom calibration time');
  DDict.Append($0045, $001D, tSS, '1', 'Z slope calibration date');
  DDict.Append($0045, $001E, tSS, '1', 'Z slope calibration time');
  DDict.Append($0045, $001F, tSS, '1', 'Crosstalk calibration date');
  DDict.Append($0045, $0020, tSS, '1', 'Crosstalk calibration time');
  DDict.Append($0045, $0021, tSS, '1', 'Iterbone option flag');
  DDict.Append($0045, $0022, tSS, '1', 'Peristaltic flag option');
  DDict.Append($0009, $1000, tLO, '1,', 'Private Element Creator');
  DDict.Append($0009, $0001, tLO, '1', 'Full fidelity');
  DDict.Append($0009, $0002, tSH, '1', 'Suite id');
  DDict.Append($0009, $0004, tSH, '1', 'Product id');
  DDict.Append($0009, $0027, tSL, '1', 'Image actual date');
  DDict.Append($0009, $0030, tSH, '1', 'Service id');
  DDict.Append($0009, $0031, tSH, '1', 'Mobile location number');
  DDict.Append($0009, $00E3, tUI, '1', 'Equipment UID');
  DDict.Append($0009, $00E6, tSH, '1', 'Genesis Version ¨C now');
  DDict.Append($0009, $00E7, tUL, '1', 'Exam Record checksum');
  DDict.Append($0009, $00E9, tSL, '1', 'Actual series data time stamp');
  DDict.Append($0011, $1000, tLO, '1', 'Private Element Creator');
  DDict.Append($0011, $0010, tSS, '1', 'Patient Status');
  DDict.Append($0019, $1000, tLO, '1', 'Private Element Creator');
  DDict.Append($0019, $000F, tDS, '1', 'Horiz. Frame of ref.');
  DDict.Append($0019, $0011, tSS, '1', 'Series contrast');
  DDict.Append($0019, $0012, tSS, '1', 'Last pseq');
  DDict.Append($0019, $0017, tSS, '1', 'Series plane');
  DDict.Append($0019, $0018, tLO, '1', 'First scan ras');
  DDict.Append($0019, $0019, tDS, '1', 'First scan location');
  DDict.Append($0019, $001A, tLO, '1', 'Last scan ras');
  DDict.Append($0019, $001B, tDS, '1', 'Last scan loc.');
  DDict.Append($0019, $001E, tDS, '1', 'Display field of view');
  DDict.Append($0019, $005A, tFL, '1', 'Acquisition Duration');
  DDict.Append($0019, $007D, tDS, '1', 'Second echo');
  DDict.Append($0019, $007E, tSS, '1', 'Number of echoes');
  DDict.Append($0019, $007F, tDS, '1', 'Table delta');
  DDict.Append($0019, $0081, tSS, '1', 'Contiguous');
  DDict.Append($0019, $0084, tDS, '1', 'Peak SAR');
  DDict.Append($0019, $0085, tSS, '1', 'Monitor SAR');
  DDict.Append($0019, $0087, tDS, '1', 'Cardiac repetition time');
  DDict.Append($0019, $0088, tSS, '1', 'Images per cardiac cyclev');
  DDict.Append($0019, $008A, tSS, '1', 'Actual receive gain analog');
  DDict.Append($0019, $008B, tSS, '1', 'Actual receive gain digital');
  DDict.Append($0019, $008D, tDS, '1', 'Delay after trigger');
  DDict.Append($0019, $0090, tSS, '1', 'Pause Interval');
  DDict.Append($0019, $0091, tDS, '1', 'Pulse Time');
  DDict.Append($0019, $0092, tSL, '1', 'Slice offset on freq. Axis');
  DDict.Append($0019, $0093, tDS, '1', 'Center Frequencyv');
  DDict.Append($0019, $0094, tSS, '1', 'Transmit Gain');
  DDict.Append($0019, $0095, tSS, '1', 'Analog receiver gainv');
  DDict.Append($0019, $0096, tSS, '1', 'Digital receiver gain');
  DDict.Append($0019, $0097, tSL, '1', 'Bitmap defining CVs');
  DDict.Append($0019, $0098, tSS, '1', 'Center freq. Method');
  DDict.Append($0019, $009B, tSS, '1', 'Pulse seq. Mode');
  DDict.Append($0019, $009C, tLO, '1', 'Pulse seq. Name');
  DDict.Append($0019, $009D, tDT, '1', 'Pulse seq. Date');
  DDict.Append($0019, $009E, tLO, '1', 'Internal pulse seq. Name');
  DDict.Append($0019, $009F, tSS, '1', 'Transmitting coil');
  DDict.Append($0019, $00A0, tSS, '1', 'Surface Coil Type');
  DDict.Append($0019, $00A1, tSS, '1', 'Extremity Coil flag');
  DDict.Append($0019, $00A2, tSL, '1', 'Raw data run number');
  DDict.Append($0019, $00A3, tUL, '1', 'Calibrated Field strength');
  DDict.Append($0019, $00A4, tSS, '1', 'SAT fat/water/bone');
  DDict.Append($0019, $00A5, tDS, '1', 'Receive bandwidth');
  DDict.Append($0019, $00A7, tDS, '1', 'User data');
  DDict.Append($0019, $00A8, tDS, '1', 'User data');
  DDict.Append($0019, $00A9, tDS, '1', 'User data');
  DDict.Append($0019, $00AA, tDS, '1', 'User data');
  DDict.Append($0019, $00AB, tDS, '1', 'User data');
  DDict.Append($0019, $00AC, tDS, '1', 'User data');
  DDict.Append($0019, $00AD, tDS, '1', 'User datav');
  DDict.Append($0019, $00AE, tDS, '1', 'User data');
  DDict.Append($0019, $00AF, tDS, '1', 'User data');
  DDict.Append($0019, $00B0, tDS, '1', 'User data');
  DDict.Append($0019, $00B1, tDS, '1', 'User data');
  DDict.Append($0019, $00B2, tDS, '1', 'User datav');
  DDict.Append($0019, $00B4, tDS, '1', 'User data');
  DDict.Append($0019, $00B5, tDS, '1', 'User data');
  DDict.Append($0019, $00B6, tDS, '1', 'User data');
  DDict.Append($0019, $00B7, tDS, '1', 'User data');
  DDict.Append($0019, $00B8, tDS, '1', 'User data');
  DDict.Append($0019, $00B9, tDS, '1', 'User data');
  DDict.Append($0019, $00BA, tDS, '1', 'User data');
  DDict.Append($0019, $00BB, tDS, '1', 'User data');
  DDict.Append($0019, $00BC, tDS, '1', 'User data');
  DDict.Append($0019, $00BD, tDS, '1', 'User data');
  DDict.Append($0019, $00BE, tDS, '1', 'Projection angle');
  DDict.Append($0019, $00C0, tSS, '1', 'Saturation planes');
  DDict.Append($0019, $00C1, tSS, '1', 'Surface coil intensity');
  DDict.Append($0019, $00C2, tSS, '1', 'SAT location R');
  DDict.Append($0019, $00C3, tSS, '1', 'SAT location L');
  DDict.Append($0019, $00C4, tSS, '1', 'SAT location A');
  DDict.Append($0019, $00C5, tSS, '1', 'SAT location P');
  DDict.Append($0019, $00C6, tSS, '1', 'SAT location H');
  DDict.Append($0019, $00C7, tSS, '1', 'SAT location F');
  DDict.Append($0019, $00C8, tSS, '1', 'SAT thickness R/L');
  DDict.Append($0019, $00C9, tSS, '1', 'SAT thickness A/P');
  DDict.Append($0019, $00CA, tSS, '1', 'SAT thickness H/F');
  DDict.Append($0019, $00CB, tSS, '1', 'Prescribed flow axis');
  DDict.Append($0019, $00CC, tSS, '1', 'Velocity encoding');
  DDict.Append($0019, $00CD, tSS, '1', 'Thickness disclaimer');
  DDict.Append($0019, $00CE, tSS, '1', 'Prescan type');
  DDict.Append($0019, $00CF, tSS, '1', 'Prescan status');
  DDict.Append($0019, $00D0, tSH, '1', 'Raw data type');
  DDict.Append($0019, $00D2, tSS, '1', 'Projection Algorithm');
  DDict.Append($0019, $00D3, tSH, '1', 'Projection algorithm');
  DDict.Append($0019, $00D5, tSS, '1', 'Fractional echo');
  DDict.Append($0019, $00D6, tSS, '1', 'Prep pulse');
  DDict.Append($0019, $00D7, tSS, '1', 'Cardiac phases');
  DDict.Append($0019, $00D8, tSS, '1', 'Variable echoflag');
  DDict.Append($0019, $00D9, tDS, '1', 'Concatenated SAT');
  DDict.Append($0019, $00DF, tDS, '1', 'User data');
  DDict.Append($0019, $00E0, tDS, '1', 'User data');
  DDict.Append($0019, $00E2, tDS, '1', 'Velocity Encode Scale');
  DDict.Append($0019, $00F2, tSS, '1', 'Fast phases');
  DDict.Append($0019, $00F9, tDS, '1', 'Transmission gain');
  DDict.Append($0021, $1000, tLO, '1', 'Private Element Creator');
  DDict.Append($0021, $0003, tSS, '1', 'Series from which Prescribed');
  DDict.Append($0021, $0005, tSH, '1', 'Genesis Version ¨C now');
  DDict.Append($0021, $0007, tUL, '1', 'Series Record checksum');
  DDict.Append($0021, $0018, tSH, '1', 'Genesis version ¨C Now');
  DDict.Append($0021, $0019, tUL, '1', 'Acq recon record checksum');
  DDict.Append($0021, $0020, tDS, '1', 'Table start location');
  DDict.Append($0021, $0035, tSS, '1', 'Series from which prescribed');
  DDict.Append($0021, $0036, tSS, '1', 'Image from which prescribed');
  DDict.Append($0021, $0037, tSS, '1', 'Screen Format');
  DDict.Append($0021, $004F, tSS, '1', 'Locations in acquisition');
  DDict.Append($0021, $0050, tSS, '1', 'Graphically prescribed');
  DDict.Append($0021, $0051, tDS, '1', 'Rotation from source x rot');
  DDict.Append($0021, $0052, tDS, '1', 'Rotation from source y rot');
  DDict.Append($0021, $0053, tDS, '1', 'Rotation from source z rot');
  DDict.Append($0021, $0054, tSH, '3', 'Image position');
  DDict.Append($0021, $0055, tSH, '6', 'Image orientation');
  DDict.Append($0021, $0056, tSL, '1', 'Integer slop');
  DDict.Append($0021, $0057, tSL, '1', 'Integer slop');
  DDict.Append($0021, $0058, tSL, '1', 'Integer slop');
  DDict.Append($0021, $0059, tSL, '1', 'Integer slop');
  DDict.Append($0021, $005A, tSL, '1', 'Integer slop');
  DDict.Append($0021, $005B, tDS, '1', 'Float slop');
  DDict.Append($0021, $005C, tDS, '1', 'Float slop');
  DDict.Append($0021, $005D, tDS, '1', 'Float slop');
  DDict.Append($0021, $005E, tDS, '1', 'Float slop');
  DDict.Append($0021, $005F, tDS, '1', 'Float slop');
  DDict.Append($0021, $0081, tDS, '1', 'Auto window/level alpha');
  DDict.Append($0021, $0082, tDS, '1', 'Auto window/level beta');
  DDict.Append($0021, $0083, tDS, '1', 'Auto window/level window');
  DDict.Append($0021, $0084, tDS, '1', 'To window/level level');
  DDict.Append($0023, $1000, tLO, '1', 'Private Element Creator');
  DDict.Append($0023, $0001, tSL, '1', 'Number of series in Study');
  DDict.Append($0023, $0002, tSL, '1', 'Number of unachieved Series');
  DDict.Append($0023, $0010, tSS, '1', 'Reference image field');
  DDict.Append($0023, $0050, tSS, '1', 'Summary image');
  DDict.Append($0023, $0070, tFD, '1', 'Start time(sec) in first axial');
  DDict.Append($0023, $0074, tSL, '1', 'No. of updates to header');
  DDict.Append($0023, $007D, tSS, '1', 'Indicates if study has complete info (DICOM/genesis');
  DDict.Append($0025, $1000, tLO, '1', 'Private Element Creator');
  DDict.Append($0025, $0006, tSS, '1', 'Images in Series');
  DDict.Append($0025, $0010, tSL, '1', 'Landmark Counter');
  DDict.Append($0025, $0011, tSS, '1', 'Number of Acquisitions');
  DDict.Append($0025, $0014, tSL, '1', 'Indicates no. of updates to header');
  DDict.Append($0025, $0017, tSL, '1', 'Series Complete Flag');
  DDict.Append($0025, $0018, tSL, '1', 'Number of images archived');
  DDict.Append($0025, $0019, tSL, '1', 'Last image number used');
  DDict.Append($0025, $001A, tSH, '1', 'Primary Receiver Suite and Host');
  DDict.Append($0027, $1000, tLO, '1', 'Private Element Creator');
  DDict.Append($0027, $0006, tSL, '1', 'Image archive flag');
  DDict.Append($0027, $0010, tSS, '1', 'Scout Type');
  DDict.Append($0027, $0030, tSH, '1', 'Foreign Image Revision');
  DDict.Append($0027, $0031, tSS, '1', 'Imaging Mode');
  DDict.Append($0027, $0032, tSS, '1', 'Pulse Sequence');
  DDict.Append($0027, $0033, tSL, '1', 'Imaging Options');
  DDict.Append($0027, $0035, tSS, '1', 'Plane Type');
  DDict.Append($0027, $0036, tSL, '1', 'Oblique Plane');

  //2011-06-09
  //DDict.Append($0027, $0038, tSQ, '1', 'For DSA?');

  DDict.Append($0027, $0040, tSH, '1', 'RAS letter of image location');
  DDict.Append($0027, $0041, tFL, '1', 'Image location');
  //DDict.Append($0027, $0042, tFL, '1', 'Center R coord of plane image');
  DDict.Append($0027, $0043, tFL, '1', 'Center A coord of plane image');
  DDict.Append($0027, $0044, tFL, '1', 'Center S coord of plane image');
  DDict.Append($0027, $0045, tFL, '1', 'Normal R coord');
  DDict.Append($0027, $0046, tFL, '1', 'Normal A coord');
  DDict.Append($0027, $0047, tFL, '1', 'Normal S coord');
  DDict.Append($0027, $0048, tFL, '1', 'R Coord of Top Right Corner');
  DDict.Append($0027, $0049, tFL, '1', 'A Coord of Top Right Corner');
  DDict.Append($0027, $004A, tFL, '1', 'S Coord of Top Right Corner');
  DDict.Append($0027, $004B, tFL, '1', 'R Coord of Bottom Right Corner');
  DDict.Append($0027, $004C, tFL, '1', 'A Coord of Bottom Right Corner');
  DDict.Append($0027, $004D, tFL, '1', 'S Coord of Bottom Right Corner');
  DDict.Append($0027, $0060, tFL, '1', 'Image dimension ¨C X');
  DDict.Append($0027, $0061, tFL, '1', 'Image dimension ¨C Y');
  DDict.Append($0027, $0062, tFL, '1', 'Number of Excitations');
  DDict.Append($0029, $1000, tLO, '1', 'Private Element Creator');
  DDict.Append($0029, $0015, tSL, '1', 'Lower range of Pixels1');
  DDict.Append($0029, $0016, tSL, '1', 'Upper range of Pixels1');
  DDict.Append($0029, $0017, tSL, '1', 'Lower range of Pixels2');
  DDict.Append($0029, $0018, tSL, '1', 'Upper range of Pixels2');
  DDict.Append($0029, $001A, tSL, '1', 'Len of tot hdr in bytes');
  DDict.Append($0029, $0026, tSS, '1', 'Version of the hdr struct');
  DDict.Append($0029, $0034, tSL, '1', 'Advantage comp. Overflow');
  DDict.Append($0029, $0035, tSL, '1', 'Advantage comp. Underflow');
  DDict.Append($0043, $1000, tLO, '1', 'Private Element Creator');
  DDict.Append($0043, $0001, tSS, '1', 'Bitmap of prescan options');
  DDict.Append($0043, $0002, tSS, '1', 'Gradient offset in X');
  DDict.Append($0043, $0003, tSS, '1', 'Gradient offset in Y');
  DDict.Append($0043, $0005, tSS, '1', 'Image is original or unoriginal');
  DDict.Append($0043, $0006, tSS, '1', 'Number of EPI shots');
  DDict.Append($0043, $0007, tSS, '1', 'Views per segment');
  DDict.Append($0043, $0008, tSS, '1', 'Respiratory rate, bpm');
  DDict.Append($0043, $0009, tSS, '1', 'Respiratory trigger point');
  DDict.Append($0043, $000A, tSS, '1', 'Type of receiver used');
  DDict.Append($0043, $000B, tDS, '1', 'Peak rate of change of gradient field');
  DDict.Append($0043, $000C, tDS, '1', 'Limits in units of percent');
  DDict.Append($0043, $000D, tDS, '1', 'PSD estimated limit');
  DDict.Append($0043, $000E, tDS, '1', 'PSD estimated limit in tesla per second');
  DDict.Append($0043, $000F, tDS, '1', 'Saravghead');
  DDict.Append($0043, $0010, tUS, '1', 'Window value');
  DDict.Append($0043, $001C, tSS, '1', 'GE image integrity');
  DDict.Append($0043, $001D, tSS, '1', 'Level value');
  DDict.Append($0043, $0028, tOB, '1', 'Unique image iden');
  DDict.Append($0043, $0029, tOB, '1', 'Histogram tables');
  DDict.Append($0043, $002A, tOB, '1', 'User defined data');
  DDict.Append($0043, $002B, tSS, '4', 'Private Scan Options');
  DDict.Append($0043, $002C, tSS, '1', 'Effective echo spacing');
  DDict.Append($0043, $002D, tSH, '1', 'String slop field 1');
  DDict.Append($0043, $002E, tSH, '1', 'String slop field 2');
  DDict.Append($0043, $002F, tSS, '1', 'Raw data type');
  DDict.Append($0043, $0030, tSS, '1', 'Raw data type');
  DDict.Append($0043, $0031, tDS, '2', 'RA cord of target recon center');
  DDict.Append($0043, $0032, tSS, '1', 'Raw data type');
  DDict.Append($0043, $0033, tFL, '1', 'Neg_scanspacing');
  DDict.Append($0043, $0034, tIS, '1', 'Offset Frequency');
  DDict.Append($0043, $0035, tUL, '1', 'User_usage_tag');
  DDict.Append($0043, $0036, tUL, '1', 'User_fill_map_MSW');
  DDict.Append($0043, $0037, tUL, '1', 'User_fill_map_LSW');
  DDict.Append($0043, $0038, tFL, '24', 'User25...User48');
  DDict.Append($0043, $0039, tIS, '4', 'Slop_int_6... slop_int_9');
  DDict.Append($0043, $0060, tIS, '8', 'GE');
  DDict.Append($0043, $0061, tUI, '1', 'Study Instance UID');
  DDict.Append($0043, $0062, tSH, '1', 'Study ID');
  DDict.Append($0043, $006F, tDS, '3', 'Scanner Table Entry');

  DDict.Append($0019, $109C, tCS, '1', 'GE  Sequence Name');

  //for philips
  DDict.Append($2001, $0010, tLO, '1', 'Private Creator Group 2001');
  DDict.Append($2001, $1063, tCS, '1', 'Examination Source');
  DDict.Append($2001, $1001, tFL, '1', 'Chemical Shift');
  DDict.Append($2001, $1002, tIS, '1', 'Chemical Shift Number MR');
  DDict.Append($2001, $1003, tFL, '1', 'Diffusion B-Factor');
  DDict.Append($2001, $1004, tCS, '1', 'Diffusion Direction');
  DDict.Append($2001, $1006, tCS, '1', 'Image Enhanced');
  DDict.Append($2001, $1007, tCS, '1', 'Image Type ED ES');
  DDict.Append($2001, $1008, tIS, '1', 'Phase Number');
  DDict.Append($2001, $100A, tIS, '1', 'Slice Number MR');
  DDict.Append($2001, $1011, tFL, '1', 'Diffusion Echo Time');
  DDict.Append($2001, $1012, tCS, '1', 'Dynamic Series');
  DDict.Append($2001, $1013, tSL, '1', 'EPI Factor');
  DDict.Append($2001, $1014, tSL, '1', 'Number of Echoes');
  DDict.Append($2001, $1015, tSS, '1', 'Number of Locations');
  DDict.Append($2001, $1016, tSS, '1', 'Number of PC Directions');
  DDict.Append($2001, $1017, tSL, '1', 'Number of Phases MR');
  DDict.Append($2001, $1018, tSL, '1', 'Number of Slices MR');
  DDict.Append($2001, $1019, tCS, '1', 'Partial Matrix Scanned');
  DDict.Append($2001, $101A, tFL, '1', 'PC Velocity');
  DDict.Append($2001, $101B, tFL, '1', 'Prepulse Delay');
  DDict.Append($2001, $101C, tCS, '1', 'Prepulse Type');
  DDict.Append($2001, $101D, tIS, '1', 'Reconstruction Number MR');
  DDict.Append($2001, $101F, tCS, '1', 'Respiration Sync');
  DDict.Append($2001, $1021, tCS, '1', 'SPIR');
  DDict.Append($2001, $1022, tFL, '1', 'Water Fat Shift');
  DDict.Append($2001, $1023, tDS, '1', 'Flip Angle Philips');
  DDict.Append($2001, $1060, tSL, '1', 'Number of Stacks');
  DDict.Append($2001, $1081, tIS, '1', 'Number of Dynamic Scans');
  DDict.Append($2001, $107B, tIS, '1', 'Acquisition Number');
  DDict.Append($2005, $0010, tLO, '1', 'Private Creator Group 2005');
  DDict.Append($2005, $1020, tCS, '1', 'Number of Chemical Shift');
  DDict.Append($2005, $10A1, tCS, '1', 'Syncra Scan Type');

  DDict.Append($2005, $0011, tLO, '1', 'Phylips Data'); //<1>Philips MR Imaging DD 002
  DDict.Append($2005, $0012, tLO, '1', 'Phylips Data'); //<1>Philips MR Imaging DD 003
  DDict.Append($2005, $0013, tLO, '1', 'Phylips Data'); //<1>Philips MR Imaging DD 004
  DDict.Append($2005, $0014, tLO, '1', 'Phylips Data'); //<1>Philips MR Imaging DD 005
  DDict.Append($2005, $1012, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $1013, tCS, '1', 'Phylips Data'); //<1>NO
  DDict.Append($2005, $1014, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $1015, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $1016, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $1017, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $1019, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $101A, tSS, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $101B, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $101C, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $101D, tSS, '1', 'Phylips Data'); //<1>4
  DDict.Append($2005, $101E, tSH, '1', 'Phylips Data'); //<1>compose
  DDict.Append($2005, $101F, tSH, '1', 'Phylips Data'); //<1>compose

  DDict.Append($2005, $1021, tSS, '1', 'Phylips Data'); //<1>1
  DDict.Append($2005, $1022, tIS, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $1023, tSS, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $1025, tSS, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $1026, tCS, '1', 'Phylips Data'); //<1>Y
  DDict.Append($2005, $1027, tCS, '1', 'Phylips Data'); //<1>STACKS
  DDict.Append($2005, $1028, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $1029, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $102A, tIS, '1', 'Phylips Data'); //<1>323974276
  DDict.Append($2005, $102B, tSS, '1', 'Phylips Data'); //<1>100
  DDict.Append($2005, $102C, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $102D, tIS, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $102E, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $102F, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $1030, tFL, '1', 'Phylips Data'); //<1>27.65
  DDict.Append($2005, $1031, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $1033, tFL, '1', 'Phylips Data'); //<1>33.52
  DDict.Append($2005, $1034, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $1035, tCS, '1', 'Phylips Data'); //<1>PIXEL
  DDict.Append($2005, $1036, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $1037, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $1038, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $1039, tCS, '1', 'Phylips Data'); //<1>Y
  DDict.Append($2005, $103B, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $103C, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $103D, tSS, '1', 'Phylips Data'); //<1>102
  DDict.Append($2005, $103E, tSL, '1', 'Phylips Data'); //<102>0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0
  DDict.Append($2005, $105F, tCS, '1', 'Phylips Data'); //<1>UNKNOWN
  DDict.Append($2005, $1060, tIS, '1', 'Phylips Data'); //<1>-1
  DDict.Append($2005, $106F, tCS, '1', 'Phylips Data'); //<1>MS
  DDict.Append($2005, $1080, tSQ, '1', 'Phylips Data'); //<0>Sequence Data
  DDict.Append($2005, $1083, tSQ, '1', 'Phylips Data'); //<0>Sequence Data
  DDict.Append($2005, $1084, tSQ, '1', 'Phylips Data'); //<0>Sequence Data
  DDict.Append($2005, $1085, tSQ, '1', 'Phylips Data'); //<0>Sequence Data
  DDict.Append($2005, $1086, tSS, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $109E, tSQ, '1', 'Phylips Data'); //<0>Sequence Data
  DDict.Append($2005, $10A2, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $10A9, tCS, '1', 'Phylips Data'); //<1>NONE
  DDict.Append($2005, $10C0, tCS, '1', 'Phylips Data'); //<1>GR
  DDict.Append($2005, $1132, tSQ, '1', 'Phylips Data'); //<6>Sequence Data

  DDict.Append($2005, $1137, tLO, '1', 'Phylips Data'); //<1>PDF_CONTROL_GEN_PARS
  DDict.Append($2005, $1138, tLO, '1', 'Phylips Data'); //<0>NULL
  DDict.Append($2005, $1139, tLO, '1', 'Phylips Data'); //<1>IEEE_PDF
  DDict.Append($2005, $1140, tLO, '1', 'Phylips Data'); //<0>NULL
  DDict.Append($2005, $1141, tLO, '1', 'Phylips Data'); //<0>NULL
  DDict.Append($2005, $1143, tSL, '1', 'Phylips Data'); //<1>2903
  DDict.Append($2005, $1144, tOW, '1', 'Phylips Data'); //<1>OB/OW Data 2904Byte  Ieee_pdf
  DDict.Append($2005, $1147, tCS, '1', 'Phylips Data'); //<1>Y

  DDict.Append($2005, $1199, tUL, '1', 'Phylips Data'); //<1>1
  DDict.Append($2005, $1200, tUL, '1', 'Phylips Data'); //<1>1
  DDict.Append($2005, $1201, tUL, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $1213, tUL, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $1245, tSS, '1', 'Phylips Data'); //<1>2
  DDict.Append($2005, $1249, tSS, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $1251, tSS, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $1252, tSS, '1', 'Phylips Data'); //<1>1
  DDict.Append($2005, $1253, tSS, '1', 'Phylips Data'); //<1>1
  DDict.Append($2005, $1325, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $1326, tFL, '1', 'Phylips Data'); //<1>.00
  DDict.Append($2005, $1327, tCS, '1', 'Phylips Data'); //<1>REAL
  DDict.Append($2005, $1328, tCS, '1', 'Phylips Data'); //<1>ORIGINAL
  DDict.Append($2005, $1329, tFL, '1', 'Phylips Data'); //<1>50.00
  DDict.Append($2005, $1330, tCS, '1', 'Phylips Data'); //<4>PLUS_A_PLUS_B\PLUS_A_PLUS_B\PLUS_A_PLUS_B\PLUS_A_PLUS_B
  DDict.Append($2005, $1331, tSS, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $1333, tFL, '1', 'Phylips Data'); //<3>.00\.00\.00
  DDict.Append($2005, $1334, tCS, '1', 'Phylips Data'); //<1>UNKNOWN
  DDict.Append($2005, $1335, tCS, '1', 'Phylips Data'); //<1>UNKNOWN
  DDict.Append($2005, $1336, tFL, '1', 'Phylips Data'); //<1>.00
  DDict.Append($2005, $1337, tFL, '1', 'Phylips Data'); //<1>.00
  DDict.Append($2005, $1338, tFL, '1', 'Phylips Data'); //<1>.00
  DDict.Append($2005, $1339, tSS, '1', 'Phylips Data'); //<2>0\0
  DDict.Append($2005, $1340, tCS, '1', 'Phylips Data'); //<1>PRE_FT
  DDict.Append($2005, $1341, tCS, '1', 'Phylips Data'); //<1>UNKNOWN
  DDict.Append($2005, $1342, tCS, '1', 'Phylips Data'); //<1>FID
  DDict.Append($2005, $1343, tCS, '1', 'Phylips Data'); //<1>Y
  DDict.Append($2005, $1344, tSS, '1', 'Phylips Data'); //<40>0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0
  DDict.Append($2005, $1345, tCS, '1', 'Phylips Data'); //<1>NO
  DDict.Append($2005, $1346, tCS, '1', 'Phylips Data'); //<1>HERTZ
  DDict.Append($2005, $1347, tFL, '1', 'Phylips Data'); //<1>.00
  DDict.Append($2005, $1348, tCS, '1', 'Phylips Data'); //<1>OFF
  DDict.Append($2005, $1349, tFL, '1', 'Phylips Data'); //<1>.00
  DDict.Append($2005, $1350, tFL, '1', 'Phylips Data'); //<2>.00\.00
  DDict.Append($2005, $1351, tSS, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $1352, tSS, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $1355, tFL, '1', 'Phylips Data'); //<30>.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00\.00
  DDict.Append($2005, $1356, tCS, '1', 'Phylips Data'); //<1>NO
  DDict.Append($2005, $1357, tSS, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $1359, tFL, '1', 'Phylips Data'); //<1>1.00
  DDict.Append($2005, $1360, tFL, '1', 'Phylips Data'); //<1>.00
  DDict.Append($2005, $1361, tFL, '1', 'Phylips Data'); //<2>.00\.00
  DDict.Append($2005, $1362, tFL, '1', 'Phylips Data'); //<1>.00
  DDict.Append($2005, $1363, tFL, '1', 'Phylips Data'); //<1>.00
  DDict.Append($2005, $1364, tCS, '1', 'Phylips Data'); //<1>NO
  DDict.Append($2005, $1370, tSS, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $1371, tSQ, '1', 'Phylips Data'); //<0>Sequence Data
  DDict.Append($2005, $1381, tIS, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $1382, tUL, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $1391, tPN, '1', 'Phylips Data'); //<0>NULL
  DDict.Append($2005, $1392, tIS, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $1393, tIS, '1', 'Phylips Data'); //<1>-1
  DDict.Append($2005, $1396, tCS, '1', 'Phylips Data'); //<1>NO
  DDict.Append($2005, $1397, tLO, '1', 'Phylips Data'); //<1>SNM3.T-11500.Spine
  DDict.Append($2005, $1398, tCS, '1', 'Phylips Data'); //<1>YES
  DDict.Append($2005, $1399, tCS, '1', 'Phylips Data'); //<1>NO
  DDict.Append($2005, $1400, tCS, '1', 'Phylips Data'); //<1>NO
  DDict.Append($2005, $1401, tUL, '1', 'Phylips Data'); //<1>1
  DDict.Append($2005, $1403, tUL, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $140E, tSQ, '1', 'Phylips Data'); //<1>Sequence Data
  DDict.Append($2005, $1427, tCS, '1', 'Phylips Data'); //<1>ISO_IR 100
  DDict.Append($2005, $140F, tSQ, '1', 'Phylips Data'); //<1>Sequence Data
  DDict.Append($2005, $1414, tSL, '1', 'Phylips Data'); //<1>1
  DDict.Append($2005, $1415, tSL, '1', 'Phylips Data'); //<1>1
  DDict.Append($2005, $1416, tCS, '1', 'Phylips Data'); //<1>MAN
  DDict.Append($2005, $1418, tCS, '1', 'Phylips Data'); //<3>STATIC FIELD\RF\GRADIENT
  DDict.Append($2005, $1419, tCS, '1', 'Phylips Data'); //<3>IEC_NORMAL\IEC_NORMAL\IEC_NORMAL
  DDict.Append($2005, $141B, tIS, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $141C, tIS, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $141D, tIS, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $1426, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $1428, tSL, '1', 'Phylips Data'); //<1>0
  DDict.Append($2005, $142A, tCS, '1', 'Phylips Data'); //<1>INITIAL
  DDict.Append($2005, $142B, tCS, '1', 'Phylips Data'); //<1>INITIAL
  DDict.Append($2005, $142C, tCS, '1', 'Phylips Data'); //<1>COMPLETED
  DDict.Append($2005, $142D, tCS, '1', 'Phylips Data'); //<1>COMPLETED
  DDict.Append($2005, $1432, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $1435, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $143A, tLT, '1', 'Phylips Data'); //<1>datadefs $Revision,$ 26.2 $
  DDict.Append($2005, $143B, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $143F, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $1440, tFL, '1', 'Phylips Data'); //<1>.00
  DDict.Append($2005, $1441, tFL, '1', 'Phylips Data'); //<1>.00
  DDict.Append($2005, $1442, tFL, '1', 'Phylips Data'); //<1>.00
  DDict.Append($2005, $1443, tFL, '1', 'Phylips Data'); //<1>.00
  DDict.Append($2005, $1444, tIS, '1', 'Phylips Data'); //<1>1
  DDict.Append($2005, $1445, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $1447, tFL, '1', 'Phylips Data'); //<1>.00
  DDict.Append($2005, $144A, tFL, '1', 'Phylips Data'); //<1>.00
  DDict.Append($2005, $144B, tFL, '1', 'Phylips Data'); //<1>.00
  DDict.Append($2005, $144C, tFL, '1', 'Phylips Data'); //<1>.00
  DDict.Append($2005, $144D, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $144E, tCS, '1', 'Phylips Data'); //<1>N
  DDict.Append($2005, $144F, tCS, '1', 'Phylips Data'); //<1>NONE
  DDict.Append($2005, $1450, tSS, '1', 'Phylips Data'); //<1>1

  {DDict.Append($, tCS, '1', '');
  DDict.Append($, tCS, '1', '');
  DDict.Append($, tCS, '1', '');
  DDict.Append($, tCS, '1', '');
  DDict.Append($, tCS, '1', '');
  DDict.Append($, tCS, '1', '');
  DDict.Append($, tCS, '1', '');
  DDict.Append($, tCS, '1', '');
  DDict.Append($, tCS, '1', '');
  DDict.Append($, tCS, '1', '');
  DDict.Append($, tCS, '1', '');
  DDict.Append($, tCS, '1', '');
  DDict.Append($, tCS, '1', '');
  DDict.Append($, tCS, '1', '');
  DDict.Append($, tCS, '1', ''); //}

  DDict.Refresh;
  {$IFDEF FOR_TRIAL_VERSION}
  UserHospitalName := 'EMail: dicom3@vip.163.com, Web Site: http://www.dicomvcl.com';
  PacsSoftwareName := 'ONLY For Evaluation. THIS IS Unregistered Copy!';
  {$ELSE}
  UserHospitalName := '';
  PacsSoftwareName := '';
  {$ENDIF}
finalization
  DDict.Free;
  UnknowEntry.Free;
  DType.Free;
  UnknowType.Free;
  // 24.07.2012 FOMIN
  GroupLengthEntry.Free;
end.

