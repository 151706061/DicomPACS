object frmSetOtdel: TfrmSetOtdel
  Left = 382
  Top = 82
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1086#1090#1076#1077#1083#1077#1085#1080#1103
  ClientHeight = 518
  ClientWidth = 568
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grOtdel: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 562
    Height = 470
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object tvOtdel: TcxGridDBTableView
      OnKeyDown = tvOtdelKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvOtdelCellDblClick
      DataController.DataSource = dsOtdel
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = tvOtdelName
        end>
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
      object tvOtdelName: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'fc_name'
      end
    end
    object grOtdelLevel1: TcxGridLevel
      GridView = tvOtdel
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 476
    Width = 562
    Height = 39
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bOk: TcxButton
      Left = 401
      Top = 7
      Width = 75
      Height = 25
      Action = aOk
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 479
      Top = 7
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object dsOtdel: TDataSource
    DataSet = odsOtdel
    Left = 400
    Top = 88
  end
  object odsOtdel: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name'
      '  from asu.totdel'
      ' where fl_del = 0'
      '   and connect_by_isleaf = 1'
      'start with fk_id = asu.get_stotdel'
      'connect by prior fk_id = fk_ownerid'
      'order by fc_name'
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000600000005000000464B5F49440100000000000A000000464B5F4F57
      4E455249440100000000000700000046435F4E414D4501000000000006000000
      464C5F44454C0100000000000800000046435F53484F52540100000000000A00
      0000464B5F49445F524F4F54010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 400
    Top = 144
  end
  object al: TActionList
    Left = 192
    Top = 248
    object aOk: TAction
      Caption = 'Ok'
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <>
    StorageName = 'cxPropertiesStore1'
    Left = 120
    Top = 144
  end
  object odsOtdelAmb: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name'
      '  from asu.totdel'
      ' where fl_del = 0'
      '   and connect_by_isleaf = 1'
      'start with fk_id = asu.get_polikotdel'
      'connect by prior fk_id = fk_ownerid'
      'order by fc_name'
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000600000005000000464B5F49440100000000000A000000464B5F4F57
      4E455249440100000000000700000046435F4E414D4501000000000006000000
      464C5F44454C0100000000000800000046435F53484F52540100000000000A00
      0000464B5F49445F524F4F54010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 400
    Top = 200
  end
end
