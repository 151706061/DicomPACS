{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit KxThread;

interface

uses
  Classes,  SysUtils, SyncObjs, DCM_log;

type
  EKxThreadException = class(Exception);
  EKxThreadTerminateAndWaitFor = class(EKxThreadException);

  TKxThreadStopMode = (smTerminate, smSuspend);
  TKxThread = class;
  TKxExceptionThreadEvent = procedure(AThread: TKxThread; AException: Exception) of object;
  TKxNotifyThreadEvent = procedure(AThread: TKxThread) of object;
  TKxSynchronizeThreadEvent = procedure(AThread: TKxThread; AData: Pointer) of object;

  // Expose protected members
  TKxBaseThread = class(TThread)
  public
    procedure Synchronize(Method: TThreadMethod); overload;
    procedure Synchronize(Method: TMethod); overload;
    //
    property  ReturnValue;
    property  Terminated;
  End;//TKxBaseThread

  TKxThread = class(TKxBaseThread)
  protected
    FData: TObject;
    FLock: TCriticalSection;
    FStopMode: TKxThreadStopMode;
    FStopped: Boolean;
    FTerminatingException: string;
    FTerminatingExceptionClass: TClass;
    FOnException: TKxExceptionThreadEvent;
    FOnStopped: TKxNotifyThreadEvent;
    //
    procedure AfterRun; virtual; //3* Not abstract - otherwise it is required
    procedure AfterExecute; virtual;//5 Not abstract - otherwise it is required
    procedure BeforeExecute; virtual;//1 Not abstract - otherwise it is required
    procedure BeforeRun; virtual; //2* Not abstract - otherwise it is required
    procedure Cleanup; virtual;//4*
    procedure DoException (AException: Exception); virtual;
    procedure DoStopped; virtual;
    procedure Execute; override;
    function  GetStopped: Boolean;
    procedure Run; virtual; abstract;
  public
    constructor Create(ACreateSuspended: Boolean = True); virtual;
    destructor Destroy; override;
    procedure Start; virtual;
    procedure Stop; virtual;

    // Here to make virtual
    procedure Terminate; virtual;
    procedure TerminateAndWaitFor; virtual;
    //
    property Data: TObject read FData write FData;
    property StopMode: TKxThreadStopMode read FStopMode write FStopMode;
    property Stopped: Boolean read GetStopped;
    // in future versions (D6+) we must move to TThread.FatalException
    property TerminatingException: string read FTerminatingException;
    property TerminatingExceptionClass: TClass read FTerminatingExceptionClass;
    // events
    property OnException: TKxExceptionThreadEvent read FOnException write FOnException;
    property OnStopped: TKxNotifyThreadEvent read FOnStopped write FOnStopped;
  End;//TKxThread

  TKxThreadClass = class of TKxThread;

implementation
//uses IdResourceStrings;

procedure TKxThread.TerminateAndWaitFor;
begin
 // MnLg_ev('KxThread TKxThread.TerminateAndWaitFor',vLogDir+pLogFile);

  if FreeOnTerminate then begin
    raise EKxThreadTerminateAndWaitFor.Create('Cannot call TerminateAndWaitFor on FreeAndTerminate threads'); 
  end;
  Terminate;
  if Suspended then begin
    Resume;
  end;
  WaitFor;
end;

procedure TKxThread.BeforeRun;
begin
end;

procedure TKxThread.AfterRun;
begin
end;

procedure TKxThread.BeforeExecute;
begin
end;

procedure TKxThread.AfterExecute;
Begin
end;

procedure TKxThread.Execute;
begin
 // MnLg_ev('KxThread TKxThread.Execute',vLogDir+pLogFile);

  try
    try
      BeforeExecute;
      while not Terminated do begin
        if Stopped then begin
          DoStopped;
          // It is possible that either in the DoStopped or from another thread,
          // the thread is restarted, in which case we dont want to restop it.
          if Stopped then begin // DONE: if terminated?
            if Terminated then begin
              Break;
            end;
            Suspended := True; // Thread manager will revive us
            if Terminated then begin
              Break;
            end;
          end;
        end;

        try
          BeforeRun;
          try
            while not Stopped do begin
              Run;
            end;
          finally
            AfterRun;
          end;//tryf
        finally
          Cleanup;
        end;

      end;//while NOT Terminated
    finally
      AfterExecute;
    end;
  except
    on E: Exception do begin
      FTerminatingExceptionClass := E.ClassType;
      FTerminatingException := E.Message;
      DoException(E);
      Terminate;
    end;
  end;//trye
end;

constructor TKxThread.Create(ACreateSuspended: Boolean);
begin
 // MnLg_ev('KxThread TKxThread.Create',vLogDir+pLogFile);

  // Before inherited - inherited creates the actual thread and if not suspeded
  // will start before we initialize
  FStopped := ACreateSuspended;
  FLock := TCriticalSection.Create;
  try
    inherited Create(ACreateSuspended);
  except
    FreeAndNil(FLock);
    raise;
  end;
end;

destructor TKxThread.Destroy;
begin
//  MnLg_ev('KxThread TKxThread.Destroy',vLogDir+pLogFile);

  FreeOnTerminate := FALSE; //prevent destroy between Terminate & WaitFor
  inherited Destroy; //Terminate&WaitFor
  Cleanup;
  FreeAndNil(FLock); 
end;

procedure TKxThread.Start;
begin
  FLock.Enter;

 // MnLg_ev('KxThread TKxThread.Start - FLock.Enter;',vLogDir+pLogFile);

  try
    if Stopped then begin
      // Resume is also called for smTerminate as .Start can be used to initially start a
      // thread that is created suspended
      FStopped := False;
      Suspended := False;
    end;
  finally
    FLock.Leave;

  //  MnLg_ev('KxThread TKxThread.Start - FLock.Leave;',vLogDir+pLogFile);

  end;
end;

procedure TKxThread.Stop;
begin
  FLock.Enter;

 // MnLg_ev('KxThread TKxThread.Stop - FLock.Enter;',vLogDir+pLogFile);

  try
    if not Stopped then begin
      case FStopMode of
        smTerminate: Terminate;
        // DO NOT suspend here. Suspend is immediate. See Execute for implementation
        smSuspend: ;
      end;
      FStopped := True;
    end;
  finally
    FLock.Leave;

 //   MnLg_ev('KxThread TKxThread.Stop - FLock.Leave;',vLogDir+pLogFile);

  end;
end;

function TKxThread.GetStopped: Boolean;
begin
//  MnLg_ev('KxThread TKxThread.GetStopped - try',vLogDir+pLogFile);

  if Assigned(FLock) then begin
    FLock.Enter;

    MnLg_ev('KxThread TKxThread.GetStopped - FLock.Enter;',vLogDir+pLogFile);

    try
      // Suspended may be true if checking stopped from another thread
      Result := Terminated or FStopped or Suspended;
    finally
      FLock.Leave;

   //   MnLg_ev('KxThread TKxThread.GetStopped - FLock.Leave;',vLogDir+pLogFile);

    end;
  end else begin
    Result := TRUE; //user call Destroy
  end;
End;//GetStopped

procedure TKxThread.DoStopped;
begin
 // MnLg_ev('KxThread TKxThread.DoStopped',vLogDir+pLogFile);

  if Assigned(OnStopped) then begin
    OnStopped(Self);
  end;
end;

procedure TKxThread.DoException (AException: Exception);
Begin
 // MnLg_ev('KxThread TKxThread.DoException',vLogDir+pLogFile);

  if Assigned(FOnException) then begin
    FOnException(self, AException);
  end;
end;

procedure TKxThread.Terminate;
begin
 // MnLg_ev('KxThread TKxThread.Terminate',vLogDir+pLogFile);

  FStopped := True;
  inherited Terminate;
end;

procedure TKxThread.Cleanup;
begin
 // MnLg_ev('KxThread TKxThread.Cleanup',vLogDir+pLogFile);

  FreeAndNil(FData);
end;

{ TKxBaseThread }

procedure TKxBaseThread.Synchronize(Method: TThreadMethod);
Begin
 // MnLg_ev('KxThread TKxBaseThread.Synchronize(Method: TThreadMethod)',vLogDir+pLogFile);

  inherited Synchronize(Method);
End;//

procedure TKxBaseThread.Synchronize(Method: TMethod);
Begin
 // MnLg_ev('KxThread TKxBaseThread.Synchronize(Method: TMethod)',vLogDir+pLogFile);

  inherited Synchronize(TThreadMethod(Method));
End;//

end.
