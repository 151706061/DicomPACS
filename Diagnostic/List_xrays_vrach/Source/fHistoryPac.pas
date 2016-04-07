unit fHistoryPac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ActnList, ImgList, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  OracleData, Oracle, jvDBUtils, Registry, Jpeg, ExtCtrls, Word2000,
  cxImageComboBox, Menus, cxGridExportLink, cxContainer, cxTextEdit,
  cxLabel, frxClass, frxDBSet, DateUtils, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, dxSkinsdxBarPainter, cxLookAndFeelPainters, StdCtrls,
  cxButtons, ClipBrd;

type
  TfrmHistoryPac = class(TForm)
    BM: TdxBarManager;
    bbPeriod: TdxBarButton;
    bbPrint: TdxBarButton;
    bbPreview: TdxBarButton;
    bbFotos: TdxBarButton;
    bbBegin: TdxBarDateCombo;
    bbEnd: TdxBarDateCombo;
    il: TImageList;
    bbSearch: TdxBarButton;
    bbRefresh: TdxBarButton;
    al: TActionList;
    aRefresh: TAction;
    aPeriod: TAction;
    aSearch: TAction;
    aPreview: TAction;
    aFotos: TAction;
    aPrint: TAction;
    aClose: TAction;
    TVARCHIVE: TcxGridDBTableView;
    cxArchiveLevel1: TcxGridLevel;
    cxArchive: TcxGrid;
    VFOTOS: TcxGridDBColumn;
    VVID: TcxGridDBColumn;
    VNAME: TcxGridDBColumn;
    VDOZA: TcxGridDBColumn;
    VDATE: TcxGridDBColumn;
    odsArch: TOracleDataSet;
    dsArch: TDataSource;
    ilImages: TImageList;
    odsImages: TOracleDataSet;
    pmArch: TPopupMenu;
    C1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    MSExcel1: TMenuItem;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    sdPopUp: TSaveDialog;
    VISPOL: TcxGridDBColumn;
    frxDBDataset1: TfrxDBDataset;
    VKOMYVYDANO: TcxGridDBColumn;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    frxArch: TfrxReport;
    frxPrintProtocol: TfrxReport;
    Panel4: TPanel;
    lbFIO: TcxLabel;
    bClose: TcxButton;
    Panel1: TPanel;
    Panel2: TPanel;
    cxLabel2: TcxLabel;
    dxBarDockControl2: TdxBarDockControl;
    pmFIO: TPopupMenu;
    N5: TMenuItem;
    VNUM: TcxGridDBColumn;
    bbNaprav: TdxBarButton;
    aNaprav: TAction;
    frxFlu: TfrxReport;
    odsListNaz: TOracleDataSet;
    odsListNazROWNUM: TFloatField;
    odsListNazFK_DOCID: TFloatField;
    odsListNazFK_NAZSOSID: TFloatField;
    odsListNazFC_TYPE: TStringField;
    odsListNazFK_ID: TFloatField;
    odsListNazFC_NAME: TStringField;
    odsListNazFK_SMID: TFloatField;
    odsListNazFK_VRACHID: TFloatField;
    odsListNazDOZA: TFloatField;
    odsListNazKOLVO: TFloatField;
    odsListNazKOLVOPRSV: TFloatField;
    frxNaprav: TfrxReport;
    frxNaprav_4OBTC: TfrxReport;
    frxDBDataset2: TfrxDBDataset;
    procedure aRefreshExecute(Sender: TObject);
    procedure aPeriodExecute(Sender: TObject);
    procedure aSearchExecute(Sender: TObject);
    procedure aPreviewExecute(Sender: TObject);
    procedure aFotosExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure odsArchBeforeOpen(DataSet: TDataSet);
    procedure odsArchAfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure C1Click(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure TVARCHIVEDblClick(Sender: TObject);
    procedure frxArchGetValue(const VarName: String; var Value: Variant);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure frxPrintProtocolGetValue(const VarName: string;
      var Value: Variant);
    procedure lbFIOMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbFIOMouseLeave(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aNapravExecute(Sender: TObject);
    procedure frxFluGetValue(const VarName: string; var Value: Variant);
    procedure frxNapravGetValue(const VarName: string; var Value: Variant);
    procedure frxNaprav_4OBTCGetValue(const VarName: string;
      var Value: Variant);
  private
    pPACID : Integer;
    nAge_4rep : Integer;
    sSex_4rep : string;
    sAddress_4rep : string;
    sPhone_4rep : string;
    sKabName_4rep : string;
    sKabPhone_4rep : string;
    sLabName_4rep : string;
    sKoren_4rep : string;
    sOpl_4rep : string;
    sTarget_4rep : string;
    sPriem_4rep : string;
    sApparat_4rep : string;
    sProjivaet_4rep : string;
    sVrach_4rep : string;
    sNadbavka_4rep : string;
    sUrgent_4rep : string;
    sDS_4rep : string;
    sKem_4rep : string;
    sSotrFIO_4rep, sTextIssl_4rep, sFIOPac_4rep : String;
    sDateRojd_4rep : TDateTime;
    sSysDate_4Rep : String;
    Russian : HKL;
    procedure DoPrint;
    procedure DoPrint_4OBTC;
    procedure DoProjivaet;
    { Private declarations }
  public
    pPEPLID, pSOTRID : Integer;
    SOTRFIO : String;
    DateB, DateE : TDate;
    procedure DoShowHistoryPac(nPEPLID, nSOTRID : Integer; sFIO, sSOTRFIO : String; nPACID : Integer = 0);
    procedure ClearHTMLImages;
    procedure CheckEnabledButtons;
    procedure DoRefreshSMIDConst;
    { Public declarations }
  end;

var
  frmHistoryPac: TfrmHistoryPac;
  GET_NAZCANCEL : Integer;

implementation

uses uPeriodHistory, fImages, fOtmena, fMain;

{$R *.dfm}

procedure TfrmHistoryPac.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsArch);
end;

procedure TfrmHistoryPac.aPeriodExecute(Sender: TObject);
begin
//  Application.CreateForm(TfrmPeriodHistory, frmPeriodHistory);
//  DateB := Date;
//  DateE := Date;
//  GetPeriod(DateB, DateE);
//  if frmPeriodHistory.ModalResult = MrOK then
//    begin
//      bbBegin.Date := DateB;
//      bbEnd.Date := DateE;
//      aSearchExecute(nil);
//      frxArch.FindObject('Memo8').Visible := TRUE;
//      frxArch.FindObject('Memo15').Visible := TRUE;
//      frxArch.FindObject('Memo16').Visible := TRUE;
//      frxArch.FindObject('Memo17').Visible := TRUE;
//    end;
end;

procedure TfrmHistoryPac.aSearchExecute(Sender: TObject);
begin
  odsArch.Close;
  odsArch.DeclareAndSet('PFD_DATE1', otDate, bbBegin.Date);
  odsArch.DeclareAndSet('PFD_DATE2', otDate, bbEnd.Date);
  odsArch.Open;
  frxArch.FindObject('Memo8').Visible := TRUE;
  frxArch.FindObject('Memo15').Visible := TRUE;
  frxArch.FindObject('Memo16').Visible := TRUE;
  frxArch.FindObject('Memo17').Visible := TRUE;
  frmHistoryPac.Caption := 'База данных по пациенту. Период с: '+DateTimeToStr(bbBegin.Date)+' по: '+DateTimeToStr(bbEnd.Date); 
end;

procedure TfrmHistoryPac.aPreviewExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID, '+
                    '        ASU.DO_VRACHFIO(FK_ISPOLID) AS VRACHFIO, '+
                    '        (SELECT FB_TEXT FROM ASU.TRICHVIEWDATA WHERE FK_PACID = TNAZIS.FK_ID) AS TEXTISSL, '+
               //     '        (SELECT MAX(FC_CHAR) FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL'')) AS NUMBER_ISSL, '+
                    '        ASU.PKG_REGIST_PACFUNC.GET_PAC_FIO(TNAZIS.FK_PACID) FIOPAC, '+
                    '        (SELECT FD_ROJD FROM ASU.TPEOPLES WHERE FK_ID = (SELECT FK_PEPLID FROM ASU.TKARTA WHERE FK_ID = TNAZIS.FK_PACID '+
                    '         UNION '+
                    '         SELECT FK_PEPLID FROM ASU.TAMBULANCE WHERE FK_ID = TNAZIS.FK_PACID)) FD_ROJD '+
                    '   FROM ASU.TNAZIS '+
                    '  WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, odsArch.FieldByName('FK_ID').AsInteger);
    ods.Open;
    sSotrFIO_4rep := ods.FieldByName('VRACHFIO').AsString;
    sTextIssl_4rep := ods.FieldByName('TEXTISSL').AsString;
//    sNumIssl_4rep := ods.FieldByName('NUMBER_ISSL').AsString; 
    sFIOPac_4rep := ods.FieldByName('FIOPAC').AsString; //!!! зачем это здесь, если можно взять из lbFIO ???
    sDateRojd_4rep := ods.FieldByName('FD_ROJD').AsDateTime;
  finally
    ods.Free;
  end;
  frxPrintProtocol.ShowReport;
end;

procedure TfrmHistoryPac.aFotosExecute(Sender: TObject);
begin
  if not DirectoryExists(ExtractFilePath(paramstr(0))+'RGIMAGES') then
    CreateDir(ExtractFilePath(paramstr(0))+'RGIMAGES');

  odsImages.Close;
  odsImages.SetVariable('PFK_PACID', odsArch.FieldByName('FK_ID').AsInteger);
  odsImages.Open;
  if odsImages.RecordCount > 0 then
    begin
      while not odsImages.Eof do
        begin
          TBlobField(odsImages.FieldByName('FB_BLOB')).SaveToFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+odsImages.FieldByName('SFILENAME').AsString);
          odsImages.Next;
        end;
      Application.CreateForm(TfrmImages, frmImages);
      frmImages.DoShowfrmImages(odsImages, odsImages.RecordCount);
    end;
end;

procedure TfrmHistoryPac.aNapravExecute(Sender: TObject);
begin
  if frmMain.GET_DB_NAME <> 'T' then
    begin
      DoPrint;
    end else
    begin
      DoPrint_4OBTC;
    end;
end;

procedure TfrmHistoryPac.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATE_SYS FROM DUAL ';
    ods.Open;
    sSysDate_4Rep := ods.FieldByName('DATE_SYS').AsString;
  finally
    ods.Free;
  end;
  frxArch.ShowReport;
end;

procedure TfrmHistoryPac.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmHistoryPac.ClearHTMLImages;
var SR: TSearchRec;
begin
  FindFirst(ExtractFilePath(paramstr(0))+'RGIMAGES'+'*.jpg', faAnyFile, SR);
  repeat
    DeleteFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+SR.Name);
  until FindNext(SR) <> 0;
end;

procedure TfrmHistoryPac.DoShowHistoryPac(nPEPLID, nSOTRID: Integer; sFIO, sSOTRFIO : String; nPACID : Integer = 0);
var //ods : TOracleDataSet;
    Reg : TRegIniFile;
begin
  pPEPLID := nPEPLID;
  pSOTRID := nSOTRID;
  SOTRFIO := sSOTRFIO;
  pPACID := nPACID;
  DoRefreshSMIDConst;
  //frmHistoryPac.Caption := 'История исследований пациента: '+sFIO;
  lbFIO.Caption := sFIO;
//------------------------------------------------------------------------------
  Reg:=TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  Reg.OpenKey('\Software\Softmaster\RGSEARCH\DatesArchive'+'SOTR'+IntToStr(pSOTRID), TRUE);
  if Reg.ReadString('\Software\Softmaster\RGSEARCH\DatesArchive'+'SOTR'+IntToStr(pSOTRID), 'DATE_BEG', '') = '' then
    begin
      bbBegin.Date := Date; //!!!
      bbEnd.Date := Date;
    end else
    begin
      bbBegin.Date := StrToDateTime(Reg.ReadString('\Software\Softmaster\RGSEARCH\DatesArchive'+'SOTR'+IntToStr(pSOTRID), 'DATE_BEG', ''));
      bbEnd.Date := StrToDateTime(Reg.ReadString('\Software\Softmaster\RGSEARCH\DatesArchive'+'SOTR'+IntToStr(pSOTRID), 'DATE_END', ''));
    end;
//------------------------------------------------------------------------------
  TVARCHIVE.StoreToRegistry('\SoftWare\SoftMaster\RGSEARCH\TVARCHIVE'+'SOTR'+ '_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TVARCHIVE');
  TVARCHIVE.ApplyBestFit;
  TVARCHIVE.RestoreFromRegistry('\SoftWare\SoftMaster\RGSEARCH\TVARCHIVE'+'SOTR'+ '_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TVARCHIVE');
  if odsArch.Active = FALSE then
    odsArch.Open;
end;

procedure TfrmHistoryPac.odsArchBeforeOpen(DataSet: TDataSet);
begin
  odsArch.SetVariable('PFK_PEPLID', pPEPLID);
  odsArch.DeclareAndSet('PFD_DATE1', otDate, bbBegin.Date);
  odsArch.DeclareAndSet('PFD_DATE2', otDate, bbEnd.Date);
end;

procedure TfrmHistoryPac.CheckEnabledButtons;
begin
  aPreview.Enabled := odsArch.RecordCount <> 0;
  aFotos.Enabled := odsArch.FieldByName('COUNTIMAGE').AsInteger > 0;
  aPrint.Enabled := odsArch.RecordCount <> 0;
end;

procedure TfrmHistoryPac.odsArchAfterScroll(DataSet: TDataSet);
begin
  CheckEnabledButtons;
end;

procedure TfrmHistoryPac.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\RGSEARCH\DatesArchive'+'SOTR'+IntToStr(pSOTRID), FALSE) then
   begin
     Reg.CreateKey('\Software\Softmaster\RGSEARCH\DatesArchive'+'SOTR'+IntToStr(pSOTRID));
   end;
  try
    Reg.WriteString('\Software\Softmaster\RGSEARCH\DatesArchive'+'SOTR'+IntToStr(pSOTRID), 'DATE_BEG', DateTimeToStr(bbBegin.Date));
    Reg.WriteString('\Software\Softmaster\RGSEARCH\DatesArchive'+'SOTR'+IntToStr(pSOTRID), 'DATE_END', DateTimeToStr(bbEnd.Date));
  except
  end;
  Reg.Free;
  TVARCHIVE.StoreToRegistry('\SoftWare\SoftMaster\RGSEARCH\TVARCHIVE'+'SOTR'+ '_' + IntToStr(pSOTRID), TRUE, [], 'TVARCHIVE');
end;

procedure TfrmHistoryPac.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
end;

procedure TfrmHistoryPac.C1Click(Sender: TObject);
begin
  TVARCHIVE.RestoreFromRegistry('\SoftWare\SoftMaster\RGSEARCH\TVARCHIVE'+'SOTR'+ '_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TVARCHIVE');
end;

procedure TfrmHistoryPac.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVARCHIVE.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxArchive, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxArchive, TRUE, TRUE);
end;

procedure TfrmHistoryPac.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVARCHIVE.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxArchive, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxArchive, TRUE, TRUE);
end;

procedure TfrmHistoryPac.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVARCHIVE.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxArchive, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxArchive, TRUE, TRUE);
end;

procedure TfrmHistoryPac.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVARCHIVE.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxArchive, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxArchive, TRUE, TRUE);
end;

procedure TfrmHistoryPac.TVARCHIVEDblClick(Sender: TObject);
var ods : TOracleDataSet;
begin
  if odsArch.RecordCount <> 0 then
  begin
  if odsArch.FieldByName('FK_NAZSOSID').AsInteger = GET_NAZCANCEL then
    begin
      Application.CreateForm(TfrmOtmena, frmOtmena);
      frmOtmena.acOk.Visible := FALSE;
      frmOtmena.acCancel.Caption := 'Закрыть';
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FC_RES FROM VRES WHERE FK_NAZID = :pFK_NAZID AND FK_SOS = GET_NAZCANCEL ';
        ods.DeclareAndSet('pFK_NAZID', otInteger, odsArch.FieldByName('FK_ID').AsInteger);
        ods.Open;
        frmOtmena.cxOtmena.Text := ods.FieldByName('FC_RES').AsString;
      finally
        ods.Free;
      end;
      frmOtmena.ShowModal;
      frmOtmena.Free;
    end else
    begin
      aPreviewExecute(nil);
    end;
  end;
end;

procedure TfrmHistoryPac.DoPrint;
var ods : TOracleDataSet;
begin
  if odsArch.FieldByName('OWNER').AsInteger = frmMain.GET_ISSL_FLU then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TNAZIS.FK_PACID) AS PACAGE, '+
                        '        ASU.PKG_REGIST_PACFUNC.GET_PAC_SEX(TNAZIS.FK_PACID) AS SEX, '+
                        '        ASU.GET_ADDR_STR_BY_ID(ASU.PKG_REGIST_PACFUNC.GET_PAC_ADRID(TNAZIS.FK_PACID)) AS ADDRESS, '+
                        '        (SELECT FC_CHAR '+
                        '           FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID '+
                        '                          AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''KONTAKT_PHONE'')) AS PHONE, '+
                        '        (SELECT FC_NAME FROM ASU.TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABNAME, '+
                        '        (SELECT FC_PHONE FROM ASU.TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABPHONE, '+
                        '        (SELECT ASU.DO_VRACHFIO(FN_NUM) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''RG_LABORANT'')) AS LAB, '+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = ASU.GET_PEPLID(TNAZIS.FK_PACID) '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''KOREN_NASEL''))) AS KOREN, '+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL''))) AS OPL, '+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''ISSL_TARGET''))) AS TARGET, '+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_PRIEM''))) AS PRIEM, '+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_APPARAT''))) AS APPARAT '+
                        '   FROM ASU.TNAZIS '+
                        '  WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, odsArch.FieldByName('FK_ID').AsInteger);
        ods.Open;
        nAge_4rep := ods.FieldByName('PACAGE').AsInteger;
        sSex_4rep := ods.FieldByName('SEX').AsString;
        sAddress_4rep := ods.FieldByName('ADDRESS').AsString;
        sPhone_4rep := ods.FieldByName('PHONE').AsString;
        sKabName_4rep := ods.FieldByName('KABNAME').AsString;
        sKabPhone_4rep := ods.FieldByName('KABPHONE').AsString;
        sLabName_4rep := ods.FieldByName('LAB').AsString;
        sKoren_4rep := ods.FieldByName('KOREN').AsString;
        sOpl_4rep := ods.FieldByName('OPL').AsString;
        sTarget_4rep := ods.FieldByName('TARGET').AsString;
        sPriem_4rep := ods.FieldByName('PRIEM').AsString;
        sApparat_4rep := ods.FieldByName('APPARAT').AsString;
        DoProjivaet;
        frxFlu.ShowReport;
      finally
        ods.Free;
      end;
    end else
    begin
      odsListNaz.Close;
      odsListNaz.SetVariable('PFC_TYPE', odsArch.FieldByName('FC_TYPE').AsString);
      odsListNaz.Open;
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TNAZIS.FK_PACID) AS PACAGE, '+
                        '        ASU.PKG_REGIST_PACFUNC.GET_PAC_SEX(TNAZIS.FK_PACID) AS SEX, '+
                        '        ASU.GET_ADDR_STR_BY_ID(ASU.PKG_REGIST_PACFUNC.GET_PAC_ADRID(TNAZIS.FK_PACID)) AS ADDRESS, '+
                        '        (SELECT FC_CHAR '+
                        '           FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID '+
                        '                          AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''KONTAKT_PHONE'')) AS PHONE, '+
                        '        (SELECT FC_NAME FROM ASU.TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABNAME, '+
                        '        (SELECT FC_PHONE FROM ASU.TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABPHONE, '+
                        '        (SELECT ASU.DO_VRACHFIO(FN_NUM) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''RG_LABORANT'')) AS LAB, '+
                        '        (SELECT MAX(FC_CHAR) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''VRACH_NAPRAVIL'')) AS VRACH, '+
                        '        (SELECT MAX(FC_CHAR) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_DIAGNOZ'')) AS DS, '+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = ASU.GET_PEPLID(TNAZIS.FK_PACID) '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''KOREN_NASEL''))) AS KOREN, '+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL''))) AS OPL, '+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''ISSL_TARGET''))) AS TARGET, '+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''TIME_NORMA_ISSL''))) AS NADBAVKA, '+
                        '        ASU.GET_SMIDNAME(TNAZIS.FK_NAZTYPEID) AS URGENT, '+
                        '        ASU.GET_VRACHFCOTDEL(TNAZIS.FK_VRACHID) AS OTDELSTAC, '+
                        '       (SELECT DECODE(FC_CHAR, NULL, ASU.GET_SMIDNAME(TIB.FK_SMID), FC_CHAR) '+
                        '          FROM ASU.TIB '+
                        '         WHERE FK_PACID = :PFK_ID '+
                        '           AND FK_SMID IN (SELECT FK_ID '+
                        '                             FROM TSMID '+
                        '                           START WITH FC_SYNONIM = ''KEM_NAPRAVLEN'' '+
                        '                           CONNECT BY PRIOR FK_ID = FK_OWNER '+
                        '                           UNION ALL '+
                        '                           SELECT FK_ID FROM ASU.TCOMPANY '+
                        '                           START WITH FC_SYNONIM = ''ROOT_LPU'' '+
                        '                           CONNECT BY PRIOR FK_ID = FK_OWNER)) AS KEMNAPRAVLEN '+
                        '   FROM ASU.TNAZIS '+
                        '  WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, odsArch.FieldByName('FK_ID').AsInteger);
        ods.Open;
        nAge_4rep := ods.FieldByName('PACAGE').AsInteger;
        sSex_4rep := ods.FieldByName('SEX').AsString;
        sAddress_4rep := ods.FieldByName('ADDRESS').AsString;
        sPhone_4rep := ods.FieldByName('PHONE').AsString;
        sKabName_4rep := ods.FieldByName('KABNAME').AsString;
        sKabPhone_4rep := ods.FieldByName('KABPHONE').AsString;
        sLabName_4rep := ods.FieldByName('LAB').AsString;
        sKoren_4rep := ods.FieldByName('KOREN').AsString;
        sOpl_4rep := ods.FieldByName('OPL').AsString;
        sTarget_4rep := ods.FieldByName('TARGET').AsString;
        sVrach_4rep := ods.FieldByName('VRACH').AsString;
        sNadbavka_4rep := ods.FieldByName('NADBAVKA').AsString;
        sUrgent_4rep := ods.FieldByName('URGENT').AsString;
        sDS_4rep := ods.FieldByName('DS').AsString;
        if odsArch.FieldByName('IS_AMB').AsInteger = 0 then
          sKem_4rep := ods.FieldByName('OTDELSTAC').AsString
        else
          sKem_4rep := ods.FieldByName('KEMNAPRAVLEN').AsString;  
        DoProjivaet;
        frxNaprav.ShowReport;
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmHistoryPac.DoPrint_4OBTC;
var ods : TOracleDataSet;
begin
  if odsArch.FieldByName('OWNER').AsInteger = frmMain.GET_ISSL_FLU then
    begin
      ShowMessage('Просмотр направления для флюорографических исследований находится в стадии разработки!');
    end else
    begin
      odsListNaz.Close;
      odsListNaz.SetVariable('PFC_TYPE', odsArch.FieldByName('FC_TYPE').AsString);
      odsListNaz.Open;
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TNAZIS.FK_PACID) AS PACAGE, '+
                        '        ASU.PKG_REGIST_PACFUNC.GET_PAC_SEX(TNAZIS.FK_PACID) AS SEX, '+
                        '        ASU.GET_ADDR_STR_BY_ID(ASU.PKG_REGIST_PACFUNC.GET_PAC_ADRID(TNAZIS.FK_PACID)) AS ADDRESS, '+
                        '        (SELECT FC_CHAR '+
                        '           FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID '+
                        '                          AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''KONTAKT_PHONE'')) AS PHONE, '+
                        '        (SELECT FC_NAME FROM ASU.TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABNAME, '+
                        '        (SELECT FC_PHONE FROM ASU.TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABPHONE, '+
                        '        (SELECT ASU.DO_VRACHFIO(FN_NUM) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''RG_LABORANT'')) AS LAB, '+
                        '        (SELECT MAX(FC_CHAR) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''VRACH_NAPRAVIL'')) AS VRACH, '+
                        '        (SELECT MAX(FC_CHAR) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_DIAGNOZ'')) AS DS, '+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = ASU.GET_PEPLID(TNAZIS.FK_PACID) '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''KOREN_NASEL''))) AS KOREN, '+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL''))) AS OPL, '+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''ISSL_TARGET''))) AS TARGET, '+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+
                        '           FROM ASU.TIB '+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''TIME_NORMA_ISSL''))) AS NADBAVKA, '+
                        '        ASU.GET_SMIDNAME(TNAZIS.FK_NAZTYPEID) AS URGENT, '+
                        '        ASU.GET_VRACHFCOTDEL(TNAZIS.FK_VRACHID) AS OTDELSTAC, '+
                        '       (SELECT DECODE(FC_CHAR, NULL, ASU.GET_SMIDNAME(TIB.FK_SMID), FC_CHAR) '+
                        '          FROM ASU.TIB '+
                        '         WHERE FK_PACID = :PFK_ID '+
                        '           AND FK_SMID IN (SELECT FK_ID '+
                        '                             FROM TSMID '+
                        '                           START WITH FC_SYNONIM = ''KEM_NAPRAVLEN'' '+
                        '                           CONNECT BY PRIOR FK_ID = FK_OWNER '+
                        '                           UNION ALL '+
                        '                           SELECT FK_ID FROM ASU.TCOMPANY '+
                        '                           START WITH FC_SYNONIM = ''ROOT_LPU'' '+
                        '                           CONNECT BY PRIOR FK_ID = FK_OWNER)) AS KEMNAPRAVLEN '+
                        '   FROM ASU.TNAZIS '+
                        '  WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, odsArch.FieldByName('FK_ID').AsInteger);
        ods.Open;
        nAge_4rep := ods.FieldByName('PACAGE').AsInteger;
        sSex_4rep := ods.FieldByName('SEX').AsString;
        sAddress_4rep := ods.FieldByName('ADDRESS').AsString;
        sPhone_4rep := ods.FieldByName('PHONE').AsString;
        sKabName_4rep := ods.FieldByName('KABNAME').AsString;
        sKabPhone_4rep := ods.FieldByName('KABPHONE').AsString;
        sLabName_4rep := ods.FieldByName('LAB').AsString;
        sKoren_4rep := ods.FieldByName('KOREN').AsString;
        sOpl_4rep := ods.FieldByName('OPL').AsString;
        sTarget_4rep := ods.FieldByName('TARGET').AsString;
        sVrach_4rep := ods.FieldByName('VRACH').AsString;
        sNadbavka_4rep := ods.FieldByName('NADBAVKA').AsString;
        sUrgent_4rep := ods.FieldByName('URGENT').AsString;
        sDS_4rep := ods.FieldByName('DS').AsString;
        if odsArch.FieldByName('IS_AMB').AsInteger = 0 then
          sKem_4rep := ods.FieldByName('OTDELSTAC').AsString
        else
          sKem_4rep := ods.FieldByName('KEMNAPRAVLEN').AsString;
        DoProjivaet;
        frxNaprav_4OBTC.ShowReport;
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmHistoryPac.DoProjivaet;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' DECLARE '+
                    '   nSMID NUMBER; '+
                    ' BEGIN '+
                    ' SELECT '+
                    ' DECODE((SELECT ASU.GET_SMIDNAME(MAX(FK_SMID)) FROM TIB '+
                    '          WHERE FK_PACID = :PFK_PACID '+
                    '            AND (FK_SMID IN (SELECT FK_ID '+
                    '                               FROM TSMID '+
                    '                              WHERE FK_OWNER = (SELECT MAX(FK_ID) '+
                    '                                                  FROM TSMID '+
                    '                                                 WHERE FC_SYNONIM = ''PD_MZ'')) '+
                    '                                 OR FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO''))), '+
                    '        NULL, '+
                    '        (SELECT ASU.GET_SMIDNAME(MAX(FK_SMID)) FROM TIB '+
                    '          WHERE FK_PACID = :PFK_PEPLID '+
                    '            AND (FK_SMID IN (SELECT FK_ID '+
                    '                               FROM TSMID '+
                    '                              WHERE FK_OWNER = (SELECT MAX(FK_ID) '+
                    '                                                  FROM TSMID '+
                    '                                                 WHERE FC_SYNONIM = ''PD_MZ'')) '+
                    '                                 OR FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO''))), '+
                    '        (SELECT ASU.GET_SMIDNAME(MAX(FK_SMID)) FROM TIB '+
										'          WHERE FK_PACID = :PFK_PACID '+
                    '            AND (FK_SMID IN (SELECT FK_ID '+
                    '                               FROM TSMID '+
                    '                              WHERE FK_OWNER = (SELECT MAX(FK_ID) '+
                    '                                                  FROM TSMID '+
                    '                                                 WHERE FC_SYNONIM = ''PD_MZ'')) '+
                    '                                 OR FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO'')))) INTO :VAL '+
                    ' FROM DUAL; '+
                    ' IF :VAL IS NULL THEN '+
										'   SELECT ASU.GET_SMIDNAME(MAX(FK_ID)) INTO :VAL FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''PD_MZ'') AND FK_DEFAULT = 1; '+
                    ' END IF; '+
                    ' END; ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.DeclareAndSet('PFK_PEPLID', otInteger, pPEPLID);
    ods.DeclareVariable('VAL', otString);
    ods.Open;
    sProjivaet_4rep := ods.GetVariable('VAL');
  finally
    ods.Free;
  end;
end;

procedure TfrmHistoryPac.DoRefreshSMIDConst;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT ASU.GET_NAZCANCEL FROM DUAL ';
    ods.Close;
    ods.Open;
    get_nazcancel := ods.FieldByName('GET_NAZCANCEL').AsInteger;
  finally
    ods.Free;
  end;
end;

procedure TfrmHistoryPac.frxArchGetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'DATESYS' then Value := sSysDate_4Rep;
  if VarName = 'D1' then Value := bbBegin.Date;
  if VarName = 'D2' then Value := bbEnd.Date;
  if VarName = 'SOTRFIO' then Value := SOTRFIO;
  if VarName = 'FIOPAC' then Value := lbFIO.Caption;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;  
end;

procedure TfrmHistoryPac.frxFluGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'RG_LABORANT' then Value := sLabName_4rep;
  if VarName = 'FIO_PAC' then Value := lbFIO.Caption;
  if VarName = 'DATE_ROJD' then Value := odsArch.FieldByName('FD_ROJD').AsDateTime;
  if VarName = 'KORENNOE' then Value := sKoren_4rep;
  if VarName = 'PROJIVAET' then Value := sProjivaet_4rep;
  if VarName = 'ADDRESS' then Value := sAddress_4rep;
  if VarName = 'PHONE' then Value := sPhone_4rep;
  if VarName = 'NUMIB' then Value := odsArch.FieldByName('NUMIB').AsString;
  if VarName = 'NUMISSL' then Value := odsArch.FieldByName('NUMBER_ISSL').AsString;
  if VarName = 'NAMEISSL' then Value := odsArch.FieldByName('NAMEISSL').AsString;
  if VarName = 'AGE' then Value := nAge_4rep;
  if VarName = 'SEX' then Value := sSex_4rep;
  if VarName = 'VID_OPLATA' then Value := sOpl_4rep;
  if VarName = 'TARGET' then Value := sTarget_4rep;
  if VarName = 'KABINET' then Value := sKabName_4rep;
  if VarName = 'PHONEKAB' then Value := sKabPhone_4rep;
  if VarName = 'PRIEM' then Value := sPriem_4rep;
  if VarName = 'APPARAT' then Value := sApparat_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmHistoryPac.frxNapravGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'RG_LABORANT' then Value := sLabName_4rep;
  if VarName = 'FIO_PAC' then Value := lbFIO.Caption;
  if VarName = 'DATE_ROJD' then Value := odsArch.FieldByName('FD_ROJD').AsDateTime;
  if VarName = 'KORENNOE' then Value := sKoren_4rep;
  if VarName = 'PROJIVAET' then Value := sProjivaet_4rep;
  if VarName = 'ADDRESS' then Value := sAddress_4rep;
  if VarName = 'PHONE' then Value := sPhone_4rep;
  if VarName = 'NUMIB' then Value := odsArch.FieldByName('NUMIB').AsString;
  if VarName = 'KEM_NAPRAVLEN' then Value := sKem_4rep;
  if VarName = 'NAPRAV_DS' then Value := sDs_4rep;
  if VarName = 'SROCH' then Value := sUrgent_4rep;
  if VarName = 'NADBAVKA_TIME' then Value := sNadbavka_4rep;
  if VarName = 'NUMISSL' then Value := odsArch.FieldByName('NUMBER_ISSL').AsString;
  if VarName = 'AGE' then Value := nAge_4rep;
  if VarName = 'SEX' then Value := sSex_4rep;
  if VarName = 'VID_OPLATA' then Value := sOpl_4rep;
  if VarName = 'VRACH_NAPRAVIL' then Value := sVrach_4rep;
  if VarName = 'TARGET' then Value := sTarget_4rep;
  if VarName = 'KABINET' then Value := sKabName_4rep;
  if VarName = 'PHONEKAB' then Value := sKabPhone_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmHistoryPac.frxNaprav_4OBTCGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'RG_LABORANT' then Value := sLabName_4rep;
  if VarName = 'FIO_PAC' then Value := lbFIO.Caption;
  if VarName = 'DATE_ROJD' then Value := odsArch.FieldByName('FD_ROJD').AsDateTime;
  if VarName = 'KORENNOE' then Value := sKoren_4rep;
  if VarName = 'PROJIVAET' then Value := sProjivaet_4rep;
  if VarName = 'ADDRESS' then Value := sAddress_4rep;
  if VarName = 'PHONE' then Value := sPhone_4rep;
  if VarName = 'NUMIB' then Value := odsArch.FieldByName('NUMIB').AsString;
  if VarName = 'KEM_NAPRAVLEN' then Value := sKem_4rep;
  if VarName = 'NAPRAV_DS' then Value := sDs_4rep;
  if VarName = 'SROCH' then Value := sUrgent_4rep;
  if VarName = 'NADBAVKA_TIME' then Value := sNadbavka_4rep;
  if VarName = 'NUMISSL' then Value := odsArch.FieldByName('NUMBER_ISSL').AsString;
  if VarName = 'AGE' then Value := nAge_4rep;
  if VarName = 'SEX' then Value := sSex_4rep;
  if VarName = 'VID_OPLATA' then Value := sOpl_4rep;
  if VarName = 'VRACH_NAPRAVIL' then Value := sVrach_4rep;
  if VarName = 'TARGET' then Value := sTarget_4rep;
  if VarName = 'KABINET' then Value := sKabName_4rep;
  if VarName = 'PHONEKAB' then Value := sKabPhone_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmHistoryPac.frxPrintProtocolGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4rep;
  if VarName = 'PACFIO' then Value := sFIOPac_4rep; 
  if VarName = 'DATE_ROJD' then Value := sDateRojd_4rep;
  if VarName = 'NAMEISSL' then Value := odsArch.FieldByName('NAMEISSL').AsString;
  if VarName = 'DOZA' then Value := odsArch.FieldByName('FN_DOZA').AsString;
  if VarName = 'DATEISSL' then Value := odsArch.FieldByName('FD_RUN_STR').AsString;
  if VarName = 'TEXTISSL' then Value := sTextIssl_4rep;
  if VarName = 'NUMISSL' then Value := odsArch.FieldByName('NUMBER_ISSL').AsString;
  if VarName = 'SOTR' then Value := sSotrFIO_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmHistoryPac.lbFIOMouseLeave(Sender: TObject);
begin
  lbFIO.Style.BorderStyle := ebsNone;
  lbFIO.Style.BorderColor := clBtnFace;
end;

procedure TfrmHistoryPac.lbFIOMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lbFIO.Style.BorderStyle := ebsUltraFlat;
  lbFIO.Style.BorderColor := clGray;
end;

procedure TfrmHistoryPac.N5Click(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := lbFIO.Caption;
end;

procedure TfrmHistoryPac.dxBarButton1Click(Sender: TObject);
var CurYear : String;
begin
  CurYear:=IntToStr(CurrentYear);
  odsArch.BeforeOpen:=nil;
  odsArch.Close;
  odsArch.DeclareAndSet('PFD_DATE1', otDate, StrToDate('01.01.'+CurYear));
  odsArch.DeclareAndSet('PFD_DATE2', otDate, StrToDate('31.12.'+CurYear));
  odsArch.Open;
  odsArch.BeforeOpen := odsArchBeforeOpen;
  frmHistoryPac.Caption := 'База данных по пациенту. Период: ТЕКУЩИЙ ГОД ';
end;

procedure TfrmHistoryPac.dxBarButton2Click(Sender: TObject);
var year, month, day : Word;
    PrevYear : String;
begin
  PrevYear:=IntToStr(CurrentYear-1);
  DecodeDate(Date, Year, Month, Day); //!!!
  odsArch.BeforeOpen:=nil;
  odsArch.Close;
  odsArch.DeclareAndSet('PFD_DATE1', otDate, StrToDate(IntToStr(Day)+'.'+IntToStr(Month)+'.'+PrevYear));
  odsArch.DeclareAndSet('PFD_DATE2', otDate, Date); //!!!
  odsArch.Open;
  odsArch.BeforeOpen := odsArchBeforeOpen;
  frmHistoryPac.Caption := 'База данных по пациенту. Период: ВЕСЬ ГОД ';
end;

procedure TfrmHistoryPac.dxBarButton3Click(Sender: TObject);
begin
  odsArch.BeforeOpen:=nil;
  odsArch.Close;
  odsArch.DeclareAndSet('PFD_DATE1', otDate, incYear(now,-1000));
  odsArch.DeclareAndSet('PFD_DATE2', otDate, incYear(now,1000));
  odsArch.Open;
  odsArch.BeforeOpen := odsArchBeforeOpen;
  frmHistoryPac.Caption := 'База данных по пациенту. Период: ВЕСЬ ПЕРИОД ';
end;

end.
