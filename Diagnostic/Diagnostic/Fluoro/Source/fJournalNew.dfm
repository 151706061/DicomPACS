object frmJournalNew: TfrmJournalNew
  Left = 252
  Top = 100
  Caption = #1046#1091#1088#1085#1072#1083' '#1085#1086#1074#1099#1093' '#1087#1072#1094#1080#1077#1085#1090#1086#1074' ('#1091#1095#1072#1089#1090#1082#1080')'
  ClientHeight = 473
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 856
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 862
  end
  object cxGr: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 856
    Height = 436
    Margins.Top = 0
    Align = alClient
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
    ExplicitLeft = 0
    ExplicitTop = 28
    ExplicitWidth = 862
    ExplicitHeight = 445
    object TV: TcxGridTableView
      PopupMenu = pmTV
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = TVFocusedRecordChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = VFIO
        end
        item
          Kind = skSum
        end
        item
          Kind = skSum
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
      object VFK_ID: TcxGridColumn
        Visible = False
        VisibleForCustomization = False
      end
      object VFIO: TcxGridColumn
        Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
        VisibleForCustomization = False
        Width = 217
      end
      object VROJD: TcxGridColumn
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
      end
      object VAGE: TcxGridColumn
        Caption = #1042#1086#1079#1088#1072#1089#1090
        Width = 95
      end
      object VPLANDATE: TcxGridColumn
        Caption = #1055#1083#1072#1085
        Width = 69
      end
      object VPER: TcxGridColumn
        Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100
        Width = 118
      end
      object VUCH: TcxGridColumn
        Caption = #1059#1095#1072#1089#1090#1086#1082
        Width = 115
      end
      object VLAST: TcxGridColumn
        Caption = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1060#1043
        Width = 117
      end
      object VUID: TcxGridColumn
        Caption = 'UID'
        Visible = False
        VisibleForCustomization = False
      end
      object VGRA: TcxGridColumn
        Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
      end
    end
    object cxGrLevel1: TcxGridLevel
      GridView = TV
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
    ImageOptions.Images = frmMain.ilMain
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 368
    Top = 168
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
      FloatLeft = 204
      FloatTop = 130
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbPeriod'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'lbPeriod'
        end
        item
          BeginGroup = True
          UserDefine = [udWidth]
          UserWidth = 162
          Visible = True
          ItemName = 'lcbPeriod'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbEdit'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPac'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPrint'
        end
        item
          BeginGroup = True
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
    object lcbPeriod: TcxBarEditItem
      Caption = #1055#1077#1088#1080#1086#1076
      Category = 0
      Hint = #1055#1077#1088#1080#1086#1076
      Visible = ivNever
      ShowCaption = True
      Width = 100
      PropertiesClassName = 'TcxLookupComboBoxProperties'
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
      Properties.ListSource = dsPeriod
      Properties.PostPopupValueOnTab = True
    end
    object bbRefresh: TdxBarButton
      Action = aRefresh
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPrint: TdxBarButton
      Action = aPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEdit: TdxBarButton
      Action = aEdit
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPeriod: TdxBarButton
      Action = aPeriod
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object lbPeriod: TcxBarEditItem
      Caption = #1053#1086#1074#1099#1081' '#1101#1083#1077#1084#1077#1085#1090
      Category = 0
      Hint = #1053#1086#1074#1099#1081' '#1101#1083#1077#1084#1077#1085#1090
      Style = frmMain.stBold
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      StyleEdit = frmMain.stBold
    end
    object bbPac: TdxBarButton
      Action = aPac
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000DA6600CC6600C86000CA6200CC6700D06D06D16F0B
        CE6A05CF6803CD6600C86100CC6400DA68000000000000000000000034DE827D
        726C6B6B636363000000000000EE7300DF7205DA801DD57714E79E44EEAF59F0
        B15CEFB05AF1B25BE49533E1912EE9A846E59C35DE8D23D6770DDD6C00EE8620
        192DFF0645FF4E85E6E5DACF6C6C6B000000000000E67D10EDAE53EFAF58E090
        34E9A34EF1B262F0B262F1B566F0A74C9C5027DA770CEDAB4EE6A13EE59E36DF
        9124D98720E1BC990C4AFF469CFF64D7FF659DE986827C000000000000E3770B
        EEAF56EEAD59F1B465F3B66BF4B86EF6BC76E39641DC6B00090EA4BD5E09E192
        30EBA84CE59F3BE6A142E3C3A20B49FF49A2FF6FD9FF57B7FF0F5AFF5162A100
        0000000000DF6D00EFB05EF1B262F2B56BF4BB74F8C382DC872EE49034B1693A
        3234DFBB9DA0EABF8FEDCDA3F4D09FE7C99F8480833B8CE16EDDFF56B4FF195B
        FF3351FF000000000000000000DF6900EAA34EF2B56AF5B972F9C384DE8933E4
        9746FFC57EC2A0978387C57F80857D7B787F7C788683819B8D7AAEAAA5C0C7C2
        419AE91456FF234FFF000000000000000000000000EB6F00DB8426F5BB71F7BD
        78EEAB62DD8833FFD4A3F4C898979699AFA596F5D094FBD293FBD39AFCD79DC2
        B39E808389C4C0BB7B7B8A274AFF000000000000000000000000000000000000
        DB6A00F0B063F8C281F5BA79D67A20FFDEB9D1B699ADA593FCD79AF1D19BEFD0
        99EECD91F0CF97FAD79FC0B29B878481918F8700000000000000000000000000
        0000000000000000ED7500D2710AE1913AD47717E49445FEE2C4918B86F4D8A2
        F5DDAAF1DBAAF1DBA9F0D4A2EFD097F0CE9AFEDAA375777B0000000000000000
        00000000000000000000000000000000000000E67300CE6600D77E22FCC685FB
        D6AF80807EFFE8B5F6E5BEF7E7C0F5E2B8F3DDB1F1D6A5F0D095FDDAA481807E
        000000000000000000000000000000000000000000000000000000000000DC42
        00DD6100C47629B5D5F67F8083FFF3C8FCF5DCFAF3D6F7ECC8F6E7BDF3DCADF0
        D39EFED9A17E7E7D000000000000000000000000000000000000000000000000
        00000000000000000023A7FF3EA6FFAFDCFFA0ACB6EFE6C5FFFFF0FEFEFCFCF6
        DBF7ECC7F6E1B3F3D7A4F4D8A472747900000000000000000000000000000000
        000000000000000000000000000000000034A5FF67B8FF9BD1FFC7E0F3A2A29C
        FFFFECFFFFF7FDF9E5F9EECCF7E3B6FFE1A6A0998D6F71740000000000000000
        000000000000000000000000000000000000000000000070AA3B9EF876C2FF8D
        CCFFBAE1FFCDDEEBA2A39EE1E0C7FFFCD3FFF2C2E9D5AB9D988F87898E000000
        000000000000000000000000000000000000000000000000000000000000006C
        A2419ADB489FDA88CDFFA1D8FFC4E6FFCEE3F298A0A77D7F837B7F828C90959D
        9E9F000000000000000000000000000000000000000000000000000000000000
        0000000000000071A80C6DA2005C8D8AD1FF96D5FFABE0FFB5E2FFC7E8FFCAE8
        FFB7DCFFD4EBFF00000000000000000000000000000000000000000000000000
        00000000000000000000000000000079A80076A90070A353A3D996D9FFA0DDFF
        98D6FF81C5F572BAEF55ADFF4FB3FF0000000000000000000000000000000000
        000000000000000000000000000000000000000000000078B0008FC2008CBF00
        72A600699C00699C00669900689A00689A00679A006BAC000000000000000000
        0000000000000000000000000000000000000000000000000000000000000070
        A80094C7008FC2008EC1008ABD0086B90082B5007DB0007AAD006DA10077B100
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000073AF007FB20095C8008FC2008ABD0086B90083B6007EB1007A
        AD006EA600000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000071AC0075AA0095C8008EC1008ABD
        0085B80078AB006A9B0079AF0000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000069A300
        679B006FA2006EA10067990064980059A0000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
  end
  object al: TActionList
    Images = frmMain.ilMain
    Left = 416
    Top = 168
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1078#1091#1088#1085#1072#1083
      ImageIndex = 0
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100'/'#1079#1072#1075#1088#1091#1079#1080#1090#1100' '#1078#1091#1088#1085#1072#1083
      ImageIndex = 29
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Enabled = False
      ImageIndex = 1
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' '#1090#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 14
      OnExecute = aTextExecute
    end
    object aWeb: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Web-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 15
      OnExecute = aWebExecute
    end
    object aXML: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' XML-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 16
      OnExecute = aXMLExecute
    end
    object aXLS: TAction
      Caption = 'Excel-'#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel-'#1092#1072#1081#1083
      ImageIndex = 17
      OnExecute = aXLSExecute
    end
    object aEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Enabled = False
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 5
      ShortCut = 114
      OnExecute = aEditExecute
    end
    object aPeriod: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076
      Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1072#1094#1080#1077#1085#1090#1077
      ImageIndex = 24
      ShortCut = 118
      OnExecute = aPeriodExecute
    end
    object aPac: TAction
      Caption = #1055#1072#1094#1080#1077#1085#1090
      Enabled = False
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1087#1072#1094#1080#1077#1085#1090#1077
      OnExecute = aPacExecute
    end
  end
  object dsPeriod: TDataSource
    DataSet = odsPeriod
    Left = 536
    Top = 120
  end
  object odsPeriod: TOracleDataSet
    SQL.Strings = (
      'select 1 as fk_id, '#39#1079#1072' '#1087#1086#1089#1083#1077#1076#1085#1080#1081' '#1076#1077#1085#1100#39' as fc_name'
      '  from dual '
      'union all'
      'select 7 as fk_id, '#39#1079#1072' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1085#1077#1076#1077#1083#1102#39' as fc_name'
      '  from dual '
      'union all'
      'select 14 as fk_id, '#39#1079#1072' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' 2 '#1085#1077#1076#1077#1083#1080#39' as fc_name'
      '  from dual '
      'union all'
      'select 30 as fk_id, '#39#1079#1072' '#1087#1086#1089#1083#1077#1076#1085#1080#1081' '#1084#1077#1089#1103#1094#39' as fc_name'
      '  from dual '
      'union all'
      'select 90 as fk_id, '#39#1079#1072' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' 3 '#1084#1077#1089#1103#1094#1072#39' as fc_name'
      '  from dual '
      'union all'
      'select 183 as fk_id, '#39#1079#1072' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' '#1087#1086#1083#1075#1086#1076#1072#39' as fc_name'
      '  from dual '
      'union all'
      'select 365 as fk_id, '#39#1079#1072' '#1075#1086#1076#39' as fc_name'
      '  from dual '
      ''
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 536
    Top = 168
  end
  object oqThread: TOracleQuery
    SQL.Strings = (
      'SELECT t1.fk_peplid, t1.fk_id,'
      
        '       asu.pkg_regist_peplfunc.get_pepl_fullfio(t1.fk_peplid) as' +
        ' fio,'
      
        '       (select fd_rojd from asu.tpeoples where fk_id = t1.fk_pep' +
        'lid) as date_rojd, '
      
        '       asu.pkg_regist_peplfunc.get_pepl_age_now(t1.fk_peplid) as' +
        ' age, '
      '       asu.get_plan_fluoro_date(t1.fk_peplid) as plandate,'
      '       (select asu.get_smidname(fk_smid) '
      '          from asu.tib '
      '         where fk_pacid = t1.fk_peplid'
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'XRAY_PERIOD_OSMOTROV'#39' '
      
        '                                                       connect b' +
        'y prior fk_id = fk_owner)) as per,'
      
        '       '#39#8470' '#39'||t2.fc_name||'#39'('#39'||(select fc_name from asu.tsmid whe' +
        're fk_id = t2.fk_typeid)||'#39')'#39' as uch,'
      '       asu.get_last_fluoro(t1.fk_peplid) as last,'
      '       (select asu.get_smidname(fk_smid) '
      '          from asu.tib '
      '         where fk_pacid = t1.fk_peplid '
      
        '           and fk_smeditid = (select fk_id from asu.tsmid where ' +
        'fc_synonim = '#39'LD_GRAGZ'#39')) as gra'
      '       '
      '  FROM asu.tdistrict_pacient t1, asu.tdistrict_name t2'
      ' WHERE t1.fd_date_in >= :pdate1 --sysdate - :pfn_days'
      '   and t1.fd_date_in <= :pdate2 '
      '   and t1.fk_arealid = t2.fk_id'
      
        '   and t2.fk_typeid <> (select fk_id from asu.tsmid where fc_syn' +
        'onim = '#39'GYNEC_AREA'#39')'
      ''
      'ORDER BY fio')
    Session = frmMain.os
    ReadBuffer = 1
    Optimize = False
    Variables.Data = {
      0300000002000000070000003A5044415445310C000000000000000000000007
      0000003A5044415445320C0000000000000000000000}
    Cursor = crSQLWait
    Threaded = True
    OnThreadRecord = oqThreadThreadRecord
    OnThreadFinished = oqThreadThreadFinished
    OnThreadError = oqThreadThreadError
    Left = 536
    Top = 224
  end
  object memData: TdxMemData
    Indexes = <>
    Persistent.Option = poLoad
    SortOptions = []
    SortedField = 'FIO'
    Left = 536
    Top = 272
    object memDataFK_ID: TIntegerField
      FieldName = 'FK_ID'
    end
    object memDataFIO: TStringField
      FieldName = 'FIO'
      Size = 300
    end
    object memDataPACID: TIntegerField
      FieldName = 'PACID'
    end
    object memDataPLANDATE: TStringField
      FieldName = 'PLANDATE'
      Size = 100
    end
    object memDataPER: TStringField
      FieldName = 'PER'
      Size = 100
    end
    object memDataUCH: TStringField
      FieldName = 'UCH'
      Size = 100
    end
    object memDataLAST: TStringField
      FieldName = 'LAST'
      Size = 50
    end
    object memDataAGE: TIntegerField
      FieldName = 'AGE'
    end
    object memDataUID: TIntegerField
      FieldName = 'UID'
    end
    object memDataGRA: TStringField
      FieldName = 'GRA'
      Size = 100
    end
    object memDatarojd: TDateField
      FieldName = 'rojd'
    end
  end
  object pmTV: TPopupMenu
    Images = frmMain.ilMain
    Left = 268
    Top = 246
    object N1: TMenuItem
      Action = aPrint
    end
    object MenuItem1: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 13
      object MenuItem2: TMenuItem
        Action = aText
      end
      object MenuItem3: TMenuItem
        Action = aWeb
      end
      object MenuItem4: TMenuItem
        Action = aXML
      end
      object MenuItem5: TMenuItem
        Action = aXLS
      end
    end
    object N3: TMenuItem
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00914413009144
        1300914413009144130091441300914413009144130091441300FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00F7E6DA00F5E0
        D100F3DAC800F1D3BE00EFCDB500EDC7AC00EDC7AC0091441300FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00F9EDE500F7E6
        DA00F5E0D100F3DAC800F2D6C300F0D0BA00EECAB00091441300FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00FCF5F000D383
        5700D3835700D3835700D3835700D3835700F0D0BA0091441300FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00FFFFFF00FDF8
        F500FAF1EA00F8EADF00F6E3D500F4DDCC00F2D6C30091441300CEB8AA007A5A
        46007A5A46007A5A46007A5A46007A5A46007A5A4600E0A98B00FFFFFF00D383
        5700D3835700D3835700D3835700D3835700F4DDCC0091441300CEB8AA00EFE7
        E300EBE1DC00E7DBD500E3D5CD00DFCFC600DBC9BF00E0A98B00FFFFFF00FFFF
        FF00FFFFFF00FDF8F500FAF1EA00F8EADF00F6E3D50091441300CEB8AA00F4EE
        EB00EFE7E300EBE1DC00E7DBD500E5D8D100E1D2CA00E0A98B00FFFFFF00D383
        5700D3835700FFFFFF00E0A98B00AB542800AB542800AB542800CEB8AA00F9F5
        F300DFA98300DFA98300DFA98300DFA98300DFA98300E0A98B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00E0A98B00F3EBE600AB542800FF00FF00CEB8AA00FFFF
        FF00FBF8F700F6F1EF00F1EAE700EDE4DF00E9DED800E0A98B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00E8A98B00C56A3100FF00FF00FF00FF00CEB8AA00FFFF
        FF00DFA98300DFA98300DFA98300DFA98300DFA98300E0A98B00E0A98B00E0A9
        8B00E0A98B00E0A98B00E0A98B00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
        FF00FFFFFF00FFFFFF00FBF8F700F6F1EF00F1EAE700EDE4DF0069473100FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
        FF00DFA98300DFA98300FFFFFF00CEB8AA00694731006947310069473100FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00CEB8AA00F3EBE60069473100FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00CEB8AA0069473100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00CEB8
        AA00CEB8AA00CEB8AA00CEB8AA00CEB8AA00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1060#1048#1054
      OnClick = N3Click
    end
    object N2: TMenuItem
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BC4B0000BC4B
        0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
        0000BC4B0000BC4B0000BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FDF1
        E500FDF1E500FFEDD500FFE9CE00FFE3C500FEDEBC00FFDAB100FFD5A600FFD1
        9F00FFCC9800FFD8A100BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FBF3
        EA00FBF3EA00FFEFDC00FFEDD500FEE5CA00FFE3C500FFDAB100FFDAB100FFD5
        A600FFCC9800FFD8A100BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF6
        F000FBF3EA00FDF1E500FFEDD500FFE9CE00FFE3C500FEDEBC00FFDAB100FED7
        AB00FFD5A600FFD5A600BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF8
        F700FCF8F700FBF3EA00FDF1E500FFEDD500FEE5CA00FFE3C500FEDEBC00FFDA
        B100FFD8A100FED7AB00BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF8
        F700FCF8F700FCF8F700FDF1E500FFEFDC00FFEDD500FEE5CA00FFE9C200DEC2
        B100DEBDA600FFE9B200BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF8
        F700FCF8F700FCF8F700FCF8F700FBF3EA00FDF1E500FFF2D700D9C2C100090A
        9000090A9000D5BBAC00BC4B0000FF00FF00090A900000028F00BC4B0000FAEF
        E500FBF3EA00FBF3EA00FDF1E500FAE7D400FEE5CA00FFE3C500C1A5A700090A
        9000112DEA00090A900065416600090A90000622EB0000039200BC4B0000BC4B
        0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000EF9037009754
        3D00090A90001933E200090A9000122DE50000039200FF00FF00FF00FF00BC4B
        0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
        000045265800090A90003C66FF00090A9000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00090A9000354CE000090A90002C46E700090A9000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00090A
        90004F65E70006099000FF00FF00090A90002C46E70006099000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00090A
        9000090A9000FF00FF00FF00FF00FF00FF000609900000028F00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      OnClick = N2Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1072#1090#1091' '#1086#1090#1089#1095#1077#1090#1072' '#1060#1043
      ImageIndex = 28
      OnClick = N5Click
    end
  end
  object dlgSavePopUp: TSaveDialog
    Left = 265
    Top = 299
  end
  object frxList: TfrxReport
    Version = '4.7.21'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40556.357598101850000000
    ReportOptions.LastChange = 40801.364879537040000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxListGetValue
    Left = 672
    Top = 184
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
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 113.385900000000000000
        Top = 18.897650000000000000
        Width = 1084.725110000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 1084.725110000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baWidth
          Top = 15.897650000000000000
          Width = 1084.725110000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[OTDELNAME]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baWidth
          Top = 32.015770000000000000
          Width = 1084.725110000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clMaroon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8211#1056#1032#1056#160#1056#1116#1056#1106#1056#8250' '#1056#1116#1056#1115#1056#8217#1056#171#1056#1168' '#1056#1119#1056#1106#1056#166#1056#152#1056#8226#1056#1116#1056#1118#1056#1115#1056#8217' '#1056#1119#1056#1115' '#1056#1032#1056#167#1056#1106#1056#1038#1056#1118#1056#1113#1056#1106#1056#1114)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 56.692950000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#181#1057#1026#1056#1105#1056#1109#1056#1169':')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 79.370130000000000000
          Top = 56.692950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PERIOD]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 990.236860000000000000
          Top = 56.692950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[DATESYS]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 94.488250000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
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
        object Memo8: TfrxMemoView
          Left = 49.133890000000000000
          Top = 94.488250000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#152#1056#1115)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 336.378170000000000000
          Top = 94.488250000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1056#1109#1056#183#1057#1026#1056#176#1057#1027#1057#8218)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 400.630180000000000000
          Top = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#187#1056#176#1056#1029)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 498.897960000000000000
          Top = 94.488250000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#181#1057#1026#1056#1105#1056#1109#1056#1169#1056#1105#1057#8225#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 612.283860000000000000
          Top = 94.488250000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1057#8225#1056#176#1057#1027#1057#8218#1056#1109#1056#1108)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 835.276130000000000000
          Top = 94.488250000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1057#1027#1056#187#1056#181#1056#1169#1056#1029#1057#1039#1057#1039' '#1056#164#1056#8220)
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 975.118740000000000000
          Top = 94.488250000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8220#1057#1026#1056#176#1056#182#1056#1169#1056#176#1056#1029#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 192.756030000000000000
        Width = 1084.725110000000000000
        DataSet = frxDBList
        DataSetName = 'frxDBList'
        RowCount = 0
        object Memo14: TfrxMemoView
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clMaroon
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 49.133890000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clMaroon
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBList."FIO"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 336.378170000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clMaroon
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."AGE"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 400.630180000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clMaroon
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."PLANDATE"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 498.897960000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clMaroon
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBList."PER"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 612.283860000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clMaroon
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBList."UCH"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 835.276130000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clMaroon
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."LAST"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 975.118740000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clMaroon
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."GRA"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 272.126160000000000000
        Width = 1084.725110000000000000
        object Memo21: TfrxMemoView
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clMaroon
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[MEDOTRADESIGN]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 604.724800000000000000
          Width = 480.000310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clMaroon
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
      'RecId=RecId'
      'FK_ID=FK_ID'
      'FIO=FIO'
      'PACID=PACID'
      'PLANDATE=PLANDATE'
      'PER=PER'
      'UCH=UCH'
      'LAST=LAST'
      'AGE=AGE'
      'UID=UID'
      'GRA=GRA')
    DataSet = memData
    Left = 672
    Top = 232
  end
  object oqIns: TOracleQuery
    SQL.Strings = (
      'declare'
      '  pfk_id number;'
      'begin'
      'insert into asu.tnazis'
      
        '(fk_smid, fc_remark, fd_naz, fd_run, fk_roomid, fk_ispolid, fk_v' +
        'rachid, fk_nazsosid, fk_pacid, fc_name, fk_naztypeid, fk_nazowne' +
        'r, fc_type)'
      'values'
      
        '(asu.get_flu_one_projection, '#39#1059#1089#1090#1072#1085#1086#1074#1083#1077#1085#1072' '#1087#1086#1089#1083#1077#1076#1085#1103#1103' '#1060#1043#39', :pdate,' +
        ' :pdate, 0, -1, :psotr, asu.get_pass_registrator, :ppacid, '
      
        'asu.get_smidname(asu.get_flu_one_projection), asu.get_nazplan, -' +
        '1, 0)'
      'returning fk_id into pfk_id;'
      '    '
      'insert into asu.tib '
      '(fc_char, fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date)'
      'values'
      
        '('#39' '#39', pfk_id, (select fk_id from asu.tsmid where fc_synonim = '#39'X' +
        'RAY_FLU_NUMBER'#39'), (select fk_id from asu.tsmid where fc_synonim ' +
        '= '#39'XRAY_FLU_NUMBER'#39'), '
      ':psotr, sysdate);'
      'end;'
      '')
    Session = frmMain.os
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A50444154450C00000000000000000000000600
      00003A50534F5452030000000000000000000000070000003A50504143494403
      0000000000000000000000}
    Cursor = crSQLWait
    Left = 424
    Top = 328
  end
  object oqUpd: TOracleQuery
    SQL.Strings = (
      'update asu.tnazis'
      '   set fd_naz = :pdate, fd_run = :pdate'
      ' where fk_id = :pfk_id')
    Session = frmMain.os
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A50444154450C00000000000000000000000700
      00003A50464B5F4944030000000000000000000000}
    Cursor = crSQLWait
    Left = 424
    Top = 376
  end
end
