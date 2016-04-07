object frmMedProduceList: TfrmMedProduceList
  Left = 159
  Top = 81
  Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074
  ClientHeight = 502
  ClientWidth = 891
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'StMedsestra.chm'
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 323
    Width = 891
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    AutoSnap = False
    MinSize = 100
    ExplicitTop = 317
    ExplicitWidth = 1016
  end
  object panel: TPanel
    Left = 0
    Top = 328
    Width = 891
    Height = 174
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'panel'
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 0
      Top = 0
      Width = 891
      Height = 174
      Align = alClient
      Caption = #1048#1085#1075#1088#1080#1076#1080#1077#1085#1090#1099':'
      TabOrder = 0
      object cxGridIngr: TcxGrid
        Left = 2
        Top = 41
        Width = 887
        Height = 131
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        object cxGridIngrDBTableView1: TcxGridDBTableView
          OnDblClick = dbgDblClick
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsIngridients
          DataController.Filter.MaxValueListCount = 1000
          DataController.Filter.Active = True
          DataController.KeyFieldNames = 'FK_ID'
          DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Filtering.ColumnPopup.MaxDropDownItemCount = 12
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsSelection.HideSelection = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.Indicator = True
          Preview.AutoHeight = False
          Preview.MaxLineCount = 2
          Styles.ContentEven = dmMain.cxStyleGridDetailEvenRow
          Styles.ContentOdd = dmMain.cxStyleGridDetailOddRow
          Styles.Selection = dmMain.cxStyleGridSelectedRow
          object cxGridIngrDBTableView1ROWNUM: TcxGridDBColumn
            Caption = #8470
            DataBinding.FieldName = 'ROWNUM'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Options.Editing = False
            Width = 20
          end
          object cxGridIngrDBTableView1FK_ID: TcxGridDBColumn
            DataBinding.FieldName = 'FK_ID'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
            Width = 107
          end
          object cxGridIngrDBTableView1FK_TKARTCOMPOSID: TcxGridDBColumn
            DataBinding.FieldName = 'FK_TKARTCOMPOSID'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
            Width = 201
          end
          object cxGridIngrDBTableView1FK_KART_ITEM: TcxGridDBColumn
            DataBinding.FieldName = 'FK_KART_ITEM'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
            Width = 147
          end
          object cxGridIngrDBTableView1TKART_NAME: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'TKART_NAME'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 255
            Properties.ReadOnly = True
            Options.Editing = False
            Width = 205
          end
          object cxGridIngrDBTableView1FN_PARTY_NUM: TcxGridDBColumn
            Caption = #8470' '#1087#1072#1088#1090#1080#1080
            DataBinding.FieldName = 'FN_PARTY_NUM'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Options.Editing = False
          end
          object cxGridIngrDBTableView1FC_SERIAL: TcxGridDBColumn
            Caption = #1057#1077#1088#1080#1103
            DataBinding.FieldName = 'FC_SERIAL'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 50
            Properties.ReadOnly = True
            Options.Editing = False
            Width = 103
          end
          object cxGridIngrDBTableView1FC_UEDIZM: TcxGridDBColumn
            Caption = #1059#1087'.'#1077#1076'.'#1080#1079#1084
            DataBinding.FieldName = 'FC_UEDIZM'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 1024
            Properties.ReadOnly = True
            Options.Editing = False
            Width = 79
          end
          object cxGridIngrDBTableView1FK_FINSOURCE_ID: TcxGridDBColumn
            Caption = #1048#1089#1090'. '#1092#1080#1085'-'#1080#1103
            DataBinding.FieldName = 'FK_FINSOURCE_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.ImmediatePost = True
            Properties.KeyFieldNames = 'FK_ID'
            Properties.ListColumns = <
              item
                FieldName = 'FC_NAME'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmMain.dsTFinSource
            Options.Editing = False
            Width = 60
          end
          object cxGridIngrDBTableView1FN_AMOUNT: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086
            DataBinding.FieldName = 'FN_AMOUNT_FOR1'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.AssignedValues.MinValue = True
            Properties.DisplayFormat = '### ### ### ##0.#######'
            Properties.MaxValue = 999999999.000000000000000000
            Properties.ValueType = vtFloat
            Properties.OnEditValueChanged = cxGridIngrDBTableView1FN_AMOUNTPropertiesEditValueChanged
            Width = 94
          end
          object cxGridIngrDBTableView1FN_AMOUNT1: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1089#1087#1080#1089#1072#1085#1086
            DataBinding.FieldName = 'FN_AMOUNT'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.AssignedValues.MinValue = True
            Properties.DisplayFormat = '### ### ### ##0.#######'
            Properties.MaxValue = 999999999.000000000000000000
            Properties.ValueType = vtFloat
            Options.Editing = False
            Width = 80
          end
          object cxGridIngrDBTableView1FN_PRICE: TcxGridDBColumn
            Caption = #1062#1077#1085#1072', '#1088
            DataBinding.FieldName = 'FN_PRICE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.UseThousandSeparator = True
            Options.Editing = False
            Width = 55
          end
          object cxGridIngrDBTableView1FN_SUMMA: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072', '#1088
            DataBinding.FieldName = 'FN_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.UseThousandSeparator = True
            Options.Editing = False
            Width = 76
          end
        end
        object cxGridIngrLevel1: TcxGridLevel
          GridView = cxGridIngrDBTableView1
        end
      end
      object ToolBar2: TToolBar
        Left = 2
        Top = 15
        Width = 887
        Height = 26
        AutoSize = True
        BorderWidth = 1
        ButtonWidth = 78
        Caption = 'ToolBar2'
        Images = dmMain.ilMain
        List = True
        ParentShowHint = False
        ShowCaptions = True
        ShowHint = True
        TabOrder = 1
        Visible = False
        object btnAdd: TToolButton
          Left = 0
          Top = 0
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1085#1075#1088#1080#1076#1080#1077#1085#1090
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          ImageIndex = 21
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAddClick
        end
        object btnEdit: TToolButton
          Left = 78
          Top = 0
          Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1080#1085#1075#1088#1080#1076#1080#1077#1085#1090
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          Enabled = False
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
          OnClick = btnEditClick
        end
        object btnDel: TToolButton
          Left = 156
          Top = 0
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1080#1085#1075#1088#1080#1076#1080#1077#1085#1090
          Caption = #1059#1076#1072#1083#1080#1090#1100
          Enabled = False
          ImageIndex = 22
          ParentShowHint = False
          ShowHint = True
          OnClick = btnDelClick
        end
      end
    end
  end
  object paMedKart: TPanel
    Left = 0
    Top = 0
    Width = 891
    Height = 323
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object grbMedics: TGroupBox
      Left = 0
      Top = 0
      Width = 891
      Height = 323
      Align = alClient
      Caption = #1048#1079#1075#1086#1090#1072#1074#1083#1080#1074#1072#1077#1084#1099#1077' '#1052#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099':'
      TabOrder = 0
      object ToolBar1: TToolBar
        Left = 2
        Top = 15
        Width = 887
        Height = 48
        AutoSize = True
        BorderWidth = 1
        ButtonHeight = 44
        ButtonWidth = 89
        Caption = 'ToolBar1'
        Images = dmMain.ilMain
        ParentShowHint = False
        ShowCaptions = True
        ShowHint = True
        TabOrder = 0
        object ToolButton4: TToolButton
          Left = 0
          Top = 0
          Action = acAdd
          AutoSize = True
        end
        object tbuAddByTreb: TToolButton
          Left = 61
          Top = 0
          Action = acAddByTreb
          AutoSize = True
        end
        object ToolButton12: TToolButton
          Left = 148
          Top = 0
          Width = 8
          Caption = 'ToolButton12'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object ToolButton1: TToolButton
          Left = 156
          Top = 0
          Action = acEdit
          AutoSize = True
        end
        object ToolButton2: TToolButton
          Left = 218
          Top = 0
          Action = acDel
          AutoSize = True
        end
        object ToolButton5: TToolButton
          Left = 272
          Top = 0
          Width = 8
          Caption = 'ToolButton5'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object ToolButton6: TToolButton
          Left = 280
          Top = 0
          Action = acRefresh
          AutoSize = True
        end
        object ToolButton7: TToolButton
          Left = 340
          Top = 0
          Width = 8
          Caption = 'ToolButton7'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object tbuPrint: TToolButton
          Left = 348
          Top = 0
          AutoSize = True
          Caption = #1055#1077#1095#1072#1090#1100
          DropdownMenu = pmPrint
          ImageIndex = 32
          Style = tbsDropDown
          OnClick = tbuPrintClick
        end
        object tbuSign: TToolButton
          Left = 416
          Top = 0
          Action = acSign
          AutoSize = True
        end
        object ToolButton9: TToolButton
          Left = 493
          Top = 0
          Width = 8
          Caption = 'ToolButton9'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object ToolButton8: TToolButton
          Left = 501
          Top = 0
          Action = acSetDatePeriod
          AutoSize = True
          ImageIndex = 57
        end
        object ToolButton11: TToolButton
          Left = 550
          Top = 0
          Width = 8
          Caption = 'ToolButton11'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object ToolButton3: TToolButton
          Left = 558
          Top = 0
          Action = acClose
          AutoSize = True
        end
        object ToolButton10: TToolButton
          Left = 613
          Top = 0
          Width = 8
          Caption = 'ToolButton10'
          ImageIndex = 2
          Style = tbsSeparator
        end
      end
      object Panel1: TPanel
        Left = 2
        Top = 292
        Width = 887
        Height = 29
        Align = alBottom
        TabOrder = 1
        Visible = False
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 51
          Height = 13
          Hint = #1057#1091#1084#1084#1072' '#1080#1085#1075#1088#1080#1076#1080#1077#1085#1090#1086#1074
          Caption = #1057#1091#1084#1084#1072'1:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 450
          Top = 8
          Width = 56
          Height = 13
          Caption = #1053#1072#1094#1077#1085#1082#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 585
          Top = 8
          Width = 49
          Height = 13
          Caption = #1059#1094#1077#1085#1082#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object laFN_SUMMA_FOR_INGRIDIENTS: TLabel
          Left = 57
          Top = 8
          Width = 27
          Height = 13
          Caption = '         '
        end
        object laFN_NACHENKA: TLabel
          Left = 507
          Top = 8
          Width = 6
          Height = 13
          Caption = '  '
        end
        object laFN_UCHENKA: TLabel
          Left = 638
          Top = 8
          Width = 6
          Height = 13
          Caption = '  '
        end
        object Label4: TLabel
          Left = 223
          Top = 8
          Width = 44
          Height = 13
          Hint = #1057#1091#1084#1084#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
          Caption = #1057#1091#1084#1084#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object laFN_SUMMA_TRUNCED: TLabel
          Left = 277
          Top = 8
          Width = 27
          Height = 13
          Caption = '         '
        end
      end
      object cxGridProduceMedics: TcxGrid
        Left = 2
        Top = 63
        Width = 887
        Height = 229
        Align = alClient
        TabOrder = 2
        LookAndFeel.Kind = lfUltraFlat
        object cxGridProduceMedicsDBTableView1: TcxGridDBTableView
          OnDblClick = dbgDblClick
          NavigatorButtons.ConfirmDelete = False
          OnCustomDrawCell = cxGridProduceMedicsDBTableView1CustomDrawCell
          DataController.DataSource = dsKARTCOMPOS
          DataController.Filter.MaxValueListCount = 1000
          DataController.Filter.Active = True
          DataController.KeyFieldNames = 'FK_ID'
          DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = cxGridProduceMedicsDBTableView1FN_SUMMA_FOR_INGRIDIENTS
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = cxGridProduceMedicsDBTableView1FN_SUMMA_TRUNCED
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = cxGridProduceMedicsDBTableView1FN_NACHENKA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = cxGridProduceMedicsDBTableView1FN_UCHENKA
            end
            item
              Format = #1050#1086#1083'-'#1074#1086': ### ### ###'
              Kind = skCount
              Column = cxGridProduceMedicsDBTableView1FC_NAME
            end>
          DataController.Summary.SummaryGroups = <>
          Filtering.ColumnPopup.MaxDropDownItemCount = 12
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.Deleting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.Indicator = True
          Preview.AutoHeight = False
          Preview.MaxLineCount = 2
          Styles.ContentEven = dmMain.cxStyleGridEvenRow
          Styles.ContentOdd = dmMain.cxStyleGridOddRow
          Styles.Selection = dmMain.cxStyleGridSelectedRow
          Styles.Footer = dmMain.cxStyleFooter
          object cxGridProduceMedicsDBTableView1ROWNUM: TcxGridDBColumn
            Caption = #1055#1086#1088'. '#8470
            DataBinding.FieldName = 'ROWNUM'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Options.Editing = False
            Width = 60
          end
          object cxGridProduceMedicsDBTableView1FK_ID: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'FK_ID'
            PropertiesClassName = 'TcxSpinEditProperties'
            Visible = False
            Options.Editing = False
            Width = 55
          end
          object cxGridProduceMedicsDBTableView1FN_NUMBER: TcxGridDBColumn
            Caption = #8470
            DataBinding.FieldName = 'FN_NUMBER'
            PropertiesClassName = 'TcxSpinEditProperties'
            Options.Editing = False
            Width = 57
          end
          object cxGridProduceMedicsDBTableView1FD_DATA: TcxGridDBColumn
            Caption = #1044#1072#1090#1072
            DataBinding.FieldName = 'FD_DATA'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.DateButtons = [btnClear, btnToday]
            Properties.DateOnError = deToday
            Options.Editing = False
            SortIndex = 0
            SortOrder = soAscending
            Width = 90
          end
          object cxGridProduceMedicsDBTableView1FC_SERIAL: TcxGridDBColumn
            Caption = #1057#1077#1088#1080#1103
            DataBinding.FieldName = 'FC_SERIAL'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 50
            Properties.ReadOnly = True
            Options.Editing = False
            Width = 91
          end
          object cxGridProduceMedicsDBTableView1FK_MEDICID: TcxGridDBColumn
            Caption = #1050#1086#1076' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'FK_MEDICID'
            Visible = False
            Options.Editing = False
            Width = 73
          end
          object cxGridProduceMedicsDBTableView1FC_NAME: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_NAME'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 255
            Properties.ReadOnly = True
            Options.Editing = False
            Width = 242
          end
          object cxGridProduceMedicsDBTableView1FC_UEDIZM: TcxGridDBColumn
            Caption = #1059#1087'.'#1077#1076'.'#1080#1079#1084
            DataBinding.FieldName = 'FC_UEDIZM'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 1024
            Properties.ReadOnly = True
            Options.Editing = False
            Width = 71
          end
          object cxGridProduceMedicsDBTableView1FK_FINSOURCE_ID: TcxGridDBColumn
            Caption = #1048#1089#1090'. '#1092#1080#1085'-'#1080#1103
            DataBinding.FieldName = 'FK_FINSOURCE_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.ImmediatePost = True
            Properties.KeyFieldNames = 'FK_ID'
            Properties.ListColumns = <
              item
                FieldName = 'FC_NAME'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmMain.dsTFinSource
            Options.Editing = False
            Width = 60
          end
          object cxGridProduceMedicsDBTableView1FN_AMOUNT: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086
            DataBinding.FieldName = 'FN_AMOUNT'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.DisplayFormat = '### ### ### ##0.#######'
            Options.Editing = False
            Width = 56
          end
          object cxGridProduceMedicsDBTableView1FN_PRICE_FOR_1: TcxGridDBColumn
            Caption = #1062#1077#1085#1072' 1 '#1087#1086#1079#1080#1094#1080#1080', '#1088
            DataBinding.FieldName = 'FN_PRICE_FOR_1'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.UseThousandSeparator = True
            Options.Editing = False
            Width = 66
          end
          object cxGridProduceMedicsDBTableView1FN_SUMMA_FOR_INGRIDIENTS: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072'1, '#1088
            DataBinding.FieldName = 'FN_SUMMA_FOR_INGRIDIENTS'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = ',0.00;-,0.00'
            Options.Editing = False
            Width = 85
          end
          object cxGridProduceMedicsDBTableView1FN_SUMMA_TRUNCED: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072', '#1088
            DataBinding.FieldName = 'FN_SUMMA_TRUNCED'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = ',0.00;-,0.00'
            Options.Editing = False
            Width = 72
          end
          object cxGridProduceMedicsDBTableView1FN_NACHENKA: TcxGridDBColumn
            Caption = #1053#1072#1094#1077#1085#1082#1072', '#1088
            DataBinding.FieldName = 'FN_NACHENKA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.UseThousandSeparator = True
            Options.Editing = False
            Width = 51
          end
          object cxGridProduceMedicsDBTableView1FN_UCHENKA: TcxGridDBColumn
            Caption = #1059#1094#1077#1085#1082#1072', '#1088
            DataBinding.FieldName = 'FN_UCHENKA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.UseThousandSeparator = True
            Options.Editing = False
            Width = 53
          end
          object cxGridProduceMedicsDBTableView1FN_AMOUNT_POLUCHENO: TcxGridDBColumn
            Caption = #1055#1086#1083#1091#1095#1077#1085#1086
            DataBinding.FieldName = 'FN_AMOUNT_POLUCHENO'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Options.Editing = False
            Width = 50
          end
          object cxGridProduceMedicsDBTableView1PODPISAN: TcxGridDBColumn
            Caption = #1055#1086#1076#1087#1080#1089#1072#1085
            DataBinding.FieldName = 'PODPISAN'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 3
            Properties.ReadOnly = True
            Options.Editing = False
            Width = 46
          end
          object cxGridProduceMedicsDBTableView1FK_PRODUCE_TYPE: TcxGridDBColumn
            Caption = #1058#1080#1087' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
            DataBinding.FieldName = 'FK_PRODUCE_TYPE'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownAutoSize = True
            Properties.DropDownSizeable = True
            Properties.ImmediatePost = True
            Properties.KeyFieldNames = 'FK_ID'
            Properties.ListColumns = <
              item
                Caption = #1058#1080#1087' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
                Width = 150
                FieldName = 'FC_NAME'
              end>
            Properties.ListSource = dsTProduce_type
            Visible = False
            VisibleForCustomization = False
            Width = 80
          end
          object cxGridProduceMedicsDBTableView1dpid_prich_str: TcxGridDBColumn
            Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
            DataBinding.FieldName = 'dpid_prich_str'
            Options.Editing = False
            Width = 95
          end
          object cxGridProduceMedicsDBTableView1dpid_rasch_str: TcxGridDBColumn
            Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
            DataBinding.FieldName = 'dpid_rasch_str'
            Options.Editing = False
            Width = 95
          end
        end
        object cxGridProduceMedicsLevel1: TcxGridLevel
          GridView = cxGridProduceMedicsDBTableView1
        end
      end
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 670
    Top = 80
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      ImageIndex = 1
      ShortCut = 16499
      OnExecute = acCloseExecute
    end
    object acDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 22
      ShortCut = 49228
      OnExecute = acDelExecute
    end
    object acEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 3
      ShortCut = 114
      OnExecute = acEditExecute
    end
    object acAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 21
      ShortCut = 115
      OnExecute = acAddExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 15
      ShortCut = 116
      OnExecute = acRefreshExecute
    end
    object acPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 32
    end
    object acDelSecret: TAction
      Caption = 'acDelSecret'
      ShortCut = 49232
      OnExecute = acDelSecretExecute
    end
    object acSetDatePeriod: TAction
      Caption = #1055#1077#1088#1080#1086#1076
      Hint = 
        #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077' '#1074#1080#1076#1080#1084#1086#1089#1090#1080' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1085#1099#1093' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074' '#1087#1086' '#1087#1077#1088#1080#1086#1076#1091' '#1074#1088#1077#1084 +
        #1077#1085#1080
      OnExecute = acSetDatePeriodExecute
    end
    object acGodMode: TAction
      Caption = 'acGodMode'
      ShortCut = 49223
      OnExecute = acGodModeExecute
    end
    object acSign: TAction
      Caption = '  '#1059#1090#1074#1077#1088#1076#1080#1090#1100'  '
      ImageIndex = 47
      OnExecute = acSignExecute
    end
    object acUnSign: TAction
      Caption = #1054#1090#1084'. '#1091#1090#1074#1077#1088#1078'.'
      ImageIndex = 47
      OnExecute = acUnSignExecute
    end
    object acAddByTreb: TAction
      Caption = #1087#1086' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1102
      ImageIndex = 6
      Visible = False
      OnExecute = acAddByTrebExecute
    end
  end
  object oq: TOracleQuery
    SQL.Strings = (
      'begin'
      '  dosetsumdoc(:adpid,:adata1,:adata2);'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A41445049440300000000000000000000000700
      00003A4144415441310C0000000000000000000000070000003A414441544132
      0C0000000000000000000000}
    Left = 672
    Top = 130
  end
  object frKart: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frKartGetValue
    OnUserFunction = frKartUserFunction
    Left = 488
    Top = 82
    ReportForm = {
      190000000E200000190000FFFF01000100FFFFFFFFFF090000009A0B00003408
      00002400000024000000240000002400000001FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      0000240000002F0400003D0000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200360100000B005061676546
      6F6F7465723100020100000000C00200002F0400001400000030000300010000
      00000000000000FFFFFF1F00000000000000000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      A20100000B004D6173746572446174613100020100000000780000002F040000
      420000003100050001000000000000000000FFFFFF1F00000000010031000000
      00000000FFFF000000000002000000010000000000000001000000C800000014
      0000000100000000000002000F0200000D0044657461696C4865616465723100
      020100000000040100002F040000290000003000070001000000000000000000
      FFFFFF1F00000000000000000000000000010000000000000200000001000000
      0000000001000000C8000000140000000100000000000002008C0200000B0044
      657461696C4461746131000201000000004C0100002F04000011000000300008
      0001000000000000000000FFFFFF1F000000001200667244426F6473496E6772
      696469656E747300000000000000010000000000000200000001000000000000
      0001000000C800000014000000010000000000000200F90200000D0044657461
      696C466F6F7465723100020100000000880100002F0400008800000030000900
      01000000000000000000FFFFFF1F00000000000000000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      000000BB03000005004D656D6F310002002400000030000000E7030000140000
      000300000001000000000000000000FFFFFF1F2C02000000000001002100C6F3
      F0EDE0EB20EFF0EEE8E7E2E5E4E5EDEDFBF520ECE5E4E8EAE0ECE5EDF2EEE200
      03000500626567696E0D090073756D6D613A3D303B0D0300656E6400FFFF0000
      0000000200000001000000040F0054696D6573204E657720526F6D616E001000
      00000000000000000A000000CC00020000000000FFFFFF000000000200000000
      00000000005704000005004D656D6F34000200240000007C000000E703000018
      0000000000000001000000000000000000FFFFFF1F2C02000000000001001400
      D0E0F1F4E0F1EEE2E0EDEE20E820F1E4E0EDEE3A00000000FFFF000000000002
      00000001000000040F0054696D6573204E657720526F6D616E000E0000000200
      0000000008000000CC00020000000000FFFFFF00000000020000000000000000
      00F004000005004D656D6F360002004000000097000000700000001100000000
      000F0001000000000000000000FFFFFF1F2C02000000000001001100C4E0F2E0
      20EFF0EEE8E7E2EEE4F1F2E2E000000000FFFF00000000000200000001000000
      000F0054696D6573204E657720526F6D616E000A000000020000000000080000
      00CC00020000000000FFFFFF0000000002000000000000000000840500000500
      4D656D6F37000200B000000097000000BC0000001100000000000F0001000000
      000000000000FFFFFF1F2C02000000000001000C00CDE0E8ECE5EDEEE2E0EDE8
      E500000000FFFF00000000000200000001000000000F0054696D6573204E6577
      20526F6D616E000A00000002000000000008000000CC00020000000000FFFFFF
      00000000020000000000000000001106000005004D656D6F380002006C010000
      97000000650000001100000000000F0001000000000000000000FFFFFF1F2C02
      000000000001000500D1E5F0E8FF00000000FFFF000000000002000000010000
      00000F0054696D6573204E657720526F6D616E000A0000000200000000000A00
      0000CC00020000000000FFFFFF0000000002000000000000000000A306000005
      004D656D6F39000200D101000097000000460000001100000000000F00010000
      00000000000000FFFFFF1F2C02000000000001000A00D3EF2EE5E42EE8E7EC2E
      00000000FFFF00000000000200000001000000000F0054696D6573204E657720
      526F6D616E000A0000000200000000000A000000CC00020000000000FFFFFF00
      000000020000000000000000003207000006004D656D6F313000020017020000
      97000000740000001100000000000F0001000000000000000000FFFFFF1F2C02
      000000000001000600CAEEEB2DE2EE00000000FFFF0000000000020000000100
      0000000F0054696D6573204E657720526F6D616E000A0000000200000000000A
      000000CC00020000000000FFFFFF0000000002000000000000000000BF070000
      06004D656D6F31310002008B02000097000000480000001100000000000F0001
      000000000000000000FFFFFF1F2C02000000000001000400D6E5EDE000000000
      FFFF00000000000200000001000000000F0054696D6573204E657720526F6D61
      6E000A0000000200000000000A000000CC00020000000000FFFFFF0000000002
      0000000000000000004D08000006004D656D6F3132000200D302000097000000
      660000001100000000000F0001000000000000000000FFFFFF1F2C0200000000
      0001000500D1F3ECECE000000000FFFF00000000000200000001000000000F00
      54696D6573204E657720526F6D616E000A0000000200000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000D708000006004D656D
      6F313300020024000000970000001C0000001100000000000F00010000000000
      00000000FFFFFF1F2C02000000000001000100B900000000FFFF000000000002
      00000001000000000F0054696D6573204E657720526F6D616E000A0000000200
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      008309000006004D656D6F313400020040000000A80000007000000011000000
      03000F0001000000000000000000FFFFFF1F2C0004020A0044442E4D4D2E5959
      595900010019005B6F64734B415254434F4D504F532E2246445F44415441225D
      00000000FFFF00000000000200000001000000000F0054696D6573204E657720
      526F6D616E000A00000000000000000008000000CC00020000000000FFFFFF00
      00000002000000000000000000250A000006004D656D6F3135000200B0000000
      A8000000BC0000001100000003000F0001000000000000000000FFFFFF1F2C02
      0000000000010019005B6F64734B415254434F4D504F532E2246435F4E414D45
      225D00000000FFFF00000000000200000001000000000F0054696D6573204E65
      7720526F6D616E000A00000000000000000008000000CC00020000000000FFFF
      FF0000000002000000000000000000C90A000006004D656D6F31360002006C01
      0000A8000000650000001100000003000F0001000000000000000000FFFFFF1F
      2C02000000000001001B005B6F64734B415254434F4D504F532E2246435F5345
      5249414C225D00000000FFFF00000000000200000001000000000F0054696D65
      73204E657720526F6D616E000A0000000000000000000A000000CC0002000000
      0000FFFFFF00000000020000000000000000006D0B000006004D656D6F313700
      0200D1010000A8000000460000001100000003000F0001000000000000000000
      FFFFFF1F2C00000000000001001B005B6F64734B415254434F4D504F532E2246
      435F554544495A4D225D00000000FFFF00000000000200000001000000000F00
      54696D6573204E657720526F6D616E000A0000000000000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000110C000006004D656D
      6F313800020017020000A8000000740000001100000003000F00010000000000
      00000000FFFFFF1F2C00000000000001001B005B6F64734B415254434F4D504F
      532E22464E5F414D4F554E54225D00000000FFFF000000000002000000010000
      00000F0054696D6573204E657720526F6D616E000A0000000000000000000A00
      0000CC00020000000000FFFFFF0000000002000000000000000000E30C000006
      004D656D6F31390002008B020000A8000000480000001100000003000F000100
      0000000000000000FFFFFF1F2C000000000000010049005B4D59535452544F46
      4C4F4154285B464F524D4154464C4F41542827232323302E3030272C5B6F6473
      4B415254434F4D504F532E22464E5F50524943455F464F525F31225D295D295D
      00000000FFFF00000000000200000001000000000F0054696D6573204E657720
      526F6D616E000A0000000000000000000A000000CC00020000000000FFFFFF00
      00000002000000000000000000B70D000006004D656D6F3230000200D3020000
      A8000000660000001100000003000F0001000000000000000000FFFFFF1F2C00
      000000000001004B005B4D59535452544F464C4F4154285B464F524D4154464C
      4F41542827232323302E3030272C5B6F64734B415254434F4D504F532E22464E
      5F53554D4D415F5452554E434544225D295D295D00000000FFFF000000000002
      00000001000000000F0054696D6573204E657720526F6D616E000A0000000000
      0000000009000000CC00020000000000FFFFFF00000000020000000000000000
      00470E000006004D656D6F323100020024000000A80000001C00000011000000
      03000F0001000000000000000000FFFFFF1F2C020000000000010007005B4C49
      4E45235D00000000FFFF00000000000200000001000000000F0054696D657320
      4E657720526F6D616E000A0000000000000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000D20E000006004D656D6F3235000200
      A5030000C102000060000000120000000300000001000000000000000000FFFF
      FF1F2C02000000000001000C00D1F2F02E205B50414745235D00000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000009
      000000CC00020000000000FFFFFF0000000002000000000000000000620F0000
      06004D656D6F33300002003903000097000000680000001100000000000F0001
      000000000000000000FFFFFF1F2C02000000000001000700CDE0F6E5EDEAE000
      000000FFFF00000000000200000001000000000F0054696D6573204E65772052
      6F6D616E000A0000000200000000000A000000CC00020000000000FFFFFF0000
      0000020000000000000000003110000006004D656D6F333100020039030000A8
      000000680000001100000003000F0001000000000000000000FFFFFF1F2C0000
      00000000010046005B4D59535452544F464C4F4154285B464F524D4154464C4F
      41542827232323302E3030272C5B6F64734B415254434F4D504F532E22464E5F
      4E414348454E4B41225D295D295D00000000FFFF000000000002000000010000
      00000F0054696D6573204E657720526F6D616E000A0000000000000000000900
      0000CC00020000000000FFFFFF0000000002000000000000000000C010000006
      004D656D6F3332000200A1030000970000006A0000001100000000000F000100
      0000000000000000FFFFFF1F2C02000000000001000600D3F6E5EDEAE0000000
      00FFFF00000000000200000001000000000F0054696D6573204E657720526F6D
      616E000A0000000200000000000A000000CC00020000000000FFFFFF00000000
      020000000000000000008E11000006004D656D6F3333000200A1030000A80000
      006A0000001100000003000F0001000000000000000000FFFFFF1F2C00000000
      0000010045005B4D59535452544F464C4F4154285B464F524D4154464C4F4154
      2827232323302E3030272C5B6F64734B415254434F4D504F532E22464E5F5543
      48454E4B41225D295D295D00000000FFFF00000000000200000001000000000F
      0054696D6573204E657720526F6D616E000A00000000000000000009000000CC
      00020000000000FFFFFF00000000020000000000000000002612000005004D65
      6D6F320002002400000004010000E70300001400000003000000010000000000
      00000000FFFFFF1F2C02000000000001001000C2FBE4E0EDEE20E220F0E0E1EE
      F2F33A00000000FFFF00000000000200000001000000040F0054696D6573204E
      657720526F6D616E000C00000002000000000000000000CC00020000000000FF
      FFFF0000000002000000000000000000BA12000005004D656D6F350002004000
      00001C0100007C0100001100000003000F0001000000000000000000FFFFFF1F
      2C02000000000001000C00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF000000
      00000200000001000000000F0054696D6573204E657720526F6D616E000A0000
      0002000000000008000000CC00020000000000FFFFFF00000000020000000000
      000000004813000006004D656D6F3239000200BC0100001C0100008500000011
      00000003000F0001000000000000000000FFFFFF1F2C02000000000001000500
      D1E5F0E8FF00000000FFFF00000000000200000001000000000F0054696D6573
      204E657720526F6D616E000A0000000200000000000A000000CC000200000000
      00FFFFFF0000000002000000000000000000DB13000006004D656D6F33340002
      00410200001C010000620000001100000003000F0001000000000000000000FF
      FFFF1F2C02000000000001000A00D3EF2EE5E42EE8E7EC2E00000000FFFF0000
      0000000200000001000000000F0054696D6573204E657720526F6D616E000A00
      00000200000000000A000000CC00020000000000FFFFFF000000000200000000
      00000000006A14000006004D656D6F3335000200A30200001C01000074000000
      1100000003000F0001000000000000000000FFFFFF1F2C020000000000010006
      00CAEEEB2DE2EE00000000FFFF00000000000200000001000000000F0054696D
      6573204E657720526F6D616E000A0000000200000000000A000000CC00020000
      000000FFFFFF0000000002000000000000000000F714000006004D656D6F3336
      000200170300001C0100006C0000001100000003000F00010000000000000000
      00FFFFFF1F2C02000000000001000400D6E5EDE000000000FFFF000000000002
      00000001000000000F0054696D6573204E657720526F6D616E000A0000000200
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      008515000006004D656D6F3337000200830300001C0100008600000011000000
      03000F0001000000000000000000FFFFFF1F2C02000000000001000500D1F3EC
      ECE000000000FFFF00000000000200000001000000000F0054696D6573204E65
      7720526F6D616E000A0000000200000000000A000000CC00020000000000FFFF
      FF00000000020000000000000000000F16000006004D656D6F33380002002400
      00001C0100001C0000001100000003000F0001000000000000000000FFFFFF1F
      2C02000000000001000100B900000000FFFF0000000000020000000100000000
      0F0054696D6573204E657720526F6D616E000A0000000200000000000A000000
      CC00020000000000FFFFFF0000000002000000000000000000B516000006004D
      656D6F3430000200400000004C0100007C0100001100000003000F0001000000
      000000000000FFFFFF1F2C02000000000001001D005B6F6473496E6772696469
      656E74732E22544B4152545F4E414D45225D00000000FFFF0000000000020000
      0001000000000F0054696D6573204E657720526F6D616E000A00000000000000
      000008000000CC00020000000000FFFFFF00000000020000000000000000005A
      17000006004D656D6F3432000200BC0100004C01000085000000110000000300
      0F0001000000000000000000FFFFFF1F2C02000000000001001C005B6F647349
      6E6772696469656E74732E2246435F53455249414C225D00000000FFFF000000
      00000200000001000000000F0054696D6573204E657720526F6D616E000A0000
      000000000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000FF17000006004D656D6F3433000200410200004C0100006200000011
      00000003000F0001000000000000000000FFFFFF1F2C00000000000001001C00
      5B6F6473496E6772696469656E74732E2246435F554544495A4D225D00000000
      FFFF00000000000200000001000000000F0054696D6573204E657720526F6D61
      6E000A0000000000000000000A000000CC00020000000000FFFFFF0000000002
      000000000000000000CC18000006004D656D6F3435000200170300004C010000
      6C0000001100000003000F0001000000000000000000FFFFFF1F2C0200000000
      00010044005B4D59535452544F464C4F4154285B464F524D4154464C4F415428
      27232323302E3030272C5B6F6473496E6772696469656E74732E22464E5F5052
      494345225D295D295D00000000FFFF00000000000200000001000000000F0054
      696D6573204E657720526F6D616E000A00000000000000000009000000CC0002
      0000000000FFFFFF00000000020000000000000000005C19000006004D656D6F
      3436000200240000004C0100001C0000001100000003000F0001000000000000
      000000FFFFFF1F2C020000000000010007005B4C494E45235D00000000FFFF00
      000000000200000001000000000F0054696D6573204E657720526F6D616E000A
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      000000000000621A000006004D656D6F3438000200830300004C010000860000
      001100000003000F0001000000000000000000FFFFFF1F2C0200000000000100
      44005B4D59535452544F464C4F4154285B464F524D4154464C4F415428272323
      23302E3030272C5B6F6473496E6772696469656E74732E22464E5F53554D4D41
      225D295D295D0003000500626567696E0D290073756D6D613A3D73756D6D612B
      5B6F6473496E6772696469656E74732E22464E5F53554D4D41225D3B0D030065
      6E6400FFFF00000000000200000001000000000F0054696D6573204E65772052
      6F6D616E000A00000000000000000009000000CC00020000000000FFFFFF0000
      000002000000000000000000461B000006004D656D6F353600020024000000B8
      0100000C030000140000000300000001000000000000000000FFFFFF1F2C0200
      0000000001006500C2FBE4E0EDEE20EFF0EEE4F3EAF6E8E83A205B4D59535452
      544F464C4F4154285B464F524D4154464C4F41542827232323302E3030272C5B
      6F64734B415254434F4D504F532E22464E5F53554D4D415F464F525F494E4752
      494449454E5453225D295D295D00000000FFFF00000000000200000001000000
      000500417269616C000A00000000000000000000000000CC00020000000000FF
      FFFF00000000020000000000000000001C1C000006004D656D6F353700020024
      000000CC010000BC020000140000000300000001000000000000000000FFFFFF
      1F2C02000000000001005700CFEEEBF3F7E5EDEE20EFF0EEE4F3EAF6E8E83A20
      5B4D59535452544F464C4F4154285B464F524D4154464C4F4154282723232330
      2E3030272C5B6F64734B415254434F4D504F532E22464E5F53554D4D41225D29
      5D295D00000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000000000000CC00020000000000FFFFFF0000000002000000
      000000000000EA1C000006004D656D6F353800020024000000E0010000BC0200
      00140000000300000001000000000000000000FFFFFF1F2C0200000000000100
      4F00CDE0F6E5EDEAE03A205B4D59535452544F464C4F4154285B464F524D4154
      464C4F41542827232323302E3030272C5B6F64734B415254434F4D504F532E22
      464E5F4E414348454E4B41225D295D295D00000000FFFF000000000002000000
      01000000000500417269616C000A00000000000000000000000000CC00020000
      000000FFFFFF0000000002000000000000000000B61D000006004D656D6F3539
      00020024000000F4010000BC0200001400000003000000010000000000000000
      00FFFFFF1F2C02000000000001004D00D3F6E5EDEAE03A205B4D59535452544F
      464C4F4154285B464F524D4154464C4F41542827232323302E3030272C5B6F64
      734B415254434F4D504F532E22464E5F554348454E4B41225D295D295D000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      00000000000000CC00020000000000FFFFFF0000000002000000000000000000
      9E1E000006004D656D6F32330002008303000088010000860000001400000003
      000F0001000000000000000000FFFFFF1F2C02000000000001002E005B4D5953
      5452544F464C4F4154285B464F524D4154464C4F41542827232323302E303027
      2C73756D6D61295D295D0003000500626567696E0D21002F2F5B464F524D4154
      464C4F4154282730F02E2C3030EA2E272C73756D6D61295D0D0300656E6400FF
      FF00000000000200000001000000000F0054696D6573204E657720526F6D616E
      000A00000002000000000009000000CC00020000000000FFFFFF000000000200
      0000000000000000371F000006004D656D6F323400020024000000880100005F
      0300001400000003000F0001000000000000000000FFFFFF1F2C020000000000
      01001000C8F2EEE3EE2028D1F3ECECE0293A202000000000FFFF000000000002
      00000001000000000F0054696D6573204E657720526F6D616E000A0000000200
      0000000009000000CC00020000000000FFFFFF00000000020000000000000000
      00DC1F000006004D656D6F3232000200A30200004C0100007400000011000000
      03000F0001000000000000000000FFFFFF1F2C02000000000001001C005B6F64
      73496E6772696469656E74732E22464E5F414D4F554E54225D00000000FFFF00
      000000000200000001000000000F0054696D6573204E657720526F6D616E000A
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      00000000FEFEFF000000000000000000000000FC000000000000000000000000
      0000000058005ADC09E273E7E240D574B393D45FE440}
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmMedProduceList\'
    StoredProps.Strings = (
      'cxGridIngrDBTableView1FC_SERIAL.Visible'
      'cxGridIngrDBTableView1FC_SERIAL.Width'
      'cxGridIngrDBTableView1FC_UEDIZM.Visible'
      'cxGridIngrDBTableView1FC_UEDIZM.Width'
      'cxGridIngrDBTableView1FK_ID.Visible'
      'cxGridIngrDBTableView1FK_ID.Width'
      'cxGridIngrDBTableView1FK_KART_ITEM.Visible'
      'cxGridIngrDBTableView1FK_KART_ITEM.Width'
      'cxGridIngrDBTableView1FK_TKARTCOMPOSID.Visible'
      'cxGridIngrDBTableView1FK_TKARTCOMPOSID.Width'
      'cxGridIngrDBTableView1FN_AMOUNT1.Visible'
      'cxGridIngrDBTableView1FN_AMOUNT1.Width'
      'cxGridIngrDBTableView1FN_PRICE.Visible'
      'cxGridIngrDBTableView1FN_PRICE.Width'
      'cxGridIngrDBTableView1FN_SUMMA.Visible'
      'cxGridIngrDBTableView1FN_SUMMA.Width'
      'cxGridIngrDBTableView1ROWNUM.Visible'
      'cxGridIngrDBTableView1ROWNUM.Width'
      'cxGridIngrDBTableView1TKART_NAME.Visible'
      'cxGridIngrDBTableView1TKART_NAME.Width'
      'cxGridProduceMedicsDBTableView1FC_NAME.Visible'
      'cxGridProduceMedicsDBTableView1FC_NAME.Width'
      'cxGridProduceMedicsDBTableView1FC_SERIAL.Visible'
      'cxGridProduceMedicsDBTableView1FC_SERIAL.Width'
      'cxGridProduceMedicsDBTableView1FC_UEDIZM.Visible'
      'cxGridProduceMedicsDBTableView1FC_UEDIZM.Width'
      'cxGridProduceMedicsDBTableView1FD_DATA.Visible'
      'cxGridProduceMedicsDBTableView1FD_DATA.Width'
      'cxGridProduceMedicsDBTableView1FN_NUMBER.Visible'
      'cxGridProduceMedicsDBTableView1FN_NUMBER.Width'
      'cxGridProduceMedicsDBTableView1FK_MEDICID.Visible'
      'cxGridProduceMedicsDBTableView1FK_MEDICID.Width'
      'cxGridProduceMedicsDBTableView1FN_AMOUNT.Visible'
      'cxGridProduceMedicsDBTableView1FN_AMOUNT.Width'
      'cxGridProduceMedicsDBTableView1FN_AMOUNT_POLUCHENO.Visible'
      'cxGridProduceMedicsDBTableView1FN_AMOUNT_POLUCHENO.Width'
      'cxGridProduceMedicsDBTableView1FN_NACHENKA.Visible'
      'cxGridProduceMedicsDBTableView1FN_NACHENKA.Width'
      'cxGridProduceMedicsDBTableView1FN_PRICE_FOR_1.Visible'
      'cxGridProduceMedicsDBTableView1FN_PRICE_FOR_1.Width'
      'cxGridProduceMedicsDBTableView1FN_SUMMA_FOR_INGRIDIENTS.Visible'
      'cxGridProduceMedicsDBTableView1FN_SUMMA_FOR_INGRIDIENTS.Width'
      'cxGridProduceMedicsDBTableView1FN_SUMMA_TRUNCED.Visible'
      'cxGridProduceMedicsDBTableView1FN_SUMMA_TRUNCED.Width'
      'cxGridProduceMedicsDBTableView1FN_UCHENKA.Visible'
      'cxGridProduceMedicsDBTableView1FN_UCHENKA.Width'
      'cxGridProduceMedicsDBTableView1PODPISAN.Visible'
      'cxGridProduceMedicsDBTableView1PODPISAN.Width'
      'cxGridProduceMedicsDBTableView1ROWNUM.Visible'
      'cxGridProduceMedicsDBTableView1ROWNUM.Width'
      'cxGridProduceMedicsDBTableView1FK_FINSOURCE_ID.Visible'
      'cxGridProduceMedicsDBTableView1FK_FINSOURCE_ID.Width'
      'cxGridIngrDBTableView1FK_FINSOURCE_ID.Visible'
      'cxGridIngrDBTableView1FK_FINSOURCE_ID.Width')
    StoredValues = <>
    Left = 600
    Top = 182
  end
  object odsKARTCOMPOS: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '--  sum(FN_SUMMA_TRUNCED) as FN_SUMMA_TRUNCED,'
      '--  sum(FN_SUMMA_FOR_INGRIDIENTS) As FN_SUMMA_FOR_INGRIDIENTS,'
      '--  sum(FN_NACHENKA) as FN_NACHENKA,'
      '--  sum(FN_UCHENKA) as FN_UCHENKA,'
      
        '--  sum(FN_SUMMA_TRUNCED) -  sum(FN_UCHENKA) + sum(FN_NACHENKA) ' +
        ' as s'
      '  '
      '  '
      'ROWNUM, RID as "ROWID", A.*'
      'FROM ('
      '    SELECT '
      '    RID,'
      '               FK_ID,'
      '               r.FD_DATA,'
      '               FK_MEDICID,'
      '               FC_NAME,'
      '               FC_SERIAL,'
      '               FC_UEDIZM,'
      '               FN_NUMBER,'
      '               FN_AMOUNT,'
      '               FN_FPACKINUPACK,'
      '               FN_PRICE_FOR_1,'
      '               FN_SUMMA_TRUNCED,'
      '               FN_SUMMA,'
      '               FN_SUMMA_FOR_INGRIDIENTS,'
      '               CASE'
      '                 WHEN FN_SUMMA_TRUNCED <= FN_SUMMA THEN'
      '                  FN_SUMMA - FN_SUMMA_TRUNCED'
      '                 ELSE'
      '                  0'
      '               end FN_UCHENKA,'
      '               CASE'
      '                 WHEN FN_SUMMA_TRUNCED > FN_SUMMA THEN'
      '                  FN_SUMMA_TRUNCED - FN_SUMMA'
      '                 ELSE'
      '                  0'
      '               end FN_NACHENKA,'
      '               FN_AMOUNT AS FN_AMOUNT_POLUCHENO,'
      '               r.FL_EDIT,'
      '               DECODE(r.FL_EDIT, 0, '#39#1044#1072#39', 1, '#39#1053#1077#1090#39') AS PODPISAN,'
      '               fk_doc_prih, --!!!!!!!!!!!!!!!!'
      '               fk_doc_rash, --!!!!!!!!!!!!!!!!'
      '               FD_GODEN_DO,'
      '               FL_USE_TARA,'
      '               FK_PRODUCE_TYPE,'
      '               r.FK_FINSOURCE_ID,'
      
        '   decode(dp.fc_doc,null,'#39#39',dp.fc_doc||'#39' '#1086#1090' '#39'||to_char(dp.fd_dat' +
        'a,'#39'dd.mm.yyyy'#39') )  as dpid_prich_str, '
      
        '   decode(dr.fc_doc,null,'#39#39',dr.fc_doc||'#39' '#1086#1090' '#39'||to_char(dr.fd_dat' +
        'a,'#39'dd.mm.yyyy'#39') )  as dpid_rasch_str'
      'FROM'
      '('
      'SELECT'
      '    ROWNUM,'
      '    MASTER2.RID,'
      '    MASTER2.FK_ID,'
      '    MASTER2.FD_DATA,'
      '    MASTER2.FK_MEDICID,'
      '    MASTER2.FC_NAME,'
      '    MASTER2.FC_SERIAL,'
      '    MASTER2.FC_UEDIZM,'
      '    MASTER2.FN_NUMBER, '
      '    MASTER2.FN_AMOUNT,'
      '    MASTER2.FN_FPACKINUPACK,'
      '    MASTER2.FK_FINSOURCE_ID,'
      ''
      '    DETAIL2.FN_SUMMA_FOR_INGRIDIENTS,'
      
        '    Round(DETAIL2.FN_SUMMA_FOR_INGRIDIENTS/MASTER2.FN_AMOUNT,2) ' +
        'AS FN_PRICE_FOR_1,'
      
        '    Round(DETAIL2.FN_SUMMA_FOR_INGRIDIENTS/MASTER2.FN_AMOUNT,2)*' +
        'MASTER2.FN_AMOUNT AS FN_SUMMA_TRUNCED, -- '#1054#1050#1056#1059#1043#1051#1045#1053#1053#1040#1071
      '    FN_SUMMA_FOR_INGRIDIENTS AS FN_SUMMA,'
      '    MASTER2.FL_EDIT,'
      '    MASTER2.fk_doc_prih,'
      '   MASTER2.fk_doc_rash,'
      '   MASTER2.FD_GODEN_DO,'
      '   MASTER2.FL_USE_TARA,'
      '   MASTER2.FK_PRODUCE_TYPE'
      '  FROM'
      '   ('
      'SELECT'
      '--    ROWNUM,'
      '    KS.ROWID as RID,'
      '    KS.FK_ID,'
      '    KS.FD_DATA,'
      '    KS.FK_MEDICID,'
      '    M.FC_NAME,'
      '    KS.FC_SERIAL,'
      '    TEI.FC_NAME AS FC_UEDIZM, '
      '    KS.FN_NUMBER,'
      '    KS.FN_AMOUNT,'
      '    M.FN_FPACKINUPACK,'
      '    KS.FL_EDIT,'
      '    KS.fk_doc_prih,'
      '    KS.fk_doc_rash,'
      '    KS.FD_GODEN_DO,'
      '    KS.FL_USE_TARA,'
      '    KS.FK_PRODUCE_TYPE,'
      '    KS.FK_FINSOURCE_ID'
      '        '
      '  FROM MED.TKARTCOMPOS KS, MED.TMEDIC M, MED.TEI'
      '  WHERE KS.FK_MEDICID=M.MEDICID (+)'
      '    AND TRUNC(KS.FD_DATA) BETWEEN (:DATE1)AND (:DATE2)'
      '    :FK_PRODUCE_TYPE'
      '    AND M.EIID = TEI.EIID (+)'
      '--  ORDER BY ROWNUM'
      '   )MASTER2,'
      '   ('
      'SELECT  '
      '    FK_TKARTCOMPOSID,'
      '    SUM(FN_SUMMA) AS FN_SUMMA_FOR_INGRIDIENTS'
      '  FROM  '
      '(SELECT'
      '        K_ITEM.FK_TKARTCOMPOSID,'
      '        K_ITEM.FK_KART_ITEM,'
      '        K_ITEM.FN_AMOUNT,'
      '        k.FN_PRICE,'
      
        '        k.FN_PRICE * k_item.FN_AMOUNT AS FN_SUMMA               ' +
        ' '
      '      FROM'
      '        MED.TKARTCO_ITEM K_ITEM,'
      '        MED.TKARTCOMPOS KS, med.tkart k'
      '      WHERE KS.FK_ID=K_ITEM.FK_TKARTCOMPOSID'
      '       and k_item.fk_kart_item = k.kartid'
      '       AND TRUNC(KS.FD_DATA) BETWEEN (:DATE1)AND (:DATE2)'
      '       :FK_PRODUCE_TYPE'
      ')  '
      'GROUP BY FK_TKARTCOMPOSID  '
      '   ) DETAIL2'
      '  WHERE MASTER2.FK_ID = DETAIL2.FK_TKARTCOMPOSID(+)'
      ')   r, MED.TDOCS dp, MED.TDOCS dr'
      'WHERE dp.dpid(+)=FK_DOC_PRIH and dr.dpid(+)=FK_DOC_RASH '
      '  and TRUNC(r.FD_DATA) BETWEEN (:DATE1)AND (:DATE2)'
      'ORDER BY FD_DATA ASC'
      ') A'
      '')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445310C00000000000000000000000600
      00003A44415445320C0000000000000000000000100000003A464B5F50524F44
      5543455F54595045010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000150000000700000046445F444154410100000000000900000046435F
      554544495A4D01000000000005000000464B5F49440100000000000A00000046
      4B5F4D4544494349440100000000000700000046435F4E414D45010000000000
      09000000464E5F414D4F554E5401000000000006000000524F574E554D010000
      0000000E000000464E5F50524943455F464F525F310100000000000800000046
      4E5F53554D4D410100000000000B000000464E5F4E414348454E4B4101000000
      00000A000000464E5F554348454E4B4101000000000013000000464E5F414D4F
      554E545F504F4C554348454E4F01000000000018000000464E5F53554D4D415F
      464F525F494E4752494449454E54530100000000000900000046435F53455249
      414C01000000000008000000504F44504953414E01000000000009000000464E
      5F4E554D4245520100000000000F000000464E5F465041434B494E555041434B
      01000000000007000000464C5F4544495401000000000010000000464E5F5355
      4D4D415F5452554E4345440100000000000B000000464B5F444F435F50524948
      0100000000000B000000464B5F444F435F52415348010000000000}
    Cursor = crSQLWait
    UniqueFields = 'FK_ID'
    RefreshOptions = [roAfterUpdate]
    OnApplyRecord = odsKARTCOMPOSApplyRecord
    UpdatingTable = 'MED.TKARTCOMPOS'
    Session = dmMain.os
    AfterOpen = odsKARTCOMPOSAfterOpen
    AfterRefresh = odsKARTCOMPOSAfterOpen
    Left = 88
    Top = 128
  end
  object dsKARTCOMPOS: TDataSource
    DataSet = odsKARTCOMPOS
    Left = 88
    Top = 80
  end
  object odsIngridients: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '        ROWNUM,'
      '        K_ITEM.ROWID,    '
      '        K_ITEM.FK_ID,'
      '        K_ITEM.FK_TKARTCOMPOSID,'
      '        K_ITEM.FK_KART_ITEM,'
      '--        K.FC_NAME AS TKART_NAME,'
      '        M.FC_NAME AS TKART_NAME,'
      '        M.MEDICID,'
      '        K.FC_SERIAL,'
      '        K.fn_price,'
      '        K.fn_party_num,'
      '        TEI.FC_NAME AS FC_UEDIZM,'
      '        K_ITEM.FN_AMOUNT_FOR1,'
      '        K_ITEM.FN_AMOUNT,'
      '        K.FN_PRICE * K_ITEM.FN_AMOUNT  AS FN_SUMMA,'
      '        K.FK_FINSOURCE_ID'
      ''
      ''
      '      FROM'
      '        MED.TKARTCO_ITEM K_ITEM,'
      '        MED.TMEDIC M,'
      '        MED.TEI,'
      '        MED.TKART K'
      ''
      '      WHERE K_ITEM.FK_TKARTCOMPOSID = :FK_TKARTCOMPOSID'
      '        AND K_ITEM.FK_KART_ITEM = K.KARTID'
      '        AND K.MEDICID = M.MEDICID'
      '        AND M.EIID = TEI.EIID (+)'
      '--        AND M.FL_VISIBLE = 1'
      'ORDER BY K_ITEM.FK_ID -- '#1087#1086#1088#1103#1076#1086#1082' '#1090#1072#1082#1086#1081' '#1078#1077', '#1082#1072#1082' '#1087#1088#1080' '#1089#1086#1079#1076#1072#1085#1080#1080
      ''
      ''
      '/*'
      'SELECT'
      '    K_ITEM.ROWID,    '
      '    K_ITEM.FK_ID,'
      '    K_ITEM.FK_TKARTCOMPOSID,'
      '    K_ITEM.FK_KART_ITEM,'
      '--    K.FC_NAME AS TKART_NAME,'
      
        '    M.FC_NAME||'#39' ('#1087'. '#8470#39'||TO_CHAR(K.FN_PARTY_NUM)||'#39')'#39' AS TKART_N' +
        'AME,'
      '    M.MEDICID,'
      '    TEI.FC_NAME AS FC_UEDIZM,'
      '    K_ITEM.FN_AMOUNT_FOR1,'
      '    K_ITEM.FN_AMOUNT'
      '  FROM'
      '    MED.TKARTCO_ITEM K_ITEM,'
      '    MED.TKART K,'
      '    MED.TMEDIC M,'
      '    MED.TEI'
      '  WHERE K_ITEM.FK_TKARTCOMPOSID = :FK_TKARTCOMPOSID'
      '    AND K_ITEM.FK_KART_ITEM = K.KARTID'
      '    AND K.MEDICID = M.MEDICID'
      '    AND M.EIID = TEI.EIID (+)'
      '    AND M.FL_VISIBLE = 1'
      'ORDER BY LOWER(M.FC_NAME), LOWER(TEI.FC_NAME)*/')
    Optimize = False
    Variables.Data = {
      0300000001000000110000003A464B5F544B415254434F4D504F534944030000
      00040000004A00000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C00000005000000464B5F494401000000000010000000464B5F544B
      415254434F4D504F5349440100000000000C000000464B5F4B4152545F495445
      4D0100000000000A000000544B4152545F4E414D450100000000000900000046
      435F53455249414C01000000000009000000464E5F414D4F554E540100000000
      0006000000524F574E554D01000000000008000000464E5F5052494345010000
      00000008000000464E5F53554D4D410100000000000900000046435F55454449
      5A4D0100000000000C000000464E5F50415254595F4E554D0100000000000E00
      0000464E5F414D4F554E545F464F5231010000000000}
    Cursor = crSQLWait
    UniqueFields = 'FK_ID'
    UpdatingTable = 'MED.TKARTCO_ITEM'
    Session = dmMain.os
    Left = 290
    Top = 356
  end
  object dsIngridients: TDataSource
    DataSet = odsIngridients
    Left = 194
    Top = 356
  end
  object frDBKARTCOMPOS2: TfrDBDataSet
    DataSet = odsKARTCOMPOS
    Left = 192
    Top = 176
  end
  object frDBodsIngridients: TfrDBDataSet
    DataSet = odsIngridients
    Left = 290
    Top = 404
  end
  object odsIngridToPodpis: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '    K_I.FK_KART_ITEM AS KARTID,'
      '    K_I.FN_AMOUNT AS FN_AMOUNT,'
      '    M.FC_NAME AS FC_MEDIC_NAME,'
      '    NVL(ost.FN_KOLOST,0) as FN_KOLOST,'
      '    ost.FN_PRICE'
      '  FROM'
      
        '   MED.TKARTCO_ITEM K_I, MED.TKART K, MED.TMEDIC M, med.VMEDKART' +
        '_KOLOST ost'
      '  WHERE K_I.FK_TKARTCOMPOSID = :FK_TKARTCOMPOSID'
      
        '    AND K_I.FK_KART_ITEM = K.KARTID -- '#1087#1088#1086#1074#1077#1088#1082#1072' '#1087#1072#1088#1090#1080#1080' '#1085#1072' '#1089#1091#1097#1077#1089#1090 +
        #1074#1086#1074#1072#1085#1080#1077'. '#1041#1099#1083#1080' '#1087#1088#1077#1094#1077#1085#1076#1077#1085#1090#1099'. '#1042#1086#1088#1086#1085#1086#1074' '#1054'.'#1040'.'
      '    AND K.MEDICID = M.MEDICID'
      '    and K_I.FK_KART_ITEM = ost.kartid(+)'
      '    and ost.fn_ost_type = 0 -- '#1085#1077' '#1074' '#1088#1077#1079#1077#1088#1074#1077)
    Optimize = False
    Variables.Data = {
      0300000001000000110000003A464B5F544B415254434F4D504F534944030000
      000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000009000000464E5F414D4F554E54010000000000060000004B
      4152544944010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 304
    Top = 128
  end
  object oqSetPrih: TOracleQuery
    SQL.Strings = (
      'UPDATE MED.TKARTCOMPOS'
      'SET '
      '  FK_DOC_PRIH = :adpid'
      'WHERE FK_ID = :AFK_ID')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A41445049440300000000000000000000000700
      00003A41464B5F4944030000000000000000000000}
    Cursor = crSQLWait
    Left = 86
    Top = 182
  end
  object oqSetRash: TOracleQuery
    SQL.Strings = (
      'UPDATE MED.TKARTCOMPOS'
      'SET '
      '  FK_DOC_RASH = :adpid'
      'WHERE FK_ID = :AFK_ID')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A41445049440300000000000000000000000700
      00003A41464B5F4944030000000000000000000000}
    Cursor = crSQLWait
    Left = 84
    Top = 240
  end
  object aclPrint: TActionList
    Left = 394
    Top = 110
    object acPrintOne: TAction
      Caption = #1054#1076#1085#1072' '#1086#1087#1077#1088#1072#1094#1080#1103
      Enabled = False
      Visible = False
      OnExecute = acPrintOneExecute
    end
    object acPrintDiapazon: TAction
      Caption = #1051#1060#1046
      OnExecute = acPrintDiapazonExecute
    end
    object acPrintSprav: TAction
      Caption = #1057#1087#1088#1072#1074#1082#1072
      OnExecute = acPrintSpravExecute
    end
  end
  object pmPrint: TPopupMenu
    Left = 448
    Top = 112
    object N1: TMenuItem
      Action = acPrintOne
    end
    object N2: TMenuItem
      Action = acPrintDiapazon
    end
    object N3: TMenuItem
      Action = acPrintSprav
    end
  end
  object frPrintSprav: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frPrintSpravGetValue
    OnUserFunction = frPrintSpravUserFunction
    Left = 546
    Top = 84
    ReportForm = {
      19000000450C0000190000000001000100FFFFFFFFFF0B00000034080000C805
      00004800000024000000240000002400000001FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F0000FFDC000000780000007C0100002C
      010000040000000200CB0000000B004D61737465724461746131000201000000
      00C0010000F6020000140000003100050001000000000000000000FFFFFF1F00
      00000001003100000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200440100000B004D61737465
      72446174613200020100000000DC000000F6020000C800000030000500010000
      00000000000000FFFFFF1F000000000E00667244425072696E74537072617600
      000000000000FFFF000000000002000000010000000000000001000000C80000
      0014000000010000000000000200B00100000C005265706F72745469746C6531
      0002010000000020000000F60200009800000030000000010000000000000000
      00FFFFFF1F00000000000000000000000000FFFF000000000002000000010000
      000000000001000000C800000014000000010000000000000000340200000500
      4D656D6F31000200480000002400000060000000140000000300000001000000
      000000000000FFFFFF1F2C02000000000001000600C0EFF2E5EAE000000000FF
      FF00000000000200000001000000000500417269616C000A0000000200000000
      00080000000100020000000000FFFFFF0000000002000000000000000000BB02
      000005004D656D6F32000200A8010000240000002A0100001400000003000000
      01000000000000000000FFFFFF1F2C02000000000001000900D3D2C2C5D0C6C4
      C0DE00000000FFFF00000000000200000001000000000500417269616C000A00
      00000200000000000A0000000100020000000000FFFFFF000000000200000000
      00000000005803000005004D656D6F33000200A8010000390000002A01000044
      0000000300000001000000000000000000FFFFFF1F2C02000000000002000C00
      C3EBE0E2EDFBE920E2F0E0F70D10005B7661725F676C61765F76726163685D00
      000000FFFF00000000000200000001000000000500417269616C000A00000002
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      0000DF03000005004D656D6F3400020048000000870000008A02000010000000
      0300000001000000000000000000FFFFFF1F2C02000000000001000900D1CFD0
      C0C2CAC020B900000000FFFF0000000000020000000100000000050041726961
      6C000C000000020000000000020000000100020000000000FFFFFF0000000002
      0000000300000000009204000005004D656D6F3600020048000000E000000084
      020000140000000300000001000000000000000000FFFFFF1F2C020000000000
      01003500CE20E4EEEEF6E5EDEAE520E820F3F6E5EDEAE520EFEE20EBE0E1EEF0
      E0F2EEF0EDEE2DF4E0F1EEE2EEF7EDFBEC20F0E0E1EEF2E0EC00000000FFFF00
      000000000200000001000000000500417269616C000B00000000000000000002
      0000000100020000000000FFFFFF000000000200000000000000000020050000
      05004D656D6F3700020000020000E0000000D200000014000000030000000100
      0000000000000000FFFFFF1F2C02000000000001001000205B46435F4D4F4E54
      48594541525D2000000000000000000000000200000001000000000500417269
      616C000B000000040000000000000000000100020000000000FFFFFF00000000
      02000000000000000000CB05000005004D656D6F380002004800000009010000
      0C010000250000000300000001000000000000000000FFFFFF1F2C0200000000
      0002000800C4EEEEF6E5EDEAE00D2200EFEE20EBE0E1EEF0E0F2EEF0EDEE2DF4
      E0F1EEE2EEF7EDFBEC20F0E0E1EEF2E0EC2000000000FFFF0000000000020000
      0001000000000500417269616C000B0000000000000000000000000001000200
      00000000FFFFFF00000000020000000000000000007506000005004D656D6F39
      000200540100001A0100007E0100001400000003000000010000000000000000
      00FFFFFF1F2C0204010F00232323202323302E303020F0F3E12E0001001D005B
      6F64735072696E7453707261762E22464E5F4E414348454E4B41225D00000000
      FFFF00000000000200000001000000000500417269616C000B00000004000000
      0000000000000100020000000000FFFFFF00000000020000000000000000001D
      07000006004D656D6F313000020048000000300100008A020000110000000300
      000001000000000000000000FFFFFF1F2C020000000000010029005B4D4F4E45
      59535452285B6F64735072696E7453707261762E22464E5F4E414348454E4B41
      225D295D00000000FFFF00000000000200000001000000000500417269616C00
      0B000000000000000000100000000100020000000000FFFFFF00000000020000
      00000000000000A407000006004D656D6F313100020048000000420100008A02
      00000C0000000300080001000000000000000000FFFFFF1F2C02000000000001
      000800EFF0EEEFE8F1FCFE00000000FFFF000000000002000000010000000005
      00417269616C0007000000000000000000020000000100020000000000FFFFFF
      00000000020000000000000000004E08000006004D656D6F3132000200480000
      004F0100000C010000250000000300000001000000000000000000FFFFFF1F2C
      02000000000002000600D3F6E5EDEAE00D2200EFEE20EBE0E1EEF0E0F2EEF0ED
      EE2DF4E0F1EEE2EEF7EDFBEC20F0E0E1EEF2E0EC2000000000FFFF0000000000
      0200000001000000000500417269616C000B0000000000000000000000000001
      00020000000000FFFFFF0000000002000000000000000000F808000006004D65
      6D6F313300020054010000600100007E01000014000000030000000100000000
      0000000000FFFFFF1F2C0204010F00232323202323302E303020F0F3E12E0001
      001C005B6F64735072696E7453707261762E22464E5F554348454E4B41225D00
      000000FFFF00000000000200000001000000000500417269616C000B00000004
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      00009F09000006004D656D6F313400020048000000750100008A020000110000
      000300000001000000000000000000FFFFFF1F2C020000000000010028005B4D
      4F4E4559535452285B6F64735072696E7453707261762E22464E5F554348454E
      4B41225D295D00000000FFFF0000000000020000000100000000050041726961
      6C000B000000000000000000100000000100020000000000FFFFFF0000000002
      000000000000000000260A000006004D656D6F31350002004800000087010000
      8A0200000C0000000300080001000000000000000000FFFFFF1F2C0200000000
      0001000800EFF0EEEFE8F1FCFE00000000FFFF00000000000200000001000000
      000500417269616C0007000000000000000000020000000100020000000000FF
      FFFF0000000002000000000000000000D00A000005004D656D6F350002004800
      00009A0000008A020000140000000300000001000000000000000000FFFFFF1F
      2C02000000000001000E005B5374725370726176446174655D00030005006265
      67696E0D0E0020205369676E73203A3D2027273B0D0300656E6400FFFF000000
      00000200000001000000000500417269616C000C000000060000000000020000
      000100020000000000FFFFFF0000000002000000000000000000560B00000600
      4D656D6F313600020048000000C0010000520100001400000003000000010000
      00000000000000FFFFFF1F2C020000000000010007005B5369676E735D000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      000000010000000100020000000000FFFFFF0000000002000000000000000000
      130C000006004D656D6F313700020048000000F40000008A0200001300000003
      00000001000000000000000000FFFFFF1F2C02000000000001003E00E7E020EF
      E5F0E8EEE420F1205B6F64735072696E7453707261762E224441544531225D20
      EFEE205B6F64735072696E7453707261762E224441544532225D00000000FFFF
      00000000000200000001000000040500417269616C000A000000040000000000
      020000000100020000000000FFFFFF000000000200000000000000FEFEFF0000
      00000000000000000000FC000000000000000000000000000000005800F83F23
      C2EF35E3400C7BB393D45FE440}
  end
  object frDBPrintSprav: TfrDBDataSet
    DataSet = odsPrintSprav
    Left = 546
    Top = 132
  end
  object odsPrintSprav: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      
        '    (TO_CHAR(:DATE1,'#39'DD.MM.YYYY'#39')) as DATE1, (TO_CHAR(:DATE2,'#39'DD' +
        '.MM.YYYY'#39')) as DATE2,'
      '    :MONTHYEAR as FC_MONTHYEAR,'
      '--    FK_ID,'
      '--    FD_DATA, '
      '--    FC_SERIAL,       '
      '    ROUND(SUM(FN_NACHENKA),2) as FN_NACHENKA,'
      '    ROUND(SUM(FN_UCHENKA),2) as FN_UCHENKA'
      'FROM'
      '('
      'SELECT '
      '    FK_ID,'
      '    FD_DATA,'
      '    FK_MEDICID,'
      '    FC_NAME,'
      '    FC_SERIAL,'
      '    FC_UEDIZM, '
      '    FN_NUMBER,'
      '    FN_AMOUNT,'
      '    FN_FPACKINUPACK,'
      '    FN_PRICE_FOR_1,'
      '    FN_SUMMA_TRUNCED,'
      '    FN_SUMMA,'
      '    FN_SUMMA_FOR_INGRIDIENTS,'
      '    CASE WHEN FN_SUMMA_TRUNCED<=FN_SUMMA'
      '     THEN FN_SUMMA-FN_SUMMA_TRUNCED'
      '     ELSE 0 end FN_UCHENKA,'
      '    CASE WHEN FN_SUMMA_TRUNCED>FN_SUMMA'
      '     THEN FN_SUMMA_TRUNCED-FN_SUMMA'
      '     ELSE 0 end FN_NACHENKA,'
      
        '    FN_AMOUNT AS FN_AMOUNT_POLUCHENO, -- '#1055#1054#1051#1059#1063#1045#1053#1054#1045' '#1050#1054#1051'-'#1042#1054', '#1053#1054' '#1058#1040 +
        #1050' '#1050#1040#1050' '#1059' '#1053#1040#1057' '#1053#1045' '#1052#1054#1046#1045#1058' '#1041#1067#1058#1068' '#1076#1077#1083#1092#1080' '#1085#1077' '#1076#1072#1089#1090' '#1089#1086#1079#1076#1072#1090#1100' '#1073#1086#1083#1100#1096#1077' '#1087#1088#1086#1080#1079#1074#1086#1076#1080 +
        #1084#1086#1075#1086' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072', '#1095#1077#1084' '#1077#1089#1090#1100' '#1076#1083#1103' '#1085#1077#1075#1086' '#1080#1085#1075#1088#1080#1076#1080#1077#1085#1090#1086#1074', '#1090#1086' '#1082#1086#1083'-'#1074#1086' '#1080' '#1087#1086 +
        #1083#1091#1095#1077#1085#1086' '#1088#1072#1074#1085#1086'.'
      '    FL_EDIT,'
      '    DECODE(FL_EDIT,0,'#39#1044#1072#39',1,'#39#1053#1077#1090#39') AS PODPISAN,'
      '    fk_doc_prih,'
      '    fk_doc_rash'
      'FROM'
      '('
      'SELECT'
      '    ROWNUM,'
      '    FK_ID,'
      '    FD_DATA,'
      '    FK_MEDICID,'
      '    FC_NAME,'
      '    FC_SERIAL,'
      '    FC_UEDIZM,'
      '    FN_NUMBER, '
      '    FN_AMOUNT,'
      '    FN_FPACKINUPACK,'
      ''
      '    DETAIL2.FN_SUMMA_FOR_INGRIDIENTS,'
      
        '    Round(DETAIL2.FN_SUMMA_FOR_INGRIDIENTS/FN_AMOUNT,2) AS FN_PR' +
        'ICE_FOR_1,'
      
        '    Round(DETAIL2.FN_SUMMA_FOR_INGRIDIENTS/FN_AMOUNT,2)*FN_AMOUN' +
        'T AS FN_SUMMA_TRUNCED, -- '#1054#1050#1056#1059#1043#1051#1045#1053#1053#1040#1071
      '    FN_SUMMA_FOR_INGRIDIENTS AS FN_SUMMA,'
      '    FL_EDIT,'
      '    fk_doc_prih,'
      '   fk_doc_rash'
      '  FROM'
      '   ('
      'SELECT'
      '    ROWNUM,'
      '    KS.FK_ID,'
      '    KS.FD_DATA,'
      '    KS.FK_MEDICID,'
      '    M.FC_NAME,'
      '    KS.FC_SERIAL,'
      '    TEI.FC_NAME AS FC_UEDIZM, '
      '    KS.FN_NUMBER,'
      '    KS.FN_AMOUNT,'
      '    M.FN_FPACKINUPACK,'
      '    KS.FL_EDIT,'
      '    KS.fk_doc_prih,'
      '    KS.fk_doc_rash'
      '        '
      '  FROM MED.TKARTCOMPOS KS, MED.TMEDIC M, MED.TEI'
      '  WHERE KS.FK_MEDICID=M.MEDICID (+)'
      
        '    AND TRUNC(KS.FD_DATA) BETWEEN TRUNC(MED.PKG_MEDSES.GET_DATA1' +
        ') AND TRUNC(MED.PKG_MEDSES.GET_DATA2)'
      '    AND M.EIID = TEI.EIID (+)'
      '  ORDER BY ROWNUM'
      '   )MASTER2,'
      '   ('
      'SELECT  '
      '    FK_TKARTCOMPOSID,'
      '    SUM(FN_SUMMA) AS FN_SUMMA_FOR_INGRIDIENTS '
      '  FROM  '
      '(SELECT'
      '        K_ITEM.FK_TKARTCOMPOSID,'
      '        K_ITEM.FK_KART_ITEM,'
      '        K_ITEM.FN_AMOUNT,'
      '        k.FN_PRICE,'
      
        '        k.FN_PRICE * k_item.FN_AMOUNT AS FN_SUMMA               ' +
        ' '
      '      FROM'
      '        MED.TKARTCO_ITEM K_ITEM,'
      '        MED.TKARTCOMPOS KS, med.tkart k'
      '      WHERE KS.FK_ID=K_ITEM.FK_TKARTCOMPOSID'
      '       and k_item.fk_kart_item = k.kartid'
      
        '       AND TRUNC(KS.FD_DATA) BETWEEN TRUNC(MED.PKG_MEDSES.GET_DA' +
        'TA1) AND TRUNC(MED.PKG_MEDSES.GET_DATA2)'
      ')  '
      'GROUP BY FK_TKARTCOMPOSID  '
      '   ) DETAIL2'
      '  WHERE MASTER2.FK_ID = DETAIL2.FK_TKARTCOMPOSID(+)'
      ')  '
      'WHERE TRUNC(FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2)'
      'ORDER BY FD_DATA ASC'
      ') A')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445310C00000000000000000000000600
      00003A44415445320C00000000000000000000000A0000003A4D4F4E54485945
      41520500000002000000200000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000B000000464E5F4E414348454E4B410100000000000A0000
      00464E5F554348454E4B410100000000000C00000046435F4D4F4E5448594541
      5201000000000005000000444154453101000000000005000000444154453201
      0000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    AfterScroll = odsKARTCOMPOSAfterScroll
    Left = 614
    Top = 84
  end
  object dsObazat_Ingridienti: TDataSource
    DataSet = odsObazat_Ingridienti
    Left = 393
    Top = 358
  end
  object odsObazat_Ingridienti: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '    MC.FK_MEDICITEM AS TMEDICOMPLEX_FK_MEDICITEM,'
      '    MC.FK_MEDICCOMPLEXID,'
      '    M.MEDICID,'
      '    M.FC_NAME AS FC_MEDICNAME,'
      '    TEI.FC_NAME AS FC_UEDIZM,'
      
        '    MC.FN_AMOUNT AS FN_AMOUNT_FOR1, -- '#1082#1086#1083'-'#1074#1086' '#1076#1083#1103' 1-'#1086#1081' '#1087#1086#1088#1094#1080#1080' '#1080#1083 +
        #1080' '#1096#1090#1091#1082#1080
      
        '    case when :tkartcompos_fn_amount>0 then MC.FN_AMOUNT * :tkar' +
        'tcompos_fn_amount else MC.FN_AMOUNT end FN_AMOUNT -- '#1082#1086#1083'-'#1074#1086' '#1076#1083#1103' ' +
        'N-'#1086#1081' '#1087#1086#1088#1094#1080#1081' '#1080#1083#1080' '#1096#1090#1091#1082
      ''
      '  FROM'
      '    MED.TMEDIC M,'
      '    MED.TEI,'
      '    MED.TMEDICOMPLEX MC'
      '  WHERE MC.FK_MEDIC = :FK_MEDIC'
      '    AND MC.FK_MEDICITEM = M.MEDICID'
      '    AND M.EIID = TEI.EIID (+)'
      '    AND M.FL_VISIBLE = 1'
      'ORDER BY MC.FN_ORDER -- '#1087#1086#1088#1103#1076#1086#1082' '#1090#1072#1082#1086#1081' '#1078#1077', '#1082#1072#1082' '#1087#1088#1080' '#1089#1086#1079#1076#1072#1085#1080#1080)
    Optimize = False
    Variables.Data = {
      0300000002000000090000003A464B5F4D454449430300000000000000000000
      00160000003A544B415254434F4D504F535F464E5F414D4F554E540300000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000009000000464E5F414D4F554E540100000000000C00000046
      435F4D454449434E414D4501000000000019000000544D454449434F4D504C45
      585F464B5F4D454449434954454D0100000000000E000000464E5F414D4F554E
      545F464F52310100000000000900000046435F554544495A4D01000000000007
      0000004D454449434944010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 392
    Top = 412
  end
  object odsPartyOst: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '    OST.*'
      'from MED.VMEDKART_KOLOST OST'
      'where OST.KARTID = :KARTID'
      '  AND OST.FN_KOLOST > 0')
    Optimize = False
    Variables.Data = {0300000001000000070000003A4B4152544944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000060000004B4152544944010000000000070000004D454449
      4349440100000000000F000000464E5F465041434B494E555041434B01000000
      000008000000464E5F505249434501000000000009000000464E5F4B4F4C4F53
      5401000000000007000000464C5F45444954010000000000}
    Cursor = crSQLWait
    Master = odsIngridients
    MasterFields = 'FK_KART_ITEM'
    DetailFields = 'KARTID'
    Session = dmMain.os
    Left = 196
    Top = 410
  end
  object frxPrintSprav: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39343.492448449100000000
    ReportOptions.LastChange = 39603.777599456000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SET('#39'Signs'#39', '#39#39');  '
      'end;'
      ''
      
        'procedure Memo5OnPreviewClick(Sender: TfrxView; Button: TMouseBu' +
        'tton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1076#1072#1090#1091' '#1089#1087#1088#1072#1074#1082#1080#39', ' +
        #39#1044#1072#1090#1072':'#39', s);'
      '  Modified := True;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxPrintSpravGetValue
    OnUserFunction = frxPrintSpravUserFunction
    Left = 612
    Top = 132
    Datasets = <
      item
        DataSet = frxDBdsPrintSprav
        DataSetName = 'frxDBdsPrintSprav'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'Signs'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 210.000000000000000000
      PaperHeight = 148.000000000000000000
      PaperSize = 11
      LeftMargin = 19.999854166666700000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      object MasterData1: TfrxMasterData
        Height = 20.000000000000000000
        Top = 426.000000000000000000
        Width = 680.311226768958200000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 1
        Stretched = True
        object Memo14: TfrxMemoView
          Left = 1.000000000000000000
          Width = 335.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SIGNS]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 205.000000000000000000
        Top = 201.000000000000000000
        Width = 680.311226768958200000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frxDBdsPrintSprav
        DataSetName = 'frxDBdsPrintSprav'
        RowCount = 0
        object Memo11: TfrxMemoView
          Top = 104.000000000000000000
          Width = 680.311226770000000000
          Height = 12.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Top = 172.000000000000000000
          Width = 680.311226770000000000
          Height = 12.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Top = 20.000000000000000000
          Width = 680.311226770000000000
          Height = 19.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [frxDBdsPrintSprav."DATE1"] '#1056#1111#1056#1109' [frxDBdsPr' +
              'intSprav."DATE2"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Width = 680.311226770000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1115' '#1056#1169#1056#1109#1056#1109#1057#8224#1056#181#1056#1029#1056#1108#1056#181' '#1056#1105' '#1057#1107#1057#8224#1056#181#1056#1029#1056#1108#1056#181' '#1056#1111#1056#1109' '#1056#187#1056#176#1056#177#1056#1109#1057#1026#1056#176#1057#8218#1056#1109#1057#1026#1056#1029#1056#1109'-' +
              #1057#8222#1056#176#1057#1027#1056#1109#1056#1030#1056#1109#1057#8225#1056#1029#1057#8249#1056#1112' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1056#176#1056#1112)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 84.000000000000000000
          Width = 679.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[MONEYSTR(<frxDBdsPrintSprav."FN_NACHENKA">)]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo10: TfrxMemoView
          Left = 1.000000000000000000
          Top = 156.000000000000000000
          Width = 679.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[MONEYSTR(<frxDBdsPrintSprav."FN_UCHENKA">)]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo1: TfrxMemoView
          Top = 44.000000000000000000
          Width = 290.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#1109#1057#8224#1056#181#1056#1029#1056#1108#1056#176
            #1056#1111#1056#1109' '#1056#187#1056#176#1056#177#1056#1109#1057#1026#1056#176#1057#8218#1056#1109#1057#1026#1056#1029#1056#1109'-'#1057#8222#1056#176#1057#1027#1056#1109#1056#1030#1056#1109#1057#8225#1056#1029#1057#8249#1056#1112' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1056#176#1056#1112' ')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 294.000000000000000000
          Top = 59.000000000000000000
          Width = 386.000000000000000000
          Height = 25.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Memo.UTF8 = (
            '[frxDBdsPrintSprav."FN_NACHENKA"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Top = 116.000000000000000000
          Width = 290.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1032#1057#8224#1056#181#1056#1029#1056#1108#1056#176
            #1056#1111#1056#1109' '#1056#187#1056#176#1056#177#1056#1109#1057#1026#1056#176#1057#8218#1056#1109#1057#1026#1056#1029#1056#1109'-'#1057#8222#1056#176#1057#1027#1056#1109#1056#1030#1056#1109#1057#8225#1056#1029#1057#8249#1056#1112' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1056#176#1056#1112)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 294.000000000000000000
          Top = 133.000000000000000000
          Width = 386.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Memo.UTF8 = (
            '[frxDBdsPrintSprav."FN_UCHENKA"]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 125.000000000000000000
        Top = 16.000000000000000000
        Width = 680.311226768958200000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo4: TfrxMemoView
          Top = 84.000000000000000000
          Width = 680.311226770000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          CharSpacing = 3.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1119#1056#160#1056#1106#1056#8217#1056#1113#1056#1106' '#1074#8222#8211)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Top = 101.000000000000000000
          Width = 680.311226770000000000
          Height = 20.000000000000000000
          OnPreviewClick = 'Memo5OnPreviewClick'
          ShowHint = False
          StretchMode = smMaxHeight
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.UTF8 = (
            '[StrSpravDate]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 365.000000000000000000
          Top = 1.000000000000000000
          Width = 314.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1056#1118#1056#8217#1056#8226#1056#160#1056#8211#1056#8221#1056#1106#1056#174)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 365.000000000000000000
          Top = 19.000000000000000000
          Width = 314.000000000000000000
          Height = 62.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8220#1056#187#1056#176#1056#1030#1056#1029#1057#8249#1056#8470' '#1056#1030#1057#1026#1056#176#1057#8225
            '[var_glav_vrach]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 1.000000000000000000
          Top = 1.000000000000000000
          Width = 96.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1106#1056#1111#1057#8218#1056#181#1056#1108#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBdsPrintSprav: TfrxDBDataset
    UserName = 'frxDBdsPrintSprav'
    CloseDataSource = False
    DataSet = odsPrintSprav
    BCDToCurrency = False
    Left = 524
    Top = 190
  end
  object pmProduceType: TPopupMenu
    Left = 384
    Top = 176
    object miProduceType_ALL: TMenuItem
      AutoCheck = True
      Caption = #1042#1089#1077
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = miProduceType_ALLClick
    end
    object N5: TMenuItem
      Caption = '-'
      GroupIndex = 1
    end
  end
  object dsTProduce_type: TDataSource
    DataSet = dmMain.odsTProduce_type
    Left = 946
    Top = 92
  end
  object oqSetFK_PRODUCE_TYPE: TOracleQuery
    SQL.Strings = (
      'UPDATE MED.TKARTCOMPOS'
      'SET '
      '  FK_PRODUCE_TYPE = :FK_PRODUCE_TYPE'
      '       '
      'WHERE FK_ID = :AFK_ID')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000002000000070000003A41464B5F494403000000000000000000000010
      0000003A464B5F50524F445543455F54595045030000000000000000000000}
    Cursor = crSQLWait
    Left = 86
    Top = 294
  end
  object oqKartComposExists: TOracleQuery
    SQL.Strings = (
      'declare '
      '  vFK_TKARTCOMPOSID number;'
      'begin'
      '  vFK_TKARTCOMPOSID := -1;'
      '  '
      '  select min ( k.FK_ID )'
      '    into vFK_TKARTCOMPOSID'
      '    from med.TKARTCOMPOS k'
      '    where k.FK_ID = :FK_TKARTCOMPOSID;'
      '    '
      '    '
      '  :pFK_ID := nvl( vFK_TKARTCOMPOSID, -1);'
      'end;    ')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000002000000110000003A464B5F544B415254434F4D504F534944030000
      000000000000000000070000003A50464B5F4944030000000000000000000000}
    Left = 752
    Top = 128
  end
end
