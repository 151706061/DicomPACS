object frmGetPeriod: TfrmGetPeriod
  Left = 553
  Top = 218
  HelpContext = 44
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1085#1072' '#1087#1072#1094#1080#1077#1085#1090#1072
  ClientHeight = 572
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'StMedsestra.chm'
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
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 376
    Height = 48
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 44
        Width = 370
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 363
      Height = 44
      AutoSize = True
      ButtonHeight = 44
      ButtonWidth = 52
      Caption = 'ToolBar1'
      Images = ilImages
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object tbuPrint: TToolButton
        Tag = 1
        Left = 0
        Top = 0
        Action = aSave
        AutoSize = True
        DropdownMenu = pmPrintView
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
      end
      object ToolButton2: TToolButton
        Left = 68
        Top = 0
        Action = aCancel
        AutoSize = True
        ParentShowHint = False
        ShowHint = True
      end
      object gbUchGr: TcxGroupBox
        Left = 118
        Top = 0
        Caption = ' '#1043#1088#1091#1087#1087#1080#1088#1086#1074#1082#1072' '
        TabOrder = 0
        Height = 44
        Width = 168
        object chbShowMoGroup: TcxCheckBox
          Left = 3
          Top = 14
          Caption = #1054#1090#1076#1077#1083#1077#1085#1080#1103
          Style.BorderStyle = ebs3D
          TabOrder = 0
          Transparent = True
          OnClick = chbShowMoGroupClick
          Width = 80
        end
        object chbShowUchGr: TcxCheckBox
          Left = 85
          Top = 14
          Caption = #1059#1095'. '#1075#1088#1091#1087#1087#1099
          State = cbsChecked
          Style.BorderStyle = ebs3D
          TabOrder = 1
          Transparent = True
          OnClick = chbShowUchGrClick
          Width = 80
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 48
    Width = 376
    Height = 264
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Bevel1: TBevel
      Left = 170
      Top = 11
      Width = 9
      Height = 241
      Shape = bsLeftLine
    end
    object Bevel2: TBevel
      Left = 179
      Top = 120
      Width = 145
      Height = 8
      Shape = bsTopLine
    end
    object rbM1: TRadioButton
      Left = 37
      Top = 6
      Width = 65
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1103#1085#1074#1072#1088#1100
      Caption = #1071#1085#1074#1072#1088#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = rbAllClick
    end
    object rbM2: TRadioButton
      Left = 37
      Top = 27
      Width = 73
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1092#1077#1074#1088#1072#1083#1100
      Caption = #1060#1077#1074#1088#1072#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = rbAllClick
    end
    object rbM3: TRadioButton
      Left = 37
      Top = 49
      Width = 49
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1084#1072#1088#1090
      Caption = #1052#1072#1088#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = rbAllClick
    end
    object rbM4: TRadioButton
      Left = 37
      Top = 70
      Width = 65
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1072#1087#1088#1077#1083#1100
      Caption = #1040#1087#1088#1077#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = rbAllClick
    end
    object rbM5: TRadioButton
      Left = 37
      Top = 91
      Width = 49
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1084#1072#1081
      Caption = #1052#1072#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = rbAllClick
    end
    object rbM6: TRadioButton
      Left = 37
      Top = 112
      Width = 60
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1080#1102#1085#1100
      Caption = #1048#1102#1085#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = rbAllClick
    end
    object rbM7: TRadioButton
      Left = 37
      Top = 134
      Width = 57
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1080#1102#1083#1100
      Caption = #1048#1102#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = rbAllClick
    end
    object rbM8: TRadioButton
      Left = 37
      Top = 155
      Width = 68
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1072#1074#1075#1091#1089#1090
      Caption = #1040#1074#1075#1091#1089#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = rbAllClick
    end
    object rbM9: TRadioButton
      Left = 37
      Top = 176
      Width = 84
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1089#1077#1085#1090#1103#1073#1088#1100
      Caption = #1057#1077#1085#1090#1103#1073#1088#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = rbAllClick
    end
    object rbM10: TRadioButton
      Left = 37
      Top = 198
      Width = 76
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1086#1082#1090#1103#1073#1088#1100
      Caption = #1054#1082#1090#1103#1073#1088#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = rbAllClick
    end
    object rbM11: TRadioButton
      Left = 37
      Top = 219
      Width = 65
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1085#1086#1103#1073#1088#1100
      Caption = #1053#1086#1103#1073#1088#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = rbAllClick
    end
    object rbM12: TRadioButton
      Left = 37
      Top = 240
      Width = 73
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1076#1077#1082#1072#1073#1088#1100
      Caption = #1044#1077#1082#1072#1073#1088#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = rbAllClick
    end
    object rbK1: TRadioButton
      Left = 185
      Top = 6
      Width = 97
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - 1-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Caption = '1-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnClick = rbAllClick
    end
    object rbK2: TRadioButton
      Left = 185
      Top = 27
      Width = 97
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - 2-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Caption = '2-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = rbAllClick
    end
    object rbK3: TRadioButton
      Left = 185
      Top = 49
      Width = 97
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - 3-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Caption = '3-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnClick = rbAllClick
    end
    object rbK4: TRadioButton
      Left = 185
      Top = 70
      Width = 97
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - 4-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Caption = '4-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnClick = rbAllClick
    end
    object rbG1: TRadioButton
      Left = 185
      Top = 134
      Width = 115
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - 1-'#1077' '#1087#1086#1083#1091#1075#1086#1076#1080#1077
      Caption = '1-'#1077' '#1087#1086#1083#1091#1075#1086#1076#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
      OnClick = rbAllClick
    end
    object rbG2: TRadioButton
      Left = 185
      Top = 155
      Width = 115
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - 2-'#1077' '#1087#1086#1083#1091#1075#1086#1076#1080#1077
      Caption = '2-'#1077' '#1087#1086#1083#1091#1075#1086#1076#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      OnClick = rbAllClick
    end
    object rbG3: TRadioButton
      Left = 185
      Top = 198
      Width = 115
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1074#1077#1089#1100' '#1075#1086#1076
      Caption = #1042#1077#1089#1100' '#1075#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
      OnClick = rbAllClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 312
    Width = 376
    Height = 36
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    DesignSize = (
      376
      36)
    object Label4: TLabel
      Left = 241
      Top = 11
      Width = 15
      Height = 13
      Hint = #1042#1074#1086#1076' '#1082#1086#1085#1077#1095#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
      Anchors = [akTop, akRight]
      Caption = '&'#1087#1086':'
      FocusControl = dDate2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label1: TLabel
      Left = 107
      Top = 10
      Width = 9
      Height = 13
      Hint = #1042#1074#1086#1076' '#1082#1086#1085#1077#1095#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
      Anchors = [akTop, akRight]
      Caption = '&c:'
      FocusControl = dDate1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object dDate1: TJvDateEdit
      Left = 128
      Top = 7
      Width = 96
      Height = 21
      Hint = #1042#1074#1086#1076' '#1085#1072#1095#1072#1083#1100#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageKind = ikEllipsis
      ButtonWidth = 16
      Anchors = [akTop, akRight]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Weekends = [Sun, Sat]
      YearDigits = dyFour
      TabOrder = 0
      OnChange = dDate1Change
    end
    object dDate2: TJvDateEdit
      Left = 275
      Top = 7
      Width = 96
      Height = 21
      Hint = #1042#1074#1086#1076' '#1082#1086#1085#1077#1095#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageKind = ikEllipsis
      ButtonWidth = 16
      Anchors = [akTop, akRight]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Weekends = [Sun, Sat]
      YearDigits = dyFour
      TabOrder = 1
      OnChange = dDate1Change
    end
    object chbPeriod: TcxCheckBox
      Left = 8
      Top = 7
      Caption = #1055#1077#1088#1080#1086#1076':'
      Enabled = False
      State = cbsChecked
      Style.BorderStyle = ebs3D
      TabOrder = 2
      Transparent = True
      Width = 89
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 492
    Width = 376
    Height = 80
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 3
    object rbuAllPac: TRadioButton
      Left = 8
      Top = 8
      Width = 95
      Height = 17
      Caption = #1042#1089#1077' '#1087#1072#1094#1080#1077#1085#1090#1099
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbuAllPacClick
    end
    object rbuOnePac: TRadioButton
      Left = 116
      Top = 8
      Width = 65
      Height = 17
      Caption = #1055#1072#1094#1080#1077#1085#1090
      TabOrder = 1
      OnClick = rbuOnePacClick
    end
    object ccbKontingent: TcxCheckComboBox
      Left = 146
      Top = 31
      Enabled = False
      Properties.EmptySelectionText = '('#1053#1077' '#1091#1082#1072#1079#1072#1085')'
      Properties.EditValueFormat = cvfCaptions
      Properties.Items = <
        item
        end>
      Properties.OnClickCheck = ccbKontingentPropertiesClickCheck
      Style.BorderStyle = ebs3D
      TabOrder = 2
      Visible = False
      Width = 225
    end
    object chbKontingent: TcxCheckBox
      Left = 8
      Top = 31
      Caption = #1055#1088#1080#1079#1085#1072#1082' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090#1072
      Style.BorderStyle = ebs3D
      TabOrder = 3
      Transparent = True
      Visible = False
      OnClick = chbKontingentClick
      Width = 137
    end
    object lcbPacLst: TcxLookupComboBox
      Left = 186
      Top = 6
      Enabled = False
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'FK_PACID'
      Properties.ListColumns = <
        item
          Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
          SortOrder = soAscending
          Width = 100
          FieldName = 'FC_PAC_FIO'
        end
        item
          Caption = #1048#1041
          Width = 60
          FieldName = 'FC_IB'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListSource = dsPacLst
      Properties.OnInitPopup = lcbPacLstPropertiesInitPopup
      Style.BorderStyle = ebs3D
      TabOrder = 4
      Width = 159
    end
    object chbVidOpl: TcxCheckBox
      Left = 8
      Top = 54
      Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099
      Style.BorderStyle = ebs3D
      TabOrder = 5
      Transparent = True
      Visible = False
      OnClick = chbVidOplClick
      Width = 137
    end
    object ccbVidOpl: TcxCheckComboBox
      Left = 146
      Top = 54
      Enabled = False
      Properties.EmptySelectionText = '('#1053#1077' '#1091#1082#1072#1079#1072#1085')'
      Properties.EditValueFormat = cvfCaptions
      Properties.Items = <>
      Properties.OnClickCheck = ccbKontingentPropertiesClickCheck
      Style.BorderStyle = ebs3D
      TabOrder = 6
      Visible = False
      Width = 225
    end
    object btSearchPac: TcxButton
      Left = 351
      Top = 6
      Width = 20
      Height = 19
      Hint = #1053#1072#1081#1090#1080' '#1087#1072#1094#1080#1077#1085#1090#1072
      Enabled = False
      TabOrder = 7
      OnClick = btSearchPacClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFB44A08C7521CEC6145F7634FF6654FFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB64B0BCD5422
        F06148F86F56F97A5BF9816AF76C58F15B46A25C27FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFBD4C11D4562BF67458FC8865FC8764FDD3CAFAA497E9
        543B9C5922008F0014AE2B20C0504ECB655AC558019400008000C54F1ADF6139
        FE8968FF875FFFAC94FFFFFFFFC9BCEE664797561B11A42532D46E33D05EAEF5
        AEB2F3B313A922008201FF00FFDF6139FF8B64C6705BABA2A5C3CACDECA18CFE
        7856A765281AB53726C15644A153A8C4A582C98027BF49078D12FF00FFFF00FF
        5C617F336AAC2370BD2569A98C676DFF00FFFF00FF06380C0631111531671A33
        8016445723A74BFF00FFFF00FF2080B71A83DC309FFF339DFF2B93F62E81D0FF
        00FF020C160000000814481342B00F3FAE0F35A012418FFF00FF3282A33F9AD3
        44ACFF45AEFF45AEFD46AFFF3FACFE2687D1020C12020611184DA81F61D11D5C
        C41E5DC71950C10727A13282A345A4E04BB4FF4AB1FD47ADF847ADF94CB6FF3A
        96DA030B0E030F202269CC2572E02166CE226DD72269D31C50B43282A33282A3
        46A2D348AAE84AB1FC4AAFFA4DB6FF358CD0050C1205070B206ABA3197FF2F8D
        F53091F92879DE205EAF3282A33282A33282A348A6DD4EB6FE4EB7FF49B0F622
        6A9F060D1326201A243E571E69AF277ECD2D85D41A4D8A205EAFFF00FF3282A3
        3282A33282A33282A33282A33282A3FF00FFFF00FF2A28266A666160605F2029
        33071321030817FF00FFFF00FFFF00FF3282A33282A33282A33282A3FF00FFFF
        00FFFF00FFFF00FF5253535C5A58221E1A000000FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 348
    Width = 376
    Height = 36
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 4
    object chbAllMOGROUP: TcxCheckBox
      Left = 8
      Top = 9
      Caption = #1042#1089#1077' '#1086#1090#1076#1077#1083#1077#1085#1080#1103
      State = cbsChecked
      Style.BorderStyle = ebs3D
      TabOrder = 0
      Transparent = True
      OnClick = chbAllMOGROUPClick
      Width = 105
    end
    object lcbMOGROUP: TcxLookupComboBox
      Left = 118
      Top = 10
      Enabled = False
      Properties.KeyFieldNames = 'GROUPID'
      Properties.ListColumns = <
        item
          Caption = #1043#1088#1091#1087#1087#1072' '#1052#1054' ('#1054#1090#1076#1077#1083#1077#1085#1080#1077', '#1082#1072#1073#1080#1085#1077#1090')'
          FieldName = 'FC_GROUP'
        end>
      Properties.ListSource = dsMOGROUP
      Style.BorderStyle = ebs3D
      TabOrder = 1
      Width = 253
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 384
    Width = 376
    Height = 36
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 5
    object chbAllUchGr: TcxCheckBox
      Left = 8
      Top = 9
      Caption = #1042#1089#1077' '#1091#1095'. '#1075#1088#1091#1087#1087#1099
      State = cbsChecked
      Style.BorderStyle = ebs3D
      TabOrder = 0
      Transparent = True
      OnClick = chbAllUchGrClick
      Width = 105
    end
    object ccbUchGr: TcxCheckComboBox
      Left = 118
      Top = 9
      Enabled = False
      Properties.EmptySelectionText = '('#1053#1077' '#1091#1082#1072#1079#1072#1085')'
      Properties.EditValueFormat = cvfCaptions
      Properties.Items = <>
      Style.BorderStyle = ebs3D
      TabOrder = 1
      Width = 253
    end
  end
  object pFinsource: TPanel
    Left = 0
    Top = 456
    Width = 376
    Height = 36
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 6
    object chbAllFinsource: TcxCheckBox
      Left = 8
      Top = 9
      Caption = #1042#1089#1077' '#1080#1089#1090'. '#1092#1080#1085'-'#1080#1103
      State = cbsChecked
      Style.BorderStyle = ebs3D
      TabOrder = 0
      Transparent = True
      OnClick = chbAllFinsourceClick
      Width = 105
    end
    object ccbFinsource: TcxCheckComboBox
      Left = 118
      Top = 9
      Enabled = False
      Properties.EmptySelectionText = '('#1053#1077' '#1091#1082#1072#1079#1072#1085')'
      Properties.EditValueFormat = cvfCaptions
      Properties.Items = <>
      Style.BorderStyle = ebs3D
      TabOrder = 1
      Width = 253
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 420
    Width = 376
    Height = 36
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 7
    object chbAllMedic: TcxCheckBox
      Left = 8
      Top = 9
      Caption = #1042#1089#1077' '#1058#1052#1062
      State = cbsChecked
      Style.BorderStyle = ebs3D
      TabOrder = 0
      Transparent = True
      OnClick = chbAllMedicClick
      Width = 105
    end
    object lcbMedic: TcxLookupComboBox
      Left = 118
      Top = 9
      Enabled = False
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'MEDICID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_MEDIC'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsMedic
      Style.BorderStyle = ebs3D
      TabOrder = 1
      Width = 253
    end
  end
  object ilImages: TImageList
    Left = 272
    Top = 40
    Bitmap = {
      494C0101020024003C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B0000007B00
      00007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000080000000000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B000000007B00007B00
      00007B0000007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000007B00000000000000
      00007B7B7B00000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      00007B0000007B0000007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000007B0000007B000000
      00007B7B7B007B7B7B0000000000000000000000000000007B00000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      0000007B0000007B00007B0000007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000007B0000007B000000
      7B0000000000000000007B7B7B000000000000007B0000007B0000007B000000
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      0000007B0000007B0000007B00007B0000007B7B7B007B7B7B00000000000000
      000000000000000000000000000000000000000000000000FF0000007B000000
      7B0000007B00000000000000000000007B0000007B0000007B0000007B000000
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      000000FF0000007B0000007B0000007B00007B0000007B7B7B007B7B7B000000
      00000000000000000000000000000000000000000000000000000000FF000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      000000FF000000FF0000007B0000007B0000007B00007B0000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000007B0000007B0000007B0000007B0000007B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      00007B7B7B000000000000FF0000007B0000007B0000007B00007B0000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      00000000FF0000007B0000007B0000007B0000007B007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      00007B7B7B000000000000FF000000FF0000007B0000007B0000007B00007B00
      00007B7B7B000000000000000000000000000000000000000000000000000000
      00000000FF0000007B0000007B0000007B0000007B00000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063FF000000FF0000007B
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      00007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      FF0000007B0000007B0000007B0000007B0000007B0000007B00000000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000A5FF0000007B0000007B
      00007B0000007B7B7B007B7B7B00000000000000000000000000000000000000
      FF0000007B0000007B0000007B000000FF000000FF0000007B00000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF0000007B
      0000007B00007B0000007B7B7B007B7B7B0000000000000000000000FF000000
      7B0000007B00000000007B7B7B0000000000000000000000FF0000007B000000
      7B00000000007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      0000007B0000007B00007B0000007B7B7B00000000000000FF0000007B000000
      7B00000000007B7B7B00000000000000000000000000000000000000FF000000
      7B0000007B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF0000007B00007B0000007B7B7B0000000000000000000000FF000000
      7B00848484000000000000000000000000000000000000000000000000000000
      FF0000007B0000007B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000007B00007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00E7FFFFFF00000000C3FF8FFF00000000
      81FF078F0000000000FF038700000000007F810700000000003F800F00000000
      001FC01F00000000001FE03F00000000040FF03F000000000407F01F00000000
      8F03E00F00000000FF01E00700000000FFC0C18300000000FFE083C300000000
      FFF0C7E100000000FFF8FFF30000000000000000000000000000000000000000
      000000000000}
  end
  object alActions: TActionList
    Images = ilImages
    Left = 288
    Top = 80
    object aSave: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 0
      ShortCut = 13
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 1
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object acExcelExport: TAction
      Caption = #1042' Excel'
      Hint = #1069#1082#1087#1086#1088#1090' '#1074' Excel'
    end
  end
  object os: TOracleSession
    LogonUsername = 'ASU'
    LogonPassword = 'ASU'
    LogonDatabase = 'ASU'
    Left = 12
    Top = 32
  end
  object odsRepSpisOnPac: TOracleDataSet
    SQL.Strings = (
      
        'select m.fc_name as FC_MEDIC_NAME, ei.fc_name as FC_ED_IZM, gr.f' +
        'c_uchgr, c.*,  rtrim(TO_CHAR(c.FN_KOL, '#39'FM999G999G990D99'#39'),'#39'.,'#39')' +
        ' as FC_KOL  from'
      
        '(select b.medicid, :group/*FC_GROUP,*/ :finsource1 /*fc_finsourc' +
        'ename, */SUM(b.fn_kol) as FN_KOL, SUM(b.FN_SUMM) as FN_SUMM from'
      '(select a.* from '
      '(select'
      '  dp.fd_date_spis as FD_DATE,'
      
        '  k.medicid, k.kartid, dp.fn_kol, (dp.fn_kol*k.fn_price) as FN_S' +
        'UMM,'
      '  d.fk_mogroupid_to as FK_PacID,'
      '  mg.FC_GROUP'
      '  :finsource2 /*, fs.fc_name as fc_finsourcename*/'
      'from'
      
        '  med.tdocs d, med.tdpc dp, med.tkart k, med.tmedic m, MED.TMO_G' +
        'ROUP mg :finsource3 /*, med.tfinsource fs*/'
      'where   '
      ' dp.kartid = k.kartid'
      'and d.dpid = dp.dpid'
      'and m.medicid = k.medicid'
      ''
      '-- and m.medicid = decode(:pmedic,-1, m.medicid, :pmedic)'
      'and (( m.medicid = :pmedic ) or ( :pmedic = -1 ) )'
      ''
      '--%UCHGR  AND m.uchgrid in (%LIST_UCHGR%)'
      ':finsource4 /*and k.fk_finsource_id = fs.fk_id(+)*/'
      ':finsource6 /*and k.fk_finsource_id in (%LIST_FINSOURCE%)*/'
      'and d.fk_mogroupid_FROM = mg.GROUPID(+)'
      'and ((d.fk_mogroupid_FROM = :pMOGROUP)or(:AllGROUPS = 1))'
      
        'and d.fp_vid = 3 and d.fp_vidmove = 8 and d.fn_spisanievid = 3  ' +
        'and d.fl_edit = 0'
      
        'and ((d.fk_mogroupid_to = :pPacID)or(:AllPac = 1))) a --%KONTING' +
        'ENT, asu.tib'
      ''
      'where TRUNC(a.FD_DATE) between TRUNC(:DATE1) and TRUNC(:DATE2)'
      
        '--%VIDOPL  AND  (select NVL(MAX(t.fk_id),-1) from asu.tinsurdocs' +
        ' i, asu.tpac_insurance pi, asu.ttypedoc t'
      
        '--%VIDOPL     where a.FK_PacID = pi.fk_pacid and i.fk_id = pi.fk' +
        '_insurdocid'
      
        '--%VIDOPL       and t.fk_id = i.fk_typedocid) in( %LIST_VIDOPL% ' +
        ')'
      '--%KONTINGENT  AND a.FK_PacID = tib.fk_pacid(+)'
      '--%KONTINGENT  and tib.fk_smid in( %LIST_KONTINGENT% )'
      ') b'
      
        'group by :group/*FC_GROUP,*/ :finsource5 /*fc_finsourcename, */b' +
        '.medicid'
      ') c, med.tmedic m, med.tei ei, med.tuchgr gr'
      'where c.medicid = m.medicid'
      '  and m.eiid = ei.eiid(+)'
      '  and m.uchgrid = gr.uchgrid(+)'
      'ORDER BY :group/*FC_GROUP,*/ :uchgr/*fc_uchgr,*/ m.FC_NAME')
    Optimize = False
    Variables.Data = {
      030000000F000000060000003A44415445320C00000000000000000000000600
      00003A44415445310C0000000000000000000000070000003A50504143494403
      0000000000000000000000070000003A414C4C50414303000000040000000100
      000000000000090000003A504D4F47524F55500300000000000000000000000A
      0000003A414C4C47524F5550530300000000000000000000000B0000003A4649
      4E534F55524345310100000000000000000000000B0000003A46494E534F5552
      4345320100000000000000000000000B0000003A46494E534F55524345330100
      000000000000000000000B0000003A46494E534F555243453401000000000000
      00000000000B0000003A46494E534F5552434535010000000000000000000000
      060000003A47524F55500100000000000000000000000B0000003A46494E534F
      5552434536010000000000000000000000060000003A55434847520100000000
      00000000000000070000003A504D45444943030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000006000000464E5F4B4F4C01000000000007000000464E5F53
      554D4D0100000000000D00000046435F4D454449435F4E414D45010000000000
      0900000046435F45445F495A4D010000000000070000004D4544494349440100
      000000000600000046435F4B4F4C0100000000000800000046435F47524F5550
      0100000000000A00000046435F47524F55505F31010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 129
    Top = 68
  end
  object odsPacLst: TOracleDataSet
    SQL.Strings = (
      
        'select distinct b.FK_PacID, b.FC_PAC_FIO, b.FC_IB, b.FD_BITH, b.' +
        'FD_IN, b.FD_OUT from'
      '(select'
      '  d.fk_mogroupid_to as FK_PacID,'
      '  k.fk_ibid||'#39'/'#39'||k.fk_iby as FC_IB,'
      
        '  TRIM(k.FC_FAM || '#39' '#39' || NVL2(k.FC_IM, SUBSTR (k.FC_IM, 0, 1) |' +
        '| '#39'. '#39' || NVL2(k.FC_OTCH, SUBSTR (k.FC_OTCH, 0, 1) || '#39'. '#39', '#39#39'),' +
        ' '#39#39'))  as FC_PAC_FIO,'
      '  asu.PKG_REGIST_PACFUNC.GET_PAC_BITH(k.fk_id) FD_BITH,'
      '  asu.PKG_REGIST_PACFUNC.GET_PAC_INCOME(k.fk_id) fd_in,'
      '  asu.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(k.fk_id) fd_out,'
      '  dp.fd_date_spis as FD_DATE'
      ''
      'from'
      '  med.tdocs d, asu.tkarta k,-- asu.tpeoples p,'
      '  med.tdpc dp'
      'where   '
      '  d.dpid = dp.dpid'
      
        'and d.fp_vid = 3 and d.fp_vidmove = 8 and d.fn_spisanievid = 3 a' +
        'nd d.fl_edit = 0'
      'and (:ALLPAC = 0)'
      'and (:ppacid = -1)'
      
        '--and (asu.PKG_REGIST_PACFUNC.GET_PEPL_ID(d.fk_mogroupid_to) = p' +
        '.fk_id(+))'
      'and d.fk_mogroupid_to = k.fk_id(+)'
      
        'and (dp.fd_date_spis >= TRUNC(:DATE1) and dp.fd_date_spis < TRUN' +
        'C(:DATE2+1))'
      ') b'
      'union all'
      'select k.fk_id as fk_pacid,'
      
        '       TRIM(k.FC_FAM || '#39' '#39' || NVL2(k.FC_IM, SUBSTR (k.FC_IM, 0,' +
        ' 1) || '#39'. '#39' || NVL2(k.FC_OTCH, SUBSTR (k.FC_OTCH, 0, 1) || '#39'. '#39',' +
        ' '#39#39'), '#39#39'))  as FC_PAC_FIO,'
      '       k.fk_ibid||'#39'/'#39'||k.fk_iby as FC_IB,'
      '       asu.PKG_REGIST_PACFUNC.GET_PAC_BITH(k.fk_id) FD_BITH,'
      '       asu.PKG_REGIST_PACFUNC.GET_PAC_INCOME(k.fk_id) fd_in,'
      '       asu.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(k.fk_id) fd_out'
      '  from asu.tkarta k'
      ' where k.fk_id = :ppacid')
    Optimize = False
    Variables.Data = {
      0300000004000000070000003A414C4C50414303000000040000000100000000
      000000060000003A44415445310C0000000000000000000000060000003A4441
      5445320C0000000000000000000000070000003A505041434944030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000008000000464B5F50414349440100000000000A0000004643
      5F5041435F46494F010000000000}
    Cursor = crSQLWait
    Session = os
    AfterOpen = odsPacLstAfterOpen
    Left = 278
    Top = 249
  end
  object dsPacLst: TDataSource
    DataSet = odsPacLst
    Left = 326
    Top = 245
  end
  object frxRepSpisOnPac: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39639.741412939810000000
    ReportOptions.LastChange = 41058.506976898150000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  FN_ALL_SUMM : DOUBLE;'
      
        '  FN_GROUP_SUMM : DOUBLE;                                       ' +
        '             '
      '    '
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  FN_ALL_SUMM := FN_ALL_SUMM     + <frxDBRepSpisOnPac."FN_SUMM">' +
        ';'
      
        '  FN_GROUP_SUMM := FN_GROUP_SUMM + <frxDBRepSpisOnPac."FN_SUMM">' +
        ';      '
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  FN_ALL_SUMM := 0;                                    '
      'end;'
      ''
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  FN_GROUP_SUMM := 0;                   '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxRepSpisOnPacGetValue
    OnUserFunction = frxRepSpisOnPacUserFunction
    Left = 134
    Top = 130
    Datasets = <
      item
        DataSet = frxDBRepSpisOnPac
        DataSetName = 'frxDBRepSpisOnPac'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object MasterData1: TfrxMasterData
        Height = 20.000000000000000000
        Top = 228.000000000000000000
        Width = 680.315400000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBRepSpisOnPac
        DataSetName = 'frxDBRepSpisOnPac'
        RowCount = 0
        Stretched = True
        object Memo6: TfrxMemoView
          Width = 44.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 44.000000000000000000
          Width = 318.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBRepSpisOnPac."FC_MEDIC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 446.000000000000000000
          Width = 83.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBRepSpisOnPac."FC_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 529.000000000000000000
          Width = 151.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBRepSpisOnPac."FN_SUMM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 362.000000000000000000
          Width = 84.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBRepSpisOnPac."FC_ED_IZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 101.677180000000000000
        Top = 16.000000000000000000
        Width = 680.315400000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        Stretched = True
        object mePacFIO: TfrxMemoView
          Top = 53.000000000000000000
          Width = 680.315400000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218': [VAR_FC_PAC_FIO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Width = 680.315400000000000000
          Height = 53.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#8217#1057#8249#1056#1111#1056#1105#1057#1027#1056#1108#1056#176' '#1056#1109' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1056#176#1057#8230', '#1056#183#1056#176#1057#8218#1057#1026#1056#176#1057#8225#1056#181#1056#1029#1056#1029#1057#8249 +
              #1057#8230' '#1056#1029#1056#176' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1056#1109#1056#1030' '
            #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [VAR_FC_DATE1] '#1056#1111#1056#1109' [VAR_FC_DATE2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object memKriteria: TfrxMemoView
          Top = 58.000000000000000000
          Width = 680.315400000000000000
          Height = 43.677180000000000000
          Visible = False
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[VAR_KRITERIA]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 32.000000000000000000
        Top = 136.000000000000000000
        Width = 680.315400000000000000
        ReprintOnNewPage = True
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 44.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'.'#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 44.000000000000000000
          Width = 318.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 446.000000000000000000
          Width = 83.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 529.000000000000000000
          Width = 151.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 362.000000000000000000
          Width = 84.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 20.000000000000000000
        Top = 308.000000000000000000
        Width = 680.315400000000000000
        object Memo11: TfrxMemoView
          Left = 446.000000000000000000
          Width = 234.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_ALL_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 362.000000000000000000
          Width = 84.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 348.000000000000000000
        Width = 680.315400000000000000
        object Memo12: TfrxMemoView
          Left = 529.133858270000000000
          Width = 151.181102360000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Width = 445.984442360000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADE_SIGN]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 20.000000000000000000
        Top = 188.000000000000000000
        Width = 680.315400000000000000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Condition = 'frxDBRepSpisOnPac."FC_GROUP"'
        object Memo13: TfrxMemoView
          Width = 44.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object mGroupHeader: TfrxMemoView
          Left = 44.000000000000000000
          Width = 636.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBRepSpisOnPac."FC_GROUP"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 20.000000000000000000
        Top = 268.000000000000000000
        Width = 680.315400000000000000
        object Memo16: TfrxMemoView
          Left = 446.000000000000000000
          Width = 234.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_GROUP_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object DialogPage1: TfrxDialogPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Height = 200.000000000000000000
      ClientHeight = 162.000000000000000000
      Left = 520.000000000000000000
      Top = 134.000000000000000000
      Width = 300.000000000000000000
      ClientWidth = 284.000000000000000000
    end
  end
  object frxDBRepSpisOnPac: TfrxDBDataset
    UserName = 'frxDBRepSpisOnPac'
    CloseDataSource = False
    DataSet = odsRepSpisOnPac
    BCDToCurrency = False
    Left = 222
    Top = 72
  end
  object oqGetRepParam: TOracleQuery
    SQL.Strings = (
      'begin'
      
        '  :res := asu.pkg_Smini.Readstring('#39'repSpisOnPac.exe'#39', '#39'PacByKon' +
        'tingentAndVidOpl'#39', 0);'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {0300000001000000040000003A5245530500000002000000300000000000}
    Left = 294
    Top = 184
  end
  object odsKontingent: TOracleDataSet
    SQL.Strings = (
      'select FK_ID, FC_NAME from asu.tsmid'
      'where'
      
        '    FK_OWNER in(select FK_ID from asu.tsmid where fc_synonim = '#39 +
        'LD_KONTINGENT'#39')'
      'AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Session = os
    Left = 192
    Top = 472
  end
  object odsVidOpl: TOracleDataSet
    SQL.Strings = (
      'select FK_ID, FC_NAME from asu.ttypedoc order by FN_ORDER ')
    Optimize = False
    Session = os
    Left = 298
    Top = 488
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 178
    Top = 222
  end
  object odsMOGROUP: TOracleDataSet
    SQL.Strings = (
      'select GROUPID, FC_GROUP from med.tmo_group where FL_DEL = 0')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000047524F555049440100000000000800000046435F
      47524F5550010000000000}
    Session = os
    Left = 322
    Top = 94
  end
  object dsMOGROUP: TDataSource
    DataSet = odsMOGROUP
    Left = 324
    Top = 138
  end
  object frxReport2: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38545.443404583300000000
    ReportOptions.LastChange = 40591.453430324070000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  summ, FN_GROUP_SUMM : double;                              '
      ''
      'procedure Memo30OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  summ := summ +  <frxDBRepSpisOnPac."FN_SUMM">;'
      
        '  FN_GROUP_SUMM := FN_GROUP_SUMM + <frxDBRepSpisOnPac."FN_SUMM">' +
        ';                              '
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' summ := 0;      '
      'end;'
      ''
      
        'procedure Memo8OnPreviewClick(Sender: TfrxView; Button: TMouseBu' +
        'tton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s,s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1091#1095#1077#1088#1077#1078#1076#1077#1085#1080#1103#39', '#39#1053#1072#1079#1074#1072#1085#1080#1077':'#39', s)' +
        ';  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      ''
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_CLIENT_NAME'#39',  s2);'
      'end;'
      ''
      
        'procedure Memo9OnPreviewClick(Sender: TfrxView; Button: TMouseBu' +
        'tton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s,s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#39', '#39#1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080 +
        #1077':'#39', s);  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      ''
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_PODRAZDELENIE'#39',  s2);'
      'end;'
      ''
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  FN_GROUP_SUMM := 0;  '
      'end;'
      ''
      
        'procedure Memo42OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s,s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := InputBox('#39#39', '#39#1055#1088#1080#1082#1072#1079' :'#39', s);  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      ''
      '  IniWriteString2('#39'Act_Spis'#39', '#39'PrikazOt'#39',  s2);'
      'end;'
      ''
      'begin'
      '  '
      'end.')
    OnGetValue = frxRepSpisOnPacGetValue
    Left = 116
    Top = 240
    Datasets = <
      item
        DataSet = frxDBRepSpisOnPac
        DataSetName = 'frxDBRepSpisOnPac'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      Columns = 1
      ColumnWidth = 180.000000000000000000
      ColumnPositions.Strings = (
        '0')
      LargeDesignHeight = True
      OnBeforePrint = 'Page1OnBeforePrint'
      object ReportTitle1: TfrxReportTitle
        Height = 269.559060000000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        object Memo1: TfrxMemoView
          Left = 416.000000000000000000
          Width = 259.559060000000000000
          Height = 19.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1032#1056#1118#1056#8217#1056#8226#1056#160#1056#8211#1056#8221#1056#1106#1056#174)
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Top = 129.102350000000000000
          Width = 675.559060000000000000
          Height = 86.015770000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1106#1056#1108#1057#8218' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1105#1057#1039' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1056#1109#1056#1030
            #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [VAR_FC_DATE1] '#1056#1111#1056#1109' [VAR_FC_DATE2]'
            '[VAR_KRITERIA]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Top = 48.102350000000000000
          Width = 362.834645669291000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1056#181')')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Top = 94.102350000000000000
          Width = 362.834645670000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181')')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Top = 240.102350000000000000
          Width = 172.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1057#1039' '#1056#1030' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#181':')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Top = 18.118120000000000000
          Width = 362.834645670000000000
          Height = 30.236240000000000000
          OnPreviewClick = 'Memo8OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_CLIENT_NAME]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo9: TfrxMemoView
          Top = 63.472480000000000000
          Width = 362.834645670000000000
          Height = 30.236240000000000000
          OnPreviewClick = 'Memo9OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_PODRAZDELENIE]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo43: TfrxMemoView
          Left = 416.000000000000000000
          Top = 19.000000000000000000
          Width = 259.559060000000000000
          Height = 19.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            #1056#8220#1056#187#1056#176#1056#1030#1056#1029#1057#8249#1056#8470' '#1056#1030#1057#1026#1056#176#1057#8225)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo45: TfrxMemoView
          Left = 416.000000000000000000
          Top = 38.000000000000000000
          Width = 259.559060000000000000
          Height = 19.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            #1056#1038#1056#176#1056#1029#1056#176#1057#8218#1056#1109#1057#1026#1056#1105#1057#1039'-'#1056#1111#1057#1026#1056#1109#1057#8222#1056#1105#1056#187#1056#176#1056#1108#1057#8218#1056#1109#1057#1026#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo46: TfrxMemoView
          Left = 416.000000000000000000
          Top = 57.000000000000000000
          Width = 259.559060000000000000
          Height = 19.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            #1042#171#1056#8220#1056#176#1056#183#1056#1111#1057#1026#1056#1109#1056#1112' '#1057#8218#1057#1026#1056#176#1056#1029#1057#1027#1056#1110#1056#176#1056#183' '#1056#174#1056#1110#1056#1109#1057#1026#1057#1027#1056#1108#1042#187)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo47: TfrxMemoView
          Left = 416.000000000000000000
          Top = 76.000000000000000000
          Width = 259.559060000000000000
          Height = 19.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152'.'#1056#1106'. '#1056#1038#1057#8218#1056#1109#1056#187#1057#1039#1057#1026#1056#1109#1056#1030)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo15: TfrxMemoView
          Left = 416.000000000000000000
          Top = 96.000000000000000000
          Width = 259.559060000000000000
          Height = 19.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '"___"  __________________  20___ '#1056#1110'.')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.000000000000000000
        Top = 695.433520000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frxDBRepSpisOnPac
        DataSetName = 'frxDBRepSpisOnPac'
        RowCount = 0
        Stretched = True
        object Memo24: TfrxMemoView
          Width = 37.559060000000000000
          Height = 22.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[LINE#]')
        end
        object Memo26: TfrxMemoView
          Left = 38.000000000000000000
          Width = 354.133890000000000000
          Height = 22.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBRepSpisOnPac."FC_MEDIC_NAME"]')
        end
        object Memo27: TfrxMemoView
          Left = 392.000000000000000000
          Width = 88.000000000000000000
          Height = 22.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBRepSpisOnPac."FC_ED_IZM"]')
        end
        object Memo28: TfrxMemoView
          Left = 480.000000000000000000
          Width = 72.456710000000000000
          Height = 22.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBRepSpisOnPac."FC_KOL"]')
        end
        object Memo30: TfrxMemoView
          Left = 552.000000000000000000
          Width = 116.000000000000000000
          Height = 22.000000000000000000
          OnBeforePrint = 'Memo30OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBRepSpisOnPac."FN_SUMM"]')
        end
      end
      object MasterFooter1: TfrxFooter
        Height = 25.102350000000000000
        Top = 789.921770000000000000
        Width = 680.315400000000000000
        Stretched = True
        object Memo81: TfrxMemoView
          Left = 396.543290000000000000
          Top = 1.550709999999981000
          Width = 83.149606300000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 479.622030160000000000
          Top = 1.550709999999981000
          Width = 187.811070000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[summ]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 102.456710000000000000
        Top = 1039.370750000000000000
        Width = 680.315400000000000000
        object Memo18: TfrxMemoView
          Top = 3.779530000000022000
          Width = 194.677180000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Top = 27.456709999999930000
          Width = 194.677180000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#167#1056#187#1056#181#1056#1029#1057#8249' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105': ')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 204.094620000000000000
          Top = 5.779530000000023000
          Width = 457.323130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[PRED] [DOLPRED]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 204.094620000000000000
          Top = 28.456709999999930000
          Width = 457.323130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom1] [DolKom1]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 204.094620000000000000
          Top = 51.133890000000060000
          Width = 457.323130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom2] [DolKom2]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 204.094620000000000000
          Top = 73.811069999999970000
          Width = 457.323130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom3] [DolKom3]')
          ParentFont = False
        end
      end
      object MasterHeader1: TfrxHeader
        Height = 50.000000000000000000
        Top = 578.268090000000000000
        Width = 680.315400000000000000
        object Memo3: TfrxMemoView
          Width = 37.559060000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 38.000000000000000000
          Width = 354.133890000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1056#176)
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 392.000000000000000000
          Width = 88.000000000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 480.000000000000000000
          Width = 72.456710000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 552.000000000000000000
          Width = 116.000000000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026)
          VAlign = vaCenter
        end
      end
      object MasterData6: TfrxMasterData
        Height = 98.881880000000000000
        Top = 347.716760000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 1
        object Memo31: TfrxMemoView
          Top = 1.779530000000022000
          Width = 194.677180000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Top = 25.456709999999990000
          Width = 194.677180000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#167#1056#187#1056#181#1056#1029#1057#8249' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105': ')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 204.094620000000000000
          Top = 3.779530000000022000
          Width = 468.661720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[PRED] [DOLPRED]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 204.094620000000000000
          Top = 26.456709999999990000
          Width = 468.661720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom1] [DolKom1]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 204.094620000000000000
          Top = 49.133890000000010000
          Width = 468.661720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom2] [DolKom2]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 204.094620000000000000
          Top = 71.811069999999970000
          Width = 468.661720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom3] [DolKom3]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 47.000000000000000000
        Top = 468.661720000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 1
        Stretched = True
        object Memo2: TfrxMemoView
          Width = 179.559060000000000000
          Height = 22.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#183#1056#1029#1056#176#1057#8225#1056#181#1056#1029#1056#176' '#1056#1111#1057#1026#1056#1105#1056#1108#1056#176#1056#183#1056#1109#1056#1112' '#1056#1109#1057#8218' ')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Top = 22.441250000000030000
          Width = 675.559060000000000000
          Height = 22.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              'c'#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1105#1056#187#1056#1105' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#1105#1056#8470' '#1056#176#1056#1108#1057#8218'  '#1056#1030' '#1057#8218#1056#1109#1056#1112', '#1057#8225#1057#8218#1056#1109' '#1056 +
              #1111#1056#1109' '#1057#1107#1056#1108#1056#176#1056#183#1056#176#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1111#1057#1026#1056#1105#1057#8225#1056#1105#1056#1029#1056#181' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1109' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056 +
              #176#1056#1112#1056#181#1056#1029#1057#8218#1056#1109#1056#1030':')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 180.000000000000000000
          Top = 0.441250000000025000
          Width = 495.559060000000000000
          Height = 22.000000000000000000
          OnPreviewClick = 'Memo42OnPreviewClick'
          ShowHint = False
          StretchMode = smMaxHeight
          Cursor = crHandPoint
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Prikaz]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 30.000000000000000000
        Top = 1164.095240000000000000
        Width = 680.315400000000000000
        object Memo25: TfrxMemoView
          Top = 7.747370000000046000
          Width = 667.842519685039000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [PAGE#] '#1056#1105#1056#183' [TotalPages#]')
          VAlign = vaCenter
        end
      end
      object MasterData4: TfrxMasterData
        Height = 20.000000000000000000
        Top = 536.693260000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 1
        Stretched = True
        object meSpisano: TfrxMemoView
          Top = 0.102039999999988100
          Width = 668.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[GETSPISANO]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData5: TfrxMasterData
        Height = 98.841990000000000000
        Top = 839.055660000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 1
        Stretched = True
        object Memo16: TfrxMemoView
          Top = 27.173160000000050000
          Width = 68.000000000000000000
          Height = 44.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107)
        end
        object Memo17: TfrxMemoView
          Top = 73.314470000000030000
          Width = 180.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1108#1056#187#1057#1035#1057#8225#1056#181#1056#1029#1056#1105#1056#181' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Width = 667.842519690000000000
          Height = 27.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#181#1056#1112#1057#1107' '#1056#176#1056#1108#1057#8218#1057#1107' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1109': [F' +
              'C_NAIM_KOL] '#1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039'(-'#1056#1105#1056#8470')')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 67.811070000000000000
          Top = 27.456710000000040000
          Width = 600.945270000000000000
          Height = 43.842519690000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MONEYSTR(<summ>)]')
          ParentFont = False
        end
      end
      object Band1: TfrxMasterData
        Height = 20.000000000000000000
        Top = 960.000620000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 1
        Stretched = True
        object Memo4: TfrxMemoView
          Width = 668.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AutoWidth = True
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clGreen
          Memo.UTF8 = (
            '[GETZAKLKOM]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 650.079160000000000000
        Width = 680.315400000000000000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Condition = 'frxDBRepSpisOnPac."FC_GROUP"'
        object Memo20: TfrxMemoView
          Width = 37.559060000000000000
          Height = 22.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo34: TfrxMemoView
          Left = 38.000000000000000000
          Width = 630.039580000000000000
          Height = 22.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBRepSpisOnPac."FC_GROUP"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 26.456710000000000000
        Top = 740.787880000000000000
        Width = 680.315400000000000000
        object Memo39: TfrxMemoView
          Left = 480.000310000000000000
          Width = 188.645640000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_GROUP_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Width = 480.000000000000000000
          Height = 20.031496060000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            
              #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111#1056#181' '#1056#1114#1056#1115': [frxDBRepSpisOnPac."FC_GROUP"' +
              ']')
          ParentFont = False
        end
      end
    end
  end
  object odsActSpisRep: TOracleDataSet
    SQL.Strings = (
      
        'SELECT /*+RULE*/-- :OTP4 AS OTP4,:DOLOTP4 AS DOLOTP4,:POL AS POL' +
        ',:OTP AS OTP,:DOLPOL AS DOLPOL,:DOLOTP AS DOLOTP,:OTP1 AS OTP1,:' +
        'OTP2 AS OTP2,:DOLOTP1 AS DOLOTP1,:DOLOTP2 AS DOLOTP2,'
      '    TO_CHAR(SYSDATE,'#39'MONTH'#39') AS MON,'
      '    TDPC.ROWID,'
      '    TKART.FC_SERIAL AS NOMNUM,'
      '    TMEDIC.FC_NAME AS NAMEMEDIC,'
      '    TDPC.DPCID,'
      '    TKART.MEDICID,'
      '    tdpc.FN_KOL,'
      '    (TKART.FN_PRICE * tdpc.FN_KOL) as summ,'
      '    TKART.KARTID,'
      '    TKART.FN_PRICE,'
      '    TEI.FC_NAME AS EINAME,'
      '    TKART.FC_NAME AS NAMEKART,'
      '    MED.PKG_PRIHRASH.GET_MONEYSTR(TDOCS.FN_PRICE) AS SUMSTR,'
      
        '    ASU.PKG_SMINI.READSTRING('#39'MANAGER_DOC'#39','#39'CLIENT_NAME'#39','#39#39') AS ' +
        'LOK,'
      '    ASU.PKG_SMINI.READSTRING('#39'NACHLOK'#39','#39'FIO'#39','#39#39') AS NACH, '
      '    TMO.FC_NAME AS NAMEFROM,'
      '    TDOCS.FC_DOC,'
      '    TRUNC (TDOCS.FD_DATA) AS DATA,'
      
        '--  '#1042#1080#1076' '#1089#1087#1080#1089#1072#1085#1080#1103': 1 - '#1086#1073#1099#1095#1085#1086#1077' ('#1080#1089#1090#1077#1082' '#1089#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080', '#1085#1077#1076#1086#1089#1090#1072#1095#1072'), ' +
        '2 - '#1089#1087#1080#1089#1072#1085#1080#1077' '#1085#1072' '#1086#1090#1076#1077#1083#1077#1085#1080#1077' (ASU.TOTDEL_MEDICA), 3 - '#1089#1087#1080#1089#1072#1085#1080#1077' '#1085#1072' '#1087 +
        #1072#1094#1080#1077#1085#1090#1072' (). '#1055#1086' '#1101#1090#1086#1084#1091' '#1087#1086#1083#1102' '#1086#1087#1088#1077#1076#1077#1083#1077#1103#1077#1084' '#1085#1072' '#1082#1072#1082#1091#1102' '#1090#1072#1073#1083#1080#1094#1091' '#1089#1089#1099#1083#1072#1077#1090#1089#1103 +
        ' '#1087#1086#1083#1077' motoid'
      '--    DECODE(TDOCS.fn_spisanievid, '
      
        '--              1, (SELECT MIN(FC_NAME) FROM MED.TSPISANIEVID WH' +
        'ERE FK_ID = TDOCS.motoid), '
      '--              2, '#39#1057#1087#1080#1089#1072#1085#1080#1077' '#1085#1072' '#1083#1077#1095#1077#1085#1080#1077' '#1087#1072#1094#1080#1077#1085#1090#1086#1074#39','
      '--              3, '#39#1057#1087#1080#1089#1072#1085#1080#1077' '#1085#1072' '#1083#1077#1095#1077#1085#1080#1077' '#1087#1072#1094#1080#1077#1085#1090#1086#1074#39','
      '--              '#39#39') as SpisDescr'
      ''
      
        '    MED.PKGTDOCS.GET_SPISANIE_DETAIL_DESCR ( TDOCS.FP_VID, TDOCS' +
        '.FP_VIDMOVE, TDOCS.FN_SPISANIEVID, TDOCS.FK_MOGROUPID_TO) as Spi' +
        'sDescr'
      ''
      
        '  FROM MED.TDPC, MED.TKART, MED.TMEDIC, MED.TEI, MED.TDOCS, MED.' +
        'TMO'
      '  WHERE TDOCS.DPID=TDPC.DPID '
      '    AND  TDOCS.DPID=:ADPID '
      '    AND TDPC.KARTID=TKART.KARTID '
      '    AND TMEDIC.EIID=TEI.EIID(+) '
      '    AND TKART.MEDICID=TMEDIC.MEDICID'
      '    AND TDOCS.MOFROMID = TMO.MOID(+)'
      '    AND TKART.FL_DEL=0'
      '--    AND TMEDIC.FL_VISIBLE = 1'
      '  ORDER BY TDOCS.FD_INVOICE')
    Optimize = False
    Variables.Data = {0300000001000000060000003A4144504944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000012000000050000004450434944010000000000070000004D45444943
      494401000000000006000000464E5F4B4F4C010000000000060000004B415254
      49440100000000000600000045494E414D45010000000000080000004E414D45
      4B415254010000000000060000004E4F4D4E554D010000000000090000004E41
      4D454D454449430100000000000600000053554D535452010000000000030000
      004D4F4E0100000000000400000053554D4D010000000000030000004C4F4B01
      0000000000040000004E414348010000000000080000004E414D4546524F4D01
      00000000000600000046435F444F430100000000000400000044415441010000
      00000008000000464E5F50524943450100000000000900000053504953444553
      4352010000000000}
    Cursor = crSQLWait
    Left = 210
    Top = 137
  end
  object odsTSMINI: TOracleDataSet
    SQL.Strings = (
      
        'select sm.fk_id, sm.fc_section, sm.fc_key, sm.fc_value from asu.' +
        'tsmini sm'
      'where'
      ' UPPER(sm.fc_section) = UPPER(:aSection)'
      ' AND UPPER(sm.fc_key) = UPPER(:aKey)')
    Optimize = False
    Variables.Data = {
      0300000002000000090000003A4153454354494F4E0500000000000000000000
      00050000003A414B4559050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = os
    Left = 272
    Top = 90
  end
  object frxRepSpisOnPac_Diagr: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39639.741412939810000000
    ReportOptions.LastChange = 39745.644258587960000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  FN_ALL_SUMM : DOUBLE;'
      
        '  FN_GROUP_SUMM : DOUBLE;                                       ' +
        '             '
      '    '
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  FN_ALL_SUMM := FN_ALL_SUMM     + <frxDBRepSpisOnPac."FN_SUMM">' +
        ';'
      
        '  FN_GROUP_SUMM := FN_GROUP_SUMM + <frxDBRepSpisOnPac."FN_SUMM">' +
        ';      '
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  FN_ALL_SUMM := 0;                                    '
      'end;'
      ''
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  FN_GROUP_SUMM := 0;                   '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxRepSpisOnPacGetValue
    OnUserFunction = frxRepSpisOnPacUserFunction
    Left = 136
    Top = 180
    Datasets = <
      item
        DataSet = frxDBRepSpisOnPac_Diagr
        DataSetName = 'frxDBRepSpisOnPac_Diagr'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 279.400000000000000000
      PaperHeight = 215.900000000000000000
      PaperSize = 1
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 83.000000000000000000
        Top = 18.897650000000000000
        Width = 942.614781999999900000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        Stretched = True
        object mePacFIO: TfrxMemoView
          Top = 53.000000000000000000
          Width = 680.315400000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218': [VAR_FC_PAC_FIO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Width = 941.102970000000000000
          Height = 53.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#8217#1057#8249#1056#1111#1056#1105#1057#1027#1056#1108#1056#176' '#1056#1109' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1056#176#1057#8230', '#1056#183#1056#176#1057#8218#1057#1026#1056#176#1057#8225#1056#181#1056#1029#1056#1029#1057#8249 +
              #1057#8230' '#1056#1029#1056#176' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1056#1109#1056#1030' '
            #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [VAR_FC_DATE1] '#1056#1111#1056#1109' [VAR_FC_DATE2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object memKriteria: TfrxMemoView
          Top = 54.000000000000000000
          Width = 941.102970000000000000
          Height = 21.000000000000000000
          Visible = False
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[VAR_KRITERIA]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Chart1: TfrxChartView
        Top = 105.826840000000000000
        Width = 941.102970000000000000
        Height = 650.079160000000000000
        ShowHint = False
        Chart = {
          5450463006544368617274054368617274044C656674020003546F7002000557
          696474680390010648656967687403FA00144261636B57616C6C2E4272757368
          2E436F6C6F720707636C5768697465144261636B57616C6C2E42727573682E53
          74796C6507076273436C656172144261636B57616C6C2E50656E2E5669736962
          6C65080E4C6567656E642E56697369626C650816426F74746F6D417869732E4C
          6162656C73416E676C65025A0D4672616D652E56697369626C65080656696577
          334408165669657733444F7074696F6E732E526F746174696F6E02000A426576
          656C4F75746572070662764E6F6E6505436F6C6F720707636C5768697465000A
          54426172536572696573075365726965733109486F72697A41786973070E6142
          6F7468486F72697A41786973134D61726B732E4172726F772E56697369626C65
          09194D61726B732E43616C6C6F75742E42727573682E436F6C6F720707636C42
          6C61636B1B4D61726B732E43616C6C6F75742E4172726F772E56697369626C65
          090D4D61726B732E56697369626C65090B536572696573436F6C6F720706636C
          426C75650B56616C7565466F726D61740608232C2323302E23230B4175746F42
          617253697A6509124772616469656E742E446972656374696F6E070B6764546F
          70426F74746F6D105856616C7565732E4461746554696D65090C5856616C7565
          732E4E616D651419000000D094D0B0D182D0B020D181D0BFD0B8D181D0B0D0BD
          D0B8D18F0D5856616C7565732E4F72646572070B6C6F417363656E64696E670C
          5956616C7565732E4E616D65140E000000D0A1D183D0BCD0BCD0B02C20D1800D
          5956616C7565732E4F7264657207066C6F4E6F6E65000000}
        ChartElevation = 345
        SeriesData = <
          item
            DataType = dtDBData
            DataSet = frxDBRepSpisOnPac_Diagr
            DataSetName = 'frxDBRepSpisOnPac_Diagr'
            SortOrder = soAscending
            TopN = 0
            XType = xtDate
            Source2 = 'frxDBRepSpisOnPac_Diagr."FN_SUMM"'
            Source3 = 'frxDBRepSpisOnPac_Diagr."FD_DATE_SPIS"'
            YSource = 'frxDBRepSpisOnPac_Diagr."FN_SUMM"'
          end>
      end
    end
  end
  object pmPrintView: TPopupMenu
    Left = 324
    Top = 32
    object miViewTable: TMenuItem
      Tag = 1
      Caption = #1058#1072#1073#1083#1080#1095#1085#1099#1081' '#1074#1080#1076
      OnClick = miViewTableClick
    end
    object miViewDiagr: TMenuItem
      Tag = 2
      Caption = #1044#1080#1072#1075#1088#1072#1084#1084#1072
      OnClick = miViewTableClick
    end
    object miViewTableWithFIO: TMenuItem
      Caption = #1058#1072#1073#1083#1080#1095#1085#1099#1081' '#1074#1080#1076' '#1089' '#1087#1072#1094#1080#1077#1085#1090#1072#1084#1080
      OnClick = miViewTableClick
    end
  end
  object frxChartObject1: TfrxChartObject
    Left = 86
    Top = 34
  end
  object odsRepSpisOnPac_Diagr: TOracleDataSet
    SQL.Strings = (
      
        'select  a.FD_DATE_SPIS, TO_CHAR(a.FD_DATE_SPIS, '#39'DD.MM.YY'#39') as F' +
        'C_DATE_SPIS, ROUND(a.FN_SUMM,2) as FN_SUMM from'
      '(select'
      
        '  sum(dp.fn_kol*k.fn_price) as FN_SUMM, TRUNC(dp.FD_DATE_SPIS) a' +
        's FD_DATE_SPIS'
      'from'
      '  med.tdocs d, med.tdpc dp, med.tkart k, med.tmedic m'
      'where   '
      ' dp.kartid = k.kartid'
      'and d.dpid = dp.dpid'
      'and k.medicid = m.medicid'
      'and m.medicid = decode(:pmedic,-1, m.medicid, :pmedic)'
      '--%UCHGR  AND m.uchgrid in (%LIST_UCHGR%)'
      'and ((d.fk_mogroupid_FROM = :pMOGROUP)or(:AllGROUPS = 1))'
      
        'and d.fp_vid = 3 and d.fp_vidmove = 8 and d.fn_spisanievid = 3  ' +
        'and d.fl_edit = 0'
      'and ((d.fk_mogroupid_to = :pPacID)or(:AllPac = 1))'
      'and dp.FD_DATE_SPIS is not null'
      
        'and  TRUNC(dp.FD_DATE_SPIS) between TRUNC(:DATE1) and TRUNC(:DAT' +
        'E2)'
      'GROUP BY TRUNC(dp.FD_DATE_SPIS)'
      ') a --%KONTINGENT, asu.tib'
      'where '
      '  1=1'
      
        '--%VIDOPL  AND  (select NVL(MAX(t.fk_id),-1) from asu.tinsurdocs' +
        ' i, asu.tpac_insurance pi, asu.ttypedoc t'
      
        '--%VIDOPL        where a.FK_PacID = pi.fk_pacid and i.fk_id = pi' +
        '.fk_insurdocid'
      
        '--%VIDOPL       and t.fk_id = i.fk_typedocid) in( %LIST_VIDOPL% ' +
        ')'
      '--%KONTINGENT  AND a.FK_PacID = tib.fk_pacid(+)'
      '--%KONTINGENT  and tib.fk_smid in( %LIST_KONTINGENT% )'
      'ORDER BY a.FD_DATE_SPIS')
    Optimize = False
    Variables.Data = {
      0300000007000000060000003A44415445320C00000000000000000000000600
      00003A44415445310C0000000000000000000000070000003A50504143494403
      0000000000000000000000070000003A414C4C50414303000000040000000100
      000000000000090000003A504D4F47524F55500300000000000000000000000A
      0000003A414C4C47524F555053030000000000000000000000070000003A504D
      45444943030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000007000000464E5F53554D4D0100000000000C00000046445F
      444154455F535049530100000000000C00000046435F444154455F5350495301
      0000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 127
    Top = 156
  end
  object frxDBRepSpisOnPac_Diagr: TfrxDBDataset
    UserName = 'frxDBRepSpisOnPac_Diagr'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FD_DATE_SPIS=FD_DATE_SPIS'
      'FC_DATE_SPIS=FC_DATE_SPIS'
      'FN_SUMM=FN_SUMM')
    DataSet = odsRepSpisOnPac_Diagr
    BCDToCurrency = False
    Left = 38
    Top = 136
  end
  object frxRepSpisOnPacWithFIO: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39639.741412939800000000
    ReportOptions.LastChange = 39745.644258588000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  FN_ALL_SUMM : DOUBLE;'
      
        '  FN_GROUP_SUMM : DOUBLE;                                       ' +
        '             '
      '    '
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  FN_ALL_SUMM := FN_ALL_SUMM     + <frxDBRepSpisOnPacWithFIO."FN' +
        '_SUMM">;'
      
        '  FN_GROUP_SUMM := FN_GROUP_SUMM + <frxDBRepSpisOnPacWithFIO."FN' +
        '_SUMM">;      '
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  FN_ALL_SUMM := 0;                                    '
      'end;'
      ''
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  FN_GROUP_SUMM := 0;                   '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxRepSpisOnPacGetValue
    OnUserFunction = frxRepSpisOnPacUserFunction
    Left = 6
    Top = 234
    Datasets = <
      item
        DataSet = frxDBRepSpisOnPacWithFIO
        DataSetName = 'frxDBRepSpisOnPacWithFIO'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object MasterData1: TfrxMasterData
        Height = 20.000000000000000000
        Top = 260.787570000000000000
        Width = 680.315400000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBRepSpisOnPacWithFIO
        DataSetName = 'frxDBRepSpisOnPacWithFIO'
        RowCount = 0
        Stretched = True
        object Memo6: TfrxMemoView
          Width = 41.574803150000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 226.771653540000000000
          Width = 226.771655980000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBRepSpisOnPacWithFIO."FC_MEDIC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 514.031540000000000000
          Width = 64.102350000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBRepSpisOnPacWithFIO."FC_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 578.133890000000000000
          Width = 101.866110000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBRepSpisOnPacWithFIO."FN_SUMM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 453.543307090000000000
          Width = 60.472440940000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBRepSpisOnPacWithFIO."FC_ED_IZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 41.574830000000000000
          Width = 185.196850390000000000
          Height = 20.031496060000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBRepSpisOnPacWithFIO."FC_FIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 83.000000000000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        Stretched = True
        object mePacFIO: TfrxMemoView
          Top = 53.000000000000000000
          Width = 680.315400000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218': [VAR_FC_PAC_FIO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Width = 680.315400000000000000
          Height = 53.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#8217#1057#8249#1056#1111#1056#1105#1057#1027#1056#1108#1056#176' '#1056#1109' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1056#176#1057#8230', '#1056#183#1056#176#1057#8218#1057#1026#1056#176#1057#8225#1056#181#1056#1029#1056#1029#1057#8249 +
              #1057#8230' '#1056#1029#1056#176' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1056#1109#1056#1030' '
            #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [VAR_FC_DATE1] '#1056#1111#1056#1109' [VAR_FC_DATE2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object memKriteria: TfrxMemoView
          Top = 58.000000000000000000
          Width = 680.315400000000000000
          Height = 21.000000000000000000
          Visible = False
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[VAR_KRITERIA]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 32.000000000000000000
        Top = 162.519790000000000000
        Width = 680.315400000000000000
        ReprintOnNewPage = True
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 41.574803150000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'.'#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 226.771653540000000000
          Width = 226.771655980000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 514.015748031496000000
          Width = 64.102350000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 578.133890000000000000
          Width = 101.866110000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 453.543307086614000000
          Width = 60.472440944881890000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 41.574803150000000000
          Width = 185.196850393700800000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 20.000000000000000000
        Top = 343.937230000000000000
        Width = 680.315400000000000000
        object Memo11: TfrxMemoView
          Left = 446.000000000000000000
          Width = 234.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_ALL_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 362.000000000000000000
          Width = 84.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 423.307360000000000000
        Width = 680.315400000000000000
        object Memo12: TfrxMemoView
          Left = 529.133858270000000000
          Width = 151.181102360000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Width = 445.984442360000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADE_SIGN]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 20.000000000000000000
        Top = 219.212740000000000000
        Width = 680.315400000000000000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Condition = 'frxDBRepSpisOnPacWithFIO."FC_GROUP"'
        object Memo13: TfrxMemoView
          Width = 41.574803150000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object mGroupHeader: TfrxMemoView
          Left = 41.574803150000000000
          Width = 638.740157480000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBRepSpisOnPacWithFIO."FC_GROUP"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 20.000000000000000000
        Top = 302.362400000000000000
        Width = 680.315400000000000000
        object Memo16: TfrxMemoView
          Left = 446.000000000000000000
          Width = 234.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_GROUP_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBRepSpisOnPacWithFIO: TfrxDBDataset
    UserName = 'frxDBRepSpisOnPacWithFIO'
    CloseDataSource = False
    DataSet = odsRepSpisOnPacWithFIO
    BCDToCurrency = False
    Left = 6
    Top = 208
  end
  object odsRepSpisOnPacWithFIO: TOracleDataSet
    SQL.Strings = (
      
        'select m.fc_name as FC_MEDIC_NAME, ei.fc_name as FC_ED_IZM, gr.f' +
        'c_uchgr, c.*, ASU.GET_FIO(c.FK_PACID) as FC_FIO, ASU.PKG_REGIST_' +
        'PACFUNC.GET_PAC_IB(c.FK_PACID) as FC_IB, rtrim(TO_CHAR(c.FN_KOL,' +
        ' '#39'FM999G999G990D99'#39'),'#39'.,'#39') as FC_KOL  from'
      
        '(select b.medicid, :group/*FC_GROUP,*/ b.FK_PACID, SUM(b.fn_kol)' +
        ' as FN_KOL, SUM(b.FN_SUMM) as FN_SUMM from'
      '(select a.* from '
      '(select'
      '  dp.fd_date_spis as FD_DATE,'
      
        '  k.medicid, k.kartid, dp.fn_kol, (dp.fn_kol*k.fn_price) as FN_S' +
        'UMM,'
      '  d.fk_mogroupid_to as FK_PacID,'
      '  mg.FC_GROUP'
      ''
      'from'
      
        '  med.tdocs d, med.tdpc dp, med.tkart k, med.tmedic m, MED.TMO_G' +
        'ROUP mg'
      'where   '
      ' dp.kartid = k.kartid'
      'and d.dpid = dp.dpid'
      'and m.medicid = k.medicid'
      'and m.medicid = decode(:pmedic,-1, m.medicid, :pmedic)'
      '--%UCHGR  AND m.uchgrid in (%LIST_UCHGR%)'
      'and d.fk_mogroupid_FROM = mg.GROUPID(+)'
      'and ((d.fk_mogroupid_FROM = :pMOGROUP)or(:AllGROUPS = 1))'
      
        'and d.fp_vid = 3 and d.fp_vidmove = 8 and d.fn_spisanievid = 3  ' +
        'and d.fl_edit = 0'
      
        'and ((d.fk_mogroupid_to = :pPacID)or(:AllPac = 1))) a --%KONTING' +
        'ENT, asu.tib'
      ''
      'where TRUNC(a.FD_DATE) between TRUNC(:DATE1) and TRUNC(:DATE2)'
      
        '--%VIDOPL  AND  (select NVL(MAX(t.fk_id),-1) from asu.tinsurdocs' +
        ' i, asu.tpac_insurance pi, asu.ttypedoc t'
      
        '--%VIDOPL     where a.FK_PacID = pi.fk_pacid and i.fk_id = pi.fk' +
        '_insurdocid'
      
        '--%VIDOPL       and t.fk_id = i.fk_typedocid) in( %LIST_VIDOPL% ' +
        ')'
      '--%KONTINGENT  AND a.FK_PacID = tib.fk_pacid(+)'
      '--%KONTINGENT  and tib.fk_smid in( %LIST_KONTINGENT% )'
      ''
      ') b'
      'group by :group/*FC_GROUP,*/ b.medicid, b.FK_PACID'
      ') c, med.tmedic m, med.tei ei, med.tuchgr gr'
      'where c.medicid = m.medicid'
      '  and m.eiid = ei.eiid(+)'
      '  and m.uchgrid = gr.uchgrid(+)'
      
        'ORDER BY :group/*FC_GROUP,*/ FC_FIO, :uchgr/*fc_uchgr,*/ m.FC_NA' +
        'ME')
    Optimize = False
    Variables.Data = {
      0300000009000000060000003A44415445320C00000000000000000000000600
      00003A44415445310C0000000000000000000000070000003A50504143494403
      0000000000000000000000070000003A414C4C50414303000000040000000100
      000000000000090000003A504D4F47524F55500300000000000000000000000A
      0000003A414C4C47524F555053030000000000000000000000060000003A4752
      4F5550010000000000000000000000060000003A554348475201000000000000
      0000000000070000003A504D45444943030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000006000000464E5F4B4F4C01000000000007000000464E5F53
      554D4D0100000000000D00000046435F4D454449435F4E414D45010000000000
      0900000046435F45445F495A4D010000000000070000004D4544494349440100
      000000000600000046435F4B4F4C0100000000000800000046435F47524F5550
      0100000000000A00000046435F47524F55505F31010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 129
    Top = 116
  end
  object odsUchGr: TOracleDataSet
    SQL.Strings = (
      
        'select uchgrid as FK_ID, fc_uchgr as FC_NAME from med.tuchgr ord' +
        'er by FC_NAME')
    Optimize = False
    Session = os
    Left = 218
    Top = 376
  end
  object odsPacInfo: TOracleDataSet
    SQL.Strings = (
      'select k.fk_id as fk_pacid,'
      
        '       TRIM(k.FC_FAM || '#39' '#39' || NVL2(k.FC_IM, SUBSTR (k.FC_IM, 0,' +
        ' 1) || '#39'. '#39' || NVL2(k.FC_OTCH, SUBSTR (k.FC_OTCH, 0, 1) || '#39'. '#39',' +
        ' '#39#39'), '#39#39'))  as FC_PAC_FIO,'
      '       k.fk_ibid||'#39'/'#39'||k.fk_iby as FC_IB,'
      '       asu.PKG_REGIST_PACFUNC.GET_PAC_BITH(k.fk_id) FD_BITH,'
      '       asu.PKG_REGIST_PACFUNC.GET_PAC_INCOME(k.fk_id) fd_in,'
      '       asu.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(k.fk_id) fd_out,'
      '       asu.get_packdn(k.fk_id) fn_kdn,'
      
        '       asu.get_packdn(k.fk_id, asu.pkg_regist_pacfunc.GET_PAC_OU' +
        'TCOME(k.fk_id), 0, 0, (select max(fk_id) from asu.ttiproom where' +
        ' fc_synonim = '#39'FC_REANIM'#39')) fn_kdn_reanim,'
      '       t.fn_oper_hour,'
      '       t.fn_oper_min,'
      
        '       (SELECT initcap(asu.do_vrachfio(MAX(s.fk_id))) FROM login' +
        '.tsotr s, asu.ts_sprav sp'
      
        '         WHERE s.fk_otdelid = asu.pkg_regist_pacfunc.GET_PAC_OTD' +
        'ELID(k.fk_id)'
      '           AND s.fk_spravid = sp.fk_id'
      '           AND s.fl_del = 0'
      
        '           AND sp.fc_name = '#39#1057#1090#1072#1088#1096#1072#1103' '#1084#1077#1076#1080#1094#1080#1085#1089#1082#1072#1103' '#1089#1077#1089#1090#1088#1072#39') fc_st_' +
        'ms,'
      
        '       (SELECT initcap(asu.do_vrachfio(max(s.fk_id))) FROM login' +
        '.tsotr s'
      
        '         WHERE s.fk_otdelid = asu.pkg_regist_pacfunc.GET_PAC_OTD' +
        'ELID(k.fk_id)'
      '           AND s.fl_zav_otd = 1'
      '           AND s.fl_del = 0) fc_zav_otd'
      '  from asu.tkarta k,'
      
        '       (SELECT EXTRACT (HOUR FROM (TRUNC(SYSDATE)+SUM(TEND.FD_DA' +
        'TE - TBEGIN.FD_DATE) - TRUNC(SYSDATE)) DAY TO SECOND) fn_oper_ho' +
        'ur,'
      
        '               EXTRACT (MINUTE FROM (TRUNC(SYSDATE)+SUM(TEND.FD_' +
        'DATE - TBEGIN.FD_DATE) - TRUNC(SYSDATE)) DAY TO SECOND) fn_oper_' +
        'min'
      '          FROM ASU.VNAZ, ASU.TIB TBEGIN, ASU.TIB TEND'
      '         WHERE TBEGIN.FK_SMEDITID = ASU.GET_PROTHOPER_START'
      '           AND TEND.FK_SMEDITID = ASU.GET_PROTHOPER_OKON'
      '           AND VNAZ.FK_ID = TEND.FK_PACID'
      '           AND VNAZ.FK_ID = TBEGIN.FK_PACID'
      '           AND VNAZ.FK_ID IN'
      '               (SELECT V.FK_ID'
      '                  FROM ASU.TIB I, ASU.VNAZ V'
      '                 WHERE I.FK_SMID IN (SELECT FK_ID'
      '                                       FROM ASU.TSMID'
      '                                      START WITH FK_ID IN'
      
        '                                                 STAT.PKG_STATUT' +
        'IL.GET_SMIDID('#39'PROC_OPER_NAZ_OPER'#39')'
      
        '                                     CONNECT BY PRIOR FK_ID = FK' +
        '_OWNER)'
      '                   AND I.FK_PACID = V.FK_ID'
      '                   AND V.FK_PACID = :ppacid'
      '                   AND V.FK_NAZSOSID = ASU.GET_VIPNAZ)) t'
      ' where k.fk_id = :ppacid')
    Optimize = False
    Variables.Data = {0300000001000000070000003A505041434944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000008000000464B5F50414349440100000000000A0000004643
      5F5041435F46494F010000000000}
    Cursor = crSQLWait
    Session = os
    Left = 198
    Top = 265
  end
  object odsMedic: TOracleDataSet
    SQL.Strings = (
      'SELECT M.MEDICID,'
      
        '  M.FC_NAME || RPAD('#39' '#39',ROW_NUMBER() OVER(PARTITION BY M.fc_name' +
        ' ORDER BY M.fc_name),'#39' '#39') AS FC_MEDIC,'
      '  E.FC_NAME AS FC_EDIZM'
      '--  ,MT.FC_NAME AS FC_MEDICTYPE'
      'FROM MED.TMEDIC M, MED.TEI E--, MED.TMEDICTYPE MT --, TPAYTYPE P'
      'WHERE M.EIID = E.EIID(+)'
      '--  AND M.FK_TYPE = MT.FK_ID(+)'
      '  AND M.FL_VISIBLE = 1'
      ''
      'ORDER BY LOWER(M.FC_NAME)'
      '')
    Optimize = False
    Session = os
    Left = 282
    Top = 416
  end
  object dsMedic: TDataSource
    DataSet = odsMedic
    Left = 332
    Top = 418
  end
  object oqBuhTsmini: TOracleQuery
    SQL.Strings = (
      'begin'
      '  :pVal := buh.PKG_SMINI.READSTRING ( :pSec, :pIdent, :pDef );'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000004000000050000003A5056414C050000000000000000000000050000
      003A50534543050000000000000000000000070000003A504944454E54050000
      000000000000000000050000003A50444546050000000000000000000000}
    Left = 328
  end
  object oqNextDocNumber: TOracleQuery
    SQL.Strings = (
      'declare'
      '   x   integer;'
      '   vDate date;'
      'begin  '
      '  vDate := sysdate;'
      '  x := 0;'
      '  '
      '  select  count(1) '
      '    into x  '
      '    from all_sequences  '
      '   where sequence_name = '#39'SEQ_M3_11_'#39'||year(vDate) ;'
      '   '
      '  if x < 1 then'
      
        '    execute immediate '#39' create sequence SEQ_M3_11_'#39'||year(vDate)' +
        ';'
      '  end if;'
      '  '
      
        '  execute immediate '#39'select lpad(SEQ_M3_11_'#39'||year(vDate)||'#39'.NEX' +
        'TVAL,6,0) x from dual'#39' into :pNetxNumber;'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A504E4554584E554D4245520500000000000000
      00000000}
    Left = 288
  end
  object odsFinSource: TOracleDataSet
    SQL.Strings = (
      'select f.FK_ID, f.FC_NAME'
      '  from med.tfinsource f'
      ' order by upper(f.FC_NAME)')
    Optimize = False
    Session = os
    Left = 128
    Top = 456
  end
end
