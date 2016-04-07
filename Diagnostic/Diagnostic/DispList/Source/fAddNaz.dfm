object frmAddNaz: TfrmAddNaz
  Left = 393
  Top = 58
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
  ClientHeight = 548
  ClientWidth = 666
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
    Width = 660
    Height = 450
    Margins.Top = 0
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    LookAndFeel.SkinName = ''
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
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvListCheck: TcxGridDBColumn
        DataBinding.FieldName = 'FL_CHECK'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Options.Moving = False
        IsCaptionAssigned = True
      end
      object tvListName: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        Options.Editing = False
      end
      object tvListID: TcxGridDBColumn
        Caption = 'ID'
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
    Top = 3
    Width = 660
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object cxLabel1: TcxLabel
      Left = 12
      Top = 12
      Caption = #1060#1080#1083#1100#1090#1088':'
    end
    object teFilter: TcxTextEdit
      Left = 64
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
      Width = 361
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 500
    Width = 660
    Height = 45
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object bOk: TcxButton
      Left = 492
      Top = 8
      Width = 75
      Height = 25
      Action = aOk
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 576
      Top = 8
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
    Left = 176
    Top = 208
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      
        'select rowid, 0 as fl_check, fk_id, fc_name, upper(fc_name) as f' +
        'c_name_up'
      '  from asu.tsmid'
      ' where fl_showanal = 1'
      '   and level <> 1'
      '--   and level <> 2'
      'start with fc_synonim = '#39'ISSLED'#39
      'connect by prior fk_id = fk_owner '
      'union all'
      
        'select rowid, 0 as fl_check, fk_id, asu.get_fullpath_sha(fk_id) ' +
        'as fc_name, upper(asu.get_fullpath_sha(fk_id)) as fc_name_up'
      '  from asu.tsmid'
      ' where fl_showanal = 1'
      '   and level <> 1'
      'start with fc_synonim = '#39'KONS_SPEC'#39
      'connect by prior fk_id = fk_owner '
      'union all'
      
        'select rowid, 0 as fl_check, fk_id, asu.get_fullpath_sha(fk_id) ' +
        'as fc_name, upper(asu.get_fullpath_sha(fk_id)) as fc_name_up'
      '  from asu.tsmid'
      ' where fl_showanal = 2'
      '   and level <> 1'
      'start with fc_synonim = '#39'RAZ_ANAL'#39
      'connect by prior fk_id = fk_owner '
      ''
      'order by fc_name'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000008000000464C5F434845434B010000000000070000004643
      5F4E414D450100000000000A00000046435F4E414D455F555001000000000005
      000000464B5F4944010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    Session = frmMain.os
    Left = 176
    Top = 256
    object odsListFL_CHECK: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'FL_CHECK'
    end
    object odsListFC_NAME: TStringField
      FieldName = 'FC_NAME'
      Required = True
      Size = 255
    end
    object odsListFC_NAME_UP: TStringField
      FieldName = 'FC_NAME_UP'
      Size = 255
    end
    object odsListFK_ID: TFloatField
      FieldName = 'FK_ID'
      Required = True
    end
  end
  object al: TActionList
    Left = 328
    Top = 176
    object aOk: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1077' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      OnExecute = aCancelExecute
    end
  end
end
