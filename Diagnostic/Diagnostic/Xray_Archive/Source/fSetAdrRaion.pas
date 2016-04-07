unit fSetAdrRaion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, ExtCtrls, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Menus, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  dxSkinsCore, dxSkinscxPCPainter, cxCheckBox;

type
  TfrmSetAdrRaion = class(TForm)
    dsList: TDataSource;
    odsList: TOracleDataSet;
    tvList: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    Panel1: TPanel;
    bSet: TcxButton;
    bCancel: TcxButton;
    al: TActionList;
    aSet: TAction;
    aCancel: TAction;
    tvListName: TcxGridDBColumn;
    grdbtvchk: TcxGridDBColumn;
    grdbtvid: TcxGridDBColumn;
    procedure aSetExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure odsListApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
      var NewRowId: string);
  private
    { Private declarations }
  public
    FSelectedRaion : string;
    { Public declarations }
  end;

var
  frmSetAdrRaion: TfrmSetAdrRaion;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetAdrRaion.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetAdrRaion.aSetExecute(Sender: TObject);
var
  i : integer;
begin
  SetLength(frmMain.ArrRaion, 0);
  FSelectedRaion := '';
  for i := 0 to tvList.DataController.RecordCount - 1 do
   begin
     if tvList.DataController.Values[i, grdbtvchk.index] = 1 then
      begin
        SetLength(frmMain.ArrRaion, length(frmMain.ArrRaion) + 1);
        frmMain.ArrRaion[high(frmMain.ArrRaion)] := tvList.DataController.Values[i, grdbtvid.index];
        if FSelectedRaion = '' then
          FSelectedRaion := tvList.DataController.Values[i, tvListName.index]
        else
          FSelectedRaion := FSelectedRaion + ',' + tvList.DataController.Values[i, tvListName.index];
      end;
   end;
  ModalResult := mrOk;
end;

procedure TfrmSetAdrRaion.FormCreate(Sender: TObject);
var
  i : integer;
begin
  if odsList.Active = False then
    odsList.Active := True;
  aSet.Enabled := odsList.RecordCount <> 0;
  try
    tvList.BeginUpdate;
    for I := 0 to Length(frmMain.ArrRaion) - 1 do
     begin
       if odsList.Locate('fk_id', frmMain.ArrRaion[i],[]) then
        begin
          odsList.Edit;
          odsList.FieldByName('chk').AsInteger := 1;
          odsList.post;
        end;
     end;
  finally
    odsList.first;
    tvList.EndUpdate;
  end;
end;

procedure TfrmSetAdrRaion.odsListApplyRecord(Sender: TOracleDataSet; Action: Char;
  var Applied: Boolean; var NewRowId: string);
begin
  applied := true;
end;

procedure TfrmSetAdrRaion.tvListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aSetExecute(nil);
end;

procedure TfrmSetAdrRaion.tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    aSetExecute(nil);
end;

end.
