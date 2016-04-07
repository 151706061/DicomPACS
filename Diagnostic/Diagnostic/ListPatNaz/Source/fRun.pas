unit fRun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter,
  cxButtonEdit, ActnList, dxBar, cxBarEditItem, cxClasses, ImgList, ExtCtrls,
  Oracle, SMMainAPI;

type
  TfrmRun = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bePacient: TcxBarEditItem;
    bbLoad: TdxBarButton;
    bbFree: TdxBarButton;
    bbClose: TdxBarButton;
    AL: TActionList;
    aLoad: TAction;
    aFree: TAction;
    aClose: TAction;
    Panel1: TPanel;
    os: TOracleSession;
    procedure aLoadExecute(Sender: TObject);
    procedure aFreeExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel1Resize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bePacientPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    hHandle : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

  TInitPlugin = function(HostObjHandle : THandle;
                                   App : THandle;
                                nPacID : Integer;
                               nSotrID : Integer;
                               nSpecID : Integer;
																nSecID : Integer = -1;
															 nSmidID : Integer = -1;
																nNazID : Integer = -1;
														 bReadOnly : Boolean = false;
																 ObjID : Integer = -1;
														 hMainForm : THandle = 0) : LongInt; StdCall;

	TResizePlugin = function(Panel_HND: THandle): LongInt; stdcall;
	TFreePlugin = function(): LongInt; stdcall;

var
  frmRun: TfrmRun;

implementation

uses fSearchPeople;

{$R *.dfm}

procedure TfrmRun.aCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmRun.aFreeExecute(Sender: TObject);
var FreePlugin : TFreePlugin;
begin
  if hHandle <> 0 then
    begin
      @FreePlugin := GetProcAddress(hHandle, 'FreePlugin');
      if @FreePlugin <> nil then
        begin
          if FreePlugin = 1 then
            begin
              @FreePlugin := nil;
              exit;
            end;
        end;
      FreeLibrary(hHandle);
      hHandle := 0;
    end;
end;

procedure TfrmRun.aLoadExecute(Sender: TObject);
var InitPlugin : TInitPlugin;
begin
  if bePacient.Tag = 0 then
    begin
      ShowMessage('Не указан пациент!');
      bePacient.SetFocus;
      Exit;
    end;

  hHandle := LoadLibrary('ListPatNaz.dll');
  if hHandle <> 0 then
  begin
    @InitPlugin := GetProcAddress(hHandle, 'InitPlugin');
    if @InitPlugin <> nil then
    begin
      try
        InitPlugin(Panel1.Handle,
                   Application.Handle,
                   bePacient.Tag, //pacid
                   StrToInt(ParamStr(1)), //StrToInt(ParamStr(1)), //sotrid
                   -1, //StrToInt(eSPECID.Text), //specid
                   -1, //secid
                   -1, //StrToInt(ParamStr(2)), //smidid
                   -1,
									 False,
									 -1,
									 Panel1.Parent.Handle);
      except
      end;
    end;
  end;
end;

procedure TfrmRun.bePacientPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSearchPeople, frmSearchPeople);
  try
    frmSearchPeople.ShowModal;
    if frmSearchPeople.ModalResult = mrOk then
      begin
        bePacient.EditValue := frmSearchPeople.odsPac.FieldByName('FIO').AsString;
        bePacient.Tag := frmSearchPeople.odsPac.FieldByName('PACID').AsInteger;
      end;
  finally
    frmSearchPeople.Free;
  end;
end;

procedure TfrmRun.FormClose(Sender: TObject; var Action: TCloseAction);
var FreePlugin : TFreePlugin;
begin
  if hHandle <> 0 then
    begin
      @FreePlugin := GetProcAddress(hHandle, 'FreePlugin');
      if @FreePlugin <> nil then
        begin
          if FreePlugin = 1 then
            begin
              @FreePlugin := nil;
              action := caNone;
              exit;
            end;
        end;
      FreeLibrary(hHandle);
      hHandle := 0;
    end;
end;

procedure TfrmRun.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
end;

procedure TfrmRun.Panel1Resize(Sender: TObject);
var ResizePlugin : TResizePlugin;
begin
  @ResizePlugin := GetProcAddress(hHandle, 'ResizePlugin');
  if @ResizePlugin <> nil then
    begin
      try
        ResizePlugin(Panel1.Handle);
      except
      end;
    end;
end;

end.
