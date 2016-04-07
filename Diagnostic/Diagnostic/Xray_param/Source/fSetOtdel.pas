unit fSetOtdel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, dxBar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, ActnList, OracleData, dxSkinOffice2007Green, Medotrade;

type
  TfrmSetOtdel = class(TForm)
    actlstOkCancel: TActionList;
    actSet: TAction;
    actCancel: TAction;
    dxBM: TdxBarManager;
    dxBMBar1: TdxBar;
    bbSet: TdxBarButton;
    bbCancel: TdxBarButton;
    cxGrOtdel: TcxGrid;
    TVOTDEL: TcxGridDBTableView;
    TVOTDELNAME: TcxGridDBColumn;
    cxGrOtdelLevel1: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    odsOtdel: TOracleDataSet;
    dsOtdel: TDataSource;
    procedure actSetExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure TVOTDELCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVOTDELKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetOtdel: TfrmSetOtdel;

implementation

{$R *.dfm}

procedure TfrmSetOtdel.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetOtdel.actSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetOtdel.TVOTDELCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetOtdel.TVOTDELKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ModalResult := mrOk;
end;

end.
