object frmSetKab: TfrmSetKab
  Left = 464
  Top = 91
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1082#1072#1073#1080#1085#1077#1090#1072
  ClientHeight = 460
  ClientWidth = 314
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
  object grKab: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 308
    Height = 406
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object tvKab: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsKab
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = tvKabName
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvKabCheck: TcxGridDBColumn
        Caption = '_'
        DataBinding.FieldName = 'FL_CHECK'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 41
      end
      object tvKabName: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        Options.Editing = False
        Width = 253
      end
    end
    object grKabLevel1: TcxGridLevel
      GridView = tvKab
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 412
    Width = 308
    Height = 45
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bOk: TcxButton
      Left = 143
      Top = 9
      Width = 75
      Height = 25
      Action = aSet
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton1: TcxButton
      Left = 224
      Top = 9
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 72
    Top = 136
    object aSet: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
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
  object dsKab: TDataSource
    DataSet = odsKab
    Left = 168
    Top = 72
  end
  object odsKab: TOracleDataSet
    SQL.Strings = (
      'select t.rowid, t.* '
      '  from (select 0 as fl_check,'
      '               t2.fk_id,'
      '               t2.fc_name,'
      
        '               (select count(*) from asu.tsmini where fc_key lik' +
        'e '#39#1060#1051#1070#1054#1056#1054'_'#1050#1040#1041#1048#1053#1045#1058#1067'%'#39' and fc_value = t2.fk_id) as is_flu  '
      '          from asu.tvrachkab t1, asu.tkabinet t2 '
      '         where t1.fk_sotrid = :psotr'
      '           and t1.fk_kabinetid = t2.fk_id'
      '        order by t2.fn_order ) t  '
      ''
      ''
      '/*select rowid,'
      '       0 as fl_check,'
      '       fk_id,'
      '       fk_kabinetid,'
      
        '       (select fc_name from asu.tkabinet where fk_id = tvrachkab' +
        '.fk_kabinetid) as fc_name, '
      
        '       (select count(*) from asu.tsmini where fc_key like '#39#1060#1051#1070#1054#1056 +
        #1054'_'#1050#1040#1041#1048#1053#1045#1058#1067'%'#39' and fc_value = tvrachkab.fk_kabinetid) as is_flu  '
      '  from asu.tvrachkab'
      ' where fk_sotrid = :psotr*/'
      ''
      ' '
      '')
    Optimize = False
    Variables.Data = {0300000001000000060000003A50534F5452030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F494401000000000008000000464C5F4348
      45434B0100000000000700000046435F4E414D45010000000000060000004953
      5F464C550100000000000800000046435F50484F4E45010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    Session = frmMain.os
    BeforeOpen = odsKabBeforeOpen
    Left = 168
    Top = 128
    object odsKabFL_CHECK: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'FL_CHECK'
    end
    object odsKabFK_ID: TFloatField
      FieldName = 'FK_ID'
      Required = True
    end
    object odsKabFC_NAME: TStringField
      FieldName = 'FC_NAME'
      Required = True
      Size = 100
    end
    object odsKabFC_PHONE: TStringField
      FieldName = 'FC_PHONE'
      Size = 30
    end
    object odsKabIS_FLU: TFloatField
      FieldName = 'IS_FLU'
    end
  end
end
