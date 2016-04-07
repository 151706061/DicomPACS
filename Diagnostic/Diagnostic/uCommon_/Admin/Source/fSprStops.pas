unit fSprStops;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, ActnList, dxBar,
  cxClasses, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, OracleData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxControls, cxGridCustomView, cxGrid, jvDbUtils, Oracle, Menus, cxGridExportLink,
  frxClass, frxDBSet, dxSkinCaramel, dxSkinOffice2007Green;

type
  TfrmSprStops = class(TForm)
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbAdd: TdxBarButton;
    bbEdit: TdxBarButton;
    bbDel: TdxBarButton;
    bbRefresh: TdxBarButton;
    bbPrint: TdxBarButton;
    bbClose: TdxBarButton;
    grList: TcxGrid;
    TVLIST: TcxGridDBTableView;
    VLIST_NAME: TcxGridDBColumn;
    VLIST_FNAME: TcxGridDBColumn;
    VLIST_PLAT: TcxGridDBColumn;
    VLIST_COMMENT: TcxGridDBColumn;
    grListLevel1: TcxGridLevel;
    dsList: TDataSource;
    odsList: TOracleDataSet;
    AL: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aPrint: TAction;
    aClose: TAction;
    aRefresh: TAction;
    aExcel: TAction;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    sdPopUp: TSaveDialog;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    VLIST_COST: TcxGridDBColumn;
    VLIST_RAION: TcxGridDBColumn;
    procedure aCloseExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure aExcelExecute(Sender: TObject);
    procedure odsListAfterOpen(DataSet: TDataSet);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSprStops: TfrmSprStops;

implementation
uses fMain, fAddEditStop;
{$R *.dfm}

procedure TfrmSprStops.aAddExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditStop, frmAddEditStop);
  try
    frmAddEditStop.Caption := ' Добавить новую стоянку ';
    frmAddEditStop.ShowModal;
    if frmAddEditStop.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into taxi.ts_places(fc_name, fc_name_full, fl_plat, fc_comment, fn_cost, fk_raionid) '+#13+
                         ' values(:pfc_name, :pfc_name_full, :pfl_plat, :pfc_comment, :pfn_cost, :pfk_raionid) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditStop.teName.Text);
          oq.DeclareAndSet('pfc_name_full', otString, frmAddEditStop.teFName.Text);
          if frmAddEditStop.cbPlat.Checked then
            oq.DeclareAndSet('pfl_plat', otInteger, 1)
          else
            oq.DeclareAndSet('pfl_plat', otInteger, 0);
          oq.DeclareAndSet('pfc_comment', otString, frmAddEditStop.memComment.Lines.Text);
          oq.DeclareAndSet('pfn_cost', otInteger, frmAddEditStop.cePrice.Value);
          oq.DeclareAndSet('pfk_raionid', otInteger, frmAddEditStop.lcbRaion.EditValue);
          oq.Declarevariable('pfk_id', otInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsList);
          odsList.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditStop.Free;
  end;
end;

procedure TfrmSprStops.aCloseExecute(Sender: TObject);
begin
  TVLIST.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprStopsGr', TRUE, [], 'TVLIST');
  close;
end;

procedure TfrmSprStops.aDelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы действительно хотите удалить выбранную стоянку?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update taxi.ts_places set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsList);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmSprStops.aEditExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditStop, frmAddEditStop);
  try
    frmAddEditStop.Caption := ' Изменить стоянку ';
    frmAddEditStop.teName.Text := odsList.FieldByName('fc_name').AsString;
    frmAddEditStop.teFName.Text := odsList.FieldByName('fc_name_full').AsString;
    frmAddEditStop.cePrice.Value := odsList.FieldByName('fn_cost').AsFloat;
    frmAddEditStop.memComment.Text := odsList.FieldByName('fc_comment').AsString;
    if odsList.FieldByName('fl_plat').AsInteger = 1 then
      frmAddEditStop.cbPlat.Checked := True
    else
      frmAddEditStop.cbPlat.Checked := False;
    frmAddEditStop.lcbRaion.EditValue := odsList.FieldByName('fk_raionid').AsInteger;
    frmAddEditStop.ShowModal;
    if frmAddEditStop.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update taxi.ts_places '+#13+
                         '    set fc_name = :pfc_name, '+#13+
                         '        fc_name_full = :pfc_name_full, '+#13+
                         '        fl_plat = :pfl_plat, '+#13+
                         '        fc_comment = :pfc_comment, '+#13+
                         '        fn_cost = :pfn_cost, '+#13+
                         '        fk_raionid = :pfk_raionid '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditStop.teName.Text);
          oq.DeclareAndSet('pfc_name_full', otString, frmAddEditStop.teFName.Text);
          if frmAddEditStop.cbPlat.Checked then
            oq.DeclareAndSet('pfl_plat', otInteger, 1)
          else
            oq.DeclareAndSet('pfl_plat', otInteger, 0);
          oq.DeclareAndSet('pfc_comment', otString, frmAddEditStop.memComment.Lines.Text);
          oq.DeclareAndSet('pfn_cost', otInteger, frmAddEditStop.cePrice.Value);
          oq.DeclareAndSet('pfk_raionid', otInteger, frmAddEditStop.lcbRaion.EditValue);
          oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsList);
          odsList.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditStop.Free;
  end;
end;

procedure TfrmSprStops.aExcelExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVLIST.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, TRUE);
end;

procedure TfrmSprStops.aPrintExecute(Sender: TObject);
var id : Integer;
begin
  id := odsList.FieldByName('fk_id').AsInteger;
  frxList.ShowReport;
  odsList.Locate('fk_id', id, []);
end;

procedure TfrmSprStops.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsList);
end;

procedure TfrmSprStops.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSprStops.FormCreate(Sender: TObject);
begin
  if odsList.Active = False then
    odsList.Active := True;
  TVLIST.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprStopsGr_Default', TRUE, [], 'TVLIST');
  TVLIST.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprStopsGr', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSprStops.FormDestroy(Sender: TObject);
begin
  frmSprStops := nil;
end;

procedure TfrmSprStops.N2Click(Sender: TObject);
begin
  TVLIST.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprStopsGr_Default', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSprStops.odsListAfterOpen(DataSet: TDataSet);
begin
  aEdit.Enabled := odsList.RecordCount <> 0;
  aDel.Enabled := odsList.RecordCount <> 0;
  aPrint.Enabled := odsList.RecordCount <> 0;
end;

end.
