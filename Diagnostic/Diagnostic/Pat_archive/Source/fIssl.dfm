object frmIssl: TfrmIssl
  Left = 441
  Top = 92
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
  ClientHeight = 504
  ClientWidth = 458
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
  object cxGr: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 452
    Height = 449
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object TV: TcxGridDBTableView
      OnKeyDown = TVKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = TVCellDblClick
      DataController.DataSource = dsIssl
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = VNAME
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object VCHECK: TcxGridDBColumn
        Caption = '_'
        DataBinding.FieldName = 'FL_CHECK'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 48
      end
      object VNAME: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        Options.Editing = False
        Width = 390
      end
      object VID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_ID'
        Visible = False
        VisibleForCustomization = False
      end
    end
    object cxGrLevel1: TcxGridLevel
      GridView = TV
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 455
    Width = 452
    Height = 46
    Margins.Top = 0
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 291
      Top = 9
      Width = 75
      Height = 25
      Action = aSet
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton2: TcxButton
      Left = 369
      Top = 9
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 128
    Top = 88
    object aSet: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
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
  object dsIssl: TDataSource
    DataSet = odsIssl
    Left = 224
    Top = 88
  end
  object odsIssl: TOracleDataSet
    SQL.Strings = (
      'select rowid, 0 as fl_check, fk_id, fc_name'
      '  from asu.tsmid'
      ' where fl_showanal = 1'
      '   and level <> 1'
      
        'start with fc_synonim in ('#39'ISL_PATANATOM'#39', '#39'I_CITOLOG'#39', '#39'I_IMM_G' +
        'IST'#39')'
      'connect by prior fk_id = fk_owner'
      'order siblings by fc_name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000008000000464C5F434845434B01000000000005000000464B
      5F49440100000000000700000046435F4E414D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 288
    Top = 88
    object odsIsslFL_CHECK: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'FL_CHECK'
    end
    object odsIsslFK_ID: TFloatField
      FieldName = 'FK_ID'
      Required = True
    end
    object odsIsslFC_NAME: TStringField
      FieldName = 'FC_NAME'
      Size = 255
    end
  end
end
