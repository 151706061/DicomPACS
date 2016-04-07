// !!! В поиске неправильно открываются формы мрт и флююро исследований если находимся в кабинете рентгена
// !!! dotextParametersNaz зачем выборка в первом же датасете из tnazis ??? тоже самое в форме ProtocolN
// !!! цифровая подпись не работает здесь

unit fProtocolMore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, RVScroll, RichView, RVEdit, ExtCtrls, ActnList,
  Oracle, StdCtrls, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxRadioGroup, cxGroupBox,
  cxGraphics, OracleData, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  DB, cxSpinEdit, cxCheckGroup, cxCustomData, cxStyles, cxTL,
  cxInplaceContainer, cxTLData, cxDBTL, cxCurrencyEdit, jvDBUtils, cxCheckBox,
  cxMemo, cxTimeEdit, DateUtils, cxRichEdit, RVStyle, frxClass, Menus,
  RichViewActions, Clipbrd, cxLookAndFeelPainters, cxButtons, frxDBSet,
  dxBarExtItems, Registry, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, cxClasses, Spellers, ShellAPI, fCryptUtils, uFileUtils, uSignUtils,
  cxVGrid, dxSkinscxPCPainter, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGridCustomView, cxGrid, cxButtonEdit, dxSkinOffice2007Green, IniFiles,
  dxSpellChecker, frxExportHTML, RVTable, uPrintType;

type
  TfrmProtocolMore = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
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
    frxRepProt: TfrxReport;
    dxContainerShowOtmetki: TdxBarControlContainerItem;
    actPass: TAction;
    bbControlProtocol: TdxBarButton;
    aControlProtocol: TAction;
    bSnimki: TdxBarButton;
    aSnimki: TAction;
    bbDigPodpis: TdxBarButton;
    acDigitPodpis: TAction;
    aStartEdit: TAction;
    bbStartEdit: TdxBarButton;
    dxBarButton1: TdxBarButton;
    aPodpis: TAction;
    BMBar2: TdxBar;
    bSaveTemplate: TdxBarButton;
    bLoadTemplate: TdxBarButton;
    bClear: TdxBarButton;
    bCheck: TdxBarButton;
    bCheckNone: TdxBarButton;
    bCut: TdxBarButton;
    bPaste: TdxBarButton;
    bCopy: TdxBarButton;
    bSet: TdxBarButton;
    cxGr: TcxGrid;
    TVLIST: TcxGridDBTableView;
    TVNUM: TcxGridDBColumn;
    TVNAME: TcxGridDBColumn;
    TVDOZA: TcxGridDBColumn;
    TVTIME: TcxGridDBColumn;
    cxGrLevel1: TcxGridLevel;
    imSign: TImage;
    Panel2: TPanel;
    dxBarDockControl2: TdxBarDockControl;
    chkOtmetki: TCheckBox;
    Panel1: TPanel;
    vGrPac1: TcxVerticalGrid;
    rowPac: TcxEditorRow;
    rowBirth: TcxEditorRow;
    rowKem: TcxEditorRow;
    rowNum: TcxEditorRow;
    vGrPac2: TcxVerticalGrid;
    rowMK: TcxEditorRow;
    rowAge: TcxEditorRow;
    rowSex: TcxEditorRow;
    Panel3: TPanel;
    rveText: TRichViewEdit;
    vGrZakl: TcxVerticalGrid;
    rowZakl: TcxEditorRow;
    dsList: TDataSource;
    odsList: TOracleDataSet;
    vGrPodpisi: TcxVerticalGrid;
    merDateTime: TcxMultiEditorRow;
    merLaborantVrach: TcxMultiEditorRow;
    vGrSignal: TcxVerticalGrid;
    rowEdit: TcxEditorRow;
    rowTub: TcxEditorRow;
    rowStatusMK: TcxEditorRow;
    rowReanim: TcxEditorRow;
    stRep: TcxStyleRepository;
    stFIO: TcxStyle;
    stIssl: TcxStyle;
    stSignal: TcxStyle;
    rowPacID: TcxEditorRow;
    frxDBProt: TfrxDBDataset;
    bbPasteImage: TdxBarButton;
    aPasteImage: TAction;
    OpenDialog1: TOpenDialog;
    SpellChecker1: TSpellChecker;
    dbPrintMenu: TdxBarPopupMenu;
    aPrintOffice: TAction;
    dxBarButton2: TdxBarButton;
    frxHTMLExport1: TfrxHTMLExport;
    dxBarButton4: TdxBarButton;
    InsTable: TAction;
    dbTableMenu: TdxBarPopupMenu;
    dxBarButton6: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton7: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton5: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    InsCol: TAction;
    InsRow: TAction;
    DelTable: TAction;
    DelCol: TAction;
    DelRow: TAction;
    dxBarButton12: TdxBarButton;
    MergeCells: TAction;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxRepProtGetValue(const VarName: String;
      var Value: Variant);
    procedure aHistoryExecute(Sender: TObject);
    procedure rveTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure aOtmetkiExecute(Sender: TObject);
    procedure aResumeExecute(Sender: TObject);
    procedure aSaveTemplateExecute(Sender: TObject);
    procedure aLoadTemplateExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actPassExecute(Sender: TObject);
    procedure aControlProtocolExecute(Sender: TObject);
    procedure odsSotrBeforeOpen(DataSet: TDataSet);
    procedure rveTextSpellingCheck(Sender: TCustomRichView; const AWord: string;
      StyleNo: Integer; var Misspelled: Boolean);
    procedure aSnimkiExecute(Sender: TObject);
    procedure acDigitPodpisExecute(Sender: TObject);
    procedure aStartEditExecute(Sender: TObject);
    procedure frxRepProtBeforePrint(Sender: TfrxReportComponent);
    procedure aPodpisExecute(Sender: TObject);
    procedure bClearClick(Sender: TObject);
    procedure bCheckClick(Sender: TObject);
    procedure bCheckNoneClick(Sender: TObject);
    procedure bCutClick(Sender: TObject);
    procedure bCopyClick(Sender: TObject);
    procedure bPasteClick(Sender: TObject);
    procedure rowZaklEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure odsListBeforeOpen(DataSet: TDataSet);
    procedure odsListApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: string);
    procedure TVLISTFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure aPasteImageExecute(Sender: TObject);
    procedure aPrintOfficeExecute(Sender: TObject);
    procedure InsTableExecute(Sender: TObject);
    procedure InsColExecute(Sender: TObject);
    procedure InsRowExecute(Sender: TObject);
    procedure DelTableExecute(Sender: TObject);
    procedure DelColExecute(Sender: TObject);
    procedure DelRowExecute(Sender: TObject);
    procedure MergeCellsExecute(Sender: TObject);
  private
    sSPECNAME : String; // специализация сотрудника
    sFC_TYPE : string;
    pPACID, pPEPLID, pSMIDID, pNAZID : Integer;
    Russian : HKL;
    FUseDigitalSign: Boolean; // Флаг выставляется если используется цифровая подпись
    FCryptoProUtils: TCryptoProUils;
    FSQLRuleID: Integer;
    FIsSign: Boolean;
    FIsReadOnly: Boolean; // Поставлена ЭЦП
    FSignSotrID: Integer; // SotrID, сотрудника поставившего подпись, если нет, то -1
    FSignDT: TDateTime;
    FSignSotrName: String; // Фамилия и инициалы сотрудника поставившего подпись
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
  public
    pOWNERID : Integer;
    isResult : Boolean; // есть ли снимки от MultiVox?
    procedure DoShowfrmProtocol(nAmbul, nPACID, nPEPLID : Integer; nSMIDID : Integer; nNAZID : Integer=0; nREANIM : Integer=0);
  end;

var
  frmProtocolMore: TfrmProtocolMore;
const
  SQLRuleTableName = 'asu.tnazis';
  cTmpStrRepl = '##########';

implementation

uses fMain, fAllHistory, fOtmetki, fSetResume, fMedEditorTemplates, RVFuncs, uPrintDocument, 
  fOtmetkiFlu, fPass, fControlProtocol, uReportUtils{, uCommonXray};

{$R *.dfm}

procedure TfrmProtocolMore.DoSetEditRights;
var ods : TOracleDataSet;
    kolvoParam : Integer;
    kolvoDays : Integer;
begin
  if frmMain.bIsAdmin <> 1 then
    begin
      aControlProtocol.Visible := False;        // 1. если пользователь не входит в группу "Администраторы" --имеет специализацию 'зав.отд.'
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
            vGrPodpisi.Enabled := False;
            rveText.Enabled := False;
            vGrZakl.Enabled := False;
            cxGr.Enabled := False;
            aResume.Enabled := False;
            actPass.Enabled := False;
            aSave.Enabled := False;
            aPodpis.Enabled := False;
            chkOtmetki.Enabled := False;
            aOtmetki.Enabled := False;
            aSaveTemplate.Enabled := False;
            aLoadTemplate.Enabled := False;
            aControlProtocol.Enabled := False;
            bClear.Enabled := False;
            bCut.Enabled := False;
            bCopy.Enabled := False;
            bPaste.Enabled := False;
            bLoadTemplate.Enabled := False;
            bSaveTemplate.Enabled := False;
          end else
          begin
            rowEdit.Visible := False;
            rowEdit.Properties.Value := '';
            vGrPodpisi.Enabled := True;
            rveText.Enabled := True;
            vGrZakl.Enabled := True;
            cxGr.Enabled := True;
            aResume.Enabled := True;
            actPass.Enabled := True;
            aSave.Enabled := True;
            aPodpis.Enabled := True;
            chkOtmetki.Enabled := True;
            aOtmetki.Enabled := True;
            aSaveTemplate.Enabled := True;
            aLoadTemplate.Enabled := True;
            aControlProtocol.Enabled := True;
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
      aControlProtocol.Visible := True;
    end;
end;

procedure TfrmProtocolMore.DoSetEnabledPodpisClose(value: boolean);
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
  vGrPodpisi.Enabled := value;
  cxGr.Enabled := value;
end;

procedure TfrmProtocolMore.DoShowButtons;
begin
// показывать или не показывать кнопку "зачесть"
  if frmMain.odsKab.FieldByName('is_flu').AsInteger = 1 then
    begin
      actPass.Visible := False;
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
    end;
//показывать или не показывать кнопку "снимки"
  if (frmMain.GET_DB_NAME = 'H') or (frmMain.GET_DB_NAME = 'SO') then // если база Ханты ОКБ или Сургут ОКБ - сопряжение с Мультивокс
    begin
      if frmMain.get_dicom_show = '-1' then
        begin
          aSnimki.Visible := isResult = True;
        end else
        begin
          aSnimki.Visible := False;
        end;
    end else
    begin
      aSnimki.Visible := frmMain.get_dicom_show = '-1';
    end;
end;

procedure TfrmProtocolMore.DoShowfrmProtocol(nAMBUL, nPACID, nPEPLID : Integer; nSMIDID : Integer; nNAZID : Integer; nREANIM : Integer);
var ods : TOracleDataSet;
begin
  TVList.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_vrach\fProtocolMore\TVListVrach_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVList');
  ods := TOracleDataSet.Create(nil);
  try
    Screen.Cursor := crSQLWait;
//--- присваиваем константы
    pPACID := nPACID;
    pPEPLID := nPEPLID;
    pSMIDID := nSMIDID;
    pNAZID := nNAZID;
//--- видимые элементы
    rowStatusMK.Visible := False;
    rowEdit.Visible := False;
    rowReanim.Visible := False;
    rowTub.Visible := False;
    if pOWNERID = 0 then
      begin
        ods.Session := frmMain.os;
        ods.SQL.Text := ' SELECT FK_OWNER FROM ASU.TSMID WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, nSMIDID);
        ods.Open;
        pOWNERID := ods.FieldByName('FK_OWNER').AsInteger;
      end;
    TVDOZA.Visible := pOWNERID <> frmMain.GET_XRAY_MRT;  // графа "Доза" не показывается для исследований МРТ
    rowReanim.Visible := nREANIM = 1;
    aPodpis.Visible := frmMain.get_show_podpis = '-1'; // кнопка "Подпись" показывается в зависимости от настроек
//--- Заполняем данные
    rowPacID.Properties.Value := nPACID;
    case nAMBUL of
    0: DoTextTypeStac;  // стационарный
    1: DoTextTypeAmbul; // амбулаторный
    end;

    if pNAZID <> 0 then
      begin
        DoTextParametersNaz(nAMBUL);
        odsList.Open;
      end;
    DoRgVrach;
    DoTextProtocol;
    DoShowButtons;
    DoSetEditRights;
    DoTub;
//--- Работа с ЭЦП
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
//-->> Скрываем заголовок сигнальной информации если ни один параметр из сиг. информации не виден
    if (rowStatusMK.Visible = False) and (rowTub.Visible = False) and (rowEdit.Visible = False) and (rowReanim.Visible = False) then
      begin
        vGrSignal.Visible := False;
        frmProtocolMore.Height := frmProtocolMore.Height - vGrSignal.Height;
      end else
      begin
        vGrSignal.Visible := True;
      end;
  finally
    ods.Free;
    Screen.Cursor := crDefault;
  end;
end;

function TfrmProtocolMore.DoSignCryptoPro: Boolean;
var vSQLRuleID: Integer;
begin
  vSQLRuleID := FCryptoProUtils.GetRuleIdByTablename(SQLRuleTableName);
  Result := FCryptoProUtils.SignBySotr(vSQLRuleID, pNAZID, frmMain.pSOTRID) > 0;
end;

procedure TfrmProtocolMore.DoTextTypeAmbul;
var ods : TOracleDataSet;
begin
  CheckEnabledControls;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT TAMBULANCE.FC_FAM, TAMBULANCE.FC_IM, TAMBULANCE.FC_OTCH, '+
			              '        DECODE(TO_CHAR(TAMBULANCE.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), TAMBULANCE.FD_ROJD) FD_ROJD, '+
              			'        TAMBULANCE.FP_SEX, '+
                    '        ASU.GET_IB(:PFK_ID) AS NUMDOC, '+
                    '        ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TAMBULANCE.FK_ID) AS PACAGE '+
                    '   FROM ASU.TAMBULANCE '+
                    '  WHERE TAMBULANCE.FK_ID=:PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pPACID);
    ods.Open;
    rowPac.Properties.Value := ods.FieldByName('FC_FAM').AsString+' '+ods.FieldByName('FC_IM').AsString+' '+ods.FieldByName('FC_OTCH').AsString;
    rowMK.Properties.Value := ods.FieldByName('NUMDOC').AsString;
    rowBirth.Properties.Value := ods.FieldByName('FD_ROJD').AsDateTime;
    rowAge.Properties.Value := IntToStr(ods.FieldByName('PACAGE').AsInteger);
    if ods.FieldByName('FP_SEX').AsInteger = 1 then
      rowSex.Properties.Value := 'мужской'
    else
      rowSex.Properties.Value := 'женский';
  finally
    ods.Free;
  end;  
end;

procedure TfrmProtocolMore.aSaveExecute(Sender: TObject);
begin
  cxGr.SetFocus;
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
        TVList.OnFocusedRecordChanged := nil;
        if DoCheckParameters = 0 then
          exit;
        DoInsertEditParametersNaz;
        if aPodpis.Visible = False then // подписываем при условии, что кнопка "Подпись" не видна
          DoPodpis;
        if frmMain.get_db_name <> 'SO' then ModalResult := MrOK;
      finally
        TVList.OnFocusedRecordChanged := TVLISTFocusedRecordChanged; 
        Cursor := crDefault;
      end;
    end;
end;

procedure TfrmProtocolMore.aCancelExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmProtocolMore.FormCreate(Sender: TObject);
var ods : TOracleDataSet;
begin
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
  if odsSotr.Active = False then
    odsSotr.Active := True;
//  if odsRVData.Active = False then
//    odsRVData.Active := True;
end;

function TfrmProtocolMore.DoCheckParameters : Integer;
begin
//  if cxdeDateProtocol.Text = '' then
//    begin
//      Application.MessageBox('Вам необходимо указать ДАТУ проведения исследования!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
//      cxdeDateProtocol.SetFocus;
//      Result:= 0;
//      exit;
//    end;

  Result := 1;
end;

procedure TfrmProtocolMore.DoTextTypeStac;
var ods : TOracleDataSet;
begin
  CheckEnabledControls;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT TKARTA.FC_FAM, TKARTA.FC_IM, TKARTA.FC_OTCH, '+
  									'        DECODE(TO_CHAR(TKARTA.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), TKARTA.FD_ROJD) FD_ROJD, '+
	  								'        TKARTA.FP_SEX, '+
                    '        ASU.GET_IB(:PFK_ID) AS NUMDOC, '+
                    '        TKARTA.FP_TEK_COC, '+
                    '        ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TKARTA.FK_ID) AS PACAGE '+
                    '   FROM ASU.TKARTA '+
                    '  WHERE TKARTA.FK_ID=:PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pPACID);
    ods.Open;
    rowPac.Properties.Value := ods.FieldByName('FC_FAM').AsString+' '+ods.FieldByName('FC_IM').AsString+' '+ods.FieldByName('FC_OTCH').AsString;
    rowMK.Properties.Value := ods.FieldByName('NUMDOC').AsString;
    rowBirth.Properties.Value := ods.FieldByName('FD_ROJD').AsDateTime;
    rowAge.Properties.Value := IntToStr(ods.FieldByName('PACAGE').AsInteger);
    rowStatusMK.Visible := ods.FieldByName('FP_TEK_COC').AsInteger = 3;
    if ods.FieldByName('FP_SEX').AsInteger = 1 then
      rowSex.Properties.Value := 'мужской'
    else
      rowSex.Properties.Value := 'женский';
  finally
    ods.Free;
  end;
end;

procedure TfrmProtocolMore.DoTub;
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
        rowTub.Visible := True;
        rowTub.Properties.Value := 'На учете в тубдиспансере. '+'Периодичность: '+ods.FieldByName('REC').AsString+
                                   ' до '+DateTimeToStr(ods.FieldByName('FD_END').AsDateTime);
      end else
      begin
        rowTub.Visible := False;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmProtocolMore.CheckEnabledControls;
begin
//
end;

procedure TfrmProtocolMore.DoInsertEditParametersNaz;
var oq : TOracleQuery;
    ods : TOracleDataSet;
    memStream, memStream1 : TMemoryStream;
begin
  oq := TOracleQuery.Create(nil);
  ods := TOracleDataSet.Create(nil);
  memStream := TMemoryStream.Create;
  memStream1 := TMemoryStream.Create;
  memStream1.Position := 0;
  try
    rveText.SetSelectionBounds(0, rveText.GetOffsBeforeItem(0), rveText.ItemCount - 1, rveText.GetOffsAfterItem(rveText.ItemCount - 1));
  except
  end;
  rveText.SaveRVFToStream(memStream1, false);
  try
    oq.Session := frmMain.os;
    ods.Session := frmMain.os;
    odsList.First;
    while not odsList.Eof do
      begin
        odsRVData.Close;
        odsRVData.SetVariable('fk_pacid', odsList.FieldByName('FK_ID').AsInteger);
        odsRVData.Open;
//--- врач
        if merLaborantVrach.Properties.Editors[0].Value <> 0 then
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
            ods.DeclareAndSet('PFK_PACID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
            ods.DeclareAndSet('PFN_NUM', otInteger, merLaborantVrach.Properties.Editors[0].Value);
            ods.DeclareAndSet('PFK_VRACHID', otInteger, frmMain.pSOTRID);
            ods.Open;
            frmMain.os.Commit;
          end;
//--- Заключение
        if (rowZakl.Properties.Value <> null) and (rowZakl.Properties.Value <> '') then
          begin
	          if rowZakl.Tag = 0 then
              begin
	              oq.DeleteVariables;
	              oq.SQL.Text := ' DECLARE '+
	      			                 '   nSMID21 NUMBER; '+
	      			                 '   Cnt21 NUMBER; '+
	      			                 ' BEGIN '+
	      			                 '   SELECT COUNT(FK_ID) INTO Cnt21 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''); '+
	      			                 ' IF Cnt21 > 0 THEN '+
	      		                   '   UPDATE TIB SET FC_CHAR = :pFC_CHAR21, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''); '+
			      	                 ' ELSE '+
			      	                 '   SELECT FK_ID INTO nSMID21 FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''; '+
				                       '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :PFC_CHAR21, nSMID21, nSMID21, :pFK_VRACHID); '+
				                       ' END IF; '+
				                       ' END; ';
                oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
	              oq.DeclareAndSet('pFC_CHAR21', otString, rowZakl.Properties.Value);
	              oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID); // ??? какая логика работы сохраняется под тем кто вошел в систему или по тем кто стоит в выпадающем списке 
	              oq.Execute;
	              frmMain.os.Commit;
	        end else
	        begin
	          oq.DeleteVariables; // !!! почему не сохраняется в FN_NUM
	          oq.SQL.Text := ' DECLARE '+
	                   			 '   nSMID21 NUMBER; '+
				                   '   Cnt21 NUMBER; '+
				                   ' BEGIN '+
				                   '   SELECT COUNT(FK_ID) INTO Cnt21 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''); '+
			                     ' IF Cnt21 > 0 THEN '+
		                  	   '   UPDATE TIB SET FC_CHAR = :pFC_CHAR21, FK_BID = :PFK_BID21, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''); '+
			                  	 ' ELSE '+
			                   	 '   SELECT FK_ID INTO nSMID21 FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''; '+
			                   	 '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_BID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :PFC_CHAR21, :PFK_BID21, nSMID21, nSMID21, :pFK_VRACHID); '+
			                  	 ' END IF; '+
			                  	 ' END; ';
            oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
	          oq.DeclareAndSet('pFC_CHAR21', otString, rowZakl.Properties.Value);
            oq.DeclareAndSet('pFK_BID21', otInteger, rowZakl.Tag);
	          oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
	          oq.Execute;
	          frmMain.os.Commit;
	        end;
	      end;
//--- TRICHVIEWDATA
      if odsRVData.RecordCount = 0 then
        odsRVData.Insert
      else
        odsRVData.Edit;
      memStream1.Position := 0;
      rveText.LoadRVFFromStream(memStream1);
      rveText.SaveRVFToStream(memStream,False);
//сохраняем в BLOB
      memStream.Position := 0;
      TBlobField(odsRVData.FieldByName('FB_BLOB')).LoadFromStream(memStream);
      memStream.Clear;
//сохраняем в обычный текст
	    rveText.SaveTextToStream('',memStream,0,False,True);
	    memStream.Position := 0;
      TBlobField(odsRVData.FieldByName('FB_TEXT')).LoadFromStream(memStream);
      memStream.Clear;
//сохраняем в HTML
      if (rowZakl.Properties.Value <> null) and (rowZakl.Properties.Value <> '') then
        rveText.Add('Заключение:'+rowZakl.Properties.Value, 0);
	    rveText.SaveHTMLToStream(memStream,'','',IntToStr(odsList.FieldByName('FK_ID').AsInteger)+'_',[rvsoOverrideImages,rvsoMiddleOnly,rvsoUseCheckpointsNames]);
	    memStream.Position := 0;
	    TBlobField(odsRVData.FieldByName('FB_HTML')).LoadFromStream(memStream);

      memStream1.Position := 0;
      rveText.LoadRVFFromStream(memStream1);
      rveText.Reformat;

	    memStream.Clear;

      odsRVData.FieldByName('FN_COMPRESS').AsInteger := 1;
      odsRVData.FieldByName('FK_PACID').AsInteger := odsList.FieldByName('FK_ID').AsInteger;
      odsRVData.Post;
      frmMain.os.Commit;
      odsList.Next;
    end;
  finally
    ods.Free;
    oq.Free;
    memStream.Free;
    memStream1.Free;
  end;
end;

procedure TfrmProtocolMore.DoTextParametersNaz(nAMBUL : Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;  
    ods.SQL.Text := ' SELECT FK_NAZTYPEID, FD_RUN, FK_ISPOLID, FC_TYPE, '+#13+
		                '       (SELECT MAX(FC_CHAR) '+#13+
                    '          FROM asu.TIB '+#13+
                    '         WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME'')) AS XRAY_VRACH_RESUME, '+#13+
		                '       (SELECT asu.DO_VRACHFIO(MAX(FN_NUM)) '+#13+
                    '          FROM asu.TIB '+#13+
                    '         WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''RG_LABORANT'')) AS LABFIO, '+#13+
		                '       (SELECT MAX(FC_CHAR) '+#13+
                    '          FROM asu.TIB '+#13+
                    '         WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL'' OR FC_SYNONIM = ''XRAY_FLU_NUMBER'')) AS NUMBER_ISSL '+#13+
		                '   FROM ASU.TNAZIS WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;
    rowNum.Properties.Value := ods.FieldByName('NUMBER_ISSL').AsString;
    rowZakl.Properties.Value := ods.FieldByName('XRAY_VRACH_RESUME').AsString;
    merLaborantVrach.Properties.Editors[1].Value := ods.FieldByName('LABFIO').AsString;
    merDateTime.Properties.Editors[0].Value := ods.FieldByName('FD_RUN').AsDateTime;
    merDateTime.Properties.Editors[1].Value := ods.FieldByName('FD_RUN').AsDateTime;
    sFC_TYPE := ods.FieldByName('FC_TYPE').AsString;
//--- кем направлен
    if nAMBUL = 1 then
      begin
        ods.DeleteVariables;   // для амбулаторных
        ods.Close;
        ods.SQL.Text := ' SELECT DECODE(FC_CHAR, NULL, ASU.GET_SMIDNAME(TIB.FK_SMID), FC_CHAR) AS KEM_NAPRAVLEN '+#13+
                        '   FROM ASU.TIB '+#13+
                        '  WHERE FK_PACID = :PFK_ID '+#13+
                        '    AND FK_SMID IN (SELECT FK_ID '+#13+
                        '                      FROM ASU.TSMID '+#13+
                        '                    START WITH FC_SYNONIM = ''KEM_NAPRAVLEN'' '+#13+
                        '                    CONNECT BY PRIOR FK_ID = FK_OWNER '+#13+
                        '                    UNION ALL '+#13+
                        '                    SELECT FK_ID AS FC_NAME FROM ASU.TCOMPANY '+#13+
                        '                    START WITH FC_SYNONIM = ''ROOT_LPU'' '+#13+
                        '                    CONNECT BY PRIOR FK_ID = FK_OWNER) ';
        ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        ods.Open;
     		rowKem.Properties.Value := ods.FieldByName('KEM_NAPRAVLEN').AsString;
      end else
      begin
        ods.DeleteVariables;  // для стационарных
        ods.Close;
        ods.SQL.Text := ' SELECT ASU.GET_VRACHFCOTDEL(FK_VRACHID)||'' ''||''-''||'' ''||ASU.DO_VRACHFIO(FK_VRACHID) AS KEM_NAPRAVLEN '+#13+
                        '   FROM ASU.TNAZIS '+#13+
                        '  WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        ods.Open;
        rowKem.Properties.Value := ods.FieldByName('KEM_NAPRAVLEN').AsString;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmProtocolMore.FormShow(Sender: TObject);
var Reg : TRegIniFile;
     id : Integer;
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
end;

procedure TfrmProtocolMore.DrowDigSign(aImage: TImage; APrintText: string; aDataTime: TDateTime; ADSCorrect: Boolean);
var vBitmap: TBitmap;
begin
  vBitmap := TReportUtils.CreateDigSignBMP(APrintText, aDataTime, ADSCorrect, false);
  aImage.Width := vBitmap.Width;
  aImage.Picture.Assign(vBitmap);
  vBitmap.Free;
end;

procedure TfrmProtocolMore.bCutClick(Sender: TObject);
begin
  rveText.CutDef;
end;

procedure TfrmProtocolMore.bPasteClick(Sender: TObject);
begin
  rveText.PasteText;
  rveText.Reformat;
end;

procedure TfrmProtocolMore.bCopyClick(Sender: TObject);
begin
  rveText.CopyText;
end;

procedure TfrmProtocolMore.bCheckClick(Sender: TObject);
begin
  rveText.StartLiveSpelling;
end;

procedure TfrmProtocolMore.bCheckNoneClick(Sender: TObject);
begin
  rveText.ClearLiveSpellingResults;
end;

procedure TfrmProtocolMore.bClearClick(Sender: TObject);
begin
  if Application.MessageBox('Вы собираетесь очистить текст протокола.' + #13 + #10 + 'Уверены?', 'Вопрос', MB_ICONQUESTION+MB_OKCANCEL)= IDOk then
  begin
    rveText.Clear;
    rveText.Format;
    rveText.SetFocus;
  end;
end;

procedure TfrmProtocolMore.DoPodpis;
var oq : TOracleQuery;
    ods : TOracleDataSet;
begin
  oq := TOracleQuery.Create(nil);
  ods := TOracleDataSet.Create(nil);
  odsList.First;
  try
  while not odsList.Eof do
    begin
      oq.Session := frmMain.os;
      ods.Session := frmMain.os;
//--- TNAZIS
      oq.DeleteVariables;
      oq.SQL.Text := ' begin '+#13+
                     '   asu.insnaz.bins := false; '+#13+
                     ' end; ';
      oq.Execute;
      oq.SQL.Text := ' update asu.tnazis '+#13+
                     '    set fk_nazsosid = :pfk_nazsosid, fk_ispolid = :pfk_ispolid, fd_run = :pfd_run, fl_in_raspis = 1 '+#13+
                     '  where fk_id = :pfk_nazid ';
      oq.DeclareAndSet('pFK_ISPOLID', otInteger, merLaborantVrach.Properties.Editors[0].Value);
      oq.DeclareAndSet('pFD_RUN', otDate, StrToDateTime(DateToStr(merDateTime.Properties.Editors[0].Value)+' '+FormatDateTime('hh:nn:ss', IncSecond(merDateTime.Properties.Editors[1].Value, 1))));
      oq.DeclareAndSet('pFK_NAZID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
      oq.DeclareAndSet('pFK_NAZSOSID', otInteger, GET_VIPNAZ);
      oq.Execute;
      frmMain.os.Commit;
//--- VRES
      ods.DeleteVariables;
      ods.Close;
      ods.SQL.Text := ' MERGE INTO ASU.VRES '+#13+
                      '  USING DUAL ON (FK_NAZID = :PFK_NAZID) '+#13+
                      ' WHEN MATCHED THEN UPDATE SET FK_SMID=:PFK_SMID, FD_INS=:PFD_INS, FK_VRACHID=:PFK_VRACHID, FK_SOS=:PFK_SOS '+#13+
                      '                    WHERE FK_NAZID = :PFK_NAZID '+#13+
                      ' WHEN NOT MATCHED THEN INSERT(FK_SMID, FD_INS, FC_RES, FC_TYPE, FK_VRACHID, FK_PACID, FK_PATID, FK_NAZID, FK_SOS) '+#13+
                      '                       VALUES(:pFK_SMID, :pFD_INS, '''', ''TEXT'', :PFK_VRACHID, :pFK_PACID, 0, :pFK_NAZID, :PFK_SOS) ';
      ods.DeclareAndSet('PFK_NAZID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
      ods.DeclareAndSet('PFK_SMID', otInteger, odsList.FieldByName('FK_SMID').AsInteger);
      ods.DeclareAndSet('pFD_INS', otDate, StrToDateTime(DateToStr(merDateTime.Properties.Editors[0].Value)+' '+FormatDateTime('hh:nn:ss', IncSecond(merDateTime.Properties.Editors[1].Value, 1))));
      ods.DeclareAndSet('PFK_VRACHID', otInteger, merLaborantVrach.Properties.Editors[0].Value);
      ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
      ods.DeclareAndSet('PFK_SOS', otInteger, GET_VIPNAZ);
      ods.Open;
      frmMain.os.Commit;
//--- TPODPISNAZ
      ods.DeleteVariables;
      ods.Close;
      ods.SQL.Text := ' MERGE INTO ASU.TPODPISNAZ '+#13+
                      '  USING DUAL ON (FK_NAZID = :PFK_NAZID AND FK_SOTRID = :pFK_SOTRID) '+#13+
                      ' WHEN MATCHED THEN UPDATE SET FK_SOS=:PFK_SOS, FD_INS = :PFD_INS '+#13+
                      '                    WHERE FK_NAZID = :PFK_NAZID AND FK_SOTRID = :pFK_SOTRID '+#13+
                      ' WHEN NOT MATCHED THEN INSERT(FK_NAZID, FK_SOTRID, FK_SOS, FD_DATE, FD_INS) '+#13+
                      '                       VALUES(:pFK_NAZID, :pFK_SOTRID, :PFK_SOS, SYSDATE, :pFD_INS) ';
      ods.DeclareAndSet('pFK_NAZID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
      ods.DeclareAndSet('pFK_SOTRID', otInteger, merLaborantVrach.Properties.Editors[0].Value);
      ods.DeclareAndSet('PFK_SOS', otInteger, GET_VIPNAZ);
      ods.DeclareAndSet('pFD_INS', otDate, StrToDateTime(DateToStr(merDateTime.Properties.Editors[0].Value)+' '+FormatDateTime('hh:nn:ss', IncSecond(merDateTime.Properties.Editors[1].Value, 1))));
      ods.Open;
      frmMain.os.Commit;
      odsList.Next;
    end;
  finally
    ods.Free;
    oq.Free;
  end;
end;

procedure TfrmProtocolMore.aPasteImageExecute(Sender: TObject);
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

procedure TfrmProtocolMore.aPodpisExecute(Sender: TObject);
begin
  cxGr.SetFocus;
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
        ModalResult := MrOK;
      finally
        Cursor := crDefault;
      end;
    end;
end;

procedure TfrmProtocolMore.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  rveText.SetFocus;
  rveText.SetSelectionBounds(0, rveText.GetOffsBeforeItem(0), rveText.ItemCount - 1, rveText.GetOffsAfterItem(rveText.ItemCount - 1));
  Application.ProcessMessages;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select ts_sprav.fc_name from asu.ts_sprav, asu.tsotr where tsotr.fk_spravid = ts_sprav.fk_id and tsotr.fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, merLaborantVrach.Properties.Editors[0].Value);
    ods.Open;
    sSpecName := ods.FieldByName('fc_name').AsString;
  finally
    ods.Free;
  end;
  frxRepProt.FindObject('memDozaCap').Visible := pOWNERID <> frmMain.GET_XRAY_MRT;
  frxRepProt.FindObject('memDozaData').Visible := pOWNERID <> frmMain.GET_XRAY_MRT;
  frxRepProt.FindObject('memDig').Visible := (FUseDigitalSign) and (imSign.Visible = True);
  frxRepProt.ShowReport;
end;                                     

procedure TfrmProtocolMore.aPrintOfficeExecute(Sender: TObject);
var ods : TOracleDataSet;
begin                      // Печать в Office
  rveText.SetFocus;
  rveText.SetSelectionBounds(0, rveText.GetOffsBeforeItem(0), rveText.ItemCount - 1, rveText.GetOffsAfterItem(rveText.ItemCount - 1));
  Application.ProcessMessages;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select ts_sprav.fc_name from asu.ts_sprav, asu.tsotr where tsotr.fk_spravid = ts_sprav.fk_id and tsotr.fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, merLaborantVrach.Properties.Editors[0].Value);
    ods.Open;
    sSpecName := ods.FieldByName('fc_name').AsString;
  finally
    ods.Free;
  end;
  frxRepProt.FindObject('memDozaCap').Visible := pOWNERID <> frmMain.GET_XRAY_MRT;
  frxRepProt.FindObject('memDozaData').Visible := pOWNERID <> frmMain.GET_XRAY_MRT;
  frxRepProt.FindObject('memDig').Visible := (FUseDigitalSign) and (imSign.Visible = True);
//  if pIsOffice then
    CmnHeadPartRep( frxRepProt, frxHTMLExport1, nil, rveText, 'Memo8' );
//  else
//    frxRepProt.ShowReport;
end;
procedure TfrmProtocolMore.frxRepProtBeforePrint(Sender: TfrxReportComponent);
begin
  if Sender.Name = 'Picture1' then
    TfrxPictureView(Sender).Picture.Assign(frmProtocolMore.imSign.picture);
end;

procedure TfrmProtocolMore.frxRepProtGetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'PACFIO' then Value := rowPac.Properties.Value;
  if VarName = 'DATE_ROJD' then Value := rowBirth.Properties.Value;
  if VarName = 'NUMISSL' then Value := rowNum.Properties.Value;
  if VarName = 'DATEISSL' then Value := DateTimeToStr(trunc(merDateTime.Properties.Editors[0].Value))+' '+FormatDateTime('hh:nn', merDateTime.Properties.Editors[1].Value);
  if VarName = 'SOTR' then Value := odsSotr.FieldByName('FC_NAME').AsString;
  if rowZakl.Properties.Value <> '' then
  begin
    if VarName = 'TEXTISSL' then Value := rveText.GetSelText+#13#10+'Заключение: '+rowZakl.Properties.Value;
  end else
  begin
    if VarName = 'TEXTISSL' then Value := rveText.GetSelText;
  end;
  if VarName = 'KABINET' then Value := frmMain.odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'PHONEKAB' then Value := frmMain.odsKab.FieldByName('FC_PHONE').AsString;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'SOTRSPEC' then Value := sSpecName;
end;

procedure TfrmProtocolMore.InsColExecute(Sender: TObject);
begin  //
  InsColTableIntoRVEditor( rveText );
end;

procedure TfrmProtocolMore.InsRowExecute(Sender: TObject);
begin  //
  InsRowTableIntoRVEditor( rveText );
end;

procedure TfrmProtocolMore.InsTableExecute(Sender: TObject);
begin  //
  InsTableIntoRVEditor( rveText );
end;

procedure TfrmProtocolMore.DelColExecute(Sender: TObject);
begin  //
  DelColTableIntoRVEditor( rveText );
end;

procedure TfrmProtocolMore.DelRowExecute(Sender: TObject);
begin  //
  DelRowTableIntoRVEditor( rveText );
end;

procedure TfrmProtocolMore.DelTableExecute(Sender: TObject);
begin  //
  DelTableIntoRVEditor( rveText );
end;

procedure TfrmProtocolMore.MergeCellsExecute(Sender: TObject);
begin
  UnionCellRVEditor( rveText );
end;

function TfrmProtocolMore.IsNazSignedCryptoPro(aNazID: Integer; var aSotrName: String; var aSotrID: Integer; var aSignDT: TDateTime): Boolean;
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

function TfrmProtocolMore.IsSotrHasSignCryptoPro(aSotrID: Integer): Boolean;
begin
  Result := FCryptoProUtils.IsSotrHasKey(frmMain.pSOTRID);
end;

procedure TfrmProtocolMore.acDigitPodpisExecute(Sender: TObject);
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

procedure TfrmProtocolMore.aControlProtocolExecute(Sender: TObject);
var    ods : TOracleDataSet;
    odsNaz : TOracleDataSet;
        oq : TOracleQuery;
    idSmid : Integer;
    nIDNaz : Integer;
    memStream : TMemoryStream;
begin
  odsList.First;
  ods := TOracleDataSet.Create(nil);
  odsNaz := TOracleDataSet.Create(nil);
  Application.CreateForm(TfrmControlProtocol, frmControlProtocol);
  try
    frmControlProtocol.aSave.Enabled := aSave.Enabled;
    frmControlProtocol.aDel.Enabled := aSave.Enabled;
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID, FC_NAME FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_CONTROL_PROTOCOL'' ';
    ods.Open;
    idSmid := ods.FieldByName('FK_ID').AsInteger;
    odsNaz.Session := frmMain.os;
    odsNaz.Cursor := crSQLWait;
    odsNaz.SQL.Text := ' SELECT FK_ID FROM ASU.VNAZ WHERE FK_SMID =:PFK_SMID AND FK_NAZOWNER = :PFK_NAZOWNER ';
    odsNaz.DeclareAndSet('PFK_SMID', otInteger, idSmid);
    odsNaz.DeclareAndSet('PFK_NAZOWNER', otInteger, odsList.FieldByName('fk_id').AsInteger);
    odsNaz.Open;
    nIDNaz := odsNaz.FieldByName('FK_ID').AsInteger;
    frmControlProtocol.INSERT_MODE := odsNaz.RecordCount = 0;
    frmControlProtocol.DoShowFormControlProtocol(idSmid, nIDNaz, rowNum.Properties.Value);
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
                             ' UPDATE ASU.VNAZ SET FD_RUN = :PFD_RUN, FK_ISPOLID = :PFK_ISPOLID WHERE FK_ID = :PFK_ID; '+
                             ' UPDATE ASU.VRES SET FD_INS = :PFD_RUN, FK_VRACHID = :PFK_ISPOLID WHERE FK_NAZID = :PFK_ID; '+
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
              oq.DeclareAndSet('PFK_NAZOWNER', otInteger, odsList.FieldByName('fk_id').AsInteger);
              oq.DeclareVariable('PFK_ID', otInteger);
              oq.Execute;
              nIDNaz := oq.GetVariable('PFK_ID');
              frmMain.os.Commit;
              oq.DeleteVariables;
              oq.SQL.Text := ' INSERT INTO VRES (FK_SMID, FD_INS, FC_RES, FC_TYPE, FK_VRACHID, FK_PACID, FK_PATID, FK_NAZID, FK_SOS) '+
                             ' VALUES(:PFK_SMID, :pFD_INS, '''', ''TEXT'', :pFK_VRACHID, :pFK_PACID, 0, :pFK_NAZID, GET_VIPNAZ) ';
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
      ods.Free;
      odsNaz.Free;
    end;
end;

procedure TfrmProtocolMore.actPassExecute(Sender: TObject);
var ods : TOracleDataSet;
oq : TOracleQuery;
begin
  ods := TOracleDataSet.Create(nil);
  oq := TOracleQuery.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID '+
                    '   FROM ASU.TNAZIS '+
                    '  WHERE FK_SMID = ASU.GET_FLU_ONE_PROJECTION '+
                    '    AND TRUNC(FD_RUN) = :PFD_RUN '+
                    '    AND FK_PACID = :PFK_PACID '+
                    '    AND FK_NAZSOSID = ASU.GET_PASS_REGISTRATOR ';
    ods.DeclareAndSet('PFD_RUN', otDate, trunc(merDateTime.Properties.Editors[0].Value));
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.Open;
    if ods.RecordCount > 0 then
      begin
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' UPDATE ASU.TNAZIS SET FD_RUN = :PFD_RUN WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFD_RUN', otDate, StrToDateTime(DateToStr(merDateTime.Properties.Editors[0].Value)+' '+FormatDateTime('hh:nn:ss', IncSecond(merDateTime.Properties.Editors[1].Value, 1))));
        oq.DeclareAndSet('PFK_ID', otInteger, ods.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
      end else
      begin
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' INSERT INTO TNAZIS(FK_SMID, FC_REMARK, FD_NAZ, FD_RUN, FK_ROOMID, FK_ISPOLID, FK_VRACHID, FK_NAZSOSID, FK_PACID, FC_NAME, FK_NAZTYPEID, FK_NAZOWNER, FC_TYPE) '+
      	    	         ' VALUES(GET_FLU_ONE_PROJECTION, ''Зачтённое назначение''||:pNUM, SYSDATE, :PFD_RUN, 0, :PFK_ISPOLID, :PFK_VRACHID, GET_PASS_REGISTRATOR, :PFK_PACID, GET_SMIDNAME(:PFK_SMID), GET_NAZPLAN, :PFK_NAZOWNER, -1) ';
        oq.DeclareAndSet('PFD_RUN', otDate, StrToDateTime(DateToStr(merDateTime.Properties.Editors[0].Value)+' '+FormatDateTime('hh:nn:ss', IncSecond(merDateTime.Properties.Editors[1].Value, 1))));
        oq.DeclareAndSet('PFK_ISPOLID', otInteger, frmMain.pSOTRID);
        oq.DeclareAndSet('PFK_VRACHID', otInteger, frmMain.pSOTRID);
        oq.DeclareAndSet('PFK_PACID', otInteger, pPACID);
        oq.DeclareAndSet('PFK_SMID', otInteger, pSMIDID);
        oq.DeclareAndSet('PFK_NAZOWNER', otInteger, pNAZID);
        oq.DeclareAndSet(':pNUM', otString, rowNum.Properties.Value);
        oq.Execute;
        frmMain.os.Commit;
      end;
  finally
    ods.Free;
    oq.Free;
  end;
  ShowMessage('Исследование зачтено как флюорография '+DateToStr(merDateTime.Properties.Editors[0].Value)+' '+FormatDateTime('hh:nn', IncSecond(merDateTime.Properties.Editors[1].Value, 1))+' !');
end;

procedure TfrmProtocolMore.aHistoryExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAllHistory, frmAllHistory);
  try
    frmAllHistory.DoShowForm(pPEPLID, rowPac.Properties.Value);
    frmAllHistory.ShowModal;
  finally
    frmAllHistory.Free;
  end;
end;

procedure TfrmProtocolMore.rowZaklEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetResume, frmSetResume);
      try
        frmSetResume.DoShowForm;
        frmSetResume.ShowModal;
        if frmSetResume.ModalResult = MrOK then
          begin
            TcxButtonEdit(vGrZakl.InplaceEditor).EditingText := frmSetResume.odsTree.FieldByName('FC_NAME').AsString;
            rowZakl.Tag := frmSetResume.odsTree.FieldByName('FK_ID').AsInteger;
          end;
      finally
        frmSetResume.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      if Application.MessageBox('Вы действительно хотите удалить заключение этого протокола?', 'Вопрос', MB_ICONQUESTION + MB_YESNO) = mrYes then
        begin
          oq := TOracleQuery.Create(nil);
          try
            oq.Session := frmMain.os;
            oq.Cursor := crSQLWait;
            oq.SQL.Text := ' delete from asu.tib '+#13+
                           ' where fk_pacid = :pfk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_VRACH_RESUME'')';
            oq.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
            oq.Execute;
            frmMain.os.Commit;
            TcxButtonEdit(vGrZakl.InplaceEditor).EditingText := '';
            rowZakl.Tag := 0;
          finally
            oq.Free;
          end;
        end;
    end;
end;

procedure TfrmProtocolMore.rveTextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (chr(KEY) in ['a', 'A', 'ф', 'Ф']) then
    begin
      rveText.SetSelectionBounds(0, rveText.GetOffsBeforeItem(0), rveText.ItemCount - 1,
      rveText.GetOffsAfterItem(rveText.ItemCount - 1));
      Application.ProcessMessages;
    end;
end;

procedure TfrmProtocolMore.N1Click(Sender: TObject);
begin
  rveText.PasteText;
  rveText.Reformat;
end;

procedure TfrmProtocolMore.rveTextSpellingCheck(Sender: TCustomRichView;
  const AWord: string; StyleNo: Integer; var Misspelled: Boolean);
begin
 // if SpChk.IsKnownWord(AWord,langRussian) = False then
 //   Misspelled := True;
end;

procedure TfrmProtocolMore.SetEnableButtonForReadOnly(AEnable: Boolean);
begin
  merDateTime.Properties.Editors[0].EditProperties.ReadOnly := not AEnable;
  merDateTime.Properties.Editors[1].EditProperties.ReadOnly := not AEnable;
  bClear.Enabled := AEnable;
  bCheck.Enabled := AEnable;
  bCheckNone.Enabled := AEnable;
  bbSave.Enabled := AEnable;
  bCut.Enabled := AEnable;
  bCopy.Enabled := AEnable;
  bPaste.Enabled := AEnable;
  bSaveTemplate.Enabled := AEnable;
  bLoadTemplate.Enabled := AEnable;
  rowZakl.Properties.EditProperties.Buttons[0].Enabled := AEnable;
  bSet.Enabled := AEnable;

  rveText.ReadOnly := not AEnable;
  rveText.Enabled := AEnable;
  rowZakl.Properties.EditProperties.ReadOnly := not AEnable;
end;

procedure TfrmProtocolMore.SetIsReadOnly(const aIsReadOnly: Boolean);
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

procedure TfrmProtocolMore.SignedComponentEnabled(aNazID: Integer; aIsSigned: Boolean; aSotrName: String; aSignDT: TDateTime);
var vSignCorrect: Boolean;
    vSignidByTableAndID: Integer;
begin
  aSnimki.Visible := not IsReadOnly;
  aOtmetki.Visible := not IsReadOnly;
  aControlProtocol.Visible := not IsReadOnly;
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

procedure TfrmProtocolMore.TVLISTFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  aSnimki.Visible := True; // odsList.FieldByName('fk_resultid').AsInteger = 1;
end;

procedure TfrmProtocolMore.N2Click(Sender: TObject);
begin
  rveText.CopyText;
end;

procedure TfrmProtocolMore.N3Click(Sender: TObject);
begin
  rveText.CutDef;
end;

procedure TfrmProtocolMore.N5Click(Sender: TObject);
begin
  if Application.MessageBox('Вы собираетесь очистить текст протокола.' + #13 + #10 + 'Уверены?', 'Вопрос', MB_ICONQUESTION+MB_OKCANCEL)= IDOk then
  begin
    rveText.Clear;
    rveText.Format;
    rveText.SetFocus;
  end;
end;

procedure TfrmProtocolMore.aOtmetkiExecute(Sender: TObject);
begin
 if pOWNERID = frmMain.GET_ISSL_FLU then
   begin
     odsList.First;
		 Application.CreateForm(TfrmOtmetkiFlu, frmOtmetkiFlu);
     try
	  	 frmOtmetkiFlu.aSave.Enabled := aSave.Enabled;
		   frmOtmetkiFlu.DoShowfrmOtmetki(odsList.FieldByName('fk_id').AsInteger, pPACID);
		   frmOtmetkiFlu.ShowModal;
     finally
  		 frmOtmetkiFlu.Free;
     end;
	 end else
	 begin
     odsList.First;
		 Application.CreateForm(TfrmOtmetki, frmOtmetki);
     try
       frmOtmetki.aSave.Enabled := aSave.Enabled;
       frmOtmetki.DoShowfrmOtmetki(odsList.FieldByName('fk_id').AsInteger, pPACID, frmMain.odsKab.FieldByName('FK_ID').AsInteger);
       frmOtmetki.ShowModal;
     finally
       frmOtmetki.Free;
     end;
   end;
end;

procedure TfrmProtocolMore.DoTextProtocol;
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

procedure TfrmProtocolMore.aResumeExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSetResume, frmSetResume);
  try
    frmSetResume.DoShowForm;
    frmSetResume.ShowModal;
    if frmSetResume.ModalResult = MrOK then
      begin
        TcxButtonEdit(vGrZakl.InplaceEditor).EditingText := frmSetResume.odsTree.FieldByName('FC_NAME').AsString;
        rowZakl.Tag := frmSetResume.odsTree.FieldByName('FK_ID').AsInteger;
      end;
  finally
    frmSetResume.Free;
  end;
end;

procedure TfrmProtocolMore.odsListApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean; var NewRowId: string);
var oq : TOracleQuery;
begin
  case Action of
    'U':
       begin
         if TVDOZA.Focused then
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' DECLARE '+
                              '   Cnt NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt FROM TIB WHERE FK_PACID = :pFK_PACID AND FK_SMID = -1 AND FK_SMEDITID = -1; '+
                              ' IF Cnt > 0 THEN '+
                              '   UPDATE TIB SET FN_NUM = :pFN_NUM, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_PACID AND FK_SMID = -1 AND FK_SMEDITID = -1; '+
                              ' ELSE '+
                              '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_PACID, :pFN_NUM, -1, -1, :pFK_VRACHID); '+
                              ' END IF; '+
                              ' END; ';
               oq.DeclareAndSet('PFN_NUM', otFloat, TVDOZA.DataBinding.Field.Value);
               oq.DeclareAndSet('PFK_PACID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
               oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
         if TVTIME.Focused then
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' DECLARE '+
                              '   Cnt NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt FROM TIB WHERE FK_PACID = :pFK_PACID AND FK_SMID = -2 AND FK_SMEDITID = -2; '+
                              ' IF Cnt > 0 THEN '+
                              '   UPDATE TIB SET FN_NUM = :pFN_NUM, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_PACID AND FK_SMID = -2 AND FK_SMEDITID = -2; '+
                              ' ELSE '+
                              '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_PACID, :pFN_NUM, -2, -2, :pFK_VRACHID); '+
                              ' END IF; '+
                              ' END; ';
               oq.DeclareAndSet('PFN_NUM', otFloat, TVTIME.DataBinding.Field.Value);
               oq.DeclareAndSet('PFK_PACID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
               oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
       end;
  end;
  Applied := TRUE;
end;

procedure TfrmProtocolMore.odsListBeforeOpen(DataSet: TDataSet);
begin
  if rowNum.Properties.Value = '' then
    odsList.SetVariable('PFC_TYPE', sFC_TYPE)
  else
    odsList.SetVariable('PFC_TYPE', rowNum.Properties.Value);
end;

procedure TfrmProtocolMore.odsSotrBeforeOpen(DataSet: TDataSet);
begin
  odsSotr.SetVariable('PFK_OTDELID', frmMain.pOTDELID);
end;

procedure TfrmProtocolMore.RefreshIsSign(aNazID: Integer);
begin
  FIsSign := IsNazSignedCryptoPro(aNazID, FSignSotrName, FSignSotrID, FSignDT);
  SignedComponentEnabled(aNazID, FIsSign, FSignSotrName, FSignDT);
end;

procedure TfrmProtocolMore.aSaveTemplateExecute(Sender: TObject);
var memStream: TMemoryStream;
begin
  memStream := TMemoryStream.Create;
  rveText.SaveRVFToStream(memStream, False);
  memStream.Position := 0;
  SaveMedEditorAsTemplate(pSMIDID, memStream, rvs);
  memStream.Free;
end;

procedure TfrmProtocolMore.aSnimkiExecute(Sender: TObject);
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
  procedure MyShowShimok( p_is_get:boolean );
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
                          WriteString('TEST','FND_PATIENTID',rowMK.Properties.Value);
                          WriteString('TEST','FND_ACCESSIONNUMBER',rowNum.Properties.Value);
                        finally
                          Free;
                        end
                    else
                      DeleteFile(v_testfile);
                  end else
                  begin }
                    v_pid := rowMK.Properties.Value;
                    v_an  := rowNum.Properties.Value;
                {  end;  }
                  p_showSnimki(  Application.Handle,
                                 frmMain.os.ExternalSVC,
                                 v_pid, // merFIOMK.Properties.Editors[1].Value
                                 v_an,  // erowNumProt.Properties.Value
                                 '',    // p_studyUID
                                 False,   // old_form
                                 p_is_get
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
      MyShowShimok(True);
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
          rowNum.Properties.Value;               // accessionnumber
          try
            Exec(vExeFile+' '+vRunStr,ExtractFilePath(ParamStr(0)));
          except
            on E:Exception do
              ShowMessage(E.Message);
          end;
      End else ShowMessage('Файл '+ExtractFilePath( ParamStr(0) )+'\DicomClient.exe'+' не найден.');
    end;
    Exit;
  end;
  //
  Reg := TRegistry.Create;
  try
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    if not Reg.OpenKeyReadOnly('\Software\Alda\MultiVox\Installation') then
      begin
        if (frmMain.GET_DB_NAME = 'H') or (frmMain.GET_DB_NAME = 'SO') then // если база Ханты ОКБ или Сургут ОКБ - сопряжение с Мультивокс
        begin
          ShowMessage('Не установлен клиент MultiVox ...');
          Exit;
        end;
        // edpatientID.Text
        // edAccessionNumber.Text
        if ((frmMain.get_dicom_show = '-1') and (frmMain.get_use_cmove <> '-1')) then
        begin
          MyShowShimok(True);
         { DoShowSnimki(rowMK.Properties.Value,
                       rowNum.Properties.Value,
                       '',
                       frmMain.get_dicom_ip,
                       frmMain.get_dicom_port,
                       frmMain.get_dicom_called,
                       frmMain.sCallingAET,
                       IntToStr(frmMain.pSotrID),
                       frmMain.dicom_show_3d);  }
        end else
          MyShowShimok(False);

       { DoShowSnimki(rowMK.Properties.Value,
                     rowNum.Properties.Value,
                     '',
                     frmMain.get_dicom_ip,
                     frmMain.get_dicom_port,
                     frmMain.get_dicom_called,
                     frmMain.sCallingAET,
                     IntToStr(frmMain.pSotrID),
                     frmMain.dicom_show_3d);     }
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

procedure TfrmProtocolMore.aStartEditExecute(Sender: TObject);
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

procedure TfrmProtocolMore.aLoadTemplateExecute(Sender: TObject);
var memStream: TMemoryStream;
begin
  memStream := TMemoryStream.Create;
  memStream.Position := 0;
  if LoadMedEditorFromTemplate(pSMIDID, memStream, rvs) then
  begin
    memStream.Position := 0;
    rveText.Reformat;
    if not rveText.InsertRVFFromStreamEd(memStream) then
      MessageDlg('Внимание. При загрузке шаблона возникли проблемы', mtError,
        [mbOK], 0);

    rveText.Format; // или все таки reformat нужно ?
  end;
  memStream.Free;
end;

procedure TfrmProtocolMore.DoRgVrach;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    {ods.SQL.Text := '   SELECT FN_NUM '+#13#10+
                    '     FROM ASU.TIB '+#13#10+
                    '    WHERE FK_PACID = :PFK_PACID '+#13#10+
                    '      AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''RG_VRACH'') ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);}
    ods.SQL.Text := '   SELECT FK_ISPOLID '+#13#10+
                    '     FROM ASU.VNAZ '+#13#10+
                    '    WHERE FK_ID = :pFK_NazID';
    ods.DeclareAndSet('pFK_NazID', otInteger, pNAZID);
    ods.Open;
    //    merLaborantVrach.Properties.Editors[0].Value := ods.FieldByName('FN_NUM').AsInteger;
    //    if merLaborantVrach.Properties.Editors[0].Value = 0 then

    if frmMain.GET_DB_NAME = 'SK'
    then begin
      if (ods.RecordCount > 0) AND (ods.FieldByName('FK_ISPOLID').asInteger > 0)
      then begin
        if not(VarType(odsSotr.Lookup('FK_ID', ods.FieldByName('FK_ISPOLID').Value, 'FK_ID')) in [varEmpty, varNull])
        then merLaborantVrach.Properties.Editors[0].Value := ods.FieldByName('FK_ISPOLID').Value
        else merLaborantVrach.Properties.Editors[0].Value := frmMain.pSOTRID;
      end
      else merLaborantVrach.Properties.Editors[0].Value := frmMain.pSOTRID;
    end
    else merLaborantVrach.Properties.Editors[0].Value := frmMain.pSOTRID;

    merLaborantVrach.Properties.Editors[0].Options.Editing := (frmMain.get_can_change_vrach = 1) or (merLaborantVrach.Properties.Editors[0].Value = null) or (merLaborantVrach.Properties.Editors[0].Value = 1) or (merLaborantVrach.Properties.Editors[0].DisplayTexts[0] = '');
  finally
    ods.Free;
  end;
end;

procedure TfrmProtocolMore.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if chkOtmetki.Checked then
    begin
      aOtmetkiExecute(nil);
    end;
end;

procedure TfrmProtocolMore.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  Reg : TRegIniFile;
  vUnload: Boolean;
begin
  TVList.StoreToRegistry('\SoftWare\SoftMaster\List_xrays_vrach\fProtocolMore\TVListVrach_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVList');
  Reg := TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    if not Reg.OpenKey('\Software\Softmaster\List_Vrach\Protocol\', FALSE) then
      begin
        Reg.CreateKey('\Software\Softmaster\List_Vrach\Protocol');
      end;
    Reg.WriteInteger('\Software\Softmaster\List_Vrach\Protocol'+'\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_CHECK_OTMETKI',  StrToInt(BoolToStr(chkOtmetki.Checked)));
  finally
    Reg.Free;
  end;

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

