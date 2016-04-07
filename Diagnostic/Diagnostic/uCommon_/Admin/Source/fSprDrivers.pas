unit fSprDrivers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, frxClass,
  frxDBSet, Menus, dxBar, cxClasses, ActnList, DB, OracleData, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxTimeEdit, cxSplitter, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  ExtCtrls, jvDbUtils, Oracle, cxGridExportLink, dxSkinCaramel,
  dxSkinOffice2007Green;

type
  TfrmSprDrivers = class(TForm)
    odsTaxi: TOracleDataSet;
    dsTaxi: TDataSource;
    AL: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    aPrint: TAction;
    aClose: TAction;
    aXLS: TAction;
    BM: TdxBarManager;
    BMBar2: TdxBar;
    bbAddTaxi: TdxBarButton;
    bbAddTarif: TdxBarButton;
    bbEditTarif: TdxBarButton;
    bbDelTarif: TdxBarButton;
    bbRefTarif: TdxBarButton;
    bbPrintTarif: TdxBarButton;
    bbClose: TdxBarButton;
    bbEditTaxi: TdxBarButton;
    bbDelTaxi: TdxBarButton;
    bbRefTaxi: TdxBarButton;
    dxBarButton1: TdxBarButton;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    sdPopUp: TSaveDialog;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    Panel1: TPanel;
    grTaxi: TcxGrid;
    TVTAXI: TcxGridDBTableView;
    VTAXI_NAME: TcxGridDBColumn;
    grTaxiLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    Panel2: TPanel;
    dxBarDockControl2: TdxBarDockControl;
    grList: TcxGrid;
    TVLIST: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    VLIST_NAME: TcxGridDBColumn;
    VLIST_FIO: TcxGridDBColumn;
    VLIST_AUTO: TcxGridDBColumn;
    VLIST_IN: TcxGridDBColumn;
    VLIST_OUT: TcxGridDBColumn;
    VLIST_MED: TcxGridDBColumn;
    VLIST_LIC: TcxGridDBColumn;
    VLIST_20: TcxGridDBColumn;
    VLIST_YEAR: TcxGridDBColumn;
    VLIST_PHONE: TcxGridDBColumn;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbFind: TdxBarButton;
    aFind: TAction;
    procedure FormCreate(Sender: TObject);
    procedure odsTaxiAfterScroll(DataSet: TDataSet);
    procedure aCloseExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure odsListAfterOpen(DataSet: TDataSet);
    procedure N2Click(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxListGetValue(const VarName: string; var Value: Variant);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aFindExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSprDrivers: TfrmSprDrivers;

implementation
uses fMain, fAddEditDrv, fFindDrv;
{$R *.dfm}

procedure TfrmSprDrivers.aAddExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditDrv, frmAddEditDrv);
  try
    frmAddEditDrv.Caption := 'Добавление нового таксиста';
    frmAddEditDrv.ShowModal;
    if frmAddEditDrv.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into taxi.ts_drivers '+#13+
                         ' (fc_name, fc_fio, fc_auto, fc_year, fd_in, fd_out, fd_med, fd_license, fd_20hours, fk_taxiid, fc_phone, fc_comment, fc_bag, fc_tros) '+#13+
                         ' values '+#13+
                         ' (:pfc_name, :pfc_fio, :pfc_auto, :pfc_year, :pfd_in, :pfd_out, :pfd_med, :pfd_license, :pfd_20hours, :pfk_taxiid, :pfc_phone, :pfc_comment, :pfc_bag, :pfc_tros) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditDrv.meName.Text);
          oq.DeclareAndSet('pfc_fio', otString, frmAddEditDrv.teFIO.Text);
          oq.DeclareAndSet('pfc_auto', otString, frmAddEditDrv.teAuto.Text);
          oq.DeclareAndSet('pfc_year', otString, frmAddEditDrv.teYear.Text);
          if (frmAddEditDrv.deIn.Text = '') or (frmAddEditDrv.deIn.Text = '0') or (frmAddEditDrv.deIn.Text = '30.12.1899') then
            oq.DeclareAndSet('pfd_in', otDate, null)
          else
            oq.DeclareAndSet('pfd_in', otDate, frmAddEditDrv.deIn.Date);
          if (frmAddEditDrv.deOut.Text = '') or (frmAddEditDrv.deOut.Text = '0') or (frmAddEditDrv.deOut.Text = '30.12.1899') then
            oq.DeclareAndSet('pfd_out', otDate, null)
          else
            oq.DeclareAndSet('pfd_out', otDate, frmAddEditDrv.deOut.Date);
          if (frmAddEditDrv.deMed.Text = '') or (frmAddEditDrv.deMed.Text = '0') or (frmAddEditDrv.deMed.Text = '30.12.1899') then
            oq.DeclareAndSet('pfd_med', otDate, null)
          else
            oq.DeclareAndSet('pfd_med', otDate, frmAddEditDrv.deMed.Date);
          if (frmAddEditDrv.deLic.Text = '') or (frmAddEditDrv.deLic.Text = '0') or (frmAddEditDrv.deLic.Text = '30.12.1899') then
            oq.DeclareAndSet('pfd_license', otDate, null)
          else
            oq.DeclareAndSet('pfd_license', otDate, frmAddEditDrv.deLic.Date);
          if (frmAddEditDrv.de20.Text = '') or (frmAddEditDrv.de20.Text = '0') or (frmAddEditDrv.de20.Text = '30.12.1899') then
            oq.DeclareAndSet('pfd_20hours', otDate, null)
          else
            oq.DeclareAndSet('pfd_20hours', otDate, frmAddEditDrv.de20.Date);
          oq.DeclareAndSet('pfk_taxiid', otInteger, odsTaxi.FieldByName('fk_id').AsInteger);
          oq.DeclareAndSet('pfc_phone', otString, frmAddEditDrv.tePhone.Text);
          oq.DeclareAndSet('pfc_comment', otString, frmAddEditDrv.memCom.Lines.Text);
          if frmAddEditDrv.cbBag.Checked then
            oq.DeclareAndSet('pfc_bag', otString, 'Б')
          else
            oq.DeclareAndSet('pfc_bag', otString, '');
          if frmAddEditDrv.cbTros.Checked then
            oq.DeclareAndSet('pfc_tros', otString, 'Т')
          else
            oq.DeclareAndSet('pfc_tros', otString, '');
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
    frmAddEditDrv.Free;
  end;
end;

procedure TfrmSprDrivers.aCloseExecute(Sender: TObject);
begin
  TVLIST.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprDriversGr', TRUE, [], 'TVLIST');
  close;
end;

procedure TfrmSprDrivers.aDelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы действительно хотите удалить этого таксиста?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update taxi.ts_drivers set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsList);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmSprDrivers.aEditExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditDrv, frmAddEditDrv);
  try
    frmAddEditDrv.Caption := 'Изменение данных таксиста';
    frmAddEditDrv.meName.Text := odsList.FieldByName('fc_name').AsString;
    frmAddEditDrv.teFio.Text := odsList.FieldByName('fc_fio').AsString;
    frmAddEditDrv.teAuto.Text := odsList.FieldByName('fc_auto').AsString;
    frmAddEditDrv.teYear.Text := odsList.FieldByName('fc_year').AsString;
    if DateTimeToStr(odsList.FieldByName('fd_in').AsDateTime) = '30.12.1899' then
      frmAddEditDrv.deIn.Text := ''
    else
      frmAddEditDrv.deIn.Date := odsList.FieldByName('fd_in').AsDateTime;
    if DateTimeToStr(odsList.FieldByName('fd_out').AsDateTime) = '30.12.1899' then
      frmAddEditDrv.deOut.Text := ''
    else
      frmAddEditDrv.deOut.Date := odsList.FieldByName('fd_out').AsDateTime;
    if DateTimeToStr(odsList.FieldByName('fd_med').AsDateTime) = '30.12.1899' then
      frmAddEditDrv.deMed.Text := ''
    else
      frmAddEditDrv.deMed.Date := odsList.FieldByName('fd_med').AsDateTime;
    if DateTimeToStr(odsList.FieldByName('fd_license').AsDateTime) = '30.12.1899' then
      frmAddEditDrv.deLic.Text := ''
    else
      frmAddEditDrv.deLic.Date := odsList.FieldByName('fd_license').AsDateTime;
    if DateTimeToStr(odsList.FieldByName('fd_20hours').AsDateTime) = '30.12.1899' then
      frmAddEditDrv.de20.Text := ''
    else
      frmAddEditDrv.de20.Date := odsList.FieldByName('fd_20hours').AsDateTime;
    frmAddEditDrv.tePhone.Text := odsList.FieldByName('fc_phone').AsString;
    frmAddEditDrv.memCom.Lines.Text := odsList.FieldByName('fc_comment').AsString;
    if odsList.FieldByName('fc_bag').AsString = 'Б' then
      frmAddEditDrv.cbBag.Checked := True
    else
      frmAddEditDrv.cbBag.Checked := False;
    if odsList.FieldByName('fc_tros').AsString = 'Т' then
      frmAddEditDrv.cbTros.Checked := True
    else
      frmAddEditDrv.cbTros.Checked := False;
    frmAddEditDrv.ShowModal;
    if frmAddEditDrv.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
         oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update taxi.ts_drivers '+#13+
                         '    set fc_name=:pfc_name, fc_fio=:pfc_fio, fc_auto=:pfc_auto, fc_year = :pfc_year, fd_in=:pfd_in, '+#13+
                         '        fd_out=:pfd_out, fd_med=:pfd_med, fd_license=:pfd_license, fd_20hours=:pfd_20hours, '+#13+
                         '        fc_phone = :pfc_phone, fc_comment = :pfc_comment, fc_bag = :pfc_bag, fc_tros = :pfc_tros '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditDrv.meName.Text);
          oq.DeclareAndSet('pfc_fio', otString, frmAddEditDrv.teFIO.Text);
          oq.DeclareAndSet('pfc_auto', otString, frmAddEditDrv.teAuto.Text);
          oq.DeclareAndSet('pfc_year', otString, frmAddEditDrv.teYear.Text);
          if (frmAddEditDrv.deIn.Text = '') or (frmAddEditDrv.deIn.Text = '0') or (frmAddEditDrv.deIn.Text = '30.12.1899') then
            oq.DeclareAndSet('pfd_in', otDate, null)
          else
            oq.DeclareAndSet('pfd_in', otDate, frmAddEditDrv.deIn.Date);
          if (frmAddEditDrv.deOut.Text = '') or (frmAddEditDrv.deOut.Text = '0') or (frmAddEditDrv.deOut.Text = '30.12.1899') then
            oq.DeclareAndSet('pfd_out', otDate, null)
          else
            oq.DeclareAndSet('pfd_out', otDate, frmAddEditDrv.deOut.Date);
          if (frmAddEditDrv.deMed.Text = '') or (frmAddEditDrv.deMed.Text = '0') or (frmAddEditDrv.deMed.Text = '30.12.1899') then
            oq.DeclareAndSet('pfd_med', otDate, null)
          else
            oq.DeclareAndSet('pfd_med', otDate, frmAddEditDrv.deMed.Date);
          if (frmAddEditDrv.deLic.Text = '') or (frmAddEditDrv.deLic.Text = '0') or (frmAddEditDrv.deLic.Text = '30.12.1899') then
            oq.DeclareAndSet('pfd_license', otDate, null)
          else
            oq.DeclareAndSet('pfd_license', otDate, frmAddEditDrv.deLic.Date);
          if (frmAddEditDrv.de20.Text = '') or (frmAddEditDrv.de20.Text = '0') or (frmAddEditDrv.de20.Text = '30.12.1899') then
            oq.DeclareAndSet('pfd_20hours', otDate, null)
          else
            oq.DeclareAndSet('pfd_20hours', otDate, frmAddEditDrv.de20.Date);
          oq.DeclareAndSet('pfc_phone', otString, frmAddEditDrv.tePhone.Text);
          oq.DeclareAndSet('pfc_comment', otString, frmAddEditDrv.memCom.Lines.Text);
          if frmAddEditDrv.cbBag.Checked then
            oq.DeclareAndSet('pfc_bag', otString, 'Б')
          else
            oq.DeclareAndSet('pfc_bag', otString, '');
          if frmAddEditDrv.cbTros.Checked then
            oq.DeclareAndSet('pfc_tros', otString, 'Т')
          else
            oq.DeclareAndSet('pfc_tros', otString, '');
          oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsList);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditDrv.Free;
  end;
end;

procedure TfrmSprDrivers.aFindExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmFindDrv, frmFindDrv);
  try
    frmFindDrv.ShowModal;
    if frmFindDrv.ModalResult = mrOk then
      begin
        odsTaxi.AfterScroll := nil;
        odsTaxi.Locate('fk_id', frmFindDrv.odsFind.FieldByName('fk_taxiid').AsInteger, []);
        odsTaxi.AfterScroll := odsTaxiAfterScroll;
        odsTaxiAfterScroll(nil);
        odsList.Locate('fk_id', frmFindDrv.odsFind.FieldByName('fk_id').AsInteger, []);
      end;
  finally
    frmFindDrv.Free;
  end;
end;

procedure TfrmSprDrivers.aPrintExecute(Sender: TObject);
var id : Integer;
begin
  id := odsList.FieldByName('fk_id').AsInteger;
  frxList.ShowReport;
  odsList.Locate('fk_id', id, []);
end;

procedure TfrmSprDrivers.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsList);
end;

procedure TfrmSprDrivers.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVLIST.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, TRUE);
end;

procedure TfrmSprDrivers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSprDrivers.FormCreate(Sender: TObject);
begin
  odsTaxi.AfterScroll := nil;
  if odsTaxi.Active = False then
    odsTaxi.Active := True;
  odsTaxi.AfterScroll := odsTaxiAfterScroll;
  odsTaxiAfterScroll(nil);
  TVLIST.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprDriversGr_Default', TRUE, [], 'TVLIST');
  TVLIST.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprDriversGr', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSprDrivers.FormDestroy(Sender: TObject);
begin
  frmSprDrivers := nil;
end;

procedure TfrmSprDrivers.frxListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'TAXI' then Value := odsTaxi.FieldByName('fc_name').AsString;
end;

procedure TfrmSprDrivers.N2Click(Sender: TObject);
begin
  TVLIST.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprDriversGr_Default', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSprDrivers.odsListAfterOpen(DataSet: TDataSet);
begin
  aEdit.Enabled := odsList.RecordCount <> 0;
  aDel.Enabled := odsList.RecordCount <> 0;
  aPrint.Enabled := odsList.RecordCount <> 0;
end;

procedure TfrmSprDrivers.odsTaxiAfterScroll(DataSet: TDataSet);
begin
  odsList.Close;
  odsList.SetVariable('pfk_taxiid', odsTaxi.FieldByName('fk_id').AsInteger);
  odsList.Open;
end;

end.
