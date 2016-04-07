unit fSetGlavVrach;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxSkinsdxBarPainter, OracleData, dxBar, cxClasses, ActnList,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxControls, cxGridCustomView, cxGrid;

type
  TfrmSetGlavVrach = class(TForm)
    cxGrZavOtdel: TcxGrid;
    TVGLAVVRACH: TcxGridDBTableView;
    VGLAVVRACHFIO: TcxGridDBColumn;
    cxGrZavOtdelLevel1: TcxGridLevel;
    actlst1: TActionList;
    actSet: TAction;
    actCancel: TAction;
    dxBM: TdxBarManager;
    dxBMBar1: TdxBar;
    bbOk: TdxBarButton;
    bbCancel: TdxBarButton;
    odsGlavVrach: TOracleDataSet;
    dsGlavVrach: TDataSource;
    dxBarDockControl1: TdxBarDockControl;
    VGLAVVRACHNAMESPEC: TcxGridDBColumn;
    procedure actSetExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure TVGLAVVRACHKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TVGLAVVRACHCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetGlavVrach: TfrmSetGlavVrach;

implementation

{$R *.dfm}

procedure TfrmSetGlavVrach.actCancelExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmSetGlavVrach.actSetExecute(Sender: TObject);
begin
  ModalResult := MrOK;
end;

procedure TfrmSetGlavVrach.TVGLAVVRACHCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetGlavVrach.TVGLAVVRACHKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ModalResult := mrOk;
end;

end.

