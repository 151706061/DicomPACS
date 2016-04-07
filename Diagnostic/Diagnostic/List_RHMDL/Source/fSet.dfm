object frmSet: TfrmSet
  Left = 338
  Top = 101
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088
  ClientHeight = 278
  ClientWidth = 486
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object grList: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 480
    Height = 238
    Align = alTop
    TabOrder = 0
    LookAndFeel.SkinName = 'Caramel'
    object tvList: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvListCellDblClick
      OnEditKeyDown = tvListEditKeyDown
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
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
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
  object bOk: TcxButton
    Left = 327
    Top = 247
    Width = 75
    Height = 25
    Action = aOK
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.SkinName = 'Caramel'
  end
  object bCancel: TcxButton
    Left = 408
    Top = 247
    Width = 75
    Height = 25
    Action = aCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.SkinName = 'Caramel'
  end
  object al: TActionList
    Left = 216
    Top = 88
    object aOK: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100
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
  object odsList: TOracleDataSet
    SQL.Strings = (
      'select t1.fk_rhmdlid, '
      '       t1.fk_nazid, '
      '       t2.fc_name,'
      '       t2.fk_smid,'
      
        '       (select fc_synonim from asu.tsmid where fk_id = t2.fk_smi' +
        'd) as fc_synonim'
      '  from asu.trhmdl_vnaz t1, asu.vnaz t2'
      ' where t1.fk_rhmdlid = :pfk_rhmdlid'
      '   and t1.fk_nazid = t2.fk_id')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A50464B5F52484D444C49440300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000A000000464B5F52484D444C494401000000000008000000
      464B5F4E415A49440100000000000700000046435F4E414D45010000000000}
    Session = frmMain.os
    Left = 344
    Top = 72
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 384
    Top = 72
  end
end
