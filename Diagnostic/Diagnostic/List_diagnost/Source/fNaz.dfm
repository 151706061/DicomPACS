object frmNaz: TfrmNaz
  Left = 395
  Top = 107
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
  ClientHeight = 548
  ClientWidth = 562
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
  object cxVerticalGrid1: TcxVerticalGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 556
    Height = 131
    Align = alTop
    OptionsView.RowHeaderWidth = 201
    TabOrder = 0
    object catPac: TcxCategoryRow
      Options.Focusing = False
      Options.TabStop = False
      Properties.Caption = #1044#1072#1085#1085#1099#1077' '#1087#1072#1094#1080#1077#1085#1090#1072
    end
    object merFIOMK: TcxMultiEditorRow
      Options.Focusing = False
      Options.TabStop = False
      Properties.Editors = <
        item
          Caption = #1060#1048#1054
          EditPropertiesClassName = 'TcxLabelProperties'
          EditProperties.Alignment.Horz = taCenter
          DataBinding.ValueType = 'String'
          Value = Null
        end
        item
          Caption = #8470' '#1052#1050
          EditPropertiesClassName = 'TcxLabelProperties'
          EditProperties.Alignment.Horz = taCenter
          Width = 20
          DataBinding.ValueType = 'String'
          Value = Null
        end>
    end
    object merDateAgeSex: TcxMultiEditorRow
      Options.Focusing = False
      Options.TabStop = False
      Properties.Editors = <
        item
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          EditPropertiesClassName = 'TcxLabelProperties'
          EditProperties.Alignment.Horz = taCenter
          DataBinding.ValueType = 'String'
          Value = Null
        end
        item
          Caption = #1042#1086#1079#1088#1072#1089#1090
          EditPropertiesClassName = 'TcxLabelProperties'
          EditProperties.Alignment.Horz = taCenter
          DataBinding.ValueType = 'String'
          Value = Null
        end
        item
          Caption = #1055#1086#1083
          EditPropertiesClassName = 'TcxLabelProperties'
          EditProperties.Alignment.Horz = taCenter
          DataBinding.ValueType = 'String'
          Value = Null
        end>
    end
    object catNaz: TcxCategoryRow
      Options.Focusing = False
      Options.TabStop = False
      Properties.Caption = #1044#1072#1085#1085#1099#1077' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
    end
    object rowKab: TcxEditorRow
      Properties.Caption = #1050#1072#1073#1080#1085#1077#1090
      Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsFixedList
      Properties.EditProperties.DropDownSizeable = True
      Properties.EditProperties.GridMode = True
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.KeyFieldNames = 'FK_ID'
      Properties.EditProperties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.EditProperties.ListOptions.ShowHeader = False
      Properties.EditProperties.ListSource = dsKab
      Properties.EditProperties.PostPopupValueOnTab = True
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = Null
    end
    object rowType: TcxEditorRow
      Properties.Caption = #1058#1080#1087
      Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsFixedList
      Properties.EditProperties.DropDownSizeable = True
      Properties.EditProperties.GridMode = True
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.KeyFieldNames = 'FK_ID'
      Properties.EditProperties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.EditProperties.ListOptions.ShowHeader = False
      Properties.EditProperties.ListSource = dsType
      Properties.EditProperties.PostPopupValueOnTab = True
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = Null
    end
    object merDateTime: TcxMultiEditorRow
      Properties.Editors = <
        item
          Caption = #1044#1072#1090#1072
          EditPropertiesClassName = 'TcxDateEditProperties'
          EditProperties.ImmediatePost = True
          EditProperties.PostPopupValueOnTab = True
          EditProperties.SaveTime = False
          EditProperties.ShowTime = False
          DataBinding.ValueType = 'DateTime'
          Options.ShowEditButtons = eisbAlways
          Value = Null
        end
        item
          Caption = #1042#1088#1077#1084#1103
          EditPropertiesClassName = 'TcxTimeEditProperties'
          EditProperties.ImmediatePost = True
          EditProperties.TimeFormat = tfHourMin
          DataBinding.ValueType = 'DateTime'
          Options.ShowEditButtons = eisbAlways
          Value = Null
        end>
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 137
    Width = 556
    Height = 366
    Margins.Top = 0
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object dxBarDockControl1: TdxBarDockControl
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 546
      Height = 28
      Align = dalTop
      BarManager = BM
      SunkenBorder = True
      UseOwnSunkenBorder = True
    end
    object cxgr: TcxGrid
      AlignWithMargins = True
      Left = 5
      Top = 36
      Width = 546
      Height = 328
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alClient
      TabOrder = 1
      object tv: TcxGridDBTableView
        OnKeyDown = tvKeyDown
        NavigatorButtons.ConfirmDelete = False
        OnCellDblClick = tvCellDblClick
        DataController.DataSource = dsNaz
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = tvName
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
        object tvName: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'NAMENAZ'
        end
      end
      object cxgrLevel1: TcxGridLevel
        GridView = tv
      end
    end
  end
  object paFilter: TPanel
    Left = 41
    Top = 200
    Width = 505
    Height = 21
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 0
      Top = 2
      Width = 42
      Height = 13
      Caption = #1060#1080#1083#1100#1090#1088':'
    end
    object teFilter: TcxTextEdit
      Left = 45
      Top = 0
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 0
      OnClick = teFilterClick
      OnEnter = teFilterEnter
      OnKeyUp = teFilterKeyUp
      Width = 460
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 506
    Width = 556
    Height = 39
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 7
    object bOk: TcxButton
      Left = 393
      Top = 7
      Width = 75
      Height = 25
      Action = aOk
      TabOrder = 0
    end
    object bCancel: TcxButton
      Left = 473
      Top = 7
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
    end
  end
  object BM: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102)
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 24
    Top = 384
    DockControlHeights = (
      0
      0
      0
      0)
    object BMBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Custom1'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 382
      FloatTop = 134
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarControlContainerItem1'
        end
        item
          Visible = True
          ItemName = 'bbClear'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbClear: TdxBarButton
      Action = aClear
      Category = 0
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000000000000000
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
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Category = 0
      Visible = ivAlways
      Control = paFilter
    end
  end
  object al: TActionList
    Left = 24
    Top = 328
    object aOk: TAction
      Caption = #1054#1082
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080' '#1085#1072#1079#1085#1072#1095#1080#1090#1100' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aClear: TAction
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1092#1080#1083#1100#1090#1088#1072
      ShortCut = 119
      OnExecute = aClearExecute
    end
  end
  object odsKab: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT KK.FK_KABSOOTVETID AS FK_ID,'
      '                S.FC_NAME AS FC_NAME'
      
        '  FROM ASU.TNAZVRACH NAZ, ASU.TKABINET KAB, ASU.TKABSOOTVETKAB K' +
        'K, ASU.TKABSOOTVET S'
      ' WHERE FK_SOTRID = :PSOTR'
      '   AND NAZ.FK_KABINETID = KAB.FK_ID'
      '   AND KK.FK_KABINETID = KAB.FK_ID'
      '   AND S.FK_ID = KK.FK_KABSOOTVETID'
      ' ORDER BY FC_NAME')
    Optimize = False
    Variables.Data = {0300000001000000060000003A50534F5452030000000000000000000000}
    Session = frmMain.os
    BeforeOpen = odsKabBeforeOpen
    Left = 195
    Top = 243
  end
  object odsNaz: TOracleDataSet
    SQL.Strings = (
      'select t1.fk_smid,'
      
        '       ltrim(lower(asu.get_smidname(asu.get_smidowner(t1.fk_smid' +
        ')))||'#39': '#39'||lower(asu.get_smidname(t1.fk_smid)),'#39': '#39') as namenaz,'
      '       t1.fk_sotrid,'
      '       asu.do_vrachfio(t1.fk_sotrid) as sotrfio,'
      '       t2.fl_showanal '
      '  from asu.tsmid_rights t1, asu.tsmid t2'
      ' where t1.fk_sotrid = :pfk_sotrid'
      '   and t1.fk_smid = t2.fk_id'
      '   and t2.fl_showanal = :pshowanal'
      '   and t2.fl_del = 0')
    Optimize = False
    Variables.Data = {
      03000000020000000B0000003A50464B5F534F54524944030000000000000000
      0000000A0000003A5053484F57414E414C030000000000000000000000}
    Session = frmMain.os
    BeforeOpen = odsNazBeforeOpen
    AfterOpen = odsNazAfterOpen
    Left = 379
    Top = 243
  end
  object dsKab: TDataSource
    DataSet = odsKab
    Left = 163
    Top = 243
  end
  object dsNaz: TDataSource
    DataSet = odsNaz
    Left = 339
    Top = 243
  end
  object odsType: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME'
      '  FROM ASU.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'NAZN_TYPES'#39')'
      'ORDER BY FN_ORDER')
    Optimize = False
    Session = frmMain.os
    Left = 299
    Top = 349
  end
  object dsType: TDataSource
    DataSet = odsType
    Left = 251
    Top = 349
  end
end
