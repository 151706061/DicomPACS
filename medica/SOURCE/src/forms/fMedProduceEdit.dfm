object frmMedProduceEdit: TfrmMedProduceEdit
  Left = 360
  Top = 197
  Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
  ClientHeight = 487
  ClientWidth = 811
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 415
    Width = 811
    Height = 72
    Align = alBottom
    TabOrder = 0
    Visible = False
    object GroupBox3: TGroupBox
      Left = 1
      Top = 1
      Width = 809
      Height = 70
      Align = alClient
      Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1103
      TabOrder = 0
      object Memo1: TMemo
        Left = 2
        Top = 15
        Width = 805
        Height = 53
        Align = alClient
        PopupMenu = PopupMenu1
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 811
    Height = 153
    Align = alTop
    TabOrder = 1
    DesignSize = (
      811
      153)
    object Label1: TLabel
      Left = 48
      Top = 50
      Width = 94
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072':'
    end
    object Label2: TLabel
      Left = 244
      Top = 50
      Width = 34
      Height = 13
      Caption = #1057#1077#1088#1080#1103':'
    end
    object Label4: TLabel
      Left = 7
      Top = 76
      Width = 135
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1072':'
    end
    object laFC_UEDIZM: TLabel
      Left = 334
      Top = 100
      Width = 39
      Height = 13
      Caption = '             '
    end
    object Label6: TLabel
      Left = 14
      Top = 98
      Width = 183
      Height = 13
      Caption = #1048#1079#1075#1086#1090#1072#1074#1083#1080#1074#1072#1077#1084#1086#1077' '#1082#1086#1083'-'#1074#1086' '#1083#1077#1082'. '#1092#1086#1088#1084
    end
    object Label3: TLabel
      Left = 411
      Top = 50
      Width = 103
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1090#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072':'
    end
    object Label7: TLabel
      Left = 44
      Top = 122
      Width = 192
      Height = 13
      Caption = #1048#1079#1075#1086#1090#1072#1074#1083#1080#1074#1072#1077#1084#1086#1077' '#1082#1086#1083'-'#1074#1086'('#1092#1072#1089'.'#1077#1076'.'#1080#1079#1084')'
      Visible = False
    end
    object laFC_FEDIZM: TLabel
      Left = 370
      Top = 124
      Width = 39
      Height = 13
      Caption = '             '
      Visible = False
    end
    object laFinSource: TLabel
      Left = 581
      Top = 100
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object deSerial: TEdit
      Left = 285
      Top = 47
      Width = 99
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object edMedic: TcxButtonEdit
      Left = 148
      Top = 72
      Anchors = [akLeft, akTop, akRight]
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Style.BorderStyle = ebs3D
      Style.ButtonStyle = bts3D
      TabOrder = 2
      OnClick = edMedicClick
      Width = 654
    end
    object deFN_NUMBER: TcxSpinEdit
      Left = 148
      Top = 47
      Properties.MaxValue = 9999999.000000000000000000
      Properties.MinValue = 1.000000000000000000
      Style.BorderStyle = ebs3D
      TabOrder = 0
      Value = 1
      Width = 69
    end
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 809
      Height = 44
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 60
      Caption = 'ToolBar1'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 5
      object TB_save: TToolButton
        Left = 0
        Top = 0
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Enabled = False
        ImageIndex = 9
        OnClick = TB_saveClick
      end
      object ToolButton5: TToolButton
        Left = 60
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object TB_cancel: TToolButton
        Left = 68
        Top = 0
        Hint = #1054#1090#1084#1077#1085#1072
        Caption = #1054#1090#1084#1077#1085#1072
        ImageIndex = 8
        OnClick = TB_cancelClick
      end
    end
    object deMainAmount: TcxSpinEdit
      Left = 210
      Top = 96
      Properties.AssignedValues.MinValue = True
      Properties.ImmediatePost = True
      Properties.MaxValue = 9999999.000000000000000000
      Properties.ValueType = vtFloat
      Properties.OnEditValueChanged = deMainAmountChange
      Style.BorderStyle = ebs3D
      TabOrder = 3
      Value = 1.000000000000000000
      Width = 121
    end
    object deFasAmount: TcxSpinEdit
      Left = 242
      Top = 121
      Properties.AssignedValues.MinValue = True
      Properties.ImmediatePost = True
      Properties.MaxValue = 9999999.000000000000000000
      Properties.ValueType = vtInt
      Properties.OnEditValueChanged = deFasAmountChange
      Style.BorderStyle = ebs3D
      TabOrder = 4
      Value = 1
      Visible = False
      Width = 121
    end
    object deDate: TcxDateEdit
      Left = 517
      Top = 47
      Anchors = [akTop, akRight]
      Properties.DateButtons = [btnToday]
      Properties.ImmediatePost = True
      Properties.InputKind = ikMask
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnValidate = deDatePropertiesValidate
      Style.BorderStyle = ebs3D
      TabOrder = 6
      Width = 83
    end
    object chbGodenDo: TCheckBox
      Left = 621
      Top = 50
      Width = 96
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080':'
      TabOrder = 7
      OnClick = chbGodenDoClick
    end
    object deGodenDo: TcxDateEdit
      Left = 719
      Top = 49
      Anchors = [akTop, akRight]
      Enabled = False
      Properties.DateButtons = [btnToday]
      Properties.ImmediatePost = True
      Properties.InputKind = ikMask
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnValidate = deDatePropertiesValidate
      Style.BorderStyle = ebs3D
      TabOrder = 8
      Width = 83
    end
    object chbUseTara: TCheckBox
      Left = 400
      Top = 98
      Width = 73
      Height = 17
      Caption = #1048#1089#1087'. '#1090#1072#1088#1091
      Checked = True
      State = cbChecked
      TabOrder = 9
      OnClick = chbUseTaraClick
    end
    object lcbFinSource: TDBLookupComboBox
      Left = 652
      Top = 96
      Width = 150
      Height = 21
      Hint = #1048#1089#1090#1086#1095#1085#1080#1082' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'FK_ID'
      ListField = 'FC_NAME'
      ListSource = dmMain.dsTFinSource
      NullValueKey = 46
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 153
    Width = 811
    Height = 262
    Align = alClient
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 337
      Top = 1
      Height = 260
      ExplicitHeight = 147
    end
    object GroupBox1: TGroupBox
      Left = 340
      Top = 1
      Width = 470
      Height = 260
      Align = alClient
      Caption = #1058#1077#1082#1091#1097#1080#1077' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1099' ('#1082#1072#1088#1090#1086#1095#1082#1080' '#1086#1073#1098#1077#1082#1090#1086#1074' '#1091#1095#1077#1090#1072')'
      TabOrder = 0
      object ToolBar2: TToolBar
        Left = 2
        Top = 15
        Width = 466
        Height = 26
        AutoSize = True
        BorderWidth = 1
        ButtonWidth = 111
        Caption = 'ToolBar2'
        Images = dmMain.ilMain
        List = True
        ParentShowHint = False
        ShowCaptions = True
        ShowHint = True
        TabOrder = 0
        object btnAdd: TToolButton
          Left = 0
          Top = 0
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1085#1075#1088#1080#1076#1080#1077#1085#1090
          AutoSize = True
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          Enabled = False
          ImageIndex = 21
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAddClick
        end
        object btnEdit: TToolButton
          Left = 81
          Top = 0
          Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1080#1085#1075#1088#1080#1076#1080#1077#1085#1090
          AutoSize = True
          Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
          Enabled = False
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
          OnClick = btnEditClick
        end
        object btnDel: TToolButton
          Left = 189
          Top = 0
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1080#1085#1075#1088#1080#1076#1080#1077#1085#1090
          AutoSize = True
          Caption = #1059#1076#1072#1083#1080#1090#1100
          Enabled = False
          ImageIndex = 22
          ParentShowHint = False
          ShowHint = True
          OnClick = btnDelClick
        end
        object ToolButton2: TToolButton
          Left = 263
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 24
          Style = tbsSeparator
        end
        object tbuAutoFill: TToolButton
          Left = 271
          Top = 0
          Hint = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1074#1099#1073#1088#1072#1090#1100' '#1086#1089#1090#1072#1090#1082#1080' '#1087#1086' '#1080#1085#1075#1088#1080#1076#1080#1077#1085#1090#1072#1084
          AutoSize = True
          Caption = #1040#1074#1090#1086#1079#1072#1087#1086#1083#1085#1077#1085#1080#1077
          Enabled = False
          ImageIndex = 2
          OnClick = tbuAutoFillClick
        end
      end
      object cxGridCurIngr: TcxGrid
        Left = 2
        Top = 41
        Width = 466
        Height = 217
        Align = alClient
        TabOrder = 1
        OnExit = cxGridCurIngrExit
        LookAndFeel.Kind = lfUltraFlat
        object cxGridCurIngrDBTableView1: TcxGridDBTableView
          OnDblClick = dbgDblClick
          NavigatorButtons.ConfirmDelete = False
          OnCustomDrawCell = cxGridCurIngrDBTableView1CustomDrawCell
          DataController.DataSource = dsMedKartItem
          DataController.Filter.MaxValueListCount = 1000
          DataController.Filter.Active = True
          DataController.KeyFieldNames = 'FK_KART_ITEM'
          DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Filtering.ColumnPopup.MaxDropDownItemCount = 12
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.Indicator = True
          Preview.AutoHeight = False
          Preview.MaxLineCount = 2
          Styles.ContentEven = dmMain.cxStyleGridDetailEvenRow
          Styles.ContentOdd = dmMain.cxStyleGridDetailOddRow
          Styles.Selection = dmMain.cxStyleGridSelectedRow
          object cxGridCurIngrDBTableView1FK_ID: TcxGridDBColumn
            DataBinding.FieldName = 'FK_ID'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
            Width = 193
          end
          object cxGridCurIngrDBTableView1FK_TKARTCOMPOSID: TcxGridDBColumn
            DataBinding.FieldName = 'FK_TKARTCOMPOSID'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
            Width = 352
          end
          object cxGridCurIngrDBTableView1FK_KART_ITEM: TcxGridDBColumn
            DataBinding.FieldName = 'FK_KART_ITEM'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
            Width = 255
          end
          object cxGridCurIngrDBTableView1FN_PARTY_ORDER: TcxGridDBColumn
            Caption = #1055#1086#1088#1103#1076#1086#1082' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103' '#1087#1072#1088#1090#1080#1081
            DataBinding.FieldName = 'FN_PARTY_ORDER'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 999.000000000000000000
            Properties.ValueType = vtInt
            Properties.OnEditValueChanged = cxGridCurIngrDBTableView1FN_PARTY_ORDERPropertiesEditValueChanged
            Width = 37
          end
          object cxGridCurIngrDBTableView1TKART_NAME: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'TKART_NAME'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 255
            Properties.ReadOnly = True
            Options.Editing = False
            Options.Filtering = False
            VisibleForCustomization = False
            Width = 197
          end
          object cxGridCurIngrDBTableView1FC_UEDIZM: TcxGridDBColumn
            Caption = #1059#1087'.'#1077#1076'.'#1080#1079#1084
            DataBinding.FieldName = 'FC_UEDIZM'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 1024
            Properties.ReadOnly = True
            Options.Editing = False
            Options.Filtering = False
            VisibleForCustomization = False
            Width = 43
          end
          object cxGridCurIngrDBTableView1FN_AMOUNT_FOR1: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086
            DataBinding.FieldName = 'FN_AMOUNT_FOR1'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.DisplayFormat = '### ### ### ##0.#######'
            Properties.EditFormat = '### ### ### ##0.#######'
            Properties.MaxValue = 9999999.000000000000000000
            Properties.UseDisplayFormatWhenEditing = True
            Properties.ValueType = vtFloat
            Properties.OnEditValueChanged = cxGridCurIngrDBTableView1FN_AMOUNT_FOR1PropertiesEditValueChanged
            Options.Filtering = False
            VisibleForCustomization = False
            Width = 43
          end
          object cxGridCurIngrDBTableView1FN_AMOUNT: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1089#1087#1080#1089#1072#1085#1086
            DataBinding.FieldName = 'FN_AMOUNT'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.DisplayFormat = '### ### ##0.##########'
            Properties.ReadOnly = True
            Options.Editing = False
            Options.Filtering = False
            VisibleForCustomization = False
            Width = 73
          end
          object cxGridCurIngrDBTableView1FN_OST: TcxGridDBColumn
            Caption = #1054#1089#1090#1072#1090#1086#1082
            DataBinding.FieldName = 'FN_OST'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.ReadOnly = True
            Properties.ValueType = vtFloat
            Options.Editing = False
            VisibleForCustomization = False
            Width = 59
          end
        end
        object cxGridCurIngrLevel1: TcxGridLevel
          GridView = cxGridCurIngrDBTableView1
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 336
      Height = 260
      Align = alLeft
      Caption = #1054#1073#1103#1079#1072#1090#1077#1083#1100#1085#1099#1077' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1099' ('#1086#1073#1098#1077#1082#1090#1099' '#1091#1095#1077#1090#1072')'
      TabOrder = 1
      object cxGridObIngr: TcxGrid
        Left = 2
        Top = 15
        Width = 332
        Height = 243
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        object cxGridObIngrDBTableView1: TcxGridDBTableView
          OnDblClick = dxDBGrid1DblClick
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsObazat_Ingridienti
          DataController.Filter.MaxValueListCount = 1000
          DataController.Filter.Active = True
          DataController.KeyFieldNames = 'TMEDICOMPLEX_FK_MEDICITEM'
          DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Filtering.ColumnPopup.MaxDropDownItemCount = 12
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.Editing = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.Indicator = True
          Preview.AutoHeight = False
          Preview.MaxLineCount = 2
          Styles.ContentEven = dmMain.cxStyleGridEvenRow
          Styles.ContentOdd = dmMain.cxStyleGridOddRow
          Styles.Selection = dmMain.cxStyleGridSelectedRow
          object cxGridObIngrDBTableView1TMEDICOMPLEX_FK_MEDICITEM: TcxGridDBColumn
            DataBinding.FieldName = 'TMEDICOMPLEX_FK_MEDICITEM'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Width = 542
          end
          object cxGridObIngrDBTableView1FC_MEDICNAME: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_MEDICNAME'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 255
            Properties.ReadOnly = True
            Options.Filtering = False
            Width = 101
          end
          object cxGridObIngrDBTableView1FC_UEDIZM: TcxGridDBColumn
            Caption = #1045#1076'.'#1080#1079#1084
            DataBinding.FieldName = 'FC_UEDIZM'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 1024
            Properties.ReadOnly = True
            Options.Filtering = False
            Width = 79
          end
          object cxGridObIngrDBTableView1FN_AMOUNT_FOR1: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086
            DataBinding.FieldName = 'FN_AMOUNT_FOR1'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.AssignedValues.MinValue = True
            Properties.DisplayFormat = '### ### ##0.#######'
            Properties.ValueType = vtFloat
            Options.Editing = False
            Options.Filtering = False
            Width = 62
          end
          object cxGridObIngrDBTableView1FN_AMOUNT: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1089#1087#1080#1089#1072#1085#1086
            DataBinding.FieldName = 'FN_AMOUNT'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.DisplayFormat = '### ### ##0.##########'
            Properties.ValueType = vtFloat
            Options.Editing = False
            Options.Filtering = False
            Width = 61
          end
        end
        object cxGridObIngrLevel1: TcxGridLevel
          GridView = cxGridObIngrDBTableView1
        end
      end
    end
  end
  object dsObazat_Ingridienti: TDataSource
    DataSet = odsObazat_Ingridienti
    Left = 97
    Top = 226
  end
  object odsObazat_Ingridienti: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '    MC.FK_MEDICITEM AS TMEDICOMPLEX_FK_MEDICITEM,'
      '    MC.FK_MEDICCOMPLEXID,'
      '    MC.FL_TARA,'
      '    M.MEDICID,'
      '    M.FC_NAME AS FC_MEDICNAME,'
      '    TEI.FC_NAME AS FC_UEDIZM,'
      
        '    MC.FN_AMOUNT AS FN_AMOUNT_FOR1, -- '#1082#1086#1083'-'#1074#1086' '#1076#1083#1103' 1-'#1086#1081' '#1087#1086#1088#1094#1080#1080' '#1080#1083 +
        #1080' '#1096#1090#1091#1082#1080
      
        '    case when :tkartcompos_fn_amount>=0 then MC.FN_AMOUNT * :tka' +
        'rtcompos_fn_amount else MC.FN_AMOUNT end FN_AMOUNT -- '#1082#1086#1083'-'#1074#1086' '#1076#1083#1103 +
        ' N-'#1086#1081' '#1087#1086#1088#1094#1080#1081' '#1080#1083#1080' '#1096#1090#1091#1082
      '    '
      '  FROM'
      '    MED.TMEDIC M,'
      '    MED.TEI,'
      '    MED.TMEDICOMPLEX MC'
      '  WHERE MC.FK_MEDIC = :FK_MEDIC'
      '    AND MC.FK_MEDICITEM = M.MEDICID'
      '    AND M.EIID = TEI.EIID (+)'
      'ORDER BY MC.FN_ORDER ')
    Optimize = False
    Variables.Data = {
      0300000002000000090000003A464B5F4D454449430300000000000000000000
      00160000003A544B415254434F4D504F535F464E5F414D4F554E540400000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000009000000464E5F414D4F554E540100000000000C00000046
      435F4D454449434E414D4501000000000019000000544D454449434F4D504C45
      585F464B5F4D454449434954454D0100000000000E000000464E5F414D4F554E
      545F464F52310100000000000900000046435F554544495A4D01000000000007
      0000004D454449434944010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    AfterOpen = odsObazat_IngridientiAfterRefresh
    AfterRefresh = odsObazat_IngridientiAfterRefresh
    Left = 96
    Top = 280
  end
  object odsMedKartItem: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '    K_ITEM.ROWID,    '
      '    K_ITEM.FK_ID,'
      '    K_ITEM.FK_TKARTCOMPOSID,'
      '    K_ITEM.FK_KART_ITEM,'
      '    K_ITEM.FN_PARTY_ORDER,'
      '--    NVL(OST.FN_KOLOST,0) as FN_CUR_OST,'
      '    K_ITEM.FN_CUR_OST,'
      ''
      
        '    M.FC_NAME||'#39' ('#1087'. '#8470#39'||TO_CHAR(K.FN_PARTY_NUM)||'#39')'#39' AS TKART_N' +
        'AME,'
      '    M.MEDICID,'
      '    TEI.FC_NAME AS FC_UEDIZM,'
      '    K_ITEM.FN_AMOUNT_FOR1,'
      '    K_ITEM.FN_AMOUNT,'
      '    (NVL(K_ITEM.FN_CUR_OST,0) - K_ITEM.FN_AMOUNT) as FN_OST,'
      '    medc.fn_order'
      ''
      '--    0 as FN_OST'
      '   '
      '  FROM'
      '    MED.TKARTCO_ITEM K_ITEM,'
      '    MED.TKART K,'
      '    MED.TMEDIC M,'
      '    MED.TEI,'
      '    MED.tmedicomplex medc'
      '--  ,MED.VMEDKART_KOLOST OST'
      '  WHERE '
      '    K_ITEM.FK_TKARTCOMPOSID = :FK_TKARTCOMPOSID'
      '    AND K_ITEM.FK_KART_ITEM = K.KARTID'
      '--    AND K.KARTID = OST.KARTID(+)'
      '    AND K.MEDICID = M.MEDICID'
      '    AND M.EIID = TEI.EIID (+)'
      '    AND medc.fk_medic(+) = :PRODUCE_MEDID'
      '    and K.MEDICID = medc.fk_medicitem(+)'
      'ORDER BY medc.fn_order, UPPER(M.FC_NAME), K_ITEM.FN_PARTY_ORDER'
      ''
      '/*SELECT'
      '    K_ITEM.FK_ID,'
      '    K_ITEM.FK_TKARTCOMPOSID,'
      '    K_ITEM.FK_KART_ITEM,'
      '    K.FC_NAME AS TKART_NAME,'
      '    T2.FC_NAME AS FC_EI,'
      '    K_ITEM.FN_AMOUNT_FOR1,'
      '    K_ITEM.FN_AMOUNT'
      '  FROM'
      '    TMEDIC M,'
      '    TEI T2,'
      '    TKART K,'
      '    TKARTCO_ITEM K_ITEM'
      '  WHERE K_ITEM.FK_TKARTCOMPOSID = :FK_TKARTCOMPOSID'
      '    AND K_ITEM.FK_KART_ITEM = K.KARTID'
      '    AND K.MEDICID = M.MEDICID'
      '    AND T2.EIID = M.FK_FPACKID'
      '    AND M.FL_VISIBLE = 1'
      'ORDER BY K.FC_NAME, T2.FC_NAME*/')
    Optimize = False
    Variables.Data = {
      0300000002000000110000003A464B5F544B415254434F4D504F534944030000
      0004000000FFFFFFFF000000000E0000003A50524F445543455F4D4544494403
      00000004000000FFFFFFFF00000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B00000010000000464B5F544B415254434F4D504F53494401000000
      00000C000000464B5F4B4152545F4954454D01000000000009000000464E5F41
      4D4F554E540100000000000A000000544B4152545F4E414D4501000000000005
      000000464B5F49440100000000000E000000464E5F414D4F554E545F464F5231
      0100000000000900000046435F554544495A4D010000000000070000004D4544
      494349440100000000000E000000464E5F50415254595F4F5244455201000000
      00000A000000464E5F4355525F4F535401000000000006000000464E5F4F5354
      010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    AfterOpen = odsMedKartItemAfterRefresh
    BeforeClose = odsMedKartItemBeforeClose
    BeforeRefresh = odsMedKartItemBeforeClose
    AfterRefresh = odsMedKartItemAfterRefresh
    Left = 397
    Top = 308
  end
  object dsMedKartItem: TDataSource
    DataSet = odsMedKartItem
    Left = 397
    Top = 250
  end
  object PopupMenu1: TPopupMenu
    Left = 217
    Top = 257
    object PM_Clean: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = PM_CleanClick
    end
  end
  object odsIngrOst: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '    OST.*,'
      '    K.fd_goden,'
      '    NVL(M.FC_NAME,'#39#39') as MEDIC_NAME'
      'from MED.VMEDKART_KOLOST OST, MED.TKART K, MED.TMEDIC M'
      'where OST.MEDICID = :MEDICID'
      '  AND OST.KARTID = K.kartid(+)'
      '  AND OST.MEDICID = M.MEDICID(+)'
      '  AND OST.FN_KOLOST > 0'
      '  AND OST.FN_OST_TYPE = 0'
      '  AND ((K.Fd_Goden is null)or(K.Fd_Goden >= sysdate))'
      
        'ORDER BY K.fd_goden asc, K.FN_PARTY_NUM asc  -- '#1080#1084#1077#1085#1085#1086' '#1087#1086' '#1074#1086#1079#1088#1072#1089 +
        #1090#1072#1085#1080#1102' '#1089#1088#1086#1082#1072' '#1075#1086#1076#1085#1086#1089#1090#1080
      '')
    Optimize = False
    Variables.Data = {
      0300000001000000080000003A4D454449434944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000009000000060000004B4152544944010000000000070000004D454449
      4349440100000000000F000000464E5F465041434B494E555041434B01000000
      000008000000464E5F505249434501000000000009000000464E5F4B4F4C4F53
      540100000000000800000046445F474F44454E0100000000000A0000004D4544
      49435F4E414D450100000000000B000000464E5F4F53545F5459504501000000
      0000050000004450434944010000000000}
    Cursor = crSQLWait
    Master = odsObazat_Ingridienti
    MasterFields = 'MEDICID'
    DetailFields = 'medicid'
    Session = dmMain.os
    AfterOpen = odsIngrOstAfterOpen
    AfterRefresh = odsIngrOstAfterOpen
    Left = 566
    Top = 294
  end
  object dsIngrOst: TDataSource
    DataSet = odsIngrOst
    Left = 623
    Top = 294
  end
  object oqClearIngr: TOracleQuery
    SQL.Strings = (
      ' DELETE FROM MED.TKARTCO_ITEM K_ITEM'
      ' WHERE K_ITEM.FK_TKARTCOMPOSID = :FK_TKARTCOMPOSID')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000001000000110000003A464B5F544B415254434F4D504F534944030000
      000000000000000000}
    Cursor = crSQLWait
    Left = 484
    Top = 302
  end
  object tmRefresh_odsMedKartItem: TTimer
    Enabled = False
    OnTimer = tmRefresh_odsMedKartItemTimer
    Left = 402
    Top = 364
  end
  object oqUPD_OST: TOracleQuery
    SQL.Strings = (
      '-- '#1086#1073#1085#1086#1074#1083#1103#1077#1084' '#1086#1089#1090#1072#1090#1086#1082' '#1087#1086' '#1087#1072#1088#1090#1080#1080
      
        'UPDATE  MED.TKARTCO_ITEM K_ITEM SET FN_CUR_OST = MED.PKGMEDKART.' +
        'GETOST(K_ITEM.FK_KART_ITEM, :pDate)'
      ' WHERE K_ITEM.FK_ID = :K_ITEM_FK_ID')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      03000000020000000D0000003A4B5F4954454D5F464B5F494403000000000000
      0000000000060000003A50444154450C0000000000000000000000}
    Left = 482
    Top = 238
  end
  object oqUPD_OST_ALL: TOracleQuery
    SQL.Strings = (
      '-- '#1086#1073#1085#1086#1074#1083#1103#1077#1084' '#1086#1089#1090#1072#1090#1086#1082' '#1087#1086' '#1074#1089#1077#1084' '#1087#1072#1088#1090#1080#1103#1084
      
        'UPDATE MED.TKARTCO_ITEM K_ITEM SET FN_CUR_OST = MED.PKGMEDKART.G' +
        'ETOST(K_ITEM.FK_KART_ITEM, :pDate)'
      ' WHERE K_ITEM.FK_TKARTCOMPOSID = :FK_TKARTCOMPOSID')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000002000000110000003A464B5F544B415254434F4D504F534944030000
      000000000000000000060000003A50444154450C0000000000000000000000}
    Left = 566
    Top = 238
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmMedProduceEdit\'
    StoredProps.Strings = (
      'GroupBox2.Width')
    StoredValues = <>
    Left = 708
    Top = 270
  end
  object odsKARTCOMPOS: TOracleDataSet
    SQL.Strings = (
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
      '    FN_AMOUNT AS FN_AMOUNT_POLUCHENO,'
      '    FL_EDIT,'
      '    DECODE(FL_EDIT,0,'#39#1044#1072#39',1,'#39#1053#1077#1090#39') AS PODPISAN,'
      '    fk_doc_prih,'
      '    fk_doc_rash,'
      '    FD_GODEN_DO,'
      '    FL_USE_TARA,'
      '    FK_PRODUCE_TYPE,'
      '    FK_FINSOURCE_ID'
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
      '    FK_FINSOURCE_ID,'
      ''
      '    DETAIL2.FN_SUMMA_FOR_INGRIDIENTS,'
      
        '    Round(DETAIL2.FN_SUMMA_FOR_INGRIDIENTS/FN_AMOUNT,2) AS FN_PR' +
        'ICE_FOR_1,'
      
        '    Round(DETAIL2.FN_SUMMA_FOR_INGRIDIENTS/FN_AMOUNT,2)*FN_AMOUN' +
        'T AS FN_SUMMA_TRUNCED, -- '#1054#1050#1056#1059#1043#1051#1045#1053#1053#1040#1071
      '    FN_SUMMA_FOR_INGRIDIENTS AS FN_SUMMA,'
      '    FL_EDIT,'
      '    fk_doc_prih,'
      '   fk_doc_rash,'
      '   FD_GODEN_DO,'
      '   FL_USE_TARA,'
      '   FK_PRODUCE_TYPE'
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
      '    KS.fk_doc_rash,'
      '    KS.FD_GODEN_DO,'
      '    KS.FL_USE_TARA,'
      '    KS.FK_PRODUCE_TYPE,'
      '    KS.FK_FINSOURCE_ID'
      '        '
      '  FROM MED.TKARTCOMPOS KS, MED.TMEDIC M, MED.TEI'
      '  WHERE KS.FK_MEDICID=M.MEDICID (+)'
      '    AND M.EIID = TEI.EIID (+)'
      '    and KS.FK_ID = :fk_tkartcomposid'
      '  ORDER BY ROWNUM'
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
      '       and KS.FK_ID = :fk_tkartcomposid'
      ''
      ')  '
      'GROUP BY FK_TKARTCOMPOSID  '
      '   ) DETAIL2'
      '  WHERE MASTER2.FK_ID = DETAIL2.FK_TKARTCOMPOSID(+))')
    Optimize = False
    Variables.Data = {
      0300000001000000110000003A464B5F544B415254434F4D504F534944030000
      000000000000000000}
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
    Session = dmMain.os
    Left = 88
    Top = 128
  end
end
