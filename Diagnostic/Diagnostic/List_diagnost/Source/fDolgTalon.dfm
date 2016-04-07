object frmDolgTalon: TfrmDolgTalon
  Left = 286
  Top = 97
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
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
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
        DataBinding.ValueType = 'DateTime'
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
      object tvDolgFIOShort: TcxGridColumn
        Caption = #1060#1048#1054' '#1082#1086#1088#1086#1090#1082#1086
        Visible = False
        VisibleForCustomization = False
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
          Visible = True
          ItemName = 'bbOpenMK'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbNeyav'
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
    object bbNeyav: TdxBarButton
      Action = aNeyav
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbOpenMK: TdxBarButton
      Action = aOpenMK
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
      ImageIndex = 26
      ShortCut = 16468
      OnExecute = aEditTalonExecute
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
    object aOpenMK: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1052#1050
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1052#1077#1076#1080#1094#1080#1085#1089#1082#1091#1102' '#1082#1072#1088#1090#1091' '#1087#1072#1094#1080#1077#1085#1090#1072
      ImageIndex = 0
      OnExecute = aOpenMKExecute
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
      '       trim(t2.fc_fam||'#39' '#39'||'
      
        '       decode(substr(t2.fc_im, 1, 1), null, '#39#39', substr(t2.fc_im,' +
        ' 1, 1)||'#39'. '#39')||'
      
        '       decode(substr(t2.fc_otch, 1, 1), null, '#39#39', substr(t2.fc_o' +
        'tch, 1, 1)||'#39'.'#39')) as pacfio_short,'
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
      '       (select decode(tt.fl_notdoc,'
      
        '              0, tt.fc_name||'#39' '#39'||ti.fc_ser||'#39' '#39'||ti.fc_num||'#39' '#1044 +
        #1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1086': '#39'||to_char(case when ti.fd_prolong > ti.fd_end' +
        ' then ti.fd_prolong else ti.fd_end end, '#39'dd.mm.yyyy'#39'),'
      
        '              null, tt.fc_name||'#39' '#39'||ti.fc_ser||'#39' '#39'||ti.fc_num||' +
        #39' '#1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1086': '#39'||to_char(case when ti.fd_prolong > ti.fd_' +
        'end then ti.fd_prolong else ti.fd_end end, '#39'dd.mm.yyyy'#39'),'
      '              1, tt.fc_name) as oplataname'
      '         from asu.tinsurdocs ti, asu.ttypedoc tt '
      '        where tt.fk_id = ti.fk_typedocid'
      '          and ti.fk_id = t1.fk_insuranceid) as oplname,'
      ''
      '/*       (select asu.get_smidname(fk_smid) '
      '          from asu.tib '
      '         where fk_pacid = t4.fk_id '
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'AMBTALON_OPL'#39' connect by prior fk_id = fk_owner)' +
        ') as oplname, */ '
      '       asu.do_vrachfio(t4.fk_ispolid) as ispolfio'
      '        '
      '          '
      
        '  from asu.tambtalon t1, asu.tambulance t2, asu.tambtalon_naz t3' +
        ', asu.tnazis t4'
      ' where t1.fk_ambid = t2.fk_id'
      '   and t1.fk_sotrid = :psotrid '
      '   and t1.fk_id = t3.fk_talonid'
      '   and t3.fk_nazid = t4.fk_id'
      '   and t1.fd_opened > sysdate-183'
      '   and t1.fn_sos = 0'
      ''
      '/*select * '
      
        '  from (select row_number() over(partition by t4.fk_pacid order ' +
        'by fd_run desc) as rn,              '
      '               t.fk_id,'
      '               asu.do_vrachfio(t.fk_sotrid) as sotropen,'
      '               t.fd_opened,'
      '               t.fk_ambid as PacID,'
      '               a.fk_peplid as PeplID,'
      '               a.fc_fam||'#39' '#39'||a.fc_im||'#39' '#39'||a.fc_otch as pacfio,'
      '               asu.get_ib(t.fk_ambid) as numib,'
      '               a.fd_rojd,'
      '               decode(a.fp_sex, 0, '#39#1046#39', 1, '#39#1052#39') as sex,'
      '               tn.fk_nazid as NazId,'
      '               asu.get_name_rgissl(t4.fk_smid) as nameissl,'
      '               decode(t4.fk_nazsosid, '
      '                      asu.get_nevip, '#39#1053#1045' '#1042#1067#1055'.'#39', '
      '                      asu.get_vipnaz, '#39#1042#1067#1055'.'#39','
      '                      3, '#39#1053#1045#1071#1042#1050#1040#39', '
      '                      asu.get_labvip, '#39#1042#1067#1055'. '#1056#1051#39', '
      '                      asu.get_recomend, '#39#1056#1045#1050#1054#1052#1045#1053#1044#1054#1042#1040#1053#1054#39', '
      '                      asu.get_nazcancel, '#39#1054#1058#1052#1045#1053#1045#1053#1054#39') state,'
      '               fk_nazsosid,'
      '               (select asu.get_smidname(fk_smid) '
      '                  from asu.tib '
      '                 where fk_pacid = t4.fk_id '
      
        '                   and fk_smid in (select fk_id from asu.tsmid s' +
        'tart with fc_synonim = '#39'AMBTALON_OPL'#39' connect by prior fk_id = f' +
        'k_owner)) as oplname,'
      '               asu.do_vrachfio(t4.fk_ispolid) as ispolfio,'
      '               t4.fk_ispolid'
      '               '
      
        '          from asu.tambtalon t, asu.tambtalon_naz tn, asu.tnazis' +
        ' t4, asu.tambulance a'
      '         where t.fk_ambid = a.fk_id'
      '           and t.fk_id = tn.fk_talonid'
      '           and tn.fk_nazid = t4.fk_id'
      '           and t.fn_sos = 0'
      '           and t4.fk_id = tn.fk_nazid'
      '           and t4.fk_nazsosid = asu.get_vipnaz'
      '           and t4.fd_run >= sysdate - 183) ttt'
      ' where ttt.rn = 1 '
      '   and ttt.fk_ispolid = :psotrid */'
      ''
      '')
    Session = frmMain.os
    Optimize = False
    Variables.Data = {
      0300000001000000080000003A50534F54524944030000000000000000000000}
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
      ImageIndex = 20
      OnClick = N2Click
    end
  end
  object sdPopUp: TSaveDialog
    Left = 81
    Top = 363
  end
  object tmrCheckApplication: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrCheckApplicationTimer
    Left = 160
    Top = 140
  end
end
