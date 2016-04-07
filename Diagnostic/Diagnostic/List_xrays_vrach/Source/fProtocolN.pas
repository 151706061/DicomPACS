unit fProtocolN;
//!!! Дозу надо не показывать не только для кабинета, но и для МРТ-исследований
//!!! DoCheckParameters Проверка корректности даты
//!!! сохранение только тех параметров которые реально изменились - осталось заключение
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter,
  dxBarExtItems, dxBar, cxClasses, ActnList, ImgList, cxStyles, cxGraphics,
  cxEdit, cxVGrid, cxControls, cxInplaceContainer, cxDBLookupComboBox,
  cxCheckBox, cxMemo, frxClass, frxDBSet, Spellers, Menus, DB, OracleData,
  RVStyle, cxBarEditItem, RVScroll, RichView, RVEdit, ExtCtrls, StdCtrls,
  dxSkinscxPCPainter, cxPC, cxContainer, Oracle, fCryptUtils,
  DateUtils, Registry, ShellAPI, uFileUtils, uSignUtils, uReportUtils, cxLabel,
  cxButtonEdit, cxTextEdit, cxCurrencyEdit, cxMaskEdit, cxCalendar, cxTimeEdit,
  dxSkinOffice2007Green, RVFuncs, IniFiles, dxSpellChecker, frxRich,
  frxExportHTML, uPrintType, frxExportRTF;

type
  TfrmProtocolN = class(TForm)
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;              
    aPrint: TAction;
    aHistory: TAction;
    aOtmetki: TAction;
    actPass: TAction;
    aControlProtocol: TAction;
    aSnimki: TAction;
    acDigitPodpis: TAction;
    aStartEdit: TAction;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbSave: TdxBarButton;
    bbCancel: TdxBarButton;
    bbPrint: TdxBarButton;
    bbHistory: TdxBarButton;
    bbOtmetki: TdxBarButton;
    dxContainerShowOtmetki: TdxBarControlContainerItem;
    bbControlProtocol: TdxBarButton;
    bSnimki: TdxBarButton;
    bbDigPodpis: TdxBarButton;
    bbStartEdit: TdxBarButton;
    il: TImageList;
    dxBarDockControl1: TdxBarDockControl;
    cxStyleRepository1: TcxStyleRepository;
    stFIO: TcxStyle;
    stIssl: TcxStyle;
    rvs: TRVStyle;
    cxBarEditItem1: TcxBarEditItem;
    stSignal: TcxStyle;
    odsSotr: TOracleDataSet;
    dsSotr: TDataSource;
    odsRVData: TOracleDataSet;
    odsRVDataFK_ID: TFloatField;
    odsRVDataFK_PACID: TFloatField;
    odsRVDataFB_BLOB: TBlobField;
    odsRVDataFN_COMPRESS: TFloatField;
    odsRVDataFB_HTML: TBlobField;
    odsRVDataFB_TEXT: TMemoField;
    pmRveText: TPopupMenu;
    N5: TMenuItem;
    N4: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    N1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    odsKudaNapravlen: TOracleDataSet;
    dsKudaNapravlen: TDataSource;
    frxRepOBTC_4Rentgen: TfrxReport;
    frxRepOBTC: TfrxReport;
    frxRepOKB: TfrxReport;
    chkOtmetki: TCheckBox;
    imSign: TImage;
    verGrPodpisi: TcxVerticalGrid;
    merDateTime: TcxMultiEditorRow;
    merLaborantVrach: TcxMultiEditorRow;
    vGrSignal: TcxVerticalGrid;
    rowStatusMK: TcxEditorRow;
    rowTub: TcxEditorRow;
    rowEdit: TcxEditorRow;
    rowReanim: TcxEditorRow;
    rowZakl: TcxEditorRow;
    rowDs: TcxEditorRow;
    rowRecom: TcxEditorRow;
    merDozaTime: TcxMultiEditorRow;
    paText: TPanel;
    rveText: TRichViewEdit;
    dxBarDockControl2: TdxBarDockControl;
    BMBar2: TdxBar;
    bClear: TdxBarButton;
    bSpell: TdxBarButton;
    bNoSpell: TdxBarButton;
    bCut: TdxBarButton;
    bCopy: TdxBarButton;
    bPaste: TdxBarButton;
    bSaveTempl: TdxBarButton;
    bPass: TdxBarButton;
    bLoadTempl: TdxBarButton;
    aPodpis: TAction;
    bbPodpis: TdxBarButton;
    Panel1: TPanel;
    VerGrFIO: TcxVerticalGrid;
    catPac: TcxCategoryRow;
    merFIOMK: TcxMultiEditorRow;
    merDateAgeSex: TcxMultiEditorRow;
    rowKemNapravlen: TcxEditorRow;
    rowKudaNapravlen: TcxEditorRow;
    rowNumIssl: TcxEditorRow;
    rowIssl: TcxEditorRow;
    vGrKontrast: TcxVerticalGrid;
    catKontrast: TcxCategoryRow;
    rowTypeKontrast: TcxEditorRow;
    rowKolvoKontrast: TcxEditorRow;
    rowVvodKontrast: TcxEditorRow;
    frxRepOKBKontrast: TfrxReport;
    rowSpeed: TcxEditorRow;
    bbUndo: TdxBarButton;
    bbRedo: TdxBarButton;
    aUndo: TAction;
    aRedo: TAction;
    bbPasteImage: TdxBarButton;
    aPasteImage: TAction;
    OpenDialog1: TOpenDialog;
    SpellChecker1: TSpellChecker;
    frxRichObject1: TfrxRichObject;
    dbPrintMenu: TdxBarPopupMenu;
    aPrintOffice: TAction;
    bb1: TdxBarButton;
    dxBarButton1: TdxBarButton;
    frxHTMLExport1: TfrxHTMLExport;
    dxBarButton2: TdxBarButton;
    dbTable: TdxBarPopupMenu;
    dxBarSubItem1: TdxBarSubItem;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    InsTable: TAction;
    InsCol: TAction;
    InsRow: TAction;
    DelTable: TAction;
    DelCol: TAction;
    DelRow: TAction;
    MergeCells: TAction;
    dxBarButton9: TdxBarButton;
    rowFIOVrach: TcxEditorRow;
    frxRTFExport1: TfrxRTFExport;
    aSetQ: TAction;
    bbSetQ: TdxBarButton;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure acDigitPodpisExecute(Sender: TObject);
    procedure aStartEditExecute(Sender: TObject);
    procedure aSnimkiExecute(Sender: TObject);
    procedure aOtmetkiExecute(Sender: TObject);
    procedure aControlProtocolExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aHistoryExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure rveTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actPassExecute(Sender: TObject);
    procedure odsSotrBeforeOpen(DataSet: TDataSet);
    procedure rowZaklEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure bClearClick(Sender: TObject);
    procedure bSpellClick(Sender: TObject);
    procedure bNoSpellClick(Sender: TObject);
    procedure bCutClick(Sender: TObject);
    procedure bCopyClick(Sender: TObject);
    procedure bPasteClick(Sender: TObject);
    procedure bSaveTemplClick(Sender: TObject);
    procedure bLoadTemplClick(Sender: TObject);
    procedure frxRepOKBBeforePrint(Sender: TfrxReportComponent);
    procedure frxRepOKBGetValue(const VarName: string; var Value: Variant);
    procedure frxRepOBTCGetValue(const VarName: string; var Value: Variant);
    procedure frxRepOBTC_4RentgenGetValue(const VarName: string;
      var Value: Variant);
    procedure rowDsEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowRecomEditPropertiesChange(Sender: TObject);
    procedure rowKudaNapravlenEditPropertiesChange(Sender: TObject);
    procedure aPodpisExecute(Sender: TObject);
    procedure frxRepOKBKontrastBeforePrint(Sender: TfrxReportComponent);
    procedure frxRepOKBKontrastGetValue(const VarName: string;
      var Value: Variant);
    procedure rveTextSpellingCheck(Sender: TCustomRichView; const AWord: string;
      StyleNo: Integer; var Misspelled: Boolean);
    procedure aUndoExecute(Sender: TObject);
    procedure aRedoExecute(Sender: TObject);
    procedure aPasteImageExecute(Sender: TObject);
    procedure aPrintOfficeExecute(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure InsTableExecute(Sender: TObject);
    procedure InsColExecute(Sender: TObject);
    procedure InsRowExecute(Sender: TObject);
    procedure DelTableExecute(Sender: TObject);
    procedure DelColExecute(Sender: TObject);
    procedure DelRowExecute(Sender: TObject);
    procedure MergeCellsExecute(Sender: TObject);
    procedure aSetQExecute(Sender: TObject);
  private
    sSpecName : string;
    nDsFirst, nDsShowIb : Integer; // характеристики диагноза - выявлен впервые, показывать ли в истории болезни
    sDsName, sDsMkbCode : string; // характеристики диагноза - наименование
    isRecomChange, isKudaNapravlenChange : Boolean;
    Russian : HKL;
    pPACID, pPEPLID, pSMIDID, pNAZID, pAmbul : Integer;
    IDSMIDZAKL : Integer;
    listxrayvrach_use_zakl_text, listxrayvrach_protokolhidediag : integer;
    FUseDigitalSign: Boolean; // Флаг выставляется если используется цифровая подпись
    FCryptoProUtils: TCryptoProUils;
    FSQLRuleID: Integer;
    FIsSign: Boolean;
    FIsReadOnly: Boolean; // Поставлена ЭЦП
    FSignSotrID: Integer; // SotrID, сотрудника поставившего подпись, если нет, то -1
    FSignDT: TDateTime;
    FSignSotrName: String; // Фамилия и инициалы сотрудника поставившего подпись
    function DoCheckParameters : Integer;
    procedure DoPodpis;
    procedure DoShowProtocol_4OKBHMAO(pIsOffice:Boolean=False);
    procedure DoShowProtocol_4OBTC(pIsOffice:Boolean=False);
    procedure DoInsertEditParametersNaz;
    procedure DoRgVrach;
    procedure DoTextProtocol;
    procedure DoShowButtons;
    procedure DoSetEditRights;
    function CanSubscribeSertificat(os : TOracleSession; pNazID : integer; Base : string): Boolean;
    procedure SetIsReadOnly(const aIsReadOnly: Boolean);
    property IsReadOnly: Boolean  read FIsReadOnly write SetIsReadOnly;
    function DoSignCryptoPro(): Boolean;
    procedure RefreshIsSign(aNazID : Integer);
    function IsNazSignedCryptoPro(aNazID: Integer; var aSotrName: String; var aSotrID: Integer; var aSignDT: TDateTime): Boolean;
    procedure SignedComponentEnabled(aNazID: Integer; aIsSigned: Boolean; aSotrName: String; aSignDT: TDateTime);
    function IsSotrHasSignCryptoPro(aSotrID: Integer): Boolean;
    procedure DrowDigSign(aImage: TImage; APrintText: string; aDataTime: TDateTime; ADSCorrect: Boolean);
    procedure DoSetEnabledPodpisClose(value:boolean);
    procedure SetEnableButtonForReadOnly(AEnable:Boolean);
    procedure DoLog;
    function DoCheckForHeal(pSMIDID, pSOTRID, pNAZID : Integer) : Integer;
  public
    pOWNERID : Integer;
    isResult : Boolean; // есть ли снимки от MultiVox?
    procedure DoShowForm(nAMBUL, nPACID, nPEPLID, nSMIDID, nNAZID, nREANIM : Integer; strIssl : string);
  end;

var
  frmProtocolN: TfrmProtocolN;
const
  SQLRuleTableName = 'asu.tnazis';
  cTmpStrRepl = '##########';

implementation
uses fMain, fControlProtocol, fAllHistory, fOtmetkiFlu, fOtmetki, uPrintDocument, 
     fMedEditorTemplates, fSetResume, fSetDs, fEditDiag, fControlProtocolN{,
     uCommonXray}, fSetQ, udbtableutils;
{$R *.dfm}

{ TfrmProtocolN }

procedure TfrmProtocolN.aCancelExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmProtocolN.acDigitPodpisExecute(Sender: TObject);
begin
  if not FUseDigitalSign then
    exit;
  try
    Screen.Cursor := crSQLWait;
    if DoCheckParameters = 0 then
      exit;
    DoInsertEditParametersNaz;
    DoPodpis;
    DoLog;
    DoSignCryptoPro;
    frmMain.os.Commit;
    RefreshIsSign(pNAZID);
    ModalResult := MrOK;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmProtocolN.aControlProtocolExecute(Sender: TObject);
var    ods : TOracleDataSet;
    odsNaz : TOracleDataSet;
        oq : TOracleQuery;
    idSmid : Integer;
    nIDNaz : Integer;
    memStream : TMemoryStream;
begin
  Application.CreateForm(TfrmControlProtocolN, frmControlProtocolN);
  frmControlProtocolN.aSave.Enabled := aSave.Enabled;
  frmControlProtocolN.aDel.Enabled := aSave.Enabled;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID, FC_NAME FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_CONTROL_PROTOCOL'' ';
    ods.Open;
    idSmid := ods.FieldByName('FK_ID').AsInteger;
  finally
    ods.Free;
  end;
    odsNaz := TOracleDataSet.Create(nil);
    try
      odsNaz.Session := frmMain.os;
      odsNaz.Cursor := crSQLWait;
      odsNaz.SQL.Text := ' SELECT FK_ID '+#13+
                         '   FROM ASU.VNAZ '+#13+
                         '  WHERE FK_SMID = :PFK_SMID '+#13+
                         '    AND FK_NAZOWNER = :PFK_NAZOWNER ';
      odsNaz.DeclareAndSet('PFK_SMID', otInteger, idSmid);
      odsNaz.DeclareAndSet('PFK_NAZOWNER', otInteger, pNAZID);
      odsNaz.Open;
      nIDNaz := odsNaz.FieldByName('FK_ID').AsInteger;
      if odsNaz.RecordCount > 0 then
        frmControlProtocolN.INSERT_MODE := False
      else
        frmControlProtocolN.INSERT_MODE := True;
      frmControlProtocolN.DoShowFormControlProtocol(idSmid, nIDNaz);
      frmControlProtocolN.ShowModal;
      if frmControlProtocolN.ModalResult = MrOK then
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
              oq.DeclareAndSet('PFD_RUN', otDate, StrToDateTime(DateToStr(frmControlProtocolN.cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(frmControlProtocolN.cxteTimeProtocol.Time, 1))));
              oq.DeclareAndSet('PFK_ISPOLID', otInteger, frmControlProtocolN.cxSotr.EditValue);
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
                             '   (FK_SMID, FC_REMARK, FD_NAZ, FD_RUN, FK_ROOMID, FK_ISPOLID, '+
                             '    FK_VRACHID, FK_NAZSOSID, FK_PACID, FC_NAME, FK_NAZTYPEID, FK_NAZOWNER) '+
                             ' VALUES(:PFK_SMID, :PFC_REMARK, :PFD_NAZ, :PFD_RUN, 0, :PFK_ISPOLID, '+
                             ' :PFK_VRACHID, GET_VIPNAZ, :PFK_PACID, (SELECT FC_NAME FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_CONTROL_PROTOCOL''), GET_NAZPLAN, :PFK_NAZOWNER) '+
                             ' RETURNING FK_ID INTO :PFK_ID ';
              oq.DeclareAndSet('PFK_SMID', otInteger, idSmid);
              oq.DeclareAndSet('PFC_REMARK', otString, 'Контрольное описание протокола - Рентген');
              oq.DeclareAndSet('PFD_NAZ', otDate, StrToDateTime(DateToStr(frmControlProtocolN.cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(frmControlProtocolN.cxteTimeProtocol.Time, 1))));
              oq.DeclareAndSet('PFD_RUN', otDate, StrToDateTime(DateToStr(frmControlProtocolN.cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(frmControlProtocolN.cxteTimeProtocol.Time, 1))));
              oq.DeclareAndSet('PFK_ISPOLID', otInteger, frmControlProtocolN.cxSotr.EditValue);
              oq.DeclareAndSet('PFK_VRACHID', otInteger, frmControlProtocolN.cxSotr.EditValue);
              oq.DeclareAndSet('PFK_PACID', otInteger, pPACID);
              oq.DeclareAndSet('PFK_NAZOWNER', otInteger, pNAZID);
              oq.DeclareVariable('PFK_ID', otInteger);
              oq.Execute;
              nIDNaz := oq.GetVariable('PFK_ID');
              frmMain.os.Commit;
              oq.DeleteVariables;
              oq.SQL.Text := ' INSERT INTO ASU.VRES (FK_SMID, FD_INS, FC_RES, FC_TYPE, FK_VRACHID, FK_PACID, FK_PATID, FK_NAZID, FK_SOS) '+
                             ' VALUES(:pFK_SMID, :pFD_INS, '''', ''TEXT'', :pFK_VRACHID, :pFK_PACID, 0, :pFK_NAZID, ASU.GET_VIPNAZ) ';
              oq.DeclareAndSet('pFK_SMID', otInteger, idSmid);
              oq.DeclareAndSet('pFD_INS', otDate, StrToDateTime(DateToStr(frmControlProtocolN.cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(frmControlProtocolN.cxteTimeProtocol.Time, 1))));
              oq.DeclareAndSet('pFK_VRACHID', otInteger, frmControlProtocolN.cxSotr.EditValue);
              oq.DeclareAndSet('pFK_PACID', otInteger, pPACID);
              oq.DeclareAndSet('pFK_NAZID', otInteger, nIDNaz);
              oq.Execute;
              frmMain.os.Commit;
            finally
              oq.Free;
            end;
          end;
//------------------------------------------------------------------------------
      if frmControlProtocolN.odsRVData.RecordCount=0 then
        frmControlProtocolN.odsRVData.Insert
      else
        frmControlProtocolN.odsRVData.Edit;

      if frmControlProtocolN.rveText.ItemCount <> 0 then
        begin
          frmControlProtocolN.rveText.SetSelectionBounds(0, frmControlProtocolN.rveText.GetOffsBeforeItem(0),
                                                         frmControlProtocolN.rveText.ItemCount - 1,
                                                         frmControlProtocolN.rveText.GetOffsAfterItem(frmControlProtocolN.rveText.ItemCount - 1));
        end;
      Application.ProcessMessages;
	    memStream := TMemoryStream.Create;
	    frmControlProtocolN.rveText.SaveRVFToStream(memStream,False);
//сохраняем в BLOB
	    memStream.Position := 0;
	    TBlobField(frmControlProtocolN.odsRVData.FieldByName('FB_BLOB')).LoadFromStream(memStream);
    	memStream.Clear;
//сохраняем в HTML
	    frmControlProtocolN.rveText.AddBreak;
	    frmControlProtocolN.rveText.SaveHTMLToStream(memStream,'','',IntToStr(pNAZID)+'_',[rvsoOverrideImages,rvsoMiddleOnly,rvsoUseCheckpointsNames]);
	    memStream.Position := 0;
	    TBlobField(frmControlProtocolN.odsRVData.FieldByName('FB_HTML')).LoadFromStream(memStream);
	    memStream.Clear;
//сохраняем в обычный текст
	    frmControlProtocolN.rveText.SaveTextToStream('',memStream,0,False,True);
	    memStream.Position := 0;
      TBlobField(frmControlProtocolN.odsRVData.FieldByName('FB_TEXT')).LoadFromStream(memStream);
      frmControlProtocolN.odsRVData.FieldByName('FN_COMPRESS').AsInteger := 1;
      frmControlProtocolN.odsRVData.FieldByName('FK_PACID').AsInteger := nIDNaz;
      frmControlProtocolN.odsRVData.Post;
      frmMain.os.Commit;
      memStream.Free;
    end;
    finally
      odsNaz.Free;
    end;
  frmControlProtocolN.Free;    
end;

procedure TfrmProtocolN.actPassExecute(Sender: TObject);
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
        oq.DeclareAndSet(':pNUM', otString, rowNumIssl.Properties.Value);
        oq.Execute;
        frmMain.os.Commit;
      end;
  finally
    ods.Free;
    oq.Free;
  end;
  ShowMessage('Исследование зачтено как флюорография '+DateToStr(merDateTime.Properties.Editors[0].Value)+' '+FormatDateTime('hh:nn', IncSecond(merDateTime.Properties.Editors[1].Value, 1))+' !');
end;

procedure TfrmProtocolN.aHistoryExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAllHistory, frmAllHistory);
  frmAllHistory.DoShowForm(pPEPLID, merFIOMK.Properties.Editors[0].Value);
  frmAllHistory.ShowModal;
  frmAllHistory.Free;
end;

procedure TfrmProtocolN.aOtmetkiExecute(Sender: TObject);
begin
 if pOWNERID = frmMain.GET_ISSL_FLU then
   begin
		 Application.CreateForm(TfrmOtmetkiFlu, frmOtmetkiFlu);
		 frmOtmetkiFlu.aSave.Enabled := aSave.Enabled;
		 frmOtmetkiFlu.DoShowfrmOtmetki(pNAZID, pPACID);
		 frmOtmetkiFlu.ShowModal;
		 frmOtmetkiFlu.Free;
	 end else
	 begin
		 Application.CreateForm(TfrmOtmetki, frmOtmetki);
     frmOtmetki.aSave.Enabled := aSave.Enabled;
     frmOtmetki.DoShowfrmOtmetki(pNAZID, pPACID, frmMain.odsKab.FieldByName('FK_ID').AsInteger);
     frmOtmetki.ShowModal;
     frmOtmetki.Free;
   end;
end;

procedure TfrmProtocolN.aPasteImageExecute(Sender: TObject);
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

procedure TfrmProtocolN.aPodpisExecute(Sender: TObject);
begin
  rveText.SetFocus;
  if not CanSubscribeSertificat(frmMain.os, pNAZID, frmMain.GET_DB_NAME) then
    begin
      Application.MessageBox('Не хватает средств на страховом документе!','Ошибка при заполнении', MB_ICONINFORMATION);
      exit;
    end;
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
        DoLog;
        ModalResult := MrOK;
      finally
        Cursor := crDefault;
      end;
    end;
end;

procedure TfrmProtocolN.aPrintExecute(Sender: TObject);
begin
  if rveText.Enabled = True then
    rveText.SetFocus;
  if frmMain.GET_DB_NAME <> 'T' then
    begin
      DoShowProtocol_4OKBHMAO;
    end else
    begin
      DoShowProtocol_4OBTC;
    end;
end;

procedure TfrmProtocolN.aPrintOfficeExecute(Sender: TObject);
begin // Печать в Office
  if rveText.Enabled = True
  then rveText.SetFocus;

  if frmMain.GET_DB_NAME <> 'T'
  then begin
    DoShowProtocol_4OKBHMAO(True);
  end else
  begin
    DoShowProtocol_4OBTC(True);
  end;
end;

procedure TfrmProtocolN.aRedoExecute(Sender: TObject);
begin
  rveText.Redo;
end;

procedure TfrmProtocolN.aSaveExecute(Sender: TObject);
begin
  rveText.SetFocus;
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
        if aPodpis.Visible = False then //подписываем при условии, что кнопка "Подпись" не видна
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

procedure TfrmProtocolN.aSetQExecute(Sender: TObject);
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

procedure TfrmProtocolN.aSnimkiExecute(Sender: TObject);
var Reg : TRegistry;
// Отображение снимков по пациенту/исследованию (для АТРИС)
p_showSnimki : procedure (  p_AppHandl : THandle;
                            p_OracleSession: pointer;
                            p_patientID:string;
                            p_AccessionNumber:string;
                            p_studyUID:string;
                            p_old_form : Boolean  ;
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
              {  v_testfile:= ExtractFilePath(paramstr(0))+'dicomtest.ini';
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
                        WriteString('TEST','FND_PATIENTID',merFIOMK.Properties.Editors[1].Value); //   rowMK.Properties.Value
                        WriteString('TEST','FND_ACCESSIONNUMBER',rowNumIssl.Properties.Value);  // rowNum.Properties.Value
                      finally
                        Free;
                      end
                  else
                    DeleteFile(v_testfile);
                end else
                begin }
                  v_pid := merFIOMK.Properties.Editors[1].Value; // rowMK.Properties.Value;
                  v_an  := rowNumIssl.Properties.Value; // rowNum.Properties.Value;
               { end; }
                p_showSnimki(  Application.Handle,
                               frmMain.os.ExternalSVC,
                               v_pid, // merFIOMK.Properties.Editors[1].Value
                               v_an,  // erowNumProt.Properties.Value
                               '',    // p_studyUID
                               False ,  // old_form
                               True
                            );
              end;
            end;
          Finally
            FreeLibrary(DLL_HANDLE);
          End;
        end
        else
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
          rowNumIssl.Properties.Value;               // accessionnumber
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
        MyShowShimok;
    end
    else
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

procedure TfrmProtocolN.aStartEditExecute(Sender: TObject);
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

procedure TfrmProtocolN.aUndoExecute(Sender: TObject);
begin
  rveText.Undo;
end;

procedure TfrmProtocolN.bClearClick(Sender: TObject);
begin
  if Application.MessageBox('Вы собираетесь очистить текст протокола.'+#13#10+
                            'Уверены?', 'Вопрос', MB_ICONQUESTION+MB_OKCANCEL)= IDOk then
    begin
      rveText.Clear;
      rveText.Format;
      rveText.SetFocus;
    end;
end;

procedure TfrmProtocolN.bCopyClick(Sender: TObject);
begin
  rveText.CopyText;
end;

procedure TfrmProtocolN.bCutClick(Sender: TObject);
begin
  rveText.CutDef;
end;

procedure TfrmProtocolN.bLoadTemplClick(Sender: TObject);
var memStream : TMemoryStream;
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
        rveText.Format;
      end;
  finally
    memStream.Free;
  end;
end;

procedure TfrmProtocolN.bNoSpellClick(Sender: TObject);
begin
  rveText.ClearLiveSpellingResults;
end;

procedure TfrmProtocolN.bPasteClick(Sender: TObject);
begin
  rveText.PasteText;
  rveText.Reformat;
end;

procedure TfrmProtocolN.bSaveTemplClick(Sender: TObject);
var memStream : TMemoryStream;
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

procedure TfrmProtocolN.bSpellClick(Sender: TObject);
begin
  rveText.StartLiveSpelling;
end;

function TfrmProtocolN.CanSubscribeSertificat(os: TOracleSession; pNazID: integer; Base: string): Boolean;
var ods : TOracleDataSet;
begin
 Result := True;
 if Base = 'SK' then
  begin
   ods := TOracleDataSet.Create(nil);
   try
     ods.Cursor := crSQLWait;
     ods.Session := frmMain.os;
     ods.SQL.Text := ' select asu.pkg_uslugi.CanSubscribeNazSK(:pNazid) as N from dual ';
     ods.DeclareAndSet('pNazid', otInteger, pNazId);
     ods.Close;
     ods.Open;
     Result :=  ods.FieldByName('N').AsInteger > 0;
   finally
    ods.Free;
   end;
  end;
end;

function TfrmProtocolN.DoCheckForHeal(pSMIDID, pSOTRID, pNAZID: Integer) : Integer;
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

function TfrmProtocolN.DoCheckParameters: Integer;
var ods : TOracleDataSet;
begin
  if merDozaTime.Properties.Editors[0].Options.Editing = True then
    begin
      if merDozaTime.Properties.Editors[0].Value = 0 then
        begin
          Application.MessageBox('Внимание! Доза исследования не может быть равна нулю!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
          Result := 0;
          Exit;
        end;
    end;
  if merDozaTime.Properties.Editors[0].Options.Editing = True then
    begin
      if merDozaTime.Properties.Editors[0].Value = Null then
        begin
          Application.MessageBox('Внимание! Доза исследования не может быть равна пустому значению!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
          Result := 0;
          Exit;
        end;
    end;
  if merDozaTime.Properties.Editors[1].Value = 0 then
    begin
      Application.MessageBox('Внимание! Время исследования не может быть равно нулю!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      Result := 0;
      Exit;
    end;
  if merDozaTime.Properties.Editors[1].Value = Null then
    begin
      Application.MessageBox('Внимание! Время исследования не может быть равно пустому значению!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      Result := 0;
      Exit;
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
        if merDateTime.Properties.Editors[0].Value > ods.FieldByName('farday').AsDateTime then
          begin
            MessageDlg('Внимание!'+#13+#10+
                       'Вы не можете распределить исследование на эту дату!'+#13+#10+
                       'Выберите дату меньше '+DateTimeToStr(ods.FieldByName('farday').AsDateTime)+'!', mtInformation, [mbOK], 0);
            merDateTime.Focused := True;
            Result:= 0;
            exit;
          end;
      finally
        ods.Free;
      end;
    end;

//  if cxdeDateProtocol.Text = '' then
//    begin
//      Application.MessageBox('Вам необходимо указать ДАТУ проведения исследования!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
//      cxdeDateProtocol.SetFocus;
//      Result:= 0;
//      exit;
//    end;

  Result := 1;
end;

procedure TfrmProtocolN.DoInsertEditParametersNaz;
var oq : TOracleQuery;
    ods : TOracleDataSet;
    memStream : TMemoryStream;
begin
  oq := TOracleQuery.Create(nil);
  ods := TOracleDataSet.Create(nil);
  try
    oq.Session := frmMain.os;
    ods.Session := frmMain.os;
//--- доза (tib.fk_smid = -1)
    if (merDozaTime.Properties.Editors[0].Value <> 0) and (merDozaTime.Properties.Editors[0].Value <> Null) then
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
        ods.DeclareAndSet('PFN_NUM', otFloat, StrToFloat(merDozaTime.Properties.Editors[0].Value));
        ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
        ods.DeclareAndSet('PFK_SMID', otInteger, -1);
        ods.DeclareAndSet('PFK_SMEDITID', otInteger, -1);
        ods.Open;
        frmMain.os.Commit; //??? должны ли быть коммиты после каждого запроса
      end;
//--- время (tib.fk_smid = -2)
    if (merDozaTime.Properties.Editors[1].Value <> 0) and (merDozaTime.Properties.Editors[1].Value <> Null) then
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
        ods.DeclareAndSet('PFN_NUM', otFloat, StrToFloat(merDozaTime.Properties.Editors[1].Value));
        ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
        ods.DeclareAndSet('PFK_SMID', otInteger, -2);
        ods.DeclareAndSet('PFK_SMEDITID', otInteger, -2);
        ods.Open;
        frmMain.os.Commit;
      end;
//--- Врач
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
        ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
        ods.DeclareAndSet('PFN_NUM', otInteger, merLaborantVrach.Properties.Editors[0].Value);
        ods.DeclareAndSet('PFK_VRACHID', otInteger, frmMain.pSOTRID);
        ods.Open;
        frmMain.os.Commit;
      end;
//------------------------------------------------------------------------------
      if rowZakl.Properties.Value <> '' then //Заключение //если хотим сохранить пустой текст !!! не вариант!
        begin
	        if IDSMIDZAKL = 0 then
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
			      	                  '   SELECT FK_ID INTO nSMID21 FROM TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''; '+
				                        '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :PFC_CHAR21, nSMID21, nSMID21, :pFK_VRACHID); '+
				                        ' END IF; '+
				                        ' END; ';
              oq.DeclareAndSet('PFK_ID', otInteger, pNAZID);
	            oq.DeclareAndSet('pFC_CHAR21', otString, rowZakl.Properties.Value);
	            oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
	            oq.Execute;
	            frmMain.os.Commit;
	    end else
	    begin
	      oq.DeleteVariables; // !!! почему не сохраняется FN_NUM
	      oq.SQL.Text := ' DECLARE '+
	                  			'   nSMID21 NUMBER; '+
				                  '   Cnt21 NUMBER; '+
				                  ' BEGIN '+
				                  '   SELECT COUNT(FK_ID) INTO Cnt21 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''); '+
			                  	' IF Cnt21 > 0 THEN '+
		                  		'   UPDATE TIB SET FC_CHAR = :pFC_CHAR21, FK_BID = :PFK_BID21, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''); '+
			                  	' ELSE '+
			                   	'   SELECT FK_ID INTO nSMID21 FROM TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''; '+
			                   	'   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_BID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :PFC_CHAR21, :PFK_BID21, nSMID21, nSMID21, :pFK_VRACHID); '+
			                  	' END IF; '+
			                  	' END; ';
        oq.DeclareAndSet('PFK_ID', otInteger, pNAZID);
	      oq.DeclareAndSet('pFC_CHAR21', otString, rowZakl.Properties.Value);
        oq.DeclareAndSet('pFK_BID21', otInteger, IDSMIDZAKL);
	      oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
	      oq.Execute;
	      frmMain.os.Commit;
	    end;
	end;
//--- Куда направлен
  if (rowKudaNapravlen.Visible <> False) and (rowKudaNapravlen.Properties.Value <> 0) and (isKudaNapravlenChange = True) then
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
    end;
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
      ods.DeclareAndSet('PFC_CHAR', otString, rowRecom.Properties.Value);
      ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
      ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
      ods.Open;
      frmMain.os.Commit;
    end;
    finally
      oq.Free;
      ods.Free;
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
  try
	  rveText.SaveRVFToStream(memStream,False);
//сохраняем в BLOB
	  memStream.Position := 0;
	  TBlobField(odsRVData.FieldByName('FB_BLOB')).LoadFromStream(memStream);
	  memStream.Clear;

//сохраняем в HTML
	  rveText.AddBreak;
    if rowZakl.Properties.Value <> '' then
  	  rveText.Add('ЗАКЛЮЧЕНИЕ:'+rowZakl.Properties.Value, 0);
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
    odsRVData.Post;
    frmMain.os.Commit;
  finally
    memStream.Free;
  end;
end;

procedure TfrmProtocolN.DoLog;
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
                   ' values(''Заключение'', :pfc_value, sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmProtocolN'') ';
    oq.DeclareAndSet('pfc_value', otString, rowZakl.Properties.Value);
    oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
    oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
    oq.DeclareAndSet('pfc_osuser', otString, sUserOs);
    oq.DeclareAndSet('pfc_machine', otString, sMachine);
    oq.DeclareAndSet('pfc_module', otString, sModule);
    oq.Execute;

    oq.DeleteVariables;
    oq.SQL.Text := ' insert into asu.txray_log(fc_field, fc_value, fd_date, fk_nazid, fk_sotrid, fc_osuser, fc_machine, fc_module, fc_form) '+#13+
                   ' values(''Доза'', :pfc_value, sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmProtocolN'') ';
    oq.DeclareAndSet('pfc_value', otString, FloatToStr(merDozaTime.Properties.Editors[0].Value));
    oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
    oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
    oq.DeclareAndSet('pfc_osuser', otString, sUserOs);
    oq.DeclareAndSet('pfc_machine', otString, sMachine);
    oq.DeclareAndSet('pfc_module', otString, sModule);
    oq.Execute;

    oq.DeleteVariables;
    oq.SQL.Text := ' insert into asu.txray_log(fc_field, fc_value, fd_date, fk_nazid, fk_sotrid, fc_osuser, fc_machine, fc_module, fc_form) '+#13+
                   ' values(''Время услуги'', :pfc_value, sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmProtocolN'') ';
    oq.DeclareAndSet('pfc_value', otString, merDozaTime.Properties.Editors[1].Value);
    oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
    oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
    oq.DeclareAndSet('pfc_osuser', otString, sUserOs);
    oq.DeclareAndSet('pfc_machine', otString, sMachine);
    oq.DeclareAndSet('pfc_module', otString, sModule);
    oq.Execute;

    oq.DeleteVariables;
    oq.SQL.Text := ' insert into asu.txray_log(fc_field, fc_value, fd_date, fk_nazid, fk_sotrid, fc_osuser, fc_machine, fc_module, fc_form) '+#13+
                   ' values(''Дата протокола'', :pfc_value, sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmProtocolN'') ';
    oq.DeclareAndSet('pfc_value', otString, DateTimeToStr(trunc(merDateTime.Properties.Editors[0].Value)));
    oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
    oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
    oq.DeclareAndSet('pfc_osuser', otString, sUserOs);
    oq.DeclareAndSet('pfc_machine', otString, sMachine);
    oq.DeclareAndSet('pfc_module', otString, sModule);
    oq.Execute;

    oq.DeleteVariables;
    oq.SQL.Text := ' insert into asu.txray_log(fc_field, fc_value, fd_date, fk_nazid, fk_sotrid, fc_osuser, fc_machine, fc_module, fc_form) '+#13+
                   ' values(''Время протокола'', :pfc_value, sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmProtocolN'') ';
    oq.DeclareAndSet('pfc_value', otString, merDateTime.Properties.Editors[1].Value);
    oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
    oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
    oq.DeclareAndSet('pfc_osuser', otString, sUserOs);
    oq.DeclareAndSet('pfc_machine', otString, sMachine);
    oq.DeclareAndSet('pfc_module', otString, sModule);
    oq.Execute;

    oq.DeleteVariables;
    oq.SQL.Text := ' insert into asu.txray_log(fc_field, fc_value, fd_date, fk_nazid, fk_sotrid, fc_osuser, fc_machine, fc_module, fc_form) '+#13+
                   ' values(''Врач-рентгенолог'', asu.do_vrachfio(:pfc_value), sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmProtocolN'') ';
    oq.DeclareAndSet('pfc_value', otString, merLaborantVrach.Properties.Editors[0].Value);
    oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
    oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
    oq.DeclareAndSet('pfc_osuser', otString, sUserOs);
    oq.DeclareAndSet('pfc_machine', otString, sMachine);
    oq.DeclareAndSet('pfc_module', otString, sModule);
    oq.Execute;

    oq.DeleteVariables;
    oq.SQL.Text := ' insert into asu.txray_log(fc_field, fc_value, fd_date, fk_nazid, fk_sotrid, fc_osuser, fc_machine, fc_module, fc_form) '+#13+
                   ' values(''Куда направлен'', asu.get_smidname(:pfc_value), sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmProtocolN'') ';
    oq.DeclareAndSet('pfc_value', otString, rowKudaNapravlen.Properties.Value);
    oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
    oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
    oq.DeclareAndSet('pfc_osuser', otString, sUserOs);
    oq.DeclareAndSet('pfc_machine', otString, sMachine);
    oq.DeclareAndSet('pfc_module', otString, sModule);
    oq.Execute;

    oq.DeleteVariables;
    oq.SQL.Text := ' insert into asu.txray_log(fc_field, fc_value, fd_date, fk_nazid, fk_sotrid, fc_osuser, fc_machine, fc_module, fc_form) '+#13+
                   ' values(''Диагноз'', :pfc_value, sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmProtocolN'') ';
    oq.DeclareAndSet('pfc_value', otString, rowDs.Properties.Value);
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

procedure TfrmProtocolN.DoPodpis;
var oq : TOracleQuery;
    ods : TOracleDataSet;
begin
  oq := TOracleQuery.Create(nil);
  ods := TOracleDataSet.Create(nil);
  try
    oq.Session := frmMain.os;
    ods.Session := frmMain.os;
//--- TNAZIS
    oq.SQL.Text := ' update asu.tnazis set fk_nazsosid=:pfk_nazsosid, fk_ispolid=:pfk_ispolid, fd_run=:pfd_run, fl_in_raspis = 1 where fk_id=:pfk_id ';
    oq.DeclareAndSet('PFK_NAZSOSID', otInteger, GET_VIPNAZ);
    oq.DeclareAndSet('pFK_ISPOLID', otInteger, merLaborantVrach.Properties.Editors[0].Value);
    oq.DeclareAndSet('pFD_RUN', otDate, StrToDateTime(DateToStr(merDateTime.Properties.Editors[0].Value)+' '+FormatDateTime('hh:nn:ss', IncSecond(merDateTime.Properties.Editors[1].Value, 1))));
    oq.DeclareAndSet('pFK_ID', otInteger, pNAZID);
    oq.Execute;
//--- VRES
    ods.SQL.Text := ' MERGE INTO ASU.VRES '+#13#10+
                    '  USING DUAL ON (FK_NAZID = :PFK_NAZID) '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FK_SMID=:PFK_SMID, FD_INS=:PFD_INS, FK_VRACHID=:PFK_VRACHID, FK_SOS=:PFK_SOS '+#13#10+
                    '                    WHERE FK_NAZID = :PFK_NAZID '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT(FK_SMID, FD_INS, FC_RES, FC_TYPE, FK_VRACHID, FK_PACID, FK_PATID, FK_NAZID, FK_SOS) '+#13#10+
                    '                       VALUES(:pFK_SMID, :pFD_INS, '''', ''TEXT'', :PFK_VRACHID, :pFK_PACID, 0, :pFK_NAZID, :PFK_SOS) ';
    ods.DeclareAndSet('PFK_NAZID', otInteger, pNAZID);
    ods.DeclareAndSet('PFK_SMID', otInteger, pSMIDID);
    ods.DeclareAndSet('pFD_INS', otDate, StrToDateTime(DateToStr(merDateTime.Properties.Editors[0].Value)+' '+FormatDateTime('hh:nn:ss', IncSecond(merDateTime.Properties.Editors[1].Value, 1))));
    ods.DeclareAndSet('PFK_VRACHID', otInteger, merLaborantVrach.Properties.Editors[0].Value);
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.DeclareAndSet('PFK_SOS', otInteger, GET_VIPNAZ);
    ods.Open;
//--- TPODPISNAZ
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' MERGE INTO ASU.TPODPISNAZ '+#13#10+
                    '  USING DUAL ON (FK_NAZID = :PFK_NAZID AND FK_SOTRID = :pFK_SOTRID) '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FK_SOS=:PFK_SOS, FD_INS = :PFD_INS '+#13#10+
                    '                    WHERE FK_NAZID = :PFK_NAZID AND FK_SOTRID = :pFK_SOTRID '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT(FK_NAZID, FK_SOTRID, FK_SOS, FD_DATE, FD_INS) '+#13#10+
                    '                       VALUES(:pFK_NAZID, :pFK_SOTRID, :PFK_SOS, SYSDATE, :pFD_INS) ';
    ods.DeclareAndSet('pFK_NAZID', otInteger, pNAZID);
    ods.DeclareAndSet('pFK_SOTRID', otInteger, merLaborantVrach.Properties.Editors[0].Value);
    ods.DeclareAndSet('PFK_SOS', otInteger, GET_VIPNAZ);
    ods.DeclareAndSet('pFD_INS', otDate, StrToDateTime(DateToStr(merDateTime.Properties.Editors[0].Value)+' '+FormatDateTime('hh:nn:ss', IncSecond(merDateTime.Properties.Editors[1].Value, 1))));
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

procedure TfrmProtocolN.DoRgVrach;
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

procedure TfrmProtocolN.DoSetEditRights;
var ods : TOracleDataSet;
    kolvoParam : Integer;
    kolvoDays : Integer;
begin
  if frmMain.bIsAdmin <> 1 then
    begin
      aControlProtocol.Visible := False;        // 1. если пользователь не входит в группу "Администраторы"
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
        ods.SQL.Text := ' SELECT ROUND(sysdate - (SELECT MAX(FD_DATE) FROM ASU.TPODPISNAZ WHERE FK_SOS = GET_VIPNAZ AND FK_NAZID = :PFK_NAZID)) AS CNT FROM TNAZIS WHERE FK_ID = :PFK_NAZID ';
        ods.DeclareAndSet('PFK_NAZID', otInteger, pNAZID);
        ods.Open;
        kolvoDays := ods.FieldByName('CNT').AsInteger;
        if KolvoDays >= kolvoParam then
          begin
            rowEdit.Visible := True;
            rowEdit.Properties.Value := 'Прошло более '+IntToStr(KolvoParam)+' суток! Изменить протокол нельзя! ';
            rowKudaNapravlen.Properties.EditProperties.ReadOnly := True;
            rveText.ReadOnly := true;
            //rveText.Enabled := False;

            verGrPodpisi.Enabled := False;
            merDateTime.Properties.Editors[0].Options.ShowEditButtons := eisbNever;
            merDateTime.Properties.Editors[1].Options.ShowEditButtons := eisbNever;
            merLaborantVrach.Properties.Editors[0].Options.ShowEditButtons := eisbNever;
            rowDs.Properties.EditProperties.Buttons[0].Visible := False;
            rowDs.Properties.EditProperties.Buttons[1].Visible := False;
            rowDs.Properties.EditProperties.Buttons[2].Visible := False;
            rowZakl.Properties.EditProperties.Buttons[0].Visible := False;

            actPass.Enabled := False;
            aSave.Enabled := False;
            aPodpis.Enabled := False;
            chkOtmetki.Enabled := False;
            aOtmetki.Enabled := False;
            aControlProtocol.Enabled := False;
            bClear.Enabled := False; // очистить
            bCut.Enabled := False; // вырезать
            bCopy.Enabled := False; // копировать
            bPaste.Enabled := False; // вставить
            bSaveTempl.Enabled := False; // сохранить в шаблон
            bLoadTempl.Enabled := False; // загрузить из шаблона
          end else
          begin
            rowEdit.Visible := False;
            rowEdit.Properties.Value := '';
            rowKudaNapravlen.Properties.EditProperties.ReadOnly := False;
            rveText.ReadOnly := False;
            //rveText.Enabled := True;

            verGrPodpisi.Enabled := True;

            actPass.Enabled := True;
            aSave.Enabled := True;
            aPodpis.Enabled := True;
            chkOtmetki.Enabled := True;
            aOtmetki.Enabled := True;
            aControlProtocol.Enabled := True;
            bClear.Enabled := True; // очистить
            bCut.Enabled := True; // вырезать
            bCopy.Enabled := True; // копировать
            bPaste.Enabled := True; // вставить
            bSaveTempl.Enabled := True; // сохранить в шаблон
            bLoadTempl.Enabled := True; // загрузить из шаблона
          end;
      finally
        ods.Free;
      end;
    end else
    begin
      aControlProtocol.Visible := True;
    end;
end;

procedure TfrmProtocolN.DoSetEnabledPodpisClose(value: boolean);
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
  verGrPodpisi.Enabled := value;
end;

procedure TfrmProtocolN.DoShowButtons;
begin
// -- кнопка "Зачесть"
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
    
// -- кнопка "Снимки"
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

procedure TfrmProtocolN.DoShowForm(nAMBUL, nPACID, nPEPLID, nSMIDID, nNAZID, nREANIM: Integer; strIssl : string);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    Screen.Cursor := crSQLWait;
    ods.Session := frmMain.os;
//-->> Константы
    pPACID := nPACID;
    pPEPLID := nPEPLID;
    pSMIDID := nSMIDID;
    pNAZID := nNAZID;
    pAmbul := nAMBUL;

    rowDs.Tag := 0;
    nDsFirst := 0;
    nDsShowIb := 0;
    sDsName := '';
    sDsMkbCode := '';
    isRecomChange := False;
    isKudaNapravlenChange := False;
 //-->> Видимые компоненты
    rowStatusMK.Visible := False;
    rowEdit.Visible := False;
    rowReanim.Visible := False;
    rowTub.Visible := False;
    if pOWNERID = 0 then
      begin
        ods.SQL.Text := ' SELECT FK_OWNER FROM ASU.TSMID WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, nSMIDID);
        ods.Open;
        pOWNERID := ods.FieldByName('FK_OWNER').AsInteger;
      end;
    // дозу для кабинета МРТ дизайблим и делаем не в фокусе
    merDozaTime.Properties.Editors[0].Options.Editing := POWNERID <> frmMain.GET_XRAY_MRT;
    merDozaTime.Properties.Editors[0].Options.Focusing := POWNERID <> frmMain.GET_XRAY_MRT; 
    // куда направлен показываем только для флюорографического кабинета
    rowKudaNapravlen.Visible := pOWNERID = frmMain.GET_ISSL_FLU;
    // показываем Сигнальную информацию - Реанимация если пациент находится в реанимации
    rowReanim.Visible := nREANIM = 1;
    // показываем кнопку "Снимки" в зависимости от настроек
    aPodpis.Visible := frmMain.get_show_podpis = '-1';      
    // показываем или не показываем строку "Диагноз"
    rowDs.Visible := False;
    // показываем или не показываем проверку орфографии
    if frmMain.get_check_spell = '-1' then
      begin
        bSpell.Visible := ivAlways;
        bNoSpell.Visible := ivAlways;
      end else
      begin
        bSpell.Visible := ivNever;
        bNoSpell.Visible := ivNever;
      end;

    if listxrayvrach_protokolhidediag = 0 then //Melnikov 2015.12.21 #34078
     begin
      ods.DeleteVariables;
      ods.Close;
      ods.SQL.Text := ' SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_KEY = ''XRAY_SHOW_DS'' '; // !!! переделать и вынести в главную форму
      ods.Open;
      if ods.FieldByName('FC_VALUE').AsString <> '' then
        begin
          case StrToInt(ods.FieldByName('FC_VALUE').AsString) of
            -1 : rowDs.Visible := True;
             0 : rowDs.Visible := False;
          end;
        end;
     end;
// -- показываем или не показываем строку "Рекомендации"
//    ods.DeleteVariables;
//    ods.Close;
//    rowRecom.Visible := False;
//    ods.SQL.Text := ' SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_KEY = ''XRAY_SHOW_RECOM'' ';
//    ods.Open;
//    if ods.FieldByName('FC_VALUE').AsString <> '' then
//      begin
//        case StrToInt(ods.FieldByName('FC_VALUE').AsString) of
//          -1 : rowRecom.Visible := True;
//           0 : rowRecom.Visible := False;
//        end;
//      end;
    rowRecom.Visible := frmMain.show_recom = '-1';  
//-->> На учете в туб диспансере
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT NAZ.FK_ID, TUB.FN_COUNTYEAR, TUB.FD_END, ASU.GET_SMIDNAME(TUB.FK_PERIODID_REC) AS REC '+#13#10+
                    '   FROM ASU.TNAZIS NAZ, ASU.TTUBPARAM TUB '+#13#10+
                    '  WHERE NAZ.FK_SMID = ASU.GET_XRAY_TUBDISPANCER '+#13#10+
                    '    AND NAZ.FK_PACID = ASU.GET_PEPLID(:PFK_PACID) '+#13#10+
                    '    AND NAZ.FK_ID = TUB.FK_NAZID '+#13#10+
                    '    AND SYSDATE >= TUB.FD_BEGIN '+#13#10+
                    '    AND SYSDATE < TUB.FD_END+1 '+#13#10+
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
//-->> ФИО, №МК, Дата рождения, Возраст, Пол
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT FC_FAM||'' ''||FC_IM||'' ''||FC_OTCH AS FIO, '+#13#10+
                    '        TO_CHAR(FD_ROJD, ''DD.MM.YYYY'') AS DATE_BIRTH, '+#13#10+
                    '        DECODE(FP_SEX, 0, ''Женский'', 1, ''Мужской'', -1, ''Не определен'') AS SEX, '+#13#10+
                    '        TRUNC(MONTHS_BETWEEN(SYSDATE,FD_ROJD)/12) AS AGE, '+#13#10+
                    '        ASU.GET_IB(:PFK_PACID) AS NUMMK '+#13#10+
                    '   FROM ASU.TPEOPLES '+#13#10+
                    '  WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, nPEPLID);
    ods.DeclareAndSet('PFK_PACID', otInteger, nPACID);
    ods.Open;
    merFIOMK.Properties.Editors[0].Value := ods.FieldByName('FIO').AsString;
    merFIOMK.Properties.Editors[1].Value := ods.FieldByName('NUMMK').AsString;
    merDateAgeSex.Properties.Editors[0].Value := ods.FieldByName('DATE_BIRTH').AsString;
    merDateAgeSex.Properties.Editors[1].Value := ods.FieldByName('AGE').AsString;
    merDateAgeSex.Properties.Editors[2].Value := ods.FieldByName('SEX').AsString;
//-->> Выписан (работает только для стационарных пациентов)
    if nAMBUL = 0 then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' SELECT FP_TEK_COC FROM ASU.TKARTA WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, nPACID);
        ods.Open;
        rowStatusMK.Visible := ods.FieldByName('FP_TEK_COC').AsInteger = 3;
      end;
//-->> Исследование, № иссл., Заключение, Лаборант, Дата, Время, Рекомендации
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT FK_NAZTYPEID, FD_RUN, FK_ISPOLID, '+#13#10+
                    '        (SELECT MAX(FC_CHAR) '+#13#10+
                    '           FROM ASU.TIB '+#13#10+
                    '          WHERE FK_PACID = :PFK_ID '+#13#10+
                    '            AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME'')) AS XRAY_VRACH_RESUME, '+#13#10+
		                '        (SELECT ASU.DO_VRACHFIO(MAX(FN_NUM)) '+#13#10+
                    '           FROM ASU.TIB '+#13#10+
                    '          WHERE FK_PACID = :PFK_ID '+#13#10+
                    '            AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''RG_LABORANT'')) AS LABFIO, '+#13#10+
                    '       (SELECT MAX(FC_CHAR) '+#13#10+
                    '          FROM ASU.TIB '+#13#10+
                    '         WHERE FK_PACID = :PFK_ID '+#13#10+
                    '           AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL'' OR FC_SYNONIM = ''XRAY_FLU_NUMBER'')) AS NUMBER_ISSL '+#13#10+
		                '   FROM ASU.TNAZIS WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;

    rowIssl.Properties.Value := strIssl;
  //  if USE_ONE_ACCESSIONNUMBER=0 then
    rowNumIssl.Properties.Value := ods.FieldByName('NUMBER_ISSL').AsString;
    rowZakl.Properties.Value := ods.FieldByName('XRAY_VRACH_RESUME').AsString;
    merLaborantVrach.Properties.Editors[1].Value := ods.FieldByName('LABFIO').AsString;
    merDateTime.Properties.Editors[0].Value := ods.FieldByName('FD_RUN').AsDateTime;
    merDateTime.Properties.Editors[1].Value := ods.FieldByName('FD_RUN').AsDateTime;
//-->> Кем направлен
    if nAMBUL = 1 then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' SELECT DECODE(FC_CHAR, NULL, ASU.GET_SMIDNAME(TIB.FK_SMID), FC_CHAR) AS KEM_NAPRAVLEN '+#13+
                        '   FROM ASU.TIB '+#13+
                        '  WHERE FK_PACID = :PFK_ID '+#13+
                        '    AND FK_SMID IN (SELECT FK_ID '+#13+
                        '                      FROM ASU.TSMID '+#13+
                        '                    START WITH FC_SYNONIM = ''KEM_NAPRAVLEN'' '+#13+
                        '                    CONNECT BY PRIOR FK_ID = FK_OWNER '+#13+
                        '                    UNION ALL '+#13+
                        '                    SELECT FK_ID FROM ASU.TSMID '+#13+
                        '                    START WITH FC_SYNONIM = ''PD_NAPRAVIV_YCH'' '+#13+
                        '                    CONNECT BY PRIOR FK_ID = FK_OWNER) ';
        ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        ods.Open;
    		rowKemNapravlen.Properties.Value := ods.FieldByName('KEM_NAPRAVLEN').AsString;
      end else
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' SELECT ASU.GET_VRACHFCOTDEL(FK_VRACHID)||'' ''||''-''||'' ''||ASU.DO_VRACHFIO(FK_VRACHID) AS KEM_NAPRAVLEN '+#13+
                        '   FROM ASU.TNAZIS '+#13+
                        '  WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        ods.Open;
        rowKemNapravlen.Properties.Value := ods.FieldByName('KEM_NAPRAVLEN').AsString;
      end;
//-->> Куда направлен
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
      end;
//-->> Диагноз
    if rowDs.Visible = True then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' SELECT FK_ID, FL_FIRST, FL_SHOWIB, FC_WRITE, FK_NAZID, '+#13+
                        '        (SELECT FK_MKB10 FROM ASU.TSMID WHERE FK_ID = TDIAG.FK_SMDIAGID) AS MKBCODE '+#13+
                        '   FROM ASU.TDIAG '+#13+
                        '  WHERE FK_NAZID = :PFK_NAZID ';
        ods.DeclareAndSet('PFK_NAZID', otInteger, pNAZID);
        ods.Open;
        if ods.RecordCount > 0 then        
          rowDs.Properties.Value := '('+ods.FieldByName('MKBCODE').AsString+') '+ods.FieldByName('FC_WRITE').AsString
        else
          rowDs.Properties.Value := '';
        rowDs.Tag := ods.FieldByName('FK_NAZID').AsInteger;
        nDsFirst := ods.FieldByName('FL_FIRST').AsInteger;
        nDsShowIB := ods.FieldByName('FL_SHOWIB').AsInteger;
        sDsName := ods.FieldByName('FC_WRITE').AsString;
        sDsMkbCode := ods.FieldByName('MKBCODE').AsString;
        rowDs.Properties.EditProperties.Buttons[0].Enabled := rowDs.Tag = 0;
        rowDs.Properties.EditProperties.Buttons[1].Enabled := rowDs.Tag <> 0;
        rowDs.Properties.EditProperties.Buttons[2].Enabled := rowDs.Tag <> 0;
      end;
//-->> Рекомендации
    if rowRecom.Visible = True then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' SELECT FC_CHAR '+#13#10+
                        '   FROM ASU.TIB '+#13#10+
                        '  WHERE FK_PACID = :PFK_ID '+#13#10+
                        '    AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_PROTOCOL_RECOM'') ';
        ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        ods.Open;
        rowRecom.Properties.Value := ods.FieldByName('FC_CHAR').AsString;
      end;
//-->> Доза (работает для всех исследований кроме МРТ)
    if merDozaTime.Properties.Editors[0].Options.Editing = True then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' BEGIN '+#13+
                        '   SELECT MAX(FN_NUM) INTO :nCNT_DOZA FROM ASU.TIB WHERE FK_PACID = :pFK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1; '+#13+
                        '   IF :nCNT_DOZA IS NULL THEN '+#13+
                        '     SELECT FN_NORM0 INTO :nCNT_DOZA FROM ASU.TSMID WHERE FK_ID = :pFK_SMID; '+#13+
                        '   END IF; '+#13+
                        ' END; ';
        ods.DeclareAndSet('pFK_ID', otInteger, nNAZID);
        ods.DeclareAndSet('pFK_SMID', otInteger, nSMIDID);
        ods.DeclareVariable('nCNT_DOZA', otFloat);
        ods.Open;
        merDozaTime.Properties.Editors[0].Value := FloatToStr(ods.GetVariable('nCNT_DOZA'));
      end;
//-->> время
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' BEGIN '+#13+
                    '   SELECT MAX(FN_NUM) INTO :nCNT_TIME FROM ASU.TIB WHERE FK_PACID = :pFK_ID AND FK_SMID = -2 AND FK_SMEDITID = -2; '+#13+
                    '   IF :nCNT_TIME IS NULL THEN '+#13+
                    '     SELECT FC_TIME INTO :nCNT_TIME FROM ASU.TSMID WHERE FK_ID = :pFK_SMID; '+#13+
                    '   END IF; '+#13+
                    ' END; ';
    ods.DeclareAndSet('pFK_ID', otInteger, nNAZID);
    ods.DeclareAndSet('pFK_SMID', otInteger, nSMIDID);
    ods.DeclareVariable('nCNT_TIME', otFloat);
    ods.Open;
    merDozaTime.Properties.Editors[1].Value := FloatToStr(ods.GetVariable('nCNT_TIME'));
//-->> контрастирование
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select count(fk_smid) as cnt from asu.tmk where fk_smid = :pfk_smid ';
    ods.DeclareAndSet('pfk_smid', otInteger, pSMIDID);
    ods.Open;

  //  ShowMessage('pSMIDID='+inttostr(pSMIDID));

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
        ods.DeclareAndSet('pfk_pacid', otInteger, nNAZID);
        ods.Open;
      {if not ods.eof then
      begin }
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
// -- поднимаем данные
    DoRgVrach; // врач
    DoTextProtocol; // текст протокола
    DoShowButtons; // кнопки "Зачесть" и "Снимки"
    DoSetEditRights; //права

//-->> Работа с ЭЦП
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
        frmProtocolN.Height := frmProtocolN.Height - vGrSignal.Height;
      end else
      begin
        vGrSignal.Visible := True;
      end;
//-->> размеры
    if rowKudaNapravlen.Visible = True then
      VerGrFIO.Height := 128  // так надо
    else
      VerGrFIO.Height := 110;
  finally
    ods.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmProtocolN.DoShowProtocol_4OBTC(pIsOffice:Boolean=False);
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
    ods.DeclareAndSet('pfk_id', otInteger, merLaborantVrach.Properties.Editors[0].Value);
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

procedure TfrmProtocolN.DoShowProtocol_4OKBHMAO(pIsOffice: Boolean = False);
var
  ods : TOracleDataSet;
  ms: TMemoryStream;
begin
  rveText.SetSelectionBounds(0, rveText.GetOffsBeforeItem(0), rveText.ItemCount - 1,
    rveText.GetOffsAfterItem(rveText.ItemCount - 1));
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

  if vGrKontrast.Visible = True // - с контрастом
  then begin
    if pOWNERID = frmMain.GET_XRAY_MRT
    then begin
      frxRepOKBKontrast.FindObject('Memo7').Visible := False;
      frxRepOKBKontrast.FindObject('Memo6').Visible := False;
      frxRepOKBKontrast.FindObject('Memo13').Visible := False;
    end
    else begin
      frxRepOKBKontrast.FindObject('Memo7').Visible := True;
      frxRepOKBKontrast.FindObject('Memo6').Visible := True;
      frxRepOKBKontrast.FindObject('Memo13').Visible := True;
    end;

    if (FUseDigitalSign) and (imSign.Visible = True)
    then frxRepOKBKontrast.FindObject('Memo17').Visible := True
    else frxRepOKBKontrast.FindObject('Memo17').Visible := False;

    //--- Показываем или не показываем диагноз
    frxRepOKBKontrast.FindObject('Memo9').Visible := rowDs.Visible;
    frxRepOKBKontrast.FindObject('Memo10').Visible := rowDs.Visible;
    //--- Показываем или не показываем рекомендации
    frxRepOKBKontrast.FindObject('Memo12').Visible := rowRecom.Visible;
    frxRepOKBKontrast.FindObject('Memo16').Visible := rowRecom.Visible;

    if pIsOffice
    then begin
      (frxRepOKBKontrast.FindObject('rvTEXTISSL') as TfrxRichView).Visible:=False;
      (frxRepOKBKontrast.FindObject('Memo8') as TfrxMemoView).Visible:=True;
       CmnHeadPartRep( frxRepOKBKontrast, frxHTMLExport1, nil, rveText, 'Memo8' );
    end
    else begin
      {Текст исследования}
      (frxRepOKBKontrast.FindObject('rvTEXTISSL') as TfrxRichView).Visible := False;
      (frxRepOKBKontrast.FindObject('Memo8') as TfrxMemoView).Visible := True;

      ms := TMemoryStream.Create;
      ms.Clear;
      rveText.Format;
      rveText.SaveRTFToStream(ms, False);
      ms.Position := 0;
      TfrxRichView(frxRepOKBKontrast.FindObject('rvTEXTISSL')).RichEdit.Lines.LoadFromStream(ms);
      ms.Free;

      if (rowZakl.Properties.Value <> '')
      then begin
        TfrxRichView(frxRepOKBKontrast.FindObject('rvTEXTISSL')).RichEdit.Lines.Add('');
        TfrxRichView(frxRepOKBKontrast.FindObject('rvTEXTISSL')).RichEdit.Lines.Add('ЗАКЛЮЧЕНИЕ: ' + rowZakl.Properties.Value);
      end;

      {/Текст исследования}
      frxRepOKBKontrast.ShowReport;
    end;
  end
  else begin // -- без контраста
    if pOWNERID = frmMain.GET_XRAY_MRT
    then begin
      frxRepOKB.FindObject('Memo7').Visible := False;
      frxRepOKB.FindObject('Memo6').Visible := False;
      frxRepOKB.FindObject('Memo13').Visible := False;
    end
    else begin
      frxRepOKB.FindObject('Memo7').Visible := True;
      frxRepOKB.FindObject('Memo6').Visible := True;
      frxRepOKB.FindObject('Memo13').Visible := True;
    end;

    if (FUseDigitalSign) and (imSign.Visible = True)
    then frxRepOKB.FindObject('Memo17').Visible := True
    else frxRepOKB.FindObject('Memo17').Visible := False;

    //--- Показываем или не показываем диагноз
    frxRepOKB.FindObject('Memo9').Visible := rowDs.Visible;
    frxRepOKB.FindObject('Memo10').Visible := rowDs.Visible;
    //--- Показываем или не показываем рекомендации
    frxRepOKB.FindObject('Memo12').Visible := rowRecom.Visible;
    frxRepOKB.FindObject('Memo16').Visible := rowRecom.Visible;

    if (rowZakl.Properties.Value <> '')
    then begin
      TfrxRichView(frxRepOKB.FindObject('rvTEXTISSL')).RichEdit.Lines.Add('');
      TfrxRichView(frxRepOKB.FindObject('rvTEXTISSL')).RichEdit.Lines.Add('ЗАКЛЮЧЕНИЕ: ' + rowZakl.Properties.Value);
    end;
    {/Текст исследования}

    if pIsOffice
    then begin
      (frxRepOKB.FindObject('rvTEXTISSL') as TfrxRichView).Visible := False;
      (frxRepOKB.FindObject('Memo8') as TfrxMemoView).Visible := True;
      CmnHeadPartRep( frxRepOKB, frxHTMLExport1, frxRTFExport1, rveText, 'Memo8')
    end
    else begin
      {Текст исследования}
      (frxRepOKB.FindObject('rvTEXTISSL') as TfrxRichView).Visible := False;
      (frxRepOKB.FindObject('Memo8') as TfrxMemoView).Visible := True;
      ms := TMemoryStream.Create;
      ms.Clear;
      rveText.Format;
      rveText.SaveRTFToStream(ms, False);
      ms.Position := 0;
      TfrxRichView(frxRepOKB.FindObject('rvTEXTISSL')).RichEdit.Lines.LoadFromStream(ms);
      ms.Free;

      frxRepOKB.ShowReport;
    end;
  end;
end;

function TfrmProtocolN.DoSignCryptoPro: Boolean;
var vSQLRuleID: Integer;
begin
  vSQLRuleID := FCryptoProUtils.GetRuleIdByTablename(SQLRuleTableName);
  Result := FCryptoProUtils.SignBySotr(vSQLRuleID, pNAZID, frmMain.pSOTRID) > 0;
end;

procedure TfrmProtocolN.DoTextProtocol;
var ods : TOracleDataSet;
    memStream : TMemoryStream;
begin
  memStream :=  TMemoryStream.Create;
  odsRVData.Close;
  odsRVData.SetVariable('FK_PACID', pNAZID);
  odsRVData.Open;
  TBlobField(odsRVData.FieldByName('FB_BLOB')).SaveToStream(memStream);
  memStream.Position := 0;
  rveText.Clear;
  rveText.LoadRVFFromStream(memStream);
  rveText.Format;
  memStream.Free;
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
            while not ods.Eof do
              begin
                memStream := TMemoryStream.Create;
                memStream.Position := 0;
                TBlobField(ods.FieldByName('FB_BLOB')).SaveToStream(memStream);
                memStream.Position := 0;
                rveText.InsertRVFFromStreamEd(memStream);
                rveText.Format;
                memStream.Clear;
                ods.Next;
              end;
          end;
      finally
        ods.Free;
      end;
  end;
end;

procedure TfrmProtocolN.DrowDigSign(aImage: TImage; APrintText: string; aDataTime: TDateTime; ADSCorrect: Boolean);
var vBitmap: TBitmap;
begin
  vBitmap := TReportUtils.CreateDigSignBMP(APrintText, aDataTime, ADSCorrect, false);
  aImage.Width := vBitmap.Width;
  aImage.Picture.Assign(vBitmap);
  vBitmap.Free;
end;

procedure TfrmProtocolN.dxBarButton1Click(Sender: TObject);
begin
  if rveText.Enabled = True then
    rveText.SetFocus;
  if frmMain.GET_DB_NAME <> 'T' then
    begin
      DoShowProtocol_4OKBHMAO(True);
    end else
    begin
      DoShowProtocol_4OBTC(True);
    end;
end;

procedure TfrmProtocolN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if chkOtmetki.Checked then
    begin
      aOtmetkiExecute(nil);
    end;
end;

procedure TfrmProtocolN.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TfrmProtocolN.FormCreate(Sender: TObject);
var ods : TOracleDataSet;
begin
  listxrayvrach_use_zakl_text := tdbutils.getconstantdef('listxrayvrach_use_zakl_text',frmmain.os,0);
  listxrayvrach_protokolhidediag := tdbutils.getconstantdef('listxrayvrach_protokolhidediag',frmmain.os,0);
//  merLaborantVrach.Properties.Editors.Items[0].Options.Editing := frmMain.get_can_change_vrach = 1;
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
//-->> включаем по умолчанию русскую раскладку
  russian:=LoadKeyboardLayout('00000419', 0);
//-->> "заряжаем" датасеты
  if odsKudaNapravlen.Active = False then
    odsKudaNapravlen.Active := True;
  if odsSotr.Active = False then
    odsSotr.Active := True;
//  if odsRVData.Active = False then
//    odsRVData.Active := True;
end;

procedure TfrmProtocolN.FormShow(Sender: TObject);
var Reg : TRegIniFile;
     id : Integer;
begin
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

procedure TfrmProtocolN.frxRepOBTCGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'PACFIO' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DATE_ROJD' then Value := merDateAgeSex.Properties.Editors[0].Value;
  if VarName = 'NUMISSL' then Value :=rowNumIssl.Properties.Value;
  if VarName = 'NAMEISSL' then Value := rowIssl.Properties.Value;
  if VarName = 'ZAKL' then Value := rowZakl.Properties.Value;
  if VarName = 'DATEISSL' then Value := DateToStr(merDateTime.Properties.Editors[0].Value)+ ' '+ merDateTime.Properties.Editors[1].Value;
  if VarName = 'SOTR' then Value := odsSotr.FieldByName('FC_NAME').AsString;
  if rowZakl.Properties.Value <> '' then
  begin
    if VarName = 'TEXTISSL'
    then begin
      Value := rveText.GetSelText+#13#10+'ЗАКЛЮЧЕНИЕ: '+rowZakl.Properties.Value;
      //ShowMessage(rveText.GetSelText);
    end;
  end else
  begin
    if VarName = 'TEXTISSL'
    then begin
      Value := rveText.GetSelText;
      //ShowMessage(rveText.GetSelText);
    end;
  end;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'SOTRSPEC' then Value := sSpecName;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'DOZA' then Value := merDozaTime.Properties.Editors[0].Value;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
end;

procedure TfrmProtocolN.frxRepOBTC_4RentgenGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'PACFIO' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DATE_ROJD' then Value := merDateAgeSex.Properties.Editors[0].Value;
  if VarName = 'NUMISSL' then Value := rowNumIssl.Properties.Value;
  if VarName = 'NAMEISSL' then Value := rowIssl.Properties.Value;
  if VarName = 'ZAKL' then Value := rowZakl.Properties.Value;
  if VarName = 'DATEISSL' then Value := DateToStr(merDateTime.Properties.Editors[0].Value)+ ' '+ merDateTime.Properties.Editors[1].Value;
  if VarName = 'SOTR' then Value := odsSotr.FieldByName('FC_NAME').AsString;
  if rowZakl.Properties.Value <> '' then
  begin
    if VarName = 'TEXTISSL' then Value := rveText.GetSelText+#13#10+'ЗАКЛЮЧЕНИЕ: '+rowZakl.Properties.Value;
  end else
  begin
    if VarName = 'TEXTISSL' then Value := rveText.GetSelText;
  end;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'SOTRSPEC' then Value := sSpecName;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'DOZA' then Value := merDozaTime.Properties.Editors[0].Value;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
end;

procedure TfrmProtocolN.frxRepOKBBeforePrint(Sender: TfrxReportComponent);
begin
  if Sender.Name = 'Picture1' then
    TfrxPictureView(Sender).Picture.Assign(frmProtocolN.imSign.picture);
end;

procedure TfrmProtocolN.frxRepOKBGetValue(const VarName: string; var Value: Variant);
begin
  rveText.SelectAll;

  if VarName = 'PACFIO' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DATE_ROJD' then Value := merDateAgeSex.Properties.Editors[0].Value;
  if VarName = 'NUMISSL' then Value := rowNumIssl.Properties.Value;
  if VarName = 'NAMEISSL' then Value := rowIssl.Properties.Value;
  if VarName = 'DOZA' then Value := merDozaTime.Properties.Editors[0].Value;
  if VarName = 'DATEISSL' then Value := DateToStr(merDateTime.Properties.Editors[0].Value)+ ' '+ FormatDateTime('hh:mm', merDateTime.Properties.Editors[1].Value);
  if VarName = 'SOTR' then Value := odsSotr.FieldByName('FC_NAME').AsString;
  if rowZakl.Properties.Value <> '' then
  begin
    if VarName = 'TEXTISSL'
    then begin
      Value := rveText.GetSelText+#13#10+'ЗАКЛЮЧЕНИЕ: '+rowZakl.Properties.Value;
      //ShowMessage(rveText.GetSelText);
    end;
  end else
  begin
    if VarName = 'TEXTISSL'
    then begin
      Value := rveText.GetSelText;
      //ShowMessage(rveText.GetSelText);
    end;
  end;
  if VarName = 'KABINET' then Value := frmMain.odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'PHONEKAB' then Value := frmMain.odsKab.FieldByName('FC_PHONE').AsString;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'SOTRSPEC' then Value := sSpecName;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'DS' then Value := rowDs.Properties.Value;
  if VarName = 'RECOM' then Value := rowRecom.Properties.Value;

  rveText.TopLevelEditor.SetSelectionBounds(0, 0, 0, 0);
end;

procedure TfrmProtocolN.frxRepOKBKontrastBeforePrint(Sender: TfrxReportComponent);
begin
  if Sender.Name = 'Picture1' then
    TfrxPictureView(Sender).Picture.Assign(frmProtocolN.imSign.picture);
end;

procedure TfrmProtocolN.frxRepOKBKontrastGetValue(const VarName: string; var Value: Variant);
begin
  rveText.SelectAll;

  if VarName = 'PACFIO' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DATE_ROJD' then Value := merDateAgeSex.Properties.Editors[0].Value;
  if VarName = 'NUMISSL' then Value := rowNumIssl.Properties.Value;
  if VarName = 'NAMEISSL' then Value := rowIssl.Properties.Value;
  if VarName = 'DOZA' then Value := merDozaTime.Properties.Editors[0].Value;
  if VarName = 'DATEISSL' then Value := DateToStr(merDateTime.Properties.Editors[0].Value)+ ' '+ FormatDateTime('hh:mm', merDateTime.Properties.Editors[1].Value);
  if VarName = 'SOTR' then Value := odsSotr.FieldByName('FC_NAME').AsString;
  if rowZakl.Properties.Value <> '' then
  begin
    if VarName = 'TEXTISSL' then Value := rveText.GetSelText+#13#10+'ЗАКЛЮЧЕНИЕ: '+rowZakl.Properties.Value;
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
  if VarName = 'DS' then Value := rowDs.Properties.Value;
  if VarName = 'RECOM' then Value := rowRecom.Properties.Value;
  if VarName = 'TYPE' then Value := rowTypeKontrast.Properties.Value;
  if VarName = 'KOLVO' then Value := rowKolvoKontrast.Properties.Value;
  if VarName = 'VVOD' then Value := rowVvodKontrast.Properties.Value;
  if VarName = 'VVODVrach' then Value := rowFIOVrach.Properties.Value;

  rveText.TopLevelEditor.SetSelectionBounds(0, 0, 0, 0);
end;

procedure TfrmProtocolN.InsColExecute(Sender: TObject);
begin  //
  InsColTableIntoRVEditor( rveText );
end;

procedure TfrmProtocolN.InsRowExecute(Sender: TObject);
begin  //
  InsRowTableIntoRVEditor( rveText );
end;

procedure TfrmProtocolN.InsTableExecute(Sender: TObject);
begin  //
  InsTableIntoRVEditor( rveText );
end;

procedure TfrmProtocolN.DelColExecute(Sender: TObject);
begin  //
  DelColTableIntoRVEditor( rveText );
end;

procedure TfrmProtocolN.DelRowExecute(Sender: TObject);
begin  //
  DelRowTableIntoRVEditor( rveText );
end;

procedure TfrmProtocolN.DelTableExecute(Sender: TObject);
begin  //
  DelTableIntoRVEditor( rveText );
end;

procedure TfrmProtocolN.MergeCellsExecute(Sender: TObject);
begin
  UnionCellRVEditor( rveText );
end;

function TfrmProtocolN.IsNazSignedCryptoPro(aNazID: Integer; var aSotrName: String; var aSotrID: Integer; var aSignDT: TDateTime): Boolean;
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

function TfrmProtocolN.IsSotrHasSignCryptoPro(aSotrID: Integer): Boolean;
begin
  Result := FCryptoProUtils.IsSotrHasKey(frmMain.pSOTRID);
end;

procedure TfrmProtocolN.N10Click(Sender: TObject);
var memStream : TMemoryStream;
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
        rveText.Format;
    end;
  finally
    memStream.Free;
  end;
end;

procedure TfrmProtocolN.N1Click(Sender: TObject);
begin
  rveText.PasteText;
  rveText.Reformat;
end;

procedure TfrmProtocolN.N2Click(Sender: TObject);
begin
  rveText.CopyText;
end;

procedure TfrmProtocolN.N3Click(Sender: TObject);
begin
  rveText.CutDef;
end;

procedure TfrmProtocolN.N5Click(Sender: TObject);
begin
  if Application.MessageBox('Вы собираетесь очистить текст протокола.' + #13 + #10 + 'Уверены?', 'Вопрос', MB_ICONQUESTION+MB_OKCANCEL)= IDOk then
  begin
    rveText.Clear;
    rveText.Format;
    rveText.SetFocus;
  end;
end;

procedure TfrmProtocolN.N9Click(Sender: TObject);
var memStream : TMemoryStream;
begin
  memStream := TMemoryStream.Create;
  rveText.SaveRVFToStream(memStream, False);
  memStream.Position := 0;
  SaveMedEditorAsTemplate(pSMIDID, memStream, rvs);
  memStream.Free;
end;

procedure TfrmProtocolN.odsSotrBeforeOpen(DataSet: TDataSet);
begin
  odsSotr.SetVariable('PFK_OTDELID', frmMain.pOTDELID);
end;

procedure TfrmProtocolN.RefreshIsSign(aNazID: Integer);
begin
  FIsSign := IsNazSignedCryptoPro(aNazID, FSignSotrName, FSignSotrID, FSignDT);
  SignedComponentEnabled(aNazID, FIsSign, FSignSotrName, FSignDT);
end;

procedure TfrmProtocolN.rowDsEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
// добавить диагноз
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetDs, frmSetDs);
      try
        frmSetDs.DoShowForm(pPACID);
        frmSetDs.ShowModal;
        if frmSetDs.ModalResult = mrOk then
          begin
            ods := TOracleDataSet.Create(nil);
            try
              ods.Session := frmMain.os;
              ods.Cursor := crSQLWait;
              ods.SQL.Text := ' MERGE INTO ASU.TDIAG '+#13+
                              '   USING DUAL ON (FK_PACID = :PFK_PACID AND FK_NAZID = :PFK_NAZID) '+#13+
                              ' WHEN MATCHED THEN UPDATE SET FK_SMDIAGID = :PFK_SMDIAGID, FL_FIRST = :PFL_FIRST, FC_WRITE = :PFC_WRITE, '+#13+
                              '                              FD_DATE = SYSDATE, FK_VRACHID = :PFK_VRACHID, FL_SHOWIB = :PFL_SHOWIB, '+#13+
                              '                              FK_MKB_10 = :PFK_MKB_10 '+#13+
                              '                    WHERE FK_PACID = :PFK_PACID AND FK_NAZID = :PFK_NAZID '+#13+
                              ' WHEN NOT MATCHED THEN '+#13+
                              '   INSERT (FK_PACID, FK_SMDIAGID, FP_TYPE, FL_FIRST, FC_WRITE, FD_DATE, FK_VRACHID, FL_MAIN, FL_SHOWIB, FK_NAZID, FK_MKB_10) '+#13+
                              '   VALUES(:PFK_PACID, :PFK_SMDIAGID, (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''DIAG_SPEC''), :PFL_FIRST, :PFC_WRITE, SYSDATE, :PFK_VRACHID, ASU.GET_SOPUTDIAG, :PFL_SHOWIB, :PFK_NAZID, :PFK_MKB_10) ';
              ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
              ods.DeclareAndSet('PFK_SMDIAGID', otInteger, frmSetDs.odsDiag.FieldByName('FK_ID').AsInteger);
              ods.DeclareAndSet('PFC_WRITE', otString, frmSetDs.odsDiag.FieldByName('FC_NAME').AsString); //!!! полное название, то есть название не только конечной ветки, но и + родитель
              ods.DeclareAndSet('PFK_VRACHID', otInteger, merLaborantVrach.Properties.Editors[0].Value);
              ods.DeclareAndSet('PFK_NAZID', otInteger, pNAZID);
              ods.DeclareAndSet('PFK_MKB_10', otInteger, frmSetDs.odsDiag.FieldByName('FK_ID').AsInteger);
              ods.DeclareAndSet('PFL_FIRST', otInteger, frmSetDs.rowVyavlen.Properties.Value);
              ods.DeclareAndSet('PFL_SHOWIB', otInteger, frmSetDs.rowShowIB.Properties.Value);
              ods.Open;
              frmMain.os.Commit;
              TcxButtonEdit(verGrPodpisi.InplaceEditor).Properties.ViewStyle := vsNormal;
              TcxButtonEdit(verGrPodpisi.InplaceEditor).EditingText := '('+frmSetDs.odsDiag.FieldByName('FK_MKB10').AsString +') '+frmSetDs.odsDiag.FieldByName('FC_NAME').AsString;
              TcxButtonEdit(verGrPodpisi.InplaceEditor).Properties.ViewStyle := vsHideCursor;
              rowDs.Tag := pNAZID;
              if frmSetDs.rowVyavlen.Properties.Value <> null then
                nDsFirst := frmSetDs.rowVyavlen.Properties.Value;
              if frmSetDs.rowShowIB.Properties.Value <> null then
                nDsShowIb := frmSetDs.rowShowIB.Properties.Value;
              sDsName := frmSetDs.odsDiag.FieldByName('FC_NAME').AsString;
              sDsMkbCode := frmSetDs.odsDiag.FieldByName('FK_MKB10').AsString;
              TcxButtonEdit(verGrPodpisi.InplaceEditor).Properties.Buttons[0].Enabled := False; // дизайблим кнопку добавления диагноза
              TcxButtonEdit(verGrPodpisi.InplaceEditor).Properties.Buttons[1].Enabled := True; // инайблим кнопку изменения диагноза
              TcxButtonEdit(verGrPodpisi.InplaceEditor).Properties.Buttons[2].Enabled := True; // инейблим кнопку удаления диагноза
            finally
              ods.Free;
            end;
          end;
      finally
        frmSetDs.Free;
      end;
    end;
// изменить диагноз
  if AButtonIndex = 1 then
    begin
      Application.CreateForm(TfrmEditDiag, frmEditDiag);
      try
        frmEditDiag.rowShowIB.Properties.Value := nDsShowIb;
        frmEditDiag.rowVyavlen.Properties.Value := nDsFirst;
        frmEditDiag.rowName.Properties.Value := sDsName;
        frmEditDiag.ShowModal;
        if frmEditDiag.ModalResult = MrOk then
          begin
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := frmMain.os;
              oq.SQL.Text := ' UPDATE ASU.TDIAG '+#13+
                             '    SET FL_FIRST = :PFL_FIRST, FL_SHOWIB = :PFL_SHOWIB, FC_WRITE = :PFC_WRITE '+#13+
                             '  WHERE FK_NAZID = :PFK_NAZID ';
              oq.DeclareAndSet('PFL_FIRST', otInteger, frmEditDiag.rowVyavlen.Properties.Value);
              oq.DeclareAndSet('PFL_SHOWIB', otInteger, frmEditDiag.rowShowIB.Properties.Value);
              oq.DeclareAndSet('PFC_WRITE', otString, frmEditDiag.rowName.Properties.Value);
              oq.DeclareAndSet('PFK_NAZID', otInteger, rowDs.Tag);
              oq.Execute;
              frmMain.os.Commit;
              TcxButtonEdit(verGrPodpisi.InplaceEditor).Properties.ViewStyle := vsNormal;
              TcxButtonEdit(verGrPodpisi.InplaceEditor).EditingText := '('+sDsMkbCode+') '+frmEditDiag.rowName.Properties.Value;
              TcxButtonEdit(verGrPodpisi.InplaceEditor).Properties.ViewStyle := vsHideCursor;
              if frmEditDiag.rowVyavlen.Properties.Value <> null then
                nDsFirst := frmEditDiag.rowVyavlen.Properties.Value;
              if frmEditDiag.rowShowIB.Properties.Value <> null then
                nDsShowIb := frmEditDiag.rowShowIB.Properties.Value;
              sDsName := frmEditDiag.rowName.Properties.Value;
            finally
              oq.Free;
            end;
          end;
      finally
        frmEditDiag.Free;
      end;
    end;
// удалить диагноз
  if AButtonIndex = 2 then
    begin
      if rowDs.Tag <> 0 then
        begin
          if Application.MessageBox('Вы действительно хотите удалить диагноз этого протокола?', 'Вопрос', MB_YESNO+MB_ICONQUESTION) = mrYes then
            begin
              oq := TOracleQuery.Create(nil);
              try
                oq.Session := frmMain.os;
                oq.Cursor := crSQLWait;
                oq.SQL.Text := ' DELETE FROM ASU.TDIAG WHERE FK_NAZID = :PFK_NAZID ';
                oq.DeclareAndSet('PFK_NAZID', otInteger, pNAZID);
                oq.Execute;
                frmMain.os.Commit;
                TcxButtonEdit(verGrPodpisi.InplaceEditor).Properties.ViewStyle := vsNormal;
                TcxButtonEdit(verGrPodpisi.InplaceEditor).EditingText := '';
                TcxButtonEdit(verGrPodpisi.InplaceEditor).Properties.ViewStyle := vsHideCursor;
                rowDs.Tag := 0;
                nDsFirst := 0;
                nDsShowIb := 0;
                sDsName := '';
                TcxButtonEdit(verGrPodpisi.InplaceEditor).Properties.Buttons[0].Enabled := True; //инайблим кнопку добавления диагноза
                TcxButtonEdit(verGrPodpisi.InplaceEditor).Properties.Buttons[1].Enabled := False; // дизейблим кнопку изменения диагноза
                TcxButtonEdit(verGrPodpisi.InplaceEditor).Properties.Buttons[2].Enabled := False; // дизейблим кнопку удаления диагноза
              finally
                oq.Free;
              end;
            end;
        end;
    end;
end;

procedure TfrmProtocolN.rowKudaNapravlenEditPropertiesChange(Sender: TObject);
begin
  isKudaNapravlenChange := True;
end;

procedure TfrmProtocolN.rowRecomEditPropertiesChange(Sender: TObject);
begin
  isRecomChange := True;
end;

procedure TfrmProtocolN.rowZaklEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSetResume, frmSetResume);
  frmSetResume.DoShowForm(listxrayvrach_use_zakl_text);
  if listxrayvrach_use_zakl_text = 1 then
   begin
    frmSetResume.m.lines.Text := TcxButtonEdit(verGrPodpisi.InplaceEditor).EditingText;
   end;
  frmSetResume.ShowModal;
  if frmSetResume.ModalResult = MrOK then
    begin
      TcxButtonEdit(verGrPodpisi.InplaceEditor).Properties.ViewStyle := vsNormal;
      if listxrayvrach_use_zakl_text = 1 then
       TcxButtonEdit(verGrPodpisi.InplaceEditor).EditingText := frmSetResume.m.lines.Text
      else
       TcxButtonEdit(verGrPodpisi.InplaceEditor).EditingText := frmSetResume.odsTree.FieldByName('FC_NAME').AsString;
      TcxButtonEdit(verGrPodpisi.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      IDSMIDZAKL := frmSetResume.odsTree.FieldByName('FK_ID').AsInteger; //!!! избавиться от этой константы
      rowZakl.Tag := frmSetResume.odsTree.FieldByName('FK_ID').AsInteger;
    end;
  frmSetResume.Free;
end;

procedure TfrmProtocolN.rveTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (chr(KEY) in ['a', 'A', 'ф', 'Ф']) then
    begin
      rveText.SetSelectionBounds(0, rveText.GetOffsBeforeItem(0), rveText.ItemCount - 1,
      rveText.GetOffsAfterItem(rveText.ItemCount - 1));
      Application.ProcessMessages;
    end;
end;

procedure TfrmProtocolN.rveTextSpellingCheck(Sender: TCustomRichView;
  const AWord: string; StyleNo: Integer; var Misspelled: Boolean);
begin
  if frmMain.get_check_spell = '-1' then
    begin
      if SpellChecker1.IsKnownWord(AWord,langRussian) = False then
        Misspelled := True;
    end;
end;

procedure TfrmProtocolN.SetEnableButtonForReadOnly(AEnable: Boolean);
begin
  bbSave.Enabled := AEnable;
  merDateTime.Properties.Editors[0].EditProperties.ReadOnly := not AEnable;
  merDateTime.Properties.Editors[1].EditProperties.ReadOnly := not AEnable;
  bClear.Enabled := AEnable; //очистить
//  bSpell.Enabled := AEnable; // проверить орфографию // !!! на кардио была ошибка, когда вбивали текст протокола "ошибка подпроцесса(трэда) - недопустимый дескриптор окна"
//  bNoSpell.Enabled := AEnable; // не проверять орфографию
  bCut.Enabled := AEnable; //вырезать
  bCopy.Enabled := AEnable; //копировать
  bPaste.Enabled := AEnable; //вставить
  bSaveTempl.Enabled := AEnable; //сохранить в шаблон
  bLoadTempl.Enabled := AEnable; //загрузить из шаблона
  actPass.Enabled := AEnable; //зачесть
//  bLoadZakl.Enabled := AEnable;

  rveText.ReadOnly := not AEnable;
  rveText.Enabled := AEnable;
//  cxTextResume.Properties.ReadOnly := not AEnable;
end;

procedure TfrmProtocolN.SetIsReadOnly(const aIsReadOnly: Boolean);
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

procedure TfrmProtocolN.SignedComponentEnabled(aNazID: Integer; aIsSigned: Boolean; aSotrName: String; aSignDT: TDateTime);
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

end.
