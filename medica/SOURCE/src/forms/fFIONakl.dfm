object frmFIONakl: TfrmFIONakl
  Left = 475
  Top = 116
  Width = 461
  Height = 370
  HelpContext = 26
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1042#1074#1086#1076' '#1060#1048#1054
  Color = clBtnFace
  Constraints.MaxWidth = 461
  Constraints.MinWidth = 461
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'StMedsestra.chm'
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 453
    Height = 336
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      453
      336)
    object pol1: TLabel
      Left = 28
      Top = 56
      Width = 45
      Height = 13
      Caption = #1055#1086#1083#1091#1095#1080#1083':'
    end
    object otp: TLabel
      Left = 24
      Top = 96
      Width = 50
      Height = 13
      Caption = #1054#1090#1087#1091#1089#1090#1080#1083':'
    end
    object dolpol: TLabel
      Left = 20
      Top = 128
      Width = 132
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1087#1086#1083#1091#1095#1072#1102#1097#1077#1075#1086':'
    end
    object dolotp: TLabel
      Left = 20
      Top = 168
      Width = 138
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1086#1090#1087#1091#1089#1082#1072#1102#1097#1077#1075#1086':'
    end
    object Label1: TLabel
      Left = 20
      Top = 56
      Width = 97
      Height = 13
      Caption = #1042#1099#1073#1086#1088#1082#1091' '#1089#1086#1089#1090#1072#1074#1080#1083':'
      Visible = False
    end
    object Label2: TLabel
      Left = 12
      Top = 88
      Width = 104
      Height = 13
      Caption = #1042#1099#1073#1086#1088#1082#1091' '#1087#1088#1086#1074#1077#1088#1080#1083'1:'
      Visible = False
    end
    object Label3: TLabel
      Left = 12
      Top = 120
      Width = 104
      Height = 13
      Caption = #1042#1099#1073#1086#1088#1082#1091' '#1087#1088#1086#1074#1077#1088#1080#1083'2:'
      Visible = False
    end
    object Label4: TLabel
      Left = 12
      Top = 152
      Width = 104
      Height = 13
      Caption = #1042#1099#1073#1086#1088#1082#1091' '#1087#1088#1086#1074#1077#1088#1080#1083'3:'
      Visible = False
    end
    object Label5: TLabel
      Left = 4
      Top = 208
      Width = 139
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1089#1086#1089#1090#1072#1074#1080#1074#1096#1077#1075#1086' :'
      Visible = False
    end
    object Label6: TLabel
      Left = 4
      Top = 240
      Width = 146
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1087#1088#1086#1074#1077#1088#1103#1102#1097#1077#1075#1086'1:'
      Visible = False
    end
    object Label7: TLabel
      Left = 4
      Top = 266
      Width = 146
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1087#1088#1086#1074#1077#1088#1103#1102#1097#1077#1075#1086'2:'
      Visible = False
    end
    object Label8: TLabel
      Left = 4
      Top = 295
      Width = 146
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1087#1088#1086#1074#1077#1088#1103#1102#1097#1077#1075#1086'3:'
      Visible = False
    end
    object lpro: TLabel
      Left = 12
      Top = 184
      Width = 104
      Height = 13
      Caption = #1042#1099#1073#1086#1088#1082#1091' '#1087#1088#1086#1074#1077#1088#1080#1083'4:'
    end
    object ldolpro: TLabel
      Left = 4
      Top = 319
      Width = 146
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1087#1088#1086#1074#1077#1088#1103#1102#1097#1077#1075#1086'4:'
    end
    object ePol: TEdit
      Left = 88
      Top = 48
      Width = 336
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      TabOrder = 0
    end
    object eOtp: TEdit
      Left = 88
      Top = 88
      Width = 337
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      TabOrder = 3
    end
    object CoolBar1: TCoolBar
      Left = 2
      Top = 2
      Width = 449
      Height = 29
      AutoSize = True
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 445
        end>
      object ToolBar1: TToolBar
        Left = 9
        Top = 0
        Width = 432
        Height = 25
        ButtonWidth = 84
        Caption = 'ToolBar1'
        Flat = True
        Images = dmMain.ilMain
        List = True
        ShowCaptions = True
        TabOrder = 0
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Action = enter
        end
        object ToolButton2: TToolButton
          Left = 84
          Top = 0
          Action = acCancel
        end
      end
    end
    object esos: TEdit
      Left = 118
      Top = 48
      Width = 306
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      TabOrder = 1
      Visible = False
    end
    object epro1: TEdit
      Left = 120
      Top = 80
      Width = 305
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      TabOrder = 2
      Visible = False
    end
    object epro2: TEdit
      Left = 120
      Top = 113
      Width = 305
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      TabOrder = 4
      Visible = False
    end
    object epro3: TEdit
      Left = 120
      Top = 145
      Width = 305
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      TabOrder = 6
      Visible = False
    end
    object edolsos: TEdit
      Left = 152
      Top = 200
      Width = 273
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      TabOrder = 9
      Visible = False
    end
    object edolpro: TEdit
      Left = 152
      Top = 232
      Width = 273
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      TabOrder = 10
      Visible = False
    end
    object edolpro2: TEdit
      Left = 152
      Top = 261
      Width = 273
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      TabOrder = 11
      Visible = False
    end
    object edolpro3: TEdit
      Left = 152
      Top = 289
      Width = 273
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      TabOrder = 12
      Visible = False
    end
    object ePro: TEdit
      Left = 120
      Top = 179
      Width = 305
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      TabOrder = 8
    end
    object eDolP: TEdit
      Left = 152
      Top = 313
      Width = 273
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      TabOrder = 13
    end
    object eDolotp: TEdit
      Left = 160
      Top = 160
      Width = 265
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      TabOrder = 7
    end
    object eDolpol: TEdit
      Left = 160
      Top = 121
      Width = 265
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      TabOrder = 5
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 413
    Top = 14
    object enter: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      ImageIndex = 9
      ShortCut = 13
      OnExecute = enterExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 8
      OnExecute = acCancelExecute
    end
  end
end
