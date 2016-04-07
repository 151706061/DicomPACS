unit uNeedMove;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, Oracle, uTaxiPanel,
  ActnList;

type
  TfrmNeedMove = class(TForm)
    Shape1: TShape;
    lbCap: TcxLabel;
    bEnter: TcxButton;
    bCancel: TcxButton;
    oqJur: TOracleQuery;
    ActionList1: TActionList;
    aOK: TAction;
    aCancel: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DriverId:Integer;
    Prev_syn:string;
    PlaceId:Integer;
    Journal_id:string;
    OS:TOracleSession;
    CommonPanel:TCommonPanel;
  end;

implementation

{$R *.dfm}

procedure TfrmNeedMove.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmNeedMove.aOKExecute(Sender: TObject);
begin
  ChangeTaxiEventCommon(Os, DriverId, Prev_syn, PlaceId, Journal_id);
  with oqJur do
  begin
    Session := os;
    SetVariable('placeid',PlaceId);
    SetVariable('pjurid',Journal_id);
    Execute;
    Session.Commit;
  end;
  if (CommonPanel<>nil) then
  begin
    if (CommonPanel.TaxiPanel<>nil) then
    begin
      CommonPanel.TaxiPanel.RefreshAllOds;
    end;
  end;
  Close;
end;

procedure TfrmNeedMove.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmNeedMove.FormCreate(Sender: TObject);
begin
  //BorderStyle := bsNone;
end;

end.
