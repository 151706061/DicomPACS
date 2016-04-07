object DicomWLServer: TDicomWLServer
  OldCreateOrder = False
  OnCreate = ServiceCreate
  OnDestroy = ServiceDestroy
  DisplayName = 'DicomWLServer'
  OnExecute = ServiceExecute
  OnShutdown = ServiceShutdown
  Height = 452
  Width = 718
  object DicomServerCore1: TDicomServerCore
    ServerPort = 4006
    ForceCheckTableBeforeOpen = False
    SynchronousCMove = False
    OnNormalisedReceived = DicomServerCore1NormalisedReceived
    OnNormalisedReceivedNCreate = DicomServerCore1NormalisedReceivedNCreate
    OnNormalisedReceivedNSet = DicomServerCore1NormalisedReceivedNSet
    OnNormalisedReceivedNDelete = DicomServerCore1NormalisedReceivedNDelete
    OnDicomFind = DicomServerCore1DicomFind
    OnDicomGet = DicomServerCore1DicomGet
    OnDicomAssociation = DicomServerCore1DicomAssociation
    OnDicomLogit = DicomServerCore1DicomLogit
    OnClientNewCommand = DicomServerCore1ClientNewCommand
    OnClientNewData = DicomServerCore1ClientNewData
    Left = 297
    Top = 152
  end
  object TimerAuotLoadWl: TTimer
    Enabled = False
    OnTimer = TimerAuotLoadWlTimer
    Left = 496
    Top = 136
  end
end
