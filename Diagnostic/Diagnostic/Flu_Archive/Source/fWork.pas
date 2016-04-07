unit fWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls,
  cxLabel, cxContainer, cxTextEdit, OracleData, dxSkinsCore,
  dxSkinOffice2007Green, dxSkinscxPCPainter;

type
  TfrmWork = class(TForm)
    tvWork: TcxGridDBTableView;
    grWorkLevel1: TcxGridLevel;
    grWork: TcxGrid;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    FilterText: TcxTextEdit;
    cxLabel1: TcxLabel;
    odsWork: TOracleDataSet;
    dsWork: TDataSource;
    tvWorkName: TcxGridDBColumn;
    bbClear: TcxButton;
    Panel2: TPanel;
    bbOk: TcxButton;
    bbCancel: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FilterTextKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FilterTextClick(Sender: TObject);
    procedure FilterTextEnter(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure tvWorkKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tvWorkCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    Russian : HKL;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWork: TfrmWork;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmWork.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmWork.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmWork.bbClearClick(Sender: TObject);
begin
  FilterText.Text := '';
  odsWork.Filtered := false;
end;

procedure TfrmWork.FilterTextClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmWork.FilterTextEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmWork.FilterTextKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
//var nLink: Integer;
begin
  odsWork.Filtered := False;
  if length(FilterText.Text) > 0 then
    begin
      odsWork.Filter := 'fc_name = ''*' + AnsiUpperCase(FilterText.Text) + '*'' ';
      odsWork.Filtered := True;
    end;

  if odsWork.RecordCount > 0 then
    begin
      FilterText.Style.Font.Color := clMenuHighlight;
      aOk.Enabled := True;
    end else
    begin
      FilterText.Style.Font.Color := clRed;
      aOk.Enabled := False;
    end;
end;

procedure TfrmWork.FormCreate(Sender: TObject);
begin
  if odsWork.Active = False then
    odsWork.Active := True;
  russian:=LoadKeyboardLayout('00000419', 0);    
end;

procedure TfrmWork.tvWorkCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOkExecute(nil);
end;

procedure TfrmWork.tvWorkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    begin
      if odsWork.RecordCount > 0 then
        aOkExecute(nil);
    end;
end;

end.
