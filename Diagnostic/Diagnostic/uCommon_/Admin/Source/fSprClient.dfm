object frmSprClient: TfrmSprClient
  Left = 309
  Top = 95
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1083#1080#1077#1085#1090#1086#1074
  ClientHeight = 473
  ClientWidth = 862
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 249
    Height = 473
    Align = alLeft
    BevelOuter = bvNone
    Color = clCream
    ParentBackground = False
    TabOrder = 2
    object grTaxi: TcxGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 246
      Height = 467
      Margins.Right = 0
      Align = alClient
      TabOrder = 0
      LookAndFeel.SkinName = 'Caramel'
      object TVTAXI: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsTaxi
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = VTAXI_NAME
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
        object VTAXI_NAME: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_NAME'
        end
      end
      object grTaxiLevel1: TcxGridLevel
        GridView = TVTAXI
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 249
    Top = 0
    Width = 8
    Height = 473
    HotZoneClassName = 'TcxXPTaskBarStyle'
    HotZone.SizePercent = 59
    Control = Panel1
  end
  object Panel2: TPanel
    Left = 257
    Top = 0
    Width = 605
    Height = 473
    Align = alClient
    BevelOuter = bvNone
    Color = clCream
    ParentBackground = False
    TabOrder = 6
    object grList: TcxGrid
      AlignWithMargins = True
      Left = 0
      Top = 32
      Width = 602
      Height = 438
      Margins.Left = 0
      Margins.Top = 0
      Align = alClient
      TabOrder = 0
      LookAndFeel.SkinName = 'Caramel'
      object TVLIST: TcxGridDBTableView
        PopupMenu = pmTV
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsList
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = VLIST_NUM
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
        object VLIST_NUM: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088' '#1082#1083#1080#1077#1085#1090#1072
          DataBinding.FieldName = 'FC_NUM'
        end
        object VLIST_KOD: TcxGridDBColumn
          Caption = #1050#1086#1076#1086#1074#1086#1077' '#1089#1083#1086#1074#1086
          DataBinding.FieldName = 'FC_KOD'
        end
        object VLIST_ADR: TcxGridDBColumn
          Caption = #1044#1086#1084#1072#1096#1085#1080#1081' '#1072#1076#1088#1077#1089
          DataBinding.FieldName = 'FC_ADR'
        end
        object VLIST_NOW: TcxGridDBColumn
          Caption = #1058#1077#1082#1091#1097#1072#1103' '#1087#1086#1077#1079#1076#1082#1072
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
        end
        object VLIST_BONUS: TcxGridDBColumn
          Caption = #1041#1086#1085#1091#1089#1085#1099#1077' '#1087#1086#1077#1079#1076#1082#1080
          DataBinding.FieldName = 'FN_BONUS'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = TVLIST
      end
    end
    object dxBarDockControl1: TdxBarDockControl
      AlignWithMargins = True
      Left = 0
      Top = 3
      Width = 602
      Height = 26
      Margins.Left = 0
      Align = dalTop
      BarManager = BM
    end
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 412
    Top = 123
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'select *'
      '  from taxi.ts_client'
      ' where fl_del = 0'
      '   and fk_taxiid = :pfk_taxiid'
      'order by fc_num')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50464B5F544158494944030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A00000005000000464B5F494401000000000006000000464C5F4445
      4C0100000000000600000046435F4144520100000000000600000046435F4E55
      4D0100000000000600000046435F4B4F440100000000000A000000464B5F5041
      595459504501000000000008000000464E5F424F4E5553010000000000060000
      00464E5F4E4F5701000000000008000000464C5F4E454F504C01000000000007
      000000464E5F444F4C47010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 652
    Top = 139
  end
  object BM: TdxBarManager
    AllowReset = False
    AutoDockColor = False
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
    DockColor = clBtnFace
    ImageOptions.Images = frmMain.IL
    LookAndFeel.SkinName = 'Caramel'
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 388
    Top = 275
    DockControlHeights = (
      0
      0
      0
      0)
    object BMBar2: TdxBar
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
      FloatLeft = 168
      FloatTop = 51
      FloatClientWidth = 78
      FloatClientHeight = 156
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbAddTarif'
        end
        item
          Visible = True
          ItemName = 'bbEditTarif'
        end
        item
          Visible = True
          ItemName = 'bbDelTarif'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbTel'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefTarif'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPrintTarif'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbClose'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbAddTaxi: TdxBarButton
      Caption = 'aAddTaxi'
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1072#1082#1089#1080
      Visible = ivAlways
      ImageIndex = 4
    end
    object bbAddTarif: TdxBarButton
      Action = aAdd
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEditTarif: TdxBarButton
      Action = aEdit
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDelTarif: TdxBarButton
      Action = aDel
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefTarif: TdxBarButton
      Action = aRefresh
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPrintTarif: TdxBarButton
      Action = aPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbClose: TdxBarButton
      Action = aClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEditTaxi: TdxBarButton
      Caption = 'aEditTaxi'
      Category = 0
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1072#1082#1089#1080
      Visible = ivAlways
      ImageIndex = 0
    end
    object bbDelTaxi: TdxBarButton
      Caption = 'aDelTaxi'
      Category = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1072#1082#1089#1080
      Visible = ivAlways
      ImageIndex = 1
    end
    object bbRefTaxi: TdxBarButton
      Caption = 'aRefreshTaxi'
      Category = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      Visible = ivAlways
      ImageIndex = 5
    end
    object dxBarButton1: TdxBarButton
      Caption = 'aPrintTaxi'
      Category = 0
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1090#1072#1082#1089#1080
      Visible = ivAlways
      ImageIndex = 2
    end
    object bbTel: TdxBarButton
      Action = aTel
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
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000004F4F4F4E4E4E4D4D4D4A4A4A4949494E4E
        4E00000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000004D4D4D6666667F7F7F6C6C6C
        5E5E5E5656564D4D4D4949494848484B4B4B0000000000000000000000000000
        000000000000000000000000000000000000000000000000004C4C4C63636384
        8484ADADADB8B8B8A0A0A08383836060605A5A5A5353534C4C4C494949494949
        4646460000000000000000000000000000000000000000000000000000004949
        495A5A5A898989A1A1A1FFFFFFDADADA9C9C9C707070D9D9D9D4D4D4A1A1A170
        70705252524E4E4E4A4A4A474747454545414141000000000000000000000000
        0000004B4B4B525252909090888888F4F4F4AEAEAEA7A7A7B9B9B9C0C0C07070
        70F5F5F5F5F7F7FAFBFBE6E6E6B0B0B07B7B7B5050504B4B4B3F3F3F40404000
        0000000000000000414141494949919191898989CDCDCDD0D0D08D8D8DFCFCFC
        F8F8F8FCFCFCD7D8D8B2A9A9D6BDBDD8CECEDDDEDEE3E4E4F4F5F5E9EAEAB4B4
        B47677773D3D3D0000000000002A2A2A474747909090929292A6A6A6EBEBEBB7
        B7B7B8B8B8EAEAEAE8E8E8ECECECC0C1C1C9C4C4EFDBDBB4A7A7E8D3D3DCBDBD
        CBC7C7D4C9C9DDD8D8F3F3F39999990000000000004040407777779E9E9E9393
        93E0E0E0C6C6C68D8D8DD4D4D4E0E0E0DEDEDEE4E4E4A09D9DCDBABAC2C3C3BD
        BFBFCFCACACCBCBCC8C1C1F3DCDCCFB7B7E3E5E58989890000000000003F3F3F
        848484989898CBCBCBBDBDBDA3A3A3828282D9D9D9D4D4D4D6D6D6D0D1D1B6AF
        AFDFC6C6BCB4B4EDD3D3CEB9B9C7C2C2BEB1B1C2BDBDCECECEAFB0B07E7E7E00
        00000000003C3C3C909090B8B8B8CBCBCBA0A0A06C6C6CC1C1C1CACACACACACA
        CFD0D09B9999BDABABBDBFBFB5B5B5CAC2C2A9A7A7F5E9E9E5CBCBC7C3C3C9CA
        CA818181555555000000000000373737AAAAAAC0C0C04D4D4D585858B3B3B3C1
        C1C1C0C0C0C2C2C2B0B0B0B1A9AACBB8B8C8BFBFEFD2D2BBADADD3C4C4BBA7A7
        B7B9B9CBCCCC898989898989000000000000000000515151D6D6D67373738888
        88B0B0B0B0B0B0B0B0B0B1B1B1B4B2B3818E84ADB3AEB8B3B8B7B1B4C3B7BAAE
        A8ABE7DADAC4B3B3C2C4C4959595878787000000000000000000000000888888
        A8A8A88B8B8B9E9E9E9C9C9C9D9D9D9E9E9EA1A0A1848D86A2F7B292F3A681DF
        997BCB9183C0958EBA9CA8ABAAB9BABA99999985858500000000000000000000
        00000000008E8E8E8585858282828A8A8A8C8C8C8D8D8D8E8E8E7E7D7E90AA93
        95CA9D8EDC9E86ED9E74EA935EE48563BB7FB2ADB09999998282820000000000
        000000000000000000000000000000000000008181817E7E7E79797979797976
        76768989898E8C8E949193928C908C888B8B978F85A18DA8A1A6918F90808080
        0000000000000000000000000000000000000000000000000000000000000000
        008484844141410000000000007F7F7F8282828181817D7C7D7F7D7F7F7C7E80
        7F80848484000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
  end
  object AL: TActionList
    Images = frmMain.IL
    Left = 572
    Top = 155
    object aAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1082#1083#1080#1077#1085#1090#1072
      ImageIndex = 4
      ShortCut = 115
      OnExecute = aAddExecute
    end
    object aEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1082#1083#1080#1077#1085#1090#1072
      ImageIndex = 0
      ShortCut = 114
      OnExecute = aEditExecute
    end
    object aDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1082#1083#1080#1077#1085#1090#1072
      ImageIndex = 1
      ShortCut = 119
      OnExecute = aDelExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1082#1083#1080#1077#1085#1090#1086#1074
      ImageIndex = 5
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 2
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1083#1080#1077#1085#1090#1086#1074
      ImageIndex = 3
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aXLS: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' Excel'
      ImageIndex = 6
      OnExecute = aXLSExecute
    end
    object aTel: TAction
      Caption = #1058#1077#1083#1077#1092#1086#1085#1099
      Hint = #1058#1077#1083#1077#1092#1086#1085#1099' '#1082#1083#1080#1077#1085#1090#1072
      ShortCut = 16468
      OnExecute = aTelExecute
    end
  end
  object frxList: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40516.999330289350000000
    ReportOptions.LastChange = 40708.787274236120000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxListGetValue
    Left = 744
    Top = 104
    Datasets = <
      item
        DataSet = frxDBList
        DataSetName = 'frxDBList'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 49.133890000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clMaroon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1038#1056#1111#1057#1026#1056#176#1056#1030#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108' '#1056#1108#1056#187#1056#1105#1056#181#1056#1029#1057#8218#1056#1109#1056#1030' - [TAXI]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 28.913420000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 52.913420000000000000
          Top = 28.913420000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 132.283550000000000000
          Top = 28.913420000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169#1056#1109#1056#1030#1056#1109#1056#181' '#1057#1027#1056#187#1056#1109#1056#1030#1056#1109)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 268.346630000000000000
          Top = 28.913420000000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#1112#1056#176#1057#8364#1056#1029#1056#1105#1056#8470' '#1056#176#1056#1169#1057#1026#1056#181#1057#1027)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 608.504330000000000000
          Top = 29.236240000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8216#1056#1109#1056#1029#1057#1107#1057#1027#1057#8249)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 128.504020000000000000
        Width = 755.906000000000000000
        DataSet = frxDBList
        DataSetName = 'frxDBList'
        RowCount = 0
        Stretched = True
        object Memo7: TfrxMemoView
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 52.913420000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBList."FC_NUM"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 132.283550000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clNone
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBList."FC_KOD"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 268.346630000000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clNone
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBList."FC_ADR"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 608.504330000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."FN_BONUS"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 207.874150000000000000
        Width = 755.906000000000000000
        object Memo12: TfrxMemoView
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1106#1056#160#1056#1114' "'#1056#1106#1056#1169#1056#1112#1056#1105#1056#1029#1056#1105#1057#1027#1057#8218#1057#1026#1056#176#1057#8218#1056#1109#1057#1026'" [Date]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 298.582870000000000000
          Width = 457.323130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBList: TfrxDBDataset
    UserName = 'frxDBList'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FK_ID=FK_ID'
      'FC_ADR=FC_ADR'
      'FC_NUM=FC_NUM'
      'FC_KOD=FC_KOD'
      'FK_PAYTYPE=FK_PAYTYPE'
      'FN_BONUS=FN_BONUS'
      'FN_NOW=FN_NOW'
      'FL_NEOPL=FL_NEOPL'
      'FN_DOLG=FN_DOLG'
      'FL_DEL=FL_DEL')
    DataSet = odsList
    BCDToCurrency = False
    Left = 744
    Top = 152
  end
  object pmTV: TPopupMenu
    Images = frmMain.IL
    Left = 744
    Top = 210
    object N1: TMenuItem
      Action = aPrint
    end
    object MenuItem1: TMenuItem
      Action = aXLS
    end
    object N2: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 7
      OnClick = N2Click
    end
  end
  object sdPopUp: TSaveDialog
    Left = 745
    Top = 259
  end
  object odsTaxi: TOracleDataSet
    SQL.Strings = (
      'select * from taxi.ts_taxi'
      ' where fl_del = 0'
      'order by fc_name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000006000000464C5F44454C0100000000000D00000046435F4E
      414D455F53484F5254010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterScroll = odsTaxiAfterScroll
    Left = 84
    Top = 131
  end
  object dsTaxi: TDataSource
    DataSet = odsTaxi
    Left = 84
    Top = 83
  end
end
