object frmFIOTreb: TfrmFIOTreb
  Left = 295
  Top = 195
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1042#1074#1086#1076' '#1076#1072#1085#1085#1099#1093' '#1086' '#1089#1086#1089#1090#1072#1074#1080#1090#1077#1083#1077
  ClientHeight = 116
  ClientWidth = 352
  Color = clBtnFace
  Constraints.MaxHeight = 158
  Constraints.MinHeight = 150
  Constraints.MinWidth = 360
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 352
    Height = 116
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      352
      116)
    object lbFam: TLabel
      Left = 19
      Top = 55
      Width = 52
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103':'
    end
    object lbJobTitle: TLabel
      Left = 16
      Top = 87
      Width = 61
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
    end
    object edFam: TEdit
      Left = 86
      Top = 51
      Width = 252
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object CoolBar1: TCoolBar
      Left = 2
      Top = 2
      Width = 348
      Height = 29
      AutoSize = True
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 342
        end>
      object ToolBar1: TToolBar
        Left = 12
        Top = 0
        Width = 328
        Height = 25
        ButtonWidth = 84
        Caption = 'ToolBar1'
        Images = frmGetPeriod.ilImages
        List = True
        ShowCaptions = True
        TabOrder = 0
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Action = acApply
        end
        object ToolButton2: TToolButton
          Left = 84
          Top = 0
          Action = acCancel
        end
      end
    end
    object edJobTitle: TEdit
      Left = 86
      Top = 83
      Width = 252
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
  end
  object alActions: TActionList
    Images = frmGetPeriod.ilImages
    Left = 157
    Top = 6
    object acApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      ImageIndex = 0
      ShortCut = 13
      OnExecute = acApplyExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 1
      ShortCut = 27
      OnExecute = acCancelExecute
    end
  end
end
