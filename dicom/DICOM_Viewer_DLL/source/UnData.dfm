object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 290
  Width = 430
  object DicomServerCore1: TDicomServerCore
    ServerPort = 104
    ForceCheckTableBeforeOpen = False
    SynchronousCMove = False
    OnDicomImage = DicomServerCore1DicomImage
    Left = 40
    Top = 24
  end
end
