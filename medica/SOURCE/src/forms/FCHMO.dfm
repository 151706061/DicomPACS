object frmChmo: TfrmChmo
  Left = 418
  Top = 203
  HelpContext = 3
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1084#1072#1090'. '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1075#1086
  ClientHeight = 434
  ClientWidth = 369
  Color = clBtnFace
  Constraints.MinHeight = 340
  Constraints.MinWidth = 280
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'StMedsestra.chm'
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 369
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 40
        Width = 365
      end>
    EdgeBorders = [ebLeft, ebTop, ebRight]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 352
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 56
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = acSave
      end
      object ToolButton5: TToolButton
        Left = 56
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton2: TToolButton
        Left = 64
        Top = 0
        Action = acCancel
      end
      object ToolButton4: TToolButton
        Left = 120
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 128
        Top = 0
        Action = acRefresh
      end
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 42
    Width = 369
    Height = 392
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsChmo
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.IncSearch = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLineColor = clBlack
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.ContentEven = dmMain.cxStyleGridEvenRow
      Styles.ContentOdd = dmMain.cxStyleGridOddRow
      Styles.Selection = dmMain.cxStyleGridSelectedRow
      object cxGrid1DBTableView1_FC_NAME: TcxGridDBColumn
        DataBinding.FieldName = 'FC_NAME'
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Width = 279
      end
      object cxGrid1DBTableView1_MOID: TcxGridDBColumn
        DataBinding.FieldName = 'MOID'
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Width = 88
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 200
    Top = 16
    object acSave: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1086#1090#1084#1077#1095#1077#1085#1085#1086#1075#1086' '#1084#1072#1090'. '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1075#1086
      ImageIndex = 9
      ShortCut = 113
      OnExecute = acSaveExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1099#1073#1086#1088
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acCancelExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 15
      ShortCut = 116
      OnExecute = acRefreshExecute
    end
  end
  object odsChmo: TOracleDataSet
    SQL.Strings = (
      
        'SELECT MOID, LPAD(FC_NAME,LENGTH(FC_NAME) + 3*LEVEL,'#39' '#39') AS FC_N' +
        'AME, LEVEL,'
      'MED.PKG_HIERARCHY.BRANCH(LEVEL,FC_NAME,'#39'/'#39') AS HIERARCH'
      'FROM MED.TMO'
      'WHERE --FC_NAME <> '#39#1054#1090#1076#1077#1083' '#1056#1055#1054#39
      ' MOID<>MED.PKGTMO.GET_PRODUCE_POSTAV_TMO'
      'START WITH FK_PARENT = 0 '
      'CONNECT BY PRIOR MOID = FK_PARENT'
      'ORDER BY 4'
      ''
      '/*'
      
        'SELECT MOID,LPAD(FC_NAME,LENGTH(FC_NAME) + 3*LEVEL,'#39' '#39') AS FC_NA' +
        'ME FROM TMO'
      'START WITH FK_PARENT = 0 '
      'CONNECT BY PRIOR MOID = FK_PARENT'
      '------'
      'select *'
      'from vchmo'
      'order by fc_name'
      '*/')
    QBEDefinition.QBEFieldDefs = {
      0400000004000000040000004D4F4944010000000000050000004C4556454C01
      00000000000800000048494552415243480100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    DesignActivation = True
    Left = 18
    Top = 80
    object odsChmoMOID: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1052#1054
      FieldName = 'MOID'
      Required = True
    end
    object odsChmoFC_NAME: TStringField
      DisplayLabel = #1052#1072#1090'. '#1054#1090#1074'.'
      FieldName = 'FC_NAME'
      Size = 4000
    end
  end
  object dsChmo: TDataSource
    DataSet = odsChmo
    Left = 19
    Top = 128
  end
end
