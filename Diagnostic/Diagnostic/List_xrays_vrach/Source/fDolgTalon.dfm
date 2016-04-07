object frmDolgTalon: TfrmDolgTalon
  Left = 284
  Top = 122
  Caption = #1044#1086#1083#1075#1080' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084
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
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 856
    Height = 30
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object cxGr: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 36
    Width = 856
    Height = 434
    Margins.Top = 0
    Align = alClient
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
    object tvDolg: TcxGridTableView
      PopupMenu = pmGr
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = tvDolgPacFio
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
      object tvDolgSotr: TcxGridColumn
        Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
      end
      object tvDolgFdOpen: TcxGridColumn
        Caption = #1044#1072#1090#1072' '#1086#1090#1082#1088#1099#1090#1080#1103
      end
      object tvDolgPacFio: TcxGridColumn
        Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
      end
      object tvDolgNumib: TcxGridColumn
        Caption = #8470' '#1052#1050
      end
      object tvDolgFdRojd: TcxGridColumn
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
      end
      object tvDolgSex: TcxGridColumn
        Caption = #1055#1086#1083
      end
      object tvDolg_PacId: TcxGridColumn
        Caption = 'PacID'
        Visible = False
        VisibleForCustomization = False
      end
      object tvDolg_NazId: TcxGridColumn
        Caption = 'NazID'
        Visible = False
        VisibleForCustomization = False
      end
      object tvDolg_NameIssl: TcxGridColumn
        Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
      end
      object tvDolg_PeplId: TcxGridColumn
        Caption = 'PeplID'
        Visible = False
        VisibleForCustomization = False
      end
      object tvDolg_State: TcxGridColumn
        Caption = #1057#1090#1072#1090#1091#1089
      end
      object tvDolg_NazsosId: TcxGridColumn
        Caption = 'NazSosId'
        Visible = False
        VisibleForCustomization = False
      end
      object tvDolg_TalonId: TcxGridColumn
        Caption = 'TalonId'
        Visible = False
        VisibleForCustomization = False
      end
      object tvDolg_OplName: TcxGridColumn
        Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099
      end
      object tvDolg_ispolfio: TcxGridColumn
        Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
      end
    end
    object cxGrLevel1: TcxGridLevel
      GridView = tvDolg
    end
  end
  object BM: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 80
    Top = 152
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
      FloatLeft = 236
      FloatTop = 97
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbLoad'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbEditTalon'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbNeyav'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbBase'
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
    object bbLoad: TdxBarButton
      Action = aLoad
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080000000808080008080
        8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000800000008080
        800080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF0000008000
        00008080800080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF000000FF000000FF000000FF000000FF000000FF00
        0000800000008080800080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF000000FF000000FF000000FF000000FF000000FF0000008000
        00008000000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF0000008000
        000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF0000008000
        000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF0000008000
        000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF0000008000
        000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF0000008000
        000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF0000008000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      PaintStyle = psCaptionGlyph
    end
    object bbEditTalon: TdxBarButton
      Action = aEditTalon
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbBase: TdxBarButton
      Action = aBase
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000A56E6E
        9B67679A6666976565A16E6E0000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000A77676C59292C99797B27F7FAA7676A06E6EA16B6BA46D6DA56E6EA46E6E
        0000000000000000000000000000000000000000000000000000000000000000
        00000000DD9393A07272CA9B9BFFDFDFCA9797C39A9AD3B0B0C08F8FB37E7EAF
        7A7AA773739F6A6AA26A6AA26C6CA66D6D000000000000000000000000000000
        000000000000000000B26868A26E6ED1A6A6FFDFDFFFD9D9CB9A9ACFAEAEFFFF
        FFFFFBFBFEEEEEE7CACAD4ACACC29090B58080AC797998646400000000000000
        0000000000000000000000000000C88484A67272DAB3B3FFE3E3FFD8D8FFD9D9
        CF9C9CCDADADFFFDFDFFF6F6FFF6F6FFF7F7FFF8F8FFF8F8FEE3E3B27D7D9864
        64000000000000000000000000000000000000BA7F7FAA7575E2BFBFFFE7E7FF
        DCDCFFD9D9FFD8D8D0A2A2CCABABFFFFFFFFF8F8FFFBFBFFFAFAFFF7F7FFF5F5
        FFEEEEB07C7C966464000000000000000000000000000000000000AE7A7AE5C5
        C5FFEAEAFFE1E1FFDCDCFFD9D9FFD8D8D4A5A5CAAAAAFFFFFFFFFFFFC1A4A4D5
        BCBCF3E2E2FFF7F7FFF1F1B37D7D996666000000000000000000000000000000
        000000AD7878F9DBDBFFE4E4FFE0E0FFDBDBFFD8D8FFD8D8D8AAAACBACACFFFF
        FFFFFFFF794949B09191A98787FFFEFEFFF6F6B37D7D9A676700000000000000
        0000000000000000000000AF7979F8DBDBFFE0E0FFDCDCFFD9D9FFD6D6FFD6D6
        DBAFAFBD8F8FD5BABAE7DADACDBBBBFFFFFFBC9F9FFFFFFFFFFDFDB480809B69
        69000000000000000000000000000000000000AF7B7BFBD9D9FFDDDDFFDADAFF
        D7D7FFD5D5FFD5D5DEB2B2C59191C28B8BC18989BA8383BE8F8FCEACACDBC1C1
        F1E3E3B783839E6A6A000000000000000000000000000000000000B27E7EFDD9
        D9FFDADAFFD7D7FFD5D5FFD2D2FFD2D2E0B5B5DBBDBDFFFBFBF1DCDCE4C5C5DA
        AEAECD9999C28C8CBD8686C18E8E9E6D6D000000000000000000000000000000
        000000B28080FED6D6FFD5D5FFD4D4FFD2D2FFD0D0FFCECEE4BBBBD7BABAFFFB
        FBFFF7F7FFF8F8FFF8F8FFF7F7FFEEEEF7D9D9C896969F6D6D00000000000000
        0000000000000000000000B68181FFD3D3FFD3D3FFD0D0FFCFCFFECDCDFFCCCC
        E6BFBFD7B9B9FFFDFDFFF7F7FFF8F8FFF6F6FFF4F4FFF3F3FFF6F6CA9696A36F
        6F000000000000000000000000000000000000B68282FFD1D1FFCECEFECDCDFF
        CDCDFCC9C9FBC7C7E9C2C2D6B8B8FFFFFFFFFCFCEDDEDEFCEFEFFFFDFDFFF5F5
        FFF7F7CA9595A47171000000000000000000000000000000000000BB8686FFCF
        CFFECCCCFCC9C9FAC7C7F8C5C5F7C4C4EDC7C7D5B8B8FFFFFFFFFFFF90686885
        5959B69696FFF5F5FFFAFAC89494A67373000000000000000000000000000000
        000000BB8A8AFECBCBFAC6C6F7C5C5F6C3C3F4C1C1F2C1C1EFCBCBCFB2B2FFFF
        FFFFFFFF906868FFFFFFAA8686FDF4F4FFFFFFC89494AA777700000000000000
        0000000000000000000000BF8C8CF8C7C7F4C1C1F3C0C0F1BEBEEFBCBCEEBDBD
        F6DADAD7A5A5C68F8FCB9D9DD4B2B2D9BFBFDAC4C4F2E7E7FFFFFFC79595AC79
        79000000000000000000000000000000000000C19090F4C0C0EFBCBCEEBBBBEC
        B7B7F3CECEFDE8E8FFE5E5FFE8E8FFE6E6FBD9D9F4CCCCEAC0C0DFB0B0CC9898
        C08A8AC99696AD7A7A000000000000000000000000000000000000C69393EEBA
        BAE9B4B4EFC3C3FBE6E6FFEAEAFFE4E4FFE2E2FFE0E0FFDEDEFFDCDCFFDBDBFF
        DADAFFDCDCFFDEDEF4C7C7C69595B17C7C000000000000000000000000000000
        000000C89494ECBDBDF9E2E2FFF3F3FFECECFFE9E9FFE6E6FFE4E4FFE2E2FFDF
        DFFFDFDFFFE0E0FAD3D3DBADADC08B8BB98282C3868698747400000000000000
        0000000000000000000000C69494D9B1B1DEBBBBE5C3C3EBCCCCF3D6D6F9E0E0
        FFE7E7FFE8E8FFE0E0E4BDBDCA9A9AC08989C38A8AD290900000000000000000
        00000000000000000000000000000000000000C99191C29393C38E8EC49191C1
        8C8CBF8C8CBE8989BE8888C29090BD8888B88585C88F8F000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
    object bbNeyav: TdxBarButton
      Action = aNeyav
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object al: TActionList
    Images = frmMain.ilMain
    Left = 80
    Top = 104
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ImageIndex = 3
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aLoad: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1085#1077#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099#1093' '#1090#1072#1083#1086#1085#1086#1074
      OnExecute = aLoadExecute
    end
    object aEditTalon: TAction
      Caption = #1044#1072#1085#1085#1099#1077' '#1090#1072#1083#1086#1085#1072
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1072#1084#1073#1091#1083#1072#1090#1086#1088#1085#1086#1075#1086' '#1090#1072#1083#1086#1085#1072
      ImageIndex = 40
      ShortCut = 16468
      OnExecute = aEditTalonExecute
    end
    object aBase: TAction
      Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
      Hint = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' '#1087#1072#1094#1080#1077#1085#1090#1072
      ShortCut = 16450
      OnExecute = aBaseExecute
    end
    object aNeyav: TAction
      Caption = #1053#1077#1103#1074#1082#1072
      Hint = #1055#1086#1089#1090#1072#1074#1080#1090#1100' '#1090#1072#1083#1086#1085#1091' '#1089#1090#1072#1090#1091#1089' '#1085#1077#1103#1074#1082#1072
      ImageIndex = 11
      OnExecute = aNeyavExecute
    end
    object aText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 6
      OnExecute = aTextExecute
    end
    object aWeb: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 7
      OnExecute = aWebExecute
    end
    object aXML: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 8
      OnExecute = aXMLExecute
    end
    object aExcel: TAction
      Caption = 'Excel '#1092#1072#1081#1083
      ImageIndex = 9
      OnExecute = aExcelExecute
    end
  end
  object oqThread: TOracleQuery
    SQL.Strings = (
      'select t1.fk_id,'
      '       asu.do_vrachfio(t1.fk_sotrid) as sotropen,'
      '       t1.fd_opened,'
      '       t1.fk_ambid as PacID,'
      '       t2.fk_peplid as PeplID,'
      '       t2.fc_fam||'#39' '#39'||t2.fc_im||'#39' '#39'||t2.fc_otch as pacfio,'
      '       asu.get_ib(t1.fk_ambid) as numib,'
      '       t2.fd_rojd,'
      '       decode(t2.fp_sex, 0, '#39#1046#39', 1, '#39#1052#39') as sex,'
      '       t3.fk_nazid as NazId,'
      '       asu.get_name_rgissl(t4.fk_smid) as nameissl,'
      '       decode(t4.fk_nazsosid, '
      '              asu.get_nevip, '#39#1053#1045' '#1042#1067#1055'.'#39', '
      '              asu.get_vipnaz, '#39#1042#1067#1055'.'#39','
      '              3, '#39#1053#1045#1071#1042#1050#1040#39', '
      '              asu.get_labvip, '#39#1042#1067#1055'. '#1056#1051#39', '
      '              asu.get_recomend, '#39#1056#1045#1050#1054#1052#1045#1053#1044#1054#1042#1040#1053#1054#39', '
      '              asu.get_nazcancel, '#39#1054#1058#1052#1045#1053#1045#1053#1054#39') state,'
      '       fk_nazsosid,'
      '       (select asu.get_smidname(fk_smid) '
      '          from asu.tib '
      '         where fk_pacid = t4.fk_id '
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'AMBTALON_OPL'#39' connect by prior fk_id = fk_owner)' +
        ') as oplname,'
      '       asu.do_vrachfio(t4.fk_ispolid) as ispolfio'
      '        '
      '          '
      
        '  from asu.tambtalon t1, asu.tambulance t2, asu.tambtalon_naz t3' +
        ', asu.tnazis t4'
      ' where t1.fk_ambid = t2.fk_id'
      
        '   and t1.fk_sotrid in (select fk_id from asu.tsotr where fk_otd' +
        'elid = asu.get_radio_otdel)--get_xrayotdel)--#24640 .6'
      '   and t1.fk_id = t3.fk_talonid'
      '   and t3.fk_nazid = t4.fk_id'
      '   and t4.fk_smid in (select fk_id from asu.tsmid'
      '                      start with fk_id = asu.get_rg_issl'
      '                      connect by prior fk_id = fk_owner)'
      '   and t1.fd_opened > sysdate-183'
      '   and t1.fn_sos = 0'
      '   and (select asu.get_synbyid(fk_smid) '
      '          from asu.tib '
      '         where fk_pacid = t4.fk_id '
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'AMBTALON_OPL'#39' connect by prior fk_id = fk_owner)' +
        ') = '#39'TAL_OPLOMS'#39
      ''
      '')
    Session = frmMain.os
    ReadBuffer = 1
    Optimize = False
    Cursor = crSQLWait
    Threaded = True
    OnThreadRecord = oqThreadThreadRecord
    OnThreadFinished = oqThreadThreadFinished
    OnThreadError = oqThreadThreadError
    Left = 80
    Top = 208
  end
  object memData: TdxMemData
    Indexes = <>
    Persistent.Option = poLoad
    SortOptions = []
    Left = 80
    Top = 264
    object memDatasotropen: TStringField
      FieldName = 'sotropen'
      Size = 100
    end
    object memDatafd_opened: TDateField
      FieldName = 'fd_opened'
    end
    object memDatapacfio: TStringField
      FieldName = 'pacfio'
      Size = 150
    end
    object memDatanumib: TStringField
      FieldName = 'numib'
      Size = 50
    end
    object memDatasex: TStringField
      FieldName = 'sex'
      Size = 1
    end
    object memDataPacID: TIntegerField
      FieldName = 'PacID'
    end
    object memDataNazID: TIntegerField
      FieldName = 'NazID'
    end
    object memDataNameIssl: TStringField
      FieldName = 'NameIssl'
      Size = 300
    end
    object memDatafd_rojd: TDateTimeField
      FieldName = 'fd_rojd'
    end
    object memDataPeplID: TIntegerField
      FieldName = 'PeplID'
    end
    object memDataState: TStringField
      FieldName = 'State'
      Size = 100
    end
    object memDataNazSosId: TIntegerField
      FieldName = 'NazSosId'
    end
    object memDataTalonId: TIntegerField
      FieldName = 'TalonId'
    end
    object memDataoplname: TStringField
      FieldName = 'oplname'
      Size = 100
    end
    object memDataispolfio: TStringField
      FieldName = 'ispolfio'
      Size = 150
    end
  end
  object pmGr: TPopupMenu
    Images = frmMain.ilMain
    Left = 80
    Top = 312
    object N1: TMenuItem
      Action = aEditTalon
    end
    object N3: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 5
      object N4: TMenuItem
        Action = aText
      end
      object Web1: TMenuItem
        Action = aWeb
      end
      object XML1: TMenuItem
        Action = aXML
      end
      object Excel1: TMenuItem
        Action = aExcel
      end
    end
    object N2: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 27
      OnClick = N2Click
    end
  end
  object sdPopUp: TSaveDialog
    Left = 81
    Top = 363
  end
end
