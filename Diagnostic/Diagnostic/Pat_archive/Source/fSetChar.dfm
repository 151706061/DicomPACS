object frmSetChar: TfrmSetChar
  Left = 404
  Top = 27
  BorderStyle = bsDialog
  Caption = #1061#1072#1088#1072#1082#1090#1077#1088' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
  ClientHeight = 505
  ClientWidth = 331
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grChar: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 42
    Width = 325
    Height = 417
    Margins.Top = 0
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object TVCHAR: TcxGridDBTableView
      OnKeyDown = TVCHARKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = TVCHARCellDblClick
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
      object grdbtvID: TcxGridDBColumn
        DataBinding.FieldName = 'Fk_id'
        Visible = False
        VisibleForCustomization = False
      end
    end
    object grCharLevel1: TcxGridLevel
      GridView = TVCHAR
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 462
    Width = 325
    Height = 40
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bOk: TcxButton
      Left = 161
      Top = 6
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
      Left = 242
      Top = 6
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
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 325
    Height = 36
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object cxLabel1: TcxLabel
      Left = 5
      Top = 7
      Caption = #1060#1080#1083#1100#1090#1088':'
    end
    object teFilter: TcxTextEdit
      Left = 52
      Top = 7
      Properties.CharCase = ecLowerCase
      Properties.OnChange = teFilterPropertiesChange
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      OnClick = teFilterClick
      OnEnter = teFilterEnter
      Width = 238
    end
    object cxButton2: TcxButton
      Left = 293
      Top = 4
      Width = 27
      Height = 25
      TabOrder = 2
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000A40206B0030AAE0000A600009800000000
        00000000000000000000A700009A0000A70000000000000000000000000000A9
        1844F6194DF81031D20102AB0000B60000000000000000B10928D7092ED70313
        B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
        00B00000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
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
        B80000B500007700000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
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
    end
  end
  object ds: TDataSource
    DataSet = ods
    Left = 112
    Top = 80
  end
  object ods: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name, lower(fc_name) as lowername'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = :pfc_synonim --'#39'ORGAN_PATANATOM'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A5046435F53594E4F4E494D0500000000000000
      00000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsBeforeOpen
    Left = 112
    Top = 136
  end
  object odsArea: TOracleDataSet
    SQL.Strings = (
      'SELECT fk_id,fc_name FROM asu.tareaname order by fc_name')
    Optimize = False
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsBeforeOpen
    Left = 112
    Top = 184
  end
end
