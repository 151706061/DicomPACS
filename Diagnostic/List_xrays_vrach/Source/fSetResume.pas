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
  dxSkinscxPCPainter, dxSkinsdxBarPainter, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue;

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
    IL1: TImageList;
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
    TVORDER: TcxGridDBColumn;
    odsTreeFN_ORDER: TFloatField;
    bbUp: TdxBarButton;
    aUp: TAction;
    TVFK_ID: TcxGridDBColumn;
    bbDown: TdxBarButton;
    aDown: TAction;
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
    procedure aUpExecute(Sender: TObject);
    procedure aDownExecute(Sender: TObject);
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
  if id = -2 then // проверяем если '...' то выходим, ничего не делаем
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
            ods.SQL.Text := ' SELECT FK_OWNER FROM ASU.TSHABLON_XRAY_ZAKL WHERE FK_ID = :PFK_ID ';
            ods.DeclareAndSet('PFK_ID', otInteger, odsTree.FieldByName('FK_OWNER').AsInteger);
            ods.Open;
            odsTree.Close;
            odsTree.SetVariable('PFK_OWNER', ods.FieldByName('FK_OWNER').AsInteger);
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

procedure TfrmSetResume.aUpExecute(Sender: TObject);
var oq : TOracleQuery;
    id : Integer;
begin
  if (TVTREE.DataController.Values[TVTREE.DataController.GetFocusedRecordIndex-1, TVORDER.Index] <> 0)
      and (TVTREE.DataController.Values[TVTREE.DataController.GetFocusedRecordIndex-1, TVORDER.Index] <> null) then
    begin
      id := odsTree.FieldByName('FK_ID').AsInteger;
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' BEGIN '+
                       '   UPDATE ASU.TSHABLON_XRAY_ZAKL SET FN_ORDER = :PFN_ORDER1 WHERE FK_ID = :PFK_ID1; '+
                       '   UPDATE ASU.TSHABLON_XRAY_ZAKL SET FN_ORDER = :PFN_ORDER2 WHERE FK_ID = :PFK_ID2; '+
                       ' END; ';
        oq.DeclareAndSet('PFN_ORDER1', otInteger, TVTREE.DataController.Values[TVTREE.DataController.GetFocusedRecordIndex-1, TVORDER.Index]);
        oq.DeclareAndSet('PFN_ORDER2', otInteger, TVTREE.DataController.Values[TVTREE.DataController.GetFocusedRecordIndex, TVORDER.Index]);
        oq.DeclareAndSet('PFK_ID1', otInteger, TVTREE.DataController.Values[TVTREE.DataController.GetFocusedRecordIndex, TVFK_ID.Index]);
        oq.DeclareAndSet('PFK_ID2', otInteger, TVTREE.DataController.Values[TVTREE.DataController.GetFocusedRecordIndex-1, TVFK_ID.Index]);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsTree);
        odsTree.Locate('FK_ID', id, []);
      finally
        oq.Free;
      end;
    end;
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
        oq.SQL.Text := ' INSERT INTO ASU.TSHABLON_XRAY_ZAKL(FC_NAME, FK_OWNER, FK_KABINETID, FN_ORDER) '+
                       ' VALUES(:PFC_NAME, :PFK_OWNER, :PFK_KABINETID, :PFN_ORDER) ';
        oq.DeclareAndSet('PFC_NAME', otString, frmAddEditElement.cxName.Text);
        oq.DeclareAndSet('PFK_OWNER', otInteger, odsTree.FieldByName('FK_OWNER').AsInteger);
        oq.DeclareAndSet('PFK_KABINETID', otInteger, frmMain.odsKab.FieldByName('FK_ID').AsInteger);
        oq.DeclareAndSet('PFN_ORDER', otInteger, frmAddEditElement.seOrder.Value);
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
  frmAddEditElement.seOrder.Value := odsTree.FieldByName('FN_ORDER').AsInteger;
  frmAddEditElement.ShowModal;
  if frmAddEditElement.ModalResult = MrOK then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' UPDATE ASU.TSHABLON_XRAY_ZAKL SET FC_NAME = :PFC_NAME, FN_ORDER = :PFN_ORDER WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFC_NAME', otString, frmAddEditElement.cxName.Text);
        oq.DeclareAndSet('PFN_ORDER', otInteger, frmAddEditElement.seOrder.Value);
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
        oq.SQL.Text := ' INSERT INTO ASU.TSHABLON_XRAY_ZAKL(FC_NAME, FK_OWNER, FK_KABINETID) VALUES(:PFC_NAME, :PFK_OWNER, :PFK_KABINETID) ';
        oq.DeclareAndSet('PFC_NAME', otString, frmAddEditElement.cxName.Text);
        oq.DeclareAndSet('PFK_OWNER', otInteger, odsTree.FieldByName('FK_ID').AsInteger);
        oq.DeclareAndSet('PFK_KABINETID', otInteger, frmMain.odsKab.FieldByName('FK_ID').AsInteger);
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
    ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select fc_value from asu.tsmini where fc_value = :pfc_value ';
    ods.DeclareAndSet('pfc_value', otString, IntToStr(odsTree.FieldByName('fk_id').AsInteger));
    ods.Open;
    if ods.RecordCount > 0 then
      begin
        Application.MessageBox('Внимание!'+#13+'На данное заключение имеется настройка в модуле "Настройки"!'+#13+
                               'При удалении этого заключения могут возникнуть ошибки в работе системы!'+#13+
                               'Вы не можете удалить это заключение! Свяжитесь с администраторами системы!',
                               'Предупреждение', mb_ok+mb_iconwarning);
        exit;                       
      end;
  finally
    ods.Free;
  end;

  if Application.MessageBox('Вы собираетесь удалить уровень и все его подуровни, если таковые имеются! ' +#13#10+'Вы уверены?' , 'Предупреждение !',
                            MB_OKCANCEL+MB_ICONQUESTION) = IdOK then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' DELETE FROM ASU.TSHABLON_XRAY_ZAKL WHERE FK_ID IN ( '+
                       ' SELECT FK_ID FROM ASU.TSHABLON_XRAY_ZAKL START WITH FK_ID = :PFK_ID '+
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

procedure TfrmSetResume.aDownExecute(Sender: TObject);
var oq : TOracleQuery;
    id : Integer;
begin
  if not TVTREE.DataController.IsEOF then
    begin
      if (TVTREE.DataController.Values[TVTREE.DataController.GetFocusedRecordIndex+1, TVORDER.Index] <> 0)
        and (TVTREE.DataController.Values[TVTREE.DataController.GetFocusedRecordIndex+1, TVORDER.Index] <> null) then
        begin
          id := odsTree.FieldByName('FK_ID').AsInteger;
          oq := TOracleQuery.Create(nil);
          try
            oq.Session := frmMain.os;
            oq.Cursor := crSQLWait;
            oq.SQL.Text := ' BEGIN '+
                           '   UPDATE ASU.TSHABLON_XRAY_ZAKL SET FN_ORDER = :PFN_ORDER1 WHERE FK_ID = :PFK_ID1; '+
                           '   UPDATE ASU.TSHABLON_XRAY_ZAKL SET FN_ORDER = :PFN_ORDER2 WHERE FK_ID = :PFK_ID2; '+
                           ' END; ';
            oq.DeclareAndSet('PFN_ORDER1', otInteger, TVTREE.DataController.Values[TVTREE.DataController.GetFocusedRecordIndex+1, TVORDER.Index]);
            oq.DeclareAndSet('PFN_ORDER2', otInteger, TVTREE.DataController.Values[TVTREE.DataController.GetFocusedRecordIndex, TVORDER.Index]);
            oq.DeclareAndSet('PFK_ID1', otInteger, TVTREE.DataController.Values[TVTREE.DataController.GetFocusedRecordIndex, TVFK_ID.Index]);
            oq.DeclareAndSet('PFK_ID2', otInteger, TVTREE.DataController.Values[TVTREE.DataController.GetFocusedRecordIndex+1, TVFK_ID.Index]);
            oq.Execute;
            frmMain.os.Commit;
            RefreshQuery(odsTree);
            odsTree.Locate('FK_ID', id, []);
          finally
            oq.Free;
          end;
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
      aDel.Visible := True; // временно вернули назад
      aAddChild.Visible := True;
      aEdit.Visible := True;
      aAdd.Visible := True;
      aUp.Visible := True;
      aDown.Visible := True;
    end else
    begin
      aDel.Visible := False;
      aAddChild.Visible := False;
      aEdit.Visible := False;
      aAdd.Visible := False;
      aUp.Visible := False;
      aDown.Visible := False;
    end;
end;

procedure TfrmSetResume.DoShowForm;
begin
  frmSetResume.Caption := 'Заключения для '+frmMain.odsKab.FieldByName('FC_NAME').AsString;
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
  aDel.Enabled := odsTree.FieldByName('FK_ID').AsInteger <> -2; // временно вернули назад
  aSet.Enabled := (odsTree.FieldByName('FK_ID').AsInteger <> -2) and (odsTree.FieldByName('COUNTCHILD').AsInteger = 0);
  aUp.Enabled := odsTree.FieldByName('FK_ID').AsInteger <> -2;
  aDown.Enabled := odsTree.FieldByName('FK_ID').AsInteger <> -2;
end;

procedure TfrmSetResume.odsTreeBeforeOpen(DataSet: TDataSet);
begin
  if frmMain.odsKab.FieldByName('is_flu').AsInteger = 1 then
    odsTree.SetVariable('PFK_KABINETID', frmMain.get_xray_flukab)
  else
    odsTree.SetVariable('PFK_KABINETID', frmMain.odsKab.FieldByName('FK_ID').AsInteger);
end;

end.
