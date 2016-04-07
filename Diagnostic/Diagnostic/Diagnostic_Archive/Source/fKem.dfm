object frmSetKem: TfrmSetKem
  Left = 357
  Top = 66
  BorderStyle = bsDialog
  Caption = #1050#1077#1084' '#1085#1072#1087#1088#1072#1074#1083#1077#1085
  ClientHeight = 577
  ClientWidth = 564
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
  object grChar: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 36
    Width = 558
    Height = 488
    Margins.Top = 0
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object TVKEM: TcxGridDBTableView
      OnKeyDown = TVKEMKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = TVKEMCellDblClick
      DataController.DataSource = ds
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
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object VNAME: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
      end
    end
    object grCharLevel1: TcxGridLevel
      GridView = TVKEM
    end
  end
  object paFilter: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 558
    Height = 30
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object cxLabel1: TcxLabel
      Left = 4
      Top = 5
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object teFilter: TcxTextEdit
      Left = 86
      Top = 3
      Hint = 
        #1042#1074#1077#1076#1080#1090#1077' '#1073#1091#1082#1074#1099', '#1074#1089#1090#1088#1077#1095#1072#1102#1097#1080#1077#1089#1103' '#1074' '#1090#1086#1084' '#1089#1083#1086#1074#1077', '#1082#1086#1090#1086#1088#1086#1077' '#1042#1099' '#1093#1086#1090#1080#1090#1077' '#1085#1072#1081#1090 +
        #1080
      ParentFont = False
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      ShowHint = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      OnClick = teFilterClick
      OnEnter = teFilterEnter
      OnKeyUp = teFilterKeyUp
      Width = 438
    end
    object bClear: TcxButton
      Left = 527
      Top = 2
      Width = 24
      Height = 25
      Action = aClear
      TabOrder = 2
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000206B0030AAE0000A600000000000000
        00000000000000000000A700009A0000A70000000000000000000000000000A9
        1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
        B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
        00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
        1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
        F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
        52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
        0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
        AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
        5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
        0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
        A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
        6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
        0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
        C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
        13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
        000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
        FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
        00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
        0000000000000000CF0000C00000CE0000000000000000000000000000C40001
        B80000B500000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 527
    Width = 558
    Height = 47
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object bOk: TcxButton
      Left = 395
      Top = 10
      Width = 75
      Height = 25
      Action = aOK
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton1: TcxButton
      Left = 475
      Top = 10
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 248
    Top = 136
    object aOK: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ShortCut = 113
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aClear: TAction
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1092#1080#1083#1100#1090#1088#1072
      ShortCut = 119
      OnExecute = aClearExecute
    end
  end
  object ds: TDataSource
    DataSet = ods
    Left = 112
    Top = 80
  end
  object ods: TOracleDataSet
    SQL.Strings = (
      
        'select fk_id, fc_name, upper(fc_name) as fc_name_up, fk_owner, 1' +
        '000 as fn_order '
      '  from asu.tsmid'
      'where fl_showprint = 1'
      '  and level <> 1 '
      'start with fc_synonim = '#39'PD_NAPRAVIV_YCH'#39
      'connect by prior fk_id = fk_owner '
      ''
      '/*union all'
      ''
      
        'select fk_id, fc_name, upper(fc_name) as fc_name_up, fk_ownerid ' +
        'as fk_owner, 100000 as fn_order'
      '  from asu.totdel'
      ' where connect_by_isleaf = 1'
      '   and fl_del = 0'
      'connect by prior fk_id = fk_ownerid'
      ' start with fk_ownerid = -1 */'
      ''
      'order by fc_name')
    Optimize = False
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 112
    Top = 136
  end
end
