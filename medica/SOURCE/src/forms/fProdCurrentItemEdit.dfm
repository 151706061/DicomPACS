object frmProdCurrentItemEdit: TfrmProdCurrentItemEdit
  Left = 371
  Top = 268
  Width = 458
  Height = 152
  Caption = #1042#1099#1073#1086#1088' '#1080#1085#1075#1088#1080#1076#1080#1077#1085#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 24
    Top = 48
    Width = 117
    Height = 13
    Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1080#1085#1075#1088#1080#1076#1080#1077#1085#1090#1072':'
  end
  object laEdIzm: TLabel
    Left = 280
    Top = 75
    Width = 36
    Height = 13
    Caption = #1045#1076'.'#1080#1079#1084
  end
  object Label6: TLabel
    Left = 40
    Top = 75
    Width = 99
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1085#1072' 1 '#1087#1086#1088#1094#1080#1102
  end
  object Label1: TLabel
    Left = 39
    Top = 100
    Width = 99
    Height = 13
    Alignment = taRightJustify
    Caption = #1050#1086#1083'-'#1074#1086' '#1085#1072' N '#1087#1086#1088#1094#1080#1081
  end
  object laEdIzm2: TLabel
    Left = 280
    Top = 100
    Width = 36
    Height = 13
    Caption = #1045#1076'.'#1080#1079#1084
  end
  object edMedic: TcxButtonEdit
    Left = 147
    Top = 45
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    TabOrder = 0
    OnClick = edMedicClick
    Width = 254
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 450
    Height = 44
    AutoSize = True
    BorderWidth = 1
    ButtonHeight = 36
    ButtonWidth = 60
    Caption = 'ToolBar1'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    Images = dmMain.ilMain
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 1
    object ToolButton2: TToolButton
      Left = 0
      Top = 0
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 9
      OnClick = ToolButton2Click
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
      Hint = #1054#1090#1084#1077#1085#1072
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 8
      OnClick = ToolButton1Click
    end
  end
  object deAmount_FOR1: TdxSpinEdit
    Left = 147
    Top = 72
    Width = 129
    Style.BorderStyle = xbsFlat
    Style.ButtonStyle = btsFlat
    Style.ButtonTransparence = ebtNone
    Style.HotTrack = False
    Style.Shadow = False
    TabOrder = 2
    Alignment = taLeftJustify
    OnChange = deAmount_FOR1Change
    MaxValue = 999999.000000000000000000
    Value = 1.000000000000000000
    ValueType = vtFloat
    StoredValues = 57
  end
  object deAmount: TdxSpinEdit
    Left = 147
    Top = 96
    Width = 129
    Style.BorderStyle = xbsFlat
    Style.ButtonStyle = btsFlat
    Style.ButtonTransparence = ebtNone
    Style.HotTrack = False
    Style.Shadow = False
    TabOrder = 3
    Alignment = taLeftJustify
    MaxValue = 999999.000000000000000000
    Value = 1.000000000000000000
    ValueType = vtFloat
    StoredValues = 57
  end
  object oqMedic: TOracleQuery
    SQL.Strings = (
      'SELECT'
      '  m.fc_name as FC_MED_NAME,'
      '  ei.fc_name as FC_EI_NAME'
      'FROM MED.TKART k, MED.TMEDIC m, MED.TEI ei'
      'WHERE'
      '  k.kartid = :PartyID AND'
      '  m.medicid = k.medicid AND'
      '  ei.eiid = m.eiid(+)')
    Session = dmMain.os
    Variables.Data = {
      0300000001000000080000003A50415254594944030000000000000000000000}
    Left = 356
    Top = 74
  end
end
