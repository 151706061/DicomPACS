object fmTableParam: TfmTableParam
  Left = 399
  Top = 214
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1090#1072#1073#1083#1080#1094#1099
  ClientHeight = 407
  ClientWidth = 581
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 363
    Width = 581
    Height = 3
    Align = alBottom
    Shape = bsBottomLine
  end
  object Panel1: TPanel
    Left = 0
    Top = 366
    Width = 581
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      581
      41)
    object cxButton1: TcxButton
      Left = 502
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object cxButton2: TcxButton
      Left = 422
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1050
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 581
    Height = 262
    ActivePage = tsTable
    Align = alClient
    TabOrder = 1
    ClientRectBottom = 258
    ClientRectLeft = 4
    ClientRectRight = 577
    ClientRectTop = 24
    object tsTable: TcxTabSheet
      Caption = #1058#1072#1073#1083#1080#1094#1072
      ImageIndex = 0
      ExplicitLeft = 2
      ExplicitTop = 22
      ExplicitWidth = 575
      ExplicitHeight = 236
      object cxLabel2: TcxLabel
        Left = 10
        Top = 38
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1086#1083#1086#1085#1086#1082':'
      end
      object cxLabel1: TcxLabel
        Left = 23
        Top = 10
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1086#1082':'
      end
      object seRow: TcxSpinEdit
        Left = 132
        Top = 8
        Properties.MinValue = 1.000000000000000000
        TabOrder = 2
        Value = 1
        Width = 63
      end
      object seCol: TcxSpinEdit
        Left = 132
        Top = 36
        Properties.MinValue = 1.000000000000000000
        TabOrder = 3
        Value = 2
        Width = 63
      end
      object ccCellColor: TcxColorComboBox
        Left = 132
        Top = 64
        Properties.AllowSelectColor = True
        Properties.CustomColors = <>
        Properties.DropDownSizeable = True
        Properties.NamingConvention = cxncHTML4
        Properties.PrepareList = cxplHTML4
        Properties.OnChange = ccCellColorPropertiesChange
        TabOrder = 4
        Width = 169
      end
      object cxLabel7: TcxLabel
        Left = 57
        Top = 66
        Caption = #1062#1074#1077#1090' '#1103#1095#1077#1077#1082':'
      end
      object cxLabel15: TcxLabel
        Left = 220
        Top = 10
        Caption = #1064#1080#1088#1080#1085#1072':'
      end
      object seTableWidth: TcxSpinEdit
        Left = 272
        Top = 8
        Properties.OnChange = seTableWidthPropertiesChange
        TabOrder = 7
        Width = 77
      end
      object cbTableWidth: TcxComboBox
        Left = 358
        Top = 8
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #1055#1080#1082#1089#1077#1083#1099
          #1055#1088#1086#1094#1077#1085#1090#1099)
        Properties.OnChange = cbTableWidthPropertiesChange
        TabOrder = 8
        Text = #1055#1080#1082#1089#1077#1083#1099
        Width = 95
      end
      object cxLabel16: TcxLabel
        Left = 220
        Top = 38
        Caption = #1042#1099#1089#1086#1090#1072':'
      end
      object seTableHeigth: TcxSpinEdit
        Left = 272
        Top = 36
        TabOrder = 10
        Width = 77
      end
      object cbTableHeight: TcxComboBox
        Left = 358
        Top = 36
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #1055#1080#1082#1089#1077#1083#1099
          #1055#1088#1086#1094#1077#1085#1090#1099)
        TabOrder = 11
        Text = #1055#1080#1082#1089#1077#1083#1099
        Width = 95
      end
      object cxLabel14: TcxLabel
        Left = 79
        Top = 94
        Caption = #1054#1090#1089#1090#1091#1087':'
      end
      object seCellPadding: TcxSpinEdit
        Left = 132
        Top = 92
        Properties.AssignedValues.MinValue = True
        Properties.OnChange = seCellPaddingPropertiesChange
        TabOrder = 13
        Value = 1
        Width = 40
      end
    end
    object tsBorder: TcxTabSheet
      Caption = #1043#1088#1072#1085#1080#1094#1072
      ImageIndex = 1
      ExplicitLeft = 2
      ExplicitTop = 22
      ExplicitWidth = 575
      ExplicitHeight = 236
      object cxLabel3: TcxLabel
        Left = 24
        Top = 14
        Caption = #1058#1080#1087':'
      end
      object cbBorderStyle: TcxComboBox
        Left = 54
        Top = 12
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #1056#1077#1083#1100#1077#1092#1085#1072#1103
          'Lowered'
          #1062#1074#1077#1090#1085#1072#1103
          #1062#1074#1077#1090#1085#1072#1103' '#1088#1077#1083#1100#1077#1092#1085#1072#1103
          #1062#1074#1077#1090#1085#1072#1103' lowered')
        Properties.OnChange = cbBorderStylePropertiesChange
        TabOrder = 1
        Text = #1062#1074#1077#1090#1085#1072#1103
        Width = 121
      end
      object ccBorderColor: TcxColorComboBox
        Left = 54
        Top = 64
        ColorValue = clWindowText
        Properties.AllowSelectColor = True
        Properties.CustomColors = <>
        Properties.DropDownSizeable = True
        Properties.NamingConvention = cxncHTML4
        Properties.PrepareList = cxplHTML4
        Properties.OnChange = ccBorderColorPropertiesChange
        TabOrder = 2
        Width = 169
      end
      object cxLabel5: TcxLabel
        Left = 18
        Top = 66
        Caption = #1062#1074#1077#1090':'
      end
      object cxLabel8: TcxLabel
        Left = 4
        Top = 40
        Caption = #1064#1080#1088#1080#1085#1072':'
      end
      object spBorderWidth: TcxSpinEdit
        Left = 54
        Top = 38
        Properties.AssignedValues.MinValue = True
        Properties.OnChange = spBorderWidthPropertiesChange
        TabOrder = 5
        Value = 1
        Width = 40
      end
    end
    object tsCellBorders: TcxTabSheet
      Caption = #1043#1088#1072#1085#1080#1094#1099' '#1103#1095#1077#1077#1082
      ImageIndex = 3
      ExplicitLeft = 2
      ExplicitTop = 22
      ExplicitWidth = 575
      ExplicitHeight = 236
      object cxLabel4: TcxLabel
        Left = 24
        Top = 14
        Caption = #1058#1080#1087':'
      end
      object cbCellBorderStyle: TcxComboBox
        Left = 54
        Top = 12
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #1056#1077#1083#1100#1077#1092#1085#1072#1103
          'Lowered'
          #1062#1074#1077#1090#1085#1072#1103
          #1062#1074#1077#1090#1085#1072#1103' '#1088#1077#1083#1100#1077#1092#1085#1072#1103
          #1062#1074#1077#1090#1085#1072#1103' lowered')
        Properties.OnChange = cbCellBorderStylePropertiesChange
        TabOrder = 1
        Text = #1062#1074#1077#1090#1085#1072#1103
        Width = 121
      end
      object cxLabel6: TcxLabel
        Left = 18
        Top = 66
        Caption = #1062#1074#1077#1090':'
      end
      object ccCellBorderColor: TcxColorComboBox
        Left = 54
        Top = 64
        ColorValue = clWindowText
        Properties.AllowSelectColor = True
        Properties.CustomColors = <>
        Properties.DropDownSizeable = True
        Properties.NamingConvention = cxncHTML4
        Properties.PrepareList = cxplHTML4
        Properties.OnChange = ccCellBorderColorPropertiesChange
        TabOrder = 3
        Width = 169
      end
      object spCellBorderWidth: TcxSpinEdit
        Left = 54
        Top = 38
        Properties.AssignedValues.MinValue = True
        Properties.OnChange = spCellBorderWidthPropertiesChange
        TabOrder = 4
        Value = 1
        Width = 40
      end
      object cxLabel9: TcxLabel
        Left = 4
        Top = 40
        Caption = #1064#1080#1088#1080#1085#1072':'
      end
      object cxGroupBox1: TcxGroupBox
        Left = 18
        Top = 90
        Caption = #1054#1090' '#1075#1088#1072#1085#1080#1094#1099' '#1090#1072#1073#1083#1080#1094#1099
        TabOrder = 6
        Height = 66
        Width = 150
        object cxLabel10: TcxLabel
          Left = 6
          Top = 14
          Caption = #1055#1086' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1080':'
        end
        object seBorderHSpacing: TcxSpinEdit
          Left = 98
          Top = 14
          Properties.AssignedValues.MinValue = True
          Properties.OnChange = seBorderHSpacingPropertiesChange
          TabOrder = 1
          Width = 40
        end
        object cxLabel11: TcxLabel
          Left = 17
          Top = 42
          Caption = #1055#1086' '#1074#1077#1088#1090#1080#1082#1072#1083#1080':'
        end
        object seBorderVSpacing: TcxSpinEdit
          Left = 98
          Top = 40
          Properties.AssignedValues.MinValue = True
          Properties.OnChange = seBorderVSpacingPropertiesChange
          TabOrder = 3
          Width = 40
        end
      end
      object cxGroupBox2: TcxGroupBox
        Left = 18
        Top = 166
        Caption = #1052#1077#1078#1076#1091' '#1103#1095#1077#1081#1082#1072#1084#1080
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        TabOrder = 7
        Height = 66
        Width = 150
        object cxLabel12: TcxLabel
          Left = 6
          Top = 14
          Caption = #1055#1086' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1080':'
        end
        object seCellHSpacing: TcxSpinEdit
          Left = 98
          Top = 14
          Properties.AssignedValues.MinValue = True
          Properties.OnChange = seCellHSpacingPropertiesChange
          TabOrder = 1
          Width = 40
        end
        object seCellVSpacing: TcxSpinEdit
          Left = 98
          Top = 40
          Properties.AssignedValues.MinValue = True
          Properties.OnChange = seCellVSpacingPropertiesChange
          TabOrder = 2
          Width = 40
        end
        object cxLabel13: TcxLabel
          Left = 17
          Top = 40
          Caption = #1055#1086' '#1074#1077#1088#1090#1080#1082#1072#1083#1080':'
        end
      end
    end
    object tsRules: TcxTabSheet
      Caption = #1051#1080#1085#1080#1080
      ImageIndex = 2
      ExplicitLeft = 2
      ExplicitTop = 22
      ExplicitWidth = 575
      ExplicitHeight = 236
      object cxGroupBox3: TcxGroupBox
        Left = 8
        Top = 4
        Caption = #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1080
        TabOrder = 0
        Height = 72
        Width = 236
        object seHRuleWidth: TcxSpinEdit
          Left = 56
          Top = 14
          Properties.AssignedValues.MinValue = True
          Properties.OnChange = seHRuleWidthPropertiesChange
          TabOrder = 0
          Width = 40
        end
        object cxLabel17: TcxLabel
          Left = 8
          Top = 16
          Caption = #1064#1080#1088#1080#1085#1072':'
        end
        object ccseHRuleColor: TcxColorComboBox
          Left = 56
          Top = 40
          Properties.AllowSelectColor = True
          Properties.CustomColors = <>
          Properties.DropDownSizeable = True
          Properties.NamingConvention = cxncHTML4
          Properties.PrepareList = cxplHTML4
          Properties.OnChange = ccseHRuleColorPropertiesChange
          TabOrder = 2
          Width = 169
        end
        object cxLabel18: TcxLabel
          Left = 22
          Top = 42
          Caption = #1062#1074#1077#1090':'
        end
      end
      object cxGroupBox4: TcxGroupBox
        Left = 8
        Top = 82
        Caption = #1042#1077#1088#1090#1080#1082#1072#1083#1080
        TabOrder = 1
        Height = 72
        Width = 236
        object seVRuleWidth: TcxSpinEdit
          Left = 56
          Top = 14
          Properties.AssignedValues.MinValue = True
          Properties.OnChange = seVRuleWidthPropertiesChange
          TabOrder = 0
          Width = 40
        end
        object cxLabel19: TcxLabel
          Left = 8
          Top = 16
          Caption = #1064#1080#1088#1080#1085#1072':'
        end
        object ccVRuleColor: TcxColorComboBox
          Left = 56
          Top = 40
          Properties.AllowSelectColor = True
          Properties.CustomColors = <>
          Properties.DropDownSizeable = True
          Properties.NamingConvention = cxncHTML4
          Properties.PrepareList = cxplHTML4
          Properties.OnChange = ccVRuleColorPropertiesChange
          TabOrder = 2
          Width = 169
        end
        object cxLabel20: TcxLabel
          Left = 22
          Top = 42
          Caption = #1062#1074#1077#1090':'
        end
      end
    end
  end
  object RVExample: TRichViewEdit
    Left = 0
    Top = 262
    Width = 581
    Height = 101
    ReadOnly = False
    Align = alBottom
    TabOrder = 2
    DoInPaletteMode = rvpaCreateCopies
    Style = RVStyle1
  end
  object RVStyle1: TRVStyle
    TextStyles = <
      item
        StyleName = 'Normal text'
        FontName = 'Arial'
      end
      item
        StyleName = 'Heading'
        FontName = 'Arial'
        Style = [fsBold]
        Color = clBlue
      end
      item
        StyleName = 'Subheading'
        FontName = 'Arial'
        Style = [fsBold]
        Color = clNavy
      end
      item
        StyleName = 'Keywords'
        FontName = 'Arial'
        Style = [fsItalic]
        Color = clMaroon
      end
      item
        StyleName = 'Jump 1'
        FontName = 'Arial'
        Style = [fsUnderline]
        Color = clGreen
        Jump = True
      end
      item
        StyleName = 'Jump 2'
        FontName = 'Arial'
        Style = [fsUnderline]
        Color = clGreen
        Jump = True
      end>
    ParaStyles = <
      item
        StyleName = 'Paragraph Style'
        Tabs = <>
      end
      item
        StyleName = 'Centered'
        Alignment = rvaCenter
        Tabs = <>
      end>
    ListStyles = <>
    InvalidPicture.Data = {
      07544269746D617036100000424D361000000000000036000000280000002000
      0000200000000100200000000000001000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800080808000808080008080800080808000808080008080
      800080808000808080008080800080808000808080008080800080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000}
    StyleTemplates = <>
    Left = 324
    Top = 278
  end
end
