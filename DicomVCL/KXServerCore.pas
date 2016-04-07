{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit KXServerCore;

interface

{$I DicomPack.inc}
{$I KXSock.DEF}
{.$DEFINE DICOMDEBUGZ}
uses
  KXSessionTracker, KXSock, 
  {$IFDEF DICOMDEBUGZ}DbugIntf, {$ENDIF}
  KXString, winsock,
  Classes, DCM_log;

const
  DefaultThreadCacheSize = 2000;

  cLogFile = '\dcm_server.log';

type
  TWhichProtocol = (wpUDPOnly, wpTCPOnly);
  TServerType = (stNonBlocking, stThreadBlocking); // 4.0 implemented!

  ///////////////////////////////////////////////////////////////////////////////
  // Events:
  ///////////////////////////////////////////////////////////////////////////////
  TKXClientThread = class; //forward
  TKX_NewConnect = procedure(ClientThread: TKXClientThread) of object;
  {$WARNINGS OFF}
  TKX_DestroySessionData = procedure(ClientThread: TKXClientThread; SessionData: Pointer) of
    object;
  {$WARNINGS ON}

  ///////////////////////////////////////////////////////////////////////////////
  // This thread is the spawned "Session" thread. Every connection detected by
  // the "Listener" thread is created as a TKXServerThread, and then that new
  // thread takes over communications with the new session.
  ///////////////////////////////////////////////////////////////////////////////
  TKXClientThread = class(TThread)
  private
    Client: TKXSock;
    feNewConnect: TKX_NewConnect;
    feDestroySessionData: TKX_DestroySessionData;
    fBlockSizeFlags: TKXBlockSizeFlags;
    ListenerThreadObject: TThread;
  protected
    FConnectionID: Integer;
    procedure Execute; override;
    function GetSessionID: Integer;
    procedure ProcessData; virtual;
  public
    {$WARNINGS OFF}
    fpSessionData: Pointer;
    {$WARNINGS ON}
    constructor Create(CreateSuspended: Boolean); virtual;
    destructor Destroy; override;
    procedure SetSocketLater(Socket: TKXSock);
    procedure SetReply(const ANumericCode: Integer; const AText: string);
    property ConnectionID: Integer read FConnectionID;
  published
    property SessionID: Integer read GetSessionID;
    property Socket: TKXSock read Client write Client;
    property OnNewConnect: TKX_Newconnect read feNewConnect write feNewConnect;
    property OnDestroySessionData: TKX_DestroySessionData read feDestroySessionData write
      feDestroySessionData;
    property Terminated;
  end;
  TKXClientThreadClass = class of TKXClientThread;
  ///////////////////////////////////////////////////////////////////////////////
  // All protocols use this thread to listen for incoming connections. This is
  // the "Listener" thread.
  ///////////////////////////////////////////////////////////////////////////////
type
  TKXServerCoreThread = class; //forward
  TKX_ListenerFailed = procedure(ErrorCode: Integer) of object;
  TKX_MaxConnects = procedure(ServerCoreThread: TKXServerCoreThread) of object;
  TKX_Idle = procedure(ServerCoreThread: TKXServerCoreThread) of object;
  TKX_Sleep = procedure(ServerCoreThread: TKXServerCoreThread) of object;
  TKX_WakeUp = procedure(ServerCoreThread: TKXServerCoreThread) of object;
  {$WARNINGS OFF}
  TKX_UDPData = procedure(Data: Pointer; PeerIP: string; PeerPort, DataLen: Integer) of object;
  {$WARNINGS ON}
  TKXServerCoreThread = class(TThread)
  private
    fcClientThreadClass: TKXClientThreadClass;
    fbSuspend: Boolean;
    fbBufferCreates: Boolean;
    ListenerSocket: TKXSock;
    fSessionTracker: TKXSessionTracker;
    fsBindTo: string;
    fiServerPort: Integer;
    fiMaxConn: Integer;
    fbAnnouncedIdle: Byte; // 0 active, 1 going idle, 2 asleep
    feNewConnect: TKX_NewConnect;
    feMaxConnects: TKX_MaxConnects;
    feListenerFailed: TKX_ListenerFailed;
    feIdle: TKX_Idle;
    feSleep: TKX_Sleep;
    feWakeUp: TKX_WakeUp;
    feUDPData: TKX_UDPData;
    {$IFNDEF LINUX}
    fstPriority: TThreadPriority;
    {$ENDIF}
    fThreadPool: TList;
    fWhichprotocol: TWhichProtocol;
    FActiveConnections: Integer;
    fBlockSizeFlags: TKXBlockSizeFlags;
    fUseBlocking: Boolean;
    fUseNagle: Boolean;
    feListenerStarted: TNotifyEvent;
    feListenerStopped: TNotifyEvent;
    fListenerQueueSize: Integer;
  protected
    FConnectionsCount: Int64;
    MyCriticalSection: TKXCritical;
    procedure Execute; override;
    procedure SetBufferCreates(value: Boolean);
    procedure SetSuspend(value: Boolean);
    procedure SetBlocking(value: Boolean);
    procedure SetNagle(value: Boolean);
    function GetSocket: TKXSock;
  public
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy; override;
    function ActiveNumberOfConnections: Integer;
    property SessionTracker: TKXSessionTracker read fSessionTracker;
  published
    property MainSocket: TKXSock read GetSocket;
    {$IFNDEF LINUX}
    property SpawnedThreadPriority: TThreadPriority read fstPriority write fstPriority;
    {$ENDIF}
    property BlockingListener: Boolean read fUseBlocking write SetBlocking;
    property NagleListener: Boolean read fUseNagle write SetNagle;
    property BufferCreates: Boolean read fbBufferCreates write SetBufferCreates;
    property SuspendListener: Boolean read fbSuspend write SetSuspend;
    property BindTo: string read fsBindTo write fsBindTo;
    property ServerPort: Integer read fiServerPort write fiServerPort;
    property ThreadCacheSize: Integer read fiMaxConn write fiMaxConn;
    property OnNewConnect: TKX_NewConnect read feNewConnect write feNewConnect;
    property OnMaxConnects: TKX_MaxConnects read feMaxConnects write feMaxConnects;
    property OnGoingIdle: TKX_Idle read feIdle write feIdle;
    property OnAsleep: TKX_Sleep read feSleep write feSleep;
    property OnWakeUp: TKX_WakeUp read feWakeUp write feWakeUp;
    property OnListenerFailed: TKX_ListenerFailed read feListenerFailed write feListenerFailed;
    property OnListenerStarted: TNotifyEvent read feListenerStarted write feListenerStarted;
    property OnListenerStopped: TNotifyEvent read feListenerStopped write feListenerStopped;
    property OnUDPDataNoPool: TKX_UDPData read feUDPData write feUDPData;
    property ProtocolToBind: TWhichProtocol read fWhichprotocol write fWhichprotocol;
  end;

  ///////////////////////////////////////////////////////////////////////////////
  // All protocols are descendants of this object/component. When making changes
  // that need to flow to the actual protocol, like supporting a change to the
  // spawned thread. You would make the "property" in this piece of code, and
  // then when this piece of code creates the listener thread you can pass the
  // information to the listener. At that point, you could pass it down to the
  // protocol thread TKXServerThread.
  ///////////////////////////////////////////////////////////////////////////////
type
  TKXServerCore = class(TKXComponent)
  private
    fbSSL: Boolean;
    fbActive: Boolean;
    fbSuspend: Boolean;
    fbBufferCreates: Boolean;
    fsBindTo: string;
    fiServerPort: Integer;
    fiMaxConn: Integer;
    feNewConnect_: TKX_NewConnect;
    feMaxConnects: TKX_MaxConnects;
    feListenerFailed: TKX_ListenerFailed;
    feIdle: TKX_Idle;
    feSleep: TKX_Sleep;
    feWakeUp: TKX_WakeUp;
    feUDPData: TKX_UDPData;
    {$IFNDEF LINUX}
    fltPriority: TThreadPriority;
    fstPriority: TThreadPriority;
    {$ENDIF}
    fWhichprotocol: TWhichProtocol;
    fBlockSizeFlags: TKXBlockSizeFlags;
    fServerType: TServerType;
    fDummy: string;
    fbNagle: Boolean;
    fiTimeout: Cardinal;
    fListenerStarted: TNotifyEvent;
    fListenerStopped: TNotifyEvent;
    fiListenerQueueSize: Integer;
    procedure SetMaxConnects(const Value: TKX_MaxConnects);
    procedure SetListenerQueueSize(const Value: Integer);
  protected
    fListenerThread: TKXServerCoreThread;
    fcClientThreadClass: TKXClientThreadClass;
    fbForceAbort: Boolean;
    //fEventArray: TList;
    procedure SetActive(value: boolean);
    procedure SetSuspend(value: boolean);
    function GetThreadCacheSize: Integer;
    procedure SetThreadCacheSize(value: Integer);
    function GetSocket: TKXSock;
    procedure SetfiMaxConn(Value: Integer);
    procedure DoNewConnection(ClientThread: TKXClientThread); virtual;
    function TryBind(BindToIPAddress: string; BindToPort: Integer): Boolean;
  public
    constructor Create(AOwner: TComponent);
    {$IFNDEF OBJECTS_ONLY} override;
    {$ENDIF}
    destructor Destroy; override;
    function ActiveNumberOfConnections: Integer;
    procedure Start; virtual;
    procedure Stop; virtual;
    procedure Open; virtual;
    procedure Close; virtual;
    procedure Pause; virtual;
    procedure Resume; virtual;
    procedure ForceAbort;
    property Socket: TKXSock read GetSocket;
    function InternalSessionTracker: TKXSessionTracker; virtual;
    property ClientThreadClass: TKXClientThreadClass read fcClientThreadClass write
      fcClientThreadClass;
    //  published
    {$IFNDEF LINUX}
    property ListenerThreadPriority: TThreadPriority read fltPriority write fltPriority;
    property SpawnedThreadPriority: TThreadPriority read fstPriority write fstPriority;
    {$ENDIF}
    property ProtocolToBind: TWhichProtocol read fWhichprotocol write fWhichprotocol;
    property BindTo: string read fsBindTo write fsBindTo;
    property ServerPort: Integer read fiServerPort write fiServerPort;
    property IsActive: Boolean read fbActive;
    property Suspend: Boolean read fbSuspend write SetSuspend;
    property UseSSL: Boolean read fbSSL write fbSSL;
    property UseNagle: Boolean read fbNagle write fbNagle;
    property UseThreadPool: Boolean read fbBufferCreates write fbBufferCreates;
    property SocketOutputBufferSize: TKXBlockSizeFlags read fBlockSizeFlags write fBlockSizeFlags;
    property SocketQueueSize: Integer read fiListenerQueueSize write SetListenerQueueSize;
    property ServerType: TServerType read fServerType write fServerType;
    property Service: string read fDummy write fDummy;
    property ThreadCacheSize: Integer read GetThreadCacheSize write SetThreadCacheSize;
    property Timeout: Cardinal read fiTimeout write fiTimeout;

    property OnNewConnect: TKX_NewConnect read feNewConnect_ write feNewConnect_;
    property OnUDPDataNoPool: TKX_UDPData read feUDPData write feUDPData;
    property OnMaxConnects: TKX_MaxConnects read feMaxConnects write SetMaxConnects;
    property OnGoingIdle: TKX_Idle read feIdle write feIdle;
    property OnAsleep: TKX_Sleep read feSleep write feSleep;
    property OnWakeUp: TKX_WakeUp read feWakeUp write feWakeUp;
    property OnListenerFailed: TKX_ListenerFailed read feListenerFailed write feListenerFailed;
    property OnListenerStarted: TNotifyEvent read fListenerStarted write fListenerStarted;
    property OnListenerStopped: TNotifyEvent read fListenerStopped write fListenerStopped;
  end;

implementation

uses
  {$IFNDEF LINUX}
  Windows, // InterlockedXX thanks to EYAL!
  {$ENDIF}
  SysUtils,
  KXSocket;

constructor TKXClientThread.Create(CreateSuspended: Boolean);
begin
  MnLg_ev('KXServerCore TKXClientThread.Create',DCM_log.vLogDir+cLogFile);

  inherited Create(CreateSuspended);
  FreeOnTerminate := True;
  FConnectionID := 0;
  {$WARNINGS OFF}
  Client := nil;
  fpSessionData := nil;
  {$WARNINGS ON}
end;

destructor TKXClientThread.Destroy;
begin
  MnLg_ev('KXServerCore TKXClientThread.Destroy',DCM_log.vLogDir+cLogFile);

  try
    if Assigned(ListenerThreadObject) then
      if Assigned(TKXServerCoreThread(ListenerThreadObject).fSessionTracker) then
        TKXServerCoreThread(ListenerThreadObject).fSessionTracker.UnregisterSession(Self);
  except
    on E: Exception do
    begin
      //         E.Message;
    end;
  end;
  {$WARNINGS OFF}
  try
    if Assigned(fpSessionData) then
      if assigned(feDestroySessionData) then
        feDestroySessionData(Self, fpSessionData);
  except
    on E: Exception do
    begin
      //         E.Message;
    end;
  end;
  try
    if Assigned(Client) then
    begin
      Client.Free;
      Client := nil;
    end;
  except
    on E: Exception do
    begin
      //         E.Message;
    end;
  end;
  {$WARNINGS ON}
  inherited Destroy;
end;

function TKXClientThread.GetSessionID: Integer;
begin
  Result := ThreadID;
end;

procedure TKXClientThread.ProcessData;
begin
  MnLg_ev('KXServerCore TKXClientThread.ProcessData',DCM_log.vLogDir+cLogFile);

end;

///////////////////////////////////////////////////////////////////////////////
//EXECUTE:
//        Once this thread has "Resume"d, execute is called by TThread. This will
//        fire the OnExecute (where the server protocol processes the connection)
//        and once that is finished it fires the OnDisconnet event.
///////////////////////////////////////////////////////////////////////////////

procedure TKXClientThread.Execute;
{$IFDEF DICOMDEBUGZ}
var
  iii: Integer;
  {$ENDIF}
begin
  MnLg_ev('KXServerCore TKXClientThread.Execute',DCM_log.vLogDir+cLogFile);

  try
    while not Terminated do
    begin
      if Assigned(Client) then
      begin
        Client.OutputBufferSize := fBlockSizeFlags;
        if Client.ValidSocket then
        begin
          try
            if Assigned(feNewConnect) then
            begin
              feNewConnect(Self);
            end;
            {$IFDEF DICOMDEBUGZ}
            iii := GetTickCount;
            {$ENDIF}
            ProcessData;
            {$IFDEF DICOMDEBUGZ}
            iii := GetTickCount - iii;
            SendDebug(Format('%d', [iii]));
            {$ENDIF}
            ProcessWindowsMessageQueue; // have to do incase event was GUI based.
          finally
            {$IFDEF LINUX}
            TKXServerCoreThread(ListenerThreadObject).MyCriticalSection.StartingWrite;
            Dec(TKXServerCoreThread(ListenerThreadObject).FActiveConnections);
            TKXServerCoreThread(ListenerThreadObject).MyCriticalSection.FinishedWrite;
            {$ELSE}
            InterlockedDecrement(TKXServerCoreThread(ListenerThreadObject).FActiveConnections);
            {$ENDIF}
          end;
        end;
      end
      else
      begin
        FreeOnTerminate := True;
        Break;
      end;
      // incase user destoryed my DXSock client object, test client.
      if Assigned(Client) then
      begin
        try
          if Client.IsUDPMode then
            Client.Sock := INVALID_SOCKET
          else
            if Client.Sock <> INVALID_SOCKET then
            Client.CloseGracefully;
        except
          try
            Client.Free;
          finally
            Client := nil;
          end;
        end;
      end;
      if FreeOnTerminate then
        Break;
      if not Terminated then
        Suspend;
      if Terminated then
        FreeOnTerminate := false;
    end;
  finally
    Terminate;
  end;
end;

///////////////////////////////////////////////////////////////////////////////
//SETSOCKETLATER:
//               Simple implementation of this "Thread" is to pass the Create the
//               recently "Accept"ed Socket during the create. But, if you are
//               producing speed by pre-creating the threads, this procedure will
//               allow you to pre-create threads, and pass the "Socket" when the
//               new accept is valid.
///////////////////////////////////////////////////////////////////////////////

procedure TKXClientThread.SetSocketLater(Socket: TKXSock);
begin
  MnLg_ev('KXServerCore TKXClientThread.SetSocketLater',DCM_log.vLogDir+cLogFile);

  if Assigned(Client) then
  begin
    Client.Free;
    Client := nil;
  end;
  Client := Socket;
  Client.PeerIPAddress := Socket.PeerIPAddress;
  Client.PeerPort := Socket.PeerPort;
end;

procedure TKXClientThread.SetReply(const ANumericCode: Integer; const AText: string);
begin
  MnLg_ev('KXServerCore TKXClientThread.SetReply',DCM_log.vLogDir+cLogFile);

  Socket.Writeln(Format('%d %s', [ANumericCode, AText]));
end;
///////////////////////////////////////////////////////////////////////////////
// 'LISTENER' THREAD
// =================
//       This is the "Outter" Thread of a server. It does the listening loop, and
//       creates the thread that interacts with the client. Think of this as a
//       while active listen for a connection, and on connection spawn a thread
//       for the client connection (DXServerThread).
///////////////////////////////////////////////////////////////////////////////

constructor TKXServerCoreThread.Create(CreateSuspended: Boolean);
begin
  MnLg_ev('KXServerCore TKXServerCoreThread.Create',DCM_log.vLogDir+cLogFile);

  inherited Create(CreateSuspended);
  FreeOnTerminate := False;
  ListenerSocket := TKXSock.Create(nil); // RC2
  fsBindTo := '';
  fiServerPort := 0;
  fiMaxConn := 500;
  FActiveConnections := 0;
  FConnectionsCount := 1;
  fbAnnouncedIdle := 0;
  fbBufferCreates := True;
  fThreadPool := TList.Create;
  MyCriticalSection := TKXCritical.Create;
  fSessionTracker := TKXSessionTracker.Create(nil);
end;

destructor TKXServerCoreThread.Destroy;
begin
  MnLg_ev('KXServerCore TKXServerCoreThread.Destroy',DCM_log.vLogDir+cLogFile);

  {$WARNINGS OFF}
  if Assigned(fThreadPool) then
  begin
    MyCriticalSection.StartingWrite;
    while fThreadPool.Count > 0 do
    begin
      if Assigned(fThreadPool[0]) then
      begin
        try
          TKXClientThread(fThreadPool[0]).ListenerThreadObject := nil;
          fSessionTracker.UnRegisterSession(TKXClientThread(fThreadPool[0]));
        finally
          try
            // this will raise an exception if it is already set "FreeOnTerminate"!
            if TKXClientThread(fThreadPool[0]).Suspended then
            begin
              TKXClientThread(fThreadPool[0]).FreeOnTerminate := True;
              TKXClientThread(fThreadPool[0]).Terminate;
              TKXClientThread(fThreadPool[0]).Resume;
            end
            else
            begin
              TKXClientThread(fThreadPool[0]).FreeOnTerminate := True;
              TKXClientThread(fThreadPool[0]).Terminate;
            end;
          except
            ;
          end;
        end;
      end;
      fThreadPool.Delete(0);
    end;
    fThreadPool.Free;
    fThreadPool := nil;
    MyCriticalSection.FinishedWrite;
  end;
  fSessionTracker.Free;
  fSessionTracker := nil;
  {$WARNINGS ON}
  try
    if Assigned(ListenerSocket) then
    begin
      MnLg_ev('KXServerCore ListenerSocket.CloseNow',DCM_log.vLogDir+cLogFile);
      ListenerSocket.CloseNow;
      ListenerSocket.Free;
    end;
  finally
    ListenerSocket := nil;
  end;
  MyCriticalSection.Free;
  inherited Destroy;
end;

function TKXServerCoreThread.ActiveNumberOfConnections: Integer;
begin
  Result := fActiveConnections;
end;

procedure TKXServerCoreThread.SetBlocking(value: Boolean);
begin
  if value then
  begin
    MnLg_ev('KXServerCore TKXServerCoreThread.SetBlocking=True',DCM_log.vLogDir+cLogFile);
  end else begin
    MnLg_ev('KXServerCore TKXServerCoreThread.SetBlocking=False',DCM_log.vLogDir+cLogFile);
  end;

  fUseBlocking := Value;
  if ListenerSocket.ValidSocket then
    ListenerSocket.SetBlocking(Value);
end;

procedure TKXServerCoreThread.SetNagle(value: Boolean);
begin
  if value then
  begin
    MnLg_ev('KXServerCore TKXServerCoreThread.SetNagle=True',DCM_log.vLogDir+cLogFile);
  end else begin
    MnLg_ev('KXServerCore TKXServerCoreThread.SetNagle=False',DCM_log.vLogDir+cLogFile);
  end;

  fUseNagle := Value;
  if ListenerSocket.ValidSocket then
    ListenerSocket.SetNagle(Value);
end;

procedure TKXServerCoreThread.SetBufferCreates(value: Boolean);
begin
  if fActiveConnections > 0 then
    Exit;
  fbBufferCreates := Value;
  if not Value then
    if fiMaxConn < 1 then
      fiMaxConn := 50;
end;

procedure TKXServerCoreThread.SetSuspend(value: Boolean);
begin
  fbSuspend := Value;
end;

function TKXServerCoreThread.GetSocket: TKXSock;
begin
  MnLg_ev('KXServerCore TKXServerCoreThread.GetSocket',DCM_log.vLogDir+cLogFile);

  Result := ListenerSocket;
end;

///////////////////////////////////////////////////////////////////////////////
//EXECUTE:
//        This is the "Loop" for the server. It listens on the specified port and
//        IP address(es). As a connection comes in, it creates a DXServerThread
//        and gives it a new instance of the client socket. At that point the new
//        DXServerThread runs independant of this thread. If you wish to have a
//        pool of DXServerThreads suspended this is the section to change! When
//        a new DXServerThread is created, all of the "Events" are passed to it,
//        which means you "Server" events better be threadsafe!
//
//        Events: OnIdle is fired one the server has stopped receiving connection
//        requests. It is fired everytime the server goes idle from connection(s)
//        OnSleep is fired every two seconds after this loop has gone Idle.
///////////////////////////////////////////////////////////////////////////////

procedure TKXServerCoreThread.Execute;
var
  toggleSleep: Integer;
  DXClientThread: TKXClientThread;
  newClient: TKXSock;

  function InitializeThreading(UDP: Boolean): Boolean;
  var
    NewListen: PNewListen;
    Ws: string;

  begin
    MnLg_ev('KXServerCore TKXServerCoreThread.Execute InitializeThreading',DCM_log.vLogDir+cLogFile);

    toggleSleep := 0;
    Result := False;
    if (Length(fsBindTo) > 7) then
      ListenerSocket.BindTo := fsBindTo;
    New(NewListen);
    with NewListen^ do
    begin
      Port := fiServerPort;
      UseNAGLE := fUseNagle;
      UseBlocking := fUseBlocking;
      UseUDP := UDP;
      WinsockQueue := fListenerQueueSize;
      ConnectionLess := UDP;
    end;
    MnLg_ev('----------------------------------------- NewListener :'+#13+
            'Port := '+inttostr(fiServerPort)+#13+
            'UseNAGLE := '+DCM_log.BoolToStr(fUseNagle)+#13+
            'UseBlocking := '+DCM_log.BoolToStr(fUseBlocking)+#13+
            'UseUDP := '+DCM_log.BoolToStr(UDP)+#13+
            'WinsockQueue := '+inttostr(fListenerQueueSize)+#13+
            'ConnectionLess := '+DCM_log.BoolToStr(UDP)+#13+
            '-----------------------------------------'
            ,DCM_log.vLogDir+cLogFile);

    if not ListenerSocket.Listen(NewListen) then
    begin
      MnLg_ev('KXServerCore TKXServerCoreThread.Execute !!! not ListenerSocket.Listen',DCM_log.vLogDir+cLogFile);

      Dispose(NewListen);
      if Assigned(feListenerFailed) then
      begin
        feListenerFailed(ListenerSocket.LastCommandStatus);
        ProcessWindowsMessageQueue; // have to do incase event was GUI based.
      end
      else
      begin
        Str(fiServerPort, Ws);
        {$IFNDEF LINUX}
        if IsConsole then
        begin
        //  Beep;
        //  Beep;
        //  Beep;
          Writeln('Listener on port ' + Ws + ', ' +
            ListenerSocket.GetErrorDesc(ListenerSocket.LastCommandStatus));
          ProcessWindowsMessageQueue; //DoSleepEx(1000);
        end
        else
          {$ENDIF}
          MnLg_ev('KXServerCore '+'Listener on port ' + Ws+' LastCommandStatus='+
            ListenerSocket.GetErrorDesc(ListenerSocket.LastCommandStatus),DCM_log.vLogDir+cLogFile);
//          ShowMessageWindow('Listener on port ' + Ws,
//            ListenerSocket.GetErrorDesc(ListenerSocket.LastCommandStatus));
      end;
      Exit;
    end;
    Dispose(NewListen);
    Result := True;
    if Assigned(feListenerStarted) then
    begin
      feListenerStarted(Self);
      ProcessWindowsMessageQueue; // have to do incase event was GUI based.
    end;
  end;

  procedure EventsOrSleep;
  begin
    MnLg_ev('KXServerCore EventsOrSleep',DCM_log.vLogDir+cLogFile);

    if toggleSleep < 2000 then  // 2 seconds
    begin
      MnLg_ev('KXServerCore toggleSleep < 2000',DCM_log.vLogDir+cLogFile);

      Inc(toggleSleep);
      if (toggleSleep > 1000) and (fbAnnouncedIdle < 1) then
      begin
        fbAnnouncedIdle := 1;
        if assigned(feIdle) then
        begin
          feIdle(Self);
          ProcessWindowsMessageQueue; // have to do incase event was GUI based.
        end;
      end;
      //         DoSleepEx(1); // 4RC2
    end
    else
    begin
      MnLg_ev('KXServerCore toggleSleep >= 2000',DCM_log.vLogDir+cLogFile);

      if fbAnnouncedIdle = 1 then
      begin
        if assigned(feSleep) then
        begin
          MnLg_ev('KXServerCore !!! feSleep(Self',DCM_log.vLogDir+cLogFile);

          feSleep(Self);
          ProcessWindowsMessageQueue; // have to do - incase event was GUI based.
        end;
        fbAnnouncedIdle := 2;
      end;
      if toggleSleep < 5000 {3.0 - was 50} then
      begin
        Inc(toggleSleep);
        //            DoSleepEx(1); // 4RC2
      end
      else
      begin
        //DoSleepEx(1);
        ProcessWindowsMessageQueue;
      end;
    end;
  end;

  procedure ThreadAtATime;

  begin
    MnLg_ev('KXServerCore ThreadAtATime fcClientThreadClass.Create',DCM_log.vLogDir+cLogFile);

    DXClientThread := fcClientThreadClass.Create(True);
    DXClientThread.Client := TKXSock.Create(nil); // RC2
    {$IFNDEF LINUX}
    DXClientThread.Priority := fstPriority;
    {$ENDIF}
    DXClientThread.OnNewConnect := feNewConnect;
    DXClientThread.fBlockSizeFlags := fBlockSizeFlags;
    DXClientThread.ListenerThreadObject := Self;
    DXClientThread.FConnectionID := FConnectionsCount;

    MnLg_ev('KXServerCore ThreadAtATime while not Terminated do',DCM_log.vLogDir+cLogFile);

    while not Terminated do
    begin
      if (FActiveConnections < fiMaxConn) then
      begin
        //if fbSuspend then
        //  ProcessWindowsMessageQueue //DoSleepEx(20)
        //else
        if ListenerSocket.Accept(DXClientThread.Client) then
        begin

          MnLg_ev('KXServerCore ThreadAtATime ListenerSocket.Accept(DXClientThread.Client)',DCM_log.vLogDir+cLogFile);

          fSessionTracker.RegisterSession(DXClientThread);
          DXClientThread.Resume;
          {$IFDEF LINUX}
          MyCriticalSection.StartingWrite;
          Inc(FActiveConnections);
          MyCriticalSection.FinishedWrite;
          {$ELSE}
          InterlockedIncrement(FActiveConnections);

          inc(FConnectionsCount);
          {$ENDIF}
          if (fbAnnouncedIdle > 0) then
          begin

            MnLg_ev('KXServerCore ThreadAtATime feWakeUp(Self)',DCM_log.vLogDir+cLogFile);

            if Assigned(feWakeUp) then
            begin
              feWakeUp(Self);
              ProcessWindowsMessageQueue; // have to do incase event was GUI based.
            end;
          end;

          MnLg_ev('KXServerCore ThreadAtATime fcClientThreadClass.Create(True)',DCM_log.vLogDir+cLogFile);

          DXClientThread := fcClientThreadClass.Create(True);
          DXClientThread.FConnectionID := FConnectionsCount;
          try
            DXClientThread.Client := TKXSock.Create(nil); // RC2
          except
            on e: Exception do
            begin

              MnLg_ev('KXServerCore ThreadAtATime feListenerFailed',DCM_log.vLogDir+cLogFile);

              if Assigned(feListenerFailed) then
              begin
                feListenerFailed(9999);
                ProcessWindowsMessageQueue; // have to do incase event was GUI based.
              end
            end;
          end;
          {$IFNDEF LINUX}
          DXClientThread.Priority := fstPriority;
          {$ENDIF}
          DXClientThread.OnNewConnect := feNewConnect;
          DXClientThread.fBlockSizeFlags := fBlockSizeFlags;
          DXClientThread.ListenerThreadObject := Self;
          fbAnnouncedIdle := 0;
          toggleSleep := 0;

        end
        else
          ProcessWindowsMessageQueue;
        //  EventsOrSleep;
      end
      else
      begin

        MnLg_ev('KXServerCore ThreadAtATime feMaxConnects',DCM_log.vLogDir+cLogFile);

        if assigned(feMaxConnects) then
        begin
          feMaxConnects(Self);
          ProcessWindowsMessageQueue; // have to do incase event was GUI based.
        end
        else
          ProcessWindowsMessageQueue; //DoSleepEx(1);
      end;
    end;
    ListenerSocket.CloseNow;
    fSessionTracker.UnRegisterSession(DXClientThread);
    DXClientThread.FreeOnTerminate := True;
    DXClientThread.Terminate;

    MnLg_ev('KXServerCore ThreadAtATime ListenerSocket.CloseNow;'+#13+
            'fSessionTracker.UnRegisterSession(DXClientThread);'+#13+
            'DXClientThread.FreeOnTerminate := True;'+#13+
            'DXClientThread.Terminate;',DCM_log.vLogDir+cLogFile);

  end;

  procedure ThreadPool;
  var
    NextThread: Integer;
    LoopCount: Integer;
    Done: Boolean;

  begin

    MnLg_ev('KXServerCore !!!!!!!!!!!!!!! ThreadPool !!!!!!!!!!!!!!',DCM_log.vLogDir+cLogFile);

    while fThreadPool.Count < fiMaxConn - 1 do
    begin
      DXClientThread := fcClientThreadClass.Create(True);
      DXClientThread.FreeOnTerminate := False; // flags "Is ThreadPool".
      {$IFNDEF LINUX}
      DXClientThread.Priority := fstPriority;
      {$ENDIF}
      DXClientThread.OnNewConnect := feNewConnect;
      DXClientThread.fBlockSizeFlags := fBlockSizeFlags;
      DXClientThread.ListenerThreadObject := Self;
      DXClientThread.Client := nil;
      fThreadPool.Add(DXClientThread);
      fSessionTracker.RegisterSession(DXClientThread);
    end;
    LoopCount := fThreadPool.Count;
    NextThread := 0;
    {$WARNINGS OFF}

    MnLg_ev('KXServerCore ThreadPool while not Terminated do',DCM_log.vLogDir+cLogFile);

    while not Terminated do
    begin
      if fbSuspend then
        ProcessWindowsMessageQueue //;DoSleepEx(20)
      else
      if ListenerSocket.Accept(TKXClientThread(fThreadPool[NextThread]).Client) then
      begin
        TKXClientThread(fThreadPool[NextThread]).Resume;
        {$IFDEF LINUX}
        MyCriticalSection.StartingWrite;
        Inc(FActiveConnections);
        MyCriticalSection.FinishedWrite;
        {$ELSE}
        InterlockedIncrement(FActiveConnections);
        {$ENDIF}
        Inc(NextThread);
        if NextThread >= LoopCount then
          NextThread := 0;
        Done := False;
        while (not Terminated) and (not fbSuspend) and (not done) do
        begin
          if TKXClientThread(fThreadPool[NextThread]).Client = nil then
            Done := True
          else
            if not TKXClientThread(fThreadPool[NextThread]).Client.ValidSocket then
            Done := True
          else
          begin
            Inc(NextThread);
            if NextThread >= LoopCount then
              NextThread := 0;
          end;
        end;
        toggleSleep := 0;
        if (fbAnnouncedIdle > 0) then
        begin
          if Assigned(feWakeUp) then
          begin
            feWakeUp(Self);
            ProcessWindowsMessageQueue; // have to do incase event was GUI based.
          end;
        end;
        fbAnnouncedIdle := 0;
      end
      else
        EventsOrSleep;
    end;
    ListenerSocket.CloseNow;
    {$WARNINGS ON}
  end;

  {$WARNINGS OFF}
  procedure UDPSingleThreaded;
  var
    Data: Pointer;
    DataSize: Integer;

  begin

    MnLg_ev('KXServerCore UDPSingleThreaded',DCM_log.vLogDir+cLogFile);

    if Assigned(feUDPData) then
      GetMem(Data, TKXMaxSocketBuffer);
    while not Terminated do
    begin
      if (FActiveConnections < fiMaxConn) then
      begin
        if fbSuspend then
          ProcessWindowsMessageQueue //; DoSleepEx(20)
        else
          if ListenerSocket.Readable then
        begin
          if Assigned(feUDPData) then
          begin
            {$IFDEF VER100}
            DataSize := ListenerSocket.BlockRead(Data, TKXMaxSocketBuffer);
            {$ELSE}
            DataSize := ListenerSocket.Read(Data, TKXMaxSocketBuffer);
            {$ENDIF}
            feUDPData(Data, inet_ntoa(ListenerSocket.SockAddr.sin_addr),
              ntohs(ListenerSocket.SockAddr.sin_port), DataSize);
            ProcessWindowsMessageQueue; // have to do incase event was GUI based.
          end
          else
          begin
            newClient := TKXSock.Create(nil); // RC2
            newClient.Sock := ListenerSocket.Sock;
            newClient.IsUDPMode := True;
            DXClientThread := fcClientThreadClass.Create(True);
            DXClientThread.SetSocketLater(newClient);
            {$IFNDEF LINUX}
            DXClientThread.Priority := fstPriority;
            {$ENDIF}
            DXClientThread.OnNewConnect := feNewConnect;
            DXClientThread.fBlockSizeFlags := fBlockSizeFlags;
            DXClientThread.ListenerThreadObject := Self;
            fSessionTracker.RegisterSession(DXClientThread);

            DXClientThread.Resume;
          end;
          if (fbAnnouncedIdle > 0) then
          begin
            if Assigned(feWakeUp) then
            begin
              feWakeUp(Self);
              ProcessWindowsMessageQueue; // have to do incase event was GUI based.
            end;
          end;
          toggleSleep := 0;
          fbAnnouncedIdle := 0;
        end
        else
          EventsOrSleep;
      end
      else
      begin
        if assigned(feMaxConnects) then
        begin
          feMaxConnects(Self);
          ProcessWindowsMessageQueue; // have to do incase event was GUI based.
        end
        else
        begin
          ProcessWindowsMessageQueue; //DoSleepEx(1);
        end;
      end;
    end;
    if Assigned(feUDPData) then
      FreeMem(Data, TKXMaxSocketBuffer);
  end;
  {$WARNINGS ON}

begin
  if terminated then
    exit;
  if not Assigned(ListenerSocket) then
  begin

    MnLg_ev('KXServerCore #998 Developer Trap #2 '+
      'You must pass the listerner socket. You have coded around ' +
      'our fail-safe routines!',DCM_log.vLogDir+cLogFile);


  {  ShowMessageWindow(
      'Developer Trap #2',
      'You must pass the listerner socket. You have coded around ' +
      'our fail-safe routines!'); }
    Exit;
  end;
  try
    if not InitializeThreading({False}fWhichprotocol = wpUDPOnly) then
      Exit;
    if fWhichprotocol = wpUDPOnly then
      UDPSinglethreaded
    else
    begin
      case fbBufferCreates of
        False:
          begin

            MnLg_ev('KXServerCore #1020 ThreadAtATime',DCM_log.vLogDir+cLogFile);

            ThreadAtATime;
          end;
      else
        begin

          MnLg_ev('KXServerCore #1020 ThreadPool',DCM_log.vLogDir+cLogFile);

          ThreadPool;
        end;
      end;
    end;
  finally
    FreeOnTerminate := True;
    if Assigned(feListenerStopped) then
    begin

      MnLg_ev('KXServerCore #1038 feListenerStopped',DCM_log.vLogDir+cLogFile);

      feListenerStopped(Self);
      ProcessWindowsMessageQueue; // have to do incase event was GUI based.
    end;
    //      Terminate;
  end;
end;

///////////////////////////////////////////////////////////////////////////////
// ANCESTOR TO ALL PROTOCOLS
// =========================
// DXSERVERCORE - Mainly Allows for "Properties" to be defined. And to Start,
// Stop, and Suspend the 'LISTNER' Thread.
//
//       Protocols use this object to interact with the DXSock environment. This
//       Section allows the protocol to specify the status of the server.
///////////////////////////////////////////////////////////////////////////////

constructor TKXServerCore.Create(AOwner: TComponent);
begin

  MnLg_ev('KXServerCore TKXServerCore.Create',DCM_log.vLogDir+cLogFile);

  inherited create(aowner);
  fcClientThreadClass := TKXClientThread;
  fbActive := False;
  fiMaxConn := 500;
  fbBufferCreates := True;
  {$IFNDEF LINUX}
  fstPriority := tpHighest; //tpNormal;
  fltPriority := tpHighest; //tpNormal;
  {$ENDIF}
  fWhichProtocol := wpTCPOnly;
  fBlockSizeFlags := bsfHuge;
  fServerType := stThreadBlocking;
  fbNagle := true; //false;
  fiTimeout := 60000;
  //fEventArray := TList.Create;
  fiListenerQueueSize := 200;
end;

destructor TKXServerCore.Destroy;
begin

  MnLg_ev('KXServerCore TKXServerCore.Destroy',DCM_log.vLogDir+cLogFile);

  if fbActive then
    SetActive(False);
  {if Assigned(fEventArray) then
  begin
    fEventArray.Free;
    fEventArray := nil;
  end;}
  inherited destroy;
end;

function TKXServerCore.GetSocket: TKXSock;
begin

  MnLg_ev('KXServerCore TKXServerCore.GetSocket',DCM_log.vLogDir+cLogFile);

  if Assigned(fListenerThread) then
    Result := fListenerThread.ListenerSocket
  else
    Result := nil;
end;

function TKXServerCore.ActiveNumberOfConnections: Integer;
begin

  MnLg_ev('KXServerCore TKXServerCore.ActiveNumberOfConnections',DCM_log.vLogDir+cLogFile);

  if Assigned(fListenerThread) then
    Result := fListenerThread.ActiveNumberOfConnections
  else
    Result := 0;
end;

procedure TKXServerCore.SetActive(value: boolean);
begin

  MnLg_ev('KXServerCore TKXServerCore.SetActive='+DCM_log.BoolToStr(value),DCM_log.vLogDir+cLogFile);

  {$IFNDEF OBJECTS_ONLY}
  if (csDesigning in ComponentState) then
    exit;
  {$ENDIF}
  fbSuspend := False;
  if Value <> fbActive then
  begin
    if Value then
    begin
      {      if not Assigned(feNewConnect_) then
            begin
              if not Assigned(feUDPData) then
              begin
                ShowMessageWindow(
                  'Developer Trap #1!',
                  'You must specify a OnNewConnect Event!');
                Exit;
              end;
            end;}
      fbActive := Value;
      fbSuspend := false;
      fListenerThread := TKXServerCoreThread.Create(True);

      MnLg_ev('KXServerCore fListenerThread := TKXServerCoreThread.Create',DCM_log.vLogDir+cLogFile);

      fListenerThread.fcClientThreadClass := fcClientThreadClass;
      fListenerThread.fsBindTo := fsBindTo;
      fListenerThread.fiServerPort := fiServerPort;
      fListenerThread.fiMaxConn := fiMaxConn;
      fListenerThread.feNewConnect := DoNewConnection;
      fListenerThread.feMaxConnects := feMaxConnects;
      fListenerThread.feListenerFailed := feListenerFailed;
      fListenerThread.feListenerStarted := fListenerStarted;
      fListenerThread.feListenerStopped := fListenerStopped;
      fListenerThread.feIdle := feIdle;
      fListenerThread.feSleep := feSleep;
      fListenerThread.feWakeUp := feWakeUp;
      fListenerThread.fListenerQueueSize := fiListenerQueueSize; // RC2

      {$IFNDEF LINUX}
      fListenerThread.Priority := fltPriority;
      fListenerThread.SpawnedThreadPriority := fstPriority;
      {$ENDIF}
      fListenerThread.fBlockSizeFlags := fBlockSizeFlags;
      fListenerThread.fbSuspend := fbSuspend;
      fListenerThread.feUDPData := feUDPData;
      {$WARNINGS OFF}
      //      if DebugHOOK <> 0 then
      //        fListenerThread.fbBufferCreates := False
      //      else
      fListenerThread.fbBufferCreates := fbBufferCreates;
      {$WARNINGS ON}
      fListenerThread.fWhichProtocol := fWhichProtocol;
      fListenerThread.NagleListener := fbNagle;
      fListenerThread.BlockingListener := fServerType = stThreadBlocking;
      fListenerThread.Resume;
    end
    else
    begin
      fbActive := Value;
      if Assigned(fListenerThread) then
      begin
        if fListenerThread.Suspended then
        begin
          //               fListenerThread.FreeOnTerminate:=True;
          fListenerThread.Terminate;
          fListenerThread.Resume;
        end
        else
        begin
          //               fListenerThread.FreeOnTerminate:=True;
          fListenerThread.Terminate;
        end;
      end;
    end;
  end;
end;

procedure TKXServerCore.Start;
begin
  if TryBind('', fiServerPort) then
    SetActive(True)
end;

procedure TKXServerCore.Stop;
begin
  SetActive(False)
end;

procedure TKXServerCore.Open;
begin
  Start;
end;

procedure TKXServerCore.Close;
begin
  Stop;
end;

procedure TKXServerCore.Pause;
begin
  SetSuspend(True);
end;

procedure TKXServerCore.Resume;
begin
  SetSuspend(False);
end;

procedure TKXServerCore.SetSuspend(value: boolean);
begin
  if fbActive then
  begin
    fbSuspend := Value;
    fListenerThread.SuspendListener := Value;
  end;
end;

procedure TKXServerCore.SetfiMaxConn(Value: Integer);
begin
  if Value < 1 then
  begin
    {$WARNINGS OFF}
    if DebugHOOK <> 0 then
      Exit; {cant enable this from within DELPHI live!}
    {$WARNINGS ON}
    fiMaxConn := -1;
    fbBufferCreates := True;
  end
  else
    fiMaxConn := Value;
end;

function TKXServerCore.GetThreadCacheSize: Integer;
begin
  Result := fiMaxConn;
end;

procedure TKXServerCore.SetThreadCacheSize(value: Integer);
begin
  SetfiMaxConn(Value);
end;

function TKXServerCore.InternalSessionTracker: TKXSessionTracker;
begin
  if Assigned(fListenerThread) then
    Result := fListenerThread.fSessionTracker
  else
    Result := nil;
end;

procedure TKXServerCore.ForceAbort;
begin
  fbForceAbort := True;
end;

procedure TKXServerCore.DoNewConnection(ClientThread: TKXClientThread);
begin
  if Assigned(feNewConnect_) then
  begin
    feNewConnect_(ClientThread);
  end;
end;

function TKXServerCore.TryBind(BindToIPAddress: string; BindToPort: Integer): Boolean;
var
  SockAddr: TSockAddrIn;
  n1: TSocket;
  ErrorCode: Integer;
begin

  MnLg_ev('KXServerCore TKXServerCore.TryBind',DCM_log.vLogDir+cLogFile);

  Result := false;
  FillChar(SockAddr, Sizeof(SockAddr), #0);
  // DO ! USE ZEROMEMORY
  // SPX: Result:=CreateSocket(AF_IPX,SOCK_STREAM,NSPROTO_SPX,ErrorCode);
  // IPX: Result:=CreateSocket(AF_IPX,SOCK_DGRAM,NSPROTO_IPX,ErrorCode);

  n1 := CreateSocket(AF_INET, SOCK_STREAM, IPPROTO_TCP, ErrorCode);
  if (n1 <> Invalid_Socket) and (not UseNAGLE) then
    SetNAGLE(n1, UseNAGLE, ErrorCode);

  if n1 = Invalid_Socket then
    Exit;
  SockAddr.sin_family := AF_INET;
  SockAddr.sin_port := htons(BindToPORT);
  // 7-27
  if (length(BindToIPAddress) < 7) then
    SockAddr.sin_addr.S_addr := INADDR_ANY
  else
    SockAddr.sin_addr.S_addr := Inet_Addr(PAnsiChar(BindToIPAddress));
  if Bind(n1, SockAddr, ConstSizeofTSockAddrIn) = Socket_Error then
  begin
    n1 := Invalid_Socket;
    ErrorCode := WSAGetLastError;

    CloseConnection(n1, False);

    MnLg_ev('KXServerCore !!!ERROR!!! '+'Listener on port ' + IntToStr(BindToPort) + ' Error: ' +
      GetErrorDesc(errorcode),DCM_log.vLogDir+cLogFile);

   { raise exception.Create('Listener on port ' + IntToStr(BindToPort) + ' Error: ' +
      GetErrorDesc(errorcode));  }
    Result := false;
  end
  else
    Result := true;
  CloseConnection(n1, False);
end;

procedure TKXServerCore.SetMaxConnects(const Value: TKX_MaxConnects);
begin
  feMaxConnects := Value;
end;

procedure TKXServerCore.SetListenerQueueSize(const Value: Integer);
begin
  fiListenerQueueSize := Value;
end;

end.

