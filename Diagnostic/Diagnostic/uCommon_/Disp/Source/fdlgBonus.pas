unit fdlgBonus;

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
  cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, Oracle, ActnList,
  JvComponentBase, JvFormPlacement;

type
  TdlgBonus = class(TForm)
    Panel1: TPanel;
    lbCap: TcxLabel;
    Panel2: TPanel;
    bEnter: TcxButton;
    bCancel: TcxButton;
    cxButton3: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    JvFormStorage1: TJvFormStorage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
  private
    { Private declarations }
  public
    idJur, idClient, idDrv : Integer; 
    { Public declarations }
  end;

var
  dlgBonus: TdlgBonus;

implementation
uses fMain;
{$R *.dfm}

procedure TdlgBonus.aCancelExecute(Sender: TObject);
begin
  close;
end;

procedure TdlgBonus.aOkExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.SQL.Text := ' update taxi.ts_client set fn_bonus = fn_bonus - 1 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, idClient);
    oq.Execute;
    oq.SQL.Text := ' update taxi.tjournal set fl_bonus = 1 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, idJur);
    oq.Execute;
    oq.SQL.Text := ' update taxi.ts_drivers set fn_besplatcnt = fn_besplatcnt + 1 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, idDrv);
    oq.Execute;
    frmMain.os.Commit;
    if idJur = frmMain.odsJur.FieldByName('fk_id').AsInteger then
      begin
        frmMain.bBonus.Caption := IntToStr(StrToInt(frmMain.bBonus.Caption) - 1);
        frmMain.bBonus.Enabled := frmMain.bBonus.Caption <> '-1';
      end;
    close;
  finally
    oq.Free;
  end;
end;

procedure TdlgBonus.cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TdlgBonus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TdlgBonus.FormDestroy(Sender: TObject);
begin
  dlgBonus := nil;
end;

procedure TdlgBonus.FormShow(Sender: TObject);
begin
  bEnter.SetFocus;
end;

end.
