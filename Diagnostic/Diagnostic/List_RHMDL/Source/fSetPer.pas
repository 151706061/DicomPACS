unit fSetPer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxControls,
  cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit, DB, OracleData, ActnList,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TfrmSetPer = class(TForm)
    tlList: TcxDBTreeList;
    tlListcxDBTreeListColumn1: TcxDBTreeListColumn;
    dsList: TDataSource;
    odsList: TOracleDataSet;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure tlListFocusedNodeChanged(Sender: TObject; APrevFocusedNode,
      AFocusedNode: TcxTreeListNode);
    procedure tlListDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DoShowForm(sSyn : String);
    { Public declarations }
  end;

var
  frmSetPer: TfrmSetPer;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetPer.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetPer.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetPer.DoShowForm(sSyn: String);
begin
  odsList.Close;
  odsList.SetVariable('pfc_synonim', sSyn);
  odsList.Open;
  tlList.FullExpand;  
end;

procedure TfrmSetPer.tlListDblClick(Sender: TObject);
begin
  if aOk.Enabled then
    aOkExecute(nil);
end;

procedure TfrmSetPer.tlListFocusedNodeChanged(Sender: TObject; APrevFocusedNode,
  AFocusedNode: TcxTreeListNode);
begin
  if AFocusedNode.HasChildren = True then
    aOk.Enabled := False
  else
    aOk.Enabled := True;  
end;

end.
