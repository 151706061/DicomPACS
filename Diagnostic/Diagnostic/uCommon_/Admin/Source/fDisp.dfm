object frmDisp: TfrmDisp
  Left = 292
  Top = 108
  Caption = #1046#1091#1088#1085#1072#1083' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1072
  ClientHeight = 442
  ClientWidth = 912
  Color = clBtnFace
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
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 906
    Height = 26
    Align = dalTop
    BarManager = BM
    SunkenBorder = False
    UseOwnSunkenBorder = True
  end
  object grJournal: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 32
    Width = 906
    Height = 407
    Margins.Top = 0
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Caramel'
    RootLevelOptions.DetailFrameWidth = 1
    object tvJournal: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = tvJournalCustomDrawCell
      DataController.DataSource = dsJur
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = VJOURNAL_DATEIN
        end
        item
          Kind = skSum
          Column = VJOURNAL_SUM
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.PullFocusing = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnSorting = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.CellEndEllipsis = True
      OptionsView.FocusRect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      Preview.Column = colComment
      Preview.Visible = True
      object VJOURNAL_IMAGE: TcxGridDBColumn
        DataBinding.FieldName = 'FL_SOS'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            Value = '0'
          end
          item
            Value = '1'
          end
          item
            ImageIndex = 1
            Value = '2'
          end
          item
            ImageIndex = 0
            Value = '3'
          end>
        Options.Editing = False
        Options.IncSearch = False
        Width = 20
        IsCaptionAssigned = True
      end
      object colFreeShow: TcxGridDBColumn
        Caption = #1057#1042
        DataBinding.FieldName = 'FL_FREE'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.ImmediateUpdateText = True
        Properties.Items = <
          item
            Value = '0'
          end
          item
            ImageIndex = 2
            Value = '1'
          end>
        Properties.PostPopupValueOnTab = True
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 22
      end
      object VJOURNAL_DOZVON: TcxGridDBColumn
        Caption = #1054#1058
        DataBinding.FieldName = 'FL_DOZVON'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.Items = <
          item
          end
          item
            ImageIndex = 2
            Value = '1'
          end>
        Properties.PostPopupValueOnTab = True
        Options.Editing = False
        Options.IncSearch = False
        Width = 21
      end
      object VJOURNAL_DATEIN: TcxGridDBColumn
        Caption = #1044#1072#1090#1072'/'#1042#1088#1077#1084#1103
        DataBinding.FieldName = 'FD_DATEIN_CHR'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.IncSearch = False
        Width = 101
      end
      object VJOURNAL_NUMTEL: TcxGridDBColumn
        Caption = #8470' '#1090#1077#1083#1077#1092#1086#1085#1072
        DataBinding.FieldName = 'FC_PHONE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.WordWrap = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.IncSearch = False
        Options.ShowEditButtons = isebAlways
        Width = 115
      end
      object VJOURNAL_FROM: TcxGridDBColumn
        Caption = #1040#1076#1088#1077#1089' '#1082#1083#1080#1077#1085#1090#1072
        DataBinding.FieldName = 'FC_ADR1'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.WordWrap = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.IncSearch = False
        Options.ShowEditButtons = isebAlways
        Width = 207
      end
      object VJOURNAL_KUDA: TcxGridDBColumn
        Caption = #1040#1076#1088#1077#1089' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
        DataBinding.FieldName = 'FC_ADR2'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.WordWrap = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.IncSearch = False
        Options.ShowEditButtons = isebAlways
        Width = 130
      end
      object VJOURNAL_NAMEDRV: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'NUMDRV'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.IncSearch = False
        Width = 81
      end
      object VJOURNAL_DRV: TcxGridDBColumn
        Caption = #1052#1072#1096#1080#1085#1072
        DataBinding.FieldName = 'NAMEDRV'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.WordWrap = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.IncSearch = False
        Options.ShowEditButtons = isebAlways
        Width = 88
      end
      object VJOURNAL_FICS: TcxGridDBColumn
        Caption = #1060#1080#1082#1089#1072#1094#1080#1103
        DataBinding.FieldName = 'FD_DATEF_STR'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ImmediatePost = True
        Properties.TimeFormat = tfHourMin
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.IncSearch = False
        Options.ShowEditButtons = isebNever
        Width = 95
      end
      object VJOURNAL_SUM: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072
        DataBinding.FieldName = 'SUM_RAS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.WordWrap = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.IncSearch = False
        Options.ShowEditButtons = isebAlways
        Width = 107
      end
      object colSos: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1091#1089
        DataBinding.FieldName = 'FN_SOS'
        Visible = False
        Options.Editing = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object vJournal_ID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_ID'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object colSos2: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1091#1089'2'
        DataBinding.FieldName = 'FN_SOS2'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object colIsStop: TcxGridDBColumn
        Caption = #1057#1090#1086#1087
        DataBinding.FieldName = 'FL_ISSTOP'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object vJournal_DrvId1: TcxGridDBColumn
        DataBinding.FieldName = 'FK_DRVID'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object vJournal_DrvId2: TcxGridDBColumn
        DataBinding.FieldName = 'FK_DRVID2'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object vJournal_Adr2Id: TcxGridDBColumn
        DataBinding.FieldName = 'FK_ADR2ID'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object colFl_Baggage: TcxGridDBColumn
        DataBinding.FieldName = 'FL_BAGAGE'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object vJournal_JurNum: TcxGridDBColumn
        DataBinding.FieldName = 'JURNUM'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object vJournal_FcNum: TcxGridDBColumn
        DataBinding.FieldName = 'FC_NUM'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object vJournal_FlBonus: TcxGridDBColumn
        DataBinding.FieldName = 'FL_BONUS'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object vJournal_FkClientid: TcxGridDBColumn
        DataBinding.FieldName = 'FK_CLIENTID'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object vJournal_FnNow: TcxGridDBColumn
        DataBinding.FieldName = 'FN_NOW'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object vJournal_FnStop: TcxGridDBColumn
        DataBinding.FieldName = 'FN_STOP'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object vJournal_FlPeregon: TcxGridDBColumn
        DataBinding.FieldName = 'FL_PEREGON'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object colKm1: TcxGridDBColumn
        DataBinding.FieldName = 'FN_KM1'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object colKm2: TcxGridDBColumn
        DataBinding.FieldName = 'FN_KM2'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object colTime: TcxGridDBColumn
        Caption = #1044#1086#1087'. '#1074#1088#1077#1084#1103' (FN_TIME)'
        DataBinding.FieldName = 'FN_TIME'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object vJournal_FdStop: TcxGridDBColumn
        DataBinding.FieldName = 'FD_STOP_CHR'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object vJournal_NumDrv1: TcxGridDBColumn
        DataBinding.FieldName = 'NUMDRV1'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object vJournal_NumDrv2: TcxGridDBColumn
        DataBinding.FieldName = 'NUMDRV2'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object vJournal_NumTelFull: TcxGridDBColumn
        Caption = 'NumTelFull'
        DataBinding.FieldName = 'FC_PHONE_FULL'
        Visible = False
        Options.IncSearch = False
        VisibleForCustomization = False
      end
      object vJournal_FkRaionID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_RAIONID'
        Visible = False
        VisibleForCustomization = False
      end
      object VJOURNAL_FkTypeDetail: TcxGridDBColumn
        DataBinding.FieldName = 'FK_TYPE_DETAIL'
        Visible = False
        VisibleForCustomization = False
      end
      object colSumF: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1092#1072#1082#1090#1091
        DataBinding.FieldName = 'FN_SUMF'
        Visible = False
        VisibleForCustomization = False
      end
      object colSumFMG: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1092#1072#1082#1090#1091' '#1084'/'#1075
        DataBinding.FieldName = 'FN_SUMFMG'
        Visible = False
        VisibleForCustomization = False
      end
      object colComment: TcxGridDBColumn
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
        DataBinding.FieldName = 'FC_COMMENT'
        Width = 49
      end
      object colStopReal: TcxGridDBColumn
        Caption = #1041#1099#1083#1072' '#1086#1089#1090#1072#1085#1086#1074#1082#1072'?'
        DataBinding.FieldName = 'FL_STOP_REAL'
        Visible = False
        VisibleForCustomization = False
      end
      object colFree: TcxGridDBColumn
        DataBinding.FieldName = 'FL_FREE'
        Visible = False
        VisibleForCustomization = False
      end
    end
    object grJournalLevel1: TcxGridLevel
      GridView = tvJournal
    end
  end
  object paDate: TPanel
    Left = 528
    Top = 264
    Width = 89
    Height = 19
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 6
    object deDate: TcxDateEdit
      Left = 0
      Top = 0
      Properties.DateButtons = [btnToday]
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnChange = deDatePropertiesChange
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 0
      Width = 89
    end
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
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 392
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
      FloatLeft = 181
      FloatTop = 60
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'beTaxi'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbBack'
        end
        item
          Visible = True
          ItemName = 'dxBarControlContainerItem1'
        end
        item
          Visible = True
          ItemName = 'bbForward'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefresh'
        end
        item
          Visible = True
          ItemName = 'bbEdit'
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
    object bbBack: TdxBarButton
      Action = aBack
      Category = 0
    end
    object bbForward: TdxBarButton
      Action = aForward
      Category = 0
    end
    object bbClose: TdxBarButton
      Action = aClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefresh: TdxBarButton
      Action = aRefresh
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object beTaxi: TcxBarEditItem
      Caption = #1058#1072#1082#1089#1080':'
      Category = 0
      Hint = #1058#1072#1082#1089#1080
      Visible = ivAlways
      ShowCaption = True
      Width = 100
      PropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'fk_id'
      Properties.ListColumns = <
        item
          FieldName = 'fc_name'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsTaxi
      Properties.PostPopupValueOnTab = True
      Properties.OnEditValueChanged = beTaxiPropertiesEditValueChanged
    end
    object bbPrint: TdxBarButton
      Action = aPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = #1053#1086#1074#1099#1081' '#1101#1083#1077#1084#1077#1085#1090
      Category = 0
      Hint = #1053#1086#1074#1099#1081' '#1101#1083#1077#1084#1077#1085#1090
      Visible = ivAlways
      Control = paDate
    end
    object bbEdit: TdxBarButton
      Action = aEdit
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object al: TActionList
    Images = frmMain.IL
    Left = 312
    Top = 168
    object aBack: TAction
      Hint = #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1076#1077#1085#1100
      ImageIndex = 12
      OnExecute = aBackExecute
    end
    object aForward: TAction
      Hint = #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#1076#1077#1085#1100
      ImageIndex = 11
      OnExecute = aForwardExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1078#1091#1088#1085#1072#1083' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1072
      ImageIndex = 3
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1078#1091#1088#1085#1072#1083' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1072
      ImageIndex = 5
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1078#1091#1088#1085#1072#1083#1072
      ImageIndex = 2
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1050#1072#1088#1090#1086#1095#1082#1072' '#1079#1072#1082#1072#1079#1072
      ImageIndex = 0
      OnExecute = aEditExecute
    end
  end
  object odsJur: TOracleDataSet
    SQL.Strings = (
      
        'select t1.rowid, t1.fk_id, fd_datein, to_char(t1.fd_datein, '#39'dd.' +
        'mm.yyyy hh24:mi'#39') as fd_datein_chr, fd_stop, nvl(to_char(fd_stop' +
        '), '#39'0'#39') as fd_stop_chr,'
      
        '       decode(t1.fn_sos, 5, '#39#1053#1045#1042#1067#1061#1054#1044'! '#39'||t1.fc_adr1, t1.fc_adr1)' +
        '||decode(to_char(fn_stop), 0, '#39#39', null, '#39#39', '#39'(+'#39'||to_char(fn_sto' +
        'p)||'#39')'#39') as fc_adr1, '
      '       t1.fc_comment, t1.fl_free,'
      '       t1.fc_adr2||'#39' '#39'||'
      
        '       decode(decode(to_char(t1.fn_km1), 0, '#39#39', rtrim(to_char(t1' +
        '.fn_km1, '#39'fm9999999999990d9999999'#39'), '#39'.,'#39'))||decode(rtrim(to_cha' +
        'r(t1.fn_km2, '#39'fm9999999999990d9999999'#39'), '#39'.,'#39'), 0, '#39#39', '#39'/'#39'||rtri' +
        'm(to_char(t1.fn_km2, '#39'fm9999999999990d9999999'#39'), '#39'.,'#39')),'
      '              '#39#39','
      
        '              decode(to_char(t1.fn_km1), 0, '#39#39', rtrim(to_char(t1' +
        '.fn_km1, '#39'fm9999999999990d9999999'#39'), '#39'.,'#39'))||decode(rtrim(to_cha' +
        'r(t1.fn_km2, '#39'fm9999999999990d9999999'#39'), '#39'.,'#39'), 0, '#39#39', '#39'/'#39'||rtri' +
        'm(to_char(t1.fn_km2, '#39'fm9999999999990d9999999'#39'), '#39'.,'#39')),'
      
        '              decode(to_char(t1.fn_km1), 0, '#39#39', rtrim(to_char(t1' +
        '.fn_km1, '#39'fm9999999999990d9999999'#39'), '#39'.,'#39'))||decode(rtrim(to_cha' +
        'r(t1.fn_km2, '#39'fm9999999999990d9999999'#39'), '#39'.,'#39'), 0, '#39#39', '#39'/'#39'||rtri' +
        'm(to_char(t1.fn_km2, '#39'fm9999999999990d9999999'#39'), '#39'.,'#39'))||'#39' '#1082#1084#39') ' +
        'as fc_adr2,'
      '       t1.fn_sos, t1.fn_sos2, t1.fn_sos_prev,'
      
        '       taxi.get_phone_without_kodtown(decode(substr(t1.fc_phone,' +
        ' 1, 1), '#39'-'#39', '#39#39', decode(t1.fc_phone, null, '#39#39', t1.fc_phone))) as' +
        ' fc_phone,'
      '       t1.fc_phone_full,'
      
        '       to_char(decode(fn_sos2, 0, (select fd_date from taxi.tpre' +
        'd where fk_jurid = t1.fk_id), t1.fd_datef), '#39'hh24:mi'#39') as fd_dat' +
        'ef_str, '
      '       to_char(fd_datef, '#39'hh24:mi'#39') as fd_datef_chr,'
      
        '       decode(fn_sos2, 0, (select fd_date from taxi.tpred where ' +
        'fk_jurid = t1.fk_id), t1.fd_datef) as fd_datef,'
      
        '       round(decode(t1.fn_sumf, null, t1.fn_sumr, 0, t1.fn_sumr,' +
        ' t1.fn_sumf)) as sum_ras, t1.fn_sumr, t1.fn_sumf, t1.fn_sumfmg,'
      
        '       t1.fd_dater, to_char(t1.fd_dater, '#39'hh24:mi'#39') as fd_dater_' +
        'str,'
      '       t1.fn_km1, t1.fn_km2,'
      
        '       t1.fl_bonus, t1.fl_peregon, t1.fl_bagage, t1.fl_bagage_re' +
        'al, t1.fl_stop_real,'
      '       t1.fn_time, t1.fn_stop, '
      '       t1.fc_num as jurnum, '
      '       t1.fk_drvid, t1.fk_drvid2, t1.fl_isstop, t1.fk_raionid, '
      '       t1.fk_adr1id, nvl(t1.fk_adr2id, 0) as fk_adr2id,'
      '       to_number(t1.fl_pred) as fl_pred,'
      '       t1.fn_time_trip,'
      '       upper(t2.fc_num) as fc_num, '
      '       t2.fl_neopl,'
      
        '       t2.fc_kod, nvl(t2.fn_now, 0) as fn_now, t2.fn_bonus, t2.f' +
        'l_sos, '
      
        '       nvl(t2.fk_id, 0) as fk_clientid, t2.fc_adr, t2.fk_adrid, ' +
        '    '
      '       nvl(decode(t1.fl_bagage_real, '
      
        '              0, t4.fc_name||decode(fk_drvid2, 0, null, '#39', '#39'||(s' +
        'elect fc_name from taxi.ts_drivers where fk_id = fk_drvid2)),'
      
        '              1, t4.fc_name||decode(fk_drvid2, 0, null, '#39', '#39'||(s' +
        'elect fc_name from taxi.ts_drivers where fk_id = fk_drvid2))||'#39' ' +
        '('#1041')'#39'), '#39' '#39') as numdrv,'
      
        '       t4.fc_name as numdrv1, (select fc_name from taxi.ts_drive' +
        'rs where fk_id = fk_drvid2) as numdrv2,'
      '       decode(t4.fc_name, null, '#39#39', t4.fc_auto||'
      
        '       decode(fk_drvid2, 0, null, '#39', '#39'||(select fc_auto from tax' +
        'i.ts_drivers where fk_id = fk_drvid2))) as namedrv, '
      '       t4.fc_phone as drvphone,'
      '       t1.fl_dozvon,'
      '       t5.fc_adr as fc_adr2_detail, t5.fc_dop as fc_dop2_detail,'
      
        '       t6.fc_adr as fc_adr1_detail, t6.fc_dop as fc_dop1_detail,' +
        ' to_number(nvl(t6.fk_type, 0)) as fk_type_detail, t6.fc_street a' +
        's fc_street_detail, '
      
        '       t6.fc_street1 as fc_street1_detail, t6.fl_isdownslash as ' +
        'fl_isdownslash_detail, t6.fk_idadr1 as fk_idadr1_detail, '
      
        '       t6.fk_idadr2 as fk_idadr2_detail, t6.fc_house as fc_house' +
        '_detail, t6.fc_houseliter as fc_houseliter_detail, '
      
        '       t6.fc_hall as fc_hall_detail, t6.fc_adr_place, t6.fc_hous' +
        'efraction, t6.fc_preffix'
      
        '  from taxi.tjournal t1, taxi.ts_client t2, taxi.tphones t3, tax' +
        'i.ts_drivers t4, taxi.tjuradr2 t5, taxi.tjuradr1 t6'
      ' where t1.fk_taxiid = :pfk_taxiid'
      '   and t1.fc_phone = t3.fc_phone(+)'
      '   and t3.fk_clientid = t2.fk_id(+)'
      '   and t1.fk_drvid = t4.fk_id(+) '
      '   and t1.fd_datein >= :pfd_date'
      '   and t1.fd_datein < to_date(:pfd_date)+1'
      '   and t1.fn_sos <> 7'
      '   and t1.fk_id = t5.fk_jurid(+)'
      '   and t1.fk_id = t6.fk_jurid(+)'
      ''
      'order by fn_sos2, fd_datein desc'
      ''
      ''
      ''
      '')
    Optimize = False
    Variables.Data = {
      03000000020000000B0000003A50464B5F544158494944030000000000000000
      000000090000003A5046445F444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000004800000005000000464B5F49440100000000000900000046445F4441
      5445494E0100000000000D00000046445F44415445494E5F4348520100000000
      000700000046445F53544F500100000000000B00000046445F53544F505F4348
      520100000000000700000046435F414452310100000000000A00000046435F43
      4F4D4D454E5401000000000007000000464C5F46524545010000000000070000
      0046435F4144523201000000000006000000464E5F534F530100000000000700
      0000464E5F534F53320100000000000B000000464E5F534F535F505245560100
      000000000800000046435F50484F4E450100000000000D00000046435F50484F
      4E455F46554C4C0100000000000C00000046445F44415445465F535452010000
      0000000C00000046445F44415445465F4348520100000000000800000046445F
      44415445460100000000000700000053554D5F52415301000000000007000000
      464E5F53554D5201000000000007000000464E5F53554D460100000000000900
      0000464E5F53554D464D470100000000000800000046445F4441544552010000
      0000000C00000046445F44415445525F53545201000000000006000000464E5F
      4B4D3101000000000006000000464E5F4B4D3201000000000008000000464C5F
      424F4E55530100000000000A000000464C5F50455245474F4E01000000000009
      000000464C5F4241474147450100000000000E000000464C5F4241474147455F
      5245414C0100000000000C000000464C5F53544F505F5245414C010000000000
      07000000464E5F54494D4501000000000007000000464E5F53544F5001000000
      0000060000004A55524E554D01000000000008000000464B5F44525649440100
      0000000009000000464B5F44525649443201000000000009000000464C5F4953
      53544F500100000000000A000000464B5F5241494F4E49440100000000000900
      0000464B5F41445231494401000000000009000000464B5F4144523249440100
      0000000007000000464C5F505245440100000000000C000000464E5F54494D45
      5F545249500100000000000600000046435F4E554D0100000000000800000046
      4C5F4E454F504C0100000000000600000046435F4B4F44010000000000060000
      00464E5F4E4F5701000000000008000000464E5F424F4E555301000000000006
      000000464C5F534F530100000000000B000000464B5F434C49454E5449440100
      000000000600000046435F41445201000000000008000000464B5F4144524944
      010000000000060000004E554D445256010000000000070000004E554D445256
      31010000000000070000004E554D44525632010000000000070000004E414D45
      4452560100000000000800000044525650484F4E450100000000000900000046
      4C5F444F5A564F4E0100000000000E00000046435F414452325F44455441494C
      0100000000000E00000046435F444F50325F44455441494C0100000000000E00
      000046435F414452315F44455441494C0100000000000E00000046435F444F50
      315F44455441494C0100000000000E000000464B5F545950455F44455441494C
      0100000000001000000046435F5354524545545F44455441494C010000000000
      1100000046435F535452454554315F44455441494C0100000000001500000046
      4C5F4953444F574E534C4153485F44455441494C01000000000010000000464B
      5F4944414452315F44455441494C01000000000010000000464B5F4944414452
      325F44455441494C0100000000000F00000046435F484F5553455F4445544149
      4C0100000000001400000046435F484F5553454C495445525F44455441494C01
      00000000000E00000046435F48414C4C5F44455441494C0100000000000C0000
      0046435F4144525F504C4143450100000000001000000046435F484F55534546
      52414354494F4E0100000000000A00000046435F505245464649580100000000
      00}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 544
    Top = 120
  end
  object dsJur: TDataSource
    DataSet = odsJur
    Left = 544
    Top = 176
  end
  object odsTaxi: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name, fc_synonim '
      '  from taxi.ts_taxi'
      ' where fl_del = 0')
    Optimize = False
    Session = frmMain.os
    Left = 600
    Top = 120
  end
  object dsTaxi: TDataSource
    DataSet = odsTaxi
    Left = 600
    Top = 168
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
    ReportOptions.LastChange = 41278.548196168980000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxListGetValue
    Left = 192
    Top = 112
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
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 1084.725110000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
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
            #1056#8211#1057#1107#1057#1026#1056#1029#1056#176#1056#187' '#1056#1169#1056#1105#1057#1027#1056#1111#1056#181#1057#8218#1057#8225#1056#181#1057#1026#1056#176' '#1056#1029#1056#176' '#1056#1169#1056#176#1057#8218#1057#1107' [DATE]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 52.913420000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
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
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 52.913420000000000000
          Top = 52.913420000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
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
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 162.519790000000000000
          Top = 52.913420000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
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
            #1056#1106#1056#1169#1057#1026#1056#181#1057#1027' '#1056#1108#1056#187#1056#1105#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 544.252320000000000000
          Top = 52.913420000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
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
            #1056#1106#1056#1169#1057#1026#1056#181#1057#1027' '#1056#1029#1056#176#1056#183#1056#1029#1056#176#1057#8225#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 842.835190000000000000
          Top = 52.913420000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
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
            #1056#1119#1056#1109#1056#183#1057#8249#1056#1030#1056#1029#1056#1109#1056#8470)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 929.764380000000000000
          Top = 52.913420000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
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
            #1056#164#1056#1105#1056#1108#1057#1027#1056#176#1057#8224#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 1005.354980000000000000
          Top = 52.913420000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Top = 26.456692910000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#183#1056#176#1056#1108#1056#176#1056#183#1056#1109#1056#1030' - ')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 105.826840000000000000
          Top = 26.456710000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[VSEGO]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 173.858380000000000000
          Top = 26.456710000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1115#1056#177#1057#8240#1056#176#1057#1039' '#1057#1027#1057#1107#1056#1112#1056#1112#1056#176' - ')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 279.685220000000000000
          Top = 26.456727090000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[SUMMA]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 1084.725110000000000000
        DataSet = frxDBList
        DataSetName = 'frxDBList'
        RowCount = 0
        Stretched = True
        object Memo7: TfrxMemoView
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBList."FD_DATEIN_CHR"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 162.519790000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBList."FC_ADR1"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 544.252320000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBList."FC_ADR2"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 842.835190000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."NUMDRV"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 929.764380000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."FD_DATEF_CHR"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 1005.354980000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."SUM_RAS"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 230.551330000000000000
        Width = 1084.725110000000000000
        object Memo12: TfrxMemoView
          Width = 627.401980000000000000
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
            #1056#1106#1056#160#1056#1114' "'#1056#1106#1056#1169#1056#1112#1056#1105#1056#1029#1056#1105#1057#1027#1057#8218#1057#1026#1056#176#1057#8218#1056#1109#1057#1026'" [DATESYS]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 627.401980000000000000
          Width = 457.323130000000000000
          Height = 18.897650000000000000
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
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBList: TfrxDBDataset
    UserName = 'frxDBList'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FK_ID=FK_ID'
      'FD_DATEIN=FD_DATEIN'
      'FD_DATEIN_CHR=FD_DATEIN_CHR'
      'FD_STOP=FD_STOP'
      'FD_STOP_CHR=FD_STOP_CHR'
      'FC_ADR1=FC_ADR1'
      'FC_COMMENT=FC_COMMENT'
      'FL_FREE=FL_FREE'
      'FC_ADR2=FC_ADR2'
      'FN_SOS=FN_SOS'
      'FN_SOS2=FN_SOS2'
      'FN_SOS_PREV=FN_SOS_PREV'
      'FC_PHONE=FC_PHONE'
      'FC_PHONE_FULL=FC_PHONE_FULL'
      'FD_DATEF_STR=FD_DATEF_STR'
      'FD_DATEF_CHR=FD_DATEF_CHR'
      'FD_DATEF=FD_DATEF'
      'SUM_RAS=SUM_RAS'
      'FN_SUMR=FN_SUMR'
      'FN_SUMF=FN_SUMF'
      'FN_SUMFMG=FN_SUMFMG'
      'FD_DATER=FD_DATER'
      'FD_DATER_STR=FD_DATER_STR'
      'FN_KM1=FN_KM1'
      'FN_KM2=FN_KM2'
      'FL_BONUS=FL_BONUS'
      'FL_PEREGON=FL_PEREGON'
      'FL_BAGAGE=FL_BAGAGE'
      'FL_BAGAGE_REAL=FL_BAGAGE_REAL'
      'FL_STOP_REAL=FL_STOP_REAL'
      'FN_TIME=FN_TIME'
      'FN_STOP=FN_STOP'
      'JURNUM=JURNUM'
      'FK_DRVID=FK_DRVID'
      'FK_DRVID2=FK_DRVID2'
      'FL_ISSTOP=FL_ISSTOP'
      'FK_RAIONID=FK_RAIONID'
      'FK_ADR1ID=FK_ADR1ID'
      'FK_ADR2ID=FK_ADR2ID'
      'FL_PRED=FL_PRED'
      'FN_TIME_TRIP=FN_TIME_TRIP'
      'FC_NUM=FC_NUM'
      'FL_NEOPL=FL_NEOPL'
      'FC_KOD=FC_KOD'
      'FN_NOW=FN_NOW'
      'FN_BONUS=FN_BONUS'
      'FL_SOS=FL_SOS'
      'FK_CLIENTID=FK_CLIENTID'
      'FC_ADR=FC_ADR'
      'FK_ADRID=FK_ADRID'
      'NUMDRV=NUMDRV'
      'NUMDRV1=NUMDRV1'
      'NUMDRV2=NUMDRV2'
      'NAMEDRV=NAMEDRV'
      'DRVPHONE=DRVPHONE'
      'FL_DOZVON=FL_DOZVON'
      'FC_ADR2_DETAIL=FC_ADR2_DETAIL'
      'FC_DOP2_DETAIL=FC_DOP2_DETAIL'
      'FC_ADR1_DETAIL=FC_ADR1_DETAIL'
      'FC_DOP1_DETAIL=FC_DOP1_DETAIL'
      'FK_TYPE_DETAIL=FK_TYPE_DETAIL'
      'FC_STREET_DETAIL=FC_STREET_DETAIL'
      'FC_STREET1_DETAIL=FC_STREET1_DETAIL'
      'FL_ISDOWNSLASH_DETAIL=FL_ISDOWNSLASH_DETAIL'
      'FK_IDADR1_DETAIL=FK_IDADR1_DETAIL'
      'FK_IDADR2_DETAIL=FK_IDADR2_DETAIL'
      'FC_HOUSE_DETAIL=FC_HOUSE_DETAIL'
      'FC_HOUSELITER_DETAIL=FC_HOUSELITER_DETAIL'
      'FC_HALL_DETAIL=FC_HALL_DETAIL'
      'FC_ADR_PLACE=FC_ADR_PLACE'
      'FC_HOUSEFRACTION=FC_HOUSEFRACTION'
      'FC_PREFFIX=FC_PREFFIX')
    DataSet = odsJur
    BCDToCurrency = False
    Left = 192
    Top = 160
  end
end
