unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ActnList, dxBar, Oracle, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, dxPSUtl, // - нужно для копирования в clipboard
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  OracleData, jvDBUtils, Menus, Clipbrd, cxGridExportLink,
  frxClass, frxDBSet, ShellAPI, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, dxSkinsdxBarPainter, JclFileUtils, cxImageComboBox, uGlobalConst,
  cxSplitter, ExtCtrls, cxContainer, cxLabel, cxLookAndFeelPainters, StdCtrls,
  cxButtons, SMMainAPI, dxmdaset, cxCalendar, cxDateUtils, dxSkinOffice2007Green;

type
  TfrmMain = class(TForm)                     
    ilMain: TImageList;
    actlstMain: TActionList;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    dxBarDockControl2: TdxBarDockControl;
    dxEdit: TdxBarEdit;
    bbChoice: TdxBarButton;
    bbNet: TdxBarButton;
    bbClose: TdxBarButton;
    bbLoad: TdxBarButton;
    bbShow: TdxBarButton;
    bbEdit: TdxBarButton;
    bbDel: TdxBarButton;
    actClose: TAction;
    actAdd: TAction;
    actShow: TAction;
    actEdit: TAction;
    actDel: TAction;
    bbPac: TdxBarButton;
    actPac: TAction;
    actNetFluoro: TAction;
    actChoice: TAction;
    os: TOracleSession;
    TV: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    VNUM: TcxGridDBColumn;
    VFIO: TcxGridDBColumn;
    VSEX: TcxGridDBColumn;
    VDATEBIRTH: TcxGridDBColumn;
    VFLUORO: TcxGridDBColumn;
    odsListUch: TOracleDataSet;
    dsList: TDataSource;
    dxName: TdxBarEdit;
    odsListFactory: TOracleDataSet;
    bbSet: TdxBarButton;
    actSet: TAction;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    bbPrint: TdxBarButton;
    actPrint: TAction;
    actCopyFIO: TAction;
    actText: TAction;
    actWeb: TAction;
    actXML: TAction;
    actXLS: TAction;
    sdPopUp: TSaveDialog;
    frxDBPrintList: TfrxDBDataset;
    bb1: TdxBarButton;
    actOpenMK: TAction;
    bbHide: TdxBarButton;
    actHide: TAction;
    odsListFactoryROWNUM: TFloatField;
    odsListFactoryFL_HIDE: TFloatField;
    odsListFactoryFK_ID: TFloatField;
    odsListFactoryFK_PEOPLEID: TFloatField;
    odsListFactoryFK_COMPANYID: TFloatField;
    odsListFactoryPEPLID: TFloatField;
    odsListFactoryFIO: TStringField;
    odsListFactoryFC_FAM: TStringField;
    odsListFactoryFC_IM: TStringField;
    odsListFactoryFC_OTCH: TStringField;
    odsListFactoryFD_ROJD: TDateTimeField;
    odsListFactoryFP_SEX: TIntegerField;
    odsListFactorySEX: TStringField;
    frxPrintList: TfrxReport;
    VKMNS: TcxGridDBColumn;
    odsListFactoryKMNS: TStringField;
    bbJournal: TdxBarButton;
    actJournal: TAction;
    actZakl: TAction;
    VPLANFLUORO: TcxGridDBColumn;
    bbZakl: TdxBarButton;
    aZakl: TAction;
    VCNTTUB: TcxGridDBColumn;
    ilCntTub: TImageList;
    odsListFactoryCNTTUB: TFloatField;
    odsListFactoryPLAN_FLUORO: TDateTimeField;
    dxBarPopupMenu1: TdxBarPopupMenu;
    bJournal: TdxBarButton;
    dxBarButton2: TdxBarButton;
    aDate: TAction;
    paControl: TPanel;
    cxSplitter1: TcxSplitter;
    cxLabel1: TcxLabel;
    lbDate: TcxLabel;
    cxLabel3: TcxLabel;
    lbSotr: TcxLabel;
    bDateControl: TcxButton;
    tmrCheckApplication: TTimer;
    VPERIOD: TcxGridDBColumn;
    odsListFactoryPER: TStringField;
    stRep: TcxStyleRepository;
    stBold: TcxStyle;
    VRG: TcxGridDBColumn;
    ilRgPlus: TImageList;
    odsListFactoryCNTRG: TFloatField;
    bbRgPlus: TdxBarButton;
    aRgPlus: TAction;
    N4: TMenuItem;
    N5: TMenuItem;
    oqSetPeriodOsm: TOracleQuery;
    odsListUchPEPLID: TFloatField;
    odsListUchFIO: TStringField;
    odsListUchFD_ROJD: TDateTimeField;
    odsListUchFP_SEX: TIntegerField;
    odsListUchSEX: TStringField;
    odsListUchDATE_FLUORO: TStringField;
    odsListUchPLAN_FLUORO: TStringField;
    odsListUchCNTTUB: TFloatField;
    odsListUchCNTRG: TFloatField;
    odsListUchKMNS: TStringField;
    odsListUchROWNUM: TFloatField;
    odsListUchPER: TStringField;
    odsListUchFK_ID: TFloatField;
    TV1: TcxGridTableView;
    V1_ROWNUM: TcxGridColumn;
    V1_RGPLUS: TcxGridColumn;
    V1_TUB: TcxGridColumn;
    V1_FIO: TcxGridColumn;
    V1_SEX: TcxGridColumn;
    V1_DATEROJD: TcxGridColumn;
    V1_KMNS: TcxGridColumn;
    V1_PER: TcxGridColumn;
    oqThreadUch: TOracleQuery;
    dxMemData1: TdxMemData;
    dxMemData1ROWNUM: TIntegerField;
    dxMemData1RGPLUS: TIntegerField;
    dxMemData1TUB: TIntegerField;
    dxMemData1FIO: TStringField;
    dxMemData1SEX: TStringField;
    dxMemData1KMNS: TStringField;
    dxMemData1LASTFLU: TStringField;
    dxMemData1PLANFLU: TStringField;
    dxMemData1PER: TStringField;
    dxMemData1FK_ID: TIntegerField;
    V1_FK_ID: TcxGridColumn;
    dxMemData1PEPLID: TIntegerField;
    V1_PEPLID: TcxGridColumn;
    V1_COMPANYNAME: TcxGridColumn;
    dxMemData1COMPANYNAME: TStringField;
    frxPrintListUch: TfrxReport;
    frxDBPrintListUch: TfrxDBDataset;
    V1_ADR: TcxGridColumn;
    dxMemData1ADR: TStringField;
    V1_LAST: TcxGridColumn;
    V1_PLAN: TcxGridColumn;
    dxMemData1plan: TStringField;
    V1_FAM: TcxGridColumn;
    V1_IM: TcxGridColumn;
    V1_OTCH: TcxGridColumn;
    V1_FPSEX: TcxGridColumn;
    dxMemData1DATEROJD: TDateField;
    bbFind: TdxBarButton;
    aFind: TAction;
    VAGE: TcxGridDBColumn;
    odsListFactoryAGE: TFloatField;
    V1_AGE: TcxGridColumn;
    dxMemData1AGE: TIntegerField;
    pmTV1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    N6: TMenuItem;
    aTextTV1: TAction;
    aWebTV1: TAction;
    aXMLTV1: TAction;
    aExcelTV1: TAction;
    N7: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    XLS1: TMenuItem;
    N8: TMenuItem;
    bbBase: TdxBarButton;
    aBase: TAction;
    N9: TMenuItem;
    aJurNew: TAction;
    oqIns: TOracleQuery;
    oqUpd: TOracleQuery;
    N11: TMenuItem;
    dxBarButton1: TdxBarButton;
    bbSms: TdxBarButton;
    aSms: TAction;
    odsPhone: TOracleDataSet;
    V1_GRA: TcxGridColumn;
    dxMemData1GRA: TStringField;
    dxBarButton3: TdxBarButton;
    aCityWithoutDistr: TAction;
    dxMemData1last: TDateField;
    odsListFactoryDATE_FLUORO: TDateTimeField;
    procedure actCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAddExecute(Sender: TObject);
    procedure actShowExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure actPacExecute(Sender: TObject);
    procedure actNetFluoroExecute(Sender: TObject);
    procedure actChoiceExecute(Sender: TObject);
    procedure dxEditEnter(Sender: TObject);
    procedure odsListUchBeforeOpen(DataSet: TDataSet);
    procedure dxNameEnter(Sender: TObject);
    procedure odsListFactoryBeforeOpen(DataSet: TDataSet);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure odsListUchAfterOpen(DataSet: TDataSet);
    procedure odsListFactoryAfterOpen(DataSet: TDataSet);
    procedure actSetExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actCopyFIOExecute(Sender: TObject);
    procedure actTextExecute(Sender: TObject);
    procedure actWebExecute(Sender: TObject);
    procedure actXMLExecute(Sender: TObject);
    procedure actXLSExecute(Sender: TObject);
    procedure frxPrintListGetValue(const VarName: String; var Value: Variant);
    procedure actOpenMKExecute(Sender: TObject);
    procedure actHideExecute(Sender: TObject);
    procedure odsListUchFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure odsListUchApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: string);
    procedure actJournalExecute(Sender: TObject);
    procedure actZaklExecute(Sender: TObject);
    procedure odsListFactoryApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: string);
    procedure aZaklExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure odsListFactoryFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure aDateExecute(Sender: TObject);
    procedure cxSplitter1BeforeClose(Sender: TObject; var AllowClose: Boolean);
    procedure cxSplitter1BeforeOpen(Sender: TObject; var NewSize: Integer;
      var AllowOpen: Boolean);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure aRgPlusExecute(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure oqThreadUchThreadRecord(Sender: TOracleQuery);
    procedure oqThreadUchThreadFinished(Sender: TOracleQuery);
    procedure aFindExecute(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure aTextTV1Execute(Sender: TObject);
    procedure aWebTV1Execute(Sender: TObject);
    procedure aXMLTV1Execute(Sender: TObject);
    procedure aExcelTV1Execute(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure aBaseExecute(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure TV1FocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure N11Click(Sender: TObject);
    procedure aJurNewExecute(Sender: TObject);
    procedure aSmsExecute(Sender: TObject);
    procedure aCityWithoutDistrExecute(Sender: TObject);
  private
    nulldate : string;
//    AppHandle : Integer;
    Russian : HKL;
    CompanyId : Integer; // идешник с формы frmCompanySet с датасета odsCompany (для кнопки "Дата сверки")
    ArrId : array of Integer;
    iArr : Integer;
    { Private declarations }
  public
    get_oneinyear, get_twoinyear, get_sum_doza : Integer;
    get_show_onhand : string;
    get_xray_mrt : Integer;
    GET_XRAY_FLUKAB : Integer;
    arFIO:array of string;
    GET_DB_NAME : string;
    GET_NORMA : Integer;
    bHide : Boolean; // признак того, что кнопка "Спрятать" была нажата
    MedotradeSign : string;
    bIsAdmin : Integer; // входит ли пользователь в группу "Администраторы" (1 - входит, 0 - нет)
    GET_PROPISKAID : Integer;
    PeriodId : Integer;
    sCompanyName_4Rep, sOtdelName_4Rep : String;
    pDOCID : Integer; // тип документа (амбулаторной карты)
    pSOTRID : Integer;
    pAPPSOTRID : Integer;
    pFC_SYNONIM : String;
    WorkMode : Integer;
    sVrachFIO : String;
    GET_SYSDATE_4REP : String;
    sDateNeProshli : string; //TDateTime;
    GET_SYSTEMDATE : TDateTime;
    GET_ISSL_FLU : Integer;
    pOTDELID : Integer;
    pSPEC : Integer;
    procedure DoShowMainForm;
    procedure DoRateWork;
    procedure CheckEnabledButtons;
    procedure DoRefreshSmidConst;
    procedure DoHideRows; // прячет строчки после refresh'а, которые были спрятаны по кнопке "Спрятать"
    function RestoreApplication(AAppCaption:string):Boolean;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  GET_VIPNAZ, GET_LABVIP, GET_NAZCANCEL, GET_NEYAV : Integer;
  StartTime: TTime;
  bbr : Boolean;
  get_rad_petct : integer;
  get_rad_gamma : integer;

implementation

uses fChoice, fSetUch, fCompanySet, fSearch, fPac, fWait, fEdit, fSetDate, uDBTableUtils,
     fJournal, fSetZakl, fProsmotrZaklFlu, fDateControl, fJournalRgPlus, fPeriodOsm,
     fProgress, fFindPacUch, fAllHistory, fSetDateFG, fJournalNew, fSpisokSms,
  fJurWU;

{$R *.dfm}

procedure TfrmMain.actCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите закрыть программу ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      oqThreadUch.BreakThread;
      action := caFree
    end else
    begin
      action := caNone;
    end;
end;

procedure TfrmMain.aBaseExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAllHistory, frmAllHistory);
  try
    frmAllHistory.DoShowForm(TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_PEPLID.Index],
                             TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_FIO.Index]);
    frmAllHistory.ShowModal;
  finally
    frmAllHistory.Free;
  end;
end;

procedure TfrmMain.aCityWithoutDistrExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmJurWU, frmJurWU); // frm Jurnal Without Uchastok
  try
    frmJurWU.ShowModal;
  finally
    frmJurWU.Free;
  end;
end;

procedure TfrmMain.actAddExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSearch, frmSearch);
  try
    frmSearch.DoShowfrmSearch(WorkMode, pDOCID);
    frmSearch.ShowModal;
  finally
    frmSearch.Free;
  end;
end;

procedure TfrmMain.actShowExecute(Sender: TObject);
var id : Integer;
begin
  if WorkMode = 1 then // участки
    begin
      aSms.Visible := False;
      tv1.DataController.Filter.Active := False;
      TV1.FilterBox.Visible := fvNever;
      actPac.Enabled := False;
      actPrint.Enabled := False;
      actEdit.Enabled := False;
      bbJournal.Enabled := False;
      dxEdit.Enabled := False;
      actSet.Enabled := False;
      dxName.Enabled := False;
      aFind.Enabled := False;
      actChoice.Enabled := False;
      actNetFluoro.Enabled := False;
      actShow.Enabled := False;
      aBase.Enabled := False;
      Screen.Cursor := crSQLWait;
      cxGrLevel1.GridView := TV1;
      actPrint.Enabled := False;
      TV1.BeginUpdate;
      TV1.DataController.RecordCount := 0;
      while TV1.DataController.LockCount > 0 do
        TV1.EndUpdate;
      cxGr.Refresh;
      dxMemData1.Close;
      dxMemData1.Open;
      StartTime:= Now;
      oqThreadUch.Scrollable := True;
      oqThreadUch.SetVariable('pfk_arealid', dxName.Tag);
      oqThreadUch.Execute;
    end;
  if WorkMode = 2 then // предприятия
    begin
      id := dsList.DataSet.FieldByName('rownum').AsInteger;
      bHide := False;
      SetLength(ArrId, 0);
      iArr := 0;
      dsList.DataSet.Filtered := False;
      RefreshQuery(dsList.DataSet); //!!! почему-то при обновлении списка происходит перескакивание на первую строчку
      dsList.DataSet.Locate('rownum', id, []);
      aSms.Visible := False;
   end;
end;

procedure TfrmMain.actEditExecute(Sender: TObject);
var oq : TOracleQuery;
    id : Integer;
    ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmEdit, frmEdit);
  try
    if WorkMode = 1 then // участки
      begin
        frmEdit.DoPeriod(TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_PEPLID.Index]);
        frmEdit.DoSetRgPlus(TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_PEPLID.Index]);
        frmEdit.DoPhone(TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_PEPLID.Index]);
        frmEdit.cxFam.Text := TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_FAM.Index];
        frmEdit.cxName.Text := TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_IM.Index];
        frmEdit.cxOtch.Text := TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_OTCH.Index];
        frmEdit.cxdeRojd.Date := TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_DATEROJD.Index];
        if TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_FPSEX.Index] = 1 then
          frmEdit.cxMale.Checked := TRUE
        else
          frmEdit.cxFemale.Checked := TRUE;
      end;
    if WorkMode = 2 then // предприятия
      begin
        frmEdit.DoPeriod(dsList.DataSet.FieldByName('PEPLID').AsInteger);
        frmEdit.DoSetRgPlus(dsList.DataSet.FieldByName('PEPLID').AsInteger);
        frmEdit.DoPhone(dsList.DataSet.FieldByName('PEPLID').AsInteger);
        frmEdit.cxFam.Text := dsList.DataSet.FieldByName('FC_FAM').AsString;
        frmEdit.cxName.Text := dsList.DataSet.FieldByName('FC_IM').AsString;
        frmEdit.cxOtch.Text := dsList.DataSet.FieldByName('FC_OTCH').AsString;
        frmEdit.cxdeRojd.Date := dsList.DataSet.FieldByName('FD_ROJD').AsDateTime;
        if dsList.DataSet.FieldByName('FP_SEX').AsInteger = 1 then
          frmEdit.cxMale.Checked := TRUE
        else
          frmEdit.cxFemale.Checked := TRUE;
      end;
    frmEdit.ShowModal;
    if frmEdit.ModalResult = mrOK then
      begin
        if WorkMode = 1 then // участки
          begin
            oq := TOracleQuery.Create(nil);
            ods := TOracleDataSet.Create(nil);
            try
              oq.Session := os;
              oq.Cursor := crSQLWait;
              oq.SQL.Text := ' UPDATE ASU.TPEOPLES '+#13+
                             '    SET FC_FAM = :PFC_FAM, FC_IM = :PFC_IM, FC_OTCH = :PFC_OTCH, FP_SEX = :PFP_SEX, FD_ROJD = :PFD_ROJD '+#13+
                             '  WHERE FK_ID = :PFK_ID ';
              oq.DeclareAndSet('PFC_FAM', otString, frmEdit.cxFam.Text);
              oq.DeclareAndSet('PFC_IM', otString, frmEdit.cxName.Text);
              oq.DeclareAndSet('PFC_OTCH', otString, frmEdit.cxOtch.Text);
              if frmEdit.cxMale.Checked = TRUE then
                oq.DeclareAndSet('pFP_SEX', otInteger, 1)
              else
                oq.DeclareAndSet('pFP_SEX', otInteger, 0);
              oq.DeclareAndSet('PFD_ROJD', otDate, frmEdit.cxdeRojd.Date);
              oq.DeclareAndSet('PFK_ID', otString, TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_PEPLID.Index]);
              oq.Execute;
              os.Commit;
              TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_FIO.Index] := frmEdit.cxFam.Text+' '+frmEdit.cxName.Text+' '+frmEdit.cxOtch.Text;
              TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_FAM.Index] := frmEdit.cxFam.Text;
              TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_IM.Index] := frmEdit.cxName.Text;
              TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_OTCH.Index] := frmEdit.cxOtch.Text;
              TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_DATEROJD.Index] := frmEdit.cxdeRojd.Date;
              if frmEdit.cxMale.Checked = TRUE then
                begin
                  TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_FPSEX.Index] := 1;
                  TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_SEX.Index] := 'М';
                end else
                begin
                  TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_FPSEX.Index] := 0;
                  TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_SEX.Index] := 'Ж';
                end;
              TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_PER.Index] := frmEdit.cxPeriod.EditText;
              if frmEdit.cbRgPlus.Checked then
                TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_RGPLUS.Index] := 1
              else
                TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_RGPLUS.Index] := 0;
//--------->> Вычисление плана
              ods.Session := os;
              ods.Cursor := crSQLWait;
              ods.SQL.Text := ' select asu.get_plan_fluoro_date(:pfk_peplid) as plan_date from dual ';
              ods.DeclareAndSet('pfk_peplid', otInteger, TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_PEPLID.Index]);
              ods.Open;
              if ods.FieldByName('plan_date').AsString <> ''  then
                TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_PLAN.Index] := ods.FieldByName('plan_date').AsString
              else
                TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_PLAN.Index] := null;
            finally
              ods.Free;
              oq.Free;
            end;
          end;
        if WorkMode = 2 then // предприятия
          begin
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := os;
              oq.Cursor := crSQLWait;
              oq.SQL.Text := ' UPDATE ASU.TPEOPLES '+#13+
                             '    SET FC_FAM = :PFC_FAM, FC_IM = :PFC_IM, FC_OTCH = :PFC_OTCH, FP_SEX = :PFP_SEX, FD_ROJD = :PFD_ROJD '+#13+
                             '  WHERE FK_ID = :PFK_ID ';
              oq.DeclareAndSet('PFC_FAM', otString, frmEdit.cxFam.Text);
              oq.DeclareAndSet('PFC_IM', otString, frmEdit.cxName.Text);
              oq.DeclareAndSet('PFC_OTCH', otString, frmEdit.cxOtch.Text);
              if frmEdit.cxMale.Checked = TRUE then
                oq.DeclareAndSet('pFP_SEX', otInteger, 1)
              else
                oq.DeclareAndSet('pFP_SEX', otInteger, 0);
              oq.DeclareAndSet('PFD_ROJD', otDate, frmEdit.cxdeRojd.Date);
              oq.DeclareAndSet('PFK_ID', otString, dsList.DataSet.FieldByName('FK_PEOPLEID').AsInteger);
              oq.Execute;
              os.Commit;
              id := dsList.DataSet.FieldByName('FK_ID').AsInteger;
              RefreshQuery(dsList.DataSet);
              if bHide = True then
                DoHideRows;
              dsList.DataSet.Locate('FK_ID', id, []);
            finally
              oq.Free;
            end;
          end;
      end;
  finally
    frmEdit.Free;
  end;
end;

procedure TfrmMain.actDelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if WorkMode = 1 then // Режим работы - Участки
    begin
      if Application.MessageBox('Вы действительно хотите открепить человека от данного участка?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
        begin
          oq := TOracleQuery.Create(nil);
          try
            oq.Session := os;
            oq.Cursor := crSQLWait;
            oq.SQL.Text := ' UPDATE TAMBULANCE SET FK_UCHID = NULL WHERE FK_ID = :PFK_ID ';
            oq.DeclareAndSet('PFK_ID', otInteger, odsListUch.FieldByName('FK_ID').AsInteger);
            oq.Execute;
            os.Commit;
          finally
            oq.Free;
          end;
          RefreshQuery(odsListUch);
          if bHide = True then
            DoHideRows;
        end;
    end;
  if WorkMode = 2 then // Режим работы - Предприятия 
    begin
      if Application.MessageBox('Вы действительно хотите открепить человека от данного предприятия?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
        begin
          oq := TOracleQuery.Create(nil);
          try
            oq.Session := os;
            oq.Cursor := crSQLWait;
            oq.SQL.Text := ' DELETE FROM TPEOPLES_COMPANY WHERE FK_ID = :PFK_ID ';
            oq.DeclareAndSet('PFK_ID', otInteger, odsListFactory.FieldByName('FK_ID').AsInteger);
            oq.Execute;
            os.Commit;
          finally
            oq.Free;
          end;
          RefreshQuery(odsListFactory);
          if bHide = True then // если нажималась кнопка "Спрятать", то прячем строчки
            DoHideRows;
        end;
    end;
end;

procedure TfrmMain.actPacExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmPac, frmPac);
  try
    if WorkMode = 1 then
      begin
        frmPac.DoShowFormPac(TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_PEPLID.Index],
                             TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_FIO.Index]);
      end;
    if WorkMode = 2 then
      begin
        frmPac.DoShowFormPac(dsList.DataSet.FieldByName('PEPLID').AsInteger, dsList.DataSet.FieldByName('FIO').AsString);
      end;
    frmPac.ShowModal;
  finally
    frmPac.Free;
  end;
end;

procedure TfrmMain.actNetFluoroExecute(Sender: TObject);
var fltMain : TcxFilterCriteriaItemList;
begin
  Application.CreateForm(TfrmSetDate, frmSetDate);
  try
    frmSetDate.ShowModal;
    if frmSetDate.ModalResult = mrOk then
      begin
        if WorkMode = 1 then // участки
          begin
            fltMain := TV1.DataController.Filter.Root;
            fltMain.Clear;
            fltMain.BoolOperatorKind := fboAnd;
            fltMain.AddItem(TV1.Columns[V1_PLAN.index], foLess, Trunc(frmSetDate.JvCalendar1.Date), DateTimeToStr(Trunc(frmSetDate.JvCalendar1.Date)));
            aSms.Visible := True;
            aSms.Enabled := oqThreadUch.RowCount <> 0;
            TV1.DataController.Filter.Active := True;
            TV1.FilterBox.Visible := fvNonEmpty;
          end;
        if WorkMode = 2 then // предприятия
          begin
            sDateNeProshli := DateTimeToStr(Trunc(frmSetDate.JvCalendar1.Date));
            dsList.DataSet.Filtered := True;
            aSms.Visible := True;
            aSms.Enabled := dsList.DataSet.RecordCount <> 0;
          end;
      end;
  finally
    frmSetDate.Free;
  end;
end;

procedure TfrmMain.actChoiceExecute(Sender: TObject);
var Ver : TJclFileVersionInfo;
begin
  try
    if WorkMode = 1 then // режим работы - Участки
      begin
        Application.CreateForm(TfrmSetUch, frmSetUch);
        try
          frmSetUch.DoShowForm;
          frmSetUch.ShowModal;
          if frmSetUch.ModalResult = mrOK then
            begin
              bHide := False;
              dxName.Text := frmSetUch.lcbType.EditText+'. '+'Участок'+' '+frmSetUch.odsListUch.FieldByName('FC_NAME').AsString;
              dxName.Tag := frmSetUch.odsListUch.FieldByName('FK_ID').AsInteger;
              SetLength(ArrId, 0);
              iArr := 0;
              actAdd.Enabled := True;
              actPac.Enabled := False;
              actPrint.Enabled := False;
              actEdit.Enabled := False;
              bbJournal.Enabled := False;
              dxEdit.Enabled := False;
              actSet.Enabled := False;
              dxName.Enabled := False;
              aFind.Enabled := False;
              actChoice.Enabled := False;
              actNetFluoro.Enabled := False;
              actShow.Enabled := False;
              aBase.Enabled := False;
              Screen.Cursor := crSQLWait;
//------- запускаем триад
              cxGrLevel1.GridView := TV1;
              actPrint.Enabled := False;
              TV1.BeginUpdate;
              TV1.DataController.RecordCount := 0;
              while TV1.DataController.LockCount > 0 do
                TV1.EndUpdate;
              cxGr.Refresh;
              dxMemData1.Close;
              dxMemData1.Open;
              StartTime:= Now;
              oqThreadUch.Scrollable := True;
              oqThreadUch.SetVariable('pfk_arealid', dxName.Tag);
              oqThreadUch.Execute;
//--------
              Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
              frmMain.Caption := 'ЖУРНАЛ ФЛЮОРОГРАФИИ('+Ver.FileVersion+'). Пользователь: '+sVrachFIO+' '+dxEdit.Text+'. '+dxName.Text;
              Ver.Free;
            end;
        finally
          frmSetUch.Free;
        end;
      end;

    if WorkMode = 2 then // режим работы - Предприятия
      begin
        Application.CreateForm(TfrmCompanySet, frmCompanySet);
        frmCompanySet.DoShowForm;
        frmCompanySet.ShowModal;
        if frmCompanySet.ModalResult = MrOK then
          begin
            bHide := False;
            SetLength(ArrId, 0);
            iArr := 0;
            dxName.Text := frmCompanySet.odsTree.FieldByName('FC_NAME').AsString+' - '+frmCompanySet.odsCompany.FieldByName('FC_NAME').AsString;
            dxName.Tag := frmCompanySet.odsCompany.FieldByName('FK_COMPANYID').AsInteger;
            PeriodId := frmCompanySet.odsCompany.FieldByName('FK_OWNER').AsInteger;
            CompanyId := frmCompanySet.odsCompany.FieldByName('FK_ID').AsInteger;
            if DateTimeToStr(frmCompanySet.odsCompany.FieldByName('FD_DATECONTROL').AsDateTime) = '30.12.1899' then // !!! не нравится мне это условие
              lbDate.Caption := '--'
            else
              lbDate.Caption := DateTimeToStr(frmCompanySet.odsCompany.FieldByName('FD_DATECONTROL').AsDateTime);
            lbSotr.Caption := frmCompanySet.odsCompany.FieldByName('SOTRFIO').AsString;
            aDate.Enabled := True;
            dsList.DataSet := odsListFactory;
            SetLength(ArrId, 0);
            iArr := 0;
            cxGrLevel1.GridView := TV;
            odsListFactory.Close;
            odsListFactory.Open;
            if frmCompanySet.idSearchPeople <> 0 then
              odsListFactory.Locate('PEPLID', frmCompanySet.idSearchPeople, []);
            actAdd.Enabled := True;
//            actShow.Enabled := True;
            actPrint.Enabled := True;
            CheckEnabledButtons;
            Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
            frmMain.Caption := 'ЖУРНАЛ ФЛЮОРОГРАФИИ('+Ver.FileVersion+'). Пользователь: '+sVrachFIO+' '+dxEdit.Text+'. '+dxName.Text;
            Ver.Free;
          end;
        frmCompanySet.Free;
      end;
    except
    end;
end;

procedure TfrmMain.dxEditEnter(Sender: TObject);
begin
  actSetExecute(nil);
end;

procedure TfrmMain.DoShowMainForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  DoRefreshSmidConst;
  bHide := False;
  actChoice.Enabled := False;
  actAdd.Enabled := False;
  actShow.Enabled := False;
  actEdit.Enabled := False;
  actDel.Enabled := False;
  actPac.Enabled := False;
  actPrint.Enabled := False;
  actHide.Enabled := False;
  aZakl.Enabled := False;
  aDate.Enabled := False;
  N5.Enabled := False;
  aBase.Enabled := False;
  pAPPSOTRID := StrToInt(paramstr(1));
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID, ASU.DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, '+#13+
                    '        (SELECT FC_NAME '+#13+
                    '           FROM ASU.TOTDEL WHERE FK_ID = (SELECT FK_OTDID FROM ASU.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME, '+#13+
                    '        ASU.GET_ADMINS_FOR_XRAY(FK_SOTRID) AS IS_ADMIN '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sVrachFIO := ods.FieldByName('VRACHFIO').AsString;
    sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
    bIsAdmin := ods.FieldByName('IS_ADMIN').AsInteger;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT FK_OTDELID, FK_SPRAVID FROM ASU.TSOTR WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pSOTRID);
    ods.Open;
    pOTDELID := ods.FieldByName('FK_OTDELID').AsInteger;
    pSPEC := ods.FieldByName('FK_SPRAVID').AsInteger;
    frmMain.Caption := 'ЖУРНАЛ ФЛЮОРОГРАФИИ('+Ver.FileVersion+'). Пользователь: '+sVrachFIO;
  finally
    ods.Free;
    Ver.Free;
  end;

  MedotradeSign := ReadMedotradeSign;
  TV.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TV'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TV');
  TV1.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TV1'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TV1');
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TV'+'Vrach'+ '_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TV');
  TV1.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TV1'+'Vrach'+ '_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TV1');
  SetLength(ArrId, 0); // !!! нужно ли это здесь? повтор?
  iArr := 0;
end;

procedure TfrmMain.DoHideRows;
var c : Integer; //счетчик
begin
  dsList.DataSet.DisableControls;
  dsList.DataSet.First;
  while not dsList.DataSet.Eof do
    begin
      for c := 0 to Length(ArrId) do
        begin
          if dsList.DataSet.FieldByName('FK_ID').AsInteger = ArrId[c] then
            begin
              dsList.DataSet.Edit;
              dsList.DataSet.FieldByName('FL_HIDE').AsInteger := 1;
              dsList.DataSet.Post;
            end;
        end;
      dsList.DataSet.Next;  
    end;
  dsList.DataSet.EnableControls;
  dsList.DataSet.Filtered := True;
  dsList.DataSet.Filter := 'FL_HIDE <> '+IntToStr(1);
  CheckEnabledButtons;
end;

procedure TfrmMain.DoRateWork;
begin
  if pFC_SYNONIM = 'FLUORO_VYVERKA_UCH' then //режим работы - участки
    begin
      WorkMode := 1;
      actChoice.Caption := 'Участки';
      aFind.Visible := True;
      aDate.Visible := False;
      actAdd.Visible := True;
      actAdd.ImageIndex := 20;
      actAdd.Caption := 'Поиск';
      actAdd.Hint := 'Поиск';
      actDel.Visible := False;
      actHide.Visible := False;
      actOpenMK.Visible := False;
      aZakl.Visible := False;
      aBase.Visible := True;
      N5.Visible := False;
      cxSplitter1.Visible := False;
      paControl.Visible := False;
      SetLength(ArrId, 0);
      iArr := 0;
    end;
  if pFC_SYNONIM = 'FLUORO_VYVERKA_FACTORY' then //режим работы - предприятия
    begin
      WorkMode := 2;
      actChoice.Caption := 'Предприятия';
      aFind.Visible := False;
      aDate.Visible := True;
      actAdd.Visible := True;
      actAdd.ImageIndex := 3;
      actAdd.Caption := 'Внести';
      actAdd.Hint := 'Внести';
      aBase.Visible := False;
      actDel.Visible := True;
      actHide.Visible := True;
      actOpenMK.Visible := False; // !!! actOpenMK - не используется
      aZakl.Visible := True;
      N5.Visible := True;
      cxSplitter1.Visible := True;
      paControl.Visible := True;
      SetLength(ArrId, 0);
      iArr := 0;
      TV1.DataController.RecordCount := 0;
    end;
  if pFC_SYNONIM = 'FLUORO_VYVERKA_GROUPRISK' then //режим работы - группы риска
    begin
      WorkMode := 3;
    end;
end;

procedure TfrmMain.odsListUchBeforeOpen(DataSet: TDataSet);
begin
  odsListUch.SetVariable('pfk_arealid', dxName.Tag);
end;

procedure TfrmMain.dxNameEnter(Sender: TObject);
begin
	try
		actChoiceExecute(nil);
	except
  end;
end;

procedure TfrmMain.odsListFactoryBeforeOpen(DataSet: TDataSet);
begin
  odsListFactory.SetVariable('PFK_COMPANYID', dxName.Tag);
  odsListFactory.SetVariable('PFK_PERIODID', PeriodId);
end;

procedure TfrmMain.odsListFactoryFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if sDateNeProshli <> '' then
    Accept := dsList.DataSet['PLAN_FLUORO'] < StrToDateTime(sDateNeProshli);
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
  finally
    Ver.Free;
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
                    actOpenMK.Enabled:=True;
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

procedure TfrmMain.TV1FocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  N11.Visible := TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_LAST.Index] = null;
end;

procedure TfrmMain.CheckEnabledButtons;
begin
  actAdd.Enabled := dxName.Tag <> -13;
  actShow.Enabled := dxName.Tag <> -13;
  actEdit.Enabled := dsList.DataSet.RecordCount <> 0;
  actDel.Enabled := dsList.DataSet.RecordCount <> 0;
  actPac.Enabled := dsList.DataSet.RecordCount <> 0;
  actOpenMK.Enabled := dsList.DataSet.RecordCount <> 0;
  actHide.Enabled := dsList.DataSet.RecordCount <> 0;
  actPrint.Enabled := dsList.DataSet.RecordCount <> 0;
  aZakl.Enabled := dsList.DataSet.RecordCount <> 0;
  N5.Enabled := dsList.DataSet.RecordCount <> 0; // проставить всем периодичность
//  N10.Visible := dsList.DataSet.RecordCount <> 0; // добавить дату отсчета ФГ
end;

procedure TfrmMain.cxSplitter1BeforeClose(Sender: TObject;
  var AllowClose: Boolean);
begin
    paControl.Visible := False;
end;

procedure TfrmMain.cxSplitter1BeforeOpen(Sender: TObject; var NewSize: Integer;
  var AllowOpen: Boolean);
begin
  paControl.Visible := True;
end;

procedure TfrmMain.odsListUchAfterOpen(DataSet: TDataSet);
begin
  CheckEnabledButtons;
  SetLength(ArrId, odsListUch.RecordCount);
end;

procedure TfrmMain.odsListUchApplyRecord(Sender: TOracleDataSet; Action: Char;
  var Applied: Boolean; var NewRowId: string);
begin
  Applied := True;
end;

procedure TfrmMain.odsListFactoryAfterOpen(DataSet: TDataSet);
begin
  CheckEnabledButtons;
  SetLength(ArrId, odsListFactory.RecordCount);
end;

procedure TfrmMain.odsListFactoryApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: string);
begin
  Applied := True;
end;

procedure TfrmMain.actSetExecute(Sender: TObject);
var Ver : TJclFileVersionInfo;
begin
  Application.CreateForm(TfrmChoice, frmChoice);
  try
    frmChoice.DoShowForm;
    frmChoice.ShowModal;
    if frmChoice.ModalResult = mrOK then
      begin
        aSms.Visible := False;
        dxEdit.Text := frmChoice.odsList.FieldByName('FC_NAME').AsString;
        actChoice.Enabled := True;
        pFC_SYNONIM := frmChoice.odsList.FieldByName('FC_SYNONIM').AsString;
        DoRateWork;
        Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
        frmMain.Caption := 'ЖУРНАЛ ФЛЮОРОГРАФИИ('+Ver.FileVersion+'). Пользователь: '+sVrachFIO+' '+dxEdit.Text+'.';
        Ver.Free;
        dxName.Text := '';
        dxName.Tag := -13;
        dsList.DataSet.Close;
        aFind.Enabled := True;
        actAdd.Enabled := False;
        actShow.Enabled := False;
        actEdit.Enabled := False;
        actDel.Enabled := False;
        actPac.Enabled := False;
        actOpenMK.Enabled := False;
        actHide.Enabled := False;
        actPrint.Enabled := False;
        aZakl.Enabled := False;
      end;
  finally
    frmChoice.Free;
  end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TV.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TV'+'Vrach'+ '_' + IntToStr(pSOTRID), TRUE, [], 'TV');
  TV1.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TV1Vrach_' + IntToStr(pSOTRID), TRUE, [], 'TV1');  
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  nulldate := '30.12.1899';
  GetSession(os, 'ASU');
  russian:=LoadKeyboardLayout('00000419', 0);
end;

procedure TfrmMain.N11Click(Sender: TObject);
var ods : TOracleDataSet;
    idAmb : Integer;
    idNaz : Integer;
begin
  if TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_PER.Index] = '' then
    begin
      MessageDlg('Внимание!'+#13+#10+
                 'Прежде, чем указать дату отсчета ФГ, сначала необходимо поставить "Периодичность"!'+#13+#10+
                 'Вы можете это сделать, воспользовавшись кнопкой "Изменить".', mtInformation, [mbOK], 0);
      exit;
    end;

  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
// -- ищем взрослую амбулаторную карту
    ods.SQL.Text := ' select t1.fk_id '+#13+
                    '   from asu.tambulance t1, asu.tdocobsl t2 '+#13+
                    '  where t1.fk_peplid = :pfk_peplid '+#13+
                    '    and t1.fk_docobsl = t2.fk_id '+#13+
                    '    and t2.fk_viddocid = asu.doc_ambul ';
    ods.DeclareAndSet('pfk_peplid', otInteger, TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_PEPLID.Index]);
    ods.Open;
    IdAmb := ods.FieldByName('fk_id').AsInteger;
    if ods.RecordCount = 0 then
      begin
        ods.DeleteVariables; // -- ищем детскую амбулаторную карту
        ods.Close;
        ods.SQL.Text := ' select t1.fk_id '+#13+
                        '   from asu.tambulance t1, asu.tdocobsl t2 '+#13+
                        '  where t1.fk_peplid = :pfk_peplid '+#13+
                        '    and t1.fk_docobsl = t2.fk_id '+#13+
                        '    and t2.fk_viddocid = asu.doc_ambdp ';
        ods.DeclareAndSet('pfk_peplid', otInteger, TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_PEPLID.Index]);
        ods.Open;
        IdAmb := ods.FieldByName('fk_id').AsInteger;
        if ods.RecordCount = 0 then
          begin
            MessageDlg('Внимание! '+#13+#10+
                       'У данного человека нет ни одной амбулаторной карты!'+#13+#10+
                       'Вы не можете поставить этому человеку дату отсчета ФГ!', mtWarning, [mbOK], 0);
            exit;
          end;
      end;
    Application.CreateForm(TfrmSetDateFG, frmSetDateFG);
    try
      frmSetDateFG.ShowModal;
      if frmSetDateFG.ModalResult = mrOK then
        begin
          ods.DeleteVariables;
          ods.Close;
          ods.SQL.Text := ' select fk_id from asu.tnazis where fk_pacid = :pfk_pacid and fc_remark = ''Установлена последняя ФГ'' ';
          ods.DeclareAndSet('pfk_pacid', otInteger, idAmb);
          ods.Open;
          idNaz := ods.FieldByName('fk_id').AsInteger;
          if ods.RecordCount = 0 then
            begin
              oqIns.SetVariable('pDate', frmSetDateFG.deDate.Date); // добавляем запись
              oqIns.SetVariable('pPacid', idAmb);
              oqIns.SetVariable('pSotr', pSOTRID);
              oqIns.Execute;
              os.Commit;
              TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_LAST.Index] := DateTimeToStr(frmSetDateFG.deDate.Date);
              ods.DeleteVariables;
              ods.Close;
              ods.SQL.Text := ' select asu.get_plan_fluoro_date(:pfk_peplid) as dateplan from dual ';
              ods.DeclareAndSet('pfk_peplid', otInteger, TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_PEPLID.Index]);
              ods.Open;
              TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_PLAN.Index] := StrToDateTime(ods.FieldByName('dateplan').AsString);
            end else
            begin
              oqUpd.SetVariable('pDate', frmSetDateFG.deDate.Date); // изменяем запись
              oqUpd.SetVariable('pfk_id', idNaz);
              oqUpd.Execute;
              os.Commit;
              TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_LAST.Index] := DateTimeToStr(frmSetDateFG.deDate.Date);
              ods.DeleteVariables;
              ods.Close;
              ods.SQL.Text := ' select asu.get_plan_fluoro_date(:pfk_peplid) as dateplan from dual ';
              ods.DeclareAndSet('pfk_peplid', otInteger, TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_PEPLID.Index]);
              ods.Open;
              TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_PLAN.Index] := StrToDateTime(ods.FieldByName('dateplan').AsString);
            end;
          ods.DeleteVariables;
          ods.Close;
          ods.SQL.Text := ' merge into asu.tlastfluoro using dual on (fk_peplid = :pfk_peplid) '+#13+
                          '   when not matched then '+#13+
                          '     insert(fk_peplid, fd_date) '+#13+
                          '     values(:pfk_peplid, to_date(asu.get_last_fluoro_date(:pfk_peplid, 1), ''dd.mm.yyyy'')) '+#13+
                          '   when matched then '+#13+
                          '     update set fd_date = to_date(asu.get_last_fluoro_date(:pfk_peplid, 1), ''dd.mm.yyyy''), '+#13+
                          '                fc_num = asu.get_last_fluoro_num(:pfk_peplid) '+#13+
                          '      where fk_peplid = :pfk_peplid ';
          ods.DeclareAndSet('pfk_peplid', otInteger, TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_PEPLID.Index]);
          ods.Open;
          frmMain.os.Commit;
        end;
      finally
        frmSetDateFG.Free;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TV');
end;

procedure TfrmMain.N5Click(Sender: TObject);
begin
  Application.CreateForm(TfrmSetPeriodOsm, frmSetPeriodOsm);
  try
    frmSetPeriodOsm.ShowModal;
    if frmSetPeriodOsm.ModalResult = mrOk then
      begin
        if Application.MessageBox('Всем людям в данном предприятии автоматически выставится выбранная периодичность за исключением Т-учета и рентгенположительных! Продолжить?',
                                  'Вопрос', mb_okcancel+mb_iconquestion) = idOK then
          begin
            dsList.DataSet.DisableControls;
            dsList.DataSet.First;
            Application.CreateForm(TfrmProgress, frmProgress);
            try
              frmProgress.Show;
              Application.ProcessMessages;
              frmProgress.FormStyle := fsStayOnTop;
              frmProgress.cxProgressBar1.Position := 0;
              frmProgress.cxProgressBar1.Properties.Max := dsList.DataSet.RecordCount;
              oqSetPeriodOsm.SetVariable('pfk_sotrid', pSOTRID);
              while not dsList.DataSet.Eof do
                begin
                  if (dsList.DataSet.FieldByName('cnttub').AsInteger = 0) and (dsList.DataSet.FieldByName('cntrg').AsInteger = 0) then
                    begin
                      oqSetPeriodOsm.SetVariable('pfk_pacid', dsList.DataSet.FieldByName('peplid').AsInteger);
                      oqSetPeriodOsm.SetVariable('pfk_smid', frmSetPeriodOsm.cxPeriod.EditValue);
                      oqSetPeriodOsm.Execute;
                    end;
                  dsList.DataSet.Next;
                  frmProgress.cxProgressBar1.Position := frmProgress.cxProgressBar1.Position + 1;
                  Application.ProcessMessages;
                end;
              os.Commit;
            finally
              frmProgress.Free;
              dsList.DataSet.EnableControls;
              RefreshQuery(dsList.DataSet);
            end;
          end;
      end;
  finally
    frmSetPeriodOsm.Free;
  end;
end;

procedure TfrmMain.N8Click(Sender: TObject);
var i : Integer;
begin
  Application.CreateForm(TfrmSetPeriodOsm, frmSetPeriodOsm);
  try
    frmSetPeriodOsm.ShowModal;
    if frmSetPeriodOsm.ModalResult = mrOk then
      begin
        if Application.MessageBox('Всем людям на данном участке автоматически выставится выбранная периодичность, кроме тех, у которых периодичность уже стояла, Т-учетников и рентгенположительных ! Продолжить?',
                                  'Вопрос', mb_okcancel+mb_iconquestion) = idOK then
          begin
            Application.CreateForm(TfrmProgress, frmProgress);
            try
              frmProgress.Show;
              Application.ProcessMessages;
              frmProgress.FormStyle := fsStayOnTop;
              frmProgress.cxProgressBar1.Position := 0;
              frmProgress.cxProgressBar1.Properties.Max := TV1.DataController.RecordCount;
              oqSetPeriodOsm.SetVariable('pfk_sotrid', pSOTRID);
              for I := 0 to TV1.DataController.RecordCount - 1 do
                begin
                  if (TV1.DataController.Values[i, V1_PER.Index] = '') and (TV1.DataController.Values[i, V1_TUB.Index] = 0)
                    and (TV1.DataController.Values[i, V1_RGPLUS.Index] = 0) then
                    begin
                      oqSetPeriodOsm.SetVariable('pfk_pacid', TV1.DataController.Values[i, V1_PEPLID.Index]);
                      oqSetPeriodOsm.SetVariable('pfk_smid', frmSetPeriodOsm.cxPeriod.EditValue);
                      oqSetPeriodOsm.Execute;
                      TV1.DataController.Values[i, V1_PER.Index] := frmSetPeriodOsm.cxPeriod.EditText;
                    end;
                  frmProgress.cxProgressBar1.Position := frmProgress.cxProgressBar1.Position + 1;
                  Application.ProcessMessages;
                end;
              os.Commit;
            finally
              frmProgress.Free;
            end;
          end;
      end;
  finally
    frmSetPeriodOsm.Free;
  end;
end;

procedure TfrmMain.N9Click(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := TV1.DataController.Values[TV1.DataController.FocusedRecordIndex, V1_FIO.Index];
end;

procedure TfrmMain.actPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  if WorkMode = 1 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE FROM DUAL ';
        ods.Open;
        GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
      finally
        ods.Free;
      end;
      frxPrintListUch.ShowReport;
    end;
  if WorkMode = 2 then
    begin
      id := dsList.DataSet.FieldByName('FK_ID').AsInteger;
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE FROM DUAL ';
        ods.Open;
        GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
      finally
        ods.Free;
      end;
      frxPrintList.ShowReport;
      dsList.DataSet.Locate('FK_ID', id, []);
    end;
end;

procedure TfrmMain.actCopyFIOExecute(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := ReplaceSubStr(dsList.DataSet.FieldByName('FC_FAM').AsString, '.', '')+' '+
                      copy(dsList.DataSet.FieldByName('FC_IM').AsString, 1, 1)+' '+
                      copy(dsList.DataSet.FieldByName('FC_OTCH').AsString, 1, 1);
end;

procedure TfrmMain.actTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.actWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.actXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.actZaklExecute(Sender: TObject);
begin
	Application.CreateForm(TfrmRepZakl, frmRepZakl);
  try
	  frmRepZakl.ShowModal;
  finally
  	frmRepZakl.Free;
  end;
end;

procedure TfrmMain.aDateExecute(Sender: TObject);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  Application.CreateForm(TfrmDateControl, frmDateControl);
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT DECODE(FD_DATECONTROL, NULL, SYSDATE, FD_DATECONTROL) AS FD_DATECONTROL, '+
                    '        DECODE(FK_SOTRCONTROL, NULL, :PSOTRID, FK_SOTRCONTROL) AS FK_SOTRCONTROL '+
                    '   FROM ASU.TPERIOD_COMPANY WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, CompanyId);
    ods.DeclareAndSet('PSOTRID', otInteger, pSOTRID);
    ods.Open;
    frmDateControl.deControl.Date := ods.FieldByName('FD_DATECONTROL').AsDateTime;
    frmDateControl.lcbControl.EditValue := ods.FieldByName('FK_SOTRCONTROL').AsInteger;
    frmDateControl.ShowModal;
    if frmDateControl.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' UPDATE ASU.TPERIOD_COMPANY '+
                         '    SET FD_DATECONTROL = :PFD_DATECONTROL, FK_SOTRCONTROL = :PFK_SOTRCONTROL '+
                         '  WHERE FK_ID = :PFK_ID ';
          oq.DeclareAndSet('PFK_ID', otInteger, CompanyId);
          oq.DeclareAndSet('PFD_DATECONTROL', otDate, frmDateControl.deControl.Date);
          oq.DeclareAndSet('PFK_SOTRCONTROL', otInteger, frmDateControl.lcbControl.EditValue);
          oq.Execute;
          os.Commit;
          lbDate.Caption := DateToStr(frmDateControl.deControl.Date);
          lbSotr.Caption := frmDateControl.lcbControl.Text;
        finally
          oq.Free;
        end;
      end;
  finally
    ods.Free;
    frmDateControl.Free;
  end;
end;

procedure TfrmMain.aExcelTV1Execute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aFindExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmFindPacUch, frmFindPacUch);
  try
    frmFindPacUch.DoShowfrmFind;
    frmFindPacUch.ShowModal;
  finally
    frmFindPacUch.Free;
  end;
end;

procedure TfrmMain.aJurNewExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmJournalNew, frmJournalNew);
  try
    frmJournalNew.ShowModal;
  finally
    frmJournalNew.Free;
  end;
end;

procedure TfrmMain.aRgPlusExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmJournalRgPlus, frmJournalRgPlus);
  try
    frmJournalRgPlus.ShowModal;
  finally
    frmJournalRgPlus.Free;
  end;
end;

procedure TfrmMain.aSmsExecute(Sender: TObject);
var i : Integer;
begin
  Application.CreateForm(TfrmSpisokSms, frmSpisokSms);
  try
    if WorkMode = 1 then // участки
      begin
        try
        Screen.Cursor := crHourGlass;
        tv1.DataController.GotoFirst;
        for i := 0 to tv1.DataController.GetRowCount-1 do
          begin
            if tv1.DataController.Values[tv1.DataController.FocusedRecordIndex, V1_TUB.Index] = 0 then
              begin
                odsPhone.Close;
                odsPhone.SetVariable('pfk_peplid', tv1.DataController.Values[tv1.DataController.FocusedRecordIndex, V1_PEPLID.Index]);
                odsPhone.Open;
                if (odsPhone.FieldByName('fc_contact').AsString <> '') and (odsPhone.FieldByName('lng').AsInteger = 11) then
                  begin
                    frmSpisokSms.tvSpisok.BeginUpdate;
                    frmSpisokSms.tvSpisok.DataController.RecordCount := frmSpisokSms.tvSpisok.DataController.RecordCount + 1;
                    with frmSpisokSms.tvSpisok.DataController do
                      begin
                        try
                          Values[frmSpisokSms.tvSpisok.DataController.RecordCount - 1, frmSpisokSms.tvSpisok_FIO.Index] := tv1.DataController.Values[tv1.DataController.FocusedRecordIndex, V1_FIO.Index];
                          Values[frmSpisokSms.tvSpisok.DataController.RecordCount - 1, frmSpisokSms.tvSpisok_Last.Index] := tv1.DataController.Values[tv1.DataController.FocusedRecordIndex, V1_LAST.Index];
                          Values[frmSpisokSms.tvSpisok.DataController.RecordCount - 1, frmSpisokSms.tvSpisok_Plan.Index] := tv1.DataController.Values[tv1.DataController.FocusedRecordIndex, V1_PLAN.Index];
                          Values[frmSpisokSms.tvSpisok.DataController.RecordCount - 1, frmSpisokSms.tvSpisok_Phone.Index] := odsPhone.FieldByName('fc_contact').AsString;
                        finally
                          frmSpisokSms.tvSpisok.EndUpdate;
                        end;
                      end;
                  end;
              end;
            tv1.DataController.GotoNext;
          end;
        finally
          Screen.Cursor := crDefault;
        end;
      end;
    if WorkMode = 2 then // предприятия
      begin
        dslist.DataSet.DisableControls;
        dsList.DataSet.First;
        while not dsList.DataSet.Eof do
          begin
            if dsList.DataSet.FieldByName('cnttub').AsInteger = 0 then
              begin
                odsPhone.Close;
                odsPhone.SetVariable('pfk_peplid', dsList.DataSet.FieldByName('PEPLID').AsInteger);
                odsPhone.Open;
                if (odsPhone.FieldByName('fc_contact').AsString <> '') and (odsPhone.FieldByName('lng').AsInteger = 11) then
                  begin
                    frmSpisokSms.tvSpisok.BeginUpdate;
                    frmSpisokSms.tvSpisok.DataController.RecordCount := frmSpisokSms.tvSpisok.DataController.RecordCount + 1;
                    with frmSpisokSms.tvSpisok.DataController do
                      begin
                        try
                          Values[frmSpisokSms.tvSpisok.DataController.RecordCount - 1, frmSpisokSms.tvSpisok_FIO.Index] := dsList.DataSet.FieldByName('fio').AsString;
                          Values[frmSpisokSms.tvSpisok.DataController.RecordCount - 1, frmSpisokSms.tvSpisok_Last.Index] := dsList.DataSet.FieldByName('date_fluoro').AsString;
                          Values[frmSpisokSms.tvSpisok.DataController.RecordCount - 1, frmSpisokSms.tvSpisok_Plan.Index] := dsList.DataSet.FieldByName('plan_fluoro').AsString;
                          Values[frmSpisokSms.tvSpisok.DataController.RecordCount - 1, frmSpisokSms.tvSpisok_Phone.Index] := odsPhone.FieldByName('fc_contact').AsString;
                        finally
                          frmSpisokSms.tvSpisok.EndUpdate;
                        end;
                      end;
                  end;
              end;
            dsList.DataSet.Next;
          end;
        dsList.DataSet.EnableControls;
      end;
    frmSpisokSms.ShowModal;
  finally
    frmSpisokSms.Free;
  end;
end;

procedure TfrmMain.aTextTV1Execute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aWebTV1Execute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXMLTV1Execute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aZaklExecute(Sender: TObject);
var ods : TOracleDataSet;
     idNaz : Integer;
     smname : String;
begin
  Application.CreateForm(TfrmProsmotrZaklFlu, frmProsmotrZaklFlu);
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID, asu.get_smidname(fk_smid) as smidname '+#13+
                    '   FROM ASU.TNAZIS '+#13+
                    '  WHERE asu.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID) = asu.GET_XRAY_FLU '+#13+
                    '    AND TNAZIS.FK_PACID IN (SELECT FK_ID FROM asu.TAMBULANCE WHERE FK_PEPLID = :PFK_PEPLID '+#13+
                    '                             UNION '+#13+
                    '                            SELECT FK_ID FROM asu.TKARTA WHERE FK_PEPLID = :PFK_PEPLID) '+#13+
                    '    AND (TNAZIS.FK_NAZSOSID = asu.GET_VIPNAZ OR TNAZIS.FK_NAZSOSID = asu.GET_PASS_REGISTRATOR) '+#13+
                    ' ORDER BY FK_ID DESC ';
    ods.DeclareAndSet('PFK_PEPLID', otInteger, dsList.DataSet.FieldByName('PEPLID').AsInteger);
    ods.Open;
    idNaz := ods.FieldByName('FK_ID').AsInteger;
    smname := ods.FieldByName('smidname').AsString;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT FK_NAZTYPEID, FK_NAZSOSID, TRUNC(FD_RUN) AS FD_RUN, TRUNC(SYSDATE) AS SYS_DATE, ASU.GET_PASS_REGISTRATOR, '+#13+
                    '        asu.get_ib(tnazis.fk_pacid) as numib, '+#13+
                    '        ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(tnazis.fk_pacid) AS PACAGE, '+#13+
                    '       (SELECT MAX(FC_CHAR) '+#13+
                    '          FROM asu.TIB WHERE FK_PACID = :pFK_ID '+#13+
                    '                         AND FK_SMID = (SELECT MAX(FK_ID) FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER'')) AS FLU_NUM, '+#13+
                    '       (SELECT MAX(FC_CHAR) '+#13+
                    '          FROM asu.TIB WHERE FK_PACID = :pFK_ID '+#13+
                    '                         AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME1'')) AS RESUME1, '+#13+
                    '       (SELECT MAX(FC_CHAR) '+#13+
                    '          FROM asu.TIB WHERE FK_PACID = :pFK_ID '+#13+
                    '                         AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME2'')) AS RESUME2, '+#13+
                    '       (SELECT asu.DO_VRACHFIO(MAX(FN_NUM)) '+#13+
                    '          FROM asu.TIB WHERE FK_PACID = :PFK_ID '+#13+
                    '                         AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH1'')) AS SOTR1, '+#13+
                    '       (SELECT asu.DO_VRACHFIO(MAX(FN_NUM)) '+#13+
                    '          FROM asu.TIB WHERE FK_PACID = :PFK_ID '+#13+
                    '                         AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH2'')) AS SOTR2, '+
                    '       (SELECT MAX(FC_CHAR) '+#13+
                    '          FROM ASU.TIB WHERE FK_PACID = :PFK_ID '+#13+
                    '                         AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME'')) AS RESUME '+
                    '   FROM ASU.TNAZIS WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, idNaz);
    ods.Open;
    frmProsmotrZaklFlu.rowNum.Properties.Value := ods.FieldByName('FLU_NUM').AsString;
    frmProsmotrZaklFlu.merFIOMK.Properties.Editors[0].Value := dsList.DataSet.FieldByName('FIO').AsString;
    frmProsmotrZaklFlu.merFIOMK.Properties.Editors[1].Value := ods.FieldByName('numib').AsString;
    frmProsmotrZaklFlu.merDateAgeSex.Properties.Editors[0].Value := dsList.DataSet.FieldByName('fd_rojd').AsString;
    frmProsmotrZaklFlu.merDateAgeSex.Properties.Editors[1].Value := ods.FieldByName('pacage').AsString;
    frmProsmotrZaklFlu.merDateAgeSex.Properties.Editors[2].Value := dsList.DataSet.FieldByName('sex').AsString;
    frmProsmotrZaklFlu.rowIssl.Properties.Value := smname;
    if ods.FieldByName('FK_NAZSOSID').AsInteger = ods.FieldByName('GET_PASS_REGISTRATOR').AsInteger then
      frmProsmotrZaklFlu.rowZakl1.Properties.Value := ods.FieldByName('RESUME').AsString
    else
      frmProsmotrZaklFlu.rowZakl1.Properties.Value := ods.FieldByName('RESUME1').AsString;
    frmProsmotrZaklFlu.rowZakl2.Properties.Value := ods.FieldByName('RESUME2').AsString;
    frmProsmotrZaklFlu.rowSotr1.Properties.Value := ods.FieldByName('SOTR1').AsString;
    frmProsmotrZaklFlu.rowSotr2.Properties.Value := ods.FieldByName('SOTR2').AsString;

    frmProsmotrZaklFlu.ShowModal;
  finally
    ods.Free;
    frmProsmotrZaklFlu.Free;
  end;
end;

procedure TfrmMain.actXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.frxPrintListGetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'NAME1' then Value := dxEdit.Text;
  if VarName = 'NAME2' then Value := dxName.Text;
  if VarName = 'SYSDATE' then Value := GET_SYSDATE_4REP;
  if VarName = 'KOLVOPAC' then Value := oqThreadUch.RowCount;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.MenuItem13Click(Sender: TObject);
begin
  TV1.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TV1Vrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TV1');
end;

procedure TfrmMain.actOpenMKExecute(Sender: TObject);
var ods : TOracleDataSet;
    AppProcID : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_FIO(:FK_PEPLID) FIOPAC FROM DUAL ';
    ods.DeclareAndSet('FK_PEPLID', otInteger, dsList.DataSet.FieldByName('PEPLID').AsInteger);
    ods.Open;
    if RestoreApplication(ods.FieldByName('FIOPAC').AsString) then Exit;
    SetLength(arFIO,Length(arFIO)+1);
    arFIO[Length(arFIO)-1]:=ods.FieldByName('FIOPAC').AsString;
    actOpenMK.Enabled:=False;
    Application.ProcessMessages;
    tmrCheckApplication.Enabled:=True;
    Screen.Cursor := crSQLWait;

//    AppHandle := WinExecAndWait32(PChar('IBRazdel.exe '+IntToStr(pAPPSOTRID)+' '+IntToStr(dsList.DataSet.FieldByName('FK_ID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1)), 1);
//    GetInputMapAppFromApp(AppHandle);

    AppProcID := AppStart(ExtractFilePath(paramstr(0))+'IBRazdel.exe', IntToStr(dsList.DataSet.FieldByName('FK_ID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1));
    if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
    ShowWait(dsList.DataSet.FieldByName('FK_ID').AsInteger,True);
  finally
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
    ods.SQL.Text := ' SELECT ASU.PKG_SMINI.READSTRING(''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                    '        (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE FC_SYNONIM = ''ISSLED_FLUROGR'') AS GET_ISSL_FLU, '+#13+
                    '        TRUNC(SYSDATE) AS DATESYS, asu.get_xray_mrt, '+#13+
                    '        ASU.GET_LABVIP, ASU.GET_VIPNAZ, ASU.GET_XRAY_FLUKAB, ASU.GET_NAZCANCEL, ASU.GET_NEYAV, '+#13+
                    '        ASU.PKG_SMINI.READSTRING(''CONFIG'', ''DB_NAME'', ''H'') AS DB_NAME, '+#13+
                    '        (SELECT TO_NUMBER(FC_VALUE) FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''FLU_NORMA'') AS GET_NORMA, '+#13+
                    '        (select fk_id from asu.tsmid where fc_synonim = ''ONE_IN_YEAR'') as get_oneinyear, '+#13+
                    '        (select fk_id from asu.tsmid where fc_synonim = ''TWO_IN_YEAR'') as get_twoinyear, '+#13+
                    '        ASU.GET_PROPISKAID '+
                    '   FROM DUAL ';
    ods.Open;
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
    GET_SYSTEMDATE := ods.FieldByName('DATESYS').AsDateTime;
    GET_ISSL_FLU := ods.FieldByName('GET_ISSL_FLU').AsInteger;
    get_vipnaz := ods.FieldByName('GET_VIPNAZ').AsInteger;
    get_labvip := ods.FieldByName('GET_LABVIP').AsInteger;
    get_xray_flukab := ods.FieldByName('GET_XRAY_FLUKAB').AsInteger;
    get_propiskaid := ods.FieldByName('GET_PROPISKAID').AsInteger;
    get_nazcancel := ods.FieldByName('GET_NAZCANCEL').AsInteger;
    get_neyav := ods.FieldByName('GET_NEYAV').AsInteger;
    get_db_name := ods.FieldByName('DB_NAME').AsString;
    get_norma := ods.FieldByName('GET_NORMA').AsInteger;
    get_xray_mrt := ods.FieldByName('get_xray_mrt').AsInteger;
    get_oneinyear := ods.FieldByName('get_oneinyear').AsInteger;
    get_twoinyear := ods.FieldByName('get_twoinyear').AsInteger;

    get_rad_petct := udbTableUtils.tdbutils.GetConstantDef('get_rad_petct',os,-1);
    get_rad_gamma := udbtableutils.tdbutils.getconstantdef('get_rad_gamma',os,-1);

    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT FC_VALUE, FC_KEY FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' ORDER BY FK_ID ';
    ods.Open;
    while not ods.Eof do
      begin
       if ods.FieldByName('fc_key').AsString = 'XRAY_SUMDOZA' then // Эффективная годовая доза
         begin
           get_sum_doza := StrToInt(ods.FieldByName('fc_value').AsString);
         end;
       if ods.FieldByName('fc_key').AsString = 'XRAY_SHOW_ONHAND' then // Показывать "от руки" в форме Отмена
         begin
           get_show_onhand := ods.FieldByName('fc_value').AsString;
         end;
        ods.Next;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.actHideExecute(Sender: TObject);
begin
  ArrId[iArr] := dsList.DataSet.FieldByName('FK_ID').AsInteger;
  iArr := iArr + 1;
  sDateNeProshli := '';
  dsList.DataSet.Edit;
  dsList.DataSet.FieldByName('FL_HIDE').AsInteger := 1;
  dsList.DataSet.Post;
  dsList.DataSet.Filtered := True;
  dsList.DataSet.Filter := 'FL_HIDE <> '+IntToStr(1);
  bHide := True;
  CheckEnabledButtons;
end;

procedure TfrmMain.actJournalExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmJournal, frmJournal);
  try
    frmJournal.ShowModal;
  finally
    frmJournal.Free;
  end;
end;

procedure TfrmMain.odsListUchFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  if sDateNeProshli <> '' then
    Accept := dsList.DataSet['PLAN_FLUORO'] < StrToDateTime(sDateNeProshli);
end;

procedure TfrmMain.oqThreadUchThreadFinished(Sender: TOracleQuery);
begin
  actPac.Enabled := oqThreadUch.RowCount <> 0;
  actPrint.Enabled := True;
  actShow.Enabled := True;
  bbJournal.Enabled := True;
  dxEdit.Enabled := True;
  actSet.Enabled := True;
  actEdit.Enabled := oqThreadUch.RowCount <> 0;
  aBase.Enabled := oqThreadUch.RowCount <> 0;
  dxName.Enabled := True;
  actChoice.Enabled := True;
  actNetFluoro.Enabled := True;
  N11.Visible := oqThreadUch.RowCount <> 0; // добавить дату отсчета ФГ
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.oqThreadUchThreadRecord(Sender: TOracleQuery);
begin
  TV1.BeginUpdate;
  TV1.DataController.RecordCount := TV1.DataController.RecordCount + 1;
  with TV1.DataController do
  begin
    try
      Values[TV1.DataController.RecordCount - 1, V1_ROWNUM.Index] := Sender.Field('ROWNUM');
      Values[TV1.DataController.RecordCount - 1, V1_FK_ID.Index] := Sender.Field('FK_ID');
      Values[TV1.DataController.RecordCount - 1, V1_RGPLUS.Index] := Sender.Field('CNTRG');
      Values[TV1.DataController.RecordCount - 1, V1_TUB.Index] := Sender.Field('CNTTUB');
      Values[TV1.DataController.RecordCount - 1, V1_FIO.Index] := Sender.Field('FIO');
      Values[TV1.DataController.RecordCount - 1, V1_SEX.Index] := Sender.Field('SEX');
      Values[TV1.DataController.RecordCount - 1, V1_DATEROJD.Index] := Sender.Field('FD_ROJD');
      Values[TV1.DataController.RecordCount - 1, V1_KMNS.Index] := Sender.Field('KMNS');
      Values[TV1.DataController.RecordCount - 1, V1_PER.Index] := Sender.Field('PER');
      Values[TV1.DataController.RecordCount - 1, V1_PEPLID.Index] := Sender.Field('PEPLID');
      Values[TV1.DataController.RecordCount - 1, V1_COMPANYNAME.Index] := Sender.Field('COMPANYNAME');
      Values[TV1.DataController.RecordCount - 1, V1_ADR.Index] := Sender.Field('ADR');
      if Sender.Field('date_fluoro') <> StrToDateTime(nulldate) then
        Values[TV1.DataController.RecordCount - 1, V1_LAST.Index] := Sender.Field('date_fluoro');
      if Sender.Field('plan_fluoro') <> '' then
        Values[TV1.DataController.RecordCount - 1, V1_PLAN.Index] := Sender.Field('plan_fluoro');
      Values[TV1.DataController.RecordCount - 1, V1_FAM.Index] := Sender.Field('fc_fam');
      Values[TV1.DataController.RecordCount - 1, V1_IM.Index] := Sender.Field('fc_im');
      Values[TV1.DataController.RecordCount - 1, V1_OTCH.Index] := Sender.Field('fc_otch');
      Values[TV1.DataController.RecordCount - 1, V1_FPSEX.Index] := Sender.Field('fp_sex');
      Values[TV1.DataController.RecordCount - 1, V1_AGE.Index] := Sender.Field('age');
      Values[TV1.DataController.RecordCount - 1, V1_GRA.Index] := Sender.Field('gra');
      dxMemData1.Insert;
      dxMemData1.FieldByName('ROWNUM').AsString := Sender.Field('ROWNUM');
      dxMemData1.FieldByName('FK_ID').AsInteger := Sender.Field('FK_ID');
      dxMemData1.FieldByName('RGPLUS').AsInteger := Sender.Field('CNTRG');
      dxMemData1.FieldByName('TUB').AsInteger := Sender.Field('CNTTUB');
      dxMemData1.FieldByName('FIO').AsString := Sender.Field('FIO');
      dxMemData1.FieldByName('SEX').AsString := Sender.Field('SEX');
      dxMemData1.FieldByName('DATEROJD').AsDateTime := Sender.Field('FD_ROJD');
      dxMemData1.FieldByName('KMNS').AsString := Sender.Field('KMNS');
      dxMemData1.FieldByName('PER').AsString := Sender.Field('PER');
      dxMemData1.FieldByName('PEPLID').AsString := Sender.Field('PEPLID');
      dxMemData1.FieldByName('COMPANYNAME').AsString := Sender.Field('COMPANYNAME');
      dxMemData1.FieldByName('ADR').AsString := Sender.Field('ADR');
      if Sender.Field('date_fluoro') <> StrToDateTime(nulldate) then
        dxMemData1.FieldByName('LAST').AsDateTime := Sender.Field('date_fluoro');
      dxMemData1.FieldByName('PLAN').AsString := Sender.Field('plan_fluoro');
      dxMemData1.FieldByName('AGE').AsInteger := Sender.Field('age');
      dxMemData1.FieldByName('gra').AsString := Sender.Field('gra');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
      TV1.EndUpdate;
    end;
  end;
end;

end.
