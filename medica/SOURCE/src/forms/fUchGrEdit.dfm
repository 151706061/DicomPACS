object frmUchGrEdit: TfrmUchGrEdit
  Left = 321
  Top = 307
  BorderIcons = [biSystemMenu]
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1091#1095#1077#1090#1085#1086#1081' '#1075#1088#1091#1087#1087#1099
  ClientHeight = 113
  ClientWidth = 292
  Color = clBtnFace
  Constraints.MinHeight = 140
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    292
    113)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 15
    Top = 57
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
    Left = 46
    Top = 83
    Width = 22
    Height = 13
    Caption = #1058#1080#1087':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 292
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 38
        Width = 288
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 279
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
      object ToolButton3: TToolButton
        Left = 136
        Top = 0
        Action = acCancel
      end
    end
  end
  object edName: TEdit
    Left = 79
    Top = 54
    Width = 192
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 255
    TabOrder = 1
  end
  object lcbType: TDBLookupComboBox
    Left = 80
    Top = 80
    Width = 192
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    KeyField = 'FK_ID'
    ListField = 'FC_NAME'
    TabOrder = 2
    Visible = False
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmUchGrEdit\'
    StoredValues = <>
    Left = 240
    Top = 64
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 168
    Top = 24
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
  end
end
