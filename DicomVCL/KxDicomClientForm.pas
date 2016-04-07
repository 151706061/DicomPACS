unit KxDicomClientForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Dcm_Attributes, DCM_Client, DCM_ConferenceServer;

type
  TViewerBaseForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FOnImageAfterObjectMove: TDrawObjectNotifyEvent;
    FOnImageAfterNewDrawObject: TDrawObjectNotifyEvent;
    FOnImageAfterObjectSize: TDrawObjectNotifyEvent;
    fOnImageSelectChange: TNotifyEvent;
    fOnImageStateChange: TNotifyEvent;
    FOnGetStudyReportText: TOnGetStudyReportTextEvent;
    fOnSelectMultiSeries: TOnSelectMultiSeriesEvent;
    fOnSelectMultiFilms: TOnSelectMultiSeriesEvent;
    FOnIconReceive: TCnsDicomConnectionIconImagesEvent;
    FOnReceive: TCnsDicomConnectionNewImageEvent;
    FOnAfterReceive: TNotifyEvent;
    FOnImageFormHide: TNotifyEvent;
    FOnAfterLoadimageFinish: TNotifyEvent;
    FOnImageFormClose: TNotifyEvent;
    FOnImageFlagChange: TNotifyEvent;
    FOnDicomPrintFilm: TOnDicomPrintFilmEvent;
    FOnDicomPrintFilmGetAccessionNumber: TOnDicomPrintFilmGetAccessionNumberEvent;
    FOnAfterDicomPrintFilm: TOnPrintImageToFilm;
    FOnDicomDo3DRendering: TOnSaveImageQuestionEvent;
    FOnDicomDeleteImage: TOnSaveImageQuestionEvent;
    FOnDicomSendImage: TOnSaveImageQuestionEvent;
    FOnDicomExportImage: TOnSaveImageQuestionEvent;
    FOnDicomSaveAsImage: TOnSaveImageQuestionEvent;
    FOnImageFormQuery: TNotifyEvent;
    FOnEditImageInfo: TNotifyEvent;
    FOnShowRenderingForm: TOnShowFormEvent;

    procedure SetOnGetStudyReportText(
      const Value: TOnGetStudyReportTextEvent);
    procedure SetOnAfterDicomPrintFilm(const Value: TOnPrintImageToFilm);
    procedure SetOnAfterLoadimageFinish(const Value: TNotifyEvent);
    procedure SetOnAfterReceive(const Value: TNotifyEvent);
    procedure SetOnDicomDeleteImage(
      const Value: TOnSaveImageQuestionEvent);
    procedure SetOnDicomDo3DRendering(
      const Value: TOnSaveImageQuestionEvent);
    procedure SetOnDicomExportImage(
      const Value: TOnSaveImageQuestionEvent);
    procedure SetOnDicomPrintFilm(const Value: TOnDicomPrintFilmEvent);
    procedure SetOnDicomPrintFilmGetAccessionNumber(
      const Value: TOnDicomPrintFilmGetAccessionNumberEvent);
    procedure SetOnDicomSaveAsImage(
      const Value: TOnSaveImageQuestionEvent);
    procedure SetOnDicomSendImage(const Value: TOnSaveImageQuestionEvent);
    procedure SetOnIconReceive(
      const Value: TCnsDicomConnectionIconImagesEvent);
    procedure SetOnImageFlagChange(const Value: TNotifyEvent);
    procedure SetOnImageFormClose(const Value: TNotifyEvent);
    procedure SetOnImageFormHide(const Value: TNotifyEvent);
    procedure SetOnReceive(const Value: TCnsDicomConnectionNewImageEvent);
    procedure SetAuthType(const Value: Integer);
    procedure SetCalledAE(const Value: string);
    procedure SetCallingAE(const Value: string);
    procedure SetHost(const Value: string);
    procedure SetPassword(const Value: string);
    procedure SetPort(const Value: Integer);

    procedure SetUserName(const Value: string);
    procedure SetConferenceClient(const Value: TDCMConferenceClient);
    procedure SetDragDicomDataset(const Value: TDicomAttributes);
    procedure SetOnImageFormQuery(const Value: TNotifyEvent);
    procedure SetOnEditImageInfo(const Value: TNotifyEvent);
    procedure SetOnShowRenderingForm(const Value: TOnShowFormEvent);
    { Private declarations }
  protected
    //FLoadStyle: Boolean;
    FAuthType: Integer;
    FPort: Integer;
    FHost: string;
    FCalledAE: string;
    FPassword: string;
    FUserName: string;
    FCallingAE: string;
    FThirdImageFormList: TList;
    FCurrentProfileName: string;
    FConferenceClient: TDCMConferenceClient;
    fDragDicomDataset: TDicomAttributes;
    procedure SetCurrentProfileName(const Value: string); virtual;
    function GetImageTabCount: Integer; virtual;
  public
    { Public declarations }
    property ImageTabCount: Integer read GetImageTabCount;

    property Host: string read FHost write SetHost;
    property Port: Integer read FPort write SetPort;
    property CallingAE: string read FCallingAE write SetCallingAE;
    property CalledAE: string read FCalledAE write SetCalledAE;

    property UserName: string read FUserName write SetUserName;
    property Password: string read FPassword write SetPassword;
    property AuthType: Integer read FAuthType write SetAuthType;

    //property LoadStyle: Boolean read FLoadStyle write SetLoadStyle;
    property ThirdImageFormList: TList read FThirdImageFormList;

    property OnShowRenderingForm: TOnShowFormEvent read FOnShowRenderingForm write SetOnShowRenderingForm;
    property DragDicomDataset: TDicomAttributes read FDragDicomDataset write SetDragDicomDataset;
    property ConferenceClient: TDCMConferenceClient read FConferenceClient write SetConferenceClient;
    property CurrentProfileName: string read FCurrentProfileName write SetCurrentProfileName;

    property OnIconReceive: TCnsDicomConnectionIconImagesEvent read FOnIconReceive write SetOnIconReceive;
    property OnReceive: TCnsDicomConnectionNewImageEvent read FOnReceive write SetOnReceive;

    property OnAfterReceive: TNotifyEvent read FOnAfterReceive write SetOnAfterReceive;
    property OnDicomPrintFilm: TOnDicomPrintFilmEvent read FOnDicomPrintFilm write SetOnDicomPrintFilm;
    property OnDicomDeleteImage: TOnSaveImageQuestionEvent read FOnDicomDeleteImage write SetOnDicomDeleteImage;
    property OnDicomExportImage: TOnSaveImageQuestionEvent read FOnDicomExportImage write SetOnDicomExportImage;
    property OnDicomSendImage: TOnSaveImageQuestionEvent read FOnDicomSendImage write SetOnDicomSendImage;
    property OnDicomSaveAsImage: TOnSaveImageQuestionEvent read FOnDicomSaveAsImage write SetOnDicomSaveAsImage;
    property OnDicomDo3DRendering: TOnSaveImageQuestionEvent read FOnDicomDo3DRendering write SetOnDicomDo3DRendering;

    property OnAfterDicomPrintFilm: TOnPrintImageToFilm read FOnAfterDicomPrintFilm write SetOnAfterDicomPrintFilm;
    property OnDicomPrintFilmGetAccessionNumber: TOnDicomPrintFilmGetAccessionNumberEvent read FOnDicomPrintFilmGetAccessionNumber write SetOnDicomPrintFilmGetAccessionNumber;

    property OnAfterLoadimageFinish: TNotifyEvent read FOnAfterLoadimageFinish write SetOnAfterLoadimageFinish;

    property OnImageFormClose: TNotifyEvent read FOnImageFormClose write SetOnImageFormClose;
    property OnImageFormQuery: TNotifyEvent read FOnImageFormQuery write SetOnImageFormQuery;
    property OnEditImageInfo: TNotifyEvent read FOnEditImageInfo write SetOnEditImageInfo;
    property OnImageFormHide: TNotifyEvent read FOnImageFormHide write SetOnImageFormHide;
    property OnImageFlagChange: TNotifyEvent read FOnImageFlagChange write SetOnImageFlagChange;

    property OnGetStudyReportText: TOnGetStudyReportTextEvent read FOnGetStudyReportText write SetOnGetStudyReportText;
    property OnSelectMultiSeries: TOnSelectMultiSeriesEvent read fOnSelectMultiSeries write fOnSelectMultiSeries;
    property OnSelectMultiFilms: TOnSelectMultiSeriesEvent read fOnSelectMultiFilms write fOnSelectMultiFilms;

    property OnImageStateChange: TNotifyEvent read fOnImageStateChange write fOnImageStateChange;
    property OnImageSelectChange: TNotifyEvent read fOnImageSelectChange write fOnImageSelectChange;
    property OnImageAfterNewDrawObject: TDrawObjectNotifyEvent read FOnImageAfterNewDrawObject write FOnImageAfterNewDrawObject;
    property OnImageAfterObjectSize: TDrawObjectNotifyEvent read FOnImageAfterObjectSize write FOnImageAfterObjectSize;
    property OnImageAfterObjectMove: TDrawObjectNotifyEvent read FOnImageAfterObjectMove write FOnImageAfterObjectMove;

    procedure ClearLoadImage(AStudyUID: string); virtual;
    function CreateProcedure: TCnsStorageProcedure; virtual;
    procedure ExecSQL(ADatabase, ASQL: string); virtual;

    function GetCurrentDataset: TDicomDatasets; virtual;
    function GetPrintDataset: TDicomDatasets; virtual;
    function GetDicomDatasets(index: Integer): TDicomDatasets; virtual;

    function GetSelectedCount: Integer; virtual;
    procedure GetSelectedBitmap(ImageIndex: integer; DstBitmap: TBitmap); virtual;

    function NewDatasets(AName, AStudyUID: string): TCnsDMTable;
    function FindDatasets(AStudyUID: string): TCnsDMTable; virtual;

    function IsStudyLoading(AUID: string): Boolean; virtual;
    function IsStudyLoading1(AUID: string): Boolean; virtual;

    procedure DoSaveFlags(ADatasets: TDicomAttributes); virtual;
    function FindQueueItem(AStudyUID: string): TNetworkQueueItem; virtual;

    function LoadFromDicomdir(AName, AimagePath: string): Boolean; virtual; //读DICOMDIR
    function LoadDcmFileDir(AName, AImagePath: string): Boolean; virtual; //读本地图像,二级目录
    function LoadDcmFileDirEx(AName, AImagePath: string): Boolean; virtual; //读本地图像,N级目录

    procedure LoadImageFromFiles(AFileNames: string); virtual;

    function LoadImages(AHost: string; APort: Integer; AName, AStudyUID: string; ALock: Boolean; AOnlyLoadKeyImage: Boolean):
      Boolean; virtual;
    function WadoLoadImages(AHost: string; APort: Integer; AName, AStudyUID, ATranferSyntax, ALevel: string; ALock: Boolean;
      AOnlyLoadKeyImage: Boolean): Boolean; virtual;
    function MGETLoadImages(AHost: string; APort: Integer; AName, AStudyUID: string; ALock: Boolean; AOnlyLoadKeyImage: Boolean;
      APatientName, AHospitalName, APatientID, APaperStudyUID: string): Boolean; virtual;
    function MGETLoadFilmImages(AHost: string; APort: Integer; AName, AStudyUID: string; ALock: Boolean; AOnlyLoadKeyImage:
      Boolean; APatientName, AHospitalName, APatientID: string): Boolean; virtual;

    function LoadFromDataset(AName: string; ADatasets: TDicomDatasets): Boolean; virtual;
    procedure SaveToDicomDIR(APath: string); virtual;

    function InitData(AMode: Integer): Boolean; virtual;

    procedure RefreshList; virtual;
    procedure DoConferenceCommand(ADataset: TDicomAttributes); virtual;

    procedure SaveKeyImage; virtual;
    procedure RefreshViews; virtual;

    function CreateDBTable: TCnsDBTable; virtual;
    function GetModality(AProfileName: string): string; virtual;
    function GetCaptureMode(AProfileName: string): Integer; virtual;

    procedure LoadUserConfig; virtual;
    procedure RefreshMenu; virtual;
    procedure SaveUserConfig; virtual;
  end;

implementation

{$R *.dfm}

{ TViewerBaseForm }

procedure TViewerBaseForm.ClearLoadImage(AStudyUID: string);
begin

end;

function TViewerBaseForm.CreateDBTable: TCnsDBTable;
begin
  Result := nil;
end;

procedure TViewerBaseForm.DoConferenceCommand(ADataset: TDicomAttributes);
begin

end;

function TViewerBaseForm.FindDatasets(AStudyUID: string): TCnsDMTable;
begin
  Result := nil;
end;

function TViewerBaseForm.GetCaptureMode(AProfileName: string): Integer;
begin
  Result := 0;
end;

function TViewerBaseForm.GetCurrentDataset: TDicomDatasets;
begin
  Result := nil;
end;

function TViewerBaseForm.GetDicomDatasets(index: Integer): TDicomDatasets;
begin
  Result := nil;
end;

function TViewerBaseForm.GetImageTabCount: Integer;
begin
  Result := 0;
end;

function TViewerBaseForm.GetModality(AProfileName: string): string;
begin
  Result := '';
end;

function TViewerBaseForm.GetPrintDataset: TDicomDatasets;
begin
  Result := nil;
end;

procedure TViewerBaseForm.GetSelectedBitmap(ImageIndex: integer;
  DstBitmap: TBitmap);
begin

end;

function TViewerBaseForm.GetSelectedCount: Integer;
begin
  Result := 0;
end;

function TViewerBaseForm.InitData(AMode: Integer): Boolean;
begin
  Result := false;
end;

function TViewerBaseForm.IsStudyLoading(AUID: string): Boolean;
begin
  Result := false;
end;

function TViewerBaseForm.IsStudyLoading1(AUID: string): Boolean;
begin
  Result := false;
end;

function TViewerBaseForm.LoadDcmFileDir(AName,
  AImagePath: string): Boolean;
begin
  Result := false;
end;

function TViewerBaseForm.LoadDcmFileDirEx(AName,
  AImagePath: string): Boolean;
begin
  Result := false;
end;

function TViewerBaseForm.LoadFromDataset(AName: string;
  ADatasets: TDicomDatasets): Boolean;
begin
  Result := false;
end;

function TViewerBaseForm.LoadFromDicomdir(AName,
  AimagePath: string): Boolean;
begin
  Result := false;
end;

procedure TViewerBaseForm.LoadImageFromFiles(AFileNames: string);
begin

end;

function TViewerBaseForm.LoadImages(AHost: string; APort: Integer; AName,
  AStudyUID: string; ALock, AOnlyLoadKeyImage: Boolean): Boolean;
begin
  Result := false;
end;

procedure TViewerBaseForm.LoadUserConfig;
begin

end;

function TViewerBaseForm.MGETLoadFilmImages(AHost: string; APort: Integer;
  AName, AStudyUID: string; ALock, AOnlyLoadKeyImage: Boolean;
  APatientName, AHospitalName, APatientID: string): Boolean;
begin
  Result := false;
end;

function TViewerBaseForm.MGETLoadImages(AHost: string; APort: Integer;
  AName, AStudyUID: string; ALock, AOnlyLoadKeyImage: Boolean;
  APatientName, AHospitalName, APatientID,
  APaperStudyUID: string): Boolean;
begin
  Result := false;
end;

function TViewerBaseForm.NewDatasets(AName,
  AStudyUID: string): TCnsDMTable;
begin
  Result := nil;
end;

procedure TViewerBaseForm.RefreshList;
begin

end;

procedure TViewerBaseForm.RefreshViews;
begin

end;

procedure TViewerBaseForm.SaveKeyImage;
begin

end;

procedure TViewerBaseForm.SaveToDicomDIR(APath: string);
begin

end;

procedure TViewerBaseForm.SetAuthType(const Value: Integer);
begin
  FAuthType := Value;
end;

procedure TViewerBaseForm.SetCalledAE(const Value: string);
begin
  FCalledAE := Value;
end;

procedure TViewerBaseForm.SetCallingAE(const Value: string);
begin
  FCallingAE := Value;
end;

procedure TViewerBaseForm.SetCurrentProfileName(const Value: string);
begin
  FCurrentProfileName := Value;
end;

procedure TViewerBaseForm.SetHost(const Value: string);
begin
  FHost := Value;
end;

procedure TViewerBaseForm.SetOnAfterDicomPrintFilm(
  const Value: TOnPrintImageToFilm);
begin
  FOnAfterDicomPrintFilm := Value;
end;

procedure TViewerBaseForm.SetOnAfterLoadimageFinish(
  const Value: TNotifyEvent);
begin
  FOnAfterLoadimageFinish := Value;
end;

procedure TViewerBaseForm.SetOnAfterReceive(const Value: TNotifyEvent);
begin
  FOnAfterReceive := Value;
end;

procedure TViewerBaseForm.SetOnDicomDeleteImage(
  const Value: TOnSaveImageQuestionEvent);
begin
  FOnDicomDeleteImage := Value;
end;

procedure TViewerBaseForm.SetOnDicomDo3DRendering(
  const Value: TOnSaveImageQuestionEvent);
begin
  FOnDicomDo3DRendering := Value;
end;

procedure TViewerBaseForm.SetOnDicomExportImage(
  const Value: TOnSaveImageQuestionEvent);
begin
  FOnDicomExportImage := Value;
end;

procedure TViewerBaseForm.SetOnDicomPrintFilm(
  const Value: TOnDicomPrintFilmEvent);
begin
  FOnDicomPrintFilm := Value;
end;

procedure TViewerBaseForm.SetOnDicomPrintFilmGetAccessionNumber(
  const Value: TOnDicomPrintFilmGetAccessionNumberEvent);
begin
  FOnDicomPrintFilmGetAccessionNumber := Value;
end;

procedure TViewerBaseForm.SetOnDicomSaveAsImage(
  const Value: TOnSaveImageQuestionEvent);
begin
  FOnDicomSaveAsImage := Value;
end;

procedure TViewerBaseForm.SetOnDicomSendImage(
  const Value: TOnSaveImageQuestionEvent);
begin
  FOnDicomSendImage := Value;
end;

procedure TViewerBaseForm.SetOnGetStudyReportText(
  const Value: TOnGetStudyReportTextEvent);
begin
  FOnGetStudyReportText := Value;
end;

procedure TViewerBaseForm.SetOnIconReceive(
  const Value: TCnsDicomConnectionIconImagesEvent);
begin
  FOnIconReceive := Value;
end;

procedure TViewerBaseForm.SetOnImageFlagChange(const Value: TNotifyEvent);
begin
  FOnImageFlagChange := Value;
end;

procedure TViewerBaseForm.SetOnImageFormClose(const Value: TNotifyEvent);
begin
  FOnImageFormClose := Value;
end;

procedure TViewerBaseForm.SetOnImageFormHide(const Value: TNotifyEvent);
begin
  FOnImageFormHide := Value;
end;

procedure TViewerBaseForm.SetOnReceive(
  const Value: TCnsDicomConnectionNewImageEvent);
begin
  FOnReceive := Value;
end;

procedure TViewerBaseForm.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TViewerBaseForm.SetPort(const Value: Integer);
begin
  FPort := Value;
end;

procedure TViewerBaseForm.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

function TViewerBaseForm.WadoLoadImages(AHost: string; APort: Integer;
  AName, AStudyUID, ATranferSyntax, ALevel: string; ALock,
  AOnlyLoadKeyImage: Boolean): Boolean;
begin
  Result := false;
end;

procedure TViewerBaseForm.FormCreate(Sender: TObject);
begin
  fThirdImageFormList := TList.Create;

  fHost := '127.0.0.1';
  fPort := 104;
  fCallingAE := '';
  fCalledAE := '';

  //FLoadStyle := false;
  FAuthType := 0;
  FPassword := '';
  FUserName := '';

  FCurrentProfileName := '';
  FConferenceClient := nil;
  fDragDicomDataset := nil;
end;

procedure TViewerBaseForm.FormDestroy(Sender: TObject);
begin
  fThirdImageFormList.Free;
  FCurrentProfileName := '';

end;

procedure TViewerBaseForm.SetConferenceClient(
  const Value: TDCMConferenceClient);
begin
  FConferenceClient := Value;
end;

procedure TViewerBaseForm.SetDragDicomDataset(
  const Value: TDicomAttributes);
begin
  FDragDicomDataset := Value;
end;

procedure TViewerBaseForm.DoSaveFlags(ADatasets: TDicomAttributes);
begin

end;

function TViewerBaseForm.FindQueueItem(
  AStudyUID: string): TNetworkQueueItem;
begin
  Result := nil;
end;

procedure TViewerBaseForm.SetOnImageFormQuery(const Value: TNotifyEvent);
begin
  FOnImageFormQuery := Value;
end;

procedure TViewerBaseForm.SetOnEditImageInfo(const Value: TNotifyEvent);
begin
  FOnEditImageInfo := Value;
end;

procedure TViewerBaseForm.RefreshMenu;
begin

end;

procedure TViewerBaseForm.SaveUserConfig;
begin

end;

function TViewerBaseForm.CreateProcedure: TCnsStorageProcedure;
begin
  Result := nil;
end;

procedure TViewerBaseForm.ExecSQL(ADatabase, ASQL: string);
begin

end;

procedure TViewerBaseForm.SetOnShowRenderingForm(
  const Value: TOnShowFormEvent);
begin
  FOnShowRenderingForm := Value;
end;

end.

