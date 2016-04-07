unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Oracle, SmMainAPI, dxSkinsCore, dxSkinsdxBarPainter,
  dxSkinOffice2007Green, dxBar, cxClasses, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls, cxSplitter, ActnList,
  ImgList, OracleData, jvDBUtils;

type
  TfrmMain = class(TForm)
    os: TOracleSession;
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbClose: TdxBarButton;
    paLeft: TPanel;
    dxBarDockControl2: TdxBarDockControl;
    tvForm: TcxGridDBTableView;
    grFormLevel1: TcxGridLevel;
    grForm: TcxGrid;
    BMBar2: TdxBar;
    bbAddF: TdxBarButton;
    bbEditF: TdxBarButton;
    bbDelF: TdxBarButton;
    bbPrintF: TdxBarButton;
    cxSplitter1: TcxSplitter;
    paRight: TPanel;
    dxBarDockControl3: TdxBarDockControl;
    grCell: TcxGrid;
    tvCell: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    BMBar3: TdxBar;
    bbAddC: TdxBarButton;
    bbEditC: TdxBarButton;
    bbDelC: TdxBarButton;
    bbPrintC: TdxBarButton;
    al: TActionList;
    aClose: TAction;
    IL: TImageList;
    aAddF: TAction;
    aEditF: TAction;
    aDelF: TAction;
    aPrintF: TAction;
    aAddC: TAction;
    aEditC: TAction;
    aDelC: TAction;
    aPrintC: TAction;
    tvFormName: TcxGridDBColumn;
    tvCellName: TcxGridDBColumn;
    tvCellSyn: TcxGridDBColumn;
    tvCellTable: TcxGridDBColumn;
    odsForm: TOracleDataSet;
    dsForm: TDataSource;
    dsCell: TDataSource;
    odsCell: TOracleDataSet;
    bbRefF: TdxBarButton;
    bbRefC: TdxBarButton;
    aRefF: TAction;
    aRefC: TAction;
    procedure FormCreate(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure odsFormAfterScroll(DataSet: TDataSet);
    procedure aAddFExecute(Sender: TObject);
    procedure aEditFExecute(Sender: TObject);
    procedure aAddCExecute(Sender: TObject);
    procedure aEditCExecute(Sender: TObject);
    procedure aRefFExecute(Sender: TObject);
    procedure aRefCExecute(Sender: TObject);
    procedure aDelCExecute(Sender: TObject);
    procedure aDelFExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses fAddEditForm, fAddEditC;

{$R *.dfm}

procedure TfrmMain.aAddCExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditC, frmAddEditC);
  try
    frmAddEditC.Caption := 'Добавить';
    frmAddEditC.ShowModal;
    if frmAddEditC.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.SQL.Text := ' insert into asu.ts_columnnaz(fc_name, fk_owner, fk_smid, fl_del, fc_synonim, fc_tablename) '+#13+
                         ' values(:pfc_name, :pfk_owner, -1, 0, :pfc_synonim, :pfc_tablename) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditC.teName.Text);
          oq.DeclareAndSet('pfk_owner', otInteger, odsForm.FieldByName('fk_id').AsInteger);
          oq.DeclareAndSet('pfc_synonim', otString, frmAddEditC.teSyn.Text);
          oq.DeclareAndSet('pfc_tablename', otString, frmAddEditC.teTable.Text);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          os.Commit;
          RefreshQuery(odsCell);
          odsCell.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditC.Free;
  end;
end;

procedure TfrmMain.aAddFExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditF, frmAddEditF);
  try
    frmAddEditF.Caption := 'Добавить';
    frmAddEditF.ShowModal;
    if frmAddEditF.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into ts_columnnaz(fc_name, fk_owner, fk_smid, fl_del, fc_synonim, fc_tablename) '+#13+
                         ' values(:pfc_name, -1, -1, 0, null, null) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditF.teName.Text);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          os.Commit;
          odsForm.AfterScroll := nil;
          RefreshQuery(odsForm);
          odsForm.Locate('fk_id', oq.GetVariable('pfk_id'), []);
          odsForm.AfterScroll := odsFormAfterScroll;
          odsFormAfterScroll(nil);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditF.Free;
  end;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aDelCExecute(Sender: TObject);
var oq : TOracleQuery;
begin
 if Application.MessageBox('Вы действительно хотите удалить эту ячейку отчета?'+#13+
                           'Вместе с ячейкой удалятся и все методики, которые были прикреплены к ней!'+#13+
                           'Продолжить?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
   begin
     oq := TOracleQuery.Create(nil);
     try
       oq.Session := os;
       oq.Cursor := crSQLWait;
       oq.SQL.Text := ' update asu.ts_columnnaz set fl_del = 1 '+#13+
                      '  where fk_id in (select fk_id from asu.ts_columnnaz '+#13+
                      '                  start with fk_id = :pfk_id '+#13+
                      '                  connect by prior fk_id = fk_owner) ' ;
       oq.DeclareAndSet('pfk_id', otInteger, odsCell.FieldByName('fk_id').AsInteger);
       oq.Execute;
       os.Commit;
       RefreshQuery(odsCell);
     finally
       oq.Free;
     end;
   end;
end;

procedure TfrmMain.aDelFExecute(Sender: TObject);
var oq : TOracleQuery;
begin
 if Application.MessageBox('Вы действительно хотите удалить этот отчет?'+#13+
                           'Вместе с отчетом удалятся и все его настройки!'+#13+
                           'Продолжить?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
   begin
     oq := TOracleQuery.Create(nil);
     try
       oq.Session := os;
       oq.Cursor := crSQLWait;
       oq.SQL.Text := ' update asu.ts_columnnaz set fl_del = 1 '+#13+
                      '  where fk_id in (select fk_id from asu.ts_columnnaz '+#13+
                      '                  start with fk_id = :pfk_id '+#13+
                      '                  connect by prior fk_id = fk_owner) ';
       oq.DeclareAndSet('pfk_id', otInteger, odsForm.FieldByName('fk_id').AsInteger);
       oq.Execute;
       os.Commit;
       odsForm.AfterScroll := nil;
       RefreshQuery(odsForm);
       odsForm.AfterScroll := odsFormAfterScroll;
       odsFormAfterScroll(nil); 
     finally
       oq.Free;
     end;
   end;
end;

procedure TfrmMain.aEditCExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditC, frmAddEditC);
  try
    frmAddEditC.Caption := 'Изменить';
    frmAddEditC.teName.Text := odsCell.FieldByName('fc_name').AsString;
    frmAddEditC.teSyn.Text := odsCell.FieldByName('fc_synonim').AsString;
    frmAddEditC.teTable.Text := odsCell.FieldByName('fc_tablename').AsString;
    frmAddEditC.ShowModal;
    if frmAddEditC.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.SQL.Text := ' update asu.ts_columnnaz '+#13+
                         '    set fc_name = :pfc_name, fc_synonim = :pfc_synonim, fc_tablename = :pfc_tablename '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditC.teName.Text);
          oq.DeclareAndSet('pfk_id', otInteger, odsCell.FieldByName('fk_id').AsInteger);
          oq.DeclareAndSet('pfc_synonim', otString, frmAddEditC.teSyn.Text);
          oq.DeclareAndSet('pfc_tablename', otString, frmAddEditC.teTable.Text);
          oq.Execute;
          os.Commit;
          RefreshQuery(odsCell);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditC.Free;
  end;
end;

procedure TfrmMain.aEditFExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditF, frmAddEditF);
  try
    frmAddEditF.Caption := 'Изменить';
    frmAddEditF.teName.Text := odsForm.FieldByName('fc_name').AsString;
    frmAddEditF.ShowModal;
    if frmAddEditF.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.ts_columnnaz set fc_name = :pfc_name '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditF.teName.Text);
          oq.DeclareAndSet('pfk_id', otInteger, odsForm.FieldByName('fk_id').AsInteger);
          oq.Execute;
          os.Commit;
          odsForm.AfterScroll := nil;
          RefreshQuery(odsForm);
          odsForm.AfterScroll := odsFormAfterScroll;
          odsFormAfterScroll(nil);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditF.Free;
  end;
end;

procedure TfrmMain.aRefCExecute(Sender: TObject);
begin
  RefreshQuery(odsCell);
end;

procedure TfrmMain.aRefFExecute(Sender: TObject);
begin
  odsForm.AfterScroll := nil;
  RefreshQuery(odsForm);
  odsForm.AfterScroll := odsFormAfterScroll;
  odsFormAfterScroll(nil);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
  odsForm.AfterScroll := nil;
  if odsForm.Active = False then
    odsForm.Active := True;
  odsForm.AfterScroll := odsFormAfterScroll;
  odsFormAfterScroll(nil);
end;

procedure TfrmMain.odsFormAfterScroll(DataSet: TDataSet);
begin
  odsCell.Close;
  odsCell.SetVariable('pfk_owner', odsForm.FieldByName('fk_id').AsInteger);
  odsCell.Open;
end;

end.
