unit fSetRaion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, OracleData,
  dxSkinCaramel, dxSkinCoffee, dxSkinOffice2007Green;

type
  TfrmSetRaion = class(TForm)
    tvList: TcxGridDBTableView;
    grListRaionLevel1: TcxGridLevel;
    grListRaion: TcxGrid;
    odsRaion: TOracleDataSet;
    dsRaion: TDataSource;
    tvListColumn1: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure tvListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetRaion: TfrmSetRaion;

implementation
uses fSetAdr2;
{$R *.dfm}

procedure TfrmSetRaion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmSetRaion.FormDestroy(Sender: TObject);
begin
  frmSetRaion := nil;
end;

procedure TfrmSetRaion.tvListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if Assigned(frmSetAdr2) then
    begin
      frmSetAdr2.teRaion.Tag := frmSetRaion.odsRaion.FieldByName('fk_id').AsInteger;
      frmSetAdr2.teRaion.Text := frmSetRaion.odsRaion.FieldByName('fc_name').AsString;
      frmSetRaion.Close;
      frmSetAdr2.aOk.Enabled := True;
    end;
end;

procedure TfrmSetRaion.tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Assigned(frmSetAdr2) then
    begin
      frmSetAdr2.teRaion.Tag := frmSetRaion.odsRaion.FieldByName('fk_id').AsInteger;
      frmSetAdr2.teRaion.Text := frmSetRaion.odsRaion.FieldByName('fc_name').AsString;
      frmSetRaion.Close;
      frmSetAdr2.aOk.Enabled := True;
    end;
end;

end.
