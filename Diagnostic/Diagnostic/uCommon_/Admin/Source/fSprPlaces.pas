unit fSprPlaces;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxSkinsCore, dxSkinsdxBarPainter, cxClasses,
  ActnList, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, Oracle, OracleData, jvDBUtils, Menus, frxClass,
  frxDBSet, cxGridExportLink, dxSkinCaramel, dxSkinOffice2007Green;

type
  TfrmSprPlaces = class(TForm)
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbAdd: TdxBarButton;
    bbPrint: TdxBarButton;
    bbClose: TdxBarButton;
    AL: TActionList;
    aEdit: TAction;
    aPrint: TAction;
    aClose: TAction;
    aRefresh: TAction;
    grList: TcxGrid;
    TVLIST: TcxGridDBTableView;
    VLIST_NAME: TcxGridDBColumn;
    grListLevel1: TcxGridLevel;
    aAdd: TAction;
    aDel: TAction;
    bbEdit: TdxBarButton;
    bbDel: TdxBarButton;
    bbRefresh: TdxBarButton;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    sdPopUp: TSaveDialog;
    aXLS: TAction;
    VLIST_RAIONNAME: TcxGridDBColumn;
    VLIST_ADR: TcxGridDBColumn;
    VLISTCOSTCAR: TcxGridDBColumn;
    VLISTCOSTMIN: TcxGridDBColumn;
    procedure aCloseExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure odsListAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSprPlaces: TfrmSprPlaces;

implementation
uses fMain, fAddEditPlace;
{$R *.dfm}

procedure TfrmSprPlaces.aAddExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditPlace, frmAddEditPlace);
  try
    frmAddEditPlace.Caption := 'Добавить новое место города (организацию)';
    frmAddEditPlace.ShowModal;
    if frmAddEditPlace.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into taxi.ts_org(fc_name, fk_raionid, fc_adr, fn_cost_car, fn_cost_min) '+#13+
                         ' values(:pfc_name, :pfk_raionid, :pfc_adr, :pfn_cost_car, :pfn_cost_min) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditPlace.teName.Text);
          oq.DeclareAndSet('pfk_raionid', otInteger, frmAddEditPlace.lcbRaion.EditValue);
          oq.DeclareAndSet('pfc_adr', otString, frmAddEditPlace.teAdr.Text);
          oq.DeclareAndSet('pfn_cost_min', otFloat, frmAddEditPlace.ceCar.Value);
          oq.DeclareAndSet('pfn_cost_car', otFloat, frmAddEditPlace.ceMin.Value);
          oq.DeclareAndSet('pfc_adr', otString, frmAddEditPlace.teAdr.Text);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsList);
          odsList.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditPlace.Free;
  end;
end;

procedure TfrmSprPlaces.aCloseExecute(Sender: TObject);
begin
  TVLIST.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprPlacesGr', TRUE, [], 'TVLIST');
  FreeAndNil(frmSprPlaces);
end;

procedure TfrmSprPlaces.aDelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы действительно хотите удалить эту запись?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update taxi.ts_org set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsList);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmSprPlaces.aEditExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditPlace, frmAddEditPlace);
  try
    frmAddEditPlace.Caption := 'Изменить место города (организацию)';
    frmAddEditPlace.teName.Text := odsList.FieldByName('fc_name').AsString;
    frmAddEditPlace.lcbRaion.EditValue := odsList.FieldByName('fk_raionid').AsInteger;
    frmAddEditPlace.teAdr.Text := odsList.FieldByName('fc_adr').AsString;
    frmAddEditPlace.ceCar.Value := odsList.FieldByName('fn_cost_car').AsFloat;
    frmAddEditPlace.ceMin.Value := odsList.FieldByName('fn_cost_min').AsFloat;
    frmAddEditPlace.ShowModal;
    if frmAddEditPlace.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update taxi.ts_org '+#13+
                         '    set fc_name = :pfc_name, fk_raionid = :pfk_raionid, fc_adr = :pfc_adr, '+#13+
                         '        fn_cost_car = :pfn_cost_car, fn_cost_min = :pfn_cost_min '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditPlace.teName.Text);
          oq.DeclareAndSet('pfk_raionid', otInteger, frmAddEditPlace.lcbRaion.EditValue);
          oq.DeclareAndSet('pfc_adr', otString, frmAddEditPlace.teAdr.Text);
          oq.DeclareAndSet('pfn_cost_car', otFloat, frmAddEditPlace.ceCar.Value);
          oq.DeclareAndSet('pfn_cost_min', otFloat, frmAddEditPlace.ceMin.Value);
          oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsList);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditPlace.Free;
  end;
end;

procedure TfrmSprPlaces.aPrintExecute(Sender: TObject);
var id : Integer;
begin
  id := odsList.FieldByName('fk_id').AsInteger;
  frxList.ShowReport;
  odsList.Locate('fk_id', id, []);  
end;

procedure TfrmSprPlaces.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsList);
end;

procedure TfrmSprPlaces.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVLIST.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, TRUE);
end;

procedure TfrmSprPlaces.FormCreate(Sender: TObject);
begin
  if odsList.Active = False then
    odsList.Active := True;
  TVLIST.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprPlacesGr_Default', TRUE, [], 'TVLIST');
  TVLIST.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprPlacesGr', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSprPlaces.N2Click(Sender: TObject);
begin
  TVLIST.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprPlacesGr_Default', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSprPlaces.odsListAfterOpen(DataSet: TDataSet);
begin
  aEdit.Enabled := odsList.RecordCount <> 0;
  aDel.Enabled := odsList.RecordCount <> 0;
  aPrint.Enabled := odsList.RecordCount <> 0;
end;

end.
