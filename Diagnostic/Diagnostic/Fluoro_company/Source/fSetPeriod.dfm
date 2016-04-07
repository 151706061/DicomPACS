object frmSetPeriod: TfrmSetPeriod
  Left = 454
  Top = 77
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1084#1077#1089#1103#1094#1072
  ClientHeight = 507
  ClientWidth = 268
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGr: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 262
    Height = 449
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    ExplicitLeft = 0
    ExplicitTop = 28
    ExplicitWidth = 268
    ExplicitHeight = 457
    object TV: TcxGridDBTableView
      OnKeyDown = TVKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = TVCellDblClick
      DataController.DataSource = ds
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = VNAME
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object VNAME: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
      end
    end
    object cxGrLevel1: TcxGridLevel
      GridView = TV
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 455
    Width = 262
    Height = 49
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = -30
    ExplicitTop = 84
    ExplicitWidth = 298
    ExplicitHeight = 50
    object cxButton1: TcxButton
      Left = 98
      Top = 11
      Width = 75
      Height = 25
      Action = aOK
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton2: TcxButton
      Left = 179
      Top = 11
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Images = frmMain.ilMain
    Left = 96
    Top = 72
    object aOK: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1084#1077#1089#1103#1094
      ShortCut = 113
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object ds: TDataSource
    DataSet = ods
    Left = 48
    Top = 192
  end
  object ods: TOracleDataSet
    SQL.Strings = (
      
        'SELECT FK_ID, FC_NAME, FK_OWNER, FN_ORDER, FD_DATE1, FD_DATE2, T' +
        'O_CHAR(FD_DATE1, '#39'mm'#39') AS DATE1_MON '
      '  FROM asu.TPERIOD_COMPANY'
      'WHERE FK_COMPANYID IS NULL'
      '  AND FK_ID <> 0'
      '  AND FL_DEL = 0'
      '  AND FK_OWNER <> 0'
      'ORDER BY FN_ORDER'
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000600000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464B5F4F574E455201000000000008000000464E
      5F4F524445520100000000000800000046445F44415445310100000000000800
      000046445F4441544532010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 80
    Top = 192
  end
end
