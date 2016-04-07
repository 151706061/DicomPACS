unit fSprStreet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, dxBar, cxClasses,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, frxClass, frxDBSet, ActnList, OracleData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxControls, cxGridCustomView, cxGrid, jvDBUtils, Oracle, Menus, cxGridExportLink,
  cxCheckBox, dxSkinCaramel, dxSkinOffice2007Green;

type
  TfrmSprStreet = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbClose: TdxBarButton;
    grList: TcxGrid;
    TVLIST: TcxGridDBTableView;
    VLIST_NAME: TcxGridDBColumn;
    grListLevel1: TcxGridLevel;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    AL: TActionList;
    aEdit: TAction;
    aClose: TAction;
    aRefresh: TAction;
    VLIST_PREF: TcxGridDBColumn;
    bbEdit: TdxBarButton;
    bbRefresh: TdxBarButton;
    pmTV: TPopupMenu;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    sdPopUp: TSaveDialog;
    aXLS: TAction;
    VLIST_SHORT: TcxGridDBColumn;
    bbDel: TdxBarButton;
    aDel: TAction;
    aAdd: TAction;
    bbAdd: TdxBarButton;
    oqDel: TOracleQuery;
    qInsert: TOracleQuery;
    qUpdate: TOracleQuery;
    VLISTColumn1: TcxGridDBColumn;
    procedure aCloseExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure odsListAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DoShowForm(pVal : Integer);
    { Public declarations }
  end;

var
  frmSprStreet: TfrmSprStreet;

implementation
uses fMain, fEditSpr;
{$R *.dfm}

procedure TfrmSprStreet.aAddExecute(Sender: TObject);
var id : Integer;
begin
  Application.CreateForm(TfrmEditStr, frmEditStr);
  try
    frmEditStr.Caption := 'Добавить улицу';
    frmEditStr.teName.Text := '';
    frmEditStr.teShortName.Text := '';
    frmEditStr.cbShowInFromWhere.Checked := true;
    if frmEditStr.odsPref.Active = False then
      frmEditStr.odsPref.Active := True;
    frmEditStr.lcbPref.EditValue := frmEditStr.odsPref.FieldByName('FC_PREFFIX').AsVariant;
    frmEditStr.ShowModal;
    if frmEditStr.ModalResult = mrOk then
      begin
        try
          qInsert.DeclareAndSet('pfc_name', otString, frmEditStr.teName.Text);
          qInsert.DeclareAndSet('pfc_preffix', otString, frmEditStr.lcbPref.EditText);
          qInsert.DeclareAndSet('pfc_short_name', otString, frmEditStr.teShortName.Text);
          if (frmEditStr.cbShowInFromWhere.Checked) then
            qInsert.DeclareAndSet('pfl_showinfromwhere', otInteger, 1)
          else
            qInsert.DeclareAndSet('pfl_showinfromwhere', otInteger, 0);
          qInsert.DeclareVariable('pfk_id', otInteger);
          qInsert.Execute;
          id := qInsert.GetVariable('pfk_id');
          frmMain.os.Commit;
          RefreshQuery(odsList);
          odsList.Locate('fk_id', id, []);
        finally
        end;
      end;
  finally
    frmEditStr.Free;
  end;
end;

procedure TfrmSprStreet.aCloseExecute(Sender: TObject);
begin
  TVLIST.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprStreetGr', TRUE, [], 'TVLIST');
  close;
end;

procedure TfrmSprStreet.aDelExecute(Sender: TObject);
var //oq : TOracleQuery;
  id, TopRowIndex:Integer;
begin
  if MessageDlg('Вы действительно хотите удалить '+
                odsList.FieldByName('fc_preffix').AsString+' '+
                odsList.FieldByName('fc_name').AsString+' ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      {oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update taxi.tstreet set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsList);
      finally
        oq.Free;
      end;}
      TopRowIndex := TVLIST.Controller.TopRowIndex;
      id := odsList.FieldByName('fk_id').AsInteger;
      oqDel.SetVariable('PFK_ID', id);
      oqDel.Execute;
      oqDel.Session.Commit;
      RefreshQuery(odsList);
      if (TopRowIndex > 0) then
        TVLIST.Controller.TopRowIndex := TopRowIndex - 1;
    end;
end;

procedure TfrmSprStreet.aEditExecute(Sender: TObject);
var oq : TOracleQuery;
    id : Integer;
begin
  Application.CreateForm(TfrmEditStr, frmEditStr);
  try
    frmEditStr.teName.Text := odsList.FieldByName('fc_name').AsString;
    frmEditStr.teShortName.Text := odsList.FieldByName('fc_short_name').AsString;
    frmEditStr.cbShowInFromWhere.Checked := odsList.FieldByName('FL_SHOWINFROMWHERE').AsString = '1';
    if frmEditStr.odsPref.Active = False then
      frmEditStr.odsPref.Active := True;
    frmEditStr.lcbPref.EditText := odsList.FieldByName('fc_preffix').AsString;

    frmEditStr.ShowModal;
    if frmEditStr.ModalResult = mrOk then
      begin
        id := odsList.FieldByName('fk_id').AsInteger;
        oq := qUpdate;
        try
          oq.DeclareAndSet('pfc_name', otString, frmEditStr.teName.Text);
          oq.DeclareAndSet('pfc_preffix', otString, frmEditStr.lcbPref.EditText);
          oq.DeclareAndSet('pfc_short_name', otString, frmEditStr.teShortName.Text);
          if (frmEditStr.cbShowInFromWhere.Checked) then
            oq.DeclareAndSet('pfl_showinfromwhere', otInteger, 1)
          else
            oq.DeclareAndSet('pfl_showinfromwhere', otInteger, 0);
          oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsList);
          odsList.Locate('fk_id', id, []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmEditStr.Free;
  end;
end;

procedure TfrmSprStreet.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsList);
end;

procedure TfrmSprStreet.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVLIST.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, TRUE);
end;

procedure TfrmSprStreet.DoShowForm(pVal: Integer);
begin
  odsList.Close;
//  odsList.SetVariable('pfk_owner', pVal);
  odsList.Open;
end;

procedure TfrmSprStreet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmSprStreet.FormCreate(Sender: TObject);
begin
  TVLIST.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprStreetGr_Default', TRUE, [], 'TVLIST');
  TVLIST.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprStreetGr', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSprStreet.FormDestroy(Sender: TObject);
begin
  frmSprStreet := nil;
end;

procedure TfrmSprStreet.N2Click(Sender: TObject);
begin
  TVLIST.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprStreetGr_Default', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSprStreet.odsListAfterOpen(DataSet: TDataSet);
begin
  aEdit.Enabled := odsList.recordCount <> 0;
  aDel.Enabled := odsList.RecordCount <> 0;
end;

end.
