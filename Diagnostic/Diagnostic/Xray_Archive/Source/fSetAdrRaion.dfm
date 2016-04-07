object frmSetAdrRaion: TfrmSetAdrRaion
  Left = 555
  Top = 54
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1088#1072#1090#1100' '#1088#1072#1081#1086#1085'('#1075#1086#1088#1086#1076')'
  ClientHeight = 464
  ClientWidth = 417
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
    Width = 411
    Height = 414
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object tvList: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsList
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
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
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object grdbtvchk: TcxGridDBColumn
        DataBinding.FieldName = 'CHK'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Width = 51
        IsCaptionAssigned = True
      end
      object tvListName: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        Options.Editing = False
        Width = 346
      end
      object grdbtvid: TcxGridDBColumn
        DataBinding.FieldName = 'FK_ID'
        Visible = False
        VisibleForCustomization = False
      end
    end
    object grListLevel1: TcxGridLevel
      GridView = tvList
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 420
    Width = 411
    Height = 41
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bSet: TcxButton
      Left = 247
      Top = 7
      Width = 75
      Height = 25
      Action = aSet
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 328
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
  object dsList: TDataSource
    DataSet = odsList
    Left = 104
    Top = 192
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      
        'select fk_id, decode(fc_prefix, '#39#1075#39', '#39#1075'.'#39', fc_prefix)||'#39' '#39'||fc_n' +
        'ame as fc_name , 0 as chk'
      '  from asu.tkladr  '
      ' where fk_owner = asu.get_hmao'
      'order by fc_name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000300000043484B010000000000}
    Cursor = crSQLWait
    OnApplyRecord = odsListApplyRecord
    Session = frmMain.os
    Left = 160
    Top = 192
  end
  object al: TActionList
    Left = 272
    Top = 160
    object aSet: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100
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
