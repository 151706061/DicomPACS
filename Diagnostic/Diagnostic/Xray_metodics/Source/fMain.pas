unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, ImgList,
  ActnList, cxClasses, dxBar, Oracle, DB, OracleData, JclFileUtils, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, JvDBUtils,
  frxClass, frxDBSet, Menus, cxGridExportLink, cxSplitter, cxContainer, cxLabel,
  ExtCtrls, dxmdaset, JvExControls, JvAnimatedImage, JvGIFCtrl, uGlobalConst, SMMainAPI,
  dxSkinOffice2007Green;

type
  TfrmMain = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    alMain: TActionList;
    ilMain: TImageList;
    bbClose: TdxBarButton;
    aClose: TAction;
    dsJournal: TDataSource;
    os: TOracleSession;
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
    cxLabel1: TcxLabel;
    cxSplitter1: TcxSplitter;
    cxLabel2: TcxLabel;
    lbMetodic: TcxLabel;
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
    TVMETODIC: TcxGridTableView;
    VMETODICFD_RUN: TcxGridColumn;
    VMETODICKAB: TcxGridColumn;
    VMETODICISSLNAME: TcxGridColumn;
    VMETODICFIOPAC: TcxGridColumn;
    VMETODICSTATE: TcxGridColumn;
    VMETODICFK_ID: TcxGridColumn;
    VMETODICFD_ROJD: TcxGridColumn;
    VMETODICFK_NAZSOSID: TcxGridColumn;
    VMETODICDOZA: TcxGridColumn;
    VMETODICFD_RUN_TIME: TcxGridColumn;
    VMETODICTYPEPAC: TcxGridColumn;
    dxMemData1TYPEPAC: TStringField;
    VMETODICVIDSNIMOK: TcxGridColumn;
    dxMemData1VIDSNIMOK: TStringField;
    dxMemData1KOLVO: TIntegerField;
    dxMemData1KOLVOPRSV: TIntegerField;
    VMETODICKOLVO: TcxGridColumn;
    VMETODICPRSV: TcxGridColumn;
    N3: TMenuItem;
    aLaborant: TAction;
    N4: TMenuItem;
    VMETODICOTDEL: TcxGridColumn;
    dxMemData1OTDEL: TStringField;
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
    procedure TVMETODICCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure TVMETODICFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure aLaborantExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    MedotradeSign : string;
    idSMID : Integer;
    dDateBegin, dDateEnd : TDateTime;
    procedure CheckEnabledButtons;
    { Private declarations }
  public
    pAPPSOTRID : Integer;
    pSOTRID : Integer;
    sVrachFIO : String;
    dSysDate : TDateTime;
    sCompanyName : String;
    sDateSys_4Rep : String;
    sOtdelName : String;
    GET_VIPNAZ, GET_NAZCANCEL, GET_LABVIP, GET_XRAY_MRT : Integer;
    sSotrFIO_4rep, sTextIssl_4rep, sNumIssl_4rep, sNumIB_4rep : String;
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  StartTime: TTime;
  bbr : Boolean;

implementation

uses fSetParam, fOtmena, fLaborant;

{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.acEnableExecute(Sender: TObject);
var i : Integer;
begin
  for i := 0 to TVMETODIC.DataController.LockCount - 1 do
    TVMETODIC.EndUpdate;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aLaborantExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmLaborant, frmLaborant);
  try
    frmLaborant.DoShowForm(TVMETODIC.DataController.Values[TVMETODIC.DataController.FocusedRecordIndex, VMETODICFK_ID.Index]);
    frmLaborant.ShowModal;
  finally
    frmLaborant.Free;
  end;
end;

procedure TfrmMain.aParamExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSetParam, frmSetParam);
  try
    if idSMID <> 0 then
      begin
        frmSetParam.cxNameMetodic.Tag := idSMID;
        frmSetParam.cxNameMetodic.Text := lbMetodic.Caption;
        frmSetParam.cxDateBeg.Date := dDateBegin;
        frmSetParam.cxDateEnd.Date := dDateEnd;
      end else
      begin
        frmSetParam.cxDateBeg.Date := dSysDate;
        frmSetParam.cxDateEnd.Date := dSysDate;
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

        if TVMETODIC.DataController.LockCount = 0 then
          TVMETODIC.BeginUpdate;
        TVMETODIC.DataController.RecordCount := 0;
        while TVMETODIC.DataController.LockCount > 0 do
          TVMETODIC.EndUpdate;
        cxGr.Refresh;
        dxMemData1.Close;
        dxMemData1.Open;
        idSMID := frmSetParam.cxNameMetodic.Tag;
        dDateBegin := frmSetParam.cxDateBeg.Date;
        dDateEnd := StrToDateTime(FormatDateTime('dd.mm.yyyy', frmSetParam.cxDateEnd.Date)+' 23:59:59');
        lbMetodic.Caption := frmSetParam.cxNameMetodic.Text;
        lbDateBeg.Caption := DateTimeToStr(frmSetParam.cxDateBeg.Date);
        lbDateEnd.Caption := DateTimeToStr(Trunc(frmSetParam.cxDateEnd.Date));
        paParam.Visible := True;
        paSubParam.Visible := True;
        cxSplitter1.Visible := True;
        StartTime:= Now;
        cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
        cxLabel6.Refresh;
        oqThread.Scrollable := True;
        Animator1.Animate := True;
        oqThread.SetVariable('PFK_SMID', idSMID);
        oqThread.SetVariable('PFD_DATE1', dDateBegin);
        oqThread.SetVariable('PFD_DATE2', dDateEnd);
        oqThread.Execute;
      end;
  finally
    frmSetParam.Free;
  end;
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS FROM DUAL ';
    ods.Open;
    sDateSys_4Rep := ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
  end;
  frxRepPrint.ShowReport;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  if idSMID <> 0 then
    begin
      aRefresh.Enabled := False;
      aParam.Enabled := False;
      aResult.Enabled := False;
      aPrint.Enabled := False;

      cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';
      if TVMETODIC.DataController.LockCount = 0 then
        TVMETODIC.BeginUpdate;
      TVMETODIC.DataController.RecordCount := 0;
      while TVMETODIC.DataController.LockCount > 0 do
        TVMETODIC.EndUpdate;
      cxGr.Refresh;
      dxMemData1.Close;
      dxMemData1.Open;
      StartTime:= Now;
      oqThread.Scrollable := True;
      Animator1.Animate := True;
      oqThread.SetVariable('PFK_SMID', idSMID);
      oqThread.SetVariable('PFD_DATE1', dDateBegin);
      oqThread.SetVariable('PFD_DATE2', dDateEnd);
      oqThread.Execute;
    end;
//  RefreshQuery(odsJournal);
end;

procedure TfrmMain.aResultExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  if TVMETODIC.DataController.Values[TVMETODIC.DataController.FocusedRecordIndex, VMETODICFK_NAZSOSID.Index] = GET_VIPNAZ then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FK_ID, '+#13+
                        '        ASU.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID) AS OWNER, '+#13+
                        '        ASU.DO_VRACHFIO(FK_ISPOLID) AS VRACHFIO, '+#13+
                        '        (SELECT FB_TEXT FROM ASU.TRICHVIEWDATA WHERE FK_PACID = TNAZIS.FK_ID) AS TEXTISSL, '+#13+
                        '        ASU.GET_IB(FK_PACID) AS NUMIB, '+#13+
                        '        (SELECT MAX(FC_CHAR) FROM ASU.TIB '+#13+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL'' OR FC_SYNONIM = ''XRAY_FLU_NUMBER'')) AS NUMBER_ISSL '+#13+
                        '   FROM ASU.TNAZIS '+#13+
                        '  WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, TVMETODIC.DataController.Values[TVMETODIC.DataController.FocusedRecordIndex, VMETODICFK_ID.Index]);
        ods.Open;
        sSotrFIO_4rep := ods.FieldByName('VRACHFIO').AsString;
        sTextIssl_4rep := ods.FieldByName('TEXTISSL').AsString;
        sNumIssl_4rep := ods.FieldByName('NUMBER_ISSL').AsString;
        sNumIB_4rep := ods.FieldByName('NUMIB').AsString;
        frxRepProtocol.FindObject('Memo9').Visible := ods.FieldByName('OWNER').AsInteger <> GET_XRAY_MRT;
      finally
        ods.Free;
      end;
        frxRepProtocol.ShowReport;
    end;
  if TVMETODIC.DataController.Values[TVMETODIC.DataController.FocusedRecordIndex, VMETODICFK_NAZSOSID.Index] = GET_NAZCANCEL then
    begin
      Application.CreateForm(TfrmOtmena, frmOtmena);
      frmOtmena.acOk.Visible := FALSE;
      frmOtmena.GroupBox1.Visible := FALSE;
      frmOtmena.cxOtmena.Align := alClient;
      frmOtmena.acCancel.Caption := 'Закрыть';
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FC_RES, TO_CHAR(FD_INS, ''DD.MM.YYYY HH24:MI'') FD_INS, '+
                        '        DO_VRACHFIO(FK_VRACHID) AS SOTRFIO FROM VRES WHERE FK_NAZID = :pFK_NAZID AND FK_SOS = :PFK_SOS ';
        ods.DeclareAndSet('pFK_NAZID', otInteger, TVMETODIC.DataController.Values[TVMETODIC.DataController.FocusedRecordIndex, VMETODICFK_ID.Index]);
        ods.DeclareAndSet('PFK_SOS', otInteger, TVMETODIC.DataController.Values[TVMETODIC.DataController.FocusedRecordIndex, VMETODICFK_NAZSOSID.Index]);
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

procedure TfrmMain.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.CheckEnabledButtons;
begin
  aResult.Enabled := (oqThread.RowCount <> 0) and (TVMETODIC.DataController.Values[TVMETODIC.DataController.FocusedRecordIndex, VMETODICFK_NAZSOSID.Index] <> GET_LABVIP);
  aPrint.Enabled := oqThread.RowCount <> 0;
  aLaborant.Enabled := oqThread.RowCount <> 0;
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  pAPPSOTRID := StrToInt(paramstr(1));
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID, DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, TRUNC(SYSDATE) AS DATESYS, '+#13+
                    '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                    '        ASU.GET_VIPNAZ, ASU.GET_NAZCANCEL, ASU.GET_LABVIP, ASU.GET_XRAY_MRT, '+#13+
                    '        (SELECT FC_NAME '+#13+
                    '           FROM asu.TOTDEL '+#13+
                    '          WHERE FK_ID = (SELECT FK_OTDID FROM asu.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sVrachFIO := ods.FieldByName('VRACHFIO').AsString;
    dSysDate := ods.FieldByName('DATESYS').AsDateTime;
    sCompanyName := ods.FieldByName('COMPANYNAME').AsString;
    frmMain.Caption := 'Журнал методик('+Ver.FileVersion+'). Пользователь: '+sVrachFIO;
    GET_VIPNAZ := ods.FieldByName('GET_VIPNAZ').AsInteger;
    GET_NAZCANCEL := ods.FieldByName('GET_NAZCANCEL').AsInteger;
    GET_LABVIP := ods.FieldByName('GET_LABVIP').AsInteger;
    GET_XRAY_MRT := ods.FieldByName('GET_XRAY_MRT').AsInteger;
    sOtdelName := ods.FieldByName('OTDELNAME').AsString;
  finally
    ods.Free;
    Ver.Free;
  end;
  aResult.Enabled := False;
  aPrint.Enabled := False;
  MedotradeSign := ReadMedotradeSign;
  TVMETODIC.StoreToRegistry('\SoftWare\SoftMaster\Xray_metodics\fMain\TVJOURNAL'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TVJOURNAL');
  TVMETODIC.RestoreFromRegistry('\SoftWare\SoftMaster\Xray_metodics\fMain\TVJOURNAL'+'Vrach'+ '_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TVJOURNAL');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVMETODIC.StoreToRegistry('\SoftWare\SoftMaster\Xray_metodics\fMain\TVJOURNAL'+'Vrach'+ '_' + IntToStr(pSOTRID), TRUE, [], 'TVJOURNAL');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  if frmMain.WindowState <> wsMaximized then
    frmMain.WindowState := wsMaximized;  
end;

procedure TfrmMain.frxRepPrintGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName;
  if VarName = 'OTDELNAME' then Value := sOtdelName;
  if VarName = 'VSEGO' then Value := oqThread.RowCount;
  if VarName = 'SYSDATE' then Value := sDateSys_4Rep;
  if VarName = 'SOTRNAME' then Value := sVrachFIO;
  if VarName = 'DATE1' then Value := dDateBegin;
  if VarName = 'DATE2' then Value := DateTimeToStr(Trunc(dDateEnd));
  if VarName = 'NAMEMETODIC' then Value := lbMetodic.Caption;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.frxRepProtocolGetValue(const VarName: string; var Value: Variant); //!!! пересмотреть. не все параметры должны вызываться из odsJournal
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName;
  if VarName = 'OTDELNAME' then Value := sOtdelName;
  if VarName = 'PACFIO' then Value := TVMETODIC.DataController.Values[TVMETODIC.DataController.FocusedRecordIndex, VMETODICFIOPAC.Index];
  if VarName = 'DATE_ROJD' then Value := TVMETODIC.DataController.Values[TVMETODIC.DataController.FocusedRecordIndex, VMETODICFD_ROJD.Index];
  if VarName = 'NUMIB' then Value := sNumIB_4rep;
  if VarName = 'NAMEISSL' then Value := TVMETODIC.DataController.Values[TVMETODIC.DataController.FocusedRecordIndex, VMETODICISSLNAME.Index];
  if VarName = 'DOZA' then Value := TVMETODIC.DataController.Values[TVMETODIC.DataController.FocusedRecordIndex, VMETODICDOZA.Index];
  if VarName = 'DATEISSL' then Value := TVMETODIC.DataController.Values[TVMETODIC.DataController.FocusedRecordIndex, VMETODICFD_RUN_TIME.Index];
  if VarName = 'TEXTISSL' then Value := sTextIssl_4rep;
  if VarName = 'NUMISSL' then Value := sNumIssl_4rep;
  if VarName = 'SOTR' then Value := sSotrFIO_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TVMETODIC.RestoreFromRegistry('\SoftWare\SoftMaster\Xray_metodics\fMain\TVJOURNAL'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TVJOURNAL');
end;

procedure TfrmMain.oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
  const ErrorMessage: string);
begin
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True;  
end;

procedure TfrmMain.oqThreadThreadFinished(Sender: TOracleQuery);
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

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  TVMETODIC.BeginUpdate;
  TVMETODIC.DataController.RecordCount := TVMETODIC.DataController.RecordCount + 1;
  with TVMETODIC.DataController do
  begin
    try
      Values[TVMETODIC.DataController.RecordCount - 1, VMETODICFK_ID.Index] := Sender.Field('FK_ID');
      Values[TVMETODIC.DataController.RecordCount - 1, VMETODICKAB.Index] := Sender.Field('KABINET');
      Values[TVMETODIC.DataController.RecordCount - 1, VMETODICFD_RUN.Index] := Sender.Field('FD_RUN');
      Values[TVMETODIC.DataController.RecordCount - 1, VMETODICFIOPAC.Index] := Sender.Field('FIOPAC');
      Values[TVMETODIC.DataController.RecordCount - 1, VMETODICISSLNAME.Index] := Sender.Field('FC_NAME');
      Values[TVMETODIC.DataController.RecordCount - 1, VMETODICSTATE.Index] := Sender.Field('STATE');
      Values[TVMETODIC.DataController.RecordCount - 1, VMETODICFD_ROJD.Index] := Sender.Field('FD_ROJD');
      Values[TVMETODIC.DataController.RecordCount - 1, VMETODICDOZA.Index] := Sender.Field('DOZA');
      Values[TVMETODIC.DataController.RecordCount - 1, VMETODICFK_NAZSOSID.Index] := Sender.Field('FK_NAZSOSID');
      Values[TVMETODIC.DataController.RecordCount - 1, VMETODICFD_RUN_TIME.Index] := Sender.Field('FD_RUN_TIME');
      Values[TVMETODIC.DataController.RecordCount - 1, VMETODICTYPEPAC.Index] := Sender.Field('TYPEPAC');
      Values[TVMETODIC.DataController.RecordCount - 1, VMETODICVIDSNIMOK.Index] := Sender.Field('VIDSNIMOK');
      Values[TVMETODIC.DataController.RecordCount - 1, VMETODICKOLVO.Index] := Sender.Field('KOLVO');
      Values[TVMETODIC.DataController.RecordCount - 1, VMETODICPRSV.Index] := Sender.Field('KOLVOPRSV');
      Values[TVMETODIC.DataController.RecordCount - 1, VMETODICOTDEL.Index] := Sender.Field('OTDEL');
      dxMemData1.Insert;
      dxMemData1.FieldByName('KABNAME').AsString := Sender.Field('KABINET');
      dxMemData1.FieldByName('FD_RUN').AsString := Sender.Field('FD_RUN_TIME');
      dxMemData1.FieldByName('FIOPAC').AsString := Sender.Field('FIOPAC');
      dxMemData1.FieldByName('ISSLNAME').AsString := Sender.Field('FC_NAME');
      dxMemData1.FieldByName('STATE').AsString := Sender.Field('STATE');
      dxMemData1.FieldByName('FD_RUN_TIME').AsString := Sender.Field('FD_RUN_TIME');
      dxMemData1.FieldByName('TYPEPAC').AsString := Sender.Field('TYPEPAC');
      dxMemData1.FieldByName('VIDSNIMOK').AsString := Sender.Field('VIDSNIMOK');
      dxMemData1.FieldByName('KOLVO').AsInteger := Sender.Field('KOLVO');
      dxMemData1.FieldByName('KOLVOPRSV').AsInteger := Sender.Field('KOLVOPRSV');
      dxMemData1.FieldByName('OTDEL').AsString := Sender.Field('OTDEL');      
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  TVMETODIC.EndUpdate;
  cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel6.Refresh;
  cxLabel5.Caption := 'Выбрано ' + IntToStr(TVMETODIC.DataController.RecordCount) + ' записей.';
  cxLabel5.Refresh;
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

procedure TfrmMain.TVMETODICCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if dsJournal.DataSet.RecordCount <> 0 then
    begin
      aResultExecute(nil);
    end;
end;

procedure TfrmMain.TVMETODICFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  aResult.Enabled := TVMETODIC.DataController.Values[TVMETODIC.DataController.FocusedRecordIndex, VMETODICFK_NAZSOSID.Index] <> GET_LABVIP;
end;

end.
