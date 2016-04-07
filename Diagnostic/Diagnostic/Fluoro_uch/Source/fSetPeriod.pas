unit fSetPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, ActnList,
  ImgList, dxBar, cxClasses, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, OracleData,
  cxGridLevel, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxSkinOffice2007Green, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls;

type
  TfrmSetPeriod = class(TForm)
    al: TActionList;
    aOK: TAction;
    aCancel: TAction;
    TV: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    ds: TDataSource;
    ods: TOracleDataSet;
    VNAME: TcxGridDBColumn;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure TVCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure DoShowForm(nTag : Integer);
    { Public declarations }
  end;

var
  frmSetPeriod: TfrmSetPeriod;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetPeriod.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetPeriod.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetPeriod.DoShowForm(nTag : Integer);
begin
  if ods.Active = False then
    ods.Open;
  if nTag <> 0 then
    begin
      ods.Locate('FK_ID', nTag, []);
    end; 
end;

procedure TfrmSetPeriod.TVCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetPeriod.TVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      ModalResult := mrOk;
    end;
end;

end.
