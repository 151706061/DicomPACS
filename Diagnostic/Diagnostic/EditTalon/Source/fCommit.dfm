object frmCommit: TfrmCommit
  Left = 343
  Top = 99
  BorderStyle = bsDialog
  Caption = #1055#1086#1076#1087#1080#1089#1100' '#1072#1084#1073#1091#1083#1072#1090#1086#1088#1085#1086#1075#1086' '#1090#1072#1083#1086#1085#1072
  ClientHeight = 145
  ClientWidth = 501
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
    Width = 495
    Height = 94
    Align = alTop
    LookAndFeel.Kind = lfUltraFlat
    OptionsView.RowHeaderWidth = 201
    TabOrder = 0
    object catCommit: TcxCategoryRow
      Options.CanResized = False
      Options.Focusing = False
      Options.TabStop = False
      Properties.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1090#1072#1083#1086#1085#1072
    end
    object rowSotr: TcxEditorRow
      Options.CanResized = False
      Options.Focusing = False
      Options.Moving = False
      Options.TabStop = False
      Properties.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082', '#1087#1086#1076#1087#1080#1089#1072#1074#1096#1080#1081' '#1090#1072#1083#1086#1085
      Properties.EditPropertiesClassName = 'TcxLabelProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
    end
    object rowDateRun: TcxEditorRow
      Properties.Caption = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1080
      Properties.EditPropertiesClassName = 'TcxDateEditProperties'
      Properties.EditProperties.DateButtons = [btnToday]
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.PostPopupValueOnTab = True
      Properties.EditProperties.SaveTime = False
      Properties.EditProperties.ShowTime = False
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = Null
    end
    object rowResult: TcxEditorRow
      Properties.Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1086#1073#1088#1072#1097#1077#1085#1080#1103'*'
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
      Properties.EditProperties.ListSource = dsRes
      Properties.EditProperties.PostPopupValueOnTab = True
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = Null
    end
    object rowDop: TcxEditorRow
      Properties.Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1080#1089#1093#1086#1076'*'
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
      Properties.EditProperties.ListSource = dsDop
      Properties.EditProperties.PostPopupValueOnTab = True
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = Null
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 100
    Width = 495
    Height = 42
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bOk: TcxButton
      Left = 334
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
      Left = 412
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
    Left = 264
    Top = 32
    object aOk: TAction
      Caption = #1055#1086#1076#1087#1080#1089#1072#1090#1100
      Hint = #1055#1086#1076#1087#1080#1089#1072#1090#1100' '#1072#1084#1073#1091#1083#1072#1090#1086#1088#1085#1099#1081' '#1090#1072#1083#1086#1085
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
  object dsRes: TDataSource
    DataSet = odsRes
    Left = 320
    Top = 8
  end
  object dsDop: TDataSource
    DataSet = odsDop
    Left = 320
    Top = 56
  end
  object odsRes: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name, fk_default'
      '  from asu.tsmid'
      
        ' where fk_owner = (select fk_id from asu.tsmid where fc_synonim ' +
        '= '#39'AMBTALON_RESULT'#39')'
      '   and fl_del = 0'
      'order by fn_order ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 360
    Top = 8
  end
  object odsDop: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name, fk_default'
      '  from asu.tsmid'
      
        ' where fk_owner = (select fk_id from asu.tsmid where fc_synonim ' +
        '= '#39'DOP_ISHOD_PARENT'#39')'
      '   and fl_del = 0'
      'order by fn_order ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 360
    Top = 56
  end
end
