unit dcm_dicom_view;

interface
{$I DicomPack.inc}

{.$DEFINE DICOMDEBUX1}

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, dcm_vgcore,
  {$IFDEF DICOMDEBUX1}DbugIntf, {$ENDIF}forms, Dialogs, kxstring, CnsHotKeyManager,
  DCM_Attributes, DCM_ImageData_vxBitmap, DCM_Client, DB, DCM_Templates, DicomVFWView,
  ExtCtrls, DCM_UID;

type
  TImageSynchronization = (isSameModalitySynchronization, isSamePatientSynchronization,
    isSameStudySynchronization, isSameSeriesSynchronization, isManualSynchronization);
  TImageScrollSynchronization = (issManual, issPatientPosition, issImageIndex,
    issImageTime, issImageAcquisitionTime);
  TImageRefrenceLineOptions = (irloNotShow, irloCurrentImage, irloFirstLast, irloCurrentSeries, irloAllImages);

  TImageStackOptions = (isoImageNumber, isoSliceLocation, isoReverseSliceLocation,
    isoAcquisitionTime, isoImageTime);
  TImageWindowsLevelingOptions = (iwloLinear, iwloSigmoidal, iwloCustom, iwloSensitivity);

  TUpdateImageType = (uitWindowsWidthLevel, uitZoom, uitPan, uitVerFlip,
    uitHozFlip, uitRotate, uitLUT, uitNegative, uitReset, uitResetZoom);

  TMagnifierViewShape = (mvsCircle, mvsRectangle, mvsBlurRectangle, mvsBlurRoundRect);

  TImageRectDisplayType = (irdtImage, irdtAxial, irdtCoronal, irdtVolume, irdtMIP);

  //TInsertObjectType = (iotRect, iotRuler, iotArrow, iotCycle, iotLine, iotPLine, iotPGrid, iotAngle);

  TOnDragDicomDatasetEvent = procedure(Sender: TObject; var ADicomDatasets: TDicomDatasets;
    var ASeriesUID: string; var ASeriesIndex, AImageindex: Integer) of object;

  TSeriesRect = class;
  TStudyRect = class;
  TvxDicomView = class;
  TImageRect = class
  private
    fParent: TSeriesRect;
    FDicomDataset: TDicomDataset;
    fImageRect: TvxRect;
    fModify: Boolean;
    FBitmap: TvxBitmap;
    FPositionCursorColor: TColor;
    FPositionCursorPosition: TvxPoint;
    FImageIndex: Integer;
    FMouseIn: Boolean;
    FFocus: Boolean;
    fInseringBox: TvxRect;
    FDisplayType: TImageRectDisplayType;
    FSliceWeight: Integer;
    FScale: Double;
    FOffsetVert: Double;
    FOffsetHorz: Double;
    FLockView: Boolean;

    fDrawCine: TDicomDirectDrawCine;
    FTimer: TTimer;
    fCineActive: Boolean;
    fCineDirection: Boolean;
    fCineSpeed: integer;

    procedure SetDicomDataset(const Value: TDicomDataset);

    procedure SetBitmap(const Value: TvxBitmap);
    procedure SetPositionCursorColor(const Value: TColor);
    procedure SetPositionCursorPosition(const Value: TvxPoint);
    procedure SetImageIndex(const Value: Integer);
    procedure SetFocus(const Value: Boolean);
    procedure SetMouseIn(const Value: Boolean);
    procedure SetDisplayType(const Value: TImageRectDisplayType);
    procedure SetSliceWeight(const Value: Integer);
    function GetHeight: Integer;
    function GetWidth: Integer;
    procedure SetScale(const Value: Double);
    procedure SetOffsetHorz(const Value: Double);
    procedure SetOffsetVert(const Value: Double);
    procedure SetLockView(const Value: Boolean);
    procedure SetCineActive(const Value: Boolean);
    procedure SetCineDirection(const Value: Boolean);
    procedure SetCineSpeed(const Value: integer);

  protected

  public
    constructor Create(aParent: TSeriesRect);
    destructor Destroy; override;

    procedure DoDirectDrawCine(Sender: TObject; AIndex: Integer);
    procedure DoPlayCine(Sender: TObject);

    property Rect: TvxRect read fImageRect;

    property Bitmap: TvxBitmap read FBitmap write SetBitmap;
    property DicomDataset: TDicomDataset read FDicomDataset write SetDicomDataset;
    property ImageIndex: Integer read FImageIndex write SetImageIndex;

    property Focus: Boolean read FFocus write SetFocus;
    property MouseIn: Boolean read FMouseIn write SetMouseIn;
    property LockView: Boolean read FLockView write SetLockView;

    property Width: Integer read GetWidth;
    property height: Integer read GetHeight;
    property Scale: Double read FScale write SetScale;
    property OffsetHorz: Double read FOffsetHorz write SetOffsetHorz;
    property OffsetVert: Double read FOffsetVert write SetOffsetVert;

    property DrawCine: TDicomDirectDrawCine read fDrawCine;
    property CineActive: Boolean read fCineActive write SetCineActive;
    property CineDirection: Boolean read fCineDirection write SetCineDirection;
    property CineSpeed: integer read fCineSpeed write SetCineSpeed;

    property PositionCursorPosition: TvxPoint read FPositionCursorPosition write SetPositionCursorPosition;
    property PositionCursorColor: TColor read FPositionCursorColor write SetPositionCursorColor;

    property DisplayType: TImageRectDisplayType read FDisplayType write SetDisplayType;
    property SliceWeight: Integer read FSliceWeight write SetSliceWeight;
  published

  end;

  TSeriesRect = class
  private
    fImageRectList: TList;

    FSeriesUID: string;
    FCurrentImageIndex: Integer;
    FDicomDatasets: TDicomDatasets;

    //FFullScreenImage: TImageRect;
    //FOldImageBeforeFullScreen: TImageRect;
    FOldImageIndexBeforeFullScreen: Integer;
    FOldCurrentImageIndexBeforeFullScreen: Integer;
    fOldGridFormatBeforeFullScreen: string;

    fParent: TStudyRect;
    fSeriesRect: TvxRect;
    FStudyUID: string;
    FGridFormat: string;
    fSeriesIndex: Integer;
    FActiveRect: TImageRect;

    function GetItems(index: Integer): TImageRect;

    procedure SetCurrentImageIndex(const Value: Integer);

    procedure SetGridFormat(const Value: string);
    procedure SetActiveRect(const Value: TImageRect);
    function GetActiveRect1: TImageRect;
    function GetImageCountPerpage: Integer;

  protected
    procedure ResizeRect;
  public
    constructor Create(aParent: TStudyRect);
    destructor Destroy; override;

    procedure Clear;

    procedure NextImage;
    procedure PriorImage;

    procedure NextPage;
    procedure PriorPage;

    procedure FirstImage;
    procedure LastImage;

    procedure FirstPage;
    procedure LastPage;

    procedure DoChangeSeries;

    function GetCountOfAssignImageRect: integer;

    procedure SetBound(ARect: TvxRect);
    procedure SetData(ADicomDatasets: TDicomDatasets; ASeriesUID: string; ASeriesIndex, AIndex: Integer);

    property DicomDatasets: TDicomDatasets read FDicomDatasets;
    property SeriesUID: string read FSeriesUID;
    property SeriesIndex: Integer read fSeriesIndex;
    property CurrentImageIndex: Integer read FCurrentImageIndex write SetCurrentImageIndex;

    property GridFormat: string read FGridFormat write SetGridFormat;

    function GetActiveRect(X, Y: Single): TImageRect;
    property Items[index: Integer]: TImageRect read GetItems;
    property ActiveRect: TImageRect read GetActiveRect1 write SetActiveRect;
    property ImageCountPerPage: Integer read GetImageCountPerpage;
  published

  end;

  TStudyRect = class
  private
    fSeriesRectList: TList;
    fDicomDatasetsList: TList;

    fParent: TvxDicomView;
    fStudyRect: TvxRect;
    FGridFormat: string;
    FOnFormatChange: TNotifyEvent;
    FClassifyBySeriesUID: Boolean;

    function GetItems(index: Integer): TSeriesRect;
    procedure SetGridFormat(const Value: string);
    function GetAllSeriesCount: Integer;
    function GetAllImagesCount: Integer;
    procedure SetOnFormatChange(const Value: TNotifyEvent);
    procedure SetClassifyBySeriesUID(const Value: Boolean);
    function GetItemsBySeriesUID(index: string): TSeriesRect;
  protected
    fCurrentDicomDatasetIndex: Integer;
    fCurrentSeriesIndex: Integer;

    procedure ResizeRect;
    procedure DoChange;
    procedure Clear;
  public
    constructor Create(aParent: TvxDicomView);
    destructor Destroy; override;

    procedure AddDatasets(ADicomDatasets: TDicomDatasets);
    procedure RemoveDatasets(ADicomDatasets: TDicomDatasets);
    procedure ChangeDatasets(ADicomDatasets: TDicomDatasets);

    procedure NextSeries;
    procedure PriorSeries;
    procedure FirstSeries;
    procedure LastSeries;

    procedure SetBound(ARect: TvxRect);

    function GetActiveRect(X, Y: Single): TSeriesRect;
    function FindImageRect(ADataset: TDicomDataset): TImageRect;

    function GetSeriesCount: Integer;

    property GridFormat: string read FGridFormat write SetGridFormat;
    property Items[index: Integer]: TSeriesRect read GetItems;
    property ItemsBySeriesUID[index: string]: TSeriesRect read GetItemsBySeriesUID;
  published
    property ClassifyBySeriesUID: Boolean read FClassifyBySeriesUID write SetClassifyBySeriesUID;
    property OnFormatChange: TNotifyEvent read FOnFormatChange write SetOnFormatChange;
  end;

  TOnSetButtonEvent = procedure(Sender: TObject; var aButtonVisible: Boolean; var AHint: AnsiString) of object;

  TvxDicomToolbar = class(TvxToolbar)
  private
    FButtonSpacing: Integer;
    FButtonSize: Integer;
    FButtonPadding: Integer;

    procedure SetButtonPadding(const Value: Integer);
    procedure SetButtonSize(const Value: Integer);
    procedure SetButtonSpacing(const Value: Integer);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Realign; override;
    procedure MatrixChanged(Sender: TObject); override;
    procedure AddObject(AObject: TvxObject); override;
    procedure RemoveObject(AObject: TvxObject); override;

    function ChangeButtonSetting(aButtonName: AnsiString; aButtonViaible: Boolean; aButtonIndex: Integer; aButtonHint: AnsiString): Boolean;
  published
    property Align default vaTop;
    property Resource;

    property ButtonSize: Integer read FButtonSize write SetButtonSize;
    property ButtonPadding: Integer read FButtonPadding write SetButtonPadding;
    property ButtonSpacing: Integer read FButtonSpacing write SetButtonSpacing;
  end;

  TvxDicomView = class(TvxControl) //TvxScrollBox)
  private
    //FBack: TvxRectangle;

    LastMousePos: TvxPoint;
    LastChangeMousePos: TvxPoint;
    DownMousePos: TvxPoint;
    MovingMousePos: TvxPoint;
    //MouseDownScale: Double;

    fLeftMouseInteract: TMouseInteract;
    fRightMouseInteract: TMouseInteract;
    fMouseWheelInteract: TMouseWheelInteract;
    fMouseDragging: Boolean;
    fDraggingMouseButton: TMouseButton;

    fOnCanLock: TDicomImageCanLockEvent;
    FOnImageCineTo: TDicomImageCineToEvent;
    fOnDicomImageLock: TDicomImageLockEvent;
    fOnTopoLineClick: TDicomImageTopoLineClickEvent;
    FAfterObjectMove: TDrawObjectNotifyEvent;
    FAfterNewDrawObject: TDrawObjectNotifyEvent;
    FAfterObjectSize: TDrawObjectNotifyEvent;
    FOnImageScrollChange: TImageScrollChangeEvent;
    FOnImageZoomChange: TImageZoomChangeEvent;
    fOnCustomPopupMenuPopup: TNotifyEvent;
    FOn3DCursorEnd: TNotifyEvent;
    FOnViewFlagChange: TNotifyEvent;
    fOnReturnObjectSelect: TNotifyEvent;
    FOnCustomDrawObjectPopupMenuPopup: TNotifyEvent;
    fOnDatasetChanged: TNotifyEvent;
    FOn3DCursorMove: TOn3DCursorEvent;
    FOnDragDropToPrint: TOnDragDropToPrintEvent;
    fOnOverlayLabel: TOnOverlayLabelEvent;
    FOnCustomOverlayLabel: TOnOverlayLabelEvent;
    FOnImageWinLevelChange: TWinLevelChangeEvent;

    fStudyRect: TStudyRect;
    fDicomDatasetsList: TList;

    fResized: Boolean;
    FDragDropMode: TDragDropMode;
    FDragFrom: TDragFromSource;
    fDisplayLabel: Boolean;
    FDisplayRightRuler: Boolean;
    //    fTextOverlayMode: Boolean;
    FDisplayWLLabel: Boolean;
    fDisplayReport: Boolean;
    FShowPixelValueHint: Boolean;
    FDisplayBottomRuler: Boolean;
    FDisplayRuler: Boolean;
    FDisplayImagePosition: Boolean;

    fQueues: TThreadList;
    FOnSelectMultiFilms: TOnSelectMultiSeriesEvent;
    FOnSelectMultiSeries: TOnSelectMultiSeriesEvent;
    FDefaultClient: TCnsDicomConnection;

    FShowThumbnails: Boolean;
    FThumbnailsHeight: Integer;
    FThumbnailsRows: Integer;
    FThumbnailsAlign: TAlign;
    FThumbnailsRect: TvxRect;
    FThumbnailsButtonsRect: TvxRect;
    FThumbnailsIconsRect: TvxRect;
    FThumbnailsIconsLength: Integer;
    FThumbnailsButtonHeight: Integer;
    //fThumbnailsListBox: TvxListBox;
    //fThumbnailsButtonList:TList;
    FThumbnailsScrollBar: TvxScrollBar;

    FOnSetPresetWidthLevel: TDicomImagePresetWidthLevelEvent;
    FImageSynchronization: TImageSynchronization;

    FActiveImage: TImageRect;
    FActiveSeries: TSeriesRect;

    FMouseInImage: TImageRect;
    FMouseInSeries: TSeriesRect;

    FFullScreenSeries: TSeriesRect;
    FOldSeriesBeforeFullScreen: TSeriesRect;
    FOldImageIndexBeforeFullScreen: Integer;

    fActiveThumbnails: Integer;
    FShowSeriesThumbnailOnly: Boolean;
    fThumbnailStart: Integer;
    fThumbnailDrag: Integer;
    fThumbnailSelected: Integer;
    fThumbnailBitmapList: TList;

    fOldThumbnailStart: Integer;
    FOnViewSelected: TNotifyEvent;
    FSynchronizationAfterMouseMove: Boolean;
    FScrollSynchronization: TImageScrollSynchronization;
    FScrollSynchronizationOnlySameStudy: Boolean;
    FStackOptions: TImageStackOptions;
    FWindowsLevelingOptions: TImageWindowsLevelingOptions;
    FRefrenceLineOptions: TImageRefrenceLineOptions;
    FClassifyBySeriesUID: Boolean;
    fLeaderMouserInspect: TLeaderMouserInspect;
    FFullScreenInSeries: Boolean;
    FOnIconReceive: TCnsDicomConnectionIconImagesEvent;
    FOnReceive: TCnsDicomConnectionNewImageEvent;

    fModalityTable: TCnsDBTable;
    fImageEnhancementTable: TCnsDBTable;
    fGroupTable: TCnsDBTable;
    fDicomPrinterTable: TCnsDBTable;
    //fLookuptableTable: TCnsDBTable;
    fPresetTable: TCnsDBTable;
    fLayoutTable: TCnsDBTable;
    fInfoProposalsTable: TCnsDBTable;
    fInformationLabelsTable: TCnsDBTable;

    fOnHttpGet: TCnsDicomConnectionHttpGetEvent;
    fOnHttpPost: TCnsDicomConnectionHttpPostEvent;
    FDefaultUserText: string;
    FMagnifierViewShape: TMagnifierViewShape;
    FImageOrder: TDicomDatasetSortBy;
    FOnDragDicomDataset: TOnDragDicomDatasetEvent;
    FPrinterIcon: TvxBitmap;
    FSelectedIcon: TvxBitmap;
    FLockIcon: Tvxbitmap;
    FUseSynchronizeEvent: Boolean;
    FReceiveTimeout: Integer;
    FLabelFontName: string;
    FCurrentProfileName: string;

    function PointInRect(x, y: Single; ARect: TvxRect): Boolean;

    procedure SetOn3DCursorEnd(const Value: TNotifyEvent);
    procedure SetOn3DCursorMove(const Value: TOn3DCursorEvent);
    procedure SetOnCustomDrawObjectPopupMenuPopup(
      const Value: TNotifyEvent);
    procedure SetOnCustomOverlayLabel(const Value: TOnOverlayLabelEvent);
    procedure SetOnDragDropToPrint(const Value: TOnDragDropToPrintEvent);
    procedure SetLeftMouseInteract(const Value: TMouseInteract);
    procedure SetMouseWheelInteract(const Value: TMouseWheelInteract);
    procedure SetRightMouseInteract(const Value: TMouseInteract);

    procedure DrawDicomImage(aAttributes: TDicomAttributes; ARect: TImageRect);
    procedure DrawThumbnails;
    procedure DrawThumbnailsButtons(AIndex: Integer; ADatasets: TDicomDatasets);
    procedure GetThumbnailsButtonsRect(AIndex: Integer; var r1, r2: TvxRect);
    procedure DrawBoxInserting(ARect: TImageRect);

    procedure SetDragDropMode(const Value: TDragDropMode);
    procedure SetDragFrom(const Value: TDragFromSource);
    procedure SetDisplayBottomRuler(const Value: Boolean);
    procedure SetDisplayLabel(const Value: Boolean);
    procedure SetDisplayReport(const Value: Boolean);
    procedure SetDisplayRightRuler(const Value: Boolean);
    procedure SetDisplayRuler(const Value: Boolean);
    procedure SetDisplayWLLabel(const Value: Boolean);

    procedure SetShowPixelValueHint(const Value: Boolean);
    procedure SetDisplayImagePosition(const Value: Boolean);
    procedure SetOnSelectMultiFilms(
      const Value: TOnSelectMultiSeriesEvent);
    procedure SetOnSelectMultiSeries(
      const Value: TOnSelectMultiSeriesEvent);
    procedure SetDefaultClient(const Value: TCnsDicomConnection);
    procedure SetShowThumbnails(const Value: Boolean);
    procedure SetThumbnailsAlign(const Value: TAlign);
    procedure SetThumbnailsHeight(const Value: Integer);
    procedure SetThumbnailsRows(const Value: Integer);
    procedure SetOnSetPresetWidthLevel(
      const Value: TDicomImagePresetWidthLevelEvent);

    procedure SetImageSynchronization(const Value: TImageSynchronization);
    procedure DrawDicomImageIcon(AIndex: Integer; aAttributes: TDicomAttributes;
      ARect: TvxRect; AText: AnsiString; ASelected: Boolean);
    procedure FillUnDrawRect(aR_dst, aR_draw: TvxRect; AColor: TColor);
    procedure SetShowSeriesThumbnailOnly(const Value: Boolean);
    function GetActiveImage: TImageRect;
    function GetActiveSeries: TSeriesRect;
    procedure SetOnViewSelected(const Value: TNotifyEvent);
    procedure UpdateImageParam(ADicomDataset: TDicomDataset; AType: TUpdateImageType);
    procedure SetSynchronizationAfterMouseMove(const Value: Boolean);
    procedure SetScrollSynchronization(
      const Value: TImageScrollSynchronization);
    procedure SetScrollSynchronizationOnlySameStudy(const Value: Boolean);
    procedure SetStackOptions(const Value: TImageStackOptions);
    procedure SetWindowsLevelingOptions(
      const Value: TImageWindowsLevelingOptions);
    procedure SetRefrenceLineOptions(
      const Value: TImageRefrenceLineOptions);
    procedure SetClassifyBySeriesUID(const Value: Boolean);
    function GetSelectRect: TvxRect;
    procedure SelectionROI;
    procedure SelectionZoom;
    procedure SelectionRect;
    procedure SetLeaderMouserInspect(const Value: TLeaderMouserInspect);
    function GetLeaderMouserInspect: TLeaderMouserInspect;
    procedure SetFullScreenInSeries(const Value: Boolean);
    procedure SetOnIconReceive(
      const Value: TCnsDicomConnectionIconImagesEvent);
    procedure SetOnReceive(const Value: TCnsDicomConnectionNewImageEvent);
    function GetClassifyBySeriesUID: Boolean;
    procedure UpdateHint(x, y: Double);
    procedure UpdateMagnifier(x, y: Double);
    procedure SetDefaultUserText(const Value: string);
    procedure SetMagnifierViewShape(const Value: TMagnifierViewShape);
    procedure RemoveHint;
    procedure RemoveMagnifier;
    procedure SetImageOrder(const Value: TDicomDatasetSortBy);
    procedure SetOnDragDicomDataset(const Value: TOnDragDicomDatasetEvent);
    procedure SetPrintDicomDatasets(const Value: TCnsDMtable);
    procedure SetLockIcon(const Value: Tvxbitmap);
    procedure SetPrinterIcon(const Value: TvxBitmap);
    procedure SetSelectedIcon(const Value: TvxBitmap);
    procedure SetDrawRect(const Value: TvxRect);
    procedure SetUseSynchronizeEvent(const Value: Boolean);
    procedure SetReceiveTimeout(const Value: Integer);
    procedure SetLabelFontName(const Value: string);
    procedure SetCurrentProfileName(const Value: string);
  protected
    InitingData: Boolean;

    fLoadStyle: Boolean;

    fDrawRect: TvxRect;

    fWHint: TvxLabel;
    fMagnifierView: TvxShape;
    fTextEdit: TvxMemo;

    fPrintDicomDatasets: TCnsDMtable;

    fUpdateCount: Integer;

    fSetScrolllbarValue: Boolean;

    procedure DoStudyFormatChange(Sender: TObject);

    procedure DoDragDicomDataset(Sender: TObject; ADicomDatasets: TDicomDatasets;
      ASeriesUID: string; ASeriesIndex, AImageindex: Integer);

    procedure DoLoadFrame(Sender: TObject);
    procedure DoLoadFrameFinish(Sender: TObject);
    procedure DoAfterLoad(Sender: TObject);
    procedure DoAddDataset(Sender: TObject; ADataset: TDicomDataset);
    function GetViewportRect: TvxRect; virtual;
    function GetThumbnailsRect: TvxRect;

    procedure ApplyModalitySetting(ADataset: TDicomDataset);

    procedure DoThumbnailsScrollBarChange(Sender: TObject);

    function GetData: Variant; override;
    procedure SetData(const Value: Variant); override;

    procedure DoHttpGet(Sender: TObject; AURL: string; AStm: TStream);
    procedure DoHttpPost(Sender: TObject; AURL: string; const ASource, AResponse: TStream);

    procedure DoActiveImageChange(aActiveImage: TImageRect);
    procedure Do3DCursorMove(X, Y: Double);
    procedure Do3DCursorEnd;
    function DoSetPresetWidthLevel(Shift: TShiftState; AKey: Integer): Boolean;
    function GetCanLockImage: Boolean;

    procedure DoFinishNewDrawObject(Sender: TObject);
    procedure DoDrawObjectSize(Sender: TObject);
    procedure DoDrawObjectMove(Sender: TObject);
    procedure UpdateObjectText(das: TDicomAttributes; AObject: TDicomDrawObject);

    procedure ThreadGetImage(AHost: string; APort: Integer; n1: TNetworkQueueItem;
      AStudyUID: string; ALock: Boolean; AOnlyLoadKeyImage: Boolean; APaperStudyUID: string);
    procedure ThreadMGetImage(AHost: string; APort: Integer; n1: TNetworkQueueItem;
      AStudyUID: string; ALock: Boolean; AOnlyLoadKeyImage: Boolean; APaperStudyUID: string);
    procedure ThreadWADOImage(AHost: string; APort: Integer; n1: TNetworkQueueItem;
      AStartURL, AStudyUID, ATranferSyntax, ALevel: string; ALock: Boolean; AOnlyLoadKeyImage: Boolean; APaperStudyUID: string);
    procedure ThreadLoadImageFromDicomDIR(n1: TNetworkQueueItem; AStudyUID: string;
      DicomdirImagesTable: TDataset; ImagePath: string);

    procedure CancelInteracts;
    procedure TextEditKeyDown(Sender: TObject; var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
    procedure ActiveTextEdit;
    procedure UpdateTextEdit;
    procedure RemoveTextEdit;
    procedure TextEditExit(Sender: TObject);

    function GetUpdateRect: TvxRect; override;

    property DrawRect: TvxRect read fDrawRect write SetDrawRect;
  public
    procedure Paint; override;
    procedure Redraw(AFull: Boolean = false);
    procedure Repaint; override;

    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: single); override;
    procedure MouseMove(Shift: TShiftState; X, Y, Dx, Dy: single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: single); override;
    procedure MouseWheel(Shift: TShiftState; WheelDelta: integer; var Handled: boolean); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure DialogKey(var Key: Word; Shift: TShiftState); override;
    procedure EnterFocus; override;
    procedure KillFocus; override;
    procedure MouseEnter; override;
    procedure MouseLeave; override;
    procedure DblClick; override;

    procedure MatrixChanged(Sender: TObject); override;
    procedure Realign; override;

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    procedure LoadLayoutFrom(das1: TDicomAttributes);
    procedure SaveLayoutTo(das1: TDicomAttributes);

    function CreateDicomDataset(AStudyUID: string): TCnsDMTable;

    function CreateDBTable: TCnsDBTable;

    function BuildAllDatasetViaWadoPost: Boolean;
    function BuildAllDataset: Boolean;

    procedure LayoutChange(ACaption: string);

    procedure AddInformationLabels(ADataset: TDicomDataset); overload;
    procedure AddInformationLabels(ADatasets: TDicomDatasets); overload;

    property ActiveImage: TImageRect read GetActiveImage;
    property ActiveSeries: TSeriesRect read GetActiveSeries;

    property DicomPrinterTable: TCnsDBTable read fDicomPrinterTable;
    property GroupTable: TCnsDBTable read fGroupTable;
    property ModalityTable: TCnsDBTable read fModalityTable;
    property PresetTable: TCnsDBTable read fPresetTable;
    //property LookuptableTable: TCnsDBTable read fLookuptableTable;
    property LayoutTable: TCnsDBTable read fLayoutTable;

    property InformationLabelsTable: TCnsDBTable read fInformationLabelsTable;
    property InfoProposalsTable: TCnsDBTable read fInfoProposalsTable;

    property ImageEnhancementTable: TCnsDBTable read fImageEnhancementTable;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function GetCurrentDicomDataset: TCnsDMTable;
    function FindDicomDataset(AStudyUID: string): TCnsDMTable;
    function RemoveDicomDataset(AStudyUID: string; ADataset: TCnsDMTable): Boolean;
    procedure ClearDicomDatasets;
    function GetDicomDatasetsCount: Integer;
    function GetDicomDatasets(index: Integer): TDicomDatasets;

    procedure RefreshQueue;
    function AddQueueItem: TNetworkQueueItem;
    procedure ClearQueue;
    procedure RemoveAllQueue;
    function FindQueueItem(AStudyUID: string): TNetworkQueueItem;
    function TestIfInLoading(ADatasets: TDicomDatasets): Boolean;
    function CloseIfInLoading(ADatasets: TDicomDatasets): Boolean;

    procedure aftersend(Sender: TObject; APosition: Integer);
    procedure aftererror(Sender: TObject);
    procedure afterFinish(Sender: TObject);
    procedure DoStartImage(Sender: TObject);
    function IsStudyLoading(AUID: string): Boolean;
    function IsStudyLoading1(AUID: string): Boolean;

    procedure DoNewImage(Sender: TObject; ADataset: TDicomDataset);
    procedure DoIconImageReceive(Sender: TObject; ADataset: TDicomAttribute);
    function CreateProcedure: TCnsStorageProcedure;

    function InitData(AMode: Integer): Boolean; overload;
    function InitData(AView: TvxDicomView): Boolean; overload;
    //load image
    procedure LoadPaper(AHost: string; APort: Integer; ADataset: TDicomDatasets; AStudyUID, AImageStudyUID: string);
    function IfMustLoadBySeriesUID(AStudyUID: string): Boolean;
    procedure SelectMultiSeriesUID(AHost: string; APort: Integer; AStudyUID: string; n1: TNetworkQueueItem; ALock: Boolean;
      AOnlyLoadKeyImage: Boolean); overload;
    procedure SelectMultiSeriesUID(AHost: string; APort: Integer; ADatasets: TDicomDatasets; AOnlyLoadKeyImage: Boolean);
      overload;

    function LoadImages(AHost: string; APort: Integer; AName, AStudyUID: string; ALock: Boolean; AOnlyLoadKeyImage: Boolean):
      Boolean;
    function WadoLoadImages(AHost: string; APort: Integer; AName, AStudyUID, ATranferSyntax, ALevel: string; ALock: Boolean;
      AOnlyLoadKeyImage: Boolean): Boolean;
    function MGETLoadImages(AHost: string; APort: Integer; AName, AStudyUID: string; ALock: Boolean; AOnlyLoadKeyImage: Boolean;
      APatientName, AHospitalName, APatientID, APaperStudyUID: string): Boolean;
    function MGETLoadFilmImages(AHost: string; APort: Integer; AName, AStudyUID: string; ALock: Boolean; AOnlyLoadKeyImage:
      Boolean; APatientName, AHospitalName, APatientID: string): Boolean;

    procedure LoadFromFile(AFileName: string);

    //image function
    procedure ResetImageZoom;
    procedure ResetImage;
    procedure Negative;
    procedure SetWinLevel(AWin, ALevel: Integer);
    procedure SetLut(AStream: TStream);
    procedure SetHozFlip(AValue: Boolean);
    procedure SetVerFlip(AValue: Boolean);
    procedure RotalImageCW;
    procedure RotalImageCCW;
    procedure DeleteLabel;

    property StudyRect: TStudyRect read fStudyRect;

    property DragFrom: TDragFromSource read FDragFrom write SetDragFrom;
    property DragDropMode: TDragDropMode read FDragDropMode write SetDragDropMode;

    property ShowPixelValueHint: Boolean read FShowPixelValueHint write SetShowPixelValueHint;

    property DefaultUserText: string read FDefaultUserText write SetDefaultUserText;
    property PrintDicomDatasets: TCnsDMtable read FPrintDicomDatasets write SetPrintDicomDatasets;

    property CurrentProfileName: string read FCurrentProfileName write SetCurrentProfileName;
  published
    property DefaultClient: TCnsDicomConnection read FDefaultClient write SetDefaultClient;

    property UseSynchronizeEvent: Boolean read FUseSynchronizeEvent write SetUseSynchronizeEvent;
    property ReceiveTimeout: Integer read FReceiveTimeout write SetReceiveTimeout;
    property SelectedIcon: TvxBitmap read FSelectedIcon write SetSelectedIcon;
    property PrinterIcon: TvxBitmap read FPrinterIcon write SetPrinterIcon;
    property LockIcon: Tvxbitmap read FLockIcon write SetLockIcon;

    property ImageOrder: TDicomDatasetSortBy read FImageOrder write SetImageOrder;

    property DisplayLabel: Boolean read fDisplayLabel write SetDisplayLabel;
    property DisplayWLLabel: Boolean read FDisplayWLLabel write SetDisplayWLLabel;
    property DisplayImagePosition: Boolean read FDisplayImagePosition write SetDisplayImagePosition;
    property DisplayRuler: Boolean read FDisplayRuler write SetDisplayRuler;
    property DisplayRightRuler: Boolean read FDisplayRightRuler write SetDisplayRightRuler;
    property DisplayBottomRuler: Boolean read FDisplayBottomRuler write SetDisplayBottomRuler;
    property DisplayReport: Boolean read fDisplayReport write SetDisplayReport;
    property ClassifyBySeriesUID: Boolean read GetClassifyBySeriesUID write SetClassifyBySeriesUID;
    property LabelFontName: string read FLabelFontName write SetLabelFontName;

    property FullScreenInSeries: Boolean read FFullScreenInSeries write SetFullScreenInSeries;

    property MagnifierViewShape: TMagnifierViewShape read FMagnifierViewShape write SetMagnifierViewShape;

    property SynchronizationAfterMouseMove: Boolean read FSynchronizationAfterMouseMove write SetSynchronizationAfterMouseMove;
    property ShowThumbnails: Boolean read FShowThumbnails write SetShowThumbnails;
    property ThumbnailsAlign: TAlign read FThumbnailsAlign write SetThumbnailsAlign;
    property ThumbnailsHeight: Integer read FThumbnailsHeight write SetThumbnailsHeight;
    property ThumbnailsRows: Integer read FThumbnailsRows write SetThumbnailsRows;
    property ShowSeriesThumbnailOnly: Boolean read FShowSeriesThumbnailOnly write SetShowSeriesThumbnailOnly;

    property LeftMouseInteract: TMouseInteract read FLeftMouseInteract write SetLeftMouseInteract;
    property RightMouseInteract: TMouseInteract read FRightMouseInteract write SetRightMouseInteract;
    property MouseWheelInteract: TMouseWheelInteract read FMouseWheelInteract write SetMouseWheelInteract;
    property LeaderMouserInspect: TLeaderMouserInspect read GetLeaderMouserInspect write SetLeaderMouserInspect;

    property ImageSynchronization: TImageSynchronization read FImageSynchronization write SetImageSynchronization;
    property ScrollSynchronization: TImageScrollSynchronization read FScrollSynchronization write SetScrollSynchronization;
    property ScrollSynchronizationOnlySameStudy: Boolean read FScrollSynchronizationOnlySameStudy write SetScrollSynchronizationOnlySameStudy;
    property RefrenceLineOptions: TImageRefrenceLineOptions read FRefrenceLineOptions write SetRefrenceLineOptions;

    property StackOptions: TImageStackOptions read FStackOptions write SetStackOptions;
    property WindowsLevelingOptions: TImageWindowsLevelingOptions read FWindowsLevelingOptions write SetWindowsLevelingOptions;
    //event

    property OnImageCineTo: TDicomImageCineToEvent read FOnImageCineTo write FOnImageCineTo;
    property OnImageWinLevelChange: TWinLevelChangeEvent read FOnImageWinLevelChange write
      FOnImageWinLevelChange;
    property OnImageScrollChange: TImageScrollChangeEvent read FOnImageScrollChange write
      FOnImageScrollChange;
    property OnImageZoomChange: TImageZoomChangeEvent read FOnImageZoomChange write
      FOnImageZoomChange;
    property OnReturnObjectSelect: TNotifyEvent read fOnReturnObjectSelect write
      fOnReturnObjectSelect;
    property OnDicomImageLock: TDicomImageLockEvent read fOnDicomImageLock write fOnDicomImageLock;
    property OnCanLock: TDicomImageCanLockEvent read fOnCanLock write fOnCanLock;

    property OnAfterNewDrawObject: TDrawObjectNotifyEvent read FAfterNewDrawObject write
      FAfterNewDrawObject;
    property OnAfterObjectSize: TDrawObjectNotifyEvent read FAfterObjectSize write
      FAfterObjectSize;
    property OnAfterObjectMove: TDrawObjectNotifyEvent read FAfterObjectMove write
      FAfterObjectMove;
    property OnTopoLineClick: TDicomImageTopoLineClickEvent read fOnTopoLineClick write
      fOnTopoLineClick;
    property OnOverlayLabel: TOnOverlayLabelEvent read fOnOverlayLabel write fOnOverlayLabel;
    property OnCustomOverlayLabel: TOnOverlayLabelEvent read FOnCustomOverlayLabel write SetOnCustomOverlayLabel;

    property OnDatasetChanged: TNotifyEvent read fOnDatasetChanged write fOnDatasetChanged;
    property OnCustomPopupMenuPopup: TNotifyEvent read fOnCustomPopupMenuPopup write
      fOnCustomPopupMenuPopup;
    //    property OnCustomPopupMenuClick: TNotifyEvent read fOnCustomPopupMenuClick write
    //      fOnCustomPopupMenuClick;
    property OnCustomDrawObjectPopupMenuPopup: TNotifyEvent read FOnCustomDrawObjectPopupMenuPopup write SetOnCustomDrawObjectPopupMenuPopup;
    //    property OnCustomDrawObjectPopupMenuClick: TNotifyEvent read FOnCustomDrawObjectPopupMenuClick write SetOnCustomDrawObjectPopupMenuClick;

    property OnDragDropToPrint: TOnDragDropToPrintEvent read FOnDragDropToPrint write SetOnDragDropToPrint;

    property OnViewFlagChange: TNotifyEvent read FOnViewFlagChange write FOnViewFlagChange;

    property OnSelectMultiSeries: TOnSelectMultiSeriesEvent read FOnSelectMultiSeries write SetOnSelectMultiSeries;

    property OnSelectMultiFilms: TOnSelectMultiSeriesEvent read FOnSelectMultiFilms write SetOnSelectMultiFilms;

    property On3DCursorMove: TOn3DCursorEvent read FOn3DCursorMove write SetOn3DCursorMove;
    property On3DCursorEnd: TNotifyEvent read FOn3DCursorEnd write SetOn3DCursorEnd;

    property OnIconReceive: TCnsDicomConnectionIconImagesEvent read FOnIconReceive write SetOnIconReceive;
    property OnReceive: TCnsDicomConnectionNewImageEvent read FOnReceive write SetOnReceive;

    property OnHttpGet: TCnsDicomConnectionHttpGetEvent read fOnHttpGet write fOnHttpGet;
    property OnHttpPost: TCnsDicomConnectionHttpPostEvent read fOnHttpPost write fOnHttpPost;

    property OnViewSelected: TNotifyEvent read FOnViewSelected write SetOnViewSelected;
    property OnSetPresetWidthLevel: TDicomImagePresetWidthLevelEvent read FOnSetPresetWidthLevel write SetOnSetPresetWidthLevel;

    property OnDragDicomDataset: TOnDragDicomDatasetEvent read FOnDragDicomDataset write SetOnDragDicomDataset;
  end;

function SpritVxRect(AGridFormat: string; ARect: TvxRect; l: Integer): TvxRect;
function GetModeFromFormat(AGridFormat: string): Integer;
function GetCountFromFormat(AGridFormat: string): Integer;
function GetRowOrColmn(AGridFormat: string; AIndex: Integer): Integer;
function GetRowOrColmnCount(AGridFormat: string): Integer;
function GetRowOrColmnIndex(AGridFormat: string; AIndex: Integer; var aX: Integer): Integer;

implementation

{ TvxDicomView }
uses clipbrd, typinfo,
  {.$IFDEF windows}
  dcm_directx,
  {.$ENDIF}
  {$IFDEF darwin}
  dcm_opengl,
  {$ENDIF}
  {$IFDEF linux}
  dcm_opengl,
  {$ENDIF}
  math;

function GetModeFromFormat(AGridFormat: string): Integer;
var
  TypeString: string;
  k: integer;
begin
  Result := 0;
  if AGridFormat <> '' then
  begin
    k := Pos('\', AGridFormat);
    if k > 0 then
    begin
      TypeString := Copy(AGridFormat, 1, k - 1);
      //SettingString := Copy(AGridFormat, k + 1, Length(AGridFormat) - k);

      if TypeString = 'STANDARD' then
      begin
        Result := 1;
      end
      else
        if (TypeString = 'COLUMN') then
      begin
        Result := 2;
      end
      else
        if (TypeString = 'ROW') then
      begin
        Result := 3;
      end
      else
        raise Exception.Create('Wrong Format for View');
    end;
  end;
end;

function GetCountFromFormat(AGridFormat: string): Integer;
var
  str1, TypeString, SettingString: string;
  i, k, x, y: Integer;
  strs1: TStringList;
begin
  Result := 0;
  if AGridFormat <> '' then
  begin
    k := Pos('\', AGridFormat);
    if k > 0 then
    begin
      TypeString := Copy(AGridFormat, 1, k - 1);
      SettingString := Copy(AGridFormat, k + 1, Length(AGridFormat) - k);

      strs1 := TStringList.Create;
      try
        strs1.Text := StringReplace(SettingString, ',', #13#10, [rfReplaceAll]);
        if TypeString = 'STANDARD' then
        begin
          x := StrToInt(strs1[0]);
          y := StrToInt(strs1[1]);
          Result := x * y;
        end
        else
          if (TypeString = 'COLUMN') or (TypeString = 'ROW') then
        begin
          for i := 0 to strs1.count - 1 do
          begin
            str1 := strs1[i];
            if str1 <> '' then
              Result := Result + StrToInt(str1);
          end;
        end
        else
          raise Exception.Create('Wrong Format for View');
      finally
        strs1.Free;
      end;
    end;
  end;
end;

function GetRowOrColmn(AGridFormat: string; AIndex: Integer): Integer;
var
  str1, TypeString, SettingString: string;
  x, k: Integer;
  strs1: TStringList;
begin
  Result := 1;
  if AGridFormat <> '' then
  begin
    k := Pos('\', AGridFormat);
    if k > 0 then
    begin
      TypeString := Copy(AGridFormat, 1, k - 1);
      SettingString := Copy(AGridFormat, k + 1, Length(AGridFormat) - k);

      strs1 := TStringList.Create;
      try
        strs1.Text := StringReplace(SettingString, ',', #13#10, [rfReplaceAll]);
        if TypeString = 'STANDARD' then
        begin
          x := StrToInt(strs1[0]);
          //y := StrToInt(strs1[1]);
          Result := x;
        end
        else
          if (TypeString = 'COLUMN') or (TypeString = 'ROW') then
        begin
          if AIndex < strs1.count then
          begin
            str1 := strs1[AIndex];
            if str1 <> '' then
              Result := StrToInt(str1);
          end;
        end
        else
          raise Exception.Create('Wrong Format for View');
      finally
        strs1.Free;
      end;
    end;
  end;
end;

function GetRowOrColmnIndex(AGridFormat: string; AIndex: Integer; var aX: Integer): Integer;
var
  str1, TypeString, SettingString: string;
  i, k, x, old_k: Integer;
  strs1: TStringList;
begin
  Result := 1;
  if AGridFormat <> '' then
  begin

    k := Pos('\', AGridFormat);
    if k > 0 then
    begin
      TypeString := Copy(AGridFormat, 1, k - 1);
      SettingString := Copy(AGridFormat, k + 1, Length(AGridFormat) - k);

      strs1 := TStringList.Create;
      try
        strs1.Text := StringReplace(SettingString, ',', #13#10, [rfReplaceAll]);
        if TypeString = 'STANDARD' then
        begin
          x := StrToInt(strs1[0]);
          //y := StrToInt(strs1[1]);
          Result := AIndex div x;
          //aY := Result;
          aX := AIndex mod x;
        end
        else
          if (TypeString = 'COLUMN') or (TypeString = 'ROW') then
        begin
          k := 0;
          old_k := 0;
          for i := 0 to strs1.count - 1 do
          begin
            str1 := strs1[i];
            if str1 <> '' then
              k := k + StrToInt(str1);
            if AIndex < k then
            begin
              Result := i;

              //aY := Result;
              aX := AIndex - old_k;

              break;
            end;
            old_k := k;
          end;
        end
        else
          raise Exception.Create('Wrong Format for View');
      finally
        strs1.Free;
      end;
    end;
  end;
end;

function GetRowOrColmnCount(AGridFormat: string): Integer;
var
  TypeString, SettingString: string;
  k, y: Integer;
  strs1: TStringList;
begin
  Result := 0;
  if AGridFormat <> '' then
  begin
    k := Pos('\', AGridFormat);
    if k > 0 then
    begin
      TypeString := Copy(AGridFormat, 1, k - 1);
      SettingString := Copy(AGridFormat, k + 1, Length(AGridFormat) - k);

      strs1 := TStringList.Create;
      try
        strs1.Text := StringReplace(SettingString, ',', #13#10, [rfReplaceAll]);
        if TypeString = 'STANDARD' then
        begin
          //x := StrToInt(strs1[0]);
          y := StrToInt(strs1[1]);
          Result := y;
        end
        else
          if (TypeString = 'COLUMN') or (TypeString = 'ROW') then
        begin
          Result := strs1.count;
        end
        else
          raise Exception.Create('Wrong Format for View');
      finally
        strs1.Free;
      end;
    end;
  end;
end;

function SpritVxRect(AGridFormat: string; ARect: TvxRect; l: Integer): TvxRect;
var
  w, h: Double;
  x, y, k1, k2, m1: Integer;
begin
  m1 := GetModeFromFormat(AGridFormat);

  y := GetRowOrColmnCount(AGridFormat);

  //返回在第几行
  k1 := GetRowOrColmnIndex(AGridFormat, l, k2);

  x := GetRowOrColmn(AGridFormat, k1);
  if m1 = 2 then //column
  begin
    w := (ARect.Right - ARect.Left) / y;
    h := (ARect.Bottom - ARect.Top) / x;
    Result.Left := trunc(ARect.Left + k1 * w);
    Result.Right := trunc(ARect.Left + (k1 + 1) * w) - 1;
    Result.Top := trunc(ARect.Top + k2 * h);
    Result.Bottom := trunc(ARect.Top + (k2 + 1) * h) - 1;
  end
  else
  begin

    w := (ARect.Right - ARect.Left) / x;
    h := (ARect.Bottom - ARect.Top) / y;
    Result.Left := trunc(ARect.Left + k2 * w);
    Result.Right := trunc(ARect.Left + (k2 + 1) * w) - 1;
    Result.Top := trunc(ARect.Top + k1 * h);
    Result.Bottom := trunc(ARect.Top + (k1 + 1) * h) - 1;
  end;
end;

constructor TvxDicomView.Create(AOwner: TComponent);
begin
  inherited;
  FLabelFontName := '宋体';

  fUpdateCount := 0;
  FUseSynchronizeEvent := true;
  FReceiveTimeout := 120 * 1000;

  FPrinterIcon := TvxBitmap.Create(0, 0);
  FSelectedIcon := TvxBitmap.Create(0, 0);
  FLockIcon := Tvxbitmap.Create(0, 0);

  FPrintDicomDatasets := nil;

  CanFocused := true;
  DisableFocusEffect := true;

  FClassifyBySeriesUID := true;
  FFullScreenInSeries := false;

  fLeaderMouserInspect := ldmiNone;
  FImageOrder := dsbImageNumber;

  //Cursor := crHandPoint;
  FSynchronizationAfterMouseMove := true;

  fWHint := nil;
  FMagnifierViewShape := mvsBlurRoundRect;
  fMagnifierView := nil;
  fTextEdit := nil;

  FFullScreenSeries := nil;
  FOldSeriesBeforeFullScreen := nil;
  FOldImageIndexBeforeFullScreen := 0;

  fResized := true;

  fStudyRect := TStudyRect.Create(self);
  fStudyRect.OnFormatChange := DoStudyFormatChange;
  fDicomDatasetsList := TList.Create;

  fActiveImage := nil;
  fActiveSeries := nil;

  FMouseInImage := nil;
  FMouseInSeries := nil;

  FDragDropMode := ddmFreeView;
  FDragFrom := dfsFromImageList;
  fDisplayLabel := true;
  FDisplayRightRuler := true;
  //  fTextOverlayMode := true;
  FDisplayWLLabel := true;
  fDisplayReport := true;
  FShowPixelValueHint := false;
  FDisplayBottomRuler := true;
  FDisplayRuler := true;
  FDisplayImagePosition := true;

  fDicomPrinterTable := nil;
  fModalityTable := nil;
  fPresetTable := nil;
  //fLookuptableTable := nil;
  fLayoutTable := nil;
  fGroupTable := nil;
  fInformationLabelsTable := nil;
  fInfoProposalsTable := nil;
  fImageEnhancementTable := nil;

  FDefaultClient := nil;
  FShowThumbnails := false;
  FShowSeriesThumbnailOnly := true;
  fThumbnailStart := 0;
  fThumbnailDrag := -1;
  fThumbnailSelected := -1;
  FThumbnailsHeight := 100;
  FThumbnailsButtonHeight := 20;
  FThumbnailsRows := 1;
  FThumbnailsAlign := alBottom;
  fActiveThumbnails := 0;
  fThumbnailBitmapList := TList.Create;
  FThumbnailsScrollBar := nil;

  //fThumbnailsListBox := nil;

  //fThumbnailsButtonList := TList.Create;

  FImageSynchronization := isManualSynchronization; //isSameSeriesSynchronization;
  FScrollSynchronizationOnlySameStudy := true;
  FScrollSynchronization := issManual;

  FRefrenceLineOptions := irloNotShow;

  FStackOptions := isoImageNumber;
  FWindowsLevelingOptions := iwloLinear;

  fMouseWheelInteract := mwiScaleWheel;
  fLeftMouseInteract := miZoom;
  fRightMouseInteract := miWindow;

  fQueues := TThreadList.Create;
  //  fQueueForm := nil;

  InitingData := false;

  FDefaultUserText := '';
end;

destructor TvxDicomView.Destroy;
var
  i: Integer;
begin
  for i := 0 to fDicomDatasetsList.Count - 1 do
  begin
    TCnsDMTable(fDicomDatasetsList[i]).Free;
  end;
  fDicomDatasetsList.Clear;

  for i := 0 to fThumbnailBitmapList.Count - 1 do
  begin
    TvxBitmap(fThumbnailBitmapList[i]).Free;
  end;
  fThumbnailBitmapList.Clear;

  fDicomDatasetsList.Free;
  fStudyRect.Free;

  ClearQueue;

  FPrinterIcon.Free;
  FSelectedIcon.Free;
  FLockIcon.Free;

  //fThumbnailsButtonList.Free;
  inherited;
end;

procedure TvxDicomView.DialogKey(var Key: Word; Shift: TShiftState);
begin
  inherited;

end;

function TvxDicomView.GetViewportRect: TvxRect;
var
  ThumbnailsPanelHeight: Integer;
begin
  with Result do
  begin
    Left := 0;
    Top := 0;
    Right := Width;
    Bottom := Height;
  end;
  if FShowThumbnails then //and (fDicomDatasetsList.Count > 0) then
  begin
    ThumbnailsPanelHeight := 0;
    case FThumbnailsAlign of
      alLeft:
        begin
          Result.Left := Result.Left + FThumbnailsHeight + ThumbnailsPanelHeight;
        end;
      alTop:
        begin
          Result.Top := Result.Top + FThumbnailsHeight + ThumbnailsPanelHeight;
        end;
      alRight:
        begin
          Result.Right := Result.Right - FThumbnailsHeight - ThumbnailsPanelHeight - 1;
        end;
      alBottom:
        begin
          Result.Bottom := Result.Bottom - FThumbnailsHeight - ThumbnailsPanelHeight - 1;
        end;
    end;
  end;
end;

procedure TvxDicomView.KeyDown(var Key: Word; var KeyChar: WideChar;
  Shift: TShiftState);
var
  w1, l1: Integer;
  d1: TDicomImage;
  Attributes: TDicomAttributes;
begin
  if (fActiveImage <> nil) and (fActiveImage.DicomDataset <> nil) and (fActiveImage.DicomDataset.Attributes <> nil)
    and (fActiveImage.DicomDataset.Attributes.ImageData <> nil) then
  begin
    Attributes := fActiveImage.DicomDataset.Attributes;
    d1 := Attributes.ImageData;

    case Key of
      VK_DELETE:
        begin
          if assigned(Attributes) then
          begin
            d1.DrawObjects.RemoveSelectedDrawObject;

            DrawRect := fActiveImage.fImageRect;
            InvalidateRect(DrawRect);
          end;
          Key := 0;
        end;
      VK_ESCAPE:
        begin
          ResetImage;
          Redraw;
          Key := 0;
        end;
      190, 188:
        begin
          if (Key = 188) or (Key = 190) then
            d1.ViewerZoom := d1.ViewerZoom - 0.1
          else
            d1.ViewerZoom := d1.ViewerZoom + 0.1;

          if FImageSynchronization <> isManualSynchronization then
          begin
            if FSynchronizationAfterMouseMove then
              UpdateImageParam(fActiveImage.DicomDataset, uitZoom);

            if FImageSynchronization = isSameSeriesSynchronization then
            begin
              DrawRect := fActiveSeries.fSeriesRect;
              InvalidateRect(DrawRect);
            end
            else
              Redraw;
          end
          else
          begin

            DrawRect := fActiveImage.fImageRect;
            InvalidateRect(DrawRect);
          end;
        end;
      VK_RETURN:
        begin
          if d1.FrameCount > 1 then
          begin
            //CineActive := not CineActive;
          end;
        end;
      VK_SPACE:
        begin
          if GetCanLockImage then
          begin
            with Attributes do
            begin
              fActiveImage.LockView := not fActiveImage.LockView;
              MultiSelected4 := not MultiSelected4;

              if assigned(fOnDicomImageLock) then
                fOnDicomImageLock(self, MultiSelected4);
            end;
            Redraw(true);
          end;
        end;
      VK_NUMPAD0..VK_NUMPAD9, VK_F1..VK_F24:
        begin
          if DoSetPresetWidthLevel(Shift, Key) then
            key := 0;
        end;
      VK_PRIOR:
        begin
          fActiveSeries.PriorPage;

          //DrawRect := fActiveSeries.fSeriesRect;
          //InvalidateRect(DrawRect);

          DoActiveImageChange(fActiveimage);

          Redraw;
          Key := 0;
        end;
      VK_NEXT:
        begin
          fActiveSeries.NextPage;

          //DrawRect := fActiveSeries.fSeriesRect;
          //InvalidateRect(DrawRect);

          DoActiveImageChange(fActiveimage);
          Redraw;
          Key := 0;
        end;
      VK_HOME:
        begin
          fActiveSeries.FirstImage;

          //DrawRect := fActiveSeries.fSeriesRect;
          //InvalidateRect(DrawRect);

          DoActiveImageChange(fActiveimage);
          Redraw;
          Key := 0;
        end;
      VK_END:
        begin
          fActiveSeries.LastImage;

          //DrawRect := fActiveSeries.fSeriesRect;
          //InvalidateRect(DrawRect);

          DoActiveImageChange(fActiveimage);
          Redraw;
          Key := 0;
        end;
      VK_PRINT:
        begin
          {$IFDEF USE_BITMAP32_VIEWER}
          //if assigned(ActiveView) then
          //  ActiveView.Bitmap.AssignTo(Clipboard);
          //Key := 0;
          {$ENDIF}
        end;
      VK_DIVIDE: //Num /
        begin
          fActiveImage.DicomDataset.Attributes.ImageData.Rotate := (fActiveImage.DicomDataset.Attributes.ImageData.Rotate - 1) mod 4;
          UpdateImageParam(fActiveImage.DicomDataset, uitRotate);
          Redraw;
          Key := 0;
        end;
      VK_MULTIPLY: //Num *
        begin
          fActiveImage.DicomDataset.Attributes.ImageData.Rotate := (fActiveImage.DicomDataset.Attributes.ImageData.Rotate + 1) mod 4;
          UpdateImageParam(fActiveImage.DicomDataset, uitRotate);
          Redraw;
          Key := 0;
        end;
      VK_DECIMAL: //Num .
        begin
          {if ssCtrl in Shift then
            ShowImageBottomRuler1Click(ShowImageBottomRuler1) // ShowImageLabels
          else
            if ssAlt in Shift then
            ShowImageRightRuler1Click(ShowImageRightRuler1) // ShowImageLabels
          else
            ShowImageLabels1Click(ShowImageLabels1); // ShowImageLabels}
          Key := 0;
        end;
      VK_ADD: //flip ver   Num -
        begin
          fActiveImage.DicomDataset.Attributes.ImageData.VerFlip := not fActiveImage.DicomDataset.Attributes.ImageData.VerFlip;
          UpdateImageParam(fActiveImage.DicomDataset, uitVerFlip);
          Redraw;
          Key := 0;
        end;
      VK_SUBTRACT: //flip hiz   Num +
        begin
          fActiveImage.DicomDataset.Attributes.ImageData.HozFlip := not fActiveImage.DicomDataset.Attributes.ImageData.HozFlip;
          UpdateImageParam(fActiveImage.DicomDataset, uitHozFlip);
          Redraw;
          Key := 0;
        end;
      VK_LEFT, VK_RIGHT, VK_UP, VK_DOWN:
        begin
          if assigned(Attributes) then
          begin
            if (ssCtrl in Shift) then
            begin
              if Key = VK_LEFT then
                d1.WindowWidth := d1.WindowWidth - 1
              else
                if Key = VK_RIGHT then
                d1.WindowWidth := d1.WindowWidth + 1
              else
                if Key = VK_UP then
                d1.WindowCenter := d1.WindowCenter + 1
              else
                if Key = VK_DOWN then
                d1.WindowCenter := d1.WindowCenter - 1;

              fActiveImage.fModify := true;
              if FImageSynchronization <> isManualSynchronization then
              begin
                if FSynchronizationAfterMouseMove then
                  UpdateImageParam(fActiveImage.DicomDataset, uitWindowsWidthLevel);
                //
                if FImageSynchronization = isSameSeriesSynchronization then
                begin
                  DrawRect := fActiveSeries.fSeriesRect;
                  InvalidateRect(DrawRect);
                end
                else
                  Redraw;
              end
              else
              begin
                DrawRect := fActiveImage.fImageRect;
                InvalidateRect(DrawRect);
              end;
            end
            else
              if (ssAlt in Shift) then
            begin
              if (Key = VK_LEFT) or (Key = VK_DOWN) then
                d1.ViewerZoom := d1.ViewerZoom - 0.1
              else
                d1.ViewerZoom := d1.ViewerZoom + 0.1;

              if FImageSynchronization <> isManualSynchronization then
              begin
                if FSynchronizationAfterMouseMove then
                  UpdateImageParam(fActiveImage.DicomDataset, uitZoom);

                if FImageSynchronization = isSameSeriesSynchronization then
                begin
                  DrawRect := fActiveSeries.fSeriesRect;
                  InvalidateRect(DrawRect);
                end
                else
                  Redraw;
              end
              else
              begin

                DrawRect := fActiveImage.fImageRect;
                InvalidateRect(DrawRect);
              end;
            end
            else
              if (ssShift in Shift) then
            begin
              if Key = VK_LEFT then
                d1.OffsetX := d1.OffsetX - 1
              else
                if Key = VK_RIGHT then
                d1.OffsetX := d1.OffsetX + 1
              else
                if Key = VK_UP then
                d1.OffsetY := d1.OffsetY + 1
              else
                if Key = VK_DOWN then
                d1.OffsetY := d1.OffsetY - 1;
              if FImageSynchronization <> isManualSynchronization then
              begin
                if FSynchronizationAfterMouseMove then
                  UpdateImageParam(fActiveImage.DicomDataset, uitPan);

                if FImageSynchronization = isSameSeriesSynchronization then
                begin
                  DrawRect := fActiveSeries.fSeriesRect;
                  InvalidateRect(DrawRect);
                end
                else
                  Redraw;
              end
              else
              begin

                DrawRect := fActiveImage.fImageRect;
                InvalidateRect(DrawRect);
              end;
            end
            else
            begin
              if ClassifyBySeriesUID and (Key = VK_LEFT) then
              begin
                if fActiveSeries.SeriesIndex > 0 then
                  DoDragDicomDataset(
                    fActiveSeries, fActiveSeries.FDicomDatasets,
                    fActiveSeries.FDicomDatasets.SeriesDataset[fActiveSeries.SeriesIndex - 1].Attributes.GetString($20, $E),
                    fActiveSeries.SeriesIndex - 1, 0);
              end
              else
                if ClassifyBySeriesUID and (Key = VK_RIGHT) then
              begin
                if fActiveSeries.SeriesIndex < (fActiveSeries.FDicomDatasets.GetSeriesCount - 1) then
                  DoDragDicomDataset(fActiveSeries, fActiveSeries.FDicomDatasets,
                    fActiveSeries.FDicomDatasets.SeriesDataset[fActiveSeries.SeriesIndex + 1].Attributes.GetString($20, $E),
                    fActiveSeries.SeriesIndex + 1, 0);
              end
              else
                if Key = VK_UP then
              begin
                fActiveSeries.PriorImage;
              end
              else
                if Key = VK_DOWN then
              begin
                fActiveSeries.NextImage;
              end;

              //DrawRect := fActiveSeries.fSeriesRect;
              //InvalidateRect(DrawRect);
              DoActiveImageChange(fActiveimage);
              Redraw;
            end;
            //UpdateX;
          end;
          key := 0;
        end;
    end;
  end;
  inherited KeyDown(Key, KeyChar, Shift);
end;

procedure TvxDicomView.KeyUp(var Key: Word; var KeyChar: WideChar;
  Shift: TShiftState);
begin
  inherited;

end;

procedure TvxDicomView.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: single);
  function IsInSelectRect: Boolean;
  var
    r1: TvxRect;
  begin
    r1 := fActiveImage.fImageRect;
    r1.Right := r1.Left + 32;
    r1.Bottom := r1.Top + 32;
    Result := PointInRect(x, y, r1);
  end;
  function IsInPrintSelectRect: Boolean;
  var
    r1: TvxRect;
  begin
    r1 := fActiveImage.fImageRect;
    r1.Left := r1.Right - 32;
    r1.Bottom := r1.Top + 32;
    Result := PointInRect(x, y, r1);
  end;
  function IsInLockSelectRect: Boolean;
  var
    r1: TvxRect;
  begin
    r1 := fActiveImage.fImageRect;
    r1.Left := r1.Right - 32;
    r1.Top := r1.Bottom - 32;
    Result := PointInRect(x, y, r1);
  end;
var
  MouseInteract1: TMouseInteract;
  das1: TCnsDMTable;

  Image1: TImageRect;
  Series1: TSeriesRect;

  dm1: TDicomImage;
  o1: TDicomDrawObject;

  r1, r2: TvxRect;
  i: Integer;
begin
  BeginUpdate;

  inherited MouseDown(Button, Shift, X, Y);

  SetFocus;

  LastMousePos := vgPoint(X, Y);
  LastChangeMousePos := vgPoint(X, Y);
  DownMousePos := vgPoint(X, Y);
  MovingMousePos := vgPoint(X, Y);
  fOldThumbnailStart := fThumbnailStart;

  if ShowThumbnails and PointInRect(x, y, FThumbnailsButtonsRect) then
  begin
    for i := 0 to fDicomDatasetsList.Count - 1 do
    begin
      GetThumbnailsButtonsRect(i, r1, r2);
      if PointInRect(x, y, r1) then
      begin
        fActiveThumbnails := i;
        Redraw(true);
        break;
      end
      else
        if PointInRect(x, y, r2) then
      begin
        das1 := TCnsDMTable(fDicomDatasetsList[i]);

        RemoveDicomDataset('', das1);

        das1.Free;

        if fActiveThumbnails >= fDicomDatasetsList.Count then
          fActiveThumbnails := 0;
        Redraw(true);
        break
      end;
    end;

    if (fDicomDatasetsList.Count > 0) and (FThumbnailsScrollBar <> nil) then
    begin
      das1 := TCnsDMTable(fDicomDatasetsList[fActiveThumbnails]);
      if FShowSeriesThumbnailOnly then
      begin
        FThumbnailsScrollBar.Max := das1.GetSeriesCount;
        FThumbnailsScrollBar.Enabled := das1.GetSeriesCount > FThumbnailsIconsLength;
      end
      else
      begin
        FThumbnailsScrollBar.Max := das1.Count;
        FThumbnailsScrollBar.Enabled := das1.Count > FThumbnailsIconsLength;
      end
    end;
  end
  else
    if ShowThumbnails and PointInRect(x, y, FThumbnailsIconsRect) then
  begin
    if (fDicomDatasetsList.Count > 0) then
    begin
      das1 := TCnsDMTable(fDicomDatasetsList[fActiveThumbnails]);
      if FThumbnailsAlign in [alTop, alBottom] then
        fThumbnailDrag := fThumbnailStart + Trunc((X - FThumbnailsIconsRect.Left) / FThumbnailsHeight)
      else
        fThumbnailDrag := fThumbnailStart + Trunc((Y - FThumbnailsIconsRect.Top) / FThumbnailsHeight);

      if FShowSeriesThumbnailOnly then
      begin
        if das1.GetSeriesCount > fThumbnailDrag then
        begin
          fMouseDragging := true;
          Screen.Cursor := crDrag;
        end
        else
          fThumbnailDrag := -1;
      end
      else
      begin
        if das1.Count > fThumbnailDrag then
        begin
          fMouseDragging := true;
          Screen.Cursor := crDrag;
        end
        else
          fThumbnailDrag := -1;
      end;
      if fThumbnailDrag >= 0 then
      begin
        fThumbnailSelected := fThumbnailDrag;

        DrawRect := FThumbnailsRect;
        InvalidateRect(DrawRect);
      end;
    end;
  end
  else
  begin
    if FFullScreenSeries <> nil then
    begin
      fActiveSeries := FFullScreenSeries;
      fActiveImage := FFullScreenSeries.Items[0];
    end
    else
    begin
      Series1 := fStudyRect.GetActiveRect(X, Y);
      if Series1 <> nil then
        Image1 := Series1.GetActiveRect(X, Y)
      else
        Image1 := nil;

      if (Image1 <> fActiveImage) then //or (Series1 <> fActiveSeries) then
      begin
        if (fActiveImage <> nil) then
        begin
          fActiveImage.Focus := false;
          {if (fActiveImage.DicomDataset <> nil) then
          begin
            DrawRect := fActiveImage.fImageRect;
            InvalidateRect(DrawRect);
          end; }
        end;
        if (Image1 <> nil) then
        begin
          Image1.Focus := true;
          {if (Image1.DicomDataset <> nil) then
          begin
            DrawRect := Image1.fImageRect;
            InvalidateRect(DrawRect);
          end; }
        end;

        fActiveSeries := Series1;
        fActiveImage := Image1;

        DoActiveImageChange(fActiveImage);

        Redraw;

      end;
    end;
    if (fActiveImage <> nil) and (fActiveImage.DicomDataset <> nil) then
    begin

      //if fCanMultiSelect and assigned(Attributes) then
      if IsInSelectRect then
      begin
        if not (ssCtrl in shift) then
        begin
          with fActiveImage.DicomDataset.Attributes do
          begin
            if ImageData.FrameCount <= 1 then
              MultiSelected1 := not MultiSelected1
            else
              ImageData.ImageData[ImageData.CurrentFrame].Selected := not
                ImageData.ImageData[ImageData.CurrentFrame].Selected;
            Redraw; //(true);
          end;
          if assigned(FOnViewFlagChange) then
            FOnViewFlagChange(fActiveImage.DicomDataset.Attributes);
        end;
        exit;
      end
      else
        if IsInPrintSelectRect then
      begin
        with fActiveImage.DicomDataset.Attributes do
        begin
          if ImageData.FrameCount <= 1 then
            MultiSelected2 := not MultiSelected2
          else
            ImageData.ImageData[ImageData.CurrentFrame].Selected := not
              ImageData.ImageData[ImageData.CurrentFrame].Selected;
          Redraw; //(true);
          {if DicomDatasets is TCnsDMtable then
          begin
            if MultiSelected2 then
              TCnsDMTable(DicomDatasets).AddSelectedImage(self.AttributesIndex)
            else
              TCnsDMTable(DicomDatasets).RemoveSelectedImage(self.AttributesIndex);
          end;}
        end;
        if assigned(FOnViewFlagChange) then
          FOnViewFlagChange(fActiveImage.DicomDataset.Attributes);

        exit;
      end
      else
        if IsInLockSelectRect and GetCanLockImage then
      begin
        with fActiveImage.DicomDataset.Attributes do
        begin
          fActiveImage.LockView := not fActiveImage.LockView;
          MultiSelected4 := MultiSelected4;
          //DicomDatasets.LockCount := 1;
          if assigned(fOnDicomImageLock) then
            fOnDicomImageLock(self, MultiSelected4);
          Redraw; //(true);
        end;
        exit;
      end;

      dm1 := fActiveImage.DicomDataset.Attributes.ImageData;

      if (dm1.DrawObjects.LeaderMouserInspect <> fLeaderMouserInspect) then
      begin
        dm1.DrawObjects.LeaderMouserInspect := fLeaderMouserInspect;

        if fLeaderMouserInspect <> ldmiNone then
        begin
          dm1.OnAfterNewDrawObject := DoFinishNewDrawObject;
          dm1.OnAfterObjectSize := DoDrawObjectSize;
          dm1.OnAfterObjectMove := DoDrawObjectMove;
        end
        else
        begin
          dm1.OnAfterNewDrawObject := nil;
          dm1.OnAfterObjectSize := nil;
          dm1.OnAfterObjectMove := nil;
        end;
      end;

      o1 := dm1.DrawObjects.NewDrawObject;
      if (Button = mbLeft) and (not dm1.DrawObjects.MouseDown(Button, Shift,
        Round(X), Round(Y), dm1.CurrentFrame)) then
      begin
        if (o1 <> nil) and (dm1.DrawObjects.NewDrawObject = nil) then
        begin
          DrawRect := fActiveImage.fImageRect;
          InvalidateRect(DrawRect);
        end;
      end
      else
      begin

        fMouseDragging := true;
        fDraggingMouseButton := Button;

        MouseInteract1 := miNone;
        if fDraggingMouseButton = mbLeft then
        begin
          MouseInteract1 := fLeftMouseInteract;
        end
        else
          if fDraggingMouseButton = mbRight then
        begin
          MouseInteract1 := fRightMouseInteract;
        end
        else
          if (fDraggingMouseButton = mbMiddle) then
        begin

          exit;
        end;

        case MouseInteract1 of
          miPixelValue, miProbe:
            begin
              UpdateHint(x, y);
              //Screen.Cursor := dcmcr_HAND;
              DrawRect := fActiveImage.fImageRect;
              InvalidateRect(DrawRect);
            end;
          miWindow:
            begin
              Screen.Cursor := dcmcr_WINDOW;
            end;
          miZoom:
            begin
              Screen.Cursor := dcmcr_ZOOMPIU;
            end;
          miScroll:
            begin
              Screen.Cursor := crSizeAll;
              //Screen.Cursor := dcmcr_PENNA;
            end;
          miSelectROI, miSelect, miSelectPlot, miSelectZoom:
            begin
              fActiveImage.fInseringBox.Left := X;
              fActiveImage.fInseringBox.Top := Y;
              fActiveImage.fInseringBox.Right := 0;
              fActiveImage.fInseringBox.Bottom := 0;
            end;
          miMagnifier:
            begin
              UpdateMagnifier(x, y);
            end;
          mi3DCursor:
            begin
              Screen.Cursor := crCross;
              Do3DCursorMove(x, y);
            end;
          miNone:
            begin
              //measurement
              //case fLeaderMouserInspect of
              //end;

            end;
        end;
      end;
    end;
  end;

  EndUpdate;
end;

procedure TvxDicomView.MouseEnter;
begin
  inherited;

end;

procedure TvxDicomView.MouseLeave;
begin
  inherited;
  RemoveHint;
  if fMouseDragging then
  begin
    fMouseDragging := false;
    Screen.Cursor := crDefault;
  end;
end;

procedure TvxDicomView.UpdateImageParam(ADicomDataset: TDicomDataset; AType: TUpdateImageType);
  procedure ChangeDataset(aSrcDicomDataset, ADstDicomDataset: TDicomDataset);
  begin
    case AType of
      uitWindowsWidthLevel:
        begin
          ADstDicomDataset.Attributes.ImageData.WindowWidth := aSrcDicomDataset.Attributes.ImageData.WindowWidth;
          ADstDicomDataset.Attributes.ImageData.WindowCenter := aSrcDicomDataset.Attributes.ImageData.WindowCenter;
        end;
      uitZoom:
        begin
          ADstDicomDataset.Attributes.ImageData.ViewerZoom := aSrcDicomDataset.Attributes.ImageData.ViewerZoom;
        end;
      uitPan:
        begin
          ADstDicomDataset.Attributes.ImageData.OffsetX := aSrcDicomDataset.Attributes.ImageData.OffsetX;
          ADstDicomDataset.Attributes.ImageData.OffsetY := aSrcDicomDataset.Attributes.ImageData.OffsetY;
        end;
      uitVerFlip:
        begin
          ADstDicomDataset.Attributes.ImageData.VerFlip := aSrcDicomDataset.Attributes.ImageData.VerFlip;
        end;
      uitHozFlip:
        begin
          ADstDicomDataset.Attributes.ImageData.HozFlip := aSrcDicomDataset.Attributes.ImageData.HozFlip;
        end;
      uitRotate:
        begin
          ADstDicomDataset.Attributes.ImageData.Rotate := aSrcDicomDataset.Attributes.ImageData.Rotate;
        end;
      uitNegative:
        begin
          ADstDicomDataset.Attributes.ImageData.Negative := aSrcDicomDataset.Attributes.ImageData.Negative;
        end;
      uitReset:
        begin
          ADstDicomDataset.Attributes.ImageData.Reset;
        end;
      uitResetZoom:
        begin
          ADstDicomDataset.Attributes.ImageData.ResetZoom;
        end;
    end;
  end;
var
  i, k: Integer;
  das1: TCnsDMTable;
  da1: TDicomDataset;
begin
  if FImageSynchronization = isSameModalitySynchronization then
  begin
    for i := 0 to fDicomDatasetsList.Count - 1 do
    begin
      das1 := TCnsDMTable(fDicomDatasetsList[i]);
      for k := 0 to das1.Count - 1 do
      begin
        da1 := das1[k];
        if da1.Attributes.GetString(8, $60) = ADicomDataset.Attributes.GetString(8, $60) then
          ChangeDataset(ADicomDataset, da1);
      end;
    end;
  end
  else
    if FImageSynchronization = isSamePatientSynchronization then
  begin
    for i := 0 to fDicomDatasetsList.Count - 1 do
    begin
      das1 := TCnsDMTable(fDicomDatasetsList[i]);
      for k := 0 to das1.Count - 1 do
      begin
        da1 := das1[k];
        if da1.Attributes.GetString($10, $10) = ADicomDataset.Attributes.GetString($10, $10) then
          ChangeDataset(ADicomDataset, da1);
      end;
    end;
  end
  else
    if FImageSynchronization = isSameStudySynchronization then
  begin
    for i := 0 to fDicomDatasetsList.Count - 1 do
    begin
      das1 := TCnsDMTable(fDicomDatasetsList[i]);
      for k := 0 to das1.Count - 1 do
      begin
        da1 := das1[k];
        if da1.Attributes.GetString($20, $D) = ADicomDataset.Attributes.GetString($20, $D) then
          ChangeDataset(ADicomDataset, da1);
      end;
    end;
  end
  else
    if FImageSynchronization = isSameSeriesSynchronization then
  begin
    for i := 0 to fDicomDatasetsList.Count - 1 do
    begin
      das1 := TCnsDMTable(fDicomDatasetsList[i]);
      for k := 0 to das1.Count - 1 do
      begin
        da1 := das1[k];
        if da1.Attributes.GetString($20, $E) = ADicomDataset.Attributes.GetString($20, $E) then
          ChangeDataset(ADicomDataset, da1);
      end;
    end;
  end;
  case AType of
    uitWindowsWidthLevel:
      begin
        if assigned(FOnImageWinLevelChange) then
          FOnImageWinLevelChange(self, ADicomDataset.Attributes.ImageData.WindowWidth,
            ADicomDataset.Attributes.ImageData.WindowCenter);
      end;
    uitZoom:
      begin
        if assigned(FOnImageZoomChange) then
          FOnImageZoomChange(self, ADicomDataset.Attributes.ImageData.ViewerZoom);
      end;
    uitPan:
      begin
        if assigned(FOnImageScrollChange) then
          FOnImageScrollChange(self, ADicomDataset.Attributes.ImageData.OffsetX, ADicomDataset.Attributes.ImageData.OffsetY);
      end;
  end;
end;

procedure TvxDicomView.SelectionZoom;
var
  dx, dy: double;
  cx, cy: double;
  x1, y1: double;
  w1, h1: double;

  z, f1, BasicScale, basicX, basicY: double;
  r1: TvxRect;

  d1: TDicomImage;
begin
  r1.Left := Min(DownMousePos.X, MovingMousePos.X);
  r1.Right := Max(DownMousePos.X, MovingMousePos.X);
  r1.Top := Min(DownMousePos.Y, MovingMousePos.Y);
  r1.Bottom := Max(DownMousePos.Y, MovingMousePos.Y);

  r1 := GetSelectRect;

  dx := abs(r1.Right - r1.Left + 1);
  dy := abs(r1.Bottom - r1.Top + 1);
  if (dx < 32) or (dy < 32) then
    exit;

  if assigned(fActiveImage) and assigned(fActiveImage.DicomDataset) and
    assigned(fActiveImage.DicomDataset.Attributes.ImageData) then
  begin
    d1 := fActiveImage.DicomDataset.Attributes.ImageData;

    BasicScale := Min((fActiveImage.fImageRect.Right - fActiveImage.fImageRect.Left) / d1.Width,
      (fActiveImage.fImageRect.Bottom - fActiveImage.fImageRect.Top) / d1.Height);

    f1 := min((fActiveImage.fImageRect.Right - fActiveImage.fImageRect.Left) / dx,
      (fActiveImage.fImageRect.Bottom - fActiveImage.fImageRect.Top) / dy);

    basicX := ((fActiveImage.fImageRect.Right - fActiveImage.fImageRect.Left) - BasicScale * d1.Width) / 2;
    basicY := ((fActiveImage.fImageRect.Bottom - fActiveImage.fImageRect.Top) - BasicScale * d1.Height) / 2;

    d1.ViewerZoom := f1 / BasicScale;
    d1.OffsetX := //(r1.Left - fActiveImage.fImageRect.Left - basicX) / f1;
    -(r1.Left) * f1 - basicX - BasicScale * (1 - d1.ViewerZoom) * (d1.Width / 2);
    d1.OffsetY := //(r1.top - fActiveImage.fImageRect.Top - basicY) / f1;
    -(r1.top) * f1 - basicY - BasicScale * (1 - d1.ViewerZoom) * (d1.Height / 2);
  end;
end;

procedure TvxDicomView.SelectionRect;
var
  dx, dy: double;
  cx, cy: double;
  x1, y1: double;
  w1, h1: double;

  z, f1, BasicScale, basicX, basicY: double;
  r1: TvxRect;

  d1: TDicomImage;
begin
  r1 := GetSelectRect;

  dx := abs(r1.Right - r1.Left + 1);
  dy := abs(r1.Bottom - r1.Top + 1);
  if (dx < 32) or (dy < 32) then
    exit;

  if assigned(fActiveImage) and assigned(fActiveImage.DicomDataset) and
    assigned(fActiveImage.DicomDataset.Attributes.ImageData) then
  begin
    d1 := fActiveImage.DicomDataset.Attributes.ImageData;

    d1.DrawObjects.AddRect(ldmiSelectRect, r1.Left, r1.Top, r1.Right, r1.Bottom);

    DrawRect := fActiveImage.fImageRect;
    InvalidateRect(DrawRect);
  end;
end;

function TvxDicomView.GetSelectRect: TvxRect;
var
  d1: TDicomImage;
  r1: TvxRect;
begin
  if assigned(fActiveImage) and assigned(fActiveImage.DicomDataset) and
    assigned(fActiveImage.DicomDataset.Attributes.ImageData) then
  begin
    d1 := fActiveImage.DicomDataset.Attributes.ImageData;

    r1.Left := Min(DownMousePos.X, MovingMousePos.X);
    r1.Right := Max(DownMousePos.X, MovingMousePos.X);
    r1.Top := Min(DownMousePos.Y, MovingMousePos.Y);
    r1.Bottom := Max(DownMousePos.Y, MovingMousePos.Y);

    if r1.Left < fActiveImage.fImageRect.Left then
      r1.Left := fActiveImage.fImageRect.Left;
    if r1.Right > fActiveImage.fImageRect.Right then
      r1.Right := fActiveImage.fImageRect.Right - 1;
    if r1.Top < fActiveImage.fImageRect.Top then
      r1.Top := fActiveImage.fImageRect.Top;
    if r1.Bottom > fActiveImage.fImageRect.Bottom then
      r1.Bottom := fActiveImage.fImageRect.Bottom - 1;

    with fActiveImage.DicomDataset.Attributes.ImageData.ImageCood do
    begin
      Result.Left := XScr2Bmpf(r1.Left);
      Result.Top := YScr2Bmpf(r1.top);

      Result.Right := XScr2Bmpf(r1.Right);
      Result.Bottom := YScr2Bmpf(r1.Bottom);
    end;
  end;
end;

procedure TvxDicomView.SelectionROI;
var
  r1: TvxRect;
begin
  r1 := GetSelectRect;
  if ((r1.Left <> r1.Right) and ((r1.Left >= 0) and (r1.Right > 0))) and
    ((r1.Top <> r1.Bottom) and ((r1.Top >= 0) and (r1.Bottom > 0))) then
  begin
    fActiveImage.DicomDataset.Attributes.ImageData.ReCalMaxMin(
      Trunc(r1.Left), Trunc(r1.Top), Trunc(r1.Right), Trunc(r1.Bottom));

    //UpdateX;
  end;
end;

procedure TvxDicomView.MouseMove(Shift: TShiftState; X, Y, Dx, Dy: single);
var
  dx1, dy1: Single;
  MouseInteract1: TMouseInteract;
  d1: TDicomImage;
  das1: TCnsDMTable;
  k: Integer;

  Image1: TImageRect;
  Series1: TSeriesRect;

  modify1: Boolean;
begin
  inherited MouseMove(Shift, X, Y, Dx, Dy);
  MovingMousePos := vgPoint(X, Y);

  if not fMouseDragging then
  begin
    modify1 := false;

    Series1 := fStudyRect.GetActiveRect(X, Y);
    if Series1 <> nil then
      Image1 := Series1.GetActiveRect(X, Y)
    else
      Image1 := nil;

    if (Image1 <> FMouseInImage) then
    begin

      if (FMouseInImage <> nil) then
      begin
        {$IFDEF DICOMDEBUX1}
        //SendDebug(Format('Change Active from %d', [FMouseInImage.FImageIndex]));
        {$ENDIF}

        FMouseInImage.MouseIn := false;
        {if (FMouseInImage.DicomDataset <> nil) then
        begin
          FMouseInImage.fModify := true;
          DrawRect := FMouseInImage.fImageRect;
          InvalidateRect(DrawRect);
        end; }
      end;
      if (Image1 <> nil) then
      begin
        {$IFDEF DICOMDEBUX1}
        //SendDebug(Format('Change Active to %d', [Image1.FImageIndex]));
        {$ENDIF}

        Image1.MouseIn := true;
        {if (Image1.DicomDataset <> nil) then
        begin
          Image1.fModify := true;
          DrawRect := Image1.fImageRect;
          InvalidateRect(DrawRect);
        end; }
      end;
      Redraw;

      FMouseInSeries := Series1;
      FMouseInImage := Image1;
    end;
    if assigned(fActiveImage) and assigned(fActiveImage.DicomDataset)
      and assigned(fActiveImage.DicomDataset.Attributes.ImageData) then
    begin
      if (not fActiveImage.DicomDataset.Attributes.ImageData.DrawObjects.MouseMove(Shift,
        Round(X), Round(Y))) then
      begin
        if fActiveImage.DicomDataset.Attributes.ImageData.DrawObjects.NewDrawObject <> nil then
        begin
          DrawRect := fActiveImage.fImageRect;
          InvalidateRect(DrawRect);
          exit;
        end;
      end;

      //show hint
      if ShowPixelValueHint then
      begin
        if (x > (StudyRect.fStudyRect.Left + 5)) and (x < (StudyRect.fStudyRect.Right - 5))
          and (y > (StudyRect.fStudyRect.Top + 5)) and (y < (StudyRect.fStudyRect.Bottom - 5)) then
          UpdateHint(x, y)
        else
          RemoveHint;

        //DrawRect := fActiveImage.fImageRect;
        //InvalidateRect(DrawRect);
        Redraw(true);
      end;
    end;
  end
  else
  begin
    if ShowThumbnails and PointInRect(DownMousePos.X, DownMousePos.Y, FThumbnailsIconsRect) then
    begin
      if (fDicomDatasetsList.Count > 0) then
      begin
        Screen.Cursor := crDrag;
        if PointInRect(X, Y, FThumbnailsIconsRect) then
        begin
          Dx1 := X - DownMousePos.X;
          Dy1 := Y - DownMousePos.Y;
          das1 := TCnsDMTable(fDicomDatasetsList[fActiveThumbnails]);
          if FThumbnailsAlign in [alTop, alBottom] then
            k := trunc(Dx1 * 5 / FThumbnailsHeight)
          else
            k := trunc(Dy1 * 5 / FThumbnailsHeight);
          if abs(k) > 0 then
            if FShowSeriesThumbnailOnly then
            begin
              if das1.GetSeriesCount > FThumbnailsIconsLength then
              begin
                if (((fOldThumbnailStart - k)) >= 0) and ((fOldThumbnailStart - k) < das1.GetSeriesCount) then
                begin
                  fThumbnailStart := fOldThumbnailStart - k;
                  DrawRect := FThumbnailsRect;
                  InvalidateRect(DrawRect);

                  if FThumbnailsScrollBar <> nil then
                  begin
                    fSetScrolllbarValue := true;
                    FThumbnailsScrollBar.Value := fThumbnailStart;
                  end;
                end;
              end;
            end
            else
            begin
              if das1.Count > FThumbnailsIconsLength then
              begin
                if (((fOldThumbnailStart - k)) >= 0) and ((fOldThumbnailStart - k) < das1.Count) then
                begin
                  fThumbnailStart := fOldThumbnailStart - k;
                  DrawRect := FThumbnailsRect;
                  InvalidateRect(DrawRect);

                  if FThumbnailsScrollBar <> nil then
                  begin
                    fSetScrolllbarValue := true;
                    FThumbnailsScrollBar.Value := fThumbnailStart;
                  end;
                end;
              end;
            end;
        end;
      end;
    end
    else
      if PointInRect(DownMousePos.X, DownMousePos.Y, fActiveImage.fImageRect) and
      (fActiveImage <> nil) and (fActiveImage.DicomDataset <> nil) then
    begin
      if not PointInRect(x, y, fActiveImage.fImageRect) then
      begin
        fMouseDragging := false;
        Screen.Cursor := crArrow;
        fActiveImage.fInseringBox.Right := 0;
        fActiveImage.fInseringBox.Bottom := 0;
      end;

      d1 := fActiveImage.DicomDataset.Attributes.ImageData;

      Dx1 := X - LastMousePos.X;
      Dy1 := Y - LastMousePos.Y;

      MouseInteract1 := miNone;
      if fDraggingMouseButton = mbLeft then
      begin
        MouseInteract1 := fLeftMouseInteract;
      end
      else
        if fDraggingMouseButton = mbRight then
      begin
        MouseInteract1 := fRightMouseInteract;
      end
      else
        if (fDraggingMouseButton = mbMiddle) then
      begin

        exit;
      end;
      case MouseInteract1 of
        miPixelValue, miProbe:
          begin
            //Screen.Cursor := dcmcr_HAND;
            UpdateHint(x, y);
            DrawRect := fActiveImage.fImageRect;
            InvalidateRect(DrawRect);
          end;
        miWindow:
          begin
            Screen.Cursor := dcmcr_WINDOW;
            if QuickWindowMode or (ssAlt in Shift) then
            begin
              d1.WindowWidth := Round(d1.WindowWidth + Dx1 * d1.MouseCtrlWwWlFactor);
              d1.WindowCenter := Round(d1.WindowCenter + Dy1 * d1.MouseCtrlWwWlFactor);
            end
            else
            begin
              d1.WindowWidth := Round(d1.WindowWidth + Dx1 * d1.MouseWwWlFactor);
              d1.WindowCenter := Round(d1.WindowCenter + Dy1 * d1.MouseWwWlFactor);
            end;
            fActiveImage.fModify := true;
            if FImageSynchronization <> isManualSynchronization then
            begin
              if FSynchronizationAfterMouseMove then
                UpdateImageParam(fActiveImage.DicomDataset, uitWindowsWidthLevel);
              //
              if (DrawRect.Right = DrawRect.Left) and (FImageSynchronization = isSameSeriesSynchronization) then
              begin
                DrawRect := fActiveSeries.fSeriesRect;
                InvalidateRect(DrawRect);
              end
              else
                Redraw;
            end
            else
            begin
              DrawRect := fActiveImage.fImageRect;
              InvalidateRect(DrawRect);
            end;
          end;
        miZoom:
          begin
            if (abs(dy1) >= 1) then
            begin
              d1.ViewerZoom := d1.ViewerZoom - dy1 / 100;

              Screen.Cursor := dcmcr_ZOOMPIU;
              if (FImageSynchronization <> isManualSynchronization) then
              begin
                if FSynchronizationAfterMouseMove then
                  UpdateImageParam(fActiveImage.DicomDataset, uitZoom);

                if (DrawRect.Right = DrawRect.Left) and (FImageSynchronization = isSameSeriesSynchronization) then
                begin
                  DrawRect := fActiveSeries.fSeriesRect;
                  InvalidateRect(DrawRect);
                end
                else
                  Redraw;
              end
              else
              begin

                DrawRect := fActiveImage.fImageRect;
                InvalidateRect(DrawRect);
              end;
            end;
          end;
        miScroll:
          begin
            d1.OffsetY := d1.OffsetY + DY1;
            d1.OffsetX := d1.OffsetX + DX1;
            Screen.Cursor := crSizeAll;
            //Screen.Cursor := dcmcr_PENNA;
            if (FImageSynchronization <> isManualSynchronization) then
            begin
              if FSynchronizationAfterMouseMove then
                UpdateImageParam(fActiveImage.DicomDataset, uitPan);

              if (DrawRect.Right = DrawRect.Left) and (FImageSynchronization = isSameSeriesSynchronization) then
              begin
                DrawRect := fActiveSeries.fSeriesRect;
                InvalidateRect(DrawRect);
              end
              else
                Redraw;
            end
            else
            begin

              DrawRect := fActiveImage.fImageRect;
              InvalidateRect(DrawRect);
            end;
          end;
        miSelectROI, miSelect, miSelectPlot, miSelectZoom:
          begin
            fActiveImage.fInseringBox.Right := X;
            fActiveImage.fInseringBox.Bottom := Y;

            MovingMousePos := vgPoint(X, Y);

            DrawRect := fActiveImage.fImageRect;
            InvalidateRect(DrawRect);
          end;
        miMagnifier:
          begin
            UpdateMagnifier(x, y);
          end;
        mi3DCursor:
          begin
            Screen.Cursor := crCross;
            Do3DCursorMove(x, y);

          end;
        miNone:
          begin
            //measurement

          end;
      end;
    end;
    LastMousePos := vgPoint(X, Y);
  end;
end;

procedure TvxDicomView.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: single);
var
  MouseInteract1: TMouseInteract;
  Series1: TSeriesRect;
  Image1: TImageRect;
  das1: TCnsDMTable;

  dragSeriesUID: string;
  dragSeriesIndex, dragImageIndex: integer;
begin
  inherited MouseUp(Button, Shift, X, Y);
  if not fMouseDragging then
  begin
    if ShowThumbnails and PointInRect(X, Y, FThumbnailsButtonsRect) then
    begin
      //do change active thumbnails

    end
    else
    begin
      if (fActiveImage <> nil) and (fActiveImage.DicomDataset <> nil) and
        (fActiveImage.DicomDataset.Attributes.ImageData <> nil) then
        if not fActiveImage.DicomDataset.Attributes.ImageData.DrawObjects.MouseUp(Button, Shift,
          Round(X),
          Round(Y)) then
        begin
          if fActiveImage.DicomDataset.Attributes.ImageData.DrawObjects.NewDrawObject <> nil then
          begin
            DrawRect := fActiveImage.fImageRect;
            InvalidateRect(DrawRect);
          end;
        end;
    end;
  end
  else
  begin
    if ShowThumbnails and (fThumbnailDrag >= 0) then
    begin
      if FFullScreenSeries <> nil then
      begin
        fActiveSeries := FFullScreenSeries;
        fActiveImage := FFullScreenSeries.Items[0];

        Series1 := fActiveSeries;
        Image1 := fActiveImage;
      end
      else
      begin
        Series1 := fStudyRect.GetActiveRect(X, Y);
        if Series1 <> nil then
          Image1 := Series1.GetActiveRect(X, Y)
        else
          Image1 := nil;

        if (Image1 <> fActiveImage) then //or (Series1 <> fActiveSeries) then
        begin
          if (fActiveImage <> nil) then
          begin
            fActiveImage.Focus := false;
            {if (fActiveImage.DicomDataset <> nil) then
            begin
              DrawRect := fActiveImage.fImageRect;
              InvalidateRect(DrawRect);
            end; }
          end;
          if (Image1 <> nil) then
          begin
            Image1.Focus := true;
            {if (Image1.DicomDataset <> nil) then
            begin
              DrawRect := Image1.fImageRect;
              InvalidateRect(DrawRect);
            end; }
          end;

          fActiveSeries := Series1;
          fActiveImage := Image1;
        end;
      end;

      //drag image from thumbnail or scroll thumbnail
      if Series1 <> nil then
      begin
        das1 := TCnsDMTable(fDicomDatasetsList[fActiveThumbnails]);
        if FShowSeriesThumbnailOnly then
        begin
          if fThumbnailDrag < das1.GetSeriesCount then
          begin
            dragSeriesUID := das1.SeriesDataset[fThumbnailDrag].SeriesUID;
            dragSeriesIndex := fThumbnailDrag;
            dragImageIndex := 0;
          end;
        end
        else
        begin
          if fThumbnailDrag < das1.Count then
          begin
            dragSeriesUID := das1.Item[fThumbnailDrag].SeriesUID;
            dragSeriesIndex := das1.GetCurrentSeriesIndex(das1.Item[fThumbnailDrag]);
            dragImageIndex := fThumbnailDrag - das1.GetCurrentSeriesStart(das1.Item[fThumbnailDrag]);
          end;
        end;

        DoDragDicomDataset(Series1, das1, dragSeriesUID, dragSeriesIndex, dragImageIndex);

        DoActiveImageChange(Image1);

        Redraw;
      end;
      fThumbnailDrag := -1;
    end
    else
      if PointInRect(DownMousePos.X, DownMousePos.Y, fActiveImage.fImageRect)
      and assigned(fActiveImage) and (fActiveImage.DicomDataset <> nil) then
    begin
      MouseInteract1 := miNone;
      if fDraggingMouseButton = mbLeft then
      begin
        MouseInteract1 := fLeftMouseInteract;
      end
      else
        if fDraggingMouseButton = mbRight then
      begin
        MouseInteract1 := fRightMouseInteract;
      end
      else
        if (fDraggingMouseButton = mbMiddle) then
      begin
        if FImageSynchronization <> isManualSynchronization then
        begin
          if FSynchronizationAfterMouseMove then
          begin
            UpdateImageParam(fActiveImage.DicomDataset, uitWindowsWidthLevel);

            if FImageSynchronization = isSameSeriesSynchronization then
            begin
              DrawRect := fActiveSeries.fSeriesRect;
              InvalidateRect(DrawRect);
            end
            else
              Redraw;
          end;
          exit;
        end;
      end;
      case MouseInteract1 of
        miScroll:
          begin
            if FImageSynchronization <> isManualSynchronization then
            begin
              if not FSynchronizationAfterMouseMove then
              begin
                UpdateImageParam(fActiveImage.DicomDataset, uitPan);
                //
                if FImageSynchronization = isSameSeriesSynchronization then
                begin
                  DrawRect := fActiveSeries.fSeriesRect;
                  InvalidateRect(DrawRect);
                end
                else
                  Redraw;
              end;
            end;
          end;
        miZoom:
          begin
            if FImageSynchronization <> isManualSynchronization then
            begin
              if not FSynchronizationAfterMouseMove then
              begin
                UpdateImageParam(fActiveImage.DicomDataset, uitZoom);

                if FImageSynchronization = isSameSeriesSynchronization then
                begin
                  DrawRect := fActiveSeries.fSeriesRect;
                  InvalidateRect(DrawRect);
                end
                else
                  Redraw;
              end;
            end;
          end;
        miSelectROI:
          begin
            fActiveImage.fInseringBox.Right := 0;
            fActiveImage.fInseringBox.Bottom := 0;

            MovingMousePos := vgPoint(X, Y);

            SelectionROI;

            //d1.WindowWidth := Round(d1.WindowWidth + Dx1 * d1.MouseWwWlFactor);
            //d1.WindowCenter := Round(d1.WindowCenter + Dy1 * d1.MouseWwWlFactor);

            fActiveImage.fModify := true;
            if FImageSynchronization <> isManualSynchronization then
            begin
              if FSynchronizationAfterMouseMove then
                UpdateImageParam(fActiveImage.DicomDataset, uitWindowsWidthLevel);
              //
              if FImageSynchronization = isSameSeriesSynchronization then
              begin
                DrawRect := fActiveSeries.fSeriesRect;
                InvalidateRect(DrawRect);
              end
              else
                Redraw;
            end
            else
            begin
              DrawRect := fActiveImage.fImageRect;
              InvalidateRect(DrawRect);
            end;
          end;
        miSelect:
          begin
            fActiveImage.fInseringBox.Right := 0;
            fActiveImage.fInseringBox.Bottom := 0;
            MovingMousePos := vgPoint(X, Y);

            //insert a rect object
            SelectionRect;

            fActiveImage.fModify := true;
          end;
        miSelectZoom: // Zoom in rectangle
          begin
            fActiveImage.fInseringBox.Right := 0;
            fActiveImage.fInseringBox.Bottom := 0;
            MovingMousePos := vgPoint(X, Y);

            SelectionZoom;

            //d1.ViewerZoom := d1.ViewerZoom - dy1 / 100;
            fActiveImage.fModify := true;
            if FImageSynchronization <> isManualSynchronization then
            begin
              if FSynchronizationAfterMouseMove then
                UpdateImageParam(fActiveImage.DicomDataset, uitZoom);

              if FImageSynchronization = isSameSeriesSynchronization then
              begin
                DrawRect := fActiveSeries.fSeriesRect;
                InvalidateRect(DrawRect);
              end
              else
                Redraw;
            end
            else
            begin

              DrawRect := fActiveImage.fImageRect;
              InvalidateRect(DrawRect);
            end;
          end;
        mi3DCursor:
          begin
            Do3DCursorEnd;

          end;
        miWindow:
          begin
            if FImageSynchronization <> isManualSynchronization then
            begin
              if FSynchronizationAfterMouseMove then
                UpdateImageParam(fActiveImage.DicomDataset, uitWindowsWidthLevel);

              if FImageSynchronization = isSameSeriesSynchronization then
              begin
                DrawRect := fActiveSeries.fSeriesRect;
                InvalidateRect(DrawRect);
              end
              else
                Redraw;
            end
            else
            begin

              DrawRect := fActiveImage.fImageRect;
              InvalidateRect(DrawRect);
            end;
          end;
        miNone:
          begin
            //measurement

          end;
        miPixelValue, miProbe:
          begin
            RemoveHint;
          end;
        miMagnifier:
          begin
            RemoveMagnifier;
          end;
      end;
    end;
    fMouseDragging := false;
  end;
  Screen.Cursor := crDefault;
end;

procedure TvxDicomView.MouseWheel(Shift: TShiftState; WheelDelta: integer;
  var Handled: boolean);
var
  dy1: Single;
  k1: Integer;
  Image1: TImageRect;
  Series1: TSeriesRect;
  x, y: Integer;
begin
  case MouseWheelInteract of
    mwiScaleWheel:
      begin
        //ScreenToClient
        if FFullScreenSeries = nil then
          Series1 := fStudyRect.GetActiveRect(MovingMousePos.x, MovingMousePos.Y)
        else
          Series1 := FFullScreenSeries;
        if Series1 <> nil then
        begin
          if FFullScreenSeries = nil then
            Image1 := Series1.GetActiveRect(MovingMousePos.x, MovingMousePos.Y)
          else
            Image1 := FFullScreenSeries.Items[0];
          if (Image1 <> nil) and (Image1.DicomDataset <> nil) then
          begin
            if WheelDelta > 0 then
              dy1 := 5
            else
              dy1 := -5;

            Image1.DicomDataset.Attributes.ImageData.ViewerZoom := Image1.DicomDataset.Attributes.ImageData.ViewerZoom - dy1 / 100;

            if FImageSynchronization <> isManualSynchronization then
            begin
              if FSynchronizationAfterMouseMove then
                UpdateImageParam(fActiveImage.DicomDataset, uitZoom);

              if FImageSynchronization = isSameSeriesSynchronization then
              begin
                DrawRect := fActiveSeries.fSeriesRect;
                InvalidateRect(DrawRect);
              end
              else
                Redraw;
            end
            else
            begin

              DrawRect := fActiveImage.fImageRect;
              InvalidateRect(DrawRect);
            end;
          end;
        end;
      end;
    mwiScrollWheel:
      begin
        Handled := true;

        Series1 := nil;
        Image1 := nil;

        if FFullScreenSeries <> nil then
        begin
          fActiveSeries := FFullScreenSeries;
          fActiveImage := FFullScreenSeries.Items[0];

          Series1 := fActiveSeries;
          Image1 := fActiveImage;
        end
        else
        begin
          Series1 := fStudyRect.GetActiveRect(MovingMousePos.x, MovingMousePos.Y);
          if Series1 <> nil then
            Image1 := Series1.GetActiveRect(MovingMousePos.x, MovingMousePos.Y)
          else
            Image1 := nil;

          if (Image1 <> fActiveImage) then //or (Series1 <> fActiveSeries) then
          begin
            if (fActiveImage <> nil) then
            begin
              fActiveImage.Focus := false;
              {if (fActiveImage.DicomDataset <> nil) then
              begin
                DrawRect := fActiveImage.fImageRect;
                InvalidateRect(DrawRect);
              end; }
            end;
            if (Image1 <> nil) then
            begin
              Image1.Focus := true;
              {if (Image1.DicomDataset <> nil) then
              begin
                DrawRect := Image1.fImageRect;
                InvalidateRect(DrawRect);
              end; }
            end;

            fActiveSeries := Series1;
            fActiveImage := Image1;

          end;
        end;

        if (Series1 <> nil) and (Series1.DicomDatasets <> nil) then
        begin
          if WheelDelta < 0 then
          begin
            if Series1.SeriesUID <> '' then
              k1 := Series1.DicomDatasets.GetSeriesImageCount(Series1.SeriesUID)
            else
              k1 := Series1.DicomDatasets.Count;
            if (Series1.CurrentImageIndex + Series1.ImageCountPerPage) < k1 then
              Series1.CurrentImageIndex := Series1.CurrentImageIndex + Series1.ImageCountPerPage;
          end
          else
          begin
            {if fActiveSeries.SeriesUID <> '' then
              k1 := fActiveSeries.DicomDatasets.GetSeriesStart(fActiveSeries.SeriesUID)
            else }
            k1 := 0;
            if Series1.CurrentImageIndex > 0 then
            begin
              if (Series1.CurrentImageIndex - Series1.ImageCountPerPage) > 0 then
                Series1.CurrentImageIndex := Series1.CurrentImageIndex - Series1.ImageCountPerPage
              else
                Series1.CurrentImageIndex := 0;
            end;
          end;

          //DrawRect := Series1.fSeriesRect;
          //InvalidateRect(DrawRect);
          DoActiveImageChange(fActiveImage);

          Redraw;
        end;
      end;
  end;
end;

procedure vgZoomRect(var r_dst: TvxRect; var r_src: TvxRect; const aZoom, aBasicScale, aOffsetHorz, aOffsetVert, aBasicOffsetHorz, aBasicOffsetVert: Double);
var
  r_src1: TvxRect;
  src_width, src_height: Single;
begin
  src_width := (r_src.Right - r_src.Left) * aZoom * aBasicScale;
  src_height := (r_src.Bottom - r_src.Top) * aZoom * aBasicScale;

  //compute the dst rect
  r_src1.Left := r_dst.Left + r_src.Left + aOffsetHorz + aBasicOffsetHorz;
  r_src1.Top := r_dst.Top + r_src.Top + aOffsetVert + aBasicOffsetVert;
  r_src1.Right := r_src1.Left + src_width;
  r_src1.Bottom := r_src1.Top + src_height;

  r_dst.Left := Max(r_src1.Left, r_dst.Left);
  r_dst.Top := Max(r_src1.Top, r_dst.Top);
  r_dst.Right := Min(r_src1.Right, r_dst.Right);
  r_dst.Bottom := Min(r_src1.Bottom, r_dst.Bottom);

  //compute the source rect

  r_src.Left := (r_dst.Left - r_src1.Left) / (aZoom * aBasicScale);
  r_src.Top := (r_dst.Top - r_src1.Top) / (aZoom * aBasicScale);
  r_src.Right := (r_dst.Right - r_src1.Left) / (aZoom * aBasicScale);
  r_src.Bottom := (r_dst.Bottom - r_src1.Top) / (aZoom * aBasicScale);

  {Xc1 = max(Xa1, Xb1)
  Yc1 = max(Ya1, Yb1)
  Xc2 = min(Xa2, Xb2)
  Yc2 = min(Ya2, Yb2)

  3)Xc1 <= Xc2
  4)Yc1 <= Yc2}

end;

procedure TvxDicomView.Paint;
  function MyIntersectRect(const Rect1, Rect2: TvxRect): boolean;
  begin
    Result := (Rect1.Left < Rect2.Right) and (Rect1.Right > Rect2.Left) and (Rect1.Top < Rect2.Bottom) and (Rect1.Bottom > Rect2.Top);
  end;
var
  v1: TSeriesRect;
  v2: TImageRect;
  i, k: Integer;

  //R_dst: TvxRect;
begin

  {$IFDEF DICOMDEBUX1}
  //SendDebug(Format('(Updating=%d)Paint (%f,%f)-(%f,%f)', [fUpdateCount, DrawRect.Left, DrawRect.Top, DrawRect.Right, DrawRect.Bottom]));
  {$ENDIF}
  if fUpdateCount = 0 then //maybe ignore one more redraw
  begin
    fDrawRect := vgRect(0, 0, Width, Height);
  end;

  if FShowThumbnails and (fDicomDatasetsList.Count > 0) and
    (fResized
    or MyIntersectRect(FThumbnailsButtonsRect, DrawRect)
    or MyIntersectRect(FThumbnailsIconsRect, DrawRect)
    ) then
  begin // draw
    DrawThumbnails;
    {$IFDEF DICOMDEBUX1}
    //SendDebug('DrawThumbnails');
    {$ENDIF}
  end;

  if MyIntersectRect(StudyRect.fStudyRect, DrawRect) then
    if FFullScreenSeries <> nil then
    begin
      v2 := TImageRect(FFullScreenSeries.fImageRectList[0]);
      DrawDicomImage(v2.DicomDataset.Attributes, v2);
    end
    else
    begin
      for i := 0 to fStudyRect.fSeriesRectList.Count - 1 do
      begin
        v1 := TSeriesRect(fStudyRect.fSeriesRectList[i]);

        for k := 0 to v1.fImageRectList.Count - 1 do
        begin

          v2 := TImageRect(v1.fImageRectList[k]);
          if (v2.DicomDataset <> nil) then
          begin
            if v2.DicomDataset.Attributes.ImageData <> nil then
            begin
              if fResized or v2.fModify or v2.DicomDataset.Attributes.ImageData.Modify
                or MyIntersectRect(v2.fImageRect, DrawRect) then
              begin
                DrawDicomImage(v2.DicomDataset.Attributes, v2);
                {$IFDEF DICOMDEBUX1}
                //SendDebug(Format('DrawDicomImage(%d,%d)', [i, k]));
                {$ENDIF}
                v2.fModify := false;
                v2.DicomDataset.Attributes.ImageData.Modify := false;
              end
              else
              begin
                {$IFDEF DICOMDEBUX1}
                //SendDebug(Format('NOT DrawDicomImage(%d,%d)', [i, k]));
                {$ENDIF}
              end;
            end
            else //draw other, for example ecg,wave...
            begin

            end;
          end
          else
          begin

            Canvas.StrokeThickness := 0.5;
            Canvas.StrokeCap := vgCapFlat;
            Canvas.StrokeJoin := vgJoinMiter;
            Canvas.StrokeDash := vgDashDot;
            //Canvas.StrokeDash := vgDashSolid;
            Canvas.Stroke.Style := vgBrushSolid;
            //Canvas.StrokeDash := vgDashDash;
            Canvas.Stroke.SolidColor := $A0909090;

            Canvas.Fill.Style := vgBrushSolid;
            Canvas.Fill.SolidColor := vgColorFromVCL(clBlack);
            //Canvas.Fill.Color :=  $FF000000;
            Canvas.FillRect(v2.fImageRect, 0, 0, [], 1);

            //Canvas.Stroke.SolidColor := vgColorFromVCL(clWhite);
            //Canvas.Stroke.Style
            Canvas.DrawRect(v2.fImageRect, 0, 0, [vgCornerTopLeft, vgCornerBottomRight], 1);
          end;
        end;
      end;
    end;
  //  Canvas.EndScene;
    //
  fResized := false;
  fDrawRect := vgRect(0, 0, 0, 0);
  fUpdateCount := 0;
end;

procedure TvxDicomView.FillUnDrawRect(aR_dst, aR_draw: TvxRect; AColor: TColor);
var
  r1: TvxRect;
begin
  Canvas.Fill.Style := vgBrushSolid;
  Canvas.Fill.SolidColor := vgColorFromVCL(AColor); //$FF000000;
  //Canvas.Fill.Color :=  $FF000000;
  if aR_draw.Left > aR_dst.Left then
  begin
    r1 := aR_dst;
    r1.Right := aR_draw.Left + 2;
    Canvas.FillRect(r1, 0, 0, [], 1);
  end;
  if aR_draw.Top > aR_dst.Top then
  begin
    r1 := aR_dst;
    r1.Bottom := aR_draw.Top + 2;
    Canvas.FillRect(r1, 0, 0, [], 1);
  end;
  if aR_draw.Right < aR_dst.Right then
  begin
    r1 := aR_dst;
    r1.Left := aR_draw.Right - 2;
    Canvas.FillRect(r1, 0, 0, [], 1);
  end;
  if aR_draw.Bottom < aR_dst.Bottom then
  begin
    r1 := aR_dst;
    r1.Top := aR_draw.Bottom - 2;
    Canvas.FillRect(r1, 0, 0, [], 1);
  end;
end;

procedure TvxDicomView.DrawDicomImageIcon(AIndex: Integer; aAttributes: TDicomAttributes; ARect: TvxRect; AText: AnsiString; ASelected: Boolean);
var
  R_dst, R_src: TvxRect;
  BasicScale, Scale1: Double;
  Bitmap: TvxBitmap;
begin
  R_dst := ARect;
  if assigned(aAttributes) then
  begin
    {$IFDEF DICOMDEBUX1}
    //SendDebug(Format('DrawDicomImageIcon (Start=%d) %d', [fThumbnailStart, AIndex]));
    {$ENDIF}

    if aAttributes.Count = 0 then //not loaded
    begin
      //Dest.Brush.Color := clWhite;
      //Dest.FillRect(1, 1, ClientWidth, ClientHeight, clWhite32);

      //DrawECGLines(Dest, 0, 0, Height, Width);
    end
    else
      if assigned(aAttributes.ImageData) then
    begin
      if AIndex < fThumbnailBitmapList.Count then
      begin
        Bitmap := TvxBitmap(fThumbnailBitmapList[AIndex]);
        if Bitmap.Data <> aAttributes then
        begin
          if (Bitmap.Width <> aAttributes.ImageData.Width) or (Bitmap.Height <> aAttributes.ImageData.Height) then
          begin
            Bitmap.SetSize(aAttributes.ImageData.Width, aAttributes.ImageData.Height);
          end;
          Bitmap.Data := aAttributes;
          DCM_ImageData_vxBitmap.AssignToBitmapDefault(aAttributes.ImageData, Bitmap, false);
          {$IFDEF DICOMDEBUX1}
          // SendDebug('AssignToBitmapDefault');
          {$ENDIF}
        end;
      end
      else
      begin
        Bitmap := TvxBitmap.Create(aAttributes.ImageData.Width, aAttributes.ImageData.Height);
        Bitmap.Data := aAttributes;
        fThumbnailBitmapList.Add(Bitmap);

        DCM_ImageData_vxBitmap.AssignToBitmapDefault(aAttributes.ImageData, Bitmap, false);
        {$IFDEF DICOMDEBUX1}
        //SendDebug('AssignToBitmapDefault and create');
        {$ENDIF}
      end;

      //Bitmap := TvxBitmap.Create(aAttributes.ImageData.Width, aAttributes.ImageData.Height);
      //try
        //Bitmap.SetSize(aAttributes.ImageData.Width, aAttributes.ImageData.Height);

        //DCM_ImageData_vxBitmap.AssignToBitmapDefault(aAttributes.ImageData, Bitmap, false);

      BasicScale := Min((R_dst.Right - R_dst.Left) / Bitmap.Width, (R_dst.Bottom - R_dst.Top) / Bitmap.Height);

      Scale1 := BasicScale;

      R_Src := vgRect(0, 0, Bitmap.Width, Bitmap.Height);

      vgZoomRect(r_dst, r_src, 1, BasicScale, 0, 0,
        ((R_dst.Right - R_dst.Left) - Scale1 * Bitmap.Width) / 2,
        ((R_dst.Bottom - R_dst.Top) - Scale1 * Bitmap.Height) / 2);

      Canvas.DrawBitmap(Bitmap, R_Src, R_dst, AbsoluteOpacity, false);

      if ASelected then
      begin
        Canvas.Stroke.SolidColor := vgColorFromVCL(clWhite);
        Canvas.DrawRect(ARect, 0, 0, [vgCornerTopLeft, vgCornerBottomRight], 1);
      end;

      Canvas.Font.Family := FLabelFontName;
      vxCanvasRenderText(Canvas, ARect.Left, ARect.Top, AText, 14, clRed);
      //finally
        //Bitmap.Free;
      //end;
    end;
  end;
end;

procedure TvxDicomView.DrawDicomImage(aAttributes: TDicomAttributes; ARect: TImageRect);
var
  R_dst, R_src: TvxRect;
  BasicScale, Scale1: Double;
  Bitmap: TvxBitmap;
  Modify1: Boolean;

  R1: TvxRect;
  k: Integer;
  AUserWrite: Boolean;
begin
  R_dst := ARect.fImageRect;
  Modify1 := false;
  if assigned(aAttributes) then
  begin
    if aAttributes.Count = 0 then //not loaded
    begin
      //Dest.Brush.Color := clWhite;
      //Dest.FillRect(1, 1, ClientWidth, ClientHeight, clWhite32);

      //DrawECGLines(Dest, 0, 0, Height, Width);
    end
    else
      if assigned(aAttributes.ImageData) then
    begin
      if ARect.FBitmap = nil then
      begin
        ARect.FBitmap := TvxBitmap.Create(aAttributes.ImageData.Width, aAttributes.ImageData.Height);
        Modify1 := true;
      end;
      Bitmap := ARect.FBitmap;

      if (Bitmap.Width <> aAttributes.ImageData.Width) or (Bitmap.Height <> aAttributes.ImageData.Height) then
      begin
        Bitmap.SetSize(aAttributes.ImageData.Width, aAttributes.ImageData.Height);
        Modify1 := true;
      end;

      if aAttributes.ImageData.Modify or Modify1 or ARect.fModify then
        DCM_ImageData_vxBitmap.AssignToBitmap(aAttributes.ImageData, Bitmap, false);

      BasicScale := Min((R_dst.Right - R_dst.Left) / Bitmap.Width, (R_dst.Bottom - R_dst.Top) / Bitmap.Height);

      Scale1 := aAttributes.ImageData.ViewerZoom * BasicScale;

      R_Src := vgRect(0, 0, Bitmap.Width, Bitmap.Height);

      vgZoomRect(r_dst, r_src, aAttributes.ImageData.ViewerZoom, BasicScale,
        aAttributes.ImageData.OffsetX, aAttributes.ImageData.OffsetY,
        ((R_dst.Right - R_dst.Left) - Scale1 * Bitmap.Width) / 2,
        ((R_dst.Bottom - R_dst.Top) - Scale1 * Bitmap.Height) / 2);

      Canvas.DrawBitmap(Bitmap, R_Src, R_dst, AbsoluteOpacity, false);

      FillUnDrawRect(ARect.fImageRect, R_dst, clBlack);

      AUserWrite := false;
      if assigned(OnCustomOverlayLabel) then
        OnCustomOverlayLabel(self, Bitmap, AUserWrite);

      if (not AUserWrite) then
      begin
        if (fDragDropMode = ddmForPrint) and assigned(aAttributes) then
        begin
          {Dest.Font.Color := clBlack;
          Dest.Font.Size := -12;
          Dest.TextOut(3, 3, Attributes.GetString($10, $10));
          Dest.Font.Color := clWhite;
          Dest.Font.Size := -12;
          Dest.TextOut(4, 4, Attributes.GetString($10, $10));  }

        end;
      end;

      if (ARect.FPositionCursorPosition.X <> 0) or (ARect.FPositionCursorPosition.Y <> 0) then
      begin
        k := 40;
        DrawLineS32(Canvas, ARect.FPositionCursorPosition.X, ARect.FPositionCursorPosition.Y - k,
          ARect.FPositionCursorPosition.X, ARect.FPositionCursorPosition.Y + k, ARect.FPositionCursorColor);
        DrawLineS32(Canvas, ARect.FPositionCursorPosition.X - k, ARect.FPositionCursorPosition.Y,
          ARect.FPositionCursorPosition.X + k, ARect.FPositionCursorPosition.Y, ARect.FPositionCursorColor);
      end;

      if aAttributes.MultiSelected1 then
      begin
        R1 := ARect.fImageRect;
        r1 := vgRect(r1.Left, r1.Top, r1.Left + 32, r1.Top + 32);
        if not SelectedIcon.IsEmpty then
        begin
          Canvas.DrawBitmap(SelectedIcon, vgRect(0, 0, LockIcon.Width, LockIcon.Height),
            r1, 1);
        end
        else
        begin
          Canvas.Stroke.Style := vgBrushNone;
          Canvas.Fill.Style := vgBrushSolid;
          Canvas.Fill.SolidColor := vgColorFromVCL(clYellow);
          Canvas.FillRect(r1, 0, 0, [], 1);
        end;
      end;
      if aAttributes.ImageData.FrameCount <= 1 then
      begin
        if aAttributes.MultiSelected2 {or (FDrawPrintNoSelectIcon)} then
        begin
          R1 := ARect.fImageRect;
          r1 := vgRect(r1.Right - 32, r1.Top, r1.Right, r1.Top + 32);
          if not PrinterIcon.IsEmpty then
          begin
            Canvas.DrawBitmap(PrinterIcon, vgRect(0, 0, LockIcon.Width, LockIcon.Height),
              r1, 1);
          end
          else
          begin
            Canvas.Stroke.Style := vgBrushNone;
            Canvas.Fill.Style := vgBrushSolid;
            Canvas.Fill.SolidColor := vgColorFromVCL(clYellow);
            Canvas.FillRect(r1, 0, 0, [], 1);
          end;
        end;
      end
      else
      begin
        if aAttributes.ImageData.ImageData[aAttributes.ImageData.CurrentFrame].Selected then
        begin
          R1 := ARect.fImageRect;
          r1 := vgRect(r1.Right - 32, r1.Top, r1.Right, r1.Top + 32);
          if not PrinterIcon.IsEmpty then
          begin
            Canvas.DrawBitmap(PrinterIcon, vgRect(0, 0, LockIcon.Width, LockIcon.Height),
              r1, 1);
          end
          else
          begin
            Canvas.Stroke.Style := vgBrushNone;
            Canvas.Fill.Style := vgBrushSolid;
            Canvas.Fill.SolidColor := vgColorFromVCL(clYellow);
            Canvas.FillRect(r1, 0, 0, [], 1);
          end;
        end;
      end;
      if ARect.LockView then // aAttributes.MultiSelected4 then
      begin
        R1 := ARect.fImageRect;
        r1 := vgRect(r1.Right - 32, r1.Bottom - 32, r1.Right, r1.Bottom);
        if not LockIcon.IsEmpty then
        begin
          Canvas.DrawBitmap(LockIcon, vgRect(0, 0, LockIcon.Width, LockIcon.Height),
            r1, 1);
        end
        else
        begin
          Canvas.Stroke.Style := vgBrushNone;
          Canvas.Fill.Style := vgBrushSolid;
          Canvas.Fill.SolidColor := vgColorFromVCL(clYellow);
          Canvas.FillRect(r1, 0, 0, [], 1);
        end;
      end;

      if fDisplayLabel then
      begin
        AUserWrite := false;
        if assigned(OnOverlayLabel) then
          OnOverlayLabel(self, Canvas, AUserWrite);
        Canvas.Font.Family := FLabelFontName;
        if not AUserWrite then
        begin
          //if not TextOverlayMode then
          DCM_ImageData_vxBitmap.OverlayLabels(aAttributes.ImageData, Canvas, ARect.fImageRect, fDisplayWLLabel);
        end
        else
          DCM_ImageData_vxBitmap.DisplayCommonListForVR(aAttributes.ImageData, Canvas, ARect.fImageRect, fDisplayWLLabel);

      end;

      if FDisplayRuler then
      begin
        DCM_ImageData_vxBitmap.DrawImageScale(aAttributes.ImageData, Canvas, ARect.fImageRect, DisplayRightRuler, DisplayBottomRuler);
      end;

      if FDisplayImagePosition then
        DCM_ImageData_vxBitmap.DrawImagePosition(aAttributes.ImageData, Canvas, ARect.fImageRect);

      //if not Attributes.MultiSelected1 then
      //  Attributes.ImageData.DrawTopoLine(Dest, Scale, OffsetHorz, OffsetVert);

      //procedure UpdateCood(AXOff, AYOff: Integer; AZoom, APixelSpaceX, APixelSpaceY: Double); overload;
      //AZoom = ViewerZoom * BasicScale
      //AXOff = fOffsetX + ( ViewWidth - BasicScale * BitmapWidth *  ViewerZoom)/2
      //AYOff = fOffsetY + ( ViewHeight - BasicScale * Bitmapheight *  ViewerZoom)/2

      aAttributes.ImageData.UpdateCood(ARect.fImageRect.Left, ARect.fImageRect.Top,
        trunc(aAttributes.ImageData.OffsetX + ((ARect.fImageRect.Right - ARect.fImageRect.Left) - Scale1 * Bitmap.Width) / 2),
        trunc(aAttributes.ImageData.OffsetY + ((ARect.fImageRect.Bottom - ARect.fImageRect.Top) - Scale1 * Bitmap.Height) / 2),
        Scale1, aAttributes.ImageData.PixelSpacingX, aAttributes.ImageData.PixelSpacingY);

      if fDisplayReport then
        DCM_ImageData_vxBitmap.DrawMeasureReport(aAttributes.ImageData, Canvas, ARect.fImageRect, self.Width / 2, 0);

      DCM_ImageData_vxBitmap.DrawAll(aAttributes.ImageData.DrawObjects, Canvas, vgRect(0, 0, self.Width, self.Height), false,
        aAttributes.ImageData.CurrentFrame, 0);
    end
    else
      if assigned(aAttributes.WaveFormData) then
    begin
      //Dest.Brush.Color := clWhite;
      //Dest.FillRect(1, 1, ClientWidth, ClientHeight, clWhite32);

      //DrawECGLines(Dest, 0, 0, Height, Width);
    end
    else
    begin
      //str1 := 'This is not a dicom image';
      //Dest.Font.Size := 12;
      //Dest.Font.Color := clWhite;

      //Dest.TextOut((Dest.width - w1) div 2, (Dest.height - h1) div 2, str1);
    end;
  end;
  Canvas.StrokeThickness := 0.5;
  Canvas.StrokeCap := vgCapFlat;
  Canvas.StrokeJoin := vgJoinMiter;
  Canvas.Stroke.Style := vgBrushSolid;
  //Canvas.StrokeDash := vgDashDash;
  Canvas.Stroke.SolidColor := $A0909090;

  if (ARect.fInseringBox.Right > 0) and (ARect.fInseringBox.Bottom > 0) then
  begin
    Canvas.StrokeDash := vgDashSolid;
    Canvas.Stroke.SolidColor := $FFFFFF00;
    DrawBoxInserting(ARect);
  end;

  if ARect.MouseIn then
  begin
    Canvas.StrokeDash := vgDashSolid;
    Canvas.Stroke.SolidColor := $FFFFFF00;
    Canvas.DrawRect(ARect.fImageRect, 2, 2, [vgCornerTopLeft, vgCornerBottomRight], 1);
  end
  else
    if ARect.Focus then
  begin
    Canvas.StrokeDash := vgDashSolid;
    Canvas.Stroke.SolidColor := $FFFF0000;
    Canvas.DrawRect(ARect.fImageRect, 2, 2, [vgCornerTopLeft, vgCornerBottomRight], 1);
  end
  else
  begin
    Canvas.StrokeDash := vgDashDot; //vgDashSolid;
    Canvas.Stroke.SolidColor := vgColorFromVCL(clWhite);
    Canvas.DrawRect(ARect.fImageRect, 0, 0, [vgCornerTopLeft, vgCornerBottomRight], 1);
  end;
end;

procedure TvxDicomView.SetLeftMouseInteract(const Value: TMouseInteract);
begin
  FLeftMouseInteract := Value;
end;

procedure TvxDicomView.SetMouseWheelInteract(
  const Value: TMouseWheelInteract);
begin
  FMouseWheelInteract := Value;
end;

procedure TvxDicomView.SetOn3DCursorEnd(const Value: TNotifyEvent);
begin
  FOn3DCursorEnd := Value;
end;

procedure TvxDicomView.SetOn3DCursorMove(const Value: TOn3DCursorEvent);
begin
  FOn3DCursorMove := Value;
end;

procedure TvxDicomView.SetOnCustomDrawObjectPopupMenuPopup(
  const Value: TNotifyEvent);
begin
  FOnCustomDrawObjectPopupMenuPopup := Value;
end;

procedure TvxDicomView.SetOnCustomOverlayLabel(
  const Value: TOnOverlayLabelEvent);
begin
  FOnCustomOverlayLabel := Value;
end;

procedure TvxDicomView.SetOnDragDropToPrint(
  const Value: TOnDragDropToPrintEvent);
begin
  FOnDragDropToPrint := Value;
end;

procedure TvxDicomView.SetRightMouseInteract(const Value: TMouseInteract);
begin
  FRightMouseInteract := Value;
end;

function TvxDicomView.GetData: Variant;
begin
  Result := '';
end;

procedure TvxDicomView.SetData(const Value: Variant);
begin
  inherited;

end;

procedure TvxDicomView.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  i: integer;
  das: TCnsDMTable;
begin
  inherited Notification(AComponent, operation);
  if Operation = opRemove then
  begin
    for i := 0 to fDicomDatasetsList.Count - 1 do
    begin
      if fDicomDatasetsList[i] = AComponent then
      begin
        das := TCnsDMTable(fDicomDatasetsList[i]);

        CloseIfInLoading(das);
        //reset viewer
        fStudyRect.RemoveDatasets(das);

        if das.Data1 <> nil then
        begin

        end;

        fDicomDatasetsList.Delete(i);

        break;
      end;
    end;
  end;
end;

procedure TvxDicomView.MatrixChanged(Sender: TObject);
begin
  inherited;
  if (StudyRect.fStudyRect.Right <> Width) or (StudyRect.fStudyRect.Bottom <> Height) then
  begin

    if FFullScreenSeries <> nil then
      FFullScreenSeries.SetBound(GetViewportRect);

    StudyRect.SetBound(GetViewportRect);

    GetThumbnailsRect;

  end;
  fResized := true;
end;

procedure TvxDicomView.SetDragDropMode(const Value: TDragDropMode);
begin
  FDragDropMode := Value;
end;

procedure TvxDicomView.SetDragFrom(const Value: TDragFromSource);
begin
  FDragFrom := Value;
end;

procedure TvxDicomView.SetDisplayBottomRuler(const Value: Boolean);
begin
  FDisplayBottomRuler := Value;
end;

procedure TvxDicomView.SetDisplayLabel(const Value: Boolean);
begin
  fDisplayLabel := Value;
end;

procedure TvxDicomView.SetDisplayReport(const Value: Boolean);
begin
  fDisplayReport := Value;
end;

procedure TvxDicomView.SetDisplayRightRuler(const Value: Boolean);
begin
  FDisplayRightRuler := Value;
end;

procedure TvxDicomView.SetDisplayRuler(const Value: Boolean);
begin
  FDisplayRuler := Value;
end;

procedure TvxDicomView.SetDisplayWLLabel(const Value: Boolean);
begin
  FDisplayWLLabel := Value;
end;

procedure TvxDicomView.SetShowPixelValueHint(const Value: Boolean);
begin
  FShowPixelValueHint := Value;
  if not Value then
    RemoveHint;
end;

procedure TvxDicomView.SetDisplayImagePosition(const Value: Boolean);
begin
  FDisplayImagePosition := Value;
end;

procedure TvxDicomView.DoAfterLoad(Sender: TObject);
var
  n1: TImageRect;
  str1: string;
  das1: TCnsDMTable;
  da1: TDicomDataset;
begin

  da1 := TDicomDataset(Sender);

  StudyRect.ChangeDatasets(nil);

  ApplyModalitySetting(da1);

  str1 := da1.Attributes.GetString($20, $D);

  das1 := FindDicomDataset(str1);

  n1 := StudyRect.FindImageRect(da1);

  if FThumbnailsScrollBar <> nil then
  begin
    if FShowSeriesThumbnailOnly then
    begin
      FThumbnailsScrollBar.Value := 0;
      FThumbnailsScrollBar.Max := das1.GetSeriesCount;
      FThumbnailsScrollBar.Enabled := das1.GetSeriesCount > FThumbnailsIconsLength;
    end
    else
    begin
      FThumbnailsScrollBar.Value := 0;
      FThumbnailsScrollBar.Max := das1.Count;
      FThumbnailsScrollBar.Enabled := das1.Count > FThumbnailsIconsLength;
    end
  end;

  if n1 <> nil then
  begin

    if das1.Count = 1 then
    begin
      //change layout
      str1 := da1.Attributes.GetString($8, $60);
      try
        LayoutChange('DX_' + str1);
      except
      end;
    end;

    DrawRect := n1.fImageRect;
    InvalidateRect(DrawRect);
  end
  else
  begin
    DrawRect := FThumbnailsRect;
    InvalidateRect(DrawRect);
  end;

  Application.ProcessMessages;
end;

procedure TvxDicomView.DoLoadFrame(Sender: TObject);
begin

end;

procedure TvxDicomView.DoLoadFrameFinish(Sender: TObject);
begin

end;

procedure TvxDicomView.DoAddDataset(Sender: TObject;
  ADataset: TDicomDataset);
begin
  //Redraw;
end;

procedure TvxDicomView.LayoutChange(ACaption: string);
var
  f1: TBlobField;
  das1: TDicomDataset;
  stm1: TMemoryStream;
begin
  if (LayoutTable <> nil) and LayoutTable.Locate('NAME', acaption, []) then
  begin
    das1 := TDicomDataset.Create;
    try
      f1 := TBlobField(LayoutTable.FieldByName('LAYOUTDATA'));
      if not f1.IsNull then
      begin
        stm1 := TMemoryStream.Create;
        try
          f1.SaveToStream(stm1);
          stm1.Position := 0;
          das1.LoadFromStream(stm1);

          LoadLayoutFrom(das1.Attributes);

        finally
          stm1.Free;
        end;
      end;
    finally
      das1.Free;
    end;
  end;
end;

procedure TvxDicomView.ThreadLoadImageFromDicomDIR(n1: TNetworkQueueItem;
  AStudyUID: string; DicomdirImagesTable: TDataset; ImagePath: string);
var
  CnsDicomConnection1: TCnsDicomConnectionThread;
  das1: TcnsDMTable;
  l1: TList;
begin
  if AStudyUID = '' then
    exit;

  DicomdirImagesTable.Filter := 'STUDYUID=''' + AStudyUID + '''';
  DicomdirImagesTable.Filtered := true;

  n1.ImageCount := DicomdirImagesTable.RecordCount;
  //n1.ClientForm := self;
  n1.StartTime := now;
  //f1.WindowState := wsMinimized;
  das1 := FindDicomDataset(AStudyUID);
  if das1.PName = '' then
    das1.PName := n1.PatientCName;
  n1.Datasets := das1;

  //n1.TabData := AddDatasets(das1, n1.PatientName, AStudyUID, false);
  //  UpdateClientView('CR');
  //RefreshMenu;

  CnsDicomConnection1 := TCnsDicomConnectionThread.Create(fLoadStyle);

  //CnsDicomConnection1.Host := fHost;
  //CnsDicomConnection1.Port := fPort;
  CnsDicomConnection1.CallingTitle := 'CNSPACS';
  CnsDicomConnection1.CalledTitle := 'CNSCLIENT';
  //CnsDicomConnection1.CalledTitle := fCalledAE;
  //CnsDicomConnection1.CallingTitle := fCallingAE;
  CnsDicomConnection1.ReceiveTimeout := FReceiveTimeout; //120 * 1000;
  CnsDicomConnection1.UseSynchronizeEvent := FUseSynchronizeEvent;
  // add to queue

  n1.Direction := nqdGetImage;
  RefreshQueue;

  //if NetworkQueue1.Checked then
  //  NetworkQueueForm.Show;

  CnsDicomConnection1.Parent := n1;

  CnsDicomConnection1.CurrentDatasets := das1;
  {$IFNDEF USESYNCHRONIZE}
  //CnsDicomConnection1.FormHandle := Handle;
  {$ENDIF}

  l1 := fQueues.LockList;
  try
    CnsDicomConnection1.QueueIndex := l1.IndexOf(n1);
  finally
    fQueues.UnlockList;
  end;

  CnsDicomConnection1.OnReceive := DoNewImage;
  CnsDicomConnection1.OnError := aftererror;
  CnsDicomConnection1.OnTerminate := afterFinish;
  CnsDicomConnection1.OnWorkStart := DoStartImage;
  CnsDicomConnection1.FreeOnTerminate := true;
  n1.MyThread := CnsDicomConnection1;

  //CnsDicomConnection1.CGetImage('STUDY', AStudyUID, AOnlyLoadKeyImage);
  CnsDicomConnection1.LoadFromDicomDIR(ImagePath, DicomdirImagesTable);

end;

procedure TvxDicomView.ThreadMGetImage(AHost: string; APort: Integer;
  n1: TNetworkQueueItem; AStudyUID: string; ALock,
  AOnlyLoadKeyImage: Boolean; APaperStudyUID: string);
var
  CnsDicomConnection1: TCnsDicomConnectionThread;
  das1: TCnsDMTable;
  l1: TList;
begin
  if AStudyUID = '' then
    exit;
  if (not AOnlyLoadKeyImage) and IfMustLoadBySeriesUID(AStudyUID) then
  begin
    n1.Status := nqsSelectSeries;
    RefreshQueue;

    SelectMultiSeriesUID(AHost, APort, AStudyUID, n1, ALock, AOnlyLoadKeyImage);
  end
  else
  begin

    //n1.ClientForm := self;
    n1.StartTime := now;
    //f1.WindowState := wsMinimized;
    das1 := FindDicomDataset(AStudyUID);
    das1.PName := n1.PatientName;
    if das1.PName = '' then
      das1.PName := n1.PatientCName;

    das1.FetchCount := n1.ImageCount;

    n1.Datasets := das1;

    if APaperStudyUID <> '' then
    begin
      LoadPaper(AHost, APort, das1, APaperStudyUID, AStudyUID);
      {$IFDEF DICOMDEBUX1}
      SendDebug(Format('LoadPaper %s => %s', [APaperStudyUID, AStudyUID]));
      {$ENDIF}
    end;

    //n1.TabData := AddDatasets(das1, n1.PatientName, AStudyUID, ALock);
    //  UpdateClientView('CR');
    //RefreshMenu;

    n1.Status := nqsSendingRequest;

    CnsDicomConnection1 := TCnsDicomConnectionThread.Create(fLoadStyle);

    CnsDicomConnection1.Host := AHost;
    CnsDicomConnection1.Port := APort;
    CnsDicomConnection1.CallingTitle := 'CNSPACS';
    CnsDicomConnection1.CalledTitle := 'CNSCLIENT';
    //CnsDicomConnection1.CalledTitle := fCalledAE;
    //CnsDicomConnection1.CallingTitle := fCallingAE;
    CnsDicomConnection1.ReceiveTimeout := FReceiveTimeout; //60 * 1000;
    CnsDicomConnection1.UseSynchronizeEvent := FUseSynchronizeEvent;
    // add to queue

    n1.Direction := nqdGetImage;
    RefreshQueue;
    //NetworkQueueForm.Update;
    //if NetworkQueue1.Checked then
    //  NetworkQueueForm.Show;

    CnsDicomConnection1.Parent := n1;

    CnsDicomConnection1.CurrentDatasets := das1;
    {$IFNDEF USESYNCHRONIZE}
    //CnsDicomConnection1.FormHandle := Handle;
    {$ENDIF}
    //CnsDicomConnection1.QueueIndex := fQueues.IndexOf(n1);

    l1 := fQueues.LockList;
    try
      CnsDicomConnection1.QueueIndex := l1.IndexOf(n1);
    finally
      fQueues.UnlockList;
    end;

    CnsDicomConnection1.OnIconReceive := DoIconImageReceive;
    CnsDicomConnection1.OnReceive := DoNewImage;
    CnsDicomConnection1.OnError := aftererror;
    CnsDicomConnection1.OnTerminate := afterFinish;
    CnsDicomConnection1.OnWorkStart := DoStartImage;
    CnsDicomConnection1.FreeOnTerminate := true;
    n1.MyThread := CnsDicomConnection1;
    CnsDicomConnection1.MGetImage('STUDY', AStudyUID, AOnlyLoadKeyImage);
  end;
end;

procedure TvxDicomView.ThreadWADOImage(AHost: string; APort: Integer;
  n1: TNetworkQueueItem; AStartURL, AStudyUID, ATranferSyntax,
  ALevel: string; ALock, AOnlyLoadKeyImage: Boolean;
  APaperStudyUID: string);
  function GetWADOImageDataset(AStudyUID: string): TDicomDataset;
  var
    stm1: TMemoryStream;
    das1: TDicomDataset;
    str1: string;
  begin
    Result := nil;

    stm1 := TMemoryStream.Create;
    try
      str1 := 'contentType=application%2Fdicom';
      if ALevel = 'SERIES' then
        str1 := str1 + '&SERIESUID=' + AStudyUID
      else
        str1 := str1 + '&STUDYUID=' + AStudyUID;
      //WadoChannelStudyTable.fieldByName('STUDYUID').AsString;
      str1 := AStartURL + '/IMAGES?' + str1;
      //str1 := 'STUDYUID=' + AStudyUID;
      //str1 := DBGrid15.DataSource.DataSet.fieldByName('STARTURL').AsString + '/IMAGES?' + str1;

      //ShowMessage(str1);

      DoHttpGet(nil, str1, stm1);

      if stm1.Size > 0 then
      begin
        das1 := TDicomDataset.Create;
        das1.LoadFromStream(stm1);
        Result := das1;
      end;
      //ShowMessage(IntToStr( stm1.Size));
    finally
      stm1.Free;
    end;

  end;
var
  CnsDicomConnection1: TCnsDicomConnectionThread;
  das2: TDicomDataset;
  das1: TCnsDMTable;
  da1: TDicomAttribute;
  l1: TList;
begin
  if AStudyUID = '' then
    exit;
  das2 := GetWADOImageDataset(AStudyUID);
  if (das2 = nil) or (das2.Attributes = nil) then
    exit;

  da1 := das2.Attributes.Item[$2809, $2B];
  if (da1 <> nil) and (da1.GetCount > 0) then
  begin
    das1 := FindDicomDataset(AStudyUID);
    das1.PName := n1.PatientName;
    if das1.PName = '' then
      das1.PName := n1.PatientCName;
    n1.Datasets := das1;

    //n1.TabData := AddDatasets(das1, n1.PatientName, AStudyUID, ALock);
    //    UpdateClientView('CR');
    //RefreshMenu;

    CnsDicomConnection1 := TCnsDicomConnectionThread.Create(fLoadStyle);
    CnsDicomConnection1.CallingTitle := 'CNSPACS';
    CnsDicomConnection1.CalledTitle := 'CNSCLIENT';
    CnsDicomConnection1.UseSynchronizeEvent := FUseSynchronizeEvent;

    // add to queue
    //n1.ClientForm := self;
    n1.ImageCount := da1.GetCount;

    n1.Direction := nqdGetImage;
    RefreshQueue;
    //NetworkQueueForm.Update;
    //if NetworkQueue1.Checked then
    //  NetworkQueueForm.Show;

    CnsDicomConnection1.Parent := n1;

    CnsDicomConnection1.CurrentDatasets := das1;
    {$IFNDEF USESYNCHRONIZE}
    //CnsDicomConnection1.FormHandle := Handle;
    {$ENDIF}
    //CnsDicomConnection1.QueueIndex := fQueues.IndexOf(n1);
    l1 := fQueues.LockList;
    try
      CnsDicomConnection1.QueueIndex := l1.IndexOf(n1);
    finally
      fQueues.UnlockList;
    end;

    CnsDicomConnection1.OnHttpGet := DoHttpGet;

    CnsDicomConnection1.OnReceive := DoNewImage;
    CnsDicomConnection1.OnError := aftererror;
    CnsDicomConnection1.OnTerminate := afterFinish;
    CnsDicomConnection1.OnWorkStart := DoStartImage;
    CnsDicomConnection1.FreeOnTerminate := true;
    n1.MyThread := CnsDicomConnection1;
    //1.2.840.10008.1.2.4.70
    CnsDicomConnection1.WadoImages(AStartURL, ATranferSyntax, das2, AOnlyLoadKeyImage); //''
  end
  else
  begin
    raise Exception.Create('no image');
  end;
end;

procedure TvxDicomView.LoadFromFile(AFileName: string);
var
  das1: TcnsDMTable;
  das: TDicomDataset;
begin
  das := TDicomDataset.Create;
  das.LoadFromFile(AFileName);

  das1 := FindDicomDataset(das.StudyUID);
  das1.Add(das);
end;

procedure TvxDicomView.ThreadGetImage(AHost: string; APort: Integer;
  n1: TNetworkQueueItem; AStudyUID: string; ALock,
  AOnlyLoadKeyImage: Boolean; APaperStudyUID: string);
var
  CnsDicomConnection1: TCnsDicomConnectionThread;
  das1: TcnsDMTable;
  l1: TList;
begin
  if AStudyUID = '' then
    exit;
  //n1.ClientForm := self;
  n1.StartTime := now;
  //f1.WindowState := wsMinimized;
  das1 := FindDicomDataset(AStudyUID);
  das1.PName := n1.PatientName;
  if das1.PName = '' then
    das1.PName := n1.PatientCName;
  n1.Datasets := das1;

  //n1.TabData := AddDatasets(das1, n1.PatientName, AStudyUID, ALock);
  //  UpdateClientView('CR');
  //RefreshMenu;

  CnsDicomConnection1 := TCnsDicomConnectionThread.Create(fLoadStyle);

  CnsDicomConnection1.Host := AHost;
  CnsDicomConnection1.Port := APort;
  CnsDicomConnection1.CallingTitle := 'CNSPACS';
  CnsDicomConnection1.CalledTitle := 'CNSCLIENT';
  //CnsDicomConnection1.CalledTitle := fCalledAE;
  //CnsDicomConnection1.CallingTitle := fCallingAE;
  CnsDicomConnection1.ReceiveTimeout := FReceiveTimeout; //120 * 1000;
  CnsDicomConnection1.UseSynchronizeEvent := FUseSynchronizeEvent;

  // add to queue

  n1.Direction := nqdGetImage;
  RefreshQueue;

  //if NetworkQueue1.Checked then
  //  NetworkQueueForm.Show;

  CnsDicomConnection1.Parent := n1;

  CnsDicomConnection1.CurrentDatasets := das1;
  {$IFNDEF USESYNCHRONIZE}
  //CnsDicomConnection1.FormHandle := Handle;
  {$ENDIF}
  //CnsDicomConnection1.QueueIndex := fQueues.IndexOf(n1);
  l1 := fQueues.LockList;
  try
    CnsDicomConnection1.QueueIndex := l1.IndexOf(n1);
  finally
    fQueues.UnlockList;
  end;

  CnsDicomConnection1.OnReceive := DoNewImage;
  CnsDicomConnection1.OnError := aftererror;
  CnsDicomConnection1.OnTerminate := afterFinish;
  CnsDicomConnection1.OnWorkStart := DoStartImage;
  CnsDicomConnection1.FreeOnTerminate := true;
  n1.MyThread := CnsDicomConnection1;

  CnsDicomConnection1.CGetImage('STUDY', AStudyUID, AOnlyLoadKeyImage);
end;

function TvxDicomView.IfMustLoadBySeriesUID(AStudyUID: string): Boolean;
var
  d1: TCnsDBTable;
  s1: string;
begin
  Result := false;
  if (CurrentProfileName = 'IGORE') then
  begin

    Result := false;
  end
  else
    if (CurrentProfileName <> '') and (GroupTable <> nil) then
  begin

    if GroupTable.Locate('NAME', CurrentProfileName, []) then
    begin //SELECT_SERIES
      Result := GroupTable.fieldByName('SELECT_SERIES').AsString = 'T';
    end;
    (*  end
      else
      begin

        d1 := CreateDBTable; //TCnsDBTable.Create(self);
        try
          {d1.AppSrvClient := DefaultClient;
          if DicomPrinterTable.TableLoadMode = cnsLoadFromWadoPostEx then
          begin
            d1.TableLoadMode := cnsLoadFromWadoPostEx;
            d1.OnHttpPost := DoHttpPost;
          end;}
          d1.ObjectName := 'STUDIES';
          d1.WhereSQL := 'STUDYUID=''' + AStudyUID + '''';
          //d1.Database := 'PACS';
          //d1.SQL := 'SELECT * from STUDIES WHERE STUDYUID=''' + AStudyUID + '''';

          d1.RefreshTable;
          if d1.RecordCount > 0 then
          begin
            s1 := d1.fieldByName('STUDIES_IMAGE_TYPE').AsString;

            if (ModalityTable <> nil) and ModalityTable.Locate('Modality', s1, []) then
            begin
              Result := ModalityTable.fieldByName('SELECT_SERIES').AsString = 'T';
            end;
          end;
        finally
          d1.Free;
        end;*)
  end;
end;

procedure TvxDicomView.SelectMultiSeriesUID(AHost: string; APort: Integer;
  AStudyUID: string; n1: TNetworkQueueItem; ALock,
  AOnlyLoadKeyImage: Boolean);
var
  a1, a2: TStringList;
  d1, d2: TCnsDBTable;
  //  f1: TSelectSeriesForm;
  CnsDicomConnection1: TCnsDicomConnectionThread;
  das1: TCnsDMTable;
  //  i: integer;
  l1: TList;
begin
  d1 := CreateDBTable; //TCnsDBTable.Create(self);
  a1 := TStringList.Create;
  a2 := TStringList.Create;
  try
    {d1.AppSrvClient := DefaultClient;
    if DicomPrinterTable.TableLoadMode = cnsLoadFromWadoPostEx then
    begin
      d1.TableLoadMode := cnsLoadFromWadoPostEx;
      d1.OnHttpPost := DoHttpPost;
    end;}
    d1.ObjectName := 'SERIES';
    d1.WhereSQL := 'STUDYUID=''' + AStudyUID + '''';
    d1.RefreshTable;
    d1.SortOn('SeriesNumber', []);

    if d1.RecordCount > 0 then
    begin
      d1.First;
      d2 := CreateDBTable; //TCnsDBTable.Create(self);
      //d2.AppSrvClient := DefaultClient;
      d2.Database := 'PACS';
      while not d1.Eof do
      begin
        if d1.FieldByName('SERIES_IMAGE_COUNT').AsInteger <= 1 then
        begin
          d2.SQL := 'SELECT Count(*) from IMAGES where ' +
            '(STUDYUID=''' + AStudyUID + ''') AND ' +
            '(SERIESUID=''' + d1.fieldByName('SERIESUID').AsString + ''')';
          d2.RefreshTable;
          d1.Edit;
          d1.FieldByName('SERIES_IMAGE_COUNT').AsInteger := d2.Fields[0].AsInteger;
          d1.Post;
        end;
        d1.Next;
      end;
      d1.ApplyUpdates;
      if d1.RecordCount > 0 then
        if assigned(fOnSelectMultiSeries) then
        begin
          fOnSelectMultiSeries(self, d1, a2, a1);
        end;
      {f1 := TSelectSeriesForm.Create(nil);
      try
        f1.DataSource1.DataSet := d1;
        if f1.ShowModal = mrok then
        begin
          setlength(a1, f1.DBGridEh1.SelectedRows.Count);
          setlength(a2, f1.DBGridEh1.SelectedRows.Count);
          for i := 0 to f1.DBGridEh1.SelectedRows.Count - 1 do
          begin
            d1.Bookmark := f1.DBGridEh1.SelectedRows[I];
            a1[i] := d1.FieldByName('SERIESUID').AsString;
            a2[i] := d1.FieldByName('STUDYUID').AsString;
          end;
        end;
      finally
        f1.Free;
      end; }

    end;
    if a1.Count > 0 then
    begin
      //n1.ClientForm := self;
      n1.StartTime := now;
      //f1.WindowState := wsMinimized;
      das1 := FindDicomDataset(AStudyUID);
      das1.PName := n1.PatientName;
      if das1.PName = '' then
        das1.PName := n1.PatientCName;
      n1.Datasets := das1;

      //n1.TabData := AddDatasets(das1, n1.PatientName, AStudyUID, ALock);
      //  UpdateClientView('CR');
      //RefreshMenu;

      CnsDicomConnection1 := TCnsDicomConnectionThread.Create(fLoadStyle);

      CnsDicomConnection1.Host := AHost;
      CnsDicomConnection1.Port := APort;
      CnsDicomConnection1.CallingTitle := 'CNSPACS';
      CnsDicomConnection1.CalledTitle := 'CNSCLIENT';
      //CnsDicomConnection1.CalledTitle := fCalledAE;
      //CnsDicomConnection1.CallingTitle := fCallingAE;
      CnsDicomConnection1.ReceiveTimeout := FReceiveTimeout; //60 * 1000;
      CnsDicomConnection1.UseSynchronizeEvent := FUseSynchronizeEvent;

      // add to queue

      n1.Direction := nqdGetImage;
      RefreshQueue;
      //if NetworkQueue1.Checked then
      //  NetworkQueueForm.Show;

      CnsDicomConnection1.Parent := n1;

      CnsDicomConnection1.CurrentDatasets := das1;
      {$IFNDEF USESYNCHRONIZE}
      //CnsDicomConnection1.FormHandle := Handle;
      {$ENDIF}
      //CnsDicomConnection1.QueueIndex := fQueues.IndexOf(n1);
      l1 := fQueues.LockList;
      try
        CnsDicomConnection1.QueueIndex := l1.IndexOf(n1);
      finally
        fQueues.UnlockList;
      end;

      CnsDicomConnection1.OnIconReceive := DoIconImageReceive;
      CnsDicomConnection1.OnReceive := DoNewImage;
      CnsDicomConnection1.OnError := aftererror;
      CnsDicomConnection1.OnTerminate := afterFinish;
      CnsDicomConnection1.OnWorkStart := DoStartImage;
      CnsDicomConnection1.FreeOnTerminate := true;
      n1.MyThread := CnsDicomConnection1;

      CnsDicomConnection1.MGetImage('SERIES', a1, a2, AOnlyLoadKeyImage);
    end
    else
    begin
      //n1.ClientForm := self;
      n1.StartTime := now;
      //f1.WindowState := wsMinimized;
      das1 := FindDicomDataset(AStudyUID);
      das1.PName := n1.PatientName;
      if das1.PName = '' then
        das1.PName := n1.PatientCName;
      n1.Datasets := das1;

      //n1.TabData := AddDatasets(das1, n1.PatientName, AStudyUID, ALock);
      //  UpdateClientView('CR');
      //RefreshMenu;

      CnsDicomConnection1 := TCnsDicomConnectionThread.Create(fLoadStyle);

      CnsDicomConnection1.Host := AHost;
      CnsDicomConnection1.Port := APort;
      CnsDicomConnection1.CallingTitle := 'CNSPACS';
      CnsDicomConnection1.CalledTitle := 'CNSCLIENT';
      //CnsDicomConnection1.CalledTitle := fCalledAE;
      //CnsDicomConnection1.CallingTitle := fCallingAE;
      CnsDicomConnection1.ReceiveTimeout := FReceiveTimeout; //60 * 1000;
      CnsDicomConnection1.UseSynchronizeEvent := FUseSynchronizeEvent;

      // add to queue

      n1.Direction := nqdGetImage;
      RefreshQueue;
      //NetworkQueueForm.Update;
      //if NetworkQueue1.Checked then
      //  NetworkQueueForm.Show;

      CnsDicomConnection1.Parent := n1;

      CnsDicomConnection1.CurrentDatasets := das1;
      {$IFNDEF USESYNCHRONIZE}
      //CnsDicomConnection1.FormHandle := Handle;
      {$ENDIF}
      //CnsDicomConnection1.QueueIndex := fQueues.IndexOf(n1);
      l1 := fQueues.LockList;
      try
        CnsDicomConnection1.QueueIndex := l1.IndexOf(n1);
      finally
        fQueues.UnlockList;
      end;

      CnsDicomConnection1.OnIconReceive := DoIconImageReceive;
      CnsDicomConnection1.OnReceive := DoNewImage;
      CnsDicomConnection1.OnError := aftererror;
      CnsDicomConnection1.OnTerminate := afterFinish;
      CnsDicomConnection1.OnWorkStart := DoStartImage;
      CnsDicomConnection1.FreeOnTerminate := true;
      n1.MyThread := CnsDicomConnection1;
      CnsDicomConnection1.MGetImage('STUDY', AStudyUID, AOnlyLoadKeyImage);
    end;
  finally
    d1.Free;
    a1.Free;
    d2.Free;
  end;
end;

procedure TvxDicomView.SelectMultiSeriesUID(AHost: string; APort: Integer;
  ADatasets: TDicomDatasets; AOnlyLoadKeyImage: Boolean);
  function FindStudies(ASeriesUID: string): Boolean;
  var
    i: Integer;
  begin
    Result := false;
    for i := 0 to ADatasets.Count - 1 do
    begin
      if ADatasets[i].Attributes.GetString($20, $E) = ASeriesUID then
      begin
        Result := true;
        break;
      end;
    end;
  end;
var
  a1, a2: TStringList;
  d1: TCnsDBTable;
  //  f1: TSelectSeriesForm;
  CnsDicomConnection1: TCnsDicomConnectionThread;
  das1: TCnsDMTable;
  //  i: integer;
  n1: TNetworkQueueItem;
  l1: TList;
begin
  if ADatasets.Count > 0 then
  begin
    d1 := CreateDBTable; //TCnsDBTable.Create(self);
    a1 := TStringList.Create;
    a2 := TStringList.Create;
    try
      {d1.AppSrvClient := DefaultClient;
      if DicomPrinterTable.TableLoadMode = cnsLoadFromWadoPostEx then
      begin
        d1.TableLoadMode := cnsLoadFromWadoPostEx;
        d1.OnHttpPost := DoHttpPost;
      end;}
      d1.ObjectName := 'SERIES';
      d1.WhereSQL := 'STUDYUID=''' + ADatasets[0].Attributes.GetString($20, $D) + '''';
      d1.RefreshTable;
      d1.SortOn('SeriesNumber', []);

      d1.Last;
      while not d1.Bof do
      begin
        if FindStudies(d1.fieldByName('SERIESUID').AsString) then
        begin
          d1.Delete;
        end
        else
          d1.Prior;
      end;

      if d1.RecordCount > 0 then
      begin
        if assigned(fOnSelectMultiSeries) then
        begin
          fOnSelectMultiSeries(self, d1, a2, a1);
        end;

        {f1 := TSelectSeriesForm.Create(self);
        try
          f1.DataSource1.DataSet := d1;
          if f1.ShowModal = mrok then
          begin
            setlength(a1, f1.DBGridEh1.SelectedRows.Count);
            setlength(a2, f1.DBGridEh1.SelectedRows.Count);
            for i := 0 to f1.DBGridEh1.SelectedRows.Count - 1 do
            begin
              d1.Bookmark := f1.DBGridEh1.SelectedRows[I];
              a1[i] := d1.FieldByName('SERIESUID').AsString;
              a2[i] := d1.FieldByName('STUDYUID').AsString;
            end;
          end;
        finally
          f1.Free;
        end;}
      end;
      if a1.Count > 0 then
      begin
        n1 := AddQueueItem;
        n1.PatientName := ADatasets[0].Attributes.GetString($10, $10);
        n1.StudyUID := ADatasets[0].Attributes.GetString($20, $D);

        //n1.ClientForm := self;
        n1.StartTime := now;
        //f1.WindowState := wsMinimized;
        das1 := FindDicomDataset(n1.StudyUID);
        das1.PName := n1.PatientName;
        if das1.PName = '' then
          das1.PName := n1.PatientCName;
        n1.Datasets := das1;

        //AddDatasets(das1, n1.PatientName, AStudyUID, ALock);
        //  UpdateClientView('CR');
        //RefreshMenu;

        CnsDicomConnection1 := TCnsDicomConnectionThread.Create(fLoadStyle);

        CnsDicomConnection1.Host := AHost;
        CnsDicomConnection1.Port := APort;
        CnsDicomConnection1.CallingTitle := 'CNSPACS';
        CnsDicomConnection1.CalledTitle := 'CNSCLIENT';
        //CnsDicomConnection1.CalledTitle := fCalledAE;
        //CnsDicomConnection1.CallingTitle := fCallingAE;
        CnsDicomConnection1.ReceiveTimeout := FReceiveTimeout; //60 * 1000;
        CnsDicomConnection1.UseSynchronizeEvent := FUseSynchronizeEvent;

        // add to queue

        n1.Direction := nqdGetImage;
        RefreshQueue;
        //NetworkQueueForm.Update;
        //if NetworkQueue1.Checked then
        //  NetworkQueueForm.Show;

        CnsDicomConnection1.Parent := n1;

        CnsDicomConnection1.CurrentDatasets := das1;
        {$IFNDEF USESYNCHRONIZE}
        //CnsDicomConnection1.FormHandle := Handle;
        {$ENDIF}
        //CnsDicomConnection1.QueueIndex := fQueues.IndexOf(n1);
        l1 := fQueues.LockList;
        try
          CnsDicomConnection1.QueueIndex := l1.IndexOf(n1);
        finally
          fQueues.UnlockList;
        end;

        CnsDicomConnection1.OnIconReceive := DoIconImageReceive;
        CnsDicomConnection1.OnReceive := DoNewImage;
        CnsDicomConnection1.OnError := aftererror;
        CnsDicomConnection1.OnTerminate := afterFinish;
        CnsDicomConnection1.OnWorkStart := DoStartImage;
        CnsDicomConnection1.FreeOnTerminate := true;
        n1.MyThread := CnsDicomConnection1;

        CnsDicomConnection1.MGetImage('SERIES', a1, a2, AOnlyLoadKeyImage);
      end;
    finally
      d1.Free;
      a1.free;
      a2.Free;
    end;
  end;
end;

function TvxDicomView.AddQueueItem: TNetworkQueueItem;
var
  n1: TNetworkQueueItem;
  //  v1: TAdvOfficeStatusPanel;
begin
  n1 := TNetworkQueueItem.Create;
  fQueues.Add(n1);
  Result := n1;
  //  AddListViewItem(n1);
  {v1 := AdvOfficeStatusBar1.Panels.Add;
  v1.Index := 2;
  //n1.Tag:= v1.Index;
  n1.Data := v1;
  v1.Style := psProgress;
  v1.Width := 200;
  //  v1.OfficeHint.Title := n1.PatientName;
  v1.Progress.Indication := piAbsolute;
  v1.Progress.CompletionSmooth := true; }
end;

procedure TvxDicomView.aftererror(Sender: TObject);
var
  n1: TNetworkQueueItem;
begin
  {$IFDEF DICOMDEBUGZ1}
  SendDebug('TDVSForm.aftererror');
  {$ENDIF}
  n1 := TNetworkQueueItem(TCnsDicomConnectionThread(Sender).Parent);
  //update the queue

  n1.Status := nqsError;
  n1.PatientName := TCnsDicomConnectionThread(Sender).ErrorMessage;

  RefreshQueue;
end;

procedure TvxDicomView.afterFinish(Sender: TObject);
var
  n1: TNetworkQueueItem;
  //  v1: TAdvOfficeStatusPanel;
begin
  if TCnsDicomConnectionThread(Sender).Parent = nil then
    exit;
  {$IFDEF DICOMDEBUGZ1}
  SendDebug('TDVSForm.afterFinish');
  {$ENDIF}

  n1 := TNetworkQueueItem(TCnsDicomConnectionThread(Sender).Parent);
  if n1.Status <> nqsError then
    n1.Status := nqsFinished; //nqsIdle
  n1.MessageString := TCnsDicomConnectionThread(Sender).ErrorMessage;
  if assigned(n1.ClientForm) then
  begin

  end;
  if assigned(n1.Data) then
  begin
    //v1 := TAdvOfficeStatusPanel(n1.Data);
    //AdvOfficeStatusBar1.Panels.Delete(v1.Index);
    n1.Data := nil;
  end;
  RefreshQueue;

  //n1.MyThread.free;
  n1.MyThread := nil;

  fQueues.Remove(n1);
  n1.Free;

  TCnsDicomConnectionThread(Sender).Parent := nil;

  {$IFDEF DICOMDEBUGZ1}
  //SendDebug('after thread close');
  {$ENDIF}
end;

procedure TvxDicomView.aftersend(Sender: TObject; APosition: Integer);
var
  n1: TNetworkQueueItem;
begin
  {$IFDEF DICOMDEBUGZ1}
  SendDebug('TDVSForm.aftersend');
  {$ENDIF}
  n1 := TNetworkQueueItem(TCnsDicomConnectionThread(Sender).Parent);
  //update the queue
  n1.LastActive := now;
  n1.CurImageCount := n1.CurImageCount + 1;
  if n1.Status <> nqsError then
    if n1.CurImageCount >= n1.ImageCount then
      n1.Status := nqsFinished; //nqsIdle
  //PostMessage(Handle, WM_DICOM_SEND, fQueues.IndexOf(n1), 0);
end;

function TvxDicomView.IsStudyLoading1(AUID: string): Boolean;
var
  i: integer;
  n1: TNetworkQueueItem;
  l1: TList;
begin
  {$IFDEF DICOMDEBUGZ1}
  SendDebug('TDVSForm.IsStudyLoading');
  {$ENDIF}
  Result := false;
  l1 := fQueues.LockList;
  try
    for i := 0 to l1.count - 1 do
    begin
      n1 := TNetworkQueueItem(l1[i]);
      if n1.StudyUID = AUID then
      begin
        Result := not assigned(n1.MyThread);
        exit;
      end;
    end;
  finally
    fQueues.UnlockList;
  end;
end;

function TvxDicomView.IsStudyLoading(AUID: string): Boolean;
var
  i: integer;
  n1: TNetworkQueueItem;
  l1: TList;
begin
  {$IFDEF DICOMDEBUGZ1}
  SendDebug('TDVSForm.IsStudyLoading');
  {$ENDIF}
  Result := true;
  l1 := fQueues.LockList;
  try
    for i := 0 to l1.count - 1 do
    begin
      n1 := TNetworkQueueItem(l1[i]);
      if n1.StudyUID = AUID then
      begin
        Result := not assigned(n1.MyThread);
        exit;
      end;
    end;
  finally
    fQueues.UnlockList;
  end;
end;

procedure TvxDicomView.ClearQueue;
var
  i: integer;
  n1: TNetworkQueueItem;
  l1: TList;
begin
  l1 := fQueues.LockList;
  try
    for i := 0 to l1.count - 1 do
    begin
      n1 := TNetworkQueueItem(l1[i]);
      if assigned(n1.MyThread) then
      begin
        if not n1.MyThread.Terminated then
        begin
          if assigned(n1.MyThread) and (not n1.MyThread.Terminated) then
          begin
            n1.MyThread.Terminate;
          end;
        end;
      end;
      n1.Free;
    end;
    l1.Clear;
  finally
    fQueues.UnlockList;
  end;
  fQueues.Free;
end;

procedure TvxDicomView.RefreshQueue;
var
  i: integer;
  n1: TNetworkQueueItem;
  //  v1: TAdvOfficeStatusPanel;
  l1: TList;
begin
  l1 := fQueues.LockList;
  try
    for i := 0 to l1.count - 1 do
    begin
      n1 := TNetworkQueueItem(l1[i]);
      if assigned(n1.Data) then
      begin
        {v1 := TAdvOfficeStatusPanel(n1.Data);
        v1.Progress.Prefix := n1.PatientName + '-';
        if n1.ImageCount > 0 then
        begin
          v1.Progress.Max := 100;

          v1.Progress.Position := Round(n1.CurImageCount / n1.ImageCount * 100);
          v1.Progress.Suffix := '%';
        end
        else
        begin
          v1.Progress.Max := 100;
          v1.Progress.Position := n1.CurImageCount;
          v1.Progress.Suffix := 'Images';
        end;}
      end;
    end;
  finally
    fQueues.UnlockList;
  end;
  //AdvOfficeStatusBar1.Update;

  {if (fQueueForm <> nil) and fQueueForm.Visible then
  begin
    fQueueForm.RefreshQueue;
  end;}
end;

procedure TvxDicomView.RemoveAllQueue;
var
  i: integer;
  n1: TNetworkQueueItem;
  l1: TList;
begin
  l1 := fQueues.LockList;
  try
    for i := 0 to l1.count - 1 do
    begin
      n1 := TNetworkQueueItem(l1[i]);
      if assigned(n1.MyThread) then
      begin
        if not n1.MyThread.Terminated then
          n1.MyThread.Terminate;
        if (MessageDlg(Format('You are still loading image : %s . Abort it?', [n1.PatientName]),
          mtWarning, [mbYes], 0) = mrYes) then
        begin

        end;
      end;
      //n1.MyThread.free;
      //n1.Free;
    end;
    l1.Clear;
  finally
    fQueues.UnlockList;
  end;
  RefreshQueue;
end;

function TvxDicomView.TestIfInLoading(ADatasets: TDicomDatasets): Boolean;
var
  n1: TNetworkQueueItem;
  //    das1: TDicomDatasets;
  i: Integer;
  l1: TList;
begin
  Result := false;

  l1 := fQueues.LockList;
  try

    for i := 0 to l1.Count - 1 do
    begin
      n1 := TNetworkQueueItem(l1[i]);
      if n1.Status = nqsActive then
      begin
        if n1.Datasets = ADatasets then
        begin
          Sleep(100);
          Result := true;
          exit;
        end;
      end;
    end;

  finally
    fQueues.UnlockList;
  end;
end;

function TvxDicomView.CloseIfInLoading(ADatasets: TDicomDatasets): Boolean;
var
  n1: TNetworkQueueItem;
  //    das1: TDicomDatasets;
  i: Integer;
  l1: TList;
begin
  Result := false;

  l1 := fQueues.LockList;
  try
    for i := 0 to l1.Count - 1 do
    begin
      n1 := TNetworkQueueItem(l1[i]);
      if n1.Status = nqsActive then
      begin
        if n1.Datasets = ADatasets then
        begin
          //if AYMessageDlg(self, 'Terminate?', mtWarning, [mbYes, MbNo], 0) = mrYes then
          //n1.MyThread.Terminate;
          if not n1.MyThread.Terminated then
            n1.MyThread.Terminate;
          if (MessageDlg(Format('You are still loading image : %s . Abort it?', [n1.PatientName]),
            mtWarning, [mbYes], 0) = mrYes) then
          begin

          end;
          exit;
        end;
      end;
    end;
  finally
    fQueues.UnlockList;
  end;
end;

function TvxDicomView.FindQueueItem(AStudyUID: string): TNetworkQueueItem;
var
  n1: TNetworkQueueItem;
  //    das1: TDicomDatasets;
  i: Integer;
  l1: TList;
begin
  Result := nil;
  l1 := fQueues.LockList;
  try
    for i := 0 to l1.Count - 1 do
    begin
      n1 := TNetworkQueueItem(l1[i]);
      if n1.StudyUID = AStudyUID then
      begin
        Result := n1;
        exit;
      end;
    end;

  finally
    fQueues.UnlockList;
  end;
end;

procedure TvxDicomView.DoIconImageReceive(Sender: TObject;
  ADataset: TDicomAttribute);
var
  n1: TNetworkQueueItem;
begin
  n1 := TNetworkQueueItem(TCnsDicomConnectionThread(Sender).Parent);
  n1.LastActive := now;
  n1.Status := nqsActive;
  //n1.DirectionText := 'Starting';
  if assigned(ADataset) then
  begin
    n1.ImageCount := ADataset.GetCount;
    {$IFDEF DICOMDEBUX1}
    SendDebug('n1.ImageCount' + IntToStr(ADataset.GetCount));
    {$ENDIF}

    TCnsDMTable(n1.Datasets).FetchCount := ADataset.GetCount;
  end;
  if assigned(OnIconReceive) then
    OnIconReceive(self, ADataset);
end;

procedure TvxDicomView.DoNewImage(Sender: TObject;
  ADataset: TDicomDataset);
var
  n1: TNetworkQueueItem;
  das1: TDicomDatasets;
begin
  n1 := TNetworkQueueItem(TCnsDicomConnectionThread(Sender).Parent);
  {$IFDEF DICOMDEBUX1}
  //SendDebug('DoNewImage');
  {$ENDIF}
  if assigned(n1) and assigned(ADataset) then
  begin
    das1 := n1.Datasets;

    if (ADataset.Attributes.ImageData = nil) then
    begin
      //if n1.TabData <> nil then
      //  TImageTab(n1.TabData).fSRDatasets.AddDicomDataset(ADataset);
      exit;
    end
    else
    begin

      //update the queue
      n1.CurImageCount := n1.CurImageCount + 1;
      n1.LastActive := now;

      //RefreshQueue;

      //NetworkQueueForm.Update;
      {$IFNDEF INFOMEDWEBPACS}
      if n1.PatientCName <> '' then
      begin
        ADataset.Attributes.AddVariant($10, $10, n1.PatientCName);
      end;

      if n1.PatientID <> '' then
      begin
        ADataset.Attributes.AddVariant($10, $20, n1.PatientID);
      end;

      if n1.HospitalName <> '' then
      begin
        ADataset.Attributes.AddVariant(8, $80, n1.HospitalName);
      end;
      {$ENDIF}

      das1.AddDicomDataset(ADataset);
    end;
  end;
  {$IFDEF DICOMDEBUX1}
  // SendDebug('before OnReceive');
  {$ENDIF}

  if assigned(OnReceive) then
    OnReceive(self, ADataset);

  {$IFDEF DICOMDEBUX1}
  //SendDebug('after OnReceive');
  {$ENDIF}
end;

procedure TvxDicomView.DoStartImage(Sender: TObject);
var
  n1: TNetworkQueueItem;
begin
  {$IFDEF DICOMDEBUGZ1}
  SendDebug('TDVSForm.DoStartImage');
  {$ENDIF}
  n1 := TNetworkQueueItem(TCnsDicomConnectionThread(Sender).Parent);
  n1.Status := nqsActive;
  n1.LastActive := now;

  RefreshQueue;
end;

procedure TvxDicomView.LoadPaper(AHost: string; APort: Integer; ADataset: TDicomDatasets; AStudyUID,
  AImageStudyUID: string);
var
  CnsDMTable1: TCnsDMTable;
  das1: TDicomDataset;
  i: Integer;
  Client1: TCnsDicomConnection;
begin
  Client1 := TCnsDicomConnection.Create(self);
  try
    Client1.Host := AHost;
    Client1.Port := APort;
    Client1.CallingTitle := 'CNSPACS';
    Client1.CalledTitle := 'CNSCLIENT';
    //Client1.CalledTitle := fCalledAE;
    //Client1.CallingTitle := fCallingAE;
    Client1.ReceiveTimeout := 120 * 1000;

    Client1.AddPresentationContext(DBS_Verification);
    {$IFDEF DICOMDEBUX1}
    SendDebug(Format('before Host %s Port %d, %s=>%s', [AHost, APort, AStudyUID,
      AImageStudyUID]));
    {$ENDIF}
    CnsDMTable1 := TCnsDMTable.Create(self);
    try
      CnsDMTable1.AppSrvClient := Client1;
      CnsDMTable1.SpecifyLoadImageParam := 'SCAN';
      CnsDMTable1.StudyUID := AStudyUID;
      if CnsDMTable1.Count > 0 then
      begin
        for i := 0 to CnsDMTable1.Count - 1 do
        begin
          das1 := CnsDMTable1.Item[i];
          das1.Attributes.AddVariant($20, $D, AImageStudyUID);
          das1.Attributes.AddVariant($20, $E, '00.00');
          das1.Attributes.AddVariant($20, $13, 0);
          das1.Attributes.AddVariant($20, $11, 0);

          //das1.Attributes.AddVariant($28, $6, 2);
          //das1.Attributes.AddVariant(8, $70, '');//DicomVCL

          //das1.Attributes.AddVariant($8, $70, 'SCAN');

          ADataset.InsertDicomDataset(0, das1);
        end;

        CnsDMTable1.ClearList;
      end;
    finally
      CnsDMTable1.Free;
    end;
  finally
    Client1.Free;
  end;
end;

function TvxDicomView.CreateDicomDataset(AStudyUID: string): TCnsDMTable;
begin
  Result := TCnsDMTable.Create(nil);
  //Result.AutoShowReffrenceLine := ShowAllReferenceLine1.Checked;

  Result.LabelPosition := dlmFreeMove; //dlmBottomOfImage;

  Result.StudyUID := AStudyUID;

  //Result.OnReadAttribute := DoNewAttribute;
  Result.OnLoadFrame := DoLoadFrame;
  Result.OnLoadFrameFinish := DoLoadFrameFinish;
  Result.OnAfterLoad := DoAfterLoad;
  Result.OnAddDataset := DoAddDataset;
  Result.ImageOrder := self.ImageOrder;

  fDicomDatasetsList.Insert(0, Result);

  fStudyRect.AddDatasets(Result);

  GetThumbnailsRect;
end;

procedure TvxDicomView.ClearDicomDatasets;
var
  i: Integer;
  das: TCnsDMTable;
begin
  fActiveSeries := nil;
  FFullScreenSeries := nil;
  fActiveImage := nil;

  fActiveThumbnails := 0;
  fThumbnailStart := 0;

  RemoveAllQueue;

  for i := 0 to fDicomDatasetsList.Count - 1 do
  begin

    das := TCnsDMTable(fDicomDatasetsList[i]);

    //reset viewer
    fStudyRect.RemoveDatasets(das);

    das.Free;
  end;
  fDicomDatasetsList.Clear;

  for i := 0 to fThumbnailBitmapList.Count - 1 do
  begin
    TvxBitmap(fThumbnailBitmapList[i]).Free;
  end;
  fThumbnailBitmapList.Clear;

  ReDraw(true);
end;

function TvxDicomView.RemoveDicomDataset(AStudyUID: string;
  ADataset: TCnsDMTable): Boolean;
var
  i: Integer;
  das: TCnsDMTable;
begin
  if ADataset <> nil then
  begin
    if fDicomDatasetsList.IndexOf(ADataset) >= 0 then
    begin
      CloseIfInLoading(ADataset);
      //reset viewer
      fStudyRect.RemoveDatasets(ADataset);
      fDicomDatasetsList.Remove(ADataset);
    end;
  end
  else
    if AStudyUID <> '' then
  begin
    for i := 0 to fDicomDatasetsList.Count - 1 do
    begin
      if TCnsDMTable(fDicomDatasetsList[i]).StudyUID = AStudyUID then
      begin
        das := TCnsDMTable(fDicomDatasetsList[i]);

        CloseIfInLoading(das);
        //reset viewer
        fStudyRect.RemoveDatasets(das);
        fDicomDatasetsList.Delete(i);

        break;
      end;
    end;
  end;
  fActiveThumbnails := 0;
  fThumbnailStart := 0;

  for i := 0 to fThumbnailBitmapList.Count - 1 do
  begin
    TvxBitmap(fThumbnailBitmapList[i]).Free;
  end;
  fThumbnailBitmapList.Clear;

  ReDraw(true);
end;

function TvxDicomView.FindDicomDataset(AStudyUID: string): TCnsDMTable;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to fDicomDatasetsList.Count - 1 do
  begin
    if TCnsDMTable(fDicomDatasetsList[i]).StudyUID = AStudyUID then
    begin
      Result := TCnsDMTable(fDicomDatasetsList[i]);
      break;
    end;
  end;
  if Result = nil then
    Result := CreateDicomDataset(AStudyUID);
end;

function TvxDicomView.GetCurrentDicomDataset: TCnsDMTable;
begin
  if (ActiveSeries <> nil) and (ActiveSeries.DicomDatasets <> nil) then
    Result := TCnsDMTable(ActiveSeries.DicomDatasets)
  else
    Result := nil;
  {$IFDEF DICOMDEBUX1}
  if ActiveSeries = nil then
    SendDebug('GetCurrentDicomDataset ActiveSeries = nil');
  if Result = nil then
    SendDebug('GetCurrentDicomDataset Result = nil');
  {$ENDIF}

end;

procedure TvxDicomView.DoHttpGet(Sender: TObject; AURL: string;
  AStm: TStream);
begin
  if assigned(fOnHttpGet) then
    fOnHttpGet(Sender, AURL, AStm)
end;

procedure TvxDicomView.DoHttpPost(Sender: TObject; AURL: string;
  const ASource, AResponse: TStream);
begin
  if assigned(fOnHttpPost) then
    fOnHttpPost(Sender, AURL, ASource, AResponse)
end;

function TvxDicomView.CreateDBTable: TCnsDBTable;
begin
  Result := nil;
  if (DefaultClient = nil) then
    exit;
  Result := TCnsDBTable.Create(self);
  Result.AppSrvClient := DefaultClient;
  if (GroupTable <> nil) and (GroupTable.TableLoadMode = cnsLoadFromWadoPostEx) then
  begin
    Result.TableLoadMode := cnsLoadFromWadoPostEx;
    Result.OnHttpPost := DoHttpPost;
  end;
end;

function TvxDicomView.CreateProcedure: TCnsStorageProcedure;
begin
  Result := nil;
  if (DefaultClient = nil) then
    exit;
  Result := TCnsStorageProcedure.Create(self);
  Result.AppSrvClient := DefaultClient;
  {if (GroupTable <> nil) and (GroupTable.TableLoadMode = cnsLoadFromWadoPostEx) then
  begin
    Result.TableLoadMode := cnsLoadFromWadoPostEx;
    Result.OnHttpPost := DoHttpPost;
  end;}
end;

function TvxDicomView.BuildAllDataset: Boolean;
begin
  if (not assigned(GroupTable)) and assigned(DefaultClient) then
  begin
    fGroupTable := TCnsDBTable.Create(self);
    fGroupTable.AppSrvClient := DefaultClient;
    fGroupTable.ObjectName := 'RIS_REPORT_GROUP';
    fGroupTable.RefreshTable;

    if not fGroupTable.Active then
    begin
      fGroupTable.Free;
      fGroupTable := nil;
      Result := false;
      exit;
    end;

    fInformationLabelsTable := TCnsDBTable.Create(self);
    fInformationLabelsTable.AppSrvClient := DefaultClient;
    fInformationLabelsTable.ObjectName := 'DICOMDISPLAY';
    fInformationLabelsTable.RefreshTable;

    fInfoProposalsTable := TCnsDBTable.Create(self);
    fInfoProposalsTable.AppSrvClient := DefaultClient;
    fInfoProposalsTable.ObjectName := 'DICOMDISPLAY_TYPE';
    fInfoProposalsTable.RefreshTable;

    fImageEnhancementTable := TCnsDBTable.Create(self);
    fImageEnhancementTable.AppSrvClient := DefaultClient;
    fImageEnhancementTable.ObjectName := 'RIS_IMAGE_ENHANCE';
    fImageEnhancementTable.RefreshTable;

    fDicomPrinterTable := TCnsDBTable.Create(self);
    fDicomPrinterTable.AppSrvClient := DefaultClient;
    fDicomPrinterTable.ObjectName := 'DICOMPRINTER';
    fDicomPrinterTable.RefreshTable;
    fDicomPrinterTable.SortOn('NAME', []);

    fModalityTable := TCnsDBTable.Create(self);
    fModalityTable.AppSrvClient := DefaultClient;
    fModalityTable.ObjectName := 'MODILITY_PARAM';
    fModalityTable.RefreshTable;

    fPresetTable := TCnsDBTable.Create(self);
    fPresetTable.AppSrvClient := DefaultClient;
    fPresetTable.ObjectName := 'WINDOWS_PRESET';
    fPresetTable.RefreshTable;

    {fLookuptableTable := TCnsDBTable.Create(self);
    fLookuptableTable.AppSrvClient := DefaultClient;
    fLookuptableTable.ObjectName := 'LOOKUP_TABLE';
    fLookuptableTable.RefreshTable;}

    fLayoutTable := TCnsDBTable.Create(self);
    fLayoutTable.AppSrvClient := DefaultClient;
    fLayoutTable.ObjectName := 'LAYOUT_TABLE';
    fLayoutTable.WhereSQL := '(MODALITY =''DXV'')';
    //fLayoutTable.TableLoadMode :=  cnsLoadFromNetwork;
    fLayoutTable.RefreshTable;
  end;
  Result := true; //assigned(DefaultClient);
end;

function TvxDicomView.BuildAllDatasetViaWadoPost: Boolean;
begin
  if (not assigned(LayoutTable)) then
  begin
    fGroupTable := TCnsDBTable.Create(self);
    fGroupTable.AppSrvClient := DefaultClient;
    fGroupTable.TableLoadMode := cnsLoadFromWadoPostEx;
    fGroupTable.OnHttpPost := DoHttpPost;
    fGroupTable.ObjectName := 'RIS_REPORT_GROUP';

    {$IFDEF DICOMDEBUX1}
    SendDebug(fGroupTable.Database);
    {$ENDIF}

    fGroupTable.RefreshTable;

    if not fGroupTable.Active then
    begin
      fGroupTable.Free;
      fGroupTable := nil;
      Result := false;
      exit;
    end;

    //f1.ProgressBar1.Position := 1;

    fInformationLabelsTable := TCnsDBTable.Create(self);
    fInformationLabelsTable.AppSrvClient := DefaultClient;
    fInformationLabelsTable.TableLoadMode := cnsLoadFromWadoPostEx;
    fInformationLabelsTable.OnHttpPost := DoHttpPost;
    fInformationLabelsTable.ObjectName := 'DICOMDISPLAY';
    fInformationLabelsTable.RefreshTable;
    //f1.ProgressBar1.Position := 2;

    fInfoProposalsTable := TCnsDBTable.Create(self);
    fInfoProposalsTable.AppSrvClient := DefaultClient;
    fInfoProposalsTable.TableLoadMode := cnsLoadFromWadoPostEx;
    fInfoProposalsTable.OnHttpPost := DoHttpPost;
    fInfoProposalsTable.ObjectName := 'DICOMDISPLAY_TYPE';
    fInfoProposalsTable.RefreshTable;

    fImageEnhancementTable := TCnsDBTable.Create(self);
    fImageEnhancementTable.AppSrvClient := DefaultClient;
    fImageEnhancementTable.TableLoadMode := cnsLoadFromWadoPostEx;
    fImageEnhancementTable.OnHttpPost := DoHttpPost;
    fImageEnhancementTable.ObjectName := 'RIS_IMAGE_ENHANCE';
    fImageEnhancementTable.RefreshTable;
    //f1.ProgressBar1.Position := 2;

    fDicomPrinterTable := TCnsDBTable.Create(self);
    fDicomPrinterTable.AppSrvClient := DefaultClient;
    fDicomPrinterTable.TableLoadMode := cnsLoadFromWadoPostEx;
    fDicomPrinterTable.OnHttpPost := DoHttpPost;
    fDicomPrinterTable.ObjectName := 'DICOMPRINTER';
    fDicomPrinterTable.RefreshTable;
    //f1.ProgressBar1.Position := 3;

    fModalityTable := TCnsDBTable.Create(self);
    fModalityTable.AppSrvClient := DefaultClient;
    fModalityTable.OnHttpPost := DoHttpPost;
    fModalityTable.TableLoadMode := cnsLoadFromWadoPostEx;
    fModalityTable.ObjectName := 'MODILITY_PARAM';
    fModalityTable.RefreshTable;
    //f1.ProgressBar1.Position := 4;

    fPresetTable := TCnsDBTable.Create(self);
    fPresetTable.AppSrvClient := DefaultClient;
    fPresetTable.OnHttpPost := DoHttpPost;
    fPresetTable.TableLoadMode := cnsLoadFromWadoPostEx;
    fPresetTable.ObjectName := 'WINDOWS_PRESET';
    fPresetTable.RefreshTable;
    //f1.ProgressBar1.Position := 5;

    {fLookuptableTable := TCnsDBTable.Create(self);
    fLookuptableTable.AppSrvClient := DefaultClient;
    fLookuptableTable.OnHttpPost := DoHttpPost;
    fLookuptableTable.TableLoadMode := cnsLoadFromWadoPostEx;
    fLookuptableTable.ObjectName := 'LOOKUP_TABLE';
    fLookuptableTable.RefreshTable; //}
    //f1.ProgressBar1.Position := 6;

    fLayoutTable := TCnsDBTable.Create(self);
    fLayoutTable.AppSrvClient := DefaultClient;
    fLayoutTable.OnHttpPost := DoHttpPost;
    fLayoutTable.TableLoadMode := cnsLoadFromWadoPostEx;
    fLayoutTable.ObjectName := 'LAYOUT_TABLE';
    fLayoutTable.WhereSQL := '(MODALITY =''DXV'')';
    fLayoutTable.RefreshTable; //}
    //f1.ProgressBar1.Position := 7;

  end;
  Result := assigned(fLayoutTable);
end;

procedure TvxDicomView.SetOnSelectMultiFilms(
  const Value: TOnSelectMultiSeriesEvent);
begin
  FOnSelectMultiFilms := Value;
end;

procedure TvxDicomView.SetOnSelectMultiSeries(
  const Value: TOnSelectMultiSeriesEvent);
begin
  FOnSelectMultiSeries := Value;
end;

procedure TvxDicomView.SetDefaultClient(const Value: TCnsDicomConnection);
begin
  FDefaultClient := Value;
end;

procedure TvxDicomView.SetShowThumbnails(const Value: Boolean);
var
  das1: TCnsDMTable;
begin
  if FShowThumbnails <> Value then
  begin
    FShowThumbnails := Value;

    StudyRect.SetBound(GetViewportRect);
    fResized := true;

    if not (csDestroying in ComponentState) then
      if FShowThumbnails then
      begin
        if FThumbnailsScrollBar = nil then
        begin
          FThumbnailsScrollBar := TvxScrollBar.Create(self);
          FThumbnailsScrollBar.Max := FThumbnailsScrollBar.Min;
          FThumbnailsScrollBar.Enabled := false;
          FThumbnailsScrollBar.OnChange := DoThumbnailsScrollBarChange;

          AddObject(FThumbnailsScrollBar);
          if (fDicomDatasetsList.Count > 0) and (FThumbnailsScrollBar <> nil) then
          begin
            das1 := TCnsDMTable(fDicomDatasetsList[fActiveThumbnails]);
            FThumbnailsScrollBar.Value := fThumbnailStart;
            if FShowSeriesThumbnailOnly then
            begin
              FThumbnailsScrollBar.Max := das1.GetSeriesCount;
              FThumbnailsScrollBar.Enabled := das1.GetSeriesCount > FThumbnailsIconsLength;
            end
            else
            begin
              FThumbnailsScrollBar.Max := das1.Count;
              FThumbnailsScrollBar.Enabled := das1.Count > FThumbnailsIconsLength;
            end
          end;
        end;
      end
      else
      begin
        if FThumbnailsScrollBar <> nil then
        begin
          RemoveObject(FThumbnailsScrollBar);
          FThumbnailsScrollBar.Free;
          FThumbnailsScrollBar := nil;
        end;
      end;

    GetThumbnailsRect;

    DrawRect := vgRect(0, 0, Width, Height);
    Redraw(true);
  end;
end;

procedure TvxDicomView.SetThumbnailsAlign(const Value: TAlign);
begin
  if FThumbnailsAlign <> Value then
  begin
    FThumbnailsAlign := Value;
    StudyRect.SetBound(GetViewportRect);
    fResized := true;

    GetThumbnailsRect;

    DrawRect := vgRect(0, 0, Width, Height);
    Redraw(true);
  end;
end;

procedure TvxDicomView.SetThumbnailsHeight(const Value: Integer);
begin
  if FThumbnailsHeight <> Value then
  begin
    FThumbnailsHeight := Value;
    StudyRect.SetBound(GetViewportRect);
    fResized := true;

    GetThumbnailsRect;

    DrawRect := vgRect(0, 0, Width, Height);
    Redraw(true);
  end;
end;

procedure TvxDicomView.SetThumbnailsRows(const Value: Integer);
begin
  if FThumbnailsRows <> Value then
  begin
    FThumbnailsRows := Value;

    DrawRect := vgRect(0, 0, Width, Height);
    Redraw(true);
  end;
end;

procedure TvxDicomView.SetOnSetPresetWidthLevel(
  const Value: TDicomImagePresetWidthLevelEvent);
begin
  FOnSetPresetWidthLevel := Value;
end;

procedure TvxDicomView.Negative;
begin
  if assigned(fActiveImage) and (fActiveImage.DicomDataset <> nil) and
    (fActiveImage.DicomDataset.Attributes.ImageData <> nil) then
  begin
    fActiveImage.DicomDataset.Attributes.ImageData.Negative := not fActiveImage.DicomDataset.Attributes.ImageData.Negative;
    UpdateImageParam(fActiveImage.DicomDataset, uitNegative);
    Redraw;
  end;
end;

procedure TvxDicomView.ResetImage;
var
  i, k: Integer;
  das1: TCnsDMTable;
  da1: TDicomDataset;
begin
  for i := 0 to fDicomDatasetsList.Count - 1 do
  begin
    das1 := TCnsDMTable(fDicomDatasetsList[i]);
    for k := 0 to das1.Count - 1 do
    begin
      da1 := das1[k];
      da1.Attributes.ImageData.Reset;
    end;
  end;

  Redraw;
end;

procedure TvxDicomView.SetLut(AStream: TStream);
begin
  if assigned(fActiveImage) and (fActiveImage.DicomDataset <> nil) and
    (fActiveImage.DicomDataset.Attributes.ImageData <> nil) then
  begin
    fActiveImage.DicomDataset.Attributes.ImageData.LoadLutFromStream(AStream);
    UpdateImageParam(fActiveImage.DicomDataset, uitZoom);
    Redraw;
  end;
end;

procedure TvxDicomView.SetWinLevel(AWin, ALevel: Integer);
begin
  if assigned(fActiveImage) and (fActiveImage.DicomDataset <> nil) and
    (fActiveImage.DicomDataset.Attributes.ImageData <> nil) then
  begin
    fActiveImage.DicomDataset.Attributes.ImageData.WindowWidth := AWin;
    fActiveImage.DicomDataset.Attributes.ImageData.WindowCenter := ALevel;
    UpdateImageParam(fActiveImage.DicomDataset, uitWindowsWidthLevel);
    Redraw;
  end;
end;

procedure TvxDicomView.SetHozFlip(AValue: Boolean);
begin
  if assigned(fActiveImage) and (fActiveImage.DicomDataset <> nil) and
    (fActiveImage.DicomDataset.Attributes.ImageData <> nil) then
  begin
    fActiveImage.DicomDataset.Attributes.ImageData.HozFlip := AValue;
    UpdateImageParam(fActiveImage.DicomDataset, uitHozFlip);
    Redraw;
  end;
end;

procedure TvxDicomView.SetVerFlip(AValue: Boolean);
begin
  if assigned(fActiveImage) and (fActiveImage.DicomDataset <> nil) and
    (fActiveImage.DicomDataset.Attributes.ImageData <> nil) then
  begin
    fActiveImage.DicomDataset.Attributes.ImageData.VerFlip := AValue;
    UpdateImageParam(fActiveImage.DicomDataset, uitVerFlip);
    Redraw;
  end;
end;

procedure TvxDicomView.RotalImageCW;
begin
  if assigned(fActiveImage) and (fActiveImage.DicomDataset <> nil) and
    (fActiveImage.DicomDataset.Attributes.ImageData <> nil) then
  begin
    fActiveImage.DicomDataset.Attributes.ImageData.Rotate := abs(fActiveImage.DicomDataset.Attributes.ImageData.Rotate - 1) mod 4;
    UpdateImageParam(fActiveImage.DicomDataset, uitRotate);
    Redraw;
  end;
end;

procedure TvxDicomView.RotalImageCCW;
begin
  if assigned(fActiveImage) and (fActiveImage.DicomDataset <> nil) and
    (fActiveImage.DicomDataset.Attributes.ImageData <> nil) then
  begin
    fActiveImage.DicomDataset.Attributes.ImageData.Rotate := (fActiveImage.DicomDataset.Attributes.ImageData.Rotate + 1) mod 4;
    UpdateImageParam(fActiveImage.DicomDataset, uitRotate);
    Redraw;
  end;
end;

procedure TvxDicomView.DeleteLabel;
begin
  if assigned(fActiveImage) and (fActiveImage.DicomDataset <> nil) and
    (fActiveImage.DicomDataset.Attributes.ImageData <> nil) then
  begin
    fActiveImage.DicomDataset.Attributes.ImageData.DrawObjects.RemoveAll;

    Redraw;
  end;
end;

procedure TvxDicomView.SetImageSynchronization(
  const Value: TImageSynchronization);
begin
  FImageSynchronization := Value;
end;

function TvxDicomView.GetActiveImage: TImageRect;
begin
  Result := FActiveImage;
  if (Result = nil) then
    Result := TImageRect(ActiveSeries.fImageRectList[0]);
end;

function TvxDicomView.GetActiveSeries: TSeriesRect;
begin
  Result := FActiveSeries;
  if Result = nil then
    Result := TSeriesRect(FStudyRect.fSeriesRectList[0]);
end;

procedure TvxDicomView.DoStudyFormatChange(Sender: TObject);
begin
  if Sender = nil then
  begin
    fActiveImage := nil;
    fActiveSeries := nil;
  end
  else
    if Sender <> nil then
  begin
    fActiveImage := nil;
  end;
end;

procedure TvxDicomView.GetThumbnailsButtonsRect(AIndex: Integer; var r1, r2: TvxRect);
begin
  r1.Left := FThumbnailsButtonsRect.Left + 1;
  r1.Top := FThumbnailsButtonsRect.Top + 1 + FThumbnailsButtonHeight * AIndex;
  r1.Right := r1.Left + FThumbnailsHeight * 0.8 - 1;
  r1.Bottom := r1.Top + FThumbnailsButtonHeight - 1;

  r2 := r1;
  r2.Left := r1.Right + 1;
  r2.Right := r1.Left + FThumbnailsHeight - 1;
end;

procedure TvxDicomView.DrawThumbnailsButtons(AIndex: Integer;
  ADatasets: TDicomDatasets);
var
  r1, r2: TvxRect;
  str1: string;
begin
  r1.Left := FThumbnailsButtonsRect.Left + 1;
  r1.Top := FThumbnailsButtonsRect.Top + 1 + FThumbnailsButtonHeight * AIndex;
  r1.Right := r1.Left + FThumbnailsHeight * 0.8 - 1;
  r1.Bottom := r1.Top + FThumbnailsButtonHeight - 1;

  r2 := r1;
  r2.Left := r1.Right + 1;
  r2.Right := r1.Left + FThumbnailsHeight - 1;

  Canvas.Stroke.Style := vgBrushSolid;
  Canvas.Stroke.SolidColor := $A0FF0000;

  Canvas.Fill.Style := vgBrushSolid;

  Canvas.Fill.SolidColor := $FF9BB1FE;

  Canvas.FillRect(r1, 5, 5, AllCorners, 0.8);
  Canvas.DrawRect(r1, 5, 5, AllCorners, 1);

  if (AIndex = fActiveThumbnails) then
    Canvas.Fill.SolidColor := $FFFFF5EE;
  Canvas.FillRect(r2, 5, 5, AllCorners, 0.8);
  Canvas.DrawRect(r2, 5, 5, AllCorners, 1);

  if (AIndex = fActiveThumbnails) and (ADatasets.Count > 0) then
  begin
    Canvas.Fill.SolidColor := $FFFFF5EE;

    if TCnsDMTable(ADatasets).FetchCount > 0 then
      r1.Right := r1.Left + FThumbnailsHeight * 0.8 * (ADatasets.Count / TCnsDMTable(ADatasets).FetchCount) - 1;

    Canvas.FillRect(r1, 5, 5, AllCorners, 0.8);
    Canvas.DrawRect(r1, 5, 5, AllCorners, 1);
  end;

  Canvas.Font.Family := FLabelFontName;
  Canvas.Font.Size := 12;
  //Canvas.Stroke.SolidColor := $A0FF00FF;
  Canvas.Stroke.SolidColor := vgColorFromVCL(clBlack);
  Canvas.Fill.SolidColor := vgColorFromVCL(clBlack);
  if (ADatasets <> nil) then
  begin
    str1 := TCnsDMTable(ADatasets).PName;
    if (str1 = '') then
    begin
      if (ADatasets.Count > 0) then
        str1 := ADatasets[0].Attributes.GetString($10, $10)
      else
        str1 := 'No Name';
    end;
    str1 := IntToStr(TCnsDMTable(ADatasets).FetchCount) + '-' + str1;
    {$IFDEF DICOMDEBUX1}
    //SendDebug(Format('DrawThumbnailsButtons %s,%s, %d', [TCnsDMTable(ADatasets).PName, str1, ADatasets.Count]));
    {$ENDIF}
    Canvas.FillText(r1, r1, str1, false, 1, vgTextAlignNear, vgTextAlignCenter);
  end
  else
  begin
    str1 := 'No Name';
    Canvas.FillText(r1, r1, str1, false, 1, vgTextAlignNear, vgTextAlignCenter);
  end;
  Canvas.DrawLine(r2.TopLeft, r2.BottomRight, 1);
  Canvas.DrawLine(vgPoint(r2.Left, r2.Bottom), vgPoint(r2.Right, r2.Top), 1);
end;

procedure TvxDicomView.DrawThumbnails;
var
  space1, i, k: Integer;
  das1: TCnsDMTable;
  str1: AnsiString;
  StartX, StartY: Single;
  da1: TDicomDataset;
begin
  space1 := 2;
  if fDicomDatasetsList.Count > 0 then
  begin
    if FShowThumbnails then
    begin
      //draw button
      //if fDicomDatasetsList.Count > 1 then
      begin
        for i := 0 to fDicomDatasetsList.Count - 1 do
        begin
          das1 := TCnsDMTable(fDicomDatasetsList[i]);

          DrawThumbnailsButtons(i, das1);

          if FThumbnailsAlign in [alTop, alBottom] then
          begin
            if ((i + 1) * FThumbnailsButtonHeight) >= FThumbnailsHeight then
              break;
          end
          else
          begin

          end;
        end;
      end;
      //draw icon
      StartX := FThumbnailsIconsRect.Left;
      StartY := FThumbnailsIconsRect.Top;

      if fActiveThumbnails >= fDicomDatasetsList.Count then
      begin
        fActiveThumbnails := 0;
      end;
      das1 := TCnsDMTable(fDicomDatasetsList[fActiveThumbnails]);

      k := 0;
      if FShowSeriesThumbnailOnly then
      begin
        if fThumbnailStart >= das1.GetSeriesCount then
          fThumbnailStart := 0;

        for i := fThumbnailStart to das1.GetSeriesCount - 1 do
        begin
          da1 := das1.SeriesDataset[i];
          str1 := Format('%d:%d Images', [1 + i, das1.GetSeriesImageCount(da1)]);

          if FThumbnailsAlign in [alTop, alBottom] then
            DrawDicomImageIcon(k, da1.Attributes, vgRect(StartX + k * FThumbnailsHeight + space1, StartY + space1,
              StartX + (k + 1) * FThumbnailsHeight - space1, StartY + FThumbnailsHeight - space1), str1, fThumbnailSelected = i)
          else
            DrawDicomImageIcon(k, da1.Attributes, vgRect(StartX + space1, StartY + k * FThumbnailsHeight + space1,
              StartX + FThumbnailsHeight - space1, StartY + (k + 1) * FThumbnailsHeight - space1), str1, fThumbnailSelected = i);
          inc(k);
          if k >= FThumbnailsIconsLength then
            break;
        end;
      end
      else
      begin
        if fThumbnailStart >= das1.Count then
          fThumbnailStart := 0;

        for i := fThumbnailStart to das1.Count - 1 do
        begin
          da1 := das1[i];

          str1 := Format('%d: No.%d', [1 + i, da1.Attributes.getInteger($20, $13)]);

          if FThumbnailsAlign in [alTop, alBottom] then
            DrawDicomImageIcon(k, da1.Attributes, vgRect(StartX + k * FThumbnailsHeight + space1, StartY + space1,
              StartX + (k + 1) * FThumbnailsHeight - space1, StartY + FThumbnailsHeight - space1), str1, fThumbnailSelected = i)
          else
            DrawDicomImageIcon(k, da1.Attributes, vgRect(StartX + space1, StartY + k * FThumbnailsHeight + space1,
              StartX + FThumbnailsHeight - space1, StartY + (k + 1) * FThumbnailsHeight - space1), str1, fThumbnailSelected = i);
          inc(k);
          if k >= FThumbnailsIconsLength then
            break;
        end;
      end;
    end;
  end;
end;

procedure TvxDicomView.SetShowSeriesThumbnailOnly(const Value: Boolean);
var
  das1: TCnsDMTable;
begin
  FShowSeriesThumbnailOnly := Value;
  fThumbnailStart := 0;
  if FThumbnailsScrollBar <> nil then
  begin
    if fDicomDatasetsList.Count > 0 then
    begin
      das1 := TCnsDMTable(fDicomDatasetsList[fActiveThumbnails]);

      fSetScrolllbarValue := true;
      FThumbnailsScrollBar.Value := fThumbnailStart;
      if FShowSeriesThumbnailOnly then
      begin
        FThumbnailsScrollBar.Max := das1.GetSeriesCount;
        FThumbnailsScrollBar.Enabled := das1.GetSeriesCount > FThumbnailsIconsLength;
      end
      else
      begin
        FThumbnailsScrollBar.Max := das1.Count;
        FThumbnailsScrollBar.Enabled := das1.Count > FThumbnailsIconsLength;
      end
    end;
  end;
  Redraw(true);
end;

function TvxDicomView.GetThumbnailsRect: TvxRect;
begin
  case FThumbnailsAlign of
    alLeft:
      begin
        FThumbnailsButtonsRect.Left := 0;
        FThumbnailsButtonsRect.Top := 0;
        FThumbnailsButtonsRect.Right := FThumbnailsHeight - 1;
        FThumbnailsButtonsRect.Bottom := FThumbnailsButtonHeight * fDicomDatasetsList.Count - 1; // FThumbnailsHeight;

        FThumbnailsIconsRect.Left := 0;
        FThumbnailsIconsRect.Top := 21 * fDicomDatasetsList.Count;
        FThumbnailsIconsRect.Right := FThumbnailsHeight - 1;
        FThumbnailsIconsRect.Bottom := Height - 1 - 28;
        if FThumbnailsScrollBar <> nil then
        begin
          FThumbnailsScrollBar.Orientation := vgHorizontal;
          FThumbnailsScrollBar.Position.X := FThumbnailsIconsRect.Left;
          FThumbnailsScrollBar.Position.Y := FThumbnailsIconsRect.Bottom;
          FThumbnailsScrollBar.Width := FThumbnailsHeight;
          FThumbnailsScrollBar.Height := 28;
        end;
      end;
    alRight:
      begin
        FThumbnailsButtonsRect.Left := Width - FThumbnailsHeight;
        FThumbnailsButtonsRect.Top := 0;
        FThumbnailsButtonsRect.Right := Width - 1;
        FThumbnailsButtonsRect.Bottom := FThumbnailsButtonHeight * fDicomDatasetsList.Count - 1; //FThumbnailsHeight;

        FThumbnailsIconsRect.Left := Width - FThumbnailsHeight;
        FThumbnailsIconsRect.Top := 21 * fDicomDatasetsList.Count;
        FThumbnailsIconsRect.Right := Width - 1;
        FThumbnailsIconsRect.Bottom := Height - 1 - 28;

        if FThumbnailsScrollBar <> nil then
        begin
          FThumbnailsScrollBar.Orientation := vgHorizontal;
          FThumbnailsScrollBar.Position.X := FThumbnailsIconsRect.Left;
          FThumbnailsScrollBar.Position.Y := FThumbnailsIconsRect.Bottom;
          FThumbnailsScrollBar.Width := FThumbnailsHeight;
          FThumbnailsScrollBar.Height := 28;
        end;
      end;
    alTop:
      begin
        FThumbnailsButtonsRect.Left := 0;
        FThumbnailsButtonsRect.Top := 0;
        FThumbnailsButtonsRect.Right := FThumbnailsHeight - 1;
        FThumbnailsButtonsRect.Bottom := FThumbnailsHeight - 1;

        FThumbnailsIconsRect.Left := FThumbnailsHeight;
        FThumbnailsIconsRect.Top := 0;
        FThumbnailsIconsRect.Right := Width - 1 - 28;
        FThumbnailsIconsRect.Bottom := FThumbnailsHeight - 1;
        if FThumbnailsScrollBar <> nil then
        begin
          FThumbnailsScrollBar.Orientation := vgVertical;
          FThumbnailsScrollBar.Position.X := FThumbnailsIconsRect.Right;
          FThumbnailsScrollBar.Position.Y := FThumbnailsIconsRect.Top;
          FThumbnailsScrollBar.Width := 28;
          FThumbnailsScrollBar.Height := FThumbnailsHeight;
        end;
      end;
    alBottom:
      begin
        FThumbnailsButtonsRect.Left := 0;
        FThumbnailsButtonsRect.Top := Height - FThumbnailsHeight;
        FThumbnailsButtonsRect.Right := FThumbnailsHeight - 1;
        FThumbnailsButtonsRect.Bottom := Height - 1;

        FThumbnailsIconsRect.Left := FThumbnailsHeight;
        FThumbnailsIconsRect.Top := Height - FThumbnailsHeight;
        FThumbnailsIconsRect.Right := Width - 1 - 28;
        FThumbnailsIconsRect.Bottom := Height - 1;

        if FThumbnailsScrollBar <> nil then
        begin
          FThumbnailsScrollBar.Orientation := vgVertical;
          FThumbnailsScrollBar.Position.X := FThumbnailsIconsRect.Right;
          FThumbnailsScrollBar.Position.Y := FThumbnailsIconsRect.Top;
          FThumbnailsScrollBar.Width := 28;
          FThumbnailsScrollBar.Height := FThumbnailsHeight;
        end;
      end;
  end;

  Result.Left := FThumbnailsButtonsRect.Left;
  Result.Top := FThumbnailsButtonsRect.Top;
  Result.Right := FThumbnailsIconsRect.Right - 1;
  Result.Bottom := FThumbnailsIconsRect.Bottom - 1;

  FThumbnailsRect := Result;

  if FThumbnailsAlign in [alTop, alBottom] then
    FThumbnailsIconsLength := Trunc((Width - FThumbnailsIconsRect.Left) / FThumbnailsHeight)
  else
    FThumbnailsIconsLength := Trunc((Height - FThumbnailsIconsRect.Top) / FThumbnailsHeight);

  //  FThumbnailsScrollBar.Enabled := false;
end;

function TvxDicomView.PointInRect(x, y: Single; ARect: TvxRect): Boolean;
begin
  if ((X > ARect.Left) and (X < ARect.Right)) and
    ((Y > ARect.Top) and (Y < ARect.Bottom)) then
  begin
    Result := True;
  end
  else
    Result := false;
end;

procedure TvxDicomView.SetOnViewSelected(const Value: TNotifyEvent);
begin
  FOnViewSelected := Value;
end;

procedure TvxDicomView.DblClick;
var
  i: integer;
  das1: TCnsDMTable;
begin
  if PointInRect(DownMousePos.X, DownMousePos.Y, StudyRect.fStudyRect) then
  begin
    if FFullScreenInSeries then
    begin
      if (fActiveSeries <> nil) and (fActiveSeries.DicomDatasets <> nil) then
      begin
        if fActiveSeries.fOldGridFormatBeforeFullScreen = '' then
        begin
          fActiveSeries.FOldCurrentImageIndexBeforeFullScreen := fActiveSeries.FCurrentImageIndex;

          fActiveSeries.fOldGridFormatBeforeFullScreen := fActiveSeries.GridFormat;
          i := fActiveSeries.FCurrentImageIndex;
          fActiveSeries.FOldImageIndexBeforeFullScreen := fActiveSeries.fImageRectList.IndexOf(fActiveSeries.ActiveRect);

          fActiveSeries.GridFormat := 'STANDARD\1,1';
          fActiveSeries.CurrentImageIndex := fActiveSeries.FOldImageIndexBeforeFullScreen + i;
        end
        else
        begin
          fActiveSeries.GridFormat := fActiveSeries.fOldGridFormatBeforeFullScreen;
          fActiveSeries.CurrentImageIndex := fActiveSeries.FCurrentImageIndex - fActiveSeries.FOldImageIndexBeforeFullScreen;

          fActiveSeries.fOldGridFormatBeforeFullScreen := '';
        end;
      end;
    end
    else
    begin
      if FFullScreenSeries = nil then
      begin
        if (fActiveSeries <> nil) and (fActiveSeries.DicomDatasets <> nil) and (fActiveImage <> nil)
          and (fActiveImage.DicomDataset <> nil) then
        begin
          FOldSeriesBeforeFullScreen := fActiveSeries;
          FOldImageIndexBeforeFullScreen := fActiveImage.ImageIndex;

          FFullScreenSeries := TSeriesRect.Create(fStudyRect);
          FFullScreenSeries.SetBound(fStudyRect.fStudyRect);
          FFullScreenSeries.SetData(fActiveSeries.DicomDatasets, fActiveSeries.SeriesUID,
            fActiveSeries.SeriesIndex,
            fActiveSeries.FCurrentImageIndex + fActiveImage.ImageIndex);
        end;
      end
      else
      begin
        if FOldSeriesBeforeFullScreen <> nil then
        begin
          FOldSeriesBeforeFullScreen.SetData(FFullScreenSeries.DicomDatasets, FFullScreenSeries.SeriesUID,
            FFullScreenSeries.SeriesIndex,
            FFullScreenSeries.FCurrentImageIndex - FOldImageIndexBeforeFullScreen)
        end;

        FFullScreenSeries.Free;
        FFullScreenSeries := nil;
      end;
    end;
  end
  else
    if PointInRect(DownMousePos.X, DownMousePos.Y, FThumbnailsIconsRect) then
  begin
    if ShowSeriesThumbnailOnly then
    begin
      das1 := TCnsDMTable(fDicomDatasetsList[fActiveThumbnails]);
      if FThumbnailsAlign in [alTop, alBottom] then
        fThumbnailDrag := fThumbnailStart + Trunc((DownMousePos.X - FThumbnailsIconsRect.Left) / FThumbnailsHeight)
      else
        fThumbnailDrag := fThumbnailStart + Trunc((DownMousePos.Y - FThumbnailsIconsRect.Top) / FThumbnailsHeight);
      if das1.GetSeriesCount > fThumbnailDrag then
      begin
        i := das1.GetCurrentSeriesStart(das1.SeriesDataset[fThumbnailDrag]);
      end
      else
        exit;
    end
    else
      i := 0;
    if i >= 0 then
    begin
      ShowSeriesThumbnailOnly := not ShowSeriesThumbnailOnly;

      fThumbnailStart := i;

      if FThumbnailsScrollBar <> nil then
      begin
        fSetScrolllbarValue := true;
        FThumbnailsScrollBar.Value := fThumbnailStart;
      end;
    end;
  end;
  Redraw(true);
end;

procedure TvxDicomView.SetSynchronizationAfterMouseMove(
  const Value: Boolean);
begin
  FSynchronizationAfterMouseMove := Value;
end;

procedure TvxDicomView.ResetImageZoom;
var
  i, k: Integer;
  das1: TCnsDMTable;
  da1: TDicomDataset;
begin
  for i := 0 to fDicomDatasetsList.Count - 1 do
  begin
    das1 := TCnsDMTable(fDicomDatasetsList[i]);
    for k := 0 to das1.Count - 1 do
    begin
      da1 := das1[k];
      da1.Attributes.ImageData.ResetZoom;
    end;
  end;

  Redraw;
end;

procedure TvxDicomView.EnterFocus;
begin
  inherited;

end;

procedure TvxDicomView.KillFocus;
begin
  inherited;
  RemoveHint;
  ReDraw(true);
end;

procedure TvxDicomView.SetScrollSynchronization(
  const Value: TImageScrollSynchronization);
begin
  FScrollSynchronization := Value;
end;

procedure TvxDicomView.SetScrollSynchronizationOnlySameStudy(
  const Value: Boolean);
begin
  FScrollSynchronizationOnlySameStudy := Value;
end;

procedure TvxDicomView.SetStackOptions(const Value: TImageStackOptions);
begin
  FStackOptions := Value;
end;

procedure TvxDicomView.SetWindowsLevelingOptions(
  const Value: TImageWindowsLevelingOptions);
begin
  FWindowsLevelingOptions := Value;
end;

procedure TvxDicomView.DoActiveImageChange(aActiveImage: TImageRect);
var
  //da2: TDicomAttribute;
  k, k2: Integer;
  //f1: Double;
  o1: TDicomDrawObject;
begin
  if (fActiveSeries <> nil) and (fActiveSeries.DicomDatasets <> nil)
    and (aActiveImage <> nil) and (aActiveImage.FDicomDataset <> nil) then
  begin
    if RefrenceLineOptions <> irloNotShow then
    begin
      if (StudyRect.fSeriesRectList.Count > 1) then
      begin
        fActiveSeries.DicomDatasets.ClearTopoLine(aActiveImage.FDicomDataset.Attributes);
        fActiveSeries.DicomDatasets.ClearTopo;

        for k := 0 to StudyRect.fSeriesRectList.Count - 1 do
          if (fActiveSeries <> StudyRect.Items[k]) then
          begin
            if StudyRect.Items[k].ActiveRect.DicomDataset <> nil then
            begin
              if StudyRect.Items[k].ActiveRect.DicomDataset.Attributes.GetString($20, $D) <>
                aActiveImage.DicomDataset.Attributes.GetString($20, $D) then
                continue;

              fActiveSeries.DicomDatasets.SetTopoDataset(StudyRect.Items[k].ActiveRect.DicomDataset.Attributes);
            end;
            if RefrenceLineOptions = irloFirstLast then
            begin
              //n1.DicomDatasets.ClearTopoLine;
              //n1.DicomDatasets.ClearTopo;
              fActiveSeries.DicomDatasets.ScanSeriesFLTopoDataset(aActiveImage.DicomDataset.Attributes, false)
            end
            else
              if RefrenceLineOptions = irloCurrentSeries then
            begin

              fActiveSeries.DicomDatasets.ScanSeriesTopoDataset(aActiveImage.DicomDataset.Attributes, false);
            end
            else
              if RefrenceLineOptions = irloAllImages then
            begin

              fActiveSeries.DicomDatasets.ScanSeriesTopoDataset(aActiveImage.DicomDataset.Attributes, false);
            end;

            //irloCurrentImage

            o1 := fActiveSeries.DicomDatasets.AddTopoDataset(aActiveImage.DicomDataset,
              aActiveImage.FImageIndex, false);
            //if o1 <> nil then
            //  o1.UserText := '';
            if o1 <> nil then
            begin
              //o1.UserText := '';
              //o1.PenColor := clRed;
              o1.PenColor := clGreen;
            end;
          end;
      end;
    end
    else
    begin
      fActiveSeries.DicomDatasets.ClearTopoLine(nil);
      fActiveSeries.DicomDatasets.ClearTopo;
    end;

    if (FScrollSynchronization <> issManual) and (LeftMouseInteract <> mi3DCursor)
      and (RightMouseInteract <> mi3DCursor) and (fActiveSeries.Items[0].DicomDataset <> nil) then
    begin
      {$IFDEF DICOMDEBUX1}
      //SendDebug(Format('DoActiveImageChange %d', [aActiveImage.FImageIndex]));
      {$ENDIF}

      for k := 0 to StudyRect.fSeriesRectList.Count - 1 do
      begin
        //if (not FScrollSynchronizationOnlySameStudy) and (StudyRect.Items[k].DicomDatasets <> fActiveSeries.DicomDatasets) then
        //  continue;
        if (StudyRect.Items[k] <> fActiveSeries) then
        begin
          case FScrollSynchronization of
            issPatientPosition:
              begin
                k2 := StudyRect.Items[k].DicomDatasets.FindSliceLocationOnSeries(
                  StudyRect.Items[k].SeriesUID, fActiveSeries.Items[0].DicomDataset);
                if k2 >= 0 then
                begin
                  StudyRect.Items[k].CurrentImageIndex := k2 - StudyRect.Items[k].DicomDatasets.GetSeriesStart(StudyRect.Items[k].SeriesUID);
                end;
              end;
            issImageIndex:
              begin
                //k2 := StudyRect.Items[k].DicomDatasets.FindSeriesIndexOnSeries(
                //  StudyRect.Items[k].SeriesUID, fActiveSeries.Items[0].DicomDataset);

                StudyRect.Items[k].CurrentImageIndex := fActiveSeries.CurrentImageIndex;
              end;
            issImageTime:
              begin
                k2 := StudyRect.Items[k].DicomDatasets.FindSeriesImageTimeOnSeries(
                  StudyRect.Items[k].SeriesUID, fActiveSeries.Items[0].DicomDataset);
              end;
            issImageAcquisitionTime:
              begin
                k2 := StudyRect.Items[k].DicomDatasets.FindSeriesAcquisitionTimeOnSeries(
                  StudyRect.Items[k].SeriesUID, fActiveSeries.Items[0].DicomDataset);
              end;
          else
            k2 := -1;
          end;
        end;
      end;
    end;

    if assigned(FOnViewSelected) then
      FOnViewSelected(self);
  end;
end;

procedure TvxDicomView.SetRefrenceLineOptions(
  const Value: TImageRefrenceLineOptions);
begin
  FRefrenceLineOptions := Value;
  if (fActiveSeries <> nil) and (fActiveSeries.DicomDatasets <> nil) then
  begin
    if FRefrenceLineOptions = irloAllImages then
    begin

    end
    else
    begin
      fActiveSeries.DicomDatasets.ClearTopoLine(nil);
      fActiveSeries.DicomDatasets.ClearTopo;
    end;
    redraw(true);
  end;
end;

procedure TvxDicomView.Do3DCursorEnd;
var
  z1: Integer;
  Image1: TImageRect;
  Series1: TSeriesRect;

begin
  for z1 := 0 to StudyRect.fSeriesRectList.Count - 1 do
  begin
    Series1 := StudyRect.Items[z1];
    Series1.ActiveRect.PositionCursorPosition := vgPoint(0, 0);
  end;

  if assigned(FOn3DCursorEnd) then
    FOn3DCursorEnd(self);

  Redraw; //(true);
end;

procedure TvxDicomView.Do3DCursorMove(X, Y: Double);
var
  l1: TStructLine2D;
  lines1: array of TStructLine2D;
  cross1: array of Double;

  length_sel: Double;
  //  radio_sel: Double;

  k1, k2, i, kshort: Integer;
  str1: string;
  das1: TDicomDatasets;

  p, CrossP: TStructMatrix2D;
  d1, d2, d3, d4: Double;
  dm1, dm2: TDicomImage;
  v: TStructMatrix2D;

  z1: Integer;

  da1, da2: TDicomAttribute;

  Image1, Image2: TImageRect;
  Series1: TSeriesRect;

begin
  {$IFDEF DICOMDEBUGZ1}
  SendDebug('DicomMultiViewer13DCursorStart');
  {$ENDIF}

  if assigned(fOn3DCursorMove) then
    fOn3DCursorMove(self, X, Y);

  fActiveImage.PositionCursorPosition := vgPoint(round(X), round(Y));
  //fActiveImage.Invalidate;

  for z1 := 0 to StudyRect.fSeriesRectList.Count - 1 do
  begin
    Series1 := StudyRect.Items[z1];
    if Series1.FDicomDatasets = nil then
      continue;
    Image1 := Series1.ActiveRect;
    if Series1.ActiveRect <> fActiveImage then
    begin
      str1 := Series1.SeriesUID;
      das1 := Series1.DicomDatasets;
      k1 := das1.GetSeriesStart(str1);
      k2 := das1.GetSeriesEnd(str1);
      SetLength(lines1, k2 - k1 + 1);
      SetLength(cross1, k2 - k1 + 1);

      dm1 := fActiveImage.DicomDataset.Attributes.ImageData;
      p.x := dm1.ImageCood.XScr2Bmpf(X); //* dm1.PixelSpacingX * 10;
      p.y := dm1.ImageCood.YScr2Bmpf(Y); //* dm1.PixelSpacingY * 10;

      for i := 0 to k2 - k1 do
      begin
        lines1[i] := ComputeIntersectLine(das1[i + k1].Attributes, fActiveImage.DicomDataset.Attributes);
        if (abs(lines1[i].P0.x - lines1[i].P1.x) > 0.01) or (abs(lines1[i].P0.y - lines1[i].P1.y) > 0.01) then
        begin
          lines1[i].Length := dist_Point_to_Segment(p, lines1[i], crossp, d2);
          cross1[i] := d2;
          //          if lines1[i].Length>
          {$IFDEF DICOMDEBUGZ}
          //SendDebug(Format('%d:crossp.x=%f,crossp.y=%f,d2=%f,Length=%f', [i, crossp.x, crossp.y, d2, lines1[i].Length]));
          {$ENDIF}
        end
        else
        begin
          lines1[i].Length := -1;
          cross1[i] := -1;
        end;
      end;

      d1 := 99999; //lines1[0].Length;
      kshort := -1;
      for i := 0 to k2 - k1 do
      begin
        if (lines1[i].Length >= 0) and (lines1[i].Length < d1) then
        begin
          d1 := lines1[i].Length;
          kshort := i;
        end;
      end;

      {$IFDEF DICOMDEBUGZ}
      SendDebug(Format('select %d,Length=%f', [kshort, d1]));
      {$ENDIF}

      {if (view1.ActiveView <> nil) and
        (view1.ActiveView.Attributes <> nil) then
      begin
        viewer1 := view1.ActiveView;
      end
      else
        if (view1.Count > 0) and (view1.Items[0].Attributes <> nil) then
      begin
        viewer1 := View1.Items[0];
      end
      else
        continue;}

      if kshort <> -1 then
      begin
        //todo
        if Series1.CurrentImageIndex <> kshort then
          Series1.CurrentImageIndex := kshort - Series1.fImageRectList.IndexOf(Series1.ActiveRect);

        l1 := ComputeIntersectLine(fActiveImage.DicomDataset.Attributes, Image1.DicomDataset.Attributes);
        v := pointSub(l1.P1, l1.P0);
        if (v.x <> 0) or (v.y <> 0) then
        begin
          //length_sel := dist_Point_to_Segment(p, l1, v, d2);

          d2 := cross1[kshort];
          v := pointAdd(l1.P0, pointMultiply(v, d2));

          {$IFDEF DICOMDEBUGZ}
          //SendDebug(Format('point: v.x=%f,v.y=%f,length=%f,radio = %f', [v.x, v.y,length_sel, d2]));
          {$ENDIF}

          Image1.PositionCursorPosition :=
            vgPoint(Image1.DicomDataset.Attributes.ImageData.ImageCood.XBmp2Scrf(v.x),
            Image1.DicomDataset.Attributes.ImageData.ImageCood.YBmp2Scrf(v.y));
          //viewer1.Invalidate;

        end;
      end
      else
      begin
        k2 := Series1.DicomDatasets.FindSliceLocationOnSeries(Series1.SeriesUID,
          fActiveImage.DicomDataset);
        if k2 >= 0 then
        begin
          Series1.CurrentImageIndex := k2 - Series1.DicomDatasets.GetSeriesStart(Series1.SeriesUID);
        end;

        v := ComputeAxPosition(fActiveImage.DicomDataset.Attributes, Image1.DicomDataset.Attributes, p.X, p.Y);

        Image1.PositionCursorPosition :=
          vgPoint(Image1.DicomDataset.Attributes.ImageData.ImageCood.XBmp2Scrf(v.x),
          Image1.DicomDataset.Attributes.ImageData.ImageCood.YBmp2Scrf(v.y));
        //viewer1.Invalidate;
      end;
    end;
  end;
  Redraw();
end;

function TvxDicomView.DoSetPresetWidthLevel(Shift: TShiftState; AKey: Integer): Boolean;
var
  w1, l1: Integer;
  str1: string;
begin
  Result := false;
  str1 := HotKeyToText(AKey, true);
  if (PresetTable <> nil) and PresetTable.Locate('HOTKEY', VarArrayOf([str1]), []) then
  begin
    l1 := PresetTable.FieldByName('WINDOWS_LEVEL').AsInteger;
    w1 := PresetTable.FieldByName('WINDOW_WIDTH').AsInteger;
  end
  else
  begin
    w1 := 0;
    l1 := 0;
  end;
  if assigned(FOnSetPresetWidthLevel) then
  begin
    FOnSetPresetWidthLevel(self, Akey, Shift, w1, l1);
  end;
  if (w1 <> 0) and (l1 <> 0) then
  begin
    SetWinLevel(w1, l1);
    Result := true;
  end;
end;

function TvxDicomView.GetCanLockImage: Boolean;
begin
  Result := true;
  if assigned(FOnCanLock) then
    FOnCanLock(self, Result);
end;

procedure TvxDicomView.SetClassifyBySeriesUID(const Value: Boolean);
begin
  StudyRect.ClassifyBySeriesUID := Value;
end;

procedure TvxDicomView.DrawBoxInserting(ARect: TImageRect);
var
  R_dst: TvxRect;
begin
  R_dst.Left := min(ARect.fInseringBox.Left, ARect.fInseringBox.Right);
  R_dst.Top := min(ARect.fInseringBox.Top, ARect.fInseringBox.Bottom);
  R_dst.Right := max(ARect.fInseringBox.Left, ARect.fInseringBox.Right);
  R_dst.Bottom := max(ARect.fInseringBox.Top, ARect.fInseringBox.Bottom);

  Canvas.DrawRect(R_dst, 0, 0, [vgCornerTopLeft, vgCornerBottomRight], 1);
end;

procedure TvxDicomView.SetLeaderMouserInspect(
  const Value: TLeaderMouserInspect);
begin
  fLeaderMouserInspect := Value;
end;

function TvxDicomView.GetLeaderMouserInspect: TLeaderMouserInspect;
begin
  Result := fLeaderMouserInspect;
end;

procedure TvxDicomView.DoDrawObjectMove(Sender: TObject);
var
  das: TDicomAttributes;
  AObject: TDicomDrawObject;
begin
  AObject := TDicomDrawObject(Sender);
  das := fActiveImage.DicomDataset.Attributes;

  UpdateObjectText(das, AObject);

  if assigned(fAfterObjectMove) then
    fAfterObjectMove(das, AObject);
end;

procedure TvxDicomView.DoDrawObjectSize(Sender: TObject);
var
  das: TDicomAttributes;
  AObject: TDicomDrawObject;
begin
  AObject := TDicomDrawObject(Sender);
  das := fActiveImage.DicomDataset.Attributes;

  UpdateObjectText(das, AObject);

  if assigned(fAfterObjectSize) then
    fAfterObjectSize(das, AObject);
end;

procedure TvxDicomView.UpdateObjectText(das: TDicomAttributes; AObject: TDicomDrawObject);
var
  //  das: TDicomAttributes;
  da1: TDicomAttribute;
  av, sd, ar: double;
  lx, ly, cx: Double;
begin

  case AObject.Kind of

    ldmiROI_Cycle, ldmiROI_Rect:
      begin
        AObject.CalAverage(av, sd, ar);
        AObject.CalText := Format('AV:%4.2f' + #13#10 + 'SD:%4.2f' + #13#10 +
          'AR:%4.2f', [av, sd, ar]);
      end;
    ldmiPolyonA:
      begin

        AObject.CalText := AObject.Calc2Text;
      end;
    ldmiPolyonV:
      begin

        AObject.CalText := AObject.Calc2Text;
      end;
    ldmiAngle:
      begin

        AObject.CalText := AObject.Calc2Text;
      end;
    ldmiRulerCalc:
      begin
        AObject.CalText := AObject.Calc2Text;
        lx := abs(AObject.x[0] - AObject.x[1]);
        ly := abs(AObject.y[0] - AObject.y[1]);
        cx := sqrt(lx * lx + ly * ly);
        if cx > 0 then
        begin
          av := AObject.CalLength / cx;
          //AObject.UserText := Format('%f10.2MM', [n1.CalLength]);
          if av > 0 then
          begin
            das.ImageData.PixelSpacingX := av;
            das.ImageData.PixelSpacingY := av;
            da1 := das.Add($0028, $0030);
            da1.AsFloat[0] := av;
            da1.AsFloat[1] := av;
            das.ImageData.UpdateCood(av, av);
            //Invalidate;
          end;
        end;
      end;
  else
    begin
      if AObject.Name <> '' then
      begin
        //ExecuteSubroutine('SetMeasureValue', [AObject.Name, AObject.Tag, AObject.CalcLength, 0, 0, AObject.RelateFrameIndex]);
      end;
      AObject.CalText := AObject.Calc2Text;
    end;
  end;
end;

procedure TvxDicomView.DoFinishNewDrawObject(Sender: TObject);
var
  das: TDicomAttributes;
  AObject: TDicomDrawObject;
begin
  AObject := TDicomDrawObject(Sender);
  das := fActiveImage.DicomDataset.Attributes;

  if (AObject.Kind = ldmiText) and (fDefaultUserText <> '') then
  begin
    AObject.UserText := fDefaultUserText;
    fDefaultUserText := '';
  end;

  if (ModalityTable <> nil) and (ModalityTable.FindField('PEN_COLOR') <> nil) then
    if ModalityTable.Locate('Modality', das.GetString($8, $60), [])
      then
    begin
      AObject.PenColor := ModalityTable.FieldByName('PEN_COLOR').AsInteger;
      AObject.Font.Color := ModalityTable.FieldByName('FONT_COLOR').AsInteger;
    end;

  UpdateObjectText(das, AObject);

  if assigned(fAfterNewDrawObject) then
    fAfterNewDrawObject(das, TDicomDrawObject(Sender));
end;

procedure TvxDicomView.SetFullScreenInSeries(const Value: Boolean);
begin
  FFullScreenInSeries := Value;
end;

procedure TvxDicomView.UpdateMagnifier(x, y: Double);
var
  xx, yy: Integer;
begin
  if fMagnifierView = nil then
  begin
    case FMagnifierViewShape of
      mvsCircle:
        begin
          fMagnifierView := TvxCircle.Create(self);
        end;
      mvsRectangle:
        begin
          fMagnifierView := TvxRectangle.Create(self);
        end;
      mvsBlurRectangle:
        begin
          fMagnifierView := TvxBlurRectangle.Create(self);
        end;
      mvsBlurRoundRect:
        begin
          fMagnifierView := TvxBlurRoundRect.Create(self);
        end;
    end;
    fMagnifierView.Width := 128;
    fMagnifierView.Height := 128;
    fMagnifierView.CanFocused := false;
    //fMagnifierView.Enabled := false;
    AddObject(fMagnifierView);
  end;
  fMagnifierView.Position.X := x - fMagnifierView.Width / 2;
  fMagnifierView.Position.Y := y - fMagnifierView.Height / 2;
end;

procedure TvxDicomView.RemoveMagnifier;
begin
  if fMagnifierView <> nil then
  begin
    fMagnifierView.Free;
    fMagnifierView := nil;
  end;
end;

procedure TvxDicomView.RemoveHint;
begin
  if fWHint <> nil then
  begin
    fWHint.Free;
    fWHint := nil;
  end;
end;

procedure TvxDicomView.UpdateHint(x, y: Double);
var
  xx, yy: Integer;

  Image1: TImageRect;
  Series1: TSeriesRect;
begin
  if fWHint = nil then
  begin
    fWHint := TvxLabel.Create(self);
    fWHint.Font.Size := 12;
    //    fWHint.FontFill.
    fWHint.FontFill.SolidColor := vgColorFromVCL(clRed);
    fWHint.AutoSize := true;
    fWHint.AutoTranslate := false;
    AddObject(fWHint);
  end;

  Series1 := fStudyRect.GetActiveRect(X, Y);
  if Series1 <> nil then
    Image1 := Series1.GetActiveRect(X, Y)
  else
    Image1 := nil;
  if (Image1 <> nil) and (Image1.DicomDataset <> nil) and (Image1.DicomDataset.Attributes.ImageData <> nil) then
  begin
    xx := Round(Image1.DicomDataset.Attributes.ImageData.ImageCood.XScr2Bmpf(x));
    yy := Round(Image1.DicomDataset.Attributes.ImageData.ImageCood.YScr2Bmpf(y));
    if (xx > 0) and (yy > 0) then
    begin
      if assigned(Image1.DicomDataset.Attributes) then
        fWHint.text := Format('(%d,%d)=%s',
          [xx, yy, Image1.DicomDataset.Attributes.ImageData.GetPointValue(xx - 1, yy - 1)])
      else
        fWHint.text := 'NOT SUPORT';

      if (X + fWHint.Width) < Image1.fImageRect.Right then
        fWHint.Position.X := X + 8
      else
        fWHint.Position.X := X - fWHint.Width;
      if (Y + fWHint.Height) < Image1.fImageRect.Bottom then
        fWHint.Position.Y := Y + 8
      else
        fWHint.Position.Y := Y - fWHint.Height;
      //fWHint.Show;
      //fWHint.Paint;
    end;
  end;
end;

procedure TvxDicomView.CancelInteracts;
begin
  RemoveTextEdit;
  //  Update;
end;

procedure TvxDicomView.TextEditKeyDown(Sender: TObject; var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_ESCAPE:
      begin
        // we must set this to 0 to skip parent handlers that cause GPF when fTextEdit gets freed.
        Key := 0;
        //SendMessage((Sender as TvxMemo).Handle, WM_UNDO, 0, 0);
        CancelInteracts;
      end;
    VK_RETURN:
      begin
        if not (ssCtrl in Shift) then
        begin
          Key := 0;
          CancelInteracts;
        end;
      end;
  end;
end;

procedure TvxDicomView.ActiveTextEdit;
var
  N1: TDicomDrawObject;
begin
  if assigned(ActiveImage) and assigned(ActiveImage.DicomDataset) and assigned(ActiveImage.DicomDataset.Attributes.ImageData) then
  begin
    n1 := ActiveImage.DicomDataset.Attributes.ImageData.DrawObjects.NewDrawObject;
    if n1 <> nil then
    begin
      if n1.Kind = ldmiText then
      begin
        if fTextEdit <> nil then
          fTextEdit.free; // ..!!!
        fTextEdit := TvxMemo.Create(self);
        AddObject(fTextEdit);

        UpdateTextEdit;
        //windows.SetFocus(fTextEdit.handle);
        fTextEdit.SetFocus;

        fTextEdit.OnKeyDown := TextEditKeyDown;
        fTextEdit.OnKillFocus := TextEditExit;
        exit;
      end;
    end;
  end;
end;

procedure TvxDicomView.RemoveTextEdit;
var
  N1: TDicomDrawObject;
begin
  if assigned(ActiveImage) and assigned(ActiveImage.DicomDataset) and assigned(ActiveImage.DicomDataset.Attributes.ImageData) then
  begin
    n1 := ActiveImage.DicomDataset.Attributes.ImageData.DrawObjects.NewDrawObject;
    if n1 <> nil then
    begin
      if n1.Kind = ldmiText then
      begin
        fTextEdit.OnKeyDown := nil;
        n1.UserText := fTextEdit.Text;
        RemoveObject(fTextEdit); //.free;
        fTextEdit := nil;
        if not (csDestroying in ComponentState) then
          SetFocus;
        //    DoVectorialChanged;
        //Invalidate;
        exit;
      end;
    end;
  end;
  if assigned(fTextEdit) then
    RemoveObject(fTextEdit);
end;

procedure TvxDicomView.UpdateTextEdit;
var
  //  xx1, yy1, xx2, yy2: integer;
//  R: TRect;
  N1: TDicomDrawObject;
begin
  if (fTextEdit = nil) then
    exit;
  if assigned(ActiveImage) and assigned(ActiveImage.DicomDataset) and assigned(ActiveImage.DicomDataset.Attributes.ImageData) then
  begin
    n1 := ActiveImage.DicomDataset.Attributes.ImageData.DrawObjects.NewDrawObject;
    if n1 <> nil then
    begin
      if n1.Kind = ldmiText then
      begin
        with fTextEdit do
        begin
          Position.X := trunc(Min(n1.ScrX[0], n1.ScrX[1]));
          Position.Y := trunc(Min(N1.ScrY[0], n1.ScrY[1]));
          Height := abs(n1.ScrY[0] - n1.ScrY[1]);
          Width := abs(n1.ScrX[0] - n1.ScrX[1]);
          //Color := clWhite;
          Lines.Text := N1.UserText;
        end;
        exit;
      end;
    end;
  end;
end;

procedure TvxDicomView.TextEditExit(Sender: TObject);
begin
  if assigned(fTextEdit) then
  begin
    //RemoveTextEdit;
  end;
end;

function TvxDicomView.LoadImages(AHost: string; APort: Integer; AName,
  AStudyUID: string; ALock, AOnlyLoadKeyImage: Boolean): Boolean;
var
  n1: TNetworkQueueItem;
  das1: TCnsDMTable;
begin
  Result := false;

  das1 := FindDicomDataset(AStudyUID);
  if das1.Count > 0 then
    exit;

  while InitingData do
  begin
    ProcessWindowsMessageQueue;
    if Application.Terminated then
      exit
  end;
  if not InitingData then
  begin
    //  CGetImage(AStudyUID);
    n1 := AddQueueItem;
    n1.PatientName := AName;
    n1.StudyUID := AStudyUID;
    ThreadGetImage(AHost, APort, n1, n1.StudyUID, ALock, AOnlyLoadKeyImage, '');
    Result := true;
  end
  else
    ShowMessage('服务器不能连接');

end;

function TvxDicomView.MGETLoadFilmImages(AHost: string; APort: Integer;
  AName, AStudyUID: string; ALock, AOnlyLoadKeyImage: Boolean;
  APatientName, AHospitalName, APatientID: string): Boolean;
begin

end;

function TvxDicomView.MGETLoadImages(AHost: string; APort: Integer; AName,
  AStudyUID: string; ALock, AOnlyLoadKeyImage: Boolean; APatientName,
  AHospitalName, APatientID, APaperStudyUID: string): Boolean;
var
  n1: TNetworkQueueItem;
  das1: TCnsDMTable;
begin
  Result := false;

  das1 := FindDicomDataset(AStudyUID);
  if das1.Count > 0 then
    exit;

  while InitingData do
  begin
    ProcessWindowsMessageQueue;
    if Application.Terminated then
      exit
  end;

  if not InitingData then
  begin
    //  CGetImage(AStudyUID);
    n1 := AddQueueItem;
    n1.PatientName := AName;
    n1.PatientID := APatientID;
    n1.StudyUID := AStudyUID;
    n1.FromOrTo := AHost + ':' + IntToStr(APort);

    //if AHospitalName <> '' then
    n1.HospitalName := AHospitalName;
    //else
    //  n1.HospitalName := dcm32.UserHospitalName;

    //if APatientName <> '' then
    n1.PatientCName := APatientName;
    {else
      if AName <> '' then
      n1.PatientCName := AName;}

    ThreadMGetImage(AHost, APort, n1, n1.StudyUID, ALock, AOnlyLoadKeyImage, APaperStudyUID);
    Result := true;
  end
  else
    ShowMessage('服务器不能连接');
end;

function TvxDicomView.WadoLoadImages(AHost: string; APort: Integer; AName,
  AStudyUID, ATranferSyntax, ALevel: string; ALock,
  AOnlyLoadKeyImage: Boolean): Boolean;
var
  n1: TNetworkQueueItem;
  das1: TCnsDMTable;
begin
  Result := false;

  das1 := FindDicomDataset(AStudyUID);
  if das1.Count > 0 then
    exit;

  while InitingData do
  begin
    ProcessWindowsMessageQueue;
    if Application.Terminated then
      exit
  end;
  if not InitingData then
  begin
    //  CGetImage(AStudyUID);
    n1 := AddQueueItem;
    n1.PatientName := AName;
    n1.StudyUID := AStudyUID;
    ThreadWadoImage(AHost, APort, n1, Format('http://%s:%d', [AHost, APort]), n1.StudyUID,
      ATranferSyntax, ALevel, ALock, AOnlyLoadKeyImage, '');
    Result := true;
  end
  else
    ShowMessage('服务器不能连接');
end;

function TvxDicomView.InitData(AMode: Integer): Boolean;
begin
  case AMode - 10 of
    2:
      BuildAllDatasetViaWadoPost; //internet mode
    //5:
    //  BuildAllDatasetFromLocal; //from file
  else //1,3,4
    BuildAllDataset; //dicom connect mode
  end;
end;

procedure TvxDicomView.SetOnIconReceive(
  const Value: TCnsDicomConnectionIconImagesEvent);
begin
  FOnIconReceive := Value;
end;

procedure TvxDicomView.SetOnReceive(
  const Value: TCnsDicomConnectionNewImageEvent);
begin
  FOnReceive := Value;
end;

function TvxDicomView.GetDicomDatasetsCount: Integer;
begin
  Result := fDicomDatasetsList.Count;
end;

function TvxDicomView.GetDicomDatasets(index: Integer): TDicomDatasets;
begin
  Result := TDicomDatasets(fDicomDatasetsList[index]);
end;

procedure TvxDicomView.Redraw(AFull: Boolean = false);
begin
  //inc(fUpdateCount);
  if AFull then
  begin
    //fResized := true;
    DrawRect := vgRect(0, 0, Width, Height);
    InvalidateRect(DrawRect);
  end
  else
  begin
    DrawRect := StudyRect.fStudyRect;
    InvalidateRect(DrawRect);
  end;
  {$IFDEF DICOMDEBUX1}
  //SendDebug(Format('Redraw (%f,%f)-(%f,%f)', [DrawRect.Left, DrawRect.Top, DrawRect.Right, DrawRect.Bottom]));
  {$ENDIF}
end;

procedure TvxDicomView.Realign;
begin
  inherited;
  fResized := true;
end;

function TvxDicomView.GetClassifyBySeriesUID: Boolean;
begin
  Result := StudyRect.ClassifyBySeriesUID;
end;

procedure TvxDicomView.SetDefaultUserText(const Value: string);
begin
  FDefaultUserText := Value;
end;

procedure TvxDicomView.SetMagnifierViewShape(
  const Value: TMagnifierViewShape);
begin
  FMagnifierViewShape := Value;
end;

procedure TvxDicomView.LoadLayoutFrom(das1: TDicomAttributes);
var
  das2: TDicomAttributes;
  da: TDicomAttribute;
  str1: string;
  i: Integer;
begin
  str1 := das1.GetString($2813, $1007);
  if str1 = 'DX' then
  begin
    da := das1.Item[$2813, $1002];

    if (da <> nil) and (da.GetCount > 0) then
    begin
      das2 := da.Attributes[0];
      StudyRect.GridFormat := das2.GetString($2813, $1007);
      StudyRect.ClassifyBySeriesUID := das2.GetInteger($2813, $1006) = 1;

      if (da.GetCount > 1) and (StudyRect.fSeriesRectList.Count > 1) then
        for i := 1 to da.GetCount - 1 do
        begin
          das2 := da.Attributes[i];
          StudyRect.Items[i - 1].GridFormat := das2.GetString($2813, $1007);
        end;
    end;
  end;
  Redraw; //(true);
end;

procedure TvxDicomView.SaveLayoutTo(das1: TDicomAttributes);
var
  das2: TDicomAttributes;
  da: TDicomAttribute;
  i: Integer;
begin
  das1.AddVariant($2813, $1007, 'DX');

  da := das1.Add($2813, $1002);

  das2 := TDicomAttributes.Create;
  da.AddData(das2);

  das2.AddVariant($2813, $1007, StudyRect.GridFormat);

  if StudyRect.ClassifyBySeriesUID then
    das2.AddVariant($2813, $1006, 1)
  else
    das2.AddVariant($2813, $1006, 0);

  for i := 0 to StudyRect.fSeriesRectList.Count - 1 do
  begin
    das2 := TDicomAttributes.Create;
    da.AddData(das2);

    das2.AddVariant($2813, $1007, StudyRect.Items[i].GridFormat);
  end;
end;

procedure TvxDicomView.SetImageOrder(const Value: TDicomDatasetSortBy);
var
  i: Integer;
  das1: TCnsDMTable;
begin
  FImageOrder := Value;
  for i := 0 to fDicomDatasetsList.Count - 1 do
  begin
    das1 := TCnsDMTable(fDicomDatasetsList[i]);
    das1.ImageOrder := Value;
  end;
end;

procedure TvxDicomView.AddInformationLabels(ADataset: TDicomDataset);
  function TestIfCanBeAdd: Boolean;
  var
    str1: string;
  begin
    Result := false;
    if InformationLabelsTable.FieldByName('ISACTIVE').AsString = 'F' then
    begin
      exit;
    end;
    str1 := InformationLabelsTable.FieldByName('MODALITY').AsString;
    if (str1 = '') then
      Result := true
    else
      if str1 = ADataset.Attributes.GetString($8, $60) then
    begin
      Result := true;
    end;
    if Result then
    begin
      str1 := InformationLabelsTable.FieldByName('MANUFACTURER').AsString;
      if (str1 = '') then
        Result := true
      else
        if str1 = ADataset.Attributes.GetString($8, $70) then
      begin
        Result := true;
      end;
      if Result then
      begin
        str1 := InformationLabelsTable.FieldByName('MODELNAME').AsString;
        if (str1 = '') then
          Result := true
        else
          if str1 = ADataset.Attributes.GetString($8, $1090) then
        begin
          Result := true;
        end;
        if Result then
        begin
          str1 := InformationLabelsTable.FieldByName('SATTIONNAME').AsString;
          if (str1 = '') then
            Result := true
          else
            if str1 = ADataset.Attributes.GetString($8, $1010) then
          begin
            Result := true;
          end;

        end;
      end;
    end;
  end;
var
  v1: TDicomInformationLabel;
begin
  if (InformationLabelsTable <> nil) and (assigned(InformationLabelsTable.FindField('MANUFACTURER')))
    and (InformationLabelsTable.RecordCount > 0) then
  begin
    InformationLabelsTable.First;
    ADataset.Attributes.ImageData.ClearInformationLabels;
    while not InformationLabelsTable.Eof do
    begin
      if TestIfCanBeAdd then
      begin
        v1 := ADataset.Attributes.ImageData.AddInformationLabel(
          InformationLabelsTable.FieldByName('W_POSITION').AsInteger,
          InformationLabelsTable.FieldByName('DISPLAY_ID').AsInteger,
          InformationLabelsTable.FieldByName('FORMATSTRING').AsString);

        v1.UID := InformationLabelsTable.FieldByName('LABEL_ID').AsInteger;
      end;

      InformationLabelsTable.Next;
    end;
  end;
end;

procedure TvxDicomView.AddInformationLabels(ADatasets: TDicomDatasets);
var
  i: integer;
begin
  for i := 0 to ADatasets.Count - 1 do
  begin
    AddInformationLabels(ADatasets[i]);
  end;
end;

procedure TvxDicomView.SetOnDragDicomDataset(
  const Value: TOnDragDicomDatasetEvent);
begin
  FOnDragDicomDataset := Value;
end;

procedure TvxDicomView.DoDragDicomDataset(Sender: TObject;
  ADicomDatasets: TDicomDatasets; ASeriesUID: string;
  ASeriesIndex, AImageindex: Integer);
var
  DicomDatasets1: TDicomDatasets;
  SeriesUID1: string;
  SeriesIndex1: Integer;
  Imageindex1: Integer;
begin
  DicomDatasets1 := ADicomDatasets;
  SeriesUID1 := ASeriesUID;
  SeriesIndex1 := ASeriesIndex;
  Imageindex1 := AImageindex;

  if assigned(FOnDragDicomDataset) then
    FOnDragDicomDataset(Sender, DicomDatasets1, SeriesUID1, SeriesIndex1, Imageindex1);

  if DicomDatasets1 <> nil then
    if ClassifyBySeriesUID then
      TSeriesRect(Sender).SetData(DicomDatasets1, SeriesUID1, SeriesIndex1, Imageindex1)
    else
    begin
      TSeriesRect(Sender).SetData(DicomDatasets1, '', 0, ADicomDatasets.GetSeriesStart(ASeriesUID) + AImageindex);
    end;
end;

procedure TvxDicomView.SetPrintDicomDatasets(const Value: TCnsDMtable);
begin
  FPrintDicomDatasets := Value;
end;

procedure TvxDicomView.SetLockIcon(const Value: Tvxbitmap);
begin
  FLockIcon := Value;
end;

procedure TvxDicomView.SetPrinterIcon(const Value: TvxBitmap);
begin
  FPrinterIcon := Value;
end;

procedure TvxDicomView.SetSelectedIcon(const Value: TvxBitmap);
begin
  FSelectedIcon := Value;
end;

function TvxDicomView.InitData(AView: TvxDicomView): Boolean;
begin
  fModalityTable := AView.fModalityTable;
  fImageEnhancementTable := AView.fImageEnhancementTable;
  fGroupTable := AView.fGroupTable;
  fDicomPrinterTable := AView.fDicomPrinterTable;

  fPresetTable := AView.fPresetTable;
  fLayoutTable := AView.fLayoutTable;
  fInfoProposalsTable := AView.fInfoProposalsTable;
  fInformationLabelsTable := AView.fInformationLabelsTable;

  DefaultClient := AView.DefaultClient;

  SelectedIcon := AView.SelectedIcon;
  PrinterIcon := AView.PrinterIcon;
  LockIcon := AView.LockIcon;

  ImageOrder := AView.ImageOrder;

  DisplayLabel := AView.DisplayLabel;
  DisplayWLLabel := AView.DisplayWLLabel;
  DisplayImagePosition := AView.DisplayImagePosition;
  DisplayRuler := AView.DisplayRuler;
  DisplayRightRuler := AView.DisplayRightRuler;
  DisplayBottomRuler := AView.DisplayBottomRuler;
  DisplayReport := AView.DisplayReport;
  ClassifyBySeriesUID := AView.ClassifyBySeriesUID;

  FullScreenInSeries := AView.FullScreenInSeries;

  MagnifierViewShape := AView.MagnifierViewShape;

  SynchronizationAfterMouseMove := AView.SynchronizationAfterMouseMove;

  ShowThumbnails := AView.ShowThumbnails;
  ThumbnailsAlign := AView.ThumbnailsAlign;
  ThumbnailsHeight := AView.ThumbnailsHeight;
  ThumbnailsRows := AView.ThumbnailsRows;
  ShowSeriesThumbnailOnly := AView.ShowSeriesThumbnailOnly;

  LeftMouseInteract := AView.LeftMouseInteract;
  RightMouseInteract := AView.RightMouseInteract;
  MouseWheelInteract := AView.MouseWheelInteract;
  LeaderMouserInspect := AView.LeaderMouserInspect;

  ImageSynchronization := AView.ImageSynchronization;
  ScrollSynchronization := AView.ScrollSynchronization;
  ScrollSynchronizationOnlySameStudy := AView.ScrollSynchronizationOnlySameStudy;
  RefrenceLineOptions := AView.RefrenceLineOptions;

  StackOptions := AView.StackOptions;
  WindowsLevelingOptions := AView.WindowsLevelingOptions;

  OnHttpGet := AView.OnHttpGet;
  OnHttpPost := AView.OnHttpPost;

end;

procedure TvxDicomView.Repaint;
begin
  //  fResized := true;
  //  DrawRect := vgRect(0, 0, Width, Height);

  inherited;
end;

function TvxDicomView.GetUpdateRect: TvxRect;
begin
  Result := inherited GetUpdateRect;
  {$IFDEF DICOMDEBUX1}
  //SendDebug(Format('GetUpdateRect (%f,%f)-(%f,%f)', [Result.Left, Result.Top, Result.Right, Result.Bottom]));
  {$ENDIF}
end;

procedure TvxDicomView.SetDrawRect(const Value: TvxRect);
var
  V1: TvxRect;
begin
  if fUpdateCount < 1 then
  begin
    fDrawRect := Value;
  end
  else
  begin
    fDrawRect.Left := Min(Value.Left, fDrawRect.Left);
    fDrawRect.Top := Min(Value.Top, fDrawRect.Top);
    fDrawRect.Right := Max(Value.Right, fDrawRect.Right);
    fDrawRect.Bottom := Max(Value.Bottom, fDrawRect.Bottom);
    {$IFDEF DICOMDEBUX1}
    //SendDebug(Format('%d-SetDrawRect (%f,%f)-(%f,%f)', [fUpdateCount, fDrawRect.Left, fDrawRect.Top, fDrawRect.Right, fDrawRect.Bottom]));
    {$ENDIF}
  end;
  inc(fUpdateCount);
end;

procedure TvxDicomView.SetUseSynchronizeEvent(const Value: Boolean);
begin
  FUseSynchronizeEvent := Value;
end;

procedure TvxDicomView.SetReceiveTimeout(const Value: Integer);
begin
  FReceiveTimeout := Value;
end;

procedure TvxDicomView.ApplyModalitySetting(ADataset: TDicomDataset);
var
  daa1, daa2, daa3: TDicomAttribute;
  dasa1: TDicomAttributes;
  fontname1, m1: string;
begin
  if ADataset.Attributes.GetString($20, $D) = '' then
    ADataset.Attributes.AddVariant($20, $D, ADataset.Attributes.GetString($20, $10));
  if ADataset.Attributes.GetString($20, $E) = '' then
    ADataset.Attributes.AddVariant($20, $E, ADataset.Attributes.GetString($20, $11));

  if InfoProposalsTable <> nil then
  begin
    if InfoProposalsTable.RecordCount > 0 then
      if not InformationLabelsTable.Filtered then
      begin
        InformationLabelsTable.Filter := 'GROUP_ID=' + InfoProposalsTable.FieldByName('GROUP_ID').AsString;
        InformationLabelsTable.Filtered := true;
      end;

    AddInformationLabels(ADataset);
  end;

  daa1 := ADataset.Attributes.Item[$2815, 1];
  if (daa1 <> nil) and (daa1.GetCount > 0) then
  begin
    dasa1 := daa1.Attributes[0];
    daa2 := dasa1.Item[$2815, 2];
    daa3 := dasa1.Item[$2815, 3];
    ADataset.Attributes.AddVariant($2811, $20E, daa2.AsInteger[0]);
    ADataset.Attributes.AddVariant($2811, $20F, daa3.AsInteger[0]);
  end;

  //if DicomMultiViewer1.GetViewerCount<=0 then
  m1 := ADataset.Attributes.GetString($8, $60);
  if assigned(ModalityTable) and ModalityTable.Locate('Modality', m1, []) and
    (assigned(ADataset.Attributes.ImageData)) then
  begin
    fontname1 := ModalityTable.FieldByName('DISPLAYMODE').AsString;

    if (fontname1 <> 'Overlay') and (fontname1 <> '') then
      ADataset.Attributes.ImageData.Font.Name := fontname1
    else
      ADataset.Attributes.ImageData.Font.Name := '宋体';

    ADataset.Attributes.ImageData.OverlayFontSizePrecent := ModalityTable.FieldByName('INFO_FONT_PER').AsFloat;
    case ModalityTable.FieldByName('INFO_FONT_MODE').AsInteger of
      0: ADataset.Attributes.ImageData.OverlayFontSizeMode := olmCalFromWidth;
      1: ADataset.Attributes.ImageData.OverlayFontSizeMode := olmCalFromHeight;
      2: ADataset.Attributes.ImageData.OverlayFontSizeMode := olmCalFromMin;
      3: ADataset.Attributes.ImageData.OverlayFontSizeMode := olmCalFromMax;
    end;

    //ADataset.Attributes.ImageData.MagnificationType := mftCUBIC;

    case ModalityTable.FieldByName('MagnificationType').AsInteger of
      1: ADataset.Attributes.ImageData.MagnificationType := mftBILINEAR;
      2: ADataset.Attributes.ImageData.MagnificationType := mftCUBIC;
      3: ADataset.Attributes.ImageData.MagnificationType := mftREPLICATE
    else
      ADataset.Attributes.ImageData.MagnificationType := mftNONE;
    end;

    if ModalityTable.FindField('LabelPosition') <> nil then
      case ModalityTable.FieldByName('LabelPosition').AsInteger of
        1: ADataset.LabelPosition := dlmStartPoint;
        2: ADataset.LabelPosition := dlmEndPoint;
        3: ADataset.LabelPosition := dlmBottomOfImage;
        4: ADataset.LabelPosition := dlmTopOfImage;
        5: ADataset.LabelPosition := dlmFreeMove;

        6: ADataset.LabelPosition := dlmLeftOfImage;
        7: ADataset.LabelPosition := dlmRightOfImage;
      end;

    case ModalityTable.FieldByName('RULER_UNIT').AsInteger of
      0: ADataset.Attributes.ImageData.RulerUnit := ruCentimeter;
      1: ADataset.Attributes.ImageData.RulerUnit := ruMillimeter;
    end;

    if assigned(ModalityTable.FindField('MOUSE_CTRL_WL_FACTOR')) then
    begin
      ADataset.Attributes.ImageData.MouseCtrlWwWlFactor := ModalityTable.FieldByName('MOUSE_CTRL_WL_FACTOR').AsFloat;
      ADataset.Attributes.ImageData.MouseWwWlFactor := ModalityTable.FieldByName('MOUSE_WL_FACTOR').AsFloat;
    end;
  end;
end;

procedure TvxDicomView.SetLabelFontName(const Value: string);
begin
  FLabelFontName := Value;
end;

procedure TvxDicomView.DoThumbnailsScrollBarChange(Sender: TObject);
begin
  if not fSetScrolllbarValue then
  begin
    fThumbnailStart := Trunc(FThumbnailsScrollBar.Value);
    DrawRect := FThumbnailsRect;
    InvalidateRect(DrawRect);
  end;
  fSetScrolllbarValue := false;
end;

procedure TvxDicomView.SetCurrentProfileName(const Value: string);
begin
  FCurrentProfileName := Value;
end;

{ TSeriesRect }

procedure TSeriesRect.Clear;
var
  i: Integer;
begin
  for i := 0 to fImageRectList.Count - 1 do
    TImageRect(fImageRectList[i]).Free;

  fImageRectList.Clear;
end;

constructor TSeriesRect.Create(aParent: TStudyRect);
begin
  fImageRectList := TList.Create;

  FGridFormat := 'STANDARD\1,1';
  FSeriesUID := '';
  FStudyUID := '';
  fSeriesIndex := 0;

  FDicomDatasets := nil;
  fParent := aParent;

  FCurrentImageIndex := 0;

  //FFullScreenImage := nil;
  //FOldImageBeforeFullScreen := nil;
  FOldImageIndexBeforeFullScreen := -1;
  FOldCurrentImageIndexBeforeFullScreen := -1;
  fOldGridFormatBeforeFullScreen := '';

  fImageRectList.Add(TImageRect.Create(self));

  FActiveRect := TImageRect(fImageRectList[0]);
end;

destructor TSeriesRect.Destroy;
begin
  Clear;
  fImageRectList.Free;

  inherited;
end;

function TSeriesRect.GetActiveRect(X, Y: Single): TImageRect;
var
  v1: TImageRect;
  i: Integer;
begin
  Result := nil;
  for i := 0 to fImageRectList.Count - 1 do
  begin
    v1 := TImageRect(fImageRectList[i]);

    if ((X > v1.fImageRect.Left) and (X < v1.fImageRect.Right)) and
      ((Y > v1.fImageRect.Top) and (Y < v1.fImageRect.Bottom)) then
    begin
      Result := V1;
      break;
    end;
  end;
  if Result <> nil then
    fActiveRect := Result;
  //  if Result = nil then
  //    Result := TImageRect(fImageRectList[0]);
end;

function TSeriesRect.GetItems(index: Integer): TImageRect;
begin
  Result := TImageRect(fImageRectList[Index]);
end;

procedure TSeriesRect.FirstImage;
begin
  if FSeriesUID <> '' then
  begin
    CurrentImageIndex := FDicomDatasets.GetSeriesStart(FSeriesUID);
  end
  else
    CurrentImageIndex := 0;
end;

procedure TSeriesRect.LastImage;
var
  k1, k2: Integer;
begin
  if FSeriesUID <> '' then
  begin
    k1 := FDicomDatasets.GetSeriesStart(FSeriesUID);
    k2 := FDicomDatasets.GetSeriesImageCount(FSeriesUID);
  end
  else
  begin
    k1 := 0;
    k2 := FDicomDatasets.Count;
  end;
  if k2 > fImageRectList.Count then
  begin
    CurrentImageIndex := k2 - fImageRectList.Count;
  end
  else
  begin
    CurrentImageIndex := k1;
  end;
end;

procedure TSeriesRect.NextImage;
var
  k2: Integer;
begin
  if FSeriesUID <> '' then
  begin
    //k1 := FDicomDatasets.GetSeriesStart(FSeriesUID);
    k2 := FDicomDatasets.GetSeriesImageCount(FSeriesUID);
  end
  else
  begin
    // k1 := 0;
    k2 := FDicomDatasets.Count;
  end;
  if (CurrentImageIndex + fImageRectList.Count) < k2 then
  begin
    CurrentImageIndex := CurrentImageIndex + 1; //fImageRectList.Count;
  end
  else
  begin
    CurrentImageIndex := k2 - 1; //fImageRectList.Count;
  end
end;

procedure TSeriesRect.PriorImage;
var
  k1: Integer;
begin
  if FSeriesUID <> '' then
  begin
    k1 := FDicomDatasets.GetSeriesStart(FSeriesUID);
    //k2 := FDicomDatasets.GetSeriesImageCount(FSeriesUID);
  end
  else
  begin
    k1 := 0;
    //k2 := FDicomDatasets.Count;
  end;
  if (CurrentImageIndex - fImageRectList.Count) > k1 then
  begin
    CurrentImageIndex := CurrentImageIndex - 1; //fImageRectList.Count;
  end
  else
  begin
    CurrentImageIndex := 0;
  end
end;

procedure TSeriesRect.ResizeRect;
var
  v1: TImageRect;
  i: Integer;
begin
  for i := 0 to fImageRectList.Count - 1 do
  begin
    v1 := TImageRect(fImageRectList[i]);

    v1.fImageRect := SpritVxRect(fGridFormat, fSeriesRect, i);
    v1.fModify := true;
  end;
end;

procedure TSeriesRect.SetBound(ARect: TvxRect);
begin
  fSeriesRect := ARect;
  ResizeRect;
end;

procedure TSeriesRect.SetCurrentImageIndex(const Value: Integer);
begin
  //  if (FCurrentImageIndex <> Value) then
  begin
    if (FDicomDatasets <> nil) then
    begin
      if (FSeriesUID <> '') then
      begin
        if (Value >= 0) and (Value < FDicomDatasets.GetSeriesImageCount(FSeriesUID)) then
        begin
          FCurrentImageIndex := Value;
          DoChangeSeries;
        end
        else
        begin
          FCurrentImageIndex := 0;
          DoChangeSeries;
        end;
      end
      else
      begin
        if (Value >= 0) and (Value < FDicomDatasets.Count) then
        begin
          FCurrentImageIndex := Value;
          DoChangeSeries;
        end
        else
        begin
          FCurrentImageIndex := 0;
          DoChangeSeries;
        end;
      end;
    end
    else
    begin
      FCurrentImageIndex := 0;
      DoChangeSeries;
    end;
  end;
end;

procedure TSeriesRect.SetGridFormat(const Value: string);
var
  i, k: Integer;
begin
  if FGridFormat <> Value then
  begin
    FGridFormat := Value;
    //build list
    k := GetCountFromFormat(fGridFormat);
    Clear;
    for i := 0 to k - 1 do
      fImageRectList.Add(TImageRect.Create(self));

    ResizeRect;

    if assigned(fParent.fOnFormatChange) then
      fParent.fOnFormatChange(self);

    DoChangeSeries;
  end;
end;

procedure TSeriesRect.DoChangeSeries;
var
  i, k1, k2, k3: Integer;
  v1: TImageRect;
begin
  if FDicomDatasets <> nil then
  begin
    k1 := FCurrentImageIndex;
    if FSeriesUID <> '' then
    begin
      k3 := FDicomDatasets.GetSeriesStart(FSeriesUID);
      k1 := k1 + k3;
      k2 := FDicomDatasets.GetSeriesEnd(FSeriesUID) + 1;
    end
    else
      k2 := FDicomDatasets.Count;

    for i := 0 to fImageRectList.Count - 1 do
    begin
      v1 := TImageRect(fImageRectList[i]);
      if k1 < k2 then
      begin
        v1.DicomDataset := FDicomDatasets.Item[k1];
        v1.ImageIndex := i;
        inc(k1);
      end
      else
        v1.DicomDataset := nil;
    end;
  end
  else
  begin
    for i := 0 to fImageRectList.Count - 1 do
    begin
      v1 := TImageRect(fImageRectList[i]);
      v1.DicomDataset := nil;
      v1.ImageIndex := 0;
    end;
  end;
end;

procedure TSeriesRect.SetData(ADicomDatasets: TDicomDatasets;
  ASeriesUID: string; ASeriesIndex, AIndex: Integer);
begin
  if (FDicomDatasets <> ADicomDatasets) or (FSeriesUID <> ASeriesUID) or (FCurrentImageIndex <> AIndex) then
  begin
    {$IFDEF DICOMDEBUX1}
    SendDebug(Format('TSeriesRect.SetData %s,%d,%d', [ASeriesUID, ASeriesIndex, AIndex]));
    {$ENDIF}

    FDicomDatasets := ADicomDatasets;
    FSeriesUID := ASeriesUID;
    fSeriesIndex := ASeriesIndex;
    FCurrentImageIndex := AIndex;
    DoChangeSeries;
  end;
  //  end;
end;

procedure TSeriesRect.NextPage;
var
  k2: Integer;
begin
  if FSeriesUID <> '' then
  begin
    //k1 := FDicomDatasets.GetSeriesStart(FSeriesUID);
    k2 := FDicomDatasets.GetSeriesImageCount(FSeriesUID);
  end
  else
  begin
    // k1 := 0;
    k2 := FDicomDatasets.Count;
  end;
  if (CurrentImageIndex + fImageRectList.Count) < k2 then
  begin
    CurrentImageIndex := CurrentImageIndex + fImageRectList.Count;
  end
  else
  begin
    CurrentImageIndex := k2 - fImageRectList.Count;
  end
end;

procedure TSeriesRect.PriorPage;
var
  k1: Integer;
begin
  if FSeriesUID <> '' then
  begin
    k1 := FDicomDatasets.GetSeriesStart(FSeriesUID);
    //k2 := FDicomDatasets.GetSeriesImageCount(FSeriesUID);
  end
  else
  begin
    k1 := 0;
    //k2 := FDicomDatasets.Count;
  end;
  if (CurrentImageIndex - fImageRectList.Count) > k1 then
  begin
    CurrentImageIndex := CurrentImageIndex - fImageRectList.Count;
  end
  else
  begin
    CurrentImageIndex := 0;
  end
end;

procedure TSeriesRect.SetActiveRect(const Value: TImageRect);
begin
  FActiveRect := Value;
end;

function TSeriesRect.GetActiveRect1: TImageRect;
begin
  if fActiveRect <> nil then
    Result := fActiveRect
  else
    Result := items[0];
end;

function TSeriesRect.GetImageCountPerPage: Integer;
begin
  Result := fImageRectList.Count;
end;

procedure TSeriesRect.FirstPage;
begin
  CurrentImageIndex := 0;
end;

procedure TSeriesRect.LastPage;
var
  k2: Integer;
begin
  if FDicomDatasets <> nil then
  begin
    if FSeriesUID <> '' then
    begin
      //k1 := FDicomDatasets.GetSeriesStart(FSeriesUID);
      k2 := FDicomDatasets.GetSeriesImageCount(FSeriesUID);
    end
    else
    begin
      // k1 := 0;
      k2 := FDicomDatasets.Count;
    end;

    CurrentImageIndex := (k2 div fImageRectList.Count) * fImageRectList.Count;
  end;
end;

function TSeriesRect.GetCountOfAssignImageRect: integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to fImageRectList.Count - 1 do
  begin
    if Items[i].FDicomDataset <> nil then
      Result := Result + 1;
  end;
end;

{ TStudyRect }

procedure TStudyRect.AddDatasets(ADicomDatasets: TDicomDatasets);
begin
  fDicomDatasetsList.Insert(0, ADicomDatasets);
  DoChange;
end;

procedure TStudyRect.ChangeDatasets(ADicomDatasets: TDicomDatasets);
var
  i: Integer;
  s1: TSeriesRect;
begin
  {for i := 0 to fSeriesRectList.Count - 1 do
  begin
    s1 := TSeriesRect(fSeriesRectList[i]);
    if s1.DicomDatasets = ADicomDatasets then
    begin
      s1.SetData(nil, '');
    end;
  end;}

  DoChange;
end;

procedure TStudyRect.Clear;
var
  i: Integer;
begin
  for i := 0 to fSeriesRectList.Count - 1 do
    TSeriesRect(fSeriesRectList[i]).Free;

  fSeriesRectList.Clear;
end;

constructor TStudyRect.Create(aParent: TvxDicomView);
begin
  fSeriesRectList := TList.Create;
  fDicomDatasetsList := TList.Create;

  fParent := aParent;

  fGridFormat := 'STANDARD\1,1';
  fSeriesRectList.Add(TSeriesRect.Create(self));

  fCurrentDicomDatasetIndex := 0;
  fCurrentSeriesIndex := 0;
  FClassifyBySeriesUID := true;
end;

destructor TStudyRect.Destroy;
begin
  Clear;
  fSeriesRectList.Free;
  fDicomDatasetsList.Free;
  inherited;
end;

function TStudyRect.GetActiveRect(X, Y: Single): TSeriesRect;
var
  v1: TSeriesRect;
  i: Integer;
begin
  Result := nil;
  for i := 0 to fSeriesRectList.Count - 1 do
  begin
    v1 := TSeriesRect(fSeriesRectList[i]);

    if ((X > v1.fSeriesRect.Left) and (X < v1.fSeriesRect.Right)) and
      ((Y > v1.fSeriesRect.Top) and (Y < v1.fSeriesRect.Bottom)) then
    begin
      Result := V1;
      break;
    end;
  end;
  //if Result = nil then
  //  Result := TSeriesRect(fSeriesRectList[0]);
end;

function TStudyRect.GetItems(index: Integer): TSeriesRect;
begin
  Result := TSeriesRect(fSeriesRectList[Index]);
end;

procedure TStudyRect.LastSeries;
begin

end;

procedure TStudyRect.NextSeries;
var
  fActiveSeries: TSeriesRect;
  i: Integer;
begin
  for i := 0 to fSeriesRectList.Count - 1 do
  begin
    fActiveSeries := TSeriesRect(fSeriesRectList[i]);
    if fActiveSeries.FDicomDatasets <> nil then
      if fActiveSeries.SeriesIndex < (fActiveSeries.FDicomDatasets.GetSeriesCount - 1) then
        fActiveSeries.SetData(fActiveSeries.FDicomDatasets,
          fActiveSeries.FDicomDatasets.SeriesDataset[fActiveSeries.SeriesIndex + 1].Attributes.GetString($20, $E),
          fActiveSeries.SeriesIndex + 1, 0)
      else
        fActiveSeries.SetData(fActiveSeries.FDicomDatasets,
          fActiveSeries.FDicomDatasets.SeriesDataset[0].Attributes.GetString($20, $E),
          0, 0)
  end;
end;

procedure TStudyRect.PriorSeries;
var
  fActiveSeries: TSeriesRect;
  i: Integer;
begin
  for i := 0 to fSeriesRectList.Count - 1 do
  begin
    fActiveSeries := TSeriesRect(fSeriesRectList[i]);
    if fActiveSeries.SeriesIndex > 0 then
      fActiveSeries.SetData(fActiveSeries.FDicomDatasets,
        fActiveSeries.FDicomDatasets.SeriesDataset[fActiveSeries.SeriesIndex - 1].Attributes.GetString($20, $E),
        fActiveSeries.SeriesIndex - 1, 0)
    else
      fActiveSeries.SetData(fActiveSeries.FDicomDatasets,
        fActiveSeries.FDicomDatasets.SeriesDataset[fActiveSeries.FDicomDatasets.GetSeriesCount - 1].Attributes.GetString($20, $E),
        fActiveSeries.FDicomDatasets.GetSeriesCount - 1, 0);

  end;
end;

procedure TStudyRect.FirstSeries;
begin

end;

procedure TStudyRect.RemoveDatasets(ADicomDatasets: TDicomDatasets);
var
  v1: TSeriesRect;
  i: Integer;
begin
  fCurrentDicomDatasetIndex := 0;
  fCurrentSeriesIndex := 0;

  for i := 0 to fSeriesRectList.Count - 1 do
  begin
    v1 := TSeriesRect(fSeriesRectList[i]);

    if v1.DicomDatasets = ADicomDatasets then
    begin
      v1.SetData(nil, '', 0, 0);
    end;
  end;

  fDicomDatasetsList.Remove(ADicomDatasets);

  DoChange;
end;

procedure TStudyRect.ResizeRect;
var
  v1: TSeriesRect;
  i: Integer;
begin
  if not FClassifyBySeriesUID then
  begin
    v1 := TSeriesRect(fSeriesRectList[0]);

    v1.fSeriesRect := fStudyRect;
    v1.ResizeRect;
  end
  else
  begin
    for i := 0 to fSeriesRectList.Count - 1 do
    begin
      v1 := TSeriesRect(fSeriesRectList[i]);

      v1.fSeriesRect := SpritVxRect(fGridFormat, fStudyRect, i);
      v1.ResizeRect;
    end;
  end;
end;

procedure TStudyRect.SetBound(ARect: TvxRect);
begin
  fStudyRect := ARect;
  ResizeRect;
end;

procedure TStudyRect.SetGridFormat(const Value: string);
var
  i, k: Integer;
begin
  if FGridFormat <> Value then
  begin
    //if FClassifyBySeriesUID then
    FGridFormat := Value;
    //else
    //  FGridFormat := 'STANDARD\1,1';

    //build list
    k := GetCountFromFormat(fGridFormat);
    Clear;
    for i := 0 to k - 1 do
      fSeriesRectList.Add(TSeriesRect.Create(self));

    ResizeRect;

    DoChange;

    if assigned(fOnFormatChange) then
      fOnFormatChange(nil);
  end;
end;

function TStudyRect.GetAllSeriesCount: Integer;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to fDicomDatasetsList.Count - 1 do
  begin
    Result := Result + TDicomDatasets(fDicomDatasetsList[i]).GetSeriesCount;
  end;
end;

function TStudyRect.GetAllImagesCount: Integer;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to fDicomDatasetsList.Count - 1 do
  begin
    Result := Result + TDicomDatasets(fDicomDatasetsList[i]).Count;
  end;
end;

procedure TStudyRect.DoChange;
var
  k1, k2: Integer;
  i, i1: Integer;
  s1, s2: TSeriesRect;
  das1: TDicomDataset;
  DicomDatasets1: TDicomDatasets;
begin
  if FClassifyBySeriesUID then
  begin
    if GetAllSeriesCount > 0 then
    begin

      DicomDatasets1 := TDicomDatasets(fDicomDatasetsList[fCurrentDicomDatasetIndex]);
      k2 := fCurrentSeriesIndex;

      for i := 0 to fSeriesRectList.Count - 1 do
      begin
        s1 := TSeriesRect(fSeriesRectList[i]);
        if k2 >= DicomDatasets1.GetSeriesCount then
        begin
          inc(k1);
          if k1 >= fDicomDatasetsList.Count then
          begin
            for i1 := i to fSeriesRectList.Count - 1 do
            begin
              s2 := TSeriesRect(fSeriesRectList[i]);
              s2.SetData(nil, '', -1, 0);
            end;
            break;
          end;
          DicomDatasets1 := TDicomDatasets(fDicomDatasetsList[k1]);
          k2 := 0;
        end;

        das1 := DicomDatasets1.SeriesDataset[k2];

        if (s1.DicomDatasets = nil) then //<> DicomDatasets1) or (s1.SeriesUID <> das1.SeriesUID) then
        begin
          s1.SetData(DicomDatasets1, das1.SeriesUID, k2, 0);
        end
        else
          if (s1.DicomDatasets = DicomDatasets1) and (s1.SeriesUID = das1.SeriesUID) then
        begin
          if s1.GetCountOfAssignImageRect < s1.fImageRectList.Count then
          begin
            s1.DoChangeSeries;
          end;
        end;

        inc(k2);
      end;
    end
    else
    begin
      for i1 := 0 to fSeriesRectList.Count - 1 do
      begin
        s2 := TSeriesRect(fSeriesRectList[i1]);
        s2.SetData(nil, '', -1, 0);
      end;
    end;
  end
  else
  begin
    if GetAllImagesCount > 0 then
    begin

      DicomDatasets1 := TDicomDatasets(fDicomDatasetsList[fCurrentDicomDatasetIndex]);
      k2 := fCurrentSeriesIndex;

      for i := 0 to fSeriesRectList.Count - 1 do
      begin
        s1 := TSeriesRect(fSeriesRectList[i]);

        if k2 < fDicomDatasetsList.Count then
        begin
          DicomDatasets1 := TDicomDatasets(fDicomDatasetsList[k2]);
          if (s1.DicomDatasets <> DicomDatasets1) then
            s1.SetData(DicomDatasets1, '', 0, 0);
        end;

        inc(k2);
      end;
    end
    else
    begin
      for i1 := 0 to fSeriesRectList.Count - 1 do
      begin
        s2 := TSeriesRect(fSeriesRectList[i1]);
        s2.SetData(nil, '', -1, 0);
      end;
    end;
  end;
end;

procedure TStudyRect.SetOnFormatChange(const Value: TNotifyEvent);
begin
  FOnFormatChange := Value;
end;

function TStudyRect.FindImageRect(ADataset: TDicomDataset): TImageRect;
var
  seriesuid1: string;
  v1: TSeriesRect;
  r1: TImageRect;
  i, k: Integer;
begin
  seriesuid1 := ADataset.Attributes.GetString($20, $E);
  Result := nil;

  for i := 0 to fSeriesRectList.Count - 1 do
  begin
    v1 := TSeriesRect(fSeriesRectList[i]);

    if v1.FSeriesUID = seriesuid1 then
    begin
      for k := 0 to v1.fImageRectList.Count - 1 do
      begin
        r1 := TImageRect(v1.fImageRectList[k]);

        if r1.DicomDataset = ADataset then
        begin
          Result := r1;
          break;
        end;
      end;
    end;
  end;
end;

procedure TStudyRect.SetClassifyBySeriesUID(const Value: Boolean);
var
  k, i: Integer;
begin
  if FClassifyBySeriesUID <> Value then
  begin
    FClassifyBySeriesUID := Value;

    if not FClassifyBySeriesUID then
    begin
      Clear;
      fSeriesRectList.Add(TSeriesRect.Create(self));

      ResizeRect;

      DoChange;

      if assigned(fOnFormatChange) then
        fOnFormatChange(nil);
    end
    else
    begin
      k := GetCountFromFormat(fGridFormat);
      Clear;
      for i := 0 to k - 1 do
        fSeriesRectList.Add(TSeriesRect.Create(self));

      ResizeRect;

      DoChange;

      if assigned(fOnFormatChange) then
        fOnFormatChange(nil);
    end;
  end;
end;

function TStudyRect.GetSeriesCount: Integer;
begin
  Result := fSeriesRectList.Count;
end;

function TStudyRect.GetItemsBySeriesUID(index: string): TSeriesRect;
var
  i: Integer;
  v1: TSeriesRect;
begin
  Result := nil;
  for i := 0 to fSeriesRectList.Count - 1 do
  begin
    v1 := TSeriesRect(fSeriesRectList[i]);

    if v1.FSeriesUID = index then
    begin
      Result := v1;
      break;
    end;
  end;
end;

{ TImageRect }

constructor TImageRect.Create(aParent: TSeriesRect);
begin
  fModify := true;
  fParent := aParent;
  FBitmap := nil;
  FImageIndex := -1;
  FDicomDataset := nil;

  FLockView := false;
  FMouseIn := false;
  FFocus := false;

  FDisplayType := irdtImage;
  FSliceWeight := 0;

  FPositionCursorColor := clRed;
  FPositionCursorPosition := vgPoint(0, 0);

  fInseringBox.Right := 0;
  fInseringBox.Bottom := 0;

  fDrawCine := TDicomDirectDrawCine.Create;
  fDrawCine.OnImageCineTo := DoDirectDrawCine;
  fDrawCine.Center := true;
  fDrawCine.FitWindow := true;

  FTimer := TTimer.Create(nil);
  FTimer.Enabled := false;
  FTimer.Interval := 40;
  FTimer.OnTimer := DoPlayCine;
  fCineActive := false;
  fCineDirection := false;
  fCineSpeed := 40;
end;

destructor TImageRect.Destroy;
begin
  if FBitmap <> nil then
    FBitmap.Free;

  FTimer.Enabled := false;
  FTimer.Free;

  fDrawCine.Free;

  inherited;
end;

procedure TImageRect.DoDirectDrawCine(Sender: TObject; AIndex: Integer);
begin
  //fDrawCine.PaintTo(Canvas, Width, Height);
end;

procedure TImageRect.DoPlayCine(Sender: TObject);
begin
  //fDrawCine.CurrentFrame := Attributes.ImageData.FrameIndex;
end;

function TImageRect.GetHeight: Integer;
begin
  Result := Trunc(rect.Bottom - rect.Top);
end;

function TImageRect.GetWidth: Integer;
begin
  Result := Trunc(rect.Right - rect.Left);
end;

procedure TImageRect.SetBitmap(const Value: TvxBitmap);
begin
  FBitmap := Value;
end;

procedure TImageRect.SetCineActive(const Value: Boolean);
begin
  fCineActive := Value;
end;

procedure TImageRect.SetCineDirection(const Value: Boolean);
begin
  fCineDirection := Value;
end;

procedure TImageRect.SetCineSpeed(const Value: integer);
begin
  fCineSpeed := Value;
end;

procedure TImageRect.SetDicomDataset(const Value: TDicomDataset);
begin
  if FDicomDataset <> Value then
  begin
    FDicomDataset := Value;
    fModify := true;
  end;
end;

procedure TImageRect.SetDisplayType(const Value: TImageRectDisplayType);
begin
  FDisplayType := Value;
end;

procedure TImageRect.SetFocus(const Value: Boolean);
begin
  if FFocus <> Value then
  begin
    FFocus := Value;
    //fModify := true;
  end;
end;

procedure TImageRect.SetImageIndex(const Value: Integer);
begin
  FImageIndex := Value;
end;

procedure TImageRect.SetLockView(const Value: Boolean);
begin
  FLockView := Value;
end;

procedure TImageRect.SetMouseIn(const Value: Boolean);
begin
  if FMouseIn <> Value then
  begin
    FMouseIn := Value;
    //fModify := true;
  end;
end;

procedure TImageRect.SetOffsetHorz(const Value: Double);
begin
  FOffsetHorz := Value;
end;

procedure TImageRect.SetOffsetVert(const Value: Double);
begin
  FOffsetVert := Value;
end;

procedure TImageRect.SetPositionCursorColor(const Value: TColor);
begin
  FPositionCursorColor := Value;
end;

procedure TImageRect.SetPositionCursorPosition(const Value: TvxPoint);
begin
  FPositionCursorPosition := Value;
end;

{ TDicomToolBar }

procedure TvxDicomToolbar.AddObject(AObject: TvxObject);
var
  s1: TvxSpeedButton;
  tb1: TvxToolButton;
begin
  if AObject is TvxSpeedButton then
  begin
    s1 := TvxSpeedButton(AObject);
    s1.Width := FButtonSize;
    s1.Height := FButtonSize;
    if (Align = vaLeft) or (Align = vaRight) then
    begin
      s1.Position.X := 0;
      s1.Position.Y := FButtonSize * ChildrenCount;
    end
    else
    begin
      s1.Position.X := FButtonSize * ChildrenCount;
      s1.Position.Y := 0;
    end;
  end;
  if AObject is TvxToolButton then
  begin
    tb1 := TvxToolButton(AObject);
    tb1.Width := FButtonSize;
    tb1.Height := FButtonSize;
    tb1.BitmapSize := FButtonSize;
    //tb1.BitmapSpacing := FButtonSpacing;
    tb1.BitmapPadding := FButtonPadding;
    if (Align = vaLeft) or (Align = vaRight) then
    begin
      tb1.Position.X := 0;
      tb1.Position.Y := FButtonSize * ChildrenCount;
    end
    else
    begin
      tb1.Position.X := FButtonSize * ChildrenCount;
      tb1.Position.Y := 0;
    end;
  end;
  inherited;
end;

function TvxDicomToolbar.ChangeButtonSetting(aButtonName: AnsiString; aButtonViaible: Boolean;
  aButtonIndex: Integer; aButtonHint: AnsiString): Boolean;
var
  i: Integer;
  s1: TvxSpeedButton;
  tb1: TvxToolButton;
  AObject: TvxObject;
begin
  Result := false;
  if ChildrenCount > 0 then
  begin
    for i := 0 to ChildrenCount - 1 do
    begin
      AObject := Children[i];

      if AObject is TvxSpeedButton then
      begin
        s1 := TvxSpeedButton(AObject);
        if s1.Name = aButtonName then
        begin
          s1.Index := aButtonIndex;
          s1.Hint := aButtonHint;
          s1.Visible := aButtonViaible;
          Result := true;
          break;
        end;
      end
      else
        if AObject is TvxToolButton then
      begin
        tb1 := TvxToolButton(AObject);
        if tb1.Name = aButtonName then
        begin
          tb1.Index := aButtonIndex;
          tb1.Hint := aButtonHint;
          tb1.Visible := aButtonViaible;
          Result := true;
          break;
        end;
      end;
    end;
  end;
end;

constructor TvxDicomToolBar.Create(AOwner: TComponent);
begin
  inherited;
  Height := 32;
  Align := vaTop;

  FButtonSpacing := 0;
  FButtonSize := 32;
  FButtonPadding := 0;
end;

destructor TvxDicomToolbar.Destroy;
begin

  inherited;
end;

procedure TvxDicomToolBar.MatrixChanged(Sender: TObject);
var
  ButtonCountOnOneLine: Integer;
begin
  inherited;
  if ChildrenCount > 0 then
  begin
    {$IFDEF DICOMDEBUX1}
    //SendDebug(Format('orgin Width %f,Height %f,ChildrenCount %d', [Width, Height, ChildrenCount]));
    {$ENDIF}

    if (Align = vaLeft) or (Align = vaRight) then
    begin
      ButtonCountOnOneLine := Round(Height) div FButtonSize;

      Width := FButtonSize * ((ButtonCountOnOneLine + ChildrenCount - 1) div ButtonCountOnOneLine);
    end
    else
    begin
      ButtonCountOnOneLine := Round(Width) div FButtonSize;
      Height := FButtonSize * ((ButtonCountOnOneLine + ChildrenCount - 1) div ButtonCountOnOneLine);
    end;
    {$IFDEF DICOMDEBUX1}
    //SendDebug(Format('Width %f,Height %f,ChildrenCount %d', [Width, Height, ChildrenCount]));
    {$ENDIF}
  end;
end;

procedure TvxDicomToolBar.Realign;
var
  i, k, k1, k2, ButtonCountOnOneLine: Integer;
  s1: TvxSpeedButton;
  tb1: TvxToolButton;
  AObject: TvxObject;
  index1: Integer;
  Hint1: string;
  visible1: Boolean;
begin
  inherited;
  if ChildrenCount > 0 then
  begin
    k := 0;
    if (Align = vaLeft) or (Align = vaRight) then
    begin
      ButtonCountOnOneLine := Round(Height) div FButtonSize;
    end
    else
    begin
      ButtonCountOnOneLine := Round(Width) div FButtonSize;
    end;

    for i := 0 to ChildrenCount - 1 do
    begin
      AObject := Children[i];

      k1 := (ButtonCountOnOneLine + k - 1) div ButtonCountOnOneLine - 1;

      k2 := k mod ButtonCountOnOneLine;

      if k2 = 0 then
        inc(k1);

      if AObject is TvxSpeedButton then
      begin
        s1 := TvxSpeedButton(AObject);

        if s1.Visible then
        begin
          s1.Width := FButtonSize;
          s1.Height := FButtonSize;
          s1.ShowHint := true;
          if (Align = vaLeft) or (Align = vaRight) then
          begin
            s1.Position.X := FButtonSize * k1;
            s1.Position.Y := FButtonSize * k2;
          end
          else
          begin
            s1.Position.X := FButtonSize * k2;
            s1.Position.Y := FButtonSize * k1;
          end;
          inc(k);
        end;
      end
      else
        if AObject is TvxToolButton then
      begin
        tb1 := TvxToolButton(AObject);

        if tb1.Visible then
        begin
          tb1.Width := FButtonSize;
          tb1.Height := FButtonSize;
          tb1.BitmapSize := FButtonSize;
          //tb1.BitmapSpacing := FButtonSpacing;
          tb1.BitmapPadding := FButtonPadding;

          tb1.ShowHint := true;
          tb1.Text := '';
          if (Align = vaLeft) or (Align = vaRight) then
          begin
            tb1.Position.X := FButtonSize * k1;
            tb1.Position.Y := FButtonSize * k2;
          end
          else
          begin
            tb1.Position.X := FButtonSize * k2;
            tb1.Position.Y := FButtonSize * k1;
          end;
          inc(k);
        end;
      end
      else
      begin
        {$IFDEF DICOMDEBUX1}
        //SendDebug(Format('Other Class %s in toolbar', [AObject.ClassName]));
        {$ENDIF}
      end;
    end;
  end;
end;

procedure TvxDicomToolbar.RemoveObject(AObject: TvxObject);
begin
  inherited;
  Realign;
end;

procedure TvxDicomToolbar.SetButtonPadding(const Value: Integer);
begin
  FButtonPadding := Value;
  Realign;
end;

procedure TvxDicomToolbar.SetButtonSize(const Value: Integer);
begin
  FButtonSize := Value;
  MatrixChanged(nil);
  Realign;
end;

procedure TvxDicomToolbar.SetButtonSpacing(const Value: Integer);
begin
  FButtonSpacing := Value;
  Realign;
end;

procedure TImageRect.SetScale(const Value: Double);
begin
  FScale := Value;
end;

procedure TImageRect.SetSliceWeight(const Value: Integer);
begin
  FSliceWeight := Value;
end;

initialization
  //  RegisterVGObjects('Dicom', [TvxDicomView]);


finalization
end.

