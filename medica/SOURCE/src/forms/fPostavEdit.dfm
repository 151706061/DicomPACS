object frmPostavEdit: TfrmPostavEdit
  Left = 394
  Top = 278
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
  ClientHeight = 432
  ClientWidth = 434
  Color = clBtnFace
  Constraints.MinHeight = 196
  Constraints.MinWidth = 326
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    434
    432)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 39
    Top = 51
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 18
    Top = 75
    Width = 74
    Height = 13
    Alignment = taRightJustify
    Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 100
    Width = 84
    Height = 13
    Alignment = taRightJustify
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1088#1091#1082'.:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 33
    Top = 124
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label19: TLabel
    Left = 7
    Top = 406
    Width = 198
    Height = 13
    Alignment = taRightJustify
    Caption = 'VendorID '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091' "'#1052#1086#1085#1080#1090#1086#1088#1080#1085#1075' '#1094#1077#1085'"'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 434
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 430
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 421
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
    Left = 97
    Top = 48
    Width = 318
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 50
    TabOrder = 1
  end
  object edBossFIO: TEdit
    Left = 97
    Top = 72
    Width = 318
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 50
    TabOrder = 2
  end
  object edBossDolg: TEdit
    Left = 97
    Top = 96
    Width = 318
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 50
    TabOrder = 3
  end
  object meRekviziti: TMemo
    Left = 97
    Top = 120
    Width = 318
    Height = 65
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
  end
  object cxGroupBox1: TcxGroupBox
    Left = 4
    Top = 190
    Caption = ' '#1050#1086#1085#1090#1088#1072#1082#1090' '
    TabOrder = 5
    DesignSize = (
      425
      55)
    Height = 55
    Width = 425
    object Label6: TLabel
      Left = 213
      Top = 22
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = #1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 76
      Top = 22
      Width = 11
      Height = 13
      Alignment = taRightJustify
      Caption = #8470
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 321
      Top = 22
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = #1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object deFD_KONTRAKT_BEGIN: TcxDateEdit
      Left = 221
      Top = 18
      Properties.ImmediatePost = True
      Properties.InputKind = ikMask
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.BorderStyle = ebs3D
      StyleHot.BorderStyle = ebs3D
      TabOrder = 0
      Width = 75
    end
    object edFC_KONTRAKT_N: TEdit
      Left = 92
      Top = 18
      Width = 88
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 1
    end
    object deFD_KONTRAKT_END: TcxDateEdit
      Left = 335
      Top = 18
      Properties.ImmediatePost = True
      Properties.InputKind = ikMask
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.BorderStyle = ebs3D
      StyleHot.BorderStyle = ebs3D
      TabOrder = 2
      Width = 75
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 4
    Top = 246
    Caption = ' '#1056#1077#1082#1074#1080#1079#1080#1090#1099' '
    TabOrder = 6
    DesignSize = (
      425
      153)
    Height = 153
    Width = 425
    object Label9: TLabel
      Left = 56
      Top = 22
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = #1040#1076#1088#1077#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 304
      Top = 22
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = #1058#1077#1083'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 68
      Top = 47
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = #1056'/'#1057
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 252
      Top = 47
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = #1050'/'#1057
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 66
      Top = 73
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = #1041#1048#1050
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 175
      Top = 73
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1050#1055#1054
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 295
      Top = 73
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1050#1054#1053#1061
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 179
      Top = 99
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = #1041#1072#1085#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 21
      Top = 125
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = #1051#1080#1094#1077#1085#1079#1080#1103' '#8470
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 250
      Top = 125
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = #1057#1088#1086#1082' '#1076#1077#1081#1089#1090#1074#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 64
      Top = 98
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = #1048#1053#1053
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edFC_ADDRESS: TEdit
      Left = 92
      Top = 18
      Width = 187
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 0
    end
    object edFC_PHONE: TEdit
      Left = 329
      Top = 18
      Width = 81
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 1
    end
    object edFC_R_S: TEdit
      Left = 92
      Top = 43
      Width = 135
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 2
    end
    object edFC_K_S: TEdit
      Left = 276
      Top = 43
      Width = 135
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 3
    end
    object edFC_BIK: TEdit
      Left = 92
      Top = 69
      Width = 75
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 4
    end
    object edFC_OKPO: TEdit
      Left = 210
      Top = 69
      Width = 75
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 5
    end
    object edFC_OKONH: TEdit
      Left = 336
      Top = 69
      Width = 75
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 6
    end
    object edFC_BANK: TEdit
      Left = 210
      Top = 95
      Width = 201
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 8
    end
    object edFC_LICENSE_N: TEdit
      Left = 92
      Top = 121
      Width = 135
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 9
    end
    object deFD_LICENSE: TcxDateEdit
      Left = 329
      Top = 121
      Properties.ImmediatePost = True
      Properties.InputKind = ikMask
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.BorderStyle = ebs3D
      StyleHot.BorderStyle = ebs3D
      TabOrder = 10
      Width = 82
    end
    object edFC_INN: TEdit
      Left = 92
      Top = 94
      Width = 75
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 7
    end
  end
  object edVendorID: TEdit
    Left = 211
    Top = 403
    Width = 204
    Height = 21
    TabOrder = 7
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmPostavEdit\'
    StoredValues = <>
    Left = 280
    Top = 104
  end
  object al: TActionList
    Left = 280
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
