unit fKem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, cxButtons, OracleData,
  ActnList, cxTextEdit, cxContainer, cxLabel, ExtCtrls, dxSkinsCore, dxSkinscxPCPainter;

type
  TfrmSetKem = class(TForm)
    al: TActionList;
    aOK: TAction;
    aCancel: TAction;
    ds: TDataSource;
    ods: TOracleDataSet;
    grChar: TcxGrid;
    TVKEM: TcxGridDBTableView;
    VNAME: TcxGridDBColumn;
    grCharLevel1: TcxGridLevel;
    paFilter: TPanel;
    cxLabel1: TcxLabel;
    teFilter: TcxTextEdit;
    bClear: TcxButton;
    aClear: TAction;
    Panel1: TPanel;
    bOk: TcxButton;
    cxButton1: TcxButton;
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TVKEMCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVKEMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure aClearExecute(Sender: TObject);
    procedure teFilterClick(Sender: TObject);
    procedure teFilterEnter(Sender: TObject);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetKem: TfrmSetKem;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmSetKem.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetKem.aClearExecute(Sender: TObject);
begin
  teFilter.Text := '';
  ods.Filtered := False;
  aOK.Enabled := True;
end;

procedure TfrmSetKem.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetKem.FormCreate(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
  if ods.Active = False then
    ods.Active := True;
end;

procedure TfrmSetKem.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
end;

procedure TfrmSetKem.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
end;

procedure TfrmSetKem.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ods.Filtered := False;
  if length(teFilter.Text) > 0 then
    begin
      ods.Filter := 'fc_name_up = ''*' + teFilter.Text + '*'' ';
      ods.Filtered := True;
      aClear.Enabled := True;
    end else
    begin
      aClear.Enabled := False;
    end;
  if ods.RecordCount > 0 then
    begin
      aOK.Enabled := True;
      teFilter.Style.Font.Color := clBlack;
    end else
    begin
      aOK.Enabled := False;
      teFilter.Style.Font.Color := clRed;
    end;
end;

procedure TfrmSetKem.TVKEMCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOKExecute(nil);
end;

procedure TfrmSetKem.TVKEMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    aOKExecute(nil);
end;

end.
