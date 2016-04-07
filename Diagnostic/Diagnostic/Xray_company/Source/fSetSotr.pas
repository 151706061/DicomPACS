unit fSetSotr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, dxBar,
  cxClasses, ActnList, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, OracleData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxControls, cxGridCustomView, cxGrid;

type
  TfrmSetSotr = class(TForm)
    dxBM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    dxBMBar1: TdxBar;
    bbOk: TdxBarButton;
    bbCancel: TdxBarButton;
    actlst1: TActionList;
    actSet: TAction;
    actCancel: TAction;
    TVSOTR: TcxGridDBTableView;
    cxGrZavOtdelLevel1: TcxGridLevel;
    cxGrZavOtdel: TcxGrid;
    VSOTRFIO: TcxGridDBColumn;
    odsSotr: TOracleDataSet;
    dsSotr: TDataSource;
    VSOTRSPEC: TcxGridDBColumn;
    procedure actSetExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure TVSOTRDblClick(Sender: TObject);
    procedure TVSOTRKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetSotr: TfrmSetSotr;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetSotr.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetSotr.actSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetSotr.FormCreate(Sender: TObject);
begin
  if odsSotr.Active = False then
    odsSotr.Open;  
end;

procedure TfrmSetSotr.TVSOTRDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetSotr.TVSOTRKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ModalResult := mrOk;
end;

end.
