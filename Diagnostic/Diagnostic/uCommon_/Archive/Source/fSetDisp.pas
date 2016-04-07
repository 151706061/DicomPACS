unit fSetDisp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxStyles, dxSkinsCore, dxSkinCaramel, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit, cxContainer, cxLabel,
  ActnList, OracleData, dxSkinOffice2007Green;

type
  TfrmSetDisp = class(TForm)
    Panel1: TPanel;
    tvList: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    tvListName: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    teFilter: TcxTextEdit;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    dsList: TDataSource;
    odsList: TOracleDataSet;
    Panel2: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure teFilterClick(Sender: TObject);
    procedure teFilterEnter(Sender: TObject);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tvListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetDisp: TfrmSetDisp;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetDisp.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetDisp.aSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetDisp.FormCreate(Sender: TObject);
begin
  if odsList.Active = False then
    odsList.Active := True;
end;

procedure TfrmSetDisp.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetDisp.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetDisp.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  odsList.Filter := 'fc_fam_up = ''*' + teFilter.Text + '*'' ';
  odsList.Filtered := True;
  aSave.Enabled := odsList.RecordCount <> 0;
end;

procedure TfrmSetDisp.tvListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if odsList.RecordCount > 0 then
    aSaveExecute(nil);
end;

procedure TfrmSetDisp.tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if odsList.RecordCount > 0 then
    begin
      if key = VK_RETURN then
        aSaveExecute(nil);
    end;
end;

end.
