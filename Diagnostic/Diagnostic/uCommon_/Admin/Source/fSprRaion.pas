unit fSprRaion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxSkinsdxBarPainter, OracleData,
  ActnList, jvDBUtils, Oracle, Menus, cxGridExportLink,
  frxClass, frxDBSet, cxLabel, dxSkinCaramel, dxSkinOffice2007Green;

type
  TfrmSprRaion = class(TForm)
    grList: TcxGrid;
    TVLIST: TcxGridDBTableView;
    VLIST_NAME: TcxGridDBColumn;
    grListLevel1: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbAdd: TdxBarButton;
    bbEdit: TdxBarButton;
    bbDel: TdxBarButton;
    bbClose: TdxBarButton;
    bbPrint: TdxBarButton;
    bbRefresh: TdxBarButton;
    AL: TActionList;
    aClose: TAction;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aPrint: TAction;
    aRefresh: TAction;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    VLIST_ORDER: TcxGridDBColumn;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    sdPopUp: TSaveDialog;
    aXLS: TAction;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    VLIST_SHORT: TcxGridDBColumn;
    procedure aCloseExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure odsListAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSprRaion: TfrmSprRaion;

implementation

uses fMain, fAddEditRaion;

{$R *.dfm}

procedure TfrmSprRaion.aAddExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditRaion, frmAddEditRaion);
  try
    frmAddEditRaion.Caption := ' Добавить новый район ';
    frmAddEditRaion.ShowModal;
    if frmAddEditRaion.ModalResult = mrOk  then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into taxi.ts_raion(fc_name, fn_order, fc_shortname) '+#13+
                         ' values(:pfc_name, :pfn_order, :pfc_shortname) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditRaion.teName.Text);
          oq.DeclareAndSet('pfn_order', otInteger, frmAddEditRaion.seOrder.Value);
          oq.DeclareAndSet('pfc_shortname', otString, frmAddEditRaion.teShort.Text);
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
    frmAddEditRaion.Free;
  end;
end;

procedure TfrmSprRaion.aCloseExecute(Sender: TObject);
begin
  TVLIST.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprRaionGr', TRUE, [], 'TVLIST');
  close;
end;

procedure TfrmSprRaion.aDelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы действительно хотите удалить эту запись?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update taxi.ts_raion set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsList);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmSprRaion.aEditExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditRaion, frmAddEditRaion);
  try
    frmAddEditRaion.Caption := ' Изменить район ';
    frmAddEditRaion.teName.Text := odsList.FieldByName('fc_name').AsString;
    frmAddEditRaion.seOrder.Value := odsList.FieldByName('fn_order').AsInteger;
    frmAddEditRaion.teShort.Text := odsList.FieldByName('fc_shortname').AsString;
    frmAddEditRaion.ShowModal;
    if frmAddEditRaion.ModalResult = mrOk  then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update taxi.ts_raion set fc_name = :pfc_name, fc_shortname = :pfc_shortname, fn_order = :pfn_order where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditRaion.teName.Text);
          oq.DeclareAndSet('pfn_order', otInteger, frmAddEditRaion.seOrder.Value);
          oq.DeclareAndSet('pfc_shortname', otString, frmAddEditRaion.teShort.Text);
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
    frmAddEditRaion.Free;
  end;
end;

procedure TfrmSprRaion.aPrintExecute(Sender: TObject);
begin
  frxList.ShowReport;
end;

procedure TfrmSprRaion.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsList);
end;

procedure TfrmSprRaion.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVLIST.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, TRUE);
end;

procedure TfrmSprRaion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSprRaion.FormCreate(Sender: TObject);
begin
  if odsList.Active = False then
    odsList.Active := True;
  TVLIST.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprRaionGr_Default', TRUE, [], 'TVLIST');
  TVLIST.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprRaionGr', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSprRaion.FormDestroy(Sender: TObject);
begin
  frmSprRaion := nil;
end;

procedure TfrmSprRaion.N2Click(Sender: TObject);
begin
  TVLIST.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprRaionGr_Default', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSprRaion.odsListAfterOpen(DataSet: TDataSet);
begin
  aEdit.Enabled := odsList.RecordCount <> 0;
  aDel.Enabled := odsList.RecordCount <> 0;
  aPrint.Enabled := odsList.RecordCount <> 0;
end;

end.
