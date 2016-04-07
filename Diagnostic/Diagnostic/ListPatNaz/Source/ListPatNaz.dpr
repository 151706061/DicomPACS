library ListPatNaz;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
//  ShareMem,
  Windows,
  OracleMonitor,
  SysUtils,
  Classes,
  Forms,
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  fMain in 'fMain.pas' {frmMain};

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
      frmMain.PanelHandle:= hMainForm;  
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
