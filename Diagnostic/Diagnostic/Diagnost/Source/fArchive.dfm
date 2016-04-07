object frmArchive: TfrmArchive
  Left = 231
  Top = 20
  HelpContext = 12
  Caption = #1040#1088#1093#1080#1074
  ClientHeight = 664
  ClientWidth = 1017
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1011
    Height = 27
    Align = dalTop
    BarManager = BMArchive
    SunkenBorder = True
    UseOwnColor = True
    UseOwnSunkenBorder = True
  end
  object cxGrArch: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 93
    Width = 1011
    Height = 568
    Margins.Top = 0
    Align = alClient
    PopupMenu = pmTVArch
    TabOrder = 3
    object TVARCHIVE: TcxGridDBTableView
      OnKeyDown = TVARCHIVEKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = TVARCHIVECellDblClick
      OnCustomDrawCell = TVARCHIVECustomDrawCell
      DataController.DataSource = dsArchive
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = TVFIOPAC
        end
        item
          Kind = skSum
          FieldName = 'DOZA_PAC'
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      object TVIMAGE: TcxGridDBColumn
        Caption = '_'
        DataBinding.FieldName = 'COUNTIMAGE'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = ilImages
        Properties.Items = <
          item
          end
          item
            ImageIndex = 1
            Tag = 1
            Value = 1
          end
          item
            ImageIndex = 1
            Tag = 2
            Value = 2
          end
          item
            ImageIndex = 1
            Tag = 3
            Value = 3
          end
          item
            ImageIndex = 1
            Tag = 4
            Value = 4
          end
          item
            ImageIndex = 1
            Tag = 5
            Value = 5
          end
          item
            ImageIndex = 1
            Tag = 6
            Value = 6
          end
          item
            ImageIndex = 1
            Tag = 7
            Value = 7
          end
          item
            ImageIndex = 1
            Tag = 8
            Value = 8
          end
          item
            ImageIndex = 1
            Tag = 9
            Value = 9
          end
          item
            ImageIndex = 1
            Tag = 10
            Value = 10
          end
          item
            ImageIndex = 1
            Tag = 11
            Value = 11
          end
          item
            ImageIndex = 1
            Tag = 12
            Value = 12
          end
          item
            ImageIndex = 1
            Tag = 13
            Value = 13
          end
          item
            ImageIndex = 1
            Tag = 14
            Value = 14
          end>
        Properties.ReadOnly = True
        MinWidth = 64
        Options.Editing = False
        Options.ShowEditButtons = isebNever
        Options.HorzSizing = False
        Options.Moving = False
      end
      object TVDATE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'FD_DATE'
        Options.Editing = False
        Width = 20
      end
      object TVFIOPAC: TcxGridDBColumn
        Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
        DataBinding.FieldName = 'PACFIO'
        Options.Editing = False
        Width = 56
      end
      object TVDATEROJD: TcxGridDBColumn
        Caption = #1043#1086#1076' '#1088#1086#1078#1076
        DataBinding.FieldName = 'FD_ROJD'
        Options.Editing = False
        Width = 21
      end
      object TVKEMNAPR: TcxGridDBColumn
        Caption = #1050#1077#1084' '#1085#1072#1087#1088#1072#1074#1083#1077#1085
        DataBinding.FieldName = 'KEM'
        Options.Editing = False
        Width = 32
      end
      object TVSMIDNAME: TcxGridDBColumn
        Caption = #1042#1080#1076
        DataBinding.FieldName = 'SMIDNAME'
        Options.Editing = False
        Width = 20
      end
      object TVFC_NAME: TcxGridDBColumn
        Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        Options.Editing = False
        Width = 33
      end
      object TVVRACHFIO: TcxGridDBColumn
        Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
        DataBinding.FieldName = 'VRACHFIO'
        Options.Editing = False
        Width = 35
      end
      object TVSTATE: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1091#1089
        DataBinding.FieldName = 'STATE'
        Width = 25
      end
      object TVOTDEL: TcxGridDBColumn
        Caption = #1054#1090#1076#1077#1083#1077#1085#1080#1077
        DataBinding.FieldName = 'OTDEL'
        Width = 599
      end
      object VISSLEDSOS: TcxGridDBColumn
        DataBinding.FieldName = 'FK_NAZSOSID'
        Visible = False
        VisibleForCustomization = False
      end
      object VARCHIVEVIDOPL: TcxGridDBColumn
        Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099
        DataBinding.FieldName = 'VID_OPL'
        Width = 92
      end
    end
    object cxGrArchLevel1: TcxGridLevel
      GridView = TVARCHIVE
    end
  end
  object dxBarDockControl2: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 33
    Width = 1011
    Height = 27
    Margins.Top = 0
    Align = dalTop
    BarManager = BMArchive
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object dcPref: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 63
    Width = 1011
    Height = 27
    Margins.Top = 0
    Align = dalTop
    BarManager = BMArchive
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object paFAM: TPanel
    Left = 8
    Top = 88
    Width = 359
    Height = 21
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 8
    Visible = False
    object lbl1: TLabel
      Left = 0
      Top = 5
      Width = 52
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103':'
    end
    object deFAM: TcxTextEdit
      Left = 52
      Top = 0
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      OnClick = deFAMClick
      OnEnter = deFAMEnter
      OnKeyDown = deFAMKeyDown
      Width = 307
    end
  end
  object BMArchive: TdxBarManager
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
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 32
    Top = 160
    DockControlHeights = (
      0
      0
      0
      0)
    object BMArchiveBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = #1055#1072#1085#1077#1083#1100'_1'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 404
      FloatTop = 344
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbRefreshArchive'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbResultArchive'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPrintArch'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbCloseArchive'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = #1055#1072#1085#1077#1083#1100'_1'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BMArchiveBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = #1044#1072#1090#1099
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 404
      FloatTop = 344
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbDateBegin'
        end
        item
          Visible = True
          ItemName = 'bbDateEnd'
        end
        item
          Visible = True
          ItemName = 'bbSearchDate'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPref'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = #1044#1072#1090#1099
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BMArchiveBar3: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1080#1089#1082#1072
      CaptionButtons = <>
      DockControl = dcPref
      DockedDockControl = dcPref
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 404
      FloatTop = 344
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarControlContainerItem1'
        end
        item
          Visible = True
          ItemName = 'bbFilterFIO'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1080#1089#1082#1072
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbRefreshArchive: TdxBarButton
      Action = aRefreshArchive
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbCloseArchive: TdxBarButton
      Action = aClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbResultArchive: TdxBarButton
      Action = aResult
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDateBegin: TdxBarDateCombo
      Caption = #1055#1077#1088#1080#1086#1076' '#1089':'
      Category = 0
      Hint = #1055#1077#1088#1080#1086#1076' '#1089':'
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
    object bbDateEnd: TdxBarDateCombo
      Caption = #1087#1086':'
      Category = 0
      Hint = #1087#1086':'
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
    object bbSearchDate: TdxBarButton
      Action = aSearchDate
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPref: TdxBarButton
      Action = aPref
      Category = 0
      ButtonStyle = bsChecked
    end
    object bbFilterFIO: TdxBarButton
      Action = aFilterFIO
      Category = 0
    end
    object bbPrintArch: TdxBarButton
      Action = aPrintArch
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = #1060#1072#1084#1080#1083#1080#1103
      Category = 0
      Hint = #1060#1072#1084#1080#1083#1080#1103
      Visible = ivAlways
      Control = paFAM
    end
  end
  object alArchive: TActionList
    Images = frmMain.IL
    Left = 32
    Top = 208
    object aRefreshArchive: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 22
      ShortCut = 116
      OnExecute = aRefreshArchiveExecute
    end
    object aResult: TAction
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      ImageIndex = 6
      ShortCut = 118
      OnExecute = aResultExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ImageIndex = 3
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aSearchDate: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100'...'
      Hint = #1042#1099#1073#1088#1072#1090#1100'...'
      ImageIndex = 10
      OnExecute = aSearchDateExecute
    end
    object aPref: TAction
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      Hint = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 8
      ShortCut = 16462
      OnExecute = aPrefExecute
    end
    object aFilterFIO: TAction
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1060#1048#1054
      Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1060#1048#1054
      ImageIndex = 9
      OnExecute = aFilterFIOExecute
    end
    object aText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 12
      OnExecute = aTextExecute
    end
    object aWeb: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 13
      OnExecute = aWebExecute
    end
    object aXML: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 14
      OnExecute = aXMLExecute
    end
    object aXLS: TAction
      Caption = #1058#1072#1073#1083#1080#1094#1072' MS Excel'
      ImageIndex = 15
      OnExecute = aXLSExecute
    end
    object aPrintArch: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100
      ImageIndex = 16
      ShortCut = 16464
      OnExecute = aPrintArchExecute
    end
    object aSnimok: TAction
      Caption = #1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
      Hint = #1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
      ImageIndex = 19
      ShortCut = 16416
      SecondaryShortCuts.Strings = (
        'ctrl+enter')
      OnExecute = aSnimokExecute
    end
  end
  object odsArchive: TOracleDataSet
    SQL.Strings = (
      'select tnazis.rowid, '
      '       tnazis.fk_id,'
      '       tnazis.fk_pacid, '
      '       tnazis.fk_nazsosid,'
      '       trunc(tnazis.fd_run) as fd_date,'
      '       asu.get_fullpath_sha(tnazis.fk_smid) as fc_name, '
      
        '       asu.get_smidname(asu.get_owner_from_smid(tnazis.fk_smid))' +
        ' as smidname, '
      '       0 as "fk_owner", '
      
        '       asu.pkg_regist_pacfunc.get_pac_fullfio(tnazis.fk_pacid) a' +
        's pacfio, '
      '       asu.do_vrachfio(tnazis.fk_vrachid) as kem, '
      '       asu.do_vrachfio(tnazis.fk_ispolid) as vrachfio,'
      
        '       (select fd_rojd from asu.tpeoples where fk_id = (select f' +
        'k_peplid from asu.tkarta where fk_id = tnazis.fk_pacid '
      
        '                                                        union al' +
        'l'
      
        '                                                        select f' +
        'k_peplid from asu.tambulance where fk_id = tnazis.fk_pacid)) as ' +
        'fd_rojd,'
      '       (select count(*) '
      '          from asu.trichviewdata, asu.thtmlimages '
      '         where trichviewdata.fk_pacid = tnazis.fk_id'
      
        '           and thtmlimages.fk_richview=trichviewdata.fk_id) as c' +
        'ountimage,'
      
        '       decode(tnazis.fk_nazsosid, 2, '#39#1053#1045' '#1042#1067#1055'.'#39', 1, '#39#1042#1067#1055'.'#39', -11, ' +
        #39#1042#1067#1055'. '#1052#1051'. '#1057#1054#1058#1056'.'#39', 89, '#39#1056#1045#1050#1054#1052#1045#1053#1044#1054#1042#1040#1053#1054#39', 23, '#39#1054#1058#1052#1045#1053#1045#1053#1054#39') as state,'
      
        '       asu.pkg_regist_pacfunc.get_pac_fcotdel(tnazis.fk_pacid) a' +
        's otdel,'
      '       decode(asu.is_ambulance(tnazis.fk_pacid),'
      '              1, (select t4.fc_name'
      
        '                    from asu.tambtalon_naz t1, asu.tambtalon t2,' +
        ' asu.tinsurdocs t3, asu.ttypedoc t4 '
      '                   where t1.fk_nazid = tnazis.fk_id'
      '                     and t1.fk_talonid = t2.fk_id'
      '                     and t2.fk_insuranceid = t3.fk_id'
      '                     and t3.fk_typedocid = t4.fk_id),'
      '              0, (select t3.fc_name'
      
        '                    from asu.tpac_insurance t1, asu.tinsurdocs t' +
        '2, asu.ttypedoc t3'
      '                   where t1.fk_pacid = tnazis.fk_id'
      '                     and t1.fk_insurdocid = t2.fk_id'
      
        '                     and t2.fk_typedocid = t3.fk_id)) as vid_opl' +
        '    '
      ''
      '  from (select fk_id, fk_smid '
      '          from asu.tsmid_rights '
      '         where fk_sotrid=:psotr '
      
        '           and asu.pkg_smid.getrootlevelid1(fk_smid) in (asu.get' +
        '_procid, asu.get_konsid, asu.get_issledid, asu.get_analid)) sm,'
      '        asu.tnazis '
      ' where tnazis.fk_smid=sm.fk_smid'
      '   and trunc(tnazis.fd_run) >= :pfd_date1 '
      '   and trunc(tnazis.fd_run) <= :pfd_date2'
      '   and tnazis.fk_nazsosid in (asu.get_vipnaz, asu.get_nazcancel)'
      '   '
      ' order by trunc(tnazis.fd_run) asc'
      ''
      '')
    Optimize = False
    Variables.Data = {
      03000000030000000A0000003A5046445F44415445310C000000000000000000
      00000A0000003A5046445F44415445320C000000000000000000000006000000
      3A50534F5452030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000F0000000700000046435F4E414D4501000000000005000000464B5F
      494401000000000008000000464B5F4F574E45520100000000000B000000464B
      5F4E415A534F53494401000000000008000000565241434846494F0100000000
      000700000046445F444154450100000000000600000050414346494F01000000
      00000700000046445F524F4A44010000000000030000004B454D010000000000
      0A000000434F554E54494D41474501000000000008000000534D49444E414D45
      01000000000008000000464B5F50414349440100000000000500000053544154
      45010000000000050000004F5444454C010000000000070000005649445F4F50
      4C010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsArchiveBeforeOpen
    AfterOpen = odsArchiveAfterOpen
    AfterScroll = odsArchiveAfterScroll
    Left = 160
    Top = 176
    object odsArchiveFK_ID: TFloatField
      FieldName = 'FK_ID'
      Required = True
    end
    object odsArchiveFK_PACID: TFloatField
      FieldName = 'FK_PACID'
    end
    object odsArchiveFK_NAZSOSID: TFloatField
      FieldName = 'FK_NAZSOSID'
    end
    object odsArchiveFD_DATE: TDateTimeField
      FieldName = 'FD_DATE'
    end
    object odsArchiveFC_NAME: TStringField
      FieldName = 'FC_NAME'
      Size = 4000
    end
    object odsArchiveSMIDNAME: TStringField
      FieldName = 'SMIDNAME'
      Size = 4000
    end
    object odsArchiveFK_OWNER: TFloatField
      FieldName = 'FK_OWNER'
    end
    object odsArchivePACFIO: TStringField
      FieldName = 'PACFIO'
      Size = 4000
    end
    object odsArchiveKEM: TStringField
      FieldName = 'KEM'
      Size = 4000
    end
    object odsArchiveVRACHFIO: TStringField
      FieldName = 'VRACHFIO'
      Size = 4000
    end
    object odsArchiveFD_ROJD: TDateTimeField
      FieldName = 'FD_ROJD'
    end
    object odsArchiveCOUNTIMAGE: TFloatField
      FieldName = 'COUNTIMAGE'
    end
    object odsArchiveSTATE: TStringField
      FieldName = 'STATE'
      Size = 14
    end
    object odsArchiveOTDEL: TStringField
      FieldName = 'OTDEL'
      Size = 4000
    end
    object odsArchiveVID_OPL: TStringField
      FieldName = 'VID_OPL'
      Size = 255
    end
  end
  object dsArchive: TDataSource
    DataSet = odsArchive
    Left = 208
    Top = 176
  end
  object sdPopUpArch: TSaveDialog
    Left = 33
    Top = 259
  end
  object pmTVArch: TPopupMenu
    Images = frmMain.IL
    Left = 32
    Top = 306
    object N1: TMenuItem
      Action = aPrintArch
    end
    object MenuItem3: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 11
      object MenuItem4: TMenuItem
        Action = aText
      end
      object MenuItem5: TMenuItem
        Action = aWeb
      end
      object MenuItem6: TMenuItem
        Action = aXML
      end
      object MenuItem7: TMenuItem
        Action = aXLS
      end
    end
    object N2: TMenuItem
      Action = aSnimok
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
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
      OnClick = N3Click
    end
  end
  object frxRepArchive: TfrxReport
    Version = '4.7.21'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39022.437743958300000000
    ReportOptions.LastChange = 41205.670290659720000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepArchiveGetValue
    Left = 560
    Top = 216
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
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
        Height = 77.488250000000000000
        Top = 18.897650000000000000
        Width = 1084.725110000000000000
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 58.133890000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 170.078850000000000000
          Top = 58.133890000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
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
        object Memo4: TfrxMemoView
          Left = 75.590600000000000000
          Top = 58.133890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 411.968770000000000000
          Top = 58.133890000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
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
          Left = 657.638220000000000000
          Top = 58.133890000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
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
          Left = 944.882500000000000000
          Top = 58.133890000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#1026#1056#176#1057#8225)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Align = baWidth
          Top = 33.677180000000000000
          Width = 1084.725110000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1056#160#1056#181#1056#183#1057#1107#1056#187#1057#1034#1057#8218#1056#176#1057#8218' '#1056#1109#1057#8218#1056#177#1056#1109#1057#1026#1056#176' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#8470'. '#1056#8217#1057#1027#1056#181 +
              #1056#1110#1056#1109': [VSEGO]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Align = baWidth
          Width = 1084.725110000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Align = baWidth
          Top = 16.118120000000000000
          Width = 1084.725110000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[OTDELNAME]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 19.795300000000000000
        Top = 158.740260000000000000
        Width = 1084.725110000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo8: TfrxMemoView
          Left = 75.590600000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."FD_DATE"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 170.078850000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."PACFIO"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 411.968770000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."KEM"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 657.638220000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."FC_NAME"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 944.882500000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."VRACHFIO"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 15.118120000000000000
        Top = 238.110390000000000000
        Width = 1084.725110000000000000
        object Memo1: TfrxMemoView
          Left = 755.965212640000000000
          Width = 328.819110000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Width = 755.906000000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADESIGN], [SYSDATE]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FD_DATE=FD_DATE'
      'FC_NAME=FC_NAME'
      'FK_ID=FK_ID'
      'FK_OWNER=FK_OWNER'
      'PACFIO=PACFIO'
      'FK_NAZSOSID=FK_NAZSOSID'
      'KEM=KEM'
      'VRACHFIO=VRACHFIO'
      'FD_ROJD=FD_ROJD')
    DataSet = odsArchive
    Left = 480
    Top = 216
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CNT=CNT')
    Left = 480
    Top = 272
  end
  object odsImages: TOracleDataSet
    SQL.Strings = (
      
        'SELECT ROWNUM, THTMLIMAGES.FC_NAME||'#39'.JPG'#39' SFILENAME, THTMLIMAGE' +
        'S.FB_BLOB '
      '  FROM ASU.TRICHVIEWDATA, ASU.THTMLIMAGES '
      ' WHERE TRICHVIEWDATA.FK_PACID = :PFK_PACID'
      '   AND THTMLIMAGES.FK_RICHVIEW=TRICHVIEWDATA.FK_ID')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A50464B5F504143494403000000000000000000
      0000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 208
    Top = 272
  end
  object ilImages: TImageList
    Left = 32
    Top = 352
    Bitmap = {
      494C0101020004001C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A6A8A900A6A8A900A6A8
      A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8
      A900A6A8A900A6A8A900A6A8A90000000000000000004F4F500053565700393A
      3A005356570066696A00666A6B005C5F5F0056585800505152004C4F4F004548
      4900414142003A3B3C0030303000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009EB7E1009DC1FB009EBF
      FA009FBFFA00A0BFFB00A1C3FD00A7C5FF00A9C6FF00A9C8FF00ADC8FF00AAC8
      FF00AAC8FF00A8C6FF0096A8C90000000000000000002F2F3000373745004246
      74003E3740003F363F003C3A40003E4048003D3E460039363F003E414900474D
      5C003F3C46003E3C46002F2F3000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099B0D6009DBAEF009BB7
      EB0097B5E9009DB8EC009EB9EE00A2B8EE00A2B8EE00A6C0F000ADC2F400ADC3
      F500ABC2F400AAC3F50096A7C4000000000000000000373737003A4C71003C77
      AC003A425B0036323C00417297005CC3D90064D3E50042678600383C46003A38
      43003F3B46004A47700037373700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000097B0D5009ABAED0096B3
      E80096B4E80099B4E80098B2E70099AFE5009BB1E600A2B9EA00A8BAED00AABF
      F200A8C0F200ABC5F60098AAC50000000000000000003B3C3C00414D5E003A6A
      8F004487B100322B370057DFEC007CEEF00077EEEF0042A3DB00437699003C42
      4D003E3C47004A4D68003B3C3C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000095AED30093B4E5008FA9
      E00090A8E300859ED5008293D0008EA1DB00899CD100828CC7008090C6008599
      CD008B9FD6008CAADF00909EBD00000000000000000044444500424D5B00417E
      9A004257650034363F00437AA4006DDFEE0065DBED0041A4D900384152003D46
      50005086940052A6C00044444500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000889FC700889CDE008297
      D2008A9DD700A0ACDC008499C2004A6E9D004F6D9B0061789D00B0BBDA0098A3
      DC007D8ECC006E82BF00808AAC0000000000000000004949490051585C004D78
      83005C7D8600557B86002E2B37004E9CCC004B8FBE00426A9200393D4D004970
      790059868F0055A3C20049494900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094A9D500808FD8009AAC
      DF00ADBCE200DAE2F200637CA500525DB0005E50AF00AEBFE500767E9E00D3DB
      EF00BDC6E700828AC3006E7C9A0000000000000000004B4C4C004E5B5F004150
      54004A5D5E00465C670031344D004BA7DA004A749D0030353E00343942005B8E
      8C005877710057736F004B4C4C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000092A8D3007E93D9009AAD
      DB00CCD5EA00BEC8E2008C9DBF004C41A30047369000A2A9D5007E86A200D5DE
      F200CCD5EA00586093007283A00000000000000000004D4D4D00556E6F004964
      6A0048605F003E4449003F8ABB004A98D4004EB0E50033374100393E45005471
      6C0057736F00618F8E004D4D4D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008A9CC7008CA5E500889F
      DD00899BCC00C1CAE0007F8AA700595CAD006455BB00727EAA0078799800686D
      8C00606590006880B1008497BA00000000000000000052525300558A95005283
      8800527E82004D6C7A0062D4EE0060C9ED006FDBEE003A3A43004C5A610072A9
      A60071ADAD0082D5E50052525300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009CAFD6008FA9E2009AB6
      EC009BBAEF008AA1DA006E7DB300556195004458890051608E00576492007D93
      C900809ACF008BAEE4008FA6C300000000000000000059595A0064B0D7006EC7
      E10087DAEC0075C7DC0061C8EB0060C1E50058B6E100393E480056777F0081C5
      CF0084C9DC0093F1F30059595A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009FB8D80096B8EA0090AD
      E60093AFE80094B3EB0096B2EF0093AFE60082A1DA008BA8E10088A7E10094B2
      E7009EBBEF00A8C6F60098ACC7000000000000000000505050007DD2F1007CCD
      F00089D7F10094DDF3006ED3E90080E4F1005BA8D7004A48530096DCEF0099E5
      F3009DE7F4009FEAF40050505000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009FB9D8009EC1F20092B1
      E70090AEE6008FAEE8008FAFEB0091AFEA008CABE7008EAEE70094B3EA00A1C1
      F100A8C7F500B1CFFB009CAFC800000000000000000049494A006B97A90079A2
      B90085B0C40093C1D7005F7588005F88A10058616F0059565C0097CDE40099CD
      E80098D5E8009BD9EE0049494A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5C1E500A7CFFF00A6CA
      FF00A3C6FF009FC8FF00A0CDFF00A5CCFF00A6CDFF00AAD1FF00B3D8FF00B4DA
      FF00BCE0FF00C1E3FF00A4BAD20000000000000000004F5050004F4F50004F4F
      50004F4F50004F4F50004F4F50004F4F50004F4F50004F4F50004F4F50005E5F
      5F0062636300535353004F505000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A6A8A900A6A8A900A6A8
      A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8
      A900A6A8A900A6A8A900A6A8A900000000000000000000000000000000000000
      0000000000000000000097979700000000000000000097979700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001FDBF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
end
