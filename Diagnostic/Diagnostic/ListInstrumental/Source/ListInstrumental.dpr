library ListInstrumental;

uses
  SysUtils,
  Classes,
  Windows,
  Forms,
  OracleMonitor,
  fMain in 'fMain.pas' {frmMain},
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas';

{$R *.res}
var AppHandle : Integer;

function InitPlugin(HostObjHandle : THandle;
															App : THandle;
													 nPacID : Integer;
													nSotrID : Integer;
													nSpecID : Integer;
													 nSecID : Integer = -1;
													nSmidID : Integer = -1;
													 nNazID : Integer = -1;
												bReadOnly : Boolean = false;
														ObjID : Integer = -1;
												hMainForm : THandle = 0) : LongInt; stdcall;
var rRegion : TRect;
begin
  if Application.Terminated then
    begin
      Result := 0;
      Exit;
    end;
  if not GetCheckConnect() then
    begin
      Result := 0;
      Exit;
    end;
	Result := 0;
	if (HostObjHandle > 0) and (nPacID > 0) then
		begin
			AppHandle := Application.Handle;
			Application.Handle := App;
      Application.CreateForm(TfrmMain, frmMain);
  frmMain.PanelHandle:= hMainForm;  //!!!
			frmMain.ParentWindow := HostObjHandle;
			frmMain.DoShowfrmMain(nPACID, nSOTRID);
			windows.GetClientRect(HostObjHandle, rRegion);
			frmMain.Width := rRegion.Right;
			frmMain.Height := rRegion.Bottom;
		end;
end;

function ResizePlugin(PanelHandle: THandle): LongInt; stdcall;
var rRegion: TRect;
begin
  Result:=0;
  if not assigned(frmMain) then exit;
  if frmMain = nil then exit;
  windows.GetClientRect(PanelHandle, rRegion);
  frmMain.Width := rRegion.Right;
  frmMain.Height := rRegion.Bottom;
end;

function FreePlugin(): LongInt; stdcall;
begin
  Result := 0;
	if not assigned(frmMain) then exit;
  frmMain.UnloadDll;
  FreeAndNil(frmMain);
end;

exports
  InitPlugin, ResizePlugin, FreePlugin;
begin
end.
