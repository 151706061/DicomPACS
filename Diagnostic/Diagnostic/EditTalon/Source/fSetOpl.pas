unit fSetOpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ExtCtrls, OracleData, ActnList, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, dxSkinsCore, dxSkinOffice2007Green, dxSkinscxPCPainter;

type
  TfrmSetOpl = class(TForm)
    cxGr: TcxGrid;
    TV: TcxGridDBTableView;
    VNAME: TcxGridDBColumn;
    cxGrLevel1: TcxGridLevel;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    VDATEEND: TcxGridDBColumn;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure TVCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetOpl: TfrmSetOpl;

implementation

{$R *.dfm}

procedure TfrmSetOpl.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetOpl.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetOpl.TVCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOkExecute(nil);
end;

procedure TfrmSetOpl.TVKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    aOkExecute(nil);
end;

end.
