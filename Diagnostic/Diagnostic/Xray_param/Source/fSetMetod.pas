unit fSetMetod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Menus,
  cxLookAndFeelPainters, OracleData, StdCtrls, cxButtons, ActnList, dxSkinsCore,
  dxSkinscxPCPainter, ExtCtrls, cxTextEdit, cxContainer,
  cxLabel;

type
  TfrmSetMetod = class(TForm)
    TVMETOD: TcxGridDBTableView;
    grMetodLevel1: TcxGridLevel;
    grMetod: TcxGrid;
    VMETOD_NAME: TcxGridDBColumn;
    dsMetod: TDataSource;
    odsMetod: TOracleDataSet;
    al: TActionList;
    aSet: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    bSet: TcxButton;
    bCancel: TcxButton;
    cxLabel1: TcxLabel;
    teFilter: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure aSetExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure TVMETODCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVMETODKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure teFilterClick(Sender: TObject);
    procedure teFilterEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetMetod: TfrmSetMetod;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetMetod.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetMetod.aSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetMetod.FormCreate(Sender: TObject);
begin
  if odsMetod.Active = False then
    odsMetod.Active := True;
end;

procedure TfrmSetMetod.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetMetod.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetMetod.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  odsMetod.Filtered := False;
  if length(teFilter.Text) > 0 then
    begin
      odsMetod.Filter := 'lower_name = ''*' + teFilter.Text + '*'' ';
      odsMetod.Filtered := True;
    end;
  if odsMetod.RecordCount > 0 then
    begin
      aSet.Enabled := True;
      teFilter.Style.Font.Color := clBlack;
    end else
    begin
      aSet.Enabled := False;
      teFilter.Style.Font.Color := clRed;
    end;
end;

procedure TfrmSetMetod.TVMETODCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aSetExecute(nil);
end;

procedure TfrmSetMetod.TVMETODKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    aSetExecute(nil);
end;

end.
