object CallsListener: TCallsListener
  OldCreateOrder = False
  OnCreate = ServiceCreate
  OnDestroy = ServiceDestroy
  DisplayName = 'CallsListener'
  OnExecute = ServiceExecute
  OnShutdown = ServiceShutdown
  OnStart = ServiceStart
  OnStop = ServiceStop
  Left = 508
  Top = 200
  Height = 347
  Width = 516
  object os: TOracleSession
    LogonUsername = 'SYSTEM'
    LogonPassword = 'SYS123'
    LogonDatabase = 'XE'
    Left = 160
    Top = 64
  end
  object TcpServer1: TTcpServer
    LocalHost = '192.168.0.10'
    LocalPort = '8082'
    OnAccept = TcpServer1Accept
    Left = 160
    Top = 112
  end
end
