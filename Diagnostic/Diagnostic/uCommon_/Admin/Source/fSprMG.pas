unit fSprMG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, dxBar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, Menus, frxClass, frxDBSet, ActnList, OracleData, Oracle, jvDbUtils, cxGridExportLink,
  dxSkinCaramel, dxSkinOffice2007Green;

type
  TfrmSprMG = class(TForm)
    dsList: TDataSource;
    odsList: TOracleDataSet;
    AL: TActionList;
    aEdit: TAction;
    aPrint: TAction;
    aClose: TAction;
    aRefresh: TAction;
    aAdd: TAction;
    aDel: TAction;
    aXLS: TAction;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbAdd: TdxBarButton;
    bbPrint: TdxBarButton;
    bbClose: TdxBarButton;
    bbEdit: TdxBarButton;
    bbDel: TdxBarButton;
    bbRefresh: TdxBarButton;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    sdPopUp: TSaveDialog;
    grList: TcxGrid;
    TVLIST: TcxGridDBTableView;
    VLIST_NAME: TcxGridDBColumn;
    VLIST_KM: TcxGridDBColumn;
    VLIST_REMARK: TcxGridDBColumn;
    grListLevel1: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    VLIST_RAION: TcxGridDBColumn;
    procedure aDelExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure odsListAfterOpen(DataSet: TDataSet);
    procedure aEditExecute(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSprMG: TfrmSprMG;

implementation
uses fMain, fAddEditMG;
{$R *.dfm}

procedure TfrmSprMG.aAddExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditMG, frmAddEditMG);
  try
    frmAddEditMG.Caption := 'Добавить новый пункт межгорода ';
    frmAddEditMG.ShowModal;
    if frmAddEditMG.ModalResult = mrOK then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into taxi.ts_mg(fc_name, fn_km, fc_remark, fk_raionid) '+#13+
                         ' values(:pfc_name, :pfn_km, :pfc_remark, :pfk_raionid) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareVariable('pfk_id', otInteger);
          oq.DeclareAndSet('pfc_name', otString, frmAddEditMG.teName.Text);
          oq.DeclareAndSet('pfn_km', otInteger, frmAddEditMG.seKm.Value);
          oq.DeclareAndSet('pfc_remark', otString, frmAddEditMG.memComment.Text);
          oq.DeclareAndSet('pfk_raionid', otInteger, frmAddEditMG.lcbRaion.EditValue);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsList);
          odsList.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditMG.Free;
  end;
end;

procedure TfrmSprMG.aCloseExecute(Sender: TObject);
begin
  TVLIST.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprMGGr', TRUE, [], 'TVLIST');
  FreeAndNil(frmSprMG);
end;

procedure TfrmSprMG.aDelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы действительно хотите удалить эту запись?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update taxi.ts_mg set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsList);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmSprMG.aEditExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditMG, frmAddEditMG);
  try
    frmAddEditMG.Caption := 'Изменить пункт межгорода ';
    frmAddEditMG.teName.Text := odsList.FieldByName('fc_name').AsString;
    frmAddEditMG.seKm.Value := odsList.FieldByName('fn_km').AsInteger;
    frmAddEditMG.memComment.Text := odsList.FieldByName('fc_remark').AsString;
    frmAddEditMG.lcbRaion.EditValue := odsList.FieldByName('fk_raionid').AsInteger;
    frmAddEditMG.ShowModal;
    if frmAddEditMG.ModalResult = mrOK then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update taxi.ts_mg '+#13+
                         '    set fc_name = :pfc_name, fn_km = :pfn_km, fc_remark = :pfc_remark, fk_raionid = :pfk_raionid '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
          oq.DeclareAndSet('pfc_name', otString, frmAddEditMG.teName.Text);
          oq.DeclareAndSet('pfn_km', otInteger, frmAddEditMG.seKm.Value);
          oq.DeclareAndSet('pfc_remark', otString, frmAddEditMG.memComment.Text);
          oq.DeclareAndSet('pfk_raionid', otInteger, frmAddEditMG.lcbRaion.EditValue);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsList);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditMG.Free;
  end;
end;

procedure TfrmSprMG.aPrintExecute(Sender: TObject);
var id : Integer;
begin
  id := odsList.FieldByName('fk_id').AsInteger;
  frxList.ShowReport;
  odsList.Locate('fk_id', id, []);
end;

procedure TfrmSprMG.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsList);
end;

procedure TfrmSprMG.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVLIST.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, TRUE);
end;

procedure TfrmSprMG.FormCreate(Sender: TObject);
begin
  if odsList.Active = False then
    odsList.Active := True;
  TVLIST.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprMGGr_Default', TRUE, [], 'TVLIST');
  TVLIST.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprMGGr', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSprMG.N2Click(Sender: TObject);
begin
  TVLIST.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprMGGr_Default', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSprMG.odsListAfterOpen(DataSet: TDataSet);
begin
  aEdit.Enabled := odsList.RecordCount <> 0;
  aDel.Enabled := odsList.RecordCount <> 0;
  aPrint.Enabled := odsList.RecordCount <> 0;
end;

end.
