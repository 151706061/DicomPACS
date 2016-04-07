object WADOServer: TWADOServer
  OldCreateOrder = False
  DisplayName = 'WADOServer'
  OnExecute = ServiceExecute
  OnShutdown = ServiceShutdown
  OnStop = ServiceStop
  Height = 373
  Width = 526
  object WADOServerCore1: TWADOServerCore
    ServerPort = 0
    AuthType = atNone
    AuthRealm = 'www.medotrade.ru'
    SupportKeepAlive = True
    OnCommandGET = WADOServerCore1CommandGET
    OnCommandPOST = WADOServerCore1CommandPOST
    OnFindImage = WADOServerCore1FindImage
    Left = 69
    Top = 131
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 288
    Top = 120
  end
end
