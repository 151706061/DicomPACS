object fmBrakSelect: TfmBrakSelect
  Left = 489
  Top = 413
  BorderStyle = bsSizeToolWin
  ClientHeight = 238
  ClientWidth = 685
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 685
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 40
        Width = 685
      end>
    EdgeBorders = [ebTop]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 676
      Height = 40
      Align = alClient
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 56
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object tbuSelect: TToolButton
        Left = 0
        Top = 0
        Action = acSelect
      end
      object ToolButton6: TToolButton
        Left = 56
        Top = 0
        Action = acRefresh
      end
      object ToolButton11: TToolButton
        Left = 112
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 2
        Style = tbsSeparator
        Visible = False
      end
      object tbuFilter: TToolButton
        Left = 120
        Top = 0
        Action = acFilter
        Down = True
        Style = tbsCheck
      end
      object ToolButton5: TToolButton
        Left = 176
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 2
        Style = tbsSeparator
        Visible = False
      end
      object ToolButton3: TToolButton
        Left = 184
        Top = 0
        Action = acClose
      end
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 42
    Width = 685
    Height = 196
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = cxGrid1DBTableView1CellDblClick
      DataController.DataSource = dsBRAK_MED
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = cxGrid1DBTableView1DRUGTXT
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object cxGrid1DBTableView1FK_ID: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'FK_ID'
        Visible = False
        VisibleForCustomization = False
        Width = 26
      end
      object cxGrid1DBTableView1UNIQSTR: TcxGridDBColumn
        Caption = 'ID2'
        DataBinding.FieldName = 'UNIQSTR'
        Visible = False
        VisibleForCustomization = False
        Width = 43
      end
      object cxGrid1DBTableView1DRUGTXT: TcxGridDBColumn
        Caption = #1052#1077#1076#1080#1082#1072#1084#1077#1085#1090
        DataBinding.FieldName = 'DRUGTXT'
        PropertiesClassName = 'TcxTextEditProperties'
        SortIndex = 0
        SortOrder = soAscending
        Width = 229
      end
      object cxGrid1DBTableView1SERIESNR: TcxGridDBColumn
        Caption = #1057#1077#1088#1080#1103
        DataBinding.FieldName = 'SERIESNR'
        SortIndex = 1
        SortOrder = soAscending
        Width = 50
      end
      object cxGrid1DBTableView1LABNM: TcxGridDBColumn
        Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1080#1103
        DataBinding.FieldName = 'LABNM'
        Visible = False
        Width = 77
      end
      object cxGrid1DBTableView1LETTERDATE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' 1 '#1087#1080#1089#1100#1084#1072
        DataBinding.FieldName = 'LETTERDATE'
        Width = 44
      end
      object cxGrid1DBTableView1LETTERNR: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' 1 '#1087#1080#1089#1100#1084#1072
        DataBinding.FieldName = 'LETTERNR'
        Width = 41
      end
      object cxGrid1DBTableView1MNFNM: TcxGridDBColumn
        Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
        DataBinding.FieldName = 'MNFNM'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 48
      end
      object cxGrid1DBTableView1SPECNM: TcxGridDBColumn
        Caption = #1055#1088#1080#1095#1080#1085#1072
        DataBinding.FieldName = 'SPECNM'
        PropertiesClassName = 'TcxMemoProperties'
        Visible = False
        Width = 58
      end
      object cxGrid1DBTableView1COUNTRYR: TcxGridDBColumn
        Caption = #1057#1090#1088#1072#1085#1072
        DataBinding.FieldName = 'COUNTRYR'
        Visible = False
        Width = 33
      end
      object cxGrid1DBTableView1FLGFALS: TcxGridDBColumn
        Caption = #1060#1072#1083#1100#1089#1080#1092#1080#1082#1072#1090
        DataBinding.FieldName = 'FLGFALS'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Visible = False
        Width = 26
      end
      object cxGrid1DBTableView1FLGALLOW: TcxGridDBColumn
        Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1086
        DataBinding.FieldName = 'FLGALLOW'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Visible = False
        VisibleForCustomization = False
        Width = 23
      end
      object cxGrid1DBTableView1ALLOWNR: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' 2 '#1087#1080#1089#1100#1084#1072
        DataBinding.FieldName = 'ALLOWNR'
        Width = 21
      end
      object cxGrid1DBTableView1ALLOWDATE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' 2 '#1087#1080#1089#1100#1084#1072
        DataBinding.FieldName = 'ALLOWDATE'
        Width = 21
      end
      object cxGrid1DBTableView1LETTERTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'LETTERTYPE'
        Visible = False
        VisibleForCustomization = False
        Width = 23
      end
      object cxGrid1DBTableView1FILENAMEFIRST: TcxGridDBColumn
        Caption = #1055#1080#1089#1100#1084#1086' 1'
        DataBinding.FieldName = 'FILENAMEFIRST'
        PropertiesClassName = 'TcxHyperLinkEditProperties'
        Width = 60
      end
      object cxGrid1DBTableView1FILENAMEOTHER: TcxGridDBColumn
        Caption = #1055#1080#1089#1100#1084#1086' 2'
        DataBinding.FieldName = 'FILENAMEOTHER'
        PropertiesClassName = 'TcxHyperLinkEditProperties'
        Width = 60
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 90
    Top = 68
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      ImageIndex = 1
      ShortCut = 16499
      OnExecute = acCloseExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 15
      ShortCut = 116
      OnExecute = acRefreshExecute
    end
    object acSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 30
      ShortCut = 13
      OnExecute = acSelectExecute
    end
    object acFilter: TAction
      Caption = #1060#1080#1083#1100#1090#1088
      Enabled = False
      Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1079#1072#1073#1088#1072#1082#1086#1074#1072#1085#1085#1099#1084' '#1089#1077#1088#1080#1103#1084
      ImageIndex = 58
      Visible = False
      OnExecute = acFilterExecute
    end
  end
  object dsBRAK_MED: TDataSource
    DataSet = dmMain.odsBRAK_MED
    Left = 134
    Top = 90
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'fmBrakSelect\'
    Options = [fpSize]
    StoredProps.Strings = (
      'cxGrid1DBTableView1ALLOWDATE.Visible'
      'cxGrid1DBTableView1ALLOWDATE.Width'
      'cxGrid1DBTableView1ALLOWNR.Visible'
      'cxGrid1DBTableView1ALLOWNR.Width'
      'cxGrid1DBTableView1COUNTRYR.Visible'
      'cxGrid1DBTableView1COUNTRYR.Width'
      'cxGrid1DBTableView1DRUGTXT.Visible'
      'cxGrid1DBTableView1DRUGTXT.Width'
      'cxGrid1DBTableView1FK_ID.Visible'
      'cxGrid1DBTableView1FK_ID.Width'
      'cxGrid1DBTableView1FLGALLOW.Visible'
      'cxGrid1DBTableView1FLGALLOW.Width'
      'cxGrid1DBTableView1FLGFALS.Visible'
      'cxGrid1DBTableView1FLGFALS.Width'
      'cxGrid1DBTableView1LABNM.Visible'
      'cxGrid1DBTableView1LABNM.Width'
      'cxGrid1DBTableView1LETTERNR.Visible'
      'cxGrid1DBTableView1LETTERNR.Width'
      'cxGrid1DBTableView1LETTERTYPE.Visible'
      'cxGrid1DBTableView1LETTERTYPE.Width'
      'cxGrid1DBTableView1MNFNM.Visible'
      'cxGrid1DBTableView1MNFNM.Width'
      'cxGrid1DBTableView1SERIESNR.Visible'
      'cxGrid1DBTableView1SERIESNR.Width'
      'cxGrid1DBTableView1SPECNM.Visible'
      'cxGrid1DBTableView1SPECNM.Width'
      'cxGrid1DBTableView1UNIQSTR.Visible'
      'cxGrid1DBTableView1UNIQSTR.Width')
    StoredValues = <>
    Left = 326
    Top = 122
  end
end
