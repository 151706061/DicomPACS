unit fSetDoobsl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, dxBar, DB,
  OracleData, ActnList, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxClasses, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TfrmSetDoobsl = class(TForm)
    dxBM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    actlstOkCancel: TActionList;
    dsListDoobsl: TDataSource;
    odsDoobsl: TOracleDataSet;
    TVDOOBSL: TcxGridDBTableView;
    cxGrDoobslLevel1: TcxGridLevel;
    cxGrDoobsl: TcxGrid;
    dxBMBar1: TdxBar;
    bbSet: TdxBarButton;
    bbCancel: TdxBarButton;
    actSet: TAction;
    actCancel: TAction;
    TVDOOBSLNAME: TcxGridDBColumn;
    procedure actSetExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure TVDOOBSLKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TVDOOBSLCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetDoobsl: TfrmSetDoobsl;

implementation

{$R *.dfm}

procedure TfrmSetDoobsl.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;                              
procedure TfrmSetDoobsl.actSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetDoobsl.TVDOOBSLCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetDoobsl.TVDOOBSLKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ModalResult := mrOk;
end;

end.
