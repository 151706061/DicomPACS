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
  DBCtrls, Registry, jpeg, word2000, StdCtrls, cxTextEdit, cxContainer, cxCheckBox, Clipbrd,
  cxImageComboBox, dxPScxGrid6Lnk, cxMaskEdit, cxDropDownEdit,
  cxCalendar, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, JclFileUtils,
  dxSkinsdxBarPainter, cxBarEditItem, dxBarExtItems, uGlobalConst, SMMainAPI,
  cxLabel, HL7Sender, uigTranslit, uMD5, 
  cxInplaceContainer;

type
  TFreePlugin = function(): LongInt; stdcall;
  TfrmMain = class(TForm)
    os: TOracleSession;
    ilMain: TImageList;
    alMain: TActionList;
    aClose: TAction;
    dsKab: TDataSource;
    odsKab: TOracleDataSet;
    aRefresh: TAction;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    paKab: TPanel;
    cxGrKab: TcxGrid;
    TVKab: TcxGridDBTableView;
    VNAME: TcxGridDBColumn;
    cxGrKabLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    Panel1: TPanel;
    cxGr: TcxGrid;
    TVList: TcxGridDBTableView;
    TVListFIO: TcxGridDBColumn;
    TVListDATEROJD: TcxGridDBColumn;
    TVListAGE: TcxGridDBColumn;
    TVListDS: TcxGridDBColumn;
    TVListDATERUN: TcxGridDBColumn;
    TVListNAZ: TcxGridDBColumn;
    TVListPARAM: TcxGridDBColumn;
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
    N2: TMenuItem;
    aInfo: TAction;
    odsListPEPLID: TFloatField;
    TVSTATE: TcxGridDBColumn;
    odsListSTATE: TStringField;
    VTIME_ISL: TcxGridDBColumn;
    odsListTIME_ISL: TStringField;
    TVSOS: TcxGridDBColumn;
    TVSEX: TcxGridDBColumn;
    odsListSEX: TStringField;
    aPreview: TAction;
    odsListFK_ROOMID: TIntegerField;
    aEditNaz: TAction;
    stRep: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    TVOTDEL: TcxGridDBColumn;
    odsListOTDEL: TStringField;
    odsListFC_TYPE: TStringField;
    TVTYPENAZ: TcxGridDBColumn;
    TVFK_NAZTYPE: TcxGridDBColumn;
    odsListFK_NAZTYPEID: TFloatField;
    TVDATENAZ: TcxGridDBColumn;
    aNaprav: TAction;
    odsListIS_AMBULANCE: TFloatField;
    odsListVIDLECH: TStringField;
    aDelete: TAction;
    odsListFK_VRACHID: TFloatField;
    aSearch: TAction;
    frxDBPrintList: TfrxDBDataset;
    N3: TMenuItem;
    aCopyFio: TAction;
    odsListRUNTIME: TDateTimeField;
    TVREANIM: TcxGridDBColumn;
    ilreanim: TImageList;
    odsListIS_REANIM: TFloatField;
    odsListFK_DOCID: TFloatField;
    odsListNUMBERISSL: TStringField;
    VNUMISSL: TcxGridDBColumn;
    odsListNUMBERPROTOCOL: TStringField;
    VNUMPROTOCOL: TcxGridDBColumn;
    VNUMFLU1: TcxGridDBColumn;
    frxPrintList: TfrxReport;
    odsListISSL_TARGET: TStringField;
    odsListFD_RUN: TStringField;
    actPrintFio: TAction;
    actPrintDateNaz: TAction;
    odsList_SortFIO: TOracleDataSet;
    odsList_SortDateNaz: TOracleDataSet;
    pmPrint: TPopupMenu;
    MenuItem1: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    actDolg: TAction;
    odsPrintDez: TOracleDataSet;
    actPrintDez: TAction;
    N4: TMenuItem;
    odsListFD_NAZ_STR: TStringField;
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
    aZakl: TAction;
    VCNTTUB: TcxGridDBColumn;
    odsListCNTTUB: TFloatField;
    ilCntTub: TImageList;
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxdeDate: TcxBarEditItem;
    cxPrOtmena: TcxBarEditItem;
    paDate: TPanel;
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
    TextDate: TcxStyle;
    dxBarDockControl2: TdxBarDockControl;
    BMBar2: TdxBar;
    bbRefresh: TdxBarButton;
    bbInfo: TdxBarButton;
    bbSearch: TdxBarButton;
    bbNaprav: TdxBarButton;
    bbDolg: TdxBarButton;
    bbDel: TdxBarButton;
    bbZakl: TdxBarButton;
    bbCancel: TdxBarButton;
    bbPrint: TdxBarButton;
    bbClose: TdxBarButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    bbBase: TdxBarButton;
    aBase: TAction;
    odsListFLU_NUM: TFloatField;
    aHide: TAction;
    aShow: TAction;
    stBold: TcxStyle;
    aSysInfo: TAction;
    stDoza: TcxStyle;
    odsCntOut: TOracleDataSet;
    VList_RESULTID: TcxGridDBColumn;
    odsListFK_RESULTID: TFloatField;
    HL7Sender1: THL7Sender;
    N5: TMenuItem;
    aWLM: TAction;
    aCompare: TAction;
    aUnCompare: TAction;
    WL1: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    aCorrectPac: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    odsListKardio: TOracleDataSet;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    DateTimeField4: TDateTimeField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    StringField18: TStringField;
    StringField19: TStringField;
    DateTimeField5: TDateTimeField;
    FloatField17: TFloatField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    FloatField18: TFloatField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    IntegerField2: TIntegerField;
    StringField26: TStringField;
    StringField27: TStringField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    StringField28: TStringField;
    FloatField21: TFloatField;
    DateTimeField6: TDateTimeField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    odsListFC_TALON_COMMENT: TStringField;
    odsListKardioFC_TALON_COMMENT: TStringField;
    VListTalonComment: TcxGridDBColumn;
    aAddTalonInfo: TAction;
    N12: TMenuItem;
    bbEditNaz: TdxBarLargeButton;
    aSendToWL: TAction;
    N13: TMenuItem;
    N14: TMenuItem;
    odsGuid: TOracleDataSet;
    odsPrintDezFK_ID: TFloatField;
    odsPrintDezFK_NAZSOSID: TFloatField;
    odsPrintDezFD_NAZ_STR: TStringField;
    odsPrintDezFIOPAC: TStringField;
    odsPrintDezSEX: TStringField;
    odsPrintDezFD_ROJD: TDateTimeField;
    odsPrintDezOTDEL: TStringField;
    odsPrintDezFC_NAME: TStringField;
    odsPrintDezFC_DIAG: TStringField;
    odsPrintDezSTATE: TStringField;
    odsPrintDezISSL_TARGET: TStringField;
    odsPrintDezFD_RUN: TStringField;
    odsList_SortDateNazFK_ID: TFloatField;
    odsList_SortDateNazFK_NAZSOSID: TFloatField;
    odsList_SortDateNazFD_NAZ_STR: TStringField;
    odsList_SortDateNazFD_RUN: TStringField;
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
    odsList_SortFIOFD_RUN: TStringField;
    odsList_SortFIOFIOPAC: TStringField;
    odsList_SortFIOSEX: TStringField;
    odsList_SortFIOFD_ROJD: TDateTimeField;
    odsList_SortFIOOTDEL: TStringField;
    odsList_SortFIOFC_NAME: TStringField;
    odsList_SortFIOFC_DIAG: TStringField;
    odsList_SortFIOSTATE: TStringField;
    odsList_SortFIOISSL_TARGET: TStringField;
    odsListFD_RUN_STR: TStringField;
    bbDolgTalon: TdxBarButton;
    aDolgTalon: TAction;
    fc_accessionnumber: TStringField;
    FC_accessionnumberCardio: TStringField;
    VFC_accessionnumber: TcxGridDBColumn;
    odsListfc_an: TStringField;
    odsListKardioFC_AN: TStringField;
    odsListUnCito: TOracleDataSet;
    odsListCito: TOracleDataSet;
    odsListARCHIVED: TStringField;
    odsListKardioFD_RUN_STR: TStringField;
    odsListKardioARCHIVED: TStringField;
    VNUMBERPROTOCOL: TcxGridDBColumn;
    VLABNAME: TcxGridDBColumn;
    Vfc_an: TcxGridDBColumn;
    VFK_NAZSOSID: TcxGridDBColumn;
    grdbtvID: TcxGridDBColumn;
    odsListKardioUnKabinet: TOracleDataSet;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField2: TDateTimeField;
    FloatField6: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField7: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    IntegerField1: TIntegerField;
    StringField9: TStringField;
    StringField10: TStringField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    StringField11: TStringField;
    FloatField10: TFloatField;
    DateTimeField3: TDateTimeField;
    FloatField11: TFloatField;
    FloatField27: TFloatField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    FloatField30: TFloatField;
    StringField17: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    StringField36: TStringField;
    StringField37: TStringField;
    grdbtvis_amb: TcxGridDBColumn;
    procedure aCloseExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure odsKabAfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure odsListAfterScroll(DataSet: TDataSet);
    procedure TVListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure N2Click(Sender: TObject);
    procedure frx30GetValue(const VarName: String; var Value: Variant);
    procedure odsKabBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure aPreviewExecute(Sender: TObject);
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
    procedure aNapravExecute(Sender: TObject);
    procedure TVListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TVKabDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TVListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure aDeleteExecute(Sender: TObject);
    procedure aSearchExecute(Sender: TObject);
    procedure frxPrintListGetValue(const VarName: String;
      var Value: Variant);
    procedure aCopyFioExecute(Sender: TObject);
    procedure TVListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure odsKabAfterOpen(DataSet: TDataSet);
    procedure actPrintFioExecute(Sender: TObject);
    procedure actPrintDateNazExecute(Sender: TObject);
    procedure odsList_SortFIOBeforeOpen(DataSet: TDataSet);
    procedure odsList_SortDateNazBeforeOpen(DataSet: TDataSet);
    procedure actDolgExecute(Sender: TObject);
    procedure odsPrintDezBeforeOpen(DataSet: TDataSet);
    procedure actPrintDezExecute(Sender: TObject);
    procedure TVListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure aPrintKabExecute(Sender: TObject);
    procedure aTextKabExecute(Sender: TObject);
    procedure aWebKabExecute(Sender: TObject);
    procedure aXMLKabExecute(Sender: TObject);
    procedure aXLSKabExecute(Sender: TObject);
    procedure frxRepKabGetValue(const VarName: string; var Value: Variant);
    procedure aZaklExecute(Sender: TObject);
    procedure dxdeDateChange(Sender: TObject);
    procedure cxPrOtmenaPropertiesEditValueChanged(Sender: TObject);
    procedure aBaseExecute(Sender: TObject);
    procedure aHideExecute(Sender: TObject);
    procedure aShowExecute(Sender: TObject);
    procedure aSysInfoExecute(Sender: TObject);
    procedure aCompareExecute(Sender: TObject);
    procedure aUnCompareExecute(Sender: TObject);
    procedure aWLMExecute(Sender: TObject);
    procedure HL7Sender1ACKResponse(Sender: TObject);
    procedure aCorrectPacExecute(Sender: TObject);
    procedure odsListAfterOpen(DataSet: TDataSet);
    procedure aAddTalonInfoExecute(Sender: TObject);
    procedure aSendToWLExecute(Sender: TObject);
    procedure aDolgTalonExecute(Sender: TObject);
    procedure Vfc_anGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure VNUMFLU1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure VNUMPROTOCOLGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVKabCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    FileVersion : string;
    sSortType : String;
    DateB, DateE : TDate;
    idKabToDrag, idStatusToDrag, idNazToDrag : Integer; // для перетаскивания исследований между кабинетами
    procedure DoRefreshSmidConst;
    procedure CheckEnabledButons;
    procedure DateChange;
    procedure DoPrintJournal(sType : string; pDataSet : TOracleDataSet = nil);
    { Private declarations }
  public
    nEditDaysOtdel : Integer;
    get_sum_doza, get_kolvo_raspred, get_dicomwl_port : Integer;
    get_dicomwl_ip, get_use_wl : string;
    get_id_profilaktika : Integer;
    get_doc_ambul : Integer;
    get_show_work, get_show_add, get_eng_num, get_def_konsult, get_ambtalon_xray, get_num_not_empty, get_def_thismk, get_lookinside,
    get_lookinside_ip, get_lookinside_port, get_lookinside_login, get_lookinside_pass, get_lookinside_portweb, get_lookinside_archae,
    get_lookinside_portsend, get_lookinside_portrec, get_lookinside_hl7ip, get_show_agreepac, get_show_speed, get_agree_pacient,
    get_show_addtaloninfo, get_show_onhand, get_disable_time : String;
    get_can_change_vrach, list_xray_curr_vrach_as_owner,
    get_autogenAccNmb, get_CheckDoza, get_CheckAmmSnimki,
    USE_METODICS_IN_NAZN, xray_chkUniqAccNmb : integer;
    get_xray_mrt : Integer;
    Russian, Latin : HKL;
    MedotradeSign : string;
    bIsAdmin : Integer; // входит ли пользователь в группу "Администраторы" (1 - входит, 0 - нет)
    GET_DB_NAME : String;
    GET_PROPISKAID : Integer; // Тип адреса 61 по регистрации
    get_registid : Integer; // Тип адреса 63 фактического проживания
    GET_SYSTEMDATE : TDate;
    sSotrFIO : String; // ФИО пользователя, вошедшего в программу
    sCompanyName_4Rep : String;
    sOtdelName_4Rep : String;
    GET_SYSDATE_4REP : String;
    GET_COUNT_PAC : Integer;
    pSOTRID : Integer;
    pAPPSOTRID : Integer;
    pOTDELID : Integer;
    pSPEC : Integer;
    GET_REGISTRATOR_FLUORO : Integer;
    GET_XRAY_MRTKAB : Integer;
    GET_ISSL_FLU : Integer;
    GET_XRAY_MAMMOGRAF, GET_XRAY_MAMMOGRAF2 : Integer;
    GET_XRAY_ARHIVARIUS : Integer;
    Update : Boolean;
    IDNaz : Integer;
    procedure DoShowForm;
    procedure SetColVisibility;
  end;

var
  frmMain: TfrmMain;
  get_nazcancel, get_vipnaz, get_labvip, get_nevip, get_nazplan, get_recomend, get_nazextra, get_neyav,
  get_rad_gamma, get_rad_petct, get_radio_otdel, list_xray_cito, GET_XRAYS_OTDEL : Integer;
  xray_vrach_shownumber, rgreg_hide_last_fluoro, USE_ONE_ACCESSIONNUMBER,
  list_visible_row_allkabinet : Integer;
  CAN_UPDATE_NAZ_SMID: Boolean = False;
  v_db_lpu : string;

function gen_accnmb_grpid( p_is_flu:Boolean=False ) : string;

implementation

uses fOtmena, fPacInfo, fSetNaz, fLabNaprav, fSearchLab, fEditNaz, uDBTableUtils,
     fLabNapravFlu, fDolg, fProsmotrZakl, fProsmotrZaklFlu, fAllHistory, fSysInfo,
     fCompare, fCorrectPac, fAddTalonInfo, fNaprRad, fDolgTalon;
{$R *.dfm}

procedure TfrmMain.SetColVisibility;
begin
  //-- Отправка на WL
  aSendToWL.Visible := (odsList.RecordCount <> 0) and (get_use_wl = '-1');
  //
  VNUMBERPROTOCOL.Visible:= xray_vrach_shownumber = 1;
  VNUMBERPROTOCOL.VisibleForCustomization := xray_vrach_shownumber = 1;
  vFC_accessionnumber.visible := xray_vrach_shownumber = 0;// GET_DB_NAME <> 'H';
  vFC_accessionnumber.VisibleForCustomization := xray_vrach_shownumber = 0;// GET_DB_NAME <> 'H';

  if odsKab.FieldByName('is_flu').AsInteger = 1 then
    begin
      VNUMFLU1.Visible := True;
      VNUMPROTOCOL.Visible := False;
    end else
    begin
      VNUMFLU1.Visible := False;
      VNUMPROTOCOL.Visible := True;
    end;
 // VNUMFLU1.Visible := False;
 // VNUMPROTOCOL.Visible := False;

  VNUMBERPROTOCOL.Visible :=  False ;
  vFC_accessionnumber.Visible := False ;

  VLABNAME.Visible := False ;
  VLABNAME.VisibleForCustomization := False ;
  if USE_ONE_ACCESSIONNUMBER=1 then
  begin
    Vfc_an.Visible := False; // True ;
    Vfc_an.VisibleForCustomization := False; // True ;
    if odsKab.FieldByName('is_flu').AsInteger = 1 then begin
      Vfc_an.Caption := '№ записи';
      VLABNAME.Visible := False ;
      VLABNAME.VisibleForCustomization := False ;
    end else begin
      Vfc_an.Caption := '№ протокола';
    //  VLABNAME.Visible := True ;
    //  VLABNAME.VisibleForCustomization := True ;
    end;
  //  vFC_accessionnumber.Visible := False ;
  //  vFC_accessionnumber.VisibleForCustomization := False ;
  //  VNUMBERPROTOCOL.Visible :=  False ;
  //  VNUMBERPROTOCOL.VisibleForCustomization :=  False ;
  end else begin
    Vfc_an.Visible := False ;
    Vfc_an.VisibleForCustomization := False ;
  //  vFC_accessionnumber.Visible := True ;
  //  vFC_accessionnumber.VisibleForCustomization := True ;
  //  VNUMBERPROTOCOL.Visible :=  True ;
  //  VNUMBERPROTOCOL.VisibleForCustomization :=  True ;
  end;
end;

function gen_accnmb_grpid( p_is_flu:Boolean=False ) : string;
begin
  with TOracleQuery.Create(nil) do
    try
      Session:=frmMain.os;
      SQL.Text:='select MED.SEQ_TACCESSIONNMB.NEXTVAL as nmb from dual';
      Execute;
      Result:=IntToStr(FieldAsInteger('nmb'));
    finally
      Close;
      Free;
    end;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
var id : Integer;
begin
  if (list_visible_row_allkabinet = 1) and (odsKab.FieldByName('fk_id').asinteger = -1) then
   begin
    dsList.DataSet := odsListKardioUnKabinet;
    odsListKardioUnKabinet.DisableControls;
    id := odsListKardioUnKabinet.FieldByName('FK_ID').AsInteger;
    odsListKardioUnKabinet.Close;
    odsListKardioUnKabinet.SetVariable('pispol', pSOTRID);
    odsListKardioUnKabinet.SetVariable('PFD_DATE', dxdeDate.EditValue);
    odsListKardioUnKabinet.Open;
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
    odsList.SetVariable('PFD_DATE', dxdeDate.EditValue);
    if list_xray_cito > 0 then
    begin
      if list_xray_cito = odsKab.fieldbyname('fk_id').asinteger then
      begin
        odsList.sql.text := odsListCito.sql.text;
      end
      else begin
        odsList.sql.text := odsListUnCito.sql.text;
      end;
    end;
    odsList.Open;
    odsList.EnableControls;
    odsList.Locate('FK_ID', id, []);
   end;
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Reg : TRegIniFile;
    id, vConstClrGrid, vClrGrid : Integer;
    vKeyStr : string;
begin
  ods := TOracleDataSet.Create(nil);
  try
    frmMain.Show;
    DoRefreshSmidConst;
    //
    if not TryStrToInt( paramstr(1), pAPPSOTRID ) then
    begin
      ShowMessage('Ошибка авторизации при запуске модуля лаборант ...');
      Application.Terminate;
    end;
     // pAPPSOTRID := 0 ; // StrToInt(paramstr(1));
    //
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID, ASU.DO_VRACHFIO(FK_SOTRID) AS SOTRFIO, '+#13+
                    '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                    '        (SELECT FC_NAME '+#13+
                    '           FROM asu.TOTDEL '+#13+
                    '          WHERE FK_ID = (SELECT FK_OTDID FROM asu.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME, '+#13+
                    '        ASU.GET_ADMINS_FOR_XRAY(FK_SOTRID) AS IS_ADMIN '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    //
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    vKeyStr := '\Software\Softmaster\List_Lab\ID_SOTR'+IntToStr(pSOTRID) ;
    //
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
    sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
    sSotrFIO := ods.FieldByName('SOTRFIO').AsString;
    bIsAdmin := ods.FieldByName('IS_ADMIN').AsInteger;
    aCorrectPac.Visible := bIsAdmin = 1;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_otdelid, fk_spravid from asu.tsotr where fk_id = :pfk_id ';
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
      //
      if not TryStrToInt( ods.FieldByName('fc_value').AsString, nEditDaysOtdel ) then
        nEditDaysOtdel := 0 ; // StrToInt(paramstr(1));
      //
    //  nEditDaysOtdel := StrToInt(ods.FieldByName('fc_value').AsString);

//-- главный запрос для Кардио + колонка Комментарий
    if get_db_name = 'SK' then
      begin
        odsList.SQL.Text := odsListKardio.SQL.Text;
        VListTalonComment.Visible := True;
        VListTalonComment.VisibleForCustomization := True;
      end;

    try
      list_visible_row_allkabinet := TDBUtils.GetConstantDef('list_visible_row_allkabinet',os,0);
    except
      list_visible_row_allkabinet := 0;
    end;

    odsKab.AfterScroll := nil;
    if list_visible_row_allkabinet = 1 then
     odsKab.SetVariable('pAllKabRow','select -1 as fk_id, ''Все кабинеты'' as fc_name, -1 as fn_order,null fc_phone,null is_flu,null nameapparat, null aetitle from dual union all ');
    odsKab.Open;
    Reg:=TRegIniFile.Create;
    try
      Reg.RootKey:=HKEY_CURRENT_USER;
      Reg.OpenKey(vKeyStr, True); // !!! это что такое??? проверить во всех проектах!
      id := Reg.ReadInteger(vKeyStr, 'ID_OTMENA', 0);
      case id of
        1: cxPrOtmena.EditValue := 1; // показывать отмененные
        0: cxPrOtmena.EditValue := 0;
      end;
      cxPrOtmenaPropertiesEditValueChanged(nil);
      id := Reg.ReadInteger(vKeyStr, 'ID_KABINET', 0);
      if id <> 0 then
        odsKab.Locate('FK_ID', id, []);

      odsKab.AfterScroll := odsKabAfterScroll;
      try
        dxdeDate.EditValue := GET_SYSTEMDATE;
      except
        ShowMessage('null sysdate '+DateToStr(GET_SYSTEMDATE) );
      end;
      frmMain.Caption := '';
      frmMain.Caption := 'АРМ "Лаборант"('+FileVersion+'). '+'Пользователь: '+sSotrFIO+ '; Кабинет: '+odsKab.FieldByName('FC_NAME').AsString;
      cxGr.SetFocus;
      MedotradeSign := ReadMedotradeSign;
      TVList.StoreToRegistry('\SoftWare\SoftMaster\List_xrays_lab\TVListVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TVList');
      TVList.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_lab\TVListVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TVList');
      //
      vConstClrGrid:=1; // если нужно еще раз очистить колонки grid - изменить значение !!!
      vClrGrid := Reg.ReadInteger(vKeyStr, 'CLR_TVLIST', 0);
      if vClrGrid<>vConstClrGrid then
      begin
        TVList.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_lab\TVList'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TVList');
        SetColVisibility;
        Reg.WriteInteger(vKeyStr, 'CLR_TVLIST',vConstClrGrid);
      end;
      //
    finally
      Reg.Free;
    end;

    DoRefreshSmidConst;
    SetColVisibility;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.dxdeDateChange(Sender: TObject);
begin
  DateChange;
  aRefreshExecute(nil);
end;

procedure TfrmMain.odsKabAfterScroll(DataSet: TDataSet);
var is_flu : integer;
begin
  aRefreshExecute(Self);
  frmMain.Caption := '';
  frmMain.Caption := 'АРМ "Лаборант"('+FileVersion+'). '+'Пользователь: '+sSotrFIO+ '; Кабинет: '+odsKab.FieldByName('FC_NAME').AsString;
  SetColVisibility;
  if GET_DB_NAME = 'H' then
   begin
     try
       is_flu := odsKab.FieldByName('is_flu').AsInteger;
     except
       is_flu:=0;
     end;


    if is_flu = 1 then
      begin
        VNUMFLU1.Visible := True;
        VNUMPROTOCOL.Visible := False;
      end
    else
      begin
        VNUMFLU1.Visible := False;
        VNUMPROTOCOL.Visible := True;
      end;
   end
  else
   begin
    VNUMFLU1.Visible := False;
    VNUMPROTOCOL.Visible := False;
   end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
//------------------------------------------------------------------------------
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\List_Lab\', FALSE) then
   begin
     Reg.CreateKey('\Software\Softmaster\List_Lab');
   end;
  try
    Reg.WriteInteger('\Software\Softmaster\List_Lab'+'\ID_SOTR'+IntToStr(pSOTRID), 'ID_KABINET', odsKab.FieldByName('FK_ID').AsInteger);
    Reg.WriteInteger('\Software\Softmaster\List_Vrach'+'\ID_SOTR'+IntToStr(pSOTRID), 'ID_OTMENA',  cxPrOtmena.EditValue);
  except
  end;
  Reg.Free;
//------------------------------------------------------------------------------
  TVList.StoreToRegistry('\SoftWare\SoftMaster\List_xrays_lab\TVList'+'Vrach'+ '_' + IntToStr(pSOTRID), TRUE, [], 'TVList');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
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

procedure TfrmMain.aUnCompareExecute(Sender: TObject);
var s1, sGuid : string;
    ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select fk_risguid from asu.txrayguid where fk_nazid = :pfk_nazid ';
    ods.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('fk_id').AsInteger);
    ods.Open;
    sGuid := ods.FieldByName('fk_risguid').AsString;
  finally
    ods.Free;
  end;
  Application.CreateForm(TfrmCompare, frmCompare);
  try
    s1 := 'http://'+get_lookinside_ip+':'+get_lookinside_portweb+'/unbind.html?'+
          'his_id='+IntToStr(odsList.FieldByName('fk_id').AsInteger)+'&'+
          'dcm_study_uid='+sGuid+'&'+
          'hash='+uMD5.MD5DigestToStr(MD5String(get_lookinside_login+get_lookinside_pass));
    frmCompare.wbCompare.Navigate(s1);
    frmCompare.ShowModal;
    RefreshQuery(odsList);
  finally
    frmCompare.Free;
  end;
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

procedure TfrmMain.aWLMExecute(Sender: TObject);
var s, sSex, sGroup, sGuid : string;
    ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select asu.get_smidname(fk_default) as namegroup from asu.tsmid where fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_smid').AsInteger);
    ods.Open;
    sGroup := ods.FieldByName('namegroup').AsString; // группа исследования
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_guid from asu.txrayguid where fk_nazid = :pfk_nazid ';
    ods.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('fk_id').AsInteger);
    ods.Open;
    sGuid := ods.FieldByName('fk_guid').AsString; // "наш" guid исследования
  finally
    ods.Free;
  end;
  //
  try
    HL7Sender1.Port := StrToInt(frmMain.get_lookinside_portsend);
  except
    HL7Sender1.Port := 0 ;
  end;
 // HL7Sender1.Port := StrToInt(frmMain.get_lookinside_portsend);
  HL7Sender1.Host := frmMain.get_lookinside_hl7ip;

  if odsList.FieldByName('sex').AsString = 'М' then
    sSex := 'M'
  else
    sSex := 'F';

  if odsList.FieldByName('fk_resultid').AsInteger = -1 then // если исследование еще не добавлено на WLM, то добавляем, иначе изменяем
    begin
      s := 'MSH|^~\&|||||||ORM^O01|||2.3|'+#13#10+
           'PID||'+IntToStr(odsList.FieldByName('fk_pacid').AsInteger)+'|||'+CyrToLatGOST(odsList.FieldByName('fiopac').AsString)+'||'+FormatDateTime('yyyymmdd', odsList.FieldByName('fd_rojd').AsDateTime)+'|'+sSex+'||||||||||||||||||||'+#13#10+
           'PV1||||||||'+CyrToLatGOST(odsList.FieldByName('vrachfio').AsString)+'|||||||||||||||||||||||||||||||||||||'+#13#10+ // назначивший врач, лаборант, сотрудник
           'ORC|NW||||||^^^'+FormatDateTime('yyyymmddhhmmss', odsList.FieldByName('runtime').AsDateTime)+'||||||'+#13#10+
           'OBR||||'+IntToStr(odsList.FieldByName('fk_id').AsInteger)+'^'+CyrToLatGOST(AnsiUpperCase(odsList.FieldByName('fc_name').AsString))+'^'+AnsiUpperCase(frmMain.odsKab.FieldByName('aetitle').AsString)+'^'+CyrToLatGOST(sGroup)+'||||||||||||||||||||||||'+#13#10+
           'ZDS|'+sGuid+'^^Application^DICOM|';
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update asu.tnazis set fk_resultid = 1 where fk_id = :pfk_id '; // проставляем статус "Исследование отправлено на WLM"
        oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
      finally
        oq.Free;
      end;
    end else
    begin
      s := 'MSH|^~\&|||||||ORM^O01|||2.3|'+#13#10+
           'PID||'+IntToStr(odsList.FieldByName('fk_pacid').AsInteger)+'|||'+CyrToLatGOST(odsList.FieldByName('fiopac').AsString)+'||'+FormatDateTime('yyyymmdd', odsList.FieldByName('fd_rojd').AsDateTime)+'|'+sSex+'||||||||||||||||||||'+#13#10+
           'PV1||||||||'+CyrToLatGOST(odsList.FieldByName('vrachfio').AsString)+'|||||||||||||||||||||||||||||||||||||'+#13#10+ // назначивший врач, лаборант, сотрудник
           'ORC|XO||||SC||^^^'+FormatDateTime('yyyymmddhhmmss', odsList.FieldByName('runtime').AsDateTime)+'||||||'+#13#10+
           'OBR||||'+IntToStr(odsList.FieldByName('fk_id').AsInteger)+'^'+CyrToLatGOST(AnsiUpperCase(odsList.FieldByName('fc_name').AsString))+'^'+AnsiUpperCase(frmMain.odsKab.FieldByName('aetitle').AsString)+'^'+CyrToLatGOST(sGroup)+'||||||||||||||||||||||||'+#13#10+
           'ZDS|'+sGuid+'^^Application^DICOM|';
    end;
  HL7Sender1.SendMessage(s); // отправляем сообщение
  RefreshQuery(odsList);  
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

procedure TfrmMain.aZaklExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  if odsKab.FieldByName('is_flu').AsInteger = 1 then
    begin
      Application.CreateForm(TfrmProsmotrZaklFlu, frmProsmotrZaklFlu);
      frmProsmotrZaklFlu.rowNum.Properties.Value := odsList.FieldByName('FLU_NUM').AsString;
      frmProsmotrZaklFlu.merFIOMK.Properties.Editors[0].Value := odsList.FieldByName('FIOPAC').AsString;
      frmProsmotrZaklFlu.merDateAgeSex.Properties.Editors[0].Value := DateTimeToStr(odsList.FieldByName('fd_rojd').AsDateTime);
      frmProsmotrZaklFlu.merDateAgeSex.Properties.Editors[1].Value := odsList.FieldByName('age').AsString;
      frmProsmotrZaklFlu.merDateAgeSex.Properties.Editors[2].Value := odsList.FieldByName('sex').AsString;
      frmProsmotrZaklFlu.rowIssl.Properties.Value := odsList.FieldByName('fc_name').AsString;           
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FK_NAZTYPEID, TRUNC(FD_RUN) AS FD_RUN, TRUNC(SYSDATE) AS SYS_DATE, '+#13+
                        '        asu.get_ib(fk_pacid) as numib, '+#13+
                        '       (SELECT MAX(FC_CHAR) '+#13+
                        '          FROM asu.TIB '+#13+
                        '         WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME1'')) AS RESUME1, '+#13+
                        '       (SELECT MAX(FC_CHAR) '+#13+
                        '          FROM asu.TIB '+#13+
                        '         WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME2'')) AS RESUME2, '+#13+
                        '       (SELECT asu.DO_VRACHFIO(MAX(FN_NUM)) '+#13+
                        '          FROM asu.TIB '+#13+
                        '         WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH1'')) AS SOTR1, '+#13+
                        '       (SELECT asu.DO_VRACHFIO(MAX(FN_NUM)) '+#13+
                        '          FROM asu.TIB '+#13+
                        '         WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH2'')) AS SOTR2 '+#13+
                        '   FROM asu.TNAZIS WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        ods.Open;
        frmProsmotrZaklFlu.rowZakl1.Properties.Value := ods.FieldByName('RESUME1').AsString;
        frmProsmotrZaklFlu.rowZakl2.Properties.Value := ods.FieldByName('RESUME2').AsString;
        frmProsmotrZaklFlu.rowSotr1.Properties.Value := ods.FieldByName('SOTR1').AsString;
        frmProsmotrZaklFlu.rowSotr2.Properties.Value := ods.FieldByName('SOTR2').AsString;
        frmProsmotrZaklFlu.merFIOMK.Properties.Editors[1].Value := ods.FieldByName('numib').AsString;
      finally
        ods.Free;
      end;
      frmProsmotrZaklFlu.ShowModal;
      frmProsmotrZaklFlu.Free;
    end else
    begin
      Application.CreateForm(TfrmProsmotrZakl, frmProsmotrZakl);
      frmProsmotrZakl.rowNum.Properties.Value := odsList.FieldByName('NUMBERPROTOCOL').AsString;
      frmProsmotrZakl.merFIOMK.Properties.Editors[0].Value := odsList.FieldByName('FIOPAC').AsString;
      frmProsmotrZakl.merDateAgeSex.Properties.Editors[0].Value := DateTimeToStr(odsList.FieldByName('fd_rojd').AsDateTime);
      frmProsmotrZakl.merDateAgeSex.Properties.Editors[1].Value := odsList.FieldByName('age').AsString;
      frmProsmotrZakl.merDateAgeSex.Properties.Editors[2].Value := odsList.FieldByName('sex').AsString;
      frmProsmotrZakl.rowIssl.Properties.Value := odsList.FieldByName('fc_name').AsString;
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT DECODE(MAX(FC_CHAR), NULL, ''Нет заключения'', MAX(FC_CHAR)) AS ZAKL, '+#13+
                        '        asu.get_ib(:pfk_pacid) as nummk '+#13+
                        '   FROM asu.TIB '+#13+
                        '  WHERE FK_PACID = :PFK_ID '+#13+
                        '    AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME'') ';
        ods.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        ods.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('FK_PACID').AsInteger);
        ods.Open;
        frmProsmotrZakl.rowZakl.Properties.Value := ods.FieldByName('ZAKL').AsString;
        frmProsmotrZakl.merFIOMK.Properties.Editors[1].Value := ods.FieldByName('nummk').AsString;
      finally
        ods.Free;
      end;
      frmProsmotrZakl.ShowModal;
      frmProsmotrZakl.Free;
    end;
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
    ods.SQL.Text := ' select asu.get_nazcancel, asu.get_vipnaz, asu.get_labvip, asu.get_nevip, trunc(sysdate) as systemdate, '+#13+
                    '        asu.get_neyav, asu.get_xray_arhivarius, asu.get_nazplan, asu.get_recomend, '+#13+
                    '        asu.get_rad_gamma, asu.get_rad_petct, asu.get_radio_otdel, '+#13+
                    '        asu.get_registrator_fluoro, asu.get_nazextra, asu.get_xray_mrtkab, asu.get_xray_mrt, '+#13+
                    '        asu.get_xray_mammograf, asu.get_xray_mammograf2, asu.get_propiskaid, asu.get_registid, asu.doc_ambul, '+#13+
                    '        (select fk_id from asu.tsmid where fc_synonim = ''ISSLED_FLUROGR'') as get_issl_flu, '+#13+
                    '        asu.pkg_smini.readstring(''CONFIG'', ''DB_NAME'', ''H'') as db_name, '+#13+

                    '        asu.pkg_smini.readstring(''XRAY'', ''USE_ONE_ACCESSIONNUMBER'', ''0'') as USE_ONE_ACCESSIONNUMBER, '+#13+

                    '        (select fk_id from asu.tsmid where fc_synonim = ''TARGET_PROFILAKTIKA'') as get_id_profilaktika,list_xray_cito, '+#13+
                    '        asu.rgreg_hide_last_fluoro'+#13+
                    '   from dual ';
    ods.Close;
    try
      ods.Open;
    except
       on e:Exception do
        begin
          MessageDlg('ERROR : '+E.Message + #13+ods.sql.text, mtError, [mbOK], 0);
          Exit;
        end;
    end;

    // использовать методики в назначениях
    try
      USE_METODICS_IN_NAZN := uDBTableUtils.TDBUtils.GetConstantDef('USE_METODICS_IN_NAZN',os,0);
    except
      USE_METODICS_IN_NAZN := 0;
    end;

    try
      xray_vrach_shownumber := udbtableutils.tdbutils.getconstantdef('xray_vrach_shownumber',os,0);
    except
      xray_vrach_shownumber := 0;
    end;

    // использовать один accessionnumber для всех методик назначения
    if not TryStrToInt(ods.FieldByName('USE_ONE_ACCESSIONNUMBER').AsString,USE_ONE_ACCESSIONNUMBER) then
      USE_ONE_ACCESSIONNUMBER := 0;

    try // апроверка дубля номера исследования ACCESSIONNUMBER
      xray_chkUniqAccNmb := uDBTableUtils.TDBUtils.GetConstantDef('xray_chkUniqAccNmb',os,1);
    except
      xray_chkUniqAccNmb := 1;
    end;

    try // автогенерация номера исследования ACCESSIONNUMBER
      get_autogenAccNmb := uDBTableUtils.TDBUtils.GetConstantDef('xray_genAcc',os,1);
    except
      get_autogenAccNmb := 1;
    end;

    try // проверка дозы
      get_CheckDoza := uDBTableUtils.TDBUtils.GetConstantDef('xray_ChkDoza',os,1);
    except
      get_CheckDoza := 1;
    end;

    try // проверка кол-ва снимков
      get_CheckAmmSnimki := uDBTableUtils.TDBUtils.GetConstantDef('xray_ChkSnimki',os,1);
    except
      get_CheckAmmSnimki := 1;
    end;

    try
      get_can_change_vrach := uDBTableUtils.TDBUtils.GetConstantDef('list_xray_get_can_change_vrach',os,1);
    except
      get_can_change_vrach := 1;
    end;

    try
      list_xray_curr_vrach_as_owner := uDBTableUtils.TDBUtils.GetConstantDef('list_xray_curr_vrach_as_owner',os,0);
    except
      list_xray_curr_vrach_as_owner := 0;
    end;

    get_nazcancel := ods.FieldByName('GET_NAZCANCEL').AsInteger;
    get_vipnaz := ods.FieldByName('GET_VIPNAZ').AsInteger;
    get_labvip := ods.FieldByName('GET_LABVIP').AsInteger;
    get_nevip := ods.FieldByName('GET_NEVIP').AsInteger;
    get_nazplan := ods.FieldByName('GET_NAZPLAN').AsInteger;
    get_recomend := ods.FieldByName('GET_RECOMEND').AsInteger;
    get_registrator_fluoro := ods.FieldByName('GET_REGISTRATOR_FLUORO').AsInteger;
    get_nazextra := ods.FieldByName('GET_NAZEXTRA').AsInteger;
    get_xray_mrtkab := ods.FieldByName('GET_XRAY_MRTKAB').AsInteger;
    get_issl_flu := ods.FieldByName('GET_ISSL_FLU').AsInteger;
    get_systemdate := ods.FieldByName('SYSTEMDATE').AsDateTime;
    get_xray_mammograf := ods.FieldByName('GET_XRAY_MAMMOGRAF').AsInteger;
    get_xray_mammograf2 := ods.FieldByName('GET_XRAY_MAMMOGRAF2').AsInteger;
    get_neyav := ods.FieldByName('GET_NEYAV').AsInteger;
    get_xray_arhivarius := ods.FieldByName('GET_XRAY_ARHIVARIUS').AsInteger;
    get_propiskaid := ods.FieldByName('GET_PROPISKAID').AsInteger;
    get_registid := ods.FieldByName('get_registid').AsInteger;
    get_db_name := ods.FieldByName('DB_NAME').AsString;
    v_db_lpu:=get_db_name;
    get_xray_mrt := ods.FieldByName('get_xray_mrt').AsInteger;
    get_doc_ambul := ods.FieldByName('doc_ambul').AsInteger;
    get_id_profilaktika := ods.FieldByName('get_id_profilaktika').AsInteger;
    get_rad_gamma := ods.FieldByName('get_rad_gamma').AsInteger;
    get_rad_petct := ods.FieldByName('get_rad_petct').AsInteger;
    get_radio_otdel := ods.FieldByName('get_radio_otdel').AsInteger;
    list_xray_cito := ods.fieldbyname('list_xray_cito').asinteger;
    rgreg_hide_last_fluoro := ods.fieldbyname('rgreg_hide_last_fluoro').asinteger;
    GET_XRAYS_OTDEL := -1;

    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT FC_VALUE, FC_KEY FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' ORDER BY FK_ID ';
    ods.Open;
    while not ods.Eof do
      begin
        if ods.FieldByName('fc_key').AsString = 'AGREE_PACIENT' then
          begin
            get_agree_pacient := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'NUM_PROTOCOL_NOT_EMPTY' then
          begin
            get_num_not_empty := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'AMBTALON_XRAY' then
          begin
            get_ambtalon_xray := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_DEFAULT_KONSULT' then
          begin
            get_def_konsult := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_SHOW_WORK' then
          begin
            get_show_work := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_SHOW_ADD' then
          begin
            get_show_add := ods.FieldByName('fc_value').AsString;
          end;
         if ods.FieldByName('fc_key').AsString = 'NUMPROTOCOL_IN_ENG' then
          begin
            get_eng_num := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_DEFAULT_THISMK' then
          begin
            get_def_thismk := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'USE_INTEG_LOOKINSIDE' then
          begin
            get_lookinside := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'LOOKINSIDE_IP' then // IP-сервера LookInside
          begin
            get_lookinside_ip := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'LOOKINSIDE_PORT' then // Порт сервера LookInside
          begin
            get_lookinside_port := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'LOOKINSIDE_LOGIN' then // Логин на сервер LookInside
          begin
            get_lookinside_login := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'LOOKINSIDE_PASSWORD' then // Пароль на сервер LookInside
          begin
            get_lookinside_pass := ods.FieldByName('fc_value').AsString;
          end;
       if ods.FieldByName('fc_key').AsString = 'LOOKINSIDE_PORT_WEB' then // Порт для Webа
         begin
           get_lookinside_portweb := ods.FieldByName('fc_value').AsString;
         end;
       if ods.FieldByName('fc_key').AsString = 'LOOKINSIDE_ARCH_AE' then // AE Title сервера LookInside
         begin
           get_lookinside_archae := ods.FieldByName('fc_value').AsString;
         end;
       if ods.FieldByName('fc_key').AsString = 'LOOKINSIDE_HL7PORT_SEND' then // Порт для отправки сообщений
         begin
           get_lookinside_portsend := ods.FieldByName('fc_value').AsString;
         end;
       if ods.FieldByName('fc_key').AsString = 'LOOKINSIDE_HL7PORT_REC' then // Порт для получения сообщений
         begin
           get_lookinside_portrec := ods.FieldByName('fc_value').AsString;
         end;
       if ods.FieldByName('fc_key').AsString = 'LOOKINSIDE_HL7_IP' then // IP-адрес WLM-сервера для получения сообщений
         begin
           get_lookinside_hl7ip := ods.FieldByName('fc_value').AsString;
         end;
       if ods.FieldByName('fc_key').AsString = 'SHOW_AGREE_PACIENT' then // Показывать кнопку "Согласие пациента"
         begin
           get_show_agreepac := ods.FieldByName('fc_value').AsString;
         end;
       if ods.FieldByName('fc_key').AsString = 'XRAY_SHOW_SPEEDKONTRAST' then // Показывать "Скорость контраста"
         begin
           get_show_speed := ods.FieldByName('fc_value').AsString;
         end;
       if ods.FieldByName('fc_key').AsString = 'XRAY_SHOW_ADDTALONINFO' then // Показывать "Добавить данные по талону"
         begin
           get_show_addtaloninfo := ods.FieldByName('fc_value').AsString;
         end;
       if ods.FieldByName('fc_key').AsString = 'XRAY_SHOW_ONHAND' then // Показывать "от руки" в форме Отмена
         begin
           get_show_onhand := ods.FieldByName('fc_value').AsString;
         end;
       if ods.FieldByName('fc_key').AsString = 'XRAY_SUMDOZA' then // Эффективная годовая доза
         begin
           if not TryStrToInt( ods.FieldByName('fc_value').AsString, get_sum_doza ) then
              get_sum_doza := 0 ;
            //
         //  get_sum_doza := StrToInt(ods.FieldByName('fc_value').AsString);
         end;
       if ods.FieldByName('fc_key').AsString = 'XRAY_DISABLE_TIME' then // Запретить редактировать время исследования в направлении
         begin
           get_disable_time := ods.FieldByName('fc_value').AsString;
         end;
       if ods.FieldByName('fc_key').AsString = 'KOLVODAYS_RASPRED' then // Кол-во дней для распределения
         begin
           if not TryStrToInt( ods.FieldByName('fc_value').AsString, get_kolvo_raspred ) then
              get_kolvo_raspred := 0 ;
            //
         //  get_kolvo_raspred := StrToInt(ods.FieldByName('fc_value').AsString);
         end;
       if ods.FieldByName('fc_key').AsString = 'DICOMWL_PORT' then // Порт WL
         begin
            if not TryStrToInt( ods.FieldByName('fc_value').AsString, get_dicomwl_port ) then
              get_dicomwl_port := 0 ;
            //
         //  get_dicomwl_port := StrToInt(ods.FieldByName('fc_value').AsString);
         end;
       if ods.FieldByName('fc_key').AsString = 'DICOMWL_IP' then // IP-адрес WL
         begin
           get_dicomwl_ip := ods.FieldByName('fc_value').AsString;
         end;
       if ods.FieldByName('fc_key').AsString = 'XRAY_USE_WL' then // Использовать WL ? ("-1" - да, "0" - нет)
         begin
           get_use_wl := ods.FieldByName('fc_value').AsString;
         end;
        ods.Next;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aAddTalonInfoExecute(Sender: TObject);
var ods, odsOms : TOracleDataSet;
    oq : TOracleQuery;
    idTalon, idInsur, WorkMode : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  Screen.Cursor := crHourGlass;
  try
    ods.Session := os;
    ods.SQL.Text := ' select t1.fk_id, t1.fn_sos, t1.fk_insuranceid, t1.fd_opened, fk_rezhimid, asu.do_vrachfio(t1.fk_sotrid) as sotrfio, fk_sotrid, '+#13+
                    '        fk_servplace, asu.get_smidname(fk_servplace) as servplace, t1.fd_naprdate, t1.fc_naprnum, '+#13+
                    '        fk_reason, asu.get_smidname(fk_reason) as reason '+#13+
                    '   from asu.tambtalon t1, asu.tambtalon_naz t2 '+#13+
                    '  where t1.fk_id = t2.fk_talonid '+#13+
                    '    and t2.fk_nazid = :pfk_nazid ';
    ods.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('fk_id').AsInteger);
    ods.Open;
    idTalon := ods.FieldByName('fk_id').AsInteger;
    idInsur := ods.FieldByName('fk_insuranceid').AsInteger;
    if ods.RecordCount = 0 then
      begin
        MessageDlg('Внимание!'+#13+#10+'Данное назначение не привязано ни к одному талону!', mtInformation, [mbOK], 0);
        exit;
      end;
    if ods.FieldByName('fn_sos').AsInteger = 1 then
      begin
        MessageDlg('Внимание!'+#13+#10+'Талон данного назначения подписан!'+#13+#10+'Вы не можете ничего изменить!', mtInformation, [mbOK], 0);
        exit;
      end;
// -- проверка на вид оплаты ОМС
  odsOms := TOracleDataSet.Create(nil);
  try
    if get_db_name = 'H' then // только для ОКБ г. Ханты-Мансийск
      begin
        odsOms.Session := os;
        odsOms.SQL.Text := ' select fc_synonim '+#13+
                           '   from asu.tsmid '+#13+
                           '  where fk_id = (select fk_smid from asu.tib '+#13+
                           '                  where fk_pacid = :pfk_pacid '+#13+
                           '                    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''AMBTALON_OPL'' connect by prior fk_id = fk_owner)) ';
        odsOms.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('fk_id').AsInteger);
        odsOms.Open;
        if odsOms.FieldByName('fc_synonim').AsString <> 'TAL_OPLOMS' then
          begin
            WorkMode := 1;
          end else
          begin
            WorkMode := 2;
          end;
      end;
  finally
    odsOms.Free;
  end;
    Application.CreateForm(TfrmAddTalonInfo, frmAddTalonInfo);
//-- Режим работы
    if WorkMode = 1 then
      begin
        frmAddTalonInfo.Caption := 'Данные амбулаторного талона. Режим просмотра';
        frmAddTalonInfo.rowTypeMedHelp.Properties.Options.ShowEditButtons := eisbNever;
        frmAddTalonInfo.rowRezim.Properties.Options.ShowEditButtons := eisbNever;
        frmAddTalonInfo.rowTypeTalon.Properties.Options.ShowEditButtons := eisbNever;
      end else
      begin
        frmAddTalonInfo.Caption := 'Данные амбулаторного талона';
        frmAddTalonInfo.rowTypeMedHelp.Properties.Options.ShowEditButtons := eisbAlways;
        frmAddTalonInfo.rowRezim.Properties.Options.ShowEditButtons := eisbAlways;
        frmAddTalonInfo.rowTypeTalon.Properties.Options.ShowEditButtons := eisbAlways;
      end;
    frmAddTalonInfo.rowNat.Properties.EditProperties.Buttons[0].Visible := WorkMode = 2;
    frmAddTalonInfo.rowNat.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowSocStatus.Properties.EditProperties.Buttons[0].Visible := WorkMode = 2;
    frmAddTalonInfo.rowSocStatus.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowSotr.Properties.EditProperties.Buttons[0].Visible := WorkMode = 2;
    frmAddTalonInfo.rowSotr.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowPolis.Properties.EditProperties.Buttons[0].Visible := WorkMode = 2;
    frmAddTalonInfo.rowPolis.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowPlace.Properties.EditProperties.Buttons[0].Visible := WorkMode = 2;
    frmAddTalonInfo.rowPlace.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowNapr.Properties.EditProperties.Buttons[0].Visible := WorkMode = 2;
    frmAddTalonInfo.rowNapr.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowReason.Properties.EditProperties.Buttons[0].Visible := WorkMode = 2;
    frmAddTalonInfo.rowReason.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowStandart.Properties.EditProperties.Buttons[0].Visible := WorkMode = 2;
    frmAddTalonInfo.rowStandart.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowTypeMedHelp.Properties.Options.Editing := WorkMode = 2;
    frmAddTalonInfo.rowTypeMedHelp.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowRezim.Properties.Options.Editing := WorkMode = 2;
    frmAddTalonInfo.rowRezim.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowTypeTalon.Properties.Options.Editing := WorkMode = 2;
    frmAddTalonInfo.rowTypeTalon.Options.Focusing := WorkMode = 2;

    frmAddTalonInfo.aSave.Enabled := WorkMode = 2;
    frmAddTalonInfo.aSave.Visible := WorkMode = 2;
//-- Дата открытия талона
    frmAddTalonInfo.rowDate.Properties.Value := ods.FieldByName('fd_opened').AsDateTime;
//-- Дата и номер направления
    if DateTimeToStr(ods.FieldByName('fd_naprdate').AsDateTime) = '30.12.1899' then
      frmAddTalonInfo.merDateNum.Properties.Editors[0].Value := null
    else
      frmAddTalonInfo.merDateNum.Properties.Editors[0].Value := ods.FieldByName('fd_naprdate').AsDateTime;
    frmAddTalonInfo.merDateNum.Properties.Editors[1].Value := ods.FieldByName('fc_naprnum').AsString;
//-- дата вып. услуги и наименование услуги
    frmAddTalonInfo.rowNameUsl.Properties.Value := odsList.FieldByName('fc_name').AsString;
    frmAddTalonInfo.rowDateUsl.Properties.Value := odsList.FieldByName('fd_run_str').AsString;
//-- режим
    frmAddTalonInfo.rowRezim.Properties.Value := ods.FieldByName('fk_rezhimid').AsInteger;
    frmAddTalonInfo.odsRezim.Locate('fk_id', ods.FieldByName('fk_rezhimid').AsInteger, []);
//-- место обслуживания
    frmAddTalonInfo.rowPlace.Properties.Value := ods.FieldByName('servplace').AsString;
    frmAddTalonInfo.rowPlace.Tag := ods.FieldByName('fk_servplace').AsInteger;
//-- цель посещения
    frmAddTalonInfo.rowReason.Properties.Value := ods.FieldByName('reason').AsString;
    frmAddTalonInfo.rowReason.Tag := ods.FieldByName('fk_reason').AsInteger;
//-- сотрудник, открывший талон
    frmAddTalonInfo.rowSotr.Properties.Value := ods.FieldByName('sotrfio').AsString;
    frmAddTalonInfo.rowSotr.Tag := ods.FieldByName('fk_sotrid').AsInteger;
//-- гражданство
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_GRAGZ'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('peplid').AsInteger);
    ods.Open;
    frmAddTalonInfo.rowNat.Properties.Value := ods.FieldByName('smname').AsString;
    frmAddTalonInfo.rowNat.Tag := ods.FieldByName('fk_smid').AsInteger;
//-- социальный статус
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_SOC_POL'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('peplid').AsInteger);
    ods.Open;
    frmAddTalonInfo.rowSocStatus.Properties.Value := ods.FieldByName('smname').AsString;
    frmAddTalonInfo.rowSocStatus.Tag := ods.FieldByName('fk_smid').AsInteger;
//-- направившее учреждение
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''PD_NAPRAVIV_YCH'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, idTalon);
    ods.Open;
    frmAddTalonInfo.rowNapr.Properties.Value := ods.FieldByName('smname').AsString;
    frmAddTalonInfo.rowNapr.Tag := ods.FieldByName('fk_smid').AsInteger;
//-- Стандарт мед помощи
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''CPD_STANDARTGROUP'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, idTalon);
    ods.Open;
    frmAddTalonInfo.rowStandart.Properties.Value := ods.FieldByName('smname').AsString;
    frmAddTalonInfo.rowStandart.Tag := ods.FieldByName('fk_smid').AsInteger;
    if frmAddTalonInfo.rowStandart.Tag = 0 then
      begin
        ods.Close;
        ods.DeleteVariables;
        ods.SQL.Text := ' select fk_id, fc_name from asu.tsmid where fc_synonim = ''SG_FEDERAL'' ';
        ods.Open;
        frmAddTalonInfo.rowStandart.Properties.Value := ods.FieldByName('fc_name').AsString;
        frmAddTalonInfo.rowStandart.Tag := ods.FieldByName('fk_id').AsInteger;
      end;    
//-- Тип вида мед помощи
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''TYPE_V_MU'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, idTalon);
    ods.Open;
    frmAddTalonInfo.rowTypeMedHelp.Properties.Value := ods.FieldByName('fk_smid').AsInteger;
    frmAddTalonInfo.odsTypeMedHelp.Locate('fk_id', ods.FieldByName('fk_smid').AsInteger, []);
//-- Тип талона
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''TALON_TYPE_CREATE'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, idTalon);
    ods.Open;
    frmAddTalonInfo.rowTypeTalon.Properties.Value := ods.FieldByName('fk_smid').AsInteger;
    frmAddTalonInfo.odsTypeTalon.Locate('fk_id', ods.FieldByName('fk_smid').AsInteger, []);
    if (frmAddTalonInfo.rowTypeTalon.Properties.Value = 0) and (GET_DB_NAME = 'SK') then
      begin
        ods.Close;
        ods.DeleteVariables;
        ods.SQL.Text := ' select fk_id, fc_name '+#13+
                        '   from asu.tsmid '+#13+
                        '  where fk_owner = (select fk_id from asu.tsmid where fc_synonim = ''TALON_TYPE_CREATE'') '+#13+
                        '    and fk_default = 1 ';
        ods.Open;
        frmAddTalonInfo.rowTypeTalon.Properties.Value := ods.FieldByName('fk_id').AsInteger;
        frmAddTalonInfo.odsTypeTalon.Locate('fk_id', ods.FieldByName('fk_id').AsInteger, []);
      end;
    frmAddTalonInfo.merDateNum.Visible := frmAddTalonInfo.odsTypeTalon.FieldByName('fc_synonim').AsString = 'TALON_TYPE_CREATE_NAPR';
    try
      frmAddTalonInfo.merFIOMK.Properties.Editors[0].Value := odsList.FieldByName('fiopac').AsString;
      frmAddTalonInfo.merDateAgeSex.Properties.Editors[0].Value := odsList.FieldByName('fd_rojd').AsDateTime;
      frmAddTalonInfo.merDateAgeSex.Properties.Editors[1].Value := odsList.FieldByName('age').AsInteger;
      frmAddTalonInfo.merDateAgeSex.Properties.Editors[2].Value := odsList.FieldByName('sex').AsString;
      frmAddTalonInfo.DoShowForm(idInsur, odsList.FieldByName('fk_pacid').AsInteger);
      Screen.Cursor := crDefault;
      frmAddTalonInfo.ShowModal;
      if frmAddTalonInfo.ModalResult = mrOk then // -- >> сохранение
        begin
          oq := TOracleQuery.Create(nil);
          oq.Session := os;
          oq.Cursor := crSQLWait;
          try
//-- Направившее учреждение
            oq.DeleteVariables;
            oq.SQL.Text := ' merge into asu.tib using dual on '+#13+
                           '   (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''PD_NAPRAVIV_YCH'')) '+#13+
                           ' when not matched then '+#13+
                           '   insert(fk_smid, fk_smeditid, fk_vrachid, fk_pacid) '+#13+
                           '   values(:pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''PD_NAPRAVIV_YCH''), :pfk_vrachid, :pfk_pacid) '+#13+
                           ' when matched then '+#13+
                           '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid '+#13+
                           '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''PD_NAPRAVIV_YCH'') ';
            oq.DeclareAndSet('pfk_smid', otInteger, frmAddTalonInfo.rowNapr.Tag);
            oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
            oq.DeclareAndSet('pfk_pacid', otInteger, idTalon);
            oq.Execute;
//-- Гражданство
            oq.DeleteVariables;
            oq.SQL.Text := ' merge into asu.tib using dual on '+#13+
                           '   (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_GRAGZ'')) '+#13+
                           ' when not matched then '+#13+
                           '   insert(fk_smid, fk_smeditid, fk_vrachid, fk_pacid) '+#13+
                           '   values(:pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''LD_GRAGZ''), :pfk_vrachid, :pfk_pacid) '+#13+
                           ' when matched then '+#13+
                           '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid '+#13+
                           '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_GRAGZ'') ';
            oq.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('peplid').AsInteger);
            oq.DeclareAndSet('pfk_smid', otInteger, frmAddTalonInfo.rowNat.Tag);
            oq.DeclareAndSet('pfk_vrachid', otInteger, idTalon);
            oq.Execute;
//-- Социальный статус
            oq.DeleteVariables;
            oq.SQL.Text := ' merge into asu.tib using dual on '+#13+
                           '   (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_SOC_POL'')) '+#13+
                           ' when not matched then '+#13+
                           '   insert(fk_smid, fk_smeditid, fk_vrachid, fk_pacid) '+#13+
                           '   values(:pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''LD_SOC_POL''), :pfk_vrachid, :pfk_pacid) '+#13+
                           ' when matched then '+#13+
                           '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid '+#13+
                           '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_SOC_POL'') ';
            oq.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('peplid').AsInteger);
            oq.DeclareAndSet('pfk_smid', otInteger, frmAddTalonInfo.rowSocStatus.Tag);
            oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
            oq.Execute;
//-- Стандарт медицинской помощи
            oq.DeleteVariables;
            oq.SQL.Text := ' merge into asu.tib using dual on '+#13+
                           '   (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''CPD_STANDARTGROUP'')) '+#13+
                           ' when not matched then '+#13+
                           '   insert(fk_smid, fk_smeditid, fk_vrachid, fk_pacid) '+#13+
                           '   values(:pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''CPD_STANDARTGROUP''), :pfk_vrachid, :pfk_pacid) '+#13+
                           ' when matched then '+#13+
                           '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid '+#13+
                           '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''CPD_STANDARTGROUP'') ';
            oq.DeclareAndSet('pfk_pacid', otInteger, idTalon);
            oq.DeclareAndSet('pfk_smid', otInteger, frmAddTalonInfo.rowStandart.Tag);
            oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
            oq.Execute;
//-- Тип вида медицинской помощи
            oq.DeleteVariables;
            oq.SQL.Text := ' merge into asu.tib using dual on '+#13+
                           '   (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''TYPE_V_MU'')) '+#13+
                           ' when not matched then '+#13+
                           '   insert(fk_smid, fk_smeditid, fk_vrachid, fk_pacid) '+#13+
                           '   values(:pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''TYPE_V_MU''), :pfk_vrachid, :pfk_pacid) '+#13+
                           ' when matched then '+#13+
                           '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid '+#13+
                           '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''TYPE_V_MU'') ';
            oq.DeclareAndSet('pfk_pacid', otInteger, idTalon);
            oq.DeclareAndSet('pfk_smid', otInteger, frmAddTalonInfo.rowTypeMedHelp.Properties.Value);
            oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
            oq.Execute;
//-- Тип талона
            oq.DeleteVariables;
            oq.SQL.Text := ' merge into asu.tib using dual on '+#13+
                           '   (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''TALON_TYPE_CREATE'')) '+#13+
                           ' when not matched then '+#13+
                           '   insert(fk_smid, fk_smeditid, fk_vrachid, fk_pacid) '+#13+
                           '   values(:pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, :pfk_pacid) '+#13+
                           ' when matched then '+#13+
                           '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid '+#13+
                           '    where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_owner from asu.tsmid where fk_id = :pfk_smid) ';
            oq.DeclareAndSet('pfk_smid', otInteger, frmAddTalonInfo.rowTypeTalon.Properties.Value);
            oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
            oq.DeclareAndSet('pfk_pacid', otInteger, idTalon);
            oq.Execute;
// Талон
            oq.DeleteVariables;
            oq.SQL.Text := ' update asu.tambtalon '+#13+
                           '    set fk_servplace = :pfk_servplace, fk_reason = :pfk_reason, '+#13+
                           '        fk_insuranceid = :pfk_insuranceid, fk_sotrid = :pfk_sotrid, '+#13+
                           '        fk_rezhimid = :pfk_rezhimid, fd_naprdate = :pfd_naprdate, fc_naprnum = :pfc_naprnum '+#13+
                           '  where fk_id = :pfk_id ';
            oq.DeclareAndSet('pfk_servplace', otInteger, frmAddTalonInfo.rowPlace.Tag);
            oq.DeclareAndSet('pfk_reason', otInteger, frmAddTalonInfo.rowReason.Tag);
            oq.DeclareAndSet('pfk_id', otInteger, idTalon);
            oq.DeclareAndSet('pfk_insuranceid', otInteger, frmAddTalonInfo.rowPolis.Tag);
            oq.DeclareAndSet('pfk_rezhimid', otInteger, frmAddTalonInfo.rowRezim.Properties.Value);
            oq.DeclareAndSet('pfd_naprdate', otDate, frmAddTalonInfo.merDateNum.Properties.Editors[0].Value);
            oq.DeclareAndSet('pfc_naprnum', otString, frmAddTalonInfo.merDateNum.Properties.Editors[1].Value);
            oq.DeclareAndSet('pfk_sotrid', otInteger, frmAddTalonInfo.rowSotr.Tag);
            oq.Execute;
          finally
            os.Commit;
            oq.Free;
          end;
        end;
    finally
      frmAddTalonInfo.Free;
    end;
  finally
    Screen.Cursor := crDefault;
    ods.Free;
  end; 
end;

procedure TfrmMain.aBaseExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAllHistory, frmAllHistory);
  try
    frmAllHistory.DoShowForm(odsList.FieldByName('PEPLID').AsInteger, odsList.FieldByName('FIOPAC').AsString);
    frmAllHistory.ShowModal;
  finally
    frmAllHistory.Free;
  end;
end;

procedure TfrmMain.aCancelExecute(Sender: TObject);
var oq : TOracleQuery;
    ods : TOracleDataSet;
    s, sSex, sGroup, sGuid : string;
begin
  Application.CreateForm(TfrmOtmena, frmOtmena);
  try
    if get_show_onhand <> '-1' then
      begin
        frmOtmena.GroupBox1.Visible := False;
        frmOtmena.cxOtmena.Align := alClient;
      end;
    frmOtmena.FMode := 1;
    frmOtmena.DoShowfrmOtmena(odsList.FieldByName('FK_ID').AsInteger, pSOTRID);
    frmOtmena.ShowModal;
    if frmOtmena.ModalResult = MrOK then
      begin
        oq := TOracleQuery.Create(nil);
        ods := TOracleDataSet.Create(nil);
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
// -- отмена талона
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
// -- удаление исследования с WLM
        if get_lookinside = '-1' then
          begin
            ods.DeleteVariables;
            ods.Close;
            ods.SQL.Text := ' select asu.get_smidname(fk_default) as namegroup from asu.tsmid where fk_id = :pfk_id ';
            ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_smid').AsInteger);
            ods.Open;
            sGroup := ods.FieldByName('namegroup').AsString;
            ods.Close;
            ods.DeleteVariables;
            ods.SQL.Text := ' select fk_guid from asu.txrayguid where fk_nazid = :pfk_nazid ';
            ods.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('fk_id').AsInteger);
            ods.Open;
            sGuid := ods.FieldByName('fk_guid').AsString;

            try
              HL7Sender1.Port := StrToInt(get_lookinside_portsend);
            except
              HL7Sender1.Port := 0 ;
            end;
            //
//            HL7Sender1.Port := StrToInt(get_lookinside_portsend);
            HL7Sender1.Host := get_lookinside_hl7ip;
            if odsList.FieldByName('sex').AsString = 'М' then
              sSex := 'M'
            else
              sSex := 'F';

            s := 'MSH|^~\&|||||||ORM^O01|||2.3|'+#13#10+
                 'PID||'+IntToStr(odsList.FieldByName('fk_pacid').AsInteger)+'|||'+CyrToLatGOST(odsList.FieldByName('fiopac').AsString)+'||'+FormatDateTime('yyyymmdd', odsList.FieldByName('fd_rojd').AsDateTime)+'|'+sSex+'||||||||||||||||||||'+#13#10+
                 'PV1||||||||'+CyrToLatGOST(odsList.FieldByName('vrachfio').AsString)+'|||||||||||||||||||||||||||||||||||||'+#13#10+ // назначивший врач, лаборант, сотрудник
                 'ORC|CA||||CA||^^^'+FormatDateTime('yyyymmddhhmmss', odsList.FieldByName('runtime').AsDateTime)+'||||||'+#13#10+
                 'OBR||||'+IntToStr(odsList.FieldByName('fk_id').AsInteger)+'^'+CyrToLatGOST(AnsiUpperCase(odsList.FieldByName('fc_name').AsString))+'^'+AnsiUpperCase(odsKab.FieldByName('aetitle').AsString)+'^'+CyrToLatGOST(sGroup)+'||||||||||||||||||||||||'+#13#10+
                 'ZDS|'+sGuid+'^^Application^DICOM|';
            HL7Sender1.SendMessage(s);
            //-- ставим статус, что исследование было отменено
            oq.DeleteVariables;
            oq.SQL.Text := ' update asu.tnazis set fk_resultid = 3 where fk_id = :pfk_id ';
            oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
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

procedure TfrmMain.odsListAfterOpen(DataSet: TDataSet);
begin
  aCorrectPac.Enabled := odsList.RecordCount <> 0;  
end;

procedure TfrmMain.odsListAfterScroll(DataSet: TDataSet);
begin
  CheckEnabledButons;
end;

procedure TfrmMain.odsList_SortDateNazBeforeOpen(DataSet: TDataSet);
begin
	odsList_SortDateNaz.SetVariable('PFK_ROOMID', odsKab.FieldByName('FK_ID').AsInteger);
	odsList_SortDateNaz.SetVariable('PFD_DATE', dxdeDate.EditValue);
end;

procedure TfrmMain.odsList_SortFIOBeforeOpen(DataSet: TDataSet);
begin
	odsList_SortFIO.SetVariable('PFK_ROOMID', odsKab.FieldByName('FK_ID').AsInteger);
	odsList_SortFIO.SetVariable('PFD_DATE', dxdeDate.EditValue);
end;

procedure TfrmMain.odsPrintDezBeforeOpen(DataSet: TDataSet);
begin
  odsPrintDez.SetVariable('PFK_ROOMID', odsKab.FieldByName('FK_ID').AsInteger);
  odsPrintDez.SetVariable('PFD_DATE', dxdeDate.EditValue);
end;

procedure TfrmMain.CheckEnabledButons;
begin
  aInfo.Enabled := (odsList.RecordCount <> 0);
  aCancel.Enabled := (odsList.RecordCount <> 0)
                      and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_VIPNAZ)
                      and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_NAZCANCEL);
  aEditNaz.Enabled := (odsList.RecordCount <> 0)
                       and ((odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND));
  aNaprav.Enabled := (odsList.RecordCount <> 0) and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_NAZCANCEL)
                      and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_NEYAV);
  aDelete.Enabled := (odsList.RecordCount <> 0)
                      and ((odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND))
                      and (odsList.FieldByName('FK_VRACHID').AsInteger = pSOTRID);
  aPreview.Enabled := odsList.RecordCount <> 0;
  aCopyFIO.Enabled := odsList.RecordCount <> 0;
  aZakl.Enabled := (odsList.RecordCount <> 0) and (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ);
  aBase.Enabled := odsList.RecordCount <> 0;

  aWLM.Visible := (get_lookinside = '-1') and (odsList.RecordCount <> 0);
  aCompare.Visible := (get_lookinside = '-1') and (odsList.RecordCount <> 0);
  aUnCompare.Visible := (get_lookinside = '-1') and (odsList.RecordCount <> 0);
  aWLM.Enabled := (odsList.FieldByName('fk_nazsosid').AsInteger <> GET_NAZCANCEL) and (odsList.FieldByName('fk_nazsosid').AsInteger <> GET_NEYAV)
                  and (odsList.FieldByName('fk_resultid').AsInteger <> 2);

  aCompare.Enabled := (odsList.FieldByName('fk_nazsosid').AsInteger <> GET_NAZCANCEL) and (odsList.FieldByName('fk_nazsosid').AsInteger <> GET_NEYAV)
                      and (odsList.FieldByName('fk_resultid').AsInteger <> 2);
  aAddTalonInfo.Visible := (get_show_addtaloninfo = '-1') and (odsList.FieldByName('fk_nazsosid').AsInteger <> GET_NAZCANCEL)
                           and (odsList.FieldByName('fk_nazsosid').AsInteger <> GET_NEYAV) and (odsList.RecordCount <> 0) and (odsList.FieldByName('is_ambulance').AsInteger = 1);
  aSendToWL.Visible := (odsList.RecordCount <> 0) and (get_use_wl = '-1') and (odsList.FieldByName('fk_nazsosid').AsInteger = get_labvip);
  try
    aNaprav.Enabled := (odsList.RecordCount <> 0) and (odsList.FieldByName('ARCHIVED').AsInteger = 0);
  except
    on E:Exception do begin
      aNaprav.Enabled := (odsList.RecordCount <> 0);
    //  ShowMessage('ERROR : '+ E.Message);
    //  ShowMessage( 'поле ARCHIVED : ['+odsList.FieldByName('ARCHIVED').AsString+']');
    end;
  end;
end;

procedure TfrmMain.cxPrOtmenaPropertiesEditValueChanged(Sender: TObject);
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

procedure TfrmMain.TVListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  ods : TOracleDataSet;
  mr, resid : integer;
  oq : toraclequery;
begin

// Showmessage('1');

  if odsList.RecordCount <> 0 then
    begin
      if (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NAZCANCEL) or (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NEYAV) then
        begin
          Application.CreateForm(TfrmOtmena, frmOtmena);
          frmOtmena.fmode := 0;
          frmOtmena.acOk.Visible := not False;
          frmOtmena.GroupBox1.Visible := False;
          frmOtmena.cxOtmena.Align := alClient;
          frmOtmena.acCancel.Caption := 'Закрыть';
          frmOtmena.acCancel.ImageIndex := 2;
          ods := TOracleDataSet.Create(nil);
          try
            ods.Session := os;
            ods.Cursor := crSQLWait;
            ods.SQL.Text := ' SELECT fk_id,FC_RES, '+#13+
                            '        TO_CHAR(FD_INS, ''DD.MM.YYYY HH24:MI'') FD_INS, '+#13+
                            '        FK_VRACHID, ASU.DO_VRACHFIO(FK_VRACHID) AS SOTRFIO '+#13+
                            '   FROM ASU.VRES '+#13+
                            '  WHERE FK_NAZID = :pFK_NAZID AND FK_SOS = :PFK_SOS ';
            ods.DeclareAndSet('pFK_NAZID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
            ods.DeclareAndSet('PFK_SOS', otInteger, odsList.FieldByName('FK_NAZSOSID').AsInteger);
            ods.Open;
            resid := ods.fieldbyname('fk_id').asinteger;
            frmOtmena.cxOtmena.Text := 'Сотрудник:'+' '+ods.FieldByName('SOTRFIO').AsString+','+' '+
                                       'Дата отмены:'+' '+ods.FieldByName('FD_INS').AsString+#13#10+
                                       'Обоснование отмены:'+' '+ods.FieldByName('FC_RES').AsString;
            frmOtmena.cxOtmenaHand.Text :=copy(ods.FieldByName('FC_RES').AsString,pos(';',ods.FieldByName('FC_RES').AsString)+1,length(ods.FieldByName('FC_RES').AsString));
          finally
            ods.Free;
          end;
          frmOtmena.DoShowfrmOtmena(odsList.FieldByName('FK_ID').AsInteger, pSOTRID);
          mr := frmOtmena.ShowModal;
          if mr = mrok then
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
        end
      else
        begin
          aNapravExecute(nil);
        end;
    end;
end;

procedure TfrmMain.TVListCustomDrawCell(Sender: TcxCustomGridTableView;
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

  if get_lookinside = '-1' then
    begin
      if AViewInfo.GridRecord.Values[VList_ResultID.Index] = -1 then
        ACanvas.Brush.Color:=RGB(255, 255, 70);
    end;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TVList.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_lab\TVList'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TVList');
  SetColVisibility;
end;

procedure TfrmMain.frx30GetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'D1' then Value := DateTimeToStr(DateB);
  if VarName = 'D2' then Value := DateTimeToStr(DateE);
end;

procedure TfrmMain.odsKabBeforeOpen(DataSet: TDataSet);
begin
  odsKab.SetVariable('PSOTR', pSOTRID);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
//  showmessage('FormCreate');
  {$IFDEF USE_NEW_AUTH}
    GetSession(os, 'ASU');
  {$ELSE}
    os.LogonUsername := 'ASU';
    os.LogonPassword := 'ASU';
    os.LogonDatabase := 'ASU';
    os.Connected:=True;
  {$ENDIF}
  russian := LoadKeyboardLayout('00000419', 0);
  latin := LoadKeyboardLayout('00000409', 0);
  Application.HelpFile:=ExtractFilePath(Application.ExeName)+'Spiski.chm';
  Self.WindowState := wsMaximized;

  CAN_UPDATE_NAZ_SMID := (uDBTableUtils.TDBUtils.GetFunctionDef('CAN_UPDATE_NAZ_SMID', os, 0) = 1);

  TVREANIM.VisibleForCustomization := False;
  TVREANIM.Visible                 := False;
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

procedure TfrmMain.aPreviewExecute(Sender: TObject);
begin
  DoPrintJournal('Печать журнала', odsList);
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

procedure TfrmMain.blMonClick(Sender: TObject);
var mm,yy,dd:word;
begin
  decodeDate(dxdeDate.EditValue,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=3) and (dd>28)) then dd:=28;
  if mm>1 then mm:=mm-1
   else
     begin
       mm:=12;
       yy:=yy-1;
     end;

  dxdeDate.EditValue:=encodeDate(yy,mm,dd);
end;

procedure TfrmMain.blWeeksClick(Sender: TObject);
begin
  dxdeDate.EditValue:=dxdeDate.EditValue-1;
end;

procedure TfrmMain.p1Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+2;
end;

procedure TfrmMain.p2Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+3;
end;

procedure TfrmMain.p3Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+4;
end;

procedure TfrmMain.p4Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+5;
end;

procedure TfrmMain.p5Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+6;
end;

procedure TfrmMain.p6Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+7;
end;

procedure TfrmMain.p7Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+8;
end;

procedure TfrmMain.brWeeksClick(Sender: TObject);
begin
  dxdeDate.EditValue:=dxdeDate.EditValue+1;
end;

procedure TfrmMain.brMonClick(Sender: TObject);
var yy,mm,dd:word;
begin
  decodeDate(dxdeDate.EditValue,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=1) and (dd>28)) then dd:=28;
  if mm<12 then mm:=mm+1
   else
     begin
       mm:=1;
       yy:=yy+1;
     end;
  dxdeDate.EditValue:=encodeDate(yy,mm,dd);
end;

procedure TfrmMain.DateChange;
var
 yy,mm,dd:word;
 wd:integer;
begin
  pMonth.Caption:=FormatDateTime('mmmm',dxdeDate.EditValue)+', '+(FormatDateTime('dddd',dxdeDate.EditValue));

  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;

  decodeDate(dxdeDate.EditValue-wd+2,yy,mm,dd);
  p1.Caption:=inttostr(dd);

  decodeDate(dxdeDate.EditValue-wd+3,yy,mm,dd);
  p2.Caption:=inttostr(dd);

  decodeDate(dxdeDate.EditValue-wd+4,yy,mm,dd);
  p3.Caption:=inttostr(dd);

  decodeDate(dxdeDate.EditValue-wd+5,yy,mm,dd);
  p4.Caption:=inttostr(dd);

  decodeDate(dxdeDate.EditValue-wd+6,yy,mm,dd);
  p5.Caption:=inttostr(dd);

  decodeDate(dxdeDate.EditValue-wd+7,yy,mm,dd);
  p6.Caption:=inttostr(dd);

  decodeDate(dxdeDate.EditValue-wd+8,yy,mm,dd);
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
  frmEditNaz.Free;
end;

procedure TfrmMain.aHideExecute(Sender: TObject);
begin
  cxSplitter1.CloseSplitter;
end;

procedure TfrmMain.aNapravExecute(Sender: TObject);
var idIssl, idOwner : Integer;
    ods : TOracleDataSet;
    v_accnmb:string;
begin
  v_accnmb:= odsList.FieldByName('fc_an').AsString ;  // NUMBERISSL
  if ((v_accnmb = '') and (USE_ONE_ACCESSIONNUMBER=0)) then
  begin
    with TOracleQuery.Create(nil) do
    try
      Session:=frmMain.os;
      SQL.Text:='select MED.SEQ_TACCESSIONNMB.NEXTVAL as nmb from dual';
      Execute;
      v_accnmb:=IntToStr(FieldAsInteger('nmb'));
      SQL.Clear; DeleteVariables;
      SQL.Text:='update asu.tnazis t set t.fc_type=:p_fc_type where t.fk_id=:p_fk_id and (t.FC_TYPE is null) ';
      DeclareAndSet('p_fc_type', otString,  v_accnmb );
      DeclareAndSet('p_fk_id',   otInteger, odsList.FieldByName('fk_id').AsInteger );
      Execute;
    finally
      Free;
    end;
  end;
// -- узнаем группу исследования
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.SQL.Text := ' select fk_owner from asu.tsmid where fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_smid').AsInteger);
    ods.Open;
    idOwner := ods.FieldByName('fk_owner').AsInteger;
  finally
    ods.Free;
  end;
  if (idOwner = get_rad_gamma) or (idOwner = get_rad_petct) {or (frmMain.pOtdelID = get_radio_otdel)} then // для Радионуклидки
    begin
      idIssl := odsList.FieldByName('FK_ID').AsInteger;
      Application.CreateForm(TfrmNaprRad, frmNaprRad);
      frmNaprRad.DoShowForm(odsList.FieldByName('is_ambulance').AsInteger,
				  	                odsList.FieldByName('fk_pacid').AsInteger,
					  	              odsList.FieldByName('peplid').AsInteger,
						                '',
						                pOtdelID,
						                odsList.FieldByName('fk_smid').AsInteger,
                            odsKab.FieldByName('fk_id').AsInteger,
						                odsList.FieldByName('fk_id').AsInteger,
                            odsList.FieldByName('fc_name').AsString,
                            odsList.FieldByName('is_reanim').AsInteger,
                            idOwner);
      try
        frmNaprRad.ShowModal;
        if frmNaprRad.ModalResult = mrOk then
          begin
            RefreshQuery(odsList);
            odsList.Locate('FK_ID', idIssl, []);
          end;
      finally
        frmNaprRad.Free;
      end;
    end else // для рентгена
    begin
      idIssl := odsList.FieldByName('FK_ID').AsInteger;
      if odsKab.FieldByName('is_flu').AsInteger = 1 then
        begin
          Application.CreateForm(TfrmLabNapravFlu, frmLabNapravFlu);
          try
            frmLabNapravFlu.VFK_NAZSOSID := odsList.FieldByName('FK_NAZSOSID').AsInteger;
            frmLabNapravFlu.cxFam.Enabled := False;
            frmLabNapravFlu.cxName.Enabled := False;
            frmLabNapravFlu.cxOtch.Enabled := False;
            frmLabNapravFlu.cxNum.Enabled := False;
            frmLabNapravFlu.cxdeRojd.Enabled := False;
            frmLabNapravFlu.cxMale.Enabled := False;
            frmLabNapravFlu.cxFemale.Enabled := False;
            frmLabNapravFlu.DoShowForm(odsList.FieldByName('IS_AMBULANCE').AsInteger,
                                       odsList.FieldByName('FK_PACID').AsInteger,
                                       odsList.FieldByName('PEPLID').AsInteger,
                                       '',
                                       pOTDELID,
                                       odsList.FieldByName('FK_SMID').AsInteger,
                                       odsList.FieldByName('FK_ID').AsInteger);
            if frmLabNapravFlu.ShowModal = mrok then
             begin
              RefreshQuery(odsList);
              odsList.Locate('FK_ID', idIssl, []);
             end;
          finally
            frmLabNapravFlu.Free;
          end;
        end else
        begin
          Application.CreateForm(TfrmLabNaprav, frmLabNaprav);
          try
            frmLabNaprav.cxFam.Enabled := False;
            frmLabNaprav.cxName.Enabled := False;
            frmLabNaprav.cxOtch.Enabled := False;
            frmLabNaprav.cxNum.Enabled := False;
            frmLabNaprav.cxdeRojd.Enabled := False;
            frmLabNaprav.cxMale.Enabled := False;
            frmLabNaprav.cxFemale.Enabled := False;
            frmLabNaprav.VFK_NAZSOSID := odsList.FieldByName('FK_NAZSOSID').AsInteger;
            frmLabNaprav.DoShowForm(odsList.FieldByName('IS_AMBULANCE').AsInteger,
                                    odsList.FieldByName('FK_PACID').AsInteger,
                                    odsList.FieldByName('PEPLID').AsInteger,
                                    '',
                                    pOTDELID,
                                    odsList.FieldByName('FK_SMID').AsInteger,
                                    odsList.FieldByName('FK_ID').AsInteger,
                                    odsList.FieldByName('IS_REANIM').AsInteger,
                                    odsList.FieldByName('FK_DOCID').AsInteger,
                                    v_accnmb);  // NUMBERISSL        odsList.FieldByName('fc_an').AsString
            if frmLabNaprav.ShowModal = mrok then
             begin
              RefreshQuery(odsList);
              odsList.Locate('FK_ID', idIssl, []);
             end;
          finally
            frmLabNaprav.Free;
          end;
        end;
    end;
end;

procedure TfrmMain.TVListDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := TRUE;
  if not odsKab.Eof then
    idKabToDrag := odsKab.FieldByName('FK_ID').AsInteger;
  if not odsList.Eof then
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
        oq.SQL.Text := ' UPDATE TNAZIS SET FK_ROOMID = :PFK_ROOMID WHERE FK_ID = :PFK_ID ';
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
      odsKab.AfterScroll := nil; //!!! не локейтится на то исследование, которое выбрали
      odsKab.Locate('FK_ID', idKabToDrag, []);
      odsKab.AfterScroll := odsKabAfterScroll;
      odsKabAfterScroll(odsKab);
    end;
end;

procedure TfrmMain.TVListMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  idNazToDrag := odsList.FieldByName('FK_ID').AsInteger;
end;

procedure TfrmMain.Vfc_anGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  if ((USE_ONE_ACCESSIONNUMBER=1) and ( ARecord.Values[VFK_NAZSOSID.Index] = 2 ) ) then  // для хант делалось - Поддержка #30031
    AText := '';   // у пациентов в статусе не вып.
end;

procedure TfrmMain.VNUMFLU1GetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  if ((USE_ONE_ACCESSIONNUMBER=1) and ( ARecord.Values[VFK_NAZSOSID.Index] = 2 ) ) then  // для хант делалось - Поддержка #30031
    AText := '';   // у пациентов в статусе не вып.
end;

procedure TfrmMain.VNUMPROTOCOLGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  if ((USE_ONE_ACCESSIONNUMBER=1) and ( ARecord.Values[VFK_NAZSOSID.Index] = 2 ) ) then  // для хант делалось - Поддержка #30031
    AText := '';   // у пациентов в статусе не вып.
end;

procedure TfrmMain.aDeleteExecute(Sender: TObject);
var oq : TOracleQuery;
    ods, odsOpl : TOracleDataSet;
    s, sSex, sGroup, sGuid : string;
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

  if Application.MessageBox('Вы действительно хотите удалить исследование?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      oq := TOracleQuery.Create(nil);
      oq.Session := os;
      oq.Cursor := crSQLWait;
      ods := TOracleDataSet.Create(nil);
      ods.Session := frmMain.os;
      ods.Cursor := crSQLWait;
      try
        if get_lookinside = '-1' then // удаление исследования с WLM
          begin
            ods.Close;
            ods.DeleteVariables;
            ods.SQL.Text := ' select fk_guid from asu.txrayguid where fk_nazid = :pfk_nazid ';
            ods.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('fk_id').AsInteger);
            ods.Open;
            sGuid := ods.FieldByName('fk_guid').AsString;
          end;
        oq.SQL.Text := ' DELETE FROM ASU.TNAZIS WHERE FK_ID = :PFK_ID ';
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
        if get_lookinside = '-1' then // удаление исследования с WLM
          begin
            ods.DeleteVariables;
            ods.Close;
            ods.SQL.Text := ' select asu.get_smidname(fk_default) as namegroup from asu.tsmid where fk_id = :pfk_id ';
            ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_smid').AsInteger);
            ods.Open;
            sGroup := ods.FieldByName('namegroup').AsString;

            try
              HL7Sender1.Port := StrToInt(get_lookinside_portsend);
            except
              HL7Sender1.Port := 0 ;
            end;
            // HL7Sender1.Port := StrToInt(get_lookinside_portsend);
            HL7Sender1.Host := get_lookinside_hl7ip;
            if odsList.FieldByName('sex').AsString = 'М' then
              sSex := 'M'
            else
              sSex := 'F';

            s := 'MSH|^~\&|||||||ORM^O01|||2.3|'+#13#10+
                 'PID||'+IntToStr(odsList.FieldByName('fk_pacid').AsInteger)+'|||'+CyrToLatGOST(odsList.FieldByName('fiopac').AsString)+'||'+FormatDateTime('yyyymmdd', odsList.FieldByName('fd_rojd').AsDateTime)+'|'+sSex+'||||||||||||||||||||'+#13#10+
                 'PV1||||||||'+CyrToLatGOST(odsList.FieldByName('vrachfio').AsString)+'|||||||||||||||||||||||||||||||||||||'+#13#10+ // назначивший врач, лаборант, сотрудник
                 'ORC|CA||||CA||^^^'+FormatDateTime('yyyymmddhhmmss', odsList.FieldByName('runtime').AsDateTime)+'||||||'+#13#10+
                 'OBR||||'+IntToStr(odsList.FieldByName('fk_id').AsInteger)+'^'+CyrToLatGOST(AnsiUpperCase(odsList.FieldByName('fc_name').AsString))+'^'+AnsiUpperCase(odsKab.FieldByName('aetitle').AsString)+'^'+CyrToLatGOST(sGroup)+'||||||||||||||||||||||||'+#13#10+
                 'ZDS|'+sGuid+'^^Application^DICOM|';
            HL7Sender1.SendMessage(s);
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
        RefreshQuery(odsList);
      finally
        oq.Free;
        ods.Free;
      end;
    end;
end;

procedure TfrmMain.aDolgTalonExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmDolgTalon, frmDolgTalon);
  try
    frmDolgTalon.DoShowfrmDolgTalon;
    frmDolgTalon.ShowModal;
  finally
    frmDolgTalon.Free;
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

procedure TfrmMain.aSendToWLExecute(Sender: TObject);
var ods : TOracleDataSet;
    oq : TOracleQuery;
    sModality, sBodyPart, sIB, sStudyUID : string;
begin
// -- проверки
  if get_dicomwl_port = 0 then
    begin
      MessageDlg('Внимание!'+#13+#10+'Не указан порт сервера WL!'+#13+#10+'Обратитесь к администратору системы!', mtInformation, [mbOK], 0);
      exit;
    end;
  if (get_dicomwl_ip = null) or (get_dicomwl_ip = '') then
    begin
      MessageDlg('Внимание!'+#13+#10+'Не указан IP-адрес сервера WL!'+#13+#10+'Обратитесь к администратору системы!', mtInformation, [mbOK], 0);
      exit;
    end;
// -- Данные
  Screen.Cursor := crHourGlass;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' select fc_name from asu.tmodality t1, asu.tsmid_modality t2 where t1.fk_id = t2.fk_modality and t2.fk_smid = :pfk_smid ';
    ods.DeclareAndSet('pfk_smid', otInteger, odsList.FieldByName('fk_smid').AsInteger);
    ods.Open;
    sModality := ods.FieldByName('fc_name').AsString; // модальность из справочника
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fc_name_eng from asu.tbodyparts t1, asu.tsmid_bodypart t2 where t1.fk_id = t2.fk_bodypart and t2.fk_smid = :pfk_smid ';
    ods.DeclareAndSet('pfk_smid', otInteger, odsList.FieldByName('fk_smid').AsInteger);
    ods.Open;
    sBodyPart := ods.FieldByName('fc_name_eng').AsString; // часть тела
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select asu.get_ib(:pfk_pacid) as numib from dual ';
    ods.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('fk_pacid').AsInteger);
    ods.Open;
    sIb := ods.FieldByName('numib').AsString; // номер медицинской карты
// проверяем GUID
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fc_guid from asu.vnaz_guid where fk_nazid = :pfk_nazid ';
    ods.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('fk_id').AsInteger);
    ods.Open;
    if ods.RecordCount > 0 then
      begin
        sStudyUID := ods.FieldByName('fc_guid').AsString;
      end else
      begin
        odsGuid.Close;
        odsGuid.Open;
        sStudyUID := odsGuid.FieldByName('nextguid').AsString; // если нет то формируем новый GUID
      end;
  finally
    ods.Free;
  end;
// -- подключаемся к серверу
 { cnsDicomConnection1.Port := get_dicomwl_port;
  cnsDicomConnection1.Host := get_dicomwl_ip;
  cnsDBTable.Active := False;
  cnsDBTable.Active := True;
  if cnsDBTable.Locate('idfield', sStudyUID, []) = True then
  begin
    cnsDBTable.Edit;
    cnsDBTable.FieldByName('namefield').AsString := odsList.FieldByName('FIOPAC').AsString;
    cnsDBTable.FieldByName('enamefield').AsString := odsList.FieldByName('FIOPAC').AsString;
    cnsDBTable.FieldByName('apply_time').AsDateTime := odsList.FieldByName('fd_run').AsDateTime;
    cnsDBTable.FieldByName('uidfield').AsString := odsList.FieldByName('numberissl').AsString;
    cnsDBTable.FieldByName('birthdatefield').AsDateTime := odsList.FieldByName('fd_rojd').AsDateTime;
    if odsList.FieldByName('sex').AsString = 'М' then
      cnsDBTable.FieldByName('sexfield').AsString := 'M'
    else
      cnsDBTable.FieldByName('sexfield').AsString := 'F';
    cnsDBTable.FieldByName('doctorfield').AsString := odsList.FieldByName('vrachfio').AsString;
    cnsDBTable.FieldByName('modality').AsString := sModality;
    cnsDBTable.FieldByName('p_pid').AsString := sIb;
    cnsDBTable.FieldByName('accessionnumber').AsString := odsList.FieldByName('numberissl').AsString;
    cnsDBTable.FieldByName('bodypart').AsString := sBodyPart;
    cnsDBTable.Post;
    cnsDBTable.ApplyUpdates;
  end else
  begin
    cnsDBTable.Insert;
    cnsDBTable.FieldByName('namefield').AsString := odsList.FieldByName('FIOPAC').AsString;
    cnsDBTable.FieldByName('enamefield').AsString := odsList.FieldByName('FIOPAC').AsString;
    cnsDBTable.FieldByName('idfield').AsString := sStudyUID;
    cnsDBTable.FieldByName('apply_time').AsDateTime := odsList.FieldByName('fd_run').AsDateTime;
    cnsDBTable.FieldByName('uidfield').AsString := odsList.FieldByName('numberissl').AsString;
    cnsDBTable.FieldByName('birthdatefield').AsDateTime := odsList.FieldByName('fd_rojd').AsDateTime;
    if odsList.FieldByName('sex').AsString = 'М' then
      cnsDBTable.FieldByName('sexfield').AsString := 'M'
    else
      cnsDBTable.FieldByName('sexfield').AsString := 'F';
    cnsDBTable.FieldByName('doctorfield').AsString := odsList.FieldByName('vrachfio').AsString;
    cnsDBTable.FieldByName('modality').AsString := sModality;
    cnsDBTable.FieldByName('p_pid').AsString := sIb;
    cnsDBTable.FieldByName('accessionnumber').AsString := odsList.FieldByName('numberissl').AsString;
    cnsDBTable.FieldByName('bodypart').AsString := sBodyPart;
    cnsDBTable.Post;
    cnsDBTable. ApplyUpdates;
  end;  }
// -- vnaz_guid
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.SQL.Text := ' merge into asu.vnaz_guid using dual on (fk_nazid = :pfk_nazid) '+#13+
                   ' when not matched then insert(fk_nazid, fc_guid) values(:pfk_nazid, :pfc_guid) '+#13+
                   ' when matched then update set fc_guid = :pfc_guid where fk_nazid = :pfk_nazid ';
    oq.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('fk_id').AsInteger);
    oq.DeclareAndSet('pfc_guid', otString, sStudyUID);
    oq.Execute;
    os.Commit;
  finally
    Screen.Cursor := crDefault;
    oq.Free;
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

procedure TfrmMain.frxPrintListGetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'KAB' then Value := odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'DATENOW' then Value := VarToDateTime(dxdeDate.EditValue);
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

procedure TfrmMain.HL7Sender1ACKResponse(Sender: TObject);
//var oq : TOracleQuery;
begin
//  oq := TOracleQuery.Create(nil);
//  try
//    oq.Session := frmMain.os;
//    oq.Cursor := crSQLWait;
//    oq.SQL.Text := ' update asu.tnazis set fk_resultid = 1 where fk_id = :pfk_id '; // проставляем статус "Исследование отправлено на WLM"
//    oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
//    oq.Execute;
//    frmMain.os.Commit;
//  finally
//    oq.Free;
//  end;
end;

procedure TfrmMain.aCompareExecute(Sender: TObject);
var s1, sModality : string;
    ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select fc_name from asu.tmodality t1, asu.tsmid_modality t2 where t1.fk_id = t2.fk_modality and t2.fk_smid = :pfk_smid ';
    ods.DeclareAndSet('pfk_smid', otInteger, odsList.FieldByName('fk_smid').AsInteger);
    ods.Open;
    sModality := ods.FieldByName('fc_name').AsString;
  finally
    ods.Free;
  end;

  Application.CreateForm(TfrmCompare, frmCompare);
  try
    s1 := 'http://'+get_lookinside_ip+':'+get_lookinside_portweb+'/bind.html?'+
          'his_id='+IntToStr(odsList.FieldByName('fk_id').AsInteger)+'&'+
          'patient_name='+CyrToLatGOST(copy(odsList.FieldByName('fiopac').AsString, 1, Pos(' ', odsList.FieldByName('fiopac').AsString)-1))+'&'+ // передаем фамилию
          'patient_dob='+FormatDateTime('yyyy-mm-dd', odsList.FieldByName('fd_rojd').AsDateTime)+'&'+
          'study_modalities='+sModality+'&'+
          'device_name='+odsKab.FieldByName('nameapparat').AsString+'&'+
          'ae_title='+odsKab.FieldByName('aetitle').AsString+'&'+
          'filter_period=2&'+ // по умолчанию ставим за 2 дня
          'hash='+uMD5.MD5DigestToStr(MD5String(get_lookinside_login+get_lookinside_pass));
    frmCompare.wbCompare.Navigate(s1);
    frmCompare.ShowModal;
    RefreshQuery(odsList);
  finally
    frmCompare.Free;
  end;
end;

procedure TfrmMain.aCopyFioExecute(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := ReplaceSubStr(odsList.FieldByName('FIOPAC').AsString, '.', '');
end;

procedure TfrmMain.aCorrectPacExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmCorrectPac, frmCorrectPac);
  try
    frmCorrectPac.ShowModal;
    if frmCorrectPac.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.vnaz set fk_pacid = :pfk_pacid where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfk_pacid', otInteger, frmCorrectPac.odsPac.FieldByName('pacid').AsInteger);
          oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
          oq.Execute;
          os.Commit;
          RefreshQuery(odsList);
        finally
          oq.Free;
        end;
      end;
  finally
    frmCorrectPac.Free;
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

procedure TfrmMain.actPrintDateNazExecute(Sender: TObject);
begin
  DoPrintJournal('Печать журнала с сортировкой по дате наз.', odsList_SortDateNaz);
end;

procedure TfrmMain.actPrintDezExecute(Sender: TObject);
begin
  DoPrintJournal('Печать журнала - Дежурство', odsPrintDez);
end;

procedure TfrmMain.actPrintFioExecute(Sender: TObject);
begin
  DoPrintJournal('Печать журнала с сортировкой по ФИО', odsList_SortFIO);
end;

procedure TfrmMain.TVListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if odsList.RecordCount <> 0 then
    begin
      if Key = VK_RETURN then
        aNapravExecute(nil);
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

procedure TfrmMain.odsKabAfterOpen(DataSet: TDataSet);
begin
 // VNUMFLU.Visible := odsKab.FieldByName('is_flu').AsInteger = 1;
end;

end.
