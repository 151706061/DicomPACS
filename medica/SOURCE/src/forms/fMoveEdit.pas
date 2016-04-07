unit fMoveEdit;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,  DBCtrls, Mask, JvToolEdit, JvBaseEdits, ExtCtrls,
  Db, OracleData, ActnList, ComCtrls, ToolWin, Oracle, JvFormPlacement, Grids,
  DBGrids, HtmlHlp, Menus, Buttons, JvComponentBase, JvExStdCtrls, JvEdit,
  JvValidateEdit, Variants, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxTextEdit, cxSpinEdit,
  cxCurrencyEdit, cxCalendar, cxDBLookupComboBox, cxContainer, cxMaskEdit,
  cxDropDownEdit, FR_DSet, FR_DBSet, FR_Class, cxLookAndFeelPainters, cxLookAndFeels,
  cxButtons, cxGridBandedTableView, cxGridDBBandedTableView, cxLookupEdit,
  cxDBLookupEdit, cxCheckComboBox, cxCheckBox, cxButtonEdit, fdmMoveedit;


type
  TfrmMoveEdit = class(TForm)
		CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    alActions: TActionList;
    acenter: TAction;
    acesc: TAction;
    acins: TAction;
    acedit: TAction;
    acdel: TAction;
    acrefresh: TAction;
    dsKart: TDataSource;
		odsKart: TOracleDataSet;
    paDocHeader: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Panel2: TPanel;
    Label7: TLabel;
    laFrom: TLabel;
    Label11: TLabel;
    laSummByDoc: TLabel;
    cePriceDoc: TJvValidateEdit;
    Label10: TLabel;
    laTo: TLabel;
    lbDemand: TLabel;
    eNumDoc: TEdit;
    lbFrom: TLabel;
    FormStorage: TJvFormStorage;
    Label5: TLabel;
    acCopyQuantity: TAction;
    acCalcOstDoc: TAction;
    tbCalcOstDoc: TButton;
    acTrebProccess: TAction;
    bbuSelectVidSpasanie: TBitBtn;
    pmSelectVidSpisanie: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    acSelectVidSpasanie: TAction;
    grbTrebovanie: TGroupBox;
    dsZatrebovano: TDataSource;
    odsZatrebovano: TOracleDataSet;
    grbRaskhod: TGroupBox;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbuAdd: TToolButton;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    Splitter1: TSplitter;
    lcbMO_GROUP_FROM: TDBLookupComboBox;
    ToolButton6: TToolButton;
    tbuAutoFill: TToolButton;
    odsTrebOst: TOracleDataSet;
    dsTrebOst: TDataSource;
    cxGridRashKart: TcxGrid;
    cxGridRashKartLevel1: TcxGridLevel;
    cxGridRashKartDBTableView1: TcxGridDBTableView;
    cxGridRashKartDBTableView1ROWNUM: TcxGridDBColumn;
    cxGridRashKartDBTableView1NAMEKART: TcxGridDBColumn;
    cxGridRashKartDBTableView1FN_PARTY_NUM: TcxGridDBColumn;
    cxGridRashKartDBTableView1FC_SERIAL: TcxGridDBColumn;
    cxGridRashKartDBTableView1FN_KOL: TcxGridDBColumn;
    cxGridRashKartDBTableView1FK_UEI: TcxGridDBColumn;
    cxGridRashKartDBTableView1FN_PRICE: TcxGridDBColumn;
    cxGridRashKartDBTableView1SUMM: TcxGridDBColumn;
    cxGridRashKartDBTableView1ODR: TcxGridDBColumn;
    cxGridTreb: TcxGrid;
    cxGridTrebLevel1: TcxGridLevel;
    cxGridTrebDBTableView1: TcxGridDBTableView;
    cxGridTrebDBTableView1ROWNUM: TcxGridDBColumn;
    cxGridTrebDBTableView1NAMEKART: TcxGridDBColumn;
    cxGridTrebDBTableView1FN_TREBKOL: TcxGridDBColumn;
    cxGridTrebDBTableView1FN_KOL: TcxGridDBColumn;
    cxGridTrebDBTableView1FC_EDIZM: TcxGridDBColumn;
    cxGridTrebDBTableView1SUMM: TcxGridDBColumn;
    cxGridTrebDBTableView1ODR: TcxGridDBColumn;
    odsMO_GROUP: TOracleDataSet;
    DataSource1: TDataSource;
    deInvoiceDate: TcxDateEdit;
    deRegisterDate: TcxDateEdit;
    lcbMO_TO: TDBLookupComboBox;
    cxGridTrebDBTableView1FN_KOLOST: TcxGridDBColumn;
    pmPrinttreb: TPopupMenu;
    miPrintToFR: TMenuItem;
    miPrintToExcel: TMenuItem;
    paNazn: TPanel;
    buTreb: TcxButton;
    buNazn: TcxButton;
    buTrebAndNazn: TcxButton;
    cxGridTrebDBTableView1FC_NAZN_NAME: TcxGridDBColumn;
    cxGridTrebDBTableView1FN_NAZN_KOL_F: TcxGridDBColumn;
    cxGridTrebDBTableView1FC_NAZN_ED_IZM: TcxGridDBColumn;
    gbPacMedNaz: TGroupBox;
    gPacMedNazL: TcxGridLevel;
    gPacMedNaz: TcxGrid;
    tvPacMedNaz: TcxGridDBBandedTableView;
    tvPacMedNazColumn1: TcxGridDBBandedColumn;
    tvPacMedNazColumn2: TcxGridDBBandedColumn;
    tvPacMedNazColumn3: TcxGridDBBandedColumn;
    dsPacMedNaz: TDataSource;
    odsPacMedNaz: TOracleDataSet;
    cxGridRashKartMedLechID: TcxGridDBColumn;
    tvPacMedNazColLech: TcxGridDBBandedColumn;
    lcbMO_GROUP_TO: TcxLookupComboBox;
    pnlOnPost: TPanel;
    lblOnPost: TLabel;
    tvPacMedNazWasGivenAtDate: TcxGridDBBandedColumn;
    Panel3: TPanel;
    Shape5: TShape;
    Label9: TLabel;
    Shape1: TShape;
    Label13: TLabel;
    acAddByTrebDPC: TAction;
    cxGridRashKartDBTableView1FK_TREBDPC: TcxGridDBColumn;
    cxGridTrebDBTableView1FK_ID: TcxGridDBColumn;
    odsGetProvizorToSMSMedicsList: TOracleDataSet;
    tmrOnPost: TTimer;
    pmAdd: TPopupMenu;
    N4: TMenuItem;
    acInsbyEAN: TAction;
    N5: TMenuItem;
    cxGridRashKartDBTableView1FD_DATE_SPIS: TcxGridDBColumn;
    tbuSepFasIE: TToolButton;
    chbFasEI: TcxCheckBox;
    cxGridRashKartDBTableView1FK_FEI: TcxGridDBColumn;
    cxGridRashKartDBTableView1FN_FAS: TcxGridDBColumn;
    cxGridRashKartDBTableView1KARTID: TcxGridDBColumn;
    cxGridRashKartDBTableView1MEDICID: TcxGridDBColumn;
    cxGridRashKartDBTableView1DPCID: TcxGridDBColumn;
    cxGridRashKartDBTableView1FD_GODEN: TcxGridDBColumn;
    acAddWithTrebDPC: TAction;
    N6: TMenuItem;
    StatusBar1: TStatusBar;
    cxGridTrebDBTableView1FD_CREATE: TcxGridDBColumn;
    cxGridTrebDBTableView1FK_CREATE_MO_ID: TcxGridDBColumn;
    cxGridTrebDBTableView1FD_EDIT: TcxGridDBColumn;
    cxGridTrebDBTableView1FK_EDIT_MO_ID: TcxGridDBColumn;
    miTrebDPC: TMenuItem;
    acEditTrebPDC: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    acDelTrebDPC: TAction;
    N10: TMenuItem;
    cxGridTrebDBTableView1MEDICID: TcxGridDBColumn;
    cxGridRashKartDBTableView1FC_RETURN_POST: TcxGridDBColumn;
    buPostav: TButton;
    laKontrakt: TLabel;
    lcbKontrakt: TcxLookupComboBox;
    lcbSchetFaktura: TcxLookupComboBox;
    laSchetFaktura: TLabel;
    lcbFinSource: TcxLookupComboBox;
    laFinSource: TLabel;
    laPayCond: TLabel;
    lcbPayCond: TcxLookupComboBox;
    lcbMO_FROM: TcxLookupComboBox;
    cxGridRashKartDBTableView1FC_NAME_LAT: TcxGridDBColumn;
    cxGridRashKartDBTableView1FC_FINSOURCE: TcxGridDBColumn;
    odsPrihDoc: TOracleDataSet;
    cxGridRashKartDBTableView1_FC_INV_NOMER: TcxGridDBColumn;
    ToolButton1: TToolButton;
    tbuTemplate: TToolButton;
    acAddToTemplate: TAction;
    pmTemplate: TPopupMenu;
    N7: TMenuItem;
    N11: TMenuItem;
    acLoadFromTemplate: TAction;
    cxGridRashKartDBTableView1FC_QUOTA_CODE: TcxGridDBColumn;
    cxGridRashKartDBTableView1FN_NDS: TcxGridDBColumn;
    cxGridRashKartDBTableView1FN_PRICE_MNF: TcxGridDBColumn;
    cxGridRashKartDBTableView1FN_NACENKA: TcxGridDBColumn;
    cxGridRashKartDBTableView1FL_JNVLS: TcxGridDBColumn;
    N12: TMenuItem;
    N13: TMenuItem;
    dePacDate: TcxDateEdit;
    pmCorrectTrebLink: TPopupMenu;
    miLinkWithTreb: TMenuItem;
    miDelLink: TMenuItem;
    miCheckLink: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    pmPacTypeSelect: TPopupMenu;
    miPacStac: TMenuItem;
    miPacAmb: TMenuItem;
    N16: TMenuItem;
    pmAutoFill_FinSource: TPopupMenu;
    miAutoFill_By_FinSource: TMenuItem;
    miAutoFill_not_by_FinSource: TMenuItem;
    buGetAutoNum: TcxButton;
    cxGridRashKartDBTableView1FL_MIBP: TcxGridDBColumn;
    mComment: TcxLookupComboBox;
    cxGridRashKartDBTableView1FC_INTERNATIONAL_NAME: TcxGridDBColumn;
    cxGridTrebDBTableView1FC_INTERNATIONAL_NAME: TcxGridDBColumn;
    cxGridRashKartDBTableView1FL_FORMULAR: TcxGridDBColumn;
    cxGridRashKartDBTableView1FC_CLASS: TcxGridDBColumn;
    cxGridTrebDBTableView1FC_FPACK_EI: TcxGridDBColumn;
    cxGridTrebDBTableView1FN_MASS: TcxGridDBColumn;
    cxGridTrebDBTableView1FC_MASS_EI: TcxGridDBColumn;
    cxGridRashKartDBTableView1FN_MASS: TcxGridDBColumn;
    cxGridRashKartDBTableView1FK_MASSUNITS: TcxGridDBColumn;
    acAddByPacNazn: TAction;
    N14: TMenuItem;
    tbuAutoFillPlan: TToolButton;
    pmAutoFillPlan_FinSource: TPopupMenu;
    miAutoFillPlan_By_FinSource: TMenuItem;
    miAutoFillPlan_not_by_FinSource: TMenuItem;
    procedure acescExecute(Sender: TObject);
    procedure acenterExecute(Sender: TObject);
    procedure acinsExecute(Sender: TObject);
    procedure aceditExecute(Sender: TObject);
    procedure acdelExecute(Sender: TObject);
//    procedure dxDBgRashKartEdited(Sender: TObject; Node: TdxTreeListNode);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acCopyQuantityExecute(Sender: TObject);
    procedure acCalcOstDocExecute(Sender: TObject);
    procedure acTrebProccessExecute(Sender: TObject);
    procedure odsKartAfterScroll(DataSet: TDataSet);
    function FormHelp(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
    procedure acSelectVidSpasanieExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure odsKartAfterRefresh(DataSet: TDataSet);

    procedure cxGridTrebDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridRashKartDBTableView1DblClick(Sender: TObject);
    procedure cxGridTrebDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure miPrintToFRClick(Sender: TObject);
    procedure lcbMO_TOClick(Sender: TObject);
    procedure lcbMO_GROUP_TO1Click(Sender: TObject);
    procedure miPrintToExcelClick(Sender: TObject);
    procedure buTrebClick(Sender: TObject);
    procedure buNaznClick(Sender: TObject);
    procedure buTrebAndNaznClick(Sender: TObject);
    procedure tvPacMedNazCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridRashKartDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure tvPacMedNazFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure tvPacMedNazCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridRashKartDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure alActionsUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure lcbMO_GROUP_TOPropertiesEditValueChanged(Sender: TObject);
    procedure lblOnPostMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lblOnPostMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure deInvoiceDatePropertiesEditValueChanged(Sender: TObject);
    procedure tvPacMedNazCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure acAddByTrebDPCExecute(Sender: TObject);
    procedure tbuAddClick(Sender: TObject);
    procedure odsZatrebovanoAfterScroll(DataSet: TDataSet);
    procedure cxGridRashKartDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridTrebDBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tmrOnPostTimer(Sender: TObject);
    procedure lcbMO_TOCloseUp(Sender: TObject);
    procedure acInsbyEANExecute(Sender: TObject);
    procedure chbFasEIClick(Sender: TObject);
    procedure acAddWithTrebDPCExecute(Sender: TObject);
    procedure acEditTrebPDCExecute(Sender: TObject);
    procedure acDelTrebDPCExecute(Sender: TObject);
    procedure FormStorageRestorePlacement(Sender: TObject);
    procedure odsKartApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure buPostavClick(Sender: TObject);
    procedure lcbMO_FROMPropertiesEditValueChanged(Sender: TObject);
    procedure tbuTemplateClick(Sender: TObject);
    procedure acLoadFromTemplateExecute(Sender: TObject);
    procedure acAddToTemplateExecute(Sender: TObject);
    procedure lcbFinSourcePropertiesEditValueChanged(Sender: TObject);
    procedure dePacDatePropertiesEditValueChanged(Sender: TObject);
    procedure lcbMO_GROUP_TOPropertiesPopup(Sender: TObject);
    procedure lcbMO_GROUP_TOPropertiesInitPopup(Sender: TObject);
    procedure miLinkWithTrebClick(Sender: TObject);
    procedure miCheckLinkClick(Sender: TObject);
    procedure miDelLinkClick(Sender: TObject);
    procedure miPacStacClick(Sender: TObject);
    procedure miAutoFill_By_FinSourceClick(Sender: TObject);
    procedure miAutoFill_not_by_FinSourceClick(Sender: TObject);
    procedure tbuAutoFillClick(Sender: TObject);
    procedure buGetAutoNumClick(Sender: TObject);
    procedure odsTrebOstApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean; var NewRowId: string);
    procedure acAddByPacNaznExecute(Sender: TObject);
    procedure tbuAutoFillPlanClick(Sender: TObject);
  private
    FbReturn: Boolean;     // флаг режима возврат
    FIsShowTreb : Boolean; // флаг отображения списка препаратов из требования
    FidDocs : Integer;     // ID документа из TDOCS, по которому производится операция
    FFK_TrebDPC, FFK_Treb : integer;
    FDrawTrebDPC, FDrawDPC : Boolean;  // флаги очистки списков из требования и из расхода
    FPrihByShtrihCode, FIsAddRashWithTrebShow, FIsAddRashWithTrebExec : Boolean;
    fIsAddByPacNazn : boolean;

    FIsShowPacMedNaz : Boolean; // флаг отображения списка мед.назначений пациента Added by A.Nakorjakov 17.12.2007 13:39:20
    FIsCanShowPostGiven:Boolean; // можно ли показывать формочку "Медикаменты, выданные постовой медсестрой пациенту"
                                 //Форму можно показывать когда (frmMain.Medses_Give_Mode = POSTNURSEMODE and списание на пациента)
    sMessage: String;
    IsChanged : Boolean;
    FViewNum : Integer;
    FVidNum  : Integer;
    FGodMode : Boolean;
    IsFormUpdateNow:Boolean;// Added by A.Nakorjakov 18.12.2007 11:48:57
    FIspnlOnPostEnable:Boolean; // Added by A.Nakorjakov 10.01.2008 13:49:55
    procedure SetodsPacMedNazVariable(); // Added by A.Nakorjakov 17.12.2007 15:44:31
    procedure SetbReturn(const Value: Boolean);
    procedure SetIsShowTreb(const Value: Boolean);
    procedure SetidDocs(const Value: Integer);
    procedure SetSpisanieVid( aSpisanieVid : integer );
    procedure SetIsShowPacMedNaz(Value: Boolean); // Added by A.Nakorjakov 17.12.2007 13:40:05
    procedure SetIsCanShowPostGiven(Value: Boolean); // Added by A.Nakorjakov 17.12.2007 13:40:05
    procedure SaveSootvetstvieToPac(ANazMedLechID:Integer;ASotrFrom:Integer;AMode:Integer;AKol:Double;ADpcID:Integer; AFasKol : Double); // Added by A.Nakorjakov 17.12.2007 17:49:49
    procedure DoSootvetstvieToPac( AKol:Double;ADpcID:Integer; ANazMedLechId : Integer; AFasKol : Double); // Added by A.Nakorjakov 17.12.2007 18:05:28
    procedure SetDateToSootvetstvie(); // Added by A.Nakorjakov 17.12.2007 18:05:52
    procedure DoEditSootvetstvieKol(AKol:Double;ADpcID:Integer; AFasKol : Double); // Added by A.Nakorjakov 18.12.2007 10:23:56
    procedure DeleteSootvetstvie( ADpcID : Integer; ANazMarkId : integer ); // Added by A.Nakorjakov 18.12.2007 11:08:13
    procedure SetAcDelEnable(); // Added by A.Nakorjakov 18.12.2007 11:00:49
    procedure SetIspnlOnPostEnable(Value:Boolean); // Added by A.Nakorjakov 10.01.2008 13:50:05
    procedure SetIsAddRashWithTrebShow(aValue:Boolean);
    procedure SetbCanEdit(const Value: Boolean); //
    procedure DoMakeAutoFill ( AFinSrcId : Integer = -1 ; AIsExecute : Boolean = True );

//    procedure CalcSummDpc;
//    procedure SetbReturn(const Value: Boolean);
		{ Private declarations }
  public
    { Public declarations }
    fromid, toid : integer;
    flIns     : Boolean;
//    idDocs    : Integer;  // перенесено в property
    MOOWNERID : Integer;
    FD_DATA   : TDateTime;
    FbCanEdit  : Boolean;  // флаг возможности изменения расхода, например нельзя редактировать когда документ подписан
    who_called:integer; // 1 - нажали Движение>Добавить из сп. карточек  , 2 - движение > возврат, 3- Движение>Добавить списание медикаментов
    SpisanieVid : Integer;
    IsNewClearTreb : Boolean;
    CurDPIDLockID, CurTrebLockID : string;
//    property bReturn: Boolean read FbReturn write SetbReturn(const Value: Boolean);

    _dmMoveEdit: TdmMoveEdit;

    property bReturn: Boolean read FbReturn write SetbReturn;
    property IsShowTreb: Boolean read FIsShowTreb write SetIsShowTreb;
    property idDocs : Integer read  FidDocs write SetidDocs;
    property IsShowPacMedNaz:Boolean read FIsShowPacMedNaz write SetIsShowPacMedNaz; // Added by A.Nakorjakov 17.12.2007 13:40:56
    property IsCanShowPostGiven:Boolean read FIsCanShowPostGiven write SetIsCanShowPostGiven; // Added by A.Nakorjakov 29.12.2007 10:02:00
    property IspnlOnPostEnable:Boolean read FIspnlOnPostEnable write SetIspnlOnPostEnable; // Added by A.Nakorjakov 10.10.2008
    property IsAddRashWithTrebShow: Boolean  read FIsAddRashWithTrebShow write SetIsAddRashWithTrebShow;
    property bCanEdit  : Boolean read FbCanEdit write SetbCanEdit;  // флаг возможности изменения расхода, например нельзя редактировать когда документ подписан

    procedure SetViewMode( aViewNumber : Integer; aCanIns, aCanEdit : Boolean );
//    procedure DisableInput;
//    procedure DisableActions;
    procedure EnableInput( aEnabled : Boolean );
    procedure EnableActions( aEnabled : Boolean );
    procedure UpdateFK_TREBDPC(aDPCID, aFK_TrebDPC : Integer);
    procedure Update_FD_DATE_SPIS(aDPCID : Integer; aFD_DATE_SPIS : TDateTime);
    function  SetDocNum(aShowMessages : boolean = True) : integer;

  end;

function DoShowMoveEdit(var aDocID : Integer; const aCanEdit : Boolean = True; const aDocVid: Integer = 0; aDocVidMove : Integer = 0; aFK_TREB : Integer = -1; aIsNewClearTreb : Boolean = False): Integer;

var
	frmMoveEdit: TfrmMoveEdit;


implementation

uses fmainform, fMoveList, JvDBUtils, fMedKardLst, fMedKardEdit, fKartsLst,
     PKGMEDSES,Math, fdmPrintReports, fPostGiven, DateUtils,
     fMedicWithoutLink, fLinkedDocs, fPostavLst, cxLookupGrid, fdmmain,
     fTemplates, fInputEdit, fMedic, fZatrebList, fNaznList;

{$R *.DFM}
//  aFK_TREB - заполнять только в случае создания расхода по требованию, для
function DoShowMoveEdit(var aDocID : Integer; const aCanEdit : Boolean = True; const aDocVid: Integer = 0; aDocVidMove : Integer = 0; aFK_TREB : Integer = -1; aIsNewClearTreb : Boolean = False): Integer;
var
  FIsNewDoc : Boolean;
  FDocVid, FDocVidMove : Integer;
  Prizn : Integer;
  sLockMO : string;
  //nTmpTrebID : Integer; //Added by Neronov A.S. 19.10.2011
  frmMoveEdit : TfrmMoveEdit;
begin
  Prizn := 0;
  Result := mrNone;
//  FIsNewDoc := False;
  FDocVid := aDocVid;
  FDocVidMove := aDocVidMove;
  //Application.CreateForm(TfrmMoveEdit, frmMoveEdit);
  frmMoveEdit := TfrmMoveEdit.Create(Application);

  frmMoveEdit._dmMoveEdit.odsComment.SetVariable('pVidmove',aDocVidMove);
  frmMoveEdit._dmMoveEdit.odsComment.Open;

  try
    if (FDocVid = VID_DVIJENIE)and(FDocVidMove = VIDMOVE_NAKL_TREB) then
    begin
      frmMoveEdit.IsAddRashWithTrebShow := (dmMain.ConfigParams.GetParamValue('FUNC_EDIT_TREB_IN_RASH', 0) = 1); // ставим флаг добавления расхода и накладной
      frmMoveEdit.IsNewClearTreb    := aIsNewClearTreb;
    end;

    //--------------------------------------------------------------------------
    if (aDocID <= 0) then
    begin
      if    (FDocVid = VID_PRIHOD)  and(FDocVidMove in [VIDMOVE_PRIH_POST, VIDMOVE_VVOD_OST, VIDMOVE_PRIH_RPO])
         or (FDocVid = VID_DVIJENIE)and(FDocVidMove in [VIDMOVE_NAKL_TREB, VIDMOVE_KARD_LIST, VIDMOVE_RETURN, VIDMOVE_TO_REZERV, VIDMOVE_FROM_REZERV] )
         or (FDocVid = VID_RASHOD)  and(FDocVidMove in [VIDMOVE_SPISANIE_RPO,VIDMOVE_SPISANIE, VIDMOVE_RETURN_POSTAV, VIDMOVE_OTPUSK_PO_NAC_PR, VIDMOVE_OTPUSK_PO_CEL_PROG, VIDMOVE_SPISANIE_HITEC]   ) then
      begin
//        FIsNewDoc := True;
        frmMoveEdit.SetViewMode( FDocVidMove, True, True );
        aDocID  := dmMain.PkgPrihRash.Createshablon( FDocVid, FDocVidMove );
        dmMain.os.Commit;
        frmMoveEdit.MOOWNERID := round(dmMain.pkgMedSes.GETCURMO);
        frmMoveEdit.FD_DATA   := ServerDate(dmMain.os);
        //
        frmMoveEdit.deInvoiceDate.Date  := frmMoveEdit.FD_DATA;
        frmMoveEdit.deRegisterDate.Date := {TRUNC(}frmMoveEdit.FD_DATA{)};
//        frmMoveEdit.deRegistrTime.Time  := Frac(frmMoveEdit.FD_DATA);
        if (FDocVid = VID_PRIHOD) then //---------------- приходы ----------------------------------------
        begin
//commented A.Nakorjakov 26-12-2007  frmMoveEdit.lcbMO_GROUP_TO.KeyValue  := dmMain.pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO;
          frmMoveEdit.lcbMO_GROUP_TO.EditValue  := dmMain.FK_CurMO_GROUP; //pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO; // Added by A.Nakorjakov 26.12.2007 14:25:36
          frmMoveEdit.lcbMO_TO.KeyValue        := dmMain.pkgMedSes.GETCURMO;
          if (FDocVidMove = VIDMOVE_VVOD_OST) then  frmMoveEdit.eNumDoc.Text := IntToStr(aDocID);
        end;


        if (FDocVid = VID_DVIJENIE)and(FDocVidMove = VIDMOVE_NAKL_TREB) then //---------------- Расход по требованию ----------------------------------------
        begin
          if dmMain.ConfigParams.GetParamValue('FUNC_VIDMOVE_'+IntToStr(FDocVidMove)+'_NUMBER_AUTO_FILL_MODE', 0) = 1 then
            frmMoveEdit.eNumDoc.Text := IntToStr(aDocID);

          frmMoveEdit.FFK_Treb := aFK_TREB;
          frmMoveEdit._dmMoveEdit.odsTTREB.SetVariable('AFK_TREB', aFK_TREB);
          frmMoveEdit._dmMoveEdit.odsTTREB.Open;

          if dmMain.ConfigParams.GetParamValue('FUNC_COPY_COMMENT_IN_TREB',0) = 1 then
            frmMoveEdit.mComment.Text := frmMoveEdit._dmMoveEdit.odsTTREB.FieldByName('fc_comment').AsString;

          if frmMoveEdit._dmMoveEdit.odsTTREB.Eof then
          begin
            Result := mrCancel;
            Exit;
          end;

          frmMoveEdit.odsTrebOst.Close;
          frmMoveEdit.odsTrebOst.SetVariable('FK_TREBID', aFK_TREB);

          // блокировка документа от изменения другим пользователем
          if (aCanEdit)and(frmMoveEdit.CurTrebLockID = '') then
          begin
            sLockMO := '';
            case dmMain.SetLock('MED.TTREB.FK_ID='+IntTOStr(aFK_TREB), frmMoveEdit.CurTrebLockID, sLockMO) of
              0 : ;
              else
              begin
                Application.MessageBox(PAnsiChar('Выбранный документ уже редактируется другим сотрудником:'#13#10+sLockMO), 'Внимание', MB_OK+MB_ICONWARNING);
                Screen.Cursor := crDefault;
                Result := mrCancel;
                Exit;
              end;
            end;
          end;

          if frmMoveEdit._dmMoveEdit.odsTTREB.FieldByName('fk_dpid').IsNull then
          begin
//            aDocID := dmMain.PkgPrihRash.Createshablon(2, 2); // выдача по требованию (см. PKG_PRIHRASH.Get_PrihRashPriznak)
//            FIsNewDoc := True;
            //пробить требование документом idDocs
            frmMoveEdit._dmMoveEdit.oqDoSetDocToTreb.SetVariable('FK_ID', aFK_TREB);
            frmMoveEdit._dmMoveEdit.oqDoSetDocToTreb.SetVariable('FK_DPID', aDocID);
            frmMoveEdit._dmMoveEdit.oqDoSetDocToTreb.Execute;

            if (dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN) then
              frmMoveEdit.eNumDoc.Text := IntToStr(aDocID);

            // переворачиваем от кого и кому - поскольку в требовании указывается кому требование и для кого, а расход по требованию - это ответный документ
            frmMoveEdit.lcbMO_GROUP_FROM.KeyValue  := frmMoveEdit._dmMoveEdit.odsTTREB.fieldbyname('FK_MOGROUPID_TO').AsInteger;
//commented A.Nakorjakov 26-12-2007  frmMoveEdit.lcbMO_GROUP_TO.KeyValue    := frmMoveEdit.odsTTREB.fieldbyname('FK_MOGROUPID_FROM').AsInteger;
            frmMoveEdit.lcbMO_GROUP_TO.EditValue    := frmMoveEdit._dmMoveEdit.odsTTREB.fieldbyname('FK_MOGROUPID_FROM').AsInteger; // Added by A.Nakorjakov 26.12.2007 14:26:04

            frmMoveEdit.lcbMO_FROM.EditValue  := frmMoveEdit._dmMoveEdit.odsTTREB.fieldbyname('FK_MOTOID').AsInteger;
            frmMoveEdit.lcbMO_TO.KeyValue    := frmMoveEdit._dmMoveEdit.odsTTREB.fieldbyname('FK_MOFROMID').AsInteger;

            // Edited by Neronov A.S. 25.11.2011
            // если настройка включена, то ставим sysdate, иначе дату регистрации требования
            if (dmMain.ConfigParams.GetParamValue('FUNC_USE_SYSDATE_FOR_TREB_NAKL', 0) = 1) then
              frmMoveEdit.deInvoiceDate.Date   := TRUNC(ServerDate(dmMain.os))
            else
              frmMoveEdit.deInvoiceDate.Date   := TRUNC(frmMoveEdit._dmMoveEdit.odsTTREB.fieldbyname('FD_DATE').AsDateTime);

            if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1)and
               (dmMain.ConfigParams.GetParamValue('FUNC_REQUIRE_FINSOURCE_IN_TREB', 0) = 1) then
              frmMoveEdit.lcbFinSource.EditValue := frmMoveEdit._dmMoveEdit.odsTTREB.FieldByName('FK_FINSOURCE_ID').AsVariant;
          end  // if frmMoveEdit.odsTTREB.FieldByName('fk_dpid').IsNull then
          else
            Exit; // Если передали требобвание, которое уже подбито документом - по номеру требования только создается документ
        end;

        if (FDocVid = VID_DVIJENIE)and(FDocVidMove = VIDMOVE_KARD_LIST) then //---------------- передача в др. отделение ----------------------------------------
        begin
          frmMoveEdit.lcbMO_GROUP_FROM.KeyValue := dmMain.FK_CurMO_GROUP; //pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO;
          frmMoveEdit.lcbMO_GROUP_FROM.Enabled  := False;

          if dmMain.ConfigParams.GetParamValue('FUNC_VIDMOVE_'+IntToStr(FDocVidMove)+'_NUMBER_AUTO_FILL_MODE', 1) = 1 then
            frmMoveEdit.eNumDoc.Text := IntToStr(aDocID);
        end;

        if (FDocVid = VID_DVIJENIE)and(FDocVidMove in [VIDMOVE_TO_REZERV, VIDMOVE_FROM_REZERV]) then
        begin
          if dmMain.ConfigParams.GetParamValue('FUNC_VIDMOVE_'+IntToStr(FDocVidMove)+'_NUMBER_AUTO_FILL_MODE', 1) = 1 then
            frmMoveEdit.eNumDoc.Text := IntToStr(aDocID);
          // выставляем откуда и куда текущую группу МО в новом документе
          frmMoveEdit.lcbMO_GROUP_TO.EditValue    := dmMain.FK_CurMO_GROUP; //pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO;
          frmMoveEdit.lcbMO_TO.KeyValue           := dmMain.pkgMedSes.GETCURMO;
          frmMoveEdit.lcbMO_GROUP_FROM.KeyValue   := frmMoveEdit.lcbMO_GROUP_TO.EditValue;
          frmMoveEdit.lcbMO_FROM.EditValue        := frmMoveEdit.lcbMO_TO.KeyValue;
        end;

        //---------------- Возврат препаратов ------------------------------------------
        if (FDocVid = VID_DVIJENIE)and(FDocVidMove = VIDMOVE_RETURN) then //возврат в аптеку
        begin
          frmMoveEdit.lcbMO_GROUP_FROM.KeyValue := dmMain.FK_CurMO_GROUP; // pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO;
          frmMoveEdit.lcbMO_FROM.EditValue      := dmMain.pkgMedSes.GETCURMO;
          if dmMain.ConfigParams.GetParamValue('FUNC_VIDMOVE_'+IntToStr(FDocVidMove)+'_NUMBER_AUTO_FILL_MODE', 1) = 1 then
            frmMoveEdit.eNumDoc.Text := IntToStr(aDocID);
          frmMoveEdit.lcbMO_GROUP_TO.EditValue := dmMain.GetProvizorsMO_GROUPID;

          frmMoveEdit.lcbMO_GROUP_TO.Enabled := (frmMoveEdit.lcbMO_GROUP_TO.EditValue = -1);
        end;

        if (FDocVid = VID_RASHOD) then//---------------- Списания
        begin
          frmMoveEdit.lcbMO_GROUP_FROM.KeyValue := dmMain.FK_CurMO_GROUP; // pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO;
          frmMoveEdit.lcbMO_FROM.EditValue      := dmMain.pkgMedSes.GETCURMO;
          frmMoveEdit.lcbMO_GROUP_FROM.Enabled  := False;
          if dmMain.ConfigParams.GetParamValue('FUNC_VIDMOVE_'+IntToStr(FDocVidMove)+'_NUMBER_AUTO_FILL_MODE', 1) = 1 then
            frmMoveEdit.eNumDoc.Text := IntToStr(aDocID);
        end;

        frmMoveEdit.bCanEdit := True;
        FIsNewDoc := True;
        frmMoveEdit._dmMoveEdit.odsTDOCS.SetVariable('ADPID', aDocID);
        frmMoveEdit._dmMoveEdit.odsTDOCS.Open;
        if frmMoveEdit._dmMoveEdit.odsTDOCS.Eof then
        begin
          Result := mrCancel;
          Exit; // подсунули неверный номер документа - валим отседа
        end;
      end
      else
        Exit; //новые виды расходов и приходов отсекаем и не обрабатываем
    end // if aDocID < 0 then
    else
    begin
      FIsNewDoc := False;
      frmMoveEdit.bCanEdit := aCanEdit;

      frmMoveEdit._dmMoveEdit.odsTDOCS.SetVariable('ADPID', aDocID);
      frmMoveEdit._dmMoveEdit.odsTDOCS.Open;
      if frmMoveEdit._dmMoveEdit.odsTDOCS.Eof then
      begin
        Result := mrCancel;
        Exit; // подсунули неверный номер документа - валим отседа
      end;

//      try
//        dmMain.LockTableRecords( 'med.tdocs', 'dpid', IntToStr(aDocID) );
//      except
//        on E: EOracleError do
//        begin
//          Application.MessageBox('Выбранный документ уже редактируется другим сотрудником', 'Внимание', MB_OK+MB_ICONWARNING);
//          Exit;
//        end;
//      end;

      // блокировка документа от изменения другим пользователем
      if frmMoveEdit.bCanEdit then
      begin
        sLockMO := '';
        case dmMain.SetLock('MED.TDOCS.DPID='+IntTOStr(aDocID), frmMoveEdit.CurDPIDLockID, sLockMO) of
          0 : ;
          else
          begin
            Application.MessageBox(PAnsiChar('Выбранный документ уже редактируется другим сотрудником:'#13#10+sLockMO), 'Внимание', MB_OK+MB_ICONWARNING);
            Screen.Cursor := crDefault;
            Result := mrCancel;
            Exit;
          end;
        end;
      end;
      {  //Пока не используем. Возможно даже не нужно
      // блокировка документа от изменения другим пользователем
      if (frmMoveEdit.bCanEdit)and(frmMoveEdit.CurTrebLockID = '') and
         ((_dmMoveEdit.odsTDOCS.FieldByName('fp_vid').AsInteger = VID_DVIJENIE)and(_dmMoveEdit.odsTDOCS.FieldByName('fp_vidmove').AsInteger = VIDMOVE_NAKL_TREB)) then
      begin
        sLockMO := '';
        with TOracleDataSet.Create(frmMoveEdit) do begin
          Session := _dmMoveEdit.odsTDOCS.Session;
          SQL.Text := 'select FK_ID from med.ttreb where fk_dpid = '+IntTOStr(aDocID);
          Open;
          nTmpTrebID := -1;
          if RecordCount > 0 then nTmpTrebID := FieldByName('FK_ID').AsInteger;
          Close;
          Free;
        end;

        case dmMain.SetLock('MED.TTREB.FK_ID='+IntTOStr(nTmpTrebID), frmMoveEdit.CurTrebLockID, sLockMO) of
          0 : ;
          else
          begin
            Application.MessageBox(PAnsiChar('Выбранный документ уже редактируется другим сотрудником:'#13#10+sLockMO), 'Внимание', MB_OK+MB_ICONWARNING);
            Screen.Cursor := crDefault;
            Result := mrCancel;
            Exit;
          end;
        end;
      end;
      }

      if (frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('fp_vid').AsInteger = VID_DVIJENIE)and(frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('fp_vidmove').AsInteger = VIDMOVE_NAKL_TREB) then
        frmMoveEdit.IsAddRashWithTrebShow := (dmMain.ConfigParams.GetParamValue('FUNC_EDIT_TREB_IN_RASH', 0) = 1); // ставим флаг добавления расхода и накладной

      frmMoveEdit.toid := frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('FK_MOGROUPID_TO').asinteger;
      frmMoveEdit.SpisanieVid := frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('fn_spisanievid').AsInteger; // обязательно делать заранее
      frmMoveEdit.SetViewMode( frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('fp_vidmove').AsInteger, (frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('FL_EDIT').AsInteger <> 0)and(aCanEdit), (frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('FL_EDIT').AsInteger <> 0)and(aCanEdit) );
      // заполняем поля при открытии существующего документа
      frmMoveEdit.MOOWNERID   := frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('moownerid').AsInteger;
      frmMoveEdit.FD_DATA     := frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('fd_data').AsDateTime;

      frmMoveEdit.FFK_Treb    := frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('fk_trebid').AsInteger;
//      frmMoveEdit.bCanEdit    := frmMoveEdit.odsTDOCS.FieldByName('FL_EDIT').AsInteger <> 0;

      frmMoveEdit.cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(aDocID, 2);
      frmMoveEdit.lcbMO_GROUP_FROM.KeyValue  := frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('FK_MOGROUPID_FROM').asinteger;
//commented A.Nakorjakov 26-12-2007  frmMoveEdit.lcbMO_GROUP_TO.KeyValue    := frmMoveEdit.odsTDOCS.fieldbyname('FK_MOGROUPID_TO').asinteger;
      frmMoveEdit.lcbMO_GROUP_TO.EditValue    := frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('FK_MOGROUPID_TO').asinteger; // Added by A.Nakorjakov 26.12.2007 14:26:52

      if frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('fp_vid').AsInteger = VID_PRIHOD then // если открываем готовый документ-накладную
        frmMoveEdit.lcbMO_FROM.EditValue := frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('POSTAVID').asinteger
      else
        frmMoveEdit.lcbMO_FROM.EditValue  := frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('MOFROMID').asinteger;

      if (frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('fp_vid').AsInteger = VID_RASHOD) and (frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('fp_vidmove').AsInteger = VIDMOVE_SPISANIE)
         and (dmMain.ConfigParams.GetParamValue('FUNC_USE_PROFIL', 0) = 1) then
        frmMoveEdit.lcbPayCond.EditValue := frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('MOTOID').asinteger;

      if (frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('fp_vid').AsInteger = VID_DVIJENIE) and (frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('fp_vidmove').AsInteger = VIDMOVE_KARD_LIST)
         and (dmMain.ConfigParams.GetParamValue('FUNC_USE_PROFIL', 0) = 1) then
        frmMoveEdit.lcbPayCond.EditValue := frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('MOTOID').asinteger;

      if frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('fp_vidmove').AsInteger = VIDMOVE_RETURN_POSTAV then
        frmMoveEdit.lcbMO_TO.KeyValue  := frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('POSTAVID').asinteger
      else
        frmMoveEdit.lcbMO_TO.KeyValue    := frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('MOTOID').asinteger;

      frmMoveEdit.deRegisterDate.Date := {TRUNC(}frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('fd_data').AsDateTime{)}; //truncated
//      frmMoveEdit.deRegistrTime.Time  := FRAC(frmMoveEdit.odsTDOCS.fieldbyname('fd_data').AsDateTime);
      frmMoveEdit.eNumDoc.Text        := frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('fc_doc').AsString;
      frmMoveEdit.deInvoiceDate.Date  := frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('fd_Invoice').AsDateTime;
      frmMoveEdit.mComment.Text       := frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('fc_comment').AsString;

      case frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('fp_vidmove').AsInteger of
        VIDMOVE_PRIH_POST:
        begin
          if(dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN) then
            frmMoveEdit.lcbMO_GROUP_FROM.KeyValue := frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('FK_VID_POST').AsInteger;

          if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_KONTRAKT', 0) = 1 then
            frmMoveEdit.lcbKontrakt.Text           := frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('FC_KONTRAKT').AsString;

          if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_SCHET_FAKTURA', 0) = 1 then
            frmMoveEdit.lcbSchetFaktura.Text           := frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('FC_SCHET_FAKTURA').AsString;

          if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1 then
            frmMoveEdit.lcbFinSource.EditValue := frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('FK_FINSOURCE_ID').AsVariant;

          if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_PAY_COND', 0) = 1 then
            frmMoveEdit.lcbPayCond.EditValue := frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('FK_PAYCOND_ID').AsVariant;
        end;

        VIDMOVE_SPISANIE:
        begin  // загружаем значение списание по причине
           if (frmMoveEdit.SpisanieVid = SPISANIE_VID_PRICHINA)and(dmMain.ConfigParams.GetParamValue('FUNC_USE_FIN_SOURCE_IN_SPIS_PO_PRICHINE', 0) = 1) then
            dmMain.AddAdditionalUpdateTable('FK_FINSOURCE_ID', otString, frmMoveEdit.lcbFinSource.EditValue);
        end;

        VIDMOVE_NAKL_TREB:
        begin
          if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE',           0) = 1)and
             (dmMain.ConfigParams.GetParamValue('FUNC_REQUIRE_FINSOURCE_IN_TREB', 0) = 1) then
            frmMoveEdit.lcbFinSource.EditValue := frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('FK_FINSOURCE_ID').AsVariant;
        end;
      end;
    end;  // else if aDocID <= 0 then

    //--------------------------------------------------------------------------
    // здесь уже работаем с существующим документом
//    if aCanEdit = False then frmMoveEdit.cxGridRashKartDBTableView1.OnDblClick := nil;
    //--------------------------------------------------------------------------
    FDocVid     := frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('fp_vid').AsInteger;  // берем тип документа
    FDocVidMove := frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('fp_vidmove').AsInteger;
    frmMoveEdit.FVidNum := FDocVid;

    frmMoveEdit.EnableActions( aCanEdit );
    frmMoveEdit.idDocs    := aDocID;
    frmMoveEdit.EnableInput( aCanEdit );
//---------------- Приход от поставщика ----------------------------------------
    if (FDocVid = VID_PRIHOD)and(FDocVidMove in[ VIDMOVE_PRIH_POST, VIDMOVE_VVOD_OST, VIDMOVE_PRIH_RPO]) then
    begin
      Prizn := 1;
      frmMoveEdit.lcbMO_GROUP_TO.Enabled := False;
    end;
//---------------- Расход по требованию ----------------------------------------
    if (FDocVid = VID_DVIJENIE)and(FDocVidMove = VIDMOVE_NAKL_TREB) then
    begin
      frmMoveEdit._dmMoveEdit.odsTrebByDoc.Close;
      frmMoveEdit._dmMoveEdit.odsTrebByDoc.SetVariable('ADPID', aDocID);
      frmMoveEdit._dmMoveEdit.odsTrebByDoc.Open;
      if frmMoveEdit._dmMoveEdit.odsTrebByDoc.Eof then
      begin
        Application.MessageBox('Для данного расхода нет связанного с ним требования', 'Внимание', MB_OK+MB_ICONINFORMATION);
//        Result := mrCancel;
//        Exit;
      end;

      frmMoveEdit._dmMoveEdit.odsTTREB.SetVariable('AFK_TREB', frmMoveEdit._dmMoveEdit.odsTrebByDoc.FieldByName('FK_ID').AsInteger);
      frmMoveEdit._dmMoveEdit.odsTTREB.Open;
      frmMoveEdit.IsShowTreb := True;
      if frmMoveEdit._dmMoveEdit.odsTTREB.Eof = False then
      begin
        // блокировка документа от изменения другим пользователем
        if (frmMoveEdit.bCanEdit)and(frmMoveEdit.CurTrebLockID = '') then
        begin
          sLockMO := '';
          case dmMain.SetLock('MED.TTREB.FK_ID='+IntTOStr(frmMoveEdit._dmMoveEdit.odsTTREB.FieldByName('FK_ID').AsInteger), frmMoveEdit.CurTrebLockID, sLockMO) of
            0 : ;
            else
            begin
              Application.MessageBox(PAnsiChar('Выбранный документ уже редактируется другим сотрудником:'#13#10+sLockMO), 'Внимание', MB_OK+MB_ICONWARNING);
              Screen.Cursor := crDefault;
              Result := mrCancel;
              Exit;
            end;
          end;
        end;
        frmMoveEdit.EnableInput  ( aCanEdit and (frmMoveEdit._dmMoveEdit.odsTTREB.FieldByName('FK_PROCESSED').AsInteger <> 2) );   // редактируем все, кроме обработанных
        frmMoveEdit.EnableActions( aCanEdit and (frmMoveEdit._dmMoveEdit.odsTTREB.FieldByName('FK_PROCESSED').AsInteger <> 2) ); // редактируем все, кроме обработанных

        frmMoveEdit.odsKartAfterRefresh(frmMoveEdit.odsKart); //Added by Neronov A.S.

//        if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE',           0) = 1)and
//           (dmMain.ConfigParams.GetParamValue('FUNC_REQUIRE_FINSOURCE_IN_TREB', 0) = 1) then
//          frmMoveEdit.lcbFinSource.Enabled := False;
      end;

      frmMoveEdit.HelpContext:=29;
//      Prizn := 4;
      Prizn := 2;
    end;
//---------------- Расход из списка партий -------------------------------------
    if (FDocVid = VID_DVIJENIE)and(FDocVidMove = VIDMOVE_KARD_LIST) then
    begin
      frmMoveEdit.SetViewMode(VIDMOVE_KARD_LIST, True, True);
//      Prizn := 4;
      Prizn := 2;
    end;
//----------------- Расход по требованию ---------------------------------------
    if (FDocVid = VID_DVIJENIE)and(FDocVidMove = VIDMOVE_NAKL_TREB) then
    begin
      Prizn := 4;
    end;
//------------------- Работа с резервом ----------------------------------------
    if (FDocVid = VID_DVIJENIE)and(FDocVidMove in[VIDMOVE_TO_REZERV, VIDMOVE_FROM_REZERV]) then
    begin
      frmMoveEdit.lcbMO_TO.Enabled := False;
      frmMoveEdit.lcbMO_GROUP_TO.Enabled := False;
      Prizn := 2;            
    end;
//---------------- Возврат препаратов ------------------------------------------
    if (FDocVid = VID_DVIJENIE)and(FDocVidMove = VIDMOVE_RETURN) then //возврат
    begin
      Prizn := 2;
    end;
//---------------- Возврат препаратов ------------------------------------------
    if (FDocVid = VID_DVIJENIE)and(FDocVidMove = VIDMOVE_TO_REZERV) then //возврат
    begin
      Prizn := 2;
    end;
//---------------- Списание в РПО ----------------------------------------------
    if (FDocVid = VID_RASHOD)and (FDocVidMove = VIDMOVE_SPISANIE_RPO) then
    begin
      frmMoveEdit.lcbMO_GROUP_FROM.Enabled := False;
      frmMoveEdit.lbDemand.Caption := 'Списание на РПО';
      Prizn := 3;
    end;
//---------------- Списание по причине, на отделение или пациента --------------
    if (FDocVid = VID_RASHOD)and (FDocVidMove = VIDMOVE_SPISANIE) then
    begin
      frmMoveEdit.HelpContext:=29;
      if FIsNewDoc then
      begin
        frmMoveEdit.SpisanieVid := SPISANIE_VID_PRICHINA; // присваиваем так, чтобы не было двойного вызова запроса
        frmMoveEdit.SetViewMode( VIDMOVE_SPISANIE, FIsNewDoc, FIsNewDoc );
      end
      else
        frmMoveEdit.SetViewMode( VIDMOVE_SPISANIE, False, frmMoveEdit.bCanEdit ); // перед этой процедурой frmMoveEdit.SpisanieVid уже должна быть установлена
      frmMoveEdit.lcbMO_GROUP_FROM.Enabled := False;
      Prizn := 3;
    end;
//---------------- Возврат поставщику ------------------------------------------
    if (FDocVid = VID_RASHOD)and (FDocVidMove in [VIDMOVE_RETURN_POSTAV, VIDMOVE_OTPUSK_PO_NAC_PR, VIDMOVE_OTPUSK_PO_CEL_PROG, VIDMOVE_SPISANIE_HITEC] ) then
    begin
//      frmMoveEdit.SetViewMode( VIEW_MODE_RETURN_POSTAV, FIsNewDoc, frmMoveEdit.bCanEdit );

      if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_KONTRAKT', 0) = 1 then
        frmMoveEdit.lcbKontrakt.Text := frmMoveEdit._dmMoveEdit.odsTDOCS.fieldbyname('FC_KONTRAKT').AsString;

      if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1) then
        frmMoveEdit.lcbFinSource.EditValue := frmMoveEdit._dmMoveEdit.odsTDOCS.FieldByName('FK_FINSOURCE_ID').AsVariant;

      frmMoveEdit.lcbMO_GROUP_FROM.Enabled := False;
      Prizn := 5;
    end;
//------------------------------------------------------------------------------

    // автоматически присвоим номер документу

    dmMain.odsDOCS_AUTONUM_COUNTER.Close;
    dmMain.odsDOCS_AUTONUM_COUNTER.SetVariable('FP_DOC_VIDMOVE', FDocVidMove);
    dmMain.odsDOCS_AUTONUM_COUNTER.SetVariable('FD_DOC_DATE', now);
    dmMain.odsDOCS_AUTONUM_COUNTER.SetVariable('fk_mogroup_id', dmMain.FK_CurMO_GROUP);
    dmMain.odsDOCS_AUTONUM_COUNTER.Open;

    dmMain.odsDOCS_AUTONUM_COUNTER.Filtered := False;
    dmMain.odsDOCS_AUTONUM_COUNTER.Filter := 'fl_enabled = 1';
    dmMain.odsDOCS_AUTONUM_COUNTER.Filtered := True;

    if ((dmMain.ConfigParams.GetParamValue('FUNC_DOCS_AUTONUM', 0) = 1))and(FIsNewDoc=True){and(frmMoveEdit.eNumDoc.Text = '')}
       and (dmMain.odsDOCS_AUTONUM_COUNTER.RecordCount > 0) then   //Added by Neronov A.S. 16.01.2012 Если есть рабочий счётчик, то присваиваем номер
    begin
      frmMoveEdit.SetDocNum( False );
    end;

    Result := frmMoveEdit.ShowModal;
    if Result = mrOk then
    begin
      if frmMoveEdit.IsNewClearTreb = True then
      begin

        dmMain.PKGTREB.DOSETTREB( frmMoveEdit.FFK_Treb, frmMoveEdit.eNumDoc.text, frmMoveEdit._dmMoveEdit.odsTTREB.FieldByName('FD_DATE').AsDateTime,
                                  fdmMain.nvl(frmMoveEdit.lcbMO_TO.KeyValue,-1), fdmMain.nvl(frmMoveEdit.lcbMO_FROM.EditValue, -1),
                                  frmMoveEdit._dmMoveEdit.odsTTREB.FieldByName('FC_COMMENT').AsString,
                                  fdmMain.nvl(frmMoveEdit.lcbMO_GROUP_TO.EditValue, -1), fdmMain.nvl(frmMoveEdit.lcbMO_GROUP_FROM.KeyValue, -1),
                                  frmMoveEdit._dmMoveEdit.odsTTREB.FieldByName('FL_CITO').AsInteger );
      end;
      dmMain.PkgPrihRash.DoSet(  dmMain.PkgPrihRash.Getsumdoc(aDocID, 2),
                                 frmMoveEdit.mComment.text,
                                 frmMoveEdit.eNumDoc.text,
                                 frmMoveEdit.deInvoiceDate.Date,
                                 {TRUNC(}frmMoveEdit.deRegisterDate.date {) + FRAC(frmMoveEdit.deRegistrTime.Time)},
                                 fdmMain.nvl(frmMoveEdit.lcbMO_TO.KeyValue,-1),
                                 //commented by A.Nakorjakov 26122007 nvl(frmMoveEdit.lcbMO_GROUP_TO.KeyValue, -1),
                                 fdmMain.nvl(frmMoveEdit.lcbMO_GROUP_TO.EditValue, -1), // Added by A.Nakorjakov 26.12.2007 14:28:51
                                 aDocID,
                                 fdmMain.nvl(frmMoveEdit.lcbMO_FROM.EditValue, -1),
                                 fdmMain.nvl(frmMoveEdit.lcbMO_GROUP_FROM.KeyValue, -1),
                                 Prizn, fdmMain.nvl(frmMoveEdit.SpisanieVid, SPISANIE_VID_NONE));

      // блок дополнительного обновления записи таблицы
      if (FDocVidMove = VIDMOVE_PRIH_POST) then
      begin
        dmMain.InitAdditionalUpdateTable('MED.TDOCS');
        if(dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN) then
          dmMain.AddAdditionalUpdateTable('FK_VID_POST', otInteger, frmMoveEdit.lcbMO_GROUP_FROM.KeyValue);

        if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_KONTRAKT', 0) = 1 then
          dmMain.AddAdditionalUpdateTable('FC_KONTRAKT', otString, frmMoveEdit.lcbKontrakt.Text);

        if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_SCHET_FAKTURA', 0) = 1 then
          dmMain.AddAdditionalUpdateTable('FC_SCHET_FAKTURA', otString, frmMoveEdit.lcbSchetFaktura.Text);

        if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1 then
          dmMain.AddAdditionalUpdateTable('FK_FINSOURCE_ID', otString, frmMoveEdit.lcbFinSource.EditValue);

        if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_PAY_COND', 0) = 1 then
          dmMain.AddAdditionalUpdateTable('FK_PAYCOND_ID', otString, frmMoveEdit.lcbPayCond.EditValue);

        dmMain.ExecuteAdditionalUpdateTable('DPID', otInteger, aDocID); // обновление таблицы TDOCS выполнено
      end;
      if (FDocVidMove = VIDMOVE_KARD_LIST) then
      begin                    
        dmMain.InitAdditionalUpdateTable('MED.TDOCS');

        if dmMain.ConfigParams.GetParamValue('FUNC_USE_PROFIL', 0) = 1 then
          dmMain.AddAdditionalUpdateTable('MOTOID', otString, frmMoveEdit.lcbPayCond.EditValue);
          
        dmMain.ExecuteAdditionalUpdateTable('DPID', otInteger, aDocID); // обновление таблицы TDOCS выполнено
      end;

      // блок дополнительного обновления записи таблицы
      if (FDocVidMove = VIDMOVE_SPISANIE)and(frmMoveEdit.SpisanieVid = SPISANIE_VID_PRICHINA) then
      begin
        dmMain.InitAdditionalUpdateTable('MED.TDOCS');

        if dmMain.ConfigParams.GetParamValue('FUNC_USE_FIN_SOURCE_IN_SPIS_PO_PRICHINE', 0) = 1 then
          dmMain.AddAdditionalUpdateTable('FK_FINSOURCE_ID', otString, frmMoveEdit.lcbFinSource.EditValue);

        if dmMain.ConfigParams.GetParamValue('FUNC_USE_PROFIL', 0) = 1 then
          dmMain.AddAdditionalUpdateTable('MOTOID', otString, frmMoveEdit.lcbPayCond.EditValue);

        dmMain.ExecuteAdditionalUpdateTable('DPID', otInteger, aDocID); // обновление таблицы TDOCS выполнено
      end;                     
      if (FDocVidMove = VIDMOVE_SPISANIE)and(frmMoveEdit.SpisanieVid = SPISANIE_VID_PACIENT) then
      begin
        dmMain.InitAdditionalUpdateTable('MED.TDOCS');

        if dmMain.ConfigParams.GetParamValue('FUNC_USE_PROFIL', 0) = 1 then
          dmMain.AddAdditionalUpdateTable('MOTOID', otString, frmMoveEdit.lcbPayCond.EditValue);

        dmMain.ExecuteAdditionalUpdateTable('DPID', otInteger, aDocID); // обновление таблицы TDOCS выполнено
      end;

     if (FDocVidMove = VIDMOVE_NAKL_TREB) then
      begin
        dmMain.InitAdditionalUpdateTable('MED.TDOCS');

        if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1)and
           (dmMain.ConfigParams.GetParamValue('FUNC_REQUIRE_FINSOURCE_IN_TREB', 0) = 1) then
          dmMain.AddAdditionalUpdateTable('FK_FINSOURCE_ID', otString, frmMoveEdit.lcbFinSource.EditValue);

        dmMain.ExecuteAdditionalUpdateTable('DPID', otInteger, aDocID); // обновление таблицы TDOCS выполнено
      end;        

     if (FDocVidMove = VIDMOVE_VVOD_OST) then
      begin
        dmMain.InitAdditionalUpdateTable('MED.TDOCS');

        if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1) then
          dmMain.AddAdditionalUpdateTable('FK_FINSOURCE_ID', otString, frmMoveEdit.lcbFinSource.EditValue);

        dmMain.ExecuteAdditionalUpdateTable('DPID', otInteger, aDocID); // обновление таблицы TDOCS выполнено
      end;

      // блок дополнительного обновления записи таблицы
      if FDocVidMove in [VIDMOVE_RETURN_POSTAV, VIDMOVE_OTPUSK_PO_NAC_PR, VIDMOVE_OTPUSK_PO_CEL_PROG, VIDMOVE_SPISANIE_HITEC] then
      begin
        dmMain.InitAdditionalUpdateTable('MED.TDOCS');

        if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_KONTRAKT', 0) = 1 then
          dmMain.AddAdditionalUpdateTable('FC_KONTRAKT', otString, frmMoveEdit.lcbKontrakt.Text);

        if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1) then
          dmMain.AddAdditionalUpdateTable('FK_FINSOURCE_ID', otString, frmMoveEdit.lcbFinSource.EditValue);

        dmMain.ExecuteAdditionalUpdateTable('DPID', otInteger, aDocID); // обновление таблицы TDOCS выполнено
      end;
      

      frmMoveEdit.SetDateToSootvetstvie();  // Added by A.Nakorjakov 19.12.2007 10:13:28
    end
    else
    begin
      if (FIsNewDoc = True)and(frmMoveEdit.bCanEdit = True) then
      begin
        dmMain.pkgprihrash.Dodeltreb(aDocID);
        dmMain.pkgprihrash.Dodelvoz(aDocID);
        dmMain.pkgprihrash.Dodeltrebvid(aDocID);
        dmMain.PkgPrihRash.dodel(aDocID);
        dmMain.os.Commit;
      end;
    end;

  finally
    if frmMoveEdit.bCanEdit then
    begin
      dmMain.SetUnLock(frmMoveEdit.CurDPIDLockID);
      if FDocVidMove = VIDMOVE_NAKL_TREB then
        dmMain.SetUnLock(frmMoveEdit.CurTrebLockID);
    end;  
    FreeAndNil(frmMoveEdit);
  end;
end;

function Get_CanSave(pDpid: Integer): Boolean;
//var ods : TOracleDataSet;
begin
  //проверяет наличие Dpc в документе
//  ods := TOracleDataSet.Create(nil);
//  try
//    ods.Session := dmMain.os;
//    ods.Sql.Text := 'SELECT COUNT(0) AS CNT FROM MED.TDPC WHERE DPID = :ADPID';
//		ods.DeclareVariable('ADPID',otInteger);
//    ods.SetVariable('ADPID',pDpid);
//    ods.Open;
//    Result := ods.FieldByName('CNT').AsInteger > 0;
//  finally
//    ods.Free;
//  end;
// Воронов О.А. Закоментил потому, что мешает - нужно разрешить сохранение пустого медикамента.
  Result := True;
end;

procedure DoUpdTreb_Dpc(pFk_Id:Integer; pFK_DPCID: Integer);
var oq : TOracleQuery;
begin
  //делается связка на TDPC
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := dmMain.os;
		oq.Sql.Text := 'UPDATE MED.TTREB_DPC D ' +
      'SET D.FK_DPCID = :FK_DPCID ' +
      'WHERE D.FK_ID = :FK_ID';
    oq.DeclareVariable('FK_DPCID',otInteger);
    oq.DeclareVariable('FK_ID',otInteger);
    oq.SetVariable('FK_ID',pFk_Id);
    if pFK_DPCID > -1 then
      oq.SetVariable('FK_DPCID',pFK_DPCID);
    oq.Execute;
  finally
    oq.Free;
  end;
end;

procedure TfrmMoveEdit.acescExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmMoveEdit.acenterExecute(Sender: TObject);
var
  TempDateTime : TDateTime;

begin
	if (eNumdoc.Text = '') then
  begin
    Application.MessageBox(PChar('Необходимо ввести номер документа !'), 'Ошибка', MB_OK + mb_iconerror);
    eNumdoc.SetFocus;
    exit;
  end;
  
//  if LCBPostav.Text = '' then
  if (lcbMO_GROUP_FROM.Text = '')and(lcbMO_FROM.Text = '')and(not (FViewNum in [VIDMOVE_VVOD_OST, VIDMOVE_TO_REZERV, VIDMOVE_FROM_REZERV])) then
	begin
    Application.MessageBox(PChar('Необходимо заполнить поле '+StringReplace(laFrom.Caption,':','',[])+'!'), 'Ошибка', MB_OK + mb_iconerror);
    case FViewNum of
      VIDMOVE_PRIH_POST, VIDMOVE_PRIH_RPO :  if (lcbMO_FROM.Visible) and (lcbMO_FROM.Enabled) then lcbMO_FROM.SetFocus;
    else
      if (lcbMO_GROUP_FROM.Visible) and (lcbMO_GROUP_FROM.Enabled) then lcbMO_GROUP_FROM.SetFocus;
    end;
    exit;
  end;

  if (FViewNum = VIDMOVE_PRIH_POST)and(dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN)and(lcbMO_GROUP_FROM.Text = '')and(dmMain.ConfigParams.GetParamValue('FUNC_VID_POST_REQUARE', 0) = 1) then
  begin
    Application.MessageBox(PChar('Необходимо выбрать вид поступления.'), 'Ошибка', MB_OK + mb_iconerror);
    if (lcbMO_GROUP_FROM.Visible) and (lcbMO_GROUP_FROM.Enabled) then lcbMO_GROUP_FROM.SetFocus;
    Exit;
  end;

  if (FViewNum = VIDMOVE_RETURN)or(IsNewClearTreb) then
  begin
    if (lcbMO_FROM.Text = '') then
    begin
      Application.MessageBox('Необходимо заполнить поле "От кого"', 'Ошибка', MB_OK + mb_iconerror);
      if (lcbMO_FROM.Enabled)and(lcbMO_FROM.Visible) then lcbMO_FROM.SetFocus;
      Exit;
    end;

    if (lcbMO_TO.Text = '') then
    begin
      Application.MessageBox('Необходимо заполнить поле "Кому"', 'Ошибка', MB_OK + mb_iconerror);
      if (lcbMO_TO.Enabled)and(lcbMO_TO.Visible) then lcbMO_TO.SetFocus;
      Exit;
    end;
  end;
//  if LCBTo.Text = '' then

  if (lcbMO_GROUP_TO.Text = '')and((SpisanieVid <> SPISANIE_VID_PACIENT)and(not (FViewNum in[VIDMOVE_OTPUSK_PO_NAC_PR, VIDMOVE_OTPUSK_PO_CEL_PROG ]))) then
  begin
    case SpisanieVid of
       SPISANIE_VID_HITEC, SPISANIE_VID_NONE :
         Application.MessageBox(PChar('Необходимо заполнить поле '+StringReplace(laTo.Caption,':','',[])+' !'), 'Ошибка', MB_OK + mb_iconerror);
     else
       Application.MessageBox(PChar('Необходимо выбрать причину списания !'), 'Ошибка', MB_OK + mb_iconerror);
    end;

    lcbMO_GROUP_TO.SetFocus;
    exit;
  end;
//  if odsNameFromMoveMOID.AsInteger = odsNameTomoveMOID.AsInteger then
//  begin
//	windows.MessageBox(Self.Handle, PChar(sMessage + ' невозможен внутри подразделения!'), 'Ошибка', MB_OK + mb_iconerror);
//	exit;
//  end;

//	if LCBPostav.KeyValue = LCBTo.KeyValue then
//	begin
//		windows.MessageBox(Self.Handle, PChar(sMessage + ' невозможен между одним и тем же материально-ответственным!'), 'Ошибка', MB_OK + mb_iconerror);
//		exit;
//  end;

//commented by A.Nakorjakov 26122007	if (lcbMO_GROUP_TO.KeyValue = lcbMO_GROUP_FROM.KeyValue){and(FViewNum = VIEW_MODE_NAKL_TREB)} then
	if (lcbMO_GROUP_TO.EditValue = lcbMO_GROUP_FROM.KeyValue)and(not FViewNum in [VIDMOVE_TO_REZERV, VIDMOVE_FROM_REZERV] ){and(FViewNum = VIEW_MODE_NAKL_TREB)} then // Added by A.Nakorjakov 26.12.2007 14:29:39
	begin
		Application.MessageBox(PChar('Передача невозможна между одной и той же группой материально-ответственных!'), 'Ошибка', MB_OK + mb_iconerror);
		exit;
  end;
	if not Get_CanSave(idDocs) then
  begin
    Application.MessageBox(PChar('Необходимо выбрать партию!'), 'Ошибка', MB_OK + mb_iconerror);
//    if (cxGridTreb.Visible)and(cxGridTreb.Enabled) then cxGridTreb.SetFocus;
    Exit;
  end;


  if ((VarIsClear(deRegisterDate.EditValue))or(VarIsNull(deRegisterDate.EditValue))or(TryStrToDateTime(deRegisterDate.EditingValue, TempDateTime) = False)) then
  begin
    Application.MessageBox(PChar('Необходимо ввести правильную дату регистрации документа!'), 'Ошибка', MB_OK + mb_iconerror);
		deRegisterDate.SetFocus;
    exit;
  end;
  if ((VarIsClear(deInvoiceDate.EditValue))or(VarIsNull(deInvoiceDate.EditValue))or(TryStrToDateTime(deInvoiceDate.EditingValue, TempDateTime) = False)) then
  begin
    Application.MessageBox(PChar('Необходимо ввести правильную дату документа!'), 'Ошибка', MB_OK + mb_iconerror);
    deInvoiceDate.SetFocus;
    exit;
  end;

  // чистим временные остатки
  if (FVidNum = VID_DVIJENIE)OR(FVidNum = VID_RASHOD) then
  begin
    dmMain.SetTempOstByDoc(dmMain.FK_CurMO_GROUP, -1);
  end;
  
  //Added by Neronov A.S. 17.12.2011
  if (dmMain.ConfigParams.GetParamValue('FUNC_CHECK_DOC_NUM', 0) = 1) then
  begin
    dmMain.odsCheckDocNum.SetVariable('PFC_DOC',eNumdoc.Text);
    dmMain.odsCheckDocNum.SetVariable('PFD_INVOICE',deInvoiceDate.Date);
    dmMain.odsCheckDocNum.SetVariable('PFP_VIDMOVE',FViewNum);
    dmMain.odsCheckDocNum.SetVariable('PDPID',idDocs);
    dmMain.odsCheckDocNum.Close;
    dmMain.odsCheckDocNum.Open;
    if dmMain.odsCheckDocNum.RecordCount > 0 then
    begin
      if Application.MessageBox(PChar('Такой номер документа уже существует!'+sLineBreak+'Продолжить?'), 'Внимание', MB_YESNOCANCEL + MB_ICONWARNING) <> IDYES then exit;
    end;

  end;

  ModalResult := mrok;
end;

function GetRashReturnCount(pKartId: Integer; pMO_GROUP_TO_ID: Integer; pDate: TDateTime) : Integer;
var oq: TOracleQuery;
begin
	Result := 0;
	oq := TOracleQuery.Create(nil);
	try
		oq.Session := dmMain.os;
		oq.Sql.Text :='SELECT ( ' +
			'SELECT NVL(SUM(TDPC.FN_KOL),0) ' +
			'FROM MED.TDPC, MED.TDOCS ' +
			'WHERE TDPC.KARTID = :KARTID ' +
//			'  AND TDOCS.FP_VID = 3 ' +
//			'  AND TDOCS.FP_VIDMOVE IN (5,7) ' +
//			'  AND TDOCS.FP_VID = 2 ' + // этоне обязатиельно указывать, поскольку FP_VIDMOVE однозначно укажет на тип движения
			'  AND TDOCS.FP_VIDMOVE IN (2,3,7) ' + // требования + расход в РПО
      '  AND TDOCS.DPID = TDPC.DPID ' +
//      '  AND TDOCS.MOTOID = :MOTOID ' +
      '  AND TDOCS.fk_mogroupid_to = :MO_GROUP_TO_ID ' +
      '  AND TRUNC(TDOCS.FD_DATA) BETWEEN TO_DATE(''01.01.2000'', ''DD.MM.YYYY'') AND TRUNC(:PDATE) ' +
      '  ) - ( ' +
      'SELECT NVL(SUM(TDPC.FN_KOL),0) ' +
			'FROM MED.TDPC, MED.TDOCS ' +
      'WHERE TDPC.KARTID = :KARTID ' +
//      '  AND TDOCS.FP_VID = 3 ' +
//      '  AND TDOCS.FP_VID = 2 ' +
      '  AND TDOCS.FP_VIDMOVE = 6 ' +
      '  AND TDOCS.DPID = TDPC.DPID ' +
//      '  AND TDOCS.MOFROMID = :MOTOID ' +
      '  AND TRUNC(TDOCS.FD_DATA) BETWEEN TO_DATE(''01.01.2000'', ''DD.MM.YYYY'') AND TRUNC(:PDATE)) FROM DUAL';
{    oq.Sql.Text :='SELECT ( ' +
      'SELECT NVL(SUM(TDPC.FN_KOL),0) ' +
      'FROM TDPC, TDOCS ' +
      'WHERE TDPC.KARTID = :KARTID ' +
			'  AND TDOCS.FP_VID = 3 ' +
      '  AND TDOCS.FP_VIDMOVE = 5 ' +
      '  AND TDOCS.DPID = TDPC.DPID ' +
      '  AND TDOCS.MOTOID = :MOTOID ' +
			'  AND TDOCS.FD_DATA BETWEEN TO_DATE(''01.01.2000'', ''DD.MM.YYYY'') AND :PDATE ' +
      '  ) - ( ' +
      'SELECT NVL(SUM(TDPC.FN_KOL),0) ' +
      'FROM TDPC, TDOCS ' +
      'WHERE TDPC.KARTID = :KARTID ' +
      '  AND TDOCS.FP_VID = 3 ' +
      '  AND TDOCS.FP_VIDMOVE = 6 ' +
			'  AND TDOCS.DPID = TDPC.DPID ' +
      '  AND TDOCS.MOFROMID = :MOTOID ' +
			'  AND TDOCS.FD_DATA BETWEEN TO_DATE(''01.01.2000'', ''DD.MM.YYYY'') AND :PDATE) FROM DUAL';}
    oq.DeclareVariable('KARTID', otInteger);
    oq.SetVariable('KARTID',pKartId);
    oq.DeclareVariable('MO_GROUP_TO_ID', otInteger);
    oq.SetVariable('MO_GROUP_TO_ID',pMO_GROUP_TO_ID);
    oq.DeclareVariable('pDATE', otDate);
    oq.SetVariable('pDATE',pDate);
		try
      oq.Execute;
      Result := oq.Field(0);
    except
    end;
  finally
    oq.Free;
  end;
end;


procedure TfrmMoveEdit.acinsExecute(Sender: TObject);
var
	id: double;
	price, kol, FN_INPUT_KOL_KOEF, INPUT_KOL_UP: double; // кол-во в уп. единицах изм.

  IsReserv : Boolean;
	dlgPrihRashKart : TfrmMedKardEdit;
  KartId, Treb_DPCID_tmp, MedID, ReservDocID, ShowSkladID, NazMedLechId : Integer;
  sFilter, sWhereAddition, sFilter2 : string;
  OstRec : TOstatokRec;
  fNaznList : TNazMedLechArr;
  FN_DayDoze : Double;

begin
  sWhereAddition := '';
  KartId := -1;
  NazMedLechId := -1;
  FN_DayDoze := 0;
  case FViewNum of
    VIDMOVE_PRIH_POST, VIDMOVE_VVOD_OST:
    begin
//    datechange := True;
//      lcbMO_FROM.CloseUp(True);
      lcbMO_FROM.PostEditValue;
      if (FViewNum = VIDMOVE_PRIH_POST)and(dmMain.ConfigParams.GetParamValue('FUNC_CHECK_PRICES_IN_NAKL', 0) = 1)and(lcbMO_FROM.Text = '') then
      begin
        Application.MessageBox('Перед заполнением прихода необходимо выбрать поставщика','Внимание', MB_OK+MB_ICONWARNING);
        lcbMO_FROM.SetFocus;
        lcbMO_FROM.DroppedDown := True;
        Exit;
      end;

      if (FViewNum = VIDMOVE_PRIH_POST)and(dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN)and(lcbMO_GROUP_FROM.Text = '')and(dmMain.ConfigParams.GetParamValue('FUNC_VID_POST_REQUARE', 1) = 1) then
      begin
        Application.MessageBox('Перед заполнением прихода необходимо выбрать вид поступления','Внимание', MB_OK+MB_ICONWARNING);
        lcbMO_GROUP_FROM.SetFocus;
        lcbMO_GROUP_FROM.DropDown;
        Exit;
      end;

      if (FViewNum = VIDMOVE_PRIH_POST)and(dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1)and(lcbFinSource.Text = '') then
      begin
        if (dmMain.ConfigParams.GetParamValue('FUNC_FIN_SOURCE_IS_REQUIRE', 1) = 1) then
        begin
          Application.MessageBox('Перед заполнением прихода необходимо выбрать источник финансирования','Внимание', MB_OK+MB_ICONWARNING);
          lcbFinSource.SetFocus;
          lcbFinSource.DroppedDown := True;
          Exit;
        end;
      end;

      Application.CreateForm(TfrmMedKardEdit, frmMedKardEdit);
      if FPrihByShtrihCode = True then
      begin
        frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfInputByShtrihCode];
      end;
      if (FViewNum = VIDMOVE_PRIH_POST)and(dmMain.ConfigParams.GetParamValue('FUNC_CHECK_PRICES_IN_NAKL', 0) = 1) then
      begin
        frmMedKardEdit.FPostavID   := lcbMO_FROM.EditValue;
        frmMedKardEdit.FNaklDate   := deInvoiceDate.Date;
        frmMedKardEdit.FIsPrihPost := True;
      end;
      if (FViewNum = VIDMOVE_PRIH_POST)and(dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN) then
      begin
        frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfExpensive];
        frmMedKardEdit.lcbVidPost.KeyValue := lcbMO_GROUP_FROM.KeyValue;
        frmMedKardEdit.chbExpensive.Checked := False;
      end;

      if (FViewNum = VIDMOVE_PRIH_POST)and(dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1) then
      begin
        frmMedKardEdit.lcbFinSource.KeyValue := lcbFinSource.EditValue;
      end;

      if (FViewNum = VIDMOVE_PRIH_POST)and(dmMain.ConfigParams.GetParamValue('FUNC_SHOW_INV_NOMER', 0) = 1) then
      begin
        frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfInvNomer];
      end;    

      if (FViewNum = VIDMOVE_PRIH_POST)and(dmMain.ConfigParams.GetParamValue('FUNC_SHOW_DRUGID', 0) = 1) then
      begin
        frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfDrugID];
      end;

      if (FViewNum = VIDMOVE_VVOD_OST)and(dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN) then
      begin
        frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfVidPostEdit];
      end;

      if dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1 then
      begin
        if lcbMO_GROUP_TO.Text = '' then
        begin
          Application.MessageBox(PChar('Перед заполнением списка прихода необходимо'#13#10'указать какой группе мат. отв. он адресовано.'), 'Ошибка', MB_OK + MB_ICONERROR);
          lcbMO_GROUP_TO.SetFocus;
          lcbMO_GROUP_TO.DroppedDown := True;
          exit;
        end;
        lcbMO_GROUP_TO.Properties.ListSource.DataSet.Locate('FK_ID', lcbMO_GROUP_TO.EditValue, []);
//        frmMedKardEdit.FK_SKLAD_ID := fdmMain.nvl(lcbMO_GROUP_TO.Properties.ListSource.DataSet.FieldByName('FK_SKLAD_ID').AsVariant, 0);
        if frmMain.ProvisorState = 1 then
          frmMedKardEdit.FK_SKLAD_ID := dmMain.CurMO_SKLAD_ID
        else
          if odsKart.RecordCount > 0 then
            frmMedKardEdit.FK_SKLAD_ID := nvl(odsKart.FieldByName('FK_SKLAD_ID').AsVariant,0)
          else
            frmMedKardEdit.FK_SKLAD_ID := 0;
      end;

      if (((dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_APTEKA))or(dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0)=0))and(dmMain.ConfigParams.GetParamValue('FUNC_CHECK_BRAK', 0) = True) then
      begin
        frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfCheckBrak];
      end;

      if frmMedKardEdit.ShowModal = mrok then
        begin
          if dmMain.pkgprihrash.Checkinkart(frmMedKardEdit.nID , idDocs) <> 0 then
          begin
            if MessageBox(Self.Handle, PChar('Данная партия уже используется в данном документе!' + #10#13+
                 'Прибавить к имеющемуся количеству?' + #10#13 + 'Вы уверены?'),
                 'Подтверждение', MB_yesno + mb_iconquestion) = idYes
            then
            begin
              odsKart.Locate('kartid',frmMedKardEdit.nID ,[]);

              dmMain.PkgPrihRash.DoSetPrihRash(idDocs,
                             frmMedKardEdit.seKol.value + odsKart.FieldByName('FN_KOL').AsFloat,
                             frmMedKardEdit.cePriceView.value,   //Этот параметр не используется
                             frmMedKardEdit.nID, //odskartList.fieldbyname('kartid').asinteger,
                             odsKart.FieldByName('DPCID').AsInteger, 10);
            end
            else Exit;
          end
          else	dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
                                                  frmMedKardEdit.seKol.value,
                                                  frmMedKardEdit.cePriceView.value,   //Этот параметр не используется
                                                  frmMedKardEdit.nID, //odskartList.fieldbyname('kartid').asinteger,
                                                   0, 1);
          acenter.Enabled := true;
          acedit.Enabled := true;
          acdel.Enabled := true;

          odsKart.SetVariable('adpid', idDocs); // ID документа

          odsKart.AfterScroll := nil;
          odsKart.Close;
          odsKart.Open;
          odsKart.Locate('kartid', frmMedKardEdit.nID {odskartList.fieldbyname('kartid').asinteger}, []); 
          odsKart.AfterScroll := odsKartAfterScroll;
          odsKartAfterScroll( odsKart );

          SetAcDelEnable();// Added by A.Nakorjakov 18.12.2007

          cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 1);
          frmMedKardEdit.free;
        end;
  //    flPrih := false;
    end
    else
    begin  // расход
      sFilter := '';
      Treb_DPCID_tmp := -1;

      if (FViewNum = VIDMOVE_SPISANIE)and(SpisanieVid = SPISANIE_VID_PRICHINA)and(dmMain.ConfigParams.GetParamValue('FUNC_USE_FIN_SOURCE_IN_SPIS_PO_PRICHINE', 0) = 1) then
      begin
        if (lcbFinSource.EditValue = null) then
        begin
          Application.MessageBox('Необходимо выбрать источник финансирования','Внимание', MB_OK+MB_ICONWARNING);
          lcbFinSource.SetFocus;
          lcbFinSource.DroppedDown := True;
          Exit;
        end
        else
        begin
          if dmMain.sDB_NAME <> 'T' then  //По просьбе Маши (Задача 19187)
          begin
            if sFilter <> '' then
              sFilter := sFilter + ' and ';

            sFilter := sFilter +'( FK_FINSOURCE_ID = '+IntToStr(lcbFinSource.EditValue)+ ')';
          end;
        end;
      end;

      if (FViewNum = VIDMOVE_NAKL_TREB) then
      begin
        if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 1) then
        begin
          lcbMO_GROUP_TO.Properties.ListSource.DataSet.Locate('FK_ID', lcbMO_GROUP_TO.EditValue, []);

          if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 1) then
          begin
            if sFilter <> '' then
              sFilter := sFilter + ' and ';

            sFilter := sFilter + '((FC_QUOTA_CODE_1 = ''00'') or (FC_QUOTA_CODE_1 = '''+ lcbMO_GROUP_TO.Properties.ListSource.DataSet.FieldByName('FC_QUOTA_CODE_1').AsString +'''))';
          end;
        end
        else  // если включено квотирование, то фильтрация по медикаментам из требования не делается
          if (IsShowTreb)and(IsNewClearTreb = False)and(dmMain.ConfigParams.GetParamValue('FUNC_NO_AUTOFILTER_IN_RASH_BY_TREB', 0)=0) then  // если расход по требованию
          begin
            MedID := odsZatrebovano.FieldByName('medicid').AsInteger;
            odsZatrebovano.DisableControls;
            odsZatrebovano.AfterScroll := nil;
            Treb_DPCID_tmp := odsZatrebovano.FieldByName('fk_id').AsInteger;
            FFK_TrebDPC := Treb_DPCID_tmp;
            odsZatrebovano.First;
            while not odsZatrebovano.Eof do
            begin
              sFilter := sFilter + ' or (medicid = '+ IntToStr(odsZatrebovano.FieldByName('medicid').AsInteger)+')';
              odsZatrebovano.Next;
            end;
            Delete(sFilter, 1,4);
            odsZatrebovano.Locate('fk_id', Treb_DPCID_tmp, []);
            odsZatrebovano.EnableControls;
            odsZatrebovano.AfterScroll := odsZatrebovanoAfterScroll;
          end;
      end;

      if FViewNum = VIDMOVE_FROM_REZERV then // когда делаем возврат из резерва - отображаем только то, что в резерве Воронов О.А. 15.04.2008
      begin
        sWhereAddition := 'FN_OST_TYPE = 1'
      end;

      if ( FViewNum = VIDMOVE_SPISANIE  ) and ( SpisanieVid = SPISANIE_VID_PACIENT )  and ( fIsAddByPacNazn ) then  // добавить по назначению
      begin
        fNaznList := DoSelectNazn ( -1, lcbMO_GROUP_TO.EditValue, lcbMO_GROUP_TO.Text, False ); // выбрать одно назначение
        SetLength( fNaznList, Length(fNaznList) );

        if ( Length(fNaznList) = 1 ) then
        begin
          NazMedLechId := fNaznList[0].FK_NAZMEDLECHID;
          FN_DayDoze := fNaznList[0].FN_DAY_DOZE;

          if fNaznList[0].FK_MEDICID > 0 then // фильтр по коду объекта учета
          begin
            if sFilter <> '' then
              sFilter :=  ' (' + sFilter + ') and ';

            sFilter := sFilter + ' ( MEDICID = '  + IntToStr( fNaznList[0].FK_MEDICID ) + ' ) ';
          end;                                                                                  
        end
        else
          NazMedLechId := -1;

        if not ( NazMedLechId > 0 ) then // не выбрано назначение
          Exit;
      end;

      if (IsShowPacMedNaz) and (odsPacMedNaz.Active) then
      begin
        // Added by Voronov 29.05.2008 15:39:10 дополнительное удобство для СМС - отображение только тех партий, которые передал провизор
        if not odsPacMedNaz.FieldByName('FK_NazMedLech').IsNull then
        begin
          NazMedLechId := odsPacMedNaz.FieldByName('FK_NazMedLech').AsInteger;
          FN_DayDoze := odsPacMedNaz.FieldByName('FN_DAYDOZE').AsFloat;

          odsGetProvizorToSMSMedicsList.Close;
          odsGetProvizorToSMSMedicsList.SetVariable('FK_NAZMEDLECH_ID', NazMedLechId );
          odsGetProvizorToSMSMedicsList.Open;

          sFilter2 := '';
          odsGetProvizorToSMSMedicsList.First;
          while not odsGetProvizorToSMSMedicsList.Eof do
          begin
            sFilter2 := sFilter2+ ' or (KARTID='+IntToStr(odsGetProvizorToSMSMedicsList.FieldByName('kartid').AsInteger)+')';
            odsGetProvizorToSMSMedicsList.Next;
          end;
          delete(sFilter2,1,4);

          if sFilter <> '' then
            sFilter := '( '+sFilter+' ) and ( '+sFilter2+' )'
          else
            sFilter := sFilter2;
        end;
        //----------------------------------------------------------------------
        // по умолчанию расход по требованию делается только по одному складу, если не указана константа FUNC_RASH_BY_TREB_MANY_SKLAD
        if (odsKart.RecordCount > 0)and
           (( (FViewNum = VIDMOVE_NAKL_TREB) and (dmMain.ConfigParams.GetParamValue('FUNC_RASH_BY_TREB_MANY_SKLAD', 0) = 0) )or
            ( (FViewNum = VIDMOVE_SPISANIE)  and (dmMain.ConfigParams.GetParamValue('FUNC_SPIS_BY_ONE_SKLAD', 0) = 1) ) ) then
        begin
//          KartId := odsKart.FieldByName('kartid').AsInteger;
          ShowSkladID := nvl(odsKart.FieldByName('FK_SKLAD_ID').AsVariant,0);
        end
        else
          ShowSkladID := 0;

        OstRec := DoShowMedKardLst( KartId, dmMain.MedKardLst_FocusedRowIndex, FViewNum ,False, SpisanieVid,sWhereAddition,False,sFilter,False,True,True, -1, ShowSkladID, 'Список партий - '+odsPacMedNaz.FieldByName('FC_MEDNAZNAME').AsString, FPrihByShtrihCode);
        KartId := OstRec.KARTID;
        MedID := OstRec.MEDICID
      end
      else
      {Added by A.Nakorjakov 28-02-2008
      finished}
      begin
        // по умолчанию расход по требованию делается только по одному складу, если не указана константа FUNC_RASH_BY_TREB_MANY_SKLAD
        if (odsKart.RecordCount > 0)and
           (( (FViewNum = VIDMOVE_NAKL_TREB) and (dmMain.ConfigParams.GetParamValue('FUNC_RASH_BY_TREB_MANY_SKLAD', 0) = 0) )or
            ( (FViewNum = VIDMOVE_SPISANIE)  and (dmMain.ConfigParams.GetParamValue('FUNC_SPIS_BY_ONE_SKLAD', 0) = 1) ) ) then
        begin
//          KartId := odsKart.FieldByName('kartid').AsInteger;
          ShowSkladID := nvl(odsKart.FieldByName('FK_SKLAD_ID').AsVariant,0);
        end
        else
          ShowSkladID := 0; 

        if (dmMain.ConfigParams.GetParamValue('FUNC_USE_FIN_SOURCE_IN_SPIS_BY_PAC', 0) = 1)and(FViewNum = VIDMOVE_SPISANIE)and(SpisanieVid = SPISANIE_VID_PACIENT) then
        begin
          dmMain.odsTFinSource.First;
          if dmMain.odsTFinSource.Locate('FK_TYPEDOC_ID', nvl(lcbFinSource.EditValue, -1), []) then
          begin
            if sWhereAddition <> '' then
              sWhereAddition := sWhereAddition + ' AND ';

              sWhereAddition := sWhereAddition + 'FK_FINSOURCE_ID = '+IntToStr(nvl(dmMain.odsTFinSource.FieldByName('FK_ID').AsInteger, -1));
          end;
        end;

        case FViewNum of  // установка параметров locate для расхода по требованию
          VIDMOVE_NAKL_TREB: // в расходе по требованию делаем locate по медикаменту
          begin
            MedID := odsZatrebovano.FieldByName('medicid').AsInteger;
            KartId := -1;
            dmMain.MedKardLst_FocusedRowIndex := -1; // по индексу строки делается лукап в расходах
          end;
        end;

        if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 1) then
          OstRec := DoShowMedKardLst( KartId, dmMain.MedKardLst_FocusedRowIndex, FViewNum,True, SpisanieVid,sWhereAddition,False,sFilter,False,True, True, -1, ShowSkladID, 'Список остатков по партиям', FPrihByShtrihCode)
        else
          OstRec := DoShowMedKardLst( KartId, dmMain.MedKardLst_FocusedRowIndex, FViewNum,False, SpisanieVid,sWhereAddition,False,sFilter,False,True, True, -1, ShowSkladID, 'Список остатков по партиям', FPrihByShtrihCode);
        KartId := OstRec.KARTID;
        MedID := OstRec.MEDICID;
      end;

//      Treb_DPCID := odsZatrebovano.FieldByName('fk_id').AsInteger;
      if FViewNum = VIDMOVE_NAKL_TREB then // расход по требованию
      begin
        if (odsZatrebovano.Active)and(odsZatrebovano.RecordCount>0)and
           (MedID <> odsZatrebovano.FieldByName('medicid').AsInteger)and
           (odsZatrebovano.Locate('medicid',MedID, []) )and
           (dmMain.ConfigParams.GetParamValue('FUNC_USE_RASH_TREB_AUTOCORRECT', 0) = 1) then
        begin
          dmMain.ShowBalloonHint('Вы пытаетесь выдать не тот медикамент,'#13#10'который был затребован.'#13#10'Произведена корректировка', 'Автокорректировка', self);
          FFK_TrebDPC := odsZatrebovano.FieldByName('fk_id').AsInteger;
        end;
      end;

//      dmMain.pkgMedSes.SETDATA2( OldDate2 ); // добавил Воронов О.А. 29.04.2008
      if KartId < 1 then Exit; // если не выбрали партию, то просто выходим
// предупреждение о возможном появлении отрицательных остатков
      if ( OstRec.fd_date_prih <> NullDate ) and ( Trunc(OstRec.fd_date_prih) > Trunc(deRegisterDate.Date) ) then
      begin
        if (dmMain.ConfigParams.GetParamValue('FUNC_NOT_NEGATIVE_OST', 0) = 1)
        then
        begin
          MessageBox(0, 'Выбранная партия поступила позже, чем делается расход.'#13#10 +
                        'Это может привести к появлению отрицательных остатков.', '', MB_ICONWARNING or MB_OK);
          Exit;
        end else
        if (Application.MessageBox('Выбранная партия поступила позже, чем делается расход.'#13#10+
                                   'Это может привести к появлению отрицательных остатков.'#13#10+
                                   'Все равно продолжить ?',
                                  'Дата поступления', MB_YESNO+MB_ICONQUESTION) = mrNo)
        then
          Exit;
      end;

      IsReserv := ( OstRec.FN_OST_TYPE = 1 ) ;
      Price := 0;

      // создаем позицию расхода по назначению: если остатков достаточно, то по умолчанию списываем суточную дозу
      if ( NazMedLechId > 0 ) and ( CompareValue( FN_DayDoze, OstRec.FN_OSTATOK_FAS ) <> 1 )then
        kol := FN_DayDoze / OstRec.FN_FPACKINUPACK     // суточная доза в фас.ед.изм.
      else
      // подставляем кол-во из требования
      if (FViewNum = VIDMOVE_NAKL_TREB)and(dmMain.ConfigParams.GetParamValue('FUNC_TREB_KOL_ON_ADD_IN_TREBNAKL', 1) = 1) then
        kol := odsZatrebovano.FieldByName('fn_trebkol').AsFloat

      else
        kol := OstRec.fn_ostatok;

      try
        dlgPrihRashKart := TfrmMedKardEdit.Create(Self);

        if (chbFasEI.Visible) and (chbFasEI.Checked) then
          dlgPrihRashKart.ConfigFlags := dlgPrihRashKart.ConfigFlags + [pfFasIE];

        dlgPrihRashKart.ConfigFlags := dlgPrihRashKart.ConfigFlags + [pfInputKol];

        if (FViewNum = VIDMOVE_SPISANIE) and (dmMain.ConfigParams.GetParamValue('FUNC_INPUT_SUM_OR_KOL', 0) = 1) then
           dlgPrihRashKart.ConfigFlags := dlgPrihRashKart.ConfigFlags + [pfInputSum];

        dlgPrihRashKart.nID := KartId;
        dlgPrihRashKart.seKol.Properties.MinValue := 0;
        dlgPrihRashKart.seKol.Properties.AssignedValues.MinValue := True;

        if pfFasIE in dlgPrihRashKart.ConfigFlags then // фасовочные ед. изм.
        begin
          FN_INPUT_KOL_KOEF := OstRec.FN_FPACKINUPACK; // кол-во таблеток в упаковке
          dlgPrihRashKart.seKol.Properties.MaxValue := OstRec.fn_ostatok_fas;
          dlgPrihRashKart.seKol.Properties.AssignedValues.MaxValue := True;
          dlgPrihRashKart.seKol.Value := kol * OstRec.FN_FPACKINUPACK;
        end
        else
        begin
          FN_INPUT_KOL_KOEF := 1;
          dlgPrihRashKart.seKol.Properties.MaxValue := OstRec.fn_ostatok;
          dlgPrihRashKart.seKol.Properties.AssignedValues.MaxValue := True;
          dlgPrihRashKart.seKol.Value := kol;
        end;


        if dlgPrihRashKart.ShowModal = mrOk then
        begin
          INPUT_KOL_UP := dlgPrihRashKart.seKol.Value/FN_INPUT_KOL_KOEF;
          price := dlgPrihRashKart.cePriceView.EditValue;
        end
        else
          Exit;
      finally
        dlgPrihRashKart.Free;
      end;

      // получили кол-во - теперь анализируем
      if (FloatToStrF(INPUT_KOL_UP, ffNumber, 15, 7)=FloatToStrF(kol, ffNumber, 15, 7)) or (INPUT_KOL_UP <= kol) then
      begin
        ReservDocID := -1;
        if (IsReserv)and(FViewNum <> VIDMOVE_FROM_REZERV) then  // достаем из резерва автоматически
        begin
          ReservDocID := dmMain.PkgPrihRash.Createshablon(VID_DVIJENIE, VIDMOVE_FROM_REZERV);
          dmMain.PkgPrihRash.DoSetPrihRash( ReservDocID,
                                            INPUT_KOL_UP,
                                            price, //dmMain.pkgMedKart.GETPRICE(KartId),   //Этот параметр не используется
                                            KartId,
                                            0, 3);

          dmMain.PkgPrihRash.DoSet(  dmMain.PkgPrihRash.Getsumdoc(ReservDocID, 2),
                                     'Возврат из резерва (сделан автоматически)',
                                     IntToStr(ReservDocID),
                                     ServerDate(dmMain.os),
                                     ServerDate(dmMain.os),
                                     dmMain.MOID,
                                     dmMain.FK_CurMO_GROUP,
                                     ReservDocID,
                                     dmMain.MOID,
                                     dmMain.FK_CurMO_GROUP,
                                     2, SPISANIE_VID_NONE);
          dmMain.PKGTDOCS.SETFLEDIT(ReservDocID);

        end;
        id := dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
                                                INPUT_KOL_UP,
                                                price, //dmMain.pkgMedKart.GETPRICE(KartId),   //Этот параметр не используется
                                                KartId,
                                                0, 2, ReservDocID);

        // если в режиме добавления расхода и требования
        if (IsAddRashWithTrebShow = True)and(FIsAddRashWithTrebExec = True) then
          FFK_TrebDPC := TRUNC(dmMain.PKGTREB.DOSETTREBDPC( -1, FFK_Treb, MedID, INPUT_KOL_UP ));

        if FFK_TrebDPC > 0 then
        begin
          UpdateFK_TREBDPC(Trunc(id), FFK_TrebDPC);
          FFK_TrebDPC := -1;
        end;

        if (FViewNum = VIDMOVE_SPISANIE)and(SpisanieVid = 3) then
        begin
          Update_FD_DATE_SPIS(Trunc(id), ServerDate(dmMain.os));
        end;

        IsChanged := True;
        acenter.Enabled := true;
        acedit.Enabled := true;
        deRegisterDate.Enabled:=acedit.Enabled;
//        deRegistrTime.Enabled :=acedit.Enabled;
    //    if dmMain.pkgMedSes.GETCURMO = odsNameFromMoveMOID.AsInteger then
        if dmMain.FK_CurMO_GROUP = _dmMoveEdit.odsMO_GroupFrom.FieldByName('FK_ID').AsInteger then
        begin
    //      LCBPostav.Enabled := false; !!!
        end;
      end
      else
      begin
        if dmMain.nRed <> 1 then
        begin
          if kol = 0 then
          begin
            Application.MessageBox('ТМЦ полностью списана!', 'Ошибка', MB_OK + MB_ICONERROR)
          end
          else
          begin
            Application.MessageBox(PChar('Кол-во ТМЦ "'+ OstRec.FC_MEDIC+'" не должно превышать ' + floattostr(kol) + ' '
                                   + OstRec.FC_ED_IZM + '!'), 'Ошибка', MB_OK + MB_ICONERROR)//frmPrihRashKart
          end;
          acinsExecute(sender);
          exit;
        end
        else
        begin
          id := dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
                                                  INPUT_KOL_UP,
                                                  price, //dmMain.pkgMedKart.GETPRICE(KartId),   //Этот параметр не используется
                                                  KartId,
                                                  0, 3);
          acenter.Enabled := true;
          acedit.Enabled := true;
    //      if dmMain.pkgMedSes.GETCURMO = odsNameFromMoveMOID.AsInteger then
    //      begin
    //        LCBPostav.Enabled := false; !!!
    //      end;
        end;
      end;
      DoSootvetstvieToPac(INPUT_KOL_UP,Trunc(id), NazMedLechId, INPUT_KOL_UP*FN_INPUT_KOL_KOEF );

      if IsShowTreb then // запоминаем где стоял курсор в тербовании
      begin
        odsZatrebovano.DisableControls;
        odsZatrebovano.AfterScroll := nil;
        // если в режиме добавления расхода и требования
//        if FIsAddRashWithTrebExec = True then
          Treb_DPCID_tmp := FFK_TrebDPC;
//        else
//          Treb_DPCID_tmp := odsZatrebovano.FieldByName('fk_id').AsInteger;
      end;


      // обновление списков и позиционирование
      odsKart.Close;
      odsKart.SetVariable('adpid', idDocs);
      odsKart.Open;
      odsKart.Locate('kartid', KartId, []);

      if IsShowTreb then // восстанавливаем позицию курсора
      begin
//        odsZatrebovano.Close;
//        odsZatrebovano.Open;
        odsZatrebovano.Locate('fk_id', Treb_DPCID_tmp, []);
//        odsZatrebovano.RefreshRecord;
        odsZatrebovano.EnableControls;
        odsZatrebovano.AfterScroll := odsZatrebovanoAfterScroll
      end;
    end;
  end; // case
end;

procedure TfrmMoveEdit.aceditExecute(Sender: TObject);
var
	id, i: integer;
  kol, FN_INPUT_KOL_KOEF: real;
  dpid_list : TIntList;
begin
  case FViewNum of
    VIDMOVE_PRIH_POST, VIDMOVE_VVOD_OST:
    begin
      id := -1;
//      datechange := true;
      Application.CreateForm(TfrmMedKardEdit, frmMedKardEdit);
      frmMedKardEdit.nID := odsKart.fieldbyname('kartid').AsInteger; // передаем KartID
      frmMedKardEdit.sekol.Value := odsKart.fieldbyname('fn_kol').AsFloat;
      frmMedKardEdit.sesumm.Value := odsKart.fieldbyname('summ').AsFloat;

      frmMedKardEdit.ConfigFlags := [pfLockMedic];
      CheckAndShowLinkedDocs(idDocs, @dpid_list, True,'Редактируемая партия уже задействована в других документах', False, False, frmMedKardEdit.nID ); // если имеются зависимые документы - подписанные и неподписанные

      frmMedKardEdit.FIsPrihPost := (FViewNum = VIDMOVE_PRIH_POST);
      frmMedKardEdit.FPostavID   := fdmMain.nvl(lcbMO_FROM.EditValue,-1);
      frmMedKardEdit.FNaklDate   := deInvoiceDate.Date;

      if (FViewNum = VIDMOVE_PRIH_POST)and(dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN) then
      begin
        frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfExpensive];
      end;

      if (FViewNum = VIDMOVE_VVOD_OST)and(dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN) then
      begin
        frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfVidPostEdit];
      end;

      if (FViewNum = VIDMOVE_PRIH_POST)and(dmMain.ConfigParams.GetParamValue('FUNC_SHOW_INV_NOMER', 0) = 1) then
      begin
        frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfInvNomer];
      end;  

      if (FViewNum = VIDMOVE_PRIH_POST)and(dmMain.ConfigParams.GetParamValue('FUNC_SHOW_DRUGID', 0) = 1) then
      begin
        frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfDrugID];
      end;

      if (((dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_APTEKA))or(dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0)=0))and(dmMain.ConfigParams.GetParamValue('FUNC_CHECK_BRAK', 0) = True) then
      begin
        frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfCheckBrak];
      end;

      if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 1) then
      begin
        frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfQuotaCode];
      end;

      if (dmMain.ConfigParams.GetParamValue('FUNC_USE_NDS', 0) = 1) then
      begin
        frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfNDS];
      end;

      if (dmMain.ConfigParams.GetParamValue('FUNC_USE_NACENKA', 0) = 1) then
      begin
        frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfNacenka];
      end;

      if (dmMain.ConfigParams.GetParamValue('FUNC_USE_JNVLS', 0) = 1) then
      begin
        frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfJNVLS];
      end;

      if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1) then
      begin
        frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfFINSOURCE];
      end;


      if frmMedKardEdit.ShowModal = mrOk then
      begin
        if (odsKart.FieldByName('KARTID').AsInteger <> frmMedKardEdit.nID ) and
        (dmMain.pkgprihrash.Checkinkart(frmMedKardEdit.nID , idDocs) <> 0) then //если изменили карточку и такая уже есть, то
        begin
            if MessageBox(Self.Handle, PChar('Данная партия уже используется в данном документе!' + #10#13+
                 'Прибавить к имеющемуся количеству?' + #10#13 + 'Вы уверены?'),
                 'Подтверждение', MB_yesno + mb_iconquestion) = idYes
          then
          begin
            dmMain.PkgPrihRash.Dodelkart(odsKart.FieldByName('KARTID').AsInteger, odsKart.fieldbyname('dpcid').asinteger);//удаляем старую карточку
            //перебрасываем на новую
            odsKart.Locate('kartid',frmMedKardEdit.nID,[]);
            dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
                                              frmMedKardEdit.seKol.value + odsKart.FieldByName('FN_KOL').AsFloat,
                                              frmMedKardEdit.cePriceView.Value,
                                              frmMedKardEdit.nID,
                                              odsKart.FieldByName('DPCID').AsInteger, 10);
          end
          else Exit;
        end
        else
        begin
          if (_dmMoveEdit.odsMO_GroupTo.FieldByName('FK_ID').AsInteger <> odsKart.FieldByName('FK_MOGROUPID').asinteger) then
          begin
            id := frmMedKardEdit.nID;
            dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
                                              frmMedKardEdit.seKol.value,
                                              frmMedKardEdit.cePriceView.value,
                                              id,
                                              odsKart.FieldByName('DPCID').asinteger, 2);
          end
          else
          begin
            id := frmMedKardEdit.nID;
            dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
                                              frmMedKardEdit.seKol.value,
                                              frmMedKardEdit.cePriceView.value,
                                              id,
                                              odsKart.FieldByName('DPCID').asinteger, 1);
          end; //if (odsMO_GroupTo.FieldByName('FK_ID').AsInteger <> odsKart.FieldByName('FK_MOGROUPID').asinteger) then
        end; //if (odsKart.FieldByName('KARTID').AsInteger <> frmMedKardEdit.nID ) and
        odsKart.SetVariable('adpid', idDocs);
      //    odsKart.refresh;
        odsKart.AfterScroll := nil;
        odsKart.Close;
        odsKart.Open;
        odsKart.Locate('kartid', id, []);
        odsKart.AfterScroll := odsKartAfterScroll;
        odsKartAfterScroll( odsKart );
        self.cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 1);

        for i := 0 to Length(dpid_list)-1 do // обновляем стоимость по всем зависимым документам
        begin
          dmMain.oqUPD_TDOCS_FN_PRICE.SetVariable('pDPID', dpid_list[i]);
          dmMain.oqUPD_TDOCS_FN_PRICE.Execute;
        end;

        frmMedKardEdit.free;
      end; //if frmMedKardEdit.ShowModal = mrOk then
//      flPrih := false;
    end

  else
   // все остальные виды расходов и движений
  begin
    if bLog then SaveToLog('fMoveEdit','acEditExecute ... Start');
    // отображение партии в отдельной форме frmMedKardEdit
    id := odsKart.FieldByName('KARTID').AsInteger;
    if bLog then SaveToLog('fMoveEdit','acEditExecute ... Application.CreateForm(tfrmPrihRashkart, frmPrihRashkart);');
    Application.CreateForm(TfrmMedKardEdit, frmMedKardEdit);
    frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfInputKol];

    if (FViewNum = VIDMOVE_SPISANIE) and (dmMain.ConfigParams.GetParamValue('FUNC_INPUT_SUM_OR_KOL', 0) = 1) then  
      frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfInputSum];
        

    FN_INPUT_KOL_KOEF := 1;
    if (chbFasEI.Visible)and(chbFasEI.Checked) then
    begin
      frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfFasIE];
      FN_INPUT_KOL_KOEF := odsKart.fieldbyname('FN_FPACKINUPACK').AsFloat; // кол-во таблеток в упаковке
    end;

    frmMedKardEdit.nId := odsKart.fieldbyname('kartid').asinteger; // передаем KartID
    frmMedKardEdit.sekol.Value := odsKart.fieldbyname('fn_kol').AsFloat*FN_INPUT_KOL_KOEF; 
    frmMedKardEdit.cePriceView.Value := odsKart.fieldbyname('fn_price').AsFloat/FN_INPUT_KOL_KOEF;
    frmMedKardEdit.sesumm.Value := odsKart.fieldbyname('summ').AsFloat;
    Kol := dmMain.PKGMEDKART.Getost(frmMedKardEdit.nID, dmMain.pkgMedSes.GETDATA2);     //остаток
    frmMedKardEdit.sekol.Properties.MaxValue := (odsKart.fieldbyname('fn_kol').AsFloat+Kol)*FN_INPUT_KOL_KOEF;

    if bLog then SaveToLog('fMoveEdit','acEditExecute ... fMedKardEdit.ShowModal');

    dmMain.oqDelTempOst.SetVariable('PKARTID', frmMedKardEdit.nId);
    dmMain.oqDelTempOst.SetVariable('PFK_MOGROUPID', dmMain.FK_CurMO_GROUP);
    dmMain.oqDelTempOst.Execute;

    if frmMedKardEdit.ShowModal = mrok then
    begin
      if not bReturn then
      begin
        if bLog then SaveToLog('fMoveEdit','acEditExecute ... dmMain.PKGMEDKART.Getost');
//        Kol := dmMain.PKGMEDKART.Getost(frmMedKardEdit.nID,  // frmMedKardEdit.odskartList.FieldByName('KARTID').AsInteger,
//          dmMain.pkgMedSes.GETDATA2);     //остаток
      end
      else
        Kol := GetRashReturnCount(frmMedKardEdit.nID,
          lcbMO_GROUP_FROM.KeyValue,dmMain.pkgMedSes.GETDATA2);
      if (frmMedKardEdit.seKol.Value <= ((kol+odsKart.fieldbyname('fn_kol').AsFloat)*FN_INPUT_KOL_KOEF)) then
      begin
        id := frmMedKardEdit.nID;
        if bLog then SaveToLog('fMoveEdit','acEditExecute ... dmMain.PkgPrihRash.DoSetPrihRash');
        dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
                                          frmMedKardEdit.seKol.value/FN_INPUT_KOL_KOEF,
                                          frmMedKardEdit.cePriceView.Value,
                                          id,
                                          odsKart.FieldByName('DPCID').asinteger, 3);

        // автоматически редактируем кол-во
        if (IsAddRashWithTrebShow = True)and( fdmMain.nvl(odsZatrebovano.FieldByName('FK_CREATE_MO_ID').AsInteger,-1) = dmMain.nCurMO ) then
          dmMain.PKGTREB.DOSETTREBDPC(  odsZatrebovano.FieldByName('FK_ID').AsInteger, FFK_Treb, odsZatrebovano.FieldByName('MEDICID').AsInteger, frmMedKardEdit.seKol.value );
       IsChanged := True;
      end
      else
      begin
        if dmMain.nRed <> 1 then
        begin
          if kol = 0 then
            windows.MessageBox(Self.Handle, PChar('ТМЦ полностью списана!'), 'Ошибка', MB_OK + mb_iconerror)
          else
            windows.MessageBox(Self.Handle, PChar('Кол-во ТМЦ для списания не должно превышать ' + floattostr((odsKart.fieldbyname('fn_kol').AsFloat+Kol)*FN_INPUT_KOL_KOEF) + ' ' + frmMedKardEdit.edEdIzm.Text + '!'), 'Ошибка', MB_OK + mb_iconerror);
          aceditExecute(sender);
        end
        else
        begin
          id := frmMedKardEdit.nID;
          dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
                                            frmMedKardEdit.seKol.value/FN_INPUT_KOL_KOEF,
                                            frmMedKardEdit.cePriceView.Value,
                                            id,
                                            odsKart.FieldByName('DPCID').asinteger, 2);
          IsChanged := True;
        end;
      end;
      if nvl ( odsKart.fieldbyname('fk_nazmark').AsVariant, -1 ) > 0 then
      begin
        if (chbFasEI.Visible)and(chbFasEI.Checked) then
          FN_INPUT_KOL_KOEF := 1
        else
          FN_INPUT_KOL_KOEF := odsKart.fieldbyname('FN_FPACKINUPACK').AsFloat;

        DoEditSootvetstvieKol(frmMedKardEdit.seKol.value, odsKart.FieldByName('DPCID').AsInteger, frmMedKardEdit.seKol.value * FN_INPUT_KOL_KOEF );
      end;
      odsKart.SetVariable('adpid', idDocs);
      if bLog then SaveToLog('fMoveEdit','acEditExecute ... odsKart.refresh');
      odsKart.AfterScroll := nil;
      odsKart.Close;
      odsKart.Open;
      odsKart.Locate('kartid', id, []);
      odsKart.AfterScroll := odsKartAfterScroll;
      odsKartAfterScroll( odsKart );
      frmMedKardEdit.cePriceView.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 2);
    end;
  end;
  end; // case  
end;

procedure TfrmMoveEdit.acdelExecute(Sender: TObject);
var
  dpid_list : TIntList;
begin
  if bLog then SaveToLog('fMoveEdit','acdelExecute ... Start');

  if (FViewNum = VIDMOVE_PRIH_POST) or (FViewNum = VIDMOVE_VVOD_OST) then
    CheckAndShowLinkedDocs(idDocs, @dpid_list, True,'Удаляемая партия уже задействована в других документах', False, False, odsKart.fieldbyname('kartid').asinteger ); // если имеются зависимые документы - подписанные и неподписанные
  if windows.MessageBox(Self.Handle, PChar('Вы действительно хотите удалить данную запись ?'), 'Предупреждение', MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    if FVidNum = VID_PRIHOD then
    begin
      if bLog then SaveToLog('fMoveEdit','acdelExecute ...  dmMain.PkgPrihRash.Dodelkart');
      // сами партии не удаляем - во избежании глобальных катаклизмов с остатками
      dmMain.PkgPrihRash.Dodelkart(odsKart.fieldbyname('kartid').asinteger, odsKart.fieldbyname('dpcid').asinteger);
//      dmMain.PkgPrihRash.Dodelrash(odsKart.fieldbyname('kartid').asinteger, odsKart.fieldbyname('dpcid').asinteger);
      odsKart.SetVariable('adpid', idDocs);
  //                odsKart.refresh;
      odsKart.Close;
      odsKart.Open;
      self.cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 1);
    end // if FVidNum = VID_PRIHOD then
    else
    begin
      if bLog then SaveToLog('fMoveEdit','acdelExecute ... dmMain.PkgPrihRash.Dodelrash');
      if odsKart.fieldbyname('FK_REZERV_DOCID').AsInteger > 0 then  // если есть документ возврата из резерва, удаляем его
      begin
        dmMain.PkgPrihRash.doDel(odsKart.fieldbyname('FK_REZERV_DOCID').AsInteger);
      end;

      dmMain.PkgPrihRash.Dodelrash(odsKart.fieldbyname('kartid').asinteger, odsKart.fieldbyname('dpcid').asinteger);

      DeleteSootvetstvie(odsKart.fieldbyname('dpcid').asinteger, nvl ( odsKart.fieldbyname('fk_nazmark').AsVariant, -1 ) ); // Added by A.Nakorjakov 18.12.2007 11:08:54
    
      IsChanged := True;
  //    DoUpdTreb_Dpc(odsKart.fieldbyname('FK_ID').AsInteger,-1);
  //    odsKart.SetVariable('adpid', frmMoveList.idDocs);
  //    odsKart.SetVariable('adpid', idDocs);
      if bLog then SaveToLog('fMoveEdit','acdelExecute ... odsKart.refresh');
      odsKart.Close;
      odsKart.Open;
      if not Get_CanSave(idDocs) then //odsKart.RecordCount = 0
      begin
        deRegisterDate.Enabled:=true;
//        deRegistrTime.Enabled := true;
        acenter.Enabled := false;
        acdel.Enabled := false;
  //      if dmMain.pkgMedSes.GETCURMO = odsNameFromMoveMOID.AsInteger then
  //      begin
  //        LCBPostav.Enabled := true;
  //        acedit.Enabled := false;
  //        acdel.Enabled := false;
  //      end;
      end;
      if bLog then SaveToLog('fMoveEdit','acdelExecute ... dmMain.PkgPrihRash.Getsumdoc(idDocs, 2)');
    end; // else if FVidNum = VID_PRIHOD then 
  //		cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 2); // перенесено в odsKartAfterRefresh
  end; // if windows.MessageBox(Self.Handle, PChar('Вы действительно хотите удалить данную запись ?') ...
end;
{
procedure TfrmMoveEdit.dxDBgRashKartEdited(Sender: TObject;
  Node: TdxTreeListNode);
var kol: real;
  id: integer;
begin
  dmMain.os.Savepoint('spEdit');
  id := odsKart.FieldByName('KARTID').AsInteger;
  kol := odsKart.FieldByName('FN_KOL').AsFloat;
  if odsKart.Modified then
    odsKart.Post;
  odsKart.refresh;
  odsKart.Locate('kartid', id, []);
//  if not frmMoveList.flIns then
  if not flIns then
    kol := dmMain.PKGMEDKART.Getost(odsKart.FieldByName('KARTID').AsInteger, frmMoveEdit.deRegisterDate.Date) + kol
  else
    kol := dmMain.PKGMEDKART.Getost(odsKart.FieldByName('KARTID').AsInteger, frmMoveEdit.deRegisterDate.Date);
  if (odsKart.FieldByName('FN_KOL').AsFloat > kol) then
  begin
    dmMain.os.RollbackToSavepoint('spEdit');
    MessageBox(Self.Handle, PChar('Кол-во ТМЦ для списания не должно превышать ' + floattostr(kol) + ' ' + odsKart.FieldByName('NAMEKART').AsString + '!'), 'Ошибка', MB_OK + mb_iconerror);
		odsKart.refresh;
    exit;
  end;
//  if dmMain.PkgPrihRash.Getcheckcountkart(frmMoveList.idDocs) > 0 then
  if dmMain.PkgPrihRash.Getcheckcountkart(idDocs) > 0 then
  begin
    dmMain.os.RollbackToSavepoint('spEdit');
    odsKart.refresh;
  end;
//  cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(frmMoveList.idDocs, 2); // перенесено в  odsKartAfterRefresh
  cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 2);

end;
}
procedure TfrmMoveEdit.FormActivate(Sender: TObject);
//var
//	dDate : TDateTime;
begin
  {case who_called of
   1:Begin //нажали Движение > добавить из сп. карточек
      flIns := True;
      idDocs :=  frmMoveList.idDocs;
      MOOWNERID := frmMoveList.odsSelDocMove.FieldByName('MOOWNERID').AsInteger;
      FD_DATA := frmMoveList.odsSelDocMove.FieldByName('FD_DATA').AsDateTime;
      bCanEdit := true;
  //	frmMoveEdit.odsKart.Refresh;
      dDate := ServerDate(dmMain.os);
      deRegisterDate.Date := trunc(dDate);
      deRegistrTime.Time := dDate - trunc(dDate);
      deInvoiceDate.Date := trunc(dDate);
     end;
   2:Begin //нажали Движение > возврат
      sMessage := 'Возврат';
      Caption := 'Регистрация возвратного документа';

      flIns := True;
      bCanEdit := true;
     end;
   3:Begin //нажали  Движение>Добавить списание медикаментов
      sMessage := 'Списание медикаментов';
      Caption := 'Регистрация акта списания медикаментов';

      flIns := True;
      idDocs :=  frmMoveList.idDocs;
      MOOWNERID := frmMoveList.odsSelDocMove.FieldByName('MOOWNERID').AsInteger;
      FD_DATA := frmMoveList.odsSelDocMove.FieldByName('FD_DATA').AsDateTime;
      bCanEdit := true;
  //	frmMoveEdit.odsKart.Refresh;
      dDate := ServerDate(dmMain.os);
      deRegisterDate.Date := trunc(dDate);
      deRegistrTime.Time := dDate - trunc(dDate);
      deInvoiceDate.Date := trunc(dDate);
  //		LCBTo.Visible:=false;
  //		Label13.visible:=false;

                  bbuSelectVidSpasanie.Show;
                  lbNameTo.Hide;
                  SetSpisanieVid( SpisanieVid );
     end;
  end; }


//  odsNameFromMove.Open;
//  odsNameToMove.Open;

{  case who_called of
   1,3:Begin //нажали Движение > добавить из сп. карточек
//        LCBPostav.KeyValue := dmMain.pkgMedSes.GETCURMO;
        lcbMO_GROUP_FROM.KeyValue := dmMain.pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO;

     end;
  // 3:Begin //нажали Движение > добавить из сп. карточек
  //		LCBPostav.KeyValue := dmMain.pkgMedSes.GETCURMO;
  //	 end;
  end; }
  //  bbuSelectVidSpasanie.Enabled := (SpisanieVid > 0)and(bCanEdit);

//  odsZatrebovano.Open;

//  eNumDocChange(self);
//  EnableActions( bCanEdit );

//  odsKart.AfterScroll:=nil;
//  odsKart.Open;
//  odsKart.AfterScroll:=odsKartAfterScroll;
//  odsKart.AfterScroll(odsKart);

  globdata := deRegisterDate.date;
  Screen.Cursor := crSQLWait;
//  if not bReturn and (dmMain.pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO <> odsMO_GroupFrom.FieldByName('FK_ID').AsInteger)
//      and (dmMain.pkgMedSes.GETCURMO <> MOOWNERID) and (not flIns) then
//    begin
//      EnableInput( False );
//      EnableActions( False );
////      dxDBgRashKartColumn5.DisableEditor := true;
//      cxGridRashKartDBTableView1FN_KOL.Options.Editing := False;
//    end;

  if odsKart.RecordCount = 0 then
    begin
      ndata := dmmain.pkgprihrash.GETRASHDATA(date);
//      EnableActions( True );

     if flIns then
      begin
//        LCBPostav.Enabled := false; //true !!!
//        lcbMO_GROUP_FROM.Enabled := false; // !!!

        deRegisterDate.Enabled := true;
//        deRegistrTime.Enabled := true;
      end;
    end
  else ndata:=FD_DATA;

  Screen.Cursor := crDefault;

  chbFasEIClick(nil);
end;

procedure TfrmMoveEdit.dePacDatePropertiesEditValueChanged(Sender: TObject);
var
  pac_id : variant;
begin
  pac_id := lcbMO_GROUP_TO.EditValue;
  
  _dmMoveEdit.odsMO_GroupTo.Close;
  _dmMoveEdit.odsMO_GroupTo.SetVariable('cur_date', dePacDate.EditValue);
  _dmMoveEdit.odsMO_GroupTo.Open;
  // если предыдущее значение есть в обновленном списке, то выставляем его
  if _dmMoveEdit.odsMO_GroupTo.Locate('FK_ID', pac_id, []) then
    lcbMO_GROUP_TO.EditValue := pac_id
  else
    lcbMO_GROUP_TO.EditValue := null;
end;

procedure TfrmMoveEdit.FormDestroy(Sender: TObject);
begin
  lcbMO_GROUP_FROM.CloseUp(False);

  if (FViewNum = VIDMOVE_PRIH_POST) then
  begin
    dmMain.odsPostav.Close;
    dmMain.odsPostav.SetVariable('RPO',0);
    dmMain.odsPostav.Open;
  end;
  _dmMoveEdit.Free;
  DeleteFile( medkartlst_ini );
  DeleteFile( medlst_ini );
  dmMain.MedKardLst_FocusedRowIndex := -1;
  Screen.Cursor := crDefault;
end;

procedure TfrmMoveEdit.SetbCanEdit(const Value: Boolean);
begin
  FbCanEdit := Value;
//  miLinkWithTreb.Enabled := Value;
//  miDelLink.Enabled      := Value;

  if FbCanEdit then
  begin

  end;
end;

procedure TfrmMoveEdit.SetbReturn(const Value: Boolean);
begin
  FbReturn := Value;
  if FbReturn then
  begin
    sMessage := 'Возврат';
    Caption := 'Регистрация возвратного документа';
  end
  else sMessage := 'Расход';
end;

procedure TfrmMoveEdit.FormCreate(Sender: TObject);
begin
  _dmMoveEdit := TdmMoveEdit.Create( self );
  // ид строчек для прорисовки
  FDrawTrebDPC := False;
  FDrawDPC     := False;
  // менюшки на кнопке добавить
  FPrihByShtrihCode := False;
  IsAddRashWithTrebShow  := False;
  FIsAddRashWithTrebExec := False;
  fIsAddByPacNazn := False;

  IsNewClearTreb := False;

  // ид требования
  FFK_TrebDPC := -1;
  FFK_Treb    := -1;
  
  who_called:=0;
  SpisanieVid := SPISANIE_VID_NONE;
  FViewNum := 0;
  odsKart.AfterScroll:=nil;
  IsShowTreb := False;  // по умолчанию требование отображать не нужно
  IsChanged  := False;
  IsShowPacMedNaz := False;  // по умолчанию мед.назначения пациента отображать не нужно
  IsCanShowPostGiven := False; // Added by A.Nakorjakov 29.12.2007 10:07:58

//  odsNameFromMove.Open;
//  odsNameToMove.Open;

  _dmMoveEdit.odsMO_GroupFrom.Open;
  _dmMoveEdit.odsMO_GroupTo.Open;
  _dmMoveEdit.odsMO_TO.Open;
  _dmMoveEdit.odsMO_FROM.Open;
  IsFormUpdateNow := False; // Added by A.Nakorjakov 18.12.2007 11:49:26
  //odsKart.Open;

  // выставляем границы даты регистрации документа. Воронов О.А. 26.02.2008
  deRegisterDate.Properties.MinDate := dmMain.pkgMedSes.GETDATA1;
  deRegisterDate.Properties.MaxDate := dmMain.pkgMedSes.GETDATA2;
  deRegisterDate.Properties.AssignedValues.MinDate := True;
  deRegisterDate.Properties.AssignedValues.MaxDate := True;
//  if Assigned(frmMoveList) then acCalcOstDoc.Visible := frmMoveList.fledit;

  if IsHeadNurseMode then  // если включен режим, в котором СМС делает соответствие какому пациенту что принимать
  begin                    // Added by Voronov 29.05.2008 10:16:30
    _dmMoveEdit.odsCheckSpisMedicOnGiven.Close;
    _dmMoveEdit.odsCheckSpisMedicOnGiven.Open;
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 0) then
  begin
    cxGridRashKartDBTableView1FC_QUOTA_CODE.Visible := False;
    cxGridRashKartDBTableView1FC_QUOTA_CODE.VisibleForCustomization := False;    
  end;

  buGetAutoNum.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_DOCS_AUTONUM', 0) = 1);

// автоматически определяем длину ограничения на поле Воронов О.А. 25.08.2008
  eNumDoc.MaxLength  := dmMain.GetFieldLength('med', 'tdocs', 'FC_DOC');
  mComment.Properties.MaxLength := dmMain.GetFieldLength('med', 'tdocs', 'fc_comment');
  lcbKontrakt.Properties.MaxLength := dmMain.GetFieldLength('med', 'tdocs', 'FC_KONTRAKT');
  CurTrebLockID := '';
  CurDPIDLockID := '';
end;

function Do_TDpc_Summ(DPCID: Integer; aFN_SUMM: Double): Boolean;
var oq   : TOracleQuery;
begin
  Result := False;
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := dmMain.os;
    oq.Sql.Text := 'UPDATE MED.TDPC SET FN_SUMM = :FN_SUMM WHERE DPCID = :DPCID';

    oq.DeclareVariable('DPCID',otInteger);
    oq.DeclareVariable('FN_SUMM',otFloat);
    oq.SetVariable('DPCID',DPCID);
    oq.SetVariable('FN_SUMM',aFN_SUMM);
    try
      oq.Execute;
      Result := True;
    except
    end;
  finally
    oq.Free;
  end;
end;

function Do_TDpc_Kol(nID: Integer; afn_kol: Double): Boolean;
var oq   : TOracleQuery;
begin
  Result := False;
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := dmMain.os;
    oq.Sql.Text := 'UPDATE MED.TDPC SET FN_KOL = :FN_KOL WHERE DPCID = :DPCID';

    oq.DeclareVariable('DPCID',otInteger);
    oq.DeclareVariable('FN_KOL',otFloat);
    oq.SetVariable('DPCID',nID);
    oq.SetVariable('FN_KOL',afn_kol);
    try
      oq.Execute;
      Result := True;
    except
    end;
  finally
    oq.Free;
  end;
end;

//procedure TfrmMoveEdit.CalcSummDpc;
//begin
////  with odsKart. do
//  begin
//    odsKart.DisableControls;
//    odsKart.First;
//    while not odsKart.Eof do
//    begin
//      Do_TDpc_Summ(odsKart.FieldByName('DPCID').AsInteger,
//        dmMain.pkgprihrash.GetLastnewprice(
//                odsKart.FieldByName('KARTID').AsInteger,
//                deRegisterDate.Date,
//                LCBPostav.KeyValue) * odsKart.FieldByName('FN_TREBKOL').AsInteger);
//      odsKart.Next;
//    end;
//    odsKart.EnableControls;
//    odsKart.First;
//    odsKart.Close;
//    odsKart.Open;
//  end;
//end;

procedure TfrmMoveEdit.acCopyQuantityExecute(Sender: TObject);
var Ost: Double;
begin
  with odsKart do
  begin
    DisableControls;
    First;
    while not Eof do
    begin
      Ost := dmMain.PKGMEDKART.Getost(
              odskart.FieldByName('KARTID').AsInteger,
              deRegisterDate.Date{, LcbPostav.KeyValue});
      if Ost <= FieldByName('FN_TREBKOL').AsFloat then
      begin
        Application.MessageBox(pChar('Медикамент: ' + odsKart.FieldByName('NAMEKART').AsString + #10#13 +
        'Требуемое кол-во превышает остаток!'),'Предупреждение',mb_ok + mb_iconWarning);
        Do_TDpc_Kol(FieldByName('DPCID').AsInteger,Ost);
        Do_TDpc_Summ(FieldByName('DPCID').AsInteger,
//                     FieldByName('fn_price').AsFloat * Ost);
//          dmMain.pkgprihrash.GetLastnewprice(
//                  FieldByName('KARTID').AsInteger,
//                  deRegisterDate.Date,
//                  LCBPostav.KeyValue)
                     dmMain.pkgMedKart.GETPRICE( FieldByName('KARTID').AsInteger ) * Ost);

      end
      else
      begin
        Do_TDpc_Kol(FieldByName('DPCID').AsInteger,FieldByName('FN_TREBKOL').AsFloat);
        Do_TDpc_Summ(FieldByName('DPCID').AsInteger,
//          dmMain.pkgprihrash.GetLastnewprice(
//                FieldByName('KARTID').AsInteger,
//                deRegisterDate.Date,
//                LCBPostav.KeyValue)
                     dmMain.pkgMedKart.GETPRICE( FieldByName('KARTID').AsInteger ) * FieldByName('FN_TREBKOL').AsFloat);
      end;
      Next;
    end;
    EnableControls;
    First;
    Close;
    Open;
  end;
end;

procedure TfrmMoveEdit.acCalcOstDocExecute(Sender: TObject);
var oq    : TOracleQuery;
    str   : String;
    dDate : TDateTime;
begin
  Exit; // добавил Воронов О.А. - чтобы вообще исключить возможность срабатывания перерасчета
  dDate := ServerDate(dmMain.os);
  str := 'Будет произведен пересчет остатков за период c %s по %s . Суммы в документе № %s будут изменены! Продолжить?';
  str := Format(str, [DateToStr(dateclose), DateToStr(dDate),frmMoveList.odsSelDocMove.FieldByName('FC_DOC').AsString]);
  if windows.MessageBox(Self.Handle, PChar(str), 'Предупреждение', MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    oq := TOracleQuery.Create(nil);
    screen.Cursor := crSQLWait;
    try
      oq.Session := dmMain.os;
      oq.Sql.Text := 'begin MED.dosetsumdoc(:adpid,:adata1,:adata2); end;';
      oq.DeclareVariable('adata1',otDate);
      oq.DeclareVariable('adata2',otDate);
      oq.DeclareVariable('adpid',otInteger);
      oq.SetVariable('adata1',dateclose);
      oq.SetVariable('adata2',dDate);
      oq.SetVariable('adpid',idDocs);
      oq.Execute;
//      dmMain.os.commit;
      odsKart.Close;
      odsKart.Open;      
      cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(frmMoveList.idDocs, 2);
      acEnter.Enabled := True;
    finally
      screen.Cursor := crDefault;
      oq.Free;
    end;
  end;
end;

procedure TfrmMoveEdit.acTrebProccessExecute(Sender: TObject); // не понятно, откуда вызывается это действие
var
  id: Integer;
  kol: real;
  fMedKardEdit : TfrmMedKardEdit;

//  procedure SetFocus(gr: TdxDbGrid; ColIndex: Integer; KolValue: Variant);
//  var i : Integer;
//  begin
//    For i := 0 to gr.Count -1 do
//      if gr.Items[i].Values[ColIndex] = KolValue then
//      begin
//        gr.Items[i].Focused := True;
//        Exit;
//      end;
//  end;

begin
//  if (dmMain.pkgMedSes.GETCURMO <> odsNameFromMoveMOID.AsInteger) and (dmMain.pkgMedSes.GETCURMO <> MOOWNERID) and (not flIns) then
  if (dmMain.FK_CurMO_GROUP <> _dmMoveEdit.odsMO_GroupFrom.FieldByName('FK_ID').AsInteger) and (dmMain.pkgMedSes.GETCURMO <> MOOWNERID) and (not flIns) then
    exit;
  if deRegisterDate.Date = NullDate then
  begin
    Application.MessageBox(PChar('Перед вводом карточки необходимо ввести дату!'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;
//  if LCBPostav.KeyValue <= 0 then
  if lcbMO_GROUP_FROM.KeyValue <= 0 then
  begin
    Application.MessageBox(PChar('Перед вводом карточки необходимо ввести откуда ' + sMessage + '!'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;
//  if LCBTo.KeyValue <= 0 then
//commented by A.Nakorjakov 26122007  if lcbMO_GROUP_TO.KeyValue <= 0 then
  if lcbMO_GROUP_TO.EditValue <= 0 then  // Added by A.Nakorjakov 26.12.2007 14:31:16
  begin
    Application.MessageBox(PChar('Перед вводом карточки необходимо ввести куда ' + sMessage + '!'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;
//  if LCBTo.KeyValue = LCBPostav.KeyValue then
//commented by A.Nakorjakov 26122007  if lcbMO_GROUP_TO.KeyValue = lcbMO_GROUP_FROM.KeyValue then
  if lcbMO_GROUP_TO.EditValue = lcbMO_GROUP_FROM.KeyValue then // Added by A.Nakorjakov 26.12.2007 14:31:36
  begin
    Application.MessageBox(PChar(sMessage + ' невозможен внутри подразделения!'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;

  fMedKardEdit := TfrmMedKardEdit.Create(nil);
  fMedKardEdit.ConfigFlags := [pfIsOpenForView];
  try
//  Application.CreateForm(tfrmPrihRashkart, frmPrihRashkart);
  fMedKardEdit.sekol.Value := odsKart.fieldbyname('fn_kol').AsFloat;
//  fMedKardEdit.eKartName.Text := odsKart.fieldbyname('namekart').asstring;

  if odsKart.FieldByName('kartid').IsNull then //не было ничего
  begin
    fMedKardEdit.sekol.Value := odsKart.fieldbyname('fn_trebkol').AsFloat;
//    fMedKardEdit.sFilter := odsKart.fieldbyname('NameKart').AsString;
    fMedKardEdit.nMedicId := odsKart.FieldByName('medicid').AsInteger;
  end
  else
  begin
    if (odsKart.FieldByName('ODR').AsInteger = 0)
      and (odsKart.FieldByName('medicid').AsInteger <> odsKart.FieldByName('kmedicid').AsInteger) then //была замена
    begin
      //стать на замену и кол-во замены
      odsKart.Locate('DPCID;ODR',VarArrayOf([odsKart.fieldbyname('DPCID').AsInteger,1]),[]);
    end;
    fMedKardEdit.sekol.Value := odsKart.fieldbyname('fn_kol').AsFloat;
//    fMedKardEdit.odskartList.SetVariable('akartid', odsKart.fieldbyname('kartid').AsInteger);
//    fMedKardEdit.odskartList.refresh;
//    fMedKardEdit.eKartName.Text := odsKart.fieldbyname('NameKart').AsString; // ибо тоже нефиг
    fMedKardEdit.nID := odsKart.fieldbyname('kartid').AsInteger;
  end;

//  fMedKardEdit.odskartList.SetVariable('akartid', odsKart.fieldbyname('kartid').AsInteger);
//  fMedKardEdit.odskartList.refresh;

  if fMedKardEdit.ShowModal = mrok then
  begin
    Kol := dmMain.PKGMEDKART.Getost( fMedKardEdit.nID, //fMedKardEdit.odskartList.FieldByName('KARTID').AsInteger,
//      deRegisterDate.Date, odsNameFrommove.FieldByName('MOID').AsInteger);     //остаток
      deRegisterDate.Date, _dmMoveEdit.odsMO_GroupFrom.FieldByName('GROUPID').AsInteger);     //остаток

    if (fMedKardEdit.seKol.Value <= kol) then
    begin
      id := Round(dmMain.PkgPrihRash.DoSetPrihRash(idDocs,
              fMedKardEdit.seKol.value,
              fMedKardEdit.cePriceView.Value, //dmMain.pkgMedKart.GETPRICE(fMedKardEdit.nID),   //Этот параметр не используется
                fMedKardEdit.nID,
//                deRegisterDate.Date,
                odsKart.FieldByName('DPCID').AsInteger, 3));  //вставка в TDPC
      DoUpdTreb_Dpc(odsKart.FieldByName('FK_ID').AsInteger,id);
    end
    else
    begin
      if dmMain.nRed = 1 then
      begin
        id := Round(dmMain.PkgPrihRash.DoSetPrihRash(idDocs,
                fMedKardEdit.seKol.value,
                fMedKardEdit.cePriceView.Value, //dmMain.pkgMedKart.GETPRICE(fMedKardEdit.nID),  //Этот параметр не используется
                fMedKardEdit.nID,
//                deRegisterDate.Date,
                odsKart.FieldByName('DPCID').AsInteger, 2));
        DoUpdTreb_Dpc(odsKart.FieldByName('FK_ID').AsInteger,id);
      end
      else
      begin
        if kol = 0 then
          windows.MessageBox(Self.Handle, PChar('ТМЦ полностью списана!'), 'Ошибка', MB_OK + mb_iconerror)
        else
          windows.MessageBox(Self.Handle, PChar('Кол-во ТМЦ для списания не должно превышать ' +
            floattostr(kol) + ' ' + fMedKardEdit.edEdIzm.Text + '!'), 'Ошибка', MB_OK + mb_iconerror);
        aceditExecute(sender);
      end;
    end;
    odsKart.Close;
    odsKart.Open;    
//    cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 2); // перенесено в odsKartAfterRefresh
    acEnter.Enabled := Get_CanSave(idDocs);
  end;
  finally
    FreeAndNil(fMedKardEdit);
  end;
end;

procedure TfrmMoveEdit.odsKartAfterScroll(DataSet: TDataSet);
begin
  if SpisanieVid = SPISANIE_VID_PRICHINA then
    bbuSelectVidSpasanie.Enabled := bCanEdit and (DataSet.RecordCount = 0);

  acdel.Enabled  := bCanEdit and (DataSet.RecordCount > 0);
  acEdit.Enabled := bCanEdit and (DataSet.RecordCount > 0)and(odsKart.FieldByName('FK_REZERV_DOCID').AsInteger <= 0); // если партия взята из резерва, то ее нельзя редактировать

  if FVidNum <> VID_RASHOD  then
  begin
  // Added by Voronov 29.05.2008 12:15:51 добавил порверки на возможность удаления и изменения медикаментов, переданных постовой МС
    _dmMoveEdit.odsCheckSpisMedicOnGiven.Close;
    _dmMoveEdit.odsCheckSpisMedicOnGiven.SetVariable('DPCID', odsKart.FieldByName('DPCID').AsInteger);
    _dmMoveEdit.odsCheckSpisMedicOnGiven.Open;

    acdel.Enabled  := acdel.Enabled and((_dmMoveEdit.odsCheckSpisMedicOnGiven.RecordCount <= 0) or (_dmMoveEdit.odsCheckSpisMedicOnGiven.FieldByName('FK_NAZMARK').AsInteger < 0));
    acEdit.Enabled :=  acEdit.Enabled and (_dmMoveEdit.odsCheckSpisMedicOnGiven.RecordCount = 0); // если уже выдано, то нельзя менять
    _dmMoveEdit.odsCheckSpisMedicOnGiven.Close;
  end;

  acIns.Enabled  := bCanEdit;

  SetAcDelEnable();// Added by A.Nakorjakov 18.12.2007

  if FViewNum = VIDMOVE_NAKL_TREB then
  begin
    cxGridTrebDBTableView1.ViewChanged;
    cxGridRashKartDBTableView1.ViewChanged;
  end;

  FDrawTrebDPC := True;
  FDrawDPC     := False;
//  acCalcOstDoc.Enabled := acIns.Enabled;
//  if acIns.Enabled then cxGridRashKartDBTableView1.OnDblClick := aceditExecute
//  else cxGridRashKartDBTableView1.OnDblClick := nil;
end;

procedure TfrmMoveEdit.odsZatrebovanoAfterScroll(DataSet: TDataSet);
begin
  cxGridTrebDBTableView1.ViewChanged;
  cxGridRashKartDBTableView1.ViewChanged;

  FDrawTrebDPC := False;
  FDrawDPC     := True;  

  acEditTrebPDC.Enabled := (IsAddRashWithTrebShow = True);
  acDelTrebDPC.Enabled  := (IsAddRashWithTrebShow = True) and (cxGridTrebDBTableView1FK_CREATE_MO_ID.EditValue = dmMain.MOID);

  if (IsAddRashWithTrebShow = True) then
    if(cxGridTrebDBTableView1.DataController.RecordCount > 0) then
      StatusBar1.SimpleText := 'Строка требования - Создал: '+cxGridTrebDBTableView1FK_CREATE_MO_ID.Properties.GetDisplayText( cxGridTrebDBTableView1FK_CREATE_MO_ID.EditValue, True ) +
                               ' '+cxGridTrebDBTableView1FD_CREATE.Properties.GetDisplayText( cxGridTrebDBTableView1FD_CREATE.EditValue, True )+
                               '   Внес изменения: '+cxGridTrebDBTableView1FK_EDIT_MO_ID.Properties.GetDisplayText( cxGridTrebDBTableView1FK_EDIT_MO_ID.EditValue, True ) +
                               ' '+cxGridTrebDBTableView1FD_EDIT.Properties.GetDisplayText( cxGridTrebDBTableView1FD_EDIT.EditValue, True )
    else
      StatusBar1.SimpleText := '';
end;

function TfrmMoveEdit.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
	Result := False;
  try
    // TODo Подумать насчет праметра  Command
    if Data = -1 then
      HtmlHelp(0, PChar('Medica.chm'), HH_DISPLAY_TOPIC, 0)
    else
    begin
      case FViewNum of
        VIDMOVE_PRIH_POST : HtmlHelp(0, PChar('Medica.chm'), HH_HELP_CONTEXT, 72);
        VIDMOVE_VVOD_OST  : HtmlHelp(0, PChar('Medica.chm'), HH_HELP_CONTEXT, 71);

        VIDMOVE_NAKL_TREB  : HtmlHelp(0, PChar('Medica.chm'), HH_HELP_CONTEXT, 81);
        VIDMOVE_SPISANIE   : HtmlHelp(0, PChar('Medica.chm'), HH_HELP_CONTEXT, 82);
      end;
    end;

    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
	end;
end;

procedure TfrmMoveEdit.acSelectVidSpasanieExecute(Sender: TObject);
begin
  if FViewNum = VIDMOVE_SPISANIE then
  begin
    pmSelectVidSpisanie.Popup(Mouse.CursorPos.x, Mouse.CursorPos.y);
//commented vy A.Nakorjakov 26122007    lcbMO_GROUP_TO.KeyValue := -1; // очищаем выбор
    lcbMO_GROUP_TO.EditValue := -1; // очищаем выбор // Added by A.Nakorjakov 26.12.2007 14:31:50
  end;
end;

procedure TfrmMoveEdit.N1Click(Sender: TObject);
begin
//    SpisanieVid := SPISANIE_VID_PRICHINA;
  if TMenuItem(Sender).Caption = 'Списание по причине' then
    SetSpisanieVid( 1 );

// списание на отделение заменил "передачей в другое отд."   15.10.2007
//  if TMenuItem(Sender).Caption = 'Списание на отделение' then
//    SetSpisanieVid( 2 );

  if TMenuItem(Sender).Caption = 'Списание на пациента' then
    SetSpisanieVid( 3 );
end;

procedure TfrmMoveEdit.SetSpisanieVid(aSpisanieVid: integer);
var
  FUNC_USE_FIN_SOURCE_IN_SPIS_BY_PAC : boolean;
begin
  lcbMO_GROUP_TO.PopupMenu := nil;
  laFinSource.Hide;
  lcbFinSource.Hide;
  paDocHeader.Height := 153;
  

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_PROFIL', 0) = 1) then
  begin
    paDocHeader.Height := 179;
  end;
  
  dePacDate.Hide;
  if FGodMode then
    SpisanieVid := aSpisanieVid
  else
  begin
    if (FViewNum = VIDMOVE_SPISANIE){and(frmMain.Func_Set = )} then
      // по-умолчанию мс может списывать только на пациента, провизор только по причине
      // флагами можно разрешить провизору списывать на пациента, а мс по причине
      // Воронов О.А. 21.06.2008
      case frmMain.ProvisorState of // в хантах провизор может списывать только по причине, а мс только на пациента
        0 : if (aSpisanieVid = SPISANIE_VID_PRICHINA)and(dmMain.ConfigParams.GetParamValue('FUNC_SPIS_PRICH_BY_SMS', 0) <> 1) then
              SpisanieVid := SPISANIE_VID_PACIENT else SpisanieVid := aSpisanieVid;
        1 : if (aSpisanieVid = SPISANIE_VID_PACIENT)and(dmMain.ConfigParams.GetParamValue('FUNC_SPIS_ON_PAC_BY_PROVIZOR', 0) <> 1) then
              SpisanieVid := SPISANIE_VID_PRICHINA else SpisanieVid := aSpisanieVid;
      else
        SpisanieVid := aSpisanieVid;
      end
    else
       SpisanieVid := aSpisanieVid;
  end;

  cxGridRashKartDBTableView1FD_DATE_SPIS.Visible                 := (SpisanieVid = SPISANIE_VID_PACIENT);
  cxGridRashKartDBTableView1FD_DATE_SPIS.VisibleForCustomization := (SpisanieVid = SPISANIE_VID_PACIENT);

  IsShowPacMedNaz := False; // Added by A.Nakorjakov 18.12.2007 17:15:57
  IsCanShowPostGiven := False; // Added by A.Nakorjakov 29.12.2007 10:08:32
  case SpisanieVid of
    SPISANIE_VID_PRICHINA :
    begin
      bbuSelectVidSpasanie.Caption := 'По причине';
      bbuSelectVidSpasanie.Hint := 'Списание по причине';
      _dmMoveEdit.odsMO_GroupTo.Close;
      _dmMoveEdit.odsMO_GroupTo.DeleteVariables;

      //Added by Neronov A. 28.01.2012
      // Чтобы не было ошибки при переключении вида списания
      lcbMO_GROUP_TO.Width := mComment.Width;
      lcbMO_TO.Visible := False;
      _dmMoveEdit.odsMO_GroupTo.Master := nil;
      _dmMoveEdit.odsMO_GroupTo.MasterFields := '';

      _dmMoveEdit.odsMO_GroupTo.SQL.Text := ' select FK_ID, fc_name from MED.TSPISANIEVID WHERE FL_DEL = 0 AND(FN_DOCTYPE = 8) ORDER BY LOWER(FC_NAME) ';
      _dmMoveEdit.odsMO_GroupTo.Open;
      lcbMO_GROUP_TO.Show;
      Self.Caption := 'Списание по причине';

      lcbFinSource.EditValue := _dmMoveEdit.odsTDOCS.fieldbyname('FK_FINSOURCE_ID').AsVariant;

      if (dmMain.ConfigParams.GetParamValue('FUNC_USE_PROFIL', 0) = 1) then
      begin
        laPayCond.Caption := 'Профиль';
        laPayCond.Show;

        _dmMoveEdit.odsProfil.Close;
        _dmMoveEdit.odsProfil.Open;
        lcbPayCond.Properties.ListSource := _dmMoveEdit.dsProfil;
        lcbPayCond.Show;

        paDocHeader.Height := 179;
      end;

      if dmMain.ConfigParams.GetParamValue('FUNC_USE_FIN_SOURCE_IN_SPIS_PO_PRICHINE', 0) = 1 then
      begin
        laFinSource.Show;
        lcbFinSource.Show;

        paDocHeader.Height := 179;
      end;
    end;

// списание на отделение заменил "передачей в другое отд."   15.10.2007
//    SPISANIE_VID_OTDELENIE :
//    begin
//      bbuSelectVidSpasanie.Caption := 'На отделение';
//      bbuSelectVidSpasanie.Hint := 'Списание на отделение';
//      odsMO_GroupTo.Close;
//      odsMO_GroupTo.SQL.Text := ' SELECT fk_id, FC_NAME '+  // fk_id as GROUPID - для однообразия с предыдущим использованием odsNameToMove
//                                ' FROM MED.TOTDEL_MEDICA '+
//                                ' where LEVEL = (SELECT MAX(LEVEL) FROM MED.TOTDEL_MEDICA START WITH UPPER(FC_NAME) = ''СТАЦИОНАРНЫЕ'' CONNECT BY PRIOR fk_id = FK_OWNERID)  '+
//                                ' START WITH UPPER(FC_NAME) = ''СТАЦИОНАРНЫЕ'' '+  // списание можно делать только на стационарные отделения
//                                ' CONNECT BY PRIOR fk_id = FK_OWNERID '+
//                                ' ORDER BY LOWER(FC_NAME) ';
//      odsMO_GroupTo.Open;
//    end;

    SPISANIE_VID_PACIENT :
    begin
      //чистим переменные
      _dmMoveEdit.odsMO_GroupTo.DeleteVariables;
      tbuSepFasIE.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_FAS_EI_UHC', 0) = 1);
      chbFasEI.Visible := tbuSepFasIE.Visible;

      bbuSelectVidSpasanie.Caption := 'На пациента';
      bbuSelectVidSpasanie.Hint := 'Списание на пациента Вашего отделения';
      lcbMO_GROUP_TO.Hide;
      bbuSelectVidSpasanie.Hide;
      Self.Caption := 'Списание на пациента отделения';

      FUNC_USE_FIN_SOURCE_IN_SPIS_BY_PAC := (dmMain.ConfigParams.GetParamValue('FUNC_USE_FIN_SOURCE_IN_SPIS_BY_PAC', 0) = 1);
      if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_PAC_IN_SPIS', 0) = 1) then
      begin
        _dmMoveEdit.odsMO_GroupTo.Close;
        _dmMoveEdit.odsMO_GroupTo.DeleteVariables;
        _dmMoveEdit.odsMO_GroupTo.SQL.Text := ' select                                                                                                              '#13#10+
                                  '  k.FC_NAME,                                                                                                         '#13#10+
                                  '  k.fk_id                                                                                                           '#13#10;
        if FUNC_USE_FIN_SOURCE_IN_SPIS_BY_PAC then
          _dmMoveEdit.odsMO_GroupTo.SQL.Text := _dmMoveEdit.odsMO_GroupTo.SQL.Text +
                                  '  ,td.fk_id as FK_typedoc_ID,                                                                                         '#13#10+
                                  '  td.fc_name as FC_typedoc                                                                                           '#13#10;
        _dmMoveEdit.odsMO_GroupTo.SQL.Text := _dmMoveEdit.odsMO_GroupTo.SQL.Text +
                                  'from                                                                                                                 '#13#10+
                                  '  (select                                                                                                            '#13#10+
                                  '     ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_FIO(k1.FK_PEPLID)||'' (''|| TO_CHAR(k1.fd_rojd, ''DD.MM.YYYY'')||'')'' as FC_NAME,   '#13#10+
                                  '     k1.fk_id                                                                                                        '#13#10+
                                  '   from asu.tkarta k1, ASU.TROOM R,                                                                                  '#13#10+
                                  '        (select LOGIN.GET_SOTR_OTDELID(mo.fk_sotrid) as OTDELID                                                      '#13#10+
                                  '         from MED.TMo mo                                                                                             '#13#10+
                                  '         where mo.moid = MED.PKG_MEDSES.GET_CURMO) o                                                                 '#13#10+
                                  '   WHERE R.FK_OTDELID = o.OTDELID                                                                                    '#13#10+
                                  '     and k1.FP_TEK_COC = 2 AND k1.FL_VYB <> 1                                                                        '#13#10+
                                  '     AND ASU.PKG_REGIST_PACFUNC.GET_PAC_PALATAID(k1.FK_ID) = R.FK_ID                                                 '#13#10;
        if Self.toid > 0 then
        begin
           _dmMoveEdit.odsMO_GroupTo.SQL.Text := _dmMoveEdit.odsMO_GroupTo.SQL.Text+
                                  '   UNION                                                                                                             '#13#10+
                                  '   select                                                                                                            '#13#10+
                                  '     ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_FIO(k2.FK_PEPLID)||'' (''|| TO_CHAR(k2.fd_rojd, ''DD.MM.YYYY'')||'')'' as FC_NAME,   '#13#10+
                                  '     k2.fk_id                                                                                                        '#13#10+
                                  '   from asu.tkarta k2 where k2.fk_id = :pac_id'#13#10;
          _dmMoveEdit.odsMO_GroupTo.DeclareAndSet('pac_id', otInteger, Self.toid);
        end;
        _dmMoveEdit.odsMO_GroupTo.SQL.Text := _dmMoveEdit.odsMO_GroupTo.SQL.Text+
                                  '  ) k                                                                                                                '#13#10;
        if FUNC_USE_FIN_SOURCE_IN_SPIS_BY_PAC then
          _dmMoveEdit.odsMO_GroupTo.SQL.Text := _dmMoveEdit.odsMO_GroupTo.SQL.Text +
                                  '  ,asu.tinsurdocs id,                                                                                                  '#13#10+
                                  '  asu.tpac_insurance pi,                                                                                              '#13#10+
                                  '  asu.ttypedoc td                                                                                                     '#13#10;
        _dmMoveEdit.odsMO_GroupTo.SQL.Text := _dmMoveEdit.odsMO_GroupTo.SQL.Text +
                                  'WHERE k.fk_id > 0                                                                                                     '#13#10;
        if FUNC_USE_FIN_SOURCE_IN_SPIS_BY_PAC then
          _dmMoveEdit.odsMO_GroupTo.SQL.Text := _dmMoveEdit.odsMO_GroupTo.SQL.Text +
                                  '  and k.fk_id = pi.fk_pacid(+)                                                                                        '#13#10+
                                  '  and pi.fk_insurdocid = id.fk_id(+)                                                                                  '#13#10+
                                  '  and id.fk_typedocid = td.fk_id(+)                                                                                   '#13#10;
        _dmMoveEdit.odsMO_GroupTo.SQL.Text := _dmMoveEdit.odsMO_GroupTo.SQL.Text +
                                  'order by FC_NAME                                                                                                      '#13#10;
        _dmMoveEdit.odsMO_GroupTo.Open;
        lcbMO_GROUP_TO.Show;
        bbuSelectVidSpasanie.Show;
      end;  //  if dmMain.ConfigParams.GetParamValue('FUNC_USE_FIN_SOURCE_IN_SPIS_BY_PAC', 0) = 1 then


      if dmMain.ConfigParams.GetParamValue('FUNC_SPIS_PAC_BY_FOUNDPAC', False) = True then
      begin
        lcbMO_TO.Hide;
        _dmMoveEdit.odsMO_GroupTo.Close;
        _dmMoveEdit.odsMO_GroupTo.DeclareAndSet('pac_id', otInteger, Self.toid);

        _dmMoveEdit.odsMO_GroupTo.SQL.Text := 'SELECT :pac_id AS fk_id, p.fc_fam||'' ''||p.fc_im||'' ''||p.fc_otch||'' (стац.), ИБ ''||p.fk_ibid||''/''||p.fk_iby||'', ДР: ''|| TO_CHAR (p.fd_rojd, ''dd.mm.yyyy'') AS fc_name, 1 as FL_STAC  FROM asu.tkarta p WHERE p.fk_id = :pac_id'#13#10+
                                             'UNION ALL'#13#10+
                                             'SELECT :pac_id AS fk_id, a.fc_fam||'' ''||a.fc_im||'' ''||a.fc_otch||'' (амб.), ИБ ''||a.fk_ibid||''/''||a.fk_iby||'', ДР: ''|| TO_CHAR (a.fd_rojd, ''dd.mm.yyyy'') AS fc_name, 0 as FL_STAC  FROM asu.tambulance a WHERE a.fk_id = :pac_id'#13#10;

        _dmMoveEdit.odsMO_GroupTo.Open;

        lcbMO_GROUP_TO.Show;

        bbuSelectVidSpasanie.Show;
        lcbMO_GROUP_TO.PopupMenu := pmPacTypeSelect;

        // выставляем признак стационара для FoundPac.dll
        if _dmMoveEdit.odsMO_GroupTo.Locate('FK_ID', Self.toid, []) then
        begin
          miPacStac.Checked := (_dmMoveEdit.odsMO_GroupTo.FieldByName('FL_STAC').AsInteger = 1);
          miPacAmb.Checked  := (_dmMoveEdit.odsMO_GroupTo.FieldByName('FL_STAC').AsInteger = 0);
          pmPacTypeSelect.tag := _dmMoveEdit.odsMO_GroupTo.FieldByName('FL_STAC').AsInteger;
        end;
      end
      else
      if dmMain.ConfigParams.GetParamValue('FUNC_SPIS_PAC_BY_NAZ_DATE', 0) = 1 then
      begin
        lcbMO_GROUP_TO.Width := mComment.Width - lcbMO_TO.Width - 10;
        lcbMO_TO.Anchors := lcbMO_TO.Anchors - [akLeft];

        _dmMoveEdit.odsMO_TO.Close;
        _dmMoveEdit.odsMO_TO.SQL.Text := 'select a.FK_ID, a.FC_NAME, a.FD_DATE_LEFT from '#13#10+
                                        ' (select 1 as FK_ID, ''По пациентам за неделю'' as FC_NAME,   TRUNC(sysdate - 7) as FD_DATE_LEFT from dual '#13#10+
                                        '  UNION '#13#10+
                                        '  select 2 as FK_ID, ''По пациентам за месяц'' as FC_NAME,    TRUNC(ADD_MONTHS(sysdate,-1)) as FD_DATE_LEFT from dual '#13#10+
                                        '  UNION '#13#10+
                                        '  select 3 as FK_ID, ''По пациентам за 3 месяцa'' as FC_NAME, TRUNC(ADD_MONTHS(sysdate,-3)) as FD_DATE_LEFT from dual '#13#10+
                                        '  ) a '#13#10+
                                        'order by a.FK_ID';
        _dmMoveEdit.odsMO_TO.Open;
        _dmMoveEdit.odsMO_TO.First;
        lcbMO_TO.KeyValue := _dmMoveEdit.odsMO_TO.FieldByName('FK_ID').AsInteger;
        lcbMO_TO.OnCloseUp := lcbMO_TOCloseUp;

        _dmMoveEdit.odsMO_GroupTo.DeleteVariables;
        _dmMoveEdit.odsMO_GroupTo.DeclareAndSet('FD_DATE_LEFT', otDate, _dmMoveEdit.odsMO_TO.FieldByName('FD_DATE_LEFT').AsDateTime);
        _dmMoveEdit.odsMO_GroupTo.SQL.Text := 'select b.fk_pacid as FK_ID, b.FC_PAC_FIO as FC_NAME '#13#10+
                                             'from '#13#10+
                                             '(select '#13#10+
                                             '  a.fk_pacid, '#13#10+
                                             '  TRIM(p.FC_FAM || '' '' || DECODE (VarcharIsNUll(p.FC_IM), 1, '''', SUBSTR (p.FC_IM, 0, 1) || ''. '' || DECODE (VarcharIsNUll(p.FC_OTCH), 1, '''', SUBSTR (p.FC_OTCH, 0, 1) || ''. '')))  as FC_PAC_FIO '#13#10+
                                             'from '#13#10+
                                             '(select distinct '#13#10+
                                             '  nm.fk_pacid '#13#10+
                                             'from asu.tnazmed nm '#13#10+
                                             ' '#13#10+
                                             'where ((nm.fd_create >= :FD_DATE_LEFT) or (nm.fd_begin >= :FD_DATE_LEFT)) '#13#10;
                                  if Self.toid > 0 then // чтобы всегда видеть уже выбранного пациента
                                  begin
                                    _dmMoveEdit.odsMO_GroupTo.SQL.Text := _dmMoveEdit.odsMO_GroupTo.SQL.Text + ' '#13#10+
                                      ' UNION '#13#10+
                                      ' select '+IntTOStr(Self.toid)+' as FK_ID from dual';
                                  end;
                                  _dmMoveEdit.odsMO_GroupTo.SQL.Text := _dmMoveEdit.odsMO_GroupTo.SQL.Text + ') a, asu.tpeoples p '#13#10+
                                  'where '#13#10+
                                  ' (asu.PKG_REGIST_PACFUNC.GET_PEPL_ID(a.fk_pacid) = p.fk_id(+)) '#13#10+
                                  ') b '#13#10+
                                  ' order by FC_PAC_FIO ';
        _dmMoveEdit.odsMO_GroupTo.Master := _dmMoveEdit.odsMO_TO;
        _dmMoveEdit.odsMO_GroupTo.MasterFields := 'FD_DATE_LEFT';

        lcbMO_TO.Show;
        _dmMoveEdit.odsMO_GroupTo.Open;
        lcbMO_GROUP_TO.Show;
        bbuSelectVidSpasanie.Show;
      end
      else
      if dmMain.ConfigParams.GetParamValue('FUNC_SPIS_PAC_BY_SELECTED_DATE', 0) = 1 then
      begin
        lcbMO_GROUP_TO.Width := mComment.Width - dePacDate.Width - 10;
        lcbMO_TO.Hide;

        _dmMoveEdit.odsMO_GroupTo.Close;
        _dmMoveEdit.odsMO_GroupTo.SQL.Text := 'select b.fk_pacid as FK_ID, b.FC_NAME '#13#10+
                                             'from '#13#10+
                                             '(SELECT '#13#10+
                                             '   a.fk_pacid, '#13#10+
                                             '   p.fc_fam ||'' ''|| p.fc_im ||'' ''|| p.fc_otch ||'',  ДР: ''|| TO_CHAR(p.FD_ROJD, ''dd.mm.yyyy'') as FC_NAME '#13#10+
                                             ' FROM '#13#10+
                                             '   (SELECT P.FK_PACID/*, R1.FK_OTDELID as pac_otd_id, R1.FC_PALATA*/ FROM ASU.TROOM R1, ASU.TPERESEL P '#13#10+
                                             '    WHERE R1.FK_OTDELID = LOGIN.GET_SOTR_OTDELID(:FK_VRACHID) '#13#10+
                                             '      AND R1.FK_ID = P.fk_palataid '#13#10+
                                             '      and (P.fd_data1 <TRUNC(:cur_date+1))and(TRUNC(:cur_date)<=P.fd_data2) '#13#10+
                                             '    group by P.FK_PACID/*, R1.FK_OTDELID, R1.FC_PALATA*/'#13#10;
                                  if Self.toid > 0 then // чтобы всегда видеть уже выбранного пациента
                                  begin
                                      _dmMoveEdit.odsMO_GroupTo.SQL.Text := _dmMoveEdit.odsMO_GroupTo.SQL.Text + ' '#13#10+
                                      ' UNION '#13#10+
                                      ' select '+IntTOStr(Self.toid)+' as FK_PACID from dual';
                                  end;
                                  _dmMoveEdit.odsMO_GroupTo.SQL.Text := _dmMoveEdit.odsMO_GroupTo.SQL.Text + ') a, asu.tpeoples p '#13#10+
                                  'where '#13#10+
                                  ' (asu.PKG_REGIST_PACFUNC.GET_PEPL_ID(a.fk_pacid) = p.fk_id(+)) '#13#10+
                                  ') b '#13#10+
                                  ' order by FC_NAME';

        dePacDate.Properties.OnEditValueChanged := nil;
        dePacDate.EditValue := Today;
        dePacDate.Properties.OnEditValueChanged := dePacDatePropertiesEditValueChanged;
        
        _dmMoveEdit.odsMO_GroupTo.DeleteVariables;
        _dmMoveEdit.odsMO_GroupTo.DeclareAndSet('FK_VRACHID', otInteger, dmMain.nSotrFK_ID);
        _dmMoveEdit.odsMO_GroupTo.DeclareAndSet('cur_date', otDate, dePacDate.EditValue );

        _dmMoveEdit.odsMO_GroupTo.Open;
        lcbMO_GROUP_TO.Show;
        dePacDate.Show;
        bbuSelectVidSpasanie.Show;
      end;


      {Added by A.Nakorjakov 17.12.2007 12:26:26
      Start}
      if IsHeadNurseMode then
      begin
        IsShowPacMedNaz := True;

        if dmMain.ConfigParams.GetParamValue('FUNC_SPIS_PAC_BY_NAZ_DATE', 0) = 0 then
        begin
          _dmMoveEdit.odsMO_GroupTo.Close;
            _dmMoveEdit.odsMO_GroupTo.SQL.Text := //список пациентов, которым выдано назначение
              ' select k.fk_id as FK_ID,                           '+sLineBreak+
              ' k.fc_fam|| '' '' ||k.fc_im|| '' '' ||k.fc_otch fc_name '+sLineBreak+
              ' from asu.tkarta k,        '+sLineBreak+
              '   (SELECT FK_ID FK_ROOMID '+sLineBreak+
              '    FROM ASU.TROOM,        '+sLineBreak+
              '      (select LOGIN.GET_SOTR_OTDELID(mo.fk_sotrid) as OTDELID from MED.TMo mo where mo.moid = MED.PKG_MEDSES.GET_CURMO) '+sLineBreak+
              '    WHERE FK_OTDELID = OTDELID) '+sLineBreak+
              '    WHERE FP_TEK_COC = 2 AND FL_VYB <> 1 '+sLineBreak+
              '    AND ASU.PKG_REGIST_PACFUNC.GET_PAC_PALATAID(k.FK_ID) = FK_ROOMID '+sLineBreak+
              ' ORDER BY fc_name';
        end;

          SetodsPacMedNazVariable();
         _dmMoveEdit.odsMO_GroupTo.DeleteVariables;
          _dmMoveEdit.odsMO_GroupTo.Open;
          lcbMO_GROUP_TO.Show;
          bbuSelectVidSpasanie.Show;
      end;  // if frmMain.Medses_Give_Mode = HEADNURSEMODE
      { Added by A.Nakorjakov 17.12.2007 12:26:26
      Finished}


      {Added by A.Nakorjakov 29.12.2007
      Start}
      if IsPostNurseMode then
      begin
        IsCanShowPostGiven := True;
      end;
      { Added by A.Nakorjakov 29.12.2007
      Finished}
    end; //  3 :

    SPISANIE_VID_RETURN_POSTAV:
    begin
      bbuSelectVidSpasanie.Caption := 'Поставщику';
      bbuSelectVidSpasanie.Hint := 'Возврат поставщику';
      _dmMoveEdit.odsMO_GroupTo.Close;
      _dmMoveEdit.odsMO_GroupTo.SQL.Text := ' select FK_ID, fc_name from MED.TSPISANIEVID WHERE FL_DEL = 0 AND(FN_DOCTYPE = 11) ORDER BY LOWER(FC_NAME) ';
      _dmMoveEdit.odsMO_GroupTo.Open;
      Self.Caption := 'Возврат поставщику';
    end;

    SPISANIE_VID_HITEC :
    begin
      bbuSelectVidSpasanie.Caption := 'Выс. технологии';
      bbuSelectVidSpasanie.Hint := 'Списание по высоким технологиям';
      _dmMoveEdit.odsMO_GroupTo.Close;
      _dmMoveEdit.odsMO_GroupTo.SQL.Text := ' select FK_ID, fc_name from MED.TSPISANIEVID WHERE FL_DEL = 0 AND(FN_DOCTYPE = 14) ORDER BY LOWER(FC_NAME) ';
      _dmMoveEdit.odsMO_GroupTo.Open;
      lcbMO_GROUP_TO.Show;
      Self.Caption := 'Списание по высоким технологиям';
    end
    else
      SpisanieVid := SPISANIE_VID_NONE;
  end; // case aSpisanieVid of

  bbuSelectVidSpasanie.Enabled := bCanEdit and (SpisanieVid <> SPISANIE_VID_NONE);
  bbuSelectVidSpasanie.Visible :=  SpisanieVid <> SPISANIE_VID_NONE;
end;

procedure TfrmMoveEdit.SetViewMode(aViewNumber: Integer; aCanIns, aCanEdit: Boolean);
begin
//  VIEW_MODE_KARD_LIST = 1;
//  VIEW_MODE_RETURN    = 2;
//  VIEW_MODE_SPISANIE  = 3;
  flIns := aCanIns;
  bCanEdit := aCanEdit;
  who_called := aViewNumber;
  FViewNum := aViewNumber;

  if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_INV_NOMER', 0) = 1 then
  begin
    cxGridRashKartDBTableView1_FC_INV_NOMER.VisibleForCustomization := True;
    cxGridRashKartDBTableView1_FC_INV_NOMER.Visible                 := True;
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_NDS', 0) = 0 then
  begin
    cxGridRashKartDBTableView1FN_NDS.VisibleForCustomization := False;
    cxGridRashKartDBTableView1FN_NDS.Visible                 := False;
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_NACENKA', 0) = 0 then
  begin
    cxGridRashKartDBTableView1FN_NACENKA.VisibleForCustomization := False;
    cxGridRashKartDBTableView1FN_NACENKA.Visible                 := False;
    cxGridRashKartDBTableView1FN_PRICE_MNF.VisibleForCustomization := False;
    cxGridRashKartDBTableView1FN_PRICE_MNF.Visible                 := False;
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_JNVLS', 0) = 0 then
  begin
    cxGridRashKartDBTableView1FL_JNVLS.VisibleForCustomization := False;
    cxGridRashKartDBTableView1FL_JNVLS.Visible                 := False;
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_MIBP', 0) = 0 then
  begin
    cxGridRashKartDBTableView1FL_MIBP.VisibleForCustomization := False;
    cxGridRashKartDBTableView1FL_MIBP.Visible                 := False;
  end;    

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_FORMULAR', 0) = 0 then
  begin
    cxGridRashKartDBTableView1FL_FORMULAR.VisibleForCustomization := False;
    cxGridRashKartDBTableView1FL_FORMULAR.Visible                 := False;
  end;

  case aViewNumber of
    VIDMOVE_KARD_LIST:
    Begin //нажали Движение > добавить из сп. карточек
      lbDemand.Caption := 'Накладная №';
      lcbMO_GROUP_FROM.Enabled  := False;
      lcbMO_FROM.Enabled        := False;

      if (dmMain.ConfigParams.GetParamValue('FUNC_USE_PROFIL', 0) = 1) then
      begin
        laPayCond.Caption := 'Профиль';
        laPayCond.Show;

        _dmMoveEdit.odsProfil.Close;
        _dmMoveEdit.odsProfil.Open;
        lcbPayCond.Properties.ListSource := _dmMoveEdit.dsProfil;
        lcbPayCond.Show;

        paDocHeader.Height := 179;
      end;
    end;

    VIDMOVE_NAKL_TREB:
    begin
      if IsAddRashWithTrebShow then
      begin
        tbuAdd.Style := tbsDropDown;
        tbuAdd.DropdownMenu := pmAdd;
        acAddWithTrebDPC.Enabled := True;
        acAddWithTrebDPC.Visible := True;  
        acInsbyEAN.Enabled := True;
        acInsbyEAN.Visible := True;
        if IsNewClearTreb then
        begin
          _dmMoveEdit.odsMO_TO.Open;
          _dmMoveEdit.odsMO_FROM.Open;
          _dmMoveEdit.odsMO_GroupTo.Open;
          _dmMoveEdit.odsMO_GroupFrom.Open;

          lcbMO_GROUP_FROM.Enabled := False;
          lcbMO_FROM.Enabled       := False;
          lcbMO_GROUP_TO.Enabled   := True;
          lcbMO_TO.Enabled         := True;

          lcbMO_GROUP_FROM.Width := lcbMO_GROUP_FROM.Width -  lcbMO_FROM.Width - 20; // выставляем размеры полей ввода
          lcbMO_GROUP_FROM.Anchors := [akLeft, akTop];

          lcbMO_GROUP_TO.Width := lcbMO_GROUP_TO.Width -  lcbMO_TO.Width - 20; // выставляем размеры полей ввода
          lcbMO_GROUP_TO.Anchors := [akLeft, akTop];
//          lcbMO_TO.Left  := lcbMO_FROM.Left;
//          lcbMO_TO.Width := lcbMO_FROM.Width;

          laFrom.Show;
          laTo.Show;

          lcbMO_GROUP_FROM.Show;
          lcbMO_FROM.Show;
          lcbMO_GROUP_TO.Show;
          lcbMO_TO.Show;
        end;

        if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1)and(dmMain.ConfigParams.GetParamValue('FUNC_USE_FIN_SOURCE_IN_AUTOFILL', 1) = 1) then
        begin
          tbuAutoFill.Style := tbsDropDown;
          tbuAutoFill.DropdownMenu := pmAutoFill_FinSource;
          tbuAutoFillPlan.Style := tbsDropDown;
          tbuAutoFillPlan.DropdownMenu := pmAutoFillPlan_FinSource;
        end;
      end;
    end;

    VIDMOVE_TO_REZERV: // 2, 4
    begin                      
      //Добавил везде поддержку штрих-кодирования
      tbuAdd.Style := tbsDropDown;
      tbuAdd.DropdownMenu := pmAdd;
      acInsbyEAN.Enabled := True;
      acInsbyEAN.Visible := True;

      Caption := 'Регистрация передачи в резерв';
      HelpContext:=24;
      lbDemand.Caption := 'Передача в резерв №';
      grbRaskhod.Caption := 'Передача в резерв';
      bbuSelectVidSpasanie.Hide;

      _dmMoveEdit.odsMO_TO.Open;
      _dmMoveEdit.odsMO_GroupTo.Open;
      lcbMO_GROUP_FROM.Enabled  := False;
      lcbMO_FROM.Enabled        := False;
      lcbMO_GROUP_TO.Enabled  := False;
      lcbMO_TO.Enabled        := False;
      lcbMO_GROUP_FROM.Width := lcbMO_GROUP_FROM.Width -  lcbMO_FROM.Width - 20; // выставляем размеры полей ввода
      lcbMO_GROUP_FROM.Anchors := [akLeft, akTop];
      laFrom.Show;
      lcbMO_GROUP_FROM.Show;
      lcbMO_FROM.Show;
      laTo.Hide;
      lcbMO_GROUP_TO.Hide;
      lcbMO_TO.Hide;
    end;

    VIDMOVE_FROM_REZERV: // 2, 5
    begin                          
      Caption := 'Регистрация возврата из резерва';
      HelpContext:=24;
      lbDemand.Caption := 'Возврат из резерва №';
      grbRaskhod.Caption := 'Возврат из резерва';
      bbuSelectVidSpasanie.Hide;

      _dmMoveEdit.odsMO_FROM.Open;
      _dmMoveEdit.odsMO_GroupFROM.Open;
      lcbMO_GROUP_TO.Enabled  := False;
      lcbMO_TO.Enabled        := False;
      lcbMO_GROUP_TO.Enabled  := False;
      lcbMO_TO.Enabled        := False;      
      lcbMO_GROUP_TO.Width := lcbMO_GROUP_TO.Width -  lcbMO_TO.Width - 20; // выставляем размеры полей ввода
      lcbMO_GROUP_TO.Anchors := [akLeft, akTop];
      laTO.Show;
      lcbMO_GROUP_TO.Show;
      lcbMO_TO.Show;
      laFrom.Hide;
      lcbMO_GROUP_FROM.Hide;
      lcbMO_FROM.Hide;
    end;

    VIDMOVE_RETURN:
    Begin //нажали Движение > возврат
      //Добавил везде поддержку штрих-кодирования
      tbuAdd.Style := tbsDropDown;
      tbuAdd.DropdownMenu := pmAdd;
      acInsbyEAN.Enabled := True;
      acInsbyEAN.Visible := True;

      bReturn := True;
      sMessage := 'Возврат';
      Caption := 'Регистрация возвратного документа';
      grbRaskhod.Caption := 'Возврат в аптеку';
      lbDemand.Caption := 'Возврат в аптеку';

      lcbMO_GROUP_FROM.Width := lcbMO_GROUP_FROM.Width - lcbMO_FROM.Width - 10;
      lcbMO_FROM.Enabled := False;
      lcbMO_GROUP_FROM.Enabled := False;
      lcbMO_FROM.Anchors := lcbMO_FROM.Anchors - [akLeft];

      lcbMO_GROUP_TO.Width := lcbMO_GROUP_TO.Width - lcbMO_TO.Width - 10;
      lcbMO_TO.Enabled := True;
      lcbMO_TO.Anchors := lcbMO_TO.Anchors - [akLeft];

      lcbMO_FROM.Show;
      lcbMO_TO.Show;      
    end;

    VIDMOVE_SPISANIE: // 3, 8
    Begin //нажали  Движение>Добавить списание медикаментов
      //Добавил везде поддержку штрих-кодирования
      tbuAdd.Style := tbsDropDown;
      tbuAdd.DropdownMenu := pmAdd;
      acInsbyEAN.Enabled := True;
      acInsbyEAN.Visible := True;

      tbuTemplate.Visible :=  (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_TEMPLATES_VID_MOVE_8', 0) = 1);
      lbDemand.caption:='Акт списания №';
      sMessage := 'Списание';
      Caption := 'Регистрация акта списания';
      grbRaskhod.Caption := 'Cписание';

      bbuSelectVidSpasanie.Show;
      laTo.Hide;
      SetSpisanieVid( SpisanieVid );

       case frmMain.ProvisorState of
         0 :  bbuSelectVidSpasanie.Enabled := (dmMain.ConfigParams.GetParamValue('FUNC_SPIS_PRICH_BY_SMS', 0) = 1)and(bCanEdit);
         1 :  bbuSelectVidSpasanie.Enabled := (dmMain.ConfigParams.GetParamValue('FUNC_SPIS_ON_PAC_BY_PROVIZOR', 0) = 1)and(bCanEdit);
       end;
                             

      if (dmMain.ConfigParams.GetParamValue('FUNC_USE_PROFIL', 0) = 1) then
      begin
        laPayCond.Caption := 'Профиль';
        laPayCond.Show;

        _dmMoveEdit.odsProfil.Close;
        _dmMoveEdit.odsProfil.Open;
        lcbPayCond.Properties.ListSource := _dmMoveEdit.dsProfil;
        lcbPayCond.Show;

        paDocHeader.Height := 179;
      end;

      if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1) and (dmMain.ConfigParams.GetParamValue('FUNC_USE_FIN_SOURCE_IN_SPIS_PO_PRICHINE', 0) = 1) then
      begin
        laFinSource.Show;
        lcbFinSource.Show;

        paDocHeader.Height := 179;
      end;
    end;

    VIDMOVE_RETURN_POSTAV: // 3, 11
    Begin //нажали  Движение>Возврат поставщику   
      //Добавил везде поддержку штрих-кодирования
      tbuAdd.Style := tbsDropDown;
      tbuAdd.DropdownMenu := pmAdd;
      acInsbyEAN.Enabled := True;
      acInsbyEAN.Visible := True;

      lbDemand.caption:='Возврат поставщику №';
      sMessage := 'Возврат поставщику';
      Caption := 'Регистрация возврата поставщику';
      grbRaskhod.Caption := 'Возврат';

      SetSpisanieVid( SPISANIE_VID_RETURN_POSTAV );

      bbuSelectVidSpasanie.Caption := 'Поставщику';
      bbuSelectVidSpasanie.Hide;

      laTo.Caption := 'Причина/поставщик';
      laTo.Show;

      lcbMO_GROUP_TO.Width := lcbMO_GROUP_TO.Width - lcbMO_TO.Width - buPostav.Width - 10;
      lcbMO_GROUP_TO.Hint := 'Причина';

      lcbMO_TO.Hint := 'Поставщик';
      lcbMO_TO.Left := lcbMO_TO.Left - buPostav.Width;
      buPostav.Left := lcbMO_TO.Left + lcbMO_TO.Width;
      buPostav.Top  := lcbMO_TO.Top;
      buPostav.Show;

      _dmMoveEdit.odsPostav.Close;
      _dmMoveEdit.odsPostav.Open;
      lcbMO_TO.ListSource := _dmMoveEdit.dsPostav;
      lcbMO_TO.Enabled := True;
      lcbMO_TO.Anchors := lcbMO_TO.Anchors - [akLeft];
      lcbMO_TO.Show;

      // медсестра може выбирать вид списания - провизор нет - только по причине
      bbuSelectVidSpasanie.Enabled := False; //(frmMain.ProvisorState = 0)and(SpisanieVid > 0)and(bCanEdit);
      bbuSelectVidSpasanie.Hide;
      cxGridRashKartDBTableView1FC_RETURN_POST.Visible := True;
      cxGridRashKartDBTableView1FC_RETURN_POST.VisibleForCustomization := True;

      //Added  by Neronov A.S. 19.12.2011
      if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_KONTRAKT', 0) = 1 then
      begin
        cePriceDoc.Width := deRegisterDate.Width;
        cePriceDoc.Anchors := cePriceDoc.Anchors - [akRight];

        laKontrakt.Left := cePriceDoc.Left + cePriceDoc.Width + 10;
        laKontrakt.Top := laSummByDoc.Top;
        lcbKontrakt.Left :=  laKontrakt.Left + laKontrakt.Width + 5;
        lcbKontrakt.Width := Self.mComment.Width - cePriceDoc.Width -  laKontrakt.Width - 15;

        if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_KONTRAKT_WO_LIST', 0) = 1 then
        begin
          lcbKontrakt.Properties.Buttons.Clear;
          lcbKontrakt.Properties.ImmediateDropDown := False;
          lcbKontrakt.Properties.IncrementalFiltering := False;
          lcbKontrakt.Properties.IncrementalSearch := False;          
//          lcbKontrakt.Properties.ListSource := nil;
        end;

        _dmMoveEdit.odsKonractsList.Open;

        laKontrakt.Show;
        lcbKontrakt.Show;
      end; 

      if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1 then
      begin
        laFinSource.Show;
        lcbFinSource.Show;

        paDocHeader.Height := 179;
      end;

    end;

    VIDMOVE_SPISANIE_HITEC: // 3, 14
    Begin //нажали  Движение>Списание на выс. технологии  
      //Добавил везде поддержку штрих-кодирования
      tbuAdd.Style := tbsDropDown;
      tbuAdd.DropdownMenu := pmAdd;
      acInsbyEAN.Enabled := True;
      acInsbyEAN.Visible := True;

      lbDemand.caption:='Акт списания №';
      sMessage := 'Списание на выс. технологии';
      Caption := 'Регистрация списания на выс. технологии';
      grbRaskhod.Caption := 'Высокие технологии';

      SetSpisanieVid( SPISANIE_VID_HITEC );

      bbuSelectVidSpasanie.Caption := 'Вид помощи';
      bbuSelectVidSpasanie.Hide;

      laTo.Caption := 'Вид помощи';
      laTo.Show;

      lcbMO_GROUP_TO.Hint := 'Причина';

      // медсестра може выбирать вид списания - провизор нет - только по причине
      bbuSelectVidSpasanie.Enabled := False;
      bbuSelectVidSpasanie.Hide;

      if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1 then
      begin
        laFinSource.Show;
        lcbFinSource.Show;

        paDocHeader.Height := 179;
      end;
    end;

    VIDMOVE_OTPUSK_PO_CEL_PROG: // 3, 13
    Begin //нажали  Движение>Возврат поставщику      
      //Добавил везде поддержку штрих-кодирования
      tbuAdd.Style := tbsDropDown;
      tbuAdd.DropdownMenu := pmAdd;
      acInsbyEAN.Enabled := True;
      acInsbyEAN.Visible := True;

      lbDemand.caption:='Отпуск по цел. программам №';
      sMessage := 'Отпуск по целевым программам';
      Caption := 'Регистрация отпуска по цел. программам';
      grbRaskhod.Caption := 'Отпуск';

      bbuSelectVidSpasanie.Caption := 'Получателю';
      bbuSelectVidSpasanie.Hide;
      laTo.Hide;
      lcbMO_GROUP_TO.Hide;

      // медсестра може выбирать вид списания - провизор нет - только по причине
      bbuSelectVidSpasanie.Enabled := False; //(frmMain.ProvisorState = 0)and(SpisanieVid > 0)and(bCanEdit);
      bbuSelectVidSpasanie.Hide;
    end;

    VIDMOVE_OTPUSK_PO_NAC_PR: // 3, 12
    Begin //нажали  Движение>Возврат поставщику    
      //Добавил везде поддержку штрих-кодирования
      tbuAdd.Style := tbsDropDown;
      tbuAdd.DropdownMenu := pmAdd;
      acInsbyEAN.Enabled := True;
      acInsbyEAN.Visible := True;

      lbDemand.caption:='Отпуск по нац. проекту №';
      sMessage := 'Отпуск по нац. проекту';
      Caption := 'Регистрация отпуска по нац. проекту';
      grbRaskhod.Caption := 'Отпуск';

      bbuSelectVidSpasanie.Caption := 'Поставщику';
      bbuSelectVidSpasanie.Hide;
      laTo.Hide;
      lcbMO_GROUP_TO.Hide;

      // медсестра може выбирать вид списания - провизор нет - только по причине
      bbuSelectVidSpasanie.Enabled := False; //(frmMain.ProvisorState = 0)and(SpisanieVid > 0)and(bCanEdit);
      bbuSelectVidSpasanie.Hide;
    end;

    VIDMOVE_VVOD_OST: // 1, 9 - ввод остатков
    begin                                         
      //Добавил везде поддержку штрих-кодирования
      tbuAdd.Style := tbsDropDown;
      tbuAdd.DropdownMenu := pmAdd;
      acInsbyEAN.Enabled := True;
      acInsbyEAN.Visible := True;

      Caption := 'Регистрация приходного документа';
      HelpContext:=24;
      lbDemand.Caption := 'Акт ввода остатков №';
      laFrom.Caption := 'Акт составил';
      grbRaskhod.Caption := 'Остатки';

      lcbMO_GROUP_FROM.Hide;
      lcbMO_TO.Left := Self.lcbMO_GROUP_FROM.Left;
      lcbMO_TO.Width := Self.lcbMO_GROUP_FROM.Width;
      lcbMO_TO.Top := Self.lcbMO_GROUP_FROM.Top;

      lcbMO_TO.Show;
      _dmMoveEdit.odsMO_TO.Open;
    end;

    VIDMOVE_PRIH_POST, VIDMOVE_PRIH_RPO: // 1, 1 - приход от поставщика
    begin                                         
      //Добавил везде поддержку штрих-кодирования
      tbuAdd.Style := tbsDropDown;
      tbuAdd.DropdownMenu := pmAdd;
      acInsbyEAN.Enabled := True;
      acInsbyEAN.Visible := True;

      Caption := 'Регистрация приходного документа';
      HelpContext:=24;
      lbDemand.Caption := 'Накладная №';
      laFrom.Caption := 'Поставщик:';
      grbRaskhod.Caption := 'Приход';

      // для склада ИМН
      if (aViewNumber = VIDMOVE_PRIH_POST)and(dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN) then
      begin
        lcbMO_FROM.Left  := Self.mComment.Left;
        lcbMO_FROM.Width := 250;
        lcbMO_FROM.Anchors := [akLeft,akTop];
        laFrom.Caption := 'Поставщик/Вид пост.:';
        lcbMO_GROUP_FROM.Hint := 'Поставщик';
        lcbMO_GROUP_FROM.Anchors := [akLeft,akTop, akRight];
        buPostav.Anchors  := [akLeft,akTop];

        lcbMO_GROUP_FROM.Left  := lcbMO_FROM.Left + lcbMO_FROM.Width + 10;
        lcbMO_GROUP_FROM.Width := Self.mComment.Width - lcbMO_FROM.Width - 10;
        lcbMO_GROUP_FROM.ListSource := dmMain.dsVid_post;
        lcbMO_GROUP_FROM.Hint := 'Вид поступления';
        dmMain.odsVid_post.Close;
        dmMain.odsVid_post.Open;
        lcbMO_GROUP_FROM.Show;
        lcbMO_GROUP_FROM.Enabled := True;
      end
      else
      begin
        lcbMO_GROUP_FROM.Hide;
        lcbMO_FROM.Left  := Self.lcbMO_GROUP_FROM.Left;
        lcbMO_FROM.Width := Self.lcbMO_GROUP_FROM.Width;
      end;

      if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_KONTRAKT', 0) = 1 then
      begin
        cePriceDoc.Width := deRegisterDate.Width;
        cePriceDoc.Anchors := cePriceDoc.Anchors - [akRight];

        laKontrakt.Left := cePriceDoc.Left + cePriceDoc.Width + 10;
        laKontrakt.Top := laSummByDoc.Top;
        lcbKontrakt.Left :=  laKontrakt.Left + laKontrakt.Width + 5;
        lcbKontrakt.Width := Self.mComment.Width - cePriceDoc.Width -  laKontrakt.Width - 15;

        if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_KONTRAKT_WO_LIST', 0) = 1 then
        begin
          lcbKontrakt.Properties.Buttons.Clear;
          lcbKontrakt.Properties.ImmediateDropDown := False;
          lcbKontrakt.Properties.IncrementalFiltering := False;
          lcbKontrakt.Properties.IncrementalSearch := False;          
//          lcbKontrakt.Properties.ListSource := nil;
        end;

        _dmMoveEdit.odsKonractsList.Open;

        laKontrakt.Show;
        lcbKontrakt.Show;
      end;

      if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_SCHET_FAKTURA', 0) = 1 then
      begin
        laSchetFaktura.Left := deRegisterDate.Left + deRegisterDate.Width + 10;
        lcbSchetFaktura.Left := laSchetFaktura.Left + laSchetFaktura.Width + 5;
        lcbSchetFaktura.Width := Self.mComment.Width - deRegisterDate.Width -  laSchetFaktura.Width - 15;

        if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_SCHET_FAKTURA_WO_LIST', 0) = 1 then
        begin
          lcbSchetFaktura.Properties.Buttons.Clear;
          lcbSchetFaktura.Properties.ImmediateDropDown    := False;
          lcbSchetFaktura.Properties.IncrementalFiltering := False;
          lcbSchetFaktura.Properties.IncrementalSearch := False;
//          lcbSchetFaktura.Properties.ListSource := nil;
        end;
        _dmMoveEdit.odsSchetFaktura.Open;

        laSchetFaktura.Show;
        lcbSchetFaktura.Show;
      end;

      if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1 then
      begin
        laFinSource.Show;
        lcbFinSource.Show;

        paDocHeader.Height := 179;
      end;

      if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_PAY_COND', 0) = 1 then
      begin
        laPayCond.Show;
        lcbPayCond.Show;

        paDocHeader.Height := 179;
      end;

      lcbMO_FROM.Properties.ListSource := dmMain.dsPostav;
      lcbMO_FROM.Top   := Self.lcbMO_GROUP_FROM.Top;
      if aViewNumber = VIDMOVE_PRIH_POST then
      begin
        lcbMO_FROM.Enabled := True;
        with lcbMO_FROM.Properties.ListColumns.Add do
        begin
          FieldName := 'FD_LICENSE';
          Caption  := 'Срок лицензии';
        end;
        lcbMO_FROM.Properties.ListOptions.ShowHeader := True;
      end
      else
      begin
        dmMain.odsPostav.Close;
        dmMain.odsPostav.SetVariable('RPO',1);
        dmMain.odsPostav.Open;
      end;
      lcbMO_FROM.Show;
      _dmMoveEdit.odsMO_GroupFrom.Close;

      // втискиваем кнопку добавления поставщиков
      lcbMO_FROM.Width := lcbMO_FROM.Width - buPostav.Width;
      buPostav.Left := lcbMO_FROM.Left + lcbMO_FROM.Width;
      buPostav.Show;

      if aViewNumber = VIDMOVE_PRIH_POST then
      begin
        tbuAdd.Style := tbsDropDown;
        tbuAdd.DropdownMenu := pmAdd;
        acInsbyEAN.Enabled := True;
        acInsbyEAN.Visible := True;
      end;
    end;

    VIDMOVE_SPISANIE_RPO: // 3, 7 - списание на РПО
    begin                  
      //Добавил везде поддержку штрих-кодирования
      tbuAdd.Style := tbsDropDown;
      tbuAdd.DropdownMenu := pmAdd;
      acInsbyEAN.Enabled := True;
      acInsbyEAN.Visible := True;

      HelpContext:=24;
      laFrom.Caption := 'Поставщик:';
      lbDemand.Caption := 'Накладная №';
      grbRaskhod.Caption := 'Списание в РПО';

      _dmMoveEdit.odsMO_GroupFrom.Close;
      lcbMO_GROUP_FROM.ListSource := _dmMoveEdit.dsPostav;
      _dmMoveEdit.odsPostav.SetVariable('RPO', 1); // выставляем признак РПО - тогда в поставщиках будет отображаться РПО
      _dmMoveEdit.odsPostav.Open;
      lcbMO_GROUP_FROM.ReadOnly := True;
    end;
  end; // case aViewNumber of
end;

procedure TfrmMoveEdit.odsKartAfterRefresh(DataSet: TDataSet);
begin
  acdel.Enabled  := bCanEdit and (DataSet.RecordCount > 0);       //Added by Neronov A.S.
  acEdit.Enabled := bCanEdit and (DataSet.RecordCount > 0);       //Added by Neronov A.S.

  if (FViewNum = VIDMOVE_PRIH_POST)and(dmMain.ConfigParams.GetParamValue('FUNC_CHECK_PRICES_IN_NAKL', 0) = 1) then
  begin
    lcbMO_FROM.Enabled    := (DataSet.RecordCount = 0)and(bCanEdit);
    deInvoiceDate.Enabled := (DataSet.RecordCount = 0)and(bCanEdit);
  end;
  
  if (FViewNum = VIDMOVE_NAKL_TREB)and(FIsShowTreb) then
  begin
    odsZatrebovano.AfterScroll := nil;
    odsZatrebovano.Close;
    odsZatrebovano.Open;
    odsZatrebovano.AfterScroll := odsZatrebovanoAfterScroll;

    miLinkWithTreb.Enabled := (odsKart.RecordCount > 0);
    miDelLink.Enabled      := (odsKart.RecordCount > 0);
    miCheckLink.Enabled    := (odsKart.RecordCount > 0);
  end;

  if (FViewNum = VIDMOVE_PRIH_POST)and(dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN) then
  begin
    lcbMO_GROUP_FROM.Enabled := (DataSet.RecordCount = 0);
  end;
  cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 2);
  SetAcDelEnable();// Added by A.Nakorjakov 18.12.2007
  odsKartAfterScroll(DataSet);

  // выставляем временные остатки
  if (FVidNum = VID_DVIJENIE)OR(FVidNum = VID_RASHOD) then
  begin
    dmMain.SetTempOstByDoc(dmMain.FK_CurMO_GROUP, idDocs);
  end;

  if (bCanEdit = true)and(frmMain.ProvisorState = 0)and(odsKart.RecordCount > 0)and(dmMain.ConfigParams.GetParamValue('FUNC_CHANGE_DOC_DATE_RIGHT', False)=False) then
    deRegisterDate.Enabled := False;
end;

procedure TfrmMoveEdit.EnableInput( aEnabled : Boolean );
begin
  eNumDoc.Enabled          := aEnabled;
  deInvoiceDate.Enabled    := aEnabled;
  deRegisterDate.Enabled   := aEnabled;
//  deRegistrTime.Enabled    := aEnabled;

  lcbMO_GROUP_FROM.Enabled := aEnabled and ((FViewNum  <> VIDMOVE_RETURN) and (not IsNewClearTreb));

  if (FViewNum = VIDMOVE_PRIH_POST)and(dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN)and(odsKart.RecordCount > 0) then
  begin
    lcbMO_GROUP_FROM.Enabled := False;
  end;  

  lcbMO_FROM.Enabled       := aEnabled and (FViewNum  <> VIDMOVE_RETURN) and (not IsNewClearTreb);
  if FViewNum = VIDMOVE_RETURN then
    lcbMO_GROUP_TO.Enabled   :=  (lcbMO_GROUP_TO.Text = '')and(aEnabled)
  else
    lcbMO_GROUP_TO.Enabled := aEnabled;
  lcbMO_TO.Enabled         := aEnabled;
  mComment.Enabled         := aEnabled;
  lcbKontrakt.Enabled      := aEnabled;
  bbuSelectVidSpasanie.Enabled := aEnabled;
  acSelectVidSpasanie.Enabled := aEnabled;

  case FViewNum of
    VIDMOVE_PRIH_POST:
    begin
      lcbFinSource.Enabled := aEnabled and (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1);
      buPostav.Enabled := aEnabled;
    end;

    VIDMOVE_SPISANIE:
      lcbFinSource.Enabled := aEnabled and (dmMain.ConfigParams.GetParamValue('FUNC_USE_FIN_SOURCE_IN_SPIS_PO_PRICHINE', 0) = 1);

    VIDMOVE_NAKL_TREB:
      lcbFinSource.Enabled := aEnabled and (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1)and(dmMain.ConfigParams.GetParamValue('FUNC_REQUIRE_FINSOURCE_IN_TREB', 0) = 1);

    VIDMOVE_VVOD_OST:
      lcbFinSource.Enabled := aEnabled and (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1);
      
    VIDMOVE_RETURN_POSTAV:
      lcbFinSource.Enabled := aEnabled and (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1);
  end;

  lcbPayCond.Enabled := aEnabled;
  lcbSchetFaktura.Enabled := aEnabled;
end;

procedure TfrmMoveEdit.EnableActions( aEnabled : Boolean );
begin
  acins.Enabled            := aEnabled;
  acAddByTrebDPC.Enabled   := aEnabled;
  acedit.Enabled           := aEnabled;
  acdel.Enabled            := aEnabled;
  acenter.Enabled          := aEnabled;

  tbuAutoFill.Enabled      := aEnabled and (FViewNum = VIDMOVE_NAKL_TREB);
  tbuAutoFillPlan.Enabled := tbuAutoFill.Enabled;

//  cxGridRashKartDBTableView1FN_KOL.Options.Editing := aEnabled;
  SetAcDelEnable();// Added by A.Nakorjakov 18.12.2007
end;

procedure TfrmMoveEdit.SetIsShowTreb(const Value: Boolean);
begin
  FIsShowTreb := Value;
  if FIsShowTreb then
  begin
    cxGridRashKartDBTableView1.PopupMenu := pmCorrectTrebLink;  
    odsZatrebovano.AfterScroll := nil;
    odsZatrebovano.Close;
    odsZatrebovano.SetVariable('adpid', idDocs);
    _dmMoveEdit.oqCheckNaznByDoc.SetVariable('DPID', idDocs);
    _dmMoveEdit.oqCheckNaznByDoc.Execute;

    if _dmMoveEdit.oqCheckNaznByDoc.GetVariable('IsTrebByNaz') = 1 then
    begin // проверка документа на назначения - если он по назначениям, то меняем поведение
      odsZatrebovano.SQL.Text := StringReplace( odsZatrebovano.SQL.Text, '--NAZN', '',[rfReplaceAll]);
      paNazn.Show;
    end;

    odsZatrebovano.Open;
    odsZatrebovano.AfterScroll := odsZatrebovanoAfterScroll;    
  end
  else
    odsZatrebovano.Close;

  // показываем источник финансирования требования
  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE',           0) = 1)and
     (dmMain.ConfigParams.GetParamValue('FUNC_REQUIRE_FINSOURCE_IN_TREB', 0) = 1) then
  begin
    laFinSource.Show;
    lcbFinSource.Show;

    paDocHeader.Height := 179;
  end;

  grbTrebovanie.Visible := FIsShowTreb;
  Splitter1.Visible     := FIsShowTreb;
  if (FIsShowTreb = True) and (Height < 582) then Height := 582;  //чтобы было видно требование

  ToolButton6.Visible := FIsShowTreb;
//  acAutoFill.Visible  := FIsShowTreb;
  tbuAutoFill.Visible := FIsShowTreb;
  tbuAutoFillPlan.Visible := tbuAutoFill.Visible;
end;

procedure TfrmMoveEdit.SetidDocs(const Value: Integer);
begin
  FidDocs := Value;

  odsZatrebovano.Close; // выключаем датасет в любом случае
  if FIsShowTreb then   // а включаем только если нужно отображать требование
  begin
    odsZatrebovano.SetVariable('aDPID', FidDocs);
  end;

  odsKart.AfterScroll := nil;
  odsKart.Close;
  odsKart.SetVariable('aDPID', FidDocs);
  odsKart.Open;
  odsKart.AfterScroll := odsKartAfterScroll;
  odsKartAfterScroll( odsKart );
end;

procedure TfrmMoveEdit.DoMakeAutoFill(AFinSrcId : Integer = -1; AIsExecute : Boolean = True);
var
//  num : integer;
//  NeedKol, KolOst, Kol, SumKolOst, DPCID : Double;
//  sMess : string;
//  MedInfo:TArrayOfMedicInfo; // Added by A.Nakorjakov 28.12.2007 11:59:11
//  i:Integer; // Added by A.Nakorjakov 28.12.2007 12:02:30
//  ods:TOracleDataSet; // Added by A.Nakorjakov 28.12.2007 17:44:42
//  odsTrebOst_SQL_Text : string;
//  bUseComplexAutoFill : boolean;

  Quota_cod_otd : string;
  TrebDPCTbl, AutoFillPlan : TOracleObject;
begin
  if lcbMO_GROUP_TO.Text = '' then
  begin
    Application.MessageBox(PChar('Перед заполнением расхода по требованию необходимо'#13#10'указать для какой группы мат. отв. он составляется.'), 'Ошибка', MB_OK + MB_ICONERROR);
    lcbMO_GROUP_TO.SetFocus;
    lcbMO_GROUP_TO.DroppedDown := True;
    exit;
  end;

  { если создается ТОЛЬКО план автозаполнения, надо поставить сейвпоинт, чтобы корректно учитывались остатки для автозаполнения  }
  if (not AIsExecute) then
    dmMain.os.Savepoint( 'spAutoFillPlan' );

  try
    dmMain.PKGTREB.GET_TREB_DPC_LIST_TREBID ( FFK_Treb, TrebDPCTbl ); //Сохраняем отдельно в коллекцию, что было затребовано изначально

    // чистим позиции расхода
    _dmMoveEdit.oqKartClear.SetVariable('adpid', idDocs); // Проводки по позициям расхода из таблицы MED.TTEMP_OST удаляются в триггере TDPC_AFTER_DELETE
    _dmMoveEdit.oqKartClear.Execute;

    AutoFillPlan := nil;

    Quota_cod_otd := '';
    if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 1) and
       (lcbMO_GROUP_TO.Properties.ListSource.DataSet.Locate('FK_ID', lcbMO_GROUP_TO.EditValue, [])) then
      Quota_cod_otd := lcbMO_GROUP_TO.Properties.ListSource.DataSet.FieldByName('fc_quota_code_1').AsString;
    // получаем схему/план автозаполнения
    dmMain.PkgPrihRash.DO_AUTOFILL_PLAN(
      FFK_Treb,
      AFinSrcId,
      dmMain.ConfigParams.GetParamValue('FUNC_USE_COMPLEX_AUTOFILL', 0),
      Quota_cod_otd,
      AutoFillPlan );

    if not Assigned (AutoFillPlan) then
      Exit;

    if AIsExecute then
    begin
      dmMain.pkgprihrash.DO_AUTOFILL( idDocs, AutoFillPlan ); // само автозаполнение по заранее полученному плану

      odsKart.Close;
      odsKart.Open;
      odsZatrebovano.Refresh;
    end;

    if ( AIsExecute ) and
       ( Application.MessageBox ( PAnsiChar( 'Хотите просмотреть план автозаполнения?'), 'Информация', MB_YESNO + MB_ICONINFORMATION ) <> mrYes)  then
      Exit;
    // отображаем план автозаполнения в печатной форме
    dmPrintReports.PrintAutoFillPlan( TrebDPCTbl, AutoFillPlan, AFinSrcId, eNumDoc.Text, FormatDateTime ('DD.MM.YYYY', deInvoiceDate.Date),
      lcbMO_GROUP_FROM.Text, lcbMO_GROUP_TO.Text );
  finally
    if (not AIsExecute) then
      dmMain.os.RollbackToSavepoint ( 'spAutoFillPlan' );
    if Assigned(AutoFillPlan) then
      FreeAndNil(AutoFillPlan);
    if Assigned (TrebDPCTbl)  then
      FreeAndNil(TrebDPCTbl);
  end;

  {20.10.2014 Яковенко Д. Закомментировал этот кусок. Не нашел, каким образом автозаполнение вызывается НЕ из расхода по требованию
  bUseComplexAutoFill := ( dmMain.ConfigParams.GetParamValue('FUNC_USE_COMPLEX_AUTOFILL', 0) = 1 );
  num := 0;

  //Added by A.Nakorjakov 28-12-2007  started
  if IsCanShowPostGiven then //режим постовой м/ры и требования не показываются
  begin
    SetLength(MedInfo,odsKart.RecordCount);
    odsKart.First;
    for i := 0 to odsKart.RecordCount - 1 do
    begin
      MedInfo[i].ID := odsKart.FieldByName('medicid').AsInteger;
      MedInfo[i].Name := odsKart.FieldByName('NAMEKART').AsString;
      MedInfo[i].Kol := odsKart.FieldByName('FN_KOL').AsFloat;
      MedInfo[i].IsNew := False;
      MedInfo[i].Checked := 1;
      odsKart.Next;
    end;
    if GetPostGiven(@MedInfo) then
    begin
      _dmMoveEdit.oqKartClear.SetVariable('adpid', idDocs);
      _dmMoveEdit.oqKartClear.Execute;

      ods:=TOracleDataSet.Create(Self);
      try
        ods.Session := dmMain.os;
        ods.SQL.Text :=
         ' SELECT                   ' +sLineBreak +
         '     OST.KARTID,          ' +sLineBreak +
         '     OST.MEDICID,         ' +sLineBreak +
         '     OST.FN_FPACKINUPACK, ' +sLineBreak +
         '     OST.FN_PRICE,        ' +sLineBreak +
         '     OST.fn_kolost,       ' +sLineBreak +
         '     K.fd_goden,          ' +sLineBreak +
         '     NVL(M.FC_NAME,'''') as MEDIC_NAME ' +sLineBreak +
         ' from MED.VMEDKART_KOLOST OST, MED.TKART K, MED.TMEDIC M, ' +sLineBreak +
         '      ( select :pMedic as MEDICID from dual ' + sLineBreak +
         '    --FUNC_USE_COMPLEX_AUTOFILL '             + sLineBreak +
         '      ) tm' +sLineBreak +
         ' where OST.MEDICID = tm.MEDICID   ' +sLineBreak +
         '   AND OST.KARTID = K.kartid      ' +sLineBreak +
         '   AND OST.MEDICID = M.MEDICID(+) ' +sLineBreak +
         '   AND OST.FN_KOLOST > 0          ' +sLineBreak +
         '   AND OST.FN_OST_TYPE = 0        ' +sLineBreak + // только НЕ РЕЗЕРВ
         '   AND NVL(K.FL_BRAK,0) = 0     ' +sLineBreak + // только НЕ БРАК
         '   AND ((K.Fd_Goden is null)or(K.Fd_Goden >= sysdate)) ' +sLineBreak;

        if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 1) then
        begin
          lcbMO_GROUP_TO.Properties.ListSource.DataSet.Locate('FK_ID', lcbMO_GROUP_TO.EditValue, []);

          ods.SQL.Text := ods.SQL.Text + '   AND SUBSTR(K.FC_QUOTA_CODE,1,2) in (''00'', '''+lcbMO_GROUP_TO.Properties.ListSource.DataSet.FieldByName('fc_quota_code_1').AsString+''' )'+sLineBreak;
        end;

        if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1)and(dmMain.ConfigParams.GetParamValue('FUNC_USE_FIN_SOURCE_IN_AUTOFILL', 1) = 1) then
        begin
          ods.SQL.Text := ods.SQL.Text + '   AND (K.FK_FINSOURCE_ID = '+IntToStr(nvl(odsZatrebovano.FieldByName('fk_finsource_id').AsVariant, -1))+' )'+sLineBreak;
        end;

        if ( bUseComplexAutoFill ) then
          ods.SQL.Text := StringReplace( ods.SQL.Text, '--FUNC_USE_COMPLEX_AUTOFILL',
            ' union '  +sLineBreak +
            ' select m.MEDICID '  +sLineBreak +
            '   from med.TMEDIC m, '  +sLineBreak +
            '    med.TMEDIC s '  +sLineBreak +
            '  where s.MEDICID = :pMedic '  +sLineBreak +
            '    and m.FC_INTERNATIONAL_NAME = s.FC_INTERNATIONAL_NAME '  +sLineBreak +
            '    and m.FK_FPACKID = s.FK_FPACKID '  +sLineBreak +
            '    and m.FN_MASS = s.FN_MASS '  +sLineBreak +
            '    and m.FK_MASSUNITS = s.FK_MASSUNITS '
          , [rfReplaceAll] )
        else
          ods.SQL.Text := StringReplace( ods.SQL.Text, '--FUNC_USE_COMPLEX_AUTOFILL', '', [rfReplaceAll] );

        ods.SQL.Text := ods.SQL.Text +  ' ORDER BY K.fd_goden asc, K.FN_PARTY_NUM asc -- именно по возрастанию срока годности ';

        ods.DeclareVariable('pMedic',otInteger);

        for i:=0 to Length(MedInfo) - 1 do
        begin
          ods.Close;
          ods.SetVariable('pMedic',MedInfo[i].ID);
          ods.Open;
          NeedKol  := MedInfo[i].Kol; // кол-во затребованного препарата
          ods.First;
          KolOst   := ods.FieldByName('FN_KOLOST').AsFloat; // остаток по текущей партии
          while ((NeedKol > KolOst)and(not ods.Eof)) do
          begin
            dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
                                              KolOst,
                                              ods.fieldByName('fn_price').AsFloat,    //Этот параметр не используется
                                              ods.fieldByName('kartid').AsInteger,
                                              0, 3);
            NeedKol := NeedKol - KolOst;
            ods.Next;
            KolOst   := ods.FieldByName('FN_KOLOST').AsFloat; // остаток по текущей партии
          end; //while

          if ods.Eof then
          begin
            Inc( num ); // счетчик препаратов, остатков которых не хватило
            sMess := sMess + #13#10+IntToStr(num)+') ' + MedInfo[i].Name+' - '+FloatToStr(RoundTo(NeedKol,-4))+' '+MedInfo[i].EdIsmName;
          end
          else begin
            if NeedKol <= ods.FieldByName('FN_KOLOST').AsFloat then
            begin
              dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
                                                NeedKol,
                                                ods.fieldByName('fn_price').AsFloat,
                                                ods.fieldByName('kartid').AsInteger,
                                                0, 3);
            end;
          end; //if ods.eof else
        end; //i
      finally
        ods.Free;
      end; //try

      odsKart.Close;
      odsKart.Open;

      if (num > 0) then // если остатков каких-то препаратов не хватило, выводим список этих препаратов
      begin

        sMess := 'Для '+IntToStr(num)+' позиций препарата(ов) не хватило остатков'#13#10'с действующим сроком годности'+sMess;
        Application.MessageBox(PAnsiChar(sMess),'Внимание',MB_OK+MB_ICONWARNING);
      end;
    end;
  end; //if IsShowPacMedNaz Added by A.Nakorjakov 28122007
  }
end;

procedure TfrmMoveEdit.cxGridTrebDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  KOL_DIFF : Double; // разница между требуемым и выданным количеством препаратов
begin
  KOL_DIFF := AViewInfo.GridRecord.Values[ cxGridTrebDBTableView1FN_TREBKOL.Index] -   AViewInfo.GridRecord.Values[ cxGridTrebDBTableView1FN_KOL.Index];
  if KOL_DIFF = 0 then  ACanvas.Brush.Color := $D9FFD9  // выдано нужно количество - зеленый
  else
    if KOL_DIFF > 0 then ACanvas.Brush.Color := $D9D9FF // недодали - красный
    else
      {if KOL_DIFF < 0 then} ACanvas.Brush.Color := $FFD9D9; // дали больше - синий

  // красим строчки, согласно выбранному расходу
	if (FViewNum = VIDMOVE_NAKL_TREB)and(FDrawTrebDPC)and(odsKart.FieldByName('FK_TREBDPC').AsInteger = AViewInfo.GridRecord.Values[cxGridTrebDBTableView1FK_ID.Index]) then
	begin
		ACanvas.Font.Style := [fsBold];
	end;
end;

procedure TfrmMoveEdit.cxGridRashKartDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  // красим строчки, согласно выбранному требованию
	if (FViewNum = VIDMOVE_NAKL_TREB)and(FDrawDPC)and(odsZatrebovano.FieldByName('FK_ID').AsInteger = AViewInfo.GridRecord.Values[cxGridRashKartDBTableView1FK_TREBDPC.Index]) then
	begin
		ACanvas.Font.Style := [fsBold];
	end;
  
  if (dmMain.sDB_NAME = 'SK') then
  begin
    if trim(AnsiLowerCase(AViewInfo.GridRecord.DisplayTexts[cxGridRashKartDBTableView1FC_FINSOURCE.Index ])) = 'федеральный бюджет' then
    begin
      ACanvas.Brush.Color := $00FFAAAA;
    end;   
  end;
  
  if dmMain.ConfigParams.GetParamValue('FUNC_USE_CLASS', 0) = 1 then
  begin
    if AViewInfo.GridRecord.Values[ cxGridRashKartDBTableView1FC_CLASS.Index ] = '2а' then
      ACanvas.Brush.Color := $7fff00
    else if AViewInfo.GridRecord.Values[ cxGridRashKartDBTableView1FC_CLASS.Index ] = '2б' then
      ACanvas.Brush.Color := $03c03c
    else if AViewInfo.GridRecord.Values[ cxGridRashKartDBTableView1FC_CLASS.Index ] = '3' then
      ACanvas.Brush.Color := $3300ff;
  end;
end;

procedure TfrmMoveEdit.cxGridRashKartDBTableView1DblClick(Sender: TObject);
begin
  acedit.Execute;
end;

procedure TfrmMoveEdit.cxGridTrebDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);   
var
  i:Integer;
begin
  if AButton = mbRight then pmPrinttreb.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  
  if IsFormUpdateNow then Exit;
  try
    if not(odsZatrebovano.Active) then exit;
    if (odsZatrebovano.FindField('FK_ID')=nil) then Exit;
    IsFormUpdateNow := True;
    odsKart.Locate('FK_TREBDPC',Sender.DataController.Values[Sender.DataController.FocusedRecordIndex,
                                                                  cxGridTrebDBTableView1FK_ID.Index],[]);
    cxGridRashKartDBTableView1.DataController.ClearSelection;   //Требование
    for i:=0 to cxGridRashKartDBTableView1.DataController.RecordCount - 1 do
    begin
      if cxGridRashKartDBTableView1.DataController.Values[i,cxGridRashKartDBTableView1FK_TREBDPC.Index] =
         Sender.DataController.Values[Sender.DataController.FocusedRecordIndex,cxGridTrebDBTableView1FK_ID.Index] then
      begin
          cxGridRashKartDBTableView1.DataController.SelectRows(i,i);
      end;
    end;
  finally
    IsFormUpdateNow := False;
  end;
end;

procedure TfrmMoveEdit.miPrintToFRClick(Sender: TObject);
begin
  dmPrintReports.PrintSimlpeTreb( _dmMoveEdit.odsTTREB.FieldByName('FK_ID').AsInteger );
end;

procedure TfrmMoveEdit.lcbMO_TOClick(Sender: TObject);
begin
  if FViewNum = VIDMOVE_RETURN_POSTAV then  lcbMO_TO.Hint := 'Поставщик: '+ lcbMO_TO.Text;
end;

procedure TfrmMoveEdit.lcbMO_GROUP_TO1Click(Sender: TObject);
begin
  if FViewNum = VIDMOVE_RETURN_POSTAV then  lcbMO_GROUP_TO.Hint := 'Причина: '+ lcbMO_GROUP_TO.Text;
end;

procedure TfrmMoveEdit.miAutoFill_By_FinSourceClick(Sender: TObject);
begin
  if ( Sender.ClassNameIs ( 'TMenuItem') ) then
  begin
    if ( CompareText( ( Sender as TMenuItem ).Name, 'miAutoFill_By_FinSource' ) = 0 )  then
      tbuAutoFillClick(nil)
    else
    if ( CompareText( ( Sender as TMenuItem ).Name, 'miAutoFillPlan_By_FinSource' ) = 0 )  then
      tbuAutoFillPlanClick (nil);
  end;
end;

procedure TfrmMoveEdit.miAutoFill_not_by_FinSourceClick(Sender: TObject);
begin
  if ( Sender.ClassNameIs ( 'TMenuItem') ) then
  begin
    if ( CompareText( ( Sender as TMenuItem ).Name, 'miAutoFill_not_by_FinSource' ) = 0 )  then
      DoMakeAutoFill( -1, True )
    else
    if ( CompareText( ( Sender as TMenuItem ).Name, 'miAutoFillPlan_not_by_FinSource' ) = 0 )  then
      DoMakeAutoFill( -1, False );
  end;                            
end;

procedure TfrmMoveEdit.miCheckLinkClick(Sender: TObject);
begin
  if odsZatrebovano.Locate('FK_ID', odsKart.FieldByName('FK_TREBDPC').AsVariant, []) = False then
    dmMain.ShowBalloonHint('Привязка не установлена', 'ВНИМАНИЕ', self);
end;

procedure TfrmMoveEdit.miDelLinkClick(Sender: TObject);
begin
  UpdateFK_TREBDPC(odsKart.FieldByName('DPCID').AsVariant, -1);
  odsZatrebovano.RefreshRecord;
  odsKart.RefreshRecord;
end;

procedure TfrmMoveEdit.miLinkWithTrebClick(Sender: TObject);
var
  TREB_DPC_ID : Variant;
begin
  TREB_DPC_ID :=  odsKart.FieldByName('FK_TREBDPC').AsVariant;
  if ShowZatrebList(odsZatrebovano, TREB_DPC_ID, odsKart.FieldByName('MEDICID').AsVariant) = mrOk then
  begin
    UpdateFK_TREBDPC(odsKart.FieldByName('DPCID').AsVariant, TREB_DPC_ID);
    odsZatrebovano.RefreshRecord;
    odsKart.RefreshRecord;
  end;
end;

procedure TfrmMoveEdit.miPacStacClick(Sender: TObject);
begin
  pmPacTypeSelect.Tag := TMenuItem(Sender).Tag;
end;

procedure TfrmMoveEdit.miPrintToExcelClick(Sender: TObject);
begin
//  odsZatrebovano.DisableControls;
//  dmPrintReports.PrintFlag := 1;
//  try
//    frTreb.PrepareReport;
//    ExportFRToExcel( frTreb, 'Требование № '+eNumDoc.Text+' от ' +DateToStr(deInvoiceDate.Date)+'.xls' );
//  finally
//    dmPrintReports.PrintFlag := 0;
//    odsZatrebovano.EnableControls;
//  end;

end;

procedure TfrmMoveEdit.buTrebClick(Sender: TObject);
begin
  grbTrebovanie.Caption := ' Требование ';
  cxGridTrebDBTableView1NAMEKART.Visible   := True;
  cxGridTrebDBTableView1FN_TREBKOL.Visible := True;
  cxGridTrebDBTableView1FN_KOL.Visible     := True;
  cxGridTrebDBTableView1FC_EDIZM.Visible   := True;
  cxGridTrebDBTableView1FN_KOLOST.Visible  := True;

  cxGridTrebDBTableView1FC_NAZN_NAME.Visible   := False;
  cxGridTrebDBTableView1FN_NAZN_KOL_F.Visible  := False;
  cxGridTrebDBTableView1FC_NAZN_ED_IZM.Visible := False;

  buTreb.LookAndFeel.Kind := lfUltraFlat;
  buNazn.LookAndFeel.Kind := lfFlat;
  buTrebAndNazn.LookAndFeel.Kind := lfFlat;
end;

procedure TfrmMoveEdit.buGetAutoNumClick(Sender: TObject);
begin
  SetDocNum( True );
end;

procedure TfrmMoveEdit.buNaznClick(Sender: TObject);
begin
  grbTrebovanie.Caption := ' Назначение ';
  cxGridTrebDBTableView1NAMEKART.Visible   := False;
  cxGridTrebDBTableView1FN_TREBKOL.Visible := False;
  cxGridTrebDBTableView1FN_KOL.Visible     := False;
  cxGridTrebDBTableView1FC_EDIZM.Visible   := False;
  cxGridTrebDBTableView1FN_KOLOST.Visible  := False;

  cxGridTrebDBTableView1FC_NAZN_NAME.Visible   := True;
  cxGridTrebDBTableView1FN_NAZN_KOL_F.Visible  := True;
  cxGridTrebDBTableView1FC_NAZN_ED_IZM.Visible := True;

  buTreb.LookAndFeel.Kind := lfFlat;
  buNazn.LookAndFeel.Kind := lfUltraFlat;
  buTrebAndNazn.LookAndFeel.Kind := lfFlat;
end;

procedure TfrmMoveEdit.buTrebAndNaznClick(Sender: TObject);
begin
  grbTrebovanie.Caption := ' Требование и назначение ';
  cxGridTrebDBTableView1NAMEKART.Visible   := True;
  cxGridTrebDBTableView1FN_TREBKOL.Visible := True;
  cxGridTrebDBTableView1FN_KOL.Visible     := True;
  cxGridTrebDBTableView1FC_EDIZM.Visible   := True;
  cxGridTrebDBTableView1FN_KOLOST.Visible  := True;

  cxGridTrebDBTableView1FC_NAZN_NAME.Visible   := True;
  cxGridTrebDBTableView1FN_NAZN_KOL_F.Visible  := True;
  cxGridTrebDBTableView1FC_NAZN_ED_IZM.Visible := True;

  buTreb.LookAndFeel.Kind := lfFlat;
  buNazn.LookAndFeel.Kind := lfFlat;
  buTrebAndNazn.LookAndFeel.Kind := lfUltraFlat;
end;

{ Added by A.Nakorjakov 17.12.2007
started}
procedure TfrmMoveEdit.SetIsShowPacMedNaz(Value:Boolean);
begin
  FIsShowPacMedNaz := Value;
  gbPacMedNaz.Visible := FIsShowPacMedNaz;
  if not(Splitter1.Visible) then
    Splitter1.Visible   := FIsShowPacMedNaz;
  pnlOnPost.Visible := Value;
end;
{ Added by A.Nakorjakov 17.12.2007
finished}

{ Added by A.Nakorjakov 29.12.2007
started}
procedure TfrmMoveEdit.SetIsCanShowPostGiven(Value:Boolean);
begin
  FIsCanShowPostGiven := Value;
end;
{ Added by A.Nakorjakov 29.12.2007
finished}


{ Added by A.Nakorjakov 17.12.2007
started}
procedure TfrmMoveEdit.SetodsPacMedNazVariable();
var
   PrevNazMedLech:Integer;
begin
  if IsShowPacMedNaz then
  begin
    if IsHeadNurseMode then
    begin
//commented by A.Nakorjakov 26122007      odsPacMedNaz.SetVariable('PPACID',lcbMO_GROUP_TO.KeyValue);
      PrevNazMedLech := -1;
      if odsPacMedNaz.Active then
      begin
        PrevNazMedLech := odsPacMedNaz.FieldByName('FK_NazMedLech').AsInteger;
      end;
      odsPacMedNaz.SetVariable('PPACID',lcbMO_GROUP_TO.EditValue);
      odsPacMedNaz.SetVariable('PDATE',deInvoiceDate.Date);
      odsPacMedNaz.Close;
      odsPacMedNaz.Open;
      odsPacMedNaz.Locate('FK_NazMedLech',PrevNazMedLech,[]);

      // добавил Воронов О.А. - оповещение СМС о имеющихся несогласованных выдачах медикаментов  пациенту постовой медсестрой
      if not VarIsNull(lcbMO_GROUP_TO.EditValue) then
      begin
        with TfrmMedicWithoutLink.Create(nil) do
        begin
           try
             PacID := lcbMO_GROUP_TO.EditValue;
             IsFilterByDate := False;
             tmrOnPost.Enabled := (odsMedicWithoutLink.Active)and(odsMedicWithoutLink.RecordCount > 0);
             tmrOnPost.Tag := -1; // для корректного обновления вида индикации
             tmrOnPostTimer(nil);
           finally
             Free;
           end;
        end;
      end;
      //-----------------------------------
    end;
  end;
end;
{ Added by A.Nakorjakov 17.12.2007
finished}
//------------------------------------------------------------------------------
procedure TfrmMoveEdit.tmrOnPostTimer(Sender: TObject);
begin // индикация для СМС о имеющихся несогласованных выдачах медикаментов  пациенту постовой медсестрой
  lblOnPost.Font.Color := clBlack;
  tmrOnPost.Tag := tmrOnPost.Tag + 1;
  case tmrOnPost.Tag of
    0 :
    begin
      if tmrOnPost.Enabled then
        lblOnPost.Hint := 'На пациента были списаны медикаменты постовой медсестрой без согласования со СМС'
      else
        lblOnPost.Hint := '';
    end;

    1,3,5,7 : lblOnPost.Font.Color := clBlue;
    2,4,6,8 : lblOnPost.Font.Color := clRed;
    9 :
    begin
      tmrOnPost.Enabled := False;
      tmrOnPost.Tag := -1;
    end;
  end;
end;
//------------------------------------------------------------------------------
{ Added by A.Nakorjakov 17.12.2007
started}
procedure TfrmMoveEdit.tvPacMedNazCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if IsShowPacMedNaz then
  begin
    acins.Execute;
  end;
end;
{ Added by A.Nakorjakov 17.12.2007
finished}

{ Added by A.Nakorjakov 17.12.2007
started}
procedure TfrmMoveEdit.DoSootvetstvieToPac(AKol:Double;ADpcID:Integer; ANazMedLechId : Integer; AFasKol : Double);
begin
  if ANazMedLechId > 0 then
      SaveSootvetstvieToPac(ANazMedLechId,
                            dmMain.nSotrFK_ID, // так правильнее - не надо конвертить Воронов О.А. 19.06.2008
                            //dmMain.nSotrID,
                            dmMain.ConfigParams.GetParamValue('Medses_Give_Mode', 0),
                            AKol,
                            ADpcID,
                            AFasKol);

end;
{ Added by A.Nakorjakov 17.12.2007
finished}


{ Added by A.Nakorjakov 17.12.2007
started}
procedure TfrmMoveEdit.SaveSootvetstvieToPac(ANazMedLechID:Integer;
          ASotrFrom:Integer;AMode:Integer;AKol:Double;ADpcID:Integer; AFasKol : Double );
begin
  with TOracleQuery.Create(Self) do
  try
    try
      Session := dmMain.os;
      SQL.Text :=
        'declare' + #13#10 +
        '    vMEDICGIVEN number;' + #13#10 +
        '    vSOTRID     number;' + #13#10 +
        '    vNAZID      number;' + #13#10 +
        '    vNAZMARKID  number;' + #13#10 +
        'begin' + #13#10 +
        '    vSOTRID := :PSOTRFROM;' + #13#10 +
        '' + #13#10 +
        '    select NL.FK_NAZMEDID' + #13#10 +
        '      into vNAZID' + #13#10 +
        '      from ASU.TNAZMEDLECH NL' + #13#10 +
        '     where NL.FK_ID = :PNAZMEDLECH;' + #13#10 +
        '' + #13#10 +
        '    insert into ASU.TNAZMARK (FK_NAZID, FK_SOTRID, FL_NAZMARK, FK_NAZMEDLECHID, FD_POST)' + #13#10 +
        '    values (vNAZID, vSOTRID, 1, :PNAZMEDLECH, sysdate) returning FK_ID into vNAZMARKID;' + #13#10 ;

      if frmMain.ProvisorState <> 1  then // если списание на пациента делает провизор, то он не передает медикаменты на постовой медсестре
        SQL.Text := SQL.Text +
        '' + #13#10 +
        '    select MEDICID' + #13#10 +
        '      into vMEDICGIVEN' + #13#10 +
        '      from MED.TKART, MED.TDPC' + #13#10 +
        '     where TKART.KARTID = TDPC.KARTID' + #13#10 +
        '       and TDPC.DPCID = :PDPCID;' + #13#10 +
        '' + #13#10 +
        '    insert into ASU.TMEDICGIVEN (FK_NAZMARK, FK_NAZMEDLECHID, FK_MEDICGIVEN, FK_SOTRFROM, FP_MODE, FD_GIVEN, FN_KOL, FK_DPCID)' + #13#10 +
        '    values (vNAZMARKID, :PNAZMEDLECH, vMEDICGIVEN, vSOTRID, :PMODE, sysdate, :PKOL, :PDPCID);' + #13#10;

      SQL.Text := SQL.Text +
        '' + #13#10 +
        '    update MED.TDPC' + #13#10 +
        '       set FK_NAZMEDLECH_ID = :PNAZMEDLECH,' + #13#10 +
        '           FK_NAZMEDID = vNAZID,' + #13#10 +
        '           FK_NAZMARK_ID = vNAZMARKID,' + #13#10 +
        '           FN_FAS = :pFasKol' + #13#10 +
        '     where DPCID = :PDPCID;' + #13#10 +
        'end;';
      DeclareAndSet('pNazMedLech',otInteger,ANazMedLechID);
      DeclareAndSet('pSotrFrom',otInteger,ASotrFrom);
      DeclareAndSet('pDpcID',otInteger,ADpcID);
      DeclareAndSet('pFasKol',otFloat,AFasKol);
      if frmMain.ProvisorState <> 1 then
      begin
        DeclareAndSet('pMode',otInteger,AMode);
        DeclareAndSet('pKol',otFloat,AKol);
      end;
      Execute;
    except
      on e : Exception do
      begin
        Session.Rollback;
        Application.MessageBox( PAnsiChar( e.Message ), 'Ошибка', MB_OK + MB_ICONERROR );
        Exit;
      end;
    end;
  finally
    Free;
  end;
end;
{ Added by A.Nakorjakov 17.12.2007
finished}

{ Added by A.Nakorjakov 17.12.2007
started}
procedure TfrmMoveEdit.SetDateToSootvetstvie(); // Added by A.Nakorjakov 17.12.2007 18:05:52
var
  i:Integer;
begin
  if (IsShowPacMedNaz) and (odsPacMedNaz.Active) and (odsKart.FindField('fk_nazmedlechid')<>nil) then
  begin
    //Проставляем дату выдачи медикамента старшей медсетрой постовой медсестре
    with TOracleQuery.Create(Self) do
    begin
      try
        Session := dmMain.os;
        SQL.Text :=
          'declare' +sLineBreak+
          '  Cnt Number;' +sLineBreak+
          '  NazMark Number;'+sLineBreak+
          '  SotrTo Number;'+sLineBreak+
          'begin'+sLineBreak+ // для TNAZMARK и tmedicgiven задействованы синонимы
            ' SELECT count(1), max(tt.fk_id) into Cnt, NazMark FROM TNAZMARK TT WHERE TT.FK_NAZMEDLECHID = :pNazMedLechID AND ' +sLineBreak+
            '  trunc(TT.FD_POST,''DD'')=trunc(:pDateGiven,''DD'') ' +sLineBreak+
            '  and not exists ' +sLineBreak+
            '  (select 1 from tmedicgiven m where m.fk_nazmark = tt.fk_id); ' +sLineBreak+
            ' update asu.tmedicgiven set fd_given = :pDateGiven where fk_dpcid = :pDpcID and fk_nazmedlechid = :pNazMedLechID;'+sLineBreak+
            ' if Cnt > 0 then' +sLineBreak+
               ' select max(t.fk_sotrid) into SotrTo from tnazmark t where t.fk_id = NazMark;'+sLineBreak+
               ' update tmedicgiven set fk_nazmark = NazMark, fk_sotrto = SotrTo where fk_dpcid = :pDpcID and fk_nazmedlechid = :pNazMedLechID;'+sLineBreak+
            ' end if;'+sLineBreak+
          'end;';
        DeclareAndSet('pDateGiven',otDate,{TRUNC(}Self.deInvoiceDate.date{) + FRAC(frmMoveEdit.deRegistrTime.Time)});
        DeclareVariable('pDpcID',otInteger);
        DeclareVariable('pNazMedLechID',otInteger);
        odsKart.First;
        for i:=0 to odsKart.RecordCount-1 do
        begin
          //Проверка на наличие соответствия
          if odsKart.FieldByName('fk_nazmedlechid').AsVariant <> null then
          begin //Если соответствия едля записи есть, то вносим дату соответсвтия
            SetVariable('pDpcID',odsKart.FieldByName('DPCID').AsInteger);
            SetVariable('pNazMedLechID',odsKart.FieldByName('fk_nazmedlechid').AsInteger);
            Execute;
          end; //odsKart.FieldByName('fk_nazmedlechid').AsVariant <> null
          odsKart.Next;
        end; //for i
      finally
        Free;
      end; //try
    end; //TOracleQuery.Create(Self)
  end; //(IsShowPacMedNaz) and (odsPacMedNaz.Active) and (odsKart.FindField('fk_nazmedlechid')<>nil)
end;
function TfrmMoveEdit.SetDocNum(aShowMessages : boolean = True): integer;
begin
  // определеяем правила нумерации для документа
  deRegisterDate.PostEditValue;
  dmMain.odsDOCS_AUTONUM_COUNTER.Close;
  dmMain.odsDOCS_AUTONUM_COUNTER.SetVariable('FP_DOC_VIDMOVE', FViewNum);
  dmMain.odsDOCS_AUTONUM_COUNTER.SetVariable('FD_DOC_DATE', deRegisterDate.EditValue);    
  dmMain.odsDOCS_AUTONUM_COUNTER.SetVariable('fk_mogroup_id', dmMain.FK_CurMO_GROUP);
  dmMain.odsDOCS_AUTONUM_COUNTER.Open;

  dmMain.odsDOCS_AUTONUM_COUNTER.Filtered := False;
  dmMain.odsDOCS_AUTONUM_COUNTER.Filter := 'fl_enabled = 1';
  dmMain.odsDOCS_AUTONUM_COUNTER.Filtered := True;

  if (dmMain.odsDOCS_AUTONUM_COUNTER.RecordCount > 0) then
  begin
    if (dmMain.odsDOCS_AUTONUM_COUNTER.FieldByName('fn_type_autonum').IsNull = False)and(dmMain.odsDOCS_AUTONUM_COUNTER.FieldByName('fl_enabled').AsInteger = 1) then
    begin
      case dmMain.odsDOCS_AUTONUM_COUNTER.FieldByName('fn_type_autonum').AsInteger of
//        0 : ;  // без автонумерации
        1 : eNumDoc.Text := IntToStr(idDocs); // по коду документа
        2 : // сплошная автонумерация
        begin
          // проверяем на дырки
          dmMain.odsCheckAutonum.Close;
          //dmMain.odsCheckAutonum.SetVariable('FP_VIDMOVE',   FViewNum);   
          dmMain.odsCheckAutonum.SetVariable('PCOUNTERID',   dmMain.odsDOCS_AUTONUM_COUNTER.FieldByName('FK_ID').AsInteger);
          dmMain.odsCheckAutonum.SetVariable('FN_STARTNUM',  dmMain.odsDOCS_AUTONUM_COUNTER.FieldByName('fn_startnum').AsVariant);
          dmMain.odsCheckAutonum.SetVariable('FN_CURNUM',    dmMain.odsDOCS_AUTONUM_COUNTER.FieldByName('fn_curnum').AsVariant);
          dmMain.odsCheckAutonum.SetVariable('FD_STARTDATE', dmMain.odsDOCS_AUTONUM_COUNTER.FieldByName('fd_start').AsVariant); 
          dmMain.odsCheckAutonum.SetVariable('fk_mogroup_id', '');
          dmMain.odsCheckAutonum.Open;

          if dmMain.odsCheckAutonum.RecordCount > 0 then
          begin  // дырки есть
            if aShowMessages then
              Application.MessageBox('Имеются пропуски в нумерации.'#13#10'В качестве номера будет взят первый пропуск.', 'Внимание', MB_OK);
            eNumDoc.Text := dmMain.odsCheckAutonum.FieldByName('num').AsString;
          end
          else
          begin  // дырок нет
            repeat
              // используем номер из счетчика
              eNumDoc.Text := dmMain.odsDOCS_AUTONUM_COUNTER.FieldByName('fn_curnum').AsString;

              // для других документов накручиваем счетчик
              dmMain.oqUpdateAutoNumCounter.SetVariable('ACOUNTERID', dmMain.odsDOCS_AUTONUM_COUNTER.FieldByName('FK_ID').AsVariant);
              dmMain.oqUpdateAutoNumCounter.SetVariable('ANUM', dmMain.odsDOCS_AUTONUM_COUNTER.FieldByName('fn_curnum').AsInteger + 1);
              dmMain.oqUpdateAutoNumCounter.Execute;

              dmMain.odsDOCS_AUTONUM_COUNTER.RefreshRecord;

              dmMain.odsCheckAutonum.Close;
              dmMain.odsCheckAutonum.SetVariable('FN_STARTNUM',  eNumDoc.Text);
              dmMain.odsCheckAutonum.SetVariable('FN_CURNUM',    eNumDoc.Text);
              dmMain.odsCheckAutonum.Open;              
            until dmMain.odsCheckAutonum.RecordCount > 0;
          end;
        end;

        3 : // сплошная автонумерация по отделению
        begin 
          // проверяем на дырки
          dmMain.odsCheckAutonum.Close;
          //dmMain.odsCheckAutonum.SetVariable('FP_VIDMOVE',   FViewNum);   
          dmMain.odsCheckAutonum.SetVariable('PCOUNTERID',   dmMain.odsDOCS_AUTONUM_COUNTER.FieldByName('FK_ID').AsInteger);
          dmMain.odsCheckAutonum.SetVariable('FN_STARTNUM',  dmMain.odsDOCS_AUTONUM_COUNTER.FieldByName('fn_startnum').AsVariant);
          dmMain.odsCheckAutonum.SetVariable('FN_CURNUM',    dmMain.odsDOCS_AUTONUM_COUNTER.FieldByName('fn_curnum').AsVariant);
          dmMain.odsCheckAutonum.SetVariable('FD_STARTDATE', dmMain.odsDOCS_AUTONUM_COUNTER.FieldByName('fd_start').AsVariant);
          if FVidNum = 1 then
            dmMain.odsCheckAutonum.SetVariable('fk_mogroup_id', 'and d.fk_mogroupid_to = ' + IntToStr(dmMain.FK_CurMO_GROUP))
          else
            dmMain.odsCheckAutonum.SetVariable('fk_mogroup_id', 'and d.fk_mogroupid_from = ' + IntToStr(dmMain.FK_CurMO_GROUP));
          dmMain.odsCheckAutonum.Open;

          if dmMain.odsCheckAutonum.RecordCount > 0 then
          begin  // дырки есть
            if aShowMessages then
              Application.MessageBox('Имеются пропуски в нумерации.'#13#10'В качестве номера будет взят первый пропуск.', 'Внимание', MB_OK);
            eNumDoc.Text := dmMain.odsCheckAutonum.FieldByName('num').AsString;
          end
          else
          begin  // дырок нет
            repeat
              // используем номер из счетчика
              eNumDoc.Text := dmMain.odsDOCS_AUTONUM_COUNTER.FieldByName('fn_curnum').AsString;

              // для других документов накручиваем счетчик
              dmMain.oqUpdateAutoNumCounter.SetVariable('ACOUNTERID', dmMain.odsDOCS_AUTONUM_COUNTER.FieldByName('FK_ID').AsVariant);
              dmMain.oqUpdateAutoNumCounter.SetVariable('ANUM', dmMain.odsDOCS_AUTONUM_COUNTER.FieldByName('fn_curnum').AsInteger + 1);
              dmMain.oqUpdateAutoNumCounter.Execute;

              dmMain.odsDOCS_AUTONUM_COUNTER.RefreshRecord;

              dmMain.odsCheckAutonum.Close;
              dmMain.odsCheckAutonum.SetVariable('FN_STARTNUM',  eNumDoc.Text);
              dmMain.odsCheckAutonum.SetVariable('FN_CURNUM',    eNumDoc.Text);
              dmMain.odsCheckAutonum.Open;              
            until dmMain.odsCheckAutonum.RecordCount > 0;
          end;

        end;
      end;

      eNumDoc.Enabled := eNumDoc.Enabled and ((dmMain.ConfigParams.GetParamValue('FUNC_BLOCK_DOCNUM_WITH_AUTONUM', 0) = 0) //Запрет изменения
                                              or dmMain.ConfigParams.GetParamValue('FUNC_UNBLOCK_DOCNUM_WITH_AUTONUM', False)) //Доступ по праву
    end;
  end;

  dmMain.odsDOCS_AUTONUM_COUNTER.Close;

  dmMain.odsDOCS_AUTONUM_COUNTER.Filtered := False;
  dmMain.odsDOCS_AUTONUM_COUNTER.Filter := '';

  // обязательно сохраняем проставленный номер
  dmMain.oqSaveDoc_Date_Num.SetVariable('DPID',    idDocs);
  dmMain.oqSaveDoc_Date_Num.SetVariable('FD_DATA', deRegisterDate.EditValue);
  dmMain.oqSaveDoc_Date_Num.SetVariable('FC_DOC',  eNumDoc.Text);
  dmMain.oqSaveDoc_Date_Num.Execute;
  result := 0;
end;

{ Added by A.Nakorjakov 17.12.2007
finished}

{ Added by A.Nakorjakov 18.12.2007
started}

procedure TfrmMoveEdit.DoEditSootvetstvieKol(AKol:Double;ADpcID:Integer; AFasKol : Double);
begin
  with TOracleQuery.Create(Self) do
  try
    try
      Session := dmMain.os;
      SQL.Text :=
        'begin'+sLineBreak+
            'update asu.tmedicgiven set FN_KOL = :pKol where FK_DPCID = :pDpcID;' +sLineBreak+
            'update med.tdpc set fn_fas = :pFasKol where dpcid = :pDpcID;' +sLineBreak+
        'end;';
      DeclareAndSet('pKol',otFloat,AKol);
      DeclareAndSet('pFasKol',otFloat,AFasKol);
      DeclareAndSet('pDpcID',otInteger,ADpcID);
      Execute;
    except
      on e: Exception do
      begin
        Session.Rollback;
        Application.ShowException( e );
      end;
    end;
  finally
    Free;
  end;


end;
{ Added by A.Nakorjakov 18.12.2007
finished}

{ Added by A.Nakorjakov 18.12.2007
started}
procedure TfrmMoveEdit.DeleteSootvetstvie( ADpcID : Integer; ANazMarkId : integer );
begin
  //if (IsShowPacMedNaz) then
  if ( ADpcID > 0 ) and ( ANazMarkId > 0 ) then
  with TOracleQuery.Create(Self) do
  try
    try
      Session := dmMain.os;
      SQL.Text :=
        'begin' + #13#10 +
        '  delete from asu.TMEDICGIVEN where fk_dpcid = :PFK_DPC_ID;' + #13#10 +
        '  ASU.PKG_LOG.Do_log(''asu.tmedicgiven'', ''fk_dpcid '', ''DELETE'', TO_CHAR(:PFK_DPC_ID), '''', :pFK_SOTR_ID);' + #13#10 +
        '' + #13#10 +
        '  delete from asu.tnazmark where FK_ID = :PFK_NAZMARK_ID;' + #13#10 +
        '  ASU.PKG_LOG.Do_log(''asu.tnazmark'', ''FK_ID'', ''DELETE'', TO_CHAR(:PFK_NAZMARK_ID), '''', :pFK_SOTR_ID);' + #13#10 +
        'end;';
      DeclareAndSet('PFK_DPC_ID',otInteger,ADpcID);
      DeclareAndSet('PFK_NAZMARK_ID',otInteger,ANazMarkId);
      DeclareAndSet('pFK_SOTR_ID',otInteger, dmMain.nSotrFK_ID );
      Execute;
    except
      on e : Exception do
      begin
        Session.Rollback;
        Application.MessageBox( PAnsiChar ( e.Message ), 'Ошибка', MB_OK + MB_ICONERROR );
      end;
    end;
  finally
    Free;
  end;                                                                                          
end;
{ Added by A.Nakorjakov 18.12.2007
finished}


{Added by A.Nakorjakov 18.12.2007 10:51:41
started}
procedure TfrmMoveEdit.SetAcDelEnable();
begin
  if not(odsKart.Active) then Exit;
  if (IsShowPacMedNaz) and (odsKart.FindField('fk_nazmark')<>nil) then
  begin
    //если есть связка с медикаментозным назначением врача
    if odsKart.FieldByName('fk_nazmark').AsVariant <> null then
    begin
      acdel.Enabled := False; //Постовая медсестра уже выдала этот медикамент пациенту
    end;
  end;
end;
{Added by A.Nakorjakov 18.12.2007 10:51:41
finished}

{Added by A.Nakorjakov 18.12.2007 10:51:41
started}
procedure TfrmMoveEdit.cxGridRashKartDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
  i:Integer;
begin
  if (IsShowPacMedNaz) then
  begin
    if AFocusedRecord=nil then Exit;
    if IsFormUpdateNow then Exit;
    try
      if not(odsPacMedNaz.Active) then exit;
      IsFormUpdateNow := True;
      odsPacMedNaz.Locate('FK_NazMedLech',AFocusedRecord.Values[cxGridRashKartMedLechID.Index],[]);
      tvPacMedNaz.DataController.ClearSelection;
      for i:=0 to tvPacMedNaz.DataController.RecordCount - 1 do
      begin
        if tvPacMedNaz.DataController.Values[i,tvPacMedNazColLech.Index] = AFocusedRecord.Values[cxGridRashKartMedLechID.Index] then
        begin
          tvPacMedNaz.DataController.SelectRows(i,i);
        end;
      end;
    finally
      IsFormUpdateNow := False;
    end;
  end;  
  if IsShowTreb then
  begin
    if IsFormUpdateNow then Exit;
    try
      if not(odsKart.Active) then exit;
      if (odsKart.FindField('FK_TREBDPC')=nil) then Exit;
      IsFormUpdateNow := True;
      odsZatrebovano.Locate('FK_ID',Sender.DataController.Values[Sender.DataController.FocusedRecordIndex,
                                                                    cxGridRashKartDBTableView1FK_TREBDPC.Index],[]);
      cxGridTrebDBTableView1.DataController.ClearSelection;   //Требование
      for i:=0 to cxGridTrebDBTableView1.DataController.RecordCount - 1 do
      begin
        if cxGridTrebDBTableView1.DataController.Values[i,cxGridTrebDBTableView1FK_ID.Index] =
           Sender.DataController.Values[Sender.DataController.FocusedRecordIndex,cxGridRashKartDBTableView1FK_TREBDPC.Index] then
        begin
            cxGridTrebDBTableView1.DataController.SelectRows(i,i);
        end;
      end;
    finally
      IsFormUpdateNow := False;
    end;
  end;
end;
{Added by A.Nakorjakov 18.12.2007 10:51:41
finished}

{Added by A.Nakorjakov 18.12.2007
started}
procedure TfrmMoveEdit.tvPacMedNazFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
  i:Integer;
begin
  if (IsShowPacMedNaz) then
  begin
    if AFocusedRecord=nil then Exit;
    if IsFormUpdateNow then Exit;
    try
      if not(odsKart.Active) then exit;
      if (odsKart.FindField('fk_nazmedlechid')=nil) then Exit;
      IsFormUpdateNow := True;
      odsKart.Locate('fk_nazmedlechid',AFocusedRecord.Values[tvPacMedNazColLech.Index],[]);
      cxGridRashKartDBTableView1.DataController.ClearSelection;
      for i:=0 to cxGridRashKartDBTableView1.DataController.RecordCount - 1 do
      begin
        if cxGridRashKartDBTableView1.DataController.Values[i,cxGridRashKartMedLechID.Index] = AFocusedRecord.Values[tvPacMedNazColLech.Index] then
        begin
          cxGridRashKartDBTableView1.DataController.SelectRows(i,i);
        end;
      end;
    finally
      IsFormUpdateNow := False;
    end;
  end;
end;
{Added by A.Nakorjakov 18.12.2007
finished}

{Added by A.Nakorjakov 18.12.2007
started}
procedure TfrmMoveEdit.tvPacMedNazCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  i:Integer;
begin
  if (IsShowPacMedNaz) then
  begin
    if IsFormUpdateNow then Exit;
    try
      if not(odsKart.Active) then exit;
      if (odsKart.FindField('fk_nazmedlechid')=nil) then Exit;
      IsFormUpdateNow := True;
      odsKart.Locate('fk_nazmedlechid',Sender.DataController.Values[Sender.DataController.FocusedRecordIndex,
                                                                    tvPacMedNazColLech.Index],[]);
      cxGridRashKartDBTableView1.DataController.ClearSelection;
      for i:=0 to cxGridRashKartDBTableView1.DataController.RecordCount - 1 do
      begin
        if cxGridRashKartDBTableView1.DataController.Values[i,cxGridRashKartMedLechID.Index] =
           Sender.DataController.Values[Sender.DataController.FocusedRecordIndex,tvPacMedNazColLech.Index] then
        begin
          cxGridRashKartDBTableView1.DataController.SelectRows(i,i);
        end;
      end;
    finally
      IsFormUpdateNow := False;
    end;
  end;
end;
{Added by A.Nakorjakov 18.12.2007
finished}

{Added by A.Nakorjakov 18.12.2007
started}
procedure TfrmMoveEdit.cxGridRashKartDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  i:Integer;
begin
  if (IsShowPacMedNaz) then
  begin
    if IsFormUpdateNow then Exit;
    try
      if not(odsKart.Active) then exit;
      if (odsKart.FindField('fk_nazmedlechid')=nil) then Exit;
      IsFormUpdateNow := True;
      odsPacMedNaz.Locate('FK_NazMedLech',Sender.DataController.Values[Sender.DataController.FocusedRecordIndex,
                                                                    cxGridRashKartMedLechID.Index],[]);
      tvPacMedNaz.DataController.ClearSelection;
      for i:=0 to tvPacMedNaz.DataController.RecordCount - 1 do
      begin
        if tvPacMedNaz.DataController.Values[i,tvPacMedNazColLech.Index] =
           Sender.DataController.Values[Sender.DataController.FocusedRecordIndex,cxGridRashKartMedLechID.Index] then
        begin
            tvPacMedNaz.DataController.SelectRows(i,i);
        end;
      end;
    finally
      IsFormUpdateNow := False;
    end;
  end;
  if IsShowTreb then
  begin
    if IsFormUpdateNow then Exit;
    try
      if not(odsKart.Active) then exit;
      if (odsKart.FindField('FK_TREBDPC')=nil) then Exit;
      IsFormUpdateNow := True;
      odsZatrebovano.Locate('FK_ID',Sender.DataController.Values[Sender.DataController.FocusedRecordIndex,
                                                                    cxGridRashKartDBTableView1FK_TREBDPC.Index],[]);
      cxGridTrebDBTableView1.DataController.ClearSelection;   //Требование
      for i:=0 to cxGridTrebDBTableView1.DataController.RecordCount - 1 do
      begin
        if cxGridTrebDBTableView1.DataController.Values[i,cxGridTrebDBTableView1FK_ID.Index] =
           Sender.DataController.Values[Sender.DataController.FocusedRecordIndex,cxGridRashKartDBTableView1FK_TREBDPC.Index] then
        begin
            cxGridTrebDBTableView1.DataController.SelectRows(i,i);
        end;
      end;
    finally
      IsFormUpdateNow := False;
    end;
  end;
end;
{Added by A.Nakorjakov 18.12.2007
finished}

{Added by A.Nakorjakov 18.12.2007
started}
procedure TfrmMoveEdit.alActionsUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  if IsShowPacMedNaz then
  begin
    lcbMO_GROUP_TO.Enabled := (odsKart.RecordCount = 0);
    lcbMO_TO.Enabled       := (odsKart.RecordCount = 0);    
    if odsPacMedNaz.Active then
    begin
      acins.Enabled := odsPacMedNaz.RecordCount > 0;
    end
    else begin
      acins.Enabled := False;
      acSelectVidSpasanie.Enabled := True;
    end;
    if odsKart.Active then
    begin
      acSelectVidSpasanie.Enabled := not(odsKart.RecordCount > 0) and (dmMain.ConfigParams.GetParamValue('Func_Set', 0) = FUNC_SET_MID);
      bbuSelectVidSpasanie.Enabled := acSelectVidSpasanie.Enabled;
//      acSelectVidSpasanie.Enabled := False;
//      bbuSelectVidSpasanie.Enabled := False;
//      if odsKart.RecordCount = 0 then
//      begin
//        acedit.Enabled := (frmMain.Func_Set = FUNC_SET_MID);
//        acdel.Enabled := (frmMain.Func_Set = FUNC_SET_MID);
//      end;
    end
    else begin
      acSelectVidSpasanie.Enabled := False;
      bbuSelectVidSpasanie.Enabled := False;
      acedit.Enabled := False;
      acdel.Enabled := False;
    end;
    IspnlOnPostEnable := (lcbMO_GROUP_TO.EditValue<>null) and (lcbMO_GROUP_TO.EditValue>0);

  end
  else begin
    IspnlOnPostEnable := False;
  end;
//  if IsCanShowPostGiven then  // !!!! разобраться че это за хуйня Воронов О.А. 21.06.2008
//  begin
//    acAutoFill.Visible  :=  True and (FViewNum = VIDMOVE_NAKL_TREB); //  and (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 0);
//    acAutoFill.Enabled  :=  acAutoFill.Visible;
//  end;

  acLoadFromTemplate.Enabled := acenter.Enabled;

  // добавить расход по назначению : Списания на пациента провизорами аптеки(а не медсестрами) аналогично как в aMedSes
  acAddByPacNazn.Visible := (FViewNum = VIDMOVE_SPISANIE)and(SpisanieVid = SPISANIE_VID_PACIENT) and (bCanEdit)
    and ( frmMain.ProvisorState = 1 ) and (dmMain.ConfigParams.GetParamValue('FUNC_SPIS_ON_PAC_BY_PROVIZOR', 0) = 1) ;
end;
{Added by A.Nakorjakov 18.12.2007
finished}

{Added by A.Nakorjakov 26.12.2007
started}
procedure TfrmMoveEdit.lcbMO_GROUP_TOPropertiesEditValueChanged(
  Sender: TObject);
begin
  if IsShowPacMedNaz then
  begin
    SetodsPacMedNazVariable();
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_FIN_SOURCE_IN_SPIS_BY_PAC', 0) = 1)and(SpisanieVid = SPISANIE_VID_PACIENT) then
  begin
    if _dmMoveEdit.odsMO_GroupTo.Locate('FK_ID', lcbMO_GROUP_TO.EditValue, []) then
      lcbFinSource.EditValue := _dmMoveEdit.odsMO_GroupTo.FieldByName('FK_typedoc_ID').AsVariant;
  end;
end;

procedure TfrmMoveEdit.lcbMO_GROUP_TOPropertiesInitPopup(Sender: TObject);
var
  nPacID : integer;
  FHandle : THandle;
  DLL_FOUNDPAC_SHOW : function (Panel_HND, App_HND: THandle; nPacID, nSotrID, nSpecID, nSecID, nSmidID: integer): LongInt; stdcall;

begin
  // обрабатывается здесь, а не в lcbMO_GROUP_TOPropertiesPopup потому, что когда список пустой, popup не происходит  
  if (FViewNum = VIDMOVE_SPISANIE)and(SpisanieVid = SPISANIE_VID_PACIENT)and(dmMain.ConfigParams.GetParamValue('FUNC_SPIS_PAC_BY_FOUNDPAC', 0) = True) then
  begin
    FHandle := LoadLibrary('FoundPac.dll');
    DLL_FOUNDPAC_SHOW := nil;
    try
      if FHandle <> 0 then
        DLL_FOUNDPAC_SHOW := GetProcAddress(FHandle,'InitPlugin');
       nPacID := DLL_FOUNDPAC_SHOW( 0, Application.Handle, pmPacTypeSelect.Tag, dmMain.nSotrID, 0, 0, 0);

       if nPacID > 0 then
       begin
         _dmMoveEdit.odsMO_GroupTo.Close;
         _dmMoveEdit.odsMO_GroupTo.SetVariable('pac_id', nPacID);
         _dmMoveEdit.odsMO_GroupTo.Open;

         lcbMO_GROUP_TO.EditValue := nPacID;
         lcbMO_GROUP_TO.DroppedDown := False;

         mComment.Text := _dmMoveEdit.odsMO_GroupTo.FieldByName('fc_name').AsString;
       end;
    finally
      FreeLibrary( FHandle );
    end;
  end;
end;

procedure TfrmMoveEdit.lcbMO_GROUP_TOPropertiesPopup(Sender: TObject);
begin
  if (FViewNum = VIDMOVE_SPISANIE)and(SpisanieVid = SPISANIE_VID_PACIENT)and(dmMain.ConfigParams.GetParamValue('FUNC_SPIS_PAC_BY_FOUNDPAC', 0) = 1) then
  begin // закрываем попап чтоб не мешался
    lcbMO_GROUP_TO.DroppedDown := False;
  end;
end;

{Added by A.Nakorjakov 26.12.2007
finished}

{Added by A.Nakorjakov 29.12.2007
started}
procedure TfrmMoveEdit.lblOnPostMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if IsShowPacMedNaz and (IspnlOnPostEnable) then
  begin
    pnlOnPost.BevelInner := bvLowered;
    pnlOnPost.BevelOuter := bvLowered;
    lblOnPost.Left := lblOnPost.Left + 2;
  end;
end;

procedure TfrmMoveEdit.lblOnPostMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ADate:TDateTime;
begin
  if IsShowPacMedNaz and (IspnlOnPostEnable) then
  begin
    pnlOnPost.BevelInner := bvRaised;
    pnlOnPost.BevelOuter := bvRaised;
    lblOnPost.Left := lblOnPost.Left - 2;

    if GetLinkDate(ADate,lcbMO_GROUP_TO.EditValue) then
    begin
      deInvoiceDate.Date := DateOf(ADate);
    end;
  end;
end;
{Added by A.Nakorjakov 29.12.2007
finished}

{Added by A.Nakorjakov 10.01.2008
started}
procedure TfrmMoveEdit.SetIspnlOnPostEnable(Value:Boolean);
begin
  FIspnlOnPostEnable := Value;
  pnlOnPost.Enabled := FIspnlOnPostEnable;
  lblOnPost.Enabled := FIspnlOnPostEnable;
end;
{Added by A.Nakorjakov 10.01.2008
finished}

{Added by A.Nakorjakov 10.01.2008
started}
procedure TfrmMoveEdit.deInvoiceDatePropertiesEditValueChanged(Sender: TObject);
begin
  SetodsPacMedNazVariable();
end;
{Added by A.Nakorjakov 10.01.2008
finished}

{Added by A.Nakorjakov 10.01.2008
started}
procedure TfrmMoveEdit.tvPacMedNazCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if IsShowPacMedNaz then
  begin
    if (AViewInfo.GridRecord.Values[tvPacMedNazWasGivenAtDate.Index] > 0 )  then
    begin
      //Если препарат был выдан датой deInvoiceDate.Date, то подсвечиваем строку
      if AViewInfo.GridRecord.Selected then
      begin
        ACanvas.Font.Color := $00D7F7E2;
        ACanvas.Brush.Color := clSkyBlue;
        //ACanvas.Font.Style := [fsBold];
      end
      else begin
        ACanvas.Brush.Color := $00D7F7E2;
        AViewInfo.Params.TextColor := clBlack;
        ACanvas.Font.Color := clBlack;
      end;
    end;
  end;
end;
{Added by A.Nakorjakov 10.01.2008
finished}

{-------------------------------------------------------------------------------
  Процедура:  TfrmMoveEdit.acAddByPacNaznExecute
  Назначение: Добавить позицию списания по назначению пациента. Только при списании на пациента!
  Автор:      Яковенко Д.П.
  Дата:       01.07.2014
  Параметры: Sender: TObject
-------------------------------------------------------------------------------}
procedure TfrmMoveEdit.acAddByPacNaznExecute(Sender: TObject);
begin
  if ( FViewNum <> VIDMOVE_SPISANIE ) and ( SpisanieVid <> SPISANIE_VID_PACIENT ) then
    Exit;

  if ( VarIsNull ( lcbMO_GROUP_TO.EditValue ) or
       ( VarIsOrdinal(lcbMO_GROUP_TO.EditValue) and ( StrToInt ( VarToStr (lcbMO_GROUP_TO.EditValue) ) <= 0 ) ) ) then
  begin
    Application.MessageBox('Выберите пациента!','', MB_OK + MB_ICONWARNING );
    Exit;
  end;

  fIsAddByPacNazn := True;
  acins.Execute;
  fIsAddByPacNazn := False;
end;

procedure TfrmMoveEdit.acAddByTrebDPCExecute(Sender: TObject);
begin
  if (FViewNum = VIDMOVE_NAKL_TREB)and(FIsAddRashWithTrebExec = False) then // такая загогулина нужна только для расхода по требованию
  begin
    if (odsZatrebovano.Active)and(odsZatrebovano.RecordCount > 0) then
      FFK_TrebDPC := odsZatrebovano.FieldByName('FK_ID').AsInteger
    else
    begin
      Application.MessageBox('В требовании нет позиций, по которым можно было бы выдать ТМЦ.','',MB_OK+MB_ICONWARNING);
      Exit;
    end;
  end;
  acins.Execute;
end;

procedure TfrmMoveEdit.tbuAddClick(Sender: TObject);
begin
  acAddByTrebDPC.Execute;
//  acins.Execute;
end;

procedure TfrmMoveEdit.tbuAutoFillClick(Sender: TObject);
var
  FinSource : Integer;
begin
  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1) and
     (dmMain.ConfigParams.GetParamValue('FUNC_USE_FIN_SOURCE_IN_AUTOFILL', 1) = 1) and
     (odsZatrebovano.RecordCount > 0) then
    FinSource := nvl(odsZatrebovano.FieldByName('FK_FINSOURCE_ID').AsVariant,-1)
  else
    FinSource := -1;

  DoMakeAutoFill( FinSource, True );
end;

procedure TfrmMoveEdit.tbuAutoFillPlanClick(Sender: TObject);
var
  FinSource : Integer;
begin
  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1) and
     (dmMain.ConfigParams.GetParamValue('FUNC_USE_FIN_SOURCE_IN_AUTOFILL', 1) = 1) and
     (odsZatrebovano.RecordCount > 0) then
    FinSource := nvl(odsZatrebovano.FieldByName('FK_FINSOURCE_ID').AsVariant,-1)
  else
    FinSource := -1;
  DoMakeAutoFill( FinSource, False );
end;

procedure TfrmMoveEdit.tbuTemplateClick(Sender: TObject);
begin
  acLoadFromTemplate.Execute;
end;

procedure TfrmMoveEdit.UpdateFK_TREBDPC(aDPCID, aFK_TrebDPC : Integer);
begin
  try
    with TOracleQuery.Create(self) do
    begin
      Session := dmMain.os;
      SQL.Text := 'UPDATE MED.TDPC SET FK_TREBDPC = :FK_TREBDPC WHERE DPCID = :DPCID';
      DeclareAndSet('FK_TREBDPC', otInteger, aFK_TrebDPC);
      DeclareAndSet('DPCID',      otInteger, aDPCID);
      Execute;
      Free;
    end;
  except
  end;
end;

procedure TfrmMoveEdit.Update_FD_DATE_SPIS(aDPCID: Integer; aFD_DATE_SPIS: TDateTime);
begin
  try
    with TOracleQuery.Create(self) do
    begin
      Session := dmMain.os;
      SQL.Text := 'UPDATE MED.TDPC SET FD_DATE_SPIS = :pFD_DATE_SPIS WHERE DPCID = :pDPCID';
      DeclareAndSet('pFD_DATE_SPIS', otDate, aFD_DATE_SPIS);
      DeclareAndSet('pDPCID',      otInteger, aDPCID);
      Execute;
      Free;
    end;
  except
  end;
end;

procedure TfrmMoveEdit.cxGridTrebDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  acAddByTrebDPC.Execute;
end;

procedure TfrmMoveEdit.lcbMO_TOCloseUp(Sender: TObject);
begin
  lcbMO_GROUP_TO.SetFocus;
  lcbMO_GROUP_TO.DroppedDown := True;
end;

procedure TfrmMoveEdit.acInsbyEANExecute(Sender: TObject);
var
  tmpFLang: array[0..KL_NAMELENGTH] of char; //Раскладка клавиатуры
begin
  FPrihByShtrihCode := True;

  //Запоминаем текущюю раскладку
  GetKeyboardLayoutName(tmpFLang);
  //Загружаем русскую раскладку клавиатуры
  LoadKeyboardLayout(PChar('00000409'), KLF_ACTIVATE);
  acins.Execute;
  //Возвращаем предыдущую раскладку
  LoadKeyboardLayout(tmpFLang, KLF_ACTIVATE);

  FPrihByShtrihCode := False;
end;

procedure TfrmMoveEdit.chbFasEIClick(Sender: TObject);
begin
  cxGridRashKartDBTableView1FK_FEI.Visible := chbFasEI.Checked;
  cxGridRashKartDBTableView1FN_FAS.Visible := chbFasEI.Checked;

  cxGridRashKartDBTableView1FK_UEI.Visible := not chbFasEI.Checked;
  cxGridRashKartDBTableView1FN_KOL.Visible := not chbFasEI.Checked;
end;

procedure TfrmMoveEdit.acLoadFromTemplateExecute(Sender: TObject);
var
  NeedKol, KolOst : double;
  num : integer;
  sMess : string;
  Templ_ID : integer;
begin
  Templ_ID := DoShowTemplates( dmMain.FK_CurMO_GROUP );
// проверки
  if (Templ_ID < 0)  then 
  begin
//    Application.MessageBox('Требование не содержит препаратов'#13#10'Выдача препаратов по этому требованию возможна только в ручном режиме','Внимание',MB_OK+MB_ICONWARNING);
    Exit;
  end;
  
  try
    sMess := '';
    num := 0;

    dmMain.odsTTemplate_dpc.First;

    if (odsKart.RecordCount > 0)and(Application.MessageBox('Удалить уже вставленные партии?', 'Подтверждение', MB_YESNO+MB_ICONQUESTION) = mrYes) then
    begin
      _dmMoveEdit.oqKartClear.SetVariable('adpid', idDocs);
      _dmMoveEdit.oqKartClear.Execute;
    end;

  //  CurDate := Trunc(ServerDate( dmMain.os ));
    while not dmMain.odsTTemplate_dpc.Eof do
    begin
      odsTrebOst.Close;
      odsTrebOst.SetVariable('medicid', dmMain.odsTTemplate_dpc.FieldByName('fk_medic_id').AsInteger);
      odsTrebOst.Open;
      NeedKol  := dmMain.odsTTemplate_dpc.FieldByName('fn_kol').AsFloat; // кол-во затребованного препарата
      odsTrebOst.First;
      KolOst   := odsTrebOst.FieldByName('FN_KOLOST').AsFloat; // остаток по текущей партии
      while ((NeedKol > KolOst)and(not odsTrebOst.Eof)) do
      begin
        dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
                                          KolOst,
                                          odsTrebOst.fieldByName('fn_price').AsFloat,    //Этот параметр не используется
                                          odsTrebOst.fieldByName('kartid').AsInteger,
                                          0, 3);
        NeedKol := NeedKol - KolOst;

        odsTrebOst.Next;
        KolOst   := odsTrebOst.FieldByName('FN_KOLOST').AsFloat; // остаток по текущей партии
      end;

      if odsTrebOst.Eof then
      begin
        Inc( num ); // счетчик препаратов, остатков которых не хватило
        sMess := sMess + #13#10+IntToStr(num)+') ' + dmMain.odsTTemplate_dpc.FieldByName('fc_medic').AsString+' - '+FloatToStr(RoundTo(NeedKol,-4)){+' '+odsZatrebovano.FieldByName('fc_edizm').AsString};
      end
      else
        if NeedKol <= odsTrebOst.FieldByName('FN_KOLOST').AsFloat then
        begin
          dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
                                            NeedKol,
                                            odsTrebOst.fieldByName('fn_price').AsFloat,
                                            odsTrebOst.fieldByName('kartid').AsInteger,
                                            0, 3 );
        end;

      dmMain.odsTTemplate_dpc.Next; // следующий препарат из шаблона
    end; // while not odsZatrebovano.Eof do

    odsKart.Close;
    odsKart.Open;

    if (num > 0) then // если остатков каких-то препаратов не хватило, выводим список этих препаратов
    begin

      sMess := 'Для '+IntToStr(num)+' позиций препарата(ов) не хватило остатков.'+sMess;
      Application.MessageBox(PAnsiChar(sMess),'Внимание',MB_OK+MB_ICONWARNING);
    end;
  finally
    dmMain.odsTTemplate_dpc.Close;
  end;
end;

procedure TfrmMoveEdit.acAddToTemplateExecute(Sender: TObject);
var
  s : string;
begin
  if DoShowInputEdit(s, 'Введите название шаблона')=mrOk then
  begin
    try
      dmMain.oqInsTTemplate_doc.SetVariable('FP_VID',         FVidNum);
      dmMain.oqInsTTemplate_doc.SetVariable('fp_vid_move',    FViewNum);
      dmMain.oqInsTTemplate_doc.SetVariable('FC_DESCR',       s);
      dmMain.oqInsTTemplate_doc.SetVariable('FK_MOID',        dmMain.MOID);
      dmMain.oqInsTTemplate_doc.SetVariable('FK_MO_GROUP_ID', dmMain.FK_CurMO_GROUP);
      dmMain.oqInsTTemplate_doc.Execute;

      odsKart.First;
      while odsKart.Eof = False do
      begin
        dmMain.oqInsTTemplate_dpc.SetVariable('FK_TEMPLATE_DOC_ID', dmMain.oqInsTTemplate_doc.GetVariable('FK_ID'));
        dmMain.oqInsTTemplate_dpc.SetVariable('FK_MEDIC_ID',        odsKart.FieldByName('MEDICID').AsInteger);
        dmMain.oqInsTTemplate_dpc.SetVariable('FN_KOL',             odsKart.FieldByName('FN_KOL').AsFloat);
        dmMain.oqInsTTemplate_dpc.Execute;

        odsKart.Next;
      end;

//      DoShowTemplates( dmMain.FK_CurMO_GROUP );
    except
      Application.MessageBox('Ошибка при формировании шаблона', 'Ошибка', MB_OK+MB_ICONERROR);
    end;
//:FK_ID, :FK_TEMPLATE_DOC_ID, :FK_MEDIC_ID, :FN_KOL
  end;
end;

procedure TfrmMoveEdit.acAddWithTrebDPCExecute(Sender: TObject);
begin
  FIsAddRashWithTrebExec := True;
  acAddByTrebDPC.Execute;
  FIsAddRashWithTrebExec := False;
end;

procedure TfrmMoveEdit.SetIsAddRashWithTrebShow(aValue: Boolean);
begin
  FIsAddRashWithTrebShow := aValue;
  StatusBar1.Visible     := aValue;

  miTrebDPC.Visible     := aValue;
  acEditTrebPDC.Visible := aValue;
  acDelTrebDPC.Visible  := aValue;
end;

procedure TfrmMoveEdit.acEditTrebPDCExecute(Sender: TObject);
var
  S : string;
  kol : Double;
  id : integer;
begin
  s := InputBox('Введите кол-во ТМЦ', 'Кол-во', cxGridTrebDBTableView1FN_TREBKOL.EditValue);
  if TryStrToFloat(s, kol) = True then
  begin
    id := cxGridTrebDBTableView1FK_ID.EditValue;
    dmMain.PKGTREB.DOSETTREBDPC( id, FFK_Treb,  cxGridTrebDBTableView1MEDICID.EditValue, kol);

    odsZatrebovano.AfterScroll := nil;
    odsZatrebovano.Close;
    odsZatrebovano.Open;
    odsZatrebovano.Locate( 'FK_ID', id, [] );
    odsZatrebovano.AfterScroll := odsZatrebovanoAfterScroll;
    odsZatrebovanoAfterScroll(odsZatrebovano);
  end
  else
    dmMain.ShowBalloonHint('Введенное значение содержит ошибку');
end;

procedure TfrmMoveEdit.acDelTrebDPCExecute(Sender: TObject);
begin
    dmMain.PKGTREB.DODELTREBDPC( cxGridTrebDBTableView1FK_ID.EditValue );

    odsZatrebovano.AfterScroll := nil;
    odsZatrebovano.Close;
    odsZatrebovano.Open;
    odsZatrebovano.AfterScroll := odsZatrebovanoAfterScroll;
    odsZatrebovanoAfterScroll(odsZatrebovano);
end;

procedure TfrmMoveEdit.FormStorageRestorePlacement(Sender: TObject);
begin
  // костыль для того, чтобы это поле вылазило только в положенном виде
  // вообще это поле надо убрать из автосохранения - но так сцуко надежнее Воронов О.А. 22.10.08
  cxGridRashKartDBTableView1FD_DATE_SPIS.Visible                 := (SpisanieVid = SPISANIE_VID_PACIENT);
  cxGridRashKartDBTableView1FD_DATE_SPIS.VisibleForCustomization := (SpisanieVid = SPISANIE_VID_PACIENT);

  // принудительно убираем флаг, если режим выключен
  if (dmMain.ConfigParams.GetParamValue('FUNC_FAS_EI_UHC', 0) = 0)and(chbFasEI.Checked) then chbFasEI.Checked := False;
end;

procedure TfrmMoveEdit.odsKartApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean; var NewRowId: String);
begin
//  case Action of
//    'U':
//    begin
//      if Sender.FieldByName('FC_RETURN_POST').OldValue <> Sender.FieldByName('FC_RETURN_POST').Value then
//        with TOracleQuery.Create(nil) do
//        begin
//          Session := dmMain.os;
//          DeclareAndSet('pFC_RETURN_POST', otString, Sender.FieldByName('FC_RETURN_POST').AsString);
//          DeclareAndSet('pDPCID', otInteger, Sender.FieldByName('DPCID').OldValue);
//          SQL.Text := 'update med.tdpc set FC_RETURN_POST = :pFC_RETURN_POST where dpcid = :pDPCID';
//          Execute;
//          Free;
//          Applied := True;
//        end;
//
//      if Sender.FieldByName('FD_VIDDATE').OldValue <> Sender.FieldByName('FD_VIDDATE').Value then
//        with TOracleQuery.Create(nil) do
//        begin
//          Session := dmMain.os;
//          DeclareAndSet('pFD_DATE_SPIS', otDate, Sender.FieldByName('FD_DATE_SPIS').AsString);
//          DeclareAndSet('pDPCID', otInteger, Sender.FieldByName('DPCID').OldValue);
//          SQL.Text := 'update med.tdpc set FD_DATE_SPIS = :pFD_DATE_SPIS where dpcid = :pDPCID';
//          Execute;
//          Free;
//          Applied := True;
//        end;
//    end;
//  end;
end;

procedure TfrmMoveEdit.odsTrebOstApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean; var NewRowId: string);
begin
  Applied := true;
end;

procedure TfrmMoveEdit.buPostavClick(Sender: TObject);
begin
  case FViewNum of
    VIDMOVE_RETURN_POSTAV: lcbMO_TO.KeyValue   := DoShowPostavLst(fdmMain.nvl(lcbMO_TO.KeyValue,-1), True);
    VIDMOVE_PRIH_POST    : lcbMO_FROM.EditValue := DoShowPostavLst(fdmMain.nvl(lcbMO_FROM.EditValue,-1), True);
  end;
  _dmMoveEdit.odsPostav.Close;
  _dmMoveEdit.odsPostav.Open;
end;

procedure TfrmMoveEdit.lcbFinSourcePropertiesEditValueChanged(Sender: TObject);
var
  FK_OLD_FIN_SOURCE : variant;
begin
  if (FViewNum = VIDMOVE_PRIH_POST)and(odsKart.Active)and(odsKart.RecordCount > 0) then
  begin
    FK_OLD_FIN_SOURCE := lcbFinSource.EditValue;
    lcbFinSource.PostEditValue;
    if Application.MessageBox('Сменить источник финансирования для всех партий?', 'Подтверждение', MB_YESNO+MB_ICONQUESTION) = IDYES then
    begin
      _dmMoveEdit.oqSetKartFinSource.SetVariable('PDPID', idDocs);
      _dmMoveEdit.oqSetKartFinSource.SetVariable('PFK_FINSOURCE_ID', lcbFinSource.EditValue);
      _dmMoveEdit.oqSetKartFinSource.Execute;
    end
    else
    begin
      lcbFinSource.EditValue := FK_OLD_FIN_SOURCE;
    end;
  end;
end;

procedure TfrmMoveEdit.lcbMO_FROMPropertiesEditValueChanged(
  Sender: TObject);
var
  d : TDateTime;
  DaysLeft : integer;
begin
  if (FViewNum = VIDMOVE_PRIH_POST) then
  begin
    laFrom.Font.Color := clWindowText;
    if (dmMain.odsPostav.Locate('FK_ID', lcbMO_FROM.EditingValue, []))and(dmMain.odsPostav.FieldByName('FD_LICENSE').IsNull = False) then
    begin
      d := ServerDate(dmMain.os);
      if Trunc(d) >= Trunc(dmMain.odsPostav.FieldByName('FD_LICENSE').AsDateTime) then
      begin
        dmMain.ShowBalloonHint( 'Срок лицензии поставщика '+lcbMO_FROM.Text+  ' истёк', 'ВНИМАНИЕ', self );
        laFrom.Font.Color := clRed;
      end
      else
      begin
        DaysLeft := DaysBetween(d, dmMain.odsPostav.FieldByName('FD_LICENSE').AsDateTime);
        if DaysLeft < 61 then
          dmMain.ShowBalloonHint( 'До окончания лицензии поставщика '+lcbMO_FROM.Text+  #13#10' осталось '+IntToStr(DaysLeft)+' дн.', 'ВНИМАНИЕ', self );
      end;
    end;
  end;
end;

end.
