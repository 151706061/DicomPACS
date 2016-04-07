{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit KXSockClient;

interface

uses
  Classes, SysUtils,Winsock, KXString, KXsock, KXSocket, DCM_log;

type
  TIdFTPTransferType = (ftASCII, ftBinary);
  TIdFTPDataStructure = (dsFile, dsRecord, dsPage);
  TIdFTPTransferMode = (dmBlock, dmCompressed, dmStream);

  TKXSockClient = class(TKXSock)
  private
    // Component Oriented Variables:
    fsHost: AnsiString;
    fiPort: Integer;
    fbUseNagle: Boolean;
    fbUseUDP: Boolean;
    fbUseBlocking: Boolean;
    // Asynch Notification Variables:

  protected

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function DoConnect: Boolean;
    function DoListen: Boolean;

    function BeginListen: Boolean;
  published
    property Host: AnsiString read fsHost write fsHost;
    property Port: Integer read fiPort write fiPort;
    property EnabledNagle: Boolean read fbUseNagle write fbUseNagle;
    property EnabledUDP: Boolean read fbUseUDP write fbUseUdp;
    property EnabledBlocking: Boolean read fbUseBlocking write fbUseBlocking;
  end;

implementation

constructor TKXSockClient.Create(AOwner: TComponent);
begin

  MnLg_ev('KXSockClient TKXSockClient.Create',DCM_log.vLogDir+'\'+'dcm_server.log');

  inherited Create(AOwner);
  fsHost := '127.0.0.1';
  fiPort := 0;
  fbUseNagle := True;
  fbUseUDP := False;
  fbUseBlocking := True;
end;

destructor TKXSockClient.Destroy;
begin

  inherited Destroy;
end;

function TKXSockClient.DoConnect: Boolean;
var NewConnect: PNewConnect;
begin

  MnLg_ev('KXSockClient TKXSockClient.DoConnect',DCM_log.vLogDir+'\'+'dcm_server.log');

  New(NewConnect);
  NewConnect^.Port := fiPort;
  NewConnect^.UseNAGLE := fbUseNagle;
  NewConnect^.UseUDP := fbUseUDP;
  NewConnect^.UseBlocking := fbUseBlocking;
  NewConnect^.ipAddress := fsHost;
  Result := Connect(NewConnect);
  Dispose(NewConnect);
end;

function TKXSockClient.BeginListen: Boolean;
var
  NewListen: PNewListen;
begin

  MnLg_ev('KXSockClient TKXSockClient.BeginListen',DCM_log.vLogDir+'\'+'dcm_server.log');

  New(NewListen);
  NewListen^.Port := fiPort;
  NewListen^.UseNAGLE := fbUseNagle;
  NewListen^.UseBlocking := fbUseBlocking;
  NewListen^.UseUDP := fbUseUDP;
  NewListen^.WinsockQueue := 100; //fListenerQueueSize;
  NewListen^.ConnectionLess := fbUseUDP;
  Result := Listen(NewListen);
  Dispose(NewListen);
end;

function TKXSockClient.DoListen: Boolean;
var
  NewSock: TKXSock;
  n: TSocket;
begin
  if Sock = Winsock.INVALID_SOCKET then
    Exit; // linux does not set FErrStatus!

  MnLg_ev('KXSockClient TKXSockClient.DoListen',DCM_log.vLogDir+'\'+'dcm_server.log');

  NewSock := nil;
  Accept(NewSock);
  n := Sock;
  Sock := NewSock.Sock;
  CloseConnection(n, true);
end;


end.

