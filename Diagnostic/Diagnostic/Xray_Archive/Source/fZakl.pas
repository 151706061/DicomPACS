unit fZakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, ExtCtrls, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxBar, ActnList, ImgList, OracleData, cxImageComboBox, cxSplitter, Oracle, Registry;

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
    VIEWKAB: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    Panel1: TPanel;
    cxSplitter1: TcxSplitter;
    cxGrid1: TcxGrid;
    TVTREE: TcxGridDBTableView;
    TVIMAGE: TcxGridDBColumn;
    TVFC_NAME: TcxGridDBColumn;
    TVFK_OWNER: TcxGridDBColumn;
    VTREEColumn1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    bbCancel: TdxBarButton;
    aCancel: TAction;
    dsKab: TDataSource;
    odsKab: TOracleDataSet;
    VIEWKAB_NAME: TcxGridDBColumn;
    Action1: TAction;
    procedure aSetExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure odsKabBeforeOpen(DataSet: TDataSet);
    procedure odsKabAfterScroll(DataSet: TDataSet);
    procedure TVTREECellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVTREEFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TVTREEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure DoShowForm;
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

procedure TfrmZakl.DoShowForm;
var Reg : TRegIniFile;
     id : Integer;
begin
  Reg:=TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\Softmaster\Xray_Archive\ID_SOTR'+IntToStr(frmMain.pSOTRID), True);
    id := Reg.ReadInteger('\Software\Softmaster\Xray_Archive\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_KABINET', 0);
    odsKab.AfterScroll := nil;
    if odsKab.Active = False then
      odsKab.Open;
    if id <> 0 then
      odsKab.Locate('FK_ID', id, []);
    odsKab.AfterScroll := odsKabAfterScroll;
    odsKabAfterScroll(nil);
  finally
    Reg.Free;
  end;
end;

procedure TfrmZakl.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    if not Reg.OpenKey('\Software\Softmaster\Xray_Archive\', FALSE) then
      begin
        Reg.CreateKey('\Software\Softmaster\Xray_Archive');
      end;
    try
      Reg.WriteInteger('\Software\Softmaster\Xray_Archive'+'\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_KABINET', odsKab.FieldByName('FK_ID').AsInteger);
    except
    end;
  finally
    Reg.Free;
  end;
end;

procedure TfrmZakl.odsKabAfterScroll(DataSet: TDataSet);
begin
  odsTree.Close;
  odsTree.SetVariable('PFK_KABINETID', odsKab.FieldByName('FK_ID').AsInteger);
  odsTree.Open;
end;

procedure TfrmZakl.odsKabBeforeOpen(DataSet: TDataSet);
begin
  odsKab.SetVariable('PSOTR', frmMain.pSOTRID);
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
