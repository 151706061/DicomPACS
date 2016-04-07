object frmSrokyColorOption: TfrmSrokyColorOption
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1055#1086#1076#1089#1074#1077#1090#1082#1072' '#1087#1072#1088#1090#1080#1081' '#1074' '#1079#1072#1074#1080#1089#1080#1084#1086#1089#1090#1080' '#1086#1090' '#1089#1088#1086#1082#1072' '#1075#1086#1076#1085#1086#1089#1090#1080
  ClientHeight = 119
  ClientWidth = 323
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbColorDecode: TcxGroupBox
    Left = 2
    Top = 0
    Caption = #1057#1088#1086#1082#1080
    TabOrder = 0
    Height = 81
    Width = 319
    object imRed: TcxImage
      Left = 8
      Top = 15
      Hint = 
        #1055#1072#1088#1090#1080#1080' '#1089#1086' '#1089#1088#1086#1082#1086#1084' '#1075#1086#1076#1085#1086#1089#1090#1080', '#1080#1089#1090#1077#1082#1072#1102#1097#1080#1084' '#1095#1077#1088#1077#1079' 1 '#1076#1077#1085#1100' '#1083#1080#1073#1086' '#1091#1078#1077' '#1080#1089#1090#1105 +
        #1082#1096#1080#1084
      TabStop = False
      Style.Color = 11184895
      TabOrder = 0
      OnClick = imRedClick
      Height = 15
      Width = 15
    end
    object imYellow: TcxImage
      Left = 8
      Top = 36
      Hint = #1055#1072#1088#1090#1080#1080' '#1089#1086' '#1089#1088#1086#1082#1086#1084' '#1075#1086#1076#1085#1086#1089#1090#1080', '#1080#1089#1090#1077#1082#1072#1102#1097#1080#1084' '#1074' '#1090#1077#1095#1077#1085#1080#1077' 1 '#1085#1077#1076#1077#1083#1080
      TabStop = False
      Style.Color = 11206655
      TabOrder = 1
      OnClick = imRedClick
      Height = 15
      Width = 15
    end
    object imGreen: TcxImage
      Left = 8
      Top = 57
      Hint = #1055#1072#1088#1090#1080#1080' '#1089#1086' '#1089#1088#1086#1082#1086#1084' '#1075#1086#1076#1085#1086#1089#1090#1080', '#1080#1089#1090#1077#1082#1072#1102#1097#1080#1084' '#1074' '#1090#1077#1095#1077#1085#1080#1077' 1 '#1084#1077#1089#1103#1094#1072
      TabStop = False
      Style.Color = 11206570
      TabOrder = 2
      OnClick = imRedClick
      Height = 15
      Width = 15
    end
    object cxLabel1: TcxLabel
      Left = 29
      Top = 13
      Caption = '- '#1076#1086
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 29
      Top = 34
      Caption = '- '#1076#1086
      Transparent = True
    end
    object cxLabel3: TcxLabel
      Left = 29
      Top = 55
      Caption = '- '#1076#1086
      Transparent = True
    end
    object sedRed: TcxSpinEdit
      Left = 57
      Top = 12
      Properties.ImmediatePost = True
      Properties.MinValue = 1.000000000000000000
      Properties.OnChange = sedRedPropertiesChange
      TabOrder = 6
      Value = 1
      Width = 46
    end
    object sedYellow: TcxSpinEdit
      Left = 57
      Top = 33
      Properties.ImmediatePost = True
      Properties.MinValue = 2.000000000000000000
      Properties.OnChange = sedYellowPropertiesChange
      TabOrder = 7
      Value = 7
      Width = 46
    end
    object sedGreen: TcxSpinEdit
      Left = 57
      Top = 54
      Properties.ImmediatePost = True
      Properties.MinValue = 8.000000000000000000
      Properties.OnChange = sedGreenPropertiesChange
      TabOrder = 8
      Value = 31
      Width = 46
    end
    object cxLabel4: TcxLabel
      Left = 105
      Top = 13
      Caption = #1076#1085#1077#1081
      Transparent = True
    end
    object cxLabel5: TcxLabel
      Left = 105
      Top = 34
      Caption = #1076#1085#1077#1081
      Transparent = True
    end
    object cxLabel6: TcxLabel
      Left = 105
      Top = 55
      Caption = #1076#1085#1077#1081
      Transparent = True
    end
    object lcbRed: TcxLookupComboBox
      Left = 167
      Top = 12
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FN_DAY'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsPeriods
      Properties.OnChange = lcbRedPropertiesChange
      Properties.OnCloseUp = lcbRedPropertiesChange
      EditValue = '1'
      TabOrder = 12
      Width = 145
    end
    object lcbYellow: TcxLookupComboBox
      Left = 167
      Top = 33
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FN_DAY'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsPeriods
      Properties.OnChange = lcbYellowPropertiesChange
      Properties.OnCloseUp = lcbYellowPropertiesChange
      EditValue = '7'
      TabOrder = 13
      Width = 145
    end
    object lcbGreen: TcxLookupComboBox
      Left = 167
      Top = 54
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FN_DAY'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsPeriods
      Properties.OnChange = lcbGreenPropertiesChange
      Properties.OnCloseUp = lcbGreenPropertiesChange
      EditValue = '31'
      TabOrder = 14
      Width = 145
    end
  end
  object btnCancel: TcxButton
    Left = 239
    Top = 87
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object btnOk: TcxButton
    Left = 158
    Top = 87
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 2
    OnClick = btnOkClick
  end
  object odsPeriods: TOracleDataSet
    SQL.Strings = (
      'select 1 FN_DAY, '#39'1 '#1076#1077#1085#1100#39' FC_NAME from dual'
      'UNION ALL'
      'select 3 FN_DAY, '#39'3 '#1076#1085#1103#39' FC_NAME from dual'
      'UNION ALL'
      'select 7 FN_DAY, '#39'1 '#1085#1077#1076#1077#1083#1103#39' FC_NAME from dual'
      'UNION ALL'
      'select 14 FN_DAY, '#39'2 '#1085#1077#1076#1077#1083#1080#39' FC_NAME from dual'
      'UNION ALL'
      'select 21 FN_DAY, '#39'3 '#1085#1077#1076#1077#1083#1080#39' FC_NAME from dual'
      'UNION ALL'
      'select 28 FN_DAY, '#39'4 '#1085#1077#1076#1077#1083#1080#39' FC_NAME from dual'
      'UNION ALL'
      'select 31 FN_DAY, '#39'1 '#1084#1077#1089#1103#1094#39' FC_NAME from dual'
      'UNION ALL'
      'select 61 FN_DAY, '#39'2 '#1084#1077#1089#1103#1094#1072#39' FC_NAME from dual'
      'UNION ALL'
      'select 92 FN_DAY, '#39'3 '#1084#1077#1089#1103#1094#1072#39' FC_NAME from dual'
      'UNION ALL'
      'select 183 FN_DAY, '#39#1087#1086#1083#1075#1086#1076#1072#39' FC_NAME from dual'
      'UNION ALL'
      'select 365 FN_DAY, '#39'1 '#1075#1086#1076#39' FC_NAME from dual')
    Optimize = False
    Session = dmMain.os
    Left = 40
    Top = 80
  end
  object dsPeriods: TDataSource
    DataSet = odsPeriods
    Left = 88
    Top = 80
  end
  object cd: TColorDialog
    Left = 128
    Top = 88
  end
end
