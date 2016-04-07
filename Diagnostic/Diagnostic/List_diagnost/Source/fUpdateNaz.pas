unit fUpdateNaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, ExtCtrls, Menus, cxLookAndFeelPainters, cxButtons,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ActnList,
  OracleData;

type
  TfrmUpdateNaz = class(TForm)
    paFilter: TPanel;
    Label1: TLabel;
    teFilter: TcxTextEdit;
    bClear: TcxButton;
    tvList: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    Panel1: TPanel;
    bOk: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    cxButton1: TcxButton;
    dsList: TDataSource;
    odsList: TOracleDataSet;
    tvListName: TcxGridDBColumn;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure odsListBeforeOpen(DataSet: TDataSet);
    procedure tvListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure teFilterClick(Sender: TObject);
    procedure teFilterEnter(Sender: TObject);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpdateNaz: TfrmUpdateNaz;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmUpdateNaz.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmUpdateNaz.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmUpdateNaz.bClearClick(Sender: TObject);
begin
  teFilter.Text := '';
  odsList.Filtered := False;
end;

procedure TfrmUpdateNaz.FormCreate(Sender: TObject);
begin
  if odsList.Active = False then
    odsList.Active := True;
end;

procedure TfrmUpdateNaz.odsListBeforeOpen(DataSet: TDataSet);
begin
  odsList.SetVariable('pfk_sotrid', frmMain.pSOTRID);
end;

procedure TfrmUpdateNaz.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
end;

procedure TfrmUpdateNaz.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
end;

procedure TfrmUpdateNaz.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  odsList.Filtered := False;
  if length(teFilter.Text) > 0 then
    begin
      odsList.Filter := 'namenaz = ''*' + AnsiLowerCase(teFilter.Text) + '*'' ';
      odsList.Filtered := True;
      bClear.Enabled := True;
    end else
      bClear.Enabled := False;
  if odsList.recordCount > 0 then
    begin
       teFilter.Style.Font.Color := clBlack;
       aOk.Enabled := True;
    end else
    begin
       teFilter.Style.Font.Color := clRed;
       aOk.Enabled := False;
    end;
end;

procedure TfrmUpdateNaz.tvListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOkExecute(nil);
end;

procedure TfrmUpdateNaz.tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then
    aOkExecute(nil);
end;

end.
