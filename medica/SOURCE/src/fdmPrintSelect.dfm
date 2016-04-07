object dmPrintSelect: TdmPrintSelect
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 203
  Width = 464
  object pmPrintSelect: TPopupMenu
    Left = 44
    Top = 8
    object miPrintToExcel: TMenuItem
      Tag = 1
      Caption = #1074' '#1086#1090#1095#1077#1090' MS Excel'
      OnClick = miPrintToExcelClick
    end
    object miPrintToFastReport: TMenuItem
      Tag = 2
      Caption = #1074' '#1086#1090#1095#1077#1090' Fast Report'
      OnClick = miPrintToExcelClick
    end
  end
  object frxXLSExport1: TfrxXLSExport
    ShowDialog = False
    FileName = 'rep.xls'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    OpenExcelAfterExport = True
    AsText = False
    Background = True
    FastExport = False
    PageBreaks = False
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 42
    Top = 60
  end
  object frOLEExcelExport1: TfrOLEExcelExport
    Default = True
    ShowDialog = False
    HighQuality = False
    CellsAlign = False
    CellsBorders = False
    CellsFillColor = False
    CellsFontColor = False
    CellsFontName = False
    CellsFontSize = False
    CellsFontStyle = False
    CellsMerged = False
    CellsWrapWords = False
    ExportPictures = False
    OpenExcelAfterExport = True
    PageBreaks = False
    AsText = False
    Left = 42
    Top = 114
  end
  object frxXMLExport1: TfrxXMLExport
    ShowDialog = False
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportPageBreaks = False
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    RowsCount = 0
    Split = ssNotSplit
    Left = 140
    Top = 64
  end
  object frXMLExcelExport1: TfrXMLExcelExport
    ShowDialog = False
    Numbers = False
    WrapWords = False
    PageBreaks = False
    Left = 141
    Top = 118
  end
  object frxODSExport1: TfrxODSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 232
    Top = 64
  end
  object frxODTExport1: TfrxODTExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 312
    Top = 64
  end
  object pmOrientationSelect: TPopupMenu
    Left = 160
    Top = 8
    object N1: TMenuItem
      Caption = #1050#1085#1080#1078#1085#1072#1103' '#1086#1088#1080#1077#1085#1090#1072#1094#1080#1103
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1040#1083#1100#1073#1086#1084#1085#1072#1103' '#1086#1088#1080#1077#1085#1090#1072#1094#1080#1103
      OnClick = N2Click
    end
  end
end
