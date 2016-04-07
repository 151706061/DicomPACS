{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit CnsMsg;
interface

var
  kxmMasterlinkErr: string;
  kxmSelfRef: string;
  kxmFindNearestErr: string;
  kxminternalOpen1Err: string;
  kxminternalOpen2Err: string;
  kxmReadOnlyErr: string;
  kxmVarArrayErr: string;
  kxmVarReason1Err: string;
  kxmVarReason2Err: string;
  kxmBookmErr: string;
  kxmUnknownFieldErr1: string;
  kxmUnknownFieldErr2: string;
  kxmIndexErr: string;
  kxmEditModeErr: string;
  kxmDatasetRemoveLockedErr: string;
  kxmSetDatasetLockErr: string;
  kxmOutOfBookmarks: string;
  kxmIndexNotExist: string;
  kxmKeyFieldsChanged: string;
  kxmDupIndex: string;
  kxmMissingNames: string;
  kxmInvalidRecord: string;
  kxmTransactionVersioning: string;
  kxmNoCurrentRecord: string;
  kxmCantAttachToSelf: string;
  kxmCantAttachToSelf2: string;
  kxmUnknownOperator: string;
  kxmUnknownFieldType: string;
  kxmOperatorNotSupported: string;
  kxmSavingDeltasBinary: string;
  kxmCantCheckpointAttached: string;
  kxmDeltaHandlerAssign: string;
  kxmOutOfRange: string;
  kxmInvArgument: string;
  kxmInvOptions: string;
  kxmTableMustBeClosed: string;
  kxmChildrenAttached: string;
  kxmIsAttached: string;
  kxmInvalidLocale: string;
  kxmInvFunction: string;
  kxmInvMissParam: string;
  kxmNoFormat: string;
  kxmTooManyFieldDefs: string;
  kxmCannotMixAppendStructure: string;

  SClearSelectedCellsCns: string;
  SInvalidTextFormatCns: string;
  SInvalidVCLDBIFFormatCns: string;
  SErrorDuringInsertValueCns: string;
  SIgnoreErrorCns: string;
  STabularInformationCns: string;
  SPageOfPagesCns: string;
  SPreviewCns: string;
  SFieldNameNotFoundCns: string;

  msgGraphicIsEmpty: string;
  msgInvalidBitmap: string;
  msgTiffCompressionNotSupported: string;
  msgLZWCompressionNotSupported: string;
  msgUnsupportedCompressionTag: string;
  msgInvalidImageFormat: string;
  msgMethodNotImplemented: string;
  msgImageDoesNotHavePalette: string;
  msgUseNewImageToChangeSize: string;
  msgNotAGrayScaleFormat: string;
  msgCannotAssign: string;
  msgNotAValidPngFile: string;
  msgInvalidColorTypeForBitDepth: string;
  msgInvalidBitDepth: string;
  msgInvalidSampleCount: string;
  msgJpegMustBeTrueColorOrGrayscale: string;
  msgTGAMustBeTrueColorOr8Bit: string;
  msgFileFormatNotSupported: string;
  msgUnsupportedClipboardFormat: string;
  msgFrameDoesNotExist: string;
  msgScannerIsBusy: string;
  msgOnlyOneScannerObjectPermitted: string;
  msgUnableToOpenTWAINSourceManager: string;
  msgInvalidCropParameters: string;
  msgOutOfResources: string;
  msgSourceTooSmall: string;
  msgDestTooSmall: string;
  msgSingleImageFileFormat: string;
  msgInvalidDcxHeader: string;
  msgDcxHeaderIsFull: string;
  msgGrayScaleTransparentPngNotSupported: string;

  msgRegionNotSelected: string;
  msgInvalidRubberBandLineStyle: string;
  msgRubberbandHandlerNotActive: string;
  msgTwainSourceMustBeOpen: string;
  msgDirectoryDoesNotExist: string;
  msgEPSFileDoesNotHavePreview: string;
  msgUnableToGetTwainDefaultSource: string;
  msgUnableToOpenTwainSource: string;
  msgUnableToDetermineGraphicFormat: string;
  msgInvalidPPMFile: string;
  msgPropertiesDialog: string;
  msgDelete: string;

  V_NOT_SUPPORT_DICOM_FORMAT: string;
  V_NOT_SUPPORT_BITMAP_FORMAT: string;
  cns_FormDefaultFontName: string;
  cns_Left_Caption: string;
  cns_Right_Caption: string;
  cns_Head_Caption: string;
  cns_Foot_Caption: string;
  cns_Front_Caption: string;
  cns_After_Caption: string;
  V_CONNECT_AOTO_RESTORE: string;
  dcmAssociationConnectError: string;
  cns_LineProfileForm_Caption: string;
  cns_Plot3DForm_Caption: string;
  cns_Confirm_Delete_Image: string;

  cns_BurnSetupFormCaption: string;
  cns_ValumeCaption: string;
  cns_BurnBufferSize: string;

  cns_CloseDisc: string;
  cns_TestWrite: string;
  cns_EjectAfterBurn: string;
  cns_QuickSaveISO: string;
  cns_BootableCD: string;
  cns_ShowFilesBeforeBurn: string;
  cns_OKCaption: string;
  cns_CancelCaption: string;
  cns_DeviceCapsForm_Caption: string;

  cns_BurnCDForm_Caption: string;
  cns_CDValumeName: string;
  cns_Info: string;
  cns_QuickEraseCD: string;
  cns_EraseCD: string;
  cns_LoadCD: string;
  cns_EjectCD: string;
  cns_SaveAsISO: string;
  cns_BurnISO: string;
  cns_Clear: string;
  cns_AdvanceSetup: string;
  cns_BurnCD: string;
  cns_CDImageFileFilter: string;

  cns_ASPIInitialized_Error: string;
  cns_StartBurning: string;
  cns_BurnComfird_caption: string;
  cns_StartBurnFileTo: string;
  cns_AddFilesAndDirsSuccess: string;
  cns_StartBurnISOFile: string;

  cns_CDWriterReady: string;
  cns_CDWriterNotReady: string;

  cns_EjectCDSuccess: string;
  cns_EjectCDNotSuccess: string;

  cns_LoadCDSuccess: string;
  cns_ThisCDIsUnformat: string;
  cns_EraseCDWarning: string;
  cns_EraseCDComfird: string;
  cns_BurnCDFinishedWithError: string;
  cns_BurnCDFinished: string;
  cns_EraseCDFinishedWithError: string;
  cns_EraseCDFinished: string;
  cns_BurnCDFormCaption: string;

  dcmMeasureAreaText: string;
  dcmDefaultFontName: string;

  dcmAssociationRetryConnect: string;
  dcmDicomConnectNoACK: string;
  dcmDicomPrintFilmCreatingError: string;
  dcmScriptRuntimeErrorAt: string;
  dcmNoPassportError: string;

  dcmLoginError: string;

  dcmUserCheckError: string;

  dcmUserLoginCaption: string;

  cns_DicomPrintParamForm_Caption: string;
  cns_DicomPrinter: string;
  cns_DicomPrinterFormat: string;
  cns_IPAddress: string;
  cns_DicomPrinterPort: string;
  cns_CalledAETitle: string;
  cns_CallingAETitle: string;
  cns_DicomPrintingCopies: string;
  cns_MagnificationType: string;
  cns_SmoothingType: string;

  cns_BorderDensity: string;
  cns_EmptyImageDensity: string;
  cns_MinDensity: string;
  cns_MaxDensity: string;
  cns_TrimCaption: string;
  cns_FilmType: string;
  cns_FilmGrid: string;

  cns_DicomPrintAllSelection: string;
  cns_HisgramForm_Caption: string;

  cns_userLogin_InputUserCode: string;
  cns_userLogin_InputPassword: string;
  cns_userLogin_ReInputPassword: string;
  cns_userLogin_code_not_same: string;
  cns_userLogin_old_password_incorrect: string;
  cns_userLogin_new_Password_not_same: string;
  cns_UserLoginForm_Caption: string;
  Cns_UserCode: string;
  Cns_Password: string;
  Cns_NewPassword: string;
  Cns_ConfirmPassword: string;

  V_CAN_NOT_OPEN_VFWDEVICE: string;
  V_DATASET_NOT_SETTED: string;
  V_CAN_NOT_START_CAPTURE: string;
  V_UNDEFINED_BITFORMAT: string;
  V_VIDEO_NOT_SUPORT: string;
  V_SAVE_TO_FILES_SUPORT: string;
  V_NAME_CAN_NOT_BE_NULL: string;
  V_NAME_DUP_ERROR: string;
  V_INPUT_NEW_NAME: string;
  V_DELETE_RECORD_SUCCESS: string;

  V_DICOM_PRINT_ERROR: string;
  V_PRINT_CONNECT_FAIL: string;

  V_CAN_NOT_FIND_DETAIL_DATASET: string;
  V_DATABASE_NAME_CAN_NOT_BE_NULL: string;
  V_SAVE_IMAGE_ERROR: string;
  V_UNDEFINED_PROFILENAME: string;
  V_DELETE_IMAGE_ERROR: string;
  V_NO_SCANER_ERROR: string;
  V_PROFILE_NAME_NOT_SET: string;
  V_CHANGE_PASSWORD_ERROR: string;
  V_NO_IMAGE_RECEIVE: string;
  V_RECEIVE_RELEASE_REQUEST_ERROR: string;
  V_RECEIVE_ABORT_ERROR: string;
  V_DICOM_PRINT_FILMBOX_ERROR: string;
  V_CONNECT_REJECT_ERROR: string;
  V_CONNECT_ABORT_ERROR: string;
  V_REQUEST_WAS_REJECT: string;
  V_PLEASE_RECONNECT_TO_SERVER: string;
  V_CONDITION_ERROR: string;
  V_NOT_SAME_STUDYUID: string;
  V_OPENTABLE_ERROR: string;
  V_OPENTABLE_DBERROR:string;
  V_EXECSQL_ERROR: string;
  V_NO_IMAGES_TO_PRINT: string;
  V_DICOM_PRINTER_NOT_SETTING: string;
  V_DICOM_PRINT_FINISH: string;
  V_DICOM_PRINT_SETTING: string;
  V_SIGN_VMF: string;
  V_PLEASE_DRAW_TWO_TEXT: string;
  V_NO_SIGNIMAGE: string;
  V_NEED_A_LENGTH: string;
  V_SEND_IMAGE_SUCCESS: string;
  V_NO_BUFFER_ERROR: string;
  V_CAN_NOT_FIND_VERSIONINFO: string;
  V_DONT_NEED_UPDATE: string;
  V_CHECK_SERSION_ERROR: string;
  V_CLICK_OK_AFTER_COMPRESS: string;
  V_COMPRESS_ERROR: string;
  V_UPDATE_FINISH: string;
  V_FILE_COPY_ERROR: string;
  V_OPEN_DICOMDIR_ERROR: string;
  V_NOT_ASSIGNED_ONNEWIMAGE: string;
  V_NOT_RECEIVE_IMAGES: string;
  V_SET_PREVIEW_FIRST: string;

  V_CAPTURE_A_IMAGE_FIRST: string;
  V_DRAW_A_RECT: string;
  V_NO_SELECTED_RECT: string;
  V_CAN_NOT_FIND_FILE: string;

  V_IS_NOT_A_SQ_TYPE_DATA: string;

implementation
uses cnsmsg_eng;

initialization
  InitMsgAsEng;
end.

