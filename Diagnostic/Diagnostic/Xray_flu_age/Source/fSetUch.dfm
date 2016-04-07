object frmSetUch: TfrmSetUch
  Left = 446
  Top = 94
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1091#1095#1072#1089#1090#1082#1072
  ClientHeight = 470
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 35
    Width = 351
    Height = 388
    Margins.Top = 0
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    ExplicitTop = 69
    object TV: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = TVCellDblClick
      DataController.DataSource = dsListUch
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      OptionsView.Indicator = True
      object VNAME: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NAMEUCH'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = TV
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 0
    Width = 351
    Height = 32
    Margins.Top = 0
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 34
    object lcbType: TcxLookupComboBox
      Left = 74
      Top = 6
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsType
      Properties.PostPopupValueOnTab = True
      Properties.OnEditValueChanged = lcbTypePropertiesEditValueChanged
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 0
      Width = 270
    end
    object cxLabel1: TcxLabel
      Left = 4
      Top = 7
      Caption = #1058#1080#1087' '#1091#1095#1072#1089#1090#1082#1072':'
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 426
    Width = 351
    Height = 41
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    ExplicitLeft = -31
    ExplicitTop = 231
    ExplicitWidth = 388
    ExplicitHeight = 39
    object bSet: TcxButton
      Left = 192
      Top = 8
      Width = 75
      Height = 25
      Action = actOk
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 271
      Top = 8
      Width = 75
      Height = 25
      Action = actClose
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object actlstOkCancel: TActionList
    Images = frmMain.ilMain
    Left = 172
    Top = 193
    object actOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100
      ShortCut = 113
      OnExecute = actOkExecute
    end
    object actClose: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = actCloseExecute
    end
  end
  object odsListUch: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name, '#39#8470' '#39'||fc_name as nameuch '
      '  from asu.tdistrict_name'
      
        ' where fk_typeid = :pfk_typeid --(select fk_id from asu.tsmid wh' +
        'ere fc_synonim = '#39'THERAPIST_AREA'#39')'
      'order by to_number(REGEXP_REPLACE(fc_name, '#39'[[:alpha:]-/'#8470'\# ]'#39'))'
      '')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50464B5F545950454944030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000070000004E414D45554348010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterOpen = odsListUchAfterOpen
    Left = 60
    Top = 166
  end
  object dsListUch: TDataSource
    DataSet = odsListUch
    Left = 28
    Top = 166
  end
  object dsType: TDataSource
    DataSet = odsType
    Left = 176
    Top = 120
  end
  object odsType: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name '
      '  from asu.tsmid '
      ' where fc_synonim in ('#39'THERAPIST_AREA'#39', '#39'PEDIATR_AREA'#39')'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 216
    Top = 120
  end
end
