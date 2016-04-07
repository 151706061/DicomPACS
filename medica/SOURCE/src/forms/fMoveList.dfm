object frmMoveList: TfrmMoveList
  Left = 206
  Top = 115
  HelpContext = 8
  Caption = #1057#1087#1080#1089#1086#1082' '#1088#1072#1089#1093#1086#1076#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  ClientHeight = 541
  ClientWidth = 1110
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnHelp = FormHelp
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 431
    Width = 1110
    Height = 5
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 379
    ExplicitWidth = 1016
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 1110
    Height = 96
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 92
        Width = 1108
      end>
    EdgeBorders = [ebTop, ebBottom]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 1101
      Height = 92
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 44
      ButtonWidth = 82
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      OnMouseMove = FormMouseMove
      object tbuAdd: TToolButton
        Left = 0
        Top = 0
        Hint = #1053#1086#1074#1099#1081' '#1088#1072#1089#1093#1086#1076#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        DropdownMenu = pmAdd
        ImageIndex = 48
        Style = tbsDropDown
        OnClick = tbuAddClick
        OnMouseMove = FormMouseMove
      end
      object ToolButton14: TToolButton
        Left = 97
        Top = 0
        Action = acTreb
      end
      object ToolButton5: TToolButton
        Left = 179
        Top = 0
        Action = acReturn
        Caption = #1042#1086#1079#1074#1088#1072#1090
      end
      object ToolButton9: TToolButton
        Left = 261
        Top = 0
        Action = acedit
        ImageIndex = 47
        OnMouseMove = FormMouseMove
      end
      object ToolButton10: TToolButton
        Left = 343
        Top = 0
        Action = acdel
        OnMouseMove = FormMouseMove
      end
      object ToolButton3: TToolButton
        Left = 425
        Top = 0
        Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1103
        DropdownMenu = pmIns
        ImageIndex = 6
        Style = tbsDropDown
        Visible = False
        OnClick = ToolButton3Click
        OnMouseMove = FormMouseMove
      end
      object tbActSpisUchGroupsHANTY: TToolButton
        Left = 522
        Top = 0
        Hint = #1040#1082#1090' '#1089#1087#1080#1089#1072#1085#1080#1103' '#1087#1086' '#1091#1095#1077#1090#1085#1099#1084' '#1075#1088#1091#1087#1087#1072#1084
        Caption = #1040#1082#1090' '#1089#1087#1080#1089#1072#1085#1080#1103
        ImageIndex = 32
        Wrap = True
        OnClick = miActSpis_var3ClickStart
      end
      object tbuPrint: TToolButton
        Left = 0
        Top = 44
        Caption = #1055#1077#1095#1072#1090#1100
        ImageIndex = 32
        Style = tbsDropDown
        OnClick = tbuPrintClick
        OnMouseMove = FormMouseMove
      end
      object ToolButton7: TToolButton
        Left = 97
        Top = 44
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 2
        Style = tbsSeparator
        OnMouseMove = FormMouseMove
      end
      object tbuPrintActSpisInPeriod: TToolButton
        Left = 105
        Top = 44
        Caption = #1055#1077#1095#1072#1090#1100' '#1074#1089#1077#1093
        ImageIndex = 32
        OnClick = tbuPrintActSpisInPeriodClick
      end
      object ToolButton2: TToolButton
        Left = 187
        Top = 44
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object tbuSign: TToolButton
        Left = 195
        Top = 44
        Action = acSign
      end
      object ToolButton12: TToolButton
        Left = 277
        Top = 44
        Width = 8
        Caption = 'ToolButton12'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton6: TToolButton
        Left = 285
        Top = 44
        Action = acrefresh
        OnMouseMove = FormMouseMove
      end
      object ToolButton13: TToolButton
        Left = 367
        Top = 44
        Width = 8
        Caption = 'ToolButton13'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object Panel2: TPanel
        Left = 375
        Top = 44
        Width = 109
        Height = 44
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object abuSetDocPeriod: TJvArrowButton
          Left = 95
          Top = 0
          Width = 14
          Height = 44
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
          ExplicitHeight = 36
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 95
          Height = 44
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object dedDate1: TcxDateEdit
            Left = 18
            Top = 0
            Hint = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
            EditValue = 0d
            Enabled = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DateButtons = [btnToday]
            Properties.InputKind = ikMask
            Properties.PostPopupValueOnTab = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnEditValueChanged = dedDate1PropertiesEditValueChanged
            Properties.OnValidate = dedDate1PropertiesValidate
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
            Properties.Alignment.Horz = taRightJustify
            Properties.DateButtons = [btnToday]
            Properties.InputKind = ikMask
            Properties.PostPopupValueOnTab = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnEditValueChanged = dedDate1PropertiesEditValueChanged
            Properties.OnValidate = dedDate1PropertiesValidate
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
      object ToolButton8: TToolButton
        Left = 484
        Top = 44
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 492
        Top = 44
        Hint = #1047#1072#1082#1088#1099#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1088#1072#1089#1093#1086#1076#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        Action = acesc
        OnMouseMove = FormMouseMove
      end
    end
  end
  object cxGridMoveList: TcxGrid
    Left = 0
    Top = 96
    Width = 1110
    Height = 335
    Align = alTop
    BevelInner = bvNone
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object cxGridMoveListDBTableView1: TcxGridDBTableView
      OnDblClick = cxGridMoveListDBTableView1DblClick
      OnMouseMove = FormMouseMove
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = cxGridMoveListDBTableView1CustomDrawCell
      OnFocusedRecordChanged = cxGridMoveListDBTableView1FocusedRecordChanged
      DataController.DataSource = dsSelDocMove
      DataController.Filter.MaxValueListCount = 1000
      DataController.KeyFieldNames = 'DPID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00'#1088#39'.'#39';-,0.00'#1088#39'.'#39
          Kind = skSum
          FieldName = 'FN_PRICE'
          Column = cxGridMoveListDBTableView1FN_PRICE
        end>
      DataController.Summary.SummaryGroups = <
        item
          Links = <
            item
              Column = cxGridMoveListDBTableView1FN_PRICE
            end>
          SummaryItems.Separator = ', '
          SummaryItems = <>
        end>
      Filtering.ColumnPopup.MaxDropDownItemCount = 12
      OptionsBehavior.CellHints = True
      OptionsBehavior.FocusCellOnTab = True
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
      Styles.Selection = dmMain.cxStyleGridSelectedRow
      Styles.Footer = dmMain.cxStyleFooter
      object cxGridMoveListDBTableView1FD_DATA: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
        DataBinding.FieldName = 'FD_DATA'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.DateButtons = [btnClear, btnToday]
        Properties.DateOnError = deToday
        Properties.ReadOnly = True
        Properties.SaveTime = False
        Visible = False
        HeaderAlignmentHorz = taCenter
        MinWidth = 60
        Options.Editing = False
        SortIndex = 1
        SortOrder = soDescending
        Width = 106
      end
      object cxGridMoveListDBTableView1FD_INVOICE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'FD_INVOICE'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Properties.SaveTime = False
        Options.Editing = False
        SortIndex = 0
        SortOrder = soDescending
        Width = 95
      end
      object cxGridMoveListDBTableView1FC_NAMEDOC: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'FC_DOCNAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Options.Editing = False
        Width = 68
      end
      object cxGridMoveListDBTableView1FC_DOC: TcxGridDBColumn
        Caption = #8470' '#1076#1086#1082'-'#1090#1072
        DataBinding.FieldName = 'FC_DOC'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 50
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 69
      end
      object cxGridMoveListDBTableView1FC_DOCMIX: TcxGridDBColumn
        Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_DOCMIX'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 4000
        Properties.ReadOnly = True
        MinWidth = 84
        Options.Editing = False
        Width = 107
      end
      object cxGridMoveListDBTableView1FC_MOGROUPID_FROM: TcxGridDBColumn
        Caption = #1054#1090#1082#1091#1076#1072
        DataBinding.FieldName = 'FC_MOGROUPID_FROM'
        PropertiesClassName = 'TcxTextEditProperties'
        MinWidth = 67
        Options.Editing = False
        Width = 120
      end
      object cxGridMoveListDBTableView1FC_MOGROUPID_TO: TcxGridDBColumn
        Caption = #1050#1091#1076#1072
        DataBinding.FieldName = 'FC_MOGROUPID_TO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 100
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 114
      end
      object cxGridMoveListDBTableView1FC_RashPrichina: TcxGridDBColumn
        Caption = #1055#1088#1080#1095#1080#1085#1072' '#1089#1087#1080#1089#1072#1085#1080#1103
        DataBinding.FieldName = 'FC_RashPrichina'
        Width = 89
      end
      object cxGridMoveListDBTableView1FN_PRICE: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091', '#1088
        DataBinding.FieldName = 'FN_PRICE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.Nullable = False
        Properties.ReadOnly = True
        MinWidth = 60
        Options.Editing = False
        Width = 130
      end
      object cxGridMoveListDBTableView1FC_COMMENT: TcxGridDBColumn
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
        DataBinding.FieldName = 'FC_COMMENT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 250
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 157
      end
      object cxGridMoveListDBTableView1VIDMOVE: TcxGridDBColumn
        Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072':'
        DataBinding.FieldName = 'VIDMOVE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 4000
        Properties.ReadOnly = True
        Visible = False
        Options.Editing = False
        VisibleForCustomization = False
        Width = 91
      end
      object cxGridMoveListDBTableView1POD: TcxGridDBColumn
        Caption = #1055#1086#1076#1087#1080#1089#1072#1085':'
        DataBinding.FieldName = 'POD'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 3
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 53
      end
      object cxGridMoveListDBTableView1DPID: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'DPID'
        Visible = False
      end
      object cxGridMoveListDBTableView1FC_FINSOURCE: TcxGridDBColumn
        Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
        DataBinding.FieldName = 'FC_FINSOURCE'
        Width = 100
      end
      object cxGridMoveListDBTableView1FC_PROFIL: TcxGridDBColumn
        Caption = #1055#1088#1086#1092#1080#1083#1100
        DataBinding.FieldName = 'FC_PROFIL'
        Visible = False
        Width = 70
      end
    end
    object cxGridMoveListLevel1: TcxGridLevel
      GridView = cxGridMoveListDBTableView1
    end
  end
  object cxGridRashKart: TcxGrid
    Left = 0
    Top = 436
    Width = 1110
    Height = 105
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
    object cxGridRashKartDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = cxGridRashKartDBTableView1CustomDrawCell
      DataController.DataSource = dsKart
      DataController.Filter.MaxValueListCount = 1000
      DataController.Filter.Active = True
      DataController.Filter.AutoDataSetFilter = True
      DataController.KeyFieldNames = 'ROWNUM'
      DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00'#1088#39'.'#39';-,0.00'#1088#39'.'#39
          Kind = skSum
          FieldName = 'SUMM'
          Column = cxGridRashKartDBTableView1SUMM
        end
        item
          Kind = skSum
        end
        item
          Format = ',0.00'#39'.'#39';-,0.00'#39'.'#39
          Kind = skSum
          FieldName = 'FN_KOL'
          Column = cxGridRashKartDBTableView1FN_KOL
        end>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnPopup.MaxDropDownItemCount = 12
      OptionsBehavior.CellHints = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      Preview.AutoHeight = False
      Preview.MaxLineCount = 2
      Styles.ContentEven = dmMain.cxStyleGridDetailEvenRow
      Styles.ContentOdd = dmMain.cxStyleGridDetailOddRow
      Styles.Selection = dmMain.cxStyleGridSelectedRow
      object cxGridRashKartDBTableView1ROWNUM: TcxGridDBColumn
        Caption = #8470' '#1087'/'#1087
        DataBinding.FieldName = 'ROWNUM'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Width = 33
      end
      object cxGridRashKartDBTableView1NAMEKART: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
        DataBinding.FieldName = 'NAMEKART'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.MaxLength = 255
        Properties.ReadOnly = True
        MinWidth = 150
        Options.Editing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 150
      end
      object cxGridRashKartDBTableView1FC_INTERNATIONAL_NAME: TcxGridDBColumn
        Caption = #1052#1077#1078#1076#1091#1085#1072#1088#1086#1076#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_INTERNATIONAL_NAME'
        Visible = False
        Width = 150
      end
      object cxGridRashKartDBTableView1FN_PARTY_NUM: TcxGridDBColumn
        Caption = #8470' '#1087#1072#1088#1090#1080#1080
        DataBinding.FieldName = 'FN_PARTY_NUM'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Width = 61
      end
      object cxGridRashKartDBTableView1FC_SERIAL: TcxGridDBColumn
        Caption = #1057#1077#1088'. '#8470
        DataBinding.FieldName = 'FC_SERIAL'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.MaxLength = 50
        Properties.ReadOnly = True
        Width = 64
      end
      object cxGridRashKartDBTableView1FD_GODEN: TcxGridDBColumn
        Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080
        DataBinding.FieldName = 'FD_GODEN'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.SaveTime = False
        Properties.ShowTime = False
        Visible = False
        Options.Editing = False
      end
      object cxGridRashKartDBTableView1FN_KOL: TcxGridDBColumn
        Caption = #1054#1090#1087#1091#1097#1077#1085#1086':'
        DataBinding.FieldName = 'FN_KOL'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = '### ### ### ##0.#######'
        Properties.MaxValue = 100000000.000000000000000000
        Properties.ReadOnly = True
        MinWidth = 53
        Width = 71
      end
      object cxGridRashKartDBTableView1FC_EDIZM: TcxGridDBColumn
        Caption = #1045#1076'. '#1048#1079#1084'.'
        DataBinding.FieldName = 'FC_EDIZM'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.MaxLength = 4000
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 42
      end
      object cxGridRashKartDBTableView1FN_PRICE: TcxGridDBColumn
        Caption = #1062#1077#1085#1072', '#1088
        DataBinding.FieldName = 'FN_PRICE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.UseThousandSeparator = True
        Width = 42
      end
      object cxGridRashKartDBTableView1SUMM: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1088
        DataBinding.FieldName = 'SUMM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.Nullable = False
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Options.Editing = False
        Width = 69
      end
      object cxGridRashKartDBTableView1ODR: TcxGridDBColumn
        DataBinding.FieldName = 'ODR'
        Visible = False
        VisibleForCustomization = False
        Width = 36
      end
      object cxGridRashKartDBTableView1KARTID: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1087#1072#1088#1090#1080#1080
        DataBinding.FieldName = 'KARTID'
        Visible = False
      end
      object cxGridRashKartDBTableView1MEDICID: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'MEDICID'
        Visible = False
      end
      object cxGridRashKartDBTableView1FD_DATE_SPIS: TcxGridDBColumn
        Caption = #1050#1086#1075#1076#1072' '#1089#1087#1080#1089#1072#1085#1086
        DataBinding.FieldName = 'FD_DATE_SPIS'
        PropertiesClassName = 'TcxDateEditProperties'
        Options.Editing = False
        Width = 61
      end
      object cxGridRashKartDBTableView1fc_inv_nomer: TcxGridDBColumn
        Caption = #1048#1085#1074'. '#1085#1086#1084#1077#1088
        DataBinding.FieldName = 'fc_inv_nomer'
        Width = 62
      end
      object cxGridRashKartDBTableView1FC_QUOTA_CODE: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1082#1074#1086#1090#1099
        DataBinding.FieldName = 'FC_QUOTA_CODE'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.AlwaysShowBlanksAndLiterals = True
        Properties.EditMask = '00-00-00-00;0;_'
        Width = 61
      end
      object cxGridRashKartDBTableView1FN_NDS: TcxGridDBColumn
        Caption = #1053#1044#1057', %'
        DataBinding.FieldName = 'FN_NDS'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = ',0.###%'
        Properties.EditFormat = ',0.###'
        Width = 61
      end
      object cxGridRashKartDBTableView1FN_PRICE_MNF: TcxGridDBColumn
        Caption = #1062#1077#1085#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103
        DataBinding.FieldName = 'FN_PRICE_MNF'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Width = 74
      end
      object cxGridRashKartDBTableView1FN_NACENKA: TcxGridDBColumn
        Caption = #1053#1072#1094#1077#1085#1082#1072', %'
        DataBinding.FieldName = 'FN_NACENKA'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = ',0.###%'
        Properties.EditFormat = ',0.###'
        Width = 49
      end
      object cxGridRashKartDBTableView1FL_JNVLS: TcxGridDBColumn
        Caption = #1046#1053#1042#1051#1055
        DataBinding.FieldName = 'FL_JNVLS'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Width = 61
      end
      object cxGridRashKartDBTableView1FL_MIBP: TcxGridDBColumn
        Caption = #1052#1048#1041#1055
        DataBinding.FieldName = 'FL_MIBP'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 61
      end
      object cxGridRashKartDBTableView1FL_FORMULAR: TcxGridDBColumn
        Caption = #1060#1086#1088#1084#1091#1083#1103#1088
        DataBinding.FieldName = 'FL_FORMULAR'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 61
      end
      object cxGridRashKartDBTableView1FK_FINSOURCE_ID: TcxGridDBColumn
        Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
        DataBinding.FieldName = 'FK_FINSOURCE_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
            FieldName = 'FC_NAME'
          end>
        Properties.ListSource = dmMain.dsTFinSource
      end
      object cxGridRashKartDBTableView1FC_CREATE_MO: TcxGridDBColumn
        Caption = #1050#1077#1084' '#1089#1086#1079#1076#1072#1085#1086
        DataBinding.FieldName = 'FC_CREATE_MO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Visible = False
        Width = 60
      end
      object cxGridRashKartDBTableView1FC_EDIT_MO: TcxGridDBColumn
        Caption = #1050#1077#1084' '#1080#1079#1084#1077#1085#1077#1085#1086
        DataBinding.FieldName = 'FC_EDIT_MO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Visible = False
        Width = 60
      end
      object cxGridRashKartDBTableView1FC_REMARK: TcxGridDBColumn
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_REMARK'
        Visible = False
        Width = 100
      end
    end
    object cxGridRashKartLevel1: TcxGridLevel
      GridView = cxGridRashKartDBTableView1
    end
  end
  object alAll: TActionList
    Images = dmMain.ilMain
    Left = 744
    Top = 96
    object acesc: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1088#1080#1093#1086#1076#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      ImageIndex = 1
      OnExecute = acescExecute
    end
    object acins: TAction
      Category = 'Add'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 48
      ShortCut = 115
      OnExecute = acinsExecute
    end
    object acdel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 22
      ShortCut = 119
      OnExecute = acdelExecute
    end
    object acedit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 3
      ShortCut = 114
      OnExecute = aceditExecute
    end
    object acrefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      ImageIndex = 15
      ShortCut = 116
      OnExecute = acrefreshExecute
    end
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 49232
      OnExecute = Action1Execute
    end
    object acPrnConsuptionAct: TAction
      Category = 'Print'
      Caption = #1040#1082#1090' '#1086' '#1089#1087#1080#1089#1072#1085#1080#1080
      OnExecute = acPrnConsuptionActExecute
    end
    object acPrnBordereauSample: TAction
      Category = 'Print'
      Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1074#1099#1073#1086#1088#1082#1080
      Enabled = False
      Visible = False
      OnExecute = acPrnBordereauSampleExecute
    end
    object acPrnInvoice: TAction
      Category = 'Print'
      Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103
      ImageIndex = 32
      OnExecute = acPrnInvoiceExecute
    end
    object acSign: TAction
      Caption = ' '#160#1059#1090#1074#1077#1088#1076#1080#1090#1100#160#160
      ImageIndex = 47
      OnExecute = acSignExecute
    end
    object acReturn: TAction
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1074' '#1072#1087#1090#1077#1082#1091
      Hint = #1042#1086#1079#1074#1088#1072#1090' '#1074' '#1072#1087#1090#1077#1082#1091
      ImageIndex = 5
      OnExecute = acReturnExecute
    end
    object acTreb: TAction
      Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1103
      ImageIndex = 6
      ShortCut = 117
      OnExecute = acTrebExecute
    end
    object acInsertByTreb: TAction
      Category = 'Add'
      Caption = #1056#1072#1089#1093#1086#1076' '#1087#1086' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1102
      HelpContext = 81
      HelpType = htContext
      Hint = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1088#1072#1089#1093#1086#1076' '#1087#1086' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103#1084' '#1086#1090' '#1052#1054
      ImageIndex = 48
      ShortCut = 8307
      OnExecute = acInsertByTrebExecute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 16464
      OnExecute = Action2Execute
    end
    object acSpisanie: TAction
      Category = 'Add'
      Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074
      HelpContext = 82
      HelpType = htContext
      Hint = #1057#1087#1080#1089#1072#1085#1080#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074
      OnExecute = acSpisanieExecute
    end
    object acGodMode: TAction
      Caption = 'acGodMode'
      ShortCut = 49223
      OnExecute = acGodModeExecute
    end
    object acPrnReturn: TAction
      Category = 'Print'
      Caption = #1042#1086#1079#1074#1088#1072#1090
      OnExecute = acPrnReturnExecute
    end
    object acReturnPostav: TAction
      Category = 'Add'
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091
      OnExecute = acReturnPostavExecute
    end
    object acPrnReturnPostav: TAction
      Category = 'Print'
      Caption = 'acPrnReturnPostav'
      OnExecute = acPrnReturnPostavExecute
    end
    object acOtpuskPoNacPr: TAction
      Category = 'Add'
      Caption = #1054#1090#1087#1091#1089#1082' '#1087#1086' '#1085#1072#1094'. '#1087#1088#1086#1077#1082#1090#1091
      OnExecute = acOtpuskPoNacPrExecute
    end
    object acOtpuskPoCelProg: TAction
      Category = 'Add'
      Caption = #1054#1090#1087#1091#1089#1082' '#1087#1086' '#1094#1077#1083'. '#1087#1088#1086#1075#1088#1072#1084#1084#1072#1084
      OnExecute = acOtpuskPoCelProgExecute
    end
    object acPrnOtpuskPo_: TAction
      Category = 'Print'
      Caption = 'acPrnOtpuskPo_'
      OnExecute = acPrnOtpuskPo_Execute
    end
    object acToRezerv: TAction
      Category = 'Add'
      Caption = #1055#1086#1084#1077#1089#1090#1080#1090#1100' '#1074' '#1088#1077#1079#1077#1088#1074
      OnExecute = acToRezervExecute
    end
    object acPrnKARD_LIST: TAction
      Category = 'Print'
      Caption = 'acPrnKARD_LIST'
      OnExecute = acPrnKARD_LISTExecute
    end
    object acSpisanieHITEC: TAction
      Category = 'Add'
      Caption = #1042#1099#1089'. '#1090#1077#1093#1085#1086#1083#1086#1075#1080#1080
      OnExecute = acSpisanieHITECExecute
    end
    object ActTrebNaklShort: TAction
      Caption = #1050#1088#1072#1090#1082#1072#1103' '#1092#1086#1088#1084#1072
      OnExecute = ActTrebNaklShortExecute
    end
    object acPrnNarcoticAct: TAction
      Category = 'Print'
      Caption = #1040#1082#1090' '#1053#1057' '#1080' '#1055#1042
      OnExecute = acPrnNarcoticActExecute
    end
  end
  object odsPostav: TOracleDataSet
    SQL.Strings = (
      'select /*+rule*/ * from MED.vpostav')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000008000000504F535441564944010000000000070000004643
      5F4E414D450100000000000B00000046435F424F5353444F4C47010000000000
      0A00000046435F424F535346494F010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 152
    Top = 248
  end
  object odsSelMO: TOracleDataSet
    SQL.Strings = (
      'select /*+rule*/ rowid,vchmo.* from MED.vchmo')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0400000002000000040000004D4F49440100000000000700000046435F4E414D
      45010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 208
    Top = 224
  end
  object odsSelDocMove: TOracleDataSet
    SQL.Strings = (
      'select'
      '--    vmove.rowid,'
      '    decode(vmove.fl_edit,0,'#39#1044#1072#39',1,'#39#1053#1077#1090#39') as pod,'
      '    vmove.*,'
      
        '   TO_CHAR(vmove.FD_INVOICE, '#39'DD.MM.YYYY'#39') as FC_INVOICE_DDMMYYY' +
        'Y,'
      '--   SV.fc_name as FC_RashPrichina'
      '   MED.PKGTDOCS.GET_SPISANIE_DETAIL_DESCR ( vmove.FP_VID,'
      '                                           vmove.FP_VIDMOVE,'
      '                                           vmove.FN_SPISANIEVID,'
      
        '                                           vmove.FK_MOGROUPID_TO' +
        ' ) as FC_RashPrichina,'
      '   tfinsource.fc_name fc_finsource,'
      '   tdocs.fc_kontrakt,'
      '   ts_sprav.fc_name fc_mofromdolgnost,'
      '   (SELECT COUNT(1) FROM MED.TCLOSEDPERIODS CD'
      
        '     WHERE vmove.FD_INVOICE BETWEEN trunc(CD.FD_BEGIN) AND trunc' +
        '(CD.FD_END)+0.99999'
      '       AND FL_DEL <> 1'
      '       AND FL_PODPIS = 1) as FL_IN_CLOSED_PERIOD,'
      
        '   case when vmove.fp_vidmove in (3,8) then (select max(fc_name)' +
        ' from med.tprofil where fk_id = vmove.motoid) else null end fc_p' +
        'rofil'
      '   ,decode( ( SELECT 1'
      '                from med.tdpc dpc'
      '               inner join med.tkart k'
      '                  on dpc.kartid = k.kartid'
      '               inner join med.tmedic m'
      '                  on k.medicid = m.medicid'
      '               inner join (  select u.uchgrid '
      '                               from med.tuchgr u  '
      
        '                              start with u.fc_synonim = '#39'NARCOTI' +
        'C_MEDIC'#39
      
        '                            connect by prior u.uchgrid = u.paren' +
        'tid ) u'
      '                  on m.uchgrid = u.uchgrid'
      '               WHERE vmove.dpid = dpc.dpid'
      '                 AND rownum = 1'
      '             ), NULL, 0, 1) HAS_NARCOTICS'
      ' from med.vmove'
      '      inner join med.tdocs on vmove.dpid = tdocs.dpid'
      '      left join med.tmo on vmove.mofromid = tmo.moid'
      '      left join login.tsotr on tmo.fk_sotrid = tsotr.fk_id'
      
        '      left join asu.ts_sprav on tsotr.fk_spravid = ts_sprav.fk_i' +
        'd       '
      
        '      left join med.tfinsource on tdocs.fk_finsource_id = tfinso' +
        'urce.fk_id--, MED.TSPISANIEVID SV'
      
        ' WHERE ((TRUNC(vmove.FD_DATA) >= TRUNC(:DATE1) or :FILTERED_BY_D' +
        'ATE1 = 0) and (TRUNC(vmove.FD_DATA) <= :DATE2 or :FILTERED_BY_DA' +
        'TE2 = 0))'
      '--   AND (vmove.fk_mogroupid_to = SV.fk_id(+))'
      '--   and (vmove.FP_VIDMOVE = SV.fn_doctype(+))'
      '  '
      
        ' --order by vmove.FD_INVOICE desc, vmove.fc_doc  --'#1057#1086#1088#1090#1080#1088#1091#1102' '#1074' '#1087#1088 +
        #1086#1075#1088#1072#1084#1084#1077'. '#1053#1072' '#1061#1072#1085#1090#1072#1093' '#1074#1072#1083#1080#1090#1089#1103' '#1086#1096#1080#1073#1082#1072' ORA-01455 ('#1085#1072#1081#1090#1080' '#1088#1077#1096#1077#1085#1080#1077' '#1085#1077' '#1091#1076 +
        #1072#1083#1086#1089#1100')')
    Optimize = False
    Variables.Data = {
      0300000004000000060000003A44415445310C0000000700000078700B010101
      0100000000060000003A44415445320C000000070000007872011F0101010000
      0000120000003A46494C54455245445F42595F44415445310300000004000000
      0100000000000000120000003A46494C54455245445F42595F44415445320300
      0000040000000100000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000021000000060000004D4F544F4944010000000000080000004D4F4652
      4F4D49440100000000000A00000046435F434F4D4D454E540100000000000800
      0000464E5F505249434501000000000004000000445049440100000000000600
      000046435F444F43010000000000040000004441544101000000000008000000
      4E414D4546524F4D010000000000060000004E414D45544F0100000000000900
      00004D4F4F574E45524944010000000000070000005649444D4F564501000000
      00000A00000046505F5649444D4F564501000000000007000000464C5F454449
      5401000000000003000000504F440100000000000700000046445F4441544101
      00000000000A00000046445F494E564F4943450100000000000900000046435F
      444F434D495801000000000011000000464B5F4D4F47524F555049445F46524F
      4D0100000000000F000000464B5F4D4F47524F555049445F544F010000000000
      1100000046435F4D4F47524F555049445F46524F4D0100000000000F00000046
      435F4D4F47524F555049445F544F0100000000000E000000464E5F5350495341
      4E49455649440100000000000600000046505F56494401000000000004000000
      4D4E4F4A0100000000001600000046435F4D4F47524F555049445F46524F4D5F
      4F5249470100000000001400000046435F4D4F47524F555049445F544F5F4F52
      49470100000000000A00000046435F444F434E414D450100000000000E000000
      46435F504F535441565F4E414D450100000000000C00000046435F52454B5649
      5A4954490100000000000F00000046435F524153485052494348494E41010000
      000000150000004D4F47525F46524F4D5F464B5F534B4C41445F494401000000
      0000130000004D4F47525F544F5F464B5F534B4C41445F494401000000000013
      00000046435F494E564F4943455F44444D4D59595959010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    AfterOpen = odsSelDocMoveAfterScroll
    AfterScroll = odsSelDocMoveAfterScroll
    Left = 8
    Top = 384
  end
  object odsSelDocMoveRep: TOracleDataSet
    SQL.Strings = (
      'select :adata1 as d1, :adata2 as d2,vmove.* from MED.vmove'
      'where (data between :aData1 and :aData2) '
      'order by data'
      ''
      '')
    Optimize = False
    Variables.Data = {
      0300000002000000070000003A4144415441310C000000000000000000000007
      0000003A4144415441320C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001000000004000000445049440100000000000600000046435F444F43
      0100000000000A00000046435F434F4D4D454E54010000000000080000004D4F
      46524F4D4944010000000000060000004D4F544F494401000000000008000000
      464E5F5052494345010000000000020000004432010000000000020000004431
      0100000000000400000044415441010000000000080000004E414D4546524F4D
      010000000000060000004E414D45544F010000000000090000004D4F4F574E45
      524944010000000000070000005649444D4F56450100000000000A0000004650
      5F5649444D4F564501000000000007000000464C5F4544495401000000000007
      00000046445F44415441010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 152
    Top = 144
  end
  object dsSelDocMove: TDataSource
    DataSet = odsSelDocMove
    Left = 88
    Top = 384
  end
  object pmPrint_Old: TPopupMenu
    Left = 648
    Top = 392
    object N1: TMenuItem
      Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1085#1072' '#1089#1082#1083#1072#1076
      OnClick = N1Click
    end
    object N8: TMenuItem
      Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1085#1072' '#1086#1090#1087#1091#1089#1082' '#1089#1087#1080#1088#1090#1072' (70%)'
      OnClick = N8Click
    end
    object N951: TMenuItem
      Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1085#1072' '#1086#1090#1087#1091#1089#1082' '#1089#1087#1080#1088#1090#1072' (95%)'
      OnClick = N951Click
    end
    object N2: TMenuItem
      Caption = 
        #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1085#1072' '#1089#1082#1083#1072#1076' '#1085#1072' '#1086#1090#1087#1091#1089#1082' '#1083#1077#1082#1072#1088#1089#1090#1074#1077#1085#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074' '#1087#1086#1076#1083#1077#1078#1072#1097#1080#1093' '#1055 +
        #1050#1059
      OnClick = N2Click
    end
    object N5: TMenuItem
      Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
      OnClick = N5Click
    end
    object N7: TMenuItem
      Caption = #1057#1083#1091#1078#1077#1073#1085#1072#1103' '#1079#1072#1087#1080#1089#1082#1072' ('#1053#1086#1089#1080#1082#1086#1074' '#1043'.'#1048'.)'
      OnClick = N7Click
    end
    object N9: TMenuItem
      Caption = #1057#1083#1091#1078#1077#1073#1085#1072#1103' '#1079#1072#1087#1080#1089#1082#1072' ('#1052#1072#1096#1091#1082#1086#1074' '#1042'.'#1044'.)'
      OnClick = N9Click
    end
  end
  object frUserdsTrebRep: TfrUserDataset
    Left = 688
    Top = 248
  end
  object frDBdsTrebRep: TfrDBDataSet
    DataSet = odsTrebRep
    Left = 88
    Top = 152
  end
  object odsTrebRep: TOracleDataSet
    SQL.Strings = (
      
        'select /*+rule*/ rownum,:otp as otp,:dolotp as dolotp,:pol as po' +
        'l,:dolpol as dolpol,'
      
        'ASU.PKG_SMINI.READSTRING('#39'BUHMED'#39','#39'S_TYPE'#39','#39#1053#1077' '#1080#1079#1074#1077#1089#1090#1077#1085#39') as buh' +
        ','
      'asu.get_glavfio as glav,'
      
        'ASU.PKG_SMINI.READSTRING('#39'MANAGER_DOC'#39','#39'CLIENT_NAME'#39','#39#1051#1054#1050' "'#1042#1080#1090#1103#1079 +
        #1100'"'#39') as lok,'
      '            '
      ''
      '('
      ''
      ''
      'select /*+rule*/ sum(('
      'SELECT   sum(nm.fn_day * nm.fn_perday * nml.colvo) AS fn_kol'
      'FROM     ASU.tnazmed nm, ASU.tnazmedlech nml, ASU.tkarta k'
      ''
      'WHERE    nm.fk_id = nml.naz_id'
      'AND      nm.fl_sam = 0'
      'AND      nm.fp_dezh = 0'
      'AND      nm.fk_moid =:amoid'
      'AND      k.fk_id = nm.fk_pacid'
      '--AND      k.fl_vyb = 0'
      'and      nml.id=nml1.id'
      'AND      nml.docplanid=:adpid'
      'AND      nml.docid=:adpid'
      'and      nml.medic_id=nml1.medic_id'
      ''
      'GROUP BY nml.medic_id'
      'HAVING   SUM (nm.fn_day * nm.fn_perday * nml.colvo) > 0'
      ''
      'union'
      'select 0 from dual'
      'where      not exists'
      
        '       (SELECT   sum(nm.fn_day * nm.fn_perday * nml.colvo) AS fn' +
        '_kol'
      'FROM     tnazmed nm, tnazmedlech nml, tkarta k'
      'WHERE    nm.fk_id = nml.naz_id'
      'AND      nm.fl_sam = 0'
      'AND      nm.fp_dezh = 0'
      'AND      nm.fk_moid =:amoid'
      'AND      k.fk_id = nm.fk_pacid'
      '--AND      k.fl_vyb = 0'
      'AND      nml.docplanid=:adpid'
      'AND      nml.docid=:adpid'
      'and      nml.medic_id=nml1.medic_id'
      ''
      'GROUP BY nml.medic_id'
      'HAVING   SUM (nm.fn_day * nm.fn_perday * nml.colvo) > 0)'
      ''
      ''
      ''
      ')) as fn_kol'
      ''
      'FROM     tnazmed nm1, tnazmedlech nml1, tkarta k1'
      ''
      'WHERE    nm1.fk_id = nml1.naz_id'
      'AND      nm1.fl_sam = 0'
      'AND      nm1.fp_dezh = 0'
      'AND      nm1.fk_moid =:amoid'
      'AND      k1.fk_id = nm1.fk_pacid'
      '--AND      k1.fl_vyb = 0'
      'AND      nml1.docplanid=:adpid'
      'and      nml1.medic_id(+)=tmedic.medicid'
      'group by nml1.medic_id'
      ''
      ''
      ''
      ''
      
        ') as koltreb,tmedic.fc_name as namemedic,tdpc.fn_kol,tdpc.fn_sum' +
        'm,tkart.FN_PRICE as price,tei.fc_name as einame'
      ' from MED.tdpc, MED.tkart, MED.tmedic, MED.tei'
      'where tdpc.dpid=:adpid'
      'and tdpc.kartid=tkart.kartid'
      'and tmedic.medicid=tkart.medicid'
      'and tei.eiid=tmedic.eiid'
      'order by namemedic'
      '')
    Optimize = False
    Variables.Data = {
      0300000006000000060000003A41445049440300000000000000000000000600
      00003A414D4F4944030000000000000000000000040000003A4F545005000000
      0000000000000000070000003A444F4C4F545005000000000000000000000007
      0000003A444F4C504F4C050000000000000000000000040000003A504F4C0500
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E00000006000000524F574E554D010000000000090000004E414D45
      4D4544494301000000000006000000464E5F4B4F4C0100000000000600000045
      494E414D45010000000000070000004B4F4C5452454201000000000003000000
      4F545001000000000006000000444F4C4F545001000000000006000000444F4C
      504F4C01000000000003000000504F4C01000000000007000000464E5F53554D
      4D01000000000005000000505249434501000000000003000000425548010000
      00000004000000474C4156010000000000030000004C4F4B010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 8
    Top = 152
    object odsTrebRepROWNUM: TFloatField
      FieldName = 'ROWNUM'
    end
    object odsTrebRepOTP: TStringField
      FieldName = 'OTP'
      Size = 4000
    end
    object odsTrebRepDOLOTP: TStringField
      FieldName = 'DOLOTP'
      Size = 4000
    end
    object odsTrebRepKOLTREB: TFloatField
      FieldName = 'KOLTREB'
    end
    object odsTrebRepNAMEMEDIC: TStringField
      FieldName = 'NAMEMEDIC'
      Required = True
      Size = 255
    end
    object odsTrebRepFN_KOL: TFloatField
      FieldName = 'FN_KOL'
    end
    object odsTrebRepEINAME: TStringField
      FieldName = 'EINAME'
      Required = True
      Size = 10
    end
    object odsTrebRepPOL: TStringField
      FieldName = 'POL'
      Size = 4000
    end
    object odsTrebRepDOLPOL: TStringField
      FieldName = 'DOLPOL'
      Size = 4000
    end
    object odsTrebRepFN_SUMM: TFloatField
      FieldName = 'FN_SUMM'
    end
    object odsTrebRepPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object odsTrebRepBUH: TStringField
      FieldName = 'BUH'
      Size = 4000
    end
    object odsTrebRepGLAV: TStringField
      FieldName = 'GLAV'
      Size = 4000
    end
    object odsTrebRepLOK: TStringField
      FieldName = 'LOK'
      Size = 4000
    end
  end
  object frudsTrebPKU: TfrUserDataset
    Left = 688
    Top = 312
  end
  object frDBdsTrebPKURep: TfrDBDataSet
    DataSet = odsTrebPKURep
    Left = 88
    Top = 328
  end
  object odsTrebPKURep: TOracleDataSet
    SQL.Strings = (
      
        'select /*+rule*/ :pol as pol,:dolpol as dolpol,:otp as otp,:dolo' +
        'tp as dolotp,rownum,'
      
        'ASU.PKG_SMINI.READSTRING('#39'BUHMED'#39','#39'S_TYPE'#39','#39#1054#1088#1077#1093#1086#1074#1072' '#1053'.'#1042'.'#39') as bu' +
        'h,'
      'asu.get_glavfio as glav,'
      
        'ASU.PKG_SMINI.READSTRING('#39'MANAGER_DOC'#39','#39'CLIENT_NAME'#39','#39#1051#1054#1050' "'#1042#1080#1090#1103#1079 +
        #1100'"'#39') as lok,'
      '('
      ''
      ''
      'select /*+rule*/ sum(('
      'SELECT   sum(nm.fn_day * nm.fn_perday * nml.colvo) AS fn_kol'
      'FROM     tnazmed nm, tnazmedlech nml, tkarta k'
      ''
      'WHERE    nm.fk_id = nml.naz_id'
      'AND      nm.fl_sam = 0'
      'AND      nm.fp_dezh = 0'
      'AND      nm.fk_moid =:amoid'
      'AND      k.fk_id = nm.fk_pacid'
      '--AND      k.fl_vyb = 0'
      'and      nml.id=nml1.id'
      'AND      nml.docplanid=:adpid'
      'AND      nml.docid=:adpid'
      'and      nml.medic_id=nml1.medic_id'
      ''
      'GROUP BY nml.medic_id'
      'HAVING   SUM (nm.fn_day * nm.fn_perday * nml.colvo) > 0'
      ''
      'union'
      'select 0 from dual'
      'where      not exists'
      
        '       (SELECT   sum(nm.fn_day * nm.fn_perday * nml.colvo) AS fn' +
        '_kol'
      'FROM     tnazmed nm, tnazmedlech nml, tkarta k'
      'WHERE    nm.fk_id = nml.naz_id'
      'AND      nm.fl_sam = 0'
      'AND      nm.fp_dezh = 0'
      'AND      nm.fk_moid =:amoid'
      'AND      k.fk_id = nm.fk_pacid'
      '--AND      k.fl_vyb = 0'
      'AND      nml.docplanid=:adpid'
      'AND      nml.docid=:adpid'
      'and      nml.medic_id=nml1.medic_id'
      ''
      'GROUP BY nml.medic_id'
      'HAVING   SUM (nm.fn_day * nm.fn_perday * nml.colvo) > 0)'
      ''
      ''
      ''
      ')) as fn_kol'
      ''
      'FROM     tnazmed nm1, tnazmedlech nml1, tkarta k1'
      ''
      'WHERE    nm1.fk_id = nml1.naz_id'
      'AND      nm1.fl_sam = 0'
      'AND      nm1.fp_dezh = 0'
      'AND      nm1.fk_moid =:amoid'
      'AND      k1.fk_id = nm1.fk_pacid'
      '--AND      k1.fl_vyb = 0'
      'AND      nml1.docplanid=:adpid'
      'and      nml1.medic_id=tmedic.medicid'
      'group by nml1.medic_id'
      ''
      ''
      ''
      ''
      
        ') as koltreb,fn_summ/fn_kol as price,tmedic.fc_name as namemedic' +
        ',tdpc.fn_kol,tdpc.fn_summ,tei.fc_name as einame'
      ' from MED.tdpc, MED.tkart, MED.tmedic, MED.tei'
      'where tdpc.dpid=:adpid'
      'and tdpc.kartid=tkart.kartid'
      'and tmedic.medicid=tkart.medicid'
      'and fl_pku=1'
      'and tei.eiid=tmedic.eiid'
      'AND TMEDIC.FL_VISIBLE = 1'
      'order by namemedic'
      '')
    Optimize = False
    Variables.Data = {
      0300000006000000060000003A41445049440300000000000000000000000600
      00003A414D4F4944030000000000000000000000040000003A4F545005000000
      0000000000000000070000003A444F4C4F545005000000000000000000000004
      0000003A504F4C050000000000000000000000070000003A444F4C504F4C0500
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B00000006000000524F574E554D010000000000090000004E414D45
      4D4544494301000000000006000000464E5F4B4F4C0100000000000600000045
      494E414D45010000000000070000004B4F4C5452454201000000000003000000
      4F545001000000000006000000444F4C4F545001000000000003000000504F4C
      01000000000006000000444F4C504F4C01000000000007000000464E5F53554D
      4D010000000000050000005052494345010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 8
    Top = 328
    object odsTrebPKURepOTP: TStringField
      FieldName = 'OTP'
      Size = 4000
    end
    object odsTrebPKURepDOLOTP: TStringField
      FieldName = 'DOLOTP'
      Size = 4000
    end
    object odsTrebPKURepROWNUM: TFloatField
      FieldName = 'ROWNUM'
    end
    object odsTrebPKURepKOLTREB: TFloatField
      FieldName = 'KOLTREB'
    end
    object odsTrebPKURepNAMEMEDIC: TStringField
      FieldName = 'NAMEMEDIC'
      Required = True
      Size = 255
    end
    object odsTrebPKURepFN_KOL: TFloatField
      FieldName = 'FN_KOL'
    end
    object odsTrebPKURepEINAME: TStringField
      FieldName = 'EINAME'
      Required = True
      Size = 10
    end
    object odsTrebPKURepPOL: TStringField
      FieldName = 'POL'
      Size = 4000
    end
    object odsTrebPKURepDOLPOL: TStringField
      FieldName = 'DOLPOL'
      Size = 4000
    end
    object odsTrebPKURepFN_SUMM: TFloatField
      FieldName = 'FN_SUMM'
    end
    object odsTrebPKURepPRICE: TFloatField
      FieldName = 'PRICE'
    end
  end
  object frTrebPKU: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 648
    Top = 280
    ReportForm = {
      19000000891C0000190000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF0000000000000100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      00000C000000F6020000760100003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E486561646572310002010000000040020000F60200002000000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200B30100000B004D61737465724461746131000201000000008C020000F602
      0000180000003100050001000000000000000000FFFFFF1F0000000010006672
      4442647354726562504B5552657000000000000000FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000200200200
      000D00436F6C756D6E466F6F7465723100020100000000C8020000F6020000B8
      00000030000F0001000000000000000000FFFFFF1F0000000000000000000000
      0000FFFF000000000002000000010000000000000001000000C8000000140000
      00010000000000000000B102000006004D656D6F3730000200E4010000750000
      0000010000130000000300000001000000000000000000FFFFFF1F2C0003020C
      00646420206D6F20207979797900010006005B444154455D00000000FFFF0000
      0000000200000001000000000500417269616C000C0000000000000000000200
      0000CC00020000000000FFFFFF00000000020000000000000000007C03000005
      004D656D6F320002008C000000A0000000D80100001C00000003000000010000
      00000000000000FFFFFF1F2C02000000000001002E00D2F0E5E1EEE2E0EDE8E5
      20E220E0EFF2E5EAF320B9205B6F647353656C446F634D6F76652E2246435F44
      4F43225D0004000500626567696E0D0B0020202073756D6D3A3D303B0D010020
      0D0300656E6400FFFF00000000000200000001000000000500417269616C0010
      00000002000000000002000000CC00020000000000FFFFFF0000000002000000
      0000000000001404000005004D656D6F330002000A010000E0000000DC000000
      140000000300000001000000000000000000FFFFFF1F2C00030200000001001A
      00CEF2205B6F647353656C446F634D6F76652E2244415441225D2000000000FF
      FF00000000000200000001000000000500417269616C000C0000000400000000
      0002000000CC00020000000000FFFFFF0000000002000000000000000000A404
      000005004D656D6F34000200300000001C010000580000002800000003000000
      01000000000000000000FFFFFF1F2C02000000000002000400C4EBFF3A0D0B00
      D7E5F0E5E720EAEEE3EE3A00000000FFFF000000000002000000010000000005
      00417269616C000C00000000000000000000000000CC00020000000000FFFFFF
      00000000020000000000000000003A05000005004D656D6F3500020088000000
      18010000C0000000140000000300000001000000000000000000FFFFFF1F2C02
      0000000000010018005B6F647353656C446F634D6F76652E224E414D45544F22
      5D00000000FFFF00000000000200000001000000000500417269616C000C0000
      0004000000000000000000CC00020000000000FFFFFF00000000020000000000
      00000000D405000005004D656D6F36000200880000002C010000380200001400
      00000300000001000000000000000000FFFFFF1F2C02000000000001001C005B
      6F647353656C446F634D6F76652E2246435F434F4D4D454E54225D00000000FF
      FF00000000000200000001000000000500417269616C000C0000000400000000
      0000000000CC00020000000000FFFFFF00000000020000000000000000005B06
      000005004D656D6F3700020014000000400200001C0000002000000003000F00
      01000000000000000000FFFFFF1F2C02000000000002000200B9200D0400EF2E
      EF2E00000000FFFF00000000000200000001000000000500417269616C000A00
      00000000000000000A000000CC00020000000000FFFFFF000000000200000000
      0000000000E506000005004D656D6F380002003000000040020000D800000020
      00000003000F0001000000000000000000FFFFFF1F2C02000000000001000C00
      CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF0000000000020000000100000000
      0500417269616C000A0000000000000000000A000000CC00020000000000FFFF
      FF00000000020000000000000000006B07000005004D656D6F39000200080100
      00400200004C0000002000000003000F0001000000000000000000FFFFFF1F2C
      02000000000001000800C5E42E20C8E7EC2E00000000FFFF0000000000020000
      0001000000000500417269616C000A0000000000000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000F407000006004D656D6F31
      300002005401000040020000D00000001000000003000F000100000000000000
      0000FFFFFF1F2C02000000000001000A00CAEEEBE8F7E5F1F2E2EE00000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      000A000000CC00020000000000FFFFFF00000000020000000000000000007C08
      000006004D656D6F313100020054010000500200006C0000001000000003000F
      0001000000000000000000FFFFFF1F2C02000000000001000900D2F0E5E1F3E5
      ECEEE500000000FFFF00000000000200000001000000000500417269616C000A
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      0000000000000309000006004D656D6F3132000200C001000050020000640000
      001000000003000F0001000000000000000000FFFFFF1F2C0200000000000100
      0800CEF2EFF3F9E5EDEE00000000FFFF00000000000200000001000000000500
      417269616C000A0000000000000000000A000000CC00020000000000FFFFFF00
      000000020000000000000000008609000006004D656D6F313300020024020000
      40020000600000002000000003000F0001000000000000000000FFFFFF1F2C02
      000000000001000400D6E5EDE000000000FFFF00000000000200000001000000
      000500417269616C000A0000000000000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000000A0A000006004D656D6F313400020084
      02000040020000580000002000000003000F0001000000000000000000FFFFFF
      1F2C02000000000001000500D1F3ECECE000000000FFFF000000000002000000
      01000000000500417269616C000A0000000000000000000A000000CC00020000
      000000FFFFFF0000000002000000000000000000930A000006004D656D6F3135
      000200140000008C0200001C0000001800000003000F00010000000000000000
      00FFFFFF1F2C02000000000001000A005B43555252454E54235D00000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      0A000000CC00020000000000FFFFFF00000000020000000000000000002D0B00
      0006004D656D6F3136000200300000008C020000D80000001800000003000F00
      01000000000000000000FFFFFF1F2C02000000000001001B005B6F6473547265
      62706B755265702E224E414D454D45444943225D00000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000008000000CC00
      020000000000FFFFFF0000000002000000000000000000C40B000006004D656D
      6F3137000200080100008C0200004C0000001800000003000F00010000000000
      00000000FFFFFF1F2C020000000000010018005B6F647354726562706B755265
      702E2245494E414D45225D00000000FFFF000000000002000000010000000005
      00417269616C000A0000000000000000000A000000CC00020000000000FFFFFF
      00000000020000000000000000005C0C000006004D656D6F3139000200540100
      008C0200006C0000001800000003000F0001000000000000000000FFFFFF1F2C
      020000000000010019005B6F647354726562706B755265702E224B4F4C545245
      42225D00000000FFFF00000000000200000001000000000500417269616C000A
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      000000000000F30C000006004D656D6F3230000200C00100008C020000640000
      001800000003000F0001000000000000000000FFFFFF1F2C0200000000000100
      18005B6F647354726562706B755265702E22464E5F4B4F4C225D00000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000A30D00
      0006004D656D6F3231000200240200008C020000600000001800000003000F00
      01000000000000000000FFFFFF1F2C020000000000010031005B464F524D4154
      464C4F4154282730F02E3030EA2E272C205B6F647354726562706B755265702E
      225072696365225D295D00000000FFFF00000000000200000001000000000500
      417269616C000A0000000000000000000A000000CC00020000000000FFFFFF00
      000000020000000000000000008B0E000006004D656D6F323200020084020000
      8C020000580000001800000003000F0001000000000000000000FFFFFF1F2C02
      0000000000010033005B464F524D4154464C4F4154282730F02E3030EA2E272C
      205B6F647354726562706B755265702E22464E5F73756D6D225D295D00030005
      00626567696E0D26002073756D6D3A3D5B6F647354726562706B755265702E22
      464E5F73756D6D225D2B73756D6D3B0D0300656E6400FFFF0000000000020000
      0001000000000500417269616C000A0000000000000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000100F000006004D656D6F32
      3700020014000000C8020000700200001800000003000F000100000000000000
      0000FFFFFF1F2C02000000000001000600C8F2EEE3EE3A00000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000090000
      00CC00020000000000FFFFFF0000000002000000000000000000AE0F00000600
      4D656D6F333300020084020000C8020000580000001800000003000F00010000
      00000000000000FFFFFF1F2C02000000000001001F005B464F524D4154464C4F
      4154282730F02E3030EA2E272C5B73756D6D5D295D00000000FFFF0000000000
      0200000001000000000500417269616C000A0000000000000000000A000000CC
      00020000000000FFFFFF00000000020000000000000000005B10000006004D65
      6D6F33300002005E000000BC0000003402000028000000030000000100000000
      0000000000FFFFFF1F2C02000000000001002E00EDE020EEF2EFF3F1EA20EBE5
      EAE0F0F1F2E2E5EDEDFBF520F1F0E5E4F1F2E220EFEEE4EBE5E6E0F9E8F520CF
      CAD300000000FFFF00000000000200000001000000000500417269616C001000
      000002000000000002000000CC00020000000000FFFFFF000000000200000000
      0000000000E510000006004D656D6F323600020024000000EA02000054000000
      100000000300000001000000000000000000FFFFFF1F2C02000000000001000B
      00CEF2EFF3F1F2E8EBE0203A00000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000001000000CC00020000000000FFFF
      FF00000000020000000000000000006F11000006004D656D6F32380002003000
      00001A03000048000000120000000300000001000000000000000000FFFFFF1F
      2C02000000000001000B00CFEEEBF3F7E8EB28E0293A00000000FFFF00000000
      000200000001000000000500417269616C000A00000000000000000000000000
      CC00020000000000FFFFFF00000000020000000000000000000612000006004D
      656D6F3335000200800000001A0300009C000000140000000300020001000000
      000000000000FFFFFF1F2C020000000000010018005B6F647354726562504B55
      5265702E22444F4C4F5450225D00000000FFFF00000000000200000001000000
      000500417269616C000A00000000000000000002000000CC00020000000000FF
      FFFF00000000020000000000000000008E12000006004D656D6F333600020080
      0000002E0300009C000000140000000300000001000000000000000000FFFFFF
      1F2C02000000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF0000000000
      0200000001000000000500417269616C000A00000000000000000002000000CC
      00020000000000FFFFFF00000000020000000000000000000D13000006004D65
      6D6F3337000200280100001A0300009C00000014000000030002000100000000
      0000000000FFFFFF1F2C0200000000000100000000000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000000000000CC00
      020000000000FFFFFF00000000020000000000000000009313000006004D656D
      6F3338000200280100002E0300009C0000001400000003000000010000000000
      00000000FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      02000000CC00020000000000FFFFFF0000000002000000000000000000271400
      0006004D656D6F3339000200CC0100001A030000EC0000001400000003000200
      01000000000000000000FFFFFF1F2C020000000000010015005B6F6473547265
      62504B555265702E224F5450225D00000000FFFF000000000002000000010000
      00000500417269616C000A00000000000000000002000000CC00020000000000
      FFFFFF0000000002000000000000000000B914000006004D656D6F3430000200
      CC0100002E030000EC000000140000000300000001000000000000000000FFFF
      FF1F2C02000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E8
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      00000000000002000000CC00020000000000FFFFFF0000000002000000000000
      0000005015000006004D656D6F323900020080000000E80200009C0000001400
      00000300020001000000000000000000FFFFFF1F2C020000000000010018005B
      6F647354726562504B555265702E22444F4C504F4C225D00000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000020000
      00CC00020000000000FFFFFF0000000002000000000000000000D81500000600
      4D656D6F333100020080000000FC0200009C0000001400000003000000010000
      00000000000000FFFFFF1F2C02000000000001000900C4EEEBE6EDEEF1F2FC00
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      000000000002000000CC00020000000000FFFFFF000000000200000000000000
      00005716000006004D656D6F333200020028010000E80200009C000000140000
      000300020001000000000000000000FFFFFF1F2C020000000000010000000000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      0000000000000000CC00020000000000FFFFFF00000000020000000000000000
      00DD16000006004D656D6F333400020028010000FC0200009C00000014000000
      0300000001000000000000000000FFFFFF1F2C02000000000001000700CFEEE4
      EFE8F1FC00000000FFFF00000000000200000001000000000500417269616C00
      0A00000000000000000002000000CC00020000000000FFFFFF00000000020000
      000000000000007117000006004D656D6F3431000200CC010000E8020000EC00
      0000140000000300020001000000000000000000FFFFFF1F2C02000000000001
      0015005B6F647354726562504B555265702E22504F4C225D00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000200
      0000CC00020000000000FFFFFF00000000020000000000000000000318000006
      004D656D6F3432000200CC010000FC020000EC00000014000000030000000100
      0000000000000000FFFFFF1F2C02000000000001001300D0E0F1F8E8F4F0EEE2
      EAE020EFEEE4EFE8F1E800000000FFFF00000000000200000001000000000500
      417269616C000A00000000000000000002000000CC00020000000000FFFFFF00
      000000020000000000000000008B18000006004D656D6F343300020080000000
      4A0300009C000000140000000300020001000000000000000000FFFFFF1F2C02
      000000000001000900C1F3F5E3E0EBF2E5F000000000FFFF0000000000020000
      0001000000000500417269616C000A00000000000000000002000000CC000200
      00000000FFFFFF00000000020000000000000000001319000006004D656D6F34
      34000200800000005E0300009C00000014000000030000000100000000000000
      0000FFFFFF1F2C02000000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      02000000CC00020000000000FFFFFF0000000002000000000000000000921900
      0006004D656D6F3435000200280100004A0300009C0000001400000003000200
      01000000000000000000FFFFFF1F2C0200000000000100000000000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000000
      000000CC00020000000000FFFFFF0000000002000000000000000000181A0000
      06004D656D6F3436000200280100005E0300009C000000140000000300000001
      000000000000000000FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC00
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      000000000002000000CC00020000000000FFFFFF000000000200000000000000
      0000AD1A000006004D656D6F3437000200CC0100004A030000EC000000140000
      000300020001000000000000000000FFFFFF1F2C020000000000010016005B6F
      6473547265624D6F7665504B552E22425548225D00000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000002000000CC00
      020000000000FFFFFF00000000020000000000000000003F1B000006004D656D
      6F3438000200CC0100005E030000EC0000001400000003000000010000000000
      00000000FFFFFF1F2C02000000000001001300D0E0F1F8E8F4F0EEE2EAE020EF
      EEE4EFE8F1E800000000FFFF0000000000020000000100000000050041726961
      6C000A00000000000000000002000000CC00020000000000FFFFFF0000000002
      0000000000000000003B1C000005004D656D6F31000200E40100001000000000
      010000650000000300000001000000000000000000FFFFFF1F2C020000000000
      05000A00D3D2C2C5D0C6C4C0DE3A0D1300C7E0EC2E20CDE0F7E0EBFCEDE8EAE0
      20EFEE200D1E00EBE5F7E5E1EDEE2DEEE7E4EEF0EEE2E8F2E5EBFCEDEEE920F0
      E0E1EEF2E50D1400CECECE2022D3F0E5EDE3EEE9E3E0E7EFF0EEEC220D23005F
      5F5F5F5F5F5F5F5F5F5F205B6F6473547265624D6F7665504B552E22474C4156
      225D00000000FFFF00000000000200000001000000000500417269616C000C00
      000000000000000000000000CC00020000000000FFFFFF000000000200000000
      000000FEFEFF020000000A002043617465676F72793100000000040073756D6D
      00010030000000000000000000FC010000000000000000000000000000000058
      000ACF5E302ED2E2405794C395D66DE440}
  end
  object pmIns: TPopupMenu
    Left = 336
    Top = 72
    object N4: TMenuItem
      Caption = #1055#1086' '#1083#1080#1089#1090#1072#1084' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1081
      OnClick = ToolButton3Click
    end
    object N3: TMenuItem
      Caption = #1044#1083#1103' '#1085#1077#1086#1090#1083#1086#1078#1085#1086#1081' '#1087#1086#1084#1086#1097#1080
      OnClick = N3Click
    end
    object N6: TMenuItem
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1074' '#1072#1087#1090#1077#1082#1091
      OnClick = N6Click
    end
  end
  object odsNakl: TOracleDataSet
    SQL.Strings = (
      'select :otp as otp,:dolotp as dolotp,'
      
        '  tmedic.fc_name||'#39'('#39'||'#39#1087'. '#39'||TO_CHAR(tkart.FN_PARTY_NUM)||DECOD' +
        'E(tkart.FC_SERIAL, null,'#39#39','#39',  '#39'||tkart.FC_SERIAL)||'#39')'#39' as namem' +
        'edic,'
      
        '  tei.fc_name as einame, tdpc.fn_kol, TKART.fn_price as price,  ' +
        '(tdpc.fn_kol*TKART.fn_price) as fn_summ,'
      
        '--ASU.PKG_SMINI.READSTRING('#39'BUHMED'#39','#39'S_TYPE'#39','#39#1054#1088#1077#1093#1086#1074#1072' '#1053'.'#1042'.'#39') as ' +
        'buh,'
      
        'ASU.PKG_SMINI.READSTRING('#39'NAMEPROV'#39','#39'S_TYPE'#39','#39#1042#1088#1086#1085#1089#1082#1072#1103' '#1057'.'#1040'.'#39') as' +
        ' prov--,'
      '--asu.get_glavfio as glav,'
      
        '--ASU.PKG_SMINI.READSTRING('#39'MANAGER_DOC'#39','#39'CLIENT_NAME'#39','#39#1051#1054#1050' "'#1042#1080#1090 +
        #1103#1079#1100'"'#39') as lok'
      '  from MED.tdpc, MED.tkart, MED.tmedic, MED.tei'
      '  where dpid=:adpid'
      '    and tdpc.kartid=tkart.kartid'
      '    and tkart.medicid=tmedic.medicid'
      '    and tmedic.eiid=tei.eiid'
      '--    AND TMEDIC.FL_VISIBLE = 1')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A41445049440300000000000000000000000400
      00003A4F5450050000000000000000000000070000003A444F4C4F5450050000
      000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000600000045494E414D4501000000000006000000464E5F4B
      4F4C010000000000090000004E414D454D45444943010000000000030000004F
      545001000000000006000000444F4C4F545001000000000007000000464E5F53
      554D4D0100000000000500000050524943450100000000000400000050524F56
      010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 8
    Top = 280
  end
  object frDBdsNakl: TfrDBDataSet
    DataSet = odsNakl
    Left = 88
    Top = 280
  end
  object frudsNakl: TfrUserDataset
    Left = 688
    Top = 280
  end
  object frNakl: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frNaklGetValue
    OnObjectClick = frNaklObjectClick
    OnMouseOverObject = frNaklMouseOverObject
    Left = 648
    Top = 248
    ReportForm = {
      19000000C51C0000190000000001000100FFFFFFFFFF09000000340800009A0B
      00004800000024000000240000002400000000FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000014000000F6020000120100003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E48656164657231000201000000007C010000F60200002000000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200AD0100000B004D6173746572446174613100020100000000B4010000F602
      0000180000003100050001000000000000000000FFFFFF1F000000000A006672
      444264734E616B6C00000000000000FFFF000000000002000000010000000000
      000001000000C8000000140000000100000000000002001A0200000D004D6173
      746572466F6F7465723100020100000000FC010000F6020000C6000000300006
      0001000000000000000000FFFFFF1F00000000000000000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000000AB02000006004D656D6F373000020050000000900000001001000014
      0000000300000001000000000000000000FFFFFF1F2C0003020C00646420206D
      6F20207979797900010006005B444154455D0000000000000000000000020000
      0001000000000500417269616C000C00000000000000000002000000CC000200
      00000000FFFFFF00000000020000000000000000008A03000005004D656D6F32
      00020048000000B00000008A0200001C00000003000000010000000000000000
      00FFFFFF1F2C02000000000001004500CDE0EAEBE0E4EDE0FF20EDE020E2EEE7
      E2F0E0F220ECE5E4E8EAE0ECE5EDF2EEE220E220E0EFF2E5EAF320B9205B6F64
      7353656C446F634D6F76652E2246435F444F43225D0003000500626567696E0D
      0C00202073756D6D3A3D303B20200D0300656E6400FFFF000000000002000000
      01000000040500417269616C001000000002000000000002000000CC00020000
      000000FFFFFF00000000020000000000000000002204000005004D656D6F3300
      020048000000D40000008A020000140000000300000001000000000000000000
      FFFFFF1F2C00030200000001001A00CEF2205B6F647353656C446F634D6F7665
      2E2244415441225D2000000000FFFF0000000000020000000100000004050041
      7269616C000C00000004000000000002000000CC00020000000000FFFFFF0000
      000002000000000000000000B204000005004D656D6F3400020048000000F800
      000058000000280000000300000001000000000000000000FFFFFF1F2C020000
      00000002000400C4EBFF3A0D0B00D7E5F0E5E720EAEEE3EE3A00000000FFFF00
      000000000200000001000000010500417269616C000C00000000000000000000
      000000CC00020000000000FFFFFF000000000200000000000000000056050000
      05004D656D6F35000200A0000000F80000003002000014000000030000000100
      0000000000000000FFFFFF1F2C020000000000010026005B6F647353656C446F
      634D6F76652E2266635F6D6F67726F757069645F746F5F6F726967225D000000
      00FFFF00000000000200000001000000000500417269616C000C000000040000
      00000000000000CC00020000000000FFFFFF0000000002000000000000000000
      FC05000005004D656D6F36000200A00000000C01000030020000140000000300
      000001000000000000000000FFFFFF1F2C020000000000010028005B6F647353
      656C446F634D6F76652E2266635F6D6F67726F757069645F66726F6D5F6F7269
      67225D00000000FFFF00000000000200000001000000000500417269616C000C
      00000004000000000000000000CC00020000000000FFFFFF0000000002000000
      0000000000008306000005004D656D6F37000200480000007C0100001C000000
      2000000003000F0001000000000000000000FFFFFF1F2C020000000000020002
      00B9200D0400EF2EEF2E00000000FFFF00000000000200000001000000000500
      417269616C000A0000000000000000000A000000CC00020000000000FFFFFF00
      000000020000000000000000001F07000005004D656D6F38000200640000007C
      0100001C0100002000000003000F0001000000000000000000FFFFFF1F2C0200
      0000000001001E00CDE0E8ECE5EDEEE2E0EDE8E52028B920EFE0F0F2E8E82C20
      F1E5F0E8FF2900000000FFFF0000000000020000000100000000050041726961
      6C000A0000000000000000000A000000CC00020000000000FFFFFF0000000002
      000000000000000000A507000005004D656D6F39000200800100007C0100004C
      0000002000000003000F0001000000000000000000FFFFFF1F2C020000000000
      01000800C5E42E20C8E7EC2E00000000FFFF0000000000020000000100000000
      0500417269616C000A0000000000000000000A000000CC00020000000000FFFF
      FF00000000020000000000000000002A08000006004D656D6F3130000200CC01
      00007C010000440000002000000003000F0001000000000000000000FFFFFF1F
      2C02000000000001000600CAEEEB2DE2EE00000000FFFF000000000002000000
      01000000000500417269616C000A0000000000000000000A000000CC00020000
      000000FFFFFF0000000002000000000000000000B108000006004D656D6F3133
      000200100200007C010000600000002000000003000F00010000000000000000
      00FFFFFF1F2C02000000000001000800D6E5EDE02C20F02E00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000A00
      0000CC00020000000000FFFFFF00000000020000000000000000003909000006
      004D656D6F3134000200700200007C010000610000002000000003000F000100
      0000000000000000FFFFFF1F2C02000000000001000900D1F3ECECE02C20F02E
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      000000C209000006004D656D6F313500020048000000B40100001C0000001800
      000003000F0001000000000000000000FFFFFF1F2C02000000000001000A005B
      43555252454E54235D00000000FFFF0000000000020000000100000000050041
      7269616C000A0000000000000000000A000000CC00020000000000FFFFFF0000
      000002000000000000000000560A000006004D656D6F313600020064000000B4
      0100001C0100001800000003000F0001000000000000000000FFFFFF1F2C0200
      00000000010015005B6F64736E616B6C2E224E414D454D45444943225D000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      00000008000000CC00020000000000FFFFFF0000000002000000000000000000
      E70A000006004D656D6F313700020080010000B40100004C0000001800000003
      000F0001000000000000000000FFFFFF1F2C020000000000010012005B6F6473
      6E616B6C2E2245494E414D45225D00000000FFFF000000000002000000010000
      00000500417269616C000A0000000000000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000780B000006004D656D6F3139000200
      CC010000B4010000440000001800000003000F0001000000000000000000FFFF
      FF1F2C020000000000010012005B6F64734E616B6C2E22464E5F4B4F4C225D00
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      0000080C000006004D656D6F323100020010020000B401000060000000180000
      0003000F0001000000000000000000FFFFFF1F2C020301000000010011005B6F
      64736E616B6C2E227072696365225D00000000FFFF0000000000020000000100
      0000000500417269616C000A0000000000000000000A000000CC000200000000
      00FFFFFF0000000002000000000000000000CC0C000006004D656D6F32320002
      0070020000B4010000610000001800000003000F0001000000000000000000FF
      FFFF1F2C020301000000010013005B6F64736E616B6C2E22464E5F73756D6D22
      5D0003000500626567696E0D2200202073756D6D3A3D73756D6D202B205B6F64
      734E616B6C2E22464E5F73756D6D225D0D0300656E6400FFFF00000000000200
      000001000000000500417269616C000A0000000000000000000A000000CC0002
      0000000000FFFFFF0000000002000000000000000000570D000006004D656D6F
      3138000200540000005802000054000000100000000300000001000000000000
      000000FFFFFF1F2C02000000000001000C00CEF2EFF3F1F2E8EB28E0293A0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      0000000001000000CC00020000000000FFFFFF00000000020000000000000000
      00E10D000006004D656D6F323300020060000000240200004800000012000000
      0300000001000000000000000000FFFFFF1F2C02000000000001000B00CFEEEB
      F3F7E8EB28E0293A00000000FFFF000000000002000000010000000005004172
      69616C000A00000000000000000000000000CC00020000000000FFFFFF000000
      0002000000000000000000660E000006004D656D6F313200020048000000FC01
      0000280200001800000003000F0001000000000000000000FFFFFF1F2C020000
      00000001000600C8F2EEE3EE3A00000000FFFF00000000000200000001000000
      000500417269616C000A00000000000000000009000000CC00020000000000FF
      FFFF0000000002000000000000000000FF0E000006004D656D6F333000020070
      020000FC010000610000001800000003000F0001000000000000000000FFFFFF
      1F2C02040114002323232023232320232323202323302E303020F00001000600
      5B73756D6D5D00000000FFFF0000000000020000000100000000050041726961
      6C000A0000000000000000000A000000CC00020000000000FFFFFF0000000002
      000000000000000000860F000006004D656D6F3335000200B000000024020000
      9C000000140000000300020001000000000000000000FFFFFF1F2C0200000000
      0001000800CFF0EEE2E8E7EEF000000000FFFF00000000000200000001000000
      000500417269616C000A00000000000000000002000000CC00020000000000FF
      FFFF00000000020000000000000000000E10000006004D656D6F3336000200B0
      000000380200009C000000140000000300080001000000000000000000FFFFFF
      1F2C02000000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF0000000000
      0200000001000000000500417269616C000A00000000000000000002000000CC
      00020000000000FFFFFF00000000020000000000000000008D10000006004D65
      6D6F333700020058010000240200008200000014000000030002000100000000
      0000000000FFFFFF1F2C0200000000000100000000000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000000000000CC00
      020000000000FFFFFF00000000020000000000000000001311000006004D656D
      6F33380002005801000038020000820000001400000003000800010000000000
      00000000FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      02000000CC00020000000000FFFFFF0000000002000000000000000000AA1100
      0006004D656D6F3339000200E101000024020000EC0000001400000003000200
      01000000000000000000FFFFFF1F2C020000000000010018005B6F647353656C
      446F634D6F76652E224E414D45544F225D00000000FFFF000000000002000000
      01000000000500417269616C000A00000000000000000002000000CC00020000
      000000FFFFFF00000000020000000000000000003C12000006004D656D6F3430
      000200E101000038020000EC0000001400000003000800010000000000000000
      00FFFFFF1F2C02000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EF
      E8F1E800000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000002000000CC00020000000000FFFFFF0000000002000000
      000000000000BE12000006004D656D6F3230000200B0000000560200009C0000
      00140000000300020001000000000000000000FFFFFF1F2C0200000000000100
      0300D1CCD100000000FFFF00000000000200000001000000000500417269616C
      000A00000000000000000002000000CC00020000000000FFFFFF000000000200
      00000000000000004613000006004D656D6F3234000200B00000006A0200009C
      000000140000000300080001000000000000000000FFFFFF1F2C020000000000
      01000900C4EEEBE6EDEEF1F2FC00000000FFFF00000000000200000001000000
      000500417269616C000A00000000000000000002000000CC00020000000000FF
      FFFF0000000002000000000000000000C513000006004D656D6F323500020058
      0100005602000082000000140000000300020001000000000000000000FFFFFF
      1F2C0200000000000100000000000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000000000000CC00020000000000FFFF
      FF00000000020000000000000000004B14000006004D656D6F32360002005801
      00006A02000082000000140000000300080001000000000000000000FFFFFF1F
      2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF0000000000020000
      0001000000000500417269616C000A00000000000000000002000000CC000200
      00000000FFFFFF0000000002000000000000000000E414000006004D656D6F32
      37000200E101000056020000EC00000014000000030002000100000000000000
      0000FFFFFF1F2C02000000000001001A005B6F647353656C446F634D6F76652E
      224E414D4546524F4D225D00000000FFFF000000000002000000010000000005
      00417269616C000A00000000000000000002000000CC00020000000000FFFFFF
      00000000020000000000000000007615000006004D656D6F3238000200E10100
      006A020000EC000000140000000300080001000000000000000000FFFFFF1F2C
      02000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E8000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      00000002000000CC00020000000000FFFFFF0000000002000000000000000000
      FE15000006004D656D6F3331000200B0000000840200009C0000001400000003
      00020001000000000000000000FFFFFF1F2C02000000000001000900C1F3F5E3
      E0EBF2E5F000000000FFFF00000000000200000001000000000500417269616C
      000A00000000000000000002000000CC00020000000000FFFFFF000000000200
      00000000000000008616000006004D656D6F3332000200B0000000980200009C
      000000140000000300080001000000000000000000FFFFFF1F2C020000000000
      01000900C4EEEBE6EDEEF1F2FC00000000FFFF00000000000200000001000000
      000500417269616C000A00000000000000000002000000CC00020000000000FF
      FFFF00000000020000000000000000000517000006004D656D6F333300020058
      0100008402000082000000140000000300020001000000000000000000FFFFFF
      1F2C0200000000000100000000000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000000000000CC00020000000000FFFF
      FF00000000020000000000000000008B17000006004D656D6F33340002005801
      00009802000082000000140000000300080001000000000000000000FFFFFF1F
      2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF0000000000020000
      0001000000000500417269616C000A00000000000000000002000000CC000200
      00000000FFFFFF00000000020000000000000000001818000006004D656D6F34
      31000200E101000084020000EC00000014000000030002000100000000000000
      0000FFFFFF1F2C02000000000001000E005B7661725F676C61765F6275685D00
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      000000000002000000CC00020000000000FFFFFF000000000200000000000000
      0000AA18000006004D656D6F3432000200E101000098020000EC000000140000
      000300080001000000000000000000FFFFFF1F2C02000000000001001300D0E0
      F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF000000000002000000
      01000000000500417269616C000A00000000000000000002000000CC00020000
      000000FFFFFF0000000002000000000000000000C019000005004D656D6F3100
      0200500000002000000010010000700000000300000001000000000000000000
      FFFFFF1F2C02000000000003000A00D3D2C2C5D0C6C4C0DE3A0D0C00C3EBE0E2
      EDFBE920E2F0E0F70D1C005F5F5F5F5F5F5F5F5F5F5F205B7661725F676C6176
      5F76726163685D0005000500626567696E0D14002F2FC7E0EC2E20CDE0F7E0EB
      FCEDE8EAE020EFEE0D20002F2FEBE5F7E5E1EDEE2DEEE7E4EEF0EEE2E8F2E5EB
      FCEDEEE920F0E0E1EEF2E50D16002F2FCECECE2022D3F0E5EDE3EEE9E3E0E7EF
      F0EEEC220D0300656E6400000000000000000200000001000000000500417269
      616C000C00000000000000000000000000CC00020000000000FFFFFF00000000
      02000000000000000000481A000006004D656D6F3131000200D6010000240000
      00FC000000120000000300000001000000000000000000FFFFFF1F2C02000000
      000001000900D3D2C2C5D0C6C4C0DE00000000FFFF0000000000020000000100
      0000020500417269616C000A0000000200000000000000000001000200000000
      00FFFFFF0000000002000000000000000000D21A000006004D656D6F32390002
      00D601000052000000FC000000100000000300000001000000000000000000FF
      FFFF1F2C02000000000001000B0028E4EEEBE6EDEEF1F2FC2900000000FFFF00
      000000000200000001000000020500417269616C000700000002000000000002
      0000000100020000000000FFFFFF00000000020000000000000000005D1B0000
      06004D656D6F3433000200D601000076000000FC000000170000000300020001
      000000000000000000FFFFFF1F2C02000000000001000C005B64617465727573
      7374725D00000000FFFF00000000000200000001000000020500417269616C00
      0A000000020000000000100000000100020000000000FFFFFF00000000020000
      00000000000000E81B000006004D656D6F3434000200D60100003A000000FC00
      0000170000000300020001000000000000000000FFFFFF1F2C02000000000001
      000C00C3EBE0E2EDFBE920E2F0E0F700000000FFFF0000000000020000000100
      0000020500417269616C000A0000000200000000001000000001000200000000
      00FFFFFF0000000002000000000000000000771C000006004D656D6F34350002
      00D601000062000000FC000000130000000300020001000000000000000000FF
      FFFF1F2C020000000000010010005B7661725F676C61765F76726163685D0000
      0000FFFF00000000000200000001000000020500417269616C000A0000000200
      00000000100000000100020000000000FFFFFF000000000200000000000000FE
      FEFF020000000A002043617465676F72793100000000040073756D6D00010030
      000000000000000000FC010000000000000000000000000000000058000ACF5E
      302ED2E2405794C395D66DE440}
  end
  object frZapiska: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 648
    Top = 184
    ReportForm = {
      190000001E120000190000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF0000000000000100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000018000000F6020000840100003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E4865616465723100020100000000A4010000F60200001400000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200AC0100000B004D6173746572446174613100020100000000E0010000F602
      0000140000003000050001000000000000000000FFFFFF1F0000000009006672
      444264735A617000000000000000FFFF00000000000200000001000000000000
      0001000000C800000014000000010000000000000200190200000D004D617374
      6572466F6F746572310002010000000028020000F60200008200000030000600
      01000000000000000000FFFFFF1F00000000000000000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      000000B202000005004D656D6F34000200F80000003801000000010000180000
      000300000001000000000000000000FFFFFF1F2C02000000000001001100D1CB
      D3C6C5C1CDC0DF20C7C0CFC8D1CAC000000000FFFF0000000000020000000100
      0000000F0054696D6573204E657720526F6D616E000E00000002000000000002
      000000CC00020000000000FFFFFF000000000200000000000000000077030000
      05004D656D6F350002002A000000500100009C02000018000000030000000100
      0000000000000000FFFFFF1F2C02000000000002003A00CFF0EEF8F320C2E0F8
      E5E3EE20F0E0E7F0E5F8E5EDE8FF20EDE020EEF2EFF3F1EA2028E2EDF3F2F0E5
      EDEDE5E520EFE5F0E5ECE5F9E5EDE8E5290D000000000000FFFF000000000002
      00000001000000000F0054696D6573204E657720526F6D616E000C0000000000
      0000000002000000CC00020000000000FFFFFF00000000020000000000000000
      000504000005004D656D6F360002001C000000A4010000380000001400000003
      000F0001000000000000000000FFFFFF1F2C02000000000001000600B920EF2E
      EF2E00000000FFFF00000000000200000001000000000F0054696D6573204E65
      7720526F6D616E000C00000000000000000000000000CC00020000000000FFFF
      FF00000000020000000000000000009904000005004D656D6F37000200540000
      00A4010000500100001400000003000F0001000000000000000000FFFFFF1F2C
      02000000000001000C00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF00000000
      000200000001000000000F0054696D6573204E657720526F6D616E000C000000
      00000000000002000000CC00020000000000FFFFFF0000000002000000000000
      0000002905000005004D656D6F38000200A4010000A4010000A4000000140000
      0003000F0001000000000000000000FFFFFF1F2C02000000000001000800C5E4
      2E20E8E7EC2E00000000FFFF00000000000200000001000000000F0054696D65
      73204E657720526F6D616E000C00000000000000000002000000CC0002000000
      0000FFFFFF0000000002000000000000000000BB05000005004D656D6F390002
      0048020000A4010000980000001400000003000F0001000000000000000000FF
      FFFF1F2C02000000000001000A00CAEEEBE8F7E5F1F2E2EE00000000FFFF0000
      0000000200000001000000000F0054696D6573204E657720526F6D616E000C00
      000000000000000002000000CC00020000000000FFFFFF000000000200000000
      00000000004E06000006004D656D6F31300002001C000000E001000038000000
      1400000003000F0001000000000000000000FFFFFF1F2C02000000000001000A
      005B43555252454E54235D00000000FFFF00000000000200000001000000000F
      0054696D6573204E657720526F6D616E000C00000000000000000002000000CC
      00020000000000FFFFFF0000000002000000000000000000EB06000006004D65
      6D6F313100020054000000E0010000500100001400000003000F000100000000
      0000000000FFFFFF1F2C020000000000010014005B6F64735A61702E224D4544
      49434E414D45225D00000000FFFF00000000000200000001000000000F005469
      6D6573204E657720526F6D616E000C00000000000000000000000000CC000200
      00000000FFFFFF00000000020000000000000000008507000006004D656D6F31
      32000200A4010000E0010000A40000001400000003000F000100000000000000
      0000FFFFFF1F2C020000000000010011005B6F64735A61702E2245494E414D45
      225D00000000FFFF00000000000200000001000000000F0054696D6573204E65
      7720526F6D616E000C00000000000000000002000000CC00020000000000FFFF
      FF00000000020000000000000000001C08000006004D656D6F31330002004802
      0000E0010000980000001400000003000F0001000000000000000000FFFFFF1F
      2C02000000000001000E005B6F64735A61702E224B4F4C225D00000000FFFF00
      000000000200000001000000000F0054696D6573204E657720526F6D616E000C
      00000000000000000002000000CC00020000000000FFFFFF0000000002000000
      000000000000C408000006004D656D6F31340002002400000044020000040100
      00140000000300000001000000000000000000FFFFFF1F2C0200000000000100
      1F00CCE0F2E5F0E8E0EBFCEDEE20EEF2E2E5F2F1F2E2E5EDEDEEE520EBE8F6EE
      3A00000000FFFF00000000000200000001000000000F0054696D6573204E6577
      20526F6D616E000C00000000000000000000000000CC00020000000000FFFFFF
      00000000020000000000000000006709000006004D656D6F3137000200B00100
      004402000010010000140000000300000001000000000000000000FFFFFF1F2C
      02000000000001001A005F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F2028EFEEE4EF
      E8F1FC2900000000FFFF00000000000200000001000000000F0054696D657320
      4E657720526F6D616E000C00000000000000000000000000CC00020000000000
      FFFFFF0000000002000000000000000000F809000006004D656D6F3730000200
      04020000F4000000D4000000140000000300000001000000000000000000FFFF
      FF1F2C0003020C00646420206D6F20207979797900010006005B444154455D00
      000000FFFF00000000000200000001000000000500417269616C000C00000000
      000000000002000000CC00020000000000FFFFFF000000000200000000000000
      0000890A000006004D656D6F313900020020000000AC000000D0000000140000
      000300000001000000000000000000FFFFFF1F2C0003020C00646420206D6F20
      207979797900010006005B444154455D00000000FFFF00000000000200000001
      000000000500417269616C000C00000000000000000002000000CC0002000000
      0000FFFFFF0000000002000000000000000000310B000005004D656D6F330002
      00620100006C0100002C010000140000000300000001000000000000000000FF
      FFFF1F2C02000000000001002A00EDE8E6E520EFE5F0E5F7E8F1EBE5EDEDFBF5
      20ECE0F2E5F0E8E0EBFCEDFBF520F6E5EDEDEEF1F2E5E93A00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000200
      0000CC00020000000000FFFFFF0000000002000000000000000000B90B000006
      004D656D6F3230000200A20000006C0100006000000014000000030000000100
      0000000000000000FFFFFF1F2C02000000000001000900CFF0EEE2E8E7EEF0E0
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      07000000000002000000CC00020000000000FFFFFF0000000002000000000000
      000000470C000006004D656D6F3231000200F60000006C010000700000001400
      00000300000001000000000000000000FFFFFF1F2C02000000000001000F005B
      6F64735A61702E2250524F56225D00000000FFFF000000000002000000010000
      00000500417269616C000A00000007000000000002000000CC00020000000000
      FFFFFF0000000002000000000000000000D20C000006004D656D6F3232000200
      5A0000006C01000054000000140000000300000001000000000000000000FFFF
      FF1F2C02000000000001000C00F120EFEEE4EEF2F7E5F2E02000000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000002
      000000CC00020000000000FFFFFF0000000002000000000000000000630D0000
      06004D656D6F31360002002400000068020000D4000000140000000300000001
      000000000000000000FFFFFF1F2C0003020C00646420206D6F20207979797900
      010006005B444154455D00000000FFFF00000000000200000001000000000500
      417269616C000C00000000000000000002000000CC00020000000000FFFFFF00
      00000002000000000000000000E50D000006004D656D6F313500020004020000
      A400000018000000140000000300000001000000000000000000FFFFFF1F2C02
      000000000001000300CEF22000000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000000000000CC00020000000000FFFF
      FF0000000002000000000000000000720E000006004D656D6F32330002002002
      0000A4000000B8000000140000000300020001000000000000000000FFFFFF1F
      2C02000000000001000E005B6F64735A61702E22444F4C225D00000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000002
      000000CC00020000000000FFFFFF0000000002000000000000000000FC0E0000
      06004D656D6F323400020004020000B8000000D4000000140000000300000001
      000000000000000000FFFFFF1F2C02000000000001000B0028E4EEEBE6EDEEF1
      F2FC2900000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000002000000CC00020000000000FFFFFF0000000002000000
      000000000000890F000006004D656D6F323500020004020000CC000000D40000
      00140000000300020001000000000000000000FFFFFF1F2C0200000000000100
      0E005B6F64735A61702E2246494F225D00000000FFFF00000000000200000001
      000000000500417269616C000A00000000000000000002000000CC0002000000
      0000FFFFFF00000000020000000000000000001010000006004D656D6F323600
      020004020000E0000000D4000000140000000300000001000000000000000000
      FFFFFF1F2C0200000000000100080028D42EC82ECE2E2900000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000020000
      00CC00020000000000FFFFFF0000000002000000000000000000041100000500
      4D656D6F32000200200000003C000000E8000000700000000300000001000000
      000000000000FFFFFF1F2C02000000000005000A00D3D2C2C5D0C6C4C0DE3A0D
      1300C7E0EC2E20CDE0F7E0EBFCEDE8EAE020EFEE200D1E00EBE5F7E5E1EDEE2D
      EEE7E4EEF0EEE2E8F2E5EBFCEDEEE920F0E0E1EEF2E50D1400CECECE2022D3F0
      E5EDE3EEE9E3E0E7EFF0EEEC220D1B005F5F5F5F5F5F5F5F5F5F5F205B6F6473
      5A61702E22474C4156225D00000000FFFF000000000002000000010000000005
      00417269616C000C00000000000000000000000000CC00020000000000FFFFFF
      0000000002000000000000000000EB11000005004D656D6F3100020004020000
      3C000000D8000000700000000300000001000000000000000000FFFFFF1F2C02
      000000000004001300C7E0EC2E20CDE0F7E0EBFCEDE8EAE020EFEE200D1E00EB
      E5F7E5E1EDEE2DEEE7E4EEF0EEE2E8F2E5EBFCEDEEE920F0E0E1EEF2E50D1400
      CECECE2022D3F0E5EDE3EEE9E3E0E7EFF0EEEC220D1B00202020202020202020
      20205B6F64735A61702E22474C415652225D00000000FFFF0000000000020000
      0001000000000500417269616C000C00000000000000000000000000CC000200
      00000000FFFFFF000000000200000000000000FEFEFF00000000000000000000
      0000FC010000000000000000000000000000000058000ACF5E302ED2E2405794
      C395D66DE440}
  end
  object frDBdsZap: TfrDBDataSet
    DataSet = odsZap
    Left = 88
    Top = 112
  end
  object frudsZap: TfrUserDataset
    Left = 688
    Top = 152
  end
  object odsZap: TOracleDataSet
    SQL.Strings = (
      
        'select /*+rule*/ :fio as fio,:dol as dol,rownum, tkart.fc_name a' +
        's medicname,tei.fc_name as einame,kol,'
      
        'ASU.PKG_SMINI.READSTRING('#39'BUHMED'#39','#39'S_TYPE'#39','#39#1054#1088#1077#1093#1086#1074#1072' '#1053'.'#1042'.'#39') as bu' +
        'h,'
      
        'ASU.PKG_SMINI.READSTRING('#39'NAMEPROV'#39','#39'RODPAD'#39','#39#1042#1088#1086#1085#1089#1082#1086#1081' '#1057'.'#1040'.'#39') as' +
        ' prov,'
      'asu.get_glavfio as glav,'
      
        'ASU.PKG_SMINI.READSTRING('#39'GLAV'#39','#39'RODPAD'#39','#39#1053#1086#1089#1080#1082#1086#1074#1091' '#1043'.'#1048'.'#39') as gla' +
        'vr,'
      
        'ASU.PKG_SMINI.READSTRING('#39'NACHLOK'#39','#39'RODPAD'#39','#39#1052#1072#1096#1091#1082#1086#1074#1091' '#1042'.'#1044'.'#39') as ' +
        'nachr,'
      
        'ASU.PKG_SMINI.READSTRING('#39'MANAGER_DOC'#39','#39'CLIENT_NAME'#39','#39#1051#1054#1050' "'#1042#1080#1090#1103#1079 +
        #1100'"'#39') as lok,'
      
        'ASU.PKG_SMINI.READSTRING('#39'NACHLOK'#39','#39'FIO'#39','#39#1052#1072#1096#1091#1082#1086#1074' '#1042'.'#1044'.'#39') as nach' +
        ','
      'ASU.PKG_SMINI.READSTRING('#39'GLBUH'#39','#39'FIO'#39','#39'GLBUH\FIO'#39') as glbuh'
      ' from ('
      'select /*+rule*/ sum(fn_kol) as kol,k.kartid  as medid'
      'from MED.tdpc d, MED.tkart k'
      'where dpid=:adpid'
      ' and d.kartid=k.kartid'
      ' group by k.kartid'
      ' '
      '), MED.tdpc, MED.tkart, MED.tmedic, MED.tei'
      'where dpid=:adpid'
      ' and tdpc.kartid=tkart.kartid'
      ' and tkart.medicid=tmedic.medicid'
      ' and tei.eiid=tmedic.eiid'
      ' and tkart.kartid=medid'
      ' AND TMEDIC.FL_VISIBLE = 1'
      'order by tmedic.fc_name')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A414450494403000000040000003F1700000000
      0000040000003A46494F050000000000000000000000040000003A444F4C0500
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E00000006000000524F574E554D010000000000090000004D454449
      434E414D450100000000000600000045494E414D45010000000000030000004B
      4F4C0100000000000300000046494F01000000000003000000444F4C01000000
      0000030000004255480100000000000400000050524F56010000000000040000
      00474C4156010000000000030000004C4F4B010000000000040000004E414348
      01000000000005000000474C42554801000000000005000000474C4156520100
      00000000050000004E41434852010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 8
    Top = 112
    object odsZapFIO: TStringField
      FieldName = 'FIO'
      Size = 4000
    end
    object odsZapDOL: TStringField
      FieldName = 'DOL'
      Size = 4000
    end
    object odsZapROWNUM: TFloatField
      FieldName = 'ROWNUM'
    end
    object odsZapMEDICNAME: TStringField
      FieldName = 'MEDICNAME'
      Size = 255
    end
    object odsZapEINAME: TStringField
      FieldName = 'EINAME'
      Required = True
      Size = 10
    end
    object odsZapKOL: TFloatField
      FieldName = 'KOL'
    end
    object odsZapBUH: TStringField
      FieldName = 'BUH'
      Size = 4000
    end
    object odsZapPROV: TStringField
      FieldName = 'PROV'
      Size = 4000
    end
    object odsZapGLAV: TStringField
      FieldName = 'GLAV'
      Size = 4000
    end
    object odsZapLOK: TStringField
      FieldName = 'LOK'
      Size = 4000
    end
    object odsZapNACH: TStringField
      FieldName = 'NACH'
      Size = 4000
    end
    object odsZapGLBUH: TStringField
      FieldName = 'GLBUH'
      Size = 4000
    end
    object odsZapGLAVR: TStringField
      FieldName = 'GLAVR'
      Size = 4000
    end
    object odsZapNACHR: TStringField
      FieldName = 'NACHR'
      Size = 4000
    end
  end
  object frudsTrebMove: TfrUserDataset
    Left = 688
    Top = 184
  end
  object frTrebmove: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 648
    Top = 312
    ReportForm = {
      19000000BE1B0000190000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF0000000000000100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000008000000F6020000560100003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E48656164657231000201000000007C010000F60200002000000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200B10100000B004D6173746572446174613100020100000000B4010000F602
      0000180000003100050001000000000000000000FFFFFF1F000000000E006672
      44426473547265624D6F766500000000000000FFFF0000000000020000000100
      00000000000001000000C8000000140000000100000000000002001E0200000D
      004D6173746572466F6F7465723100020100000000E4010000F6020000F60000
      003000060001000000000000000000FFFFFF1F00000000000000000000000000
      FFFF000000000002000000010000000000000001000000C80000001400000001
      0000000000000000AF02000006004D656D6F3730000200F401000080000000EC
      000000140000000300000001000000000000000000FFFFFF1F2C0003020C0064
      6420206D6F20207979797900010006005B444154455D00000000FFFF00000000
      000200000001000000000500417269616C000C00000000000000000002000000
      CC00020000000000FFFFFF00000000020000000000000000007A03000005004D
      656D6F320002007A000000B0000000FC0100001C000000030000000100000000
      0000000000FFFFFF1F2C02000000000001002E00D2F0E5E1EEE2E0EDE8E520E2
      20E0EFF2E5EAF320B9205B6F647353656C446F634D6F76652E2246435F444F43
      225D0004000500626567696E0D0A00202073756D6D3A3D303B0D020020200D03
      00656E6400FFFF00000000000200000001000000000500417269616C00100000
      0002000000000002000000CC00020000000000FFFFFF00000000020000000000
      000000001204000005004D656D6F330002000A010000DC000000DC0000001400
      00000300000001000000000000000000FFFFFF1F2C00030200000001001A00CE
      F2205B6F647353656C446F634D6F76652E2244415441225D2000000000FFFF00
      000000000200000001000000000500417269616C000C00000004000000000002
      000000CC00020000000000FFFFFF0000000002000000000000000000A2040000
      05004D656D6F3400020028000000200100005800000028000000030000000100
      0000000000000000FFFFFF1F2C02000000000002000400C4EBFF3A0D0B00D7E5
      F0E5E720EAEEE3EE3A00000000FFFF0000000000020000000100000000050041
      7269616C000C00000000000000000000000000CC00020000000000FFFFFF0000
      0000020000000000000000003805000005004D656D6F35000200840000001C01
      0000C0000000140000000300000001000000000000000000FFFFFF1F2C020000
      000000010018005B6F647353656C446F634D6F76652E224E414D45544F225D00
      000000FFFF00000000000200000001000000000500417269616C000C00000004
      000000000000000000CC00020000000000FFFFFF000000000200000000000000
      0000D205000005004D656D6F3600020080000000300100002402000014000000
      0300000001000000000000000000FFFFFF1F2C02000000000001001C005B6F64
      7353656C446F634D6F76652E2246435F434F4D4D454E54225D00000000FFFF00
      000000000200000001000000000500417269616C000C00000004000000000000
      000000CC00020000000000FFFFFF000000000200000000000000000059060000
      05004D656D6F37000200140000007C0100001C0000002000000003000F000100
      0000000000000000FFFFFF1F2C02000000000002000200B9200D0400EF2EEF2E
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      000000E306000005004D656D6F38000200300000007C010000D8000000200000
      0003000F0001000000000000000000FFFFFF1F2C02000000000001000C00CDE0
      E8ECE5EDEEE2E0EDE8E500000000FFFF00000000000200000001000000000500
      417269616C000A0000000000000000000A000000CC00020000000000FFFFFF00
      000000020000000000000000006907000005004D656D6F39000200080100007C
      0100004C0000002000000003000F0001000000000000000000FFFFFF1F2C0200
      0000000001000800C5E42E20C8E7EC2E00000000FFFF00000000000200000001
      000000000500417269616C000A0000000000000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000F207000006004D656D6F313000
      0200540100007C010000D00000001000000003000F0001000000000000000000
      FFFFFF1F2C02000000000001000A00CAEEEBE8F7E5F1F2E2EE00000000FFFF00
      000000000200000001000000000500417269616C000A0000000000000000000A
      000000CC00020000000000FFFFFF00000000020000000000000000007A080000
      06004D656D6F3131000200540100008C0100006C0000001000000003000F0001
      000000000000000000FFFFFF1F2C02000000000001000900D2F0E5E1F3E5ECEE
      E500000000FFFF00000000000200000001000000000500417269616C000A0000
      000000000000000A000000CC00020000000000FFFFFF00000000020000000000
      000000000109000006004D656D6F3132000200C00100008C0100006400000010
      00000003000F0001000000000000000000FFFFFF1F2C02000000000001000800
      CEF2EFF3F9E5EDEE00000000FFFF000000000002000000010000000005004172
      69616C000A0000000000000000000A000000CC00020000000000FFFFFF000000
      00020000000000000000008409000006004D656D6F3133000200240200007C01
      0000600000002000000003000F0001000000000000000000FFFFFF1F2C020000
      00000001000400D6E5EDE000000000FFFF000000000002000000010000000005
      00417269616C000A0000000000000000000A000000CC00020000000000FFFFFF
      0000000002000000000000000000080A000006004D656D6F3134000200840200
      007C010000580000002000000003000F0001000000000000000000FFFFFF1F2C
      02000000000001000500D1F3ECECE000000000FFFF0000000000020000000100
      0000000500417269616C000A0000000000000000000A000000CC000200000000
      00FFFFFF0000000002000000000000000000910A000006004D656D6F31350002
      0014000000B40100001C0000001800000003000F0001000000000000000000FF
      FFFF1F2C02000000000001000A005B43555252454E54235D00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000A00
      0000CC00020000000000FFFFFF0000000002000000000000000000260B000006
      004D656D6F313700020008010000B40100004C0000001800000003000F000100
      0000000000000000FFFFFF1F2C020000000000010016005B6F6473547265624D
      6F76652E2245494E414D45225D00000000FFFF00000000000200000001000000
      000500417269616C000A0000000000000000000A000000CC00020000000000FF
      FFFF0000000002000000000000000000BC0B000006004D656D6F313900020054
      010000B40100006C0000001800000003000F0001000000000000000000FFFFFF
      1F2C020000000000010017005B6F6473547265624D6F76652E22545245424B4F
      4C225D00000000FFFF00000000000200000001000000000500417269616C000A
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      000000000000510C000006004D656D6F3230000200C0010000B4010000640000
      001800000003000F0001000000000000000000FFFFFF1F2C0200000000000100
      16005B6F6473547265624D6F76652E22464E5F4B4F4C225D00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000A00
      0000CC00020000000000FFFFFF0000000002000000000000000000FF0C000006
      004D656D6F323100020024020000B4010000600000001800000003000F000100
      0000000000000000FFFFFF1F2C02000000000001002F005B464F524D4154464C
      4F4154282730F02E3030EA2E272C205B6F6473547265624D6F76652E22707269
      6365225D295D00000000FFFF0000000000020000000100000000050041726961
      6C000A0000000000000000000A000000CC00020000000000FFFFFF0000000002
      000000000000000000E30D000006004D656D6F323200020084020000B4010000
      580000001800000003000F0001000000000000000000FFFFFF1F2C0200000000
      00010031005B464F524D4154464C4F4154282730F02E3030EA2E272C205B6F64
      73547265624D6F76652E22464E5F73756D6D225D295D0003000500626567696E
      0D24002073756D6D3A3D5B6F6473547265624D6F76652E22464E5F73756D6D22
      5D2B73756D6D3B0D0300656E6400FFFF00000000000200000001000000000500
      417269616C000A0000000000000000000A000000CC00020000000000FFFFFF00
      00000002000000000000000000680E000006004D656D6F323700020014000000
      E4010000700200001800000003000F0001000000000000000000FFFFFF1F2C02
      000000000001000600C8F2EEE3EE3A00000000FFFF0000000000020000000100
      0000000500417269616C000A00000000000000000009000000CC000200000000
      00FFFFFF0000000002000000000000000000060F000006004D656D6F33330002
      0084020000E4010000580000001800000003000F0001000000000000000000FF
      FFFF1F2C02000000000001001F005B464F524D4154464C4F4154282730F02E30
      30EA2E272C5B73756D6D5D295D00000000FFFF00000000000200000001000000
      000500417269616C000A0000000000000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000009E0F000006004D656D6F323800020030
      000000B4010000D80000001800000007000F0001000000000000000000FFFFFF
      1F2C020000000000010019005B6F6473547265624D6F76652E224E414D454D45
      444943225D00000000FFFF00000000000200000001000000000500417269616C
      000800000000000000000008000000CC00020000000000FFFFFF000000000200
      00000000000000002810000006004D656D6F31360002002C0000000E02000054
      000000100000000300000001000000000000000000FFFFFF1F2C020000000000
      01000B00CEF2EFF3F1F2E8EBE0203A00000000FFFF0000000000020000000100
      0000000500417269616C000A00000000000000000001000000CC000200000000
      00FFFFFF0000000002000000000000000000B210000006004D656D6F31380002
      00380000003E02000048000000120000000300000001000000000000000000FF
      FFFF1F2C02000000000001000B00CFEEEBF3F7E8EB28E0293A00000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000000
      000000CC00020000000000FFFFFF000000000200000000000000000047110000
      06004D656D6F3335000200880000003E0200009C000000140000000300020001
      000000000000000000FFFFFF1F2C020000000000010016005B6F647354726562
      4D6F76652E22444F4C4F5450225D00000000FFFF000000000002000000010000
      00000500417269616C000A00000000000000000002000000CC00020000000000
      FFFFFF0000000002000000000000000000CF11000006004D656D6F3336000200
      88000000520200009C000000140000000300000001000000000000000000FFFF
      FF1F2C02000000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF00000000
      000200000001000000000500417269616C000A00000000000000000002000000
      CC00020000000000FFFFFF00000000020000000000000000004E12000006004D
      656D6F3337000200300100003E0200009C000000140000000300020001000000
      000000000000FFFFFF1F2C0200000000000100000000000000FFFF0000000000
      0200000001000000000500417269616C000A00000000000000000000000000CC
      00020000000000FFFFFF0000000002000000000000000000D412000006004D65
      6D6F333800020030010000520200009C00000014000000030000000100000000
      0000000000FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC00000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      0002000000CC00020000000000FFFFFF00000000020000000000000000006613
      000006004D656D6F3339000200D40100003E020000EC00000014000000030002
      0001000000000000000000FFFFFF1F2C020000000000010013005B6F64735472
      65624D6F76652E224F5450225D00000000FFFF00000000000200000001000000
      000500417269616C000A00000000000000000002000000CC00020000000000FF
      FFFF0000000002000000000000000000F813000006004D656D6F3430000200D4
      01000052020000EC000000140000000300000001000000000000000000FFFFFF
      1F2C02000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      000000000002000000CC00020000000000FFFFFF000000000200000000000000
      00008D14000006004D656D6F3236000200880000000C0200009C000000140000
      000300020001000000000000000000FFFFFF1F2C020000000000010016005B6F
      6473547265624D6F76652E22444F4C504F4C225D00000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000002000000CC00
      020000000000FFFFFF00000000020000000000000000001515000006004D656D
      6F323400020088000000200200009C0000001400000003000000010000000000
      00000000FFFFFF1F2C02000000000001000900C4EEEBE6EDEEF1F2FC00000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      000002000000CC00020000000000FFFFFF000000000200000000000000000094
      15000006004D656D6F3330000200300100000C0200009C000000140000000300
      020001000000000000000000FFFFFF1F2C0200000000000100000000000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      0000000000CC00020000000000FFFFFF00000000020000000000000000001A16
      000006004D656D6F333100020030010000200200009C00000014000000030000
      0001000000000000000000FFFFFF1F2C02000000000001000700CFEEE4EFE8F1
      FC00000000FFFF00000000000200000001000000000500417269616C000A0000
      0000000000000002000000CC00020000000000FFFFFF00000000020000000000
      00000000AC16000006004D656D6F3332000200D40100000C020000EC00000014
      0000000300020001000000000000000000FFFFFF1F2C02000000000001001300
      5B6F6473547265624D6F76652E22504F4C225D00000000FFFF00000000000200
      000001000000000500417269616C000A00000000000000000002000000CC0002
      0000000000FFFFFF00000000020000000000000000003E17000006004D656D6F
      3334000200D401000020020000EC000000140000000300000001000000000000
      000000FFFFFF1F2C02000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEE
      E4EFE8F1E800000000FFFF00000000000200000001000000000500417269616C
      000A00000000000000000002000000CC00020000000000FFFFFF000000000200
      0000000000000000C617000006004D656D6F3431000200880000006E0200009C
      000000140000000300020001000000000000000000FFFFFF1F2C020000000000
      01000900C1F3F5E3E0EBF2E5F000000000FFFF00000000000200000001000000
      000500417269616C000A00000000000000000002000000CC00020000000000FF
      FFFF00000000020000000000000000004E18000006004D656D6F343200020088
      000000820200009C000000140000000300000001000000000000000000FFFFFF
      1F2C02000000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF0000000000
      0200000001000000000500417269616C000A00000000000000000002000000CC
      00020000000000FFFFFF0000000002000000000000000000CD18000006004D65
      6D6F3433000200300100006E0200009C00000014000000030002000100000000
      0000000000FFFFFF1F2C0200000000000100000000000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000000000000CC00
      020000000000FFFFFF00000000020000000000000000005319000006004D656D
      6F343400020030010000820200009C0000001400000003000000010000000000
      00000000FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      02000000CC00020000000000FFFFFF0000000002000000000000000000E51900
      0006004D656D6F3435000200D40100006E020000EC0000001400000003000200
      01000000000000000000FFFFFF1F2C020000000000010013005B6F6473547265
      624D6F76652E22425548225D00000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000002000000CC00020000000000FFFF
      FF0000000002000000000000000000771A000006004D656D6F3436000200D401
      000082020000EC000000140000000300000001000000000000000000FFFFFF1F
      2C02000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E80000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      0000000002000000CC00020000000000FFFFFF00000000020000000000000000
      00701B000005004D656D6F31000200F401000010000000EC0000007000000003
      00000001000000000000000000FFFFFF1F2C02000000000005000A00D3D2C2C5
      D0C6C4C0DE3A0D1300C7E0EC2E20CDE0F7E0EBFCEDE8EAE020EFEE200D1E00EB
      E5F7E5E1EDEE2DEEE7E4EEF0EEE2E8F2E5EBFCEDEEE920F0E0E1EEF2E50D1400
      CECECE2022D3F0E5EDE3EEE9E3E0E7EFF0EEEC220D20005F5F5F5F5F5F5F5F5F
      5F5F205B6F6473547265624D6F76652E22474C4156225D00000000FFFF000000
      00000200000001000000000500417269616C000C000000000000000000000000
      00CC00020000000000FFFFFF000000000200000000000000FEFEFF020000000A
      002043617465676F72793100000000040073756D6D0001003000000000000000
      0000FC010000000000000000000000000000000058000ACF5E302ED2E2405794
      C395D66DE440}
  end
  object frDBdsTrebMove: TfrDBDataSet
    DataSet = odsTrebMove
    Left = 88
    Top = 240
  end
  object odsTrebMove: TOracleDataSet
    SQL.Strings = (
      
        'select /*+rule*/ :otp as otp,:dolotp as dolotp,:pol as pol,:dolp' +
        'ol as dolpol,tdpc.fn_summ/tdpc.fn_kol as price,tmedic.fc_name as' +
        ' namemedic,tei.fc_name as einame,fn_kol as trebkol,fn_kol,fn_sum' +
        'm,'
      'ASU.PKG_SMINI.READSTRING('#39'BUHMED'#39','#39'S_TYPE'#39','#39#1053#1077#1080#1079#1074#1077#1089#1090#1077#1085#39') as buh,'
      'asu.get_glavfio as glav,'
      
        'ASU.PKG_SMINI.READSTRING('#39'MANAGER_DOC'#39','#39'CLIENT_NAME'#39','#39#1051#1054#1050' "'#1042#1080#1090#1103#1079 +
        #1100'"'#39') as lok'
      ' '
      '  from MED.tdpc, MED.tkart, MED.tmedic, MED.tei'
      '  where dpid=:adpid'
      '    and tdpc.kartid=tkart.kartid'
      '    and tkart.medicid=tmedic.medicid'
      '    and tmedic.eiid=tei.eiid'
      '--    AND TMEDIC.FL_VISIBLE = 1'
      '')
    Optimize = False
    Variables.Data = {
      0300000005000000060000003A41445049440300000000000000000000000400
      00003A4F5450050000000000000000000000070000003A444F4C4F5450050000
      000000000000000000040000003A504F4C050000000000000000000000070000
      003A444F4C504F4C050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000D0000000600000045494E414D4501000000000006000000464E5F4B
      4F4C010000000000090000004E414D454D454449430100000000000700000054
      5245424B4F4C010000000000030000004F545001000000000006000000444F4C
      4F545001000000000003000000504F4C01000000000006000000444F4C504F4C
      01000000000007000000464E5F53554D4D010000000000050000005052494345
      0100000000000300000042554801000000000004000000474C41560100000000
      00030000004C4F4B010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 8
    Top = 240
    object odsTrebMoveOTP: TStringField
      FieldName = 'OTP'
      Size = 4000
    end
    object odsTrebMoveDOLOTP: TStringField
      FieldName = 'DOLOTP'
      Size = 4000
    end
    object odsTrebMovePOL: TStringField
      FieldName = 'POL'
      Size = 4000
    end
    object odsTrebMoveDOLPOL: TStringField
      FieldName = 'DOLPOL'
      Size = 4000
    end
    object odsTrebMoveNAMEMEDIC: TStringField
      FieldName = 'NAMEMEDIC'
      Required = True
      Size = 255
    end
    object odsTrebMoveEINAME: TStringField
      FieldName = 'EINAME'
      Required = True
      Size = 10
    end
    object odsTrebMoveTREBKOL: TFloatField
      FieldName = 'TREBKOL'
    end
    object odsTrebMoveFN_KOL: TFloatField
      FieldName = 'FN_KOL'
    end
    object odsTrebMoveFN_SUMM: TFloatField
      FieldName = 'FN_SUMM'
    end
    object odsTrebMovePRICE: TFloatField
      FieldName = 'PRICE'
    end
    object odsTrebMoveBUH: TStringField
      FieldName = 'BUH'
      Size = 4000
    end
    object odsTrebMoveGLAV: TStringField
      FieldName = 'GLAV'
      Size = 4000
    end
    object odsTrebMoveLOK: TStringField
      FieldName = 'LOK'
      Size = 4000
    end
  end
  object odsTrebMovePKU: TOracleDataSet
    SQL.Strings = (
      'select /*+rule*/'
      '    :otp as otp,'
      '    :dolotp as dolotp,'
      '    :pol as pol,'
      '    :dolpol as dolpol,'
      '    tmedic.fc_name as namemedic,'
      '    tei.fc_name as einame,'
      '    fn_kol as trebkol,'
      '    fn_kol,'
      '    fn_summ,'
      '    fn_summ/fn_kol as price,'
      
        '    ASU.PKG_SMINI.READSTRING('#39'BUHMED'#39','#39'S_TYPE'#39','#39#1054#1088#1077#1093#1086#1074#1072' '#1053'.'#1042'.'#39') a' +
        's buh,'
      '    asu.get_glavfio as glav,'
      
        '    ASU.PKG_SMINI.READSTRING('#39'MANAGER_DOC'#39','#39'CLIENT_NAME'#39','#39#1051#1054#1050' "'#1042 +
        #1080#1090#1103#1079#1100'"'#39') as lok'
      '  from MED.tdpc, MED.tkart, MED.tmedic, MED.tei'
      '  where dpid=:adpid'
      '    and tdpc.kartid=tkart.kartid'
      '    and tkart.medicid=tmedic.medicid'
      '    and tmedic.eiid=tei.eiid'
      '    and tmedic.fl_pku=1'
      '    AND TMEDIC.FL_VISIBLE = 1')
    Optimize = False
    Variables.Data = {
      0300000005000000060000003A41445049440300000000000000000000000400
      00003A4F5450050000000000000000000000070000003A444F4C4F5450050000
      000000000000000000040000003A504F4C050000000000000000000000070000
      003A444F4C504F4C050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000D000000090000004E414D454D454449430100000000000600000046
      4E5F4B4F4C0100000000000600000045494E414D450100000000000700000054
      5245424B4F4C010000000000030000004F545001000000000006000000444F4C
      4F545001000000000003000000504F4C01000000000006000000444F4C504F4C
      01000000000007000000464E5F53554D4D010000000000050000005052494345
      0100000000000300000042554801000000000004000000474C41560100000000
      00030000004C4F4B010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 8
    Top = 192
    object odsTrebMovePKUOTP: TStringField
      FieldName = 'OTP'
      Size = 4000
    end
    object odsTrebMovePKUDOLOTP: TStringField
      FieldName = 'DOLOTP'
      Size = 4000
    end
    object odsTrebMovePKUNAMEMEDIC: TStringField
      FieldName = 'NAMEMEDIC'
      Required = True
      Size = 255
    end
    object odsTrebMovePKUEINAME: TStringField
      FieldName = 'EINAME'
      Required = True
      Size = 10
    end
    object odsTrebMovePKUTREBKOL: TFloatField
      FieldName = 'TREBKOL'
    end
    object odsTrebMovePKUFN_KOL: TFloatField
      FieldName = 'FN_KOL'
    end
    object odsTrebMovePKUPOL: TStringField
      FieldName = 'POL'
      Size = 4000
    end
    object odsTrebMovePKUDOLPOL: TStringField
      FieldName = 'DOLPOL'
      Size = 4000
    end
    object odsTrebMovePKUFN_SUMM: TFloatField
      FieldName = 'FN_SUMM'
    end
    object odsTrebMovePKUPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object odsTrebMovePKUBUH: TStringField
      FieldName = 'BUH'
      Size = 4000
    end
    object odsTrebMovePKUGLAV: TStringField
      FieldName = 'GLAV'
      Size = 4000
    end
    object odsTrebMovePKULOK: TStringField
      FieldName = 'LOK'
      Size = 4000
    end
  end
  object frudsTrebMovePKU: TfrUserDataset
    Left = 688
    Top = 216
  end
  object frTrebMovePKU: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 648
    Top = 344
    ReportForm = {
      19000000951C0000190000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF0000000000000100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      00000C000000F6020000760100003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E486561646572310002010000000040020000F60200002000000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200B40100000B004D61737465724461746131000201000000008C020000F602
      0000180000003100050001000000000000000000FFFFFF1F0000000011006672
      44426473547265624D6F7665504B5500000000000000FFFF0000000000020000
      00010000000000000001000000C8000000140000000100000000000002002102
      00000D00436F6C756D6E466F6F7465723100020100000000C8020000F6020000
      DC00000030000F0001000000000000000000FFFFFF1F00000000000000000000
      000000FFFF000000000002000000010000000000000001000000C80000001400
      0000010000000000000000B202000006004D656D6F3730000200F80100008700
      0000EC000000150000000300000001000000000000000000FFFFFF1F2C000302
      0C00646420206D6F20207979797900010006005B444154455D00000000FFFF00
      000000000200000001000000000500417269616C000C00000000000000000002
      000000CC00020000000000FFFFFF00000000020000000000000000007D030000
      05004D656D6F3200020044000000A0000000680200001C000000030000000100
      0000000000000000FFFFFF1F2C02000000000001002E00D2F0E5E1EEE2E0EDE8
      E520E220E0EFF2E5EAF320B9205B6F647353656C446F634D6F76652E2246435F
      444F43225D0004000500626567696E0D0B0020202073756D6D3A3D303B0D0100
      200D0300656E6400FFFF00000000000200000001000000000500417269616C00
      1000000002000000000002000000CC00020000000000FFFFFF00000000020000
      000000000000001504000005004D656D6F330002000A010000E0000000DC0000
      00140000000300000001000000000000000000FFFFFF1F2C0003020000000100
      1A00CEF2205B6F647353656C446F634D6F76652E2244415441225D2000000000
      FFFF00000000000200000001000000000500417269616C000C00000004000000
      000002000000CC00020000000000FFFFFF0000000002000000000000000000A5
      04000005004D656D6F340002001C0000001C0100005800000028000000030000
      0001000000000000000000FFFFFF1F2C02000000000002000400C4EBFF3A0D0B
      00D7E5F0E5E720EAEEE3EE3A00000000FFFF0000000000020000000100000000
      0500417269616C000C00000000000000000000000000CC00020000000000FFFF
      FF00000000020000000000000000003B05000005004D656D6F35000200740000
      0018010000C0000000140000000300000001000000000000000000FFFFFF1F2C
      020000000000010018005B6F647353656C446F634D6F76652E224E414D45544F
      225D00000000FFFF00000000000200000001000000000500417269616C000C00
      000004000000000000000000CC00020000000000FFFFFF000000000200000000
      0000000000D505000005004D656D6F36000200740000002C0100003802000014
      0000000300000001000000000000000000FFFFFF1F2C02000000000001001C00
      5B6F647353656C446F634D6F76652E2246435F434F4D4D454E54225D00000000
      FFFF00000000000200000001000000000500417269616C000C00000004000000
      000000000000CC00020000000000FFFFFF00000000020000000000000000005C
      06000005004D656D6F3700020014000000400200001C0000002000000003000F
      0001000000000000000000FFFFFF1F2C02000000000002000200B9200D0400EF
      2EEF2E00000000FFFF00000000000200000001000000000500417269616C000A
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      000000000000E606000005004D656D6F380002003000000040020000D8000000
      2000000003000F0001000000000000000000FFFFFF1F2C02000000000001000C
      00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF00000000000200000001000000
      000500417269616C000A0000000000000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000006C07000005004D656D6F390002000801
      0000400200004C0000002000000003000F0001000000000000000000FFFFFF1F
      2C02000000000001000800C5E42E20C8E7EC2E00000000FFFF00000000000200
      000001000000000500417269616C000A0000000000000000000A000000CC0002
      0000000000FFFFFF0000000002000000000000000000F507000006004D656D6F
      31300002005401000040020000D00000001000000003000F0001000000000000
      000000FFFFFF1F2C02000000000001000A00CAEEEBE8F7E5F1F2E2EE00000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      00000A000000CC00020000000000FFFFFF00000000020000000000000000007D
      08000006004D656D6F313100020054010000500200006C000000100000000300
      0F0001000000000000000000FFFFFF1F2C02000000000001000900D2F0E5E1F3
      E5ECEEE500000000FFFF00000000000200000001000000000500417269616C00
      0A0000000000000000000A000000CC00020000000000FFFFFF00000000020000
      000000000000000409000006004D656D6F3132000200C0010000500200006400
      00001000000003000F0001000000000000000000FFFFFF1F2C02000000000001
      000800CEF2EFF3F9E5EDEE00000000FFFF000000000002000000010000000005
      00417269616C000A0000000000000000000A000000CC00020000000000FFFFFF
      00000000020000000000000000008709000006004D656D6F3133000200240200
      0040020000600000002000000003000F0001000000000000000000FFFFFF1F2C
      02000000000001000400D6E5EDE000000000FFFF000000000002000000010000
      00000500417269616C000A0000000000000000000A000000CC00020000000000
      FFFFFF00000000020000000000000000000B0A000006004D656D6F3134000200
      8402000040020000580000002000000003000F0001000000000000000000FFFF
      FF1F2C02000000000001000500D1F3ECECE000000000FFFF0000000000020000
      0001000000000500417269616C000A0000000000000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000940A000006004D656D6F31
      35000200140000008C0200001C0000001800000003000F000100000000000000
      0000FFFFFF1F2C02000000000001000A005B43555252454E54235D00000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      000A000000CC00020000000000FFFFFF00000000020000000000000000002F0B
      000006004D656D6F3136000200300000008C020000D80000001800000003000F
      0001000000000000000000FFFFFF1F2C02000000000001001C005B6F64735472
      65624D6F7665504B552E224E414D454D45444943225D00000000FFFF00000000
      000200000001000000000500417269616C000A00000000000000000008000000
      CC00020000000000FFFFFF0000000002000000000000000000C70B000006004D
      656D6F3137000200080100008C0200004C0000001800000003000F0001000000
      000000000000FFFFFF1F2C020000000000010019005B6F6473547265624D6F76
      65504B552E2245494E414D45225D00000000FFFF000000000002000000010000
      00000500417269616C000A0000000000000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000600C000006004D656D6F3139000200
      540100008C0200006C0000001800000003000F0001000000000000000000FFFF
      FF1F2C02000000000001001A005B6F6473547265624D6F7665504B552E225452
      45424B4F4C225D00000000FFFF00000000000200000001000000000500417269
      616C000A0000000000000000000A000000CC00020000000000FFFFFF00000000
      02000000000000000000F80C000006004D656D6F3230000200C00100008C0200
      00640000001800000003000F0001000000000000000000FFFFFF1F2C02000000
      0000010019005B6F6473547265624D6F7665504B552E22464E5F4B4F4C225D00
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      0000A90D000006004D656D6F3231000200240200008C02000060000000180000
      0003000F0001000000000000000000FFFFFF1F2C020000000000010032005B46
      4F524D4154464C4F4154282730F02E3030EA2E272C205B6F6473547265624D6F
      7665504B552E225072696365225D295D00000000FFFF00000000000200000001
      000000000500417269616C000A0000000000000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000930E000006004D656D6F323200
      0200840200008C020000580000001800000003000F0001000000000000000000
      FFFFFF1F2C020000000000010034005B464F524D4154464C4F4154282730F02E
      3030EA2E272C205B6F6473547265624D6F7665504B552E22464E5F53554D4D22
      5D295D0003000500626567696E0D27002073756D6D3A3D5B6F6473547265624D
      6F7665504B552E22464E5F53554D4D225D2B73756D6D3B0D0300656E6400FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000180F00
      0006004D656D6F323700020014000000C8020000700200001800000003000F00
      01000000000000000000FFFFFF1F2C02000000000001000600C8F2EEE3EE3A00
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      000000000009000000CC00020000000000FFFFFF000000000200000000000000
      0000B60F000006004D656D6F333300020084020000C802000058000000180000
      0003000F0001000000000000000000FFFFFF1F2C02000000000001001F005B46
      4F524D4154464C4F4154282730F02E3030EA2E272C5B73756D6D5D295D000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      6310000006004D656D6F33300002002A000000BC000000A80200002000000003
      00000001000000000000000000FFFFFF1F2C02000000000001002E00EDE020EE
      F2EFF3F1EA20EBE5EAE0F0F1F2E2E5EDEDFBF520F1F0E5E4F1F2E220EFEEE4EB
      E5E6E0F9E8F520CFCAD300000000FFFF00000000000200000001000000000500
      417269616C001000000002000000000002000000CC00020000000000FFFFFF00
      00000002000000000000000000ED10000006004D656D6F323600020028000000
      FA02000054000000100000000300000001000000000000000000FFFFFF1F2C02
      000000000001000B00CEF2EFF3F1F2E8EBE0203A00000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000001000000CC00
      020000000000FFFFFF00000000020000000000000000007711000006004D656D
      6F3238000200340000002A030000480000001200000003000000010000000000
      00000000FFFFFF1F2C02000000000001000B00CFEEEBF3F7E8EB28E0293A0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      0000000000000000CC00020000000000FFFFFF00000000020000000000000000
      000F12000006004D656D6F3335000200840000002A0300009C00000014000000
      0300020001000000000000000000FFFFFF1F2C020000000000010019005B6F64
      73547265624D6F7665504B552E22444F4C4F5450225D00000000FFFF00000000
      000200000001000000000500417269616C000A00000000000000000002000000
      CC00020000000000FFFFFF00000000020000000000000000009712000006004D
      656D6F3336000200840000003E0300009C000000140000000300000001000000
      000000000000FFFFFF1F2C02000000000001000900C4EEEBE6EDEEF1F2FC0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      0000000002000000CC00020000000000FFFFFF00000000020000000000000000
      001613000006004D656D6F33370002002C0100002A0300009C00000014000000
      0300020001000000000000000000FFFFFF1F2C02000000000001000000000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      00000000000000CC00020000000000FFFFFF0000000002000000000000000000
      9C13000006004D656D6F33380002002C0100003E0300009C0000001400000003
      00000001000000000000000000FFFFFF1F2C02000000000001000700CFEEE4EF
      E8F1FC00000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000002000000CC00020000000000FFFFFF0000000002000000
      0000000000003114000006004D656D6F3339000200D00100002A030000EC0000
      00140000000300020001000000000000000000FFFFFF1F2C0200000000000100
      16005B6F6473547265624D6F7665504B552E224F5450225D00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000200
      0000CC00020000000000FFFFFF0000000002000000000000000000C314000006
      004D656D6F3430000200D00100003E030000EC00000014000000030000000100
      0000000000000000FFFFFF1F2C02000000000001001300D0E0F1F8E8F4F0EEE2
      EAE020EFEEE4EFE8F1E800000000FFFF00000000000200000001000000000500
      417269616C000A00000000000000000002000000CC00020000000000FFFFFF00
      000000020000000000000000005B15000006004D656D6F323900020084000000
      F80200009C000000140000000300020001000000000000000000FFFFFF1F2C02
      0000000000010019005B6F6473547265624D6F7665504B552E22444F4C504F4C
      225D00000000FFFF00000000000200000001000000000500417269616C000A00
      000000000000000002000000CC00020000000000FFFFFF000000000200000000
      0000000000E315000006004D656D6F3331000200840000000C0300009C000000
      140000000300000001000000000000000000FFFFFF1F2C020000000000010009
      00C4EEEBE6EDEEF1F2FC00000000FFFF00000000000200000001000000000500
      417269616C000A00000000000000000002000000CC00020000000000FFFFFF00
      000000020000000000000000006216000006004D656D6F33320002002C010000
      F80200009C000000140000000300020001000000000000000000FFFFFF1F2C02
      00000000000100000000000000FFFF0000000000020000000100000000050041
      7269616C000A00000000000000000000000000CC00020000000000FFFFFF0000
      000002000000000000000000E816000006004D656D6F33340002002C0100000C
      0300009C000000140000000300000001000000000000000000FFFFFF1F2C0200
      0000000001000700CFEEE4EFE8F1FC00000000FFFF0000000000020000000100
      0000000500417269616C000A00000000000000000002000000CC000200000000
      00FFFFFF00000000020000000000000000007D17000006004D656D6F34310002
      00D0010000F8020000EC000000140000000300020001000000000000000000FF
      FFFF1F2C020000000000010016005B6F6473547265624D6F7665504B552E2250
      4F4C225D00000000FFFF00000000000200000001000000000500417269616C00
      0A00000000000000000002000000CC00020000000000FFFFFF00000000020000
      000000000000000F18000006004D656D6F3432000200D00100000C030000EC00
      0000140000000300000001000000000000000000FFFFFF1F2C02000000000001
      001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF00000000
      000200000001000000000500417269616C000A00000000000000000002000000
      CC00020000000000FFFFFF00000000020000000000000000009718000006004D
      656D6F3433000200840000005A0300009C000000140000000300020001000000
      000000000000FFFFFF1F2C02000000000001000900C1F3F5E3E0EBF2E5F00000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      0000000002000000CC00020000000000FFFFFF00000000020000000000000000
      001F19000006004D656D6F3434000200840000006E0300009C00000014000000
      0300000001000000000000000000FFFFFF1F2C02000000000001000900C4EEEB
      E6EDEEF1F2FC00000000FFFF0000000000020000000100000000050041726961
      6C000A00000000000000000002000000CC00020000000000FFFFFF0000000002
      0000000000000000009E19000006004D656D6F34350002002C0100005A030000
      9C000000140000000300020001000000000000000000FFFFFF1F2C0200000000
      000100000000000000FFFF00000000000200000001000000000500417269616C
      000A00000000000000000000000000CC00020000000000FFFFFF000000000200
      0000000000000000241A000006004D656D6F34360002002C0100006E0300009C
      000000140000000300000001000000000000000000FFFFFF1F2C020000000000
      01000700CFEEE4EFE8F1FC00000000FFFF000000000002000000010000000005
      00417269616C000A00000000000000000002000000CC00020000000000FFFFFF
      0000000002000000000000000000B91A000006004D656D6F3437000200D00100
      005A030000EC000000140000000300020001000000000000000000FFFFFF1F2C
      020000000000010016005B6F6473547265624D6F7665504B552E22425548225D
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      00000000000002000000CC00020000000000FFFFFF0000000002000000000000
      0000004B1B000006004D656D6F3438000200D00100006E030000EC0000001400
      00000300000001000000000000000000FFFFFF1F2C02000000000001001300D0
      E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF0000000000020000
      0001000000000500417269616C000A00000000000000000002000000CC000200
      00000000FFFFFF0000000002000000000000000000471C000005004D656D6F31
      000200F801000010000000EC0000007700000003000000010000000000000000
      00FFFFFF1F2C02000000000005000A00D3D2C2C5D0C6C4C0DE3A0D1300C7E0EC
      2E20CDE0F7E0EBFCEDE8EAE020EFEE200D1E00EBE5F7E5E1EDEE2DEEE7E4EEF0
      EEE2E8F2E5EBFCEDEEE920F0E0E1EEF2E50D1400CECECE2022D3F0E5EDE3EEE9
      E3E0E7EFF0EEEC220D23005F5F5F5F5F5F5F5F5F5F5F205B6F6473547265624D
      6F7665504B552E22474C4156225D00000000FFFF000000000002000000010000
      00000500417269616C000C00000000000000000000000000CC00020000000000
      FFFFFF000000000200000000000000FEFEFF020000000A002043617465676F72
      793100000000040073756D6D00010030000000000000000000FC010000000000
      000000000000000000000058000ACF5E302ED2E2405794C395D66DE440}
  end
  object frDBdsTrebMovePKU: TfrDBDataSet
    DataSet = odsTrebMovePKU
    Left = 88
    Top = 192
  end
  object frudsSpirt: TfrUserDataset
    Left = 688
    Top = 120
  end
  object odsTrebSpirt: TOracleDataSet
    SQL.Strings = (
      'select /*+rule*/ rownum,'
      
        'ASU.PKG_SMINI.READSTRING('#39'NACHLOK'#39','#39'FIO'#39','#39#1052#1072#1096#1091#1082#1086#1074' '#1042'.'#1044'.'#39') as nach' +
        ','
      'ASU.PKG_SMINI.READSTRING('#39'GLBUH'#39','#39'FIO'#39','#39'GLBUH\FIO'#39') as buh,'
      'asu.get_glavfio as glav,'
      
        'ASU.PKG_SMINI.READSTRING('#39'MANAGER_DOC'#39','#39'CLIENT_NAME'#39','#39#1051#1054#1050' "'#1042#1080#1090#1103#1079 +
        #1100'"'#39') as lok,'
      '('
      ''
      ''
      'select /*+rule*/ sum(('
      'SELECT   sum(nm.fn_day * nm.fn_perday * nml.colvo) AS fn_kol'
      'FROM     tnazmed nm, tnazmedlech nml, tkarta k'
      ''
      'WHERE    nm.fk_id = nml.naz_id'
      'AND      nm.fl_sam = 0'
      'AND      nm.fp_dezh = 0'
      'AND      nm.fk_moid =:amoid'
      'AND      k.fk_id = nm.fk_pacid'
      '--AND      k.fl_vyb = 0'
      'and      nml.id=nml1.id'
      'AND      nml.docplanid=:adpid'
      'AND      nml.docid=:adpid'
      'and      nml.medic_id=nml1.medic_id'
      ''
      'GROUP BY nml.medic_id'
      'HAVING   SUM (nm.fn_day * nm.fn_perday * nml.colvo) > 0'
      ''
      'union'
      'select 0 from dual'
      'where      not exists'
      
        '       (SELECT   sum(nm.fn_day * nm.fn_perday * nml.colvo) AS fn' +
        '_kol'
      'FROM     tnazmed nm, tnazmedlech nml, tkarta k'
      'WHERE    nm.fk_id = nml.naz_id'
      'AND      nm.fl_sam = 0'
      'AND      nm.fp_dezh = 0'
      'AND      nm.fk_moid =:amoid'
      'AND      k.fk_id = nm.fk_pacid'
      '--AND      k.fl_vyb = 0'
      'AND      nml.docplanid=:adpid'
      'AND      nml.docid=:adpid'
      'and      nml.medic_id=nml1.medic_id'
      ''
      'GROUP BY nml.medic_id'
      'HAVING   SUM (nm.fn_day * nm.fn_perday * nml.colvo) > 0)'
      ''
      ''
      ''
      ')) as fn_kol'
      ''
      'FROM     tnazmed nm1, tnazmedlech nml1, tkarta k1'
      ''
      'WHERE    nm1.fk_id = nml1.naz_id'
      'AND      nm1.fl_sam = 0'
      'AND      nm1.fp_dezh = 0'
      'AND      nm1.fk_moid =:amoid'
      'AND      k1.fk_id = nm1.fk_pacid'
      '--AND      k1.fl_vyb = 0'
      'AND      nml1.docplanid=:adpid'
      'and      nml1.medic_id(+)=tmedic.medicid'
      'group by nml1.medic_id'
      ''
      ''
      ''
      ''
      
        ') as koltreb,tmedic.fc_name as namemedic,tdpc.fn_kol,tdpc.fn_sum' +
        'm,tei.fc_name as einame'
      ' from tdpc,tkart,tmedic,tei'
      'where tdpc.dpid=:adpid'
      'and tdpc.kartid=tkart.kartid'
      'and tmedic.medicid=tkart.medicid'
      'and tei.eiid=tmedic.eiid'
      'order by namemedic'
      '')
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A41445049440300000000000000000000000600
      00003A414D4F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A00000006000000524F574E554D010000000000090000004E414D45
      4D4544494301000000000006000000464E5F4B4F4C0100000000000600000045
      494E414D45010000000000070000004B4F4C5452454201000000000007000000
      464E5F53554D4D010000000000040000004E4143480100000000000300000042
      554801000000000004000000474C4156010000000000030000004C4F4B010000
      000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 8
    Top = 72
    object odsTrebSpirtROWNUM: TFloatField
      FieldName = 'ROWNUM'
    end
    object odsTrebSpirtNACH: TStringField
      FieldName = 'NACH'
      Size = 4000
    end
    object odsTrebSpirtBUH: TStringField
      FieldName = 'BUH'
      Size = 4000
    end
    object odsTrebSpirtGLAV: TStringField
      FieldName = 'GLAV'
      Size = 4000
    end
    object odsTrebSpirtLOK: TStringField
      FieldName = 'LOK'
      Size = 4000
    end
    object odsTrebSpirtKOLTREB: TFloatField
      FieldName = 'KOLTREB'
    end
    object odsTrebSpirtNAMEMEDIC: TStringField
      FieldName = 'NAMEMEDIC'
      Required = True
      Size = 255
    end
    object odsTrebSpirtFN_KOL: TFloatField
      FieldName = 'FN_KOL'
    end
    object odsTrebSpirtFN_SUMM: TFloatField
      FieldName = 'FN_SUMM'
    end
    object odsTrebSpirtEINAME: TStringField
      FieldName = 'EINAME'
      Required = True
      Size = 10
    end
  end
  object frDBspirt: TfrDBDataSet
    DataSet = odsTrebSpirt
    Left = 102
    Top = 40
  end
  object frTrebSpirt: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 648
    Top = 88
    ReportForm = {
      1900000054100000190000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF0000000000000100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000030000000F60200005E0100003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E48656164657231000201000000004C020000F60200002000000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0000DD01000005004D656D6F320002008000000018010000B80100001C000000
      0300000001000000000000000000FFFFFF1F2C02000000000001002700D2F0E5
      E1EEE2E0EDE8E520EDE020EEF2EFF3F1EA20F1EFE8F0F2E020E220E0EFF2E5EA
      F320B92000000000FFFF00000000000200000001000000000500417269616C00
      1000000002000000000000000000CC00020000000000FFFFFF00000000020000
      000000000000006602000005004D656D6F33000200140100004C010000DC0000
      00140000000300000001000000000000000000FFFFFF1F2C0003020000000100
      0B00CEF220205B444154455D2000000000FFFF00000000000200000001000000
      000500417269616C000C00000004000000000002000000CC00020000000000FF
      FFFF00000000020000000000000000000703000005004D656D6F370002001400
      00004C0200001C0000002000000003000F0001000000000000000000FFFFFF1F
      2C02000000000002000200B9200D0400EF2EEF2E0003000500626567696E0D0A
      00202073756D6D3A3D303B0D0300656E6400FFFF000000000002000000010000
      00000500417269616C000A0000000000000000000A000000CC00020000000000
      FFFFFF00000000020000000000000000009103000005004D656D6F3800020030
      0000004C020000D60000002000000003000F0001000000000000000000FFFFFF
      1F2C02000000000001000C00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000A00
      0000CC00020000000000FFFFFF00000000020000000000000000001704000005
      004D656D6F39000200060100004C0200004C0000002000000003000F00010000
      00000000000000FFFFFF1F2C02000000000001000800C5E42E20C8E7EC2E0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      00A004000006004D656D6F3130000200520100004C020000D200000010000000
      03000F0001000000000000000000FFFFFF1F2C02000000000001000A00CAEEEB
      E8F7E5F1F2E2EE00000000FFFF00000000000200000001000000000500417269
      616C000A0000000000000000000A000000CC00020000000000FFFFFF00000000
      020000000000000000002305000006004D656D6F3133000200240200004C0200
      00600000002000000003000F0001000000000000000000FFFFFF1F2C02000000
      000001000400D6E5EDE000000000FFFF00000000000200000001000000000500
      417269616C000A0000000000000000000A000000CC00020000000000FFFFFF00
      00000002000000000000000000A705000006004D656D6F313400020084020000
      4C020000580000002000000003000F0001000000000000000000FFFFFF1F2C02
      000000000001000500D1F3ECECE000000000FFFF000000000002000000010000
      00000500417269616C000A0000000000000000000A000000CC00020000000000
      FFFFFF00000000020000000000000000002606000006004D656D6F3135000200
      140000006C0200001C0000001800000003000F0001000000000000000000FFFF
      FF1F2C0200000000000100000000000000FFFF00000000000200000001000000
      000500417269616C000A0000000000000000000A000000CC00020000000000FF
      FFFF0000000002000000000000000000CC06000006004D656D6F313600020030
      0000006C020000D60000001800000003000F0001000000000000000000FFFFFF
      1F2C02000000000001001D0053706972697475732061657468796C6963757320
      373025203130302C3000000000FFFF00000000000200000001000000000F0054
      696D6573204E657720526F6D616E000C00000000000000000008000000CC0002
      0000000000FFFFFF00000000020000000000000000004D07000006004D656D6F
      3137000200060100006C0200004C0000001800000003000F0001000000000000
      000000FFFFFF1F2C02000000000001000200F4EB00000000FFFF000000000002
      00000001000000000500417269616C000A0000000000000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000CC07000006004D656D
      6F3230000200C00100006C020000640000001800000003000F00010000000000
      00000000FFFFFF1F2C0200000000000100000000000000FFFF00000000000200
      000001000000000500417269616C000A0000000000000000000A000000CC0002
      0000000000FFFFFF00000000020000000000000000004B08000006004D656D6F
      3231000200240200006C020000600000001800000003000F0001000000000000
      000000FFFFFF1F2C0200000000000100000000000000FFFF0000000000020000
      0001000000000500417269616C000A0000000000000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000C808000006004D656D6F32
      32000200840200006C020000580000001800000003000F000100000000000000
      0000FFFFFF1F2C020000000000000000000000FFFF0000000000020000000100
      0000000500417269616C000A0000000000000000000A000000CC000200000000
      00FFFFFF00000000020000000000000000005209000006004D656D6F32360002
      003602000016010000E80000001C0000000300000001000000000000000000FF
      FFFF1F2C0200000000000100030033393500000000FFFF000000000002000000
      01000000000D004D532053616E73205365726966001000000002000000000008
      000000CC00020000000000FFFFFF0000000002000000000000000000E4090000
      06004D656D6F3131000200520100005C0200006E0000001000000003000F0001
      000000000000000000FFFFFF1F2C02000000000001000900D2F0E5E1F3E5ECEE
      E500000000FFFF00000000000200000001000000000F0054696D6573204E6577
      20526F6D616E000C0000000000000000000A000000CC00020000000000FFFFFF
      0000000002000000000000000000750A000006004D656D6F3132000200C00100
      005C020000640000001000000003000F0001000000000000000000FFFFFF1F2C
      02000000000001000800CEF2EFF3F9E5EDEE00000000FFFF0000000000020000
      0001000000000F0054696D6573204E657720526F6D616E000C00000000000000
      00000A000000CC00020000000000FFFFFF0000000002000000000000000000F4
      0A000006004D656D6F3139000200520100006C0200006E000000180000000300
      0F0001000000000000000000FFFFFF1F2C0200000000000100000000000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      000A000000CC00020000000000FFFFFF0000000002000000000000000000D20B
      000006004D656D6F3237000200D4000000C00100000C0200002C000000030000
      0001000000000000000000FFFFFF1F2C0200000000000100550020C4EBFF20E2
      2FE22C20E22FEC2C20EF2FEA20E8EDFAE5EAF6E8E92C20EFEEF1F2E0EDEEE2EA
      E820E1E0EDEEEA2C20EAEEECEFF0E5F1F1EEE22C20EEE1F0E0E1EEF2EAE820EA
      EEE6EDFBF520EFEEEAF0EEE2EEE22E00000000FFFF0000000000020000000100
      0000000F0054696D6573204E657720526F6D616E000E00000001000000000008
      000000CC00020000000000FFFFFF0000000002000000000000000000580C0000
      05004D656D6F3400020054000000D80200007000000018000000030000000100
      0000000000000000FFFFFF1F2C02000000000001000800C3EB2E20C2F0E0F700
      000000FFFF00000000000200000001000000000500417269616C000C00000000
      000000000008000000CC00020000000000FFFFFF000000000200000000000000
      0000EB0C000005004D656D6F35000200B8010000D8020000C40000001C000000
      0300000001000000000000000000FFFFFF1F2C020000000000010015005B6F64
      735472656253706972742E22474C4156225D00000000FFFF0000000000020000
      0001000000000500417269616C000C00000000000000000009000000CC000200
      00000000FFFFFF0000000002000000000000000000760D000005004D656D6F36
      0002005400000020030000700000001800000003000000010000000000000000
      00FFFFFF1F2C02000000000001000D00C3EB2E20C1F3F5E3E0EBF2E5F0000000
      00FFFF00000000000200000001000000000500417269616C000C000000000000
      00000008000000CC00020000000000FFFFFF0000000002000000000000000000
      090E000006004D656D6F3138000200B801000020030000C40000001C00000003
      00000001000000000000000000FFFFFF1F2C020000000000010014005B6F6473
      5472656253706972742E22425548225D00000000FFFF00000000000200000001
      000000000500417269616C000C00000000000000000009000000CC0002000000
      0000FFFFFF0000000002000000000000000000E40E000006004D656D6F343500
      0200080200006C000000D0000000530000000300000001000000000000000000
      FFFFFF1F2C02000000000005001E00CDE0F7E0EBFCEDE8EA205B6F6473547265
      6253706972742E224C4F4B225D0D1400CECECE2022D3F0E5EDE3EEE9E3E0E7EF
      F0EEEC220D00000D1E005F5F5F5F5F5F5F5F5F5B6F6473547265625370697274
      2E224E414348225D0D000000000000FFFF000000000002000000010000000005
      00417269616C000C00000000000000000000000000CC00020000000000FFFFFF
      0000000002000000000000000000750F000006004D656D6F3730000200080200
      00C2000000D0000000160000000300000001000000000000000000FFFFFF1F2C
      0003020C00646420206D6F20207979797900010006005B444154455D00000000
      FFFF00000000000200000001000000000500417269616C000C00000000000000
      000002000000CC00020000000000FFFFFF000000000200000000000000000006
      10000006004D656D6F36350002000802000058000000BC000000140000000300
      000001000000000000000000FFFFFF1F2C02000000000001001200D320D220C2
      20C520D020C620C420C020DE3A00000000FFFF00000000000200000001000000
      000500417269616C000C00000002000000000000000000CC00020000000000FF
      FFFF000000000200000000000000FEFEFF020000000A002043617465676F7279
      3100000000040073756D6D00010030000000000000000000FC01000000000000
      0000000000000000000058000ACF5E302ED2E2408D9AC395D66DE440}
  end
  object frZapMash: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 648
    Top = 152
    ReportForm = {
      19000000EF110000190000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF0000000000000100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000018000000F6020000540100003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E486561646572310002010000000078010000F60200001400000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200AC0100000B004D6173746572446174613100020100000000B4010000F602
      0000140000003000050001000000000000000000FFFFFF1F0000000009006672
      444264735A617000000000000000FFFF00000000000200000001000000000000
      0001000000C800000014000000010000000000000200190200000D004D617374
      6572466F6F7465723100020100000000FC010000F60200005A00000030000600
      01000000000000000000FFFFFF1F00000000000000000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      000000EF02000005004D656D6F31000200E401000048000000D4000000400000
      000300000001000000000000000000FFFFFF1F2C02000000000003001900CDE0
      F7E0EBFCEDE8EAF3205B6F64735A61702E224C4F4B225D0D1400CECECE2022D3
      F0E5EDE3EEE9E3E0E7EFF0EEEC220D1B0020202020202020202020205B6F6473
      5A61702E224E41434852225D00000000FFFF0000000000020000000100000000
      0F0054696D6573204E657720526F6D616E000C00000000000000000000000000
      CC00020000000000FFFFFF0000000002000000000000000000C403000005004D
      656D6F32000200240000004C000000CC0000003C000000030000000100000000
      0000000000FFFFFF1F2C02000000000003001800CDE0F7E0EBFCEDE8EA205B6F
      64735A61702E224C4F4B225D0D1400CECECE2022D3F0E5EDE3EEE9E3E0E7EFF0
      EEEC220D1B005F5F5F5F5F5F5F5F5F5F5F205B6F64735A61702E224E41434822
      5D00000000FFFF00000000000200000001000000000F0054696D6573204E6577
      20526F6D616E000C00000000000000000000000000CC00020000000000FFFFFF
      00000000020000000000000000005D04000005004D656D6F34000200F8000000
      F800000000010000180000000300000001000000000000000000FFFFFF1F2C02
      000000000001001100D1CBD3C6C5C1CDC0DF20C7C0CFC8D1CAC000000000FFFF
      00000000000200000001000000000F0054696D6573204E657720526F6D616E00
      0E00000002000000000002000000CC00020000000000FFFFFF00000000020000
      00000000000000EB04000005004D656D6F360002001800000078010000380000
      001400000003000F0001000000000000000000FFFFFF1F2C0200000000000100
      0600B920EF2EEF2E00000000FFFF00000000000200000001000000000F005469
      6D6573204E657720526F6D616E000C00000000000000000000000000CC000200
      00000000FFFFFF00000000020000000000000000007F05000005004D656D6F37
      0002005000000078010000500100001400000003000F00010000000000000000
      00FFFFFF1F2C02000000000001000C00CDE0E8ECE5EDEEE2E0EDE8E500000000
      FFFF00000000000200000001000000000F0054696D6573204E657720526F6D61
      6E000C00000000000000000002000000CC00020000000000FFFFFF0000000002
      0000000000000000000F06000005004D656D6F38000200A001000078010000A4
      0000001400000003000F0001000000000000000000FFFFFF1F2C020000000000
      01000800C5E42E20E8E7EC2E00000000FFFF0000000000020000000100000000
      0F0054696D6573204E657720526F6D616E000C00000000000000000002000000
      CC00020000000000FFFFFF0000000002000000000000000000A106000005004D
      656D6F390002004402000078010000980000001400000003000F000100000000
      0000000000FFFFFF1F2C02000000000001000A00CAEEEBE8F7E5F1F2E2EE0000
      0000FFFF00000000000200000001000000000F0054696D6573204E657720526F
      6D616E000C00000000000000000002000000CC00020000000000FFFFFF000000
      00020000000000000000003407000006004D656D6F313000020018000000B401
      0000380000001400000003000F0001000000000000000000FFFFFF1F2C020000
      00000001000A005B43555252454E54235D00000000FFFF000000000002000000
      01000000000F0054696D6573204E657720526F6D616E000C0000000000000000
      0002000000CC00020000000000FFFFFF0000000002000000000000000000D107
      000006004D656D6F313100020050000000B4010000500100001400000003000F
      0001000000000000000000FFFFFF1F2C020000000000010014005B6F64735A61
      702E224D454449434E414D45225D00000000FFFF000000000002000000010000
      00000F0054696D6573204E657720526F6D616E000C0000000000000000000000
      0000CC00020000000000FFFFFF00000000020000000000000000006B08000006
      004D656D6F3132000200A0010000B4010000A40000001400000003000F000100
      0000000000000000FFFFFF1F2C020000000000010011005B6F64735A61702E22
      45494E414D45225D00000000FFFF00000000000200000001000000000F005469
      6D6573204E657720526F6D616E000C00000000000000000002000000CC000200
      00000000FFFFFF00000000020000000000000000000209000006004D656D6F31
      3300020044020000B4010000980000001400000003000F000100000000000000
      0000FFFFFF1F2C02000000000001000E005B6F64735A61702E224B4F4C225D00
      000000FFFF00000000000200000001000000000F0054696D6573204E65772052
      6F6D616E000C00000000000000000002000000CC00020000000000FFFFFF0000
      000002000000000000000000AA09000006004D656D6F31340002001C00000018
      02000004010000140000000300000001000000000000000000FFFFFF1F2C0200
      0000000001001F00CCE0F2E5F0E8E0EBFCEDEE20EEF2E2E5F2F1F2E2E5EDEDEE
      E520EBE8F6EE3A00000000FFFF00000000000200000001000000000F0054696D
      6573204E657720526F6D616E000C00000000000000000000000000CC00020000
      000000FFFFFF00000000020000000000000000004D0A000006004D656D6F3137
      000200B401000018020000100100001400000003000000010000000000000000
      00FFFFFF1F2C02000000000001001A005F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
      2028EFEEE4EFE8F1FC2900000000FFFF00000000000200000001000000000F00
      54696D6573204E657720526F6D616E000C00000000000000000000000000CC00
      020000000000FFFFFF0000000002000000000000000000130B000005004D656D
      6F350002002A000000180100009C020000180000000300000001000000000000
      000000FFFFFF1F2C02000000000002003B00CFF0EEF8F320C2E0F8E5E3EE20F0
      E0E7F0E5F8E5EDE8FF20EDE020EEF2EFF3F1EA2028E2EDF3F2F0E5EDEDE5E520
      EFE5F0E5ECE5F9E5EDE8E529200D000000000000FFFF00000000000200000001
      000000000F0054696D6573204E657720526F6D616E000C000000000000000000
      02000000CC00020000000000FFFFFF0000000002000000000000000000BC0B00
      0006004D656D6F313900020066010000340100002C0100001400000003000000
      01000000000000000000FFFFFF1F2C02000000000001002A00EDE8E6E520EFE5
      F0E5F7E8F1EBE5EDEDFBF520ECE0F2E5F0E8E0EBFCEDFBF520F6E5EDEDEEF1F2
      E5E93A00000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000002000000CC00020000000000FFFFFF0000000002000000
      000000000000440C000006004D656D6F3230000200A600000034010000600000
      00140000000300000001000000000000000000FFFFFF1F2C0200000000000100
      0900CFF0EEE2E8E7EEF0E000000000FFFF000000000002000000010000000005
      00417269616C000A00000007000000000002000000CC00020000000000FFFFFF
      0000000002000000000000000000D20C000006004D656D6F3231000200FA0000
      003401000070000000140000000300000001000000000000000000FFFFFF1F2C
      02000000000001000F005B6F64735A61702E2250524F56225D00000000FFFF00
      000000000200000001000000000500417269616C000A00000007000000000002
      000000CC00020000000000FFFFFF00000000020000000000000000005D0D0000
      06004D656D6F32320002005E0000003401000054000000140000000300000001
      000000000000000000FFFFFF1F2C02000000000001000C00F120EFEEE4EEF2F7
      E5F2E02000000000FFFF00000000000200000001000000000500417269616C00
      0A00000000000000000002000000CC00020000000000FFFFFF00000000020000
      00000000000000EE0D000006004D656D6F32330002002000000088000000D000
      0000140000000300000001000000000000000000FFFFFF1F2C0003020C006464
      20206D6F20207979797900010006005B444154455D00000000FFFF0000000000
      0200000001000000000500417269616C000C00000000000000000002000000CC
      00020000000000FFFFFF00000000020000000000000000007E0E000005004D65
      6D6F330002002400000038020000D00000001400000003000000010000000000
      00000000FFFFFF1F2C0003020C00646420206D6F20207979797900010006005B
      444154455D00000000FFFF00000000000200000001000000000500417269616C
      000C00000000000000000002000000CC00020000000000FFFFFF000000000200
      00000000000000000F0F000006004D656D6F3730000200E0010000D0000000D4
      000000140000000300000001000000000000000000FFFFFF1F2C0003020C0064
      6420206D6F20207979797900010006005B444154455D00000000FFFF00000000
      000200000001000000000500417269616C000C00000000000000000002000000
      CC00020000000000FFFFFF0000000002000000000000000000910F000006004D
      656D6F3135000200E00100008000000018000000140000000300000001000000
      000000000000FFFFFF1F2C02000000000001000300CEF22000000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000000
      0000CC00020000000000FFFFFF00000000020000000000000000001E10000006
      004D656D6F3136000200FC01000080000000B800000014000000030002000100
      0000000000000000FFFFFF1F2C02000000000001000E005B6F64735A61702E22
      444F4C225D00000000FFFF00000000000200000001000000000500417269616C
      000A00000000000000000002000000CC00020000000000FFFFFF000000000200
      0000000000000000A810000006004D656D6F3235000200E001000094000000D4
      000000140000000300000001000000000000000000FFFFFF1F2C020000000000
      01000B0028E4EEEBE6EDEEF1F2FC2900000000FFFF0000000000020000000100
      0000000500417269616C000A00000000000000000002000000CC000200000000
      00FFFFFF00000000020000000000000000003511000006004D656D6F32360002
      00E0010000A8000000D4000000140000000300020001000000000000000000FF
      FFFF1F2C02000000000001000E005B6F64735A61702E2246494F225D00000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      000002000000CC00020000000000FFFFFF0000000002000000000000000000BC
      11000006004D656D6F3237000200E0010000BC000000D4000000140000000300
      000001000000000000000000FFFFFF1F2C0200000000000100080028D42EC82E
      CE2E2900000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000002000000CC00020000000000FFFFFF0000000002000000
      00000000FEFEFF000000000000000000000000FC010000000000000000000000
      000000000058000ACF5E302ED2E2408D9AC395D66DE440}
  end
  object frDesigner1: TfrDesigner
    Left = 688
    Top = 88
  end
  object frTrebSpirt90: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 648
    Top = 120
    ReportForm = {
      1900000035100000190000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF0000000000000100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000030000000F60200003A0100003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E4865616465723100020100000000D4010000F60200002000000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0000DD01000005004D656D6F3200020084000000F8000000B80100001C000000
      0300000001000000000000000000FFFFFF1F2C02000000000001002700D2F0E5
      E1EEE2E0EDE8E520EDE020EEF2EFF3F1EA20F1EFE8F0F2E020E220E0EFF2E5EA
      F320B92000000000FFFF00000000000200000001000000000500417269616C00
      1000000002000000000000000000CC00020000000000FFFFFF00000000020000
      000000000000006502000005004D656D6F33000200180100001C010000DC0000
      00140000000300000001000000000000000000FFFFFF1F2C0003020000000100
      0A00CEF220205B444154455D00000000FFFF0000000000020000000100000000
      0500417269616C000C00000004000000000002000000CC00020000000000FFFF
      FF00000000020000000000000000000603000005004D656D6F37000200140000
      00D40100001C0000002000000003000F0001000000000000000000FFFFFF1F2C
      02000000000002000200B9200D0400EF2EEF2E0003000500626567696E0D0A00
      202073756D6D3A3D303B0D0300656E6400FFFF00000000000200000001000000
      000500417269616C000A0000000000000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000009003000005004D656D6F380002003000
      0000D4010000D60000002000000003000F0001000000000000000000FFFFFF1F
      2C02000000000001000C00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF000000
      00000200000001000000000500417269616C000A0000000000000000000A0000
      00CC00020000000000FFFFFF0000000002000000000000000000160400000500
      4D656D6F3900020006010000D40100004C0000002000000003000F0001000000
      000000000000FFFFFF1F2C02000000000001000800C5E42E20C8E7EC2E000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      9F04000006004D656D6F313000020052010000D4010000D20000001000000003
      000F0001000000000000000000FFFFFF1F2C02000000000001000A00CAEEEBE8
      F7E5F1F2E2EE00000000FFFF0000000000020000000100000000050041726961
      6C000A0000000000000000000A000000CC00020000000000FFFFFF0000000002
      0000000000000000002205000006004D656D6F313300020024020000D4010000
      600000002000000003000F0001000000000000000000FFFFFF1F2C0200000000
      0001000400D6E5EDE000000000FFFF0000000000020000000100000000050041
      7269616C000A0000000000000000000A000000CC00020000000000FFFFFF0000
      000002000000000000000000A605000006004D656D6F313400020084020000D4
      010000580000002000000003000F0001000000000000000000FFFFFF1F2C0200
      0000000001000500D1F3ECECE000000000FFFF00000000000200000001000000
      000500417269616C000A0000000000000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000002506000006004D656D6F313500020014
      000000F40100001C0000001800000003000F0001000000000000000000FFFFFF
      1F2C0200000000000100000000000000FFFF0000000000020000000100000000
      0500417269616C000A0000000000000000000A000000CC00020000000000FFFF
      FF0000000002000000000000000000CB06000006004D656D6F31360002003000
      0000F4010000D60000001800000003000F0001000000000000000000FFFFFF1F
      2C02000000000001001D0053706972697475732061657468796C696375732039
      3525203130302C3000000000FFFF00000000000200000001000000000F005469
      6D6573204E657720526F6D616E000C00000000000000000008000000CC000200
      00000000FFFFFF00000000020000000000000000004C07000006004D656D6F31
      3700020006010000F40100004C0000001800000003000F000100000000000000
      0000FFFFFF1F2C02000000000001000200F4EB00000000FFFF00000000000200
      000001000000000500417269616C000A0000000000000000000A000000CC0002
      0000000000FFFFFF0000000002000000000000000000CB07000006004D656D6F
      3230000200C0010000F4010000640000001800000003000F0001000000000000
      000000FFFFFF1F2C0200000000000100000000000000FFFF0000000000020000
      0001000000000500417269616C000A0000000000000000000A000000CC000200
      00000000FFFFFF00000000020000000000000000004A08000006004D656D6F32
      3100020024020000F4010000600000001800000003000F000100000000000000
      0000FFFFFF1F2C0200000000000100000000000000FFFF000000000002000000
      01000000000500417269616C000A0000000000000000000A000000CC00020000
      000000FFFFFF0000000002000000000000000000C708000006004D656D6F3232
      00020084020000F4010000580000001800000003000F00010000000000000000
      00FFFFFF1F2C020000000000000000000000FFFF000000000002000000010000
      00000500417269616C000A0000000000000000000A000000CC00020000000000
      FFFFFF00000000020000000000000000005109000006004D656D6F3236000200
      3E020000F6000000E80000001C0000000300000001000000000000000000FFFF
      FF1F2C0200000000000100030033393500000000FFFF00000000000200000001
      000000000D004D532053616E7320536572696600100000000200000000000800
      0000CC00020000000000FFFFFF0000000002000000000000000000E309000006
      004D656D6F313100020052010000E40100006E0000001000000003000F000100
      0000000000000000FFFFFF1F2C02000000000001000900D2F0E5E1F3E5ECEEE5
      00000000FFFF00000000000200000001000000000F0054696D6573204E657720
      526F6D616E000C0000000000000000000A000000CC00020000000000FFFFFF00
      00000002000000000000000000740A000006004D656D6F3132000200C0010000
      E4010000640000001000000003000F0001000000000000000000FFFFFF1F2C02
      000000000001000800CEF2EFF3F9E5EDEE00000000FFFF000000000002000000
      01000000000F0054696D6573204E657720526F6D616E000C0000000000000000
      000A000000CC00020000000000FFFFFF0000000002000000000000000000F30A
      000006004D656D6F313900020052010000F40100006E0000001800000003000F
      0001000000000000000000FFFFFF1F2C0200000000000100000000000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000B00B00
      0006004D656D6F3237000200CC000000940100000C0200002C00000003000000
      01000000000000000000FFFFFF1F2C020000000000010034002020C4EBFF20E0
      EDE0EBE8E7EEE220EAEBE8EDE8EAEE202D20E4E8E0E3EDEEF1F2E8F7E5F1EAEE
      E920EBE0E1EEF0E0F2EEF0E8E800000000FFFF00000000000200000001000000
      000F0054696D6573204E657720526F6D616E000E000000010000000000080000
      00CC00020000000000FFFFFF0000000002000000000000000000360C00000500
      4D656D6F34000200540000006002000070000000180000000300000001000000
      000000000000FFFFFF1F2C02000000000001000800C3EB2E20C2F0E0F7000000
      00FFFF00000000000200000001000000000500417269616C000C000000000000
      00000008000000CC00020000000000FFFFFF0000000002000000000000000000
      C90C000005004D656D6F35000200B801000060020000C40000001C0000000300
      000001000000000000000000FFFFFF1F2C020000000000010015005B6F647354
      72656253706972742E22474C4156225D00000000FFFF00000000000200000001
      000000000500417269616C000C00000000000000000009000000CC0002000000
      0000FFFFFF0000000002000000000000000000570D000005004D656D6F360002
      0054000000B002000098000000180000000300000001000000000000000000FF
      FFFF1F2C02000000000001001000D0F3EAEEE2EEE4E8F2E5EBFC20D3CAC30000
      0000FFFF00000000000200000001000000000500417269616C000C0000000000
      0000000008000000CC00020000000000FFFFFF00000000020000000000000000
      00EA0D000006004D656D6F3138000200B8010000B0020000C40000001C000000
      0300000001000000000000000000FFFFFF1F2C020000000000010014005B6F64
      735472656253706972742E22425548225D00000000FFFF000000000002000000
      01000000000500417269616C000C00000000000000000009000000CC00020000
      000000FFFFFF0000000002000000000000000000C50E000006004D656D6F3435
      000200140200006C000000D40000004A00000003000000010000000000000000
      00FFFFFF1F2C02000000000005001E00CDE0F7E0EBFCEDE8EA205B6F64735472
      656253706972742E224C4F4B225D0D1400CECECE2022D3F0E5EDE3EEE9E3E0E7
      EFF0EEEC220D00000D1E005F5F5F5F5F5F5F5F5F5B6F64735472656253706972
      742E224E414348225D0D000000000000FFFF0000000000020000000100000000
      0500417269616C000C00000000000000000000000000CC00020000000000FFFF
      FF0000000002000000000000000000560F000006004D656D6F37300002001402
      0000B8000000D4000000140000000300000001000000000000000000FFFFFF1F
      2C0003020C00646420206D6F20207979797900010006005B444154455D000000
      00FFFF00000000000200000001000000000500417269616C000C000000000000
      00000002000000CC00020000000000FFFFFF0000000002000000000000000000
      E70F000006004D656D6F36350002001402000058000000BC0000001400000003
      00000001000000000000000000FFFFFF1F2C02000000000001001200D320D220
      C220C520D020C620C420C020DE3A00000000FFFF000000000002000000010000
      00000500417269616C000C00000002000000000000000000CC00020000000000
      FFFFFF000000000200000000000000FEFEFF020000000A002043617465676F72
      793100000000040073756D6D00010030000000000000000000FC010000000000
      000000000000000000000058000ACF5E302ED2E2408D9AC395D66DE440}
  end
  object frTreb: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 648
    Top = 216
    ReportForm = {
      190000009F1A0000190000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF0000000000000100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000004000000F6020000340100003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E48656164657231000201000000004F010000F60200002000000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200B00100000B004D617374657244617461310002010000000087010000F602
      0000100000003100050001000000000000000000FFFFFF1F000000000D006672
      444264735472656252657000000000000000FFFF000000000002000000010000
      000000000001000000C8000000140000000100000000000002001D0200000D00
      4D6173746572466F6F7465723100020100000000B8010000F6020000B2000000
      3000060001000000000000000000FFFFFF1F00000000000000000000000000FF
      FF000000000002000000010000000000000001000000C8000000140000000100
      000000000000001503000005004D656D6F31000200E801000018000000F00000
      00700000000300000001000000000000000000FFFFFF1F2C0200000000000500
      0A00D3D2C2C5D0C6C4C0DE3A0D1300C7E0EC2E20CDE0F7E0EBFCEDE8EAE020EF
      EE200D1E00EBE5F7E5E1EDEE2DEEE7E4EEF0EEE2E8F2E5EBFCEDEEE920F0E0E1
      EEF2E50D1400CECECE2022D3F0E5EDE3EEE9E3E0E7EFF0EEEC220D1F005F5F5F
      5F5F5F5F5F5F5F5F205B6F6473547265625265702E22474C4156225D00000000
      FFFF00000000000200000001000000000500417269616C000C00000000000000
      000000000000CC00020000000000FFFFFF0000000002000000000000000000A6
      03000006004D656D6F3730000200E801000088000000F0000000140000000300
      000001000000000000000000FFFFFF1F2C0003020C00646420206D6F20207979
      797900010006005B444154455D00000000FFFF00000000000200000001000000
      000500417269616C000C00000000000000000002000000CC00020000000000FF
      FFFF00000000020000000000000000007104000005004D656D6F320002009200
      0000A8000000CC0100001C0000000300000001000000000000000000FFFFFF1F
      2C02000000000001002E00D2F0E5E1EEE2E0EDE8E520E220E0EFF2E5EAF320B9
      205B6F647353656C446F634D6F76652E2246435F444F43225D00040005006265
      67696E0D0B0020202073756D6D3A3D303B0D0100200D0300656E6400FFFF0000
      0000000200000001000000000500417269616C00100000000200000000000200
      0000CC00020000000000FFFFFF00000000020000000000000000000905000005
      004D656D6F330002000A010000CC000000DC0000001400000003000000010000
      00000000000000FFFFFF1F2C00030200000001001A00CEF2205B6F647353656C
      446F634D6F76652E2244415441225D2000000000FFFF00000000000200000001
      000000000500417269616C000C00000004000000000002000000CC0002000000
      0000FFFFFF00000000020000000000000000009905000005004D656D6F340002
      001C0000000401000058000000280000000300000001000000000000000000FF
      FFFF1F2C02000000000002000400C4EBFF3A0D0B00D7E5F0E5E720EAEEE3EE3A
      00000000FFFF00000000000200000001000000000500417269616C000C000000
      00000000000000000000CC00020000000000FFFFFF0000000002000000000000
      0000002F06000005004D656D6F350002007800000000010000C0000000140000
      000300000001000000000000000000FFFFFF1F2C020000000000010018005B6F
      647353656C446F634D6F76652E224E414D45544F225D00000000FFFF00000000
      000200000001000000000500417269616C000C00000004000000000000000000
      CC00020000000000FFFFFF0000000002000000000000000000C906000005004D
      656D6F3600020074000000140100002402000014000000030000000100000000
      0000000000FFFFFF1F2C02000000000001001C005B6F647353656C446F634D6F
      76652E2246435F434F4D4D454E54225D00000000FFFF00000000000200000001
      000000000500417269616C000C00000004000000000000000000CC0002000000
      0000FFFFFF00000000020000000000000000005307000005004D656D6F380002
      001C0000004F010000D80000002000000003000F0001000000000000000000FF
      FFFF1F2C02000000000001000C00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000D90700
      0005004D656D6F39000200F40000004F0100004C0000002000000003000F0001
      000000000000000000FFFFFF1F2C02000000000001000800C5E42E20C8E7EC2E
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      0000006208000006004D656D6F3130000200400100004F010000D00000001000
      000003000F0001000000000000000000FFFFFF1F2C02000000000001000A00CA
      EEEBE8F7E5F1F2E2EE00000000FFFF0000000000020000000100000000050041
      7269616C000A0000000000000000000A000000CC00020000000000FFFFFF0000
      000002000000000000000000EA08000006004D656D6F3131000200400100005F
      0100006C0000001000000003000F0001000000000000000000FFFFFF1F2C0200
      0000000001000900D2F0E5E1F3E5ECEEE500000000FFFF000000000002000000
      01000000000500417269616C000A0000000000000000000A000000CC00020000
      000000FFFFFF00000000020000000000000000007109000006004D656D6F3132
      000200AC0100005F010000640000001000000003000F00010000000000000000
      00FFFFFF1F2C02000000000001000800CEF2EFF3F9E5EDEE00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000A00
      0000CC00020000000000FFFFFF0000000002000000000000000000F409000006
      004D656D6F3133000200100200004F010000600000002000000003000F000100
      0000000000000000FFFFFF1F2C02000000000001000400D6E5EDE000000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      000A000000CC00020000000000FFFFFF0000000002000000000000000000780A
      000006004D656D6F3134000200700200004F010000580000002000000003000F
      0001000000000000000000FFFFFF1F2C02000000000001000500D1F3ECECE000
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      00000C0B000006004D656D6F3137000200F4000000870100004C000000100000
      0003000F0001000000000000000000FFFFFF1F2C020000000000010015005B6F
      6473547265625265702E2245494E414D45225D00000000FFFF00000000000200
      000001000000000500417269616C000A0000000000000000000A000000CC0002
      0000000000FFFFFF0000000002000000000000000000A00B000006004D656D6F
      313900020040010000870100006C0000001000000003000F0001000000000000
      000000FFFFFF1F2C020000000000010015005B6F6473547265625265702E2246
      4E5F4B4F4C225D00000000FFFF00000000000200000001000000000500417269
      616C000A0000000000000000000A000000CC00020000000000FFFFFF00000000
      02000000000000000000340C000006004D656D6F3230000200AC010000870100
      00640000001000000003000F0001000000000000000000FFFFFF1F2C02000000
      0000010015005B6F6473547265625265702E22464E5F4B4F4C225D00000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      000A000000CC00020000000000FFFFFF0000000002000000000000000000E10C
      000006004D656D6F32310002001002000087010000600000001000000003000F
      0001000000000000000000FFFFFF1F2C02000000000001002E005B464F524D41
      54464C4F4154282730F02E3030EA2E272C205B6F6473547265625265702E2270
      72696365225D295D00000000FFFF000000000002000000010000000005004172
      69616C000A0000000000000000000A000000CC00020000000000FFFFFF000000
      0002000000000000000000C40D000006004D656D6F3232000200700200008701
      0000580000001000000003000F0001000000000000000000FFFFFF1F2C020000
      000000010030005B464F524D4154464C4F4154282730F02E3030EA2E272C205B
      6F6473547265625265702E22464E5F73756D6D225D295D000300050062656769
      6E0D2400202073756D6D3A3D73756D6D2B5B6F6473547265625265702E22464E
      5F73756D6D225D3B0D0300656E6400FFFF000000000002000000010000000005
      00417269616C000A0000000000000000000A000000CC00020000000000FFFFFF
      00000000020000000000000000005B0E000006004D656D6F32380002001C0000
      0087010000D80000001000000007000F0001000000000000000000FFFFFF1F2C
      020000000000010018005B6F6473547265625265702E224E414D454D45444943
      225D00000000FFFF00000000000200000001000000000500417269616C000800
      000000000000000008000000CC00020000000000FFFFFF000000000200000000
      0000000000E00E000006004D656D6F32370002001C000000B801000054020000
      1100000003000F0001000000000000000000FFFFFF1F2C020000000000010006
      00C8F2EEE3EE3A00000000FFFF00000000000200000001000000000500417269
      616C000A00000000000000000009000000CC00020000000000FFFFFF00000000
      020000000000000000007E0F000006004D656D6F333300020070020000B80100
      00580000001100000003000F0001000000000000000000FFFFFF1F2C02000000
      000001001F005B464F524D4154464C4F4154282730F02E3030EA2E272C5B7375
      6D6D5D295D00000000FFFF00000000000200000001000000000500417269616C
      000A0000000000000000000A000000CC00020000000000FFFFFF000000000200
      00000000000000000710000005004D656D6F3700020030000000D40100005400
      0000100000000300000001000000000000000000FFFFFF1F2C02000000000001
      000B00CEF2EFF3F1F2E8EBE0203A00000000FFFF000000000002000000010000
      00000500417269616C000A00000000000000000001000000CC00020000000000
      FFFFFF00000000020000000000000000009110000006004D656D6F3135000200
      3C0000000402000048000000120000000300000001000000000000000000FFFF
      FF1F2C02000000000001000B00CFEEEBF3F7E8EB28E0293A00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000000
      0000CC00020000000000FFFFFF00000000020000000000000000002511000006
      004D656D6F33350002008C000000040200009C00000014000000030002000100
      0000000000000000FFFFFF1F2C020000000000010015005B6F64735472656252
      65702E22444F4C4F5450225D00000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000002000000CC00020000000000FFFF
      FF0000000002000000000000000000AD11000006004D656D6F33360002008C00
      0000180200009C000000140000000300000001000000000000000000FFFFFF1F
      2C02000000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000002000000CC00
      020000000000FFFFFF00000000020000000000000000002C12000006004D656D
      6F333700020034010000040200009C0000001400000003000200010000000000
      00000000FFFFFF1F2C0200000000000100000000000000FFFF00000000000200
      000001000000000500417269616C000A00000000000000000000000000CC0002
      0000000000FFFFFF0000000002000000000000000000B212000006004D656D6F
      333800020034010000180200009C000000140000000300000001000000000000
      000000FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000002
      000000CC00020000000000FFFFFF000000000200000000000000000043130000
      06004D656D6F3339000200D801000004020000EC000000140000000300020001
      000000000000000000FFFFFF1F2C020000000000010012005B6F647354726562
      5265702E224F5450225D00000000FFFF00000000000200000001000000000500
      417269616C000A00000000000000000002000000CC00020000000000FFFFFF00
      00000002000000000000000000D513000006004D656D6F3430000200D8010000
      18020000EC000000140000000300000001000000000000000000FFFFFF1F2C02
      000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      000002000000CC00020000000000FFFFFF000000000200000000000000000069
      14000006004D656D6F32360002008C000000D20100009C000000140000000300
      020001000000000000000000FFFFFF1F2C020000000000010015005B6F647354
      7265625265702E22444F4C504F4C225D00000000FFFF00000000000200000001
      000000000500417269616C000A00000000000000000002000000CC0002000000
      0000FFFFFF0000000002000000000000000000F114000006004D656D6F323900
      02008C000000E60100009C000000140000000300000001000000000000000000
      FFFFFF1F2C02000000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000200
      0000CC00020000000000FFFFFF00000000020000000000000000007015000006
      004D656D6F333000020034010000D20100009C00000014000000030002000100
      0000000000000000FFFFFF1F2C0200000000000100000000000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000000000
      00CC00020000000000FFFFFF0000000002000000000000000000F61500000600
      4D656D6F333100020034010000E60100009C0000001400000003000000010000
      00000000000000FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      00000002000000CC00020000000000FFFFFF0000000002000000000000000000
      8716000006004D656D6F3332000200D8010000D2010000EC0000001400000003
      00020001000000000000000000FFFFFF1F2C020000000000010012005B6F6473
      547265625265702E22504F4C225D00000000FFFF000000000002000000010000
      00000500417269616C000A00000000000000000002000000CC00020000000000
      FFFFFF00000000020000000000000000001917000006004D656D6F3334000200
      D8010000E6010000EC000000140000000300000001000000000000000000FFFF
      FF1F2C02000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E8
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      00000000000002000000CC00020000000000FFFFFF0000000002000000000000
      000000A117000006004D656D6F34310002008C000000340200009C0000001400
      00000300020001000000000000000000FFFFFF1F2C02000000000001000900C1
      F3F5E3E0EBF2E5F000000000FFFF000000000002000000010000000005004172
      69616C000A00000000000000000002000000CC00020000000000FFFFFF000000
      00020000000000000000002918000006004D656D6F34320002008C0000004802
      00009C000000140000000300000001000000000000000000FFFFFF1F2C020000
      00000001000900C4EEEBE6EDEEF1F2FC00000000FFFF00000000000200000001
      000000000500417269616C000A00000000000000000002000000CC0002000000
      0000FFFFFF0000000002000000000000000000A818000006004D656D6F343300
      020034010000340200009C000000140000000300020001000000000000000000
      FFFFFF1F2C0200000000000100000000000000FFFF0000000000020000000100
      0000000500417269616C000A00000000000000000000000000CC000200000000
      00FFFFFF00000000020000000000000000002E19000006004D656D6F34340002
      0034010000480200009C000000140000000300000001000000000000000000FF
      FFFF1F2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF0000000000
      0200000001000000000500417269616C000A00000000000000000002000000CC
      00020000000000FFFFFF0000000002000000000000000000BF19000006004D65
      6D6F3435000200D801000034020000EC00000014000000030002000100000000
      0000000000FFFFFF1F2C020000000000010012005B6F6473547265625265702E
      22425548225D00000000FFFF0000000000020000000100000000050041726961
      6C000A00000000000000000002000000CC00020000000000FFFFFF0000000002
      000000000000000000511A000006004D656D6F3436000200D801000048020000
      EC000000140000000300000001000000000000000000FFFFFF1F2C0200000000
      0001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000200
      0000CC00020000000000FFFFFF000000000200000000000000FEFEFF02000000
      0A002043617465676F72793100000000040073756D6D00010030000000000000
      000000FC010000000000000000000000000000000058000ACF5E302ED2E2408D
      9AC395D66DE440}
  end
  object odsLastNamedoc: TOracleDataSet
    SQL.Strings = (
      'select fc_doc from MED.tdocs'
      'where fp_vidmove in (1,2,3,6)'
      'and (mofromid is not null)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {04000000010000000600000046435F444F43010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 152
    Top = 96
  end
  object odsLastName: TOracleDataSet
    SQL.Strings = (
      'SELECT FC_DOC FROM MED.TDOCS'
      'WHERE FP_VIDMOVE IN (4,5,6,7,8)'
      
        'AND (MOOWNERID=MED.PKG_MEDSES.GET_CURMO OR MOTOID=MED.PKG_MEDSES' +
        '.GET_CURMO)'
      'ORDER BY  FD_DATA  /*DESC*/')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {04000000010000000600000046435F444F43010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 152
    Top = 200
  end
  object oqUpdDoc: TOracleQuery
    SQL.Strings = (
      'update MED.tdocs set fl_edit=0'
      'where dpid=:adpid')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {0300000001000000060000003A4144504944030000000000000000000000}
    Cursor = crSQLWait
    Left = 152
    Top = 296
  end
  object pmPrint: TPopupMenu
    Left = 422
    Top = 56
    object MenuItem1: TMenuItem
      Action = acPrnConsuptionAct
    end
    object MenuItem2: TMenuItem
      Action = acPrnBordereauSample
    end
    object MenuItem3: TMenuItem
      Action = acPrnInvoice
    end
    object N13: TMenuItem
      Action = acPrnReturn
    end
  end
  object frDBdsActSpisRep: TfrDBDataSet
    DataSet = odsActSpisRep
    Left = 331
    Top = 171
  end
  object odsActSpisRep: TOracleDataSet
    SQL.Strings = (
      
        'SELECT /*+RULE*/-- :OTP4 AS OTP4,:DOLOTP4 AS DOLOTP4,:POL AS POL' +
        ',:OTP AS OTP,:DOLPOL AS DOLPOL,:DOLOTP AS DOLOTP,:OTP1 AS OTP1,:' +
        'OTP2 AS OTP2,:DOLOTP1 AS DOLOTP1,:DOLOTP2 AS DOLOTP2,'
      '    TO_CHAR(SYSDATE,'#39'MONTH'#39') AS MON,'
      '    TDPC.ROWID,'
      '    TKART.FC_SERIAL AS NOMNUM,'
      '    TMEDIC.FC_NAME AS NAMEMEDIC,'
      '    TDPC.DPCID,'
      '    TKART.MEDICID,'
      '    tdpc.FN_KOL,'
      '    (TKART.FN_PRICE * tdpc.FN_KOL) as summ,'
      '    TKART.KARTID,'
      '    TKART.FN_PRICE,'
      '    TEI.FC_NAME AS EINAME,'
      '    TKART.FC_NAME AS NAMEKART,'
      '    MED.PKG_PRIHRASH.GET_MONEYSTR(TDOCS.FN_PRICE) AS SUMSTR,'
      '    ASU.PKG_SMINI.READSTRING('#39'CONFIG'#39','#39'S_FULLNAME'#39','#39#39') AS LOK,'
      '    ASU.PKG_SMINI.READSTRING('#39'NACHLOK'#39','#39'FIO'#39','#39#39') AS NACH, '
      '    TMO.FC_NAME AS NAMEFROM,'
      '    TDOCS.FC_DOC,'
      '    TRUNC (TDOCS.FD_DATA) AS DATA,'
      '    trunc(TDPC.FD_DATE_SPIS) FD_DATE_SPIS,'
      
        '--  '#1042#1080#1076' '#1089#1087#1080#1089#1072#1085#1080#1103': 1 - '#1086#1073#1099#1095#1085#1086#1077' ('#1080#1089#1090#1077#1082' '#1089#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080', '#1085#1077#1076#1086#1089#1090#1072#1095#1072'), ' +
        '2 - '#1089#1087#1080#1089#1072#1085#1080#1077' '#1085#1072' '#1086#1090#1076#1077#1083#1077#1085#1080#1077' (MED.TOTDEL_MEDICA), 3 - '#1089#1087#1080#1089#1072#1085#1080#1077' '#1085#1072' '#1087 +
        #1072#1094#1080#1077#1085#1090#1072' (). '#1055#1086' '#1101#1090#1086#1084#1091' '#1087#1086#1083#1102' '#1086#1087#1088#1077#1076#1077#1083#1077#1103#1077#1084' '#1085#1072' '#1082#1072#1082#1091#1102' '#1090#1072#1073#1083#1080#1094#1091' '#1089#1089#1099#1083#1072#1077#1090#1089#1103 +
        ' '#1087#1086#1083#1077' motoid'
      '--    DECODE(TDOCS.fn_spisanievid, '
      
        '--              1, (SELECT MIN(FC_NAME) FROM MED.TSPISANIEVID WH' +
        'ERE FK_ID = TDOCS.motoid), '
      '--              2, '#39#1057#1087#1080#1089#1072#1085#1080#1077' '#1085#1072' '#1083#1077#1095#1077#1085#1080#1077' '#1087#1072#1094#1080#1077#1085#1090#1086#1074#39','
      '--              3, '#39#1057#1087#1080#1089#1072#1085#1080#1077' '#1085#1072' '#1083#1077#1095#1077#1085#1080#1077' '#1087#1072#1094#1080#1077#1085#1090#1086#1074#39','
      '--              '#39#39') as SpisDescr'
      ''
      
        '    MED.PKGTDOCS.GET_SPISANIE_DETAIL_DESCR ( TDOCS.FP_VID, TDOCS' +
        '.FP_VIDMOVE, TDOCS.FN_SPISANIEVID, TDOCS.FK_MOGROUPID_TO) as Spi' +
        'sDescr,'
      '    DECODE(TDOCS.FN_SPISANIEVID,6,'
      
        '           (SELECT u.fc_name || '#39' '#8470#39' || to_char(do.fk_numib) || ' +
        #39'/'#39' || to_char(do.fn_year) ||'
      
        '                   CHR(10) || '#39#1055#1077#1088#1080#1086#1076' '#1083#1077#1095#1077#1085#1080#1103' '#1089' '#39' || to_char(t.f' +
        'd_opened,'#39'dd.mm.yyyy'#39') || '#39' '#1087#1086' '#39' || to_char(t.fd_closed,'#39'dd.mm.y' +
        'yyy'#39') ||'
      
        '                   CHR(10) || '#39'DS '#1086#1089#1085#1086#1074#1085#1086#1081': '#39' || (SELECT max(fc_' +
        'write) FROM asu.tdiag WHERE fk_id = t.fk_diagmain)'
      
        '              FROM asu.tambtalon t, asu.tambulance a, asu.tdocob' +
        'sl do, asu.tuslvid u'
      
        '             WHERE t.fk_id = TDOCS.FK_MOGROUPID_TO AND a.fk_id =' +
        ' t.fk_ambid AND a.fk_docobsl = do.fk_id AND do.fk_viddocid = u.f' +
        'k_id),'
      '           '#39#39') FC_TALON_INFO,'
      '    TKART.fc_inv_nomer,'
      '    fs.fc_name as fc_finsource,'
      
        '    (SELECT MAX(fc_remark) FROM asu.tnazmark WHERE fk_id = TDPC.' +
        'FK_NAZMARK_ID) FC_REMARK'
      ''
      
        '  FROM MED.TDPC, MED.TKART, MED.TMEDIC, MED.TEI, MED.TDOCS, MED.' +
        'TMO, MED.TFINSOURCE fs'
      '  WHERE TDOCS.DPID=TDPC.DPID '
      '    AND  TDOCS.DPID=:ADPID '
      '    AND TDPC.KARTID=TKART.KARTID '
      '    AND TKART.fk_finsource_id = fs.fk_id(+)'
      '    AND TMEDIC.EIID=TEI.EIID(+) '
      '    AND TKART.MEDICID=TMEDIC.MEDICID'
      '    AND TDOCS.MOFROMID = TMO.MOID(+)'
      '    AND TKART.FL_DEL=0'
      '--    AND TMEDIC.FL_VISIBLE = 1'
      '  ORDER BY  :fin_source_order TMEDIC.FC_NAME')
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A41445049440300000000000000000000001100
      00003A46494E5F534F555243455F4F52444552010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000012000000050000004450434944010000000000070000004D45444943
      494401000000000006000000464E5F4B4F4C010000000000060000004B415254
      49440100000000000600000045494E414D45010000000000080000004E414D45
      4B415254010000000000060000004E4F4D4E554D010000000000090000004E41
      4D454D454449430100000000000600000053554D535452010000000000030000
      004D4F4E0100000000000400000053554D4D010000000000030000004C4F4B01
      0000000000040000004E414348010000000000080000004E414D4546524F4D01
      00000000000600000046435F444F430100000000000400000044415441010000
      00000008000000464E5F50524943450100000000000900000053504953444553
      4352010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 332
    Top = 219
  end
  object frActSpis: TfrReport
    InitialZoom = pzPageWidth
    MDIPreview = True
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frActSpisGetValue
    OnUserFunction = frActSpisUserFunction
    OnObjectClick = frActSpisObjectClick
    OnMouseOverObject = frActSpisMouseOverObject
    Left = 332
    Top = 132
    ReportForm = {
      19000000C6250000190000000001000100FFFFFFFFFF09000000340800009A0B
      00004800000000000000000000000000000000FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000004000000F6020000B60000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200460100000B004D61737465
      7244617461310002010000000084020000F60200001600000031000500010000
      00000000000000FFFFFF1F000000001000667244426473416374537069735265
      7000000000000000FFFF000000000002000000010000000000000001000000C8
      00000014000000010000000000000200B30100000D004D6173746572466F6F74
      65723100020100000000B0020000F60200001800000031000600010000000000
      00000000FFFFFF1F00000000000000000000000000FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000200210200
      000E005265706F727453756D6D61727931000201000000007C030000F6020000
      6C0000003000010001000000000000000000FFFFFF1F00000000000000000000
      000000FFFF000000000002000000010000000000000001000000C80000001400
      00000100000000000002008E0200000D004D6173746572486561646572310002
      010000000030020000F6020000410000003000040001000000000000000000FF
      FFFF1F00000000000000000000000000FFFF0000000000020000000100000000
      00000001000000C800000014000000010000000000000200FA0200000B004D61
      737465724461746136000201000000003C010000F60200008200000030000500
      01000000000000000000FFFFFF1F0000000001003100000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200660300000B004D6173746572446174613200020100000000CC010000
      F6020000370000003100050001000000000000000000FFFFFF1F000000000100
      3100000000000000FFFF000000000002000000010000000000000001000000C8
      00000014000000010000000000000200D10300000B0050616765466F6F746572
      310002010000000000040000F60200001E000000300003000100000000000000
      0000FFFFFF1F00000000000000000000000000FFFF0000000000020000000100
      00000000000001000000C8000000140000000100000000000002003D0400000B
      004D61737465724461746134000201000000000C020000F60200001400000031
      00050001000000000000000000FFFFFF1F000000000100310000000000000001
      00000000000002000000010000000000000001000000C8000000140000000100
      00000000000200A90400000B004D6173746572446174613500020100000000DC
      020000F6020000640000003100050001000000000000000000FFFFFF1F000000
      0001003100000000000000FFFF00000000000200000001000000000000000100
      0000C8000000140000000100000000000002000F050000050042616E64310002
      010000000050030000F6020000140000003100050001000000000000000000FF
      FFFF1F0000000001003100000000000000FFFF00000000000200000001000000
      0000000001000000C8000000140000000100000000000002007B0500000B004D
      617374657244617461330002010000000018010000F602000017000000310005
      0001000000000000000000FFFFFF1F0000000001003100000000000000FFFF00
      0000000002000000010000000000000001000000C80000001400000001000000
      0000000200E70500000B004D6173746572446174613700020100000000C60000
      00F6020000160000003100050001000000000000000000FFFFFF1F0000000001
      003100000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200530600000B004D6173746572446174
      613800020100000000F4000000F60200000C0000003100050001000000000000
      000000FFFFFF1F0000000001003100000000000000FFFF000000000002000000
      010000000000000001000000C8000000140000000100000000000000003D0700
      0005004D656D6F3200020048000000CD0100009C0200002E0000000B00000001
      000000000000000000FFFFFF1F2C02000000000002001B00EDE0E7EDE0F7E5ED
      E020EFF0E8EAE0E7EEEC205B5072696B617A5D0D4E0063EEF1F2E0E2E8EBE820
      EDE0F1F2EEFFF9E8E920E0EAF22020E220F2EEEC2C20F7F2EE20EFEE20F3EAE0
      E7E0EDEDEEE920EFF0E8F7E8EDE520F1EFE8F1E0EDEE20ECE5E4E8EAE0ECE5ED
      F2EEE23A00000000FFFF00000000000200000001000000040500417269616C00
      0C00000000000000000000000000CC00020000000000FFFFFF00000000020000
      00000000000000BC07000005004D656D6F33000200480000003E0200001E0000
      003200000003000F0002000000000000000000FFFFFF1F2C0200000000000100
      0100B900000000FFFF00000000000200000001000000000500417269616C0009
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      0000000000005208000005004D656D6F35000200660000003E02000031010000
      3200000003000F0002000000000000000000FFFFFF1F2C020000000000010018
      00CDE0E8ECE5EDEEE2E0EDE8E520ECE5E4E8EAE0ECE5EDF2E000000000FFFF00
      000000000200000001000000000500417269616C00060000000000000000000A
      000000CC00020000000000FFFFFF0000000002000000000000000000D6080000
      05004D656D6F36000200970100003E020000580000003200000003000F000200
      0000000000000000FFFFFF1F2C02000000000001000600C5E42EC8E7EC000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      5A09000005004D656D6F37000200420200003E0200002E000000320000000300
      0F0002000000000000000000FFFFFF1F2C02000000000001000600CAEEEB2DE2
      EE00000000FFFF00000000000200000001000000000500417269616C000A0000
      000000000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000E009000006004D656D6F3131000200EF0100003E0200005300000032
      00000003000F0002000000000000000000FFFFFF1F2C02000000000001000700
      D6E5EDE02C20F000000000FFFF00000000000200000001000000000500417269
      616C000A0000000000000000000A000000CC00020000000000FFFFFF00000000
      02000000000000000000670A000006004D656D6F3132000200700200003E0200
      00740000003200000003000F0002000000000000000000FFFFFF1F2C02000000
      000001000800D1F3ECECE02C20F000000000FFFF000000000002000000010000
      00000500417269616C000A0000000000000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000130B000006004D656D6F3234000200
      48000000840200001E0000001600000003000F0001000000000000000000FFFF
      FF1F2C020000000000010007005B4C494E45235D0003000500626567696E0D16
      0020204E41494D5F4B4F4C203A3D205B4C494E45235D3B0D0300656E6400FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000AD0B00
      0006004D656D6F32360002006600000084020000310100001600000003000F00
      01000000000000000000FFFFFF1F2C02000000000001001B005B6F6473416374
      537069735265702E224E414D454D45444943225D00000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000008000000CC00
      020000000000FFFFFF0000000002000000000000000000440C000006004D656D
      6F32370002009701000084020000580000001600000003000F00010000000000
      00000000FFFFFF1F2C020000000000010018005B6F6473416374537069735265
      702E2245494E414D45225D00000000FFFF000000000002000000010000000005
      00417269616C000A0000000000000000000A000000CC00020000000000FFFFFF
      0000000002000000000000000000DB0C000006004D656D6F3238000200420200
      00840200002E0000001600000003000F0001000000000000000000FFFFFF1F2C
      020000000000010018005B6F6473416374537069735265702E22464E5F4B4F4C
      225D00000000FFFF00000000000200000001000000000500417269616C000A00
      00000000000000000A000000CC00020000000000FFFFFF000000000200000000
      0000000000840D000006004D656D6F3239000200EF0100008402000053000000
      1600000003000F0001000000000000000000FFFFFF1F2C020301100023232320
      232323202323302E303020F00001001A005B6F6473416374537069735265702E
      22666E5F7072696365225D00000000FFFF000000000002000000010000000005
      00417269616C000A0000000000000000000A000000CC00020000000000FFFFFF
      00000000020000000000000000005D0E000006004D656D6F3330000200700200
      0084020000740000001600000003000F0001000000000000000000FFFFFF1F2C
      020301100023232320232323202323302E303020F000010016005B6F64734163
      74537069735265702E2253554D4D225D0003000500626567696E0D2400202073
      756D6D3A3D73756D6D2B5B6F6473416374537069735265702E2253554D4D225D
      3B0D0300656E6400FFFF00000000000200000001000000000500417269616C00
      0A0000000000000000000A000000CC00020000000000FFFFFF00000000020000
      00000000000000FB0E000006004D656D6F3637000200550100006F0000002400
      0000110000000300020001000000000000000000FFFFFF1F2C02000000000001
      001F00225B464F524D41544441544554494D4528276464272C2044415445295D
      222000000000000000000000000200000001000000000500417269616C000C00
      000000000000000000000000CC00020000000000FFFFFF000000000200000000
      00000000008F0F000006004D656D6F36380002009E0100006F00000078000000
      110000000300020001000000000000000000FFFFFF1F2C020000000000010015
      005B6F6473416374537069735265702E224D4F4E225D00000000000000000000
      000200000001000000000500417269616C000C00000000000000000002000000
      CC00020000000000FFFFFF00000000020000000000000000002E10000006004D
      656D6F36390002001A0200006F00000034000000140000000300000001000000
      000000000000FFFFFF1F2C020000000000010020005B464F524D415444415445
      54494D45282779797979272C2044415445295D20E30000000000000000000000
      0200000001000000000500417269616C000C00000000000000000000000000CC
      00020000000000FFFFFF0000000002000000000000000000C210000006004D65
      6D6F373100020048000000100000006C01000023000000030002000100000000
      0000000000FFFFFF1F2C020000000000010015005B6F64734163745370697352
      65702E224C4F4B225D00000000FFFF0000000000020000000100000001050041
      7269616C000A00000000000000000012000000CC00020000000000FFFFFF0000
      0000020000000000000000006411000006004D656D6F3733000200480000004D
      0000006C010000130000000300020001000000000000000000FFFFFF1F2C0200
      00000000010023005B6F647353656C446F634D6F76652E2266635F6D6F67726F
      757069645F66726F6D225D00000000FFFF000000000002000000010000000105
      00417269616C000A00000000000000000012000000CC00020000000000FFFFFF
      0000000002000000000000000000FD11000006004D656D6F3735000200480000
      006E00000041010000130000000300020001000000000000000000FFFFFF1F2C
      02000000000001001A005B6F6473416374537069735265702E224E414D454652
      4F4D225D00000000000000000000000200000001000000010500417269616C00
      0A00000000000000000012000000CC00020000000000FFFFFF00000000020000
      00000000000000B512000006004D656D6F373600020048000000860000009C02
      0000340000000300000001000000000000000000FFFFFF1F2C02000000000001
      001B005B6F647353656C446F634D6F76652E2246435F444F434D4958225D0004
      000500626567696E0D0B0020202073756D6D3A3D303B0D00000D0300656E6400
      FFFF00000000000200000001000000040500417269616C001000000002000000
      00000A000000CC00020000000000FFFFFF000000000200000000000000000074
      13000006004D656D6F3831000200EF010000B002000081000000140000000300
      000001000000000000000000FFFFFF1F2C02000000000001000600C8F2EEE3EE
      3A0003000500626567696E0D2A00202046435F4E41494D5F4B4F4C203A3D2047
      45545F4E41494D5F4B4F4C28204E41494D5F4B4F4C20293B0D0300656E6400FF
      FF00000000000200000001000000000500417269616C000A0000000200000000
      0009000000CC00020000000000FFFFFF00000000020000000000000000000914
      000006004D656D6F383300020070020000B00200007400000014000000030000
      0001000000000000000000FFFFFF1F2C02040110002323232023232320232330
      2E303020F000010006005B73756D6D5D00000000FFFF00000000000200000001
      000000020500417269616C000A00000002000000000009000000CC0002000000
      0000FFFFFF00000000020000000000000000009914000006004D656D6F393500
      020090000000F6020000540200002C0000000300000001000000000000000000
      FFFFFF1F2C020000000000010011005B4D4F4E45595354522873756D6D295D20
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      04000000000000000000CC00020000000000FFFFFF0000000002000000000000
      0000003215000005004D656D6F3800020048000000C60000009C020000160000
      000300000001000000000000000000FFFFFF1F2C02000000000001001B005B6F
      6473416374537069735265702E22537069734465736372225D00000000FFFF00
      000000000200000001000000040500417269616C00100000000200000000000A
      0000000100020000000000FFFFFF0000000002000000000000000000F5150000
      05004D656D6F3900020048000000F40000009C0200000C000000030000000100
      0000000000000000FFFFFF1F2C0200000000000100120028EFF0E8F7E8EDE020
      F1EFE8F1E0EDE8FF290003000500626567696E0D230020204D656D6F392E5669
      7369626C65203A3D204D656D6F382E4D656D6F203D2027273B0D0300656E6400
      FFFF00000000000200000001000000040500417269616C000700000000000000
      0000020000000100020000000000FFFFFF000000000200000000000000000080
      16000006004D656D6F313000020048000000340000006C010000100000000300
      000001000000000000000000FFFFFF1F2C02000000000001000C0028F3F7F0E5
      E6E4E5EDE8E52900000000FFFF00000000000200000001000000010500417269
      616C0008000000000000000000020000000100020000000000FFFFFF00000000
      020000000000000000000E17000006004D656D6F313300020048000000610000
      006C010000100000000300000001000000000000000000FFFFFF1F2C02000000
      000001000F0028EFEEE4F0E0E7E4E5EBE5EDE8E52900000000FFFF0000000000
      0200000001000000010500417269616C00080000000000000000000200000001
      00020000000000FFFFFF0000000002000000000000000000A417000006004D65
      6D6F39390002004800000063010000C500000014000000030000000100000000
      0000000000FFFFFF1F2C02000000000001001700CFF0E5E4F1E5E4E0F2E5EBFC
      20EAEEECE8F1F1E8E83A2000000000FFFF000000000002000000010000000105
      00417269616C000C00000000000000000008000000CC00020000000000FFFFFF
      00000000020000000000000000003418000007004D656D6F3130310002004800
      00007D010000C5000000140000000300000001000000000000000000FFFFFF1F
      2C02000000000001001000D7EBE5EDFB20EAEEECE8F1F1E8E83A2000000000FF
      FF00000000000200000001000000010500417269616C000C0000000000000000
      0008000000CC00020000000000FFFFFF0000000002000000000000000000C318
      000006004D656D6F34380002000D01000063010000D701000014000000030002
      0001000000000000000000FFFFFF1F2C020000000000010010005B507265645D
      205B446F6C507265645D00000000FFFF00000000000200000001000000020500
      417269616C000A00000000000000000000000000CC00020000000000FFFFFF00
      000000020000000000000000005319000007004D656D6F3130350002000D0100
      007D010000D7010000140000000300020001000000000000000000FFFFFF1F2C
      020000000000010010005B4B6F6D315D205B446F6C4B6F6D315D00000000FFFF
      00000000000200000001000000020500417269616C000A000000000000000000
      00000000CC00020000000000FFFFFF0000000002000000000000000000E31900
      0007004D656D6F3130320002000D01000092010000D701000014000000030002
      0001000000000000000000FFFFFF1F2C020000000000010010005B4B6F6D325D
      205B446F6C4B6F6D325D00000000FFFF00000000000200000001000000020500
      417269616C000A00000000000000000000000000CC00020000000000FFFFFF00
      00000002000000000000000000731A000007004D656D6F3135320002000D0100
      00A7010000D7010000140000000300020001000000000000000000FFFFFF1F2C
      020000000000010010005B4B6F6D335D205B446F6C4B6F6D335D00000000FFFF
      00000000000200000001000000020500417269616C000A000000000000000000
      00000000CC00020000000000FFFFFF0000000002000000000000000000051B00
      0006004D656D6F31340002004800000049010000C50000001400000003000000
      01000000000000000000FFFFFF1F2C02000000000001001300CAEEECE8F1F1E8
      FF20E220F1EEF1F2E0E2E53A00000000FFFF0000000000020000000100000001
      0500417269616C000C000000000000000000000000000100020000000000FFFF
      FF0000000002000000000000000400541B000005004C696E6531000200480000
      00040400009C020000000000000100080002000000000000000000FFFFFF1F2C
      020000000000000000000000FFFF00000000000200000001000000040000471C
      000009006D6553706973616E6F000200480000000C0200009C02000014000000
      0B00000001000000000000000000FFFFFF1F2C020000000000010009005B5370
      6973616E6F5D0004000500626567696E0D1A00202053706973616E6F203A3D20
      47455453504953414E4F28293B0D3B0020206966204C656E6774682853706973
      616E6F29203C2035207468656E204D617374657244617461342E76697369626C
      65203A3D2046616C73653B0D0300656E6400FFFF000000000002000000010000
      00040500417269616C000C000000000000000000080000000100020000000000
      FFFFFF0000000002000000000000000000CF1C000006004D656D6F3136000200
      48000000F6020000480000002C0000000300000001000000000000000000FFFF
      FF1F2C02000000000001000900EDE020F1F3ECECF32000000000FFFF00000000
      000200000001000000000500417269616C000A00000000000000000001000000
      CC00020000000000FFFFFF0000000002000000000000000000861D000005004D
      656D6F3400020048000000500300009C020000140000000B0000000100000000
      8000000000FFFFFF002C02000000000001000C005B5A616B6C4B6F6D5374725D
      0003000500626567696E0D1D0020205A616B6C4B6F6D537472203A3D20476574
      5A616B6C4B6F6D28293B0D0300656E6400FFFF00000000000200000001000000
      040500417269616C000C000000000000000000080000000100020000000000FF
      FFFF0000000002000000000000000000191E000006004D656D6F313700020048
      00000026030000C5000000140000000300000002000000000000000000FFFFFF
      1F2C02000000000001001400C7E0EAEBFEF7E5EDE8E520EAEEECE8F1F1E8E83A
      00000000FFFF00000000000200000001000000010500417269616C0005000000
      000000000000000000000100020000000000FFFFFF0000000002000000000000
      000000AF1E000006004D656D6F3138000200480000008E030000C50000001400
      00000300000001000000000000000000FFFFFF1F2C02000000000001001700CF
      F0E5E4F1E5E4E0F2E5EBFC20EAEEECE8F1F1E8E83A2000000000FFFF00000000
      000200000001000000010500417269616C000C00000000000000000008000000
      CC00020000000000FFFFFF00000000020000000000000000003E1F000006004D
      656D6F31390002000D0100008E030000D7010000140000000300020001000000
      000000000000FFFFFF1F2C020000000000010010005B507265645D205B446F6C
      507265645D00000000FFFF00000000000200000001000000020500417269616C
      000A00000000000000000000000000CC00020000000000FFFFFF000000000200
      0000000000000000CD1F000006004D656D6F323000020048000000A8030000C5
      000000140000000300000001000000000000000000FFFFFF1F2C020000000000
      01001000D7EBE5EDFB20EAEEECE8F1F1E8E83A2000000000FFFF000000000002
      00000001000000010500417269616C000C00000000000000000008000000CC00
      020000000000FFFFFF00000000020000000000000000005C20000006004D656D
      6F32310002000D010000A8030000D70100001400000003000200010000000000
      00000000FFFFFF1F2C020000000000010010005B4B6F6D315D205B446F6C4B6F
      6D315D00000000FFFF00000000000200000001000000020500417269616C000A
      00000000000000000000000000CC00020000000000FFFFFF0000000002000000
      000000000000EB20000006004D656D6F32320002000D010000BD030000D70100
      00140000000300020001000000000000000000FFFFFF1F2C0200000000000100
      10005B4B6F6D325D205B446F6C4B6F6D325D00000000FFFF0000000000020000
      0001000000020500417269616C000A00000000000000000000000000CC000200
      00000000FFFFFF00000000020000000000000000007A21000006004D656D6F32
      330002000D010000D2030000D701000014000000030002000100000000000000
      0000FFFFFF1F2C020000000000010010005B4B6F6D335D205B446F6C4B6F6D33
      5D00000000FFFF00000000000200000001000000020500417269616C000A0000
      0000000000000000000000CC00020000000000FFFFFF00000000020000000000
      000000000022000006004D656D6F323500020084020000080400006000000014
      0000000300000002000000000000000000FFFFFF1F2C02000000000001000700
      5B50414745235D00000000FFFF00000000000200000001000000020500417269
      616C000A000000000000000000090000000100020000000000FFFFFF00000000
      020000000000000000000623000005004D656D6F31000200E801000006000000
      FC0000007F0000000300000001000000000000000000FFFFFF1F2C0200000000
      0008000900D3D2C2C5D0C6C4C0DE0D00000D22005F5F5F5F5F5F5F5F5F5F5F5F
      5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F0D00000D00000D22005F
      5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
      5F0D00000D2600225F5F5F2220205F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
      5F5F5F202032305F5F5F20E32E00000000FFFF00000000000200000001000000
      020500417269616C000A000000020000000000000000000100020000000000FF
      FFFF00000000020000000000000000009023000006004D656D6F3135000200E8
      01000035000000FC000000100000000300000001000000000000000000FFFFFF
      1F2C02000000000001000B0028E4EEEBE6EDEEF1F2FC2900000000FFFF000000
      00000200000001000000020500417269616C0007000000020000000000020000
      000100020000000000FFFFFF00000000020000000000000000002E2400000900
      6D65436F6D6D656E7400020048000000180100009C0200001700000003000000
      01000000000000000000FFFFFF1F2C02000000000001001C005B6F647353656C
      446F634D6F76652E2246435F434F4D4D454E54225D00000000FFFF0000000000
      0200000001000000000500417269616C000C0000000200000000000200000001
      00020000000000FFFFFF0000000002000000000000000000E024000006004D65
      6D6F333100020048000000E00200006301000014000000030000000100000000
      0000000000FFFFFF1F2C02000000000001003300C2F1E5E3EE20EFEE20EDE0F1
      F2EEFFF9E5ECF320E0EAF2F320F1EFE8F1E0EDEE20EDE0E8ECE5EDEEE2E0EDE8
      FF282DE8E9293A00000000FFFF00000000000200000001000000000500417269
      616C000A000000000000000000000000000100020000000000FFFFFF00000000
      020000000000000000006C25000006004D656D6F3332000200AB010000E00200
      0039010000140000000300000001000000000000000000FFFFFF1F2C02000000
      000001000D005B46435F4E41494D5F4B4F4C5D00000000FFFF00000000000200
      000001000000000500417269616C000A00000004000000000000000000010002
      0000000000FFFFFF000000000200000000000000FEFEFF030000000A00204361
      7465676F72793100000000040073756D6D0001003000070073747273756D6D00
      0000000000000000000000FC0000000000000000000000000000000058000ACF
      5E302ED2E2408D9AC395D66DE440}
  end
  object frVedomost: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frVedomostGetValue
    Left = 402
    Top = 122
    ReportForm = {
      19000000E3270000190000FFFF01000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF0000FFFF00000100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      00000C000000F60200005E0100003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C8000000140000000100000000000002003F0100000B004D61737465
      72446174613100020100000000B4010000F60200001800000030000500010000
      00000000000000FFFFFF1F000000000900667244426473566564000000000000
      00FFFF000000000002000000010000000000000001000000C800000014000000
      010000000000000200AC0100000D004D6173746572466F6F7465723100020100
      000000DC010000F60200001A0000003000060001000000000000000000FFFFFF
      1F00000000000000000000000000FFFF00000000000200000001000000000000
      0001000000C800000014000000010000000000000200190200000D004D617374
      657248656164657231000201000000007C010000F60200002000000030000400
      01000000000000000000FFFFFF1F00000000000000000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      000200850200000B004D617374657244617461320002010000000008020000F6
      020000260000003000050001000000000000000000FFFFFF1F00000000010031
      00000000000000FFFF000000000002000000010000000000000001000000C800
      000014000000010000000000000200F10200000B004D61737465724461746133
      0002010000000034020000F60200004600000030000500010000000000000000
      00FFFFFF1F0000000001003100000000000000FFFF0000000000020000000100
      00000000000001000000C8000000140000000100000000000002005D0300000B
      004D61737465724461746134000201000000007C020000F60200002A00000030
      00050001000000000000000000FFFFFF1F0000000001003100000000000000FF
      FF000000000002000000010000000000000001000000C8000000140000000100
      00000000000200C90300000B004D6173746572446174613500020100000000BA
      020000F60200002A0000003000050001000000000000000000FFFFFF1F000000
      0001003100000000000000FFFF00000000000200000001000000000000000100
      0000C800000014000000010000000000000200350400000B004D617374657244
      6174613600020100000000F8020000F60200002A000000300005000100000000
      0000000000FFFFFF1F0000000001003100000000000000FFFF00000000000200
      0000010000000000000001000000C800000014000000010000000000000200A0
      0400000B0050616765466F6F746572310002010000000014040000F602000014
      0000003000030001000000000000000000FFFFFF1F0000000000000000000000
      0000FFFF000000000002000000010000000000000001000000C8000000140000
      000100000000000000007205000005004D656D6F3200020086000000D0000000
      E40100004C0000000300000001000000000000000000FFFFFF1F2C0200000000
      0003000900C2E5E4EEECEEF1F2FC0D2700E2FBE1EEF0EAE820E8E7F0E0F1F5EE
      E4EEE2E0EDEDFBF520F1F0E5E4F1F2E220B9205F5F5F5F5F0D00000004000500
      626567696E0D0B0020202073756D6D3A3D303B0D00000D0300656E6400FFFF00
      000000000200000001000000000500417269616C001000000002000000000002
      000000CC00020000000000FFFFFF0000000002000000000000000000F9050000
      05004D656D6F37000200140000007C0100001C0000002000000003000F000100
      0000000000000000FFFFFF1F2C02000000000002000200B9200D0400EF2EEF2E
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      0000008306000005004D656D6F38000200300000007C01000004010000200000
      0003000F0001000000000000000000FFFFFF1F2C02000000000001000C00CDE0
      E8ECE5EDEEE2E0EDE8E500000000FFFF00000000000200000001000000000500
      417269616C000A0000000000000000000A000000CC00020000000000FFFFFF00
      000000020000000000000000000907000005004D656D6F39000200340100007C
      0100004C0000002000000003000F0001000000000000000000FFFFFF1F2C0200
      0000000001000800C5E42E20C8E7EC2E00000000FFFF00000000000200000001
      000000000500417269616C000A0000000000000000000A000000CC0002000000
      0000FFFFFF00000000020000000000000000009207000006004D656D6F313000
      0200800100007C0100004C0000002000000003000F0001000000000000000000
      FFFFFF1F2C02000000000001000A00CAEEEBE8F7E5F1F2E2EE00000000FFFF00
      000000000200000001000000000500417269616C000A0000000000000000000A
      000000CC00020000000000FFFFFF000000000200000000000000000015080000
      06004D656D6F3133000200CC0100007C010000500000002000000003000F0001
      000000000000000000FFFFFF1F2C02000000000001000400D6E5EDE000000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      00000A000000CC00020000000000FFFFFF000000000200000000000000000099
      08000006004D656D6F31340002001C0200007C01000058000000200000000300
      0F0001000000000000000000FFFFFF1F2C02000000000001000500D1F3ECECE0
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      0000002209000006004D656D6F313500020014000000B40100001C0000001800
      000003000F0001000000000000000000FFFFFF1F2C02000000000001000A005B
      43555252454E54235D00000000FFFF0000000000020000000100000000050041
      7269616C00080000000000000000000A000000CC00020000000000FFFFFF0000
      000002000000000000000000B509000006004D656D6F313600020030000000B4
      010000040100001800000003000F0001000000000000000000FFFFFF1F2C0200
      00000000010014005B6F64735665642E224D454449434E414D45225D00000000
      FFFF00000000000200000001000000000500417269616C000800000000000000
      000008000000CC00020000000000FFFFFF000000000200000000000000000045
      0A000006004D656D6F313700020034010000B40100004C000000180000000300
      0F0001000000000000000000FFFFFF1F2C020000000000010011005B6F647356
      65642E2245494E414D45225D00000000FFFF0000000000020000000100000000
      0500417269616C00080000000000000000000A000000CC00020000000000FFFF
      FF0000000002000000000000000000D20A000006004D656D6F31390002008001
      0000B40100004C0000001800000003000F0001000000000000000000FFFFFF1F
      2C02000000000001000E005B6F64735665642E224B4F4C225D00000000FFFF00
      000000000200000001000000000500417269616C00080000000000000000000A
      000000CC00020000000000FFFFFF00000000020000000000000000007E0B0000
      06004D656D6F3231000200CC010000B4010000500000001800000003000F0001
      000000000000000000FFFFFF1F2C02000000000001002D005B464F524D415446
      4C4F4154282730F02E3030EA2E272C205B6F64735665642E22666E5F70726963
      65225D295D00000000FFFF00000000000200000001000000000500417269616C
      00080000000000000000000A000000CC00020000000000FFFFFF000000000200
      0000000000000000550C000006004D656D6F32320002001C020000B401000058
      0000001800000003000F0001000000000000000000FFFFFF1F2C020000000000
      010029005B464F524D4154464C4F4154282730F02E3030EA2E272C5B6F647356
      65642E2253554D4D225D20295D0003000500626567696E0D1F00202073756D6D
      3A3D73756D6D2B285B6F64735665642E2253554D4D225D293B0D0300656E6400
      FFFF00000000000200000001000000000500417269616C000800000000000000
      00000A000000CC00020000000000FFFFFF0000000002000000000000000000EC
      0C000006004D656D6F3131000200740200007C01000068000000200000000300
      0F0001000000000000000000FFFFFF1F2C02000000000001001800CEF2ECE5F2
      EAE020EE20E7E0EFE8F1E820E220EAEDE8E3F300000000FFFF00000000000200
      000001000000000500417269616C000A0000000000000000000A000000CC0002
      0000000000FFFFFF00000000020000000000000000006B0D000006004D656D6F
      313200020074020000B4010000680000001800000003000F0001000000000000
      000000FFFFFF1F2C0200000000000100000000000000FFFF0000000000020000
      0001000000000500417269616C00080000000000000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000950E000006004D656D6F32
      300002002400000030000000600100005C000000030000000100000000000000
      0000FFFFFF1F2C02000000000005001800D4EEF0ECE020B9312DCCC720D1EEE3
      EBE0F1EEE2E0EDE0200D1D00F120CCE8EDE8F1F2E5F0F1F2E2EEEC20F4E8EDE0
      EDF1EEE220D1D1D1D00D1600323520ECE0F0F2E02031393837E32E20B934312D
      33310D2000D3F2E2E5F0E6E4E5EDE020EFF0E8EAE0E7EEEC20CCE8EDE8F1F2E5
      F0F1F2E2E00D2A00C7E4F0E0E2EEEEF5F0E0EDE5EDE8FF20D1D1D1D020EEF220
      3220E8FEEDFF2031393837E32E20B937343700000000FFFF0000000000020000
      0001000000000F0054696D6573204E657720526F6D616E000C00000000000000
      000000000000CC00020000000000FFFFFF00000000020000000000000000004C
      0F000005004D656D6F340002005E000000440100002E02000025000000030000
      0001000000000000000000FFFFFF1F2C02000000000001002F00CCE0F2E5F0E8
      E0EBFCEDEE20EEF2E2E5F2F1F2E2E5EDEDFBE93A205B6F64735665642E224355
      5252454E544D4F225D00000000000000000000000200000001000000000F0054
      696D6573204E657720526F6D616E000C00000000000000000002000000CC0002
      0000000000FFFFFF0000000002000000000000000000E50F000005004D656D6F
      3600020020000000080200008800000014000000030000000100000000000000
      0000FFFFFF1F2C02000000000001001100C2FBE1EEF0EAF320F1EEF1F2E0E2E8
      EB3A00000000FFFF00000000000200000001000000000F0054696D6573204E65
      7720526F6D616E000B00000000000000000000000000CC00020000000000FFFF
      FF00000000020000000000000000008010000006004D656D6F32330002001400
      00005002000094000000140000000300000001000000000000000000FFFFFF1F
      2C02000000000001001200C2FBE1EEF0EAF320EFF0EEE2E5F0E8EBE83A000000
      00FFFF00000000000200000001000000000F0054696D6573204E657720526F6D
      616E000C00000000000000000000000000CC00020000000000FFFFFF00000000
      02000000000000000000FD10000006004D656D6F323600020014000000DC0100
      001C0000001800000003000F0001000000000000000000FFFFFF1F2C02000000
      0000000000000000FFFF00000000000200000001000000000500417269616C00
      080000000000000000000A000000CC00020000000000FFFFFF00000000020000
      000000000000008111000006004D656D6F323700020030000000DC0100000401
      00001800000003000F0001000000000000000000FFFFFF1F2C02000000000001
      000500C8F2EEE3EE00000000FFFF000000000002000000010000000005004172
      69616C000800000002000000000008000000CC00020000000000FFFFFF000000
      0002000000000000000000FE11000006004D656D6F323800020034010000DC01
      00004C0000001800000003000F0001000000000000000000FFFFFF1F2C020000
      000000000000000000FFFF00000000000200000001000000000500417269616C
      00080000000000000000000A000000CC00020000000000FFFFFF000000000200
      00000000000000007B12000006004D656D6F333000020080010000DC0100004C
      0000001800000003000F0001000000000000000000FFFFFF1F2C020000000000
      000000000000FFFF00000000000200000001000000000500417269616C000800
      00000000000000000A000000CC00020000000000FFFFFF000000000200000000
      0000000000F812000006004D656D6F3331000200CC010000DC01000050000000
      1800000003000F0001000000000000000000FFFFFF1F2C020000000000000000
      000000FFFF00000000000200000001000000000500417269616C000800000000
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      00009513000006004D656D6F33320002001C020000DC01000058000000180000
      0003000F0001000000000000000000FFFFFF1F2C02000000000001001E005B46
      4F524D4154464C4F4154282730F02E3030EA2E272C2073756D6D295D00000000
      FFFF00000000000200000001000000000500417269616C000800000002000000
      00000A000000CC00020000000000FFFFFF000000000200000000000000000014
      14000006004D656D6F333300020074020000DC01000068000000180000000300
      0F0001000000000000000000FFFFFF1F2C0200000000000100000000000000FF
      FF00000000000200000001000000000500417269616C00080000000000000000
      000A000000CC00020000000000FFFFFF0000000002000000000000000000A414
      000006004D656D6F3335000200B0000000080200009C00000014000000030002
      0001000000000000000000FFFFFF1F2C020000000000010011005B6F64735665
      642E22444F4C504F4C225D00000000FFFF000000000002000000010000000005
      00417269616C000A00000000000000000002000000CC00020000000000FFFFFF
      00000000020000000000000000002C15000006004D656D6F3336000200B00000
      001C0200009C000000140000000300000001000000000000000000FFFFFF1F2C
      02000000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF00000000000200
      000001000000000500417269616C000A00000000000000000002000000CC0002
      0000000000FFFFFF0000000002000000000000000000AB15000006004D656D6F
      333700020058010000080200009C000000140000000300020001000000000000
      000000FFFFFF1F2C0200000000000100000000000000FFFF0000000000020000
      0001000000000500417269616C000A00000000000000000000000000CC000200
      00000000FFFFFF00000000020000000000000000003116000006004D656D6F33
      38000200580100001C0200009C00000014000000030000000100000000000000
      0000FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000200
      0000CC00020000000000FFFFFF0000000002000000000000000000BE16000006
      004D656D6F3339000200FC01000008020000EC00000014000000030002000100
      0000000000000000FFFFFF1F2C02000000000001000E005B6F64735665642E22
      504F4C225D00000000FFFF00000000000200000001000000000500417269616C
      000A00000000000000000002000000CC00020000000000FFFFFF000000000200
      00000000000000005017000006004D656D6F3430000200FC0100001C020000EC
      000000140000000300000001000000000000000000FFFFFF1F2C020000000000
      01001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000020000
      00CC00020000000000FFFFFF0000000002000000000000000000E01700000600
      4D656D6F3234000200AC000000500200009C0000001400000003000200010000
      00000000000000FFFFFF1F2C020000000000010011005B6F64735665642E2244
      4F4C4F5450225D00000000FFFF00000000000200000001000000000500417269
      616C000A00000000000000000002000000CC00020000000000FFFFFF00000000
      020000000000000000006818000006004D656D6F3138000200AC000000640200
      009C000000140000000300000001000000000000000000FFFFFF1F2C02000000
      000001000900C4EEEBE6EDEEF1F2FC00000000FFFF0000000000020000000100
      0000000500417269616C000A00000000000000000002000000CC000200000000
      00FFFFFF0000000002000000000000000000E718000006004D656D6F32350002
      0054010000500200009C000000140000000300020001000000000000000000FF
      FFFF1F2C0200000000000100000000000000FFFF000000000002000000010000
      00000500417269616C000A00000000000000000000000000CC00020000000000
      FFFFFF00000000020000000000000000006D19000006004D656D6F3334000200
      54010000640200009C000000140000000300000001000000000000000000FFFF
      FF1F2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000002000000CC00
      020000000000FFFFFF0000000002000000000000000000FA19000006004D656D
      6F3431000200F801000050020000EC0000001400000003000200010000000000
      00000000FFFFFF1F2C02000000000001000E005B6F64735665642E224F545022
      5D00000000FFFF00000000000200000001000000000500417269616C000A0000
      0000000000000002000000CC00020000000000FFFFFF00000000020000000000
      000000008C1A000006004D656D6F3432000200F801000064020000EC00000014
      0000000300000001000000000000000000FFFFFF1F2C02000000000001001300
      D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF00000000000200
      000001000000000500417269616C000A00000000000000000002000000CC0002
      0000000000FFFFFF00000000020000000000000000001D1B000006004D656D6F
      3433000200AC000000FA0200009C000000140000000300020001000000000000
      000000FFFFFF1F2C020000000000010012005B6F64735665642E22444F4C4F54
      5034225D00000000FFFF00000000000200000001000000000500417269616C00
      0A00000000000000000002000000CC00020000000000FFFFFF00000000020000
      00000000000000A51B000006004D656D6F3434000200AC000000CE0200009C00
      0000140000000300000001000000000000000000FFFFFF1F2C02000000000001
      000900C4EEEBE6EDEEF1F2FC00000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000002000000CC00020000000000FFFF
      FF0000000002000000000000000000241C000006004D656D6F34350002005401
      0000BA0200009C000000140000000300020001000000000000000000FFFFFF1F
      2C0200000000000100000000000000FFFF000000000002000000010000000005
      00417269616C000A00000000000000000000000000CC00020000000000FFFFFF
      0000000002000000000000000000AA1C000006004D656D6F3436000200540100
      00CE0200009C000000140000000300000001000000000000000000FFFFFF1F2C
      02000000000001000700CFEEE4EFE8F1FC00000000FFFF000000000002000000
      01000000000500417269616C000A00000000000000000002000000CC00020000
      000000FFFFFF0000000002000000000000000000381D000006004D656D6F3437
      000200F8010000FA020000EC0000001400000003000200010000000000000000
      00FFFFFF1F2C02000000000001000F005B6F64735665642E224F545034225D00
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      000000000002000000CC00020000000000FFFFFF000000000200000000000000
      0000CA1D000006004D656D6F3438000200F8010000CE020000EC000000140000
      000300000001000000000000000000FFFFFF1F2C02000000000001001300D0E0
      F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF000000000002000000
      01000000000500417269616C000A00000000000000000002000000CC00020000
      000000FFFFFF00000000020000000000000000005B1E000006004D656D6F3439
      000200AC0000007C0200009C0000001400000003000200010000000000000000
      00FFFFFF1F2C020000000000010012005B6F64735665642E22444F4C4F545031
      225D00000000FFFF00000000000200000001000000000500417269616C000A00
      000000000000000002000000CC00020000000000FFFFFF000000000200000000
      0000000000E31E000006004D656D6F3530000200AC000000900200009C000000
      140000000300000001000000000000000000FFFFFF1F2C020000000000010009
      00C4EEEBE6EDEEF1F2FC00000000FFFF00000000000200000001000000000500
      417269616C000A00000000000000000002000000CC00020000000000FFFFFF00
      00000002000000000000000000621F000006004D656D6F353100020054010000
      7C0200009C000000140000000300020001000000000000000000FFFFFF1F2C02
      00000000000100000000000000FFFF0000000000020000000100000000050041
      7269616C000A00000000000000000000000000CC00020000000000FFFFFF0000
      000002000000000000000000E81F000006004D656D6F35320002005401000090
      0200009C000000140000000300000001000000000000000000FFFFFF1F2C0200
      0000000001000700CFEEE4EFE8F1FC00000000FFFF0000000000020000000100
      0000000500417269616C000A00000000000000000002000000CC000200000000
      00FFFFFF00000000020000000000000000007620000006004D656D6F35330002
      00F80100007C020000EC000000140000000300020001000000000000000000FF
      FFFF1F2C02000000000001000F005B6F64735665642E224F545031225D000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      00000002000000CC00020000000000FFFFFF0000000002000000000000000000
      0821000006004D656D6F3534000200F801000090020000EC0000001400000003
      00000001000000000000000000FFFFFF1F2C02000000000001001300D0E0F1F8
      E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF0000000000020000000100
      0000000500417269616C000A00000000000000000002000000CC000200000000
      00FFFFFF0000000002000000000000000000C021000005004D656D6F31000200
      D401000040000000E00000004A0000000300000001000000000000000000FFFF
      FF1F2C02000000000004001800CDE0F7E0EBFCEDE8EA205B6F64735665642E22
      4C4F4B225D0D00000D19005F5F5F5F5F5F5F5F5F5F5B6F64735665642E224E41
      4348225D0D000000000000FFFF00000000000200000001000000000500417269
      616C000C00000000000000000000000000CC00020000000000FFFFFF00000000
      020000000000000000005122000006004D656D6F3730000200D40100008C0000
      00E0000000140000000300000001000000000000000000FFFFFF1F2C0003020C
      00646420206D6F20207979797900010006005B444154455D00000000FFFF0000
      0000000200000001000000000500417269616C000C0000000000000000000200
      0000CC00020000000000FFFFFF0000000002000000000000000000E222000006
      004D656D6F3635000200D40100002C000000E000000014000000030000000100
      0000000000000000FFFFFF1F2C02000000000001001200D320D220C220C520D0
      20C620C420C020DE3A00000000FFFF0000000000020000000100000000050041
      7269616C000C00000002000000000000000000CC00020000000000FFFFFF0000
      000002000000000000000000BE23000005004D656D6F35000200850000002001
      0000E5010000180000000300000001000000000000000000FFFFFF1F2C020000
      00000001005E00EDE020EFE5F0E8EEE42063205B464F524D4154444154455449
      4D45282744442E4D4D2E59595959272C205B44415445315D295D20EFEE205B46
      4F524D41544441544554494D45282744442E4D4D2E59595959272C205B444154
      45325D295D00000000FFFF00000000000200000001000000000500417269616C
      000A0000000000000000000A000000CC00020000000000FFFFFF000000000200
      00000000000000004F24000006004D656D6F3536000200AC000000B90200009C
      000000140000000300020001000000000000000000FFFFFF1F2C020000000000
      010012005B6F64735665642E22444F4C4F545032225D00000000FFFF00000000
      000200000001000000000500417269616C000A00000000000000000002000000
      CC00020000000000FFFFFF0000000002000000000000000000D724000006004D
      656D6F3537000200AC0000000D0300009C000000140000000300000001000000
      000000000000FFFFFF1F2C02000000000001000900C4EEEBE6EDEEF1F2FC0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      0000000002000000CC00020000000000FFFFFF00000000020000000000000000
      005625000006004D656D6F353800020054010000F90200009C00000014000000
      0300020001000000000000000000FFFFFF1F2C02000000000001000000000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      00000000000000CC00020000000000FFFFFF0000000002000000000000000000
      DC25000006004D656D6F3539000200540100000D0300009C0000001400000003
      00000001000000000000000000FFFFFF1F2C02000000000001000700CFEEE4EF
      E8F1FC00000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000002000000CC00020000000000FFFFFF0000000002000000
      0000000000006A26000006004D656D6F3630000200F8010000B9020000EC0000
      00140000000300020001000000000000000000FFFFFF1F2C0200000000000100
      0F005B6F64735665642E224F545032225D00000000FFFF000000000002000000
      01000000000500417269616C000A00000000000000000002000000CC00020000
      000000FFFFFF0000000002000000000000000000FC26000006004D656D6F3631
      000200F80100000D030000EC0000001400000003000000010000000000000000
      00FFFFFF1F2C02000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EF
      E8F1E800000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000002000000CC00020000000000FFFFFF0000000002000000
      0000000000009627000005004D656D6F33000200580200001404000098000000
      140000000300000001000000000000000000FFFFFF1F2C02000000000001001C
      00F1F2F02E205B50414745235D20E8E7205B544F54414C50414745535D000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      000000090000000100020000000000FFFFFF000000000200000000000000FEFE
      FF020000000A002043617465676F72793100000000040073756D6D0001003000
      0000000000000000FC0000000000000000000000000000000058000ACF5E302E
      D2E2408D9AC395D66DE440}
  end
  object odsVed: TOracleDataSet
    SQL.Strings = (
      'select'
      '    :pol as pol,'
      '    :otp as otp,'
      '    fn_summ as summ,'
      '    :dolpol as dolpol,'
      '    :dolotp as dolotp,'
      '    :otp1 as otp1,'
      '    :dolotp4 as dolotp4,'
      '    :otp4 as otp4,'
      '    :otp2 as otp2,'
      '    :dolotp1 as dolotp1,'
      '    :dolotp2 as dolotp2,'
      '    tmedic.fc_name as medicname,'
      '    tei.fc_name as einame,'
      '    kol,'
      '    fn_price,'
      
        '    ASU.PKG_SMINI.READSTRING('#39'MANAGER_DOC'#39','#39'CLIENT_NAME'#39','#39#1051#1054#1050' "'#1042 +
        #1080#1090#1103#1079#1100'"'#39') as lok,'
      
        '    ASU.PKG_SMINI.READSTRING('#39'NACHLOK'#39','#39'FIO'#39','#39#1052#1072#1096#1091#1082#1086#1074' '#1042'.'#1044#39') as n' +
        'ach,'
      
        '    MED.PKGTMO.GETNAMEBYID(MED.PKG_MEDSES.GET_CURMO) as CURRENTM' +
        'O'
      '  from'
      '   (select /*+rule*/'
      '        sum((tdpc.fn_kol*tkart.fn_price)) as fn_summ,'
      '        sum(tdpc.fn_kol) as kol,'
      '        tmedic.medicid as medid,'
      '        tkart.fn_price'
      '      from MED.tdocs, MED.tdpc, MED.tkart, MED.tmedic'
      '      where --(moownerid=:amoid or mofromid=:amoid)'
      '            tdocs.fk_mogroupid_from = :aGroupID'
      '        and tdpc.kartid=tkart.kartid'
      '        and tdocs.dpid=tdpc.dpid'
      '--        and tdocs.dpid=:adpid'
      
        '--        and MED.PKG_PRIHRASH.Get_PrihRashPriznak(tdocs.fp_vid,' +
        ' tdocs.fp_vidmove, tdocs.fk_mogroupid_from, tdocs.fk_mogroupid_t' +
        'o, :aGroupID) < 0'
      
        '--        and (fp_vidmove=4 or fp_vidmove=5 OR fp_vidmove=7 OR f' +
        'p_vidmove=8)'
      
        '        and tdocs.fp_vid = 3 and tdocs.fp_vidmove = 8 and tdocs.' +
        'FN_SPISANIEVID = 3'
      '        and tkart.medicid=tmedic.medicid'
      '--        and tkart.fl_del=0'
      
        '        and TRUNC(tdocs.fd_data) between TRUNC(:date1) and TRUNC' +
        '(:date2)'
      '--        AND TMEDIC.FL_VISIBLE = 1'
      'group by  tmedic.medicid, tkart.fn_price'
      '--group by tmedic.medicid,fn_newprice'
      '   ),'
      '   MED.tmedic, MED.tei'
      '  where tmedic.eiid=tei.eiid'
      '    and medicid=medid'
      '    AND TMEDIC.FL_VISIBLE = 1'
      '  order by LOWER(tmedic.fc_name)')
    Optimize = False
    Variables.Data = {
      030000000D000000040000003A504F4C05000000000000000000000004000000
      3A4F5450050000000000000000000000070000003A444F4C504F4C0500000000
      00000000000000070000003A444F4C4F54500500000000000000000000000500
      00003A4F545031050000000000000000000000050000003A4F54503205000000
      0000000000000000080000003A444F4C4F545031050000000000000000000000
      080000003A444F4C4F545032050000000000000000000000080000003A444F4C
      4F545034050000000000000000000000050000003A4F54503405000000000000
      0000000000090000003A4147524F555049440300000000000000000000000600
      00003A44415445310C0000000000000000000000060000003A44415445320C00
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000120000000600000045494E414D45010000000000090000004D454449
      434E414D45010000000000030000004B4F4C01000000000003000000504F4C01
      0000000000030000004F545001000000000006000000444F4C504F4C01000000
      000006000000444F4C4F5450010000000000040000004F545031010000000000
      040000004F54503201000000000007000000444F4C4F54503101000000000007
      000000444F4C4F5450320100000000000400000053554D4D0100000000000300
      00004C4F4B010000000000040000004E41434801000000000007000000444F4C
      4F545034010000000000040000004F5450340100000000000900000043555252
      454E544D4F01000000000008000000464E5F5052494345010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 402
    Top = 220
  end
  object frDBdsVed: TfrDBDataSet
    DataSet = odsVed
    Left = 402
    Top = 172
  end
  object odsLastDate: TOracleDataSet
    SQL.Strings = (
      'select max(trunc(fd_data)) as data from MED.tdocs'
      'where fp_vid=2 and mofromid=:amoid'
      'and fd_data<:adata')
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A414D4F49440300000000000000000000000600
      00003A41444154410C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000400000044415441010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 400
    Top = 272
    object odsLastDateDATA: TDateTimeField
      FieldName = 'DATA'
    end
  end
  object frInvoice: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 464
    Top = 120
    ReportForm = {
      190000006D1B0000190000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF0000000000000100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      00009C000000F6020000D20000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C8000000140000000100000000000002003F0100000B004D61737465
      72446174613100020100000000BC010000F60200001800000031000500010000
      00000000000000FFFFFF1F000000000900667244426473566564000000000000
      00FFFF000000000002000000010000000000000001000000C800000014000000
      010000000000000200AC0100000D004D61737465724865616465723100020100
      00000084010000F6020000200000003000040001000000000000000000FFFFFF
      1F00000000000000000000000000FFFF00000000000200000001000000000000
      0001000000C800000014000000010000000000000200190200000D004D617374
      6572466F6F7465723200020100000000E4010000F6020000C800000030000600
      01000000000000000000FFFFFF1F00000000000000000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      000000DA02000005004D656D6F3200020086000000EC000000E4010000300000
      000300000001000000000000000000FFFFFF1F2C02000000000001002400CDE0
      EAEBE0E4EDE0FF20B9205B6F647353656C446F634D6F76652E2246435F444F43
      225D0004000500626567696E0D0B0020202073756D6D3A3D303B0D0100200D03
      00656E6400FFFF00000000000200000001000000000500417269616C00100000
      000200000000000A000000CC00020000000000FFFFFF00000000020000000000
      000000006103000005004D656D6F3700020014000000840100001C0000002000
      000003000F0001000000000000000000FFFFFF1F2C02000000000002000200B9
      200D0400EF2EEF2E00000000FFFF000000000002000000010000000005004172
      69616C000A0000000000000000000A000000CC00020000000000FFFFFF000000
      0002000000000000000000EB03000005004D656D6F3800020030000000840100
      00040100002000000003000F0001000000000000000000FFFFFF1F2C02000000
      000001000C00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF0000000000020000
      0001000000000500417269616C000A0000000000000000000A000000CC000200
      00000000FFFFFF00000000020000000000000000007104000005004D656D6F39
      00020034010000840100004C0000002000000003000F00010000000000000000
      00FFFFFF1F2C02000000000001000800C5E42E20C8E7EC2E00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000A00
      0000CC00020000000000FFFFFF0000000002000000000000000000FA04000006
      004D656D6F313000020080010000840100004C0000002000000003000F000100
      0000000000000000FFFFFF1F2C02000000000001000A00CAEEEBE8F7E5F1F2E2
      EE00000000FFFF00000000000200000001000000000500417269616C000A0000
      000000000000000A000000CC00020000000000FFFFFF00000000020000000000
      000000007D05000006004D656D6F3133000200CC010000840100005000000020
      00000003000F0001000000000000000000FFFFFF1F2C02000000000001000400
      D6E5EDE000000000FFFF00000000000200000001000000000500417269616C00
      0A0000000000000000000A000000CC00020000000000FFFFFF00000000020000
      000000000000000106000006004D656D6F31340002001C020000840100005800
      00002000000003000F0001000000000000000000FFFFFF1F2C02000000000001
      000500D1F3ECECE000000000FFFF000000000002000000010000000005004172
      69616C000A0000000000000000000A000000CC00020000000000FFFFFF000000
      00020000000000000000008A06000006004D656D6F313500020014000000BC01
      00001C0000001800000003000F0001000000000000000000FFFFFF1F2C020000
      00000001000A005B43555252454E54235D00000000FFFF000000000002000000
      01000000000500417269616C00080000000000000000000A000000CC00020000
      000000FFFFFF00000000020000000000000000001D07000006004D656D6F3136
      00020030000000BC010000040100001800000003000F00010000000000000000
      00FFFFFF1F2C020000000000010014005B6F64735665642E224D454449434E41
      4D45225D00000000FFFF00000000000200000001000000000500417269616C00
      0800000000000000000008000000CC00020000000000FFFFFF00000000020000
      00000000000000AD07000006004D656D6F313700020034010000BC0100004C00
      00001800000003000F0001000000000000000000FFFFFF1F2C02000000000001
      0011005B6F64735665642E2245494E414D45225D00000000FFFF000000000002
      00000001000000000500417269616C00080000000000000000000A000000CC00
      020000000000FFFFFF00000000020000000000000000003A08000006004D656D
      6F313900020080010000BC0100004C0000001800000003000F00010000000000
      00000000FFFFFF1F2C02000000000001000E005B6F64735665642E224B4F4C22
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      000000000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000E608000006004D656D6F3231000200CC010000BC0100005000000018
      00000003000F0001000000000000000000FFFFFF1F2C02000000000001002D00
      5B464F524D4154464C4F4154282730F02E3030EA2E272C205B6F64735665642E
      22666E5F7072696365225D295D00000000FFFF00000000000200000001000000
      000500417269616C00080000000000000000000A000000CC00020000000000FF
      FFFF0000000002000000000000000000BD09000006004D656D6F32320002001C
      020000BC010000580000001800000003000F0001000000000000000000FFFFFF
      1F2C020000000000010029005B464F524D4154464C4F4154282730F02E3030EA
      2E272C205B6F64735665642E2253554D4D225D295D0003000500626567696E0D
      1F00202073756D6D3A3D73756D6D2B285B6F64735665642E2253554D4D225D29
      3B0D0300656E6400FFFF00000000000200000001000000000500417269616C00
      080000000000000000000A000000CC00020000000000FFFFFF00000000020000
      00000000000000540A000006004D656D6F313100020074020000840100006800
      00002000000003000F0001000000000000000000FFFFFF1F2C02000000000001
      001800CEF2ECE5F2EAE020EE20E7E0EFE8F1E820E220EAEDE8E3F300000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      000A000000CC00020000000000FFFFFF0000000002000000000000000000D30A
      000006004D656D6F313200020074020000BC010000680000001800000003000F
      0001000000000000000000FFFFFF1F2C0200000000000100000000000000FFFF
      00000000000200000001000000000500417269616C0008000000000000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000740B00
      0005004D656D6F330002002201000024010000AC000000180000000300000001
      000000000000000000FFFFFF1F2C02000000000001001900CEF2205B6F647353
      656C446F634D6F76652E2244415441225D00000000FFFF000000000002000000
      01000000000F0054696D6573204E657720526F6D616E000C0000000000000000
      0002000000CC00020000000000FFFFFF0000000002000000000000000000230C
      000005004D656D6F34000200C400000040010000680100001400000003000000
      01000000000000000000FFFFFF1F2C02000000000001002700EFEE20EAE0E1E8
      EDE5F2F33A205B6F647353656C446F634D6F76652E224E414D4546524F4D225D
      00000000FFFF00000000000200000001000000000F0054696D6573204E657720
      526F6D616E000C00000000000000000002000000CC00020000000000FFFFFF00
      00000002000000000000000000B40C000005004D656D6F360002002400000020
      02000058000000140000000300000001000000000000000000FFFFFF1F2C0200
      0000000001000900CEF2EFF3F1F2E8EB3A00000000FFFF000000000002000000
      01000000000F0054696D6573204E657720526F6D616E000B0000000000000000
      0001000000CC00020000000000FFFFFF0000000002000000000000000000450D
      000006004D656D6F323300020024000000480200005800000014000000030000
      0001000000000000000000FFFFFF1F2C02000000000001000800CFEEEBF3F7E8
      EB3A00000000FFFF00000000000200000001000000000F0054696D6573204E65
      7720526F6D616E000C00000000000000000001000000CC00020000000000FFFF
      FF0000000002000000000000000000C20D000006004D656D6F32360002001400
      0000E40100001C0000002000000003000F0001000000000000000000FFFFFF1F
      2C020000000000000000000000FFFF0000000000020000000100000000050041
      7269616C00080000000000000000000A000000CC00020000000000FFFFFF0000
      000002000000000000000000460E000006004D656D6F323700020030000000E4
      010000040100002000000003000F0001000000000000000000FFFFFF1F2C0200
      0000000001000500C8F2EEE3EE00000000FFFF00000000000200000001000000
      000500417269616C000800000002000000000008000000CC00020000000000FF
      FFFF0000000002000000000000000000C30E000006004D656D6F323800020034
      010000E40100004C0000002000000003000F0001000000000000000000FFFFFF
      1F2C020000000000000000000000FFFF00000000000200000001000000000500
      417269616C00080000000000000000000A000000CC00020000000000FFFFFF00
      00000002000000000000000000400F000006004D656D6F333000020080010000
      E40100004C0000002000000003000F0001000000000000000000FFFFFF1F2C02
      0000000000000000000000FFFF00000000000200000001000000000500417269
      616C00080000000000000000000A000000CC00020000000000FFFFFF00000000
      02000000000000000000BD0F000006004D656D6F3331000200CC010000E40100
      00500000002000000003000F0001000000000000000000FFFFFF1F2C02000000
      0000000000000000FFFF00000000000200000001000000000500417269616C00
      080000000000000000000A000000CC00020000000000FFFFFF00000000020000
      000000000000005A10000006004D656D6F33320002001C020000E40100005800
      00002000000003000F0001000000000000000000FFFFFF1F2C02000000000001
      001E005B464F524D4154464C4F4154282730F02E3030EA2E272C2073756D6D29
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      000200000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000D910000006004D656D6F333300020074020000E40100006800000020
      00000003000F0001000000000000000000FFFFFF1F2C02000000000001000000
      00000000FFFF00000000000200000001000000000500417269616C0008000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      0000006911000006004D656D6F333500020084000000200200009C0000001400
      00000300020001000000000000000000FFFFFF1F2C020000000000010011005B
      6F64735665642E22444F4C504F4C225D00000000FFFF00000000000200000001
      000000000500417269616C000A00000000000000000002000000CC0002000000
      0000FFFFFF0000000002000000000000000000F111000006004D656D6F333600
      020084000000340200009C000000140000000300000001000000000000000000
      FFFFFF1F2C02000000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000200
      0000CC00020000000000FFFFFF00000000020000000000000000007012000006
      004D656D6F33370002002C010000200200009C00000014000000030002000100
      0000000000000000FFFFFF1F2C0200000000000100000000000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000000000
      00CC00020000000000FFFFFF0000000002000000000000000000F61200000600
      4D656D6F33380002002C010000340200009C0000001400000003000000010000
      00000000000000FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      00000002000000CC00020000000000FFFFFF0000000002000000000000000000
      8313000006004D656D6F3339000200D001000020020000EC0000001400000003
      00020001000000000000000000FFFFFF1F2C02000000000001000E005B6F6473
      5665642E22504F4C225D00000000FFFF00000000000200000001000000000500
      417269616C000A00000000000000000002000000CC00020000000000FFFFFF00
      000000020000000000000000001514000006004D656D6F3430000200D0010000
      34020000EC000000140000000300000001000000000000000000FFFFFF1F2C02
      000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      000002000000CC00020000000000FFFFFF0000000002000000000000000000A5
      14000006004D656D6F323400020084000000480200009C000000140000000300
      020001000000000000000000FFFFFF1F2C020000000000010011005B6F647356
      65642E22444F4C4F5450225D00000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000002000000CC00020000000000FFFF
      FF00000000020000000000000000002D15000006004D656D6F31380002008400
      00005C0200009C000000140000000300000001000000000000000000FFFFFF1F
      2C02000000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000002000000CC00
      020000000000FFFFFF0000000002000000000000000000AC15000006004D656D
      6F32350002002C010000480200009C0000001400000003000200010000000000
      00000000FFFFFF1F2C0200000000000100000000000000FFFF00000000000200
      000001000000000500417269616C000A00000000000000000000000000CC0002
      0000000000FFFFFF00000000020000000000000000003216000006004D656D6F
      33340002002C0100005C0200009C000000140000000300000001000000000000
      000000FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000002
      000000CC00020000000000FFFFFF0000000002000000000000000000BF160000
      06004D656D6F3431000200D001000048020000EC000000140000000300020001
      000000000000000000FFFFFF1F2C02000000000001000E005B6F64735665642E
      224F5450225D00000000FFFF0000000000020000000100000000050041726961
      6C000A00000000000000000002000000CC00020000000000FFFFFF0000000002
      0000000000000000005117000006004D656D6F3432000200D00100005C020000
      EC000000140000000300000001000000000000000000FFFFFF1F2C0200000000
      0001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000200
      0000CC00020000000000FFFFFF0000000002000000000000000000E217000006
      004D656D6F343900020084000000700200009C00000014000000030002000100
      0000000000000000FFFFFF1F2C020000000000010012005B6F64735665642E22
      444F4C4F545031225D00000000FFFF0000000000020000000100000000050041
      7269616C000A00000000000000000002000000CC00020000000000FFFFFF0000
      0000020000000000000000006A18000006004D656D6F35300002008400000084
      0200009C000000140000000300000001000000000000000000FFFFFF1F2C0200
      0000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF000000000002000000
      01000000000500417269616C000A00000000000000000002000000CC00020000
      000000FFFFFF0000000002000000000000000000E918000006004D656D6F3531
      0002002C010000700200009C0000001400000003000200010000000000000000
      00FFFFFF1F2C0200000000000100000000000000FFFF00000000000200000001
      000000000500417269616C000A00000000000000000000000000CC0002000000
      0000FFFFFF00000000020000000000000000006F19000006004D656D6F353200
      02002C010000840200009C000000140000000300000001000000000000000000
      FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF00000000
      000200000001000000000500417269616C000A00000000000000000002000000
      CC00020000000000FFFFFF0000000002000000000000000000FD19000006004D
      656D6F3533000200D001000070020000EC000000140000000300020001000000
      000000000000FFFFFF1F2C02000000000001000F005B6F64735665642E224F54
      5031225D00000000FFFF00000000000200000001000000000500417269616C00
      0A00000000000000000002000000CC00020000000000FFFFFF00000000020000
      000000000000008F1A000006004D656D6F3534000200D001000084020000EC00
      0000140000000300000001000000000000000000FFFFFF1F2C02000000000001
      001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF00000000
      000200000001000000000500417269616C000A00000000000000000002000000
      CC00020000000000FFFFFF0000000002000000000000000000201B000005004D
      656D6F3500020024000000700200005800000014000000030000000100000000
      0000000000FFFFFF1F2C02000000000001000900CFF0EEE2E5F0E8EB3A000000
      00FFFF00000000000200000001000000000F0054696D6573204E657720526F6D
      616E000C00000000000000000001000000CC00020000000000FFFFFF00000000
      0200000000000000FEFEFF020000000A002043617465676F7279310000000004
      0073756D6D000000000000000000000000FC0100000000000000000000000000
      00000058003F2C5F302ED2E2408D9AC395D66DE440}
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmMoveList\'
    AfterSavePlacement = FormStorageAfterSavePlacement
    AfterRestorePlacement = FormStorageAfterRestorePlacement
    StoredProps.Strings = (
      'cxGridRashKartDBTableView1FC_EDIZM.Width'
      'cxGridRashKartDBTableView1fc_inv_nomer.Width'
      'cxGridRashKartDBTableView1FC_QUOTA_CODE.Width'
      'cxGridRashKartDBTableView1FC_SERIAL.Width'
      'cxGridRashKartDBTableView1FD_DATE_SPIS.Width'
      'cxGridRashKartDBTableView1FD_GODEN.Width'
      'cxGridRashKartDBTableView1FL_JNVLS.Width'
      'cxGridRashKartDBTableView1FN_KOL.Width'
      'cxGridRashKartDBTableView1FN_NACENKA.Width'
      'cxGridRashKartDBTableView1FN_NDS.Width'
      'cxGridRashKartDBTableView1FN_PARTY_NUM.Width'
      'cxGridRashKartDBTableView1FN_PRICE.Width'
      'cxGridRashKartDBTableView1FN_PRICE_MNF.Width'
      'cxGridRashKartDBTableView1KARTID.Width'
      'cxGridRashKartDBTableView1MEDICID.Width'
      'cxGridRashKartDBTableView1NAMEKART.Width'
      'cxGridRashKartDBTableView1SUMM.Width'
      'cxGridRashKartDBTableView1FL_MIBP.Visible'
      'cxGridRashKartDBTableView1FL_MIBP.Width'
      'cxGridRashKartDBTableView1FC_REMARK.Visible'
      'cxGridRashKartDBTableView1FC_REMARK.Width'
      'cxGridRashKartDBTableView1FC_INTERNATIONAL_NAME.Visible'
      'cxGridRashKartDBTableView1FC_INTERNATIONAL_NAME.Width'
      'cxGridMoveListDBTableView1FC_PROFIL.Visible'
      'cxGridMoveListDBTableView1FC_PROFIL.Width'
      'chbDate1.Checked'
      'chbDate2.Checked'
      'dedDate1.Date'
      'dedDate2.Date')
    StoredValues = <>
    Left = 752
    Top = 384
  end
  object frInvoice2: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    Title = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077
    RebuildPrinter = False
    OnGetValue = frInvoice2GetValue
    OnUserFunction = frInvoice2UserFunction
    OnObjectClick = frInvoice2ObjectClick
    OnMouseOverObject = frInvoice2MouseOverObject
    Left = 464
    Top = 172
    ReportForm = {
      190000008F310000190000000001000100FFFFFFFFFF09000000340800009A0B
      00002400000024000000240000002400000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      00001C000000F60200001D0100003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D004D61737465
      72486561646572310002010000000044010000F6020000320000007000040001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200690200000B004D617374657244617461310002010000000090010000F602
      0000110000003100050001000000000000000000FFFFFF1F000000000D006672
      44426473496E766F6963650000000006000500626567696E0D5E002020696620
      5B46494E414C504153535D20616E6420285B50414745235D203D205B544F5441
      4C50414745535D2D312920414E4420285B4652454553504143455D203C205265
      706F727453756D6D617279312E48656967687429207468656E0D0C0020202020
      4E6577506167653B0D1D002F2F202020207768696C6520467265655370616365
      203E20323020646F0D19002F2F20202020202053686F7742616E64284368696C
      6431293B0D0300656E6400FFFF00000000000200000001000000000000000100
      0000C800000014000000010000000000000200D70200000E005265706F727453
      756D6D6172793100020100000000EC010000F60200003A010000300001000100
      0000000000000000FFFFFF1F00000000000000000000000000FFFF0000000000
      02000000010000000000000001000000C8000000140000000100000000000002
      00440300000D004D6173746572466F6F7465723100020100000000C0010000F6
      020000110000003000060001000000000000000000FFFFFF1F00000000000000
      000000000000FFFF000000000002000000010000000000000001000000C80000
      0014000000010000000000000200AF0300000B0050616765466F6F7465723100
      020100000000F4030000F6020000150000003000030001000000000000000000
      FFFFFF1F00000000000000000000000000FFFF00000000000200000001000000
      0000000001000000C8000000140000000100000000000000003104000005004D
      656D6F320002009802000089000000380000001500000003000F000100000000
      0000000000FFFFFF1F2C02000000000001000400EAEEE4FB00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000200000000000A00
      0000CC00020000000000FFFFFF0000000002000000000000000000AD04000005
      004D656D6F3300020098020000B2000000380000001400000003000F00010000
      00000000000000FFFFFF1F2C020000000000000000000000FFFF000000000002
      00000001000000000500417269616C000A0000000200000000000A000000CC00
      020000000000FFFFFF00000000020000000000000000002905000005004D656D
      6F3400020098020000C6000000380000001400000003000F0001000000000000
      000000FFFFFF1F2C020000000000000000000000FFFF00000000000200000001
      000000000500417269616C000A0000000200000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000A505000005004D656D6F350002
      0098020000DA000000380000001400000003000F0001000000000000000000FF
      FFFF1F2C020000000000000000000000FFFF0000000000020000000100000000
      0500417269616C000A0000000200000000000A000000CC00020000000000FFFF
      FF00000000020000000000000000002A06000005004D656D6F36000200980200
      009E000000380000001400000003000F0001000000000000000000FFFFFF1F2C
      020000000000010007003035303432333400000000FFFF000000000002000000
      01000000000500417269616C00080000000000000000000A000000CC00020000
      000000FFFFFF0000000002000000000000000000A606000005004D656D6F3700
      020098020000EE000000380000001C00000003000F0001000000000000000000
      FFFFFF1F2C020000000000000000000000FFFF00000000000200000001000000
      000500417269616C000A0000000200000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000002B07000005004D656D6F390002005F02
      00009E00000037000000150000000300000001000000000000000000FFFFFF1F
      2C02000000000001000700EFEE20CECAD3C400000000FFFF0000000000020000
      0001000000000500417269616C000800000000000000000008000000CC000200
      00000000FFFFFF0000000002000000000000000000AD07000005004D656D6F38
      0002005F020000B4000000370000001400000003000000010000000000000000
      00FFFFFF1F2C02000000000001000400C4E0F2E000000000FFFF000000000002
      00000001000000000500417269616C000800000000000000000008000000CC00
      020000000000FFFFFF00000000020000000000000000003308000006004D656D
      6F31300002005F020000F1000000370000001500000003000000010000000000
      00000000FFFFFF1F2C02000000000001000700EFEE20CECACFCE00000000FFFF
      00000000000200000001000000000500417269616C0009000000000000000000
      08000000CC00020000000000FFFFFF0000000002000000000000000000B80800
      0006004D656D6F31310002005F020000DC000000370000001400000003000000
      01000000000000000000FFFFFF1F2C02000000000001000600EFEE20CAD1CF00
      000000FFFF00000000000200000001000000000500417269616C000900000000
      000000000008000000CC00020000000000FFFFFF000000000200000000000000
      00003E09000006004D656D6F31320002005F020000C800000037000000140000
      000300000001000000000000000000FFFFFF1F2C02000000000001000700EFEE
      20CECACFCE00000000FFFF00000000000200000001000000000500417269616C
      000800000000000000000008000000CC00020000000000FFFFFF000000000200
      0000000000000000DF09000006004D656D6F3133000200600000008B000000EC
      000000140000000300000001000000000000000000FFFFFF1F2C020000000000
      01001800CDC0CACBC0C4CDC0DF2028D2D0C5C1CEC2C0CDC8C52920B900000000
      FFFF00000000000200000001000000000F0054696D6573204E657720526F6D61
      6E000C00000000000000000008000000CC00020000000000FFFFFF0000000002
      000000000000000000800A000006004D656D6F3134000200500100008B000000
      98000000140000000300020001000000000000000000FFFFFF1F2C0200000000
      00010018005B6F647353656C446F634D6F76652E2246435F444F43225D000000
      00FFFF00000000000200000001000000000F0054696D6573204E657720526F6D
      616E000C0000000000000000000A000000CC00020000000000FFFFFF00000000
      02000000000000000000120B000006004D656D6F3135000200F60100009F0000
      003C000000100000000300000001000000000000000000FFFFFF1F2C02000000
      000001000900D4EEF0ECE02034333400000000FFFF0000000000020000000100
      0000000F0054696D6573204E657720526F6D616E000800000000000000000000
      000000CC00020000000000FFFFFF0000000002000000000000000000B10B0000
      06004D656D6F313600020024000000B800000095000000110000000300000001
      000000000000000000FFFFFF1F2C02000000000001001600D3F7E5F0E5E6E4E5
      EDE8E520EFEEEBF3F7E0F2E5EBFC00000000FFFF000000000002000000010000
      00000F0054696D6573204E657720526F6D616E000A0000000000000000000000
      0000CC00020000000000FFFFFF0000000002000000000000000000530C000006
      004D656D6F313800020024000000D8000000A400000012000000030000000100
      0000000000000000FFFFFF1F2C02000000000001001900D1F2F0F3EAF2F3F0ED
      EEE520EFEEE4F0E0E7E4E5EBE5EDE8E500000000FFFF00000000000200000001
      000000000F0054696D6573204E657720526F6D616E000A000000000000000000
      10000000CC00020000000000FFFFFF0000000002000000000000000000FB0C00
      0006004D656D6F31390002002400000008010000C50000001400000003000000
      01000000000000000000FFFFFF1F2C02000000000001001F00CCE0F2E5F0E8E0
      EBFCEDEEE520EEF2E2E5F2F1F2E2E5EDEDEEE520EBE8F6EE00000000FFFF0000
      0000000200000001000000000F0054696D6573204E657720526F6D616E000A00
      000000000000000010000000CC00020000000000FFFFFF000000000200000000
      00000000009C0D000006004D656D6F3230000200EC000000070100004C010000
      140000000300020001000000000000000000FFFFFF1F2C020000000000010018
      005B6F647353656C446F634D6F76652E224E414D45544F225D00000000FFFF00
      000000000200000001000000000F0054696D6573204E657720526F6D616E000A
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      000000000000340E000006004D656D6F3231000200480100001C0100007C0000
      00140000000300000001000000000000000000FFFFFF1F2C0200000000000100
      0F00C4EEEBE6EDEEF1F2FC202F20D4C8CE00000000FFFF000000000002000000
      01000000000F0054696D6573204E657720526F6D616E000A0000000000000000
      0002000000CC00020000000000FFFFFF0000000002000000000000000000C90E
      000006004D656D6F34350002004700000044010000CD0000003200000003000F
      002C010000000000000000FFFFFF1F2C02000000000001000C00CDE0E8ECE5ED
      EEE2E0EDE8E500000000FFFF00000000000200000001000000000F0054696D65
      73204E657720526F6D616E000A0000000200000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000660F000006004D656D6F373300
      02003E01000044010000580000002100000003000F002C010000000000000000
      FFFFFF1F2C02000000000001001400C1F3F5E3E0EBF2E5F0F1EAE0FF20E7E0EF
      E8F1FC00000000FFFF00000000000200000001000000000F0054696D6573204E
      657720526F6D616E000A0000000200000000000A000000CC00020000000000FF
      FFFF0000000002000000000000000000F90F000006004D656D6F373400020096
      01000044010000910000002100000003000F002C010000000000000000FFFFFF
      1F2C02000000000001000A00CAEEEBE8F7E5F1F2E2EE00000000FFFF00000000
      000200000001000000000F0054696D6573204E657720526F6D616E000A000000
      0200000000000A000000CC00020000000000FFFFFF0000000002000000000000
      0000008710000006004D656D6F32320002002400000044010000230000003200
      000003000F002C010000000000000000FFFFFF1F2C02000000000001000500B9
      20EF2FEF00000000FFFF00000000000200000001000000000F0054696D657320
      4E657720526F6D616E000A0000000200000000000A000000CC00020000000000
      FFFFFF00000000020000000000000000001B11000006004D656D6F3233000200
      2702000044010000420000003200000003000F002C010000000000000000FFFF
      FF1F2C02000000000002000500D6E5EDE02C0D0300F0F3E100000000FFFF0000
      0000000200000001000000000F0054696D6573204E657720526F6D616E000A00
      00000200000000000A000000CC00020000000000FFFFFF000000000200000000
      0000000000A911000006004D656D6F32340002003E010000650100002A000000
      1100000003000F002C010000000000000000FFFFFF1F2C020000000000010005
      00C4E5E1E5F200000000FFFF00000000000200000001000000000F0054696D65
      73204E657720526F6D616E00080000000200000000000A000000CC0002000000
      0000FFFFFF00000000020000000000000000003812000006004D656D6F323500
      020068010000650100002E0000001100000003000F002C010000000000000000
      FFFFFF1F2C02000000000001000600CAF0E5E4E8F200000000FFFF0000000000
      0200000001000000000F0054696D6573204E657720526F6D616E000800000002
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      0000CC12000006004D656D6F3330000200960100006501000046000000110000
      0001000F002C010000000000000000FFFFFF1F2C02000000000001000B00C7E0
      F2F0E5E1EEE2E0EDEE00000000FFFF00000000000200000001000000000F0054
      696D6573204E657720526F6D616E00080000000200000000000A000000CC0002
      0000000000FFFFFF00000000020000000000000000005D13000006004D656D6F
      3331000200DC010000650100004B0000001100000003000F002C010000000000
      000000FFFFFF1F2C02000000000001000800CEF2EFF3F9E5EDEE00000000FFFF
      00000000000200000001000000000F0054696D6573204E657720526F6D616E00
      080000000200000000000A000000CC00020000000000FFFFFF00000000020000
      00000000000000F213000006004D656D6F333200020069020000440100006700
      00003200000003000F002C010000000000000000FFFFFF1F2C02000000000002
      000600D1F3ECECE02C0D0300F0F3E100000000FFFF0000000000020000000100
      0000000F0054696D6573204E657720526F6D616E000A0000000200000000000A
      000000CC00020000000000FFFFFF000000000200000000000000000083140000
      06004D656D6F323600020014010000440100002A0000003200000007000F002C
      010000000000000000FFFFFF1F2C02000000000001000800C5E42E20E8E7EC2E
      00000000FFFF00000000000200000001000000000F0054696D6573204E657720
      526F6D616E000A0000000200000000000A000000CC00020000000000FFFFFF00
      00000002000000000000000000A115000006004D656D6F323700020047000000
      90010000CD0000001100000003000F002C010000000000000000FFFFFF1F2C02
      000000000001001D005B6F6473496E766F696365322E2246435F4D454449435F
      4E414D45225D0003000500626567696E0D68002F2F2020696620285B6F647349
      6E766F696365322E2246435F53455249414C225D203C3E20272729207468656E
      207354656D70203A3D20272C27202B205B6F6473496E766F696365322E224643
      5F53455249414C225D20656C7365207354656D70203A3D2027273B0D0300656E
      6400FFFF00000000000200000001000000000F0054696D6573204E657720526F
      6D616E000C00000000000000000008000000CC00020000000000FFFFFF000000
      00020000000000000000003116000006004D656D6F3238000200240000009001
      0000230000001100000003000F002C010000000000000000FFFFFF1F2C020000
      000000010007005B4C494E45235D00000000FFFF000000000002000000010000
      00000F0054696D6573204E657720526F6D616E000A0000000000000000000A00
      0000CC00020000000000FFFFFF00000000020000000000000000006B17000006
      004D656D6F32390002002702000090010000420000001100000003000F002C01
      0000000000000000FFFFFF1F2C02030100000001001C005B6F6473496E766F69
      6365322E22464E5F4156475F5052494345225D0003000500626567696E0D8500
      2F2F20206966205B6F64735265706F72742E22464E5F4B4F4C225D203D202D31
      207468656E2074656D705072696365203A3D20272720656C73652074656D7050
      72696365203A3D20464F524D4154464C4F41542827302E3030272C205B6F6473
      5265706F72742E2253554D4D225D2F5B6F64735265706F72742E22464E5F4B4F
      4C225D293B0D0300656E6400FFFF00000000000200000001000000000F005469
      6D6573204E657720526F6D616E000A00000000000000000009000000CC000200
      00000000FFFFFF0000000002000000000000000000F217000006004D656D6F33
      330002003E010000900100002A0000001100000003000F002C01000000000000
      0000FFFFFF1F2C020000000000000000000000FFFF0000000000020000000100
      0000000F0054696D6573204E657720526F6D616E000C0000000000000000000A
      000000CC00020000000000FFFFFF000000000200000000000000000079180000
      06004D656D6F333400020068010000900100002E0000001100000003000F002C
      010000000000000000FFFFFF1F2C020000000000000000000000FFFF00000000
      000200000001000000000F0054696D6573204E657720526F6D616E000C000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      0000009619000006004D656D6F33350002009601000090010000460000001100
      000001000F002C010000000000000000FFFFFF1F2C02020100000001001B005B
      6F6473496E766F696365322E22464E5F545245425F4B4F4C225D000300050062
      6567696E0D69002F2F20206966205B6F64735265706F72742E22464E5F545245
      424B4F4C225D203D202D31207468656E2074656D70547265624B6F6C203A3D20
      272720656C73652074656D70547265624B6F6C203A3D205B6F64735265706F72
      742E22464E5F545245424B4F4C225D3B0D0300656E6400FFFF00000000000200
      000001000000000F0054696D6573204E657720526F6D616E000A000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      A51A000006004D656D6F3336000200DC010000900100004B0000001100000003
      000F002C010000000000000000FFFFFF1F2C02020100000001001D005B6F6473
      496E766F696365322E22464E5F564944414E4F5F4B4F4C225D00030005006265
      67696E0D59002F2F20206966205B6F64735265706F72742E22464E5F4B4F4C22
      5D203D202D31207468656E2074656D704B6F6C203A3D20272720656C73652074
      656D704B6F6C203A3D205B6F64735265706F72742E22464E5F4B4F4C225D3B0D
      0300656E6400FFFF00000000000200000001000000000F0054696D6573204E65
      7720526F6D616E000A0000000000000000000A000000CC00020000000000FFFF
      FF0000000002000000000000000000F01B000006004D656D6F33370002006902
      000090010000670000001100000003000F002C010000000000000000FFFFFF1F
      2C02030100000001001D005B6F6473496E766F696365322E22464E5F56494441
      4E4F5F53554D225D0004000500626567696E0D6A002F2F20206966205B6F6473
      5265706F72742E2253554D4D225D203D202D31207468656E2074656D7053756D
      203A3D20272720656C73652074656D7053756D203A3D20464F524D4154464C4F
      41542827302E3030272C205B6F64735265706F72742E2253554D4D225D293B0D
      28002F2F20202020693131203A3D20693131202B205B6F6473496E766F696365
      322E2253554D4D225D3B0D0300656E6400FFFF00000000000200000001000000
      000F0054696D6573204E657720526F6D616E000A000000000000000000090000
      00CC00020000000000FFFFFF0000000002000000000000000000961C00000600
      4D656D6F333800020014010000900100002A0000001100000007000F002C0100
      00000000000000FFFFFF1F2C02000000000001001D005B6F6473496E766F6963
      65322E2246435F4544495A4D5F4E414D45225D00000000FFFF00000000000200
      000001000000000F0054696D6573204E657720526F6D616E000A000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      2B1D000006004D656D6F33390002002000000000020000A80000001000000003
      00000001000000000000000000FFFFFF1F2C02000000000001001600C7E0E2E5
      E4F3FEF9E8E920EEF2E4E5EBE5EDE8E5EC3A00000000FFFF0000000000020000
      0001000000000500417269616C000A0000000000000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000B31D000006004D656D6F34
      3000020020000000300200004000000010000000030000000100000000000000
      0000FFFFFF1F2C02000000000001000900CEF2EFF3F1F2E8EB3A00000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      0A000000CC00020000000000FFFFFF00000000020000000000000000003A1E00
      0006004D656D6F34310002002000000090020000400000001000000003000000
      01000000000000000000FFFFFF1F2C02000000000001000800CFEEEBF3F7E8EB
      3A00000000FFFF00000000000200000001000000000500417269616C000A0000
      000000000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000EF1E000006004D656D6F343200020024020000FA010000A000000014
      0000000300020001000000000000000000FFFFFF1F2C02000000000001003600
      5B464F524D41544441544554494D452827272722272764642727222727206D6D
      6D6D2079797979202727E32E2727272C44415445295D00000000FFFF00000000
      000200000001000000000500417269616C000A00000000000000000009000000
      CC00020000000000FFFFFF0000000002000000000000000000A41F000006004D
      656D6F3433000200240200002D020000A0000000140000000300020001000000
      000000000000FFFFFF1F2C020000000000010036005B464F524D415444415445
      54494D452827272722272764642727222727206D6D6D6D2079797979202727E3
      2E2727272C44415445295D00000000FFFF000000000002000000010000000005
      00417269616C000A00000000000000000009000000CC00020000000000FFFFFF
      00000000020000000000000000005920000006004D656D6F3434000200230200
      005F020000A0000000140000000300020001000000000000000000FFFFFF1F2C
      020000000000010036005B464F524D41544441544554494D4528272727222727
      64642727222727206D6D6D6D2079797979202727E32E2727272C44415445295D
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      00000000000009000000CC00020000000000FFFFFF0000000002000000000000
      0000000821000006004D656D6F3436000200C000000010020000300100001000
      00000300080001000000000000000000FFFFFF1F2C0200000000000100300020
      202020202028EFEEE4EFE8F1FC29202020202020202020202020202020202020
      2020202020202020202028D4C8CE2900000000FFFF0000000000020000000100
      0000000500417269616C000800000000000000000008000000CC000200000000
      00FFFFFF0000000002000000000000000000D721000006004D656D6F34370002
      00600000004002000090010000100000000300080001000000000000000000FF
      FFFF1F2C02000000000001005000202020202020202020202020202020202020
      20202020202020202028EFEEE4EFE8F1FC292020202020202020202020202020
      2020202020202020202020202020202020202020202020202028D4C8CE290000
      0000FFFF00000000000200000001000000000500417269616C00080000000000
      0000000008000000CC00020000000000FFFFFF00000000020000000000000000
      00A622000006004D656D6F343800020060000000A00200009001000010000000
      0300080001000000000000000000FFFFFF1F2C02000000000001005000202020
      20202020202020202020202020202020202020202020202028EFEEE4EFE8F1FC
      2920202020202020202020202020202020202020202020202020202020202020
      202020202020202028D4C8CE2900000000FFFF00000000000200000001000000
      000500417269616C000800000000000000000008000000CC00020000000000FF
      FFFF00000000020000000000000000004723000006004D656D6F343900020025
      000000EB000000A0000000110000000300000001000000000000000000FFFFFF
      1F2C02000000000001001800D3F7F0E5E6E4E5EDE8E52028EEF2EFF0E0E2E8F2
      E5EBFC2900000000FFFF00000000000200000001000000000F0054696D657320
      4E657720526F6D616E000A00000000000000000000000000CC00020000000000
      FFFFFF0000000002000000000000000000D023000006004D656D6F3530000200
      DD000000EA00000072010000140000000300020001000000000000000000FFFF
      FF1F2C0200000000000100000000000000FFFF00000000000200000001000000
      000F0054696D6573204E657720526F6D616E000A0000000000000000000A0000
      00CC00020000000000FFFFFF0000000002000000000000000000652400000600
      4D656D6F3531000200DD000000D6000000720100001400000003000200010000
      00000000000000FFFFFF1F2C02000000000001000C005B7661725F73656E6465
      725D00000000FFFF00000000000200000001000000000F0054696D6573204E65
      7720526F6D616E000A0000000000000000000A000000CC00020000000000FFFF
      FF0000000002000000000000000000FC24000006004D656D6F3137000200DC00
      0000AE000000720100002C0000000300020001000000000000000000FFFFFF1F
      2C02000000000001000E005B7661725F72656365697665725D00000000FFFF00
      000000000200000001000000000F0054696D6573204E657720526F6D616E000A
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      0000000000008B25000006004D656D6F353200020024000000C0010000030200
      001100000003000F002C010000000000000000FFFFFF1F2C0200000000000100
      0600C8F2EEE3EE3A00000000FFFF00000000000200000001000000000F005469
      6D6573204E657720526F6D616E000C00000002000000000009000000CC000200
      00000000FFFFFF00000000020000000000000000008626000006004D656D6F35
      3300020027020000C0010000A90000001100000003000F002C01000000000000
      0000FFFFFF1F2C020401100023232320232323202323302E303020F000010024
      005B53554D285B6F6473496E766F696365322E22464E5F564944414E4F5F5355
      4D225D295D0003000500626567696E0D2E002020202020693131203A3D53554D
      285B6F6473496E766F696365322E22464E5F564944414E4F5F53554D225D293B
      0D0300656E6400FFFF00000000000200000001000000000F0054696D6573204E
      657720526F6D616E000C00000002000000000009000000CC00020000000000FF
      FFFF00000000020000000000000000001B27000006004D656D6F353400020080
      020000F50300004C000000120000000300000001000000000000000000FFFFFF
      1F2C02000000000001000C00F1F2F02E205B50414745235D00000000FFFF0000
      0000000200000001000000000F0054696D6573204E657720526F6D616E000A00
      000000000000000009000000CC00020000000000FFFFFF000000000200000000
      0000000000C227000006004D656D6F353500020024000000C8000000B8000000
      140000000300000001000000000000000000FFFFFF1F2C02000000000001001E
      0028F6E5EDF2F0E0EBE8E7EEE2E0EDEDE0FF20E1F3F5E3E0EBF2E5F0E8FF2900
      000000FFFF00000000000200000001000000000F0054696D6573204E65772052
      6F6D616E000A00000000000000000000000000CC00020000000000FFFFFF0000
      0000020000000000000000007728000006004D656D6F35360002005402000069
      0000007C000000130000000900020001000000000000000000FFFFFF1F2C0200
      00000000010036005B464F524D41544441544554494D45282727272227276464
      2727222727206D6D6D6D2079797979202727E32E2727272C44415445295D0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      0000000009000000CC00020000000000FFFFFF00000000020000000000000000
      002C29000006004D656D6F353700020025000000A40000008800000013000000
      0900020001000000000000000000FFFFFF1F2C020000000000010036005B464F
      524D41544441544554494D452827272722272764642727222727206D6D6D6D20
      79797979202727E32E2727272C44415445295D00000000FFFF00000000000200
      000001000000000500417269616C000A00000000000000000008000000CC0002
      0000000000FFFFFF0000000002000000000000000000CF29000006004D656D6F
      35380002001001000020020000E0000000200000000300000001000000000000
      000000FFFFFF1F2C02000000000001001A005B6F647353656C446F634D6F7665
      2E224E414D4546524F4D225D00000000FFFF0000000000020000000100000000
      0F0054696D6573204E657720526F6D616E000A00000000000000000012000000
      CC00020000000000FFFFFF0000000002000000000000000000642A000006004D
      656D6F353900020010010000F0010000E0000000200000000300000001000000
      000000000000FFFFFF1F2C02000000000001000C005B7661725F4D61674F7464
      5D00000000FFFF00000000000200000001000000000F0054696D6573204E6577
      20526F6D616E000A00000000000000000012000000CC00020000000000FFFFFF
      0000000002000000000000000000052B000006004D656D6F3630000200100100
      0080020000E0000000200000000300000001000000000000000000FFFFFF1F2C
      020000000000010018005B6F647353656C446F634D6F76652E224E414D45544F
      225D00000000FFFF00000000000200000001000000000F0054696D6573204E65
      7720526F6D616E000A00000000000000000012000000CC00020000000000FFFF
      FF0000000002000000000000000000972B000006004D656D6F36310002007102
      00002400000060000000140000000300000001000000000000000000FFFFFF1F
      2C02000000000001000900D3D2C2C5D0C6C4C0DE00000000FFFF000000000002
      00000001000000000F0054696D6573204E657720526F6D616E000A0000000000
      0000000012000000CC00020000000000FFFFFF00000000020000000000000000
      00512C000006004D656D6F36320002007001000037000000A00000001D000000
      0300000001000000000000000000FFFFFF1F2C02000000000002001A00C7E0EC
      E5F1F2E8F2E5EBFC20E3EBE0E2EDEEE3EE20E2F0E0F7E00D1400EFEE20ECE5E4
      E8F6E8EDF1EAEEE920F7E0F1F2E800000000FFFF000000000002000000010000
      00000F0054696D6573204E657720526F6D616E000A0000000000000000000800
      0000CC00020000000000FFFFFF0000000002000000000000000000E42C000006
      004D656D6F363300020021020000540000003D00000010000000030000000100
      0000000000000000FFFFFF1F2C02000000000001000A002028EFEEE4EFE8F1FC
      2900000000FFFF00000000000200000001000000000F0054696D6573204E6577
      20526F6D616E000A00000000000000000010000000CC00020000000000FFFFFF
      0000000002000000000000000000722D000006004D656D6F3634000200A60200
      005400000028000000100000000300000001000000000000000000FFFFFF1F2C
      0200000000000100050028D4C8CE2900000000FFFF0000000000020000000100
      0000000F0054696D6573204E657720526F6D616E000A00000000000000000010
      000000CC00020000000000FFFFFF00000000020000000000000000000B2E0000
      05004D656D6F31000200F501000044000000DC00000010000000030002000100
      0000000000000000FFFFFF1F2C020000000000010011005B7661725F7A616D5F
      676C5F767261345D00000000FFFF00000000000200000001000000000F005469
      6D6573204E657720526F6D616E000A00000000000000000009000000CC000200
      00000000FFFFFF0000000002000000000000000000DA2E000006004D656D6F36
      3600020070000000700200008001000010000000030008000100000000000000
      0000FFFFFF1F2C02000000000001005000202020202020202020202020202020
      20202020202020202020202028EFEEE4EFE8F1FC292020202020202020202020
      2020202020202020202020202020202020202020202020202020202028D4C8CE
      2900000000FFFF00000000000200000001000000000500417269616C00080000
      0000000000000008000000CC00020000000000FFFFFF00000000020000000000
      000000007B2F000006004D656D6F36370002001001000050020000E000000020
      0000000300000001000000000000000000FFFFFF1F2C02000000000001001800
      5B6F647353656C446F634D6F76652E224E414D45544F225D00000000FFFF0000
      0000000200000001000000000F0054696D6573204E657720526F6D616E000A00
      000000000000000012000000CC00020000000000FFFFFF000000000200000000
      00000000000530000006004D656D6F3635000200200000006002000050000000
      100000000300000001000000000000000000FFFFFF1F2C02000000000001000B
      00C7E0F2F0E5E1EEE2E0EB3A00000000FFFF0000000000020000000100000000
      0500417269616C000A0000000000000000000A000000CC00020000000000FFFF
      FF0000000002000000000000000000BA30000006004D656D6F36380002002302
      000088020000A0000000140000000300020001000000000000000000FFFFFF1F
      2C020000000000010036005B464F524D41544441544554494D45282727272227
      2764642727222727206D6D6D6D2079797979202727E32E2727272C4441544529
      5D00000000FFFF00000000000200000001000000000500417269616C000A0000
      0000000000000009000000CC00020000000000FFFFFF00000000020000000000
      000000004431000006004D656D6F3639000200D0000000C0020000C00100004C
      0000000300000001000000000000000000FFFFFF1F2C00000000000001000B00
      5B49544F4728693131295D00000000FFFF000000000002000000010000000005
      00417269616C000A00000000000000000008000000CC00020000000000FFFFFF
      000000000200000000000000FEFEFF020000000A00207661726961626C657300
      0000000300693131000000000000000000000000FC0000000000000000000000
      000000000058002C0F48C6F5D3E2408D9AC395D66DE440}
  end
  object odsMoZag: TOracleDataSet
    SQL.Strings = (
      'select * from MED.tmo'
      'where moid=:amoid')
    Optimize = False
    Variables.Data = {0300000001000000060000003A414D4F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000040000004D4F49440100000000000700000046435F4E414D
      4501000000000006000000464C5F43524D01000000000009000000464B5F5041
      52454E54010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 464
    Top = 272
    object odsMoZagMOID: TIntegerField
      FieldName = 'MOID'
      Required = True
    end
    object odsMoZagFC_NAME: TStringField
      FieldName = 'FC_NAME'
      Required = True
      Size = 50
    end
    object odsMoZagFL_CRM: TIntegerField
      FieldName = 'FL_CRM'
    end
  end
  object frDBdsInvoice: TfrDBDataSet
    DataSet = odsInvoice2
    Left = 466
    Top = 226
  end
  object pmAdd: TPopupMenu
    Left = 222
    Top = 88
    object N10: TMenuItem
      Action = acins
      Caption = #1055#1077#1088#1077#1076#1072#1095#1072' '#1076#1088#1091#1075#1086#1084#1091' '#1086#1090#1076'.'
    end
    object N11: TMenuItem
      Action = acInsertByTreb
    end
    object N12: TMenuItem
      Action = acSpisanie
    end
    object N22: TMenuItem
      Caption = '-'
    end
    object acReturnPostav1: TMenuItem
      Action = acReturnPostav
    end
    object N28: TMenuItem
      Action = acSpisanieHITEC
    end
    object N23: TMenuItem
      Caption = '-'
    end
    object N24: TMenuItem
      Action = acOtpuskPoNacPr
    end
    object N25: TMenuItem
      Action = acOtpuskPoCelProg
    end
    object miRezervSeparator: TMenuItem
      Caption = '-'
    end
    object N26: TMenuItem
      Action = acToRezerv
    end
  end
  object frActSpis_Old: TfrReport
    InitialZoom = pzPageWidth
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 266
    Top = 124
    ReportForm = {
      1900000059710000190000000001000100FFFFFFFFFF090000009A0B00003408
      00000000000000000000000000000000000001FFFF0000000000000100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      01000004000000FFFFFFFFFF090000009A0B0000340800000000000000000000
      000000000000000001FFFF0000FFFF0000010000000000000000050050616765
      3100030400466F726D000F000080DC000000780000007C0100002C0100000400
      00000200260100000C005265706F72745469746C653100020100000000080000
      002F0400000E0100003000000001000000000000000000FFFFFF1F0000000000
      0000000000000000FFFF000000000002000000010000000000000001000000C8
      00000014000000010000000000000200A10100000B004D617374657244617461
      31000201000000005C0100002F04000016000000310005000100000000000000
      0000FFFFFF1F0000000010006672444264734163745370697352657000000000
      000000FFFF000000000002000000010000000000000001000000C80000001400
      00000100000000000002000C0200000B0050616765466F6F7465723100020100
      000000F00100002F0400001E0000003000030001000000000000000000FFFFFF
      1F00000000000000000000000000FFFF00000000000200000001000000000000
      0001000000C800000014000000010000000000000200790200000D004D617374
      6572466F6F7465723100020100000000800100002F0400001400000031000600
      01000000000000000000FFFFFF1F00000000000000000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      000200E70200000E005265706F727453756D6D61727931000201000000008C01
      00002F040000420000003000010001000000000000000000FFFFFF1F00000000
      000000000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200540300000D004D6173746572486561
      6465723100020100000000180100002F04000032000000300004000100000000
      0000000000FFFFFF1F00000000000000000000000000FFFF0000000000020000
      00010000000000000001000000C800000014000000010000000000000000FD03
      000005004D656D6F3100020014010000980000009C0100001C00000003000000
      01000000000000000000FFFFFF1F2C02000000000001002B00EDE020F1EFE8F1
      E0EDE8E520F2EEE2E0F0EDEE2DECE0F2E5F0E8E0EBFCEDFBF520F6E5EDEDEEF1
      F2E5E92000000000FFFF00000000000200000001000000000500417269616C00
      1000000002000000000000000000CC00020000000000FFFFFF00000000020000
      00000000000000B905000005004D656D6F3200020038000000C0000000DC0300
      004C0000000300000001000000000000000000FFFFFF1F2C0200000000000100
      3E01CAEEECE8F1F1E8FF20E220F1EEF1F2E0E2E53A20EFF0E5E4F1E5E4E0F2E5
      EBFC20202020205F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F2C20F7EBE5EDFB20
      EAEEECE8F1F1E8E8205F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F205F5F5F5F5F5F
      5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F20202020202020202020202020
      20202020202020202020CDE020EEF1EDEEE2E0EDE8E820EFF0E8EAE0E7E02028
      F0E0F1EFEEF0FFE6E5EDE8FF2920B9205F5F5F20EEF2205F5F5F5F5F5F5F5F5F
      5F5F5F5F5F20F1EEF1F2E0E2E8EBE020EDE0F1F2EEFFF9E8E920E0EAF220EE20
      F2EEEC2C20F7F2EE20F3EAE0E7E0EDEDFBE520EDE8E6E520F6E5EDEDEEF1F2E8
      2C20F5F0E0EDE8E2F8E8E5F1FF20E220E0EFF2E5EAE52C20EFF0E8F8EBE820E2
      20EDE5E3EEE4EDEEF1F2FC20E820EFEEE4EBE5E6E0F220F1EFE8F1E0EDE8FE2E
      00000000FFFF00000000000200000001000000000500417269616C000C000000
      00000000000000000000CC00020000000000FFFFFF0000000002000000000000
      0000003806000005004D656D6F3300020012000000180100001E000000320000
      0003000F0001000000000000000000FFFFFF1F2C02000000000001000100B900
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      0000CE06000005004D656D6F3400020030000000180100003C00000032000000
      03000F0001000000000000000000FFFFFF1F2C02000000000003000600CDEEEC
      E5ED2D0D0700EAEBE0F2F3F02D0D0500EDFBE920B900000000FFFF0000000000
      0200000001000000000500417269616C000A0000000000000000000A000000CC
      00020000000000FFFFFF00000000020000000000000000006207000005004D65
      6D6F350002006C00000018010000B00000003200000003000F00010000000000
      00000000FFFFFF1F2C02000000000001001600CDE0E8ECE5EDEEE2E0EDE8E520
      F6E5EDEDEEF1F2E5E900000000FFFF0000000000020000000100000000050041
      7269616C000A0000000000000000000A000000CC00020000000000FFFFFF0000
      000002000000000000000000E607000005004D656D6F360002001C0100001801
      0000200000003200000003000F0001000000000000000000FFFFFF1F2C020000
      00000001000600C5E42EC8E7EC00000000FFFF00000000000200000001000000
      000500417269616C000A0000000000000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000006A08000005004D656D6F370002003C01
      0000180100002C0000003200000003000F0001000000000000000000FFFFFF1F
      2C02000000000001000600CAEEEB2DE2EE00000000FFFF000000000002000000
      01000000000500417269616C000A0000000000000000000A000000CC00020000
      000000FFFFFF0000000002000000000000000000F108000005004D656D6F3800
      02006801000018010000D80000001000000003000F0001000000000000000000
      FFFFFF1F2C02000000000001000900D1F2EEE8ECEEF1F2FC00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000A00
      0000CC00020000000000FFFFFF00000000020000000000000000007809000005
      004D656D6F3900020068010000280100006C0000001000000003000F00010000
      00000000000000FFFFFF1F2C02000000000001000900D0EEE7EDE8F7EDE0FF00
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      0000FE09000006004D656D6F3130000200D4010000280100006C000000100000
      0003000F0001000000000000000000FFFFFF1F2C02000000000001000700CEEF
      F2EEE2E0FF00000000FFFF00000000000200000001000000000500417269616C
      000A0000000000000000000A000000CC00020000000000FFFFFF000000000200
      0000000000000000810A000006004D656D6F3131000200680100003801000036
      0000001200000003000F0001000000000000000000FFFFFF1F2C020000000000
      01000400D6E5EDE000000000FFFF000000000002000000010000000005004172
      69616C000A0000000000000000000A000000CC00020000000000FFFFFF000000
      0002000000000000000000050B000006004D656D6F31320002009E0100003801
      0000360000001200000003000F0001000000000000000000FFFFFF1F2C020000
      00000001000500D1F3ECECE000000000FFFF0000000000020000000100000000
      0500417269616C000A0000000000000000000A000000CC00020000000000FFFF
      FF0000000002000000000000000000880B000006004D656D6F3133000200D401
      000038010000360000001200000003000F0001000000000000000000FFFFFF1F
      2C02000000000001000400D6E5EDE000000000FFFF0000000000020000000100
      0000000500417269616C000A0000000000000000000A000000CC000200000000
      00FFFFFF00000000020000000000000000000C0C000006004D656D6F31340002
      000A02000038010000360000001200000003000F0001000000000000000000FF
      FFFF1F2C02000000000001000500D1F3ECECE000000000FFFF00000000000200
      000001000000000500417269616C000A0000000000000000000A000000CC0002
      0000000000FFFFFF0000000002000000000000000000A30C000006004D656D6F
      313500020040020000180100005C0100001000000003000F0001000000000000
      000000FFFFFF1F2C02000000000001001800CAEEE3E4E020E820EEF2EAF3E4E0
      20EFEEF1F2F3EFE8EBEE00000000FFFF00000000000200000001000000000500
      417269616C000A0000000000000000000A000000CC00020000000000FFFFFF00
      00000002000000000000000000260D000006004D656D6F313600020040020000
      28010000500000001000000003000F0001000000000000000000FFFFFF1F2C02
      000000000001000400D1F7E5F200000000FFFF00000000000200000001000000
      000500417269616C000A0000000000000000000A000000CC00020000000000FF
      FFFF0000000002000000000000000000A60D000006004D656D6F313700020040
      02000038010000200000001200000003000F0001000000000000000000FFFFFF
      1F2C02000000000001000100B900000000FFFF00000000000200000001000000
      000500417269616C000A0000000000000000000A000000CC00020000000000FF
      FFFF0000000002000000000000000000290E000006004D656D6F313800020060
      02000038010000300000001200000003000F0001000000000000000000FFFFFF
      1F2C02000000000001000400C4E0F2E000000000FFFF00000000000200000001
      000000000500417269616C000A0000000000000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000B10E000006004D656D6F313900
      02009002000028010000560000002200000003000F0001000000000000000000
      FFFFFF1F2C02000000000001000900CFEEF1F2E0E2F9E8EA00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000A00
      0000CC00020000000000FFFFFF0000000002000000000000000000350F000006
      004D656D6F3230000200E6020000280100003C0000002200000003000F000100
      0000000000000000FFFFFF1F2C02000000000001000500D1E5F0E8FF00000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      00000A000000CC00020000000000FFFFFF0000000002000000000000000000C0
      0F000006004D656D6F323100020022030000280100003C000000220000000300
      0F0001000000000000000000FFFFFF1F2C02000000000001000C00C4E0F2E020
      E2FBEFF3F1EAE000000000FFFF00000000000200000001000000000500417269
      616C000A0000000000000000000A000000CC00020000000000FFFFFF00000000
      020000000000000000004C10000006004D656D6F32320002005E030000280100
      003E0000002200000003000F0001000000000000000000FFFFFF1F2C02000000
      000001000D00D1F0EEEA20E3EEE4EDEEF1F2E800000000FFFF00000000000200
      000001000000000500417269616C000A0000000000000000000A000000CC0002
      0000000000FFFFFF0000000002000000000000000000E310000006004D656D6F
      32330002009C03000018010000740000003200000003000F0001000000000000
      000000FFFFFF1F2C02000000000001001800CFF0E8F7E8EDE020E820F5E0F0E0
      EAF2E5F020EFEEF0F7E800000000FFFF00000000000200000001000000000500
      417269616C000A0000000000000000000A000000CC00020000000000FFFFFF00
      000000020000000000000000006911000006004D656D6F323400020012000000
      5C0100001E0000001600000003000F0001000000000000000000FFFFFF1F2C02
      0000000000010007005B4C494E45235D00000000FFFF00000000000200000001
      000000000500417269616C000A0000000000000000000A000000CC0002000000
      0000FFFFFF00000000020000000000000000000012000006004D656D6F323500
      0200300000005C0100003C0000001600000003000F0001000000000000000000
      FFFFFF1F2C020000000000010018005B6F6473416374537069735265702E224E
      4F4D4E554D225D00000000FFFF00000000000200000001000000000500417269
      616C000A0000000000000000000A000000CC00020000000000FFFFFF00000000
      020000000000000000009A12000006004D656D6F32360002006C0000005C0100
      00B00000001600000003000F0001000000000000000000FFFFFF1F2C02000000
      000001001B005B6F6473416374537069735265702E224E414D454D4544494322
      5D00000000FFFF00000000000200000001000000000500417269616C000A0000
      000000000000000A000000CC00020000000000FFFFFF00000000020000000000
      000000003113000006004D656D6F32370002001C0100005C0100002000000016
      00000003000F0001000000000000000000FFFFFF1F2C02000000000001001800
      5B6F6473416374537069735265702E2245494E414D45225D00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000A00
      0000CC00020000000000FFFFFF0000000002000000000000000000C813000006
      004D656D6F32380002003C0100005C0100002C0000001600000003000F000100
      0000000000000000FFFFFF1F2C020000000000010018005B6F64734163745370
      69735265702E22464E5F4B4F4C225D00000000FFFF0000000000020000000100
      0000000500417269616C000A0000000000000000000A000000CC000200000000
      00FFFFFF00000000020000000000000000007A14000006004D656D6F32390002
      00680100005C010000360000001600000003000F0001000000000000000000FF
      FFFF1F2C020000000000010033005B464F524D4154464C4F4154282730F02E30
      30EA2E272C5B6F6473416374537069735265702E22666E5F7072696365225D29
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      000000000000000A000000CC00020000000000FFFFFF00000000020000000000
      000000005C15000006004D656D6F33300002009E0100005C0100003600000016
      00000003000F0001000000000000000000FFFFFF1F2C02000000000001002F00
      5B464F524D4154464C4F4154282730F02E3030EA2E272C5B6F64734163745370
      69735265702E2253554D4D225D295D0003000500626567696E0D240020207375
      6D6D3A3D73756D6D2B5B6F6473416374537069735265702E2253554D4D225D3B
      0D0300656E6400FFFF00000000000200000001000000000500417269616C0008
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      000000000000DB15000006004D656D6F3331000200D40100005C010000360000
      001600000003000F0001000000000000000000FFFFFF1F2C0200000000000100
      000000000000FFFF00000000000200000001000000000500417269616C000A00
      00000000000000000A000000CC00020000000000FFFFFF000000000200000000
      00000000005A16000006004D656D6F33320002000A0200005C01000036000000
      1600000003000F0001000000000000000000FFFFFF1F2C020000000000010000
      0000000000FFFF00000000000200000001000000000500417269616C000A0000
      000000000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000D716000006004D656D6F3333000200400200005C0100002000000016
      00000003000F0001000000000000000000FFFFFF1F2C02000000000000000000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      005417000006004D656D6F3334000200600200005C0100003000000016000000
      03000F0001000000000000000000FFFFFF1F2C020000000000000000000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      000A000000CC00020000000000FFFFFF0000000002000000000000000000D317
      000006004D656D6F3335000200900200005C010000560000001600000003000F
      0001000000000000000000FFFFFF1F2C0200000000000100000000000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000501800
      0006004D656D6F3336000200E60200005C0100003C0000001600000003000F00
      01000000000000000000FFFFFF1F2C020000000000000000000000FFFF000000
      00000200000001000000000500417269616C000A0000000000000000000A0000
      00CC00020000000000FFFFFF0000000002000000000000000000CD1800000600
      4D656D6F3337000200220300005C0100003C0000001600000003000F00010000
      00000000000000FFFFFF1F2C020000000000000000000000FFFF000000000002
      00000001000000000500417269616C000A0000000000000000000A000000CC00
      020000000000FFFFFF00000000020000000000000000004A19000006004D656D
      6F33380002005E0300005C0100003E0000001600000003000F00010000000000
      00000000FFFFFF1F2C020000000000000000000000FFFF000000000002000000
      01000000000500417269616C000A0000000000000000000A000000CC00020000
      000000FFFFFF0000000002000000000000000000C919000006004D656D6F3339
      0002009C0300005C010000740000001600000003000F00010000000000000000
      00FFFFFF1F2C0200000000000100000000000000FFFF00000000000200000001
      000000000500417269616C000A0000000000000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000551A000006004D656D6F343000
      0200100000009001000058000000240000000300000001000000000000000000
      FFFFFF1F2C02000000000001000D00C8F2EEE3EE20EFEE20E0EAF2F300000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      000008000000CC00020000000000FFFFFF0000000002000000000000000000E1
      1A000006004D656D6F36360002003803000024000000D8000000120000000300
      000001000000000000000000FFFFFF1F2C02000000000002000A00D3D2C2C5D0
      C6C4C0DE3A0D000000000000FFFF000000000002000000010000000005004172
      69616C000C00000000000000000000000000CC00020000000000FFFFFF000000
      00020000000000000000007F1B000006004D656D6F3637000200B50100006400
      000024000000110000000300020001000000000000000000FFFFFF1F2C020000
      00000001001F00225B464F524D41544441544554494D4528276464272C204441
      5445295D22200000000000000000000000020000000100000000050041726961
      6C000C00000000000000000000000000CC00020000000000FFFFFF0000000002
      000000000000000000131C000006004D656D6F3638000200DC01000064000000
      78000000110000000300020001000000000000000000FFFFFF1F2C0200000000
      00010015005B6F6473416374537069735265702E224D4F4E225D000000000000
      00000000000200000001000000000500417269616C000C000000000000000000
      02000000CC00020000000000FFFFFF0000000002000000000000000000B21C00
      0006004D656D6F36390002005802000064000000340000001400000003000000
      01000000000000000000FFFFFF1F2C020000000000010020005B464F524D4154
      4441544554494D45282779797979272C2044415445295D20E300000000000000
      000000000200000001000000000500417269616C000C00000000000000000000
      000000CC00020000000000FFFFFF0000000002000000000000000000431D0000
      06004D656D6F3730000200380300008B000000D8000000150000000300020001
      000000000000000000FFFFFF1F2C0003020C00646420206D6F20207979797900
      010006005B444154455D00000000FFFF00000000000200000001000000000500
      417269616C000C00000000000000000002000000CC00020000000000FFFFFF00
      00000002000000000000000000D71D000006004D656D6F373100020013000000
      2000000077010000130000000300020001000000000000000000FFFFFF1F2C02
      0000000000010015005B6F6473416374537069735265702E224C4F4B225D0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      0000000000000000CC00020000000000FFFFFF00000000020000000000000000
      00651E000006004D656D6F373300020013000000340000007701000013000000
      0300020001000000000000000000FFFFFF1F2C02000000000001000F00CBE5F7
      E5E1EDFBE920EAEEF0EFF3F100000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000000000000CC00020000000000FFFF
      FF0000000002000000000000000000FE1E000006004D656D6F37350002001300
      00004800000077010000130000000300020001000000000000000000FFFFFF1F
      2C02000000000001001A005B6F6473416374537069735265702E224E414D4546
      524F4D225D00000000000000000000000200000001000000000500417269616C
      000A00000000000000000000000000CC00020000000000FFFFFF000000000200
      0000000000000000BA1F000006004D656D6F37360002004001000078000000A8
      010000180000000300000001000000000000000000FFFFFF1F2C020000000000
      01001E00C0CAD220B9205B6F6473416374537069735265702E2246435F444F43
      225D0004000500626567696E0D0B0020202073756D6D3A3D303B0D0100200D03
      00656E6400FFFF00000000000200000001000000000500417269616C00100000
      0002000000000002000000CC00020000000000FFFFFF00000000020000000000
      000000003920000006004D656D6F373700020012000000800100001E00000014
      00000003000F0001000000000000000000FFFFFF1F2C02000000000001000000
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      000000BE20000006004D656D6F373800020030000000800100003C0000001400
      000003000F0001000000000000000000FFFFFF1F2C02000000000001000600C8
      F2EEE3EE3A00000000FFFF00000000000200000001000000000500417269616C
      000A00000000000000000008000000CC00020000000000FFFFFF000000000200
      00000000000000003D21000006004D656D6F37390002006C00000080010000B0
      0000001400000003000F0001000000000000000000FFFFFF1F2C020000000000
      0100000000000000FFFF00000000000200000001000000000500417269616C00
      0A0000000000000000000A000000CC00020000000000FFFFFF00000000020000
      00000000000000BC21000006004D656D6F38300002001C010000800100002000
      00001400000003000F0001000000000000000000FFFFFF1F2C02000000000001
      00000000000000FFFF00000000000200000001000000000500417269616C000A
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      0000000000003B22000006004D656D6F38310002003C010000800100002C0000
      001400000003000F0001000000000000000000FFFFFF1F2C0200000000000100
      000000000000FFFF00000000000200000001000000000500417269616C000A00
      00000000000000000A000000CC00020000000000FFFFFF000000000200000000
      0000000000BA22000006004D656D6F3832000200680100008001000036000000
      1400000003000F0001000000000000000000FFFFFF1F2C020000000000010000
      0000000000FFFF00000000000200000001000000000500417269616C000A0000
      000000000000000A000000CC00020000000000FFFFFF00000000020000000000
      000000005923000006004D656D6F38330002009E010000800100003600000014
      00000003000F0001000000000000000000FFFFFF1F2C02000000000001002000
      5B464F524D4154464C4F4154282730F02E3030EA2E272C205B73756D6D5D295D
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      000000D823000006004D656D6F3834000200D401000080010000360000001400
      000003000F0001000000000000000000FFFFFF1F2C0200000000000100000000
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      00005724000006004D656D6F38350002000A0200008001000036000000140000
      0003000F0001000000000000000000FFFFFF1F2C020000000000010000000000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      00D424000006004D656D6F383600020040020000800100002000000014000000
      03000F0001000000000000000000FFFFFF1F2C020000000000000000000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      000A000000CC00020000000000FFFFFF00000000020000000000000000005125
      000006004D656D6F38370002006002000080010000300000001400000003000F
      0001000000000000000000FFFFFF1F2C020000000000000000000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000A00
      0000CC00020000000000FFFFFF0000000002000000000000000000D025000006
      004D656D6F38380002009002000080010000560000001400000003000F000100
      0000000000000000FFFFFF1F2C0200000000000100000000000000FFFF000000
      00000200000001000000000500417269616C000A0000000000000000000A0000
      00CC00020000000000FFFFFF00000000020000000000000000004D2600000600
      4D656D6F3839000200E6020000800100003C0000001400000003000F00010000
      00000000000000FFFFFF1F2C020000000000000000000000FFFF000000000002
      00000001000000000500417269616C000A0000000000000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000CA26000006004D656D
      6F393000020022030000800100003C0000001400000003000F00010000000000
      00000000FFFFFF1F2C020000000000000000000000FFFF000000000002000000
      01000000000500417269616C000A0000000000000000000A000000CC00020000
      000000FFFFFF00000000020000000000000000004727000006004D656D6F3931
      0002005E030000800100003E0000001400000003000F00010000000000000000
      00FFFFFF1F2C020000000000000000000000FFFF000000000002000000010000
      00000500417269616C000A0000000000000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000C627000006004D656D6F3932000200
      9C03000080010000740000001400000003000F0001000000000000000000FFFF
      FF1F2C0200000000000100000000000000FFFF00000000000200000001000000
      000500417269616C000A0000000000000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000005528000006004D656D6F39330002006C
      000000980100006C000000140000000300020001000000000000000000FFFFFF
      1F2C02000000000001001000205B5B43555252454E54235D2D315D2000000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      000008000000CC00020000000000FFFFFF0000000002000000000000000000EA
      28000006004D656D6F3934000200DC00000098010000A0000000140000000300
      000001000000000000000000FFFFFF1F2C02000000000001001600EDE0E8ECE5
      EDEEE2E0EDE8E920EDE020F1F3ECECF32000000000FFFF000000000002000000
      01000000000500417269616C000A00000000000000000008000000CC00020000
      000000FFFFFF00000000020000000000000000009029000006004D656D6F3935
      00020084010000980100008C0200001400000003000200010000000000000000
      00FFFFFF1F2C020000000000010027005B464F524D4154464C4F415428273020
      F0F3E1EBE5E92E3030EAEEEF2E272C2073756D6D295D2000000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000080000
      00CC00020000000000FFFFFF0000000002000000000000000000252A00000600
      4D656D6F3436000200BC02000099000000DC0000001800000003000000010000
      00000000000000FFFFFF1F2C020000000000010016005B6F6473416374537069
      735265702E2244415441225D00000000FFFF0000000000020000000100000000
      0500417269616C000E00000006000000000008000000CC00020000000000FFFF
      FF0000000002000000000000000000BA2A000006004D656D6F34370002001000
      0000F00100004C010000140000000300000001000000000000000000FFFFFF1F
      2C02000000000001000C00F1F2F02E205B50414745235D00000000FFFF000000
      00000200000001000000000F0054696D6573204E657720526F6D616E000A0000
      0000000000000000000000CC00020000000000FFFFFF00000000020000000000
      00000400092B000005004C696E653100020010000000F20100000E0400000000
      00000100080002000000000000000000FFFFFF1F2C0200000000000000000000
      00FFFF00000000000200000001000000000000A72B000007004D656D6F313430
      0002000000000038030000F80000001400000003000000010000000000000000
      00FFFFFF1F2C02000000000001001E00C0EAF220F3F2E2E5F0E6E4E0FE2E20CF
      EEF2E5F0E820E220F1F3ECECE53A00000000FFFF000000000002000000010000
      00000500417269616C000C00000000000000000008000000CC00020000000000
      FFFFFF00000000020000000000000000003F2C000007004D656D6F3134310002
      00F00000003803000028020000120000000300020001000000000000000000FF
      FFFF1F2C020000000000010018005B6F6473416374537069735265702E225355
      4D535452225D00000000FFFF0000000000020000000100000000050041726961
      6C000C0000000000000000000A000000CC00020000000000FFFFFF0000000002
      000000000000000000CF2C000007004D656D6F3134320002001C030000380300
      0084000000140000000300000001000000000000000000FFFFFF1F2C02000000
      000001001000EEF2EDE5F1F2E820EDE020F1F7E5F23A00000000FFFF00000000
      000200000001000000000500417269616C000C00000000000000000008000000
      CC00020000000000FFFFFF00000000020000000000000000004D2D000007004D
      656D6F3134330002009403000038030000600000001000000003000200010000
      00000000000000FFFFFF1F2C020000000000000000000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000008000000CC00
      020000000000FFFFFF0000000002000000000000000000CB2D000007004D656D
      6F3134340002000000000050030000000400000C000000030002000100000000
      0000000000FFFFFF1F2C020000000000000000000000FFFF0000000000020000
      0001000000000500417269616C00100000000200000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000762E000007004D656D6F31
      34350002000401000060030000F0010000240000000300000001000000000000
      000000FFFFFF1F2C02000000000001002B00CEF2ECE5F2EAE820EEE120F3EDE8
      F7F2EEE6E5EDE8E820F1EFE8F1E0EDEDFBF520F6E5EDEDEEF1F2E5E92E000000
      00FFFF00000000000200000001000000000500417269616C000C000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      F42E000007004D656D6F3134360002000000000084030000000400000C000000
      0300020001000000000000000000FFFFFF1F2C020000000000000000000000FF
      FF00000000000200000001000000000500417269616C00100000000200000000
      000A000000CC00020000000000FFFFFF0000000002000000000000000000722F
      000007004D656D6F3134370002000000000094030000000400000C0000000300
      020001000000000000000000FFFFFF1F2C020000000000000000000000FFFF00
      000000000200000001000000000500417269616C00100000000200000000000A
      000000CC00020000000000FFFFFF0000000002000000000000000000F02F0000
      07004D656D6F31343800020000000000A4030000000400000C00000003000200
      01000000000000000000FFFFFF1F2C020000000000000000000000FFFF000000
      00000200000001000000000500417269616C00100000000200000000000A0000
      00CC00020000000000FFFFFF00000000020000000000000000006E3000000700
      4D656D6F31343900020000000000B4030000000400000C000000030002000100
      0000000000000000FFFFFF1F2C020000000000000000000000FFFF0000000000
      0200000001000000000500417269616C00100000000200000000000A000000CC
      00020000000000FFFFFF0000000002000000000000000000FC30000007004D65
      6D6F313530000200080000003C04000074000000140000000300000001000000
      000000000000FFFFFF1F2C02000000000001000E00CCE0F22E20EEF2E22E20EB
      E8F6EE00000000FFFF00000000000200000001000000000500417269616C000C
      00000000000000000008000000CC00020000000000FFFFFF0000000002000000
      0000000000009531000007004D656D6F313731000200840000003C0400009C00
      0000100000000300020001000000000000000000FFFFFF1F2C02000000000001
      0019005B6F6473416374537069735265702E22444F4C4F545032225D00000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      000002000000CC00020000000000FFFFFF00000000020000000000000000001E
      32000007004D656D6F313732000200840000004C0400009C0000001000000003
      00080001000000000000000000FFFFFF1F2C02000000000001000900C4EEEBE6
      EDEEF1F2FC00000000FFFF00000000000200000001000000000500417269616C
      000A00000000000000000002000000CC00020000000000FFFFFF000000000200
      00000000000000009E32000007004D656D6F3137330002002C0100003C040000
      9C000000100000000300020001000000000000000000FFFFFF1F2C0200000000
      000100000000000000FFFF00000000000200000001000000000500417269616C
      000A00000000000000000000000000CC00020000000000FFFFFF000000000200
      00000000000000002533000007004D656D6F3137340002002C0100004C040000
      9C000000100000000300080001000000000000000000FFFFFF1F2C0200000000
      0001000700CFEEE4EFE8F1FC00000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000002000000CC00020000000000FFFF
      FF0000000002000000000000000000BB33000007004D656D6F313735000200D0
      0100003C040000EC000000100000000300020001000000000000000000FFFFFF
      1F2C020000000000010016005B6F6473416374537069735265702E224F545032
      225D00000000FFFF00000000000200000001000000000500417269616C000A00
      000000000000000002000000CC00020000000000FFFFFF000000000200000000
      00000000004E34000007004D656D6F313736000200D00100004C040000EC0000
      00100000000300080001000000000000000000FFFFFF1F2C0200000000000100
      1300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF0000000000
      0200000001000000000500417269616C000A00000000000000000002000000CC
      00020000000000FFFFFF0000000002000000000000000000E534000007004D65
      6D6F31373700020000000000CA030000C0000000100000000300000001000000
      000000000000FFFFFF1F2C02000000000001001700CFF0E5E4F1E5E4E0F2E5EB
      FC20EAEEECE8F1F1E8E83A2000000000FFFF0000000000020000000100000000
      0500417269616C000C0000000000000000000A000000CC00020000000000FFFF
      FF00000000020000000000000000007535000007004D656D6F31373800020004
      000000EA03000080000000100000000300000001000000000000000000FFFFFF
      1F2C02000000000001001000D7EBE5EDFB20EAEEECE8F1F1E8E83A2000000000
      FFFF00000000000200000001000000000500417269616C000C00000000000000
      000008000000CC00020000000000FFFFFF00000000020000000000000000000D
      36000007004D656D6F313739000200C4000000C80300009C0000001000000003
      00020001000000000000000000FFFFFF1F2C020000000000010018005B6F6473
      416374537069735265702E22444F4C504F4C225D00000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000002000000CC00
      020000000000FFFFFF00000000020000000000000000009636000007004D656D
      6F313830000200C4000000D80300009C00000010000000030008000100000000
      0000000000FFFFFF1F2C02000000000001000900C4EEEBE6EDEEF1F2FC000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      00000002000000CC00020000000000FFFFFF0000000002000000000000000000
      1637000007004D656D6F3138310002006C010000C80300009C00000010000000
      0300020001000000000000000000FFFFFF1F2C02000000000001000000000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      00000000000000CC00020000000000FFFFFF0000000002000000000000000000
      9D37000007004D656D6F3138320002006C010000D80300009C00000010000000
      0300080001000000000000000000FFFFFF1F2C02000000000001000700CFEEE4
      EFE8F1FC00000000FFFF00000000000200000001000000000500417269616C00
      0A00000000000000000002000000CC00020000000000FFFFFF00000000020000
      000000000000003238000007004D656D6F31383300020010020000C8030000EC
      000000100000000300020001000000000000000000FFFFFF1F2C020000000000
      010015005B6F6473416374537069735265702E22504F4C225D00000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000002
      000000CC00020000000000FFFFFF0000000002000000000000000000C5380000
      07004D656D6F31383400020010020000D8030000EC0000001000000003000800
      01000000000000000000FFFFFF1F2C02000000000001001300D0E0F1F8E8F4F0
      EEE2EAE020EFEEE4EFE8F1E800000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000002000000CC00020000000000FFFF
      FF00000000020000000000000000005D39000007004D656D6F31383500020084
      000000EC0300009C000000100000000300020001000000000000000000FFFFFF
      1F2C020000000000010018005B6F6473416374537069735265702E22444F4C4F
      5450225D00000000FFFF00000000000200000001000000000500417269616C00
      0A00000000000000000002000000CC00020000000000FFFFFF00000000020000
      00000000000000E639000007004D656D6F31383600020084000000FC0300009C
      000000100000000300080001000000000000000000FFFFFF1F2C020000000000
      01000900C4EEEBE6EDEEF1F2FC00000000FFFF00000000000200000001000000
      000500417269616C000A00000000000000000002000000CC00020000000000FF
      FFFF0000000002000000000000000000663A000007004D656D6F313837000200
      2C010000EC0300009C000000100000000300020001000000000000000000FFFF
      FF1F2C0200000000000100000000000000FFFF00000000000200000001000000
      000500417269616C000A00000000000000000000000000CC00020000000000FF
      FFFF0000000002000000000000000000ED3A000007004D656D6F313838000200
      2C010000FC0300009C000000100000000300080001000000000000000000FFFF
      FF1F2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000002000000CC00
      020000000000FFFFFF0000000002000000000000000000823B000007004D656D
      6F313839000200D0010000EC030000EC00000010000000030002000100000000
      0000000000FFFFFF1F2C020000000000010015005B6F64734163745370697352
      65702E224F5450225D00000000FFFF0000000000020000000100000000050041
      7269616C000A00000000000000000002000000CC00020000000000FFFFFF0000
      000002000000000000000000153C000007004D656D6F313930000200D0010000
      FC030000EC000000100000000300080001000000000000000000FFFFFF1F2C02
      000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      000002000000CC00020000000000FFFFFF0000000002000000000000000000AE
      3C000007004D656D6F31393100020084000000140400009C0000001000000003
      00020001000000000000000000FFFFFF1F2C020000000000010019005B6F6473
      416374537069735265702E22444F4C4F545031225D00000000FFFF0000000000
      0200000001000000000500417269616C000A00000000000000000002000000CC
      00020000000000FFFFFF0000000002000000000000000000373D000007004D65
      6D6F31393200020084000000240400009C000000100000000300080001000000
      000000000000FFFFFF1F2C02000000000001000900C4EEEBE6EDEEF1F2FC0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      0000000002000000CC00020000000000FFFFFF00000000020000000000000000
      00B73D000007004D656D6F3139330002002C010000140400009C000000100000
      000300020001000000000000000000FFFFFF1F2C020000000000010000000000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      0000000000000000CC00020000000000FFFFFF00000000020000000000000000
      003E3E000007004D656D6F3139340002002C010000240400009C000000100000
      000300080001000000000000000000FFFFFF1F2C02000000000001000700CFEE
      E4EFE8F1FC00000000FFFF00000000000200000001000000000500417269616C
      000A00000000000000000002000000CC00020000000000FFFFFF000000000200
      0000000000000000D43E000007004D656D6F313935000200D001000014040000
      EC000000100000000300020001000000000000000000FFFFFF1F2C0200000000
      00010016005B6F6473416374537069735265702E224F545031225D00000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      0002000000CC00020000000000FFFFFF0000000002000000000000000000673F
      000007004D656D6F313936000200D001000024040000EC000000100000000300
      080001000000000000000000FFFFFF1F2C02000000000001001300D0E0F1F8E8
      F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF000000000002000000010000
      00000500417269616C000A00000000000000000002000000CC00020000000000
      FFFFFF00000000020000000000000000006540000007004D656D6F3135380002
      003803000037000000D8000000530000000300000001000000000000000000FF
      FFFF1F2C02000000000003001D00CDE0F7E0EBFCEDE8EA205F5F5F5F5F5F5F5F
      5F5F5F5F5F5F5F5F5F5F5F0D00000D1E005F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
      5F5F5F5F5F5F5F5F5F5F5F5F5F5F200003000500626567696E0D2D0020204D65
      6D6F37302E546F70203A3D204D656D6F3135382E546F70202B204D656D6F3135
      382E4865696768743B0D0300656E640001000000000000020000000100000000
      0500417269616C000A00000000000000000000000000CC00020000000000FFFF
      FF0000000002000000000000000201D14000000C005265706F72745469746C65
      3200020100000000200000002F0400003C000000300000000100000000000000
      0000FFFFFF1F00000000000000000000000000FFFF0000000000020000000100
      00000000000001000000C8000000140000000100000000000002013D4100000B
      004D6173746572446174613200020100000000740000002F0400001200000030
      00050001000000000000000000FFFFFF1F0000000001003100000000000000FF
      FF000000000002000000010000000000000001000000C8000000140000000100
      00000000000201A94100000B004D617374657244617461330002010000000088
      0000002F0400000E0000003000050001000000000000000000FFFFFF1F000000
      0001003100000000000000FFFF00000000000200000001000000000000000100
      0000C800000014000000010000000000000201154200000B004D617374657244
      6174613400020100000000940000002F04000012000000300005000100000000
      0000000000FFFFFF1F0000000001003100000000000000FFFF00000000000200
      0000010000000000000001000000C80000001400000001000000000000020181
      4200000B004D6173746572446174613500020100000000A80000002F04000012
      0000003000050001000000000000000000FFFFFF1F0000000001003100000000
      000000FFFF000000000002000000010000000000000001000000C80000001400
      0000010000000000000201ED4200000B004D6173746572446174613600020100
      000000C80000002F040000260000003000050001000000000000000000FFFFFF
      1F0000000001003100000000000000FFFF000000000002000000010000000000
      000001000000C800000014000000010000000000000201594300000B004D6173
      746572446174613700020100000000F40000002F040000260000003000050001
      000000000000000000FFFFFF1F0000000001003100000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      000201C54300000B004D6173746572446174613800020100000000200100002F
      040000220000003000050001000000000000000000FFFFFF1F00000000010031
      00000000000000FFFF000000000002000000010000000000000001000000C800
      000014000000010000000000000201314400000B004D61737465724461746139
      00020100000000800100002F0400002A00000030000500010000000000000000
      00FFFFFF1F0000000001003100000000000000FFFF0000000000020000000100
      00000000000001000000C8000000140000000100000000000002019E4400000C
      004D617374657244617461313000020100000000AC0100002F04000032000000
      3000050001000000000000000000FFFFFF1F0000000001003100000000000000
      FFFF000000000002000000010000000000000001000000C80000001400000001
      00000000000002010B4500000C004D6173746572446174613131000201000000
      00DC0100002F040000120000003000050001000000000000000000FFFFFF1F00
      00000001003100000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000201784500000C004D61737465
      7244617461313200020100000000EC0100002F04000012000000300005000100
      0000000000000000FFFFFF1F0000000001003100000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0201E54500000C004D617374657244617461313300020100000000FC0100002F
      040000120000003000050001000000000000000000FFFFFF1F00000000010031
      00000000000000FFFF000000000002000000010000000000000001000000C800
      000014000000010000000000000201524600000C004D61737465724461746131
      3400020100000000200200002F04000022000000300005000100000000000000
      0000FFFFFF1F0000000001003100000000000000FFFF00000000000200000001
      0000000000000001000000C800000014000000010000000000000201BF460000
      0C004D617374657244617461313500020100000000440200002F040000260000
      003000050001000000000000000000FFFFFF1F00000000010031000000000000
      00FFFF000000000002000000010000000000000001000000C800000014000000
      0100000000000002012C4700000C004D61737465724461746131360002010000
      00006C0200002F040000220000003000050001000000000000000000FFFFFF1F
      0000000001003100000000000000FFFF00000000000200000001000000000000
      0001000000C800000014000000010000000000000201994700000C004D617374
      657244617461313700020100000000C40200002F040000220000003000050001
      000000000000000000FFFFFF1F0000000001003100000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      000201064800000C004D61737465724461746131380002010000000094020000
      2F040000210000003000050001000000000000000000FFFFFF1F000000000100
      3100000000000000FFFF000000000002000000010000000000000001000000C8
      00000014000000010000000000000201734800000C004D617374657244617461
      3139000201000000004B0100002F040000220000003000050001000000000000
      000000FFFFFF1F0000000001003100000000000000FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000001054900
      0006004D656D6F34310002006201000028000000440100002800000003000000
      01000000000000000000FFFFFF1F2C02000000000001001300C7C0CACBDED7C5
      CDC8C520CACECCC8D1D1C8C800000000FFFF0000000000020000000100000000
      0500417269616C00100000000200000000000A000000CC00020000000000FFFF
      FF00000000020000000000000000018249000006004D656D6F34320002001800
      000078000000000400000C0000000300020001000000000000000000FFFFFF1F
      2C020000000000000000000000FFFF0000000000020000000100000000050041
      7269616C00100000000200000000000A000000CC00020000000000FFFFFF0000
      000002000000000000000001FF49000006004D656D6F34330002001400000088
      000000000400000C0000000300020001000000000000000000FFFFFF1F2C0200
      00000000000000000000FFFF0000000000020000000100000000050041726961
      6C00100000000200000000000A000000CC00020000000000FFFFFF0000000002
      0000000000000000017C4A000006004D656D6F34340002001400000098000000
      000400000C0000000300020001000000000000000000FFFFFF1F2C0200000000
      00000000000000FFFF00000000000200000001000000000500417269616C0010
      0000000200000000000A000000CC00020000000000FFFFFF0000000002000000
      000000000001F94A000006004D656D6F343500020014000000AC000000000400
      000C0000000300020001000000000000000000FFFFFF1F2C0200000000000000
      00000000FFFF00000000000200000001000000000500417269616C0010000000
      0200000000000A000000CC00020000000000FFFFFF0000000002000000000000
      000001964B000006004D656D6F35320002001400000084010000F80000001400
      00000300000001000000000000000000FFFFFF1F2C02000000000001001E00C0
      EAF220F3F2E2E5F0E6E4E0FE2E20CFEEF2E5F0E820E220F1F3ECECE53A000000
      00FFFF00000000000200000001000000000500417269616C000C000000000000
      00000008000000CC00020000000000FFFFFF0000000002000000000000000001
      2D4C000006004D656D6F35330002000401000084010000280200001200000003
      00020001000000000000000000FFFFFF1F2C020000000000010018005B6F6473
      416374537069735265702E2253554D535452225D00000000FFFF000000000002
      00000001000000000500417269616C000C0000000000000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000001BC4C000006004D656D
      6F35340002003003000084010000840000001400000003000000010000000000
      00000000FFFFFF1F2C02000000000001001000EEF2EDE5F1F2E820EDE020F1F7
      E5F23A00000000FFFF00000000000200000001000000000500417269616C000C
      00000000000000000008000000CC00020000000000FFFFFF0000000002000000
      000000000001394D000006004D656D6F3535000200A803000084010000600000
      00100000000300020001000000000000000000FFFFFF1F2C0200000000000000
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      00000000000008000000CC00020000000000FFFFFF0000000002000000000000
      000001B64D000006004D656D6F3536000200140000009C010000000400000C00
      00000300020001000000000000000000FFFFFF1F2C0200000000000000000000
      00FFFF00000000000200000001000000000500417269616C0010000000020000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000001
      604E000006004D656D6F353700020018010000AC010000F00100002400000003
      00000001000000000000000000FFFFFF1F2C02000000000001002B00CEF2ECE5
      F2EAE820EEE120F3EDE8F7F2EEE6E5EDE8E820F1EFE8F1E0EDEDFBF520F6E5ED
      EDEEF1F2E5E92E00000000FFFF00000000000200000001000000000500417269
      616C000C0000000000000000000A000000CC00020000000000FFFFFF00000000
      02000000000000000001DD4E000006004D656D6F353800020014000000D00100
      00000400000C0000000300020001000000000000000000FFFFFF1F2C02000000
      0000000000000000FFFF00000000000200000001000000000500417269616C00
      100000000200000000000A000000CC00020000000000FFFFFF00000000020000
      000000000000015A4F000006004D656D6F353900020014000000E00100000004
      00000C0000000300020001000000000000000000FFFFFF1F2C02000000000000
      0000000000FFFF00000000000200000001000000000500417269616C00100000
      000200000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000001D74F000006004D656D6F363000020014000000F0010000000400000C
      0000000300020001000000000000000000FFFFFF1F2C02000000000000000000
      0000FFFF00000000000200000001000000000500417269616C00100000000200
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      015450000006004D656D6F36310002001400000000020000000400000C000000
      0300020001000000000000000000FFFFFF1F2C020000000000000000000000FF
      FF00000000000200000001000000000500417269616C00100000000200000000
      000A000000CC00020000000000FFFFFF0000000002000000000000000001E150
      000006004D656D6F39370002001C000000C40200007400000014000000030000
      0001000000000000000000FFFFFF1F2C02000000000001000E00CCE0F22E20EE
      F2E22E20EBE8F6EE00000000FFFF000000000002000000010000000005004172
      69616C000C00000000000000000008000000CC00020000000000FFFFFF000000
      00020000000000000000017751000006004D656D6F393900020014000000CE00
      0000C0000000100000000300000001000000000000000000FFFFFF1F2C020000
      00000001001700CFF0E5E4F1E5E4E0F2E5EBFC20EAEEECE8F1F1E8E83A200000
      0000FFFF00000000000200000001000000000500417269616C000C0000000000
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      010752000007004D656D6F31303100020018000000F600000080000000100000
      000300000001000000000000000000FFFFFF1F2C02000000000001001000D7EB
      E5EDFB20EAEEECE8F1F1E8E83A2000000000FFFF000000000002000000010000
      00000500417269616C000C00000000000000000008000000CC00020000000000
      FFFFFF00000000020000000000000000019E52000006004D656D6F3438000200
      D8000000CC00000084010000100000000300020001000000000000000000FFFF
      FF1F2C020000000000010018005B6F6473416374537069735265702E22444F4C
      504F4C225D00000000FFFF00000000000200000001000000000500417269616C
      000A00000000000000000002000000CC00020000000000FFFFFF000000000200
      00000000000000012653000006004D656D6F3439000200D8000000DC00000084
      010000100000000300080001000000000000000000FFFFFF1F2C020000000000
      01000900C4EEEBE6EDEEF1F2FC00000000FFFF00000000000200000001000000
      000500417269616C000A00000000000000000002000000CC00020000000000FF
      FFFF0000000002000000000000000001A553000006004D656D6F353000020064
      020000CC0000009C000000100000000300020001000000000000000000FFFFFF
      1F2C0200000000000100000000000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000000000000CC00020000000000FFFF
      FF00000000020000000000000000012B54000006004D656D6F35310002006402
      0000DC0000009C000000100000000300080001000000000000000000FFFFFF1F
      2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF0000000000020000
      0001000000000500417269616C000A00000000000000000002000000CC000200
      00000000FFFFFF0000000002000000000000000001C054000007004D656D6F31
      303000020008030000CC000000EC000000100000000300020001000000000000
      000000FFFFFF1F2C020000000000010015005B6F647341637453706973526570
      2E22504F4C225D00000000FFFF00000000000200000001000000000500417269
      616C000A00000000000000000002000000CC00020000000000FFFFFF00000000
      020000000000000000015355000007004D656D6F31303400020008030000DC00
      0000EC000000100000000300080001000000000000000000FFFFFF1F2C020000
      00000001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      02000000CC00020000000000FFFFFF0000000002000000000000000001EB5500
      0007004D656D6F31303500020098000000F8000000C401000010000000030002
      0001000000000000000000FFFFFF1F2C020000000000010018005B6F64734163
      74537069735265702E22444F4C4F5450225D00000000FFFF0000000000020000
      0001000000000500417269616C000A00000000000000000002000000CC000200
      00000000FFFFFF00000000020000000000000000017456000007004D656D6F31
      30360002009800000008010000C4010000100000000300080001000000000000
      000000FFFFFF1F2C02000000000001000900C4EEEBE6EDEEF1F2FC00000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      0002000000CC00020000000000FFFFFF0000000002000000000000000001F456
      000007004D656D6F31303700020064020000F80000009C000000100000000300
      020001000000000000000000FFFFFF1F2C0200000000000100000000000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      0000000000CC00020000000000FFFFFF00000000020000000000000000017B57
      000007004D656D6F31303800020064020000080100009C000000100000000300
      080001000000000000000000FFFFFF1F2C02000000000001000700CFEEE4EFE8
      F1FC00000000FFFF00000000000200000001000000000500417269616C000A00
      000000000000000002000000CC00020000000000FFFFFF000000000200000000
      00000000011058000007004D656D6F31303900020008030000F8000000EC0000
      00100000000300020001000000000000000000FFFFFF1F2C0200000000000100
      15005B6F6473416374537069735265702E224F5450225D00000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000020000
      00CC00020000000000FFFFFF0000000002000000000000000001A35800000700
      4D656D6F3131300002000803000008010000EC00000010000000030008000100
      0000000000000000FFFFFF1F2C02000000000001001300D0E0F1F8E8F4F0EEE2
      EAE020EFEEE4EFE8F1E800000000FFFF00000000000200000001000000000500
      417269616C000A00000000000000000002000000CC00020000000000FFFFFF00
      000000020000000000000000013C59000007004D656D6F313032000200980000
      00200100009C000000100000000300020001000000000000000000FFFFFF1F2C
      020000000000010019005B6F6473416374537069735265702E22444F4C4F5450
      34225D00000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000002000000CC00020000000000FFFFFF0000000002000000
      000000000001C559000007004D656D6F31313100020098000000300100009C00
      0000100000000300080001000000000000000000FFFFFF1F2C02000000000001
      000900C4EEEBE6EDEEF1F2FC00000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000002000000CC00020000000000FFFF
      FF0000000002000000000000000001455A000007004D656D6F31313200020040
      010000200100009C000000100000000300020001000000000000000000FFFFFF
      1F2C0200000000000100000000000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000000000000CC00020000000000FFFF
      FF0000000002000000000000000001CC5A000007004D656D6F31313300020040
      010000300100009C000000100000000300080001000000000000000000FFFFFF
      1F2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF00000000000200
      000001000000000500417269616C000A00000000000000000002000000CC0002
      0000000000FFFFFF0000000002000000000000000001625B000007004D656D6F
      313134000200E401000020010000EC0000001000000003000200010000000000
      00000000FFFFFF1F2C020000000000010016005B6F6473416374537069735265
      702E224F545034225D00000000FFFF0000000000020000000100000000050041
      7269616C000A00000000000000000002000000CC00020000000000FFFFFF0000
      000002000000000000000001F55B000007004D656D6F313135000200E4010000
      30010000EC000000100000000300080001000000000000000000FFFFFF1F2C02
      000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      000002000000CC00020000000000FFFFFF00000000020000000000000000018D
      5C000006004D656D6F393800020098000000C40200009C000000100000000300
      020001000000000000000000FFFFFF1F2C020000000000010019005B6F647341
      6374537069735265702E22444F4C4F545032225D00000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000002000000CC00
      020000000000FFFFFF0000000002000000000000000001165D000007004D656D
      6F31333000020098000000D40200009C00000010000000030008000100000000
      0000000000FFFFFF1F2C02000000000001000900C4EEEBE6EDEEF1F2FC000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      00000002000000CC00020000000000FFFFFF0000000002000000000000000001
      965D000007004D656D6F31333100020040010000C40200009C00000010000000
      0300020001000000000000000000FFFFFF1F2C02000000000001000000000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      00000000000000CC00020000000000FFFFFF0000000002000000000000000001
      1D5E000007004D656D6F31333200020040010000D40200009C00000010000000
      0300080001000000000000000000FFFFFF1F2C02000000000001000700CFEEE4
      EFE8F1FC00000000FFFF00000000000200000001000000000500417269616C00
      0A00000000000000000002000000CC00020000000000FFFFFF00000000020000
      00000000000001B35E000007004D656D6F313333000200E4010000C4020000EC
      000000100000000300020001000000000000000000FFFFFF1F2C020000000000
      010016005B6F6473416374537069735265702E224F545032225D00000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      02000000CC00020000000000FFFFFF0000000002000000000000000001465F00
      0007004D656D6F313334000200E4010000D4020000EC00000010000000030008
      0001000000000000000000FFFFFF1F2C02000000000001001300D0E0F1F8E8F4
      F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF00000000000200000001000000
      000500417269616C000A00000000000000000002000000CC00020000000000FF
      FFFF0000000002000000000000000001DC5F000006004D656D6F363200020014
      00000022020000C0000000100000000300000001000000000000000000FFFFFF
      1F2C02000000000001001700CFF0E5E4F1E5E4E0F2E5EBFC20EAEEECE8F1F1E8
      E83A2000000000FFFF00000000000200000001000000000500417269616C000C
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      0000000000016B60000006004D656D6F36330002001800000046020000800000
      00100000000300000001000000000000000000FFFFFF1F2C0200000000000100
      1000D7EBE5EDFB20EAEEECE8F1F1E8E83A2000000000FFFF0000000000020000
      0001000000000500417269616C000C00000000000000000008000000CC000200
      00000000FFFFFF00000000020000000000000000010261000006004D656D6F36
      34000200D8000000200200008C01000010000000030002000100000000000000
      0000FFFFFF1F2C020000000000010018005B6F6473416374537069735265702E
      22444F4C504F4C225D00000000FFFF0000000000020000000100000000050041
      7269616C000A00000000000000000002000000CC00020000000000FFFFFF0000
      0000020000000000000000018A61000006004D656D6F3635000200D800000030
      0200008C010000100000000300080001000000000000000000FFFFFF1F2C0200
      0000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF000000000002000000
      01000000000500417269616C000A00000000000000000002000000CC00020000
      000000FFFFFF00000000020000000000000000010962000006004D656D6F3936
      0002006C020000200200009C0000001000000003000200010000000000000000
      00FFFFFF1F2C0200000000000100000000000000FFFF00000000000200000001
      000000000500417269616C000A00000000000000000000000000CC0002000000
      0000FFFFFF00000000020000000000000000019062000007004D656D6F313033
      0002006C020000300200009C0000001000000003000800010000000000000000
      00FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000020000
      00CC00020000000000FFFFFF0000000002000000000000000001256300000700
      4D656D6F3131360002001003000020020000EC00000010000000030002000100
      0000000000000000FFFFFF1F2C020000000000010015005B6F64734163745370
      69735265702E22504F4C225D00000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000002000000CC00020000000000FFFF
      FF0000000002000000000000000001B863000007004D656D6F31313700020010
      03000030020000EC000000100000000300080001000000000000000000FFFFFF
      1F2C02000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      000000000002000000CC00020000000000FFFFFF000000000200000000000000
      00015064000007004D656D6F3131380002009800000048020000CC0100001000
      00000300020001000000000000000000FFFFFF1F2C020000000000010018005B
      6F6473416374537069735265702E22444F4C4F5450225D00000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000020000
      00CC00020000000000FFFFFF0000000002000000000000000001D96400000700
      4D656D6F3131390002009800000058020000CC01000010000000030008000100
      0000000000000000FFFFFF1F2C02000000000001000900C4EEEBE6EDEEF1F2FC
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      00000000000002000000CC00020000000000FFFFFF0000000002000000000000
      0000015965000007004D656D6F3132300002006C020000480200009C00000010
      0000000300020001000000000000000000FFFFFF1F2C02000000000001000000
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      00000000000000000000CC00020000000000FFFFFF0000000002000000000000
      000001E065000007004D656D6F3132310002006C020000580200009C00000010
      0000000300080001000000000000000000FFFFFF1F2C02000000000001000700
      CFEEE4EFE8F1FC00000000FFFF00000000000200000001000000000500417269
      616C000A00000000000000000002000000CC00020000000000FFFFFF00000000
      020000000000000000017566000007004D656D6F313232000200100300004802
      0000EC000000100000000300020001000000000000000000FFFFFF1F2C020000
      000000010015005B6F6473416374537069735265702E224F5450225D00000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      000002000000CC00020000000000FFFFFF000000000200000000000000000108
      67000007004D656D6F3132330002001003000058020000EC0000001000000003
      00080001000000000000000000FFFFFF1F2C02000000000001001300D0E0F1F8
      E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF0000000000020000000100
      0000000500417269616C000A00000000000000000002000000CC000200000000
      00FFFFFF0000000002000000000000000001A167000007004D656D6F31323400
      0200980000006C0200009C000000100000000300020001000000000000000000
      FFFFFF1F2C020000000000010019005B6F6473416374537069735265702E2244
      4F4C4F545034225D00000000FFFF000000000002000000010000000005004172
      69616C000A00000000000000000002000000CC00020000000000FFFFFF000000
      00020000000000000000012A68000007004D656D6F313235000200980000007C
      0200009C000000100000000300080001000000000000000000FFFFFF1F2C0200
      0000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF000000000002000000
      01000000000500417269616C000A00000000000000000002000000CC00020000
      000000FFFFFF0000000002000000000000000001AA68000007004D656D6F3132
      36000200400100006C0200009C00000010000000030002000100000000000000
      0000FFFFFF1F2C0200000000000100000000000000FFFF000000000002000000
      01000000000500417269616C000A00000000000000000000000000CC00020000
      000000FFFFFF00000000020000000000000000013169000007004D656D6F3132
      37000200400100007C0200009C00000010000000030008000100000000000000
      0000FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000200
      0000CC00020000000000FFFFFF0000000002000000000000000001C769000007
      004D656D6F313238000200E40100006C020000EC000000100000000300020001
      000000000000000000FFFFFF1F2C020000000000010016005B6F647341637453
      7069735265702E224F545034225D00000000FFFF000000000002000000010000
      00000500417269616C000A00000000000000000002000000CC00020000000000
      FFFFFF00000000020000000000000000015A6A000007004D656D6F3132390002
      00E40100007C020000EC000000100000000300080001000000000000000000FF
      FFFF1F2C02000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1
      E800000000FFFF00000000000200000001000000000500417269616C000A0000
      0000000000000002000000CC00020000000000FFFFFF00000000020000000000
      00000001F36A000007004D656D6F31333500020098000000940200009C000000
      100000000300020001000000000000000000FFFFFF1F2C020000000000010019
      005B6F6473416374537069735265702E22444F4C4F545031225D00000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      02000000CC00020000000000FFFFFF00000000020000000000000000017C6B00
      0007004D656D6F31333600020098000000A40200009C00000010000000030008
      0001000000000000000000FFFFFF1F2C02000000000001000900C4EEEBE6EDEE
      F1F2FC00000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000002000000CC00020000000000FFFFFF0000000002000000
      000000000001FC6B000007004D656D6F31333700020040010000940200009C00
      0000100000000300020001000000000000000000FFFFFF1F2C02000000000001
      00000000000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000000000000CC00020000000000FFFFFF0000000002000000
      000000000001836C000007004D656D6F31333800020040010000A40200009C00
      0000100000000300080001000000000000000000FFFFFF1F2C02000000000001
      000700CFEEE4EFE8F1FC00000000FFFF00000000000200000001000000000500
      417269616C000A00000000000000000002000000CC00020000000000FFFFFF00
      00000002000000000000000001196D000007004D656D6F313339000200E40100
      0094020000EC000000100000000300020001000000000000000000FFFFFF1F2C
      020000000000010016005B6F6473416374537069735265702E224F545031225D
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      00000000000002000000CC00020000000000FFFFFF0000000002000000000000
      000001AC6D000007004D656D6F313531000200E4010000A4020000EC00000010
      0000000300080001000000000000000000FFFFFF1F2C02000000000001001300
      D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF00000000000200
      000001000000000500417269616C000A00000000000000000002000000CC0002
      0000000000FFFFFF0000000002000000000000000001456E000007004D656D6F
      313532000200980000004C0100009C0000001000000003000200010000000000
      00000000FFFFFF1F2C020000000000010019005B6F6473416374537069735265
      702E22444F4C4F545031225D00000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000002000000CC00020000000000FFFF
      FF0000000002000000000000000001CE6E000007004D656D6F31353300020098
      0000005C0100009C000000100000000300080001000000000000000000FFFFFF
      1F2C02000000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF0000000000
      0200000001000000000500417269616C000A00000000000000000002000000CC
      00020000000000FFFFFF00000000020000000000000000014E6F000007004D65
      6D6F313534000200400100004C0100009C000000100000000300020001000000
      000000000000FFFFFF1F2C0200000000000100000000000000FFFF0000000000
      0200000001000000000500417269616C000A00000000000000000000000000CC
      00020000000000FFFFFF0000000002000000000000000001D56F000007004D65
      6D6F313535000200400100005C0100009C000000100000000300080001000000
      000000000000FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC00000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      000002000000CC00020000000000FFFFFF00000000020000000000000000016B
      70000007004D656D6F313536000200E40100004C010000EC0000001000000003
      00020001000000000000000000FFFFFF1F2C020000000000010016005B6F6473
      416374537069735265702E224F545031225D00000000FFFF0000000000020000
      0001000000000500417269616C000A00000000000000000002000000CC000200
      00000000FFFFFF0000000002000000000000000001FE70000007004D656D6F31
      3537000200E40100005C010000EC000000100000000300080001000000000000
      000000FFFFFF1F2C02000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEE
      E4EFE8F1E800000000FFFF00000000000200000001000000000500417269616C
      000A00000000000000000002000000CC00020000000000FFFFFF000000000200
      000000000000FEFEFF030000000A002043617465676F72793100000000040073
      756D6D0001003000070073747273756D6D000000000000000000000000FC0100
      00000000000000000000000000000058000ACF5E302ED2E2408D9AC395D66DE4
      40}
  end
  object odsKart: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '    ROWNUM,'
      '    B.*--'
      '  FROM'
      '  (SELECT * FROM'
      '    (SELECT '
      '        TDPC.Dpid,'
      '        999999999999 AS FK_ID,'
      '       '#9'TDPC.DPCID,'
      '       '#9'TKART.MEDICID,'
      '        FN_TREBKOL,'
      '       '#9'TDPC.FN_KOL,'
      '              TDPC.FC_RETURN_POST,'
      '        TKART.fn_price as fn_price,       '#9
      '        (TDPC.fn_kol*TKART.fn_price) AS summ,'
      '       '#9'TKART.KARTID,'
      '        TKart.MEDICID AS kmedicid,'
      '       '#9'TMEDIC.FC_NAME AS NAMEKART,'
      '         TKART.fn_party_num,'
      '        TKART.FC_SERIAL,'
      '        TKART.FD_GODEN,'
      '        TO_CHAR(TKART.FD_GODEN, '#39'DD.MM.YY'#39') as FC_GODEN_DDMMYY,'
      '        TDPC.FD_DATE_SPIS,'
      
        '        /*MED.pkgtmedic.getedizmname(tkart.medicid)*/TEI.FC_NAME' +
        ' as fc_edizm,'
      '        TKART.fc_inv_nomer,'
      '        TKART.FC_QUOTA_CODE,'
      '        TKART.FK_FINSOURCE_ID,'
      '        FS.FC_NAME as FC_FINSOURCE,'
      
        '        MED.PKGTMO.GetNameByID(TDPC.FK_CREATE_MO_ID) FC_CREATE_M' +
        'O,'
      '        MED.PKGTMO.GetNameByID(TDPC.FK_EDIT_MO_ID) FC_EDIT_MO,'
      '        TKART.FN_NDS,'
      '        TKART.FN_NACENKA,'
      '        TKART.FN_PRICE_MNF,'
      '        TKART.FL_JNVLS,'
      '        TMEDIC.FL_MIBP,'
      '        TMEDIC.FL_FORMULAR,'
      '        TMEDIC.FC_INTERNATIONAL_NAME,'
      
        '        (SELECT '#39#8470#39'||d.fc_doc||'#39' '#1086#1090' '#39'||TO_CHAR(d.fd_invoice,'#39'dd.' +
        'mm.yyyy'#39')||'#39#1075#39' FROM MED.TDOCS d, MED.TDPC dp where d.dpid = dp.d' +
        'pid and TKART.kartid = dp.kartid and d.fp_vid = 1) as FC_PRIH_DO' +
        'C,'
      
        '        (SELECT MAX(fc_remark) FROM asu.tnazmark WHERE fk_id = T' +
        'DPC.FK_NAZMARK_ID) FC_REMARK'
      ''
      '       FROM'
      '       '#9'MED.TDPC,'
      '       '#9'MED.TKART,'
      '              MED.TMEDIC,'
      '              MED.TEI,'
      '              MED.TFINSOURCE FS'
      '       WHERE TDPC.DPID = :ADPID'
      '        '#9'AND TDPC.KARTID = TKART.KARTID'
      '              AND TKART.MEDICID = TMEDIC.MEDICID'
      '              AND TMEDIC.EIID = TEI.EIID(+)'
      '              AND TKART.FK_FINSOURCE_ID = FS.FK_ID(+) '
      '                       '
      '    ) A'
      '    ORDER BY LOWER(A.NAMEKART)'
      '--    ORDER BY FK_ID'
      '  ) B')
    ReadBuffer = 50
    Optimize = False
    Variables.Data = {0300000001000000060000003A4144504944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001A000000080000004E414D454B415254010000000000060000004B41
      5254494401000000000006000000464E5F4B4F4C010000000000070000004D45
      4449434944010000000000050000004450434944010000000000040000005355
      4D4D01000000000006000000524F574E554D0100000000000900000046435F53
      455249414C0100000000000A000000464E5F545245424B4F4C01000000000008
      00000046435F4544495A4D01000000000005000000464B5F4944010000000000
      080000004B4D4544494349440100000000000400000044504944010000000000
      08000000464E5F50524943450100000000000C000000464E5F50415254595F4E
      554D0100000000000800000046445F474F44454E0100000000000E0000004643
      5F52455455524E5F504F53540100000000000C00000046445F444154455F5350
      49530100000000000F00000046435F474F44454E5F44444D4D59590100000000
      000C00000046435F494E565F4E4F4D45520100000000000D00000046435F5155
      4F54415F434F44450100000000000C00000046435F46494E534F555243450100
      0000000006000000464E5F4E44530100000000000A000000464E5F4E4143454E
      4B410100000000000C000000464E5F50524943455F4D4E460100000000000800
      0000464C5F4A4E564C53010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 190
    Top = 460
  end
  object dsKart: TDataSource
    DataSet = odsKart
    Left = 232
    Top = 460
  end
  object pmDocsFilterPeriod: TPopupMenu
    Left = 918
    Top = 128
    object N19: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = N15Click
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object N20: TMenuItem
      Tag = 5
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1076#1077#1085#1100
      OnClick = N15Click
    end
    object N18: TMenuItem
      Tag = 4
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
      OnClick = N15Click
    end
    object N16: TMenuItem
      Tag = 2
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1075#1086#1076
      OnClick = N15Click
    end
    object N21: TMenuItem
      Caption = '-'
    end
    object N17: TMenuItem
      Tag = 3
      Caption = #1055#1088#1086#1096#1083#1099#1081' '#1084#1077#1089#1103#1094
      OnClick = N15Click
    end
    object N15: TMenuItem
      Tag = 1
      Caption = #1055#1088#1086#1096#1083#1099#1081' '#1075#1086#1076
      OnClick = N15Click
    end
  end
  object frxReturnPostav: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39388.589793113400000000
    ReportOptions.LastChange = 40074.416565601850000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo9OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SET('#39'NaimKol'#39',<LINE>);  '
      'end;'
      ''
      'procedure Memo27OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  SET('#39'FN_SUMM'#39', <FN_SUMM>+<frxDBodsKart."SUMM">);              ' +
        '           '
      'end;'
      ''
      ''
      
        'procedure meGlavVrachOnPreviewClick(Sender: TfrxView; Button: TM' +
        'ouseButton; Shift: Integer; var Modified: Boolean);'
      'begin'
      '  Modified := True;  '
      'end;'
      ''
      
        'procedure meGlavBuhOnPreviewClick(Sender: TfrxView; Button: TMou' +
        'seButton; Shift: Integer; var Modified: Boolean);'
      'begin'
      '  Modified := True;  '
      'end;'
      ''
      
        'procedure meZavAptOnPreviewClick(Sender: TfrxView; Button: TMous' +
        'eButton; Shift: Integer; var Modified: Boolean);'
      'begin'
      '  Modified := True;  '
      'end;'
      ''
      
        'procedure meDateOnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'begin'
      '  Modified := True;  '
      'end;'
      ''
      
        'procedure Memo40OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1099#39', '#39#1055#1086 +
        #1089#1090#1072#1074#1097#1080#1082':'#39', s);'
      '  Modified := True;'
      'end;'
      ''
      
        'procedure Memo39OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1099#39', '#39#1043#1088 +
        #1091#1079#1086#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100':'#39', s);'
      '  Modified := True;'
      'end;'
      ''
      'procedure MasterData6OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   SET('#39'FN_SUMM'#39', 0);  '
      'end;'
      ''
      
        'procedure Memo6OnPreviewClick(Sender: TfrxView; Button: TMouseBu' +
        'tton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1055#1083#1072#1090#1077#1083#1100#1097#1080#1082#39', '#39#1055#1083#1072#1090#1077#1083#1100#1097#1080 +
        #1082':'#39', s);'
      '  Modified := True;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnClickObject = frxReturnPostavClickObject
    OnGetValue = frxReturnPostavGetValue
    OnUserFunction = frxReturnPostavUserFunction
    Left = 526
    Top = 108
    Datasets = <
      item
        DataSet = frxDBdsSelDocMove
        DataSetName = 'frxDBdsSelDocMove'
      end
      item
        DataSet = frxDBodsKart
        DataSetName = 'frxDBodsKart'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'NaimKol'
        Value = Null
      end
      item
        Name = 'FN_SUMM'
        Value = Null
      end>
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object Header1: TfrxHeader
        Height = 75.590600000000000000
        Top = 325.039580000000000000
        Width = 1009.134510000000000000
        object Memo15: TfrxMemoView
          Left = 654.638220000000000000
          Top = 22.677180000000000000
          Width = 52.157480310000000000
          Height = 52.913420000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#8218#1056#176#1056#1030#1056#1108#1056#176' %')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 706.760000000000000000
          Top = 22.677180000000000000
          Width = 79.760000000000000000
          Height = 52.913420000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 37.795300000000000000
          Width = 302.362400000000000000
          Height = 75.590600000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 340.157700000000000000
          Width = 74.590600000000000000
          Height = 75.590600000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 414.630180000000000000
          Width = 54.803149606299200000
          Height = 75.590600000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 469.441250000000000000
          Width = 83.149660000000000000
          Height = 75.590600000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 654.638220000000000000
          Width = 131.905511811024000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#8221#1056#1038)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 786.701300000000000000
          Width = 102.047310000000000000
          Height = 75.590600000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1057#1027
            #1057#1107#1057#8225#1056#181#1057#8218#1056#1109#1056#1112
            #1056#1116#1056#8221#1056#1038)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 888.748610000000000000
          Width = 120.165430000000000000
          Height = 75.590600000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1057#1027#1057#8225#1056#181#1057#8218#1056#176
            #1056#1169#1056#176#1057#8218#1056#176
            #1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1108#1056#1105' '#1056#1030
            #1056#176#1056#1111#1057#8218#1056#181#1056#1108#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 552.590910000000000000
          Width = 102.047310000000000000
          Height = 75.590600000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1056#177#1056#181#1056#183
            #1057#1107#1057#8225#1056#181#1057#8218#1056#176
            #1056#1116#1056#8221#1056#1038)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 1.000000000000000000
          Width = 36.795300000000000000
          Height = 75.590600000000000000
          OnBeforePrint = 'Memo8OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 423.307360000000000000
        Width = 1009.134510000000000000
        DataSet = frxDBodsKart
        DataSetName = 'frxDBodsKart'
        RowCount = 0
        Stretched = True
        object Memo9: TfrxMemoView
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo9OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 37.795300000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBodsKart."NAMEKART"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 340.157700000000000000
          Width = 74.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBodsKart."FC_EDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 469.441250000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[<frxDBodsKart."FN_PRICE">*(100/110)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 552.590910000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[<frxDBodsKart."SUMM"> - (<frxDBodsKart."SUMM">*(10/110))]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 414.630180000000000000
          Width = 54.803149610000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBodsKart."FN_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 654.638220000000000000
          Width = 52.157480314960620000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '10%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 706.760000000000000000
          Width = 79.760000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[<frxDBodsKart."SUMM">*(10/110)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 786.701300000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo27OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[<frxDBodsKart."SUMM">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object meInput1: TfrxMemoView
          Left = 888.748610000000000000
          Width = 120.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBodsKart."FC_RETURN_POST"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 268.771800000000000000
        Top = 464.882190000000000000
        Width = 1009.134510000000000000
        OnBeforePrint = 'Footer1OnBeforePrint'
        object Memo31: TfrxMemoView
          Top = 1.204700000000000000
          Width = 698.953000000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1118#1056#1109#1056#1030#1056#176#1057#1026#1056#1029#1056#176#1057#1039' '#1056#1029#1056#176#1056#1108#1056#187#1056#176#1056#1169#1056#1029#1056#176#1057#1039' '#1056#1030' '#1056#1111#1057#1026#1056#1105#1056#187#1056#1109#1056#182#1056#181#1056#1029#1056#1105#1056#1105' '#1056#1105#1056#1112 +
              #1056#181#1056#181#1057#8218' [GET_NAIM_KOL(<TotalPages>, 0)] '#1056#187#1056#1105#1057#1027#1057#8218'(-'#1056#1109#1056#1030')'
            
              #1056#152' '#1057#1027#1056#1109#1056#1169#1056#181#1057#1026#1056#182#1056#1105#1057#8218' [GET_NAIM_KOL(<NaimKol>, 0)] '#1056#1111#1056#1109#1057#1026#1057#1039#1056#1169#1056#1108#1056#1109#1056 +
              #1030#1057#8249#1056#8470' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026' '#1056#183#1056#176#1056#1111#1056#1105#1057#1027#1056#1105)
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Top = 39.000000000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1109#1057#8218#1056#1111#1057#1107#1057#8240#1056#181#1056#1029#1056#1109)
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 699.016204000000000000
          Top = 0.787353000000000000
          Width = 66.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 765.606804000000000000
          Top = 1.031447000000000000
          Width = 124.960699000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo30OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 130.000000000000000000
          Top = 41.000000000000000000
          Width = 879.488746000000000000
          Height = 37.417347000000000000
          OnBeforePrint = 'Memo5OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              '[GET_NAIM_KOL(<NaimKol>, 2)] '#1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039'(-'#1056#1105#1056#8470') '#1056#1029#1056 +
              #176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' [MONEYSTR(<FN_SUMM>)]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 26.000000000000000000
          Top = 189.385900000000000000
          Width = 104.338900000000000000
          Height = 20.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8220#1057#1026#1057#1107#1056#183' '#1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#1105#1056#187':')
          ParentFont = False
        end
        object meDate: TfrxMemoView
          Left = 76.181200000000000000
          Top = 239.874150000000000000
          Width = 249.685220000000000000
          Height = 23.897650000000000000
          OnPreviewClick = 'meDateOnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          TagStr = #1042#1074#1077#1076#1080#1090#1077' '#1076#1072#1090#1091
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            ' [DATERUSSTR(NOW)]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 130.000000000000000000
          Top = 189.000000000000000000
          Width = 524.338900000000000000
          Height = 20.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              '________________________________________________________________' +
              '_')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 26.000000000000000000
          Top = 84.000031000000000000
          Width = 259.000000000000000000
          Height = 79.590600000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#1119)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 285.000000000000000000
          Top = 84.000030999999970000
          Width = 217.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8220#1056#187#1056#176#1056#1030#1056#1029#1057#8249#1056#8470' '#1056#1030#1057#1026#1056#176#1057#8225' '#1056#1115#1056#1113#1056#8216)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo36: TfrxMemoView
          Left = 285.000000000000000000
          Top = 110.787415000000000000
          Width = 217.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8220#1056#187#1056#176#1056#1030#1056#1029#1057#8249#1056#8470' '#1056#177#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026' '#1056#1115#1056#1113#1056#8216)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo37: TfrxMemoView
          Left = 285.000000000000000000
          Top = 140.700835000000000000
          Width = 217.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1107#1057#1027#1057#8218#1056#1105#1056#187': '#1056#183#1056#176#1056#1030'. '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470' '#1056#1115#1056#1113#1056#8216)
          ParentFont = False
          VAlign = vaBottom
        end
        object meGlavVrach: TfrxMemoView
          Left = 687.110235000000000000
          Top = 84.000030999999970000
          Width = 514.228820000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'meGlavVrachOnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          TagStr = #1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[var_glav_vrach]')
          ParentFont = False
          VAlign = vaBottom
        end
        object meGlavBuh: TfrxMemoView
          Left = 687.110235000000000000
          Top = 111.110235000000000000
          Width = 514.393700790000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'meGlavBuhOnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          TagStr = #1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[var_glav_buh]')
          ParentFont = False
          VAlign = vaBottom
        end
        object meZavApt: TfrxMemoView
          Left = 687.110235000000000000
          Top = 141.110235000000000000
          Width = 514.393700790000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'meZavAptOnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          TagStr = #1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[var_zav_apteka]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo43: TfrxMemoView
          Left = 502.000000000000000000
          Top = 84.000000000000050000
          Width = 172.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo44: TfrxMemoView
          Left = 502.000000000000000000
          Top = 111.000000000000000000
          Width = 172.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo45: TfrxMemoView
          Left = 502.000000000000000000
          Top = 141.000000000000100000
          Width = 172.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object MasterData2: TfrxMasterData
        Height = 20.000000000000000000
        Top = 18.897650000000000000
        Width = 1009.134510000000000000
        RowCount = 1
        Stretched = True
        object Memo1: TfrxMemoView
          Left = 1.000000000000000000
          Width = 130.134510000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            #1056#8220#1057#1026#1057#1107#1056#183#1056#1109#1056#1109#1057#8218#1056#1111#1057#1026#1056#176#1056#1030#1056#1105#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 131.000000000000000000
          Width = 879.130000000000000000
          Height = 20.000000000000000000
          OnPreviewClick = 'Memo39OnPreviewClick'
          ShowHint = False
          StretchMode = smMaxHeight
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[var_rekviziti]')
          ParentFont = False
        end
      end
      object MasterData3: TfrxMasterData
        Height = 20.000000000000000000
        Top = 60.472480000000000000
        Width = 1009.134510000000000000
        RowCount = 1
        Stretched = True
        object Memo2: TfrxMemoView
          Width = 130.236860000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            #1056#8220#1057#1026#1057#1107#1056#183#1056#1109#1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 130.236860000000000000
          Width = 878.897650000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[var_poluch_rekviziti]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData4: TfrxMasterData
        Height = 20.000000000000000000
        Top = 102.047310000000000000
        Width = 1009.134510000000000000
        RowCount = 1
        Stretched = True
        object Memo40: TfrxMemoView
          Left = 100.898270000000000000
          Width = 909.236240000000000000
          Height = 20.000000000000000000
          OnPreviewClick = 'Memo40OnPreviewClick'
          ShowHint = False
          StretchMode = smMaxHeight
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[frxDBdsSelDocMove."FC_POSTAV_NAME"] [frxDBdsSelDocMove."FC_REKV' +
              'IZITI"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 1.000000000000000000
          Width = 99.898270000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1057#8240#1056#1105#1056#1108)
          ParentFont = False
        end
      end
      object MasterData5: TfrxMasterData
        Height = 20.000000000000000000
        Top = 143.622140000000000000
        Width = 1009.134510000000000000
        RowCount = 1
        Stretched = True
        object Memo6: TfrxMemoView
          Left = 99.898270000000000000
          Width = 909.236240000000000000
          Height = 20.000000000000000000
          OnPreviewClick = 'Memo6OnPreviewClick'
          ShowHint = False
          StretchMode = smMaxHeight
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Width = 99.898270000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#187#1056#176#1057#8218#1056#181#1056#187#1057#1034#1057#8240#1056#1105#1056#1108)
          ParentFont = False
        end
      end
      object MasterData6: TfrxMasterData
        Height = 118.779530000000000000
        Top = 185.196970000000000000
        Width = 1009.134510000000000000
        OnBeforePrint = 'MasterData6OnBeforePrint'
        RowCount = 1
        object Memo4: TfrxMemoView
          Top = 16.000000000000000000
          Width = 1009.134510000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1118#1056#1115#1056#8217#1056#1106#1056#160#1056#1116#1056#1106#1056#1031' '#1056#1116#1056#1106#1056#1113#1056#8250#1056#1106#1056#8221#1056#1116#1056#1106#1056#1031' ('#1056#1030#1056#1109#1056#183#1056#1030#1057#1026#1056#176#1057#8218') '#1074#8222#8211'  [frxDB' +
              'dsSelDocMove."FC_DOC"]  '#1056#1109#1057#8218'  [frxDBdsSelDocMove."FC_INVOICE_DDM' +
              'MYYYY"] '#1056#1110'.')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          Left = 38.800000000000000000
          Top = 72.692950000000030000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#1027#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181':')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo5: TfrxMemoView
          Left = 151.976500000000000000
          Top = 72.692950000000000000
          Width = 857.819420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBdsSelDocMove."FC_RASHPRICHINA"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo46: TfrxMemoView
          Left = 151.181200000000000000
          Top = 93.708720000000000000
          Width = 857.819420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBdsSelDocMove."FC_COMMENT"]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
    end
  end
  object frTrebNakl: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    PrintIfEmpty = False
    ShowProgress = False
    StoreInDFM = True
    Title = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077
    RebuildPrinter = False
    Left = 405
    Top = 322
    ReportForm = {
      190000002E1F0000190000FFFF01000100FFFFFFFFFF09000000340800009A0B
      00002400000024000000240000002400000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      00001C000000F6020000B50000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D004D61737465
      72486561646572310002010000000044010000F6020000320000007000040001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      02006D0200000B004D617374657244617461310002010000000090010000F602
      0000110000003900050001000000000000000000FFFFFF1F000000000D006672
      44426473496E766F6963650000000006000500626567696E0D60002F2F202069
      66205B46494E414C504153535D20616E6420285B50414745235D203D205B544F
      54414C50414745535D2D312920414E4420285B4652454553504143455D203C20
      5265706F727453756D6D617279312E48656967687429207468656E0D0E002F2F
      202020204E6577506167653B0D1D002F2F202020207768696C65204672656553
      70616365203E20323020646F0D19002F2F20202020202053686F7742616E6428
      4368696C6431293B0D0300656E6400FFFF000000000002000000010000000000
      000001000000C800000014000000010000000000000200DA0200000D004D6173
      746572466F6F7465723100020100000000C0010000F6020000E5000000300006
      0001000000000000000000FFFFFF1F00000000000000000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200450300000B0050616765466F6F7465723100020100000000F4030000
      F6020000150000003000030001000000000000000000FFFFFF1F000000000000
      00000000000000FFFF000000000002000000010000000000000001000000C800
      000014000000010000000000000000F403000006004D656D6F31330002002400
      00007D00000074000000140000000300000001000000000000000000FFFFFF1F
      2C02000000000001000C00D2D0C5C1CEC2C0CDC8C520B9000300050062656769
      6E0D1400202046435F4E41494D5F4B4F4C203A3D2027273B0D0300656E6400FF
      FF00000000000200000001000000010500417269616C000A0000000200000000
      0008000000CC00020000000000FFFFFF00000000020000000000000000008C04
      000006004D656D6F3134000200980000007D000000D000000014000000030000
      0001000000000000000000FFFFFF1F2C02000000000001001900205B6F647353
      656C446F634D6F76652E2246435F444F43225D00000000FFFF00000000000200
      000001000000000500417269616C000A00000004000000000008000000CC0002
      0000000000FFFFFF00000000020000000000000000001605000006004D656D6F
      313900020024000000B20000004D000000140000000300000001000000000000
      000000FFFFFF1F2C02000000000001000B00D7E5F0E5E720EAEEE3EE3A000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      00000010000000CC00020000000000FFFFFF0000000002000000000000000000
      AF05000006004D656D6F323000020070000000B20000005E0200001400000003
      00000001000000000000000000FFFFFF1F2C02000000000001001A005B6F6473
      53656C446F634D6F76652E224E414D4546524F4D225D00000000FFFF00000000
      000200000001000000000500417269616C000A00000004000000000008000000
      CC00020000000000FFFFFF00000000020000000000000000003A06000006004D
      656D6F343500020047000000440100001D0100003200000003000F002C010000
      000000000000FFFFFF1F2C02000000000001000C00CDE0E8ECE5EDEEE2E0EDE8
      E500000000FFFF00000000000200000001000000000500417269616C00090000
      000200000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000BE06000006004D656D6F323200020024000000440100002300000032
      00000003000F002C010000000000000000FFFFFF1F2C02000000000001000500
      B920EF2FEF00000000FFFF00000000000200000001000000000500417269616C
      00090000000200000000000A000000CC00020000000000FFFFFF000000000200
      00000000000000004807000006004D656D6F32330002001F020000440100004A
      0000003200000003000F002C010000000000000000FFFFFF1F2C020000000000
      02000500D6E5EDE02C0D0300F0F3E100000000FFFF0000000000020000000100
      0000000500417269616C00090000000200000000000A000000CC000200000000
      00FFFFFF0000000002000000000000000000D507000006004D656D6F33300002
      008E01000044010000460000003200000001000F002C010000000000000000FF
      FFFF1F2C02000000000002000500D2F0E5E12E0D0600EAEEEB2DE2EE00000000
      FFFF00000000000200000001000000000500417269616C000900000002000000
      00000A000000CC00020000000000FFFFFF000000000200000000000000000062
      08000006004D656D6F3331000200D4010000440100004B000000320000000300
      0F002C010000000000000000FFFFFF1F2C02000000000002000500D4E0EAF22E
      0D0600EAEEEB2DE2EE00000000FFFF0000000000020000000100000000050041
      7269616C00090000000200000000000A000000CC00020000000000FFFFFF0000
      000002000000000000000000ED08000006004D656D6F33320002006902000044
      010000670000003200000003000F002C010000000000000000FFFFFF1F2C0200
      0000000002000600D1F3ECECE02C0D0300F0F3E100000000FFFF000000000002
      00000001000000000500417269616C00090000000200000000000A000000CC00
      020000000000FFFFFF00000000020000000000000000007409000006004D656D
      6F323600020064010000440100002A0000003200000007000F002C0100000000
      00000000FFFFFF1F2C02000000000001000800C5E42E20E8E7EC2E00000000FF
      FF00000000000200000001000000000500417269616C00090000000200000000
      000A000000CC00020000000000FFFFFF0000000002000000000000000000100A
      000006004D656D6F323700020047000000900100001D0100001100000003000F
      002C010000000000000000FFFFFF1F2C02000000000001001D005B6F6473496E
      766F696365322E2246435F4D454449435F4E414D45225D00000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000080000
      00CC00020000000000FFFFFF0000000002000000000000000000BB0A00000600
      4D656D6F32380002002400000090010000230000001100000003000F002C0100
      00000000000000FFFFFF1F2C020000000000010007005B4C494E45235D000300
      0500626567696E0D150020204E61696D4B6F6C203A3D205B4C494E45235D3B0D
      0300656E6400FFFF00000000000200000001000000000500417269616C000A00
      00000000000000000A000000CC00020000000000FFFFFF000000000200000000
      0000000000560B000006004D656D6F32390002001F020000900100004A000000
      1100000003000F002C010000000000000000FFFFFF1F2C02030100000001001C
      005B6F6473496E766F696365322E22464E5F4156475F5052494345225D000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      00000009000000CC00020000000000FFFFFF0000000002000000000000000000
      F00B000006004D656D6F33350002008E01000090010000460000001100000001
      000F002C010000000000000000FFFFFF1F2C02000000000001001B005B6F6473
      496E766F696365322E22464E5F545245425F4B4F4C225D00000000FFFF000000
      00000200000001000000000500417269616C000A0000000000000000000A0000
      00CC00020000000000FFFFFF00000000020000000000000000008C0C00000600
      4D656D6F3336000200D4010000900100004B0000001100000003000F002C0100
      00000000000000FFFFFF1F2C02000000000001001D005B6F6473496E766F6963
      65322E22464E5F564944414E4F5F4B4F4C225D00000000FFFF00000000000200
      000001000000000500417269616C000A0000000000000000000A000000CC0002
      0000000000FFFFFF0000000002000000000000000000280D000006004D656D6F
      33370002006902000090010000670000001100000003000F002C010000000000
      000000FFFFFF1F2C02030100000001001D005B6F6473496E766F696365322E22
      464E5F564944414E4F5F53554D225D00000000FFFF0000000000020000000100
      0000000500417269616C000A00000000000000000009000000CC000200000000
      00FFFFFF0000000002000000000000000000C40D000006004D656D6F33380002
      0064010000900100002A0000001100000007000F002C010000000000000000FF
      FFFF1F2C02000000000001001D005B6F6473496E766F696365322E2246435F45
      44495A4D5F4E414D45225D00000000FFFF000000000002000000010000000005
      00417269616C000A0000000000000000000A000000CC00020000000000FFFFFF
      00000000020000000000000000004E0E000006004D656D6F3430000200250000
      00240200004A000000140000000300000001000000000000000000FFFFFF1F2C
      02000000000001000B00C7E0F2F0E5E1EEE2E0EB3A00000000FFFF0000000000
      0200000001000000000500417269616C000900000000000000000008000000CC
      00020000000000FFFFFF0000000002000000000000000000D50E000006004D65
      6D6F343100020098010000220200004200000014000000030000000100000000
      0000000000FFFFFF1F2C02000000000001000800CFEEEBF3F7E8EB3A00000000
      FFFF00000000000200000001000000000500417269616C000900000000000000
      00000A000000CC00020000000000FFFFFF000000000200000000000000000052
      0F000006004D656D6F34370002006D0000003702000064000000140000000300
      080001000000000000000000FFFFFF1F2C020000000000000000000000FFFF00
      000000000200000001000000000500417269616C000A0000000000000000000A
      000000CC00020000000000FFFFFF0000000002000000000000000000F70F0000
      06004D656D6F3530000200890100005A00000049010000140000000300000001
      000000000000000000FFFFFF1F2C020000000000010026005B6F647353656C44
      6F634D6F76652E2246435F4D4F47524F555049445F544F5F4F524947225D0000
      0000FFFF00000000000200000001000000020500417269616C000B0000000400
      0000000009000000CC00020000000000FFFFFF00000000020000000000000000
      009E10000006004D656D6F3531000200240000005A0000003901000014000000
      0300000001000000000000000000FFFFFF1F2C020000000000010028005B6F64
      7353656C446F634D6F76652E2246435F4D4F47524F555049445F46524F4D5F4F
      524947225D00000000FFFF00000000000200000001000000010500417269616C
      000B00000004000000000008000000CC00020000000000FFFFFF000000000200
      00000000000000002B11000006004D656D6F31370002002400000035000000AE
      020000200000000300000001000000000000000000FFFFFF1F2C020000000000
      01000E005B7661725F72656365697665725D00000000FFFF0000000000020000
      0001000000040500417269616C000B00000004000000000000000000CC000200
      00000000FFFFFF0000000002000000000000000000B011000006004D656D6F35
      3200020024000000C0010000450200001100000003000F002C01000000000000
      0000FFFFFF1F2C02000000000001000600C8F2EEE3EE3A00000000FFFF000000
      00000200000001000000000500417269616C000A000000020000000000090000
      00CC00020000000000FFFFFF0000000002000000000000000000641200000600
      4D656D6F353300020069020000C0010000670000001100000003000F002C0100
      00000000000000FFFFFF1F2C020401110023232320232323202323302E303020
      F02E00010024005B53554D285B6F6473496E766F696365322E22464E5F564944
      414E4F5F53554D225D295D00000000FFFF000000000002000000010000000005
      00417269616C000A00000002000000000009000000CC00020000000000FFFFFF
      0000000002000000000000000000FD12000006004D656D6F3538000200D10000
      0013020000B1000000240000000300000001000000000000000000FFFFFF1F2C
      02000000000001001A005B6F647353656C446F634D6F76652E224E414D454652
      4F4D225D00000000FFFF00000000000200000001000000000500417269616C00
      0A00000000000000000010000000CC00020000000000FFFFFF00000000020000
      000000000000009613000006004D656D6F363000020036020000150200009800
      0000240000000300000001000000000000000000FFFFFF1F2C02000000000001
      001A005B6F647353656C446F634D6F76652E224E414D4546524F4D225D000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      00000010000000CC00020000000000FFFFFF0000000002000000000000000000
      4314000006004D656D6F363500020022010000D4010000AF0100003D00000003
      0000002C010000000000000000FFFFFF1F2C02000000000001002E005B4D4F4E
      45595354522853554D285B6F6473496E766F696365322E22464E5F564944414E
      4F5F53554D225D29295D00000000FFFF00000000000200000001000000000500
      417269616C000A00000002000000000009000000CC00020000000000FFFFFF00
      00000002000000000000000000F914000006004D656D6F363600020028000000
      D8010000F8000000280000000300000001000000000000000000FFFFFF1F2C02
      000000000000000003000500626567696E0D2900202046435F4E41494D5F4B4F
      4C203A3D204745545F4E41494D5F4B4F4C28204E61696D4B6F6C20293B0D0300
      656E6400010000000000000200000001000000000500417269616C000A000000
      000000000000000000000100020000000000FFFFFF0000000002000000000000
      0000007815000006004D656D6F3432000200DA01000038020000580000001400
      00000300080001000000000000000000FFFFFF1F2C0200000000000100000000
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      00000716000006004D656D6F3434000200250000004302000067000000140000
      000300000001000000000000000000FFFFFF1F2C02000000000001001000C7E0
      E22E20EEF2E4E5EBE5EDE8E5EC3A00000000FFFF000000000002000000010000
      00000500417269616C000900000000000000000008000000CC00020000000000
      FFFFFF00000000020000000000000000008616000006004D656D6F3436000200
      8C00000057020000F4000000140000000300080001000000000000000000FFFF
      FF1F2C0200000000000100000000000000FFFF00000000000200000001000000
      000500417269616C00060000000000000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000002117000006004D656D6F343800020025
      00000065020000B2000000140000000300000001000000000000000000FFFFFF
      1F2C02000000000001001C00C7E0EC2E20E3EBE0E22E20E2F0E0F7E020EFEE20
      EFF0EEF4E8EBFE3A00000000FFFF000000000002000000010000000005004172
      69616C000900000000000000000008000000CC00020000000000FFFFFF000000
      0002000000000000000000A017000006004D656D6F3539000200D90000007902
      0000A7000000140000000300080001000000000000000000FFFFFF1F2C020000
      0000000100000000000000FFFF00000000000200000001000000000500417269
      616C000A0000000000000000000A000000CC00020000000000FFFFFF00000000
      020000000000000000004418000006004D656D6F333900020025000000880200
      00D6000000140000000300000001000000000000000000FFFFFF1F2C02000000
      000001002500C7E0EC2E20E3EBE0E22E20E2F0E0F7E020EFEE20EBE5F7E5E1ED
      EEE920F0E0E1EEF2E5203A00000000FFFF000000000002000000010000000005
      00417269616C000900000000000000000008000000CC00020000000000FFFFFF
      0000000002000000000000000000C318000006004D656D6F3433000200FA0000
      009C02000087000000040000000300080001000000000000000000FFFFFF1F2C
      0200000000000100000000000000FFFF00000000000200000001000000000500
      417269616C000A0000000000000000000A000000CC00020000000000FFFFFF00
      000000020000000000000000004F19000006004D656D6F36370002009A010000
      650200004F000000140000000300000001000000000000000000FFFFFF1F2C02
      000000000001000D00C7E0E22E20E0EFF2E5EAEEE93A00000000FFFF00000000
      000200000001000000000500417269616C000900000000000000000008000000
      CC00020000000000FFFFFF0000000002000000000000000000CE19000006004D
      656D6F3638000200E901000079020000E8000000140000000300080001000000
      000000000000FFFFFF1F2C0200000000000100000000000000FFFF0000000000
      0200000001000000000500417269616C000A0000000000000000000A000000CC
      00020000000000FFFFFF0000000002000000000000000000561A000006004D65
      6D6F36390002009A010000870200004200000014000000030000000100000000
      0000000000FFFFFF1F2C02000000000001000900CEF2EFF3F1F2E8EB3A000000
      00FFFF00000000000200000001000000000500417269616C0009000000000000
      00000008000000CC00020000000000FFFFFF0000000002000000000000000000
      D51A000006004D656D6F3730000200E90100009C020000E80000000600000003
      00080001000000000000000000FFFFFF1F2C0200000000000100000000000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      00000A000000CC00020000000000FFFFFF0000000002000000000000000A0B00
      54667252696368566965770000CD1C000006006D656D6F373700020024000000
      D4010000FC0000003C0000000100000001000000000000000000FFFFFF1F2C02
      0000000000000000000000FFFF000000000002000000010000000001CD1C0000
      7B5C727466315C616E73695C616E7369637067313235315C64656666305C6465
      666C616E67313034397B5C666F6E7474626C7B5C66305C666E696C5C66636861
      727365743230347B5C2A5C666E616D6520417269616C3B7D417269616C204359
      523B7D7B5C66315C666E696C5C66636861727365743020417269616C3B7D7B5C
      66325C666E696C204D532053616E732053657269663B7D7D0D0A7B5C636F6C6F
      7274626C203B5C726564305C677265656E305C626C7565303B7D0D0A5C766965
      776B696E64345C7563315C706172645C6366315C6C616E67313033335C66305C
      667332305C2763665C2765655C2765625C2766335C2766375C2765385C276562
      205C2765645C2765305C2765385C2765635C2765355C2765645C2765655C2765
      325C2765305C2765645C2765385C2765395C6631203A0D0A5C706172205C756C
      5C6630205B46435F4E41494D5F4B4F4C5D5C756C6E6F6E6520205C2765645C27
      6530205C2766315C2766335C2765635C2765635C2766333A5C6C616E67313034
      395C66325C66733136200D0A5C706172207D0D0A000000DD1D000005004D656D
      6F310002002400000092000000CC000000140000000300000001000000000000
      000000FFFFFF1F2C02000000000001002D00EEF2205B44617465527573537472
      285B6F647353656C446F634D6F76652E2246445F494E564F494345225D295D00
      03000500626567696E0D5500202F2F20EEF2205B464F524D4154444154455449
      4D452827272722272764642727222727206D6D6D6D2079797979202727E32E27
      27272C5B6F647353656C446F634D6F76652E2246445F494E564F494345225D29
      5D0D0300656E6400FFFF00000000000200000001000000010500417269616C00
      0A000000000000000000000000000100020000000000FFFFFF00000000020000
      00000000000000771E000005004D656D6F32000200F6010000F4030000DC0000
      00140000000300000001000000000000000000FFFFFF1F2C0200000000000100
      1C00D1F2F02E205B50414745235D20E8E7205B544F54414C50414745535D0000
      0000FFFF00000000000200000001000000020500417269616C00090000000000
      00000000090000000100020000000000FFFFFF00000000020000000000000000
      00FC1E000006006D654461746500020037020000380200009800000018000000
      0300000001000000000000000000FFFFFF1F2C020000000000010006005B4461
      74655D00000000FFFF00000000000200000001000000000500417269616C000A
      000000000000000000080000000100020000000000FFFFFF0000000002000000
      00000000FEFEFF000000000000000000000000FC000000000000000000000000
      0000000058002C0F48C6F5D3E240FBA6C395D66DE440}
  end
  object frxDBodsKart: TfrxDBDataset
    UserName = 'frxDBodsKart'
    CloseDataSource = False
    DataSet = odsKart
    BCDToCurrency = False
    Left = 298
    Top = 460
  end
  object odsInvoice2: TOracleDataSet
    SQL.Strings = (
      '--22686'
      'SELECT ROWNUM, A.*'
      ''
      'FROM'
      '(SELECT ALL_MEDICS.MEDICID,'
      
        '       DECODE(M.FL_PRINT_LAT_NAME, 1,M.FC_NAME_LAT, M.FC_NAME) a' +
        's FC_MEDIC_NAME,'
      '       E.FC_NAME as FC_EDIZM_NAME,'
      '       NVL(TREB_MEDICS.FN_TREB_KOL,0) as FN_TREB_KOL, '
      
        '       NVL(VIDANO_MEDICS.FN_VIDANO_KOL,0) as FN_VIDANO_KOL, VIDA' +
        'NO_MEDICS.FN_VIDANO_SUM, '
      
        '       ROUND((VIDANO_MEDICS.FN_VIDANO_SUM/VIDANO_MEDICS.FN_VIDAN' +
        'O_KOL),2) as FN_AVG_PRICE'
      '       '
      'FROM'
      '('
      'SELECT td.fk_medicid as MEDICID  '
      'FROM  MED.TTreb t, MED.TTreb_Dpc td'
      'WHERE t.fk_dpid = :ADPID'
      '  AND td.fk_trebid = t.fk_id'
      'UNION'
      'SELECT  K.medicid as MEDICID'
      'FROM'
      'MED.TDPC DPC, MED.TKART K'
      'WHERE DPC.dpid = :ADPID'
      '  AND DPC.kartid = K.kartid  '
      ') ALL_MEDICS, -- '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099', '#1079#1072#1087#1088#1086#1096#1077#1085#1085#1099#1077' '#1080' '#1074#1099#1076#1072#1085#1085#1099#1077
      ''
      '(SELECT td.fk_medicid as MEDICID, sum(td.fn_kol) as FN_TREB_KOL'
      'FROM  MED.TTreb t, MED.TTreb_Dpc td'
      'WHERE t.fk_dpid = :ADPID'
      '  AND td.fk_trebid = t.fk_id'
      
        'GROUP BY td.fk_medicid) TREB_MEDICS, -- '#1079#1072#1090#1088#1077#1073#1086#1074#1072#1085#1085#1099#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090 +
        #1099
      ''
      '(SELECT  K.medicid,'
      '        sum(DPC.fn_kol) as FN_VIDANO_KOL,'
      '        sum(DPC.fn_kol*K.fn_price) as FN_VIDANO_SUM'
      'FROM'
      'MED.TDPC DPC, MED.TKART K'
      'WHERE DPC.dpid = :ADPID'
      '  AND DPC.kartid = K.kartid'
      'GROUP BY K.medicid  ) VIDANO_MEDICS, -- '#1074#1099#1076#1072#1085#1085#1099#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099
      'MED.TMEDIC M, MED.TEI E'
      ''
      'WHERE'
      '    ALL_MEDICS.MEDICID = TREB_MEDICS.MEDICID(+)'
      'AND ALL_MEDICS.MEDICID = VIDANO_MEDICS.MEDICID(+)'
      'AND ALL_MEDICS.MEDICID = M.MEDICID -- '#1076#1086#1089#1090#1072#1077#1084' '#1080#1084#1103' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
      'AND M.EIID = E.EIID(+) -- '#1080' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1091#1087#1072#1082#1086#1074#1082#1080
      'ORDER BY LOWER(M.FC_NAME)'
      ') A')
    Optimize = False
    Variables.Data = {0300000001000000060000003A4144504944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000008000000070000004D45444943494401000000000006000000524F57
      4E554D0100000000000D00000046435F4D454449435F4E414D45010000000000
      0D00000046435F4544495A4D5F4E414D450100000000000B000000464E5F5452
      45425F4B4F4C0100000000000D000000464E5F564944414E4F5F4B4F4C010000
      0000000D000000464E5F564944414E4F5F53554D0100000000000C000000464E
      5F4156475F5052494345010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 518
    Top = 188
  end
  object frxDBdsSelDocMove: TfrxDBDataset
    UserName = 'frxDBdsSelDocMove'
    CloseDataSource = False
    DataSet = odsSelDocMove
    BCDToCurrency = False
    Left = 62
    Top = 450
  end
  object frxOtpuskPo_: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 39388.589793113400000000
    ReportOptions.LastChange = 40326.432792731480000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo9OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SET('#39'NaimKol'#39',<LINE>);    '
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '           '
      'end;'
      ''
      'procedure Memo19OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SET('#39'FN_SUMM'#39', <FN_SUMM>+<frxDBodsKart."SUMM">);  '
      'end;'
      ''
      
        'procedure meOsnovanieOnPreviewClick(Sender: TfrxView; Button: TM' +
        'ouseButton; Shift: Integer; var Modified: Boolean);'
      'begin'
      '  Modified := True;  '
      'end;'
      ''
      
        'procedure meDateOnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'begin'
      '  Modified := True;  '
      'end;'
      ''
      
        'procedure mePoluchatelOnPreviewClick(Sender: TfrxView; Button: T' +
        'MouseButton; Shift: Integer; var Modified: Boolean);'
      'begin'
      '  Modified := True;  '
      'end;'
      ''
      
        'procedure meGlavVrachOnPreviewClick(Sender: TfrxView; Button: TM' +
        'ouseButton; Shift: Integer; var Modified: Boolean);'
      'begin'
      '  Modified := True;  '
      'end;'
      ''
      
        'procedure meGlavBuhOnPreviewClick(Sender: TfrxView; Button: TMou' +
        'seButton; Shift: Integer; var Modified: Boolean);'
      'begin'
      '  Modified := True;  '
      'end;'
      ''
      
        'procedure meZavAptOnPreviewClick(Sender: TfrxView; Button: TMous' +
        'eButton; Shift: Integer; var Modified: Boolean);'
      'begin'
      '  Modified := True;  '
      'end;'
      ''
      'procedure Memo5OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  '
      'end;'
      ''
      
        'procedure Memo23OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1099#39', '#39#1043#1088 +
        #1091#1079#1086#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100':'#39', s);'
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
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1099#39', '#39#1055#1086 +
        #1089#1090#1072#1074#1097#1080#1082':'#39', s);'
      '  Modified := True;'
      'end;'
      ''
      'procedure MasterData6OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SET('#39'FN_SUMM'#39', 0);  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnClickObject = frxOtpuskPo_ClickObject
    OnGetValue = frxReturnPostavGetValue
    OnUserFunction = frxReturnPostavUserFunction
    Left = 588
    Top = 172
    Datasets = <
      item
        DataSet = frxDBdsSelDocMove
        DataSetName = 'frxDBdsSelDocMove'
      end
      item
        DataSet = frxDBodsKart
        DataSetName = 'frxDBodsKart'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'NaimKol'
        Value = Null
      end
      item
        Name = 'FN_SUMM'
        Value = Null
      end>
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
      LeftMargin = 20.000000000000000000
      RightMargin = 15.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object Header1: TfrxHeader
        Height = 33.590000000000000000
        Top = 279.685220000000000000
        Width = 990.236860000000000000
        object Memo10: TfrxMemoView
          Left = 40.000000000000000000
          Width = 550.000000000000000000
          Height = 33.590600000000000000
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
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 590.000000000000000000
          Width = 130.000000000000000000
          Height = 33.590600000000000000
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
        object Memo14: TfrxMemoView
          Left = 720.000000000000000000
          Width = 60.000000000000000000
          Height = 33.590600000000000000
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
        object Memo16: TfrxMemoView
          Left = 780.000000000000000000
          Width = 90.000000000000000000
          Height = 33.590600000000000000
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
            #1056#166#1056#181#1056#1029#1056#176', '#1057#1026#1057#1107#1056#177)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 870.000000000000000000
          Width = 120.000000000000000000
          Height = 33.590600000000000000
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
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026#1057#1107#1056#177)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Width = 40.000000000000000000
          Height = 33.590600000000000000
          OnBeforePrint = 'Memo8OnBeforePrint'
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
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 336.378170000000000000
        Width = 990.236860000000000000
        DataSet = frxDBodsKart
        DataSetName = 'frxDBodsKart'
        RowCount = 0
        Stretched = True
        object Memo9: TfrxMemoView
          Width = 40.000000000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo9OnBeforePrint'
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
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 40.000000000000000000
          Width = 550.000000000000000000
          Height = 18.897650000000000000
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
            '[frxDBodsKart."NAMEKART"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 590.000000000000000000
          Width = 130.000000000000000000
          Height = 18.897650000000000000
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
            '[frxDBodsKart."FC_EDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 780.000000000000000000
          Width = 90.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBodsKart."FN_PRICE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 870.000000000000000000
          Width = 120.000000000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo19OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBodsKart."SUMM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 720.000000000000000000
          Width = 60.000000000000000000
          Height = 18.897650000000000000
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
            '[frxDBodsKart."FN_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 278.882035000000000000
        Top = 377.953000000000000000
        Width = 990.236860000000000000
        OnBeforePrint = 'Footer1OnBeforePrint'
        object Memo31: TfrxMemoView
          Top = 8.385807000000000000
          Width = 780.000000000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1118#1056#1109#1056#1030#1056#176#1057#1026#1056#1029#1056#176#1057#1039' '#1056#1029#1056#176#1056#1108#1056#187#1056#176#1056#1169#1056#1029#1056#176#1057#1039' '#1056#1030' '#1056#1111#1057#1026#1056#1105#1056#187#1056#1109#1056#182#1056#181#1056#1029#1056#1105#1056#1105' '#1056#1105#1056#1112 +
              #1056#181#1056#181#1057#8218' [GET_NAIM_KOL(<TotalPages>, 0)] '#1056#187#1056#1105#1057#1027#1057#8218'(-'#1056#1109#1056#1030')'
            
              #1056#152' '#1057#1027#1056#1109#1056#1169#1056#181#1057#1026#1056#182#1056#1105#1057#8218' [GET_NAIM_KOL(<NaimKol>, 0)] '#1056#1111#1056#1109#1057#1026#1057#1039#1056#1169#1056#1108#1056#1109#1056 +
              #1030#1057#8249#1056#8470' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026' '#1056#183#1056#176#1056#1111#1056#1105#1057#1027#1056#1105)
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Top = 46.110235000000000000
          Width = 145.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1109#1057#8218#1056#1111#1057#1107#1057#8240#1056#181#1056#1029#1056#1109)
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 780.000000000000000000
          Width = 56.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 837.000000000000000000
          Width = 153.000000000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo30OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 145.000000000000000000
          Top = 46.417347000000000000
          Width = 845.000000000000000000
          Height = 37.417347000000000000
          OnBeforePrint = 'Memo5OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              '[GET_NAIM_KOL(<NaimKol>, 2)] '#1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039'(-'#1056#1105#1056#8470') '#1056#1029#1056 +
              #176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' [MONEYSTR(<FN_SUMM>)]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Top = 100.000031000000000000
          Width = 145.000000000000000000
          Height = 79.590600000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#1119)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 145.000000000000000000
          Top = 100.000031000000000000
          Width = 220.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8220#1056#187#1056#176#1056#1030#1056#1029#1057#8249#1056#8470' '#1056#1030#1057#1026#1056#176#1057#8225)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo36: TfrxMemoView
          Left = 145.000000000000000000
          Top = 126.787415000000000000
          Width = 220.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8220#1056#187#1056#176#1056#1030#1056#1029#1057#8249#1056#8470' '#1056#177#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo37: TfrxMemoView
          Left = 145.000000000000000000
          Top = 156.700835000000000000
          Width = 220.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1107#1057#1027#1057#8218#1056#1105#1056#187': '#1056#183#1056#176#1056#1030'. '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo38: TfrxMemoView
          Top = 202.496135000000000000
          Width = 145.000000000000000000
          Height = 20.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8220#1057#1026#1057#1107#1056#183' '#1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#1105#1056#187':')
          ParentFont = False
        end
        object meDate: TfrxMemoView
          Left = 145.000000000000000000
          Top = 252.984385000000000000
          Width = 445.000000000000000000
          Height = 23.897650000000000000
          OnPreviewClick = 'meDateOnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          TagStr = #1042#1074#1077#1076#1080#1090#1077' '#1076#1072#1090#1091
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            ' [DATERUSSTR(NOW)]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 145.000000000000000000
          Top = 202.496062990000000000
          Width = 445.000000000000000000
          Height = 20.900000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 365.000000000000000000
          Top = 100.000000000000000000
          Width = 225.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo15: TfrxMemoView
          Left = 365.000000000000000000
          Top = 127.000000000000000000
          Width = 225.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo20: TfrxMemoView
          Left = 365.000000000000000000
          Top = 157.000000000000000000
          Width = 225.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaBottom
        end
        object meGlavVrach: TfrxMemoView
          Left = 590.000000000000000000
          Top = 100.000000000000000000
          Width = 400.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'meGlavVrachOnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          TagStr = #1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[var_glav_vrach]')
          ParentFont = False
          VAlign = vaBottom
        end
        object meGlavBuh: TfrxMemoView
          Left = 590.000000000000000000
          Top = 127.110204000000000000
          Width = 400.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'meGlavBuhOnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          TagStr = #1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[var_glav_buh]')
          ParentFont = False
          VAlign = vaBottom
        end
        object meZavApt: TfrxMemoView
          Left = 590.000000000000000000
          Top = 157.110204000000000000
          Width = 400.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'meZavAptOnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          TagStr = #1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[var_zav_apteka]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object MasterData2: TfrxMasterData
        Height = 20.000000000000000000
        Top = 18.897650000000000000
        Width = 990.236860000000000000
        RowCount = 1
        Stretched = True
        object Memo24: TfrxMemoView
          Width = 145.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            #1056#8220#1057#1026#1057#1107#1056#183#1056#1109#1056#1109#1057#8218#1056#1111#1057#1026#1056#176#1056#1030#1056#1105#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 145.000000000000000000
          Width = 845.000000000000000000
          Height = 20.000000000000000000
          OnPreviewClick = 'Memo23OnPreviewClick'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[var_rekviziti]')
          ParentFont = False
        end
      end
      object MasterData3: TfrxMasterData
        Height = 20.000000000000000000
        Top = 60.472480000000000000
        Width = 990.236860000000000000
        RowCount = 1
        Stretched = True
        object Memo25: TfrxMemoView
          Width = 145.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            #1056#8220#1057#1026#1057#1107#1056#183#1056#1109#1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
        end
        object mePoluchatel: TfrxMemoView
          Left = 145.000000000000000000
          Width = 845.000000000000000000
          Height = 20.000000000000000000
          OnPreviewClick = 'mePoluchatelOnPreviewClick'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[var_poluch_rekviziti]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData6: TfrxMasterData
        Height = 64.000000000000000000
        Top = 143.622140000000000000
        Width = 990.236860000000000000
        OnBeforePrint = 'MasterData6OnBeforePrint'
        RowCount = 1
        object Memo4: TfrxMemoView
          Left = 1.000000000000000000
          Top = 18.000000000000000000
          Width = 990.236860000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1118#1056#1115#1056#8217#1056#1106#1056#160#1056#1116#1056#1106#1056#1031' '#1056#1116#1056#1106#1056#1113#1056#8250#1056#1106#1056#8221#1056#1116#1056#1106#1056#1031' '#1074#8222#8211'  [frxDBdsSelDocMove."FC_' +
              'DOC"]  '#1056#1109#1057#8218'  [frxDBdsSelDocMove."FC_INVOICE_DDMMYYYY"] '#1056#1110'.')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object MasterData5: TfrxMasterData
        Height = 27.000000000000000000
        Top = 230.551330000000000000
        Width = 990.236860000000000000
        RowCount = 1
        Stretched = True
        object Memo3: TfrxMemoView
          Width = 145.000000000000000000
          Height = 27.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1115#1057#1027#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181':')
          ParentFont = False
        end
        object meOsnovanie: TfrxMemoView
          Left = 145.000000000000000000
          Width = 845.000000000000000000
          Height = 27.000000000000000000
          OnPreviewClick = 'meOsnovanieOnPreviewClick'
          ShowHint = False
          StretchMode = smMaxHeight
          Cursor = crHandPoint
          TagStr = #1042#1074#1077#1076#1080#1090#1077' '#1086#1089#1085#1086#1074#1072#1085#1080#1077
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object MasterData4: TfrxMasterData
        Height = 20.000000000000000000
        Top = 102.047310000000000000
        Width = 990.236860000000000000
        RowCount = 1
        Stretched = True
        object Memo22: TfrxMemoView
          Left = 145.000000000000000000
          Width = 845.000000000000000000
          Height = 20.000000000000000000
          OnPreviewClick = 'Memo22OnPreviewClick'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[var_rekviziti]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Width = 145.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1057#8240#1056#1105#1056#1108)
          ParentFont = False
        end
      end
    end
  end
  object frKart_List: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 478
    Top = 66
    ReportForm = {
      190000006D1B0000190000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF0000000000000100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      00009C000000F6020000D20000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C8000000140000000100000000000002003F0100000B004D61737465
      72446174613100020100000000BC010000F60200001800000031000500010000
      00000000000000FFFFFF1F000000000900667244426473566564000000000000
      00FFFF000000000002000000010000000000000001000000C800000014000000
      010000000000000200AC0100000D004D61737465724865616465723100020100
      00000084010000F6020000200000003000040001000000000000000000FFFFFF
      1F00000000000000000000000000FFFF00000000000200000001000000000000
      0001000000C800000014000000010000000000000200190200000D004D617374
      6572466F6F7465723200020100000000E4010000F6020000C800000030000600
      01000000000000000000FFFFFF1F00000000000000000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      000000DA02000005004D656D6F3200020086000000EC000000E4010000300000
      000300000001000000000000000000FFFFFF1F2C02000000000001002400CDE0
      EAEBE0E4EDE0FF20B9205B6F647353656C446F634D6F76652E2246435F444F43
      225D0004000500626567696E0D0B0020202073756D6D3A3D303B0D0100200D03
      00656E6400FFFF00000000000200000001000000000500417269616C00100000
      000200000000000A000000CC00020000000000FFFFFF00000000020000000000
      000000006103000005004D656D6F3700020014000000840100001C0000002000
      000003000F0001000000000000000000FFFFFF1F2C02000000000002000200B9
      200D0400EF2EEF2E00000000FFFF000000000002000000010000000005004172
      69616C000A0000000000000000000A000000CC00020000000000FFFFFF000000
      0002000000000000000000EB03000005004D656D6F3800020030000000840100
      00040100002000000003000F0001000000000000000000FFFFFF1F2C02000000
      000001000C00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF0000000000020000
      0001000000000500417269616C000A0000000000000000000A000000CC000200
      00000000FFFFFF00000000020000000000000000007104000005004D656D6F39
      00020034010000840100004C0000002000000003000F00010000000000000000
      00FFFFFF1F2C02000000000001000800C5E42E20C8E7EC2E00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000A00
      0000CC00020000000000FFFFFF0000000002000000000000000000FA04000006
      004D656D6F313000020080010000840100004C0000002000000003000F000100
      0000000000000000FFFFFF1F2C02000000000001000A00CAEEEBE8F7E5F1F2E2
      EE00000000FFFF00000000000200000001000000000500417269616C000A0000
      000000000000000A000000CC00020000000000FFFFFF00000000020000000000
      000000007D05000006004D656D6F3133000200CC010000840100005000000020
      00000003000F0001000000000000000000FFFFFF1F2C02000000000001000400
      D6E5EDE000000000FFFF00000000000200000001000000000500417269616C00
      0A0000000000000000000A000000CC00020000000000FFFFFF00000000020000
      000000000000000106000006004D656D6F31340002001C020000840100005800
      00002000000003000F0001000000000000000000FFFFFF1F2C02000000000001
      000500D1F3ECECE000000000FFFF000000000002000000010000000005004172
      69616C000A0000000000000000000A000000CC00020000000000FFFFFF000000
      00020000000000000000008A06000006004D656D6F313500020014000000BC01
      00001C0000001800000003000F0001000000000000000000FFFFFF1F2C020000
      00000001000A005B43555252454E54235D00000000FFFF000000000002000000
      01000000000500417269616C00080000000000000000000A000000CC00020000
      000000FFFFFF00000000020000000000000000001D07000006004D656D6F3136
      00020030000000BC010000040100001800000003000F00010000000000000000
      00FFFFFF1F2C020000000000010014005B6F64735665642E224D454449434E41
      4D45225D00000000FFFF00000000000200000001000000000500417269616C00
      0800000000000000000008000000CC00020000000000FFFFFF00000000020000
      00000000000000AD07000006004D656D6F313700020034010000BC0100004C00
      00001800000003000F0001000000000000000000FFFFFF1F2C02000000000001
      0011005B6F64735665642E2245494E414D45225D00000000FFFF000000000002
      00000001000000000500417269616C00080000000000000000000A000000CC00
      020000000000FFFFFF00000000020000000000000000003A08000006004D656D
      6F313900020080010000BC0100004C0000001800000003000F00010000000000
      00000000FFFFFF1F2C02000000000001000E005B6F64735665642E224B4F4C22
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      000000000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000E608000006004D656D6F3231000200CC010000BC0100005000000018
      00000003000F0001000000000000000000FFFFFF1F2C02000000000001002D00
      5B464F524D4154464C4F4154282730F02E3030EA2E272C205B6F64735665642E
      22666E5F7072696365225D295D00000000FFFF00000000000200000001000000
      000500417269616C00080000000000000000000A000000CC00020000000000FF
      FFFF0000000002000000000000000000BD09000006004D656D6F32320002001C
      020000BC010000580000001800000003000F0001000000000000000000FFFFFF
      1F2C020000000000010029005B464F524D4154464C4F4154282730F02E3030EA
      2E272C205B6F64735665642E2253554D4D225D295D0003000500626567696E0D
      1F00202073756D6D3A3D73756D6D2B285B6F64735665642E2253554D4D225D29
      3B0D0300656E6400FFFF00000000000200000001000000000500417269616C00
      080000000000000000000A000000CC00020000000000FFFFFF00000000020000
      00000000000000540A000006004D656D6F313100020074020000840100006800
      00002000000003000F0001000000000000000000FFFFFF1F2C02000000000001
      001800CEF2ECE5F2EAE020EE20E7E0EFE8F1E820E220EAEDE8E3F300000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      000A000000CC00020000000000FFFFFF0000000002000000000000000000D30A
      000006004D656D6F313200020074020000BC010000680000001800000003000F
      0001000000000000000000FFFFFF1F2C0200000000000100000000000000FFFF
      00000000000200000001000000000500417269616C0008000000000000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000740B00
      0005004D656D6F330002002201000024010000AC000000180000000300000001
      000000000000000000FFFFFF1F2C02000000000001001900CEF2205B6F647353
      656C446F634D6F76652E2244415441225D00000000FFFF000000000002000000
      01000000000F0054696D6573204E657720526F6D616E000C0000000000000000
      0002000000CC00020000000000FFFFFF0000000002000000000000000000230C
      000005004D656D6F34000200C400000040010000680100001400000003000000
      01000000000000000000FFFFFF1F2C02000000000001002700EFEE20EAE0E1E8
      EDE5F2F33A205B6F647353656C446F634D6F76652E224E414D4546524F4D225D
      00000000FFFF00000000000200000001000000000F0054696D6573204E657720
      526F6D616E000C00000000000000000002000000CC00020000000000FFFFFF00
      00000002000000000000000000B40C000005004D656D6F360002002400000020
      02000058000000140000000300000001000000000000000000FFFFFF1F2C0200
      0000000001000900CEF2EFF3F1F2E8EB3A00000000FFFF000000000002000000
      01000000000F0054696D6573204E657720526F6D616E000B0000000000000000
      0001000000CC00020000000000FFFFFF0000000002000000000000000000450D
      000006004D656D6F323300020024000000480200005800000014000000030000
      0001000000000000000000FFFFFF1F2C02000000000001000800CFEEEBF3F7E8
      EB3A00000000FFFF00000000000200000001000000000F0054696D6573204E65
      7720526F6D616E000C00000000000000000001000000CC00020000000000FFFF
      FF0000000002000000000000000000C20D000006004D656D6F32360002001400
      0000E40100001C0000002000000003000F0001000000000000000000FFFFFF1F
      2C020000000000000000000000FFFF0000000000020000000100000000050041
      7269616C00080000000000000000000A000000CC00020000000000FFFFFF0000
      000002000000000000000000460E000006004D656D6F323700020030000000E4
      010000040100002000000003000F0001000000000000000000FFFFFF1F2C0200
      0000000001000500C8F2EEE3EE00000000FFFF00000000000200000001000000
      000500417269616C000800000002000000000008000000CC00020000000000FF
      FFFF0000000002000000000000000000C30E000006004D656D6F323800020034
      010000E40100004C0000002000000003000F0001000000000000000000FFFFFF
      1F2C020000000000000000000000FFFF00000000000200000001000000000500
      417269616C00080000000000000000000A000000CC00020000000000FFFFFF00
      00000002000000000000000000400F000006004D656D6F333000020080010000
      E40100004C0000002000000003000F0001000000000000000000FFFFFF1F2C02
      0000000000000000000000FFFF00000000000200000001000000000500417269
      616C00080000000000000000000A000000CC00020000000000FFFFFF00000000
      02000000000000000000BD0F000006004D656D6F3331000200CC010000E40100
      00500000002000000003000F0001000000000000000000FFFFFF1F2C02000000
      0000000000000000FFFF00000000000200000001000000000500417269616C00
      080000000000000000000A000000CC00020000000000FFFFFF00000000020000
      000000000000005A10000006004D656D6F33320002001C020000E40100005800
      00002000000003000F0001000000000000000000FFFFFF1F2C02000000000001
      001E005B464F524D4154464C4F4154282730F02E3030EA2E272C2073756D6D29
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      000200000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000D910000006004D656D6F333300020074020000E40100006800000020
      00000003000F0001000000000000000000FFFFFF1F2C02000000000001000000
      00000000FFFF00000000000200000001000000000500417269616C0008000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      0000006911000006004D656D6F333500020084000000200200009C0000001400
      00000300020001000000000000000000FFFFFF1F2C020000000000010011005B
      6F64735665642E22444F4C504F4C225D00000000FFFF00000000000200000001
      000000000500417269616C000A00000000000000000002000000CC0002000000
      0000FFFFFF0000000002000000000000000000F111000006004D656D6F333600
      020084000000340200009C000000140000000300000001000000000000000000
      FFFFFF1F2C02000000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000200
      0000CC00020000000000FFFFFF00000000020000000000000000007012000006
      004D656D6F33370002002C010000200200009C00000014000000030002000100
      0000000000000000FFFFFF1F2C0200000000000100000000000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000000000
      00CC00020000000000FFFFFF0000000002000000000000000000F61200000600
      4D656D6F33380002002C010000340200009C0000001400000003000000010000
      00000000000000FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      00000002000000CC00020000000000FFFFFF0000000002000000000000000000
      8313000006004D656D6F3339000200D001000020020000EC0000001400000003
      00020001000000000000000000FFFFFF1F2C02000000000001000E005B6F6473
      5665642E22504F4C225D00000000FFFF00000000000200000001000000000500
      417269616C000A00000000000000000002000000CC00020000000000FFFFFF00
      000000020000000000000000001514000006004D656D6F3430000200D0010000
      34020000EC000000140000000300000001000000000000000000FFFFFF1F2C02
      000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      000002000000CC00020000000000FFFFFF0000000002000000000000000000A5
      14000006004D656D6F323400020084000000480200009C000000140000000300
      020001000000000000000000FFFFFF1F2C020000000000010011005B6F647356
      65642E22444F4C4F5450225D00000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000002000000CC00020000000000FFFF
      FF00000000020000000000000000002D15000006004D656D6F31380002008400
      00005C0200009C000000140000000300000001000000000000000000FFFFFF1F
      2C02000000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000002000000CC00
      020000000000FFFFFF0000000002000000000000000000AC15000006004D656D
      6F32350002002C010000480200009C0000001400000003000200010000000000
      00000000FFFFFF1F2C0200000000000100000000000000FFFF00000000000200
      000001000000000500417269616C000A00000000000000000000000000CC0002
      0000000000FFFFFF00000000020000000000000000003216000006004D656D6F
      33340002002C0100005C0200009C000000140000000300000001000000000000
      000000FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000002
      000000CC00020000000000FFFFFF0000000002000000000000000000BF160000
      06004D656D6F3431000200D001000048020000EC000000140000000300020001
      000000000000000000FFFFFF1F2C02000000000001000E005B6F64735665642E
      224F5450225D00000000FFFF0000000000020000000100000000050041726961
      6C000A00000000000000000002000000CC00020000000000FFFFFF0000000002
      0000000000000000005117000006004D656D6F3432000200D00100005C020000
      EC000000140000000300000001000000000000000000FFFFFF1F2C0200000000
      0001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000200
      0000CC00020000000000FFFFFF0000000002000000000000000000E217000006
      004D656D6F343900020084000000700200009C00000014000000030002000100
      0000000000000000FFFFFF1F2C020000000000010012005B6F64735665642E22
      444F4C4F545031225D00000000FFFF0000000000020000000100000000050041
      7269616C000A00000000000000000002000000CC00020000000000FFFFFF0000
      0000020000000000000000006A18000006004D656D6F35300002008400000084
      0200009C000000140000000300000001000000000000000000FFFFFF1F2C0200
      0000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF000000000002000000
      01000000000500417269616C000A00000000000000000002000000CC00020000
      000000FFFFFF0000000002000000000000000000E918000006004D656D6F3531
      0002002C010000700200009C0000001400000003000200010000000000000000
      00FFFFFF1F2C0200000000000100000000000000FFFF00000000000200000001
      000000000500417269616C000A00000000000000000000000000CC0002000000
      0000FFFFFF00000000020000000000000000006F19000006004D656D6F353200
      02002C010000840200009C000000140000000300000001000000000000000000
      FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF00000000
      000200000001000000000500417269616C000A00000000000000000002000000
      CC00020000000000FFFFFF0000000002000000000000000000FD19000006004D
      656D6F3533000200D001000070020000EC000000140000000300020001000000
      000000000000FFFFFF1F2C02000000000001000F005B6F64735665642E224F54
      5031225D00000000FFFF00000000000200000001000000000500417269616C00
      0A00000000000000000002000000CC00020000000000FFFFFF00000000020000
      000000000000008F1A000006004D656D6F3534000200D001000084020000EC00
      0000140000000300000001000000000000000000FFFFFF1F2C02000000000001
      001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF00000000
      000200000001000000000500417269616C000A00000000000000000002000000
      CC00020000000000FFFFFF0000000002000000000000000000201B000005004D
      656D6F3500020024000000700200005800000014000000030000000100000000
      0000000000FFFFFF1F2C02000000000001000900CFF0EEE2E5F0E8EB3A000000
      00FFFF00000000000200000001000000000F0054696D6573204E657720526F6D
      616E000C00000000000000000001000000CC00020000000000FFFFFF00000000
      0200000000000000FEFEFF020000000A002043617465676F7279310000000004
      0073756D6D000000000000000000000000FC0100000000000000000000000000
      00000058003F2C5F302ED2E240FBA6C395D66DE440}
  end
  object odsCheckSpisMedicOnGiven: TOracleDataSet
    SQL.Strings = (
      'select 1'
      '  from med.tdpc'
      ' inner join tnazmark nm'
      '    on tdpc.fk_nazmark_id = nm.FK_ID '
      ' where tdpc.dpid = :DPID'
      ' '
      'union all'
      ''
      'select 1'
      '  from med.tdpc '
      ' inner join tmedicgiven mg'
      '    on mg.FK_DPCID = tdpc.dpcid'
      ' inner join tnazmark nm'
      '    on nm.FK_ID = mg.FK_NAZMARK'
      ' where tdpc.dpid = :DPID')
    Optimize = False
    Variables.Data = {0300000001000000050000003A44504944030000000000000000000000}
    Session = dmMain.os
    Left = 268
    Top = 334
  end
  object pmPrint2: TPopupMenu
    Left = 552
    Top = 270
    object miPrint: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
    end
    object N27: TMenuItem
      Action = acPrnBordereauSample
    end
  end
  object frxReport1: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39388.589793113400000000
    ReportOptions.LastChange = 40478.431490057870000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo9OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SET('#39'NaimKol'#39',<LINE>);  '
      'end;'
      ''
      'procedure Memo27OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  SET('#39'FN_SUMM'#39', <FN_SUMM>+<frxDBodsKart."SUMM">);              ' +
        '           '
      'end;'
      ''
      ''
      
        'procedure meGlavVrachOnPreviewClick(Sender: TfrxView; Button: TM' +
        'ouseButton; Shift: Integer; var Modified: Boolean);'
      'begin'
      '  Modified := True;  '
      'end;'
      ''
      
        'procedure meGlavBuhOnPreviewClick(Sender: TfrxView; Button: TMou' +
        'seButton; Shift: Integer; var Modified: Boolean);'
      'begin'
      '  Modified := True;  '
      'end;'
      ''
      
        'procedure meZavAptOnPreviewClick(Sender: TfrxView; Button: TMous' +
        'eButton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1060#1048#1054':'#39', s);  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      '  INIWRITESTRING2('#39'MANAGER_DOC'#39', '#39'VAR_ZAV_APTEKA'#39',  s2);  '
      'end;'
      ''
      
        'procedure meDateOnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'begin'
      '  Modified := True;  '
      'end;'
      ''
      
        'procedure Memo40OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1099#39', '#39#1055#1086 +
        #1089#1090#1072#1074#1097#1080#1082':'#39', s);'
      '  Modified := True;'
      'end;'
      ''
      
        'procedure Memo39OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1099#39', '#39#1043#1088 +
        #1091#1079#1086#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100':'#39', s);'
      '  Modified := True;'
      'end;'
      ''
      'procedure MasterData6OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   SET('#39'FN_SUMM'#39', 0);  '
      'end;'
      ''
      
        'procedure Memo35OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1100#39', '#39#1044#1086 +
        #1083#1078#1085#1086#1089#1090#1100':'#39', s);'
      '  Modified := True;'
      'end;'
      ''
      
        'procedure Memo57OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1060#1048#1054':'#39', s' +
        ');'
      '  Modified := True;'
      'end;'
      ''
      
        'procedure Memo45OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1076#1072#1090#1091#39', '#39#1044#1072#1090#1072':'#39',' +
        ' s);'
      '  Modified := True;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnClickObject = frxReturnPostavClickObject
    OnGetValue = frxReturnPostavGetValue
    OnUserFunction = frxReturnPostavUserFunction
    Left = 592
    Top = 108
    Datasets = <
      item
        DataSet = frxDBdsSelDocMove
        DataSetName = 'frxDBdsSelDocMove'
      end
      item
        DataSet = frxDBodsKart
        DataSetName = 'frxDBodsKart'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'NaimKol'
        Value = Null
      end
      item
        Name = 'FN_SUMM'
        Value = Null
      end>
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object Header1: TfrxHeader
        Height = 75.000000000000000000
        Top = 316.000000000000000000
        Width = 1009.134510000000000000
        object Memo15: TfrxMemoView
          Left = 655.000000000000000000
          Top = 23.000000000000000000
          Width = 52.000000000000000000
          Height = 52.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#8218#1056#176#1056#1030#1056#1108#1056#176' %')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 37.000000000000000000
          Width = 303.000000000000000000
          Height = 75.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 340.000000000000000000
          Width = 74.000000000000000000
          Height = 75.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 414.000000000000000000
          Width = 56.000000000000000000
          Height = 75.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 470.000000000000000000
          Width = 83.000000000000000000
          Height = 75.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 655.000000000000000000
          Width = 132.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#8221#1056#1038)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 787.000000000000000000
          Width = 102.000000000000000000
          Height = 75.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1057#1027
            #1057#1107#1057#8225#1056#181#1057#8218#1056#1109#1056#1112
            #1056#1116#1056#8221#1056#1038)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 889.000000000000000000
          Width = 121.000000000000000000
          Height = 75.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1057#1027#1057#8225#1056#181#1057#8218#1056#176
            #1056#1169#1056#176#1057#8218#1056#176
            #1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1108#1056#1105' '#1056#1030
            #1056#176#1056#1111#1057#8218#1056#181#1056#1108#1057#1107' '#1056#1115#1056#1113#1056#8216)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 553.000000000000000000
          Width = 102.000000000000000000
          Height = 75.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1056#177#1056#181#1056#183
            #1057#1107#1057#8225#1056#181#1057#8218#1056#176
            #1056#1116#1056#8221#1056#1038)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Width = 37.000000000000000000
          Height = 75.000000000000000000
          OnBeforePrint = 'Memo8OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 707.000000000000000000
          Top = 23.000000000000000000
          Width = 80.000000000000000000
          Height = 52.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'C'#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 412.000000000000000000
        Width = 1009.134510000000000000
        DataSet = frxDBodsKart
        DataSetName = 'frxDBodsKart'
        RowCount = 0
        Stretched = True
        object Memo9: TfrxMemoView
          Width = 37.000000000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo9OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 37.000000000000000000
          Width = 303.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBodsKart."NAMEKART"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 340.000000000000000000
          Width = 74.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBodsKart."FC_EDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 470.000000000000000000
          Width = 83.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[<frxDBodsKart."FN_PRICE">/1.1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 553.000000000000000000
          Width = 102.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[<frxDBodsKart."SUMM">/1.1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 414.000000000000000000
          Width = 56.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBodsKart."FN_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 655.000000000000000000
          Width = 52.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '10%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 787.000000000000000000
          Width = 102.000000000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo27OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[<frxDBodsKart."SUMM">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object meInput1: TfrxMemoView
          Left = 889.000000000000000000
          Width = 121.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8225#1057#8216#1057#8218'-'#1057#8222#1056#176#1056#1108#1057#8218#1057#1107#1057#1026#1056#176' [<frxDBodsKart."FC_PRIH_DOC">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 707.000000000000000000
          Width = 80.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[<frxDBodsKart."SUMM">/11]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 268.771800000000000000
        Top = 452.000000000000000000
        Width = 1009.134510000000000000
        OnBeforePrint = 'Footer1OnBeforePrint'
        object Memo31: TfrxMemoView
          Top = 1.204700000000000000
          Width = 698.953000000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1118#1056#1109#1056#1030#1056#176#1057#1026#1056#1029#1056#176#1057#1039' '#1056#1029#1056#176#1056#1108#1056#187#1056#176#1056#1169#1056#1029#1056#176#1057#1039' '#1056#1030' '#1056#1111#1057#1026#1056#1105#1056#187#1056#1109#1056#182#1056#181#1056#1029#1056#1105#1056#1105' '#1056#1105#1056#1112 +
              #1056#181#1056#181#1057#8218' [GET_NAIM_KOL(<TotalPages>, 0)] '#1056#187#1056#1105#1057#1027#1057#8218'(-'#1056#1109#1056#1030')'
            
              #1056#152' '#1057#1027#1056#1109#1056#1169#1056#181#1057#1026#1056#182#1056#1105#1057#8218' [GET_NAIM_KOL(<NaimKol>, 0)] '#1056#1111#1056#1109#1057#1026#1057#1039#1056#1169#1056#1108#1056#1109#1056 +
              #1030#1057#8249#1056#8470' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026' '#1056#183#1056#176#1056#1111#1056#1105#1057#1027#1056#1105)
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 1.000000000000000000
          Top = 41.000000000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1109#1057#8218#1056#1111#1057#1107#1057#8240#1056#181#1056#1029#1056#1109)
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 699.016204000000000000
          Top = 0.787352999999938900
          Width = 66.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 765.606804000000000000
          Top = 1.031447000000070000
          Width = 124.960699000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo30OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 129.000000000000000000
          Top = 41.000000000000000000
          Width = 874.488746000000000000
          Height = 37.417347000000000000
          OnBeforePrint = 'Memo5OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              '[GET_NAIM_KOL(<NaimKol>, 2)] '#1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039'(-'#1056#1105#1056#8470') '#1056#1029#1056 +
              #176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' [MONEYSTR(<FN_SUMM>)]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 66.000000000000000000
          Top = 200.000031000000000000
          Width = 43.000000000000000000
          Height = 37.590600000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114'.'#1056#1119'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 124.000000000000000000
          Top = 84.000031000000000000
          Width = 224.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'Memo35OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1110#1056#187'. '#1056#1030#1057#1026#1056#176#1057#8225)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo36: TfrxMemoView
          Top = 117.787415000000000000
          Width = 124.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'Memo35OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8220#1056#187#1056#176#1056#1030#1056#1029#1057#8249#1056#8470' '#1056#177#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo37: TfrxMemoView
          Left = 124.000000000000000000
          Top = 151.000000000000000000
          Width = 224.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'Memo35OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1111#1057#1026#1056#1109#1056#1030#1056#1105#1056#183#1056#1109#1057#1026)
          ParentFont = False
          VAlign = vaBottom
        end
        object meGlavVrach: TfrxMemoView
          Left = 351.000000000000000000
          Top = 84.000031000000000000
          Width = 149.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'meGlavVrachOnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          TagStr = #1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[var_glav_vrach]')
          ParentFont = False
          VAlign = vaBottom
        end
        object meGlavBuh: TfrxMemoView
          Left = 351.000000000000000000
          Top = 117.790000000000000000
          Width = 149.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'meGlavBuhOnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          TagStr = #1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[var_glav_buh]')
          ParentFont = False
          VAlign = vaBottom
        end
        object meZavApt: TfrxMemoView
          Left = 351.000000000000000000
          Top = 151.000000000000000000
          Width = 149.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'meZavAptOnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          TagStr = #1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_ZAV_APTEKA]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo28: TfrxMemoView
          Top = 84.000000000000000000
          Width = 124.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1107#1057#1027#1056#1108' '#1057#1026#1056#176#1056#183#1057#1026#1056#181#1057#8364#1056#1105#1056#187)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo47: TfrxMemoView
          Top = 151.000000000000000000
          Width = 124.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1107#1057#1027#1056#1108' '#1056#1111#1057#1026#1056#1109#1056#1105#1056#183#1056#1030#1056#181#1056#187)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo38: TfrxMemoView
          Left = 124.000000000000000000
          Top = 107.000000000000000000
          Width = 113.000000000000000000
          Height = 11.000000000000000000
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo48: TfrxMemoView
          Left = 124.000000000000000000
          Top = 174.000000000000000000
          Width = 113.000000000000000000
          Height = 11.000000000000000000
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo49: TfrxMemoView
          Left = 240.000000000000000000
          Top = 107.000000000000000000
          Width = 108.000000000000000000
          Height = 11.000000000000000000
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo50: TfrxMemoView
          Left = 240.000000000000000000
          Top = 174.000000000000000000
          Width = 108.000000000000000000
          Height = 11.000000000000000000
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo51: TfrxMemoView
          Left = 240.000000000000000000
          Top = 140.000000000000000000
          Width = 108.000000000000000000
          Height = 11.000000000000000000
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo52: TfrxMemoView
          Left = 351.000000000000000000
          Top = 107.000000000000000000
          Width = 149.000000000000000000
          Height = 11.000000000000000000
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo53: TfrxMemoView
          Left = 351.000000000000000000
          Top = 140.000000000000000000
          Width = 149.000000000000000000
          Height = 11.000000000000000000
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo54: TfrxMemoView
          Left = 351.000000000000000000
          Top = 174.000000000000000000
          Width = 149.000000000000000000
          Height = 11.000000000000000000
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo55: TfrxMemoView
          Left = 517.000000000000000000
          Top = 99.000000000000000000
          Width = 109.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8220#1057#1026#1057#1107#1056#183' '#1056#1111#1057#1026#1056#1105#1056#1029#1057#1039#1056#187)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo56: TfrxMemoView
          Left = 629.000000000000000000
          Top = 151.000000000000000000
          Width = 224.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'Memo35OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo57: TfrxMemoView
          Left = 856.000000000000000000
          Top = 98.002585000000000000
          Width = 149.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'Memo57OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          TagStr = #1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo58: TfrxMemoView
          Left = 856.000000000000000000
          Top = 151.000000000000000000
          Width = 149.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'Memo57OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          TagStr = #1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo61: TfrxMemoView
          Left = 517.000000000000000000
          Top = 141.000000000000000000
          Width = 109.000000000000000000
          Height = 33.000000000000000000
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8220#1057#1026#1057#1107#1056#183' '#1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#1105#1056#187' '#1056#1110#1057#1026#1057#1107#1056#183#1056#1109#1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo62: TfrxMemoView
          Left = 629.000000000000000000
          Top = 174.000000000000000000
          Width = 113.000000000000000000
          Height = 11.000000000000000000
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo63: TfrxMemoView
          Left = 745.000000000000000000
          Top = 174.000000000000000000
          Width = 108.000000000000000000
          Height = 11.000000000000000000
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo64: TfrxMemoView
          Left = 745.000000000000000000
          Top = 121.212585000000000000
          Width = 108.000000000000000000
          Height = 11.000000000000000000
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo65: TfrxMemoView
          Left = 856.000000000000000000
          Top = 121.212585000000000000
          Width = 149.000000000000000000
          Height = 11.000000000000000000
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo66: TfrxMemoView
          Left = 856.000000000000000000
          Top = 174.000000000000000000
          Width = 149.000000000000000000
          Height = 11.000000000000000000
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo43: TfrxMemoView
          Left = 629.000000000000000000
          Top = 98.000000000000000000
          Width = 224.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'Memo35OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo44: TfrxMemoView
          Left = 629.000000000000000000
          Top = 121.299165000000000000
          Width = 113.000000000000000000
          Height = 11.000000000000000000
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo45: TfrxMemoView
          Left = 124.000000000000000000
          Top = 209.000000000000000000
          Width = 224.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'Memo45OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1042#171'       '#1042#187'                                   20       '#1056#1110'.')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo59: TfrxMemoView
          Left = 571.000000000000000000
          Top = 200.000000000000000000
          Width = 43.000000000000000000
          Height = 37.590600000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114'.'#1056#1119'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 629.000000000000000000
          Top = 208.999969000000000000
          Width = 224.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'Memo45OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1042#171'       '#1042#187'                                   20       '#1056#1110'.')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object MasterData2: TfrxMasterData
        Height = 20.000000000000000000
        Top = 16.000000000000000000
        Width = 1009.134510000000000000
        RowCount = 1
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 130.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            #1056#8220#1057#1026#1057#1107#1056#183#1056#1109#1056#1109#1057#8218#1056#1111#1057#1026#1056#176#1056#1030#1056#1105#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 130.000000000000000000
          Width = 880.000000000000000000
          Height = 20.000000000000000000
          OnPreviewClick = 'Memo39OnPreviewClick'
          ShowHint = False
          StretchMode = smMaxHeight
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              #1056#8216#1056#1032' '#1056#1168#1056#1114#1056#1106#1056#1115'-'#1056#174#1056#1110#1057#1026#1057#8249' "'#1056#1115#1056#1108#1057#1026#1057#1107#1056#182#1056#1029#1056#176#1057#1039' '#1056#1108#1056#187#1056#1105#1056#1029#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#176#1057#1039' ' +
              #1056#1169#1056#181#1057#8218#1057#1027#1056#1108#1056#176#1057#1039' '#1056#177#1056#1109#1056#187#1057#1034#1056#1029#1056#1105#1057#8224#1056#176'", '#1056#152#1056#1116#1056#1116' 8603112809/86030101, 62' +
              '8609 '#1056#160'.'#1056#164'.,  '#1056#1168#1056#1114#1056#1106#1056#1115' '#1056#1118#1057#1035#1056#1112#1056#181#1056#1029#1057#1027#1056#1108#1056#176#1057#1039' '#1056#1109#1056#177#1056#187'., '#1056#1110'. '#1056#1116#1056#1105#1056#182#1056#1029#1056 +
              #181#1056#1030#1056#176#1057#1026#1057#8218#1056#1109#1056#1030#1057#1027#1056#1108', '#1057#1107#1056#187'. '#1056#1038#1056#181#1056#1030#1056#181#1057#1026#1056#1029#1056#176#1057#1039' 30')
          ParentFont = False
        end
      end
      object MasterData3: TfrxMasterData
        Height = 20.000000000000000000
        Top = 56.000000000000000000
        Width = 1009.134510000000000000
        RowCount = 1
        Stretched = True
        object Memo2: TfrxMemoView
          Width = 130.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            #1056#8220#1057#1026#1057#1107#1056#183#1056#1109#1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 130.000000000000000000
          Width = 880.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[frxDBdsSelDocMove."FC_POSTAV_NAME"] [frxDBdsSelDocMove."FC_REKV' +
              'IZITI"]')
          ParentFont = False
        end
      end
      object MasterData4: TfrxMasterData
        Height = 20.000000000000000000
        Top = 96.000000000000000000
        Width = 1009.134510000000000000
        RowCount = 1
        Stretched = True
        object Memo40: TfrxMemoView
          Left = 100.000000000000000000
          Width = 910.000000000000000000
          Height = 20.000000000000000000
          OnPreviewClick = 'Memo40OnPreviewClick'
          ShowHint = False
          StretchMode = smMaxHeight
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              #1056#8216#1056#1032' '#1056#1168#1056#1114#1056#1106#1056#1115'-'#1056#174#1056#1110#1057#1026#1057#8249' "'#1056#1115#1056#1108#1057#1026#1057#1107#1056#182#1056#1029#1056#176#1057#1039' '#1056#1108#1056#187#1056#1105#1056#1029#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#176#1057#1039' ' +
              #1056#1169#1056#181#1057#8218#1057#1027#1056#1108#1056#176#1057#1039' '#1056#177#1056#1109#1056#187#1057#1034#1056#1029#1056#1105#1057#8224#1056#176'", '#1056#152#1056#1116#1056#1116' 8603112809/86030101, 62' +
              '8609 '#1056#160'.'#1056#164'.,  '#1056#1168#1056#1114#1056#1106#1056#1115' '#1056#1118#1057#1035#1056#1112#1056#181#1056#1029#1057#1027#1056#1108#1056#176#1057#1039' '#1056#1109#1056#177#1056#187'., '#1056#1110'. '#1056#1116#1056#1105#1056#182#1056#1029#1056 +
              #181#1056#1030#1056#176#1057#1026#1057#8218#1056#1109#1056#1030#1057#1027#1056#1108', '#1057#1107#1056#187'. '#1056#1038#1056#181#1056#1030#1056#181#1057#1026#1056#1029#1056#176#1057#1039' 30')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 1.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1057#8240#1056#1105#1056#1108)
          ParentFont = False
        end
      end
      object MasterData5: TfrxMasterData
        Height = 20.000000000000000000
        Top = 136.000000000000000000
        Width = 1009.134510000000000000
        RowCount = 1
        Stretched = True
        object Memo6: TfrxMemoView
          Left = 100.000000000000000000
          Width = 910.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[frxDBdsSelDocMove."FC_POSTAV_NAME"] [frxDBdsSelDocMove."FC_REKV' +
              'IZITI"]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#187#1056#176#1057#8218#1056#181#1056#187#1057#1034#1057#8240#1056#1105#1056#1108)
          ParentFont = False
        end
      end
      object MasterData6: TfrxMasterData
        Height = 118.779530000000000000
        Top = 176.000000000000000000
        Width = 1009.134510000000000000
        OnBeforePrint = 'MasterData6OnBeforePrint'
        RowCount = 1
        object Memo4: TfrxMemoView
          Top = 16.000000000000000000
          Width = 1010.000000000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1118#1056#1115#1056#8217#1056#1106#1056#160#1056#1116#1056#1106#1056#1031' '#1056#1116#1056#1106#1056#1113#1056#8250#1056#1106#1056#8221#1056#1116#1056#1106#1056#1031' ('#1056#1030#1056#1109#1056#183#1056#1030#1057#1026#1056#176#1057#8218') '#1074#8222#8211'  [frxDB' +
              'dsSelDocMove."FC_DOC"]  '#1056#1109#1057#8218'  [frxDBdsSelDocMove."DATA"] '#1056#1110'.')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          Left = 38.800000000000000000
          Top = 72.692950000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#1027#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181':')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo5: TfrxMemoView
          Left = 151.976500000000000000
          Top = 72.692950000000000000
          Width = 857.819420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBdsSelDocMove."FC_RASHPRICHINA"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo46: TfrxMemoView
          Left = 151.181200000000000000
          Top = 93.708720000000000000
          Width = 857.819420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBdsSelDocMove."FC_COMMENT"]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
    end
  end
  object frReport1: TfrReport
    InitialZoom = pzPageWidth
    MDIPreview = True
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frActSpisGetValue
    OnUserFunction = frActSpisUserFunction
    OnObjectClick = frActSpisObjectClick
    OnMouseOverObject = frActSpisMouseOverObject
    Left = 324
    Top = 292
    ReportForm = {
      190000005C290000190000000001000100FFFFFFFFFF09000000340800009A0B
      00004800000000000000000000000000000000FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000004000000F6020000B60000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200460100000B004D61737465
      72446174613100020100000000A0020000F60200001600000031000500010000
      00000000000000FFFFFF1F000000001000667244426473416374537069735265
      7000000000000000FFFF000000000002000000010000000000000001000000C8
      00000014000000010000000000000200B30100000D004D6173746572466F6F74
      65723100020100000000EC020000F60200001800000031000600010000000000
      00000000FFFFFF1F00000000000000000000000000FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000200210200
      000E005265706F727453756D6D617279310002010000000090030000F6020000
      6C0000003000010001000000000000000000FFFFFF1F00000000000000000000
      000000FFFF000000000002000000010000000000000001000000C80000001400
      00000100000000000002008E0200000D004D6173746572486561646572310002
      010000000030020000F6020000410000003000040001000000000000000000FF
      FFFF1F00000000000000000000000000FFFF0000000000020000000100000000
      00000001000000C800000014000000010000000000000200FA0200000B004D61
      737465724461746136000201000000003C010000F60200008200000030000500
      01000000000000000000FFFFFF1F0000000001003100000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200660300000B004D6173746572446174613200020100000000CC010000
      F6020000370000003100050001000000000000000000FFFFFF1F000000000100
      3100000000000000FFFF000000000002000000010000000000000001000000C8
      00000014000000010000000000000200D10300000B0050616765466F6F746572
      310002010000000000040000F60200001E000000300003000100000000000000
      0000FFFFFF1F00000000000000000000000000FFFF0000000000020000000100
      00000000000001000000C8000000140000000100000000000002003D0400000B
      004D61737465724461746134000201000000000C020000F60200001400000031
      00050001000000000000000000FFFFFF1F000000000100310000000000000001
      00000000000002000000010000000000000001000000C8000000140000000100
      00000000000200A90400000B004D617374657244617461350002010000000010
      030000F6020000640000003100050001000000000000000000FFFFFF1F000000
      0001003100000000000000FFFF00000000000200000001000000000000000100
      0000C8000000140000000100000000000002000F050000050042616E64310002
      010000000074030000F6020000140000003100050001000000000000000000FF
      FFFF1F0000000001003100000000000000FFFF00000000000200000001000000
      0000000001000000C8000000140000000100000000000002007B0500000B004D
      617374657244617461330002010000000018010000F602000017000000310005
      0001000000000000000000FFFFFF1F0000000001003100000000000000FFFF00
      0000000002000000010000000000000001000000C80000001400000001000000
      0000000200E70500000B004D6173746572446174613700020100000000C60000
      00F6020000160000003100050001000000000000000000FFFFFF1F0000000001
      003100000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200530600000B004D6173746572446174
      613800020100000000F4000000F60200000C0000003100050001000000000000
      000000FFFFFF1F0000000001003100000000000000FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000200E80600
      000C0047726F7570486561646572310002010000000080020000F60200001400
      00003000100001000000000000000000FFFFFF1F000000001E005B6F64734163
      74537069735265702E2246435F46494E534F55524345225D00000000000000FF
      FF000000000002000000010000000000000001000000C8000000140000000100
      00000B004D61737465724461746131000200540700000C0047726F7570466F6F
      7465723100020100000000C0020000F602000014000000300011000100000000
      0000000000FFFFFF1F00000000000000000000000000FFFF0000000000020000
      00010000000000000001000000C8000000140000000100000000000000003E08
      000005004D656D6F3200020048000000CD0100009C0200002E0000000B000000
      01000000000000000000FFFFFF1F2C02000000000002001B00EDE0E7EDE0F7E5
      EDE020EFF0E8EAE0E7EEEC205B5072696B617A5D0D4E0063EEF1F2E0E2E8EBE8
      20EDE0F1F2EEFFF9E8E920E0EAF22020E220F2EEEC2C20F7F2EE20EFEE20F3EA
      E0E7E0EDEDEEE920EFF0E8F7E8EDE520F1EFE8F1E0EDEE20ECE5E4E8EAE0ECE5
      EDF2EEE23A00000000FFFF00000000000200000001000000040500417269616C
      000C00000000000000000000000000CC00020000000000FFFFFF000000000200
      0000000000000000BD08000005004D656D6F33000200480000003E0200001E00
      00003200000003000F0002000000000000000000FFFFFF1F2C02000000000001
      000100B900000000FFFF00000000000200000001000000000500417269616C00
      090000000000000000000A000000CC00020000000000FFFFFF00000000020000
      000000000000005309000005004D656D6F35000200660000003E020000310100
      003200000003000F0002000000000000000000FFFFFF1F2C0200000000000100
      1800CDE0E8ECE5EDEEE2E0EDE8E520ECE5E4E8EAE0ECE5EDF2E000000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000D70900
      0005004D656D6F36000200970100003E020000580000003200000003000F0002
      000000000000000000FFFFFF1F2C02000000000001000600C5E42EC8E7EC0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      005B0A000005004D656D6F37000200420200003E0200002E0000003200000003
      000F0002000000000000000000FFFFFF1F2C02000000000001000600CAEEEB2D
      E2EE00000000FFFF00000000000200000001000000000500417269616C000A00
      00000000000000000A000000CC00020000000000FFFFFF000000000200000000
      0000000000E10A000006004D656D6F3131000200EF0100003E02000053000000
      3200000003000F0002000000000000000000FFFFFF1F2C020000000000010007
      00D6E5EDE02C20F000000000FFFF000000000002000000010000000005004172
      69616C000A0000000000000000000A000000CC00020000000000FFFFFF000000
      0002000000000000000000680B000006004D656D6F3132000200700200003E02
      0000740000003200000003000F0002000000000000000000FFFFFF1F2C020000
      00000001000800D1F3ECECE02C20F000000000FFFF0000000000020000000100
      0000000500417269616C000A0000000000000000000A000000CC000200000000
      00FFFFFF0000000002000000000000000000420C000006004D656D6F32340002
      0048000000A00200001E0000001600000003000F0001000000000000000000FF
      FFFF1F2C020000000000010007005B4C494E45235D0004000500626567696E0D
      1B0020204E41494D5F4B4F4C203A3D204E41494D5F4B4F4C202B20313B0D2600
      20206966205B4C494E45235D203D2031207468656E2073756D6D5F67726F7570
      203A3D20303B0D0300656E6400FFFF0000000000020000000100000000050041
      7269616C000A0000000000000000000A000000CC00020000000000FFFFFF0000
      000002000000000000000000DC0C000006004D656D6F323600020066000000A0
      020000310100001600000003000F0001000000000000000000FFFFFF1F2C0200
      0000000001001B005B6F6473416374537069735265702E224E414D454D454449
      43225D00000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000008000000CC00020000000000FFFFFF0000000002000000
      000000000000730D000006004D656D6F323700020097010000A0020000580000
      001600000003000F0001000000000000000000FFFFFF1F2C0200000000000100
      18005B6F6473416374537069735265702E2245494E414D45225D00000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      0A000000CC00020000000000FFFFFF00000000020000000000000000000A0E00
      0006004D656D6F323800020042020000A00200002E0000001600000003000F00
      01000000000000000000FFFFFF1F2C020000000000010018005B6F6473416374
      537069735265702E22464E5F4B4F4C225D00000000FFFF000000000002000000
      01000000000500417269616C000A0000000000000000000A000000CC00020000
      000000FFFFFF0000000002000000000000000000B30E000006004D656D6F3239
      000200EF010000A0020000530000001600000003000F00010000000000000000
      00FFFFFF1F2C020301100023232320232323202323302E303020F00001001A00
      5B6F6473416374537069735265702E22666E5F7072696365225D00000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000C30F00
      0006004D656D6F333000020070020000A0020000740000001600000003000F00
      01000000000000000000FFFFFF1F2C020301100023232320232323202323302E
      303020F000010016005B6F6473416374537069735265702E2253554D4D225D00
      04000500626567696E0D2400202073756D6D3A3D73756D6D2B5B6F6473416374
      537069735265702E2253554D4D225D3B0D3400202073756D6D5F67726F757020
      3A3D2073756D6D5F67726F7570202B205B6F6473416374537069735265702E22
      53554D4D225D3B0D0300656E6400FFFF00000000000200000001000000000500
      417269616C000A0000000000000000000A000000CC00020000000000FFFFFF00
      000000020000000000000000006110000006004D656D6F363700020055010000
      6F00000024000000110000000300020001000000000000000000FFFFFF1F2C02
      000000000001001F00225B464F524D41544441544554494D4528276464272C20
      44415445295D2220000000000000000000000002000000010000000005004172
      69616C000C00000000000000000000000000CC00020000000000FFFFFF000000
      0002000000000000000000F510000006004D656D6F36380002009E0100006F00
      000078000000110000000300020001000000000000000000FFFFFF1F2C020000
      000000010015005B6F6473416374537069735265702E224D4F4E225D00000000
      000000000000000200000001000000000500417269616C000C00000000000000
      000002000000CC00020000000000FFFFFF000000000200000000000000000094
      11000006004D656D6F36390002001A0200006F00000034000000140000000300
      000001000000000000000000FFFFFF1F2C020000000000010020005B464F524D
      41544441544554494D45282779797979272C2044415445295D20E30000000000
      0000000000000200000001000000000500417269616C000C0000000000000000
      0000000000CC00020000000000FFFFFF00000000020000000000000000002812
      000006004D656D6F373100020048000000100000006C01000023000000030002
      0001000000000000000000FFFFFF1F2C020000000000010015005B6F64734163
      74537069735265702E224C4F4B225D00000000FFFF0000000000020000000100
      0000010500417269616C000A00000000000000000012000000CC000200000000
      00FFFFFF0000000002000000000000000000CA12000006004D656D6F37330002
      00480000004D0000006C010000130000000300020001000000000000000000FF
      FFFF1F2C020000000000010023005B6F647353656C446F634D6F76652E226663
      5F6D6F67726F757069645F66726F6D225D00000000FFFF000000000002000000
      01000000010500417269616C000A00000000000000000012000000CC00020000
      000000FFFFFF00000000020000000000000000006313000006004D656D6F3735
      000200480000006E000000410100001300000003000200010000000000000000
      00FFFFFF1F2C02000000000001001A005B6F6473416374537069735265702E22
      4E414D4546524F4D225D00000000000000000000000200000001000000010500
      417269616C000A00000000000000000012000000CC00020000000000FFFFFF00
      000000020000000000000000004214000006004D656D6F373600020048000000
      860000009C020000340000000300000001000000000000000000FFFFFF1F2C02
      000000000001001B005B6F647353656C446F634D6F76652E2246435F444F434D
      4958225D0005000500626567696E0D0B0020202073756D6D3A3D303B0D130020
      202073756D6D5F67726F7570203A3D20303B0D11002020204E41494D5F4B4F4C
      203A3D20303B0D0300656E6400FFFF0000000000020000000100000004050041
      7269616C00100000000200000000000A000000CC00020000000000FFFFFF0000
      0000020000000000000000000115000006004D656D6F3831000200F3010000EC
      02000081000000140000000300000001000000000000000000FFFFFF1F2C0200
      0000000001000600C8F2EEE3EE3A0003000500626567696E0D2A00202046435F
      4E41494D5F4B4F4C203A3D204745545F4E41494D5F4B4F4C28204E41494D5F4B
      4F4C20293B0D0300656E6400FFFF000000000002000000010000000005004172
      69616C000A00000002000000000009000000CC00020000000000FFFFFF000000
      00020000000000000000009615000006004D656D6F383300020070020000EC02
      000074000000140000000300000001000000000000000000FFFFFF1F2C020401
      100023232320232323202323302E303020F000010006005B73756D6D5D000000
      00FFFF00000000000200000001000000020500417269616C000A000000020000
      00000009000000CC00020000000000FFFFFF0000000002000000000000000000
      2616000006004D656D6F3935000200900000002A030000540200002C00000003
      00000001000000000000000000FFFFFF1F2C020000000000010011005B4D4F4E
      45595354522873756D6D295D2000000000FFFF00000000000200000001000000
      000500417269616C000A00000004000000000000000000CC00020000000000FF
      FFFF0000000002000000000000000000BF16000005004D656D6F380002004800
      0000C60000009C020000160000000300000001000000000000000000FFFFFF1F
      2C02000000000001001B005B6F6473416374537069735265702E225370697344
      65736372225D00000000FFFF0000000000020000000100000004050041726961
      6C00100000000200000000000A0000000100020000000000FFFFFF0000000002
      0000000000000000008217000005004D656D6F3900020048000000F40000009C
      0200000C0000000300000001000000000000000000FFFFFF1F2C020000000000
      0100120028EFF0E8F7E8EDE020F1EFE8F1E0EDE8FF290003000500626567696E
      0D230020204D656D6F392E56697369626C65203A3D204D656D6F382E4D656D6F
      203D2027273B0D0300656E6400FFFF0000000000020000000100000004050041
      7269616C0007000000000000000000020000000100020000000000FFFFFF0000
      0000020000000000000000000D18000006004D656D6F31300002004800000034
      0000006C010000100000000300000001000000000000000000FFFFFF1F2C0200
      0000000001000C0028F3F7F0E5E6E4E5EDE8E52900000000FFFF000000000002
      00000001000000010500417269616C0008000000000000000000020000000100
      020000000000FFFFFF00000000020000000000000000009B18000006004D656D
      6F313300020048000000610000006C0100001000000003000000010000000000
      00000000FFFFFF1F2C02000000000001000F0028EFEEE4F0E0E7E4E5EBE5EDE8
      E52900000000FFFF00000000000200000001000000010500417269616C000800
      0000000000000000020000000100020000000000FFFFFF000000000200000000
      00000000003119000006004D656D6F39390002004800000063010000C5000000
      140000000300000001000000000000000000FFFFFF1F2C020000000000010017
      00CFF0E5E4F1E5E4E0F2E5EBFC20EAEEECE8F1F1E8E83A2000000000FFFF0000
      0000000200000001000000010500417269616C000C0000000000000000000800
      0000CC00020000000000FFFFFF0000000002000000000000000000C119000007
      004D656D6F313031000200480000007D010000C5000000140000000300000001
      000000000000000000FFFFFF1F2C02000000000001001000D7EBE5EDFB20EAEE
      ECE8F1F1E8E83A2000000000FFFF000000000002000000010000000105004172
      69616C000C00000000000000000008000000CC00020000000000FFFFFF000000
      0002000000000000000000501A000006004D656D6F34380002000D0100006301
      0000D7010000140000000300020001000000000000000000FFFFFF1F2C020000
      000000010010005B507265645D205B446F6C507265645D00000000FFFF000000
      00000200000001000000020500417269616C000A000000000000000000000000
      00CC00020000000000FFFFFF0000000002000000000000000000E01A00000700
      4D656D6F3130350002000D0100007D010000D701000014000000030002000100
      0000000000000000FFFFFF1F2C020000000000010010005B4B6F6D315D205B44
      6F6C4B6F6D315D00000000FFFF00000000000200000001000000020500417269
      616C000A00000000000000000000000000CC00020000000000FFFFFF00000000
      02000000000000000000701B000007004D656D6F3130320002000D0100009201
      0000D7010000140000000300020001000000000000000000FFFFFF1F2C020000
      000000010010005B4B6F6D325D205B446F6C4B6F6D325D00000000FFFF000000
      00000200000001000000020500417269616C000A000000000000000000000000
      00CC00020000000000FFFFFF0000000002000000000000000000001C00000700
      4D656D6F3135320002000D010000A7010000D701000014000000030002000100
      0000000000000000FFFFFF1F2C020000000000010010005B4B6F6D335D205B44
      6F6C4B6F6D335D00000000FFFF00000000000200000001000000020500417269
      616C000A00000000000000000000000000CC00020000000000FFFFFF00000000
      02000000000000000000921C000006004D656D6F313400020048000000490100
      00C5000000140000000300000001000000000000000000FFFFFF1F2C02000000
      000001001300CAEEECE8F1F1E8FF20E220F1EEF1F2E0E2E53A00000000FFFF00
      000000000200000001000000010500417269616C000C00000000000000000000
      0000000100020000000000FFFFFF0000000002000000000000000400E11C0000
      05004C696E653100020048000000040400009C02000000000000010008000200
      0000000000000000FFFFFF1F2C020000000000000000000000FFFF0000000000
      0200000001000000040000D41D000009006D6553706973616E6F000200480000
      000C0200009C020000140000000B00000001000000000000000000FFFFFF1F2C
      020000000000010009005B53706973616E6F5D0004000500626567696E0D1A00
      202053706973616E6F203A3D2047455453504953414E4F28293B0D3B00202069
      66204C656E6774682853706973616E6F29203C2035207468656E204D61737465
      7244617461342E76697369626C65203A3D2046616C73653B0D0300656E6400FF
      FF00000000000200000001000000040500417269616C000C0000000000000000
      00080000000100020000000000FFFFFF00000000020000000000000000005C1E
      000006004D656D6F3136000200480000002A030000480000002C000000030000
      0001000000000000000000FFFFFF1F2C02000000000001000900EDE020F1F3EC
      ECF32000000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000001000000CC00020000000000FFFFFF0000000002000000
      000000000000131F000005004D656D6F3400020048000000740300009C020000
      140000000B00000001000000008000000000FFFFFF002C02000000000001000C
      005B5A616B6C4B6F6D5374725D0003000500626567696E0D1D0020205A616B6C
      4B6F6D537472203A3D204765745A616B6C4B6F6D28293B0D0300656E6400FFFF
      00000000000200000001000000040500417269616C000C000000000000000000
      080000000100020000000000FFFFFF0000000002000000000000000000A61F00
      0006004D656D6F3137000200480000005A030000C50000001400000003000000
      02000000000000000000FFFFFF1F2C02000000000001001400C7E0EAEBFEF7E5
      EDE8E520EAEEECE8F1F1E8E83A00000000FFFF00000000000200000001000000
      010500417269616C000C000000000000000000000000000100020000000000FF
      FFFF00000000020000000000000000003C20000006004D656D6F313800020048
      000000A2030000C5000000140000000300000001000000000000000000FFFFFF
      1F2C02000000000001001700CFF0E5E4F1E5E4E0F2E5EBFC20EAEEECE8F1F1E8
      E83A2000000000FFFF00000000000200000001000000010500417269616C000C
      00000000000000000008000000CC00020000000000FFFFFF0000000002000000
      000000000000CB20000006004D656D6F31390002000D010000A2030000D70100
      00140000000300020001000000000000000000FFFFFF1F2C0200000000000100
      10005B507265645D205B446F6C507265645D00000000FFFF0000000000020000
      0001000000020500417269616C000A00000000000000000000000000CC000200
      00000000FFFFFF00000000020000000000000000005A21000006004D656D6F32
      3000020048000000BC030000C500000014000000030000000100000000000000
      0000FFFFFF1F2C02000000000001001000D7EBE5EDFB20EAEEECE8F1F1E8E83A
      2000000000FFFF00000000000200000001000000010500417269616C000C0000
      0000000000000008000000CC00020000000000FFFFFF00000000020000000000
      00000000E921000006004D656D6F32310002000D010000BC030000D701000014
      0000000300020001000000000000000000FFFFFF1F2C02000000000001001000
      5B4B6F6D315D205B446F6C4B6F6D315D00000000FFFF00000000000200000001
      000000020500417269616C000A00000000000000000000000000CC0002000000
      0000FFFFFF00000000020000000000000000007822000006004D656D6F323200
      02000D010000D1030000D7010000140000000300020001000000000000000000
      FFFFFF1F2C020000000000010010005B4B6F6D325D205B446F6C4B6F6D325D00
      000000FFFF00000000000200000001000000020500417269616C000A00000000
      000000000000000000CC00020000000000FFFFFF000000000200000000000000
      00000723000006004D656D6F32330002000D010000E6030000D7010000140000
      000300020001000000000000000000FFFFFF1F2C020000000000010010005B4B
      6F6D335D205B446F6C4B6F6D335D00000000FFFF000000000002000000010000
      00020500417269616C000A00000000000000000000000000CC00020000000000
      FFFFFF00000000020000000000000000008D23000006004D656D6F3235000200
      840200000804000060000000140000000300000002000000000000000000FFFF
      FF1F2C020000000000010007005B50414745235D00000000FFFF000000000002
      00000001000000020500417269616C000A000000000000000000090000000100
      020000000000FFFFFF00000000020000000000000000009324000005004D656D
      6F31000200E801000006000000FC0000007F0000000300000001000000000000
      000000FFFFFF1F2C02000000000008000900D3D2C2C5D0C6C4C0DE0D00000D22
      005F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
      5F5F5F0D00000D00000D22005F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
      5F5F5F5F5F5F5F5F5F5F5F5F5F5F0D00000D2600225F5F5F2220205F5F5F5F5F
      5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F202032305F5F5F20E32E00000000FFFF
      00000000000200000001000000020500417269616C000A000000020000000000
      000000000100020000000000FFFFFF00000000020000000000000000001D2500
      0006004D656D6F3135000200E801000035000000FC0000001000000003000000
      01000000000000000000FFFFFF1F2C02000000000001000B0028E4EEEBE6EDEE
      F1F2FC2900000000FFFF00000000000200000001000000020500417269616C00
      07000000020000000000020000000100020000000000FFFFFF00000000020000
      00000000000000BB25000009006D65436F6D6D656E7400020048000000180100
      009C020000170000000300000001000000000000000000FFFFFF1F2C02000000
      000001001C005B6F647353656C446F634D6F76652E2246435F434F4D4D454E54
      225D00000000FFFF00000000000200000001000000000500417269616C000C00
      0000020000000000020000000100020000000000FFFFFF000000000200000000
      00000000006D26000006004D656D6F3331000200480000001403000063010000
      140000000300000001000000000000000000FFFFFF1F2C020000000000010033
      00C2F1E5E3EE20EFEE20EDE0F1F2EEFFF9E5ECF320E0EAF2F320F1EFE8F1E0ED
      EE20EDE0E8ECE5EDEEE2E0EDE8FF282DE8E9293A00000000FFFF000000000002
      00000001000000000500417269616C000A000000000000000000000000000100
      020000000000FFFFFF0000000002000000000000000000F926000006004D656D
      6F3332000200AB01000014030000390100001400000003000000010000000000
      00000000FFFFFF1F2C02000000000001000D005B46435F4E41494D5F4B4F4C5D
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      040000000000000000000100020000000000FFFFFF0000000002000000000000
      000000B427000006004D656D6F333400020048000000C0020000290200001400
      00000300000001000000000000000000FFFFFF1F2C02000000000001003C00C2
      F1E5E3EE20EFEE20E8F1F22E20F4E8EDE0EDF1E8F0EEE2E0EDE8FF3A205B6F64
      73416374537069735265702E2246435F46494E534F55524345225D00000000FF
      FF00000000000200000001000000000500417269616C000A0000000200000000
      0009000000CC00020000000000FFFFFF00000000020000000000000000004F28
      000006004D656D6F333500020070020000C00200007400000014000000030000
      0001000000000000000000FFFFFF1F2C02040110002323232023232320232330
      2E303020F00001000C005B73756D6D5F67726F75705D00000000FFFF00000000
      000200000001000000020500417269616C000A00000002000000000009000000
      CC00020000000000FFFFFF00000000020000000000000000000229000006004D
      656D6F333300020048000000800200009C0200001400000003000F0001000000
      000000000000FFFFFF1F2C0200000000000100340020C8F1F22E20F4E8EDE0ED
      F1E8F0EEE2E0EDE8FF3A205B6F6473416374537069735265702E2246435F4649
      4E534F55524345225D00000000FFFF0000000000020000000100000000050041
      7269616C000A00000002000000000008000000CC00020000000000FFFFFF0000
      00000200000000000000FEFEFF030000000A002043617465676F727931000000
      00040073756D6D0001003000070073747273756D6D0000000000000000000000
      00FC0000000000000000000000000000000058000ACF5E302ED2E24068B3C395
      D66DE440}
  end
  object frxRepMoveToOtd: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39388.589793113400000000
    ReportOptions.LastChange = 40330.491855069440000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo9OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SET('#39'NaimKol'#39',<LINE>);  '
      'end;'
      ''
      'procedure Memo27OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '                         '
      'end;'
      ''
      
        'procedure meDateOnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'begin'
      '  Modified := True;  '
      'end;'
      ''
      'procedure MasterData6OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   SET('#39'FN_SUMM'#39', 0);'
      ' if <frxDBdsSelDocMove."FC_COMMENT"> = '#39#39' then'
      
        '   meComment.Visible := False;                                  ' +
        '                                        '
      'end;'
      ''
      ''
      'procedure Memo19OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SET('#39'FN_SUMM'#39', <FN_SUMM>+<frxDBodsKart."SUMM">);  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxRepMoveToOtdGetValue
    OnUserFunction = frxReturnPostavUserFunction
    Left = 816
    Top = 108
    Datasets = <
      item
        DataSet = frxDBdsSelDocMove
        DataSetName = 'frxDBdsSelDocMove'
      end
      item
        DataSet = frxDBodsKart
        DataSetName = 'frxDBodsKart'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'NaimKol'
        Value = Null
      end
      item
        Name = 'FN_SUMM'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 19.999854166666670000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      LargeDesignHeight = True
      object Header1: TfrxHeader
        Height = 40.000000000000000000
        Top = 185.196970000000000000
        Width = 680.311226768958300000
        object Memo10: TfrxMemoView
          Left = 37.795300000000000000
          Width = 302.362400000000000000
          Height = 40.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 340.157700000000000000
          Width = 74.590600000000000000
          Height = 40.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 414.630180000000000000
          Width = 54.803149610000000000
          Height = 40.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 469.441250000000000000
          Width = 83.149660000000000000
          Height = 40.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 552.590910000000000000
          Width = 102.047310000000000000
          Height = 40.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 1.000000000000000000
          Width = 36.795300000000000000
          Height = 40.000000000000000000
          OnBeforePrint = 'Memo8OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 249.448980000000000000
        Width = 680.311226768958300000
        DataSet = frxDBodsKart
        DataSetName = 'frxDBodsKart'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo9: TfrxMemoView
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo9OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 37.795300000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBodsKart."NAMEKART"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 340.157700000000000000
          Width = 74.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBodsKart."fc_edizm"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 469.441250000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBodsKart."FN_PRICE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 552.590910000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo19OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBodsKart."SUMM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 414.630180000000000000
          Width = 54.803149606299200000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBodsKart."FN_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 104.771800000000000000
        Top = 291.023810000000000000
        Width = 680.311226768958300000
        OnBeforePrint = 'Footer1OnBeforePrint'
        object Memo29: TfrxMemoView
          Left = 463.016204000000000000
          Top = 0.787353000000000000
          Width = 66.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 529.606804000000000000
          Top = 1.031447000000000000
          Width = 124.960699000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo30OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 12.000000000000000000
          Top = 44.000000000000000000
          Width = 64.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#181#1057#1026#1056#181#1056#1169#1056#176#1056#187':')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 12.000000000000000000
          Top = 76.000000000000000000
          Width = 64.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#1105#1056#187':')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 76.000000000000000000
          Top = 44.000000000000000000
          Width = 312.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 76.000000000000000000
          Top = 76.000000000000000000
          Width = 312.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
      end
      object MasterData6: TfrxMasterData
        Height = 142.779530000000000000
        Top = 18.897650000000000000
        Width = 680.311226768958300000
        OnBeforePrint = 'MasterData6OnBeforePrint'
        RowCount = 1
        object Memo4: TfrxMemoView
          Align = baWidth
          Top = 16.000000000000000000
          Width = 680.311226768958300000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#8221#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218' '#1056#1109' '#1056#1111#1056#181#1057#1026#1056#181#1056#1169#1056#176#1057#8225#1056#181' '#1056#1118#1056#1114#1056#166' '#1074#8222#8211'  [frxDBdsSelDocM' +
              'ove."FC_DOC"]'
            #1056#1109#1057#8218'  [frxDBdsSelDocMove."FC_INVOICE_DDMMYYYY"] '#1056#1110'.')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo46: TfrxMemoView
          Align = baWidth
          Top = 57.708720000000000000
          Width = 680.311226768958300000
          Height = 50.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1108#1057#1107#1056#1169#1056#176': [frxDBdsSelDocMove."FC_MOGROUPID_FROM"]'
            #1056#1113#1057#1107#1056#1169#1056#176':     [frxDBdsSelDocMove."FC_MOGROUPID_TO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object meComment: TfrxMemoView
          Align = baWidth
          Top = 109.000000000000000000
          Width = 680.311226768958300000
          Height = 26.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1112#1056#1112#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#8470': [frxDBdsSelDocMove."FC_COMMENT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frReport2: TfrReport
    InitialZoom = pzPageWidth
    MDIPreview = True
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frActSpisGetValue
    OnUserFunction = frActSpisUserFunction
    OnObjectClick = frActSpisObjectClick
    OnMouseOverObject = frActSpisMouseOverObject
    Left = 260
    Top = 228
    ReportForm = {
      1900000037280000190000000001000100FFFFFFFFFF09000000340800009A0B
      00004800000000000000000000000000000000FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000004000000F6020000B60000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200460100000B004D61737465
      7244617461310002010000000084020000F60200001600000031000500010000
      00000000000000FFFFFF1F000000001000667244426473416374537069735265
      7000000000000000FFFF000000000002000000010000000000000001000000C8
      00000014000000010000000000000200B30100000D004D6173746572466F6F74
      65723100020100000000B0020000F60200001800000031000600010000000000
      00000000FFFFFF1F00000000000000000000000000FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000200210200
      000E005265706F727453756D6D61727931000201000000007C030000F6020000
      6C0000003000010001000000000000000000FFFFFF1F00000000000000000000
      000000FFFF000000000002000000010000000000000001000000C80000001400
      00000100000000000002008E0200000D004D6173746572486561646572310002
      010000000030020000F6020000410000003000040001000000000000000000FF
      FFFF1F00000000000000000000000000FFFF0000000000020000000100000000
      00000001000000C800000014000000010000000000000200FA0200000B004D61
      737465724461746136000201000000003C010000F60200008200000030000500
      01000000000000000000FFFFFF1F0000000001003100000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200660300000B004D6173746572446174613200020100000000CC010000
      F6020000370000003100050001000000000000000000FFFFFF1F000000000100
      3100000000000000FFFF000000000002000000010000000000000001000000C8
      00000014000000010000000000000200D10300000B0050616765466F6F746572
      310002010000000000040000F60200001E000000300003000100000000000000
      0000FFFFFF1F00000000000000000000000000FFFF0000000000020000000100
      00000000000001000000C8000000140000000100000000000002003D0400000B
      004D61737465724461746134000201000000000C020000F60200001400000031
      00050001000000000000000000FFFFFF1F000000000100310000000000000001
      00000000000002000000010000000000000001000000C8000000140000000100
      00000000000200A90400000B004D6173746572446174613500020100000000DC
      020000F6020000640000003100050001000000000000000000FFFFFF1F000000
      0001003100000000000000FFFF00000000000200000001000000000000000100
      0000C8000000140000000100000000000002000F050000050042616E64310002
      010000000050030000F6020000140000003100050001000000000000000000FF
      FFFF1F0000000001003100000000000000FFFF00000000000200000001000000
      0000000001000000C8000000140000000100000000000002007B0500000B004D
      617374657244617461330002010000000018010000F602000017000000310005
      0001000000000000000000FFFFFF1F0000000001003100000000000000FFFF00
      0000000002000000010000000000000001000000C80000001400000001000000
      0000000200E70500000B004D6173746572446174613700020100000000C60000
      00F6020000160000003100050001000000000000000000FFFFFF1F0000000001
      003100000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200530600000B004D6173746572446174
      613800020100000000F4000000F60200000C0000003100050001000000000000
      000000FFFFFF1F0000000001003100000000000000FFFF000000000002000000
      010000000000000001000000C8000000140000000100000000000000003D0700
      0005004D656D6F3200020048000000CD0100009C0200002E0000000B00000001
      000000000000000000FFFFFF1F2C02000000000002001B00EDE0E7EDE0F7E5ED
      E020EFF0E8EAE0E7EEEC205B5072696B617A5D0D4E0063EEF1F2E0E2E8EBE820
      EDE0F1F2EEFFF9E8E920E0EAF22020E220F2EEEC2C20F7F2EE20EFEE20F3EAE0
      E7E0EDEDEEE920EFF0E8F7E8EDE520F1EFE8F1E0EDEE20ECE5E4E8EAE0ECE5ED
      F2EEE23A00000000FFFF00000000000200000001000000040500417269616C00
      0C00000000000000000000000000CC00020000000000FFFFFF00000000020000
      00000000000000BC07000005004D656D6F33000200480000003E0200001E0000
      003200000003000F0002000000000000000000FFFFFF1F2C0200000000000100
      0100B900000000FFFF00000000000200000001000000000500417269616C0009
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      0000000000005208000005004D656D6F35000200660000003E02000031010000
      3200000003000F0002000000000000000000FFFFFF1F2C020000000000010018
      00CDE0E8ECE5EDEEE2E0EDE8E520ECE5E4E8EAE0ECE5EDF2E000000000FFFF00
      000000000200000001000000000500417269616C000A0000000000000000000A
      000000CC00020000000000FFFFFF0000000002000000000000000000D6080000
      05004D656D6F36000200970100003E020000580000003200000003000F000200
      0000000000000000FFFFFF1F2C02000000000001000600C5E42EC8E7EC000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      5A09000005004D656D6F37000200420200003E0200002E000000320000000300
      0F0002000000000000000000FFFFFF1F2C02000000000001000600CAEEEB2DE2
      EE00000000FFFF00000000000200000001000000000500417269616C000A0000
      000000000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000E009000006004D656D6F3131000200EF0100003E0200005300000032
      00000003000F0002000000000000000000FFFFFF1F2C02000000000001000700
      D6E5EDE02C20F000000000FFFF00000000000200000001000000000500417269
      616C000A0000000000000000000A000000CC00020000000000FFFFFF00000000
      02000000000000000000670A000006004D656D6F3132000200700200003E0200
      00740000003200000003000F0002000000000000000000FFFFFF1F2C02000000
      000001000800D1F3ECECE02C20F000000000FFFF000000000002000000010000
      00000500417269616C000A0000000000000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000130B000006004D656D6F3234000200
      48000000840200001E0000001600000003000F0001000000000000000000FFFF
      FF1F2C020000000000010007005B4C494E45235D0003000500626567696E0D16
      0020204E41494D5F4B4F4C203A3D205B4C494E45235D3B0D0300656E6400FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000AD0B00
      0006004D656D6F32360002006600000084020000310100001600000003000F00
      01000000000000000000FFFFFF1F2C02000000000001001B005B6F6473416374
      537069735265702E224E414D454D45444943225D00000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000008000000CC00
      020000000000FFFFFF0000000002000000000000000000440C000006004D656D
      6F32370002009701000084020000580000001600000003000F00010000000000
      00000000FFFFFF1F2C020000000000010018005B6F6473416374537069735265
      702E2245494E414D45225D00000000FFFF000000000002000000010000000005
      00417269616C000A0000000000000000000A000000CC00020000000000FFFFFF
      0000000002000000000000000000DB0C000006004D656D6F3238000200420200
      00840200002E0000001600000003000F0001000000000000000000FFFFFF1F2C
      020000000000010018005B6F6473416374537069735265702E22464E5F4B4F4C
      225D00000000FFFF00000000000200000001000000000500417269616C000A00
      00000000000000000A000000CC00020000000000FFFFFF000000000200000000
      0000000000840D000006004D656D6F3239000200EF0100008402000053000000
      1600000003000F0001000000000000000000FFFFFF1F2C020301100023232320
      232323202323302E303020F00001001A005B6F6473416374537069735265702E
      22666E5F7072696365225D00000000FFFF000000000002000000010000000005
      00417269616C000A0000000000000000000A000000CC00020000000000FFFFFF
      00000000020000000000000000005D0E000006004D656D6F3330000200700200
      0084020000740000001600000003000F0001000000000000000000FFFFFF1F2C
      020301100023232320232323202323302E303020F000010016005B6F64734163
      74537069735265702E2253554D4D225D0003000500626567696E0D2400202073
      756D6D3A3D73756D6D2B5B6F6473416374537069735265702E2253554D4D225D
      3B0D0300656E6400FFFF00000000000200000001000000000500417269616C00
      0A0000000000000000000A000000CC00020000000000FFFFFF00000000020000
      00000000000000FB0E000006004D656D6F3637000200550100006F0000002400
      0000110000000300020001000000000000000000FFFFFF1F2C02000000000001
      001F00225B464F524D41544441544554494D4528276464272C2044415445295D
      222000000000000000000000000200000001000000000500417269616C000C00
      000000000000000000000000CC00020000000000FFFFFF000000000200000000
      00000000008F0F000006004D656D6F36380002008A0100007000000078000000
      110000000300020001000000000000000000FFFFFF1F2C020000000000010015
      005B6F6473416374537069735265702E224D4F4E225D00000000000000000000
      000200000001000000000500417269616C000C00000000000000000002000000
      CC00020000000000FFFFFF00000000020000000000000000002E10000006004D
      656D6F36390002001A0200006F00000034000000140000000300000001000000
      000000000000FFFFFF1F2C020000000000010020005B464F524D415444415445
      54494D45282779797979272C2044415445295D20E30000000000000000000000
      0200000001000000000500417269616C000C00000000000000000000000000CC
      00020000000000FFFFFF0000000002000000000000000000CD10000013006D65
      66635F6D6F67726F757069645F66726F6D000200480000004D0000006C010000
      130000000300020001000000000000000000FFFFFF1F2C020000000000010013
      005B66635F6D6F67726F757069645F66726F6D5D00000000FFFF000000000002
      00000001000000010500417269616C000A00000000000000000012000000CC00
      020000000000FFFFFF00000000020000000000000000006611000006004D656D
      6F3735000200480000006C000000410100001500000003000200010000000000
      00000000FFFFFF1F2C02000000000001001A005B6F6473416374537069735265
      702E224E414D4546524F4D225D00000000000000000000000200000001000000
      010500417269616C000A00000000000000000012000000CC00020000000000FF
      FFFF00000000020000000000000000001E12000006004D656D6F373600020048
      000000860000009C020000340000000300000001000000000000000000FFFFFF
      1F2C02000000000001001B005B6F647353656C446F634D6F76652E2246435F44
      4F434D4958225D0004000500626567696E0D0B0020202073756D6D3A3D303B0D
      00000D0300656E6400FFFF00000000000200000001000000040500417269616C
      00100000000200000000000A000000CC00020000000000FFFFFF000000000200
      0000000000000000DD12000006004D656D6F3831000200EF010000B002000081
      000000140000000300000001000000000000000000FFFFFF1F2C020000000000
      01000600C8F2EEE3EE3A0003000500626567696E0D2A00202046435F4E41494D
      5F4B4F4C203A3D204745545F4E41494D5F4B4F4C28204E41494D5F4B4F4C2029
      3B0D0300656E6400FFFF00000000000200000001000000000500417269616C00
      0A00000002000000000009000000CC00020000000000FFFFFF00000000020000
      000000000000007213000006004D656D6F383300020070020000B00200007400
      0000140000000300000001000000000000000000FFFFFF1F2C02040110002323
      2320232323202323302E303020F000010006005B73756D6D5D00000000FFFF00
      000000000200000001000000020500417269616C000A00000002000000000009
      000000CC00020000000000FFFFFF000000000200000000000000000002140000
      06004D656D6F393500020090000000F6020000540200002C0000000300000001
      000000000000000000FFFFFF1F2C020000000000010011005B4D4F4E45595354
      522873756D6D295D2000000000FFFF0000000000020000000100000000050041
      7269616C000A00000004000000000000000000CC00020000000000FFFFFF0000
      0000020000000000000000009B14000005004D656D6F3800020048000000C600
      00009C020000160000000300000001000000000000000000FFFFFF1F2C020000
      00000001001B005B6F6473416374537069735265702E22537069734465736372
      225D00000000FFFF00000000000200000001000000040500417269616C001000
      00000200000000000A0000000100020000000000FFFFFF000000000200000000
      00000000005E15000005004D656D6F3900020048000000F40000009C0200000C
      0000000300000001000000000000000000FFFFFF1F2C02000000000001001200
      28EFF0E8F7E8EDE020F1EFE8F1E0EDE8FF290003000500626567696E0D230020
      204D656D6F392E56697369626C65203A3D204D656D6F382E4D656D6F203D2027
      273B0D0300656E6400FFFF00000000000200000001000000040500417269616C
      0007000000000000000000020000000100020000000000FFFFFF000000000200
      0000000000000000E915000006004D656D6F313000020048000000330000006C
      0100000C0000000300000001000000000000000000FFFFFF1F2C020000000000
      01000C0028F3F7F0E5E6E4E5EDE8E52900000000FFFF00000000000200000001
      000000010500417269616C000700000000000000000002000000010002000000
      0000FFFFFF00000000020000000000000000007716000006004D656D6F313300
      020048000000610000006C0100000C0000000300000001000000000000000000
      FFFFFF1F2C02000000000001000F0028EFEEE4F0E0E7E4E5EBE5EDE8E5290000
      0000FFFF00000000000200000001000000010500417269616C00070000000000
      00000000020000000100020000000000FFFFFF00000000020000000000000000
      000D17000006004D656D6F39390002004800000063010000C500000014000000
      0300000001000000000000000000FFFFFF1F2C02000000000001001700CFF0E5
      E4F1E5E4E0F2E5EBFC20EAEEECE8F1F1E8E83A2000000000FFFF000000000002
      00000001000000010500417269616C000C00000000000000000008000000CC00
      020000000000FFFFFF00000000020000000000000000009D17000007004D656D
      6F313031000200480000007D010000C500000014000000030000000100000000
      0000000000FFFFFF1F2C02000000000001001000D7EBE5EDFB20EAEEECE8F1F1
      E8E83A2000000000FFFF00000000000200000001000000010500417269616C00
      0C00000000000000000008000000CC00020000000000FFFFFF00000000020000
      000000000000002C18000006004D656D6F34380002000D01000063010000D701
      0000140000000300020001000000000000000000FFFFFF1F2C02000000000001
      0010005B507265645D205B446F6C507265645D00000000FFFF00000000000200
      000001000000020500417269616C000A00000000000000000000000000CC0002
      0000000000FFFFFF0000000002000000000000000000BC18000007004D656D6F
      3130350002000D0100007D010000D70100001400000003000200010000000000
      00000000FFFFFF1F2C020000000000010010005B4B6F6D315D205B446F6C4B6F
      6D315D00000000FFFF00000000000200000001000000020500417269616C000A
      00000000000000000000000000CC00020000000000FFFFFF0000000002000000
      0000000000004C19000007004D656D6F3130320002000D01000092010000D701
      0000140000000300020001000000000000000000FFFFFF1F2C02000000000001
      0010005B4B6F6D325D205B446F6C4B6F6D325D00000000FFFF00000000000200
      000001000000020500417269616C000A00000000000000000000000000CC0002
      0000000000FFFFFF0000000002000000000000000000DC19000007004D656D6F
      3135320002000D010000A7010000D70100001400000003000200010000000000
      00000000FFFFFF1F2C020000000000010010005B4B6F6D335D205B446F6C4B6F
      6D335D00000000FFFF00000000000200000001000000020500417269616C000A
      00000000000000000000000000CC00020000000000FFFFFF0000000002000000
      0000000000006E1A000006004D656D6F31340002004800000049010000C50000
      00140000000300000001000000000000000000FFFFFF1F2C0200000000000100
      1300CAEEECE8F1F1E8FF20E220F1EEF1F2E0E2E53A00000000FFFF0000000000
      0200000001000000010500417269616C000C0000000000000000000000000001
      00020000000000FFFFFF0000000002000000000000000400BD1A000005004C69
      6E653100020048000000040400009C0200000000000001000800020000000000
      00000000FFFFFF1F2C020000000000000000000000FFFF000000000002000000
      01000000040000B01B000009006D6553706973616E6F000200480000000C0200
      009C020000140000000B00000001000000000000000000FFFFFF1F2C02000000
      0000010009005B53706973616E6F5D0004000500626567696E0D1A0020205370
      6973616E6F203A3D2047455453504953414E4F28293B0D3B0020206966204C65
      6E6774682853706973616E6F29203C2035207468656E204D6173746572446174
      61342E76697369626C65203A3D2046616C73653B0D0300656E6400FFFF000000
      00000200000001000000040500417269616C000C000000000000000000080000
      000100020000000000FFFFFF0000000002000000000000000000381C00000600
      4D656D6F313600020048000000F6020000480000002C00000003000000010000
      00000000000000FFFFFF1F2C02000000000001000900EDE020F1F3ECECF32000
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      000000000001000000CC00020000000000FFFFFF000000000200000000000000
      0000EF1C000005004D656D6F3400020048000000500300009C02000014000000
      0B00000001000000008000000000FFFFFF002C02000000000001000C005B5A61
      6B6C4B6F6D5374725D0003000500626567696E0D1D0020205A616B6C4B6F6D53
      7472203A3D204765745A616B6C4B6F6D28293B0D0300656E6400FFFF00000000
      000200000001000000040500417269616C000C00000000000000000008000000
      0100020000000000FFFFFF0000000002000000000000000000821D000006004D
      656D6F31370002004800000026030000C5000000140000000300000002000000
      000000000000FFFFFF1F2C02000000000001001400C7E0EAEBFEF7E5EDE8E520
      EAEEECE8F1F1E8E83A00000000FFFF0000000000020000000100000001050041
      7269616C000C000000000000000000000000000100020000000000FFFFFF0000
      000002000000000000000000181E000006004D656D6F3138000200480000008E
      030000C5000000140000000300000001000000000000000000FFFFFF1F2C0200
      0000000001001700CFF0E5E4F1E5E4E0F2E5EBFC20EAEEECE8F1F1E8E83A2000
      000000FFFF00000000000200000001000000010500417269616C000C00000000
      000000000008000000CC00020000000000FFFFFF000000000200000000000000
      0000A71E000006004D656D6F31390002000D0100008E030000D7010000140000
      000300020001000000000000000000FFFFFF1F2C020000000000010010005B50
      7265645D205B446F6C507265645D00000000FFFF000000000002000000010000
      00020500417269616C000A00000000000000000000000000CC00020000000000
      FFFFFF0000000002000000000000000000361F000006004D656D6F3230000200
      48000000A8030000C5000000140000000300000001000000000000000000FFFF
      FF1F2C02000000000001001000D7EBE5EDFB20EAEEECE8F1F1E8E83A20000000
      00FFFF00000000000200000001000000010500417269616C000C000000000000
      00000008000000CC00020000000000FFFFFF0000000002000000000000000000
      C51F000006004D656D6F32310002000D010000A8030000D70100001400000003
      00020001000000000000000000FFFFFF1F2C020000000000010010005B4B6F6D
      315D205B446F6C4B6F6D315D00000000FFFF0000000000020000000100000002
      0500417269616C000A00000000000000000000000000CC00020000000000FFFF
      FF00000000020000000000000000005420000006004D656D6F32320002000D01
      0000BD030000D7010000140000000300020001000000000000000000FFFFFF1F
      2C020000000000010010005B4B6F6D325D205B446F6C4B6F6D325D00000000FF
      FF00000000000200000001000000020500417269616C000A0000000000000000
      0000000000CC00020000000000FFFFFF0000000002000000000000000000E320
      000006004D656D6F32330002000D010000D2030000D701000014000000030002
      0001000000000000000000FFFFFF1F2C020000000000010010005B4B6F6D335D
      205B446F6C4B6F6D335D00000000FFFF00000000000200000001000000020500
      417269616C000A00000000000000000000000000CC00020000000000FFFFFF00
      000000020000000000000000006921000006004D656D6F323500020084020000
      0804000060000000140000000300000002000000000000000000FFFFFF1F2C02
      0000000000010007005B50414745235D00000000FFFF00000000000200000001
      000000020500417269616C000A00000000000000000009000000010002000000
      0000FFFFFF0000000002000000000000000000F021000005004D656D6F310002
      00E801000006000000FC0000000F0000000300000001000000000000000000FF
      FFFF1F2C02000000000001000900D3D2C2C5D0C6C4C0DE00000000FFFF000000
      00000200000001000000000500417269616C000A000000020000000000000000
      000100020000000000FFFFFF00000000020000000000000000008E2200000900
      6D65436F6D6D656E7400020048000000180100009C0200001700000003000000
      01000000000000000000FFFFFF1F2C02000000000001001C005B6F647353656C
      446F634D6F76652E2246435F434F4D4D454E54225D00000000FFFF0000000000
      0200000001000000000500417269616C000C0000000200000000000200000001
      00020000000000FFFFFF00000000020000000000000000004023000006004D65
      6D6F333100020048000000E00200006301000014000000030000000100000000
      0000000000FFFFFF1F2C02000000000001003300C2F1E5E3EE20EFEE20EDE0F1
      F2EEFFF9E5ECF320E0EAF2F320F1EFE8F1E0EDEE20EDE0E8ECE5EDEEE2E0EDE8
      FF282DE8E9293A00000000FFFF00000000000200000001000000000500417269
      616C000A000000000000000000000000000100020000000000FFFFFF00000000
      02000000000000000000CC23000006004D656D6F3332000200AB010000E00200
      0039010000140000000300000001000000000000000000FFFFFF1F2C02000000
      000001000D005B46435F4E41494D5F4B4F4C5D00000000FFFF00000000000200
      000001000000000500417269616C000A00000004000000000000000000010002
      0000000000FFFFFF00000000020000000000000000005624000006004D656D6F
      3135000200E801000033000000FC0000000C0000000300000001000000000000
      000000FFFFFF1F2C02000000000001000B0028E4EEEBE6EDEEF1F2FC29000000
      00FFFF00000000000200000001000000020500417269616C0007000000020000
      000000020000000100020000000000FFFFFF0000000002000000000000000000
      F924000006004D656D6F3334000200E801000015000000FC0000001E00000003
      00020001000000000000000000FFFFFF1F2C02000000000001002400C3EBE0E2
      EDFBE920E2F0E0F720D1E0EDE0F2EEF0E8FF2DEFF0EEF4E8EBE0EAF2EEF0E8FF
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      000000000000100000000100020000000000FFFFFF0000000002000000000000
      0000009E25000006004D656D6F3337000200E801000071000000FC0000001000
      00000300000001000000000000000000FFFFFF1F2C02000000000001002600AB
      5F5F5FBB20205F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F202032305F
      5F5F20E32E00000000FFFF00000000000200000001000000000500417269616C
      000A000000000000000000100000000100020000000000FFFFFF000000000200
      00000000000000003226000006004D656D6F373100020048000000100000006C
      010000230000000300020001000000000000000000FFFFFF1F2C020000000000
      010015005B6F6473416374537069735265702E224C4F4B225D00000000FFFF00
      000000000200000001000000010500417269616C000A00000000000000000012
      000000CC00020000000000FFFFFF0000000002000000000000000000B9260000
      06004D656D6F3338000200E801000065000000FC0000000C0000000300000001
      000000000000000000FFFFFF1F2C0200000000000100080028D42EC82ECE2E29
      00000000FFFF00000000000200000001000000020500417269616C0007000000
      020000000000020000000100020000000000FFFFFF0000000002000000000000
      0000004527000006004D656D6F3336000200E801000052000000FC0000001300
      00000300020001000000000000000000FFFFFF1F2C02000000000001000D00C8
      2EC02E20D1F2EEEBFFF0EEE200000000FFFF0000000000020000000100000000
      0500417269616C000A000000000000000000100000000100020000000000FFFF
      FF0000000002000000000000000000DD27000006004D656D6F3335000200E801
      00003F000000FC000000130000000300020001000000000000000000FFFFFF1F
      2C02000000000001001900ABC3E0E7EFF0EEEC20F2F0E0EDF1E3E0E720DEE3EE
      F0F1EABB00000000FFFF00000000000200000001000000000500417269616C00
      0A000000000000000000100000000100020000000000FFFFFF00000000020000
      0000000000FEFEFF030000000A002043617465676F7279310000000004007375
      6D6D0001003000070073747273756D6D000000000000000000000000FC000000
      0000000000000000000000000058000ACF5E302ED2E24068B3C395D66DE440}
  end
  object odsActSpisRepInPeriod: TOracleDataSet
    SQL.Strings = (
      
        'SELECT /*+RULE*/-- :OTP4 AS OTP4,:DOLOTP4 AS DOLOTP4,:POL AS POL' +
        ',:OTP AS OTP,:DOLPOL AS DOLPOL,:DOLOTP AS DOLOTP,:OTP1 AS OTP1,:' +
        'OTP2 AS OTP2,:DOLOTP1 AS DOLOTP1,:DOLOTP2 AS DOLOTP2,'
      '    max(TO_CHAR(SYSDATE,'#39'MONTH'#39')) AS MON,'
      '    TMEDIC.FC_NAME AS NAMEMEDIC,'
      '    TKART.MEDICID,'
      '    sum(tdpc.FN_KOL) fn_kol,'
      '    sum(TKART.FN_PRICE * tdpc.FN_KOL) as summ,'
      '    TKART.FN_PRICE,'
      '    TEI.FC_NAME AS EINAME,'
      '    vmove.FC_MOGROUPID_FROM,'
      
        '    max(MED.PKG_PRIHRASH.GET_MONEYSTR(TDOCS.FN_PRICE)) AS SUMSTR' +
        ','
      
        '    max(ASU.PKG_SMINI.READSTRING('#39'CONFIG'#39','#39'S_FULLNAME'#39','#39#39')) AS L' +
        'OK,'
      '    max(ASU.PKG_SMINI.READSTRING('#39'NACHLOK'#39','#39'FIO'#39','#39#39')) AS NACH, '
      '    max(TMO.FC_NAME) AS NAMEFROM,'
      
        '    MAX('#39#1085#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086' '#1074' '#1056#1055#1054#39') --MED.PKGTDOCS.GET_SPISANIE_DET' +
        'AIL_DESCR ( TDOCS.FP_VID, TDOCS.FP_VIDMOVE, TDOCS.FN_SPISANIEVID' +
        ', TDOCS.FK_MOGROUPID_TO) '
      'as SpisDescr,'
      
        '    max(decode(:FILTERED_BY_DATE1,0,to_date('#39'01.01.2000'#39','#39'dd.mm.' +
        'yyyy'#39'),TRUNC(:DATE1))) as DATE1,'
      
        '    max(decode(:FILTERED_BY_DATE2,0,TRUNC(sysdate+365,'#39'yy'#39'),TRUN' +
        'C(:DATE2))) as DATE2,'
      
        '    (select max(ltrim(rtrim(asu.pkg_strings.CONCATENATE(rownum,v' +
        'move.fc_doc,'#39', '#39'),'#39', '#39'),'#39', '#39'))'
      '       from MED.vmove'
      '      where vmove.fl_edit = 0'
      '    AND vmove.fp_vidmove = :vidmove'
      '    AND vmove.FC_MOGROUPID_TO=:FC_MOGROUPID_TO'
      
        '    AND ((TRUNC(vmove.FD_DATA) >= TRUNC(:DATE1) or :FILTERED_BY_' +
        'DATE1 = 0) and (TRUNC(vmove.FD_DATA) <= :DATE2 or :FILTERED_BY_D' +
        'ATE2 = 0))) fc_doc'
      ''
      
        '  FROM MED.TDPC, MED.TKART, MED.TMEDIC, MED.TEI, MED.TDOCS, MED.' +
        'TMO, MED.vmove'
      '  WHERE TDOCS.DPID=TDPC.DPID '
      '    AND  TDOCS.DPID=vmove.dpid'
      '    AND TDPC.KARTID=TKART.KARTID '
      '    AND TMEDIC.EIID=TEI.EIID(+) '
      '    AND TKART.MEDICID=TMEDIC.MEDICID'
      '    AND TDOCS.MOFROMID = TMO.MOID(+)'
      '    AND TKART.FL_DEL=0'
      '    AND vmove.fl_edit = 0'
      '    AND vmove.fp_vidmove = :vidmove'
      '    AND vmove.FC_MOGROUPID_TO=:FC_MOGROUPID_TO'
      
        '    AND ((TRUNC(vmove.FD_DATA) >= TRUNC(:DATE1) or :FILTERED_BY_' +
        'DATE1 = 0) and (TRUNC(vmove.FD_DATA) <= :DATE2 or :FILTERED_BY_D' +
        'ATE2 = 0))'
      '--    AND TMEDIC.FL_VISIBLE = 1'
      ''
      '  group by'
      '    --TO_CHAR(SYSDATE,'#39'MONTH'#39'),'
      '    TMEDIC.FC_NAME,'
      '    TKART.MEDICID,'
      '    TKART.FN_PRICE,'
      '    TEI.FC_NAME,'
      '    vmove.FC_MOGROUPID_FROM'
      '    --MED.PKG_PRIHRASH.GET_MONEYSTR(TDOCS.FN_PRICE),'
      '    --ASU.PKG_SMINI.READSTRING('#39'MANAGER_DOC'#39','#39'CLIENT_NAME'#39','#39#39'),'
      '    --ASU.PKG_SMINI.READSTRING('#39'NACHLOK'#39','#39'FIO'#39','#39#39'), '
      '    --TMO.FC_NAME,'
      
        '    --MED.PKGTDOCS.GET_SPISANIE_DETAIL_DESCR ( TDOCS.FP_VID, TDO' +
        'CS.FP_VIDMOVE, TDOCS.FN_SPISANIEVID, TDOCS.FK_MOGROUPID_TO),'
      
        '    --decode(:FILTERED_BY_DATE1,0,to_date('#39'01.01.2000'#39','#39'dd.mm.yy' +
        'yy'#39'),TRUNC(:DATE1)),'
      
        '    --decode(:FILTERED_BY_DATE2,0,TRUNC(sysdate+365,'#39'yy'#39'),TRUNC(' +
        ':DATE2))'
      '  ORDER BY TMEDIC.FC_NAME')
    Optimize = False
    Variables.Data = {
      0300000006000000080000003A5649444D4F5645030000000000000000000000
      100000003A46435F4D4F47524F555049445F544F050000000000000000000000
      060000003A44415445310C0000000000000000000000120000003A46494C5445
      5245445F42595F4441544531030000000000000000000000060000003A444154
      45320C0000000000000000000000120000003A46494C54455245445F42595F44
      41544532030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000012000000050000004450434944010000000000070000004D45444943
      494401000000000006000000464E5F4B4F4C010000000000060000004B415254
      49440100000000000600000045494E414D45010000000000080000004E414D45
      4B415254010000000000060000004E4F4D4E554D010000000000090000004E41
      4D454D454449430100000000000600000053554D535452010000000000030000
      004D4F4E0100000000000400000053554D4D010000000000030000004C4F4B01
      0000000000040000004E414348010000000000080000004E414D4546524F4D01
      00000000000600000046435F444F430100000000000400000044415441010000
      00000008000000464E5F50524943450100000000000900000053504953444553
      4352010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 452
    Top = 443
  end
  object frActSpisInPeriod: TfrReport
    InitialZoom = pzPageWidth
    MDIPreview = True
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frActSpisGetValue
    OnUserFunction = frActSpisUserFunction
    OnObjectClick = frActSpisObjectClick
    OnMouseOverObject = frActSpisMouseOverObject
    Left = 452
    Top = 348
    ReportForm = {
      190000004F2C0000190000000001000100FFFFFFFFFF09000000340800009A0B
      00004800000000000000000000000000000000FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000004000000F6020000BF0000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C8000000140000000100000000000002004E0100000B004D61737465
      7244617461310002010000000060020000F60200001600000031000500010000
      00000000000000FFFFFF1F000000001800667244426473416374537069735265
      70496E506572696F6400000000000000FFFF0000000000020000000100000000
      00000001000000C800000014000000010000000000000200BB0100000D004D61
      73746572466F6F74657231000201000000007C020000F6020000180000003100
      060001000000000000000000FFFFFF1F00000000000000000000000000FFFF00
      0000000002000000010000000000000001000000C80000001400000001000000
      0000000200290200000E005265706F727453756D6D6172793100020100000000
      7C030000F60200006C0000003000010001000000000000000000FFFFFF1F0000
      0000000000000000000000FFFF00000000000200000001000000000000000100
      0000C800000014000000010000000000000200960200000D004D617374657248
      6561646572310002010000000010020000F60200004100000030000400010000
      00000000000000FFFFFF1F00000000000000000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      020300000B004D617374657244617461360002010000000028010000F6020000
      760000003000050001000000000000000000FFFFFF1F00000000010031000000
      00000000FFFF000000000002000000010000000000000001000000C800000014
      0000000100000000000002006E0300000B004D61737465724461746132000201
      00000000B4010000F6020000370000003100050001000000000000000000FFFF
      FF1F0000000001003100000000000000FFFF0000000000020000000100000000
      00000001000000C800000014000000010000000000000200D90300000B005061
      6765466F6F746572310002010000000000040000F60200001E00000030000300
      01000000000000000000FFFFFF1F00000000000000000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      000200450400000B004D6173746572446174613400020100000000F0010000F6
      020000140000003100050001000000000000000000FFFFFF1F00000000010031
      000000000000000100000000000002000000010000000000000001000000C800
      000014000000010000000000000200B10400000B004D61737465724461746135
      00020100000000B0020000F60200001900000030000500010000000000000000
      00FFFFFF1F0000000001003100000000000000FFFF0000000000020000000100
      00000000000001000000C8000000140000000100000000000002001705000005
      0042616E64310002010000000050030000F60200001400000031000500010000
      00000000000000FFFFFF1F0000000001003100000000000000FFFF0000000000
      02000000010000000000000001000000C8000000140000000100000000000002
      00830500000B004D6173746572446174613300020100000000D4020000F60200
      00140000003100050001000000000000000000FFFFFF1F000000000100310000
      0000000000FFFF000000000002000000010000000000000001000000C8000000
      14000000010000000000000200EF0500000B004D617374657244617461370002
      0100000000F5020000F6020000470000003000050001000000000000000000FF
      FFFF1F0000000001003100000000000000FFFF00000000000200000001000000
      0000000001000000C8000000140000000100000000000002005B0600000B004D
      6173746572446174613800020100000000EA000000F60200003C000000300005
      0001000000000000000000FFFFFF1F0000000001003100000000000000FFFF00
      0000000002000000010000000000000001000000C80000001400000001000000
      0000000200C70600000B004D6173746572446174613900020100000000C20000
      00F6020000250000003100050001000000000000000000FFFFFF1F0000000001
      003100000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000000B107000005004D656D6F3200020048
      000000B50100009C0200002E0000000B00000001000000000000000000FFFFFF
      1F2C02000000000002001B00EDE0E7EDE0F7E5EDE020EFF0E8EAE0E7EEEC205B
      5072696B617A5D0D4E0063EEF1F2E0E2E8EBE820EDE0F1F2EEFFF9E8E920E0EA
      F22020E220F2EEEC2C20F7F2EE20EFEE20F3EAE0E7E0EDEDEEE920EFF0E8F7E8
      EDE520F1EFE8F1E0EDEE20ECE5E4E8EAE0ECE5EDF2EEE23A00000000FFFF0000
      0000000200000001000000040500417269616C000C0000000000000000000000
      0000CC00020000000000FFFFFF00000000020000000000000000003008000005
      004D656D6F33000200480000001E0200001E0000003200000003000F00020000
      00000000000000FFFFFF1F2C02000000000001000100B900000000FFFF000000
      00000200000001000000000500417269616C00090000000000000000000A0000
      00CC00020000000000FFFFFF0000000002000000000000000000C60800000500
      4D656D6F35000200660000001E020000180100003200000003000F0002000000
      000000000000FFFFFF1F2C02000000000001001800CDE0E8ECE5EDEEE2E0EDE8
      E520ECE5E4E8EAE0ECE5EDF2E000000000FFFF00000000000200000001000000
      000500417269616C000A0000000000000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000004A09000005004D656D6F36000200BC01
      00001E0200003B0000003200000003000F0002000000000000000000FFFFFF1F
      2C02000000000001000600C5E42EC8E7EC00000000FFFF000000000002000000
      01000000000500417269616C000A0000000000000000000A000000CC00020000
      000000FFFFFF0000000002000000000000000000CE09000005004D656D6F3700
      0200420200001E020000380000003200000003000F0002000000000000000000
      FFFFFF1F2C02000000000001000600CAEEEB2DE2EE00000000FFFF0000000000
      0200000001000000000500417269616C000A0000000000000000000A000000CC
      00020000000000FFFFFF0000000002000000000000000000540A000006004D65
      6D6F3131000200F70100001E0200004B0000003200000003000F000200000000
      0000000000FFFFFF1F2C02000000000001000700D6E5EDE02C20F000000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      000A000000CC00020000000000FFFFFF0000000002000000000000000000DB0A
      000006004D656D6F31320002007A0200001E0200006A0000003200000003000F
      0002000000000000000000FFFFFF1F2C02000000000001000800D1F3ECECE02C
      20F000000000FFFF00000000000200000001000000000500417269616C000A00
      00000000000000000A000000CC00020000000000FFFFFF000000000200000000
      0000000000870B000006004D656D6F323400020048000000600200001E000000
      1600000003000F0001000000000000000000FFFFFF1F2C020000000000010007
      005B4C494E45235D0003000500626567696E0D160020204E41494D5F4B4F4C20
      3A3D205B4C494E45235D3B0D0300656E6400FFFF000000000002000000010000
      00000500417269616C000A0000000000000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000290C000006004D656D6F3236000200
      6600000060020000180100001600000003000F0001000000000000000000FFFF
      FF1F2C020000000000010023005B6F647341637453706973526570496E506572
      696F642E224E414D454D45444943225D00000000FFFF00000000000200000001
      000000000500417269616C000A00000000000000000008000000CC0002000000
      0000FFFFFF0000000002000000000000000000C80C000006004D656D6F323700
      0200BC010000600200003B0000001600000003000F0001000000000000000000
      FFFFFF1F2C020000000000010020005B6F647341637453706973526570496E50
      6572696F642E2245494E414D45225D00000000FFFF0000000000020000000100
      0000000500417269616C000A0000000000000000000A000000CC000200000000
      00FFFFFF0000000002000000000000000000670D000006004D656D6F32380002
      004202000060020000380000001600000003000F0001000000000000000000FF
      FFFF1F2C020000000000010020005B6F647341637453706973526570496E5065
      72696F642E22464E5F4B4F4C225D00000000FFFF000000000002000000010000
      00000500417269616C000A0000000000000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000180E000006004D656D6F3239000200
      F7010000600200004B0000001600000003000F0001000000000000000000FFFF
      FF1F2C020301100023232320232323202323302E303020F000010022005B6F64
      7341637453706973526570496E506572696F642E22666E5F7072696365225D00
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      0000010F000006004D656D6F33300002007A020000600200006A000000160000
      0003000F0001000000000000000000FFFFFF1F2C020301100023232320232323
      202323302E303020F00001001E005B6F647341637453706973526570496E5065
      72696F642E2253554D4D225D0003000500626567696E0D2C00202073756D6D3A
      3D73756D6D2B5B6F647341637453706973526570496E506572696F642E225355
      4D4D225D3B0D0300656E6400FFFF000000000002000000010000000005004172
      69616C000A0000000000000000000A000000CC00020000000000FFFFFF000000
      00020000000000000000009F0F000006004D656D6F36370002004D0100006F00
      000024000000110000000300020001000000000000000000FFFFFF1F2C020000
      00000001001F00225B464F524D41544441544554494D4528276464272C204441
      5445295D22200000000000000000000000020000000100000000050041726961
      6C000C00000000000000000000000000CC00020000000000FFFFFF0000000002
      0000000000000000003B10000006004D656D6F37310002004800000010000000
      6C010000230000000300020001000000000000000000FFFFFF1F2C0200000000
      0001001D005B6F647341637453706973526570496E506572696F642E224C4F4B
      225D00000000FFFF00000000000200000001000000010500417269616C000A00
      000000000000000012000000CC00020000000000FFFFFF000000000200000000
      0000000000DD10000006004D656D6F373300020048000000430000006C010000
      230000000300020001000000000000000000FFFFFF1F2C020000000000010023
      005B6F647353656C446F634D6F76652E2266635F6D6F67726F757069645F6672
      6F6D225D00000000FFFF00000000000200000001000000010500417269616C00
      0A00000000000000000012000000CC00020000000000FFFFFF00000000020000
      000000000000007E11000006004D656D6F373500020048000000740000004101
      0000130000000300020001000000000000000000FFFFFF1F2C02000000000001
      0022005B6F647341637453706973526570496E506572696F642E224E414D4546
      524F4D225D00000000000000000000000200000001000000010500417269616C
      000A00000000000000000012000000CC00020000000000FFFFFF000000000200
      00000000000000002B12000006004D656D6F3736000200480000009F0000009C
      020000210000000300000001000000000000000000FFFFFF1F2C020000000000
      01001000D1EFE8F1E0EDE8E520E220D0CFCE20B90004000500626567696E0D0B
      0020202073756D6D3A3D303B0D00000D0300656E6400FFFF0000000000020000
      0001000000040500417269616C00100000000200000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000EA12000006004D656D6F38
      31000200EF0100007C0200008B00000014000000030000000100000000000000
      0000FFFFFF1F2C02000000000001000600C8F2EEE3EE3A000300050062656769
      6E0D2A00202046435F4E41494D5F4B4F4C203A3D204745545F4E41494D5F4B4F
      4C28204E41494D5F4B4F4C20293B0D0300656E6400FFFF000000000002000000
      01000000000500417269616C000A00000002000000000009000000CC00020000
      000000FFFFFF00000000020000000000000000007F13000006004D656D6F3833
      0002007A0200007C0200006A0000001400000003000000010000000000000000
      00FFFFFF1F2C020401100023232320232323202323302E303020F00001000600
      5B73756D6D5D00000000FFFF0000000000020000000100000002050041726961
      6C000A00000002000000000009000000CC00020000000000FFFFFF0000000002
      0000000000000000002014000005004D656D6F3800020048000000EB0000009C
      020000160000000300000001000000000000000000FFFFFF1F2C020000000000
      010023005B6F647341637453706973526570496E506572696F642E2253706973
      4465736372225D00000000FFFF00000000000200000001000000040500417269
      616C00100000000200000000000A0000000100020000000000FFFFFF00000000
      02000000000000000000E314000005004D656D6F390002004800000001010000
      9C0200000C0000000300000001000000000000000000FFFFFF1F2C0200000000
      000100120028EFF0E8F7E8EDE020F1EFE8F1E0EDE8FF29000300050062656769
      6E0D230020204D656D6F392E56697369626C65203A3D204D656D6F382E4D656D
      6F203D2027273B0D0300656E6400FFFF00000000000200000001000000040500
      417269616C0007000000000000000000020000000100020000000000FFFFFF00
      000000020000000000000000006E15000006004D656D6F313000020048000000
      340000006C010000100000000300000001000000000000000000FFFFFF1F2C02
      000000000001000C0028F3F7F0E5E6E4E5EDE8E52900000000FFFF0000000000
      0200000001000000010500417269616C00080000000000000000000200000001
      00020000000000FFFFFF0000000002000000000000000000FC15000006004D65
      6D6F313300020048000000670000006C01000010000000030000000100000000
      0000000000FFFFFF1F2C02000000000001000F0028EFEEE4F0E0E7E4E5EBE5ED
      E8E52900000000FFFF00000000000200000001000000010500417269616C0008
      000000000000000000020000000100020000000000FFFFFF0000000002000000
      0000000000009216000006004D656D6F39390002004800000043010000C50000
      00140000000300000001000000000000000000FFFFFF1F2C0200000000000100
      1700CFF0E5E4F1E5E4E0F2E5EBFC20EAEEECE8F1F1E8E83A2000000000FFFF00
      000000000200000001000000010500417269616C000C00000000000000000008
      000000CC00020000000000FFFFFF000000000200000000000000000022170000
      07004D656D6F313031000200480000005D010000C50000001400000003000000
      01000000000000000000FFFFFF1F2C02000000000001001000D7EBE5EDFB20EA
      EEECE8F1F1E8E83A2000000000FFFF0000000000020000000100000001050041
      7269616C000C00000000000000000008000000CC00020000000000FFFFFF0000
      000002000000000000000000B117000006004D656D6F34380002000D01000043
      010000D7010000140000000300020001000000000000000000FFFFFF1F2C0200
      00000000010010005B507265645D205B446F6C507265645D00000000FFFF0000
      0000000200000001000000020500417269616C000A0000000000000000000000
      0000CC00020000000000FFFFFF00000000020000000000000000004118000007
      004D656D6F3130350002000D0100005D010000D7010000140000000300020001
      000000000000000000FFFFFF1F2C020000000000010010005B4B6F6D315D205B
      446F6C4B6F6D315D00000000FFFF000000000002000000010000000205004172
      69616C000A00000000000000000000000000CC00020000000000FFFFFF000000
      0002000000000000000000D118000007004D656D6F3130320002000D01000072
      010000D7010000140000000300020001000000000000000000FFFFFF1F2C0200
      00000000010010005B4B6F6D325D205B446F6C4B6F6D325D00000000FFFF0000
      0000000200000001000000020500417269616C000A0000000000000000000000
      0000CC00020000000000FFFFFF00000000020000000000000000006119000007
      004D656D6F3135320002000D01000087010000D7010000140000000300020001
      000000000000000000FFFFFF1F2C020000000000010010005B4B6F6D335D205B
      446F6C4B6F6D335D00000000FFFF000000000002000000010000000205004172
      69616C000A00000000000000000000000000CC00020000000000FFFFFF000000
      0002000000000000000000F319000006004D656D6F3134000200480000002901
      0000C5000000140000000300000001000000000000000000FFFFFF1F2C020000
      00000001001300CAEEECE8F1F1E8FF20E220F1EEF1F2E0E2E53A00000000FFFF
      00000000000200000001000000010500417269616C000C000000000000000000
      000000000100020000000000FFFFFF0000000002000000000000000400421A00
      0005004C696E653100020048000000040400009C020000000000000100080002
      000000000000000000FFFFFF1F2C020000000000000000000000FFFF00000000
      000200000001000000040000351B000009006D6553706973616E6F0002004800
      0000F00100009C020000140000000B00000001000000000000000000FFFFFF1F
      2C020000000000010009005B53706973616E6F5D0004000500626567696E0D1A
      00202053706973616E6F203A3D2047455453504953414E4F28293B0D3B002020
      6966204C656E6774682853706973616E6F29203C2035207468656E204D617374
      657244617461342E76697369626C65203A3D2046616C73653B0D0300656E6400
      FFFF00000000000200000001000000040500417269616C000C00000000000000
      0000080000000100020000000000FFFFFF0000000002000000000000000000EC
      1B000005004D656D6F3400020048000000500300009C020000140000000B0000
      0001000000008000000000FFFFFF002C02000000000001000C005B5A616B6C4B
      6F6D5374725D0003000500626567696E0D1D0020205A616B6C4B6F6D53747220
      3A3D204765745A616B6C4B6F6D28293B0D0300656E6400FFFF00000000000200
      000001000000040500417269616C000C00000000000000000008000000010002
      0000000000FFFFFF00000000020000000000000000007F1C000006004D656D6F
      31370002004800000026030000C5000000140000000300000002000000000000
      000000FFFFFF1F2C02000000000001001400C7E0EAEBFEF7E5EDE8E520EAEEEC
      E8F1F1E8E83A00000000FFFF0000000000020000000100000001050041726961
      6C000C000000000000000000000000000100020000000000FFFFFF0000000002
      000000000000000000151D000006004D656D6F3138000200480000008E030000
      C5000000140000000300000001000000000000000000FFFFFF1F2C0200000000
      0001001700CFF0E5E4F1E5E4E0F2E5EBFC20EAEEECE8F1F1E8E83A2000000000
      FFFF00000000000200000001000000010500417269616C000C00000000000000
      000008000000CC00020000000000FFFFFF0000000002000000000000000000A4
      1D000006004D656D6F31390002000D0100008E030000D7010000140000000300
      020001000000000000000000FFFFFF1F2C020000000000010010005B50726564
      5D205B446F6C507265645D00000000FFFF000000000002000000010000000205
      00417269616C000A00000000000000000000000000CC00020000000000FFFFFF
      0000000002000000000000000000331E000006004D656D6F3230000200480000
      00A8030000C5000000140000000300000001000000000000000000FFFFFF1F2C
      02000000000001001000D7EBE5EDFB20EAEEECE8F1F1E8E83A2000000000FFFF
      00000000000200000001000000010500417269616C000C000000000000000000
      08000000CC00020000000000FFFFFF0000000002000000000000000000C21E00
      0006004D656D6F32330002000D010000D0030000D70100001400000003000200
      01000000000000000000FFFFFF1F2C020000000000010010005B4B6F6D335D20
      5B446F6C4B6F6D335D00000000FFFF0000000000020000000100000002050041
      7269616C000A00000000000000000000000000CC00020000000000FFFFFF0000
      000002000000000000000000481F000006004D656D6F32350002008402000008
      04000060000000140000000300000002000000000000000000FFFFFF1F2C0200
      00000000010007005B50414745235D00000000FFFF0000000000020000000100
      0000020500417269616C000A0000000000000000000900000001000200000000
      00FFFFFF00000000020000000000000000004E20000005004D656D6F31000200
      E801000006000000FC000000130000000300000001000000000000000000FFFF
      FF1F2C02000000000008000900D3D2C2C5D0C6C4C0DE0D00000D22005F5F5F5F
      5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F0D00
      000D00000D22005F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
      5F5F5F5F5F5F5F5F5F0D00000D2600225F5F5F2220205F5F5F5F5F5F5F5F5F5F
      5F5F5F5F5F5F5F5F5F5F5F20203230305F5F20E32E00000000FFFF0000000000
      0200000001000000020500417269616C000A0000000200000000000000000001
      00020000000000FFFFFF0000000002000000000000000000F320000006004D65
      6D6F3332000200E801000077000000FC00000013000000030000000100000000
      0000000000FFFFFF1F2C02000000000001002600225F5F5F2220205F5F5F5F5F
      5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F202032305F5F5F20E32E00000000FFFF
      00000000000200000001000000020500417269616C000A000000020000000000
      000000000100020000000000FFFFFF00000000020000000000000000008A2100
      0006004D656D6F3333000200E801000050000000FC0000001700000003000000
      01000000000000000000FFFFFF1F2C020000000000010018005F5F5FEA2EEC2E
      ED2E20D2E0F0E0F1E5EDEAEE20D12ED42E00000000FFFF000000000002000000
      01000000020500417269616C000A000000000000000000080000000100020000
      000000FFFFFF00000000020000000000000000000E22000006004D656D6F3334
      000200E801000066000000FC0000001000000003000800010000000000000000
      00FFFFFF1F2C0200000000000100050028D4C8CE2900000000FFFF0000000000
      0200000001000000020500417269616C00070000000200000000000200000001
      00020000000000FFFFFF0000000002000000000000000000A222000006004D65
      6D6F3331000200E80100001B000000FC00000011000000030002000100000000
      0000000000FFFFFF1F2C02000000000001001500C3EBE0E2EDFBE920E2F0E0F7
      20C1D32022CECAC12200000000FFFF0000000000020000000100000002050041
      7269616C000A000000000000000000100000000100020000000000FFFFFF0000
      0000020000000000000000002C23000006004D656D6F3135000200E801000040
      000000FC0000000C0000000300000001000000000000000000FFFFFF1F2C0200
      0000000001000B0028E4EEEBE6EDEEF1F2FC2900000000FFFF00000000000200
      000001000000020500417269616C000700000002000000000002000000010002
      0000000000FFFFFF0000000002000000000000000000C423000006004D656D6F
      3335000200E80100002D000000FC000000130000000300020001000000000000
      000000FFFFFF1F2C02000000000001001900D2F0E0E2ECE0F2EEEBEEE3E8F7E5
      F1EAE8E920F6E5EDF2F02200000000FFFF000000000002000000010000000205
      00417269616C000A000000000000000000100000000100020000000000FFFFFF
      00000000020000000000000000005124000006004D656D6F3336000200490000
      00F80200006C000000140000000300000001000000000000000000FFFFFF1F2C
      02000000000001000E00C7E0E22EEEF2E4E5EBE5EDE8E5EC00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000100
      0000CC00020000000000FFFFFF0000000002000000000000000000DA24000008
      006D655A61764F7464000200B5000000F8020000D00000001400000003000200
      01000000000000000000FFFFFF1F2C020000000000010008005B5A61764F7464
      5D00000000FFFF00000000000200000001000000000500417269616C000A0000
      0000000000000000000000CC00020000000000FFFFFF00000000020000000000
      000000006525000006004D656D6F3338000200490000000D0300006C00000014
      0000000300000001000000000000000000FFFFFF1F2C02000000000001000C00
      D1F22EECE5E4F1E5F1F2F0E000000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000001000000CC00020000000000FFFF
      FF0000000002000000000000000000E825000005006D65534D53000200B50000
      000D030000D0000000140000000300020001000000000000000000FFFFFF1F2C
      020000000000010005005B534D535D00000000FFFF0000000000020000000100
      0000000500417269616C000A00000000000000000000000000CC000200000000
      00FFFFFF00000000020000000000000000009A26000006004D656D6F33370002
      0049000000B402000062010000140000000200000001000000000000000000FF
      FFFF1F2C02000000000001003300C2F1E5E3EE20EFEE20EDE0F1F2EEFFF9E5EC
      F320E0EAF2F320F1EFE8F1E0EDEE20EDE0E8ECE5EDEEE2E0EDE8FF282DE8E929
      3A00000000FFFF00000000000200000001000000000500417269616C000A0000
      00000000000000000000000100020000000000FFFFFF00000000020000000000
      000000002627000006004D656D6F3339000200AB010000B40200003A01000014
      0000000300000001000000000000000000FFFFFF1F2C02000000000001000D00
      5B46435F4E41494D5F4B4F4C5D00000000FFFF00000000000200000001000000
      000500417269616C000A000000040000000000000000000100020000000000FF
      FFFF0000000002000000000000000000B627000006004D656D6F393500020091
      000000D402000054020000140000000300000001000000000000000000FFFFFF
      1F2C020000000000010011005B4D4F4E45595354522873756D6D295D20000000
      00FFFF00000000000200000001000000000500417269616C000A000000040000
      00000000000000CC00020000000000FFFFFF0000000002000000000000000000
      3E28000006004D656D6F313600020049000000D4020000480000001400000003
      00000001000000000000000000FFFFFF1F2C02000000000001000900EDE020F1
      F3ECECF32000000000FFFF00000000000200000001000000000500417269616C
      000A00000000000000000001000000CC00020000000000FFFFFF000000000200
      0000000000000000CD28000006004D656D6F32310002000D010000A8030000D7
      010000140000000300020001000000000000000000FFFFFF1F2C020000000000
      010010005B4B6F6D315D205B446F6C4B6F6D315D00000000FFFF000000000002
      00000001000000020500417269616C000A00000000000000000000000000CC00
      020000000000FFFFFF00000000020000000000000000005C29000006004D656D
      6F32320002000D010000BC030000D70100001400000003000200010000000000
      00000000FFFFFF1F2C020000000000010010005B4B6F6D325D205B446F6C4B6F
      6D325D00000000FFFF00000000000200000001000000020500417269616C000A
      00000000000000000000000000CC00020000000000FFFFFF0000000002000000
      000000000000E929000006004D656D6F34300002007E0100001E0200003E0000
      003200000003000F0002000000000000000000FFFFFF1F2C0200000000000100
      0E00CDEEECE5EDEAEB2E20EDEEECE5F000000000FFFF00000000000200000001
      000000000500417269616C000A0000000000000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000892A000006004D656D6F343100
      02007E010000600200003E0000001600000003000F0001000000000000000000
      FFFFFF1F2C020000000000010021005B6F647341637453706973526570496E50
      6572696F642E224D454449434944225D00000000FFFF00000000000200000001
      000000000500417269616C000A0000000000000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000282B000006004D656D6F343200
      020048000000C40000009C020000210000000300000001000000000000000000
      FFFFFF1F2C020000000000010020005B6F647341637453706973526570496E50
      6572696F642E2246435F444F43225D00000000FFFF0000000000020000000100
      0000040500417269616C00100000000200000000000A000000CC000200000000
      00FFFFFF0000000002000000000000000000F52B000006004D656D6F34330002
      00480000000F0100009C020000150000000300000001000000000000000000FF
      FFFF1F2C02000000000001004E00C7E020EFE5F0E8EEE420F1205B6F64734163
      7453706973526570496E506572696F642E224441544531225D20EFEE205B6F64
      7341637453706973526570496E506572696F642E224441544532225D00000000
      FFFF00000000000200000001000000040500417269616C000C00000002000000
      00000A000000CC00020000000000FFFFFF000000000200000000000000FEFEFF
      030000000A002043617465676F72793100000000040073756D6D000100300007
      0073747273756D6D000000000000000000000000FC0000000000000000000000
      000000000058000ACF5E302ED2E24068B3C395D66DE440}
  end
  object frDBdsActSpisRepInPeriod: TfrDBDataSet
    DataSet = odsActSpisRepInPeriod
    Left = 451
    Top = 395
  end
  object pmPrintTrebNakl: TPopupMenu
    Left = 528
    Top = 56
    object N29: TMenuItem
      Action = acPrnInvoice
      Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077
    end
    object miPrintTrebWithDetail: TMenuItem
      Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1089#1087#1080#1088#1090#1072
      OnClick = miPrintTrebWithDetailClick
    end
    object miShortForm: TMenuItem
      Action = ActTrebNaklShort
    end
    object N31: TMenuItem
      Action = acPrnNarcoticAct
    end
  end
  object frxM15: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39388.589793113400000000
    ReportOptions.LastChange = 41124.665973958300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      
        'procedure Memo68OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1099#39', '#39#1050#1086 +
        #1084#1091':'#39', s);'
      '  Modified := True;'
      'end;'
      ''
      
        'procedure Memo70OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1099#39', '#39#1063#1077 +
        #1088#1077#1079' '#1082#1086#1075#1086':'#39', s);'
      '  Modified := True;'
      'end;'
      ''
      
        'procedure Memo124OnPreviewClick(Sender: TfrxView; Button: TMouse' +
        'Button; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1054#1090#1087#1091#1089#1082' '#1088#1072#1079#1088#1077#1096#1080#1083#39', '#39#1044#1086#1083#1078 +
        #1085#1086#1089#1090#1100':'#39', s);'
      '  Modified := True;'
      'end;'
      ''
      
        'procedure Memo126OnPreviewClick(Sender: TfrxView; Button: TMouse' +
        'Button; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1054#1090#1087#1091#1089#1082' '#1088#1072#1079#1088#1077#1096#1080#1083#39', '#39#1056#1072#1089#1096 +
        #1080#1092#1088#1086#1074#1082#1072' '#1087#1086#1076#1087#1080#1089#1080':'#39', s);'
      '  Modified := True;'
      'end;'
      ''
      
        'procedure Memo130OnPreviewClick(Sender: TfrxView; Button: TMouse' +
        'Button; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1054#1090#1087#1091#1089#1090#1080#1083#39', '#39#1044#1086#1083#1078#1085#1086#1089#1090#1100':'#39 +
        ', s);'
      '  Modified := True;'
      'end;'
      ''
      
        'procedure Memo132OnPreviewClick(Sender: TfrxView; Button: TMouse' +
        'Button; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1054#1090#1087#1091#1089#1090#1080#1083#39', '#39#1056#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072 +
        ' '#1087#1086#1076#1087#1080#1089#1080':'#39', s);'
      '  Modified := True;'
      'end;'
      ''
      
        'procedure Memo140OnPreviewClick(Sender: TfrxView; Button: TMouse' +
        'Button; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1043#1083#1072#1074#1085#1099#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#39', '#39#1056#1072 +
        #1089#1096#1080#1092#1088#1086#1074#1082#1072' '#1087#1086#1076#1087#1080#1089#1080':'#39', s);'
      '  Modified := True;'
      'end;'
      ''
      
        'procedure Memo146OnPreviewClick(Sender: TfrxView; Button: TMouse' +
        'Button; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1055#1086#1083#1091#1095#1080#1083#39', '#39#1056#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072' ' +
        #1087#1086#1076#1087#1080#1089#1080':'#39', s);'
      '  Modified := True;   '
      'end;'
      ''
      
        'procedure Memo144OnPreviewClick(Sender: TfrxView; Button: TMouse' +
        'Button; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1055#1086#1083#1091#1095#1080#1083#39', '#39#1044#1086#1083#1078#1085#1086#1089#1090#1100':'#39',' +
        ' s);'
      '  Modified := True;'
      'end;         '
      ''
      
        'procedure Memo66OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1076#1072#1085#1085#1099#1077#39', '#39#1054#1089#1085#1086#1074 +
        #1072#1085#1080#1077':'#39', s);'
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
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1099#39', '#39#1054#1088 +
        #1075#1072#1085#1080#1079#1072#1094#1080#1103':'#39', s);'
      '  Modified := True;'
      'end;'
      ''
      'begin'
      '  '
      'end.')
    OnClickObject = frxReturnPostavClickObject
    OnGetValue = frxReturnPostavGetValue
    OnUserFunction = frxReturnPostavUserFunction
    Left = 526
    Top = 156
    Datasets = <
      item
        DataSet = frxDBdsSelDocMove
        DataSetName = 'frxDBdsSelDocMove'
      end
      item
        DataSet = frxDBodsKart
        DataSetName = 'frxDBodsKart'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page2: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 306.141930000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo36: TfrxMemoView
          Left = 944.882500000000000000
          Top = 94.488250000000000000
          Width = 102.047310000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 706.772110000000000000
          Width = 340.157700000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1118#1056#1105#1056#1111#1056#1109#1056#1030#1056#176#1057#1039' '#1056#1112#1056#181#1056#182#1056#1109#1057#8218#1057#1026#1056#176#1057#1027#1056#187#1056#181#1056#1030#1056#176#1057#1039' '#1057#8222#1056#1109#1057#1026#1056#1112#1056#176' '#1074#8222#8211' '#1056#1114'-15'
            
              #1056#1032#1057#8218#1056#1030#1056#181#1057#1026#1056#182#1056#1169#1056#181#1056#1029#1056#176' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1056#1029#1056#1109#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1056#181#1056#1112' '#1056#8220#1056#1109#1057#1027#1056#1108#1056#1109#1056#1112#1057#1027 +
              #1057#8218#1056#176#1057#8218#1056#176' '#1056#160#1056#1109#1057#1027#1057#1027#1056#1105#1056#1105
            #1056#1109#1057#8218' 30.10.97 '#1074#8222#8211'71'#1056#176)
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Align = baWidth
          Top = 45.354360000000000000
          Width = 944.882500000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1116#1056#1106#1056#1113#1056#8250#1056#1106#1056#8221#1056#1116#1056#1106#1056#1031' '#1074#8222#8211' [frxDBdsSelDocMove."FC_DOC"]  '#1056#1109#1057#8218'  [frxD' +
              'BdsSelDocMove."DATA"] '#1056#1110'.'
            #1056#1029#1056#176' '#1056#1109#1057#8218#1056#1111#1057#1107#1057#1027#1056#1108' '#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1056#1109#1056#1030' '#1056#1029#1056#176' '#1057#1027#1057#8218#1056#1109#1057#1026#1056#1109#1056#1029#1057#1107)
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Top = 113.385826770000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1115#1057#1026#1056#1110#1056#176#1056#1029#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 102.047310000000000000
          Top = 113.385826770000000000
          Width = 767.244590000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo23OnPreviewClick'
          ShowHint = False
          StretchMode = smActualHeight
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[var_rekviziti]')
          ParentFont = False
          Underlines = True
        end
        object Memo24: TfrxMemoView
          Left = 944.882500000000000000
          Top = 75.590600000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169#1057#8249)
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 944.882500000000000000
          Top = 94.488250000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '0315007')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 823.937540000000000000
          Top = 94.488250000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#164#1056#1109#1057#1026#1056#1112#1056#176' '#1056#1111#1056#1109' '#1056#1115#1056#1113#1056#1032#1056#8221)
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 869.291900000000000000
          Top = 113.385900000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1111#1056#1109' '#1056#1115#1056#1113#1056#1119#1056#1115)
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 763.465060000000000000
          Top = 154.960730000000000000
          Width = 283.464566930000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1056#8470' '#1056#183#1056#176' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1108#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 574.488560000000000000
          Top = 154.960730000000000000
          Width = 188.976353540000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 385.512060000000000000
          Top = 154.960730000000000000
          Width = 188.976353540000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1026#1056#176#1056#1030#1056#1105#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 574.488560000000000000
          Top = 170.078850000000000000
          Width = 94.488188980000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026#1057#1107#1056#1108#1057#8218#1057#1107#1057#1026#1056#1029#1056#1109#1056#181' '#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 668.976810000000000000
          Top = 170.078850000000000000
          Width = 94.488188980000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1030#1056#1105#1056#1169' '#1056#1169#1056#181#1057#1039#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 385.512060000000000000
          Top = 170.078850000000000000
          Width = 94.488188980000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026#1057#1107#1056#1108#1057#8218#1057#1107#1057#1026#1056#1029#1056#1109#1056#181' '#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 480.000310000000000000
          Top = 170.078850000000000000
          Width = 94.488188980000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1030#1056#1105#1056#1169' '#1056#1169#1056#181#1057#1039#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 763.465060000000000000
          Top = 170.078850000000000000
          Width = 94.488188980000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026#1057#1107#1056#1108#1057#8218#1057#1107#1057#1026#1056#1029#1056#1109#1056#181' '#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 857.953310000000000000
          Top = 170.078850000000000000
          Width = 94.488188980000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1030#1056#1105#1056#1169' '#1056#1169#1056#181#1057#1039#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 952.441560000000000000
          Top = 170.078850000000000000
          Width = 94.488188980000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1169' '#1056#1105#1057#1027#1056#1111#1056#1109#1056#187#1056#1029#1056#1105#1057#8218#1056#181#1056#187#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 574.488560000000000000
          Top = 200.315090000000000000
          Width = 94.488188980000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 668.976810000000000000
          Top = 200.315090000000000000
          Width = 94.488188980000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 385.512060000000000000
          Top = 200.315090000000000000
          Width = 94.488188980000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1106#1056#1111#1057#8218#1056#181#1056#1108#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 480.000310000000000000
          Top = 200.315090000000000000
          Width = 94.488188980000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 763.465060000000000000
          Top = 200.315090000000000000
          Width = 94.488188980000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 857.953310000000000000
          Top = 200.315090000000000000
          Width = 94.488188980000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 952.441560000000000000
          Top = 200.315090000000000000
          Width = 94.488188980000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 309.921460000000000000
          Top = 154.960730000000000000
          Width = 75.590551180000000000
          Height = 45.354330710000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169
            #1056#1030#1056#1105#1056#1169#1056#176
            #1056#1109#1056#1111#1056#181#1057#1026#1056#176#1057#8224#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 234.330860000000000000
          Top = 154.960730000000000000
          Width = 75.590551180000000000
          Height = 45.354330710000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 309.921460000000000000
          Top = 200.315090000000000000
          Width = 75.590551180000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 234.330860000000000000
          Top = 200.315090000000000000
          Width = 75.590551180000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[DATE]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 249.448980000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1115#1057#1027#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 86.929190000000000000
          Top = 249.448980000000000000
          Width = 960.000620000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo66OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[frxDBdsSelDocMove."FC_RASHPRICHINA"] [frxDBdsSelDocMove."FC_COM' +
              'MENT"]')
          ParentFont = False
          Underlines = True
        end
        object Memo67: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 287.244280000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1112#1057#1107)
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 41.574830000000000000
          Top = 287.244280000000000000
          Width = 600.945270000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo68OnPreviewClick'
          ShowHint = False
          StretchMode = smActualHeight
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Underlines = True
        end
        object Memo69: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 642.520100000000000000
          Top = 287.244280000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#167#1056#181#1057#1026#1056#181#1056#183' '#1056#1108#1056#1109#1056#1110#1056#1109)
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 721.890230000000000000
          Top = 287.244280000000000000
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo70OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Underlines = True
        end
      end
      object Header2: TfrxHeader
        Height = 86.929190000000000000
        Top = 385.512060000000000000
        Width = 1046.929810000000000000
        ReprintOnNewPage = True
        object Memo71: TfrxMemoView
          Top = 11.338590000000000000
          Width = 151.181200000000000000
          Height = 60.472440940000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1057#1026#1057#1026#1056#181#1057#1027#1056#1111#1056#1109#1056#1029#1056#1169#1056#1105#1057#1026#1057#1107#1057#1035#1057#8240#1056#1105#1056#8470' '#1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 151.181200000000000000
          Top = 11.338590000000000000
          Width = 226.771800000000000000
          Height = 60.472440940000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1056#181' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 377.953000000000000000
          Top = 11.338590000000000000
          Width = 120.944960000000000000
          Height = 60.472440940000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169#1056#1105#1056#1029#1056#1105#1057#8224#1056#176' '#1056#1105#1056#183#1056#1112#1056#181#1057#1026#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 498.897960000000000000
          Top = 11.338590000000000000
          Width = 102.047310000000000000
          Height = 60.472440940000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Left = 600.945270000000000000
          Top = 11.338590000000000000
          Width = 60.472480000000000000
          Height = 60.472440940000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176
            #1057#1026#1057#1107#1056#177'. '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 661.417750000000000000
          Top = 11.338590000000000000
          Width = 68.031540000000000000
          Height = 60.472440940000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1056#177#1056#181#1056#183' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176' '#1056#1116#1056#8221#1056#1038','
            #1057#1026#1057#1107#1056#177'. '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          Left = 729.449290000000000000
          Top = 11.338590000000000000
          Width = 64.252010000000000000
          Height = 60.472440940000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1056#1116#1056#8221#1056#1038','
            #1057#1026#1057#1107#1056#177'. '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          Left = 793.701300000000000000
          Top = 11.338590000000000000
          Width = 68.031540000000000000
          Height = 60.472440940000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1057#1027' '#1057#1107#1057#8225#1056#181#1057#8218#1056#1109#1056#1112' '#1056#1116#1056#8221#1056#1038','
            #1057#1026#1057#1107#1056#177'. '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 861.732840000000000000
          Top = 11.338590000000000000
          Width = 102.047310000000000000
          Height = 60.472440940000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 963.780150000000000000
          Top = 11.338590000000000000
          Width = 83.149660000000000000
          Height = 60.472440940000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1119#1056#1109#1057#1026#1057#1039#1056#1169#1056#1108#1056#1109#1056#1030#1057#8249#1056#8470' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026' '#1056#183#1056#176#1056#1111#1056#1105#1057#1027#1056#1105' '#1056#1111#1056#1109' '#1057#1027#1056#1108#1056#187#1056#176#1056#1169#1057#1027#1056#1108 +
              #1056#1109#1056#8470' '#1056#1108#1056#176#1057#1026#1057#8218#1056#1109#1057#8218#1056#181#1056#1108#1056#181)
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Top = 26.456700240000000000
          Width = 75.590600000000000000
          Height = 45.354330710000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8225#1056#181#1057#8218', '#1057#1027#1057#1107#1056#177#1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Left = 75.590600000000000000
          Top = 26.456700240000000000
          Width = 75.590600000000000000
          Height = 45.354330710000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1169' '#1056#176#1056#1029#1056#176#1056#187#1056#1105'-'
            #1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          Left = 313.700990000000000000
          Top = 26.456710000000000000
          Width = 64.252010000000000000
          Height = 45.354330710000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#1109#1056#1112#1056#181#1056#1029#1056#1108#1056#187#1056#176'-'
            #1057#8218#1057#1107#1057#1026#1056#1029#1057#8249#1056#8470' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Left = 151.181200000000000000
          Top = 26.456710000000000000
          Width = 162.519790000000000000
          Height = 45.354330710000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181', '#1057#1027#1056#1109#1057#1026#1057#8218', '#1056#1112#1056#176#1057#1026#1056#1108#1056#176', '#1057#1026#1056#176#1056#183#1056#1112#1056#181#1057#1026)
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          Left = 377.953000000000000000
          Top = 26.456710000000000000
          Width = 37.795300000000000000
          Height = 45.354330710000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1169)
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          Left = 415.748300000000000000
          Top = 26.456710000000000000
          Width = 83.149660000000000000
          Height = 45.354330710000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181'-'
            #1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          Left = 498.897960000000000000
          Top = 26.456710000000000000
          Width = 60.472480000000000000
          Height = 45.354330710000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1169#1056#187#1056#181#1056#182#1056#1105#1057#8218' '#1056#1109#1057#8218#1056#1111#1057#1107#1057#1027#1057#8218#1056#1105#1057#8218#1057#1034)
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          Left = 559.370440000000000000
          Top = 26.456710000000000000
          Width = 41.574830000000000000
          Height = 45.354330710000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1109#1057#8218#1056#1111#1057#1107'-'
            #1057#8240#1056#181#1056#1029#1056#1109)
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          Left = 861.732840000000000000
          Top = 26.456710000000000000
          Width = 52.913420000000000000
          Height = 45.354330710000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026'-'#1056#1029#1057#8249#1056#8470)
          ParentFont = False
        end
        object Memo91: TfrxMemoView
          Left = 914.646260000000000000
          Top = 26.456710000000000000
          Width = 49.133890000000000000
          Height = 45.354330710000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#176#1057#1027#1056#1111#1056#1109#1057#1026#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo89: TfrxMemoView
          Top = 71.811070000000000000
          Width = 75.590600000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '1')
          ParentFont = False
        end
        object Memo92: TfrxMemoView
          Left = 75.590600000000000000
          Top = 71.811070000000000000
          Width = 75.590600000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '2')
          ParentFont = False
        end
        object Memo93: TfrxMemoView
          Left = 151.181200000000000000
          Top = 71.811070000000000000
          Width = 162.519790000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '3')
          ParentFont = False
        end
        object Memo94: TfrxMemoView
          Left = 313.700990000000000000
          Top = 71.811070000000000000
          Width = 64.252010000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '4')
          ParentFont = False
        end
        object Memo95: TfrxMemoView
          Left = 377.953000000000000000
          Top = 71.811070000000000000
          Width = 37.795300000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '5')
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          Left = 415.748300000000000000
          Top = 71.811070000000000000
          Width = 83.149660000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '6')
          ParentFont = False
        end
        object Memo97: TfrxMemoView
          Left = 498.897960000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '7')
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          Left = 559.370440000000000000
          Top = 71.811070000000000000
          Width = 41.574830000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '8')
          ParentFont = False
        end
        object Memo99: TfrxMemoView
          Left = 600.945270000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '9')
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          Left = 661.417750000000000000
          Top = 71.811070000000000000
          Width = 68.031540000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '10')
          ParentFont = False
        end
        object Memo101: TfrxMemoView
          Left = 729.449290000000000000
          Top = 71.811070000000000000
          Width = 64.252010000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '11')
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Left = 793.701300000000000000
          Top = 71.811070000000000000
          Width = 68.031540000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '12')
          ParentFont = False
        end
        object Memo103: TfrxMemoView
          Left = 861.732840000000000000
          Top = 71.811070000000000000
          Width = 52.913420000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '13')
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Left = 914.646260000000000000
          Top = 71.811070000000000000
          Width = 49.133890000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '14')
          ParentFont = False
        end
        object Memo105: TfrxMemoView
          Left = 963.780150000000000000
          Top = 71.811070000000000000
          Width = 83.149660000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '15')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Top = 71.811070000000000000
          Width = 151.181200000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 313.700990000000000000
          Top = 71.811070000000000000
          Width = 102.047310000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 559.370440000000000000
          Top = 71.811070000000000000
          Width = 404.409710000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
        end
      end
      object MasterData7: TfrxMasterData
        Height = 15.118120000000000000
        Top = 495.118430000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBodsKart
        DataSetName = 'frxDBodsKart'
        RowCount = 0
        Stretched = True
        object Memo6: TfrxMemoView
          Left = 559.370440000000000000
          Width = 404.409710000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 2.000000000000000000
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 313.700990000000000000
          Width = 102.047310000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 2.000000000000000000
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Width = 151.181200000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 2.000000000000000000
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          OnBeforePrint = 'Memo106OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          Left = 75.590600000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 151.181200000000000000
          Width = 162.519790000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBodsKart."NAMEKART"]')
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Left = 313.700990000000000000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo110: TfrxMemoView
          Left = 377.953000000000000000
          Width = 37.795300000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          Left = 415.748300000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBodsKart."FC_EDIZM"]')
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 498.897960000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBodsKart."FN_KOL"]')
          ParentFont = False
        end
        object Memo113: TfrxMemoView
          Left = 559.370440000000000000
          Width = 41.574830000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBodsKart."FN_KOL"]')
          ParentFont = False
        end
        object Memo114: TfrxMemoView
          Left = 600.945270000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBodsKart."FN_PRICE"]')
          ParentFont = False
        end
        object Memo115: TfrxMemoView
          Left = 661.417750000000000000
          Width = 68.031540000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo116: TfrxMemoView
          Left = 729.449290000000000000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo117: TfrxMemoView
          Left = 793.701300000000000000
          Width = 68.031540000000000000
          Height = 15.118110240000000000
          OnBeforePrint = 'Memo117OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBodsKart."SUMM"]')
          ParentFont = False
        end
        object Memo118: TfrxMemoView
          Left = 861.732840000000000000
          Width = 52.913420000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo119: TfrxMemoView
          Left = 914.646260000000000000
          Width = 49.133890000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo120: TfrxMemoView
          Left = 963.780150000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
      end
      object Footer2: TfrxFooter
        Height = 136.063080000000000000
        Top = 532.913730000000000000
        Width = 1046.929810000000000000
        object Memo121: TfrxMemoView
          Align = baWidth
          Top = 15.118120000000000000
          Width = 1046.929810000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1109#1057#8218#1056#1111#1057#1107#1057#8240#1056#181#1056#1029#1056#1109' [GET_NAIM_KOL(<COUNT(MasterData7)>, ' +
              '2)] '#1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039'(-'#1056#1105#1056#8470')'
            
              #1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' [MONEYSTR(<SUM(<frxDBodsKart."SUMM">,MasterData7' +
              ')>)]')
          ParentFont = False
        end
        object Memo122: TfrxMemoView
          Top = 71.811070000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1107#1057#1027#1056#1108' '#1057#1026#1056#176#1056#183#1057#1026#1056#181#1057#8364#1056#1105#1056#187)
          ParentFont = False
        end
        object Memo123: TfrxMemoView
          Top = 109.606370000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1107#1057#1027#1057#8218#1056#1105#1056#187)
          ParentFont = False
        end
        object Memo124: TfrxMemoView
          Left = 128.504020000000000000
          Top = 71.811070000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo124OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          ParentFont = False
          Underlines = True
        end
        object Memo125: TfrxMemoView
          Left = 260.787570000000000000
          Top = 71.811070000000000000
          Width = 120.944881890000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          ParentFont = False
          Underlines = True
        end
        object Memo126: TfrxMemoView
          Left = 385.512060000000000000
          Top = 71.811070000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo126OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          ParentFont = False
          Underlines = True
        end
        object Memo127: TfrxMemoView
          Left = 128.504020000000000000
          Top = 86.929190000000000000
          Width = 128.504020000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034)
          ParentFont = False
        end
        object Memo128: TfrxMemoView
          Left = 260.787570000000000000
          Top = 86.929190000000000000
          Width = 120.944881890000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo129: TfrxMemoView
          Left = 385.512060000000000000
          Top = 86.929190000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105)
          ParentFont = False
        end
        object Memo130: TfrxMemoView
          Left = 128.504020000000000000
          Top = 109.606370000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo130OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          ParentFont = False
          Underlines = True
        end
        object Memo131: TfrxMemoView
          Left = 260.787570000000000000
          Top = 109.606370000000000000
          Width = 120.944881890000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          ParentFont = False
          Underlines = True
        end
        object Memo132: TfrxMemoView
          Left = 385.512060000000000000
          Top = 109.606370000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo132OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          ParentFont = False
          Underlines = True
        end
        object Memo133: TfrxMemoView
          Left = 128.504020000000000000
          Top = 124.724490000000000000
          Width = 128.504020000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034)
          ParentFont = False
        end
        object Memo134: TfrxMemoView
          Left = 260.787570000000000000
          Top = 124.724490000000000000
          Width = 120.944881890000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo135: TfrxMemoView
          Left = 385.512060000000000000
          Top = 124.724490000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105)
          ParentFont = False
        end
        object Memo136: TfrxMemoView
          Left = 589.606680000000000000
          Top = 71.811070000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8220#1056#187#1056#176#1056#1030#1056#1029#1057#8249#1056#8470' '#1056#177#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026)
          ParentFont = False
        end
        object Memo137: TfrxMemoView
          Left = 589.606680000000000000
          Top = 109.606370000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#1105#1056#187)
          ParentFont = False
        end
        object Memo139: TfrxMemoView
          Left = 789.921770000000000000
          Top = 71.811070000000000000
          Width = 120.944881890000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          ParentFont = False
          Underlines = True
        end
        object Memo140: TfrxMemoView
          Left = 914.646260000000000000
          Top = 71.811070000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo140OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          ParentFont = False
          Underlines = True
        end
        object Memo142: TfrxMemoView
          Left = 789.921770000000000000
          Top = 86.929190000000000000
          Width = 120.944881890000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo143: TfrxMemoView
          Left = 914.646260000000000000
          Top = 86.929190000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105)
          ParentFont = False
        end
        object Memo144: TfrxMemoView
          Left = 657.638220000000000000
          Top = 109.606370000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo144OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          ParentFont = False
          Underlines = True
        end
        object Memo145: TfrxMemoView
          Left = 789.921770000000000000
          Top = 109.606370000000000000
          Width = 120.944881890000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          ParentFont = False
          Underlines = True
        end
        object Memo146: TfrxMemoView
          Left = 914.646260000000000000
          Top = 109.606370000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo146OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          ParentFont = False
          Underlines = True
        end
        object Memo147: TfrxMemoView
          Left = 657.638220000000000000
          Top = 124.724490000000000000
          Width = 128.504020000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034)
          ParentFont = False
        end
        object Memo148: TfrxMemoView
          Left = 789.921770000000000000
          Top = 124.724490000000000000
          Width = 120.944881890000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo149: TfrxMemoView
          Left = 914.646260000000000000
          Top = 124.724490000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 559.370440000000000000
          Width = 404.409710000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 313.700990000000000000
          Width = 102.047310000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Width = 151.181200000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          ParentFont = False
        end
      end
    end
  end
  object pmPrintM15: TPopupMenu
    Left = 896
    Top = 224
    object N30: TMenuItem
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090
      OnClick = tbuPrintClick
    end
    object miPrintM15: TMenuItem
      Caption = #1060#1086#1088#1084#1072' '#1052'-15'
      OnClick = miPrintM15Click
    end
  end
  object pmPrintActSpis: TPopupMenu
    Left = 272
    Top = 56
    object miActSpis_var1: TMenuItem
      Caption = #1040#1082#1090' '#1089#1087#1080#1089#1072#1085#1080#1103' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074
      ImageIndex = 32
      OnClick = miActSpis_var1Click
    end
    object miActSpis_var2: TMenuItem
      Tag = 1
      Caption = #1040#1082#1090' '#1089#1087#1080#1089#1072#1085#1080#1103' '#1088#1072#1089#1093#1086#1076#1085#1099#1093' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      OnClick = miActSpis_var1Click
    end
    object miActSpis_var3: TMenuItem
      Caption = #1040#1082#1090' '#1089#1087#1080#1089#1072#1085#1080#1103' '#1087#1086' '#1091#1095#1077#1090#1085#1099#1084' '#1075#1088#1091#1087#1087#1072#1084
      OnClick = miActSpis_var3ClickStart
    end
  end
  object frxActSpis: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41218.504420150500000000
    ReportOptions.LastChange = 41218.639109907410000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  cnt: integer;'
      '          '
      'begin'
      '  cnt:=0;'
      
        '  MasterData9.Visible := Length(<frxdsActSpisRep."SpisDescr">) >' +
        ' 5;      '
      
        '  MasterData4.Visible := Length(<Spisano>) > 5;                 ' +
        '                                                       '
      'end.')
    OnClickObject = frxActSpisClickObject
    OnGetValue = frxActSpisGetValue
    OnMouseOverObject = frxActSpisMouseOverObject
    OnUserFunction = frxActSpisUserFunction
    Left = 256
    Top = 180
    Datasets = <
      item
        DataSet = frxDBdsSelDocMove
        DataSetName = 'frxDBdsSelDocMove'
      end
      item
        DataSet = frxdsActSpisRep
        DataSetName = 'frxdsActSpisRep'
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
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 188.976500000000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        Stretched = True
        object Memo2: TfrxMemoView
          Width = 396.850650000000000000
          Height = 41.574830000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsActSpisRep."LOK"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          Top = 41.574830000000000000
          Width = 396.850650000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1056#181')')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 60.472480000000000000
          Width = 396.850650000000000000
          Height = 30.236240000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsSelDocMove."fc_mogroupid_from"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo5: TfrxMemoView
          Top = 90.708720000000000000
          Width = 396.850650000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181')')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 415.748300000000000000
          Width = 264.567100000000000000
          Height = 132.283550000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1032#1056#1118#1056#8217#1056#8226#1056#160#1056#8211#1056#8221#1056#1106#1056#174
            ''
            '__________________________________'
            ''
            ''
            '__________________________________'
            ''
            '"___"  _____________________  20___ '#1056#1110'.')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 109.606370000000000000
          Width = 321.260050000000000000
          Height = 22.677180000000000000
          Visible = False
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsActSpisRep."NAMEFROM"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo8: TfrxMemoView
          Align = baWidth
          Top = 132.283550000000000000
          Width = 680.315400000000000000
          Height = 56.692950000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsSelDocMove."FC_DOCMIX"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677165350000000000
        Top = 710.551640000000000000
        Width = 680.315400000000000000
        DataSet = frxdsActSpisRep
        DataSetName = 'frxdsActSpisRep'
        RowCount = 0
        Stretched = True
        object Memo27: TfrxMemoView
          Width = 30.236240000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 30.236240000000000000
          Width = 328.819110000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxdsActSpisRep."NAMEMEDIC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 359.055350000000000000
          Width = 75.590600000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsActSpisRep."EINAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 434.645950000000000000
          Width = 75.590600000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsActSpisRep."fn_price"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 510.236550000000000000
          Width = 56.692950000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsActSpisRep."FN_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 566.929500000000000000
          Width = 113.385900000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsActSpisRep."SUMM"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 26.456710000000000000
        Top = 1092.284170000000000000
        Width = 680.315400000000000000
        object Memo1: TfrxMemoView
          Align = baRight
          Left = 566.929500000000000000
          Top = 3.779530000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
        end
        object Memo47: TfrxMemoView
          Width = 680.315400000000000000
          Height = 3.779530000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Height = 136.063080000000000000
        Top = 381.732530000000000000
        Width = 680.315400000000000000
        RowCount = 1
        object Memo12: TfrxMemoView
          Top = 15.118120000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1057#1039' '#1056#1030' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#181':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Top = 41.574830000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Top = 68.031540000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#167#1056#187#1056#181#1056#1029#1057#8249' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 207.874150000000000000
          Top = 41.574830000000000000
          Width = 472.441250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Pred] [DolPred]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 207.874150000000000000
          Top = 68.031540000000000000
          Width = 472.441250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom1] [DolKom1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 207.874150000000000000
          Top = 90.708720000000000000
          Width = 472.441250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom2] [DolKom2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 207.874150000000000000
          Top = 113.385900000000000000
          Width = 472.441250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom3] [DolKom3]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData3: TfrxMasterData
        Height = 41.574830000000000000
        Top = 540.472790000000000000
        Width = 680.315400000000000000
        RowCount = 1
        Stretched = True
        object Memo19: TfrxMemoView
          Align = baWidth
          Width = 680.315400000000000000
          Height = 41.574830000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#183#1056#1029#1056#176#1057#8225#1056#181#1056#1029#1056#176' '#1056#1111#1057#1026#1056#1105#1056#1108#1056#176#1056#183#1056#1109#1056#1112' [Prikaz]'
            
              'c'#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1105#1056#187#1056#1105' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#1105#1056#8470' '#1056#176#1056#1108#1057#8218'  '#1056#1030' '#1057#8218#1056#1109#1056#1112', '#1057#8225#1057#8218#1056#1109' '#1056 +
              #1111#1056#1109' '#1057#1107#1056#1108#1056#176#1056#183#1056#176#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1111#1057#1026#1056#1105#1057#8225#1056#1105#1056#1029#1056#181' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1109' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056 +
              #176#1056#1112#1056#181#1056#1029#1057#8218#1056#1109#1056#1030':')
          ParentFont = False
        end
      end
      object MasterData4: TfrxMasterData
        Height = 22.677180000000000000
        Top = 604.724800000000000000
        Width = 680.315400000000000000
        RowCount = 1
        Stretched = True
        object Memo20: TfrxMemoView
          Align = baWidth
          Width = 680.315400000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Spisano]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 37.795300000000000000
        Top = 650.079160000000000000
        Width = 680.315400000000000000
        object Memo21: TfrxMemoView
          Width = 30.236240000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 30.236240000000000000
          Width = 328.819110000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 359.055350000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 434.645950000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 510.236550000000000000
          Width = 56.692950000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 566.929500000000000000
          Width = 113.385900000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 71.811070000000000000
        Top = 755.906000000000000000
        Width = 680.315400000000000000
        Stretched = True
        object Memo33: TfrxMemoView
          ShiftMode = smDontShift
          Width = 566.929500000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          ShiftMode = smDontShift
          Left = 566.929500000000000000
          Width = 113.385900000000000000
          Height = 22.677165350000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxdsActSpisRep."SUMM">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Top = 30.236240000000000000
          Width = 423.307360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#181#1056#1112#1057#1107' '#1056#176#1056#1108#1057#8218#1057#1107' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1109' '#1056#1029#1056 +
              #176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039'(-'#1056#1105#1056#8470'):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 423.307360000000000000
          Top = 30.236240000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Memo.UTF8 = (
            '[GET_NAIM_KOL(COUNT(MasterData1),2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Top = 49.133890000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 75.590600000000000000
          Top = 49.133890000000000000
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Memo.UTF8 = (
            '[MONEYSTR(SUM(<frxdsActSpisRep."SUMM">,MasterData1))]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData6: TfrxMasterData
        Height = 18.897650000000000000
        Top = 850.394250000000000000
        Width = 680.315400000000000000
        RowCount = 1
        object Memo39: TfrxMemoView
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1108#1056#187#1057#1035#1057#8225#1056#181#1056#1029#1056#1105#1056#181' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData7: TfrxMasterData
        Height = 18.897650000000000000
        Top = 891.969080000000000000
        Width = 680.315400000000000000
        RowCount = 1
        Stretched = True
        object Memo40: TfrxMemoView
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[GetZaklKom()]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 98.267780000000000000
        Top = 971.339210000000000000
        Width = 680.315400000000000000
        object Memo41: TfrxMemoView
          Top = 3.779530000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Top = 30.236240000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#167#1056#187#1056#181#1056#1029#1057#8249' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 207.874150000000000000
          Top = 3.779530000000000000
          Width = 472.441250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Pred] [DolPred]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 207.874150000000000000
          Top = 30.236240000000000000
          Width = 472.441250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom1] [DolKom1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 207.874150000000000000
          Top = 52.913420000000000000
          Width = 472.441250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom2] [DolKom2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 207.874150000000000000
          Top = 75.590600000000000000
          Width = 472.441250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom3] [DolKom3]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData8: TfrxMasterData
        Height = 26.456710000000000000
        Top = 332.598640000000000000
        Width = 680.315400000000000000
        RowCount = 1
        Stretched = True
        object Memo11: TfrxMemoView
          Align = baWidth
          Width = 680.315400000000000000
          Height = 26.456710000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsSelDocMove."FC_COMMENT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData9: TfrxMasterData
        Height = 41.574830000000000000
        Top = 268.346630000000000000
        Width = 680.315400000000000000
        RowCount = 1
        Stretched = True
        object Memo9: TfrxMemoView
          Align = baWidth
          Width = 680.315400000000000000
          Height = 26.456710000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsActSpisRep."SpisDescr"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Align = baWidth
          Top = 26.456710000000000000
          Width = 680.315400000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1057#1026#1056#1105#1057#8225#1056#1105#1056#1029#1056#176' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1105#1057#1039')')
          ParentFont = False
        end
      end
    end
  end
  object frxdsActSpisRep: TfrxDBDataset
    UserName = 'frxdsActSpisRep'
    CloseDataSource = False
    DataSet = odsActSpisRep
    BCDToCurrency = False
    Left = 325
    Top = 261
  end
  object frxDBReport1a: TfrxDBDataset
    UserName = 'frxDBReport1'
    CloseDataSource = False
    DataSet = odsSelDocPoMedicType
    BCDToCurrency = False
    Left = 1009
    Top = 160
  end
  object oqPKG_SMINI: TOracleQuery
    SQL.Strings = (
      'begin'
      '  if :pValue is null then'
      '    if :pdefault is null then :pdefault := '#39#39'; end if;'
      
        '    :pValue := asu.PKG_SMINI.readstring(:psection,:pident,:pdefa' +
        'ult);'
      '  else'
      '    asu.PKG_SMINI.WRITESTRING( :psection, :pident, :pvalue);'
      '  end if;'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000004000000070000003A5056414C554505000000000000000000000009
      0000003A5053454354494F4E050000000000000000000000070000003A504944
      454E54050000000000000000000000090000003A5044454641554C5405000000
      0000000000000000}
    Cursor = crSQLWait
    Left = 1008
    Top = 228
  end
  object oqInitMO: TOracleQuery
    SQL.Strings = (
      'begin'
      '  SELECT '
      
        '    NVL(MAX(MOID),-1), MAX(FK_SKLAD_ID), NVL(MAX(fl_treb),0), MA' +
        'X(FC_NAME), max(FK_SOTRID), max(login.GET_SOTR_POSTNAME(FK_SOTRI' +
        'D)), max(fk_curmogroupid)'
      
        '  into :nMOID, :PFK_SKLAD_ID, :PFL_Provizor, :PFC_MO, :PFK_SOTR_' +
        'ID, :PFC_SPEC, :nMO_GROUP '
      '  FROM MED.TMO T '
      '  WHERE T.FK_SOTRID = login.GET_SOTRID(:pAppSotrID);'
      ''
      '  med.pkg_medses.set_curmo(:nMOID);'
      '  med.pkg_medses.set_curmo_group(:nMO_GROUP);'
      '  med.pkg_medses.ResetDatePeriod;'
      ''
      '  if :PFK_SKLAD_ID is null then'
      
        '    select NVL(MAX(mg.FK_SKLAD_ID),-1) into :PFK_SKLAD_ID from m' +
        'ed.tmo_group mg where mg.GROUPID = :nMO_GROUP;'
      '  end if;'
      '  :PFK_SKLAD_ID := NVL(:PFK_SKLAD_ID,-1);'
      '  :pSYSDATE := sysdate;'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      03000000090000000B0000003A50415050534F54524944030000000000000000
      000000060000003A4E4D4F4944030000000400000090040000000000000A0000
      003A4E4D4F5F47524F5550030000000400000000000000000000000D0000003A
      50464B5F534B4C41445F49440300000004000000FFFFFFFF000000000D000000
      3A50464C5F50524F56495A4F5203000000040000000000000000000000090000
      003A50535953444154450C00000007000000786E0A150B2E1900000000070000
      003A5046435F4D4F050000000A000000CEF2E4E5EB20D0CFCE00000000000C00
      00003A50464B5F534F54525F49440300000004000000FFFFFFFF000000000900
      00003A5046435F53504543050000000000000000000000}
    Left = 972
    Top = 228
  end
  object frxRashDocPoMedicType: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41219.429049872700000000
    ReportOptions.LastChange = 41493.386329375000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin        '
      ''
      'end.')
    OnGetValue = frxRashDocPoMedicTypeGetValue
    OnUserFunction = frxActSpisUserFunction
    Left = 1008
    Top = 119
    Datasets = <
      item
        DataSet = frxDBReport1a
        DataSetName = 'frxDBReport1'
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 404.409710000000000000
        Top = 18.897650000000000000
        Width = 1009.134510000000000000
        object Memo6: TfrxMemoView
          Align = baWidth
          Top = 158.740260000000000000
          Width = 1009.134510000000000000
          Height = 64.252010000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1106#1056#1108#1057#8218' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1105#1057#1039' '#1056#1111#1056#1109' '#1057#1107#1057#8225#1056#181#1057#8218#1056#1029#1057#8249#1056#1112' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111#1056#176#1056#1112' '#1074#8222#8211' _' +
              '___________'
            ''
            #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [VAR_DATE1] '#1056#1111#1056#1109' [VAR_DATE2]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Top = 3.779530000000000000
          Width = 396.850650000000000000
          Height = 41.574830000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_RECEIVER]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo17: TfrxMemoView
          Top = 45.354360000000000000
          Width = 396.850650000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1056#181')')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Top = 64.252010000000000000
          Width = 396.850650000000000000
          Height = 30.236240000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_MO_GROUP]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo24: TfrxMemoView
          Top = 94.488250000000000000
          Width = 396.850650000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181')')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 740.787880000000000000
          Top = 3.779530000000000000
          Width = 264.567100000000000000
          Height = 132.283550000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1032#1056#1118#1056#8217#1056#8226#1056#160#1056#8211#1056#8221#1056#1106#1056#174
            ''
            '__________________________________'
            ''
            ''
            '__________________________________'
            ''
            '"___"  _____________________  20___ '#1056#1110'.')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 226.771800000000000000
          Width = 192.756030000000000000
          Height = 41.574830000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1057#1039' '#1056#1030' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#181':'
            #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105': ')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 268.346630000000000000
          Width = 192.756030000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#167#1056#187#1056#181#1056#1029#1057#8249' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 340.157700000000000000
          Width = 1009.134510000000000000
          Height = 64.252010000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#183#1056#1029#1056#176#1057#8225#1056#181#1056#1029#1056#176' '#1056#1111#1057#1026#1056#1105#1056#1108#1056#176#1056#183#1056#1109#1056#1112' [Prikaz]'
            
              'c'#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1105#1056#187#1056#1105' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#1105#1056#8470' '#1056#176#1056#1108#1057#8218'  '#1056#1030' '#1057#8218#1056#1109#1056#1112', '#1057#8225#1057#8218#1056#1109' '#1056 +
              #1111#1056#1109' '#1057#1107#1056#1108#1056#176#1056#183#1056#176#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1111#1057#1026#1056#1105#1057#8225#1056#1105#1056#1029#1056#181' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1109' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056 +
              #176#1056#1112#1056#181#1056#1029#1057#8218#1056#1109#1056#1030':'
            '[Spisano]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 200.315090000000000000
          Top = 245.669450000000000000
          Width = 793.701300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Pred] [DolPred]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 200.315090000000000000
          Top = 272.126160000000000000
          Width = 793.701300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom1] [DolKom1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 200.315090000000000000
          Top = 294.803340000000000000
          Width = 793.701300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom2] [DolKom2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 200.315090000000000000
          Top = 317.480520000000000000
          Width = 793.701300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom3] [DolKom3]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Top = 113.385900000000000000
          Width = 396.850650000000000000
          Height = 30.236240000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_RPO]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 1069.606990000000000000
        Width = 1009.134510000000000000
        object Memo1: TfrxMemoView
          Align = baRight
          Left = 831.496600000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
        end
      end
      object Header1: TfrxHeader
        Height = 37.795300000000000000
        Top = 483.779840000000000000
        Width = 1009.134510000000000000
        object Memo8: TfrxMemoView
          Width = 45.354360000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211
            #1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 427.086890000000000000
          Width = 196.535560000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 907.087200000000000000
          Width = 102.047310000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 351.496290000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 45.354360000000000000
          Width = 249.448980000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 294.803340000000000000
          Width = 56.692950000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 623.622450000000000000
          Width = 166.299320000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 789.921770000000000000
          Width = 52.913420000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 842.835190000000000000
          Width = 64.252010000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 544.252320000000000000
        Width = 1009.134510000000000000
        Condition = 'frxDBReport1."FC_medictype"'
        Stretched = True
        object Memo33: TfrxMemoView
          Top = 0.377952755905511800
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 45.354360000000000000
          Top = 0.377952760000000000
          Width = 963.780150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."FC_medictype"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 589.606680000000000000
        Width = 1009.134510000000000000
        DataSet = frxDBReport1a
        DataSetName = 'frxDBReport1'
        RowCount = 0
        Stretched = True
        object Memo11: TfrxMemoView
          Top = 0.377952755905511800
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line])')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 427.086890000000000000
          Top = 0.377952755905511800
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."FC_DOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 907.087200000000000000
          Top = 0.377952755905511800
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBReport1."FN_SUMM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 351.496290000000000000
          Top = 0.377952755905511800
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."DATA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 45.354360000000000000
          Top = 0.377952760000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."NAMEKART"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 294.803340000000000000
          Top = 0.377952755905511800
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FC_EDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 623.622450000000000000
          Top = 0.377952755905511800
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."FC_MO_GR_TO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 789.921770000000000000
          Top = 0.377952755905511800
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FC_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 842.835190000000000000
          Top = 0.377952755905511800
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FN_PRICE_DETAIL"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 634.961040000000000000
        Width = 1009.134510000000000000
        Stretched = True
        object Memo14: TfrxMemoView
          Top = 0.377952755905511800
          Width = 842.835190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' "[frxDBReport1."FC_medictype"]"')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 842.835190000000000000
          Top = 0.377952755905511800
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBReport1."FN_SUMM">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 328.819110000000000000
        Top = 680.315400000000000000
        Width = 1009.134510000000000000
        object Memo30: TfrxMemoView
          Left = 842.835190000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBReport1."FN_SUMM">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Width = 842.835190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 7.559060000000000000
          Top = 30.236240000000000000
          Width = 423.307360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#181#1056#1112#1057#1107' '#1056#176#1056#1108#1057#8218#1057#1107' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1109' '#1056#1029#1056 +
              #176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039'(-'#1056#1105#1056#8470'):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 430.866420000000000000
          Top = 30.236240000000000000
          Width = 570.709030000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Memo.UTF8 = (
            '[GET_NAIM_KOL(COUNT(MasterData1),2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 7.559060000000000000
          Top = 86.929190000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 83.149660000000000000
          Top = 86.929190000000000000
          Width = 918.425790000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Memo.UTF8 = (
            '[MONEYSTR(SUM(<frxDBReport1."FN_SUMM">,MasterData1))]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 7.559060000000000000
          Top = 132.283550000000000000
          Width = 994.016390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1108#1056#187#1057#1035#1057#8225#1056#181#1056#1029#1056#1105#1056#181' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 7.559060000000000000
          Top = 154.960730000000000000
          Width = 994.016390000000000000
          Height = 49.133890000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[GetZaklKom()]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 7.559060000000000000
          Top = 219.212740000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 7.559060000000000000
          Top = 245.669450000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#167#1056#187#1056#181#1056#1029#1057#8249' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 215.433210000000000000
          Top = 219.212740000000000000
          Width = 786.142240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Pred] [DolPred]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 215.433210000000000000
          Top = 245.669450000000000000
          Width = 789.921770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom1] [DolKom1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 215.433210000000000000
          Top = 268.346630000000000000
          Width = 789.921770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom2] [DolKom2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 215.433210000000000000
          Top = 291.023810000000000000
          Width = 789.921770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom3] [DolKom3]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object odsSelDocPoMedicType: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  MASTER1.*, DETAIL1.*,'
      
        '  rtrim(TO_CHAR(DETAIL1.FN_KOL, '#39'FM999G999G990D99999'#39'),'#39'.,'#39') as ' +
        'FC_KOL'
      '  FROM'
      '    ('
      '     SELECT'
      '       MOFROMID,'
      '       TDOCS.FC_COMMENT,'
      '       FP_VID,'
      '       FN_PRICE AS FN_PRICE_MASTER,'
      '       MOOWNERID,'
      '       TDOCS.DPID,'
      
        '       med.GET_DECODEDOCVIDMOVE(fp_vidmove)||'#39' '#8470' '#39'||TDOCS.fc_doc' +
        '||'#39' '#1086#1090' '#39'||to_char(TDOCS.fd_invoice,'#39'dd.mm.yyyy'#39') AS fc_DOC,'
      
        '       MED.PKGTDOCS.GET_DOC_DESTINATION(TDOCS.fp_vid, TDOCS.fp_v' +
        'idmove, TDOCS.fk_mogroupid_TO, TDOCS.postavid) AS FC_MO_GR_TO,'
      
        '       MED.PKGTDOCS.GET_DOC_SOURCE (TDOCS.fp_vid, TDOCS.fp_vidmo' +
        've, TDOCS.fk_mogroupid_FROM, TDOCS.postavid) as NAMEFROM,'
      ''
      '       TRUNC(TDOCS.FD_DATA) AS DATA,'
      '       MOTOID'
      
        '     FROM   MED.TDOCS --, MED.TMO, MED.TMO T2, MED.TMO_GROUP MOG' +
        'R_FROM,  MED.TMO_GROUP MOGR_TO'
      
        '     WHERE TDOCS.fk_mogroupid_from = :MO_GROUP -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077#1084 +
        ' '#1085#1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '       AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(:ADATA1) AND TRUNC' +
        '(:ADATA2)'
      
        '       AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID,  ' +
        'TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid_to' +
        ', :MO_GROUP) = -1'
      
        '       AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074#1088#1072#1090#1072' - '#1087#1086#1089#1082#1086#1083 +
        #1100#1082#1091' '#1074#1086#1079#1074#1088#1072#1090' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074' '#1076#1074#1080#1078#1077#1085#1080#1080' ('#1082#1086#1075#1076#1072' '#1087#1088#1080#1093#1086#1076'+'#1088 +
        #1072#1089#1093#1086#1076')'
      '       AND ((:IS_RPO = 1)OR(tdocs.fp_vidmove <> 7))'
      '       AND (not tdocs.fp_vidmove in (4,5))'
      '       AND TDOCS.FL_EDIT = 0 '
      
        '       AND ((:FK_PROFIL_ID = -1) or TDOCS.MOTOID = :FK_PROFIL_ID' +
        ') -- '#1055#1088#1086#1092#1080#1083#1080
      '    ) MASTER1,'
      '    (SELECT '
      '          TDPC.DPID,'
      '          TDPC.DPCID,'
      '          TKART.MEDICID,'
      '          TDPC.FN_KOL,'
      '          (TKART.FN_PRICE*TDPC.FN_KOL) as FN_SUMM,'
      '          TKART.FN_PRICE AS FN_PRICE_DETAIL,'
      '          TKART.KARTID,'
      '          TMEDIC.FC_NAME as MEDICNAME,'
      '          TKART.FN_PARTY_NUM,'
      
        '          TMEDIC.FC_NAME||'#39'('#1087'. '#8470#39'|| TKART.FN_PARTY_NUM||'#39')'#39' AS N' +
        'AMEKART,'
      '          FS.FC_NAME FC_FINSOURCE,'
      '          TKART.FC_SERIAL,'
      '          TEI.FC_NAME AS FC_EDIZM,'
      '          UG.root_fc_uchgr as FC_medictype'
      '        FROM'
      '          MED.TDPC, MED.TKART, MED.TMEDIC, MED.TEI, '
      
        '          (select connect_by_root fc_uchgr as root_fc_uchgr, con' +
        'nect_by_root uchgrid as root_uchgrid, t.* from med.tuchgr t conn' +
        'ect by prior /*uchgrid*/ (case uchgrid when 0 then null else uch' +
        'grid end) = parentid start with parentid = 0) UG, MED.TFINSOURCE' +
        ' FS'
      '        WHERE'
      '          TDPC.KARTID = TKART.KARTID'
      '          AND TKART.MEDICID=TMEDIC.MEDICID'
      '          AND TMEDIC.EIID = TEI.EIID(+)'
      '          AND TKART.FK_FINSOURCE_ID = FS.FK_ID (+)'
      '          AND DPID IN (SELECT TDOCS.DPID'
      '                       FROM   MED.TDOCS --, TMO, TMO T2'
      
        '                       WHERE TDOCS.fk_mogroupid_from = :MO_GROUP' +
        ' -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077#1084' '#1085#1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '                         AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(' +
        ':ADATA1) AND TRUNC(:ADATA2)'
      
        '                         AND MED.PKG_PRIHRASH.Get_PrihRashPrizna' +
        'k (TDOCS.FP_VID,  TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDO' +
        'CS.fk_mogroupid_to, :MO_GROUP) = -1                         '
      
        '                         AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077 +
        ' '#1074#1086#1079#1074#1088#1072#1090#1072' - '#1087#1086#1089#1082#1086#1083#1100#1082#1091' '#1074#1086#1079#1074#1088#1072#1090' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074' '#1076#1074#1080#1078#1077#1085 +
        #1080#1080' ('#1082#1086#1075#1076#1072' '#1087#1088#1080#1093#1086#1076'+'#1088#1072#1089#1093#1086#1076')'
      '                         AND (not tdocs.fp_vidmove in (4,5))'
      '                         AND TDOCS.FL_EDIT = 0  '
      '                      )'
      '         AND TMEDIC.UCHGRID = UG.UCHGRID(+)'
      
        '         and ((:pUCHGR = -1)or TMEDIC.UCHGRID in (select uchgrid' +
        ' from med.tuchgr connect by prior uchgrid = parentid start with ' +
        '/*uchgrid*/ (case uchgrid when 0 then null else uchgrid end) = :' +
        'pUCHGR))'
      '    ) DETAIL1'
      '  WHERE MASTER1.DPID = DETAIL1.DPID'
      
        'ORDER BY UPPER(FC_medictype), MASTER1.DATA,  LOWER(MEDICNAME), F' +
        'N_PARTY_NUM')
    Optimize = False
    Variables.Data = {
      0300000006000000070000003A4144415441310C000000000000000000000007
      0000003A4144415441320C0000000000000000000000090000003A4D4F5F4752
      4F5550030000000000000000000000070000003A505543484752030000000000
      000000000000070000003A49535F52504F0300000000000000000000000D0000
      003A464B5F50524F46494C5F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000190000000400000044504944010000000000090000004D4F4F574E45
      5249440100000000000600000046435F444F430100000000000600000046505F
      5649440100000000000A00000046435F434F4D4D454E54010000000000080000
      004D4F46524F4D4944010000000000060000004D4F544F494401000000000002
      0000004432010000000000020000004431010000000000040000004441544101
      0000000000080000004E414D4546524F4D0100000000000B00000046435F4D4F
      544F4E414D4501000000000006000000445049445F3101000000000005000000
      4450434944010000000000070000004D45444943494401000000000006000000
      464E5F4B4F4C01000000000007000000464E5F53554D4D0100000000000F0000
      00464E5F50524943455F44455441494C010000000000060000004B4152544944
      010000000000080000004E414D454B4152540100000000000900000046435F53
      455249414C0100000000000800000045445F494E495A4D0100000000000F0000
      00464E5F50524943455F4D41535445520100000000000D00000046435F4D4F5F
      47525F46524F4D0100000000001E0000004D45442E4745545F4445434F444544
      4F435649442854444F43532E46505F010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 1009
    Top = 196
  end
  object odsGroupMo: TOracleDataSet
    SQL.Strings = (
      'SELECT * from'
      '(SELECT groupid, fc_group, fl_del, 0 as FN_ORDER'
      
        'FROM med.v$tmo_group WHERE (fl_del = 0) and (UPPER(fc_group) lik' +
        'e '#39'%'#1040#1055#1058#1045#1050#1040'%'#39')'
      'UNION'
      'SELECT groupid, fc_group, fl_del, 1 as FN_ORDER'
      
        'FROM med.v$tmo_group WHERE fl_del = 0 and (not (UPPER(fc_group) ' +
        'like '#39'%'#1040#1055#1058#1045#1050#1040'%'#39'))'
      ')'
      'ORDER BY FN_ORDER, UPPER(fc_group)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C010000000000}
    Session = dmMain.os
    Left = 968
    Top = 195
  end
end
