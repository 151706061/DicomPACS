object fmPrintPreview_Base: TfmPrintPreview_Base
  Left = 393
  Top = 253
  Width = 608
  Height = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 600
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 40
        Width = 596
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 583
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 62
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object tbuRepaint: TToolButton
        Left = 0
        Top = 0
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        ImageIndex = 15
      end
      object tbuExcel: TToolButton
        Left = 62
        Top = 0
        Caption = 'Excel'
        ImageIndex = 44
      end
      object ToolButton7: TToolButton
        Left = 124
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbuPrint: TToolButton
        Left = 132
        Top = 0
        Caption = #1055#1077#1095#1072#1090#1100
        ImageIndex = 32
      end
      object tbuPrintSettings: TToolButton
        Left = 194
        Top = 0
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        ImageIndex = 59
        Visible = False
      end
      object ToolButton2: TToolButton
        Left = 256
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object tbuClose: TToolButton
        Left = 264
        Top = 0
        Caption = #1047#1072#1082#1088#1099#1090#1100
        ImageIndex = 1
        OnClick = tbuCloseClick
      end
    end
  end
end
