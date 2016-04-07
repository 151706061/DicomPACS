unit fSetSotr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList, OracleData, dxSkinsCore,
  dxSkinOffice2007Green, dxSkinscxPCPainter, ExtCtrls;

type
  TfrmSetSotr = class(TForm)
    tvSotr: TcxGridDBTableView;
    grSotrLevel1: TcxGridLevel;
    grSotr: TcxGrid;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    dsSotr: TDataSource;
    odsSotr: TOracleDataSet;
    tvSotrFio: TcxGridDBColumn;
    tvSotrSpec: TcxGridDBColumn;
    Panel1: TPanel;
    bbOk: TcxButton;
    bbCancel: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvSotrCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvSotrKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    procedure DoShowForm(nOtdelID : Integer);
    { Public declarations }
  end;

var
  frmSetSotr: TfrmSetSotr;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetSotr.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetSotr.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetSotr.DoShowForm(nOtdelID: Integer);
begin
  odsSotr.Close;
  odsSotr.SetVariable('pfk_otdelid', nOtdelID);
  odsSotr.Open;
end;

procedure TfrmSetSotr.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tvSotr.StoreToRegistry('\SoftWare\SoftMaster\EditTalon\fSetSotr\tvSotrVrach_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'tvSotr');
end;

procedure TfrmSetSotr.FormCreate(Sender: TObject);
begin
  tvSotr.RestoreFromRegistry('\SoftWare\SoftMaster\EditTalon\fSetSotr\tvSotrVrach_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'tvSotr');
//  if odsSotr.Active = False then
//    odsSotr.Active := True;  
end;

procedure TfrmSetSotr.tvSotrCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOkExecute(nil);
end;

procedure TfrmSetSotr.tvSotrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    aOkExecute(nil);
end;

end.
