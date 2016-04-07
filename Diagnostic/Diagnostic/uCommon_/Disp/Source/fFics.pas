unit fFics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvComponentBase, JvFormPlacement, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, dxSkinsCore, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, Oracle, jvDBUtils, DB,
  OracleData, cxCheckBox, ActnList, ImgList, cxGraphics, Registry, 
  cxTimeEdit, dxSkinCaramel, dxSkinOffice2007Green, cxMaskEdit, cxSpinEdit,
  dxSkinBlack, dxSkinBlue, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue;

type
  TfrmFics = class(TForm)
    JvFormStorage1: TJvFormStorage;
    odsSysDate: TOracleDataSet;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    aTab: TAction;
    paTop: TPanel;
    cxLabel1: TcxLabel;
    paBottom: TPanel;
    teTime: TcxTimeEdit;
    cxButton3: TcxButton;
    bEnter: TcxButton;
    cxButton12: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure aTabExecute(Sender: TObject);
    procedure cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure teTimeClick(Sender: TObject);
    procedure teTimeEnter(Sender: TObject);
    procedure teTimeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure teTimeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure teTimePropertiesChange(Sender: TObject);
  private
    pJurID : Integer;
    pDown : Boolean;
    { Private declarations }
  public
    procedure DoShowForm(nJurID : Integer);
    { Public declarations }
  end;

var
  frmFics: TfrmFics;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmFics.aCancelExecute(Sender: TObject);
begin
  close;
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;  
end;

procedure TfrmFics.aOkExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  odsSysDate.Close;
  odsSysDate.Open;
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fd_datef = :pfd_datef where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfd_datef', otDate, StrToDateTime(FormatDateTime('dd.mm.yyyy', odsSysDate.FieldByName('sysdate').AsDateTime)+frmFics.teTime.Text));
    oq.DeclareAndSet('pfk_id', otInteger, pJurID);
    oq.Execute;
    frmMain.os.Commit;
    frmMain.odsJur.AfterScroll := nil;
    frmMain.teFics.Properties.OnChange := nil;
    RefreshQuery(frmMain.odsJur);
    frmMain.odsJur.AfterScroll := frmMain.odsJurAfterScroll;
    frmMain.teFics.Time := frmMain.odsJur.FieldByName('fd_datef').AsDateTime;
    frmMain.teFics.Properties.OnChange := teTimePropertiesChange;
    close;
  finally
    oq.Free;
  end;
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
end;

procedure TfrmFics.aTabExecute(Sender: TObject);
begin
  frmMain.sFormFocus := 'frmFics';
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
end;

procedure TfrmFics.cxButton3MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfrmFics.DoShowForm(nJurID: Integer);
begin
  pJurID := nJurID;
end;

procedure TfrmFics.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmFics.FormDestroy(Sender: TObject);
begin
  frmFics := nil;
end;

procedure TfrmFics.FormShow(Sender: TObject);
begin
  pDown := False;
end;

procedure TfrmFics.teTimeClick(Sender: TObject);
begin
  frmFics.teTime.SelLength := 0;
  frmFics.teTime.SelStart := Length(frmFics.teTime.Text);
end;

procedure TfrmFics.teTimeEnter(Sender: TObject);
begin
  frmFics.teTime.SelLength := 0;
  frmFics.teTime.SelStart := Length(frmFics.teTime.Text);
end;

procedure TfrmFics.teTimeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_F2) then
    begin
      aOkExecute(nil);
    end;
  if (Key = VK_UP) and (pDown = False) then
    begin
      pDown := True;
      frmFics.teTime.SelLength := 0;
      frmFics.teTime.SelStart := Length(frmFics.teTime.Text);
    end;
  if (Key = VK_DOWN) and (pDown = False) then
    begin
      pDown := True;
      frmFics.teTime.SelLength := 0;
      frmFics.teTime.SelStart := Length(frmFics.teTime.Text);
    end;
  if Key = VK_LEFT then
    begin
      pDown := True;
    end;
  if Key = VK_RIGHT then
    begin
      pDown := True;
    end;
end;

procedure TfrmFics.teTimeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  frmFics.teTime.SelLength := 0;
  frmFics.teTime.SelStart := Length(teTime.Text);
end;

procedure TfrmFics.teTimePropertiesChange(Sender: TObject);
begin
  if frmFics.teTime.Text = '00:00' then
    frmFics.aOk.Enabled := False
  else
    frmFics.aOk.Enabled := True;
end;

end.
