unit fParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, dxSkinsCore, cxControls,
  cxContainer, cxTreeView, dxSkinscxPCPainter, cxPC, dxSkinsdxBarPainter,
  cxClasses, dxBar, ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Oracle, OracleData, jvDbUtils,
  cxLabel, cxBarEditItem, cxVGrid, cxInplaceContainer, cxCalendar, cxTextEdit,
  cxMaskEdit, cxSpinEdit, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  dxSkinOffice2007Green;

type
  TfrmParams = class(TForm)
    tvTree: TcxTreeView;
    pcParam: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    pcSprav: TcxPageControl;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    cxTabSheet6: TcxTabSheet;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    BMBar2: TdxBar;
    BMBar3: TdxBar;
    BMBar4: TdxBar;
    dxBarDockControl2: TdxBarDockControl;
    dxBarDockControl3: TdxBarDockControl;
    dxBarDockControl4: TdxBarDockControl;
    bbAdd1: TdxBarButton;
    bbEdit1: TdxBarButton;
    bbRefresh1: TdxBarButton;
    bbDel1: TdxBarButton;
    bbAdd2: TdxBarButton;
    bbEdit2: TdxBarButton;
    bbDel2: TdxBarButton;
    bbRefresh2: TdxBarButton;
    bbAdd3: TdxBarButton;
    bbEdit3: TdxBarButton;
    bbDel3: TdxBarButton;
    bbRefresh3: TdxBarButton;
    bbAdd4: TdxBarButton;
    bbEdit4: TdxBarButton;
    bbDel4: TdxBarButton;
    bbRefresh4: TdxBarButton;
    al: TActionList;
    aAdd1: TAction;
    aEdit1: TAction;
    aDel1: TAction;
    aRefresh1: TAction;
    aAdd2: TAction;
    aEdit2: TAction;
    aDel2: TAction;
    aRefresh2: TAction;
    aAdd3: TAction;
    aEdit3: TAction;
    aDel3: TAction;
    aRefresh3: TAction;
    aAdd4: TAction;
    aEdit4: TAction;
    aDel4: TAction;
    aRefresh4: TAction;
    tvGr1: TcxGridDBTableView;
    gr1Level1: TcxGridLevel;
    gr1: TcxGrid;
    tvGr1_Name: TcxGridDBColumn;
    gr2: TcxGrid;
    tvGr2: TcxGridDBTableView;
    tvGr2_Name: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    gr3: TcxGrid;
    tvGr3: TcxGridDBTableView;
    tvGr3_Name: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    gr4: TcxGrid;
    tvGr4: TcxGridDBTableView;
    tvGr4_Name: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    odsGr1: TOracleDataSet;
    dsGr1: TDataSource;
    odsGr2: TOracleDataSet;
    dsGr2: TDataSource;
    odsGr3: TOracleDataSet;
    dsGr3: TDataSource;
    odsGr4: TOracleDataSet;
    dsGr4: TDataSource;
    cxBarEditItem1: TcxBarEditItem;
    stRep: TcxStyleRepository;
    stBold: TcxStyle;
    cxBarEditItem2: TcxBarEditItem;
    cxBarEditItem3: TcxBarEditItem;
    gr5: TcxGrid;
    tvGr5: TcxGridDBTableView;
    tvGr5_Name: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    dxBarDockControl5: TdxBarDockControl;
    BMBar5: TdxBar;
    cxBarEditItem4: TcxBarEditItem;
    bbAdd5: TdxBarButton;
    bbEdit5: TdxBarButton;
    bbDel5: TdxBarButton;
    bbRefresh5: TdxBarButton;
    aAdd5: TAction;
    aEdit5: TAction;
    aDel5: TAction;
    aRefresh5: TAction;
    gr6: TcxGrid;
    tvGr6: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    dxBarDockControl6: TdxBarDockControl;
    BMBar6: TdxBar;
    cxBarEditItem5: TcxBarEditItem;
    bbAdd6: TdxBarButton;
    bbEdit6: TdxBarButton;
    bbDel6: TdxBarButton;
    bbRefresh6: TdxBarButton;
    aAdd6: TAction;
    aEdit6: TAction;
    aDel6: TAction;
    aRefresh6: TAction;
    gr7: TcxGrid;
    tvGr7: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    dxBarDockControl7: TdxBarDockControl;
    BMBar7: TdxBar;
    cxBarEditItem6: TcxBarEditItem;
    bbAdd7: TdxBarButton;
    bbEdit7: TdxBarButton;
    bbDel7: TdxBarButton;
    bbRefresh7: TdxBarButton;
    aAdd7: TAction;
    aEdit7: TAction;
    aDel7: TAction;
    aRefresh7: TAction;
    dsGr5: TDataSource;
    odsGr5: TOracleDataSet;
    dsGr6: TDataSource;
    odsGr6: TOracleDataSet;
    dsGr7: TDataSource;
    odsGr7: TOracleDataSet;
    lbCap: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    seNum1: TcxSpinEdit;
    seNum2: TcxSpinEdit;
    bSave: TcxButton;
    cxButton2: TcxButton;
    aSave: TAction;
    aClose: TAction;
    cxTabSheet7: TcxTabSheet;
    dsGr8: TDataSource;
    odsGr8: TOracleDataSet;
    dxBarDockControl8: TdxBarDockControl;
    BMBar8: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    aAdd8: TAction;
    aEdit8: TAction;
    aDel8: TAction;
    aRefresh8: TAction;
    gr8: TcxGrid;
    tvGr8: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    procedure tvTreeChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure aDel1Execute(Sender: TObject);
    procedure aRefresh1Execute(Sender: TObject);
    procedure aRefresh2Execute(Sender: TObject);
    procedure aRefresh3Execute(Sender: TObject);
    procedure aRefresh4Execute(Sender: TObject);
    procedure aAdd1Execute(Sender: TObject);
    procedure aEdit1Execute(Sender: TObject);
    procedure aDel2Execute(Sender: TObject);
    procedure aDel3Execute(Sender: TObject);
    procedure aDel4Execute(Sender: TObject);
    procedure aAdd2Execute(Sender: TObject);
    procedure aEdit2Execute(Sender: TObject);
    procedure aAdd3Execute(Sender: TObject);
    procedure aEdit3Execute(Sender: TObject);
    procedure aAdd4Execute(Sender: TObject);
    procedure aEdit4Execute(Sender: TObject);
    procedure aRefresh5Execute(Sender: TObject);
    procedure aRefresh6Execute(Sender: TObject);
    procedure aRefresh7Execute(Sender: TObject);
    procedure aDel5Execute(Sender: TObject);
    procedure aDel6Execute(Sender: TObject);
    procedure aDel7Execute(Sender: TObject);
    procedure aAdd5Execute(Sender: TObject);
    procedure aAdd6Execute(Sender: TObject);
    procedure aAdd7Execute(Sender: TObject);
    procedure aEdit5Execute(Sender: TObject);
    procedure aEdit6Execute(Sender: TObject);
    procedure aEdit7Execute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure seNum1PropertiesChange(Sender: TObject);
    procedure seNum2PropertiesChange(Sender: TObject);
    procedure aRefresh8Execute(Sender: TObject);
    procedure aEdit8Execute(Sender: TObject);
    procedure aDel8Execute(Sender: TObject);
    procedure aAdd8Execute(Sender: TObject);
  private
    isNum1, isNum2 : Boolean;
//    DateofPrevMonth : TDateTime;
    { Private declarations }
  public
    isChange : Boolean;
    { Public declarations }
  end;

var
  frmParams: TfrmParams;

implementation
uses fMain, fAddEdit;
{$R *.dfm}

procedure TfrmParams.aAdd1Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEdit, frmAddEdit);
  try
    frmAddEdit.Caption := 'Добавление номера барокамеры';
    frmAddEdit.ShowModal;
    if frmAddEdit.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.tsmid(fc_name, fk_owner) '+#13+
                         ' values(:pfc_name, (select fk_id from asu.tsmid where fc_synonim = ''BAROZAL_NUMCAMERS'')) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEdit.teValue.Text);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsGr1);
          odsGr1.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmParams.aAdd2Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEdit, frmAddEdit);
  try
    frmAddEdit.Caption := 'Добавление скорости компрессии';
    frmAddEdit.ShowModal;
    if frmAddEdit.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.tsmid(fc_name, fk_owner) '+#13+
                         ' values(:pfc_name, (select fk_id from asu.tsmid where fc_synonim = ''BAROZAL_COMPR_SPEED'')) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEdit.teValue.Text);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsGr2);
          odsGr2.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmParams.aAdd3Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEdit, frmAddEdit);
  try
    frmAddEdit.Caption := 'Добавление давления изопрессии';
    frmAddEdit.ShowModal;
    if frmAddEdit.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.tsmid(fc_name, fk_owner) '+#13+
                         ' values(:pfc_name, (select fk_id from asu.tsmid where fc_synonim = ''BAROZAL_IZO_PRESSURE'')) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEdit.teValue.Text);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsGr3);
          odsGr3.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmParams.aAdd4Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEdit, frmAddEdit);
  try
    frmAddEdit.Caption := 'Добавление скорости декомпрессии';
    frmAddEdit.ShowModal;
    if frmAddEdit.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.tsmid(fc_name, fk_owner) '+#13+
                         ' values(:pfc_name, (select fk_id from asu.tsmid where fc_synonim = ''BAROZAL_DECOMPR_SPEED'')) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEdit.teValue.Text);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsGr4);
          odsGr4.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmParams.aAdd5Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEdit, frmAddEdit);
  try
    frmAddEdit.Caption := 'Добавление времени компрессии';
    frmAddEdit.ShowModal;
    if frmAddEdit.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.tsmid(fc_name, fk_owner) '+#13+
                         ' values(:pfc_name, (select fk_id from asu.tsmid where fc_synonim = ''BAROZAL_COMPR_TIME'')) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEdit.teValue.Text);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsGr5);
          odsGr5.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmParams.aAdd6Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEdit, frmAddEdit);
  try
    frmAddEdit.Caption := 'Добавление времени изопрессии';
    frmAddEdit.ShowModal;
    if frmAddEdit.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.tsmid(fc_name, fk_owner) '+#13+
                         ' values(:pfc_name, (select fk_id from asu.tsmid where fc_synonim = ''BAROZAL_IZO_TIME'')) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEdit.teValue.Text);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsGr6);
          odsGr6.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmParams.aAdd7Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEdit, frmAddEdit);
  try
    frmAddEdit.Caption := 'Добавление времени декомпрессии';
    frmAddEdit.ShowModal;
    if frmAddEdit.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.tsmid(fc_name, fk_owner) '+#13+
                         ' values(:pfc_name, (select fk_id from asu.tsmid where fc_synonim = ''BAROZAL_DECOMPR_TIME'')) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEdit.teValue.Text);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsGr7);
          odsGr7.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmParams.aAdd8Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEdit, frmAddEdit);
  try
    frmAddEdit.Caption := 'Добавление давления';
    frmAddEdit.ShowModal;
    if frmAddEdit.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.tsmid(fc_name, fk_owner) '+#13+
                         ' values(:pfc_name, (select fk_id from asu.tsmid where fc_synonim = ''BAROZAL_PRESSURE'')) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEdit.teValue.Text);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsGr8);
          odsGr8.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmParams.aCloseExecute(Sender: TObject);
begin
  if aSave.Enabled = True then
    begin
      if MessageDlg('Имеются несохраненные данные!'+#13+#10+'Вы хотите их сохранить?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
        begin
          aSaveExecute(nil);
        end;
    end;
  ModalResult := mrCancel;
end;

procedure TfrmParams.aDel1Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы собираетесь удалить значение!'+#13+#10+'Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update asu.tsmid set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsGr1.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsGr1);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmParams.aDel2Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы собираетесь удалить значение!'+#13+#10+'Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update asu.tsmid set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsGr2.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsGr2);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmParams.aDel3Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы собираетесь удалить значение!'+#13+#10+'Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update asu.tsmid set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsGr3.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsGr3);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmParams.aDel4Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы собираетесь удалить значение!'+#13+#10+'Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update asu.tsmid set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsGr4.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsGr4);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmParams.aDel5Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы собираетесь удалить значение!'+#13+#10+'Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update asu.tsmid set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsGr5.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsGr5);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmParams.aDel6Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы собираетесь удалить значение!'+#13+#10+'Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update asu.tsmid set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsGr6.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsGr6);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmParams.aDel7Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы собираетесь удалить значение!'+#13+#10+'Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update asu.tsmid set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsGr7.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsGr7);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmParams.aDel8Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы собираетесь удалить значение!'+#13+#10+'Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update asu.tsmid set fl_del = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsGr8.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsGr8);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmParams.aEdit1Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEdit, frmAddEdit);
  try
    frmAddEdit.Caption := 'Изменение номера барокамеры';
    frmAddEdit.teValue.Text := odsGr1.FieldByName('fc_name').AsString;
    frmAddEdit.ShowModal;
    if frmAddEdit.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tsmid set fc_name = :pfc_name where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEdit.teValue.Text);
          oq.DeclareAndSet('pfk_id', otInteger, odsGr1.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsGr1);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmParams.aEdit2Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEdit, frmAddEdit);
  try
    frmAddEdit.Caption := 'Изменение скорости компрессии';
    frmAddEdit.teValue.Text := odsGr2.FieldByName('fc_name').AsString;
    frmAddEdit.ShowModal;
    if frmAddEdit.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tsmid set fc_name = :pfc_name where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEdit.teValue.Text);
          oq.DeclareAndSet('pfk_id', otInteger, odsGr2.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsGr2);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmParams.aEdit3Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEdit, frmAddEdit);
  try
    frmAddEdit.Caption := 'Изменение давления изопрессии';
    frmAddEdit.teValue.Text := odsGr3.FieldByName('fc_name').AsString;
    frmAddEdit.ShowModal;
    if frmAddEdit.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tsmid set fc_name = :pfc_name where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEdit.teValue.Text);
          oq.DeclareAndSet('pfk_id', otInteger, odsGr3.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsGr3);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmParams.aEdit4Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEdit, frmAddEdit);
  try
    frmAddEdit.Caption := 'Изменение скорости декомпрессии';
    frmAddEdit.teValue.Text := odsGr4.FieldByName('fc_name').AsString;
    frmAddEdit.ShowModal;
    if frmAddEdit.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tsmid set fc_name = :pfc_name where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEdit.teValue.Text);
          oq.DeclareAndSet('pfk_id', otInteger, odsGr4.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsGr4);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmParams.aEdit5Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEdit, frmAddEdit);
  try
    frmAddEdit.Caption := 'Изменение времени компрессии';
    frmAddEdit.teValue.Text := odsGr5.FieldByName('fc_name').AsString;
    frmAddEdit.ShowModal;
    if frmAddEdit.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tsmid set fc_name = :pfc_name where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEdit.teValue.Text);
          oq.DeclareAndSet('pfk_id', otInteger, odsGr5.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsGr5);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmParams.aEdit6Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEdit, frmAddEdit);
  try
    frmAddEdit.Caption := 'Изменение времени изопрессии';
    frmAddEdit.teValue.Text := odsGr6.FieldByName('fc_name').AsString;
    frmAddEdit.ShowModal;
    if frmAddEdit.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tsmid set fc_name = :pfc_name where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEdit.teValue.Text);
          oq.DeclareAndSet('pfk_id', otInteger, odsGr6.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsGr6);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmParams.aEdit7Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEdit, frmAddEdit);
  try
    frmAddEdit.Caption := 'Изменение времени декомпрессии';
    frmAddEdit.teValue.Text := odsGr7.FieldByName('fc_name').AsString;
    frmAddEdit.ShowModal;
    if frmAddEdit.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tsmid set fc_name = :pfc_name where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEdit.teValue.Text);
          oq.DeclareAndSet('pfk_id', otInteger, odsGr7.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsGr7);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmParams.aEdit8Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEdit, frmAddEdit);
  try
    frmAddEdit.Caption := 'Изменение давления';
    frmAddEdit.teValue.Text := odsGr8.FieldByName('fc_name').AsString;
    frmAddEdit.ShowModal;
    if frmAddEdit.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tsmid set fc_name = :pfc_name where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEdit.teValue.Text);
          oq.DeclareAndSet('pfk_id', otInteger, odsGr8.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsGr8);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmParams.aRefresh1Execute(Sender: TObject);
begin
  RefreshQuery(odsGr1);
end;

procedure TfrmParams.aRefresh2Execute(Sender: TObject);
begin
  RefreshQuery(odsGr2);
end;

procedure TfrmParams.aRefresh3Execute(Sender: TObject);
begin
  RefreshQuery(odsGr3);
end;

procedure TfrmParams.aRefresh4Execute(Sender: TObject);
begin
  RefreshQuery(odsGr4);
end;

procedure TfrmParams.aRefresh5Execute(Sender: TObject);
begin
  RefreshQuery(odsGr5);
end;

procedure TfrmParams.aRefresh6Execute(Sender: TObject);
begin
  RefreshQuery(odsGr6);
end;

procedure TfrmParams.aRefresh7Execute(Sender: TObject);
begin
  RefreshQuery(odsGr7);
end;

procedure TfrmParams.aRefresh8Execute(Sender: TObject);
begin
  RefreshQuery(odsGr8);
end;

procedure TfrmParams.aSaveExecute(Sender: TObject);
var oq : TOracleQuery;
    ods : TOracleDataSet;
begin
  oq := TOracleQuery.Create(nil);
  ods := TOracleDataSet.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    if isNum1 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tsmini using dual on (fc_section=''BAROZAL_PARAMS'' and fc_key = ''DATE_BEG'') '+#13+
                       ' when matched then update set fc_value = :pfc_value where fc_section=''BAROZAL_PARAMS'' and fc_key = ''DATE_BEG'' '+#13+
                       ' when not matched then insert(fc_section, fc_key, fc_value) '+#13+
                       '                       values(''BAROZAL_PARAMS'', ''DATE_BEG'', :pfc_value) ';
        oq.DeclareAndSet('pfc_value', otString, IntToStr(seNum1.Value));
        oq.Execute;
      end;
    if isNum2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tsmini using dual on (fc_section=''BAROZAL_PARAMS'' and fc_key = ''DATE_END'') '+#13+
                       ' when matched then update set fc_value = :pfc_value where fc_section=''BAROZAL_PARAMS'' and fc_key = ''DATE_END'' '+#13+
                       ' when not matched then insert(fc_section, fc_key, fc_value) '+#13+
                       '                       values(''BAROZAL_PARAMS'', ''DATE_END'', :pfc_value) ';
        oq.DeclareAndSet('pfc_value', otString, IntToStr(seNum2.Value));
        oq.Execute;
      end;
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(sysdate, ''mm.yyyy'') as datesys, '+#13+
                    '        to_number(to_char(sysdate, ''dd'')) as numday, to_char(sysdate, ''mm'') as nummonth, '+#13+
                    '        to_char(sysdate, ''yyyy'') as numyear, '+#13+
                    '        to_char(trunc(add_months(sysdate, -1)), ''mm'') as prevmonth, '+#13+
                    '        to_char(trunc(add_months(sysdate, -1)), ''yyyy'') as prevyear, '+#13+
                    '        to_char(trunc(add_months(sysdate, 1)), ''mm'') as nextmonth, '+#13+
                    '        to_char(trunc(add_months(sysdate, 1)), ''yyyy'') as nextyear '+#13+
                    '   from dual ';
    ods.Open;
    frmMain.nNum1 := seNum1.Value;
    frmMain.nNum2 := seNum2.Value;
    if ods.FieldByName('numday').AsInteger > frmMain.nNum1 then
      begin
        frmMain.sDate1 := IntToStr(frmMain.nNum1)+'.'+ods.FieldByName('nummonth').AsString+'.'+ods.FieldByName('numyear').AsString;
        frmMain.sDate2 := IntToStr(frmMain.nNum2)+'.'+ods.FieldByName('nextmonth').AsString+'.'+ods.FieldByName('nextyear').AsString+' 23:59:59';
        frmMain.lbPeriod.Caption := 'Период: '+frmMain.sDate1+' - '+IntToStr(frmMain.nNum2)+'.'+ods.FieldByName('nextmonth').AsString+'.'+ods.FieldByName('nextyear').AsString;
      end else
      begin
        frmMain.sDate1 := IntToStr(seNum1.Value)+'.'+ods.FieldByName('prevmonth').AsString+'.'+ods.FieldByName('prevyear').AsString;
        frmMain.sDate2 := IntToStr(seNum2.Value)+'.'+ods.FieldByName('datesys').AsString+' 23:59:59';
        frmMain.lbPeriod.Caption := 'Период: '+frmMain.sDate1+' - '+IntToStr(frmMain.nNum2)+'.'+ods.FieldByName('datesys').AsString;
      end;
    frmMain.os.Commit;
    aSave.Enabled := False;
    isChange := True;
  finally
    ods.Free;
    oq.Free;
  end;
end;

procedure TfrmParams.FormCreate(Sender: TObject);
begin
  if odsGr1.Active = False then
    odsGr1.Active := True;
  if odsGr2.Active = False then
    odsGr2.Active := True;
  if odsGr3.Active = False then
    odsGr3.Active := True;
  if odsGr4.Active = False then
    odsGr4.Active := True;
  if odsGr5.Active = False then
    odsGr5.Active := True;
  if odsGr6.Active = False then
    odsGr6.Active := True;
  if odsGr7.Active = False then
    odsGr7.Active := True;
  if odsGr8.Active = False then
    odsGr8.Active := True;

  isNum1 := False;
  isNum2 := False;
  aSave.Enabled := False;
  isChange := False;
end;

procedure TfrmParams.seNum1PropertiesChange(Sender: TObject);
begin
  isNum1 := True;
  aSave.Enabled := True;
end;

procedure TfrmParams.seNum2PropertiesChange(Sender: TObject);
begin
  isNum2 := True;
  aSave.Enabled := True;
end;

procedure TfrmParams.tvTreeChange(Sender: TObject; Node: TTreeNode);
begin
  if Node.StateIndex = 0 then
    pcParam.ActivePageIndex := 0;
  if Node.StateIndex = 1 then
    begin
      pcParam.ActivePageIndex := 1;
      pcSprav.ActivePageIndex := 0;
    end;
end;

end.
