unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, ActnList, dxBar, cxClasses, ImgList, OracleData, Oracle,
  cxGridLevel, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, jvDBUtils, Menus, cxGridExportLink,
  frxClass, frxDBSet, JclFileUtils, uGlobalConst, SMMainAPI,
  dxSkinOffice2007Green;

type
  TfrmMain = class(TForm)
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    TV: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    os: TOracleSession;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    actlstMain: TActionList;
    ilMain: TImageList;
    BMBar1: TdxBar;
    bbAdd: TdxBarButton;
    bbEdit: TdxBarButton;
    bbDel: TdxBarButton;
    bbRefresh: TdxBarButton;
    bbPrint: TdxBarButton;
    bbClose: TdxBarButton;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    actRefresh: TAction;
    actPrint: TAction;
    actClose: TAction;
    VNAME: TcxGridDBColumn;
    VRGGROUP: TcxGridDBColumn;
    VSNIMKI: TcxGridDBColumn;
    VTIME: TcxGridDBColumn;
    VDOZA: TcxGridDBColumn;
    VSYSGROUP: TcxGridDBColumn;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    N2: TMenuItem;
    actText: TAction;
    actWeb: TAction;
    actXML: TAction;
    actExcel: TAction;
    dlgSavePopUp: TSaveDialog;
    frxRepList: TfrxReport;
    frxDBList: TfrxDBDataset;
    VDATEADD: TcxGridDBColumn;
    bb1: TdxBarButton;
    actInsRep: TAction;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actTextExecute(Sender: TObject);
    procedure actWebExecute(Sender: TObject);
    procedure actXMLExecute(Sender: TObject);
    procedure actExcelExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure frxRepListGetValue(const VarName: string; var Value: Variant);
    procedure odsListAfterOpen(DataSet: TDataSet);
    procedure actInsRepExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    MedotradeSign : string;
    procedure CheckEnabledButtons;
    { Private declarations }
  public
    pAPPSOTRID : Integer;
    pSOTRID : Integer;
    sVrachFIO : String;
    sCompanyName4Rep : String;
    sDateSys4Rep : String;
    dSysDate : TDateTime;
    procedure DoShowfrmMain;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses fAddEditMetodic, fInsReport;

{$R *.dfm}

procedure TfrmMain.actAddExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditMetodic, frmAddEditMetodic);
  frmAddEditMetodic.ShowModal;
  if frmAddEditMetodic.ModalResult = mrOK then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' INSERT INTO TSMID(FC_NAME, FK_OWNER, FK_DEFAULT, FN_NORM1, FC_TIME, FN_NORM0, FC_TYPE, FL_SHOWANAL, FK_MZKOD)  '+
                       ' VALUES(:PFC_NAME, :PFK_OWNER, :PFK_DEFAULT, :PFN_NORM1, :PFC_TIME, :PFN_NORM0, ''582АИРМ_НОВАЯ_МЕТОДИКА'', 1, :PFK_MZKOD) '+
                       ' RETURNING FK_ID INTO :PFK_ID ';
        oq.DeclareAndSet('PFC_NAME', otString, frmAddEditMetodic.cxNameMetodic.Text); // Наименование
        oq.DeclareAndSet('PFK_OWNER', otInteger, frmAddEditMetodic.cxSystemGroup.EditValue); // Системная группа
        oq.DeclareAndSet('PFK_DEFAULT', otInteger, frmAddEditMetodic.cxRgGroup.EditValue); // Рентген-группа
        oq.DeclareAndSet('PFN_NORM1', otInteger, frmAddEditMetodic.cxSnimki.EditValue); // Снимки
        oq.DeclareAndSet('PFC_TIME', otString, IntToStr(frmAddEditMetodic.cxTime.EditValue)); // Время методики
        oq.DeclareAndSet('PFN_NORM0', otFloat, frmAddEditMetodic.cxDoza.EditValue); // Доза
        oq.DeclareAndSet('PFK_MZKOD', otString, DateTimeToStr(frmAddEditMetodic.cxdeDate.Date));
        oq.DeclareVariable('PFK_ID', otInteger);
        oq.Execute;
        os.Commit;
        RefreshQuery(odsList);
        odsList.Locate('FK_ID', oq.GetVariable('PFK_ID'), []);
      finally
        oq.Free;
      end;
    end;
  frmAddEditMetodic.Free;
end;

procedure TfrmMain.actCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.actDelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if Application.MessageBox('Вы действительно хотите удалить исследование?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' UPDATE TSMID SET FL_DEL = 1 WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        os.Commit;
        RefreshQuery(odsList);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmMain.actEditExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditMetodic, frmAddEditMetodic);
  frmAddEditMetodic.cxNameMetodic.Text := odsList.FieldByName('FC_NAME').AsString;
  frmAddEditMetodic.cxSystemGroup.EditValue := odsList.FieldByName('FK_OWNER').AsInteger;
  frmAddEditMetodic.cxRgGroup.EditValue := odsList.FieldByName('FK_DEFAULT').AsInteger;
  frmAddEditMetodic.cxSnimki.EditValue := odsList.FieldByName('FN_NORM1').AsInteger;
  frmAddEditMetodic.cxTime.EditValue := StrToInt(odsList.FieldByName('FC_TIME').AsString);
  frmAddEditMetodic.cxDoza.EditValue := odsList.FieldByName('FN_NORM0').AsFloat;
  frmAddEditMetodic.cxdeDate.Date := StrToDateTime(odsList.FieldByName('DATEADD').AsString);
  frmAddEditMetodic.ShowModal;
  if frmAddEditMetodic.ModalResult = mrOK then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' UPDATE TSMID '+
                       '    SET FC_NAME=:PFC_NAME, '+
                       '        FK_OWNER=:PFK_OWNER, '+
                       '        FK_DEFAULT=:PFK_DEFAULT, '+
                       '        FN_NORM1=:PFN_NORM1, '+
                       '        FC_TIME=:PFC_TIME,   '+
                       '        FN_NORM0=:PFN_NORM0, '+
                       '        FK_MZKOD=:PFK_MZKOD '+
                       ' WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFC_NAME', otString, frmAddEditMetodic.cxNameMetodic.Text);
        oq.DeclareAndSet('PFK_OWNER', otInteger, frmAddEditMetodic.cxSystemGroup.EditValue);
        oq.DeclareAndSet('PFK_DEFAULT', otInteger, frmAddEditMetodic.cxRgGroup.EditValue);
        oq.DeclareAndSet('PFN_NORM1', otInteger, frmAddEditMetodic.cxSnimki.EditValue);
        oq.DeclareAndSet('PFC_TIME', otInteger, frmAddEditMetodic.cxTime.EditValue);
        oq.DeclareAndSet('PFN_NORM0', otFloat, frmAddEditMetodic.cxDoza.EditValue);
        oq.DeclareAndSet('PFK_MZKOD', otString, DateTimeToStr(frmAddEditMetodic.cxdeDate.Date));
        oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        os.Commit;
        RefreshQuery(odsList);
      finally
        oq.Free;
      end;
    end;
  frmAddEditMetodic.Free;
end;

procedure TfrmMain.actExcelExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'xls';
  dlgSavePopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if dlgSavePopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(dlgSavePopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(dlgSavePopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.actInsRepExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmInsReport, frmInsReport);
  frmInsReport.DoShowInsReport(odsList.FieldByName('FK_ID').AsInteger);
  frmInsReport.ShowModal;
  frmInsReport.Free;
end;

procedure TfrmMain.actPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  id := odsList.FieldByName('FK_ID').AsInteger;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                    '        TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS '+#13+
                    '   FROM DUAL ';
    ods.Open;
    sCompanyName4Rep := ods.FieldByName('COMPANYNAME').AsString;
    sDateSys4Rep := ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
  end;
  frxRepList.ShowReport;
  odsList.Locate('FK_ID', id, []);
end;

procedure TfrmMain.actRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsList);
end;

procedure TfrmMain.actTextExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'txt';
  dlgSavePopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if dlgSavePopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(dlgSavePopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(dlgSavePopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.actWebExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'html';
  dlgSavePopUp.Filter := 'Web-страницы (*.html)|*.html';
  if dlgSavePopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(dlgSavePopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(dlgSavePopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.actXMLExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'xml';
  dlgSavePopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if dlgSavePopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(dlgSavePopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(dlgSavePopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.CheckEnabledButtons;
begin
  actEdit.Enabled := odsList.RecordCount <> 0;
  actDel.Enabled := odsList.RecordCount <> 0;
  actPrint.Enabled := odsList.RecordCount <> 0;
//  actInsRep.Enabled := odsList.RecordCount <> 0; //!!! времено убрано
end;

procedure TfrmMain.DoShowfrmMain;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  pAPPSOTRID := StrToInt(paramstr(1));
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID, ASU.DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, TRUNC(SYSDATE) AS DATESYS '+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sVrachFIO := ods.FieldByName('VRACHFIO').AsString;
    dSysDate := ods.FieldByName('DATESYS').AsDateTime;
  finally
    ods.Free;
  end;
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  frmMain.Caption := 'НОВЫЕ МЕТОДИКИ('+Ver.FileVersion+'). Пользователь: '+sVrachFIO;
  Ver.Free;
  if odsList.Active = False then
    odsList.Open;
  MedotradeSign := ReadMedotradeSign;
  TV.StoreToRegistry('\SoftWare\SoftMaster\New_metodics\TV'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TV');
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\New_metodics\TV'+'Vrach'+ '_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TV');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из программы ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TV.StoreToRegistry('\SoftWare\SoftMaster\New_metodics\TV'+'Vrach'+ '_' + IntToStr(pSOTRID), TRUE, [], 'TV');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
end;

procedure TfrmMain.frxRepListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName4Rep;
  if VarName = 'SOTRNAME' then Value := sVrachFIO;
  if VarName = 'SYSDATE' then Value := sDateSys4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;  
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\New_metodics\TV'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TV');
end;

procedure TfrmMain.odsListAfterOpen(DataSet: TDataSet);
begin
  CheckEnabledButtons;
end;

end.

