object frmSetValue: TfrmSetValue
  Left = 362
  Top = 84
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1079#1085#1072#1095#1077#1085#1080#1103
  ClientHeight = 543
  ClientWidth = 450
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
  object grList: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 444
    Height = 446
    Margins.Top = 0
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
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
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
      end
    end
    object grListLevel1: TcxGridLevel
      GridView = tvList
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 444
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object cxLabel1: TcxLabel
      Left = 16
      Top = 12
      Caption = #1060#1080#1083#1100#1090#1088':'
    end
    object teFilter: TcxTextEdit
      Left = 68
      Top = 11
      Properties.ClearKey = 119
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      OnClick = teFilterClick
      OnEnter = teFilterEnter
      OnKeyUp = teFilterKeyUp
      Width = 357
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 496
    Width = 444
    Height = 44
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    ExplicitLeft = 71
    ExplicitTop = 499
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bOk: TcxButton
      Left = 283
      Top = 9
      Width = 75
      Height = 25
      Action = aOk
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 361
      Top = 9
      Width = 75
      Height = 25
      Action = aEsc
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 144
    Top = 128
    object aOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aEsc: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aEscExecute
    end
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'select -1 as fk_id, '#39' '#39' as fc_name, '#39#39' as fc_upper from dual'
      'union all'
      'select fk_id, fc_name, upper(fc_name) as fc_upper '
      '  from asu.totdel'
      ' where connect_by_isleaf = 1'
      '   and fl_del = 0'
      'connect by prior fk_id = fk_ownerid'
      ' start with fk_ownerid = -1'
      ''
      'order by fc_name')
    Optimize = False
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 232
    Top = 96
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 232
    Top = 144
  end
end
