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
  private
    sSotrFIO_4rep, sTextIssl_4rep, sNumIssl_4rep, sFIOPac_4rep : String;
    sDateRojd_4rep : TDateTime;
    sSysDate_4Rep : String;
    Russian : HKL;
    { Private declarations }
  public
    pPEPLID, pSOTRID : Integer;
    SOTRFIO : String;
    DateB, DateE : TDate;
    procedure DoShowHistoryPac(nPEPLID, nSOTRID : Integer; sFIO, sSOTRFIO : String);
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
////      showmessage(DateTimeToStr(DateB));
////      showmessage(DateTimeToStr(DateE));
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
                    '        DECODE(ASU.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID), '+
                    '               ASU.GET_XRAY_FLU, '+
                    '              (SELECT MAX(FC_CHAR) '+
                    '                 FROM ASU.TIB '+
                    '                WHERE FK_PACID = TNAZIS.FK_ID '+
                    '                  AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER'')), '+
                    '              (SELECT MAX(FC_CHAR) '+
                    '                 FROM ASU.TIB '+
                    '                WHERE FK_PACID = TNAZIS.FK_ID '+
                    '                  AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL''))) AS NUMBER_ISSL, '+
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
    sNumIssl_4rep := ods.FieldByName('NUMBER_ISSL').AsString;
    sFIOPac_4rep := ods.FieldByName('FIOPAC').AsString;
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

procedure TfrmHistoryPac.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  id := odsArch.FieldByName('FK_ID').AsInteger;
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
  odsArch.Locate('FK_ID', id, []);
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

procedure TfrmHistoryPac.DoShowHistoryPac(nPEPLID, nSOTRID: Integer; sFIO, sSOTRFIO : String);
var //ods : TOracleDataSet;
    Reg : TRegIniFile;
begin
  pPEPLID := nPEPLID;
  pSOTRID := nSOTRID;
  SOTRFIO := sSOTRFIO;
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

procedure TfrmHistoryPac.DoRefreshSMIDConst;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT GET_NAZCANCEL FROM DUAL ';
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
  if VarName = 'NUMISSL' then Value := sNumIssl_4rep;
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
