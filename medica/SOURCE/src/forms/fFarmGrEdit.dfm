object frmFarmGrEdit: TfrmFarmGrEdit
  Left = 264
  Top = 195
  BorderIcons = [biSystemMenu]
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1092#1072#1088#1084#1072#1082#1086#1083#1086#1075#1080#1095#1077#1089#1082#1086#1081' '#1075#1088#1091#1087#1087#1099
  ClientHeight = 206
  ClientWidth = 344
  Color = clBtnFace
  Constraints.MinHeight = 175
  Constraints.MinWidth = 326
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 344
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 340
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 331
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
  object paNames: TPanel
    Left = 0
    Top = 40
    Width = 344
    Height = 55
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      344
      55)
    object Label1: TLabel
      Left = 8
      Top = 12
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
      Left = 8
      Top = 37
      Width = 78
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1056#1051#1057':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object edName: TEdit
      Left = 90
      Top = 8
      Width = 253
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 255
      TabOrder = 0
      OnChange = edRlsNameChange
      OnExit = edNameExit
    end
    object bbEqual: TBitBtn
      Left = 320
      Top = 34
      Width = 22
      Height = 21
      Action = aEqual
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      Visible = False
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF000000
        0000FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00FF000000
        0000FF00FF00FF00FF00FF00FF0000000000000000000000000000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00FF000000
        0000FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00FF000000
        0000FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00000000000000
        0000000000000000000000000000000000000000000000000000FF00FF000000
        0000FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FF00FF00FF00FF0000000000000000000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF000000
        0000FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF000000
        0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF000000
        0000FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF000000
        0000FF00FF00FF00FF0000000000000000000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      NumGlyphs = 2
    end
    object bbChoseRlsFarmGroup: TBitBtn
      Tag = -1
      Left = 90
      Top = 34
      Width = 227
      Height = 21
      Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1092#1072#1088#1084' '#1075#1088#1091#1087#1087' '#1056#1051#1057
      Anchors = [akLeft, akTop, akRight]
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1092#1072#1088#1084' '#1075#1088#1091#1087#1087' '#1056#1051#1057' >>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = False
      OnClick = bbChoseRlsFarmGroupClick
    end
  end
  object paDescription: TPanel
    Left = 0
    Top = 95
    Width = 344
    Height = 111
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      344
      111)
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 344
      Height = 110
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      DesignSize = (
        344
        110)
      object meRlsDescription: TMemo
        Left = 7
        Top = 17
        Width = 329
        Height = 86
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmFarmGrEdit\'
    StoredValues = <>
    Left = 104
    Top = 24
  end
  object ActionList1: TActionList
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
    object aEqual: TAction
      Hint = #1047#1072#1088#1086#1074#1085#1103#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1103
      ImageIndex = 53
      OnExecute = aEqualExecute
    end
  end
end
