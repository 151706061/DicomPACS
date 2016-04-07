unit fParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  ExtCtrls, ActnList, pFIBDatabase, FIBDatabase, ComCtrls, cxTreeView,
  dxSkinscxPCPainter, cxPC, cxImage, JvExExtCtrls, JvExtComponent, JvPanel,
  ImgList, JvBaseDlg, JvBrowseFolder, cxCheckBox, dxSkinOffice2007Green,
  dxSkinBlack, cxStyles, cxGraphics, cxVGrid, cxInplaceContainer, cxGroupBox,
  ExtDlgs, dxSkinOffice2007Black, DB_CMN, IniFiles, Uni, PostgreSQLUniProvider,
  Medotrade ;

type
  TfrmParams = class(TForm)
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    Panel2: TPanel;
    pcParam: TcxPageControl;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    JvPanel2: TJvPanel;
    cxImage2: TcxImage;
    cxLabel4: TcxLabel;
    IL: TImageList;
    JvPanel3: TJvPanel;
    cxImage3: TcxImage;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    teCDDir: TcxTextEdit;
    bOpenCDDir: TcxButton;
    aOpenDir: TAction;
    jvod: TJvBrowseForFolderDialog;
    tvTree: TcxTreeView;
    Panel1: TPanel;
    bSave: TcxButton;
    bClose: TcxButton;
    gbArchive: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxPort: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxIP: TcxTextEdit;
    cxLabel7: TcxLabel;
    teCalledTitle: TcxTextEdit;
    bTest: TcxButton;
    gbStation: TcxGroupBox;
    cxLabel8: TcxLabel;
    teCallingTitle: TcxTextEdit;
    cxLabel9: TcxLabel;
    teLocalPort: TcxTextEdit;
    cxGroupBox1: TcxGroupBox;
    teDBpath: TcxTextEdit;
    cxLabel10: TcxLabel;
    cxlbl10: TcxLabel;
    teIMGpath: TcxTextEdit;
    btn1: TcxButton;
    settCatalogIMG: TAction;
    cxButton1: TcxButton;
    SetCatalogDB: TAction;
    OpenTextFileDialog1: TOpenTextFileDialog;
    aTest: TAction;
    aECHO: TAction;
    cxButton2: TcxButton;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvTreeChange(Sender: TObject; Node: TTreeNode);
    procedure aOpenDirExecute(Sender: TObject);
    procedure settCatalogIMGExecute(Sender: TObject);
    procedure SetCatalogDBExecute(Sender: TObject);
    procedure aTestExecute(Sender: TObject);
    procedure aECHOExecute(Sender: TObject);
  private
    { Private declarations }
  public
    sUserTest, sPassTest : string;
    { Public declarations }
  end;

var
  frmParams: TfrmParams;

implementation

Uses DICOM_CMN, fMain;

{$R *.dfm}

procedure TfrmParams.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmParams.aECHOExecute(Sender: TObject);
begin
  if f_C_ECHO(cxIP.Text, cxPort.Text, teCalledTitle.Text, teCallingTitle.Text ) then
    begin
      MessageDlg('Устройство отвечает на запросы', mtInformation, [mbOK], 0);
    end else
    begin
      MessageDlg('Устройство не отвечает на запросы', mtError, [mbOK], 0);
    end;
end;

procedure TfrmParams.aOpenDirExecute(Sender: TObject);
begin
  if jvod.Execute then
    teCDDir.Text := jvod.Directory;
end;

procedure TfrmParams.aSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmParams.aTestExecute(Sender: TObject);
var Ini:TIniFile; DBTest: TpFIBDatabase; PGconn: TUniConnection;
  procedure DB_CMN (emess : string);
  begin
    MessageDlg('Не удалось подключиться к БД!'+#13#10+
               'Причины: '+#13+
               '1. Неправильно указан IP-адрес сервера;'+#13#10+
               '2. Неправильно введен пользователь или пароль! '+#13+
               'Ошибка!'+#13#10+
               emess, mtError, [mbOK], 0);
  end;
begin
  Ini := TIniFile.Create(ExtractFilePath(paramstr(0))+fMain.c_ini_file);
  try   // чтение параметров соединения с БД
    cmn_db_params_read(Ini);
  finally
    Ini.Free;
  end;
  if v_isPostgres then begin
    PGconn := PgConnCrt(False) ;
    try
      try
        PGconn.Connected := True;
        PGconn.Connected := False;
      except
        on e:Exception do
          begin
            Screen.Cursor := crDefault;
            DB_CMN(e.Message);
          end;
      end;
    finally
      PGconn.Free;
    end;
  end else
  begin
    DBTest:= TpFIBDatabase.Create(nil);
    try
      DBtest.AliasName := 'PACSBASE';
      DBTest.DBParams.Clear;
      DBTest.DBParams.Add('user_name='+sUserTest);
      DBTest.DBParams.Add('password='+sPassTest);
      // if sUserTest <> 'SYSDBA' then
      if vUserRole<>1 then
        DBTest.DBParams.Add('sql_role_name=ROLE_USER');
      try
        Screen.Cursor := crHourGlass;
        DBTest.Connected := True;
        Screen.Cursor := crDefault;
        MessageDlg('Успешное подключение к БД!', mtInformation, [mbOK], 0);
        DBTest.Connected := False;
      except
        on e: Exception do
          begin
            Screen.Cursor := crDefault;
            DB_CMN(e.Message);
          end;
      end;
    finally
      DBTest.Free;
    end;
  end;
end;

procedure TfrmParams.tvTreeChange(Sender: TObject; Node: TTreeNode);
begin
  if Node.StateIndex = 0 then
    pcParam.ActivePageIndex := 0;
  if Node.StateIndex = 1 then
    pcParam.ActivePageIndex := 1;
end;

procedure TfrmParams.FormCreate(Sender: TObject);
begin
  tvTree.FullExpand;
  pcParam.HideTabs := True;
  if (v_isOracle or v_isPostgres) then
    bTest.Visible:=False;
end;

procedure TfrmParams.SetCatalogDBExecute(Sender: TObject);
begin // SetCatalogDB
  if Trim(teDBpath.Text)<>'' then
    OpenTextFileDialog1.initialDir:=ExtractFilePath(teDBpath.Text);
  if OpenTextFileDialog1.Execute then
    teDBpath.Text:=OpenTextFileDialog1.FileName;
end;

procedure TfrmParams.settCatalogIMGExecute(Sender: TObject);
begin
  jvod.Directory:=teIMGpath.Text;
  if jvod.Execute then
    if (teIMGpath.Text <> jvod.Directory) then
      teIMGpath.Text := jvod.Directory;
end;

end.
