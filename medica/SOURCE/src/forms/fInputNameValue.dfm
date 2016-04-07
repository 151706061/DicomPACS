object fmInputNameValue: TfmInputNameValue
  Left = 315
  Top = 338
  Width = 391
  Height = 318
  BorderStyle = bsSizeToolWin
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 383
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 38
        Width = 379
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 366
      Height = 38
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 64
      Caption = 'ToolBar1'
      Flat = True
      Images = dmMain.ilMain
      ShowCaptions = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = acApply
      end
      object ToolButton2: TToolButton
        Left = 64
        Top = 0
        Action = acCancel
      end
    end
  end
  object ValueListEditor1: TValueListEditor
    Left = 0
    Top = 42
    Width = 383
    Height = 242
    Align = alClient
    Strings.Strings = (
      #1074#1099#1072#1099#1074#1072'='#1074#1099#1072#1099#1074#1072
      '1='#1074#1072#1099#1074#1072#1099#1074#1082#1082#1082#1082#1082)
    TabOrder = 1
    ColWidths = (
      150
      227)
  end
  object alOtmena: TActionList
    Images = dmMain.ilMain
    Left = 286
    Top = 130
    object acApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      ImageIndex = 9
      ShortCut = 113
      OnExecute = acApplyExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 14
      ShortCut = 27
      OnExecute = acCancelExecute
    end
  end
end
