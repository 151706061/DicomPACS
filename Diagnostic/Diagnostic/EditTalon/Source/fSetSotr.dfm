object frmSetSotr: TfrmSetSotr
  Left = 405
  Top = 103
  Caption = #1042#1099#1073#1086#1088' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
  ClientHeight = 507
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grSotr: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 448
    Height = 454
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object tvSotr: TcxGridDBTableView
      OnKeyDown = tvSotrKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvSotrCellDblClick
      DataController.DataSource = dsSotr
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
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvSotrFio: TcxGridDBColumn
        Caption = #1060#1048#1054
        DataBinding.FieldName = 'FIO'
        Width = 252
      end
      object tvSotrSpec: TcxGridDBColumn
        Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
        DataBinding.FieldName = 'FC_NAME'
        Width = 182
      end
    end
    object grSotrLevel1: TcxGridLevel
      GridView = tvSotr
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 460
    Width = 448
    Height = 44
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 88
    ExplicitTop = 464
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bbOk: TcxButton
      Left = 287
      Top = 10
      Width = 75
      Height = 25
      Action = aOk
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bbCancel: TcxButton
      Left = 365
      Top = 10
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 184
    Top = 144
    object aOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
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
  object dsSotr: TDataSource
    DataSet = odsSotr
    Left = 280
    Top = 120
  end
  object odsSotr: TOracleDataSet
    SQL.Strings = (
      'select t1.fk_id,'
      
        '       t1.fc_fam||'#39' '#39'||substr(t1.fc_name, 0, 1)||'#39'. '#39'||substr(t1' +
        '.fc_otch, 0, 1)||'#39'.'#39' as fio,'
      '       t2.fc_name '
      '  from asu.tsotr t1, asu.ts_sprav t2'
      ' where t1.fk_spravid = t2.fk_id'
      '   and t1.fk_otdelid = :pfk_otdelid'
      '   and t1.fl_del = 0'
      'order by fc_fam')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A50464B5F4F5444454C49440300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000300000046494F0100
      000000000700000046435F4E414D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 280
    Top = 168
  end
end
