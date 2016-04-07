unit fAddEditSh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinsdxBarPainter, dxSkinOffice2007Green,
  cxClasses, dxBar, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, cxTextEdit, cxMemo, Menus,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, Oracle, OracleData, ImgList,
  jvDBUtils;

type
  TfrmAddEditSh = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbAdd: TdxBarButton;
    bbEdit: TdxBarButton;
    bbDel: TdxBarButton;
    bbRef: TdxBarButton;
    tvList: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    memText: TcxMemo;
    bCancel: TcxButton;
    bOk: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    tvListName: TcxGridDBColumn;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRef: TAction;
    IL: TImageList;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure odsListAfterScroll(DataSet: TDataSet);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefExecute(Sender: TObject);
    procedure odsListAfterOpen(DataSet: TDataSet);
    procedure tvListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    v_Smid : Integer;
    { Public declarations }
  end;

var
  frmAddEditSh: TfrmAddEditSh;

implementation
uses fMain, fAddorEditSh, fSaveRSh;
{$R *.dfm}

procedure TfrmAddEditSh.aAddExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddorEditSh, frmAddorEditSh);
  try
    frmAddorEditSh.ShowModal;
    frmAddorEditSh.Caption := 'Добавить шаблон';
    if frmAddorEditSh.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.txray_template_recom(fc_name, fk_sotrid, fc_text, fk_smid) '+#13+
                         ' values(:pfc_name, :pfk_sotrid, :pfc_text, :pfk_smid) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddorEditSh.teName.Text);
          oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
          oq.DeclareAndSet('pfc_text', otString, frmAddorEditSh.memText.Text);
          oq.DeclareAndSet('pfk_smid', otInteger, v_SMID);
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
    frmAddorEditSh.Free;
  end;
end;

procedure TfrmAddEditSh.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditSh.aDelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if Application.MessageBox('Вы действительно хотите удалить шаблон?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.txray_template_recom where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsList);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmAddEditSh.aEditExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddorEditSh, frmAddorEditSh);
  try
    frmAddorEditSh.Caption := 'Изменить шаблон';
    frmAddorEditSh.teName.Text := odsList.FieldByName('fc_name').AsString;
    frmAddorEditSh.memText.Text := odsList.FieldByName('fc_text').AsString;
    frmAddorEditSh.ShowModal;
    if frmAddorEditSh.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.txray_template_recom '+#13+
                         '    set fc_name = :pfc_name, fc_text = :pfc_text '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddorEditSh.teName.Text);
          oq.DeclareAndSet('pfc_text', otString, frmAddorEditSh.memText.Text);
          oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsList);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddorEditSh.Free;
  end;
end;

procedure TfrmAddEditSh.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmAddEditSh.aRefExecute(Sender: TObject);
begin
  RefreshQuery(odsList);
end;

procedure TfrmAddEditSh.odsListAfterOpen(DataSet: TDataSet);
begin
  aOk.Enabled := odsList.RecordCount <> 0;
  aEdit.Enabled := odsList.RecordCount <> 0;
  aDel.Enabled := odsList.RecordCount <> 0;
end;

procedure TfrmAddEditSh.odsListAfterScroll(DataSet: TDataSet);
begin
  memText.Text := odsList.FieldByName('fc_text').AsString;
end;

procedure TfrmAddEditSh.tvListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOkExecute(nil);
end;

procedure TfrmAddEditSh.tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
    aOkExecute(nil);
end;

end.
