object frmSetAdrParam: TfrmSetAdrParam
  Left = 404
  Top = 119
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088
  ClientHeight = 470
  ClientWidth = 415
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
    Width = 409
    Height = 430
    Align = alTop
    TabOrder = 0
    LookAndFeel.SkinName = 'Caramel'
    object TV: TcxGridDBTableView
      OnKeyDown = TVKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = TVCellDblClick
      DataController.DataSource = dsList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = VNAME
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
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
    object grListLevel1: TcxGridLevel
      GridView = TV
    end
  end
  object bOk: TcxButton
    Left = 255
    Top = 439
    Width = 75
    Height = 25
    Action = aOk
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.SkinName = 'Caramel'
  end
  object bCancel: TcxButton
    Left = 337
    Top = 439
    Width = 75
    Height = 25
    Action = aCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.SkinName = 'Caramel'
  end
  object al: TActionList
    Left = 192
    Top = 136
    object aOk: TAction
      Caption = 'Ok'
      Hint = #1042#1099#1073#1088#1072#1090#1100
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
  object dsList: TDataSource
    DataSet = odsList
    Left = 112
    Top = 192
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name '
      '  from taxi.tkladr'
      ' where fn_level = :pfn_level')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A50464E5F4C4556454C03000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 112
    Top = 240
  end
  object odsTown: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name '
      '  from taxi.tkladr'
      ' where fn_level = 3 '
      'start with fk_id = :pfk_id'
      'connect by prior fk_id = fk_owner'
      'order by fc_name')
    Optimize = False
    Variables.Data = {0300000001000000070000003A50464B5F4944030000000000000000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 168
    Top = 240
  end
end
