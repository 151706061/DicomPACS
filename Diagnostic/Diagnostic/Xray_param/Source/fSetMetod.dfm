object frmSetMetod: TfrmSetMetod
  Left = 454
  Top = 51
  BorderStyle = bsDialog
  Caption = #1052#1077#1090#1086#1076#1080#1082#1080' '#1088#1077#1085#1090#1075#1077#1085#1086#1075#1088#1072#1092#1080#1080
  ClientHeight = 574
  ClientWidth = 578
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
  object grMetod: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 572
    Height = 518
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object TVMETOD: TcxGridDBTableView
      OnKeyDown = TVMETODKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = TVMETODCellDblClick
      DataController.DataSource = dsMetod
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = VMETOD_NAME
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object VMETOD_NAME: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1084#1077#1090#1086#1076#1080#1082#1080
        DataBinding.FieldName = 'FC_NAME'
      end
    end
    object grMetodLevel1: TcxGridLevel
      GridView = TVMETOD
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 524
    Width = 572
    Height = 47
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bSet: TcxButton
      Left = 408
      Top = 10
      Width = 75
      Height = 25
      Action = aSet
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 486
      Top = 10
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxLabel1: TcxLabel
      Left = 10
      Top = 13
      Caption = #1060#1080#1083#1100#1090#1088':'
    end
    object teFilter: TcxTextEdit
      Left = 57
      Top = 13
      Properties.CharCase = ecLowerCase
      Properties.ClearKey = 119
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 3
      OnClick = teFilterClick
      OnEnter = teFilterEnter
      OnKeyUp = teFilterKeyUp
      Width = 282
    end
  end
  object dsMetod: TDataSource
    DataSet = odsMetod
    Left = 280
    Top = 144
  end
  object odsMetod: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name, lower(fc_name) as lower_name'
      '  from asu.tsmid'
      ' where fk_owner = asu.get_xray_graf'
      '   and fl_showanal = 1'
      '   and fl_del = 0'
      
        '   and fk_id not in (select to_number(fc_value) from asu.tsmini ' +
        'where fc_section = '#39'XRAY'#39' and fc_key like '#39#1052#1045#1058#1054#1044#1048#1050#1048'_'#1044#1051#1071'_'#1060#1043'%'#39')'
      'order by fc_name')
    Optimize = False
    Cursor = crSQLWait
    Session = frmMain.osMain
    Left = 280
    Top = 192
  end
  object al: TActionList
    Left = 216
    Top = 336
    object aSet: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1084#1077#1090#1086#1076#1080#1082#1091
      ShortCut = 113
      OnExecute = aSetExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
