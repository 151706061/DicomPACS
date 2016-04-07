object frmMOGroup: TfrmMOGroup
  Left = 388
  Top = 380
  Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1100#1085#1086' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1077' '#1075#1088#1091#1087#1087#1099' '#1083#1080#1094
  ClientHeight = 529
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 491
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 38
        Width = 485
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 478
      Height = 44
      AutoSize = True
      ButtonHeight = 44
      ButtonWidth = 64
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object btnSelect: TToolButton
        Left = 0
        Top = 0
        Action = aSelect
      end
      object ToolButton3: TToolButton
        Left = 64
        Top = 0
        Action = acAdd
        DropdownMenu = pmAdd
        PopupMenu = pmAdd
        Style = tbsDropDown
      end
      object ToolButton2: TToolButton
        Left = 143
        Top = 0
        Action = acEdit
      end
      object ToolButton4: TToolButton
        Left = 207
        Top = 0
        Action = acDel
      end
      object ToolButton7: TToolButton
        Left = 271
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 279
        Top = 0
        Action = acRefresh
      end
      object btnClose: TToolButton
        Left = 343
        Top = 0
        Action = acClose
      end
    end
  end
  object tlMOGroup: TcxDBTreeList
    Left = 0
    Top = 42
    Width = 491
    Height = 487
    Align = alClient
    Bands = <
      item
      end>
    BufferedPaint = True
    DataController.DataSource = dsMO
    DataController.ParentField = 'FK_PARENTID'
    DataController.KeyField = 'GROUPID'
    DragMode = dmAutomatic
    LookAndFeel.Kind = lfFlat
    OptionsBehavior.GoToNextCellOnTab = True
    OptionsBehavior.ImmediateEditor = False
    OptionsBehavior.AutoDragCopy = True
    OptionsBehavior.DragCollapse = False
    OptionsBehavior.ExpandOnIncSearch = True
    OptionsBehavior.ShowHourGlass = False
    OptionsBehavior.IncSearch = True
    OptionsCustomizing.BandCustomizing = False
    OptionsCustomizing.BandVertSizing = False
    OptionsCustomizing.ColumnVertSizing = False
    OptionsData.Editing = False
    OptionsData.CaseInsensitive = True
    OptionsData.Deleting = False
    OptionsSelection.HideFocusRect = False
    OptionsView.CellTextMaxLineCount = -1
    OptionsView.ShowEditButtons = ecsbFocused
    OptionsView.ColumnAutoWidth = True
    OptionsView.Footer = True
    OptionsView.Indicator = True
    ParentColor = False
    PopupMenu = pmTreeList
    Preview.AutoHeight = False
    RootValue = Null
    Styles.Selection = dmMain.cxStyleGridSelectedRow
    Styles.ContentEven = dmMain.cxStyleGridEvenRow
    Styles.ContentOdd = dmMain.cxStyleGridOddRow
    TabOrder = 1
    OnCustomDrawCell = tlMOGroupCustomDrawCell
    OnDblClick = tlMOGroupDblClick
    OnDragOver = tlMOGroupDragOver
    object cxDBTreeList1cxDBTreeListGROUPID: TcxDBTreeListColumn
      Visible = False
      Caption.Text = #1050#1086#1076' '#1075#1088#1091#1087#1087#1099
      DataBinding.FieldName = 'GROUPID'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1cxDBTreeListFC_GROUP: TcxDBTreeListColumn
      Caption.Text = #1043#1088#1091#1087#1087#1072
      DataBinding.FieldName = 'FC_GROUP'
      Options.Footer = True
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      SummaryFooter.Format = #1050#1086#1083'-'#1074#1086' '#1089#1090#1088#1086#1082': 0'
      SummaryFooter.Kind = skCount
      SummaryFooter.FieldName = 'FC_GROUP'
    end
    object cxDBTreeList1cxDBTreeListFK_SKLAD_ID: TcxDBTreeListColumn
      PropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListSource = dmMain.dsSklad
      Properties.ReadOnly = True
      Caption.Text = #1057#1082#1083#1072#1076
      DataBinding.FieldName = 'FK_SKLAD_ID'
      Options.ShowEditButtons = eisbNever
      Width = 50
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1cxDBTreeListFC_QUOTA_CODE_1: TcxDBTreeListColumn
      Caption.Text = #1050#1086#1076' '#1082#1074#1086#1090#1099' (1-'#1072#1103' '#1087#1072#1088#1072' '#1094#1080#1092#1088')'
      DataBinding.FieldName = 'FC_QUOTA_CODE_1'
      Width = 50
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1cxDBTreeListFL_POST: TcxDBTreeListColumn
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = '0'
      Caption.Text = #1055#1086#1089#1090
      DataBinding.FieldName = 'FL_POST'
      Width = 20
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object tlMOGroupcxDBTreeListFL_DEL: TcxDBTreeListColumn
      Visible = False
      DataBinding.FieldName = 'FL_DEL'
      Position.ColIndex = 5
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object tlMOGroupcxDBTreeListFK_PARENTID: TcxDBTreeListColumn
      Visible = False
      DataBinding.FieldName = 'FK_PARENTID'
      Position.ColIndex = 6
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    OnUpdate = alUpdate
    Left = 16
    Top = 168
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      ImageIndex = 1
      ShortCut = 16499
      OnExecute = acCloseExecute
    end
    object acDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 22
      ShortCut = 119
      OnExecute = acDelExecute
    end
    object acEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 3
      ShortCut = 114
      OnExecute = acEditExecute
    end
    object acAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 21
      ShortCut = 115
      OnExecute = acAddExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 15
      ShortCut = 116
      OnExecute = acRefreshExecute
    end
    object aSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 30
      ShortCut = 113
      OnExecute = aSelectExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 8
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object acAddChild: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1095#1077#1088#1085#1102#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 21
      OnExecute = acAddExecute
    end
  end
  object dsMO: TDataSource
    DataSet = odsMO
    Left = 16
    Top = 120
  end
  object odsMO: TOracleDataSet
    SQL.Strings = (
      'select g.ROWID, g.* '
      '  from MED.tmo_group g'
      '  left join ( select t.GROUPID'
      '               from med.TMO_GROUP t'
      '            connect by prior t.GROUPID = t.FK_PARENTID'
      '              start with t.GROUPID = :pExcludeID ) e'
      '   on g.GROUPID = e.GROUPID'
      'where ( g.fl_del=0 or ( :pShowDeleted = 1 ) )'
      '  and e.GROUPID is null'
      'order by UPPER(g.fc_group)')
    Optimize = False
    Variables.Data = {
      03000000020000000D0000003A5053484F5744454C4554454403000000040000
      0001000000000000000B0000003A504558434C55444549440300000004000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C0100000000000800000046
      4B5F504841524D0100000000000B000000464B5F534B4C41445F494401000000
      0000}
    RefreshOptions = [roAllFields]
    Session = dmMain.os
    Left = 16
    Top = 72
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = '%FORM_NAME%\'
    StoredValues = <>
    Left = 88
    Top = 72
  end
  object pmAdd: TPopupMenu
    Left = 312
    Top = 104
    object N1: TMenuItem
      Action = acAdd
    end
    object N2: TMenuItem
      Action = acAddChild
    end
  end
  object pmTreeList: TPopupMenu
    Left = 368
    Top = 112
    object miAdd: TMenuItem
      Action = acAdd
    end
    object miAddChild: TMenuItem
      Action = acAddChild
    end
    object miEdit: TMenuItem
      Action = acEdit
    end
    object miDelete: TMenuItem
      Action = acDel
    end
  end
end
