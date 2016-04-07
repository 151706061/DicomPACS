unit uConfirmAction;

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
  cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, Oracle, uTaxiPanel;

type
  TfrmConfirmAction = class(TForm)
    Shape1: TShape;
    lbCap: TcxLabel;
    bEnter: TcxButton;
    bCancel: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bEnterClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DriverId:Integer;
    EventSyn:string;
    OS:TOracleSession;
    commonpanel:TCommonPanel;
  end;

implementation

uses uMain;

{$R *.dfm}

procedure TfrmConfirmAction.bCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfirmAction.bEnterClick(Sender: TObject);
begin
  ChangeTaxiEventCommon(Os, DriverId, EventSyn, null, null);
  if (commonpanel<>nil) then
  begin
    commonpanel.RefreshAllOds();
    with frmMain.odsNotOnLine do
    begin
      Close;
      Open;
      Locate('fk_id',DriverId,[]);
    end;

  end;
  Close;
end;

procedure TfrmConfirmAction.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
