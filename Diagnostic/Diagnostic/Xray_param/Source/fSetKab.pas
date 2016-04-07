unit fSetKab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Menus,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, OracleData, dxSkinsCore, dxSkinscxPCPainter,
  ExtCtrls;

type
  TfrmSetKab = class(TForm)
    tvKab: TcxGridDBTableView;
    grKabLevel1: TcxGridLevel;
    grKab: TcxGrid;
    al: TActionList;
    aOk: TAction;
    aEsc: TAction;
    odsKab: TOracleDataSet;
    dsKab: TDataSource;
    tvKabColumn1: TcxGridDBColumn;
    Panel1: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aEscExecute(Sender: TObject);
    procedure tvKabCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvKabKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure DoShowForm(nSotrID : Integer);
    { Public declarations }
  end;

var
  frmSetKab: TfrmSetKab;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetKab.aEscExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetKab.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmSetKab.DoShowForm(nSotrID: Integer);
begin
  odsKab.Close;
  odsKab.SetVariable('pfk_sotrid', nSotrID);
  odsKab.Open;
end;

procedure TfrmSetKab.tvKabCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOkExecute(nil);
end;

procedure TfrmSetKab.tvKabKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    aOkExecute(nil);
end;

end.
