unit fSetQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxGraphics, Menus, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, Oracle, OracleData;

type
  TfrmSetQ = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    lcbQ: TcxLookupComboBox;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    odsQ: TOracleDataSet;
    dsQ: TDataSource;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DoShowForm(nNazID : Integer);
    { Public declarations }
  end;

var
  frmSetQ: TfrmSetQ;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetQ.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetQ.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetQ.DoShowForm(nNazID: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select fk_smid from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_QUALITY'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, nNazID);                
    ods.Open;
    lcbQ.EditValue := ods.FieldByName('fk_smid').AsInteger;
  finally
    ods.Free;
  end;
end;

procedure TfrmSetQ.FormCreate(Sender: TObject);
begin
  if odsQ.Active = False then
    odsQ.Active := True;
end;

end.
