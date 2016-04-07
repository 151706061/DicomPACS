object DicomServer: TDicomServer
  OldCreateOrder = False
  OnCreate = ServiceCreate
  OnDestroy = ServiceDestroy
  DisplayName = 'DicomServer'
  OnExecute = ServiceExecute
  Height = 490
  Width = 816
  object DicomServer: TDicomServerCore
    ServerPort = 104
    ForceCheckTableBeforeOpen = False
    SynchronousCMove = False
    OnNormalisedReceived = DicomServerNormalisedReceived
    OnNormalisedReceivedNDelete = DicomServerNormalisedReceivedNDelete
    OnNormalisedReceivedNAction = DicomServerNormalisedReceivedNAction
    OnDicomFind = DicomServerDicomFind
    OnDicomGet = DicomServerDicomGet
    OnDicomMove = DicomServerDicomGet
    OnDicomImage = DicomServerDicomImage
    OnDicomAssociation = DicomServerDicomAssociation
    OnDicomLogit = DicomServerDicomLogit
    OnDicomFilmPrint = DicomServerDicomFilmPrint
    OnDatabaseSumitSQL = DicomServerDatabaseSumitSQL
    OnGetCMoveLocalPort = DicomServerGetCMoveLocalPort
    OnClientNewCommand = DicomServerClientNewCommand
    OnClientNewData = DicomServerClientNewData
    Left = 376
    Top = 139
  end
  object TimerAuotLoadDir: TTimer
    Enabled = False
    OnTimer = TimerAuotLoadDirTimer
    Left = 496
    Top = 136
  end
  object tmClrLOG: TTimer
    Enabled = False
    OnTimer = tmClrLOGTimer
    Left = 432
    Top = 280
  end
end
