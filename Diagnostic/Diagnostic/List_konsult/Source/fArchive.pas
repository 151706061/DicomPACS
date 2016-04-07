unit fArchive;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, ImgList,
  ActnList, cxClasses, dxBar, Oracle, DB, OracleData, JclFileUtils, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, JvDBUtils,
  frxClass, frxDBSet, Menus, cxGridExportLink, cxSplitter, cxContainer, cxLabel,
  ExtCtrls, dxmdaset, JvExControls, JvAnimatedImage, JvGIFCtrl,
  dxSkinOffice2007Green;

type
  TfrmArchive = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    alMain: TActionList;
    ilMain: TImageList;
    bbClose: TdxBarButton;
    aClose: TAction;
    dsJournal: TDataSource;
    bbParam: TdxBarButton;
    aParam: TAction;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    bbPrint: TdxBarButton;
    aPrint: TAction;
    aResult: TAction;
    bbRefresh: TdxBarButton;
    aRefresh: TAction;
    frxRepPrint: TfrxReport;
    frxDBPrint: TfrxDBDataset;
    sdPopUp: TSaveDialog;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    N2: TMenuItem;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    paParam: TPanel;
    paMainParam: TPanel;
    Splitter1: TSplitter;
    paSubParam: TPanel;
    cxLabel2: TcxLabel;
    lbDateBeg: TcxLabel;
    cxLabel3: TcxLabel;
    lbDateEnd: TcxLabel;
    frxRepProtocol: TfrxReport;
    bbResult: TdxBarButton;
    Animator1: TJvGIFAnimator;
    cxLabel6: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel4: TcxLabel;
    oqThread: TOracleQuery;
    dxMemData1: TdxMemData;
    dxMemData1FK_ID: TIntegerField;
    dxMemData1KABNAME: TStringField;
    dxMemData1FD_RUN: TStringField;
    dxMemData1FIOPAC: TStringField;
    dxMemData1ISSLNAME: TStringField;
    dxMemData1STATE: TStringField;
    dxMemData1FK_NAZSOSID: TIntegerField;
    dxMemData1FD_RUN_TIME: TStringField;
    acEnable: TAction;
    TVARCHIVE: TcxGridTableView;
    VARCHIVEFD_RUN: TcxGridColumn;
    VARCHIVEKAB: TcxGridColumn;
    VARCHIVEISSLNAME: TcxGridColumn;
    VARCHIVEFIOPAC: TcxGridColumn;
    VARCHIVESTATE: TcxGridColumn;
    VARCHIVEFK_ID: TcxGridColumn;
    VARCHIVEFD_ROJD: TcxGridColumn;
    VARCHIVEFK_NAZSOSID: TcxGridColumn;
    VARCHIVEFD_RUN_TIME: TcxGridColumn;
    VARCHIVETYPEPAC: TcxGridColumn;
    dxMemData1TYPEPAC: TStringField;
    cxLabel1: TcxLabel;
    lbSotr: TcxLabel;
    dxMemData1FD_ROJD: TDateField;
    dxMemData1ADDRESS: TStringField;
    VARCHIVEADDRESS: TcxGridColumn;
    VARCHIVEDIAG: TcxGridColumn;
    VARCHIVEKODMKB: TcxGridColumn;
    VARCHIVEVYAVLEN: TcxGridColumn;
    VARCHIVEREGIONAL: TcxGridColumn;
    VARCHIVEPHONE: TcxGridColumn;
    VARCHIVENATIONAL: TcxGridColumn;
    dxMemData1DIAG: TStringField;
    dxMemData1KODMKB: TStringField;
    dxMemData1VYAVLEN: TStringField;
    dxMemData1REGIONAL: TStringField;
    dxMemData1PHONE: TStringField;
    dxMemData1NATIONAL: TStringField;
    VARCHIVEAGE: TcxGridColumn;
    dxMemData1AGE: TStringField;
    VARCHIVESEX: TcxGridColumn;
    dxMemData1SEX: TStringField;
    VARCHIVESERVPLACE: TcxGridColumn;
    dxMemData1SERVPLACE: TStringField;
    oqThread_4AllBase: TOracleQuery;
    oqThread_4Kardio: TOracleQuery;
    dxMemData1vid_opl: TStringField;
    VARCHIVEVIDOPL: TcxGridColumn;
    VARCHIVEUCH: TcxGridColumn;
    dxMemData1uch: TStringField;
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure aParamExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure frxRepPrintGetValue(const VarName: string; var Value: Variant);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure frxRepProtocolGetValue(const VarName: string; var Value: Variant);
    procedure aResultExecute(Sender: TObject);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure acEnableExecute(Sender: TObject);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure TVARCHIVECellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure TVARCHIVEFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure TVARCHIVECustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    Load : Boolean; 
    idSMID : Integer;
    dDateBegin, dDateEnd : TDateTime;
    procedure CheckEnabledButtons;
    { Private declarations }
  public
    sDateSys_4Rep : String;
    GET_VIPNAZ, GET_NAZCANCEL : Integer;
    sSotrFIO_4rep, sTextIssl_4rep, sNumIB_4rep : String;
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmArchive: TfrmArchive;
  StartTime: TTime;
  bbr : Boolean;

implementation

uses fMain, fOtmena, fSetParam;

{$R *.dfm}

{ TfrmMain }

procedure TfrmArchive.acEnableExecute(Sender: TObject);
var i : Integer;
begin
  for i := 0 to TVARCHIVE.DataController.LockCount - 1 do
    TVARCHIVE.EndUpdate;
end;

procedure TfrmArchive.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmArchive.aParamExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSetParam, frmSetParam);
  if idSMID <> 0 then
    begin
      frmSetParam.cxDateBeg.Date := dDateBegin;
      frmSetParam.cxDateEnd.Date := dDateEnd;
    end else
    begin
      frmSetParam.cxDateBeg.Date := frmMain.GET_SYSTEMDATE;
      frmSetParam.cxDateEnd.Date := frmMain.GET_SYSTEMDATE;
    end;
  frmSetParam.ShowModal;
  if frmSetParam.ModalResult = mrOK then
    begin
      bbr := False;
      aRefresh.Enabled := False;
      aParam.Enabled := False;
      aResult.Enabled := False;
      aPrint.Enabled := False;

      cxLabel6.Caption := '';
      cxLabel5.Caption := '';
      cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';

      if TVARCHIVE.DataController.LockCount = 0 then
        TVARCHIVE.BeginUpdate;
      TVARCHIVE.DataController.RecordCount := 0;
      while TVARCHIVE.DataController.LockCount > 0 do
        TVARCHIVE.EndUpdate;
      cxGr.Refresh;
      dxMemData1.Close;
      dxMemData1.Open;
      dDateBegin := frmSetParam.cxDateBeg.Date;
      dDateEnd := StrToDateTime(FormatDateTime('dd.mm.yyyy', frmSetParam.cxDateEnd.Date)+' 23:59:59');
      lbDateBeg.Caption := DateTimeToStr(frmSetParam.cxDateBeg.Date);
      lbDateEnd.Caption := DateTimeToStr(Trunc(frmSetParam.cxDateEnd.Date));
      paParam.Visible := True;
      paSubParam.Visible := True;
      StartTime:= Now;
      cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
      cxLabel6.Refresh;
      oqThread.Scrollable := True;
      Animator1.Animate := True;

      oqThread.SetVariable('PFK_ISPOLID', frmMain.pSOTRID);
      oqThread.SetVariable('PFD_DATE1', dDateBegin);
      oqThread.SetVariable('PFD_DATE2', dDateEnd);
      oqThread.Execute;
      Load := True;
    end;
  frmSetParam.Free;
end;

procedure TfrmArchive.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS FROM DUAL ';
    ods.Open;
    sDateSys_4Rep := ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
  end;
  frxRepPrint.ShowReport;
end;

procedure TfrmArchive.aRefreshExecute(Sender: TObject);
begin
  if Load <> False then
    begin
      aRefresh.Enabled := False;
      aParam.Enabled := False;
      aResult.Enabled := False;
      aPrint.Enabled := False;

      cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';
      if TVARCHIVE.DataController.LockCount = 0 then
        TVARCHIVE.BeginUpdate;
      TVARCHIVE.DataController.RecordCount := 0;
      while TVARCHIVE.DataController.LockCount > 0 do
        TVARCHIVE.EndUpdate;
      cxGr.Refresh;
      dxMemData1.Close;
      dxMemData1.Open;
      StartTime:= Now;
      oqThread.Scrollable := True;
      Animator1.Animate := True;
      oqThread.SetVariable('PFK_ISPOLID', frmMain.pSOTRID);
      oqThread.SetVariable('PFD_DATE1', dDateBegin);
      oqThread.SetVariable('PFD_DATE2', dDateEnd);
      oqThread.Execute;
    end;
end;

procedure TfrmArchive.aResultExecute(Sender: TObject);
var ods : TOracleDataSet;
    str : string;
    mem : TMemoryStream;
    str1 : TStringList;
begin
  if TVARCHIVE.DataController.Values[TVARCHIVE.DataController.FocusedRecordIndex, VARCHIVEFK_NAZSOSID.Index] = GET_VIPNAZ then
    begin
      mem := TMemoryStream.Create;
      str1 := TStringList.Create;
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FK_ID, '+
                        '        DO_VRACHFIO(VNAZ.FK_ISPOLID) AS VRACHFIO, '+
                        '        (SELECT FB_TEXT FROM TRICHVIEWDATA WHERE FK_PACID = VNAZ.FK_ID) AS TEXTISSL, '+
                        '        ASU.GET_IB(VNAZ.FK_PACID) AS NUMIB, '+
                        '        (SELECT STAT.GET_RES_KONSULT_DIAGNAZ((SELECT FK_ID FROM ASU.VRES WHERE FK_NAZID = VNAZ.FK_ID)) FROM DUAL) AS DIAGNAZ '+
                        '   FROM ASU.VNAZ '+
                        '  WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, TVARCHIVE.DataController.Values[TVARCHIVE.DataController.FocusedRecordIndex, VARCHIVEFK_ID.Index]);
        ods.Open;
        sSotrFIO_4rep := ods.FieldByName('VRACHFIO').AsString;
        sTextIssl_4rep := ods.FieldByName('TEXTISSL').AsString;
        sNumIB_4rep := ods.FieldByName('NUMIB').AsString;
        str := ods.FieldByName('DIAGNAZ').AsString;
        frmMain.RvHtmlImporter1.LoadHtml(str);
        mem.Position := 0;
        frmMain.rve1.SaveTextToStream('',mem,0,False,True);
        mem.Position := 0;
        str1.LoadFromStream(mem);
        mem.Clear;
        frmMain.rve1.Clear;
        frmMain.rve1.Reformat;
        sTextIssl_4Rep := sTextIssl_4Rep + #13#10 + str1.Text;
        str1.Clear;
      finally
        ods.Free;
      end;
        frxRepProtocol.ShowReport;
    end;
  if TVARCHIVE.DataController.Values[TVARCHIVE.DataController.FocusedRecordIndex, VARCHIVEFK_NAZSOSID.Index] = GET_NAZCANCEL then
    begin
      Application.CreateForm(TfrmOtmena, frmOtmena);
      frmOtmena.acOk.Visible := FALSE;
      frmOtmena.GroupBox1.Visible := FALSE;
      frmOtmena.cxOtmena.Align := alClient;
      frmOtmena.cxOtmena.Enabled := False;
      frmOtmena.acCancel.Caption := 'Закрыть';
      frmOtmena.acCancel.ImageIndex := 2;
      frmOtmena.Caption := 'Обоснование отмены (просмотр)';
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FC_RES, TO_CHAR(FD_INS, ''DD.MM.YYYY HH24:MI'') FD_INS, '+
                        '        DO_VRACHFIO(FK_VRACHID) AS SOTRFIO FROM VRES WHERE FK_NAZID = :pFK_NAZID AND FK_SOS = :PFK_SOS ';
        ods.DeclareAndSet('pFK_NAZID', otInteger, TVARCHIVE.DataController.Values[TVARCHIVE.DataController.FocusedRecordIndex, VARCHIVEFK_ID.Index]);
        ods.DeclareAndSet('PFK_SOS', otInteger, TVARCHIVE.DataController.Values[TVARCHIVE.DataController.FocusedRecordIndex, VARCHIVEFK_NAZSOSID.Index]);
        ods.Open;
        frmOtmena.cxOtmena.Text := 'Сотрудник:'+' '+ods.FieldByName('SOTRFIO').AsString+','+' '+
                                   'Дата:'+' '+ods.FieldByName('FD_INS').AsString+#13#10+
                                   'Обоснование отмены:'+' '+ods.FieldByName('FC_RES').AsString;
      finally
        ods.Free;
      end;
      frmOtmena.ShowModal;
      frmOtmena.Free;
    end;
end;

procedure TfrmArchive.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmArchive.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmArchive.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmArchive.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmArchive.CheckEnabledButtons;
begin
  aResult.Enabled := (oqThread.RowCount <> 0)
                      and (TVARCHIVE.DataController.Values[TVARCHIVE.DataController.FocusedRecordIndex, VARCHIVEFK_NAZSOSID.Index] = GET_VIPNAZ);
  aPrint.Enabled := oqThread.RowCount <> 0;
end;

procedure TfrmArchive.DoShowForm;
var ods : TOracleDataSet;
begin
  Load := False;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT GET_VIPNAZ, GET_NAZCANCEL, GET_LABVIP FROM DUAL';
    ods.Open;
    GET_VIPNAZ := ods.FieldByName('GET_VIPNAZ').AsInteger;
    GET_NAZCANCEL := ods.FieldByName('GET_NAZCANCEL').AsInteger;
  finally
    ods.Free;
  end;
  aResult.Enabled := False;
  aPrint.Enabled := False;

  TVARCHIVE.StoreToRegistry('\SoftWare\SoftMaster\List_konsult\fArchive\TVARCHIVE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVARCHIVE');
  TVARCHIVE.RestoreFromRegistry('\SoftWare\SoftMaster\List_konsult\fArchive\TVARCHIVE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVARCHIVE');
  lbSotr.Caption := frmMain.sSotrFIO;
end;

procedure TfrmArchive.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree
end;

procedure TfrmArchive.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVARCHIVE.StoreToRegistry('\SoftWare\SoftMaster\List_konsult\fArchive\TVARCHIVE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVARCHIVE');
end;

procedure TfrmArchive.FormCreate(Sender: TObject);
begin
  if frmMain.get_dbname <> 'SK' then
    begin
      oqThread.SQL.Text := oqThread_4AllBase.SQL.Text;
    end else
    begin
      oqThread.SQL.Text := oqThread_4Kardio.SQL.Text;
    end;
end;

procedure TfrmArchive.FormShow(Sender: TObject);
begin
  if frmMain.WindowState <> wsMaximized then
    frmMain.WindowState := wsMaximized;  
end;

procedure TfrmArchive.frxRepPrintGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'VSEGO' then Value := oqThread.RowCount;
  if VarName = 'SYSDATE' then Value := sDateSys_4Rep;
  if VarName = 'SOTRNAME' then Value := frmMain.sSotrFIO;
  if VarName = 'DATE1' then Value := dDateBegin;
  if VarName = 'DATE2' then Value := DateTimeToStr(Trunc(dDateEnd));
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;  
end;

procedure TfrmArchive.frxRepProtocolGetValue(const VarName: string; var Value: Variant); //!!! пересмотреть. не все параметры должны вызываться из odsJournal
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'PACFIO' then Value := TVARCHIVE.DataController.Values[TVARCHIVE.DataController.FocusedRecordIndex, VARCHIVEFIOPAC.Index];
  if VarName = 'DATE_ROJD' then Value := TVARCHIVE.DataController.Values[TVARCHIVE.DataController.FocusedRecordIndex, VARCHIVEFD_ROJD.Index];
  if VarName = 'NUMIB' then Value := sNumIB_4rep;
  if VarName = 'NAMEISSL' then Value := TVARCHIVE.DataController.Values[TVARCHIVE.DataController.FocusedRecordIndex, VARCHIVEISSLNAME.Index];
  if VarName = 'DATEISSL' then Value := TVARCHIVE.DataController.Values[TVARCHIVE.DataController.FocusedRecordIndex, VARCHIVEFD_RUN_TIME.Index];
  if VarName = 'TEXTISSL' then Value := sTextIssl_4rep;
  if VarName = 'SOTR' then Value := sSotrFIO_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmArchive.N2Click(Sender: TObject);
begin
  TVARCHIVE.RestoreFromRegistry('\SoftWare\SoftMaster\List_konsult\fArchive\TVARCHIVE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVARCHIVE');
end;

procedure TfrmArchive.oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
  const ErrorMessage: string);
begin
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True;  
end;

procedure TfrmArchive.oqThreadThreadFinished(Sender: TOracleQuery);
begin
  acEnable.Execute;
  Animator1.Animate := False;
  if bbr then
    cxLabel4.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel4.Caption := 'Запрос к Базе Данных выполнился успешно!';

  aResult.Enabled := True;
  aPrint.Enabled := True;
  aRefresh.Enabled := True;
  aParam.Enabled := True;

  CheckEnabledButtons;
end;

procedure TfrmArchive.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  TVARCHIVE.BeginUpdate;
  TVARCHIVE.DataController.RecordCount := TVARCHIVE.DataController.RecordCount + 1;
  with TVARCHIVE.DataController do
  begin
    try
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVEFK_ID.Index] := Sender.Field('FK_ID');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVEKAB.Index] := Sender.Field('KABINET');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVEFD_RUN.Index] := Sender.Field('FD_RUN');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVEFIOPAC.Index] := Sender.Field('FIOPAC');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVEFD_ROJD.Index] := Sender.Field('FD_ROJD');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVEADDRESS.Index] := Sender.Field('ADDRESS');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVEISSLNAME.Index] := Sender.Field('FC_NAME');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVESTATE.Index] := Sender.Field('STATE');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVEFD_ROJD.Index] := Sender.Field('FD_ROJD');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVEFK_NAZSOSID.Index] := Sender.Field('FK_NAZSOSID');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVEFD_RUN_TIME.Index] := Sender.Field('FD_RUN_TIME');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVETYPEPAC.Index] := Sender.Field('TYPEPAC');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVEDIAG.Index] := Sender.Field('DIAG');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVEKODMKB.Index] := Sender.Field('KODMKB');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVEVYAVLEN.Index] := Sender.Field('VYAVLEN');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVEREGIONAL.Index] := Sender.Field('REGIONAL');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVEPHONE.Index] := Sender.Field('PHONE');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVENATIONAL.Index] := Sender.Field('NATIONAL');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVEAGE.Index] := Sender.Field('AGE');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVESEX.Index] := Sender.Field('SEX');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVESERVPLACE.Index] := Sender.Field('SERVPLACE');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVEVIDOPL.Index] := Sender.Field('VID_OPL');
      Values[TVARCHIVE.DataController.RecordCount - 1, VARCHIVEUCH.Index] := Sender.Field('uch');
      dxMemData1.Insert;
      dxMemData1.FieldByName('KABNAME').AsString := Sender.Field('KABINET');
      dxMemData1.FieldByName('FD_RUN').AsString := Sender.Field('FD_RUN_TIME');
      dxMemData1.FieldByName('FIOPAC').AsString := Sender.Field('FIOPAC');
      dxMemData1.FieldByName('FD_ROJD').AsString := Sender.Field('FD_ROJD');
      dxMemData1.FieldByName('ADDRESS').AsString := Sender.Field('ADDRESS');
      dxMemData1.FieldByName('ISSLNAME').AsString := Sender.Field('FC_NAME');
      dxMemData1.FieldByName('STATE').AsString := Sender.Field('STATE');
      dxMemData1.FieldByName('FD_RUN_TIME').AsString := Sender.Field('FD_RUN_TIME');
      dxMemData1.FieldByName('TYPEPAC').AsString := Sender.Field('TYPEPAC');
      dxMemData1.FieldByName('DIAG').AsString := Sender.Field('DIAG');
      dxMemData1.FieldByName('KODMKB').AsString := Sender.Field('KODMKB');
      dxMemData1.FieldByName('VYAVLEN').AsString := Sender.Field('VYAVLEN');
      dxMemData1.FieldByName('REGIONAL').AsString := Sender.Field('REGIONAL');
      dxMemData1.FieldByName('PHONE').AsString := Sender.Field('PHONE');
      dxMemData1.FieldByName('NATIONAL').AsString := Sender.Field('NATIONAL');
      dxMemData1.FieldByName('AGE').AsString := Sender.Field('AGE');
      dxMemData1.FieldByName('SEX').AsString := Sender.Field('SEX');
      dxMemData1.FieldByName('SERVPLACE').AsString := Sender.Field('SERVPLACE');
      dxMemData1.FieldByName('VID_OPL').AsString := Sender.Field('VID_OPL');
      dxMemData1.FieldByName('uch').AsString := Sender.Field('uch');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  TVARCHIVE.EndUpdate;
  cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel6.Refresh;
  cxLabel5.Caption := 'Выбрано ' + IntToStr(TVARCHIVE.DataController.RecordCount) + ' записей.';
  cxLabel5.Refresh;
end;

procedure TfrmArchive.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
  Ver.Free;
end;

procedure TfrmArchive.TVARCHIVECellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if dsJournal.DataSet.RecordCount <> 0 then
    begin
      aResultExecute(nil);
    end;
end;

procedure TfrmArchive.TVARCHIVECustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[VARCHIVEFK_NAZSOSID.Index] = GET_NAZCANCEL then
    ACanvas.Brush.Color:=RGB(251, 172, 182);
end;

procedure TfrmArchive.TVARCHIVEFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  aResult.Enabled := TVARCHIVE.DataController.Values[TVARCHIVE.DataController.FocusedRecordIndex, VARCHIVEFK_NAZSOSID.Index] = GET_VIPNAZ;
end;

end.
