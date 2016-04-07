unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SMMainApi, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxBar, ImgList, ActnList, OracleData, Oracle, dxmdaset, JclFileUtils, uGlobalConst,
  Menus, cxGridExportLink, frxClass, frxDBSet, cxCalendar;

type
  TfrmMain = class(TForm)
    al: TActionList;
    il: TImageList;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbRefresh: TdxBarButton;
    bbTub: TdxBarButton;
    bbClose: TdxBarButton;
    aClose: TAction;
    aRefresh: TAction;
    aTub: TAction;
    os: TOracleSession;
    cxGr: TcxGrid;
    tv: TcxGridTableView;
    vFIO: TcxGridColumn;
    cxGrLevel1: TcxGridLevel;
    vSex: TcxGridColumn;
    oqThread: TOracleQuery;
    dxMemData1: TdxMemData;
    dxMemData1FIO: TStringField;
    dxMemData1ROJD: TDateField;
    dxMemData1SEX: TStringField;
    vRojd: TcxGridColumn;
    aPrint: TAction;
    bbPrint: TdxBarButton;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    N2: TMenuItem;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    sdPopUp: TSaveDialog;
    vID: TcxGridColumn;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    vFD_NAZ: TcxGridColumn;
    vFD_RUN: TcxGridColumn;
    vDop: TcxGridColumn;
    vPlace: TcxGridColumn;
    dxMemData1FD_NAZ: TDateField;
    dxMemData1FD_RUN: TDateField;
    dxMemData1FC_REMARK: TStringField;
    dxMemData1NAMEPLACE: TStringField;
    bbBaza: TdxBarButton;
    aBase: TAction;
    vPlan: TcxGridColumn;
    dxMemData1PLANDATE: TStringField;
    procedure aCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure aRefreshExecute(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aTubExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxListGetValue(const VarName: string; var Value: Variant);
    procedure aBaseExecute(Sender: TObject);
  private
    pAPPSOTRID : Integer;
    sVrachFIO : string;
    get_sysdate_4rep : string;
    procedure CheckEnabledButtons;
    { Private declarations }
  public
    sCompanyName_4Rep : string;
    sOtdelName_4Rep : string;
    pSOTRID : Integer;
    get_systemdate : TDate;
    MedotradeSign : string;
    get_issl_flu : Integer;
    get_xray_mrt : Integer;
    bIsAdmin : Integer; // входит ли пользователь в группу "Администраторы" (1 - входит, 0 - нет)
    get_db_name : String;
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  get_nazcancel, get_neyav, get_vipnaz : Integer;
//  bbr : Boolean;

implementation
uses fTub, fAllHistory;
{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.aBaseExecute(Sender: TObject);
begin
   Application.CreateForm(TfrmAllHistory, frmAllHistory);
  try
    frmAllHistory.DoShowForm(tv.DataController.Values[tv.DataController.FocusedRecordIndex, vID.Index],
                             tv.DataController.Values[tv.DataController.FocusedRecordIndex, vFIO.Index]);
    frmAllHistory.ShowModal;
  finally
    frmAllHistory.Free;
  end;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as datesys from dual ';
    ods.Open;
    get_sysdate_4rep := ods.FieldByName('datesys').AsString;
  finally
    ods.Free;
  end;
  frxList.ShowReport;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  aRefresh.Enabled := False;
  aTub.Enabled := False;
  aPrint.Enabled := False;
  aBase.Enabled := False;
  if tv.DataController.LockCount = 0 then
    tv.BeginUpdate;
  tv.DataController.RecordCount := 0;
  while tv.DataController.LockCount > 0 do
    tv.EndUpdate;
  cxGr.Refresh;
  dxMemData1.Close;
  dxMemData1.Open;
  oqThread.Scrollable := True;
  oqThread.Execute;
end;

procedure TfrmMain.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aTubExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmTub, frmTub);
  try
    frmTub.DoShowFormTub(tv.DataController.Values[tv.DataController.FocusedRecordIndex, vID.Index],
                         tv.DataController.Values[tv.DataController.FocusedRecordIndex, vFIO.Index]);
    frmTub.ShowModal;
  finally
    frmTub.Free;
  end;
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
  aTub.Enabled := oqThread.RowCount <> 0;
  aBase.Enabled := oqThread.RowCount <> 0;
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  aPrint.Enabled := False;
  aTub.Enabled := False;
  aBase.Enabled := False;
  pAPPSOTRID := StrToInt(paramstr(1));
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select fk_sotrid, asu.do_vrachfio(fk_sotrid) as vrachfio, trunc(sysdate) as datesys, '+#13+
                    '        asu.pkg_smini.readstring(''CONFIG'', ''S_FULLNAME'', '''') as companyname, '+#13+
                    '        asu.get_vipnaz, asu.get_nazcancel, asu.get_labvip, asu.get_xray_mrt, asu.get_neyav, '+#13+
                    '        (select fc_name '+#13+
                    '           from asu.totdel '+#13+
                    '          where fk_id = (select fk_otdid from asu.tsotr where fk_id = tappsotr.fk_sotrid)) as otdelname, '+#13+
                    '        (select fk_id from asu.tsmid where fc_synonim = ''ISSLED_FLUROGR'') as get_issl_flu, '+#13+
                    '        asu.get_admins_for_xray(fk_sotrid) as is_admin, '+#13+
                    '        asu.pkg_smini.readstring(''CONFIG'', ''DB_NAME'', ''H'') as db_name '+#13+
                    '   from login.tappsotr where fl_del <> 1 and fk_id = :pfk_id ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sVrachFIO := ods.FieldByName('VRACHFIO').AsString;
    get_systemdate := ods.FieldByName('DATESYS').AsDateTime;
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
    frmMain.Caption := 'Журнал учета тубдиспансера('+Ver.FileVersion+'). Пользователь: '+sVrachFIO;
    sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
    get_issl_flu := ods.FieldByName('get_issl_flu').AsInteger;
    get_nazcancel := ods.FieldByName('get_nazcancel').AsInteger;
    get_neyav := ods.FieldByName('get_neyav').AsInteger;
    get_xray_mrt := ods.FieldByName('get_xray_mrt').AsInteger;
    get_vipnaz := ods.FieldByName('get_vipnaz').AsInteger;
    bIsAdmin := ods.FieldByName('is_admin').AsInteger;
    get_db_name := ods.FieldByName('db_name').AsString;
  finally
    ods.Free;
    Ver.Free;
  end;
  MedotradeSign := ReadMedotradeSign;
  tv.StoreToRegistry('\SoftWare\SoftMaster\RgPlus\fMain\tvSotr_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'tv');
  tv.RestoreFromRegistry('\SoftWare\SoftMaster\RgPlus\fMain\tvSotr_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'tv');
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
  tv.StoreToRegistry('\SoftWare\SoftMaster\RgPlus\fMain\tvSotr_' + IntToStr(pSOTRID), TRUE, [], 'tv');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
end;

procedure TfrmMain.frxListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'SYSDATE' then Value := GET_SYSDATE_4REP;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  tv.RestoreFromRegistry('\SoftWare\SoftMaster\RgPlus\fMain\tvSotr_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'tv');
end;

procedure TfrmMain.oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
  const ErrorMessage: string);
begin
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
//  bbr := True;
end;

procedure TfrmMain.oqThreadThreadFinished(Sender: TOracleQuery);
begin
//  Animator1.Animate := False;
//  if bbr then
//    cxLabel4.Caption := 'При выполнении запроса произошла ошибка!'
//  else
//    cxLabel4.Caption := 'Запрос к Базе Данных выполнился успешно!';

  aRefresh.Enabled := True;
  CheckEnabledButtons;
  cxGr.SetFocus;
  tv.Controller.GoToFirst;
end;

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  tv.BeginUpdate;
  tv.DataController.RecordCount := tv.DataController.RecordCount + 1;
  with tv.DataController do
  begin
    try
      Values[tv.DataController.RecordCount - 1, vFIO.Index] := Sender.Field('FIO');
      Values[tv.DataController.RecordCount - 1, vRojd.Index] := Sender.Field('ROJD');
      Values[tv.DataController.RecordCount - 1, vSex.Index] := Sender.Field('SEX');
      Values[tv.DataController.RecordCount - 1, vID.Index] := Sender.Field('FK_ID');
      Values[tv.DataController.RecordCount - 1, vFD_NAZ.Index] := Sender.Field('FD_NAZ');
      Values[tv.DataController.RecordCount - 1, vFD_RUN.Index] := Sender.Field('FD_RUN');
      Values[tv.DataController.RecordCount - 1, vDop.Index] := Sender.Field('FC_REMARK');
      Values[tv.DataController.RecordCount - 1, vPlace.Index] := Sender.Field('NAMEPLACE');
      Values[tv.DataController.RecordCount - 1, vPlan.Index] := Sender.Field('PLANDATE');
      dxMemData1.Insert;
      dxMemData1.FieldByName('FIO').AsString := Sender.Field('FIO');
      dxMemData1.FieldByName('ROJD').AsString := Sender.Field('ROJD');
      dxMemData1.FieldByName('SEX').AsString := Sender.Field('SEX');
      dxMemData1.FieldByName('FD_NAZ').AsDateTime := Sender.Field('FD_NAZ');
      dxMemData1.FieldByName('FD_RUN').AsDateTime := Sender.Field('FD_RUN');
      dxMemData1.FieldByName('FC_REMARK').AsString := Sender.Field('FC_REMARK');
      dxMemData1.FieldByName('NAMEPLACE').AsString := Sender.Field('NAMEPLACE');
      dxMemData1.FieldByName('PLANDATE').AsString := Sender.Field('PLANDATE');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  tv.EndUpdate;
end;

end.
