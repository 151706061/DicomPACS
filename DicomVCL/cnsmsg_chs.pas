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
  cns_Confirm_Delete_Image := '删除所选图像吗?';
  kxmMasterlinkErr := '主字段号跟索引字段号不符';
  kxmSelfRef := '不允许自我建立主从连接';
  kxmFindNearestErr := '在无序数据中不能近似查找';
  kxminternalOpen1Err := '字段定义';
  kxminternalOpen2Err := '不支持数据类型 %d ';
  kxmReadOnlyErr := '字段 %s 只读';
  kxmVarArrayErr := '数组变量值的维数无效';
  kxmVarReason1Err := '字段数目超过值数目';
  kxmVarReason2Err := '必须至少有一个字段';
  kxmBookmErr := '没有发现书签 %d';
  kxmUnknownFieldErr1 := '未知字段类型';
  kxmUnknownFieldErr2 := '在CSV文件内.(%s)';
  kxmIndexErr := '不能在字段 %s 索引';
  kxmEditModeErr := '数据集不在编辑模式';
  kxmDatasetRemoveLockedErr := '数据集在锁定的时候被删除';
  kxmSetDatasetLockErr := '数据集锁定，不能改变';
  kxmOutOfBookmarks := '书签计数器溢出。请关闭和重新打开表';
  kxmIndexNotExist := '索引%s 不存在';
  kxmKeyFieldsChanged := '当字段改变时，不能执行操作';
  kxmDupIndex := '复制索引值操作失败';
  kxmMissingNames := '索引定义缺少名字或字段名';
  kxmInvalidRecord := '无效的记录';
  kxmTransactionVersioning := '事务处理需要多种处理';
  kxmNoCurrentRecord := '不是当前记录';
  kxmCantAttachToSelf := '内存表不能自我连接';
  kxmCantAttachToSelf2 := '不能附加到附表';
  kxmUnknownOperator := '未知操作者 (%d)';
  kxmUnknownFieldType := '未知字段类型 (%d)';
  kxmOperatorNotSupported := '操作者不支持 (%d).';
  kxmSavingDeltasBinary := '只有二进制支持保存增量';
  kxmCantCheckpointAttached := '不能检查附表';
  kxmDeltaHandlerAssign := '增量句柄没有赋值给任何内存表';
  kxmOutOfRange := '溢出范围 (%d)';
  kxmInvArgument := '无效变量';
  kxmInvOptions := '无效选项';
  kxmTableMustBeClosed := '这个操作必须关闭表.';
  kxmChildrenAttached := '子表附属到此表';
  kxmIsAttached := '此表关联另一个表.';
  kxmInvalidLocale := '本地无效';
  kxmInvFunction := '无效函数名 %s';
  kxmInvMissParam := '函数 %s 参数无效或缺少';
  kxmNoFormat := '没有指定格式';
  kxmTooManyFieldDefs := '字段定义太多.请增加kxm_MAX_FIELDS值';
  kxmCannotMixAppendStructure := '不能附加和复制结构体';

  SClearSelectedCellsCns := '清除所选单元?';
  SInvalidTextFormatCns := '无效文本格式';
  SInvalidVCLDBIFFormatCns := '无效VCLDBIF格式';
  SErrorDuringInsertValueCns := '插入值时发生错误:';
  SIgnoreErrorCns := '忽视错误?';
  STabularInformationCns := '表格信息';
  SPageOfPagesCns := '%d的%d页';
  SPreviewCns := '预览';
  SFieldNameNotFoundCns := '没有发现字段''%s''';

  msgGraphicIsEmpty := '图像为空';
  msgInvalidBitmap := '无效的位图';
  msgTiffCompressionNotSupported := '% 图像不支持%s 压缩';
  msgLZWCompressionNotSupported := '不支持LZW压缩';
  msgUnsupportedCompressionTag := '不支持的压缩标志,%d';
  msgInvalidImageFormat := '内部错误：无效图像格式';
  msgMethodNotImplemented := '%s 方法没实现在%s 类';
  msgImageDoesNotHavePalette := '图像没有调色板';
  msgUseNewImageToChangeSize := '维数随着NewImage方法改变';
  msgNotAGrayScaleFormat := '不是一个灰阶图像格式';
  msgCannotAssign := '不能赋值%s给%s';
  msgNotAValidPngFile := 'PNG文件无效或破坏';
  msgInvalidColorTypeForBitDepth := '无效的位长度颜色类型';
  msgInvalidBitDepth := '无效的位长度';
  msgInvalidSampleCount := '无效的样品号 ';
  msgJpegMustBeTrueColorOrGrayscale := 'JPEG图像必须是灰阶或真彩色';
  msgTGAMustBeTrueColorOr8Bit := 'TARGA图像必须是真色彩或8位调色板';
  msgFileFormatNotSupported := '%s格式的图像文件不被支持或还没有注册 ';
  msgUnsupportedClipboardFormat := '未知剪贴板格式 %d';
  msgFrameDoesNotExist := '框架%d不存在';
  msgScannerIsBusy := '扫描仪忙';
  msgOnlyOneScannerObjectPermitted := '只有一个扫描仪对象是被允许';
  msgUnableToOpenTWAINSourceManager := '不能打开TWAIN源管理者';
  msgInvalidCropParameters := 'Invalid crop parameters';
  msgOutOfResources := '缺乏资源';
  msgSourceTooSmall := '源图像太小';
  msgDestTooSmall := '目标图像太小';
  msgSingleImageFileFormat := '%s格式不支持多重图像';
  msgInvalidDcxHeader := 'DCX文件报头无效';
  msgDcxHeaderIsFull := 'DCX文件报头完整';
  msgGrayScaleTransparentPngNotSupported := 'Gray scale transparent PNG images are not supported.'#13 +
    'Use the ifColor16 or ifColor256 image format instead.';
  msgRegionNotSelected := '没有选定一个区域';
  msgInvalidRubberBandLineStyle := 'Invalid rubberband line style';
  msgRubberbandHandlerNotActive := 'Rubberband mouse handler not active';
  msgTwainSourceMustBeOpen := 'TWAIN源必须打开；没有呼叫 OpenSource';
  msgDirectoryDoesNotExist := '目录不存在';
  msgEPSFileDoesNotHavePreview := 'EPS文件没有预览';
  msgUnableToGetTwainDefaultSource := '不能获取TWAIN默认源';
  msgUnableToOpenTwainSource := '不能打开TWAIN源';
  msgUnableToDetermineGraphicFormat := '不能决定图像格式';
  msgInvalidPPMFile := '不是有效PPM文件';
  msgPropertiesDialog := '属性...';
  msgDelete := '删除';

  dcmMeasureAreaText := '周长%f厘米,面积%f平方厘米';
  dcmDefaultFontName := '宋体';

  dcmAssociationConnectError := '连接错误:%d(服务器%s:%d))';
  dcmAssociationRetryConnect := '现在重新尝试吗';
  dcmDicomConnectNoACK := '没有回应!';
  dcmDicomPrintFilmCreatingError := 'Filmbox创建失败!可能是目标DICOM相机不支持打印参数!';

  dcmScriptRuntimeErrorAt := '在脚本的第%d行,%s,发生以下错误:%s';
  dcmNoPassportError := '未通过认证!';

  dcmLoginError := '你企图登录服务器时发生错误:';

  dcmUserCheckError := '用户验证时发生错误:';

  dcmUserLoginCaption := '操作员使用权限验证';

  cns_FormDefaultFontName := '宋体';

  cns_DicomPrintParamForm_Caption := '激光照相冲片参数';
  cns_DicomPrinter := 'DICOM激光相机';
  cns_DicomPrinterFormat := '格式';
  cns_IPAddress := 'IP地址';
  cns_DicomPrinterPort := '服务端口';
  cns_CalledAETitle := '远程AET';
  cns_CallingAETitle := '本地AET';
  cns_DicomPrintingCopies := '打印份数';
  cns_MagnificationType := '缩放类型';
  cns_SmoothingType := '平滑方式';

  cns_BorderDensity := '边界光密度';
  cns_EmptyImageDensity := '空白光密度';
  cns_MinDensity := '最小光密度';
  cns_MaxDensity := '最大光密度';
  cns_TrimCaption := '对齐';
  cns_FilmType := '胶片类型';
  cns_FilmGrid := '胶片栅格';

  cns_OKCaption := '确定';
  cns_CancelCaption := '取消';

  cns_DicomPrintAllSelection := '打印当前页'#13#10'打印所有页';

  cns_Plot3DForm_Caption := '灰度三维图';

  cns_BurnCDForm_Caption := '备份数据到CD/DVD';
  cns_CDValumeName := '光盘卷标';
  cns_Info := '信息';
  cns_QuickEraseCD := '快速格式化';
  cns_EraseCD := '格式化';
  cns_LoadCD := '装入';
  cns_EjectCD := '弹出';
  cns_SaveAsISO := '构建ISO';
  cns_BurnISO := '刻录ISO';
  cns_Clear := '清除';
  cns_AdvanceSetup := '设置';
  cns_BurnCD := '刻录';
  cns_CDImageFileFilter := '光盘映像文件';

  cns_ASPIInitialized_Error := '初始化ASPI接口错误, 请联系软件供应商!';

  cns_StartBurning := '开始刻录,使用刻写机:';
  cns_BurnComfird_caption := '确认刻录CD/DVD ?';
  cns_StartBurnFileTo := '开始写文件到:';
  cns_AddFilesAndDirsSuccess := '成功添加文件/目录到光盘.';
  cns_StartBurnISOFile := '开始刻录ISO文件';

  cns_CDWriterReady := '驱动器已准备好';
  cns_CDWriterNotReady := '驱动器未准备好';

  cns_EjectCDSuccess := '弹出光盘命令完成.';
  cns_EjectCDNotSuccess := '弹出光盘命令失败.';

  cns_LoadCDSuccess := '装入光盘命令完成.';
  cns_ThisCDIsUnformat := '此光盘不是可格式化的';
  cns_EraseCDWarning := '光盘上的所有数据会丢失的!';
  cns_EraseCDComfird := '格式化光盘吗? (将需要 10-70 分钟)';
  cns_BurnCDFinishedWithError := '写/刻录过程完成,但有错误!';
  cns_BurnCDFinished := '写/刻录过程成功完成';
  cns_EraseCDFinishedWithError := '清除过程因错误完成';
  cns_EraseCDFinished := '清除过程完成';
  cns_BurnCDFormCaption := 'DICOM数据光盘刻录';

  cns_DeviceCapsForm_Caption := '光盘驱动器性能';

  cns_BurnSetupFormCaption := '刻录设置';
  cns_ValumeCaption := '卷标';
  cns_BurnBufferSize := '缓冲区大小:';

  cns_CloseDisc := '刻录后封装光盘';
  cns_TestWrite := '刻录之前测试';
  cns_EjectAfterBurn := '写/刻录完成后弹出光盘';
  cns_QuickSaveISO := '快速保存光盘映像(ISO)';
  cns_BootableCD := '可启动的光盘';
  cns_ShowFilesBeforeBurn := '刻录前显示文件';

  cns_HisgramForm_Caption := '直方图';

  cns_LineProfileForm_Caption := '线形态';

  cns_userLogin_InputUserCode := '请输入用户编号';
  cns_userLogin_InputPassword := '请输入密码';
  cns_userLogin_ReInputPassword := '请再次输入新密码';
  cns_userLogin_code_not_same := '输入的用户编号与登录不同,请再次输入';
  cns_userLogin_old_password_incorrect := '输入的密码与登录的不同,请再次输入';
  cns_userLogin_new_Password_not_same := '两次输入的密码不相同,请再次输入';
  cns_UserLoginForm_Caption := '用户登录';
  Cns_UserCode := '用户编号';
  Cns_Password := '密码';
  Cns_NewPassword := '新密码';
  Cns_ConfirmPassword := '确认新密码';

  cns_Left_Caption := '左';
  cns_Right_Caption := '右';
  cns_Head_Caption := '头';
  cns_Foot_Caption := '脚';
  cns_Front_Caption := '前';
  cns_After_Caption := '后';

  V_CAN_NOT_OPEN_VFWDEVICE := '不能打开图像采集设备!请检查图像采集设备是否存在,或是否连接,或驱动程序是否安装正确,或联系系统维护人员!';
  V_DATASET_NOT_SETTED := '数据库(DicomClient)未设置';
  V_CAN_NOT_START_CAPTURE := '未能成功开始采集,请查原因!';
  V_UNDEFINED_BITFORMAT := '未定义的采集格式';
  V_VIDEO_NOT_SUPORT := '显示器格式不支持,' + chr(13) + '或视频源未连接!';
  V_SAVE_TO_FILES_SUPORT := '本地保存目录出错!';
  V_NAME_CAN_NOT_BE_NULL := '名称不能为空白!';
  V_NAME_DUP_ERROR := '名称重复!请输入不相同的名称';
  V_INPUT_NEW_NAME := '输入新名称';
  V_DELETE_RECORD_SUCCESS := '删除成功';

  V_CAN_NOT_FIND_DETAIL_DATASET := '找不到指定的明细表!';
  V_DATABASE_NAME_CAN_NOT_BE_NULL := '未指定数据库名称';
  V_SAVE_IMAGE_ERROR := '保存图像失败!';
  V_UNDEFINED_PROFILENAME := '服务器端未定义的分组名称:';
  V_DELETE_IMAGE_ERROR := '你删除图像时,服务器时发生错误:';
  V_NO_SCANER_ERROR := '没有安装扫描仪';
  V_PROFILE_NAME_NOT_SET := '病例报告模板的分组选择错误!';
  V_CHANGE_PASSWORD_ERROR := '你企图修改密码时发生错误:';
  V_NO_IMAGE_RECEIVE := '未收到图像信息!';
  V_RECEIVE_RELEASE_REQUEST_ERROR := '服务器传来断开连接的请求!';
  V_RECEIVE_ABORT_ERROR := '服务器传来放弃(Abort)';
  V_DICOM_PRINT_FILMBOX_ERROR := '打印机返回的Filmbox错误!';
  V_CONNECT_REJECT_ERROR := '连接被拒绝!';
  V_CONNECT_ABORT_ERROR := '因为网络原因,你的请求不成功,而你取消了继续尝试,请在网络及服务器恢复后重试!';
  V_REQUEST_WAS_REJECT := '申请的连接被拒绝:';
  V_PLEASE_RECONNECT_TO_SERVER := '请断开连接后再重开始新的查询';
  V_CONDITION_ERROR := '条件设置有错误:';
  V_NOT_SAME_STUDYUID := '不同的检查不能加在同一STUDY下';
  V_NOT_SUPPORT_BITMAP_FORMAT := '不支持转换为DICOM图像的位图格式';
  V_NOT_SUPPORT_DICOM_FORMAT := '不能识别的图像格式!';
  V_CONNECT_AOTO_RESTORE := '客户端通讯自动恢复';
  V_EXECSQL_ERROR := '执行SQL时,服务器发生错误:';
  V_NO_IMAGES_TO_PRINT := '没有图像可打印!';
  V_DICOM_PRINTER_NOT_SETTING := 'DICOM打印机没设置,或未选择';
  V_DICOM_PRINT_FINISH := '图像打印发送完成!';
  V_DICOM_PRINT_SETTING := '激光照相参数设置,打印';
  V_SIGN_VMF := '文字标注的设置改为:X1:=%d,Y1:=%d,X2:=%d,Y2:=%d,H:=%d,圆点高为:=%d';
  V_PLEASE_DRAW_TWO_TEXT := '应首先画到少二个图形标注,设置未成功,请拖至少一个文字标注和一个圆点标注再试';
  V_NO_SIGNIMAGE := '图像没有标记图';
  V_NEED_A_LENGTH := '选按现比例尽测量一个已知长度';
  V_SEND_IMAGE_SUCCESS := '传送完成!';
  V_NO_BUFFER_ERROR := '采集卡缓冲未分配!';
  V_CAN_NOT_FIND_VERSIONINFO := '本程序自身不包括版本信息!';
  V_DONT_NEED_UPDATE := '是最新的,不需要更新!';
  V_CHECK_SERSION_ERROR := '连接到服务器进行版本检查时发生错误:';
  V_CLICK_OK_AFTER_COMPRESS := '当压缩完成时,点OK上传程序到服务器';
  V_COMPRESS_ERROR := '执行压缩时出现错误:%s!';
  V_UPDATE_FINISH := '成功更新到服务器';
  V_FILE_COPY_ERROR := '文件复制失败';
  V_OPEN_DICOMDIR_ERROR := '打开DICOMDIR失败';
  V_NOT_ASSIGNED_ONNEWIMAGE := '图像保存被取消,请设置OnNewImage事件';
  V_NOT_RECEIVE_IMAGES := '未收到向服务器申请的图像,可能是图像被转移/备份/删除,请向系统管理员咨询';
  V_SET_PREVIEW_FIRST := '请首先连接图像源及设置为预览模式!';

  V_CAPTURE_A_IMAGE_FIRST := '请选采集至少一幅图像';
  V_DRAW_A_RECT := '请画一个矩形范围，并选择菜单中的<设置剪裁范围>';
  V_NO_SELECTED_RECT := '未选定剪裁范围';
  V_CAN_NOT_FIND_FILE := '找不到文件：';

  V_IS_NOT_A_SQ_TYPE_DATA := '不是SQ类型,不能转换为数据表';

  V_DICOM_PRINT_ERROR := '打印胶片失败,再次打印吗?';
  V_PRINT_CONNECT_FAIL := '连接失败: ';

  V_OPENTABLE_ERROR := 'PACS服务器(%s)连接错误，请检查参数配置是否正确，电脑连接到服务器的网络是否正常，' +
    '或PACS服务是否正常运行，请在网络或服务恢复后点重试，点关闭则退出本应用程序';

  V_OPENTABLE_DBERROR := '数据库服务器(%s)连接错误，请检查马上联系管理员查看数据库服务是否正常运行，' +
    '请在服务恢复后点重试，点关闭则退出本应用程序';
end;

{--------------------------------------------------------------------------}
initialization
  //  InitMsgAsChs;
end.

