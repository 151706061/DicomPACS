unit KxDicomClient;

interface

{.$DEFINE DEBUG}

uses
  {$IFDEF LINUX}Types, Libc, {$ELSE}Windows, {$ENDIF}Classes, SysUtils
  {$IFDEF LEVEL6}, Variants{$ENDIF}{$IFNDEF LEVEL6}, filectrl{$ENDIF}
  , Forms, DCM_Client, cnsmsg, dialogs, controls, DCM_Attributes, DCM_View, DCM_UID
  {$IFDEF DEBUG}, dbugintf{$ENDIF}
  , ExtCtrls, DCM32, DCM_Connection, KxDicomClientForm, Graphics, DB;
type
  TWebDicomViewShowCaptureDialogExEvent = procedure(const AProfileName,
    APatientName, APatientID, APatientSex, APatientAge, APatientStudyID,
    AStudyUID: WideString; APatientDOB: Double) of object;

  TOnShowPatientInfoEvent = procedure(Sender: TObject; ADataSet: TDataset; AAccessBumber, AProfile:
    string; AEditable: Boolean; ADockPanel: TWinControl; ANeedDock: Boolean) of object;

  TOnSaveStudyReportEvent = procedure(Sender: TObject; AStudyUID, AAccessnumber: string) of
    object;

  TCnsSystemmenuClickEvent = procedure(Sender: TObject; AMenuName: string; ATag: integer) of
    object;
  TOnGetMainDatasetEvent = procedure(Sender: TObject; var ADataset: TCnsDBTable) of object;

  TOnAfterFinishVideoCaptureEvent = procedure(Sender: TObject; AStudyUID: string) of object;
  //  TOnCreateCustomImageFormEvent = procedure(Sender: TObject; var AForm: TImageFormBase) of object;
  TOnBeforeConnectToServerEvent = procedure(Sender: TObject; var AHost: string; var APort: Integer)
    of object;

  TOnCreateImageFormEvent = procedure(Sender: TObject; var AForm: TViewerBaseForm) of object;
  TOnAfterCreateImageFormEvent = procedure(Sender: TObject; const AForm: TViewerBaseForm) of object;

  TWadoViewerClient = class(TComponent)
  private
    FImageForms: TList;

    FActive: Boolean;

    FHost: string;
    FPort: integer;
    fCalledAE: string;
    fCallingAE: string;

    FOnViewFlagChange: TNotifyEvent;
    FOnBeforeLoadImage: TNotifyEvent;
    //FOnAfterCaptureASeriesImage: TNotifyEvent;
    FOnAfterLoadImage: TNotifyEvent;
    FOnNewImage: TOnAddImageEvent;
    FOnAfterFinishVideoCapture: TOnAfterFinishVideoCaptureEvent;
    //    fOnBeforeConnectToServer: TOnBeforeConnectToServerEvent;
    //FOnBeforeFilmPrint: TOnBeforeDicomFilmPrintEvent;
    FOnCanUpdateimage: TOnCanUpdateimageEvent;
    //    FOnCreateCustomImageForm: TOnCreateCustomImageFormEvent;
    FOnDicomPrintFilm: TOnDicomPrintFilmEvent;
    FGetCurrentDataset: TOnGetCurrentDatasetEvent;
    //    FOnGetMainDataset: TOnGetMainDatasetEvent;
    FOnDeleteImage: TOnSaveImageQuestionEvent;
    FOnShowForm: TOnShowFormEvent;

    FOnInitImageForm: TOnShowFormEvent;

    FViewerColor: TColor;
    FOnAfterDicomPrintFilm: TOnPrintImageToFilm;
    FWadoTranferSyntax: string;
    FLevel: string;
    FAuthType: Integer;
    FPassword: string;
    FUserName: string;
    FOnGetStudyReportText: TOnGetStudyReportTextEvent;
    fOnSelectMultiSeries: TOnSelectMultiSeriesEvent;

    FOnImageAfterObjectSize: TDrawObjectNotifyEvent;
    FOnImageAfterNewDrawObject: TDrawObjectNotifyEvent;
    FOnImageAfterObjectMove: TDrawObjectNotifyEvent;
    fOnImageSelectChange: TNotifyEvent;
    fOnImageStateChange: TNotifyEvent;
    FOnAfterCreateViewerForm: TOnAfterCreateImageFormEvent;
    FOnCreateViewerForm: TOnCreateImageFormEvent;
    FOnDicomPrintFilmGetAccessionNumber: TOnDicomPrintFilmGetAccessionNumberEvent;
    FMaxImageFormNumber: Integer;
    FOnSelectMultiFilms: TOnSelectMultiSeriesEvent;
    FOnCanExportImage: TOnSaveImageQuestionEvent;
    FOnCanSaveAsImage: TOnSaveImageQuestionEvent;
    FOnCanSendImage: TOnSaveImageQuestionEvent;
    FLoadStyle: Boolean;
    FShowImageFormBeforeLoadImage: Boolean;
    FOnBeforeClearImageNotify: TBeforeClearImageNotifyEvent;
    FOnAfterClearImageNotify: TBeforeClearImageNotifyEvent;
    function GetCurrentDataset: TDicomDatasets;
    function GetPrintDataset: TDicomDatasets;
    procedure SetActive(const Value: Boolean);

    procedure SetHost(const Value: string);
    procedure SetPort(const Value: integer);
    function VerifyServer: Boolean;
    function NewImageForm: TViewerBaseForm;
    procedure SetViewerColor(const Value: TColor);
    procedure SetOnAfterDicomPrintFilm(const Value: TOnPrintImageToFilm);
    procedure DoIconImageReceive(Sender: TObject;
      ADataset: TDicomAttribute);
    procedure DoNewImage(Sender: TObject; ADataset: TDicomDataset);
    procedure SetWadoTranferSyntax(const Value: string);
    procedure SetLevel(const Value: string);
    procedure SetAuthType(const Value: Integer);
    procedure SetPassword(const Value: string);
    procedure SetUserName(const Value: string);
    function GetDicomDataset(index: Integer): TDicomDatasets;
    function GetDicomDatasetCount: Integer;
    procedure SetOnGetStudyReportText(
      const Value: TOnGetStudyReportTextEvent);
    procedure DoGetStudyReportText(Sender: TObject; const AStudyUID, AstudyID: string; var
      AStudyHtml: string);
    procedure SetOnIintImageForm(const Value: TOnShowFormEvent);
    procedure SetOnAfterCreateViewerForm(
      const Value: TOnAfterCreateImageFormEvent);
    procedure SetOnCreateViewerForm(const Value: TOnCreateImageFormEvent);
    procedure SetOnDicomPrintFilmGetAccessionNumber(
      const Value: TOnDicomPrintFilmGetAccessionNumberEvent);
    procedure SetMaxImageFormNumber(const Value: Integer);
    procedure SetOnSelectMultiFilms(
      const Value: TOnSelectMultiSeriesEvent);
    procedure DoSelectMultiFilm(Sender: TObject; ADataSet: TDataset;
      const AStudyUIDS, AImagesUIDS: TStringList);
    procedure SetOnCanExportImage(const Value: TOnSaveImageQuestionEvent);
    procedure SetOnCanSaveAsImage(const Value: TOnSaveImageQuestionEvent);
    procedure SetOnCanSendImage(const Value: TOnSaveImageQuestionEvent);
    procedure SetLoadStyle(const Value: Boolean);
    procedure SetShowImageFormBeforeLoadImage(const Value: Boolean);
    procedure SetOnAfterClearImageNotify(
      const Value: TBeforeClearImageNotifyEvent);
    procedure SetOnBeforeClearImageNotify(
      const Value: TBeforeClearImageNotifyEvent);
  protected
    procedure DoOnPrintFilm(Sender: TObject; var AResult: Boolean);
    procedure DoAfterPrintFilm(Sender: TObject; ADataset: TDicomDataset; APrinterName: string);
    procedure DoDicomPrintFilmGetAccessionNumber(Sender: TObject; var AUserName, AFilmDesc, AAccessionNumber: string);
    procedure DoAfterLoadImage(Sender: TObject);
    procedure DoOnImageFlagChange(Sender: TObject);

    procedure DoAskDicomDeleteImage(Sender: TObject; HaveNotSaved: Boolean; var CanBeDelete:
      Boolean; AInstanceUID: string);
    procedure DoAskDicomExportImage(Sender: TObject; HaveNotSaved: Boolean; var CanBeDelete:
      Boolean; AInstanceUID: string);
    procedure DoAskDicomSendImage(Sender: TObject; HaveNotSaved: Boolean; var CanBeDelete:
      Boolean; AInstanceUID: string);
    procedure DoAskDicomSaveAsImage(Sender: TObject; HaveNotSaved: Boolean; var CanBeDelete:
      Boolean; AInstanceUID: string);
    procedure DoSelectMultiSeries(Sender: TObject; ADataSet: TDataset; const AStudyUIDS,
      ASeriesUIDS: TStringList);

    procedure DoImageSelectChange(Sender: TObject);
    procedure DoImageStateChange(Sender: TObject);
    procedure DoImageAfterNewDrawObject(Sender: TObject; AObject: TDicomDrawObject);
    procedure DoImageAfterObjectMove(Sender: TObject; AObject: TDicomDrawObject);
    procedure DoImageAfterObjectSize(Sender: TObject; AObject: TDicomDrawObject);

    procedure DoFormShow(Sender: TObject; AFormType: TKxFormType; const AForm: TForm; AIndex:
      Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Loaded; override;

    procedure RefreshView;

    function IsStudyLoading1(AUID: string): Boolean;
    function IsStudyLoading(AUID: string): Boolean;
    function IsLoadStudyUID(AUID: string): TCnsDMTable;
    procedure DeleteAllDataset;

    procedure InitData(AMode: Integer);
    procedure LoadUserConfig;

    function CreateDBTable: TCnsDBTable;
    function CreateProcedure: TCnsStorageProcedure;
    procedure ExecSQL(ADatabase, ASQL: string);

    function GetImageForm: TViewerBaseForm;

    procedure ChangeDatasets(ADatasets: TDicomAttributes);

    function LoadFromDatasets(AName: string; ADatasets: TDicomDatasets): Boolean;

    function GetModality(AProfileName: string): string;
    function GetCaptureMode(AProfilename: string): Integer;

    function NewDatasets(AName, AStudyUID: string): TCnsDMTable;

    function LoadImagesFrom(AHost: string; APort: Integer; AProfileName, AName, AStudyUID: string; AMode: Integer;
      ALock: Boolean; AOnlyLoadKeyImage: Boolean;
      APatientName, AHospitalName, APatientID, APaperStudyUID: string): Boolean;
    function LoadFilmImagesFrom(AHost: string; APort: Integer; AProfileName, AName, AStudyUID: string; AMode: Integer;
      ALock: Boolean; AOnlyLoadKeyImage: Boolean;
      APatientName, AHospitalName, APatientID, APaperStudyUID: string): Boolean;

    function LoadImages(AProfileName, AName, AStudyUID: string; AMode: Integer; ALock: Boolean;
      AOnlyLoadKeyImage: Boolean; APatientName, AHospitalName, APatientID, APaperStudyUID: string): Boolean;
    //从网络装入图像
  {AName 显示在图像列表TAB上的名称,一般为病人姓名,也可加上检查时间等
  AStudyUID  图像UID
  ANeedLock 是否需要锁定图像,锁定图像后,图像保留在列表里,不随调下一个图像时自动清除}

    function LoadFromDicomdir(AName, AimagePath: string): Boolean; //读DICOMDIR
    {AName 显示在图像列表TAB上的名称,一般为病人姓名,也可加上检查时间等
    AImagePath  DICOMDIR的路径(目录)}

    function LoadDcmFileDir(AName, AImagePath: string): Boolean; //读本地图像,二级目录
    function LoadDcmFileDirEx(AName, AImagePath: string): Boolean; //读本地图像,N级目录
    {AName 显示在图像列表TAB上的名称,一般为病人姓名,也可加上检查时间等
    AImagePath  图像的路径(目录)}

    function LoadDcmFile(AName, AFileName: string): Boolean; //调入单一个DICOM图像文件
    {AName 显示在图像列表TAB上的名称,一般为病人姓名,也可加上检查时间等
    AFileName  图像的文件名称}

    procedure DisplayImagepanel; //显示图像观察与操作界面
    procedure UndockImagePanel; //不显示图像观察与操作界面

    procedure ShowReportDialog(AProfileName: string; var AStr1, AStr2: string);
    //打开报告模板选择及编辑对话窗口
  {AProfileName 分组名称
  ASstr1,AStr2 对应报告的两部分(描述与诊断提示)的传入与传出}

    function GetSelectedCount: Integer; //选中到打印的图像数
    procedure GetSelectedBitmap(ImageIndex: integer; DstBitmap: TBitmap);
    //取选中的第ImageIndex幅图像,当DstBitmap不为空时,缩放为目标大小

    function GetSelectedImageLabels(ImageIndex, Labelindex: Integer): string;
    //取选中的第ImageIndex幅图像上的两个标记 文字,针对内镜检查的标记

    procedure SaveImages; //保存图像
    procedure SaveimageFlag; //保存标记,必须在
    procedure SaveImagesToLocalPath(APathName: string); //保存图像到指定本地目录

    procedure RemoveSelectedImages; //删除选中的图像

    procedure ClearLoadedImages(AStudyUID: string); //清除装入图像

    function GetStudies(AProfName: string; var APatientID: string; var AREPORT_DATE: TDatetime):
      string;
    //选择检查,针对CT,CR,DR,MR等DICOM传送的图像检查,显示一个列表让操作员选择,返回StudyUID号,即图像检查的唯一号
    //显示列表的条件由 APatientID (病的ID) AREPORT_DATE (检查日期) AProfName (分组名称)过滤

    function GetStudiesEx(AProfName: string; var APatientID: string; AName, AStudyID: string; var
      AREPORT_DATE: TDatetime): string;
    //选择检查,针对CT,CR,DR,MR等DICOM传送的图像检查,显示一个列表让操作员选择,返回StudyUID号,即图像检查的唯一号
    //显示列表的条件由 APatientID (病的ID) AREPORT_DATE (检查日期) AProfName (分组名称) AName (病人姓名) AStudyID(检查号)过滤

    property CurrentDataset: TDicomDatasets read GetCurrentDataset;
    property PrintDataset: TDicomDatasets read GetPrintDataset;

    property DicomDatasetCount: Integer read GetDicomDatasetCount;
    property DicomDatasets[index: Integer]: TDicomDatasets read GetDicomDataset;

    property Active: Boolean read FActive write SetActive; //连接到服务器
    property WadoTranferSyntax: string read FWadoTranferSyntax write SetWadoTranferSyntax;
    property Level: string read FLevel write SetLevel;

    property LoadStyle: Boolean read FLoadStyle write SetLoadStyle;
    property MaxImageFormNumber: Integer read FMaxImageFormNumber write SetMaxImageFormNumber;
    property ShowImageFormBeforeLoadImage: Boolean read FShowImageFormBeforeLoadImage write SetShowImageFormBeforeLoadImage;
  published
    property ViewerColor: TColor read FViewerColor write SetViewerColor;

    property Host: string read FHost write SetHost; //服务器的IP
    property Port: integer read FPort write SetPort; //服务器端口号
    property CallingAE: string read fCallingAE write fCallingAE;
    property CalledAE: string read fCalledAE write fCalledAE;

    property UserName: string read FUserName write SetUserName;
    property Password: string read FPassword write SetPassword;
    property AuthType: Integer read FAuthType write SetAuthType;

    property OnBeforeLoadImage: TNotifyEvent read FOnBeforeLoadImage write FOnBeforeLoadImage;
    property OnAfterLoadImage: TNotifyEvent read FOnAfterLoadImage write FOnAfterLoadImage;
    property OnViewFlagChange: TNotifyEvent read FOnViewFlagChange write FOnViewFlagChange;
    property OnDicomPrintFilm: TOnDicomPrintFilmEvent read FOnDicomPrintFilm write
      FOnDicomPrintFilm;

    property OnDicomPrintFilmGetAccessionNumber: TOnDicomPrintFilmGetAccessionNumberEvent read FOnDicomPrintFilmGetAccessionNumber write SetOnDicomPrintFilmGetAccessionNumber;
    //property OnBeforeFilmPrint: TOnBeforeDicomFilmPrintEvent read FOnBeforeFilmPrint write FOnBeforeFilmPrint;
    property OnAfterDicomPrintFilm: TOnPrintImageToFilm read FOnAfterDicomPrintFilm write
      SetOnAfterDicomPrintFilm;
    //当操作要打印图像对DICOM相机时,触发此事件,以确定该操作员是否可以打印

    property OnAfterFinishVideoCapture: TOnAfterFinishVideoCaptureEvent read
      FOnAfterFinishVideoCapture write FOnAfterFinishVideoCapture;
    //图像视频采集完成,调入此事件
    property OnCanUpdateimage: TOnCanUpdateimageEvent read FOnCanUpdateimage write
      FOnCanUpdateimage;
    //可否进入图像标记,修改图像
    property OnNewImage: TOnAddImageEvent read FOnNewImage write FOnNewImage;
    //当一幅新图像产生时,触发此事件填入病人资料

    property OnCanDeleteImage: TOnSaveImageQuestionEvent read FOnDeleteImage write FOnDeleteImage;
    //当操作员要删除图像时,触发此事件,以求得是否可以删除
    property OnCanExportImage: TOnSaveImageQuestionEvent read FOnCanExportImage write SetOnCanExportImage;
    //当操作员要导出图像时,触发此事件,以求得是否可以导出
    property OnCanSendImage: TOnSaveImageQuestionEvent read FOnCanSendImage write SetOnCanSendImage;
    //当操作员要传送图像时,触发此事件,以求得是否可以
    property OnCanSaveAsImage: TOnSaveImageQuestionEvent read FOnCanSaveAsImage write SetOnCanSaveAsImage;
    //当操作员要另存为图像时,触发此事件,以求得是否可以

    //    property OnSetStudyUID: TOnSetStudyUIDEvent read FOnSetStudyUID write FOnSetStudyUID;
    property OnShowForm: TOnShowFormEvent read FOnShowForm write FOnShowForm;
    //当窗口显示时,触发此事件,以确定窗口的显示方式,DOCK,SHOW,SHOWMODAL

    property OnGetCurrentDataset: TOnGetCurrentDatasetEvent read FGetCurrentDataset write
      FGetCurrentDataset;

    property OnBeforeClearImage: TBeforeClearImageNotifyEvent read FOnBeforeClearImageNotify write SetOnBeforeClearImageNotify;
    property OnAfterClearImage: TBeforeClearImageNotifyEvent read FOnAfterClearImageNotify write SetOnAfterClearImageNotify;

    property OnGetStudyReportText: TOnGetStudyReportTextEvent read FOnGetStudyReportText write
      SetOnGetStudyReportText;

    property OnSelectMultiSeries: TOnSelectMultiSeriesEvent read fOnSelectMultiSeries write
      fOnSelectMultiSeries;

    property OnSelectMultiFilms: TOnSelectMultiSeriesEvent read FOnSelectMultiFilms write SetOnSelectMultiFilms;

    property OnInitImageForm: TOnShowFormEvent read FOnInitImageForm write
      SetOnIintImageForm;

    property OnCreateViewerForm: TOnCreateImageFormEvent read FOnCreateViewerForm write SetOnCreateViewerForm;
    property OnAfterCreateViewerForm: TOnAfterCreateImageFormEvent read FOnAfterCreateViewerForm write SetOnAfterCreateViewerForm;
    //    property OnCreateCustomImageForm: TOnCreateCustomImageFormEvent read FOnCreateCustomImageForm write FOnCreateCustomImageForm;

    property OnImageStateChange: TNotifyEvent read fOnImageStateChange write fOnImageStateChange;
    property OnImageSelectChange: TNotifyEvent read fOnImageSelectChange write fOnImageSelectChange;
    property OnImageAfterNewDrawObject: TDrawObjectNotifyEvent read FOnImageAfterNewDrawObject write FOnImageAfterNewDrawObject;
    property OnImageAfterObjectSize: TDrawObjectNotifyEvent read FOnImageAfterObjectSize write FOnImageAfterObjectSize;
    property OnImageAfterObjectMove: TDrawObjectNotifyEvent read FOnImageAfterObjectMove write FOnImageAfterObjectMove;
  end;

procedure Register;

implementation

//uses WadoDataMoudle;
{ TWadoViewerClient }

procedure Register;
begin
  RegisterComponents('DicomVCL', [TWadoViewerClient, TCnsUserLogin]);
end;

procedure TWadoViewerClient.ClearLoadedImages(AStudyUID: string);
var
  k: Integer;
begin
  {$IFDEF DEBUG}
  SendDebug('Before TWadoViewerClient.ClearLoadedImages');
  {$ENDIF}
  if assigned(FOnBeforeClearImageNotify) then
    FOnBeforeClearImageNotify(self, AStudyUID);

  if fImageForms.Count > 0 then
  begin
    for k := 0 to fImageForms.Count - 1 do
    begin
      //Result := fForm.FindDatasets(AUID);
      //if Result <> nil then
//      TViewerBaseForm(fImageForms[k]).SaveKeyImage1Click(nil);
      TViewerBaseForm(fImageForms[k]).ClearLoadImage(AStudyUID);
    end;
  end;
  {$IFDEF DEBUG}
  SendDebug('After TWadoViewerClient.ClearLoadedImages');
  {$ENDIF}
  if assigned(FOnAfterClearImageNotify) then
    FOnAfterClearImageNotify(self, AStudyUID); 
end;

constructor TWadoViewerClient.Create(AOwner: TComponent);
begin
  inherited;
  FMaxImageFormNumber := -1;
  FShowImageFormBeforeLoadImage := true;
  FImageForms := TList.Create;
  FActive := false;

  FLoadStyle := false;

  FHost := '127.0.0.1';
  FPort := 104;
  fCalledAE := '';
  fCallingAE := '';
  fLevel := '';
  FUserName := '';
  fPassword := '';
  fAuthType := 0;
  FWadoTranferSyntax := '1.2.840.10008.1.2.5.1'; //'1.2.840.10008.1.2.4.51';

  //DVSDataModule := nil;
end;

procedure TWadoViewerClient.DeleteAllDataset;
begin

end;

destructor TWadoViewerClient.Destroy;
begin
  FImageForms.Free;
  inherited;
end;

procedure TWadoViewerClient.DisplayImagepanel;
var
  i: Integer;
  fForm: TViewerBaseForm;
begin
  for i := 0 to fImageForms.Count - 1 do
  begin
    fForm := TViewerBaseForm(fImageForms[i]);
    DoFormShow(self, kftImageForm, fForm, i);
  end;
end;

function TWadoViewerClient.GetCurrentDataset: TDicomDatasets;
var
  fForm: TViewerBaseForm;
begin
  Result := nil;
  if fImageForms.Count > 0 then
  begin
    fForm := TViewerBaseForm(fImageForms[0]);
    Result := fForm.GetCurrentDataset;
  end;
end;

function TWadoViewerClient.GetPrintDataset: TDicomDatasets;
var
  fForm: TViewerBaseForm;
begin
  Result := nil;
  if fImageForms.Count > 0 then
  begin
    fForm := TViewerBaseForm(fImageForms[0]);
    Result := fForm.GetPrintDataset;
  end;
end;

procedure TWadoViewerClient.GetSelectedBitmap(ImageIndex: integer;
  DstBitmap: TBitmap);
var
  fForm: TViewerBaseForm;
begin
  if fImageForms.Count > 0 then
  begin
    fForm := TViewerBaseForm(fImageForms[0]);
    fForm.GetSelectedBitmap(ImageIndex, DstBitmap);
  end;
end;

function TWadoViewerClient.GetSelectedCount: Integer;
var
  fForm: TViewerBaseForm;
begin
  Result := 0;
  if fImageForms.Count > 0 then
  begin
    fForm := TViewerBaseForm(fImageForms[0]);
    Result := fForm.GetSelectedCount;
  end;
end;

function TWadoViewerClient.GetSelectedImageLabels(ImageIndex,
  Labelindex: Integer): string;
begin

end;

function TWadoViewerClient.GetStudies(AProfName: string; var APatientID: string;
  var AREPORT_DATE: TDatetime): string;
begin

end;

function TWadoViewerClient.GetStudiesEx(AProfName: string;
  var APatientID: string; AName, AStudyID: string;
  var AREPORT_DATE: TDatetime): string;
begin

end;

function TWadoViewerClient.IsLoadStudyUID(AUID: string): TCnsDMTable;
var
  i: Integer;
  fForm: TViewerBaseForm;
begin
  Result := nil;
  for i := 0 to fImageForms.Count - 1 do
  begin
    fForm := TViewerBaseForm(fImageForms[i]);
    Result := fForm.FindDatasets(AUID);
    if Result <> nil then
      exit;
  end;
end;

function TWadoViewerClient.NewDatasets(AName, AStudyUID: string): TCnsDMTable;
var
  i: Integer;
  fForm: TViewerBaseForm;
begin
  Result := nil;
  if AStudyUID <> '' then
    for i := 0 to fImageForms.Count - 1 do
    begin
      fForm := TViewerBaseForm(fImageForms[i]);
      Result := fForm.FindDatasets(AStudyUID);
      if Result = nil then
      begin
        Result := fForm.NewDatasets(AName, AStudyUID);
      end;
    end;
end;

function TWadoViewerClient.IsStudyLoading1(AUID: string): Boolean;
var
  fForm: TViewerBaseForm;
begin
  Result := false;
  if fImageForms.Count > 0 then
  begin
    fForm := TViewerBaseForm(fImageForms[0]);
    Result := fForm.IsStudyLoading1(AUID);
  end;
end;

function TWadoViewerClient.IsStudyLoading(AUID: string): Boolean;
var
  fForm: TViewerBaseForm;
begin
  Result := true;
  if fImageForms.Count > 0 then
  begin
    fForm := TViewerBaseForm(fImageForms[0]);
    Result := fForm.IsStudyLoading(AUID);
  end;
end;

function TWadoViewerClient.LoadDcmFile(AName, AFileName: string): Boolean;
var
  fForm: TViewerBaseForm;
begin
  if not Active then
    Active := true;
  fForm := TViewerBaseForm(fImageForms[0]);
  fForm.LoadImageFromFiles(AFileName);
end;

function TWadoViewerClient.LoadDcmFileDir(AName, AImagePath: string): Boolean;
var
  fForm: TViewerBaseForm;
begin
  if not Active then
    Active := true;
  fForm := TViewerBaseForm(fImageForms[0]);
  Result := fForm.LoadDcmFileDir(Aname, AImagePath);
end;

function TWadoViewerClient.LoadDcmFileDirEx(AName, AImagePath: string): Boolean;
var
  fForm: TViewerBaseForm;
begin
  if not Active then
    Active := true;
  fForm := TViewerBaseForm(fImageForms[0]);
  Result := fForm.LoadDcmFileDirEx(AName, AImagePath);
end;

function TWadoViewerClient.LoadFromDicomdir(AName, AimagePath: string): Boolean;
var
  fForm: TViewerBaseForm;
begin
  if not Active then
    Active := true;
  fForm := TViewerBaseForm(fImageForms[0]);
  Result := fForm.LoadFromDicomdir(AName, AImagePath);
end;

function TWadoViewerClient.LoadImagesFrom(AHost: string; APort: Integer; AProfileName, AName, AStudyUID: string; AMode: Integer;
  ALock: Boolean; AOnlyLoadKeyImage: Boolean;
  APatientName, AHospitalName, APatientID, APaperStudyUID: string): Boolean;
var
  fForm: TViewerBaseForm;
  k: Integer;
  das1: TCnsDMTable;
begin
  {$IFDEF DEBUG}
  SendDebug(AHost + ':' + IntToStr(APort) + ',Load ' + AStudyUID + ', ProfileName=' + AProfileName);
  {$ENDIF}
  if not Active then
    Active := true;

  if FShowImageFormBeforeLoadImage then
    DisplayImagepanel;

  das1 := IsLoadStudyUID(AStudyUID);
  {$IFDEF DEBUG}
  SendDebug('After TWadoViewerClient.LoadImagesFrom IsLoadStudyUID');
  {$ENDIF}
  if (das1 <> nil) and (das1.Count > 0) then
  begin
    //self.DisplayImagepanel;
    Result := true;
  end
  else
  begin
    //ShowMessage(IntToStr(AMode));
    //for k := 0 to fImageForms.Count - 1 do
    begin
      fForm := TViewerBaseForm(fImageForms[0]);
      fForm.CurrentProfileName := AProfileName;
      case AMode of //
        1: Result := fForm.MGETLoadImages(AHost, APort, AName, AStudyUID, ALock, AOnlyLoadKeyImage, APatientName, AHospitalName, APatientID, APaperStudyUID);
        2: Result := fForm.WadoLoadImages(AHost, APort + 1, AName, AStudyUID, FWadoTranferSyntax, fLevel, ALock,
            AOnlyLoadKeyImage);
      else
        Result := fForm.LoadImages(AHost, APort, AName, AStudyUID, ALock, AOnlyLoadKeyImage);
      end; // case
    end;

    {$IFDEF DEBUG}
    SendDebug('TWadoViewerClient.LoadImagesFrom MGETLoadImages');
    {$ENDIF}

    if fImageForms.Count > 1 then
      for k := 1 to fImageForms.Count - 1 do
      begin
        fForm := TViewerBaseForm(fImageForms[k]);
        fForm.NewDatasets(AName, AStudyUID);
        {case AMode of //
          1: Result := fForm.MGETLoadImages(AName, AStudyUID);
          2: Result := fForm.WadoLoadImages(AName, AStudyUID, FWadoTranferSyntax, fLevel);
        else
          Result := fForm.LoadImages(AName, AStudyUID);
        end; // case}
      end;
  end;
end;

function TWadoViewerClient.LoadFilmImagesFrom(AHost: string; APort: Integer; AProfileName, AName, AStudyUID: string; AMode: Integer;
  ALock: Boolean; AOnlyLoadKeyImage: Boolean;
  APatientName, AHospitalName, APatientID, APaperStudyUID: string): Boolean;
var
  fForm: TViewerBaseForm;
  k: Integer;
  das1: TCnsDMTable;
begin
  {$IFDEF DEBUG}
  SendDebug(AHost + ':' + IntToStr(APort) + ',Load ' + AStudyUID);
  {$ENDIF}
  if not Active then
    Active := true;

  if FShowImageFormBeforeLoadImage then
    DisplayImagepanel;

  das1 := IsLoadStudyUID(AStudyUID);
  {$IFDEF DEBUG}
  SendDebug('After TWadoViewerClient.LoadImagesFrom IsLoadStudyUID');
  {$ENDIF}
  if (das1 <> nil) and (das1.Count > 0) then
  begin
    //self.DisplayImagepanel;
    Result := true;
  end
  else
  begin
    //ShowMessage(IntToStr(AMode));
    //for k := 0 to fImageForms.Count - 1 do
    begin
      fForm := TViewerBaseForm(fImageForms[0]);
      fForm.CurrentProfileName := AProfileName;
      case AMode of //
        1: Result := fForm.MGETLoadFilmImages(AHost, APort, AName, AStudyUID, ALock, AOnlyLoadKeyImage, APatientName, AHospitalName, APatientID);
        2: //Result := fForm.WadoLoadImages(AHost, APort + 1, AName, AStudyUID, FWadoTranferSyntax, fLevel, ALock,
          // AOnlyLoadKeyImage);
      else
        //Result := fForm.LoadImages(AHost, APort, AName, AStudyUID, ALock, AOnlyLoadKeyImage);
      end; // case
    end;

    {$IFDEF DEBUG}
    SendDebug('TWadoViewerClient.LoadImagesFrom MGETLoadImages');
    {$ENDIF}

    if fImageForms.Count > 1 then
      for k := 1 to fImageForms.Count - 1 do
      begin
        fForm := TViewerBaseForm(fImageForms[k]);
        fForm.NewDatasets(AName, AStudyUID);
        {case AMode of //
          1: Result := fForm.MGETLoadImages(AName, AStudyUID);
          2: Result := fForm.WadoLoadImages(AName, AStudyUID, FWadoTranferSyntax, fLevel);
        else
          Result := fForm.LoadImages(AName, AStudyUID);
        end; // case}
      end;
  end;
end;

function TWadoViewerClient.LoadImages(AProfileName, AName, AStudyUID: string; AMode: Integer;
  ALock: Boolean; AOnlyLoadKeyImage: Boolean;
  APatientName, AHospitalName, APatientID, APaperStudyUID: string): Boolean;
begin
  Result := LoadImagesFrom(fHost, fPort, AProfileName, AName, AStudyUID, AMode,
    ALock, AOnlyLoadKeyImage, APatientName, AHospitalName, APatientID, APaperStudyUID);
end;

function TWadoViewerClient.LoadFromDatasets(AName: string; ADatasets: TDicomDatasets): Boolean;
var
  fForm: TViewerBaseForm;
  k: Integer;
  das1: TCnsDMTable;
begin
  if not Active then
    Active := true;
  fForm := TViewerBaseForm(fImageForms[0]);

  DoFormShow(self, kftImageForm, fForm, 0);

  fForm.LoadFromDataset(AName, ADatasets);
end;

procedure TWadoViewerClient.RemoveSelectedImages;
begin

end;

procedure TWadoViewerClient.SaveimageFlag;
var
  i: Integer;
  fForm: TViewerBaseForm;
begin
  for i := 0 to fImageForms.Count - 1 do
  begin
    fForm := TViewerBaseForm(fImageForms[i]);
    fForm.SaveKeyImage();
  end;
end;

procedure TWadoViewerClient.SaveImages;
begin

end;

procedure TWadoViewerClient.SaveImagesToLocalPath(APathName: string);
var
  fForm: TViewerBaseForm;
begin
  if not Active then
    Active := true;
  fForm := TViewerBaseForm(fImageForms[0]);
  fForm.SaveToDicomDIR(APathName);
end;

procedure TWadoViewerClient.SetActive(const Value: Boolean);
var
  I, i1: Integer;
  fForm, fForm1: TViewerBaseForm;
  k: Integer;
begin
  if FActive <> Value then
  begin
    FActive := Value;
    if not (csDesigning in ComponentState) then
    begin
      if FActive then
      begin
        //if VerifyServer then
        begin
          //BuildAllDataset;
          {if DVSDataModule = nil then
          begin
            DVSDataModule := TDVSDataModule.Create(self);

          end;}

          if FMaxImageFormNumber <= 0 then
            k := Screen.MonitorCount - 1
          else
            k := FMaxImageFormNumber;

          if k <= 0 then
            k := 1;
          for I := 0 to k - 1 do // Iterate
          begin
            fForm := NewImageForm;
            //if i = 0 then
            begin
              fForm.OnIconReceive := DoIconImageReceive;
              fForm.OnReceive := DoNewImage;
              fForm.OnSelectMultiSeries := DoSelectMultiSeries;
              fForm.OnSelectMultiFilms := DoSelectMultiFilm;

              fForm.OnImageSelectChange := DoImageSelectChange;
              fForm.OnImageStateChange := DoImageStateChange;
              fForm.OnImageAfterNewDrawObject := DoImageAfterNewDrawObject;
              fForm.OnImageAfterObjectMove := DoImageAfterObjectMove;
              fForm.OnImageAfterObjectSize := DoImageAfterObjectSize;

            end;

            fImageForms.Add(fForm);
            //if assigned(FOnShowForm) then
            //  FOnShowForm(self, kftImageForm, fForm, i);
          end; // for

          for i := 0 to fImageForms.Count - 1 do
          begin
            fForm := TViewerBaseForm(fImageForms[i]);
            for i1 := 0 to fImageForms.Count - 1 do
            begin
              fForm1 := TViewerBaseForm(fImageForms[i1]);
              if fForm1 <> fForm then
              begin
                fForm.ThirdImageFormList.Add(fForm1);
              end;
            end;
          end;

          {end
          else
          begin
            FActive := false;
            ShowMessage('Server can not connected!');}
        end;
      end
      else
      begin
        for i := 0 to fImageForms.Count - 1 do
        begin
          fForm := TViewerBaseForm(fImageForms[i]);
          fForm.ManualFloat(Rect(screen.width, screen.Height, 100, 100));
          fForm.Free;
        end;
        fImageForms.Clear;
      end;
    end;
  end;
end;

procedure TWadoViewerClient.SetHost(const Value: string);
begin
  FHost := Value;
end;

procedure TWadoViewerClient.SetPort(const Value: integer);
begin
  FPort := Value;
end;

function TWadoViewerClient.VerifyServer: Boolean;
var
  CnsDicomConnection1: TCnsDicomConnection;
begin
  CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
  try
    CnsDicomConnection1.Host := fHost;
    CnsDicomConnection1.Port := fPort;
    CnsDicomConnection1.CalledTitle := fCalledAE;
    CnsDicomConnection1.CallingTitle := fCallingAE;
    CnsDicomConnection1.ReceiveTimeout := 10 * 1000;
    try
      Result := CnsDicomConnection1.C_Echo;
    except
      Result := false;
    end;
  finally
    CnsDicomConnection1.Free;
  end;
end;

procedure TWadoViewerClient.ShowReportDialog(AProfileName: string; var AStr1,
  AStr2: string);
begin

end;

procedure TWadoViewerClient.UndockImagePanel;
var
  FImageForm1: TViewerBaseForm;
  k1: Integer;
begin
  for k1 := 0 to fImageForms.Count - 1 do
  begin
    FImageForm1 := TViewerBaseForm(fImageForms[k1]);
    FImageForm1.Close;
    if assigned(FImageForm1.OnImageFormClose) then
      FImageForm1.OnImageFormClose(nil);
  end;
end;

function TWadoViewerClient.NewImageForm: TViewerBaseForm;
begin
  Result := nil;
  if assigned(FOnCreateViewerForm) then
    FOnCreateViewerForm(self, Result);
  if Result = nil then
  begin
    raise Exception.Create('YOU MUST CREATE A VIEW FORM NOW!');
  end; //  Result := TViewerBaseForm.Create(self);

  Result.Host := self.Host;
  Result.Port := self.Port;
  Result.CallingAE := self.fCallingAE;
  Result.CalledAE := self.CalledAE;

  Result.UserName := self.FUserName;
  Result.Password := self.Password;
  Result.AuthType := self.FAuthType;

  Result.OnShowRenderingForm := DoFormShow;
  Result.OnAfterDicomPrintFilm := DoAfterPrintFilm;
  Result.OnDicomPrintFilmGetAccessionNumber := DoDicomPrintFilmGetAccessionNumber;
  Result.OnAfterLoadimageFinish := DoAfterLoadImage;

  Result.OnDicomPrintFilm := DoOnPrintFilm;
  Result.OnDicomDeleteImage := DoAskDicomDeleteImage;
  Result.OnDicomExportImage := DoAskDicomExportImage;
  Result.OnDicomSendImage := DoAskDicomSendImage;
  Result.OnDicomSaveAsImage := DoAskDicomSaveAsImage;

  Result.OnGetStudyReportText := DoGetStudyReportText;
  Result.OnImageFlagChange := DoOnImageFlagChange;
  //Result.BuildAllDataset;

  //Result.DicomMultiViewer1.CreateViewer;

  //Result.RefreshMenu;
  if assigned(FOnAfterCreateViewerForm) then
    FOnAfterCreateViewerForm(self, Result);
end;

procedure TWadoViewerClient.Loaded;
//var
//  fForm: TForm;
begin
  inherited;
  if not (csDesigning in ComponentState) then
    if FActive then
    begin
      (*if VerifyServer then
      begin
        BuildAllDataset;

        fForm := NewImageForm;

        fImageForms.Add(fForm);
          DoFormShow(self, kftImageForm, fForm, FImageForms.Count);

        {fForm.ManualDock(self, nil, alClient);
        fForm.Align := alClient;
        fForm.Show;}
      end
      else
      begin
        FActive := false;
        ShowMessage('Server can not connected!');
      end; *)
    end;
end;

procedure TWadoViewerClient.SetViewerColor(const Value: TColor);
var
  i: integer;
begin
  if FViewerColor <> Value then
  begin
    FViewerColor := Value;
    //for i := 0 to fImageForms.Count - 1 do
    //  TViewerBaseForm(fImageForms[i]).DicomMultiViewer1.Color := Value;
  end;
end;

procedure TWadoViewerClient.DoAfterPrintFilm(Sender: TObject; ADataset: TDicomDataset; APrinterName: string);
begin
  if assigned(OnAfterDicomPrintFilm) then
  begin
    OnAfterDicomPrintFilm(Sender, ADataset, APrinterName);
  end;
end;

procedure TWadoViewerClient.DoDicomPrintFilmGetAccessionNumber(Sender: TObject; var AUserName, AFilmDesc, AAccessionNumber: string);
begin
  if assigned(OnDicomPrintFilmGetAccessionNumber) then
  begin
    OnDicomPrintFilmGetAccessionNumber(Sender, AUserName, AFilmDesc, AAccessionNumber);
  end;
end;

procedure TWadoViewerClient.DoOnPrintFilm(Sender: TObject;
  var AResult: Boolean);
begin
  if assigned(OnDicomPrintFilm) then
  begin
    OnDicomPrintFilm(Sender, AResult);
  end;
end;

procedure TWadoViewerClient.SetOnAfterDicomPrintFilm(
  const Value: TOnPrintImageToFilm);
begin
  FOnAfterDicomPrintFilm := Value;
end;

procedure TWadoViewerClient.DoIconImageReceive(Sender: TObject;
  ADataset: TDicomAttribute);
begin
  if fImageForms.Count > 1 then
  begin
    //for k := 1 to fImageForms.Count - 1 do
    begin
      //TViewerBaseForm(fImageForms[k]).Clear1Click(nil);

//  AddDatasets(CreateDicomDataset, n1.PatientName);
    end;
  end;
end;

procedure TWadoViewerClient.DoNewImage(Sender: TObject; ADataset: TDicomDataset);
var
  k, kkk: integer;
  fForm: TViewerBaseForm;
  str2: string;
  stm1: TStream;
  das1: TCnsDMTable;
  d1: TDicomDataset;
begin
  if assigned(FOnNewImage) then
    FOnNewImage(Sender, ADataset, -1);
  if fImageForms.Count > 1 then
    for k := 1 to fImageForms.Count - 1 do
    begin
      fForm := TViewerBaseForm(fImageForms[k]);
      stm1 := ADataset.ImageStream;
      if stm1 <> nil then
      begin
        str2 := ADataset.Attributes.GetString($20, $D);
        if str2 <> '' then
        begin
          das1 := fForm.FindDatasets(str2);
          if das1 <> nil then
          begin
            kkk := stm1.Position;
            stm1.Position := 0;
            d1 := das1.LoadFromStream(stm1);
            if assigned(FOnNewImage) then
              FOnNewImage(Sender, d1, -1);
            stm1.Position := kkk;
          end;
        end;
      end;
    end;
end;

procedure TWadoViewerClient.InitData(AMode: Integer);
var
  k: Integer;
begin
  if fImageForms.Count > 0 then
  begin
    for k := 0 to fImageForms.Count - 1 do
    begin
      TViewerBaseForm(fImageForms[k]).InitData(AMode + 10); //no thread init
      //TViewerBaseForm(fImageForms[k]).InitData(AMode); //thread

      if assigned(FOnInitImageForm) then
        FOnInitImageForm(self, kftImageForm, TViewerBaseForm(fImageForms[k]), k);
    end;
  end;
end;

procedure TWadoViewerClient.LoadUserConfig;
var
  k: Integer;
begin
  if fImageForms.Count > 0 then
  begin
    for k := 0 to fImageForms.Count - 1 do
    begin
      TViewerBaseForm(fImageForms[k]).LoadUserConfig;
    end;
  end;
end;

procedure TWadoViewerClient.SetWadoTranferSyntax(const Value: string);
begin
  FWadoTranferSyntax := Value;
end;

procedure TWadoViewerClient.SetLevel(const Value: string);
begin
  FLevel := Value;
end;

procedure TWadoViewerClient.DoAfterLoadImage(Sender: TObject);
var
  k: integer;
  fForm: TViewerBaseForm;
begin
  if fImageForms.Count > 1 then
    for k := 1 to fImageForms.Count - 1 do
    begin
      fForm := TViewerBaseForm(fImageForms[k]);
      fForm.RefreshList;
    end;
end;

function TWadoViewerClient.GetModality(AProfileName: string): string;
begin
  if not Active then
    Active := true;
  if fImageForms.Count > 0 then
  begin
    Result := TViewerBaseForm(fImageForms[0]).GetModality(AProfileName);
  end;
end;

function TWadoViewerClient.GetCaptureMode(AProfilename: string): Integer;
begin
  //CAPTUREMODE
  if not Active then
    Active := true;
  if fImageForms.Count > 0 then
  begin
    Result := TViewerBaseForm(fImageForms[0]).GetCaptureMode(AProfileName);
  end
  else
    Result := 0;
end;

procedure TWadoViewerClient.SetAuthType(const Value: Integer);
begin
  FAuthType := Value;
end;

procedure TWadoViewerClient.SetPassword(const Value: string);
var
  fForm: TViewerBaseForm;
  k: Integer;
begin
  FPassword := Value;
  if fImageForms.Count > 1 then
    for k := 1 to fImageForms.Count - 1 do
    begin
      fForm := TViewerBaseForm(fImageForms[k]);
      fForm.Password := fPassword;
    end;
end;

procedure TWadoViewerClient.SetUserName(const Value: string);
var
  fForm: TViewerBaseForm;
  k: Integer;
begin
  FUserName := Value;
  if fImageForms.Count > 1 then
    for k := 1 to fImageForms.Count - 1 do
    begin
      fForm := TViewerBaseForm(fImageForms[k]);
      fForm.UserName := FUserName;
    end;
end;

procedure TWadoViewerClient.DoAskDicomDeleteImage(Sender: TObject;
  HaveNotSaved: Boolean; var CanBeDelete: Boolean; AInstanceUID: string);
begin
  if assigned(OnCanDeleteImage) then
    OnCanDeleteImage(Sender, HaveNotSaved, CanBeDelete, AInstanceUID);
end;

procedure TWadoViewerClient.DoAskDicomExportImage(Sender: TObject;
  HaveNotSaved: Boolean; var CanBeDelete: Boolean; AInstanceUID: string);
begin
  if assigned(OnCanExportImage) then
    OnCanExportImage(Sender, HaveNotSaved, CanBeDelete, AInstanceUID);
end;

procedure TWadoViewerClient.DoAskDicomSaveAsImage(Sender: TObject;
  HaveNotSaved: Boolean; var CanBeDelete: Boolean; AInstanceUID: string);
begin
  if assigned(OnCanSaveAsImage) then
    OnCanSaveAsImage(Sender, HaveNotSaved, CanBeDelete, AInstanceUID);
end;

procedure TWadoViewerClient.DoAskDicomSendImage(Sender: TObject;
  HaveNotSaved: Boolean; var CanBeDelete: Boolean; AInstanceUID: string);
begin
  if assigned(OnCanSendImage) then
    OnCanSendImage(Sender, HaveNotSaved, CanBeDelete, AInstanceUID);
end;

procedure TWadoViewerClient.RefreshView;
var
  fForm: TViewerBaseForm;
  k: Integer;
begin
  if fImageForms.Count > 1 then
    for k := 1 to fImageForms.Count - 1 do
    begin
      fForm := TViewerBaseForm(fImageForms[k]);
      fForm.RefreshViews;
    end;
end;

function TWadoViewerClient.GetDicomDataset(index: Integer): TDicomDatasets;
var
  fForm: TViewerBaseForm;
begin
  Result := nil;
  if fImageForms.Count >= 1 then
  begin
    fForm := TViewerBaseForm(fImageForms[0]);
    Result := fForm.GetDicomDatasets(index);
  end;
end;

function TWadoViewerClient.GetDicomDatasetCount: Integer;
var
  fForm: TViewerBaseForm;
begin
  if fImageForms.Count >= 1 then
  begin
    fForm := TViewerBaseForm(fImageForms[0]);
    Result := fForm.ImageTabCount;
  end
  else
    Result := 0;
end;

procedure TWadoViewerClient.SetOnGetStudyReportText(
  const Value: TOnGetStudyReportTextEvent);
begin
  FOnGetStudyReportText := Value;
end;

procedure TWadoViewerClient.DoGetStudyReportText(Sender: TObject;
  const AStudyUID, AstudyID: string; var AStudyHtml: string);
begin
  if assigned(FOnGetStudyReportText) then
    FOnGetStudyReportText(sender, AStudyUID, AStudyID, AStudyHtml);
end;

procedure TWadoViewerClient.DoSelectMultiSeries(Sender: TObject;
  ADataSet: TDataset; const AStudyUIDS, ASeriesUIDS: TStringList);
begin
  if assigned(fOnSelectMultiSeries) then
    fOnSelectMultiSeries(Sender, ADataset, AStudyUIDS, ASeriesUIDS);
end;

procedure TWadoViewerClient.DoSelectMultiFilm(Sender: TObject;
  ADataSet: TDataset; const AStudyUIDS, AImagesUIDS: TStringList);
begin
  if assigned(fOnSelectMultiFilms) then
    fOnSelectMultiFilms(Sender, ADataset, AStudyUIDS, AImagesUIDS);
end;

procedure TWadoViewerClient.SetOnIintImageForm(
  const Value: TOnShowFormEvent);
begin
  FOnInitImageForm := Value;
end;

function TWadoViewerClient.CreateDBTable: TCnsDBTable;
begin
  Result := nil;
  if fImageForms.Count >= 1 then
  begin
    Result := TViewerBaseForm(fImageForms[0]).CreateDBTable;
  end;
end;

function TWadoViewerClient.GetImageForm: TViewerBaseForm;
begin
  if fImageForms.Count >= 1 then
  begin
    Result := TViewerBaseForm(fImageForms[0]);
  end
  else
    Result := nil;
end;

procedure TWadoViewerClient.DoImageAfterNewDrawObject(Sender: TObject;
  AObject: TDicomDrawObject);
begin
  if assigned(fOnImageAfterNewDrawObject) then
    fOnImageAfterNewDrawObject(Sender, AObject);
end;

procedure TWadoViewerClient.DoImageAfterObjectMove(Sender: TObject;
  AObject: TDicomDrawObject);
begin
  if assigned(fOnImageAfterObjectMove) then
    fOnImageAfterObjectMove(Sender, AObject);
end;

procedure TWadoViewerClient.DoImageAfterObjectSize(Sender: TObject;
  AObject: TDicomDrawObject);
begin
  if assigned(fOnImageAfterObjectSize) then
    fOnImageAfterObjectSize(Sender, AObject);
end;

procedure TWadoViewerClient.DoImageSelectChange(Sender: TObject);
begin
  if assigned(fOnImageSelectChange) then
    fOnImageSelectChange(Sender);
end;

procedure TWadoViewerClient.DoImageStateChange(Sender: TObject);
begin
  if assigned(fOnImageStateChange) then
    fOnImageStateChange(Sender);
end;

procedure TWadoViewerClient.SetOnAfterCreateViewerForm(
  const Value: TOnAfterCreateImageFormEvent);
begin
  FOnAfterCreateViewerForm := Value;
end;

procedure TWadoViewerClient.SetOnCreateViewerForm(
  const Value: TOnCreateImageFormEvent);
begin
  FOnCreateViewerForm := Value;
end;

procedure TWadoViewerClient.DoOnImageFlagChange(Sender: TObject);
begin
  if assigned(OnViewFlagChange) then
    OnViewFlagChange(Sender);
end;

procedure TWadoViewerClient.ChangeDatasets(ADatasets: TDicomAttributes);
var
  k: Integer;
begin
  if fImageForms.Count > 0 then
  begin
    for k := 0 to fImageForms.Count - 1 do
    begin
      TViewerBaseForm(fImageForms[k]).DoConferenceCommand(ADatasets);
    end;
  end;
end;

procedure TWadoViewerClient.SetOnDicomPrintFilmGetAccessionNumber(
  const Value: TOnDicomPrintFilmGetAccessionNumberEvent);
begin
  FOnDicomPrintFilmGetAccessionNumber := Value;
end;

procedure TWadoViewerClient.SetMaxImageFormNumber(const Value: Integer);
begin
  FMaxImageFormNumber := Value;
end;

procedure TWadoViewerClient.SetOnSelectMultiFilms(
  const Value: TOnSelectMultiSeriesEvent);
begin
  FOnSelectMultiFilms := Value;
end;

procedure TWadoViewerClient.SetOnCanExportImage(
  const Value: TOnSaveImageQuestionEvent);
begin
  FOnCanExportImage := Value;
end;

procedure TWadoViewerClient.SetOnCanSaveAsImage(
  const Value: TOnSaveImageQuestionEvent);
begin
  FOnCanSaveAsImage := Value;
end;

procedure TWadoViewerClient.SetOnCanSendImage(
  const Value: TOnSaveImageQuestionEvent);
begin
  FOnCanSendImage := Value;
end;

function TWadoViewerClient.CreateProcedure: TCnsStorageProcedure;
begin
  Result := nil;
  if fImageForms.Count >= 1 then
  begin
    Result := TViewerBaseForm(fImageForms[0]).CreateProcedure;
  end;
end;

procedure TWadoViewerClient.ExecSQL(ADatabase, ASQL: string);
begin
  if fImageForms.Count >= 1 then
  begin
    TViewerBaseForm(fImageForms[0]).ExecSQL(ADatabase, ASQL);
  end;
end;

procedure TWadoViewerClient.DoFormShow(Sender: TObject;
  AFormType: TKxFormType; const AForm: TForm; AIndex: Integer);
begin
  if assigned(FOnShowForm) then
    FOnShowForm(Sender, AFormType, AForm, AIndex);
end;

procedure TWadoViewerClient.SetLoadStyle(const Value: Boolean);
begin
  FLoadStyle := Value;
end;

procedure TWadoViewerClient.SetShowImageFormBeforeLoadImage(
  const Value: Boolean);
begin
  FShowImageFormBeforeLoadImage := Value;
end;

procedure TWadoViewerClient.SetOnAfterClearImageNotify(
  const Value: TBeforeClearImageNotifyEvent);
begin
  FOnAfterClearImageNotify := Value;
end;

procedure TWadoViewerClient.SetOnBeforeClearImageNotify(
  const Value: TBeforeClearImageNotifyEvent);
begin
  FOnBeforeClearImageNotify := Value;
end;

end.

