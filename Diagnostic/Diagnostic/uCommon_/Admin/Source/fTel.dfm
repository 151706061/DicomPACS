object frmTel: TfrmTel
  Left = 400
  Top = 146
  BorderStyle = bsDialog
  Caption = #1058#1077#1083#1077#1092#1086#1085#1099
  ClientHeight = 331
  ClientWidth = 332
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
  object grList: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 326
    Height = 289
    Align = alTop
    TabOrder = 0
    LookAndFeel.SkinName = 'Caramel'
    object TVLIST: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsTel
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = VLIST_NUM
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
      object VLIST_NUM: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
        DataBinding.FieldName = 'FC_PHONE'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = TVLIST
    end
  end
  object bOk: TcxButton
    Left = 254
    Top = 298
    Width = 75
    Height = 25
    Action = aOk
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.SkinName = 'Caramel'
  end
  object al: TActionList
    Left = 59
    Top = 86
    object aOk: TAction
      Caption = 'Ok'
      Hint = 'OK'
      ShortCut = 27
      OnExecute = aOkExecute
    end
  end
  object dsTel: TDataSource
    DataSet = odsTel
    Left = 216
    Top = 64
  end
  object odsTel: TOracleDataSet
    SQL.Strings = (
      'select fc_phone '
      '  from taxi.tphones'
      ' where fk_clientid = :pfk_clientid')
    Optimize = False
    Variables.Data = {
      03000000010000000D0000003A50464B5F434C49454E54494403000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000800000046435F50484F4E45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 224
    Top = 112
  end
end
