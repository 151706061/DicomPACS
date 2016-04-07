object frmMoveEdit: TfrmMoveEdit
  Left = 357
  Top = 54
  HelpContext = 29
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1088#1072#1089#1093#1086#1076#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  ClientHeight = 711
  ClientWidth = 534
  Color = clBtnFace
  Constraints.MinHeight = 315
  Constraints.MinWidth = 550
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'StMedsestra.chm'
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel
    Left = 98
    Top = 190
    Width = 36
    Height = 13
    Caption = 'C '#1082#1086#1075#1086':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Splitter1: TSplitter
    Left = 0
    Top = 563
    Width = 534
    Height = 5
    Cursor = crVSplit
    Align = alTop
    Visible = False
    ExplicitTop = 546
    ExplicitWidth = 542
  end
  object CoolBar2: TCoolBar
    Left = 0
    Top = 0
    Width = 534
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 40
        Width = 532
      end>
    EdgeBorders = [ebTop, ebBottom]
    object ToolBar2: TToolBar
      Left = 9
      Top = 0
      Width = 525
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 60
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ShowCaptions = True
      TabOrder = 0
      object ToolButton3: TToolButton
        Left = 0
        Top = 0
        Action = acenter
        AutoSize = True
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton4: TToolButton
        Left = 64
        Top = 0
        Action = acesc
        AutoSize = True
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object paDocHeader: TPanel
    Left = 0
    Top = 44
    Width = 534
    Height = 170
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 36
      Top = 20
      Width = 94
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072':'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 98
      Top = 49
      Width = 29
      Height = 13
      Caption = #1044#1072#1090#1072':'
    end
    object Label3: TLabel
      Left = 70
      Top = 110
      Width = 61
      Height = 13
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082':'
    end
    object Label4: TLabel
      Left = 102
      Top = 140
      Width = 29
      Height = 13
      Caption = #1050#1086#1084#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 72
      Top = 82
      Width = 58
      Height = 13
      Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TEdit
      Left = 138
      Top = 14
      Width = 139
      Height = 21
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 534
      Height = 170
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        534
        170)
      object Label7: TLabel
        Left = 28
        Top = 29
        Width = 96
        Height = 13
        Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080':'
      end
      object laFrom: TLabel
        Left = 83
        Top = 77
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = #1054#1090' '#1082#1086#1075#1086':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 52
        Top = 124
        Width = 73
        Height = 13
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080':'
      end
      object laSummByDoc: TLabel
        Left = 17
        Top = 53
        Width = 108
        Height = 13
        Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object laTo: TLabel
        Left = 96
        Top = 101
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = #1050#1086#1084#1091':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbDemand: TLabel
        Left = 207
        Top = 5
        Width = 88
        Height = 13
        Alignment = taRightJustify
        Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbFrom: TLabel
        Left = 382
        Top = 4
        Width = 14
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1086#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 449
      end
      object Label5: TLabel
        Left = 63
        Top = 6
        Width = 59
        Height = 13
        Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077':'
      end
      object laKontrakt: TLabel
        Left = 282
        Top = 51
        Width = 50
        Height = 13
        Caption = #1050#1086#1085#1090#1088#1072#1082#1090':'
        Visible = False
      end
      object laSchetFaktura: TLabel
        Left = 286
        Top = 29
        Width = 71
        Height = 13
        Caption = #1057#1095#1077#1090'-'#1092#1072#1082#1090#1091#1088#1072':'
        Visible = False
      end
      object laFinSource: TLabel
        Left = 10
        Top = 151
        Width = 114
        Height = 13
        Alignment = taRightJustify
        Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103':'
        Visible = False
      end
      object laPayCond: TLabel
        Left = 293
        Top = 151
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = #1059#1089#1083'. '#1086#1087#1083#1072#1090#1099':'
        Visible = False
      end
      object lcbMO_GROUP_TO: TcxLookupComboBox
        Left = 128
        Top = 97
        Anchors = [akLeft, akTop, akRight]
        Properties.ClearKey = 46
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            Width = 200
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.AnsiSort = True
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmMoveEdit.dsMO_GroupTo
        Properties.OnEditValueChanged = lcbMO_GROUP_TOPropertiesEditValueChanged
        Properties.OnInitPopup = lcbMO_GROUP_TOPropertiesInitPopup
        Properties.OnPopup = lcbMO_GROUP_TOPropertiesPopup
        Style.BorderStyle = ebs3D
        Style.Color = clWindow
        Style.HotTrack = True
        Style.LookAndFeel.Kind = lfStandard
        Style.ButtonStyle = bts3D
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.Kind = lfStandard
        TabOrder = 8
        OnClick = lcbMO_GROUP_TO1Click
        Width = 364
      end
      object cePriceDoc: TJvValidateEdit
        Left = 128
        Top = 49
        Width = 363
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfCurrency
        DecimalPlaces = 2
        Enabled = False
        MaxValue = 1E19
        ReadOnly = True
        TabOrder = 3
      end
      object eNumDoc: TEdit
        Left = 298
        Top = 1
        Width = 47
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object tbCalcOstDoc: TButton
        Left = 419
        Top = 121
        Width = 102
        Height = 21
        Action = acCalcOstDoc
        Anchors = [akTop, akRight]
        TabOrder = 6
      end
      object bbuSelectVidSpasanie: TBitBtn
        Left = 19
        Top = 97
        Width = 103
        Height = 21
        Action = acSelectVidSpasanie
        Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1087#1086' '#1087#1088#1080#1095#1080#1085#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        Visible = False
      end
      object lcbMO_GROUP_FROM: TDBLookupComboBox
        Left = 128
        Top = 73
        Width = 363
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        KeyField = 'FK_ID'
        ListField = 'FC_NAME'
        ListSource = dmMoveEdit.dsMO_GroupFrom
        TabOrder = 4
      end
      object deInvoiceDate: TcxDateEdit
        Left = 409
        Top = 1
        Anchors = [akTop, akRight]
        EditValue = 0d
        Properties.DateButtons = [btnToday]
        Properties.DateOnError = deToday
        Properties.InputKind = ikMask
        Properties.ShowTime = False
        Properties.OnEditValueChanged = deInvoiceDatePropertiesEditValueChanged
        Style.BorderStyle = ebs3D
        TabOrder = 1
        Width = 82
      end
      object deRegisterDate: TcxDateEdit
        Left = 128
        Top = 23
        EditValue = 0d
        Properties.DateButtons = [btnNow]
        Properties.DateOnError = deToday
        Properties.InputKind = ikMask
        Properties.Kind = ckDateTime
        Style.BorderStyle = ebs3D
        TabOrder = 2
        Width = 129
      end
      object lcbMO_TO: TDBLookupComboBox
        Left = 362
        Top = 97
        Width = 130
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Enabled = False
        KeyField = 'FK_ID'
        ListField = 'FC_NAME'
        ListSource = dmMoveEdit.dsMO_TO
        TabOrder = 7
        Visible = False
        OnClick = lcbMO_TOClick
      end
      object pnlOnPost: TPanel
        Left = 492
        Top = 1
        Width = 41
        Height = 46
        Anchors = [akTop, akRight]
        BevelInner = bvRaised
        BorderStyle = bsSingle
        TabOrder = 9
        OnMouseDown = lblOnPostMouseDown
        OnMouseUp = lblOnPostMouseUp
        object lblOnPost: TLabel
          Left = 2
          Top = 2
          Width = 33
          Height = 38
          Align = alClient
          Alignment = taCenter
          Caption = #1085#1072' '#13#10#1087#1086#1089#1090#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          OnMouseDown = lblOnPostMouseDown
          OnMouseUp = lblOnPostMouseUp
          ExplicitWidth = 34
          ExplicitHeight = 26
        end
      end
      object buPostav: TButton
        Left = 492
        Top = 73
        Width = 21
        Height = 21
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
        Anchors = [akTop, akRight]
        Caption = '...'
        TabOrder = 10
        Visible = False
        OnClick = buPostavClick
      end
      object lcbKontrakt: TcxLookupComboBox
        Left = 362
        Top = 49
        Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1082#1086#1085#1090#1088#1072#1082#1090#1077
        Anchors = [akLeft, akTop, akRight]
        Properties.DropDownListStyle = lsEditList
        Properties.KeyFieldNames = 'FC_KONTRAKT'
        Properties.ListColumns = <
          item
            FieldName = 'FC_KONTRAKT'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmMoveEdit.dsKonractsList
        Style.BorderStyle = ebs3D
        TabOrder = 11
        Visible = False
        Width = 129
      end
      object lcbSchetFaktura: TcxLookupComboBox
        Left = 362
        Top = 25
        Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1095#1077#1090'-'#1092#1072#1082#1090#1091#1088#1077
        Anchors = [akLeft, akTop, akRight]
        Properties.DropDownListStyle = lsEditList
        Properties.KeyFieldNames = 'fc_schet_faktura'
        Properties.ListColumns = <
          item
            FieldName = 'FC_SCHET_FAKTURA'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmMoveEdit.dsSchetFaktura
        Style.BorderStyle = ebs3D
        TabOrder = 12
        Visible = False
        Width = 129
      end
      object lcbFinSource: TcxLookupComboBox
        Left = 128
        Top = 149
        Properties.ClearKey = 46
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownSizeable = True
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmMain.dsTFinSource
        Properties.OnEditValueChanged = lcbFinSourcePropertiesEditValueChanged
        Style.BorderStyle = ebs3D
        TabOrder = 13
        Visible = False
        Width = 159
      end
      object lcbPayCond: TcxLookupComboBox
        Left = 362
        Top = 149
        Anchors = [akLeft, akTop, akRight]
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            Caption = #1059#1089#1083#1086#1074#1080#1103' '#1086#1087#1083#1072#1090#1099
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmMain.dsPayCond
        Style.BorderStyle = ebs3D
        TabOrder = 14
        Visible = False
        Width = 130
      end
      object lcbMO_FROM: TcxLookupComboBox
        Left = 362
        Top = 73
        Anchors = [akLeft, akTop, akRight]
        Enabled = False
        Properties.DropDownListStyle = lsFixedList
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmMoveEdit.dsMO_FROM
        Properties.OnEditValueChanged = lcbMO_FROMPropertiesEditValueChanged
        Style.BorderStyle = ebs3D
        Style.Color = clWindow
        Style.HotTrack = True
        Style.LookAndFeel.Kind = lfStandard
        Style.ButtonStyle = bts3D
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.Kind = lfStandard
        TabOrder = 15
        Visible = False
        Width = 129
      end
      object dePacDate: TcxDateEdit
        Left = 410
        Top = 97
        Hint = #1044#1072#1090#1072', '#1085#1072' '#1082#1086#1090#1086#1088#1091#1102' '#1089#1086#1073#1080#1088#1072#1077#1090#1089#1103' '#1089#1087#1080#1089#1086#1082' '#1087#1072#1094#1080#1077#1085#1090#1086#1074
        Anchors = [akTop, akRight]
        EditValue = 0d
        Properties.DateButtons = [btnToday]
        Properties.DateOnError = deToday
        Properties.InputKind = ikMask
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnEditValueChanged = dePacDatePropertiesEditValueChanged
        Style.BorderStyle = ebs3D
        TabOrder = 16
        Visible = False
        Width = 81
      end
      object buGetAutoNum: TcxButton
        Left = 348
        Top = 0
        Width = 25
        Height = 23
        Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1085#1086#1084#1077#1088' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
        Anchors = [akTop, akRight]
        TabOrder = 17
        Visible = False
        OnClick = buGetAutoNumClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FF013002014103025104025104014303013302FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF014503014503037808039C0B03
          9F0C039F0C039D0C027E09014D04014D04FF00FFFF00FFFF00FFFF00FFFF00FF
          034F0903650904A30D03A60C03A00B029E0A039F0C03A00C03A50C03A60C0269
          06013402FF00FFFF00FFFF00FF044F09066B110AAB1F07A415049E0D029D0A03
          9D0A039E0C039E0C039E0C03A00C03A70C026A06024C04FF00FFFF00FF044F09
          10AC300DAB2809A41C039E0F48C052E9F8EAD5F2D816AA20039E0C039E0C039F
          0C03A70C024C04FF00FF0357060D822317B6410EA92D05A01341BD4BF4FCF6FF
          FFFF82D58907A010039E0C039E0C039E0C03A50C037B0801420303570617A341
          18B54A11AB3441BD4EF3FBF4FCFEFC75D07D039E0C039E0C039E0C039E0C039E
          0C03A10C03960A01420306680D21B1511EB75170D392F0FBF3FFFFFFF7FCF8B7
          E9C5B4E7BDADE5B2ADE5B2AFE5B4B1E6B603A00C039F0C014A040874123EBD69
          2ABA5CBAEACCFFFFFFFFFFFFFCFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF03A00C039F0C02520506780E54C57A44C6742CBA5CA4E3BCFFFFFFFAFEFB82
          D9A03EBF5E41C05B41BF5B41BF5841BF5707A518039D0C01460306780E4CBD69
          83DDA722B6551DB24F95DEB0FFFFFFE2F7EA4FC67511AB340FAA300FAA2E0CA6
          2706A716038C0A014603FF00FF139923AAE7C568D08E16AF481CB14D8EDCABFF
          FFFFF4FCF72DB85310A9310EA7290BA42009AF1C036B0AFF00FFFF00FF139923
          56C573C5F0D866CF8C20B4521CB24F95DEB0ABE6C11FB44E13AC3C12AA340FB0
          2D0A991F036B0AFF00FFFF00FFFF00FF1399236ACC88D0F4E39AE1B650C77A38
          BD672CBA5D30BB602FBC5D23BC4F11A33006620FFF00FFFF00FFFF00FFFF00FF
          FF00FF13992313992398E1B5BDEED4A7E7C490E0B178D99F49C7791B9D3D1B9D
          3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1DA43513992313
          9923139923139923138C2AFF00FFFF00FFFF00FFFF00FFFF00FF}
        LookAndFeel.Kind = lfStandard
      end
      object mComment: TcxLookupComboBox
        Left = 128
        Top = 123
        Anchors = [akLeft, akTop, akRight]
        Properties.DropDownListStyle = lsEditList
        Properties.KeyFieldNames = 'FC_COMMENT'
        Properties.ListColumns = <
          item
            FieldName = 'FC_COMMENT'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmMoveEdit.dsComment
        Style.BorderStyle = ebs3D
        TabOrder = 18
        Width = 363
      end
    end
  end
  object grbTrebovanie: TGroupBox
    Left = 0
    Top = 214
    Width = 534
    Height = 181
    Align = alTop
    Caption = ' '#1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 2
    Visible = False
    object cxGridTreb: TcxGrid
      Left = 47
      Top = 18
      Width = 485
      Height = 161
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = False
      LookAndFeel.Kind = lfFlat
      object cxGridTrebDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        OnCellClick = cxGridTrebDBTableView1CellClick
        OnCellDblClick = cxGridTrebDBTableView1CellDblClick
        OnCustomDrawCell = cxGridTrebDBTableView1CustomDrawCell
        DataController.DataSource = dsZatrebovano
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Active = True
        DataController.KeyFieldNames = 'fk_id'
        DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        OptionsBehavior.CellHints = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.ImmediateEditor = False
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        Preview.MaxLineCount = 2
        Styles.ContentEven = dmMain.cxStyleGridDetailEvenRow
        Styles.ContentOdd = dmMain.cxStyleGridDetailOddRow
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        object cxGridTrebDBTableView1ROWNUM: TcxGridDBColumn
          Caption = #8470' '#1087'/'#1087
          DataBinding.FieldName = 'ROWNUM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          Width = 66
        end
        object cxGridTrebDBTableView1NAMEKART: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
          DataBinding.FieldName = 'NAMEKART'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          MinWidth = 50
          Options.Editing = False
          Width = 260
        end
        object cxGridTrebDBTableView1FC_INTERNATIONAL_NAME: TcxGridDBColumn
          Caption = #1052#1077#1078#1076#1091#1085#1072#1088#1086#1076#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_INTERNATIONAL_NAME'
          Visible = False
          Options.Editing = False
          Width = 150
        end
        object cxGridTrebDBTableView1FN_TREBKOL: TcxGridDBColumn
          Caption = #1047#1072#1090#1088#1077#1073#1086#1074#1072#1085#1086':'
          DataBinding.FieldName = 'FN_TREBKOL'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.DisplayFormat = '### ### ### ##0.#######'
          Width = 76
        end
        object cxGridTrebDBTableView1FN_KOL: TcxGridDBColumn
          Caption = #1054#1090#1087#1091#1097#1077#1085#1086':'
          DataBinding.FieldName = 'FN_KOL'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.DisplayFormat = '### ### ### ##0.#######'
          Properties.MaxValue = 100000000.000000000000000000
          Properties.ReadOnly = True
          MinWidth = 53
          Width = 67
        end
        object cxGridTrebDBTableView1FC_EDIZM: TcxGridDBColumn
          Caption = #1045#1076'. '#1048#1079#1084'.'
          DataBinding.FieldName = 'FC_EDIZM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Options.Editing = False
          Width = 99
        end
        object cxGridTrebDBTableView1SUMM: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072':'
          DataBinding.FieldName = 'SUMM'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.DisplayFormat = ',0.00'#1088#39'.'#39';-,0.00'#1088#39'.'#39
          Properties.Nullable = False
          Properties.ReadOnly = True
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
          Width = 106
        end
        object cxGridTrebDBTableView1ODR: TcxGridDBColumn
          DataBinding.FieldName = 'ODR'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          VisibleForCustomization = False
          Width = 54
        end
        object cxGridTrebDBTableView1FN_KOLOST: TcxGridDBColumn
          Caption = #1053#1072#1083#1080#1095#1080#1077
          DataBinding.FieldName = 'FN_KOLOST'
          PropertiesClassName = 'TcxSpinEditProperties'
          Options.Editing = False
          Width = 65
        end
        object cxGridTrebDBTableView1FC_NAZN_NAME: TcxGridDBColumn
          Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1086
          DataBinding.FieldName = 'FC_NAZN_NAME'
          Visible = False
          MinWidth = 50
          VisibleForCustomization = False
        end
        object cxGridTrebDBTableView1FN_NAZN_KOL_F: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086' ('#1092#1072#1089'.)'
          DataBinding.FieldName = 'FN_NAZN_KOL_F'
          Visible = False
          VisibleForCustomization = False
        end
        object cxGridTrebDBTableView1FC_NAZN_ED_IZM: TcxGridDBColumn
          Caption = #1053#1072#1079#1085'. '#1077#1076'. '#1080#1079#1084'.'
          DataBinding.FieldName = 'FC_NAZN_ED_IZM'
          Visible = False
          VisibleForCustomization = False
        end
        object cxGridTrebDBTableView1FK_ID: TcxGridDBColumn
          Caption = #1050#1086#1076' FK_TREBDPC'
          DataBinding.FieldName = 'FK_ID'
          Visible = False
        end
        object cxGridTrebDBTableView1FD_CREATE: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
          DataBinding.FieldName = 'FD_CREATE'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.DateButtons = []
          Properties.Kind = ckDateTime
          Properties.ReadOnly = True
          Visible = False
        end
        object cxGridTrebDBTableView1FK_CREATE_MO_ID: TcxGridDBColumn
          Caption = #1050#1090#1086' '#1089#1086#1079#1076#1072#1083
          DataBinding.FieldName = 'FK_CREATE_MO_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.IncrementalFiltering = False
          Properties.KeyFieldNames = 'MOID'
          Properties.ListColumns = <
            item
              FieldName = 'FC_NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmMain.dsMO
          Properties.ReadOnly = True
          Visible = False
        end
        object cxGridTrebDBTableView1FD_EDIT: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          DataBinding.FieldName = 'FD_EDIT'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.DateButtons = []
          Properties.Kind = ckDateTime
          Properties.ReadOnly = True
          Visible = False
        end
        object cxGridTrebDBTableView1FK_EDIT_MO_ID: TcxGridDBColumn
          Caption = #1050#1090#1086' '#1074#1085#1077#1089' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          DataBinding.FieldName = 'FK_EDIT_MO_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'MOID'
          Properties.ListColumns = <
            item
              FieldName = 'FC_NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmMain.dsMO
          Properties.ReadOnly = True
          Visible = False
        end
        object cxGridTrebDBTableView1MEDICID: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
          DataBinding.FieldName = 'MEDICID'
          Visible = False
        end
        object cxGridTrebDBTableView1FC_FPACK_EI: TcxGridDBColumn
          Caption = #1060#1072#1089'. '#1077#1076'. '#1080#1079#1084'.'
          DataBinding.FieldName = 'FC_FPACK_EI'
          Visible = False
          Options.Editing = False
          Width = 40
        end
        object cxGridTrebDBTableView1FN_MASS: TcxGridDBColumn
          Caption = #1052#1072#1089#1089#1072' '#1051#1060
          DataBinding.FieldName = 'FN_MASS'
          Visible = False
          Options.Editing = False
          Width = 30
        end
        object cxGridTrebDBTableView1FC_MASS_EI: TcxGridDBColumn
          Caption = #1045#1076'. '#1084#1072#1089#1089#1099' '#1051#1060
          DataBinding.FieldName = 'FC_MASS_EI'
          Options.Editing = False
          Width = 40
        end
      end
      object cxGridTrebLevel1: TcxGridLevel
        GridView = cxGridTrebDBTableView1
      end
    end
    object paNazn: TPanel
      Left = 2
      Top = 18
      Width = 45
      Height = 161
      Align = alLeft
      BevelOuter = bvNone
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = False
      object buTreb: TcxButton
        Left = 2
        Top = 0
        Width = 40
        Height = 25
        Hint = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077
        TabOrder = 0
        OnClick = buTrebClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00848484000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
          FF00000000000084840000848400008484000084840000848400008484000084
          84000084840000848400008484000084840000000000FF00FF00FF00FF00FF00
          FF00000000000084840000000000000000000000000000000000000000000000
          00000000000000000000000000000084840000000000FF00FF00FF00FF00FF00
          FF00000000000084840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00000000000084840000000000FF00FF00FF00FF00FF00
          FF00000000000084840000000000FFFFFF00008400000084000000840000FFFF
          FF00FFFFFF00FFFFFF00000000000084840000000000FF00FF00FF00FF00FF00
          FF00000000000084840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00000000000084840000000000FF00FF00FF00FF00FF00
          FF00000000000084840000000000FFFFFF000084000000840000008400000084
          000000840000FFFFFF00000000000084840000000000FF00FF00FF00FF00FF00
          FF00000000000084840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00000000000084840000000000FF00FF00FF00FF00FF00
          FF00000000000084840000000000FFFFFF000084000000840000008400000084
          000000840000FFFFFF00000000000084840000000000FF00FF00FF00FF00FF00
          FF00000000000084840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00000000000084840000000000FF00FF00FF00FF00FF00
          FF00000000000084840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00000000000084840000000000FF00FF00FF00FF00FF00
          FF00000000000084840000000000000000000000000000000000000000000000
          00000000000000000000000000000084840000000000FF00FF00FF00FF00FF00
          FF0000000000008484000084840000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000000000008484000084840000000000FF00FF00FF00FF00FF00
          FF000000000000848400008484000084840000000000FFFFFF00848484008484
          84000000000000848400008484000084840000000000FF00FF00FF00FF00FF00
          FF008484840000000000000000000000000000000000FFFFFF00FFFFFF00FF00
          FF0000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
          000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
      end
      object buNazn: TcxButton
        Left = 2
        Top = 32
        Width = 40
        Height = 25
        Hint = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077
        TabOrder = 1
        OnClick = buNaznClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
          0000FF00FF000000000000000000000000000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF00000000
          00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF00000000
          000000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF00000000
          0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF00000000
          000000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
          00000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFF00000000
          0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF00000000
          000000FFFF00FFFFFF0000000000000000000000000000000000000000000000
          000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
          00000000000000FFFF00FFFFFF0000FFFF00000000000000000000FFFF000000
          0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FF00FF00FF00
          FF00FF00FF000000000000000000000000000000000000FFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000000000FFFF0000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF000000000000FFFF0000000000FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF000000000000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00
          FF00000000000000FF0000000000FF00FF0000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
      end
      object buTrebAndNazn: TcxButton
        Left = 2
        Top = 62
        Width = 40
        Height = 25
        Hint = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1080' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1077
        TabOrder = 2
        OnClick = buTrebAndNaznClick
        Glyph.Data = {
          36070000424D3607000000000000360000002800000025000000100000000100
          1800000000000007000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF0000000000000000000000000000000000000000
          00000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF848484000000000000000000000000000000000000000000000000000000
          000000000000FF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000084840084840084840084
          8400848400848400848400848400848400848400848400000000000000000000
          FF00FF000000000000000000000000000000FFFFFFFFFFFF000000FFFFFF0000
          00000000FFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF000000008484000000000000000000000000000000000000000000000000
          00000000848400000000FFFF0000000000000000FFFFFFFFFF00FFFFFFFFFF00
          FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000008484000000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000848400000000FFFF00000000
          00FFFFFFFFFF00FFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFF
          FF000000FFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF000000008484000000FFFFFF008400008400008400FFFFFFFFFFFFFFFFFF
          00000000848400000000FFFF00000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00
          FFFFFFFFFF000000FFFFFF000000000000FFFFFFFFFFFF000000FF00FFFF00FF
          FF00FF000000000000FF00FFFF00FFFF00FF000000008484000000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000848400000000FFFF00000000
          00FFFFFFFFFF00FFFFFFFFFF00000000000000000000000000000000FFFF0000
          00FFFFFFFFFFFF000000FF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF
          00FF000000008484000000FFFFFF008400008400008400008400008400FFFFFF
          00000000848400000000FFFF00000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00
          FFFFFFFFFF00FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FF00FF000000
          000000000000000000000000000000FF00FF000000008484000000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000848400000000FFFF00000000
          00FFFFFFFFFF000000000000000000000000000000000000000000FFFFFFFFFF
          FFFFFFFFFFFFFF000000FF00FF000000000000000000000000000000000000FF
          00FF000000008484000000FFFFFF008400008400008400008400008400FFFFFF
          0000000084840000000000000000000000000000FFFFFFFFFF00FFFF00000000
          000000FFFF000000FFFFFFFFFFFF000000000000FFFFFF000000FF00FFFF00FF
          FF00FF000000000000FF00FFFF00FFFF00FF000000008484000000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000848400000000FF00FFFF00FF
          FF00FF00000000000000000000000000FFFF000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF
          00FF000000008484000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          00000000848400000000FF00FFFF00FFFF00FFFF00FFFF00FF00000000FFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000084840000000000000000
          0000000000000000000000000000000000000000848400000000FF00FFFF00FF
          FF00FFFF00FF00000000FFFF000000FFFFFFFFFFFF000000000000FFFFFF0000
          00FFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF000000008484008484000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          00848400848400000000FF00FFFF00FFFF00FF00000000FFFF000000000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000084840084840084840000
          00FFFFFF84848484848400000000848400848400848400000000FF00FFFF00FF
          0000000000FF000000FF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF848484000000000000000000000000FFFFFFFFFFFFFF00FF000000000000
          000000000000FF00FF00FF00FFFF00FFFF00FF000000FF00FFFF00FF00000000
          0000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
          00000000000000000000000000FF00FFFF00FFFF00FFFF00FF00}
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
      end
    end
  end
  object grbRaskhod: TGroupBox
    Left = 0
    Top = 568
    Width = 534
    Height = 124
    Align = alClient
    Caption = ' '#1056#1072#1089#1093#1086#1076' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 3
    object CoolBar1: TCoolBar
      Left = 2
      Top = 18
      Width = 530
      Height = 28
      AutoSize = True
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          MinHeight = 26
          Width = 528
        end>
      EdgeBorders = [ebTop]
      object ToolBar1: TToolBar
        Left = 9
        Top = 0
        Width = 521
        Height = 26
        Align = alClient
        AutoSize = True
        BorderWidth = 1
        ButtonHeight = 30
        ButtonWidth = 145
        Caption = 'ToolBar2'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Images = dmMain.ilMain
        List = True
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowCaptions = True
        ShowHint = True
        TabOrder = 0
        object tbuAdd: TToolButton
          Left = 0
          Top = 0
          Action = acAddByTrebDPC
          AutoSize = True
          ParentShowHint = False
          ShowHint = True
        end
        object ToolButton2: TToolButton
          Left = 81
          Top = 0
          Action = acedit
          AutoSize = True
          ParentShowHint = False
          ShowHint = True
        end
        object ToolButton5: TToolButton
          Left = 189
          Top = 0
          Action = acdel
          AutoSize = True
          ParentShowHint = False
          ShowHint = True
        end
        object ToolButton6: TToolButton
          Left = 263
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 23
          Style = tbsSeparator
        end
        object tbuAutoFillPlan: TToolButton
          Left = 271
          Top = 0
          AutoSize = True
          Caption = #1055#1083#1072#1085' '#1072#1074#1090#1086#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103
          ImageIndex = 53
          OnClick = tbuAutoFillPlanClick
        end
        object tbuAutoFill: TToolButton
          Left = 414
          Top = 0
          AutoSize = True
          Caption = #1040#1074#1090#1086#1079#1072#1087#1086#1083#1085#1077#1085#1080#1077
          ImageIndex = 2
          OnClick = tbuAutoFillClick
        end
        object tbuSepFasIE: TToolButton
          Left = 529
          Top = 0
          Width = 8
          ImageIndex = 3
          Style = tbsSeparator
          Visible = False
        end
        object chbFasEI: TcxCheckBox
          Left = 537
          Top = 4
          Hint = 
            #1056#1072#1073#1086#1090#1072' '#1089' '#1092#1072#1089#1086#1074#1086#1095#1085#1099#1084#1080' '#1077#1076#1080#1085#1080#1094#1072#1084#1080' '#1080#1079#1084#1077#1088#1077#1085#1080#1103' ('#1085#1072#1087#1088#1080#1084#1077#1088', '#1087#1086#1090#1072#1073#1083#1077#1090#1086#1095#1085#1086 +
            #1077' '#1089#1087#1080#1089#1072#1085#1080#1077')'
          Caption = #1060#1072#1089'. '#1077#1076'. '#1080#1079#1084'.'
          TabOrder = 0
          Visible = False
          OnClick = chbFasEIClick
          Width = 97
        end
        object ToolButton1: TToolButton
          Left = 634
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object tbuTemplate: TToolButton
          Left = 642
          Top = 0
          AutoSize = True
          Caption = #1064#1072#1073#1083#1086#1085#1099
          DropdownMenu = pmTemplate
          ImageIndex = 64
          Style = tbsDropDown
          Visible = False
          OnClick = tbuTemplateClick
        end
      end
    end
    object cxGridRashKart: TcxGrid
      Left = 2
      Top = 46
      Width = 530
      Height = 76
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      object cxGridRashKartDBTableView1: TcxGridDBTableView
        OnDblClick = cxGridRashKartDBTableView1DblClick
        NavigatorButtons.ConfirmDelete = False
        OnCellClick = cxGridRashKartDBTableView1CellClick
        OnCustomDrawCell = cxGridRashKartDBTableView1CustomDrawCell
        OnFocusedRecordChanged = cxGridRashKartDBTableView1FocusedRecordChanged
        DataController.DataSource = dsKart
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Active = True
        DataController.KeyFieldNames = 'DPCID'
        DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
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
            Format = #1057#1090#1088#1086#1082': 0'
            Kind = skCount
            Column = cxGridRashKartDBTableView1NAMEKART
          end
          item
            Format = '0'
            Kind = skSum
            Column = cxGridRashKartDBTableView1FN_KOL
          end
          item
            Format = '0'
            Kind = skSum
            Column = cxGridRashKartDBTableView1FN_FAS
          end>
        DataController.Summary.SummaryGroups = <>
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        OptionsBehavior.CellHints = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
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
        object cxGridRashKartDBTableView1ROWNUM: TcxGridDBColumn
          Caption = #8470' '#1087'/'#1087
          DataBinding.FieldName = 'ROWNUM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          Options.Editing = False
          Width = 31
        end
        object cxGridRashKartDBTableView1NAMEKART: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
          DataBinding.FieldName = 'NAMEKART'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 255
          Properties.ReadOnly = True
          MinWidth = 150
          Options.Editing = False
          SortIndex = 0
          SortOrder = soAscending
          Width = 174
        end
        object cxGridRashKartDBTableView1FC_INTERNATIONAL_NAME: TcxGridDBColumn
          Caption = #1052#1077#1078#1076#1091#1085#1072#1088#1086#1076#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_INTERNATIONAL_NAME'
          Visible = False
          Width = 200
        end
        object cxGridRashKartDBTableView1FC_NAME_LAT: TcxGridDBColumn
          Caption = #1051#1072#1090'. '#1085#1072#1079#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_NAME_LAT'
          Visible = False
          Options.Editing = False
        end
        object cxGridRashKartDBTableView1FN_PARTY_NUM: TcxGridDBColumn
          Caption = #8470' '#1087#1072#1088#1090#1080#1080
          DataBinding.FieldName = 'FN_PARTY_NUM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Options.Editing = False
          Width = 60
        end
        object cxGridRashKartDBTableView1FC_SERIAL: TcxGridDBColumn
          Caption = #1057#1077#1088'. '#8470
          DataBinding.FieldName = 'FC_SERIAL'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 50
          Properties.ReadOnly = True
          Options.Editing = False
          Width = 63
        end
        object cxGridRashKartDBTableView1FD_GODEN: TcxGridDBColumn
          Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080
          DataBinding.FieldName = 'FD_GODEN'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.DateButtons = []
          Properties.SaveTime = False
          Properties.ShowTime = False
          Visible = False
          Options.Editing = False
        end
        object cxGridRashKartDBTableView1FN_KOL: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086' ('#1091#1087'. '#1077#1076'. '#1080#1079#1084'.):'
          DataBinding.FieldName = 'FN_KOL'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '### ### ### ##0.#######'
          Properties.MaxValue = 100000000.000000000000000000
          Properties.ReadOnly = True
          MinWidth = 53
          Options.Editing = False
          Width = 70
        end
        object cxGridRashKartDBTableView1FK_UEI: TcxGridDBColumn
          Caption = #1045#1076'. '#1080#1079#1084'.'
          DataBinding.FieldName = 'FK_UEI'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'EIID'
          Properties.ListColumns = <
            item
              FieldName = 'FC_NAME'
            end>
          Properties.ListSource = dmMain.dsEI
          Options.Editing = False
          Width = 41
        end
        object cxGridRashKartDBTableView1FN_FAS: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086' ('#1092#1072#1089'. '#1077#1076'. '#1080#1079#1084'.)'
          DataBinding.FieldName = 'FN_FAS'
          Visible = False
          Options.Editing = False
        end
        object cxGridRashKartDBTableView1FK_FEI: TcxGridDBColumn
          Caption = #1060#1072#1089'. '#1077#1076'. '#1080#1079#1084'.'
          DataBinding.FieldName = 'FK_FEI'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'EIID'
          Properties.ListColumns = <
            item
              FieldName = 'FC_NAME'
            end>
          Properties.ListSource = dmMain.dsEI
          Visible = False
          Options.Editing = False
        end
        object cxGridRashKartDBTableView1FN_PRICE: TcxGridDBColumn
          Caption = #1062#1077#1085#1072' ('#1091#1087'. '#1077#1076'. '#1080#1079#1084'), '#1088
          DataBinding.FieldName = 'FN_PRICE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Options.Editing = False
          Width = 41
        end
        object cxGridRashKartDBTableView1SUMM: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072', '#1088
          DataBinding.FieldName = 'SUMM'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.Nullable = False
          Properties.ReadOnly = True
          Options.Editing = False
          Width = 67
        end
        object cxGridRashKartDBTableView1ODR: TcxGridDBColumn
          DataBinding.FieldName = 'ODR'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
          Width = 36
        end
        object cxGridRashKartMedLechID: TcxGridDBColumn
          Caption = #1048#1044' '#1085#1072#1079#1085#1072#1095#1077#1085#1085#1086#1075#1086' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
          DataBinding.FieldName = 'FK_NAZMEDLECHID'
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
        end
        object cxGridRashKartDBTableView1FK_TREBDPC: TcxGridDBColumn
          Caption = #1050#1086#1076' FK_TREBDPC'
          DataBinding.FieldName = 'FK_TREBDPC'
          Visible = False
          Options.Editing = False
        end
        object cxGridRashKartDBTableView1FD_DATE_SPIS: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
          DataBinding.FieldName = 'FD_DATE_SPIS'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.DateButtons = []
          Properties.ImmediatePost = True
          Properties.Kind = ckDateTime
          Visible = False
          VisibleForCustomization = False
        end
        object cxGridRashKartDBTableView1KARTID: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1087#1072#1088#1090#1080#1080
          DataBinding.FieldName = 'KARTID'
          Visible = False
          Options.Editing = False
        end
        object cxGridRashKartDBTableView1MEDICID: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
          DataBinding.FieldName = 'MEDICID'
          Visible = False
          Options.Editing = False
        end
        object cxGridRashKartDBTableView1DPCID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'DPCID'
          Visible = False
          Options.Editing = False
        end
        object cxGridRashKartDBTableView1FC_RETURN_POST: TcxGridDBColumn
          Caption = #8470' '#1089#1095#1077#1090#1072', '#1076#1072#1090#1072' '#1087#1086#1089#1090#1072#1074#1082#1080
          DataBinding.FieldName = 'FC_RETURN_POST'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          VisibleForCustomization = False
        end
        object cxGridRashKartDBTableView1FC_FINSOURCE: TcxGridDBColumn
          Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1089#1080#1088#1086#1074#1072#1085#1080#1103
          DataBinding.FieldName = 'FC_FINSOURCE'
          Visible = False
          Options.Editing = False
          Width = 65
        end
        object cxGridRashKartDBTableView1_FC_INV_NOMER: TcxGridDBColumn
          Caption = #1048#1085#1074'. '#1085#1086#1084#1077#1088
          DataBinding.FieldName = 'FC_INV_NOMER'
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
          Width = 60
        end
        object cxGridRashKartDBTableView1FC_QUOTA_CODE: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1082#1074#1086#1090#1099
          DataBinding.FieldName = 'FC_QUOTA_CODE'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.AlwaysShowBlanksAndLiterals = True
          Properties.EditMask = '00-00-00-00;0;_'
          Options.Editing = False
          Width = 65
        end
        object cxGridRashKartDBTableView1FN_NDS: TcxGridDBColumn
          Caption = #1053#1044#1057', %'
          DataBinding.FieldName = 'FN_NDS'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.DisplayFormat = ',0.###%'
          Properties.EditFormat = ',0.###'
          Properties.ImmediatePost = True
          Properties.ReadOnly = True
          Properties.SpinButtons.Visible = False
          Options.Editing = False
        end
        object cxGridRashKartDBTableView1FN_PRICE_MNF: TcxGridDBColumn
          Caption = #1062#1077#1085#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103
          DataBinding.FieldName = 'FN_PRICE_MNF'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Options.Editing = False
        end
        object cxGridRashKartDBTableView1FN_NACENKA: TcxGridDBColumn
          Caption = #1053#1072#1094#1077#1085#1082#1072', %'
          DataBinding.FieldName = 'FN_NACENKA'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.DisplayFormat = ',0.###%'
          Properties.EditFormat = ',0.###'
          Options.Editing = False
        end
        object cxGridRashKartDBTableView1FL_JNVLS: TcxGridDBColumn
          Caption = #1046#1053#1042#1051#1055
          DataBinding.FieldName = 'FL_JNVLS'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Options.Editing = False
          Width = 60
        end
        object cxGridRashKartDBTableView1FL_MIBP: TcxGridDBColumn
          Caption = #1052#1048#1041#1055
          DataBinding.FieldName = 'FL_MIBP'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Options.Editing = False
          Width = 60
        end
        object cxGridRashKartDBTableView1FL_FORMULAR: TcxGridDBColumn
          Caption = #1060#1086#1088#1084#1091#1083#1103#1088
          DataBinding.FieldName = 'FL_FORMULAR'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Width = 60
        end
        object cxGridRashKartDBTableView1FC_CLASS: TcxGridDBColumn
          Caption = #1050#1083#1072#1089#1089
          DataBinding.FieldName = 'FC_CLASS'
          Visible = False
          Width = 40
        end
        object cxGridRashKartDBTableView1FN_MASS: TcxGridDBColumn
          Caption = #1052#1072#1089#1089#1072' '#1051#1060
          DataBinding.FieldName = 'FN_MASS'
          Visible = False
          Options.Editing = False
          Width = 30
        end
        object cxGridRashKartDBTableView1FK_MASSUNITS: TcxGridDBColumn
          Caption = #1045#1076'. '#1084#1072#1089#1089#1099' '#1051#1060
          DataBinding.FieldName = 'FK_MASSUNITS'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'FK_ID'
          Properties.ListColumns = <
            item
              FieldName = 'FC_SHORTNAME'
            end>
          Properties.ListSource = dmMain.dsMassUnits
          Visible = False
          Options.Editing = False
          Width = 40
        end
      end
      object cxGridRashKartLevel1: TcxGridLevel
        GridView = cxGridRashKartDBTableView1
      end
    end
  end
  object gbPacMedNaz: TGroupBox
    Left = 0
    Top = 395
    Width = 534
    Height = 168
    Align = alTop
    Caption = ' '#1052#1077#1076'. '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103' '#1087#1072#1094#1080#1077#1085#1090#1072' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 4
    Visible = False
    object gPacMedNaz: TcxGrid
      Left = 2
      Top = 18
      Width = 530
      Height = 126
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      object tvPacMedNaz: TcxGridDBBandedTableView
        NavigatorButtons.ConfirmDelete = False
        OnCellClick = tvPacMedNazCellClick
        OnCellDblClick = tvPacMedNazCellDblClick
        OnCustomDrawCell = tvPacMedNazCustomDrawCell
        OnFocusedRecordChanged = tvPacMedNazFocusedRecordChanged
        DataController.DataSource = dsPacMedNaz
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.ImmediateEditor = False
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.BandMoving = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        OptionsView.BandHeaders = False
        Styles.ContentEven = dmMain.cxStyleGridDetailEvenRow
        Styles.ContentOdd = dmMain.cxStyleGridDetailOddRow
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        Bands = <
          item
            Width = 226
          end>
        object tvPacMedNazColumn1: TcxGridDBBandedColumn
          Caption = #1055#1088#1077#1087#1072#1088#1072#1090', '#1085#1072#1079#1085#1072#1095#1077#1085#1085#1099#1081' '#1074#1088#1072#1095#1077#1084
          DataBinding.FieldName = 'FC_MEDNAZNAME'
          HeaderAlignmentHorz = taCenter
          Width = 150
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object tvPacMedNazColumn2: TcxGridDBBandedColumn
          Caption = #1055#1088#1077#1087#1072#1088#1072#1090', '#1087#1077#1088#1077#1076#1072#1085#1085#1099#1081' '#1087#1086#1089#1090#1086#1074#1086#1081' '#1084'/'#1089'-'#1077
          DataBinding.FieldName = 'giventonursemedname'
          HeaderAlignmentHorz = taCenter
          Width = 228
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object tvPacMedNazColumn3: TcxGridDBBandedColumn
          Caption = #1042#1099#1076#1072#1085#1086' '#1087#1086#1089#1090#1086#1074#1086#1081' '#1084'/'#1089'-'#1086#1081' ('#1076#1072#1090#1072')'
          DataBinding.FieldName = 'FD_MAXPOST'
          HeaderAlignmentHorz = taCenter
          Width = 97
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object tvPacMedNazColLech: TcxGridDBBandedColumn
          DataBinding.FieldName = 'FK_NazMedLech'
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object tvPacMedNazWasGivenAtDate: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WasGivenAtDate'
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
      end
      object gPacMedNazL: TcxGridLevel
        GridView = tvPacMedNaz
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 144
      Width = 530
      Height = 22
      Align = alBottom
      BevelOuter = bvNone
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Shape5: TShape
        Left = 5
        Top = 2
        Width = 17
        Height = 17
        Brush.Color = clWindow
      end
      object Label9: TLabel
        Left = 26
        Top = 4
        Width = 207
        Height = 14
        Caption = #1053#1077' '#1074#1099#1076#1072#1085' '#1087#1072#1094#1080#1077#1085#1090#1091' '#1074' '#1076#1077#1085#1100' '#1089#1086#1089#1090#1072#1074#1083#1077#1085#1080#1103
      end
      object Shape1: TShape
        Left = 252
        Top = 2
        Width = 17
        Height = 17
        Brush.Color = 14153698
      end
      object Label13: TLabel
        Left = 273
        Top = 4
        Width = 283
        Height = 14
        Caption = #1042#1099#1076#1072#1085' '#1087#1072#1094#1080#1077#1085#1090#1091' '#1074' '#1076#1077#1085#1100' '#1089#1086#1089#1090#1072#1074#1083#1077#1085#1080#1103', '#1085#1086' '#1085#1077' '#1089#1087#1080#1089#1072#1085#1085#1099#1081
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 692
    Width = 534
    Height = 19
    Panels = <>
    SimplePanel = True
    Visible = False
  end
  object alActions: TActionList
    Images = dmMain.ilMain
    OnUpdate = alActionsUpdate
    Left = 498
    Top = 4
    object acenter: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 9
      ShortCut = 113
      OnExecute = acenterExecute
    end
    object acesc: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acescExecute
    end
    object acins: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
      ImageIndex = 21
      OnExecute = acinsExecute
    end
    object acedit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091
      ImageIndex = 3
      ShortCut = 114
      OnExecute = aceditExecute
    end
    object acdel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1091#1076#1072#1083#1080#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091
      ImageIndex = 22
      ShortCut = 119
      OnExecute = acdelExecute
    end
    object acrefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 42
      ShortCut = 116
    end
    object acCopyQuantity: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1082#1086#1083'-'#1074#1086':'
      OnExecute = acCopyQuantityExecute
    end
    object acCalcOstDoc: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1076#1086#1082'.'
      Enabled = False
      Hint = #1055#1077#1088#1077#1089#1095#1077#1090' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      Visible = False
      OnExecute = acCalcOstDocExecute
    end
    object acTrebProccess: TAction
      Category = 'Treb'
      Caption = #1054#1073#1088#1072#1073#1086#1090#1082#1072' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1081
      OnExecute = acTrebProccessExecute
    end
    object acSelectVidSpasanie: TAction
      Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1087#1086' '#1087#1088#1080#1095#1080#1085#1077
      OnExecute = acSelectVidSpasanieExecute
    end
    object acAddByTrebDPC: TAction
      Tag = 1
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
      ImageIndex = 21
      ShortCut = 115
      OnExecute = acAddByTrebDPCExecute
    end
    object acInsbyEAN: TAction
      Caption = #1087#1086' '#1096#1090#1088#1080#1093'-'#1082#1086#1076#1091
      Enabled = False
      Hint = #1054#1092#1086#1088#1084#1080#1090#1100' '#1087#1088#1080#1093#1086#1076' '#1087#1088#1080' '#1087#1086#1084#1086#1097#1080' '#1096#1090#1088#1080#1093'-'#1089#1082#1072#1085#1077#1088#1072
      ShortCut = 8307
      Visible = False
      OnExecute = acInsbyEANExecute
    end
    object acAddWithTrebDPC: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1089#1093#1086#1076' '#1089' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1077#1084
      Enabled = False
      ShortCut = 16499
      Visible = False
      OnExecute = acAddWithTrebDPCExecute
    end
    object acEditTrebPDC: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Enabled = False
      Visible = False
      OnExecute = acEditTrebPDCExecute
    end
    object acDelTrebDPC: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      Visible = False
      OnExecute = acDelTrebDPCExecute
    end
    object acAddToTemplate: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1096#1072#1073#1083#1086#1085
      OnExecute = acAddToTemplateExecute
    end
    object acLoadFromTemplate: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1096#1072#1073#1083#1086#1085#1072
      OnExecute = acLoadFromTemplateExecute
    end
    object acAddByPacNazn: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1102
      ShortCut = 41075
      OnExecute = acAddByPacNaznExecute
    end
  end
  object dsKart: TDataSource
    DataSet = odsKart
    Left = 200
    Top = 630
  end
  object odsKart: TOracleDataSet
    SQL.Strings = (
      'SELECT  rownum,'
      '        TDPC.ROWID,'
      '        TDPC.Dpid,'
      '        TDPC.FK_TREBDPC,'
      '        TDPC.DPCID,'
      '        NVL(TDPC.FK_REZERV_DOCID,-1) as FK_REZERV_DOCID,'
      '        TKART.MEDICID,'
      '        FN_TREBKOL,'
      '        TDPC.FN_KOL,'
      '        TDPC.fc_return_post,'
      '        ROUND((TDPC.FN_KOL*TMEDIC.FN_FPACKINUPACK),2) as FN_FAS,'
      '        TMEDIC.FN_FPACKINUPACK,'
      '        TKART.fn_price as fn_price,       '#9
      '        (TDPC.fn_kol*TKART.fn_price) AS summ,'
      '        TKART.KARTID,'
      '        TKart.MEDICID AS kmedicid,'
      '        TMEDIC.FC_NAME AS NAMEKART,'
      '        TMEDIC.FK_SKLAD_ID,'
      '        TKART.fn_party_num,'
      '        TKART.FC_SERIAL,'
      '        TKART.FD_GODEN,'
      '        TKART.FL_EXPENSIVE,'
      '        TKART.FC_INV_NOMER,'
      ''
      '        TKART.FN_NDS,'
      '        TKART.FN_NACENKA,'
      '        TKART.FN_PRICE_MNF,'
      '        TKART.FL_JNVLS,'
      '        TMEDIC.FL_MIBP,'
      '        TMEDIC.FL_FORMULAR,'
      '        TMEDIC.EIID as FK_UEI,'
      '        TMEDIC.FK_FPACKID as FK_FEI,'
      '        TMEDIC.FC_NAME_LAT,'
      '        TMEDIC.FC_INTERNATIONAL_NAME,'
      '        TMEDIC.FC_CLASS,'
      '        FK_MOGROUPID,'
      '        TMEDIC.FN_MASS,'
      '        TMEDIC.FK_MASSUNITS,'
      ''
      '/*        (select max(mg.fk_nazmedlechid) from tmedicgiven mg '
      
        '            where mg.fk_dpcid = tdpc.dpcid) fk_nazmedlechid, --A' +
        'dd A.Nakorjakov 17122007 '#1050#1086#1076' '#1084#1077#1076'.'#1085#1072#1079#1085'. '#1087#1072#1094#1072', '#1087#1086' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1087#1086' '#1087#1088#1080#1095 +
        #1080#1085#1077' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1087#1088#1086#1080#1089#1093#1086#1076#1080#1090' '#1088#1072#1089#1093#1086#1076
      '        (select max(mg.fk_nazmark) from tmedicgiven mg '
      
        '            where mg.fk_dpcid = tdpc.dpcid) fk_nazmark --Add A.N' +
        'akorjakov 18122007 '#1050#1086#1076' '#1084#1077#1076'.'#1085#1072#1079#1085'. '#1087#1072#1094#1072', '#1087#1086' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1087#1086' '#1087#1088#1080#1095#1080#1085#1077' '#1082#1086 +
        #1090#1086#1088#1086#1075#1086' '#1087#1088#1086#1080#1089#1093#1086#1076#1080#1090' '#1088#1072#1089#1093#1086#1076'*/'
      '       tdpc.FK_NAZMEDLECH_ID fk_nazmedlechid,'
      '       tdpc.fk_nazmark_id fk_nazmark'
      '       ,TDPC.FD_DATE_SPIS'
      '       , FS.FC_NAME as FC_FINSOURCE'
      '       , TKART.FC_QUOTA_CODE'
      ''
      ''
      '       FROM'
      '       '#9'MED.TDPC,'
      '       '#9'MED.TKART,'
      '              MED.TMEDIC,'
      '              MED.TFINSOURCE FS--,'
      '--              ,asu.tmedicgiven mg'
      '--              asu.TNAZMEDLECHVID nmlv '
      ''
      '       WHERE TDPC.DPID = :ADPID'
      '        '#9'AND TDPC.KARTID = TKART.KARTID'
      '--              and tdpc.FK_NAZMEDLECHVID = nmlv.id(+)'
      '--       '#9'AND FL_DEL = 0'
      '              AND TKART.MEDICID = TMEDIC.MEDICID(+)'
      '              AND TKART.FK_FINSOURCE_ID = FS.FK_ID(+)'
      '--              and tdpc.dpcid = mg.fk_dpcid(+)'
      
        '        order by nvl(TKART.FD_GODEN,sysdate+36500)   -- '#1077#1089#1083#1080' '#1087#1091#1089 +
        #1090#1072#1103' '#1076#1072#1090#1072' '#1074' '#1089#1088#1086#1082#1077' '#1075#1086#1076#1085#1086#1089#1090#1080' '#1090#1086' '#1089#1095#1080#1090#1072#1077#1084' '#1095#1090#1086' '#1075#1086#1076#1077#1085' '#1085#1072' 100 '#1083#1077#1090' '#1074#1087#1077#1088#1077#1076
      ''
      '')
    ReadBuffer = 50
    Optimize = False
    Variables.Data = {
      0300000001000000060000003A41445049440300000004000000010000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000001D000000080000004E414D454B415254010000000000060000004B41
      5254494401000000000006000000464E5F4B4F4C010000000000070000004D45
      4449434944010000000000050000004450434944010000000000040000005355
      4D4D01000000000006000000524F574E554D0100000000000900000046435F53
      455249414C0100000000000A000000464E5F545245424B4F4C01000000000008
      0000004B4D454449434944010000000000040000004450494401000000000008
      000000464E5F50524943450100000000000C000000464E5F50415254595F4E55
      4D0100000000000F000000464B5F4E415A4D45444C4543484944010000000000
      0A000000464B5F4E415A4D41524B0100000000000A000000464B5F5452454244
      50430100000000000F000000464B5F52455A4552565F444F4349440100000000
      000A00000046445F5649444441544501000000000006000000464E5F46415301
      000000000006000000464B5F55454901000000000006000000464B5F46454901
      00000000000800000046445F474F44454E0100000000000E00000046435F5245
      5455524E5F504F53540100000000000C000000464C5F455850454E5349564501
      00000000000C000000464B5F4D4F47524F555049440100000000000F00000046
      4E5F465041434B494E555041434B0100000000000B000000464B5F534B4C4144
      5F49440100000000000B00000046435F4E414D455F4C41540100000000000C00
      000046435F46494E534F55524345010000000000}
    Cursor = crSQLWait
    UniqueFields = 'DPCID'
    LockingMode = lmNone
    RefreshOptions = [roAllFields]
    OnApplyRecord = odsKartApplyRecord
    UpdatingTable = 'MED.TDPC'
    Session = dmMain.os
    AfterOpen = odsKartAfterRefresh
    AfterScroll = odsKartAfterScroll
    AfterRefresh = odsKartAfterRefresh
    Left = 148
    Top = 632
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmMoveEdit\'
    OnRestorePlacement = FormStorageRestorePlacement
    StoredProps.Strings = (
      'cxGridTrebDBTableView1FC_EDIZM.Width'
      'cxGridTrebDBTableView1FC_NAZN_ED_IZM.Width'
      'cxGridTrebDBTableView1FC_NAZN_NAME.Width'
      'cxGridTrebDBTableView1FN_KOL.Width'
      'cxGridTrebDBTableView1FN_KOLOST.Width'
      'cxGridTrebDBTableView1FN_NAZN_KOL_F.Width'
      'cxGridTrebDBTableView1FN_TREBKOL.Width'
      'cxGridTrebDBTableView1NAMEKART.Width'
      'cxGridTrebDBTableView1ODR.Width'
      'cxGridTrebDBTableView1SUMM.Width'
      'chbFasEI.Checked'
      'cxGridRashKartDBTableView1FC_SERIAL.Visible'
      'cxGridRashKartDBTableView1FC_SERIAL.Width'
      'cxGridRashKartDBTableView1FD_DATE_SPIS.Visible'
      'cxGridRashKartDBTableView1FD_DATE_SPIS.Width'
      'cxGridRashKartDBTableView1FK_FEI.Visible'
      'cxGridRashKartDBTableView1FK_FEI.Width'
      'cxGridRashKartDBTableView1FK_TREBDPC.Visible'
      'cxGridRashKartDBTableView1FK_TREBDPC.Width'
      'cxGridRashKartDBTableView1FK_UEI.Visible'
      'cxGridRashKartDBTableView1FK_UEI.Width'
      'cxGridRashKartDBTableView1FN_FAS.Visible'
      'cxGridRashKartDBTableView1FN_FAS.Width'
      'cxGridRashKartDBTableView1FN_KOL.Visible'
      'cxGridRashKartDBTableView1FN_KOL.Width'
      'cxGridRashKartDBTableView1FN_PARTY_NUM.Visible'
      'cxGridRashKartDBTableView1FN_PARTY_NUM.Width'
      'cxGridRashKartDBTableView1FN_PRICE.Visible'
      'cxGridRashKartDBTableView1FN_PRICE.Width'
      'cxGridRashKartDBTableView1ODR.Visible'
      'cxGridRashKartDBTableView1ODR.Width'
      'cxGridRashKartDBTableView1SUMM.Visible'
      'cxGridRashKartDBTableView1SUMM.Width'
      'cxGridTrebDBTableView1FC_EDIZM.Visible'
      'cxGridTrebDBTableView1FC_NAZN_ED_IZM.Visible'
      'cxGridTrebDBTableView1FC_NAZN_NAME.Visible'
      'cxGridTrebDBTableView1FN_KOL.Visible'
      'cxGridTrebDBTableView1FN_KOLOST.Visible'
      'cxGridTrebDBTableView1FN_NAZN_KOL_F.Visible'
      'cxGridTrebDBTableView1FN_TREBKOL.Visible'
      'cxGridTrebDBTableView1NAMEKART.Visible'
      'cxGridTrebDBTableView1ODR.Visible'
      'cxGridTrebDBTableView1ROWNUM.Visible'
      'cxGridTrebDBTableView1SUMM.Visible'
      'cxGridRashKartDBTableView1DPCID.Visible'
      'cxGridRashKartDBTableView1DPCID.Width'
      'cxGridRashKartDBTableView1KARTID.Visible'
      'cxGridRashKartDBTableView1KARTID.Width'
      'cxGridRashKartDBTableView1MEDICID.Visible'
      'cxGridRashKartDBTableView1MEDICID.Width'
      'cxGridRashKartDBTableView1NAMEKART.Visible'
      'cxGridRashKartDBTableView1NAMEKART.Width'
      'cxGridRashKartDBTableView1FD_GODEN.Visible'
      'cxGridRashKartDBTableView1FD_GODEN.Width'
      'cxGridRashKartDBTableView1FC_RETURN_POST.Width'
      'cxGridRashKartDBTableView1FC_FINSOURCE.Visible'
      'cxGridRashKartDBTableView1FC_FINSOURCE.Width'
      'cxGridRashKartDBTableView1_FC_INV_NOMER.Width'
      'cxGridRashKartDBTableView1FC_QUOTA_CODE.Visible'
      'cxGridRashKartDBTableView1FC_QUOTA_CODE.Width'
      'cxGridRashKartDBTableView1FL_JNVLS.Width'
      'cxGridRashKartDBTableView1FN_NACENKA.Width'
      'cxGridRashKartDBTableView1FN_NDS.Width'
      'cxGridRashKartDBTableView1FN_PRICE_MNF.Width'
      'grbTrebovanie.Height'
      'cxGridRashKartDBTableView1ROWNUM.Visible'
      'cxGridRashKartDBTableView1ROWNUM.Width'
      'cxGridRashKartDBTableView1FC_INTERNATIONAL_NAME.Visible'
      'cxGridRashKartDBTableView1FC_INTERNATIONAL_NAME.Width'
      'cxGridTrebDBTableView1FC_INTERNATIONAL_NAME.Visible'
      'cxGridTrebDBTableView1FC_INTERNATIONAL_NAME.Width')
    StoredValues = <>
    Left = 488
    Top = 324
  end
  object pmSelectVidSpisanie: TPopupMenu
    Left = 36
    Top = 158
    object N1: TMenuItem
      Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1087#1086' '#1087#1088#1080#1095#1080#1085#1077
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1085#1072' '#1086#1090#1076#1077#1083#1077#1085#1080#1077
      Enabled = False
      Visible = False
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1085#1072' '#1087#1072#1094#1080#1077#1085#1090#1072
      OnClick = N1Click
    end
  end
  object dsZatrebovano: TDataSource
    DataSet = odsZatrebovano
    Left = 140
    Top = 238
  end
  object odsZatrebovano: TOracleDataSet
    SQL.Strings = (
      'select ROWNUM,'
      '       TD.ROWID,'
      '       T.FK_DPID as DPID,'
      '       TD.FK_ID,'
      '       TD.FK_CREATE_MO_ID,'
      '       TD.FD_CREATE,'
      '       TD.FK_EDIT_MO_ID,'
      '       TD.FD_EDIT,'
      '       TD.FK_MEDICID as MEDICID,'
      '       TD.FN_KOL as FN_TREBKOL,'
      '       M.FC_NAME as NAMEKART,'
      '       E.FC_NAME as FC_EDIZM,'
      '       NVL(TDPC.FN_KOL, 0) as FN_KOL,'
      '       NVL(OST.FN_KOLOST, 0) as FN_KOLOST,'
      '       T.FK_FINSOURCE_ID,'
      
        '       UPPER(trim (M.FC_INTERNATIONAL_NAME)) as FC_INTERNATIONAL' +
        '_NAME, -- '#1052#1053#1053
      '       M.FK_FPACKID, -- '#1060#1072#1089'. '#1077#1076
      '       PACK_EI.FC_NAME as FC_FPACK_EI,'
      '       M.FN_MASS, -- '#1084#1072#1089#1089#1072' '#1051#1060
      '       M.FK_MASSUNITS,  -- '#1077#1076'. '#1084#1072#1089#1089#1099' '#1051#1060
      '       MASS_EI.FC_SHORTNAME as FC_MASS_EI'
      '--NAZN           ,LatN.fc_name as FC_NAZN_NAME,'
      '--NAZN           mu.FC_SHORTNAME as FC_NAZN_ED_IZM,'
      
        '--NAZN           F.FN_MNOG * nm.FN_DURATION * nml.FN_KOL AS FN_N' +
        'AZN_KOL_F'
      '  from MED.TTREB_DPC TD,'
      '       MED.TTREB T,'
      '       MED.TMEDIC M,'
      '       MED.TEI E,'
      '       MED.TEI PACK_EI,'
      '       MED.TMASSUNITS MASS_EI,'
      '       (select NVL(sum(TDPC.FN_KOL), 0) as FN_KOL, K.MEDICID'
      '          from MED.TDPC, MED.TKART K'
      '         where TDPC.KARTID = K.KARTID'
      '           and TDPC.DPID = :ADPID'
      '         group by K.MEDICID) TDPC,'
      
        '       (select sum(VMEDKART_KOLOST.FN_KOLOST) as FN_KOLOST, MEDI' +
        'CID'
      '          from MED.VMEDKART_KOLOST'
      '         group by MEDICID) OST'
      
        '--NAZN     ,asu.tnazmedlech nml, med.tlatin_names LatN, med.tmas' +
        'sunits mu, asu.tnazmed nm, ASU.TFREQUENCY F'
      ' where T.FK_DPID = :ADPID'
      '   and TD.FK_TREBID = T.FK_ID'
      '   and TD.FK_MEDICID = M.MEDICID'
      '   and E.EIID(+) = M.EIID'
      '   and M.MEDICID = TDPC.MEDICID(+)'
      '   and M.MEDICID = OST.MEDICID(+)'
      '   and M.FK_FPACKID = PACK_EI.EIID(+)'
      '   and M.FK_MASSUNITS = MASS_EI.FK_ID(+)'
      ''
      '--NAZN          AND td.fk_id = nml.fk_treb_dpc(+)'
      '--NAZN          AND nml.fk_medicid  = LatN.fk_id(+)'
      '--NAZN          AND nml.fk_dozunits = mu.fk_id(+)'
      '--NAZN          AND nml.fk_nazmedid = nm.fk_id(+)'
      '--NAZN          AND nm.FK_FREQUENCYID = F.FK_ID(+)')
    ReadBuffer = 50
    Optimize = False
    Variables.Data = {
      0300000001000000060000003A41445049440300000004000000010000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000D000000080000004E414D454B415254010000000000070000004D45
      444943494401000000000006000000524F574E554D0100000000000A00000046
      4E5F545245424B4F4C0100000000000800000046435F4544495A4D0100000000
      0005000000464B5F494401000000000004000000445049440100000000000600
      0000464E5F4B4F4C01000000000009000000464E5F4B4F4C4F53540100000000
      000F000000464B5F4352454154455F4D4F5F4944010000000000090000004644
      5F4352454154450100000000000D000000464B5F454449545F4D4F5F49440100
      000000000700000046445F45444954010000000000}
    Cursor = crSQLWait
    RefreshOptions = [roAllFields]
    CommitOnPost = False
    Session = dmMain.os
    AfterScroll = odsZatrebovanoAfterScroll
    Left = 80
    Top = 234
  end
  object odsTrebOst: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '    OST.*,'
      '    K.fd_goden,'
      '    NVL(M.FC_NAME,'#39#39') as MEDIC_NAME,'
      
        '    UPPER(trim (M.FC_INTERNATIONAL_NAME)) as FC_INTERNATIONAL_NA' +
        'ME,'
      '    M.FK_FPACKID,'
      '    M.FN_MASS,'
      '    M.FK_MASSUNITS,'
      '    0 as FL_USED'
      'from MED.VMEDKART_KOLOST OST, MED.TKART K, MED.TMEDIC M,'
      '    ( select dp.fk_medicid  as MEDICID'
      '        from med.ttreb_dpc dp where dp.fk_trebid = :fk_trebid'
      '    union  '
      '    select m.MEDICID'
      '      from med.TMEDIC m,'
      '           med.TMEDIC s,'
      '           ( select dp.fk_medicid '
      
        '               from med.ttreb_dpc dp where dp.fk_trebid = :fk_tr' +
        'ebid) t'
      '     where s.MEDICID = t.FK_MEDICID'
      '       and m.FC_INTERNATIONAL_NAME = s.FC_INTERNATIONAL_NAME'
      '       and m.FK_FPACKID = s.FK_FPACKID'
      '       and m.FN_MASS = s.FN_MASS'
      '       and m.FK_MASSUNITS = s.FK_MASSUNITS ) tm'
      '--where OST.MEDICID = :MEDICID'
      'where OST.MEDICID = tm.MEDICID'
      '  AND OST.KARTID = K.kartid'
      '  AND OST.MEDICID = M.MEDICID(+)'
      '  AND OST.FN_KOLOST > 0'
      '  AND OST.FN_OST_TYPE = 0  -- '#1058#1054#1051#1068#1050#1054' '#1053#1045' '#1056#1045#1047#1045#1056#1042
      '  AND NVL(K.FL_BRAK,0) = 0 -- '#1058#1054#1051#1068#1050#1054' '#1053#1045' '#1041#1056#1040#1050'    '
      '  AND ((K.Fd_Goden is null)or(K.Fd_Goden >= sysdate))'
      '--FUNC_SHOW_QUOTA_CODE'
      '--FUNC_USE_FIN_SOURCE_IN_AUTOFILL'
      
        'ORDER BY K.fd_goden asc, K.FN_PARTY_NUM asc -- '#1080#1084#1077#1085#1085#1086' '#1087#1086' '#1074#1086#1079#1088#1072#1089#1090 +
        #1072#1085#1080#1102' '#1089#1088#1086#1082#1072' '#1075#1086#1076#1085#1086#1089#1090#1080
      '')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A464B5F54524542494403000000040000000100
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000008000000060000004B4152544944010000000000070000004D454449
      4349440100000000000F000000464E5F465041434B494E555041434B01000000
      000008000000464E5F505249434501000000000009000000464E5F4B4F4C4F53
      540100000000000800000046445F474F44454E0100000000000A0000004D4544
      49435F4E414D450100000000000B000000464E5F4F53545F5459504501000000
      0000}
    Cursor = crSQLWait
    RefreshOptions = [roAllFields]
    OnApplyRecord = odsTrebOstApplyRecord
    CommitOnPost = False
    Session = dmMain.os
    Left = 158
    Top = 302
  end
  object dsTrebOst: TDataSource
    DataSet = odsTrebOst
    Left = 215
    Top = 304
  end
  object odsMO_GROUP: TOracleDataSet
    SQL.Strings = (
      'SELECT groupid, gr.fc_group'
      '  FROM med.tmo_group gr'
      'where '
      '  gr.fl_del = 0'
      'ORDER BY LOWER(fc_group)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000047524F555049440100000000000800000046435F
      47524F5550010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 332
    Top = 220
  end
  object DataSource1: TDataSource
    DataSet = odsMO_GROUP
    Left = 398
    Top = 230
  end
  object pmPrinttreb: TPopupMenu
    Left = 84
    Top = 292
    object N12: TMenuItem
      Action = acAddByTrebDPC
    end
    object N9: TMenuItem
      Action = acAddWithTrebDPC
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Action = acEditTrebPDC
    end
    object N10: TMenuItem
      Action = acDelTrebDPC
    end
    object miTrebDPC: TMenuItem
      Caption = '-'
      Visible = False
    end
    object miPrintToFR: TMenuItem
      Tag = 1
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072' '#1074' FastReport'
      OnClick = miPrintToFRClick
    end
    object miPrintToExcel: TMenuItem
      Tag = 2
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072' '#1074' Excel'
      OnClick = miPrintToFRClick
    end
  end
  object dsPacMedNaz: TDataSource
    DataSet = odsPacMedNaz
    Left = 366
    Top = 470
  end
  object odsPacMedNaz: TOracleDataSet
    SQL.Strings = (
      'SELECT L.FK_ID FK_NazMedLech,'
      
        '--'#9'ASU.GET_MEDNAZLECHNAME(L.FK_ID) FC_MEDNAZNAME, -- '#1087#1086#1087#1099#1090#1082#1072' '#1080#1089#1087 +
        #1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1091#1078#1077' '#1080#1084#1077#1102#1097#1091#1102#1089#1103' '#1092#1091#1085#1082#1094#1080#1102
      
        #9'ASU.PKG_MEDICNAZN.GET_NAZ_FULLNAME(L.FK_ID, 1, 0, 1) FC_MEDNAZN' +
        'AME,'
      '       N.FK_PACID,'
      '       (SELECT FD_POST FROM TNAZMARK TT WHERE TT.FK_ID = '
      
        '         ((SELECT MAX(FK_ID) FROM TNAZMARK TT WHERE TT.FK_NAZID ' +
        '= N.FK_ID AND TT.FK_NAZMEDLECHID = L.FK_ID))) FD_MAXPOST,'
      
        '       (select asu.get_giventopacmedname(m.fk_nazmedlechid,m.fd_' +
        'given) from ASU.TMEDICGIVEN m where m.fk_id ='
      
        '       (SELECT MAX(FK_ID) FROM ASU.TMEDICGIVEN MG WHERE MG.FK_NA' +
        'ZMEDLECHID = L.FK_ID)) giventonursemedname,'
      
        #9'     round(F.FN_MNOG * greatest(L.FN_KOL,L.FN_DOZA), 2) FN_DAYD' +
        'OZE,'
      
        '       (SELECT count(1) FROM TNAZMARK TT WHERE TT.FK_NAZID = N.F' +
        'K_ID AND TT.FK_NAZMEDLECHID = L.FK_ID AND '
      '         trunc(TT.FD_POST,'#39'DD'#39')=trunc(:pDate,'#39'DD'#39')'
      '         and not exists'
      '         (select 1 from'
      '          asu.tmedicgiven m'
      '           where m.fk_nazmark = tt.fk_id)'
      '           ) WasGivenAtDate'
      '  FROM TNAZMED     N,'
      '       TNAZMEDLECH L,'
      '       TVVODPATH V,'
      '       ASU.TFREQUENCY F       '
      ' WHERE N.FK_ID = L.FK_NAZMEDID'
      '       AND N.FK_FREQUENCYID = F.FK_ID (+)'
      '       AND N.FK_STATE = ASU.GET_NEVIP'
      '       AND N.FK_PACID = :pPacID'
      '       AND V.FL_PROCCAB = 0'
      '       AND V.FK_ID = N.FK_VVODPATHID'
      '       AND NOT EXISTS (SELECT 1'
      
        '                       FROM TNAZMEDLECH, MED.TMEDIC_TSPECIALMEDI' +
        'C'
      
        '                            WHERE TNAZMEDLECH.FK_MEDICID = MED.T' +
        'MEDIC_TSPECIALMEDIC.MEDICID'
      
        '                            AND TNAZMEDLECH.FK_NAZMEDID = N.FK_I' +
        'D) -- '#1085#1077' '#1085#1072#1088#1082#1086#1090#1080#1082)
    ReadBuffer = 50
    Optimize = False
    Variables.Data = {
      0300000002000000070000003A50504143494403000000000000000000000006
      0000003A50444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000010000000080000004E414D454B415254010000000000060000004B41
      5254494401000000000006000000464E5F4B4F4C010000000000070000004D45
      4449434944010000000000050000004450434944010000000000040000005355
      4D4D01000000000006000000524F574E554D0100000000000900000046435F53
      455249414C0100000000000A000000464E5F545245424B4F4C01000000000008
      00000046435F4544495A4D01000000000005000000464B5F4944010000000000
      080000004B4D454449434944010000000000030000004F445201000000000004
      0000004450494401000000000008000000464E5F50524943450100000000000C
      000000464E5F50415254595F4E554D010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 282
    Top = 470
  end
  object odsGetProvizorToSMSMedicsList: TOracleDataSet
    SQL.Strings = (
      '   select'
      '       tdpc.kartid'
      '   FROM asu.tnazmedlech nml, med.ttreb_dpc trd, med.tdpc'
      '   where nml.FK_ID = :FK_NAZMEDLECH_ID'
      '     and nml.fk_treb_dpc = trd.fk_id'
      '     and trd.fk_id = tdpc.FK_TREBDPC')
    Optimize = False
    Variables.Data = {
      0300000001000000110000003A464B5F4E415A4D45444C4543485F4944030000
      000000000000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 78
    Top = 606
  end
  object tmrOnPost: TTimer
    Interval = 300
    OnTimer = tmrOnPostTimer
    Left = 390
    Top = 58
  end
  object pmAdd: TPopupMenu
    Left = 48
    Top = 636
    object N4: TMenuItem
      Action = acAddByTrebDPC
    end
    object N5: TMenuItem
      Action = acInsbyEAN
    end
    object N6: TMenuItem
      Action = acAddWithTrebDPC
    end
    object N14: TMenuItem
      Action = acAddByPacNazn
    end
  end
  object odsPrihDoc: TOracleDataSet
    SQL.Strings = (
      'select '
      '  MIN(d.dpid) as prih_date'
      'from med.tdocs d, med.tdpc dp'
      'where '
      '    MED.PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO = d.fk_mogroupid_to'
      'and d.dpid = dp.dpid'
      'and dp.kartid = :pkartid')
    ReadBuffer = 50
    Optimize = False
    Variables.Data = {
      0300000001000000080000003A504B4152544944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001D000000080000004E414D454B415254010000000000060000004B41
      5254494401000000000006000000464E5F4B4F4C010000000000070000004D45
      4449434944010000000000050000004450434944010000000000040000005355
      4D4D01000000000006000000524F574E554D0100000000000900000046435F53
      455249414C0100000000000A000000464E5F545245424B4F4C01000000000008
      0000004B4D454449434944010000000000040000004450494401000000000008
      000000464E5F50524943450100000000000C000000464E5F50415254595F4E55
      4D0100000000000F000000464B5F4E415A4D45444C4543484944010000000000
      0A000000464B5F4E415A4D41524B0100000000000A000000464B5F5452454244
      50430100000000000F000000464B5F52455A4552565F444F4349440100000000
      000A00000046445F5649444441544501000000000006000000464E5F46415301
      000000000006000000464B5F55454901000000000006000000464B5F46454901
      00000000000800000046445F474F44454E0100000000000E00000046435F5245
      5455524E5F504F53540100000000000C000000464C5F455850454E5349564501
      00000000000C000000464B5F4D4F47524F555049440100000000000F00000046
      4E5F465041434B494E555041434B0100000000000B000000464B5F534B4C4144
      5F49440100000000000B00000046435F4E414D455F4C41540100000000000C00
      000046435F46494E534F55524345010000000000}
    Cursor = crSQLWait
    OnApplyRecord = odsKartApplyRecord
    CommitOnPost = False
    Session = dmMain.os
    Left = 332
    Top = 624
  end
  object pmTemplate: TPopupMenu
    Left = 520
    Top = 600
    object N11: TMenuItem
      Action = acLoadFromTemplate
      Default = True
    end
    object N7: TMenuItem
      Action = acAddToTemplate
    end
  end
  object pmCorrectTrebLink: TPopupMenu
    Left = 264
    Top = 632
    object miLinkWithTreb: TMenuItem
      Caption = #1057#1074#1103#1079#1072#1090#1100' '#1089' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1077#1084
      OnClick = miLinkWithTrebClick
    end
    object N17: TMenuItem
      Caption = '-'
    end
    object miCheckLink: TMenuItem
      Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1087#1088#1080#1074#1103#1079#1082#1091
      OnClick = miCheckLinkClick
    end
    object N18: TMenuItem
      Caption = '-'
    end
    object miDelLink: TMenuItem
      Caption = #1059#1073#1088#1072#1090#1100' '#1087#1088#1080#1074#1103#1079#1082#1091
      OnClick = miDelLinkClick
    end
  end
  object pmPacTypeSelect: TPopupMenu
    Tag = 1
    Left = 176
    Top = 160
    object miPacStac: TMenuItem
      Tag = 1
      AutoCheck = True
      Caption = #1057#1090#1072#1094#1080#1086#1085#1072#1088#1085#1099#1077' '#1087#1072#1094#1080#1077#1085#1090#1099
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = miPacStacClick
    end
    object N16: TMenuItem
      Caption = '-'
      GroupIndex = 1
    end
    object miPacAmb: TMenuItem
      AutoCheck = True
      Caption = #1040#1084#1073#1091#1083#1072#1090#1086#1088#1085#1099#1077' '#1087#1072#1094#1080#1077#1085#1090#1099
      GroupIndex = 1
      RadioItem = True
      OnClick = miPacStacClick
    end
  end
  object pmAutoFill_FinSource: TPopupMenu
    Left = 368
    Top = 600
    object miAutoFill_By_FinSource: TMenuItem
      Caption = #1089' '#1091#1095#1105#1090#1086#1084' '#1080#1089#1090'. '#1092#1080#1085'.'
      Default = True
      OnClick = miAutoFill_By_FinSourceClick
    end
    object miAutoFill_not_by_FinSource: TMenuItem
      Caption = #1073#1077#1079' '#1091#1095#1105#1090#1072' '#1080#1089#1090'. '#1092#1080#1085'.'
      OnClick = miAutoFill_not_by_FinSourceClick
    end
  end
  object pmAutoFillPlan_FinSource: TPopupMenu
    Left = 408
    Top = 600
    object miAutoFillPlan_By_FinSource: TMenuItem
      Caption = #1089' '#1091#1095#1105#1090#1086#1084' '#1080#1089#1090'. '#1092#1080#1085'.'
      Default = True
      OnClick = miAutoFill_By_FinSourceClick
    end
    object miAutoFillPlan_not_by_FinSource: TMenuItem
      Caption = #1073#1077#1079' '#1091#1095#1105#1090#1072' '#1080#1089#1090'. '#1092#1080#1085'.'
      OnClick = miAutoFill_not_by_FinSourceClick
    end
  end
end
