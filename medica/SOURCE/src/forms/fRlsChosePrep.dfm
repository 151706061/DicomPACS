object frmRlsChosePrep: TfrmRlsChosePrep
  Left = 572
  Top = 391
  Width = 708
  Height = 486
  Caption = #1042#1099#1073#1086#1088' '#1087#1088#1077#1087#1072#1088#1072#1090#1072' '#1056#1051#1057
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 450
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 700
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 38
        Width = 696
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 683
      Height = 38
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 53
      Caption = 'ToolBar1'
      Flat = True
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = aOk
      end
      object ToolButton3: TToolButton
        Left = 53
        Top = 0
        Action = aCancel
      end
      object ToolButton2: TToolButton
        Left = 106
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 114
        Top = 0
        Action = aApplyFilter
      end
      object ToolButton5: TToolButton
        Left = 167
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object btnView: TToolButton
        Left = 175
        Top = 0
        Action = actView
      end
    end
  end
  inline frameRlsChosePrep: TframeRlsChosePrep_B
    Left = 0
    Top = 42
    Width = 700
    Height = 417
    Align = alClient
    TabOrder = 1
  end
  object alRls: TActionList
    Images = dmMain.ilMain
    Left = 424
    Top = 64
    object aOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1086#1088' '#1092#1072#1088#1084#1075#1088#1091#1087#1087#1099
      ImageIndex = 9
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 8
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aApplyFilter: TAction
      Caption = #1055#1086#1080#1089#1082
      Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 15
      ShortCut = 13
      OnExecute = aApplyFilterExecute
    end
    object actView: TAction
      Tag = 1
      Caption = #1048#1079#1084'. '#1074#1080#1076
      ImageIndex = 39
      OnExecute = actViewExecute
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmRlsChosePrep\'
    StoredValues = <>
    Left = 653
    Top = 402
  end
end
