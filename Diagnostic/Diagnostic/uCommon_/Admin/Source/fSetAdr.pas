unit fSetAdr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList,
  dxSkinsCore, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, OracleData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxContainer, cxLabel, cxTextEdit,
  dxSkinCaramel, dxSkinOffice2007Green;

type
  TfrmSetAdr = class(TForm)
    Panel1: TPanel;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    bOk: TcxButton;
    cxButton1: TcxButton;
    cxLabel1: TcxLabel;
    lbAdr: TcxLabel;
    TVSTREET: TcxGridDBTableView;
    grStreetLevel1: TcxGridLevel;
    grStreet: TcxGrid;
    ds: TDataSource;
    ods: TOracleDataSet;
    VSTREET_NAME: TcxGridDBColumn;
    VSTREET_PREFIX: TcxGridDBColumn;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    teHouse: TcxTextEdit;
    teHall: TcxTextEdit;
    cxLabel2: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure TVSTREETCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure teHousePropertiesChange(Sender: TObject);
    procedure teHallPropertiesChange(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    sStreet : String;
    { Public declarations }
  end;

var
  frmSetAdr: TfrmSetAdr;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetAdr.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetAdr.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetAdr.FormCreate(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
  if ods.Active = False then
    ods.Active := True;
end;

procedure TfrmSetAdr.teHallPropertiesChange(Sender: TObject);
begin
  lbAdr.Caption := sStreet+' '+teHouse.Text+' '+teHall.Text;
end;

procedure TfrmSetAdr.teHousePropertiesChange(Sender: TObject);
begin
  lbAdr.Caption := sStreet+' '+teHouse.Text+' '+teHall.Text;
end;

procedure TfrmSetAdr.TVSTREETCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  lbAdr.Tag := ods.FieldByName('fk_id').AsInteger;
  sStreet := ods.FieldByName('fc_name').AsString;
  lbAdr.Caption := sStreet+' '+teHouse.Text+' '+teHall.Text;
  aOk.Enabled := True;
end;

end.
