unit fSetOtdel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxInplaceContainer, cxDBTL, cxControls, cxTLData, DB, OracleData, Menus,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, ExtCtrls;

type
  TfrmSetOtdel = class(TForm)
    dsOtdel: TDataSource;
    odsOtdel: TOracleDataSet;
    tlOtdel: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure tlOtdelFocusedNodeChanged(Sender: TObject; APrevFocusedNode,
      AFocusedNode: TcxTreeListNode);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetOtdel: TfrmSetOtdel;

implementation

{$R *.dfm}

procedure TfrmSetOtdel.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetOtdel.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetOtdel.tlOtdelFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  if tlOtdel.FocusedNode.HasChildren <> True then
    aOK.Enabled := True
  else
    aOk.Enabled := False;
end;

procedure TfrmSetOtdel.FormCreate(Sender: TObject);
begin
  if odsOtdel.Active = False then
    odsOtdel.Active := True;
end;

end.
