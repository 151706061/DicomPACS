object frmLabPatAnatom: TfrmLabPatAnatom
  Left = 267
  Top = 39
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = #1051#1072#1073#1086#1088#1072#1085#1090
  ClientHeight = 764
  ClientWidth = 808
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 808
    Height = 764
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitHeight = 636
    DesignSize = (
      808
      764)
    object VerGr: TcxVerticalGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 802
      Height = 296
      Margins.Bottom = 0
      BorderStyle = cxcbsNone
      Align = alTop
      LookAndFeel.Kind = lfUltraFlat
      OptionsView.CellAutoHeight = True
      OptionsView.RowHeaderWidth = 202
      OptionsBehavior.BandSizing = False
      OptionsBehavior.HeaderSizing = False
      TabOrder = 0
      object catPac: TcxCategoryRow
        Options.CanResized = False
        Options.Focusing = False
        Options.TabStop = False
        Properties.Caption = #1044#1072#1085#1085#1099#1077' '#1087#1072#1094#1080#1077#1085#1090#1072
      end
      object merFIOMK: TcxMultiEditorRow
        Options.CanResized = False
        Options.Focusing = False
        Options.Moving = False
        Options.TabStop = False
        Properties.Editors = <
          item
            Caption = #1060#1048#1054
            EditPropertiesClassName = 'TcxLabelProperties'
            EditProperties.Alignment.Horz = taCenter
            EditProperties.Orientation = cxoBottom
            EditProperties.WordWrap = True
            Width = 75
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Options.Filtering = False
            Options.IncSearch = False
            Value = Null
          end
          item
            Caption = #8470' '#1052#1050
            EditPropertiesClassName = 'TcxLabelProperties'
            EditProperties.Alignment.Horz = taCenter
            EditProperties.Orientation = cxoBottom
            EditProperties.WordWrap = True
            Width = 30
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Options.Filtering = False
            Options.IncSearch = False
            Value = Null
          end>
        Styles.Header = stFIO
        Styles.Content = stFIO
      end
      object merDateAgeSex: TcxMultiEditorRow
        Options.CanResized = False
        Options.Focusing = False
        Options.Moving = False
        Options.TabStop = False
        Properties.Editors = <
          item
            Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
            EditPropertiesClassName = 'TcxLabelProperties'
            EditProperties.Alignment.Horz = taCenter
            EditProperties.Alignment.Vert = taVCenter
            Width = 90
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Options.Filtering = False
            Options.IncSearch = False
            Value = Null
          end
          item
            Caption = #1042#1086#1079#1088#1072#1089#1090
            EditPropertiesClassName = 'TcxLabelProperties'
            EditProperties.Alignment.Horz = taCenter
            EditProperties.Alignment.Vert = taVCenter
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Options.Filtering = False
            Options.IncSearch = False
            Value = Null
          end
          item
            Caption = #1055#1086#1083
            EditPropertiesClassName = 'TcxLabelProperties'
            EditProperties.Alignment.Horz = taCenter
            EditProperties.Alignment.Vert = taVCenter
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Options.Filtering = False
            Options.IncSearch = False
            Value = Null
          end>
      end
      object rowAddress: TcxEditorRow
        Options.CanResized = False
        Options.Focusing = False
        Options.Moving = False
        Options.TabStop = False
        Properties.Caption = #1040#1076#1088#1077#1089
        Properties.EditPropertiesClassName = 'TcxLabelProperties'
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Options.Filtering = False
        Properties.Options.IncSearch = False
        Properties.Value = Null
      end
      object rowWork: TcxEditorRow
        Options.CanAutoHeight = False
        Options.CanResized = False
        Options.Focusing = False
        Options.Moving = False
        Options.TabStop = False
        Properties.Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Options.Filtering = False
        Properties.Options.IncSearch = False
        Properties.Value = Null
      end
      object rowKoren: TcxEditorRow
        Options.CanResized = False
        Properties.Caption = #1050#1086#1088#1077#1085#1085#1086#1077' '#1085#1072#1089#1077#1083#1077#1085#1080#1077
        Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.EditProperties.DropDownListStyle = lsFixedList
        Properties.EditProperties.DropDownSizeable = True
        Properties.EditProperties.GridMode = True
        Properties.EditProperties.ImmediatePost = True
        Properties.EditProperties.KeyFieldNames = 'FK_ID'
        Properties.EditProperties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.EditProperties.ListOptions.ShowHeader = False
        Properties.EditProperties.ListSource = dsKorennoe
        Properties.EditProperties.PostPopupValueOnTab = True
        Properties.EditProperties.OnChange = rowKorenEditPropertiesChange
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.ShowEditButtons = eisbAlways
        Properties.Value = Null
      end
      object rowTypeOpl: TcxEditorRow
        Options.CanResized = False
        Properties.Caption = #1057#1087#1086#1089#1086#1073' '#1086#1087#1083#1072#1090#1099
        Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.EditProperties.DropDownListStyle = lsFixedList
        Properties.EditProperties.DropDownSizeable = True
        Properties.EditProperties.GridMode = True
        Properties.EditProperties.ImmediatePost = True
        Properties.EditProperties.KeyFieldNames = 'FK_ID'
        Properties.EditProperties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.EditProperties.ListOptions.ShowHeader = False
        Properties.EditProperties.ListSource = dsVidOplat
        Properties.EditProperties.PostPopupValueOnTab = True
        Properties.EditProperties.OnChange = rowTypeOplEditPropertiesChange
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.ShowEditButtons = eisbAlways
        Properties.Value = Null
      end
      object rowCompany: TcxEditorRow
        Properties.Caption = #1050#1086#1084#1087#1072#1085#1080#1103' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091
        Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
        Properties.EditProperties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.EditProperties.ClickKey = 13
        Properties.EditProperties.ViewStyle = vsHideCursor
        Properties.EditProperties.OnButtonClick = rowCompanyEditPropertiesButtonClick
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.ShowEditButtons = eisbAlways
        Properties.Value = Null
        Visible = False
      end
      object rowProj: TcxEditorRow
        Options.CanResized = False
        Properties.Caption = #1055#1088#1086#1078#1080#1074#1072#1077#1090
        Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.EditProperties.DropDownListStyle = lsFixedList
        Properties.EditProperties.DropDownSizeable = True
        Properties.EditProperties.GridMode = True
        Properties.EditProperties.ImmediatePost = True
        Properties.EditProperties.KeyFieldNames = 'FK_ID'
        Properties.EditProperties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.EditProperties.ListOptions.ShowHeader = False
        Properties.EditProperties.ListSource = dsRegPrin
        Properties.EditProperties.OnChange = rowProjEditPropertiesChange
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.ShowEditButtons = eisbAlways
        Properties.Value = Null
      end
      object rowOtdel: TcxEditorRow
        Options.Focusing = False
        Options.Moving = False
        Options.TabStop = False
        Properties.Caption = #1054#1090#1076#1077#1083#1077#1085#1080#1077'/'#1074#1088#1072#1095
        Properties.EditPropertiesClassName = 'TcxLabelProperties'
        Properties.DataBinding.ValueType = 'String'
        Properties.Value = Null
      end
      object rowKem: TcxEditorRow
        Options.CanResized = False
        Properties.Caption = #1053#1072#1087#1088#1072#1074#1080#1074#1096#1077#1077' '#1091#1095#1088#1077#1078#1076#1077#1085#1080#1077
        Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
        Properties.EditProperties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.EditProperties.ViewStyle = vsHideCursor
        Properties.EditProperties.OnButtonClick = rowKemEditPropertiesButtonClick
        Properties.EditProperties.OnChange = rowKemEditPropertiesChange
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.ShowEditButtons = eisbAlways
        Properties.Value = Null
      end
      object catIssl: TcxCategoryRow
        Options.CanResized = False
        Options.Focusing = False
        Options.TabStop = False
        Properties.Caption = #1044#1072#1085#1085#1099#1077' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
      end
      object rowNum: TcxEditorRow
        Options.CanResized = False
        Properties.Caption = #8470' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
        Properties.EditPropertiesClassName = 'TcxTextEditProperties'
        Properties.DataBinding.ValueType = 'String'
        Properties.Value = ''
      end
      object rowName: TcxEditorRow
        Options.CanResized = False
        Options.Focusing = False
        Options.Moving = False
        Options.TabStop = False
        Properties.Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
        Properties.EditPropertiesClassName = 'TcxLabelProperties'
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Options.Filtering = False
        Properties.Options.IncSearch = False
        Properties.Value = Null
        Styles.Header = stIssl
        Styles.Content = stIssl
      end
      object merUrgDate: TcxMultiEditorRow
        Properties.Editors = <
          item
            Caption = #1057#1088#1086#1095#1085#1086#1089#1090#1100
            EditPropertiesClassName = 'TcxLookupComboBoxProperties'
            EditProperties.DropDownListStyle = lsFixedList
            EditProperties.DropDownSizeable = True
            EditProperties.GridMode = True
            EditProperties.ImmediatePost = True
            EditProperties.KeyFieldNames = 'FK_ID'
            EditProperties.ListColumns = <
              item
                FieldName = 'FC_NAME'
              end>
            EditProperties.ListOptions.ShowHeader = False
            EditProperties.ListSource = dsUrgent
            EditProperties.PostPopupValueOnTab = True
            DataBinding.ValueType = 'String'
            Options.ShowEditButtons = eisbAlways
            Value = Null
          end>
      end
      object merDateTimeIn: TcxMultiEditorRow
        Options.CanResized = False
        Options.Moving = False
        Properties.Editors = <
          item
            Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
            EditPropertiesClassName = 'TcxDateEditProperties'
            EditProperties.DateButtons = [btnToday]
            EditProperties.ImmediatePost = True
            EditProperties.PostPopupValueOnTab = True
            EditProperties.SaveTime = False
            EditProperties.ShowTime = False
            Width = 150
            DataBinding.ValueType = 'DateTime'
            Options.ShowEditButtons = eisbAlways
            Value = 0d
          end
          item
            Caption = #1042#1088#1077#1084#1103
            EditPropertiesClassName = 'TcxTimeEditProperties'
            EditProperties.ImmediatePost = True
            EditProperties.TimeFormat = tfHourMin
            DataBinding.ValueType = 'DateTime'
            Options.ShowEditButtons = eisbAlways
            Value = Null
          end>
      end
    end
    object cxButton1: TcxButton
      Left = 649
      Top = 731
      Width = 75
      Height = 26
      Action = aSave
      Anchors = [akLeft, akBottom]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
      ExplicitTop = 603
    end
    object cxButton3: TcxButton
      Left = 730
      Top = 731
      Width = 75
      Height = 26
      Action = aCancel
      Anchors = [akLeft, akBottom]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
      ExplicitTop = 603
    end
    object cxVerticalGrid1: TcxVerticalGrid
      AlignWithMargins = True
      Left = 3
      Top = 581
      Width = 802
      Height = 145
      Margins.Bottom = 0
      BorderStyle = cxcbsNone
      Align = alTop
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
      OptionsView.RowHeaderWidth = 137
      TabOrder = 3
      ExplicitTop = 455
      object rowDs: TcxEditorRow
        Properties.Caption = #1044#1080#1072#1075#1085#1086#1079
        Properties.EditPropertiesClassName = 'TcxMemoProperties'
        Properties.EditProperties.ScrollBars = ssVertical
        Properties.EditProperties.VisibleLineCount = 3
        Properties.EditProperties.OnChange = rowDsEditPropertiesChange
        Properties.DataBinding.ValueType = 'String'
        Properties.Value = Null
      end
      object rowMacro: TcxEditorRow
        Properties.Caption = #1052#1072#1082#1088#1086#1086#1087#1080#1089#1072#1085#1080#1077
        Properties.EditPropertiesClassName = 'TcxMemoProperties'
        Properties.EditProperties.ScrollBars = ssVertical
        Properties.EditProperties.VisibleLineCount = 3
        Properties.EditProperties.OnChange = rowMacroEditPropertiesChange
        Properties.DataBinding.ValueType = 'String'
        Properties.Value = Null
      end
      object catPodpis: TcxCategoryRow
        Properties.Caption = #1055#1086#1076#1087#1080#1089#1080
      end
      object merDateTime: TcxMultiEditorRow
        Properties.Editors = <
          item
            Caption = #1044#1072#1090#1072
            EditPropertiesClassName = 'TcxDateEditProperties'
            EditProperties.ImmediatePost = True
            EditProperties.PostPopupValueOnTab = True
            EditProperties.SaveTime = False
            EditProperties.ShowTime = False
            DataBinding.ValueType = 'DateTime'
            Value = 0d
          end
          item
            Caption = #1042#1088#1077#1084#1103
            EditPropertiesClassName = 'TcxTimeEditProperties'
            EditProperties.ImmediatePost = True
            EditProperties.TimeFormat = tfHourMin
            DataBinding.ValueType = 'DateTime'
            Value = 0d
          end>
      end
      object rowLaborant: TcxEditorRow
        Properties.Caption = #1051#1072#1073#1086#1088#1072#1085#1090
        Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.EditProperties.DropDownListStyle = lsFixedList
        Properties.EditProperties.DropDownSizeable = True
        Properties.EditProperties.GridMode = True
        Properties.EditProperties.ImmediatePost = True
        Properties.EditProperties.KeyFieldNames = 'FK_ID'
        Properties.EditProperties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.EditProperties.ListOptions.ShowHeader = False
        Properties.EditProperties.ListSource = dsLaborant
        Properties.EditProperties.PostPopupValueOnTab = True
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.ShowEditButtons = eisbAlways
        Properties.Value = Null
      end
    end
    object grList: TcxGrid
      AlignWithMargins = True
      Left = 3
      Top = 326
      Width = 802
      Height = 126
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      PopupMenu = pmTV
      TabOrder = 4
      LookAndFeel.Kind = lfFlat
      object TVLIST: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataModeController.GridMode = True
        DataController.DataSource = dsList
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.DragScrolling = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object VNUMROW: TcxGridDBColumn
          Caption = #8470' '#1087'/'#1087
          DataBinding.FieldName = 'ROWNUM'
          Options.Editing = False
          Width = 60
        end
        object VKOLVO: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086' '#1092#1088'.'
          DataBinding.FieldName = 'KOLVOFR'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.MaskKind = emkRegExprEx
          Properties.MaxLength = 5
          Options.ShowEditButtons = isebAlways
          Width = 65
        end
        object VCHAR: TcxGridDBColumn
          Caption = #1061#1072#1088#1072#1082#1090#1077#1088' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
          DataBinding.FieldName = 'CHAROBJ'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                9A020000424D9A020000000000009A0100002800000010000000100000000100
                08000000000000010000120B0000120B0000590000005900000000000000FFFF
                FF00FF00FF005676FF005A79FF006582FF007690FF007F98FF00839CFF00193F
                FF002146FF002449FF00284CFF002D51FF003559FF004163FF004668FF004A6B
                FF004E6EFF005877FF006783FF00728CFF00082CFF000A2EFF000C30FF000D31
                FF000E33FF000F35FF001338FF00163BFF001B40FF00001FFF00001FFB00001F
                F800001FF600001EF000001DEE00001DEB00001CE900001CE600001CE300001C
                E100001CDE00001BD900001BD700001AD400001AD1000019CF000019CC000018
                CA000018C7000018C5000018C2000018C0000017BD000017BB000017B8000016
                B6000016B4000016B1000016AF000015AC000015AA000015A7000014A5000014
                A3000013A00000139E0000139C00001399000013970000118700000F7B00000F
                7900000D6C00000D6A00000D6800000C5D00000B5900000A5300000A5100000A
                4F00000840000121FF000224FF000325FF000427FF000528FF000629FF000202
                020202020202020202020202020202024A4C4D4F515151515151515202020246
                373A3E42454646454546434852020238282D3033373B3C3C3C3C394351020232
                23292E3235393C3E3F403C45500202315422282D3134373B3E3F3C4551020231
                1D5822282C2F32363A3D3C45510202310E1B5301010101010138394450020231
                1209560101010101013435414E020231040A1653232425292B2F303B4B020231
                140D1C19551F2124272A2B3649020231060F1E1D1857561F2326273247020231
                071503100E0B1D572123232B450202311307080605110C1A5321202840020202
                241718175853242A2E302F38020202020202020202020202020202020202}
              Kind = bkGlyph
            end>
          Properties.ClickKey = 13
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = VCHARPropertiesButtonClick
          Options.ShowEditButtons = isebAlways
          Width = 300
        end
        object VOSOB: TcxGridDBColumn
          Caption = #1054#1089#1086#1073#1077#1085#1085#1086#1089#1090#1080
          DataBinding.FieldName = 'OSOB'
          PropertiesClassName = 'TcxTextEditProperties'
          Options.ShowEditButtons = isebAlways
          Width = 363
        end
        object VOSOB_NT: TcxGridDBColumn
          Caption = #1054#1089#1086#1073#1077#1085#1085#1086#1089#1090#1080
          DataBinding.FieldName = 'OSOB'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                9A020000424D9A020000000000009A0100002800000010000000100000000100
                08000000000000010000120B0000120B0000590000005900000000000000FFFF
                FF00FF00FF005676FF005A79FF006582FF007690FF007F98FF00839CFF00193F
                FF002146FF002449FF00284CFF002D51FF003559FF004163FF004668FF004A6B
                FF004E6EFF005877FF006783FF00728CFF00082CFF000A2EFF000C30FF000D31
                FF000E33FF000F35FF001338FF00163BFF001B40FF00001FFF00001FFB00001F
                F800001FF600001EF000001DEE00001DEB00001CE900001CE600001CE300001C
                E100001CDE00001BD900001BD700001AD400001AD1000019CF000019CC000018
                CA000018C7000018C5000018C2000018C0000017BD000017BB000017B8000016
                B6000016B4000016B1000016AF000015AC000015AA000015A7000014A5000014
                A3000013A00000139E0000139C00001399000013970000118700000F7B00000F
                7900000D6C00000D6A00000D6800000C5D00000B5900000A5300000A5100000A
                4F00000840000121FF000224FF000325FF000427FF000528FF000629FF000202
                020202020202020202020202020202024A4C4D4F515151515151515202020246
                373A3E42454646454546434852020238282D3033373B3C3C3C3C394351020232
                23292E3235393C3E3F403C45500202315422282D3134373B3E3F3C4551020231
                1D5822282C2F32363A3D3C45510202310E1B5301010101010138394450020231
                1209560101010101013435414E020231040A1653232425292B2F303B4B020231
                140D1C19551F2124272A2B3649020231060F1E1D1857561F2326273247020231
                071503100E0B1D572123232B450202311307080605110C1A5321202840020202
                241718175853242A2E302F38020202020202020202020202020202020202}
              Kind = bkGlyph
            end>
          Properties.ClickKey = 13
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = VOSOB_NTPropertiesButtonClick
          Options.ShowEditButtons = isebAlways
        end
        object VNUMGLASS: TcxGridDBColumn
          Caption = #8470' '#1089#1090#1077#1082#1083#1072
          DataBinding.FieldName = 'NUMGLASS'
          PropertiesClassName = 'TcxTextEditProperties'
        end
      end
      object grListLevel1: TcxGridLevel
        GridView = TVLIST
      end
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 302
      Width = 802
      Height = 24
      Margins.Bottom = 0
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 5
      object cxLabel1: TcxLabel
        Left = 4
        Top = 3
        Caption = #1052#1072#1088#1082#1080#1088#1086#1074#1082#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074' '#1080' '#1095#1080#1089#1083#1086' '#1086#1073#1098#1077#1082#1090#1086#1074
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
    end
    object grPMU: TcxGrid
      Left = 0
      Top = 452
      Width = 808
      Height = 126
      Align = alTop
      TabOrder = 6
      ExplicitLeft = 7
      ExplicitTop = 477
      object grdbtvPMU: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
      end
      object grlPMU: TcxGridLevel
        GridView = grdbtvPMU
      end
    end
  end
  object al: TActionList
    Left = 600
    Top = 82
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 0
      ShortCut = 113
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ImageIndex = 1
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object odsVidOplat: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER, FC_SYNONIM '
      '  FROM ASU.TSMID'
      ' WHERE LEVEL <> 1'
      'START WITH FC_SYNONIM = '#39'AMBTALON_OPL'#39
      'CONNECT BY PRIOR FK_ID = FK_OWNER'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F524445520100000000000A0000004643
      5F53594E4F4E494D010000000000}
    Session = frmMain.os
    Left = 1024
    Top = 48
  end
  object dsVidOplat: TDataSource
    DataSet = odsVidOplat
    Left = 1061
    Top = 48
  end
  object odsRegPrin: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FC_SYNONIM, FK_OWNER, FN_ORDER, FL_DEL  '
      '  FROM TSMID '
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'P' +
        'D_MZ'#39')'
      '   AND FL_SHOWPRINT = 1 '
      '   AND FL_DEL = 0'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FC_SYNONIM, FK_OWNER, FN_ORDER, FL_DEL  '
      '  FROM TSMID '
      ' WHERE FC_SYNONIM = '#39'LIVEIN_SELO'#39
      '   AND FL_SHOWPRINT = 1 '
      '   AND FL_DEL = 0'
      ''
      'ORDER BY FN_ORDER   ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000600000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F53594E4F4E494D01000000000008000000
      464B5F4F574E455201000000000008000000464E5F4F52444552010000000000
      06000000464C5F44454C010000000000}
    Session = frmMain.os
    Left = 1016
    Top = 129
  end
  object dsRegPrin: TDataSource
    DataSet = odsRegPrin
    Left = 1058
    Top = 131
  end
  object dsKorennoe: TDataSource
    DataSet = odsKorennoe
    Left = 1058
    Top = 83
  end
  object odsKorennoe: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER '
      '  FROM TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'K' +
        'OREN_NASEL'#39')'
      '   AND FL_SHOWPRINT = 1'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Left = 1025
    Top = 85
  end
  object odsLaborant: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_FAM, FC_FAM || '#39' '#39' || '
      
        '       DECODE(ASU.VarcharIsNUll(FC_NAME), 1, '#39#39', SUBSTR(FC_NAME,' +
        ' 0, 1) || '#39'. '#39' || '
      
        '       DECODE (ASU.VarcharIsNUll(FC_OTCH), 1, '#39#39', SUBSTR(FC_OTCH' +
        ', 0, 1) || '#39'. '#39')) AS FC_NAME'
      ' FROM ASU.TSOTR '
      ' WHERE FK_OTDELID = :PFK_OTDELID'
      '   AND FL_DEL = 0'
      'ORDER BY FC_FAM'
      '')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A50464B5F4F5444454C49440300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000046435F4E414D4501000000000005000000464B5F
      49440100000000000600000046435F46414D010000000000}
    Session = frmMain.os
    BeforeOpen = odsLaborantBeforeOpen
    Left = 1020
    Top = 180
  end
  object dsLaborant: TDataSource
    DataSet = odsLaborant
    Left = 1055
    Top = 180
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 520
    Top = 88
    PixelsPerInch = 96
    object stFIO: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Book Antiqua'
      Font.Style = [fsBold]
    end
    object stIssl: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
  end
  object odsUrgent: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER '
      '  FROM TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'N' +
        'AZN_TYPES'#39')'
      '   AND FL_SHOWPRINT = 1'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Left = 1018
    Top = 226
  end
  object dsUrgent: TDataSource
    DataSet = odsUrgent
    Left = 1050
    Top = 227
  end
  object odsOrgan: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER, FC_SYNONIM '
      '  FROM ASU.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'ORGAN_PATANATOM'#39')'
      '   AND FL_SHOWPRINT = 1'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F524445520100000000000A0000004643
      5F53594E4F4E494D010000000000}
    Session = frmMain.os
    Left = 920
    Top = 144
  end
  object dsOrgan: TDataSource
    DataSet = odsOrgan
    Left = 957
    Top = 144
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 168
    Top = 272
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'select rownum, t.* from ('
      'select '#39#39' as numglass,'
      '       (select fn_num '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK1_KOLVOFR'#39')) as kolvofr,'
      
        '       (select asu.get_smidname(fk_smid)||decode(fc_char, null, ' +
        #39#39', '#39'; '#39'||fc_char)'
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'ORGAN_PATANATOM'#39' connect by prior fk_id = fk_own' +
        'er)'
      
        '           and fk_smeditid = (select fk_id from asu.tsmid where ' +
        'fc_synonim = '#39'MARK1_CHAR'#39')) as charobj,'
      '       (select fc_char '
      '          from asu.tib'
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK1_OSOB'#39')) as osob '
      '  from dual'
      'union all'
      'select '#39#39' as numglass,'
      '       (select fn_num '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK2_KOLVOFR'#39')) as kolvofr,'
      
        '       (select asu.get_smidname(fk_smid)||decode(fc_char, null, ' +
        #39#39', '#39'; '#39'||fc_char) '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'ORGAN_PATANATOM'#39' connect by prior fk_id = fk_own' +
        'er)'
      
        '           and fk_smeditid = (select fk_id from asu.tsmid where ' +
        'fc_synonim = '#39'MARK2_CHAR'#39')) as charobj,'
      '       (select fc_char '
      '          from asu.tib'
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK2_OSOB'#39')) as osob'
      '  from dual'
      'union all'
      'select '#39#39' as numglass,'
      '       (select fn_num '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK3_KOLVOFR'#39')) as kolvofr,'
      
        '       (select asu.get_smidname(fk_smid)||decode(fc_char, null, ' +
        #39#39', '#39'; '#39'||fc_char) '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'ORGAN_PATANATOM'#39' connect by prior fk_id = fk_own' +
        'er)'
      
        '           and fk_smeditid = (select fk_id from asu.tsmid where ' +
        'fc_synonim = '#39'MARK3_CHAR'#39')) as charobj,'
      '       (select fc_char '
      '          from asu.tib'
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK3_OSOB'#39')) as osob'
      '  from dual'
      'union all'
      'select '#39#39' as numglass,'
      '       (select fn_num '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK4_KOLVOFR'#39')) as kolvofr,'
      
        '       (select asu.get_smidname(fk_smid)||decode(fc_char, null, ' +
        #39#39', '#39'; '#39'||fc_char)'
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'ORGAN_PATANATOM'#39' connect by prior fk_id = fk_own' +
        'er)'
      
        '           and fk_smeditid = (select fk_id from asu.tsmid where ' +
        'fc_synonim = '#39'MARK4_CHAR'#39')) as charobj,'
      '       (select fc_char '
      '          from asu.tib'
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK4_OSOB'#39')) as osob'
      '  from dual'
      'union all'
      'select '#39#39' as numglass,'
      '       (select fn_num '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK5_KOLVOFR'#39')) as kolvofr,'
      
        '       (select asu.get_smidname(fk_smid)||decode(fc_char, null, ' +
        #39#39', '#39'; '#39'||fc_char) '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'ORGAN_PATANATOM'#39' connect by prior fk_id = fk_own' +
        'er)'
      
        '           and fk_smeditid = (select fk_id from asu.tsmid where ' +
        'fc_synonim = '#39'MARK5_CHAR'#39')) as charobj,'
      '       (select fc_char '
      '          from asu.tib'
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK5_OSOB'#39')) as osob '
      '  from dual) t'
      '  '
      '            ')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A50464B5F504143494403000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000006000000524F574E554D010000000000070000004B4F4C56
      4F465201000000000007000000434841524F424A010000000000040000004F53
      4F42010000000000080000004E554D474C415353010000000000}
    LockingMode = lmNone
    OnApplyRecord = odsListApplyRecord
    Session = frmMain.os
    BeforeOpen = odsListBeforeOpen
    Left = 200
    Top = 272
  end
  object pmTV: TPopupMenu
    Left = 512
    Top = 170
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
  end
  object odsListNT: TOracleDataSet
    SQL.Strings = (
      'select rownum, t.* from ('
      'select (select fc_char '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK1_NUMGLASS'#39')) as numglass,'
      '       (select fn_num '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK1_KOLVOFR'#39')) as kolvofr,'
      
        '       (select asu.get_smidname(fk_smid)||decode(fc_char, null, ' +
        #39#39', '#39'; '#39'||fc_char) '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'ORGAN_PATANATOM'#39' connect by prior fk_id = fk_own' +
        'er)'
      
        '           and fk_smeditid = (select fk_id from asu.tsmid where ' +
        'fc_synonim = '#39'MARK1_CHAR'#39')) as charobj,'
      '       (select fc_char '
      '          from asu.tib'
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK1_OSOB'#39')) as osob '
      '  from dual'
      'union all'
      'select (select fc_char '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK2_NUMGLASS'#39')) as numglass,'
      '       (select fn_num '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK2_KOLVOFR'#39')) as kolvofr,'
      
        '       (select asu.get_smidname(fk_smid)||decode(fc_char, null, ' +
        #39#39', '#39'; '#39'||fc_char)'
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'ORGAN_PATANATOM'#39' connect by prior fk_id = fk_own' +
        'er)'
      
        '           and fk_smeditid = (select fk_id from asu.tsmid where ' +
        'fc_synonim = '#39'MARK2_CHAR'#39')) as charobj,'
      '       (select fc_char '
      '          from asu.tib'
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK2_OSOB'#39')) as osob'
      '  from dual'
      'union all'
      'select (select fc_char '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK3_NUMGLASS'#39')) as numglass,'
      '       (select fn_num '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK3_KOLVOFR'#39')) as kolvofr,'
      
        '       (select asu.get_smidname(fk_smid)||decode(fc_char, null, ' +
        #39#39', '#39'; '#39'||fc_char) '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'ORGAN_PATANATOM'#39' connect by prior fk_id = fk_own' +
        'er)'
      
        '           and fk_smeditid = (select fk_id from asu.tsmid where ' +
        'fc_synonim = '#39'MARK3_CHAR'#39')) as charobj,'
      '       (select fc_char'
      '          from asu.tib'
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK3_OSOB'#39')) as osob'
      '  from dual'
      'union all'
      'select (select fc_char '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK4_NUMGLASS'#39')) as numglass,'
      '       (select fn_num '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK4_KOLVOFR'#39')) as kolvofr,'
      
        '       (select asu.get_smidname(fk_smid)||decode(fc_char, null, ' +
        #39#39', '#39'; '#39'||fc_char)'
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'ORGAN_PATANATOM'#39' connect by prior fk_id = fk_own' +
        'er)'
      
        '           and fk_smeditid = (select fk_id from asu.tsmid where ' +
        'fc_synonim = '#39'MARK4_CHAR'#39')) as charobj,'
      '       (select fc_char'
      '          from asu.tib'
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK4_OSOB'#39')) as osob'
      '  from dual'
      'union all'
      'select (select fc_char '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK5_NUMGLASS'#39')) as numglass,'
      '       (select fn_num '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK5_KOLVOFR'#39')) as kolvofr,'
      
        '       (select asu.get_smidname(fk_smid)||decode(fc_char, null, ' +
        #39#39', '#39'; '#39'||fc_char) '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'ORGAN_PATANATOM'#39' connect by prior fk_id = fk_own' +
        'er)'
      
        '           and fk_smeditid = (select fk_id from asu.tsmid where ' +
        'fc_synonim = '#39'MARK5_CHAR'#39')) as charobj,'
      '       (select fc_char'
      '          from asu.tib'
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK5_OSOB'#39')) as osob '
      '  from dual'
      'union all'
      'select (select fc_char '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK6_NUMGLASS'#39')) as numglass,'
      '       (select fn_num '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK6_KOLVOFR'#39')) as kolvofr,'
      
        '       (select asu.get_smidname(fk_smid)||decode(fc_char, null, ' +
        #39#39', '#39'; '#39'||fc_char) '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'ORGAN_PATANATOM'#39' connect by prior fk_id = fk_own' +
        'er)'
      
        '           and fk_smeditid = (select fk_id from asu.tsmid where ' +
        'fc_synonim = '#39'MARK6_CHAR'#39')) as charobj,'
      '       (select fc_char'
      '          from asu.tib'
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK6_OSOB'#39')) as osob '
      '  from dual'
      'union all'
      'select (select fc_char '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK7_NUMGLASS'#39')) as numglass,'
      '       (select fn_num '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK7_KOLVOFR'#39')) as kolvofr,'
      
        '       (select asu.get_smidname(fk_smid)||decode(fc_char, null, ' +
        #39#39', '#39'; '#39'||fc_char) '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'ORGAN_PATANATOM'#39' connect by prior fk_id = fk_own' +
        'er)'
      
        '           and fk_smeditid = (select fk_id from asu.tsmid where ' +
        'fc_synonim = '#39'MARK7_CHAR'#39')) as charobj,'
      '       (select fc_char'
      '          from asu.tib'
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK7_OSOB'#39')) as osob '
      '  from dual'
      'union all'
      'select (select fc_char '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK8_NUMGLASS'#39')) as numglass,'
      '       (select fn_num '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK8_KOLVOFR'#39')) as kolvofr,'
      
        '       (select asu.get_smidname(fk_smid)||decode(fc_char, null, ' +
        #39#39', '#39'; '#39'||fc_char) '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'ORGAN_PATANATOM'#39' connect by prior fk_id = fk_own' +
        'er)'
      
        '           and fk_smeditid = (select fk_id from asu.tsmid where ' +
        'fc_synonim = '#39'MARK8_CHAR'#39')) as charobj,'
      '       (select fc_char'
      '          from asu.tib'
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK8_OSOB'#39')) as osob '
      '  from dual'
      'union all'
      'select (select fc_char '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK9_NUMGLASS'#39')) as numglass,'
      '       (select fn_num '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK9_KOLVOFR'#39')) as kolvofr,'
      
        '       (select asu.get_smidname(fk_smid)||decode(fc_char, null, ' +
        #39#39', '#39'; '#39'||fc_char) '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'ORGAN_PATANATOM'#39' connect by prior fk_id = fk_own' +
        'er)'
      
        '           and fk_smeditid = (select fk_id from asu.tsmid where ' +
        'fc_synonim = '#39'MARK9_CHAR'#39')) as charobj,'
      '       (select fc_char'
      '          from asu.tib'
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK9_OSOB'#39')) as osob '
      '  from dual'
      'union all'
      'select (select fc_char '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK10_NUMGLASS'#39')) as numglass,'
      '       (select fn_num '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK10_KOLVOFR'#39')) as kolvofr,'
      
        '       (select asu.get_smidname(fk_smid)||decode(fc_char, null, ' +
        #39#39', '#39'; '#39'||fc_char) '
      '          from asu.tib '
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid in (select fk_id from asu.tsmid start wit' +
        'h fc_synonim = '#39'ORGAN_PATANATOM'#39' connect by prior fk_id = fk_own' +
        'er)'
      
        '           and fk_smeditid = (select fk_id from asu.tsmid where ' +
        'fc_synonim = '#39'MARK10_CHAR'#39')) as charobj,'
      '       (select fc_char'
      '          from asu.tib'
      '         where fk_pacid = :pfk_pacid'
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'MARK10_OSOB'#39')) as osob '
      '  from dual) t  '
      '            ')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A50464B5F504143494403000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000006000000524F574E554D010000000000070000004B4F4C56
      4F465201000000000007000000434841524F424A010000000000040000004F53
      4F42010000000000}
    LockingMode = lmNone
    OnApplyRecord = odsListApplyRecord
    Session = frmMain.os
    BeforeOpen = odsListBeforeOpen
    Left = 200
    Top = 376
  end
  object odsIsI_PATGIST_ENDO: TOracleDataSet
    SQL.Strings = (
      
        'select count(1) cnt from asu.tsmid where fk_id = :pid connect by' +
        ' prior fk_id = fk_owner start with fc_synonim = '#39'I_PATGIST_ENDO'#39)
    Optimize = False
    Variables.Data = {0300000001000000040000003A504944030000000000000000000000}
    Session = frmMain.os
    Left = 328
    Top = 328
  end
  object oqUpdateTIB: TOracleQuery
    SQL.Strings = (
      'DECLARE'
      '  pPacid NUMBER;'
      '  PSYNONIM VARCHAR2(100);'
      '  PSYNONIM_CH VARCHAR2(100);'
      '  PSYNONIM2 VARCHAR2(100);'
      '  pibid NUMBER;'
      '  pibid_ch NUMBER;'
      '  CURSOR cCheck(syn varchar2) IS'
      
        '   SELECT fk_id FROM asu.tib i WHERE i.fk_pacid = pPacid AND i.f' +
        'k_smid IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = syn);'
      '  CURSOR cVal IS'
      
        '   SELECT i.fc_char,i.fn_num FROM asu.tib i WHERE i.fk_pacid = p' +
        'Pacid AND i.fk_smid IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYN' +
        'ONIM = PSYNONIM2);'
      'BEGIN'
      '  pPacid := :pacid;'
      '  FOR c IN 1..5 LOOP'
      '    PSYNONIM := '#39'MARK'#39'||to_char(c)||'#39'_KOLVOFR'#39';'
      '    PSYNONIM_CH := '#39'MARK'#39'||to_char(c)||'#39'_OSOB'#39';'
      '    PSYNONIM2 := '#39'IPE_FRACTION'#39'||to_char(c);'
      '    OPEN cCheck(PSYNONIM);'
      '    FETCH cCheck INTO pibid;'
      '    IF cCheck%NOTFOUND THEN'
      '      pibid := -1;'
      '    END IF;'
      '    CLOSE cCheck;'
      '    OPEN cCheck(PSYNONIM_CH);'
      '    FETCH cCheck INTO pibid_ch;'
      '    IF cCheck%NOTFOUND THEN'
      '      pibid_ch := -1;'
      '    END IF;'
      '    CLOSE cCheck;'
      '    IF pibid = -1 or pibid_ch = -1 THEN'
      '      FOR i IN cVal LOOP'
      '        if pibid = -1 then'
      '          INSERT INTO asu.tib'
      '          (FK_PACID, fn_num, FK_SMID, FK_SMEDITID, FK_VRACHID)'
      '          VALUES'
      '          (PPACID, i.fn_num,'
      
        '          (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = PSYNON' +
        'IM),'
      
        '          (SELECT FK_OWNER FROM ASU.TSMID WHERE FC_SYNONIM = PSY' +
        'NONIM),'
      '          :PFK_VRACHID);'
      '        end if;'
      '        if pibid_ch = -1 then'
      '          INSERT INTO asu.tib'
      '          (FK_PACID,  FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID)'
      '          VALUES'
      '          (PPACID, i.fc_char,'
      
        '          (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = PSYNON' +
        'IM_CH),'
      
        '          (SELECT FK_OWNER FROM ASU.TSMID WHERE FC_SYNONIM = PSY' +
        'NONIM_CH),'
      '          :PFK_VRACHID);'
      '        end if;'
      '      END LOOP;'
      '    END IF;'
      '  END LOOP;'
      'END;'
      '')
    Session = frmMain.os
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A50414349440300000000000000000000000C00
      00003A50464B5F56524143484944030000000000000000000000}
    Left = 392
    Top = 320
  end
  object odsPMU: TOracleDataSet
    SQL.Strings = (
      'select * from asu.t')
    Optimize = False
    Left = 392
    Top = 480
  end
  object dsPMU: TDataSource
    DataSet = odsPMU
    Left = 352
    Top = 480
  end
end
