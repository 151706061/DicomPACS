unit fLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, Menus, cxLookAndFeelPainters,
  CnsPngGr, cxImage, StdCtrls, cxButtons, cxTextEdit, cxControls, cxContainer,
  cxEdit, cxLabel, ExtCtrls, ActnList, cxGraphics, cxMaskEdit, cxDropDownEdit,
  Registry, uMD5, StrUtils, FIBDataSet, pFIBDataSet, dxSkinOffice2007Green,
  JvExExtCtrls, JvExtComponent, JvPanel, dxSkinBlack, IniFiles, Uni, Medotrade,
  OracleData, Oracle; 

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    teLogin: TcxTextEdit;
    tePass: TcxTextEdit;
    cxImage2: TcxImage;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    lbCapsLock: TcxLabel;
    cbLang: TComboBox;
    aParam: TAction;
    Panel2: TPanel;
    bParams: TcxButton;
    bEnter: TcxButton;
    bCancel: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure alUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbLangChange(Sender: TObject);
    procedure cbLangCloseUp(Sender: TObject);
    procedure cbLangDropDown(Sender: TObject);
    procedure tePassClick(Sender: TObject);
    procedure tePassEnter(Sender: TObject);
    procedure teLoginEnter(Sender: TObject);
    procedure teLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aParamExecute(Sender: TObject);
    procedure tePassPropertiesChange(Sender: TObject);
  private
    bKeybOpen: boolean;
    Latin : HKL;
    nTry : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation
uses fMain, fParams, DB_CMN, pFIBDatabase;
{$R *.dfm}

procedure TfrmLogin.aCancelExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.alUpdate(Action: TBasicAction; var Handled: Boolean);
var i : Integer;
begin
  lbCapsLock.Visible := Odd(GetKeyState(VK_CAPITAL));
  if not bKeybOpen then
    for i := 0 to cbLang.Items.Count - 1 do
      if GetKeyboardLayout(0) = HKL(cbLang.Items.Objects[i]) then
        cbLang.ItemIndex := i;
end;

procedure TfrmLogin.aOkExecute(Sender: TObject);
var dsFIB : TpFIBDataSet; v_UniQr : TUniQuery; vOraQr : TOracleQuery;
  procedure AccDeny;
  begin
    Application.MessageBox('В доступе отказано!'+#13+
                           'Причины:'+#13+
                           '1. Неправильно указан ''Calling AE Title'';'+#13+
                           '2. Ваш терминал отсутствует в списке доверенных терминалов!'+#13+
                           'Обратитесь к администратору системы!',
                           'Предупреждение!', MB_OK+MB_ICONWARNING);
  end;
begin
//-->> 1. проверяем все ли поля заполнены
  if frmLogin.teLogin.Text = '' then
  begin
    MessageDlg('Внимание!'+#13+#10+'Для входа в систему необходимо ввести пользователя!', mtWarning, [mbOK], 0);
    Exit;
  end else if frmLogin.tePass.Text = '' then
  begin
    MessageDlg('Внимание!'+#13+#10+'Для входа в систему необходимо ввести пароль!', mtWarning, [mbOK], 0);
    Exit;
  end;
  //
  if v_isOracle then     // ORACLE
  begin
    DB_CMN.OraConn := DB_CMN.OraConnCrt(False) ;
    //
    DB_CMN.OraConn.LogonUsername := frmLogin.teLogin.Text;
    DB_CMN.OraConn.LogonPassword := frmLogin.tePass.Text;
    DB_CMN.OraConn.LogonDatabase := v_OraSchema;
    //
    Inc(nTry); // кол-во попыток неправильного ввода пароля (максимум 3)
    try
      DB_CMN.OraConn.Connected := True;
    except
      on e: Exception do
      begin
        if nTry < 3 then
        begin
          tePass.Clear;
          tePass.SetFocus;
          MessageDlg('Ошибка: '+ e.Message, mtError, [mbOK], 0); // ошибка при подключении БД
        end
        else
        begin
          MessageDlg('Попытка несанкционированного доступа!', mtError, [mbOK], 0); // исчерпаны 3 попытки
          Application.Terminate;
        end;
      end;
    end;
    if ( DBparams_get( 'SERVER', 'IS_DEVICES_CHECK') = '1' ) then // настройка учитывать настройку терминалов включена
    begin
      vOraQr := TOracleQuery.Create(nil);
      try
        vOraQr.Session:=DB_CMN.OraConn;
        vOraQr.SQL.Text := ' SELECT COUNT(1) AS CNT FROM pacs.DEVICES WHERE FC_TITLE = :PFC_TITLE ';
        vOraQr.DeclareAndSet('PFC_TITLE',otString,frmMain.sCallingAETitle);
        vOraQr.Execute;
        if vOraQr.FieldAsInteger('CNT') = 0 then
        begin
          AccDeny;
          Exit;
        end;
      finally
        vOraQr.Free;
      end;
    end;
    if DB_CMN.OraConn.Connected then
    begin
      if frmLogin.teLogin.Text='PACS' then
        vUserRole := 1
      else
        vUserRole := gtUserRole(frmLogin.teLogin.Text) ;
      ModalResult := mrOk; // ВХОД В СИСТЕМУ !
    end;
  end else if v_isPostgres then
  begin
  //  v_pg_user:=frmLogin.teLogin.Text;
  //  v_pg_password:=frmLogin.tePass.Text;
    PGconn := PgConnCrt(False);
    PGconn.Database := v_pg_database;
    PGconn.Port := v_pg_port;
    PGconn.Server := v_pg_server;
    PGconn.SpecificOptions.Values['Schema'] := v_pg_Schema;
    PGconn.SpecificOptions.Values['UseUnicode'] := 'True';
    PGconn.Username := frmLogin.teLogin.Text;
    PGconn.Password := frmLogin.tePass.Text;
    MnUniTransaction := PGTransCreate(PGconn);
    try
      PGconn.Connected := True;
    except
      on e:Exception do
          PGconn.Free;
    end;
    if ((PGconn=nil) or (not PGconn.Connected)) then
    begin
      Inc(nTry);
      if nTry <> 3 then
        begin
          tePass.Clear;
          tePass.SetFocus;
          MessageDlg('Ошибка: Неверный логин/пароль', mtError, [mbOK], 0); // ошибка при подключении БД
        end
      else
        begin
          MessageDlg('Попытка несанкционированного доступа!', mtError, [mbOK], 0); // исчерпаны 3 попытки
          Application.Terminate;
        end;
    end else
    //-->> 3. проверяем включена ли настройка доверенных терминалов (если включена, то проверяем входит ли данный компьютер в доверенную зону)
    if PGconn.Connected then
    begin
      if ( DBparams_get( 'SERVER', 'IS_DEVICES_CHECK') = '1' ) then // настройка учитывать настройку терминалов включена
      begin
        v_UniQr := TUniQuery.Create(nil);
        try
          v_UniQr.Connection:=DB_CMN.PGconn;
          v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
          v_UniQr.SQL.Text := ' SELECT COUNT(1) AS cnt FROM '+v_pg_Schema+'.devices WHERE fc_title = :PFC_TITLE ';
          v_UniQr.ParamByName('PFC_TITLE').AsString := frmMain.sCallingAETitle;
          v_UniQr.Open;
          if v_UniQr.FieldByName('CNT').AsInteger = 0 then
          begin
            AccDeny;
            Exit;
          end;
        finally
          v_UniQr.Free;
        end;
      end;
      if DB_CMN.PGconn.Connected then
      begin
        if UpperCase(frmLogin.teLogin.Text)=UpperCase(v_pg_user) then
          vUserRole := 1
        else
          vUserRole := gtUserRole(frmLogin.teLogin.Text) ;
        ModalResult := mrOk; // ВХОД В СИСТЕМУ !
      end;
    end else
    begin
      MessageDlg('Попытка несанкционированного доступа!', mtError, [mbOK], 0); // исчерпаны 3 попытки
      Application.Terminate;
    end;
  //<<-- 3
  end else
  begin
    //<<-- 1
    //-->> 2. устанавливаем параметры BD и параметры коннекта
    if DB_CMN.DB.Connected then DB_CMN.DB.Close;    
    DB_CMN.DB.DBParams.Clear;
    DB_CMN.DB.DBParams.Add('user_name='+frmLogin.teLogin.Text); // юзер
    if UpperCase(frmLogin.teLogin.Text) = 'SYSDBA' then
    //if vUserRole=1 then
    begin
      DB_CMN.DB.DBParams.Add('password='+frmLogin.tePass.Text); // пароль для sysdba
      frmMain.sPass := tePass.Text;
    end
    else
    begin
      DB_CMN.DB.DBParams.Add('password='+LeftStr(uMD5.MD5DigestToStr(MD5String(frmLogin.tePass.Text)),20)); // шифрованный пароль для др. юзеров
      frmMain.sPass := LeftStr(uMD5.MD5DigestToStr(MD5String(frmLogin.tePass.Text)),20);
      DB_CMN.DB.ConnectParams.RoleName := 'ROLE_USER'; // роль юзеров
    end;
    //<<-- 2
    v_ip_fb:=fMain.read_db_ip;
    if Trim(v_ip_fb)='' then
    begin
      MessageDlg('Нет подключения к базе данных!'+#13+
                 'Обратитесь к системному администратору!', mtError, [mbOK], 0);
      Application.Terminate;
    end else
    begin
      if v_ip_fb='' then v_ip_fb:='localhost';
      DB_CMN.DB.DBName := v_ip_fb+':PACSBASE';
//      DB_CMN.DB.DBName := 'PACSBASE';
      Inc(nTry); // кол-во попыток неправильного ввода пароля (максимум 3)
      try
        DB_CMN.DB.Connected := True; // CONNECT !
        frmMain.sUser := teLogin.Text;
        //-->> 3. проверяем включена ли настройка доверенных терминалов (если включена, то проверяем входит ли данный компьютер в доверенную зону)
        if DB_CMN.DB.Connected then
        begin
          if ( DBparams_get( 'SERVER', 'IS_DEVICES_CHECK') = '1' ) then // настройка учитывать настройку терминалов включена
          begin
            dsFIB := TpFIBDataSet.Create(nil);
            try
              dsFIB.Database := DB_CMN.DB;
              dsFIB.Transaction := DB_CMN.trWrite;
              dsFIB.AutoCommit := True;
              dsFIB.SQLs.SelectSQL.Clear;
              dsFIB.SQLs.SelectSQL.Text := ' SELECT COUNT(1) AS CNT FROM DEVICES WHERE FC_TITLE = :PFC_TITLE ';
              dsFIB.ParamByName('PFC_TITLE').AsString := frmMain.sCallingAETitle;
              dsFIB.Open;
              if dsFIB.FieldByName('CNT').AsInteger = 0 then
              begin
                AccDeny;
                Exit;
              end;
            finally
              dsFIB.Free;
            end;
          end;
          if DB_CMN.DB.Connected then
          begin
            if UpperCase(frmLogin.teLogin.Text)='SYSDBA' then
              vUserRole := 1
            else
              vUserRole := gtUserRole(frmLogin.teLogin.Text) ;
            ModalResult := mrOk; // ВХОД В СИСТЕМУ !
          end;
        end else
        begin
          MessageDlg('Попытка несанкционированного доступа!', mtError, [mbOK], 0); // исчерпаны 3 попытки
          Application.Terminate;
        end;
      except
          on e: Exception do
          begin
            if nTry < 3 then
            begin
              tePass.Clear;
              tePass.SetFocus;
              MessageDlg('Ошибка: '+ e.Message, mtError, [mbOK], 0); // ошибка при подключении БД
            end
            else
            begin
              MessageDlg('Попытка несанкционированного доступа!', mtError, [mbOK], 0); // исчерпаны 3 попытки
              Application.Terminate;
            end;
          end;
      end;
    end;
  end;
end;

procedure TfrmLogin.aParamExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmParams, frmParams);
  try
    frmParams.Panel1.Enabled := False;
    frmParams.tvTree.Enabled := False;
    frmParams.pcParam.ActivePageIndex := 1;
    frmParams.Panel1.Visible := False;
    frmParams.sUserTest := teLogin.Text;
    frmParams.teDBpath.Text := frmMain.sDBpath;
    frmParams.teIMGpath.Text := frmMain.sIMGpath;
    // if teLogin.Text = 'SYSDBA' then
    if vUserRole=1 then    
    begin
      frmParams.sPassTest := tePass.Text; //пароль для SYSDBA
    end else
    begin
      frmParams.sPassTest := LeftStr(uMD5.MD5DigestToStr(MD5String(tePass.Text)),20); //пароль для обычного юзера
    end;
    if frmMain.sPort = '' then
      frmParams.cxPort.Text := '104'
    else
      frmParams.cxPort.Text := frmMain.sPort;
    frmParams.cxIP.Text := frmMain.sIP;
    frmParams.teCalledTitle.Text := frmMain.sCalledAETitle;
    frmParams.teCallingTitle.Text := frmMain.sCallingAETitle;
    frmParams.teLocalPort.Text := frmMain.sLocalPort;
    frmParams.ShowModal;
    if frmParams.ModalResult = mrOk then
      begin
//-->> сохраняем порт, ip-адрес сервера, ae title сервера и ae title клиента в реестр
        param_sav ( frmParams.cxPort.Text,
                    frmParams.cxIP.Text,
                    frmParams.teCalledTitle.Text,
                    frmParams.teCallingTitle.Text,
                  //  frmParams.teLocalPort.Text,
                    frmParams.teCDDir.Text,
                    frmParams.teDBpath.Text,
                    frmParams.teIMGpath.Text
                    );
//-->> сохраняем порт, ip-адрес сервера, ae title сервера и ae title клиента в глобальные переменные
        frmMain.sPort := frmParams.cxPort.Text;
        frmMain.sIP := frmParams.cxIP.Text;
        frmMain.sCalledAETitle := frmParams.teCalledTitle.Text;
        frmMain.sCallingAETitle := frmParams.teCallingTitle.Text;
        frmMain.sLocalPort:=frmParams.teLocalPort.Text;
        frmMain.sCDDir := frmParams.teCDDir.Text;
      end;
  finally
    frmParams.Free;
  end;
end;

procedure TfrmLogin.cbLangChange(Sender: TObject);
begin
  with Sender as TComboBox do
    ActivateKeyboardLayout(Hkl(Items.Objects[ItemIndex]), 0);
end;

procedure TfrmLogin.cbLangCloseUp(Sender: TObject);
begin
  bKeybOpen := FALSE;
end;

procedure TfrmLogin.cbLangDropDown(Sender: TObject);
begin
  bKeybOpen := TRUE;
end;

procedure TfrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  param_session_save (teLogin.Text);
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
var i: Integer;
    AList: array[0..KL_NAMELENGTH] of Hkl;
    AklName: array[0..255] of Char;
begin
  if c_is_debug then
  begin
    if v_isPostgres then
    begin
      teLogin.Text := v_pg_user ;
      tePass.Text  := v_pg_password ;
    end;
  end;
  // текущий каталог
  v_exe_path:=ExtractFilePath(Application.ExeName);
  // чтение адреса сервера Firebird
  v_ip_fb:=fMain.read_db_ip;
  if Trim(v_ip_fb)='' then
    begin
      MessageDlg('Нет подключения к базе данных!'+#13+
                 'Обратитесь к системному администратору!', mtError, [mbOK], 0);
      Application.Terminate;           
    end;
  nTry := 0;
  for i := 0 to GetKeyboardLayoutList(SizeOf(AList), AList) - 1 do
    begin
      GetLocaleInfo(LoWord(AList[i]), LOCALE_SABBREVLANGNAME, AklName, SizeOf(AklName));
      cbLang.AddItem(AklName, Pointer(AList[i]));
    end;
  latin:=LoadKeyboardLayout('00000409', 0);
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

procedure TfrmLogin.FormShow(Sender: TObject);
var v_is_conn : Boolean;
begin
  if v_isOracle then
  begin
    if DB_CMN.OraConn<>nil then
    begin
      if DB_CMN.OraConn.Connected then
        v_is_conn := True
      else
        v_is_conn := False;
    end else
      v_is_conn := False;
  end else if v_isPostgres then
  begin
    if DB_CMN.PGconn<>nil then
    begin
      if DB_CMN.PGconn.Connected then
        v_is_conn := True
      else
        v_is_conn := False;
    end else
      v_is_conn := False;
  end else
  begin
    if DB_CMN.DB<>nil then
    begin
      if DB_CMN.DB.Connected then
        v_is_conn := True
      else
        v_is_conn := False;
    end else
      v_is_conn := False;
  end;
  //-->> поднимаем начальные настройки подключения к удаленной БД
  if v_is_conn then
    param_read ( frmMain.sPort,
                 frmMain.sIP,
                 frmMain.sCalledAETitle,
                 frmMain.sCallingAETitle,
                 frmMain.sLocalPort,
                 frmMain.sCDDir,
                 frmMain.sDBpath,
                 frmMain.sIMGpath
               );
//<<--
  if teLogin.Text <> '' then
    tePass.SetFocus;  
end;

procedure TfrmLogin.teLoginClick(Sender: TObject);
begin
  ActivateKeyboardLayout(latin,KLF_REORDER);
end;

procedure TfrmLogin.teLoginEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(latin,KLF_REORDER);
end;

procedure TfrmLogin.tePassClick(Sender: TObject);
begin
  ActivateKeyboardLayout(latin,KLF_REORDER);
end;

procedure TfrmLogin.tePassEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(latin,KLF_REORDER);
end;

procedure TfrmLogin.tePassPropertiesChange(Sender: TObject);
begin
  if tePass.Text <> '' then
    begin
      aParam.Enabled := True;
    end else
    begin
      aParam.Enabled := False; 
    end;
end;

end.
