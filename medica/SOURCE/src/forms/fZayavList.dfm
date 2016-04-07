object frmZayavList: TfrmZayavList
  Left = 230
  Top = 126
  Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
  HelpContext = 11
  Caption = #1057#1087#1080#1089#1086#1082' '#1079#1072#1103#1074#1086#1082' '#1080#1079' '#1072#1087#1090#1077#1082#1080
  ClientHeight = 522
  ClientWidth = 926
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 335
    Width = 926
    Height = 5
    Cursor = crVSplit
    Align = alTop
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 926
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 40
        Width = 926
      end>
    EdgeBorders = [ebTop, ebBottom]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 917
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 58
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = False
      TabOrder = 0
      object ToolButton8: TToolButton
        Left = 0
        Top = 0
        Action = acIns
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton9: TToolButton
        Left = 58
        Top = 0
        Action = acEdit
        ImageIndex = 47
        ParentShowHint = False
        ShowHint = True
      end
      object tbuDel: TToolButton
        Left = 116
        Top = 0
        Action = acDel
      end
      object ToolButton4: TToolButton
        Left = 174
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbuPrint: TToolButton
        Left = 182
        Top = 0
        Caption = #1055#1077#1095#1072#1090#1100
        ImageIndex = 32
        ParentShowHint = False
        ShowHint = True
        OnClick = tbuPrintClick
      end
      object ToolButton2: TToolButton
        Left = 240
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 10
        Style = tbsSeparator
        Visible = False
      end
      object ToolButton6: TToolButton
        Left = 248
        Top = 0
        Action = acRefresh
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton3: TToolButton
        Left = 306
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object Panel1: TPanel
        Left = 314
        Top = 0
        Width = 109
        Height = 36
        Align = alLeft
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object abuSetDocPeriod: TJvArrowButton
          Left = 95
          Top = 0
          Width = 14
          Height = 36
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076' '#1080#1079' '#1089#1087#1080#1089#1082#1072
          Align = alRight
          ArrowWidth = 15
          DropDown = pmDocsFilterPeriod
          Flat = True
          FillFont.Charset = DEFAULT_CHARSET
          FillFont.Color = clWindowText
          FillFont.Height = -11
          FillFont.Name = 'MS Sans Serif'
          FillFont.Style = []
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 95
          Height = 36
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object dedDate1: TcxDateEdit
            Left = 18
            Top = 0
            Hint = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
            EditValue = 0d
            Enabled = False
            ParentShowHint = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DateButtons = [btnToday]
            Properties.InputKind = ikMask
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnEditValueChanged = dedDate1PropertiesEditValueChanged
            Properties.OnValidate = dedDate1PropertiesValidate
            ShowHint = True
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            OnKeyDown = dedDate1KeyDown
            Width = 77
          end
          object dedDate2: TcxDateEdit
            Left = 18
            Top = 16
            Hint = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
            EditValue = 0d
            Enabled = False
            ParentShowHint = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DateButtons = [btnToday]
            Properties.InputKind = ikMask
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnEditValueChanged = dedDate1PropertiesEditValueChanged
            ShowHint = True
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 3
            OnKeyDown = dedDate1KeyDown
            Width = 77
          end
          object chbDate1: TcxCheckBox
            Left = 0
            Top = 0
            ParentColor = False
            Style.Color = clBtnFace
            TabOrder = 0
            OnClick = chbDate1Click
            Width = 21
          end
          object chbDate2: TcxCheckBox
            Left = 0
            Top = 16
            ParentColor = False
            Style.Color = clBtnFace
            TabOrder = 2
            OnClick = chbDate2Click
            Width = 21
          end
        end
      end
      object ToolButton13: TToolButton
        Left = 423
        Top = 0
        Width = 8
        Caption = 'ToolButton13'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 431
        Top = 0
        Action = acEsc
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object sbSum: TStatusBar
    Left = 0
    Top = 501
    Width = 926
    Height = 21
    Panels = <
      item
        Width = 50
      end>
  end
  object grZayavka: TcxGrid
    Left = 0
    Top = 44
    Width = 926
    Height = 291
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object grZayavkaTableView: TcxGridDBTableView
      OnDblClick = acEditExecute
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsZayavka
      DataController.Filter.MaxValueListCount = 1000
      DataController.KeyFieldNames = 'FK_ZAYAVID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00'#1088#39'.'#39';-,0.00'#1088#39'.'#39
          Kind = skSum
          FieldName = 'FN_PRICE'
        end>
      DataController.Summary.SummaryGroups = <
        item
          Links = <
            item
            end>
          SummaryItems.Separator = ', '
          SummaryItems = <>
        end>
      Filtering.ColumnPopup.MaxDropDownItemCount = 12
      OptionsBehavior.CellHints = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      OptionsView.Indicator = True
      Preview.AutoHeight = False
      Preview.MaxLineCount = 2
      Styles.ContentEven = dmMain.cxStyleGridEvenRow
      Styles.ContentOdd = dmMain.cxStyleGridOddRow
      Styles.Inactive = dmMain.cxStyleGridSelectedRow
      Styles.Selection = dmMain.cxStyleGridSelectedRow
      object grZayavkaTableViewFC_ZAYAV_NUM: TcxGridDBColumn
        Caption = #8470' '#1079#1072#1103#1074#1082#1080
        DataBinding.FieldName = 'FC_ZAYAV_NUM'
        Width = 62
      end
      object grZayavkaTableViewFK_ZAYAVID: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1079#1072#1103#1074#1082#1080
        DataBinding.FieldName = 'FK_ZAYAVID'
        Visible = False
        Width = 87
      end
      object grZayavkaTableViewFC_POSTAV: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082' ('#1072#1087#1090#1077#1082#1072')'
        DataBinding.FieldName = 'FC_POSTAV'
        Width = 112
      end
      object grZayavkaTableViewFD_CREATE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
        DataBinding.FieldName = 'FD_CREATE'
        Width = 79
      end
      object grZayavkaTableViewFC_MO_CREATED: TcxGridDBColumn
        Caption = #1057#1086#1079#1076#1072#1083' '#1079#1072#1103#1074#1082#1091
        DataBinding.FieldName = 'FC_MO_CREATED'
        Width = 71
      end
      object grZayavkaTableViewFD_INVOICE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1076#1083#1103' '#1087#1077#1095#1072#1090#1080
        DataBinding.FieldName = 'FD_INVOICE'
        Width = 101
      end
      object grZayavkaTableViewFK_MO_CREATE: TcxGridDBColumn
        DataBinding.FieldName = 'FK_MO_CREATE'
        Visible = False
        VisibleForCustomization = False
        Width = 43
      end
      object grZayavkaTableViewFC_DOVER_NUM: TcxGridDBColumn
        Caption = #8470' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080
        DataBinding.FieldName = 'FC_DOVER_NUM'
        Width = 68
      end
      object grZayavkaTableViewFK_MO_GET: TcxGridDBColumn
        DataBinding.FieldName = 'FK_MO_GET'
        Visible = False
        VisibleForCustomization = False
        Width = 54
      end
      object grZayavkaTableViewFK_MO_ZAYAV: TcxGridDBColumn
        DataBinding.FieldName = 'FK_MO_ZAYAV'
        Visible = False
        VisibleForCustomization = False
        Width = 76
      end
      object grZayavkaTableViewFK_POSTAVID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_POSTAVID'
        Visible = False
        VisibleForCustomization = False
        Width = 122
      end
      object grZayavkaTableViewFD_DOVER_DATE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080
        DataBinding.FieldName = 'FD_DOVER_DATE'
        Width = 109
      end
      object grZayavkaTableViewFC_MO_GET: TcxGridDBColumn
        Caption = #1055#1086#1083#1091#1095#1072#1077#1090' '#1087#1086' '#1079#1072#1103#1074#1082#1077
        DataBinding.FieldName = 'FC_MO_GET'
        Width = 73
      end
      object grZayavkaTableViewFC_MO_ZAYAV: TcxGridDBColumn
        Caption = #1057#1086#1089#1090#1072#1074#1080#1083' '#1079#1072#1103#1074#1082#1091
        DataBinding.FieldName = 'FC_MO_ZAYAV'
        Width = 73
      end
      object grZayavkaTableViewFC_COMMENT: TcxGridDBColumn
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
        DataBinding.FieldName = 'FC_COMMENT'
        Width = 164
      end
    end
    object grZayavkaLevel1: TcxGridLevel
      GridView = grZayavkaTableView
    end
  end
  object grZayavkaDPC: TcxGrid
    Left = 0
    Top = 340
    Width = 926
    Height = 161
    Align = alClient
    TabOrder = 3
    LookAndFeel.Kind = lfFlat
    object grZayavkaDPCDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsZayavka_DPC
      DataController.Filter.MaxValueListCount = 1000
      DataController.Filter.Active = True
      DataController.Filter.AutoDataSetFilter = True
      DataController.KeyFieldNames = 'FK_ZAYAVKA_DPC_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00'#1088#39'.'#39';-,0.00'#1088#39'.'#39
          Kind = skSum
          FieldName = 'FN_SUMM'
        end>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnPopup.MaxDropDownItemCount = 12
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnSorting = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      Preview.AutoHeight = False
      Preview.MaxLineCount = 2
      Styles.ContentEven = dmMain.cxStyleGridDetailEvenRow
      Styles.ContentOdd = dmMain.cxStyleGridDetailOddRow
      Styles.Selection = dmMain.cxStyleGridSelectedRow
      object grZayavkaDPCDBTableView1ROWNUM: TcxGridDBColumn
        Caption = #8470' '#1087'.'#1087'.'
        DataBinding.FieldName = 'ROWNUM'
        Width = 32
      end
      object grZayavkaDPCDBTableView1FK_ZAYAVKA_DPC_ID: TcxGridDBColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'FK_ZAYAVKA_DPC_ID'
        Visible = False
      end
      object grZayavkaDPCDBTableView1FK_MEDIC: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'FK_MEDIC'
        Visible = False
      end
      object grZayavkaDPCDBTableView1FK_ZAYAVKA: TcxGridDBColumn
        DataBinding.FieldName = 'FK_ZAYAVKA'
        Visible = False
        VisibleForCustomization = False
      end
      object grZayavkaDPCDBTableView1FC_MEDIC_NAME: TcxGridDBColumn
        Caption = #1052#1077#1076#1080#1082#1072#1084#1077#1085#1090
        DataBinding.FieldName = 'FC_MEDIC_NAME'
        Width = 628
      end
      object grZayavkaDPCDBTableView1FN_KOL: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086
        DataBinding.FieldName = 'FN_KOL'
        Width = 56
      end
      object grZayavkaDPCDBTableView1FC_EI_NAME: TcxGridDBColumn
        Caption = #1045#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'FC_EI_NAME'
        Width = 196
      end
    end
    object grZayavkaDPCLevel1: TcxGridLevel
      GridView = grZayavkaDPCDBTableView1
    end
  end
  object dsZayavka: TDataSource
    DataSet = odsZayavka
    Left = 32
    Top = 336
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 534
    Top = 22
    object acEsc: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1088#1080#1093#1086#1076#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      ImageIndex = 1
      OnExecute = acEscExecute
    end
    object acIns: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 21
      ShortCut = 115
      OnExecute = acInsExecute
    end
    object acDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 22
      ShortCut = 119
      OnExecute = acDelExecute
    end
    object acEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 3
      ShortCut = 114
      OnExecute = acEditExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      ImageIndex = 15
      ShortCut = 116
      OnExecute = acRefreshExecute
    end
    object acPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 32
      OnExecute = acPrintExecute
    end
    object acGodMode: TAction
      Caption = 'acGodMode'
      ShortCut = 49223
      OnExecute = acGodModeExecute
    end
  end
  object odsZayavka: TOracleDataSet
    SQL.Strings = (
      'select z.*, mo_cr.fc_name as FC_MO_CREATED,'
      '            mo_z.fc_name as FC_MO_zayav,'
      '            mo_g.fc_name as FC_MO_get,'
      '            p.fc_name as FC_POSTAV'
      
        'from med.v$tzayavka z, med.tmo mo_cr, med.tmo mo_z, med.tmo mo_g' +
        ', med.tpostav p'
      
        ' WHERE ((z.FD_CREATE >= TRUNC(:DATE1) or :FILTERED_BY_DATE1 = 0)' +
        ' and (z.FD_CREATE < TRUNC(:DATE2+1) or :FILTERED_BY_DATE2 = 0))'
      '   and (z.fk_mo_create = mo_cr.moid(+))'
      '   and (z.fk_mo_zayav = mo_z.moid(+))'
      '   and (z.fk_mo_get = mo_g.moid(+))'
      '   and (z.fk_postavid = p.postavid(+))'
      ''
      'order by z.FD_CREATE desc'
      '')
    Optimize = False
    Variables.Data = {
      0300000004000000060000003A44415445310C00000000000000000000001200
      00003A46494C54455245445F42595F4441544531030000000400000000000000
      00000000060000003A44415445320C0000000000000000000000120000003A46
      494C54455245445F42595F444154453203000000040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000F0000000A00000046435F434F4D4D454E540100000000000A000000
      46445F494E564F4943450100000000000A000000464B5F5A4159415649440100
      000000000C00000046435F5A415941565F4E554D010000000000090000004644
      5F4352454154450100000000000C000000464B5F4D4F5F435245415445010000
      0000000C00000046435F444F5645525F4E554D01000000000009000000464B5F
      4D4F5F4745540100000000000B000000464B5F4D4F5F5A415941560100000000
      000B000000464B5F504F5354415649440100000000000D00000046445F444F56
      45525F444154450100000000000D00000046435F4D4F5F435245415445440100
      000000000B00000046435F4D4F5F5A415941560100000000000900000046435F
      4D4F5F4745540100000000000900000046435F504F53544156010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    AfterScroll = odsZayavkaAfterScroll
    Left = 36
    Top = 292
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmZayavList\'
    StoredProps.Strings = (
      'grZayavkaDPCDBTableView1FC_EI_NAME.Visible'
      'grZayavkaDPCDBTableView1FC_EI_NAME.Width'
      'grZayavkaDPCDBTableView1FC_MEDIC_NAME.Visible'
      'grZayavkaDPCDBTableView1FC_MEDIC_NAME.Width'
      'grZayavkaDPCDBTableView1FK_MEDIC.Visible'
      'grZayavkaDPCDBTableView1FK_MEDIC.Width'
      'grZayavkaDPCDBTableView1FK_ZAYAVKA.Visible'
      'grZayavkaDPCDBTableView1FK_ZAYAVKA.Width'
      'grZayavkaDPCDBTableView1FK_ZAYAVKA_DPC_ID.Visible'
      'grZayavkaDPCDBTableView1FK_ZAYAVKA_DPC_ID.Width'
      'grZayavkaDPCDBTableView1FN_KOL.Visible'
      'grZayavkaDPCDBTableView1FN_KOL.Width'
      'grZayavkaDPCDBTableView1ROWNUM.Visible'
      'grZayavkaDPCDBTableView1ROWNUM.Width'
      'grZayavkaTableViewFC_COMMENT.Visible'
      'grZayavkaTableViewFC_COMMENT.Width'
      'grZayavkaTableViewFC_DOVER_NUM.Visible'
      'grZayavkaTableViewFC_DOVER_NUM.Width'
      'grZayavkaTableViewFC_MO_CREATED.Visible'
      'grZayavkaTableViewFC_MO_CREATED.Width'
      'grZayavkaTableViewFC_MO_GET.Visible'
      'grZayavkaTableViewFC_MO_GET.Width'
      'grZayavkaTableViewFC_MO_ZAYAV.Visible'
      'grZayavkaTableViewFC_MO_ZAYAV.Width'
      'grZayavkaTableViewFC_POSTAV.Visible'
      'grZayavkaTableViewFC_POSTAV.Width'
      'grZayavkaTableViewFC_ZAYAV_NUM.Visible'
      'grZayavkaTableViewFC_ZAYAV_NUM.Width'
      'grZayavkaTableViewFD_CREATE.Visible'
      'grZayavkaTableViewFD_CREATE.Width'
      'grZayavkaTableViewFD_DOVER_DATE.Visible'
      'grZayavkaTableViewFD_DOVER_DATE.Width'
      'grZayavkaTableViewFD_INVOICE.Visible'
      'grZayavkaTableViewFD_INVOICE.Width'
      'grZayavkaTableViewFK_MO_GET.Visible'
      'grZayavkaTableViewFK_MO_GET.Width'
      'grZayavkaTableViewFK_MO_ZAYAV.Visible'
      'grZayavkaTableViewFK_MO_ZAYAV.Width'
      'grZayavkaTableViewFK_POSTAVID.Visible'
      'grZayavkaTableViewFK_POSTAVID.Width'
      'grZayavkaTableViewFK_ZAYAVID.Visible'
      'grZayavkaTableViewFK_ZAYAVID.Width')
    StoredValues = <>
    Left = 574
    Top = 346
  end
  object odsZayavka_DPC: TOracleDataSet
    SQL.Strings = (
      'select ROWNUM, a.* '
      'from'
      
        '(select z.*, m.fc_name as FC_MEDIC_NAME, ei.fc_name as FC_EI_NAM' +
        'E'
      'from'
      'med.tzayavka_dpc z, med.tmedic m, med.tei ei'
      'where z.fk_medic = m.medicid(+)'
      '  and m.eiid = ei.eiid(+)'
      '  and z.fk_zayavka = :fk_zayavka'
      'order by UPPER(m.fc_name)'
      ') a')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A464B5F5A415941564B41030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000006000000464E5F4B4F4C01000000000006000000524F574E
      554D01000000000011000000464B5F5A415941564B415F4450435F4944010000
      00000008000000464B5F4D454449430100000000000A000000464B5F5A415941
      564B410100000000000D00000046435F4D454449435F4E414D45010000000000
      0A00000046435F45495F4E414D45010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 172
    Top = 436
  end
  object dsZayavka_DPC: TDataSource
    DataSet = odsZayavka_DPC
    Left = 120
    Top = 426
  end
  object pmDocsFilterPeriod: TPopupMenu
    Left = 610
    Top = 26
    object N19: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = N19Click
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object N20: TMenuItem
      Tag = 5
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1076#1077#1085#1100
      OnClick = N19Click
    end
    object N18: TMenuItem
      Tag = 4
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
      OnClick = N19Click
    end
    object N16: TMenuItem
      Tag = 2
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1075#1086#1076
      OnClick = N19Click
    end
    object N21: TMenuItem
      Caption = '-'
    end
    object N17: TMenuItem
      Tag = 3
      Caption = #1055#1088#1086#1096#1083#1099#1081' '#1084#1077#1089#1103#1094
      OnClick = N19Click
    end
    object N15: TMenuItem
      Tag = 1
      Caption = #1055#1088#1086#1096#1083#1099#1081' '#1075#1086#1076
      OnClick = N19Click
    end
  end
  object oqDelZayavka: TOracleQuery
    SQL.Strings = (
      'begin'
      '  med.PKG_ZAYAV.DO_DEL_ZAYAV(:fk_zayavka_id);'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      03000000010000000E0000003A464B5F5A415941564B415F4944030000000000
      000000000000}
    Left = 140
    Top = 30
  end
  object frxZayavka: TfrxReport
    Version = '4.7.21'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39622.351796145800000000
    ReportOptions.LastChange = 40697.371029895830000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      
        'procedure Memo25OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1089#1091#1084#1084#1091', '#1088#39', '#39#1057#1091#1084 +
        #1084#1072#39', s);'
      '  Modified := True;'
      'end;'
      ''
      
        'procedure Memo23OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1060#1048#1054' '#1087#1086#1083#1091#1095#1080#1074#1096#1077#1075#1086#39', '#39#1060#1048#1054#39 +
        ', s);'
      '  Modified := True;'
      'end;'
      ''
      
        'procedure Memo22OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1060#1048#1054' ('#39'+Memo17.text+'#39')'#39',' +
        ' '#39#1060#1048#1054#39', s);'
      '  Modified := True;'
      'end;'
      ''
      
        'procedure Memo21OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1060#1048#1054' '#1089#1086#1089#1090#1072#1074#1080#1090#1077#1083#1103#39', '#39#1060#1048#1054#39 +
        ', s);'
      '  Modified := True;'
      'end;'
      ''
      
        'procedure Memo17OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1100#39', '#39#1044#1086 +
        #1083#1078#1085#1086#1089#1090#1100#39', s);'
      '  Modified := True;'
      'end;'
      ''
      
        'procedure Memo6OnPreviewClick(Sender: TfrxView; Button: TMouseBu' +
        'tton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1100#39', '#39#1044#1086 +
        #1083#1078#1085#1086#1089#1090#1100#39', s);'
      '  Modified := True;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxZayavkaGetValue
    Left = 416
    Top = 256
    Datasets = <
      item
        DataSet = frxDBZayavka
        DataSetName = 'frxDBZayavka'
      end
      item
        DataSet = frxDBZayavka_DPC
        DataSetName = 'frxDBZayavka_DPC'
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 185.000000000000000000
        Top = 16.000000000000000000
        Width = 680.315400000000000000
        object Memo1: TfrxMemoView
          Top = 4.000000000000000000
          Width = 680.315400000000000000
          Height = 27.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#8212#1056#176#1057#1039#1056#1030#1056#1108#1056#176' '#1074#8222#8211' [frxDBZayavka."FC_ZAYAV_NUM"] '#1056#1109#1057#8218' [FormatDateT' +
              'ime('#39'dd.mm.yyyy'#39',<frxDBZayavka."FD_INVOICE">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Top = 31.000000000000000000
          Width = 680.315400000000000000
          Height = 31.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1057#8240#1056#1105#1056#1108#1057#1107' ('#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#181'): [frxDBZayavka."FC_POSTAV"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Top = 62.000000000000000000
          Width = 680.315400000000000000
          Height = 41.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1109#1057#8218' [var_client_name]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Top = 103.000000000000000000
          Width = 680.315400000000000000
          Height = 31.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1111#1056#1109' '#1056#1169#1056#1109#1056#1030#1056#181#1057#1026#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105' '#1074#8222#8211' [frxDBZayavka."FC_DOVER_NUM"] ' +
              #1056#1109#1057#8218' [FormatDateTime('#39'dd.mm.yyyy'#39',<frxDBZayavka."FD_DOVER_DATE">' +
              ')]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Top = 134.000000000000000000
          Width = 85.315400000000000000
          Height = 34.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1056#181#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 85.000000000000000000
          Top = 134.000000000000000000
          Width = 341.315400000000000000
          Height = 34.000000000000000000
          OnPreviewClick = 'Memo6OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 426.000000000000000000
          Top = 134.000000000000000000
          Width = 254.315400000000000000
          Height = 34.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBZayavka."FC_MO_GET"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 85.000000000000000000
          Top = 168.000000000000000000
          Width = 341.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034)
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 426.000000000000000000
          Top = 168.000000000000000000
          Width = 254.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#152#1056#1115)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 26.000000000000000000
        Top = 260.000000000000000000
        Width = 680.315400000000000000
        RowCount = 1
        object Memo8: TfrxMemoView
          Width = 54.000000000000000000
          Height = 26.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'.'#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 54.000000000000000000
          Width = 398.315400000000000000
          Height = 26.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 544.315400000000000000
          Width = 136.000000000000000000
          Height = 26.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 452.315400000000000000
          Width = 92.000000000000000000
          Height = 26.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Height = 21.000000000000000000
        Top = 304.000000000000000000
        Width = 680.315400000000000000
        DataSet = frxDBZayavka_DPC
        DataSetName = 'frxDBZayavka_DPC'
        RowCount = 0
        Stretched = True
        object Memo12: TfrxMemoView
          Width = 54.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 54.000000000000000000
          Width = 398.315400000000000000
          Height = 21.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBZayavka_DPC."FC_MEDIC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 544.315400000000000000
          Width = 136.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBZayavka_DPC."FC_EI_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 452.315400000000000000
          Width = 92.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBZayavka_DPC."FN_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 135.000000000000000000
        Top = 384.000000000000000000
        Width = 680.315400000000000000
        object Memo16: TfrxMemoView
          Left = 54.000000000000000000
          Top = 17.000000000000000000
          Width = 286.000000000000000000
          Height = 22.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8217#1057#8249#1056#1111#1056#1105#1057#1027#1056#176#1056#187)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 54.000000000000000000
          Top = 40.000000000000000000
          Width = 286.000000000000000000
          Height = 22.000000000000000000
          OnPreviewClick = 'Memo17OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8220#1056#187#1056#176#1056#1030'. '#1056#1030#1057#1026#1056#176#1057#8225)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 54.000000000000000000
          Top = 62.000000000000000000
          Width = 286.000000000000000000
          Height = 22.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#1105#1056#187)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 54.000000000000000000
          Top = 84.000000000000000000
          Width = 286.000000000000000000
          Height = 22.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1111#1056#1109' '#1056#1169#1056#1109#1056#1030#1056#181#1057#1026#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 54.000000000000000000
          Top = 106.000000000000000000
          Width = 286.000000000000000000
          Height = 22.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1114#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1057#8249' '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 340.000000000000000000
          Top = 18.000000000000000000
          Width = 262.000000000000000000
          Height = 22.000000000000000000
          OnPreviewClick = 'Memo21OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[frxDBZayavka."FC_MO_ZAYAV"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 340.000000000000000000
          Top = 40.000000000000000000
          Width = 262.000000000000000000
          Height = 22.000000000000000000
          OnPreviewClick = 'Memo22OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[var_glav_vrach]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 340.000000000000000000
          Top = 62.000000000000000000
          Width = 262.000000000000000000
          Height = 22.000000000000000000
          OnPreviewClick = 'Memo23OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[frxDBZayavka."FC_MO_GET"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 340.000000000000000000
          Top = 84.000000000000000000
          Width = 262.000000000000000000
          Height = 22.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            
              #1074#8222#8211' [frxDBZayavka."FC_DOVER_NUM"] '#1056#1109#1057#8218' [FormatDateTime('#39'dd.mm.yy' +
              'yy'#39',<frxDBZayavka."FD_DOVER_DATE">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 340.000000000000000000
          Top = 106.000000000000000000
          Width = 262.000000000000000000
          Height = 22.000000000000000000
          OnPreviewClick = 'Memo25OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          GapX = 5.000000000000000000
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 540.000000000000000000
        Width = 680.315400000000000000
        object Memo26: TfrxMemoView
          Width = 680.315400000000000000
          Height = 19.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBZayavka_DPC: TfrxDBDataset
    UserName = 'frxDBZayavka_DPC'
    CloseDataSource = False
    DataSource = dsZayavka_DPC
    Left = 500
    Top = 256
  end
  object frxDBZayavka: TfrxDBDataset
    UserName = 'frxDBZayavka'
    CloseDataSource = False
    DataSource = dsZayavka
    Left = 500
    Top = 204
  end
  object frxReport1: TfrxReport
    Version = '4.7.21'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40697.370073506900000000
    ReportOptions.LastChange = 40697.681064236110000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxZayavkaGetValue
    Left = 416
    Top = 320
    Datasets = <
      item
        DataSet = frxDBZayavka
        DataSetName = 'frxDBZayavka'
      end
      item
        DataSet = frxDBZayavka_DPC
        DataSetName = 'frxDBZayavka_DPC'
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
      LeftMargin = 20.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 151.779530000000000000
        Top = 16.000000000000000000
        Width = 699.213050000000000000
        object Memo2: TfrxMemoView
          ShiftMode = smDontShift
          Top = 76.000000000000000000
          Width = 442.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1116#1056#1106#1056#1113#1056#8250#1056#1106#1056#8221#1056#1116#1056#1106#1056#1031' - '#1056#1118#1056#160#1056#8226#1056#8216#1056#1115#1056#8217#1056#1106#1056#1116#1056#152#1056#8226' '#1074#8222#8211' _______')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          ShiftMode = smDontShift
          Left = 462.000000000000000000
          Width = 236.000000000000000000
          Height = 104.000000000000000000
          ShowHint = False
          Memo.UTF8 = (
            '               "'#1056#1032#1056#1118#1056#8217#1056#8226#1056#160#1056#8211#1056#8221#1056#1106#1056#174'":'
            ''
            '_______________________________'
            #1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034' '#1057#1026#1057#1107#1056#1108#1056#1109#1056#1030#1056#1109#1056#1169#1056#1105#1057#8218#1056#181#1056#187#1057#1039' '#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039
            ''
            ' "_____" __________________ 20    '#1056#1110'.')
        end
        object Memo18: TfrxMemoView
          ShiftMode = smDontShift
          Top = 120.000000000000000000
          Width = 695.000000000000000000
          Height = 24.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1113#1057#1026#1056#176#1057#1027#1056#1029#1056#1109#1057#8218#1057#1107#1057#1026#1057#1034#1056#1105#1056#1029#1057#1027#1056#1108#1056#1109#1056#181' '#1056#1109#1057#8218#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181' '#1057#1027#1056#176#1056#1029#1056#176#1057#8218#1056#1109 +
              #1057#1026#1056#1105#1057#1039' - '#1056#1111#1057#1026#1056#1109#1057#8222#1056#1105#1056#187#1056#176#1056#1108#1057#8218#1056#1109#1057#1026#1056#1105#1057#1039' '#1056#1115#1056#1115#1056#1115' "'#1056#1118#1057#1035#1056#1112#1056#181#1056#1029#1057#8218#1057#1026#1056#176#1056#1029#1057#1027 +
              #1056#1110#1056#176#1056#183'"')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          ShiftMode = smDontShift
          Width = 295.000000000000000000
          Height = 48.000000000000000000
          ShowHint = False
          Memo.UTF8 = (
            #1056#8217' '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1057#1107' '#1056#1038#1056#1030#1056#181#1057#1026#1056#1169#1056#187#1056#1109#1056#1030#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109
            #1056#1109#1056#177#1056#187#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1057#1107#1056#1111#1057#1026#1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1057#1039' ___________')
        end
      end
      object Header1: TfrxHeader
        Height = 60.000000000000000000
        Top = 228.000000000000000000
        Width = 699.213050000000000000
        object Memo8: TfrxMemoView
          ShiftMode = smDontShift
          Left = 35.000000000000000000
          Width = 260.000000000000000000
          Height = 60.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          ShiftMode = smDontShift
          Left = 360.000000000000000000
          Width = 55.000000000000000000
          Height = 60.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#152#1056#183#1056#1112'.')
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          ShiftMode = smDontShift
          Left = 415.000000000000000000
          Width = 100.000000000000000000
          Height = 30.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          ShiftMode = smDontShift
          Left = 415.000000000000000000
          Top = 30.000000000000000000
          Width = 55.000000000000000000
          Height = 30.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#176#1057#8218#1057#1026#1056#181'-'
            #1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1109)
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          ShiftMode = smDontShift
          Left = 470.000000000000000000
          Top = 30.000000000000000000
          Width = 45.000000000000000000
          Height = 30.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1107'-'
            #1057#8240#1056#181#1056#1029#1056#1109)
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          ShiftMode = smDontShift
          Left = 515.000000000000000000
          Width = 80.000000000000000000
          Height = 60.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176)
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          ShiftMode = smDontShift
          Left = 595.000000000000000000
          Width = 100.000000000000000000
          Height = 60.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          ShiftMode = smDontShift
          Width = 35.000000000000000000
          Height = 60.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211
            #1056#1111'.'#1056#1111'.')
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          ShiftMode = smDontShift
          Left = 295.000000000000000000
          Width = 65.000000000000000000
          Height = 60.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1056#1029#1056#1108#1056#187'.'
            #1056#1029#1056#1109#1056#1112#1056#181#1057#1026)
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 27.000000000000000000
        Top = 308.000000000000000000
        Width = 699.213050000000000000
        DataSet = frxDBZayavka_DPC
        DataSetName = 'frxDBZayavka_DPC'
        RowCount = 0
        object Memo29: TfrxMemoView
          ShiftMode = smDontShift
          Left = 35.000000000000000000
          Width = 260.000000000000000000
          Height = 27.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBZayavka_DPC."FC_MEDIC_NAME"]')
        end
        object Memo30: TfrxMemoView
          ShiftMode = smDontShift
          Left = 360.000000000000000000
          Width = 55.000000000000000000
          Height = 27.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBZayavka_DPC."FC_EI_NAME"]')
        end
        object Memo31: TfrxMemoView
          ShiftMode = smDontShift
          Left = 415.000000000000000000
          Width = 55.000000000000000000
          Height = 27.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBZayavka_DPC."FN_KOL"]')
        end
        object Memo32: TfrxMemoView
          ShiftMode = smDontShift
          Left = 470.000000000000000000
          Width = 45.000000000000000000
          Height = 27.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo33: TfrxMemoView
          ShiftMode = smDontShift
          Left = 515.000000000000000000
          Width = 80.000000000000000000
          Height = 27.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo34: TfrxMemoView
          ShiftMode = smDontShift
          Left = 595.000000000000000000
          Width = 100.000000000000000000
          Height = 27.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo35: TfrxMemoView
          ShiftMode = smDontShift
          Width = 35.000000000000000000
          Height = 27.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
        end
        object Memo36: TfrxMemoView
          ShiftMode = smDontShift
          Left = 295.000000000000000000
          Width = 65.000000000000000000
          Height = 27.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 108.944960000000000000
        Top = 396.000000000000000000
        Width = 699.213050000000000000
        object Memo5: TfrxMemoView
          Left = 35.000000000000000000
          Top = 85.000000000000000000
          Width = 260.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1056#176#1057#1026#1057#8364#1056#176#1057#1039' '#1056#1112#1056#181#1056#1169#1057#1027#1056#181#1057#1027#1057#8218#1057#1026#1056#176)
        end
        object Memo6: TfrxMemoView
          Left = 105.000000000000000000
          Top = 60.000000000000000000
          Width = 190.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          HAlign = haRight
          Memo.UTF8 = (
            #1056#160#1057#1107#1056#1108#1056#1109#1056#1030#1056#1109#1056#1169#1056#1105#1057#8218#1056#181#1056#187#1057#1034' '#1056#187#1056#181#1057#8225#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
        end
        object Memo7: TfrxMemoView
          Top = 60.000000000000000000
          Width = 105.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114'.'#1056#1119'.')
        end
        object Memo23: TfrxMemoView
          Left = 35.000000000000000000
          Top = 15.118120000000000000
          Width = 260.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#8218#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1035)
        end
        object Memo25: TfrxMemoView
          Left = 571.338590000000000000
          Top = 15.118120000000000000
          Width = 124.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftBottom]
        end
        object Memo3: TfrxMemoView
          Left = 360.000000000000000000
          Top = 60.000000000000000000
          Width = 124.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftBottom]
        end
        object Memo4: TfrxMemoView
          Left = 360.000000000000000000
          Top = 85.000000000000000000
          Width = 124.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftBottom]
        end
      end
    end
  end
  object pmZayavPrint: TPopupMenu
    Left = 208
    Top = 112
    object miPrint1: TMenuItem
      Caption = #1054#1073#1099#1095#1085#1072#1103
      Checked = True
      RadioItem = True
      OnClick = miPrint1Click
    end
    object miPrint2: TMenuItem
      Tag = 2
      Caption = #1069#1082#1089#1090'.'
      RadioItem = True
      OnClick = miPrint1Click
    end
  end
end
