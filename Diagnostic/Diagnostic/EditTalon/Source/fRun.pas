unit fRun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, Registry,
  cxCurrencyEdit;

type
  TInitPlugin = procedure(nPacid: Integer; nNazid: Integer; nSotrid : Integer); stdcall;
  TInitPluginRes = function(nPacid: Integer; nNazid: Integer; nSotrid : Integer) : integer; stdcall;
  TFreePlugin = function(): LongInt; stdcall;
  TCopyPlugin = function(pNaz1 : Integer; pNaz2 : Integer): LongInt; stdcall;
  TfrmRun = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    tePacid: TcxTextEdit;
    teNazid: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    teNazid1: TcxTextEdit;
    teNazid2: TcxTextEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
  private
    VarRes : Integer;
    HandleDLL: THandle;
    InitPlugin: TInitPlugin;
    InitPluginRes: TInitPluginRes;
    FreePlugin: TFreePlugin;
    CopyPlugin: TCopyPlugin;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRun: TfrmRun;

implementation

{$R *.dfm}

procedure TfrmRun.cxButton1Click(Sender: TObject);
begin
  HandleDLL := LoadLibrary('EditTalon.dll');
  if HandleDLL <> 0 then
    begin
      InitPlugin := GetProcAddress(HandleDLL, 'InitPlugin');
      if @InitPlugin <> nil then
      begin
        try
          InitPlugin(StrToInt(tePacid.Text), StrToInt(teNazid.Text), StrToInt(ParamStr(1)));
        except
        end;
      end;
    end;
end;

procedure TfrmRun.cxButton2Click(Sender: TObject);
begin
  if HandleDll<>0 then
    begin
      @FreePlugin := GetProcAddress(HandleDLL, 'FreePlugin');
      if @FreePlugin <> nil then
        begin
          FreePlugin;
        end;
      FreeLibrary(HandleDLL);
      HandleDLL := 0;
    end;
end;

procedure TfrmRun.cxButton3Click(Sender: TObject);
begin
  HandleDLL := LoadLibrary('EditTalon.dll');
  if HandleDLL <> 0 then
    begin
      InitPluginRes := GetProcAddress(HandleDLL, 'InitPluginRes');
      if @InitPluginRes <> nil then
      begin
        try
          VarRes := InitPluginRes(StrToInt(tePacid.Text), StrToInt(teNazid.Text), StrToInt(ParamStr(1)));
        except
        end;
      end;
    end;
end;

procedure TfrmRun.cxButton4Click(Sender: TObject);
begin
  HandleDLL := LoadLibrary('EditTalon.dll');
  if HandleDLL <> 0 then
    begin
      CopyPlugin := GetProcAddress(HandleDLL, 'CopyPlugin');
      if @CopyPlugin <> nil then
      begin
        try
          CopyPlugin(StrToInt(teNazid1.Text), StrToInt(teNazid2.Text));
        except
        end;
      end;
    end;
end;

procedure TfrmRun.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
  Reg:=TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\Softmaster\KOLYA_RUN_TALON', FALSE);
    Reg.WriteInteger('\Software\Softmaster\KOLYA_RUN_TALON', 'PACID', StrToInt(tePacid.Text));
    Reg.WriteInteger('\Software\Softmaster\KOLYA_RUN_TALON', 'NAZID', StrToInt(teNazid.Text));
    Reg.WriteInteger('\Software\Softmaster\KOLYA_RUN_TALON', 'NAZID1', StrToInt(teNazid1.Text));
    Reg.WriteInteger('\Software\Softmaster\KOLYA_RUN_TALON', 'NAZID2', StrToInt(teNazid2.Text));
  finally
    Reg.Free;
  end;
end;

procedure TfrmRun.FormCreate(Sender: TObject);
var Reg : TRegIniFile;
begin
  Reg:=TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\Softmaster\KOLYA_RUN_TALON', True);
    tePacid.Text := IntToStr(Reg.ReadInteger('\Software\Softmaster\KOLYA_RUN_TALON', 'PACID', 0));
    teNazid.Text := IntToStr(Reg.ReadInteger('\Software\Softmaster\KOLYA_RUN_TALON', 'NAZID', 0));
    teNazid1.Text := IntToStr(Reg.ReadInteger('\Software\Softmaster\KOLYA_RUN_TALON', 'NAZID1', 0));
    teNazid2.Text := IntToStr(Reg.ReadInteger('\Software\Softmaster\KOLYA_RUN_TALON', 'NAZID2', 0));
  finally
    Reg.Free;
  end;
end;

end.
