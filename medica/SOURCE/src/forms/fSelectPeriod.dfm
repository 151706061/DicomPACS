object frmSelectPeriod: TfrmSelectPeriod
  Left = 359
  Top = 283
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsToolWindow
  Caption = #1042#1099#1073#1086#1088' '#1087#1077#1088#1080#1086#1076#1072
  ClientHeight = 185
  ClientWidth = 212
  Color = clBtnFace
  Constraints.MaxHeight = 212
  Constraints.MaxWidth = 220
  Constraints.MinHeight = 212
  Constraints.MinWidth = 220
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777777777777777777777777777777FF77
    7777777777777777777777777777000000000000000000000000000000770000
    0000000000000000000000000077000F0FFFFFFFFF00FFFFFFFFF0F0007700F0
    FFFFFFFFFF00FFFFFFFFFF0F007700F0FFFFFFFFFF00FFFFFFFFFF0F007700F0
    F0000000F0000F0000000F0F007700F0FFFFFFFFF0FF0FFFFFFFFF0F007700F0
    F0000000FF00FF0000000F0F007700F0FFFFFFFFFF00FFFFFFFFFF0F007700F0
    FFFFFFFFFF00FFFFFFFFFF0F007700F0FFF1111FFF00FFF11111FF0F007700F0
    FFF1111FFF00FFF11111FF0F007700F0FFFF11FFFF00FFF11FFFFF0F007700F0
    FFFF11FFFF00FFF111FFFF0F007700F0FFFF11FFFF00FFFF111FFF0F007700F0
    FFFF11FFFF00FFFFF111FF0F007700F0FFF111FFF0000FF11F11FF0F007700F0
    FFF111FFF0FF0FF11111FF0F007700F0FFFF11FFFF00FFFF111FFF0F007700F0
    FFFFFFFFFF00FFFFFFFFFF0F0077000F0FFFFFFFFF00FFFFFFFFF0F000770000
    00000000000000000000000000FF000000000000000000000000000000FFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 212
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 38
        Width = 208
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 195
      Height = 38
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 51
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
        Left = 51
        Top = 0
        Action = acCancel
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 42
    Width = 212
    Height = 143
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 6
      Top = 140
      Width = 151
      Height = 13
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1100#1085#1086' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081':'
      Visible = False
    end
    object rgMinSpare: TRadioGroup
      Left = 0
      Top = 0
      Width = 212
      Height = 73
      Align = alTop
      Columns = 2
      Items.Strings = (
        '1 '#1084#1077#1089
        '3 '#1084#1077#1089
        '6 '#1084#1077#1089
        '9 '#1084#1077#1089
        '12 '#1084#1077#1089)
      TabOrder = 0
      OnClick = rgMinSpareClick
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 73
      Width = 212
      Height = 70
      Align = alClient
      Caption = #1042#1099#1073#1088#1072#1085#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
      TabOrder = 1
      object Label3: TLabel
        Left = 7
        Top = 47
        Width = 15
        Height = 13
        Hint = #1042#1074#1086#1076' '#1082#1086#1085#1077#1095#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1087#1086':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label4: TLabel
        Left = 7
        Top = 19
        Width = 15
        Height = 13
        Hint = #1042#1074#1086#1076' '#1082#1086#1085#1077#1095#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1089':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object cmbMonth1: TcxComboBox
        Left = 24
        Top = 16
        Hint = #1085#1072#1095#1072#1083#1100#1085#1099#1081' '#1084#1077#1089#1103#1094' '#1087#1077#1088#1080#1086#1076#1072
        Properties.DropDownListStyle = lsFixedList
        Properties.ReadOnly = False
        Properties.OnChange = cmbMonth1PropertiesChange
        TabOrder = 0
        Width = 96
      end
      object sedYear1: TcxSpinEdit
        Left = 131
        Top = 16
        Hint = #1085#1072#1095#1072#1083#1100#1085#1099#1081' '#1075#1086#1076' '#1087#1077#1088#1080#1086#1076#1072
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.MaxValue = 2999.000000000000000000
        Properties.MinValue = 2000.000000000000000000
        Properties.SpinButtons.Position = sbpHorzLeftRight
        Properties.ValueType = vtInt
        Properties.OnChange = cmbMonth1PropertiesChange
        Style.BorderStyle = ebsUltraFlat
        Style.ButtonStyle = btsDefault
        Style.ButtonTransparency = ebtNone
        TabOrder = 1
        Value = 2000
        Width = 59
      end
      object cmbMonth2: TcxComboBox
        Left = 24
        Top = 43
        Hint = #1085#1072#1095#1072#1083#1100#1085#1099#1081' '#1084#1077#1089#1103#1094' '#1087#1077#1088#1080#1086#1076#1072
        Properties.DropDownListStyle = lsFixedList
        Properties.ReadOnly = False
        Properties.OnChange = cmbMonth1PropertiesChange
        TabOrder = 2
        Width = 96
      end
      object sedYear2: TcxSpinEdit
        Left = 131
        Top = 43
        Hint = #1085#1072#1095#1072#1083#1100#1085#1099#1081' '#1075#1086#1076' '#1087#1077#1088#1080#1086#1076#1072
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.MaxValue = 2999.000000000000000000
        Properties.MinValue = 2000.000000000000000000
        Properties.SpinButtons.Position = sbpHorzLeftRight
        Properties.ValueType = vtInt
        Properties.OnChange = cmbMonth1PropertiesChange
        Style.BorderStyle = ebsUltraFlat
        Style.ButtonStyle = btsDefault
        Style.ButtonTransparency = ebtNone
        TabOrder = 3
        Value = 2000
        Width = 59
      end
    end
  end
  object alActions: TActionList
    Images = dmMain.ilMain
    Left = 112
    Top = 8
    object acApply: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 9
      ShortCut = 13
      OnExecute = acApplyExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acCancelExecute
    end
  end
end
