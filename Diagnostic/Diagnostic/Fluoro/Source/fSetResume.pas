unit fSetResume;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, cxTLData, cxDBTL, Oracle, DB, OracleData, cxMaskEdit,
  ComCtrls, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxImageComboBox,
  ImgList, dxBar, ActnList, jvDbUtils, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, dxSkinsdxBarPainter, dxSkinOffice2007Green;

type
  TfrmSetResume = class(TForm)
    dsTree: TDataSource;
    odsTree: TOracleDataSet;
    odsTreeFK_ID: TFloatField;
    odsTreeFC_NAME: TStringField;
    odsTreeFK_OWNER: TFloatField;
    TVTREE: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    TVFC_NAME: TcxGridDBColumn;
    TVFK_OWNER: TcxGridDBColumn;
    TVIMAGE: TcxGridDBColumn;
    VTREEColumn1: TcxGridDBColumn;
    odsTreeCOUNTCHILD: TFloatField;
    IL2: TImageList;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    al: TActionList;
    bbClose: TdxBarButton;
    bbSet: TdxBarButton;
    bbAdd: TdxBarButton;
    bbEdit: TdxBarButton;
    bbAddChild: TdxBarButton;
    bbRefresh: TdxBarButton;
    bbDel: TdxBarButton;
    aClose: TAction;
    aSet: TAction;
    aAdd: TAction;
    aEdit: TAction;
    aAddChild: TAction;
    aDel: TAction;
    aRefresh: TAction;
    IL: TImageList;
    procedure TVTREEDblClick(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aSetExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aAddChildExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure TVTREEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TVTREEFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure odsTreeBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    procedure DoSetEditRights;
    { Private declarations }
  public
    procedure DoShowForm;
    procedure CheckEnabledButtons;
    { Public declarations }
  end;

var
  frmSetResume: TfrmSetResume;

implementation

uses fAddEditElement, fMain;

{$R *.dfm}

procedure TfrmSetResume.TVTREEDblClick(Sender: TObject);
var id : Integer;
    ods : TOracleDataSet;
begin
  id := odsTree.FieldByName('FK_ID').AsInteger;
  if id = -2 then
  begin
    if odsTree.FieldByName('FK_OWNER').AsInteger = 0 then
    begin
      exit;
    end else
    begin
      ods := TOracleDataSet.Create(nil);
    try
      ods.Session := frmMain.os;
      ods.Cursor := crSQLWait;
      ods.SQL.Text := ' SELECT FK_OWNER FROM TSHABLON_XRAY_ZAKL WHERE fk_id = :pfk_id ';
      ods.DeclareAndSet('pfk_id', otInteger, odsTree.FieldByName('FK_OWNER').AsInteger);
      ods.Open;
      odsTree.Close;
      odsTree.SetVariable('PFK_OWNER', ods.FieldByName('FK_OWNER').AsInteger);
//      odsTree.SetVariable('PFK_KABINETID', frmMain.odsKab.FieldByName('FK_ID').AsInteger);
      odsTree.Open;
    finally
      ods.Free;
    end;
    end;
  end else
  begin
    if odsTree.FieldByName('COUNTCHILD').AsInteger <> 0 then
      begin
        odsTree.Close;
        odsTree.SetVariable('PFK_OWNER', id);
//        odsTree.SetVariable('PFK_KABINETID', frmMain.odsKab.FieldByName('FK_ID').AsInteger);
        odsTree.Open;
      end else
      begin
        if odsTree.FieldByName('COUNTCHILD').AsInteger = 0 then
          begin
            ModalResult := MrOK;
          end;
      end;
  end;
end;

procedure TfrmSetResume.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmSetResume.aSetExecute(Sender: TObject);
begin
  ModalResult := MrOK;
end;

procedure TfrmSetResume.aAddExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditElement, frmAddEditElement);
  frmAddEditElement.ShowModal;
  if frmAddEditElement.ModalResult = MrOK then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' INSERT INTO asu.TSHABLON_XRAY_ZAKL(FC_NAME, FK_OWNER, FK_KABINETID) VALUES(:PFC_NAME, :PFK_OWNER, :PFK_KABINETID) ';
        oq.DeclareAndSet('PFC_NAME', otString, frmAddEditElement.cxName.Text);
        oq.DeclareAndSet('PFK_OWNER', otInteger, odsTree.FieldByName('FK_OWNER').AsInteger);
        oq.DeclareAndSet('PFK_KABINETID', otInteger, frmMain.get_xray_flukab);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsTree);
      finally
        oq.Free;
      end;
    end;
  frmAddEditElement.Free;
end;

procedure TfrmSetResume.aEditExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditElement, frmAddEditElement);
  frmAddEditElement.cxName.Text := odsTree.FieldByName('FC_NAME').AsString;
  frmAddEditElement.ShowModal;
  if frmAddEditElement.ModalResult = MrOK then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' UPDATE asu.TSHABLON_XRAY_ZAKL SET FC_NAME = :PFC_NAME WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFC_NAME', otString, frmAddEditElement.cxName.Text);
        oq.DeclareAndSet('PFK_ID', otInteger, odsTree.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsTree);
      finally
        oq.Free;
      end;
    end;
  frmAddEditElement.Free;
end;

procedure TfrmSetResume.aAddChildExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditElement, frmAddEditElement);
  frmAddEditElement.ShowModal;
  if frmAddEditElement.ModalResult = MrOK then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' INSERT INTO asu.TSHABLON_XRAY_ZAKL(FC_NAME, FK_OWNER, FK_KABINETID) VALUES(:PFC_NAME, :PFK_OWNER, :PFK_KABINETID) ';
        oq.DeclareAndSet('PFC_NAME', otString, frmAddEditElement.cxName.Text);
        oq.DeclareAndSet('PFK_OWNER', otInteger, odsTree.FieldByName('FK_ID').AsInteger);
        oq.DeclareAndSet('PFK_KABINETID', otInteger, frmMain.GET_XRAY_FLUKAB);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsTree);
      finally
        oq.Free;
      end;
    end;
  frmAddEditElement.Free;
end;

procedure TfrmSetResume.aDelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if Application.MessageBox('Вы собираетесь удалить уровень и все его подуровни, если таковые имеются! ' +#13#10+'Вы уверены?' , 'Предупреждение !',
                            MB_OKCANCEL+MB_ICONQUESTION) = IdOK then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' DELETE FROM TSHABLON_XRAY_ZAKL WHERE FK_ID IN ( '+
                       ' SELECT FK_ID FROM TSHABLON_XRAY_ZAKL START WITH FK_ID = :PFK_ID '+
                       ' CONNECT BY PRIOR FK_ID = FK_OWNER ) ';
        oq.DeclareAndSet('PFK_ID', otInteger, odsTree.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsTree);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmSetResume.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsTree);
end;

procedure TfrmSetResume.DoSetEditRights;
begin
  if frmMain.bIsAdmin = 1 then
    begin
//      aDel.Visible := True; // убрано потому что удалять заключения нельзя. будет отдельный справочник
      aAddChild.Visible := True;
      aEdit.Visible := True;
      aAdd.Visible := True;
    end else
    begin
//      aDel.Visible := False;
      aAddChild.Visible := False;
      aEdit.Visible := False;
      aAdd.Visible := False;
    end;
end;

procedure TfrmSetResume.DoShowForm;
begin
  frmSetResume.Caption := 'Заключения';
  DoSetEditRights;
end;

procedure TfrmSetResume.FormCreate(Sender: TObject);
begin
  if odsTree.Active = False then
    odsTree.Active := True;
end;

procedure TfrmSetResume.TVTREEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      TVTREEDblClick(nil);
    end;
end;

procedure TfrmSetResume.TVTREEFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  CheckEnabledButtons;
  DoSetEditRights;
end;

procedure TfrmSetResume.CheckEnabledButtons;
begin
  aEdit.Enabled := odsTree.FieldByName('FK_ID').AsInteger <> -2;
  aAddChild.Enabled := odsTree.FieldByName('FK_ID').AsInteger <> -2;
  aSet.Enabled := (odsTree.FieldByName('FK_ID').AsInteger <> -2) and (odsTree.FieldByName('COUNTCHILD').AsInteger = 0);
end;

procedure TfrmSetResume.odsTreeBeforeOpen(DataSet: TDataSet);
begin
  odsTree.SetVariable('PFK_KABINETID', frmMain.GET_XRAY_FLUKAB);
end;

end.
