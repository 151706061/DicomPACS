// $Id: fMedKardLst.pas,v 1.9 2007/06/07 10:51:46 delphi5 Exp $
//
unit fMedKardLst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Oracle, JvFormPlacement, ActnList, Grids,
  Db, OracleData, PKGMEDKART, JvDBUtils, ExtCtrls,
  Menus, StdCtrls, FR_DSet, FR_DBSet, FR_Class, JvComponentBase,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxTextEdit, cxSpinEdit, cxCurrencyEdit, cxLabel, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxContainer,
  cxMaskEdit, cxCalendar, cxCheckBox, cxGroupBox, {Gauges,} dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, fdmMain, cxLookAndFeelPainters,
  cxImage;


const
   medkartlst_ini = 'medica_medkartlst.ini';
   FILTER_OST_NOT_NULL = 'AND O.FN_KOLOST <> 0';
   FILTER_OST_IS_NULL = 'AND O.FN_KOLOST = 0';

type
  // запись выбранной позиции остатка
  TOstatokRec = packed Record
    KARTID : integer;  // -1 - не выбрана
    FN_OST_TYPE : integer;
    DPCID : Integer;
    MEDICID : integer;
    FN_OSTATOK : Double;
    FN_OSTATOK_FAS : Double;
    FN_FPACKINUPACK : Double;
    FD_DATE_PRIH : TDateTime;
    FC_MEDIC : string;
    FC_ED_IZM : string;
    FK_FINSOURCE_ID : integer;
  end;

  TfrmMedKardLst = class(TForm)
    al: TActionList;
    acClose: TAction;
    acDel: TAction;
    acEdit: TAction;
    acAdd: TAction;
    acRefresh: TAction;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton7: TToolButton;
    ToolButton6: TToolButton;
    ToolButton5: TToolButton;
    tbuSelect: TToolButton;
    ToolButton9: TToolButton;
    acSelect: TAction;
    tbuPrint: TToolButton;
    acPrint: TAction;
    panel: TPanel;
    paMedKart: TPanel;
    odsEdit: TOracleDataSet;
    odsEditDPID: TFloatField;
    odsEditFC_DOC: TStringField;
    odsEditFC_COMMENT: TStringField;
    odsEditFN_PRICE: TFloatField;
    odsEditFD_DATA: TDateTimeField;
    odsEditFD_INVOICE: TDateTimeField;
    odsEditMOTOID: TIntegerField;
    odsEditPOSTAVID: TIntegerField;
    oq: TOracleQuery;
    odsEditMOFROMID: TIntegerField;
    odsEditFL_EDIT: TIntegerField;
    odsEditMOOWNERID: TIntegerField;
    acCalcOstByKart: TAction;
    frKart: TfrReport;
    frDBDataSetMedKart: TfrDBDataSet;
    FormStorage: TJvFormStorage;
    paOst: TPanel;
    StaticText1: TStaticText;
    cbShowNulls: TCheckBox;
    pmPrint: TPopupMenu;
    N10: TMenuItem;
    N11: TMenuItem;
    acLittleKart: TAction;
    frLittleKart: TfrReport;
    cxGridPrihRashDBTableView1: TcxGridDBTableView;
    cxGridPrihRashLevel1: TcxGridLevel;
    cxGridPrihRash: TcxGrid;
    cxGridPrihRashDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridPrihRashDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridPrihRashDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridPrihRashDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridPrihRashDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridPrihRashDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridPrihRashDBTableView1DBColumn7: TcxGridDBColumn;
    cxGridPrihRashDBTableView1DBColumn8: TcxGridDBColumn;
    cxGridPrihRashDBTableView1DBColumn9: TcxGridDBColumn;
    cxGridPrihRashDBTableView1DBColumn10: TcxGridDBColumn;
    frDBDataSetKardoper: TfrDBDataSet;
    odsEditFP_VID: TIntegerField;
    odsEditFP_VIDMOVE: TIntegerField;
    odsEditFL_TREB: TIntegerField;
    odsEditFN_SPISANIEVID: TFloatField;
    odsEditFK_MOGROUPID: TFloatField;
    odsEditFK_MOGROUPID_TO: TFloatField;
    odsEditFK_MOGROUPID_FROM: TFloatField;
    tbuFilter: TToolButton;
    acFilter: TAction;
    ToolButton11: TToolButton;
    cxGridMedic: TcxGrid;
    cxGridMedicLevel1: TcxGridLevel;
    cxGridMedicDBTableView1: TcxGridDBTableView;
    cxGridMedicDBTableView1FC_NAME: TcxGridDBColumn;
    cxGridMedicDBTableView1FC_EANCODE: TcxGridDBColumn;
    cxGridMedicDBTableView1FC_MEDIC: TcxGridDBColumn;
    cxGridMedicDBTableView1FN_PARTY_NUM: TcxGridDBColumn;
    cxGridMedicDBTableView1FC_SERIAL: TcxGridDBColumn;
    cxGridMedicDBTableView1FD_GODEN: TcxGridDBColumn;
    cxGridMedicDBTableView1FC_UEDIZM: TcxGridDBColumn;
    cxGridMedicDBTableView1FC_MEDICTYPENAME: TcxGridDBColumn;
    cxGridMedicDBTableView1FC_PAYTYPE: TcxGridDBColumn;
    cxGridMedicDBTableView1FC_MONAME: TcxGridDBColumn;
    cxGridMedicDBTableView1FN_FPACKINUPACK: TcxGridDBColumn;
    cxGridMedicDBTableView1FC_FEDIZM: TcxGridDBColumn;
    cxGridMedicDBTableView1KARTID: TcxGridDBColumn;
    cxGridMedicDBTableView1FN_KOLOST: TcxGridDBColumn;
    cxGridMedicDBTableView1FN_PRICE: TcxGridDBColumn;
    cxGridMedicDBTableView1FN_SUMM: TcxGridDBColumn;
    Splitter1: TSplitter;
    paCur: TPanel;
    lcbCurOstGroup: TcxLookupComboBox;
    cxLabel2: TcxLabel;
    odsMO_GROUP: TOracleDataSet;
    dsMO_GROUP: TDataSource;
    deCurOstDate: TcxDateEdit;
    cxLabel1: TcxLabel;
    tbuSepCurSett: TToolButton;
    cxGridMedicDBTableView1FC_UCHGR: TcxGridDBColumn;
    cxGridMedicDBTableView1FN_OST_TYPE: TcxGridDBColumn;
    cxGridMedicDBTableView1MEDICID: TcxGridDBColumn;
    cxGridMedicDBTableView1FN_FAS_KOLOST: TcxGridDBColumn;
    frReport1: TfrReport;
    pmKartLst: TPopupMenu;
    acMoveToRezerv: TAction;
    acMoveFromRezerv: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    oqMoveToRezerv: TOracleQuery;
    oqMoveFromRezerv: TOracleQuery;
    cxGridMedicDBTableView1FC_CERT: TcxGridDBColumn;
    cxGridMedicDBTableView1FC_PROD: TcxGridDBColumn;
    tbuExcel: TToolButton;
    sd: TSaveDialog;
    ToolButton12: TToolButton;
    tbuSkladSelect: TToolButton;
    cxGridMedicDBTableView1FL_BRAK: TcxGridDBColumn;
    cxGridMedicDBTableView1BRAK_UNIQSTR: TcxGridDBColumn;
    acCheckSeeingPartiesByBrak: TAction;
    ToolButton2: TToolButton;
    cxGridMedicDBTableView1FK_FINSOURCE_ID: TcxGridDBColumn;
    cxGridMedicDBTableView1prih_dpid: TcxGridDBColumn;
    cxGridMedicDBTableView1PRIH_DATA: TcxGridDBColumn;
    cxGridMedicDBTableView1FC_INV_NOMER: TcxGridDBColumn;
    cxGridMedicDBTableView1FC_QUOTA_CODE: TcxGridDBColumn;
    tbuClose: TToolButton;
    cxGridMedicDBTableView1FN_NDS: TcxGridDBColumn;
    cxGridMedicDBTableView1FN_PRICE_MNF: TcxGridDBColumn;
    cxGridMedicDBTableView1FN_NACENKA: TcxGridDBColumn;
    cxGridMedicDBTableView1FL_JNVLS: TcxGridDBColumn;
    laKolByOneMedics: TcxLabel;
    cxGridMedicDBTableView1FK_SKLAD_ID: TcxGridDBColumn;
    cxGridPrihRashDBTableView1_DPID: TcxGridDBColumn;
    cxGridPrihRashDBTableView1_DPCID: TcxGridDBColumn;
    paCur2: TPanel;
    gbColorDecode: TcxGroupBox;
    imRed: TcxImage;
    imYellow: TcxImage;
    imGreen: TcxImage;
    cxGridMedicDBTableView1FL_MIBP: TcxGridDBColumn;
    cxGridMedicDBTableView1FC_POSTAV: TcxGridDBColumn;
    tmrEANCode: TTimer;
    acCancelFilterEAN13: TAction;
    cxGridMedicDBTableView1FC_INTERNATIONAL_NAME: TcxGridDBColumn;
    cxGridMedicDBTableView1FL_FORMULAR: TcxGridDBColumn;
    cxGridMedicDBTableView1FK_ATC: TcxGridDBColumn;
    cxGridMedicDBTableView1FC_CLASS: TcxGridDBColumn;
    gbClass: TcxGroupBox;
    imClass2a: TcxImage;
    imClass2b: TcxImage;
    imClass3: TcxImage;
    imClass1: TcxImage;
    cxGridMedicDBTableView1FC_OKDP: TcxGridDBColumn;
    cxGridMedicDBTableView1FC_ATC_ROOT: TcxGridDBColumn;
    cxGridMedicDBTableView1FL_CHECK: TcxGridDBColumn;
    cxGridMedicDBTableView1FL_FORM_KOMISS: TcxGridDBColumn;
    cxGridMedicDBTableView1pr_border: TcxGridDBColumn;
    cxGridMedicDBTableView1min_amm: TcxGridDBColumn;
    cxGridMedicDBTableView1min_border: TcxGridDBColumn;
    cxGridMedicDBTableView1ammz: TcxGridDBColumn;
    cxGridMedicDBTableView1DRUGID: TcxGridDBColumn;
    dsMedKart: TDataSource;
    odsMedKart: TOracleDataSet;
    odsKardoper: TOracleDataSet;
    dsKardOper: TDataSource;
    cxGridMedicDBTableView1FC_PRIH_DOC: TcxGridDBColumn;
    procedure acCloseExecute(Sender: TObject);
    procedure acSelectExecute(Sender: TObject);
    procedure odsMedKartAfterOpen(DataSet: TDataSet);
    procedure acDelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acPrintExecute(Sender: TObject);
    procedure odsKardoperBeforeOpen(DataSet: TDataSet);
		procedure odsMedKartAfterScroll(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
//    procedure dbgCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
//      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
//      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
//      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
//      var ADone: Boolean);
    procedure dbgDblClick(Sender: TObject);
//    procedure DBEhSortGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acCalcOstByKartExecute(Sender: TObject);
    procedure dbgFilterChanged(Sender: TObject; ADataSet: TDataSet;
      const AFilterText: String);
    procedure cbShowNullsClick(Sender: TObject);
    procedure acLittleKartExecute(Sender: TObject);
    procedure frLittleKartGetValue(const ParName: String;
      var ParValue: Variant);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure cxGridPrihRashDBTableView1DblClick(Sender: TObject);
    procedure acFilterExecute(Sender: TObject);
    procedure cxGridMedicDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGridMedicDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure deCurOstDatePropertiesEditValueChanged(Sender: TObject);
    procedure lcbCurOstGroupPropertiesEditValueChanged(Sender: TObject);
    procedure deCurOstDatePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure tbuExcelClick(Sender: TObject);
    procedure tbuSkladSelectClick(Sender: TObject);
    procedure cxGridMedicDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure acCheckSeeingPartiesByBrakExecute(Sender: TObject);
    procedure gbColorDecodeClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tmrEANCodeTimer(Sender: TObject);
    procedure acCancelFilterEAN13Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure odsMedKartAfterPost(DataSet: TDataSet);   
    procedure odsMedKartBeforePost(DataSet: TDataSet);
    procedure cxGridMedicDBTableView1pr_borderCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridMedicDBTableView1pr_borderGetCellHint(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
      var AHintText: TCaption; var AIsHintMultiLine: Boolean;
      var AHintTextRect: TRect);
    procedure odsMedKartApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean; var NewRowId: string);
  private
    FOnlySkladID : integer;
    FbReturn : Boolean;
    FIsSelectShow : Boolean;
    FIsNowFormCreate : Boolean;
    FWhereAddition: String;
    FFilterText : string;

    MedicidList : TarrInt;

    //Для работы со сканером штрих-кодов
    FIsShtrihCodeInput : Boolean;
    FEAN13Code1{, FEAN13Code2} : string;  // буфер для накапливания цифр - для штрих-сканера
    FIs13KeyPressed : boolean;

    FGROUPRestriction: string;
    FSelectRestriction: string;
//    FWhereAddition: string;
    FWhereConstraint: string;
    FWHERErestriction: string;
    FFromRestriction: string;
    FHintRestriction: string;
    FQBERestriction: string;
    FOrderRestriction: string;
    fOstatokRec : TOstatokRec;

		{ Private declarations }
// 		procedure SetOstatok;
    nSrokyRangeRed, nSrokyRangeYellow, nSrokyRangeGreen: integer;

    procedure SetbReturn(const Value: Boolean);
    procedure SetIsSelectShow(const Value: Boolean);

  public
    { Public declarations }
    bFUNC_USE_CLASS,
    bFUNC_COLORED_KART_BY_SROKY : Integer;
    nID: integer;
		nVID_MOVE, SpisanieVid: Integer;

		bEditKardOper : Boolean;
    InitMoGROUP : integer;

		property bReturn: Boolean read FbReturn write SetbReturn;

		{ Список атрибутов запроса}
		property HintRestriction: string read FHintRestriction write FHintRestriction;
		property SELECTrestriction: string read FSelectRestriction write FSelectRestriction;
		{ Список таблиц запроса }
		property FROMrestriction: string read FFromRestriction write FFromRestriction;
		{ Условия отбора записей}
		property WHERErestriction: string read FWHERErestriction write FWHERErestriction;
		{ Дополнительное условие отбора записей}
    property WHEREaddition: string read FWhereAddition write FWhereAddition;
		{ Альтернативное условие отбора записей}
		property WHEREconstraint: string read FWhereConstraint write FWhereConstraint;
		{ Условия отбора записей по образцу}
		property QBErestriction: string read FQBERestriction write FQBERestriction;
		{ Условие обединения}
		property GROUPrestriction: string read FGROUPRestriction write FGROUPRestriction;
		{ Условие сортировки}
		property ORDERrestriction: string read FOrderRestriction write FOrderRestriction;

		function RefreshSQLText(pAddComments: Boolean = False): string;

    property IsSelectShow : Boolean read FIsSelectShow write SetIsSelectShow;
    property SelectedOstRec : TOstatokRec read fOstatokRec;
	end;

function DoShowMedKardLst( var nMedicIDList: TarrInt; bShowCheckColumn: boolean; pID: integer = -1; aRecordIndex : integer = -1; pVID_MOVE: integer = 0;
	bFiltered: Boolean = FALSE; aSpisanieVid: integer = SPISANIE_VID_NONE; pWhereAdition: String = '';
	bEditKardOper: Boolean = False; pFilter: String = '';
	bProduceMedic:boolean = false; bIsSelectShow : Boolean = false; bIsSelectMaxKol : Boolean = False; aMO_GROUP_OST : integer = -1;
  aOnlySkladID : integer = 0; aFormCaption : string = 'Список остатков по партиям'; aIsShtrihCodeInput : Boolean = False): TOstatokRec; overload;

function DoShowMedKardLst( pID: integer = -1; aRecordIndex : integer = -1; pVID_MOVE: integer = 0;
	bFiltered: Boolean = FALSE; aSpisanieVid: integer = SPISANIE_VID_NONE; pWhereAdition: String = '';
	bEditKardOper: Boolean = False; pFilter: String = '';
	bProduceMedic:boolean = false; bIsSelectShow : Boolean = false; bIsSelectMaxKol : Boolean = False; aMO_GROUP_OST : integer = -1;
  aOnlySkladID : integer = 0; aFormCaption : string = 'Список остатков по партиям'; aIsShtrihCodeInput : Boolean = False): TOstatokRec; overload;

var
	frmMedKardLst: TfrmMedKardLst;
//  IsModal : Boolean;

//	idbg_Filter_Active:integer; //0 - не включали, 1 - фильтр грида dbg активен, 2 - не активен

implementation

uses fmainform, fMedKardEdit, fPrihEdit, fMoveEdit, fgetperiod,
	{fProdCurrentItemEdit,} HtmlHlp, fdmPrintReports, fdmPrintSelect, Variants,
     cxGridExportLink, ShellAPI, Math, fdmSkladSelect, fBrakSelect,
  cxGridDBDataDefinitions, fBrakCheckProgress, IniFiles, fSrokyColorOption;


{$R *.DFM}

function DoShowMedKardLst( var nMedicIDList: TarrInt; bShowCheckColumn: boolean;
  pID: integer = -1;
  aRecordIndex : integer = -1;
  pVID_MOVE: integer = 0;
	bFiltered: Boolean = FALSE;
  aSpisanieVid: integer = SPISANIE_VID_NONE;
  pWhereAdition: String = '';
	bEditKardOper: Boolean = False; pFilter: String = '';
	bProduceMedic:boolean = false;
  bIsSelectShow : Boolean = false;
  bIsSelectMaxKol : Boolean = False;
  aMO_GROUP_OST : integer = -1;
  aOnlySkladID : integer = 0;
  aFormCaption : string = 'Список остатков по партиям'; aIsShtrihCodeInput : Boolean = False): TOstatokRec; overload;
var frmMedKardLstModal : TfrmMedKardLst; //заводится отдельная переменная для модального режима дабы не было AccessViolation
  fOstatokRec : TOstatokRec;
begin

  fOstatokRec.KARTID := -1;
	fOstatokRec.FC_MEDIC:='';
  fOstatokRec.FC_ED_IZM := '';
  fOstatokRec.fd_date_prih := NullDate;
  fOstatokRec.FK_FINSOURCE_ID := -1;

	//если передали нолик, то возмем текущего МО

//  IsModal := bIsSelectShow;
	if bIsSelectShow = False then
	begin
    if not frmMain.RestoreMDI_Window('frmMedKardLst') then
    begin
      frmMedKardLst := TfrmMedKardLst.Create(Application);
      frmMedKardLst.Caption := aFormCaption; // Added by A.Nakorjakov 28.02.2008 11:18:16
      frmMedKardLst.FormStyle := fsMDIChild;
    end;

		frmMedKardLst.bEditKardOper := bEditKardOper;
    frmMedKardLst.IsSelectShow := bIsSelectShow;

    if bEditKardOper then frmMedKardLst.cxGridPrihRashDBTableView1.OnDblClick := frmMedKardLst.cxGridPrihRashDBTableView1DblClick;

    frmMedKardLst.nID := pID;
    frmMedKardLst.nVID_MOVE := pVID_MOVE;
    frmMedKardLst.SpisanieVid := aSpisanieVid;
    frmMedKardLst.FWhereAddition := PWHEREADITION;
    frmMedKardLst.cxGridMedic.SetFocus;
    frmMedKardLst.acRefresh.Execute;

    fOstatokRec.fd_date_prih := nvl ( frmMedKardLst.odsMedKart.FieldByName('prih_data').AsVariant, NullDate );
    fOstatokRec.KARTID := pID;
    fOstatokRec.MEDICID := frmMedKardLst.odsMedKart.FieldByName('MEDICID').AsInteger;

		//result := pID;

    frmMedKardLst.acEdit.Visible := frmMain.ProvisorState = 1;
    frmMedKardLst.acEdit.Enabled  := frmMain.ProvisorState = 1;

    if frmMedKardLst.tbuSkladSelect.Visible then
      IniWriteString( iniFileName, 'fMedKardlst', 'tbuSkladSelect.Tag', IntToStr( frmMedKardLst.tbuSkladSelect.Tag ) );
  end
	else
	begin
		frmMedKardLstModal := TfrmMedKardLst.Create(Application); // модальный режим отображения
    frmMedKardLstModal.FIsShtrihCodeInput := aIsShtrihCodeInput;

    frmMedKardLstModal.InitMoGROUP := aMO_GROUP_OST;
    if aMO_GROUP_OST > 0 then
      frmMedKardLstModal.lcbCurOstGroup.EditValue := frmMedKardLstModal.InitMoGROUP
    else
      frmMedKardLstModal.lcbCurOstGroup.EditValue := dmMain.FK_CurMO_GROUP;

    frmMedKardLstModal.FOnlySkladID := aOnlySkladID;

    frmMedKardLstModal.tbuSkladSelect.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1) and (frmMain.ProvisorState = 0)
      and (frmMedKardLstModal.FOnlySkladID = 0);

    if frmMedKardLstModal.tbuSkladSelect.Visible then
    try
      frmMedKardLstModal.tbuSkladSelect.Tag := StrToInt( IniReadString ( iniFileName, 'fMedKardLst', 'tbuSkladSelect.Tag', '0' ) ); // последний выбранный склад
    except
      frmMedKardLstModal.tbuSkladSelect.Tag := 0;
    end
    else
      frmMedKardLstModal.tbuSkladSelect.Tag := 0;    
    
    frmMedKardLstModal.Caption := aFormCaption;  // Added by A.Nakorjakov 28.02.2008 11:17:59
    frmMedKardLstModal.IsSelectShow := bIsSelectShow;
		frmMedKardLstModal.odsMedKart.AfterScroll := nil;
		frmMedKardLstModal.odsMedKart.Close;
		frmMedKardLstModal.odsKardoper.Close;

		try
			frmMedKardLstModal.bEditKardOper := bEditKardOper;
			if bEditKardOper then frmMedKardLstModal.cxGridPrihRashDBTableView1.OnDblClick := frmMedKardLstModal.cxGridPrihRashDBTableView1DblClick;

			frmMedKardLstModal.nID := pID;
      frmMedKardLstModal.nVID_MOVE := pVID_MOVE;
      frmMedKardLstModal.SpisanieVid := aSpisanieVid;
			frmMedKardLstModal.FWhereAddition := PWHEREADITION;

			if pFilter <> '' then
			begin
        frmMedKardLstModal.acFilter.Enabled := True;
        frmMedKardLstModal.acFilter.Visible := True;
        frmMedKardLstModal.ToolButton11.Visible := True;
        frmMedKardLstModal.FFilterText := pFilter;       
			end;


      frmMedKardLstModal.acRefresh.Execute;

     // frmMedKardLstModal.odsMedKart.AfterScroll := nil;

      if (aRecordIndex >= 0 ) then
        frmMedKardLstModal.cxGridMedicDBTableView1.Controller.FocusedRowIndex := aRecordIndex
      else
        if pID > 0 then
          frmMedKardLstModal.odsMedKart.locate('KARTID', pID, []) ;

//      frmMedKardLstModal.odsMedKart.AfterScroll := frmMedKardLstModal.odsMedKartAfterScroll;
//			frmMedKardLstModal.odsMedKartAfterScroll(frmMedKardLstModal.odsMedKart); //чтобы сработало событме odsMedKartAfterScroll

      if frmMedKardLstModal.FIsShtrihCodeInput then
        frmMedKardLstModal.cxGridMedicDBTableView1FC_EANCODE.Selected := True;

      frmMedKardLstModal.cxGridMedicDBTableView1FL_CHECK.VisibleForCustomization := bShowCheckColumn;
      frmMedKardLstModal.cxGridMedicDBTableView1FL_CHECK.Visible := bShowCheckColumn;
			if frmMedKardLstModal.ShowModal = mrOK then
      begin
        nMedicIDList := frmMedKardLstModal.MedicidList;
        fOstatokRec := frmMedKardLstModal.SelectedOstRec;

				frmMedKardLstModal.odsMedKart.Filter := '';
				frmMedKardLstModal.odsMedKart.Filtered := false;
      end
      else begin
        //nMedicID := -1;
        fOstatokRec.KARTID := -1;
        fOstatokRec.MEDICID := -1;
      end;
    finally
      FreeAndNil(frmMedKardLstModal);
    end;
  end;

  Result := fOstatokRec; 
end;

function DoShowMedKardLst( pID: integer = -1; aRecordIndex : integer = -1; pVID_MOVE: integer = 0;
	bFiltered: Boolean = FALSE; aSpisanieVid: integer = SPISANIE_VID_NONE; pWhereAdition: String = '';
	bEditKardOper: Boolean = False; pFilter: String = '';
	bProduceMedic:boolean = false; bIsSelectShow : Boolean = false;
  bIsSelectMaxKol : Boolean = False; aMO_GROUP_OST : integer = -1;
  aOnlySkladID : integer = 0; aFormCaption : string = 'Список остатков по партиям';
  aIsShtrihCodeInput : Boolean = False): TOstatokRec; overload;
var
  nTmpList : TarrInt;
begin
  Result := DoShowMedKardLst( nTmpList, false, pID, aRecordIndex, pVID_MOVE, bFiltered, aSpisanieVid, pWhereAdition, bEditKardOper, pFilter,
                   bProduceMedic, bIsSelectShow, bIsSelectMaxKol, aMO_GROUP_OST, aOnlySkladID, aFormCaption, aIsShtrihCodeInput );
end;
{********************************************************************************************************}
{        TfrmMedKardLst.acCloseExecute
{********************************************************************************************************}

procedure TfrmMedKardLst.acCloseExecute(Sender: TObject);
begin
	nID := -1;
  ModalResult := mrCancel;
  close;
end;

{********************************************************************************************************}
{        TfrmMedKardLst.acSelectExecute
{********************************************************************************************************}

procedure TfrmMedKardLst.acSelectExecute(Sender: TObject);
var
//  ini : TiniFile;
  ASEvent : procedure (aDataSet:TDataSet) of object;
  MedicId : Integer;
begin
	nID := odsMedKart.FieldByName('KARTID').AsInteger;
  MedicId := odsMedKart.FieldByName('MedicId').AsInteger;

  cxGridMedicDBTableView1.StoreToIniFile(medkartlst_ini, True, [gsoUseFilter]);

  with fOstatokRec, odsMedKart do
  begin
    KARTID := FieldByName('KARTID').AsInteger;
    MEDICID := FieldByName('MEDICID').AsInteger;
    FN_OSTATOK := FieldByName('FN_KOLOST').AsFloat;
    FN_OSTATOK_FAS := FieldByName('FN_FAS_KOLOST').AsFloat;
    FN_FPACKINUPACK := FieldByName('FN_FPACKINUPACK').AsFloat;
    FN_OST_TYPE := FieldByName('FN_OST_TYPE').AsInteger;
    FC_MEDIC  := FieldByName('FC_MEDIC').AsString;
    FC_ED_IZM := FieldByName('FC_UEDIZM').AsString;
    FD_DATE_PRIH := nvl ( FieldByName('prih_data').AsVariant, NullDate );
    FK_FINSOURCE_ID := nvl(FieldByName('FK_FINSOURCE_ID').AsVariant, -1);
  end;                     

  // сохраняем позицию
  dmMain.MedKardLst_FocusedRowIndex := cxGridMedicDBTableView1.Controller.FocusedRowIndex;

  //////////////////////////
  if cxGridMedicDBTableView1FL_CHECK.Visible then begin
    ASEvent := odsMedKart.AfterScroll;
    odsMedKart.AfterScroll := nil;
    odsMedKart.DisableControls;
    odsMedKart.First;
    while not odsMedKart.eof do begin
      if odsMedKart.FieldByName('FL_CHECK').AsInteger = 1 then begin
        SetLength(MedicidList, Length(MedicidList) + 1);
        MedicidList[Length(MedicidList)-1] := odsMedKart.FieldByName('MEDICID').AsInteger;
      end;
      odsMedKart.Next;
    end;
    //odsMedKart.Locate('medicid',nID,[]);
    odsMedKart.EnableControls;
    odsMedKart.AfterScroll := ASEvent;
    odsMedKartAfterScroll(nil);

    if Length(MedicidList) = 0 then begin
      SetLength(MedicidList, 1);
      //MedicidList[0] := nMedicId;
      MedicidList[0] := MedicId;
    end;
  end;
  //////////////////////////

	ModalResult := mrOk;
end;

{********************************************************************************************************}
{        TfrmMedKardLst.odsListAfterOpen
{********************************************************************************************************}

procedure TfrmMedKardLst.odsMedKartAfterOpen(DataSet: TDataSet);
begin
	acSelect.Enabled := (FIsSelectShow=True ) and (odsMedKart.RecordCount <> 0);
	acEdit.Enabled   := (FIsSelectShow=False) and (odsMedKart.RecordCount <> 0);
end;

{********************************************************************************************************}
{        TfrmMedKardLst.acDelExecute
{********************************************************************************************************}

procedure TfrmMedKardLst.acDelExecute(Sender: TObject);
begin

end;

{********************************************************************************************************}
{        TfrmMedKardLst.FormCreate
{********************************************************************************************************}

procedure TfrmMedKardLst.FormCreate(Sender: TObject);
begin
  fOstatokRec.KARTID := -1;
  fOstatokRec.MEDICID := -1;

  bFUNC_USE_CLASS := dmMain.ConfigParams.GetParamValue('FUNC_USE_CLASS', 0) ;
  bFUNC_COLORED_KART_BY_SROKY := dmMain.ConfigParams.GetParamValue('FUNC_COLORED_KART_BY_SROKY', 1) ;

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_FORM_KOMISS', 0) = 0) then
  begin
    cxGridMedicDBTableView1FL_FORM_KOMISS.Visible := False;
    cxGridMedicDBTableView1FL_FORM_KOMISS.VisibleForCustomization := False;
  end;

  FOnlySkladID := 0;
  FIsNowFormCreate := True;
  FSelectRestriction := '0 as FL_CHECK, ROWNUM, O.RID, O.KARTID, O.fn_party_num, O.FC_SERIAL, TRUNC(O.FD_GODEN) AS FD_GODEN, '#13#10 +
    'O.FC_UEDIZM, 1 AS FN_KOL, O.MOID AS M, TRUNC(SYSDATE + 1) AS D, O.FC_INTERNATIONAL_NAME, O.FK_ATC, O.FC_CLASS,'#13#10 +
    'O.FC_MEDIC, O.FC_NAME, O.MEDICID, O.FC_LAT_NAME, O.FC_MONAME, O.FC_EANCODE, O.FK_MEDICTYPENAME, '#13#10 +
    'O.FC_MEDICTYPENAME, O.FK_PAYTYPE, O.FC_PAYTYPE, O.FN_FPACKINUPACK, O.FK_FPACKID, O.FC_OKDP, '#13#10 +
		'O.FC_FEDIZM, O.FN_KOLOST, O.FN_PRICE, O.FN_SUMM, O.FC_UCHGR, O.FN_OST_TYPE, O.FN_FAS_KOLOST, '#13#10+
    'O.DPCID, O.FC_PROD, O.FC_CERT, O.FN_PRODCERTID, O.FK_SKLAD_ID, O.FL_BRAK, O.BRAK_UNIQSTR, O.DRUGID,'#13#10 +
    'O.FK_FINSOURCE_ID, O.prih_dpid, O.prih_data, O.FC_PRIH_DOC, O.FC_INV_NOMER, O.FC_QUOTA_CODE, SUBSTR(NVL(O.FC_QUOTA_CODE,''00''),1,2) as FC_QUOTA_CODE_1,'#13#10+
    'O.FN_NDS, O.FN_NACENKA, O.FN_PRICE_MNF, O.FL_JNVLS, O.FL_MIBP, O.FL_FORMULAR, O.FL_FORM_KOMISS, '#13#10+
    ' mz.COLVO as min_amm, mz.FN_BORDER as min_border, '#13#10+
    ' O.ammz , '+
    ' case when 100*(mz.COLVO/(case when NVL( O.ammz ,0)=0 then 0.0000001 else NVL(O.ammz,0) end))>mz.FN_BORDER '+
           ' then ''!'' else '''' end as pr_border, '+
  //  '(select a.FL_FORM_KOMISS from med.TMEDIC a where a.MEDICID=o.MEDICID and rownum<=1 ) as FL_FORM_KOMISS,'#13#10 +
    ' fn_sost_count,'#13#10 +
    '(SELECT max(ID) FROM rls.clsatc WHERE ID IN (SELECT ID FROM rls.clsatc WHERE parentid = 0 AND ID <> 0) START WITH ID = O.FK_ATC CONNECT BY id = PRIOR parentid AND ID <> 0) FK_ATC_ROOT,'#13#10 +
    '(SELECT MAX(MED.PKGTDOCS.GET_DOC_SOURCE(D.fp_vid, D.fp_vidmove, D.fk_mogroupid_FROM, D.postavid)) FROM MED.TDOCS D WHERE O.PRIH_DPID = D.DPID) FC_POSTAV'#13#10;

  if dmMain.sDB_NAME ='SO' then
  begin
    FFromRestriction := ' MED.VMEDKART_VS_OST O, med.tminzapas mz, (SELECT COUNT(1) as fn_sost_count, fk_medic as parent_medicid from MED.tmedicomplex mc GROUP BY mc.fk_medic) SostMed '#13#10;
  end else
  begin
    FFromRestriction := ' MED.VMEDKART_VS_OST_Q O, med.tminzapas mz, (SELECT COUNT(1) as fn_sost_count, fk_medic as parent_medicid from MED.tmedicomplex mc GROUP BY mc.fk_medic) SostMed '#13#10;
  end;
  cxGridMedicDBTableView1pr_border.VisibleForCustomization := (dmMain.sDB_NAME ='SO');
  cxGridMedicDBTableView1pr_border.Visible := cxGridMedicDBTableView1pr_border.VisibleForCustomization;
  cxGridMedicDBTableView1ammz.VisibleForCustomization := (dmMain.sDB_NAME ='SO');
  cxGridMedicDBTableView1ammz.Visible := cxGridMedicDBTableView1ammz.VisibleForCustomization;

  FWhereRestriction := FWhereRestriction + ' ( mz.mogroupid(+)=med.pkg_medses.get_cur_mogroup and O.medicid=mz.medicid(+) ) ' + FILTER_OST_NOT_NULL +
                                           ' AND ((:PFK_SKLAD_ID = 0)or(:PFK_SKLAD_ID = O.FK_SKLAD_ID)or(O.FK_SKLAD_ID is null)) AND '+
                                           ' O.MEDICID = parent_medicid(+) '; // 1=1 в секции where что то участвует

  //Add Malev A.V. 20/06/2013
  if (dmMain.ConfigParams.GetParamValue('IS_USE_ATC_ROOT_FUNCT', False) = True)
  then FSelectRestriction := StringReplace(
          FSelectRestriction,
          '(SELECT max(ID) FROM rls.clsatc WHERE ID IN (SELECT ID FROM rls.clsatc WHERE parentid = 0 AND ID <> 0) '+
          ' START WITH ID = O.FK_ATC CONNECT BY id = PRIOR parentid AND ID <> 0)',
          'MED.TEMP_GET_FK_ATC_ROOT(O.FK_ATC)',
          [rfReplaceAll]);
  //--Add Malev A.V. 20/06/2013


  if FWhereAddition <> '' then
    FWHERErestriction := FWHERErestriction + FWhereAddition;
  FOrderRestriction := 'FC_MEDIC';

	odsMedKart.DeleteVariables;
	odsMedKart.DeclareAndSet('PFK_SKLAD_ID', otInteger, 0);
  odsMedKart.Sql.Text := RefreshSQLText;

  odsMedKart.AfterScroll := nil;
  odsMedKart.AfterOpen := odsMedKartAfterOpen;
  
  odsMedKart.AfterPost := odsMedKartAfterPost;
  odsMedKart.BeforePost := odsMedKartBeforePost;
//  odsMedKart.BeforeOpen := odsMedKartBeforeOpen;
  odsKardoper.BeforeOpen := odsKardoperBeforeOpen;
  IsSelectShow := False;
  odsMO_GROUP.Open;


  case frmMain.ProvisorState of
    1: deCurOstDate.Date := Trunc(dmMain.GetLastDocDate( dmMain.FK_CurMO_GROUP ));
  else
    deCurOstDate.Date := Trunc(ServerDate(dmMain.os))
  end;

{  if IsModal then
    case frmMain.ProvisorState of
      1: deCurOstDate.Date := Trunc(dmMain.GetLastDocDate( dmMain.FK_CurMO_GROUP ));
    else
      deCurOstDate.Date := Trunc(ServerDate(dmMain.os))
    end;
  else
//    deCurOstDate.Date := Trunc(dmMain.GetLastDocDate( dmMain.FK_CurMO_GROUP ));
    case frmMain.ProvisorState of
      1: deCurOstDate.Date := Trunc(dmMain.GetLastDocDate( dmMain.FK_CurMO_GROUP ));
    else
      deCurOstDate.Date := Trunc(ServerDate(dmMain.os));
    end;
}

  lcbCurOstGroup.EditValue := dmMain.FK_CurMO_GROUP;
  odsKardoper.SetVariable('MO_GROUPID', lcbCurOstGroup.EditValue);
  FIsNowFormCreate := False;

  cxGridMedicDBTableView1.FilterRow.Visible := dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FILTERROW', '0') = '1';

  nSrokyRangeRed    := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_RED_RANGE_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr(dmMain.ConfigParams.GetParamValue('FUNC_COLORED_KART_BY_SROKY_RED_RANGE', 1))));
  nSrokyRangeYellow := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_YELLOW_RANGE_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr(dmMain.ConfigParams.GetParamValue('FUNC_COLORED_KART_BY_SROKY_YELLOW_RANGE', 7))));
  nSrokyRangeGreen  := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_GREEN_RANGE_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr(dmMain.ConfigParams.GetParamValue('FUNC_COLORED_KART_BY_SROKY_GREEN_RANGE', 31))));
  
  imRed.Style.Color    := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_RED_RANGE_COLOR_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr($00AAAAFF)));
  imYellow.Style.Color := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_YELLOW_RANGE_COLOR_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr($00AAFFFF)));
  imGreen.Style.Color  := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_GREEN_RANGE_COLOR_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr($00AAFFAA)));

  imRed.Hint := 'Партии со сроком годности, истекающим через '+IntToStr(nSrokyRangeRed)+' дней либо уже истёкшим';
  imYellow.Hint := 'Партии со сроком годности, истекающим через '+IntToStr(nSrokyRangeYellow)+' дней';
  imGreen.Hint := 'Партии со сроком годности, истекающим через '+IntToStr(nSrokyRangeGreen)+' дней';
end;

{********************************************************************************************************}
{        TfrmMedKardLst.acEditExecute
{********************************************************************************************************}

procedure TfrmMedKardLst.acEditExecute(Sender: TObject);
var
  kartid : Integer;
begin
  Application.CreateForm(TfrmMedKardEdit, frmMedKardEdit);
  kartid := odsMedKart.FieldByName('KARTID').AsInteger; // передаем KartID
  frmMedKardEdit.nID := kartid;
  frmMedKardEdit.sekol.Value := odsMedKart.FieldByName('fn_kol').asfloat;
  frmMedKardEdit.ConfigFlags := [pfLockMedicPriceSumm, pfDontShowKolSum];

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN) then
  begin
    frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfExpensive];
    frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfVidPostEdit];
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_INV_NOMER', 0) = 1) then
  begin
    frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfInvNomer];
  end;   

  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_DRUGID', 0) = 1) then
  begin
    frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfDrugID];
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 1) then
  begin
    frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfQuotaCode];
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1) then
  begin
    frmMedKardEdit.ConfigFlags := frmMedKardEdit.ConfigFlags + [pfFINSOURCE];
  end;

  if frmMedKardEdit.ShowModal = mrok then
  begin
    acRefresh.Execute;

  // переходим на измененнную партию
    odsMedKart.AfterScroll := nil;
    odsMedKart.Locate('kartid', kartid, []);
    odsMedKart.AfterScroll := odsMedKartAfterScroll;
    odsMedKartAfterScroll(odsMedKart);
  end;

  frmMedKardEdit.Free;
end;

procedure TfrmMedKardLst.acRefreshExecute(Sender: TObject);
var
  OLD_MO_GROUP : integer;
  CurRecId : integer;
begin
  tbuSkladSelect.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1) and (frmMain.ProvisorState = 0) and (FOnlySkladID = 0);

  OLD_MO_GROUP := dmMain.FK_CurMO_GROUP;  //pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO;  // выставляем текщих группу и дату

  if ( odsMedKart.Active ) and ( not odsMedKart.IsEmpty)  then
    CurRecId :=  odsMedKart.FieldByName( 'KARTID' ).AsInteger
  else
    CurRecId := -1;
  try
    try
      dmMain.oqOstRefreshInit.SetVariable('CUR_DATE',     deCurOstDate.Date);
      dmMain.oqOstRefreshInit.SetVariable('CUR_MO_GROUP', lcbCurOstGroup.EditValue);
      dmMain.oqOstRefreshInit.Execute;
    except
      on e : exception do
      begin
        Application.MessageBox( PAnsiChar ( 'Ошибка при установке группы МО!' + #13#10 + e.Message ), 'Ошибка', MB_OK + MB_ICONERROR );
        Exit;
      end;
    end;

    try
      cxGridMedicDBTableView1.BeginUpdate;
//      odsMedKart.DisableControls;
      odsMedKart.AfterScroll := nil;

      odsMedKart.Close;
      odsMedKart.Sql.Text := RefreshSQLText;

      //Edited by Neronov A.S. 05.04.2012
      if FOnlySkladID = 0 then
        odsMedKart.SetVariable('PFK_SKLAD_ID', tbuSkladSelect.Tag)
      else
        odsMedKart.SetVariable('PFK_SKLAD_ID', FOnlySkladID);
      odsMedKart.Open;

      acFilter.Execute;

      if not odsMedKart.Locate( 'KARTID', CurRecId , [] ) then
        odsMedKart.First;

    finally
//      odsMedKart.EnableControls;
      cxGridMedicDBTableView1.EndUpdate;
      cxGridMedicDBTableView1.DataController.CheckFocusedRow ;
      odsMedKart.AfterScroll := odsMedKartAfterScroll;
      odsMedKartAfterScroll(odsMedKart);
    end;
  finally
    try
      dmMain.oqOstRefreshFinish.SetVariable('CUR_MO_GROUP', OLD_MO_GROUP);
      dmMain.oqOstRefreshFinish.Execute;
    finally
    end;
  end;


  if FIsShtrihCodeInput then cxGridMedicDBTableView1FC_EANCODE.Selected := True;
end;

procedure TfrmMedKardLst.acFilterExecute(Sender: TObject);
var
  FAfterScroll : TDataSetNotifyEvent;
  CurId : integer;
begin
  FAfterScroll := odsMedKart.AfterScroll;
  odsMedKartAfterOpen( nil );
  acFilter.Checked := tbuFilter.Down;
  if ( odsMedKart.Active ) and ( not odsMedKart.IsEmpty ) then
    CurId := odsMedKart.FieldByName( 'KARTID' ).AsInteger
  else
    CurId := -1;

  case acFilter.Checked of
    True:
    begin
      odsMedKart.AfterScroll := nil;
      cxGridMedicDBTableView1.DataController.DataSource.DataSet.Filtered := False;
      cxGridMedicDBTableView1.DataController.DataSource.DataSet.Filter := FFilterText;
      cxGridMedicDBTableView1.DataController.DataSource.DataSet.Filtered := True;
      odsMedKart.Locate('KARTID', CurId, [] );
      cxGridMedicDBTableView1.DataController.CheckFocusedRow ;
      odsMedKart.AfterScroll := FAfterScroll;
      if Assigned(odsMedKart.AfterScroll) then
        odsMedKart.AfterScroll(odsMedKart); //чтобы сработало событме odsMedKartAfterScroll
      acFilter.Hint := acFilter.Hint + 'Фильтр по препаратам включён';
    end;

    False:
    begin
      if (nVID_MOVE = VIDMOVE_NAKL_TREB)and(dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 1) then
      begin
        if Application.MessageBox('Вы уверены, что не хотите пользоваться ограничениями по кодам квотирования?', 'ВНИМАНИЕ', MB_YESNO+MB_ICONQUESTION) = IDNO then
        begin
          acFilter.Checked := True;
          tbuFilter.Down := True;
          Exit;
        end;
      end;

      if (nVID_MOVE = SPISANIE_VID_NONE)and(dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 1) then
      begin
        if Application.MessageBox('Вы уверены, что не хотите пользоваться ограничениями по кодам квотирования?', 'ВНИМАНИЕ', MB_YESNO+MB_ICONQUESTION) = IDNO then
        begin
          acFilter.Checked := True;
          tbuFilter.Down := True;
          Exit;
        end
        else
          if FIsSelectShow then acSelect.Enabled := False;
      end;

      if (nVID_MOVE = VIDMOVE_SPISANIE)and(SpisanieVid = SPISANIE_VID_PRICHINA)and(dmMain.ConfigParams.GetParamValue('FUNC_USE_FIN_SOURCE_IN_SPIS_PO_PRICHINE', 0) = 1) then
      begin
        if Application.MessageBox('Вы уверены, что не хотите пользоваться ограничениями по источнику финансирования?', 'ВНИМАНИЕ', MB_YESNO+MB_ICONQUESTION) = IDNO then
        begin
          acFilter.Checked := True;
          tbuFilter.Down := True;
          Exit;
        end;
      end;

      if (nVID_MOVE = VIDMOVE_SPISANIE)and(SpisanieVid = SPISANIE_VID_PACIENT) and
         ( frmMain.ProvisorState = 1 ) and (dmMain.ConfigParams.GetParamValue('FUNC_SPIS_ON_PAC_BY_PROVIZOR', 0) = 1)then
      begin
        if Application.MessageBox('Вы уверены, что не хотите воспользоваться фильтром по коду назначенного медикамента?', 'ВНИМАНИЕ', MB_YESNO+MB_ICONQUESTION) = IDNO then
        begin
          acFilter.Checked := True;
          tbuFilter.Down := True;
          Exit;
        end;
      end;

      odsMedKart.AfterScroll := nil;
      cxGridMedicDBTableView1.DataController.DataSource.DataSet.DisableControls;
      cxGridMedicDBTableView1.DataController.DataSource.DataSet.Filtered := False;
      cxGridMedicDBTableView1.DataController.DataSource.DataSet.Filter := '';
      cxGridMedicDBTableView1.DataController.DataSource.DataSet.EnableControls;
      odsMedKart.Locate('KARTID', CurId, [] );      
      cxGridMedicDBTableView1.DataController.CheckFocusedRow ;
      odsMedKart.AfterScroll := FAfterScroll;
      if Assigned(odsMedKart.AfterScroll) then      
        odsMedKart.AfterScroll(odsMedKart); //чтобы сработало событме odsMedKartAfterScroll
      acFilter.Hint := acFilter.Hint + 'Фильтр по препаратам ВЫКЛЮЧЕН';
    end;
  end; // case chbFilterByMedics.Checked then

  odsMedKartAfterOpen( odsMedKart );
end;

{********************************************************************************************************}
{        TfrmMedKardLst.FormClose
{********************************************************************************************************}

procedure TfrmMedKardLst.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  odsMedKart.AfterScroll := nil;
  cxGridMedicDBTableView1.DataController.DataSource.DataSet.Filter := '';
  cxGridMedicDBTableView1.DataController.DataSource.DataSet.Filtered := False;

  if FormStyle = fsMDIChild then
  begin
    Action := caFree;
    frmMain.tbOst.ImageIndex := 51;
  end;

  Action := caFree;
end;
//==============================================================================
procedure TfrmMedKardLst.acPrintExecute(Sender: TObject);
//==============================================================================
var
  KardId : Integer;
  P : TPoint;
begin
  if dmPrintSelect.PrintFlag = 0 then
  begin
    P.X := 0;
    P.Y := tbuPrint.Height;
    P := tbuPrint.ClientToScreen(P);
    dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати
  KardId := odsMedKart.FieldByName('KARTID').AsInteger;
  odsMedKart.Filter := ' KARTID = '+IntToStr(KardId);
  odsMedKart.Filtered := True;

//  frKart.ShowReport;
  try
    if dmPrintSelect.PrintFlag = 0 then Exit;  
    frKart.PrepareReport;
    case dmPrintSelect.PrintFlag of // флаг куда печатать
      1: ExportFRToExcel( frKart, 'Карточка ''' + odsMedKart.FieldByName('FC_MEDIC').AsString+ ''' из партии '+IntToStr(odsMedKart.FieldByName('FN_PARTY_NUM').AsInteger)+' на дату '+DateToStr(Now)+'.xls' );
      2: frKart.ShowPreparedReport;
    end;

  finally
    dmPrintSelect.PrintFlag := 0;
    odsMedKart.AfterScroll := nil;
    odsMedKart.Filtered := False;
    odsMedKart.Filter := '';
    odsMedKart.Locate('KARTID', KardId,[]);
    odsMedKart.AfterScroll := odsMedKartAfterScroll;
  end;


//{$IFDEF APTEKA}
//  odsList.SetVariable('PFD_DATE', frmMain.dCurDate);
//{$ENDIF}
//
//{$IFDEF UVRACH}
//  odsList.SetVariable('PFD_DATE', Now);
//{$ENDIF}
//  dbg.ColumnByName('FC_MEDIC').Visible := false;
//  Printdbg.Preview;
//  dbg.ColumnByName('FC_MEDIC').Visible := true;
end;
//==============================================================================
procedure TfrmMedKardLst.acLittleKartExecute(Sender: TObject);
//==============================================================================
var
  KardId : Integer;
begin
//  odsKardoper.SetVariable('PFK_ID',odsMedKart.FieldByName('KARTID').AsInteger);
//  odsKardoper.SetVariable('MOID',dmMain.pkgMedSes.GetCurMo);
//  odsKardoper.Close;
//  odsKardoper.Open;
//  frLittleKart.ShowReport;
  KardId := odsMedKart.FieldByName('KARTID').AsInteger;
  odsMedKart.Filter := ' KARTID = '+IntToStr(KardId);
                                      //' M = '+IntToStr(Trunc(dmMain.pkgMedSes.GetCurMo));
  odsMedKart.Filtered := True;
  frLittleKart.ShowReport;
  odsMedKart.Filtered := False;
  odsMedKart.Filter := '';
  odsMedKart.Locate('KARTID', KardId,[])  
end;

{********************************************************************************************************}
{        TfrmMedKardLst.odsKardoperBeforeOpen
{********************************************************************************************************}

procedure TfrmMedKardLst.odsKardoperBeforeOpen(DataSet: TDataSet);
begin
	odsKardoper.SetVariable('PFK_ID', odsMedKart.FieldByName('KARTID').AsInteger);
end;

procedure TfrmMedKardLst.odsMedKartAfterPost(DataSet: TDataSet);
begin
  odsMedKart.AfterScroll := odsMedKartAfterScroll;
  odsMedKartAfterScroll(nil);
end;

procedure TfrmMedKardLst.odsMedKartBeforePost(DataSet: TDataSet);
begin
  odsMedKart.AfterScroll := nil;
end;

{********************************************************************************************************}
{        TfrmMedKardLst.odsListAfterScroll
{********************************************************************************************************}

procedure TfrmMedKardLst.odsMedKartAfterScroll(DataSet: TDataSet);
begin
  odsKardoper.Close;
  dsKardOper.DataSet:=nil;
  try
    odsKardoper.Open;
    odsKardoper.First;
  finally
    dsKardOper.DataSet:= odsKardoper;
  end;
end;

procedure TfrmMedKardLst.odsMedKartApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean; var NewRowId: string);
begin
  Applied := True;
end;

{****************************************************************************************}
{                                 TfrmMedKardLst.FormDestroy
{****************************************************************************************}

procedure TfrmMedKardLst.FormDestroy(Sender: TObject);
begin
  if true or bEditKardOper then //#todo2 Переделать на олкальные датасеты, чтобы не мерцало
  begin
    odsMedKart.AfterScroll := nil;
    odsMedKart.AfterOpen := nil;
  end;
end;

{****************************************************************************************}
{                                 TfrmMedKardLst.odsMedKartBeforeOpen
{****************************************************************************************}

procedure TfrmMedKardLst.dbgDblClick(Sender: TObject);
begin
  if acSelect.Enabled then acSelect.Execute else acEdit.Execute;
end;
{
procedure TfrmMedKardLst.DBEhSortGrid1DblClick(Sender: TObject);
var str    : String;
		idDocs : Integer;
		dDate: TDateTime;
begin
  idDocs := odsKardoper.FieldByName('dpid').AsInteger;
//------------------------------приход----------------------------------------
  if odsKardoper.FieldByName('FP_VID').AsInteger = 1 then
  begin
    dmmain.ncomment := 'изменение';
    Screen.Cursor := crSQLWait;
    dmMain.os.Savepoint('prih');
		Application.CreateForm(TfrmPrihEdit, frmPrihEdit);
		frmPrihEdit.thisformcalledfrom_frmMedKartLst:=true;
		frmPrihEdit.odskart.SetVariable('adpid', odsKardoper.FieldByName('dpid').AsInteger);
    frmPrihEdit.odskart.refresh;
    odsEdit.SetVariable('DPID',idDocs);
    odsEdit.Close;
    odsEdit.Open;
		frmPrihEdit.idDocs := idDocs;
    frmPrihEdit.cePriceDoc.Value := odsEdit.FieldByName('FN_PRICE').AsFloat;
		frmPrihEdit.LCBPostav.KeyValue := odsEdit.FieldByName('POSTAVID').AsFloat;
//		frmPrihEdit.LCBNameto.KeyValue := odsEdit.FieldByName('motoid').AsInteger;
//		frmPrihEdit.deRegistrDate.Date := odsEdit.FieldByName('FD_DATA').AsDateTime; было
		dDate:=odsEdit.FieldByName('FD_DATA').AsDateTime;
		ndata:=odsEdit.FieldByName('FD_DATA').AsDateTime;
		frmPrihEdit.deRegistrDate.Date := trunc(dDate);
		frmPrihEdit.deRegistrTime.Time := dDate - trunc(dDate);

		frmPrihEdit.eNumDoc.Text := odsEdit.FieldByName('fc_doc').AsString;
    frmPrihEdit.deInvoiceDate.Date := odsEdit.FieldByName('fd_invoice').AsDateTime;

    frmPrihEdit.mComment.Text := odsEdit.FieldByName('fc_comment').AsString;
    // Документ только для чтения, или дата документа находиться в закрытом периоде
    if (odsEdit.FieldByName('FD_DATA').AsDateTime <= dateclose) then
    begin
      frmPrihEdit.EnableInput( False ); 
//			frmPrihEdit.eNumDoc.Enabled := false;
//      frmPrihEdit.deInvoiceDate.Enabled := frmPrihEdit.eNumDoc.Enabled;
//      frmPrihEdit.deRegistrDate.Enabled := false;
//      frmPrihEdit.LCBpostav.Enabled := false;
//      frmPrihEdit.LCBnameTo.Enabled := false;
//      frmPrihEdit.mComment.Enabled := false;
//      frmPrihEdit.bEnableEdit := False;
//      frmPrihEdit.acedit.Enabled := false;
      frmPrihEdit.cxDBgPrihKartDBTableView1.OnDblClick := nil;
    end;
    if frmPrihEdit.ShowModal = mrOk then
    begin
      // Добавляем приходной документ
      dmMain.PkgPrihRash.DoSet(
              dmMain.PkgPrihRash.Getsumdoc(idDocs, 1),
              frmprihEdit.mComment.text,
              frmprihEdit.eNumDoc.text,
              frmprihEdit.deInvoiceDate.Date,
							frmprihEdit.deRegistrDate.Date + frmPrihEdit.deRegistrTime.Time - Trunc(frmPrihEdit.deRegistrTime.Time),  //ndata, было
              -1, //frmprihEdit.odsNametoPrih.fieldbyname('moid').AsInteger,
              nvl(frmprihEdit.lcbMO_GROUP_TO.KeyValue, 0),
							idDocs,
							frmprihEdit.odsPostav.fieldbyname('postavid').asinteger, 0, 1
      );
      RefreshQuery(odsKardoper);
//      dmMain.pkgkl.SetPostavid(frmprihEdit.odsPostav.fieldbyname('postavid').asinteger);
      dmMain.os.Commit;
      if frmPrihEdit.datechange then
      begin
				str := 'Будет произведен пересчет остатков за период c %s по %s . Суммы в расходных документах будут изменены! Продолжить?';
        str := Format(str, [DateToStr(dateclose), DateToStr(date)]);
        if windows.MessageBoxEx(Self.Handle, PChar(str), 'Предупреждение', MB_YESNO + MB_ICONQUESTION, $0419 ) = mrYes then
        begin
          oq.SetVariable('adpid', idDocs);
          oq.SetVariable('adata1', dateclose + 1);
          oq.SetVariable('adata2', date + time + 14);
          Screen.Cursor := crSQLWait;
          oq.Execute;
          screen.Cursor := crDefault;
          dmMain.os.Commit;
        end;
      end;
    end
    else dmMain.os.RollbackToSavepoint('prih');
  end

//--------------приход, который расход-------------------------------

  else if (odsKardoper.FieldByName('FP_VID').AsInteger = 3) and
		(odsKardoper.FieldByName('FP_VIDMOVE').AsInteger in [4,5,7]) then
  begin
    idDocs := odsKardoper.FieldByName('dpid').AsInteger;
    odsEdit.SetVariable('DPID',idDocs);
    odsEdit.Close;
    odsEdit.Open;
//    if true or (odsEdit.FieldByName('MOTOID').AsInteger = dmMain.pkgMedSes.GetCurmo) then
    begin
      dmMain.os.Savepoint('move');
      dmmain.ncomment:='изменение';
  //    flIns := false;
      try
        Screen.Cursor := crSQLWait;

        Application.CreateForm(TfrmMoveEdit, frmMoveEdit);
        frmMoveEdit.Caption := 'Регистрация приходного документа';

        frmMoveEdit.flIns := False;
        frmMoveEdit.idDocs := idDocs;
        frmMoveEdit.MOOWNERID := odsEdit.FieldByName('MOOWNERID').AsInteger;
        frmMoveEdit.FD_DATA := odsEdit.FieldByName('FD_DATA').AsDateTime;
        frmMoveEdit.bCanEdit := False;

				ndata:=odsEdit.FieldByName('FD_DATA').AsDateTime;
    //    //возврат
    //    if odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = 6 then
    //    begin
    //      frmMoveEdit.bReturn := True;
    //      frmMoveEdit.LCBPostav.Enabled := True;
    //      frmMoveEdit.LCBTo.Enabled := True;
    //    end;
//        if true or (odsEdit.FieldByName('FL_EDIT').AsInteger = 0) then  //подписанно
        begin  //дизабле всегда, открывать только по магии
          frmMoveEdit.EnableInput( False );
          frmMoveEdit.cxGridRashKartDBTableView1.OnDblClick := nil;
        end;
        frmMoveEdit.odskart.SetVariable('adpid', odsEdit.FieldByName('dpid').AsInteger);
        frmMoveEdit.odskart.Close;
        frmMoveEdit.odskart.Open;
        frmMoveEdit.cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 2);
//        frmMoveEdit.LCBPostav.KeyValue := odsEdit.fieldbyname('mofromid').asinteger;
        frmMoveEdit.lcbMO_GROUP_FROM.KeyValue := odsEdit.fieldbyname('FK_MOGROUPID_FROM').asinteger;
//        frmMoveEdit.LCBto.KeyValue := odsEdit.fieldbyname('motoid').asinteger;
        frmMoveEdit.lcbMO_GROUP_TO.EditValue := odsEdit.fieldbyname('FK_MOGROUPID_TO').asinteger;
        frmMoveEdit.deRegisterDate.Date := odsEdit.fieldbyname('fd_data').asdatetime;
        frmMoveEdit.eNumDoc.Text := odsEdit.fieldbyname('fc_doc').asstring;
        frmMoveEdit.deInvoiceDate.Date := odsEdit.fieldbyname('fd_Invoice').AsDateTime;
        frmMoveEdit.mComment.Text := odsEdit.fieldbyname('fc_comment').asstring;
        if frmMoveEdit.ShowModal = mrok then
        begin
          dmMain.PkgPrihRash.DoSet(dmMain.PkgPrihRash.Getsumdoc(idDocs, 2),
            frmMoveEdit.mComment.text,
            frmMoveEdit.eNumDoc.text,
            frmMoveEdit.deInvoiceDate.Date,
            frmMoveEdit.deRegisterDate.date,
            -1, //frmMoveEdit.LcbTo.KeyValue,
            nvl(frmMoveEdit.lcbMO_GROUP_TO.EditValue, 0),
            idDocs,
            -1, //frmMoveEdit.lcbPostav.KeyValue,
            nvl(frmMoveEdit.lcbMO_GROUP_FROM.KeyValue, 0),
             2);
          RefreshQuery(odsKardoper);
          dmMain.os.Commit;
        end
        else
          dmMain.os.RollbackToSavepoint('move');
      finally
        Screen.Cursor := crDefault;
      end;
    end;
	end
  else if (odsKardoper.FieldByName('FP_VID').AsInteger = 3) and
		(odsKardoper.FieldByName('FP_VIDMOVE').AsInteger=8) then
  begin     //акт списания
    idDocs := odsKardoper.FieldByName('dpid').AsInteger;
    odsEdit.SetVariable('DPID',idDocs);
    odsEdit.Close;
    odsEdit.Open;
			dmMain.os.Savepoint('move');
      dmmain.ncomment:='изменение';
  //    flIns := false;
      try
        Screen.Cursor := crSQLWait;

        Application.CreateForm(TfrmMoveEdit, frmMoveEdit);
        frmMoveEdit.Caption := 'Регистрация акта списания';

        frmMoveEdit.flIns := False;
        frmMoveEdit.idDocs := idDocs;
        frmMoveEdit.MOOWNERID := odsEdit.FieldByName('MOOWNERID').AsInteger;
        frmMoveEdit.FD_DATA := odsEdit.FieldByName('FD_DATA').AsDateTime;
        frmMoveEdit.bCanEdit := False;

				ndata:=odsEdit.FieldByName('FD_DATA').AsDateTime;
        frmMoveEdit.EnableInput( False );
//				frmMoveEdit.LCBTo.visible := false;
				frmMoveEdit.laTo.visible := false;
				frmMoveEdit.lbDemand.caption:='Акт списания №';

				frmMoveEdit.cxGridRashKartDBTableView1.OnDblClick := nil;

				frmMoveEdit.odskart.SetVariable('adpid', odsEdit.FieldByName('dpid').AsInteger);
        frmMoveEdit.odskart.Close;
        frmMoveEdit.odskart.Open;
        frmMoveEdit.cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 2);
//        frmMoveEdit.LCBPostav.KeyValue := odsEdit.fieldbyname('mofromid').asinteger;
//        frmMoveEdit.LCBto.KeyValue := odsEdit.fieldbyname('motoid').asinteger;
        frmMoveEdit.deRegisterDate.Date := odsEdit.fieldbyname('fd_data').asdatetime;
        frmMoveEdit.eNumDoc.Text := odsEdit.fieldbyname('fc_doc').asstring;
        frmMoveEdit.deInvoiceDate.Date := odsEdit.fieldbyname('fd_Invoice').AsDateTime;
        frmMoveEdit.mComment.Text := odsEdit.fieldbyname('fc_comment').asstring;
        if frmMoveEdit.ShowModal = mrok then
        begin
          dmMain.PkgPrihRash.DoSet(dmMain.PkgPrihRash.Getsumdoc(idDocs, 2),
            frmMoveEdit.mComment.text,
            frmMoveEdit.eNumDoc.text,
            frmMoveEdit.deInvoiceDate.Date,
            frmMoveEdit.deRegisterDate.date,
            -1,
            0,
            idDocs,
            -1, //frmMoveEdit.lcbPostav.KeyValue,
            nvl(frmMoveEdit.lcbMO_GROUP_FROM.KeyValue, 0),
             2);
          RefreshQuery(odsKardoper);
          dmMain.os.Commit;
        end
        else
          dmMain.os.RollbackToSavepoint('move');
      finally
        Screen.Cursor := crDefault;
      end;
	end;

end;
}
procedure TfrmMedKardLst.FormActivate(Sender: TObject);
begin
	odsMedKart.AfterScroll := odsMedKartAfterScroll;
  if cxGridMedicDBTableView1FN_SUMM.Width < 150 then   cxGridMedicDBTableView1FN_SUMM.Width := 150;

  cxGridMedicDBTableView1.RestoreFromIniFile(medkartlst_ini, True, False, [gsoUseFilter]);

  cxGridMedicDBTableView1FL_CHECK.Visible := cxGridMedicDBTableView1FL_CHECK.VisibleForCustomization;

  cxGridMedicDBTableView1FK_SKLAD_ID.VisibleForCustomization := (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1);
  if cxGridMedicDBTableView1FK_SKLAD_ID.VisibleForCustomization = False then
    cxGridMedicDBTableView1FK_SKLAD_ID.Visible := False;

  if dmMain.ConfigParams.GetParamValue('FUNC_FAS_EI_UHC', 0) = 0 then
  begin
    cxGridMedicDBTableView1FN_FPACKINUPACK.Visible := False;
    cxGridMedicDBTableView1FC_FEDIZM.Visible := False;
    cxGridMedicDBTableView1FN_FAS_KOLOST.Visible := False;
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 0 then
  begin
    cxGridMedicDBTableView1FK_FINSOURCE_ID.Visible := False;
    cxGridMedicDBTableView1FK_FINSOURCE_ID.VisibleForCustomization := False;
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_INV_NOMER', 0) = 1 then
  begin
    cxGridMedicDBTableView1FC_INV_NOMER.Visible := True;
    cxGridMedicDBTableView1FC_INV_NOMER.VisibleForCustomization := True;
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 0) then
  begin
    cxGridMedicDBTableView1FC_QUOTA_CODE.Visible := False;
    cxGridMedicDBTableView1FC_QUOTA_CODE.VisibleForCustomization := False;
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_NDS', 0) = 0 then
  begin
    cxGridMedicDBTableView1FN_NDS.VisibleForCustomization := False;
    cxGridMedicDBTableView1FN_NDS.Visible                 := False;
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_NACENKA', 0) = 0 then
  begin
    cxGridMedicDBTableView1FN_NACENKA.VisibleForCustomization := False;
    cxGridMedicDBTableView1FN_NACENKA.Visible                 := False;
    cxGridMedicDBTableView1FN_PRICE_MNF.VisibleForCustomization := False;
    cxGridMedicDBTableView1FN_PRICE_MNF.Visible                 := False;
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_JNVLS', 0) = 0 then
  begin
    cxGridMedicDBTableView1FL_JNVLS.VisibleForCustomization := False;
    cxGridMedicDBTableView1FL_JNVLS.Visible                 := False;
  end;      

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_OKDP', 0) = 0 then
  begin
    cxGridMedicDBTableView1FC_OKDP.VisibleForCustomization := False;
    cxGridMedicDBTableView1FC_OKDP.Visible                 := False;
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_MIBP', 0) = 0 then
  begin
    cxGridMedicDBTableView1FL_MIBP.VisibleForCustomization := False;
    cxGridMedicDBTableView1FL_MIBP.Visible                 := False;
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_FORMULAR', 0) = 0 then
  begin
    cxGridMedicDBTableView1FL_FORMULAR.VisibleForCustomization := False;
    cxGridMedicDBTableView1FL_FORMULAR.Visible                 := False;
  end;  

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_CLASS', 0) = 0 then
  begin
    cxGridMedicDBTableView1FC_CLASS.VisibleForCustomization := False;
    cxGridMedicDBTableView1FC_CLASS.Visible                 := False;
  end;
end;

procedure TfrmMedKardLst.acCalcOstByKartExecute(Sender: TObject);
var
    oq           : TOracleQuery;
    str          : String;
    dDate        : TDateTime;
begin
  Exit; // добавил Воронов О.А. - чтобы вообще исключить возможность срабатывания перерасчета
  oq := TOracleQuery.Create(nil);
  try
    dDate := ServerDate(dmMain.os);
    Str := Format('Будет произведен пересчет остатков для "%s"' + #10#13 + 'за период c %s по %s .' + #10#13 +
                   'Суммы в расходных документах будут изменены! Продолжить?',
             [odsMedKart.FieldByName('FC_NAME').AsString,DateToStr(dateclose), DateToStr(dDate)]);
    if windows.MessageBoxEx(Self.Handle, PChar(Str), 'Предупреждение', MB_YESNO + MB_ICONQUESTION,$0419 {Russian}) = mrYes then
    begin
      screen.Cursor := crSQLWait;
      oq.Session := dmMain.os;
      oq.Sql.Text := 'begin dosetpricework(trunc(:pDATE1),trunc(:pDATE2),:kartid); end;';
      oq.DeclareVariable('pDATE1',otDate);
      oq.DeclareVariable('pDATE2',otDate);
      oq.DeclareVariable('kartid',otInteger);
      oq.SetVariable('pDATE1',dateclose);
      oq.SetVariable('pDATE2',dDate);
      oq.SetVariable('kartid',odsMedKart.FieldByName('KARTID').AsInteger);
      oq.Execute;
      acRefreshExecute(nil);
      if windows.MessageBoxEx(Self.Handle, 'Сохранить изменения?', 'Подтверждение', MB_ICONQUESTION or MB_YESNO,$0419 {Russian}) = idyes then dmMain.os.Commit
      else dmMain.os.RollBack;
//        dmMain.os.Commit;
    end;
  finally
    screen.Cursor := crDefault;
    oq.Free;
  end;
end;

procedure TfrmMedKardLst.dbgFilterChanged(Sender: TObject;
  ADataSet: TDataSet; const AFilterText: String);
begin
//	if idbg_Filter_Active=0 then idbg_Filter_Active:=1
//	else
//		Begin
//			if idbg_Filter_Active=1 then idbg_Filter_Active:=2;
//		end;
//	acSelect.Enabled := TdxdbGrid(Sender).Count <> 0;
//  acEdit.Enabled := acSelect.Enabled;
//	acDel.Enabled := acEdit.Enabled;
//	if TdxdbGrid(Sender).Count = 0 then odsKardOper.Close
//  else odsKardOper.Open;
end;

function TfrmMedKardLst.RefreshSQLText(pAddComments: Boolean = False): string;
begin
  Result := '';
  //
  if SelectRestriction <> '' then
    begin
      Result := Result + 'SELECT ';
      if FHintRestriction <> '' then Result := Result + FHintRestriction + ' ';
      Result := Result + SelectRestriction;
    end;
  //
  if FromRestriction <> '' then Result := Result+' FROM '+FromRestriction;
  //
  if WhereConstraint <> '' then
    begin
      Result := Result + ' WHERE ';
      if pAddComments then Result := Result + '/* WhereConstraint */ ';
      Result := Result + WhereConstraint;
    end
  else
    begin
      if WhereRestriction <> '' then begin
        Result := Result + ' WHERE ';
        if pAddComments then Result := Result + '/* WhereRestriction */ ';
        Result := Result + WhereRestriction;
        if WhereAddition <> '' then
          begin
            Result := Result + ' AND ';
            if pAddComments then Result := Result + '/* WhereAddition */ ';
            Result := Result + WhereAddition;
          end;
      end;
    end;
  //
  if QBERestriction <> '' then begin
    if Pos(' WHERE ', Result) > 0 then
      begin
        Result := Result + ' AND ';
        if pAddComments then Result := Result + '/* QBERestriction */ ';
        Result := Result + QBERestriction;
      end
    else
      begin
        Result := Result + ' WHERE ';
        if pAddComments then Result := Result + '/* QBERestriction */ ';
        Result := Result + QBERestriction;
      end;
  end;
  //
  if GROUPRestriction <> '' then Result := Result+' GROUP BY '+GROUPRestriction;
  //
  if OrderRestriction <> '' then Result := Result+' ORDER BY '+OrderRestriction;
end;

procedure TfrmMedKardLst.SetbReturn(const Value: Boolean);
begin
// какое-то ненужное старье
  FbReturn := Value;
  if Value then
  begin
    odsMedKart.DeleteVariables;
//1 AS FN_PRICE, убрал из запроса
    FSelectRestriction := 'DISTINCT V.KARTID, FC_SERIAL, TRUNC(FD_GODEN) AS FD_GODEN, ' +
      'FC_UEDIZM, 1 AS FN_KOL, MOID AS M, TRUNC(SYSDATE + 1) AS D, ' +
      'FC_MEDIC, FC_NAME, MEDICID, FC_MONAME, FC_EANCODE, FK_MEDICTYPENAME, ' +
      'FC_MEDICTYPENAME, FK_PAYTYPE, FC_PAYTYPE, FN_FPACKINUPACK, FK_FPACKID, ' +
      'FC_FEDIZM, V.FN_KOLOST, V.FN_PRICE, V.FN_SUMM';
		FFromRestriction := 'MED.VMEDKART_VS_OST V, MED.TDOCS, MED.TDPC';
		FWhereRestriction :=
			'V.KARTID = TDPC.KARTID AND TDOCS.DPID = TDPC.DPID ' +
			'AND MED.TDOCS.FP_VID = 3 AND MED.TDOCS.FP_VIDMOVE IN (5,7) AND MED.TDOCS.MOTOID = :MOID ' +
//      'AND TDOCS.FD_DATA BETWEEN PKG_MEDSES.GET_DATA1 AND PKG_MEDSES.GET_DATA2 ' +
			'AND FN_KOLOST <> 0 ' + FWhereAddition;
{		FWhereRestriction :=
			'V.KARTID = TDPC.KARTID AND TDOCS.DPID = TDPC.DPID ' +
			'AND TDOCS.FP_VID = 3 AND TDOCS.FP_VIDMOVE = 5 AND TDOCS.MOTOID = :MOID ' +
//      'AND TDOCS.FD_DATA BETWEEN PKG_MEDSES.GET_DATA1 AND PKG_MEDSES.GET_DATA2 ' +
			'AND FN_KOLOST > 0 ' + FWhereAddition;}
		FOrderRestriction := 'FC_NAME';

    odsMedKart.Sql.Text := RefreshSQLText;

//    odsMedKart.DeclareVariable('MOID', otInteger);
//    odsMedKart.SetVariable('MOID', nMOID);
  end;
end;

procedure TfrmMedKardLst.cbShowNullsClick(Sender: TObject);
begin
  if TCheckBox(Sender).Checked then
  begin
    FWhereRestriction := StringReplace(FWhereRestriction, FILTER_OST_NOT_NULL, FILTER_OST_IS_NULL,[]);
//    if FWhereRestriction = '' then FWhereRestriction := '1=1';
    odsMedKart.Sql.Text := RefreshSQLText;
    acRefreshExecute(nil);
  end
  else
  begin
    if FWhereRestriction = '' then FWhereRestriction := '1=1';
    FWhereRestriction := StringReplace(FWhereRestriction, FILTER_OST_IS_NULL,'',[]);
    FWhereRestriction := FWhereRestriction + ' ' + FILTER_OST_NOT_NULL;
    odsMedKart.Sql.Text := RefreshSQLText;
    acRefreshExecute(nil);
  end;
  cxGridMedic.SetFocus;
end;

procedure TfrmMedKardLst.frLittleKartGetValue(const ParName: String;
  var ParValue: Variant);
begin
//todo3 переделать на значения из датасета
//  todo3 - сделано Вороновым через фильтрацию odsMedKart по KARTID
//	if ParName = 'var_ost' then
//		ParValue := dmMain.pkgMedKart.GetOst(odsMedKart.FieldByName('KARTID').AsInteger,ServerDate(dmMain.Os),
//      dmMain.pkgMedSes.GetCurmo)
//  else if ParName = 'var_price' then
//    ParValue := dmMain.pkgprihrash.GetLastnewprice(odsMedKart.FieldByName('KARTID').AsInteger,ServerDate(dmMain.Os),
//      dmMain.pkgMedSes.GetCurmo)
//	else if ParName = 'var_FC_NAME_LAT' then
//		ParValue := dmMain.PKGMEDKART.GETFCNAMELATBYID(odsMedKart.FieldByName('KARTID').AsInteger);

end;

procedure TfrmMedKardLst.gbColorDecodeClick(Sender: TObject);
begin
  frmSrokyColorOption := TfrmSrokyColorOption.Create(Application);
  if frmSrokyColorOption.ShowModal = mrOK then
  begin
    nSrokyRangeRed    := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_RED_RANGE_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr(dmMain.ConfigParams.GetParamValue('FUNC_COLORED_KART_BY_SROKY_RED_RANGE', 1))));
    nSrokyRangeYellow := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_YELLOW_RANGE_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr(dmMain.ConfigParams.GetParamValue('FUNC_COLORED_KART_BY_SROKY_YELLOW_RANGE', 7))));
    nSrokyRangeGreen  := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_GREEN_RANGE_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr(dmMain.ConfigParams.GetParamValue('FUNC_COLORED_KART_BY_SROKY_GREEN_RANGE', 31))));
    
    imRed.Style.Color    := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_RED_RANGE_COLOR_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr($00AAAAFF)));
    imYellow.Style.Color := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_YELLOW_RANGE_COLOR_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr($00AAFFFF)));
    imGreen.Style.Color  := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_GREEN_RANGE_COLOR_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr($00AAFFAA)));

    imRed.Hint := 'Партии со сроком годности, истекающим через '+IntToStr(nSrokyRangeRed)+' дней либо уже истёкшим';
    imYellow.Hint := 'Партии со сроком годности, истекающим через '+IntToStr(nSrokyRangeYellow)+' дней';
    imGreen.Hint := 'Партии со сроком годности, истекающим через '+IntToStr(nSrokyRangeGreen)+' дней';
    cxGridMedic.Invalidate();
  end;
  frmSrokyColorOption.Free;   
end;

function TfrmMedKardLst.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin

	Result := False;
  try
    // TODo Подумать насчет праметра  Command
    if Data = -1 then
      HtmlHelp(0, PChar('Medica.chm'), HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, PChar('Medica.chm'), HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
  end;

end;

procedure TfrmMedKardLst.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not tmrEANCode.Enabled then tmrEANCode.Enabled := True; // после каждого нажатия включаем таймер на очистку буфера цифр

  if (Key = 13) then                                         // таким образом, если перед перед использование сканера
  begin                                                      // делали быстрый поиск (IncSearch), то буфер очистится
    FIs13KeyPressed := True;
  end
  else
  begin
    FIs13KeyPressed := False;
    FEAN13Code1 := FEAN13Code1 +  GetCharFromVirtualKey(Key);
  end;
end;

procedure TfrmMedKardLst.FormShow(Sender: TObject);
var
  i : Integer;
begin
  //Для работы со сканером штрих-кодов
//  if IsModal then

//  cxGridMedicDBTableView1.OptionsData.Editing := cxGridMedicDBTableView1.OptionsData.Editing or (FIsShtrihCodeInput = True);
  cxGridMedicDBTableView1.OptionsSelection.CellSelect := True;

  if FIsShtrihCodeInput = True then
  begin
//    for i := 0 to cxGridMedicDBTableView1.ColumnCount-1 do
//    begin
//      cxGridMedicDBTableView1.Columns[i].Options.Editing := False;
//    end;
//    cxGridMedicDBTableView1FC_EANCODE.Options.Editing  := True;
    cxGridMedicDBTableView1FC_EANCODE.Width := 105;
    cxGridMedicDBTableView1FC_EANCODE.Visible := True;
    cxGridMedic.SetFocus;
    cxGridMedicDBTableView1FC_EANCODE.Focused := True;// Selected := True;
    acSelect.ShortCut := 0;
    FEAN13Code1 := '';
//    FEAN13Code2 := '';
  end;
//  cxGridMedicDBTableView1FL_CHECK.Options.Editing  := True;
  cxGridMedic.SetFocus;
  /////Для работы со сканером штрих-кодов
end;

procedure TfrmMedKardLst.cxGridPrihRashDBTableView1DblClick( Sender: TObject );
var
	idDocs : Integer;
    
begin
  idDocs := odsKardoper.FieldByName('dpid').AsInteger;
  DoShowMoveEdit(idDocs, False);
end;

procedure TfrmMedKardLst.cxGridMedicDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
  ost, lastNewPrice : Double;
  FN_UP_KOL, FN_FAS_KOL : double;
  i : integer;

begin
  StaticText1.Caption := '';
  laKolByOneMedics.Caption := ''; 
  if cxGridMedicDBTableView1.DataController.FilteredRecordCount = 0 then exit;

  // вывод остатков
  ost := odsMedKart.FieldByName('FN_KOLOST').AsFloat;
  lastNewPrice := odsMedKart.FieldByName('FN_PRICE').AsFloat;
  if not odsMedKart.FieldByName('FN_FPACKINUPACK').IsNull then
    StaticText1.Caption := Format(' Остаток: %g (%g), цена: %.2fр.', [ost,
      ost * odsMedKart.FieldByName('FN_FPACKINUPACK').AsFloat,lastNewPrice])
  else
    StaticText1.Caption := Format(' Остаток: %g, цена: %.2fр.', [ost,lastNewPrice]);

  // вывод общих остатков
  if Assigned(AFocusedRecord) then
  begin
    FN_UP_KOL := 0; FN_FAS_KOL := 0;
    for i := 0 to  cxGridMedicDBTableView1.DataController.FilteredRecordCount - 1 do
    begin
      if cxGridMedicDBTableView1.DataController.Values[cxGridMedicDBTableView1.DataController.FilteredRecordIndex[i], cxGridMedicDBTableView1MEDICID.Index] =
         AFocusedRecord.Values[cxGridMedicDBTableView1MEDICID.Index] then
      begin
        FN_UP_KOL  := FN_UP_KOL  + cxGridMedicDBTableView1.DataController.Values[cxGridMedicDBTableView1.DataController.FilteredRecordIndex[i], cxGridMedicDBTableView1FN_KOLOST.Index];
        FN_FAS_KOL := FN_FAS_KOL + cxGridMedicDBTableView1.DataController.Values[cxGridMedicDBTableView1.DataController.FilteredRecordIndex[i], cxGridMedicDBTableView1FN_FAS_KOLOST.Index];
      end;
    end;
    laKolByOneMedics.Caption := Format('Общий остаток: %g %s (%g %s)', [FN_UP_KOL,  AFocusedRecord.Values[cxGridMedicDBTableView1FC_UEDIZM.Index],
                                                                        FN_FAS_KOL, AFocusedRecord.Values[cxGridMedicDBTableView1FC_FEDIZM.Index]]);
    end;
end;

procedure TfrmMedKardLst.cxGridMedicDBTableView1pr_borderCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
   ACanvas.Font.Style:= [fsBold];
   ACanvas.Font.Color:= clRed;
//   ACanvas.Font.Size:=8;
//   (AViewInfo as TcxGridTableDataCellViewInfo).HintText:='123 lalala';
end;

procedure TfrmMedKardLst.cxGridMedicDBTableView1pr_borderGetCellHint(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
  var AHintText: TCaption; var AIsHintMultiLine: Boolean;
  var AHintTextRect: TRect);
var v_val{, v_tmp, v_minz}: Variant; //v_otn : Extended;
 { function f_IfNull(p_val:Variant):Variant;
  begin
    if VarIsNull(v_tmp) then
    begin
      Result:=0;
    end else
    begin
      if VarIsEmpty(v_tmp) then
      begin
        Result:=0;
      end
      else
        Result:=p_val;
    end;
  end; }
begin
  v_val := ARecord.Values[ cxGridMedicDBTableView1pr_border.Index ];
  if VarIsNull(v_val) then
  begin
    AHintText:='';
  end else
  begin
    if VarIsEmpty(v_val) then
    begin
      AHintText:='';
    end else
    begin
      if Trim(v_val)<>''
      then
      begin
        AHintText:='Необходимо пополнить мин. запас !';
      end else
      begin
        AHintText:='';
      end;
    end;
  end;
end;

procedure TfrmMedKardLst.SetIsSelectShow(const Value: Boolean);
begin
  FIsSelectShow := Value;

  paCur.Visible := (not FIsSelectShow and (frmMain.ProvisorState = 1)) or ((dmMain.ConfigParams.GetParamValue('FUNC_SHOW_OST_BY_DATE_NOT_ONLY_PROVIZOR', 0) = 1));
  paCur2.Visible := not FIsSelectShow and ((frmMain.ProvisorState = 1) or (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_OST_BY_GROUP_NOT_ONLY_PROVIZOR', 0) = 1));
  gbColorDecode.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_COLORED_KART_BY_SROKY', 1) = 1);
  gbClass.Visible       := (dmMain.ConfigParams.GetParamValue('FUNC_USE_CLASS', 0) = 1);
  tbuSepCurSett.Visible := paCur.Visible or paCur2.Visible;
  cbShowNulls.Visible   := not FIsSelectShow;

  tbuSelect.Visible   := FIsSelectShow;
  ToolButton9.Visible := FIsSelectShow;
  cxGridMedicDBTableView1.OptionsView.GroupByBox := not FIsSelectShow;

  acCheckSeeingPartiesByBrak.Visible := (FIsSelectShow = False)and(dmMain.ConfigParams.GetParamValue('FUNC_CHECK_BRAK', 0) = True)and(frmMain.ProvisorState = 1);
  acCheckSeeingPartiesByBrak.Enabled := acCheckSeeingPartiesByBrak.Visible;
  cxGridMedicDBTableView1BRAK_UNIQSTR.VisibleForCustomization := acCheckSeeingPartiesByBrak.Visible;
  cxGridMedicDBTableView1FL_BRAK.VisibleForCustomization := acCheckSeeingPartiesByBrak.Visible;
  cxGridMedicDBTableView1FL_BRAK.Visible                 := acCheckSeeingPartiesByBrak.Visible;
end;

procedure TfrmMedKardLst.cxGridMedicDBTableView1CustomDrawCell( Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
   nCntDay: integer;
begin    

  if AViewInfo.GridRecord.Values[ cxGridMedicDBTableView1FN_OST_TYPE.Index ] = '1' then
  begin
    ACanvas.Font.Style := ACanvas.Font.Style + [fsBold];
    ACanvas.Font.Color := $001428B6;
  end;

  case string(fdmMain.nvl(AViewInfo.GridRecord.Values[ cxGridMedicDBTableView1FL_BRAK.Index ],'3'))[1] of
   '3':
    begin
      ACanvas.Brush.Color := $00F0F0F0;
    end;
   '1':
    begin
      ACanvas.Font.Style := ACanvas.Font.Style + [fsStrikeOut];
      ACanvas.Brush.Color := $00FFAAFF;
    end;
  else
    ACanvas.Brush.Color := clWhite;    
  end;

  if (dmMain.sDB_NAME = 'SK') then
  begin
    if trim(AnsiLowerCase(AViewInfo.GridRecord.DisplayTexts[cxGridMedicDBTableView1FK_FINSOURCE_ID.Index ])) = 'федеральный бюджет' then
    begin
      ACanvas.Brush.Color := $00FFAAAA;
    end;   
  end;

//  if (dmMain.ConfigParams.GetParamValue('FUNC_COLORED_KART_BY_SROKY', 1) = 1) then
  if bFUNC_COLORED_KART_BY_SROKY = 1 then
  begin
    nCntDay := NVL(AViewInfo.GridRecord.Values[ cxGridMedicDBTableView1FD_GODEN.Index ],trunc(dmMain.dServerDate) + 1356)-trunc(dmMain.dServerDate);
    if nCntDay <= nSrokyRangeRed then begin ACanvas.Brush.Color := imRed.Style.Color; end
    else if nCntDay <= nSrokyRangeYellow then begin ACanvas.Brush.Color := imYellow.Style.Color; end
    else if nCntDay <= nSrokyRangeGreen then begin ACanvas.Brush.Color := imGreen.Style.Color; end;
  end;

//  if dmMain.ConfigParams.GetParamValue('FUNC_USE_CLASS', 0) = 1 then
  if bFUNC_USE_CLASS = 1 then
  begin
    if AViewInfo.GridRecord.Values[ cxGridMedicDBTableView1FC_CLASS.Index ] = '2а' then
      ACanvas.Brush.Color := $7fff00
    else if AViewInfo.GridRecord.Values[ cxGridMedicDBTableView1FC_CLASS.Index ] = '2б' then
      ACanvas.Brush.Color := $03c03c
    else if AViewInfo.GridRecord.Values[ cxGridMedicDBTableView1FC_CLASS.Index ] = '3' then
      ACanvas.Brush.Color := $3300ff;
  end;

end;

procedure TfrmMedKardLst.deCurOstDatePropertiesEditValueChanged(Sender: TObject);
begin
  if not TcxDateEdit(Sender).ValidateEdit(True) then Exit;
  if Trunc(deCurOstDate.Date) = Trunc(ServerDate(dmMain.os)) then
    deCurOstDate.Style.Font.Color := clWindowText
  else
    deCurOstDate.Style.Font.Color := clRed;

  if not FIsNowFormCreate then acRefresh.Execute;
end;

procedure TfrmMedKardLst.lcbCurOstGroupPropertiesEditValueChanged(
  Sender: TObject);
begin
  if not FIsNowFormCreate then
  begin
    odsKardoper.SetVariable('MO_GROUPID', lcbCurOstGroup.EditValue);
    acRefresh.Execute;
  end;
end;

procedure TfrmMedKardLst.deCurOstDatePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  // проверка на валидность срока годности
  if not ( IsValidDateEditValue( TcxDateEdit(Sender).Text) ) then
  begin
//    TcxDateEdit(Sender).EditValue := ServerDate(dmMain.os);
    TcxDateEdit(Sender).Undo;
    DisplayValue := TcxDateEdit(Sender).Text;
    TcxDateEdit(Sender).SetFocus;
    Error := True;
  end;
end;

procedure TfrmMedKardLst.tbuExcelClick(Sender: TObject);
begin
  if sd.Execute then
  begin
    ExportGridToExcel(sd.FileName,cxGridMedic);
    if Application.MessageBox('Открыть сохраненный документ?', 'Подтверждение', MB_YESNO+MB_ICONQUESTION) = IDYES	then
      ShellExecute( 0, PChar('open'), PChar(sd.FileName), nil, nil, SW_SHOWMAXIMIZED );
  end;
end;

procedure TfrmMedKardLst.tbuSkladSelectClick(Sender: TObject);
var
  P : TPoint;
begin
  if FOnlySkladID <> 0 then Exit; // ограничитель склада

  dmSkladSelect.SkladID := -1;
  dmSkladSelect.SetRadioCheckBySkladID( tbuSkladSelect.Tag );
  if dmSkladSelect.SkladID < 0 then
  begin
    P.X := 0;
    P.Y := tbuSkladSelect.Height;
    P := tbuSkladSelect.ClientToScreen(P);
    dmSkladSelect.pmSkladSelect.Popup(P.X, P.Y);
    Application.ProcessMessages;
  end;
  if ( dmSkladSelect.SkladID >= 0 ) then
    IniWriteString( iniFileName, 'fMedKardlst', 'tbuSkladSelect.Tag', IntToStr( dmSkladSelect.SkladID ) );

  if dmSkladSelect.SkladID < 0 then Exit;
  try
    tbuSkladSelect.Tag := dmSkladSelect.SkladID;
//    // фильтрация по типу склада
//    if tbuSkladSelect.Tag = 0 then
//      odsMedKart.SetVariable('PFK_SKLAD_ID', 0)
//    else
//      odsMedKart.SetVariable('PFK_SKLAD_ID', dmSkladSelect.SkladID);
    acRefresh.Execute;
    
  finally
    dmSkladSelect.SkladID := -1;
  end;
end;

procedure TfrmMedKardLst.tmrEANCodeTimer(Sender: TObject);
var
   nPos : Integer;
   sFilter: String;
begin
  tmrEANCode.Enabled := False;

  if (FIs13KeyPressed)and(FEAN13Code1 <> '') then
  begin
    odsMedKart.AfterScroll := nil;
    sFilter := odsMedKart.Filter;
    odsMedKart.Filtered := False;

    nPos := Pos('FC_EANCODE',sFilter);
    if (nPos > 0) then
    begin
      if (Length(sFilter) > 30) then
        Delete(sFilter,nPos - 6,35)
      else
        sFilter := '';
    end;

    if sFilter <> '' then
      sFilter := sFilter + ' AND ';
      
    sFilter := sFilter + '(FC_EANCODE = '''+trim(FEAN13Code1)+''')';
    SaveToLog('frmMedKardLst - EANCODE_filter', sFilter);
    odsMedKart.Filter := sFilter;
    odsMedKart.Filtered := True;
    odsMedKart.AfterScroll := odsMedKartAfterOpen;
    odsMedKartAfterOpen(odsMedKart);
    if odsMedKart.RecordCount = 1 then acSelect.Execute;
  end;
  FEAN13Code1 := '';
end;

procedure TfrmMedKardLst.cxGridMedicDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
  var v_FUNC_MOVE_TO_OR_FROM_REZERV : Boolean;
    kartid, FN_OST_TYPE, v_FUNC_RESTRICT_REZERV : integer;
    UNIQ_STR : string;
begin
  if (AButton = mbRight)and(frmMain.ProvisorState = 1) then // медсестрам не даем делать забраковку
  begin
    v_FUNC_RESTRICT_REZERV := dmMain.ConfigParams.GetParamValue('FUNC_RESTRICT_REZERV', 0);
    v_FUNC_MOVE_TO_OR_FROM_REZERV := dmMain.ConfigParams.GetParamValue('FUNC_MOVE_TO_OR_FROM_REZERV', false);
    if ( (ACellViewInfo.Item.Index = cxGridMedicDBTableView1FN_OST_TYPE.Index) and
         (v_FUNC_RESTRICT_REZERV = 0) )
        or ( (ACellViewInfo.Item.Index = cxGridMedicDBTableView1FN_OST_TYPE.Index) and
             (v_FUNC_RESTRICT_REZERV = 1) and
             v_FUNC_MOVE_TO_OR_FROM_REZERV ) then  // помещаем в резерв
    begin
      FN_OST_TYPE := ACellViewInfo.Value;
      case FN_OST_TYPE of
        0:
        begin
          kartid := odsMedKart.FieldByName('KARTID').AsInteger;
          oqMoveToRezerv.SetVariable('AKOL',    odsMedKart.FieldByName('FN_KOLOST').AsFloat  );
          oqMoveToRezerv.SetVariable('APRICE',  odsMedKart.FieldByName('FN_PRICE').AsFloat);
          oqMoveToRezerv.SetVariable('AKARTID', kartid);
          oqMoveToRezerv.Execute;

          odsMedKart.AfterScroll := nil;
          odsMedKart.Close;
          odsMedKart.Open;
          odsMedKart.Locate('kartid;FN_OST_TYPE', VarArrayOf([kartid, 1]), []);
          odsMedKart.AfterScroll := odsMedKartAfterScroll;
          odsMedKartAfterScroll(odsMedKart);
        end;

        1:
        begin
          kartid := odsMedKart.FieldByName('KARTID').AsInteger;
          oqMoveFromRezerv.SetVariable('DPCID', odsMedKart.FieldByName('DPCID').AsInteger);
          oqMoveFromRezerv.Execute;

          odsMedKart.AfterScroll := nil;
          odsMedKart.Close;
          odsMedKart.Open;
          odsMedKart.Locate('kartid;FN_OST_TYPE', VarArrayOf([kartid, 0]), []);
          odsMedKart.AfterScroll := odsMedKartAfterScroll;
          odsMedKartAfterScroll(odsMedKart);
        end;
      end;
      Exit;
    end
    else // if (ACellViewInfo.Item.Index = cxGridMedicDBTableView1FN_OST_TYPE.Index) then
    if (ACellViewInfo.Item.Index = cxGridMedicDBTableView1FC_SERIAL.Index) and
       (dmMain.ConfigParams.GetParamValue('FUNC_CHECK_BRAK', 0) = True) then // проверка партии на забраковку по серии
    begin
      UNIQ_STR := fdmMain.nvl(cxGridMedicDBTableView1BRAK_UNIQSTR.EditValue,'');
      if (DoCheckAndShowBrakSelect(self, Mouse.CursorPos.X, Mouse.CursorPos.Y,  UNIQ_STR, fdmMain.nvl(ACellViewInfo.Value,'') ) = True) then
      begin
        odsMedKart.AfterScroll := nil;
        cxGridMedicDBTableView1.DataController.Edit;
        cxGridMedicDBTableView1BRAK_UNIQSTR.EditValue := UNIQ_STR;
//        if(UNIQ_STR='') then
//          cxGridMedicDBTableView1FL_BRAK.EditValue := 0
//        else
        cxGridMedicDBTableView1FL_BRAK.EditValue := 1;

        dmMain.oqTemp.SQL.Text := 'UPDATE MED.TKART SET FL_BRAK = ' + VarToStr(cxGridMedicDBTableView1FL_BRAK.EditValue)
          + ' WHERE KARTID = ' + VarToStr(cxGridMedicDBTableView1KARTID.EditValue);
        dmMain.oqTemp.Execute;

        cxGridMedicDBTableView1.DataController.Post;
        odsMedKart.AfterScroll := odsMedKartAfterScroll;
      end;
//      else
//      begin
//        odsMedKart.AfterScroll := nil;
//        cxGridMedicDBTableView1.DataController.Edit;
//        cxGridMedicDBTableView1BRAK_UNIQSTR.EditValue := UNIQ_STR;
//        cxGridMedicDBTableView1FL_BRAK.EditValue := 0;
//
//        dmMain.oqTemp.SQL.Text := 'UPDATE MED.TKART SET FL_BRAK = ' + VarToStr(cxGridMedicDBTableView1FL_BRAK.EditValue)
//          + ' WHERE KARTID = ' + VarToStr(cxGridMedicDBTableView1KARTID.EditValue);
//        dmMain.oqTemp.Execute;
//
//        cxGridMedicDBTableView1.DataController.Post;
//        odsMedKart.AfterScroll := odsMedKartAfterScroll;
//      end;
      Exit;
    end
    else
    if (dmMain.ConfigParams.GetParamValue('FUNC_CHECK_BRAK', 0) = True ) and
       (ACellViewInfo.Item.Index = cxGridMedicDBTableView1FL_BRAK.Index) then // флаг забраковки
    begin
      odsMedKart.AfterScroll := nil;
      cxGridMedicDBTableView1.DataController.Edit;
      if fdmMain.nvl(cxGridMedicDBTableView1FL_BRAK.EditValue,0) = 0 then
        cxGridMedicDBTableView1FL_BRAK.EditValue := 1
      else
        if cxGridMedicDBTableView1FL_BRAK.EditValue = 1 then
          cxGridMedicDBTableView1FL_BRAK.EditValue := 0;

      dmMain.oqTemp.SQL.Text := 'UPDATE MED.TKART SET FL_BRAK = ' + VarToStr(cxGridMedicDBTableView1FL_BRAK.EditValue)
          + ' WHERE KARTID = ' + VarToStr(cxGridMedicDBTableView1KARTID.EditValue);
      dmMain.oqTemp.Execute;

      cxGridMedicDBTableView1.DataController.Post;
      odsMedKart.AfterScroll := odsMedKartAfterScroll;
      Exit;
    end
    else
    if (dmMain.ConfigParams.GetParamValue('FUNC_USE_JNVLS', 0) = 1) and
       (ACellViewInfo.Item.Index = cxGridMedicDBTableView1FL_JNVLS.Index) then // флаг ЖНВЛС
    begin
      odsMedKart.AfterScroll := nil;
      cxGridMedicDBTableView1.DataController.Edit;
      
      if fdmMain.nvl(cxGridMedicDBTableView1FL_JNVLS.EditValue,0) = 0 then
        cxGridMedicDBTableView1FL_JNVLS.EditValue := 1
      else
        if cxGridMedicDBTableView1FL_JNVLS.EditValue = 1 then
          cxGridMedicDBTableView1FL_JNVLS.EditValue := 0;

      dmMain.oqTemp.SQL.Text := 'UPDATE MED.TKART SET FL_JNVLS = ' + VarToStr(cxGridMedicDBTableView1FL_JNVLS.EditValue)
          + ' WHERE KARTID = ' + VarToStr(cxGridMedicDBTableView1KARTID.EditValue);
      dmMain.oqTemp.Execute;

      cxGridMedicDBTableView1.DataController.Post;
      odsMedKart.AfterScroll := odsMedKartAfterScroll;
      Exit;
    end;   

  end; // if (AButton = mbRight) then
end;

procedure TfrmMedKardLst.acCancelFilterEAN13Execute(Sender: TObject);
begin
  //if FIsShtrihCodeInput= True then
  begin
    // отмена фильтрации по нажатию кнопки Esc
    FEAN13Code1 := '';
    odsMedKart.AfterScroll := nil;
    odsMedKart.Filtered := False;
    odsMedKart.Filter := '';
    odsMedKart.AfterScroll := odsMedKartAfterScroll;
    odsMedKartAfterOpen(odsMedKart);
    odsMedKartAfterScroll(odsMedKart);
  end;
end;

procedure TfrmMedKardLst.acCheckSeeingPartiesByBrakExecute(Sender: TObject );
var
  fmBrakCheckProgress : TfmBrakCheckProgress;
begin
  cxGridMedicDBTableView1.OnFocusedRecordChanged := nil;
  fmBrakCheckProgress := TfmBrakCheckProgress.Create(Self);
  fmBrakCheckProgress.ShowModal;
  FreeAndNil(fmBrakCheckProgress);
  cxGridMedicDBTableView1.OnFocusedRecordChanged := cxGridMedicDBTableView1FocusedRecordChanged;
end;

end.



