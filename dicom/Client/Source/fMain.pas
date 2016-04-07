unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, DCM_Client, DB,
  DCM_MemTable, Grids, DBGrids, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, dxBar, ActnList, cxClasses, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxSplitter, ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ImgList, cxContainer, cxLabel, cxGroupBox,
  cxCheckBox, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, DCM32,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, DCM_Attributes,
  JvExDBGrids, cxRadioGroup, Registry, cxGridExportLink, frxClass, frxDBSet, DateUtils,
  IBServices, IB_Services, uMD5, StrUtils, cxPC, FIBQuery, pFIBQuery,
  dxBarExtItems, dxSkinOffice2007Green, DCM_Dict, cxButtons, dxSkinBlack,
  dxmdaset, KXString, KXServerCore, DCM_Server, cxBarEditItem,
  DCM_Connection, DB_CMN, cxButtonEdit, dxSkinOffice2007Black, DBAccess, Uni,
  MemDS, cxShellBrowserDialog, Medotrade, OracleData, Oracle, dxdbtrel, ComCtrls,
  Buttons, cxImage, cxImageComboBox, db_cmn1;

type
  TfrmMain = class(TForm)
    BM: TdxBarManager;
    al: TActionList;
    aRefresh: TAction;
    aClose: TAction;
    IL: TImageList;
    sList: TDataSource;
    cxSplitter2: TcxSplitter;
    paMain: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    dsListPeriod: TpFIBDataSet;
    FIBStringField1: TFIBStringField;
    FIBStringField2: TFIBStringField;
    FIBStringField3: TFIBStringField;
    FIBStringField4: TFIBStringField;
    FIBStringField5: TFIBStringField;
    FIBStringField6: TFIBStringField;
    FIBIntegerField1: TFIBIntegerField;
    FIBDateTimeField1: TFIBDateTimeField;
    FIBDateTimeField2: TFIBDateTimeField;
    FIBStringField7: TFIBStringField;
    FIBIntegerField2: TFIBIntegerField;
    FIBStringField8: TFIBStringField;
    FIBStringField9: TFIBStringField;
    FIBStringField10: TFIBStringField;
    FIBStringField11: TFIBStringField;
    FIBStringField12: TFIBStringField;
    FIBStringField13: TFIBStringField;
    FIBStringField14: TFIBStringField;
    FIBStringField15: TFIBStringField;
    FIBIntegerField3: TFIBIntegerField;
    FIBIntegerField4: TFIBIntegerField;
    FIBStringField16: TFIBStringField;
    FIBStringField17: TFIBStringField;
    aPrint: TAction;
    dsListPeriodCNT: TFIBIntegerField;
    aParam: TAction;
    dsListPeriodP_DATEBORN: TFIBDateTimeField;
    dsListPeriodP_ENAME_RUS: TFIBStringField;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aExcel: TAction;
    pmTV: TPopupMenu;
    TV_menu_prn: TMenuItem;
    TV_menu_exp: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    N2: TMenuItem;
    sdPopUp: TSaveDialog;
    frxRep1: TfrxReport;
    frxDB1: TfrxDBDataset;
    aUsers: TAction;
    MainMenu1: TMainMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    sysdba1: TMenuItem;
    N5: TMenuItem;
    Dsjl1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    aEditSysdba: TAction;
    aChangeUser: TAction;
    aCD: TAction;
    pcMain: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGr: TcxGrid;
    TVList: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    dsListPeriodSTATUS: TFIBIntegerField;
    dsListPeriodNAME_DISC: TFIBStringField;
    pmTVA: TPopupMenu;
    TV_menu_prn2: TMenuItem;
    TV_menu_exp2: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    aTextA: TAction;
    aWebA: TAction;
    aXMLA: TAction;
    aExcelA: TAction;
    qDelete: TpFIBQuery;
    CnsDMTable1: TCnsDMTable;
    bbRefresh: TdxBarLargeButton;
    bbAdd: TdxBarLargeButton;
    bbClose: TdxBarLargeButton;
    dsListPeriodFP_SEX: TFIBStringField;
    N9: TMenuItem;
    aJournal: TAction;
    aPrepare: TAction;
    dsListPeriodACCESSIONNUMBER: TFIBStringField;
    actListShow: TAction;
    DicomServerCore1: TDicomServerCore;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    cxGrid1: TcxGrid;
    TVFolderList: TcxGridDBTableView;
    P_ENAME: TcxGridDBColumn;
    P_ENAME_RUS: TcxGridDBColumn;
    P_DATEBORN: TcxGridDBColumn;
    P_SEX: TcxGridDBColumn;
    LDATE: TcxGridDBColumn;
    P_PID: TcxGridDBColumn;
    STUDYID: TcxGridDBColumn;
    CNT: TcxGridDBColumn;
    STUDIES_IMAGE_TYPE: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    dsFolderList: TDataSource;
    MDFolderList: TdxMemData;
    MDFolderListP_ENAME: TStringField;
    MDFolderListP_ENAME_RUS: TStringField;
    MDFolderListP_DATEBORN: TDateTimeField;
    MDFolderListP_SEX: TStringField;
    MDFolderListLDATE: TDateTimeField;
    MDFolderListP_PID: TStringField;
    MDFolderListCNT: TIntegerField;
    MDFolderListSTUDIES_IMAGE_TYPE: TStringField;
    MDFolderListNAME_DISC: TStringField;
    dxBarButton4: TdxBarButton;
    actLoadFile: TAction;
    ACCESSIONNUMBER: TcxGridDBColumn;
    fSTUDYUID: TcxGridDBColumn;
    MDFolderListACCESSIONNUMBER: TStringField;
    OpenDialog3: TOpenDialog;
    MDFolderListFILENAME: TStringField;
    pmTVB: TPopupMenu;
    TV_menu_prn3: TMenuItem;
    TV_menu_exp3: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    BtnLdList: TdxBarLargeButton;
    pmOpen: TdxBarPopupMenu;
    dxBarButton7: TdxBarButton;
    ActLoadFolder: TAction;
    APrintFolder: TAction;
    MDFolderFullList: TdxMemData;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    StringField3: TStringField;
    DateTimeField2: TDateTimeField;
    StringField4: TStringField;
    IntegerField1: TIntegerField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    actTextFolder: TAction;
    actWebFolder: TAction;
    actXMLFolder: TAction;
    actExcelFolder: TAction;
    MDFolderListSTUDYUID: TStringField;
    MDFolderFullListSTUDYUID: TStringField;
    MDFolderFullListffile: TBlobField;
    BtnToArchiv: TdxBarLargeButton;
    actToArchive: TAction;
    paLeft: TPanel;
    gbSearch: TcxGroupBox;
    cxLabel3: TcxLabel;
    teFIO: TcxTextEdit;
    cxLabel8: TcxLabel;
    teMK: TcxTextEdit;
    cxLabel6: TcxLabel;
    teNum: TcxTextEdit;
    cxLabel9: TcxLabel;
    teRem: TcxTextEdit;
    cxLabel10: TcxLabel;
    cbType: TcxComboBox;
    cxGroupBox2: TcxGroupBox;
    deBegin: TcxDateEdit;
    bToday: TcxButton;
    deEnd: TcxDateEdit;
    cbDates: TcxComboBox;
    bYesterday: TcxButton;
    bPeriod: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    pcLeft: TcxPageControl;
    cxTabSheet5: TcxTabSheet;
    cxTabSheet6: TcxTabSheet;
    tvServ: TcxGridDBTableView;
    grServLevel1: TcxGridLevel;
    grServ: TcxGrid;
    tvServName: TcxGridDBColumn;
    tvServAET: TcxGridDBColumn;
    tvServIP: TcxGridDBColumn;
    dsServ: TpFIBDataSet;
    sServ: TDataSource;
    dsServFC_IP: TFIBStringField;
    dsServFK_ID: TFIBIntegerField;
    dsServFN_PORT: TFIBIntegerField;
    dsServFC_TITLE: TFIBStringField;
    dsServFC_COMMENT: TFIBStringField;
    dsServFN_TYPE: TFIBIntegerField;
    TvPRPACS: TcxGridDBColumn;
    TvPort: TcxGridDBColumn;
    PMRemote: TPopupMenu;
    TV_menu_prn1: TMenuItem;
    TV_menu_exp1: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    aPrintRemote: TAction;
    aTextRemote: TAction;
    aWebRemote: TAction;
    aXMLRemote: TAction;
    aExcelRemote: TAction;
    MemPrnRemote: TdxMemData;
    cxGrid3: TcxGrid;
    TVRemote: TcxGridDBTableView;
    VPAC_1: TcxGridDBColumn;
    P_ENAME_RUS_1: TcxGridDBColumn;
    VROJD_1: TcxGridDBColumn;
    VSEX_1: TcxGridDBColumn;
    VDATE_1: TcxGridDBColumn;
    P_PID_1: TcxGridDBColumn;
    VSTUDYID_1: TcxGridDBColumn;
    VMODALITY_1: TcxGridDBColumn;
    VACNUMBER_1: TcxGridDBColumn;
    VSTUDYUID_1: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    DSRemote: TDataSource;
    MemPrnRemoteP_ENAME: TStringField;
    MemPrnRemoteP_ENAME_RUS: TStringField;
    MemPrnRemoteP_DATEBORN: TDateField;
    MemPrnRemoteFP_SEX: TStringField;
    MemPrnRemoteLDATE: TDateField;
    MemPrnRemoteP_PID: TStringField;
    MemPrnRemoteSTUDIES_IMAGE_TYPE: TStringField;
    MemPrnRemoteACCESSIONNUMBER: TStringField;
    MemPrnRemoteSTUDYUID: TStringField;
    dxBarDockControl2: TdxBarDockControl;
    BMBar2: TdxBar;
    bbRef: TdxBarButton;
    bbEcho: TdxBarButton;
    bbSet: TdxBarButton;
    aSetServ: TAction;
    aRefServ: TAction;
    aEchoServ: TAction;
    cxBarEditItem1: TcxBarEditItem;
    MDFolderListVDESC: TStringField;
    MDFolderFullListVDESC: TStringField;
    MemPrnRemoteVDESC: TStringField;
    VDESC_1: TcxGridDBColumn;
    P_VDESC: TcxGridDBColumn;
    MDFolderFullListSTUDYID: TStringField;
    MDFolderListSTUDYID: TStringField;
    MemPrnRemoteSTUDYID: TStringField;
    bbSave: TdxBarLargeButton;
    pmSave: TdxBarPopupMenu;
    bbSaveHDD: TdxBarButton;
    bbSaveDisk: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    actKeyListShow: TAction;
    ltrRead: TpFIBTransaction;
    ltrWrite: TpFIBTransaction;
    lDB: TpFIBDatabase;
    dslocListPeriodFIBStringField36: TFIBStringField;
    dslocListPeriodFIBStringField37: TFIBStringField;
    dslocListPeriodFIBStringField38: TFIBStringField;
    dslocListPeriodFIBStringField39: TFIBStringField;
    dslocListPeriodFIBStringField40: TFIBStringField;
    dslocListPeriodFIBStringField41: TFIBStringField;
    dslocListPeriodFIBIntegerField10: TFIBIntegerField;
    dslocListPeriodFIBDateTimeField6: TFIBDateTimeField;
    dslocListPeriodFIBDateTimeField7: TFIBDateTimeField;
    dslocListPeriodFIBStringField42: TFIBStringField;
    dslocListPeriodFIBIntegerField11: TFIBIntegerField;
    dslocListPeriodFIBStringField43: TFIBStringField;
    dslocListPeriodFIBStringField44: TFIBStringField;
    dslocListPeriodFIBStringField45: TFIBStringField;
    dslocListPeriodFIBStringField46: TFIBStringField;
    dslocListPeriodFIBStringField47: TFIBStringField;
    dslocListPeriodFIBStringField48: TFIBStringField;
    dslocListPeriodFIBStringField49: TFIBStringField;
    dslocListPeriodFIBStringField50: TFIBStringField;
    dslocListPeriodFIBIntegerField12: TFIBIntegerField;
    dslocListPeriodFIBIntegerField13: TFIBIntegerField;
    dslocListPeriodFIBStringField51: TFIBStringField;
    dslocListPeriodFIBStringField52: TFIBStringField;
    dslocListPeriodFIBIntegerField14: TFIBIntegerField;
    dslocListPeriodFIBDateTimeField8: TFIBDateTimeField;
    dslocListPeriodFIBStringField53: TFIBStringField;
    dslocListPeriodFIBIntegerField15: TFIBIntegerField;
    dslocListPeriodFIBStringField54: TFIBStringField;
    dslocListPeriodFIBStringField55: TFIBStringField;
    dslocListPeriodFIBStringField56: TFIBStringField;
    locList: TDataSource;
    cxGrA: TcxGrid;
    TVListA: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dslocListPeriod: TpFIBDataSet;
    aSavToLocDB: TAction;
    bbSaveToLocDB: TdxBarButton;
    bbSend: TdxBarLargeButton;
    aToLocSend: TAction;
    aPrintLoc: TAction;
    aTextLoc: TAction;
    aWebLoc: TAction;
    aXMLLoc: TAction;
    aExcelLoc: TAction;
    pmSend: TdxBarPopupMenu;
    dxBarButton2: TdxBarButton;
    dxBarButton6: TdxBarButton;
    aClearRemote: TAction;
    aClearTV: TAction;
    aClearLoc: TAction;
    aClearFolder: TAction;
    MDFolderListTransferSyntax: TIntegerField;
    TransferSyntax: TcxGridDBColumn;
    dxbar1: TdxBarSeparator;
    dxbar2: TdxBarSeparator;
    bbSnimok: TdxBarLargeButton;
    pm_Snimok: TdxBarPopupMenu;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    bbDelSnimok: TdxBarLargeButton;
    aDelSnimok: TAction;
    UniServ: TUniQuery;
    UniListPeriod: TUniQuery;
    cxShellBrowserDialog1: TcxShellBrowserDialog;
    frxReport1: TfrxReport;
    dsListPeriodFC_AEAPPARAT: TStringField;
    dxBarButton1: TdxBarButton;
    actLoadDisk: TAction;
    OraListPeriod: TOracleDataSet;
    OraServ: TOracleDataSet;
    cxLabel4: TcxLabel;
    deDateBorn: TcxDateEdit;
    bbInformation: TdxBarLargeButton;
    bbImportPDF: TdxBarLargeButton;
    N1: TMenuItem;
    aDiagnoz: TAction;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    dxTreeViewEdit1: TdxTreeViewEdit;
    dxTreeViewEdit2: TdxTreeViewEdit;
    ClrOsnDiagBtn: TBitBtn;
    ClrDopDiagBtn: TBitBtn;
    dsListPeriodExFiles: TSmallintField;
    IL2: TImageList;
    teAE: TcxTextEdit;
    cxLabel5: TcxLabel;
    N10: TMenuItem;
    aSetUnsetListImages: TAction;
    sListImages: TcxSplitter;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridDBColumn23: TcxGridDBColumn;
    cxGridDBColumn24: TcxGridDBColumn;
    cxGridDBColumn25: TcxGridDBColumn;
    cxGridDBColumn26: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    gbListImages: TcxGroupBox;
    dxBarLargeButton2: TdxBarLargeButton;
    gbMainList: TcxGroupBox;
    dListImages: TpFIBDataSet;
    dsListImages: TDataSource;
    dListImagesINSTANCEUID: TStringField;
    VListColumn1: TcxGridDBColumn;
    Panel1: TPanel;
    cxButton1: TcxButton;
    UniListImages: TUniQuery;
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRefreshExecute(Sender: TObject);
    procedure bPeriodClick(Sender: TObject);
    procedure deBeginPropertiesEditValueChanged(Sender: TObject);
    procedure deEndPropertiesEditValueChanged(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure dsListPeriodAfterOpen(DataSet: TDataSet);
    procedure aParamExecute(Sender: TObject);
    procedure cxSplitter2BeforeClose(Sender: TObject; var AllowClose: Boolean);
    procedure cxSplitter2BeforeOpen(Sender: TObject; var NewSize: Integer;
      var AllowOpen: Boolean);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aExcelExecute(Sender: TObject);
    procedure frxRep1GetValue(const VarName: string; var Value: Variant);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bTodayClick(Sender: TObject);
    procedure bYesterdayClick(Sender: TObject);
    procedure teFIOClick(Sender: TObject);
    procedure teFIOEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure teFIOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure teNumKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bClearFilterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aUsersExecute(Sender: TObject);
    procedure aEditSysdbaExecute(Sender: TObject);
    procedure aChangeUserExecute(Sender: TObject);
    procedure TVListFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure aCDExecute(Sender: TObject);
    procedure TVListAFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure pcMainChange(Sender: TObject);
    procedure dsListAfterOpen(DataSet: TDataSet);
    procedure aTextAExecute(Sender: TObject);
    procedure aWebAExecute(Sender: TObject);
    procedure aXMLAExecute(Sender: TObject);
    procedure aExcelAExecute(Sender: TObject);
    procedure aJournalExecute(Sender: TObject);
    procedure aPrepareExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actListShowExecute(Sender: TObject);
    procedure DicomServerCore1NormalisedReceived(
      AClientThread: TDicomClientThread; AAddress: string;
      ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
    procedure cbDatesPropertiesChange(Sender: TObject);
    procedure teMKClick(Sender: TObject);
    procedure teMKEnter(Sender: TObject);
    procedure teMKKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actLoadFileExecute(Sender: TObject);
    procedure ActLoadFolderExecute(Sender: TObject);
    procedure APrintFolderExecute(Sender: TObject);
    procedure actTextFolderExecute(Sender: TObject);
    procedure actWebFolderExecute(Sender: TObject);
    procedure actXMLFolderExecute(Sender: TObject);
    procedure actExcelFolderExecute(Sender: TObject);
    procedure actToArchiveExecute(Sender: TObject);
    procedure MyCnsDicomConnection1CGETProcess(Sender: TObject;
      ADataset: TDicomAttributes; AImageCount: Integer);
    procedure tvServCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure DicomServerCore1DicomImage(AClientThread: TDicomClientThread;
      AAddress: string; ADataset: TDicomDataset);
    procedure aPrintRemoteExecute(Sender: TObject);
    procedure aTextRemoteExecute(Sender: TObject);
    procedure aWebRemoteExecute(Sender: TObject);
    procedure aXMLRemoteExecute(Sender: TObject);
    procedure aExcelRemoteExecute(Sender: TObject);
    procedure cbTypeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure aSetServExecute(Sender: TObject);
    procedure aRefServExecute(Sender: TObject);
    procedure aEchoServExecute(Sender: TObject);
    procedure tvServCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure actKeyListShowExecute(Sender: TObject);
    procedure DicomServerCore1DicomAssociation(
      AClientThread: TDicomClientThread; AAddress: string; AReg: TRequest;
      var AHandleType: Integer);
    procedure DicomServerCore1DicomFind(AClientThread: TDicomClientThread;
      AAddress: string; ACommand: TDicomAttributes; ARequestDatasets,
      AResponseDatasets: TList);
    procedure DicomServerCore1DicomGet(AClientThread: TDicomClientThread;
      AAddress: string; ACommand: TDicomAttributes; ARequestDatasets,
      AResponseDatasets: TList);
    procedure aSavToLocDBExecute(Sender: TObject);
    procedure aToLocSendExecute(Sender: TObject);
    procedure aTextLocExecute(Sender: TObject);
    procedure aWebLocExecute(Sender: TObject);
    procedure aXMLLocExecute(Sender: TObject);
    procedure aExcelLocExecute(Sender: TObject);
    procedure aPrintLocExecute(Sender: TObject);
    procedure aClearRemoteExecute(Sender: TObject);
    procedure aClearTVExecute(Sender: TObject);
    procedure aClearLocExecute(Sender: TObject);
    procedure aClearFolderExecute(Sender: TObject);
    procedure aDelSnimokExecute(Sender: TObject);
    procedure cxTabSheet3Show(Sender: TObject);
    procedure actLoadDiskExecute(Sender: TObject);
    procedure bbInformationClick(Sender: TObject);
    procedure bbImportPDFClick(Sender: TObject);
    procedure aDiagnozExecute(Sender: TObject);
    procedure ClrOsnDiagBtnClick(Sender: TObject);
    procedure ClrDopDiagBtnClick(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure aSetUnsetListImagesExecute(Sender: TObject);
    procedure dsListPeriodAfterScroll(DataSet: TDataSet);
    procedure dListImagesAfterScroll(DataSet: TDataSet);
    procedure cxButton1Click(Sender: TObject);
  private
    Russian : HKL; // для переключения раскладки
    wm : Integer; // workmode (режим работы: 1 - по дате, 2 - по периоду, 3 - без дат)
    vLstImages : Boolean;
    procedure CheckEnabledButtons;
    procedure pListImages;
    procedure RefrImages;
  public
    bCancel : Boolean;
    v_isnot_show_3d_loc : Boolean;
    sDir, sDirRemote : string;
    v_DicomServerStart : Boolean;
    v_cur_remote_pacs : string ;  // текущий АЕ удаленного пакса
  //  bCancel : Boolean; //
    sCalledAETitle : string; // Called AE Title (заголовок вызываемого dicom-узла(сервера))
    sCallingAETitle : string; // Calling AE Title (заголовок вызывающего dicom-узла(клиента))
    sUser : string; // имя пользователя, вошедшего в систему
    sPass : string; // пароль пользователя, вошедшего в систему
    sPort, sIP : string; // настройки удаленного подключения к серверу (порт, IP-адрес сервера)
    sCDDir : string; // настройки - дирректория подготовки исследований для записи на диск
    sLocalPort : string; // Порт приема данных
    sDBpath : string;
    sIMGpath : string;
    MWLReceiveDatasets: TList;
//    v_formlist : TList;
    procedure DoShowForm;
    procedure DoRestoreParams;
    procedure AddListGridItem(pDA: TDicomAttributes);
    // процедура проверки параметров и запуска локального сервера
    // для приемки/отправки снимков
    procedure p_try_pacs_start;
    // процедура проверки параметров и остановки локального сервера
    procedure p_try_pacs_stop;
    // процедура проверки установок для запуска сервера
    function f_chk_serv_parms:boolean;
    procedure MyOnTerminate(Sender: TObject);
    procedure Logout(DataBase: TpFIBDatabase);
    procedure SumitSQL(AClientThread: TDicomClientThread; ADBStr,
      ASQL: string; AFetchCount: Integer; UseMultiDatabase: Boolean;
      Params: TDicomAttribute; var AResult: TDataSet);
    procedure ExecSQL(asql: string);
    procedure PrmSetUniServ;
    procedure PrmSetOraServ;
    function MyTestFile( AClientThread: TDicomClientThread;
                                      p_SERIESUID : string;
                                      p_INSTANCEUID : string;
                                      p_IMGNO : string;
                                      basedir : string
                                    ): string;
    function MyTestDcmFileDir( AClientThread: TDicomClientThread;
                                        p_STUDYUID    : string;
                                        p_STUDIESDATE : TDateTime;
                                        p_IMAGEDATE   : TDateTime;
                                        p_IMAGETYPE   : string;
                                        p_base_dir    : string;
                                        var AImageDir : string): Boolean;
    function AppendImage( AClientThread: TDicomClientThread;
                                       DA: TDicomAttributes;
                                       StudyID, PName,
                                       PDateBorn, PSex, PatientID: string;
                                       StudyDate: TDateTime;
                                       StudyUID, SeriesUID,
                                       InstanceUID, ImageType, AID: string;
                                       var AModility: string;
                                       StudyDescription,
                                       PhysName: string;
                                       AccessionNumber : string;
                                       p_Selected2 : integer = 0
                                     ): TDatetime;
  end;

const c_ini_file = 'DicomClient.ini';

type t_snimki_rec = record
  f_CallingTitle   : string;
  f_TransactionUID : string;
  f_StudyUID       : string;
  f_amm_received   : integer;
  f_text           : ansistring;
  f_SessionID      : integer;
end;

var
  v_studyUID_img_sav_lst : array of t_snimki_rec;
  vIsLog  : Boolean;
  vLogFile : string;

  frmMain: TfrmMain;
  v_ip_fb : string; // ip-адрес БД firebird
  v_exe_path : AnsiString;

function read_db_ip:string;

procedure Local_Refr;

// сохранение параметров
procedure param_sav ( const p_port : string;
                      const p_ip : string;
                      const p_CalledTitle : string;
                      const p_CallingTitle : string;
                   //   const p_localport : string;
                      const p_CDDir : string;
                       const p_DBpath : string;
                       const p_IMGpath : string
                    );
// чтение параметров
procedure param_read ( var p_SERVER_PORT : string;
                       var p_SERVER_IP : string;
                       var p_CalledTitle : string;
                       var p_CallingTitle : string;
                       var p_localport : string;
                       var p_CDDir : string;
                       var p_DBpath : string;
                       var p_IMGpath : string
                     );

// сохраняем в реестр последнего юзера
procedure param_session_save ( const p_LAST_USER:string );
// чтение из реестра последнего юзера
procedure param_session_read ( var p_LAST_USER : string );

// сохраняем в реестр установки интерфейса
procedure param_forms_save ( const p_ISDATES : integer );

// чтение из реестра установок интерфейса
procedure param_forms_read ( var p_ISDATES : integer );

procedure get_conn_paramsMN ( var p_CnsDicomConnection1: TCnsDicomConnection );

procedure gt_cur_remote_pacs ( var p_CnsDicomConnection1: TCnsDicomConnection );

implementation

uses fSnimki, uPeriod, fParams, fLogin, fUsers, fEditSys, pFIBProps,
     fuserInfo, fCD, fJur, fProgressCD, CmnUnit, DCM_UID, DICOM_CMN, JvJCLUtils,
     IniFiles, UnMultiFormsFrame, UnFrmProgressBar, fSendParam, DBTables,
     DICOM_charset, UnComment, unImportPDF, UnFrmDiagTree, UnAbout;

{$R *.dfm}

procedure TfrmMain.PrmSetUniServ;
begin
  UniServ.Sql.Text := 'select * from '+v_pg_Schema+'.devices where fn_type = 1';
  UniServ.Connection:=DB_CMN.PGconn;
  UniServ.Transaction:=DB_CMN.MnUniTransaction;
  UniServ.Open;
end;

procedure TfrmMain.PrmSetOraServ;
begin
  OraServ.SQL.Clear;
  OraServ.DeleteVariables;
  OraServ.Sql.Text := 'select * from pacs.DEVICES where FN_TYPE = :p_FN_TYPE ';
  OraServ.DeclareAndSet('p_FN_TYPE', otInteger, 1);
  OraServ.Session:=DB_CMN.OraConn;
  OraServ.Open;
end;

procedure gt_cur_remote_pacs ( var p_CnsDicomConnection1: TCnsDicomConnection );
var i:integer;
begin
  // определим текущий ПАКС из списка слева
  for i := 0 to frmMain.tvServ.DataController.RecordCount - 1 do
  begin
    if VarToStr(frmMain.tvServ.DataController.GetValue(i, frmMain.TvPRPACS.Index))<>'' then
      if frmMain.tvServ.DataController.Values[i, frmMain.TvPRPACS.Index] then
      begin
        p_CnsDicomConnection1.host := frmMain.tvServ.DataController.Values[i, frmMain.tvServIP.Index];
        p_CnsDicomConnection1.port := StrToInt(frmMain.tvServ.DataController.Values[i, frmMain.TvPort.Index]);
        p_CnsDicomConnection1.CalledTitle := frmMain.tvServ.DataController.Values[i, frmMain.tvServAET.Index];
        Break;
      end;
  end;
end;

procedure get_conn_paramsMN ( var p_CnsDicomConnection1: TCnsDicomConnection );
begin
  case frmMain.pcMain.ActivePageIndex of
  0: begin // архив
       p_CnsDicomConnection1.Host := frmMain.sIP;
       p_CnsDicomConnection1.Port := StrToInt(frmMain.sPort);
       p_CnsDicomConnection1.CalledTitle := frmMain.sCalledAETitle;
     end;
  1: begin  // локальная база
       p_CnsDicomConnection1.Host := 'localhost';
       p_CnsDicomConnection1.Port := StrToInt(frmMain.sLocalPort);
       p_CnsDicomConnection1.CalledTitle := frmMain.sCalledAETitle;
     end;
  2: begin  // удаленная база
       gt_cur_remote_pacs( p_CnsDicomConnection1 );
     end;
  else
    p_CnsDicomConnection1.Host := frmMain.sIP;
    p_CnsDicomConnection1.Port := StrToInt(frmMain.sPort);
    p_CnsDicomConnection1.CalledTitle := frmMain.sCalledAETitle;
  end;
end;

procedure TfrmMain.Logout(DataBase: TpFIBDatabase);
var i: Integer;
begin
  if not DataBase.Connected then
    Exit;
  for i := 0 to DataBase.TransactionCount - 1 do
    if TpFIBTransaction(DataBase.Transactions[i]).InTransaction then
      TpFIBTransaction(DataBase.Transactions[i]).Rollback;
      DataBase.CloseDataSets;
      DataBase.Close;
end;

// процедура проверки установок для запуска сервера
function TfrmMain.f_chk_serv_parms:boolean;
begin
  Result:=( FileExists(frmMain.sDBpath)
    and (Trim(frmMain.sDBpath)<>'')
    and (Trim(frmMain.sIMGpath)<>'')
    and DirectoryExists(frmMain.sIMGpath)
    );
end;

// процедура проверки параметров и запуска локального сервера
// для приемки/отправки снимков
procedure TfrmMain.p_try_pacs_start;
begin
  if lDB.Connected then
  begin
    if ltrWrite.Active then
      ltrWrite.Commit;
    if ltrRead.Active then
      ltrRead.Commit;
    lDB.Connected:=False;
  end;
  // CONNECT TO LOCAL FIREBIRD
  if f_chk_serv_parms then
  begin
    lDB.AliasName:='';
    lDB.DBName := frmMain.sDBpath;
    lDB.ConnectParams.UserName := 'sysdba';
    lDB.ConnectParams.Password := 'masterkey';
    try
      lDB.Connected := True;
    except
      on e:Exception do
      begin
        MessageDlg('error connect to database : '+E.Message, mtError, [mbOK], 0);
        Exit;
      end;
    end;
    try
      ltrRead.StartTransaction;
      ltrWrite.StartTransaction;
    except
      on e:Exception do
        begin
          MessageDlg('error start transaction: '+E.Message, mtError, [mbOK], 0);
          Exit;
        end;
    end;  
  end;
  // if not f_chk_serv_parms then MessageDlg('Локальное хранилище снимков недоступно', mtWarning, [mbOK], 0);
  // START LOCAL PACS
  DicomServerCore1.ServerPort := MyStrToInt(frmMain.sLocalPort);
  try
    DicomServerCore1.Start;
    v_DicomServerStart:=True;
  except
    MessageDlg('Порт '+inttostr(DicomServerCore1.ServerPort)+' занят', mtError, [mbOK], 0);
  end;
end;

// процедура проверки параметров и остановки локального сервера
procedure TfrmMain.p_try_pacs_stop;
begin
  if v_DicomServerStart then  
    DicomServerCore1.Stop;
  v_DicomServerStart:=False;
  if lDB.Connected then
  begin
    if ltrWrite.Active then
      ltrWrite.Commit;
    if ltrRead.Active then
      ltrRead.Commit;
    lDB.Connected:=False;
  end;
end;

// процедура чтения имени пакса для работы с удаленным хранилищем
procedure gt_pacs_ae_remote ( var p_ae_title : string);
var Reg : TRegIniFile;
begin
  Reg:=TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    p_ae_title := Reg.ReadString('\Software\Softmaster\DicomClient\'+frmMain.sUser, 'PACS_REMOTE_AE_TITLE', '');
  finally
    Reg.Free;
  end;
  if (Trim(p_ae_title)='') then
    if Trim(frmMain.sCalledAETitle)<>'' then
    begin
      p_ae_title   := frmMain.sCalledAETitle;
    end else if (Trim(p_ae_title)='') then
    begin
      p_ae_title   := DBparams_get ( 'SERVER',
                                     'AETITLE'
                                  //   frmMain.trRead,
                                  //   frmMain.DB
                                   );
    end;
end;

procedure set_cur_rem_paks( p_ae_remote:string );
var i:Integer; v_fnd:string;
begin
  // установим текущей закладкой
  for i := 0 to frmMain.tvServ.DataController.RecordCount - 1 do
  begin
    v_fnd:=frmMain.tvServ.DataController.Values[i, frmMain.tvServAET.Index];
    if v_fnd=p_ae_remote then
    begin
      frmMain.tvServ.DataController.BeginFullUpdate;
      frmMain.tvServ.DataController.SetValue( i,
                                              frmMain.TvPRPACS.Index,
                                              True
                                            );
      frmMain.tvServ.DataController.EndFullUpdate;
      frmMain.v_cur_remote_pacs:=p_ae_remote;
      Break;
    end;
  end;
end;

procedure rest_all_grd_fr_reg;
begin
  frmMain.TVList.StoreToRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVListDefault', True, [], 'TVList'); // поднимаем из реестра настройки грида
  frmMain.TVList.RestoreFromRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVList', False, False, [], 'TVList');
  frmMain.TVListA.StoreToRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVListADefault', True, [], 'TVListA'); // поднимаем из реестра настройки грида для архива
  frmMain.TVListA.RestoreFromRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVListA', False, False, [], 'TVListA');
  frmMain.TVFolderList.StoreToRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVFileListDefault', TRUE, [], 'TVFolderList');
  frmMain.TVFolderList.RestoreFromRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVFolderList', False, False, [], 'TVFolderList');
  frmMain.TVRemote.StoreToRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVRemoteDefault', TRUE, [], 'TVRemote');
  frmMain.TVRemote.RestoreFromRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVRemote', False, False, [], 'TVRemote');
end;

procedure sav_all_grd_to_reg;
begin
  frmMain.TVList.StoreToRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVList', TRUE, [], 'TVList');
  frmMain.TVListA.StoreToRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVListA', TRUE, [], 'TVListA');
  frmMain.TVList.StoreToRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVListUsers', TRUE, [], 'TVListUsers');
  frmMain.TVFolderList.StoreToRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVFolderList', TRUE, [], 'TVFolderList');
  frmMain.TVRemote.StoreToRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVRemote', TRUE, [], 'TVRemote');
end;

// процедура для сохранения имени пакса для работы с удаленным хранилищем
procedure wrt_pacs_ae_remote ( const p_ae_title : string );
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\DicomClient\'+frmMain.sUser, False) then
    begin
      Reg.CreateKey('\Software\Softmaster\DicomClient\'+frmMain.sUser);
    end;
  try
    Reg.WriteString('\Software\Softmaster\DicomClient\'+frmMain.sUser, 'PACS_REMOTE_AE_TITLE', p_ae_title );
  finally
    Reg.Free;
  end;
end;

// процедура чтения параметров из реестра
procedure ini_rd( var p_CallingTitle : string;
                  var p_CDDir : string
                );
var Reg : TRegIniFile;
begin
  Reg:=TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    p_CDDir        := Reg.ReadString('\Software\Softmaster\DicomClient', 'CD_DIR', '');
    p_CallingTitle := Reg.ReadString('\Software\Softmaster\DicomClient', 'CALLING_AE_TITLE', '');
  finally
    Reg.Free;
  end;
end;

// чтение параметров
procedure param_read ( var p_SERVER_PORT : string;
                       var p_SERVER_IP : string;
                       var p_CalledTitle : string;
                       var p_CallingTitle : string;
                       var p_localport : string;
                       var p_CDDir : string;
                       var p_DBpath : string;
                       var p_IMGpath : string
                     );
var v_tmp:string;
    v_ini : TIniFile;
begin
  // чтение ini-файла
  v_ini:=TIniFile.Create(v_exe_path+c_ini_file);
  try
    p_DBpath := v_ini.ReadString( c_1_razdel, 'LOCAL_DB', '' );
    p_IMGpath := v_ini.ReadString( c_1_razdel, с_1_9_LOCAL_CATALOG, '' );
  finally
    FreeAndNil(v_ini);
  end;
  p_SERVER_PORT   := DBparams_get ( 'SERVER',
                                    'PORT'{,
                                    frmMain.trRead,
                                    frmMain.DB  }
                                  );
  p_CalledTitle   := DBparams_get ( 'SERVER',
                                    'AETITLE'{,
                                    frmMain.trRead,
                                    frmMain.DB }
                                  );
  p_SERVER_IP     := DBparams_get ( 'SERVER',
                                    'IP'{,
                                    frmMain.trRead,
                                    frmMain.DB }
                                  );
  // параметры локального устройства DICOM
  if not gt_device_params ( p_CallingTitle,
                     '', // IP - если ищем по ip-адресу
                     nil,
                     v_tmp,         // возвращает локальный ip адрес (hostname) - не используется
                     p_localport     // возвращает локальный порт
                   ) then
  begin
    p_localport:='';
  end;                 
end;

// сохранение параметров
procedure param_sav ( const p_port : string;
                      const p_ip : string;
                      const p_CalledTitle : string;
                      const p_CallingTitle : string;
                   //   const p_localport : string;
                      const p_CDDir : string;
                      const p_DBpath : string;
                      const p_IMGpath : string
                    );
var Reg : TRegIniFile;
    v_ini : TIniFile;
begin
  // чтение ini-файла
  v_ini:=TIniFile.Create(v_exe_path+c_ini_file);
  try
    v_ini.WriteString( c_1_razdel, 'LOCAL_DB', p_DBpath);
    v_ini.WriteString( c_1_razdel, с_1_9_LOCAL_CATALOG, p_IMGpath);
  finally
    FreeAndNil(v_ini);
  end;
  // сохраняем в реестр AETitle локального устройства
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\DicomClient\', False) then
    begin
      Reg.CreateKey('\Software\Softmaster\DicomClient');
    end;
  try
    Reg.WriteString('\Software\Softmaster\DicomClient', 'CALLING_AE_TITLE', p_CallingTitle);
    Reg.WriteString('\Software\Softmaster\DicomClient', 'CD_DIR', p_CDDir);

    Reg.WriteString('\Software\Softmaster\DicomClient', 'SERVER_PORT', p_port);
    Reg.WriteString('\Software\Softmaster\DicomClient', 'SERVER_IP',  p_ip);
    Reg.WriteString('\Software\Softmaster\DicomClient', 'CALLED_AE_TITLE', p_CalledTitle);
  //  Reg.WriteString('\Software\Softmaster\DicomClient', 'LOCAL_PORT', p_localport);

  finally
    Reg.Free;
  end;
end;

// сохраняем в реестр последнего юзера
procedure param_session_save ( const p_LAST_USER : string );
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\DicomClient\', False) then
    begin
      Reg.CreateKey('\Software\Softmaster\DicomClient');
    end;
  try
    Reg.WriteString('\Software\Softmaster\DicomClient', 'LAST_USER', p_LAST_USER);
  finally
    Reg.Free;
  end;
end;

// чтение из реестра последнего юзера
procedure param_session_read ( var p_LAST_USER : string );
var Reg : TRegIniFile;
begin
  Reg:=TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\Softmaster\DicomClient', True);
    p_LAST_USER := Reg.ReadString('\Software\Softmaster\DicomClient', 'LAST_USER', '');
    if p_LAST_USER = '' then p_LAST_USER := 'SYSDBA';
  finally
    Reg.Free;
  end;
end;

// сохраняем в реестр установки интерфейса
procedure param_forms_save ( const p_ISDATES : integer );
begin
  with TRegIniFile.Create do
  begin
    try
      RootKey:=HKEY_CURRENT_USER;
      if not OpenKey('\Software\Softmaster\DicomClient\', False) then
        CreateKey('\Software\Softmaster\DicomClient');
      WriteInteger('\Software\Softmaster\DicomClient', 'ISDATES', p_ISDATES);
    finally
      Free;
    end;
  end;
end;

// чтение из реестра установок интерфейса
procedure param_forms_read ( var p_ISDATES : integer );
begin
  with TRegIniFile.Create do
  try
    RootKey:=HKEY_CURRENT_USER;
    OpenKey('\Software\Softmaster\DicomClient', True);
    p_ISDATES := ReadInteger('\Software\Softmaster\DicomClient', 'ISDATES', 0);
  finally
    Free;
  end;
end;

procedure TfrmMain.aCDExecute(Sender: TObject);
var CnsDicomConnection1 : TCnsDicomConnection; vDirTmp : string;
begin
  Application.CreateForm(TfrmCD, frmCD);
  try
    frmCD.vParentForm     := 1;
//    vDirTmp := frmMain.sCDDir;
    vDirTmp := GetTempDirectory+'\Dicom';
    if not DirectoryExists(vDirTmp) then CreateDir(vDirTmp);
    frmCD.lDir.Caption    := vDirTmp;
    frmCD.lbDir.Directory := vDirTmp;
    frmCD.vCDDir := vDirTmp;
    case frmMain.pcMain.ActivePageIndex of
    0: begin // архив
         frmCD.v_DataSet:=frmMain.sList.DataSet;
         frmCD.lKolvo.Caption := IntToStr(frmMain.TVList.DataController.RowCount);
       end;
    1: begin  // локальная база
         frmCD.v_DataSet:=frmMain.locList.DataSet;
         frmCD.lKolvo.Caption := IntToStr(frmMain.TVListA.DataController.RowCount);
       end;
    2: begin  // удаленная база
         frmCD.v_DataSet:=frmMain.DSRemote.DataSet;
         frmCD.lKolvo.Caption := IntToStr(frmMain.TVRemote.DataController.RowCount);
       end;
    3: begin // Из папки
         frmCD.v_DataSet:=frmMain.MDFolderFullList; // dsFolderList.DataSet;
         frmCD.lKolvo.Caption := IntToStr(frmMain.TVFolderList.DataController.RowCount);
       end;
    else
      frmCD.v_DataSet:=frmMain.sList.DataSet;
    end;
    frmCD.v_DataSet.First;
    while not frmCD.v_DataSet.EOf do
    begin
      frmCD.vStudyUIDList.Append( frmCD.v_DataSet.FieldByName('STUDYUID').AsString );
      frmCD.v_DataSet.Next;
    end;
    //
    frmCD.vActivePageIndex := frmMain.pcMain.ActivePageIndex ;
    if frmMain.pcMain.ActivePageIndex<>3 then  // НЕ из папки
    begin
      CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
      try
        get_conn_paramsMN ( CnsDicomConnection1 );
        frmCD.vCnsDicomConnectionHost           := CnsDicomConnection1.Host ;
        frmCD.vCnsDicomConnectionCalledTitle    := CnsDicomConnection1.CalledTitle ;
        frmCD.vCnsDicomConnectionPort           := CnsDicomConnection1.Port ;
        frmCD.vCnsDicomConnectionCallingAETitle := sCallingAETitle ;
      finally
        CnsDicomConnection1.Free;
      end;
    end;                         
    //
    frmCD.ShowModal;
  finally
    frmCD.Free;
  end;
end;

procedure TfrmMain.aChangeUserExecute(Sender: TObject);
var v_Login, v_ae_remote, v_fnd :string; i:Integer;
begin
  frmMain.Visible := False; // скрываем главную форму
//-->> 1. показываем форму авторизации
  Application.CreateForm(TfrmLogin, frmLogin);
  try
//-->> 2. поднимаем из реестра последнего юзера
    param_session_read ( v_Login );
    frmLogin.teLogin.Text:=v_Login;
//<<-- 2
    frmLogin.ShowModal;
    if frmLogin.ModalResult = mrOk then
      begin
        frmMain.Caption := 'Менеджер исследований '+GetModuleVersion+'. Пользователь: '+sUser;
//-->> 3. включаем транзакции на чтение (trWrite) и редактирование (trRead)
        if ((not v_isPostgres) and (not v_isOracle)) then
          cmn_trans_start;
//<<-- 3
//        deDate.Date := Trunc(Now); //!!!
        CheckEnabledButtons;
        deBegin.Properties.OnEditValueChanged := nil;
        deEnd.Properties.OnEditValueChanged := nil;
        deBegin.Date := Trunc(Now);
        deEnd.Date := Trunc(Now);
        deBegin.Properties.OnEditValueChanged := deBeginPropertiesEditValueChanged;
        deEnd.Properties.OnEditValueChanged := deEndPropertiesEditValueChanged;
        ActivateKeyboardLayout(russian, KLF_REORDER); //включаем русскую раскладку
        rest_all_grd_fr_reg;
//-->> 4. очищаем фильтр
        teFIO.Clear;
        teNum.Clear;
        cbType.Text := '';
//-->> 5. обнуляем dataset'ы
        MemPrnRemote.Close;
        MemPrnRemote.Open;
        dsListPeriod.Close;
        MDFolderList.Close;
        MDFolderList.Open;
        MDFolderFullList.Close;
        MDFolderFullList.Open;
//-->> 6. откроем 1-ю закладку
        pcMain.ActivePageIndex:=0;
//-->> 7. загрузим параметры из реестра
        frmMain.TVList.RestoreFromRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVList', False, False, [], 'TVList');
        frmMain.TVListA.RestoreFromRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVListA', False, False, [], 'TVListA');
        frmMain.TVFolderList.RestoreFromRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVFolderList', False, False, [], 'TVFolderList');
        frmMain.TVRemote.RestoreFromRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVRemote', False, False, [], 'TVRemote');
//-->> 8. сменим удаленный пакс
        if v_isOracle then begin
          PrmSetOraServ;
        end else if v_isPostgres then
        begin
          PrmSetUniServ;
        end else
        begin
          if not dsServ.Active then
          begin
            dsServ.Database := DB_CMN.DB;
            dsServ.Transaction := DB_CMN.trRead;
            dsServ.Open;
          end;
        end;
        // прочитаем AE пакса для работы с закладкой удаленная база
        gt_pacs_ae_remote ( v_ae_remote );
        // установим текущей закладкой
        for i := 0 to frmMain.tvServ.DataController.RecordCount - 1 do
        begin
          v_fnd:=frmMain.tvServ.DataController.Values[i, frmMain.tvServAET.Index];
          if v_fnd=v_ae_remote then
          begin
            frmMain.tvServ.DataController.BeginFullUpdate;
            frmMain.tvServ.DataController.SetValue( i,
                                                    frmMain.TvPRPACS.Index,
                                                    True
                                                  );
            frmMain.tvServ.DataController.EndFullUpdate;
            v_cur_remote_pacs:=v_ae_remote;
            Break;
          end;
        end;
//<<--
      end;
  finally
    frmLogin.Free;
  end;
//<<-- 1
  frmMain.Visible := True; // возвращаем главную форму
end;

procedure TfrmMain.aClearFolderExecute(Sender: TObject);
begin
  TVFolderList.RestoreFromRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVFileListDefault', FALSE, FALSE, [], 'TVFolderList');
end;

procedure TfrmMain.aClearLocExecute(Sender: TObject);
begin
  TVListA.RestoreFromRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVListADefault', FALSE, FALSE, [], 'TVListA');
end;

procedure TfrmMain.aClearRemoteExecute(Sender: TObject);
begin
  TVRemote.RestoreFromRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVRemoteDefault', FALSE, FALSE, [], 'TVRemote');
end;

procedure TfrmMain.aClearTVExecute(Sender: TObject);
begin
  TVList.RestoreFromRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVListDefault', FALSE, FALSE, [], 'TVList');
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure shimok_show ( p_key : Boolean = False );
var i, v_max_amm, v_max_amm2, i3i : Integer;
    v_pid_lst : TStringList;
    v_sel_rec : array of t_p_pid_list_rec;
    v_cxGridDBTableView : TcxGridDBTableView;
  function f_pid_chk (const p_pid:string):Boolean;
  var j:Integer; v_res:Boolean;
  begin
    v_res:=False;
    for j := 0 to v_pid_lst.Count - 1 do
      if v_pid_lst[j]=p_pid then
      begin
        v_res:=True;
        break;
      end;
    f_pid_chk:=v_res;
  end;
  procedure archiv_frm (p_RecordIndex:integer); 
  begin
    v_max_amm:= v_cxGridDBTableView.DataController.Values[p_RecordIndex, v_cxGridDBTableView.DataController.GetItemByFieldName('CNT').Index];
    v_max_amm2:=v_max_amm2+v_max_amm;
    SetLength(v_sel_rec,Length(v_sel_rec)+1);
    v_sel_rec[Length(v_sel_rec)-1].P_PID           := VarToStr( v_cxGridDBTableView.DataController.Values[p_RecordIndex, v_cxGridDBTableView.DataController.GetItemByFieldName('P_PID').Index] );
    v_sel_rec[Length(v_sel_rec)-1].P_ENAME         := VarToStr( v_cxGridDBTableView.DataController.Values[p_RecordIndex, v_cxGridDBTableView.DataController.GetItemByFieldName('P_ENAME').Index] );
    v_sel_rec[Length(v_sel_rec)-1].ACCESSIONNUMBER := VarToStr( v_cxGridDBTableView.DataController.Values[p_RecordIndex, v_cxGridDBTableView.DataController.GetItemByFieldName('ACCESSIONNUMBER').Index] );
    v_sel_rec[Length(v_sel_rec)-1].STUDYUID        := VarToStr( v_cxGridDBTableView.DataController.Values[p_RecordIndex, v_cxGridDBTableView.DataController.GetItemByFieldName('STUDYUID').Index]);
    v_sel_rec[Length(v_sel_rec)-1].MODALITY        := VarToStr( v_cxGridDBTableView.DataController.Values[p_RecordIndex, v_cxGridDBTableView.DataController.GetItemByFieldName('STUDIES_IMAGE_TYPE').Index]);
    if not f_pid_chk(VarToStr( v_cxGridDBTableView.DataController.Values[p_RecordIndex, v_cxGridDBTableView.DataController.GetItemByFieldName('P_PID').Index])) then
      v_pid_lst.Add(VarToStr( v_cxGridDBTableView.DataController.Values[p_RecordIndex, v_cxGridDBTableView.DataController.GetItemByFieldName('P_PID').Index]));
  end;
  procedure remote_frm (p_RecordIndex:integer);
  begin
    v_max_amm2:=v_max_amm2+v_max_amm;
    SetLength(v_sel_rec,Length(v_sel_rec)+1);
    v_sel_rec[Length(v_sel_rec)-1].P_PID           := VarToStr( frmMain.TVRemote.DataController.Values[p_RecordIndex, frmMain.P_PID_1.Index] );
    v_sel_rec[Length(v_sel_rec)-1].P_ENAME         := VarToStr( frmMain.TVRemote.DataController.Values[p_RecordIndex, frmMain.VPAC_1.Index] );
    v_sel_rec[Length(v_sel_rec)-1].ACCESSIONNUMBER := VarToStr( frmMain.TVRemote.DataController.Values[p_RecordIndex, frmMain.VACNUMBER_1.Index]) ;
    v_sel_rec[Length(v_sel_rec)-1].STUDYUID        := VarToStr( frmMain.TVRemote.DataController.Values[p_RecordIndex, frmMain.VSTUDYUID_1.Index]);
    v_sel_rec[Length(v_sel_rec)-1].MODALITY        := VarToStr( frmMain.TVRemote.DataController.Values[p_RecordIndex, frmMain.VMODALITY_1.Index]);
    if not f_pid_chk(VarToStr( frmMain.TVRemote.DataController.Values[p_RecordIndex, frmMain.P_PID_1.Index])) then
      v_pid_lst.Add(VarToStr( frmMain.TVRemote.DataController.Values[p_RecordIndex, frmMain.P_PID_1.Index]));
  end;
begin
  v_max_amm:=0;
  v_max_amm2:=0;
// -- проверки
  if frmMain.pcMain.ActivePageIndex = 0 then // архив
  begin
    v_cxGridDBTableView := frmMain.cxGridDBTableView1;
  end else
  if frmMain.pcMain.ActivePageIndex = 1 then // локальная база
  begin
    v_cxGridDBTableView := frmMain.TVListA;
  end else
  if frmMain.pcMain.ActivePageIndex = 3 then // из папки
  begin
    v_cxGridDBTableView := frmMain.TVFolderList;
  end;
  if (frmMain.sIP = '') or (frmMain.sIP = '0') then
    begin
      MessageDlg('Вы не можете просматривать снимки с сервера!'+#13+#10+
                 'Не установлен IP-адрес сервера!', mtWarning, [mbOK], 0);
      Exit;
    end;
  if (frmMain.sPort = '') or (frmMain.sPort = '0') then
    begin
      MessageDlg('Вы не можете просматривать снимки с сервера!'+#13+#10+
                 'Не установлен порт соединения с сервером!', mtWarning, [mbOK], 0);
      Exit;
    end;
// -- снимки
  try
    Screen.Cursor := crHourGlass;
    v_pid_lst := TStringList.Create;
    SetLength(v_sel_rec,0);
    if frmMain.pcMain.ActivePageIndex = 2 then // удаленная база
    begin
      for I := 0 to frmMain.TVRemote.Controller.SelectedRecordCount - 1 do
        begin
          if frmMain.TVRemote.Controller.SelectedRecords[I].Selected then
            remote_frm (frmMain.TVRemote.Controller.SelectedRecords[i].RecordIndex);
        end;
    end else   // архив или "из папки"
    begin
      for I := 0 to v_cxGridDBTableView.Controller.SelectedRecordCount - 1 do
        begin
          if v_cxGridDBTableView.DataController.Controller.SelectedRecords[I].Selected then
            archiv_frm (v_cxGridDBTableView.Controller.SelectedRecords[i].RecordIndex);
        end;
    end;
    // True - не отображать 3D меню и не загружать dll 3D обработки
    frmMain.v_isnot_show_3d_loc := not MyStrToBool(
                       DBparams_get ('STATION',        // SECTION
                                     'USE_3D_LIBRARY' // KEY
                                   //  frmMain.trRead,   // FIBTransaction
                                   //  frmMain.DB        // TpFIBDatabase
                                    )
                                 );
    Application.CreateForm(TfrmSnimki, frmSnimki);
    with TIniFile.Create(v_exe_path+c_ini_file) do
      try
        frmSnimki.v_is_log  := (ReadString('LOG', 'is_log', '0')='1');
        frmSnimki.v_logfile :=  ReadString('LOG', 'logfile', '');
        if pos('\',frmSnimki.v_logfile)<=0 then
          frmSnimki.v_logfile:=ExtractFilePath(Application.ExeName)+frmSnimki.v_logfile;
        if frmSnimki.v_is_log then        
          WriteString('LOG', 'is_log','1')
        else
          WriteString('LOG', 'is_log','0');
        WriteString('LOG', 'logfile', frmSnimki.v_logfile);
      finally
        Free;
      end;
    v_is_moveDCM:=False;  
    case frmMain.pcMain.ActivePageIndex of
    0: begin
         frmSnimki.v_pr_data_fr := 0;   // архив
         if v_pid_lst.Count > 0 then
           frmSnimki.DoShowForm_P_PID( v_pid_lst,
                                       v_sel_rec,
                                       v_max_amm2,
                                       frmMain.MDFolderFullList,
                                       DB_CMN.trRead,
                                       DB_CMN.DB,
                                       frmMain.sIP,
                                       frmMain.sPort,
                                       frmMain.sCalledAETitle,
                                       frmMain.sCallingAETitle,
                                       frmMain.sUser,
                                       p_key,
                                       frmMain.v_isnot_show_3d_loc, // True - не отображать 3D меню и не загружать dll 3D обработки
                                       v_isPostgres,
                                       PGconn,
                                       MnUniTransaction
                                     );
       end;
    1: begin
         frmSnimki.v_pr_data_fr := 0;   // локальная база
         if v_pid_lst.Count > 0 then
           frmSnimki.DoShowForm_P_PID(v_pid_lst,
                                   v_sel_rec,
                                   v_max_amm2,
                                   frmMain.MDFolderFullList,
                                   frmMain.ltrRead,
                                   frmMain.lDB,
                                   'localhost', // frmMain.sIP,
                                   frmMain.sLocalPort, // sPort,
                                   frmMain.sCalledAETitle,  // для локальной БД не используется
                                   frmMain.sCallingAETitle,
                                   frmMain.sUser,
                                   p_key,
                                   frmMain.v_isnot_show_3d_loc,  // True - не отображать 3D меню и не загружать dll 3D обработки
                                   v_isPostgres,
                                   PGconn,
                                   MnUniTransaction
                                   );
       end;
    3: begin
         frmSnimki.v_pr_data_fr := 1;   // из папки
         if v_pid_lst.Count > 0 then
           frmSnimki.DoShowForm_P_PID(v_pid_lst,
                                   v_sel_rec,
                                   v_max_amm2,
                                   frmMain.MDFolderFullList,
                                   DB_CMN.trRead,
                                   DB_CMN.DB,
                                   frmMain.sIP,
                                   frmMain.sPort,
                                   frmMain.sCalledAETitle,
                                   frmMain.sCallingAETitle,
                                   frmMain.sUser,
                                   p_key,
                                   frmMain.v_isnot_show_3d_loc,  // True - не отображать 3D меню и не загружать dll 3D обработки
                                   v_isPostgres,
                                   PGconn,
                                   MnUniTransaction
                                   );
       end;
    2: begin
         frmSnimki.v_pr_data_fr := 2;   // удаленная база
         v_is_moveDCM:=True;
         if v_pid_lst.Count > 0 then
         // определим текущий ПАКС из списка слева
         for i3i := 0 to frmMain.tvServ.DataController.RecordCount - 1 do
         begin
           if VarToStr(frmMain.tvServ.DataController.GetValue(i3i, frmMain.TvPRPACS.Index))<>'' then
           if frmMain.tvServ.DataController.Values[i3i, frmMain.TvPRPACS.Index] then
           begin
              frmSnimki.DoShowForm_P_PID(  v_pid_lst,
                                           v_sel_rec,
                                           v_max_amm2,
                                           frmMain.MDFolderFullList,
                                           DB_CMN.trRead,
                                           DB_CMN.DB,
                                           frmMain.tvServ.DataController.Values[i3i, frmMain.tvServIP.Index], // frmMain.sIP,
                                           frmMain.tvServ.DataController.Values[i3i, frmMain.TvPort.Index], // frmMain.sPort,
                                           frmMain.tvServ.DataController.Values[i3i, frmMain.tvServAET.Index], // frmMain.sCalledAETitle,
                                           frmMain.sCallingAETitle,
                                           frmMain.sUser,
                                           p_key,
                                           frmMain.v_isnot_show_3d_loc,  // True - не отображать 3D меню и не загружать dll 3D обработки
                                           v_isPostgres,
                                           PGconn,
                                           MnUniTransaction
                                        );
              Break;
           end;
         end;
       end;
    end;
    if v_pid_lst.Count > 0 then
      begin
        frmSnimki.Visible:=False;
        if v_exit_progressbar<>1 then // не было отмены пользователем
          frmSnimki.ShowModal;
      end;
  finally
    Screen.Cursor := crDefault;
    FreeAndNil(frmSnimki);
    Application.ProcessMessages;
    FreeAndNil(v_pid_lst);
    SetLength(v_sel_rec, 0);
  end;
end;

procedure TfrmMain.actListShowExecute(Sender: TObject);
begin //
 // try
    shimok_show(False);
 // except
 // end;
end;

procedure TfrmMain.actTextFolderExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVFolderList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGrid1, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGrid1, TRUE, TRUE);
end;

procedure TfrmMain.MyCnsDicomConnection1CGETProcess(Sender: TObject;
  ADataset: TDicomAttributes; AImageCount: Integer);
begin  //
  FrmProgressBar.MyIncPos;
  if CmnUnit.v_exit_progressbar=1 then
  begin
    MyDisconnectAssociation( (Sender as TCnsDicomConnection) );
  end;
end;

procedure TfrmMain.aSavToLocDBExecute(Sender: TObject);  // проверяем архив
var v_cxGridDBTableView : TcxGridDBTableView;
    v_sel_amm, i, RecIdx, ColIdx, v_iii, v_amm_sel : integer;
    v_STUDYUID : string;
    CnsDicomConnection1, CnsDicomConnection2 : TCnsDicomConnection;
    das : TDicomAttributes ;
    da1 : TDicomDataset;
    v_res : Boolean;
begin // aSavToLocDB
  if not f_chk_serv_parms then
    Exit; // если не подключена локальная база - выход
  case pcMain.ActivePageIndex of
  0: v_cxGridDBTableView:=frmMain.TVList;        // архив
 { 2: v_cxGridDBTableView:=frmMain.TVRemote;       // удаленная база
  3: v_cxGridDBTableView:=frmMain.TVFolderList; } // из папки  - одно место
  else
    Exit;
  end;
  // проверим что список не пустой
  if (v_cxGridDBTableView.DataController.RecordCount>0) then
  begin
    Screen.Cursor := crHourGlass;
    Application.CreateForm(TFrmProgressBar, FrmProgressBar);
    try
      v_res:=True;
      v_sel_amm:=v_cxGridDBTableView.Controller.SelectedRecordCount;
      v_amm_sel:=0;
      for I := 0 to v_sel_amm - 1 do
      begin
        if v_cxGridDBTableView.DataController.Controller.SelectedRecords[I].Selected then
          Inc(v_amm_sel);
      end;
      CmnUnit.v_exit_progressbar:=0;
      // инициализируем ползунок - чтобы что-то показать
      FrmProgressBar.clc_pos( False, // is_on_top
                  'Сохранение исследований в локальной базе',
                  v_amm_sel, // кол-во
                  True   // один ползунок
                );
      FrmProgressBar.clc_posMain( v_amm_sel, // 0-не отображать ползунок
                    'Сохранение исследований в локальной базе',
                     True
                  );
      // инициализация переменных для ползунка
      MyIniMove;
      //
      for I := 0 to v_sel_amm - 1 do
      begin
        if CmnUnit.v_exit_progressbar=1 then Break;
        if v_cxGridDBTableView.DataController.Controller.SelectedRecords[I].Selected then
        begin  // цикл по записям
          FrmProgressBar.MyIncPos('Сохранение исследований ' +
                  inttostr(i+1)+'/'+inttostr(v_amm_sel));
          RecIdx := v_cxGridDBTableView.Controller.SelectedRecords[i].RecordIndex;
          v_STUDYUID:='';
          case pcMain.ActivePageIndex of
          0: begin // архив
               ColIdx := v_cxGridDBTableView.DataController.GetItemByFieldName('STUDYUID').Index;
               v_STUDYUID := VarToStr(v_cxGridDBTableView.DataController.Values[RecIdx, ColIdx]);
             end;
        {  2: begin // удаленная база
               ColIdx := v_cxGridDBTableView.DataController.GetItemByFieldName('STUDYUID').Index;
               v_STUDYUID := v_cxGridDBTableView.DataController.Values[RecIdx, ColIdx];
             end;
          3: begin // из папки
               ColIdx := v_cxGridDBTableView.DataController.GetItemByFieldName('STUDYUID').Index;
               v_STUDYUID := v_cxGridDBTableView.DataController.Values[RecIdx, ColIdx];
             end;  }
          end;
          CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
          try
            CnsDicomConnection1.Host := frmMain.sIP;
            CnsDicomConnection1.Port := StrToInt(frmMain.sPort);
            CnsDicomConnection1.CalledTitle := frmMain.sCalledAETitle;
            CnsDicomConnection1.CallingTitle := frmMain.sCallingAETitle;
            CnsDicomConnection1.ReceiveTimeout := c_Timeout;
            DCM_Connection.PDUTempPath:=GetTempDirectory;
            // оформим запрос к хранилищу
            das := TDicomAttributes.Create;
            das.AddVariant(78, 'STUDY');
            das.AddVariant(dStudyInstanceUID, v_STUDYUID );
            if CnsDicomConnection1.C_GET(das) then // получаем снимки
            begin
              for v_iii := 0 to CnsDicomConnection1.ReceiveDatasets.Count - 1 do // отображаем снимки
              begin
                da1 := TDicomDataset.Create(TDicomAttributes(CnsDicomConnection1.ReceiveDatasets[v_iii]));
                // получили dataset - теперь отправим его
                CnsDicomConnection2 := TCnsDicomConnection.Create(nil);
                try
                  CnsDicomConnection2.Host := 'localhost';
                  CnsDicomConnection2.Port := StrToInt(sLocalPort);
                  CnsDicomConnection2.CalledTitle := sCallingAETitle;
                  CnsDicomConnection2.CallingTitle := 'LOCALSTORAGE';
                  CnsDicomConnection2.ReceiveTimeout := c_Timeout;
                  DCM_Connection.PDUTempPath:=GetTempDirectory;
                  if not CnsDicomConnection2.C_STORAGE(da1.Attributes) then
                    v_res:=False;
                finally
                  MyDisconnectAssociation(CnsDicomConnection2);
                  CnsDicomConnection2.Free;
                  da1.Free;
                end;
              end;
              CnsDicomConnection1.ReceiveDatasets.Clear;
            end else
              v_res:=False;
          finally
            MyDisconnectAssociation(CnsDicomConnection1);
            CnsDicomConnection1.Free;
          end;
        end;
      end;
      if CmnUnit.v_exit_progressbar=1 then
      begin
        MessageDlg('Сохранение денных прервано пользователем', mtInformation, [mbOK], 0);
      end else
      if v_res then
      begin
        MessageDlg('Данные сохранены в локальную базу', mtInformation, [mbOK], 0);
      end else
      begin
        MessageDlg('Ошибка сохранения данных в локальную базу ...', mtError, [mbOK], 0);
      end;
    finally
      chk_close; // закроем ползунок
      FreeAndNil(FrmProgressBar);
      Screen.Cursor := crDefault;
    end;
  end else
    MessageDlg('Нет отмеченных исследований', mtWarning, [mbOK], 0);
end;

procedure TfrmMain.actToArchiveExecute(Sender: TObject);
var v_cxGridDBTableView : TcxGridDBTableView;
    i,j,p, ColIdx, RecIdx, v_sel_amm, v_rec_amm,
    v_TransferSyntax, v_TransferSyntax1 :integer;
    CnsDicomConnection1: TCnsDicomConnection;
    v_SOPInstanceLst : TStringList;
    v_DCMAttr: TDicomAttributes;
    v_Host, v_STUDYUID : string;
    v_Port : integer;
    v_CalledAETitle, v_CallingTitle, v_TransactionUID : string;
    v_res : Boolean;
    v_CnsDMTable_tmp : TCnsDMTable;
    vMemoryStream : TMemoryStream;
begin  // в архив
  case pcMain.ActivePageIndex of
  0: v_cxGridDBTableView:=frmMain.TVList;        // архив
  1: v_cxGridDBTableView:=frmMain.TVListA;       // локальная база
  3: v_cxGridDBTableView:=frmMain.TVFolderList;  // из папки  - одно место
  else
    Exit;
  end;
  // проверим что список не пустой
  if (v_cxGridDBTableView.DataController.RecordCount>0) then
  begin
    with TfrmSendParam.Create(nil) do
    begin
      if v_isPostgres or v_isOracle then begin
        gt_pacs_aetitle ( v_device_name,
                          v_device_comm,
                          nil,
                          nil,
                          frmMain.sCalledAETitle,
                          frmMain.sUser
                        );
      end else begin
        gt_pacs_aetitle ( v_device_name,
                          v_device_comm,
                          DB_CMN.trRead,
                          DB_CMN.DB,
                          frmMain.sCalledAETitle,
                          frmMain.sUser
                        );

      end;
      EdtAETitle.Text := v_device_comm + ' ('+v_device_name+')';
      if ShowModal = mrok then
      begin
        // сохраним в реестр
        wrt_pacs_aetitle ( v_device_name, v_device_comm, frmMain.sUser );
        v_Host          := teServer;
        v_Port          := tePort;
        v_CalledAETitle := v_device_name;
        v_CallingTitle  := frmMain.sCallingAETitle;
        // список отмеченных
        Application.CreateForm(TFrmProgressBar, FrmProgressBar);
        v_SOPInstanceLst := TStringList.Create;
        try
          Screen.Cursor := crHourGlass;
          // проверим компрессию
          // frmSendParam.ZipQuality - качество сжатия
          v_TransferSyntax:=gt_id_transfer_syntax(pr_zip);
          if v_TransferSyntax=-1 then // не нашли  // PrivateTransferSyntax
          begin
            CnsDicomConnection1 := TCnsDicomConnection.Create(nil); //  v_TransferSyntax
            v_CnsDMTable_tmp := TCnsDMTable.Create(nil);
            try
              try
                v_CnsDMTable_tmp.LoadFromFile(frmMain.MDFolderFullList.FieldByName('FILENAME').AsString);
              except
                on E:Exception do ShowMessage('Error : '+E.Message);
              end;
              v_DCMAttr:=v_CnsDMTable_tmp[0].Attributes;
              try
                if v_DCMAttr.ImageData=nil then
                  v_TransferSyntax := ExplicitVRLittleEndian
                else
                  v_TransferSyntax := v_DCMAttr.ImageData.ImageData[0].TransferSyntax; // ImplicitVRLittleEndian;
              except
                v_TransferSyntax := ExplicitVRLittleEndian; //JPEGLossless ;
              end;
              CnsDicomConnection1.MySetTransferSyntax( v_TransferSyntax );
            //  CnsDicomConnection1.MySetTransferSyntax( 8194 ); // ExplicitVRLittleEndian
              { ImplicitVRLittleEndian = 8193;
                ExplicitVRLittleEndian = 8194;
                ExplicitVRBigEndian = 8195;  }
            //  CnsDicomConnection1.MySetTransferSyntax( 8193 );   //   JPEGLossless
            finally
              v_CnsDMTable_tmp.Free;
            end;
          end
          else
          begin
            CnsDicomConnection1 := TCnsDicomConnection.Create(nil); //  v_TransferSyntax
            CnsDicomConnection1.MySetTransferSyntax(v_TransferSyntax, ZipQuality);
          end;
          try
            CnsDicomConnection1.OnCGETProcess:=MyCnsDicomConnection1CGETProcess;
            CnsDicomConnection1.Host := v_Host;
            CnsDicomConnection1.Port := v_Port;
            CnsDicomConnection1.CalledTitle := v_CalledAETitle;
            CnsDicomConnection1.CallingTitle := v_CallingTitle;
            CnsDicomConnection1.ReceiveTimeout := c_Timeout;
            DCM_Connection.PDUTempPath:=GetTempDirectory;
            v_res:=True;
            CmnUnit.v_exit_progressbar:=0;
            v_sel_amm:=v_cxGridDBTableView.Controller.SelectedRecordCount;
            // инициализируем ползунок - чтобы что-то показать
            FrmProgressBar.clc_pos( False, // is_on_top
                        'Отправка исследований пациента',
                        v_sel_amm,
                        (v_sel_amm=1)
                      );
            FrmProgressBar.clc_posMain( 0, // 0-не отображать ползунок
                            'Загрузка снимка',
                             (v_sel_amm=1)
                          );
            // инициализация переменных для ползунка
            MyIniMove;
            for I := 0 to v_sel_amm - 1 do
            begin
              if v_cxGridDBTableView.DataController.Controller.SelectedRecords[I].Selected
              then
              begin
                RecIdx := v_cxGridDBTableView.Controller.SelectedRecords[i].RecordIndex;
                ColIdx := v_cxGridDBTableView.DataController.GetItemByFieldName('STUDYUID').Index;
                v_STUDYUID := VarToStr(v_cxGridDBTableView.DataController.Values[RecIdx, ColIdx]);
                // цикл по - выборка v_STUDYUID
                frmMain.MDFolderFullList.First;
                v_rec_amm:=0;  // определим количество записей
                while not frmMain.MDFolderFullList.Eof do
                begin
                  if frmMain.MDFolderFullList.FieldByName('STUDYUID').AsString=v_STUDYUID then
                    Inc(v_rec_amm);
                  frmMain.MDFolderFullList.Next;
                end;
                FrmProgressBar.MyIncPosMain(
                 ' Отправка исследований пациента '+inttostr(i+1)+'/'+inttostr(v_sel_amm));
                // инициализация второго ползунка
                FrmProgressBar.clc_posMain( v_rec_amm, // 0-не отображать ползунок
                                'Загрузка снимка',
                                 (v_sel_amm=1)
                              );
                frmMain.MDFolderFullList.First;
                j:=0;
                while not frmMain.MDFolderFullList.Eof do
                begin
                  if CmnUnit.v_exit_progressbar=1 then Break;
                  if frmMain.MDFolderFullList.FieldByName('STUDYUID').AsString=v_STUDYUID then
                  begin
                    Inc(j);
                    //v_Stream := TMemoryStream.Create;
                    v_CnsDMTable_tmp := TCnsDMTable.Create(nil);
                    try
                    //  TBlobField(frmMain.MDFolderFullList.FieldByName('ffile')).SaveToStream(v_Stream);
                    //  v_CnsDMTable_tmp.LoadFromStream(v_Stream);
                      if FileExists(frmMain.MDFolderFullList.FieldByName('FILENAME').AsString) then
                      begin
                        v_CnsDMTable_tmp.LoadFromFile(frmMain.MDFolderFullList.FieldByName('FILENAME').AsString);
                        for p := 0 to v_CnsDMTable_tmp.Count - 1 do
                        begin
                          try
                            if v_CnsDMTable_tmp[p].Attributes.ImageData=nil then
                              v_TransferSyntax1 := -1
                            else
                              v_TransferSyntax1 := v_CnsDMTable_tmp[p].Attributes.ImageData.ImageData[0].TransferSyntax; // ImplicitVRLittleEndian;
                          except
                            v_TransferSyntax1 := -1;
                          end;
                          if v_TransferSyntax <>
                             v_TransferSyntax1 then
                          begin
                            vMemoryStream := TMemoryStream.Create;
                            try
                              v_CnsDMTable_tmp[p].SaveToStream(vMemoryStream, True, v_TransferSyntax, ZipQuality );
                              v_CnsDMTable_tmp[p].LoadFromStream(vMemoryStream);
                            finally
                              vMemoryStream.Free;
                            end;
                          end;
                          v_DCMAttr:=v_CnsDMTable_tmp[p].Attributes;
                          FrmProgressBar.MyIncPos('Отправка снимка '+inttostr(j)+'/'+
                            inttostr(v_rec_amm));
                          If CnsDicomConnection1.C_STORAGE( v_DCMAttr ) then
                          begin  // 27.07.2012 FOMIN
                            v_SOPInstanceLst.Add(v_DCMAttr.GetString(dSOPInstanceUID));
                          end else
                          begin
                            v_res:=False;
                          end;
                        end;
                      end else
                      begin
                        v_res:=False;
                      end;
                    finally
                    //  v_Stream.Free;
                      v_CnsDMTable_tmp.Clear;
                      v_CnsDMTable_tmp.Free;
                    end;
                  end;
                  frmMain.MDFolderFullList.Next;
                end;
              end;
            end;
          finally
            MyDisconnectAssociation(CnsDicomConnection1);
            CnsDicomConnection1.Free;
          end;
          // --> проверка если необходимо
          // процесс не был прерван пользователем
          if CmnUnit.v_exit_progressbar<>1 then begin
            // 27.07.2012 FOMIN  STORAGE COMMITMENT
            if v_res then begin
              if (v_SOPInstanceLst.Count>0)
              then begin
                v_TransactionUID:=GenTransactionUID(v_CallingTitle);
                SC_init(v_TransactionUID);
                if MyStrToBool( DBparams_get (
                                   'DICOM', // c_DICOM,   // SECTION
                                   'ST_COMM_CONF_AFT_ST' // KEY
                                //   frmMain.trRead, // FIBTransaction
                                //   frmMain.DB      // TpFIBDatabase
                                  )
                               ) then
                begin
                  if f_Storage_Commitment_CMD (  v_SOPInstanceLst,
                       v_CalledAETitle, v_CallingTitle, v_Host, v_Port,
                       v_TransactionUID
                  )
                  then begin
                    Screen.Cursor := crHourGlass;
                    Storage_commitment_res_Show(v_TransactionUID);
                  end else begin
                    ShowMessage('Ошибка запроса STORAGE COMMITMENT ...');
                  end;
                end else begin
                  MessageDlg('Данные отправлены на PACS', mtInformation, [mbOK], 0);
                end;
              end;
            end else
            begin
              ShowMessage('Данные не отправлены ...');
            end;
          end;
        finally
          FreeAndNil(v_SOPInstanceLst);
          chk_close; // закроем ползунок
          Screen.Cursor := crDefault;
        end;
      end;
      Free;
    end;
  end;
end;

procedure TfrmMain.actWebFolderExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVFolderList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGrid1, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGrid1, TRUE, TRUE);
end;

procedure TfrmMain.actXMLFolderExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVFolderList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGrid1, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGrid1, TRUE, TRUE);
end;

procedure TfrmMain.aDelSnimokExecute(Sender: TObject);
var v_sel_amm, i, RecIdx, ColIdx : integer;
    v_STUDYUID, v_P_PID : string;
    v_filename : ansistring;
    FIBDataSet : TpFIBDataSet;
    v_Qr : TpFIBQuery;
    y, m, d : Word;
    CnsDicomConnection1: TCnsDicomConnection;
    DA : TDicomAttributes;
begin // удалить снимок
case pcMain.ActivePageIndex of
  0: begin      // архив
        if (frmMain.cxGridDBTableView1.DataController.RecordCount>0) and    // проверим что список не пустой
           (frmMain.cxGridDBTableView1.Controller.SelectedRecordCount>0)    // проверим что есть отмеченные
        then
        begin
          if (Trim(frmMain.sIP)='') or
             (StrToInt(frmMain.sPort)=0) or
             (Trim(frmMain.sCallingAETitle)='')
          then
          begin
            MessageDlg('Не определены параметры PACS сервера.', mtWarning, [mbOK], 0);
            Exit;
          end;
          if MessageDlg('Удалить выбранные записи ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            Screen.Cursor := crHourGlass;
            for I := 0 to frmMain.cxGridDBTableView1.Controller.SelectedRecordCount - 1 do
            begin
              if frmMain.cxGridDBTableView1.DataController.Controller.SelectedRecords[I].Selected
              then
              begin
                RecIdx := frmMain.cxGridDBTableView1.Controller.SelectedRecords[i].RecordIndex;
                ColIdx := frmMain.cxGridDBTableView1.DataController.GetItemByFieldName('STUDYUID').Index;
                v_STUDYUID := VarToStr(frmMain.cxGridDBTableView1.DataController.Values[RecIdx, ColIdx]);
                if Trim(v_STUDYUID)<>'' then
                begin                
                  // собственно удаление
                  CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
                  DCM_Connection.PDUTempPath:=GetTempDirectory;
                  try
                    CnsDicomConnection1.Host := frmMain.sIP;
                    CnsDicomConnection1.Port := StrToInt(frmMain.sPort);
                    CnsDicomConnection1.CalledTitle := frmMain.sCalledAETitle;
                    CnsDicomConnection1.CallingTitle := frmMain.sCallingAETitle;
                    CnsDicomConnection1.v_is_log := vIsLog;
                    CnsDicomConnection1.v_log_filename := vLogFile;
                    // формирование запроса
                    DA := TDicomAttributes.Create;
                    //-->> level
                    DA.AddVariant(dQueryRetrieveLevel, 'STUDY' ); // 'STUDY' 'PATIENT'
                    //-->> STUDYUID
                    if Trim(v_STUDYUID)<>'' then begin
                      DA.AddVariant(dStudyInstanceUID, v_STUDYUID);  //  Add($0020, $000D);  // StudyInstanceUID
                    end;
                    if CnsDicomConnection1.N_DELETE( StudyRootQueryRetrieveInformationModelFIND, v_STUDYUID, DA ) then  //
                    begin
                      MessageDlg('Выполнено ...', mtInformation, [mbOK], 0);
                      CnsDicomConnection1.Clear;
                      CnsDicomConnection1.Disconnect;
                    end;
                  finally
                    Screen.Cursor := crDefault;
                    MyDisconnectAssociation(CnsDicomConnection1);
                    CnsDicomConnection1.Free;
                    Application.ProcessMessages;
                    Sleep(100);
                  end;
                end;
              end;
            end;
          end;
        end;
     end;
  1: begin      // локальная база
      // проверим что список не пустой
          if (frmMain.TVListA.DataController.RecordCount>0) then
          begin
            // проверим что есть отмеченные
            v_sel_amm:=frmMain.TVListA.Controller.SelectedRecordCount;
            if v_sel_amm>0 then
              if MessageDlg('Удалить выбранные записи ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
                for I := 0 to v_sel_amm - 1 do
                begin
                  if frmMain.TVListA.DataController.Controller.SelectedRecords[I].Selected
                  then
                  begin
                    RecIdx := frmMain.TVListA.Controller.SelectedRecords[i].RecordIndex;
                    ColIdx := frmMain.TVListA.DataController.GetItemByFieldName('STUDYUID').Index;
                    v_STUDYUID := VarToStr(frmMain.TVListA.DataController.Values[RecIdx, ColIdx]);
                    // собственно удаление
                    // 1. удаление файла снимка
                    FIBDataSet  := TpFIBDataSet.Create(nil);
                    try
                      FIBDataSet.Database    := lDB;
                      FIBDataSet.Transaction := ltrRead ;
                      FIBDataSet.SelectSQL.Text :=
                          'select s.ldate, s.studyuid, i.seriesuid, i.instanceuid, '+
                          ' i.imagetype, s.p_pid '+
                          ' from studies s, images i where i.studyuid=s.studyuid ' +
                          ' and s.studyuid=:p_studyuid';
                      FIBDataSet.ParamByName('p_studyuid').Value := v_STUDYUID;
                      FIBDataSet.Open;
                      v_P_PID:='';
                      While not FIBDataSet.Eof do
                      begin
                        // найдем файл снимка
                        DecodeDate(FIBDataSet.FieldByName('ldate').AsDateTime, y, m, d);
                        // ставим палку в конец строки если ее нет
                        if Copy(frmMain.sIMGpath,Length(frmMain.sIMGpath),1)='\' then
                          v_filename := frmMain.sIMGpath
                        else
                          v_filename := frmMain.sIMGpath+'\';
                        // имя файла берем как он сохраняется в паск сервере при приемке
                        v_filename:=v_filename+FIBDataSet.FieldByName('imagetype').AsString+'\'+
                                    IntToStr(y)+'\'+IntToStr(m)+'\'+IntToStr(d)+'\'+
                                    FIBDataSet.FieldByName('studyuid').AsString+'\'+
                                    FIBDataSet.FieldByName('seriesuid').AsString+'\'+
                                    FIBDataSet.FieldByName('instanceuid').AsString+ '.dcm';
                        if FileExists(v_filename) then
                          DeleteFile(v_filename);
                        v_P_PID:=FIBDataSet.FieldByName('p_pid').AsString;
                        FIBDataSet.Next;
                      end;
                    finally
                      FIBDataSet.Free;
                    end;
                    if v_P_PID<>'' then
                    begin
                      // 2. удаление записей в БД
                      // 2.1. удаление исследования
                      v_Qr := TpFIBQuery.Create(nil);
                      try
                        v_Qr.Database := lDB;
                        if ltrWrite.Active = False then
                          ltrWrite.StartTransaction;
                        v_Qr.Transaction := ltrWrite;
                        v_Qr.Options := v_Qr.Options + [qoAutoCommit];
                        v_Qr.SQL.Text :=
                          'delete from studies s where s.studyuid=:p_studyuid';
                        v_Qr.ParamByName('p_studyuid').AsString := v_STUDYUID;
                        v_Qr.ExecQuery;
                      finally
                        v_Qr.Free;
                      end;
                      // 2.3. если нет исследований по пациенту - удалить пациента
                      v_Qr := TpFIBQuery.Create(nil);
                      try
                        v_Qr.Database := lDB;
                        if ltrWrite.Active = False then
                          ltrWrite.StartTransaction;
                        v_Qr.Transaction := ltrWrite;
                        v_Qr.Options := v_Qr.Options + [qoAutoCommit];
                        v_Qr.SQL.Text :=
                          'delete from PATIENTS s where s.P_PID=:p_P_PID and '+
                          ' not exists(select 1 from studies s where s.studyuid=:p_studyuid)';
                        v_Qr.ParamByName('p_P_PID').AsString := v_P_PID;
                        v_Qr.ParamByName('p_studyuid').AsString := v_STUDYUID;
                        v_Qr.ExecQuery;
                      finally
                        v_Qr.Free;
                      end;
                      Local_Refr;
                    end;
                  end;
                end;
              end;
          end;
     end;
  2: begin
     end;       // удаленная база
  end;


end;

procedure TfrmMain.aDiagnozExecute(Sender: TObject);
begin  // список диагнозов
  Application.CreateForm(TfrmDiag, frmDiag);
  try
    frmDiag.ShowModal;
  finally
    frmDiag.Free;
  end;
end;

procedure TfrmMain.aEchoServExecute(Sender: TObject);
var v_fc_ip:String;
    v_fn_port:Integer;
    v_fc_title:String;
  procedure p_Myecho;
  begin
    if f_C_ECHO(v_fc_ip,
                IntToStr(v_fn_port),
                v_fc_title,
                sCallingAETitle) then
      begin
        MessageDlg('Сервер отвечает на запросы', mtInformation, [mbOK], 0);
      end else
      begin
        MessageDlg('Сервер не отвечает на запросы', mtError, [mbOK], 0);
      end;
  end;
  procedure ds_cmn ( pDS : TDataSet );
  begin
    if not pDS.Eof then
    begin
      v_fc_ip:=pDS.FieldByName('fc_ip').AsString;
      v_fn_port:=pDS.FieldByName('fn_port').AsInteger;
      v_fc_title:=pDS.FieldByName('fc_title').AsString;
      p_Myecho;
    end;
  end;
begin
  if v_isOracle then begin
    ds_cmn(OraServ);
  end else if v_isPostgres then begin
    ds_cmn(UniServ);
  end else begin
    ds_cmn(dsServ);
  end;
end;

procedure TfrmMain.aEditSysdbaExecute(Sender: TObject);
var ss : TpFIBSecurityService;
begin
  Application.CreateForm(TfrmEditSys, frmEditSys);
  try
    frmEditSys.ShowModal;
    if frmEditSys.ModalResult = mrOk then
      begin
        Screen.Cursor := crHourGlass;
        ss := TpFIBSecurityService.Create(nil);
        try
//-->> устанавливаем обязательные параметры для соединения (протокол, имя сервера или его IP-адрес)
          ss.Protocol := TCP;
          ss.ServerName := sIP;
          ss.LoginPrompt := False;
          ss.Params.Add('user_name='+frmMain.sUser);
          ss.Params.Add('password='+frmEditSys.teOldPass.Text);
          ss.UserName := 'SYSDBA';
          ss.Password := frmEditSys.tePass.Text;
          ss.Active := True;
          try
            ss.ModifyUser;
            MessageDlg('Пароль успешно изменен!', mtInformation, [mbOK], 0);
          except
            on e: Exception do
              begin
                MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
              end;
          end;
          ss.Active := False;
        finally
          Screen.Cursor := crDefault; 
          ss.Free;
        end;
      end;
  finally
    frmEditSys.Free;
  end;
end;

procedure TfrmMain.aExcelAExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVListA.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGrA, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGrA, TRUE, TRUE);
end;

procedure TfrmMain.aExcelExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, True, False)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, True, True);
end;

procedure TfrmMain.aExcelLocExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVListA.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGrA, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGrA, TRUE, TRUE);
end;

procedure TfrmMain.aExcelRemoteExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVRemote.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGrid3, True, False)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGrid3, True, True);
end;

procedure TfrmMain.aJournalExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmJur, frmJur);
  try
    frmJur.ShowModal;
  finally
    frmJur.Free;
  end;
end;

procedure TfrmMain.aParamExecute(Sender: TObject);
var v_is_restart : Boolean;
begin
  try
    Application.CreateForm(TfrmParams, frmParams);
    frmParams.sUserTest := sUser;
    frmParams.sPassTest := sPass;

    frmParams.cxIP.Text := frmMain.sIP;

    frmParams.teDBpath.Text := frmMain.sDBpath;
    frmParams.teIMGpath.Text := frmMain.sIMGpath;

    if sCDDir = '' then
      frmParams.teCDDir.Text := ExtractFileDir(Application.ExeName) // папка подготовки исследований для нарезки на CD
    else
      frmParams.teCDDir.Text := sCDDir;
    if sPort = '' then
      frmParams.cxPort.Text := '104'
    else
      frmParams.cxPort.Text := sPort; // порт соединения

    frmParams.teCalledTitle.Text :=  sCalledAETitle;
    frmParams.teCallingTitle.Text := sCallingAETitle;
    frmParams.teLocalPort.Text := sLocalPort;
    frmParams.ShowModal;
    if frmParams.ModalResult = mrOk then
      begin
        v_is_restart := ( (frmParams.teLocalPort.Text <> sLocalPort) or
                          (frmParams.teDBpath.Text <> frmMain.sDBpath) or
                          (frmParams.teIMGpath.Text <> frmMain.sIMGpath) );
//-->> 1 сохраняем настройки в реестр
        param_sav ( frmParams.cxPort.Text,
                    frmParams.cxIP.Text,
                    frmParams.teCalledTitle.Text,
                    frmParams.teCallingTitle.Text,
                  //  frmParams.teLocalPort.Text,
                    frmParams.teCDDir.Text,
                    frmParams.teDBpath.Text,
                    frmParams.teIMGpath.Text
                    );
        frmMain.sCallingAETitle:=frmParams.teCallingTitle.Text;
        frmMain.sCDDir:=frmParams.teCDDir.Text;
        param_read ( frmMain.sPort,
                   frmMain.sIP,
                   frmMain.sCalledAETitle,
                   frmMain.sCallingAETitle,
                   frmMain.sLocalPort,
                   frmMain.sCDDir,
                   frmMain.sDBpath,
                   frmMain.sIMGpath
                 );
        if v_is_restart  // если надо - перестартуем сервер
        then begin
          p_try_pacs_stop;
          p_try_pacs_start;
        end;
//<<-- 1
      //  DB.Connected := False;
        if ((not v_isOracle) and (not v_isPostgres)) then
        begin
          if Trim(v_ip_fb)='' then
          begin
            MessageDlg('Нет подключения к базе данных!'+#13+
                       'Обратитесь к системному администратору!', mtError, [mbOK], 0);
          end else
          begin
            DB_CMN.DB.DBName := v_ip_fb+':PACSBASE'; //sIP+':PACSBASE';
            if DB_CMN.DB.Connected = False then // БД коннестится по AliasName, который указывается в файле aliases.conf в папке сервера FireBird
            begin                        // папка сервера (обычно) : c:\Program Files\Firebird\Firebird_2.0\
              try
                DB_CMN.DB.Connected := True;
              except
                on e: Exception do
                  begin
                    MessageDlg('Не удалось подключиться к Базе Данных!'+#13+#10+'Ошибка: '+ e.Message+#13+#10+
                               'Проверьте параметры подключения к серверу БД, используя кнопку "Настройки"!' , mtError, [mbOK], 0);
                    aRefresh.Enabled := False;
                    aPrint.Enabled := False;
                    cxSplitter2.CloseSplitter;
                    Exit;
                  end;
              end;
              cmn_trans_start;
    //          deDate.Date := Trunc(Now); //!!!
              CheckEnabledButtons;
              deBegin.Properties.OnEditValueChanged := nil;
              deEnd.Properties.OnEditValueChanged := nil;
              deBegin.Date := Trunc(Now);
              deEnd.Date := Trunc(Now);
              deBegin.Properties.OnEditValueChanged := deBeginPropertiesEditValueChanged;
              deEnd.Properties.OnEditValueChanged := deEndPropertiesEditValueChanged;

              wm := 1;
              if cxSplitter2.State = ssClosed then
                cxSplitter2.OpenSplitter;
            end;
          end;
        end;
      end;
  finally
    frmParams.Free;
  end;
end;

procedure TfrmMain.aPrepareExecute(Sender: TObject);
var CnsDicomConnection1: TCnsDicomConnection;
    DA : TDicomAttributes;
    DDS : TDicomDataset;
    cnsTable : TCnsDMTable;
    i : Integer;
    y, m, d: Word;
    sDir, sCDDate : string;
    v_DataSet: TDataSet;
begin
  sCDDate := StringReplace(DateTimeToStr(Now), ':', '-', [rfReplaceAll, rfIgnoreCase]) + '\';
  case frmMain.pcMain.ActivePageIndex of
  0: begin // архив
       v_DataSet:=frmMain.sList.DataSet;
     end;
  1: begin  // локальная база
       v_DataSet:=frmMain.locList.DataSet;
     end;
  2: begin  // удаленная база
       v_DataSet:=frmMain.DSRemote.DataSet;
     end;
  3: begin // Из папки
       v_DataSet:=frmMain.dsFolderList.DataSet;
     end;
  else
    v_DataSet:=frmMain.sList.DataSet;
  end;
  v_DataSet.First;
  Screen.Cursor := crHourGlass;
  try
    Application.CreateForm(TfrmProgressCD, frmProgressCD); //-- открываем форму процесса
    frmProgressCD.Show;
    frmProgressCD.FormStyle := fsStayOnTop;
    frmProgressCD.cxProgressBar2.Position := 0;
    frmProgressCD.cxProgressBar2.Properties.Max := frmMain.TVList.DataController.RowCount;
    Application.ProcessMessages;
    while not v_DataSet.Eof do // организовываем цикл по отобранным исследованиям (по датасету)
    begin
      bCancel := False;
      CnsDicomConnection1 := TCnsDicomConnection.Create(nil); //-- создаем подключение, таблицу и dicom-атрибуты
      cnsTable := TCnsDMTable.Create(nil);
      DA := TDicomAttributes.Create;
      try
        get_conn_paramsMN(CnsDicomConnection1);
        CnsDicomConnection1.CallingTitle := frmMain.sCallingAETitle;
        CnsDicomConnection1.ReceiveTimeout := c_Timeout;
        DCM_Connection.PDUTempPath:=GetTempDirectory;
        if bCancel = True then Exit;
        frmProgressCD.lb2.Caption := 'Обрабатывается исследование - '+
                                     v_DataSet.FieldByName('P_PID').AsString+'-'+
                                     v_DataSet.FieldByName('P_ENAME_RUS').AsString+'-'+
                                     v_DataSet.FieldByName('STUDIES_IMAGE_TYPE').AsString;
        with DA do
        begin
          AddVariant(78, 'STUDY');    //   PATIENT   dPATIENTid
          AddVariant(dStudyInstanceUID, v_DataSet.FieldByName('STUDYUID').AsString); // dPatientID  v_DataSet.FieldByName('P_PID').AsString
//            AddVariant(78, 'PATIENT');
//            AddVariant($10, $20, v_DataSet.FieldByName('P_PID').AsString);
          if CnsDicomConnection1.C_GET(DA) then
            begin
              frmProgressCD.cxProgressBar1.Position := 0;
              frmProgressCD.cxProgressBar1.Properties.Max := CnsDicomConnection1.ReceiveDatasets.Count;
              Application.ProcessMessages;
              for i := 0 to CnsDicomConnection1.ReceiveDatasets.Count -1 do //-- цикл по снимкам (подгружаем в dicom-таблицу снимки)
                begin
                  if bCancel = True then Exit;
                  frmProgressCD.lb1.Caption := 'Обрабатывается снимок '+IntToStr(i+1);
                  DDS := TDicomDataset.Create(TDicomAttributes(CnsDicomConnection1.ReceiveDatasets[i]));
                  CnsTable.Add(DDS);
                  frmProgressCD.cxProgressBar1.Position := frmProgressCD.cxProgressBar1.Position + 1;
                  Application.ProcessMessages;
                end;
            end;
        end;
        frmProgressCD.cxProgressBar2.Position := frmProgressCD.cxProgressBar2.Position + 1;
        Application.ProcessMessages;
        DecodeDate(v_DataSet.FieldByName('LDATE').AsDateTime, y, m, d);
        sDir := frmMain.sCDDir + '\' +                                             // подготавливаем директорию
                sCDDate+
                v_DataSet.FieldByName('P_ENAME').AsString + '\' +
                IntToStr(d)+'.'+IntToStr(m)+'.'+IntToStr(y) + '\';
        if not DirectoryExists(sDir) then
          if not ForceDirectories(sDir) then
            raise Exception.Create('Не удаётся создать дирректорию ' + sDir);
        if bCancel = True then Exit;
        cnsTable.SaveToDicomDir(sDir, False);
      finally
        MyDisconnectAssociation(CnsDicomConnection1);
        CnsDicomConnection1.Free;
      end;
      v_DataSet.Next;
    end;
  finally
    Screen.Cursor := crDefault;
    frmProgressCD.lb1.Caption := 'Копируется просмотровщик...';
    CopyFile(PAnsiChar(ExtractFileDir(Application.ExeName)+'\DicomViewer.exe'), PAnsiChar(frmMain.sCDDir+'\'+sCDDate+'DicomViewer.exe'), True);
    frmProgressCD.Free;
  end;
  MessageDlg('Снимки успешно сохранены на жестком диске!'+#13+
             'Путь: '+sDir,
             mtInformation, [mbOK], 0);
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
begin
  frxDB1.DataSet := sList.DataSet;  // sList
  frxRep1.ShowReport;
end;

procedure TfrmMain.APrintFolderExecute(Sender: TObject);
begin //
  frxDB1.DataSet := dsFolderList.DataSet;
  frxRep1.ShowReport;
end;

procedure Archive_Refr;
var id, sFam, sIm, sOtch ,
    strIm, vIdStr : String;
    v_deBegin, v_deEnd : TDateTime;
  procedure GetFIO ;
  var flag : Integer;
  begin
    flag := 0;
    if Pos(' ', frmMain.teFIO.Text) = 0 then
    begin
      sFam := frmMain.teFIO.Text;
      flag := 1;
    end else
      sFam := copy(frmMain.teFIO.Text, 1, Pos(' ', frmMain.teFIO.Text));
    if flag = 1 then
      strIm := ''
    else
      strIm := trim(copy(frmMain.teFIO.Text, Length(sFam), Length(frmMain.teFIO.Text)+1 - Length(sFam)));
    sIm := trim(copy(strIm, 1, Pos(' ', strIm)));
    if sIm = '' then
      sIm := strIm;
    sOtch := trim(copy(strIm, Length(sIm)+1, Length(strIm)-Length(sIm)+1));
  end;
  procedure frmDiagTree ( pParentID:integer=-1; pDown:Boolean=True ) ;
  var vFIBQuery : TpFIBDataSet; vFK_ID : integer; 
  begin
    vFIBQuery := TpFIBDataSet.Create(nil);
    try
      vFIBQuery.Database := DB_CMN.DB;
      vFIBQuery.Transaction := DB_CMN.trRead;
      if DB_CMN.trRead.Active = False then
        DB_CMN.trRead.StartTransaction;
      if pDown then
      begin
        vFIBQuery.SQLs.SelectSQL.Text := 'select * from DIAGNOZ where FK_PARENTID=:FK_PARENTID order by fc_name';
        vFIBQuery.ParamByName('FK_PARENTID').AsInteger := pParentID;
      end else
      begin
        vFIBQuery.SQLs.SelectSQL.Text := 'select * from DIAGNOZ d where '+
           ' exists(select 1 from DIAGNOZ d1 where d1.FK_ID=:FK_ID and d1.FK_PARENTID=d.fk_id) order by fc_name';
        vFIBQuery.ParamByName('FK_ID').AsInteger := pParentID;
      end;
      vFIBQuery.Open; vFIBQuery.First;
      while not vFIBQuery.Eof do
      begin
        vIdStr:=vIdStr+','+inttostr(vFIBQuery.FieldByName('FK_ID').AsInteger);
        if pDown then
        begin
          vFK_ID := vFIBQuery.FieldByName('FK_ID').AsInteger ;
          frmDiagTree ( vFK_ID ) ;
        end else
        begin
          vFK_ID := vFIBQuery.FieldByName('FK_PARENTID').AsInteger ;
          if vFK_ID<>0 then          
            frmDiagTree ( vFK_ID ) ;
        end;
        vFIBQuery.Next;
      end;
    finally
      vFIBQuery.Free;
    end;
  end;
var vSQLstr : ansistring;
begin
  with frmMain do
  begin
    if Trim(deBegin.Text)='' then
    begin
      MessageDlg('Не задана дата начала периода !', mtWarning, [mbOK], 0);
      Exit;
    end else if Trim(deEnd.Text)='' then
    begin
      MessageDlg('Не задана дата окончания периода !', mtWarning, [mbOK], 0);
      Exit;
    end;
    if v_isOracle then     // ORACLE
    begin
      sList.DataSet:=OraListPeriod;
      OraListPeriod.Session := DB_CMN.OraConn ;
      OraListPeriod.SQL.Clear;
      OraListPeriod.DeleteVariables;
      OraListPeriod.SQL.Text := ' SELECT s.*, '+
        '        case s.P_SEX when ''F'' then ''Ж'' else ''М'' end as FP_SEX, '+
        '        (SELECT COUNT(1) FROM PACS.IMAGES i '+
                         ' WHERE i.P_PID = s.P_PID and i.STUDYUID=s.STUDYUID) AS CNT '+
        '   FROM PACS.STUDIES s, PACS.PATIENTS p '+
        '  WHERE s.P_PID = p.P_PID ';

    // -- 1. ФИО
      if teFIO.Text <> '' then
        begin
          GetFIO ;

          OraListPeriod.SQL.Add(' and p.P_FAM like :P_FAM '+ #13) ;
          OraListPeriod.SQL.Add(' and p.P_IM like :P_IM '+ #13) ;
          OraListPeriod.SQL.Add(' and p.P_OTCH like :P_OTCH '+ #13) ;
          OraListPeriod.DeclareAndSet('P_FAM',otstring, TRIM(SFAM) + '%');
          OraListPeriod.DeclareAndSet('P_IM',otstring, TRIM(SIM) + '%');
          OraListPeriod.DeclareAndSet('P_OTCH',otstring, TRIM(SOTCH) + '%');
        end;

        // поиск по дате рождения
        if Trim(deDateBorn.Text)<>'' then
        begin
          OraListPeriod.SQL.Add(' and p.p_DATEBORN >= :P_DATEBORN and p.P_DATEBORN < :P_DATEBORN+1 '+ #13#10) ;
          OraListPeriod.DeclareAndSet('P_DATEBORN',otDate, Trunc(deDateBorn.Date) );
        end;

    // -- 2. Номер МК(Медицинской карты) = PatientID
      if teMK.Text <> '' then
        begin
          OraListPeriod.SQL.Add(' and s.P_PID = :p_pid ');
          OraListPeriod.DeclareAndSet('p_pid',otstring, teMK.Text);
        end;
    // -- 3. Номер протокола = AccessionNumber
      if teNum.Text <> '' then
        begin
          OraListPeriod.SQL.Add(' and s.ACCESSIONNUMBER = :pan ');
          OraListPeriod.DeclareAndSet('pan',otstring, teNum.Text);
        end;
    // -- 4. Описание исследования
        if Trim(teRem.Text)<>'' then
        begin
          OraListPeriod.SQL.Add(' and s.STUDYDESCRIPTION like :pSTUDYDESCRIPTION ');
          OraListPeriod.DeclareAndSet('pSTUDYDESCRIPTION',otstring, '%'+teRem.Text+'%' );
        end;
    // -- 5. Модальность (тип исследования)
      if cbType.Text <> '' then
        begin
          OraListPeriod.SQL.Add(' and s.STUDIES_IMAGE_TYPE = :p_image_type ');
          OraListPeriod.DeclareAndSet('p_image_type',otstring, cbType.Text);
        end;
    // -- 6. Даты
      v_deBegin:=Trunc(deBegin.Date);
      v_deEnd:=IncDay(Trunc(deEnd.Date),1);
      OraListPeriod.SQL.Text := OraListPeriod.SQL.Text +
        ' AND s.LDATE >= :PFD_DATE1 '+ //  :PFD_DATE1
        ' AND s.LDATE < :PFD_DATE2 '; // :PFD_DATE2
      OraListPeriod.DeclareAndSet('pfd_date1',otDate, v_deBegin);
      OraListPeriod.DeclareAndSet('pfd_date2',otDate, v_deEnd);
      // OraListPeriod.SQL.SaveToFile('d:\1.sqltxt');
      sList.DataSet := OraListPeriod;
      OraListPeriod.Open;
    end else if v_isPostgres then
    begin
      sList.DataSet:=UniListPeriod;
      UniListPeriod.Connection:=PGconn;
      UniListPeriod.Transaction:=MnUniTransaction;
      UniListPeriod.UpdateTransaction:=MnUniTransaction;
      UniListPeriod.SQL.Text := ' SELECT s.*, '+
        '        case s.p_sex when ''F'' then ''Ж'' else ''М'' end as fp_sex, '+
        '        (SELECT COUNT(1) FROM '+v_pg_Schema+'.images as i '+
                         ' WHERE i.p_pid = s.p_pid and i.studyuid=s.studyuid) AS cnt '+
        '   FROM '+v_pg_Schema+'.studies as s, '+v_pg_Schema+'.patients as p '+
        '  WHERE s.p_pid = p.p_pid ';

    // -- 1. ФИО
      if teFIO.Text <> '' then
        begin
          GetFIO ;

          UniListPeriod.SQL.Add(' and p.p_fam like ''' + TRIM(SFAM) + '%'' '+ #13) ;
          UniListPeriod.SQL.Add(' and p.p_im like ''' + TRIM(SIM) + '%'' '+ #13) ;
          UniListPeriod.SQL.Add(' and p.p_otch like ''' + TRIM(SOTCH) + '%'' '+ #13) ;
        end;

        // поиск по дате рождения
        if Trim(deDateBorn.Text)<>'' then
        begin
          UniListPeriod.SQL.Add(' and p.P_DATEBORN >= :P_DATEBORN and p.P_DATEBORN < :P_DATEBORN+1 '+ #13#10) ;
          UniListPeriod.ParamByName('P_DATEBORN').AsDateTime := Trunc(deDateBorn.Date);
        end;

    // -- 2. Номер МК(Медицинской карты) = PatientID
      if teMK.Text <> '' then
        begin
          UniListPeriod.SQL.Add(' and s.p_pid = :p_pid ');
          UniListPeriod.ParamByName('p_pid').AsString := teMK.Text;
        end;
    // -- 3. Номер протокола = AccessionNumber
      if teNum.Text <> '' then
        begin
          UniListPeriod.SQL.Add(' and s.accessionnumber = :pan ');
          UniListPeriod.ParamByName('pan').AsString := teNum.Text;
        end;
    // -- 4. Описание исследования
        if Trim(teRem.Text)<>'' then
          begin
          UniListPeriod.SQL.Add(' and s.studydescription like :pSTUDYDESCRIPTION ');
          UniListPeriod.ParamByName('pSTUDYDESCRIPTION').AsString := '%'+teRem.Text+'%';
          end;
    // -- 5. Модальность (тип исследования)
      if cbType.Text <> '' then
        begin
          UniListPeriod.SQL.Add(' and s.studies_image_type = :p_image_type ');
          UniListPeriod.ParamByName('p_image_type').AsString := cbType.Text;
        end;
    // -- 6. Даты
      v_deBegin:=Trunc(deBegin.Date);
      v_deEnd:=IncDay(Trunc(deEnd.Date),1);
      UniListPeriod.SQL.Text := UniListPeriod.SQL.Text +
        ' AND s.ldate >= :PFD_DATE1::timestamp '+ //  :PFD_DATE1
        ' AND s.ldate < :PFD_DATE2::timestamp '; // :PFD_DATE2
      UniListPeriod.ParamByName('pfd_date1').AsDateTime := v_deBegin;
      UniListPeriod.ParamByName('pfd_date2').AsDateTime := v_deEnd;
      
      sList.DataSet := UniListPeriod;
      UniListPeriod.Open;

    end else
    begin
      sList.DataSet:=dsListPeriod;
      id := dsListPeriod.FieldByName('studyuid').AsString;
      dsListPeriod.DisableControls;
      dsListPeriod.Close;
      vSQLstr := ' SELECT STUDIES.*, '+#13#10+
        '        case (select count(1) from STUDYDOCS sd where '+#13#10+
        '                  sd.STUDYUID=STUDIES.STUDYUID) when 0 then -1 else 0 end as ExFiles,   '+#13#10+
        '        case studies.p_sex when ''F'' then ''Ж'' else ''М'' end as fp_sex, '+#13+
        '        (SELECT COUNT(1) FROM IMAGES WHERE P_PID = STUDIES.P_PID and images.studyuid=STUDIES.studyuid) AS CNT '+#13#10+
        '   FROM STUDIES, PATIENTS '+#13#10+
        '  WHERE STUDIES.LDATE >= :PFD_DATE1 '+#13#10+
        '    AND STUDIES.LDATE < :PFD_DATE2 + 1 '+#13#10+
        '    AND STUDIES.P_PID = PATIENTS.P_PID ';
    // -- 1. ФИО
      if teFIO.Text <> '' then
      begin
        GetFIO ;
        vSQLstr := vSQLstr + ' and patients.p_fam like :p_SFAM '#13#10 ;
        vSQLstr := vSQLstr + ' and patients.p_im like :p_SIM '#13#10 ;
        vSQLstr := vSQLstr + ' and patients.p_otch like :p_SOTCH '#13#10 ;
      end;

      // поиск по дате рождения
      if Trim(deDateBorn.Text)<>'' then
        vSQLstr := vSQLstr + ' and PATIENTS.P_DATEBORN >= :P_DATEBORN and PATIENTS.P_DATEBORN < :P_DATEBORN+1 '#13#10 ;

    // -- 2. Номер МК(Медицинской карты) = PatientID
      if teMK.Text <> '' then
        vSQLstr := vSQLstr + ' and studies.p_pid = :p_pid '#13#10;
    // -- 3. Номер протокола = AccessionNumber
      if teNum.Text <> '' then
        vSQLstr := vSQLstr + ' and studies.accessionnumber = :p_accessionnumber '#13#10;
    // -- 4. Описание исследования
      if Trim(teRem.Text)<>'' then
        vSQLstr := vSQLstr + ' and studies.STUDYDESCRIPTION like :p_STUDYDESCRIPTION '#13#10;
    // -- 5. Модальность (тип исследования)
      if cbType.Text <> '' then
        vSQLstr := vSQLstr + ' and studies.studies_image_type = :p_studies_image_type '#13#10;
    // -- 6. Даты
    // -- 7. Диагнозы
      if (dxTreeViewEdit1.Selected<>nil) and (dxTreeViewEdit1.Text<>'') then
      begin
        vIdStr:=IntToStr(Integer( dxTreeViewEdit1.Selected.Data ));
        frmDiagTree ( Integer( dxTreeViewEdit1.Selected.Data ), True ) ;
        frmDiagTree ( Integer( dxTreeViewEdit1.Selected.Data ), False ) ;
        if (Trim(vIdStr)<>'') then
        begin
          if Integer( dxTreeViewEdit1.Selected.Data )=-1 then
            vSQLstr := vSQLstr + ' and ((studies.FK_IDOSNDIAG=-1) or (studies.FK_IDOSNDIAG is null)) '#13#10
          else
            vSQLstr := vSQLstr + ' and studies.FK_IDOSNDIAG in ('+vIdStr+') '#13#10;
  //        dsListPeriod.SQLs.SelectSQL.Add(' and studies.FK_IDOSNDIAG = :FK_IDOSNDIAG ');
  //        dsListPeriod.ParamByName('FK_IDOSNDIAG').AsInteger := Integer( dxTreeViewEdit1.Selected.Data );
        end;
      end;
      if (dxTreeViewEdit2.Selected<>nil) and (dxTreeViewEdit2.Text<>'') then
      begin
        vIdStr:=IntToStr(Integer( dxTreeViewEdit2.Selected.Data ));
        frmDiagTree ( Integer( dxTreeViewEdit2.Selected.Data ), True ) ;
        frmDiagTree ( Integer( dxTreeViewEdit2.Selected.Data ), False ) ;
        if (Trim(vIdStr)<>'') then
        begin
          if Integer( dxTreeViewEdit2.Selected.Data )=-1 then
            vSQLstr := vSQLstr + ' and ((studies.FK_IDOSNDIAG=-1) or (studies.FK_IDOSNDIAG is null)) '#13#10
          else
            vSQLstr := vSQLstr + ' and studies.FK_IDDOPDIAG in ('+vIdStr+') '#13#10;
  //        dsListPeriod.SQLs.SelectSQL.Add(' and studies.FK_IDDOPDIAG = :FK_IDDOPDIAG ');
  //        dsListPeriod.ParamByName('FK_IDDOPDIAG').AsInteger := Integer( dxTreeViewEdit2.Selected.Data );
        end;
      end;
  //  AE
      if Trim(teAE.Text)<>'' then
        vSQLstr := vSQLstr + ' and FC_AEAPPARAT like :FC_AEAPPARAT ' ;

      dsListPeriod.Database := DB_CMN.DB;
      dsListPeriod.Transaction := DB_CMN.trRead;
      dsListPeriod.SQLs.SelectSQL.Clear;
      dsListPeriod.SelectSQL.Clear;
      dsListPeriod.SQLs.SelectSQL.Text := vSQLstr;
      dsListPeriod.SelectSQL.Text := vSQLstr ;

      if teFIO.Text <> '' then
      begin
        dsListPeriod.ParamByName('p_SFAM').AsString := TRIM(SFAM) + '%';
        dsListPeriod.ParamByName('p_SIM').AsString := TRIM(SIM) + '%';
        dsListPeriod.ParamByName('p_SOTCH').AsString := TRIM(SOTCH) + '%';
      end;

      // поиск по дате рождения
      if Trim(deDateBorn.Text)<>'' then
        dsListPeriod.ParamByName('P_DATEBORN').AsDate := Trunc(deDateBorn.Date);

    // -- 2. Номер МК(Медицинской карты) = PatientID
      if teMK.Text <> '' then
        dsListPeriod.ParamByName('p_pid').AsString := teMK.Text;
    // -- 3. Номер протокола = AccessionNumber
      if teNum.Text <> '' then
        dsListPeriod.ParamByName('p_accessionnumber').AsString := teNum.Text;
    // -- 4. Описание исследования
      if Trim(teRem.Text)<>'' then
        dsListPeriod.ParamByName('p_STUDYDESCRIPTION').AsString := '%'+teRem.Text+'%';
    // -- 5. Модальность (тип исследования)
      if cbType.Text <> '' then
        dsListPeriod.ParamByName('p_studies_image_type').AsString := cbType.Text;
    // -- 6. Даты
      dsListPeriod.ParamByName('pfd_date1').AsDate := Trunc(deBegin.Date);
      dsListPeriod.ParamByName('pfd_date2').AsDate := Trunc(deEnd.Date);
  //  AE
      if Trim(teAE.Text)<>'' then
        dsListPeriod.ParamByName('FC_AEAPPARAT').AsString := '%'+teAE.Text+'%';

      dsListPeriod.Open;
      dsListPeriod.EnableControls;
      dsListPeriod.Locate('studyuid', id, []);
    end;
  end;
end;

procedure Local_Refr;
var id : string;
    sFam, sIm, sOtch : String;
    strIm : String;
    flag : Integer;
begin
  with frmMain do
  begin
    id := dsListPeriod.FieldByName('studyuid').AsString;
    dslocListPeriod.DisableControls;
    dslocListPeriod.Close;
    dslocListPeriod.SQLs.SelectSQL.Text := ' SELECT STUDIES.*, '+#13#10+
      '        case studies.p_sex when ''F'' then ''Ж'' else ''М'' end as fp_sex, '+#13+
      '        (SELECT COUNT(*) FROM IMAGES WHERE P_PID = STUDIES.P_PID and images.studyuid=STUDIES.studyuid) AS CNT '+#13#10+
      '   FROM STUDIES, PATIENTS '+#13#10+
      '  WHERE STUDIES.LDATE >= :PFD_DATE1 '+#13#10+
      '    AND STUDIES.LDATE < :PFD_DATE2 + 1 '+#13#10+
      '    AND STUDIES.P_PID = PATIENTS.P_PID ';
  // -- 1. ФИО
    if teFIO.Text <> '' then
      begin
        flag := 0;
        if Pos(' ', teFIO.Text) = 0 then
          begin
            sFam := teFIO.Text;
            flag := 1;
          end else
          begin
            sFam := copy(teFIO.Text, 1, Pos(' ', teFIO.Text));
          end;

        if flag = 1 then
          strIm := ''
        else
          strIm := trim(copy(teFIO.Text, Length(sFam), Length(teFIO.Text)+1 - Length(sFam)));

        sIm := trim(copy(strIm, 1, Pos(' ', strIm)));
        if sIm = '' then
          sIm := strIm;

        sOtch := trim(copy(strIm, Length(sIm)+1, Length(strIm)-Length(sIm)+1));

        dslocListPeriod.SQLs.SelectSQL.Add(' and patients.p_fam like :P_SFAM '+ #13) ;
        dslocListPeriod.SQLs.SelectSQL.Add(' and patients.p_im like :P_SIM '+ #13) ;
        dslocListPeriod.SQLs.SelectSQL.Add(' and patients.p_otch like :P_SOTCH '+ #13) ;
        dslocListPeriod.ParamByName('P_SFAM').AsString := TRIM(SFAM) + '%';
        dslocListPeriod.ParamByName('P_SIM').AsString := TRIM(SIM) + '%';
        dslocListPeriod.ParamByName('P_SOTCH').AsString := TRIM(SOTCH) + '%';
      end;

      // поиск по дате рождения
      if Trim(deDateBorn.Text)<>'' then
      begin
        dslocListPeriod.SQLs.SelectSQL.Add(' and PATIENTS.P_DATEBORN >= :P_DATEBORN and PATIENTS.P_DATEBORN < :P_DATEBORN+1 '+ #13#10) ;
        dslocListPeriod.ParamByName('P_DATEBORN').AsDate := Trunc(deDateBorn.Date);
      end;

  // -- 2. Номер МК(Медицинской карты) = PatientID
    if teMK.Text <> '' then
      begin
        dslocListPeriod.SQLs.SelectSQL.Add(' and studies.p_pid = :p_pid ');
        dslocListPeriod.ParamByName('p_pid').AsString := teMK.Text;
      end;
  // -- 3. Номер протокола = AccessionNumber
    if teNum.Text <> '' then
      begin
        dslocListPeriod.SQLs.SelectSQL.Add(' and studies.accessionnumber = :pan ');
        dslocListPeriod.ParamByName('pan').AsString := teNum.Text;
      end;
  // -- 4. Описание исследования
      if Trim(teRem.Text)<>'' then
        begin
        dslocListPeriod.SQLs.SelectSQL.Add(' and studies.STUDYDESCRIPTION like :pSTUDYDESCRIPTION ');
        dslocListPeriod.ParamByName('pSTUDYDESCRIPTION').AsString := '%'+teRem.Text+'%';
        end;
  // -- 5. Модальность (тип исследования)
    if cbType.Text <> '' then
      begin
        dslocListPeriod.SQLs.SelectSQL.Add(' and studies.studies_image_type = :p_image_type ');
        dslocListPeriod.ParamByName('p_image_type').AsString := cbType.Text;
      end;
  // -- 6. Даты
    dslocListPeriod.ParamByName('pfd_date1').AsDate := Trunc(deBegin.Date);
    dslocListPeriod.ParamByName('pfd_date2').AsDate := Trunc(deEnd.Date);

    dslocListPeriod.Open;
    dslocListPeriod.EnableControls;
    dslocListPeriod.Locate('studyuid', id, []);
  end;
end;

procedure TfrmMain.AddListGridItem(pDA: TDicomAttributes);
var v_ENAME_RUS,
    v_ENAME,
    v_VDESC : string;
begin
  frmMain.MemPrnRemote.Append;
  Flds_to_charset (     pDA,
                        v_ENAME_RUS,
                        v_ENAME,
                        v_VDESC
                  );
  frmMain.MemPrnRemote.FieldByName('P_ENAME_RUS').AsString := v_ENAME_RUS;
  frmMain.MemPrnRemote.FieldByName('P_ENAME').AsString     := v_ENAME;
  frmMain.MemPrnRemote.FieldByName('VDESC').AsString       := v_VDESC;
  if Trim(pDA.GetString(dPatientBirthDate))<>'' then
    try
      frmMain.MemPrnRemote.FieldByName('P_DATEBORN').AsDateTime:= StrToDate(pDA.GetString(dPatientBirthDate));
    except
    end;
  frmMain.MemPrnRemote.FieldByName('P_SEX').AsString          := gt_sex(pDA.GetString(dPatientSex));
  if Trim(pDA.GetString(dStudyDate))<>'' then
    try
      frmMain.MemPrnRemote.FieldByName('LDATE').AsDateTime     := StrToDate(pDA.GetString(dStudyDate));
    except
    end;
  if pDA.GetString(dModality)<>'' then
    begin
      frmMain.MemPrnRemote.FieldByName('STUDIES_IMAGE_TYPE').AsString  := pDA.GetString(dModality);          // pDA.GetString($08, $61); // Модальность
    end
    else
      frmMain.MemPrnRemote.FieldByName('STUDIES_IMAGE_TYPE').AsString  := pDA.GetString(dModalitiesInStudy); // pDA.GetString($08, $61); // Модальность
  frmMain.MemPrnRemote.FieldByName('ACCESSIONNUMBER').AsString      :=   pDA.GetString(dAccessionNumber);
  frmMain.MemPrnRemote.FieldByName('STUDYUID').AsString      :=   pDA.GetString(dStudyInstanceUID);
  frmMain.MemPrnRemote.FieldByName('STUDYID').AsString       :=   pDA.GetString(dStudyID);
  frmMain.MemPrnRemote.FieldByName('P_PID').AsString           := pDA.GetString(dPatientID);
  frmMain.MemPrnRemote.Post;
end;

procedure Remote_Refr;
var DA, DA1: TDicomAttributes;
    DateRange, pacDateBrn: TDicomAttribute;
    i: Integer;
    CnsDicomConnection1: TCnsDicomConnection;
begin
  if (frmMain.teFIO.Text = '') and
     (frmMain.teMK.Text = '') and
     (frmMain.teNum.Text = '') and
     (frmMain.teRem.Text = '') and
     (frmMain.cbType.Text = '') and
     (frmMain.deBegin.Text = '') and
     (frmMain.deEnd.Text = '') and
     (frmMain.deDateBorn.Text = '')
  then
  begin
    if Application.MessageBox('Не установлено ни одно условие поиска. Сбор данных может занять продолжительное время! Продолжить?',
                              'Внимание!',
                              MB_YESNO+MB_ICONWARNING) <> mrYes
    then
      Exit;
  end;
  CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
  DCM_Connection.PDUTempPath:=GetTempDirectory;
  try
    Screen.Cursor := crHourGlass;
    frmMain.MemPrnRemote.Close;
    frmMain.MemPrnRemote.Open;
    // определим текущий ПАКС из списка слева
    gt_cur_remote_pacs( CnsDicomConnection1 );
    if (Trim(CnsDicomConnection1.Host)='') or
       (CnsDicomConnection1.Port=0) or
       (Trim(CnsDicomConnection1.CalledTitle)='')
    then
    begin
      MessageDlg('Не выбраны параметры PACS сервера.', mtWarning, [mbOK], 0);
    end else
    begin
      CnsDicomConnection1.CallingTitle := frmMain.sCallingAETitle; // Calling AE Title (заголовок вызывающего dicom-узла(клиента))
      // sLocalPort не используется для получения списка
      // формирование запроса
      DA := TDicomAttributes.Create;
      with DA do
      begin
  //-->> level
          AddVariant(dQueryRetrieveLevel, 'STUDY' ); // 'STUDY' 'PATIENT'
  //-->> модальность (тип исследования)
          if frmMain.cbType.Text<>'' then begin
            AddVariant(dModality, frmMain.cbType.Text); // Modality
            AddVariant(dModalitiesInStudy, frmMain.cbType.Text); // Modality
          end else begin
            Add($0008, $0061);   // ModalitiesInStudy
            Add($0008, $0060);   // Modality
          end;

  //-->> даты
          if (frmMain.deBegin.Text <> '') and
             (frmMain.deEnd.Text <> '')
          then begin
            daterange := Add($8, $20);
            daterange.AsDatetime[0] := frmMain.deBegin.Date; // StudyDate
            daterange.AsDatetime[1] := frmMain.deEnd.Date;
          end;
  //-->> ФИО пациента
          if frmMain.teFIO.Text <> '' then
            AddVariant(dPatientName, frmMain.teFIO.Text + '%')
          else
            Add($0010, $0010); // (Patient's Name)
  //-->> Дата рождения пациента
         if (frmMain.deDateBorn.Text <> '') then
         begin
           pacDateBrn := Add($0010, $0030);
           pacDateBrn.AsDatetime[0] := frmMain.deDateBorn.Date;
         end else
          Add($0010, $0030);  // PatientBirthDate

  //-->> Номер медкарты
          if frmMain.teMK.Text <> '' then
            AddVariant(dPatientId, frmMain.teMK.Text + '%' )
          else
            Add($0010, $0020); // (Patient's Id)
  //-->> Номер протокола
          if frmMain.teNum.Text <> '' then
            AddVariant(dAccessionNumber, frmMain.teNum.Text )
          else
            Add($0008, $0050); // (AccessionNumber)
  //-->> Описание исследования (Study Description)
         if frmMain.teRem.Text <> '' then
           AddVariant($0008, $1030, frmMain.teRem.Text + '%')
         else
           Add($0008, $1030); // StudyDescription
  //-->> Врач (Referring Physician Name)
         Add($0008, $0090); // ReferringPhysician'sName
         // Add($0008, $000D); - не нашел в описании
         Add($0008, $1090);  // ManufacturerModelName
         Add($0008, $0020);  // dStudyDate
         Add($0010, $0040);  // PatientSex
         Add($0010, $0030);  // dPatientBirthDate
         Add($0010, $0040);  // dPatientSex
         Add($0020, $0010);  // dStudyID
         Add($0020, $000D);  // StudyInstanceUID
         Add($0020, $000E);  // dSeriesInstanceUID
         Add($0008, $0005);  // CHARSET
      end;
      if CnsDicomConnection1.C_FIND(DA) then
      begin
        if CnsDicomConnection1.ReceiveDatasets.Count > 0 then
          begin
            for i := 0 to CnsDicomConnection1.ReceiveDatasets.Count - 1 do
            begin
                DA1 := TDicomAttributes(CnsDicomConnection1.ReceiveDatasets[i]);
                frmMain.MWLReceiveDatasets.Add(DA1);
                frmMain.AddListGridItem(DA1);
            end;
            CnsDicomConnection1.ReceiveDatasets.Clear;
          end
        else
          MessageDlg('Нет данных!', mtWarning, [mbOK], 0);
        CnsDicomConnection1.Clear;
        CnsDicomConnection1.Disconnect;
      end else
        MessageDlg('Ошибка на сервере! Обратитесь к администратору системы!', mtError, [mbOK], 0);
    end;
  finally
    Screen.Cursor := crDefault;
    MyDisconnectAssociation(CnsDicomConnection1);
    CnsDicomConnection1.Free;
    Application.ProcessMessages;
  end;
end;

procedure TfrmMain.aPrintLocExecute(Sender: TObject);
begin
  frxDB1.DataSet := locList.DataSet;  // sList
  frxRep1.ShowReport;
end;

procedure TfrmMain.aPrintRemoteExecute(Sender: TObject);
begin //
  frxDB1.DataSet := frmMain.DSRemote.DataSet;
    frxRep1.ShowReport;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin  // aRefresh/aRefreshExecute - Обновить список исследований
  case pcMain.ActivePageIndex of
  0: Archive_Refr;  // архив
  1: begin
       if not f_chk_serv_parms then
       begin
         MessageDlg('Локальное хранилище снимков недоступно', mtWarning, [mbOK], 0);
       end else
         Local_Refr;    // локальная база
     end;
  2: Remote_Refr;   // удаленная база
  end;
  CheckEnabledButtons;
end;

procedure TfrmMain.aRefServExecute(Sender: TObject);
var id : Integer;
begin
  if v_isOracle then begin
    OraServ.Close;
    PrmSetOraServ;
  end else if v_isPostgres then begin
    UniServ.Close;
    PrmSetUniServ;
  end else
  begin
    id := dsServ.FieldByName('fk_id').AsInteger;
    dsServ.Close;
    dsServ.Database := DB_CMN.DB;
    dsServ.Transaction := DB_CMN.trRead;
    dsServ.Open;
    dsServ.Locate('fk_id', id, []);
  end;
  set_cur_rem_paks(frmMain.v_cur_remote_pacs);
end;

procedure TfrmMain.aSetServExecute(Sender: TObject);
var i : Integer; v_cur_AE, v_fnd : string; v_eof:Boolean;
begin  // обработка dblClick на списке паксов
  if v_isOracle then begin
    v_eof := OraServ.Eof;
  end else if v_isPostgres then begin
    v_eof := UniServ.Eof;
  end else begin
    v_eof := dsServ.Eof;
  end;
  if not v_eof then
  begin
    // если уже выбран
    v_cur_AE:=frmMain.tvServ.DataController.Values[
           frmMain.tvServ.DataController.FocusedRecordIndex,
           frmMain.tvServAET.Index];
    v_fnd:=VarToStr( frmMain.tvServ.DataController.GetValue( frmMain.tvServ.DataController.FocusedRecordIndex,
                                                frmMain.TvPRPACS.Index ) );
    if (v_fnd='False') or (v_fnd='')  //  было условие: v_cur_remote_pacs<>v_cur_AE
    then
    begin
      if MessageDlg('Сменить удаленный сервер ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        for i := 0 to frmMain.tvServ.DataController.RecordCount - 1 do
        begin
          frmMain.tvServ.DataController.BeginFullUpdate;
          frmMain.tvServ.DataController.SetValue( i,
                                                  frmMain.TvPRPACS.Index,
                                                  False
                                                );
          frmMain.tvServ.DataController.EndFullUpdate;
        end;
        frmMain.tvServ.DataController.BeginFullUpdate;
        frmMain.tvServ.DataController.SetValue( frmMain.tvServ.DataController.FocusedRecordIndex,
                                                frmMain.TvPRPACS.Index,
                                                True
                                              );
        frmMain.tvServ.DataController.EndFullUpdate;
        frmMain.MemPrnRemote.Close;
        frmMain.MemPrnRemote.Open;
        // запишем в реестр
        wrt_pacs_ae_remote ( v_cur_AE );
        v_cur_remote_pacs:=v_cur_AE;

        CheckEnabledButtons;
      end;
    end;
  end;
end;

procedure TfrmMain.aSetUnsetListImagesExecute(Sender: TObject);
begin
  vLstImages := not vLstImages; // показать/скрыть список исследований
  pListImages;
end;

procedure TfrmMain.aTextAExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVListA.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGrA, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGrA, TRUE, TRUE);
end;

procedure TfrmMain.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aTextLocExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVListA.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGrA, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGrA, TRUE, TRUE);
end;

procedure TfrmMain.aTextRemoteExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVRemote.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGrid3, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGrid3, TRUE, TRUE);
end;

procedure TfrmMain.aToLocSendExecute(Sender: TObject);
var v_cxGridDBTableView : TcxGridDBTableView;
    i,j, ColIdx, RecIdx, v_sel_amm, v_rec_amm,
    v_TransferSyntax :integer;
    CnsDicomConnection1: TCnsDicomConnection;
    v_SOPInstanceLst : TStringList;
    v_DCMAttr: TDicomAttributes;
    v_Host, v_STUDYUID : string;
    v_Port : integer;
    v_CalledAETitle, v_CallingTitle, v_TransactionUID : string;
    v_res : Boolean;
    v_CnsDMTable_tmp : TCnsDMTable;
begin  // отправить в локальную базу
  v_Port:=0;
  v_Host:='';
  case pcMain.ActivePageIndex of
  0: v_cxGridDBTableView:=frmMain.TVList;        // архив
  1: v_cxGridDBTableView:=frmMain.TVListA;       // локальная база
  3: v_cxGridDBTableView:=frmMain.TVFolderList;  // из папки  - одно место вызова
  else
    Exit;
  end;
  // проверим что список не пустой
  if (v_cxGridDBTableView.DataController.RecordCount>0) then
  begin
    with TfrmSendParam.Create(nil) do
    begin
      SetShowPacsList(False);
      if ShowModal = mrok then
      begin
        Application.CreateForm(TFrmProgressBar, FrmProgressBar);
        v_SOPInstanceLst := TStringList.Create;
        try
          Screen.Cursor := crHourGlass;
          // проверим компрессию
          // frmSendParam.ZipQuality - качество сжатия
          v_TransferSyntax:=gt_id_transfer_syntax(pr_zip);
          if v_TransferSyntax=-1 then // не нашли
          begin
            CnsDicomConnection1 := TCnsDicomConnection.Create(nil); //  v_TransferSyntax
            CnsDicomConnection1.MySetTransferSyntax( ImplicitVRLittleEndian );  //  JPEGLossless
          end
          else
          begin
            CnsDicomConnection1 := TCnsDicomConnection.Create(nil); //  v_TransferSyntax
            CnsDicomConnection1.MySetTransferSyntax(v_TransferSyntax, ZipQuality);
          end;
          try
            CnsDicomConnection1.OnCGETProcess:=MyCnsDicomConnection1CGETProcess;
            CnsDicomConnection1.Host := 'localhost';
            CnsDicomConnection1.Port := StrToInt(sLocalPort);
            CnsDicomConnection1.CalledTitle := sCallingAETitle;
            CnsDicomConnection1.CallingTitle := 'LOCALSTORAGE';
            CnsDicomConnection1.ReceiveTimeout := c_Timeout;
            DCM_Connection.PDUTempPath:=GetTempDirectory;
            v_res:=True;
            CmnUnit.v_exit_progressbar:=0;
            v_sel_amm:=v_cxGridDBTableView.Controller.SelectedRecordCount;
            // инициализируем ползунок - чтобы что-то показать
            FrmProgressBar.clc_pos( False, // is_on_top
                        'Отправка исследований пациента',
                        v_sel_amm,
                        (v_sel_amm=1)
                      );
            FrmProgressBar.clc_posMain( 0, // 0-не отображать ползунок
                            'Загрузка снимка',
                             (v_sel_amm=1)
                          );
            // инициализация переменных для ползунка
            MyIniMove;
            for I := 0 to v_sel_amm - 1 do
            begin
              if v_cxGridDBTableView.DataController.Controller.SelectedRecords[I].Selected
              then
              begin
                RecIdx := v_cxGridDBTableView.Controller.SelectedRecords[i].RecordIndex;
                ColIdx := v_cxGridDBTableView.DataController.GetItemByFieldName('STUDYUID').Index;
                v_STUDYUID := VarToStr(v_cxGridDBTableView.DataController.Values[RecIdx, ColIdx]);
                // цикл по - выборка v_STUDYUID
                frmMain.MDFolderFullList.First;
                v_rec_amm:=0;  // определим количество записей
                while not frmMain.MDFolderFullList.Eof do
                begin
                  if frmMain.MDFolderFullList.FieldByName('STUDYUID').AsString=v_STUDYUID then
                    Inc(v_rec_amm);
                  frmMain.MDFolderFullList.Next;
                end;
                FrmProgressBar.MyIncPosMain(
                 ' Отправка исследований пациента '+inttostr(i+1)+'/'+inttostr(v_sel_amm));
                // инициализация второго ползунка
                FrmProgressBar.clc_posMain( v_rec_amm, // 0-не отображать ползунок
                                'Загрузка снимка',
                                 (v_sel_amm=1)
                              );
                frmMain.MDFolderFullList.First;
                j:=0;
                while not frmMain.MDFolderFullList.Eof do
                begin
                  if CmnUnit.v_exit_progressbar=1 then Break;
                  if frmMain.MDFolderFullList.FieldByName('STUDYUID').AsString=v_STUDYUID then
                  begin
                    Inc(j);
                    //v_Stream := TMemoryStream.Create;
                    v_CnsDMTable_tmp := TCnsDMTable.Create(nil);
                    try
                    //  TBlobField(frmMain.MDFolderFullList.FieldByName('ffile')).SaveToStream(v_Stream);
                    //  v_CnsDMTable_tmp.LoadFromStream(v_Stream);
                      if FileExists(frmMain.MDFolderFullList.FieldByName('FILENAME').AsString) then
                      begin
                        v_CnsDMTable_tmp.LoadFromFile(frmMain.MDFolderFullList.FieldByName('FILENAME').AsString);
                        v_DCMAttr:=v_CnsDMTable_tmp[0].Attributes;
                        FrmProgressBar.MyIncPos('Отправка снимка '+inttostr(j)+'/'+
                          inttostr(v_rec_amm));
                        If CnsDicomConnection1.C_STORAGE( v_DCMAttr ) then
                        begin  // 27.07.2012 FOMIN
                          v_SOPInstanceLst.Add(v_DCMAttr.GetString(dSOPInstanceUID));
                        end else
                        begin
                          v_res:=False;
                        end;
                      end else
                      begin
                        v_res:=False;
                      end;
                    finally
                    //  v_Stream.Free;
                      v_CnsDMTable_tmp.Clear;
                      v_CnsDMTable_tmp.Free;
                    end;
                  end;
                  frmMain.MDFolderFullList.Next;
                end;
              end;
            end;
          finally
            MyDisconnectAssociation(CnsDicomConnection1);
            CnsDicomConnection1.Free;
          end;
          // --> проверка если необходимо
          // процесс не был прерван пользователем
          if CmnUnit.v_exit_progressbar<>1 then begin
            // 27.07.2012 FOMIN  STORAGE COMMITMENT
            if v_res then begin
              if (v_SOPInstanceLst.Count>0)
              then begin
                v_TransactionUID:=GenTransactionUID(v_CallingTitle);
                SC_init(v_TransactionUID);
                if MyStrToBool( DBparams_get (
                                   'DICOM', // c_DICOM,   // SECTION
                                   'ST_COMM_CONF_AFT_ST' // KEY
                                //   frmMain.trRead, // FIBTransaction
                                //   frmMain.DB      // TpFIBDatabase
                                  )
                               )
                then
                begin
                  if f_Storage_Commitment_CMD (  v_SOPInstanceLst,
                       v_CalledAETitle, v_CallingTitle, v_Host, v_Port,
                       v_TransactionUID
                  )
                  then
                  begin
                    Screen.Cursor := crHourGlass;
                    Storage_commitment_res_Show(v_TransactionUID);
                  end else
                  begin
                    ShowMessage('Ошибка запроса STORAGE COMMITMENT ...');
                  end;
                end else begin
                  MessageDlg('Данные отправлены в локальную базу', mtInformation, [mbOK], 0);
                end;
              end;
            end else
            begin
              ShowMessage('Данные не отправлены ...');
            end;
          end;
        finally
          FreeAndNil(v_SOPInstanceLst);
          chk_close; // закроем ползунок
          Screen.Cursor := crDefault;
        end;
      end;
      Free;
    end;
  end;
end;

procedure TfrmMain.aUsersExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmUsers, frmUsers);
  try
    frmUsers.ShowModal;
  finally
    frmUsers.Free;
  end;
end;

procedure TfrmMain.aWebAExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVListA.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGrA, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGrA, TRUE, TRUE);
end;

procedure TfrmMain.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aWebLocExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVListA.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGrA, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGrA, TRUE, TRUE);
end;

procedure TfrmMain.aWebRemoteExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVRemote.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGrid3, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGrid3, TRUE, TRUE);
end;

procedure TfrmMain.aXMLAExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVListA.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGrA, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGrA, TRUE, TRUE);
end;

procedure TfrmMain.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXMLLocExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVListA.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGrA, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGrA, TRUE, TRUE);
end;

procedure TfrmMain.aXMLRemoteExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVRemote.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGrid3, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGrid3, TRUE, TRUE);
end;

procedure TfrmMain.bPeriodClick(Sender: TObject);
begin
  with TfrmParamDate.Create(Self) do
    begin
      if Execute then
        begin
      if ModalResult = MrOK then
        begin
          deBegin.Date := Period.First;
          deEnd.Date := Period.Last;
        end;
        end;
    Free;
  end;
  aRefreshExecute(nil);
end;

procedure TfrmMain.bTodayClick(Sender: TObject);
begin
  deBegin.Properties.OnEditValueChanged := nil;
  deEnd.Properties.OnEditValueChanged := nil;
  deBegin.Date := StartOfTheDay(Now);
  deEnd.Date := EndOfTheDay(Now);
  deBegin.Properties.OnEditValueChanged := deBeginPropertiesEditValueChanged;
  deEnd.Properties.OnEditValueChanged := deEndPropertiesEditValueChanged;
  aRefreshExecute(nil);
end;

procedure TfrmMain.CheckEnabledButtons;
var v_amm : Boolean;
begin
  N1.Visible := (vUserRole=1); // sUser = 'SYSDBA';
  aUsers.Visible := (vUserRole=1); // sUser = 'SYSDBA';
  N6.Visible := (vUserRole=1); // sUser = 'SYSDBA'; // опции показываем только для администратора
  aEditSysdba.Visible := ((vUserRole=1) and (not v_isOracle) and (not v_isPostgres)); // sUser = 'SYSDBA';
  //
  bbAdd.Visible:=ivNever;
  case pcMain.ActivePageIndex of
  0: begin  // архив
       v_amm:=(sList.DataSet.RecordCount>0);

       aSetUnsetListImages.Visible := v_amm;

       bbImportPDF.Visible  := ivAlways;
       bbImportPDF.Enabled := True ;
       if v_amm then
       begin
         bbInformation.Visible  := ivAlways;
       end else
       begin
         bbInformation.Visible  := ivNever;
       end;
       bbInformation.Enabled := v_amm ;

       if (vUserRole=1) then
       begin
         aDelSnimok.Visible  := v_amm;
       //  bbDelSnimok.Visible := ivAlways ;
         bbDelSnimok.Enabled := v_amm ;
       end else begin
         aDelSnimok.Visible  := False;
         bbDelSnimok.Enabled := False ;
       //  bbDelSnimok.Visible := ivNever ;
       end;
       //
       bbSaveToLocDB.Enabled := v_amm;
       bbSaveToLocDB.Visible := ivAlways;
       aCD.Enabled := v_amm;
       aPrepare.Enabled := v_amm;
       //
       bbSnimok.OnClick:=nil;
       bbSnimok.ButtonStyle:=bsDropDown;
       bbSnimok.Action:=nil;
       dxBarButton8.ShortCut:=VK_F7;
       bbSnimok.Enabled := v_amm;
       //
       actListShow.Enabled := v_amm;
       actListShow.Visible:=True;
       //
       actKeyListShow.Enabled := v_amm;
       actKeyListShow.Visible:=True;
       aPrint.Enabled := v_amm;
       bbSave.Enabled := v_amm;
       bbSave.Visible := ivAlways;
       aPrepare.Enabled := v_amm;
       aPrepare.Visible:=True;
       aCD.Visible := True;
       aRefresh.Visible:=True;
       bbSend.Visible:=ivNever;
       BtnLdList.Visible:=ivNever;
       TV_menu_prn.Enabled:=v_amm;
       TV_menu_exp.Enabled:=v_amm;
     end;
  1: begin  // локальная база
       v_amm:= (locList.DataSet.RecordCount>0);
       //
       aSetUnsetListImages.Visible := False;

       bbInformation.Visible  := ivNever;
       bbInformation.Enabled := False ;
       bbImportPDF.Visible  := ivNever;
       bbImportPDF.Enabled := False ;
       //
       aDelSnimok.Visible  := True;
       bbDelSnimok.Enabled := v_amm ;
     //  bbDelSnimok.Visible := ivAlways ;
       bbSaveToLocDB.Enabled := False;
       bbSaveToLocDB.Visible := ivNever;
       aCD.Enabled := v_amm;
       aPrepare.Enabled := v_amm;
       //
       bbSnimok.OnClick:=nil;
       bbSnimok.ButtonStyle:=bsDropDown;
       bbSnimok.Action:=nil;
       dxBarButton8.ShortCut:=VK_F7;
       bbSnimok.Enabled := v_amm;
       //
       actListShow.Enabled := v_amm;
       actListShow.Visible:=True;
       //
       actKeyListShow.Enabled := v_amm;
       actKeyListShow.Visible:=True;
       aPrint.Enabled := v_amm;
       bbSave.Enabled := v_amm;
       bbSave.Visible := ivAlways;
       aPrepare.Enabled := v_amm;
       aPrepare.Visible:=True;
       aCD.Visible := True;
       aRefresh.Visible:=True;
       bbSend.Visible:=ivNever;
       BtnLdList.Visible:=ivNever;
       TV_menu_prn.Enabled:=v_amm;
       TV_menu_exp.Enabled:=v_amm;
     end;
  2: begin  // удаленная база
       v_amm:= (DSRemote.DataSet.RecordCount>0);
       //
       aSetUnsetListImages.Visible := False;

       bbInformation.Visible  := ivNever;
       bbInformation.Enabled := False ;
       bbImportPDF.Visible  := ivNever;
       bbImportPDF.Enabled := False ;
       //
       aDelSnimok.Visible  := False;
       bbDelSnimok.Enabled := False ;
     //  bbDelSnimok.Visible := ivNever ;
       //
       bbSaveToLocDB.Enabled := v_amm;
       bbSaveToLocDB.Visible := ivAlways;
       aCD.Enabled := v_amm;
       aPrepare.Enabled := v_amm;
       //
       bbSnimok.OnClick:=nil;
       bbSnimok.ButtonStyle:=bsDropDown;
       bbSnimok.Action:=nil;
       dxBarButton8.ShortCut:=VK_F7;
       bbSnimok.Enabled := v_amm;
       //
       actListShow.Enabled := v_amm; // снимки
       actListShow.Visible:=True; // снимки
       //
       actKeyListShow.Enabled := v_amm;  // снимки
       actKeyListShow.Visible:=True;
       aRefresh.Visible:=True;
       bbSave.Visible := ivNever;
       aPrepare.Visible:=False;
       aCD.Visible := False;
       bbSend.Visible:=ivNever;
       BtnLdList.Visible:=ivNever;
       TV_menu_prn1.Enabled:=v_amm;
       TV_menu_exp1.Enabled:=v_amm;  // ( tvRemote.DataController.RecordCount <> 0 )
     end;
  3: begin  // из папки
       v_amm:= not dsFolderList.DataSet.Eof ;
       //
       aSetUnsetListImages.Visible := False;
       bbInformation.Visible  := ivAlways;
       if v_amm then
         bbInformation.Enabled  := True
       else
         bbInformation.Enabled  := False;
       bbImportPDF.Visible  := ivNever;
       bbImportPDF.Enabled := False ;
       //
       aDelSnimok.Visible  := False;
       bbDelSnimok.Enabled := False ;
     //  bbDelSnimok.Visible := ivNever ;
       //
       bbSaveToLocDB.Enabled := v_amm;
       bbSaveToLocDB.Visible := ivAlways;
       aCD.Enabled := v_amm;
       aPrepare.Enabled := v_amm;
       aRefresh.Visible:=False;
       //
       actListShow.Enabled := False;
       bbSnimok.Enabled := False;
       actListShow.Enabled := False;
       bbSnimok.ButtonStyle:=bsDefault;
       bbSnimok.Action:=actListShow;
       dxBarButton8.ShortCut:=0;
       bbSnimok.Enabled := v_amm;
       //
       actListShow.Enabled := v_amm;
       actListShow.Visible:=True;
       //
       actKeyListShow.Enabled := False;
       actKeyListShow.Visible:=False;
       APrintFolder.Enabled := v_amm;
       bbSend.Visible:=ivAlways;
       bbSend.Enabled := v_amm;
       BtnLdList.Visible:=ivAlways;
       bbSave.Visible := ivNever;
       aPrepare.Visible:=False;
       aCD.Visible := False;
       TV_menu_prn3.Enabled:=v_amm; // ( TVFolderList.DataController.RecordCount <> 0 )
       TV_menu_exp3.Enabled:=v_amm;
     end;
  end;
  Application.ProcessMessages;
end;

procedure TfrmMain.ClrDopDiagBtnClick(Sender: TObject);
begin //
  dxTreeViewEdit2.Text:='';
end;

procedure TfrmMain.ClrOsnDiagBtnClick(Sender: TObject);
begin //
  dxTreeViewEdit1.Text:='';
end;

procedure TfrmMain.bYesterdayClick(Sender: TObject);
begin
  deBegin.Properties.OnEditValueChanged := nil;
  deEnd.Properties.OnEditValueChanged := nil;
  deBegin.Date := StartOfTheDay(Yesterday);
  deEnd.Date := EndOfTheDay(Yesterday);
  deBegin.Properties.OnEditValueChanged := deBeginPropertiesEditValueChanged;
  deEnd.Properties.OnEditValueChanged := deEndPropertiesEditValueChanged;
  aRefreshExecute(nil);
end;

procedure TfrmMain.cbDatesPropertiesChange(Sender: TObject);
begin
  case cbDates.ItemIndex of
  0: // пусто (тоже самое что и 1 день = выставляется текущая дата)
    begin
      deBegin.Properties.OnEditValueChanged := nil;
      deEnd.Properties.OnEditValueChanged := nil;
      deBegin.Date := StartOfTheDay(Now);
      deEnd.Date := EndOfTheDay(Now);
      deBegin.Properties.OnEditValueChanged := deBeginPropertiesEditValueChanged;
      deEnd.Properties.OnEditValueChanged := deEndPropertiesEditValueChanged;
    end;
  1: // 1 день
    begin
      deBegin.Properties.OnEditValueChanged := nil;
      deEnd.Properties.OnEditValueChanged := nil;
      deBegin.Date := StartOfTheDay(Now);
      deEnd.Date := EndOfTheDay(Now);
      deBegin.Properties.OnEditValueChanged := deBeginPropertiesEditValueChanged;
      deEnd.Properties.OnEditValueChanged := deEndPropertiesEditValueChanged;
    end;
  2: // 3 дня
    begin
      deBegin.Properties.OnEditValueChanged := nil;
      deEnd.Properties.OnEditValueChanged := nil;
      deBegin.Date := StartOfTheDay(Yesterday);
      deEnd.Date := EndOfTheDay(Tomorrow);
      deBegin.Properties.OnEditValueChanged := deBeginPropertiesEditValueChanged;
      deEnd.Properties.OnEditValueChanged := deEndPropertiesEditValueChanged;
    end;
  3: // неделя
    begin
      deBegin.Properties.OnEditValueChanged := nil;
      deEnd.Properties.OnEditValueChanged := nil;
      deBegin.Date := StartOfTheWeek(Now);
      deEnd.Date := EndOfTheWeek(Now);
      deBegin.Properties.OnEditValueChanged := deBeginPropertiesEditValueChanged;
      deEnd.Properties.OnEditValueChanged := deEndPropertiesEditValueChanged;
    end;
  4: // месяц
    begin
      deBegin.Properties.OnEditValueChanged := nil;
      deEnd.Properties.OnEditValueChanged := nil;
      deBegin.Date := StartOfTheMonth(Now);
      deEnd.Date := EndOfTheMonth(Now);
      deBegin.Properties.OnEditValueChanged := deBeginPropertiesEditValueChanged;
      deEnd.Properties.OnEditValueChanged := deEndPropertiesEditValueChanged;
    end;
  5: // год
    begin
      deBegin.Properties.OnEditValueChanged := nil;
      deEnd.Properties.OnEditValueChanged := nil;
      deBegin.Date := StartOfTheYear(Now);
      deEnd.Date := EndOfTheYear(Now);
      deBegin.Properties.OnEditValueChanged := deBeginPropertiesEditValueChanged;
      deEnd.Properties.OnEditValueChanged := deEndPropertiesEditValueChanged;
    end;
  end;
  aRefreshExecute(nil);
end;

procedure TfrmMain.cbTypeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    begin
      aRefreshExecute(nil);
    end;
end;

procedure TfrmMain.bbInformationClick(Sender: TObject);
var vRecordIndex : integer;  vSTUDYUID : string;
begin
  if ((pcMain.ActivePage=cxTabSheet1) or (pcMain.ActivePage=cxTabSheet4)) then
  begin  // архив
    if ((frmMain.cxGridDBTableView1.Controller.SelectedRecordCount>0) or
         (not MDFolderList.Eof))
    then
    begin
        Application.CreateForm(TfrmComment, frmComment);
        if pcMain.ActivePage=cxTabSheet1 then
        begin
          vRecordIndex := frmMain.cxGridDBTableView1.Controller.SelectedRecords[0].RecordIndex ;
          vSTUDYUID := VarToStr( frmMain.cxGridDBTableView1.DataController.Values[vRecordIndex, frmMain.cxGridDBTableView1.DataController.GetItemByFieldName('STUDYUID').Index]);
          if vSTUDYUID='' then Exit;
          if (frmMain.cxGridDBTableView1.Controller.SelectedRecordCount<=0) then
          begin
            MessageDlg('Не выбрано исследование ...', mtWarning, [mbOK], 0);
            Exit;
          end;
          frmComment.v_STUDYUID := vSTUDYUID;
          frmComment.vPage := 0;
        end else if pcMain.ActivePage=cxTabSheet4 then
        begin
          if frmMain.MDFolderFullList.Eof then Exit;
          frmComment.vPage := 1;
          frmComment.vFilenameTmp := frmMain.MDFolderFullList.FieldByName('FILENAME').AsString;
        end;
        try
          frmComment.ShowForm(vSTUDYUID);
          if ((pcMain.ActivePage=cxTabSheet4) and (frmComment.ModalResult=mrOk)) then
          begin
            with frmMain.MDFolderFullList do
            begin
              First;
              while not Eof do
              begin
                if ( ( FieldByName('STUDYID').AsString=frmMain.MDFolderList.FieldByName('STUDYID').AsString ) and
                     ( FieldByName('ACCESSIONNUMBER').AsString=frmMain.MDFolderList.FieldByName('ACCESSIONNUMBER').AsString ) and
                     ( FieldByName('P_PID').AsString=frmMain.MDFolderList.FieldByName('P_PID').AsString ) and
                     ( FieldByName('STUDYUID').AsString=frmMain.MDFolderList.FieldByName('STUDYUID').AsString ) )
                then
                  Break;
                Next;
              end;
            end;
            if not frmMain.MDFolderList.Eof then
              with frmMain.MDFolderList, frmComment do
              begin
                Edit;
                FieldByName('P_ENAME_RUS').AsString := cxFIOPac.Text;
                FieldByName('P_ENAME').AsString     := cxFIOPac.Text;
                FieldByName('P_DATEBORN').AsDateTime := cxDateBrn1.Date;
                if frmComment.cxPolMan1.Checked then
                  FieldByName('P_SEX').AsString := 'M'
                else
                  FieldByName('P_SEX').AsString := 'F';
                FieldByName('LDATE').AsDateTime := cxStudyDate1.Date;
                FieldByName('P_PID').AsString := cxPatientID.Text ;
                FieldByName('STUDYUID').AsString := cxStudyUID1.Text;
                FieldByName('STUDIES_IMAGE_TYPE').AsString := cxMod1.Text;
                FieldByName('ACCESSIONNUMBER').AsString := cxAccessionNumber1.Text;
                Post;
              end;
            if not frmMain.MDFolderFullList.Eof then
              with frmMain.MDFolderFullList, frmComment do
              begin
                Edit;
                FieldByName('P_ENAME_RUS').AsString := cxFIOPac.Text;
                FieldByName('P_ENAME').AsString     := cxFIOPac.Text;
                FieldByName('P_DATEBORN').AsDateTime := cxDateBrn1.Date;
                if frmComment.cxPolMan1.Checked then
                  FieldByName('P_SEX').AsString := 'M'
                else
                  FieldByName('P_SEX').AsString := 'F';
                FieldByName('LDATE').AsDateTime := cxStudyDate1.Date;
                FieldByName('P_PID').AsString := cxPatientID.Text ;
                FieldByName('STUDYUID').AsString := cxStudyUID1.Text;
                FieldByName('STUDIES_IMAGE_TYPE').AsString := cxMod1.Text;
                FieldByName('ACCESSIONNUMBER').AsString := cxAccessionNumber1.Text;
                Post;
              end;
          end;
        finally
          frmComment.Free;
          Archive_Refr;
        end;
    end
  end else
    MessageDlg('Режим недоступен ...', mtWarning, [mbOK], 0);
end;

procedure TfrmMain.bClearFilterClick(Sender: TObject);
begin
  if (teFIO.Text <> '') or (teNum.Text <> '') or (cbType.Text <> '') then
    sList.DataSet.Close;
  teFIO.Clear;
  teNum.Clear;
end;

procedure TfrmMain.cxButton1Click(Sender: TObject);
var vImgUIDs : AnsiString;
    ColIdx, RecIdx, i, v_sel_amm :integer;
    v_INSTANCEUID:string;
    v_sel_rec : array of t_p_pid_list_rec;
    v_cxGridDBTableView : TcxGridDBTableView;
    v_pid_lst : TStringList;
    vvP_PID,vvP_ENAME,vvACCESSIONNUMBER,vvSTUDYUID,vvMODALITY : string;
  procedure archiv_frm ( p_RecordIndex:integer; pINSTANCEUID:string );
  begin
    SetLength(v_sel_rec,Length(v_sel_rec)+1);
    v_sel_rec[Length(v_sel_rec)-1].P_PID           := vvP_PID;
    v_sel_rec[Length(v_sel_rec)-1].P_ENAME         := vvP_ENAME;
    v_sel_rec[Length(v_sel_rec)-1].ACCESSIONNUMBER := vvACCESSIONNUMBER;
    v_sel_rec[Length(v_sel_rec)-1].STUDYUID        := vvSTUDYUID;
    v_sel_rec[Length(v_sel_rec)-1].MODALITY        := vvMODALITY;
    v_sel_rec[Length(v_sel_rec)-1].INSTANCEUID     := pINSTANCEUID;
    // добавим patientID

    //if v_cxGridDBTableView.Controller.SelectedRecordCount>0 then
    //v_pid_lst.Add(VarToStr( v_cxGridDBTableView.DataController.Values[ v_cxGridDBTableView.Controller.SelectedRecords[i].RecordIndex,
    //
//    v_pid_lst.Add( dsListPeriod.FieldByName('P_PID').AsString );
    v_pid_lst.Add( vvP_PID );
  end;
begin  // Снимки
  v_sel_amm:=TVList.Controller.SelectedRecordCount;
  // if (TVList.DataController.RecordCount>0) then
  if v_sel_amm>0 then
  begin
    v_pid_lst := TStringList.Create;
    try
      Screen.Cursor := crHourGlass;
      SetLength(v_sel_rec,0);
      vImgUIDs:='';
      v_cxGridDBTableView := frmMain.cxGridDBTableView1;
      ColIdx := TVList.DataController.GetItemByFieldName('INSTANCEUID').Index;
      vvP_PID           := VarToStr( v_cxGridDBTableView.DataController.Values[0, v_cxGridDBTableView.DataController.GetItemByFieldName('P_PID').Index] );
      vvP_ENAME         := VarToStr( v_cxGridDBTableView.DataController.Values[0, v_cxGridDBTableView.DataController.GetItemByFieldName('P_ENAME').Index] );
      vvACCESSIONNUMBER := VarToStr( v_cxGridDBTableView.DataController.Values[0, v_cxGridDBTableView.DataController.GetItemByFieldName('ACCESSIONNUMBER').Index] );
      vvSTUDYUID        := VarToStr( v_cxGridDBTableView.DataController.Values[0, v_cxGridDBTableView.DataController.GetItemByFieldName('STUDYUID').Index]);
      vvMODALITY        := VarToStr( v_cxGridDBTableView.DataController.Values[0, v_cxGridDBTableView.DataController.GetItemByFieldName('STUDIES_IMAGE_TYPE').Index]);
      for I := 0 to v_sel_amm - 1 do
      begin
        if TVList.DataController.Controller.SelectedRecords[I].Selected
        then
        begin
          RecIdx := TVList.Controller.SelectedRecords[i].RecordIndex;
          v_INSTANCEUID := VarToStr(TVList.DataController.Values[RecIdx, ColIdx]);
          if Trim(v_INSTANCEUID)<>'' then
            archiv_frm ( TVList.Controller.SelectedRecords[i].RecordIndex, v_INSTANCEUID );
        end;
      end;
      // -- снимки
      // True - не отображать 3D меню и не загружать dll 3D обработки
      frmMain.v_isnot_show_3d_loc := not MyStrToBool(
                         DBparams_get ('STATION',        // SECTION
                                       'USE_3D_LIBRARY' // KEY
                                     //  frmMain.trRead,   // FIBTransaction
                                     //  frmMain.DB        // TpFIBDatabase
                                      )
                                   );
      Application.CreateForm(TfrmSnimki, frmSnimki);
      with TIniFile.Create(v_exe_path+c_ini_file) do
        try
          frmSnimki.v_is_log  := (ReadString('LOG', 'is_log', '0')='1');
          frmSnimki.v_logfile :=  ReadString('LOG', 'logfile', '');
          if pos('\',frmSnimki.v_logfile)<=0 then
            frmSnimki.v_logfile:=ExtractFilePath(Application.ExeName)+frmSnimki.v_logfile;
          if frmSnimki.v_is_log then
            WriteString('LOG', 'is_log','1')
          else
            WriteString('LOG', 'is_log','0');
          WriteString('LOG', 'logfile', frmSnimki.v_logfile);
        finally
          Free;
        end;
      v_is_moveDCM:=False;
      frmSnimki.v_pr_data_fr := 0;   // архив
      if v_pid_lst.Count > 0 then
        frmSnimki.DoShowForm_P_PID( v_pid_lst,
                                   v_sel_rec,
                                   v_sel_amm,
                                   frmMain.MDFolderFullList,
                                   DB_CMN.trRead,
                                   DB_CMN.DB,
                                   frmMain.sIP,
                                   frmMain.sPort,
                                   frmMain.sCalledAETitle,
                                   frmMain.sCallingAETitle,
                                   frmMain.sUser,
                                   False,
                                   frmMain.v_isnot_show_3d_loc, // True - не отображать 3D меню и не загружать dll 3D обработки
                                   v_isPostgres,
                                   PGconn,
                                   MnUniTransaction
                                 );
      if v_pid_lst.Count > 0 then
        begin
          frmSnimki.Visible:=False;
          if v_exit_progressbar<>1 then // не было отмены пользователем
            frmSnimki.ShowModal;
        end;
    finally
      Screen.Cursor := crDefault;
      FreeAndNil(frmSnimki);
      Application.ProcessMessages;
      FreeAndNil(v_pid_lst);
      SetLength(v_sel_rec, 0);
    end;
  end;
end;

procedure TfrmMain.cxSplitter2BeforeClose(Sender: TObject; var AllowClose: Boolean);
begin
  paLeft.Visible := False;
end;

procedure TfrmMain.cxSplitter2BeforeOpen(Sender: TObject; var NewSize: Integer; var AllowOpen: Boolean);
begin
  paLeft.Visible := True;
end;

procedure TfrmMain.pListImages;
begin
  if vLstImages then
  begin    // показать список исследований
    sListImages.minSize := Trunc(cxTabSheet1.Height/2);
    gbListImages.Visible:=True;
    sListImages.Visible:=True;
    aSetUnsetListImages.Caption := 'Скрыть список кадров';
    gbMainList.Align := alTop ;
    gbMainList.Height := Trunc(cxTabSheet1.Height/2);
    sListImages.AlignSplitter := salBottom ;
    gbListImages.Align := alBottom;
    sListImages.AlignSplitter := salTop ;
    gbListImages.Align := alClient;
    RefrImages;
  end else
  begin    // скрыть список исследований
    gbListImages.Visible:=False;
    sListImages.Visible:=False;
    aSetUnsetListImages.Caption := 'Показать список кадров';
    gbMainList.Align := alClient ;
  end;
  Application.ProcessMessages;
end;

procedure TfrmMain.cxTabSheet3Show(Sender: TObject);
begin
  if v_isOracle then
  begin
    sServ.DataSet:=OraServ;
    if not OraServ.Active then
      PrmSetOraServ;
  end else if v_isPostgres then
  begin
    sServ.DataSet:=UniServ;
    if not UniServ.Active then
      PrmSetUniServ;
  end else
  begin
    sServ.DataSet:=dsServ;
    if not dsServ.Active then
    begin
      dsServ.Database := DB_CMN.DB;
      dsServ.Transaction := DB_CMN.trRead;
      dsServ.Open;
    end;
  end;
end;

procedure TfrmMain.deBeginPropertiesEditValueChanged(Sender: TObject);
begin
  cbDates.Properties.OnEditValueChanged := nil;
  cbDates.Text := '';
//  cbDates.Properties.OnEditValueChanged := cbDatesPropertiesEditValueChanged;
  if deBegin.Date > deEnd.Date then
    begin
      Application.MessageBox('Внимание!'+#13+
                             'Дата начала периода не может быть больше даты окончания периода!',
                             'Предупреждение', MB_ICONWARNING + MB_OK);
      deBegin.Date := deEnd.Date;
      deBegin.SetFocus;
    end;
  aRefreshExecute(nil);
end;

procedure TfrmMain.deEndPropertiesEditValueChanged(Sender: TObject);
begin
  cbDates.Properties.OnEditValueChanged := nil;
  cbDates.Text := '';
//  cbDates.Properties.OnEditValueChanged := cbDatesPropertiesEditValueChanged;
  if deEnd.Date < deBegin.Date then
    begin
      Application.MessageBox('Внимание!'+#13+
                             'Дата окончания периода не может быть меньше даты начала периода!',
                             'Предупреждение', MB_ICONWARNING + MB_OK);
      deEnd.Date := deBegin.Date;
      deEnd.SetFocus;
      Exit;
    end;
  aRefreshExecute(nil);
end;

procedure TfrmMain.MyOnTerminate(Sender: TObject);
var i, k, {v_amm_received,} v_SessionID, v_high : integer;
    v_CallingTitle, v_TransactionUID, v_StudyUID : string;
    v_text : ansistring;
begin
  v_high:=Length(v_studyUID_img_sav_lst);
  if v_high>0 then
  begin
    v_SessionID:=(Sender as TDicomClientThread).SessionID;
  //  v_amm_received   := 0 ;
    v_text           := '' ;
    v_CallingTitle   := '' ;
    v_TransactionUID := '' ;
    v_StudyUID       := '' ;
    for i := 0 to v_high - 1 do
    begin
      if (v_studyUID_img_sav_lst[i].f_SessionID=v_SessionID)
      then
      begin
        // нарастим количество принятых снимков
      //  v_amm_received   := v_studyUID_img_sav_lst[i].f_amm_received ;
        v_text           := v_studyUID_img_sav_lst[i].f_text ;
        v_CallingTitle   := v_studyUID_img_sav_lst[i].f_CallingTitle ;
        v_TransactionUID := v_studyUID_img_sav_lst[i].f_TransactionUID ;
        v_StudyUID       := v_studyUID_img_sav_lst[i].f_StudyUID ;
      end;
    end;
    for i := 0 to v_high - 1 do
    begin
      if (v_studyUID_img_sav_lst[i].f_SessionID=v_SessionID)
      then
      begin
        v_high:=Length(v_studyUID_img_sav_lst);
        for k:= i to v_high - 2 do
        begin
          v_studyUID_img_sav_lst[k].f_SessionID      := v_studyUID_img_sav_lst[k+1].f_SessionID ;
          v_studyUID_img_sav_lst[k].f_CallingTitle   := v_studyUID_img_sav_lst[k+1].f_CallingTitle ;
          v_studyUID_img_sav_lst[k].f_TransactionUID := v_studyUID_img_sav_lst[k+1].f_TransactionUID ;
          v_studyUID_img_sav_lst[k].f_StudyUID       := v_studyUID_img_sav_lst[k+1].f_StudyUID ;
          v_studyUID_img_sav_lst[k].f_amm_received   := v_studyUID_img_sav_lst[k+1].f_amm_received ;
          v_studyUID_img_sav_lst[k].f_text           := v_studyUID_img_sav_lst[k+1].f_text ;
          v_studyUID_img_sav_lst[k].f_SessionID      := v_studyUID_img_sav_lst[k+1].f_SessionID ;
        end;
        SetLength(v_studyUID_img_sav_lst,v_high-1);
      end;
    end;
  end;
  //
  Logout((Sender as TDicomClientThread).v_ClThr_DB as TpFIBDatabase);
  try
    ((Sender as TDicomClientThread).v_ClThr_DB as TpFIBDatabase).Free;
    ((Sender as TDicomClientThread).v_ClThr_trRead as TpFIBTransaction).Free;
    ((Sender as TDicomClientThread).v_ClThr_trWrite as TpFIBTransaction).Free;
  except
//    Lg_ev('ERROR - Ошибка освобождения соединения с Firebird');
  end;
  //
end;



function MyprepareResponse( const request: TRequest;
                            const s: string;
                            const astr: TStrings;
                            const flag: Boolean;
                            const AAddress: string;
                            AClientThread: TDicomClientThread ): TDicomResponse;
var l, k, j1, i1: Integer;
    acknowledge: TAcknowledge;
    uidentry, uidentry1: TUIDEntry;
    flag2: Boolean;
    str1: string;
begin
  if (not frmMain.f_chk_serv_parms) then
  begin
    result := TDicomReject.Create(REJECTED_PERMANENT, DICOM_UL_SERVICE_USER_reject, USER_APPLICATIONCONTEXTNAME_NOT_SUPPORTED);
    exit;
  end;
  if request.isPrivateApplicationContext then
  begin
    result := TDicomReject.Create(REJECTED_PERMANENT, DICOM_UL_SERVICE_USER_reject, USER_APPLICATIONCONTEXTNAME_NOT_SUPPORTED);
    exit;
  end;
  acknowledge := TAcknowledge.Create;
  acknowledge.MaxPduSize := request.MaxPduSize;
  acknowledge.CalledTitle := trim(request.CalledTitle);
  acknowledge.CallingTitle := trim(request.CallingTitle);
  acknowledge.ApplicationContextUid := request.ApplicationContextUid;
  // 24_08_2012 FOMIN
  // взято из исходников компонентов
  if acknowledge.MaxPduSize<1048576 then
  begin
    acknowledge.MaxPduSize:=1048576; // 1048576;    16384
  end;
  for k := 0 to request.getPresentationContexts - 1 do
    begin
      uidentry := request.getAbstractSyntax(k);
      if (uidentry.UIDType = 1) or (uidentry.UIDType = 4) then
        begin
          l := 0;
          for j1 := 0 to request.getTransferSyntaxes(k) - 1 do
            begin
              uidentry1 := request.getTransferSyntax(k, j1);
              str1 := Uppercase(request.CalledTitle);
                  acknowledge.addPresentationContext(request.getPresentationContextID(k), 0, uidentry1.Constant);
                  inc(l);
            end;
          if l <= 0 then
          begin
            try
              acknowledge.addPresentationContext(request.getPresentationContextID(k), 4, ExplicitVRLittleEndian);
            except
            end;
          end;
        end;
    end;
    // 20.08.2012 FOMIN
    if flag then
    begin
      flag2 := TRUE;
      for i1 := 0 to acknowledge.getPresentationContexts - 1 do
        begin
          if acknowledge.getResult(i1) = 0 then
            flag2 := FALSE;
        end;
      if flag2 then
        begin
          result := TDicomReject.Create(REJECTED_PERMANENT, DICOM_UL_SERVICE_USER_reject, USER_NO_REASON_GIVEN);
          exit;
        end;
    end;
  result := acknowledge;
end;

procedure TfrmMain.DicomServerCore1DicomAssociation(
  AClientThread: TDicomClientThread; AAddress: string; AReg: TRequest;
  var AHandleType: Integer);
var r: TDicomResponse;
  v_trRead: TpFIBTransaction;
  v_trWrite: TpFIBTransaction;
  v_DB: TpFIBDatabase;
 // v_now:TDateTime;
begin
  if (not v_is_moveDCM) then
  begin
    if frmMain.f_chk_serv_parms then
    begin
      v_DB:= TpFIBDatabase.Create(nil);
      v_DB.DBName := lDB.DBName;
      v_DB.ConnectParams.UserName := lDB.ConnectParams.UserName ;
      v_DB.ConnectParams.Password := lDB.ConnectParams.Password ;
      try
        if not v_DB.Connected then
          v_DB.Connected := True;
      except
      end;
      v_trRead:= TpFIBTransaction.Create(nil);
      v_trRead.DefaultDatabase := v_DB;
      v_trRead.TimeoutAction := TARollback ;
      v_trRead.TPBMode := tpbDefault ;
      v_trRead.TRParams.Clear;
      v_trRead.TRParams.Add('isc_tpb_read');
      v_trRead.TRParams.Add('isc_tpb_nowait');
      v_trRead.TRParams.Add('isc_tpb_read_committed');
      v_trRead.TRParams.Add('isc_tpb_rec_version');
      v_trRead.StartTransaction;
      //
      v_trWrite:= TpFIBTransaction.Create(nil);
      v_trWrite.DefaultDatabase := v_DB;
      v_trWrite.TimeoutAction := TARollback ;
      v_trWrite.TPBMode := tpbReadCommitted ;  //  tpbDefault
      v_trWrite.StartTransaction;
      //
      AClientThread.v_ClThr_trRead  := v_trRead ;
      AClientThread.v_ClThr_trWrite := v_trWrite ;
      AClientThread.v_ClThr_DB      := v_DB ;
      //
      if not assigned(AClientThread.OnTerminate) then
        AClientThread.OnTerminate := MyOnTerminate; // определяем разрыв соединения
      AHandleType := 1; // Access
      AHandleType := -1; //Custom
    end;
    r := MyPrepareResponse(AReg, '', nil, true, AAddress, AClientThread);
    TDicomClientThread(AClientThread).Association.sendAssociateResponse(r);
  end;
end;

// для махаона заменить в запросе символ * на %
function SpSymbRepl (const p_str : AnsiString ):AnsiString;
begin
  SpSymbRepl:=StringReplace(p_str,'*','%',[rfReplaceAll, rfIgnoreCase]);
end;

procedure TfrmMain.SumitSQL(AClientThread: TDicomClientThread; ADBStr,
  ASQL: string; AFetchCount: Integer; UseMultiDatabase: Boolean;
  Params: TDicomAttribute; var AResult: TDataSet);
var dsSel: TpFIBDataSet;
begin
  dsSel := TpFIBDataSet.Create(nil);
  if AClientThread<>nil then
  begin
    dsSel.Database := (AClientThread.v_ClThr_DB as TpFIBDatabase);
    dsSel.Transaction := (AClientThread.v_ClThr_trRead as TpFIBTransaction);
  end else
  begin
    dsSel.Database := DB_CMN.DB;
    dsSel.Transaction := DB_CMN.trRead;
  end;
  try
    dsSel.SQLs.SelectSQL.Clear;
    dsSel.SQLs.SelectSQL.Add(ASQL);
    dsSel.Open;
  except
    on e: Exception do
      begin
        dsSel.Close;
        FreeAndNil(dsSel);
      raise;
    end;
  end;
  AResult := dsSel;
end;

procedure TfrmMain.ExecSQL(asql: string);
var
  d1: TQuery;
begin
  d1 := TQuery.Create(nil);
  try
    d1.DatabaseName := 'CNSPACS';
    d1.SQL.Text := asql;
    try
      d1.ExecSQL;
    except
      on E : Exception do
//        Lg_ev('error TDicomServer.ExecSQL : '+E.ClassName+
//            ' with message : '+E.Message+' SQL:'+d1.SQL.Text);
    end;
  finally
    d1.Free;
//    d1 := nil; // Prihodko N.
  end;
end;

procedure TfrmMain.DicomServerCore1DicomFind(AClientThread: TDicomClientThread;
  AAddress: string; ACommand: TDicomAttributes; ARequestDatasets,
  AResponseDatasets: TList);
var
  z1, d1, da1, rq, seq: TDicomAttributes;
  x1, x2, at, at1: TDicomAttribute;
  kk, Root: Integer;
  strSQL, Level, sql1, modility: string;
  Query1: TDataset;
  APPLY_NO, PatientID, Pname, psex: string;
  i: Integer;
  date1: TDatetime;
  procedure SetParamAsDatetime(AName: string; AValue: TDatetime);
  var
    i: integer;
    str1: string;
    dasx1, dasx2: TDicomAttributes;
  begin
    dasx1 := nil;
    for i := 0 to at1.GetCount - 1 do
    begin
      dasx2 := at1.Attributes[i];
      str1 := dasx2.GetString($2809, $28);
      if str1 = AName then
      begin
        dasx2.Item[$2809, $25].AsDatetime[0] := AValue;
        //        dasx1 := dasx2;
        exit;
      end;
    end;
    if not assigned(dasx1) then
    begin
      dasx1 := TDicomAttributes.Create;
      dasx1.Add($2809, $28).asString[0] := AName;
      dasx1.Add($2809, $29).asInteger[0] := 3;
      dasx1.Add($2809, $25).asDatetime[0] := AValue;
      at1.AddData(dasx1);
    end;
  end;
  procedure DicomApplyTable;
  begin
    modility := '';
    at := rq.Item[$40, $100];
    if assigned(at) and (at.GetCount > 0) then // i.e. a sequence
    begin
      seq := at.Attributes[0];
      modility := seq.GetString($8, $60);
    end;
    if modility = '' then
      strSQL := ''
    else
      strSQL := 'MODALITY=''' + modility + '''';
    if (rq.GetString(dPatientID) <> '') then
    begin
      if strSQL <> '' then
        strSQL := strSQL + ' AND ';
      strSQL := strSQL + '( IDField = ''' + rq.GetString(dPatientID) + ''')';
    end;
    if (rq.GetString(dPatientName) <> '') and (rq.GetString(dPatientName) <> '*') then
    begin
      if strSQL <> '' then
        strSQL := strSQL + ' AND ';
        strSQL := strSQL + ' NameField like ''%' + SpSymbRepl(rq.GetString(dPatientName)) + '%''';
    end;
    x1 := rq.Item[$40, $100];
    if assigned(x1) and (x1.GetCount > 0) then
    begin
      z1 := x1.Attributes[0];
      x1 := z1.Item[$40, $2];
      if assigned(x1) and (x1.GetCount > 0) then
      begin
        if strSQL <> '' then
          strSQL := strSQL + ' and ';
        date1 := x1.AsDatetime[0];
        strSQL := strSQL + ' APPLY_TIME >= :CK_DATE1';
        SetParamAsDatetime('CK_DATE1', date1);
        if (x1.GetCount > 1) then
        begin
          date1 := x1.AsDatetime[1];
          strSQL := strSQL + ' AND APPLY_TIME <= :CK_DATE2';
          SetParamAsDatetime('CK_DATE2', date1);
        end;
      end;
    end;
    sql1 := 'SELECT * FROM  APPLYTABLE ';
    if strSQL <> '' then
      sql1 := sql1 + ' WHERE ' + strSQL;
    //        sql1 := sql1 + ' ORDER BY APPLY_TIME DESC';
    if sql1 <> '' then
    begin
      SumitSQL(AClientThread, '', sql1, 0, false, at1, Query1);

      if Assigned(Query1) then
      try
        Query1.First;
        while not Query1.Eof do
        begin
          da1 := TDicomAttributes.Create;
          //da1 := CopyAttributes(rq);

          AResponseDatasets.Add(da1);

          APPLY_NO := Query1.FieldByName('IDField').asstring;
          if (assigned(Query1.FindField('UIDField'))) then
          begin
            if Query1.FieldByName('UIDField').asstring = '' then
            begin
              strSQL := '1.2.40.0.13.' + FormatDatetime('yyyymmddhhnnss', now) + '.' + Apply_No;
              da1.AddVariant($20, $D, strSQL);
              ExecSQL('update APPLYTABLE set ' +
                'UIDField=''' + strSQL + ''' WHERE IDField=' + apply_no);
            end
            else
              da1.AddVariant($20, $D, Query1.FieldByName('UIDField').asstring);
          end
          else
          begin
            break;
          end;

        //  da1.AddVariant($8, $5, 'ISO_IR 100');
          //          da1.AddVariant($8, $54, Association.Request.CallingTitle);

          da1.AddVariant($8, $50, Apply_No);
          //ЙкЗлТЅЙъ
          da1.Add($8, $90);
          da1.Add($8, $1110);
          da1.Add($8, $1120);

          if (assigned(Query1.FindField('ENameField'))) and (Query1.FieldByName('ENameField').asstring <> '') then
            da1.AddVariant($10, $10, Query1.FieldByName('ENameField').asstring)
          else
            if (assigned(Query1.FindField('NameField'))) then
            da1.AddVariant($10, $10, (Query1.FieldByName('NameField').asstring))
          else
            da1.Add($10, $10);

          da1.AddVariant($10, $20, Query1.FieldByName('IDField').asstring);

          da1.Remove($10, $30);
          if (assigned(Query1.FindField('BirthDateField'))) then
          begin
            da1.Add($10, $30).AsDatetime[0] := Query1.FieldByName('BirthDateField').AsDatetime;
            da1.AddVariant($10, $1010, GetAge(Query1.FieldByName('BirthDateField').AsDatetime,
              Query1.FieldByName('APPLY_TIME').AsDatetime));
          end
          else
            da1.Add($10, $30);

          if (assigned(Query1.FindField('SexField'))) then
          begin
            da1.AddVariant($10, $40, Query1.FieldByName('SexField').asstring)
          end
          else
            da1.Add($10, $40);

          da1.Add($10, $1030);
          da1.Add($10, $2000);
          da1.Add($10, $2110);
          da1.Add($10, $21C0);

          //RequestedPhys
          if (assigned(Query1.FindField('DoctorField'))) then
            da1.AddVariant($32, $1032, (Query1.FieldByName('DoctorField').asstring))
          else
            da1.Add($32, $1032);

          //RequestedProcedureDescription
          if (assigned(Query1.FindField('DescField'))) then
            da1.AddVariant($32, $1060, (Query1.FieldByName('DescField').asstring))
          else
            da1.Add($32, $1060);

          da1.Add($32, $1064);

          da1.Add($38, $10);
          da1.Add($38, $50);

          if (assigned(Query1.FindField('DescField'))) then
            da1.AddVariant($38, $300, (Query1.FieldByName('DescField').asstring))
          else
            da1.Add($38, $300);

          da1.Add($38, $500);

          d1 := TDicomAttributes.Create;
          d1.AddVariant($8, $60, Modility);
          //          d1.AddVariant($40, $1, FAssociation.Request.CallingTitle);
          d1.Remove($40, $2);
          d1.Remove($40, $3);
          d1.Add($40, $2).AsDatetime[0] := now;
          d1.Add($40, $3).AsDatetime[0] := now;
          d1.Add($40, $6);
          d1.Add($40, $7); //ScheduledProcedureStepDescription
          d1.Add($40, $8);
          d1.AddVariant($40, $9, Apply_No);
          d1.AddVariant($40, $10, 'CNSPACS');
          da1.Add($40, $100).AddData(d1);
          d1.Add($40, $10);

          da1.AddVariant($40, $1001, Apply_No);
          da1.Add($40, $3001);
          Query1.Next;
        end;
      finally
        Query1.Free;
      end;
    end;
  end; //cns pacs mwl
begin
  if frmMain.f_chk_serv_parms then
  begin
    Root := getAffectedSOPClass(ACommand);
    rq := TDicomAttributes(ARequestDatasets[0]);
    //
    Level := Trim(rq.GetString(78));
    modility := '';
    at1 := TDicomAttribute.Create(nil, $2809, $2B);
    try
      if root = ModalityWorklistInformationModelFIND then
        begin
          modility := '';
          at := rq.Item[$40, $100];
          if assigned(at) and (at.GetCount > 0) then // i.e. a sequence
            begin
              seq := at.Attributes[0];
              modility := seq.GetString($8, $60);
            end;
          strSQL := '';
          DicomApplyTable;
        end else
        begin
  //-->> 1. LEVEL = PATIENT (Уровень поиска "Пациент")
          if (level = 'PATIENT') then
            begin
              strSQL := '';
              PName := rq.GetString(dPatientName);
              if (PName <> '') and (PName <> '*') then
                begin
                  if strSQL <> '' then
                    strSQL := strSQL + ' and ';
                  strSQL := 'P_ENAME like ''%' + SpSymbRepl(PName) + '%''';
              end;
              PatientID := rq.GetString(dPatientID);
              if PatientID <> '' then
                begin
                  if strSQL <> '' then
                    strSQL := strSQL + ' and ';
                  strSQL := strSQL + 'P_PID like ''%' + SpSymbRepl(PatientID) + '%''';
                end;
              PSex := rq.GetString(dPatientSex);
              if PSex <> '' then
                begin
                  if strSQL <> '' then
                    strSQL := strSQL + ' and ';
                  strSQL := strSQL + 'P_SEX = ''' + PSex + '''';
                end;
              if strSQL <> '' then
                sql1 := 'SELECT * FROM STUDIES WHERE ' + strSQL
              else
                sql1 := 'SELECT * FROM STUDIES';
              SumitSQL(AClientThread, '', sql1, 0, false, at1, Query1);

              if Assigned(Query1) then
                begin
                  try
                    Query1.First;
                    while not Query1.Eof do
                      begin
                        da1 := TDicomAttributes.Create;
                        for i := 0 to rq.Count - 1 do
                          begin
                            x1 := rq.ItemByIndex[i];
                            x2 := da1.Add(x1.Group, x1.Element);
                            if x1.AsString[0] <> '' then
                              x2.AsString[0] := x1.AsString[0];
                          end;
                        da1.AddVariant($8, $52, Level);
                      //  da1.AddVariant($8, $5, 'ISO_IR 100');
                        da1.AddVariant($10, $10, Query1.FieldByName('P_ENAME').asstring);
                        da1.AddVariant($10, $20, Query1.FieldByName('P_PID').asstring);
                        da1.AddVariant($10, $40, Query1.FieldByName('P_SEX').asstring);
                        da1.AddVariant($0010, $0030, DateToStr(Dateof(Query1.FieldByName('P_DATEBORN').AsDateTime)));
                        da1.Sort;
                        AResponseDatasets.Add(da1);
                        Query1.Next;
                      end;
                  finally
                    Query1.Free;
                  end;
                end;
            end; // end of level = patient
  //<<-- 1
  //-->> 2. LEVEL = STUDY (Уровень поиска "Исследование")
          if level = 'STUDY' then
            begin
              strSQL := '';
              PName := rq.GetString($8, $61); // 1). модальность (тип исследования) +
              if PName = '' then
                PName := rq.GetString($8, $60); //модальность (тип исследования) +
              if (PName <> '') then
                strSQL := 'STUDIES_IMAGE_TYPE = ''' + PName + '''';
              x1 := rq.Item[$8, $20]; // 2). даты +
              if assigned(x1) and (x1.GetCount > 0) then
                begin
                  if strSQL <> '' then
                    strSQL := strSQL + ' and ';
                  date1 := x1.AsDatetime[0];
                  if (x1.GetCount > 1) then
                    begin
                      strSQL := strSQL + ' LDATE >= ''' + DateTimeToStr(date1) + '''';
                      date1 := x1.AsDatetime[1];
                      strSQL := strSQL + ' AND LDATE <= ''' + DateTimeToStr(date1) + '''';
                    end else
                    begin
                      strSQL := strSQL + ' LDATE = ''' + DateTimeToStr(date1) + '''';
                    end;
                end;
              if rq.GetString(dStudyInstanceUID) <> '' then // 3). UID исследования
                begin
                  if strSQL <> '' then
                    strSQL := strSQL + ' and ';
                  strSQL := 'STUDYUID like ''%' + SpSymbRepl(rq.GetString(dStudyInstanceUID)) + '%''';
                end;
              if rq.GetString(dPatientID) <> '' then // 4). Номер исследования
                begin
                  if strSQL <> '' then
                    strSQL := strSQL + ' and ';
                  strSQL := strSQL + 'P_PID like ''%' + SpSymbRepl(rq.GetString(dPatientID)) + '%''';
                end;
              if rq.GetString(dPatientName) <> '' then // 5). Фамилия пациента
                begin
                  if strSQL <> '' then
                    strSQL := strSQL + ' and ';
                  strSQL := strSQL + 'P_ENAME like ''%' + SpSymbRepl(rq.GetString(dPatientName)) + '%''';
                end;
              if rq.GetString(dPatientSex) <> '' then // 6). Пол пациента
                begin
                  if strSQL <> '' then
                    strSQL := strSQL + ' and ';
                  strSQL := strSQL + 'P_SEX = ''' + rq.GetString(dPatientSex)+'''';
                end;
              if rq.GetString(dPatientBirthDate) <> '' then // 7). Дата рождения пациента
                begin
                  if strSQL <> '' then
                    strSQL := strSQL + ' and ';
                  strSQL := strSQL + 'P_DATEBORN = ''' + rq.GetString(dPatientBirthDate)+'''';
                end;
              if rq.GetString(dStudyDescription) <> '' then // 8). Описание исследования
                begin
                  if strSQL <> '' then
                    strSQL := strSQL + ' and ';
                  strSQL := strSQL + 'STUDYDESCRIPTION like ''%' + rq.GetString(dStudyDescription)+'%''';
                end;
              if rq.GetString($8, $90) <> '' then // 9). Врач
                begin
                  if strSQL <> '' then
                    strSQL := strSQL + ' and ';
                  strSQL := strSQL + 'REFERRINGPHYSICIANNAME like ''' + rq.GetString($8, $90)+'''';
                end;
              if rq.GetString(dAccessionNumber) <> '' then // 10). dAccessionNumber
                begin
                  if strSQL <> '' then
                    strSQL := strSQL + ' and ';
                  strSQL := strSQL + 'ACCESSIONNUMBER like ''%' + rq.GetString(dAccessionNumber)+'%''';
                end;

              if strSQL <> '' then
                sql1 := 'SELECT * FROM STUDIES WHERE ' + strSQL + ' ORDER BY LDATE'
              else
                sql1 := 'SELECT * FROM STUDIES ORDER BY LDATE';
              SumitSQL(AClientThread, '', sql1, 0, false, at1, Query1);
              if Assigned(Query1) then
                try
                  Query1.First;
                  while not Query1.Eof do
                    begin
                      da1 := TDicomAttributes.Create;
                      da1.AddVariant($8, $52, Level);
                    //  da1.AddVariant($8, $5, 'ISO_IR 100');
                      da1.Remove(8, $61);
                      da1.AddVariant($10, $10, Query1.FieldByName('P_ENAME').asString);
                      da1.AddVariant($10, $20, Query1.FieldByName('P_PID').asString);
                      da1.AddVariant($20, $D, Query1.FieldByName('STUDYUID').asString);
                      da1.AddVariant($20, $10, Query1.FieldByName('STUDYID').asString);
                      da1.AddVariant($0008, $0050, Query1.FieldByName('ACCESSIONNUMBER').asstring);
                      da1.AddVariant($8, $20, Query1.FieldByName('LDATE').asString);
                      da1.AddVariant($8, $60, Query1.FieldByName('STUDIES_IMAGE_TYPE').asString);
                      da1.AddVariant($10, $40, Query1.FieldByName('P_SEX').asstring);
                      da1.AddVariant($0010, $0030, DateToStr(Dateof(Query1.FieldByName('P_DATEBORN').AsDateTime)));
                      da1.AddVariant($8, $1030, Query1.FieldByName('STUDYDESCRIPTION').asstring);
                      da1.Sort;
                      AResponseDatasets.Add(da1);
                      Query1.Next;
                    end;
                finally
                  Query1.Free;
                end;
            end; //end of level = study
  //<<-- 2
  //-->> 3. LEVEL = SERIES (Уровень поиска "Серия")
          if level = 'SERIES' then
            begin
              strSQL := '';
              if rq.GetString(dSeriesInstanceUID) <> '' then
                begin
                  if strSQL <> '' then
                    strSQL := strSQL + ' and ';
                  strSQL := strSQL + 'SERIESUID  =''' + rq.GetString(dSeriesInstanceUID) + '''';
                end else
                  if rq.GetString(dStudyInstanceUID) <> '' then
                    begin
                      strSQL := 'STUDYUID = ''' + rq.GetString(dStudyInstanceUID) + '''';
                    end;
              if strSQL = '' then
                exit;
              sql1 := 'SELECT * FROM SERIES WHERE ' + strSQL;
              SumitSQL(AClientThread, '', sql1, 0, false, at1, Query1);
              kk := 0;
              if Assigned(Query1) then
                try
                  Query1.First;
                  while not Query1.Eof do
                    begin
                      da1 := TDicomAttributes.Create;
                      for i := 0 to rq.Count - 1 do
                        begin
                          x1 := rq.ItemByIndex[i];
                          x2 := da1.Add(x1.Group, x1.Element);
                          if x1.AsString[0] <> '' then
                            x2.AsString[0] := x1.AsString[0];
                        end;
                      da1.AddVariant($8, $52, Level);
                    //  da1.AddVariant($8, $5, 'ISO_IR 100');
                      da1.Add($8, $8);
                      da1.Add($8, $70);
                      da1.Add($20, $1002);
                      da1.AddVariant($20, $D, Query1.FieldByName('STUDYUID').asstring);
                      da1.AddVariant($20, $E, Query1.FieldByName('SERIESUID').asstring);
                      da1.AddVariant($8, $60, Query1.FieldByName('SERIES_IMAGETYPE').asstring);
                      da1.Add($8, $0021).AsDatetime[0] := Query1.FieldByName('SERIES_DATE').AsDateTime;
                      da1.AddVariant($8, $103E, Query1.FieldByName('SERIES_DESC').asstring);
                      da1.AddVariant($20, $11, kk);
                      inc(kk);
                      da1.Sort;
                      AResponseDatasets.Add(da1);
                      Query1.Next;
                    end;
                finally
                  Query1.Free;
                end;
            end; //end of series
  //<<-- 3
  //-->> 4. LEVEL = IMAGE (Уровень поиска "Изображение")
          if level = 'IMAGE' then
            begin
              strSQL := '';
              if rq.GetString($8, $18) <> '' then
                begin
                  strSQL := ' INSTANCEUID = ''' + rq.GetString($8, $18) + '''';
                end else
                  if rq.GetString(dSeriesInstanceUID) <> '' then
                    begin
                      if strSQL <> '' then
                        strSQL := strSQL + ' and ';
                      strSQL := strSQL + 'SERIESUID = ''' + rq.GetString(dSeriesInstanceUID) + '''';
                    end else
                      if rq.GetString(dStudyInstanceUID) <> '' then
                        begin
                          if strSQL <> '' then
                            strSQL := strSQL + ' and ';
                          strSQL := strSQL + 'STUDYUID = ''' + rq.GetString(dStudyInstanceUID) + '''';
                        end;
              if strSQL = '' then
                exit;
              sql1 := 'SELECT * FROM IMAGES WHERE ' + strSQL + ' ORDER BY SERIESUID,IMGNO';
              SumitSQL(AClientThread, '', sql1, 0, false, at1, Query1);
              if Assigned(Query1) then
                try
                  Query1.First;
                  while not Query1.Eof do
                    begin
                      da1 := TDicomAttributes.Create;
                      for i := 0 to rq.Count - 1 do
                        begin
                          x1 := rq.ItemByIndex[i];
                          x2 := da1.Add(x1.Group, x1.Element);
                          if x1.AsString[0] <> '' then
                            x2.AsString[0] := x1.AsString[0];
                        end;
                      da1.AddVariant($8, $52, Level);
                    //  da1.AddVariant($8, $5, 'ISO_IR 100');
                      da1.Add($8, $8);
                      da1.AddVariant($20, $D, Query1.FieldByName('STUDYUID').asstring);
                      da1.AddVariant($20, $E, Query1.FieldByName('SERIESUID').asstring);
                      da1.AddVariant($8, $60, Query1.FieldByName('IMAGETYPE').asstring);
                      da1.AddVariant($8, $18, Query1.FieldByName('InstanceUID').asstring);
                      da1.AddVariant($20, $13, Query1.FieldByName('IMGNO').asstring);
                      da1.AddVariant($28, $10, Query1.FieldByName('SIZEX').AsInteger);
                      da1.AddVariant($28, $11, Query1.FieldByName('SIZEY').AsInteger);
                      da1.Sort;
                      AResponseDatasets.Add(da1);
                      Query1.Next;
                    end;
                finally
                  Query1.Free;
                end;
            end; //end of level = Image
          end;
    finally
      at1.Free;
    end;
  end;
end;

function TfrmMain.MyTestDcmFileDir( AClientThread: TDicomClientThread;
                                        p_STUDYUID    : string;
                                        p_STUDIESDATE : TDateTime;
                                        p_IMAGEDATE   : TDateTime;
                                        p_IMAGETYPE   : string;
                                        p_base_dir    : string;
                                        var AImageDir : string): Boolean;
function TestDir(ADir: string; ADate: TDatetime; ImageType: string): Boolean;
  var y, m, d: Word;
      str1: string;
  begin
    DecodeDate(adate, y, m, d);
    Result := false;
    if trim(ADir)='' then Exit;
    if ADir[Length(ADir)] <> '\' then
      adir := adir + '\';
    if ImageType <> '' then
    begin
      str1 := adir + ImageType + '\' + IntToStr(y) + '\' + IntToStr(m) + '\' + IntToStr(d) + '\' +
        Trim(p_STUDYUID) + '\';
    end
    else
    begin
      str1 := adir + Trim(p_STUDYUID) + '\';
    end;
    if DirectoryExists(str1) then
    begin
      AImageDir := str1;
      Result := true;
    end
    else
    begin
      str1 := adir + Trim(p_STUDYUID) + '\';
      if DirectoryExists(str1) then
      begin
        AImageDir := str1;
        Result := true;
      end;
    end;
  end;
var
  date1: TDatetime;
  ImageType: string;
  f1: TDateTime;
begin
  f1 := p_STUDIESDATE;
  if Yearof(f1)>1900 then
    f1 := p_IMAGEDATE;

  date1 := f1;
  ImageType := Trim(p_IMAGETYPE);
  Result := TestDir(p_base_dir, date1, ImageType);
  if Result then
    exit;
end;

function TfrmMain.MyTestFile( AClientThread: TDicomClientThread;
                                  p_SERIESUID : string;
                                  p_INSTANCEUID : string;
                                  p_IMGNO : string;
                                  basedir : string
                                ): string;
var pname : string;
begin
  // FOMIN
  pName := BaseDir + p_SERIESUID + '\' + p_IMGNO + '.dcm';
  if FileExists(pname) then
    begin
      Result := pName;
    end else
    begin
      pName := BaseDir + p_SERIESUID + '\' + p_INSTANCEUID + '.dcm';
      if FileExists(pname) then
        begin
          Result := pname;
        end else
        begin
          pName := BaseDir + ' ' + p_SERIESUID + '\' + p_IMGNO + '.dcm';
          if FileExists(pname) then
            Result := pname
          else begin
            Result := '';
          end;
        end;
    end;
end;

procedure TfrmMain.N10Click(Sender: TObject);
begin  // About
  Application.CreateForm(TFrmAbout, FrmAbout);
  try
    FrmAbout.vInfo := 'Программа Client '+#13+
                      'Предназначена для просмотра '+#13+
                      'результатов исследований и'+#13+
                      'работе с PACS сервером'+#13+
                      ''+#13+
                      ''+#13+
                      '';
    FrmAbout.ShowModal;
  finally
    FrmAbout.Free;
  end;
end;

procedure TfrmMain.DicomServerCore1DicomGet(AClientThread: TDicomClientThread;
  AAddress: string; ACommand: TDicomAttributes; ARequestDatasets,
  AResponseDatasets: TList);
var Dds : TDicomDataset;
     DA : TDicomAttributes;
    Str, Level, SQL: string;
    MyQuery : TpFIBDataSet;
    BaseDir, {BaseRemoteDir,} pName ,
    v_PatientID : string;  vAN : string;
function HaveTheImage(Das: TDicomAttributes): Boolean;
var i : integer; 
  begin
    Result := true;
    for i := 0 to AResponseDatasets.Count - 1 do
      begin
        DA := TDicomAttributes(AResponseDatasets[i]);
        if DA.GetString(8, $18) = das.GetString(8, $18) then
          begin
            Result := False;
            Exit;
          end;
      end;
  end;
  // обработка запросов pack-устройства
begin
  if frmMain.f_chk_serv_parms then
  begin
    MyQuery := TpFIBDataSet.Create(nil);
    if AClientThread<>nil then
    begin
      MyQuery.Database := (AClientThread.v_ClThr_DB as TpFIBDatabase);
      MyQuery.Transaction := (AClientThread.v_ClThr_trRead as TpFIBTransaction);
    end else
    begin
      MyQuery.Database := DB_CMN.DB;
      MyQuery.Transaction := DB_CMN.trRead;
    end;
    DA := TDicomAttributes(ARequestDatasets[0]);
    Level := DA.GetString(78); // определяется уровень (patient, study or series)
    vAN := DA.GetString(dAccessionNumber) ;
    // FOMIN исправить
    if Level = 'PATIENT' then
    begin
      Str := 'P_PID = :P_dPatientID ';
    end
    else
    begin
      if Level = 'STUDY' then
        if vAN = '' then // если не выставлен номер протокола то пытаемся найти по Study UID
        begin
          Str := 'STUDYUID = :P_dStudyInstanceUID ';
        end
        else begin
          Str := 'ACCESSIONNUMBER = :P_dAccessionNumber ';
        end
      else
      if Level = 'SERIES' then
      begin
        Str := 'SeriesUID = :P_dSeriesInstanceUID ';
      end
      else
      if Level = 'IMAGE' then
      begin
        Str := 'InstanceUID = :P_dSOPInstanceUID ';
      end;
    end;
    if Str = '' then
      begin
        exit;
      end;
    // ключевые снимки
    if DA.GetInteger($2809, $001D)=1 then
    begin
      Str:=Str+' and SELECTEDINDEX1=1 ';
    end;
    //
    SQL := 'SELECT * FROM IMAGES WHERE ' + Str + ' ORDER BY SERIESUID, IMGNO';
    try
      MyQuery.SelectSQL.Add(SQL);
      MyQuery.Prepare;
      if Level = 'PATIENT' then
      begin
        v_PatientID := DA.GetString(dPatientID) ;
        MyQuery.ParamByName('P_dPatientID').AsString := v_PatientID;
      end
      else
      begin

    //  v_tmp:=DA.GetString(dAccessionNumber);

        if Level = 'STUDY' then
          if vAN = '' then // если не выставлен номер протокола то пытаемся найти по Study UID
          begin
            MyQuery.ParamByName('P_dStudyInstanceUID').AsString := DA.GetString(dStudyInstanceUID);
          end
          else begin
            MyQuery.ParamByName('P_dAccessionNumber').AsString := vAN;
          end
        else
        if Level = 'SERIES' then
        begin
          MyQuery.ParamByName('P_dSeriesInstanceUID').AsString := DA.GetString(dSeriesInstanceUID);
        end
        else
        if Level = 'IMAGE' then
        begin
          MyQuery.ParamByName('P_dSOPInstanceUID').AsString := DA.GetString(dSOPInstanceUID);
        end;
      end;
      try
        MyQuery.Open;  
        MyQuery.First;
      except
      on e: Exception do
        begin
          FreeAndNil(MyQuery);
          raise;
        end;
      end;
      try
        if not MyQuery.EOF then
        begin
          Application.ProcessMessages;
          // вставить проверку на рабочее соединение
  //        AClientThread.Association.sendReleaseResponse;
          if MyTestDcmFileDir( AClientThread,
                               MyQuery.FieldByName('STUDYUID').AsString,
                               MyQuery.FieldByName('STUDIESDATE').AsDateTime,
                               MyQuery.FieldByName('IMAGEDATE').AsDateTime,
                               MyQuery.FieldByName('IMAGETYPE').AsString,
                               frmMain.sIMGpath, // sDir,  // frmMain.sIMGpath
                               BaseDir)
          then  // -->> 1. ищем файл в локальном хранилище
            begin
              Dds := TDicomDataset.Create;
              try
                while not MyQuery.EOF do
                begin
                  Application.ProcessMessages;
                  //
                  pName := MyTestFile(  AClientThread,
                                        MyQuery.FieldByName('SERIESUID').AsString,
                                        MyQuery.FieldByName('INSTANCEUID').AsString,
                                        MyQuery.FieldByName('IMGNO').AsString,
                                        BaseDir);
                  AClientThread.v_resp_DS_list.Append(pName);                      
                  if (pName <> '') then
                  begin
                    if Dds.LoadFromFile(pName) then
                    begin
                      AResponseDatasets.Add(Dds.Attributes);
                      Dds.RecreateAttributes;
                    end;
                  end;
                  MyQuery.Next;
                end;
              finally
                Dds.Attributes.Clear;
                Dds.Free;
              end;
            end;
        end;
      finally
        Application.ProcessMessages;
      end;
    finally
      FreeAndNil(MyQuery);
    end;
  end;
end;

function TfrmMain.AppendImage( AClientThread: TDicomClientThread;
                                   DA: TDicomAttributes;
                                   StudyID, PName,
                                   PDateBorn, PSex, PatientID: string;
                                   StudyDate: TDateTime;
                                   StudyUID, SeriesUID,
                                   InstanceUID, ImageType, AID: string;
                                   var AModility: string;
                                   StudyDescription,
                                   PhysName: string;
                                   AccessionNumber : string;
                                   p_Selected2 : integer = 0
                                 ): TDatetime;
var FIBQuery: TpFIBQuery;
    FIBDataSet: TpFIBDataSet;
    DA1: TDicomAttribute;
    v_is_add : Boolean;
    v_SELECTEDINDEX1 : integer;
  procedure p_start_write_trans;
  begin
    if AClientThread<>nil then
    begin
      if (AClientThread.v_ClThr_trWrite as TpFIBTransaction).Active = False then
        (AClientThread.v_ClThr_trWrite as TpFIBTransaction).StartTransaction;
    end else
    begin
      if trWrite.Active = False then
        trWrite.StartTransaction;
    end;
  end;
  procedure p_start_read_trans;
  begin
    if AClientThread<>nil then
    begin
      if (AClientThread.v_ClThr_trRead as TpFIBTransaction).Active = False then
        (AClientThread.v_ClThr_trRead as TpFIBTransaction).StartTransaction;
    end else
    begin
      if trRead.Active = False then
        trRead.StartTransaction;
    end;
  end;
begin
  v_is_add:=False;
  FIBDataSet := TpFIBDataSet.Create(nil);
  FIBQuery := TpFIBQuery.Create(nil);
  try
    if AClientThread<>nil then
    begin
      FIBDataSet.Database := (AClientThread.v_ClThr_DB as TpFIBDatabase); // DB;
      FIBDataSet.Transaction := (AClientThread.v_ClThr_trRead as TpFIBTransaction); // trRead ;
      FIBQuery.Database := (AClientThread.v_ClThr_DB as TpFIBDatabase); // DB;
      FIBQuery.Transaction := (AClientThread.v_ClThr_trWrite as TpFIBTransaction) ;
    end else
    begin    
      FIBDataSet.Database := lDB;
      FIBDataSet.Transaction := ltrRead ;
      FIBQuery.Database := lDB;
      FIBQuery.Transaction := ltrWrite ;
    end;
    if FIBDataSet.Database<>nil then
    begin
      FIBDataSet.AutoCommit := True;
      FIBQuery.Options :=  FIBQuery.Options + [qoAutoCommit];
      Result := StudyDate;
      //trRead.CommitRetaining;
  //1. Пациент (Patients)-->
      if not AClientThread.p_check_patientID(PatientID) then
      begin
        FIBDataSet.SQLs.SelectSQL.Clear;
        p_start_read_trans;
        FIBDataSet.SQLs.SelectSQL.Text := ' SELECT * FROM PATIENTS WHERE P_PID = UPPER(:P_PID) '; // ищем пациента (по P_PID - № МК)
        FIBDataSet.ParamByName('P_PID').AsString := PatientID;
        FIBDataSet.Open;
        if FIBDataSet.RecordCount = 0 then // если query ничего не вернул (rowcount = 0), то INSERT
        begin
          p_start_write_trans;
          FIBQuery.Close;
          FIBQuery.SQL.Clear;
          FIBQuery.SQL.Add(' INSERT INTO PATIENTS(P_ENAME, P_ENAME_RUS, P_SEX, P_PID, P_DATEBORN, P_FAM, P_IM, P_OTCH) '+#13+
                           ' VALUES(UPPER(:P_ENAME), UPPER(:P_ENAME_RUS), :P_SEX, UPPER(:P_PID), :P_DATEBORN, UPPER(:P_FAM), UPPER(:P_IM), UPPER(:P_OTCH)) ');
          FIBQuery.ParamByName('P_ENAME').AsString := PName;
          FIBQuery.ParamByName('P_ENAME_RUS').AsString := TranslitEng(PName);
          if PDateBorn = '' then
            FIBQuery.ParamByName('P_DATEBORN').AsDateTime := Now
          else
            FIBQuery.ParamByName('P_DATEBORN').AsDateTime := StrToDate(PDateBorn);
          FIBQuery.ParamByName('P_SEX').AsString := pSex;
          FIBQuery.ParamByName('P_PID').AsString := PatientID;
          FIBQuery.ParamByName('P_FAM').AsString := TranslitEng(ExtractWord(1, PName, [' ','^','.']));
          FIBQuery.ParamByName('P_IM').AsString := TranslitEng(ExtractWord(2, PName, [' ','^','.']));
          FIBQuery.ParamByName('P_OTCH').AsString := TranslitEng(ExtractWord(3, PName, [' ','^','.']));
          FIBQuery.ExecQuery;
        end;
      end;
  //2. Исследование (Studies)-->
      if not AClientThread.p_check_studyUID(StudyUID,'','') then
      begin
        FIBDataSet.Close;
        p_start_read_trans;
        FIBDataSet.SQLs.SelectSQL.Clear;
        FIBDataSet.SQLs.SelectSQL.Text := ' SELECT * FROM STUDIES WHERE STUDYUID = UPPER(:STUDYUID) '; // ищем исследование
        FIBDataSet.ParamByName('STUDYUID').AsString := StudyUID;
        FIBDataSet.Open;
        if FIBDataSet.RecordCount = 0 then // если query ничего не вернул (rowcount = 0) то INSERT
          begin
            p_start_write_trans;
            FIBQuery.Close;
            FIBQuery.SQL.Clear;
            FIBQuery.SQL.Add(' INSERT INTO STUDIES(STUDYUID, P_ENAME, P_ENAME_RUS, P_SEX, P_PID, BSTATE, LDATE, STUDYID, STUDIES_IMAGE_TYPE, '+#13+
                             '                     P_DATEBORN, STATUS, STUDYDESCRIPTION, REFERRINGPHYSICIANNAME, ACCESSIONNUMBER) ');
            FIBQuery.SQL.Add(' VALUES(UPPER(:STUDYUID), UPPER(:P_ENAME), UPPER(:P_ENAME_RUS), :P_SEX, UPPER(:P_PID), 1, :LDATE, :STUDYID, :IMAGE_TYPE, :P_DATEBORN, 0, '+#13+
                             '        UPPER(:STUDYDESC), UPPER(:PHYSNAME), :PACCESSIONNUMBER ) ');
            FIBQuery.ParamByName('STUDYUID').AsString := StudyUID; // Copy(StudyUID,1,80);
            FIBQuery.ParamByName('P_ENAME').AsString := Copy(PName,1,50);
            FIBQuery.ParamByName('P_ENAME_RUS').AsString := Copy(TranslitEng(PName),1,50);
            FIBQuery.ParamByName('P_SEX').AsString := PSex;
            FIBQuery.ParamByName('P_PID').AsString := PatientID; // Copy(PatientID,1,80);
            FIBQuery.ParamByName('LDATE').AsDatetime := StudyDate;
            FIBQuery.ParamByName('STUDYID').AsString := StudyID;
            FIBQuery.ParamByName('IMAGE_TYPE').AsString := ImageType;
            if PDateBorn = '' then
              FIBQuery.ParamByName('P_DATEBORN').AsDateTime := Now
            else
              FIBQuery.ParamByName('P_DATEBORN').AsDateTime := StrToDate(PDateBorn);
            FIBQuery.ParamByName('STUDYDESC').AsString := StudyDescription;
            FIBQuery.ParamByName('PHYSNAME').AsString := TranslitEng(PhysName);
            FIBQuery.ParamByName('PACCESSIONNUMBER').AsString := AccessionNumber; //Copy(AccessionNumber,1,20);
            FIBQuery.ExecQuery;
            FIBQuery.Close;
            AModility := ImageType;
          end else
        begin
          Result := FIBDataSet.FieldByName('LDATE').AsDatetime;
          AModility := FIBDataSet.FieldByName('STUDIES_IMAGE_TYPE').AsString;
        end;
      end;
  //3. Серия (Series)-->
      if AClientThread.p_check_seriesUID(SeriesUID) then
      begin
        FIBDataSet.Close;
        p_start_read_trans;
        FIBDataSet.SQLs.SelectSQL.Clear;
        FIBDataSet.SQLs.SelectSQL.Text := ' SELECT * FROM SERIES WHERE SERIESUID = UPPER(:SERIESUID) ';
        FIBDataSet.ParamByName('SERIESUID').AsString := SeriesUID;
        FIBDataSet.Open;
        if FIBDataSet.RecordCount = 0 then
        begin
          p_start_write_trans;
          FIBQuery.Close;
          FIBQuery.SQL.Clear;
          FIBQuery.SQL.Add(' INSERT INTO SERIES(STUDYUID, SERIESUID, SERIES_IMAGETYPE, SERIES_DESC, SERIES_DATE, ACCESSIONNUMBER) '+#13+
                           ' VALUES(UPPER(:STUDYUID),UPPER(:SERIESUID),:SERIES_IMAGETYPE,:SERIES_DESC,:SERIES_DATE, :PACCESSIONNUMBER) ');
          FIBQuery.ParamByName('STUDYUID').AsString := StudyUID;
          FIBQuery.ParamByName('SERIESUID').AsString := SeriesUID;
          FIBQuery.ParamByName('SERIES_IMAGETYPE').AsString := AModility; //ImageType
          FIBQuery.ParamByName('SERIES_DESC').AsString := DA.GetString($0008, $103E);
          DA1 := DA.Item[$8, $0021]; // Tag Series Date
          if Assigned(DA1) and (DA1.GetCount > 0) then
            FIBQuery.ParamByName('SERIES_DATE').AsDatetime := DA1.AsDatetime[0]
          else
            FIBQuery.ParamByName('SERIES_DATE').AsDatetime := Now;
          FIBQuery.ParamByName('PACCESSIONNUMBER').AsString := AccessionNumber;
          FIBQuery.ExecQuery;
          FIBQuery.Close;
        end;
      end;
  //4. Снимок (Images)-->
      v_SELECTEDINDEX1:=0;
      FIBDataSet.Close;
      p_start_read_trans;
      FIBDataSet.SQLs.SelectSQL.Clear;
      FIBDataSet.SQLs.SelectSQL.Text := ' SELECT * FROM IMAGES WHERE INSTANCEUID = UPPER(:INSTANCEUID) ';
      FIBDataSet.ParamByName('INSTANCEUID').AsString := InstanceUID;
      FIBDataSet.Open;
      if not FIBDataSet.Eof then
      begin
        v_SELECTEDINDEX1:=FIBDataSet.FieldByName('SELECTEDINDEX1').AsInteger;
      end;
      if FIBDataSet.RecordCount = 0 then
      begin
        p_start_write_trans;
        FIBQuery.Close;
        FIBQuery.SQL.Clear;
        FIBQuery.SQL.Add(' INSERT INTO IMAGES (STUDYUID, SERIESUID, INSTANCEUID, IMGNO, IMAGETYPE, IMAGEDATE, '+#13+
                         '                     P_PID, SIZEX, SIZEY, PHOTOMETRIC, BITS, ABITS, BITS_PER_SAMPLE, '+#13+
                         '                      SELECTEDINDEX1, STUDIESDATE, ACCESSIONNUMBER)');
        FIBQuery.SQL.Add(' VALUES(UPPER(:STUDYUID), UPPER(:SERIESUID), UPPER(:INSTANCEUID), :IMGNO, :IMAGE_TYPE, :LDATE, UPPER(:P_PID),' +#13+
                         '        :SIZEX, :SIZEY, :PHOTOMETRIC, :BITS, :ABITS, :BITS_PER_SAMPLE, :SELECTEDINDEX1, '+#13+
                         '                      :STUDIESDATE, :PACCESSIONNUMBER)');
        FIBQuery.ParamByName('STUDYUID').AsString := StudyUID;
        FIBQuery.ParamByName('SERIESUID').AsString := SeriesUID;
        FIBQuery.ParamByName('INSTANCEUID').AsString := InstanceUID;
        FIBQuery.ParamByName('IMGNO').AsInteger := StrToInt(AID);
        FIBQuery.ParamByName('IMAGE_TYPE').AsString := AModility; //ImageType
        FIBQuery.ParamByName('LDATE').AsDatetime := StudyDate;
        FIBQuery.ParamByName('P_PID').AsString := PatientID;
        FIBQuery.ParamByName('SIZEX').AsInteger := DA.GetInteger($28, $10); // Tag Rows (Ширина)
        FIBQuery.ParamByName('SIZEY').AsInteger := DA.GetInteger($28, $11); //Tag Columns (Высота)
        FIBQuery.ParamByName('BITS').AsInteger := DA.GetInteger($28, $101); //Tag Bits Stored (занято битов)
        FIBQuery.ParamByName('ABITS').AsInteger := DA.GetInteger($28, $100); //Tag Bits Allocated (выделено, забронировано битов)
        FIBQuery.ParamByName('BITS_PER_SAMPLE').AsInteger := DA.GetInteger($28, 2); //Tag Samples per Pixel
        FIBQuery.ParamByName('STUDIESDATE').AsDatetime := StudyDate;
        FIBQuery.ParamByName('PHOTOMETRIC').AsString := DA.GetString($28, 4); // Photometric Interpretation
        FIBQuery.ParamByName('PACCESSIONNUMBER').AsString := AccessionNumber;
        FIBQuery.ParamByName('SELECTEDINDEX1').AsInteger  := p_Selected2;
        FIBQuery.ExecQuery;
        v_is_add:=True;
        FIBQuery.Close;
      end;
      if not v_is_add then
      begin
        if (v_SELECTEDINDEX1<>p_Selected2) then
        begin
          p_start_write_trans;
          FIBQuery.Close;
          FIBQuery.SQL.Clear;
          FIBQuery.SQL.Add(' UPDATE IMAGES SET SELECTEDINDEX1 = :SELECTEDINDEX1 WHERE INSTANCEUID = UPPER(:INSTANCEUID)');
          FIBQuery.ParamByName('INSTANCEUID').AsString := InstanceUID;
          FIBQuery.ParamByName('SELECTEDINDEX1').AsInteger := p_Selected2;
          FIBQuery.ExecQuery;
        end;
      end;
    end;
  finally
    FreeAndNil(FIBQuery);
    FreeAndNil(FIBDataSet);
  end;
end;

procedure TfrmMain.DicomServerCore1DicomImage(AClientThread: TDicomClientThread;
  AAddress: string; ADataset: TDicomDataset);
var InstanceUID, Aid, pName, pDateBorn, pSex, ImageType, StudyID, SeriesUID,
    StudyUID, PatientID, ImageType1, StudyDescription, PhysName, AccessionNumber: string;
    StudyDate: TDatetime;
    DA: TDicomAttribute;
    v_Selected2, v_SessionID : integer;
    y, m, d: Word;
    ImageFilename: string;
    CurDir : string; //CurrentDir
procedure chk_studyUID_img_sav_lst ( p_TransactionUID : string;
                                    p_StudyUID : string;
                                    p_CallingTitle : string;
                                    p_text : ansistring;
                                    p_SessionID : integer
                                  ) ;
var i , v_high : integer;
    v_res : boolean;
begin
  v_res:=False;
  v_high:=Length(v_studyUID_img_sav_lst);
  for i := 0 to v_high - 1 do
  begin
    if ((v_studyUID_img_sav_lst[i].f_TransactionUID=p_TransactionUID) and
        (v_studyUID_img_sav_lst[i].f_StudyUID=p_StudyUID))
    then
    begin
      // нарастим количество принятых снимков
      v_studyUID_img_sav_lst[i].f_amm_received := v_studyUID_img_sav_lst[i].f_amm_received + 1 ;
      v_res:=True;
      break;
    end;
  end;
  if not v_res then
  begin
    v_high:=Length(v_studyUID_img_sav_lst);
    SetLength(v_studyUID_img_sav_lst,v_high+1);
    v_studyUID_img_sav_lst[v_high].f_CallingTitle   := p_CallingTitle ;
    v_studyUID_img_sav_lst[v_high].f_TransactionUID := p_TransactionUID ;
    v_studyUID_img_sav_lst[v_high].f_StudyUID       := p_StudyUID ;
    v_studyUID_img_sav_lst[v_high].f_amm_received   := 1 ;
    v_studyUID_img_sav_lst[v_high].f_text           := p_text ;
    v_studyUID_img_sav_lst[v_high].f_SessionID      := p_SessionID;
  end;
end;

procedure SetDir(ADir: string);
  begin
    if ADir <> '' then
      begin
        if CurDir <> '' then
          begin
            if CurDir[Length(CurDir)] <> '\' then
              CurDir := CurDir + '\';
            CurDir := CurDir + ADir;
          end else
          begin
            CurDir := ADir;
          end;
        if not DirectoryExists(CurDir) then
          if not CreateDir(CurDir) then
            MessageDlg('ERROR - Не удаётся создать дирректорию ' + CurDir, mtError, [mbOK], 0);
      end;
  end;
var v_MemoryStream : TMemoryStream ;
    das: TDicomAttributes;
    daPDF : TDicomAttribute;
begin
  if v_is_moveDCM then
  begin
    // проверяем признак принудительного выхода - устанавливается
    // в форме ползунка
    if CmnUnit.v_exit_progressbar=1 then // остановить прием
    begin
    //  p_try_pacs_stop;
    end else begin  // прием очередного снимка
      // пока принятых снимков меньше общего
      // количества которое ожидается принять

     // MessageDlg('Принимаются снимки - всего : '+inttostr(MoveImageCount), mtWarning, [mbOK], 0);

      if v_amm_img_loaded<=MoveImageCount then begin
        // добавили снимок в датасет

  //  ADataset.SaveToFile('d:\1.dcm', True, 8193, 100);

    daPDF := ADataset.Attributes.Item[$2006, $0001];
    if Assigned(daPDF) then
    begin
      v_MemoryStream := TMemoryStream.Create ;
      try
        daPDF.SaveToStream(v_MemoryStream);
        ADataset.LoadFromStream(v_MemoryStream);
      finally
        v_MemoryStream.Free;
      end;
    end;




        v_LCnsDMTable1.Add(ADataset);
        v_LCnsDMTable2.Add(ADataset);
        inc(v_amm_img_loaded);
        // послали сообщение что снимок принят нормально - 0
        AClientThread.Association.SendStatus(0);
        FrmProgressBar.MyIncPos('Загрузка снимка ' +
                  inttostr(v_amm_img_loaded)+'/'+inttostr(MoveImageCount));
       // FrmProgressBar.MyIncPos; // прогрессбар нарастили
        // если снимок последний - остановим прием
        Sleep(100);
        if v_amm_img_loaded>=MoveImageCount then
        begin
          CmnUnit.v_exit_progressbar:=2;  // остановим ползунок
        end;
      end;
    end;
  end else
  begin
    if frmMain.f_chk_serv_parms then
    begin
      // парсим DICOM
      ImageType := ADataset.Attributes.GetString($8, $60); // Модальность (CS Modality)
      StudyID := ADataset.Attributes.GetString($20, $10); // ID исследования (StudyID)
      PatientID := ADataset.Attributes.GetString($10, $20); // ID пациента (PatientID)
      StudyDescription := ADataset.Attributes.GetString($8, $1030); // Комментарий-описание к исследованию (Study Description)
      AccessionNumber := ADataset.Attributes.GetString($8, $0050); // Номер протокола исследования
      DA := ADataset.Attributes.Item[8, $20]; // Дата исследования (Study Date)
      if assigned(DA) then
        begin
          StudyDate := DA.AsDatetime[0];
          DA := ADataset.Attributes.Item[8, $30]; // Время исследования (Study Time)
          if assigned(DA) then
            begin
              StudyDate := StudyDate + DA.AsDatetime[0];
            end;
        end else
        begin
          StudyDate := Now;
        end;
      StudyUID := ADataset.Attributes.GetString($20, $D);  // Study Instance UID
      SeriesUID := ADataset.Attributes.GetString($20, $E); // Series Instanse UID
      if SeriesuID = '' then
        SeriesUID := ADataset.Attributes.GetString($20, $11); // Series Number
      PhysName := gt_charset_value( ADataset.Attributes, ADataset.Attributes.GetString($8, $0090) ) ; // ФИО врача (Referring Physicians Name)
      pName := TranslitRus ( gt_charset_value( ADataset.Attributes, ADataset.Attributes.GetString($10, $10) ) ) ; // ФИО пациента (Patient Name)
      pDateBorn := ADataset.Attributes.GetString($10, $30); // Дата рождения пациента (Patient Birth Date)
      pSex := ADataset.Attributes.GetString($10, $40); // Пол пациента (Patient Sex)
      if PatientID = '' then
        PatientID := 'Unknown';
      AID := ADataset.Attributes.GetString($20, $13); // Instance Number
      if aid = '' then
        AID := ADataset.Attributes.GetString($20, $12); // Acquisition Number - что это ?
      if aid = '' then
        aid := '1';
      InstanceUID := ADataset.Attributes.GetString($8, $18); // SOP Instanse UID
      // делаем запись в БД FireBird
      // KIN $2809, $001D - временный тег
      v_Selected2 := ADataset.Attributes.getInteger($2809, $001D) ;
      StudyDate := AppendImage( AClientThread,
                               ADataset.Attributes,
                               StudyID,
                               PName,
                               pDateBorn,
                               PSex,
                               PatientID,
                               StudyDate,
                               StudyUID,
                               SeriesUID,
                               InstanceUID,
                               ImageType,
                               AID,
                               ImageType1,
                               StudyDescription,
                               PhysName,
                               AccessionNumber,
                               v_Selected2 );
      DecodeDate(StudyDate, y, m, d);
      sDir:=frmMain.sIMGpath;
      SetDir(sDir);
      SetDir(ImageType1);
      SetDir(IntToStr(y));
      SetDir(IntToStr(m));
      SetDir(IntToStr(d));
      SetDir(StudyuID);
      SetDir(SeriesUID);
      ImageFileName := InstanceUID + '.dcm';
      if CurDir[Length(CurDir)] <> '\' then
        CurDir := CurDir + '\';
      CurDir := CurDir + ImageFileName;

      //сохраняем DICOM-файл на жесткий диск
      ADataset.SaveToFile(CurDir, // FileName
                          True,
                          ADataset.Attributes.ImageData.ImageData[0].TransferSyntax, //JPEGLossless, //ADataset.Attributes.ImageData.ImageData[0].TransferSyntax,
                          100);  //Quality
      // сообщим клиенту что все ОК
      AClientThread.Association.SendStatus(0);
      // запись в лог
      v_SessionID := AClientThread.SessionID;
      AClientThread.OnTerminate := MyOnTerminate; // определяем разрыв соединения
      chk_studyUID_img_sav_lst ( ADataset.Attributes.GetString($0008, $1195),
                                 StudyUID,
                                 AClientThread.Association.Request.CallingTitle ,
                                 'Обработка события сервера DicomImage'+#13+
                                 'Transactionuid='+ADataset.Attributes.GetString($0008, $1195)+#13+
                                 'CallingTitle='+AClientThread.Association.Request.CallingTitle,
                                 v_SessionID
                                );
      // запись в лог
      v_SessionID := AClientThread.SessionID;
      AClientThread.OnTerminate := MyOnTerminate; // определяем разрыв соединения
      chk_studyUID_img_sav_lst ( ADataset.Attributes.GetString($0008, $1195),
                                 StudyUID,
                                 AClientThread.Association.Request.CallingTitle ,
                                 'Обработка события сервера DicomImage'+#13+
                                 'Transactionuid='+ADataset.Attributes.GetString($0008, $1195)+#13+
                                 'CallingTitle='+AClientThread.Association.Request.CallingTitle,
                                 v_SessionID
                                );
      ADataset.Attributes.Clear;
      ADataset.Free;
    end;
  end;
end;

procedure TfrmMain.DicomServerCore1NormalisedReceived(
  AClientThread: TDicomClientThread; AAddress: string;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
var rq, das3, das4: TDicomAttributes; i:Integer;
    v_succAttr, v_failAttr  : TDicomAttribute;
    v_TransactionId : string;
begin // получение N_EVENT_REPORT - ответ по запросу STORAGE_COMMITMENT
  if frmMain.f_chk_serv_parms then
  begin
    // 27.07.2012 FOMIN
    rq := TDicomAttributes(ARequestDatasets[0]);
    v_succAttr := rq.Item[$0008, $1199]; // list of succeded instances - not used
    v_failAttr := rq.Item[$0008, $1198]; // list of failed instances - checked
    v_TransactionId := rq.GetString($0008, $1195);
    // список снимков с ошибками
    if Assigned(v_failAttr)
    then begin
      for i := 0 to v_failAttr.GetCount - 1
      do begin
        das3 := v_failAttr.Attributes[i];
        SC_PACS_save ( False,
                       das3.GetString($0008, $1150), // SOPClassUID
                       das3.GetString($0008, $1155), // SOPInstanceUID
                       v_TransactionId
                       );
      end;
    end;
    if Assigned(v_succAttr)
    then begin
        for i := 0 to v_succAttr.GetCount - 1
        do begin
          das4 := v_succAttr.Attributes[i];
          SC_PACS_save ( True,
                         das4.GetString($0008, $1150), // SOPClassUID
                         das4.GetString($0008, $1155), // SOPInstanceUID
                         v_TransactionId
                         );
        end;
    end;
  end;
end;

procedure TfrmMain.DoRestoreParams;
begin
//  sCDDir := '';
  //
end;

procedure TfrmMain.DoShowForm; // см. также chb1PropertiesEditValueChanged
var v_LAST_USER : string;
begin
  if v_isOracle then     // ORACLE
  begin
    DB_CMN.OraConn := DB_CMN.OraConnCrt(False) ;
  end else if v_isPostgres then  // Postgres
  begin
    PGconn := PgConnCrt(False);
    MnUniTransaction := PGTransCreate(PGconn);
  end else                       // FireBird
  begin
    DB_CMN.DB := TpFIBDatabase.Create(nil);
    DB_CMN.DB.SQLDialect := 3;
    DB_CMN.DB.Connected := False;
    DB_CMN.trRead  := f_FbReadTransactCreateNS (DB_CMN.DB) ;
    DB_CMN.trWrite := f_FbWriteTransactCreateNS (DB_CMN.DB) ;
  end;
//-->> запускаем форму авторизации
  Application.CreateForm(TfrmLogin, frmLogin);
  try
//-->> поднимаем из реестра последнего юзера
    param_session_read(v_LAST_USER);
    frmLogin.teLogin.Text := v_LAST_USER;
//<<--
    frmLogin.ShowModal;
    if frmLogin.ModalResult = mrOk then
    begin
      frmMain.Caption := 'Менеджер исследований '+GetModuleVersion+'. Пользователь: '+sUser;
//-->> включаем транзакции на чтение (trWrite) и редактирование (trRead)
      if ((not v_isPostgres) and (not v_isOracle)) then
        cmn_trans_start;
//<<--
//      deDate.Date := Trunc(Now); //!!! 1. sysdate ? ; 2. defaul текущая дата
      CheckEnabledButtons;
      deBegin.Properties.OnEditValueChanged := nil;
      deEnd.Properties.OnEditValueChanged := nil;
      deBegin.Date := Trunc(Now); // устанавливаем default текущие даты
      deEnd.Date := Trunc(Now);
      deBegin.Properties.OnEditValueChanged := deBeginPropertiesEditValueChanged;
      deEnd.Properties.OnEditValueChanged := deEndPropertiesEditValueChanged;
      rest_all_grd_fr_reg;
      param_read ( frmMain.sPort,
                   frmMain.sIP,
                   frmMain.sCalledAETitle,
                   frmMain.sCallingAETitle,
                   frmMain.sLocalPort,
                   frmMain.sCDDir,
                   frmMain.sDBpath,
                   frmMain.sIMGpath
                 );
      p_try_pacs_start;
    end else
      Application.Terminate;
  finally
    frmLogin.Free; // уничтожаем форму
  end;
  DoRestoreParams;
end;

procedure TfrmMain.dsListAfterOpen(DataSet: TDataSet);
begin
  if pcmain.ActivePageIndex = 0 then
    begin
      sList.DataSet.Filter := '';
      sList.DataSet.Filter := 'STATUS = 0';
      sList.DataSet.Filtered := True;
    end;

  if pcmain.ActivePageIndex = 1 then
    begin
      sList.DataSet.Filter := '';
      sList.DataSet.Filter := 'STATUS = 1';
      sList.DataSet.Filtered := True;
    end;
end;

procedure TfrmMain.dsListPeriodAfterOpen(DataSet: TDataSet);
begin
  CheckEnabledButtons;
    if pcmain.ActivePageIndex = 0 then
    begin
      sList.DataSet.Filter := '';
      sList.DataSet.Filter := 'STATUS = 0';
      sList.DataSet.Filtered := True;
    end;

  if pcmain.ActivePageIndex = 1 then
    begin
      sList.DataSet.Filter := '';
      sList.DataSet.Filter := 'STATUS = 1';
      sList.DataSet.Filtered := True;
    end;
end;

procedure TfrmMain.RefrImages;
begin
  if v_isOracle then begin
  end else if v_isPostgres then
  begin
    if (vLstImages and (not UniListPeriod.Eof)) then
    begin
      UniListImages.DisableControls;
      dsListImages.DataSet := UniListImages;
      try
        UniListImages.Close;
        UniListImages.Connection:=DB_CMN.PGconn;
        UniListImages.Transaction:=DB_CMN.MnUniTransaction;
        UniListImages.SQL.Text:='select seriesuid, instanceuid, imgno, imagesize '+
                      'from images i where i.studyuid=:p_studyuid '+
                      ' order by seriesuid,imgno,instanceuid';
        UniListImages.ParamByName('p_studyuid').AsString := UniListPeriod.FieldByName('STUDYUID').AsString;
        UniListImages.Open;
      finally
        UniListImages.EnableControls;
      end;
    end
    else
      UniListImages.Close;

  end else begin
    if (vLstImages and (not dsListPeriod.Eof)) then
    begin
      dListImages.DisableControls;
      dsListImages.DataSet := dListImages;
      try
        dListImages.Close;
        dListImages.Database := DB_CMN.DB;
        dListImages.Transaction := DB_CMN.trRead;
        dListImages.SQLs.SelectSQL.Clear;
        dListImages.SQLs.SelectSQL.Text:='select SERIESUID, INSTANCEUID, IMGNO, IMAGESIZE '+
                      'from images i where i.studyuid=:p_studyuid '+
                      ' order by SERIESUID,IMGNO,INSTANCEUID';
        dListImages.ParamByName('p_studyuid').AsString := dsListPeriod.FieldByName('STUDYUID').AsString;
        dListImages.Open;
      finally
        dListImages.EnableControls;
      end;
    end
    else
      dListImages.Close;
  end;
end;

procedure TfrmMain.dListImagesAfterScroll(DataSet: TDataSet);
begin
  RefrImages;
end;

procedure TfrmMain.dsListPeriodAfterScroll(DataSet: TDataSet);
begin
  RefrImages;
end;

procedure TfrmMain.bbImportPDFClick(Sender: TObject);
var vRecordIndex : integer; vSTUDYUID : string;
begin // Импорт PDF
  if pcMain.ActivePageIndex=0 then
  begin  // архив
    Application.CreateForm(TfrmImportPDF, frmImportPDF);
    try
      frmImportPDF.ShowModal;
    finally
      frmImportPDF.Free;
    end;
  end else
    MessageDlg('Режим недоступен ...', mtWarning, [mbOK], 0);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
end;                                           

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  sav_all_grd_to_reg;
end;

function read_db_ip:string;
var v_ini : TIniFile;
    v_res : string;
begin
  // чтение ini-файла
  v_ini:=TIniFile.Create(v_exe_path+c_ini_file);
  try
    v_res := v_ini.ReadString( c_1_razdel, c_1_1_IP_FB, 'localhost' );
    v_ini.WriteString( c_1_razdel, c_1_1_IP_FB, v_res);
  finally
    FreeAndNil(v_ini);
  end;
  Result := v_res;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var Ini : TIniFile;
begin
  vLstImages:=False; // скрыть список исследований
  pListImages;
  // зачитаем настройки подключения к БД
  Ini := TIniFile.Create(ExtractFilePath(paramstr(0))+fMain.c_ini_file);
  try   // чтение параметров соединения с БД
    cmn_db_params_read(Ini);
  finally
    Ini.Free;
  end;
  N9.Visible := False;
  // коннект к БД
 // frmMain.db_conn_cmn;

  with TIniFile.Create(v_exe_path+c_ini_file) do
  try
    vIsLog  := (ReadString('LOG', 'is_log', '0')='1');
    vLogFile :=  ReadString('LOG', 'logfile', '');
    if vIsLog then
      WriteString('LOG', 'is_log','1')
    else
      WriteString('LOG', 'is_log','0');
    WriteString('LOG', 'logfile', vLogFile);
  finally
    Free;
  end;

  v_DicomServerStart:=False;
  MWLReceiveDatasets := TList.Create;
  // вставить для создания временных файлов в заданном каталоге FOMIN
  DCM_Connection.PDUTempPath:=GetTempDirectory;
  ini_rd( sCallingAETitle, sCDDir );
  Russian:=LoadKeyboardLayout('00000419', 0);
  pcMain.ActivePageIndex := 0;
  pcLeft.Visible := False;
  pcLeft.HideTabs := True;
  Self.WindowState := wsMaximized;
  // установим текущий внешний пакс-сервер по-умолчанию
 // frmMain.tvServ.DataController.Values[frmMain.tvServ.DataController.FocusedRecordIndex, frmMain.TvPRPACS.Index];

//  ColIdx :=
//  tvServ.Columns[3].Name:='TvPRPACS'; // .GetItemByFieldName('P_ENAME').Index;
//  v_P_ENAME := v_cxGridDBTableView.DataController.Values[RecIdx, ColIdx];

  cbType.Properties.Items.Clear;
  ctrFullModList(TStringList(cbType.Properties.Items));

  v_is_moveDCM:=False;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
var i : integer;
begin
  if v_isOracle then     // ORACLE
  begin
    OraFree(OraConn);
  end else if v_isPostgres then
  begin
    PgFree ( PGconn, MnUniTransaction );
  end else
  begin
    p_free_conn_fb ( DB_CMN.DB ,
                     DB_CMN.trWrite ,
                     DB_CMN.trRead
                    );
  end;
  DicomServerCore1.Stop;
  for i := 0 to MWLReceiveDatasets.Count - 1 do
    TDicomAttributes(MWLReceiveDatasets[i]).Free;
  MWLReceiveDatasets.Free;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var nDates : Integer; vIdStr:string; vTreeNode1:TTreeNode;
begin
//-->> оставили этот кусок кода здесь, потому что при включенном флаге "Не учитывать даты" на криейт формы вылетает ошибка
  param_forms_read(nDates);
//  case nDates of
//  1: chb1.EditValue := 1;
//  0: chb1.EditValue := 0;
//  end;
//<<--
  if pcmain.ActivePageIndex = 0 then
    begin
      sList.DataSet.Filter := 'STATUS = 0';
      sList.DataSet.Filtered := True;
    end;

  if pcmain.ActivePageIndex = 1 then
    begin
      sList.DataSet.Filter := 'STATUS = 1';
      sList.DataSet.Filtered := True;
    end;
  vTreeNode1:=dxTreeViewEdit1.Items.Add( nil, '<не задано>' );
  vTreeNode1.Data := Pointer( -1 );
  frmDiagTree ( dxTreeViewEdit1, nil, -1, 0 ) ;
  vTreeNode1:=dxTreeViewEdit2.Items.Add( nil, '<не задано>' );
  vTreeNode1.Data := Pointer( -1 );
  frmDiagTree ( dxTreeViewEdit2, nil, -1, 1 ) ;
end;

procedure TfrmMain.frxRep1GetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'DATESYS' then Value := Now;
  if VarName = 'DATE1' then Value := Date;
  if VarName = 'VSEGO' then
  begin
    if pcmain.ActivePageIndex = 0 then
    begin
      Value := sList.DataSet.RecordCount;
    end else
    if pcmain.ActivePageIndex = 1 then
    begin
      Value := locList.DataSet.RecordCount;
    end else
    if pcmain.ActivePageIndex = 2 then
    begin
      Value := DSRemote.DataSet.RecordCount;
    end else
    if pcmain.ActivePageIndex = 3 then
    begin
      Value := dsFolderList.DataSet.RecordCount;
    end;

  end;
end;

procedure TfrmMain.pcMainChange(Sender: TObject);
var v_ae_remote : string ;
begin
  if pcmain.ActivePageIndex = 0 then
    begin
      sList.DataSet.Filter := '';
      sList.DataSet.Filter := 'STATUS = 0'; // !!! возможно это не нужно
      sList.DataSet.Filtered := True;
//      CheckEnabledButtons;
    end;

  if pcmain.ActivePageIndex = 1 then       // Локальная база
    begin
      sList.DataSet.Filter := '';
      sList.DataSet.Filter := 'STATUS = 1'; // !!! возможно это не нужно
      sList.DataSet.Filtered := True;
    end;

  if pcMain.ActivePageIndex = 2 then // Удаленная база
    begin
      if v_isOracle then
        PrmSetOraServ
      else if v_isPostgres then
        PrmSetUniServ
      else
        dsServ.Active := True;
      // прочитаем AE пакса для работы с закладкой удаленная база
      gt_pacs_ae_remote ( v_ae_remote );
      set_cur_rem_paks(v_ae_remote);
    end;
  CheckEnabledButtons;
  pcLeft.Visible := pcMain.ActivePageIndex = 2;
end;

procedure TfrmMain.teFIOClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmMain.teFIOEnter(Sender: TObject);
begin
  if pcMain.ActivePageIndex<>2 then
    ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmMain.teFIOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    begin
      aRefreshExecute(nil);
    end;
end;

procedure TfrmMain.teMKClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmMain.teMKEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmMain.teMKKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
    begin
      aRefreshExecute(nil);
    end;
end;

procedure TfrmMain.teNumKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    begin
      aRefreshExecute(nil);
    end;
end;

procedure TfrmMain.TVListAFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
//  CheckEnabledButtons;
end;

procedure TfrmMain.TVListFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
//  CheckEnabledButtons;
end;

procedure TfrmMain.tvServCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aSetServExecute(nil);
end;

procedure TfrmMain.tvServCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var MyRect : TRect;MyDrawText : String;
begin
  MyDrawText := AViewInfo.GridRecord.DisplayTexts[AViewInfo.Item.Index];
  MyRect := AViewInfo.Bounds;
  if VarToStr(AViewInfo.GridRecord.Values[frmMain.TvPRPACS.Index]) <> ''  then
    if AViewInfo.GridRecord.Values[frmMain.TvPRPACS.Index] then
      begin
        ACanvas.Canvas.Font.Color := clWhite;
        ACanvas.Canvas.Brush.Style := bsSolid;
        ACanvas.Canvas.Brush.Color := clNavy;
      end;
  ACanvas.Canvas.FillRect( MyRect );
end;

procedure FilesListClr;
begin
  frmMain.MDFolderList.Close;
  frmMain.MDFolderList.Open;
  frmMain.MDFolderFullList.Close;
  frmMain.MDFolderFullList.Open;
end;

procedure FilesListRecFrm ( p_filename : ansistring );
var v_CnsDMTable_tmp: TCnsDMTable;
    das1: TDicomDataset;
    v_fnd : Boolean;
    v_ENAME_RUS,
    v_ENAME,
    v_VDESC,
    v_codepage : string;
begin
  if True then // f_DICOM_file_chk(p_filename) then // проверка что файл DICOM
  begin
    v_CnsDMTable_tmp := TCnsDMTable.Create(nil);
    try
      try
        v_CnsDMTable_tmp.LoadFromFile(p_filename);
        das1:=v_CnsDMTable_tmp[0];
        // ---------------------------------------------------------------------
        // добавим с общий список
        // проверка что в снимке что-то есть - непустая запись
       // if das1.Attributes.GetString(dModality)<>'PR' then
        if ((Trim(das1.Attributes.GetString(dPatientName))<>'') or
            (Trim(das1.Attributes.GetString(dStudyInstanceUID))<>'') or
            (Trim(das1.Attributes.GetString(dAccessionNumber))<>'') or
            (Trim(das1.Attributes.GetString(dModality))<>'') or
            (Trim(das1.Attributes.GetString(dPatientID))<>''))
        then
        begin
          with frmMain.MDFolderFullList do
          begin
            Append;
            v_codepage:=das1.Attributes.GetString($08, $05);
            Flds_to_charset (     das1.Attributes,
                                  v_ENAME_RUS,
                                  v_ENAME,
                                  v_VDESC
                            );
            FieldByName('P_ENAME_RUS').AsString := v_ENAME_RUS;
            FieldByName('P_ENAME').AsString     := v_ENAME;
            FieldByName('VDESC').AsString       := v_VDESC;
            FieldByName('P_DATEBORN').AsString := das1.Attributes.GetString(dPatientBirthDate);
            FieldByName('P_SEX').AsString := gt_sex(das1.Attributes.GetString(dPatientSex));
            FieldByName('LDATE').AsString := das1.Attributes.GetString(dStudyDate);
            FieldByName('P_PID').AsString := das1.Attributes.GetString(dPatientID);
            FieldByName('STUDYUID').AsString := das1.Attributes.GetString(dStudyInstanceUID);
            FieldByName('STUDYID').AsString := das1.Attributes.GetString(dStudyID);
            FieldByName('CNT').AsInteger := 1;
            FieldByName('STUDIES_IMAGE_TYPE').AsString := das1.Attributes.GetString(dModality);
            FieldByName('ACCESSIONNUMBER').AsString := das1.Attributes.GetString(dAccessionNumber);
            FieldByName('FILENAME').AsString := p_filename;
          //  TBlobField(FieldByName('ffile')).LoadFromFile(p_filename);
            Post;
          end;
          // ---------------------------------------------------------------------
          v_fnd:=False;
          with frmMain.MDFolderList do
          begin
            First;
            while not Eof do
            begin
//              if (frmMain.MDFolderFullList.FieldByName('STUDYUID').AsString=FieldByName('STUDYUID').AsString)
              if ((frmMain.MDFolderFullList.FieldByName('STUDYUID').AsString=FieldByName('STUDYUID').AsString) and
                  (frmMain.MDFolderFullList.FieldByName('STUDIES_IMAGE_TYPE').AsString=FieldByName('STUDIES_IMAGE_TYPE').AsString))
              then begin
                v_fnd:=True;
                Break;
              end;
              Next;
            end;
          end;
          if v_fnd then
          begin
            with frmMain.MDFolderList do
            begin
              Edit;
              FieldByName('CNT').AsInteger := FieldByName('CNT').AsInteger + 1 ;
              Post;
            end;
          end else
          begin
            with frmMain.MDFolderList do
            begin
              Append;
              Flds_to_charset (     das1.Attributes,
                                    v_ENAME_RUS,
                                    v_ENAME,
                                    v_VDESC
                              );
              if das1.Attributes.ImageData<>nil then
                FieldByName('TransferSyntax').AsInteger := das1.Attributes.ImageData.ImageData[0].TransferSyntax;
              FieldByName('P_ENAME_RUS').AsString := v_ENAME_RUS;
              FieldByName('P_ENAME').AsString     := v_ENAME;
              FieldByName('VDESC').AsString       := v_VDESC;
              if Trim(das1.Attributes.GetString(dPatientBirthDate))<>'' then
                try
                  FieldByName('P_DATEBORN').AsDateTime := StrToDate(das1.Attributes.GetString(dPatientBirthDate));
                except
                end;
              FieldByName('P_SEX').AsString := das1.Attributes.GetString(dPatientSex);
              FieldByName('LDATE').AsString := das1.Attributes.GetString(dStudyDate);
              FieldByName('P_PID').AsString := das1.Attributes.GetString(dPatientID);
              FieldByName('STUDYUID').AsString := das1.Attributes.GetString(dStudyInstanceUID);
              FieldByName('STUDYID').AsString := das1.Attributes.GetString(dStudyID);
              FieldByName('CNT').AsInteger := 1;
              FieldByName('STUDIES_IMAGE_TYPE').AsString := das1.Attributes.GetString(dModality);
              FieldByName('ACCESSIONNUMBER').AsString := das1.Attributes.GetString(dAccessionNumber);
            //  FieldByName('FILENAME').AsString := p_filename;
              Post;
            end;
          end;
      //  end else begin
      //    v_CnsDMTable_tmp.Clear;
        end;
      except
        MessageDlg('Ошибка загрузки файла'+#13+p_filename, mtError, [mbOK], 0);
      end;
    finally
      v_CnsDMTable_tmp.Clear;
      v_CnsDMTable_tmp.ClearList;
      FreeAndNil(v_CnsDMTable_tmp);
    end;
  end;
end;

procedure TfrmMain.actLoadDiskExecute(Sender: TObject);
var vFlist : TStringList;
    i:Integer;
    das: TDicomDataset;
    da1{, da2} : TDicomAttribute;
    vDirectoryRecordType,
    vReferencedFileID{,
    vDirectoryRecordSequence} : string;
begin // загрузка Из DICOM диска
  vFlist := TStringList.Create;
  try
    With TFileOpenDialog.Create(nil) do
    try
      Options := [fdoPickFolders];
      if Execute then
      begin
        if FileExists(Files.Strings[0]+'\DICOMDIR') then
        begin
          try
            das := TDicomDataset.Create;
            das.LoadFromFile(Files.Strings[0]+'\DICOMDIR');
            da1 := das.Attributes.Item[ $4,$1220 ]; // DirectoryRecordSequence
            if assigned(da1) then
            for I := 0 to da1.GetCount - 1 do
            begin
              vDirectoryRecordType := da1.Attributes[i].GetString( $4,$1430 ); // DirectoryRecordType
              if ((vDirectoryRecordType='IMAGE') or (vDirectoryRecordType='SR DOCUMENT')) then
              begin
                vReferencedFileID := da1.Attributes[i].GetString( $4,$1500 ); // ReferencedFileID
                if FileExists(Files.Strings[0]+'\'+vReferencedFileID) then
                  vFlist.Append(Files.Strings[0]+'\'+vReferencedFileID);
              end; // else
              //  MessageDlg('Найдено '+vDirectoryRecordType, mtWarning, [mbOK], 0);
            end;
          finally
            das.Free;
          end;

          if vFlist.Count>0 then
          begin
            if (MessageDlg('Найдено '+inttostr(vFlist.Count)+' файлов.'+#13+
                           'Загрузить ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
            then
            begin
              Application.CreateForm(TFrmProgressBar, FrmProgressBar);
              try
                  Screen.Cursor := crHourGlass;
                  FilesListClr;
                  try
                    dsFolderList.DataSet:=nil;
                    CmnUnit.v_exit_progressbar:=0;
                    // инициализируем ползунок - чтобы что-то показать
                    FrmProgressBar.clc_pos( False, // is_on_top
                                'Открытие файла DICOM',
                                vFlist.Count, // кол-во
                                True   // один ползунок
                              );
                    FrmProgressBar.clc_posMain( vFlist.Count, // 0-не отображать ползунок
                                  'Открытие файла DICOM',
                                   True
                                );
                    // инициализация переменных для ползунка
                    MyIniMove;
                    for i := 0 to vFlist.Count - 1 do
                    begin
                      FrmProgressBar.MyIncPos('Открытие файлов ' +
                                 ' DICOM '+inttostr(i)+'/'+inttostr(vFlist.Count));
                      if CmnUnit.v_exit_progressbar=1 then Break;
                      FilesListRecFrm(vFlist.Strings[i]);
                    end;
                  finally
                    Screen.Cursor := crDefault;
                    MDFolderList.First;
                    if not MDFolderList.Active then MDFolderList.Open;
                    dsFolderList.DataSet:=MDFolderList;
                    pcMain.ActivePageIndex:=3;
                  end; 
              finally
                chk_close;
                FreeAndNil(FrmProgressBar);
                CheckEnabledButtons;
              end;
            end;
          end
          else
            MessageDlg('Данные не найдены', mtInformation, [mbOK], 0);
        end;
      end;
    finally
      Free;
    end;
  finally
    vFlist.Free;
  end;

end;

procedure TfrmMain.actLoadFileExecute(Sender: TObject);
var i : Integer;
    v_filename : AnsiString;
begin // загрузить из файла
  Application.CreateForm(TFrmProgressBar, FrmProgressBar);
  try
    OpenDialog3.Files.Clear;
    if OpenDialog3.Execute then
    begin
      Screen.Cursor := crHourGlass;
      FilesListClr;
      try
        dsFolderList.DataSet:=nil;
        CmnUnit.v_exit_progressbar:=0;
        // инициализируем ползунок - чтобы что-то показать
        FrmProgressBar.clc_pos( False, // is_on_top
                    'Открытие файла DICOM',
                    OpenDialog3.Files.Count, // кол-во
                    True   // один ползунок
                  );
        FrmProgressBar.clc_posMain( OpenDialog3.Files.Count, // 0-не отображать ползунок
                      'Открытие файла DICOM',
                       True
                    );
        // инициализация переменных для ползунка
        MyIniMove;
        for i := 0 to OpenDialog3.Files.Count - 1 do
        begin
          FrmProgressBar.MyIncPos('Открытие файлов ' +
                     ' DICOM '+inttostr(i)+'/'+inttostr(OpenDialog3.Files.Count));
          if CmnUnit.v_exit_progressbar=1 then Break;
          v_filename:=OpenDialog3.Files[i];
          FilesListRecFrm(v_filename);
        end;
      finally
        Screen.Cursor := crDefault;
        MDFolderList.First;
        if not MDFolderList.Active then MDFolderList.Open;
        dsFolderList.DataSet:=MDFolderList;
        pcMain.ActivePageIndex:=3;
      end;
    end;
  finally
    chk_close;
    FreeAndNil(FrmProgressBar);
    CheckEnabledButtons;
  end;
end;

procedure TfrmMain.actExcelFolderExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVFolderList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGrid1, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGrid1, TRUE, TRUE);
end;

procedure TfrmMain.actKeyListShowExecute(Sender: TObject);
begin // показать ключевые снимки
  shimok_show(True);
end;

procedure TfrmMain.ActLoadFolderExecute(Sender: TObject);
var //v_f:TOpenDialog; // TFileOpenDialog;
    v_strings, v_s2 : TStringList;
    i : Integer;
begin   // загрузить из папки
//  frmMain.dsFolderList.DataSet:=nil;
  //v_f:=TOpenDialog.Create(nil);  // >=Vista     TFileOpenDialog
  v_strings := TStringList.Create;
  v_s2 := TStringList.Create;
  gt_files_dicom_fr_folder(v_s2);
  Application.CreateForm(TFrmProgressBar, FrmProgressBar);
  try
    Screen.Cursor := crHourGlass;
    if ( v_s2.Count>0 ) then begin
      FilesListClr;
      // процесс не был прерван пользователем
      if CmnUnit.v_exit_progressbar<>1 then begin
        // инициализируем ползунок - чтобы что-то показать
        FrmProgressBar.clc_pos( False, // is_on_top
                    'Открытие файла DICOM',
                    v_s2.Count, // кол-во
                    True   // один ползунок
                  );
        FrmProgressBar.clc_posMain( v_s2.Count, // 0-не отображать ползунок
                      'Открытие файла DICOM',
                       True
                    );
        // инициализация переменных для ползунка
        MyIniMove;
        for I := 0 to v_s2.Count - 1 do
        begin
          FrmProgressBar.MyIncPos('Открытие файлов ' +
                     ' DICOM '+inttostr(i)+'/'+inttostr(v_s2.Count));
          if CmnUnit.v_exit_progressbar=1 then Break;
          FilesListRecFrm(v_s2[i]);
        end;
      end;
    end;
  finally
  //  Freeandnil(v_f);
    Freeandnil(v_strings);
    Freeandnil(v_s2);
    if not MDFolderList.Active then MDFolderList.Open;    
    MDFolderList.First;
//    frmMain.dsFolderList.DataSet:=frmMain.MDFolderList;
    Screen.Cursor := crDefault;
    pcMain.ActivePageIndex:=3;
    chk_close;
    FreeAndNil(FrmProgressBar);
    CheckEnabledButtons;
  end;
end;

// оставлено для тестирования утечек памяти
// initialization
//   ReportMemoryLeaksOnShutdown := True;
end.

