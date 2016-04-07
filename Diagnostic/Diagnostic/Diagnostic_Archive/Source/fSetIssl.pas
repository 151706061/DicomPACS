unit fSetIssl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinOffice2007Green, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, ExtCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList, OracleData, cxTextEdit,
  cxContainer, cxLabel;

type
  TfrmSetIssl = class(TForm)
    tvList: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    bSet: TcxButton;
    bCancel: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    tvListName: TcxGridDBColumn;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    cxLabel1: TcxLabel;
    teFilter: TcxTextEdit;
    bClear: TcxButton;
    aClear: TAction;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure teFilterClick(Sender: TObject);
    procedure teFilterEnter(Sender: TObject);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure aClearExecute(Sender: TObject);
    procedure odsListBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetIssl: TfrmSetIssl;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetIssl.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetIssl.aClearExecute(Sender: TObject);
begin
  teFilter.Text := '';
  odsList.Filtered := False;
  aOK.Enabled := True;
end;

procedure TfrmSetIssl.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetIssl.FormCreate(Sender: TObject);
begin
  if odsList.Active = False then
    odsList.Active := True;
end;

procedure TfrmSetIssl.FormShow(Sender: TObject);
begin
  teFilter.SetFocus;  
end;

procedure TfrmSetIssl.odsListBeforeOpen(DataSet: TDataSet);
begin
  odsList.SetVariable('psotrid', frmMain.pSOTRID);
end;

procedure TfrmSetIssl.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
end;

procedure TfrmSetIssl.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
end;

procedure TfrmSetIssl.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  odsList.Filtered := False;
  if length(teFilter.Text) > 0 then
    begin
      odsList.Filter := 'fc_name_up = ''*' + teFilter.Text + '*'' ';
      odsList.Filtered := True;
      aClear.Enabled := True;
    end else
    begin
      aClear.Enabled := False;
    end;
  if odsList.RecordCount > 0 then
    begin
      aOK.Enabled := True;
      teFilter.Style.Font.Color := clBlack;
    end else
    begin
      aOK.Enabled := False;
      teFilter.Style.Font.Color := clRed;
    end;
end;

procedure TfrmSetIssl.tvListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOkExecute(nil);
end;

procedure TfrmSetIssl.tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_return) and (aOk.Enabled = True) then
    aOkExecute(nil);
end;

end.
  