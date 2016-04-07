unit fChoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, OracleData, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, dxSkinsdxBarPainter, dxSkinOffice2007Green;

type
  TfrmChoice = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    bbSet: TdxBarButton;
    bbClose: TdxBarButton;
    actlstOkCancel: TActionList;
    actOk: TAction;
    actClose: TAction;
    TV: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    VNAME: TcxGridDBColumn;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    procedure actOkExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure TVDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmChoice: TfrmChoice;

implementation

{$R *.dfm}

procedure TfrmChoice.actOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmChoice.actCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmChoice.DoShowForm;
begin
  if odsList.Active = False then
    odsList.Open;
end;

procedure TfrmChoice.TVDblClick(Sender: TObject);
begin
  actOkExecute(nil);
end;

end.
