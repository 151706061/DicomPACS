object frmSetPers: TfrmSetPers
  Left = 406
  Top = 83
  BorderStyle = bsDialog
  Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' "'#1055#1077#1088#1089#1086#1085#1072#1083#1082#1072'"'
  ClientHeight = 502
  ClientWidth = 425
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
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 419
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitLeft = 152
    ExplicitTop = 56
    ExplicitWidth = 185
    object cxLabel1: TcxLabel
      Left = 12
      Top = 12
      Caption = #1060#1080#1083#1100#1090#1088':'
    end
    object teFilter: TcxTextEdit
      Left = 61
      Top = 11
      Properties.CharCase = ecLowerCase
      Properties.ClearKey = 119
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 1
      OnClick = teFilterClick
      OnEnter = teFilterEnter
      OnKeyUp = teFilterKeyUp
      Width = 346
    end
  end
  object grList: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 419
    Height = 406
    Margins.Top = 0
    Align = alTop
    TabOrder = 1
    LookAndFeel.SkinName = 'Caramel'
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
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
      end
    end
    object grListLevel1: TcxGridLevel
      GridView = tvList
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 456
    Width = 419
    Height = 43
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    ExplicitLeft = 8
    ExplicitTop = 475
    ExplicitHeight = 41
    object bOk: TcxButton
      Left = 248
      Top = 8
      Width = 75
      Height = 25
      Action = aOk
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Caramel'
    end
    object bCancel: TcxButton
      Left = 332
      Top = 8
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Caramel'
    end
  end
  object al: TActionList
    Left = 168
    Top = 152
    object aOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
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
    Left = 264
    Top = 160
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      
        'select fk_id, fc_name, lower(fc_name) as fc_name_low from taxi.t' +
        'street'
      ' where fl_del = 0'
      'order by fc_name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 304
    Top = 160
  end
end
