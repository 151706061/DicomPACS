object frmParamDate: TfrmParamDate
  Left = 439
  Top = 130
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1087#1077#1088#1080#1086#1076#1072
  ClientHeight = 238
  ClientWidth = 348
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grpList: TGroupBox
    Left = 8
    Top = 8
    Width = 161
    Height = 189
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1080#1079' '#1089#1087#1080#1089#1082#1072
    TabOrder = 0
    object lblMonth: TLabel
      Left = 8
      Top = 22
      Width = 33
      Height = 13
      Caption = #1052#1077#1089#1103#1094
    end
    object lblQuarter: TLabel
      Left = 8
      Top = 62
      Width = 42
      Height = 13
      Caption = #1050#1074#1072#1088#1090#1072#1083
    end
    object lblHalfYear: TLabel
      Left = 8
      Top = 102
      Width = 54
      Height = 13
      Caption = #1055#1086#1083#1091#1075#1086#1076#1080#1077
    end
    object lblYear: TLabel
      Left = 8
      Top = 142
      Width = 18
      Height = 13
      Caption = #1043#1086#1076
    end
    object cmbMonth: TComboBox
      Left = 8
      Top = 37
      Width = 145
      Height = 21
      Style = csDropDownList
      DropDownCount = 12
      ItemHeight = 13
      TabOrder = 0
      OnChange = ListChange
      Items.Strings = (
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1088#1077#1083#1100
        #1052#1072#1081
        #1048#1102#1085#1100
        #1048#1102#1083#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
    end
    object cmbQuarter: TComboBox
      Left = 8
      Top = 77
      Width = 145
      Height = 21
      Style = csDropDownList
      DropDownCount = 4
      ItemHeight = 13
      TabOrder = 1
      OnChange = ListChange
      Items.Strings = (
        #1055#1077#1088#1074#1099#1081
        #1042#1090#1086#1088#1086#1081
        #1058#1088#1077#1090#1080#1081
        #1063#1077#1090#1074#1077#1088#1090#1099#1081)
    end
    object cmbHalfYear: TComboBox
      Left = 8
      Top = 117
      Width = 145
      Height = 21
      Style = csDropDownList
      DropDownCount = 2
      ItemHeight = 13
      TabOrder = 2
      OnChange = ListChange
      Items.Strings = (
        #1055#1077#1088#1074#1086#1077
        #1042#1090#1086#1088#1086#1077)
    end
    object cmbYear: TComboBox
      Left = 64
      Top = 157
      Width = 89
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      OnChange = ListChange
    end
    object rdbFullYear: TRadioButton
      Left = 8
      Top = 160
      Width = 49
      Height = 17
      Caption = #1042#1077#1089#1100
      TabOrder = 4
      OnClick = rdbFullYearClick
    end
  end
  object grpManual: TGroupBox
    Left = 176
    Top = 8
    Width = 161
    Height = 188
    Caption = #1048#1083#1080' '#1091#1082#1072#1078#1080#1090#1077' '#1074#1088#1091#1095#1085#1091#1102
    TabOrder = 1
    object lblFirst: TLabel
      Left = 8
      Top = 22
      Width = 52
      Height = 13
      Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089
    end
    object lblLast: TLabel
      Left = 8
      Top = 62
      Width = 14
      Height = 13
      Caption = #1055#1086
    end
    object dtFirst: TDateTimePicker
      Left = 8
      Top = 37
      Width = 145
      Height = 21
      Date = 39058.000000000000000000
      Time = 39058.000000000000000000
      TabOrder = 0
      OnChange = ManualChange
    end
    object dtLast: TDateTimePicker
      Left = 8
      Top = 77
      Width = 145
      Height = 21
      Date = 39058.999988425930000000
      Time = 39058.999988425930000000
      TabOrder = 1
      OnChange = ManualChange
    end
  end
  object bOk: TcxButton
    Left = 198
    Top = 203
    Width = 66
    Height = 25
    Action = acSelect
    TabOrder = 2
    LookAndFeel.SkinName = 'Black'
  end
  object bCancel: TcxButton
    Left = 270
    Top = 203
    Width = 67
    Height = 25
    Action = acCancel
    TabOrder = 3
    LookAndFeel.SkinName = 'Black'
  end
  object cxSpec: TcxCheckBox
    Left = 8
    Top = 203
    Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1099#1077' '#1076#1072#1090#1099
    Properties.DisplayChecked = '-1'
    Properties.DisplayUnchecked = '0'
    Properties.DisplayGrayed = 'null'
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = -1
    Properties.ValueGrayed = False
    Properties.ValueUnchecked = 0
    TabOrder = 4
    Width = 137
  end
  object ActionList: TActionList
    Left = 132
    Top = 4
    object acSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      OnExecute = acSelectExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      OnExecute = acCancelExecute
    end
  end
end
