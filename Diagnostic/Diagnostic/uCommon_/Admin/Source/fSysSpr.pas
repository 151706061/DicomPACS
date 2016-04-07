unit fSysSpr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, cxGraphics,
  cxCustomData, cxStyles, cxTL, cxControls, cxInplaceContainer, cxTLData,
  cxDBTL, dxBar, ExtCtrls, cxSplitter, dxSkinscxPCPainter, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ActnList,
  OracleData, jvDBUtils, cxMaskEdit, Oracle, Menus, cxGridExportLink,
  dxSkinCaramel, dxSkinOffice2007Green;

type
  TfrmSysSpr = class(TForm)
    Panel1: TPanel;
    BM: TdxBarManager;
    Panel2: TPanel;
    tlSpr: TcxDBTreeList;
    Panel3: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    cxSplitter1: TcxSplitter;
    BMBar1: TdxBar;
    bbAdd: TdxBarButton;
    bbEdit: TdxBarButton;
    bbDel: TdxBarButton;
    bbClose: TdxBarButton;
    TVLIST: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    AL: TActionList;
    aClose: TAction;
    odsTree: TOracleDataSet;
    dsTree: TDataSource;
    trColName: TcxDBTreeListColumn;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    bbRefresh: TdxBarButton;
    VLIST_NAME: TcxGridDBColumn;
    VLIST_SYN: TcxGridDBColumn;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    pmTV: TPopupMenu;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    sdPopUp: TSaveDialog;
    aXLS: TAction;
    procedure aCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure odsTreeAfterScroll(DataSet: TDataSet);
    procedure odsListAfterOpen(DataSet: TDataSet);
    procedure N2Click(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSysSpr: TfrmSysSpr;

implementation
uses fMain, fAddEditTSS;
{$R *.dfm}

procedure TfrmSysSpr.aAddExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditTSS, frmAddEditTSS);
  try
    frmAddEditTSS.Caption := ' Добавить новую запись ';
    frmAddEditTSS.ShowModal;
    if frmAddEditTSS.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQl.Text := ' insert into taxi.tss(fc_name, fc_synonim, fk_owner) '+#13+
                         ' values(:pfc_name, :pfc_synonim, :pfk_owner) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditTSS.teName.Text);
          oq.DeclareAndSet('pfc_synonim', otString, frmAddEditTSS.teSyn.Text);
          oq.DeclareAndSet('pfk_owner', otInteger, odsTree.FieldByName('fk_id').AsInteger);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsList);
          odsList.Locate('fk_id', oq.Getvariable('pfk_id'), []);
          odsTree.AfterScroll := nil;
          RefreshQuery(odsTree);
          odsTree.AfterScroll := odsTreeAfterScroll;
          tlSpr.FullExpand;
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditTSS.Free;
  end;
end;

procedure TfrmSysSpr.aCloseExecute(Sender: TObject);
begin
  TVLIST.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprOSSGr', TRUE, [], 'TVLIST');
  close;
end;

procedure TfrmSysSpr.aDelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы действительно хотите удалить запись?'+#13+#10+
                'Это может привести к некорректной работе системы!', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update taxi.tss set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsList);
        odsTree.AfterScroll := nil;
        RefreshQuery(odsTree);
        odsTree.AfterScroll := odsTreeAfterScroll;
        tlSpr.FullExpand;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmSysSpr.aEditExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditTSS, frmAddEditTSS);
  try
    frmAddEditTSS.Caption := ' Изменить запись ';
    frmAddEditTSS.teName.Text := odsList.FieldByName('fc_name').AsString;
    frmAddEditTSS.teSyn.Text := odsList.FieldByName('fc_synonim').AsString;
    frmAddEditTSS.ShowModal;
    if frmAddEditTSS.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQl.Text := ' update taxi.tss '+#13+
                         '    set fc_name = :pfc_name, fc_synonim = :pfc_synonim '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditTSS.teName.Text);
          oq.DeclareAndSet('pfc_synonim', otString, frmAddEditTSS.teSyn.Text);
          oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsList);
          odsTree.AfterScroll := nil;
          RefreshQuery(odsTree);
          odsTree.AfterScroll := odsTreeAfterScroll;
          tlSpr.FullExpand;
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditTSS.Free;
  end;
end;

procedure TfrmSysSpr.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsList);
end;

procedure TfrmSysSpr.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVLIST.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, TRUE);
end;

procedure TfrmSysSpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSysSpr.FormCreate(Sender: TObject);
begin
  odsTree.AfterScroll := nil;
  if odsTree.Active = False then
    odsTree.Active := True;
  odsTree.AfterScroll := odsTreeAfterScroll;
  odsTreeAfterScroll(nil);
  TVLIST.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprOSSGr_Default', TRUE, [], 'TVLIST');
  TVLIST.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprOSSGr', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSysSpr.FormDestroy(Sender: TObject);
begin
  frmSysSpr := nil;
end;

procedure TfrmSysSpr.N2Click(Sender: TObject);
begin
  TVLIST.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprOSSGr_Default', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSysSpr.odsListAfterOpen(DataSet: TDataSet);
begin
  aEdit.Enabled := odsList.RecordCount <> 0;
  aDel.Enabled := odsList.RecordCount <> 0;
end;

procedure TfrmSysSpr.odsTreeAfterScroll(DataSet: TDataSet);
begin
  odsList.Close;
  odsList.SetVariable('pfk_owner', odsTree.FieldByName('fk_id').AsInteger);
  odsList.Open;
end;

end.
