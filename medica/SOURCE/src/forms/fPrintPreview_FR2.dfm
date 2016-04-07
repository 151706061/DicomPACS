inherited fmPrintPreview_FR2: TfmPrintPreview_FR2
  Left = 276
  Top = 179
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar1: TCoolBar
    inherited ToolBar1: TToolBar
      inherited tbuRepaint: TToolButton
        OnClick = tbuRepaintClick
      end
      inherited tbuExcel: TToolButton
        OnClick = tbuExcelClick
      end
      inherited tbuPrint: TToolButton
        OnClick = tbuPrintClick
      end
    end
  end
  object frPreview1: TfrPreview
    Left = 0
    Top = 44
    Width = 600
    Height = 338
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ScrollBars = ssBoth
  end
end
