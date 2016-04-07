unit fSprTarif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, cxSplitter, dxSkinsdxBarPainter, dxBar,
  OracleData, ActnList, jvDBUtils, Oracle, Menus, frxClass, frxDBSet,
  cxGridExportLink, cxTimeEdit, DateUtils, cxLabel, dxSkinCaramel,
  dxSkinOffice2007Green;

type
  TfrmSprTarif = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    grTaxi: TcxGrid;
    TVTAXI: TcxGridDBTableView;
    grTaxiLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    Panel3: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    BMBar2: TdxBar;
    dxBarDockControl2: TdxBarDockControl;
    bbAddTaxi: TdxBarButton;
    grTarif: TcxGrid;
    TVTARIF: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    odsTaxi: TOracleDataSet;
    odsTarif: TOracleDataSet;
    dsTaxi: TDataSource;
    dsTarif: TDataSource;
    VTAXI_NAME: TcxGridDBColumn;
    VTARIF_NAME: TcxGridDBColumn;
    VTARIF_BEG: TcxGridDBColumn;
    VTARIF_END: TcxGridDBColumn;
    VTARIF_COST1: TcxGridDBColumn;
    VTARIF_COST2: TcxGridDBColumn;
    bbAddTarif: TdxBarButton;
    bbEditTarif: TdxBarButton;
    bbDelTarif: TdxBarButton;
    bbRefTarif: TdxBarButton;
    bbPrintTarif: TdxBarButton;
    bbClose: TdxBarButton;
    bbEditTaxi: TdxBarButton;
    bbDelTaxi: TdxBarButton;
    AL: TActionList;
    aAddTaxi: TAction;
    aEditTaxi: TAction;
    aDelTaxi: TAction;
    aRefreshTaxi: TAction;
    bbRefTaxi: TdxBarButton;
    aAddTarif: TAction;
    aEditTarif: TAction;
    aDelTarif: TAction;
    aRefreshTarif: TAction;
    aPrintTarif: TAction;
    aClose: TAction;
    dxBarButton1: TdxBarButton;
    aPrintTaxi: TAction;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    sdPopUp: TSaveDialog;
    aXLSTaxi: TAction;
    aXLSTarif: TAction;
    pmTVTaxi: TPopupMenu;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    frxTaxi: TfrxReport;
    frxDBTaxi: TfrxDBDataset;
    VTAXISHORT: TcxGridDBColumn;
    VTAXIPRICEKM: TcxGridDBColumn;
    VTAXIFREE: TcxGridDBColumn;
    VTAXIMG: TcxGridDBColumn;
    VTAXIALL: TcxGridDBColumn;
    VTAXITALONCAR: TcxGridDBColumn;
    VTAXITALONMIN: TcxGridDBColumn;
    procedure aCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure odsTaxiAfterScroll(DataSet: TDataSet);
    procedure aRefreshTarifExecute(Sender: TObject);
    procedure aRefreshTaxiExecute(Sender: TObject);
    procedure aDelTaxiExecute(Sender: TObject);
    procedure aDelTarifExecute(Sender: TObject);
    procedure odsTarifAfterOpen(DataSet: TDataSet);
    procedure odsTaxiAfterOpen(DataSet: TDataSet);
    procedure aXLSTarifExecute(Sender: TObject);
    procedure aXLSTaxiExecute(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure frxListGetValue(const VarName: string; var Value: Variant);
    procedure aPrintTarifExecute(Sender: TObject);
    procedure aAddTarifExecute(Sender: TObject);
    procedure aEditTarifExecute(Sender: TObject);
    procedure aPrintTaxiExecute(Sender: TObject);
    procedure aAddTaxiExecute(Sender: TObject);
    procedure aEditTaxiExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSprTarif: TfrmSprTarif;

implementation
uses fMain, fAddEditTarif, fAddEditTaxi;
{$R *.dfm}

procedure TfrmSprTarif.aAddTarifExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditTarif, frmAddEditTarif);
  try
    frmAddEditTarif.Caption := 'Добавление нового тарифа';
    frmAddEditTarif.ShowModal;
    if frmAddEditTarif.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into taxi.ts_tarif(fc_name, fd_begin, fd_end, fn_cost1, fn_cost2, fk_taxiid) '+#13+
                         ' values(:pfc_name, :pfd_begin, :pfd_end, :pfn_cost1, :pfn_cost2, :pfk_taxiid) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditTarif.teName.Text);
          if frmAddEditTarif.teBegin.EditValue = 0 then
            oq.DeclareAndSet('pfd_begin', otDate, IncSecond(frmAddEditTarif.teBegin.Time, 1))
          else
            oq.DeclareAndSet('pfd_begin', otDate, frmAddEditTarif.teBegin.Time);
          if frmAddEditTarif.teEnd.EditValue = 0 then
            oq.DeclareAndSet('pfd_end', otDate, IncSecond(frmAddEditTarif.teEnd.Time, 1))
          else
            oq.DeclareAndSet('pfd_end', otDate, frmAddEditTarif.teEnd.Time);
          oq.DeclareAndSet('pfn_cost1', otFloat, frmAddEditTarif.ceCar.Value);
          oq.DeclareAndSet('pfn_cost2', otFloat, frmAddEditTarif.ceMin.Value);
          oq.DeclareAndSet('pfk_taxiid', otInteger, odsTaxi.FieldByName('fk_id').AsInteger);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsTarif);
          odsTarif.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditTarif.Free;
  end;
end;

procedure TfrmSprTarif.aAddTaxiExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditTaxi, frmAddEditTaxi);
  try
    frmAddEditTaxi.Caption := 'Добавление нового такси';
    frmAddEditTaxi.ShowModal;
    if frmAddEditTaxi.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into taxi.ts_taxi(fc_name, fc_name_short, fn_pricekm, fn_free, fn_mg, fn_all, fn_cost_car, fn_cost_min) '+#13+
                         ' values(:pfc_name, :pfc_name_short, :pfn_pricekm, :pfn_free, :pfn_mg, :pfn_all, :pfn_cost_car, :pfn_cost_min) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditTaxi.teName.Text);
          oq.DeclareAndSet('pfc_name_short', otString, frmAddEditTaxi.teShort.Text);
          oq.DeclareAndSet('pfn_pricekm', otInteger, frmAddEditTaxi.sePriceKM.Value);
          oq.DeclareAndSet('pfn_free', otString, frmAddEditTaxi.meFree.EditValue);
          oq.DeclareAndSet('pfn_mg', otString, frmAddEditTaxi.meMG.EditValue);
          oq.DeclareAndSet('pfn_all', otString, frmAddEditTaxi.meAll.EditValue);
          oq.DeclareAndSet('pfn_cost_car', otFloat, frmAddEditTaxi.ceCar.Value);
          oq.DeclareAndSet('pfn_cost_min', otFloat, frmAddEditTaxi.ceMin.Value);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          frmMain.os.Commit;
          odsTaxi.AfterScroll := nil;
          RefreshQuery(odsTaxi);
          odsTaxi.Locate('fk_id', oq.GetVariable('pfk_id'), []);
          odsTaxi.AfterScroll := odsTaxiAfterScroll;
          odsTaxiAfterScroll(nil); 
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditTaxi.Free;
  end;
end;

procedure TfrmSprTarif.aCloseExecute(Sender: TObject);
begin
  TVTARIF.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprTarifGrTarif', TRUE, [], 'TVTARIF');
  close;
//  FreeAndNil(frmSprTarif);
end;

procedure TfrmSprTarif.aDelTarifExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы действительно хотите удалить этот тариф?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update taxi.ts_tarif set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsTarif.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsTarif); 
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmSprTarif.aDelTaxiExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Внимание!'+#13+#10+
                'При удалении такси также удалятся все тарифы, закрепленные за этим такси!'+#13+#10+
                'Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update taxi.ts_taxi set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsTaxi.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        odsTaxi.AfterScroll := nil;
        RefreshQuery(odsTaxi);
        odsTaxi.AfterScroll := odsTaxiAfterScroll;
        odsTaxiAfterScroll(nil);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmSprTarif.aEditTarifExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditTarif, frmAddEditTarif);
  try
    frmAddEditTarif.Caption := 'Изменение тарифа';
    frmAddEditTarif.teName.Text := odsTarif.FieldByName('fc_name').AsString;
    frmAddEditTarif.teBegin.Time := odsTarif.FieldByName('fd_begin').AsDateTime;
    frmAddEditTarif.teEnd.Time := odsTarif.FieldByName('fd_end').AsDateTime;
    frmAddEditTarif.ceCar.Value := odsTarif.FieldByName('fn_cost1').AsFloat;
    frmAddEditTarif.ceMin.Value := odsTarif.FieldByName('fn_cost2').AsFloat;
    frmAddEditTarif.ShowModal;
    if frmAddEditTarif.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update taxi.ts_tarif '+#13+
                         '    set fc_name = :pfc_name, '+#13+
                         '        fd_begin = :pfd_begin, '+#13+
                         '        fd_end = :pfd_end, '+#13+
                         '        fn_cost1 = :pfn_cost1, '+#13+
                         '        fn_cost2 = :pfn_cost2 '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditTarif.teName.Text);
          if frmAddEditTarif.teBegin.EditValue = 0 then
            oq.DeclareAndSet('pfd_begin', otDate, IncSecond(frmAddEditTarif.teBegin.Time, 1))
          else
            oq.DeclareAndSet('pfd_begin', otDate, frmAddEditTarif.teBegin.Time);
          if frmAddEditTarif.teEnd.EditValue = 0 then
            oq.DeclareAndSet('pfd_end', otDate, IncSecond(frmAddEditTarif.teEnd.Time, 1))
          else
            oq.DeclareAndSet('pfd_end', otDate, frmAddEditTarif.teEnd.Time);
          oq.DeclareAndSet('pfn_cost1', otFloat, frmAddEditTarif.ceCar.Value);
          oq.DeclareAndSet('pfn_cost2', otFloat, frmAddEditTarif.ceMin.Value);
          oq.DeclareAndSet('pfk_id', otInteger, odsTarif.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsTarif);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditTarif.Free;
  end;
end;

procedure TfrmSprTarif.aEditTaxiExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditTaxi, frmAddEditTaxi);
  try
    frmAddEditTaxi.Caption := 'Изменение такси';
    frmAddEditTaxi.teName.Text := odsTaxi.FieldByName('fc_name').AsString;
    frmAddEditTaxi.teShort.Text := odsTaxi.FieldByName('fc_name_short').AsString;
    frmAddEditTaxi.sePriceKM.Value := odsTaxi.FieldByName('fn_pricekm').AsInteger;
    frmAddEditTaxi.meFree.EditValue := odsTaxi.FieldByName('fn_free').AsInteger;
    frmAddEditTaxi.meMG.EditValue := odsTaxi.FieldByName('fn_mg').AsInteger;
    frmAddEditTaxi.meAll.EditValue := odsTaxi.FieldByName('fn_all').AsInteger;
    frmAddEditTaxi.ceCar.Value := odsTaxi.FieldByName('fn_cost_car').AsFloat;
    frmAddEditTaxi.ceMin.Value := odsTaxi.FieldByName('fn_cost_min').AsFloat;
    frmAddEditTaxi.ShowModal;
    if frmAddEditTaxi.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update taxi.ts_taxi '+#13+
                         '    set fc_name = :pfc_name, fc_name_short = :pfc_name_short, fn_pricekm = :pfn_pricekm, '+#13+
                         '        fn_free = :pfn_free, fn_mg = :pfn_mg, fn_all = :pfn_all, fn_cost_car = :pfn_cost_car, '+#13+
                         '        fn_cost_min = :pfn_cost_min '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditTaxi.teName.Text);
          oq.DeclareAndSet('pfc_name_short', otString, frmAddEditTaxi.teShort.Text);
          oq.DeclareAndSet('pfn_pricekm', otInteger, frmAddEditTaxi.sePriceKM.Value);
          oq.DeclareAndSet('pfn_free', otInteger, frmAddEditTaxi.meFree.EditValue);
          oq.DeclareAndSet('pfn_mg', otInteger, frmAddEditTaxi.meMG.EditValue);
          oq.DeclareAndSet('pfn_all', otInteger, frmAddEditTaxi.meAll.EditValue);
          oq.DeclareAndSet('pfn_cost_car', otFloat, frmAddEditTaxi.ceCar.Value);
          oq.DeclareAndSet('pfn_cost_min', otFloat, frmAddEditTaxi.ceMin.Value);
          oq.DeclareAndSet('pfk_id', otInteger, odsTaxi.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          odsTaxi.AfterScroll := nil;
          RefreshQuery(odsTaxi);
          odsTaxi.AfterScroll := odsTaxiAfterScroll;
          odsTaxiAfterScroll(nil);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditTaxi.Free;
  end;
end;

procedure TfrmSprTarif.aPrintTarifExecute(Sender: TObject);
var id : Integer;
begin
  id := odsTarif.FieldByName('fk_id').AsInteger;
  frxList.ShowReport;
  odsTarif.Locate('fk_id', id, []);
end;

procedure TfrmSprTarif.aPrintTaxiExecute(Sender: TObject);
var id : Integer;
begin
  id := odsTaxi.FieldByName('fk_id').AsInteger;
  odsTaxi.AfterScroll := nil;
  frxTaxi.ShowReport;
  odsTaxi.Locate('fk_id', id, []);
  odsTaxi.AfterScroll := odsTaxiAfterScroll;
  odsTaxiAfterScroll(nil);
end;

procedure TfrmSprTarif.aRefreshTarifExecute(Sender: TObject);
begin
  RefreshQuery(odsTarif);
end;

procedure TfrmSprTarif.aRefreshTaxiExecute(Sender: TObject);
begin
  odsTaxi.AfterScroll := nil;
  RefreshQuery(odsTaxi);
  odsTaxi.AfterScroll := odsTaxiAfterScroll;
end;

procedure TfrmSprTarif.aXLSTarifExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVTARIF.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, grTarif, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, grTarif, TRUE, TRUE);
end;

procedure TfrmSprTarif.aXLSTaxiExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVTAXI.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, grTaxi, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, grTaxi, TRUE, TRUE);
end;

procedure TfrmSprTarif.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmSprTarif.FormCreate(Sender: TObject);
begin
  odsTaxi.AfterScroll := nil;
  if odsTaxi.Active = False then
    odsTaxi.Active := True;
  odsTaxi.AfterScroll := odsTaxiAfterScroll;
  odsTaxiAfterScroll(nil);
  TVTARIF.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprTarifGrTarif_Default', TRUE, [], 'TVTARIF');
  TVTARIF.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprTarifGrTarif', FALSE, FALSE, [], 'TVTARIF');
end;

procedure TfrmSprTarif.FormDestroy(Sender: TObject);
begin
  frmSprTarif := nil;
end;

procedure TfrmSprTarif.frxListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'TAXI' then Value := odsTaxi.FieldByName('fc_name').AsString;  
end;

procedure TfrmSprTarif.N2Click(Sender: TObject);
begin
  TVTARIF.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprTarifGrTarif_Default', FALSE, FALSE, [], 'TVTARIF');
end;

procedure TfrmSprTarif.odsTarifAfterOpen(DataSet: TDataSet);
begin
  aEditTarif.Enabled := odsTarif.RecordCount <> 0;
  aDelTarif.Enabled := odsTarif.RecordCount <> 0;
  aPrintTarif.Enabled := odsTarif.RecordCount <> 0;
end;

procedure TfrmSprTarif.odsTaxiAfterOpen(DataSet: TDataSet);
begin
  aEditTaxi.Enabled := odsTaxi.RecordCount <> 0;
  aDelTaxi.Enabled := odsTaxi.RecordCount <> 0;
  aPrintTaxi.Enabled := odsTaxi.RecordCount <> 0;
end;

procedure TfrmSprTarif.odsTaxiAfterScroll(DataSet: TDataSet);
begin
  odsTarif.Close;
  odsTarif.SetVariable('pfk_taxiid', odsTaxi.FieldByName('fk_id').AsInteger);
  odsTarif.Open;
end;

end.
