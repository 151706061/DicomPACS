unit fSprCross;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, dxSkinCaramel,
  dxSkinOffice2007Green, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxLabel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, frxClass, frxDBSet, Menus, OracleData,
  ActnList, dxBar, jvDBUtils, cxGridExportLink, Oracle;

type
  TfrmSprCross = class(TForm)
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
    aXLS: TAction;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    sdPopUp: TSaveDialog;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    grList: TcxGrid;
    TVLIST: TcxGridDBTableView;
    VLIST_STREET1: TcxGridDBColumn;
    VLIST_STREET2: TcxGridDBColumn;
    VLIST_RAION: TcxGridDBColumn;
    grListLevel1: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure odsListAfterOpen(DataSet: TDataSet);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSprCross: TfrmSprCross;

implementation
uses fMain, fAddEditCross;
{$R *.dfm}

procedure TfrmSprCross.aAddExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditCross, frmAddEditCross);
  try
    frmAddEditCross.Caption := ' Добавить новый район ';
    frmAddEditCross.ShowModal;
    if frmAddEditCross.ModalResult = mrOk  then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into taxi.tperekrestok(fk_street1, fk_street2, fk_raion) '+#13+
                         ' values(:pfk_street1, :pfk_street2, :pfk_raion) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfk_street1', otInteger, frmAddEditCross.lcbStreet1.EditValue);
          oq.DeclareAndSet('pfk_street2', otInteger, frmAddEditCross.lcbStreet2.EditValue);
          oq.DeclareAndSet('pfk_raion', otInteger, frmAddEditCross.lcbRaion.EditValue);
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
    frmAddEditCross.Free;
  end;
end;

procedure TfrmSprCross.aCloseExecute(Sender: TObject);
begin
  TVLIST.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprCrossGr', TRUE, [], 'TVLIST');
  close;
end;

procedure TfrmSprCross.aDelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы действительно хотите удалить эту запись?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from taxi.tperekrestok where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsList);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmSprCross.aEditExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditCross, frmAddEditCross);
  try
    frmAddEditCross.Caption := ' Изменить перекресток ';
    frmAddEditCross.lcbStreet1.EditValue := odsList.FieldByName('fk_street1').AsInteger;
    frmAddEditCross.lcbStreet2.EditValue := odsList.FieldByName('fk_street2').AsInteger;
    frmAddEditCross.lcbRaion.EditValue := odsList.FieldByName('fk_raionid').AsInteger;
    frmAddEditCross.ShowModal;
    if frmAddEditCross.ModalResult = mrOk  then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update taxi.tperekrestok set fk_street1 = :pfk_street1, fk_street2 = :pfk_street2, fk_raion = :pfk_raion where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfk_street1', otInteger, frmAddEditCross.lcbStreet1.EditValue);
          oq.DeclareAndSet('pfk_street2', otInteger, frmAddEditCross.lcbStreet2.EditValue);
          oq.DeclareAndSet('pfk_raion', otInteger, frmAddEditCross.lcbRaion.EditValue);
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
    frmAddEditCross.Free;
  end;
end;

procedure TfrmSprCross.aPrintExecute(Sender: TObject);
begin
  frxList.ShowReport;
end;

procedure TfrmSprCross.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsList);
end;

procedure TfrmSprCross.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVLIST.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, TRUE);
end;

procedure TfrmSprCross.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSprCross.FormCreate(Sender: TObject);
begin
  if odsList.Active = False then
    odsList.Active := True;
  TVLIST.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprCrossGr_Default', TRUE, [], 'TVLIST');
  TVLIST.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprCrossGr', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSprCross.FormDestroy(Sender: TObject);
begin
  frmSprCross := nil;
end;

procedure TfrmSprCross.N2Click(Sender: TObject);
begin
  TVLIST.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprCrossGr_Default', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSprCross.odsListAfterOpen(DataSet: TDataSet);
begin
  aEdit.Enabled := odsList.RecordCount <> 0;
  aDel.Enabled := odsList.RecordCount <> 0;
  aPrint.Enabled := odsList.RecordCount <> 0;
end;

end.
