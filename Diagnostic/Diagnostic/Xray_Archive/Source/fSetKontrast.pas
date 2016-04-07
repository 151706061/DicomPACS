unit fSetKontrast;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, cxGraphics,
  cxCustomData, cxStyles, cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL,
  cxControls, cxTLData, ImgList, ActnList, dxBar, cxClasses, DB, OracleData,
  cxCheckBox;

type
  TfrmSetKontrast = class(TForm)
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbOk: TdxBarButton;
    bbCancel: TdxBarButton;
    AL: TActionList;
    aOK: TAction;
    aCancel: TAction;
    IL: TImageList;
    cxTreeTypeKontrast: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    odsTypeKontrast: TOracleDataSet;
    dsTypeKontrast: TDataSource;
    tlcchk: TcxDBTreeListColumn;
    tlcid: TcxDBTreeListColumn;
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure cxTreeTypeKontrastDblClick(Sender: TObject);
    procedure cxTreeTypeKontrastKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure odsTypeKontrastApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
      var NewRowId: string);
  private
    { Private declarations }
  public
    FSelectedContrast : string;
    { Public declarations }
  end;

var
  frmSetKontrast: TfrmSetKontrast;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmSetKontrast.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetKontrast.aOKExecute(Sender: TObject);
var
  i : integer;
begin
  cxTreeTypeKontrast.DataController.PostEditingData;
  SetLength(frmMain.ArrContrast, 0);
  FSelectedContrast := '';
  for i := 0 to cxTreeTypeKontrast.DataController.RecordCount - 1 do
   begin
     if cxTreeTypeKontrast.DataController.Values[i, tlcchk.ItemIndex] = 1 then
      begin
        SetLength(frmMain.ArrContrast, length(frmMain.ArrContrast) + 1);
        frmMain.ArrContrast[high(frmMain.ArrContrast)] := cxTreeTypeKontrast.DataController.Values[i, tlcid.ItemIndex];
        if FSelectedContrast = '' then
          FSelectedContrast := cxTreeTypeKontrast.DataController.Values[i, cxDBTreeList1cxDBTreeListColumn1.itemindex]
        else
          FSelectedContrast := FSelectedContrast + ',' + cxTreeTypeKontrast.DataController.Values[i, cxDBTreeList1cxDBTreeListColumn1.itemindex];
      end;
   end;
  ModalResult := mrOk;
end;

procedure TfrmSetKontrast.cxTreeTypeKontrastDblClick(Sender: TObject);
begin
  aOKExecute(nil);
end;

procedure TfrmSetKontrast.cxTreeTypeKontrastKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    aOKExecute(nil);
end;

procedure TfrmSetKontrast.FormCreate(Sender: TObject);
var
  i : integer;
begin
  if odsTypeKontrast.Active = False then
    odsTypeKontrast.Active := True;
  try
    cxTreeTypeKontrast.BeginUpdate;
    for I := 0 to Length(frmMain.ArrContrast) - 1 do
     begin
       if odsTypeKontrast.Locate('fk_id', frmMain.ArrContrast[i],[]) then
        begin
          odsTypeKontrast.Edit;
          odsTypeKontrast.FieldByName('chk').AsInteger := 1;
          odsTypeKontrast.post;
        end;
     end;
  finally
    odsTypeKontrast.first;
    cxTreeTypeKontrast.EndUpdate;
  end;
end;

procedure TfrmSetKontrast.odsTypeKontrastApplyRecord(Sender: TOracleDataSet; Action: Char;
  var Applied: Boolean; var NewRowId: string);
begin
  applied := true;
end;

end.
