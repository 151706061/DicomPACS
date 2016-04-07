object frmDolg: TfrmDolg
  AlignWithMargins = True
  Left = 110
  Top = 102
  Margins.Top = 0
  Caption = #1044#1086#1083#1075#1080' '#1087#1086' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103#1084
  ClientHeight = 473
  ClientWidth = 1136
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1130
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object cxGr: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 1130
    Height = 436
    Margins.Top = 0
    Align = alClient
    DragMode = dmAutomatic
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PopupMenu = pmTV
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    ExplicitLeft = 0
    ExplicitTop = 28
    ExplicitWidth = 1136
    ExplicitHeight = 445
    object TVList: TcxGridDBTableView
      DragMode = dmAutomatic
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'FK_ID'
          Column = TVListNAZ
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.DragDropText = True
      OptionsBehavior.DragFocusing = dfDragOver
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      object TVREANIM: TcxGridDBColumn
        Caption = '_'
        DataBinding.FieldName = 'IS_REANIM'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            ImageIndex = 1
            Value = '1'
          end>
        Width = 30
      end
      object TVDATENAZ: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1085#1072#1079'.'
        DataBinding.FieldName = 'FD_NAZ'
        Width = 94
      end
      object TVListDATERUN: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1074#1099#1087'.'
        DataBinding.FieldName = 'FD_RUN'
        Width = 91
      end
      object TVListFIO: TcxGridDBColumn
        Caption = #1060#1048#1054
        DataBinding.FieldName = 'FIOPAC'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 137
      end
      object TVListDATEROJD: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
        DataBinding.FieldName = 'FD_ROJD'
        Width = 126
      end
      object TVListDS: TcxGridDBColumn
        Caption = 'DS '#1090#1077#1082#1091#1097#1080#1081
        DataBinding.FieldName = 'FC_DIAG'
        Width = 103
      end
      object TVListNAZ: TcxGridDBColumn
        Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        Width = 57
      end
      object TVOTDEL: TcxGridDBColumn
        Caption = #1050#1077#1084' '#1085#1072#1087#1088#1072#1074#1083#1077#1085
        DataBinding.FieldName = 'OTDEL'
        Width = 119
      end
      object TVSTATE: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1091#1089
        DataBinding.FieldName = 'STATE'
        Width = 46
      end
      object TVListPARAM: TcxGridDBColumn
        Caption = #1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'PARAM'
        Width = 47
      end
      object TVSEX: TcxGridDBColumn
        Caption = #1055#1086#1083
        DataBinding.FieldName = 'SEX'
        Width = 56
      end
      object TVTIME_ISL: TcxGridDBColumn
        Caption = #1042#1088#1077#1084#1103' '#1074#1099#1087'.'
        DataBinding.FieldName = 'TIME_ISL'
        Width = 69
      end
      object TVNAZTYPE: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'FC_TYPE'
        Width = 37
      end
      object TVFK_NAZTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'FK_NAZTYPEID'
        Visible = False
        VisibleForCustomization = False
      end
      object TVSOS: TcxGridDBColumn
        Caption = '_'
        DataBinding.FieldName = 'FK_NAZSOSID'
        Visible = False
        VisibleForCustomization = False
      end
      object TVListAGE: TcxGridDBColumn
        Caption = #1042#1086#1079#1088#1072#1089#1090
        DataBinding.FieldName = 'AGE'
        Width = 110
      end
      object VListFK_ID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_ID'
        Visible = False
        VisibleForCustomization = False
      end
      object VListPACID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_PACID'
        Visible = False
        VisibleForCustomization = False
      end
      object VListSMID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_SMID'
        Visible = False
        VisibleForCustomization = False
      end
    end
    object cxGrLevel1: TcxGridLevel
      GridView = TVList
    end
  end
  object pnlKab: TPanel
    Left = 457
    Top = 34
    Width = 240
    Height = 19
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 6
    object Label4: TLabel
      Left = 0
      Top = 3
      Width = 45
      Height = 13
      Caption = #1050#1072#1073#1080#1085#1077#1090':'
    end
    object cxlcRoom: TcxLookupComboBox
      Left = 49
      Top = 0
      Hint = #1043#1088#1091#1087#1087#1099' '#1076#1080#1072#1075#1085#1086#1079#1086#1074
      Properties.AutoSelect = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.HideSelection = False
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsKab
      Properties.ReadOnly = False
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 0
      Width = 191
    end
  end
  object BM: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clBtnFace
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 322
    Top = 189
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
      Caption = 'Main'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 404
      FloatTop = 232
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarControlContainerItem1'
        end
        item
          Visible = True
          ItemName = 'dxDate'
        end
        item
          Visible = True
          ItemName = 'bb4'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bb2'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bb3'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRanee'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bb5'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bb1'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Main'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bb1: TdxBarButton
      Action = actClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bb2: TdxBarButton
      Action = actRefresh
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bb3: TdxBarButton
      Action = actOtmena
      Category = 0
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
      PaintStyle = psCaptionGlyph
    end
    object dxDate: TdxBarDateCombo
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103':'
      Category = 0
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103':'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      ShowCaption = True
      Width = 100
    end
    object bb4: TdxBarButton
      Action = actLoad
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000DB6900E48400E68300C25E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000E47F00D87600DA8919EEAD5FECAD5AE7870000000000000000
        0000000000000000C15700900000000000000000000000000000000000000000
        000000000000EA7B00D06E00D87A03E4973DFBBF7FFFD09DFFCE9CFFD4ABE98F
        06000000000000000000000000000000B84F00BB520000000000000000000000
        0000000000C36100CB6400CB6600D48120EFA659FFC689FFC68CFFC78DFFC78F
        FFC993FFCFA0E49A2EF18200000000000000000000B94300AB4900BE4D000000
        00000000000000000000D35100C06502E18F3CFEB66BFFC07CFFC07CFFC080FF
        C284FFC48AFFC68DFFC890FFCD9AEBA955E38600000000000000000000A64200
        AD4B02B34A00000000000000000000000000D46100DC842BFFE5C0FFC586FFC2
        81FFC281FFC181FFC282FFC386FFC58AFFC68DFFC992F8BD7DDF7F0000000000
        0000000000A44100C9650FB64A00000000000000000000000000000000D36700
        D3781DD48028D37E22CE7818EEA453FFC183FFC184FFC387FFC58AFFC58DFFCC
        98DC7F00000000000000000000A74300DF7817B6470000000000000000000000
        0000000000000000C97100D66800A44F00BF6200FEBA75FFBF7EFFC081FFC284
        FFC388FFC588FFCA93D98823E68B00000000000000B14C04EC821BB249000000
        00000000000000000000000000000000000000000000CA6500DD8D36FFC17BFF
        BE7BFFC080FFC184FEBE7EFFC387FFC58DE49B47C16B00000000000000B34E05
        FF9622AD4400000000000000000000000000000000000000000000D16700C266
        05FFBC74FFBA74FFBB76FFC180E59946CB740BFFCA90FFC485F3B26AC1660000
        0000000000AA4602FF9E24B95506B44600000000000000000000000000000000
        C26100B75800F5A655FFB86DFFB96EFFBA76FFBE7BC56900CA6700E69E4FFFCA
        92FFC586C365000000000000009B3900FF961DF0851BA34400C32A0000000000
        0000000000C16100B45100E99440FFB668FFB366FFB56CFFBF78D88327D77100
        000000CD6B00FCCC9BFFDBACC368030000000000009A3800EA7D14FF961FEA7F
        1AAF4E00AF4900B74C00B54E00BC5B07F19B44FFB25FFFAF5DFFB262FFB96DEB
        9D4CC46300000000000000DD7300CA700CD1791ACC6900000000000000AF4000
        BB5205FF9C28FF931EFF9927F08B27E68628F29639FFAD51FFAC52FFAB54FFAD
        59FFB566F5A655B85C00DF4400000000000000000000C36200CE550000000000
        0000000000000000A83D00E57C19FFA43FFF921EFF9727FF9C34FFA03EFFA445
        FFA649FFA94FFFBB70F4A250B75800D761000000000000000000000000000000
        00000000000000000000000000000000B13900A13A00E47B1AFFB55CFFB15AFF
        A84DFFA94EFFB262FFC07AFFC077DE8630AC5700D15100000000000000000000
        000000000000000000000000000000000000000000000000000000B03900A93D
        00BC5100E38024FCA54BFFB15AF8A44FDF7F28BB5807B05500FF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000B13E00B04000AD4000AF4300B04700B74B00B646000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object bb5: TdxBarButton
      Action = actPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = pnlKab
      Left = 744
      Top = 104
    end
    object bbRanee: TdxBarButton
      Action = actPac
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object actlstDolg: TActionList
    Images = frmMain.ilMain
    Left = 322
    Top = 95
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ImageIndex = 3
      ShortCut = 27
      OnExecute = actCloseExecute
    end
    object actOtmena: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
      ShortCut = 119
      OnExecute = actOtmenaExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 25
      ShortCut = 116
      Visible = False
      OnExecute = actRefreshExecute
    end
    object actLoad: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1091#1102' '#1076#1072#1090#1091'  '
      ShortCut = 13
      OnExecute = actLoadExecute
    end
    object actText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 6
      OnExecute = actTextExecute
    end
    object actWeb: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 7
      OnExecute = actWebExecute
    end
    object actXML: TAction
      Caption = 'XML-'#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 8
      OnExecute = actXMLExecute
    end
    object actXLS: TAction
      Caption = 'MS Excel '#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 9
      OnExecute = actXLSExecute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 10
      ShortCut = 16464
      OnExecute = actPrintExecute
    end
    object actCopyFIO: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1060#1048#1054
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1060#1048#1054
      ImageIndex = 36
      OnExecute = actCopyFIOExecute
    end
    object actPac: TAction
      Caption = #1055#1072#1094#1080#1077#1085#1090
      ImageIndex = 15
      OnExecute = actPacExecute
    end
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      
        'SELECT ROWID, FK_ID, FK_SMID, FD_NAZ, TO_CHAR(FD_RUN, '#39'DD.MM.YYY' +
        'Y'#39') FD_RUN, FD_RUN AS RUNTIME, FK_PACID, FK_NAZSOSID, FK_ISPOLID' +
        ', FK_VRACHID, FK_DOCID,'
      '       asu.PKG_REGIST_PACFUNC.GET_PAC_FIO(FK_PACID) FIOPAC,'
      
        '       (SELECT FD_ROJD FROM asu.TPEOPLES WHERE FK_ID = (SELECT F' +
        'K_PEPLID FROM asu.TKARTA WHERE FK_ID = ISL.FK_PACID '
      '                                                         UNION '
      
        '                                                        SELECT F' +
        'K_PEPLID FROM asu.TAMBULANCE WHERE FK_ID = ISL.FK_PACID)) FD_ROJ' +
        'D,  '
      '       asu.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(ISL.FK_PACID) AGE,'
      
        '       SUBSTR(asu.PKG_REGIST_PACFUNC.GET_PAC_SEX(FK_PACID), 1, 1' +
        ') AS SEX,'
      '       ISL.FC_NAME, '
      '       asu.PKG_LISTS.GET_DIAG_MAIN(FK_PACID) FC_DIAG,'
      '       ASU.PKG_NAZ.GET_NAZPARAM1(FK_ID) PARAM,'
      '       asu.PKG_REGIST_PACFUNC.GET_PEPL_ID(FK_PACID) AS PEPLID,'
      '       DECODE(ISL.FK_NAZSOSID, 2, '#39#1053#1045' '#1042#1067#1055'.'#39') STATE,'
      '       TO_CHAR(FD_RUN, '#39'HH24:MI'#39') AS TIME_ISL, FK_ROOMID,'
      '       asu.GET_NAPRAVLEN(ISL.FK_PACID, ISL.FK_ID) AS OTDEL, '
      '       asu.GET_SMIDNAME(FK_NAZTYPEID) AS FC_TYPE, FK_NAZTYPEID,'
      '       asu.IS_AMBULANCE(ISL.FK_PACID) AS IS_AMBULANCE, '
      '       asu.PKG_LISTS.GET_PAC_KONTROL(ISL.FK_PACID) AS IS_REANIM'
      ''
      '  FROM asu.TNAZIS ISL'
      ' WHERE FK_NAZSOSID = ASU.GET_NEVIP'
      '   AND FK_SMID IN (SELECT FK_ID'
      '                       FROM asu.TSMID'
      '                        WHERE FL_SHOWANAL = 1 '
      '                          AND FL_DEL = 0 '
      '                       CONNECT BY PRIOR FK_ID = FK_OWNER'
      '                       START WITH FK_ID = ASU.GET_RG_ISSL) '
      '   AND ISL.FK_ROOMID = :PFK_ROOMID'
      '   AND TRUNC(FD_RUN) <= TO_DATE(:PFD_DATE)'
      'ORDER BY FD_NAZ'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    Variables.Data = {
      0300000002000000090000003A5046445F444154450C00000000000000000000
      000B0000003A50464B5F524F4F4D4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001D00000005000000464B5F494401000000000007000000464B5F534D
      49440100000000000600000046445F4E415A0100000000000700000046435F4E
      414D4501000000000008000000565241434846494F0100000000000600000046
      494F5041430100000000000700000046445F524F4A4401000000000003000000
      4147450100000000000700000046435F44494147010000000000050000005041
      52414D01000000000008000000464B5F50414349440100000000000B00000046
      4B5F4E415A534F5349440100000000000A000000464B5F4953504F4C49440100
      00000000060000005045504C49440100000000000600000046445F52554E0100
      0000000003000000534558010000000000050000005354415445010000000000
      0800000054494D455F49534C01000000000009000000464B5F524F4F4D494401
      0000000000050000004F5444454C0100000000000700000046435F5459504501
      00000000000C000000464B5F4E415A5459504549440100000000000A00000046
      4B5F565241434849440100000000000C00000049535F414D42554C414E434501
      0000000000080000004953504F4C46494F01000000000008000000464B5F444F
      434944010000000000070000005649444C454348010000000000070000005255
      4E54494D450100000000000900000049535F5245414E494D010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    Session = frmMain.os
    BeforeOpen = odsListBeforeOpen
    AfterScroll = odsListAfterScroll
    Left = 185
    Top = 115
    object odsListFK_ID: TFloatField
      FieldName = 'FK_ID'
      Required = True
    end
    object odsListFK_SMID: TFloatField
      FieldName = 'FK_SMID'
    end
    object odsListFD_NAZ: TDateTimeField
      FieldName = 'FD_NAZ'
    end
    object odsListFK_PACID: TFloatField
      FieldName = 'FK_PACID'
    end
    object odsListFK_NAZSOSID: TFloatField
      FieldName = 'FK_NAZSOSID'
    end
    object odsListFK_ISPOLID: TFloatField
      FieldName = 'FK_ISPOLID'
    end
    object odsListFIOPAC: TStringField
      FieldName = 'FIOPAC'
      Size = 4000
    end
    object odsListFD_ROJD: TDateTimeField
      FieldName = 'FD_ROJD'
    end
    object odsListAGE: TFloatField
      FieldName = 'AGE'
    end
    object odsListFC_NAME: TStringField
      FieldName = 'FC_NAME'
      Size = 100
    end
    object odsListFC_DIAG: TStringField
      FieldName = 'FC_DIAG'
      Size = 4000
    end
    object odsListPARAM: TStringField
      FieldName = 'PARAM'
      Size = 4000
    end
    object odsListPEPLID: TFloatField
      FieldName = 'PEPLID'
    end
    object odsListSEX: TStringField
      FieldName = 'SEX'
      Size = 1
    end
    object odsListSTATE: TStringField
      DisplayWidth = 100
      FieldName = 'STATE'
      Size = 100
    end
    object odsListTIME_ISL: TStringField
      FieldName = 'TIME_ISL'
      Size = 5
    end
    object odsListFK_ROOMID: TIntegerField
      FieldName = 'FK_ROOMID'
      Required = True
    end
    object odsListOTDEL: TStringField
      FieldName = 'OTDEL'
      Size = 4000
    end
    object odsListFC_TYPE: TStringField
      FieldName = 'FC_TYPE'
      Size = 4000
    end
    object odsListFK_NAZTYPEID: TFloatField
      FieldName = 'FK_NAZTYPEID'
    end
    object odsListFK_VRACHID: TFloatField
      FieldName = 'FK_VRACHID'
    end
    object odsListIS_AMBULANCE: TFloatField
      FieldName = 'IS_AMBULANCE'
    end
    object odsListFD_RUN: TStringField
      FieldName = 'FD_RUN'
      Size = 10
    end
    object odsListFK_DOCID: TFloatField
      FieldName = 'FK_DOCID'
    end
    object odsListRUNTIME: TDateTimeField
      FieldName = 'RUNTIME'
    end
    object odsListIS_REANIM: TFloatField
      FieldName = 'IS_REANIM'
    end
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 185
    Top = 163
  end
  object pmTV: TPopupMenu
    Images = frmMain.ilMain
    Left = 402
    Top = 97
    object N1: TMenuItem
      Action = actPrint
    end
    object MenuItem3: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 5
      object MenuItem4: TMenuItem
        Action = actText
      end
      object MenuItem5: TMenuItem
        Action = actWeb
      end
      object MenuItem6: TMenuItem
        Action = actXML
      end
      object MenuItem7: TMenuItem
        Action = actXLS
      end
    end
    object N3: TMenuItem
      Action = actCopyFIO
    end
    object N2: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 27
      OnClick = N2Click
    end
  end
  object sdPopUp: TSaveDialog
    Left = 825
    Top = 203
  end
  object frxPrintList: TfrxReport
    Version = '4.7.21'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39325.633441655100000000
    ReportOptions.LastChange = 40040.553094131940000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxPrintListGetValue
    Left = 575
    Top = 166
    Datasets = <
      item
        DataSet = frxDBPrintDolg
        DataSetName = 'frxDBPrintDolg'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 7.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 85.929190000000000000
        Top = 18.897650000000000000
        Width = 1077.166050000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 349.734830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1056#8221#1056#1109#1056#187#1056#1110' '#1056#1105#1057#1027'c'#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#8470' '#1056#1029#1056#176' [DATESTR]. '#1056#1113#1056#176#1056#177#1056#1105#1056#1029#1056#181#1057#8218':' +
              ' [KAB]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 158.740260000000000000
          Top = 67.031540000000010000
          Width = 219.391540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1112#1056#1105#1056#187#1056#1105#1057#1039' '#1056#152#1056#1112#1057#1039' '#1056#1115#1057#8218#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 377.953000000000000000
          Top = 67.031540000000010000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 411.968770000000000000
          Top = 67.031540000000010000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8220#1056#1109#1056#1169' '#1057#1026#1056#1109#1056#182#1056#1169'.')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 498.897960000000000000
          Top = 67.031540000000010000
          Width = 165.951540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#181#1056#1112' '#1056#1029#1056#176#1056#1111#1057#1026#1056#176#1056#1030#1056#187#1056#181#1056#1029)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 665.197280000000000000
          Top = 67.031540000000010000
          Width = 408.189240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 67.031540000000010000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1029#1056#176#1056#183'.')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 75.590600000000000000
          Top = 67.031540000000010000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1030#1057#8249#1056#1111'.')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 899.528140000000000000
          Top = 37.795300000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            '[SYSDATE]')
        end
        object Memo18: TfrxMemoView
          Left = 3.779530000000000000
          Width = 1069.606990000000000000
          Height = 34.015770000000010000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]'
            '[OTDELNAME]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.677180000000000000
        Top = 166.299320000000000000
        Width = 1077.166050000000000000
        DataSet = frxDBPrintDolg
        DataSetName = 'frxDBPrintDolg'
        RowCount = 0
        Stretched = True
        object Memo9: TfrxMemoView
          Left = 158.740260000000000000
          Width = 219.391540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBPrintDolg."FIOPAC"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 377.953000000000000000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBPrintDolg."SEX"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 411.968770000000000000
          Width = 87.169870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBPrintDolg."FD_ROJD"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 498.897960000000000000
          Width = 165.951540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBPrintDolg."OTDEL"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 665.197280000000000000
          Width = 408.189240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBPrintDolg."FC_NAME"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBPrintDolg."FD_NAZ"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 75.590600000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBPrintDolg."RUNTIME"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 245.669450000000000000
        Width = 1077.166050000000000000
        object Memo16: TfrxMemoView
          Left = 3.779530000000000000
          Width = 1069.606990000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADESIGN]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBPrintDolg: TfrxDBDataset
    UserName = 'frxDBPrintDolg'
    CloseDataSource = False
    DataSource = dsList
    Left = 636
    Top = 165
  end
  object dsKab: TDataSource
    DataSet = odsKab
    Left = 40
    Top = 200
  end
  object odsKab: TOracleDataSet
    SQL.Strings = (
      
        'SELECT DISTINCT KAB.FK_ID, KAB.FC_NAME, KAB.FN_ORDER, KAB.FC_PHO' +
        'NE'
      '  FROM TNAZVRACH NAZ, TKABINET KAB'
      'WHERE FK_SOTRID = :PSOTR'
      '  AND NAZ.FK_KABINETID = KAB.FK_ID'
      'ORDER BY KAB.FN_ORDER')
    Optimize = False
    Variables.Data = {0300000001000000060000003A50534F5452030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000080000004643
      5F50484F4E45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsKabBeforeOpen
    Left = 40
    Top = 248
  end
end
