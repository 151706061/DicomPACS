unit fZakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, ExtCtrls, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxBar, ActnList, ImgList, OracleData, cxImageComboBox, cxSplitter, Oracle,
  dxSkinOffice2007Green;

type
  TfrmZakl = class(TForm)
    dsTree: TDataSource;
    odsTree: TOracleDataSet;
    odsTreeFK_ID: TFloatField;
    odsTreeFC_NAME: TStringField;
    odsTreeFK_OWNER: TFloatField;
    odsTreeCOUNTCHILD: TFloatField;
    IL1: TImageList;
    IL2: TImageList;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbSet: TdxBarButton;
    al: TActionList;
    aSet: TAction;
    dxBarDockControl1: TdxBarDockControl;
    bbCancel: TdxBarButton;
    aCancel: TAction;
    cxGrid1: TcxGrid;
    TVTREE: TcxGridDBTableView;
    TVIMAGE: TcxGridDBColumn;
    TVFC_NAME: TcxGridDBColumn;
    TVFK_OWNER: TcxGridDBColumn;
    VTREEColumn1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure aSetExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure TVTREECellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVTREEFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TVTREEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmZakl: TfrmZakl;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmZakl.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmZakl.aSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmZakl.FormCreate(Sender: TObject);
begin
  if odsTree.Active = False then
    odsTree.Active := True;  
end;

procedure TfrmZakl.TVTREECellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
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

procedure TfrmZakl.TVTREEFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  aSet.Enabled := odsTree.FieldByName('FK_ID').AsInteger <> -2;
end;

procedure TfrmZakl.TVTREEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var id : Integer;
    ods : TOracleDataSet;
begin
  if Key = VK_RETURN then
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
end;

end.
