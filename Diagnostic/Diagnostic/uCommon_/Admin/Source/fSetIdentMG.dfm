object frmSetIdentMG: TfrmSetIdentMG
  Left = 393
  Top = 116
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088#1072' "'#1052#1077#1078#1075#1086#1088#1086#1076'"'
  ClientHeight = 408
  ClientWidth = 406
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
    Width = 400
    Height = 366
    Align = alTop
    TabOrder = 0
    LookAndFeel.SkinName = 'Caramel'
    object tvList: TcxGridDBTableView
      OnKeyDown = tvListKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvListCellDblClick
      DataController.DataSource = dsList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvListName: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
      end
    end
    object grListLevel1: TcxGridLevel
      GridView = tvList
    end
  end
  object cxButton1: TcxButton
    Left = 247
    Top = 375
    Width = 75
    Height = 25
    Action = aOk
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.SkinName = 'Caramel'
  end
  object cxButton2: TcxButton
    Left = 328
    Top = 375
    Width = 75
    Height = 25
    Action = aCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.SkinName = 'Caramel'
  end
  object al: TActionList
    Left = 112
    Top = 88
    object aOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1086#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 200
    Top = 80
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name from taxi.ts_raion'
      ' where fl_del = 0'
      'order by fc_name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 272
    Top = 80
  end
end
