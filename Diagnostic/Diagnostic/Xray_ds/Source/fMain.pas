unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SMMainAPI, Oracle, OracleData, JclFileUtils, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, JvExControls, JvAnimatedImage, JvGIFCtrl, cxControls,
  cxContainer, cxEdit, cxLabel, ExtCtrls, dxBar, DB, dxmdaset, frxClass,
  frxDBSet, ActnList, ImgList, cxClasses, Menus, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGrid, cxSplitter,
  uGlobalConst, cxGridExportLink, dxSkinOffice2007Green;

type
  TfrmMain = class(TForm)
    os: TOracleSession;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    N2: TMenuItem;
    sdPopUp: TSaveDialog;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbClose: TdxBarButton;
    bbParam: TdxBarButton;
    bbPrint: TdxBarButton;
    bbRefresh: TdxBarButton;
    bbResult: TdxBarButton;
    ilMain: TImageList;
    alMain: TActionList;
    aClose: TAction;
    aParam: TAction;
    aPrint: TAction;
    aResult: TAction;
    aRefresh: TAction;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    acEnable: TAction;
    frxRepPrint: TfrxReport;
    frxDBPrint: TfrxDBDataset;
    frxRepProtocol: TfrxReport;
    dsJournal: TDataSource;
    oqThread: TOracleQuery;
    dxMemData1: TdxMemData;
    dxMemData1FK_ID: TIntegerField;
    dxMemData1KABNAME: TStringField;
    dxMemData1FD_RUN: TStringField;
    dxMemData1FIOPAC: TStringField;
    dxMemData1ISSLNAME: TStringField;
    dxMemData1FD_RUN_TIME: TStringField;
    dxBarDockControl1: TdxBarDockControl;
    paParam: TPanel;
    Splitter1: TSplitter;
    paMainParam: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    lbDs: TcxLabel;
    lbDateBeg: TcxLabel;
    cxLabel3: TcxLabel;
    lbDateEnd: TcxLabel;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel6: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel4: TcxLabel;
    cxSplitter1: TcxSplitter;
    cxGr: TcxGrid;
    TV: TcxGridTableView;
    VFD_RUN: TcxGridColumn;
    VKAB: TcxGridColumn;
    VISSLNAME: TcxGridColumn;
    VFIOPAC: TcxGridColumn;
    VFK_ID: TcxGridColumn;
    VFD_RUN_TIME: TcxGridColumn;
    cxGrLevel1: TcxGridLevel;
    VFD_ROJD: TcxGridColumn;
    dxMemData1FD_ROJD: TDateField;
    VDS: TcxGridColumn;
    dxMemData1DS: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aParamExecute(Sender: TObject);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure aRefreshExecute(Sender: TObject);
    procedure aResultExecute(Sender: TObject);
    procedure frxRepProtocolGetValue(const VarName: string; var Value: Variant);
    procedure frxRepPrintGetValue(const VarName: string; var Value: Variant);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure acEnableExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    GET_XRAY_MRT : Integer;
    sVrachFIO, sCompanyName, sOtdelName, MedotradeSign : string;
    sSotrFIO_4rep, sTextIssl_4rep, sNumIssl_4rep, sNumIB_4rep, sDateSys_4Rep : string;
    fDoza_4Rep : Double;
    dSysDate, dDateBegin, dDateEnd : TDateTime;
    procedure CheckEnabledButtons;
    { Private declarations }
  public
    pSOTRID : Integer;
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  StartTime: TTime;
  bbr : Boolean;

implementation

uses fSetParam;

{$R *.dfm}

procedure TfrmMain.acEnableExecute(Sender: TObject);
var i : Integer;
begin
  for i := 0 to TV.DataController.LockCount - 1 do
    TV.EndUpdate;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.aParamExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSetParam, frmSetParam);
  if lbDs.Tag <> 0 then
    begin
      frmSetParam.cxDateBeg.Date := StrToDateTime(lbDateBeg.Caption);
      frmSetParam.cxDateEnd.Date := StrToDateTime(lbDateEnd.Caption);
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

      if TV.DataController.LockCount = 0 then
        TV.BeginUpdate;
      TV.DataController.RecordCount := 0;
      while TV.DataController.LockCount > 0 do
        TV.EndUpdate;
      cxGr.Refresh;
      dxMemData1.Close;
      dxMemData1.Open;
      dDateBegin := frmSetParam.cxDateBeg.Date;
      dDateEnd := StrToDateTime(FormatDateTime('dd.mm.yyyy', frmSetParam.cxDateEnd.Date)+' 23:59:59');
      lbDs.Caption := frmSetParam.cxDs.Text;
      lbDs.Tag := frmSetParam.cxDs.Tag;
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
      oqThread.SetVariable('PFK_SMID', lbDs.Tag);
      oqThread.SetVariable('PDATE1', dDateBegin);
      oqThread.SetVariable('PDATE2', dDateEnd);
      oqThread.Execute;
    end;
  frmSetParam.Free;
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
  if lbDs.Tag <> 0 then
    begin
      aRefresh.Enabled := False;
      aParam.Enabled := False;
      aResult.Enabled := False;
      aPrint.Enabled := False;

      cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';
      if TV.DataController.LockCount = 0 then
        TV.BeginUpdate;
      TV.DataController.RecordCount := 0;
      while TV.DataController.LockCount > 0 do
        TV.EndUpdate;
      cxGr.Refresh;
      dxMemData1.Close;
      dxMemData1.Open;
      StartTime:= Now;
      oqThread.Scrollable := True;
      Animator1.Animate := True;
      oqThread.SetVariable('PFK_SMID', lbDs.Tag);
      oqThread.SetVariable('PDATE1', dDateBegin);
      oqThread.SetVariable('PDATE2', dDateEnd);
      oqThread.Execute;
    end;
end;

procedure TfrmMain.aResultExecute(Sender: TObject);
var ods : TOracleDataSet;
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
                    '        (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA, '+#13+
                    '        (SELECT MAX(FC_CHAR) FROM ASU.TIB '+#13+
                    '          WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                    '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL'' OR FC_SYNONIM = ''XRAY_FLU_NUMBER'')) AS NUMBER_ISSL '+#13+
                    '   FROM ASU.TNAZIS '+#13+
                    '  WHERE FK_ID = :PFK_ID ';
     ods.DeclareAndSet('PFK_ID', otInteger, TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFK_ID.Index]);
     ods.Open;
     sSotrFIO_4rep := ods.FieldByName('VRACHFIO').AsString;
     sTextIssl_4rep := ods.FieldByName('TEXTISSL').AsString;
     sNumIssl_4rep := ods.FieldByName('NUMBER_ISSL').AsString;
     sNumIB_4rep := ods.FieldByName('NUMIB').AsString;
     fDoza_4Rep := ods.FieldByName('DOZA').AsFloat;
     frxRepProtocol.FindObject('Memo9').Visible := ods.FieldByName('OWNER').AsInteger <> GET_XRAY_MRT;
   finally
     ods.Free;
   end;
  frxRepProtocol.ShowReport;
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
  aResult.Enabled := oqThread.RowCount <> 0;
  aPrint.Enabled := oqThread.RowCount <> 0;
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID, asu.DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, TRUNC(SYSDATE) AS DATESYS, '+#13+
                    '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                    '        ASU.GET_XRAY_MRT, '+#13+
                    '        (SELECT FC_NAME '+#13+
                    '           FROM ASU.TOTDEL '+#13+
                    '          WHERE FK_ID = (SELECT FK_OTDID FROM ASU.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, StrToInt(paramstr(1)));
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sVrachFIO := ods.FieldByName('VRACHFIO').AsString;
    dSysDate := ods.FieldByName('DATESYS').AsDateTime;
    sCompanyName := ods.FieldByName('COMPANYNAME').AsString;
    frmMain.Caption := 'Статистика по диагнозам('+Ver.FileVersion+'). Пользователь: '+sVrachFIO;
    GET_XRAY_MRT := ods.FieldByName('GET_XRAY_MRT').AsInteger;
    sOtdelName := ods.FieldByName('OTDELNAME').AsString;
  finally
    ods.Free;
    Ver.Free;
  end;
  aResult.Enabled := False;
  aPrint.Enabled := False;
  MedotradeSign := ReadMedotradeSign;
  TV.StoreToRegistry('\SoftWare\SoftMaster\Xray_ds\fMain\TVVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TV');
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\Xray_ds\fMain\TVVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TV');
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
  TV.StoreToRegistry('\SoftWare\SoftMaster\Xray_ds\fMain\TVVrach_' + IntToStr(pSOTRID), TRUE, [], 'TV');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
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
  if VarName = 'NAMEDS' then Value := lbDs.Caption;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.frxRepProtocolGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName;
  if VarName = 'OTDELNAME' then Value := sOtdelName;
  if VarName = 'PACFIO' then Value := TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFIOPAC.Index];
  if VarName = 'DATE_ROJD' then Value := TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFD_ROJD.Index];
  if VarName = 'NUMIB' then Value := sNumIB_4rep;
  if VarName = 'NAMEISSL' then Value := TV.DataController.Values[TV.DataController.FocusedRecordIndex, VISSLNAME.Index];
  if VarName = 'DOZA' then Value := fDoza_4Rep;
  if VarName = 'DATEISSL' then Value := TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFD_RUN_TIME.Index];
  if VarName = 'TEXTISSL' then Value := sTextIssl_4rep;
  if VarName = 'NUMISSL' then Value := sNumIssl_4rep;
  if VarName = 'SOTR' then Value := sSotrFIO_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\Xray_ds\fMain\TVVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TV');
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
  TV.BeginUpdate;
  TV.DataController.RecordCount := TV.DataController.RecordCount + 1;
  with TV.DataController do
  begin
    try
      Values[TV.DataController.RecordCount - 1, VFK_ID.Index] := Sender.Field('FK_ID');
      Values[TV.DataController.RecordCount - 1, VKAB.Index] := Sender.Field('KABINET');
      Values[TV.DataController.RecordCount - 1, VFD_RUN.Index] := Sender.Field('FD_RUN');
      Values[TV.DataController.RecordCount - 1, VFIOPAC.Index] := Sender.Field('FIOPAC');
      Values[TV.DataController.RecordCount - 1, VISSLNAME.Index] := Sender.Field('FC_NAME');
      Values[TV.DataController.RecordCount - 1, VFD_RUN_TIME.Index] := Sender.Field('FD_RUN_TIME');
      Values[TV.DataController.RecordCount - 1, VFD_ROJD.Index] := Sender.Field('FD_ROJD');
      Values[TV.DataController.RecordCount - 1, VDS.Index] := Sender.Field('DS');
      dxMemData1.Insert;
      dxMemData1.FieldByName('KABNAME').AsString := Sender.Field('KABINET');
      dxMemData1.FieldByName('FD_RUN').AsString := Sender.Field('FD_RUN_TIME');
      dxMemData1.FieldByName('FIOPAC').AsString := Sender.Field('FIOPAC');
      dxMemData1.FieldByName('ISSLNAME').AsString := Sender.Field('FC_NAME');
      dxMemData1.FieldByName('FD_RUN_TIME').AsString := Sender.Field('FD_RUN_TIME');
      dxMemData1.FieldByName('FD_ROJD').AsString := Sender.Field('FD_ROJD');
      dxMemData1.FieldByName('DS').AsString := Sender.Field('DS');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  TV.EndUpdate;
  cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel6.Refresh;
  cxLabel5.Caption := 'Выбрано ' + IntToStr(TV.DataController.RecordCount) + ' записей.';
  cxLabel5.Refresh;
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
  Ver.Free;
end;

end.
