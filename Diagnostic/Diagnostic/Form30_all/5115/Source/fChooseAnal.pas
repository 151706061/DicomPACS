unit fChooseAnal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, ImgList, ActnList, cxClasses, DB, OracleData, cxGraphics,
  cxCustomData, cxStyles, cxTL, cxControls, cxInplaceContainer, cxTLData, cxDBTL,
  cxMaskEdit, cxCheckBox, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TfrmChooseAnal = class(TForm)
    dsNaz: TDataSource;
    odsNazCheck: TOracleDataSet;
    odsNazCheckFL_CHECK: TFloatField;
    odsNazCheckFK_ID: TFloatField;
    odsNazCheckFC_NAME: TStringField;
    odsNazCheckFK_OWNER: TFloatField;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbSave: TdxBarButton;
    bbCancel: TdxBarButton;
    bbSetAll: TdxBarButton;
    bbUnsetAll: TdxBarButton;
    bbSet: TdxBarButton;
    bbUnset: TdxBarButton;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    aSetAll: TAction;
    aUnsetAll: TAction;
    aDelFilter: TAction;
    aSet: TAction;
    aUnSet: TAction;
    IL: TImageList;
    dxBarDockControl1: TdxBarDockControl;
    cxTreeNaz: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aSetExecute(Sender: TObject);
    procedure aUnSetExecute(Sender: TObject);
    procedure aSetAllExecute(Sender: TObject);
    procedure aUnsetAllExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChooseAnal: TfrmChooseAnal;

implementation

uses fMetodics;

{$R *.dfm}

procedure TfrmChooseAnal.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmChooseAnal.aSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmChooseAnal.aSetAllExecute(Sender: TObject);
begin
  try
    Cursor := crSQLWait;
    odsNazCheck.First;
    while not odsNazCheck.Eof do
      begin
        if odsNazCheck.FieldByName('FL_CHECK').AsInteger <> 1 then
          begin
            odsNazCheck.Edit;
            odsNazCheck.FieldByName('FL_CHECK').AsInteger:=1;
          end;
        odsNazCheck.Next;
      end;
    odsNazCheck.First;
  finally
    Cursor := crArrow;
  end;
end;

procedure TfrmChooseAnal.aSetExecute(Sender: TObject);
begin
  if odsNazCheck.FieldByName('FL_CHECK').AsInteger <> 1 then
    begin
      odsNazCheck.Edit;
      odsNazCheck.FieldByName('FL_CHECK').AsInteger:=1;
    end;
end;

procedure TfrmChooseAnal.aUnsetAllExecute(Sender: TObject);
begin
  try
    Cursor := crSQLWait;
    odsNazCheck.First;
    while not odsNazCheck.Eof do
      begin
        if odsNazCheck.FieldByName('FL_CHECK').AsInteger <> 0 then
          begin
            odsNazCheck.Edit;
            odsNazCheck.FieldByName('FL_CHECK').AsInteger:=0;
          end;
        odsNazCheck.Next;
      end;
    odsNazCheck.First;
  finally
    Cursor := crArrow;
  end;
end;

procedure TfrmChooseAnal.aUnSetExecute(Sender: TObject);
begin
  if odsNazCheck.FieldByName('FL_CHECK').AsInteger <> 0 then
    begin
      odsNazCheck.Edit;
      odsNazCheck.FieldByName('FL_CHECK').AsInteger:=0;
    end;
end;

procedure TfrmChooseAnal.FormShow(Sender: TObject);
var arrID : array of Integer;
    i, j, k : Integer;
begin
  if frmMetodics.odsMetodics.RecordCount = 0 then
    SetLength(arrID, 100)
  else
    SetLength(arrID, frmMetodics.odsMetodics.RecordCount);
  frmMetodics.odsMetodics.First;
  i:=0;
  while not frmMetodics.odsMetodics.EOF do
    begin
      arrId[i]:=frmMetodics.odsMetodics.FieldByName('FK_SMID').AsInteger;
      frmMetodics.odsMetodics.Next;
      i:=i+1;
    end;

  for i:=0 to odsNazCheck.RecordCount-1 do
    begin
      k:=odsNazCheck.FieldByName('FK_ID').AsInteger;
      for j:=0 to odsNazCheck.RecordCount-1 do
        begin
          if k = arrID[j] then
          begin
            odsNazCheck.Edit;
            odsNazCheck.FieldByName('FL_CHECK').AsInteger:=1;
          end;
        end;
      odsNazCheck.Next;
    end;
  odsNazCheck.First;
  cxTreeNaz.FullCollapse;  
end;

end.
