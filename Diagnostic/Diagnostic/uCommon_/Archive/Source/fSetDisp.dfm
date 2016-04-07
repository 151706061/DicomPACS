object frmSetDisp: TfrmSetDisp
  Left = 485
  Top = 73
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1072
  ClientHeight = 526
  ClientWidth = 432
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
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 426
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 9
      Top = 12
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080':'
    end
    object teFilter: TcxTextEdit
      Left = 120
      Top = 11
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 119
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      OnClick = teFilterClick
      OnEnter = teFilterEnter
      OnKeyUp = teFilterKeyUp
      Width = 297
    end
  end
  object grList: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 426
    Height = 434
    Margins.Top = 0
    Align = alTop
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    LookAndFeel.SkinName = ''
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
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvListName: TcxGridDBColumn
        Caption = #1060#1048#1054' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1072
        DataBinding.FieldName = 'FIO'
      end
    end
    object grListLevel1: TcxGridLevel
      GridView = tvList
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 484
    Width = 426
    Height = 39
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    ExplicitLeft = 56
    ExplicitTop = 504
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bOk: TcxButton
      Left = 267
      Top = 6
      Width = 75
      Height = 25
      Action = aSave
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 345
      Top = 6
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 248
    Top = 176
    object aSave: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1072
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      OnExecute = aCancelExecute
    end
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 80
    Top = 192
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'select fk_id,'
      '       fc_fam||'#39' '#39'||fc_name||'#39' '#39'||fc_otch as fio,'
      '       upper(fc_fam) as fc_fam_up  '
      '  from taxi.ts_sotr'
      ' ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000300000046494F0100
      000000000900000046435F46414D5F5550010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 80
    Top = 240
  end
end
