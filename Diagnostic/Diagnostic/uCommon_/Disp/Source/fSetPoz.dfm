object frmSetPoz: TfrmSetPoz
  Left = 486
  Top = 104
  BorderStyle = bsDialog
  Caption = #1055#1086#1079#1099#1074#1085#1099#1077
  ClientHeight = 456
  ClientWidth = 321
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
  object grList: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 315
    Height = 401
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    ExplicitTop = 0
    object tvList: TcxGridDBTableView
      OnKeyDown = tvListKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvListCellDblClick
      DataController.DataSource = dsList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = tvListName
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvListName: TcxGridDBColumn
        Caption = #1055#1086#1079#1099#1074#1085#1086#1081
        DataBinding.FieldName = 'FC_NAME'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
      end
    end
    object grListLevel1: TcxGridLevel
      GridView = tvList
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 407
    Width = 315
    Height = 46
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 80
    ExplicitTop = 432
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bOk: TcxButton
      Left = 144
      Top = 11
      Width = 75
      Height = 25
      Action = aSave
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton1: TcxButton
      Left = 230
      Top = 11
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
    Left = 171
    Top = 139
    object aSave: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100
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
  object dsList: TDataSource
    DataSet = odsList
    Left = 112
    Top = 80
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name'
      '  from taxi.ts_drivers'
      ' where fk_taxiid = :pfk_taxiid '
      'order by to_number(fc_name)')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50464B5F544158494944030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsListBeforeOpen
    Left = 112
    Top = 128
  end
end
