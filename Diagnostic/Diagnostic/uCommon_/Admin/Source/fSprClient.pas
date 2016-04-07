unit fSprClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxSkinsdxBarPainter,
  dxBar, Menus, frxClass, frxDBSet, ActnList, cxClasses, OracleData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, jvDBUtils, cxGridExportLink, Oracle, cxSplitter,
  ExtCtrls, cxLabel, dxSkinCaramel, dxSkinOffice2007Green;

type
  TfrmSprClient = class(TForm)
    dsList: TDataSource;
    odsList: TOracleDataSet;
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
    AL: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    aPrint: TAction;
    aClose: TAction;
    aXLS: TAction;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    sdPopUp: TSaveDialog;
    bbTel: TdxBarButton;
    aTel: TAction;
    Panel1: TPanel;
    grTaxi: TcxGrid;
    TVTAXI: TcxGridDBTableView;
    VTAXI_NAME: TcxGridDBColumn;
    grTaxiLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    Panel2: TPanel;
    grList: TcxGrid;
    TVLIST: TcxGridDBTableView;
    VLIST_NUM: TcxGridDBColumn;
    VLIST_KOD: TcxGridDBColumn;
    VLIST_ADR: TcxGridDBColumn;
    VLIST_NOW: TcxGridDBColumn;
    VLIST_BONUS: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    odsTaxi: TOracleDataSet;
    dsTaxi: TDataSource;
    procedure aCloseExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aTelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure odsTaxiAfterScroll(DataSet: TDataSet);
    procedure frxListGetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSprClient: TfrmSprClient;

implementation
uses fMain, fAddEditClient, fTel;
{$R *.dfm}

procedure TfrmSprClient.aAddExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditClient, frmAddEditClient);
  try
    frmAddEditClient.Caption := 'Добавление нового клиента';
    frmAddEditClient.ShowModal;
    if frmAddEditClient.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into taxi.ts_client(fc_num, fc_kod, fc_adr, fn_bonus, fk_adrid, fk_taxiid) '+#13+
                         ' values(:pfc_num, :pfc_kod, :pfc_adr, :pfn_bonus, :pfk_adrid, :pfk_taxiid) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_num', otString, frmAddEditClient.teNum.Text);
          oq.DeclareAndSet('pfc_kod', otString, frmAddEditClient.teKod.text);
          oq.DeclareAndSet('pfc_adr', otString, frmAddEditClient.beAdr.Text);
          oq.DeclareAndSet('pfn_bonus', otInteger, frmAddEditClient.seBonus.Value);
          oq.DeclareAndSet('pfk_adrid', otInteger, frmAddEditClient.beAdr.Tag);
          oq.DeclareAndSet('pfk_taxiid', otInteger, odsTaxi.FieldByName('fk_id').AsInteger);
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
    frmAddEditClient.Free;
  end;
end;

procedure TfrmSprClient.aCloseExecute(Sender: TObject);
begin
  TVLIST.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprClientGr', TRUE, [], 'TVLIST');
  close;
end;

procedure TfrmSprClient.aDelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы действительно хотите удалить этого клиента?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update taxi.ts_client set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsList);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmSprClient.aEditExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditClient, frmAddEditClient);
  try
    frmAddEditClient.Caption := 'Изменение данных клиента';
    frmAddEditClient.teNum.Text := odsList.FieldByName('fc_num').AsString;
    frmAddEditClient.teKod.Text := odsList.FieldByName('fc_kod').AsString;
    frmAddEditClient.beAdr.Text := odsList.FieldByName('fc_adr').AsString;
    frmAddEditClient.beAdr.Tag := odsList.FieldByName('fk_adrid').AsInteger;
    frmAddEditClient.seBonus.Value := odsList.FieldByName('fn_bonus').AsInteger;
    frmAddEditClient.ShowModal;
    if frmAddEditClient.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update taxi.ts_client '+#13+
                         '    set fc_num = :pfc_num, fc_kod = :pfc_kod, fc_adr = :pfc_adr, '+#13+
                         '        fn_bonus = :pfn_bonus, fk_adrid = :pfk_adrid '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_num', otString, frmAddEditClient.teNum.Text);
          oq.DeclareAndSet('pfc_kod', otString, frmAddEditClient.teKod.text);
          oq.DeclareAndSet('pfc_adr', otString, frmAddEditClient.beAdr.Text);
          oq.DeclareAndSet('pfn_bonus', otInteger, frmAddEditClient.seBonus.Value);
          oq.DeclareAndSet('pfk_adrid', otString, frmAddEditClient.beAdr.Tag);
          oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsList);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditClient.Free;
  end;
end;

procedure TfrmSprClient.aPrintExecute(Sender: TObject);
var id : Integer;
begin
  id := odsList.FieldByName('fk_id').AsInteger;
  frxList.ShowReport;
  odsList.Locate('fk_id', id, []);
end;

procedure TfrmSprClient.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsList);
end;

procedure TfrmSprClient.aTelExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmTel, frmTel);
  try
    frmTel.odsTel.Close;
    frmTel.odsTel.SetVariable('pfk_clientid', odsList.FieldByName('fk_id').AsInteger);
    frmTel.odsTel.Open;
    frmTel.ShowModal;
  finally
    frmTel.Free;
  end;
end;

procedure TfrmSprClient.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVLIST.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, TRUE);
end;

procedure TfrmSprClient.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSprClient.FormCreate(Sender: TObject);
begin
  if odsTaxi.Active = False then
    odsTaxi.Active := True;
  TVLIST.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprClientGr_Default', TRUE, [], 'TVLIST');
  TVLIST.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprClientGr', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSprClient.FormDestroy(Sender: TObject);
begin
  frmSprClient := nil;
end;

procedure TfrmSprClient.frxListGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'TAXI' then Value := odsTaxi.FieldByName('fc_name').AsString;
  
end;

procedure TfrmSprClient.N2Click(Sender: TObject);
begin
  TVLIST.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprClientGr_Default', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSprClient.odsTaxiAfterScroll(DataSet: TDataSet);
begin
  odsList.Close;
  odsList.SetVariable('pfk_taxiid', odsTaxi.FieldByName('fk_id').AsInteger);
  odsList.Open;
end;

end.
