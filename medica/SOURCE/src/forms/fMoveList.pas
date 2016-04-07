unit fMoveList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls,  ToolWin, Db, OracleData, ActnList, Menus, FR_DBSet, FR_DSet, FR_Class,
	FR_Desgn, Oracle, JvFormPlacement, HtmlHlp, JvComponentBase,
  Variants, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxCalendar, cxTextEdit,
  cxDBLookupComboBox, cxCurrencyEdit, cxSpinEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridLevel, cxGrid, cxMaskEdit, ExtCtrls, FR_View,
  cxDropDownEdit, cxContainer, cxGroupBox, JvExControls, JvArrowButton,
  StdCtrls, Mask, JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit,
  JvDatePickerEdit, frxClass, frxDBSet, frxPreview, fMainForm, cxCheckBox,
  fReportInputActSpis;

type
  TUnSignedDocs = record
    iDpid        : Integer;
    sDocNum      : String;
    dRegistrDate : TDateTime;
  end;

  TfrmMoveList = class(TForm)
    alAll: TActionList;
    acesc: TAction;
    acins: TAction;
    acdel: TAction;
    acedit: TAction;
    acrefresh: TAction;
    odsPostav: TOracleDataSet;
    odsSelMO: TOracleDataSet;
    odsSelDocMove: TOracleDataSet;
    odsSelDocMoveRep: TOracleDataSet;
    dsSelDocMove: TDataSource;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbuAdd: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton2: TToolButton;
    ToolButton6: TToolButton;
    ToolButton13: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    tbuPrint: TToolButton;
    pmPrint_Old: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    frUserdsTrebRep: TfrUserDataset;
    frDBdsTrebRep: TfrDBDataSet;
    odsTrebRep: TOracleDataSet;
    frudsTrebPKU: TfrUserDataset;
    frDBdsTrebPKURep: TfrDBDataSet;
    odsTrebPKURep: TOracleDataSet;
    frTrebPKU: TfrReport;
    ToolButton7: TToolButton;
    pmIns: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
		odsNakl: TOracleDataSet;
    frDBdsNakl: TfrDBDataSet;
    frudsNakl: TfrUserDataset;
    frNakl: TfrReport;
    N6: TMenuItem;
    N7: TMenuItem;
    frZapiska: TfrReport;
    frDBdsZap: TfrDBDataSet;
    frudsZap: TfrUserDataset;
    odsZap: TOracleDataSet;
    frudsTrebMove: TfrUserDataset;
    frTrebmove: TfrReport;
    frDBdsTrebMove: TfrDBDataSet;
    odsTrebMove: TOracleDataSet;
    odsTrebMovePKU: TOracleDataSet;
    frudsTrebMovePKU: TfrUserDataset;
    frTrebMovePKU: TfrReport;
    frDBdsTrebMovePKU: TfrDBDataSet;
    N8: TMenuItem;
    frudsSpirt: TfrUserDataset;
    odsTrebSpirt: TOracleDataSet;
    frDBspirt: TfrDBDataSet;
    frTrebSpirt: TfrReport;
    N9: TMenuItem;
    frZapMash: TfrReport;
    frDesigner1: TfrDesigner;
    N951: TMenuItem;
    frTrebSpirt90: TfrReport;
    frTreb: TfrReport;
		odsLastNamedoc: TOracleDataSet;
    odsLastName: TOracleDataSet;
    odsTrebRepROWNUM: TFloatField;
    odsTrebRepOTP: TStringField;
    odsTrebRepDOLOTP: TStringField;
    odsTrebRepKOLTREB: TFloatField;
    odsTrebRepNAMEMEDIC: TStringField;
    odsTrebRepFN_KOL: TFloatField;
    odsTrebRepEINAME: TStringField;
    oqUpdDoc: TOracleQuery;
    odsTrebMovePKUOTP: TStringField;
    odsTrebMovePKUDOLOTP: TStringField;
    odsTrebMovePKUNAMEMEDIC: TStringField;
    odsTrebMovePKUEINAME: TStringField;
    odsTrebMovePKUTREBKOL: TFloatField;
    odsTrebMovePKUFN_KOL: TFloatField;
    odsTrebPKURepOTP: TStringField;
    odsTrebPKURepDOLOTP: TStringField;
    odsTrebPKURepROWNUM: TFloatField;
    odsTrebPKURepKOLTREB: TFloatField;
    odsTrebPKURepNAMEMEDIC: TStringField;
    odsTrebPKURepFN_KOL: TFloatField;
    odsTrebPKURepEINAME: TStringField;
    odsZapFIO: TStringField;
    odsZapDOL: TStringField;
    odsZapROWNUM: TFloatField;
    odsZapMEDICNAME: TStringField;
		odsZapEINAME: TStringField;
    odsZapKOL: TFloatField;
    odsTrebRepPOL: TStringField;
    odsTrebRepDOLPOL: TStringField;
    odsTrebMoveOTP: TStringField;
    odsTrebMoveDOLOTP: TStringField;
    odsTrebMovePOL: TStringField;
    odsTrebMoveDOLPOL: TStringField;
    odsTrebMoveNAMEMEDIC: TStringField;
    odsTrebMoveEINAME: TStringField;
    odsTrebMoveTREBKOL: TFloatField;
    odsTrebMoveFN_KOL: TFloatField;
    odsTrebPKURepPOL: TStringField;
    odsTrebPKURepDOLPOL: TStringField;
    odsTrebMovePKUPOL: TStringField;
    odsTrebMovePKUDOLPOL: TStringField;
    Action1: TAction;
    odsTrebRepFN_SUMM: TFloatField;
    odsTrebMoveFN_SUMM: TFloatField;
    odsTrebPKURepFN_SUMM: TFloatField;
    odsTrebMovePKUFN_SUMM: TFloatField;
    odsTrebRepPRICE: TFloatField;
    odsTrebMovePRICE: TFloatField;
		odsTrebMovePKUPRICE: TFloatField;
    odsTrebPKURepPRICE: TFloatField;
    odsTrebRepBUH: TStringField;
    odsTrebRepGLAV: TStringField;
    odsTrebRepLOK: TStringField;
    odsTrebMoveBUH: TStringField;
    odsTrebMoveGLAV: TStringField;
    odsTrebMoveLOK: TStringField;
    odsTrebMovePKUBUH: TStringField;
    odsTrebMovePKUGLAV: TStringField;
    odsTrebMovePKULOK: TStringField;
    odsTrebSpirtROWNUM: TFloatField;
    odsTrebSpirtNACH: TStringField;
    odsTrebSpirtBUH: TStringField;
    odsTrebSpirtGLAV: TStringField;
    odsTrebSpirtLOK: TStringField;
    odsTrebSpirtKOLTREB: TFloatField;
    odsTrebSpirtNAMEMEDIC: TStringField;
    odsTrebSpirtFN_KOL: TFloatField;
    odsTrebSpirtFN_SUMM: TFloatField;
    odsTrebSpirtEINAME: TStringField;
    odsZapBUH: TStringField;
    odsZapPROV: TStringField;
    odsZapGLAV: TStringField;
    odsZapLOK: TStringField;
    odsZapNACH: TStringField;
    odsZapGLBUH: TStringField;
		odsZapGLAVR: TStringField;
    odsZapNACHR: TStringField;
    tbuSign: TToolButton;
    ToolButton12: TToolButton;
    pmPrint: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    acPrnConsuptionAct: TAction;
    acPrnBordereauSample: TAction;
    acPrnInvoice: TAction;
    frDBdsActSpisRep: TfrDBDataSet;
    odsActSpisRep: TOracleDataSet;
    frActSpis: TfrReport;
    acSign: TAction;
    frVedomost: TfrReport;
    odsVed: TOracleDataSet;
    frDBdsVed: TfrDBDataSet;
    odsLastDate: TOracleDataSet;
    odsLastDateDATA: TDateTimeField;
		ToolButton5: TToolButton;
    acReturn: TAction;
    frInvoice: TfrReport;
    ToolButton14: TToolButton;
    acTreb: TAction;
    FormStorage: TJvFormStorage;
    frInvoice2: TfrReport;
    odsMoZag: TOracleDataSet;
    odsMoZagMOID: TIntegerField;
    odsMoZagFC_NAME: TStringField;
    odsMoZagFL_CRM: TIntegerField;
    frDBdsInvoice: TfrDBDataSet;
    pmAdd: TPopupMenu;
    acInsertByTreb: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    Action2: TAction;
    acSpisanie: TAction;
    N12: TMenuItem;
    cxGridMoveList: TcxGrid;
    cxGridMoveListLevel1: TcxGridLevel;
    cxGridMoveListDBTableView1: TcxGridDBTableView;
    cxGridMoveListDBTableView1FD_DATA: TcxGridDBColumn;
    cxGridMoveListDBTableView1FC_DOCMIX: TcxGridDBColumn;
    cxGridMoveListDBTableView1FC_MOGROUPID_FROM: TcxGridDBColumn;
    cxGridMoveListDBTableView1FC_MOGROUPID_TO: TcxGridDBColumn;
    cxGridMoveListDBTableView1FN_PRICE: TcxGridDBColumn;
    cxGridMoveListDBTableView1FC_COMMENT: TcxGridDBColumn;
    cxGridMoveListDBTableView1VIDMOVE: TcxGridDBColumn;
    cxGridMoveListDBTableView1POD: TcxGridDBColumn;
    cxGridMoveListDBTableView1FC_DOC: TcxGridDBColumn;
    acGodMode: TAction;
    frActSpis_Old: TfrReport;
    odsKart: TOracleDataSet;
    dsKart: TDataSource;
    Splitter1: TSplitter;
    cxGridRashKart: TcxGrid;
    cxGridRashKartDBTableView1: TcxGridDBTableView;
    cxGridRashKartDBTableView1ROWNUM: TcxGridDBColumn;
    cxGridRashKartDBTableView1NAMEKART: TcxGridDBColumn;
    cxGridRashKartDBTableView1FN_PARTY_NUM: TcxGridDBColumn;
    cxGridRashKartDBTableView1FC_SERIAL: TcxGridDBColumn;
    cxGridRashKartDBTableView1FN_KOL: TcxGridDBColumn;
    cxGridRashKartDBTableView1FC_EDIZM: TcxGridDBColumn;
    cxGridRashKartDBTableView1FN_PRICE: TcxGridDBColumn;
    cxGridRashKartDBTableView1SUMM: TcxGridDBColumn;
    cxGridRashKartDBTableView1ODR: TcxGridDBColumn;
    cxGridRashKartLevel1: TcxGridLevel;
    acPrnReturn: TAction;
    N13: TMenuItem;
    ToolButton8: TToolButton;
    pmDocsFilterPeriod: TPopupMenu;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N14: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    cxGridMoveListDBTableView1FC_NAMEDOC: TcxGridDBColumn;
    acReturnPostav: TAction;
    frxReturnPostav: TfrxReport;
    frTrebNakl: TfrReport;
    frxDBodsKart: TfrxDBDataset;
    acReturnPostav1: TMenuItem;
    odsInvoice2: TOracleDataSet;
    frxDBdsSelDocMove: TfrxDBDataset;
    acPrnReturnPostav: TAction;
    frxOtpuskPo_: TfrxReport;
    acOtpuskPoNacPr: TAction;
    acOtpuskPoCelProg: TAction;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    acPrnOtpuskPo_: TAction;
    cxGridMoveListDBTableView1FD_INVOICE: TcxGridDBColumn;
    acToRezerv: TAction;
    N26: TMenuItem;
    miRezervSeparator: TMenuItem;
    frKart_List: TfrReport;
    acPrnKARD_LIST: TAction;
    Panel2: TPanel;
    abuSetDocPeriod: TJvArrowButton;
    Panel3: TPanel;
    dedDate1: TcxDateEdit;
    dedDate2: TcxDateEdit;
    chbDate1: TcxCheckBox;
    chbDate2: TcxCheckBox;
    cxGridMoveListDBTableView1DPID: TcxGridDBColumn;
    odsCheckSpisMedicOnGiven: TOracleDataSet;
    pmPrint2: TPopupMenu;
    N27: TMenuItem;
    miPrint: TMenuItem;
    cxGridRashKartDBTableView1KARTID: TcxGridDBColumn;
    cxGridRashKartDBTableView1MEDICID: TcxGridDBColumn;
    cxGridRashKartDBTableView1FD_GODEN: TcxGridDBColumn;
    acSpisanieHITEC: TAction;
    N28: TMenuItem;
    frxReport1: TfrxReport;
    cxGridRashKartDBTableView1FD_DATE_SPIS: TcxGridDBColumn;
    cxGridRashKartDBTableView1fc_inv_nomer: TcxGridDBColumn;
    frReport1: TfrReport;
    cxGridRashKartDBTableView1FC_QUOTA_CODE: TcxGridDBColumn;
    cxGridMoveListDBTableView1FC_RashPrichina: TcxGridDBColumn;
    frxRepMoveToOtd: TfrxReport;
    cxGridRashKartDBTableView1FN_NDS: TcxGridDBColumn;
    cxGridRashKartDBTableView1FN_PRICE_MNF: TcxGridDBColumn;
    cxGridRashKartDBTableView1FN_NACENKA: TcxGridDBColumn;
    cxGridRashKartDBTableView1FL_JNVLS: TcxGridDBColumn;
    cxGridRashKartDBTableView1FK_FINSOURCE_ID: TcxGridDBColumn;
    frReport2: TfrReport;
    odsActSpisRepInPeriod: TOracleDataSet;
    tbuPrintActSpisInPeriod: TToolButton;
    frActSpisInPeriod: TfrReport;
    frDBdsActSpisRepInPeriod: TfrDBDataSet;
    cxGridRashKartDBTableView1FC_CREATE_MO: TcxGridDBColumn;
    cxGridRashKartDBTableView1FC_EDIT_MO: TcxGridDBColumn;
    pmPrintTrebNakl: TPopupMenu;
    N29: TMenuItem;
    miPrintTrebWithDetail: TMenuItem;
    cxGridMoveListDBTableView1FC_FINSOURCE: TcxGridDBColumn;
    cxGridRashKartDBTableView1FL_MIBP: TcxGridDBColumn;
    frxM15: TfrxReport;
    pmPrintM15: TPopupMenu;
    N30: TMenuItem;
    miPrintM15: TMenuItem;
    pmPrintActSpis: TPopupMenu;
    miActSpis_var1: TMenuItem;
    miActSpis_var2: TMenuItem;
    frxActSpis: TfrxReport;
    frxdsActSpisRep: TfrxDBDataset;
    cxGridRashKartDBTableView1FC_REMARK: TcxGridDBColumn;
    cxGridRashKartDBTableView1FC_INTERNATIONAL_NAME: TcxGridDBColumn;
    cxGridRashKartDBTableView1FL_FORMULAR: TcxGridDBColumn;
    cxGridMoveListDBTableView1FC_PROFIL: TcxGridDBColumn;
    ActTrebNaklShort: TAction;
    miShortForm: TMenuItem;
    miActSpis_var3: TMenuItem;
    frxDBReport1a: TfrxDBDataset;
    oqPKG_SMINI: TOracleQuery;
    oqInitMO: TOracleQuery;
    frxRashDocPoMedicType: TfrxReport;
    odsSelDocPoMedicType: TOracleDataSet;
    odsGroupMo: TOracleDataSet;
    tbActSpisUchGroupsHANTY: TToolButton;
    acPrnNarcoticAct: TAction;
    N31: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
		procedure acescExecute(Sender: TObject);
    procedure acinsExecute(Sender: TObject);
    procedure aceditExecute(Sender: TObject);
    procedure acdelExecute(Sender: TObject);
    procedure acrefreshExecute(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N951Click(Sender: TObject);
    procedure asecEditExecute(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Action1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acPrnConsuptionActExecute(Sender: TObject);
    procedure acPrnBordereauSampleExecute(Sender: TObject);
    procedure acPrnInvoiceExecute(Sender: TObject);
    procedure acSignExecute(Sender: TObject);
    procedure acReturnExecute(Sender: TObject);
    procedure odsSelDocMoveAfterScroll(DataSet: TDataSet);
    procedure acTrebExecute(Sender: TObject);
//    procedure dxDBgMoveListCompare(Sender: TObject; Node1,
//      Node2: TdxTreeListNode; var Compare: Integer);
//    procedure dxDBgMoveListColumnSorting(Sender: TObject;
//      Column: TdxDBTreeListColumn; var Allow: Boolean);
		procedure frInvoice2GetValue(const ParName: String;
      var ParValue: Variant);
    procedure acInsertByTrebExecute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure frInvoice2MouseOverObject(View: TfrView;
      var Cursor: TCursor);
    procedure frInvoice2ObjectClick(View: TfrView);
    procedure frInvoice2UserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure acSpisanieExecute(Sender: TObject);
    procedure tbuPrintClick(Sender: TObject);
    procedure cxGridMoveListDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure acGodModeExecute(Sender: TObject);
    procedure frActSpisMouseOverObject(View: TfrView; var Cursor: TCursor);
    procedure frActSpisObjectClick(View: TfrView);
    procedure frActSpisUserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    procedure tbuAddClick(Sender: TObject);
    procedure acPrnReturnExecute(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure frTrebNaklUserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    procedure frTrebNaklMouseOverObject(View: TfrView; var Cursor: TCursor);
    procedure frTrebNaklObjectClick(View: TfrView);
    procedure acReturnPostavExecute(Sender: TObject);
    function frxReturnPostavUserFunction(const MethodName: String;
      var Params: Variant): Variant;
    procedure acPrnReturnPostavExecute(Sender: TObject);
    procedure frxReturnPostavClickObject(Sender: TfrxView;
      Button: TMouseButton; Shift: TShiftState; var Modified: Boolean);
    procedure acOtpuskPoNacPrExecute(Sender: TObject);
    procedure acOtpuskPoCelProgExecute(Sender: TObject);
    procedure acPrnOtpuskPo_Execute(Sender: TObject);
    procedure frxOtpuskPo_ClickObject(Sender: TfrxView;
      Button: TMouseButton; Shift: TShiftState; var Modified: Boolean);
    procedure frActSpisGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frxReturnPostavGetValue(const VarName: String;
      var Value: Variant);
    procedure acToRezervExecute(Sender: TObject);
    procedure acPrnKARD_LISTExecute(Sender: TObject);
    procedure dpeDate1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dpeDate1KillFocus(const ASender: TObject;
      const AFocusControl: TWinControl);
    procedure dpeDate1CheckClick(Sender: TObject);
    procedure dpeDate1Change(Sender: TObject);
    procedure chbDate1Click(Sender: TObject);
    procedure chbDate2Click(Sender: TObject);
    procedure dedDate1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dedDate1PropertiesEditValueChanged(Sender: TObject);
    procedure dedDate1PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGridMoveListDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure frNaklGetValue(const ParName: String; var ParValue: Variant);
    procedure frNaklMouseOverObject(View: TfrView; var Cursor: TCursor);
    procedure frNaklObjectClick(View: TfrView);
    procedure frVedomostGetValue(const ParName: String;
      var ParValue: Variant);
    procedure acSpisanieHITECExecute(Sender: TObject);
    procedure cxGridMoveListDBTableView1DblClick(Sender: TObject);
    procedure frxRepMoveToOtdGetValue(const VarName: string;
      var Value: Variant);
    procedure tbuPrintActSpisInPeriodClick(Sender: TObject);
    procedure FormStorageAfterRestorePlacement(Sender: TObject);
    procedure FormStorageAfterSavePlacement(Sender: TObject);
    procedure miPrintTrebWithDetailClick(Sender: TObject);
    procedure miPrintM15Click(Sender: TObject);
    procedure cxGridRashKartDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure miActSpis_var1Click(Sender: TObject);
    function frxActSpisUserFunction(const MethodName: string; var Params: Variant): Variant;
    procedure frxActSpisClickObject(Sender: TfrxView; Button: TMouseButton; Shift: TShiftState; var Modified: Boolean);
    procedure frxActSpisMouseOverObject(Sender: TfrxView);
    procedure frxActSpisGetValue(const VarName: string; var Value: Variant);
    procedure ActTrebNaklShortExecute(Sender: TObject);
    procedure miActSpis_var3ClickStart(Sender: TObject);
    procedure frxRashDocPoMedicTypeGetValue(const VarName: string;
      var Value: Variant);
    procedure acPrnNarcoticActExecute(Sender: TObject);
  private
    FGodMode,
    FNotRefresh : Boolean; // фильтр установлен при выборе из списка

// для отчета Акт списания
    FZaklKom, FSpisano, FPrikaz : string;
    FPred, FDolPred, FMO, FDolMO, FUTVERJDAYU_FIO, FUTVERJDAYU_DOLJN : string; // должности и фамилии

    FKom, FDolKom : array of string; // должности и фамилии членов комиссии
    FKom1,  FKom2,  FKom3,
    FDolKom1,  FDolKom2,  FDolKom3 : string; // должности и фамилии
    FZavOtd, FSMS : string;
    FL_UNSIGN_RIGHT : boolean; // право отменять подпись

    nTypeActSpis : integer;

    procedure MakeAddMove( aFP_Vid, aFP_VID_MOVE : Integer;  aRollbackName : string; aFK_TREBID : Integer = -1; aIsNewClearTreb : Boolean = False);

//    function DoCheckUnSignedDocs: TUnSignedDocs;
    { Private declarations }
  public
    { Public declarations }
    idDocs: integer;
    flIns,
    fledit: boolean;
    procedure Print_RepRashDocPoMedicType(Sender: TObject);
    procedure TestCheckGroup(p_nn:Integer=0);
  end;

procedure DoShowMoveList;

var
  frmMoveList: TfrmMoveList;
  FUchGrID,
  IS_RPO,
  FProfilID ,
  FK_APPSOTR_ID,
  CurMOGroup, v_CurMOGroupPRN: integer;
  CurMOGroupName : string;
  v_d1, v_d2 : TDateTime;
  v_pr_prn,
  v_is_to_EXCEL : Boolean;

implementation

uses fdmmain, fdmPrintReports, ffiotreb, fMoveEdit, JvDBUtils, fFIONakl, fTrebLst,
	fr_utils, fr_const, fDateInput, fFioZav, PKGMEDSES, fInputMemo,
  DateUtils, fPrintPreview_FR2, fLinkedDocs, fdmPrintSelect, uPrintActSpisUchGr;


{$R *.DFM}

procedure TfrmMoveList.TestCheckGroup(p_nn:Integer=0);
var dmMain_MOID,
  dmMain_FK_CurMO_GROUP,
  dmMain_CurMO_SKLAD_ID :Integer;
  dmMain_FC_CurMO_GROUP : string;
begin
  dmMain_MOID := TRUNC(dmMain.pkgMedSes.GETCURMO);
  dmMain_FK_CurMO_GROUP := dmMain.pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO;
  dmMain_FC_CurMO_GROUP := dmMain.pkgMedSes.GET_MOGROUP_NAME( dmMain.FK_CurMO_GROUP );
  dmMain_CurMO_SKLAD_ID := fdmMain.nvl(dmMain.pkgMedSes.GET_CUR_MO_SKLAD_ID,0);

  ShowMessage ( 'N точки : '+inttostr(p_nn)+#13+
                'MOID : old='+inttostr(dmMain.MOID)+'   new='+inttostr(dmMain_MOID)+#13+
                'FK_CurMO_GROUP : old='+inttostr( dmMain.FK_CurMO_GROUP)+'   new='+inttostr( dmMain_FK_CurMO_GROUP)+#13+
                'FC_CurMO_GROUP : old='+dmMain.FC_CurMO_GROUP+'   new='+dmMain_FC_CurMO_GROUP+#13+
                'CurMO_SKLAD_ID : old='+inttostr( dmMain.CurMO_SKLAD_ID)+'   new='+inttostr( dmMain_CurMO_SKLAD_ID )
              );
end;

function MONEYSTR(Summa: double): string;
begin
  Result := fdmPrintReports.MoneyToString(Summa, TRUE);
end;
//MONEYSTR

function DATERUSSTR(aDate : TDate) : string;
begin
  Result := GetDateStr( aDate );
end;

//****************************************************************************************
//                                 DoShowMoveList
//****************************************************************************************

procedure DoSetEditDoc(pVidMove: Integer = -1);
var id, FL_EDIT_OLD: integer;
    oq: TOracleQuery;
begin
{
см. DecodeDoc
1	Перемещение
2	Требование
3	Неотложка
4	списание
5	расход
6	Возврат
}
  id := frmMoveList.odsSelDocMove.FieldByName('DPID').AsInteger;
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := dmMain.os;
    if pVidMove = -1 then
// oq.Sql.Text := 'UPDATE TDOCS SET FL_EDIT=0 WHERE DPID=:ADPID AND FL_EDIT = 1' //подписать    
// добавил Воронов О.А. 09.03.2007 ---------------------------------------------
    begin
      oq.SQL.Text := 'select FL_EDIT from MED.TDOCS WHERE DPID='+IntToStr(frmMoveList.odsSelDocMove.FieldByName('DPID').AsInteger);
      oq.Execute;

      FL_EDIT_OLD := -1;

      if (not oq.Eof)and(not VarIsEmpty(oq.Field(0))) then
        FL_EDIT_OLD := oq.FieldAsInteger(0);
      oq.Close;
      case FL_EDIT_OLD of
        1: oq.Sql.Text := 'UPDATE MED.TDOCS SET FL_EDIT=0 WHERE DPID=:ADPID AND FL_EDIT = 1' //подписать
      else
        oq.Sql.Text := 'UPDATE MED.TDOCS SET FL_EDIT=1 WHERE DPID=:ADPID AND FL_EDIT = 0'; //отменить подпись
      end;
    end
// конец вставки ---------------------------------------------------------------    
    else
    begin
      oq.Sql.Text := 'UPDATE MED.TDOCS SET FP_VIDMOVE = :VIDMOVE WHERE DPID=:ADPID AND FL_EDIT = 1'; //не подписаннное
      oq.DeclareVariable('VIDMOVE', otInteger);
      oq.SetVariable('VIDMOVE', pVidMove);
    end;
    oq.DeclareVariable('adpid', otInteger);
    oq.SetVariable('adpid', frmMoveList.odsSelDocMove.FieldByName('DPID').AsInteger);
    try
      oq.Execute;
      dmMain.os.Commit;
      frmMoveList.odsSelDocMove.refresh;
			frmMoveList.odsSelDocMove.Locate('dpid', id, []);
    except
    end;
  finally
    oq.Free;
  end;
end;

procedure DoShowMoveList;
begin
  if not frmMain.RestoreMDI_Window('frmMoveList') then
  begin
    frmMoveList := TfrmMoveList.Create(Application);
    frmMoveList.FormStyle := fsMDIChild;
  end;
end;

procedure TfrmMoveList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // проверки на валидность дат
  dedDate1.PostEditValue;
  dedDate2.PostEditValue;

  FormStorage.AppStorage.Flush;
  IniWriteString( iniFileName, Self.Name, 'dpeDate1Checked',  BoolToStr(chbDate1.Checked, True) );  // сохраняем  булеан в виде слов
  IniWriteString( iniFileName, Self.Name, 'dpeDate2Checked',  BoolToStr(chbDate2.Checked, True) );
  IniWriteString( iniFileName, Self.Name, 'dpeDate1Date',     DateToStr(TRUNC(dedDate1.Date))   );
  IniWriteString( iniFileName, Self.Name, 'dpeDate2Date',     DateToStr(TRUNC(dedDate2.Date))   );
//  cxGridMoveListDBTableView1.StoreToRegistry('\SoftWare\SoftMaster\Medica\'+Self.Name, False, [gsoUseFilter]);
  cxGridMoveListDBTableView1.StoreToIniFile(iniFileName, False, [gsoUseFilter]);
  frmMain.tbMove.ImageIndex := 51;
  Action := caFree;
end;

procedure TfrmMoveList.FormActivate(Sender: TObject);
begin
//  if not fileexists('c:\ASU\prava.mo') then
//  begin
//   acins.Enabled:=false;
//   acdel.Enabled:=false;
//   acedit.Enabled:=false;
//   ToolButton3.Enabled:=false;
//   ToolButton4.Enabled:=false;
//   dxDBgMoveList.OnDblClick:=nil;
//  end;
  if odsSelDocMove.RecordCount <= 0 then begin
    acdel.Enabled := false;
    acedit.Enabled := false;
  end;
  idDocs := 1;
//  odsSelDocMove.First;
//  dxDBgMoveList.ApplyBestFit(nil);
end;

procedure TfrmMoveList.acescExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMoveList.acinsExecute(Sender: TObject);
begin
  MakeAddMove(VID_DVIJENIE, VIDMOVE_KARD_LIST, 'acins');
//	ndata:=dmmain.pkgprihrash.GETRASHDATA(ServerDate(dmMain.os));
//  dmmain.ncomment:='добавление';
//  Screen.Cursor := crSQLWait;
//  dmMain.os.Savepoint('move');
//
//  idDocs := -1;
//  if DoShowMoveEdit(idDocs, True, VID_DVIJENIE, VIDMOVE_KARD_LIST) = mrOk then
//  begin
//		odsSelDocMove.refresh;
//    odsSelDocMove.Locate('dpid', idDocs, []);
//    acdel.Enabled := true;
//    acedit.Enabled := true;
//		dmMain.os.Commit;
//  end
//  else
//    try
//      dmMain.os.RollbackToSavepoint('move');
//    except
//    end;
end;

procedure TfrmMoveList.aceditExecute(Sender: TObject);
begin
  dmmain.ncomment:='изменение';
  idDocs := odsSelDocMove.fieldbyname('dpid').asinteger;
    dmMain.os.Savepoint('move');
    dmmain.ncomment:='изменение';
    Screen.Cursor := crSQLWait;
    ndata:=odsSelDocMove.FieldByName('DATA').AsDateTime;
    flEdit := True;
    if DoShowMoveEdit(idDocs, odsSelDocMove.FieldByName('FL_EDIT').AsInteger = 1) = mrOk then
    begin
      odsSelDocMove.refresh;
      odsSelDocMove.Locate('dpid', idDocs, []);
      dmMain.os.Commit;

      // при сохранении расхода по списанию на пациента сразу выдавать сообщение обутверждении док-та, чтоб корректно списались остатки
      if ( odsSelDocMove.Active ) and  ( not odsSelDocMove.IsEmpty ) and
         (odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_SPISANIE) and
         (odsSelDocMove.FieldByName('FN_SPISANIEVID').AsInteger = SPISANIE_VID_PACIENT) and
         ( odsKart.Active ) and ( not odsKart.IsEmpty )  then
      begin
        acSign.Execute;
      end;
    end
    else
      try
        //dmMain.os.RollbackToSavepoint('move');
        dmMain.os.Rollback;
      except
      end;

    flEdit := False;
end;

procedure TfrmMoveList.acdelExecute(Sender: TObject);
begin
  dmmain.ncomment:='удаление';
// дурацкая проверка !!! узнать зачем
//  if (odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger in [2,3,7]) //= 5) OR (odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = 7)) and                //приход который отображается
//     //(odsSelDocMove.FieldByName('FK_MOGROUPID_TO').AsInteger = dmMain.pkgMedSes.GetCurmo) // у СМС как расход
//  then
//  begin
//    windows.MessageBox(Self.Handle, PChar('Удаление прихода невозможно!'), 'Предупреждение', MB_OK);
//    exit;
//  end;
  // Added by Voronov 29.05.2008 12:45:29 Добавил проверку при удалениии документа
  odsCheckSpisMedicOnGiven.Close;
  odsCheckSpisMedicOnGiven.SetVariable('DPID', odsSelDocMove.FieldByName('DPID').AsInteger);
  odsCheckSpisMedicOnGiven.Open;  
  if (odsCheckSpisMedicOnGiven.RecordCount > 0) then
  begin
    Application.MessageBox(PChar('Удаление невозможно!' + #10#13 +
      'ТМЦ уже списаны на пациента'), 'Предупреждение', MB_OK+MB_ICONWARNING);
    odsCheckSpisMedicOnGiven.Close;
    exit;
  end;
  odsCheckSpisMedicOnGiven.Close;  

  if (trunc(odsSelDocMove.fieldbyname('DATA').AsDateTime) <= trunc(dateclose)) and (not FGodMode) then
  begin
    Application.MessageBox(PChar('Удаление невозможно!' + #10#13 +
      'Период закрыт (' + FormatDateTime('dd.mm.yyyy',DateClose) + ')'), 'Предупреждение', MB_OK+MB_ICONWARNING);
    exit;
  end;

  if (odsSelDocMove.FieldByName('FL_EDIT').AsInteger = 0) and (not FGodMode) then
  begin
    Application.MessageBox(PChar('Удаление невозможно!'#10#13'Документ подписан.'), 'Предупреждение', MB_OK+MB_ICONWARNING);
    exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить данную запись ?'), 'Предупреждение', MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    dmMain.pkgprihrash.Dodeltreb(odsSelDocMove.fieldbyname('DPID').AsInteger);
    dmMain.pkgprihrash.Dodelvoz(odsSelDocMove.fieldbyname('DPID').AsInteger);
    dmMain.pkgprihrash.Dodeltrebvid(odsSelDocMove.fieldbyname('DPID').AsInteger);
    dmMain.PkgPrihRash.dodel(odsSelDocMove.fieldbyname('dpid').asinteger);
    dmMain.os.Commit;
    odsSelDocMove.refresh;
    if odsSelDocMove.RecordCount <= 0 then
    begin
      acdel.Enabled := false;
      acedit.Enabled := false;
    end;
  end;
end;

procedure TfrmMoveList.acrefreshExecute(Sender: TObject);
var
  s : string;
  date_temp : TDate;
begin
//  cxGridMoveList.BeginUpdate;
  if FNotRefresh then Exit;
  odsSelDocMove.AfterScroll := nil;
//  ID := odsSelDocMove.FieldByName('DPID').AsInteger;
  if TRUNC(dedDate1.Date) > TRUNC(dedDate2.Date) then
  begin
    date_temp := dedDate1.Date;
    dedDate1.Date := dedDate2.Date;
    dedDate2.Date := date_temp;
  end;
  odsSelDocMove.Close;
  odsSelDocMove.SetVariable('DATE1', TRUNC(dedDate1.Date));
  odsSelDocMove.SetVariable('DATE2', TRUNC(dedDate2.Date));
  s := 'Список расходных документов :: Период:';
  case chbDate1.Checked of
    TRUE :
    begin
      odsSelDocMove.SetVariable('FILTERED_BY_DATE1', 1);
      s := s + ' c '+DateToStr(dedDate1.Date);
    end;

    FALSE: odsSelDocMove.SetVariable('FILTERED_BY_DATE1', 0);
  end;
  case chbDate2.Checked of
    TRUE :
    begin
      odsSelDocMove.SetVariable('FILTERED_BY_DATE2', 1);
      s := s + ' по '+DateToStr(dedDate2.Date);
    end;

    FALSE: odsSelDocMove.SetVariable('FILTERED_BY_DATE2', 0);
  end;

  if (chbDate1.Checked or chbDate2.Checked) = False then
    s := 'Список расходных документов :: Без периода';

  Self.Caption := s;
//  cxGridMoveList.EndUpdate;
  odsSelDocMove.Open;
  cxGridMoveListDBTableView1.Controller.GoToFirst;
//  odsSelDocMove.Locate('DPID', ID, []);
  odsSelDocMove.AfterScroll := odsSelDocMoveAfterScroll;

  odsSelDocMoveAfterScroll( odsSelDocMove );

  acPrnBordereauSample.Enabled := (chbDate1.Checked and chbDate2.Checked); 
end;

procedure TfrmMoveList.ToolButton3Click(Sender: TObject);
//var str: integer;
begin
//  ndata:=dmmain.pkgprihrash.GETRASHDATA(date);
//  dmmain.ncomment:='добавление';
//  Screen.Cursor := crSQLWait;
//  dmMain.os.Savepoint('move');
////  idDocs := dmMain.PkgPrihRash.Createshablon(2, 2); //sill*
//  idDocs := dmMain.PkgPrihRash.Createshablon(3, 5);
//  Application.CreateForm(tfrmtreb, frmtreb);
//  frmTreb.dxDateEdit1.Date := ServerDate(dmMain.os);
//  frmtreb.LCBTo.KeyValue := dmMain.pkgMedSes.GETCURMO;
//
////  frmtreb.LCBFrom.KeyValue := dmMain.pkgMedSes.GETCURMO;
////  frmtreb.LCBFrom.Visible := False; //sill*
////  frmtreb.lbFrom.Visible := frmtreb.LCBFrom.Visible;
//
////* можно и убрать  
////  odsLastName.Refresh;
////  odsLastName.Last;
////  while not odsLastName.Bof do
////  begin
////    if StrToIntDef(odsLastNameFC_DOC.AsString, 0) <> 0 then
////      break
////    else
////    begin
////      odsLastName.Prior;
////    end;
////  end;
////  str := strtointdef(odsLastNameFC_DOC.AsString, 0) + 1;
////  frmTreb.edxNumDoc.Text := inttostr(str);
////-
//  if frmtreb.ShowModal = mrok then begin
//    dmMain.PkgPrihRash.DoSet(dmMain.PkgPrihRash.Getsumdoc(frmMoveList.idDocs, 2),
//      frmtreb.mdxComment.Lines.text,
//      frmtreb.edxNumDoc.text,
//      Date,
//      frmtreb.dxDateEdit1.date,
//      frmtreb.odsMOToTrebMOID.AsInteger,
//      idDocs,
//      frmtreb.odsMofromTrebMOID.asinteger, 2);
//    odsSelDocMove.refresh;
//    odsSelDocMove.Locate('dpid', idDocs, []);
//    acdel.Enabled := true;
//    acedit.Enabled := true;
//  end
//  else
//    dmMain.os.RollbackToSavepoint('move');
//  dmMain.os.Commit;
end;

procedure TfrmMoveList.tbuPrintActSpisInPeriodClick(Sender: TObject);
var
  p : TfrPreview;
  S : string;
  i,i2 : integer;
  PageFooterExists : boolean;
  Params : TArrayOfParams;
  Pp : TPoint;
begin
  if dmPrintSelect.PrintFlag = 0 then
  begin
    Pp.X := 0;
    Pp.Y := tbuPrint.Height;
    Pp := tbuPrint.ClientToScreen(Pp);
    dmPrintSelect.pmPrintSelect.Popup(Pp.X, Pp.Y);
    Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати
  if dmPrintSelect.PrintFlag = 0 then Exit;
  try
    if odsSelDocMove.Eof then Exit;
    case odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger of
      VIDMOVE_SPISANIE_RPO : begin


        FZaklKom := '';
        FSpisano := '';
        FPrikaz  := '';

        i2 := 0;
        SetLength( Params, 1);
        Params[i2].Name := 'Председатель';
        Params[i2].Value := IniReadString2('Act_Spis', 'Predsed', '');
        Params[i2].ParamType := 1;
        inc( i2 );

        i := dmMain.ConfigParams.GetParamValue('FUNC_COUNT_SPIS_CHLEN_KOM', 3);
        SetLength( FKom,  i );
        SetLength( Params, Length(Params)+i);
        for i := 0 to Length(FKom) - 1 do
        begin
          Params[i2].Name := 'Член ком.'+IntToStr(i+1);
          Params[i2].Value := IniReadString2('Act_Spis', 'ChlenKom'+IntToStr(i+1), '');
          Params[i2].ParamType := 1;
          inc( i2 );
        end;


        SetLength( Params, Length(Params)+1);
        Params[i2].Name := 'Должн. председателя';
        Params[i2].Value := IniReadString2('Act_Spis', 'DoljnChlenPredsed', '');
        Params[i2].ParamType := 0;
        inc( i2 );
        i := dmMain.ConfigParams.GetParamValue('FUNC_COUNT_SPIS_CHLEN_KOM', 3);
        SetLength( FDolKom, i );
        SetLength( Params, Length(Params)+i);
        for i := 0 to Length(FDolKom) - 1 do
        begin
          Params[i2].Name := 'Должн. члена ком.'+IntToStr(i+1);
          Params[i2].Value := IniReadString2('Act_Spis', 'DoljnChlenKom'+IntToStr(i+1), '');
          Params[i2].ParamType := 0;
          inc( i2 );
        end;


        if (dmMain.ConfigParams.GetParamValue('FUNC_USE_ZAV_OTD_IN_ACT_SPIS', 0) = 1) then
        begin
          SetLength( Params, Length(Params)+1);
          Params[i2].Name := 'Зав.отделением';
          Params[i2].Value := IniReadString2('Act_Spis', 'ZAV_OTD', '');
          Params[i2].ParamType := 1;
          inc( i2 );
        end;

        if (dmMain.ConfigParams.GetParamValue('FUNC_USE_SMS_IN_ACT_SPIS', 0) = 1) then
        begin
          SetLength( Params, Length(Params)+1);
          Params[i2].Name := 'Ст.медсестра';
          Params[i2].Value := IniReadString2('Act_Spis', 'SMS', '');
          Params[i2].ParamType := 1;
      //    inc( i2 );
        end;

        if (dmMain.ConfigParams.GetParamValue('FUNC_SAVE_ZAKL_KOM', 0) = 1) then
        begin
          FZaklKom := StringReplace(IniReadString2('Act_Spis', 'ZAKL_KOM', ''), '#13#10', #13#10, [rfReplaceAll] );
        end;

        FPrikaz := IniReadString2('Act_Spis', 'PrikazOt', 'от "___"  ____________  20___ г  № ___');

        if DoShowReportInputActSpis(dmMain.os, Params, FZaklKom, FSpisano, FPrikaz) <> mrOk then
        begin
          Exit;
        end;

        if (dmMain.ConfigParams.GetParamValue('FUNC_SAVE_ZAKL_KOM', 0) = 1) then
        begin
          IniWriteString2('Act_Spis', 'ZAKL_KOM', StringReplace(FZaklKom, #13#10, '#13#10', [rfReplaceAll]) );
        end;

        for i := 0 to Length(Params) - 1 do
        begin
          if Params[i].Name = 'Председатель' then FPred := Params[i].Value;

          if pos('Член ком.', Params[i].Name) > 0 then
            for i2 := 0 to Length(FKom) - 1 do
              if Params[i].Name = 'Член ком.'+IntToStr(i2+1) then FKom[i2] := Params[i].Value;

          if Params[i].Name = 'Должн. председателя' then FDolPred := Params[i].Value;

          if pos('Должн. члена ком.', Params[i].Name) > 0 then
            for i2 := 0 to Length(FDolKom) - 1 do
              if Params[i].Name = 'Должн. члена ком.'+IntToStr(i2+1) then FDolKom[i2] := Params[i].Value;


          if (dmMain.ConfigParams.GetParamValue('FUNC_USE_ZAV_OTD_IN_ACT_SPIS', 0) = 1) then
          begin
            if Params[i].Name = 'Зав.отделением' then FZavOtd := Params[i].Value;
          end;

          if (dmMain.ConfigParams.GetParamValue('FUNC_USE_SMS_IN_ACT_SPIS', 0) = 1) then
          begin
            if Params[i].Name = 'Ст.медсестра' then FSMS := Params[i].Value;
          end;
        end;

        IniWriteString2('Act_Spis', 'Predsed',           FPred   );

        for i := 0 to Length(FKom) - 1 do
          IniWriteString2('Act_Spis', 'ChlenKom'+IntToStr(i+1),    FKom[i]);

        IniWriteString2('Act_Spis', 'DoljnChlenPredsed', FDolPred);
        for i := 0 to Length(FDolKom) - 1 do
          IniWriteString2('Act_Spis', 'DoljnChlenKom'+IntToStr(i+1),    FDolKom[i]);

        IniWriteString2('Act_Spis', 'PrikazOt',          FPrikaz);

        IniWriteString2('Act_Spis', 'ZAV_OTD',    FZavOtd);
        IniWriteString2('Act_Spis', 'SMS',        FSMS);


        odsActSpisRepInPeriod.ClearVariables;

        odsActSpisRepInPeriod.SetVariable('vidmove', odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger);
        odsActSpisRepInPeriod.SetVariable('FC_MOGROUPID_TO', odsSelDocMove.FieldByName('FC_MOGROUPID_TO').AsString);


        odsActSpisRepInPeriod.SetVariable('DATE1', TRUNC(dedDate1.Date));
        odsActSpisRepInPeriod.SetVariable('DATE2', TRUNC(dedDate2.Date));
        case chbDate1.Checked of
          TRUE : odsActSpisRepInPeriod.SetVariable('FILTERED_BY_DATE1', 1);
          FALSE: odsActSpisRepInPeriod.SetVariable('FILTERED_BY_DATE1', 0);
        end;
        case chbDate2.Checked of
          TRUE : odsActSpisRepInPeriod.SetVariable('FILTERED_BY_DATE2', 1);
          FALSE: odsActSpisRepInPeriod.SetVariable('FILTERED_BY_DATE2', 0);
        end;

        odsActSpisRepInPeriod.close;
        odsActSpisRepInPeriod.open;

        if FileExists(frActSpisInPeriod.Name + '.frf') then
          frActSpisInPeriod.LoadFromFile(frActSpisInPeriod.Name + '.frf');

        frActSpisInPeriod.PrepareReport;
        case dmPrintSelect.PrintFlag of // флаг куда печатать
          1:
          begin
            PageFooterExists := (frActSpisInPeriod.FindObject('PageFooter1') <> nil);
            if PageFooterExists then
              frActSpisInPeriod.FindObject('PageFooter1').Visible := False;
            frActSpisInPeriod.PrepareReport;
            ExportFRToExcel( frActSpisInPeriod, odsSelDocMove.FieldByName('FC_DOCMIX').AsString+'.xls' );
            if PageFooterExists then
              frActSpisInPeriod.FindObject('PageFooter1').Visible := True;
          end;

          2:
          begin
            p := TfrPreview.Create(frActSpisInPeriod);
            CurReport := frActSpisInPeriod;
            MasterReport := frActSpisInPeriod;
            DocMode := dmPrinting;
            CurBand := nil;
            if frActSpisInPeriod.EMFPages.Count = 0 then Exit;
            s := frLoadStr(SPreview);
            if frActSpisInPeriod.Title <> '' then s := s + ' - ' + frActSpisInPeriod.Title;
            p.Window.Caption := s;
            frActSpisInPeriod.Preview := p;
            frActSpisInPeriod.Preview.Window.Show_Modal(frActSpisInPeriod);
            Application.ProcessMessages;
            frActSpisInPeriod.Preview.Window := nil;
            frActSpisInPeriod.Preview := nil;
            p.Free;
          end;
        end;

        odsActSpisRep.Close;
        SetLength(Params, 0);

      end;
    end;
  finally
    dmPrintSelect.PrintFlag := 0;
  end;
end;

procedure TfrmMoveList.N1Click(Sender: TObject);
begin
//  DoSetEditDoc;
  if odsSelDocMove.fieldbyname('FP_VIDMOVE').AsInteger = 2 then
  begin
    Application.CreateForm(tfrmfiotreb, frmFIOTreb);
    frmFIOTreb.Caption := 'Ввод данных о получившем';
    frmFIOTreb.Label1.Caption := 'Получил(а):';
    frmFIOTreb.Label2.Caption := 'Должность получившего:';
    frmFIOTreb.edolotp.Text := 'Медсестра';
    frmFIOTreb.eotp.Text := odsSelDocMove.fieldbyname('FC_COMMENT').AsString;
    frmFIOTreb.ShowModal;
    odsTrebRep.SetVariable('otp', frmFIOTreb.eotp.text);
    odsTrebRep.SetVariable('dolotp', frmFIOTreb.edolotp.text);
    frmFIOTreb.free;
    Application.CreateForm(tfrmfiotreb, frmFIOTreb);
    frmFIOTreb.Caption := 'Ввод данных об отпустившем';
    frmFIOTreb.Label1.Caption := 'Отпустил(а):';
    frmFIOTreb.Label2.Caption := 'Должность отпустившего:';
    frmFIOTreb.edolotp.Text := 'Провизор';
    frmFIOTreb.eotp.Text := 'Саковец Е.Б.';
    frmFIOTreb.ShowModal;
    odsTrebRep.SetVariable('pol', frmFIOTreb.eotp.text);
    odsTrebRep.SetVariable('dolpol', frmFIOTreb.edolotp.text);
    odsTrebRep.SetVariable('amoid', odsSelDocMove.fieldbyname('MOTOID').AsInteger);
    odsTrebRep.SetVariable('adpid', odsSelDocMove.fieldbyname('DPID').AsInteger);
    odsTrebRep.Close;
    odsTrebRep.Open;
    frTreb.ShowReport;
    frmFIOTreb.free;
  end;
  if odsSelDocMove.fieldbyname('FP_VIDMOVE').AsInteger <> 2 then begin
    Application.CreateForm(tfrmfiotreb, frmFIOTreb);
    frmFIOTreb.Caption := 'Ввод данных о получившем';
    frmFIOTreb.Label1.Caption := 'Получил(а):';
    frmFIOTreb.Label2.Caption := 'Должность получившего:';
    frmFIOTreb.edolotp.Text := 'Медсестра';
    frmFIOTreb.eotp.Text := odsSelDocMove.fieldbyname('FC_COMMENT').AsString;
    frmFIOTreb.ShowModal;
    odsTrebMove.SetVariable('otp', frmFIOTreb.eotp.text);
    odsTrebMove.SetVariable('dolotp', frmFIOTreb.edolotp.text);
    frmFIOTreb.free;
    Application.CreateForm(tfrmfiotreb, frmFIOTreb);
    frmFIOTreb.Caption := 'Ввод данных об отпустившем';
    frmFIOTreb.Label1.Caption := 'Отпустил(а):';
    frmFIOTreb.Label2.Caption := 'Должность отпустившего:';
    frmFIOTreb.edolotp.Text := 'Провизор';
    frmFIOTreb.eotp.Text := 'Саковец Е.Б.';
    frmFIOTreb.ShowModal;
    odsTrebMove.SetVariable('pol', frmFIOTreb.eotp.text);
    odsTrebMove.SetVariable('dolpol', frmFIOTreb.edolotp.text);
    odsTrebMove.SetVariable('adpid', odsSelDocMove.fieldbyname('DPID').AsInteger);
    odsTrebMove.close;
    odsTrebMove.open;
    frTrebmove.ShowReport;
    frmFIOTreb.free;
  end;
end;

procedure TfrmMoveList.N2Click(Sender: TObject);
begin
//  DoSetEditDoc;
  if odsSelDocMove.fieldbyname('FP_VIDMOVE').AsInteger = 2 then begin
    Application.CreateForm(tfrmfiotreb, frmFIOTreb);
    frmFIOTreb.Caption := 'Ввод данных о получившем';
    frmFIOTreb.Label1.Caption := 'Получил(а):';
    frmFIOTreb.Label2.Caption := 'Должность получившего:';
    frmFIOTreb.edolotp.Text := 'Медсестра';
    frmFIOTreb.eotp.Text := odsSelDocMove.fieldbyname('FC_COMMENT').AsString;
    frmFIOTreb.ShowModal;
    odsTrebPKURep.SetVariable('otp', frmFIOTreb.eotp.text);
    odsTrebPKURep.SetVariable('dolotp', frmFIOTreb.edolotp.text);
    frmFIOTreb.free;
    Application.CreateForm(tfrmfiotreb, frmFIOTreb);
    frmFIOTreb.Caption := 'Ввод данных об отпустившем';
    frmFIOTreb.Label1.Caption := 'Отпустил(а):';
    frmFIOTreb.Label2.Caption := 'Должность отпустившего:';
    frmFIOTreb.edolotp.Text := 'Провизор';
    frmFIOTreb.eotp.Text := 'Саковец Е.Б.';
    frmFIOTreb.ShowModal;
    odsTrebPKURep.SetVariable('pol', frmFIOTreb.eotp.text);
    odsTrebPKURep.SetVariable('dolpol', frmFIOTreb.edolotp.text);
    odsTrebPKURep.SetVariable('amoid', odsSelDocMove.fieldbyname('MOTOID').AsInteger);
    odsTrebPKURep.SetVariable('adpid', odsSelDocMove.fieldbyname('DPID').AsInteger);
    odsTrebPKURep.Close;
    odsTrebPKURep.Open;
    frTrebPKU.ShowReport;
    frmFIOTreb.Free;
  end;
  if odsSelDocMove.fieldbyname('FP_VIDMOVE').AsInteger <> 2 then begin
    Application.CreateForm(tfrmfiotreb, frmFIOTreb);
    frmFIOTreb.Caption := 'Ввод данных о получившем';
    frmFIOTreb.Label1.Caption := 'Получил(а):';
    frmFIOTreb.Label2.Caption := 'Должность получившего:';
    frmFIOTreb.edolotp.Text := 'Медсестра';
    frmFIOTreb.eotp.Text := odsSelDocMove.fieldbyname('FC_COMMENT').AsString;
    frmFIOTreb.ShowModal;
    odsTrebMovePKU.SetVariable('otp', frmFIOTreb.eotp.text);
    odsTrebMovePKU.SetVariable('dolotp', frmFIOTreb.edolotp.text);
    frmFIOTreb.free;
    Application.CreateForm(tfrmfiotreb, frmFIOTreb);
    frmFIOTreb.Caption := 'Ввод данных об отпустившем';
    frmFIOTreb.Label1.Caption := 'Отпустил(а):';
    frmFIOTreb.Label2.Caption := 'Должность отпустившего:';
    frmFIOTreb.edolotp.Text := 'Провизор';
    frmFIOTreb.eotp.Text := 'Саковец Е.Б.';
    frmFIOTreb.ShowModal;
    odsTrebMovePKU.SetVariable('pol', frmFIOTreb.eotp.text);
    odsTrebMovePKU.SetVariable('dolpol', frmFIOTreb.edolotp.text);
    odsTrebMovePKU.SetVariable('adpid', odsSelDocMove.fieldbyname('DPID').AsInteger);
    odsTrebMovePKU.close;
    odsTrebMovePKU.open;
    frTrebmovePKU.ShowReport;
    frmFIOTreb.Free;
  end;

end;

procedure TfrmMoveList.N3Click(Sender: TObject);
//var str: integer;
begin
//  ndata:=date;
//  dmmain.ncomment:='добавление';
//  Screen.Cursor := crSQLWait;
//  dmMain.os.Savepoint('move');
//  idDocs := dmMain.PkgPrihRash.Createshablon(2, 3);
//  Application.CreateForm(tfrmtrebvid, frmtrebvid);
//  frmTrebVid.dxDateEdit1.Date := date;
//  frmTrebVid.LCBFrom.KeyValue := dmMain.pkgMedSes.GETCURMO;
//  odsLastName.Refresh;
//  odsLastName.Last;
//  while not odsLastName.Bof do
//  begin
//    if StrToIntDef(odsLastNameFC_DOC.AsString, 0) <> 0 then
//      break
//    else
//    begin
//      odsLastName.Prior;
//    end;
//  end;
//  str := strtoint(odsLastNameFC_DOC.AsString) + 1;
//  frmTrebVid.edxNumDoc.Text := inttostr(str);
//  if frmtrebvid.ShowModal = mrok then begin
//    dmMain.PkgPrihRash.DoSet(dmMain.PkgPrihRash.Getsumdoc(frmMoveList.idDocs, 2),
//      frmtrebvid.mdxComment.Lines.text,
//      frmtrebvid.edxNumDoc.text,
//      Date,
//      frmtrebvid.dxDateEdit1.date,
//      frmtrebvid.odsMOToTrebMOID.AsInteger,
//      idDocs,
//      frmtrebvid.odsMofromTrebMOID.asinteger, 2);
//    odsSelDocMove.refresh;
//    odsSelDocMove.Locate('dpid', idDocs, []);
//    acdel.Enabled := true;
//    acedit.Enabled := true;
//
//  end
//  else
//    dmMain.os.RollbackToSavepoint('move');
//  dmMain.os.Commit;
end;

procedure TfrmMoveList.N5Click(Sender: TObject);
begin
  acPrnReturn.Execute;
end;

procedure TfrmMoveList.N6Click(Sender: TObject);
var str: integer;
begin
  ndata:=dmmain.pkgprihrash.GETRASHDATA(date);
  dmmain.ncomment:='добавление';
  Screen.Cursor := crSQLWait;
  dmMain.os.Savepoint('move');
  idDocs := dmMain.PkgPrihRash.Createshablon(2, 1);
  Application.CreateForm(TfrmMoveEdit, frmMoveEdit);
  flIns := true;
  frmMoveEdit.flIns := true;
  frmMoveEdit.idDocs := idDocs;
  frmMoveEdit.MOOWNERID := odsSelDocMove.FieldByName('MOOWNERID').AsInteger;
  frmMoveEdit.FD_DATA := odsSelDocMove.FieldByName('FD_DATA').AsDateTime;

  frmMoveEdit.deRegisterDate.Date := ServerDate(dmMain.os);//date;
//  frmMoveEdit.LCBTo.KeyValue := dmMain.pkgMedSes.GETCURMO;
  odsLastName.Refresh;
  odsLastName.Last;
  while not odsLastName.Bof do
  begin
    if StrToIntDef(odsLastName.FieldByName('FC_DOC').AsString, 0) <> 0 then
      break
    else
    begin
      odsLastName.Prior;
    end;
  end;
  str := strtointdef(odsLastName.FieldByName('FC_DOC').AsString, 0) + 1;
  frmMoveEdit.eNumDoc.Text := inttostr(str);
  if frmMoveEdit.ShowModal = mrok then begin
    dmMain.PkgPrihRash.DoSet(dmMain.PkgPrihRash.Getsumdoc(frmMoveList.idDocs, 2),
      frmMoveEdit.mComment.text,
      frmMoveEdit.eNumDoc.text,
      Date,
      frmMoveEdit.deRegisterDate.date,
//      frmMoveEdit.odsNametomove.fieldbyname('moid').asinteger,
      -1, //nvl(frmMoveEdit.LCBTo.KeyValue,0),
      fdmMain.nvl(frmMoveEdit.lcbMO_GROUP_TO.EditValue, 0),
      idDocs,
//      frmMoveEdit.odsNamefrommove.fieldbyname('moid').asinteger,
      -1, //nvl(frmMoveEdit.LCBPostav.KeyValue,0),
      fdmMain.nvl(frmMoveEdit.lcbMO_GROUP_FROM.KeyValue, 0),
       2);
    odsSelDocMove.refresh;
    odsSelDocMove.Locate('dpid', idDocs, []);
    acdel.Enabled := true;
    acedit.Enabled := true;
    dmMain.os.Commit;
  end
  else
    try
      dmMain.os.RollbackToSavepoint('move');
    except
    end;
  dmMain.os.Commit;
{  ndata:=date;
  dmmain.ncomment:='добавление';
  Screen.Cursor := crSQLWait;
  dmMain.os.Savepoint('move');
  idDocs := dmMain.PkgPrihRash.Createshablon(2, 6);
  Application.CreateForm(tfrmvozvrat, frmvozvrat);
  frmvozvrat.dxDateEdit1.Date := date;
  flIns := true;
  odsLastName.Refresh;
  odsLastName.Last;
  str := 0;
  while not odsLastName.Bof do
  begin
    if StrToIntDef(odsLastNameFC_DOC.AsString, 0) <> 0 then
      break
    else
    begin
      odsLastName.Prior;
    end;
  end;
  str := strtoint(odsLastNameFC_DOC.AsString) + 1;
  frmVozvrat.edxNumDoc.Text := inttostr(str);
  frmVozvrat.LCBTo.KeyValue := dmMain.pkgMedSes.GETCURMO;
  if frmvozvrat.ShowModal = mrok then begin
    dmMain.PkgPrihRash.DoSet(dmMain.PkgPrihRash.Getsumdoc(frmMoveList.idDocs, 2),
      frmvozvrat.mdxComment.Lines.text,
      frmvozvrat.edxNumDoc.text,
      frmvozvrat.dxDateEdit1.date,
      frmvozvrat.odsMOToTrebMOID.AsInteger,
      idDocs,
      frmvozvrat.odsMofromTrebMOID.asinteger, 2);
    odsSelDocMove.refresh;
    odsSelDocMove.Locate('dpid', idDocs, []);
    acdel.Enabled := true;
    acedit.Enabled := true;

  end
  else
    dmMain.os.RollbackToSavepoint('move');
  dmMain.os.Commit;
  flIns := false;
 }
end;

procedure TfrmMoveList.N7Click(Sender: TObject);
begin
//  DoSetEditDoc;
  Application.CreateForm(tfrmfiotreb, frmFIOTreb);
  frmFIOTreb.Caption := 'Ввод данных о получившем';
  frmFIOTreb.Label1.Caption := 'ФИО:';
  frmFIOTreb.Label2.Caption := 'Должность:';
  frmFIOTreb.eotp.Text := odsSelDocMove.fieldbyname('FC_COMMENT').AsString;
  frmFIOTreb.edolotp.Text := odsSelDocMove.fieldbyname('NAMETO').AsString;
  frmFIOTreb.ShowModal;
  odsZap.SetVariable('fio', frmFIOTreb.eotp.text);
  odsZap.SetVariable('dol', frmFIOTreb.edolotp.text);
  //  if (odsSelDocMoveFP_VIDMOVE.AsInteger = 1) then
  //  begin
  odsZap.SetVariable('adpid', odsSelDocMove.fieldbyname('DPID').AsInteger);
  odsZap.close;
  odsZap.open;
  frZapiska.ShowReport;
  frmFIOTreb.free;
  //end;

end;

procedure TfrmMoveList.N8Click(Sender: TObject);
begin
  odsTrebSpirt.SetVariable('amoid', odsSelDocMove.fieldbyname('MOTOID').AsInteger);
  odsTrebSpirt.SetVariable('adpid', odsSelDocMove.fieldbyname('DPID').AsInteger);
  odsTrebSpirt.Open;
  frTrebSpirt.ShowReport;
  odsTrebSpirt.Close;

end;

procedure TfrmMoveList.N9Click(Sender: TObject);
begin
//  DoSetEditDoc;
  Application.CreateForm(tfrmfiotreb, frmFIOTreb);
  frmFIOTreb.Caption := 'Ввод данных о получившем';
  frmFIOTreb.Label1.Caption := 'ФИО:';
  frmFIOTreb.Label2.Caption := 'Должность:';
  frmFIOTreb.eotp.Text := odsSelDocMove.fieldbyname('FC_COMMENT').AsString;
  frmFIOTreb.edolotp.Text := odsSelDocMove.fieldbyname('NAMETO').AsString;
  frmFIOTreb.ShowModal;
  odsZap.SetVariable('fio', frmFIOTreb.eotp.text);
  odsZap.SetVariable('dol', frmFIOTreb.edolotp.text);
  odsZap.SetVariable('adpid', odsSelDocMove.fieldbyname('DPID').AsInteger);
  odsZap.close;
  odsZap.open;
  frZapMash.ShowReport;
  frmFIOTreb.free;

end;

procedure TfrmMoveList.N951Click(Sender: TObject);
begin
  odsTrebSpirt.SetVariable('amoid', odsSelDocMove.fieldbyname('MOTOID').AsInteger);
  odsTrebSpirt.SetVariable('adpid', odsSelDocMove.fieldbyname('DPID').AsInteger);
  odsTrebSpirt.Open;
  frTrebSpirt90.ShowReport;
  odsTrebSpirt.Close;

end;

procedure TfrmMoveList.asecEditExecute(Sender: TObject);
begin
//  idDocs := odsSelDocMove.fieldbyname('dpid').asinteger;
//  if dmMain.pkgprihrash.Checkmoidtreb(odsSelDocMoveMOTOID.AsInteger, idDocs, 0) > 0 then begin
//    Screen.Cursor := crSQLWait;
//    dmMain.os.Savepoint('movetreb');
//    Application.CreateForm(tfrmtreb, frmtreb);
//    frmtreb.LCBFrom.KeyValue := odsSelDocMove.fieldbyname('mofromid').asinteger;
//    frmtreb.LCBto.KeyValue := odsSelDocMove.fieldbyname('motoid').asinteger;
//    frmtreb.dxDateEdit1.Date := odsSelDocMove.fieldbyname('data').asdatetime;
//    frmtreb.edxNumDoc.Text := odsSelDocMove.fieldbyname('fc_doc').asstring;
//    frmtreb.mdxComment.Lines.Text := odsSelDocMove.fieldbyname('fc_comment').asstring;
//    fledit := true;
//    if frmtreb.ShowModal = mrok then begin
//      dmMain.PkgPrihRash.DoSet(dmMain.PkgPrihRash.Getsumdoc(frmMoveList.idDocs, 2),
//        frmtreb.mdxComment.Lines.text,
//        frmtreb.edxNumDoc.text,
//        Date,
//        frmtreb.dxDateEdit1.date,
//        frmtreb.odsMOToTrebMOID.AsInteger,
//        idDocs,
//        frmtreb.odsMofromTrebMOID.asinteger, 2);
//      odsSelDocMove.refresh;
//      odsSelDocMove.Locate('dpid', idDocs, []);
//      acdel.Enabled := true;
//      acedit.Enabled := true;
//      fledit := false;
//      dmMain.os.Commit;
//    end
//    else
//      dmMain.os.RollbackToSavepoint('movetreb');
//
//    exit;
//  end;
//  (*  if odsSelDocMoveFP_VIDMOVE.AsInteger = 6 then begin
//      Screen.Cursor:=crSQLWait;
//      dmMain.os.Savepoint('movetreb');
//      Application.CreateForm(tfrmVozvrat, frmVozvrat);
//      frmVozvrat.LCBFrom.KeyValue:=odsSelDocMove.fieldbyname('mofromid').asinteger;
//      frmVozvrat.LCBto.KeyValue:=odsSelDocMove.fieldbyname('motoid').asinteger;
//      frmVozvrat.dxDateEdit1.Date:=odsSelDocMove.fieldbyname('data').asdatetime;
//      frmVozvrat.edxNumDoc.Text:=odsSelDocMove.fieldbyname('fc_doc').asstring;
//      frmVozvrat.mdxComment.Lines.Text:=odsSelDocMove.fieldbyname('fc_comment').asstring;
//      if frmVozvrat.ShowModal = mrok then begin
//        dmMain.PkgPrihRash.DoSet(dmMain.PkgPrihRash.Getsumdoc(frmMoveList.idDocs, 2),
//          frmVozvrat.mdxComment.Lines.text,
//          frmVozvrat.edxNumDoc.text,
//          frmVozvrat.dxDateEdit1.date,
//          frmVozvrat.odsMOToTrebMOID.AsInteger,
//          idDocs,
//          frmVozvrat.odsMofromTrebMOID.asinteger, 2);
//        odsSelDocMove.refresh;
//        odsSelDocMove.Locate('dpid', idDocs, []);
//        acdel.Enabled:=true;
//        acedit.Enabled:=true;
//        dmMain.os.Commit;
//      end
//      else
//        dmMain.os.RollbackToSavepoint('movetreb');
//
//      exit;
//    end;*)
//
//    /// неотложка
//  if dmMain.pkgprihrash.Checkmoidtreb(odsSelDocMoveMOTOID.AsInteger, idDocs, 1) > 0 then begin
//    Screen.Cursor := crSQLWait;
//    dmMain.os.Savepoint('movetreb');
//    Application.CreateForm(TfrmTrebVid, frmTrebVid);
//    frmTrebVid.LCBFrom.KeyValue := odsSelDocMove.fieldbyname('mofromid').asinteger;
//    frmTrebVid.LCBto.KeyValue := odsSelDocMove.fieldbyname('motoid').asinteger;
//    frmTrebVid.dxDateEdit1.Date := odsSelDocMove.fieldbyname('data').asdatetime;
//    frmTrebVid.edxNumDoc.Text := odsSelDocMove.fieldbyname('fc_doc').asstring;
//    frmTrebVid.mdxComment.Lines.Text := odsSelDocMove.fieldbyname('fc_comment').asstring;
//    frmTrebVid.flMove := true;
//    if frmTrebVid.ShowModal = mrok then begin
//      dmMain.PkgPrihRash.DoSet(dmMain.PkgPrihRash.Getsumdoc(frmMoveList.idDocs, 2),
//        frmTrebVid.mdxComment.Lines.text,
//        frmTrebVid.edxNumDoc.text,
//        Date,
//        frmTrebVid.dxDateEdit1.date,
//        frmTrebVid.odsMOToTrebMOID.AsInteger,
//        idDocs,
//        frmTrebVid.odsMofromTrebMOID.asinteger, 2);
//      odsSelDocMove.refresh;
//      odsSelDocMove.Locate('dpid', idDocs, []);
//      acdel.Enabled := true;
//      acedit.Enabled := true;
//      dmMain.os.Commit;
//    end
//    else
//      dmMain.os.RollbackToSavepoint('movetreb');
//
//    exit;
//  end;
//  dmMain.os.Savepoint('move');
//  Screen.Cursor := crSQLWait;
//  Application.CreateForm(TfrmMoveEdit, frmMoveEdit);
//  flIns := false;
//  frmMoveEdit.flIns := False;
//  frmMoveEdit.idDocs := idDocs;
//  frmMoveEdit.MOOWNERID := odsSelDocMove.FieldByName('MOOWNERID').AsInteger;
//  frmMoveEdit.FD_DATA := odsSelDocMove.FieldByName('FD_DATA').AsDateTime;
//
//  frmMoveEdit.odskart.SetVariable('adpid', odsSelDocMove.fieldbyname('dpid').asinteger);
//  frmMoveEdit.odskart.refresh;
//  frmMoveEdit.cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(frmMoveList.idDocs, 2);
//  frmMoveEdit.LCBPostav.KeyValue := odsSelDocMove.fieldbyname('mofromid').asinteger;
//  frmMoveEdit.LCBto.KeyValue := odsSelDocMove.fieldbyname('motoid').asinteger;
//  frmMoveEdit.deRegisterDate.Date := odsSelDocMove.fieldbyname('data').asdatetime;
//  frmMoveEdit.eNumDoc.Text := odsSelDocMove.fieldbyname('fc_doc').asstring;
//  frmMoveEdit.mComment.Lines.Text := odsSelDocMove.fieldbyname('fc_comment').asstring;
//  if frmMoveEdit.ShowModal = mrok then begin
//    dmMain.PkgPrihRash.DoSet(strtofloat(frmMoveEdit.cePriceDoc.text),
//      frmMoveEdit.mComment.Lines.text,
//      frmMoveEdit.eNumDoc.text,
//      Date,
//      frmMoveEdit.deRegisterDate.date,
//      frmMoveEdit.odsNametomove.fieldbyname('moid').asinteger,
//      idDocs,
//      frmMoveEdit.odsNamefrommove.fieldbyname('moid').asinteger, 2);
//    odsSelDocMove.refresh;
//    odsSelDocMove.Locate('dpid', idDocs, []);
//    dmMain.os.Commit;
//  end
//  else
//    dmMain.os.RollbackToSavepoint('move');
end;

procedure TfrmMoveList.FormMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if frmMain.tbPrih.ImageIndex <> 49 then
    frmMain.tbPrih.ImageIndex := 51;
  if frmMain.tbInvList.ImageIndex <> 49 then
    frmMain.tbInvList.ImageIndex := 51;
  if frmMain.tbMove.ImageIndex <> 49 then
    frmMain.tbMove.ImageIndex := 51;
end;

procedure TfrmMoveList.FormStorageAfterRestorePlacement(Sender: TObject);
begin
 cxGridRashKartDBTableView1.RestoreFromRegistry('LowerGridLayot');
end;

procedure TfrmMoveList.FormStorageAfterSavePlacement(Sender: TObject);
begin
 cxGridRashKartDBTableView1.StoreToRegistry('LowerGridLayot');
end;

procedure TfrmMoveList.Action1Execute(Sender: TObject);
begin
  if trunc(frmMoveList.odsSelDocMove.fieldbyname('DATA').AsDateTime) <= trunc(dateclose) then
  begin
    windows.MessageBox(Self.Handle, PChar('Удаление невозможно!' + #10#13 +
      'Период закрыт (' + FormatDateTime('dd.mm.yyyy',DateClose) + ')'), 'Предупреждение', MB_OK);
    exit;
	end;
//	if ((odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = 5) OR (odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = 7)) and                //приход который отображается
//		(odsSelDocMove.FieldByName('MOTOID').AsInteger = dmMain.pkgMedSes.GetCurmo) // у СМС как расход
	if (odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger in [2,3]) and                //приход который отображается
		(odsSelDocMove.FieldByName('fk_mogroupid_to').AsInteger = dmMain.FK_CurMO_GROUP) // у СМС как расход
  then
  begin
    windows.MessageBox(Self.Handle, PChar('Удаление прихода невозможно!'), 'Предупреждение', MB_OK);
    exit;
  end;
  if windows.MessageBoxEx(Self.Handle, PChar('Вы действительно хотите удалить данную запись ?'), 'Предупреждение', MB_YESNO + MB_ICONQUESTION,$0419 {Russian}) = mrYes then begin
    dmMain.pkgprihrash.Dodeltreb(odsSelDocMove.FieldByName('DPID').AsInteger);
    dmMain.pkgprihrash.Dodelvoz(odsSelDocMove.FieldByName('DPID').AsInteger);
    dmMain.pkgprihrash.Dodeltrebvid(odsSelDocMove.FieldByName('DPID').AsInteger);
    dmMain.PkgPrihRash.dodel(odsSelDocMove.fieldbyname('dpid').asinteger);
    dmMain.os.Commit;
    odsSelDocMove.refresh;
    if odsSelDocMove.RecordCount <= 0 then
    begin
      acdel.Enabled := false;
      acedit.Enabled := false;
    end;
  end;
end;

procedure TfrmMoveList.FormCreate(Sender: TObject);
var
  CurDate : TDate;
  TempODS : TOracleDataSet;
begin
  v_pr_prn:=False;
//  fmainform.FormStorageRestorePlacement(FormStorage, TForm(self));
//  fmainform.CheckOnMaximize(TForm(self));
  CurDate := Trunc(ServerDate(dmMain.os));
  FNotRefresh := True;
  chbDate1.Checked := UpperCase(IniReadString( iniFileName, Self.Name, 'dpeDate1Checked',  'TRUE')) = 'TRUE';
  chbDate2.Checked := UpperCase(IniReadString( iniFileName, Self.Name, 'dpeDate2Checked',  'TRUE')) = 'TRUE';
  dedDate1.EditValue := StrToDate(IniReadString( iniFileName, Self.Name, 'dpeDate1Date', DateToStr(CurDate )) );
  dedDate2.EditValue := StrToDate(IniReadString( iniFileName, Self.Name, 'dpeDate2Date', DateToStr(CurDate)) );
  // если дата из настроек не влючает сегодняшний день, то ставим периодом текущий день
  if (chbDate1.Checked)and(Trunc(dedDate1.Date) > CurDate)or(Trunc(dedDate2.Date) < CurDate)and(chbDate2.Checked) then
  begin
    dedDate1.EditValue := CurDate;
    dedDate2.EditValue := CurDate;
  end;
  FNotRefresh := False;

  FGodMode := False; // всемогущий режим изначально должен быть выключен
  acGodMode.Enabled := False; // Человек не может быть Богом!
  // настройка функций в зависимости от статуса пользователя

  acInsertByTreb.Enabled := (frmMain.ProvisorState = 1)and((dmMain.ConfigParams.GetParamValue('FUNC_USE_RASH_BY_TREB', 1) = 1)); // расход по требованию может делать только провизор
  acInsertByTreb.Visible := acInsertByTreb.Enabled;

  acins.Enabled := (frmMain.ProvisorState = 0)or((dmMain.ConfigParams.GetParamValue('FUNC_USE_MOVE_TO_MOGROUP_BY_PROVIZOR', 0) = 1)); // передача другому отделению может делать только мс
  acins.Visible := acins.Enabled;

  acTreb.Enabled := (frmMain.ProvisorState = 1)and(dmMain.ConfigParams.GetParamValue('FUNC_USE_RASH_BY_TREB', 1) = 1); // требования в расходе у провизора
  acTreb.Visible := acTreb.Enabled;
  acReturnPostav.Enabled := frmMain.ProvisorState = 1; // возвраты делают только провизоры
  acReturnPostav.Visible := frmMain.ProvisorState = 1;
  acOtpuskPoNacPr.Enabled := frmMain.ProvisorState = 1;
  acOtpuskPoNacPr.Visible := frmMain.ProvisorState = 1;
  acOtpuskPoCelProg.Enabled := frmMain.ProvisorState = 1;
  acOtpuskPoCelProg.Visible := frmMain.ProvisorState = 1;
  // показываем/скрываем работу с резервом
  miRezervSeparator.Visible := frmMain.ProvisorState = 1;
  acToRezerv.Visible        := ((frmMain.ProvisorState = 1) and (dmMain.ConfigParams.GetParamValue('FUNC_RESTRICT_REZERV', 0) = 0))
                                or ((dmMain.ConfigParams.GetParamValue('FUNC_RESTRICT_REZERV', 0) = 1) and (dmMain.ConfigParams.GetParamValue('FUNC_MOVE_TO_OR_FROM_REZERV', false)));
  acToRezerv.Enabled        := acToRezerv.Visible;

  acReturn.Visible := (frmMain.ProvisorState = 0)and(dmMain.ConfigParams.GetParamValue('FUNC_RETURN', 0) = 1);
  acReturn.Enabled := acReturn.Visible; // может делать только МС - для провизора нет смылса возвращать самому себе

  acSpisanieHITEC.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_SPIS_HITEC', 0) = 1);
  acSpisanieHITEC.Enabled := acSpisanieHITEC.Visible;

  N22.Visible := acReturnPostav.Visible;
  N23.Visible := acOtpuskPoCelProg.Visible or acOtpuskPoNacPr.Visible;

  if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_INV_NOMER', 0) = 0 then
  begin
    cxGridRashKartDBTableView1fc_inv_nomer.Visible := False;
    cxGridRashKartDBTableView1fc_inv_nomer.VisibleForCustomization := False;
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_PRINT_VEDOM_VIBORKI', 0) = 1) then
  begin
    acPrnBordereauSample.Enabled := True;
    acPrnBordereauSample.Visible := True;
    tbuPrint.Style := tbsDropDown;
    tbuPrint.DropdownMenu := pmPrint2;
    miPrint.OnClick := tbuPrint.OnClick;
    tbuPrint.OnClick := nil;
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 0) then
  begin
    cxGridRashKartDBTableView1FC_QUOTA_CODE.Visible := False;
    cxGridRashKartDBTableView1FC_QUOTA_CODE.VisibleForCustomization := False;    
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

  if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 0 then
  begin
    cxGridRashKartDBTableView1FK_FINSOURCE_ID.Visible := False;
    cxGridRashKartDBTableView1FK_FINSOURCE_ID.VisibleForCustomization := False;
  end; 

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_PROFIL', 0) = 0 then
  begin
    cxGridMoveListDBTableView1FC_PROFIL.Visible := False;
    cxGridMoveListDBTableView1FC_PROFIL.VisibleForCustomization := False;
  end;

  FL_UNSIGN_RIGHT := dmMain.ConfigParams.GetParamValue('FUNC_UNSIGN_DOC_RIGHT', False);

  odsSelDocMove.AfterScroll:=nil;
//  odsSelDocMove.Close;
//  odsSelDocMove.Open;
  acrefresh.Execute;
  odsKart.Open;
  cxGridMoveListDBTableView1.Controller.GoToFirst;
  odsSelDocMove.AfterScroll:=odsSelDocMoveAfterScroll;
  odsSelDocMove.AfterScroll(odsSelDocMove);
  odsLastName.Close;
  odsLastName.Open;

  frxRepMoveToOtd.AddFunction('function MONEYSTR(Summa: double): string');
//  frxRepMoveToOtd.AddFunction('function ROUND_TO(aFloatNum : double; aDigits : integer): double');
  frxRepMoveToOtd.AddFunction('function IniWriteString2(Section, Ident: string; Value: string) : integer');
//  frxRepMoveToOtd.AddFunction('function IniWriteString3(Section, Ident: string; Value: string) : integer');
//  frxRepMoveToOtd.AddFunction('function DoShowSelectMO_str(aFC_MO : string) : string');
//  frxRepMoveToOtd.AddFunction('function GetValueFromTSMINI(aSection, aKey : string ) : string');
  frxRepMoveToOtd.AddFunction('function IniReadString2(Section, Ident: string; Default: string = ''): string');

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_APTEKA) then
    case frmMain.ProvisorState of
  //    0 : acSpisanie.Caption := 'Списание на пациента'; // так было Воронов О.А. 20071210
      0 : if (dmMain.ConfigParams.GetParamValue('FUNC_SPIS_PRICH_BY_SMS', 0) = 0) then
            acSpisanie.Caption := 'Списание на пациента'
          else
            acSpisanie.Caption := 'Списание';
      1 : if (dmMain.ConfigParams.GetParamValue('FUNC_SPIS_ON_PAC_BY_PROVIZOR', 0) = 0) then
            acSpisanie.Caption := 'Расход по акту списания'
          else
            acSpisanie.Caption := 'Списание';
    else
      acSpisanie.Caption := 'Списание';
    end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN) then
    acSpisanie.Caption := 'Расход по акту списания';

   ActTrebNaklShort.Visible := (dmMain.ConfigParams.GetParamValue('IS_SHORT_NAKL', 0) = 1); //Add Malev A.V. 07/06/2013

//  cxGridMoveListDBTableView1.RestoreFromRegistry('\SoftWare\SoftMaster\Medica\'+Self.Name,True,False, [gsoUseFilter]);
  try
    cxGridMoveListDBTableView1.RestoreFromIniFile(iniFileName,True,False, [gsoUseFilter]);
  except
  end;

  // для Хант Акт списания по учетным группам
  miActSpis_var3.Visible:= (dmMain.sDB_NAME ='H'); // False;
  tbActSpisUchGroupsHANTY.Visible:= (dmMain.sDB_NAME ='H'); // False; 

  CurMOGroup := dmMain.FK_CurMO_GROUP ;
  CurMOGroupName := dmMain.FC_CurMO_GROUP ;

 { TestCheckGroup(6);

  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
      FK_APPSOTR_ID := -1;
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;
  CurMOGroup := oqInitMO.GetVariable('NMO_GROUP');


  TestCheckGroup(7);

  odsGroupMo.Open;
  try
    CurMOGroupName := '';
    if odsGroupMo.Locate('GROUPID', CurMOGroup, []) then
      CurMOGroupName := odsGroupMo.FieldByName('FC_GROUP').AsString;
  finally
    odsGroupMo.Close;
  end;  }

end;

procedure TfrmMoveList.acPrnConsuptionActExecute(Sender: TObject);
var
  p : TfrPreview;
  S : string;
  i,i2 : integer;
  PageFooterExists : boolean;
  Params : TArrayOfParams;
begin
  FZaklKom := '';
  FSpisano := '';
  FPrikaz  := '';

  i2 := 0;
  SetLength( Params, 1);
  Params[i2].Name := 'Председатель';
  Params[i2].Value := IniReadString2('Act_Spis', 'Predsed', '');
  Params[i2].ParamType := 1;
  inc( i2 );

  i := dmMain.ConfigParams.GetParamValue('FUNC_COUNT_SPIS_CHLEN_KOM', 3);
  SetLength( FKom,  i );
  SetLength( Params, Length(Params)+i);
  for i := 0 to Length(FKom) - 1 do
  begin
    Params[i2].Name := 'Член ком.'+IntToStr(i+1);
    Params[i2].Value := IniReadString2('Act_Spis', 'ChlenKom'+IntToStr(i+1), '');
    Params[i2].ParamType := 1;
    inc( i2 );
  end;

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Мат. отв. лицо';
  Params[i2].Value := IniReadString(iniFileName,'Act_Spis', 'MO', '');
  Params[i2].ParamType := 1;
  inc( i2 );

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Утверждаю (ФИО)';
  Params[i2].Value := IniReadString(iniFileName,'Act_Spis', 'UTVERJDAYU_FIO', '');
  Params[i2].ParamType := 1;
  inc( i2 );


  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Должн. председателя';
  Params[i2].Value := IniReadString2('Act_Spis', 'DoljnChlenPredsed', '');
  Params[i2].ParamType := 0;
  inc( i2 );
  i := dmMain.ConfigParams.GetParamValue('FUNC_COUNT_SPIS_CHLEN_KOM', 3);
  SetLength( FDolKom, i );
  SetLength( Params, Length(Params)+i);
  for i := 0 to Length(FDolKom) - 1 do
  begin
    Params[i2].Name := 'Должн. члена ком.'+IntToStr(i+1);
    Params[i2].Value := IniReadString2('Act_Spis', 'DoljnChlenKom'+IntToStr(i+1), '');
    Params[i2].ParamType := 0;
    inc( i2 );
  end;


  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_ZAV_OTD_IN_ACT_SPIS', 0) = 1) then
  begin
    SetLength( Params, Length(Params)+1);
    Params[i2].Name := 'Зав.отделением';
    Params[i2].Value := IniReadString2('Act_Spis', 'ZAV_OTD', '');
    Params[i2].ParamType := 1;
    inc( i2 );
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_SMS_IN_ACT_SPIS', 0) = 1) then
  begin
    SetLength( Params, Length(Params)+1);
    Params[i2].Name := 'Ст.медсестра';
    Params[i2].Value := IniReadString2('Act_Spis', 'SMS', '');
    Params[i2].ParamType := 1;
//    inc( i2 );
  end;    

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Должность МО';
  Params[i2].Value := IniReadString(iniFileName,'Act_Spis', 'DoljnMO', '');
  Params[i2].ParamType := 0;
  inc( i2 );

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Утверждаю (Должн.)';
  Params[i2].Value := IniReadString(iniFileName,'Act_Spis', 'UTVERJDAYU_DOLJN', '');
  Params[i2].ParamType := 0;
  inc( i2 );

  if (dmMain.ConfigParams.GetParamValue('FUNC_SAVE_ZAKL_KOM', 0) = 1) then
  begin
    FZaklKom := StringReplace(IniReadString2('Act_Spis', 'ZAKL_KOM', ''), '#13#10', #13#10, [rfReplaceAll] );
  end;

  FPrikaz := IniReadString2('Act_Spis', 'PrikazOt', 'от "___"  ____________  20___ г  № ___');

  if DoShowReportInputActSpis(dmMain.os, Params, FZaklKom, FSpisano, FPrikaz) <> mrOk then
  begin
    Exit;
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_SAVE_ZAKL_KOM', 0) = 1) then
  begin
    IniWriteString2('Act_Spis', 'ZAKL_KOM', StringReplace(FZaklKom, #13#10, '#13#10', [rfReplaceAll]) );
  end;

  for i := 0 to Length(Params) - 1 do
  begin
    if Params[i].Name = 'Председатель' then FPred := Params[i].Value;

    if pos('Член ком.', Params[i].Name) > 0 then
      for i2 := 0 to Length(FKom) - 1 do
        if Params[i].Name = 'Член ком.'+IntToStr(i2+1) then FKom[i2] := Params[i].Value;

    if Params[i].Name = 'Мат. отв. лицо' then FMO := Params[i].Value;
    if Params[i].Name = 'Утверждаю (ФИО)' then FUTVERJDAYU_FIO := Params[i].Value;

    if Params[i].Name = 'Должн. председателя' then FDolPred := Params[i].Value;

    if pos('Должн. члена ком.', Params[i].Name) > 0 then
      for i2 := 0 to Length(FDolKom) - 1 do
        if Params[i].Name = 'Должн. члена ком.'+IntToStr(i2+1) then FDolKom[i2] := Params[i].Value;

    if Params[i].Name = 'Должность МО' then FDolMO := Params[i].Value;
    if Params[i].Name = 'Утверждаю (Должн.)' then FUTVERJDAYU_DOLJN := Params[i].Value;

    if (dmMain.ConfigParams.GetParamValue('FUNC_USE_ZAV_OTD_IN_ACT_SPIS', 0) = 1) then
    begin
      if Params[i].Name = 'Зав.отделением' then FZavOtd := Params[i].Value;
    end;

    if (dmMain.ConfigParams.GetParamValue('FUNC_USE_SMS_IN_ACT_SPIS', 0) = 1) then
    begin
      if Params[i].Name = 'Ст.медсестра' then FSMS := Params[i].Value;
    end;
  end;

  IniWriteString2('Act_Spis', 'Predsed',           FPred   );

  for i := 0 to Length(FKom) - 1 do
    IniWriteString2('Act_Spis', 'ChlenKom'+IntToStr(i+1),    FKom[i]);

  IniWriteString2('Act_Spis', 'MO',                FMO   );

  IniWriteString2('Act_Spis', 'DoljnMO',          FDolMO   );

  IniWriteString2('Act_Spis', 'UTVERJDAYU_FIO',          FUTVERJDAYU_FIO   );
  IniWriteString2('Act_Spis', 'UTVERJDAYU_DOLJN',          FUTVERJDAYU_DOLJN   );

  IniWriteString2('Act_Spis', 'DoljnChlenPredsed', FDolPred);
  for i := 0 to Length(FDolKom) - 1 do
    IniWriteString2('Act_Spis', 'DoljnChlenKom'+IntToStr(i+1),    FDolKom[i]);

  IniWriteString2('Act_Spis', 'PrikazOt',          FPrikaz);

  IniWriteString2('Act_Spis', 'ZAV_OTD',    FZavOtd);
  IniWriteString2('Act_Spis', 'SMS',        FSMS);


  odsActSpisRep.ClearVariables;
  odsActSpisRep.SetVariable('adpid', odsSelDocMove.FieldByName('DPID').AsInteger);
  if (dmMain.ConfigParams.GetParamValue('FUNC_FIN_SOURCE_IN_ACT_SPIS', 0) = 1) then
    odsActSpisRep.SetVariable('FIN_SOURCE_ORDER', ' fs.fc_name, ');
  odsActSpisRep.close;
  odsActSpisRep.open;

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_ONLY_FR4', 0) = 1) then     //Переход на FastReport 4
  begin
    frxActSpis.AddFunction('function GETZAKLKOM(): string');
    frxActSpis.AddFunction('function GETSPISANO(): string');
    frxActSpis.AddFunction('function MONEYSTR(Summa: double) : string');
    frxActSpis.AddFunction('function GET_NAIM_KOL(aNumber: Integer; aRod : Integer) : string');

    if (odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_SPISANIE_RPO) and FileExists('frxActSpisInRPO.fr3') then
      frxActSpis.LoadFromFile('frxActSpisInRPO.fr3')
    else
    begin
      //Выбор вида акта (по медикаментам/по расходным материалам)
      case nTypeActSpis of
        0: frxActSpis.LoadFromFile('frxActSpis.fr3');
        1: frxActSpis.LoadFromFile('frxActSpis_RM.fr3');
      else frxActSpis.LoadFromFile('frxActSpis.fr3');
      end;

      nTypeActSpis := 0;
    end;

    frxActSpis.PrepareReport;
    case dmPrintSelect.PrintFlag of // флаг куда печатать
      1:
      begin
        PageFooterExists := (frxActSpis.FindObject('PageFooter1') <> nil);
        if PageFooterExists then
          frxActSpis.FindObject('PageFooter1').Visible := False;
        ExportFRToExcel( frxActSpis, odsSelDocMove.FieldByName('FC_DOCMIX').AsString );
        if PageFooterExists then
          frxActSpis.FindObject('PageFooter1').Visible := True;
      end;                                                      
      2:
      begin
        frxActSpis.ShowPreparedReport;
      end;
    end;
  end
  else
  begin
    if (odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_SPISANIE_RPO) and FileExists('frActSpisInRPO.frf') then
      frActSpis.LoadFromFile('frActSpisInRPO.frf')
    else
    begin
      //Выбор вида акта (по медикаментам/по расходным материалам)
      case nTypeActSpis of
        0: frActSpis.LoadFromFile('frActSpis.frf');
        1: frActSpis.LoadFromFile('frActSpis_RM.frf');
      else frActSpis.LoadFromFile('frActSpis.frf');
      end;

      nTypeActSpis := 0;
    end;

    if (odsSelDocMove.FieldByName('FN_SPISANIEVID').AsInteger = SPISANIE_VID_AMBTALON) and FileExists('frActSpisForAmbTalon.frf') then
      frActSpis.LoadFromFile('frActSpisForAmbTalon.frf');       

    frActSpis.PrepareReport;
    case dmPrintSelect.PrintFlag of // флаг куда печатать
      1:
      begin
        PageFooterExists := (frActSpis.FindObject('PageFooter1') <> nil);
        if PageFooterExists then
          frActSpis.FindObject('PageFooter1').Visible := False;
        frActSpis.PrepareReport;
        ExportFRToExcel( frActSpis, odsSelDocMove.FieldByName('FC_DOCMIX').AsString+'.xls' );
        if PageFooterExists then
          frActSpis.FindObject('PageFooter1').Visible := True;
      end;

      2:
      begin
        p := TfrPreview.Create(frActSpis);
        CurReport := frActSpis;
        MasterReport := frActSpis;
        DocMode := dmPrinting;
        CurBand := nil;
        if frActSpis.EMFPages.Count = 0 then Exit;
        s := frLoadStr(SPreview);
        if frActSpis.Title <> '' then s := s + ' - ' + frActSpis.Title;
        p.Window.Caption := s;
        frActSpis.Preview := p;
        frActSpis.Preview.Window.Show_Modal(frActSpis);
        Application.ProcessMessages;
        frActSpis.Preview.Window := nil;
        frActSpis.Preview := nil;
        p.Free;
      end;
    end;
  end;

  odsActSpisRep.Close;
  SetLength(Params, 0);
end;

procedure TfrmMoveList.acPrnBordereauSampleExecute(Sender: TObject);
var frmfionakl : Tfrmfionakl;
begin
  frmfionakl := Tfrmfionakl.Create(Self);
  try
    odsLastDate.SetVariable('amoid', odsSelDocMove.FieldByNAme('MOFROMID').AsInteger);
    odsLastDate.SetVariable('adata', odsSelDocMove.FieldByNAme('DATA').Asdatetime);
    odsLastDate.Close;
    odsLastDate.Open;

    frmFIONakl.Label1.Visible := true;
    frmFIONakl.Label2.Visible := true;
    frmFIONakl.Label3.Visible := true;
    frmFIONakl.Label4.Visible := true;
    frmFIONakl.Label5.Visible := true;
    frmFIONakl.Label6.Visible := true;
    frmFIONakl.Label7.Visible := true;
    frmFIONakl.Label8.Visible := true;
    frmFIONakl.esos.Visible := true;
    frmFIONakl.epro1.Visible := true;
    frmFIONakl.epro2.Visible := true;
    frmFIONakl.epro3.Visible := true;
    frmFIONakl.edolsos.Visible := true;
    frmFIONakl.edolpro.Visible := true;
    frmFIONakl.edolpro2.Visible := true;
    frmFIONakl.edolpro3.Visible := true;
    frmFIONakl.esos.Text := '';//odsSelRashDocFC_COMMENT.asstring;
    frmFIONakl.epro1.Text := '';//'Носиков Г.И.';
    frmFIONakl.epro2.Text := '';//'Склярова Н.В.';
    frmFIONakl.epro3.Text := '';//'Саковец Е.Б.';
    frmFIONakl.edolpro.Text := '';//'Зам. начальника по лечебно-оздоровительной работе';
    frmFIONakl.edolpro2.Text := '';//'Гл. Бухгалтер';
    frmFIONakl.edolpro3.Text := '';//'Провизор';
    frmFIONakl.eDolsos.Text := '';//'Медсестра';
    frmFIONakl.ePro.Text := '';//'Нетипанова Г.Н.';
    frmFIONakl.eDolP.Text := '';//'Экономист';

    frmFIONakl.eDolotp.Visible := false;
    frmFIONakl.eDolpol.Visible := false;
    frmFIONakl.eotp.Visible := false;
    frmFIONakl.ePol.Visible := false;
    frmFIONakl.pol1.Visible := false;
    frmFIONakl.otp.Visible := false;
    frmFIONakl.dolotp.Visible := false;
		frmFIONakl.dolpol.Visible := false;

    frmFIONakl.HelpContext:=32;
    if frmFIONakl.ShowModal = mrOk then
    begin
      odsVed.SetVariable('pol', frmFIONakl.esos.text);
      odsVed.SetVariable('otp', frmFIONakl.epro1.text);
      odsVed.SetVariable('otp1', frmFIONakl.epro2.text);
      odsVed.SetVariable('otp2', frmFIONakl.epro3.text);
      odsVed.SetVariable('dolpol', frmFIONakl.edolsos.text);
      odsVed.SetVariable('dolotp', frmFIONakl.edolpro.text);
      odsVed.SetVariable('dolotp1', frmFIONakl.edolpro2.text);
      odsVed.SetVariable('dolotp2', frmFIONakl.edolpro3.text);
      odsVed.SetVariable('AGROUPID', odsSelDocMove.FieldByNAme('fk_mogroupid_from').AsInteger);
//      odsVed.SetVariable('adpid', odsSelDocMove.FieldByNAme('DPID').AsInteger);
      odsVed.SetVariable('otp4', frmFIONakl.epro.Text);
      odsVed.SetVariable('dolotp4', frmFIONakl.edolp.Text);

      odsVed.SetVariable('date1', dedDate1.Date);
      odsVed.SetVariable('date2', dedDate2.Date);

      odsVed.close;
      odsVed.open;
      frVedomost.ShowReport;
      odsVed.close;
    end;
  finally
    frmfionakl.Free;
  end;
end;

procedure TfrmMoveList.acPrnInvoiceExecute(Sender: TObject);
//var p         : TfrPreview;
//    s         : String;
//    frmFioZav : TfrmFioZav;
begin
//odsSelDocMove.FieldByName('DPID').AsInteger                                                                                                                                 aFC_MO_GR_FROM, aFC_MO_GR_TO: string
  case dmMain.ConfigParams.GetParamValue('Func_Set', FUNC_SET_HANTI) of
    FUNC_SET_MID:
    begin
//      odsInvoice2.Close;
//      odsInvoice2.SetVariable('ADPID', odsSelDocMove.FieldByName('DPID').AsInteger);
//      odsInvoice2.Open;
//      frInvoice2.PrepareReport;
//      p := TfrPreview.Create(frInvoice2);
//      CurReport := frInvoice2;
//      MasterReport := frInvoice2;
//      DocMode := dmPrinting;
//      CurBand := nil;
//      if frInvoice2.EMFPages.Count = 0 then Exit;
//      s := frLoadStr(SPreview);
//      if frInvoice2.Title <> '' then s := s + ' - ' + frInvoice2.Title;
//      p.Window.Caption := s;
//      frInvoice2.Preview := p;
//
//      frInvoice2.Preview.Window.Show_Modal(frInvoice2);
//      Application.ProcessMessages;
//      frInvoice2.Preview.Window := nil;
//      odsInvoice2.Close;
      dmPrintReports.PrintTrebOld(odsSelDocMove.FieldByName('DPID').AsInteger,
                                  odsSelDocMove.FieldByName('FC_DOC').AsString,
                                  odsSelDocMove.FieldByName('FD_INVOICE').AsDateTime,
                                  odsSelDocMove.FieldByName('FC_MOGROUPID_FROM_ORIG').AsString,
                                  odsSelDocMove.FieldByName('FC_MOGROUPID_TO_ORIG').AsString,
                                  odsSelDocMove.FieldByName('NAMEFROM').AsString,
                                  odsSelDocMove.FieldByName('NAMETO').AsString);
    end;

    else
  //   FUNC_SET_HANTI:
    begin
      dmPrintReports.PrintTreb( odsSelDocMove.FieldByName('DPID').AsInteger,
                                odsSelDocMove.FieldByName('FC_DOC').AsString,
                                odsSelDocMove.FieldByName('FD_INVOICE').AsDateTime,
                                odsSelDocMove.FieldByName('FC_MOGROUPID_FROM_ORIG').AsString,
                                odsSelDocMove.FieldByName('FC_MOGROUPID_TO_ORIG').AsString,
                                odsSelDocMove.FieldByName('FC_DOCMIX').AsString+'.xls',
                                odsSelDocMove.FieldByName('NAMEFROM').AsString,
                                odsSelDocMove.FieldByName('NAMETO').AsString,
                                (dmMain.ConfigParams.GetParamValue('FUNC_IS_PRINT_TREB_NAKL_ABSENT_MEDICS', False)),
//                                (cSKLAD_SYNONIM_IMN <> dmMain.CurMO_SKLAD_SYNONIM),
                                fdmMain.nvl(odsSelDocMove.FieldByName('mogr_from_fk_sklad_id').AsInteger,-1),
                                -1,  // default
                                False, // default
                                False, // default
                                acPrnNarcoticAct.Enabled  );
    end;
  end;

//------------------------------------------------------------------------------
{  if ((GetKeyState(VK_SHIFT) and $8000) <> 0) //зажата клавиша шифт
    or (IniReadString(iniFileName,'ZavOtdel','bShow','1') = '1') then
  begin
    frmFioZav := TfrmFioZav.Create(nil);
    try
      frmFioZav.edFam.Text := IniReadString(iniFileName,'ZavOtdel','FIO');
      frmFioZav.cbDontShow.Checked := not Boolean(StrToInt(IniReadString(iniFileName,'ZavOtdel','bShow','1')));
      if frmFioZav.ShowModal = mrCancel then Exit;
      if frmFioZav.cbDontShow.Checked and (Application.MessageBox('Вы уверены что не хотите больше выводить это окно?',
        'Внимание', mb_yesno + mb_iconquestion + mb_defbutton2) = idyes) then
        IniWriteString(iniFileName,'ZavOtdel','bShow','0');
      if not frmFioZav.cbDontShow.Checked then
        IniWriteString(iniFileName,'ZavOtdel','bShow','1');
      IniWriteString(iniFileName,'ZavOtdel','FIO',frmFioZav.edFam.Text);
    finally
      frmFioZav.Free;
    end;
  end;

//  frTrebNakl.ShowReport;
  frTrebNakl.PrepareReport;
  p := TfrPreview.Create(frTrebNakl);
  CurReport := frTrebNakl;
  MasterReport := frTrebNakl;
  DocMode := dmPrinting;
  CurBand := nil;
  if frTrebNakl.EMFPages.Count = 0 then Exit;
  s := frLoadStr(SPreview);
  if frTrebNakl.Title <> '' then s := s + ' - ' + frTrebNakl.Title;
  p.Window.Caption := s;
  frTrebNakl.Preview := p;

  frTrebNakl.Preview.Window.Show_Modal(frTrebNakl);
  Application.ProcessMessages;
  frTrebNakl.Preview.Window := nil;}



//------------------------------------------------------------------------------

//  //расход
//  frmfionakl := Tfrmfionakl.Create(Self);
//  try
//    frmFIONakl.Label1.Visible := true;
//    frmFIONakl.Label1.Caption := 'Отпустил';
//    frmFIONakl.Label2.Visible := true;
//    frmFIONakl.Label2.Caption := 'Получил';
//    frmFIONakl.Label3.Visible := true;
//    frmFIONakl.Label3.Caption := 'Проверил';
//    //  frmFIONakl.Label4.Visible := true;
//    frmFIONakl.Label5.Visible := true;
//    frmFIONakl.Label5.Caption := 'Должность отпустившего';
//    frmFIONakl.Label6.Visible := true;
//    frmFIONakl.Label6.Caption := 'Должность получившего';
//    frmFIONakl.Label7.Visible := true;
//    frmFIONakl.Label7.Caption := 'Должность проверившего';
//    //  frmFIONakl.Label8.Visible := true;
//    frmFIONakl.esos.Visible := true;
//    frmFIONakl.epro1.Visible := true;
//    frmFIONakl.epro2.Visible := true;
//    //  frmFIONakl.epro3.Visible := true;
//    frmFIONakl.edolsos.Visible := true;
//    frmFIONakl.edolpro.Visible := true;
//    frmFIONakl.edolpro2.Visible := true;
//    //  frmFIONakl.edolpro3.Visible := true;
//    frmFIONakl.epro1.Text := '';
//    frmFIONakl.epro2.Text := '';
//    frmFIONakl.epro3.Text := '';
//    frmFIONakl.edolpro.Text := '';
//    frmFIONakl.edolpro2.Text := '';
//    //  frmFIONakl.edolpro3.Text := 'Провизор';
//
//    frmFIONakl.eDolotp.Visible := false;
//    frmFIONakl.eDolpol.Visible := false;
//    frmFIONakl.eotp.Visible := false;
//    frmFIONakl.ePol.Visible := false;
//    frmFIONakl.pol1.Visible := false;
//    frmFIONakl.otp.Visible := false;
//    frmFIONakl.dolotp.Visible := false;
//    frmFIONakl.dolpol.Visible := false;
//
//    if frmFIONakl.ShowModal = mrOk then
//    begin
//      //при печати накладной проставляем "Расход"
//      if (odsSelDocMove.FieldByName('FL_EDIT').AsInteger = 1) and
//         (odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger <> 5)
//      then DoSetEditDoc(5);
//      odsVed.SetVariable('pol', frmFIONakl.esos.text);
//      odsVed.SetVariable('otp', frmFIONakl.epro1.text);
//      odsVed.SetVariable('otp1', frmFIONakl.epro2.text);
//      odsVed.SetVariable('otp2', frmFIONakl.epro3.text);
//      odsVed.SetVariable('dolpol', frmFIONakl.edolsos.text);
//      odsVed.SetVariable('dolotp', frmFIONakl.edolpro.text);
//      odsVed.SetVariable('dolotp1', frmFIONakl.edolpro2.text);
//      odsVed.SetVariable('dolotp2', frmFIONakl.edolpro3.text);
//      odsVed.SetVariable('amoid', odsSelDocMove.FieldByNAme('MOFROMID').AsInteger);
//      odsVed.SetVariable('adpid', odsSelDocMove.FieldByNAme('DPID').AsInteger);
//      odsVed.close;
//      odsVed.open;
//      frInvoice.ShowReport;
//    end;
//  finally
//    frmfionakl.Free;
//  end;
end;

procedure TfrmMoveList.acSignExecute(Sender: TObject);
var
  sMess : string;
  CurDate : TDateTime; // тек.дата
begin
  CurDate := Date;
//#todo проверка остатков по карточкам
// чтобы не залазить в минуса
// см еще учет "красным"

// сейчас на этой форме отображаются только расходы Воронов О.А. 23.07.2007
  //приход который отображается у СМС как расход
//	if ((odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = 5) OR (odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = 7)) and(odsSelDocMove.FieldByName('MOTOID').AsInteger = dmMain.pkgMedSes.GetCurmo) then
//	if (odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger in [2,3]) and(odsSelDocMove.FieldByName('fk_mogroupid_to').AsInteger = dmMain.pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO) then
//	begin
//		Application.MessageBox(pChar('Невозможно подписать приход!'),'Ошибка',
//				mb_ok + mb_iconerror);
//		Exit;
//  end; 
//	if Application.MessageBox(pChar('Подписать документ № ' +

// теперь выводим сообщение в зависимости от подписанности документа
  case odsSelDocMove.FieldByName('fl_edit').AsInteger of
    0 :
    begin
      if odsSelDocMove.FieldByName('fp_vid').AsInteger <> 3 then
        sMess := CheckAndShowLinkedDocs( odsSelDocMove.FieldByName('DPID').AsInteger, nil, True, 'Обратите внимание на зависимые документы:' );
//        if sMess <> '' then Exit;
//      if sMess <> '' then
//        Application.MessageBox(pChar('Обратите внимание на зависимые документы:'#13#10#13#10+sMess),'Внимание', MB_OK + MB_ICONINFORMATION);
      sMess := 'Отменить подпись в документе № ' + odsSelDocMove.FieldByName('FC_DOC').AsString + '?';

    end
  else
  begin
    if ( dmMain.ConfigParams.GetParamValue('FUNC_USE_DOC_CHEK_OST_BY_REG_DATA', 0) = 1 ) then  // доп. проверка на наличие остатков на дату регистрации документа
    begin
       // проверка на наличие остатков на дату регистрации документа
       if CheckDocKol( odsSelDocMove.FieldByName('DPID').AsInteger, odsSelDocMove.FieldByName('FD_DATA').AsDateTime, 'Обратите внимание на нехватку остатков :' ) <> '' then
          Exit;
      { если делают раход будущим числом, то проверку делаем только на дату регистации}
      if ( CompareDate ( CurDate, odsSelDocMove.FieldByName('FD_DATA').AsDateTime ) > 0 ) then // оформляют "задним" числом
        if CheckDocKol( odsSelDocMove.FieldByName('DPID').AsInteger, CurDate, 'Обратите внимание на нехватку остатков :' ) <> '' then // проверяем на тек. датту
          Exit;
    end
    else
    if CheckDocKol( odsSelDocMove.FieldByName('DPID').AsInteger, CurDate, 'Обратите внимание на нехватку остатков :' ) <> '' then // проверяем на тек. датту
      Exit;

    sMess := 'Утвердить документ № ' + odsSelDocMove.FieldByName('FC_DOC').AsString + '?';
  end;

  end;

	if Application.MessageBox(pChar(sMess),'Внимание',
    mb_yesno + mb_iconquestion + mb_defbutton1) = idyes   then
      DoSetEditDoc;
end;

procedure TfrmMoveList.acReturnExecute(Sender: TObject);
//var
//    pidDocs : Variant;
//    str: integer;
begin
  ndata:=dmmain.pkgprihrash.GETRASHDATA(ServerDate(dmMain.os));
  dmmain.ncomment:='добавление';
  Screen.Cursor := crSQLWait;
  dmMain.os.Savepoint('return');

  idDocs := -1;
  if DoShowMoveEdit(idDocs, True, 2, 6) = mrOk then
  begin
		odsSelDocMove.refresh;
    odsSelDocMove.Locate('dpid', idDocs, []);
    acdel.Enabled := true;
    acedit.Enabled := true;
		dmMain.os.Commit;
//    cxGridMoveListDBTableView1.ApplyBestFit(nil);
  end
  else
    try
      dmMain.os.RollbackToSavepoint('return');
    except
    end;

{
//  idDocs := dmMain.PkgPrihRash.Createshablon(3, 6);   // такая нумерация не правильна - 3 - это списание, а здесь движение - 2
  idDocs := dmMain.PkgPrihRash.Createshablon(2, 6); // возврат (см. PKG_PRIHRASH.Get_PrihRashPriznak)
  Application.CreateForm(TfrmMoveEdit, frmMoveEdit);
  frmMoveEdit.SetViewMode(VIEW_MODE_RETURN, True, True );

//	frmMoveEdit.who_called:=2;  //  нажали движение > возврат
//	frmMoveEdit.flIns := false;
//	frmMoveEdit.flIns := true;
	frmMoveEdit.idDocs := idDocs;
	frmMoveEdit.MOOWNERID := odsSelDocMove.FieldByName('MOOWNERID').AsInteger;
	frmMoveEdit.FD_DATA := odsSelDocMove.FieldByName('FD_DATA').AsDateTime;
//	frmMoveEdit.bCanEdit := frmMoveList.odsSelDocMove.FieldByName('FL_EDIT').AsInteger <> 0;

	frmMoveEdit.bReturn := True;
	frmMoveEdit.deRegisterDate.Date := ServerDate(dmMain.os);
//  frmMoveEdit.LCBPostav.Enabled := True;
  //frmMoveEdit.LCBPostav.KeyValue := dmMain.pkgMedSes.GETCURMO;
  frmMoveEdit.lcbMO_GROUP_FROM.KeyValue := dmMain.pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO;  
  frmMoveEdit.lbDemand.Visible := False;
  frmMoveEdit.eNumDoc.Width := frmMoveEdit.eNumDoc.Width + (frmMoveEdit.eNumDoc.Left - frmMoveEdit.deRegisterDate.Left);
	frmMoveEdit.eNumDoc.Left := frmMoveEdit.deRegisterDate.Left;  }
//  основание слишком большое- письмо федеральной службы по надзору в сфере здравоохранения и социального развития
 
//--
//  odsLastName.Refresh;
//  odsLastName.Last;
//  while not odsLastName.Bof do
//  begin
//    if StrToIntDef(odsLastNameFC_DOC.AsString, 0) <> 0 then
//      break
//    else
//    begin
//      odsLastName.Prior;
//    end;
//  end;
//  str := strtointdef(odsLastNameFC_DOC.AsString, 0) + 1;
//  frmMoveEdit.eNumDoc.Text := inttostr(str);
//---
{  if frmMoveEdit.ShowModal = mrok then begin
    dmMain.PkgPrihRash.DoSet(dmMain.PkgPrihRash.Getsumdoc(idDocs, 2),
      frmMoveEdit.mComment.text,
      frmMoveEdit.eNumDoc.text,
      frmMoveEdit.deInvoiceDate.Date,
      frmMoveEdit.deRegisterDate.date,
      -1, //frmMoveEdit.LcbTo.KeyValue,
      nvl(frmMoveEdit.lcbMO_GROUP_TO.KeyValue, 0),
//      frmMoveEdit.odsNametomove.fieldbyname('moid').asinteger,
      idDocs,
      -1, //frmMoveEdit.LcbPostav.KeyValue,
      nvl(frmMoveEdit.lcbMO_GROUP_FROM.KeyValue, 0),
//      frmMoveEdit.odsNamefrommove.fieldbyname('moid').asinteger,
      3);
    odsSelDocMove.refresh;
    odsSelDocMove.Locate('dpid', idDocs, []);
    acdel.Enabled := true;
    acedit.Enabled := true;
    dmMain.os.Commit;
  end
  else dmMain.os.RollbackToSavepoint('return'); }
end;

procedure TfrmMoveList.odsSelDocMoveAfterScroll(DataSet: TDataSet);
var
  DocIsSign: Boolean;
begin
// Исправил Воронов О.А. 09.03.2007
//  acSign.Enabled := (not DataSet.IsEmpty) and (odsSelDocMove.FieldByName('FL_EDIT').AsInteger = 1);//не подписанно
  DocIsSign := True;
  if (not DataSet.IsEmpty) then DocIsSign := odsSelDocMove.FieldByName('FL_EDIT').AsInteger = 0;
  if  (not DocIsSign) then
  begin
    acSign.Caption := '  Утвердить  ';
    acedit.Caption := 'Изменить';
  end
  else
  begin
    acSign.Caption := 'Отм. утверж.';
    acedit.Caption := 'Просмотр';
  end;

// конец изменений

  if (odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_RETURN_POSTAV) then
  begin
    tbuPrint.Style := tbsDropDown;
    tbuPrint.DropdownMenu := pmPrintM15;
  end
  else
  begin
    tbuPrint.Style := tbsButton;
    tbuPrint.DropdownMenu := nil;
  end;
  

  acedit.Enabled := (odsSelDocMove.RecordCount > 0);

  acPrnNarcoticAct.Visible := ( dmMain.ConfigParams.GetParamValue('FUNC_USE_NARCOTIC_ACT', 0) = 1 ) and
    ( not odsSelDocMove.IsEmpty ) and
    ( odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_NAKL_TREB );// расход по требованию

  acPrnNarcoticAct.Enabled := ( acPrnNarcoticAct.Visible ) and  ( odsSelDocMove.FieldByName('HAS_NARCOTICS').AsInteger = 1 );

  if (FL_UNSIGN_RIGHT = False)and(DocIsSign) then
    acSign.Enabled := False
  else
    acSign.Enabled := (odsSelDocMove.RecordCount > 0)
                       and (odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger <> VIDMOVE_SPISANIE_RPO)   // расход в РПО
                       and (odsSelDocMove.FieldByName('FL_IN_CLOSED_PERIOD').AsInteger = 0)
                       and not( (dmMain.ConfigParams.GetParamValue('FUNC_BLOCK_SIGN_DOCMOVE_TO_APTEKA', 0) = 1) and (odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_KARD_LIST) and (odsSelDocMove.FieldByName('fk_mogroupid_to').AsInteger = dmMain.ConfigParams.GetParamValue('APTEKA_MO_GROUP_ID', -1))); //Если документ - передача в Аптеку

  acdel.Enabled  := (odsSelDocMove.RecordCount > 0) and (not DocIsSign);

  tbuPrint.Enabled := (odsSelDocMove.RecordCount > 0) and ((dmMain.ConfigParams.GetParamValue('FUNC_PRINT_VEDOM_VIBORKI', 0) = 1)or( not(odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger in [VIDMOVE_TO_REZERV, VIDMOVE_FROM_REZERV]) ));
  tbuPrintActSpisInPeriod.Enabled := (odsSelDocMove.RecordCount > 0) and ((dmMain.ConfigParams.GetParamValue('FUNC_PRINT_VEDOM_VIBORKI', 0) = 1)or((odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger in [VIDMOVE_SPISANIE_RPO]) ));
  miPrint.Enabled :=  (dmMain.ConfigParams.GetParamValue('FUNC_PRINT_VEDOM_VIBORKI', 0) = 1) and ( not(odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger in [VIDMOVE_TO_REZERV, VIDMOVE_FROM_REZERV]) );
  cxGridRashKartDBTableView1FD_DATE_SPIS.Visible := (odsSelDocMove.RecordCount > 0) and (odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_SPISANIE)
                                                                                    and (odsSelDocMove.FieldByName('FN_SPISANIEVID').AsInteger = SPISANIE_VID_PACIENT)
                                                                                    and (fdmMain.nvl(odsSelDocMove.FieldByName('fk_mogroupid_to').AsVariant,-1) > 0);
  cxGridRashKartDBTableView1FD_DATE_SPIS.VisibleForCustomization := cxGridRashKartDBTableView1FD_DATE_SPIS.Visible;
end;

procedure TfrmMoveList.acTrebExecute(Sender: TObject);
begin
  DoShowTrebLst;
end;

procedure TfrmMoveList.ActTrebNaklShortExecute(Sender: TObject);
begin
  isShortPrint := 1;
  dmPrintSelect.PrintFlag := 2;
  acPrnInvoiceExecute(Sender);
  isShortPrint := -1000;
end;

//procedure TfrmMoveList.dxDBgMoveListCompare(Sender: TObject; Node1,
//  Node2: TdxTreeListNode; var Compare: Integer);
//var ColIndex      : Integer;
//		SortDirection : Integer;
//begin
//	ColIndex := cxGridMoveListDBTableView1FC_DOC.Index;// ColumnByFieldName('FC_DOC').Index;
//	SortDirection := 0;
//  Case dxDBgMoveList.ColumnByFieldName('FC_DOCMIX').Sorted of
//    csUp   : SortDirection := 1;
//    csDown : SortDirection := -1;
//  end;
//  if StrToIntDef(Node1.Strings[ColIndex],0) > StrToIntDef(Node2.Strings[ColIndex],0) then
//    Compare := SortDirection
//  else if StrToIntDef(Node1.Strings[ColIndex],0) < StrToIntDef(Node2.Strings[ColIndex],0) then
//    Compare := -SortDirection
//  else if StrToIntDef(Node1.Strings[ColIndex],0) = StrToIntDef(Node2.Strings[ColIndex],0) then
//    Compare := 0;
//  if Node1.Strings[ColIndex] > Node2.Strings[ColIndex] then Compare := SortDirection
//  else if Node1.Strings[ColIndex] < Node2.Strings[ColIndex] then Compare := -SortDirection
//  else if Node1.Strings[ColIndex] = Node2.Strings[ColIndex] then Compare := 0;
//end;

//procedure TfrmMoveList.dxDBgMoveListColumnSorting(Sender: TObject;
//  Column: TdxDBTreeListColumn; var Allow: Boolean);
//begin
//  if Column.FieldName = 'FC_DOCMIX' then
//    dxDBgMoveList.OnCompare := dxDBgMoveListCompare
//  else
//    dxDBgMoveList.OnCompare := nil;
//end;

procedure TfrmMoveList.frInvoice2GetValue(const ParName: String;
  var ParValue: Variant);
begin
//  if ParName = 'var_mo' then ParValue := odsSelDocMove.FieldByName('NAMETO').AsString
  if ParName = 'var_sender' then
         ParValue :=  dmMain.pkgSmini.Readstring('CONFIG', 'SENDER', '')
  else if ParName = 'var_receiver' then
         ParValue :=  dmMain.pkgSmini.Readstring('MANAGER_DOC', 'CLIENT_NAME_SMS', '')
  else if ParName = 'var_MagOtd' then
         ParValue :=  dmMain.pkgSmini.Readstring('MANAGER_DOC', 'ZAV_APTEKA', '')
  else if ParName = 'var_zam_gl_vra4' then
         ParValue := dmMain.pkgSmini.Readstring('MANAGER_DOC', 'ZAM_GL_VRA4', '');
end;

procedure TfrmMoveList.acInsertByTrebExecute(Sender: TObject);
var
  frmTrebLst  : TfrmTrebLst;

begin
//  dmMain.os.Savepoint('acInsertByTrebExecute');
	frmTrebLst := TfrmTrebLst.Create(Application);
  frmTrebLst.bSelect := True;
  try
    if frmTrebLst.ShowModal = mrOk then
    begin
      MakeAddMove(VID_DVIJENIE, VIDMOVE_NAKL_TREB, 'acInsertByTreb', frmTrebLst.nId, frmTrebLst.IsNewClearTreb);
//      idDocs := -1;
//      if DoShowMoveEdit(idDocs, True, 2, VIDMOVE_NAKL_TREB, frmTrebLst.odsTreb.FieldByName('FK_ID').AsInteger) = mrOk then
//      begin
//        odsSelDocMove.refresh;
//        odsSelDocMove.Locate('dpid', idDocs, []);
//        acdel.Enabled := true;   //#todo3 повесить на afterscroll
//        acedit.Enabled := true;
//        dmMain.os.Commit;
//      end  // if frmMoveEdit.ShowModal = mrok then
//      else
//        try
//          dmMain.os.RollbackToSavepoint('acInsertByTrebExecute');
//        except
//        end;
    end;  // if frmTrebLst.ShowModal = mrOk then
  finally
    if Assigned(frmTrebLst) then
      FreeAndNil(frmTrebLst);
  end;
end;



procedure TfrmMoveList.Action2Execute(Sender: TObject);
begin
  acPrnInvoiceExecute(nil);
end;

//function TfrmMoveList.DoCheckUnSignedDocs: TUnSignedDocs;
//var ods: TOracleDataSet;
//begin
//  Result.iDpid := -1;
//  Result.sDocNum := '';
//  Result.dRegistrDate := NullDate;
//
//  ods := TOracleDataSet.Create(nil);
//  try
//    ods.Session := dmMain.Os;
//ods.Sql.Text := 'SELECT DPID,FC_DOC,FD_DATA FROM MED.TDOCS D ' +
//			'WHERE FP_VID = 3 AND FP_VIDMOVE IN (5,7) AND MOFROMID = MED.PKG_MEDSES.GET_CURMO ' +
//			'  AND FD_DATA > (SELECT NVL(MAX(FD_DATA2),TO_DATE(''01.01.2000'',''DD.MM.YYYY'')) FROM MED.TDATE) ' +
//			'  AND FL_EDIT = 1 AND MOTOID IS NOT NULL ORDER BY FD_DATA DESC';
//{		ods.Sql.Text := 'SELECT DPID,FC_DOC,FD_DATA FROM TDOCS D ' +
//			'WHERE FP_VID = 3 AND FP_VIDMOVE = 5 AND MOFROMID = PKG_MEDSES.GET_CURMO ' +
//			'  AND FD_DATA > (SELECT NVL(MAX(FD_DATA2),TO_DATE(''01.01.2000'',''DD.MM.YYYY'')) FROM TDATE) ' +
//			'  AND FL_EDIT = 1 AND MOTOID IS NOT NULL ORDER BY FD_DATA DESC';}
//		try
//    ods.Open;
//    if not ods.IsEmpty then
//    begin
//      Result.iDpid := ods.FieldByName('DPID').AsInteger;
//      Result.sDocNum := ods.FieldByName('FC_DOC').AsString;
//      Result.dRegistrDate := ods.FieldByName('FD_DATA').AsDateTime;
//    end;
//    except
//    end;
//  finally
//    ods.Free;
//  end;
//end;

procedure TfrmMoveList.frInvoice2MouseOverObject(View: TfrView;
  var Cursor: TCursor);
begin
  if StrToInt(Copy(View.Name,5,2)) in [51,56,57,42,43,44,1,58,60,20] then
  begin
    Cursor := crHandPoint;
  end;
end;

procedure TfrmMoveList.frInvoice2ObjectClick(View: TfrView);
var frmDateInput : TfrmDateInput;
    vPos         : Integer;
    aPrompt      : String;
begin
  if StrToInt(Copy(View.Name,5,2)) in [56,57,42,43,44] then
//  if View.Name = 'Memo56' then
  begin
    View.FrameTyp := 15;
    View.FrameColor := clRed;
    vPos := frInvoice2.Preview.Window.VScrollBar.Position;
    frInvoice2.Preview.Zoom := frInvoice2.Preview.Zoom; //дабы перерисовался отчет
    frInvoice2.Preview.Window.VScrollBar.Position := vPos;
    try
      frmDateInput := TfrmDateInput.Create(frInvoice2.Preview.Window);
      try
        if frmDateInput.ShowModal = mrOk then
        begin
          if frmDateInput.deDate.Date = NullDate then
            View.Memo.Text := '"     "                 200  г.'
          else
            View.Memo.Text := FormatDateTime('''"''dd''"'' mmmm yyyy ''г.''',frmDateInput.deDate.Date);
        end;
      finally
        frmDateInput.Free;
      end;
    finally
      View.FrameTyp := 2;
      View.FrameColor := clBlack;
      vPos := frInvoice2.Preview.Window.VScrollBar.Position;
      frInvoice2.Preview.Zoom := frInvoice2.Preview.Zoom; //дабы перерисовался отчет
      frInvoice2.Preview.Window.VScrollBar.Position := vPos;
    end;
  end
  else if StrToInt(Copy(View.Name,5,2)) in [1,58,60,20,51] then
  begin

    Case StrToInt(Copy(View.Name,5,2)) of
      1  : aPrompt := 'Заместитель главного врача по мед. части';
      58 : aPrompt := 'Отпустил';
      60 : aPrompt := 'Получил';
      20 : aPrompt := 'Материальное ответственное лицо';
      51 : aPrompt := 'Структурное подразделение';
    end;
    
    View.FrameTyp := 15;
    View.FrameColor := clRed;
    vPos := frInvoice2.Preview.Window.VScrollBar.Position;
    frInvoice2.Preview.Zoom := frInvoice2.Preview.Zoom; //дабы перерисовался отчет
    frInvoice2.Preview.Window.VScrollBar.Position := vPos;
    try
      View.Memo.Text := InputBox('Ввод данных',aPrompt,Remove1310(View.Memo.Text));
    finally
      View.FrameTyp := 2;
      View.FrameColor := clBlack;
      vPos := frInvoice2.Preview.Window.VScrollBar.Position;
      frInvoice2.Preview.Zoom := frInvoice2.Preview.Zoom; //дабы перерисовался отчет
      frInvoice2.Preview.Window.VScrollBar.Position := vPos;
    end;
  end;
end;

procedure TfrmMoveList.frInvoice2UserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
var
  d : Double;
begin
  if name = 'ITOG' then
  begin
    d := frParser.Calc(p1);
    val := fdmPrintReports.MoneyToString(d, TRUE);
  end;
end;

function TfrmMoveList.FormHelp(Command: Word; Data: Integer;
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

procedure TfrmMoveList.acSpisanieExecute(Sender: TObject);
//var    //Списание медикаментов
//	dDate : TDateTime;
begin
  MakeAddMove(VID_RASHOD, VIDMOVE_SPISANIE, 'acSpisanie');

//  ndata:=dmmain.pkgprihrash.GETRASHDATA(ServerDate(dmMain.os));
//  dmmain.ncomment:='spisanie';
//  Screen.Cursor := crSQLWait;
//  dmMain.os.Savepoint('spisanie');                  // if FP_VIDMOVE = 8 THEN RETURN 'Списание медикаментов';
//
//
//  idDocs := -1;
//  if DoShowMoveEdit(idDocs, True, 3, VIDMOVE_SPISANIE) = mrOk then
//  begin
//    odsSelDocMove.refresh;
//    odsSelDocMove.Locate('dpid', idDocs, []);
//    acdel.Enabled := true;
//    acedit.Enabled := true;
//		dmMain.os.Commit;
//  end
//  else
//    try
//      dmMain.os.RollbackToSavepoint('spisanie');
//    except
//    end;
end;

function gt_val_const ( p_const_val:string ):integer;
var ods : TOracleDataSet; v_res : integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := dmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := 'select asu.'+p_const_val+' as fval from dual';
    try
      ods.Open;
      if not ods.Eof then
      begin
        v_res := ods.FieldByName('fval').AsInteger;
      end else
      begin
        v_res:=0;
      end;
      ods.Close;
    except
      v_res:=0;
    end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMoveList.tbuPrintClick(Sender: TObject);
var
  P : TPoint;
begin
  // для М-11 заколебался менять эксельник - главное что он никому не нужен Воронов О.А. 05.12.2008

  // Для Травмы есть возможность печати требования-накладной в 2-х видах
  //if dmMain.sDB_NAME = 'T' then    //Теперь пусть для всех
  //begin
    if odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_NAKL_TREB then
    begin
      if fdmMain.nvl(odsSelDocMove.FieldByName('mogr_from_fk_sklad_id').AsInteger,-1) > 0 then  // если склады используются
      begin

        dmMain.odsSklad.Locate('fk_id', fdmMain.nvl(odsSelDocMove.FieldByName('mogr_from_fk_sklad_id').AsInteger,-1), []);

        if FileExists('frxTrebNakl_'+dmMain.odsSklad.FieldByName('FC_SYNONIM').AsString+'_WITH_DECODE.fr3') then
        begin
          dmPrintSelect.PrintFlag := 2;
          P.X := 0;
          P.Y := tbuPrint.Height;
          P := tbuPrint.ClientToScreen(P);
          pmPrintTrebNakl.Popup(P.X, P.Y);
          Application.ProcessMessages;

          exit; // Здесь выходим из процедуры
        end;
      end
      else begin
        if (dmMain.ConfigParams.GetParamValue('IS_SHORT_NAKL', 0) = 1)
        then begin
          miPrintTrebWithDetail.Visible := False;
          dmPrintSelect.PrintFlag := 2;
          P.X := 0;
          P.Y := tbuPrint.Height;
          P := tbuPrint.ClientToScreen(P);
          pmPrintTrebNakl.Popup(P.X, P.Y);
          Application.ProcessMessages;
          miPrintTrebWithDetail.Visible := True;
          exit;
        end;
        
      end;
    end;
  //end;

  {
MessageDlg( IntToStr(odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger)+' : '+
            IntToStr(VIDMOVE_SPISANIE)+' '+
            IntToStr(VIDMOVE_SPISANIE_RPO)+' '+
            IntToStr(VIDMOVE_SPISANIE_HITEC)
            , mtWarning, [mbOK], 0);    }

  if (odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_SPISANIE) or
     (odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_SPISANIE_RPO) or
     (odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_SPISANIE_HITEC) then
  begin
    nTypeActSpis := 0;
    if FileExists('frActSpis_RM.frf') then
    begin
      //dmPrintSelect.PrintFlag := 2;
      P.X := 0;
      P.Y := tbuPrint.Height;
      P := tbuPrint.ClientToScreen(P);
      pmPrintActSpis.Popup(P.X, P.Y);
      Application.ProcessMessages;
    end;
  end;

  if odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_NAKL_TREB then dmPrintSelect.PrintFlag := 2;

  if dmPrintSelect.PrintFlag = 0
  then begin
    if (dmMain.ConfigParams.GetParamValue('IS_SHORT_NAKL', 0) = 1)
    then begin
      pmPrintTrebNakl.Items.Delete(pmPrintTrebNakl.Items.IndexOf(miShortForm));
      dmPrintSelect.pmPrintSelect.Items.Add(miShortForm);
    end;
    P.X := 0;
    P.Y := tbuPrint.Height;
    P := tbuPrint.ClientToScreen(P);
    // признак доп печати для хант
    if not v_pr_prn then
      dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    if v_pr_prn then v_pr_prn:=False;
    //
    Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
                                 // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати
    if //gt_val_const('IS_SHORT_NAKL')=1
    (dmMain.ConfigParams.GetParamValue('IS_SHORT_NAKL', 0) = 1)
    then begin
      dmPrintSelect.pmPrintSelect.Items.Delete(dmPrintSelect.pmPrintSelect.Items.IndexOf(miShortForm));
      pmPrintTrebNakl.Items.Add(miShortForm);
    end;
  end;

  if dmPrintSelect.PrintFlag = 0
  then Exit;

  try
    if odsSelDocMove.Eof then Exit;
    case odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger of
      VIDMOVE_NAKL_TREB: acPrnInvoice.Execute; {if acPrnInvoice.Enabled then  - это не нужно, все проверяется и так}
      VIDMOVE_RETURN   : acPrnReturn.Execute;
      VIDMOVE_KARD_LIST : acPrnKARD_LIST.Execute;
      VIDMOVE_SPISANIE, VIDMOVE_SPISANIE_RPO, VIDMOVE_SPISANIE_HITEC : acPrnConsuptionAct.Execute;
      VIDMOVE_RETURN_POSTAV : acPrnReturnPostav.Execute;
      VIDMOVE_OTPUSK_PO_NAC_PR, VIDMOVE_OTPUSK_PO_CEL_PROG: acPrnOtpuskPo_.Execute;
    end;
  finally
    dmPrintSelect.PrintFlag := 0;
  end;
end;

procedure TfrmMoveList.cxGridMoveListDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AnsiLowerCase(AViewInfo.Text)=AnsiLowerCase('Нет') then
    ACanvas.Brush.Color := clRed;
end;

procedure TfrmMoveList.cxGridMoveListDBTableView1DblClick(Sender: TObject);
begin
  acedit.Execute;
end;

procedure TfrmMoveList.acGodModeExecute(Sender: TObject);
begin
  FGodMode := not FGodMode;
  if FGodMode then
    Self.Caption :=  Self.Caption + ' (God mode)'
  else
    Self.Caption := StringReplace(Self.Caption, ' (God mode)', '',[]);
end;

procedure TfrmMoveList.frActSpisMouseOverObject(View: TfrView; var Cursor: TCursor);
begin
// Пока что запрещаем это изменять поля во время просмотра из-за глюков прорисовки второй страницы Воронов О.А.
//	if (View.Name = 'meZakl') or (View.Name = 'meSpisano') then
	if (View.Name = 'meComment')or(View.Name = 'mefc_mogroupid_from') then
  begin
    Cursor := crHandPoint;
//    View.FrameTyp := 15;
//    View.FrameColor := clGreen;
  end;
end;

procedure TfrmMoveList.frActSpisObjectClick(View: TfrView);
var
  vPos : Integer;
  s : string;
begin
// Пока что запрещаем это изменять поля во время просмотра из-за глюков прорисовки второй страницы Воронов О.А.
//  if View.Name = 'meZakl' then
//  begin
//    View.FrameTyp := 15;
//    View.FrameColor := clRed;
//    vPos := frActSpis.Preview.Window.VScrollBar.Position;
//    frActSpis.Preview.Zoom := frActSpis.Preview.Zoom; //дабы перерисовался отчет
//    frActSpis.Preview.Window.VScrollBar.Position := vPos;
//    try
//      View.Memo.Text := GetMemoText(View.Memo.Text, self,False,'Введите заключение комиссии', True);
//    finally
//      View.FrameTyp := 0;
//      View.FrameColor := clGreen;
//      vPos := frActSpis.Preview.Window.VScrollBar.Position;
//      frActSpis.Preview.Zoom := frActSpis.Preview.Zoom; //дабы перерисовался отчет
//      frActSpis.Preview.Window.VScrollBar.Position := vPos;
//    end;
//  end;
//
//  if View.Name = 'meSpisano' then
//  begin
//    View.FrameTyp := 15;
//    View.FrameColor := clRed;
//    vPos := frActSpis.Preview.Window.VScrollBar.Position;
//    frActSpis.Preview.Zoom := frActSpis.Preview.Zoom; //дабы перерисовался отчет
//    frActSpis.Preview.Window.VScrollBar.Position := vPos;
//    try
//      View.Memo.Text := GetMemoText(View.Memo.Text, self,False,'Введите описание списанных единиц',True);
//    finally
//      View.FrameTyp := 0;
//      View.FrameColor := clGreen;
//      vPos := frActSpis.Preview.Window.VScrollBar.Position;
//      frActSpis.Preview.Zoom := frActSpis.Preview.Zoom; //дабы перерисовался отчет
//      frActSpis.Preview.Window.VScrollBar.Position := vPos;
//    end;
//  end;

  if View.Name = 'meComment' then
  begin
    View.FrameTyp := 15;
    View.FrameColor := clRed;
    vPos := frActSpis.Preview.Window.VScrollBar.Position;
    frActSpis.Preview.Zoom := frActSpis.Preview.Zoom; //дабы перерисовался отчет
    frActSpis.Preview.Window.VScrollBar.Position := vPos;
    try
      View.Memo.Text := GetMemoText(View.Memo.Text, self,False,'Введите комментарий',True);
    finally
      View.FrameTyp := 0;
      View.FrameColor := clWhite;
      vPos := frActSpis.Preview.Window.VScrollBar.Position;
      frActSpis.Preview.Zoom := frActSpis.Preview.Zoom; //дабы перерисовался отчет
      frActSpis.Preview.Window.VScrollBar.Position := vPos;
    end;
  end;

  if View.Name = 'mefc_mogroupid_from' then
  begin
    View.FrameTyp := 15;
    View.FrameColor := clRed;
    vPos := frActSpis.Preview.Window.VScrollBar.Position;
    frActSpis.Preview.Zoom := frActSpis.Preview.Zoom; //дабы перерисовался отчет
    frActSpis.Preview.Window.VScrollBar.Position := vPos;
    try
      s :=  StringReplace(View.Memo.Text, #13#10, '', [rfReplaceAll]);
      if InputQuery('','Введите подразделение', s) then
      begin
        View.Memo.Text := s;
        IniWriteString2('frActSpis', 'fc_mogroupid_from', s);
      end;
    finally
      View.FrameTyp := 0;
      View.FrameColor := clWhite;
      vPos := frActSpis.Preview.Window.VScrollBar.Position;
      frActSpis.Preview.Zoom := frActSpis.Preview.Zoom; //дабы перерисовался отчет
      frActSpis.Preview.Window.VScrollBar.Position := vPos;
    end;
  end;
end;

procedure TfrmMoveList.frActSpisUserFunction(const Name: String; p1, p2, p3: Variant; var Val: Variant);
var
  d : Double;
  IntNumber : Integer;
begin
  if UpperCase(name) = 'GETZAKLKOM' then
  begin
//    Val := GetMemoText('', self,False, 'Введите заключение комиссии', True);
    Val := FZaklKom;
  end;
  if UpperCase(name) = 'GETSPISANO' then
  begin
//    Val := GetMemoText('', self,False, 'Введите описание списанных единиц', True);
    Val := FSpisano;
  end;
	if UpperCase(name) = 'MONEYSTR' then
	begin
    d := frParser.Calc(p1);
		val := fdmPrintReports.MoneyToString(d, TRUE);
  end;
	if name = 'GET_NAIM_KOL' then
	begin
    IntNumber := frParser.Calc(p1);
		val := StringReplace(DMMAIN.get_countstr(IntNumber), 'один', 'одно', [rfReplaceAll]);
  end;
end;

procedure TfrmMoveList.tbuAddClick(Sender: TObject);
var
  P : TPoint;
begin
  P.X := 0;
  P.Y := tbuAdd.Height;
  P   := tbuAdd.ClientToScreen(P);
  tbuAdd.DropdownMenu.Popup(P.X, P.Y);
end;

procedure TfrmMoveList.acPrnReturnExecute(Sender: TObject);
var
  p : TfrPreview;
  s : string;
begin
//  DoSetEditDoc;
  //  if (odsSelDocMoveFP_VIDMOVE.AsInteger = 1) or (odsSelDocMoveFP_VIDMOVE.AsInteger = 6) then
    //begin
//  Application.CreateForm(tfrmfiotreb, frmFIOTreb);
//  frmFIOTreb.eotp.Text := odsSelDocMove.fieldbyname('FC_COMMENT').AsString;
//  frmFIOTreb.edolotp.Text := 'Медсестра';
  try
    odsNakl.close;  
//    if frmFIOTreb.ShowModal <> mrOk then Exit;
//    odsNakl.SetVariable('otp', frmFIOTreb.eotp.text);
//    odsNakl.SetVariable('dolotp', frmFIOTreb.edolotp.text);

    odsNakl.SetVariable('adpid', odsSelDocMove.fieldbyname('DPID').AsInteger);
    odsNakl.open;

    frNakl.PrepareReport;

    case dmPrintSelect.PrintFlag of // флаг куда печатать
      1: ExportFRToExcel( frNakl, odsSelDocMove.FieldByName('FC_DOCMIX').AsString+'.xls' );
      2:
      begin
        p := TfrPreview.Create(frNakl);
        CurReport := frNakl;
        MasterReport := frNakl;
        DocMode := dmPrinting;
        CurBand := nil;
        if frNakl.EMFPages.Count = 0 then Exit;
        s := frLoadStr(SPreview);
        if frNakl.Title <> '' then s := s + ' - ' + frNakl.Title;
        p.Window.Caption := s;
        frNakl.Preview := p;

        frNakl.Preview.Window.Show_Modal(frNakl);
        Application.ProcessMessages;
        frNakl.Preview.Window := nil;
      end;  
//      frNakl.ShowPreparedReport;
    end;
  finally
    frmFIOTreb.free;
  end;
  //  end;
end;

procedure TfrmMoveList.N15Click(Sender: TObject);
var
  CurDate : TDate;
begin
  if not Assigned(Sender) then Exit;
  FNotRefresh := True;
  CurDate := ServerDate(dmMain.os);
  case TMenuItem(Sender).Tag of
    1:  // прошлый год
    begin
      dedDate1.EditValue := Trunc(StartOfTheYear(IncYear(CurDate, -1)));
      dedDate2.EditValue := Trunc(EndOfTheYear(IncYear(CurDate, -1)));
    end;

    2:  // Текущий год
    begin
      dedDate1.EditValue := Trunc(StartOfTheYear(CurDate));
      dedDate2.EditValue := Trunc(EndOfTheYear(CurDate));
    end;

    3:  // прошлый месяц
    begin
      dedDate1.EditValue := Trunc(StartOfTheMonth(IncMonth(CurDate,-1)));
      dedDate2.EditValue := Trunc(EndOfTheMonth(IncMonth(CurDate,-1)));
    end;

    4:  // текущий месяц
    begin
      dedDate1.EditValue := Trunc(StartOfTheMonth(CurDate));
      dedDate2.EditValue := Trunc(EndOfTheMonth(CurDate));
    end;

    5:  // текущий день
    begin
      dedDate1.EditValue := Trunc(CurDate);
      dedDate2.EditValue := Trunc(CurDate);
    end;
  end;

  chbDate1.Checked := (TMenuItem(Sender).Tag <> 0);
  chbDate2.Checked := (TMenuItem(Sender).Tag <> 0);
  FNotRefresh := False;
    
  acrefresh.Execute;
end;

procedure TfrmMoveList.frTrebNaklUserFunction(const Name: String; p1, p2,  p3: Variant; var Val: Variant);
var
  d : Double;
  IntNumber : Integer;
begin
	if name = 'MONEYSTR' then
	begin
    d := frParser.Calc(p1);
		val := fdmPrintReports.MoneyToString(d, TRUE);
  end;
	if name = 'GET_NAIM_KOL' then
	begin
    IntNumber := frParser.Calc(p1);
		val := DMMAIN.get_countstr(IntNumber);
  end;

  if name = 'DATERUSSTR' then
  begin
    val := GetDateStr( frParser.Calc(p1) );
  end;
end;

procedure TfrmMoveList.frTrebNaklMouseOverObject(View: TfrView;
  var Cursor: TCursor);
begin
	if (View.Name = 'meDate') then
  begin
    Cursor := crHandPoint;
//    View.FrameTyp := 15;
//    View.FrameColor := clGreen;
  end;
end;

procedure TfrmMoveList.frTrebNaklObjectClick(View: TfrView);
var
  vPos : Integer;
begin
  if View.Name = 'meDate' then
  begin
    View.FrameTyp := 15;
    View.FrameColor := clRed;
    vPos := self.frTrebNakl.Preview.Window.VScrollBar.Position;
    self.frTrebNakl.Preview.Zoom := self.frTrebNakl.Preview.Zoom; //дабы перерисовался отчет
    self.frTrebNakl.Preview.Window.VScrollBar.Position := vPos;
    try
      View.Memo.Text := InputBox('Дата получения', '', StringReplace(View.Memo.Text,#13#10,'',[rfReplaceAll]));
    finally
      View.FrameTyp := 0;
      View.FrameColor := clWhite;
      vPos := self.frTrebNakl.Preview.Window.VScrollBar.Position;
      self.frTrebNakl.Preview.Zoom := self.frTrebNakl.Preview.Zoom; //дабы перерисовался отчет
      self.frTrebNakl.Preview.Window.VScrollBar.Position := vPos;
    end;
  end;
end;

procedure TfrmMoveList.acReturnPostavExecute(Sender: TObject);
begin
  MakeAddMove(VID_RASHOD, VIDMOVE_RETURN_POSTAV, 'acReturnPostav');
//	ndata:=dmmain.pkgprihrash.GETRASHDATA(ServerDate(dmMain.os));
//  dmmain.ncomment:='ReturnPostav';
//  Screen.Cursor := crSQLWait;
//  dmMain.os.Savepoint('ReturnPostav');
//
//  idDocs := -1;
//  if DoShowMoveEdit(idDocs, True, 3, VIDMOVE_RETURN_POSTAV) = mrOk then
//  begin
//		odsSelDocMove.refresh;
//    odsSelDocMove.Locate('dpid', idDocs, []);
//    acdel.Enabled := true;
//    acedit.Enabled := true;
//		dmMain.os.Commit;
//  end
//  else
//    try
//      dmMain.os.RollbackToSavepoint('ReturnPostav');
//    except
//    end;
end;

function TfrmMoveList.frxReturnPostavUserFunction(const MethodName: String; var Params: Variant): Variant;
begin
	if UpperCase(MethodName) = 'GET_NAIM_KOL' then
	begin
		Result := GET_NAIM_KOL(Params[0], Params[1] ); // если в отчете вызывается сама функция, то заключать строку в апостофы не надо
  end;
	if UpperCase(MethodName) = 'MONEYSTR' then
	begin
		Result := MONEYSTR(Params[0]);
  end;
	if UpperCase(MethodName) = 'DATERUSSTR' then
	begin
		Result := DATERUSSTR(Params[0]);
  end;

  if UpperCase(MethodName) = 'INIREADSTRING2' then
  begin
    Result := IniReadString2( Params[0], Params[1], Params[2] );
  end;
  if UpperCase(MethodName) = 'INIWRITESTRING2' then
  begin
    Result := IniWriteString2( Params[0], Params[1], Params[2] );
  end;
//  if UpperCase(MethodName) = 'INIWRITESTRING3' then
//  begin
//    Result := IniWriteString2( Params[0], Params[1]+'_'+StringReplace(FFC_MO_GR_TO,' ','_', [rfReplaceAll]), Params[2] );
//  end;
end;

procedure TfrmMoveList.acPrnReturnPostavExecute(Sender: TObject);
var
  RepFileName : string;
begin
// механизм загрузки отчета для разных складов
  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM <> '') then  // если склады используются
  begin
    RepFileName := frxReturnPostav.Name+'_'+dmMain.CurMO_SKLAD_SYNONIM+'.fr3';
    if FileExists(RepFileName) then
      frxReturnPostav.LoadFromFile(RepFileName)
    else
    begin
      RepFileName := frxReturnPostav.Name+'.fr3';
      if FileExists(RepFileName) then
        frxReturnPostav.LoadFromFile(RepFileName);
    end;
  end
  else // если склад один
  begin
    RepFileName := frxReturnPostav.Name+'.fr3';
    if FileExists(RepFileName) then
      frxReturnPostav.LoadFromFile(RepFileName);
  end;

  frxReturnPostav.AddFunction('function GET_NAIM_KOL(aNumber: Integer; aRod : Integer): string');
  frxReturnPostav.AddFunction('function MONEYSTR(Summa: double): string');
  frxReturnPostav.AddFunction('function DATERUSSTR(aDate : TDate) : string');
  frxReturnPostav.AddFunction('function INIWRITESTRING2(Section, Ident: string; Value: string) : integer');

  frxReturnPostav.PrepareReport;
  case dmPrintSelect.PrintFlag of // флаг куда печатать
    1: ExportFRToExcel( frxReturnPostav, odsSelDocMove.FieldByName('FC_DOCMIX').AsString+'.xls' );
    2: frxReturnPostav.ShowReport();
  end;  
end;

procedure TfrmMoveList.acOtpuskPoNacPrExecute(Sender: TObject);
begin
  MakeAddMove(VID_RASHOD, VIDMOVE_OTPUSK_PO_NAC_PR, 'acOtpuskPoNacPr');
end;

procedure TfrmMoveList.acOtpuskPoCelProgExecute(Sender: TObject);
begin
  MakeAddMove(VID_RASHOD, VIDMOVE_OTPUSK_PO_CEL_PROG, 'acOtpuskPoCelProg');
end;

procedure TfrmMoveList.acPrnOtpuskPo_Execute(Sender: TObject);
var
  RepFileName : string;
begin
// механизм загрузки отчета для разных складов
  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM <> '') then  // если склады используются
  begin
    RepFileName := frxOtpuskPo_.Name+'_'+dmMain.CurMO_SKLAD_SYNONIM+'.fr3';
    if FileExists(RepFileName) then
      frxOtpuskPo_.LoadFromFile(RepFileName)
    else
    begin
      RepFileName := frxReturnPostav.Name+'.fr3';
      if FileExists(RepFileName) then
        frxOtpuskPo_.LoadFromFile(RepFileName);
    end;
  end
  else // если склад один
  begin
    RepFileName := frxOtpuskPo_.Name+'.fr3';
    if FileExists(RepFileName) then
      frxOtpuskPo_.LoadFromFile(RepFileName);
  end;

  frxOtpuskPo_.AddFunction('function GET_NAIM_KOL(aNumber: Integer; aRod : Integer): string');
  frxOtpuskPo_.AddFunction('function MONEYSTR(Summa: double): string');
  frxOtpuskPo_.AddFunction('function DATERUSSTR(aDate : TDate) : string');

  frxOtpuskPo_.PrepareReport;
  case dmPrintSelect.PrintFlag of // флаг куда печатать
    1: ExportFRToExcel( frxOtpuskPo_, odsSelDocMove.FieldByName('FC_DOCMIX').AsString+'.xls' );
    2: frxOtpuskPo_.ShowPreparedReport();
  end;  
end;
// не смог получить TfrxReport из Sender: TfrxView, поэтому два почти одинаковых обработчика. Воронов О.А. 12.11.2007
procedure TfrmMoveList.frxRashDocPoMedicTypeGetValue(const VarName: string;
  var Value: Variant);
var
  n : integer;
  sTemp : string;  
begin
  if VarName = 'VAR_RECEIVER' then
  begin
    with TOracleQuery.Create(nil) do
    try
      Session := dmMain.os;
      Sql.Text := 'SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''MANAGER_DOC'' AND FC_KEY = ''CLIENT_NAME''';
      try
        Execute;
        Value := Field(0);
      except
        Value := '';
      end;
    finally
      Free;
    end;
  end;

  if VarName = 'VAR_MO_GROUP' then
    Value := CurMOGroupName;

  if VarName = 'VAR_RPO' then   // рецептурно-производственный отдел
    if IS_RPO=1 then    
      Value := 'рецептурно-производственный отдел'
    else
      Value := '';

  if VarName = 'VAR_DATE1' then
    Value := v_d1;

  if VarName = 'VAR_DATE2' then
    Value := v_d2;

  if VarName = 'Spisano' then Value := FSpisano;
  if VarName = 'Pred' then Value := FPred;
  if VarName = 'DolPred' then Value := FDolPred;

  if VarName = 'S_NAME' then
    Value :=  dmMain.pkgSmini.Readstring('CONFIG', 'S_NAME', '');
                                           
  if VarName = 'Spisano' then Value := FSpisano;;

{  if (Copy(VarName,1,3) = 'Kom')and(TryStrToInt(Copy(VarName,4,10), n))and(n > 0) then
  begin
    if (n <= Length(FKom)) then
      Value := FKom[n-1]
    else
      Value := '';
  end;

  if (Copy(VarName,1,6) = 'DolKom')and(TryStrToInt(Copy(VarName,7,10), n))and(n > 0) then
  begin
    if (n <= Length(FKom)) then
      Value := FDolKom[n-1]
    else
      Value := '';
  end;  }

  if VarName = 'Prikaz' then Value  := FPrikaz;

  if VarName = 'Pred' then Value := FPred;
  if VarName = 'Kom1' then Value := FKom1;
  if VarName = 'Kom2' then Value := FKom2;
  if VarName = 'Kom3' then Value := FKom3;
  if VarName = 'DolPred' then Value := FDolPred;
  if VarName = 'DolKom1' then Value := FDolKom1;
  if VarName = 'DolKom2' then Value := FDolKom2;
  if VarName = 'DolKom3' then Value := FDolKom3;

end;

procedure TfrmMoveList.frxRepMoveToOtdGetValue(const VarName: string; var Value: Variant);
var
  sTemp : string;
begin
  if UpperCase(VarName) = 'VAR_UCHR_NAME' then Value :=  dmPrintReports.GetValueFromTSMINI('MANAGER_DOC', 'CLIENT_NAME');

  if VarName = 'VAR_GLAV_BUH' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'GLAV_BUH', '');
    if sTemp = '' then
      Value := dmPrintReports.GetValueFromTSMINI('MANAGER_DOC', 'GLAV_BUH')
    else
      Value := sTemp;
  end;

  if VarName = 'VAR_GLAV_VRACH' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'GLAV_VRACH', '');
    if sTemp = '' then
      Value := dmPrintReports.GetValueFromTSMINI('MANAGER_DOC', 'GLAV_VRACH')
    else
      Value := sTemp;
  end;

  if VarName = 'VAR_ZAV_APTEKA' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_ZAV_APTEKA', '');
    if sTemp = '' then
      Value := dmPrintReports.GetValueFromTSMINI('MANAGER_DOC', 'ZAV_APTEKA')
    else
      Value := sTemp;
  end;
end;

procedure TfrmMoveList.frxReturnPostavClickObject(Sender: TfrxView; Button: TMouseButton; Shift: TShiftState; var Modified: Boolean);
begin
  if (Sender.Name = 'meDate') or (Sender.Name = 'meGlavVrach') or (Sender.Name = 'meGlavBuh') or
     (Sender.Name = 'meOsnovanie') or (Sender.Name = 'mePoluchatel') then
  begin
    Sender.Frame.Typ := [ftLeft, ftRight, ftTop, ftBottom];
    Sender.Frame.Color := clRed;
    frxReturnPostav.Preview.Repaint;
    try
     if (Sender.Name = 'meOsnovanie') then
       TfrxMemoView(Sender).Text := GetMemoText(TfrxMemoView(Sender).Text, self, False, TfrxMemoView(Sender).TagStr, True)
     else
       TfrxMemoView(Sender).Text := InputBox( TfrxMemoView(Sender).TagStr, '', StringReplace(TfrxMemoView(Sender).Text, #13#10, '', [rfReplaceAll]) );
    finally
      Sender.Frame.Typ := [];
      Sender.Frame.Color := clWhite;
      frxReturnPostav.Preview.Repaint;
    end;
  end;
end;

procedure TfrmMoveList.frxActSpisClickObject(Sender: TfrxView; Button: TMouseButton; Shift: TShiftState; var Modified: Boolean);
var
  //vPos : Integer;
  s : string;
  View : TfrxMemoView;
begin
// Пока что запрещаем это изменять поля во время просмотра из-за глюков прорисовки второй страницы Воронов О.А.
//  if View.Name = 'meZakl' then
//  begin
//    View.FrameTyp := 15;
//    View.FrameColor := clRed;
//    vPos := frActSpis.Preview.Window.VScrollBar.Position;
//    frActSpis.Preview.Zoom := frActSpis.Preview.Zoom; //дабы перерисовался отчет
//    frActSpis.Preview.Window.VScrollBar.Position := vPos;
//    try
//      View.Memo.Text := GetMemoText(View.Memo.Text, self,False,'Введите заключение комиссии', True);
//    finally
//      View.FrameTyp := 0;
//      View.FrameColor := clGreen;
//      vPos := frActSpis.Preview.Window.VScrollBar.Position;
//      frActSpis.Preview.Zoom := frActSpis.Preview.Zoom; //дабы перерисовался отчет
//      frActSpis.Preview.Window.VScrollBar.Position := vPos;
//    end;
//  end;
//
//  if View.Name = 'meSpisano' then
//  begin
//    View.FrameTyp := 15;
//    View.FrameColor := clRed;
//    vPos := frActSpis.Preview.Window.VScrollBar.Position;
//    frActSpis.Preview.Zoom := frActSpis.Preview.Zoom; //дабы перерисовался отчет
//    frActSpis.Preview.Window.VScrollBar.Position := vPos;
//    try
//      View.Memo.Text := GetMemoText(View.Memo.Text, self,False,'Введите описание списанных единиц',True);
//    finally
//      View.FrameTyp := 0;
//      View.FrameColor := clGreen;
//      vPos := frActSpis.Preview.Window.VScrollBar.Position;
//      frActSpis.Preview.Zoom := frActSpis.Preview.Zoom; //дабы перерисовался отчет
//      frActSpis.Preview.Window.VScrollBar.Position := vPos;
//    end;
//  end;

  View := Sender as TfrxMemoView;
  if View.Name = 'meComment' then
  begin
    View.Frame.Typ := [ftLeft, ftRight, ftTop, ftBottom];
    View.Frame.Color := clRed;
    Modified := true;
    //vPos := frActSpis.Preview.Window.VScrollBar.Position;
    //frActSpis.Preview.Zoom := frActSpis.Preview.Zoom; //дабы перерисовался отчет
    //frActSpis.Preview.Window.VScrollBar.Position := vPos;
    try
      View.Memo.Text := GetMemoText(View.Memo.Text, self,False,'Введите комментарий',True);
    finally
      View.Frame.Typ := [];
      View.Frame.Color := clWhite; 
      Modified := true;
      //vPos := frActSpis.Preview.Window.VScrollBar.Position;
      //frActSpis.Preview.Zoom := frActSpis.Preview.Zoom; //дабы перерисовался отчет
      //frActSpis.Preview.Window.VScrollBar.Position := vPos;
    end;
  end;

  if View.Name = 'mefc_mogroupid_from' then
  begin
    View.Frame.Typ := [ftLeft, ftRight, ftTop, ftBottom];
    View.Frame.Color := clRed;  
    Modified := true;
    //vPos := frActSpis.Preview.Window.VScrollBar.Position;
    //frActSpis.Preview.Zoom := frActSpis.Preview.Zoom; //дабы перерисовался отчет
    //frActSpis.Preview.Window.VScrollBar.Position := vPos;
    try
      s :=  StringReplace(View.Memo.Text, #13#10, '', [rfReplaceAll]);
      if InputQuery('','Введите подразделение', s) then
      begin
        View.Memo.Text := s;
        IniWriteString2('frActSpis', 'fc_mogroupid_from', s);
      end;
    finally
      View.Frame.Typ := [];
      View.Frame.Color := clWhite;    
      Modified := true;
      //vPos := frActSpis.Preview.Window.VScrollBar.Position;
      //frActSpis.Preview.Zoom := frActSpis.Preview.Zoom; //дабы перерисовался отчет
      //frActSpis.Preview.Window.VScrollBar.Position := vPos;
    end;
  end;
end;

procedure TfrmMoveList.frxActSpisGetValue(const VarName: string; var Value: Variant);
var
  n : integer;
  sTemp : string;
begin
  if VarName = 'S_NAME' then
    Value :=  dmMain.pkgSmini.Readstring('CONFIG', 'S_NAME', '');
                                           
  if VarName = 'Spisano' then Value := FSpisano;;

  if VarName = 'Pred' then Value := FPred;

  if (Copy(VarName,1,3) = 'Kom')and(TryStrToInt(Copy(VarName,4,10), n))and(n > 0) then
  begin
    if (n <= Length(FKom)) then
      Value := FKom[n-1]
    else
      Value := '';
  end;

  if (Copy(VarName,1,6) = 'DolKom')and(TryStrToInt(Copy(VarName,7,10), n))and(n > 0) then
  begin
    if (n <= Length(FKom)) then
      Value := FDolKom[n-1]
    else
      Value := '';
  end;
//  if VarName = 'Kom1' then Value := FKom1;
//  if VarName = 'Kom2' then Value := FKom2;
//  if VarName = 'Kom3' then Value := FKom3;
  if VarName = 'DolPred' then Value := FDolPred;
//  if VarName = 'DolKom1' then Value := FDolKom1;
//  if VarName = 'DolKom2' then Value := FDolKom2;
//  if VarName = 'DolKom3' then Value := FDolKom3;

  if VarName = 'MO'   then Value := FMO;   
  if VarName = 'DOLMO'   then Value := FDolMO;
  if VarName = 'UTVERJDAYU_FIO'   then Value := FUTVERJDAYU_FIO;
  if VarName = 'UTVERJDAYU_DOLJN'   then Value := FUTVERJDAYU_DOLJN;

  if VarName = 'Prikaz' then Value  := FPrikaz;

  if VarName = 'SMS' then Value    := FSMS;
  if VarName = 'ZavOtd' then Value := FZavOtd;

  if VarName = 'fc_mogroupid_from' then
  begin
    sTemp := IniReadString(iniFileName, 'frActSpis', 'fc_mogroupid_from', '');
    if sTemp = '' then
      Value := odsSelDocMove.FieldByName('fc_mogroupid_from').AsString
    else
      Value := sTemp;
  end;
end;

procedure TfrmMoveList.frxActSpisMouseOverObject(Sender: TfrxView);
var
  View : TfrxMemoView;
begin       
  View := Sender as TfrxMemoView;
// Пока что запрещаем это изменять поля во время просмотра из-за глюков прорисовки второй страницы Воронов О.А.
//	if (View.Name = 'meZakl') or (View.Name = 'meSpisano') then
	if (View.Name = 'meComment')or(View.Name = 'mefc_mogroupid_from') then
  begin
    Cursor := crHandPoint;
//    View.FrameTyp := 15;
//    View.FrameColor := clGreen;
  end;
end;

function TfrmMoveList.frxActSpisUserFunction(const MethodName: string; var Params: Variant): Variant;
var
  d : Double;
begin
  if UpperCase(MethodName) = 'GETZAKLKOM' then
  begin
//    Val := GetMemoText('', self,False, 'Введите заключение комиссии', True);
    Result := FZaklKom;
  end;
  if UpperCase(MethodName) = 'GETSPISANO' then
  begin
//    Val := GetMemoText('', self,False, 'Введите описание списанных единиц', True);
    Result := FSpisano;
  end;
	if UpperCase(MethodName) = 'MONEYSTR' then
	begin
    d := frParser.Calc(Params[0]);
		Result := fdmPrintReports.MoneyToString(d, TRUE);
  end;
	if MethodName = 'GET_NAIM_KOL' then
	begin
		Result := GET_NAIM_KOL(Params[0], Params[1]);
  end;
end;

procedure TfrmMoveList.frxOtpuskPo_ClickObject(Sender: TfrxView;
  Button: TMouseButton; Shift: TShiftState; var Modified: Boolean);
begin
  if (Sender.Name = 'meDate') or (Sender.Name = 'meGlavVrach') or (Sender.Name = 'meGlavBuh') or (Sender.Name = 'meZavApt')or
     (Sender.Name = 'meOsnovanie') or (Sender.Name = 'mePoluchatel') then
  begin
    Sender.Frame.Typ := [ftLeft, ftRight, ftTop, ftBottom];
    Sender.Frame.Color := clRed;
    frxOtpuskPo_.Preview.Repaint;
    try
     if (Sender.Name = 'meOsnovanie') then
       TfrxMemoView(Sender).Text := GetMemoText(TfrxMemoView(Sender).Text, self, False, TfrxMemoView(Sender).TagStr, True)
     else
       TfrxMemoView(Sender).Text := InputBox( TfrxMemoView(Sender).TagStr, '', StringReplace(TfrxMemoView(Sender).Text, #13#10, '', [rfReplaceAll]) );
    finally
      Sender.Frame.Typ := [];
      Sender.Frame.Color := clWhite;
      frxOtpuskPo_.Preview.Repaint;
    end;
  end;
end;

procedure TfrmMoveList.frActSpisGetValue(const ParName: String; var ParValue: Variant);
var
  n : integer;
  sTemp : string;
begin                  
  if ParName = 'S_NAME' then
    ParValue :=  dmMain.pkgSmini.Readstring('CONFIG', 'S_NAME', '');

  if ParName = 'Pred' then ParValue := FPred;

  if (Copy(ParName,1,3) = 'Kom')and(TryStrToInt(Copy(ParName,4,10), n))and(n > 0) then
  begin
    if (n <= Length(FKom)) then
      ParValue := FKom[n-1]
    else
      ParValue := '';
  end;

  if (Copy(ParName,1,6) = 'DolKom')and(TryStrToInt(Copy(ParName,7,10), n))and(n > 0) then
  begin
    if (n <= Length(FKom)) then
      ParValue := FDolKom[n-1]
    else
      ParValue := '';
  end;
//  if ParName = 'Kom1' then ParValue := FKom1;
//  if ParName = 'Kom2' then ParValue := FKom2;
//  if ParName = 'Kom3' then ParValue := FKom3;
  if ParName = 'DolPred' then ParValue := FDolPred;
//  if ParName = 'DolKom1' then ParValue := FDolKom1;
//  if ParName = 'DolKom2' then ParValue := FDolKom2;
//  if ParName = 'DolKom3' then ParValue := FDolKom3;

  if ParName = 'MO'   then ParValue := FMO;   
  if ParName = 'DOLMO'   then ParValue := FDolMO;
  if ParName = 'UTVERJDAYU_FIO'   then ParValue := FUTVERJDAYU_FIO;
  if ParName = 'UTVERJDAYU_DOLJN'   then ParValue := FUTVERJDAYU_DOLJN;

  if ParName = 'Prikaz' then ParValue  := FPrikaz;

  if ParName = 'SMS' then ParValue    := FSMS;
  if ParName = 'ZavOtd' then ParValue := FZavOtd;

  if ParName = 'fc_mogroupid_from' then
  begin
    sTemp := IniReadString(iniFileName, 'frActSpis', 'fc_mogroupid_from', '');
    if sTemp = '' then
      ParValue := odsSelDocMove.FieldByName('fc_mogroupid_from').AsString
    else
      ParValue := sTemp;
  end;

  if ParName = 'VAR_CLIENT_FULL_NAME' then
    ParValue :=  dmMain.pkgSmini.Readstring('MANAGER_DOC', 'CLIENT_FULL_NAME', '');
end;

procedure TfrmMoveList.frxReturnPostavGetValue(const VarName: String; var Value: Variant);
var
  sTemp : string;
  UpperVarName : string;
begin
  UpperVarName := UpperCase(VarName);
  dmPrintReports.frReportOnGetValue(VarName, Value);
//  if VarName = 'var_glav_vrach' then Value := dmPrintReports.GetValueFromTSMINI('NACHLOK', 'FIO') //MANAGER_DOC', 'GLAV_VRACH')
//  else
//  if VarName = 'var_zav_apteka' then Value := dmPrintReports.GetValueFromTSMINI('MANAGER_DOC', 'ZAV_APTEKA')
//  else
//  if VarName = 'var_glav_buh' then Value := dmPrintReports.GetValueFromTSMINI('MANAGER_DOC', 'GLAV_BUH')
//  else
  if VarName = 'OKB' then
  begin
    if dmMain.ConfigParams.GetParamValue('Func_Set', FUNC_SET_HANTI) = FUNC_SET_HANTI then Value := 'ОКБ' else Value := '';
  end;

  if UpperVarName = 'VAR_REKVIZITI' then // собираем реквизиты больницы
  begin
    with TOracleDataSet.Create(self) do
    begin
      SQL.Text := 'select  replace(ASU.PKG_SMINI.READSTRING(''CONFIG'', ''S_FULLNAME'', ''|'')||'', ''                                                                              '#13#10+
                  '               ||''ИНН ''||ASU.PKG_SMINI.READSTRING(''CONFIG'', ''S_INN'', ''|'') ||'', ''                                                                       '#13#10+
                  '               ||decode(MAX(R2.fc_name), null,''|'',MAX(R2.fc_name))||'', ''                                                                                     '#13#10+
                  '               ||decode(MAX(T2.fc_name), null,''|'',MAX(T2.fc_name))||'', ''                                                                                     '#13#10+
                  '               ||decode(MAX(S2.fc_name), null,''|'',MAX(S2.fc_name))||'', ''                                                                                     '#13#10+
                  '               ||ASU.PKG_SMINI.READSTRING(''CONFIG'', ''S_HOUSE'', ''|''), ''|, '', '''') as FC_REKVIZITI                                                        '#13#10+
                  '        FROM (select max(R1.FC_NAME) as FC_NAME from ASU.TREGION R1 where R1.fk_id = TO_NUMBER(ASU.PKG_SMINI.READSTRING(''CONFIG'', ''S_RAION'', ''-1''))) R2,   '#13#10+
                  '             (select max(T1.FC_NAME) as FC_NAME from ASU.TTOWN T1 where T1.fk_id = TO_NUMBER(ASU.PKG_SMINI.READSTRING(''CONFIG'', ''S_TOWN'', ''-1''))) T2,      '#13#10+
                  '             (select max(S1.FC_NAME) as FC_NAME from asu.TSTREET S1 where S1.fk_id = TO_NUMBER(ASU.PKG_SMINI.READSTRING(''CONFIG'', ''S_STREET'', ''-1''))) S2,  '#13#10+
                  '             DUAL                                                                                                                                                '#13#10;
      Session := dmMain.os;
      Open;
      if recordCount > 0 then
        Value := StringReplace(FieldByName('FC_REKVIZITI').AsString, #13#10, '', [rfReplaceAll]);
      Free;  
    end;
  end;

  if UpperVarName = 'VAR_POLUCH_REKVIZITI' then  Value :=  odsSelDocMove.FieldByName('FC_REKVIZITI').AsString;

  if UpperVarName = 'VAR_ZAV_APTEKA' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_ZAV_APTEKA', '');
    if sTemp = '' then
      Value := dmPrintReports.GetValueFromTSMINI('MANAGER_DOC', 'ZAV_APTEKA')
    else
      Value := sTemp;
  end;
end;

procedure TfrmMoveList.acToRezervExecute(Sender: TObject);
begin
  MakeAddMove(VID_DVIJENIE, VIDMOVE_TO_REZERV, 'acToRezerv');
//	ndata:=dmmain.pkgprihrash.GETRASHDATA(ServerDate(dmMain.os));
//  dmmain.ncomment:='добавление';
//  Screen.Cursor := crSQLWait;
//  dmMain.os.Savepoint('VIDMOVE_TO_REZERV');
//
//  idDocs := -1;
//  if DoShowMoveEdit(idDocs, True, VID_DVIJENIE, VIDMOVE_TO_REZERV) = mrOk then
//  begin
//		odsSelDocMove.refresh;
//    odsSelDocMove.Locate('dpid', idDocs, []);
//    acdel.Enabled := true;
//    acedit.Enabled := true;
//		dmMain.os.Commit;
//  end
//  else
//    try
//      dmMain.os.RollbackToSavepoint('VIDMOVE_TO_REZERV');
//    except
//    end;
end;


procedure TfrmMoveList.acPrnKARD_LISTExecute(Sender: TObject);
begin
  if FileExists('frxRepMoveToOtd.fr3') then
    frxRepMoveToOtd.LoadFromFile('frxRepMoveToOtd.fr3');

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_GROUP_LF', 0) = 1) then
  begin
    dmPrintReports.odsGLF_in_Doc.SetVariable('ADPID', odsSelDocMove.FieldByName('DPID').AsVariant);
    dmPrintReports.odsGLF_in_Doc.Open;
  end
  else
    if frxRepMoveToOtd.FindObject('MasterData_GLF') <> nil then
      frxRepMoveToOtd.FindObject('MasterData_GLF').Visible := False;

  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1) then
  begin
    dmPrintReports.odsFinsource_in_Doc.SetVariable('ADPID', odsSelDocMove.FieldByName('DPID').AsVariant);
    dmPrintReports.odsFinsource_in_Doc.Open;
  end
  else
    if frxRepMoveToOtd.FindObject('MasterData_FinSource') <> nil then
      frxRepMoveToOtd.FindObject('MasterData_FinSource').Visible := False;

  frxRepMoveToOtd.ShowReport();

  dmPrintReports.odsGLF_in_Doc.Close;
  dmPrintReports.odsFinsource_in_Doc.Close;

//  Application.CreateForm(tfrmfiotreb, frmFIOTreb);
//  frmFIOTreb.eotp.Text := odsSelDocMove.fieldbyname('FC_COMMENT').AsString;
//  frmFIOTreb.edolotp.Text := 'Медсестра';
//  try
//    if frmFIOTreb.ShowModal <> mrOk then Exit;
//    odsNakl.SetVariable('otp', frmFIOTreb.eotp.text);
//    odsNakl.SetVariable('dolotp', frmFIOTreb.edolotp.text);
//    odsNakl.SetVariable('adpid', odsSelDocMove.fieldbyname('DPID').AsInteger);
//    odsNakl.close;
//    odsNakl.open;
//
//    frKart_List.PrepareReport;
//    case dmPrintSelect.PrintFlag of // флаг куда печатать
//      1: ExportFRToExcel( frKart_List, odsSelDocMove.FieldByName('FC_DOCMIX').AsString+'.xls' );
//      2: frKart_List.ShowPreparedReport;
//    end;
//  finally
//    frmFIOTreb.free;
//  end;
end;
// формируем Акт НС и ПВ
procedure TfrmMoveList.acPrnNarcoticActExecute(Sender: TObject);
var
  TmpStream : TMemoryStream;
begin
  dmPrintReports.PrintNarcoticAct(
    odsSelDocMove.FieldByName('DPID').AsInteger,
    nil,
    (dmMain.ConfigParams.GetParamValue('FUNC_IS_PRINT_TREB_NAKL_ABSENT_MEDICS', False)) or (dmMain.ConfigParams.GetParamValue('FUNC_IS_PRINT_TREB_NAKL_VID0_MEDICS', 1) = 0)
   );
end;

procedure TfrmMoveList.dpeDate1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then acrefresh.Execute;
end;

procedure TfrmMoveList.dpeDate1KillFocus(const ASender: TObject; const AFocusControl: TWinControl);
begin
  acrefresh.Execute;
end;

procedure TfrmMoveList.dpeDate1CheckClick(Sender: TObject);
begin
  acrefresh.Execute;
end;

procedure TfrmMoveList.dpeDate1Change(Sender: TObject);
begin
  acrefresh.Execute;
end;

procedure TfrmMoveList.chbDate1Click(Sender: TObject);
begin
  dedDate1.Enabled := chbDate1.Checked;
  acrefresh.Execute;
end;

procedure TfrmMoveList.chbDate2Click(Sender: TObject);
begin
  dedDate2.Enabled := chbDate2.Checked;
  acrefresh.Execute;
end;

procedure TfrmMoveList.dedDate1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then acrefresh.Execute;
end;

procedure TfrmMoveList.dedDate1PropertiesEditValueChanged(Sender: TObject);
begin
 acrefresh.Execute;
end;

procedure TfrmMoveList.dedDate1PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  cxDateEdit_PropertiesValidate(Sender, DisplayValue, ErrorText, Error);
end;

procedure TfrmMoveList.cxGridMoveListDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  odsKart.Close;
  if (cxGridMoveListDBTableView1.DataController.RecordCount >0)and(cxGridMoveListDBTableView1.Controller.SelectedRowCount > 0)and(cxGridMoveListDBTableView1.Controller.SelectedRows[0].Expandable = False) then
    odsKart.SetVariable('ADPID', cxGridMoveListDBTableView1.Controller.SelectedRows[0].Values[cxGridMoveListDBTableView1DPID.Index])
  else
    odsKart.SetVariable('ADPID', -1);
  odsKart.Open;
end;

procedure TfrmMoveList.cxGridRashKartDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (dmMain.sDB_NAME = 'SK') then
  begin
    if trim(AnsiLowerCase(AViewInfo.GridRecord.DisplayTexts[cxGridRashKartDBTableView1FK_FINSOURCE_ID.Index ])) = 'федеральный бюджет' then
    begin
      ACanvas.Brush.Color := $00FFAAAA;
    end;   
  end;
end;

procedure TfrmMoveList.frNaklGetValue(const ParName: String;  var ParValue: Variant);
begin
  dmPrintReports.frReportOnGetValue(ParName, ParValue);
  if ParName = 'daterusstr'  then ParValue := GetDateStr( ServerDate(dmMain.os) );  
end;

procedure TfrmMoveList.frNaklMouseOverObject(View: TfrView;
  var Cursor: TCursor);
begin
  if (View.Name = 'Memo39')or
     (View.Name = 'Memo27')or
     (View.Name = 'Memo41')or
     (View.Name = 'Memo35')or
     (View.Name = 'Memo20')or
     (View.Name = 'Memo31')or
     (View.Name = 'Memo44')or
     (View.Name = 'Memo45')or
     (View.Name = 'Memo43')   then
  begin
    Cursor := crHandPoint;
  end;
end;

procedure TfrmMoveList.frNaklObjectClick(View: TfrView);
var 
    vPos         : Integer;
begin
  if (View.Name = 'Memo39')or
     (View.Name = 'Memo27')or
     (View.Name = 'Memo41')or
     (View.Name = 'Memo35')or
     (View.Name = 'Memo20')or
     (View.Name = 'Memo31')or
     (View.Name = 'Memo44')or
     (View.Name = 'Memo45')or
     (View.Name = 'Memo43') then
  begin

//    Case StrToInt(Copy(View.Name,5,2)) of
//      1  : aPrompt := 'Заместитель главного врача по мед. части';
//      58 : aPrompt := 'Отпустил';
//      60 : aPrompt := 'Получил';
//      20 : aPrompt := 'Материальное ответственное лицо';
//      51 : aPrompt := 'Структурное подразделение';
//    end;

    View.FrameTyp := 15;
    View.FrameColor := clRed;
    vPos := frNakl.Preview.Window.VScrollBar.Position;
    frNakl.Preview.Zoom := frNakl.Preview.Zoom; //дабы перерисовался отчет
    frNakl.Preview.Window.VScrollBar.Position := vPos;
    try
      View.Memo.Text := InputBox('Ввод данных','',Remove1310(View.Memo.Text));
    finally
      View.FrameTyp := 2;
      View.FrameColor := clBlack;
      vPos := frNakl.Preview.Window.VScrollBar.Position;
      frNakl.Preview.Zoom := frNakl.Preview.Zoom; //дабы перерисовался отчет
      frNakl.Preview.Window.VScrollBar.Position := vPos;
    end;
  end;
end;

procedure TfrmMoveList.frVedomostGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName = 'DATE1' then ParValue := dedDate1.Date;
  if ParName = 'DATE2' then ParValue := dedDate2.Date;  
end;

procedure TfrmMoveList.acSpisanieHITECExecute(Sender: TObject);
begin
  MakeAddMove(VID_RASHOD, VIDMOVE_SPISANIE_HITEC, 'acSpisanieHITEC');
end;

procedure TfrmMoveList.MakeAddMove(aFP_Vid, aFP_VID_MOVE: Integer; aRollbackName: string; aFK_TREBID : Integer = -1; aIsNewClearTreb : Boolean = False);
begin
	ndata:=dmmain.pkgprihrash.GETRASHDATA(ServerDate(dmMain.os));
  dmmain.ncomment:=aRollbackName;
  Screen.Cursor := crSQLWait;
//  dmMain.os.Savepoint(aRollbackName);

  idDocs := -1;
  if DoShowMoveEdit(idDocs, True, aFP_Vid, aFP_VID_MOVE, aFK_TREBID, aIsNewClearTreb) = mrOk then
  begin
    odsSelDocMove.AfterScroll := nil;
    odsSelDocMove.Close;
    odsSelDocMove.Open;
    odsSelDocMove.AfterScroll := nil;
    odsSelDocMove.Locate('dpid', idDocs, []);
    odsSelDocMove.AfterScroll := odsSelDocMoveAfterScroll;
    odsSelDocMoveAfterScroll( odsSelDocMove );

    acdel.Enabled  := true;
    acedit.Enabled := true;
		dmMain.os.Commit;

    // при сохранении расхода по списанию на пациента сразу выдавать сообщение обутверждении док-та, чтоб корректно списались остатки
    if ( odsSelDocMove.Active ) and  ( not odsSelDocMove.IsEmpty ) and
       (odsSelDocMove.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_SPISANIE) and
       (odsSelDocMove.FieldByName('FN_SPISANIEVID').AsInteger = SPISANIE_VID_PACIENT) and
       ( odsKart.Active ) and ( not odsKart.IsEmpty )  then
    begin
      acSign.Execute;                                
    end;
  end
  else
    try
      dmMain.os.Rollback;
    except
    end;
end;

procedure TfrmMoveList.miActSpis_var1Click(Sender: TObject);
begin
  nTypeActSpis := TMenuItem(Sender).Tag;
end;

function READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;
begin
  frmMoveList.oqPKG_SMINI.ClearVariables;
  frmMoveList.oqPKG_SMINI.SetVariable('PSECTION', aFC_SECTION);
  frmMoveList.oqPKG_SMINI.SetVariable('PIDENT',   aFC_KEY);
  frmMoveList.oqPKG_SMINI.SetVariable('PDEFAULT', aFC_DEFAULT_VALUE);

  frmMoveList.oqPKG_SMINI.Execute;
  Result := nvl(frmMoveList.oqPKG_SMINI.GetVariable('PVALUE'), '');
end;

procedure TfrmMoveList.Print_RepRashDocPoMedicType(Sender: TObject);
var
  FileName : string;
  Excel : variant;
  frView : TfrView;
  Params : TArrayOfParams;
  i, i2 : integer;
  v_Report_EngSynonim, v_filename : string;
  mi : TMenuItem;
  p : TPoint;
  v_n_Pred,v_n_Kom1,v_n_Kom2,v_n_Kom3,
  v_n_DolPred,v_n_DolKom1,v_n_DolKom2,v_n_DolKom3 : integer;

const ExeFileNameRpt = 'prRashBuh.exe';
      c_iniFileName  = 'prRashBuh.exe.ini';
begin
    // тупо копируем из prRaschBuch
  v_Report_EngSynonim := 'RepRashDocPoMedicType';

  i2 := 0;
  SetLength( Params, 1);
  Params[i2].Name := 'Председатель';
  v_n_Pred:=i2;
  Params[i2].Value := IniReadString(c_iniFileName,v_Report_EngSynonim, 'Predsed', '');
  Params[i2].ParamType := 1;
  inc( i2 );

  i := 3; //dmMain.ConfigParams.GetParamValue('FUNC_COUNT_SPIS_CHLEN_KOM', 3);
  SetLength( Params, Length(Params)+i);
  Params[i2].Name := 'Член ком.'+IntToStr(1);
  v_n_Kom1:=i2;
  Params[i2].Value := IniReadString(c_iniFileName, v_Report_EngSynonim, 'ChlenKom'+IntToStr(1), '');
  Params[i2].ParamType := 1;
  inc( i2 );
  Params[i2].Name := 'Член ком.'+IntToStr(2);
  v_n_Kom2:=i2;
  Params[i2].Value := IniReadString(c_iniFileName, v_Report_EngSynonim, 'ChlenKom'+IntToStr(2), '');
  Params[i2].ParamType := 1;
  inc( i2 );
  Params[i2].Name := 'Член ком.'+IntToStr(3);
  v_n_Kom3:=i2;
  Params[i2].Value := IniReadString(c_iniFileName, v_Report_EngSynonim, 'ChlenKom'+IntToStr(3), '');
  Params[i2].ParamType := 1;
  inc( i2 );

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Мат. отв. лицо';
  Params[i2].Value := IniReadString(c_iniFileName,v_Report_EngSynonim, 'MO', '');
  Params[i2].ParamType := 1;
  inc( i2 );

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Утверждаю (ФИО)';
  Params[i2].Value := IniReadString(c_iniFileName,v_Report_EngSynonim, 'UTVERJDAYU_FIO', '');
  Params[i2].ParamType := 1;
  inc( i2 );

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Должн. председателя';
  v_n_DolPred:=i2;
  Params[i2].Value := IniReadString(c_iniFileName,v_Report_EngSynonim, 'DoljnChlenPredsed', '');
  Params[i2].ParamType := 0;
  inc( i2 );
  i := 3; //dmMain.ConfigParams.GetParamValue('FUNC_COUNT_SPIS_CHLEN_KOM', 3);
  SetLength( Params, Length(Params)+i);
    Params[i2].Name := 'Должн. члена ком.'+IntToStr(1);
    v_n_DolKom1:=i2;
    Params[i2].Value := IniReadString(c_iniFileName,v_Report_EngSynonim, 'DoljnChlenKom'+IntToStr(1), '');
    Params[i2].ParamType := 0;
    inc( i2 );
    Params[i2].Name := 'Должн. члена ком.'+IntToStr(2);
    v_n_DolKom2:=i2;
    Params[i2].Value := IniReadString(c_iniFileName,v_Report_EngSynonim, 'DoljnChlenKom'+IntToStr(2), '');
    Params[i2].ParamType := 0;
    inc( i2 );
    Params[i2].Name := 'Должн. члена ком.'+IntToStr(3);
    v_n_DolKom3:=i2;
    Params[i2].Value := IniReadString(c_iniFileName,v_Report_EngSynonim, 'DoljnChlenKom'+IntToStr(3), '');
    Params[i2].ParamType := 0;
    inc( i2 );

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Должность МО';
  Params[i2].Value := IniReadString(c_iniFileName,v_Report_EngSynonim, 'DoljnMO', '');
  Params[i2].ParamType := 0;
  inc( i2 );

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Утверждаю (Должн.)';
  Params[i2].Value := IniReadString(c_iniFileName,v_Report_EngSynonim, 'UTVERJDAYU_DOLJN', '');
  Params[i2].ParamType := 0;
  inc( i2 );

  for i := 0 to Length(Params) - 1 do
    if i < 6 then Params[i].ParamType := 1 else Params[i].ParamType := 0;

  FZaklKom := EncodeHexToString(IniReadString(c_iniFileName, v_Report_EngSynonim, 'ZaklKom', ''));

  FSpisano := EncodeHexToString(IniReadString(c_iniFileName, v_Report_EngSynonim, 'Spisano', ''));
  FPrikaz := IniReadString(c_iniFileName, v_Report_EngSynonim, 'PrikazOt', 'от "___"  ____________  20___ г  № ___');

  if DoShowReportInputActSpis(dmMain.os, Params, FZaklKom, FSpisano, FPrikaz) = mrOk then
  begin
    FPred := Params[v_n_Pred].Value;
    FKom1 := Params[v_n_Kom1].Value;
    FKom2 := Params[v_n_Kom2].Value;
    FKom3 := Params[v_n_Kom3].Value;
    FDolPred := Params[v_n_DolPred].Value;
    FDolKom1 := Params[v_n_DolKom1].Value;
    FDolKom2 := Params[v_n_DolKom2].Value;
    FDolKom3 := Params[v_n_DolKom3].Value;
    
    FProfilID := -1; // pmProfil.Tag; // все профили
    odsSelDocPoMedicType.SetVariable('MO_GROUP', v_CurMOGroupPRN);
    odsSelDocPoMedicType.SetVariable('ADATA1',   v_d1);
    odsSelDocPoMedicType.SetVariable('ADATA2',   v_d2);
    odsSelDocPoMedicType.SetVariable('PUCHGR',   FUchGrID);
    odsSelDocPoMedicType.SetVariable('FK_PROFIL_ID',   FProfilID);
    odsSelDocPoMedicType.SetVariable('IS_RPO',   IS_RPO);
    {
    if (READSTRING_TSMINI(ExeFileNameRpt, 'USE_DATE_SPIS_INSTEAD_OF_DATE', '0') = '1') then
      odsRashByUchgr_FincSrc.SetVariable('USE_DATE_SPIS_INSTEAD_OF_DATE',   'nvl(TDPC.FD_DATE_SPIS,TDOCS.FD_DATA)')
    else
      odsRashByUchgr_FincSrc.SetVariable('USE_DATE_SPIS_INSTEAD_OF_DATE',   'TDOCS.FD_DATA');
    }
    odsSelDocPoMedicType.Open;
    try

      frxRashDocPoMedicType.AddFunction('function GETZAKLKOM(): string');
      frxRashDocPoMedicType.AddFunction('function GETSPISANO(): string');
      frxRashDocPoMedicType.AddFunction('function MONEYSTR(Summa: double) : string');
      frxRashDocPoMedicType.AddFunction('function GET_NAIM_KOL(aNumber: Integer; aRod : Integer) : string');

      if v_is_to_EXCEL then
      begin
        frxRashDocPoMedicType.PrepareReport;
        ExportFRToExcel( frxRashDocPoMedicType, odsSelDocMove.FieldByName('FC_DOCMIX').AsString+'.xls' );
      end else
      begin
        frxRashDocPoMedicType.ShowReport;
      end;

    finally
      odsSelDocPoMedicType.Close;
    end;
  end else
  begin
    FZaklKom := '';
    FSpisano := '';
  end;
end;

procedure TfrmMoveList.miActSpis_var3ClickStart(Sender: TObject);
var mi : TMenuItem;
    p : TPoint;
begin // Акт списания по учетным группам для ХАНТ
  v_pr_prn:=True;
  fPrintActSpisUchGrp:= TfPrintActSpisUchGrp.Create(Self);
  try
  //  fPrintActSpisUchGrp.Left := pmPrintActSpis.PopupPoint.X ;
  //  fPrintActSpisUchGrp.Top := pmPrintActSpis.PopupPoint.Y ;
    fPrintActSpisUchGrp.D1.Date := EncodeDate(  YearOf(dedDate1.Date), MonthOf(dedDate1.Date), 1 ) ;
    fPrintActSpisUchGrp.D2.Date := EncodeDate(  YearOf(dedDate1.Date), MonthOf(dedDate1.Date), DaysInMonth(dedDate1.Date) ) ; // dedDate2.Date;
    //
    fPrintActSpisUchGrp.aodsMO_GROUP.Open;
    if not fPrintActSpisUchGrp.aodsMO_GROUP.eof then
    if fPrintActSpisUchGrp.aodsMO_GROUP.Locate('GROUPID', CurMOGroup, []) then
      fPrintActSpisUchGrp.lcbMO_GROUP.SelText := fPrintActSpisUchGrp.aodsMO_GROUP.FieldByName('FC_GROUP').AsString;
    //
    if fPrintActSpisUchGrp.ShowModal=mrOk then
    begin
      FUchGrID := fPrintActSpisUchGrp.cxodsUchGrList.EditValue;
      if fPrintActSpisUchGrp.cbPRO.Checked then
        IS_RPO   := 1
      else
        IS_RPO   := 0;
      v_CurMOGroupPRN := fPrintActSpisUchGrp.lcbMO_GROUP.EditValue;
      v_d1 := fPrintActSpisUchGrp.D1.Date;
      v_d2 := fPrintActSpisUchGrp.D2.Date;
      v_is_to_EXCEL := fPrintActSpisUchGrp.vRBExcel;
      // Печать
      Print_RepRashDocPoMedicType(Sender);
    end;
  finally
    FreeAndNil(fPrintActSpisUchGrp);
  end;
end;

procedure TfrmMoveList.miPrintM15Click(Sender: TObject);
begin
  if FileExists('frxM15.fr3') then
    frxM15.LoadFromFile('frxM15.fr3');

  frxM15.AddFunction('function GET_NAIM_KOL(aNumber: Integer; aRod : Integer): string');
  frxM15.AddFunction('function MONEYSTR(Summa: double): string');
  frxM15.AddFunction('function DATERUSSTR(aDate : TDate) : string');
  frxM15.AddFunction('function INIWRITESTRING2(Section, Ident: string; Value: string) : integer');

  frxM15.PrepareReport();
  frxM15.ShowPreparedReport;
end;

procedure TfrmMoveList.miPrintTrebWithDetailClick(Sender: TObject);
begin
  dmPrintReports.PrintTreb( odsSelDocMove.FieldByName('DPID').AsInteger,
                            odsSelDocMove.FieldByName('FC_DOC').AsString,
                            odsSelDocMove.FieldByName('FD_INVOICE').AsDateTime,
                            odsSelDocMove.FieldByName('FC_MOGROUPID_FROM_ORIG').AsString,
                            odsSelDocMove.FieldByName('FC_MOGROUPID_TO_ORIG').AsString,
                            odsSelDocMove.FieldByName('FC_DOCMIX').AsString+'.xls',
                            odsSelDocMove.FieldByName('NAMEFROM').AsString,
                            odsSelDocMove.FieldByName('NAMETO').AsString,
                           (dmMain.ConfigParams.GetParamValue('FUNC_IS_PRINT_TREB_NAKL_ABSENT_MEDICS', False)),
                            fdmMain.nvl(odsSelDocMove.FieldByName('mogr_from_fk_sklad_id').AsInteger,-1),
                            -1, //TrebID
                            true //aIsPrintDecode
                          );
end;

end.

