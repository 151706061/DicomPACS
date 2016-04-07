unit fCopy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, cxControls, cxContainer, cxEdit,
  cxLabel, ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, cxTextEdit, ActnList,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMemo, IB_Services,
  JvBaseDlg, JvBrowseFolder, Registry, dxSkinOffice2007Green, cxImage;

type
  TfrmCopy = class(TForm)
    JvPanel1: TJvPanel;
    cxLabel1: TcxLabel;
    lClose: TcxLabel;
    JvPanel2: TJvPanel;
    cxLabel2: TcxLabel;
    teBD: TcxTextEdit;
    al: TActionList;
    aClose: TAction;
    mBackUp: TcxMemo;
    fibBackUp: TpFIBBackupService;
    cxLabel3: TcxLabel;
    lCreate: TcxLabel;
    jvod: TJvBrowseForFolderDialog;
    aOpen: TAction;
    aCreate: TAction;
    bOpen: TcxButton;
    cxImage2: TcxImage;
    procedure aCloseExecute(Sender: TObject);
    procedure lCloseClick(Sender: TObject);
    procedure lCloseMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lCloseMouseLeave(Sender: TObject);
    procedure lCreateMouseLeave(Sender: TObject);
    procedure lCreateMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lCreateClick(Sender: TObject);
    procedure aOpenExecute(Sender: TObject);
    procedure jvodChange(Sender: TObject; const Directory: string);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure aCreateExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCopy: TfrmCopy;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmCopy.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCopy.aCreateExecute(Sender: TObject);
begin
  if teBD.Text = '' then
    begin
      MessageDlg('Не указана дирректория резервного копирования!', mtError,[mbOk],0);
      bOpen.SetFocus;
      Exit;
    end else
    begin
      fibBackUp.DatabaseName := frmMain.DB.DatabaseName;
      fibBackUp.ServerName := 'LocalHost';
      fibBackUp.BackupFile.Clear;
      fibBackUp.BackupFile.Add(teBD.Text + '\PACSDB_' + DateToStr(now) + '.bak');
      fibBackUp.Params.Clear;
      fibBackUp.Params.Add('user_name=SYSDBA');
      fibBackUp.Params.Add('password='+frmMain.DB.ConnectParams.Password);
      fibBackUp.Active := True; // активируем процесс
      try
        Screen.Cursor := crSQLWait;
        fibBackUp.ServiceStart; // и стартуем его
        mBackup.Lines.Add('**************** Резервное копирование начато ****************');
       {пока не завершится процесс выводим логи о процессе, для того чтобы логи отображались нужно свойство Verbose поставить в значение TRUE}
        while not (fibBackUp.Eof) do
          begin
            mBackup.Lines.Add(fibBackUp.GetNextLine);
          end;
        mBackup.Lines.Add('*************** Резервное копирование закончено ***************');
        fibBackUp.Active := False; //закрываем процесс
      except
        on e: Exception do
          MessageDlg('Ошибка при резервном копировании базы данных!'+#13+
                     e.Message, mtError,[mbOk],0);
      end;
      Screen.Cursor := crDefault;
    end;
end;

procedure TfrmCopy.aOpenExecute(Sender: TObject);
begin
  jvod.Execute;
end;

procedure TfrmCopy.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\DicomServer\', False) then
    begin
      Reg.CreateKey('\Software\Softmaster\DicomServer');
    end;
  try
    Reg.WriteString('\Software\Softmaster\DicomServer', 'BACKUP_DIR', teBD.Text);
  finally
    Reg.Free;
  end;
end;

procedure TfrmCopy.FormCreate(Sender: TObject);
var Reg : TRegIniFile;
begin
  Reg:=TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    teBD.Text := Reg.ReadString('\Software\Softmaster\DicomServer', 'BACKUP_DIR', '');
  finally
    Reg.Free;
  end;
end;

procedure TfrmCopy.jvodChange(Sender: TObject; const Directory: string);
begin
  teBD.Text := Directory;
end;

procedure TfrmCopy.lCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCopy.lCloseMouseLeave(Sender: TObject);
begin
  lClose.Style.Font.Style := lClose.Style.Font.Style - [fsUnderline];
end;

procedure TfrmCopy.lCloseMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lClose.Style.Font.Style := lClose.Style.Font.Style + [fsUnderline];
end;

procedure TfrmCopy.lCreateClick(Sender: TObject);
begin
  aCreateExecute(nil);
end;

procedure TfrmCopy.lCreateMouseLeave(Sender: TObject);
begin
  lCreate.Style.Font.Style := lCreate.Style.Font.Style - [fsUnderline];
end;

procedure TfrmCopy.lCreateMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lCreate.Style.Font.Style := lCreate.Style.Font.Style + [fsUnderline];
end;

end.
