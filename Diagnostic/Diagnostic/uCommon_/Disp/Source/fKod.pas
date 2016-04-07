unit fKod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, DB, OracleData, Oracle, jvDBUtils, JvComponentBase,
  JvFormPlacement, ActnList, ImgList, cxGraphics, Registry;

type
  TfrmKod = class(TForm)
    jvFrmStor: TJvFormStorage;
    paTop: TPanel;
    cxLabel1: TcxLabel;
    teKod: TcxTextEdit;
    paBottom: TPanel;
    bEnter: TcxButton;
    bCancel: TcxButton;
    al: TActionList;
    aClose: TAction;
    aOk: TAction;
    cxButton3: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure teKodKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure teKodKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    pClientID : Integer;
    { Private declarations }
  public
    procedure DoShowForm(idClient : Integer);
    { Public declarations }
  end;

var
  frmKod: TfrmKod;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmKod.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmKod.aOkExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.ts_client set fc_kod = :pfc_kod where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfc_kod', otString, teKod.Text);
    oq.DeclareAndSet('pfk_id', otInteger, pClientID);
    oq.Execute;
    frmMain.os.Commit;
    frmMain.odsJur.AfterScroll := nil;
    RefreshQuery(frmMain.odsJur);
    frmMain.odsJur.AfterScroll := frmMain.odsJurAfterScroll;
    frmMain.odsJurAfterScroll(nil);
  finally
    oq.Free;
  end;
  close;
end;

procedure TfrmKod.cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfrmKod.DoShowForm(idClient: Integer);
begin
  pClientID := idClient;
end;

procedure TfrmKod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmKod.FormDestroy(Sender: TObject);
begin
  frmKod := nil;
end;

procedure TfrmKod.teKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      if teKod.Text <> '' then
        aOkExecute(nil);
    end;
end;

procedure TfrmKod.teKodKeyPress(Sender: TObject; var Key: Char);
begin
if teKod.Focused then
  begin
    if Key = ' ' then
      begin
        Key := #0;
        teKod.Text := teKod.Text + ' ';
      end;
    if Key in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '"', '¹', ';', ':', '?', '=', '\', '/', '.', ',', '>', '<', '|', '[', ']', '{', '}'] then
      begin
        Key := #0;
      end;
  end;
end;

end.
