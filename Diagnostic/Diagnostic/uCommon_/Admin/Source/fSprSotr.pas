unit fSprSotr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, dxBar, cxClasses,
  ImgList, ActnList, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Oracle, OracleData, jvDBUtils, cxTextEdit,
  frxClass, frxDBSet, StrUtils, uMD5, Menus, cxGridExportLink, dxSkinCaramel,
  dxSkinOffice2007Green;

type
  TfrmSprSotr = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbAdd: TdxBarButton;
    bbEdit: TdxBarButton;
    bbClose: TdxBarButton;
    AL: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aPrint: TAction;
    aClose: TAction;
    bbDel: TdxBarButton;
    bbPrint: TdxBarButton;
    TVSOTR: TcxGridDBTableView;
    grSotrLevel1: TcxGridLevel;
    grSotr: TcxGrid;
    dsSotr: TDataSource;
    odsSotr: TOracleDataSet;
    VSOTR_FAM: TcxGridDBColumn;
    VSOTR_NAME: TcxGridDBColumn;
    VSOTR_OTCH: TcxGridDBColumn;
    VSOTR_LOGIN: TcxGridDBColumn;
    bbRefresh: TdxBarButton;
    aRefresh: TAction;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    sdPopUp: TSaveDialog;
    aExcel: TAction;
    N3: TMenuItem;
    procedure aCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure aExcelExecute(Sender: TObject);
    procedure odsSotrAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSprSotr: TfrmSprSotr;

implementation
uses fMain, fAddEditSotr;
{$R *.dfm}

procedure TfrmSprSotr.aAddExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditSotr, frmAddEditSotr);
  try
    frmAddEditSotr.Caption := 'Добавление нового пользователя';
    frmAddEditSotr.ShowModal;
    if frmAddEditSotr.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into taxi.ts_sotr(fc_fam, fc_name, fc_otch, fc_login, fc_pass) '+#13+
                         ' values(:pfc_fam, :pfc_name, :pfc_otch, :pfc_login, :pfc_pass) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_fam', otString, frmAddEditSotr.teFam.Text);
          oq.DeclareAndSet('pfc_name', otString, frmAddEditSotr.teName.Text);
          oq.DeclareAndSet('pfc_otch', otString, frmAddEditSotr.teOtch.Text);
          oq.DeclareAndSet('pfc_login', otString, frmAddEditSotr.teLogin.Text);
          oq.DeclareAndSet('pfc_pass', otString, LeftStr(uMD5.MD5DigestToStr(MD5String(frmAddEditSotr.tePass.Text)),20)); 
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsSotr);
          odsSotr.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditSotr.Free;
  end;
end;

procedure TfrmSprSotr.aCloseExecute(Sender: TObject);
begin
  TVSOTR.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprSotrGr', TRUE, [], 'TVSOTR');
  close;
end;

procedure TfrmSprSotr.aDelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы действительно хотите удалить пользователя?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update taxi.ts_sotr set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsSotr.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsSotr);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmSprSotr.aEditExecute(Sender: TObject);
var oq : ToracleQuery;
begin
  Application.CreateForm(TfrmAddEditSotr, frmAddEditSotr);
  try
    frmAddEditSotr.Caption := 'Изменение данных пользователя';
    frmAddEditSotr.teFam.Text := odsSotr.FieldByName('fc_fam').AsString;
    frmAddEditSotr.teName.Text := odsSotr.FieldByName('fc_name').AsString;
    frmAddEditSotr.teOtch.Text := odsSotr.FieldByName('fc_otch').AsString;
    frmAddEditSotr.teLogin.Text := odsSotr.FieldByName('fc_login').AsString;
    frmAddEditSotr.tePass.Text := odsSotr.FieldByName('fc_pass').AsString;
    frmAddEditSotr.teConfirm.Text := odsSotr.FieldByName('fc_pass').AsString;
    frmAddEditSotr.ShowModal;
    if frmAddEditSotr.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update taxi.ts_sotr '+#13+
                         '    set fc_fam = :pfc_fam, fc_name = :pfc_name, fc_otch = :pfc_otch, '+#13+
                         '        fc_login = :pfc_login, fc_pass = :pfc_pass '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_fam', otString, frmAddEditSotr.teFam.Text);
          oq.DeclareAndSet('pfc_name', otString, frmAddEditSotr.teName.Text);
          oq.DeclareAndSet('pfc_otch', otString, frmAddEditSotr.teOtch.Text);
          oq.DeclareAndSet('pfc_login', otString, frmAddEditSotr.teLogin.Text);
          oq.DeclareAndSet('pfc_pass', otString, LeftStr(uMD5.MD5DigestToStr(MD5String(frmAddEditSotr.tePass.Text)),20));
          oq.DeclareAndSet('pfk_id', otInteger, odsSotr.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsSotr);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditSotr.Free;
  end;
end;

procedure TfrmSprSotr.aExcelExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVSOTR.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, grSotr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, grSotr, TRUE, TRUE);
end;

procedure TfrmSprSotr.aPrintExecute(Sender: TObject);
var id : Integer;
begin
  id := odsSotr.FieldByName('fk_id').AsInteger;
  frxList.ShowReport;
  odsSotr.Locate('fk_id', id, []);
end;

procedure TfrmSprSotr.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsSotr);
end;

procedure TfrmSprSotr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSprSotr.FormCreate(Sender: TObject);
begin
  if odsSotr.Active = False then
    odsSotr.Active := True;
  TVSOTR.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprSotrGr_Default', TRUE, [], 'TVSOTR');
  TVSOTR.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprSotrGr', FALSE, FALSE, [], 'TVSOTR');
end;

procedure TfrmSprSotr.FormDestroy(Sender: TObject);
begin
  frmSprSotr := nil;
end;

procedure TfrmSprSotr.N2Click(Sender: TObject);
begin
  TVSOTR.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprSotrGr_Default', FALSE, FALSE, [], 'TVSOTR');
end;

procedure TfrmSprSotr.odsSotrAfterOpen(DataSet: TDataSet);
begin
  aEdit.Enabled := odsSotr.RecordCount <> 0;
  aDel.Enabled := odsSotr.RecordCount <> 0;
  aPrint.Enabled := odsSotr.RecordCount <> 0;
end;

end.
