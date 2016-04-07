// !!! функция get_napravlen в главном датасете работает не правильно (лишний запрос выполняется все время)
// !!! все images перенести в один imagelist и поместить его на главную форму
unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Oracle, ImgList, ActnList, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  OracleData, dxBar, ComCtrls, ToolWin, cxSplitter, ShellApi,
  cxPC, cxGridExportLink, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, jvDbUtils, frxClass, frxDBSet, 
  StdCtrls, Registry, Jpeg, word2000,
  cxTextEdit, cxContainer, cxCheckBox, cxProgressBar, Clipbrd,
  cxImageComboBox, dxPScxGrid6Lnk, cxMaskEdit, cxDropDownEdit,
  cxCalendar, dxSkinsDefaultPainters, dxSkinscxPCPainter, JclFileUtils, uGlobalConst,
  dxSkinsdxBarPainter, cxBarEditItem, dxBarExtItems, SMMainAPI, cxLabel,
  dxSkinsCore, IniFiles,
  {Medotrade,} cxLookAndFeels, dxSkinsForm, RVTable, RVEdit, fTableParam, RVItem,
  cxConstantsRus, dxBarCustomize_Rus, 
  uPrintType, frxExportHTML, RVStyle, uPrintDocument, frxExportRTF;

type
  TInitPlugin = procedure(nPacid: Integer; nNazid: Integer; nSotrid : Integer; nAppSotrid : Integer); stdcall;
  TFreePlugin = function(): LongInt; stdcall;

  TfrmMain = class(TForm)
    os: TOracleSession;
    ilMain: TImageList;
    alMain: TActionList;
    aClose: TAction;
    dsKab: TDataSource;
    odsKab: TOracleDataSet;
    aRefresh: TAction;
    aOpen: TAction;
    dsList: TDataSource;
    paKab: TPanel;
    cxGrKab: TcxGrid;
    TVKab: TcxGridDBTableView;
    VNAME: TcxGridDBColumn;
    cxGrKabLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    Panel1: TPanel;
    cxGr: TcxGrid;
    TVLIST: TcxGridDBTableView;
    TVLISTFIO: TcxGridDBColumn;
    TVLISTDATEROJD: TcxGridDBColumn;
    TVLISTAGE: TcxGridDBColumn;
    TVLISTDS: TcxGridDBColumn;
    TVLISTNAZ: TcxGridDBColumn;
    TVLISTPARAM: TcxGridDBColumn;
    cxGrLevel1: TcxGridLevel;
    pmTV: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    sdPopUp: TSaveDialog;
    al: TActionList;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    aPrint: TAction;
    N1: TMenuItem;
    aCancel: TAction;
    N2: TMenuItem;
    aInfo: TAction;
    TVSEX: TcxGridDBColumn;
    TVSTATE: TcxGridDBColumn;
    TVTIME_ISL: TcxGridDBColumn;
    aEditNaz: TAction;
    TVOTDEL: TcxGridDBColumn;
    TVFK_NAZTYPE: TcxGridDBColumn;
    TVDATENAZ: TcxGridDBColumn;
    aDelete: TAction;
    stRep: TcxStyleRepository;
    cxStyle1: TcxStyle;
    odsList: TOracleDataSet;
    odsListFK_ID: TFloatField;
    odsListFK_SMID: TFloatField;
    odsListFD_NAZ: TDateTimeField;
    odsListFK_PACID: TFloatField;
    odsListFK_NAZSOSID: TFloatField;
    odsListFK_ISPOLID: TFloatField;
    odsListVRACHFIO: TStringField;
    odsListFIOPAC: TStringField;
    odsListFD_ROJD: TDateTimeField;
    odsListAGE: TFloatField;
    odsListFC_NAME: TStringField;
    odsListFC_DIAG: TStringField;
    odsListPARAM: TStringField;
    odsListPEPLID: TFloatField;
    odsListSEX: TStringField;
    odsListSTATE: TStringField;
    odsListTIME_ISL: TStringField;
    odsListFK_ROOMID: TIntegerField;
    odsListOTDEL: TStringField;
    odsListFK_NAZTYPEID: TFloatField;
    odsListFK_VRACHID: TFloatField;
    aOtmetki: TAction;
    aArchive: TAction;
    aProtokol: TAction;
    odsListIS_AMBULANCE: TFloatField;
    opSMINI: TOraclePackage;
    pmPrint: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    frxDBPrintList: TfrxDBDataset;
    TVSOS: TcxGridDBColumn;
    aCopyFio: TAction;
    N5: TMenuItem;
    odsListFD_RUN: TStringField;
    odsListFK_DOCID: TFloatField;
    odsListVIDLECH: TStringField;
    aSearch: TAction;
    ilreanim: TImageList;
    TVREANIM: TcxGridDBColumn;
    odsListIS_REANIM: TFloatField;
    actDolg: TAction;
    VLABNAME: TcxGridDBColumn;
    odsListLABNAME: TStringField;
    odsListISSL_TARGET: TStringField;
    frxPrintList: TfrxReport;
    N6: TMenuItem;
    N7: TMenuItem;
    odsList_SortFIO: TOracleDataSet;
    actPrintSortFIO: TAction;
    N8: TMenuItem;
    odsList_SortDateNaz: TOracleDataSet;
    actPrintSortDateNaz: TAction;
    N9: TMenuItem;
    actPrintSortTimeVyp: TAction;
    odsList_SortTimeVyp: TOracleDataSet;
    odsPrintDez: TOracleDataSet;
    N10: TMenuItem;
    actPrintDez: TAction;
    actBase: TAction;
    VNUMBERPROTOCOL: TcxGridDBColumn;
    odsListNUMBERPROTOCOL: TStringField;
    frxRepKab: TfrxReport;
    frxDBKab: TfrxDBDataset;
    pmTVKAB: TPopupMenu;
    MenuItem2: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    aPrintKab: TAction;
    aTextKab: TAction;
    aWebKab: TAction;
    aXMLKab: TAction;
    aXLSKab: TAction;
    odsListFD_NAZ_STR: TStringField;
    aNorma1: TAction;
    aNorma2: TAction;
    odsListCNTTUB: TFloatField;
    VCNTTUB: TcxGridDBColumn;
    ilCntTub: TImageList;
    ilCntControl: TImageList;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    Panel2: TPanel;
    p1: TPanel;
    p2: TPanel;
    p3: TPanel;
    p4: TPanel;
    p5: TPanel;
    p6: TPanel;
    p7: TPanel;
    blWeeks: TButton;
    blMon: TButton;
    brWeeks: TButton;
    brMon: TButton;
    pMonth: TPanel;
    dxdeDate: TcxDateEdit;
    cxPrOtmena: TcxBarEditItem;
    aNevip: TAction;
    dxBarDockControl2: TdxBarDockControl;
    BMBar2: TdxBar;
    bbRefresh: TdxBarButton;
    bbInfo: TdxBarButton;
    bbSearch: TdxBarButton;
    bbOpen: TdxBarButton;
    bbArchive: TdxBarButton;
    bbBD: TdxBarButton;
    bbProtocol: TdxBarButton;
    bbOtmetki: TdxBarButton;
    bbDelete: TdxBarButton;
    bbOtmena: TdxBarButton;
    bbDolg: TdxBarButton;
    bbClose: TdxBarButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    N11: TMenuItem;
    aCorrect: TAction;
    aShow: TAction;
    aHide: TAction;
    odsListRESUME1: TStringField;
    odsListRESUME2: TStringField;
    VLIST_ZAKL1: TcxGridDBColumn;
    VLIST_ZAKL2: TcxGridDBColumn;
    odsListFK_RESULTID: TFloatField;
    tmrCheckApplication: TTimer;
    stBold: TcxStyle;
    bbPrintMore: TdxBarButton;
    bbLine: TdxBarButton;
    frxMore: TfrxReport;
    frxDBMore: TfrxDBDataset;
    odsListMore: TOracleDataSet;
    odsListispolfio: TStringField;
    odsListfc_type: TStringField;
    dxBarButton1: TdxBarButton;
    aEditTalon: TAction;
    N12: TMenuItem;
    N13: TMenuItem;
    bbDolgTalon: TdxBarButton;
    actDolgTalon: TAction;
    aSysInfo: TAction;
    odsLastFG: TOracleDataSet;
    odsCntOut: TOracleDataSet;
    odsListKardio: TOracleDataSet;
    FloatField36: TFloatField;
    FloatField37: TFloatField;
    DateTimeField10: TDateTimeField;
    FloatField38: TFloatField;
    FloatField39: TFloatField;
    FloatField40: TFloatField;
    StringField48: TStringField;
    StringField49: TStringField;
    DateTimeField11: TDateTimeField;
    FloatField41: TFloatField;
    StringField50: TStringField;
    StringField51: TStringField;
    StringField52: TStringField;
    FloatField42: TFloatField;
    StringField53: TStringField;
    StringField54: TStringField;
    StringField55: TStringField;
    IntegerField4: TIntegerField;
    StringField56: TStringField;
    FloatField43: TFloatField;
    FloatField44: TFloatField;
    FloatField45: TFloatField;
    StringField57: TStringField;
    FloatField46: TFloatField;
    StringField58: TStringField;
    FloatField47: TFloatField;
    StringField59: TStringField;
    StringField60: TStringField;
    StringField61: TStringField;
    StringField62: TStringField;
    FloatField48: TFloatField;
    StringField63: TStringField;
    StringField64: TStringField;
    FloatField49: TFloatField;
    StringField65: TStringField;
    StringField66: TStringField;
    odsListFC_TALON_COMMENT: TStringField;
    odsListKardioFC_TALON_COMMENT: TStringField;
    VTalonComment: TcxGridDBColumn;
    VLISTSOSTALON: TcxGridDBColumn;
    odsListSTATUS_TALON: TStringField;
    odsListKardioSOS_TALON: TStringField;
    bbEditNaz: TdxBarLargeButton;
    bbNevip: TdxBarLargeButton;
    bbNorma1: TdxBarLargeButton;
    bbNorma2: TdxBarLargeButton;
    odsPrintDezFK_ID: TFloatField;
    odsPrintDezFK_NAZSOSID: TFloatField;
    odsPrintDezFD_NAZ_STR: TStringField;
    odsPrintDezFD_RUN: TDateTimeField;
    odsPrintDezTIME_ISL: TStringField;
    odsPrintDezFIOPAC: TStringField;
    odsPrintDezSEX: TStringField;
    odsPrintDezFD_ROJD: TDateTimeField;
    odsPrintDezOTDEL: TStringField;
    odsPrintDezFC_NAME: TStringField;
    odsPrintDezFC_DIAG: TStringField;
    odsPrintDezSTATE: TStringField;
    odsPrintDezISSL_TARGET: TStringField;
    odsList_SortTimeVypFK_ID: TFloatField;
    odsList_SortTimeVypFK_NAZSOSID: TFloatField;
    odsList_SortTimeVypFD_NAZ_STR: TStringField;
    odsList_SortTimeVypFD_RUN: TDateTimeField;
    odsList_SortTimeVypTIME_ISL: TStringField;
    odsList_SortTimeVypFIOPAC: TStringField;
    odsList_SortTimeVypSEX: TStringField;
    odsList_SortTimeVypFD_ROJD: TDateTimeField;
    odsList_SortTimeVypOTDEL: TStringField;
    odsList_SortTimeVypFC_NAME: TStringField;
    odsList_SortTimeVypFC_DIAG: TStringField;
    odsList_SortTimeVypSTATE: TStringField;
    odsList_SortTimeVypISSL_TARGET: TStringField;
    odsList_SortDateNazFK_ID: TFloatField;
    odsList_SortDateNazFK_NAZSOSID: TFloatField;
    odsList_SortDateNazFD_NAZ_STR: TStringField;
    odsList_SortDateNazFD_RUN: TDateTimeField;
    odsList_SortDateNazTIME_ISL: TStringField;
    odsList_SortDateNazFIOPAC: TStringField;
    odsList_SortDateNazSEX: TStringField;
    odsList_SortDateNazFD_ROJD: TDateTimeField;
    odsList_SortDateNazOTDEL: TStringField;
    odsList_SortDateNazFC_NAME: TStringField;
    odsList_SortDateNazFC_DIAG: TStringField;
    odsList_SortDateNazSTATE: TStringField;
    odsList_SortDateNazISSL_TARGET: TStringField;
    odsList_SortFIOFK_ID: TFloatField;
    odsList_SortFIOFK_NAZSOSID: TFloatField;
    odsList_SortFIOFD_NAZ_STR: TStringField;
    odsList_SortFIOFD_RUN: TDateTimeField;
    odsList_SortFIOTIME_ISL: TStringField;
    odsList_SortFIOFIOPAC: TStringField;
    odsList_SortFIOSEX: TStringField;
    odsList_SortFIOFD_ROJD: TDateTimeField;
    odsList_SortFIOOTDEL: TStringField;
    odsList_SortFIOFC_NAME: TStringField;
    odsList_SortFIOFC_DIAG: TStringField;
    odsList_SortFIOSTATE: TStringField;
    odsList_SortFIOISSL_TARGET: TStringField;
    dxSkinController1: TdxSkinController;
    cxLookAndFeelController1: TcxLookAndFeelController;
    odsListFC_accessionnumber: TStringField;
    odsListKardioFC_accessionnumber: TStringField;
    vFC_accessionnumber: TcxGridDBColumn;
    odsListKardioFC_AN: TStringField;
    odsListCito: TOracleDataSet;
    odsListUnCito: TOracleDataSet;
    fc_vid_oplaty: TcxGridDBColumn;
    odsListfc_vid_oplaty: TStringField;
    Vfc_an: TcxGridDBColumn;
    VFK_NAZSOSID: TcxGridDBColumn;
    odsListKardioUnKabinet: TOracleDataSet;
    grdbtvID: TcxGridDBColumn;
    odsListKardioUnKabinetFK_ID: TFloatField;
    odsListKardioUnKabinetFK_SMID: TFloatField;
    odsListKardioUnKabinetFD_NAZ: TDateTimeField;
    odsListKardioUnKabinetFD_NAZ_STR: TStringField;
    odsListKardioUnKabinetFD_RUN: TStringField;
    odsListKardioUnKabinetFK_PACID: TFloatField;
    odsListKardioUnKabinetFC_TYPE: TStringField;
    odsListKardioUnKabinetFK_NAZSOSID: TFloatField;
    odsListKardioUnKabinetFK_ISPOLID: TFloatField;
    odsListKardioUnKabinetFK_VRACHID: TFloatField;
    odsListKardioUnKabinetFK_DOCID: TFloatField;
    odsListKardioUnKabinetFK_RESULTID: TFloatField;
    odsListKardioUnKabinetVRACHFIO: TStringField;
    odsListKardioUnKabinetISPOLFIO: TStringField;
    odsListKardioUnKabinetFIOPAC: TStringField;
    odsListKardioUnKabinetFD_ROJD: TDateTimeField;
    odsListKardioUnKabinetAGE: TFloatField;
    odsListKardioUnKabinetSEX: TStringField;
    odsListKardioUnKabinetFC_NAME: TStringField;
    odsListKardioUnKabinetFC_DIAG: TStringField;
    odsListKardioUnKabinetPARAM: TStringField;
    odsListKardioUnKabinetPEPLID: TFloatField;
    odsListKardioUnKabinetSTATE: TStringField;
    odsListKardioUnKabinetTIME_ISL: TStringField;
    odsListKardioUnKabinetFK_ROOMID: TIntegerField;
    odsListKardioUnKabinetOTDEL: TStringField;
    odsListKardioUnKabinetFK_NAZTYPEID: TFloatField;
    odsListKardioUnKabinetIS_AMBULANCE: TFloatField;
    odsListKardioUnKabinetVIDLECH: TStringField;
    odsListKardioUnKabinetIS_REANIM: TFloatField;
    odsListKardioUnKabinetLABNAME: TStringField;
    odsListKardioUnKabinetISSL_TARGET: TStringField;
    odsListKardioUnKabinetNUMBERPROTOCOL: TStringField;
    odsListKardioUnKabinetFC_ACCESSIONNUMBER: TStringField;
    odsListKardioUnKabinetFC_AN: TStringField;
    odsListKardioUnKabinetCNTTUB: TFloatField;
    odsListKardioUnKabinetRESUME1: TStringField;
    odsListKardioUnKabinetRESUME2: TStringField;
    odsListKardioUnKabinetFC_TALON_COMMENT: TStringField;
    odsListKardioUnKabinetSTATUS_TALON: TStringField;
    odsListKardioUnKabinetFC_VID_OPLATY: TStringField;
    grdbtvIs_Amb: TcxGridDBColumn;
    procedure aCloseExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aOpenExecute(Sender: TObject);
    procedure odsKabAfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure odsListAfterScroll(DataSet: TDataSet);
    procedure TVLISTCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure N2Click(Sender: TObject);
    procedure frx30GetValue(const VarName: String; var Value: Variant);
    procedure odsKabBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure blMonClick(Sender: TObject);
    procedure blWeeksClick(Sender: TObject);
    procedure p1Click(Sender: TObject);
    procedure p2Click(Sender: TObject);
    procedure p3Click(Sender: TObject);
    procedure p4Click(Sender: TObject);
    procedure p5Click(Sender: TObject);
    procedure p6Click(Sender: TObject);
    procedure p7Click(Sender: TObject);
    procedure brWeeksClick(Sender: TObject);
    procedure brMonClick(Sender: TObject);
    procedure aEditNazExecute(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aOtmetkiExecute(Sender: TObject);
    procedure aArchiveExecute(Sender: TObject);
    procedure aProtokolExecute(Sender: TObject);
    procedure TVLISTDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TVKabDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TVLISTMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxPrOtmenaPropertiesChange(Sender: TObject);
    procedure frxPrintListGetValue(const VarName: String;
      var Value: Variant);
    procedure aPrintExecute(Sender: TObject);
    procedure aCopyFioExecute(Sender: TObject);
    procedure TVLISTKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aSearchExecute(Sender: TObject);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure actDolgExecute(Sender: TObject);
    procedure btnNevipClick(Sender: TObject);
    procedure odsList_SortFIOBeforeOpen(DataSet: TDataSet);
    procedure actPrintSortFIOExecute(Sender: TObject);
    procedure odsList_SortDateNazBeforeOpen(DataSet: TDataSet);
    procedure actPrintSortDateNazExecute(Sender: TObject);
    procedure actPrintSortTimeVypExecute(Sender: TObject);
    procedure odsList_SortTimeVypBeforeOpen(DataSet: TDataSet);
    procedure odsPrintDezBeforeOpen(DataSet: TDataSet);
    procedure actPrintDezExecute(Sender: TObject);
    procedure actBaseExecute(Sender: TObject);
    procedure TVLISTCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure aPrintKabExecute(Sender: TObject);
    procedure aTextKabExecute(Sender: TObject);
    procedure aWebKabExecute(Sender: TObject);
    procedure aXMLKabExecute(Sender: TObject);
    procedure aXLSKabExecute(Sender: TObject);
    procedure frxRepKabGetValue(const VarName: string; var Value: Variant);
    procedure aNorma1Execute(Sender: TObject);
    procedure aNorma2Execute(Sender: TObject);
    procedure dxdeDatePropertiesEditValueChanged(Sender: TObject);
    procedure cxBarEditItem1PropertiesEditValueChanged(Sender: TObject);
    procedure aNevipExecute(Sender: TObject);
    procedure aCorrectExecute(Sender: TObject);
    procedure pmTVPopup(Sender: TObject);
    procedure aShowExecute(Sender: TObject);
    procedure aHideExecute(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure bbPrintMoreClick(Sender: TObject);
    procedure frxMoreGetValue(const VarName: string; var Value: Variant);
    procedure aEditTalonExecute(Sender: TObject);
    procedure actDolgTalonExecute(Sender: TObject);
    procedure aSysInfoExecute(Sender: TObject);
    procedure Vfc_anGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVKabCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    FileVersion : string;
    HandleDLL: THandle;
    InitPlugin: TInitPlugin;
    FreePlugin : TFreePlugin;
    sSortType : String;
    DateB, DateE : TDate;
    strText : string;
    sSpecName : string;
    get_edit_talon, get_show_dolgtalon : string;
    procedure DoRefreshSmidConst;
    procedure CheckEnabledButons;
    procedure DateChange;
    procedure DoPrintJournal(sType : string; pDataSet : TOracleDataSet = nil);
    { Private declarations }
  public
    nEditDaysOtdel : Integer;
    Russian : HKL;
    dicom_show_3d : Boolean;
    sCallingAET : String;
    get_sum_doza, get_kolvoday_edit, get_kolvo_raspred : Integer;
    get_labvip : Integer;
    get_xray_flukab : Integer;
    arFIO:array of string;
    sPath : string; // путь к лаунчеру мультивокса
    get_dicom_show, get_dicom_port, get_dicom_ip, get_dicom_called : string;
    get_new_style, get_show_podpis, get_more_metodics, get_more_print, get_def_thismk, get_lookinside, get_lookinside_archae,
    get_check_spell, get_show_onhand, get_use_cmove, get_local_port, show_button_pass, show_button_inspic, show_button_prof,
    show_recom : shortstring;
    get_can_change_vrach,list_xray_curr_vrach_as_owner : integer;
    MedotradeSign : string;
    bIsAdmin : Integer; // входит ли пользователь в группу "Администраторы" (1 - входит, 0 - нет)
    GET_DB_NAME : String;
    sSotrFIO : String;
    sCompanyName_4Rep : String;
    sOtdelName_4Rep : String;
    GET_SYSDATE_4REP : String;
    GET_COUNT_PAC : Integer;
    pSOTRID : Integer;
    pAPPSOTRID : Integer;
    pOTDELID : Integer;
    pSPEC : Integer;
    GET_REGISTRATOR_FLUORO : Integer;
    get_xray_mrtkab : Integer;
    GET_XRAY_MAMMOGRAF, GET_XRAY_MAMMOGRAF2 : Integer;
    GET_ISSL_FLU : Integer;
    GET_XRAY_MRT : Integer;
    GET_XRAY_KT : Integer;
    idKabToDrag : Integer;
    idStatusToDrag : Integer;
    idNazToDrag : Integer;
    Otmena : Integer;
    get_radio_otdel : Integer;
    procedure DoShowForm;
    function RestoreApplication(AAppCaption:string) : Boolean;
    procedure col_visibility;
    function chkNazHeal ( pPacID, pNazID : integer ) : Boolean;
    function Get_Pac_NUMIB(pFK_PacID: Integer): String;
  end;

  function IsPaidNaz(OS: TOracleSession; pFK_NazID: Integer): Boolean;

  procedure InsTableIntoRVEditor ( vRichViewEdit : TRichViewEdit );
  procedure InsColTableIntoRVEditor ( vRichViewEdit : TRichViewEdit );
  procedure InsRowTableIntoRVEditor ( vRichViewEdit : TRichViewEdit );
  procedure DelTableIntoRVEditor ( vRichViewEdit : TRichViewEdit );
  procedure DelColTableIntoRVEditor ( vRichViewEdit : TRichViewEdit );
  procedure DelRowTableIntoRVEditor ( vRichViewEdit : TRichViewEdit );
  procedure UnionCellRVEditor ( vRichViewEdit : TRichViewEdit );

  procedure CmnHeadPartRep( pFrxReport : TFrxReport;
                            frxHTMLExport1: TfrxHTMLExport;
                            frxRTFExport1: TfrxRTFExport;
                            rveText: TRichViewEdit;
                          //  pBeforePrintCallBack : TBeforePrintCallBack;
                            pFrxObjName:string = 'Memo8'
                          );

var
  frmMain: TfrmMain;
  get_nazcancel, get_vipnaz, get_labvip, get_nazplan, get_nevip, get_recomend, get_nazextra, get_neyav,
  get_rad_gamma, get_rad_petct, list_xray_cito, listxrayvrach_caneditcancel, GET_XRAYS_OTDEL,
  rgreg_hide_last_fluoro, xray_vrach_shownumber, USE_ONE_ACCESSIONNUMBER,
  list_visible_row_allkabinet : Integer;
  get_show_set_usluga_for_all, show_set_usluga : Boolean;
  GET_SYSTEMDATE : TDate;

implementation

uses fOtmena, fPacInfo, fEditNaz, fSetNaz, fOtmetki, fArchive, uDBTableUtils,
     fProtocol, fSearchLab, fDolg, fOtmetkiFlu, fWait, fAllHistory,
     fProgressNorma, fCorrect, fProtocolN, fProtocolMore, fDolgTalon, fSysInfo;
{$R *.dfm}

procedure TfrmMain.col_visibility;
  procedure SetColVis( pCol : TcxGridDBColumn; pVis:Boolean=True );
  begin
    pCol.Visible :=  pVis ;
    pCol.VisibleForCustomization :=  pVis ;
  end;
begin
  if (get_more_print = '-1') and (odsKab.FieldByName('is_flu').AsInteger <> 1) then
    begin
//      bbLine.Visible := ivAlways;
      bbPrintMore.Visible := ivAlways
    end else
    begin
//      bbLine.Visible := ivNever;
      bbPrintMore.Visible := ivNever;
    end;

  VNUMBERPROTOCOL.Visible:= xray_vrach_shownumber = 1;
  vFC_accessionnumber.visible := xray_vrach_shownumber = 0;// GET_DB_NAME <> 'H';
  if odsKab.FieldByName('is_flu').AsInteger = 1 then
    begin
      VNUMBERPROTOCOL.Caption := '№ записи';  // VNUMBERPROTOCOL
      VLIST_ZAKL1.Visible := True;
      VLIST_ZAKL2.Visible := True;
      aNorma1.Visible := True;
      aNorma2.Visible := True;
      SetColVis( VLABNAME, True );
    end else
    begin
      VNUMBERPROTOCOL.Caption := '№ иссл.';  // VNUMBERPROTOCOL
      VLIST_ZAKL1.Visible := False;
      VLIST_ZAKL2.Visible := False;
      aNorma1.Visible := False;
      aNorma2.Visible := False;

      SetColVis( VLABNAME, True );
    end;
    SetColVis( Vfc_an, False );
    SetColVis( vFC_accessionnumber, False );
    SetColVis( VNUMBERPROTOCOL, True );
    SetColVis( TVREANIM, True );

{  if USE_ONE_ACCESSIONNUMBER=1 then
  begin
    SetColVis( Vfc_an, True );
    if odsKab.FieldByName('is_flu').AsInteger = 1 then
      Vfc_an.Caption := '№ записи'
    else
      Vfc_an.Caption := '№ протокола';
    SetColVis( vFC_accessionnumber, False );
    SetColVis( VNUMBERPROTOCOL, False );
    SetColVis( TVREANIM, False );
  end else begin
    SetColVis( Vfc_an, False );
    SetColVis( vFC_accessionnumber, True );
    SetColVis( VNUMBERPROTOCOL, True );
    SetColVis( TVREANIM, True );
  end;  }
end;

function IsPaidNaz(OS: TOracleSession; pFK_NazID: Integer): Boolean;
var
  ODS: TOracleDataSet;
begin
  Result := False;

  ods := TOracleDataSet.Create(nil);

  try
    ods.Session := OS;
    ods.SQL.Text := 'SELECT 1 AS N' + #13#10 +
        'FROM ASU.TAPPENDIX_NAZ tn' + #13#10 +
		'INNER JOIN ASU.VNAZ v' + #13#10 +
        'ON tn.FK_NAZID = v.fk_id' + #13#10 +
        'INNER JOIN ASU.TBILL tb' + #13#10 +
        'ON tn.fk_appendixid = tb.fk_appendix' + #13#10 +
        'WHERE tn.fk_nazid = :pFK_NazID AND tb.FP_PAY = 1';
    ods.DeclareAndSet('pFK_NazID', otInteger, pFK_NazID);
    ods.Open;

    if ods.RecordCount > 0
    then Result := True;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
var id : Integer;
begin
  if (list_visible_row_allkabinet = 1) and (odsKab.fieldbyname('fk_id').asinteger = -1) then
   begin
    dsList.DataSet := odsListKardioUnKabinet;
    odsListKardioUnKabinet.DisableControls;
    id := odsListKardioUnKabinet.FieldByName('FK_ID').AsInteger;
    odsListKardioUnKabinet.Close;
    odsListKardioUnKabinet.SetVariable('Pispol', pSOTRID);
    odsListKardioUnKabinet.SetVariable('PFD_DATE', dxdeDate.Date);
     try
       odsListKardioUnKabinet.Open;
     except on e:eoracleerror do
      begin
        Application.messagebox(pchar('Произошла ошибка при работе модуля. Обратитесь к администратору!'
         + #13 + #13 + e.Message),'Ошибка',mb_iconerror);
        application.terminate;
      end;
     end;
    odsListKardioUnKabinet.EnableControls;
    odsListKardioUnKabinet.Locate('FK_ID', id, []);
   end
  else
   begin
    dsList.DataSet := odsList;
    odsList.DisableControls;
    id := odsList.FieldByName('FK_ID').AsInteger;
    odsList.Close;
    odsList.SetVariable('PFK_ROOMID', odsKab.FieldByName('FK_ID').AsInteger);
    odsList.SetVariable('PFD_DATE', dxdeDate.Date);
    {if GET_DB_NAME = 'SK' then
     begin
      odsList.DeclareVariable('PFK_ROOMID', otinteger);
      odsList.SetVariable('PFK_ROOMID', odsKab.FieldByName('FK_ID').AsInteger);
     end
    else    }
    if list_xray_cito > 0 then
     begin
      if list_xray_cito = odsKab.fieldbyname('fk_id').asinteger then
        odsList.sql.text := odsListCito.sql.text
      else
        odsList.sql.text := odsListUnCito.sql.text;
     end;

     try
       odsList.Open;
     except on e:eoracleerror do
      begin
        Application.messagebox(pchar('Произошла ошибка при работе модуля. Обратитесь к администратору!'
         + #13 + #13 + e.Message),'Ошибка',mb_iconerror);
        application.terminate; 
      end;
     end;             
    odsList.EnableControls;
    odsList.Locate('FK_ID', id, []);
   end;
end;

procedure TfrmMain.aOpenExecute(Sender: TObject);
var AppProcID : Integer;
begin
{$IFDEF USE_NEW_AUTH}

  if RestoreApplication(dsList.DataSet.FieldByName('FIOPAC').AsString  + ' - ' + Get_Pac_NUMIB(dsList.DataSet.FieldByName('FK_PACID').AsInteger))
  then Exit;

  SetLength(arFIO,Length(arFIO)+1);
  arFIO[Length(arFIO)-1]:=dsList.DataSet.FieldByName('FIOPAC').AsString;
  aOpen.Enabled:=False;
  Application.ProcessMessages;
  tmrCheckApplication.Enabled:=True;
  AppProcID := AppStart(ExtractFilePath(paramstr(0))+'IBRazdel.exe', IntToStr(odsList.FieldByName('FK_PACID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1));
  if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
{$ELSE}
  AppProcID := 0;
  if ShellExecute(Application.Handle,
                  pChar('open'),
                  PChar(ExtractFilePath(paramstr(0)) + 'IBRazdel.exe'),
                  PChar(IntToStr(frmMain.pAPPSOTRID) + ' ' +
                  IntToStr(odsList.FieldByName('FK_PACID').AsInteger) + ' ' +
                  IntToStr(-1) + ' ' +
                  IntToStr(-1)), PChar(ExtractFilePath(paramstr(0))), SW_SHOWNORMAL) < 32 then
    Application.MessageBox('Запуск внешнего модуля не удался.', 'Ошибка', MB_OK + MB_ICONERROR);
{$ENDIF}
  ShowWait(odsList.FieldByName('FK_PACID').AsInteger, False);
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Reg : TRegIniFile;
    id, vConstClrGrid, vClrGrid : Integer;
begin
  frmMain.Show;
  DoRefreshSmidConst;
  pAPPSOTRID := StrToInt(paramstr(1));
  ods := TOracleDataSet.Create(nil);
  ods.Session := os;
  ods.Cursor := crSQLWait;
  ods.SQL.Text := ' SELECT FK_SOTRID, ASU.DO_VRACHFIO(FK_SOTRID) AS SOTRFIO, '+#13+
                  '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+

                  '        asu.pkg_smini.readstring(''XRAY'', ''USE_ONE_ACCESSIONNUMBER'', ''0'') as USE_ONE_ACCESSIONNUMBER, '+#13+

                  '        (SELECT FC_NAME '+#13+
                  '           FROM ASU.TOTDEL '+#13+
                  '          WHERE FK_ID = (SELECT FK_OTDID FROM ASU.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME, '+#13+
                  '        ASU.GET_ADMINS_FOR_XRAY(FK_SOTRID) AS IS_ADMIN '+#13+
                  '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
  ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
  ods.Open;

  // использовать один accessionnumber для всех методик назначения
  if not TryStrToInt(ods.FieldByName('USE_ONE_ACCESSIONNUMBER').AsString,USE_ONE_ACCESSIONNUMBER) then
    USE_ONE_ACCESSIONNUMBER := 0;

  pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
  sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
  sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
  sSotrFIO := ods.FieldByName('SOTRFIO').AsString;
  bIsAdmin := ods.FieldByName('IS_ADMIN').AsInteger;
  ods.Close;
  ods.DeleteVariables;
  ods.SQL.Text := ' SELECT TSOTR.FK_OTDELID, TSOTR.FK_SPRAVID FROM ASU.TSOTR WHERE TSOTR.FK_ID = :PFK_ID ';
  ods.DeclareAndSet('PFK_ID', otInteger, pSOTRID);
  ods.Open;
  pOTDELID := ods.FieldByName('FK_OTDELID').AsInteger;
  pSPEC := ods.FieldByName('FK_SPRAVID').AsInteger;
// -- особое редактирование
  nEditDaysOtdel := 0;
  ods.DeleteVariables;
  ods.Close;
  ods.SQL.Text := ' select fc_value from asu.tsmini where fc_section = ''XRAY'' and fc_key = :pfc_key ';
  ods.DeclareAndSet('pfc_key', otString, 'РЕДАКТИРОВАНИЕ_'+IntToStr(pOTDELID));
  ods.Open;
  if ods.RecordCount > 0 then
    nEditDaysOtdel := StrToInt(ods.FieldByName('fc_value').AsString);
//-- главный запрос для Кардио + колонка Комментарий
    if get_db_name = 'SK' then
      begin
        odsList.SQL.Text := odsListKardio.SQL.Text;
        VTalonComment.Visible := True;
        VTalonComment.VisibleForCustomization := True;
        VLISTSOSTALON.Visible := True;
        VLISTSOSTALON.VisibleForCustomization := True;
      end;
  odsKab.AfterScroll := nil;       
  if list_visible_row_allkabinet = 1 then
   odsKab.SetVariable('pAllKabRow','select -1 as fk_id, ''Все кабинеты'' as fc_name, -1 as fn_order,null fc_phone,null is_flu from dual union all ');
  odsKab.Open;
  Reg:=TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  Reg.OpenKey('\Software\Softmaster\List_Vrach\ID_SOTR'+IntToStr(pSOTRID), True);
  id := Reg.ReadInteger('\Software\Softmaster\List_Vrach\ID_SOTR'+IntToStr(pSOTRID), 'ID_OTMENA', 0);
  case id of
   1: cxPrOtmena.EditValue := 1;
   0: cxPrOtmena.EditValue := 0;
  end;
  cxPrOtmenaPropertiesChange(nil);
  id := Reg.ReadInteger('\Software\Softmaster\List_Vrach\ID_SOTR'+IntToStr(pSOTRID), 'ID_KABINET', 0);
  if id <> 0 then
    odsKab.Locate('FK_ID', id, []);
  if (get_more_print = '-1') and (odsKab.FieldByName('is_flu').AsInteger <> 1) then
    begin
//      bbLine.Visible := ivAlways;
      bbPrintMore.Visible := ivAlways
    end else
    begin
//      bbLine.Visible := ivNever;
      bbPrintMore.Visible := ivNever;
    end;
  odsKab.AfterScroll := odsKabAfterScroll;
  dxdeDate.Date := GET_SYSTEMDATE;
  frmMain.Caption := '';
  frmMain.Caption := 'АРМ "Врач"('+FileVersion+'). '+'Пользователь: '+sSotrFIO+ '; Кабинет: '+odsKab.FieldByName('FC_NAME').AsString;
  cxGr.SetFocus;
  MedotradeSign := ReadMedotradeSign;
  TVList.StoreToRegistry('\SoftWare\SoftMaster\List_xrays_vrach\TVListVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TVList');
  TVList.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_vrach\TVListVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TVList');
  ods.Free;
  //
  vConstClrGrid:=1; // если нужно еще раз очистить колонки grid - изменить значение !!!
  vClrGrid := Reg.ReadInteger('\Software\Softmaster\List_Vrach\ID_SOTR'+IntToStr(pSOTRID), 'IS_CLEAR_FMAIN_TVLIST_GRID', 0);
  if vClrGrid<>vConstClrGrid then
  begin
    TVList.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_vrach\TVListVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TVList');
    col_visibility;
    Reg.WriteInteger('\Software\Softmaster\List_Vrach\ID_SOTR'+IntToStr(pSOTRID), 'IS_CLEAR_FMAIN_TVLIST_GRID',vConstClrGrid);
  end else
    col_visibility;
  Reg.Free;
end;

procedure TfrmMain.dxdeDatePropertiesEditValueChanged(Sender: TObject);
begin
  DateChange;
  aRefreshExecute(nil);
end;

procedure TfrmMain.odsKabAfterScroll(DataSet: TDataSet);
begin
  aRefreshExecute(Self);
  frmMain.Caption := '';
  frmMain.Caption := 'АРМ "Врач"('+FileVersion+'). Пользователь: '+sSotrFIO+ '; Кабинет: '+odsKab.FieldByName('FC_NAME').AsString;

  col_visibility;

end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
//------------------------------------------------------------------------------
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\List_Vrach\', FALSE) then
   begin
     Reg.CreateKey('\Software\Softmaster\List_Vrach');
   end;
  try
    Reg.WriteInteger('\Software\Softmaster\List_Vrach'+'\ID_SOTR'+IntToStr(pSOTRID), 'ID_KABINET', odsKab.FieldByName('FK_ID').AsInteger);
    Reg.WriteInteger('\Software\Softmaster\List_Vrach'+'\ID_SOTR'+IntToStr(pSOTRID), 'ID_OTMENA',  cxPrOtmena.EditValue);
  except
  end;
  Reg.Free;
//------------------------------------------------------------------------------
  TVList.StoreToRegistry('\SoftWare\SoftMaster\List_xrays_vrach\TVList'+'Vrach'+ '_' + IntToStr(pSOTRID), TRUE, [], 'TVList');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      if frmMain.sPath <> '' then      
        begin
          ShellExecute(Application.Handle,
                       pChar('open'),
                       pChar(sPath+'MvLauncher.exe'),
                       pChar('-cmd:Close'),
                       pChar(sPath),
                       SW_SHOWNORMAL);
        end;
      action := caFree;
    end else
    begin
      action := caNone;
    end;
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

procedure TfrmMain.aTextKabExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVKab.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGrKab, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGrKab, TRUE, TRUE);
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

procedure TfrmMain.aWebKabExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVKab.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGrKab, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGrKab, TRUE, TRUE);
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

procedure TfrmMain.aXMLKabExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVKab.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGrKab, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGrKab, TRUE, TRUE);
end;

procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXLSKabExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVKab.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGrKab, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGrKab, TRUE, TRUE);
end;

procedure TfrmMain.DoPrintJournal(sType: string; pDataSet: TOracleDataSet);
var id : Integer;
    ods : TOracleDataSet;
begin
  id := pDataSet.FieldByName('FK_ID').AsInteger;
  sSortType := sType;
  if (pDataSet <> nil) and (pDataSet <> odsList) then
    begin
	    pDataSet.Close;
	    pDataSet.Open;
	    if cxPrOtmena.EditValue = 1 then
		    begin
			    pDataSet.Filtered := False;
		    end else
		    begin
			    pDataSet.Filtered := True;
			    pDataSet.Filter := 'not ((fk_nazsosid = '+IntToStr(GET_NAZCANCEL)+') or (fk_nazsosid = '+IntToStr(GET_NEYAV)+'))';
		    end;
    end;
	frxDBPrintList.DataSet := pDataSet;

  if pDataSet = odsList then
    aRefreshExecute(nil);

  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as systemdate from dual ';
    ods.Open;
    GET_SYSDATE_4REP := ods.FieldByName('systemdate').AsString;
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select count(distinct fk_pacid) as cnt '+#13+
                    '   from asu.tnazis '+#13+
			              '  where fk_roomid = :pfk_roomid '+#13+
			              '    and fd_run >= :pfd_date and fd_run < to_date(:pfd_date)+1 ';
    if cxPrOtmena.EditValue <> 1 then
      begin
        ods.SQL.Add('and fk_nazsosid not in (asu.get_neyav, asu.get_nazcancel)');
      end;
    if pDataSet = odsPrintDez then
      begin
        ods.SQL.Add('and exists (select 1 from asu.tib where fk_pacid = tnazis.fk_id and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''DEZURSTVO''))');
      end;
     
    ods.DeclareAndSet('PFK_ROOMID', otInteger, odsKab.FieldByName('FK_ID').AsInteger);
    ods.DeclareAndSet('PFD_DATE', otDate, dxdeDate.EditValue); //dxdeDate.Date);
    ods.Open;
    GET_COUNT_PAC := ods.FieldByName('CNT').AsInteger;
	  if (odsKab.FieldByName('FK_ID').AsInteger = GET_XRAY_MAMMOGRAF) or (odsKab.FieldByName('is_flu').AsInteger = 1) then
      begin
        TfrxMemoView(frxPrintList.FindObject('memSexCap')).Text := 'Цель';
        TfrxMemoView(frxPrintList.FindObject('memSex')).Text := '[frxDBPrintList."ISSL_TARGET"]';
		    frxPrintList.ShowReport;
	    end else
      begin
        TfrxMemoView(frxPrintList.FindObject('memSexCap')).Text := 'Пол';
        TfrxMemoView(frxPrintList.FindObject('memSex')).Text := '[frxDBPrintList."SEX"]';
		    frxPrintList.ShowReport;
      end;
  finally
    pDataSet.Locate('FK_ID', id, []);
    ods.Free;
  end;
end;

procedure TfrmMain.DoRefreshSmidConst;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT ASU.GET_NAZCANCEL, ASU.GET_VIPNAZ, ASU.GET_LABVIP, ASU.GET_NAZPLAN, ASU.GET_NEVIP, ASU.GET_RECOMEND, TRUNC(SYSDATE) AS SYSTEMDATE,  '+#13+
                    '        ASU.GET_NEYAV, ASU.GET_REGISTRATOR_FLUORO, ASU.GET_NAZEXTRA, ASU.GET_XRAY_MAMMOGRAF, ASU.GET_XRAY_MAMMOGRAF2, '+#13+
                    '        ASU.GET_XRAY_MRT, ASU.GET_XRAY_MRTKAB, ASU.GET_XRAY_KT, ASU.GET_XRAY_FLU, asu.get_xray_flukab, asu.get_labvip, '+#13+
                    '        ASU.PKG_SMINI.READSTRING(''CONFIG'', ''DB_NAME'', ''H'') AS DB_NAME, '+#13+
                    '        ASU.GET_CAN_SHOW_SET_USLUGA as SHOW_SET_USLUGA, ASU.GET_SHOW_SET_USLUGA_FOR_ALL '+#13+
//                    '        asu.rgreg_hide_last_fluoro'+#13+
                    '   FROM DUAL ';
    ods.Close;
    try
      ods.Open;
    except
       on e:Eoracleerror do
        begin
          MessageDlg('ERROR : '+E.Message + #13+ods.sql.text, mtError, [mbOK], 0);
          Exit;
        end;
    end;

    // asu.get_radio_otdel,
    try
      get_radio_otdel := uDBTableUtils.TDBUtils.GetConstantDef('get_radio_otdel',os,0);
    except
      get_radio_otdel := 0;
    end;

    // , asu.get_rad_gamma
    try
      get_rad_gamma := uDBTableUtils.TDBUtils.GetConstantDef('get_rad_gamma',os,0);
    except
      get_rad_gamma := 0;
    end;

    // , asu.get_rad_petct
    try
      get_rad_petct := uDBTableUtils.TDBUtils.GetConstantDef('get_rad_petct',os,0);
    except
      get_rad_petct := 0;
    end;

    try
      listxrayvrach_caneditcancel := uDBTableUtils.TDBUtils.GetConstantDef('listxrayvrach_caneditcancel',os,0);
    except
      listxrayvrach_caneditcancel := 0;
    end;

    try
      get_can_change_vrach := uDBTableUtils.TDBUtils.GetConstantDef('list_xray_get_can_change_vrach',os,1);
    except
      get_can_change_vrach := 1;
    end;

    try
      rgreg_hide_last_fluoro := uDBTableUtils.TDBUtils.GetConstantDef('rgreg_hide_last_fluoro',os,0);
    except
      rgreg_hide_last_fluoro := 0;
    end;

    try
      list_visible_row_allkabinet :=TDBUtils.GetConstantDef('list_visible_row_allkabinet',os,0);
    except
      list_visible_row_allkabinet := 0;
    end;                

    try
      list_xray_curr_vrach_as_owner := uDBTableUtils.TDBUtils.GetConstantDef('list_xray_curr_vrach_as_owner',os,0);
    except
      list_xray_curr_vrach_as_owner := 0;
    end;

    // list_xray_cito
    try
      list_xray_cito := uDBTableUtils.TDBUtils.GetConstantDef('list_xray_cito',os,0);
    except
      list_xray_cito := 0;
    end;

    try  //0 показывать колонку accession number, 1 - показывать колонку numberprotokol
      xray_vrach_shownumber := uDBTableUtils.TDBUtils.GetConstantDef('xray_vrach_shownumber',os,0);
    except
      xray_vrach_shownumber := 0;
    end;

    get_nazcancel := ods.FieldByName('GET_NAZCANCEL').AsInteger;
    get_vipnaz := ods.FieldByName('GET_VIPNAZ').AsInteger;
    get_labvip := ods.FieldByName('GET_LABVIP').AsInteger;
    get_nazplan := ods.FieldByName('GET_NAZPLAN').AsInteger;
    get_nevip := ods.FieldByName('GET_NEVIP').AsInteger;
    get_recomend := ods.FieldByName('GET_RECOMEND').AsInteger;
    get_registrator_fluoro := ods.FieldByName('GET_REGISTRATOR_FLUORO').AsInteger;
    get_nazextra := ods.FieldByName('GET_NAZEXTRA').AsInteger;
    get_xray_mammograf := ods.FieldByName('GET_XRAY_MAMMOGRAF').AsInteger;
    get_xray_mammograf2 := ods.FieldByName('GET_XRAY_MAMMOGRAF2').AsInteger;
    get_issl_flu := ods.FieldByName('GET_XRAY_FLU').AsInteger;
    get_systemdate := ods.FieldByName('SYSTEMDATE').AsDateTime;
    get_neyav := ods.FieldByName('GET_NEYAV').AsInteger;
    get_xray_mrt := ods.FieldByName('GET_XRAY_MRT').AsInteger;
    get_xray_mrtkab := ods.FieldByName('GET_XRAY_MRTKAB').AsInteger;
    get_xray_kt := ods.FieldByName('GET_XRAY_KT').AsInteger;
    get_db_name := ods.FieldByName('DB_NAME').AsString;
    get_xray_flukab := ods.FieldByName('get_xray_flukab').AsInteger;
    get_labvip := ods.FieldByName('get_labvip').AsInteger;
   // get_rad_gamma := ods.FieldByName('get_rad_gamma').AsInteger;
   // get_rad_petct := ods.FieldByName('get_rad_petct').AsInteger;
  //  get_radio_otdel := ods.FieldByName('get_radio_otdel').AsInteger;
    get_show_set_usluga_for_all := ods.FieldByName('get_show_set_usluga_for_all').AsInteger = 1;
    show_set_usluga := ods.FieldByName('show_set_usluga').AsInteger = 1;
 //   listxrayvrach_caneditcancel := ods.fieldbyname('listxrayvrach_caneditcancel').asinteger;
   // list_xray_cito := ods.fieldbyname('list_xray_cito').asinteger;
  //  rgreg_hide_last_fluoro := ods.fieldbyname('rgreg_hide_last_fluoro').asinteger;
    GET_XRAYS_OTDEL := -1;

//-- tsmini
    dicom_show_3d := True; // по умолчанию не включаем 3D
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fc_value, fc_key from asu.tsmini where fc_section = ''XRAY'' order by fk_id ';
    ods.Open;
    ods.First;
    while not ods.Eof do
      begin
        if ods.FieldByName('fc_key').AsString = 'SHOW_DICOM' then
          begin
            if ods.FieldByName('fc_value').AsString = '' then
              get_dicom_show := '0'
            else
              get_dicom_show := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_PORT' then
          begin
            get_dicom_port := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_IP' then
          begin
            get_dicom_ip := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_CALLED_AE' then
          begin
            get_dicom_called := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_NEW_STYLE' then
          begin
            get_new_style := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_SHOW_PODPIS' then
          begin
            get_show_podpis := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_MORE_METODICS' then
          begin
            get_more_metodics := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_MORE_PRINT' then
          begin
            get_more_print := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_EDIT_TALON' then
          begin
            get_edit_talon := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_SHOW_DOLGTALON' then
          begin
            get_show_dolgtalon := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_DEFAULT_THISMK' then
          begin
            get_def_thismk := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'USE_INTEG_LOOKINSIDE' then
          begin
            get_lookinside := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'LOOKINSIDE_ARCH_AE' then
          begin
            get_lookinside_archae := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_CHECK_SPELL' then
          begin
            get_check_spell := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_SUMDOZA' then // Годовая эффективная доза
          begin
            get_sum_doza := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_SHOW_ONHAND' then // Показывать "от руки" в форме Отмена
          begin
            get_show_onhand := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'KOLVODAYS_EDIT' then // Количество дней для редактирования
          begin
            get_kolvoday_edit := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
        if ods.FieldByName('fc_key').AsString = 'KOLVODAYS_RASPRED' then // Кол-во дней для распределения
          begin
            get_kolvo_raspred := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
        if ods.FieldByName('fc_key').AsString = 'USE_C_MOVE' then // Использовать C-MOVE для доступа к снимкам
          begin
            get_use_cmove := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_LOCAL_PORT' then // Локальный порт для передачи снимков
          begin
            get_local_port := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'SHOW_BUTTON_PASS' then // Показывать кнопку "Зачесть" в форме "Протокол"
          begin
            show_button_pass := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_SHOW_INSPIC' then // Показывать кнопку "Вставить картинку"
          begin
            show_button_inspic := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_SHOW_3D' then // Показывать кнопку "Включить 3D"
          begin
            if ods.FieldByName('fc_value').AsString = '-1' then // обратная логика если True, то не показываем 3D
              dicom_show_3d := False
            else
              dicom_show_3d := True;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_SHOW_PF' then
          begin
            show_button_prof := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_SHOW_RECOM' then
          begin
            show_recom := ods.FieldByName('fc_value').AsString;
          end;

        ods.Next;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aCancelExecute(Sender: TObject);
var oq : TOracleQuery;
    ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmOtmena, frmOtmena);
  try
    frmOtmena.DoShowfrmOtmena(odsList.FieldByName('FK_ID').AsInteger, pSOTRID);
    frmOtmena.ShowModal;
    if frmOtmena.ModalResult = MrOK then
      begin
        ods := TOracleDataSet.Create(nil);
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' UPDATE ASU.TNAZIS SET FK_ISPOLID = :pFK_ISPOLID, FK_NAZSOSID = :pFK_NAZSOSID WHERE FK_ID = :pFK_ID ';
          oq.DeclareAndSet('pFK_ISPOLID', otInteger, pSOTRID);
          oq.DeclareAndSet('pFK_NAZSOSID', otInteger, GET_NAZCANCEL);
          oq.DeclareAndSet('pFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
          oq.Execute;
          os.Commit;
          oq.DeleteVariables;
          oq.SQL.Text := ' INSERT INTO ASU.VRES(FK_SMID, FD_INS, FC_RES, FC_TYPE, FK_VRACHID, FK_PACID, FK_NAZID, FK_SOS) '+
                         ' VALUES(:pFK_SMID, SYSDATE, :pFC_RES, ''TEXT'', :pFK_VRACHID, :pFK_PACID, :pFK_NAZID, :pFK_SOS) ';
          oq.DeclareAndSet('pFK_SMID', otInteger, odsList.FieldByName('FK_SMID').AsInteger);
          oq.DeclareAndSet('pFC_RES', otString, frmOtmena.cxOtmena.Text+';'+frmOtmena.cxOtmenaHand.Text);
          oq.DeclareAndSet('pFK_VRACHID', otInteger, pSOTRID);
          oq.DeclareAndSet('pFK_PACID', otInteger, odsList.FieldByName('FK_PACID').AsInteger);
          oq.DeclareAndSet('pFK_NAZID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
          oq.DeclareAndSet('pFK_SOS', otInteger, GET_NAZCANCEL);
          oq.Execute;
          os.Commit;

          ods.Session := os;
          ods.Cursor := crSQLWait;
          ods.SQL.Text := ' select fk_talonid '+#13+
                          '   from asu.tambtalon_naz '+#13+
                          '  where fk_talonid = (select fk_talonid from asu.tambtalon_naz where fk_nazid = :pfk_nazid) ';
          ods.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('FK_ID').AsInteger);
          ods.Open;
          if ods.RecordCount = 1 then
            begin
              oq.DeleteVariables;
              oq.SQL.Text := ' update asu.tambtalon '+#13+
                             '    set fn_sos = 2, fd_closed = trunc(sysdate),  '+#13+
                             '        fk_result = stat.pkg_statutil.get_smidid(''TALON_NE_YAVKA''), '+#13+
                             '        fk_sotrclosed = :pSotr '+#13+
                             '  where fk_id = :pfk_id ';
              oq.DeclareAndSet('pSotr', otInteger, frmMain.pSOTRID);
              oq.DeclareAndSet('pfk_id', otInteger, ods.FieldByName('fk_talonid').AsInteger);
              oq.Execute;
              os.Commit;
            end;
          RefreshQuery(odsList);
        finally
          oq.Free;
        end;
      end;
  finally
    frmOtmena.Free;
  end;
end;

procedure TfrmMain.odsListAfterScroll(DataSet: TDataSet);
begin
  CheckEnabledButons;
end;

procedure TfrmMain.odsList_SortDateNazBeforeOpen(DataSet: TDataSet);
begin
  odsList_SortDateNaz.SetVariable('PFK_ROOMID', odsKab.FieldByName('FK_ID').AsInteger);
  odsList_SortDateNaz.SetVariable('PFD_DATE', dxdeDate.Date);
end;

procedure TfrmMain.odsList_SortFIOBeforeOpen(DataSet: TDataSet);
begin
  odsList_SortFIO.SetVariable('PFK_ROOMID', odsKab.FieldByName('FK_ID').AsInteger);
  odsList_SortFIO.SetVariable('PFD_DATE', dxdeDate.Date);
end;

procedure TfrmMain.odsList_SortTimeVypBeforeOpen(DataSet: TDataSet);
begin
  odsList_SortTimeVyp.SetVariable('PFK_ROOMID', odsKab.FieldByName('FK_ID').AsInteger);
  odsList_SortTimeVyp.SetVariable('PFD_DATE', dxdeDate.Date);
end;

procedure TfrmMain.odsPrintDezBeforeOpen(DataSet: TDataSet);
begin
  odsPrintDez.SetVariable('PFK_ROOMID', odsKab.FieldByName('FK_ID').AsInteger);
  odsPrintDez.SetVariable('PFD_DATE', dxdeDate.Date);
end;

procedure TfrmMain.CheckEnabledButons;
begin
  aInfo.Enabled := (odsList.RecordCount <> 0);
  aOpen.Enabled := odsList.RecordCount <> 0;
  aCancel.Enabled := (odsList.RecordCount <> 0)
                      and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_VIPNAZ)
                      and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_NAZCANCEL);
  aEditNaz.Enabled := (odsList.RecordCount <> 0)
                       and ((odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND));
  aDelete.Visible := bIsAdmin = 1; 
  aDelete.Enabled := (odsList.RecordCount <> 0);
  aOtmetki.Enabled := (odsList.RecordCount <> 0) and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_NAZCANCEL)
                      and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_NEYAV);
  aProtokol.Enabled := (odsList.RecordCount <> 0) and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_NAZCANCEL)
                       and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_NEYAV);
  aPrint.Enabled := odsList.RecordCount <> 0;
  aCopyFio.Enabled := odsList.RecordCount <> 0;
  aNevip.Visible := bIsAdmin = 1;
  aNevip.Enabled := odsList.RecordCount <> 0;
  aCorrect.Visible := (bIsAdmin = 1) and (odsKab.FieldByName('is_flu').AsInteger <> 1);
  aCorrect.Enabled := (odsList.RecordCount <> 0) and (odsList.FieldByName('numberprotocol').AsString <> '');
  actPrintSortFIO.Enabled := odsList.RecordCount <> 0;
  actPrintSortDateNaz.Enabled := odsList.RecordCount <> 0;
  actPrintSortTimeVyp.Enabled := odsList.RecordCount <> 0;
  actBase.Enabled := odsList.RecordCount <> 0;
  aNorma1.Enabled := odsList.RecordCount <> 0;
  aNorma2.Enabled := odsList.RecordCount <> 0;
  bbPrintMore.Enabled := odsList.FieldByName('fk_nazsosid').AsInteger = get_vipnaz;
  aEditTalon.Visible := get_edit_talon = '-1';
  aEditTalon.Enabled := (odsList.RecordCount <> 0) and (get_edit_talon = '-1') and
                        (odsList.FieldByName('is_ambulance').AsInteger = 1) and
                        (odsList.FieldByName('fk_nazsosid').AsInteger = get_vipnaz);
  actDolgTalon.Visible := get_show_dolgtalon = '-1';
end;

procedure TfrmMain.TVLISTCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var ods : TOracleDataSet; 
  mr, resid : integer;
  oq : toraclequery;
begin
  if odsList.RecordCount <> 0 then
    begin
      if (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NAZCANCEL) or (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NEYAV) then
        begin
          Application.CreateForm(TfrmOtmena, frmOtmena);
          frmOtmena.acOk.Visible := listxrayvrach_caneditcancel = 1;
          frmOtmena.GroupBox1.Visible := FALSE;
          frmOtmena.cxOtmena.Align := alClient;
          frmOtmena.acCancel.Caption := 'Закрыть';
          frmOtmena.acCancel.ImageIndex := 2;
          ods := TOracleDataSet.Create(nil);
          try
            ods.Session := os;
            ods.Cursor := crSQLWait;
            ods.SQL.Text := ' SELECT FK_ID,FC_RES, '+#13+
                            '        TO_CHAR(FD_INS, ''DD.MM.YYYY HH24:MI'') FD_INS, '+#13+
                            '        FK_VRACHID, ASU.DO_VRACHFIO(FK_VRACHID) AS SOTRFIO '+#13+
                            '   FROM asu.VRES '+#13+
                            '  WHERE FK_NAZID = :pFK_NAZID AND FK_SOS = :PFK_SOS ';
            ods.DeclareAndSet('pFK_NAZID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
            ods.DeclareAndSet('PFK_SOS', otInteger, odsList.FieldByName('FK_NAZSOSID').AsInteger);
            try
              ods.Open;
              resid := ods.fieldbyname('fk_id').asinteger;
            except
               on e:Exception do
                begin
                  MessageDlg('ERROR : '+E.Message, mtError, [mbOK], 0);
                  Exit;
                end;
            end;
            frmOtmena.cxOtmena.Text := 'Сотрудник:'+' '+ods.FieldByName('SOTRFIO').AsString+','+' '+
                                       'Дата отмены:'+' '+ods.FieldByName('FD_INS').AsString+#13#10+
                                       'Обоснование отмены:'+' '+ods.FieldByName('FC_RES').AsString;
            frmOtmena.cxOtmenaHand.Text :=copy(ods.FieldByName('FC_RES').AsString,pos(';',ods.FieldByName('FC_RES').AsString)+1,length(ods.FieldByName('FC_RES').AsString));
          finally
            ods.Free;
          end;
          if listxrayvrach_caneditcancel = 1 then
            frmOtmena.DoShowfrmOtmena(odsList.FieldByName('FK_ID').AsInteger, pSOTRID);
          mr := frmOtmena.ShowModal;
          if (listxrayvrach_caneditcancel = 1) and (mr = mrok) then
           begin
             try
               oq := toraclequery.create(nil);
               oq.Session := os;
               oq.sql.text := 'update asu.vres set fc_res = :pres where fk_id = :pid';
               oq.declareandset('pid',otinteger, resid);
               oq.declareandset('pres',otstring,frmOtmena.cxOtmena.Text+';'+frmOtmena.cxOtmenaHand.Text);
               oq.execute;
               os.Commit;
             finally
               oq.free;
             end;
           end;
          frmOtmena.Free;
        end else
        begin
          aProtokolExecute(nil);
        end;
    end;
end;

procedure TfrmMain.TVLISTCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[TVSOS.Index] = GET_NAZCANCEL then
    ACanvas.Brush.Color:=RGB(251, 172, 182);
  if AViewInfo.GridRecord.Values[TVSOS.Index] = GET_NEYAV then
    ACanvas.Brush.Color:=RGB(251, 172, 182);

  if AViewInfo.GridRecord.Values[TVFK_NAZTYPE.Index] = GET_NAZEXTRA then
    begin
      ACanvas.Font.Style := [fsBold];
      ACanvas.Font.Color := RGB(253, 83, 113);
    end;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TVList.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_vrach\TVListVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TVList');
  col_visibility;
end;

procedure TfrmMain.frx30GetValue(const VarName: String; var Value: Variant);
begin
	if VarName = 'D1' then Value := DateTimeToStr(DateB);
	if VarName = 'D2' then Value := DateTimeToStr(DateE);
end;

procedure TfrmMain.frxMoreGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'PACFIO' then Value := odsList.FieldByName('FIOPAC').AsString;
  if VarName = 'DATE_ROJD' then Value := odsList.FieldByName('FD_ROJD').AsDateTime;
  if VarName = 'NUMISSL' then Value := odsList.FieldByName('NUMBERPROTOCOL').AsString;
  if VarName = 'KABINET' then Value := frmMain.odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'PHONEKAB' then Value := frmMain.odsKab.FieldByName('FC_PHONE').AsString;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'DATEISSL' then Value := odsList.FieldByName('FD_RUN').AsString+' '+odsList.FieldByName('TIME_ISL').AsString;
  if VarName = 'SOTRSPEC' then Value := sSpecName;
  if VarName = 'SOTR' then Value := odsList.FieldByName('ISPOLFIO').AsString;
  if VarName = 'TEXTISSL' then Value := strText; 
end;

procedure TfrmMain.odsKabBeforeOpen(DataSet: TDataSet);
begin
  odsKab.SetVariable('PSOTR', pSOTRID);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var Ini : TIniFile; v_FlEx : boolean; v_filename:ansistring;
begin
  v_filename:=ExtractFilePath(paramstr(0))+'DicomSettings.ini';
  v_FlEx:=FileExists(v_filename);
  Ini := TIniFile.Create(v_filename);
  try
    sCallingAET := Ini.ReadString('MAIN', 'CALLING_AET', 'MEDOTRADE');
    if not v_FlEx then
      Ini.WriteString('MAIN', 'CALLING_AET', sCallingAET);
  finally
    Ini.Free;
  end;
{$IFDEF USE_NEW_AUTH}
  GetSession(os, 'ASU');
{$ELSE}
  os.LogonDatabase := 'ASU';
  os.LogonUsername := 'ASU';
  os.LogonPassword := 'ASU';
  os.Connected := True;
{$ENDIF}
  russian:=LoadKeyboardLayout('00000419', 0);
  Application.HelpFile:=ExtractFilePath(Application.ExeName)+'Spiski.chm';
  frmMain.WindowState := wsMaximized;

  TVREANIM.VisibleForCustomization := False;
  TVREANIM.Visible := False;
end;

procedure TfrmMain.bbPrintMoreClick(Sender: TObject);
var ods : TOracleDataSet;
begin
  strText := '';
  ods := TOracleDataSet.Create(nil);
  ods.Session := frmMain.os;
  ods.Cursor := crSQLWait;
  ods.SQL.Text := ' select fb_text from asu.trichviewdata where fk_pacid = :pfk_pacid ';
  try
    odsListMore.Close;
    odsListMore.SetVariable('PFC_TYPE', odsList.FieldByName('FC_TYPE').AsString);
    odsListMore.Open;
    odsListMore.First;
    while not odsListMore.Eof do
      begin
        ods.Close;
        ods.DeclareAndSet('pfk_pacid', otInteger, odsListMore.FieldByName('fk_id').AsInteger);
        ods.Open;
        strText := strText + ods.FieldByName('fb_text').AsString+#13+#13;
        odsListMore.Next;
      end;
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select ts_sprav.fc_name from asu.ts_sprav, asu.tsotr where tsotr.fk_spravid = ts_sprav.fk_id and tsotr.fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('FK_ISPOLID').AsInteger);
    ods.Open;
    sSpecName := ods.FieldByName('fc_name').AsString;
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select asu.get_mrtkabs_for_xray(:pfk_kabid) as res from dual ';
    ods.DeclareAndSet('pfk_kabid', otInteger, odsKab.FieldByName('fk_id').AsInteger);
    ods.Open;
//    frxMore.FindObject('memDozaCap').Visible := odsKab.FieldByName('fk_id').AsInteger <> frmMain.get_xray_mrtkab;
//    frxMore.FindObject('memDozaData').Visible := odsKab.FieldByName('fk_id').AsInteger <> frmMain.get_xray_mrtkab;
    frxMore.FindObject('memDozaCap').Visible := ods.FieldByName('res').AsInteger <> 1;
    frxMore.FindObject('memDozaData').Visible := ods.FieldByName('res').AsInteger <> 1;
    frxMore.ShowReport;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.blMonClick(Sender: TObject);
var mm,yy,dd:word;
begin
	decodeDate(dxdeDate.Date,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=3) and (dd>28)) then dd:=28;
  if mm>1 then mm:=mm-1
   else
     begin
       mm:=12;
       yy:=yy-1;
     end;

  dxdeDate.Date:=encodeDate(yy,mm,dd);
end;

procedure TfrmMain.blWeeksClick(Sender: TObject);
begin
  dxdeDate.Date:=dxdeDate.Date-1;
end;

procedure TfrmMain.p1Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.Date);
  if wd=1 then wd:=8;
  dxdeDate.Date:=dxdeDate.Date-wd+2;
end;

procedure TfrmMain.p2Click(Sender: TObject);
var
 wd:integer;
begin
  wd:=dayofweek(dxdeDate.Date);
  if wd=1 then wd:=8;
  dxdeDate.Date:=dxdeDate.Date-wd+3;
end;

procedure TfrmMain.p3Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.Date);
  if wd=1 then wd:=8;
  dxdeDate.Date:=dxdeDate.Date-wd+4;
end;

procedure TfrmMain.p4Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.Date);
  if wd=1 then wd:=8;
  dxdeDate.Date:=dxdeDate.Date-wd+5;
end;

procedure TfrmMain.p5Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.Date);
  if wd=1 then wd:=8;
  dxdeDate.Date:=dxdeDate.Date-wd+6;
end;

procedure TfrmMain.p6Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.Date);
  if wd=1 then wd:=8;
  dxdeDate.Date:=dxdeDate.Date-wd+7;
end;

procedure TfrmMain.p7Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.Date);
  if wd=1 then wd:=8;
  dxdeDate.Date:=dxdeDate.Date-wd+8;
end;

procedure TfrmMain.pmTVPopup(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_OWNER FROM ASU.TSMID WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_SMID').AsInteger);
    ods.Open;
    aCorrect.Visible := (ods.FieldByName('FK_OWNER').AsInteger <> GET_ISSL_FLU) and (bIsAdmin = 1);
  finally
    ods.Free;
  end;
end;

function TfrmMain.RestoreApplication(AAppCaption: string): Boolean;
var
  Wnd               : hWnd;
  buff              : array[0..127] of Char;
begin
  Result := False;
  Self.SetFocus;
  Application.ProcessMessages;
  Wnd := GetWindow(Handle, gw_HWndFirst);
  while Wnd <> 0 do
  begin
    if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
    begin
      GetWindowText(Wnd, buff, sizeof(buff));
      if StrPas(buff) = AAppCaption then
      begin
        Application.ProcessMessages;
        ShowWindow(wnd, SW_SHOWMINIMIZED);
        ShowWindow(wnd, SW_SHOWNORMAL);
        SetForegroundWindow(wnd);
        Application.ProcessMessages;
        Result := True;
        Exit;
      end; //if StrPas(buff) = cFIO
    end; //if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
    Wnd := GetWindow(Wnd, gw_hWndNext);
  end; //while Wnd <> 0
end;

procedure TfrmMain.tmrCheckApplicationTimer(Sender: TObject);
var Wnd               : hWnd;
    buff              : array[0..127] of Char;
    i, j, iDel        : Integer;
begin
  Application.ProcessMessages;
  if not(tmrCheckApplication.Enabled) then exit;
  iDel:=0;
  for i:=0 to Length(arFIO)-1 do
  begin
    Wnd := GetWindow(Handle, gw_HWndFirst);
    while Wnd <> 0 do
    begin
      if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
        begin
          GetWindowText(Wnd, buff, sizeof(buff));
          if StrPas(buff) = arFIO[i-iDel] then
            begin
              if IsWindowVisible(Wnd) then
              begin
                  for j:=i-iDel to Length(arFIO)-2 do
                  begin
                    arFIO[j]:=arFio[j+1];
                  end;
                  SetLength(arFIO,Length(arFIO)-1);
                  Inc(iDel);
                  if Length(arFIO) = 0 then
                  begin
                    tmrCheckApplication.Enabled:=False;
                    Screen.Cursor:=crDefault;
                    aOpen.Enabled:=True;
                    Exit;
                  end;
                  Break;
              end;
            end;
        end;
      Wnd := GetWindow(Wnd, gw_hWndNext);
    end;
  end;
end;

procedure TfrmMain.brWeeksClick(Sender: TObject);
begin
  dxdeDate.Date:=dxdeDate.Date+1;
end;

procedure TfrmMain.brMonClick(Sender: TObject);
var yy,mm,dd:word;
begin
  decodeDate(dxdeDate.Date,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=1) and (dd>28)) then dd:=28;
  if mm<12 then mm:=mm+1
   else
     begin
       mm:=1;
       yy:=yy+1;
     end;
  dxdeDate.Date:=encodeDate(yy,mm,dd);
end;

procedure TfrmMain.DateChange;
var
 yy,mm,dd:word;
 wd:integer;
// pDate:tDateTime;
begin
//  pDate:=dxdeDate.Date;
  pMonth.Caption:=FormatDateTime('mmmm',dxdeDate.Date)+', '+(FormatDateTime('dddd',dxdeDate.Date));

  wd:=dayofweek(dxdeDate.Date);
  if wd=1 then wd:=8;
//  pDate:=dxdeDate.Date;

//  pDate:=dxdeDate.Date-wd+2;
  decodeDate(dxdeDate.Date-wd+2,yy,mm,dd);
  p1.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+3;
  decodeDate(dxdeDate.Date-wd+3,yy,mm,dd);
  p2.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+4;
  decodeDate(dxdeDate.Date-wd+4,yy,mm,dd);
  p3.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+5;
  decodeDate(dxdeDate.Date-wd+5,yy,mm,dd);
  p4.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+6;
  decodeDate(dxdeDate.Date-wd+6,yy,mm,dd);
  p5.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+7;
  decodeDate(dxdeDate.Date-wd+7,yy,mm,dd);
  p6.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+8;
  decodeDate(dxdeDate.Date-wd+8,yy,mm,dd);
  p7.Caption:=inttostr(dd);

  p1.Color:=clCream;
  p2.Color:=clCream;
  p3.Color:=clCream;
  p4.Color:=clCream;
  p5.Color:=clCream;
  p6.Color:=clCream;
  p7.Color:=clCream;
  case wd-1 of
    1:p1.Color:=clSkyBlue;
    2:p2.Color:=clSkyBlue;
    3:p3.Color:=clSkyBlue;
    4:p4.Color:=clSkyBlue;
    5:p5.Color:=clSkyBlue;
    6:p6.Color:=clSkyBlue;
    7:p7.Color:=clSkyBlue;
  end;
end;

procedure TfrmMain.aEditNazExecute(Sender: TObject);
var oq : TOracleQuery;
    ods : TOracleDataSet;
    sUserOs, sMachine, sModule : string;
begin
  Application.CreateForm(TfrmEditNaz, frmEditNaz);
  frmEditNaz.pDateNaz := odsList.FieldByName('fd_naz').AsDateTime;
  try
    frmEditNaz.DoShowEditNaz(odsList.FieldByName('FK_PACID').AsInteger,
                             pSOTRID,
                             odsList.FieldByName('PEPLID').AsInteger,
                             odsList.FieldByName('VRACHFIO').AsString,
                             Trunc(odsList.FieldByName('FD_RUN').AsDateTime),
                             odsList.FieldByName('FK_ROOMID').AsInteger,
                             odsList.FieldByName('FK_SMID').AsInteger,
                             odsList.FieldByName('FK_ID').AsInteger);
    frmEditNaz.ShowModal;
    if frmEditNaz.ModalResult = MrOK then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tnazis set fd_run = :pfd_run, fk_roomid = :pfk_roomid, fl_in_raspis = 1 where fk_id = :pfk_id ';
          oq.DeclareAndSet('PFD_RUN', otDate, StrToDateTime(DateToStr(frmEditNaz.cxdeDate.Date)+' '+FormatDateTime('hh:nn:ss', frmEditNaz.cxteTime.Time)));
          oq.DeclareAndSet('PFK_ROOMID', otInteger, frmEditNaz.cxlcKabinet.EditValue);
          oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
          oq.Execute;
// -- узнаем параметры сессии
          ods := TOracleDataSet.Create(nil);
          try
            ods.Session := frmMain.os;
            ods.Cursor := crSQLWait;
            ods.SQL.Text := ' SELECT OSUSER, MACHINE, MODULE '+#13+
                            '   FROM V$SESSION '+#13+
                            '  WHERE AUDSID=USERENV(''SESSIONID'') ';
            ods.Open;
            sUserOs := ods.FieldByName('osuser').AsString;
            sMachine := ods.FieldByName('machine').AsString;
            sModule := ods.FieldByName('module').AsString;
          finally
            ods.Free;
          end;
// -- логирование
          oq.DeleteVariables;
          oq.SQL.Text := ' insert into asu.txray_log(fc_field, fc_value, fd_date, fk_nazid, fk_sotrid, fc_osuser, fc_machine, fc_module, fc_form) '+#13+
                         ' values(''Распределение - Дата'', :pfc_value, sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmEditNaz'') ';
          oq.DeclareAndSet('pfc_value', otString, DateToStr(frmEditNaz.cxdeDate.Date)+' '+FormatDateTime('hh:nn:ss', frmEditNaz.cxteTime.Time));
          oq.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('FK_ID').AsInteger);
          oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
          oq.DeclareAndSet('pfc_osuser', otString, sUserOs);
          oq.DeclareAndSet('pfc_machine', otString, sMachine);
          oq.DeclareAndSet('pfc_module', otString, sModule);
          oq.Execute;

          oq.DeleteVariables;
          oq.SQL.Text := ' insert into asu.txray_log(fc_field, fc_value, fd_date, fk_nazid, fk_sotrid, fc_osuser, fc_machine, fc_module, fc_form) '+#13+
                         ' values(''Распределение - Кабинет'', :pfc_value, sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmEditNaz'') ';
          oq.DeclareAndSet('pfc_value', otString, frmEditNaz.cxlcKabinet.Text);
          oq.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('FK_ID').AsInteger);
          oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
          oq.DeclareAndSet('pfc_osuser', otString, sUserOs);
          oq.DeclareAndSet('pfc_machine', otString, sMachine);
          oq.DeclareAndSet('pfc_module', otString, sModule);
          oq.Execute;

          os.Commit;
          RefreshQuery(odsList);
        finally
          oq.Free;
        end;
      end;
  finally
    frmEditNaz.Free;
  end;
end;

procedure TfrmMain.aEditTalonExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select fk_nazid from asu.tambtalon_naz where fk_nazid = :pfk_nazid ';
    ods.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('fk_id').AsInteger);
    ods.Open;
    if ods.RecordCount = 0 then
      begin
        Application.MessageBox('Данное назначение не имеет привязки к талону! Приложение не будет запущено!',
                               'Внимание', mb_ok+mb_iconwarning);
        exit;
      end;
    if get_db_name = 'H' then // только для ОКБ г.Ханты-Мансийск
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' select fc_synonim '+#13+
                        '   from asu.tsmid '+#13+
                        '  where fk_id = (select fk_smid from asu.tib '+#13+
                        '                  where fk_pacid = :pfk_pacid and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''AMBTALON_OPL'' connect by prior fk_id = fk_owner)) ';
        ods.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('fk_id').AsInteger);
        ods.Open;
        if ods.FieldByName('fc_synonim').AsString <> 'TAL_OPLOMS' then
          begin
            MessageDlg('Внимание!'+#13+#10+
                       'Просматривать и редактировать данные амбулаторного талона'+#13+#10+
                       'можно лишь в случае, если Вид оплаты = ОМС !', mtInformation, [mbOK], 0);
            exit;
          end;
      end;
  finally
    ods.Free;
  end;

  HandleDLL := LoadLibrary('EditTalon.dll');
  try
    if HandleDLL <> 0 then
      begin
        InitPlugin := GetProcAddress(HandleDLL, 'InitPlugin');
        if @InitPlugin <> nil then
          begin
            try
              InitPlugin(odsList.FieldByName('fk_pacid').AsInteger,
                         odsList.FieldByName('fk_id').AsInteger,
                         pSOTRID,
                         pAPPSOTRID);
            except
            end;
          end;
      end;
  finally
    if HandleDLL <> 0 then
      begin
        FreePlugin := GetProcAddress(HandleDLL, 'FreePlugin');
        if @FreePlugin <> nil then
          FreePlugin;
        FreeLibrary(HandleDLL);
      end;
//    FreeLibrary(HandleDLL);
  end;
end;

procedure TfrmMain.aHideExecute(Sender: TObject);
begin
  cxSplitter1.CloseSplitter;
end;

procedure TfrmMain.aInfoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmPacInfo, frmPacInfo);
  try
    frmPacInfo.DoShowPacInfo(odsList.FieldByName('FK_PACID').AsInteger,
                             odsList.FieldByName('PEPLID').AsInteger,
                             odsList.FieldByName('OTDEL').AsString);
    frmPacInfo.ShowModal;
  finally
    frmPacInfo.Free;
  end;
end;

procedure TfrmMain.aNevipExecute(Sender: TObject);
var oq : TOracleQuery;
    ods, odsD : TOracleDataSet;
    kolvodays : Integer;
begin
// -- Делаем проверку можно ли редактировать
  odsD := TOracleDataSet.Create(nil);
  try
    odsD.Session := frmMain.os;
    odsD.Cursor := crSQLWait;
    odsD.SQL.Text := ' select round(sysdate - (select max(fd_date) '+#13+
                     '                           from asu.tpodpisnaz '+#13+
                     '                          where fk_sos = asu.get_vipnaz and fk_nazid = :pfk_nazid)) as cnt '+#13+
                     '   from asu.tnazis where fk_id = :pfk_nazid ';
    odsD.DeclareAndSet('PFK_NAZID', otInteger, odsList.FieldByName('fk_id').AsInteger);
    odsD.Open;
    kolvoDays := odsD.FieldByName('CNT').AsInteger;
    if KolvoDays >= get_kolvoday_edit then
      begin
        MessageDlg('Внимание!'+#13+#10+
                   'С момента подписания протокола прошло более '+IntToStr(get_kolvoday_edit)+' суток!'+#13+#10+
                   'Любые действия с протоколом запрещены!', mtInformation, [mbOK], 0);
        exit;
      end;
  finally
    odsD.Free;
  end;
// -- Меняем статус исследования на "Не вып."
	if Application.MessageBox('Вы собираетесь изменить статус исследования на "НЕ ВЫП."! Вы уверены?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
		begin
			oq := TOracleQuery.Create(nil);
      ods := TOracleDataSet.Create(nil);
			try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' begin '+#13+
                       '   update asu.tnazis set fk_nazsosid = asu.get_nevip where fk_id = :pfk_id; '+#13+
                       '   delete from asu.vres where fk_nazid = :pfk_id; '+#13+
                       '   delete from asu.tresis where fk_nazid = :pfk_id; '+#13+
                       '   delete from asu.tpodpisnaz where fk_nazid = :pfk_id and fk_sos in (asu.get_labvip, asu.get_vipnaz); '+#13+
                       ' end; ';
        oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
//-- если исследование имело статус "ОТМЕНА"
        if odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NAZCANCEL then
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' delete from asu.tib '+#13+
                           '  where fk_smeditid = (select max(fk_id) from asu.tsmid where fc_synonim = ''GET_OTKAZ_RG_ISSL'') '+#13+
                           '    and fk_pacid = :pfk_id ';
            oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
            oq.Execute;
            frmMain.os.Commit;
          end;
//-- работа с последней ФГ
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select fk_owner from asu.tsmid where fk_id = :pfk_id ';
        ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_smid').AsInteger);
        ods.Open;
        if ods.FieldByName('fk_owner').AsInteger = frmMain.GET_ISSL_FLU then
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' declare '+#13+
                           '   sDate varchar2(20); '+#13+
                           ' begin '+#13+
                           '   select asu.get_last_fluoro_date(:pfk_peplid, 1) into sDate from dual; '+#13+
                           '   if sDate is null then '+#13+
                           '     delete from asu.tlastfluoro where fk_peplid = :pfk_peplid; '+#13+
                           '   else '+#13+
                           '     update asu.tlastfluoro '+#13+
                           '        set fd_date = to_date(sDate, ''dd.mm.yyyy''), '+#13+
                           '            fc_num = asu.get_last_fluoro_num(:pfk_peplid) '+#13+
                           '      where fk_peplid = :pfk_peplid; '+#13+
                           '   end if; '+#13+
                           ' end; ';
            oq.DeclareAndSet('pfk_peplid', otInteger, odsList.FieldByName('peplid').AsInteger);
            oq.Execute;
            frmMain.os.Commit;
          end;
        RefreshQuery(odsList);
      finally
        oq.Free;
        ods.Free;
      end;
    end;
end;

procedure TfrmMain.aNorma1Execute(Sender: TObject);
var ods : TOracleDataSet;
    norma : Integer;
    id : Integer;
    oq : TOracleQuery;
begin
  if MessageDlg('Внимание!'
                +#13+#10+'Всем флюорографиям за выбранный день (кроме тех, у которых уже стоит заключение №1) автоматически установится '
                +#13+#10+'заключение №1 = "Вариант нормы" от Вашего имени!'+#13+#10+'Продолжить?', mtWarning, [mbYes, mbNo], 0) = MrYes then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        odsList.DisableControls;
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''FLU_NORMA'' ';
        ods.Open;
        if ods.FieldByName('FC_VALUE').AsString = '' then
          begin
            MessageDlg('Внимание!'
                       +#13+#10+'Вы не можете воспользоваться этой функцией системы, потому что'
                       +#13+#10+'не установлен параметр "Норма" в настройках флюорографии!'
                       +#13+#10+'Обратитесь к заведующему отделением или к администратору системы!', mtWarning, [mbOK], 0);
            Exit;
          end else
          begin
            norma := StrToInt(ods.FieldByName('FC_VALUE').AsString);
            Cursor := crSQLWait;
            cxGrKab.Enabled := False;
            aRefresh.Enabled := False;
            aInfo.Enabled := False;
            aSearch.Enabled := False;
            aOpen.Enabled := False;
            aArchive.Enabled := False;
            actBase.Enabled := False;
            aProtokol.Enabled := False;
            aOtmetki.Enabled := False;
            aDelete.Enabled := False;
            aCancel.Enabled := False;
            actDolg.Enabled := False;
            aPrint.Enabled := False;
            aClose.Enabled := False;
            aEditNaz.Enabled := False;
            Panel2.Enabled := False;
            cxPrOtmena.Enabled := False;
            aNevip.Enabled := False;
            aNorma1.Enabled := False;
            aNorma2.Enabled := False;
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := os;
              oq.SQL.Text := ' DECLARE '+#13#10+
                             '   nSMID15 NUMBER; '+#13#10+
                             '   Cnt15 NUMBER; '+#13#10+
                             '   nSMID10 NUMBER; '+#13#10+
                             '   Cnt10 NUMBER; '+#13#10+
		     	                   '   nSMID11 NUMBER; '+#13#10+
				                     '   Cnt11 NUMBER; '+#13#10+
                             '   nSMID21 NUMBER; '+#13#10+
	      			               '   Cnt21 NUMBER; '+#13#10+
				                     ' BEGIN '+#13#10+
				                     '   SELECT COUNT(FK_ID) INTO Cnt11 '+#13#10+  //ставим заключение 1
                             '     FROM ASU.TIB '+#13#10+
                             '    WHERE FK_PACID = :pFK_ID '+#13#10+
                             '      AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME1''); '+#13#10+
				                     '   IF Cnt11 = 0 THEN '+#13#10+
				                     '     SELECT FK_ID INTO nSMID11 FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME1''; '+#13#10+
				                     '     INSERT INTO TIB(FK_PACID, FN_NUM, FK_BID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13#10+
                             '     VALUES(:pFK_ID, :pFN_NUM11, :pFN_NUM11, ''Вариант нормы'', nSMID11, nSMID11, :pFK_VRACHID); '+#13#10+ //!!! неправильно! сюда должно передаваться вместо "Вариант нормы" select fc_name from tresume where fk_id = norma
                             '   END IF; '+#13#10+

                             '   SELECT COUNT(FK_ID) INTO Cnt10 '+#13#10+ // ставим дату 1
                             '     FROM ASU.TIB '+#13#10+
                             '    WHERE FK_PACID = :pFK_ID '+#13#10+
                             '      AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_DATE1''); '+#13#10+
                             '   IF Cnt10 = 0 THEN '+#13#10+
                             '     SELECT FK_ID INTO nSMID10 FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_DATE1''; '+#13#10+
                             '     INSERT INTO TIB(FK_PACID, FD_DATE, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13#10+
                             '     VALUES(:pFK_ID, SYSDATE, nSMID10, nSMID10, :pFK_VRACHID); '+#13#10+
                             '   END IF; '+#13#10+

                             '   SELECT COUNT(FK_ID) INTO Cnt15 '+#13#10+ // ставим врача 1
                             '     FROM ASU.TIB '+#13#10+
                             '    WHERE FK_PACID = :pFK_ID '+#13#10+
                             '      AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH1''); '+#13#10+
                             '   IF Cnt15 = 0 THEN '+#13#10+
                             '     SELECT FK_ID INTO nSMID15 FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH1''; '+#13#10+
                             '     INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13#10+
                             '     VALUES(:pFK_ID, :pFN_NUM15, nSMID15, nSMID15, :pFK_VRACHID); '+#13#10+
                             '   END IF; '+#13#10+

//                             '   SELECT COUNT(FK_ID) INTO Cnt21 '+#13#10+ // ставим заключение в протокол
//                             '     FROM ASU.TIB '+#13#10+
//                             '    WHERE FK_PACID = :pFK_ID '+#13#10+
//                             '      AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''); '+#13#10+
//	      			               ' IF Cnt21 = 0 THEN '+#13#10+#13#10+
//			      	               '   SELECT FK_ID INTO nSMID21 FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''; '+#13#10+
//				                     '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13#10+
//                             '   VALUES(:pFK_ID, (SELECT FC_NAME FROM ASU.TSHABLON_XRAY_ZAKL WHERE FK_ID = :PFN_NUM11), nSMID21, nSMID21, :pFK_VRACHID); '+#13#10+
//				                     ' END IF; '+#13#10+

				                     ' END; ';
              oq.DeclareAndSet('PFN_NUM11', otInteger, norma);
              oq.DeclareAndSet('PFN_NUM15', otInteger, pSOTRID);
		          oq.DeclareAndSet('pFK_VRACHID', otInteger, pSOTRID);

              id := odsList.FieldByName('FK_ID').AsInteger;
              odsList.AfterScroll := nil;
              odsList.First;
              Application.CreateForm(TfrmProgressNorma, frmProgressNorma);
              frmProgressNorma.Show;
              Application.ProcessMessages;
              frmProgressNorma.FormStyle := fsStayOnTop;
              frmProgressNorma.cxProgressBar1.Position := 0;
              frmProgressNorma.cxProgressBar1.Properties.Max := odsList.RecordCount;
              while not odsList.Eof do
                begin
                  if (odsList.FieldByName('FK_NAZSOSID').AsInteger <> get_nazcancel) and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> get_neyav) then
                    begin
                      oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
                      oq.Execute;
		                  frmMain.os.Commit;
                    end;
                  odsList.Next;
                  frmProgressNorma.cxProgressBar1.Position := frmProgressNorma.cxProgressBar1.Position + 1;
                  Application.ProcessMessages;
                end;
              odsList.Locate('FK_ID', id, []);
              odsList.AfterScroll := odsListAfterScroll;
            finally
              cxGrKab.Enabled := True;
              aRefresh.Enabled := True;
              aInfo.Enabled := True;
              aSearch.Enabled := True;
              aOpen.Enabled := True;
              aArchive.Enabled := True;
              actBase.Enabled := True;
              aProtokol.Enabled := True;
              aOtmetki.Enabled := True;
              aDelete.Enabled := True;
              aCancel.Enabled := True;
              actDolg.Enabled := True;
              aPrint.Enabled := True;
              aClose.Enabled := True;
              aEditNaz.Enabled := True;
              Panel2.Enabled := True;
              cxPrOtmena.Enabled := True;
              aNevip.Enabled := True;
              aNorma1.Enabled := True;
              aNorma2.Enabled := True;
              RefreshQuery(odsList);
              frmProgressNorma.Free;
              oq.Free;
              Cursor := crDefault;
              CheckEnabledButons;
            end;
          end;
      finally
        odsList.EnableControls;
        ods.Free;
      end;
    end;
end;

procedure TfrmMain.aNorma2Execute(Sender: TObject);
var ods : TOracleDataSet;
    norma : Integer;
    id : Integer;
    oq : TOracleQuery;
begin
  if MessageDlg('Внимание!'
                +#13+#10+'Всем флюорографиям за выбранный день (кроме тех, у которых уже стоит заключение №2) автоматически установится '
                +#13+#10+'заключение №2 = "Вариант нормы" от Вашего имени!'
                +#13+#10+'Всем флюорографиям поставится статус "ВЫПОЛНЕНО". '
                +#13+#10+'Продолжить?', mtWarning, [mbYes, mbNo], 0) = MrYes then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        odsList.DisableControls;
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''FLU_NORMA'' ';
        ods.Open;
        if ods.FieldByName('FC_VALUE').AsString = '' then
          begin
            MessageDlg('Внимание!'
                       +#13+#10+'Вы не можете воспользоваться этой функцией системы, потому что'
                       +#13+#10+'не установлен параметр "Норма" в настройках флюорографии!'
                       +#13+#10+'Обратитесь к заведующему отделением или к администратору системы!', mtWarning, [mbOK], 0);
            Exit;
          end else
          begin
            norma := StrToInt(ods.FieldByName('FC_VALUE').AsString);

            Cursor := crSQLWait;
            cxGrKab.Enabled := False;
            aRefresh.Enabled := False;
            aInfo.Enabled := False;
            aSearch.Enabled := False;
            aOpen.Enabled := False;
            aArchive.Enabled := False;
            actBase.Enabled := False;
            aProtokol.Enabled := False;
            aOtmetki.Enabled := False;
            aDelete.Enabled := False;
            aCancel.Enabled := False;
            actDolg.Enabled := False;
            aPrint.Enabled := False;
            aClose.Enabled := False;
            aEditNaz.Enabled := False;
            Panel2.Enabled := False;
            cxPrOtmena.Enabled := False;
            aNevip.Enabled := False;
            aNorma1.Enabled := False;
            aNorma2.Enabled := False;

            oq := TOracleQuery.Create(nil);
            try
              oq.Session := os;
              oq.SQL.Text := ' DECLARE '+#13+
                             '   nSMID15 NUMBER; '+#13+
                             '   Cnt15 NUMBER; '+#13+
                             '   nSMID10 NUMBER; '+#13+
                             '   Cnt10 NUMBER; '+#13+
		     	                   '   nSMID11 NUMBER; '+#13+
				                     '   Cnt11 NUMBER; '+#13+
                             '   nSOS NUMBER; '+#13+
                             '   nSMID21 NUMBER; '+#13+
	      			               '   Cnt21 NUMBER; '+#13+
                             '   cntRich number; '+#13+
                             '   cntRes number; '+#13+
                             '   cntTime number; '+#13+
				                     ' BEGIN '+#13+
				                     '   SELECT COUNT(FK_ID) INTO Cnt11 '+#13+ // ставим заключение 2
                             '     FROM ASU.TIB '+#13+
                             '    WHERE FK_PACID = :pFK_ID '+#13+
                             '      AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME2''); '+#13+
				                     '   IF Cnt11 = 0 THEN '+#13+
				                     '     SELECT FK_ID INTO nSMID11 FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME2''; '+#13+
				                     '     INSERT INTO asu.TIB(FK_PACID, FN_NUM, FK_BID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                             '     VALUES(:pFK_ID, :pFN_NUM11, :pFN_NUM11, ''Вариант нормы'', nSMID11, nSMID11, :pFK_VRACHID); '+#13+
                             '     SELECT FK_NAZSOSID INTO nSOS FROM ASU.TNAZIS WHERE FK_ID = :pFK_ID; '+#13+
                             '     IF (nSOS <> ASU.GET_VIPNAZ) and (nSOS <> ASU.GET_NAZCANCEL) and (nSOS <> ASU.GET_NEYAV) THEN '+#13+
                             '       UPDATE ASU.TNAZIS SET FK_NAZSOSID = ASU.GET_VIPNAZ, FK_ISPOLID = :pFK_VRACHID, FL_IN_RASPIS = 1 '+#13+
                             '        WHERE FK_ID = :pFK_ID; '+#13+
                             //-->> добавляем время
                             '       select count(fk_id) into cntTime from asu.tib where fk_pacid = :pfk_nazid and fk_smid = -2 and fk_smeditid = -2; '+#13+
                             '       if cntTime = 0 then '+#13+
                             '         insert into asu.tib(fn_num, fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                             '         values((select to_number(fc_time) from asu.tsmid where fk_id = :pfk_smid), :pfk_nazid, -2, -2, :pfk_vrachid, sysdate); '+#13+
                             '       end if; '+#13+
                            //-->> vres
                             '       select count(fk_id) into cntRes from asu.vres where fk_nazid = :pfk_nazid; '+#13+
                             '       if cntRes = 0 then '+#13+
                             '         insert into asu.vres(fk_smid, fd_ins, fc_type, fk_vrachid, fk_pacid, fk_sos, fk_nazid) '+#13+
                             '         values(:pfk_smid, sysdate, ''TEXT'', :pfk_vrachid, :pfk_pacid, asu.get_vipnaz, :pfk_nazid); '+#13+
                             '       else '+#13+
                             '         update asu.vres set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, '+#13+
                             '                             fk_sos = asu.get_vipnaz '+#13+
                             '                       where fk_nazid = :pfk_nazid; '+#13+
                             '       end if; '+#13+

                            //-->> trichviewdata
                             '       select count(*) into cntRich from asu.trichviewdata where fk_pacid = :pfk_nazid; '+#13+
                             '       if cntRich = 0 then '+#13+
                             '         insert into asu.trichviewdata(fb_blob, fb_html, fb_text, fk_pacid, fn_compress) '+#13+
                             '         values((select fb_blob from asu.txray_shablon_norma), '+#13+
                             '                (select fb_html from asu.txray_shablon_norma), '+#13+
                             '                (select fb_text from asu.txray_shablon_norma), :pfk_nazid, 1); '+#13+
                             '       end if; '+#13+
                             '     END IF; '+#13+
                        		 '   END IF; '+#13+

                             '   SELECT COUNT(FK_ID) INTO Cnt10 '+#13+ // ставим дату 2
                             '     FROM ASU.TIB '+#13+
                             '    WHERE FK_PACID = :pFK_ID '+#13+
                             '      AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_DATE2''); '+#13+
                             '   IF Cnt10 = 0 THEN '+#13+
                             '     SELECT FK_ID INTO nSMID10 FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_DATE2''; '+#13+
                             '     INSERT INTO asu.TIB(FK_PACID, FD_DATE, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                             '     VALUES(:pFK_ID, SYSDATE, nSMID10, nSMID10, :pFK_VRACHID); '+#13+
                             '   END IF; '+#13+

                             '   SELECT COUNT(FK_ID) INTO Cnt15 '+#13+ // ставим врача 2
                             '     FROM ASU.TIB '+#13+
                             '    WHERE FK_PACID = :pFK_ID '+#13+
                             '      AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH2''); '+#13+
                             '   IF Cnt15 = 0 THEN '+#13+
                             '     SELECT FK_ID INTO nSMID15 FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH2''; '+#13+
                             '     INSERT INTO asu.TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                             '     VALUES(:pFK_ID, :pFN_NUM15, nSMID15, nSMID15, :pFK_VRACHID); '+#13+
                             '   END IF; '+#13+

//                             '   SELECT COUNT(FK_ID) INTO Cnt21 '+#13+ //ставим заключение в протокол // !!! это уже не нужно или нужно ???
//                             '     FROM ASU.TIB '+#13+
//                             '    WHERE FK_PACID = :pFK_ID '+#13+
//                             '      AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''); '+#13+
//	      			               ' IF Cnt21 = 0 THEN '+#13+
//			      	               '   SELECT FK_ID INTO nSMID21 FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''; '+#13+
//				                     '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
//                             '   VALUES(:pFK_ID, (SELECT FC_NAME FROM ASU.TSHABLON_XRAY_ZAKL WHERE FK_ID = :PFN_NUM11), nSMID21, nSMID21, :pFK_VRACHID); '+#13+
//				                     ' END IF; '+#13+

				                     ' END; ';
              oq.DeclareAndSet('PFN_NUM11', otInteger, norma);
              oq.DeclareAndSet('PFN_NUM15', otInteger, pSOTRID);
		          oq.DeclareAndSet('pFK_VRACHID', otInteger, pSOTRID);

              id := odsList.FieldByName('FK_ID').AsInteger;
              odsList.AfterScroll := nil;
              odsList.First;
              Application.CreateForm(TfrmProgressNorma, frmProgressNorma);
              frmProgressNorma.Show;
              Application.ProcessMessages;
              frmProgressNorma.FormStyle := fsStayOnTop;
              frmProgressNorma.cxProgressBar1.Position := 0;
              frmProgressNorma.cxProgressBar1.Properties.Max := odsList.RecordCount;
              while not odsList.Eof do
                begin
                  if (odsList.FieldByName('FK_NAZSOSID').AsInteger <> get_nazcancel) and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> get_neyav) then
                    begin
                      oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
                      oq.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('FK_ID').AsInteger);
                      oq.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('FK_PACID').AsInteger);
                      oq.DeclareAndSet('pfk_smid', otInteger, odsList.FieldByName('FK_SMID').AsInteger);
                      oq.Execute;
                      odsLastFG.Close;
                      odsLastFG.SetVariable('pfk_peplid', odsList.FieldByName('peplid').AsInteger);
                      odsLastFG.Open;
		                  frmMain.os.Commit;
                    end;
                  odsList.Next;
                  frmProgressNorma.cxProgressBar1.Position := frmProgressNorma.cxProgressBar1.Position + 1;
                  Application.ProcessMessages;
                end;
              odsList.Locate('FK_ID', id, []);
              odsList.AfterScroll := odsListAfterScroll;
            finally
              cxGrKab.Enabled := True;
              aRefresh.Enabled := True;
              aInfo.Enabled := True;
              aSearch.Enabled := True;
              aOpen.Enabled := True;
              aArchive.Enabled := True;
              actBase.Enabled := True;
              aProtokol.Enabled := True;
              aOtmetki.Enabled := True;
              aDelete.Enabled := True;
              aCancel.Enabled := True;
              actDolg.Enabled := True;
              aPrint.Enabled := True;
              aClose.Enabled := True;
              aEditNaz.Enabled := True;
              Panel2.Enabled := True;
              cxPrOtmena.Enabled := True;
              aNevip.Enabled := True;
              aNorma1.Enabled := True;
              aNorma2.Enabled := True;
              RefreshQuery(odsList);
              frmProgressNorma.Free;
              oq.Free;
              Cursor := crDefault;
              CheckEnabledButons;
            end;
          end;
      finally
        odsList.EnableControls;
        ods.Free;
      end;
    end;
end;

procedure TfrmMain.aDeleteExecute(Sender: TObject);
var oq : TOracleQuery;
    ods, odsOpl, odsCan : TOracleDataSet;
begin
// -- проверка на "оплаченность"  для всех объектов кроме кардиоцентра
  if get_db_name <> 'SK' then
  begin
    odsOpl := TOracleDataSet.Create(nil);
    odsOpl.Session := frmMain.os;
    odsOpl.Cursor := crSQLWait;
    try
      odsOpl.SQL.Text := ' select asu.pkg_platuslug.IS_USL_PAYED((select fk_id from asu.tplat_uslug where fk_naz = :pfk_naz)) as opl from dual ';
      odsOpl.DeclareAndSet('pfk_naz', otInteger, odsList.FieldByName('fk_id').AsInteger);
      odsOpl.Open;
      if odsOpl.FieldByName('opl').AsInteger = 1 then
        begin
          MessageDlg('Внимание!'+#13+#10+'Данная услуга является оплаченной!'+#13+#10+'Её невозможно удалить!', mtInformation, [mbOK], 0);
          exit;
        end;
    finally
      odsOpl.Free;
    end;
  end;

  if IsPaidNaz(frmMain.os, odsList.FieldByName('fk_id').AsInteger)
  then begin
    Application.MessageBox('Данное назначение было оплачено, нельзя удалить.',
      'Невозможно удалить назначение', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  // -- проверка на удаление за предыдущий месяц
  // Для кардиоцентра в is_can_delete_naz стоит проверка на принадлежность к платной услуге.
  // Если это платная услуга то удалять нельзя назначение даже если оно не оплачено.
  // Корректное удаление платных услуг делается в модуле регистратуры на закладке 'Назначени' потому как ввели понятие составных услуг
  if get_db_name = 'SK' then
    begin
      odsCan := TOracleDataSet.Create(nil);
      try
        odsCan.Session := frmMain.os;
        odsCan.Cursor := crSQLWait;
        odsCan.SQL.Text := ' select asu.is_can_delete_naz(:pAppsotrid, :pNazid) as res_f from dual ';
        odsCan.DeclareAndSet('pAppsotrid', otInteger, pAPPSOTRID);
        odsCan.DeclareAndSet('pNazid', otInteger, odsList.FieldByName('fk_id').AsInteger);
        odsCan.Open;
        if odsCan.FieldByName('res_f').AsString <> 'TALON_CORRECT' then
          begin
            MessageDlg(odsCan.FieldByName('res_f').AsString, mtWarning, [mbOK], 0);
            exit;
          end;
      finally
        odsCan.Free;
      end;
    end;

  // -- удаление
  if Application.MessageBox('Вы действительно хотите удалить исследование?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      oq := TOracleQuery.Create(nil);
      oq.Session := os;
      oq.Cursor := crSQLWait;
      ods := TOracleDataSet.Create(nil);
      ods.Session := os;
      ods.Cursor := crSQLWait;
      try
        oq.SQL.Text := ' delete from asu.tnazis where fk_id = :pfk_id ';
        oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        if get_db_name = 'SK' then // -- для кардио центра проверяем выгружен ли талон, если не выгружен удаляем и талон
          begin
            ods.DeleteVariables;
            ods.Close;
            ods.SQL.Text := ' select fk_talonid from asu.tambtalon_naz where fk_nazid = :pfk_nazid ';
            ods.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('fk_id').AsInteger);
            ods.Open;
            odsCntOut.Close;
            odsCntOut.SetVariable('pTalonID', ods.FieldByName('fk_talonid').AsInteger);
            odsCntOut.Open;
            if odsCntOut.FieldByName('cnt_out').AsInteger = 0 then
              begin
                oq.DeleteVariables;
                oq.SQL.Text := ' delete from asu.tambtalon where fk_id = :pfk_id ';
                oq.DeclareAndSet('pfk_id', otInteger, ods.FieldByName('fk_talonid').AsInteger);
                oq.Execute;
              end;
          end;
        os.Commit;
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' select fk_owner from asu.tsmid where fk_id = :pfk_id ';
        ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_smid').AsInteger);
        ods.Open;
        if ods.FieldByName('fk_owner').AsInteger = frmMain.GET_ISSL_FLU then
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' declare '+#13+
                           '   sDate varchar2(20); '+#13+
                           ' begin '+#13+
                           '   select asu.get_last_fluoro_date(:pfk_peplid, 1) into sDate from dual; '+#13+
                           '   if sDate is null then '+#13+
                           '     delete from asu.tlastfluoro where fk_peplid = :pfk_peplid; '+#13+
                           '   else '+#13+
                           '     update asu.tlastfluoro '+#13+
                           '        set fd_date = to_date(sDate, ''dd.mm.yyyy''), '+#13+
                           '            fc_num = asu.get_last_fluoro_num(:pfk_peplid) '+#13+
                           '      where fk_peplid = :pfk_peplid; '+#13+
                           '   end if; '+#13+
                           ' end; ';
            oq.DeclareAndSet('pfk_peplid', otInteger, odsList.FieldByName('peplid').AsInteger);
            oq.Execute;
            os.Commit;
          end;
      finally
        oq.Free;
        ods.Free;
      end;
      RefreshQuery(odsList);
    end;
end;

procedure TfrmMain.aOtmetkiExecute(Sender: TObject);
begin
 if odsKab.FieldByName('is_flu').AsInteger = 1 then
   begin
     Application.CreateForm(TfrmOtmetkiFlu, frmOtmetkiFlu);
     try
       frmOtmetkiFlu.DoShowfrmOtmetki(odsList.FieldByName('FK_ID').AsInteger, odsList.FieldByName('FK_PACID').AsInteger);
       frmOtmetkiFlu.ShowModal;
     finally
       frmOtmetkiFlu.Free;
     end;
   end else
   begin
     Application.CreateForm(TfrmOtmetki, frmOtmetki);
     try
       frmOtmetki.DoShowfrmOtmetki(odsList.FieldByName('FK_ID').AsInteger, odsList.FieldByName('FK_PACID').AsInteger, odsKab.FieldByName('FK_ID').AsInteger);
       frmOtmetki.ShowModal;
     finally
       frmOtmetki.Free;
     end;
   end;
end;

procedure TfrmMain.aArchiveExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmArchive, frmArchive);
  try
    frmArchive.DoShowfrmArchive(odsList.FieldByName('FK_PACID').AsInteger);
    frmArchive.ShowModal;
  finally
    frmArchive.Free;
  end;
end;

procedure TfrmMain.aProtokolExecute(Sender: TObject);
var idNaz : Integer; v_strIssl : string;
begin
  idNaz := odsList.FieldByName('FK_ID').AsInteger;
//--- 1. Новая форма протокола
  if get_new_style = '-1' then
    begin
      Application.CreateForm(TfrmProtocolN, frmProtocolN);
      frmProtocolN.isResult := True; // odsList.FieldByName('FK_RESULTID').AsInteger = 1;
      try
     {   if ( (USE_ONE_ACCESSIONNUMBER=1) and ( odsList.FieldByName('FK_NAZSOSID').AsInteger = 2 ) ) then   // у пациентов в статусе не вып.
          frmProtocolN.rowNumIssl.Properties.Value := ''
        else
          frmProtocolN.rowNumIssl.Properties.Value := odsList.FieldByName('FC_TYPE').AsString ; }
        frmProtocolN.DoShowForm(odsList.FieldByName('IS_AMBULANCE').AsInteger,
                                odsList.FieldByName('FK_PACID').AsInteger,
                                odsList.FieldByName('PEPLID').AsInteger,
                                odsList.FieldByName('FK_SMID').AsInteger,
                                odsList.FieldByName('FK_ID').AsInteger,
                                odsList.FieldByName('IS_REANIM').AsInteger,
                                odsList.FieldByName('FC_NAME').AsString );
        frmProtocolN.ShowModal;
        if frmProtocolN.ModalResult = mrOk then
          begin
            odsList.AfterScroll := nil;
            RefreshQuery(odsList);
            odsList.AfterScroll := odsListAfterScroll;
            odsList.Locate('FK_ID', idNaz, []);
          end;
      finally
        frmProtocolN.Free;
      end;
    end else
    begin
//--- 2. Протокол с многими методиками
      if (get_more_metodics = '-1') and (odsKab.FieldByName('is_flu').AsInteger <> 1) then
        begin
          Application.CreateForm(TfrmProtocolMore, frmProtocolMore);
          try
            frmProtocolMore.isResult := True; // odsList.FieldByName('FK_RESULTID').AsInteger = 1;
            frmProtocolMore.DoShowfrmProtocol(odsList.FieldByName('IS_AMBULANCE').AsInteger,
                                              odsList.FieldByName('FK_PACID').AsInteger,
                                              odsList.FieldByName('PEPLID').AsInteger,
                                              odsList.FieldByName('FK_SMID').AsInteger,
                                              odsList.FieldByName('FK_ID').AsInteger,
                                              odsList.FieldByName('IS_REANIM').AsInteger);
            frmProtocolMore.ShowModal;
            if frmProtocolMore.ModalResult = MrOk then
              begin
                odsList.AfterScroll := nil;
                RefreshQuery(odsList);
                odsList.AfterScroll := odsListAfterScroll;
                odsList.Locate('FK_ID', idNaz, []);
              end;
          finally
            frmProtocolMore.Free;
          end;
        end else
        begin
//--- 3. Обычный протокол
          Application.CreateForm(TfrmProtocol, frmProtocol);
          try
          {  if ( (USE_ONE_ACCESSIONNUMBER=1) and ( odsList.FieldByName('FK_NAZSOSID').AsInteger = 2 ) ) then   // у пациентов в статусе не вып.
              frmProtocol.rowNumProt.Properties.Value := ''
            else
              frmProtocol.rowNumProt.Properties.Value := odsList.FieldByName('FC_TYPE').AsString ; }
            frmProtocol.isResult := True; // odsList.FieldByName('FK_RESULTID').AsInteger = 1;
            if pOtdelID = get_radio_otdel then
              begin
                frmProtocol.lbSpec.Caption := 'Врач-радиолог:';
              end else
              begin
                frmProtocol.lbSpec.Caption := 'Врач-рентгенолог:';
              end;
            frmProtocol.DoShowfrmProtocol(odsList.FieldByName('IS_AMBULANCE').AsInteger,
                                          odsList.FieldByName('FK_PACID').AsInteger,
                                          odsList.FieldByName('PEPLID').AsInteger,
                                          odsList.FieldByName('FC_NAME').AsString,
                                          odsList.FieldByName('FK_SMID').AsInteger,
                                          odsList.FieldByName('FK_ID').AsInteger,
                                          odsList.FieldByName('IS_REANIM').AsInteger);
            frmProtocol.ShowModal;
            if frmProtocol.ModalResult = MrOk then
              begin
                odsList.AfterScroll := nil;
                RefreshQuery(odsList);
                odsList.AfterScroll := odsListAfterScroll;
                odsList.Locate('FK_ID', idNaz, []);
              end;
          finally
            frmProtocol.Free;
          end;
        end;
    end;
end;

procedure TfrmMain.TVLISTDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := TRUE;
  idKabToDrag := odsKab.FieldByName('FK_ID').AsInteger;
  idStatusToDrag := odsList.FieldByName('FK_NAZSOSID').AsInteger;
end;

procedure TfrmMain.TVKabCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  try
    if AViewInfo.GridRecord.Values[grdbtvID.index] = -1 then
     ACanvas.Font.Style := ACanvas.Font.Style + [fsBold]; 
  except
  end;
end;

procedure TfrmMain.TVKabDragDrop(Sender, Source: TObject; X, Y: Integer);
var oq : TOracleQuery;
begin
  if (idStatusToDrag <> GET_NEVIP) and (idStatusToDrag <> GET_RECOMEND) then
    begin
      showmessage('Вы можете перенести только исследование со статусом ''НЕ ВЫП.'' или ''РЕКОМЕНДОВАНО''!');
      odsKab.AfterScroll := nil;
      odsKab.Locate('FK_ID', idKabToDrag, []);
      odsKab.AfterScroll := odsKabAfterScroll;
      odsKabAfterScroll(odsKab);
      odsList.Locate('FK_ID', idNazToDrag, []);      
      idKabToDrag := 0;
      idStatusToDrag := 0;
      exit;
    end;

  if MessageDlg('Вы назначаете исследование в '+odsKab.FieldByName('FC_NAME').AsString+'! Продолжить?', mtConfirmation, [mbOK,mbCancel], 0) = IDOk then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' UPDATE ASU.TNAZIS SET FK_ROOMID = :PFK_ROOMID WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFK_ROOMID', otInteger, odsKab.FieldByName('FK_ID').AsInteger);
        oq.DeclareAndSet('PFK_ID', otInteger, idNazToDrag);
        oq.Execute;
        os.Commit;
        RefreshQuery(odsList);
        odsList.Locate('FK_ID', idNazToDrag, []);
        idNazToDrag:=0;
      finally
        oq.Free;
      end;
    end else
    begin
      odsKab.AfterScroll := nil;
      odsKab.Locate('FK_ID', idKabToDrag, []);
      odsKab.AfterScroll := odsKabAfterScroll;
      odsKabAfterScroll(odsKab);
    end;
end;

procedure TfrmMain.TVLISTMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  idNazToDrag := odsList.FieldByName('FK_ID').AsInteger;
end;

procedure TfrmMain.Vfc_anGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin  //
  if USE_ONE_ACCESSIONNUMBER=1 then  // для хант делалось - Поддержка #30031
  begin
    // все кабинеты кроме флюорографического - колонка "№ исслед". - у пациентов в
    // статусе не вып. не должно быть номера исследования, поле должно быть пустым
  //  if odsKab.FieldByName('is_flu').AsInteger <> 1 then
  //  begin  // все кабинеты кроме флюорографического
      if ( ARecord.Values[VFK_NAZSOSID.Index] = 2 ) // у пациентов в статусе не вып.
      then
        AText := '';
  //  end;
  end;
end;

procedure TfrmMain.cxBarEditItem1PropertiesEditValueChanged(Sender: TObject);
begin
  if cxPrOtmena.EditValue = 1 then
    begin
      odsList.Filtered := FALSE;
    end else
    begin
      odsList.Filtered := TRUE;
      odsList.Filter := 'not ((FK_NAZSOSID = '+IntToStr(GET_NAZCANCEL)+') or (FK_NAZSOSID = '+IntToStr(GET_NEYAV)+'))';
    end;
end;

procedure TfrmMain.cxPrOtmenaPropertiesChange(Sender: TObject);
begin
  if cxPrOtmena.EditValue = 1 then
    begin
      odsList.Filtered := FALSE;
    end else
    begin
      odsList.Filtered := TRUE;
      odsList.Filter := 'not ((FK_NAZSOSID = '+IntToStr(GET_NAZCANCEL)+') or (FK_NAZSOSID = '+IntToStr(GET_NEYAV)+'))';
    end;
end;

procedure TfrmMain.frxPrintListGetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'KAB' then Value := odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'DATENOW' then Value := dxdeDate.Date;
  if VarName = 'SYSDATE' then Value := GET_SYSDATE_4REP;
  if VarName = 'KOLVOPAC' then Value := GET_COUNT_PAC;
  if VarName = 'SORTNAME' then Value := sSortType;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;  
end;

procedure TfrmMain.frxRepKabGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'DATESYS' then Value := GET_SYSDATE_4REP;
  if VarName = 'KOLVO' then Value := odsKab.RecordCount;
  if VarName = 'SOTRNAME' then Value := sSotrFIO;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;  
end;

function TfrmMain.Get_Pac_NUMIB(pFK_PacID: Integer): String;
var
  ODS: TOracleDataSet;
begin
  Result := '';
  ods := TOracleDataSet.Create(nil);

  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT asu.pkg_regist_pacfunc.GET_PAC_IB(:PACID) NUM_IB FROM DUAL';
    ods.DeclareAndSet(':PACID', otInteger, pFK_PACID);
    ods.Open;
    Result := ods.FieldByName('NUM_IB').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
//var ods : TOracleDataSet;
//     id : Integer;
begin
  DoPrintJournal('Печать журнала', odsList);
//  id := odsList.FieldByName('FK_ID').AsInteger;
//  sSortType := aPrint.Caption;
//  aRefreshExecute(nil);
//	frxDBPrintList.DataSet := odsList;
//	ods := TOracleDataSet.Create(nil);
//  try
//    ods.Session := os;
//    ods.Cursor := crSQLWait;
//    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE FROM DUAL ';
//    ods.Open;
//    GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
//    ods.DeleteVariables;
//    ods.Close;
//    if cxPrOtmena.EditValue = 1 then
//			begin
//				ods.SQL.Text := ' SELECT COUNT(DISTINCT FK_PACID) AS CNT '+
//												'   FROM TNAZIS '+
//												'  WHERE FK_ROOMID = :PFK_ROOMID '+
//												'    AND FD_RUN >= :PFD_DATE AND FD_RUN < TO_DATE(:PFD_DATE)+1 ';
//			end else
//			begin
//				ods.SQL.Text := ' SELECT COUNT(DISTINCT FK_PACID) AS CNT '+
//												'   FROM TNAZIS '+
//												'  WHERE FK_ROOMID = :PFK_ROOMID '+
//												'    AND FK_NAZSOSID NOT IN (GET_NEYAV, GET_NAZCANCEL) '+
//												'    AND FD_RUN >= :PFD_DATE AND FD_RUN < TO_DATE(:PFD_DATE)+1 ';
//			end;
//		ods.DeclareAndSet('PFK_ROOMID', otInteger, odsKab.FieldByName('FK_ID').AsInteger);
//		ods.DeclareAndSet('PFD_DATE', otDate, dxdeDate.Date);
//		ods.Open;
//    GET_COUNT_PAC := ods.FieldByName('CNT').AsInteger;
//  finally
//    ods.Free;
//  end;
//  if (odsKab.FieldByName('FK_ID').AsInteger = GET_XRAY_MAMMOGRAF) or (odsKab.FieldByName('is_flu').AsInteger = 1) then
//    frxPrintList1.ShowReport
//  else
//    frxPrintList.ShowReport;
//  odsList.Locate('FK_ID', id, []);
end;

procedure TfrmMain.aPrintKabExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  odsKab.AfterScroll := nil;
  id := odsKab.FieldByName('FK_ID').AsInteger;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE '+
                    '   FROM DUAL ';
    ods.Open;
    GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
  finally
    ods.Free;
  end;
  frxRepKab.ShowReport;
  odsKab.Locate('FK_ID', id, []);
  odsKab.AfterScroll := odsKabAfterScroll;
end;

procedure TfrmMain.aCopyFioExecute(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := ReplaceSubStr(odsList.FieldByName('FIOPAC').AsString, '.', '');
end;

procedure TfrmMain.aCorrectExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmCorrect, frmCorrect);
  try
    frmCorrect.lbNum.Caption := odsList.FieldByName('NUMBERPROTOCOL').AsString;
    frmCorrect.ShowModal;
    if frmCorrect.ModalResult = MrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' UPDATE ASU.TNAZIS SET FC_TYPE = :PFC_TYPE WHERE FK_ID = :PFK_ID ';
          oq.DeclareAndSet('PFC_TYPE', otString, frmCorrect.teNewNum.Text);
          oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
          oq.Execute;
          oq.DeleteVariables;
          oq.SQL.Text := ' UPDATE ASU.TIB SET FC_CHAR = :PFC_CHAR '+#13+
                         '  WHERE FK_PACID = :PFK_PACID AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL'') ';
          oq.DeclareAndSet('PFC_CHAR', otString, frmCorrect.teNewNum.Text);
          oq.DeclareAndSet('PFK_PACID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
          oq.Execute;
          os.Commit;
          RefreshQuery(odsList);
        finally
          oq.Free;
        end;
      end;
  finally
    frmCorrect.Free;
  end;
end;

procedure TfrmMain.TVLISTKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if odsList.RecordCount <> 0 then
    begin
      if Key = VK_RETURN then
        aProtokolExecute(nil);
    end;
end;

procedure TfrmMain.aSearchExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSearchLab, frmSearchLab);
  try
    frmSearchLab.DoShowfrmSearch;
    frmSearchLab.ShowModal;
    RefreshQuery(odsList);
  finally
    frmSearchLab.Free;
  end;
end;

procedure TfrmMain.aShowExecute(Sender: TObject);
begin
  cxSplitter1.OpenSplitter;
end;

procedure TfrmMain.aSysInfoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSysInfo, frmSysInfo);
  try
    frmSysInfo.DoShowForm(odsList.FieldByName('fk_pacid').AsInteger,
                          odsList.FieldByName('peplid').AsInteger,
                          odsList.FieldByName('fk_id').AsInteger); // NazID
    frmSysInfo.ShowModal;
  finally
    frmSysInfo.Free;
  end;
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
    FileVersion := Ver.FileVersion;
  finally
    Ver.Free;
  end;
end;

procedure TfrmMain.actBaseExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAllHistory, frmAllHistory);
  try
    frmAllHistory.DoShowForm(odsList.FieldByName('PEPLID').AsInteger,
                             odsList.FieldByName('FIOPAC').AsString);
    frmAllHistory.ShowModal;
  finally
    frmAllHistory.Free;
  end;
end;

procedure TfrmMain.actDolgExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmDolg, frmDolg);
  try
    frmDolg.DoShowfrmDolg;
    frmDolg.ShowModal;
  finally
    frmDolg.Free;
  end;
end;

procedure TfrmMain.actDolgTalonExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmDolgTalon, frmDolgTalon);
  try
    frmDolgTalon.vSotrId := pSOTRID;
    frmDolgTalon.GET_DB_NAME := GET_DB_NAME;
    frmDolgTalon.DoShowfrmDolgTalon;
    frmDolgTalon.ShowModal;
  finally
    frmDolgTalon.Free;
  end;
end;

procedure TfrmMain.actPrintDezExecute(Sender: TObject);
//var ods : TOracleDataSet;
begin
  DoPrintJournal('Печать журнала - Дежурство', odsPrintDez);
//  sSortType := actPrintDez.Caption;
//	odsPrintDez.Close;
//	odsPrintDez.Open;
//	if cxPrOtmena.EditValue = 1 then
//		begin
//			odsPrintDez.Filtered := FALSE;
//		end else
//		begin
//			odsPrintDez.Filtered := TRUE;
//			odsPrintDez.Filter := 'not ((FK_NAZSOSID = '+IntToStr(GET_NAZCANCEL)+') or (FK_NAZSOSID = '+IntToStr(GET_NEYAV)+'))';
//		end;
//	frxDBPrintList.DataSet := odsPrintDez;
//	ods := TOracleDataSet.Create(nil);
//	try
//		ods.Session := os;
//		ods.Cursor := crSQLWait;
//		ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE FROM DUAL ';
//		ods.Open;
//		GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
//		ods.DeleteVariables;
//		ods.Close;
//		if cxPrOtmena.EditValue = 1 then
//			begin
//				ods.SQL.Text := ' SELECT COUNT(DISTINCT FK_PACID) AS CNT '+
//												'   FROM TNAZIS '+
//												'  WHERE FK_ROOMID = :PFK_ROOMID '+
//												'    AND FD_RUN >= :PFD_DATE AND FD_RUN < TO_DATE(:PFD_DATE)+1 '+
//                        '    AND (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''DEZURSTVO'')) = -1 ';
//			end else
//			begin
//				ods.SQL.Text := ' SELECT COUNT(DISTINCT FK_PACID) AS CNT '+
//												'   FROM TNAZIS '+
//												'  WHERE FK_ROOMID = :PFK_ROOMID '+
//												'    AND FK_NAZSOSID NOT IN (GET_NEYAV, GET_NAZCANCEL) '+
//												'    AND FD_RUN >= :PFD_DATE AND FD_RUN < TO_DATE(:PFD_DATE)+1 '+
//                        '    AND (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''DEZURSTVO'')) = -1 ';
//			end;
//		ods.DeclareAndSet('PFK_ROOMID', otInteger, odsKab.FieldByName('FK_ID').AsInteger);
//		ods.DeclareAndSet('PFD_DATE', otDate, dxdeDate.Date);
//		ods.Open;
//		GET_COUNT_PAC := ods.FieldByName('CNT').AsInteger;
//  finally
//		ods.Free;
//  end;
//	if (odsKab.FieldByName('FK_ID').AsInteger = GET_XRAY_MAMMOGRAF) or (odsKab.FieldByName('is_flu').AsInteger = 1) then
//		frxPrintList1.ShowReport
//	else
//		frxPrintList.ShowReport;
end;

procedure TfrmMain.actPrintSortDateNazExecute(Sender: TObject);
//var ods : TOracleDataSet;
begin
  DoPrintJournal('Печать журнала с сортировкой по дате наз.', odsList_SortDateNaz);
//  sSortType := actPrintSortDateNaz.Caption;
//  odsList_SortDateNaz.Close;
//  odsList_SortDateNaz.Open;
//  if cxPrOtmena.EditValue = 1 then
//    begin
//      odsList_SortDateNaz.Filtered := FALSE;
//    end else
//    begin
//      odsList_SortDateNaz.Filtered := TRUE;
//      odsList_SortDateNaz.Filter := 'not ((FK_NAZSOSID = '+IntToStr(GET_NAZCANCEL)+') or (FK_NAZSOSID = '+IntToStr(GET_NEYAV)+'))';
//    end;
//  frxDBPrintList.DataSet := odsList_SortDateNaz;
//  ods := TOracleDataSet.Create(nil);
//  try
//    ods.Session := os;
//    ods.Cursor := crSQLWait;
//    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE FROM DUAL ';
//    ods.Open;
//    GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
//    ods.DeleteVariables;
//    ods.Close;
//    if cxPrOtmena.EditValue = 1 then
//      begin
//	ods.SQL.Text := ' SELECT COUNT(DISTINCT FK_PACID) AS CNT '+
//			'   FROM TNAZIS '+
//			'  WHERE FK_ROOMID = :PFK_ROOMID '+
//			'    AND FD_RUN >= :PFD_DATE AND FD_RUN < TO_DATE(:PFD_DATE)+1 ';
//      end else
//      begin
//	ods.SQL.Text := ' SELECT COUNT(DISTINCT FK_PACID) AS CNT '+
//			'   FROM TNAZIS '+
//			'  WHERE FK_ROOMID = :PFK_ROOMID '+
//			'    AND FK_NAZSOSID NOT IN (GET_NEYAV, GET_NAZCANCEL) '+
//			'    AND FD_RUN >= :PFD_DATE AND FD_RUN < TO_DATE(:PFD_DATE)+1 ';
//      end;
//    ods.DeclareAndSet('PFK_ROOMID', otInteger, odsKab.FieldByName('FK_ID').AsInteger);
//    ods.DeclareAndSet('PFD_DATE', otDate, dxdeDate.Date);
//    ods.Open;
//    GET_COUNT_PAC := ods.FieldByName('CNT').AsInteger;
//  finally
//    ods.Free;
//  end;
//  if (odsKab.FieldByName('FK_ID').AsInteger = GET_XRAY_MAMMOGRAF) or (odsKab.FieldByName('is_flu').AsInteger = 1) then
//    frxPrintList1.ShowReport
//  else
//    frxPrintList.ShowReport;
end;

procedure TfrmMain.actPrintSortFIOExecute(Sender: TObject);
//var ods : TOracleDataSet;
begin
  DoPrintJournal('Печать журнала с сортировкой по ФИО', odsList_SortFIO);
//  sSortType := actPrintSortFIO.Caption;
//  odsList_SortFIO.Close;
//  odsList_SortFIO.Open;
//  if cxPrOtmena.EditValue = 1 then
//    begin
//      odsList_SortFIO.Filtered := FALSE;
//    end else
//    begin
//      odsList_SortFIO.Filtered := TRUE;
//      odsList_SortFIO.Filter := 'not ((FK_NAZSOSID = '+IntToStr(GET_NAZCANCEL)+') or (FK_NAZSOSID = '+IntToStr(GET_NEYAV)+'))';
//    end;
//  frxDBPrintList.DataSet := odsList_SortFIO;
//  ods := TOracleDataSet.Create(nil);
//  try
//    ods.Session := os;
//    ods.Cursor := crSQLWait;
//    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE FROM DUAL ';
//    ods.Open;
//    GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
//    ods.DeleteVariables;
//    ods.Close;
//    if cxPrOtmena.EditValue = 1 then
//      begin
//	      ods.SQL.Text := ' SELECT COUNT(DISTINCT FK_PACID) AS CNT '+
//			                  '   FROM TNAZIS '+
//			                  '  WHERE FK_ROOMID = :PFK_ROOMID '+
//		                  	'    AND FD_RUN >= :PFD_DATE AND FD_RUN < TO_DATE(:PFD_DATE)+1 ';
//      end else
//      begin
//	      ods.SQL.Text := ' SELECT COUNT(DISTINCT FK_PACID) AS CNT '+
//			                  '   FROM TNAZIS '+
//	                  		'  WHERE FK_ROOMID = :PFK_ROOMID '+
//	                  		'    AND FK_NAZSOSID NOT IN (GET_NEYAV, GET_NAZCANCEL) '+
//	                  		'    AND FD_RUN >= :PFD_DATE AND FD_RUN < TO_DATE(:PFD_DATE)+1 ';
//      end;
//    ods.DeclareAndSet('PFK_ROOMID', otInteger, odsKab.FieldByName('FK_ID').AsInteger);
//    ods.DeclareAndSet('PFD_DATE', otDate, dxdeDate.Date);
//    ods.Open;
//    GET_COUNT_PAC := ods.FieldByName('CNT').AsInteger;
//  finally
//    ods.Free;
//  end;
//  if (odsKab.FieldByName('FK_ID').AsInteger = GET_XRAY_MAMMOGRAF) or (odsKab.FieldByName('is_flu').AsInteger = 1) then
//    frxPrintList1.ShowReport
//  else
//    frxPrintList.ShowReport;
end;

procedure TfrmMain.actPrintSortTimeVypExecute(Sender: TObject);
//var ods : TOracleDataSet;
begin
  DoPrintJournal('Печать журнала с сортировкой по времени вып.', odsList_SortTimeVyp);
//  sSortType := actPrintSortTimeVyp.Caption;
//  odsList_SortTimeVyp.Close;
//  odsList_SortTimeVyp.Open;
//  if cxPrOtmena.EditValue = 1 then
//    begin
//      odsList_SortTimeVyp.Filtered := FALSE;
//    end else
//    begin
//      odsList_SortTimeVyp.Filtered := TRUE;
//      odsList_SortTimeVyp.Filter := 'not ((FK_NAZSOSID = '+IntToStr(GET_NAZCANCEL)+') or (FK_NAZSOSID = '+IntToStr(GET_NEYAV)+'))';
//    end;
//  frxDBPrintList.DataSet := odsList_SortTimeVyp;
//  ods := TOracleDataSet.Create(nil);
//  try
//    ods.Session := os;
//    ods.Cursor := crSQLWait;
//    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE FROM DUAL ';
//    ods.Open;
//    GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
//    ods.DeleteVariables;
//    ods.Close;
//    if cxPrOtmena.EditValue = 1 then
//      begin
//	      ods.SQL.Text := ' SELECT COUNT(DISTINCT FK_PACID) AS CNT '+
//			                  '   FROM TNAZIS '+
//		                   	'  WHERE FK_ROOMID = :PFK_ROOMID '+
//		                   	'    AND FD_RUN >= :PFD_DATE AND FD_RUN < TO_DATE(:PFD_DATE)+1 ';
//      end else
//      begin
//	      ods.SQL.Text := ' SELECT COUNT(DISTINCT FK_PACID) AS CNT '+
//		                   	'   FROM TNAZIS '+
//	                  		'  WHERE FK_ROOMID = :PFK_ROOMID '+
//		                  	'    AND FK_NAZSOSID NOT IN (GET_NEYAV, GET_NAZCANCEL) '+
//	                   		'    AND FD_RUN >= :PFD_DATE AND FD_RUN < TO_DATE(:PFD_DATE)+1 ';
//      end;
//    ods.DeclareAndSet('PFK_ROOMID', otInteger, odsKab.FieldByName('FK_ID').AsInteger);
//    ods.DeclareAndSet('PFD_DATE', otDate, dxdeDate.Date);
//    ods.Open;
//    GET_COUNT_PAC := ods.FieldByName('CNT').AsInteger;
//  finally
//    ods.Free;
//  end;
//  if (odsKab.FieldByName('FK_ID').AsInteger = GET_XRAY_MAMMOGRAF) or (odsKab.FieldByName('is_flu').AsInteger = 1) then
//    frxPrintList1.ShowReport
//  else
//    frxPrintList.ShowReport;
end;

procedure TfrmMain.btnNevipClick(Sender: TObject);
var oq : TOracleQuery;
begin
	if Application.MessageBox('Вы собираетесь изменить статус исследования на "НЕ ВЫП."! Вы уверены?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
		begin
			oq := TOracleQuery.Create(nil);
			try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' BEGIN '+
                       ' UPDATE TNAZIS SET FK_NAZSOSID = GET_NEVIP WHERE FK_ID = :PFK_ID; '+
                       ' DELETE FROM VRES WHERE FK_NAZID = :PFK_ID; '+
                       ' DELETE FROM TRESIS WHERE FK_NAZID = :PFK_ID; '+
                       ' END; ';
        oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        if odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NAZCANCEL then
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' DELETE FROM TIB '+
                           '  WHERE FK_SMEDITID = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''GET_OTKAZ_RG_ISSL'') AND FK_PACID = :PFK_ID ';
            oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
            oq.Execute;
            frmMain.os.Commit;
          end;
        RefreshQuery(odsList);
      finally
        oq.Free;
      end;
    end;
end;

procedure InsTableIntoRVEditor ( vRichViewEdit : TRichViewEdit );
var
  table: TRVTableItemInfo;
begin

  //  table := TRVTableItemInfo.CreateEx( 0,0, rve.RVData);
  if CreateRVTableItemInfo(table, vRichViewEdit.rvData) then
  begin
    if vRichViewEdit.InsertItem('', table) then
    begin

    end;
  end;

end;

procedure InsColTableIntoRVEditor ( vRichViewEdit : TRichViewEdit );
var
  rve_temp: TCustomRichViewEdit;
  item: TCustomRVItemInfo;
  ItemNO: Integer;
  Data: Integer;
  table: TRVTableItemInfo;
begin
  if not vRichViewEdit.CanChange or
    not vRichViewEdit.GetCurrentItemEx(TRVTableItemInfo, rve_temp, item) then
    exit;
  table := TRVTableItemInfo(item);
  ItemNo := vRichViewEdit.GetItemNo(table);
  rve_temp.BeginItemModify(ItemNo, Data);
  Table.InsertColsRight(1);
  rve_temp.EndItemModify(ItemNo, Data);
  rve_temp.Change;
end;

procedure InsRowTableIntoRVEditor ( vRichViewEdit : TRichViewEdit );
var
  rve_temp: TCustomRichViewEdit;
  item: TCustomRVItemInfo;
  ItemNO: Integer;
  Data: Integer;
  table: TRVTableItemInfo;
begin
  if not vRichViewEdit.CanChange or
    not vRichViewEdit.GetCurrentItemEx(TRVTableItemInfo, rve_temp, item) then
    exit;
  table := TRVTableItemInfo(item);
  ItemNo := vRichViewEdit.GetItemNo(table);
  rve_temp.BeginItemModify(ItemNo, Data);
  Table.InsertRowsBelow(1);
  rve_temp.EndItemModify(ItemNo, Data);
  rve_temp.Change;
end;

procedure DelTableIntoRVEditor ( vRichViewEdit : TRichViewEdit );
begin

end;

procedure DelColTableIntoRVEditor ( vRichViewEdit : TRichViewEdit );
var
  rve_temp: TCustomRichViewEdit;
  item: TCustomRVItemInfo;
  ItemNO: Integer;
  Data: Integer;
  table: TRVTableItemInfo;
  r, c, cs, rs: Integer;
begin
  if not vRichViewEdit.CanChange or
    not vRichViewEdit.GetCurrentItemEx(TRVTableItemInfo, rve_temp, item) then
    exit;
  table := TRVTableItemInfo(item);
  ItemNo := vRichViewEdit.GetItemNo(table);
  rve_temp.BeginItemModify(ItemNo, Data);

  table.GetNormalizedSelectionBounds(True, r, c, cs, rs);
  if rs = table.Rows.Count then
  begin
    // deleting whole table
    rve_temp.SetSelectionBounds(ItemNo, 0, ItemNo, 1);
    rve_temp.DeleteSelection;
    exit;
  end;
  rve_temp.BeginUndoGroup(rvutModifyItem);
  rve_temp.SetUndoGroupMode(True);
  table.DeleteSelectedCols;
  // it's possible all-nil rows/cols appear after deleting
  table.DeleteEmptyRows;
  table.DeleteEmptyCols;
  rve_temp.SetUndoGroupMode(False);

  rve_temp.EndItemModify(ItemNo, Data);
  rve_temp.Change;
end;

procedure DelRowTableIntoRVEditor ( vRichViewEdit : TRichViewEdit );
var
  rve_temp: TCustomRichViewEdit;
  item: TCustomRVItemInfo;
  ItemNO: Integer;
  Data: Integer;
  table: TRVTableItemInfo;
  r, c, cs, rs: Integer;
begin
  if not vRichViewEdit.CanChange or
    not vRichViewEdit.GetCurrentItemEx(TRVTableItemInfo, rve_temp, item) then
    exit;
  table := TRVTableItemInfo(item);
  ItemNo := vRichViewEdit.GetItemNo(table);
  rve_temp.BeginItemModify(ItemNo, Data);

  table.GetNormalizedSelectionBounds(True, r, c, cs, rs);
  if rs = table.Rows.Count then
  begin // deleting whole table
    rve_temp.SetSelectionBounds(ItemNo, 0, ItemNo, 1);
    rve_temp.DeleteSelection;
    exit;
  end;
  rve_temp.BeginUndoGroup(rvutModifyItem);
  rve_temp.SetUndoGroupMode(True);
  table.DeleteSelectedRows;
  // it's possible all-nil rows/cols appear after deleting
  table.DeleteEmptyRows;
  table.DeleteEmptyCols;
  rve_temp.SetUndoGroupMode(False);

  rve_temp.EndItemModify(ItemNo, Data);
  rve_temp.Change;

end;

procedure UnionCellRVEditor ( vRichViewEdit : TRichViewEdit );
var
  rve_temp: TCustomRichViewEdit;
  item: TCustomRVItemInfo;
  ItemNO: Integer;
  Data: Integer;
  table: TRVTableItemInfo;
begin
  if not vRichViewEdit.CanChange or
    not vRichViewEdit.GetCurrentItemEx(TRVTableItemInfo, rve_temp, item) then
    exit;
  table := TRVTableItemInfo(item);
  ItemNo := vRichViewEdit.GetItemNo(table);
  rve_temp.BeginItemModify(ItemNo, Data);
  rve_temp.BeginUndoGroup(rvutModifyItem);
  rve_temp.SetUndoGroupMode(True);
  table.MergeSelectedCells(True);
  table.DeleteEmptyRows;
  table.DeleteEmptyCols;
  rve_temp.SetUndoGroupMode(False);
  rve_temp.EndItemModify(ItemNo, Data);
  rve_temp.Change;
end;

function GetTempDirectory: AnsiString;
var Buf: array[0..MAX_PATH - 1] of AnsiChar;
begin
  GetTempPath(SizeOf(Buf), @Buf);
  Result := IncludeTrailingBackslash(PChar(@Buf));
end;

procedure CmnHeadPartRep( pFrxReport : TFrxReport;
                          frxHTMLExport1: TfrxHTMLExport;
                          frxRTFExport1: TfrxRTFExport;
                          rveText: TRichViewEdit;
                         // pBeforePrintCallBack : TBeforePrintCallBack;
                          pFrxObjName:string = 'Memo8'
                        );
var vFileName, vFileName2, vDir, vDirMn : ansistring;
    vGetTickCount, vText8Tmp, vStr1, vStr2 : string;
    vStrMain, vStrText, vStrRes : TStringList;
    aBeforePrintCallBack: TBeforePrintCallBack;
    vPos,i,j:integer;
begin
  vDirMn:=GetCurrentDir;
  vDir:= GetTempDirectory; // 'd:\fastreport_test\';
  SetCurrentDir(vDir);
  vGetTickCount := inttostr(GetTickCount);
  If not DirectoryExists(vGetTickCount) then CreateDir(vGetTickCount);
  vDir:=vDir+vGetTickCount+'\';
  vFileName := vDir+vGetTickCount+'.html';  // ExtractFilePath(paramstr(0))
  vFileName2 := vDir+vGetTickCount+'1.html';
  frxHTMLExport1.FileName:=vFileName;

//showmessage('2 seek '+pFrxObjName+' in '+pFrxReport.Name);
  try
    vText8Tmp:=(pFrxReport.FindObject(pFrxObjName) as TfrxMemoView).Text;
  except
  on E:Exception do
    begin
      ShowMessage('ERROR (Надо поменять название объекта в отчете) '+E.Message+' seek '+pFrxObjName+' in '+pFrxReport.Name);
      Exit;
    end;
  end;
  (pFrxReport.FindObject(pFrxObjName) as TfrxMemoView).Text := cTmpStrRepl;


//  pFrxReport.ShowReport;
//  (pFrxReport.FindObject('Page1') as TfrxReportPage).LeftMargin := 0;
  try
    pFrxReport.PrepareReport(True);
  except
  on E:Exception do
    begin
    //  pFrxReport.PrepareReport(True);
      ShowMessage('ERROR : '+E.Message+' in report : '+pFrxObjName);
      Exit;
    end;
  end;

  pFrxReport.Export( frxHTMLExport1 );
  //pFrxReport.Export( frxRTFExport1 );
  (pFrxReport.FindObject(pFrxObjName) as TfrxMemoView).Text := vText8Tmp;
  rveText.SaveHTMLEx(vFileName2, '', 'img', '', '', '', [rvsoOverrideImages, rvsoUTF8, rvsoMiddleOnly, rvsoInlineCSS]);
  //rveText.SaveHTML(vFileName2, '', 'img', [rvsoOverrideImages, rvsoUTF8, rvsoMiddleOnly] );

    vStrMain := TStringList.Create;
    vStrText := TStringList.Create;
    vStrRes  := TStringList.Create;
    try
      vStrMain.LoadFromFile(vFileName);
      vStrText.LoadFromFile(vFileName2);
      for I := 0 to vStrMain.Count - 1 do
      begin
        vPos:=Pos(cTmpStrRepl,vStrMain[i]);
        if vPos>0 then
        begin
          vStr1:=Copy(vStrMain[i],0,vPos-1);
          vStr2:=Copy(vStrMain[i],vPos+Length(cTmpStrRepl));
          vStrRes.Append(vStr1);
          for j := 0 to vStrText.Count - 1 do
            vStrRes.Append(vStrText[j]);
          vStrRes.Append(vStr2);
        end else
          vStrRes.Append(vStrMain[i]);
      end;
    finally
      vStrRes.SaveToFile(vFileName);
      vStrMain.Free;
      vStrText.Free;
      vStrRes.Free;
    end;     

    //vFileName := 'c:\Users\Softmaster\AppData\Local\Temp\11024809\11024809.html';

  //  showmessage('uPrintType.vLeftMargin = '+inttostr(uPrintType.vLeftMargin));

    uPrintType.vLeftMargin:=20;
    uPrintType.vRightMargin:=10;
    uPrintType.vGutter := 0;
    uPrintType.vTopMargin:=0;
    uPrintType.vBottomMargin:=0;
    uPrintType.vSetGutter := True;
    DoPrintDocument( vFileName,                      // sCurFile: string;
                     -1,                              // FormatPr: Integer = 0;
                     False,                          // bLandscape: Boolean = false;
                     False,                          // pPreview: boolean = false;
                     TBeforePrintCallBack(nil),      //
                     1,                              // KolvoCopy: Integer = 1;
                     True,                           // AShowWord: boolean = false; //показывать ворд без предпросмотра, по просьбе Ковалевой 28.05.2012 Melnikov
                     false,                          // SetPassWord : boolean = TRUE; //Устанавливать пароль или нет
                     false                           // SetMarginTop: boolean = FALSE;
                                                     // APaperSize : integer = 7
                   );    //  pBeforePrintCallBack
    uPrintType.vLeftMargin:=0;
    uPrintType.vRightMargin:=0;
    uPrintType.vGutter := 0;
    uPrintType.vTopMargin:=0;
    uPrintType.vBottomMargin:=0;
    uPrintType.vSetGutter := False;

    SetCurrentDir(vDirMn);
   { try
      if DirectoryExists(vDir) then
        RemoveDir(vDir);
    except end; }
end;

function TfrmMain.chkNazHeal ( pPacID, pNazID : integer ) : Boolean;
var vQr : TOracleQuery;
const cTYPEDOC_NAL = 21;
begin
  vQr := TOracleQuery.Create(nil);
  try
    vQr.Session := os;
    vQr.SQL.Text := 'select case when (asu.is_ambulance(:pFK_PACID) = 1) AND ' + #13#10 +
                    '                    (exists(select 1 from asu.tambtalon t, asu.tambtalon_naz an where t.fk_id = an.fk_talonid and an.fk_nazid = :pNazID))' + #13#10 +
                    '            then (select max(i.fk_typedocid)' + #13#10 +
                    '                    from asu.tambtalon t,' + #13#10 +
                    '                         asu.tambtalon_naz an,' + #13#10 +
                    '                         asu.tinsurdocs i' + #13#10 +
                    '                   where t.fk_id = an.fk_talonid' + #13#10 +
                    '                     and t.fk_insuranceid = i.fk_id' + #13#10 +
                    '                     and an.fk_nazid = :pNazID' + #13#10 +
                    '                 )' + #13#10 +
                    '            else (select max(i.fk_typedocid)' + #13#10 +
                    '                    from asu.tpac_insurance pi,' + #13#10 +
                    '                         asu.tinsurdocs i' + #13#10 +
                    '                   where pi.fk_insurdocid = i.fk_id' + #13#10 +
                    '                     and pi.fk_pacid = :pFK_PACID' + #13#10 +
                    '                 )' + #13#10 +
                    '       end AS HT' + #13#10 +
                    '  from dual';
    vQr.DeclareAndSet('pFK_PACID', otInteger, pPacID);
    vQr.DeclareAndSet('pNazID', otInteger, pNazID);
    vQr.Execute;

    Result := uDBTableUtils.TDBUtils.GetFunctionDef('get_typedoc_nal', os, cTYPEDOC_NAL) = vQr.FieldAsInteger('HT') ;

  finally
    vQr.Free;
  end;

end;

end.
