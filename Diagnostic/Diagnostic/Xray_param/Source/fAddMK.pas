unit fAddMK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxCheckBox, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxTextEdit, cxContainer, cxLabel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ActnList, OracleData, dxBar,
  dxSkinsCore, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  ExtCtrls;

type
  TfrmAddMK = class(TForm)
    BM: TdxBarManager;
    dsList: TDataSource;
    odsList: TOracleDataSet;
    odsListFL_CHECK: TFloatField;
    odsListFC_NAME: TStringField;
    odsListFC_NAME_UP: TStringField;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    aCheckAll: TAction;
    aUnCheckAll: TAction;
    grList: TcxGrid;
    tvList: TcxGridDBTableView;
    tvListCheck: TcxGridDBColumn;
    tvListName: TcxGridDBColumn;
    tvListID: TcxGridDBColumn;
    grListLevel1: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    odsListFK_ID: TFloatField;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    teFilter: TcxTextEdit;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure teFilterClick(Sender: TObject);
    procedure teFilterEnter(Sender: TObject);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aCheckAllExecute(Sender: TObject);
    procedure aUnCheckAllExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddMK: TfrmAddMK;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmAddMK.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddMK.aCheckAllExecute(Sender: TObject);
var i : Integer;
begin
  for i := 0 to tvList.DataController.RecordCount - 1 do
    begin
      tvList.DataController.Values[i, tvListCheck.Index] := 1;
    end;
end;

procedure TfrmAddMK.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmAddMK.aUnCheckAllExecute(Sender: TObject);
var i : Integer;
begin
  for i := 0 to tvList.DataController.RecordCount - 1 do
    begin
      tvList.DataController.Values[i, tvListCheck.Index] := 0;
    end;
end;

procedure TfrmAddMK.FormCreate(Sender: TObject);
begin
  if odsList.Active = False then
    odsList.Active := True;
end;

procedure TfrmAddMK.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmAddMK.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmAddMK.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  odsList.Filtered := True;
  odsList.Filter := 'fc_name_up = ''*' + teFilter.Text + '*'' ';
end;

end.
