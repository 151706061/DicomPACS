unit fSetPers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinCaramel, dxSkinOffice2007Green,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls,
  Menus, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, OracleData,
  cxTextEdit, cxContainer, cxLabel;

type
  TfrmSetPers = class(TForm)
    Panel1: TPanel;
    tvList: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    Panel2: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    dsList: TDataSource;
    odsList: TOracleDataSet;
    tvListName: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    teFilter: TcxTextEdit;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure teFilterClick(Sender: TObject);
    procedure teFilterEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetPers: TfrmSetPers;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetPers.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetPers.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetPers.FormCreate(Sender: TObject);
begin
  if odsList.Active = False then
    odsList.Active := True;
end;

procedure TfrmSetPers.FormShow(Sender: TObject);
begin
  teFilter.SetFocus;
end;

procedure TfrmSetPers.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetPers.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetPers.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  odsList.Filter := 'fc_name_low = ''*' + teFilter.Text + '*'' ';
  odsList.Filtered := True;
  if odsList.RecordCount > 0 then
    begin
      aOk.Enabled := True;
      teFilter.Style.Font.Color := clBlack;
    end else
    begin
      aOk.Enabled := False;
      teFilter.Style.Font.Color := clRed;
    end;
end;

procedure TfrmSetPers.tvListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aOk.Enabled = True then
    aOkExecute(nil);
end;

procedure TfrmSetPers.tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) and (aOk.Enabled = True) then
    aOkExecute(nil);
end;

end.
