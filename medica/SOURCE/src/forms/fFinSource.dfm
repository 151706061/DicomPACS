object fmFinSource: TfmFinSource
  Left = 354
  Top = 299
  HelpContext = 47
  Caption = #1048#1089#1090#1086#1095#1085#1080#1082#1080' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
  ClientHeight = 288
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 482
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 38
        Width = 474
      end>
    BorderWidth = 1
    EdgeBorders = [ebLeft, ebTop, ebRight]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 465
      Height = 38
      AutoSize = True
      ButtonHeight = 38
      ButtonWidth = 61
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton3: TToolButton
        Left = 0
        Top = 0
        Action = acAdd
      end
      object ToolButton4: TToolButton
        Left = 61
        Top = 0
        Action = acDel
      end
      object ToolButton7: TToolButton
        Left = 122
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 130
        Top = 0
        Action = acRefresh
      end
      object ToolButton6: TToolButton
        Left = 191
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 199
        Top = 0
        Action = acClose
      end
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 44
    Width = 482
    Height = 244
    Align = alClient
    TabOrder = 1
    ExplicitTop = 42
    ExplicitHeight = 246
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Enabled = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Append.Enabled = False
      NavigatorButtons.Append.Visible = False
      NavigatorButtons.Delete.Enabled = False
      NavigatorButtons.Delete.Visible = False
      NavigatorButtons.Edit.Enabled = False
      NavigatorButtons.Edit.Visible = False
      NavigatorButtons.Post.Enabled = False
      NavigatorButtons.Post.Visible = False
      NavigatorButtons.Cancel.Enabled = False
      NavigatorButtons.Cancel.Visible = False
      DataController.DataSource = dsTFinSource
      DataController.KeyFieldNames = 'FK_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1050#1086#1083'-'#1074#1086': ### ###'
          Kind = skCount
          Column = cxGrid1DBTableView1_FC_NAME
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = '<'#1053#1077#1090' '#1076#1072#1085#1085#1099#1093'>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object cxGrid1DBTableView1_FK_ID: TcxGridDBColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'FK_ID'
        Visible = False
        Options.Editing = False
        Width = 57
      end
      object cxGrid1DBTableView1_FC_NAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 234
      end
      object cxGrid1DBTableView1_FC_SYNONIM: TcxGridDBColumn
        Caption = #1057#1080#1085#1086#1085#1080#1084
        DataBinding.FieldName = 'FC_SYNONIM'
        Visible = False
        Width = 95
      end
      object cxGrid1DBTableView1_FK_TYPEDOC_ID: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'FK_TYPEDOC_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ClearKey = 46
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsTtypedoc
        Visible = False
        Width = 94
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    OnUpdate = alUpdate
    Left = 304
    Top = 24
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
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'fmFinSource\'
    StoredProps.Strings = (
      'cxGrid1DBTableView1_FC_NAME.Width'
      'cxGrid1DBTableView1_FC_SYNONIM.Width'
      'cxGrid1DBTableView1_FK_ID.Width'
      'cxGrid1DBTableView1_FK_TYPEDOC_ID.Width')
    StoredValues = <>
    Left = 304
    Top = 104
  end
  object odsTtypedoc: TOracleDataSet
    SQL.Strings = (
      'SELECT a.fk_id, a.fc_name, a.fn_order, a.fl_notdoc, a.fc_synonim'
      '  FROM asu.ttypedoc a'
      'order by a.fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F5244455201000000000009000000464C
      5F4E4F54444F430100000000000A00000046435F53594E4F4E494D0100000000
      00}
    Session = dmMain.os
    Left = 232
    Top = 144
  end
  object dsTtypedoc: TDataSource
    DataSet = odsTtypedoc
    Left = 308
    Top = 146
  end
  object odsTFinSource: TOracleDataSet
    SQL.Strings = (
      'SELECT fs.ROWID, fs.* FROM med.TFinSource fs')
    ReadBuffer = 50
    Optimize = False
    SequenceField.Field = 'FK_ID'
    SequenceField.Sequence = 'MED.SEQ_TFinSource'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F53594E4F4E494D0100000000000D000000
      464B5F54595045444F435F4944010000000000}
    Cursor = crSQLWait
    UniqueFields = 'FK_ID'
    UpdatingTable = 'MED.TFINSOURCE'
    Session = dmMain.os
    BeforePost = odsTFinSourceBeforePost
    Left = 82
    Top = 196
  end
  object dsTFinSource: TDataSource
    DataSet = odsTFinSource
    Left = 128
    Top = 194
  end
end
