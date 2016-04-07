unit fNumAbonent;

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
  JvFormPlacement, ImgList, cxGraphics, ActnList, Registry;

type
  TfrmNumAbonent = class(TForm)
    odsKod: TOracleDataSet;
    jvFrmStor: TJvFormStorage;
    al: TActionList;
    aClose: TAction;
    aOk: TAction;
    paTop: TPanel;
    cxLabel1: TcxLabel;
    teNum: TcxTextEdit;
    lbKod: TcxLabel;
    paBottom: TPanel;
    bCancel: TcxButton;
    bEnter: TcxButton;
    cxButton3: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure teNumKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure teNumKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure bClearMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure aCloseExecute(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure teNumPropertiesChange(Sender: TObject);
  private
    pJurID : Integer;
    sPhone : string;
    { Private declarations }
  public
    procedure DoShowForm(idJur : Integer; pPhone : string);
    { Public declarations }
  end;

var
  frmNumAbonent: TfrmNumAbonent;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmNumAbonent.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmNumAbonent.aOkExecute(Sender: TObject);
var oq : TOracleQuery;
    ods : TOracleDataSet;
    idClient : Integer;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  oq.Cursor := crSQLWait;
  ods := TOracleDataSet.Create(nil);
  ods.Session := frmMain.os;
  ods.Cursor := crSQLWait;
  try
//-- update tjournal устанавливаем номер абонента для записи в журнале
    oq.SQL.Text := ' update taxi.tjournal set fc_num = :pfc_num where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfc_num', otString, teNum.Text);
    oq.DeclareAndSet('pfk_id', otInteger, pJurID);
    oq.Execute;
//-- проверяем существует ли такой абонент в нашей БД
    ods.SQL.Text := ' select fk_id from taxi.ts_client where fc_num = :pfc_num ';
    ods.DeclareAndSet('pfc_num', otString, teNum.Text);
    ods.Open;
    idClient := ods.FieldByName('fk_id').AsInteger;
    if ods.RecordCount = 0 then // если такого абонента нет, то добавляем его и привязываем к нему номер телефона
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' declare '+#13+
                        '   pfk_id number; '+#13+
                        ' begin '+#13+
                        '   insert into taxi.ts_client(fc_num) values(:pfc_num) returning fk_id into pfk_id; '+#13+
                        '   insert into taxi.tphones(fk_clientid, fc_phone) values(pfk_id, :pfc_phone); '+#13+
                        ' end; ';
        ods.DeclareAndSet('pfc_num', otString, teNum.Text);
        ods.DeclareAndSet('pfc_phone', otString, sPhone);
        ods.Open;
      end else
      begin // если такой абонент уже есть, то привязываем к нему номер телефона (если этот номер новый для этого абонента)
        if sPhone <> '' then
          begin
            ods.DeleteVariables;
            ods.Close;
            ods.SQL.Text := ' merge into taxi.tphones using dual on (fc_phone = :pfc_phone) '+#13+
                            ' when not matched then insert(fk_clientid, fc_phone) values(:pfk_clientid, :pfc_phone) ';
            ods.DeclareAndSet('pfk_clientid', otInteger, idClient);
            ods.DeclareAndSet('pfc_phone', otString, sPhone);
            ods.Open;
          end else
          begin
            ods.DeleteVariables;
            ods.Close;
            ods.SQL.Text := ' merge into taxi.tphones using dual on (fc_phone = :pfc_phone) '+#13+
                            ' when not matched then insert(fk_clientid, fc_phone) values(:pfk_clientid, :pfc_phone) ';
            ods.DeclareAndSet('pfk_clientid', otInteger, idClient);
            ods.DeclareAndSet('pfc_phone', otString, '-'+IntToStr(idClient));
            ods.Open;
            oq.DeleteVariables;
            oq.SQL.Text := ' update taxi.tjournal set fc_phone = :pfc_phone where fk_id = :pfk_id ';
            oq.DeclareAndSet('pfc_phone', otString, '-'+IntToStr(idClient));
            oq.DeclareAndSet('pfk_id', otInteger, pJurID);
            oq.Execute;
          end;
      end;
    frmMain.os.Commit;
    frmMain.odsJur.AfterScroll := nil;
    RefreshQuery(frmMain.odsJur);
    frmMain.odsJur.AfterScroll := frmMain.odsJurAfterScroll;
    if frmMain.odsJur.FieldByName('fk_id').AsInteger = pJurID then
      begin
        frmMain.bNumAb.Caption := teNum.Text;
        frmMain.bKod.Caption := lbKod.Caption;
        frmMain.bKod.Enabled := True;
      end;
//    frmMain.odsJurAfterScroll(nil);  // !!! надо дизайблить или инайблить
  finally
    oq.Free;
    ods.Free;
  end;
  close;
end;

procedure TfrmNumAbonent.bClearMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  teNum.Clear;
  odsKod.Close;
  lbKod.Caption := '';
end;

procedure TfrmNumAbonent.cxButton3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfrmNumAbonent.DoShowForm(idJur: Integer; pPhone: string);
begin
  pJurID := idJur;
  sPhone := pPhone;
end;

procedure TfrmNumAbonent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmNumAbonent.FormDestroy(Sender: TObject);
begin
  frmNumAbonent := nil;
end;

procedure TfrmNumAbonent.teNumKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      if teNum.Text <> '' then
        aOkExecute(nil);
    end;
  if Key = VK_F8 then
    begin
      teNum.Clear;
      lbKod.Caption := '';
    end;
end;

procedure TfrmNumAbonent.teNumKeyPress(Sender: TObject; var Key: Char);
begin
  if teNum.Focused then
    begin
      if Key = ' ' then
        begin
          Key := #0;
          teNum.Text := teNum.Text + ' ';
        end;
      if Key in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '"', '№', ';', ':', '?', '=', '\', '/', '.', ',', '>', '<', '|', '[', ']', '{', '}'] then
        begin
          Key := #0;
        end;
    end;
end;

procedure TfrmNumAbonent.teNumPropertiesChange(Sender: TObject);
begin
            odsKod.Close;
            odsKod.SetVariable('pfc_num', teNum.Text);
            odsKod.Open;
            lbKod.Caption := odsKod.FieldByName('fc_kod').AsString;
end;

end.
