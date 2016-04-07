{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit cnsmsg_eng;
interface

uses cnsmsg;

procedure InitMsgAsEng;

implementation

procedure InitMsgAsEng;
begin
  kxmMasterlinkErr := 'Number of masterfields doesn''t correspond to number of indexfields.';
  kxmSelfRef := 'Selfreferencing master/detail relations not allowed.';
  kxmFindNearestErr := 'Can''t do FindNearest on non sorted data.';
  kxminternalOpen1Err := 'Fielddef ';
  kxminternalOpen2Err := 'Datatype %d not supported.';
  kxmReadOnlyErr := 'Field %s is read only';
  kxmVarArrayErr := 'Values variant array has invalid dimension count';
  kxmVarReason1Err := 'More fields than values';
  kxmVarReason2Err := 'There must be at least one field';
  kxmBookmErr := 'Bookmark %d not found.';
  kxmUnknownFieldErr1 := 'Unknown field type (%s)';
  kxmUnknownFieldErr2 := 'in CSV file. (%s)';
  kxmIndexErr := 'Can''t index on field %s';
  kxmEditModeErr := 'Dataset is not in edit mode.';
  kxmDatasetRemoveLockedErr := 'Dataset being removed while locked.';
  kxmSetDatasetLockErr := 'Dataset is locked and cant be changed.';
  kxmOutOfBookmarks := 'Bookmark counter is out of range. Please close and reopen table.';
  kxmIndexNotExist := 'Index %s does not exist';
  kxmKeyFieldsChanged := 'Could''nt perform operation since key fields changed.';
  kxmDupIndex := 'Duplicate index value. Operation aborted.';
  kxmMissingNames := 'Missing Name or FieldNames in IndexDef!';
  kxmInvalidRecord := 'Invalid record ';
  kxmTransactionVersioning := 'Transactioning requires multiversion versioning.';
  kxmNoCurrentRecord := 'No current record.';
  kxmCantAttachToSelf := 'Cant attach memorytable to it self.';
  kxmCantAttachToSelf2 := 'Cant attach to another table which itself is an attachment.';
  kxmUnknownOperator := 'Unknown operator (%d)';
  kxmUnknownFieldType := 'Unknown fieldtype (%d)';
  kxmOperatorNotSupported := 'Operator not supported (%d).';
  kxmSavingDeltasBinary := 'Saving deltas is supported only in binary format.';
  kxmCantCheckpointAttached := 'Cannot checkpoint attached table.';
  kxmDeltaHandlerAssign := 'Delta handler is not assigned to any memorytables.';
  kxmOutOfRange := 'Out of range (%d)';
  kxmInvArgument := 'Invalid argument.';
  kxmInvOptions := 'Invalid options.';
  kxmTableMustBeClosed := 'Table must be closed for this operation.';
  kxmChildrenAttached := 'Children are attached to this table.';
  kxmIsAttached := 'Table is attached to another table.';
  kxmInvalidLocale := 'Invalid locale.';
  kxmInvFunction := 'Invalid function name %s';
  kxmInvMissParam := 'Invalid or missing parameter for function %s';
  kxmNoFormat := 'No format specified.';
  kxmTooManyFieldDefs := 'Too many fielddefs. Please raise kxm_MAX_FIELDS value.';
  kxmCannotMixAppendStructure := 'Cannot both append and copy structure.';

  SClearSelectedCellsCns := 'Clear selected cells?';
  SInvalidTextFormatCns := 'Invalid text format';
  SInvalidVCLDBIFFormatCns := 'Invalid VCLDBIF format';
  SErrorDuringInsertValueCns := 'Error during insert value:';
  SIgnoreErrorCns := 'Ignore error?';
  STabularInformationCns := 'Tabular information';
  SPageOfPagesCns := 'Page %d of %d';
  SPreviewCns := 'Preview';
  SFieldNameNotFoundCns := 'Field name ''%s''is not found';

  msgGraphicIsEmpty := 'Graphic is empty';
  msgInvalidBitmap := 'Invalid bitmap';
  msgTiffCompressionNotSupported := '%s compression not supported with %s images';
  msgLZWCompressionNotSupported := 'LZW compression not supported';
  msgUnsupportedCompressionTag := 'Unsupported compression tag, %d';
  msgInvalidImageFormat := 'Internal error: Invalid image format';
  msgMethodNotImplemented := 'Method %s not implemented for %s class';
  msgImageDoesNotHavePalette := 'The image does not have a palette';
  msgUseNewImageToChangeSize := 'Dimensions must be change with the NewImage method';
  msgNotAGrayScaleFormat := 'Not a gray scale image format';
  msgCannotAssign := 'Cannot assign a %s to a %s';
  msgNotAValidPngFile := 'PNG file is not valid or corrupted';
  msgInvalidColorTypeForBitDepth := 'Invalid color type for bit depth';
  msgInvalidBitDepth := 'Invalid bit depth';
  msgInvalidSampleCount := 'Invalid number of samples';
  msgJpegMustBeTrueColorOrGrayscale := 'JPEG image must be gray scale or true color';
  msgTGAMustBeTrueColorOr8Bit := 'TARGA image must be true color or 8 bit with palette';
  msgFileFormatNotSupported := 'Graphic files of %s format are not supported or not registered';
  msgUnsupportedClipboardFormat := 'Unknown clipboard format, %d';
  msgFrameDoesNotExist := 'Frame %d does not exist';
  msgScannerIsBusy := 'Scanner is busy';
  msgOnlyOneScannerObjectPermitted := 'Only one scanner object is permitted';
  msgUnableToOpenTWAINSourceManager := 'Unable to open TWAIN source manager';
  msgInvalidCropParameters := 'Invalid crop parameters';
  msgOutOfResources := 'Out of resources';
  msgSourceTooSmall := 'Source graphic too small';
  msgDestTooSmall := 'Destination graphic too small';
  msgSingleImageFileFormat := 'The %s format does not support multiple images';
  msgInvalidDcxHeader := 'The DCX file header is not valid';
  msgDcxHeaderIsFull := 'The DCX file header is full';
  msgGrayScaleTransparentPngNotSupported := 'Gray scale transparent PNG images are not supported.'#13 +
    'Use the ifColor16 or ifColor256 image format instead.';
  msgRegionNotSelected := 'A region is not selected';
  msgInvalidRubberBandLineStyle := 'Invalid rubberband line style';
  msgRubberbandHandlerNotActive := 'Rubberband mouse handler not active';
  msgTwainSourceMustBeOpen := 'TWAIN source must be open; OpenSource not called';
  msgDirectoryDoesNotExist := 'Directory does not exist';
  msgEPSFileDoesNotHavePreview := 'EPS file does not have a preview';
  msgUnableToGetTwainDefaultSource := 'Unable to get TWAIN default source';
  msgUnableToOpenTwainSource := 'Unable to open TWAIN source';
  msgUnableToDetermineGraphicFormat := 'Unable to determine graphic format';
  msgInvalidPPMFile := 'Not a valid PPM file';
  msgPropertiesDialog := 'Properties...';
  msgDelete := 'Delete';

  dcmMeasureAreaText := 'Perimeter %f centimetre, dimension %f cm2';
  dcmDefaultFontName := 'MS Sans Serif';

  dcmAssociationConnectError := 'connect error: %d ( server %s : %d )';
  dcmAssociationRetryConnect := 'retry again now?';
  dcmDicomConnectNoACK := 'no respond!';
  dcmDicomPrintFilmCreatingError := 'Film box fail to creating ,mayby the DICOM printer parameter wrong!';

  dcmScriptRuntimeErrorAt := 'at %d line of the script,make a mistake like below';
  dcmNoPassportError := 'no identification error';

  dcmLoginError := 'Error to login the server';
  dcmUserCheckError := 'user check in error';

  dcmUserLoginCaption := 'check user''s usufruct ';

  cns_FormDefaultFontName := 'Song font name';

  cns_DicomPrintParamForm_Caption := 'parameter of thr Dicom Printer';
  cns_DicomPrinter := 'DICOM Printer';
  cns_DicomPrinterFormat := 'format';
  cns_IPAddress := 'IP address';
  cns_DicomPrinterPort := 'dicom printer port';
  cns_CalledAETitle := 'remote AET';
  cns_CallingAETitle := 'location AET';
  cns_DicomPrintingCopies := 'copies';
  cns_MagnificationType := 'Magnification Type';
  cns_SmoothingType := 'Smoothing Type';
  cns_BorderDensity := 'Border Density';
  cns_EmptyImageDensity := 'Empty Image Density';
  cns_MinDensity := 'Minimum Density';
  cns_MaxDensity := 'Maximum Density';
  cns_TrimCaption := 'line up ';
  cns_FilmType := 'Film Type';
  cns_FilmGrid := 'Film Grid';

  cns_OKCaption := 'OK ';
  cns_CancelCaption := 'Cancel';

  cns_DicomPrintAllSelection := 'Print current page,'#13#10'Print All Selected page? ';

  cns_Confirm_Delete_Image := 'Are you confirm delete the image';
  cns_Plot3DForm_Caption := '3D gray image';

  cns_BurnCDForm_Caption := 'backup data to cd/dvd';
  cns_CDValumeName := 'CD Volume ';
  cns_Info := 'Information';
  cns_QuickEraseCD := 'Quick format';
  cns_EraseCD := 'Format';
  cns_LoadCD := 'Load CD';
  cns_EjectCD := 'Eject CD';
  cns_SaveAsISO := 'SaveAsISO';
  cns_BurnISO := 'BurnISO';
  cns_Clear := 'Clear';
  cns_AdvanceSetup := 'install';
  cns_BurnCD := 'burn cd';
  cns_CDImageFileFilter := 'CD image File';

  cns_ASPIInitialized_Error := 'ASPI Initialized Error,please contact your software supplier';

  cns_StartBurning := 'Start Burning ! use device:';
  cns_BurnComfird_caption := 'Confirm to Burning CD/DVD? ';
  cns_StartBurnFileTo := 'Start Burn File To';
  cns_AddFilesAndDirsSuccess := 'Add Files /directory to CD Success';
  cns_StartBurnISOFile := 'Start Burn ISO File';

  cns_CDWriterReady := 'driver Ready';
  cns_CDWriterNotReady := 'driver Not Ready';

  cns_EjectCDSuccess := 'Eject CD Success';
  cns_EjectCDNotSuccess := 'fail to Eject CD ';

  cns_LoadCDSuccess := 'Load CD Success';
  cns_ThisCDIsUnformat := 'This CD Is Unformat';
  cns_EraseCDWarning := 'Erase CD Warning:all data will lost!';
  cns_EraseCDComfird := 'Confirm format cd ?it will take 10-70 minute';
  cns_BurnCDFinishedWithError := 'Burn CD Finished With Error';
  cns_BurnCDFinished := 'Burn CD Finish';
  cns_EraseCDFinishedWithError := 'Erase CD Finished because of Error';
  cns_EraseCDFinished := 'Erase CD Finish';
  cns_BurnCDFormCaption := 'Burn CD in DICOM format';

  cns_DeviceCapsForm_Caption := 'capability of the cd driver';

  cns_BurnSetupFormCaption := 'Burn Setup';
  cns_ValumeCaption := 'Valume ';
  cns_BurnBufferSize := 'Buffer Size:';

  cns_CloseDisc := 'Close Disc after burn';
  cns_TestWrite := 'test  before burn';
  cns_EjectAfterBurn := 'Eject CD After Burn';
  cns_QuickSaveISO := 'Quick Save cd as ISO image ';
  cns_BootableCD := 'Bootable CD';
  cns_ShowFilesBeforeBurn := 'display Files Before Burn';

  cns_HisgramForm_Caption := 'Hisgram Graph';

  cns_userLogin_InputUserCode := 'please Input User Code';
  cns_userLogin_InputPassword := 'please Input Password';
  cns_userLogin_ReInputPassword := 'please Input new Password again';
  cns_userLogin_code_not_same := 'Input user code not same as login code, Try again';
  cns_userLogin_old_password_incorrect := 'input user password not same as login code , try again';
  cns_userLogin_new_Password_not_same := 'user twice Login Password not same, try again';
  cns_UserLoginForm_Caption := 'User Login';
  Cns_UserCode := 'User Code';
  Cns_Password := 'Password';
  Cns_NewPassword := 'New Password';
  Cns_ConfirmPassword := 'Confirm new Password';

  cns_Left_Caption := 'Left';
  cns_Right_Caption := 'Right';
  cns_Head_Caption := 'Head';
  cns_Foot_Caption := 'Foot';
  cns_Front_Caption := 'Front';
  cns_After_Caption := 'After';

  V_CAN_NOT_OPEN_VFWDEVICE := 'Can not open capture device ,please check capture device whether exist,or whether connect,or the device''s drive program correct install?or contact  your system administrator!';
  V_DATASET_NOT_SETTED := 'Database not setted (DicomClient)';
  V_CAN_NOT_START_CAPTURE := 'Can not start capture, please check what reason! ';
  V_UNDEFINED_BITFORMAT := 'Undefined capture format ';
  V_VIDEO_NOT_SUPORT := 'Video not support ,or the video source  not connect';
  V_SAVE_TO_FILES_SUPORT := 'Error to create directory';
  V_NAME_CAN_NOT_BE_NULL := 'Name can not be null';
  V_NAME_DUP_ERROR := 'Name iterative error ,please input different name';
  V_INPUT_NEW_NAME := 'Enter new name';
  V_DELETE_RECORD_SUCCESS := 'Delete successful';

  V_CAN_NOT_FIND_DETAIL_DATASET := 'Can not find assigned detail form !';
  V_DATABASE_NAME_CAN_NOT_BE_NULL := 'not specify database name  ';
  V_SAVE_IMAGE_ERROR := 'fail to save image ';
  V_UNDEFINED_PROFILENAME := 'Server''s terminal undefined subgroup name :';
  V_DELETE_IMAGE_ERROR := 'server error when you delete image  data :';
  V_NO_SCANER_ERROR := 'No scaner install';
  V_PROFILE_NAME_NOT_SET := 'subgroup choice of the to fall ill template  error! ';
  V_CHANGE_PASSWORD_ERROR := 'make a mistake when you change password  :';
  V_NO_IMAGE_RECEIVE := 'No image information receive!';
  V_RECEIVE_RELEASE_REQUEST_ERROR := 'Receive release request from server ! ';
  V_RECEIVE_ABORT_ERROR := 'Receive abort from server  ';
  V_DICOM_PRINT_FILMBOX_ERROR := 'printer rejected filmbox error! ';
  V_CONNECT_REJECT_ERROR := 'Connect rejected error!';
  V_CONNECT_ABORT_ERROR := 'Connect abort error ,because of network reason,your application not received,and you cancel attempt,please retry after the network and server recovery!';
  V_REQUEST_WAS_REJECT := 'Request connection be rejected:';
  V_PLEASE_RECONNECT_TO_SERVER := 'Please try to  new request after disconnect the conjunction';
  V_CONDITION_ERROR := 'Set condition error:';
  V_NOT_SAME_STUDYUID := 'Different studyuid can not add to the same study ';
  V_NOT_SUPPORT_BITMAP_FORMAT := 'do not support import from DICOM image format ';
  V_NOT_SUPPORT_DICOM_FORMAT := 'Not Suport image''s format:';
  V_CONNECT_AOTO_RESTORE := 'reconnect to server automatically';
  V_EXECSQL_ERROR := 'server error when execute SQL:';
  V_NO_IMAGES_TO_PRINT := 'no image to print !';
  V_DICOM_PRINTER_NOT_SETTING := 'not setup  DICOM printer ,or not select printer';
  V_DICOM_PRINT_FINISH := 'image send to printer finish ';
  V_DICOM_PRINT_SETTING := 'set parameter of the laser jet camera ,print ';
  V_SIGN_VMF := 'wordage''s indication setup change as:x1:=%d,y1:=%d,x2:=%d,y2:=%d,h2:=%d,circle point high:=%d';
  V_PLEASE_DRAW_TWO_TEXT := 'first you''ll draw tow chart marker at least,setup not success,please drag 1 wordage marker and 1 circle point marker at lease, try again';
  V_NO_SIGNIMAGE := 'image has not mark chart';
  V_NEED_A_LENGTH := 'measure a kowning length select this ratio';
  V_SEND_IMAGE_SUCCESS := 'transfer success';
  V_NO_BUFFER_ERROR := 'capture card''s buffer not allocated';
  V_CAN_NOT_FIND_VERSIONINFO := 'this program not including verson information!';
  V_DONT_NEED_UPDATE := 'it is the newest ,don''t need to update';
  V_CHECK_SERSION_ERROR := 'appear error as soon as connect server to check version ';
  V_CLICK_OK_AFTER_COMPRESS := 'after compress,click ok to transfer program to server';
  V_COMPRESS_ERROR := 'appear error as soon as execute compress :%s';
  V_UPDATE_FINISH := 'update server successful';
  V_FILE_COPY_ERROR := 'fail to  copy file';
  V_OPEN_DICOMDIR_ERROR := 'fail to open DICOMDIR ';
  V_NOT_ASSIGNED_ONNEWIMAGE := ' save image be cancel ,please set OnNewImage event';
  V_NOT_RECEIVE_IMAGES := 'have not received the image that request to server,mayby the image be transfered,stored,deleted,please contact to the system administrator';
  V_SET_PREVIEW_FIRST := 'please connect image data first and set to preview mode';

  V_CAPTURE_A_IMAGE_FIRST := 'plesase select to capture 1 graph at least';
  V_DRAW_A_RECT := 'please draw a rectangle range,and select manu<set cut range>';
  V_NO_SELECTED_RECT := 'no selected cut range';
  V_CAN_NOT_FIND_FILE := 'can not find file';

  V_IS_NOT_A_SQ_TYPE_DATA := 'The Attribute is not SQ type';

  V_DICOM_PRINT_ERROR := 'Print Fail! Try Again?';
  V_PRINT_CONNECT_FAIL := 'Connection Fail: ';

  V_OPENTABLE_ERROR := 'Fail to open a Query:%s';
  V_OPENTABLE_DBERROR := 'Fail to open a Query:%s';
end;

{--------------------------------------------------------------------------}
initialization
  //  InitMsgAsEng;
end.


