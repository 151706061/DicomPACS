unit fSetValue;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, Menus,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, OracleData, cxTextEdit, cxContainer, cxLabel,
  ExtCtrls, dxSkinOffice2007Green;

type
  TfrmSetValue = class(TForm)
    tvList: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    al: TActionList;
    aOk: TAction;
    aEsc: TAction;
    tvListName: TcxGridDBColumn;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    teFilter: TcxTextEdit;
    Panel2: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aEscExecute(Sender: TObject);
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
    Russian : HKL;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetValue: TfrmSetValue;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetValue.aEscExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetValue.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetValue.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
end;

procedure TfrmSetValue.FormShow(Sender: TObject);
begin
  teFilter.SetFocus;
end;

procedure TfrmSetValue.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmSetValue.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmSetValue.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  odsList.Filtered := False;
  if length(teFilter.Text) > 0 then
    begin
      odsList.Filter := 'fc_upper = ''*' + AnsiUpperCase(teFilter.Text) + '*'' ';
      odsList.Filtered := True;
    end;
  aOk.Enabled := odsList.RecordCount <> 0;    
end;

procedure TfrmSetValue.tvListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOkExecute(nil);
end;

procedure TfrmSetValue.tvListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    aOkExecute(nil);
end;

end.
