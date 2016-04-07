{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit cnsmsg_chs;
interface

uses cnsmsg;

procedure InitMsgAsChs;

implementation

procedure InitMsgAsChs;
begin
  cns_Confirm_Delete_Image := 'ɾ����ѡͼ����?';
  kxmMasterlinkErr := '���ֶκŸ������ֶκŲ���';
  kxmSelfRef := '���������ҽ�����������';
  kxmFindNearestErr := '�����������в��ܽ��Ʋ���';
  kxminternalOpen1Err := '�ֶζ���';
  kxminternalOpen2Err := '��֧���������� %d ';
  kxmReadOnlyErr := '�ֶ� %s ֻ��';
  kxmVarArrayErr := '�������ֵ��ά����Ч';
  kxmVarReason1Err := '�ֶ���Ŀ����ֵ��Ŀ';
  kxmVarReason2Err := '����������һ���ֶ�';
  kxmBookmErr := 'û�з�����ǩ %d';
  kxmUnknownFieldErr1 := 'δ֪�ֶ�����';
  kxmUnknownFieldErr2 := '��CSV�ļ���.(%s)';
  kxmIndexErr := '�������ֶ� %s ����';
  kxmEditModeErr := '���ݼ����ڱ༭ģʽ';
  kxmDatasetRemoveLockedErr := '���ݼ���������ʱ��ɾ��';
  kxmSetDatasetLockErr := '���ݼ����������ܸı�';
  kxmOutOfBookmarks := '��ǩ�������������رպ����´򿪱�';
  kxmIndexNotExist := '����%s ������';
  kxmKeyFieldsChanged := '���ֶθı�ʱ������ִ�в���';
  kxmDupIndex := '��������ֵ����ʧ��';
  kxmMissingNames := '��������ȱ�����ֻ��ֶ���';
  kxmInvalidRecord := '��Ч�ļ�¼';
  kxmTransactionVersioning := '��������Ҫ���ִ���';
  kxmNoCurrentRecord := '���ǵ�ǰ��¼';
  kxmCantAttachToSelf := '�ڴ������������';
  kxmCantAttachToSelf2 := '���ܸ��ӵ�����';
  kxmUnknownOperator := 'δ֪������ (%d)';
  kxmUnknownFieldType := 'δ֪�ֶ����� (%d)';
  kxmOperatorNotSupported := '�����߲�֧�� (%d).';
  kxmSavingDeltasBinary := 'ֻ�ж�����֧�ֱ�������';
  kxmCantCheckpointAttached := '���ܼ�鸽��';
  kxmDeltaHandlerAssign := '�������û�и�ֵ���κ��ڴ��';
  kxmOutOfRange := '�����Χ (%d)';
  kxmInvArgument := '��Ч����';
  kxmInvOptions := '��Чѡ��';
  kxmTableMustBeClosed := '�����������رձ�.';
  kxmChildrenAttached := '�ӱ������˱�';
  kxmIsAttached := '�˱������һ����.';
  kxmInvalidLocale := '������Ч';
  kxmInvFunction := '��Ч������ %s';
  kxmInvMissParam := '���� %s ������Ч��ȱ��';
  kxmNoFormat := 'û��ָ����ʽ';
  kxmTooManyFieldDefs := '�ֶζ���̫��.������kxm_MAX_FIELDSֵ';
  kxmCannotMixAppendStructure := '���ܸ��Ӻ͸��ƽṹ��';

  SClearSelectedCellsCns := '�����ѡ��Ԫ?';
  SInvalidTextFormatCns := '��Ч�ı���ʽ';
  SInvalidVCLDBIFFormatCns := '��ЧVCLDBIF��ʽ';
  SErrorDuringInsertValueCns := '����ֵʱ��������:';
  SIgnoreErrorCns := '���Ӵ���?';
  STabularInformationCns := '�����Ϣ';
  SPageOfPagesCns := '%d��%dҳ';
  SPreviewCns := 'Ԥ��';
  SFieldNameNotFoundCns := 'û�з����ֶ�''%s''';

  msgGraphicIsEmpty := 'ͼ��Ϊ��';
  msgInvalidBitmap := '��Ч��λͼ';
  msgTiffCompressionNotSupported := '% ͼ��֧��%s ѹ��';
  msgLZWCompressionNotSupported := '��֧��LZWѹ��';
  msgUnsupportedCompressionTag := '��֧�ֵ�ѹ����־,%d';
  msgInvalidImageFormat := '�ڲ�������Чͼ���ʽ';
  msgMethodNotImplemented := '%s ����ûʵ����%s ��';
  msgImageDoesNotHavePalette := 'ͼ��û�е�ɫ��';
  msgUseNewImageToChangeSize := 'ά������NewImage�����ı�';
  msgNotAGrayScaleFormat := '����һ���ҽ�ͼ���ʽ';
  msgCannotAssign := '���ܸ�ֵ%s��%s';
  msgNotAValidPngFile := 'PNG�ļ���Ч���ƻ�';
  msgInvalidColorTypeForBitDepth := '��Ч��λ������ɫ����';
  msgInvalidBitDepth := '��Ч��λ����';
  msgInvalidSampleCount := '��Ч����Ʒ�� ';
  msgJpegMustBeTrueColorOrGrayscale := 'JPEGͼ������ǻҽ׻����ɫ';
  msgTGAMustBeTrueColorOr8Bit := 'TARGAͼ���������ɫ�ʻ�8λ��ɫ��';
  msgFileFormatNotSupported := '%s��ʽ��ͼ���ļ�����֧�ֻ�û��ע�� ';
  msgUnsupportedClipboardFormat := 'δ֪�������ʽ %d';
  msgFrameDoesNotExist := '���%d������';
  msgScannerIsBusy := 'ɨ����æ';
  msgOnlyOneScannerObjectPermitted := 'ֻ��һ��ɨ���Ƕ����Ǳ�����';
  msgUnableToOpenTWAINSourceManager := '���ܴ�TWAINԴ������';
  msgInvalidCropParameters := 'Invalid crop parameters';
  msgOutOfResources := 'ȱ����Դ';
  msgSourceTooSmall := 'Դͼ��̫С';
  msgDestTooSmall := 'Ŀ��ͼ��̫С';
  msgSingleImageFileFormat := '%s��ʽ��֧�ֶ���ͼ��';
  msgInvalidDcxHeader := 'DCX�ļ���ͷ��Ч';
  msgDcxHeaderIsFull := 'DCX�ļ���ͷ����';
  msgGrayScaleTransparentPngNotSupported := 'Gray scale transparent PNG images are not supported.'#13 +
    'Use the ifColor16 or ifColor256 image format instead.';
  msgRegionNotSelected := 'û��ѡ��һ������';
  msgInvalidRubberBandLineStyle := 'Invalid rubberband line style';
  msgRubberbandHandlerNotActive := 'Rubberband mouse handler not active';
  msgTwainSourceMustBeOpen := 'TWAINԴ����򿪣�û�к��� OpenSource';
  msgDirectoryDoesNotExist := 'Ŀ¼������';
  msgEPSFileDoesNotHavePreview := 'EPS�ļ�û��Ԥ��';
  msgUnableToGetTwainDefaultSource := '���ܻ�ȡTWAINĬ��Դ';
  msgUnableToOpenTwainSource := '���ܴ�TWAINԴ';
  msgUnableToDetermineGraphicFormat := '���ܾ���ͼ���ʽ';
  msgInvalidPPMFile := '������ЧPPM�ļ�';
  msgPropertiesDialog := '����...';
  msgDelete := 'ɾ��';

  dcmMeasureAreaText := '�ܳ�%f����,���%fƽ������';
  dcmDefaultFontName := '����';

  dcmAssociationConnectError := '���Ӵ���:%d(������%s:%d))';
  dcmAssociationRetryConnect := '�������³�����';
  dcmDicomConnectNoACK := 'û�л�Ӧ!';
  dcmDicomPrintFilmCreatingError := 'Filmbox����ʧ��!������Ŀ��DICOM�����֧�ִ�ӡ����!';

  dcmScriptRuntimeErrorAt := '�ڽű��ĵ�%d��,%s,�������´���:%s';
  dcmNoPassportError := 'δͨ����֤!';

  dcmLoginError := '����ͼ��¼������ʱ��������:';

  dcmUserCheckError := '�û���֤ʱ��������:';

  dcmUserLoginCaption := '����Աʹ��Ȩ����֤';

  cns_FormDefaultFontName := '����';

  cns_DicomPrintParamForm_Caption := '���������Ƭ����';
  cns_DicomPrinter := 'DICOM�������';
  cns_DicomPrinterFormat := '��ʽ';
  cns_IPAddress := 'IP��ַ';
  cns_DicomPrinterPort := '����˿�';
  cns_CalledAETitle := 'Զ��AET';
  cns_CallingAETitle := '����AET';
  cns_DicomPrintingCopies := '��ӡ����';
  cns_MagnificationType := '��������';
  cns_SmoothingType := 'ƽ����ʽ';

  cns_BorderDensity := '�߽���ܶ�';
  cns_EmptyImageDensity := '�հ׹��ܶ�';
  cns_MinDensity := '��С���ܶ�';
  cns_MaxDensity := '�����ܶ�';
  cns_TrimCaption := '����';
  cns_FilmType := '��Ƭ����';
  cns_FilmGrid := '��Ƭդ��';

  cns_OKCaption := 'ȷ��';
  cns_CancelCaption := 'ȡ��';

  cns_DicomPrintAllSelection := '��ӡ��ǰҳ'#13#10'��ӡ����ҳ';

  cns_Plot3DForm_Caption := '�Ҷ���άͼ';

  cns_BurnCDForm_Caption := '�������ݵ�CD/DVD';
  cns_CDValumeName := '���̾��';
  cns_Info := '��Ϣ';
  cns_QuickEraseCD := '���ٸ�ʽ��';
  cns_EraseCD := '��ʽ��';
  cns_LoadCD := 'װ��';
  cns_EjectCD := '����';
  cns_SaveAsISO := '����ISO';
  cns_BurnISO := '��¼ISO';
  cns_Clear := '���';
  cns_AdvanceSetup := '����';
  cns_BurnCD := '��¼';
  cns_CDImageFileFilter := '����ӳ���ļ�';

  cns_ASPIInitialized_Error := '��ʼ��ASPI�ӿڴ���, ����ϵ�����Ӧ��!';

  cns_StartBurning := '��ʼ��¼,ʹ�ÿ�д��:';
  cns_BurnComfird_caption := 'ȷ�Ͽ�¼CD/DVD ?';
  cns_StartBurnFileTo := '��ʼд�ļ���:';
  cns_AddFilesAndDirsSuccess := '�ɹ�����ļ�/Ŀ¼������.';
  cns_StartBurnISOFile := '��ʼ��¼ISO�ļ�';

  cns_CDWriterReady := '��������׼����';
  cns_CDWriterNotReady := '������δ׼����';

  cns_EjectCDSuccess := '���������������.';
  cns_EjectCDNotSuccess := '������������ʧ��.';

  cns_LoadCDSuccess := 'װ������������.';
  cns_ThisCDIsUnformat := '�˹��̲��ǿɸ�ʽ����';
  cns_EraseCDWarning := '�����ϵ��������ݻᶪʧ��!';
  cns_EraseCDComfird := '��ʽ��������? (����Ҫ 10-70 ����)';
  cns_BurnCDFinishedWithError := 'д/��¼�������,���д���!';
  cns_BurnCDFinished := 'д/��¼���̳ɹ����';
  cns_EraseCDFinishedWithError := '���������������';
  cns_EraseCDFinished := '����������';
  cns_BurnCDFormCaption := 'DICOM���ݹ��̿�¼';

  cns_DeviceCapsForm_Caption := '��������������';

  cns_BurnSetupFormCaption := '��¼����';
  cns_ValumeCaption := '���';
  cns_BurnBufferSize := '��������С:';

  cns_CloseDisc := '��¼���װ����';
  cns_TestWrite := '��¼֮ǰ����';
  cns_EjectAfterBurn := 'д/��¼��ɺ󵯳�����';
  cns_QuickSaveISO := '���ٱ������ӳ��(ISO)';
  cns_BootableCD := '�������Ĺ���';
  cns_ShowFilesBeforeBurn := '��¼ǰ��ʾ�ļ�';

  cns_HisgramForm_Caption := 'ֱ��ͼ';

  cns_LineProfileForm_Caption := '����̬';

  cns_userLogin_InputUserCode := '�������û����';
  cns_userLogin_InputPassword := '����������';
  cns_userLogin_ReInputPassword := '���ٴ�����������';
  cns_userLogin_code_not_same := '������û�������¼��ͬ,���ٴ�����';
  cns_userLogin_old_password_incorrect := '������������¼�Ĳ�ͬ,���ٴ�����';
  cns_userLogin_new_Password_not_same := '������������벻��ͬ,���ٴ�����';
  cns_UserLoginForm_Caption := '�û���¼';
  Cns_UserCode := '�û����';
  Cns_Password := '����';
  Cns_NewPassword := '������';
  Cns_ConfirmPassword := 'ȷ��������';

  cns_Left_Caption := '��';
  cns_Right_Caption := '��';
  cns_Head_Caption := 'ͷ';
  cns_Foot_Caption := '��';
  cns_Front_Caption := 'ǰ';
  cns_After_Caption := '��';

  V_CAN_NOT_OPEN_VFWDEVICE := '���ܴ�ͼ��ɼ��豸!����ͼ��ɼ��豸�Ƿ����,���Ƿ�����,�����������Ƿ�װ��ȷ,����ϵϵͳά����Ա!';
  V_DATASET_NOT_SETTED := '���ݿ�(DicomClient)δ����';
  V_CAN_NOT_START_CAPTURE := 'δ�ܳɹ���ʼ�ɼ�,���ԭ��!';
  V_UNDEFINED_BITFORMAT := 'δ����Ĳɼ���ʽ';
  V_VIDEO_NOT_SUPORT := '��ʾ����ʽ��֧��,' + chr(13) + '����ƵԴδ����!';
  V_SAVE_TO_FILES_SUPORT := '���ر���Ŀ¼����!';
  V_NAME_CAN_NOT_BE_NULL := '���Ʋ���Ϊ�հ�!';
  V_NAME_DUP_ERROR := '�����ظ�!�����벻��ͬ������';
  V_INPUT_NEW_NAME := '����������';
  V_DELETE_RECORD_SUCCESS := 'ɾ���ɹ�';

  V_CAN_NOT_FIND_DETAIL_DATASET := '�Ҳ���ָ������ϸ��!';
  V_DATABASE_NAME_CAN_NOT_BE_NULL := 'δָ�����ݿ�����';
  V_SAVE_IMAGE_ERROR := '����ͼ��ʧ��!';
  V_UNDEFINED_PROFILENAME := '��������δ����ķ�������:';
  V_DELETE_IMAGE_ERROR := '��ɾ��ͼ��ʱ,������ʱ��������:';
  V_NO_SCANER_ERROR := 'û�а�װɨ����';
  V_PROFILE_NAME_NOT_SET := '��������ģ��ķ���ѡ�����!';
  V_CHANGE_PASSWORD_ERROR := '����ͼ�޸�����ʱ��������:';
  V_NO_IMAGE_RECEIVE := 'δ�յ�ͼ����Ϣ!';
  V_RECEIVE_RELEASE_REQUEST_ERROR := '�����������Ͽ����ӵ�����!';
  V_RECEIVE_ABORT_ERROR := '��������������(Abort)';
  V_DICOM_PRINT_FILMBOX_ERROR := '��ӡ�����ص�Filmbox����!';
  V_CONNECT_REJECT_ERROR := '���ӱ��ܾ�!';
  V_CONNECT_ABORT_ERROR := '��Ϊ����ԭ��,������󲻳ɹ�,����ȡ���˼�������,�������缰�������ָ�������!';
  V_REQUEST_WAS_REJECT := '��������ӱ��ܾ�:';
  V_PLEASE_RECONNECT_TO_SERVER := '��Ͽ����Ӻ����ؿ�ʼ�µĲ�ѯ';
  V_CONDITION_ERROR := '���������д���:';
  V_NOT_SAME_STUDYUID := '��ͬ�ļ�鲻�ܼ���ͬһSTUDY��';
  V_NOT_SUPPORT_BITMAP_FORMAT := '��֧��ת��ΪDICOMͼ���λͼ��ʽ';
  V_NOT_SUPPORT_DICOM_FORMAT := '����ʶ���ͼ���ʽ!';
  V_CONNECT_AOTO_RESTORE := '�ͻ���ͨѶ�Զ��ָ�';
  V_EXECSQL_ERROR := 'ִ��SQLʱ,��������������:';
  V_NO_IMAGES_TO_PRINT := 'û��ͼ��ɴ�ӡ!';
  V_DICOM_PRINTER_NOT_SETTING := 'DICOM��ӡ��û����,��δѡ��';
  V_DICOM_PRINT_FINISH := 'ͼ���ӡ�������!';
  V_DICOM_PRINT_SETTING := '���������������,��ӡ';
  V_SIGN_VMF := '���ֱ�ע�����ø�Ϊ:X1:=%d,Y1:=%d,X2:=%d,Y2:=%d,H:=%d,Բ���Ϊ:=%d';
  V_PLEASE_DRAW_TWO_TEXT := 'Ӧ���Ȼ����ٶ���ͼ�α�ע,����δ�ɹ�,��������һ�����ֱ�ע��һ��Բ���ע����';
  V_NO_SIGNIMAGE := 'ͼ��û�б��ͼ';
  V_NEED_A_LENGTH := 'ѡ���ֱ���������һ����֪����';
  V_SEND_IMAGE_SUCCESS := '�������!';
  V_NO_BUFFER_ERROR := '�ɼ�������δ����!';
  V_CAN_NOT_FIND_VERSIONINFO := '���������������汾��Ϣ!';
  V_DONT_NEED_UPDATE := '�����µ�,����Ҫ����!';
  V_CHECK_SERSION_ERROR := '���ӵ����������а汾���ʱ��������:';
  V_CLICK_OK_AFTER_COMPRESS := '��ѹ�����ʱ,��OK�ϴ����򵽷�����';
  V_COMPRESS_ERROR := 'ִ��ѹ��ʱ���ִ���:%s!';
  V_UPDATE_FINISH := '�ɹ����µ�������';
  V_FILE_COPY_ERROR := '�ļ�����ʧ��';
  V_OPEN_DICOMDIR_ERROR := '��DICOMDIRʧ��';
  V_NOT_ASSIGNED_ONNEWIMAGE := 'ͼ�񱣴汻ȡ��,������OnNewImage�¼�';
  V_NOT_RECEIVE_IMAGES := 'δ�յ�������������ͼ��,������ͼ��ת��/����/ɾ��,����ϵͳ����Ա��ѯ';
  V_SET_PREVIEW_FIRST := '����������ͼ��Դ������ΪԤ��ģʽ!';

  V_CAPTURE_A_IMAGE_FIRST := '��ѡ�ɼ�����һ��ͼ��';
  V_DRAW_A_RECT := '�뻭һ�����η�Χ����ѡ��˵��е�<���ü��÷�Χ>';
  V_NO_SELECTED_RECT := 'δѡ�����÷�Χ';
  V_CAN_NOT_FIND_FILE := '�Ҳ����ļ���';

  V_IS_NOT_A_SQ_TYPE_DATA := '����SQ����,����ת��Ϊ���ݱ�';

  V_DICOM_PRINT_ERROR := '��ӡ��Ƭʧ��,�ٴδ�ӡ��?';
  V_PRINT_CONNECT_FAIL := '����ʧ��: ';

  V_OPENTABLE_ERROR := 'PACS������(%s)���Ӵ���������������Ƿ���ȷ���������ӵ��������������Ƿ�������' +
    '��PACS�����Ƿ��������У�������������ָ�������ԣ���ر����˳���Ӧ�ó���';

  V_OPENTABLE_DBERROR := '���ݿ������(%s)���Ӵ�������������ϵ����Ա�鿴���ݿ�����Ƿ��������У�' +
    '���ڷ���ָ�������ԣ���ر����˳���Ӧ�ó���';
end;

{--------------------------------------------------------------------------}
initialization
  //  InitMsgAsChs;
end.

