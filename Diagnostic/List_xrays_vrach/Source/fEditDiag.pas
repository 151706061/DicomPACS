unit fEditDiag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxCheckBox, cxDBLookupComboBox,
  dxSkinsDefaultPainters, cxVGrid, cxControls,
  cxMemo, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ActnList, cxEdit, dxSkinsCore, cxInplaceContainer, DB, OracleData,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, ExtCtrls;

type
  TfrmEditDiag = class(TForm)
    vGrFilters: TcxVerticalGrid;
    catProp: TcxCategoryRow;
    rowShowIB: TcxEditorRow;
    rowVyavlen: TcxEditorRow;
    rowName: TcxEditorRow;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    odsVyavlen: TOracleDataSet;
    dsVyavlen: TDataSource;
    Panel1: TPanel;
    bSave: TcxButton;
    bCancel: TcxButton;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditDiag: TfrmEditDiag;

implementation

{$R *.dfm}

procedure TfrmEditDiag.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEditDiag.aSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmEditDiag.FormCreate(Sender: TObject);
begin
  if odsVyavlen.Active = False then
    odsVyavlen.Active := True;
end;

end.
