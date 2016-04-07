unit fSetPhone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvComponentBase, JvFormPlacement, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, oracle, jvDBUtils, ActnList, cxMaskEdit;

type
  TfrmSetPhone = class(TForm)
    jvFrmStor: TJvFormStorage;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    aTab: TAction;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    meVvod: TcxMaskEdit;
    cxButton3: TcxButton;
    Panel2: TPanel;
    bEnter: TcxButton;
    cxButton12: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure meVvodKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure meVvodPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure meVvodKeyPress(Sender: TObject; var Key: Char);
    procedure aTabExecute(Sender: TObject);
    procedure cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    nJurID : Integer;
    { Private declarations }
  public
    procedure DoShowForm(pJurID : Integer);
    { Public declarations }
  end;

var
  frmSetPhone: TfrmSetPhone;

implementation

uses fMain, fSetAdr1;

{$R *.dfm}

{ TfrmSetPhone }

procedure TfrmSetPhone.aCancelExecute(Sender: TObject);
begin
  close;
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
end;

procedure TfrmSetPhone.aOkExecute(Sender: TObject);
var oq : TOracleQuery;
    id : Integer;
begin
  if frmSetPhone.Caption = 'Номер телефона' then // корректируем номер телефона
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update taxi.tjournal set fc_phone=taxi.get_phone_without_kodtown(:pfc_phone), fc_phone_full=:pfc_phone_full where fk_id = :pfk_id ';
        if meVvod.Text = '' then
          begin
            oq.DeclareAndSet('pfc_phone', otString, 'б/н');
            oq.DeclareAndSet('pfc_phone_full', otString, 'б/н');
          end else
          begin
            oq.DeclareAndSet('pfc_phone', otString, meVvod.Text);
            oq.DeclareAndSet('pfc_phone_full', otString, meVvod.Text);
          end;
        oq.DeclareAndSet('pfk_id', otInteger, nJurID);
        oq.Execute;
        frmMain.os.Commit;
        frmMain.odsJur.AfterScroll := nil;
        RefreshQuery(frmMain.odsJur);
        frmMain.odsJur.AfterScroll := frmMain.odsJurAfterScroll;
        frmMain.odsJurAfterScroll(nil);
      finally
        oq.Free;
        close;
        frmMain.VJOURNAL_DATEIN.Focused := True;
        frmMain.grJournal.SetFocus;
      end;
    end;
  if frmSetPhone.Caption = 'Добавить новый заказ' then // добавляем новый заказ
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' insert into taxi.tjournal(fd_datein, fn_sos, fc_phone, fc_phone_full, fk_clientid, fk_sotrid, fk_taxiid) '+#13+
                       ' values(sysdate, 9, taxi.get_phone_without_kodtown(:pfc_phone), :pfc_phone_full, '+#13+
                       '        (select max(fk_clientid) from taxi.tphones where fc_phone = taxi.get_phone_without_kodtown(:pfc_phone)), :pfk_sotrid, :pfk_taxiid) ';
        if meVvod.Text = '' then
          begin
            oq.DeclareAndSet('pfc_phone', otString, 'б/н');
            oq.DeclareAndSet('pfc_phone_full', otString, 'б/н');
          end else
          begin
            oq.DeclareAndSet('pfc_phone', otString, meVvod.Text);
            oq.DeclareAndSet('pfc_phone_full', otString, meVvod.Text);
          end;
        oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
        oq.DeclareAndSet('pfk_taxiid', otInteger, frmMain.pTaxiID);
        oq.Execute;
        frmMain.os.Commit;
        frmMain.odsJur.AfterScroll := nil;
        id := frmMain.odsJur.FieldByName('fk_id').AsInteger;
        RefreshQuery(frmMain.odsJur);
        frmMain.odsJur.Locate('fk_id', id, []);
        if frmMain.odsJur.RecordCount = 1 then
          begin
            frmMain.DoEnableAdr1;
            frmMain.DoEnableAdr2;
          end;

        if frmMain.intAutoShowAdr = 1 then // если стоит настройка "Автоматически выводить окно адреса", то выводим окно адреса
          begin
            if Assigned(frmSetAdr1) then
              begin
                frmSetAdr1.pTypeShow := 1;
                frmSetAdr1.Show;
              end else
              begin
                Application.CreateForm(TfrmSetAdr1, frmSetAdr1);
                frmSetAdr1.pTypeShow := 1;
                frmSetAdr1.DoShowForm(frmMain.vJournal_ID.DataBinding.DataController.Values[0, frmMain.vJournal_ID.Index],
                                      frmMain.vJournal_FnStop.DataBinding.DataController.Values[0, frmMain.vJournal_FnStop.Index],
                                      frmMain.vJournal_FkRaionID.DataBinding.DataController.Values[0, frmMain.vJournal_FkRaionID.Index],
                                      frmMain.vJournal_FkTypeDetail.DataBinding.DataController.Values[0, frmMain.vJournal_FkTypeDetail.Index]);
                frmSetAdr1.Show;
              end;
          end;
      finally
        frmMain.odsJur.AfterScroll := frmMain.odsJurAfterScroll;
        oq.Free;
        close;
        frmMain.VJOURNAL_DATEIN.Focused := True;
        frmMain.grJournal.SetFocus;        
      end;
    end;
end;

procedure TfrmSetPhone.aTabExecute(Sender: TObject);
begin
  frmMain.sFormFocus := 'frmSetPhone';
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
end;

procedure TfrmSetPhone.cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfrmSetPhone.DoShowForm(pJurID: Integer);
begin
  nJurID := pJurID;
end;

procedure TfrmSetPhone.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmSetPhone.FormDestroy(Sender: TObject);
begin
  frmSetPhone := nil;
end;

procedure TfrmSetPhone.FormShow(Sender: TObject);
begin
  meVvod.SetFocus;
  meVvod.SelLength := 0;
  meVvod.SelStart := Length(meVvod.Text);
end;

procedure TfrmSetPhone.meVvodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    begin
//      if meVvod.Text <> '' then
        aOkExecute(nil);
    end;
  if key = vk_down then
    begin
      bEnter.SetFocus;
    end;
end;

procedure TfrmSetPhone.meVvodKeyPress(Sender: TObject; var Key: Char);
begin
  if (Length(meVvod.Text) = 11) and (key <> #8) then
    begin
      key := #0;
      exit;
    end;
end;

procedure TfrmSetPhone.meVvodPropertiesChange(Sender: TObject);
begin
//  aOk.Enabled := meVvod.Text <> '';
end;

end.
