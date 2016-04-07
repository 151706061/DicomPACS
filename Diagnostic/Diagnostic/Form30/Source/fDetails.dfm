object frmDetails: TfrmDetails
  Left = 231
  Top = 85
  Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
  ClientHeight = 464
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object cxGr: TcxGrid
    Left = 0
    Top = 30
    Width = 854
    Height = 434
    Align = alClient
    TabOrder = 0
    ExplicitTop = 28
    ExplicitHeight = 436
    object TVDetails: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsDetails
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'FK_ID'
          Column = TVISSLNAME
        end
        item
          Kind = skSum
          FieldName = 'KOLVO'
          Column = TVSNIMKI
        end
        item
          Kind = skSum
          FieldName = 'KOLVOPRSV'
          Column = TVPROSV
        end
        item
          Kind = skSum
          FieldName = 'DOZA'
          Column = TVDOZA
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object TVKABINET: TcxGridDBColumn
        Caption = #1050#1072#1073#1080#1085#1077#1090
        DataBinding.FieldName = 'KABNAME'
        Width = 84
      end
      object TVDATENAZ: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1085#1072#1079'.'
        DataBinding.FieldName = 'FD_NAZ'
        Width = 72
      end
      object TVDATERUN: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1074#1099#1087'.'
        DataBinding.FieldName = 'FD_RUN'
        VisibleForCustomization = False
        Width = 70
      end
      object TVFIOPAC: TcxGridDBColumn
        Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
        DataBinding.FieldName = 'FIOPAC'
        VisibleForCustomization = False
        Width = 161
      end
      object TVISSLNAME: TcxGridDBColumn
        Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'ISSLNAME'
        VisibleForCustomization = False
        Width = 260
      end
      object TVSNIMKI: TcxGridDBColumn
        Caption = #1057#1085#1080#1084#1082#1080
        DataBinding.FieldName = 'KOLVO'
        Width = 65
      end
      object TVPROSV: TcxGridDBColumn
        Caption = #1055#1088#1086#1089#1074#1077#1095#1080#1074#1072#1085#1080#1103
        DataBinding.FieldName = 'KOLVOPRSV'
        Width = 62
      end
      object TVDOZA: TcxGridDBColumn
        Caption = #1044#1086#1079#1072
        DataBinding.FieldName = 'DOZA'
        Width = 66
      end
    end
    object cxGrLevel1: TcxGridLevel
      GridView = TVDetails
    end
  end
  object dxBarDockControl1: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 854
    Height = 30
    Align = dalTop
    BarManager = BMDetails
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object alDetails: TActionList
    Images = frmMain.IL
    Left = 624
    Top = 96
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ImageIndex = 0
      ShortCut = 27
      OnExecute = aCloseExecute
    end
  end
  object BMDetails: TdxBarManager
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
    ImageOptions.Images = frmMain.IL
    PopupMenuLinks = <>
    Style = bmsXP
    UseSystemFont = True
    Left = 624
    Top = 40
    DockControlHeights = (
      0
      0
      0
      0)
    object BMDetailsBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'MainDetails'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 181
      FloatTop = 85
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbClose'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbClose: TdxBarButton
      Action = aClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object odsDetails: TOracleDataSet
    SQL.Strings = (
      'SELECT TNAZIS.FK_ID,'
      '       TNAZIS.FK_NAZSOSID,'
      '       TNAZIS.FK_SMID,'
      '       TNAZIS.FD_NAZ,'
      
        '       TNAZIS.FD_RUN, TO_CHAR(TNAZIS.FD_RUN, '#39'DD.MM.YYYY HH24:MI' +
        #39') AS FD_RUN_TIME,'
      
        '       (SELECT FC_NAME FROM TKABINET WHERE FK_ID = TNAZIS.FK_ROO' +
        'MID) AS KABNAME,'
      '       ASU.GET_NAME_RGISSL(TNAZIS.FK_SMID) AS ISSLNAME,'
      '       PKG_REGIST_PACFUNC.GET_PAC_FIO(TNAZIS.FK_PACID) FIOPAC,'
      
        '       (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND' +
        ' FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      
        '       (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND' +
        ' FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'XRAY_KO' +
        'LVOUCHET'#39')) AS KOLVO,'
      
        '       (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND' +
        ' FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'XRAY_KO' +
        'LVOPRSV'#39')) AS KOLVOPRSV        '
      ''
      
        '  FROM ASU.TNAZIS, ASU.TPODPISNAZ, (SELECT FK_ID FROM TSMID WHER' +
        'E FC_SYNONIM = '#39'TARGET_DIAGNOSTIKA'#39') DG'
      ' WHERE TNAZIS.FK_ID = TPODPISNAZ.FK_NAZID '
      '   AND TPODPISNAZ.FK_SOS = ASU.GET_LABVIP'
      '   AND TNAZIS.FK_SMID IN (SELECT FK_SMID '
      '                            FROM ASU.TS_COLUMNNAZ '
      
        '                           WHERE FK_OWNER IN (SELECT FK_ID FROM ' +
        'ASU.TS_COLUMNNAZ WHERE FC_SYNONIM = '#39'5110_1_3'#39'))   '
      
        '   AND DG.FK_ID IN (SELECT FK_SMID FROM ASU.TIB WHERE FK_PACID =' +
        ' TNAZIS.FK_ID)'
      '   AND TNAZIS.FD_RUN >= :pdate1'
      '   AND TNAZIS.FD_RUN <= :pdate2'
      '--   :ISPOLID'
      '--   :KABID'
      '--   :DEZID')
    Optimize = False
    Variables.Data = {
      0300000002000000070000003A5044415445310C000000000000000000000007
      0000003A5044415445320C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C00000005000000464B5F49440100000000000B000000464B5F4E41
      5A534F53494401000000000007000000464B5F534D4944010000000000060000
      0046445F4E415A0100000000000600000046445F52554E0100000000000B0000
      0046445F52554E5F54494D45010000000000070000004B41424E414D45010000
      000000080000004953534C4E414D450100000000000600000046494F50414301
      000000000004000000444F5A41010000000000050000004B4F4C564F01000000
      0000090000004B4F4C564F50525356010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsDetailsBeforeOpen
    Left = 408
    Top = 152
    object odsDetailsFK_ID: TFloatField
      FieldName = 'FK_ID'
      Required = True
    end
    object odsDetailsFK_NAZSOSID: TFloatField
      FieldName = 'FK_NAZSOSID'
    end
    object odsDetailsFK_SMID: TFloatField
      FieldName = 'FK_SMID'
    end
    object odsDetailsFD_NAZ: TDateTimeField
      FieldName = 'FD_NAZ'
    end
    object odsDetailsFD_RUN: TDateTimeField
      FieldName = 'FD_RUN'
    end
    object odsDetailsFD_RUN_TIME: TStringField
      FieldName = 'FD_RUN_TIME'
      Size = 16
    end
    object odsDetailsKABNAME: TStringField
      FieldName = 'KABNAME'
      Size = 100
    end
    object odsDetailsISSLNAME: TStringField
      FieldName = 'ISSLNAME'
      Size = 4000
    end
    object odsDetailsFIOPAC: TStringField
      FieldName = 'FIOPAC'
      Size = 4000
    end
    object odsDetailsDOZA: TFloatField
      FieldName = 'DOZA'
    end
    object odsDetailsKOLVO: TFloatField
      FieldName = 'KOLVO'
    end
    object odsDetailsKOLVOPRSV: TFloatField
      FieldName = 'KOLVOPRSV'
    end
  end
  object dsDetails: TDataSource
    DataSet = odsDetails
    Left = 296
    Top = 112
  end
end
