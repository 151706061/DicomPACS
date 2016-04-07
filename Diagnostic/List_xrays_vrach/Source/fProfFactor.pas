unit fProfFactor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinOffice2007Green, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ActnList, OracleData;

type
  TfrmProfFactor = class(TForm)
    tvList: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    Panel1: TPanel;
    bClose: TcxButton;
    al: TActionList;
    aClose: TAction;
    tvListKod: TcxGridDBColumn;
    tvListName: TcxGridDBColumn;
    tvListFak: TcxGridDBColumn;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    pmGrid: TPopupMenu;
    N1: TMenuItem;
    procedure aCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DoShowForm(nNazID, nPacID : Integer);
    { Public declarations }
  end;

var
  frmProfFactor: TfrmProfFactor;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmProfFactor.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmProfFactor.DoShowForm(nNazID, nPacID: Integer);
begin
  odsList.Close;
  odsList.SetVariable('PNAZID', nNazID);
  odsList.SetVariable('PACID', nPacID);
  odsList.Open;
end;

procedure TfrmProfFactor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tvList.StoreToRegistry('\SoftWare\SoftMaster\List_xrays_vrach\fProfFactor\TVListVrach_' + IntToStr(frmMain.pSOTRID), True, [], 'tvList');
end;

procedure TfrmProfFactor.FormCreate(Sender: TObject);
begin
  tvList.StoreToRegistry('\SoftWare\SoftMaster\List_xrays_vrach\fProfFactor\tvListVrach_' + IntToStr(frmMain.pSOTRID)+'Default', True, [], 'tvList');
  tvList.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_vrach\fProfFactor\tvListVrach_' + IntToStr(frmMain.pSOTRID), False, False, [], 'tvList');
end;

procedure TfrmProfFactor.N1Click(Sender: TObject);
begin
  tvList.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_vrach\fProfFactor\TVListVrach_' + IntToStr(frmMain.pSOTRID)+'Default', False, False, [], 'tvList');
end;

end.
