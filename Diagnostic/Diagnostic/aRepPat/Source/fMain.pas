// !!! aPrint убрать если не понадобится
unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxSplitter, dxBar, DB, dxmdaset, Oracle,
  frxClass, frxDBSet, ActnList, ImgList, Menus, cxGridExportLink, jclFileUtils, SMMainAPI,
  OracleData, uGlobalConst, JvExControls, JvAnimatedImage, JvGIFCtrl,
  cxContainer, cxLabel, ExtCtrls, dxSkinsCore, dxSkinOffice2007Green,
  dxSkinscxPCPainter, dxSkinsdxBarPainter;

type
  TfrmMain = class(TForm)
    frxRepProtocol: TfrxReport;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    N2: TMenuItem;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbClose: TdxBarButton;
    bbParam: TdxBarButton;
    bbPrint: TdxBarButton;
    bbRefresh: TdxBarButton;
    ilMain: TImageList;
    sdPopUp: TSaveDialog;
    alMain: TActionList;
    aClose: TAction;
    aParam: TAction;
    aPrint: TAction;
    aRefresh: TAction;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    acEnable: TAction;
    frxRepPrint: TfrxReport;
    frxDBPrint: TfrxDBDataset;
    os: TOracleSession;
    oqThread: TOracleQuery;
    dxMemData1: TdxMemData;
    dxBarDockControl1: TdxBarDockControl;
    cxSplitter1: TcxSplitter;
    cxGr: TcxGrid;
    tvList: TcxGridTableView;
    cxGrLevel1: TcxGridLevel;
    tvList_Pacfio: TcxGridColumn;
    tvList_DateRojd: TcxGridColumn;
    tvList_Adres: TcxGridColumn;
    tvList_DsNapr: TcxGridColumn;
    tvList_Napr: TcxGridColumn;
    tvList_Usluga: TcxGridColumn;
    tvList_Pat: TcxGridColumn;
    tvList_Sotr: TcxGridColumn;
    tvList_DsZakl: TcxGridColumn;
    dxMemData1pacfio: TStringField;
    dxMemData1fd_rojd: TDateField;
    dxMemData1adres: TStringField;
    dxMemData1ds_napr: TStringField;
    dxMemData1napr_uch: TStringField;
    dxMemData1fc_name: TStringField;
    dxMemData1fc_char: TStringField;
    dxMemData1sotrfio: TStringField;
    dxMemData1ds_zakl: TStringField;
    paParam: TPanel;
    Splitter1: TSplitter;
    paMainParam: TPanel;
    lbOtdelCap: TcxLabel;
    cxLabel2: TcxLabel;
    lbOtdel: TcxLabel;
    lbDateBeg: TcxLabel;
    cxLabel3: TcxLabel;
    lbDateEnd: TcxLabel;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel6: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel4: TcxLabel;
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure FormCreate(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aParamExecute(Sender: TObject);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure aRefreshExecute(Sender: TObject);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure N2Click(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure acEnableExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
  private
    idOtdel : Integer;
    pAPPSOTRID : Integer;
    sVrachFIO, sCompanyName, sOtdelName, MedotradeSign : String;
    dSysDate : TDate;
    dDateBegin, dDateEnd : TDateTime;
    sDateSys_4Rep : String;
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
  for i := 0 to tvList.DataController.LockCount - 1 do
    tvList.EndUpdate;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aParamExecute(Sender: TObject);
var sSQL : string;
procedure MyDeleteVariable(AName:string);
  begin
    with oqThread do
    begin
      if (VariableIndex(AName)>=0) then
      begin
        DeleteVariable(AName);
      end;
    end;
  end;
begin
  Application.CreateForm(TfrmSetParam, frmSetParam);
  try
  if idOtdel <> -1 then
    begin
      frmSetParam.beOtdel.Tag := idOtdel;
      frmSetParam.beOtdel.Text := lbOtdel.Caption;
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
      aPrint.Enabled := False;

      cxLabel6.Caption := '';
      cxLabel5.Caption := '';
      cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';

      if tvList.DataController.LockCount = 0 then
        tvList.BeginUpdate;
      tvList.DataController.RecordCount := 0;
      while tvList.DataController.LockCount > 0 do
        tvList.EndUpdate;
      cxGr.Refresh;
      dxMemData1.Close;
      dxMemData1.Open;
      idOtdel := frmSetParam.beOtdel.Tag;
      dDateBegin := frmSetParam.cxDateBeg.Date;
      dDateEnd := StrToDateTime(FormatDateTime('dd.mm.yyyy', frmSetParam.cxDateEnd.Date)+' 23:59:59');
      lbOtdel.Caption := frmSetParam.beOtdel.Text;
      lbOtdelCap.Visible := idOtdel <> -1;
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
      oqThread.ClearVariables;
      if idOtdel <> -1 then
        begin
          sSQL := ' and t3.fk_otdelid = :pOtdelID ';
          oqThread.SetVariable('potdel', sSQL);
          oqThread.DeclareAndSet('pOtdelID', otInteger, idOtdel);
        end else
        begin
          MyDeleteVariable('pOtdelID');
        end;
      oqThread.SetVariable('pdate1', dDateBegin);
      oqThread.SetVariable('pdate2', dDateEnd);
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
var sSQL : string;
procedure MyDeleteVariable(AName:string);
  begin
    with oqThread do
    begin
      if (VariableIndex(AName)>=0) then
      begin
        DeleteVariable(AName);
      end;
    end;
  end;
begin
  aRefresh.Enabled := False;
  aParam.Enabled := False;
  aPrint.Enabled := False;

  cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';
  if tvList.DataController.LockCount = 0 then
    tvList.BeginUpdate;
  tvList.DataController.RecordCount := 0;
  while tvList.DataController.LockCount > 0 do
    tvList.EndUpdate;
  cxGr.Refresh;
  dxMemData1.Close;
  dxMemData1.Open;
  StartTime:= Now;
  oqThread.Scrollable := True;
  Animator1.Animate := True;
  oqThread.ClearVariables;
  if idOtdel <> -1 then
    begin
      sSQL := ' and t3.fk_otdelid = :pOtdelID ';
      oqThread.SetVariable('potdel', sSQL);
      oqThread.DeclareAndSet('pOtdelID', otInteger, idOtdel);
    end else
    begin
      MyDeleteVariable('pOtdelID');
    end;
  oqThread.SetVariable('pdate1', dDateBegin);
  oqThread.SetVariable('pdate2', dDateEnd);
  oqThread.Execute;
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
  aPrint.Enabled := oqThread.RowCount <> 0;
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
    ods.SQL.Text := ' select fk_sotrid, do_vrachfio(fk_sotrid) as vrachfio, trunc(sysdate) as datesys, '+#13+
                    '        asu.pkg_smini.readstring (''CONFIG'', ''S_FULLNAME'', '''') as companyname, '+#13+
                    '        asu.get_vipnaz, asu.get_nazcancel, asu.get_labvip, asu.get_xray_mrt, '+#13+
                    '        (select fc_name '+#13+
                    '           from asu.totdel '+#13+
                    '          where fk_id = (select fk_otdid from asu.tsotr where fk_id = tappsotr.fk_sotrid)) as otdelname '+#13+
                    '   from login.tappsotr where fl_del <> 1 and fk_id = :pfk_id ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sVrachFIO := ods.FieldByName('VRACHFIO').AsString;
    dSysDate := ods.FieldByName('DATESYS').AsDateTime;
    sCompanyName := ods.FieldByName('COMPANYNAME').AsString;
    frmMain.Caption := 'Отчет по патологиям('+Ver.FileVersion+'). Пользователь: '+sVrachFIO;
    sOtdelName := ods.FieldByName('OTDELNAME').AsString;
  finally
    ods.Free;
    Ver.Free;
  end;
  aPrint.Enabled := False;
  MedotradeSign := ReadMedotradeSign;
  tvList.StoreToRegistry('\SoftWare\SoftMaster\aRepPat\fMain\tvListSotr_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'tvList');
  tvList.RestoreFromRegistry('\SoftWare\SoftMaster\aRepPat\fMain\tvListSotr_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'tvList');
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
  tvList.StoreToRegistry('\SoftWare\SoftMaster\aRepPat\fMain\tvListSotr_' + IntToStr(pSOTRID), TRUE, [], 'tvList');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
  idOtdel := -1;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  tvList.RestoreFromRegistry('\SoftWare\SoftMaster\aRepPat\fMain\tvListSotr_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'tvList');
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

  aPrint.Enabled := True;
  aRefresh.Enabled := True;
  aParam.Enabled := True;

  CheckEnabledButtons;
end;

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  tvList.BeginUpdate;
  tvList.DataController.RecordCount := tvList.DataController.RecordCount + 1;
  with tvList.DataController do
  begin
    try
      Values[tvList.DataController.RecordCount - 1, tvList_Pacfio.Index] := Sender.Field('pacfio');
      Values[tvList.DataController.RecordCount - 1, tvList_DateRojd.Index] := Sender.Field('fd_rojd');
      Values[tvList.DataController.RecordCount - 1, tvList_Adres.Index] := Sender.Field('adres');
      Values[tvList.DataController.RecordCount - 1, tvList_DsNapr.Index] := Sender.Field('ds_napr');
      Values[tvList.DataController.RecordCount - 1, tvList_Napr.Index] := Sender.Field('napr_uch');
      Values[tvList.DataController.RecordCount - 1, tvList_Usluga.Index] := Sender.Field('fc_name');
      Values[tvList.DataController.RecordCount - 1, tvList_Pat.Index] := Sender.Field('fc_char');
      Values[tvList.DataController.RecordCount - 1, tvList_Sotr.Index] := Sender.Field('sotrfio');
      Values[tvList.DataController.RecordCount - 1, tvList_DsZakl.Index] := Sender.Field('ds_zakl');
      dxMemData1.Insert;
      dxMemData1.FieldByName('pacfio').AsString := Sender.Field('pacfio');
      dxMemData1.FieldByName('fd_rojd').AsDateTime := Sender.Field('fd_rojd');
      dxMemData1.FieldByName('adres').AsString := Sender.Field('adres');
      dxMemData1.FieldByName('ds_napr').AsString := Sender.Field('ds_napr');
      dxMemData1.FieldByName('napr_uch').AsString := Sender.Field('napr_uch');
      dxMemData1.FieldByName('fc_name').AsString := Sender.Field('fc_name');
      dxMemData1.FieldByName('fc_char').AsString := Sender.Field('fc_char');
      dxMemData1.FieldByName('sotrfio').AsString := Sender.Field('sotrfio');
      dxMemData1.FieldByName('ds_zakl').AsString := Sender.Field('ds_zakl');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  tvList.EndUpdate;
  cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel6.Refresh;
  cxLabel5.Caption := 'Выбрано ' + IntToStr(tvList.DataController.RecordCount) + ' записей.';
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

end.
