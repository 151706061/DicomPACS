program PortListener;

uses
  SvcMgr,
  fMain in 'fMain.pas' {CallsListener: TService};

{$R *.RES}

begin                      
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TCallsListener, CallsListener);
  Application.Run;
end.
