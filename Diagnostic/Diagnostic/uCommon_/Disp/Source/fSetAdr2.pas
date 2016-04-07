unit fSetAdr2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, Menus, cxLookAndFeelPainters, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, StdCtrls, ExtCtrls,
  cxClasses, cxControls, cxButtons, cxTextEdit, cxContainer, cxLabel, JvComponentBase,
  JvFormPlacement, ActnList, Oracle, jvDBUtils, dxSkinCaramel, dxSkinCoffee,
  dxSkinOffice2007Green;

type
  TfrmSetAdr2 = class(TForm)
    jvFrmStor: TJvFormStorage;
    al: TActionList;
    aClose: TAction;
    aOk: TAction;
    aTab: TAction;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    teRaion: TcxTextEdit;
    cxLabel2: TcxLabel;
    teDop: TcxTextEdit;
    Panel2: TPanel;
    bEnter: TcxButton;
    bCancel: TcxButton;
    cxButton3: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure teRaionPropertiesChange(Sender: TObject);
    procedure teRaionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aOkExecute(Sender: TObject);
    procedure aTabExecute(Sender: TObject);
    procedure teRaionExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure teRaionEnter(Sender: TObject);
    procedure teDopExit(Sender: TObject);
    procedure teDopEnter(Sender: TObject);
    procedure teDopKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    pJurID, pDrvID : Integer;
    sDateF : String;
    { Private declarations }
  public
    procedure DoShowForm(idJur, idDrv : Integer; pDateF : String);
    { Public declarations }
  end;

var
  frmSetAdr2: TfrmSetAdr2;

implementation

uses fMain, fSetRaion;

{$R *.dfm}

procedure TfrmSetAdr2.aCloseExecute(Sender: TObject);
begin
  close;
  if Assigned(frmSetRaion) then
    frmSetRaion.Close;
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus; 
end;

procedure TfrmSetAdr2.aOkExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal '+#13+
                   '    set fc_adr2 = :pfc_adr2, fk_adr2id = :pfk_adr2id '+#13+
                   '  where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfc_adr2', otString, teRaion.Text+' '+teDop.Text);
    oq.DeclareAndSet('pfk_adr2id', otInteger, teRaion.Tag);
    oq.DeclareAndSet('pfk_id', otInteger, pJurID);
    oq.Execute;
    oq.DeleteVariables;
    oq.SQL.Text := ' merge into taxi.tjuradr2 using dual on (fk_jurid = :pfk_jurid) '+#13+
                   ' when matched then update set fc_adr = :pfc_adr, fc_dop = :pfc_dop where fk_jurid = :pfk_jurid '+#13+
                   ' when not matched then insert(fk_jurid, fc_adr, fc_dop) values(:pfk_jurid, :pfc_adr, :pfc_dop) ';
    oq.DeclareAndSet('pfk_jurid', otInteger, pJurID);
    oq.DeclareAndSet('pfc_adr', otString, teRaion.Text);
    oq.DeclareAndSet('pfc_dop', otString, teDop.Text);
    oq.Execute;
    if sDateF <> '' then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into taxi.tdriverevent(fk_driver, fk_place, fk_journal, fk_drivereventtype) '+#13+
                       ' values(:pfk_driver, :pfk_place, :pfk_journal, '+#13+
                       '        (select fk_id from taxi.ts_drivereventtype where fc_synonym = ''START_CLIENT_MOVE'')) ';
        oq.DeclareAndSet('pfk_place', otInteger, teRaion.Tag);
        oq.DeclareAndSet('pfk_driver', otInteger, pDrvID);
        oq.DeclareAndSet('pfk_journal', otInteger, pJurID);
        oq.Execute;
      end;
    frmMain.os.Commit;
    frmMain.odsJur.AfterScroll := nil;
    RefreshQuery(frmMain.odsJur);
    frmMain.odsJur.AfterScroll := frmMain.odsJurAfterScroll;
    frmMain.DoVisibleLastRas;
  finally
    oq.Free;
  end;
  close;
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
end;

procedure TfrmSetAdr2.aTabExecute(Sender: TObject);
begin
  frmMain.sFormFocus := 'frmSetAdr2';
  if Assigned(frmSetRaion) and (frmSetRaion.Visible = True) then
    begin
      frmSetRaion.Hide;
    end;
  frmSetAdr2.AlphaBlend := True;
  frmSetAdr2.AlphaBlendValue := 150;
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
end;

procedure TfrmSetAdr2.cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfrmSetAdr2.DoShowForm(idJur, idDrv: Integer; pDateF: String);
begin
  pJurID := idJur;
  pDrvID := idDrv;
  sDateF := pDateF;
end;

procedure TfrmSetAdr2.FormActivate(Sender: TObject);
begin
  frmSetAdr2.AlphaBlend := False;
end;

procedure TfrmSetAdr2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmSetAdr2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Assigned(frmSetRaion) then
    frmSetRaion.Close;
end;

procedure TfrmSetAdr2.FormCreate(Sender: TObject);
begin
  aOk.Enabled := False;
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetAdr2.FormDestroy(Sender: TObject);
begin
  frmSetAdr2 := nil;
end;

procedure TfrmSetAdr2.teDopEnter(Sender: TObject);
begin
  teDop.Style.BorderColor := clMaroon;
end;

procedure TfrmSetAdr2.teDopExit(Sender: TObject);
begin
  teDop.Style.BorderColor := clTeal;
end;

procedure TfrmSetAdr2.teDopKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_up then // вверх
    begin
      teRaion.SetFocus;
    end;
  if key = vk_down then // вниз
    begin
      teRaion.SetFocus;
    end;
  if key = vk_return then
    begin
      aOkExecute(nil);
    end;
end;

procedure TfrmSetAdr2.teRaionEnter(Sender: TObject);
begin
  teRaion.Style.BorderColor := clMaroon;
end;

procedure TfrmSetAdr2.teRaionExit(Sender: TObject);
begin
  if Assigned(frmSetRaion) and (frmSetRaion.Visible = True) then
    begin
      frmSetRaion.Hide;
    end;
  teRaion.Style.BorderColor := clTeal;  
end;

procedure TfrmSetAdr2.teRaionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Assigned(frmSetRaion) and (frmSetRaion.Visible = True) then
    begin
      if key = 38 then // вверх
        begin
          frmSetRaion.tvList.DataController.GotoPrev;
        end;
      if key = 40 then // вниз
        begin
          frmSetRaion.tvList.DataController.GotoNext;
        end;
      if Key = vk_return then // enter 13
        begin
          teRaion.Tag := frmSetRaion.odsRaion.FieldByName('fk_id').AsInteger;
          teRaion.Text := frmSetRaion.odsRaion.FieldByName('fc_name').AsString;
          frmSetRaion.Close;
          aOk.Enabled := True;
        end;
    end else
    begin
      if key = vk_up then // вверх
        begin
          teDop.SetFocus;
        end;
      if key = vk_down then // вниз
        begin
          teDop.SetFocus;
        end;
      if Key = vk_return then
        begin
          if aOK.Enabled = True then
            begin
              aOkExecute(nil);
            end;
        end;
    end;
end;

procedure TfrmSetAdr2.teRaionPropertiesChange(Sender: TObject);
begin
  if Assigned(frmSetRaion) then
    begin
      frmSetRaion.Show;
    end else
    begin
      Application.CreateForm(TfrmSetRaion, frmSetRaion);
      frmSetRaion.Show;
    end;
  frmSetRaion.Top := frmSetAdr2.Top+35;
  frmSetRaion.Left := frmSetAdr2.Left+143;
  frmSetRaion.odsRaion.Close;
  frmSetRaion.odsRaion.SetVariable('p', teRaion.Text);
  frmSetRaion.odsRaion.Open;
  teRaion.SetFocus;
  teRaion.SelLength := 0;
  teRaion.SelStart := Length(teRaion.Text);
  if teRaion.Text = '' then
    begin
      teRaion.Tag := 0;
      aOk.Enabled := False;
    end;
end;

end.
