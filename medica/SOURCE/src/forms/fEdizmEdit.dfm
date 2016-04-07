object frmEdIzmEdit: TfrmEdIzmEdit
  Left = 360
  Top = 274
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1092#1086#1088#1084#1099' '#1074#1099#1087#1091#1089#1082#1072
  ClientHeight = 133
  ClientWidth = 318
  Color = clBtnFace
  Constraints.MinHeight = 130
  Constraints.MinWidth = 324
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    318
    133)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 76
    Width = 53
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 19
    Top = 107
    Width = 70
    Height = 13
    Caption = #1050#1086#1076' '#1087#1086' '#1054#1050#1045#1048':'
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 318
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 312
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 305
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 60
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton2: TToolButton
        Left = 0
        Top = 0
        Action = acSave
      end
      object ToolButton5: TToolButton
        Left = 60
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 68
        Top = 0
        Action = acAdd
      end
      object ToolButton4: TToolButton
        Left = 128
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object ToolButton6: TToolButton
        Left = 136
        Top = 0
        Action = acRlsHelp
      end
      object ToolButton7: TToolButton
        Left = 196
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 204
        Top = 0
        Action = acCancel
      end
    end
  end
  object edName: TEdit
    Tag = -1
    Left = 113
    Top = 72
    Width = 192
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Constraints.MinWidth = 192
    MaxLength = 255
    TabOrder = 1
  end
  object edOKEI: TEdit
    Left = 112
    Top = 104
    Width = 193
    Height = 21
    MaxLength = 2000
    TabOrder = 2
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmEdIzmEdit\'
    StoredValues = <>
    Left = 248
    Top = 72
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 160
    Top = 32
    object acSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1080' '#1079#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      ImageIndex = 9
      ShortCut = 113
      OnExecute = acSaveExecute
    end
    object acAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1080' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1077#1097#1077' '#1086#1076#1085#1091' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 21
      ShortCut = 16397
      OnExecute = acAddExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' '#1073#1077#1079' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acCancelExecute
    end
    object acRlsHelp: TAction
      Caption = #1056#1083#1089
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1080#1079' c'#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1056#1083#1089
      ImageIndex = 56
      OnExecute = acRlsHelpExecute
    end
  end
end
