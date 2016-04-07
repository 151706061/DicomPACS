object frmPrihList: TfrmPrihList
  Left = 411
  Top = 154
  Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
  HelpContext = 7
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1088#1080#1093#1086#1076#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  ClientHeight = 522
  ClientWidth = 944
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
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 335
    Width = 944
    Height = 5
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 926
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 944
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 40
        Width = 944
      end>
    EdgeBorders = [ebTop, ebBottom]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 935
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 73
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = False
      TabOrder = 0
      object tbuAdd: TToolButton
        Left = 0
        Top = 0
        Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        DropdownMenu = pmAdd
        ImageIndex = 48
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = tbuAddClick
      end
      object ToolButton9: TToolButton
        Left = 86
        Top = 0
        Action = edit
        ImageIndex = 47
        ParentShowHint = False
        ShowHint = True
      end
      object tbuTreb: TToolButton
        Left = 159
        Top = 0
        Action = acTreb
      end
      object tbuDel: TToolButton
        Left = 232
        Top = 0
        Action = del
      end
      object ToolButton4: TToolButton
        Left = 305
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbuPrint: TToolButton
        Left = 313
        Top = 0
        Caption = #1055#1077#1095#1072#1090#1100
        DropdownMenu = pmPrint
        ImageIndex = 32
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = tbuPrintClick
      end
      object ToolButton2: TToolButton
        Left = 399
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 10
        Style = tbsSeparator
        Visible = False
      end
      object tbuSign: TToolButton
        Left = 407
        Top = 0
        Action = acSign
      end
      object ToolButton5: TToolButton
        Left = 480
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton6: TToolButton
        Left = 488
        Top = 0
        Action = refresh
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton3: TToolButton
        Left = 561
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object Panel1: TPanel
        Left = 569
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
            Top = 17
            ParentColor = False
            Style.Color = clBtnFace
            TabOrder = 2
            OnClick = chbDate2Click
            Width = 21
          end
        end
      end
      object ToolButton13: TToolButton
        Left = 678
        Top = 0
        Width = 8
        Caption = 'ToolButton13'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 686
        Top = 0
        Action = esc
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object sbSum: TStatusBar
    Left = 0
    Top = 501
    Width = 944
    Height = 21
    Panels = <
      item
        Width = 50
      end>
  end
  object cxDBgPrihList: TcxGrid
    Left = 0
    Top = 44
    Width = 944
    Height = 291
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object cxDBgPrihListDBTableView1: TcxGridDBTableView
      OnDblClick = cxDBgPrihListDBTableView1DblClick
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = cxDBgPrihListDBTableView1CellClick
      OnCustomDrawCell = cxDBgPrihListDBTableView1CustomDrawCell
      OnFocusedRecordChanged = cxDBgPrihListDBTableView1FocusedRecordChanged
      DataController.DataSource = dsSelDoc
      DataController.Filter.MaxValueListCount = 1000
      DataController.KeyFieldNames = 'DPID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00'#1088#39'.'#39';-,0.00'#1088#39'.'#39
          Kind = skSum
          FieldName = 'FN_PRICE'
          Column = cxDBgPrihListDBTableView1FN_PRICE
        end>
      DataController.Summary.SummaryGroups = <
        item
          Links = <
            item
              Column = cxDBgPrihListDBTableView1FN_PRICE
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
      OptionsData.DeletingConfirmation = False
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
      object cxDBgPrihListDBTableView1FK_VID_POST: TcxGridDBColumn
        Caption = #1042#1080#1076' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
        DataBinding.FieldName = 'FK_VID_POST'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.ListSource = dmMain.dsVid_post
        Visible = False
        Options.Editing = False
        VisibleForCustomization = False
      end
      object cxDBgPrihListDBTableView1FD_DATA: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080':'
        DataBinding.FieldName = 'FD_DATA'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.DateButtons = [btnClear, btnToday]
        Properties.DateOnError = deToday
        Properties.ReadOnly = True
        Properties.SaveTime = False
        HeaderAlignmentHorz = taCenter
        MinWidth = 61
        Options.Editing = False
        SortIndex = 1
        SortOrder = soDescending
        Width = 61
      end
      object cxDBgPrihListDBTableView1FD_INVOICE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'FD_INVOICE'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Properties.SaveTime = False
        Options.Editing = False
        SortIndex = 0
        SortOrder = soDescending
      end
      object cxDBgPrihListDBTableView1FC_DOCNAME: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'FC_DOCNAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Options.Editing = False
        Width = 160
      end
      object cxDBgPrihListDBTableView1FC_DOC: TcxGridDBColumn
        Caption = #8470' '#1076#1086#1082'-'#1090#1072
        DataBinding.FieldName = 'FC_DOC'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 50
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 58
      end
      object cxDBgPrihListDBTableView1FC_KONTRAKT: TcxGridDBColumn
        Caption = #1055#1086' '#1082#1086#1085#1090#1088#1072#1082#1090#1091
        DataBinding.FieldName = 'FC_KONTRAKT'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        Options.Editing = False
        VisibleForCustomization = False
      end
      object cxDBgPrihListDBTableView1FC_SCHET_FAKTURA: TcxGridDBColumn
        Caption = #1057#1095#1077#1090'-'#1092#1072#1082#1090#1091#1088#1072
        DataBinding.FieldName = 'FC_SCHET_FAKTURA'
        Visible = False
        VisibleForCustomization = False
      end
      object cxDBgPrihListDBTableView1FC_DOCMIX: TcxGridDBColumn
        Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_DOCMIX'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 4000
        Properties.ReadOnly = True
        MinWidth = 84
        Options.Editing = False
        Width = 84
      end
      object cxDBgPrihListDBTableView1FN_PRICE: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091', '#1088
        DataBinding.FieldName = 'FN_PRICE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.Nullable = False
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        MinWidth = 60
        Options.Editing = False
        Width = 60
      end
      object cxDBgPrihListDBTableView1FC_MOGROUPID_FROM: TcxGridDBColumn
        Caption = #1054#1090#1082#1091#1076#1072
        DataBinding.FieldName = 'FC_MOGROUPID_FROM'
        Options.Editing = False
        Width = 62
      end
      object cxDBgPrihListDBTableView1FC_NAME: TcxGridDBColumn
        Caption = #1050#1091#1076#1072
        DataBinding.FieldName = 'FC_MOGROUPID_TO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 50
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 60
      end
      object cxDBgPrihListDBTableView1FC_COMMENT: TcxGridDBColumn
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080':'
        DataBinding.FieldName = 'FC_COMMENT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 250
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 92
      end
      object cxDBgPrihListDBTableView1POD: TcxGridDBColumn
        Caption = #1055#1086#1076#1087#1080#1089#1100
        DataBinding.FieldName = 'POD'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 3
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 155
      end
      object cxDBgPrihListDBTableView1DPID: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'DPID'
        Visible = False
      end
      object cxDBgPrihListDBTableView1FK_FINSOURCE_ID: TcxGridDBColumn
        Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089'.'
        DataBinding.FieldName = 'FK_FINSOURCE_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.ListSource = dmMain.dsTFinSource
        Options.Editing = False
      end
      object cxDBgPrihListDBTableView1FK_PAYCOND_ID: TcxGridDBColumn
        Caption = #1059#1089#1083#1086#1074#1080#1103' '#1086#1087#1083#1072#1090#1099
        DataBinding.FieldName = 'FK_PAYCOND_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.ListSource = dmMain.dsPayCond
        Options.Filtering = False
      end
    end
    object cxDBgPrihListLevel1: TcxGridLevel
      GridView = cxDBgPrihListDBTableView1
    end
  end
  object cxDBgPrihKart: TcxGrid
    Left = 0
    Top = 340
    Width = 944
    Height = 161
    Align = alClient
    TabOrder = 3
    LookAndFeel.Kind = lfFlat
    object cxDBgPrihKartDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = cxDBgPrihKartDBTableView1CustomDrawCell
      DataController.DataSource = dsKart
      DataController.Filter.MaxValueListCount = 1000
      DataController.Filter.Active = True
      DataController.Filter.AutoDataSetFilter = True
      DataController.KeyFieldNames = 'KARTID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00'#1088#39'.'#39';-,0.00'#1088#39'.'#39
          Kind = skSum
          FieldName = 'FN_SUMM'
          Column = cxDBgPrihKartDBTableView1FN_SUMM
        end
        item
          Format = ',0.00'#39'.'#39';-,0.00'#39'.'#39
          Kind = skSum
          FieldName = 'FN_KOL'
          Column = cxDBgPrihKartDBTableView1FN_KOL
        end>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnPopup.MaxDropDownItemCount = 12
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
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
      Styles.Footer = dmMain.cxStyleFooter
      object cxDBgPrihKartDBTableView1ROWNUM: TcxGridDBColumn
        Caption = #8470' '#1087'/'#1087
        DataBinding.FieldName = 'ROWNUM'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Width = 48
      end
      object cxDBgPrihKartDBTableView1NAMEKART: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
        DataBinding.FieldName = 'NAMEKART'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 255
        Properties.ReadOnly = True
        MinWidth = 130
        Options.Editing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 139
      end
      object cxDBgPrihKartDBTableView1FC_INTERNATIONAL_NAME: TcxGridDBColumn
        Caption = #1052#1077#1078#1076#1091#1085#1072#1088#1086#1076#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_INTERNATIONAL_NAME'
        Visible = False
        Width = 150
      end
      object cxDBgPrihKartDBTableView1FN_PARTY_NUM: TcxGridDBColumn
        Caption = #8470' '#1087#1072#1088#1090#1080#1080
        DataBinding.FieldName = 'FN_PARTY_NUM'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Width = 60
      end
      object cxDBgPrihKartDBTableView1FC_SERIAL: TcxGridDBColumn
        Caption = #1057#1077#1088'. '#8470
        DataBinding.FieldName = 'FC_SERIAL'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 50
        Properties.ReadOnly = True
        Width = 83
      end
      object cxDBgPrihKartDBTableView1FD_GODEN: TcxGridDBColumn
        Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080
        DataBinding.FieldName = 'FD_GODEN'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.DateButtons = []
        Properties.SaveTime = False
        Properties.ShowTime = False
        Visible = False
        Options.Editing = False
      end
      object cxDBgPrihKartDBTableView1lkeiname: TcxGridDBColumn
        Caption = #1045#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'FC_EDIZM'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 20
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 58
      end
      object cxDBgPrihKartDBTableView1FN_KOL: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086':'
        DataBinding.FieldName = 'FN_KOL'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '### ### ### ##0.#######'
        Properties.MaxValue = 100000000.000000000000000000
        Properties.ReadOnly = True
        MinWidth = 53
        Width = 53
      end
      object cxDBgPrihKartDBTableView1FN_PRICE: TcxGridDBColumn
        Caption = #1062#1077#1085#1072', '#1088
        DataBinding.FieldName = 'FN_PRICE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.Nullable = False
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Options.Editing = False
        Width = 64
      end
      object cxDBgPrihKartDBTableView1FN_SUMM: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1088
        DataBinding.FieldName = 'FN_SUMM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.Nullable = False
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Options.Editing = False
        Width = 69
      end
      object cxDBgPrihKartDBTableView1KARTID: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1087#1072#1088#1090#1080#1080
        DataBinding.FieldName = 'KARTID'
        Visible = False
      end
      object cxDBgPrihKartDBTableView1MEDICID: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'MEDICID'
        Visible = False
      end
      object cxDBgPrihKartDBTableView1FK_FINSOURCE_ID: TcxGridDBColumn
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
        Width = 52
      end
      object cxDBgPrihKartDBTableView1fc_inv_nomer: TcxGridDBColumn
        Caption = #1048#1085#1074'. '#1085#1086#1084#1077#1088
        DataBinding.FieldName = 'fc_inv_nomer'
        Width = 50
      end
      object cxDBgPrihKartDBTableView1FC_QUOTA_CODE: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1082#1074#1086#1090#1099
        DataBinding.FieldName = 'FC_QUOTA_CODE'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.AlwaysShowBlanksAndLiterals = True
        Properties.EditMask = '00-00-00-00;0;_'
        Width = 47
      end
      object cxDBgPrihKartDBTableView1FN_NDS: TcxGridDBColumn
        Caption = #1053#1044#1057', %'
        DataBinding.FieldName = 'FN_NDS'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = ',0.###%'
        Properties.EditFormat = ',0.###'
        Width = 47
      end
      object cxDBgPrihKartDBTableView1FN_PRICE_MNF: TcxGridDBColumn
        Caption = #1062#1077#1085#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103
        DataBinding.FieldName = 'FN_PRICE_MNF'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Width = 47
      end
      object cxDBgPrihKartDBTableView1FN_NACENKA: TcxGridDBColumn
        Caption = #1053#1072#1094#1077#1085#1082#1072', %'
        DataBinding.FieldName = 'FN_NACENKA'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = ',0.###%'
        Properties.EditFormat = ',0.###'
        Width = 55
      end
      object cxDBgPrihKartDBTableView1FL_JNVLS: TcxGridDBColumn
        Caption = #1046#1053#1042#1051#1055
        DataBinding.FieldName = 'FL_JNVLS'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Width = 40
      end
      object cxDBgPrihKartDBTableView1FL_MIBP: TcxGridDBColumn
        Caption = #1052#1048#1041#1055
        DataBinding.FieldName = 'FL_MIBP'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 40
      end
      object cxDBgPrihKartDBTableView1FC_PRODUCER: TcxGridDBColumn
        Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
        DataBinding.FieldName = 'FC_PRODUCER'
        Visible = False
        Width = 50
      end
      object cxDBgPrihKartDBTableView1FL_FORMULAR: TcxGridDBColumn
        Caption = #1060#1086#1088#1084#1091#1083#1103#1088
        DataBinding.FieldName = 'FL_FORMULAR'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 40
      end
    end
    object cxDBgPrihKartLevel1: TcxGridLevel
      GridView = cxDBgPrihKartDBTableView1
    end
  end
  object dsSelDoc: TDataSource
    DataSet = odsSelDocPrih
    Left = 32
    Top = 336
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
    Left = 104
    Top = 288
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 544
    Top = 40
    object esc: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1088#1080#1093#1086#1076#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      ImageIndex = 1
      OnExecute = escExecute
    end
    object ins: TAction
      Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103
      HelpContext = 72
      HelpType = htContext
      Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 21
      ShortCut = 115
      OnExecute = insExecute
    end
    object del: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 22
      ShortCut = 119
      OnExecute = delExecute
      OnUpdate = delUpdate
    end
    object edit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 3
      ShortCut = 114
      OnExecute = editExecute
    end
    object refresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      ImageIndex = 15
      ShortCut = 116
      OnExecute = refreshExecute
    end
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 49232
      OnExecute = Action1Execute
    end
    object acInsOst: TAction
      Caption = #1042#1074#1086#1076' '#1086#1089#1090#1072#1090#1082#1086#1074
      HelpContext = 71
      HelpType = htContext
      OnExecute = acInsOstExecute
    end
    object acPrintNakl: TAction
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090
      OnExecute = acPrintNaklExecute
    end
    object acSign: TAction
      Caption = ' '#160#1059#1090#1074#1077#1088#1076#1080#1090#1100#160#160
      ImageIndex = 47
      OnExecute = acSignExecute
    end
    object acPrintLittleKart: TAction
      Caption = #1057#1090#1077#1083#1072#1078#1085#1099#1077' '#1082#1072#1088#1090#1086#1095#1082#1080
      OnExecute = acPrintLittleKartExecute
    end
    object acGodMode: TAction
      Caption = 'acGodMode'
      ShortCut = 49223
      OnExecute = acGodModeExecute
    end
    object acPrnInvoice: TAction
      Caption = 'acPrnInvoice'
      OnExecute = acPrnInvoiceExecute
    end
    object acTreb: TAction
      Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1103
      ImageIndex = 6
      ShortCut = 117
      OnExecute = acTrebExecute
    end
    object acFromRezerv: TAction
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1080#1079' '#1088#1077#1079#1077#1088#1074#1072
      OnExecute = acFromRezervExecute
    end
    object acImpNakl: TAction
      Caption = #1048#1084#1087#1086#1088#1090' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
      ImageIndex = 63
      OnExecute = acImpNaklExecute
    end
    object acPrintNaklsInPeriod: TAction
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099' '#1079#1072' '#1087#1077#1088#1080#1086#1076
      OnExecute = acPrintNaklsInPeriodExecute
    end
    object acPrintNaklM4: TAction
      Tag = 1
      Caption = #1060#1086#1088#1084#1072' '#1052'-4'
      OnExecute = acPrintNaklExecute
    end
    object acPrintLittleKart1: TAction
      Caption = #1057#1090#1077#1083#1072#1078#1085#1099#1077' '#1082#1072#1088#1090#1086#1095#1082#1080' ('#1089#1090'.'#1084#1089')'
      OnExecute = acPrintLittleKart1Execute
    end
  end
  object odsSelDocPrih: TOracleDataSet
    SQL.Strings = (
      'select vprih.rowid, vprih.* , tfinsource.fc_name fc_finsource,'
      '    decode(vprih.fl_edit,0,'#39#1044#1072#39',1,'#39#1053#1077#1090#39') as pod,'
      '   (SELECT COUNT(1) FROM MED.TCLOSEDPERIODS CD'
      
        '     WHERE vprih.FD_INVOICE BETWEEN trunc(CD.FD_BEGIN) AND trunc' +
        '(CD.FD_END)+0.99999'
      '       AND FL_DEL <> 1'
      '       AND FL_PODPIS = 1) as FL_IN_CLOSED_PERIOD'
      
        ' from MED.vprih left join med.tfinsource on vprih.fk_finsource_i' +
        'd = tfinsource.fk_id'
      
        ' WHERE ((TRUNC(FD_DATA) >= TRUNC(:DATE1) or :FILTERED_BY_DATE1 =' +
        ' 0) and (TRUNC(FD_DATA) <= TRUNC(:DATE2) or :FILTERED_BY_DATE2 =' +
        ' 0))'
      '--order by data desc'
      ''
      '/*'
      'select vprih.rowid, vprih.* , tfinsource.fc_name fc_finsource,'
      '    decode(vprih.fl_edit,0,'#39#1044#1072#39',1,'#39#1053#1077#1090#39') as pod,'
      '   (SELECT COUNT(1) FROM MED.TCLOSEDPERIODS CD'
      
        '     WHERE vprih.FD_INVOICE BETWEEN trunc(CD.FD_BEGIN) AND trunc' +
        '(CD.FD_END)+0.99999'
      '       AND FL_DEL <> 1'
      '       AND FL_PODPIS = 1) as FL_IN_CLOSED_PERIOD'
      
        ' from MED.vprih left join med.tfinsource on vprih.fk_finsource_i' +
        'd = tfinsource.fk_id'
      
        ' WHERE ((TRUNC(FD_DATA) >= TRUNC(:DATE1) or :FILTERED_BY_DATE1 =' +
        ' 0) and (TRUNC(FD_DATA) <= TRUNC(:DATE2) or :FILTERED_BY_DATE2 =' +
        ' 0))'
      '*/'
      
        '--order by data desc --'#1057#1086#1088#1090#1080#1088#1091#1102' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'. '#1053#1072' '#1061#1072#1085#1090#1072#1093' '#1074#1072#1083#1080#1090#1089#1103' '#1086 +
        #1096#1080#1073#1082#1072' ORA-01455 ('#1085#1072#1081#1090#1080' '#1088#1077#1096#1077#1085#1080#1077' '#1085#1077' '#1091#1076#1072#1083#1086#1089#1100')')
    Optimize = False
    Variables.Data = {
      0300000004000000060000003A44415445310C00000000000000000000001200
      00003A46494C54455245445F42595F4441544531030000000400000000000000
      00000000060000003A44415445320C0000000000000000000000120000003A46
      494C54455245445F42595F444154453203000000040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001F00000008000000504F535441564944010000000000060000004D4F
      544F4944010000000000080000004D4F46524F4D49440100000000000A000000
      46435F434F4D4D454E540100000000000600000046505F564944010000000000
      08000000464E5F5052494345010000000000090000004D4F4F574E4552494401
      000000000004000000445049440100000000000600000046435F444F43010000
      0000000400000044415441010000000000080000004944504F53544156010000
      0000000700000046445F4441544101000000000007000000464C5F4544495401
      00000000000900000046435F444F434D49580100000000000A00000046445F49
      4E564F4943450100000000000A00000046505F5649444D4F5645010000000000
      03000000504F440100000000001100000046435F4D4F47524F555049445F4652
      4F4D0100000000000F00000046435F4D4F47524F555049445F544F0100000000
      0011000000464B5F4D4F47524F555049445F46524F4D0100000000000F000000
      464B5F4D4F47524F555049445F544F0100000000000A00000046435F444F434E
      414D45010000000000060000004E414D45544F010000000000080000004E414D
      4546524F4D0100000000000B000000464B5F5649445F504F5354010000000000
      0B00000046435F4B4F4E5452414B54010000000000150000004D4F47525F4652
      4F4D5F464B5F534B4C41445F4944010000000000130000004D4F47525F544F5F
      464B5F534B4C41445F49440100000000001000000046435F53434845545F4641
      4B545552410100000000000F000000464B5F46494E534F555243455F49440100
      000000000D000000464B5F504159434F4E445F4944010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Filter = 'not ((fp_vidmove = 2)and(fl_edit=1))'
    BeforeOpen = odsSelDocPrihBeforeOpen
    AfterOpen = odsSelDocPrihAfterOpen
    AfterScroll = odsSelDocPrihAfterOpen
    BeforeRefresh = odsSelDocPrihBeforeOpen
    Left = 32
    Top = 290
  end
  object odsNakl: TOracleDataSet
    SQL.Strings = (
      'select /*+rule*/'
      '    :pol as pol,'
      '    :otp as otp,'
      '    :dolpol as dolpol,'
      '    :dolotp as dolotp,'
      '    tmedic.fc_name as namemedic,'
      '    tei.fc_name as einame,'
      '    tdpc.fn_kol,'
      '    tkart.FN_PRICE,'
      '    (tkart.FN_PRICE*tdpc.fn_kol) as fn_summ, --tdpc.fn_summ,'
      '    ASU.get_glavfio as glav,'
      '    tmedic.medicid,'
      '    tkart.fc_inv_nomer,'
      '    fs.fc_name fc_finsource'
      
        '  from MED.tdpc, MED.tkart, MED.tmedic, MED.tei, MED.tfinsource ' +
        'fs'
      '  where dpid=:adpid'
      '    and tdpc.kartid=tkart.kartid'
      '    and tkart.medicid=tmedic.medicid'
      '    and tmedic.eiid=tei.eiid(+)'
      '    and tkart.fk_finsource_id = fs.fk_id(+)'
      '    and TKART.fl_del=0'
      '--    AND TMEDIC.FL_VISIBLE = 1'
      '  order by LOWER(tkart.fc_name)')
    Optimize = False
    Variables.Data = {
      0300000005000000060000003A41445049440300000000000000000000000400
      00003A504F4C050000000000000000000000040000003A4F5450050000000000
      000000000000070000003A444F4C504F4C050000000000000000000000070000
      003A444F4C4F5450050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000600000045494E414D4501000000000006000000464E5F4B
      4F4C010000000000090000004E414D454D454449430100000000000300000050
      4F4C010000000000030000004F545001000000000006000000444F4C504F4C01
      000000000006000000444F4C4F545001000000000007000000464E5F53554D4D
      01000000000004000000474C4156010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 472
    Top = 256
  end
  object frDBdsNakl: TfrDBDataSet
    DataSet = odsNakl
    Left = 472
    Top = 304
  end
  object frNakl: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frNaklGetValue
    Left = 472
    Top = 208
    ReportForm = {
      19000000F3190000190000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF0000000000000100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000018000000F6020000460100003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E48656164657231000201000000007C010000F60200002000000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200AD0100000B004D6173746572446174613100020100000000B4010000F602
      0000220000003000050001000000000000000000FFFFFF1F000000000A006672
      444264734E616B6C00000000000000FFFF000000000002000000010000000000
      000001000000C800000014000000010000000000000200180200000B00506167
      65466F6F7465723100020100000000D4020000F60200001E0000003000030001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200850200000D004D6173746572466F6F7465723100020100000000FC010000
      F6020000BA0000003000060001000000000000000000FFFFFF1F000000000000
      00000000000000FFFF000000000002000000010000000000000001000000C800
      0000140000000100000000000000001603000006004D656D6F3730000200F401
      000093000000E8000000150000000300000001000000000000000000FFFFFF1F
      2C0003020C00646420206D6F20207979797900010006005B444154455D000000
      00000000000000000200000001000000000500417269616C000C000000000000
      00000002000000CC00020000000000FFFFFF0000000002000000000000000000
      BD03000005004D656D6F3200020018010000B4000000A00000001C0000000300
      000001000000000000000000FFFFFF1F2C02000000000001000D00CDE0EAEBE0
      E4EDE0FF2020B9200003000500626567696E0D0C00202073756D6D3A3D303B20
      200D0300656E6400FFFF00000000000200000001000000000500417269616C00
      1000000002000000000000000000CC00020000000000FFFFFF00000000020000
      000000000000005404000005004D656D6F3300020018010000E0000000DC0000
      00140000000300000001000000000000000000FFFFFF1F2C0003020000000100
      1900CEF2205B6F647353656C446F63507269682E2244415441225D00000000FF
      FF00000000000200000001000000000500417269616C000C0000000400000000
      0002000000CC00020000000000FFFFFF0000000002000000000000000000F804
      000005004D656D6F340002003000000018010000600000003800000003000000
      01000000000000000000FFFFFF1F2C02000000000003000A00CFEEF1F2E0E2F9
      E8EA3A0D0B00CFEEEBF3F7E0F2E5EBFC3A0D0B00D7E5F0E5E720EAEEE3EE3A00
      000000FFFF00000000000200000001000000000500417269616C000C00000000
      000000000000000000CC00020000000000FFFFFF000000000200000000000000
      00002806000005004D656D6F3500020090000000160100002002000014000000
      0300000001000000000000000000FFFFFF1F2C020000000000010023005B6F64
      7353656C446F63507269682E2246435F4D4F47524F555049445F46524F4D225D
      0006000500626567696E0D2900206966205B6F647353656C446F63507269682E
      2246505F5649444D4F5645225D203D2031207468656E0D3400202020506F7374
      61764E616D65203A3D205B6F647353656C446F63507269682E2246435F4D4F47
      524F555049445F46524F4D225D0D050020656C73650D1400202020506F737461
      764E616D65203A3D2027273B0D0300656E6400FFFF0000000000020000000100
      0000000500417269616C000C00000004000000000000000000CC000200000000
      00FFFFFF0000000002000000000000000000A606000005004D656D6F36000200
      900000003C01000020020000140000000300000001000000000000000000FFFF
      FF1F2C0200000000000100000000000000FFFF00000000000200000001000000
      000500417269616C000C00000004000000000000000000CC00020000000000FF
      FFFF00000000020000000000000000002D07000005004D656D6F370002001400
      00007C0100001C0000002000000003000F0001000000000000000000FFFFFF1F
      2C02000000000002000200B9200D0400EF2EEF2E00000000FFFF000000000002
      00000001000000000500417269616C000A0000000000000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000B707000005004D656D
      6F38000200300000007C0100003C0100002000000003000F0001000000000000
      000000FFFFFF1F2C02000000000001000C00CDE0E8ECE5EDEEE2E0EDE8E50000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      003D08000005004D656D6F390002006C0100007C0100004C0000002000000003
      000F0001000000000000000000FFFFFF1F2C02000000000001000800C5E42E20
      C8E7EC2E00000000FFFF00000000000200000001000000000500417269616C00
      0A0000000000000000000A000000CC00020000000000FFFFFF00000000020000
      00000000000000C608000006004D656D6F3130000200B80100007C0100006C00
      00002000000003000F0001000000000000000000FFFFFF1F2C02000000000001
      000A00CAEEEBE8F7E5F1F2E2EE00000000FFFF00000000000200000001000000
      000500417269616C000A0000000000000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000004909000006004D656D6F313300020024
      0200007C010000600000002000000003000F0001000000000000000000FFFFFF
      1F2C02000000000001000400D6E5EDE000000000FFFF00000000000200000001
      000000000500417269616C000A0000000000000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000CD09000006004D656D6F313400
      0200840200007C010000580000002000000003000F0001000000000000000000
      FFFFFF1F2C02000000000001000500D1F3ECECE000000000FFFF000000000002
      00000001000000000500417269616C000A0000000000000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000560A000006004D656D
      6F313500020014000000B40100001C0000002200000003000F00010000000000
      00000000FFFFFF1F2C02000000000001000A005B43555252454E54235D000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      EA0A000006004D656D6F313600020030000000B40100003C0100002200000003
      000F0001000000000000000000FFFFFF1F2C020000000000010015005B6F6473
      6E616B6C2E224E414D454D45444943225D00000000FFFF000000000002000000
      01000000000500417269616C000A00000000000000000008000000CC00020000
      000000FFFFFF00000000020000000000000000007B0B000006004D656D6F3137
      0002006C010000B40100004C0000002200000003000F00010000000000000000
      00FFFFFF1F2C020000000000010012005B6F64736E616B6C2E2245494E414D45
      225D00000000FFFF00000000000200000001000000000500417269616C000A00
      00000000000000000A000000CC00020000000000FFFFFF000000000200000000
      00000000000C0C000006004D656D6F3139000200B8010000B40100006C000000
      2200000003000F0001000000000000000000FFFFFF1F2C020000000000010012
      005B6F64734E616B6C2E22464E5F4B4F4C225D00000000FFFF00000000000200
      000001000000000500417269616C000A0000000000000000000A000000CC0002
      0000000000FFFFFF0000000002000000000000000000B90C000006004D656D6F
      323100020024020000B4010000600000002200000003000F0001000000000000
      000000FFFFFF1F2C02000000000001002E005B464F524D4154464C4F41542827
      30F02E3030EA2E272C205B6F64736E616B6C2E22464E5F5052494345225D295D
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      000000BB0D000006004D656D6F323200020084020000B4010000580000002200
      000003000F0001000000000000000000FFFFFF1F2C02000000000001003F005B
      464F524D4154464C4F4154282730F02E3030EA2E272C205B6F64736E616B6C2E
      22464E5F4B4F4C222A6F64736E616B6C2E22464E5F5052494345225D295D0003
      000500626567696E0D3400202073756D6D3A3D73756D6D202B205B6F64736E61
      6B6C2E22464E5F4B4F4C222A6F64736E616B6C2E22464E5F5052494345225D0D
      0300656E6400FFFF00000000000200000001000000000500417269616C000A00
      00000000000000000A000000CC00020000000000FFFFFF000000000200000000
      0000000000430E000006004D656D6F3138000200240000004802000040000000
      100000000300000001000000000000000000FFFFFF1F2C020000000000010009
      00CEF2EFF3F1F2E8EB3A00000000FFFF00000000000200000001000000000500
      417269616C000A00000000000000000000000000CC00020000000000FFFFFF00
      00000002000000000000000000CA0E000006004D656D6F323300020024000000
      8702000040000000120000000300000001000000000000000000FFFFFF1F2C02
      000000000001000800CFEEEBF3F7E8EB3A00000000FFFF000000000002000000
      01000000000500417269616C000A00000000000000000000000000CC00020000
      000000FFFFFF0000000002000000000000000000610F000006004D656D6F3236
      000200B6010000B4000000D00000001C00000003000000010000000000000000
      00FFFFFF1F2C020000000000010018005B6F647353656C446F63507269682E22
      46435F444F43225D00000000FFFF000000000002000000010000000005004172
      69616C001000000002000000000008000000CC00020000000000FFFFFF000000
      0002000000000000000000E70F000006004D656D6F3239000200A4020000DC02
      000038000000140000000300000001000000000000000000FFFFFF1F2C020000
      000000010007005B50414745235D00000000FFFF000000000002000000010000
      00000500417269616C000A00000000000000000000000000CC00020000000000
      FFFFFF00000000020000000000000000006C10000006004D656D6F3132000200
      14000000FC010000700200001800000003000F0001000000000000000000FFFF
      FF1F2C02000000000001000600C8F2EEE3EE3A00000000FFFF00000000000200
      000001000000000500417269616C000A00000000000000000009000000CC0002
      0000000000FFFFFF00000000020000000000000000000B11000006004D656D6F
      333000020084020000FC010000580000001800000003000F0001000000000000
      000000FFFFFF1F2C020000000000010020005B464F524D4154464C4F41542827
      30F02E3030EA2E272C205B73756D6D5D295D00000000FFFF0000000000020000
      0001000000000500417269616C000A0000000000000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000AB11000006004D656D6F31
      31000200900000002A0100002002000014000000030000000100000000000000
      0000FFFFFF1F2C020000000000010021005B6F647353656C446F63507269682E
      2266635F6D6F67726F757069645F746F225D00000000FFFF0000000000020000
      0001000000000500417269616C000C00000004000000000000000000CC000200
      00000000FFFFFF00000000020000000000000000003C12000006004D656D6F32
      3400020068000000440200009C00000014000000030002000100000000000000
      0000FFFFFF1F2C020000000000010012005B6F64734E616B6C2E22444F4C4F54
      50225D00000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000002000000CC00020000000000FFFFFF0000000002000000
      000000000000C412000006004D656D6F323700020068000000580200009C0000
      00140000000300000001000000000000000000FFFFFF1F2C0200000000000100
      0900C4EEEBE6EDEEF1F2FC00000000FFFF000000000002000000010000000005
      00417269616C000A00000000000000000002000000CC00020000000000FFFFFF
      00000000020000000000000000004313000006004D656D6F3238000200100100
      00440200009C000000140000000300020001000000000000000000FFFFFF1F2C
      0200000000000100000000000000FFFF00000000000200000001000000000500
      417269616C000A00000000000000000000000000CC00020000000000FFFFFF00
      00000002000000000000000000C913000006004D656D6F333100020010010000
      580200009C000000140000000300000001000000000000000000FFFFFF1F2C02
      000000000001000700CFEEE4EFE8F1FC00000000FFFF00000000000200000001
      000000000500417269616C000A00000000000000000002000000CC0002000000
      0000FFFFFF00000000020000000000000000005714000006004D656D6F333200
      0200B401000044020000EC000000140000000300020001000000000000000000
      FFFFFF1F2C02000000000001000F005B6F64734E616B6C2E224F5450225D0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      0000000002000000CC00020000000000FFFFFF00000000020000000000000000
      00E914000006004D656D6F3333000200B401000058020000EC00000014000000
      0300000001000000000000000000FFFFFF1F2C02000000000001001300D0E0F1
      F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF00000000000200000001
      000000000500417269616C000A00000000000000000002000000CC0002000000
      0000FFFFFF00000000020000000000000000007A15000006004D656D6F323000
      020068000000840200009C000000140000000300020001000000000000000000
      FFFFFF1F2C020000000000010012005B6F64734E616B6C2E22444F4C504F4C22
      5D00000000FFFF00000000000200000001000000000500417269616C000A0000
      0000000000000002000000CC00020000000000FFFFFF00000000020000000000
      000000000216000006004D656D6F323500020068000000980200009C00000014
      0000000300000001000000000000000000FFFFFF1F2C02000000000001000900
      C4EEEBE6EDEEF1F2FC00000000FFFF0000000000020000000100000000050041
      7269616C000A00000000000000000002000000CC00020000000000FFFFFF0000
      0000020000000000000000008116000006004D656D6F33340002001001000084
      0200009C000000140000000300020001000000000000000000FFFFFF1F2C0200
      000000000100000000000000FFFF000000000002000000010000000005004172
      69616C000A00000000000000000000000000CC00020000000000FFFFFF000000
      00020000000000000000000717000006004D656D6F3335000200100100009802
      00009C000000140000000300000001000000000000000000FFFFFF1F2C020000
      00000001000700CFEEE4EFE8F1FC00000000FFFF000000000002000000010000
      00000500417269616C000A00000000000000000002000000CC00020000000000
      FFFFFF00000000020000000000000000009517000006004D656D6F3336000200
      B401000084020000EC000000140000000300020001000000000000000000FFFF
      FF1F2C02000000000001000F005B6F64734E616B6C2E22504F4C225D00000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      000002000000CC00020000000000FFFFFF000000000200000000000000000027
      18000006004D656D6F3337000200B401000098020000EC000000140000000300
      000001000000000000000000FFFFFF1F2C02000000000001001300D0E0F1F8E8
      F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF000000000002000000010000
      00000500417269616C000A00000000000000000002000000CC00020000000000
      FFFFFF0000000002000000000000000000AF18000005004D656D6F31000200F4
      01000020000000E8000000730000000300000001000000000000000000FFFFFF
      1F2C02000000000001000A00D3D2C2C5D0C6C4C0DE3A00000000FFFF00000000
      000200000001000000000500417269616C000C00000000000000000000000000
      CC00020000000000FFFFFF0000000002000000000000000000A519000006004D
      656D6F3338000200F800000024000000E8000000730000000300000001000000
      000000000000FFFFFF1F2C02000000000005000A00D3D2C2C5D0C6C4C0DE3A0D
      1300C7E0EC2E20CDE0F7E0EBFCEDE8EAE020EFEE200D1E00EBE5F7E5E1EDEE2D
      EEE7E4EEF0EEE2E8F2E5EBFCEDEEE920F0E0E1EEF2E50D1400CECECE2022D3F0
      E5EDE3EEE9E3E0E7EFF0EEEC220D1C005F5F5F5F5F5F5F5F5F5F5F205B6F6473
      4E616B6C2E22474C4156225D0000000000000000000000020000000100000000
      0500417269616C000C00000000000000000000000000CC00020000000000FFFF
      FF000000000200000000000000FEFEFF020000000A002043617465676F727931
      00000000040073756D6D00010030000000000000000000FC0100000000000000
      0000000000000000005800F296E6282BD2E240E66F9035374DE440}
  end
  object oq: TOracleQuery
    SQL.Strings = (
      'begin'
      ' med.dosetsumdoc(:adpid,:adata1,:adata2);'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A41445049440300000000000000000000000700
      00003A4144415441310C0000000000000000000000070000003A414441544132
      0C0000000000000000000000}
    Cursor = crSQLWait
    Left = 592
    Top = 122
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmPrihList\'
    StoredProps.Strings = (
      'cxDBgPrihKartDBTableView1fc_inv_nomer.Width'
      'cxDBgPrihKartDBTableView1FC_QUOTA_CODE.Width'
      'cxDBgPrihKartDBTableView1FC_SERIAL.Width'
      'cxDBgPrihKartDBTableView1FD_GODEN.Width'
      'cxDBgPrihKartDBTableView1FK_FINSOURCE_ID.Width'
      'cxDBgPrihKartDBTableView1FL_JNVLS.Width'
      'cxDBgPrihKartDBTableView1FN_KOL.Width'
      'cxDBgPrihKartDBTableView1FN_NACENKA.Width'
      'cxDBgPrihKartDBTableView1FN_NDS.Width'
      'cxDBgPrihKartDBTableView1FN_PARTY_NUM.Width'
      'cxDBgPrihKartDBTableView1FN_PRICE.Width'
      'cxDBgPrihKartDBTableView1FN_PRICE_MNF.Width'
      'cxDBgPrihKartDBTableView1FN_SUMM.Width'
      'cxDBgPrihKartDBTableView1MEDICID.Width'
      'cxDBgPrihKartDBTableView1NAMEKART.Width'
      'cxDBgPrihKartDBTableView1ROWNUM.Width'
      'cxDBgPrihKartDBTableView1FC_PRODUCER.Visible'
      'cxDBgPrihKartDBTableView1FC_PRODUCER.Width'
      'cxDBgPrihKartDBTableView1FC_INTERNATIONAL_NAME.Visible'
      'cxDBgPrihKartDBTableView1FC_INTERNATIONAL_NAME.Width')
    StoredValues = <>
    Left = 574
    Top = 346
  end
  object pmAdd: TPopupMenu
    Left = 12
    Top = 102
    object N1: TMenuItem
      Action = ins
    end
    object N2: TMenuItem
      Action = acInsOst
    end
    object miImpNaklSeparator: TMenuItem
      Caption = '-'
    end
    object miImpNakl: TMenuItem
      Action = acImpNakl
    end
    object miRezervSeparator: TMenuItem
      Caption = '-'
    end
    object miFromRezerv: TMenuItem
      Action = acFromRezerv
    end
  end
  object odsOstAct: TOracleDataSet
    SQL.Strings = (
      'select /*+rule*/'
      '    tmo.fc_name,'
      
        '    tmedic.fc_name ||'#39' ('#1087'. '#8470#39'|| tkart.FN_PARTY_NUM||'#39')'#39'as nameme' +
        'dic,'
      '    tei.fc_name as einame,'
      '    TDPC.fn_kol,'
      '    tkart.FN_PRICE,'
      '    TDPC.fn_summ,'
      '    ASU.get_glavfio as glav'
      '  from MED.tdpc, MED.tkart, MED.tmedic, MED.tei, MED.tmo'
      '  where dpid=:adpid'
      '    and tdpc.kartid=tkart.kartid'
      '    and tkart.medicid=tmedic.medicid'
      '    and tmedic.eiid=tei.eiid'
      '    and TKART.fl_del=0'
      '--    AND TMEDIC.FL_VISIBLE = 1'
      '    and tkart.moid = tmo.moid(+)'
      '  order by LOWER(tmedic.fc_name), tkart.FN_PARTY_NUM')
    Optimize = False
    Variables.Data = {0300000001000000060000003A4144504944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000600000045494E414D4501000000000006000000464E5F4B
      4F4C010000000000090000004E414D454D454449430100000000000700000046
      4E5F53554D4D01000000000004000000474C4156010000000000070000004643
      5F4E414D45010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 408
    Top = 258
  end
  object frOstAct: TfrReport
    Dataset = frDBdsNakl
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 408
    Top = 210
    ReportForm = {
      190000006D130000190000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF0000000000000100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000018000000F6020000020100003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E48656164657231000201000000007C010000F60200002000000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200AD0100000B004D6173746572446174613100020100000000B4010000F602
      0000220000003000050001000000000000000000FFFFFF1F000000000A006672
      444264734E616B6C00000000000000FFFF000000000002000000010000000000
      000001000000C800000014000000010000000000000200180200000B00506167
      65466F6F7465723100020100000000D4020000F60200001E0000003000030001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200850200000D004D6173746572466F6F7465723100020100000000FC010000
      F6020000860000003000060001000000000000000000FFFFFF1F000000000000
      00000000000000FFFF000000000002000000010000000000000001000000C800
      0000140000000100000000000000002903000006004D656D6F3730000200F401
      000093000000E8000000150000000300000001000000000000000000FFFFFF1F
      2C0003020C00646420206D6F2020797979790001001900CEF2205B6F64735365
      6C446F63507269682E2244415441225D00000000FFFF00000000000200000001
      000000000500417269616C000C00000000000000000002000000CC0002000000
      0000FFFFFF0000000002000000000000000000D703000005004D656D6F320002
      00C0000000B4000000F80000001C0000000300000001000000000000000000FF
      FFFF1F2C02000000000001001600C0EAF220E2E2EEE4E020EEF1F2E0F2EAEEE2
      2020B9200003000500626567696E0D0A00202073756D6D3A3D303B0D0300656E
      6400FFFF00000000000200000001000000000500417269616C00100000000200
      0000000000000000CC00020000000000FFFFFF00000000020000000000000000
      007404000005004D656D6F3300020018010000E0000000DC0000001400000003
      00000001000000000000000000FFFFFF1F2C00030200000001001F00CEF2205B
      6F647353656C446F63507269682E2246445F494E564F494345225D00000000FF
      FF00000000000200000001000000000500417269616C000C0000000400000000
      0002000000CC00020000000000FFFFFF0000000002000000000000000000FB04
      000005004D656D6F37000200140000007C0100001C0000002000000003000F00
      01000000000000000000FFFFFF1F2C02000000000002000200B9200D0400EF2E
      EF2E00000000FFFF00000000000200000001000000000500417269616C000A00
      00000000000000000A000000CC00020000000000FFFFFF000000000200000000
      00000000008E05000005004D656D6F38000200300000007C0100003C01000020
      00000003000F0001000000000000000000FFFFFF1F2C02000000000001001500
      CDE0E8ECE5EDEEE2E0EDE8E52028EFE0F0F2E8FF2900000000FFFF0000000000
      0200000001000000000500417269616C000A0000000000000000000A000000CC
      00020000000000FFFFFF00000000020000000000000000001406000005004D65
      6D6F390002006C0100007C0100004C0000002000000003000F00010000000000
      00000000FFFFFF1F2C02000000000001000800C5E42E20C8E7EC2E00000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      000A000000CC00020000000000FFFFFF00000000020000000000000000009D06
      000006004D656D6F3130000200B80100007C0100006C0000002000000003000F
      0001000000000000000000FFFFFF1F2C02000000000001000A00CAEEEBE8F7E5
      F1F2E2EE00000000FFFF00000000000200000001000000000500417269616C00
      0A0000000000000000000A000000CC00020000000000FFFFFF00000000020000
      000000000000002007000006004D656D6F3133000200240200007C0100006000
      00002000000003000F0001000000000000000000FFFFFF1F2C02000000000001
      000400D6E5EDE000000000FFFF00000000000200000001000000000500417269
      616C000A0000000000000000000A000000CC00020000000000FFFFFF00000000
      02000000000000000000A407000006004D656D6F3134000200840200007C0100
      00580000002000000003000F0001000000000000000000FFFFFF1F2C02000000
      000001000500D1F3ECECE000000000FFFF000000000002000000010000000005
      00417269616C000A0000000000000000000A000000CC00020000000000FFFFFF
      00000000020000000000000000002D08000006004D656D6F3135000200140000
      00B40100001C0000002200000003000F0001000000000000000000FFFFFF1F2C
      02000000000001000A005B43555252454E54235D00000000FFFF000000000002
      00000001000000000500417269616C000A0000000000000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000C308000006004D656D
      6F313600020030000000B40100003C0100002200000003000F00010000000000
      00000000FFFFFF1F2C020000000000010017005B6F64734F73744163742E224E
      414D454D45444943225D00000000FFFF00000000000200000001000000000500
      417269616C000A00000000000000000008000000CC00020000000000FFFFFF00
      000000020000000000000000005609000006004D656D6F31370002006C010000
      B40100004C0000002200000003000F0001000000000000000000FFFFFF1F2C02
      0000000000010014005B6F64734F73744163742E2245494E414D45225D000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      E909000006004D656D6F3139000200B8010000B40100006C0000002200000003
      000F0001000000000000000000FFFFFF1F2C020000000000010014005B6F6473
      4F73744163742E22464E5F4B4F4C225D00000000FFFF00000000000200000001
      000000000500417269616C000A0000000000000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000980A000006004D656D6F323100
      020024020000B4010000600000002200000003000F0001000000000000000000
      FFFFFF1F2C020000000000010030005B464F524D4154464C4F4154282730F02E
      3030EA2E272C205B6F64734F73744163742E22464E5F5052494345225D295D00
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      0000A20B000006004D656D6F323200020084020000B401000058000000220000
      0003000F0001000000000000000000FFFFFF1F2C020000000000010043005B46
      4F524D4154464C4F4154282730F02E3030EA2E272C205B6F64734F7374416374
      2E22464E5F4B4F4C222A6F64734F73744163742E22464E5F5052494345225D29
      5D0003000500626567696E0D3800202073756D6D3A3D73756D6D202B205B6F64
      734F73744163742E22464E5F4B4F4C222A6F64734F73744163742E22464E5F50
      52494345225D0D0300656E6400FFFF0000000000020000000100000000050041
      7269616C000A0000000000000000000A000000CC00020000000000FFFFFF0000
      0000020000000000000000002E0C000006004D656D6F32330002000C0000004A
      02000058000000120000000300000001000000000000000000FFFFFF1F2C0200
      0000000001000D00C0EAF220F1EEF1F2E0E2E8EB3A0000000001000000000000
      0200000001000000000500417269616C000A00000000000000000000000000CC
      00020000000000FFFFFF0000000002000000000000000000C50C000006004D65
      6D6F3236000200B6010000B2000000D00000001C000000030000000100000000
      0000000000FFFFFF1F2C020000000000010018005B6F647353656C446F635072
      69682E2246435F444F43225D00000000FFFF0000000000020000000100000000
      0500417269616C001000000002000000000008000000CC00020000000000FFFF
      FF00000000020000000000000000004B0D000006004D656D6F3239000200A402
      0000DC02000038000000140000000300000001000000000000000000FFFFFF1F
      2C020000000000010007005B50414745235D00000000FFFF0000000000020000
      0001000000000500417269616C000A00000000000000000000000000CC000200
      00000000FFFFFF0000000002000000000000000000D00D000006004D656D6F31
      3200020014000000FC010000700200001800000003000F000100000000000000
      0000FFFFFF1F2C02000000000001000600C8F2EEE3EE3A00000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000090000
      00CC00020000000000FFFFFF00000000020000000000000000006F0E00000600
      4D656D6F333000020084020000FC010000580000001800000003000F00010000
      00000000000000FFFFFF1F2C020000000000010020005B464F524D4154464C4F
      4154282730F02E3030EA2E272C205B73756D6D5D295D00000000FFFF00000000
      000200000001000000000500417269616C000A0000000000000000000A000000
      CC00020000000000FFFFFF0000000002000000000000000000EE0E000006004D
      656D6F323000020068000000470200009C000000140000000300020001000000
      000000000000FFFFFF1F2C020000000000010000000000000001000000000000
      0200000001000000000500417269616C000A00000000000000000002000000CC
      00020000000000FFFFFF0000000002000000000000000000760F000006004D65
      6D6F3235000200680000005B0200009C00000014000000030000000100000000
      0000000000FFFFFF1F2C02000000000001000900C4EEEBE6EDEEF1F2FC000000
      00010000000000000200000001000000000500417269616C000A000000000000
      00000002000000CC00020000000000FFFFFF0000000002000000000000000000
      F50F000006004D656D6F333400020010010000470200009C0000001400000003
      00020001000000000000000000FFFFFF1F2C0200000000000100000000000000
      010000000000000200000001000000000500417269616C000A00000000000000
      000000000000CC00020000000000FFFFFF00000000020000000000000000007B
      10000006004D656D6F3335000200100100005B0200009C000000140000000300
      000001000000000000000000FFFFFF1F2C02000000000001000700CFEEE4EFE8
      F1FC00000000010000000000000200000001000000000500417269616C000A00
      000000000000000002000000CC00020000000000FFFFFF000000000200000000
      00000000000F11000006004D656D6F3336000200B401000047020000EC000000
      140000000300020001000000000000000000FFFFFF1F2C020000000000010015
      005B6F64734F73744163742E2246435F4E414D45225D00000000010000000000
      000200000001000000000500417269616C000A00000000000000000002000000
      CC00020000000000FFFFFF0000000002000000000000000000A111000006004D
      656D6F3337000200B40100005B020000EC000000140000000300000001000000
      000000000000FFFFFF1F2C02000000000001001300D0E0F1F8E8F4F0EEE2EAE0
      20EFEEE4EFE8F1E8000000000100000000000002000000010000000005004172
      69616C000A00000000000000000002000000CC00020000000000FFFFFF000000
      00020000000000000000002912000005004D656D6F31000200F4010000200000
      00E8000000730000000300000001000000000000000000FFFFFF1F2C02000000
      000001000A00D3D2C2C5D0C6C4C0DE3A00000000FFFF00000000000200000001
      000000000500417269616C000C00000000000000000000000000CC0002000000
      0000FFFFFF00000000020000000000000000001F13000006004D656D6F333800
      0200F800000024000000E8000000730000000300000001000000000000000000
      FFFFFF1F2C02000000000005000A00D3D2C2C5D0C6C4C0DE3A0D1300C7E0EC2E
      20CDE0F7E0EBFCEDE8EAE020EFEE200D1E00EBE5F7E5E1EDEE2DEEE7E4EEF0EE
      E2E8F2E5EBFCEDEEE920F0E0E1EEF2E50D1400CECECE2022D3F0E5EDE3EEE9E3
      E0E7EFF0EEEC220D1C005F5F5F5F5F5F5F5F5F5F5F205B6F64734E616B6C2E22
      474C4156225D0000000000000000000000020000000100000000050041726961
      6C000C00000000000000000000000000CC00020000000000FFFFFF0000000002
      00000000000000FEFEFF020000000A002043617465676F727931000000000400
      73756D6D00010030000000000000000000FC0100000000000000000000000000
      0000005800F296E6282BD2E240E66F9035374DE440}
  end
  object frLittleKart: TfrReport
    Dataset = frDBDataSet
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit, pbPageSetup]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 288
    Top = 110
    ReportForm = {
      19000000A80A0000190000000001000100FFFFFFFFFF09000000340800009A0B
      00002400000024000000240000002400000000FFFF0000FFFFFFFF0200000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200D50000000B004D61737465724461746131000201000000
      0024000000F6020000C00000003000050001000000000000000000FFFFFF1F00
      0000000B00667244424461746153657400000000000000FFFF00000000000200
      0000010000000000000001000000C80000001400000001000000000000000051
      01000005004D656D6F310002004D0000002D0000000B010000AC00000003000F
      0001000000000000000000FFFFFF1F2C02000000000000000000000001000000
      0000000200000001000000000500417269616C00090000000000000000000000
      0000CC00020000000000FFFFFF0000000002000000000000000000E601000005
      004D656D6F330002004F0000003A000000070100002A00000003000000010000
      00000000000000FFFFFF1F2C020000000000010017005B6F64734D65644B6172
      742E2246435F4D45444943225D00000000FFFF00000000000200000001000000
      000500417269616C000B00000002000000FF000A000000CC00020000000000FF
      FFFF00000000020000000000000000006C02000005004D656D6F350002004E00
      0000B700000031000000100000000300000001000000000000000000FFFFFF1F
      2C02000000000001000800C5E42E20E8E7EC2E00000000FFFF00000000000200
      000001000000000500417269616C000900000002000000000000000000CC0002
      0000000000FFFFFF0000000002000000000000000000F102000005004D656D6F
      360002004E000000C80000003200000010000000030000000100000000000000
      0000FFFFFF1F2C02000000000001000700CAEEEB2DE2EE3A00000000FFFF0000
      0000000200000001000000000500417269616C00090000000200000000000800
      0000CC00020000000000FFFFFF00000000020000000000000000008503000006
      004D656D6F31320002007D000000C80000007100000010000000030000000100
      0000000000000000FFFFFF1F2C020000000000010015005B6F64734D65644B61
      72742E22464E5F4B4F4C225D00000000FFFF0000000000020000000100000000
      0500417269616C00090000000200000000000A000000CC00020000000000FFFF
      FF00000000020000000000000000002B04000006004D656D6F3133000200C900
      0000620000008E000000180000000300000001000000000000000000FFFFFF1F
      2C020401100023232320232323202323302E303020F000010017005B6F64734D
      65644B6172742E22464E5F5052494345225D00000000FFFF0000000000020000
      0001000000000500417269616C000E0000000200FF0000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000CB04000006004D656D6F31
      34000200F6000000B80000006100000010000000030000000100000000000000
      0000FFFF00002C0000000A0064642E6D6D2E7979797900010017005B6F64734D
      65644B6172742E2246435F474F44454E225D00000000FFFF0000000000020000
      0001000000000500417269616C00090000000200000000000A000000CC000200
      00000000FFFFFF00000000020000000000000000006205000006004D656D6F31
      350002007D000000AC000000710000001C000000030002000100000000000000
      0000FFFFFF1F2C020000000000010018005B6F64734D65644B6172742E224643
      5F554544495A4D225D00000000FFFF0000000000020000000100000000050041
      7269616C000900000002000000000012000000CC00020000000000FFFFFF0000
      000002000000000000000000F405000006004D656D6F31370002004F0000002E
      000000080100000C0000000300000001000000000000000000FFFFFF1F2C0200
      0000000001001300D1D2C5CBCBC0C6CDC0DF20CAC0D0D2CED7CAC000000000FF
      FF00000000000200000001000000000500417269616C000A0000000200000000
      000A0000000100020000000000FFFFFF00000000020000000000000000008006
      000005004D656D6F32000200C90000007D0000008E0000000D00000003000800
      01000000000000000000FFFFFF1F2C02000000000001000E00F6E5EDE020F0EE
      E7EDE8F7EDE0FF00000000FFFF00000000000200000001000000000500417269
      616C0007000000000000000000020000000100020000000000FFFFFF00000000
      020000000000000000001C07000006004D656D6F31380002004E000000860000
      00A10000001C0000000300000001000000000000000000FFFFFF1F2C02000000
      000001001D005B6F64734D65644B6172742E2246435F504F535441565F4E414D
      45225D00000000FFFF00000000000200000001000000000500417269616C0009
      000000020000000000120000000100020000000000FFFFFF0000000002000000
      000000000000A407000006004D656D6F31390002004E000000A2000000A10000
      000B0000000300080001000000000000000000FFFFFF1F2C0200000000000100
      0900EFEEF1F2E0E2F9E8EA00000000FFFF000000000002000000010000000005
      00417269616C0007000000000000000000020000000100020000000000FFFFFF
      00000000020000000000000000004308000006004D656D6F3231000200F60000
      008F00000061000000100000000300000001000000000000000000FFFFFF1F2C
      0004020A0064642E6D6D2E7979797900010016005B6F64734D65644B6172742E
      2266645F64617461225D00000000FFFF00000000000200000001000000000500
      417269616C00090000000200000000000A000000CC00020000000000FFFFFF00
      00000002000000000000000000D208000006004D656D6F3230000200F6000000
      A2000000610000000C0000000300080001000000000000000000FFFFFF1F2C02
      000000000001001000E4E0F2E020EFEEF1F2F3EFEBE5EDE8FF00000000FFFF00
      000000000200000001000000000500417269616C000700000000000000000002
      0000000100020000000000FFFFFF000000000200000000000000000068090000
      05004D656D6F340002004E00000061000000760000001C000000030000000100
      0000000000000000FFFFFF1F2C020000000000010018005B6F64734D65644B61
      72742E2246435F53455249414C225D00000000FFFF0000000000020000000100
      0000000500417269616C00090000000200000000001200000001000200000000
      00FFFFFF0000000002000000000000000000EB09000005004D656D6F38000200
      4E0000007D000000760000000B0000000300080001000000000000000000FFFF
      FF1F2C02000000000001000500F1E5F0E8FF00000000FFFF0000000000020000
      0001000000000500417269616C00070000000000000000000200000001000200
      00000000FFFFFF0000000002000000000000000000760A000005004D656D6F39
      000200F6000000C8000000610000000C00000003000800010000000000000000
      00FFFF00002C02000000000001000D00D1F0EEEA20E3EEE4EDEEF1F2E8000000
      00FFFF00000000000200000001000000000500417269616C0007000000000000
      000000020000000100020000000000FFFFFF000000000200000000000000FEFE
      FF000000000000000000000000FC000000000000000000000000000000005800
      5ADC09E273E7E240E66F9035374DE440}
  end
  object frDBDataSet: TfrDBDataSet
    DataSet = odsMedKart
    Left = 346
    Top = 110
  end
  object odsMedKart: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  -- '#1087#1086#1083#1103' '#1087#1072#1088#1090#1080#1080
      '  K.KARTID,'
      '  MED.PKGMEDKART.getfc_name_latbyid(K.KARTID) FC_LAT_NAME,'
      '  K.fn_party_num,'
      '  K.FD_GODEN,'
      
        '  DECODE(K.FD_GODEN, null, '#39#1085#1077#1090#39',  TO_CHAR(K.FD_GODEN,'#39'dd.mm.yyy' +
        'y'#39')) as FC_GODEN,'
      '  K.FC_SERIAL,'
      '  K.FC_INV_NOMER,'
      '  K.FN_PRICE,'
      '  dpc.fn_kol, -- '#1085#1072#1095#1072#1083#1100#1085#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1072#1088#1090#1080#1080
      '  pc.pfc_value as FC_PROD,'
      '  pc.Sfc_value as FC_SERT,'
      ''
      '  MED.PKGTPOSTAV.GetNameByID(D.postavid) as FC_POSTAV_NAME,'
      
        '  med.GET_DECODEDOCVIDMOVE(D.fp_vidmove)||'#39' '#8470' '#39'||D.fc_doc||'#39' '#1086#1090' ' +
        #39'||to_char(D.fd_invoice,'#39'dd.mm.yyyy'#39') AS fc_docmix,'
      '  D.fd_invoice,'
      '  d.fd_data,'
      '  d.fc_doc,'
      '  d.fc_schet_faktura,'
      '  -- '#1087#1086#1083#1103' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
      '  M.fc_name as FC_MEDIC,'
      '  EI1.fc_name as FC_UEDIZM,'
      '  M.fc_eancode,'
      '--  M.fk_paytype, PT.fc_name as FC_PAYTYPE,'
      '  M.fn_fpackinupack,'
      '  M.fk_fpackid,  EI2.fc_name FC_FEDIZM,'
      '  fs.fc_name as fc_finsource'
      'FROM'
      
        '     MED.TDOCS D, MED.TDPC DPC, MED.TKART K, MED.TMEDIC M, MED.T' +
        'EI EI1, MED.TEI EI2, '
      
        '     -- '#1085#1086#1074#1072#1103' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1103', '#1089#1086#1084#1074#1077#1089#1090#1080#1084#1072#1103' '#1089' 8i (04.04.2008 '#1042#1086#1088#1086#1085#1086#1074' '#1054 +
        '.'#1040'.)'
      
        '     (select -- pfc_value - '#1085#1072#1079#1074#1072#1085#1080#1103' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1077#1081', Sfc_value -' +
        ' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1099
      
        '        p1.FK_ID as PFK_ID, p1.fn_parent as pfn_parent, nvl(p1.f' +
        'c_value, p2.fc_value) as  pfc_value             -- '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      
        '        ,p2.FK_ID as SFK_ID, p2.fn_parent as Sfn_parent, decode(' +
        'p1.FK_ID, null, null, p2.fc_value) as Sfc_value -- '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090
      
        '      from med.tprodcert  p1, med.tprodcert p2 where p1.fk_id(+)' +
        ' = p2.fn_parent) pc,'
      '      MED.TFINSOURCE fs'
      ''
      'WHERE'
      '        D.dpid   =  :DOC_ID'
      '    AND DPC.dpid = :DOC_ID    '
      '    AND K.kartid = DPC.kartid'
      '    AND K.medicid = M.medicid -- '#1087#1088#1080#1074#1103#1079#1082#1072' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072' '#1082' '#1087#1072#1088#1090#1080#1080
      '    AND K.FL_DEL = 0'
      '    AND k.fn_prodcertid = pc.SFK_ID(+)'
      
        '-- '#1076#1072#1083#1077#1077' '#1080#1076#1091#1090' '#1091#1089#1083#1086#1074#1080#1103' '#1087#1088#1080#1074#1103#1079#1082#1080' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072' '#1082' '#1084#1077#1076#1080#1082 +
        #1072#1084#1077#1085#1090#1091
      '    AND M.eiid = EI1.eiid(+)'
      '    AND M.fk_fpackid = EI2.eiid(+)'
      '    and k.FK_FINSOURCE_ID = fs.FK_ID(+)')
    Optimize = False
    Variables.Data = {0300000001000000070000003A444F435F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000110000000800000046435F4D45444943010000000000080000004644
      5F474F44454E0100000000000900000046435F53455249414C01000000000006
      000000464E5F4B4F4C010000000000060000004B415254494401000000000008
      000000464E5F50524943450100000000000A00000046435F45414E434F444501
      00000000000900000046435F554544495A4D0100000000000F000000464E5F46
      5041434B494E555041434B0100000000000A000000464B5F465041434B494401
      00000000000900000046435F464544495A4D0100000000000C000000464E5F50
      415254595F4E554D0100000000000B00000046435F4C41545F4E414D45010000
      0000000700000046435F50524F440100000000000E00000046435F504F535441
      565F4E414D450100000000000900000046435F444F434D49580100000000000A
      00000046445F494E564F494345010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 414
    Top = 108
  end
  object pmPrint: TPopupMenu
    Left = 355
    Top = 50
    object miNakl: TMenuItem
      Action = acPrintNakl
    end
    object miNaklPeriod: TMenuItem
      Action = acPrintNaklsInPeriod
    end
    object miNaklM4: TMenuItem
      Tag = 1
      Action = acPrintNaklM4
    end
    object miLittleKart: TMenuItem
      Action = acPrintLittleKart
    end
    object miLittleKart1: TMenuItem
      Action = acPrintLittleKart1
    end
  end
  object odsKart: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWNUM, A.*'
      '  FROM (SELECT TDPC.DPCID,'
      
        '               TMEDIC.FC_NAME AS NAMEKART, -- '#1087#1086#1076#1089#1090#1072#1074#1072'. '#1088#1072#1085#1100#1096#1077' '#1079 +
        #1076#1077#1089#1100' '#1086#1090#1086#1073#1088#1072#1078#1072#1083#1072#1089#1100' '#1080#1084#1103' '#1082#1072#1088#1090#1086#1095#1082#1080', '#1090#1077#1087#1077#1088#1100' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
      '               TKART.MEDICID,'
      '               TKART.FN_PARTY_NUM,'
      '               TKART.FD_GODEN,'
      '               TDPC.FN_KOL,'
      '               TKART.FN_PRICE * TDPC.FN_KOL AS FN_SUMM,'
      '               --TDPC.FN_SUMM,'
      
        '               --  DECODE(TDPC.FN_KOL,0,0,ROUND(TDPC.FN_SUMM / T' +
        'DPC.FN_KOL,2)) AS FN_PRICE,'
      '               TKART.FN_PRICE,'
      '               TKART.KARTID,'
      '               --  TKART.FC_NAME AS NAMEKART,'
      '               TKART.FC_SERIAL,'
      '               TEI.FC_NAME           AS FC_EDIZM,'
      '               TKART.FK_FINSOURCE_ID,'
      '               TKART.FC_INV_NOMER,'
      '               TKART.FC_QUOTA_CODE,'
      '               TKART.FN_NDS,'
      '               TKART.FN_NACENKA,'
      '               TKART.FN_PRICE_MNF,'
      '               TKART.FL_JNVLS,'
      '               TMEDIC.FL_MIBP,'
      '               TMEDIC.FC_INTERNATIONAL_NAME,'
      '               TMEDIC.FL_FORMULAR,'
      '               TPRODCERT.FC_VALUE FC_PRODUCER'
      
        '          FROM MED.TDPC, MED.TKART, MED.TMEDIC, MED.TEI, MED.TPR' +
        'ODCERT'
      '         WHERE DPID = :ADPID'
      '           AND TDPC.KARTID = TKART.KARTID'
      '           AND TKART.FL_DEL = 0'
      '           AND TMEDIC.MEDICID = TKART.MEDICID'
      '           AND TMEDIC.EIID = TEI.EIID(+)'
      '           AND TKART.FN_PRODCERTID = TPRODCERT.FK_ID(+)'
      '        --ORDER BY TDPC.DPCID'
      '         ORDER BY LOWER(TMEDIC.FC_NAME)) A')
    Optimize = False
    Variables.Data = {0300000001000000060000003A4144504944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000D000000080000004E414D454B415254010000000000060000004B41
      5254494401000000000006000000464E5F4B4F4C010000000000070000004D45
      444943494401000000000005000000445043494401000000000007000000464E
      5F53554D4D01000000000006000000524F574E554D0100000000000900000046
      435F53455249414C01000000000008000000464E5F5052494345010000000000
      0C000000464E5F50415254595F4E554D0100000000000800000046445F474F44
      454E0100000000000800000046435F4544495A4D0100000000000F000000464B
      5F46494E534F555243455F4944010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 172
    Top = 436
  end
  object dsKart: TDataSource
    DataSet = odsKart
    Left = 120
    Top = 426
  end
  object pmDocsFilterPeriod: TPopupMenu
    Left = 608
    Top = 48
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
  object frReturnRep: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 540
    Top = 182
    ReportForm = {
      190000000F1A0000190000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF0000000000000100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000014000000F60200004A0100003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E48656164657231000201000000007C010000F60200002000000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200AD0100000B004D6173746572446174613100020100000000B4010000F602
      0000180000003000050001000000000000000000FFFFFF1F000000000A006672
      444264734E616B6C00000000000000FFFF000000000002000000010000000000
      000001000000C8000000140000000100000000000002001A0200000D004D6173
      746572466F6F7465723100020100000000FC010000F6020000C6000000300006
      0001000000000000000000FFFFFF1F00000000000000000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000000AB02000006004D656D6F3730000200F401000088000000E800000014
      0000000300000001000000000000000000FFFFFF1F2C0003020C00646420206D
      6F20207979797900010006005B444154455D00000000FFFF0000000000020000
      0001000000000500417269616C000C00000000000000000002000000CC000200
      00000000FFFFFF00000000020000000000000000008A03000005004D656D6F32
      00020010000000B0000000D00200001C00000003000000010000000000000000
      00FFFFFF1F2C02000000000001004500CDE0EAEBE0E4EDE0FF20EDE020E2EEE7
      E2F0E0F220ECE5E4E8EAE0ECE5EDF2EEE220E220E0EFF2E5EAF320B9205B6F64
      7353656C446F634D6F76652E2246435F444F43225D0003000500626567696E0D
      0C00202073756D6D3A3D303B20200D0300656E6400FFFF000000000002000000
      01000000000500417269616C001000000002000000000002000000CC00020000
      000000FFFFFF00000000020000000000000000002204000005004D656D6F3300
      02000A010000D4000000DC000000140000000300000001000000000000000000
      FFFFFF1F2C00030200000001001A00CEF2205B6F647353656C446F634D6F7665
      2E2244415441225D2000000000FFFF0000000000020000000100000000050041
      7269616C000C00000004000000000002000000CC00020000000000FFFFFF0000
      000002000000000000000000B204000005004D656D6F34000200280000000C01
      000058000000280000000300000001000000000000000000FFFFFF1F2C020000
      00000002000400C4EBFF3A0D0B00D7E5F0E5E720EAEEE3EE3A00000000FFFF00
      000000000200000001000000000500417269616C000C00000000000000000000
      000000CC00020000000000FFFFFF000000000200000000000000000048050000
      05004D656D6F350002008400000008010000C000000014000000030000000100
      0000000000000000FFFFFF1F2C020000000000010018005B6F647353656C446F
      634D6F76652E224E414D45544F225D00000000FFFF0000000000020000000100
      0000000500417269616C000C00000004000000000000000000CC000200000000
      00FFFFFF0000000002000000000000000000FF05000005004D656D6F36000200
      800000001C01000024020000140000000300000001000000000000000000FFFF
      FF1F2C020000000000010039005B6F647353656C446F634D6F76652E2246435F
      434F4D4D454E54225D202D205B6F647353656C446F634D6F76652E224E414D45
      46524F4D225D00000000FFFF0000000000020000000100000000050041726961
      6C000C00000004000000000000000000CC00020000000000FFFFFF0000000002
      0000000000000000008606000005004D656D6F37000200140000007C0100001C
      0000002000000003000F0001000000000000000000FFFFFF1F2C020000000000
      02000200B9200D0400EF2EEF2E00000000FFFF00000000000200000001000000
      000500417269616C000A0000000000000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000001007000005004D656D6F380002003000
      00007C0100003C0100002000000003000F0001000000000000000000FFFFFF1F
      2C02000000000001000C00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF000000
      00000200000001000000000500417269616C000A0000000000000000000A0000
      00CC00020000000000FFFFFF0000000002000000000000000000960700000500
      4D656D6F390002006C0100007C0100004C0000002000000003000F0001000000
      000000000000FFFFFF1F2C02000000000001000800C5E42E20C8E7EC2E000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      1F08000006004D656D6F3130000200B80100007C0100006C0000002000000003
      000F0001000000000000000000FFFFFF1F2C02000000000001000A00CAEEEBE8
      F7E5F1F2E2EE00000000FFFF0000000000020000000100000000050041726961
      6C000A0000000000000000000A000000CC00020000000000FFFFFF0000000002
      000000000000000000A208000006004D656D6F3133000200240200007C010000
      600000002000000003000F0001000000000000000000FFFFFF1F2C0200000000
      0001000400D6E5EDE000000000FFFF0000000000020000000100000000050041
      7269616C000A0000000000000000000A000000CC00020000000000FFFFFF0000
      0000020000000000000000002609000006004D656D6F3134000200840200007C
      010000580000002000000003000F0001000000000000000000FFFFFF1F2C0200
      0000000001000500D1F3ECECE000000000FFFF00000000000200000001000000
      000500417269616C000A0000000000000000000A000000CC00020000000000FF
      FFFF0000000002000000000000000000AF09000006004D656D6F313500020014
      000000B40100001C0000001800000003000F0001000000000000000000FFFFFF
      1F2C02000000000001000A005B43555252454E54235D00000000FFFF00000000
      000200000001000000000500417269616C000A0000000000000000000A000000
      CC00020000000000FFFFFF0000000002000000000000000000430A000006004D
      656D6F313600020030000000B40100003C0100001800000003000F0001000000
      000000000000FFFFFF1F2C020000000000010015005B6F64736E616B6C2E224E
      414D454D45444943225D00000000FFFF00000000000200000001000000000500
      417269616C000A00000000000000000008000000CC00020000000000FFFFFF00
      00000002000000000000000000D40A000006004D656D6F31370002006C010000
      B40100004C0000001800000003000F0001000000000000000000FFFFFF1F2C02
      0000000000010012005B6F64736E616B6C2E2245494E414D45225D00000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      000A000000CC00020000000000FFFFFF0000000002000000000000000000650B
      000006004D656D6F3139000200B8010000B40100006C0000001800000003000F
      0001000000000000000000FFFFFF1F2C020000000000010012005B6F64734E61
      6B6C2E22464E5F4B4F4C225D00000000FFFF0000000000020000000100000000
      0500417269616C000A0000000000000000000A000000CC00020000000000FFFF
      FF00000000020000000000000000000F0C000006004D656D6F32310002002402
      0000B4010000600000001800000003000F0001000000000000000000FFFFFF1F
      2C02000000000001002B005B464F524D4154464C4F4154282730F02E3030EA2E
      272C205B6F64736E616B6C2E227072696365225D295D00000000FFFF00000000
      000200000001000000000500417269616C000A0000000000000000000A000000
      CC00020000000000FFFFFF0000000002000000000000000000ED0C000006004D
      656D6F323200020084020000B4010000580000001800000003000F0001000000
      000000000000FFFFFF1F2C02000000000001002D005B464F524D4154464C4F41
      54282730F02E3030EA2E272C205B6F64736E616B6C2E22464E5F73756D6D225D
      295D0003000500626567696E0D2200202073756D6D3A3D73756D6D202B205B6F
      64734E616B6C2E22464E5F73756D6D225D0D0300656E6400FFFF000000000002
      00000001000000000500417269616C000A0000000000000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000780D000006004D656D
      6F31380002002C00000058020000540000001000000003000000010000000000
      00000000FFFFFF1F2C02000000000001000C00CEF2EFF3F1F2E8EB28E0293A00
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      000000000001000000CC00020000000000FFFFFF000000000200000000000000
      0000000E000006004D656D6F3233000200380000002402000048000000120000
      000300000001000000000000000000FFFFFF1F2C02000000000001000900CFEE
      EBF3F7E8EBE03A00000000FFFF00000000000200000001000000000500417269
      616C000A00000000000000000000000000CC00020000000000FFFFFF00000000
      02000000000000000000850E000006004D656D6F313200020014000000FC0100
      00700200001800000003000F0001000000000000000000FFFFFF1F2C02000000
      000001000600C8F2EEE3EE3A00000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000009000000CC00020000000000FFFF
      FF0000000002000000000000000000240F000006004D656D6F33300002008402
      0000FC010000580000001800000003000F0001000000000000000000FFFFFF1F
      2C020000000000010020005B464F524D4154464C4F4154282730F02E3030EA2E
      272C205B73756D6D5D295D00000000FFFF000000000002000000010000000005
      00417269616C000A0000000000000000000A000000CC00020000000000FFFFFF
      0000000002000000000000000000AB0F000006004D656D6F3335000200880000
      00240200009C000000140000000300020001000000000000000000FFFFFF1F2C
      02000000000001000800CFF0EEE2E8E7EEF000000000FFFF0000000000020000
      0001000000000500417269616C000A00000000000000000002000000CC000200
      00000000FFFFFF00000000020000000000000000003310000006004D656D6F33
      3600020088000000380200009C00000014000000030000000100000000000000
      0000FFFFFF1F2C02000000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      02000000CC00020000000000FFFFFF0000000002000000000000000000B21000
      0006004D656D6F333700020030010000240200009C0000001400000003000200
      01000000000000000000FFFFFF1F2C0200000000000100000000000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000000
      000000CC00020000000000FFFFFF000000000200000000000000000038110000
      06004D656D6F333800020030010000380200009C000000140000000300000001
      000000000000000000FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC00
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      000000000002000000CC00020000000000FFFFFF000000000200000000000000
      0000C711000006004D656D6F3339000200D401000024020000EC000000140000
      000300020001000000000000000000FFFFFF1F2C020000000000010010005B6F
      64734E616B6C2E2250524F56225D00000000FFFF000000000002000000010000
      00000500417269616C000A00000000000000000002000000CC00020000000000
      FFFFFF00000000020000000000000000005912000006004D656D6F3430000200
      D401000038020000EC000000140000000300000001000000000000000000FFFF
      FF1F2C02000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E8
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      00000000000002000000CC00020000000000FFFFFF0000000002000000000000
      000000EA12000006004D656D6F323000020088000000560200009C0000001400
      00000300020001000000000000000000FFFFFF1F2C020000000000010012005B
      6F64734E616B6C2E22444F4C4F5450225D00000000FFFF000000000002000000
      01000000000500417269616C000A00000000000000000002000000CC00020000
      000000FFFFFF00000000020000000000000000007213000006004D656D6F3234
      000200880000006A0200009C0000001400000003000000010000000000000000
      00FFFFFF1F2C02000000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000002
      000000CC00020000000000FFFFFF0000000002000000000000000000F1130000
      06004D656D6F323500020030010000560200009C000000140000000300020001
      000000000000000000FFFFFF1F2C0200000000000100000000000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000000
      0000CC00020000000000FFFFFF00000000020000000000000000007714000006
      004D656D6F3236000200300100006A0200009C00000014000000030000000100
      0000000000000000FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      0000000002000000CC00020000000000FFFFFF00000000020000000000000000
      000515000006004D656D6F3237000200D401000056020000EC00000014000000
      0300020001000000000000000000FFFFFF1F2C02000000000001000F005B6F64
      734E616B6C2E224F5450225D00000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000002000000CC00020000000000FFFF
      FF00000000020000000000000000009715000006004D656D6F3238000200D401
      00006A020000EC000000140000000300000001000000000000000000FFFFFF1F
      2C02000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E80000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      0000000002000000CC00020000000000FFFFFF00000000020000000000000000
      001F16000006004D656D6F333100020088000000840200009C00000014000000
      0300020001000000000000000000FFFFFF1F2C02000000000001000900C1F3F5
      E3E0EBF2E5F000000000FFFF0000000000020000000100000000050041726961
      6C000A00000000000000000002000000CC00020000000000FFFFFF0000000002
      000000000000000000A716000006004D656D6F33320002008800000098020000
      9C000000140000000300000001000000000000000000FFFFFF1F2C0200000000
      0001000900C4EEEBE6EDEEF1F2FC00000000FFFF000000000002000000010000
      00000500417269616C000A00000000000000000002000000CC00020000000000
      FFFFFF00000000020000000000000000002617000006004D656D6F3333000200
      30010000840200009C000000140000000300020001000000000000000000FFFF
      FF1F2C0200000000000100000000000000FFFF00000000000200000001000000
      000500417269616C000A00000000000000000000000000CC00020000000000FF
      FFFF0000000002000000000000000000AC17000006004D656D6F333400020030
      010000980200009C000000140000000300000001000000000000000000FFFFFF
      1F2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF00000000000200
      000001000000000500417269616C000A00000000000000000002000000CC0002
      0000000000FFFFFF00000000020000000000000000003A18000006004D656D6F
      3431000200D401000084020000EC000000140000000300020001000000000000
      000000FFFFFF1F2C02000000000001000F005B6F64734E616B6C2E2242554822
      5D00000000FFFF00000000000200000001000000000500417269616C000A0000
      0000000000000002000000CC00020000000000FFFFFF00000000020000000000
      00000000CC18000006004D656D6F3432000200D401000098020000EC00000014
      0000000300000001000000000000000000FFFFFF1F2C02000000000001001300
      D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF00000000000200
      000001000000000500417269616C000A00000000000000000002000000CC0002
      0000000000FFFFFF0000000002000000000000000000C119000005004D656D6F
      31000200F401000018000000E800000070000000030000000100000000000000
      0000FFFFFF1F2C02000000000005000A00D3D2C2C5D0C6C4C0DE3A0D1300C7E0
      EC2E20CDE0F7E0EBFCEDE8EAE020EFEE200D1E00EBE5F7E5E1EDEE2DEEE7E4EE
      F0EEE2E8F2E5EBFCEDEEE920F0E0E1EEF2E50D1400CECECE2022D3F0E5EDE3EE
      E9E3E0E7EFF0EEEC220D1C005F5F5F5F5F5F5F5F5F5F5F205B6F64734E616B6C
      2E22474C4156225D00000000FFFF000000000002000000010000000005004172
      69616C000C00000000000000000000000000CC00020000000000FFFFFF000000
      000200000000000000FEFEFF020000000A002043617465676F72793100000000
      040073756D6D00010030000000000000000000FC010000000000000000000000
      000000000058000ACF5E302ED2E2401C769035374DE440}
  end
  object frDBDataSet1: TfrDBDataSet
    Left = 700
    Top = 188
  end
  object frDBdsInvoice: TfrDBDataSet
    DataSet = odsInvoice2
    Left = 110
    Top = 166
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
      ') A'
      ''
      '/*'
      '--'#1090#1088#1077#1073#1086#1074#1072#1085#1080#1077
      'SELECT'
      '    ROWNUM,'
      '    B.*'
      '  FROM '
      '   (SELECT *'
      '      FROM'
      '       (SELECT '
      '            b.fk_dpid AS dpid,'
      '            d.fk_id,'
      '            d.fk_dpcid AS dpcid,'
      '            d.fk_medicid AS medicid,'
      '            d.fn_kol AS fn_trebkol,'
      
        '            CASE WHEN d.fk_medicid = nvl(k.medicid,d.fk_medicid)' +
        ' THEN nvl(c.fn_kol,0) ELSE 0 END AS fn_kol, '
      
        '            CASE WHEN d.fk_medicid = nvl(k.medicid,d.fk_medicid)' +
        ' THEN nvl((c.fn_kol * k.fn_price),0) ELSE 0 END AS summ, '
      '            k.kartid,'
      '            k.fn_price,'
      '            k.medicid AS kmedicid,'
      '            m.fc_name AS NAMEKART,'
      '            k.fc_serial,'
      '            e.fc_name AS fc_edizm,'
      '            0 AS ODR'
      '          FROM MED.TTreb_Dpc d, MED.TMedic m, MED.Tei e,'
      '            MED.TDpc c, MED.TKart k, MED.TTreb b'
      '          WHERE b.fk_dpid = :ADPID'
      '            AND d.fk_medicid = m.medicid'
      '            AND e.eiid = m.eiid'
      '            AND d.fk_dpcid = c.dpcid (+)'
      '            AND c.kartid = k.kartid (+)'
      '            AND d.fk_trebid = b.fk_id'
      '            AND M.FL_VISIBLE = 1'
      ''
      '        UNION ALL'
      '        --'#1079#1072#1084#1077#1085#1099' '#1074' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103#1093
      '        SELECT '
      '            b.fk_dpid AS dpid,'
      '            d.fk_id,'
      '            d.fk_dpcid AS dpcid,'
      '            d.fk_medicid AS medicid,'
      '            0 AS fn_trebkol,'
      '            c.fn_kol AS fn_kol, '
      '            (c.fn_kol * k.fn_price) AS summ, '
      '            k.kartid,'
      '            k.fn_price,'
      '            k.medicid AS kmedicid,'
      '            K.fc_name AS NAMEKART,'
      '            k.fc_serial,'
      '            e.fc_name AS fc_edizm,'
      '            1 AS ODR'
      '          FROM MED.TTreb_Dpc d, MED.TMedic m, MED.Tei e,'
      '            MED.TDpc c, MED.TKart k, MED.TTreb b'
      '          WHERE b.fk_dpid = :ADPID'
      '            AND d.fk_medicid = m.medicid'
      '            AND e.eiid = m.eiid'
      '            AND d.fk_dpcid = c.dpcid (+)'
      '            AND c.kartid = k.kartid (+)'
      '            AND d.fk_medicid != nvl(k.medicid,d.fk_medicid)'
      '            AND d.fk_trebid = b.fk_id'
      '            AND M.FL_VISIBLE = 1'
      ''
      '        UNION ALL'
      '        --'#1088#1091#1095#1085#1086#1077' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1077
      '        SELECT'
      '            TDPC.Dpid,'
      '            9999999999 AS FK_ID,'
      '           '#9'TDPC.DPCID,'
      '           '#9'TKART.MEDICID,'
      '            FN_TREBKOL,'
      '           '#9'TDPC.FN_KOL,'
      '           '#9'(TDPC.FN_KOL * TKART.FN_PRICE) AS SUMM,'
      '           '#9'TKART.KARTID,'
      '              TKART.FN_PRICE,'
      '            TKart.MEDICID AS kmedicid,'
      '           '#9'TKART.FC_NAME AS NAMEKART,'
      '            TKART.FC_SERIAL,'
      
        '            MED.pkgtmedic.getedizmname(tkart.medicid) as fc_ediz' +
        'm,'
      '            2 AS ODR'
      '          FROM MED.TDPC,'#9'MED.TKART'
      '          WHERE DPID = :ADPID'
      '           '#9'AND TDPC.KARTID = TKART.KARTID'
      '           '#9'AND FL_DEL = 0'
      
        '            AND NOT EXISTS (SELECT 1 FROM MED.TTREB_DPC WHERE TD' +
        'PC.DPCID = FK_DPCID )'
      '       ) A'
      '      ORDER BY FK_ID'
      '   ) B'
      ''
      '*/')
    Optimize = False
    Variables.Data = {0300000001000000060000003A4144504944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E00000005000000445043494401000000000006000000464E5F4B4F
      4C010000000000060000004B4152544944010000000000070000004D45444943
      49440100000000000800000046435F4544495A4D0100000000000A000000464E
      5F545245424B4F4C01000000000006000000524F574E554D0100000000000400
      00004450494401000000000005000000464B5F49440100000000000400000053
      554D4D010000000000080000004B4D454449434944010000000000080000004E
      414D454B4152540100000000000900000046435F53455249414C010000000000
      030000004F4452010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 48
    Top = 186
  end
  object frInvoice2: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    Title = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077
    RebuildPrinter = False
    OnGetValue = frInvoice2GetValue
    Left = 48
    Top = 138
    ReportForm = {
      19000000AE310000190000000001000100FFFFFFFFFF09000000340800009A0B
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
      00010018005B6F647353656C446F63507269682E2246435F444F43225D000000
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
      0000000000B60D000006004D656D6F3230000200EC000000070100004C010000
      140000000300020001000000000000000000FFFFFF1F2C020000000000010018
      005B6F647353656C446F63507269682E224E414D45544F225D00030005006265
      67696E0D0A002F2F5B7661725F6D6F5D0D0300656E6400FFFF00000000000200
      000001000000000F0054696D6573204E657720526F6D616E000A000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      4E0E000006004D656D6F3231000200480100001C0100007C0000001400000003
      00000001000000000000000000FFFFFF1F2C02000000000001000F00C4EEEBE6
      EDEEF1F2FC202F20D4C8CE00000000FFFF00000000000200000001000000000F
      0054696D6573204E657720526F6D616E000A00000000000000000002000000CC
      00020000000000FFFFFF0000000002000000000000000000E30E000006004D65
      6D6F33390002002000000000020000A800000010000000030000000100000000
      0000000000FFFFFF1F2C02000000000001001600C7E0E2E5E4F3FEF9E8E920EE
      F2E4E5EBE5EDE8E5EC3A00000000FFFF00000000000200000001000000000500
      417269616C000A0000000000000000000A000000CC00020000000000FFFFFF00
      000000020000000000000000006B0F000006004D656D6F343000020020000000
      3002000040000000100000000300000001000000000000000000FFFFFF1F2C02
      000000000001000900CEF2EFF3F1F2E8EB3A00000000FFFF0000000000020000
      0001000000000500417269616C000A0000000000000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000F20F000006004D656D6F34
      3100020020000000900200004000000010000000030000000100000000000000
      0000FFFFFF1F2C02000000000001000800CFEEEBF3F7E8EB3A00000000FFFF00
      000000000200000001000000000500417269616C000A0000000000000000000A
      000000CC00020000000000FFFFFF0000000002000000000000000000A7100000
      06004D656D6F343200020024020000FA010000A0000000140000000300020001
      000000000000000000FFFFFF1F2C020000000000010036005B464F524D415444
      41544554494D452827272722272764642727222727206D6D6D6D207979797920
      2727E32E2727272C44415445295D00000000FFFF000000000002000000010000
      00000500417269616C000A00000000000000000009000000CC00020000000000
      FFFFFF00000000020000000000000000005C11000006004D656D6F3433000200
      240200002D020000A0000000140000000300020001000000000000000000FFFF
      FF1F2C020000000000010036005B464F524D41544441544554494D4528272727
      22272764642727222727206D6D6D6D2079797979202727E32E2727272C444154
      45295D00000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000009000000CC00020000000000FFFFFF0000000002000000
      0000000000001112000006004D656D6F3434000200230200005F020000A00000
      00140000000300020001000000000000000000FFFFFF1F2C0200000000000100
      36005B464F524D41544441544554494D45282727272227276464272722272720
      6D6D6D6D2079797979202727E32E2727272C44415445295D00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000900
      0000CC00020000000000FFFFFF0000000002000000000000000000C012000006
      004D656D6F3436000200C0000000100200003001000010000000030008000100
      0000000000000000FFFFFF1F2C0200000000000100300020202020202028EFEE
      E4EFE8F1FC292020202020202020202020202020202020202020202020202020
      202028D4C8CE2900000000FFFF00000000000200000001000000000500417269
      616C000800000000000000000008000000CC00020000000000FFFFFF00000000
      020000000000000000008F13000006004D656D6F343700020060000000400200
      0090010000100000000300080001000000000000000000FFFFFF1F2C02000000
      0000010050002020202020202020202020202020202020202020202020202020
      2028EFEEE4EFE8F1FC2920202020202020202020202020202020202020202020
      202020202020202020202020202020202028D4C8CE2900000000FFFF00000000
      000200000001000000000500417269616C000800000000000000000008000000
      CC00020000000000FFFFFF00000000020000000000000000005E14000006004D
      656D6F343800020060000000A002000090010000100000000300080001000000
      000000000000FFFFFF1F2C020000000000010050002020202020202020202020
      2020202020202020202020202020202028EFEEE4EFE8F1FC2920202020202020
      2020202020202020202020202020202020202020202020202020202020202020
      28D4C8CE2900000000FFFF00000000000200000001000000000500417269616C
      000800000000000000000008000000CC00020000000000FFFFFF000000000200
      0000000000000000FF14000006004D656D6F343900020025000000EB000000A0
      000000110000000300000001000000000000000000FFFFFF1F2C020000000000
      01001800D3F7F0E5E6E4E5EDE8E52028EEF2EFF0E0E2E8F2E5EBFC2900000000
      FFFF00000000000200000001000000000F0054696D6573204E657720526F6D61
      6E000A00000000000000000000000000CC00020000000000FFFFFF0000000002
      0000000000000000008815000006004D656D6F3530000200DD000000EA000000
      72010000140000000300020001000000000000000000FFFFFF1F2C0200000000
      000100000000000000FFFF00000000000200000001000000000F0054696D6573
      204E657720526F6D616E000A0000000000000000000A000000CC000200000000
      00FFFFFF00000000020000000000000000001D16000006004D656D6F35310002
      00DD000000D600000072010000140000000300020001000000000000000000FF
      FFFF1F2C02000000000001000C005B7661725F73656E6465725D00000000FFFF
      00000000000200000001000000000F0054696D6573204E657720526F6D616E00
      0A0000000000000000000A000000CC00020000000000FFFFFF00000000020000
      00000000000000B416000006004D656D6F3137000200DC000000AE0000007201
      00002C0000000300020001000000000000000000FFFFFF1F2C02000000000001
      000E005B7661725F72656365697665725D00000000FFFF000000000002000000
      01000000000F0054696D6573204E657720526F6D616E000A0000000000000000
      000A000000CC00020000000000FFFFFF00000000020000000000000000004317
      000006004D656D6F353200020024000000C0010000030200001100000003000F
      002C010000000000000000FFFFFF1F2C02000000000001000600C8F2EEE3EE3A
      00000000FFFF00000000000200000001000000000F0054696D6573204E657720
      526F6D616E000C00000002000000000009000000CC00020000000000FFFFFF00
      000000020000000000000000004318000006004D656D6F353300020027020000
      C0010000A90000001100000003000F002C010000000000000000FFFFFF1F2C02
      040114002323232023232320232323202323302E303020F000010024005B5355
      4D285B6F6473496E766F696365322E22464E5F564944414E4F5F53554D225D29
      5D0003000500626567696E0D2F002020202020693131203A3D2053554D285B6F
      6473496E766F696365322E22464E5F564944414E4F5F53554D225D293B0D0300
      656E6400FFFF00000000000200000001000000000F0054696D6573204E657720
      526F6D616E000C00000002000000000009000000CC00020000000000FFFFFF00
      00000002000000000000000000D818000006004D656D6F353400020080020000
      F50300004C000000120000000300000001000000000000000000FFFFFF1F2C02
      000000000001000C00F1F2F02E205B50414745235D00000000FFFF0000000000
      0200000001000000000F0054696D6573204E657720526F6D616E000A00000000
      000000000009000000CC00020000000000FFFFFF000000000200000000000000
      00007F19000006004D656D6F353500020024000000C8000000B8000000140000
      000300000001000000000000000000FFFFFF1F2C02000000000001001E0028F6
      E5EDF2F0E0EBE8E7EEE2E0EDEDE0FF20E1F3F5E3E0EBF2E5F0E8FF2900000000
      FFFF00000000000200000001000000000F0054696D6573204E657720526F6D61
      6E000A00000000000000000000000000CC00020000000000FFFFFF0000000002
      000000000000000000341A000006004D656D6F35360002005402000069000000
      7C000000130000000900020001000000000000000000FFFFFF1F2C0200000000
      00010036005B464F524D41544441544554494D45282727272227276464272722
      2727206D6D6D6D2079797979202727E32E2727272C44415445295D00000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      0009000000CC00020000000000FFFFFF0000000002000000000000000000E91A
      000006004D656D6F353700020025000000A40000008800000013000000090002
      0001000000000000000000FFFFFF1F2C020000000000010036005B464F524D41
      544441544554494D452827272722272764642727222727206D6D6D6D20797979
      79202727E32E2727272C44415445295D00000000FFFF00000000000200000001
      000000000500417269616C000A00000000000000000008000000CC0002000000
      0000FFFFFF00000000020000000000000000008C1B000006004D656D6F353800
      02001001000020020000E0000000200000000300000001000000000000000000
      FFFFFF1F2C02000000000001001A005B6F647353656C446F63507269682E224E
      414D4546524F4D225D00000000FFFF00000000000200000001000000000F0054
      696D6573204E657720526F6D616E000A00000000000000000012000000CC0002
      0000000000FFFFFF0000000002000000000000000000211C000006004D656D6F
      353900020010010000F0010000E0000000200000000300000001000000000000
      000000FFFFFF1F2C02000000000001000C005B7661725F4D61674F74645D0000
      0000FFFF00000000000200000001000000000F0054696D6573204E657720526F
      6D616E000A00000000000000000012000000CC00020000000000FFFFFF000000
      0002000000000000000000C21C000006004D656D6F3630000200100100008002
      0000E0000000200000000300000001000000000000000000FFFFFF1F2C020000
      000000010018005B6F647353656C446F63507269682E224E414D45544F225D00
      000000FFFF00000000000200000001000000000F0054696D6573204E65772052
      6F6D616E000A00000000000000000012000000CC00020000000000FFFFFF0000
      000002000000000000000000541D000006004D656D6F36310002007102000024
      00000060000000140000000300000001000000000000000000FFFFFF1F2C0200
      0000000001000900D3D2C2C5D0C6C4C0DE00000000FFFF000000000002000000
      01000000000F0054696D6573204E657720526F6D616E000A0000000000000000
      0012000000CC00020000000000FFFFFF00000000020000000000000000000E1E
      000006004D656D6F36320002007001000037000000A00000001D000000030000
      0001000000000000000000FFFFFF1F2C02000000000002001A00C7E0ECE5F1F2
      E8F2E5EBFC20E3EBE0E2EDEEE3EE20E2F0E0F7E00D1400EFEE20ECE5E4E8F6E8
      EDF1EAEEE920F7E0F1F2E800000000FFFF00000000000200000001000000000F
      0054696D6573204E657720526F6D616E000A00000000000000000008000000CC
      00020000000000FFFFFF0000000002000000000000000000A11E000006004D65
      6D6F363300020021020000540000003D00000010000000030000000100000000
      0000000000FFFFFF1F2C02000000000001000A002028EFEEE4EFE8F1FC290000
      0000FFFF00000000000200000001000000000F0054696D6573204E657720526F
      6D616E000A00000000000000000010000000CC00020000000000FFFFFF000000
      00020000000000000000002F1F000006004D656D6F3634000200A60200005400
      000028000000100000000300000001000000000000000000FFFFFF1F2C020000
      0000000100050028D4C8CE2900000000FFFF0000000000020000000100000000
      0F0054696D6573204E657720526F6D616E000A00000000000000000010000000
      CC00020000000000FFFFFF0000000002000000000000000000C81F000005004D
      656D6F31000200F501000044000000DC00000010000000030002000100000000
      0000000000FFFFFF1F2C020000000000010011005B7661725F7A616D5F676C5F
      767261345D00000000FFFF00000000000200000001000000000F0054696D6573
      204E657720526F6D616E000A00000000000000000009000000CC000200000000
      00FFFFFF00000000020000000000000000009720000006004D656D6F36360002
      00700000007002000080010000100000000300080001000000000000000000FF
      FFFF1F2C02000000000001005000202020202020202020202020202020202020
      20202020202020202028EFEEE4EFE8F1FC292020202020202020202020202020
      2020202020202020202020202020202020202020202020202028D4C8CE290000
      0000FFFF00000000000200000001000000000500417269616C00080000000000
      0000000008000000CC00020000000000FFFFFF00000000020000000000000000
      003821000006004D656D6F36370002001001000050020000E000000020000000
      0300000001000000000000000000FFFFFF1F2C020000000000010018005B6F64
      7353656C446F63507269682E224E414D45544F225D00000000FFFF0000000000
      0200000001000000000F0054696D6573204E657720526F6D616E000A00000000
      000000000012000000CC00020000000000FFFFFF000000000200000000000000
      0000C221000006004D656D6F3635000200200000006002000050000000100000
      000300000001000000000000000000FFFFFF1F2C02000000000001000B00C7E0
      F2F0E5E1EEE2E0EB3A00000000FFFF0000000000020000000100000000050041
      7269616C000A0000000000000000000A000000CC00020000000000FFFFFF0000
      0000020000000000000000007722000006004D656D6F36380002002302000088
      020000A0000000140000000300020001000000000000000000FFFFFF1F2C0200
      00000000010036005B464F524D41544441544554494D45282727272227276464
      2727222727206D6D6D6D2079797979202727E32E2727272C44415445295D0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      0000000009000000CC00020000000000FFFFFF00000000020000000000000000
      000123000006004D656D6F3639000200D0000000C0020000C00100004C000000
      0300000001000000000000000000FFFFFF1F2C00000000000001000B005B4954
      4F4728693131295D00000000FFFF000000000002000000010000000005004172
      69616C000A00000000000000000008000000CC00020000000000FFFFFF000000
      00020000000000000000009623000006004D656D6F3435000200470000004401
      0000CD0000003200000003000F002C010000000000000000FFFFFF1F2C020000
      00000001000C00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF00000000000200
      000001000000000F0054696D6573204E657720526F6D616E000A000000020000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      3324000006004D656D6F37330002003E01000044010000580000002100000003
      000F002C010000000000000000FFFFFF1F2C02000000000001001400C1F3F5E3
      E0EBF2E5F0F1EAE0FF20E7E0EFE8F1FC00000000FFFF00000000000200000001
      000000000F0054696D6573204E657720526F6D616E000A000000020000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000C62400
      0006004D656D6F37340002009601000044010000910000002100000003000F00
      2C010000000000000000FFFFFF1F2C02000000000001000A00CAEEEBE8F7E5F1
      F2E2EE00000000FFFF00000000000200000001000000000F0054696D6573204E
      657720526F6D616E000A0000000200000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000005425000006004D656D6F323200020024
      00000044010000230000003200000003000F002C010000000000000000FFFFFF
      1F2C02000000000001000500B920EF2FEF00000000FFFF000000000002000000
      01000000000F0054696D6573204E657720526F6D616E000A0000000200000000
      000A000000CC00020000000000FFFFFF0000000002000000000000000000E825
      000006004D656D6F32330002002702000044010000420000003200000003000F
      002C010000000000000000FFFFFF1F2C02000000000002000500D6E5EDE02C0D
      0300F0F3E100000000FFFF00000000000200000001000000000F0054696D6573
      204E657720526F6D616E000A0000000200000000000A000000CC000200000000
      00FFFFFF00000000020000000000000000007626000006004D656D6F32340002
      003E010000650100002A0000001100000003000F002C010000000000000000FF
      FFFF1F2C02000000000001000500C4E5E1E5F200000000FFFF00000000000200
      000001000000000F0054696D6573204E657720526F6D616E0008000000020000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      0527000006004D656D6F323500020068010000650100002E0000001100000003
      000F002C010000000000000000FFFFFF1F2C02000000000001000600CAF0E5E4
      E8F200000000FFFF00000000000200000001000000000F0054696D6573204E65
      7720526F6D616E00080000000200000000000A000000CC00020000000000FFFF
      FF00000000020000000000000000009927000006004D656D6F33300002009601
      000065010000460000001100000001000F002C010000000000000000FFFFFF1F
      2C02000000000001000B00C7E0F2F0E5E1EEE2E0EDEE00000000FFFF00000000
      000200000001000000000F0054696D6573204E657720526F6D616E0008000000
      0200000000000A000000CC00020000000000FFFFFF0000000002000000000000
      0000002A28000006004D656D6F3331000200DC010000650100004B0000001100
      000003000F002C010000000000000000FFFFFF1F2C02000000000001000800CE
      F2EFF3F9E5EDEE00000000FFFF00000000000200000001000000000F0054696D
      6573204E657720526F6D616E00080000000200000000000A000000CC00020000
      000000FFFFFF0000000002000000000000000000BF28000006004D656D6F3332
      0002006902000044010000670000003200000003000F002C0100000000000000
      00FFFFFF1F2C02000000000002000600D1F3ECECE02C0D0300F0F3E100000000
      FFFF00000000000200000001000000000F0054696D6573204E657720526F6D61
      6E000A0000000200000000000A000000CC00020000000000FFFFFF0000000002
      0000000000000000005029000006004D656D6F32360002001401000044010000
      2A0000003200000007000F002C010000000000000000FFFFFF1F2C0200000000
      0001000800C5E42E20E8E7EC2E00000000FFFF00000000000200000001000000
      000F0054696D6573204E657720526F6D616E000A0000000200000000000A0000
      00CC00020000000000FFFFFF00000000020000000000000000006E2A00000600
      4D656D6F32370002004700000090010000CD0000001100000003000F002C0100
      00000000000000FFFFFF1F2C02000000000001001D005B6F6473496E766F6963
      65322E2246435F4D454449435F4E414D45225D0003000500626567696E0D6800
      2F2F2020696620285B6F6473496E766F696365322E2246435F53455249414C22
      5D203C3E20272729207468656E207354656D70203A3D20272C27202B205B6F64
      73496E766F696365322E2246435F53455249414C225D20656C7365207354656D
      70203A3D2027273B0D0300656E6400FFFF00000000000200000001000000000F
      0054696D6573204E657720526F6D616E000C00000000000000000008000000CC
      00020000000000FFFFFF0000000002000000000000000000FE2A000006004D65
      6D6F32380002002400000090010000230000001100000003000F002C01000000
      0000000000FFFFFF1F2C020000000000010007005B4C494E45235D00000000FF
      FF00000000000200000001000000000F0054696D6573204E657720526F6D616E
      000A0000000000000000000A000000CC00020000000000FFFFFF000000000200
      0000000000000000382C000006004D656D6F3239000200270200009001000042
      0000001100000003000F002C010000000000000000FFFFFF1F2C020301000000
      01001C005B6F6473496E766F696365322E22464E5F4156475F5052494345225D
      0003000500626567696E0D85002F2F20206966205B6F64735265706F72742E22
      464E5F4B4F4C225D203D202D31207468656E2074656D705072696365203A3D20
      272720656C73652074656D705072696365203A3D20464F524D4154464C4F4154
      2827302E3030272C205B6F64735265706F72742E2253554D4D225D2F5B6F6473
      5265706F72742E22464E5F4B4F4C225D293B0D0300656E6400FFFF0000000000
      0200000001000000000F0054696D6573204E657720526F6D616E000A00000000
      000000000009000000CC00020000000000FFFFFF000000000200000000000000
      0000BF2C000006004D656D6F33330002003E010000900100002A000000110000
      0003000F002C010000000000000000FFFFFF1F2C020000000000000000000000
      FFFF00000000000200000001000000000F0054696D6573204E657720526F6D61
      6E000C0000000000000000000A000000CC00020000000000FFFFFF0000000002
      000000000000000000462D000006004D656D6F33340002006801000090010000
      2E0000001100000003000F002C010000000000000000FFFFFF1F2C0200000000
      00000000000000FFFF00000000000200000001000000000F0054696D6573204E
      657720526F6D616E000C0000000000000000000A000000CC00020000000000FF
      FFFF0000000002000000000000000000632E000006004D656D6F333500020096
      01000090010000460000001100000001000F002C010000000000000000FFFFFF
      1F2C02020100000001001B005B6F6473496E766F696365322E22464E5F545245
      425F4B4F4C225D0003000500626567696E0D69002F2F20206966205B6F647352
      65706F72742E22464E5F545245424B4F4C225D203D202D31207468656E207465
      6D70547265624B6F6C203A3D20272720656C73652074656D70547265624B6F6C
      203A3D205B6F64735265706F72742E22464E5F545245424B4F4C225D3B0D0300
      656E6400FFFF00000000000200000001000000000F0054696D6573204E657720
      526F6D616E000A0000000000000000000A000000CC00020000000000FFFFFF00
      00000002000000000000000000722F000006004D656D6F3336000200DC010000
      900100004B0000001100000003000F002C010000000000000000FFFFFF1F2C02
      020100000001001D005B6F6473496E766F696365322E22464E5F564944414E4F
      5F4B4F4C225D0003000500626567696E0D59002F2F20206966205B6F64735265
      706F72742E22464E5F4B4F4C225D203D202D31207468656E2074656D704B6F6C
      203A3D20272720656C73652074656D704B6F6C203A3D205B6F64735265706F72
      742E22464E5F4B4F4C225D3B0D0300656E6400FFFF0000000000020000000100
      0000000F0054696D6573204E657720526F6D616E000A0000000000000000000A
      000000CC00020000000000FFFFFF0000000002000000000000000000BD300000
      06004D656D6F33370002006902000090010000670000001100000003000F002C
      010000000000000000FFFFFF1F2C02030100000001001D005B6F6473496E766F
      696365322E22464E5F564944414E4F5F53554D225D0004000500626567696E0D
      6A002F2F20206966205B6F64735265706F72742E2253554D4D225D203D202D31
      207468656E2074656D7053756D203A3D20272720656C73652074656D7053756D
      203A3D20464F524D4154464C4F41542827302E3030272C205B6F64735265706F
      72742E2253554D4D225D293B0D28002F2F20202020693131203A3D2069313120
      2B205B6F6473496E766F696365322E2253554D4D225D3B0D0300656E6400FFFF
      00000000000200000001000000000F0054696D6573204E657720526F6D616E00
      0A00000000000000000009000000CC00020000000000FFFFFF00000000020000
      000000000000006331000006004D656D6F333800020014010000900100002A00
      00001100000007000F002C010000000000000000FFFFFF1F2C02000000000001
      001D005B6F6473496E766F696365322E2246435F4544495A4D5F4E414D45225D
      00000000FFFF00000000000200000001000000000F0054696D6573204E657720
      526F6D616E000A0000000000000000000A000000CC00020000000000FFFFFF00
      0000000200000000000000FEFEFF020000000A00207661726961626C65730000
      00000300693131000000000000000000000000FC000000000000000000000000
      0000000058002C0F48C6F5D3E2401C769035374DE440}
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit, pbPageSetup]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 290
    Top = 162
    ReportForm = {
      19000000EF0A0000190000000001000100FFFFFFFFFF09000000340800009A0B
      00002400000024000000240000002400000000FFFF0000FFFFFFFF0200000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200D50000000B004D61737465724461746131000201000000
      0024000000F6020000CC0000003000050001000000000000000000FFFFFF1F00
      0000000B00667244424461746153657400000000000000FFFF00000000000200
      0000010000000000000001000000C80000001400000001000000000000000051
      01000005004D656D6F310002002D0000002D00000043010000BC00000003000F
      0001000000000000000000FFFFFF1F2C02000000000000000000000001000000
      0000000200000001000000000500417269616C00060000000000000000000000
      0000CC00020000000000FFFFFF0000000002000000000000000000E601000005
      004D656D6F330002003300000043000000370100002C00000003000F00010000
      00000000000000FCF8AB002C020000000000010017005B6F64734D65644B6172
      742E2246435F4D45444943225D00000000FFFF00000000000200000001000000
      000500417269616C000A0000000200000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000006B02000005004D656D6F340002003300
      0000B50000002E0000001000000003000E0001000000000000000000FFFFFF1F
      2C02000000000001000700CFE0F0F2E8FF3A00000000FFFF0000000000020000
      0001000000000500417269616C000800000002000000000008000000CC000200
      00000000FFFFFF0000000002000000000000000000F402000005004D656D6F35
      000200C2000000C5000000410000001000000003000E00010000000000000000
      00FFFFFF1F2C02000000000001000B00D3EF2EE5E42EE8E7EC2E3A00000000FF
      FF00000000000200000001000000000500417269616C00080000000200000000
      0000000000CC00020000000000FFFFFF00000000020000000000000000007903
      000005004D656D6F3600020033000000C5000000320000001000000003000E00
      01000000000000000000FFFFFF1F2C02000000000001000700CAEEEB2DE2EE3A
      00000000FFFF00000000000200000001000000000500417269616C0008000000
      02000000000008000000CC00020000000000FFFFFF0000000002000000000000
      0000000004000005004D656D6F37000200C2000000B50000003D000000100000
      0003000E0001000000000000000000FFFFFF1F2C02000000000001000900C3EE
      E4E5ED20E4EE3A00000000FFFF00000000000200000001000000000500417269
      616C000800000002000000000008000000CC00020000000000FFFFFF00000000
      020000000000000000008404000005004D656D6F38000200C2000000D5000000
      2D0000001000000003000E0001000000000000000000FFFFFF1F2C0200000000
      0001000600D1F3ECECE03A00000000FFFF000000000002000000010000000005
      00417269616C000800000002000000000000000000CC00020000000000FFFFFF
      00000000020000000000000000000705000005004D656D6F3900020033000000
      D50000002E0000001000000003000E0001000000000000000000FFFFFF1F2C02
      000000000001000500D6E5EDE03A00000000FFFF000000000002000000010000
      00000500417269616C000800000002000000000008000000CC00020000000000
      FFFFFF0000000002000000000000000000AA05000005004D656D6F3200020034
      00000076000000370100001A00000003000F0001000000000000000000F0F0F0
      002C02000000000001002500CFF0EEE8E7E2EEE4E8F2E5EBFC3A205B6F64734D
      65644B6172742E2246435F50524F44225D00000000FFFF000000000002000000
      01000000000500417269616C000800000000000000000000000000CC00020000
      000000FFFFFF00000000020000000000000000006C06000006004D656D6F3130
      0002003400000094000000370100001C00000003000F00010000000000000000
      00F0F0F0002C02000000000002002800CFEEF1F2E0E2F9E8EA3A205B6F64734D
      65644B6172742E2246435F504F535441565F4E414D45225D0D18005B6F64734D
      65644B6172742E2266635F646F636D6978225D00000000FFFF00000000000200
      000001000000000500417269616C000800000000000000000000000000CC0002
      0000000000FFFFFF00000000020000000000000000000607000006004D656D6F
      313100020061000000B5000000540000001000000003000B0001000000000000
      000000FFFFFF1F2C02000000000001001B005B6F64734D65644B6172742E2246
      4E5F50415254595F4E554D225D00000000FFFF00000000000200000001000000
      000500417269616C000800000002000000000009000000CC00020000000000FF
      FFFF00000000020000000000000000009A07000006004D656D6F313200020064
      000000C5000000510000001000000003000B0001000000000000000000FFFFFF
      1F2C020000000000010015005B6F64734D65644B6172742E22464E5F4B4F4C22
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      0002000000000009000000CC00020000000000FFFFFF00000000020000000000
      000000004008000006004D656D6F313300020060000000D50000005500000010
      00000003000B0001000000000000000000FFFFFF1F2C02040110002323232023
      2323202323302E303020F000010017005B6F64734D65644B6172742E22464E5F
      5052494345225D00000000FFFF00000000000200000001000000000500417269
      616C000800000002000000000009000000CC00020000000000FFFFFF00000000
      02000000000000000000D608000006004D656D6F3134000200FF000000B50000
      006C0000001000000003000B0001000000000000000000FFFFFF1F2C02000000
      0000010017005B6F64734D65644B6172742E2246445F474F44454E225D000000
      00FFFF00000000000200000001000000000500417269616C0008000000020000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      6D09000006004D656D6F313500020003010000C5000000680000001000000003
      000B0001000000000000000000FFFFFF1F2C020000000000010018005B6F6473
      4D65644B6172742E2246435F554544495A4D225D00000000FFFF000000000002
      00000001000000000500417269616C00080000000200000000000A000000CC00
      020000000000FFFFFF00000000020000000000000000002B0A000006004D656D
      6F3136000200EF000000D50000007C0000001000000003000B00010000000000
      00000000FFFFFF1F2C020401100023232320232323202323302E303020F00001
      002F005B5B6F64734D65644B6172742E22464E5F4B4F4C225D2A5B6F64734D65
      644B6172742E22464E5F5052494345225D5D00000000FFFF0000000000020000
      0001000000000500417269616C000800000002000000000009000000CC000200
      00000000FFFFFF0000000002000000000000000000BD0A000006004D656D6F31
      3700020034000000310000003401000010000000030000000100000000000000
      0000FFFFFF1F2C02000000000001001300D1D2C5CBCBC0C6CDC0DF20CAC0D0D2
      CED7CAC000000000FFFF00000000000200000001000000000500417269616C00
      0A0000000000000000000A0000000100020000000000FFFFFF00000000020000
      0000000000FEFEFF000000000000000000000000FC0000000000000000000000
      000000000058005ADC09E273E7E2401C769035374DE440}
  end
  object frReport2: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    Title = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077
    RebuildPrinter = False
    OnGetValue = frInvoice2GetValue
    Left = 102
    Top = 128
    ReportForm = {
      19000000242F0000190000000001000100FFFFFFFFFF09000000340800009A0B
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
      00010018005B6F647353656C446F63507269682E2246435F444F43225D000000
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
      0000000000B60D000006004D656D6F3230000200EC000000070100004C010000
      140000000300020001000000000000000000FFFFFF1F2C020000000000010018
      005B6F647353656C446F63507269682E224E414D45544F225D00030005006265
      67696E0D0A002F2F5B7661725F6D6F5D0D0300656E6400FFFF00000000000200
      000001000000000F0054696D6573204E657720526F6D616E000A000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      4E0E000006004D656D6F3231000200480100001C0100007C0000001400000003
      00000001000000000000000000FFFFFF1F2C02000000000001000F00C4EEEBE6
      EDEEF1F2FC202F20D4C8CE00000000FFFF00000000000200000001000000000F
      0054696D6573204E657720526F6D616E000A00000000000000000002000000CC
      00020000000000FFFFFF0000000002000000000000000000040F000006004D65
      6D6F34350002004700000044010000030100003200000003000F002C01000000
      0000000000FFFFFF1F2C02000000000001002D00CDE0E8ECE5EDEEE2E0EDE8E5
      2C20E4EEE7E8F0EEE2EAE02C20F4EEF0ECE020E2FBEFF3F1EAE02C20F1E5F0E8
      FF00000000FFFF00000000000200000001000000000F0054696D6573204E6577
      20526F6D616E000A0000000200000000000A000000CC00020000000000FFFFFF
      0000000002000000000000000000970F000006004D656D6F3734000200960100
      0044010000910000002100000003000F002C010000000000000000FFFFFF1F2C
      02000000000001000A00CAEEEBE8F7E5F1F2E2EE00000000FFFF000000000002
      00000001000000000F0054696D6573204E657720526F6D616E000A0000000200
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      002510000006004D656D6F323200020024000000440100002300000032000000
      03000F002C010000000000000000FFFFFF1F2C02000000000001000500B920EF
      2FEF00000000FFFF00000000000200000001000000000F0054696D6573204E65
      7720526F6D616E000A0000000200000000000A000000CC00020000000000FFFF
      FF0000000002000000000000000000B910000006004D656D6F32330002002702
      000044010000420000003200000003000F002C010000000000000000FFFFFF1F
      2C02000000000002000500D6E5EDE02C0D0300F0F3E100000000FFFF00000000
      000200000001000000000F0054696D6573204E657720526F6D616E000A000000
      0200000000000A000000CC00020000000000FFFFFF0000000002000000000000
      0000004D11000006004D656D6F33300002009601000065010000460000001100
      000001000F002C010000000000000000FFFFFF1F2C02000000000001000B00C7
      E0F2F0E5E1EEE2E0EDEE00000000FFFF00000000000200000001000000000F00
      54696D6573204E657720526F6D616E00080000000200000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000DE11000006004D656D
      6F3331000200DC010000650100004B0000001100000003000F002C0100000000
      00000000FFFFFF1F2C02000000000001000800CEF2EFF3F9E5EDEE00000000FF
      FF00000000000200000001000000000F0054696D6573204E657720526F6D616E
      00080000000200000000000A000000CC00020000000000FFFFFF000000000200
      00000000000000007312000006004D656D6F3332000200690200004401000067
      0000003200000003000F002C010000000000000000FFFFFF1F2C020000000000
      02000600D1F3ECECE02C0D0300F0F3E100000000FFFF00000000000200000001
      000000000F0054696D6573204E657720526F6D616E000A000000020000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000041300
      0006004D656D6F32360002004A010000440100004C0000003200000007000F00
      2C010000000000000000FFFFFF1F2C02000000000001000800C5E42E20E8E7EC
      2E00000000FFFF00000000000200000001000000000F0054696D6573204E6577
      20526F6D616E000A0000000200000000000A000000CC00020000000000FFFFFF
      00000000020000000000000000002214000006004D656D6F3237000200470000
      0090010000030100001100000003000F002C010000000000000000FFFFFF1F2C
      02000000000001001F005B6F6473496E766F696365322E224E414D454B415254
      225D5B7354656D705D0003000500626567696E0D66002020696620285B6F6473
      496E766F696365322E2246435F53455249414C225D203C3E2027272920746865
      6E207354656D70203A3D20272C27202B205B6F6473496E766F696365322E2246
      435F53455249414C225D20656C7365207354656D70203A3D2027273B0D030065
      6E6400FFFF00000000000200000001000000000F0054696D6573204E65772052
      6F6D616E000C00000000000000000008000000CC00020000000000FFFFFF0000
      000002000000000000000000B214000006004D656D6F32380002002400000090
      010000230000001100000003000F002C010000000000000000FFFFFF1F2C0200
      00000000010007005B4C494E45235D00000000FFFF0000000000020000000100
      0000000F0054696D6573204E657720526F6D616E000A0000000000000000000A
      000000CC00020000000000FFFFFF000000000200000000000000000013160000
      06004D656D6F32390002002702000090010000420000001100000003000F002C
      010000000000000000FFFFFF1F2C020000000000010043005B464F524D415446
      4C4F41542827302E30302E272C205B6F6473496E766F696365322E2253554D4D
      225D2F5B6F6473496E766F696365322E22464E5F4B4F4C225D295D0003000500
      626567696E0D85002F2F20206966205B6F64735265706F72742E22464E5F4B4F
      4C225D203D202D31207468656E2074656D705072696365203A3D20272720656C
      73652074656D705072696365203A3D20464F524D4154464C4F41542827302E30
      30272C205B6F64735265706F72742E2253554D4D225D2F5B6F64735265706F72
      742E22464E5F4B4F4C225D293B0D0300656E6400FFFF00000000000200000001
      000000000F0054696D6573204E657720526F6D616E000A000000000000000000
      09000000CC00020000000000FFFFFF00000000020000000000000000002F1700
      0006004D656D6F33350002009601000090010000460000001100000001000F00
      2C010000000000000000FFFFFF1F2C02000000000001001A005B6F6473496E76
      6F696365322E22464E5F545245424B4F4C225D0003000500626567696E0D6900
      2F2F20206966205B6F64735265706F72742E22464E5F545245424B4F4C225D20
      3D202D31207468656E2074656D70547265624B6F6C203A3D20272720656C7365
      2074656D70547265624B6F6C203A3D205B6F64735265706F72742E22464E5F54
      5245424B4F4C225D3B0D0300656E6400FFFF0000000000020000000100000000
      0F0054696D6573204E657720526F6D616E000A0000000000000000000A000000
      CC00020000000000FFFFFF00000000020000000000000000003718000006004D
      656D6F3336000200DC010000900100004B0000001100000003000F002C010000
      000000000000FFFFFF1F2C020000000000010016005B6F6473496E766F696365
      322E22464E5F4B4F4C225D0003000500626567696E0D59002F2F20206966205B
      6F64735265706F72742E22464E5F4B4F4C225D203D202D31207468656E207465
      6D704B6F6C203A3D20272720656C73652074656D704B6F6C203A3D205B6F6473
      5265706F72742E22464E5F4B4F4C225D3B0D0300656E6400FFFF000000000002
      00000001000000000F0054696D6573204E657720526F6D616E000A0000000000
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      009119000006004D656D6F333700020069020000900100006700000011000000
      03000F002C010000000000000000FFFFFF1F2C02000000000001002C005B464F
      524D4154464C4F41542827302E30302E272C205B6F6473496E766F696365322E
      2253554D4D225D295D0004000500626567696E0D6A002F2F20206966205B6F64
      735265706F72742E2253554D4D225D203D202D31207468656E2074656D705375
      6D203A3D20272720656C73652074656D7053756D203A3D20464F524D4154464C
      4F41542827302E3030272C205B6F64735265706F72742E2253554D4D225D293B
      0D28002F2F20202020693131203A3D20693131202B205B6F6473496E766F6963
      65322E2253554D4D225D3B0D0300656E6400FFFF000000000002000000010000
      00000F0054696D6573204E657720526F6D616E000A0000000000000000000900
      0000CC00020000000000FFFFFF0000000002000000000000000000321A000006
      004D656D6F33380002004A010000900100004C0000001100000007000F002C01
      0000000000000000FFFFFF1F2C020000000000010018005B6F6473496E766F69
      6365322E2246435F4544495A4D225D00000000FFFF0000000000020000000100
      0000000F0054696D6573204E657720526F6D616E000A0000000000000000000A
      000000CC00020000000000FFFFFF0000000002000000000000000000C71A0000
      06004D656D6F33390002002000000000020000A8000000100000000300000001
      000000000000000000FFFFFF1F2C02000000000001001600C7E0E2E5E4F3FEF9
      E8E920EEF2E4E5EBE5EDE8E5EC3A00000000FFFF000000000002000000010000
      00000500417269616C000A0000000000000000000A000000CC00020000000000
      FFFFFF00000000020000000000000000004F1B000006004D656D6F3430000200
      200000003002000040000000100000000300000001000000000000000000FFFF
      FF1F2C02000000000001000900CEF2EFF3F1F2E8EB3A00000000FFFF00000000
      000200000001000000000500417269616C000A0000000000000000000A000000
      CC00020000000000FFFFFF0000000002000000000000000000D61B000006004D
      656D6F3431000200200000009002000040000000100000000300000001000000
      000000000000FFFFFF1F2C02000000000001000800CFEEEBF3F7E8EB3A000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      8B1C000006004D656D6F343200020024020000FA010000A00000001400000003
      00020001000000000000000000FFFFFF1F2C020000000000010036005B464F52
      4D41544441544554494D452827272722272764642727222727206D6D6D6D2079
      797979202727E32E2727272C44415445295D00000000FFFF0000000000020000
      0001000000000500417269616C000A00000000000000000009000000CC000200
      00000000FFFFFF0000000002000000000000000000401D000006004D656D6F34
      33000200240200002D020000A000000014000000030002000100000000000000
      0000FFFFFF1F2C020000000000010036005B464F524D41544441544554494D45
      2827272722272764642727222727206D6D6D6D2079797979202727E32E272727
      2C44415445295D00000000FFFF00000000000200000001000000000500417269
      616C000A00000000000000000009000000CC00020000000000FFFFFF00000000
      02000000000000000000F51D000006004D656D6F3434000200230200005F0200
      00A0000000140000000300020001000000000000000000FFFFFF1F2C02000000
      0000010036005B464F524D41544441544554494D452827272722272764642727
      222727206D6D6D6D2079797979202727E32E2727272C44415445295D00000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      000009000000CC00020000000000FFFFFF0000000002000000000000000000A4
      1E000006004D656D6F3436000200C00000001002000030010000100000000300
      080001000000000000000000FFFFFF1F2C020000000000010030002020202020
      2028EFEEE4EFE8F1FC2920202020202020202020202020202020202020202020
      20202020202028D4C8CE2900000000FFFF000000000002000000010000000005
      00417269616C000800000000000000000008000000CC00020000000000FFFFFF
      0000000002000000000000000000731F000006004D656D6F3437000200600000
      004002000090010000100000000300080001000000000000000000FFFFFF1F2C
      0200000000000100500020202020202020202020202020202020202020202020
      202020202028EFEEE4EFE8F1FC29202020202020202020202020202020202020
      20202020202020202020202020202020202020202028D4C8CE2900000000FFFF
      00000000000200000001000000000500417269616C0008000000000000000000
      08000000CC00020000000000FFFFFF0000000002000000000000000000422000
      0006004D656D6F343800020060000000A0020000900100001000000003000800
      01000000000000000000FFFFFF1F2C0200000000000100500020202020202020
      202020202020202020202020202020202020202028EFEEE4EFE8F1FC29202020
      2020202020202020202020202020202020202020202020202020202020202020
      2020202028D4C8CE2900000000FFFF0000000000020000000100000000050041
      7269616C000800000000000000000008000000CC00020000000000FFFFFF0000
      000002000000000000000000E320000006004D656D6F343900020025000000EB
      000000A0000000110000000300000001000000000000000000FFFFFF1F2C0200
      0000000001001800D3F7F0E5E6E4E5EDE8E52028EEF2EFF0E0E2E8F2E5EBFC29
      00000000FFFF00000000000200000001000000000F0054696D6573204E657720
      526F6D616E000A00000000000000000000000000CC00020000000000FFFFFF00
      000000020000000000000000007821000006004D656D6F3530000200DD000000
      EA00000072010000140000000300020001000000000000000000FFFFFF1F2C02
      000000000001000C005B7661725F73656E6465725D00000000FFFF0000000000
      0200000001000000000F0054696D6573204E657720526F6D616E000A00000000
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      00000122000006004D656D6F3531000200DD000000D600000072010000140000
      000300020001000000000000000000FFFFFF1F2C020000000000010000000000
      0000FFFF00000000000200000001000000000F0054696D6573204E657720526F
      6D616E000A0000000000000000000A000000CC00020000000000FFFFFF000000
      00020000000000000000009822000006004D656D6F3137000200DC000000AE00
      0000720100002C0000000300020001000000000000000000FFFFFF1F2C020000
      00000001000E005B7661725F72656365697665725D00000000FFFF0000000000
      0200000001000000000F0054696D6573204E657720526F6D616E000A00000000
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      00002723000006004D656D6F353200020024000000C001000045020000110000
      0003000F002C010000000000000000FFFFFF1F2C02000000000001000600C8F2
      EEE3EE3A00000000FFFF00000000000200000001000000000F0054696D657320
      4E657720526F6D616E000C00000002000000000009000000CC00020000000000
      FFFFFF00000000020000000000000000001B24000006004D656D6F3533000200
      69020000C0010000670000001100000003000F002C010000000000000000FFFF
      FF1F2C020000000000010035005B666F726D6174666C6F61742827232C232330
      F02E3030EA272C53554D285B6F6473496E766F696365322E2253554D4D225D29
      295D0003000500626567696E0D26002020202020693131203A3D2053554D285B
      6F6473496E766F696365322E2253554D4D225D293B0D0300656E6400FFFF0000
      0000000200000001000000000F0054696D6573204E657720526F6D616E000C00
      000002000000000009000000CC00020000000000FFFFFF000000000200000000
      0000000000B024000006004D656D6F353400020080020000F50300004C000000
      120000000300000001000000000000000000FFFFFF1F2C02000000000001000C
      00F1F2F02E205B50414745235D00000000FFFF00000000000200000001000000
      000F0054696D6573204E657720526F6D616E000A000000000000000000090000
      00CC00020000000000FFFFFF0000000002000000000000000000572500000600
      4D656D6F353500020024000000C8000000B80000001400000003000000010000
      00000000000000FFFFFF1F2C02000000000001001E0028F6E5EDF2F0E0EBE8E7
      EEE2E0EDEDE0FF20E1F3F5E3E0EBF2E5F0E8FF2900000000FFFF000000000002
      00000001000000000F0054696D6573204E657720526F6D616E000A0000000000
      0000000000000000CC00020000000000FFFFFF00000000020000000000000000
      000C26000006004D656D6F353600020054020000690000007C00000013000000
      0900020001000000000000000000FFFFFF1F2C020000000000010036005B464F
      524D41544441544554494D452827272722272764642727222727206D6D6D6D20
      79797979202727E32E2727272C44415445295D00000000FFFF00000000000200
      000001000000000500417269616C000A00000000000000000009000000CC0002
      0000000000FFFFFF0000000002000000000000000000C126000006004D656D6F
      353700020025000000A400000088000000130000000900020001000000000000
      000000FFFFFF1F2C020000000000010036005B464F524D41544441544554494D
      452827272722272764642727222727206D6D6D6D2079797979202727E32E2727
      272C44415445295D00000000FFFF000000000002000000010000000005004172
      69616C000A00000000000000000008000000CC00020000000000FFFFFF000000
      00020000000000000000006427000006004D656D6F3538000200100100002002
      0000E0000000200000000300000001000000000000000000FFFFFF1F2C020000
      00000001001A005B6F647353656C446F63507269682E224E414D4546524F4D22
      5D00000000FFFF00000000000200000001000000000F0054696D6573204E6577
      20526F6D616E000A00000000000000000012000000CC00020000000000FFFFFF
      0000000002000000000000000000F927000006004D656D6F3539000200100100
      00F0010000E0000000200000000300000001000000000000000000FFFFFF1F2C
      02000000000001000C005B7661725F4D61674F74645D00000000FFFF00000000
      000200000001000000000F0054696D6573204E657720526F6D616E000A000000
      00000000000012000000CC00020000000000FFFFFF0000000002000000000000
      0000009A28000006004D656D6F36300002001001000080020000E00000002000
      00000300000001000000000000000000FFFFFF1F2C020000000000010018005B
      6F647353656C446F63507269682E224E414D45544F225D00000000FFFF000000
      00000200000001000000000F0054696D6573204E657720526F6D616E000A0000
      0000000000000012000000CC00020000000000FFFFFF00000000020000000000
      000000002C29000006004D656D6F363100020071020000240000006000000014
      0000000300000001000000000000000000FFFFFF1F2C02000000000001000900
      D3D2C2C5D0C6C4C0DE00000000FFFF00000000000200000001000000000F0054
      696D6573204E657720526F6D616E000A00000000000000000012000000CC0002
      0000000000FFFFFF0000000002000000000000000000E629000006004D656D6F
      36320002007001000037000000A00000001D0000000300000001000000000000
      000000FFFFFF1F2C02000000000002001A00C7E0ECE5F1F2E8F2E5EBFC20E3EB
      E0E2EDEEE3EE20E2F0E0F7E00D1400EFEE20ECE5E4E8F6E8EDF1EAEEE920F7E0
      F1F2E800000000FFFF00000000000200000001000000000F0054696D6573204E
      657720526F6D616E000A00000000000000000008000000CC00020000000000FF
      FFFF0000000002000000000000000000792A000006004D656D6F363300020021
      020000540000003D000000100000000300000001000000000000000000FFFFFF
      1F2C02000000000001000A002028EFEEE4EFE8F1FC2900000000FFFF00000000
      000200000001000000000F0054696D6573204E657720526F6D616E000A000000
      00000000000010000000CC00020000000000FFFFFF0000000002000000000000
      000000072B000006004D656D6F3634000200A602000054000000280000001000
      00000300000001000000000000000000FFFFFF1F2C0200000000000100050028
      D4C8CE2900000000FFFF00000000000200000001000000000F0054696D657320
      4E657720526F6D616E000A00000000000000000010000000CC00020000000000
      FFFFFF0000000002000000000000000000A02B000005004D656D6F31000200F5
      01000044000000DC000000100000000300020001000000000000000000FFFFFF
      1F2C020000000000010011005B7661725F7A616D5F676C5F767261345D000000
      00FFFF00000000000200000001000000000F0054696D6573204E657720526F6D
      616E000A00000000000000000009000000CC00020000000000FFFFFF00000000
      020000000000000000006F2C000006004D656D6F363600020070000000700200
      0080010000100000000300080001000000000000000000FFFFFF1F2C02000000
      0000010050002020202020202020202020202020202020202020202020202020
      2028EFEEE4EFE8F1FC2920202020202020202020202020202020202020202020
      202020202020202020202020202020202028D4C8CE2900000000FFFF00000000
      000200000001000000000500417269616C000800000000000000000008000000
      CC00020000000000FFFFFF0000000002000000000000000000102D000006004D
      656D6F36370002001001000050020000E0000000200000000300000001000000
      000000000000FFFFFF1F2C020000000000010018005B6F647353656C446F6350
      7269682E224E414D45544F225D00000000FFFF00000000000200000001000000
      000F0054696D6573204E657720526F6D616E000A000000000000000000120000
      00CC00020000000000FFFFFF00000000020000000000000000009A2D00000600
      4D656D6F36350002002000000060020000500000001000000003000000010000
      00000000000000FFFFFF1F2C02000000000001000B00C7E0F2F0E5E1EEE2E0EB
      3A00000000FFFF00000000000200000001000000000500417269616C000A0000
      000000000000000A000000CC00020000000000FFFFFF00000000020000000000
      000000004F2E000006004D656D6F36380002002302000088020000A000000014
      0000000300020001000000000000000000FFFFFF1F2C02000000000001003600
      5B464F524D41544441544554494D452827272722272764642727222727206D6D
      6D6D2079797979202727E32E2727272C44415445295D00000000FFFF00000000
      000200000001000000000500417269616C000A00000000000000000009000000
      CC00020000000000FFFFFF0000000002000000000000000000D92E000006004D
      656D6F3639000200D0000000C0020000C00100004C0000000300000001000000
      000000000000FFFFFF1F2C00000000000001000B005B49544F4728693131295D
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      00000000000008000000CC00020000000000FFFFFF0000000002000000000000
      00FEFEFF020000000A00207661726961626C6573000000000300693131000000
      000000000000000000FC0000000000000000000000000000000058002C0F48C6
      F5D3E2401C769035374DE440}
  end
  object odsDocFromReserv: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  TDPC.DPID,'
      '  TDPC.DPCID,'
      '  TDPC.KARTID,'
      '  TDPC.FN_KOL'
      'FROM'
      #9'MED.TDPC'
      'WHERE'
      #9'TDPC.FK_REZERV_DOCID = :ADPID')
    Optimize = False
    Variables.Data = {0300000001000000060000003A4144504944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C000000080000004E414D454B415254010000000000060000004B41
      5254494401000000000006000000464E5F4B4F4C010000000000070000004D45
      444943494401000000000005000000445043494401000000000007000000464E
      5F53554D4D01000000000006000000524F574E554D0100000000000900000046
      435F53455249414C01000000000008000000464E5F5052494345010000000000
      0C000000464E5F50415254595F4E554D0100000000000800000046445F474F44
      454E0100000000000800000046435F4544495A4D010000000000}
    Cursor = crSQLWait
    Master = odsSelDocPrih
    MasterFields = 'DPID'
    DetailFields = 'ADPID'
    CommitOnPost = False
    Session = dmMain.os
    Left = 172
    Top = 372
  end
  object pmTrebSklad: TPopupMenu
    Left = 184
    Top = 40
  end
  object pmTrebNaklV2: TPopupMenu
    Left = 784
    Top = 128
    object MenuItem1: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1074' '#1072#1083#1100#1090#1077#1088#1085#1072#1090#1080#1074#1085#1086#1084' '#1074#1080#1076#1077
      OnClick = MenuItem1Click
    end
  end
  object odsNaklsInPeriod: TOracleDataSet
    SQL.Strings = (
      'select /*+rule*/'
      '    :pol as pol,'
      '    :otp as otp,'
      '    :dolpol as dolpol,'
      '    :dolotp as dolotp,'
      
        '    decode(:FILTERED_BY_DATE1,0,to_date('#39'01.01.2000'#39','#39'dd.mm.yyyy' +
        #39'),TRUNC(:DATE1)) as DATE1,'
      
        '    decode(:FILTERED_BY_DATE2,0,TRUNC(sysdate+365,'#39'yy'#39'),TRUNC(:D' +
        'ATE2)) as DATE2,'
      '    tmedic.fc_name as namemedic,'
      '    tei.fc_name as einame,'
      '    tkart.medicid,'
      '    sum(tdpc.fn_kol) fn_kol,'
      '    tkart.FN_PRICE,'
      '    sum(tkart.FN_PRICE*tdpc.fn_kol) as fn_summ, --tdpc.fn_summ,'
      '    ASU.get_glavfio as glav,'
      
        '    (select max(ltrim(rtrim(asu.pkg_strings.CONCATENATE(rownum,v' +
        'prih.fc_doc,'#39', '#39'),'#39', '#39'),'#39', '#39'))'
      '       from MED.vprih'
      '      where vprih.fp_vidmove=:vidmove'
      '    and vprih.fl_edit=0'
      '    and vprih.FC_MOGROUPID_FROM=:FC_MOGROUPID_FROM'
      
        '    and ((TRUNC(vprih.FD_DATA) >= TRUNC(:DATE1) or :FILTERED_BY_' +
        'DATE1 = 0) and (TRUNC(vprih.FD_DATA) <= TRUNC(:DATE2) or :FILTER' +
        'ED_BY_DATE2 = 0)) ) fc_doc'
      '  from MED.tdpc, MED.tkart, MED.tmedic, MED.tei, MED.vprih'
      '  where tdpc.dpid=vprih.dpid'
      '    and tdpc.kartid=tkart.kartid'
      '    and tkart.medicid=tmedic.medicid'
      '    and tmedic.eiid=tei.eiid(+)'
      '    and TKART.fl_del=0'
      '    and vprih.fp_vidmove=:vidmove'
      '    and vprih.fl_edit=0'
      '    and vprih.FC_MOGROUPID_FROM=:FC_MOGROUPID_FROM'
      
        '    and ((TRUNC(vprih.FD_DATA) >= TRUNC(:DATE1) or :FILTERED_BY_' +
        'DATE1 = 0) and (TRUNC(vprih.FD_DATA) <= TRUNC(:DATE2) or :FILTER' +
        'ED_BY_DATE2 = 0))'
      '--    AND TMEDIC.FL_VISIBLE = 1'
      '  group by '
      '    :pol,'
      '    :otp,'
      '    :dolpol,'
      '    :dolotp,'
      
        '    decode(:FILTERED_BY_DATE1,0,to_date('#39'01.01.2000'#39','#39'dd.mm.yyyy' +
        #39'),TRUNC(:DATE1)),'
      
        '    decode(:FILTERED_BY_DATE2,0,TRUNC(sysdate+365,'#39'yy'#39'),TRUNC(:D' +
        'ATE2)),'
      '    tmedic.fc_name,'
      '    tei.fc_name,'
      '    tkart.medicid,'
      '    tkart.FN_PRICE,'
      '    ASU.get_glavfio'
      '  order by LOWER(namemedic)')
    Optimize = False
    Variables.Data = {
      030000000A000000040000003A504F4C05000000000000000000000004000000
      3A4F5450050000000000000000000000070000003A444F4C504F4C0500000000
      00000000000000070000003A444F4C4F54500500000000000000000000000800
      00003A5649444D4F5645050000000000000000000000060000003A4441544531
      0C0000000000000000000000120000003A46494C54455245445F42595F444154
      4531030000000000000000000000060000003A44415445320C00000000000000
      00000000120000003A46494C54455245445F42595F4441544532030000000000
      000000000000120000003A46435F4D4F47524F555049445F46524F4D05000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000600000045494E414D4501000000000006000000464E5F4B
      4F4C010000000000090000004E414D454D454449430100000000000300000050
      4F4C010000000000030000004F545001000000000006000000444F4C504F4C01
      000000000006000000444F4C4F545001000000000007000000464E5F53554D4D
      01000000000004000000474C4156010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 544
    Top = 280
  end
  object frNaklsInPeriod: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frNaklGetValue
    Left = 544
    Top = 232
    ReportForm = {
      19000000951C0000190000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF0000000000000100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200D10000000C005265706F72745469746C65310002010000
      000018000000F6020000BA0000003100000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000060043
      68696C64310001000000C8000000140000000100000000000002003E0100000D
      00436F6C756D6E48656164657231000201000000007C010000F6020000200000
      0030000E0001000000000000000000FFFFFF1F00000000000000000000000000
      FFFF000000000002000000010000000000000001000000C80000001400000001
      0000000000000200B30100000B004D6173746572446174613100020100000000
      B4010000F6020000220000003000050001000000000000000000FFFFFF1F0000
      00000A006672444264734E616B6C00000000000000FFFF000000000002000000
      010000000000000001000000C8000000140000000100000000000002001E0200
      000B0050616765466F6F7465723100020100000000D4020000F60200001E0000
      003000030001000000000000000000FFFFFF1F00000000000000000000000000
      FFFF000000000002000000010000000000000001000000C80000001400000001
      00000000000002008B0200000D004D6173746572466F6F746572310002010000
      0000FC010000F6020000BA0000003000060001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200F702000006004368696C64
      3100020100000000D2000000F60200001F000000310015000100000000000000
      0000FFFFFF1F00000000000000000000000000FFFF0000000000020000000100
      00000006004368696C64320001000000C8000000140000000100000000000002
      005D03000006004368696C643200020100000000F2000000F602000075000000
      3000150001000000000000000000FFFFFF1F00000000000000000000000000FF
      FF000000000002000000010000000000000001000000C8000000140000000100
      00000000000000EE03000006004D656D6F3730000200F301000094000000E800
      0000150000000300000001000000000000000000FFFFFF1F2C0003020C006464
      20206D6F20207979797900010006005B444154455D0000000000000000000000
      0200000001000000000500417269616C000C00000000000000000002000000CC
      00020000000000FFFFFF00000000020000000000000000009404000005004D65
      6D6F3200020040010000B3000000A00000001C00000003000000010000000000
      00000000FFFFFF1F2C02000000000001000C00CDE0EAEBE0E4EDFBE520B92000
      03000500626567696E0D0C00202073756D6D3A3D303B20200D0300656E6400FF
      FF00000000000200000001000000000500417269616C00100000000200000000
      0000000000CC00020000000000FFFFFF00000000020000000000000000005605
      000005004D656D6F3300020090000000F6000000200200001400000003000000
      01000000000000000000FFFFFF1F2C00030200000001004400C7E020EFE5F0E8
      EEE420F1205B6F64734E616B6C73496E506572696F642E224441544531225D20
      EFEE205B6F64734E616B6C73496E506572696F642E224441544532225D000000
      00FFFF00000000000200000001000000000500417269616C000C000000040000
      00000002000000CC00020000000000FFFFFF0000000002000000000000000000
      FA05000005004D656D6F34000200300000002201000060000000380000000300
      000001000000000000000000FFFFFF1F2C02000000000003000A00CFEEF1F2E0
      E2F9E8EA3A0D0B00CFEEEBF3F7E0F2E5EBFC3A0D0B00D7E5F0E5E720EAEEE3EE
      3A00000000FFFF00000000000200000001000000000500417269616C000C0000
      0000000000000000000000CC00020000000000FFFFFF00000000020000000000
      000000002A07000005004D656D6F350002009000000021010000200200001400
      00000300000001000000000000000000FFFFFF1F2C020000000000010023005B
      6F647353656C446F63507269682E2246435F4D4F47524F555049445F46524F4D
      225D0006000500626567696E0D2900206966205B6F647353656C446F63507269
      682E2246505F5649444D4F5645225D203D2031207468656E0D3400202020506F
      737461764E616D65203A3D205B6F647353656C446F63507269682E2246435F4D
      4F47524F555049445F46524F4D225D0D050020656C73650D1400202020506F73
      7461764E616D65203A3D2027273B0D0300656E6400FFFF000000000002000000
      01000000000500417269616C000C00000004000000000000000000CC00020000
      000000FFFFFF0000000002000000000000000000A807000005004D656D6F3600
      0200900000004701000020020000140000000300000001000000000000000000
      FFFFFF1F2C0200000000000100000000000000FFFF0000000000020000000100
      0000000500417269616C000C00000004000000000000000000CC000200000000
      00FFFFFF00000000020000000000000000002F08000005004D656D6F37000200
      140000007C010000230000002000000003000F0001000000000000000000FFFF
      FF1F2C02000000000002000200B9200D0400EF2EEF2E00000000FFFF00000000
      000200000001000000000500417269616C000A0000000000000000000A000000
      CC00020000000000FFFFFF0000000002000000000000000000B908000005004D
      656D6F38000200370000007C010000180100002000000003000F000100000000
      0000000000FFFFFF1F2C02000000000001000C00CDE0E8ECE5EDEEE2E0EDE8E5
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      0000003F09000005004D656D6F390002008B0100007C01000032000000200000
      0003000F0001000000000000000000FFFFFF1F2C02000000000001000800C5E4
      2E20C8E7EC2E00000000FFFF0000000000020000000100000000050041726961
      6C000A0000000000000000000A000000CC00020000000000FFFFFF0000000002
      000000000000000000C809000006004D656D6F3130000200BD0100007C010000
      500000002000000003000F0001000000000000000000FFFFFF1F2C0200000000
      0001000A00CAEEEBE8F7E5F1F2E2EE00000000FFFF0000000000020000000100
      0000000500417269616C000A0000000000000000000A000000CC000200000000
      00FFFFFF00000000020000000000000000004B0A000006004D656D6F31330002
      000D0200007C010000550000002000000003000F0001000000000000000000FF
      FFFF1F2C02000000000001000400D6E5EDE000000000FFFF0000000000020000
      0001000000000500417269616C000A0000000000000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000CF0A000006004D656D6F31
      34000200620200007C0100007A0000002000000003000F000100000000000000
      0000FFFFFF1F2C02000000000001000500D1F3ECECE000000000FFFF00000000
      000200000001000000000500417269616C000A0000000000000000000A000000
      CC00020000000000FFFFFF0000000002000000000000000000580B000006004D
      656D6F313500020014000000B4010000230000002200000003000F0001000000
      000000000000FFFFFF1F2C02000000000001000A005B43555252454E54235D00
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      0000F50B000006004D656D6F313600020037000000B401000018010000220000
      0003000F0001000000000000000000FFFFFF1F2C02000000000001001E005B6F
      64736E616B6C73496E506572696F642E224E414D454D45444943225D00000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      000008000000CC00020000000000FFFFFF00000000020000000000000000008F
      0C000006004D656D6F31370002008B010000B401000032000000220000000300
      0F0001000000000000000000FFFFFF1F2C02000000000001001B005B6F64736E
      616B6C73496E506572696F642E2245494E414D45225D00000000FFFF00000000
      000200000001000000000500417269616C000A0000000000000000000A000000
      CC00020000000000FFFFFF0000000002000000000000000000290D000006004D
      656D6F3139000200BD010000B4010000500000002200000003000F0001000000
      000000000000FFFFFF1F2C02000000000001001B005B6F64734E616B6C73496E
      506572696F642E22464E5F4B4F4C225D00000000FFFF00000000000200000001
      000000000500417269616C000A0000000000000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000DF0D000006004D656D6F323100
      02000D020000B4010000550000002200000003000F0001000000000000000000
      FFFFFF1F2C020000000000010037005B464F524D4154464C4F4154282730F02E
      3030EA2E272C205B6F64736E616B6C73496E506572696F642E22464E5F505249
      4345225D295D00000000FFFF0000000000020000000100000000050041726961
      6C000A0000000000000000000A000000CC00020000000000FFFFFF0000000002
      000000000000000000050F000006004D656D6F323200020062020000B4010000
      7A0000002200000003000F0001000000000000000000FFFFFF1F2C0200000000
      00010051005B464F524D4154464C4F4154282730F02E3030EA2E272C205B6F64
      736E616B6C73496E506572696F642E22464E5F4B4F4C222A6F64736E616B6C73
      496E506572696F642E22464E5F5052494345225D295D0003000500626567696E
      0D4600202073756D6D3A3D73756D6D202B205B6F64736E616B6C73496E506572
      696F642E22464E5F4B4F4C222A6F64736E616B6C73496E506572696F642E2246
      4E5F5052494345225D0D0300656E6400FFFF0000000000020000000100000000
      0500417269616C000A0000000000000000000A000000CC00020000000000FFFF
      FF00000000020000000000000000008D0F000006004D656D6F31380002002400
      00004802000040000000100000000300000001000000000000000000FFFFFF1F
      2C02000000000001000900CEF2EFF3F1F2E8EB3A00000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000000000000CC00
      020000000000FFFFFF00000000020000000000000000001410000006004D656D
      6F32330002002400000087020000400000001200000003000000010000000000
      00000000FFFFFF1F2C02000000000001000800CFEEEBF3F7E8EB3A00000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      0000000000CC00020000000000FFFFFF0000000002000000000000000000AE10
      000006004D656D6F323600020090000000D3000000200200001C000000030000
      0001000000000000000000FFFFFF1F2C02000000000001001B005B6F64734E61
      6B6C73496E506572696F642E2246435F444F43225D00000000FFFF0000000000
      0200000001000000000500417269616C00100000000200000000000A000000CC
      00020000000000FFFFFF00000000020000000000000000003411000006004D65
      6D6F3239000200A4020000DC0200003800000014000000030000000100000000
      0000000000FFFFFF1F2C020000000000010007005B50414745235D00000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      0000000000CC00020000000000FFFFFF0000000002000000000000000000B911
      000006004D656D6F313200020014000000FC0100004E0200001800000003000F
      0001000000000000000000FFFFFF1F2C02000000000001000600C8F2EEE3EE3A
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      00000000000009000000CC00020000000000FFFFFF0000000002000000000000
      0000005812000006004D656D6F333000020062020000FC0100007A0000001800
      000003000F0001000000000000000000FFFFFF1F2C020000000000010020005B
      464F524D4154464C4F4154282730F02E3030EA2E272C205B73756D6D5D295D00
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      0000F812000006004D656D6F3131000200900000003501000020020000140000
      000300000001000000000000000000FFFFFF1F2C020000000000010021005B6F
      647353656C446F63507269682E2266635F6D6F67726F757069645F746F225D00
      000000FFFF00000000000200000001000000000500417269616C000C00000004
      000000000000000000CC00020000000000FFFFFF000000000200000000000000
      00009213000006004D656D6F323400020068000000440200009C000000140000
      000300020001000000000000000000FFFFFF1F2C02000000000001001B005B6F
      64734E616B6C73496E506572696F642E22444F4C4F5450225D00000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000002
      000000CC00020000000000FFFFFF00000000020000000000000000001A140000
      06004D656D6F323700020068000000580200009C000000140000000300000001
      000000000000000000FFFFFF1F2C02000000000001000900C4EEEBE6EDEEF1F2
      FC00000000FFFF00000000000200000001000000000500417269616C000A0000
      0000000000000002000000CC00020000000000FFFFFF00000000020000000000
      000000009914000006004D656D6F323800020010010000440200009C00000014
      0000000300020001000000000000000000FFFFFF1F2C02000000000001000000
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      00000000000000000000CC00020000000000FFFFFF0000000002000000000000
      0000001F15000006004D656D6F333100020010010000580200009C0000001400
      00000300000001000000000000000000FFFFFF1F2C02000000000001000700CF
      EEE4EFE8F1FC00000000FFFF0000000000020000000100000000050041726961
      6C000A00000000000000000002000000CC00020000000000FFFFFF0000000002
      000000000000000000B615000006004D656D6F3332000200B401000044020000
      EC000000140000000300020001000000000000000000FFFFFF1F2C0200000000
      00010018005B6F64734E616B6C73496E506572696F642E224F5450225D000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      00000002000000CC00020000000000FFFFFF0000000002000000000000000000
      4816000006004D656D6F3333000200B401000058020000EC0000001400000003
      00000001000000000000000000FFFFFF1F2C02000000000001001300D0E0F1F8
      E8F4F0EEE2EAE020EFEEE4EFE8F1E800000000FFFF0000000000020000000100
      0000000500417269616C000A00000000000000000002000000CC000200000000
      00FFFFFF0000000002000000000000000000E216000006004D656D6F32300002
      0068000000840200009C000000140000000300020001000000000000000000FF
      FFFF1F2C02000000000001001B005B6F64734E616B6C73496E506572696F642E
      22444F4C504F4C225D00000000FFFF0000000000020000000100000000050041
      7269616C000A00000000000000000002000000CC00020000000000FFFFFF0000
      0000020000000000000000006A17000006004D656D6F32350002006800000098
      0200009C000000140000000300000001000000000000000000FFFFFF1F2C0200
      0000000001000900C4EEEBE6EDEEF1F2FC00000000FFFF000000000002000000
      01000000000500417269616C000A00000000000000000002000000CC00020000
      000000FFFFFF0000000002000000000000000000E917000006004D656D6F3334
      00020010010000840200009C0000001400000003000200010000000000000000
      00FFFFFF1F2C0200000000000100000000000000FFFF00000000000200000001
      000000000500417269616C000A00000000000000000000000000CC0002000000
      0000FFFFFF00000000020000000000000000006F18000006004D656D6F333500
      020010010000980200009C000000140000000300000001000000000000000000
      FFFFFF1F2C02000000000001000700CFEEE4EFE8F1FC00000000FFFF00000000
      000200000001000000000500417269616C000A00000000000000000002000000
      CC00020000000000FFFFFF00000000020000000000000000000619000006004D
      656D6F3336000200B401000084020000EC000000140000000300020001000000
      000000000000FFFFFF1F2C020000000000010018005B6F64734E616B6C73496E
      506572696F642E22504F4C225D00000000FFFF00000000000200000001000000
      000500417269616C000A00000000000000000002000000CC00020000000000FF
      FFFF00000000020000000000000000009819000006004D656D6F3337000200B4
      01000098020000EC000000140000000300000001000000000000000000FFFFFF
      1F2C02000000000001001300D0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E800
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      000000000002000000CC00020000000000FFFFFF000000000200000000000000
      0000201A000005004D656D6F31000200F401000020000000E800000073000000
      0300000001000000000000000000FFFFFF1F2C02000000000001000A00D3D2C2
      C5D0C6C4C0DE3A00000000FFFF00000000000200000001000000000500417269
      616C000C00000000000000000000000000CC00020000000000FFFFFF00000000
      020000000000000000001F1B000006004D656D6F3338000200F8000000240000
      00E8000000730000000300000001000000000000000000FFFFFF1F2C02000000
      000005000A00D3D2C2C5D0C6C4C0DE3A0D1300C7E0EC2E20CDE0F7E0EBFCEDE8
      EAE020EFEE200D1E00EBE5F7E5E1EDEE2DEEE7E4EEF0EEE2E8F2E5EBFCEDEEE9
      20F0E0E1EEF2E50D1400CECECE2022D3F0E5EDE3EEE9E3E0E7EFF0EEEC220D25
      005F5F5F5F5F5F5F5F5F5F5F205B6F64734E616B6C73496E506572696F642E22
      474C4156225D0000000000000000000000020000000100000000050041726961
      6C000C00000000000000000000000000CC00020000000000FFFFFF0000000002
      000000000000000000AC1B000006004D656D6F33390002004F0100007C010000
      3C0000002000000003000F0001000000000000000000FFFFFF1F2C0200000000
      0001000E00CDEEECE5EDEAEB2E20EDEEECE5F000000000FFFF00000000000200
      000001000000000500417269616C000A0000000000000000000A000000CC0002
      0000000000FFFFFF0000000002000000000000000000471C000006004D656D6F
      34300002004F010000B40100003C0000002200000003000F0001000000000000
      000000FFFFFF1F2C02000000000001001C005B6F64736E616B6C73496E506572
      696F642E224D454449434944225D00000000FFFF000000000002000000010000
      00000500417269616C000A0000000000000000000A000000CC00020000000000
      FFFFFF000000000200000000000000FEFEFF020000000A002043617465676F72
      793100000000040073756D6D00010030000000000000000000FC010000000000
      00000000000000000000005800F296E6282BD2E2401C769035374DE440}
  end
  object pmPrintTrebNakl: TPopupMenu
    Left = 448
    Top = 56
    object N29: TMenuItem
      Action = acPrnInvoice
      Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077
    end
    object miPrintTrebWithDetail: TMenuItem
      Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1089#1087#1080#1088#1090#1072
      OnClick = miPrintTrebWithDetailClick
    end
  end
  object frDBdsFinsource_in_Doc: TfrDBDataSet
    DataSet = dmPrintReports.odsFinsource_in_Doc
    Left = 472
    Top = 408
  end
  object frxNakl: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41218.644573472200000000
    ReportOptions.LastChange = 41218.671108807870000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxNaklGetValue
    Left = 472
    Top = 176
    Datasets = <
      item
        DataSet = frxdsNakl
        DataSetName = 'frxdsNakl'
      end
      item
        DataSet = frxdsSelDocPrih
        DataSetName = 'frxdsSelDocPrih'
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
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 264.567100000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo2: TfrxMemoView
          Left = 453.543600000000000000
          Width = 264.567100000000000000
          Height = 94.488250000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1032#1056#1118#1056#8217#1056#8226#1056#160#1056#8211#1056#8221#1056#1106#1056#174':')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 453.543600000000000000
          Top = 94.488250000000000000
          Width = 264.567100000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[DATE]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 185.196970000000000000
          Width = 241.889920000000000000
          Height = 117.165430000000000000
          Visible = False
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1032#1056#1118#1056#8217#1056#8226#1056#160#1056#8211#1056#8221#1056#1106#1056#174':'
            #1056#8212#1056#176#1056#1112'. '#1056#1116#1056#176#1057#8225#1056#176#1056#187#1057#1034#1056#1029#1056#1105#1056#1108#1056#176' '#1056#1111#1056#1109' '
            #1056#187#1056#181#1057#8225#1056#181#1056#177#1056#1029#1056#1109'-'#1056#1109#1056#183#1056#1169#1056#1109#1057#1026#1056#1109#1056#1030#1056#1105#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#1109#1056#8470' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1056#181
            #1056#1115#1056#1115#1056#1115' "'#1056#1032#1057#1026#1056#181#1056#1029#1056#1110#1056#1109#1056#8470#1056#1110#1056#176#1056#183#1056#1111#1057#1026#1056#1109#1056#1112'"'
            '___________ [frxdsNakl."GLAV"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baWidth
          Top = 132.283550000000000000
          Width = 718.110700000000000000
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
            #1056#1116#1056#176#1056#1108#1056#187#1056#176#1056#1169#1056#1029#1056#176#1057#1039'  '#1074#8222#8211' [frxdsSelDocPrih."FC_DOC"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baWidth
          Top = 158.740260000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1109#1057#8218' [frxdsSelDocPrih."DATA"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 37.795300000000000000
          Top = 207.874150000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1057#8240#1056#1105#1056#1108':')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 37.795300000000000000
          Top = 226.771800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034':')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 37.795300000000000000
          Top = 245.669450000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#167#1056#181#1057#1026#1056#181#1056#183' '#1056#1108#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 151.181200000000000000
          Top = 207.874150000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxdsSelDocPrih."FC_MOGROUPID_FROM"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 151.181200000000000000
          Top = 226.771800000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxdsSelDocPrih."FC_MOGROUPID_TO"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 151.181200000000000000
          Top = 245.669450000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 672.756340000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677165350000000000
        Top = 411.968770000000000000
        Width = 718.110700000000000000
        DataSet = frxdsNakl
        DataSetName = 'frxdsNakl'
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
          Width = 347.716535433070900000
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
            '[frxdsNakl."NAMEMEDIC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 377.953000000000000000
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
            '[frxdsNakl."EINAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 529.134200000000000000
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
            '[FORMATFLOAT('#39'0'#1057#1026'.00'#1056#1108'.'#39', <frxdsNakl."FN_PRICE">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 453.543600000000000000
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
            '[frxdsNakl."FN_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
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
            '[FORMATFLOAT('#39'0'#1057#1026'.00'#1056#1108'.'#39', <frxdsNakl."FN_SUMM">)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 45.354360000000000000
        Top = 343.937230000000000000
        Width = 718.110700000000000000
        object Memo21: TfrxMemoView
          Top = 7.559060000000000000
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
            #1074#8222#8211
            #1056#1111'.'#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 30.236240000000000000
          Top = 7.559060000000000000
          Width = 347.716535433070900000
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
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 377.953000000000000000
          Top = 7.559060000000000000
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
          Left = 529.134200000000000000
          Top = 7.559060000000000000
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
          Left = 453.543600000000000000
          Top = 7.559060000000000000
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
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 604.724800000000000000
          Top = 7.559060000000000000
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
        Height = 22.677180000000000000
        Top = 457.323130000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo33: TfrxMemoView
          ShiftMode = smDontShift
          Width = 604.724800000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
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
        object Memo34: TfrxMemoView
          ShiftMode = smDontShift
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[FORMATFLOAT('#39'0'#1057#1026'.00'#1056#1108'.'#39', SUM(<frxdsNakl."FN_SUMM">,MasterData1)' +
              ')]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 109.606370000000000000
        Top = 540.472790000000000000
        Width = 718.110700000000000000
        object Memo13: TfrxMemoView
          Left = 37.795300000000000000
          Top = 15.118120000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1107#1057#1027#1057#8218#1056#1105#1056#187':')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 34.015770000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 37.795300000000000000
          Top = 71.811070000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
        object Memo16: TfrxMemoView
          Left = 113.385900000000000000
          Top = 15.118120000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsNakl."DOLOTP"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 302.362400000000000000
          Top = 34.015770000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 302.362400000000000000
          Top = 15.118120000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 491.338900000000000000
          Top = 34.015770000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105)
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 491.338900000000000000
          Top = 15.118120000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsNakl."OTP"]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 113.385900000000000000
          Top = 90.708720000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034)
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsNakl."DOLPOL"]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 302.362400000000000000
          Top = 90.708720000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 302.362400000000000000
          Top = 71.811070000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 491.338900000000000000
          Top = 90.708720000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105)
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 491.338900000000000000
          Top = 71.811070000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsNakl."POL"]')
          ParentFont = False
        end
      end
    end
  end
  object frxdsNakl: TfrxDBDataset
    UserName = 'frxdsNakl'
    CloseDataSource = False
    DataSet = odsNakl
    BCDToCurrency = False
    Left = 472
    Top = 352
  end
  object frxdsSelDocPrih: TfrxDBDataset
    UserName = 'frxdsSelDocPrih'
    CloseDataSource = False
    DataSet = odsSelDocPrih
    BCDToCurrency = False
    Left = 32
    Top = 384
  end
  object frxOstAct: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41218.644573472200000000
    ReportOptions.LastChange = 41218.675213946760000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 408
    Top = 176
    Datasets = <
      item
        DataSet = frxdsOstAct
        DataSetName = 'frxdsOstAct'
      end
      item
        DataSet = frxdsSelDocPrih
        DataSetName = 'frxdsSelDocPrih'
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
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 177.637910000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo2: TfrxMemoView
          Left = 453.543600000000000000
          Width = 264.567100000000000000
          Height = 94.488250000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1032#1056#1118#1056#8217#1056#8226#1056#160#1056#8211#1056#8221#1056#1106#1056#174':')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 453.543600000000000000
          Top = 94.488250000000000000
          Width = 264.567100000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218' [frxdsSelDocPrih."DATA"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 185.196970000000000000
          Width = 241.889920000000000000
          Height = 117.165430000000000000
          Visible = False
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1032#1056#1118#1056#8217#1056#8226#1056#160#1056#8211#1056#8221#1056#1106#1056#174':'
            #1056#8212#1056#176#1056#1112'. '#1056#1116#1056#176#1057#8225#1056#176#1056#187#1057#1034#1056#1029#1056#1105#1056#1108#1056#176' '#1056#1111#1056#1109' '
            #1056#187#1056#181#1057#8225#1056#181#1056#177#1056#1029#1056#1109'-'#1056#1109#1056#183#1056#1169#1056#1109#1057#1026#1056#1109#1056#1030#1056#1105#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#1109#1056#8470' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1056#181
            #1056#1115#1056#1115#1056#1115' "'#1056#1032#1057#1026#1056#181#1056#1029#1056#1110#1056#1109#1056#8470#1056#1110#1056#176#1056#183#1056#1111#1057#1026#1056#1109#1056#1112'"'
            '___________ [frxdsNakl."GLAV"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baWidth
          Top = 132.283550000000000000
          Width = 718.110700000000000000
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
            
              #1056#1106#1056#1108#1057#8218' '#1056#1030#1056#1030#1056#1109#1056#1169#1056#176' '#1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1108#1056#1109#1056#1030'  '#1074#8222#8211' [frxdsSelDocPrih."FC_DOC' +
              '"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baWidth
          Top = 158.740260000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1109#1057#8218' [frxdsSelDocPrih."FD_INVOICE"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 536.693260000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677165350000000000
        Top = 325.039580000000000000
        Width = 718.110700000000000000
        DataSet = frxdsOstAct
        DataSetName = 'frxdsOstAct'
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
          Width = 347.716535430000000000
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
            '[frxdsOstAct."NAMEMEDIC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 377.953000000000000000
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
            '[frxdsOstAct."EINAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 529.134200000000000000
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
            '[FORMATFLOAT('#39'0'#1057#1026'.00'#1056#1108'.'#39', <frxdsOstAct."FN_PRICE">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 453.543600000000000000
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
            '[frxdsOstAct."FN_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
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
            '[FORMATFLOAT('#39'0'#1057#1026'.00'#1056#1108'.'#39', <frxdsOstAct."FN_SUMM">)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 45.354360000000000000
        Top = 257.008040000000000000
        Width = 718.110700000000000000
        object Memo21: TfrxMemoView
          Top = 7.559060000000000000
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
            #1074#8222#8211
            #1056#1111'.'#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 30.236240000000000000
          Top = 7.559060000000000000
          Width = 347.716535430000000000
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
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' ('#1056#1111#1056#176#1057#1026#1057#8218#1056#1105#1057#1039')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 377.953000000000000000
          Top = 7.559060000000000000
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
          Left = 529.134200000000000000
          Top = 7.559060000000000000
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
          Left = 453.543600000000000000
          Top = 7.559060000000000000
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
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 604.724800000000000000
          Top = 7.559060000000000000
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
        Height = 22.677180000000000000
        Top = 370.393940000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo33: TfrxMemoView
          ShiftMode = smDontShift
          Width = 604.724800000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
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
        object Memo34: TfrxMemoView
          ShiftMode = smDontShift
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[FORMATFLOAT('#39'0'#1057#1026'.00'#1056#1108'.'#39', SUM(<frxdsOstAct."FN_SUMM">,MasterData' +
              '1))]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 60.472480000000000000
        Top = 453.543600000000000000
        Width = 718.110700000000000000
        object Memo13: TfrxMemoView
          Left = 18.897650000000000000
          Top = 15.118120000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1106#1056#1108#1057#8218' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1105#1056#187':')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 34.015770000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 113.385900000000000000
          Top = 15.118120000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 302.362400000000000000
          Top = 34.015770000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 302.362400000000000000
          Top = 15.118120000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 491.338900000000000000
          Top = 34.015770000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105)
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 491.338900000000000000
          Top = 15.118120000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsOstAct."FC_NAME"]')
          ParentFont = False
        end
      end
    end
  end
  object frxdsOstAct: TfrxDBDataset
    UserName = 'frxdsOstAct'
    CloseDataSource = False
    DataSet = odsOstAct
    BCDToCurrency = False
    Left = 408
    Top = 312
  end
  object frxLittleKart: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41218.689778958330000000
    ReportOptions.LastChange = 41436.385272071760000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 248
    Top = 112
    Datasets = <
      item
        DataSet = frxdsMedKart
        DataSetName = 'frxdsMedKart'
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
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      ColumnWidth = 95.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 207.874150000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Columns = 2
        ColumnWidth = 359.055118110236200000
        DataSet = frxdsMedKart
        DataSetName = 'frxdsMedKart'
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 37.795300000000000000
          Top = 18.897650000000000000
          Width = 283.464750000000000000
          Height = 170.078850000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 37.795300000000000000
          Top = 18.897650000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1118#1056#8226#1056#8250#1056#8250#1056#1106#1056#8211#1056#1116#1056#1106#1056#1031' '#1056#1113#1056#1106#1056#160#1056#1118#1056#1115#1056#167#1056#1113#1056#1106)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 37.795300000000000000
          Top = 37.795300000000000000
          Width = 283.464750000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMedKart."FC_MEDIC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 37.795300000000000000
          Top = 75.590600000000000000
          Width = 132.283550000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxdsMedKart."FC_SERIAL"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 37.795300000000000000
          Top = 105.826840000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1056#181#1057#1026#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 173.858380000000000000
          Top = 75.590600000000000000
          Width = 147.401670000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMedKart."FN_PRICE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 173.858380000000000000
          Top = 105.826840000000000000
          Width = 147.401670000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#8224#1056#181#1056#1029#1056#176' '#1057#1026#1056#1109#1056#183#1056#1029#1056#1105#1057#8225#1056#1029#1056#176#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 37.795300000000000000
          Top = 117.165430000000000000
          Width = 188.976377950000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMedKart."FC_POSTAV_NAME"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 37.795300000000000000
          Top = 147.401670000000000000
          Width = 188.976377950000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1057#8240#1056#1105#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 230.551330000000000000
          Top = 117.165430000000000000
          Width = 90.708597950000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMedKart."FD_DATA"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 230.551330000000000000
          Top = 147.401670000000000000
          Width = 90.708597950000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1169#1056#176#1057#8218#1056#176' '#1056#1111#1056#1109#1057#1027#1057#8218#1057#1107#1056#1111#1056#187#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 37.795300000000000000
          Top = 158.740260000000000000
          Width = 52.913297950000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 37.795300000000000000
          Top = 173.858380000000000000
          Width = 52.913297950000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109':')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 90.708720000000000000
          Top = 173.858380000000000000
          Width = 136.062957950000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxdsMedKart."FN_KOL"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 90.708720000000000000
          Top = 158.740260000000000000
          Width = 136.062957950000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[frxdsMedKart."FC_UEDIZM"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 230.551330000000000000
          Top = 158.740260000000000000
          Width = 90.708597950000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMedKart."FC_GODEN"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 230.551330000000000000
          Top = 173.858380000000000000
          Width = 90.708597950000000000
          Height = 11.338590000000000000
          ShowHint = False
          Color = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1169#1056#176#1057#8218#1056#176' '#1056#1111#1056#1109#1057#1027#1057#8218#1057#1107#1056#1111#1056#187#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxdsMedKart: TfrxDBDataset
    UserName = 'frxdsMedKart'
    CloseDataSource = False
    DataSet = odsMedKart
    BCDToCurrency = False
    Left = 472
    Top = 112
  end
  object frxLittleKart1: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41218.689778958300000000
    ReportOptions.LastChange = 41423.677009606500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      '//var v_fd_data;                                        '
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '//  v_fd_data=FORMATDATETIME('#39'dd.mm.yyyy'#39', <frxdsMedKart."fd_dat' +
        'a">);        '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 240
    Top = 160
    Datasets = <
      item
        DataSet = frxdsMedKart
        DataSetName = 'frxdsMedKart'
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
      ColumnWidth = 95.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 211.653680000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxdsMedKart
        DataSetName = 'frxdsMedKart'
        RowCount = 0
        object Memo2: TfrxMemoView
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1118#1056#8226#1056#8250#1056#8250#1056#1106#1056#8211#1056#1116#1056#1106#1056#1031' '#1056#1113#1056#1106#1056#160#1056#1118#1056#1115#1056#167#1056#1113#1056#1106)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 264.567100000000000000
          Top = 18.897650000000000000
          Width = 491.338900000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMedKart."FC_PROD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 264.567100000000000000
          Top = 94.488250000000000000
          Width = 491.338900000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMedKart."FC_MEDIC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 264.567100000000000000
          Top = 132.283550000000000000
          Width = 491.338900000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMedKart."FC_GODEN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 264.567100000000000000
          Top = 170.078850000000000000
          Width = 491.338900000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMedKart."FC_FINSOURCE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 264.567100000000000000
          Top = 56.692950000000000000
          Width = 491.338900000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMedKart."fc_docmix"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 18.897650000000000000
          Width = 264.567100000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1056#1105#1056#183#1056#1030#1056#1109#1056#1169#1056#1105#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 56.692950000000000000
          Width = 264.567100000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026' '#1057#8218#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 94.488250000000000000
          Width = 264.567100000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 132.283550000000000000
          Width = 264.567100000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1026#1056#1109#1056#1108' '#1056#1110#1056#1109#1056#1169#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 170.078850000000000000
          Width = 264.567100000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#1027#1057#8218#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108' '#1057#8222#1056#1105#1056#1029#1056#176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object TEST: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41218.689778958300000000
    ReportOptions.LastChange = 41431.655562523150000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      '//var v_fd_data;                                        '
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '//  v_fd_data=FORMATDATETIME('#39'dd.mm.yyyy'#39', <frxdsMedKart."fd_dat' +
        'a">);        '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 240
    Top = 232
    Datasets = <
      item
        DataSet = frxdsMedKart
        DataSetName = 'frxdsMedKart'
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
      ColumnWidth = 95.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 291.023810000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxdsMedKart
        DataSetName = 'frxdsMedKart'
        RowCount = 0
        object Memo2: TfrxMemoView
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1118#1056#8226#1056#8250#1056#8250#1056#1106#1056#8211#1056#1116#1056#1106#1056#1031' '#1056#1113#1056#1106#1056#160#1056#1118#1056#1115#1056#167#1056#1113#1056#1106)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 264.567100000000000000
          Top = 170.078850000000000000
          Width = 491.338900000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMedKart."FC_PROD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 264.567100000000000000
          Top = 18.897650000000000000
          Width = 491.338900000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMedKart."FC_MEDIC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 264.567100000000000000
          Top = 132.283550000000000000
          Width = 491.338900000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMedKart."FC_GODEN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 264.567100000000000000
          Top = 207.874150000000000000
          Width = 491.338900000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMedKart."FC_FINSOURCE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 264.567100000000000000
          Top = 245.669450000000000000
          Width = 491.338900000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMedKart."fc_docmix"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 170.078850000000000000
          Width = 264.567100000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1056#1105#1056#183#1056#1030#1056#1109#1056#1169#1056#1105#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 245.669450000000000000
          Width = 264.567100000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026' '#1057#8218#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 18.897650000000000000
          Width = 264.567100000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 132.283550000000000000
          Width = 264.567100000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1026#1056#1109#1056#1108' '#1056#1110#1056#1109#1056#1169#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 207.874150000000000000
          Width = 264.567100000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#1027#1057#8218#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108' '#1057#8222#1056#1105#1056#1029#1056#176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 56.692950000000000000
          Width = 264.567100000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#1109#1057#1026#1056#1112#1056#176' '#1056#1030#1057#8249#1056#1111#1057#1107#1057#1027#1056#1108#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 94.488250000000000000
          Width = 264.567100000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#181#1057#1026#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 264.567100000000000000
          Top = 56.692950000000000000
          Width = 491.338900000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMedKart."FC_UEDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 264.567100000000000000
          Top = 94.488250000000000000
          Width = 491.338900000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMedKart."FC_SERIAL"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
end
