object frmEditDiag: TfrmEditDiag
  Left = 245
  Top = 59
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082' '#1076#1080#1072#1075#1085#1086#1079#1072
  ClientHeight = 243
  ClientWidth = 862
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
  object vGrFilters: TcxVerticalGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 856
    Height = 191
    BorderStyle = cxcbsNone
    Align = alTop
    LookAndFeel.Kind = lfFlat
    OptionsView.RowHeaderWidth = 217
    TabOrder = 0
    object catProp: TcxCategoryRow
      Options.Focusing = False
      Options.TabStop = False
      Properties.Caption = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080' '#1076#1080#1072#1075#1085#1086#1079#1072
    end
    object rowShowIB: TcxEditorRow
      Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074' '#1052#1050
      Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.NullStyle = nssUnchecked
      Properties.EditProperties.ValueChecked = '1'
      Properties.EditProperties.ValueUnchecked = '0'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
    end
    object rowVyavlen: TcxEditorRow
      Properties.Caption = #1042#1099#1103#1074#1083#1077#1085
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
      Properties.EditProperties.ListSource = dsVyavlen
      Properties.EditProperties.PostPopupValueOnTab = True
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = Null
    end
    object rowName: TcxEditorRow
      Properties.Caption = #1058#1077#1082#1089#1090' '#1076#1080#1072#1075#1085#1086#1079#1072
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.EditProperties.ScrollBars = ssVertical
      Properties.EditProperties.VisibleLineCount = 10
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 197
    Width = 856
    Height = 43
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 384
    ExplicitTop = 200
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bSave: TcxButton
      Left = 694
      Top = 8
      Width = 75
      Height = 25
      Action = aSave
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 772
      Top = 8
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 336
    Top = 96
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080' '#1076#1080#1072#1075#1085#1086#1079#1072
      ShortCut = 113
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object odsVyavlen: TOracleDataSet
    SQL.Strings = (
      'SELECT 0 AS FK_ID, '#39' '#39' AS FC_NAME, 0 AS FN_ORDER'
      '  FROM DUAL'
      ''
      'UNION ALL '
      ''
      'SELECT FK_ID, FC_NAME, FN_ORDER'
      '  FROM ASU.TSMID'
      
        'WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM =' +
        ' '#39'PRIZNAK_DIAGS'#39')'
      '  AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 512
    Top = 88
  end
  object dsVyavlen: TDataSource
    DataSet = odsVyavlen
    Left = 456
    Top = 88
  end
end
