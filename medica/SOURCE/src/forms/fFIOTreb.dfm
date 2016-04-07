object frmFIOTreb: TfrmFIOTreb
  Left = 295
  Top = 195
  Width = 509
  Height = 158
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1042#1074#1086#1076' '#1076#1072#1085#1085#1099#1093' '#1086#1073' '#1086#1090#1087#1091#1089#1090#1080#1074#1096#1077#1084
  Color = clBtnFace
  Constraints.MaxHeight = 158
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 501
    Height = 124
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 56
      Width = 62
      Height = 13
      Caption = #1054#1090#1087#1091#1089#1090#1080#1083'('#1072'):'
    end
    object Label2: TLabel
      Left = 16
      Top = 88
      Width = 134
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1086#1090#1087#1091#1089#1090#1080#1074#1096#1077#1075#1086':'
    end
    object eotp: TEdit
      Left = 86
      Top = 50
      Width = 353
      Height = 21
      TabOrder = 0
    end
    object CoolBar1: TCoolBar
      Left = 2
      Top = 2
      Width = 497
      Height = 29
      AutoSize = True
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 493
        end>
      object ToolBar1: TToolBar
        Left = 9
        Top = 0
        Width = 480
        Height = 25
        ButtonWidth = 80
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
          Left = 80
          Top = 0
          Action = acCancel
        end
      end
    end
    object edolotp: TEdit
      Left = 152
      Top = 82
      Width = 287
      Height = 21
      TabOrder = 2
    end
  end
  object ActionList1: TActionList
    Images = dmMain.ilMain
    Left = 221
    Top = 14
    object enter: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 9
      ShortCut = 13
      OnExecute = enterExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acCancelExecute
    end
  end
end
