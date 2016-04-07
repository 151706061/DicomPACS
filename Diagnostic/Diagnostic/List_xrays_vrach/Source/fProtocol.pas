// !!! В поиске неправильно открываются формы мрт и флююро исследований если находимся в кабинете рентгена
// !!! dotextParametersNaz зачем выборка в первом же датасете из tnazis ??? тоже самое в форме ProtocolN
unit fProtocol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, RVScroll, RichView, RVEdit, ExtCtrls, ActnList, RVTable, CRVData, RVItem,
  Oracle, StdCtrls, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxRadioGroup, cxGroupBox,
  cxGraphics, OracleData, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  DB, cxSpinEdit, cxCheckGroup, cxCustomData, cxStyles, cxTL,
  cxInplaceContainer, cxTLData, cxDBTL, cxCurrencyEdit, jvDBUtils, cxCheckBox,
  cxMemo, cxTimeEdit, DateUtils, cxRichEdit, RVStyle, frxClass, Menus,
  RichViewActions, Clipbrd, cxLookAndFeelPainters, cxButtons, frxDBSet, uPrintType,
  dxBarExtItems, Registry, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, cxClasses, Spellers, ShellAPI, fCryptUtils, uFileUtils, uSignUtils,
  cxButtonEdit, cxVGrid, Makhaon_TLB, ActiveX, ComObj, OleServer, uPrintDocument, OleAuto,
  dxSkinOffice2007Green, dxSpellChecker, frxExportHTML, frxRich, frxOle, frxExportRTF,
  PtblRV, JvExStdCtrls, JvRichEdit, RxRichEd, RVOfficeCnv, frxRichEditor,
  frxDesgn;

type
  TfrmProtocol = class(TForm)
    BM: TdxBarManager;
    al: TActionList;
    bbSave: TdxBarButton;
    aSave: TAction;
    bbCancel: TdxBarButton;
    aCancel: TAction;
    odsSotr: TOracleDataSet;
    dsSotr: TDataSource;
    odsRVData: TOracleDataSet;
    odsRVDataFK_ID: TFloatField;
    odsRVDataFK_PACID: TFloatField;
    odsRVDataFB_BLOB: TBlobField;
    odsRVDataFN_COMPRESS: TFloatField;
    odsRVDataFB_HTML: TBlobField;
    odsRVDataFB_TEXT: TMemoField;
    rvs: TRVStyle;
    bbPrint: TdxBarButton;
    aPrint: TAction;
    bbHistory: TdxBarButton;
    aHistory: TAction;
    pmRveText: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    aOtmetki: TAction;
    bbOtmetki: TdxBarButton;
    pmResume: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    aResume: TAction;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    aSaveTemplate: TAction;
    aLoadTemplate: TAction;
    frxReport1: TfrxReport;
    dxContainerShowOtmetki: TdxBarControlContainerItem;
    odsKudaNapravlen: TOracleDataSet;
    dsKudaNapravlen: TDataSource;
    actPass: TAction;
    bbControlProtocol: TdxBarButton;
    aControlProtocol: TAction;
    frxRepOBTC: TfrxReport;
    frxRepOBTC_4Rentgen: TfrxReport;
    bSnimki: TdxBarButton;
    aSnimki: TAction;
    bbDigPodpis: TdxBarButton;
    acDigitPodpis: TAction;
    aStartEdit: TAction;
    bbStartEdit: TdxBarButton;
    dxBarButton1: TdxBarButton;
    aPodpis: TAction;
    aDelZakl: TAction;
    stRep: TcxStyleRepository;
    Bold: TcxStyle;
    BoldNavy: TcxStyle;
    BMBar2: TdxBar;
    bClear: TdxBarButton;
    bCheck: TdxBarButton;
    bCheckNone: TdxBarButton;
    bCut: TdxBarButton;
    bCopy: TdxBarButton;
    bPaste: TdxBarButton;
    bSaveTemplate: TdxBarButton;
    bLoadTemplate: TdxBarButton;
    bSet: TdxBarButton;
    CtrlOpis: TcxStyle;
    stRed: TcxStyle;
    bbSetQ: TdxBarButton;
    aSetQ: TAction;
    bbSnimokLookInside: TdxBarButton;
    aSnimokLookInside: TAction;
    paTop: TPanel;
    verGr: TcxVerticalGrid;
    merFIOMK: TcxMultiEditorRow;
    merDateAgeSex: TcxMultiEditorRow;
    rowKem: TcxEditorRow;
    rowNumProt: TcxEditorRow;
    rowIssl: TcxEditorRow;
    rowKudaNapravlen: TcxEditorRow;
    rowControl: TcxEditorRow;
    paRigth: TPanel;
    imSign: TImage;
    vgrSys: TcxVerticalGrid;
    rowVyp: TcxEditorRow;
    rowReanim: TcxEditorRow;
    rowUch: TcxEditorRow;
    rowEdit: TcxEditorRow;
    Panel2: TPanel;
    rveText: TRichViewEdit;
    dxBarDockControl2: TdxBarDockControl;
    Panel1: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    paZakl: TPanel;
    lbZakl: TcxLabel;
    bDelZakl: TcxButton;
    bLoadZakl: TcxButton;
    cxTextResume: TcxMemo;
    Panel3: TPanel;
    lbDoza: TcxLabel;
    cxLabel1: TcxLabel;
    cxDoza: TcxCurrencyEdit;
    cxSotr: TcxLookupComboBox;
    cxdeDateProtocol: TcxDateEdit;
    cxteTimeProtocol: TcxTimeEdit;
    lbSpec: TcxLabel;
    cxLabel3: TcxLabel;
    cxLaborant: TcxTextEdit;
    cxTime: TcxMaskEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    lbMZV: TcxLabel;
    cxLabel6: TcxLabel;
    chkOtmetki: TCheckBox;
    rowDoza: TcxEditorRow;
    frxRepNV: TfrxReport;
    frxRepKontrast: TfrxReport;
    rowKontrast: TcxEditorRow;
    bbCMOVE: TdxBarButton;
    aCMOVE: TAction;
    bbInsertPic: TdxBarButton;
    frxRepGamma: TfrxReport;
    frxRepPetct: TfrxReport;
    aInsPic: TAction;
    OpenDialog1: TOpenDialog;
    bbPF: TdxBarButton;
    aPF: TAction;
    paRecom: TPanel;
    cxLabel2: TcxLabel;
    bLoadRSh: TcxButton;
    memRecom: TcxMemo;
    bSaveRSh: TcxButton;
    aPasteImage: TAction;
    bbPasteImage: TdxBarButton;
    OraTSMINI: TOraclePackage;
    SpellChecker1: TSpellChecker;
    dxBarButton2: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dbPrintMenu: TdxBarPopupMenu;
    frxHTMLExport1: TfrxHTMLExport;
    dxBarButton3: TdxBarButton;
    dbTable: TdxBarPopupMenu;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    InsTable: TAction;
    InsRow: TAction;
    InsCol: TAction;
    DelTable: TAction;
    DelRow: TAction;
    DelCol: TAction;
    MergeCells: TAction;
    dxBarButton10: TdxBarButton;
    vGrKontrast: TcxVerticalGrid;
    catKontrast: TcxCategoryRow;
    rowTypeKontrast: TcxEditorRow;
    rowKolvoKontrast: TcxEditorRow;
    rowVvodKontrast: TcxEditorRow;
    rowSpeed: TcxEditorRow;
    rowFIOVrach: TcxEditorRow;
    frxRepSOKB: TfrxReport;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure aHistoryExecute(Sender: TObject);
    procedure rveTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure rveTextPaste(Sender: TCustomRichViewEdit;
      var DoDefault: Boolean);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure aOtmetkiExecute(Sender: TObject);
    procedure aResumeExecute(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure aSaveTemplateExecute(Sender: TObject);
    procedure aLoadTemplateExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actPassExecute(Sender: TObject);
    procedure aControlProtocolExecute(Sender: TObject);
    procedure frxRepOBTCGetValue(const VarName: string; var Value: Variant);
    procedure odsSotrBeforeOpen(DataSet: TDataSet);
    procedure frxRepOBTC_4RentgenGetValue(const VarName: string;
      var Value: Variant);
    procedure rveTextSpellingCheck(Sender: TCustomRichView; const AWord: string;
      StyleNo: Integer; var Misspelled: Boolean);
    procedure aSnimkiExecute(Sender: TObject);
    procedure acDigitPodpisExecute(Sender: TObject);
    procedure aStartEditExecute(Sender: TObject);
    procedure frxReport1BeforePrint(Sender: TfrxReportComponent);
    procedure aPodpisExecute(Sender: TObject);
    procedure aDelZaklExecute(Sender: TObject);
    procedure rowControlEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure bClearClick(Sender: TObject);
    procedure bCheckClick(Sender: TObject);
    procedure bCheckNoneClick(Sender: TObject);
    procedure bCutClick(Sender: TObject);
    procedure bCopyClick(Sender: TObject);
    procedure bPasteClick(Sender: TObject);
    procedure aSetQExecute(Sender: TObject);
    procedure aSnimokLookInsideExecute(Sender: TObject);
    procedure rowKudaNapravlenEditPropertiesChange(Sender: TObject);
    procedure frxRepNVGetValue(const VarName: string; var Value: Variant);
    procedure frxRepNVBeforePrint(Sender: TfrxReportComponent);
    procedure frxRepKontrastBeforePrint(Sender: TfrxReportComponent);
    procedure frxRepKontrastGetValue(const VarName: string; var Value: Variant);
    procedure aCMOVEExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure frxRepGammaBeforePrint(Sender: TfrxReportComponent);
    procedure frxRepGammaGetValue(const VarName: string; var Value: Variant);
    procedure frxRepPetctBeforePrint(Sender: TfrxReportComponent);
    procedure frxRepPetctGetValue(const VarName: string; var Value: Variant);
    procedure aInsPicExecute(Sender: TObject);
    procedure aPFExecute(Sender: TObject);
    procedure cxMemo1PropertiesChange(Sender: TObject);
    procedure bSaveRShClick(Sender: TObject);
    procedure bLoadRShClick(Sender: TObject);
    procedure aPasteImageExecute(Sender: TObject);
    procedure InsTableExecute(Sender: TObject);
    procedure InsRowExecute(Sender: TObject);
    procedure InsColExecute(Sender: TObject);
    procedure DelTableExecute(Sender: TObject);
    procedure DelRowExecute(Sender: TObject);
    procedure DelColExecute(Sender: TObject);
    procedure MergeCellsExecute(Sender: TObject);
    procedure frxRepSOKBBeforePrint(Sender: TfrxReportComponent);
    procedure frxRepSOKBGetValue(const VarName: string; var Value: Variant);
  private
    isRecomChange : Boolean;
//    MWLReceiveDatasets: TList; // список датасетов DICOM
    isWhereGo : Boolean;
    Station : TStation;
    sGuid : String; // fk_risguid GUID исследования от LookInside
    bPass : Boolean;
    sSpecName : String;
    pPACID, pPEPLID, pSMIDID, pNAZID, pAmbul : Integer;
    Russian : HKL;
    FUseDigitalSign: Boolean; // Флаг выставляется если используется цифровая подпись
    FCryptoProUtils: TCryptoProUils;
    FSQLRuleID: Integer;
    FIsSign: Boolean;
    FIsReadOnly: Boolean; // Поставлена ЭЦП
    FSignSotrID: Integer; // SotrID, сотрудника поставившего подпись, если нет, то -1
    FSignDT: TDateTime;
    FSignSotrName: String; // Фамилия и инициалы сотрудника поставившего подпись
    sTypeKontrast, sKolvoKontrast, sVvodKontrast, sRFP, sTypeScan : String;
    nVvedAct : Integer;
    list_xray_vrach_show_zakl : integer;
    procedure DoShowProtocol_4OKBHMAO(pIsOffice:Boolean=False);
    procedure DoShowProtocol_4OBTC(pIsOffice:Boolean=False);
    procedure DoShowProtocol_4SOKB(pIsOffice:Boolean=False);
    procedure DoShowProtocol_4NV(pIsOffice:Boolean=False);
    procedure DoSetEditRights;
    procedure DoShowButtons;
    procedure DoTub;
    procedure DoTextTypeAmbul;
    procedure DoTextTypeStac;
    function DoCheckParameters : Integer;
    procedure CheckEnabledControls;
    procedure DoInsertEditParametersNaz;
    procedure DoTextParametersNaz(nAMBUL : Integer);
    procedure DoPodpis;
    procedure DoTextProtocol;
    procedure DoRgVrach;
    procedure DoControlProtokol;
    procedure DoPass;
    procedure DoSumDoza;
    procedure DoShowProtocol_Gamma(pIsOffice:Boolean=False);
    procedure DoShowProtocol_Petct(pIsOffice:Boolean=False);

    procedure SetIsReadOnly(const aIsReadOnly: Boolean);
    property IsReadOnly: Boolean  read FIsReadOnly write SetIsReadOnly;
    procedure RefreshIsSign(aNazID : Integer);
    function IsNazSignedCryptoPro(aNazID: Integer; var aSotrName: String; var aSotrID: Integer; var aSignDT: TDateTime): Boolean;
    procedure SignedComponentEnabled(aNazID: Integer; aIsSigned: Boolean; aSotrName: String; aSignDT: TDateTime);
    procedure DrowDigSign(aImage: TImage; APrintText: string; aDataTime: TDateTime; ADSCorrect: Boolean);
    function DoSignCryptoPro(): Boolean;
    function IsSotrHasSignCryptoPro(aSotrID: Integer): Boolean;
    procedure DoSetEnabledPodpisClose(value:boolean);
    procedure SetEnableButtonForReadOnly(AEnable:Boolean);

    function CheckClass(ClassID: TGuid) : Boolean;
    procedure DoLog; // логирование
    function DoCheckForHeal(pSMIDID, pSOTRID, pNAZID : Integer) : Integer;
//    procedure DoShowSnimki; // открытие новой формы снимков
    { Private declarations }
  public
    pOWNERID : Integer;
    isResult : Boolean; // есть ли снимки от MultiVox?
    procedure DoShowfrmProtocol(nAmbul, nPACID, nPEPLID : Integer; strIssl : String; nSMIDID : Integer; nNAZID : Integer=0; nREANIM : Integer=0);
  end;

var
  frmProtocol: TfrmProtocol;
const
  SQLRuleTableName = 'asu.tnazis';
  cTmpStrRepl = '##########';

implementation

uses fMain, fAllHistory, fOtmetki, fSetResume, fMedEditorTemplates, uDBTableUtils,
     fOtmetkiFlu, fPass, fControlProtocol, uReportUtils, 
     fShowControlProtokol, fSetQ, uGlobal,
     RVFuncs, fProfFactor, fSaveRSh, fAddEditSh, IniFiles;

{$R *.dfm}

procedure TfrmProtocol.DoSetEditRights;
var ods : TOracleDataSet;
    kolvoParam : Integer;
    kolvoDays : Integer;
begin
  if frmMain.bIsAdmin <> 1 then
    begin
 //     aControlProtocol.Visible := False;        // 1. если пользователь не входит в группу "Администраторы" --имеет специализацию 'зав.отд.'
      aSetQ.Visible := False;
      aDelZakl.Visible := False;
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        if frmMain.nEditDaysOtdel = 0 then
          begin
            ods.SQL.Text := ' SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''KOLVODAYS_EDIT'' ';
            ods.Open;
            kolvoParam := StrToInt(ods.FieldByName('FC_VALUE').AsString);
          end else
          begin
            kolvoParam := frmMain.nEditDaysOtdel;
          end;
        ods.DeleteVariables;
        ods.Close;              
        ods.SQL.Text := ' SELECT ROUND(sysdate - (SELECT MAX(FD_DATE) '+#13+
                        '                           FROM ASU.TPODPISNAZ '+#13+
                        '                          WHERE FK_SOS = ASU.GET_VIPNAZ AND FK_NAZID = :PFK_NAZID)) AS CNT '+#13+
                        '   FROM ASU.TNAZIS WHERE FK_ID = :PFK_NAZID ';
        ods.DeclareAndSet('PFK_NAZID', otInteger, pNAZID);
        ods.Open;
        kolvoDays := ods.FieldByName('CNT').AsInteger;
        if KolvoDays >= kolvoParam then
          begin
            rowEdit.Visible := True;
            rowEdit.Properties.Value := 'Прошло более '+IntToStr(KolvoParam)+' суток! Изменить протокол нельзя! ';
            rowKudaNapravlen.Properties.EditProperties.ReadOnly := True;
            cxdeDateProtocol.Enabled := False;
            cxteTimeProtocol.Enabled := False;
            rveText.Enabled := False;
            cxTextResume.Enabled := False;
            cxDoza.Enabled := False;
            cxTime.Enabled := False;
            cxSotr.Enabled := False;
            aResume.Enabled := False;
            aDelZakl.Enabled := False;
            actPass.Enabled := False;
            aSave.Enabled := False;
            aPodpis.Enabled := False;
            chkOtmetki.Enabled := False;
            aOtmetki.Enabled := False;
            aSaveTemplate.Enabled := False;
            aLoadTemplate.Enabled := False;
            aControlProtocol.Enabled := False;
            aSetQ.Enabled := False;
            aDelZakl.Enabled := False;
            bClear.Enabled := False;
            bCut.Enabled := False;
            bCopy.Enabled := False;
            bPaste.Enabled := False;
            bLoadTemplate.Enabled := False;
            bSaveTemplate.Enabled := False;
          end else
          begin
            rowKudaNapravlen.Properties.EditProperties.ReadOnly := False;
            rowEdit.Visible := False;
            cxdeDateProtocol.Enabled := True;
            cxteTimeProtocol.Enabled := True;
            rveText.Enabled := True;
            cxTextResume.Enabled := True;
            cxDoza.Enabled := True;
            cxTime.Enabled := True;
            cxSotr.Enabled := (frmMain.get_can_change_vrach = 1) or (cxsotr.EditValue = null) or (cxsotr.EditValue = 1) or (cxsotr.Text = '');//True;
            aResume.Enabled := True;
            aDelZakl.Enabled := True;
            actPass.Enabled := True;
            aSave.Enabled := True;
            aPodpis.Enabled := True;
            chkOtmetki.Enabled := True;
            aOtmetki.Enabled := True;
            aSaveTemplate.Enabled := True;
            aLoadTemplate.Enabled := True;
            aControlProtocol.Enabled := True;
            aSetQ.Enabled := True;
            aDelZakl.Enabled := True;
            bClear.Enabled := True;
            bCut.Enabled := True;
            bCopy.Enabled := True;
            bPaste.Enabled := True;
            bLoadTemplate.Enabled := True;
            bSaveTemplate.Enabled := True;
          end;
      finally
        ods.Free;
      end;
    end else
    begin
   //   aControlProtocol.Visible := True;
      aSetQ.Visible := True;
      aDelZakl.Visible := True;
      aDelZakl.Visible := cxTextResume.Visible;
    end;
end;

procedure TfrmProtocol.DoSetEnabledPodpisClose(value: boolean);
begin
  bbSave.Enabled := value;
  aSave.Enabled := value;
  aPodpis.Enabled := value;
  acDigitPodpis.Enabled := value;
  bSnimki.Enabled := value;
  aSnimki.Enabled := value;
  bbOtmetki.Enabled := value;
  bbControlProtocol.Enabled := value;
  bbPrint.Enabled := value;
  aPrint.Enabled := value;
  bbHistory.Enabled := value;
  aHistory.Enabled := value;
  dxContainerShowOtmetki.Enabled := value;
  cxdeDateProtocol.Enabled := value;
  cxteTimeProtocol.Enabled := value;
  cxSotr.Enabled := value or (frmMain.get_can_change_vrach = 1) or (cxsotr.EditValue = null) or (cxsotr.EditValue = 1) or (cxsotr.Text = '');
  cxDoza.Enabled := value;
  cxTime.Enabled := value;
end;

procedure TfrmProtocol.DoShowButtons;
begin
// -- показывать или не показывать кнопку "Зачесть"
  if (list_xray_vrach_show_zakl = 0) and ((frmMain.odsKab.FieldByName('is_flu').AsInteger = 1) or (pOWNERID = frmMain.GET_ISSL_FLU)) then
    begin
      actPass.Visible := False;
      aResume.Visible := False;
      aDelZakl.Visible := False;
    end else
    begin
        if frmMain.show_button_pass <> '' then
          begin
            case StrToInt(frmMain.show_button_pass) of
              -1 : actPass.Visible := True;
               0 : actPass.Visible := False;
            end;
          end else
          begin
            actPass.Visible := False;
          end;
        aResume.Visible := True;
        aDelZakl.Visible := True;
    end;
// -- показывать или не показывать кнопку "снимки"
  aCMOVE.Visible := False;
  if (frmMain.GET_DB_NAME = 'H') or (frmMain.GET_DB_NAME = 'SO') then // если база Ханты ОКБ или Сургут ОКБ - сопряжение с Мультивокс
    begin
      if frmMain.get_dicom_show = '-1' then
        begin
          aSnimki.Visible := isResult = True; // если поле fk_resultid = 1
        end else
        begin
          aSnimki.Visible := False;
        end;
    end else
    begin
      if (frmMain.get_use_cmove = '-1') then
      begin
        aCMOVE.Visible := frmMain.get_use_cmove = '-1'; // Показывать или нет кнопку "Снимки по CMOVE"
       // if aCMOVE.Visible then
          aSnimki.Visible := False;
      end else
      begin
        aSnimki.Visible := frmMain.get_dicom_show = '-1';
      end;
    end;

 //   aSnimki.Visible:=True;


  aInsPic.Visible := frmMain.show_button_inspic = '-1'; // Показывать или нет кнопку "Вставить рисунок"
  aPF.Visible := frmMain.show_button_prof = '-1'; // Показывать или нет кнопку ""
  paRecom.Visible := frmMain.show_recom = '-1'; // Показывать или нет рекомендации
  if paRecom.Visible = False then
    frmProtocol.Height := frmProtocol.Height - paRecom.Height;
end;

procedure TfrmProtocol.DoShowfrmProtocol(nAMBUL, nPACID, nPEPLID : Integer; strIssl : String; nSMIDID : Integer; nNAZID : Integer; nREANIM : Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    Screen.Cursor := crSQLWait;
    isRecomChange := False;
// -- присваиваем константы
    pPACID := nPACID;
    pPEPLID := nPEPLID;
    pSMIDID := nSMIDID;
    pNAZID := nNAZID;
    pAmbul := nAMBUL;
// -- видимые элементы
    rowVyp.Visible := False;
    rowReanim.Visible := False;
    rowUch.Visible := False;
    rowEdit.Visible := False;
    if pOWNERID = 0 then
      begin
        ods.Session := frmMain.os;
        ods.SQL.Text := ' SELECT FK_OWNER FROM ASU.TSMID WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, nSMIDID);
        ods.Open;
        pOWNERID := ods.FieldByName('FK_OWNER').AsInteger;
      end;
    cxDoza.Visible := pOWNERID <> frmMain.GET_XRAY_MRT;  // графа "Доза" не показывается для исследований МРТ
    lbDoza.Visible := cxDoza.Visible;
    lbMZV.Visible := cxDoza.Visible;
// -- куда направлен показываем только для флюорографического кабинета
    rowKudaNapravlen.Visible := pOWNERID = frmMain.GET_ISSL_FLU;
    if list_xray_vrach_show_zakl = 1 then
     paZakl.Visible := true
    else
     paZakl.Visible := pOWNERID <> frmMain.GET_ISSL_FLU;

    if paZakl.Visible = False then
      begin
        frmProtocol.BorderStyle := bsSizeable;
        frmProtocol.Height := frmProtocol.Height - paZakl.height;//640;
        frmProtocol.BorderStyle := bsDialog;
      end;
    rowReanim.Visible := nREANIM = 1;
    aPodpis.Visible := frmMain.get_show_podpis = '-1'; // кнопка "Подпись" показывается в зависимости от настроек

    case nAMBUL of
    0: DoTextTypeStac;  // стационарный
    1: DoTextTypeAmbul; // амбулаторный
    end;
// -- наименование исследования
    rowIssl.Properties.Value := strIssl;
    if pNAZID <> 0 then
      begin
        DoTextParametersNaz(nAMBUL);
      end;
// -- контрастирование
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select count(fk_smid) as cnt from asu.tmk where fk_smid = :pfk_smid ';
    ods.DeclareAndSet('pfk_smid', otInteger, pSMIDID);
    ods.Open;

    if ods.FieldByName('cnt').AsInteger > 0 then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' select '+#13+
                        '        (select asu.get_smidname(fk_smid) '+#13+
                        '           from asu.tib '+#13+
                        '          where fk_pacid = :pfk_pacid '+#13+
                        '            and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''XRAY_TYPEKONTRAST'' connect by prior fk_id = fk_owner)) as typekontrast, '+#13+
                        '        (select asu.get_smidname(fn_num) '+#13+
                        '           from asu.tib '+#13+
                        '          where fk_pacid = :pfk_pacid '+#13+
                        '            and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''KTO_KONTRAST'' connect by prior fk_id = fk_owner)) as FIOkontrast, '+#13+
                        '        (select fn_num '+#13+
                        '           from asu.tib where fk_pacid = :pfk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_KOLVOKONTRAST'')) as kolvo, '+#13+
                        '        (select asu.get_smidname(fk_smid) '+#13+
                        '           from asu.tib '+#13+
                        '          where fk_pacid = :pfk_pacid '+#13+
                        '            and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''XRAY_VVOD'' connect by prior fk_id = fk_owner)) as vvod '+#13+
                        '        ,(select fn_num '+#13+
                        '           from asu.tib '+#13+
                        '          where fk_pacid = :pfk_pacid '+#13+
                        '            and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_SPEEDKONTRAST'')) as speed '+#13+


                        '   from dual ';
        ods.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
        ods.Open;
      {if not ods.eof then
      begin}
        rowTypeKontrast.Properties.Value := ods.FieldByName('typekontrast').AsString;
        rowKolvoKontrast.Properties.Value := FloatToStr(ods.FieldByName('kolvo').AsFloat)+' мл';
        rowVvodKontrast.Properties.Value := ods.FieldByName('vvod').AsString;
        rowSpeed.Properties.Value := FloatToStr(ods.FieldByName('speed').AsFloat)+ ' мл/с';
        rowFIOVrach.Properties.Value := ods.FieldByName('FIOkontrast').AsString;
        vGrKontrast.Visible := True;
      end else
      begin
        rowTypeKontrast.Properties.Value := '';
        rowKolvoKontrast.Properties.Value := '0 мл';
        rowVvodKontrast.Properties.Value := '';
        rowSpeed.Properties.Value := '0 мл/с';
        rowFIOVrach.Properties.Value := '';
        vGrKontrast.Visible := False;
      end;
// -- "поднимаем" все данные
    DoRgVrach;
    DoTextProtocol;
    DoControlProtokol;
    DoShowButtons;
    DoSetEditRights;
    DoTub;
    DoSumDoza;
    isWhereGo := False;
// -- Работа с ЭЦП
    if FUseDigitalSign then
      begin
        bbDigPodpis.Visible := ivAlways;
        aStartEdit.Visible := True;
        RefreshIsSign(pNAZID);
        IsReadOnly := FIsSign;
      end else
      begin
        bbDigPodpis.Visible := ivNever;
        aStartEdit.Visible := False;
      end;
// -- показываем или скрываем панель с сигнальной информацией
    if (rowVyp.Visible = False) and (rowUch.Visible = False) and (rowEdit.Visible = False) and (rowReanim.Visible = False) and
       (rowDoza.Visible = False) and (FUseDigitalSign = False) then
      begin
        paRigth.Visible := False;
      end else
      begin
        paRigth.Visible := True;
      end;
  finally
    ods.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmProtocol.DoShowProtocol_4NV(pIsOffice:Boolean=False);
var ods : TOracleDataSet; 
begin
  rveText.SetSelectionBounds(0, rveText.GetOffsBeforeItem(0), rveText.ItemCount - 1,
    rveText.GetOffsAfterItem(rveText.ItemCount - 1));
  Application.ProcessMessages;

  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select ts_sprav.fc_name from asu.ts_sprav, asu.tsotr where tsotr.fk_spravid = ts_sprav.fk_id and tsotr.fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, cxSotr.EditValue);
    ods.Open;
    sSpecName := ods.FieldByName('fc_name').AsString; // специализация сотрудника
  finally
    ods.Free;
  end;

  frxRepNV.FindObject('Memo9').Visible := pOWNERID <> frmMain.GET_XRAY_MRT; // поле "Доза" в кабинете МРТ не видно !!! а если 2 кабинета

  if (FUseDigitalSign) and (imSign.Visible = True) then
    begin
      frxRepNV.FindObject('Memo17').Visible := True;
      frxRepNV.FindObject('Picture1').Visible := True;
    end else
    begin
      frxRepNV.FindObject('Memo17').Visible := False;
      frxRepNV.FindObject('Picture1').Visible := False;
    end;
  if pIsOffice then
    CmnHeadPartRep( frxRepNV, frxHTMLExport1, nil, rveText, 'Memo8' )
  else
    frxRepNV.ShowReport;
end;

procedure TfrmProtocol.DoShowProtocol_4OBTC(pIsOffice:Boolean=False);
var ods : TOracleDataSet; 
begin
  rveText.SetSelectionBounds(0, rveText.GetOffsBeforeItem(0), rveText.ItemCount - 1,
    rveText.GetOffsAfterItem(rveText.ItemCount - 1));
  Application.ProcessMessages;
  ods := TOracleDataSet.Create(nil);  
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select decode(tsotr.fl_zav_otd, 0, ts_sprav.fc_name, 1, ''Зав. отд. ''||lower(ts_sprav.fc_name)) as fc_name '+#13+
                    '   from asu.ts_sprav, asu.tsotr '+#13+
                    '  where tsotr.fk_spravid = ts_sprav.fk_id and tsotr.fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, cxSotr.EditValue);
    ods.Open;
    sSpecName := ods.FieldByName('fc_name').AsString;
  finally
    ods.Free;
  end;
  if (pOWNERID = frmMain.GET_XRAY_MRT) or (pOWNERID = frmMain.GET_XRAY_KT) then
    begin
      if pOWNERID = frmMain.GET_XRAY_MRT then
        begin
          frxRepOBTC.FindObject('Memo21').Visible := False;
          frxRepOBTC.FindObject('Memo22').Visible := False;
        end else
        begin
          frxRepOBTC.FindObject('Memo21').Visible := True;
          frxRepOBTC.FindObject('Memo22').Visible := True;
        end;

      if (Self.sTypeKontrast <> '') then begin
         frxRepOBTC.FindObject('mKontr').Visible := True;
         frxRepOBTC.FindObject('mKontrValue').Visible := True;
      end else begin
         frxRepOBTC.FindObject('mKontr').Visible := False;
         frxRepOBTC.FindObject('mKontrValue').Visible := False;
      end;

      if (Self.sKolvoKontrast <> '') and (Self.sKolvoKontrast <> ' мл') and (Self.sKolvoKontrast <> '0 мл') then begin
         frxRepOBTC.FindObject('mKontrKolvo').Visible := True;
         frxRepOBTC.FindObject('mKontrKolvoValue').Visible := True;
      end else begin
         frxRepOBTC.FindObject('mKontrKolvo').Visible := False;
         frxRepOBTC.FindObject('mKontrKolvoValue').Visible := False;
      end;


      if pIsOffice then
        CmnHeadPartRep( frxRepOBTC, frxHTMLExport1, nil, rveText, 'Memo8' )
      else
        frxRepOBTC.ShowReport;
    end else
    begin
      if pIsOffice then
        CmnHeadPartRep( frxRepOBTC_4Rentgen, frxHTMLExport1, nil, rveText, 'Memo8' )
      else
        frxRepOBTC_4Rentgen.ShowReport;
    end;
end;

procedure TfrmProtocol.DoShowProtocol_4OKBHMAO(pIsOffice:Boolean=False);
var ods : TOracleDataSet;
begin
  rveText.SetSelectionBounds(0, rveText.GetOffsBeforeItem(0), rveText.ItemCount - 1,
    rveText.GetOffsAfterItem(rveText.ItemCount - 1));
  Application.ProcessMessages;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select ts_sprav.fc_name from asu.ts_sprav, asu.tsotr where tsotr.fk_spravid = ts_sprav.fk_id and tsotr.fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, cxSotr.EditValue);
    ods.Open;
    sSpecName := ods.FieldByName('fc_name').AsString;
  finally
    ods.Free;
  end;
  if rowKontrast.Visible = True then // - с контрастом
    begin
      frxReport1.FindObject('Memo9').Visible := pOWNERID <> frmMain.GET_XRAY_MRT;
      frxRepKontrast.FindObject('Memo17').Visible := (FUseDigitalSign) and (imSign.Visible = True);
      if pIsOffice then      
        CmnHeadPartRep( frxRepKontrast, frxHTMLExport1, nil, rveText, 'Memo8' )
      else
        frxRepKontrast.ShowReport;
    end else
    begin // - без контраста
      frxReport1.FindObject('Memo9').Visible := pOWNERID <> frmMain.GET_XRAY_MRT;
      frxReport1.FindObject('Memo17').Visible := (FUseDigitalSign) and (imSign.Visible = True);
      if pIsOffice then
        CmnHeadPartRep( frxReport1, frxHTMLExport1, nil, rveText, 'Memo8' )
      else
        frxReport1.ShowReport;
    end;
end;

procedure TfrmProtocol.DoShowProtocol_4SOKB(pIsOffice:Boolean=False);
var ods : TOracleDataSet;
    vWord : TfrxOLEView;
    vFileNameTmp : string;
    ItemNo, i : Integer;
    vStream : TMemoryStream;
const cBR = 5;
begin
  rveText.SetFocus;
  rveText.SetSelectionBounds(0, rveText.GetOffsBeforeItem(0), rveText.ItemCount - 1,
    rveText.GetOffsAfterItem(rveText.ItemCount - 1));
  Application.ProcessMessages;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select ts_sprav.fc_name from asu.ts_sprav, asu.tsotr where tsotr.fk_spravid = ts_sprav.fk_id and tsotr.fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, cxSotr.EditValue);
    ods.Open;
    sSpecName := ods.FieldByName('fc_name').AsString;
  finally
    ods.Free;
  end;
  frxRepSOKB.FindObject('Memo9').Visible := pOWNERID <> frmMain.GET_XRAY_MRT;
  if (FUseDigitalSign) and (imSign.Visible = True) then
    frxRepSOKB.FindObject('Memo17').Visible := True
  else
    frxRepSOKB.FindObject('Memo17').Visible := False;

  if  length(trim(rowTypeKontrast.Properties.Value))<1 then
   begin
    frxRepSOKB.FindObject('Memo22').Visible := False;
   end;
   if (cxTextResume.Text = '') then
   begin
     frxRepSOKB.FindObject('Memo16').Visible := False;
     frxRepSOKB.FindObject('Memo18').Visible := False;
   end;
   if (memRecom.Text = '') then
   begin
     frxRepSOKB.FindObject('Memo20').Visible := False;
     frxRepSOKB.FindObject('Memo21').Visible := False;
   end;

    vStream := TMemoryStream.Create;
    rveText.SaveRTFToStream(vStream, False);
    vStream.Position:=0;
    try
      if ((rveText.LineCount>39) and (rveText.LineCount<39+cBR)) then
      begin
        ItemNo := rveText.ItemCount-cBR;
        rveText.SetSelectionBounds(ItemNo, rveText.GetOffsBeforeItem(ItemNo),
          ItemNo, rveText.GetOffsBeforeItem(ItemNo));
        for I := 1 to cBR do
          rveText.InsertText(#10);
        rveText.Invalidate;
      end;

      if pIsOffice then
        CmnHeadPartRep( frxRepSOKB, frxHTMLExport1, nil, rveText, 'Memo8' )
      else
      begin
        CmnHeadPartRep( frxRepSOKB, frxHTMLExport1, nil, rveText, 'Memo8', True );
      end;
    finally
      rveText.Clear;
      rveText.LoadRTFFromStream(vStream);
      rveText.Format;
      vStream.Free;
    end;
  //  frxRepSOKB.ShowReport;
end;

procedure TfrmProtocol.DoShowProtocol_Gamma(pIsOffice:Boolean=False);
var ods : TOracleDataSet;
begin
  rveText.SetSelectionBounds(0, rveText.GetOffsBeforeItem(0), rveText.ItemCount - 1,
    rveText.GetOffsAfterItem(rveText.ItemCount - 1));
  Application.ProcessMessages;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select ts_sprav.fc_name from asu.ts_sprav, asu.tsotr where tsotr.fk_spravid = ts_sprav.fk_id and tsotr.fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, cxSotr.EditValue);
    ods.Open;
    sSpecName := ods.FieldByName('fc_name').AsString;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select asu.get_smidname(fk_smid) as fc_name from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and Fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''RADIO_RFP'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
    ods.Open;
    sRFP := ods.FieldByName('fc_name').AsString;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fn_num from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''RADIO_VVEDENO'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
    ods.Open;
    nVvedAct := ods.FieldByName('fn_num').AsInteger;
  finally
    ods.Free;
  end;
  frxRepGamma.FindObject('Memo17').Visible := (FUseDigitalSign) and (imSign.Visible = True);
  if pIsOffice then
    CmnHeadPartRep( frxRepGamma, frxHTMLExport1, nil, rveText, 'Memo8' )
  else
    frxRepGamma.ShowReport;
end;

procedure TfrmProtocol.DoShowProtocol_Petct(pIsOffice:Boolean=False);
var ods : TOracleDataSet;
begin
  rveText.SetSelectionBounds(0, rveText.GetOffsBeforeItem(0), rveText.ItemCount - 1,
    rveText.GetOffsAfterItem(rveText.ItemCount - 1));
  Application.ProcessMessages;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select ts_sprav.fc_name from asu.ts_sprav, asu.tsotr where tsotr.fk_spravid = ts_sprav.fk_id and tsotr.fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, cxSotr.EditValue);
    ods.Open;
    sSpecName := ods.FieldByName('fc_name').AsString;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select asu.get_smidname(fk_smid) as fc_name from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and Fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''RADIO_RFP'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
    ods.Open;
    sRFP := ods.FieldByName('fc_name').AsString;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fn_num from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''RADIO_VVEDENO'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
    ods.Open;
    nVvedAct := ods.FieldByName('fn_num').AsInteger;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select asu.get_smidname(fk_smid) as fc_name from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''RADIO_TYPESCAN'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
    ods.Open;
    sTypeScan := ods.FieldByName('fc_name').AsString;
  finally
    ods.Free;
  end;
  frxRepPetct.FindObject('Memo17').Visible := (FUseDigitalSign) and (imSign.Visible = True);
  if pIsOffice then
    CmnHeadPartRep( frxRepPetct, frxHTMLExport1, nil, rveText, 'Memo8' )
  else
    frxRepPetct.ShowReport;
end;

function TfrmProtocol.DoSignCryptoPro: Boolean;
var vSQLRuleID: Integer;
begin
  vSQLRuleID := FCryptoProUtils.GetRuleIdByTablename(SQLRuleTableName);
  Result := FCryptoProUtils.SignBySotr(vSQLRuleID, pNAZID, frmMain.pSOTRID) > 0;
end;

procedure TfrmProtocol.DoSumDoza;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' select sum(t1.fn_num) as SumDoza '+#13+
                    '   from asu.tib t1, asu.vnaz t2 '+#13+
                    '  where t1.fk_pacid = t2.fk_id '+#13+
                    '    and t1.fk_smid = -1 '+#13+
                    '    and t1.fk_smeditid = -1 '+#13+
                    '    and t2.fk_pacid in (select fk_id from asu.tambulance where fk_peplid = asu.get_peplid(:pfk_pacid) '+#13+
                    '                        union all '+#13+
                    '                        select fk_id from asu.tkarta where fk_peplid = asu.get_peplid(:pfk_pacid)) '+#13+
                    '    and t2.fk_nazsosid in (asu.get_vipnaz, asu.get_labvip) '+#13+
                    '    and t2.fd_run >= add_months(sysdate, -12) '+#13+ //to_date(to_char(sysdate, ''dd.mm'')||to_char(extract(year from sysdate)-1),''dd.mm.yyyy'') '+#13+
                    '    and t2.fd_run < to_date(sysdate)+1 ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pPacID);
    ods.Open;
    if ods.FieldByName('SumDoza').AsFloat > frmMain.get_sum_doza then
      begin
        rowDoza.Visible := True;
        rowDoza.Properties.Value := FloatToStr(ods.FieldByName('SumDoza').AsFloat)+' мЗв';
      end else
      begin
        rowDoza.Visible := False;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmProtocol.DoTextTypeAmbul;
var ods : TOracleDataSet;
begin
  CheckEnabledControls;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT TAMBULANCE.FC_FAM, TAMBULANCE.FC_IM, TAMBULANCE.FC_OTCH, '+#13+
			              '        DECODE(TO_CHAR(TAMBULANCE.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), TAMBULANCE.FD_ROJD) FD_ROJD, '+#13+
              			'        decode(TAMBULANCE.FP_SEX, 1, ''Мужской'', 0, ''Женский'') as sex, '+#13+
                    '        ASU.GET_IB(:PFK_ID) AS NUMDOC, '+#13+
                    '        ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TAMBULANCE.FK_ID) AS PACAGE '+#13+
                    '   FROM ASU.TAMBULANCE '+#13+
                    '  WHERE TAMBULANCE.FK_ID=:PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pPACID);
    ods.Open;
    merFIOMK.Properties.Editors[0].Value := ods.FieldByName('FC_FAM').AsString+' '+ods.FieldByName('FC_IM').AsString+' '+ods.FieldByName('FC_OTCH').AsString;
    merFIOMK.Properties.Editors[1].Value := ods.FieldByName('NUMDOC').AsString;
    merDateAgeSex.Properties.Editors[0].Value := DateTimeToStr(ods.FieldByName('FD_ROJD').AsDateTime);
    merDateAgeSex.Properties.Editors[1].Value := IntToStr(ods.FieldByName('PACAGE').AsInteger);
    merDateAgeSex.Properties.Editors[2].Value := ods.FieldByName('SEX').AsString;
  finally
    ods.Free;
  end;  
end;

procedure TfrmProtocol.aSaveExecute(Sender: TObject);
begin
  if FIsSign then
    begin
      if Application.MessageBox('Этот документ защищён цифровой подписью. Чтобы сохранить изменения необходимо поставить новую цифровую подпись, перейти к добавлению цифровой подписи?',
        'Вопрос', MB_YESNO + MB_ICONQUESTION) = mrYes
        then
          acDigitPodpis.Execute;
    end else
    begin
      try
        Cursor := crSQLWait;
        if DoCheckParameters = 0 then
          exit;
        DoInsertEditParametersNaz;
        if aPodpis.Visible = False then // подписываем при условии, что кнопка "Подпись" не видна
          begin
            DoPodpis;
            DoLog;
          end;
        if frmMain.get_db_name <> 'SO' then ModalResult := MrOK;
      finally
        Cursor := crDefault;
      end;
    end;
end;

procedure TfrmProtocol.aCancelExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmProtocol.FormCreate(Sender: TObject);
var ods : TOracleDataSet;
begin
  list_xray_vrach_show_zakl := TDBUtils.GetConstantDef('list_xray_vrach_show_zakl',frmmain.os,0);

//  MWLReceiveDatasets := TList.Create;
  aControlProtocol.Visible := (DO_CHECK_OBJECT_ACCESS(frmMain.os, frmMain.pAPPSOTRID, aControlProtocol.Owner.Name + '.' + aControlProtocol.Name) > 0);
//-->> если выставлена настройка об использовании цифровой подписи
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION=''CONFIG'' AND FC_KEY=''USE_DIGITSUBSCRIBE'' ';
    ods.Open;
    FUseDigitalSign := ods.FieldByName('FC_VALUE').AsString = '1';

    if not FUseDigitalSign then
      FCryptoProUtils := nil
    else begin
      FCryptoProUtils := TCryptoProUils.Create(frmMain.os);
      FSQLRuleID := FCryptoProUtils.GetRuleIdByTablename(SQLRuleTableName);
      if FSQLRuleID <= 0 then
        begin
          Application.MessageBox(
          'Не удалось найти правила работы с цифровой подписью. Функции работы с цифровой подписью не доступны. Обратитесь к администратору',
          'Внимание!', MB_OK + MB_ICONWARNING);
          TFileUtils.LogException('PriemDll.log', 'Не удалось найти правила работы с цифровой подписью для таблицы ' + SQLRuleTableName);
          FreeAndNil(FCryptoProUtils);
          FUseDigitalSign := false;
        end;
    end;
  finally
    ods.Free;
  end;
  pOWNERID := 0;
  russian:=LoadKeyboardLayout('00000419', 0);
  try
    if odsKudaNapravlen.Active = False then
      odsKudaNapravlen.Active := True;
  except
    on e:Exception do
    begin
      MessageDlg('ERROR : '+E.Message, mtError, [mbOK], 0);
    end;
  end;
  try
    if odsSotr.Active = False then
      odsSotr.Active := True;
  except
    on e:Exception do
    begin
      MessageDlg('ERROR : '+E.Message, mtError, [mbOK], 0);
    end;
  end;
//  if odsRVData.Active = False then
//    odsRVData.Active := True;
end;

procedure TfrmProtocol.FormDestroy(Sender: TObject);
var i: Integer;
begin
 { for i := 0 to MWLReceiveDatasets.Count - 1 do
    TDicomAttributes(MWLReceiveDatasets[i]).Free;

  MWLReceiveDatasets.Free; }
end;

function TfrmProtocol.DoCheckForHeal(pSMIDID, pSOTRID, pNAZID: Integer): Integer;
var hHandle:THandle;
    InitPlugin:function (AppHandle: THandle; nSMID : Integer; nSOTRID : Integer; nNAZID : Integer): LongInt; stdcall;
begin
  Result := -1;
  hHandle := LoadLibrary(PAnsiChar(ExtractFilePath(ParamStr(0)) + 'Set_Usluga.DLL'));
  if hHandle >HINSTANCE_ERROR  then
    begin
      try
        @InitPlugin := GetProcAddress(hHandle, 'InitPluginPriemWithHandle');
        if @InitPlugin <> nil then
          Result := InitPlugin(Application.Handle, pSMIDID, frmMain.pSOTRID, pNAZID);
      finally
        FreeLibrary(hHandle);
      end;
    end;
end;

function TfrmProtocol.DoCheckParameters : Integer;
var ods : TOracleDataSet;
begin
  if cxdeDateProtocol.Text = '' then
    begin
      Application.MessageBox('Вам необходимо указать ДАТУ проведения исследования!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxdeDateProtocol.SetFocus;
      Result:= 0;
      exit;
    end;

  if frmMain.get_kolvo_raspred <> 0 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select sysdate + :pkolvo as farday from dual ';
        ods.DeclareAndSet('pkolvo', otInteger, frmMain.get_kolvo_raspred);
        ods.Open;
        if cxdeDateProtocol.Date > ods.FieldByName('farday').AsDateTime then
          begin
            MessageDlg('Внимание!'+#13+#10+
                       'Вы не можете распределить исследование на эту дату!'+#13+#10+
                       'Выберите дату меньше '+DateTimeToStr(ods.FieldByName('farday').AsDateTime)+'!', mtInformation, [mbOK], 0);
            Result:= 0;
            cxdeDateProtocol.SetFocus;
            exit;
          end;
      finally
        ods.Free;
      end;
    end;

  Result := 1;  
end;

procedure TfrmProtocol.DoControlProtokol;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' select count(*) as cnt from asu.vnaz where fk_nazowner = :pfk_nazowner and fc_name = ''Контрольное описание'' ';
    ods.DeclareAndSet('pfk_nazowner', otInteger, pNAZID);
    ods.Open;
    if ods.FieldByName('cnt').AsInteger > 0 then
      begin
        rowControl.Properties.Value := 'У данного протокола имеется контрольное описание!';
        rowControl.Visible := True;
      end else
      begin
        rowControl.Visible := False;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmProtocol.DoTextTypeStac;
var ods : TOracleDataSet;
begin
  CheckEnabledControls;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT TKARTA.FC_FAM, TKARTA.FC_IM, TKARTA.FC_OTCH, '+#13+
  									'        DECODE(TO_CHAR(TKARTA.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), TKARTA.FD_ROJD) FD_ROJD, '+#13+
	  								'        decode(TKARTA.FP_SEX, 1, ''Мужской'', 0, ''Женский'') as sex, '+#13+
                    '        ASU.GET_IB(:PFK_ID) AS NUMDOC, '+#13+
                    '        TKARTA.FP_TEK_COC, '+#13+
                    '        ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TKARTA.FK_ID) AS PACAGE '+#13+
                    '   FROM ASU.TKARTA '+#13+
                    '  WHERE TKARTA.FK_ID=:PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pPACID);
    ods.Open;
    merFIOMK.Properties.Editors[0].Value := ods.FieldByName('FC_FAM').AsString+' '+ods.FieldByName('FC_IM').AsString+' '+ods.FieldByName('FC_OTCH').AsString;
    merFIOMK.Properties.Editors[1].Value := ods.FieldByName('NUMDOC').AsString;
    merDateAgeSex.Properties.Editors[0].Value := DateTimeToStr(ods.FieldByName('FD_ROJD').AsDateTime);
    merDateAgeSex.Properties.Editors[1].Value := IntToStr(ods.FieldByName('PACAGE').AsInteger);
    merDateAgeSex.Properties.Editors[2].Value := ods.FieldByName('SEX').AsString;
    rowVyp.Visible := ods.FieldByName('FP_TEK_COC').AsInteger = 3;
    rowVyp.Properties.Value := 'Выписан!';
  finally
    ods.Free;
  end;
end;

procedure TfrmProtocol.DoTub;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT NAZ.FK_ID, TUB.FN_COUNTYEAR, TUB.FD_END, ASU.GET_SMIDNAME(TUB.FK_PERIODID_REC) AS REC '+
                    '   FROM ASU.TNAZIS NAZ, ASU.TTUBPARAM TUB '+
                    '  WHERE NAZ.FK_SMID = ASU.GET_XRAY_TUBDISPANCER '+
                    '    AND NAZ.FK_PACID = ASU.GET_PEPLID(:PFK_PACID) '+
                    '    AND NAZ.FK_ID = TUB.FK_NAZID '+
                    '    AND SYSDATE >= TUB.FD_BEGIN '+
                    '    AND SYSDATE < TUB.FD_END+1 '+
                    ' ORDER BY NAZ.FK_ID ASC ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.Open;
    ods.Last;
    if ods.RecordCount > 0 then
      begin
        rowUch.Visible := True;
        rowUch.Properties.Value := 'На учете в тубдиспансере. '+'Периодичность: '+ods.FieldByName('REC').AsString+
                                   ' до '+DateTimeToStr(ods.FieldByName('FD_END').AsDateTime);
      end else
      begin
        rowUch.Visible := False;
      end;
  finally
    ods.Free;
  end;
end;

function TfrmProtocol.CheckClass(ClassID: TGuid): Boolean;
var Res: HResult;
begin
  Result := CoCreateInstance(ClassID, nil, CLSCTX_INPROC_SERVER or CLSCTX_LOCAL_SERVER, IUnknown, Res) = S_OK;
end;

procedure TfrmProtocol.CheckEnabledControls;
begin
//
end;

procedure TfrmProtocol.cxMemo1PropertiesChange(Sender: TObject);
begin
  isRecomChange := True;
end;

procedure TfrmProtocol.DoInsertEditParametersNaz;
var oqNaz, oq : TOracleQuery;
    ods : TOracleDataSet;
    memStream, memStream1 : TMemoryStream;
begin
  oqNaz := TOracleQuery.Create(nil);
  ods := TOracleDataSet.Create(nil);
  try
    oqNaz.Session := frmMain.os;
    ods.Session := frmMain.os;
//--- Рекомендации
  if isRecomChange = True then
    begin
      ods.DeleteVariables;
      ods.Close;
      ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13#10+
                      '  USING DUAL ON (FK_PACID = :PFK_PACID '+#13#10+
                      '                 AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_PROTOCOL_RECOM'')) '+#13#10+
                      ' WHEN MATCHED THEN UPDATE SET FC_CHAR = :PFC_CHAR '+#13#10+
                      '                    WHERE FK_PACID = :PFK_PACID '+#13#10+
                      '                      AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_PROTOCOL_RECOM'') '+#13#10+
                      ' WHEN NOT MATCHED THEN INSERT(FC_CHAR, FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13#10+
                      '                       VALUES(:PFC_CHAR, :pFK_PACID, '+#13#10+
                      '                              (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_PROTOCOL_RECOM''), '+#13#10+
                      '                              (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_PROTOCOL_RECOM''), :pFK_VRACHID) ';
      ods.DeclareAndSet('PFC_CHAR', otString, memRecom.Text);
      ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
      ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
      ods.Open;
      frmMain.os.Commit;
    end;
//---доза
    if (cxDoza.Visible) and (cxDoza.Text <> '') and (cxDoza.Text <> '0') then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13+
                        '  USING DUAL ON (FK_PACID = :PFK_PACID AND FK_SMID = :PFK_SMID AND FK_SMEDITID = :PFK_SMEDITID) '+#13+
                        ' WHEN MATCHED THEN UPDATE SET FN_NUM = :PFN_NUM, FK_VRACHID = :PFK_VRACHID '+#13+
                        '                    WHERE FK_PACID = :PFK_PACID AND FK_SMID = :PFK_SMID AND FK_SMEDITID = :PFK_SMEDITID '+#13+
                        ' WHEN NOT MATCHED THEN INSERT(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                        '                       VALUES(:PFK_PACID, :PFN_NUM, :PFK_SMID, :PFK_SMEDITID, :PFK_VRACHID) ';
        ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
        ods.DeclareAndSet('PFN_NUM', otFloat, StrToFloat(cxDoza.Text));
        ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
        ods.DeclareAndSet('PFK_SMID', otInteger, -1);
        ods.DeclareAndSet('PFK_SMEDITID', otInteger, -1);
        ods.Open;
        frmMain.os.Commit;
      end;
//--- время
    if (cxTime.Text <> '') and (cxTime.Text <> '0') then 
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13+
                        '  USING DUAL ON (FK_PACID = :PFK_PACID AND FK_SMID = :PFK_SMID AND FK_SMEDITID = :PFK_SMEDITID) '+#13+
                        ' WHEN MATCHED THEN UPDATE SET FN_NUM = :PFN_NUM, FK_VRACHID = :PFK_VRACHID '+#13+
                        '                    WHERE FK_PACID = :PFK_PACID AND FK_SMID = :PFK_SMID AND FK_SMEDITID = :PFK_SMEDITID '+#13+
                        ' WHEN NOT MATCHED THEN INSERT(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                        '                       VALUES(:PFK_PACID, :PFN_NUM, :PFK_SMID, :PFK_SMEDITID, :PFK_VRACHID) ';
        ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
        ods.DeclareAndSet('PFN_NUM', otFloat, StrToFloat(cxTime.Text));
        ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
        ods.DeclareAndSet('PFK_SMID', otInteger, -2);
        ods.DeclareAndSet('PFK_SMEDITID', otInteger, -2);
        ods.Open;
        frmMain.os.Commit;
      end;
//--- Врач
    if cxSotr.Text <> '' then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13+
                        '  USING DUAL ON (FK_PACID = :PFK_PACID AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''RG_VRACH'')) '+#13+
                        ' WHEN MATCHED THEN UPDATE SET FN_NUM = :PFN_NUM, FK_VRACHID = :PFK_VRACHID '+#13+
                        '                    WHERE FK_PACID = :PFK_PACID '+#13+
                        '                      AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''RG_VRACH'') '+#13+
                        ' WHEN NOT MATCHED THEN INSERT(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                        '                       VALUES(:PFK_PACID, :PFN_NUM, (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''RG_VRACH''), '+#13+
                        '                                                    (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''RG_VRACH''), :PFK_VRACHID) ';
        ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
        ods.DeclareAndSet('PFN_NUM', otInteger, cxSotr.EditValue);
        ods.DeclareAndSet('PFK_VRACHID', otInteger, frmMain.pSOTRID);
        ods.Open;
        frmMain.os.Commit;
      end;
//--- Заключение
      if cxTextResume.Text <> '' then //Заключение //если хотим сохранить пустой текст !!! не вариант!
        begin
	        if cxTextResume.Tag = 0 then
            begin
	            oqNaz.DeleteVariables;
	            oqNaz.SQL.Text := ' DECLARE '+#13+
	      			                  '   nSMID21 NUMBER; '+#13+
	      			                  '   Cnt21 NUMBER; '+#13+
	      			                  ' BEGIN '+#13+
	      			                  '   SELECT COUNT(FK_ID) INTO Cnt21 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''); '+#13+
	      			                  ' IF Cnt21 > 0 THEN '+#13+
	      		                    '   UPDATE TIB SET FC_CHAR = :pFC_CHAR21, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''); '+#13+
			      	                  ' ELSE '+#13+
			      	                  '   SELECT FK_ID INTO nSMID21 FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''; '+#13+
				                        '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :PFC_CHAR21, nSMID21, nSMID21, :pFK_VRACHID); '+#13+
				                        ' END IF; '+#13+
				                        ' END; ';
              oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID);
	            oqNaz.DeclareAndSet('pFC_CHAR21', otString, cxTextResume.Text);
	            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
	            oqNaz.Execute;
	            frmMain.os.Commit;
	    end else
	    begin
	      oqNaz.DeleteVariables;
	      oqNaz.SQL.Text := ' DECLARE '+#13+
	                  			'   nSMID21 NUMBER; '+#13+
				                  '   Cnt21 NUMBER; '+#13+
				                  ' BEGIN '+#13+
				                  '   SELECT COUNT(FK_ID) INTO Cnt21 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''); '+#13+
			                  	' IF Cnt21 > 0 THEN '+#13+
		                  		'   UPDATE TIB SET FC_CHAR = :pFC_CHAR21, FK_BID = :PFK_BID21, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''); '+#13+
			                  	' ELSE '+#13+
			                   	'   SELECT FK_ID INTO nSMID21 FROM TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''; '+#13+
			                   	'   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_BID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :PFC_CHAR21, :PFK_BID21, nSMID21, nSMID21, :pFK_VRACHID); '+#13+
			                  	' END IF; '+#13+
			                  	' END; ';
        oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID);
	      oqNaz.DeclareAndSet('pFC_CHAR21', otString, cxTextResume.Text);
        oqNaz.DeclareAndSet('pFK_BID21', otInteger, cxTextResume.Tag); 
	      oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
	      oqNaz.Execute;
	      frmMain.os.Commit;
	    end;
	end;
//--- Куда направлен
  if (rowKudaNapravlen.Visible <> False) and (isWhereGo = True) then
	  begin
      if (rowKudaNapravlen.Properties.Value <> 0) then
        begin
          ods.DeleteVariables;
          ods.Close;
          ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13+
                          '  USING DUAL ON (FK_PACID = :PFK_PACID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_KUDA_NAPRAVLEN''))) '+#13+
                          ' WHEN MATCHED THEN UPDATE SET FN_NUM = :PFN_NUM, FK_VRACHID = :PFK_VRACHID, FK_SMID = :PFK_SMID, FK_SMEDITID = :PFK_SMEDITID '+#13+
                          '                    WHERE FK_PACID = :PFK_PACID '+#13+
                          '                      AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_KUDA_NAPRAVLEN'')) '+#13+
                          ' WHEN NOT MATCHED THEN INSERT(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                          '                       VALUES(:PFK_PACID, :PFN_NUM, :PFK_SMID, :PFK_SMEDITID, :PFK_VRACHID) ';
          ods.DeclareAndSet('PFK_SMID', otInteger, rowKudaNapravlen.Properties.Value);
          ods.DeclareAndSet('PFK_SMEDITID', otInteger, rowKudaNapravlen.Properties.Value);
          ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
          ods.DeclareAndSet('PFN_NUM', otInteger, rowKudaNapravlen.Properties.Value);
          ods.DeclareAndSet('PFK_VRACHID', otInteger, frmMain.pSOTRID);
          ods.Open;
          frmMain.os.Commit;
        end else
        begin
          oq := TOracleQuery.Create(nil); // удаляем из tib запись о "куда направлен"
          try
            oq.Session := frmMain.os;
            oq.SQL.Text := ' delete from asu.tib where fk_pacid = :pfk_pacid '+#13+
                           '    and fk_smid in (select fk_id from asu.tsmid where fk_owner = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_KUDA_NAPRAVLEN'')) ';
            oq.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
            oq.Execute;
            frmMain.os.Commit;
          finally
            oq.Free;
          end;
        end;
	  end;
  finally
    ods.Free;
    oqNaz.Free;
  end;
//--- TRICHVIEWDATA
  if odsRVData.RecordCount=0 then
    odsRVData.Insert
  else
    odsRVData.Edit;
 // if frmMain.get_db_name <> 'SO' then
  try
    rveText.SetSelectionBounds(0, rveText.GetOffsBeforeItem(0), rveText.ItemCount - 1, rveText.GetOffsAfterItem(rveText.ItemCount - 1));
  except
  end;
  Application.ProcessMessages;
	memStream := TMemoryStream.Create;
  memStream1 := TMemoryStream.Create;
  try
	  rveText.SaveRVFToStream(memStream,False);
    rveText.SaveRVFToStream(memStream1,False);
//сохраняем в BLOB
	  memStream.Position := 0;
	  TBlobField(odsRVData.FieldByName('FB_BLOB')).LoadFromStream(memStream);
	  memStream.Clear;

//сохраняем в HTML
	  rveText.AddText(#13, 0); //AddBreak;
    if cxTextResume.Text <> '' then
  	  rveText.Add('Заключение:'+cxTextResume.Text, 0); // была функция AddText, поменяли на Add

    rveText.AddText(#13, 0);
    if (memRecom.Visible = True) and (memRecom.Text <> '') then
      rveText.Add('Рекомендовано:'+memRecom.Text, 0);

	  rveText.SaveHTMLToStream(memStream,'','',IntToStr(pNAZID)+'_',[rvsoOverrideImages,rvsoMiddleOnly,rvsoUseCheckpointsNames]);
	  memStream.Position := 0;
	  TBlobField(odsRVData.FieldByName('FB_HTML')).LoadFromStream(memStream);

	  memStream.Clear;

//сохраняем в обычный текст
	  rveText.SaveTextToStream('',memStream,0,False,True);
	  memStream.Position := 0;
    TBlobField(odsRVData.FieldByName('FB_TEXT')).LoadFromStream(memStream);
    odsRVData.FieldByName('FN_COMPRESS').AsInteger := 1;
    odsRVData.FieldByName('FK_PACID').AsInteger := pNAZID;

    memStream1.Position := 0;
    rveText.LoadRVFFromStream(memStream1);
    rveText.Reformat;

    odsRVData.Post;
    frmMain.os.Commit;
  finally
    memStream.Free;
    memStream1.Free;
  end;
end;

procedure TfrmProtocol.DoLog;
var oq : TOracleQuery;
    ods : TOracleDataSet;
    sUserOs, sMachine, sModule : shortstring;
begin
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
// -- логируем
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.DeleteVariables;
    oq.SQL.Text := ' insert into asu.txray_log(fc_field, fc_value, fd_date, fk_nazid, fk_sotrid, fc_osuser, fc_machine, fc_module, fc_form) '+#13+
                   ' values(''Заключение'', :pfc_value, sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmProtocol'') ';
    oq.DeclareAndSet('pfc_value', otString, cxTextResume.Text);
    oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
    oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
    oq.DeclareAndSet('pfc_osuser', otString, sUserOs);
    oq.DeclareAndSet('pfc_machine', otString, sMachine);
    oq.DeclareAndSet('pfc_module', otString, sModule);
    oq.Execute;

    oq.DeleteVariables;
    oq.SQL.Text := ' insert into asu.txray_log(fc_field, fc_value, fd_date, fk_nazid, fk_sotrid, fc_osuser, fc_machine, fc_module, fc_form) '+#13+
                   ' values(''Доза'', :pfc_value, sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmProtocol'') ';
    oq.DeclareAndSet('pfc_value', otString, FloatToStr(cxDoza.Value));
    oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
    oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
    oq.DeclareAndSet('pfc_osuser', otString, sUserOs);
    oq.DeclareAndSet('pfc_machine', otString, sMachine);
    oq.DeclareAndSet('pfc_module', otString, sModule);
    oq.Execute;

    oq.DeleteVariables;
    oq.SQL.Text := ' insert into asu.txray_log(fc_field, fc_value, fd_date, fk_nazid, fk_sotrid, fc_osuser, fc_machine, fc_module, fc_form) '+#13+
                   ' values(''Время услуги'', :pfc_value, sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmProtocol'') ';
    oq.DeclareAndSet('pfc_value', otString, cxTime.Text);
    oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
    oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
    oq.DeclareAndSet('pfc_osuser', otString, sUserOs);
    oq.DeclareAndSet('pfc_machine', otString, sMachine);
    oq.DeclareAndSet('pfc_module', otString, sModule);
    oq.Execute;

    oq.DeleteVariables;
    oq.SQL.Text := ' insert into asu.txray_log(fc_field, fc_value, fd_date, fk_nazid, fk_sotrid, fc_osuser, fc_machine, fc_module, fc_form) '+#13+
                   ' values(''Дата протокола'', :pfc_value, sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmProtocol'') ';
    oq.DeclareAndSet('pfc_value', otString, DateTimeToStr(trunc(cxdeDateProtocol.Date)));
    oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
    oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
    oq.DeclareAndSet('pfc_osuser', otString, sUserOs);
    oq.DeclareAndSet('pfc_machine', otString, sMachine);
    oq.DeclareAndSet('pfc_module', otString, sModule);
    oq.Execute;

    oq.DeleteVariables;
    oq.SQL.Text := ' insert into asu.txray_log(fc_field, fc_value, fd_date, fk_nazid, fk_sotrid, fc_osuser, fc_machine, fc_module, fc_form) '+#13+
                   ' values(''Время протокола'', :pfc_value, sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmProtocol'') ';
    oq.DeclareAndSet('pfc_value', otString, cxteTimeProtocol.Text);
    oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
    oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
    oq.DeclareAndSet('pfc_osuser', otString, sUserOs);
    oq.DeclareAndSet('pfc_machine', otString, sMachine);
    oq.DeclareAndSet('pfc_module', otString, sModule);
    oq.Execute;

    oq.DeleteVariables;
    oq.SQL.Text := ' insert into asu.txray_log(fc_field, fc_value, fd_date, fk_nazid, fk_sotrid, fc_osuser, fc_machine, fc_module, fc_form) '+#13+
                   ' values(''Врач-рентгенолог'', :pfc_value, sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmProtocol'') ';
    oq.DeclareAndSet('pfc_value', otString, cxSotr.Text);
    oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
    oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
    oq.DeclareAndSet('pfc_osuser', otString, sUserOs);
    oq.DeclareAndSet('pfc_machine', otString, sMachine);
    oq.DeclareAndSet('pfc_module', otString, sModule);
    oq.Execute;

    oq.DeleteVariables;
    oq.SQL.Text := ' insert into asu.txray_log(fc_field, fc_value, fd_date, fk_nazid, fk_sotrid, fc_osuser, fc_machine, fc_module, fc_form) '+#13+
                   ' values(''Куда направлен'', asu.get_smidname(:pfc_value), sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmProtocol'') ';
    oq.DeclareAndSet('pfc_value', otString, rowKudaNapravlen.Properties.Value);
    oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
    oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
    oq.DeclareAndSet('pfc_osuser', otString, sUserOs);
    oq.DeclareAndSet('pfc_machine', otString, sMachine);
    oq.DeclareAndSet('pfc_module', otString, sModule);
    oq.Execute;
    frmMain.os.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmProtocol.DoTextParametersNaz(nAMBUL : Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
//--- Заключение
    if cxTextResume.Visible = True then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text :=  ' SELECT MAX(FC_CHAR) AS ZAKL '+#13+
                         '   FROM ASU.TIB '+#13+
                         '  WHERE FK_PACID = :PFK_ID '+#13+
                         '    AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME'') ';
        ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        ods.Open;
        cxTextResume.Text := ods.FieldByName('ZAKL').AsString;
      end;
//--- Рекомендации
    if paRecom.Visible = True then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' SELECT FC_CHAR '+#13#10+
                        '   FROM ASU.TIB '+#13#10+
                        '  WHERE FK_PACID = :PFK_ID '+#13#10+
                        '    AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_PROTOCOL_RECOM'') ';
        ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        ods.Open;
        memRecom.Text := ods.FieldByName('FC_CHAR').AsString;
        isRecomChange := False;
      end;
//--- № исследования, Лаборант, Дата и время протокола
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT FK_NAZTYPEID, FD_RUN, FK_ISPOLID, '+
		                '       (SELECT ASU.DO_VRACHFIO(MAX(FN_NUM)) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''RG_LABORANT'')) AS LABFIO, '+
		                '       (SELECT MAX(FC_CHAR) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL'' OR FC_SYNONIM = ''XRAY_FLU_NUMBER'')) AS NUMBER_ISSL '+
		                '   FROM ASU.TNAZIS WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;
  //  if USE_ONE_ACCESSIONNUMBER=0 then
      rowNumProt.Properties.Value := ods.FieldByName('NUMBER_ISSL').AsString;
    cxLaborant.Text := ods.FieldByName('LABFIO').AsString;
    cxdeDateProtocol.Date := ods.FieldByName('FD_RUN').AsDateTime;
    cxteTimeProtocol.Time := ods.FieldByName('FD_RUN').AsDateTime;
//--- кем направлен
    if nAMBUL = 1 then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' select asu.get_napravlen(:pfk_pacid, :pfk_id) as kem_napravlen from dual ';
//                        ' SELECT DECODE(FC_CHAR, NULL, ASU.GET_SMIDNAME(TIB.FK_SMID), FC_CHAR) AS KEM_NAPRAVLEN '+#13+
//                        '   FROM ASU.TIB '+#13+
//                        '  WHERE FK_PACID = :PFK_ID '+#13+
//                        '    AND FK_SMID IN (SELECT FK_ID '+#13+
//                        '                      FROM ASU.TSMID '+#13+
//                        '                    START WITH FC_SYNONIM = ''KEM_NAPRAVLEN'' '+#13+
//                        '                    CONNECT BY PRIOR FK_ID = FK_OWNER '+#13+
//                        '                    UNION ALL '+#13+
//                        '                    SELECT FK_ID FROM ASU.TSMID '+#13+
//                        '                    START WITH FC_SYNONIM = ''PD_NAPRAVIV_YCH'' '+#13+
//                        '                    CONNECT BY PRIOR FK_ID = FK_OWNER) ';

        ods.DeclareAndSet('pfk_pacid', otInteger, pPacID);
        ods.DeclareAndSet('pfk_id', otInteger, pNazID);
        ods.Open;
     		rowKem.Properties.Value := ods.FieldByName('KEM_NAPRAVLEN').AsString;
      end else
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' SELECT ASU.GET_VRACHFCOTDEL(FK_VRACHID)||'' ''||''-''||'' ''||ASU.DO_VRACHFIO(FK_VRACHID) AS KEM_NAPRAVLEN '+#13+
                        '   FROM ASU.TNAZIS '+#13+
                        '  WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        ods.Open;
        rowKem.Properties.Value := ods.FieldByName('KEM_NAPRAVLEN').AsString;
      end;
//--- куда направлен
    if rowKudaNapravlen.Visible = True then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' SELECT MAX(FK_SMID) AS KUDA_NAPRAVLEN '+#13+
                        '   FROM ASU.TIB '+#13+
                        '  WHERE FK_PACID = :PFK_ID '+#13+
                        '    AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_KUDA_NAPRAVLEN'')) ';
        ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        ods.Open;
        rowKudaNapravlen.Properties.Value := ods.FieldByName('KUDA_NAPRAVLEN').AsInteger;
      end;;
//--- доза
    if cxDoza.Visible = True then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' BEGIN '+#13+
                        '   SELECT MAX(FN_NUM) INTO :nCNT_DOZA FROM ASU.TIB WHERE FK_PACID = :pFK_PACID AND FK_SMID = -1 AND FK_SMEDITID = -1; '+#13+
                        '   IF :nCNT_DOZA IS NULL THEN '+#13+
                        '     SELECT FN_NORM0 INTO :nCNT_DOZA FROM ASU.TSMID WHERE FK_ID = :pFK_SMID; '+#13+
                        '   END IF; '+#13+
                        ' END; ';
        ods.DeclareAndSet('pFK_PACID', otInteger, pNAZID);
        ods.DeclareAndSet('pFK_SMID', otInteger, pSMIDID);
        ods.DeclareVariable('nCNT_DOZA', otFloat);
        ods.Open;
        cxDoza.Text := FloatToStr(ods.GetVariable('nCNT_DOZA'));
      end;
//--- время
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' BEGIN '+#13+
                    '   SELECT MAX(FN_NUM) INTO :nCNT_TIME FROM ASU.TIB WHERE FK_PACID = :pFK_PACID AND FK_SMID = -2 AND FK_SMEDITID = -2; '+#13+
                    '   IF :nCNT_TIME IS NULL THEN '+#13+
                    '     SELECT FC_TIME INTO :nCNT_TIME FROM ASU.TSMID WHERE FK_ID = :pFK_SMID; '+#13+
                    '   END IF; '+#13+
                    ' END; ';
    ods.DeclareAndSet('pFK_PACID', otInteger, pNAZID);
    ods.DeclareAndSet('pFK_SMID', otInteger, pSMIDID);
    ods.DeclareVariable('nCNT_TIME', otFloat);
    ods.Open;
    cxTime.Text := FloatToStr(ods.GetVariable('nCNT_TIME')); 
  finally
    ods.Free;
  end;
end;

procedure TfrmProtocol.FormShow(Sender: TObject);
var Reg : TRegIniFile;
    Reg1 : TRegistry;
     id : Integer;
    odsSnimokExists : TOracleDataSet;
begin
  if rveText.Enabled then
    rveText.SetFocus;
  Reg:=TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\Softmaster\List_Vrach\Protocol\ID_SOTR'+IntToStr(frmMain.pSOTRID), True);
    id := Reg.ReadInteger('\Software\Softmaster\List_Vrach\Protocol\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_CHECK_OTMETKI', 0);
    case id of
      -1: chkOtmetki.Checked := TRUE;
      0: chkOtmetki.Checked := FALSE;
    end;
  finally
    Reg.Free;
  end;
// -- Отображение кнопки bbSnimokLookInside
//-- Проверяем включена ли опция "Интеграция с LookInside"
  if frmMain.get_lookinside = '-1' then
    begin
      Reg1 := TRegistry.Create;
      try
        Reg1.RootKey:=HKEY_CLASSES_ROOT;
          if Reg1.OpenKeyReadOnly('\Makhaon_Station.Station\Clsid') then
            begin
              odsSnimokExists := TOracleDataSet.Create(nil);
              try
                odsSnimokExists.Session := frmMain.os;
                odsSnimokExists.Cursor := crSQLWait;
                odsSnimokExists.SQL.Text := ' select fk_risguid from asu.txrayguid where fk_nazid = :pfk_nazid ';
                odsSnimokExists.DeclareAndSet('pfk_nazid', otInteger, pNazID);
                odsSnimokExists.Open;
                sGuid := odsSnimokExists.FieldByName('fk_risguid').AsString;
                if odsSnimokExists.FieldByName('fk_risguid').AsString <> '' then // Проверяем наличие записи и DICOMUID в таблице TXRAYGUID
                  begin
                    aSnimokLookInside.Visible := True;
                  end;
              finally
                odsSnimokExists.Free;
              end;
            end;
      finally
        Reg1.Free;
      end;
    end;
end;

procedure TfrmProtocol.DrowDigSign(aImage: TImage; APrintText: string; aDataTime: TDateTime; ADSCorrect: Boolean);
var vBitmap: TBitmap;
begin
  vBitmap := TReportUtils.CreateDigSignBMP(APrintText, aDataTime, ADSCorrect, false);
  aImage.Width := vBitmap.Width;
  aImage.Picture.Assign(vBitmap);
  vBitmap.Free;
end;

procedure TfrmProtocol.bPasteClick(Sender: TObject);
begin
  rveText.PasteText;
  rveText.Reformat;
end;

procedure TfrmProtocol.bSaveRShClick(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmSaveRSh, frmSaveRSh);
  try
    frmSaveRSh.ShowModal;
    if frmSaveRSh.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.txray_template_recom(fc_name, fk_sotrid, fc_text, fk_smid) '+#13+
                         ' values(:pfc_name, :pfk_sotrid, :pfc_text, :pfk_smid) ';
          oq.DeclareAndSet('pfc_name', otString, frmSaveRSh.teName.Text);
          oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
          oq.DeclareAndSet('pfc_text', otString, memRecom.Text);
          oq.DeclareAndSet('pfk_smid', otInteger, pSMIDID);
          oq.Execute;
          frmMain.os.Commit;
        finally
          oq.Free;
        end;
      end;
  finally
    frmSaveRSh.Free;
  end;
end;

procedure TfrmProtocol.bCopyClick(Sender: TObject);
begin
  rveText.CopyText;
end;

procedure TfrmProtocol.bCutClick(Sender: TObject);
begin
  rveText.CutDef;
end;

procedure TfrmProtocol.bLoadRShClick(Sender: TObject);
begin
  Application.CreateForm(TfrmAddEditSh, frmAddEditSh);
  try
    frmAddEditSh.odsList.Close;
    frmAddEditSh.odsList.SetVariable('pfk_sotrid', frmMain.pSotrID);
    frmAddEditSh.odsList.SetVariable('pfk_smid', pSMIDID);
    frmAddEditSh.odsList.Open;
    frmAddEditSh.v_Smid := pSMIDID;
    frmAddEditSh.ShowModal;
    if frmAddEditSh.ModalResult = mrOk then
      begin
        memRecom.Text := frmAddEditSh.odsList.FieldByName('fc_text').AsString;
      end;
  finally
    frmAddEditSh.Free;
  end;
end;

procedure TfrmProtocol.bCheckNoneClick(Sender: TObject);
begin
  rveText.ClearLiveSpellingResults;
end;

procedure TfrmProtocol.bCheckClick(Sender: TObject);
begin
  rveText.StartLiveSpelling;
end;

procedure TfrmProtocol.bClearClick(Sender: TObject);
begin
  if Application.MessageBox('Вы собираетесь очистить текст протокола.' + #13 + #10 + 'Уверены?', 'Вопрос', MB_ICONQUESTION+MB_OKCANCEL)= IDOk then
  begin
    rveText.Clear;
    rveText.Format;
    rveText.SetFocus;
  end;
end;

procedure TfrmProtocol.DoPass;
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  if (cxTextResume.Tag = 0) and (cxTextResume.Text = '') then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select 1 as cnt '+#13+
                        '   from asu.tnazis '+#13+
                        '  where fk_nazowner = :pfk_smid '+#13+
                        '    and fk_pacid = :pfk_pacid '+#13+
                        '    and fk_nazsosid = asu.get_pass_registrator ';
        ods.DeclareAndSet('pfk_smid', otInteger, pNAZID);
        ods.DeclareAndSet('pfk_pacid', otInteger, pPACID);
        ods.Open;
        if ods.FieldByName('cnt').AsInteger <> 1 then
          begin
            ods.DeleteVariables;
            ods.Close;
            ods.SQL.Text := ' select 1 as cnt from asu.tsmini '+#13+
                            '  where fc_section = ''XRAY'' '+#13+
                            '    and fc_key like ''МЕТОДИКИ_ДЛЯ_ФГ%''||to_char(:pfk_smid) '+#13+
                            '    and fc_value = to_char(:pfk_smid) ';
            ods.DeclareAndSet('pfk_smid', otInteger, pSMIDID);
            ods.Open;
            if ods.FieldByName('cnt').AsInteger = 1 then
              begin
                if MessageDlg('Внимание!'+#13+#10+
                              'Вы хотите зачесть это исследование как пройденную ФГ? ', mtConfirmation, [mbYes, mbNo], 0) = idYes then
                  begin
                    oq := TOracleQuery.Create(nil);
                    try
                      oq.Session := frmMain.os;
                      oq.Cursor := crSQLWait;
                      oq.SQL.Text := ' insert into asu.tnazis '+#13+
                                     ' (FK_SMID, FC_REMARK, FD_NAZ, FD_RUN, FK_ROOMID, FK_ISPOLID, FK_VRACHID, FK_NAZSOSID, FK_PACID, FC_NAME, FK_NAZTYPEID, FK_NAZOWNER, FC_TYPE) '+#13+
      	    	                       ' VALUES '+#13+
                                     ' (asu.GET_FLU_ONE_PROJECTION, ''Зачтённое назначение''||:pNUM, SYSDATE, :PFD_RUN, 0, :PFK_ISPOLID, :PFK_VRACHID, asu.GET_PASS_REGISTRATOR, :PFK_PACID, asu.GET_SMIDNAME(:PFK_SMID), asu.GET_NAZPLAN, :PFK_NAZOWNER, -1) ';
                      oq.DeclareAndSet('PFD_RUN', otDate, StrToDateTime(DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(cxteTimeProtocol.Time, 1))));
                      oq.DeclareAndSet('PFK_ISPOLID', otInteger, frmMain.pSOTRID);
                      oq.DeclareAndSet('PFK_VRACHID', otInteger, frmMain.pSOTRID);
                      oq.DeclareAndSet('PFK_PACID', otInteger, pPACID);
                      oq.DeclareAndSet('PFK_SMID', otInteger, pSMIDID);
                      oq.DeclareAndSet('PFK_NAZOWNER', otInteger, pNAZID);
                      oq.DeclareAndSet(':pNUM', otString, rowNumProt.Properties.Value);
                      oq.Execute;
                      frmMain.os.Commit;
                      ods.DeleteVariables;
                      ods.Close;
                      ods.SQL.Text := ' merge into asu.tlastfluoro using dual on (fk_peplid = :pfk_peplid) '+#13+
                                      '   when not matched then '+#13+
                                      '     insert(fk_peplid, fd_date, fc_num) values(:pfk_peplid, to_date(asu.get_last_fluoro_date(:pfk_peplid, 1), ''dd.mm.yyyy''), asu.get_last_fluoro_num(:pfk_peplid)) '+#13+
                                      '   when matched then '+#13+
                                      '     update set fd_date = to_date(asu.get_last_fluoro_date(:pfk_peplid, 1), ''dd.mm.yyyy''), '+#13+
                                      '                fc_num = asu.get_last_fluoro_num(:pfk_peplid) '+#13+
                                      '      where fk_peplid = :pfk_peplid ';
                      ods.DeclareAndSet('pfk_peplid', otInteger, pPEPLID);
                      ods.Open;
                      frmMain.os.Commit;
                      ShowMessage('Исследование зачтено как флюорография '+DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn', IncSecond(cxteTimeProtocol.Time, 1))+' !');
                    finally
                      oq.Free;
                    end;
                  end;
              end;
          end;
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmProtocol.DoPodpis;
var oq : TOracleQuery;
    ods : TOracleDataSet;
begin
  oq := TOracleQuery.Create(nil);
  ods := TOracleDataSet.Create(nil);
  try
    oq.Session := frmMain.os;
    ods.Session := frmMain.os;
    oq.SQL.Text := ' update asu.tnazis '+#13+
                   '    set fk_nazsosid = :pfk_nazsosid, fk_ispolid = :pfk_ispolid, fd_run = :pfd_run, fl_in_raspis = 1 '+#13+
                   '  where fk_id = :pfk_nazid ';
    oq.DeclareAndSet('pFK_ISPOLID', otInteger, cxSotr.EditValue);
    oq.DeclareAndSet('pFD_RUN', otDate, StrToDateTime(DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(cxteTimeProtocol.Time, 1))));
    oq.DeclareAndSet('pFK_NAZID', otInteger, pNAZID);
    oq.DeclareAndSet('pFK_NAZSOSID', otInteger, GET_VIPNAZ);
    oq.Execute;
//--- VRES
    ods.SQL.Text := ' DECLARE '+#13+
                    '   cntRes NUMBER; '+#13+
                    ' BEGIN '+#13+
                    '   SELECT COUNT(FK_ID) INTO cntRes FROM ASU.VRES WHERE FK_NAZID = :PFK_NAZID; '+#13+
                    '   IF cntRes = 0 THEN '+#13+
                    '     INSERT INTO ASU.VRES(FK_SMID, FD_INS, FC_RES, FC_TYPE, FK_VRACHID, FK_PACID, FK_PATID, FK_NAZID, FK_SOS) '+#13+
                    '     VALUES(:pFK_SMID, :pFD_INS, '''', ''TEXT'', :PFK_VRACHID, :pFK_PACID, 0, :pFK_NAZID, :PFK_SOS); '+#13+
                    '   ELSE '+#13+
                    '     UPDATE ASU.VRES SET FK_SMID=:PFK_SMID, FD_INS=:PFD_INS, FK_VRACHID=:PFK_VRACHID, FK_SOS=:PFK_SOS '+#13+
                    '      WHERE FK_NAZID = :PFK_NAZID; '+#13+
                    '   END IF; '+#13+
                    ' END; ';
    ods.DeclareAndSet('PFK_NAZID', otInteger, pNAZID);
    ods.DeclareAndSet('PFK_SMID', otInteger, pSMIDID);
    ods.DeclareAndSet('pFD_INS', otDate, StrToDateTime(DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(cxteTimeProtocol.Time, 1))));
    ods.DeclareAndSet('PFK_VRACHID', otInteger, cxSotr.EditValue);
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.DeclareAndSet('PFK_SOS', otInteger, GET_VIPNAZ);
    ods.Open;
//--- TPODPISNAZ
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' MERGE INTO ASU.TPODPISNAZ '+#13+
                    '  USING DUAL ON (FK_NAZID = :PFK_NAZID AND FK_SOTRID = :pFK_SOTRID) '+#13+
                    ' WHEN MATCHED THEN UPDATE SET FK_SOS=:PFK_SOS, FD_INS = :PFD_INS '+#13+
                    '                    WHERE FK_NAZID = :PFK_NAZID AND FK_SOTRID = :pFK_SOTRID '+#13+
                    ' WHEN NOT MATCHED THEN INSERT(FK_NAZID, FK_SOTRID, FK_SOS, FD_DATE, FD_INS) '+#13+
                    '                       VALUES(:pFK_NAZID, :pFK_SOTRID, :PFK_SOS, SYSDATE, :pFD_INS) ';
    ods.DeclareAndSet('pFK_NAZID', otInteger, pNAZID);
    ods.DeclareAndSet('pFK_SOTRID', otInteger, cxSotr.EditValue);
    ods.DeclareAndSet('PFK_SOS', otInteger, GET_VIPNAZ);
    ods.DeclareAndSet('pFD_INS', otDate, StrToDateTime(DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn', cxteTimeProtocol.Time)));
    ods.Open;
// -- tlastfluoro
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' merge into asu.tlastfluoro using dual on (fk_peplid = :pfk_peplid) '+#13+
                    '   when not matched then '+#13+
                    '     insert(fk_peplid, fd_date, fc_num) values(:pfk_peplid, to_date(asu.get_last_fluoro_date(:pfk_peplid, 1), ''dd.mm.yyyy''), asu.get_last_fluoro_num(:pfk_peplid)) '+#13+
                    '   when matched then '+#13+
                    '     update set fd_date = to_date(asu.get_last_fluoro_date(:pfk_peplid, 1), ''dd.mm.yyyy''), '+#13+
                    '                fc_num = asu.get_last_fluoro_num(:pfk_peplid) '+#13+
                    '      where fk_peplid = :pfk_peplid ';
    ods.DeclareAndSet('pfk_peplid', otInteger, pPEPLID);
    ods.Open;
// -- талон - ставим врача открывшего талон
    if pAmbul = 1 then
      begin
        ods.Close;
        ods.DeleteVariables;
        ods.SQL.Text := ' select count(1) as n, max(tan.fk_talonid) as fk_talonid ' +#13+
                        '   from asu.vnaz, asu.tambtalon_naz, ' +#13+
                        '        (select fk_talonid ' +#13+
                        '           from asu.tambtalon_naz ' +#13+
                        '          where tambtalon_naz.fk_nazid = :pnazid) tan ' +#13+
                        '  where vnaz.fk_id = tambtalon_naz.fk_nazid ' +#13+
                        '    and tambtalon_naz.fk_talonid = tan.fk_talonid ' +#13+
                        '    and vnaz.fk_nazsosid = asu.get_vipnaz ';
        ods.DeclareAndSet('pnazid', otInteger, pNAZID);
        ods.Open;
        if ods.FieldByName('n').AsInteger = 1 then
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' update asu.tambtalon set fk_sotrid = :pfk_sotrid where fk_id = :ptalonid ';
            oq.DeclareAndSet('ptalonid', otInteger, ods.FieldByName('fk_talonid').AsInteger);
            oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
            oq.Execute;
          end;
      end;
    frmMain.os.Commit;
// -- Сопоставление с услугами
  if (show_set_usluga) and ((pAmbul = 1) or (get_show_set_usluga_for_all)) then
      if frmMain.chkNazHeal ( pPacID, pNAZID ) then
        DoCheckForHeal(pSMIDID, frmMain.pSOTRID, pNAZID);
  finally
    ods.Free;
    oq.Free;
  end;
end;

procedure TfrmProtocol.aPasteImageExecute(Sender: TObject);
var
  gr: TGraphic;
  pic: TPicture;
begin
  // взято из примера
  OpenDialog1.Title := 'Inserting Image';
  OpenDialog1.Filter :=
    'Graphics(*.bmp;*.wmf;*.emf;*.ico;*.jpg)|*.bmp;*.wmf;*.emf;*.ico;*.jpg|All(*.*)|*.*';
  if OpenDialog1.Execute then
    try
      pic := TPicture.Create;
      try
        pic.LoadFromFile(OpenDialog1.FileName);
        gr := RV_CreateGraphics(TGraphicClass(pic.Graphic.ClassType));
        gr.Assign(pic.Graphic);
      finally
        pic.Free;
      end;
      if gr <> nil then
        rveText.InsertPicture('', gr, rvvaBaseLine);
    except
      Application.MessageBox(PChar('Cannot read picture from file ' +
        OpenDialog1.FileName), 'Error',
        MB_OK or MB_ICONSTOP);
    end;
end;

procedure TfrmProtocol.aPFExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmProfFactor, frmProfFactor);
  try
    frmProfFactor.DoShowForm(pNazID, pPacID);
    frmProfFactor.ShowModal;
  finally
    frmProfFactor.Free;
  end;
end;

procedure TfrmProtocol.aPodpisExecute(Sender: TObject);
begin
  if FIsSign then
    begin
      if Application.MessageBox('Этот документ защищён цифровой подписью. Чтобы сохранить изменения необходимо поставить новую цифровую подпись, перейти к добавлению цифровой подписи?',
        'Вопрос', MB_YESNO + MB_ICONQUESTION) = mrYes
        then
          acDigitPodpis.Execute;
    end else
    begin
      try
        Cursor := crSQLWait;                  
        if DoCheckParameters = 0 then
          exit;
        DoInsertEditParametersNaz;
        DoPodpis;
        if bPass <> True then // если не нажимали кнопку "Зачесть" то делаем DoPass
          DoPass;
        DoLog;  
        ModalResult := MrOK;
      finally
        Cursor := crDefault;
      end;
    end;
end;

procedure TfrmProtocol.aPrintExecute(Sender: TObject);
begin
  if rveText.Enabled then
    rveText.SetFocus;
    
  if pOwnerID = get_rad_gamma then
    begin
      DoShowProtocol_Gamma;
      exit;
    end;
  if PownerID = get_rad_petct then
    begin
      DoShowProtocol_Petct;
      exit;
    end;
  if frmMain.GET_DB_NAME = 'T' then // печать протокола для Сургут Травма
    begin
      DoShowProtocol_4OBTC;
      exit;
    end;
  if frmMain.GET_DB_NAME = 'SO' then // печать протокола для Сургут ОКБ
    begin
      DoShowProtocol_4SOKB;
      exit;
    end;
  if frmMain.GET_DB_NAME = 'NV' then // печать протокола для Нижневартовска
    begin
      DoShowProtocol_4NV;
      exit;
    end;

  DoShowProtocol_4OKBHMAO; // печать протокола для всех остальных
end;

procedure TfrmProtocol.frxRepGammaBeforePrint(Sender: TfrxReportComponent);
begin
  if Sender.Name = 'Picture1' then
    TfrxPictureView(Sender).Picture.Assign(frmProtocol.imSign.picture);
end;

procedure TfrmProtocol.frxRepGammaGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'PACFIO' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DATE_ROJD' then Value := merDateAgeSex.Properties.Editors[0].Value;
  if VarName = 'NUMISSL' then Value := rowNumProt.Properties.Value;
  if VarName = 'NAMEISSL' then Value := rowIssl.Properties.Value;
  if VarName = 'DOZA' then Value := cxDoza.Value;
  if VarName = 'DATEISSL' then Value := DateToStr(cxdeDateProtocol.Date)+ ' '+ cxteTimeProtocol.Text;
  if VarName = 'SOTR' then Value := cxSotr.Text;
  if cxTextResume.Text <> '' then
  begin
    if VarName = 'TEXTISSL' then Value := rveText.GetSelText+#13+'Заключение: '+cxTextResume.Text;
  end else
  begin
    if VarName = 'TEXTISSL' then Value := rveText.GetSelText;
  end;
  if VarName = 'KABINET' then Value := frmMain.odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'PHONEKAB' then Value := frmMain.odsKab.FieldByName('FC_PHONE').AsString;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'SOTRSPEC' then Value := sSpecName;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'NAPRAVLEN' then Value := rowKem.Properties.Value;
  if VarName = 'RFP' then Value := sRFP;
  if VarName = 'VVED_ACT' then Value := nVvedAct;
end;

procedure TfrmProtocol.frxRepKontrastBeforePrint(Sender: TfrxReportComponent);
begin
  if Sender.Name = 'Picture1' then
    TfrxPictureView(Sender).Picture.Assign(frmProtocol.imSign.picture);
end;

procedure TfrmProtocol.frxRepKontrastGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'PACFIO' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DATE_ROJD' then Value := merDateAgeSex.Properties.Editors[0].Value;
  if VarName = 'NUMISSL' then Value := rowNumProt.Properties.Value;
  if VarName = 'NAMEISSL' then Value := rowIssl.Properties.Value;
  if VarName = 'DOZA' then Value := cxDoza.Value;
  if VarName = 'DATEISSL' then Value := DateToStr(cxdeDateProtocol.Date)+ ' '+ cxteTimeProtocol.Text;
  if VarName = 'SOTR' then Value := cxSotr.Text;
  if cxTextResume.Text <> '' then
  begin
    if VarName = 'TEXTISSL' then Value := rveText.GetSelText+#13+'Заключение: '+cxTextResume.Text;
  end else
  begin
    if VarName = 'TEXTISSL' then Value := rveText.GetSelText;
  end;
  if VarName = 'KABINET' then Value := frmMain.odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'PHONEKAB' then Value := frmMain.odsKab.FieldByName('FC_PHONE').AsString;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'SOTRSPEC' then Value := sSpecName;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'NAPRAVLEN' then Value := rowKem.Properties.Value;
  if VarName = 'TYPE' then Value := sTypeKontrast;
  if VarName = 'KOLVO' then Value := sKolvoKontrast;
  if VarName = 'VVOD' then Value := sVvodKontrast;
end;

procedure TfrmProtocol.frxRepNVBeforePrint(Sender: TfrxReportComponent);
begin
  if Sender.Name = 'Picture1' then
    TfrxPictureView(Sender).Picture.Assign(frmProtocol.imSign.picture);
end;

procedure TfrmProtocol.frxRepNVGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'PACFIO' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DATE_ROJD' then Value := merDateAgeSex.Properties.Editors[0].Value;
  if VarName = 'NUMISSL' then Value := rowNumProt.Properties.Value;
  if VarName = 'NAMEISSL' then Value := rowIssl.Properties.Value;
  if VarName = 'DOZA' then Value := cxDoza.Value;
  if VarName = 'DATEISSL' then Value := DateToStr(cxdeDateProtocol.Date)+ ' '+ cxteTimeProtocol.Text;
  if VarName = 'SOTR' then Value := cxSotr.Text;
  if cxTextResume.Text <> '' then
  begin
    if VarName = 'TEXTISSL' then Value := rveText.GetSelText+#13+'Заключение: '+cxTextResume.Text;
  end else
  begin
    if VarName = 'TEXTISSL' then Value := rveText.GetSelText;
  end;
  if VarName = 'KABINET' then Value := frmMain.odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'PHONEKAB' then Value := frmMain.odsKab.FieldByName('FC_PHONE').AsString;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'SOTRSPEC' then Value := sSpecName;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'NAPRAVLEN' then Value := rowKem.Properties.Value;
end;

procedure TfrmProtocol.frxRepOBTCGetValue(const VarName: string; var Value: Variant);
var str : string;
begin
  if VarName = 'PACFIO' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DATE_ROJD' then Value := merDateAgeSex.Properties.Editors[0].Value;
  if VarName = 'NUMISSL' then Value := rowNumProt.Properties.Value;
  if VarName = 'NAMEISSL' then Value := rowIssl.Properties.Value;
  if VarName = 'ZAKL' then Value := cxTextResume.Text;
  if VarName = 'DATEISSL' then Value := DateToStr(cxdeDateProtocol.Date)+ ' '+ cxteTimeProtocol.Text;
  if VarName = 'SOTR' then Value := cxSotr.Text;
  str := rveText.GetSelText;
  if cxTextResume.Text <> '' then
    str := str +#13#10+'Заключение: '+cxTextResume.Text;
  if (memRecom.Visible = True) and (memRecom.Text <> '') then
    str := str + #13#10 + 'Рекомендовано: '+memRecom.Text;
  if VarName = 'TEXTISSL' then Value := str;

//  if cxTextResume.Text <> '' then
//    begin
//      if VarName = 'TEXTISSL' then Value := rveText.GetSelText+#13#10+'Заключение: '+cxTextResume.Text;
//    end else
//    begin
//      if VarName = 'TEXTISSL' then Value := rveText.GetSelText;
//    end;

  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'SOTRSPEC' then Value := sSpecName;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'DOZA' then Value := cxDoza.Text;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;

  if VarName = 'KONTRAST' then Value := Self.sTypeKontrast;
  if VarName = 'KONTRAST_KOLVO' then Value := Self.sKolvoKontrast;
  
end;

procedure TfrmProtocol.frxRepOBTC_4RentgenGetValue(const VarName: string; var Value: Variant);
var str : string;
begin
  if VarName = 'PACFIO' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DATE_ROJD' then Value := merDateAgeSex.Properties.Editors[0].Value;
  if VarName = 'NUMISSL' then Value := rowNumProt.Properties.Value;
  if VarName = 'NAMEISSL' then Value := rowIssl.Properties.Value;
  if VarName = 'ZAKL' then Value := cxTextResume.Text;
  if VarName = 'DATEISSL' then Value := DateToStr(cxdeDateProtocol.Date)+ ' '+ cxteTimeProtocol.Text;
  if VarName = 'SOTR' then Value := cxSotr.Text;
  str := rveText.GetSelText;
  if cxTextResume.Text <> '' then
    str := str +#13#10+'Заключение: '+cxTextResume.Text;
  if (memRecom.Visible = True) and (memRecom.Text <> '') then
    str := str + #13#10 + 'Рекомендовано: '+memRecom.Text;
  if VarName = 'TEXTISSL' then Value := str;

//  if cxTextResume.Text <> '' then
//  begin
//    if VarName = 'TEXTISSL' then Value := rveText.GetSelText+#13#10+'ЗАКЛЮЧЕНИЕ: '+cxTextResume.Text;
//  end else
//  begin
//    if VarName = 'TEXTISSL' then Value := rveText.GetSelText;
//  end;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'SOTRSPEC' then Value := sSpecName;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'DOZA' then Value := cxDoza.Text;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;    
end;

procedure TfrmProtocol.frxReport1BeforePrint(Sender: TfrxReportComponent);
begin
  if Sender.Name = 'Picture1' then
    TfrxPictureView(Sender).Picture.Assign(frmProtocol.imSign.picture);
end;

procedure TfrmProtocol.frxReport1GetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'PACFIO' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DATE_ROJD' then Value := merDateAgeSex.Properties.Editors[0].Value;
  if VarName = 'NUMISSL' then Value := rowNumProt.Properties.Value;
  if VarName = 'NAMEISSL' then Value := rowIssl.Properties.Value;
  if VarName = 'DOZA' then Value := cxDoza.Value;
  if VarName = 'DATEISSL' then Value := DateToStr(cxdeDateProtocol.Date)+ ' '+ cxteTimeProtocol.Text;
  if VarName = 'SOTR' then Value := cxSotr.Text;
  if cxTextResume.Text <> '' then
  begin
    if VarName = 'TEXTISSL' then Value := rveText.GetSelText+#13+'Заключение: '+cxTextResume.Text;
  end else
  begin
    if VarName = 'TEXTISSL' then Value := rveText.GetSelText;
  end;
  if VarName = 'KABINET' then Value := frmMain.odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'PHONEKAB' then Value := frmMain.odsKab.FieldByName('FC_PHONE').AsString;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'SOTRSPEC' then Value := sSpecName;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'NAPRAVLEN' then Value := rowKem.Properties.Value;
end;

procedure TfrmProtocol.frxRepPetctBeforePrint(Sender: TfrxReportComponent);
begin
  if Sender.Name = 'Picture1' then
    TfrxPictureView(Sender).Picture.Assign(frmProtocol.imSign.picture);
end;

procedure TfrmProtocol.frxRepPetctGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'PACFIO' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DATE_ROJD' then Value := merDateAgeSex.Properties.Editors[0].Value;
  if VarName = 'NUMISSL' then Value := rowNumProt.Properties.Value;
  if VarName = 'NAMEISSL' then Value := rowIssl.Properties.Value;
  if VarName = 'DOZA' then Value := cxDoza.Value;
  if VarName = 'DATEISSL' then Value := DateToStr(cxdeDateProtocol.Date)+ ' '+ cxteTimeProtocol.Text;
  if VarName = 'SOTR' then Value := cxSotr.Text;
  if cxTextResume.Text <> '' then
  begin
    if VarName = 'TEXTISSL' then Value := rveText.GetSelText+#13+'Заключение: '+cxTextResume.Text;
  end else
  begin
    if VarName = 'TEXTISSL' then Value := rveText.GetSelText;
  end;
  if VarName = 'KABINET' then Value := frmMain.odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'PHONEKAB' then Value := frmMain.odsKab.FieldByName('FC_PHONE').AsString;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'SOTRSPEC' then Value := sSpecName;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'NAPRAVLEN' then Value := rowKem.Properties.Value;
  if VarName = 'RFP' then Value := sRFP;
  if VarName = 'VVED_ACT' then Value := nVvedAct;
  if VarName = 'SCAN' then Value := sTypeScan;
end;

procedure pConvWordFile ( pInFile, pOutFile : string );
var MsWord: Variant;
{  ЗАМЕЧАНИЕ: Format:=6 указывает Word-у на необходимость сохранять файл как RTF. Расширения недостаточно.
Другие форматы файлов:
Format      File
Argument    Format
--------    ------
   0        Нормальный (формат Word)
   1        Шаблон документа
   2        Только текст (extended characters saved in ANSI character set)
   3        Текст+Переносы (plain text with line breaks; extended
            characters saved in ANSI character set)
   4        Только текст (PC-8) (extended characters saved in IBM PC
            character set)
   5        Текст+Переносы (PC-8) (text with line breaks; extended
            characters saved in IBM PC character set)
   6        Формат Rich-text (RTF)
}
begin
  MsWord := CreateOleObject('Word.Basic');
  if not VarIsEmpty(MsWord) then
    try
      MsWord.Fileopen(pInFile);
      MsWord.FileSaveAs( pOutFile, 6 );
    finally
      MsWord.AppClose;
      MsWord := Unassigned;
    end
  else
    ShowMessage('Could not start MS Word');
end;

procedure TfrmProtocol.frxRepSOKBBeforePrint(Sender: TfrxReportComponent);
var ms: TMemoryStream; vfrxRichEditorForm : TfrxRichEditorForm;
begin
  if Sender.Name = 'Picture1' then
    TfrxPictureView(Sender).Picture.Assign(frmProtocol.imSign.picture);
end;

procedure TfrmProtocol.frxRepSOKBGetValue(const VarName: string;
  var Value: Variant);
var
  TEXTISSL, vZAKL : string;
begin
  if VarName = 'PACFIO' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DATE_ROJD' then Value := merDateAgeSex.Properties.Editors[0].Value;
  if VarName = 'NUMISSL' then Value := rowNumProt.Properties.Value;
  if VarName = 'NAMEISSL' then Value := rowIssl.Properties.Value;
  if VarName = 'DOZA' then Value := cxDoza.Value;
  if VarName = 'DATEISSL' then Value := DateToStr(cxdeDateProtocol.Date)+ ' '+ cxteTimeProtocol.Text;
  if VarName = 'SOTR' then Value := cxSotr.Text;
  {vZAKL:='';
  if cxTextResume.Text <> '' then
    vZAKL := cxTextResume.Text;   }
  if VarName = 'FREKOM' then
  begin
    Value := memRecom.Text;
  end;
  if VarName = 'ZAKL' then Value := cxTextResume.Text;
  if VarName = 'TEXTISSL' then
    Value := rveText.GetSelText;
  if VarName = 'KABINET' then Value := frmMain.odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'PHONEKAB' then Value := frmMain.odsKab.FieldByName('FC_PHONE').AsString;
//  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
//  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'SOTRSPEC' then Value := sSpecName;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'NAPRAVLEN' then Value := rowKem.Properties.Value;
  if VarName = 'TYPE' then Value := rowTypeKontrast.Properties.Value;
  if VarName = 'KOLVO' then Value := rowKolvoKontrast.Properties.Value;
  if VarName = 'VVOD' then Value := rowVvodKontrast.Properties.Value;
  if VarName = 'VVODVrach' then Value := rowFIOVrach.Properties.Value;
end;

procedure TfrmProtocol.InsColExecute(Sender: TObject);
begin  //
  InsColTableIntoRVEditor( rveText );
end;

procedure TfrmProtocol.InsRowExecute(Sender: TObject);
begin  //
  InsRowTableIntoRVEditor( rveText );
end;

procedure TfrmProtocol.InsTableExecute(Sender: TObject);
begin  //
  InsTableIntoRVEditor( rveText );
end;

procedure TfrmProtocol.DelColExecute(Sender: TObject);
begin  //
  DelColTableIntoRVEditor( rveText );
end;

procedure TfrmProtocol.DelRowExecute(Sender: TObject);
begin  //
  DelRowTableIntoRVEditor( rveText );
end;

procedure TfrmProtocol.DelTableExecute(Sender: TObject);
begin  //
  DelTableIntoRVEditor( rveText );
end;

procedure TfrmProtocol.MergeCellsExecute(Sender: TObject);
begin
  UnionCellRVEditor( rveText );
end;

function TfrmProtocol.IsNazSignedCryptoPro(aNazID: Integer; var aSotrName: String; var aSotrID: Integer; var aSignDT: TDateTime): Boolean;
var vSignidByTableAndID: Integer;
    ods : TOracleDataSet;
begin
  if not FUseDigitalSign then
    begin
      Result := false;
      exit;
    end;

  vSignidByTableAndID := FCryptoProUtils.GetSignidByTableAndID(SQLRuleTableName, pNAZID);
  if vSignidByTableAndID <= 0 then
    begin
      Result := false;
      aSotrName := '';
      aSotrID := -1;
      aSignDT := -1;
    end else
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT TSR.FK_ID FK_SOTR, LOGIN.GET_SOTRNAME(TSR.FK_ID) FC_SOTR, T.FD_DATE ' +
                        '   FROM ASU.TDIGITAL_SIGNATURE T LEFT JOIN LOGIN.TSOTR TSR ON TSR.FK_PEPLID = T.FK_PEOPLEID ' +
                        '  WHERE T.FK_ID = :pSignID';
        ods.DeclareAndSet('pSignID', otInteger, vSignidByTableAndID);
        ods.Open;
        Result := True;
        aSotrName := ods.FieldByName('FC_SOTR').AsString;
        aSotrID := ods.FieldByName('FK_SOTR').AsInteger;
        aSignDT := ods.FieldByName('FD_DATE').AsDateTime;
      finally
        ods.Free;
      end;
  end;
end;

function TfrmProtocol.IsSotrHasSignCryptoPro(aSotrID: Integer): Boolean;
begin
  Result := FCryptoProUtils.IsSotrHasKey(frmMain.pSOTRID);
end;

procedure TfrmProtocol.acDigitPodpisExecute(Sender: TObject);
begin
  if not FUseDigitalSign then
    exit;
  try
    Screen.Cursor := crSQLWait;
    if DoCheckParameters = 0 then
      exit;
    DoInsertEditParametersNaz;
    DoPodpis;
    DoSignCryptoPro;
    frmMain.os.Commit;
    RefreshIsSign(pNAZID);
    ModalResult := MrOK;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmProtocol.aCMOVEExecute(Sender: TObject);
var
// Отображение снимков по пациенту/исследованию (для АТРИС)
p_showSnimki : procedure (  p_AppHandl : THandle;
                            p_OracleSession: pointer;
                            p_patientID:string;
                            p_AccessionNumber:string;
                            p_studyUID:string;
                            p_old_form : Boolean;
                            p_use_c_get : Boolean
                         ); stdcall;
DLL_HANDLE: THandle;
const c_fileDLL = 'DICOM_Viewer.dll';
var v_an, v_pid : string; v_testfile:string;
    Reg : TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    if not Reg.OpenKeyReadOnly('\Software\Alda\MultiVox\Installation') then // если нет сопряжения с Мультивоксом
    begin
      if (frmMain.GET_DB_NAME = 'H') or (frmMain.GET_DB_NAME = 'SO') then // если база Ханты ОКБ или Сургут ОКБ - сопряжение с Мультивокс
      begin
        ShowMessage('Не установлен клиент MultiVox ...');
        Exit;
      end;
      // edpatientID.Text
      // edAccessionNumber.Text
      if FileExists(c_fileDLL) then
      begin
        DLL_HANDLE:= LoadLibrary(c_fileDLL);
        Try
          if DLL_HANDLE <> 0 then
          begin
            @p_showSnimki := GetProcAddress(DLL_HANDLE, 'p_showSnimki');
            if @p_showSnimki <> nil then
            begin
              v_testfile:= ExtractFilePath(paramstr(0))+'dicomtest.ini';
              if FileExists(v_testfile) then  // !!! для отладки
              begin
                if Application.MessageBox( 'Вы хотите загрузить проверочные снимки'+#13+
                                           ' тестового пациента ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION
                                         ) = MrYes
                then
                  With TIniFile.Create(v_testfile) do
                    try
                      v_pid:=ReadString('TEST','PATIENTID','');
                      v_an :=ReadString('TEST','ACCESSIONNUMBER','');
                      WriteString('TEST','PATIENTID',v_pid);
                      WriteString('TEST','ACCESSIONNUMBER',v_an);
                      WriteString('TEST','FND_PATIENTID',merFIOMK.Properties.Editors[1].Value);
                      WriteString('TEST','FND_ACCESSIONNUMBER',rowNumProt.Properties.Value);
                    finally
                      Free;
                    end
                else
                  DeleteFile(v_testfile);
              end else
              begin
                v_pid := merFIOMK.Properties.Editors[1].Value;
                v_an  := rowNumProt.Properties.Value;
              end;
              p_showSnimki(  Application.Handle,
                             frmMain.os.ExternalSVC,
                             v_pid, // merFIOMK.Properties.Editors[1].Value
                             v_an,  // erowNumProt.Properties.Value
                             '',    // p_studyUID
                             False ,  // old_form
                             False   //  p_use_c_get
                          );
            end;
          end;
        Finally
          FreeLibrary(DLL_HANDLE);
        End;
      end else
        MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
    end else
      begin
        frmMain.sPath := Reg.ReadString('Path');
        ShellExecute(Application.Handle,
                     pChar('open'),
                     pChar(frmMain.sPath+'MvLauncher.exe'),
                     PChar('-cmd:Load -StudyExternalID:'+IntToStr(pNAZID)),
                     pChar(frmMain.sPath),
                     SW_SHOWNORMAL);
      end;
  finally
    Reg.Free;
  end;
   {
   v_atris_use_web_browser := OraTSMINI.CallStringFunction('READSTRING',['DLL_WORKLIST_NAZN','atris_use_web_browser','']);
   if v_atris_use_web_browser='1' then
   begin
     v_atris_webpage := OraTSMINI.CallStringFunction('READSTRING',['DLL_WORKLIST_NAZN','atris_webpage','']);
     v_atris_mssql_conn_str := OraTSMINI.CallStringFunction('READSTRING',['DLL_WORKLIST_NAZN','atris_mssql_conn_str','']);
     v_atris_webuser := OraTSMINI.CallStringFunction('READSTRING',['DLL_WORKLIST_NAZN','atris_webuser','']);
     v_atris_webpassword := OraTSMINI.CallStringFunction('READSTRING',['DLL_WORKLIST_NAZN','atris_webpassword','']);
     v_atris_use := OraTSMINI.CallStringFunction('READSTRING',['DLL_WORKLIST_NAZN','atris_use','']);
     v_atris_web_timeout := OraTSMINI.CallStringFunction('READSTRING',['DLL_WORKLIST_NAZN','atris_web_timeout','']);

     if FileExists(c_fileDLL) then
     begin
        DLL_HANDLE:= LoadLibrary(c_fileDLL);
        Try
          if DLL_HANDLE <> 0 then
          begin
            @p_showHTTPSnimki := GetProcAddress(DLL_HANDLE, 'p_showHTTPSnimki');
            if @p_showHTTPSnimki <> nil then
             p_showHTTPSnimki( v_atris_webpage ,
                               v_atris_mssql_conn_str,
                               v_atris_webuser,
                               v_atris_webpassword,
                               v_atris_use,
                               StrToInt(v_atris_web_timeout),
                               '', // merFIOMK.Properties.Editors[1].Value, // edpatientID.Text,
                               rowNumProt.Properties.Value, // edAccessionNumber.Text,
                               '' // edstudyUID.Text
                             );
          end;
        Finally
          FreeLibrary(DLL_HANDLE);
        End;
     end else
        MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);

     Exit;
   end;

   frmMain.get_dicom_ip := OraTSMINI.CallStringFunction('READSTRING',['XRAY','DICOM_IP','']);
   frmMain.get_dicom_called := OraTSMINI.CallStringFunction('READSTRING',['XRAY','DICOM_CALLED_AE','']);
   frmMain.get_dicom_port := OraTSMINI.CallStringFunction('READSTRING',['XRAY','DICOM_PORT','']);
   frmMain.get_local_port := OraTSMINI.CallStringFunction('READSTRING',['XRAY','DICOM_LOCAL_PORT','']);
   if trim(frmMain.get_dicom_ip)=''
   then
   begin
     ShowMessage( 'dicom_ip='+frmMain.get_dicom_ip+#13+
                  'dicom_called='+frmMain.get_dicom_called +#13+
                  'dicom_port='+frmMain.get_dicom_port +#13+
                  'CallingAET='+frmMain.sCallingAET +#13+
                  'local_port='+frmMain.get_local_port
                );
     Exit;
   end;

   MnLg_ev( 'запрос С-MOVE :'+#13+
            'PatientId  :'+ merFIOMK.Properties.Editors[1].Value+#13+
            ' AccessionNumber :'+ rowNumProt.Properties.Value+#13+
            'dicom_ip='+frmMain.get_dicom_ip+#13+
            'dicom_called='+frmMain.get_dicom_called +#13+
            'dicom_port='+frmMain.get_dicom_port +#13+
            'CallingAET='+frmMain.sCallingAET +#13+
            'local_port='+frmMain.get_local_port,
            ExtractFilePath(paramstr(0))+'dcmevents.log',
            False );


   if frmMain.get_dicom_ip = '' then
    begin
      MessageDlg('Вы не можете просматривать изображения с сервера!'+#13+#10+
                 'Не установлен IP-адрес сервера!', mtWarning, [mbOK], 0);
      Exit;
    end;
  if frmMain.get_dicom_port = '' then
    begin                        
      MessageDlg('Вы не можете просматривать изображения с сервера!'+#13+#10+
                 'Не установлен порт соединения с сервером!', mtWarning, [mbOK], 0);
      Exit;
    end;
  try
    v_str := TStringList.Create;
    v_amm_res:=0;
    v_str.Clear;
    Screen.Cursor := crHourGlass;


    // установим порт сервера
    DicomServerCore1.ServerPort:=StrToInt(frmMain.get_local_port);
    // запуск сервера
    DicomServerCore1.Stop;
    Application.ProcessMessages;
    Sleep(100);

    try
      DicomServerCore1.Start;
    except
      on E:Exception do
      begin
        ShowMessage(DateTimeToStr(Now)+' ERROR DicomServer Start : '+E.Message );
      end;
    end;

    try
      Screen.Cursor := crHourGlass;
      // создание формы
      Application.CreateForm(TfrmSnimok, frmSnimok);
      // создадим ползунок
      Application.CreateForm(TFrmProgressBar, FrmProgressBar);
      gt_list_for_studyUIDs ( '', // p_STUDYUID,
                              frmMain.get_dicom_ip,
                              StrToInt(frmMain.get_dicom_port),
                              StrToInt(frmMain.get_local_port),
                              frmMain.get_dicom_called,
                              frmMain.sCallingAET,
                              FrmProgressBar,
                              True, //      const p_is_one : boolean;
                              '', // p_PATIENT,
                              '', // p_SERIES,
                              False, // p_key
                              True, // debug
                              rowNumProt.Properties.Value  // p_AccessioNumber
                            );
      // if CmnUnit.v_exit_progressbar=2 then ; // на будущее
      if CmnUnit.v_exit_progressbar in [0,2] then begin
        frmSnimok.ShowModal;
      end;
    finally
      Sleep(1000); // ждем 1 секунду
      DicomServerCore1.Stop;
      Screen.Cursor := crDefault;
      chk_close;
      Application.ProcessMessages;
      Sleep(100);
      frmSnimok.Free;
    end; }



    // поиск по N протокола
   { gt_studyUID_lst(rowNumProt.Properties.Value,
                    frmMain.get_dicom_ip,
                    MyStrToInt(frmMain.get_dicom_port),
                    frmMain.get_dicom_called,
                    frmMain.sCallingAET,
                    v_str,
                    v_amm_res); }
// не нашли - поиск по номеру мед.карты
   { if v_amm_res=0 then
      begin
        gt_studyUID_lst(merFIOMK.Properties.Editors[1].Value,
                        frmMain.get_dicom_ip,
                        MyStrToInt(frmMain.get_dicom_port),
                        frmMain.get_dicom_called,
                        frmMain.sCallingAET,
                        v_str,
                        v_amm_res);
      end;  }
   { if v_amm_res=0 then
      begin  // сообщение об ошибке
        chk_close; // закроем ползунок
        MessageDlg('Данные не найдены ...', mtInformation, [mbOK], 0);
    end else begin
      // если нашли - c_move по найденному списку studyUID
      // создание формы
      Application.CreateForm(TfrmSnimok, frmSnimok);
      // создадим ползунок
      Application.CreateForm(TFrmProgressBar, FrmProgressBar);
      // запрос c_move
      frmProtocol.DicomServerCore1.Stop;
      Application.ProcessMessages;
      Sleep(100);
      frmProtocol.DicomServerCore1.ServerPort:=MyStrToInt(frmMain.get_local_port);
      // инициализируем ползунок - чтобы что-то показать
      FrmProgressBar.clc_pos(True, 'Загрузка исследования', v_str.Count, (v_str.Count=1));
      FrmProgressBar.clc_posMain(0, 'Загрузка изображений', (v_str.Count=1));
      for I := 0 to v_str.Count - 1 do begin
        try
          CmnUnit.v_exit_progressbar:=0;
          FrmProgressBar.MyIncPosMain('Загрузка исследования '+inttostr(i+1)+'/'+inttostr(v_str.Count));
          frmProtocol.DicomServerCore1.Start;
          gt_list_for_studyUIDs(v_str[i],
                                frmMain.get_dicom_ip,
                                MyStrToInt(frmMain.get_dicom_port),
                                MyStrToInt(frmMain.get_local_port),
                                frmMain.get_dicom_called,
                                frmMain.sCallingAET,
                                FrmProgressBar,
                                (v_str.Count=1));
        finally
          frmProtocol.DicomServerCore1.stop;
          Application.ProcessMessages;
          Sleep(100);
        end;
      end;
      chk_close; // закроем ползунок
      if CmnUnit.v_exit_progressbar=2 then begin
        try
          frmSnimok.ShowModal;
        finally
          FreeAndNil(frmSnimok);
        end;
      end;
    end;  }
 { finally
    Screen.Cursor := crDefault;
    FreeAndNil(v_str);
  end;  }
end;

procedure TfrmProtocol.aControlProtocolExecute(Sender: TObject);
var    ods : TOracleDataSet;
    odsNaz : TOracleDataSet;
        oq : TOracleQuery;
    idSmid : Integer;
    nIDNaz : Integer;
    memStream : TMemoryStream;
begin
  Application.CreateForm(TfrmControlProtocol, frmControlProtocol);
  frmControlProtocol.aSave.Enabled := aSave.Enabled;
  frmControlProtocol.aDel.Enabled := aSave.Enabled;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID, FC_NAME FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_CONTROL_PROTOCOL'' ';
    ods.Open;
    idSmid := ods.FieldByName('FK_ID').AsInteger;
  finally
    ods.Free;
  end;
    odsNaz := TOracleDataSet.Create(nil);
    try
      odsNaz.Session := frmMain.os;
      odsNaz.Cursor := crSQLWait;
      odsNaz.SQL.Text := ' SELECT FK_ID FROM ASU.VNAZ WHERE FK_SMID = :PFK_SMID AND FK_NAZOWNER = :PFK_NAZOWNER ';
      odsNaz.DeclareAndSet('PFK_SMID', otInteger, idSmid);
      odsNaz.DeclareAndSet('PFK_NAZOWNER', otInteger, pNAZID);
      odsNaz.Open;
      nIDNaz := odsNaz.FieldByName('FK_ID').AsInteger;
      if odsNaz.RecordCount > 0 then
        frmControlProtocol.INSERT_MODE := False
      else
        frmControlProtocol.INSERT_MODE := True;
      frmControlProtocol.DoShowFormControlProtocol(idSmid, nIDNaz, rowNumProt.Properties.Value);
      frmControlProtocol.ShowModal;
      if frmControlProtocol.ModalResult = MrOK then
        begin
          if odsNaz.RecordCount > 0 then
            begin
              oq := TOracleQuery.Create(nil);
              try
              oq.Session := frmMain.os;
              oq.Cursor := crSQLWait;
              oq.SQL.Text := ' BEGIN '+
                             ' UPDATE asu.VNAZ SET FD_RUN = :PFD_RUN, FK_ISPOLID = :PFK_ISPOLID WHERE FK_ID = :PFK_ID; '+
                             ' UPDATE asu.VRES SET FD_INS = :PFD_RUN, FK_VRACHID = :PFK_ISPOLID WHERE FK_NAZID = :PFK_ID; '+
                             ' END; ';
              oq.DeclareAndSet('PFD_RUN', otDate, StrToDateTime(DateToStr(frmControlProtocol.cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(frmControlProtocol.cxteTimeProtocol.Time, 1))));
              oq.DeclareAndSet('PFK_ISPOLID', otInteger, frmControlProtocol.cxSotr.EditValue);
              oq.DeclareAndSet('PFK_ID', otInteger, nIDNaz);
              oq.Execute;
              frmMain.os.Commit;
            finally
              oq.Free;
            end;
          end else
          begin
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := frmMain.os;
              oq.Cursor := crSQLWait;
              oq.SQL.Text := ' INSERT INTO ASU.VNAZ '+
                             '                   (FK_SMID, FC_REMARK, FD_NAZ, FD_RUN, FK_ROOMID, FK_ISPOLID, '+
                             '                    FK_VRACHID, FK_NAZSOSID, FK_PACID, FC_NAME, FK_NAZTYPEID, FK_NAZOWNER) '+
                             ' VALUES(:PFK_SMID, :PFC_REMARK, :PFD_NAZ, :PFD_RUN, 0, :PFK_ISPOLID, '+
                             ' :PFK_VRACHID, ASU.GET_VIPNAZ, :PFK_PACID, (SELECT FC_NAME FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_CONTROL_PROTOCOL''), ASU.GET_NAZPLAN, :PFK_NAZOWNER) '+
                             ' RETURNING FK_ID INTO :PFK_ID ';
              oq.DeclareAndSet('PFK_SMID', otInteger, idSmid);
              oq.DeclareAndSet('PFC_REMARK', otString, 'Контрольное описание протокола - Рентген');
              oq.DeclareAndSet('PFD_NAZ', otDate, StrToDateTime(DateToStr(frmControlProtocol.cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(frmControlProtocol.cxteTimeProtocol.Time, 1))));
              oq.DeclareAndSet('PFD_RUN', otDate, StrToDateTime(DateToStr(frmControlProtocol.cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(frmControlProtocol.cxteTimeProtocol.Time, 1))));
              oq.DeclareAndSet('PFK_ISPOLID', otInteger, frmControlProtocol.cxSotr.EditValue);
              oq.DeclareAndSet('PFK_VRACHID', otInteger, frmControlProtocol.cxSotr.EditValue);
              oq.DeclareAndSet('PFK_PACID', otInteger, pPACID);
              oq.DeclareAndSet('PFK_NAZOWNER', otInteger, pNAZID);
              oq.DeclareVariable('PFK_ID', otInteger);
              oq.Execute;
              nIDNaz := oq.GetVariable('PFK_ID');
              frmMain.os.Commit;
              oq.DeleteVariables;
              oq.SQL.Text := ' INSERT INTO VRES (FK_SMID, FD_INS, FC_RES, FC_TYPE, FK_VRACHID, FK_PACID, FK_PATID, FK_NAZID, FK_SOS) '+
                             ' VALUES(:pFK_SMID, :pFD_INS, '''', ''TEXT'', :pFK_VRACHID, :pFK_PACID, 0, :pFK_NAZID, GET_VIPNAZ) ';
              oq.DeclareAndSet('pFK_SMID', otInteger, idSmid);
              oq.DeclareAndSet('pFD_INS', otDate, StrToDateTime(DateToStr(frmControlProtocol.cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(frmControlProtocol.cxteTimeProtocol.Time, 1))));
              oq.DeclareAndSet('pFK_VRACHID', otInteger, frmControlProtocol.cxSotr.EditValue);
              oq.DeclareAndSet('pFK_PACID', otInteger, pPACID);
              oq.DeclareAndSet('pFK_NAZID', otInteger, nIDNaz);
              oq.Execute;
              frmMain.os.Commit;
            finally
              oq.Free;
            end;
          end;
//------------------------------------------------------------------------------
      if frmControlProtocol.odsRVData.RecordCount=0 then
        frmControlProtocol.odsRVData.Insert
      else
        frmControlProtocol.odsRVData.Edit;

      if frmControlProtocol.rveText.ItemCount <> 0 then
        begin
          frmControlProtocol.rveText.SetSelectionBounds(0, frmControlProtocol.rveText.GetOffsBeforeItem(0),
                                                        frmControlProtocol.rveText.ItemCount - 1,
                                                        frmControlProtocol.rveText.GetOffsAfterItem(frmControlProtocol.rveText.ItemCount - 1));
        end;
      Application.ProcessMessages;
	    memStream := TMemoryStream.Create;
	    frmControlProtocol.rveText.SaveRVFToStream(memStream,False);
//сохраняем в BLOB
	    memStream.Position := 0;
	    TBlobField(frmControlProtocol.odsRVData.FieldByName('FB_BLOB')).LoadFromStream(memStream);
    	memStream.Clear;
//сохраняем в HTML
	    frmControlProtocol.rveText.AddBreak;
	    frmControlProtocol.rveText.SaveHTMLToStream(memStream,'','',IntToStr(pNAZID)+'_',[rvsoOverrideImages,rvsoMiddleOnly,rvsoUseCheckpointsNames]);
	    memStream.Position := 0;
	    TBlobField(frmControlProtocol.odsRVData.FieldByName('FB_HTML')).LoadFromStream(memStream);
	    memStream.Clear;
//сохраняем в обычный текст
	    frmControlProtocol.rveText.SaveTextToStream('',memStream,0,False,True);
	    memStream.Position := 0;
      TBlobField(frmControlProtocol.odsRVData.FieldByName('FB_TEXT')).LoadFromStream(memStream);
      frmControlProtocol.odsRVData.FieldByName('FN_COMPRESS').AsInteger := 1;
      frmControlProtocol.odsRVData.FieldByName('FK_PACID').AsInteger := nIDNaz;
      frmControlProtocol.odsRVData.Post;
      frmMain.os.Commit;
      memStream.Free;
    end;
    finally
      odsNaz.Free;
    end;
end;

procedure TfrmProtocol.actPassExecute(Sender: TObject);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  if MessageDlg('Вы действительно хотите зачесть это исследование как ФГ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      bPass := True;
      ods := TOracleDataSet.Create(nil);
      oq := TOracleQuery.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select 1 as cnt '+#13+
                        '   from asu.tnazis '+#13+
                        '  where fk_nazowner = :pfk_smid '+#13+
                        '    and fk_pacid = :pfk_pacid '+#13+
                        '    and fk_nazsosid = asu.get_pass_registrator ';
        ods.DeclareAndSet('pfk_smid', otInteger, pNAZID);
        ods.DeclareAndSet('pfk_pacid', otInteger, pPACID);
        ods.Open;
        if ods.FieldByName('cnt').AsInteger = 1 then
          begin
            MessageDlg('Внимание!'+#13+#10+
                       'Это исследование было зачтено ранее!'+#13+#10+'Вы не можете зачесть его повторно!', mtWarning, [mbOK], 0);
            exit;
          end else
          begin
            oq.Session := frmMain.os;
            oq.Cursor := crSQLWait;
            oq.SQL.Text := ' INSERT INTO asu.TNAZIS(FK_SMID, FC_REMARK, FD_NAZ, FD_RUN, FK_ROOMID, FK_ISPOLID, FK_VRACHID, FK_NAZSOSID, FK_PACID, FC_NAME, FK_NAZTYPEID, FK_NAZOWNER, FC_TYPE) '+
      	        	         ' VALUES(asu.GET_FLU_ONE_PROJECTION, ''Зачтённое назначение''||:pNUM, SYSDATE, :PFD_RUN, 0, :PFK_ISPOLID, :PFK_VRACHID, asu.GET_PASS_REGISTRATOR, :PFK_PACID, asu.GET_SMIDNAME(:PFK_SMID), asu.GET_NAZPLAN, :PFK_NAZOWNER, -1) ';
            oq.DeclareAndSet('PFD_RUN', otDate, StrToDateTime(DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(cxteTimeProtocol.Time, 1))));
            oq.DeclareAndSet('PFK_ISPOLID', otInteger, frmMain.pSOTRID);
            oq.DeclareAndSet('PFK_VRACHID', otInteger, frmMain.pSOTRID);
            oq.DeclareAndSet('PFK_PACID', otInteger, pPACID);
            oq.DeclareAndSet('PFK_SMID', otInteger, pSMIDID);
            oq.DeclareAndSet('PFK_NAZOWNER', otInteger, pNAZID);
            oq.DeclareAndSet(':pNUM', otString, rowNumProt.Properties.Value);
            oq.Execute;
            frmMain.os.Commit;
            ods.DeleteVariables;
            ods.Close;
            ods.SQL.Text := ' merge into asu.tlastfluoro using dual on (fk_peplid = :pfk_peplid) '+#13+
                            '   when not matched then '+#13+
                            '     insert(fk_peplid, fd_date, fc_num) values(:pfk_peplid, to_date(asu.get_last_fluoro_date(:pfk_peplid, 1), ''dd.mm.yyyy''), asu.get_last_fluoro_num(:pfk_peplid)) '+#13+
                            '   when matched then '+#13+
                            '     update set fd_date = to_date(asu.get_last_fluoro_date(:pfk_peplid, 1), ''dd.mm.yyyy''), '+#13+
                            '                fc_num = asu.get_last_fluoro_num(:pfk_peplid) '+#13+
                            '      where fk_peplid = :pfk_peplid ';
            ods.DeclareAndSet('pfk_peplid', otInteger, pPEPLID);
            ods.Open;
            frmMain.os.Commit;
            ShowMessage('Исследование зачтено как флюорография '+DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn', IncSecond(cxteTimeProtocol.Time, 1))+' !');
          end;
      finally
        ods.Free;
        oq.Free;
      end;
    end;
end;

procedure TfrmProtocol.aDelZaklExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if Application.MessageBox('Вы действительно хотите удалить заключение этого протокола?', 'Вопрос', mb_yesno+mb_iconquestion) = mrYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       ' where fk_pacid = :pfk_pacid '+#13+
                       '   and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_VRACH_RESUME'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
        oq.Execute;
        frmMain.os.Commit;
        cxTextResume.Clear;
        cxTextResume.Tag := 0;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmProtocol.aHistoryExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAllHistory, frmAllHistory);
  try
    frmAllHistory.DoShowForm(pPEPLID, merFIOMK.Properties.Editors[0].Value);
    frmAllHistory.ShowModal;
  finally
    frmAllHistory.Free;
  end;
end;

procedure TfrmProtocol.aInsPicExecute(Sender: TObject);
var gr: TGraphic;
    pic: TPicture;
begin
  OpenDialog1.Title := 'Inserting Image';
  OpenDialog1.Filter := 'Graphics(*.bmp;*.wmf;*.emf;*.ico;*.jpg)|*.bmp;*.wmf;*.emf;*.ico;*.jpg|All(*.*)|*.*';
  if OpenDialog1.Execute then
    try
      pic := TPicture.Create;
      try
        pic.LoadFromFile(OpenDialog1.FileName);
        gr := RV_CreateGraphics(TGraphicClass(pic.Graphic.ClassType));
        gr.Assign(pic.Graphic);
      finally
        pic.Free;
      end;
      if gr <> nil then
        rveText.InsertPicture('', gr, rvvaBaseLine);
    except
      Application.MessageBox(PChar('Cannot read picture from file ' + OpenDialog1.FileName), 'Error', MB_OK or MB_ICONSTOP);
    end;
end;

procedure TfrmProtocol.rowControlEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
    odsNaz : TOracleDataSet;
    idSmid : Integer;
    nIDNaz : Integer;
begin
  Application.CreateForm(TfrmShowControlProtokol, frmShowControlProtokol);
  ods := TOracleDataSet.Create(nil);
  odsNaz := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID, FC_NAME FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_CONTROL_PROTOCOL'' ';
    ods.Open;
    idSmid := ods.FieldByName('FK_ID').AsInteger;
    odsNaz.Session := frmMain.os;
    odsNaz.Cursor := crSQLWait;
    odsNaz.SQL.Text := ' SELECT FK_ID FROM ASU.VNAZ WHERE FK_SMID = :PFK_SMID AND FK_NAZOWNER = :PFK_NAZOWNER ';
    odsNaz.DeclareAndSet('PFK_SMID', otInteger, idSmid);
    odsNaz.DeclareAndSet('PFK_NAZOWNER', otInteger, pNAZID);
    odsNaz.Open;
    nIDNaz := odsNaz.FieldByName('FK_ID').AsInteger;
    frmShowControlProtokol.DoShowForm(idSmid, nIDNaz);
    frmShowControlProtokol.ShowModal;
  finally
    ods.Free;
    odsNaz.Free;
    frmShowControlProtokol.Free;
  end;
end;

procedure TfrmProtocol.rowKudaNapravlenEditPropertiesChange(Sender: TObject);
begin
  isWhereGo := True; 
end;

procedure TfrmProtocol.rveTextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (chr(KEY) in ['a', 'A', 'ф', 'Ф']) then
    begin
      rveText.SetSelectionBounds(0, rveText.GetOffsBeforeItem(0), rveText.ItemCount - 1,
      rveText.GetOffsAfterItem(rveText.ItemCount - 1));
      Application.ProcessMessages;
    end;
end;

procedure TfrmProtocol.N1Click(Sender: TObject);
begin
  rveText.PasteText;
  rveText.Reformat;
end;

procedure TfrmProtocol.rveTextPaste(Sender: TCustomRichViewEdit; var DoDefault: Boolean);
//var s : String;
begin
//  s := Clipboard.AsText;
//  Sender.TopLevelEditor.InsertText(s, False);   //!!!
end;

procedure TfrmProtocol.rveTextSpellingCheck(Sender: TCustomRichView;
  const AWord: string; StyleNo: Integer; var Misspelled: Boolean);
begin
  if SpellChecker1.IsKnownWord(AWord,langRussian) = False then
    Misspelled := True;
//  Misspelled := not SpellChecker1.IsKnownWord(AWord,langRussian);
end;

procedure TfrmProtocol.SetEnableButtonForReadOnly(AEnable: Boolean);
begin
  cxdeDateProtocol.Properties.ReadOnly := not AEnable;
  cxteTimeProtocol.Properties.ReadOnly := not AEnable;
  bClear.Enabled := AEnable;
  bCheck.Enabled := AEnable;
  bCheckNone.Enabled := AEnable;
  bbSave.Enabled := AEnable;
  bCut.Enabled := AEnable;
  bCopy.Enabled := AEnable;
  bPaste.Enabled := AEnable;
  bSaveTemplate.Enabled := AEnable;
  bLoadTemplate.Enabled := AEnable;
  bLoadZakl.Enabled := AEnable;
  bSet.Enabled := AEnable;

  rveText.ReadOnly := not AEnable;
  rveText.Enabled := AEnable;
  cxTextResume.Properties.ReadOnly := not AEnable;
end;

procedure TfrmProtocol.SetIsReadOnly(const aIsReadOnly: Boolean);
begin
  if FUseDigitalSign then
    begin
      FIsReadOnly := aIsReadOnly;
      DoSetEnabledPodpisClose(not FIsReadOnly);
      SetEnableButtonForReadOnly(not FIsReadOnly);
      aStartEdit.Visible := aIsReadOnly;
      aSnimki.Visible := not aIsReadOnly;
      aHistory.Visible := not aIsReadOnly;
      aOtmetki.Visible := not aIsReadOnly;
      aControlProtocol.Visible := not aIsReadOnly;
      aSetQ.Visible := not aIsReadOnly;
      aDelZakl.Visible := not aIsReadOnly;
      aPrint.Visible := not aIsReadOnly;
      if aIsReadOnly then
        dxContainerShowOtmetki.Visible := ivNever
      else
        dxContainerShowOtmetki.Visible := ivAlways;
      chkOtmetki.Visible := not aIsReadOnly;
      if aIsReadOnly or (not FUseDigitalSign) then
        begin
          bbSave.Visible := ivNever;
        end else
        begin
          bbSave.Visible := ivAlways;
        end;

      acDigitPodpis.Visible := not aIsReadOnly;
    end else
    begin
      aStartEdit.Visible := False;
    end;
end;

procedure TfrmProtocol.SignedComponentEnabled(aNazID: Integer; aIsSigned: Boolean; aSotrName: String; aSignDT: TDateTime);
var vSignCorrect: Boolean;
    vSignidByTableAndID: Integer;
begin
  aSnimki.Visible := not IsReadOnly;
  aOtmetki.Visible := not IsReadOnly;
  aControlProtocol.Visible := not IsReadOnly;
  aSetQ.Visible := not IsReadOnly;
  aDelZakl.Visible := not IsReadOnly;
  aPrint.Visible := not IsReadOnly;
  aHistory.Visible := not IsReadOnly;
  chkOtmetki.Visible := not IsReadOnly;
  if not aIsSigned then
    begin
      imSign.Visible := false;
    end else
    begin
      imSign.Visible := true;

      vSignCorrect := false;
      vSignidByTableAndID := FCryptoProUtils.GetSignidByTableAndID(SQLRuleTableName,aNAZID);
      if vSignidByTableAndID > 0 then
        vSignCorrect := FCryptoProUtils.CheckSign(vSignidByTableAndID);

      if not vSignCorrect then
        vSignCorrect := TSignUtils.IsSignCorrect(frmMain.os, aNazID) = scTrue;

      DrowDigSign(imSign, aSotrName, aSignDT, vSignCorrect);
    end;
end;

procedure TfrmProtocol.N2Click(Sender: TObject);
begin
  rveText.CopyText;
end;

procedure TfrmProtocol.N3Click(Sender: TObject);
begin
  rveText.CutDef;
end;

procedure TfrmProtocol.N5Click(Sender: TObject);
begin
  if Application.MessageBox('Вы собираетесь очистить текст протокола.' + #13 + #10 + 'Уверены?', 'Вопрос', MB_ICONQUESTION+MB_OKCANCEL)= IDOk then
  begin
    rveText.Clear;
    rveText.Format;
    rveText.SetFocus;
  end;
end;

procedure TfrmProtocol.aOtmetkiExecute(Sender: TObject);
begin
 if pOWNERID = frmMain.GET_ISSL_FLU then
   begin
		 Application.CreateForm(TfrmOtmetkiFlu, frmOtmetkiFlu);
     try
	  	 frmOtmetkiFlu.aSave.Enabled := aSave.Enabled;
	   	 frmOtmetkiFlu.DoShowfrmOtmetki(pNAZID, pPACID);
		   frmOtmetkiFlu.ShowModal;
     finally
  		 frmOtmetkiFlu.Free;
     end;
	 end else
	 begin
		 Application.CreateForm(TfrmOtmetki, frmOtmetki);
     try
       frmOtmetki.aSave.Enabled := aSave.Enabled;
       frmOtmetki.DoShowfrmOtmetki(pNAZID, pPACID, frmMain.odsKab.FieldByName('FK_ID').AsInteger);
       frmOtmetki.ShowModal;
     finally
       frmOtmetki.Free;
     end;
   end;
end;

procedure TfrmProtocol.DoTextProtocol;
var ods : TOracleDataSet;
    memStream : TMemoryStream;
begin
  memStream :=  TMemoryStream.Create;
  try
    odsRVData.Close;
    odsRVData.SetVariable('FK_PACID', pNAZID);
    odsRVData.Open;
    TBlobField(odsRVData.FieldByName('FB_BLOB')).SaveToStream(memStream);
    memStream.Position := 0;
    rveText.Clear;
    rveText.LoadRVFFromStream(memStream);
    rveText.Format;
  finally
    memStream.Free;
  end;
  if odsRVData.RecordCount = 0 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.SQL.Text := ' SELECT FB_BLOB FROM ASU.TRICHVIEW_TEMPL_DEF, ASU.TRICHVIEW_TEMPL '+#13+
                        '  WHERE TRICHVIEW_TEMPL_DEF.FK_SOTR = :PFK_SOTR '+#13+
                        '    AND TRICHVIEW_TEMPL_DEF.FK_SMID = :PFK_SMID '+#13+
                        '    AND TRICHVIEW_TEMPL_DEF.FK_RICHVIEW_TEML = TRICHVIEW_TEMPL.FK_ID '+#13+
                        ' ORDER BY TRICHVIEW_TEMPL.FN_ORDER DESC ';
        ods.DeclareAndSet('PFK_SOTR', otInteger, frmMain.pSOTRID);
        ods.DeclareAndSet('PFK_SMID', otInteger, pSMIDID);
        ods.Open;
        ods.First;
        if ods.RecordCount > 0 then
          begin
            while not ods.Eof do // ??? что-то здесь непонятное... зачем здесь цикл?
              begin
                memStream := TMemoryStream.Create;
                memStream.Position := 0;
                TBlobField(ods.FieldByName('FB_BLOB')).SaveToStream(memStream);
                memStream.Position := 0;
                rveText.InsertRVFFromStreamEd(memStream);
                rveText.Format;
                memStream.Clear;
                memStream.Free;
                ods.Next;
              end;
          end;
      finally
        ods.Free;
      end;
  end;
end;

procedure TfrmProtocol.aResumeExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSetResume, frmSetResume);
  try
    frmSetResume.DoShowForm;
    frmSetResume.ShowModal;
    if frmSetResume.ModalResult = MrOK then
      begin
        cxTextResume.Text := cxTextResume.Text +' '+ frmSetResume.odsTree.FieldByName('FC_NAME').AsString;
        cxTextResume.Tag := frmSetResume.odsTree.FieldByName('FK_ID').AsInteger;
      end;
  finally
    frmSetResume.Free;
  end;
end;

procedure TfrmProtocol.odsSotrBeforeOpen(DataSet: TDataSet);
begin
  odsSotr.SetVariable('PFK_OTDELID', frmMain.pOTDELID);
end;

procedure TfrmProtocol.RefreshIsSign(aNazID: Integer);
begin
  FIsSign := IsNazSignedCryptoPro(aNazID, FSignSotrName, FSignSotrID, FSignDT);
  SignedComponentEnabled(aNazID, FIsSign, FSignSotrName, FSignDT);
end;

procedure TfrmProtocol.MenuItem1Click(Sender: TObject);
begin
  cxTextResume.CutToClipboard;
end;

procedure TfrmProtocol.MenuItem2Click(Sender: TObject);
begin
  cxTextResume.CopyToClipboard;
end;

procedure TfrmProtocol.MenuItem3Click(Sender: TObject);
begin
  cxTextResume.PasteFromClipboard;
end;

procedure TfrmProtocol.MenuItem5Click(Sender: TObject);
begin
  if Application.MessageBox('Вы собираетесь очистить текст заключения.' + #13 + #10 + 'Уверены?', 'Вопрос', MB_ICONQUESTION+MB_OKCANCEL)= IDOk then
  begin
    cxTextResume.Clear;
  end;
end;

procedure TfrmProtocol.aSaveTemplateExecute(Sender: TObject);
var memStream: TMemoryStream;
begin
  memStream := TMemoryStream.Create;
  try
    rveText.SaveRVFToStream(memStream, False);
    memStream.Position := 0;
    SaveMedEditorAsTemplate(pSMIDID, memStream, rvs);
  finally
    memStream.Free;
  end;
end;

procedure TfrmProtocol.aSetQExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmSetQ, frmSetQ);
  try
    frmSetQ.DoShowForm(pNAZID);
    frmSetQ.ShowModal;
    if frmSetQ.ModalResult = mrOk then
      begin
        ods := TOracleDataSet.Create(nil);
        try
          ods.Session := frmMain.os;
          ods.Cursor := crSQLWait;
          ods.SQL.Text := ' merge into asu.tib using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_QUALITY'')) '+#13+
                          '   when not matched then insert(fk_smid, fk_smeditid, fk_pacid, fk_vrachid, fd_date) '+#13+
                          '   values(:pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_pacid, :pfk_vrachid, sysdate) '+#13+
                          '   when matched then update set fk_smid = :pfk_smid, fd_date = sysdate, fk_vrachid = :pfk_vrachid '+#13+
                          '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_QUALITY'') ';
          ods.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
          ods.DeclareAndSet('pfk_smid', otInteger, frmSetQ.lcbQ.EditValue);
          ods.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
          ods.Open;
          frmMain.os.Commit;
        finally
          ods.Free;
        end;
      end;
  finally
    frmSetQ.Free;
  end;
end;

procedure TfrmProtocol.aSnimkiExecute(Sender: TObject);
var Reg : TRegistry;
// Отображение снимков по пациенту/исследованию (для АТРИС)
p_showSnimki : procedure (  p_AppHandl : THandle;
                            p_OracleSession: pointer;
                            p_patientID:string;
                            p_AccessionNumber:string;
                            p_studyUID:string;
                            p_old_form : Boolean ;
                            p_use_c_get : Boolean
                         ); stdcall;
DLL_HANDLE: THandle;
const c_fileDLL = 'DICOM_Viewer.dll';
var v_an, v_pid : string; v_testfile:string;
  function f_gtTSMINI ( p_key : string; p_section : string ) : string;
  var v_OraclePackage : TOraclePackage;
  begin
    v_OraclePackage := TOraclePackage.Create(nil);
    try
      v_OraclePackage.Session := frmMain.os;
      v_OraclePackage.PackageName:='asu.PKG_SMINI';
      try
        Result:=v_OraclePackage.CallStringFunction('READSTRING',[p_key,p_section,'']);
      except
        on E:Exception do
          MessageDlg('Ошибка '+E.Message, mtError, [mbOK], 0);
      end;
    finally
      v_OraclePackage.Free;
    end;
  end;
  procedure MyShowShimok;
  begin
    if FileExists(c_fileDLL) then
        begin
          DLL_HANDLE:= LoadLibrary(c_fileDLL);
          Try
            if DLL_HANDLE <> 0 then
            begin
              @p_showSnimki := GetProcAddress(DLL_HANDLE, 'p_showSnimki');
              if @p_showSnimki <> nil then
              begin
               { v_testfile:= ExtractFilePath(paramstr(0))+'dicomtest.ini';
                if FileExists(v_testfile) then  // !!! для отладки
                begin
                  if Application.MessageBox( 'Вы хотите загрузить проверочные снимки'+#13+
                                             ' тестового пациента ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION
                                           ) = MrYes
                  then
                    With TIniFile.Create(v_testfile) do
                      try
                        v_pid:=ReadString('TEST','PATIENTID','');
                        v_an :=ReadString('TEST','ACCESSIONNUMBER','');
                        WriteString('TEST','PATIENTID',v_pid);
                        WriteString('TEST','ACCESSIONNUMBER',v_an);
                        WriteString('TEST','FND_PATIENTID',merFIOMK.Properties.Editors[1].Value);
                        WriteString('TEST','FND_ACCESSIONNUMBER',rowNumProt.Properties.Value);
                      finally
                        Free;
                      end
                  else
                    DeleteFile(v_testfile);
                end else
                begin  }
                  v_pid := merFIOMK.Properties.Editors[1].Value;
                  v_an  := rowNumProt.Properties.Value;
               { end;   }
                p_showSnimki(  Application.Handle,
                         frmMain.os.ExternalSVC,
                         v_pid, // merFIOMK.Properties.Editors[1].Value
                         v_an,  // erowNumProt.Properties.Value
                         '',    // p_studyUID
                         False ,  // old_form
                         True   //  p_use_c_get
                      );
              end;
            end;
          Finally
            FreeLibrary(DLL_HANDLE);
          End;
        end else
          MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
  end;
var vRunStr, vExeFile : string;
  function Exec(pCommandLine, pCurDir: string): THandle;
  var
    StInfo : TStartupInfo;
    SeAttr : TSecurityAttributes;
    ProcInfo : TProcessInformation;
    ProcHandle : THandle;
  begin
    FillChar(StInfo,SizeOf(StInfo),0);
    StInfo.cb := SizeOf(StInfo);
    stInfo.dwFlags:=STARTF_USESHOWWINDOW;
    StInfo.wShowWindow:=SW_SHOWDEFAULT;

    SeAttr.nLength:=SizeOf(SeAttr);
    SeAttr.bInheritHandle:=true;
    SeAttr.lpSecurityDescriptor:=nil;

    if CreateProcess(nil, PChar(pCommandLine), @SeAttr, @SeAttr, False,
      NORMAL_PRIORITY_CLASS, nil, PChar(pCurDir), StInfo, ProcInfo) then
      Result := ProcInfo.hProcess
    else
      Result:= 0;
  end;
begin
  if (f_gtTSMINI('DLL_WORKLIST_NAZN','MYWORKLIST_USE')='1') or fileexists(ExtractFilePath(ParamStr(0))+'\testdicom.dat') then
  begin
    if f_gtTSMINI('XRAY',  'RUNVIEWERDLL')='1' then
    begin
      MyShowShimok;
    end else
    begin // SOKB
      vExeFile:=ExtractFilePath( ParamStr(0) )+'\DicomClient.exe';
      if FileExists( vExeFile ) then
      begin
        vRunStr := 'asDicomViewer 1 '+               // check_viewer v_isPostgres
          f_gtTSMINI('XRAY', 'PACS_DATABASE')+' '+   // v_pg_database
          f_gtTSMINI('XRAY', 'PACS_PORT')+' '+       //
          f_gtTSMINI('XRAY', 'PACS_SERVER')+' '+     //
          f_gtTSMINI('XRAY', 'PACS_USERNAME')+' '+   //
          f_gtTSMINI('XRAY', 'PACS_PASSWORD')+' '+   //
          f_gtTSMINI('XRAY', 'PACS_SCHEMA')+' '+     //
          rowNumProt.Properties.Value;               // accessionnumber
          try
            Exec(vExeFile+' '+vRunStr,ExtractFilePath(ParamStr(0)));
          //  WinExec(PChar(vExeFile+' '+vRunStr), SW_ShowNormal);
        {  ShellExecute(Application.Handle,
                       pChar('open'),
                       pChar(vExeFile),
                       PChar(vRunStr),
                       pChar(ExtractFilePath( ParamStr(0) )),
                       SW_SHOWNORMAL); }
          except
            on E:Exception do
              ShowMessage(E.Message);
          end;
      End else ShowMessage('Файл '+ExtractFilePath( ParamStr(0) )+'\DicomClient.exe'+' не найден.');
    end;
    Exit;
  end;
  Reg := TRegistry.Create;
  try
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    if not Reg.OpenKeyReadOnly('\Software\Alda\MultiVox\Installation') then // если нет сопряжения с Мультивоксом
      begin
        if (frmMain.GET_DB_NAME = 'H') or (frmMain.GET_DB_NAME = 'SO') then // если база Ханты ОКБ или Сургут ОКБ - сопряжение с Мультивокс
        begin
          ShowMessage('Не установлен клиент MultiVox ...');
          Exit;
        end;
        MyShowShimok;
      end else
      begin
        frmMain.sPath := Reg.ReadString('Path');
        ShellExecute(Application.Handle,
                     pChar('open'),
                     pChar(frmMain.sPath+'MvLauncher.exe'),
                     PChar('-cmd:Load -StudyExternalID:'+IntToStr(pNAZID)),
                     pChar(frmMain.sPath),
                     SW_SHOWNORMAL);
      end;  
  finally
    Reg.Free;
  end;
end;

procedure TfrmProtocol.aSnimokLookInsideExecute(Sender: TObject);
begin
  Station := TStation.Create(Self);
  with Station do
    begin
      AutoConnect := False;
      ConnectKind := ckRunningOrNew;
      Station.QueryAndOpen(sGuid, frmMain.get_lookinside_archae);
    end;
end;

procedure TfrmProtocol.aStartEditExecute(Sender: TObject);
var vSotrHasSign: Boolean;
begin
  vSotrHasSign := IsSotrHasSignCryptoPro(frmMain.pSOTRID);

  if not vSotrHasSign then
    Application.MessageBox('Этот документ защищён цифровой подписью. Чтобы приступить к редактированию, необходимо получить у администратора цифровую подпись.',
      'Внимание!', MB_OK + MB_ICONWARNING)
  else
  begin
    IsReadOnly :=
      Application.MessageBox('Этот документ защищён цифровой подписью. Изменения, внесёные в режиме редактирования, будут сохранены, только если будет поставлена новая цифровая подпись, перейти в режим редактирования?',
        'Внимание!', MB_YESNO + MB_ICONWARNING) <> IDYES;
  end;
end;

procedure TfrmProtocol.aLoadTemplateExecute(Sender: TObject);
var memStream: TMemoryStream;
begin
  memStream := TMemoryStream.Create;
  try
    memStream.Position := 0;
    if LoadMedEditorFromTemplate(pSMIDID, memStream, rvs) then
      begin
        memStream.Position := 0;
        rveText.Reformat;
        if not rveText.InsertRVFFromStreamEd(memStream) then
          MessageDlg('Внимание. При загрузке шаблона возникли проблемы', mtError, [mbOK], 0);
        rveText.Format; // или все таки reformat нужно ?
      end;
  finally
    memStream.Free;
  end;
end;

procedure TfrmProtocol.DoRgVrach;
var ods : TOracleDataSet;
begin
  if frmmain.list_xray_curr_vrach_as_owner = 1 then
   begin
    cxsotr.editvalue := frmmain.psotrid;
    cxsotr.Enabled := (frmMain.get_can_change_vrach = 1) or (cxsotr.EditValue = null) or (cxsotr.EditValue = 1) or (cxsotr.Text = '');
   end
  else
   begin
    ods := TOracleDataSet.Create(nil);
    try
      ods.Session := frmMain.os;
      ods.SQL.Text := ' BEGIN '+
                      '   SELECT MAX(FN_NUM) INTO :VAL '+
                      '     FROM ASU.TIB '+
                      '    WHERE FK_PACID = :PFK_PEPLID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''RG_VRACH''); '+
                      '   IF :VAL IS NULL THEN '+
                      '     SELECT 0 INTO :VAL FROM DUAL; '+
                      '   END IF; '+
                      ' END; ';
      ods.DeclareAndSet('PFK_PEPLID', otInteger, pNAZID);
      ods.DeclareVariable('VAL', otInteger);
      ods.Open;
      if ods.GetVariable('VAL') <> 0 then
        cxSotr.EditValue := ods.GetVariable('VAL')
      else
        cxSotr.EditValue := frmMain.pSOTRID;
    finally
      ods.Free;
    end;
   end;
end;

procedure TfrmProtocol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if chkOtmetki.Checked then
    begin
      aOtmetkiExecute(nil);
    end;
end;

procedure TfrmProtocol.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  Reg : TRegIniFile;
  vUnload: Boolean;
begin
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\List_Vrach\Protocol\', FALSE) then
   begin
     Reg.CreateKey('\Software\Softmaster\List_Vrach\Protocol');
   end;
  try
    Reg.WriteInteger('\Software\Softmaster\List_Vrach\Protocol'+'\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_CHECK_OTMETKI',  StrToInt(BoolToStr(chkOtmetki.Checked)));
  except
  end;
  Reg.Free;

//--- выгрузка MvLauncher.exe для сопряжения с MultiVox
  if frmMain.sPath <> '' then
    begin
      With TOracleDataSet.Create(nil) do
      try
        vUnload:=True;
        Session := frmMain.os;
        Cursor := crSQLWait;
        SQL.Text := 'select ASU.PKG_SMINI.READSTRING (''XRAY'', ''UNLOAD_MULTIVOX'', ''0'') AS fUnload from dual' ;
        Open; First;
        if not Eof then
          vUnload:=(FieldByName('fUnload').AsString='0');  // если '0' или не задано то выгружаем
        Close;
      finally
        Free;
      end;
      if vUnload then      
        ShellExecute(Application.Handle,
                   pChar('open'),
                   pChar(frmMain.sPath+'MvLauncher.exe'),
                   pChar('-cmd:UnLoad -StudyExternalID:'+IntToStr(pNAZID)),
                   pChar('c:\Program Files\Alda Universal\MultiVox\Bin'),
                   SW_SHOWNORMAL);
    end;
  pWLSend(IntToStr(pNAZID));

end;

end.

