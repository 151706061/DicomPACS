unit fLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, Menus, cxLookAndFeelPainters,
  cxImage, StdCtrls, cxButtons, cxTextEdit, cxControls, cxContainer,
  cxEdit, cxLabel, ExtCtrls, ActnList, cxGraphics, cxDropDownEdit,
  Registry, StrUtils, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, Oracle, OracleData, uMD5, cxDBLookupComboBox,
  DB, cxLookupEdit, cxDBLookupEdit, cxMaskEdit, IniFiles;

type
  TfrmLogin = class(TForm)
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    cxImage1: TcxImage;
    lbCapsLock: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    tePass: TcxTextEdit;
    bEnter: TcxButton;
    bCancel: TcxButton;
    cxLabel3: TcxLabel;
    odsTaxi: TOracleDataSet;
    dsTaxi: TDataSource;
    lcbTaxi: TcxLookupComboBox;
    Shape1: TShape;
    cxLabel4: TcxLabel;
    cbLogin: TcxComboBox;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure alUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tePassClick(Sender: TObject);
    procedure tePassEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbLoginEnter(Sender: TObject);
    procedure cbLoginClick(Sender: TObject);
    procedure cbLoginPropertiesCloseUp(Sender: TObject);
    procedure cbLoginPropertiesChange(Sender: TObject);
  private
    Ini : TIniFile;
    Russian : HKL;
    nTry : Integer;
    Fos:TOracleSession;
    FAutoSavePass:Integer;
    { Private declarations }
  public
    pSOTRID : Integer;
    sUserName : string;
    procedure Init(Aos:TOracleSession; AAutoSavePass:Integer);
    { Public declarations }
  end;

  function GetLogin(Aos:TOracleSession; AAutoSavePass:Integer; var ATaxiId:Integer; var ASotrId:Integer; var ASotrFio:string;
                    var aTaxiName:string; var aPriceKm:integer; var aSynTaxi : string;
                    var aCostTalonCar : Double; var aCostTalonMin : Double):Boolean;

implementation

{$R *.dfm}

procedure TfrmLogin.aCancelExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.alUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  lbCapsLock.Visible := Odd(GetKeyState(VK_CAPITAL));
end;

procedure TfrmLogin.aOkExecute(Sender: TObject);
var ods : TOracleDataSet;
      i : Integer;
begin
//-->> 1. проверяем все ли поля заполнены
  if cbLogin.Text = '' then
    begin
      MessageDlg('Внимание!'+#13+#10+'Для входа в систему необходимо ввести пользователя!', mtWarning, [mbOK], 0);
      Exit;
    end;
  if tePass.Text = '' then
    begin
      MessageDlg('Внимание!'+#13+#10+'Для входа в систему необходимо ввести пароль!', mtWarning, [mbOK], 0);
      Exit;
    end;
//-->> 2. Проверяем авторизацию
  nTry := nTry + 1;
  if lcbTaxi.EditValue = 0 then
    begin
      MessageDlg('Внимание!'+#13+#10+'Для работы системы необходимо указать вид такси!', mtWarning, [mbOK], 0);
      lcbTaxi.SetFocus;
      exit;
    end;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := Fos;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select fk_id, fc_fam||'' ''||fc_name as fio from taxi.ts_sotr where upper(fc_login) = :pfc_login and fc_pass = :pfc_pass ';
    ods.DeclareAndSet('pfc_login', otString, cbLogin.Text);
    if FAutoSavePass = 1 then
      ods.DeclareAndSet('pfc_pass', otString, tePass.Text)
    else
      ods.DeclareAndSet('pfc_pass', otString, LeftStr(uMD5.MD5DigestToStr(MD5String(tePass.Text)),20));
    ods.Open;
    sUserName := ods.FieldByName('fio').AsString;
    pSOTRID := ods.FieldByName('fk_id').AsInteger;
    if ods.RecordCount > 0 then
      begin
// -- Логин
        for i := 0 to cbLogin.Properties.Items.Count - 1 do
          if cbLogin.Properties.Items[i] = cbLogin.Text then
            cbLogin.ItemIndex := i;
          if cbLogin.ItemIndex < 0 then
            cbLogin.ItemIndex := cbLogin.Properties.Items.Add(cbLogin.Text);
          Ini.WriteInteger('LOGIN', 'LastUser', cbLogin.ItemIndex);
          for i := 0 to cbLogin.Properties.Items.Count - 1 do
            Ini.WriteString('USRLIST', IntToStr(i), cbLogin.Properties.Items[i]);

        ModalResult := mrOk; // ВХОД В СИСТЕМУ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      end else
      begin
        if nTry <> 3 then
          begin
            tePass.Clear;
            tePass.SetFocus;
            MessageDlg('Отказано в доступе!'+#13+#10+'Проверьте правильность ввода логина и пароля!', mtError, [mbOK], 0); 
          end else
          begin
            MessageDlg('Попытка несанкционированного доступа!', mtError, [mbOK], 0); // исчерпаны 3 попытки
            Application.Terminate;
          end;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmLogin.cbLoginClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLogin.cbLoginEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLogin.cbLoginPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  if FAutoSavePass = 1 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := Fos;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select fc_pass from taxi.ts_sotr where upper(fc_login) = :pfc_login ';
        ods.DeclareAndSet('pfc_login', otString, cbLogin.Text);
        ods.Open;
        tePass.Text := ods.FieldByName('fc_pass').AsString;
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmLogin.cbLoginPropertiesCloseUp(Sender: TObject);
begin
  if tePass.Enabled then 
    tePass.SetFocus;
end;

procedure TfrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    if not Reg.OpenKey('\Software\TaxiService\Disp\', FALSE) then
      begin
        Reg.CreateKey('\Software\TaxiService\Disp');
      end;
    Reg.WriteString('\Software\TaxiService\Disp', 'ID_TAXI', lcbTaxi.EditValue);
  finally
    Reg.Free;
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  if cbLogin.Text <> '' then
    tePass.SetFocus;
  if FAutoSavePass = 1 then
    begin
      tePass.Enabled := False;
      bEnter.SetFocus;
    end;
end;

procedure TfrmLogin.Init(Aos: TOracleSession; AAutoSavePass: Integer);
var Reg : TRegIniFile;
     id : Integer;
    cTemp: TStrings;
    i: Integer;
    ods : TOracleDataSet;
begin
  Fos:=Aos;
  FAutoSavePass:=AAutoSavePass;
  nTry := 0;
  russian:=LoadKeyboardLayout('00000419', 0);
  ActivateKeyboardLayout(russian, KLF_REORDER);
  if odsTaxi.Active = False then
    odsTaxi.Active := True;
  Reg := TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\TaxiService\Disp', True);
    id := Reg.ReadInteger('\Software\TaxiService\Disp', 'ID_TAXI', 0);
    if id <> 0 then
      lcbTaxi.EditValue := id
    else
      lcbTaxi.EditValue := odsTaxi.FieldByName('fk_id').AsInteger;
  finally
    Reg.Free;
  end;
// -- Логин
  cTemp := TStringList.Create;
  try
    Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Dispetcher.ini');
    Ini.ReadSectionValues('USRLIST', cTemp);
    for i := 0 to cTemp.Count - 1 do
      begin
        cbLogin.Properties.OnChange := nil;
        cbLogin.Properties.Items.Add(COPY(cTemp.Strings[i], POS('=', cTemp.Strings[i]) + 1, Length(cTemp.Strings[i])));
        cbLogin.ItemIndex := Ini.ReadInteger('LOGIN', 'LastUser', -1);
        cbLogin.Properties.OnChange := cbLoginPropertiesChange;
      end;
// -- Пароль
  if FAutoSavePass = 1 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := Fos;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select fc_pass from taxi.ts_sotr where upper(fc_login) = :pfc_login ';
        ods.DeclareAndSet('pfc_login', otString, cbLogin.Text);
        ods.Open;
        tePass.Text := ods.FieldByName('fc_pass').AsString;
      finally
        ods.Free;
      end;
    end;
  finally
    cTemp.Free;
  end;
end;

procedure TfrmLogin.tePassClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian,KLF_REORDER);
end;

procedure TfrmLogin.tePassEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian,KLF_REORDER);
end;

function GetLogin(Aos:TOracleSession; aAutoSavePass:Integer; var aTaxiId:Integer; var aSotrId:Integer; var aSotrFio:string; var aTaxiName:string;
                  var aPriceKm:integer; var aSynTaxi : string;
                  var aCostTalonCar : Double; var aCostTalonMin : Double):Boolean;
var frmLogin: TfrmLogin;
begin
//-- запускаем форму авторизации
  Application.CreateForm(TfrmLogin, frmLogin);
  with frmLogin do
  begin
    try
      Init(Aos, AAutoSavePass);
      Result := ShowModal = mrOk;
      if (Result) then
      begin
        aTaxiId := lcbTaxi.EditValue;
        aSotrId := pSOTRID;
        aSotrFio := sUserName;
        aTaxiName := lcbTaxi.EditText;
        aPriceKm := odsTaxi.FieldByName('fn_pricekm').AsInteger;
        aSynTaxi := odsTaxi.FieldByName('fc_synonim').AsString;
        aCostTalonCar := odsTaxi.FieldByName('fn_cost_car').AsFloat;
        aCostTalonMin := odsTaxi.FieldByName('fn_cost_min').AsFloat;
      end;
    finally
      Free;
    end;
  end;
end;

end.
