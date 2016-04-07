unit fuserInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, ExtCtrls, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ActnList, cxCheckBox, cxMaskEdit, cxDropDownEdit,
  cxCalendar, dxSkinOffice2007Green, dxSkinBlack, Medotrade, DB_CMN,
  pFIBQuery, pFIBDataSet, pFIBProps;

type
  TfrmUserInfo = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    tePass: TcxTextEdit;
    teConfirm: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    teFam: TcxTextEdit;
    teName: TcxTextEdit;
    teOtch: TcxTextEdit;
    teAddress: TcxTextEdit;
    teTel: TcxTextEdit;
    AL: TActionList;
    aSave: TAction;
    aCancel: TAction;
    deDate: TcxDateEdit;
    cxLabel9: TcxLabel;
    teLogin: TcxMaskEdit;
    Panel2: TPanel;
    bSave: TcxButton;
    bCancel: TcxButton;
    procedure aCancelExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure teLoginClick(Sender: TObject);
    procedure teLoginEnter(Sender: TObject);
    procedure tePassEnter(Sender: TObject);
    procedure tePassClick(Sender: TObject);
    procedure teConfirmClick(Sender: TObject);
    procedure teConfirmEnter(Sender: TObject);
    procedure teFamEnter(Sender: TObject);
    procedure teFamClick(Sender: TObject);
    procedure teNameClick(Sender: TObject);
    procedure teNameEnter(Sender: TObject);
    procedure teOtchEnter(Sender: TObject);
    procedure teOtchClick(Sender: TObject);
    procedure teAddressClick(Sender: TObject);
    procedure teAddressEnter(Sender: TObject);
    procedure teTelEnter(Sender: TObject);
    procedure teTelClick(Sender: TObject);
    procedure teLoginKeyPress(Sender: TObject; var Key: Char);
  private
    latin, russian : HKL;
    { Private declarations }
  public
    Login : string;
    fk_id, vRej : Integer;
  end;

var
  frmUserInfo: TfrmUserInfo;

implementation

Uses Oracle, Uni;

{$R *.dfm}

procedure TfrmUserInfo.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmUserInfo.aSaveExecute(Sender: TObject);
  function chkUser:Boolean;
  begin
    Result := True;
    if ((frmUserInfo.vRej=1) or // ввод нового пользователя
        ((frmUserInfo.vRej=2) and ( frmUserInfo.Login<>Trim(teLogin.Text) ))) then // изменение пользователя
    begin
      if v_isOracle then     // ORACLE
      begin
        with TOracleQuery.Create(nil) do
        try
          Session:=DB_CMN.OraConn;
          SQL.Text := 'select 1 from users u where u.FC_LOGIN=:FC_LOGIN';
          DeclareAndSet( 'FC_LOGIN', otString, Trim(teLogin.Text) );
          try
            Execute;
            Result:= not Eof;
          except
            on e: Exception do
                MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
          end;
        finally
          Free;
        end;
      end else if v_isPostgres then
      begin
        with TUniQuery.Create(nil) do
        begin
          try
            Connection:=DB_CMN.PGconn;
            Transaction:=DB_CMN.MnUniTransaction;
            SQL.Text := 'select 1 from '+v_pg_Schema+'.users u where u.FC_LOGIN=:FC_LOGIN';
            ParamByName('FC_LOGIN').AsString := frmUserInfo.teLogin.Text; // логин
            try
              ExecSQL;
              Result:= not Eof;
            except
              on e: Exception do
                begin
                  MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
                end;
            end;
          finally
            Free;
          end;
        end;
      end else
      begin
        with TpFIBDataSet.Create(nil) do
          try
            Database := DB_CMN.DB;
            Transaction := DB_CMN.trRead;
            SelectSQL.Text := 'select 1 from users u where u.FC_LOGIN=:FC_LOGIN';
            ParamByName('FC_LOGIN').Value := Trim(teLogin.Text);
            Open; First;
            Result:= not Eof;
          finally
            Free;
          end;
      end;
    end;
  end;
begin
  if teLogin.Text = '' then
  begin
    MessageDlg('Введите логин пользователя!', mtWarning, [mbOK], 0);
    teLogin.SetFocus;
  end else
  if tePass.Text = '' then
  begin
    MessageDlg('Введите пароль пользователя!', mtWarning, [mbOK], 0);
    tePass.SetFocus;
  end else
  if teConfirm.Text = '' then
  begin
    MessageDlg('Введите подтверждение пароля пользователя!', mtWarning, [mbOK], 0);
    teConfirm.SetFocus;
  end else
  if (tePass.Text <> '') and (teConfirm.Text <> '') and (tePass.Text <> teConfirm.Text) then
  begin
    MessageDlg('Пароль и подтверждение пароля отличаются!'+#13#10+
               'Попробуйте еще раз!' , mtWarning, [mbOK], 0);
    teConfirm.Clear;
    teConfirm.SetFocus;
  end else
  if (tePass.Text <> '') and (teConfirm.Text <> '') and (tePass.Text <> teConfirm.Text) then
  begin
    MessageDlg('Пароль и подтверждение пароля отличаются!'+#13#10+
               'Попробуйте еще раз!' , mtWarning, [mbOK], 0);
    teConfirm.Clear;
    teConfirm.SetFocus;
  end else if (chkUser and (frmUserInfo.vRej <> 2)) then
  begin
    MessageDlg('Пользователь с таким именем входа в систему уже существует !'+#13#10+
               'Введите другой login!' , mtWarning, [mbOK], 0);
    teConfirm.Clear;
    teConfirm.SetFocus; 
  end else
    ModalResult := mrOk;
end;

procedure TfrmUserInfo.FormCreate(Sender: TObject);
begin
  latin:=LoadKeyboardLayout('00000409', 0);
  russian:=LoadKeyboardLayout('00000419', 0);
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

procedure TfrmUserInfo.teAddressClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmUserInfo.teAddressEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmUserInfo.teConfirmClick(Sender: TObject);
begin
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

procedure TfrmUserInfo.teConfirmEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

procedure TfrmUserInfo.teFamClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmUserInfo.teFamEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmUserInfo.teLoginClick(Sender: TObject);
begin
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

procedure TfrmUserInfo.teLoginEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

procedure TfrmUserInfo.teLoginKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ord(Key)>= 224) and (Ord(Key) <= 255) then
    begin
      Application.MessageBox('Наличие русских символов в логине пользователя нежелательно! Логин пользователя необходимо писать латинскими буквами', 'Внимание!', MB_OK + MB_ICONEXCLAMATION);
      Abort;
    end;
end;

procedure TfrmUserInfo.teNameClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmUserInfo.teNameEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmUserInfo.teOtchClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmUserInfo.teOtchEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmUserInfo.tePassClick(Sender: TObject);
begin
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

procedure TfrmUserInfo.tePassEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

procedure TfrmUserInfo.teTelClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmUserInfo.teTelEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

end.
