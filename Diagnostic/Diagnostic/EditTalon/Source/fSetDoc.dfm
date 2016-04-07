object frmSetDoc: TfrmSetDoc
  Left = 326
  Top = 69
  BorderStyle = bsDialog
  Caption = #1044#1086#1082#1091#1084#1077#1085#1090', '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1080#1081' '#1083#1080#1095#1085#1086#1089#1090#1100
  ClientHeight = 145
  ClientWidth = 537
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
  object cxVerticalGrid1: TcxVerticalGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 531
    Height = 94
    Align = alTop
    TabOrder = 0
    object catDoc: TcxCategoryRow
      Properties.Caption = #1044#1072#1085#1085#1099#1077
    end
    object rowTypeDoc: TcxEditorRow
      Properties.Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsFixedList
      Properties.EditProperties.DropDownSizeable = True
      Properties.EditProperties.GridMode = True
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.KeyFieldNames = 'FK_ID'
      Properties.EditProperties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.EditProperties.ListOptions.ShowHeader = False
      Properties.EditProperties.ListSource = dsType
      Properties.EditProperties.PostPopupValueOnTab = True
      Properties.DataBinding.ValueType = 'Integer'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = 0
    end
    object rowSer: TcxEditorRow
      Properties.Caption = #1057#1077#1088#1080#1103
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.EditProperties.MaxLength = 10
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = ''
    end
    object rowNum: TcxEditorRow
      Properties.Caption = #1053#1086#1084#1077#1088
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.EditProperties.MaxLength = 10
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = ''
    end
    object rowKem: TcxEditorRow
      Properties.Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.EditProperties.MaxLength = 100
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = ''
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 100
    Width = 531
    Height = 42
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 64
    ExplicitTop = 112
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bOk: TcxButton
      Left = 366
      Top = 9
      Width = 75
      Height = 25
      Action = aOk
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 448
      Top = 9
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 272
    Top = 24
    object aOk: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object dsType: TDataSource
    DataSet = odsType
    Left = 152
    Top = 40
  end
  object odsType: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name, fl_default from asu.tviddoc')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A000000464C5F44454641554C54010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 200
    Top = 40
  end
end
