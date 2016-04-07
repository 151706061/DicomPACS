{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit KXSessionTracker;

interface

uses
  KXString,
  Classes;

{$I KXSock.def}

{.$DEFINE BYPASS}

type
  TKXSessionTracker = class(TKXComponent)
  private
    fSessionArray: TThreadList;
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RegisterSession(ClientThread: TThread);
    procedure UnregisterSession(ClientThread: TThread);
    procedure CloseAllSessions;
    procedure ClearAllSessions;
    property SessionArray: TThreadList read fSessionArray;
  published
  end;

implementation

uses
  KXServerCore;

constructor TKXSessionTracker.Create(AOwner: TComponent);
begin
  inherited;
  fSessionArray := TThreadList.Create;
end;

destructor TKXSessionTracker.Destroy;
begin
  CloseAllSessions;
  ClearAllSessions;
  fSessionArray.Free;
  inherited Destroy;
end;

procedure TKXSessionTracker.RegisterSession(ClientThread: TThread);
begin
{$IFNDEF BYPASS}
  fSessionArray.Add(TKXClientThread(ClientThread));
{$ENDIF}  
end;

procedure TKXSessionTracker.UnregisterSession(ClientThread: TThread);
var
  Loop: Integer;
  LookingFor: Cardinal;
  l1: TList;
begin
{$IFNDEF BYPASS}
  LookingFor := TKXClientThread(ClientThread).ThreadID;
  Loop := 0;
  l1 := fSessionArray.LockList;
  try
    while Loop < l1.Count do
    begin
      if TKXClientThread(l1[Loop]).ThreadID = LookingFor then
      begin
        l1.Delete(Loop);
        Exit;
      end
      else
        Inc(Loop);
    end;
  finally
    fSessionArray.UnlockList;
  end;
{$ENDIF}  
end;

procedure TKXSessionTracker.CloseAllSessions;
var
  Loop: Integer;
  l1: TList;
begin
{$IFNDEF BYPASS}

  Loop := 0;
  l1 := fSessionArray.LockList;
  try
    while Loop < l1.Count do
    begin
      if Assigned(TKXClientThread(l1[Loop]).Socket) then
        TKXClientThread(l1[Loop]).Socket.CloseGracefully;
      Inc(Loop);
    end;
  finally
    fSessionArray.UnlockList;
  end;
{$ENDIF}
end;

procedure TKXSessionTracker.ClearAllSessions;
var
  l1: TList;
begin
{$IFNDEF BYPASS}
  l1 := fSessionArray.LockList;
  try
    while l1.Count > 0 do
    begin
      l1.Delete(0);
    end;
  finally
    fSessionArray.unLockList;
  end;
{$ENDIF}  
end;

end.

