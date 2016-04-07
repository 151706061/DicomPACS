object frmTrebManual: TfrmTrebManual
  Left = 361
  Top = 78
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103
  ClientHeight = 559
  ClientWidth = 486
  Color = clBtnFace
  Constraints.MinHeight = 245
  Constraints.MinWidth = 340
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 360
    Width = 486
    Height = 5
    Cursor = crVSplit
    Align = alTop
    Visible = False
    ExplicitTop = 343
  end
  object CoolBar2: TCoolBar
    Left = 0
    Top = 0
    Width = 486
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 40
        Width = 486
      end>
    EdgeBorders = [ebTop, ebBottom]
    object ToolBar2: TToolBar
      Left = 9
      Top = 0
      Width = 477
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
        Action = acSave
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton4: TToolButton
        Left = 60
        Top = 0
        Action = acCancel
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object paCaption: TPanel
    Left = 0
    Top = 44
    Width = 486
    Height = 137
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      486
      137)
    object Label9: TLabel
      Left = 51
      Top = 37
      Width = 39
      Height = 13
      Caption = #1054#1090#1082#1091#1076#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 16
      Top = 90
      Width = 73
      Height = 13
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    end
    object lbDemand: TLabel
      Left = 13
      Top = 12
      Width = 78
      Height = 13
      Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#8470':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbFrom: TLabel
      Left = 367
      Top = 11
      Width = 11
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1086#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 64
      Top = 61
      Width = 27
      Height = 13
      Caption = #1050#1091#1076#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object deNumTreb: TEdit
      Left = 96
      Top = 8
      Width = 259
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 0
    end
    object LCBTo: TDBLookupComboBox
      Left = 312
      Top = 58
      Width = 156
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'MOID'
      ListField = 'FC_NAME'
      ListSource = dsNameTo
      TabOrder = 3
      OnKeyPress = LCBToKeyPress
    end
    object lcbFrom: TDBLookupComboBox
      Left = 312
      Top = 33
      Width = 156
      Height = 21
      Anchors = [akTop, akRight]
      Enabled = False
      KeyField = 'MOID'
      ListField = 'FC_NAME'
      ListSource = dsNameFrom
      TabOrder = 1
    end
    object chbFL_CITO: TCheckBox
      Left = 420
      Top = 89
      Width = 47
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Cito'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = chbFL_CITOClick
    end
    object lcbMO_GroupFrom: TDBLookupComboBox
      Left = 96
      Top = 33
      Width = 211
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      KeyField = 'GROUPID'
      ListField = 'FC_GROUP'
      ListSource = dsMO_GroupFrom
      TabOrder = 2
      OnClick = lcbMO_GroupFromClick
      OnCloseUp = lcbMO_GroupFromCloseUp
      OnKeyUp = lcbMO_GroupFromKeyUp
    end
    object lcbMO_GroupTo: TDBLookupComboBox
      Left = 96
      Top = 58
      Width = 211
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'GROUPID'
      ListField = 'FC_GROUP'
      ListSource = dsMO_GroupTo
      TabOrder = 4
      OnCloseUp = lcbMO_GroupToCloseUp
      OnKeyUp = lcbMO_GroupToKeyUp
    end
    object deRegisterDate: TcxDateEdit
      Left = 389
      Top = 8
      Anchors = [akTop, akRight]
      EditValue = 0d
      Properties.DateButtons = [btnToday]
      Properties.ImmediatePost = True
      Properties.InputKind = ikMask
      Properties.ShowTime = False
      Properties.OnEditValueChanged = deRegisterDatePropertiesEditValueChanged
      Properties.OnValidate = deRegisterDatePropertiesValidate
      Style.BorderStyle = ebs3D
      TabOrder = 6
      Width = 79
    end
    object mComment: TEdit
      Left = 96
      Top = 87
      Width = 307
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
    end
    object paFinSource: TPanel
      Left = 0
      Top = 111
      Width = 486
      Height = 26
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 8
      Visible = False
      object Label1: TLabel
        Left = 22
        Top = 4
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089'.:'
      end
      object lcbFinSource: TcxLookupComboBox
        Left = 96
        Top = 2
        Properties.ClearKey = 46
        Properties.DropDownListStyle = lsFixedList
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmMain.dsTFinSource
        Style.BorderStyle = ebs3D
        TabOrder = 0
        Width = 372
      end
    end
  end
  object grbMinZapas: TGroupBox
    Left = 0
    Top = 181
    Width = 486
    Height = 179
    Align = alTop
    Caption = ' '#1052#1080#1085#1080#1084#1072#1083#1100#1085#1099#1081' '#1079#1072#1087#1072#1089' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 2
    Visible = False
    object cxGridMinZapas: TcxGrid
      Left = 2
      Top = 18
      Width = 482
      Height = 159
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      object cxGridMinZapasDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        OnCustomDrawCell = cxGridMinZapasDBTableView1CustomDrawCell
        DataController.DataSource = dsMinZapas
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.KeyFieldNames = 'ROWNUM'
        DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        OptionsBehavior.CellHints = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.ImmediateEditor = False
        OptionsBehavior.IncSearch = True
        OptionsData.Editing = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        Preview.AutoHeight = False
        Preview.MaxLineCount = 2
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        object cxGridMinZapasDBTableView1ROWNUM: TcxGridDBColumn
          Caption = #8470' '#1087'/'#1087
          DataBinding.FieldName = 'ROWNUM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Options.Filtering = False
          Width = 50
        end
        object cxGridMinZapasDBTableView1NAMEKART: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
          DataBinding.FieldName = 'FC_MEDICNAME'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          MinWidth = 150
          Options.Editing = False
          Options.Filtering = False
          Width = 175
        end
        object cxGridMinZapasDBTableView1FC_EDIZM: TcxGridDBColumn
          Caption = #1045#1076'. '#1048#1079#1084'.'
          DataBinding.FieldName = 'FC_EDIZM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Options.Editing = False
          Options.Filtering = False
          Width = 68
        end
        object cxGridMinZapasDBTableView1COLVO: TcxGridDBColumn
          Caption = #1052#1080#1085'. '#1079#1072#1087#1072#1089
          DataBinding.FieldName = 'COLVO'
          PropertiesClassName = 'TcxSpinEditProperties'
          Options.Filtering = False
          Width = 95
        end
        object cxGridMinZapasDBTableView1OSTMEDIC: TcxGridDBColumn
          Caption = #1058#1077#1082'. '#1086#1089#1090#1072#1090#1086#1082
          DataBinding.FieldName = 'OSTMEDIC'
          PropertiesClassName = 'TcxSpinEditProperties'
          Options.Filtering = False
          Width = 92
        end
      end
      object cxGridMinZapasLevel1: TcxGridLevel
        GridView = cxGridMinZapasDBTableView1
      end
    end
  end
  object grbTreb: TGroupBox
    Left = 0
    Top = 365
    Width = 486
    Height = 194
    Align = alClient
    Caption = ' '#1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '
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
      Width = 482
      Height = 28
      AutoSize = True
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          MinHeight = 26
          Width = 482
        end>
      EdgeBorders = [ebTop]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object ToolBar1: TToolBar
        Left = 9
        Top = 0
        Width = 473
        Height = 26
        AutoSize = True
        BorderWidth = 1
        ButtonWidth = 104
        Caption = 'ToolBar2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Images = dmMain.ilMain
        List = True
        ParentFont = False
        ShowCaptions = True
        TabOrder = 0
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Action = acInsert
          DropdownMenu = pmAdd
          ParentShowHint = False
          ShowHint = True
          Style = tbsDropDown
        end
        object ToolButton2: TToolButton
          Left = 117
          Top = 0
          Action = acEdit
          ParentShowHint = False
          ShowHint = True
        end
        object ToolButton5: TToolButton
          Left = 221
          Top = 0
          Action = acDelete
          ParentShowHint = False
          ShowHint = True
        end
      end
    end
    object cxGrid1: TcxGrid
      Left = 2
      Top = 46
      Width = 482
      Height = 146
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object cxGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = acEditExecute
        NavigatorButtons.ConfirmDelete = False
        OnCustomDrawCell = cxGrid1DBTableView1CustomDrawCell
        DataController.DataSource = dsMedic
        DataController.KeyFieldNames = 'FK_ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.AlwaysShowEditor = True
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnSorting = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = dmMain.cxStyleGridEvenRow
        Styles.ContentOdd = dmMain.cxStyleGridOddRow
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        object cxGrid1DBTableView1_ROWNUM: TcxGridDBColumn
          Caption = #8470' '#1087'/'#1087
          DataBinding.FieldName = 'ROWNUM'
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Grouping = False
          VisibleForCustomization = False
          Width = 44
        end
        object cxGrid1DBTableView1_FC_MEDIC: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_MEDIC'
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Grouping = False
          Width = 265
        end
        object cxGrid1DBTableView1FC_NAME_LAT: TcxGridDBColumn
          Caption = #1051#1072#1090'. '#1085#1072#1079#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_NAME_LAT'
          Visible = False
        end
        object cxGrid1DBTableView1FC_INTERNATIONAL_NAME: TcxGridDBColumn
          Caption = #1052#1077#1078#1076#1091#1085#1072#1088#1086#1076#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_INTERNATIONAL_NAME'
          Visible = False
          Width = 150
        end
        object cxGrid1DBTableView1_FC_EDIZM: TcxGridDBColumn
          Caption = #1045#1076'. '#1080#1079#1084'.'
          DataBinding.FieldName = 'FC_EDIZM'
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Grouping = False
          Width = 48
        end
        object cxGrid1DBTableView1_FN_KOL: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086
          DataBinding.FieldName = 'FN_KOL'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.AssignedValues.MinValue = True
          Properties.ImmediatePost = True
          Properties.MaxValue = 999999999.000000000000000000
          Properties.ValueType = vtFloat
          Options.Filtering = False
          Options.Grouping = False
          Width = 101
        end
        object cxGrid1DBTableView1FN_KOLOST: TcxGridDBColumn
          Caption = #1053#1072#1083#1080#1095#1080#1077' '#1074' '#1090#1077#1082'. '#1086#1090#1076#1077#1083#1077#1085#1080#1080
          DataBinding.FieldName = 'FN_KOLOST'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.ReadOnly = False
          Options.Editing = False
          Options.Focusing = False
        end
        object cxGrid1DBTableView1FD_CREATE: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
          DataBinding.FieldName = 'FD_CREATE'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.DateButtons = []
          Properties.Kind = ckDateTime
          Properties.ReadOnly = True
          Visible = False
        end
        object cxGrid1DBTableView1FK_CREATE_MO_ID: TcxGridDBColumn
          Caption = #1050#1090#1086' '#1089#1086#1079#1076#1072#1083
          DataBinding.FieldName = 'FK_CREATE_MO_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'MOID'
          Properties.ListColumns = <
            item
              FieldName = 'FC_NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmMain.dsMO
          Visible = False
        end
        object cxGrid1DBTableView1FD_EDIT: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          DataBinding.FieldName = 'FD_EDIT'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.DateButtons = []
          Properties.Kind = ckDateTime
          Properties.ReadOnly = True
          Visible = False
        end
        object cxGrid1DBTableView1FK_EDIT_MO_ID: TcxGridDBColumn
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
        object cxGrid1DBTableView1FC_CLASS: TcxGridDBColumn
          Caption = #1050#1083#1072#1089#1089
          DataBinding.FieldName = 'FC_CLASS'
          Visible = False
          Width = 40
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object alActions: TActionList
    Images = dmMain.ilMain
    Left = 288
    Top = 8
    object acSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 9
      ShortCut = 113
      OnExecute = acSaveExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acCancelExecute
    end
    object acInsert: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091
      ImageIndex = 21
      ShortCut = 115
      OnExecute = acInsertExecute
    end
    object acEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091
      ImageIndex = 3
      ShortCut = 114
      OnExecute = acEditExecute
    end
    object acDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1091#1076#1072#1083#1080#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091
      ImageIndex = 22
      ShortCut = 119
      OnExecute = acDeleteExecute
    end
    object acSecret: TAction
      Caption = #1052#1072#1075#1080#1103
      ShortCut = 49232
      OnExecute = acSecretExecute
    end
    object acAutoFill: TAction
      Caption = 'acAutoFill'
      OnExecute = acAutoFillExecute
    end
    object acInsFromOst: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086' '#1090#1077#1082'. '#1086#1089#1090#1072#1090#1082#1072#1084
      ShortCut = 8307
      OnExecute = acInsFromOstExecute
    end
    object acInsBySkladOst: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086' '#1086#1089#1090'. '#1089#1082#1083#1072#1076#1072
      Visible = False
      OnExecute = acInsBySkladOstExecute
    end
  end
  object dsMedic: TDataSource
    DataSet = odsMedic
    Left = 44
    Top = 490
  end
  object odsMedic: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWNUM, A.* FROM ('
      'SELECT D.ROWID as ROW_ID, D.*,'
      '       M.FC_NAME AS FC_MEDIC,'
      '       M.FC_INTERNATIONAL_NAME,'
      '       E.FC_NAME AS FC_EDIZM , 0 as KARTID,'
      '       NVL(OST.FN_KOLOST,0) as FN_KOLOST,'
      '       m.FC_NAME_LAT,'
      '       M.FC_CLASS'
      ''
      'FROM MED.TTREB_DPC D, MED.TMEDIC M, MEd.TEI E,'
      
        '    (select sum(VMEDKART_KOLOST.FN_KOLOST) as FN_KOLOST, VMEDKAR' +
        'T_KOLOST.medicid'
      '     FROM  MED.VMEDKART_KOLOST'
      '     GROUP BY MEDICID) OST'
      'WHERE D.FK_TREBID = :FK_TREBID'
      '  AND M.MEDICID = D.FK_MEDICID'
      '--  and M.fl_visible = 1'
      '  AND M.EIID = E.EIID (+)'
      '  AND M.MEDICID = OST.MEDICID(+) '
      'ORDER BY LOWER(M.FC_NAME )'
      ') A')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A464B5F54524542494403000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000001100000006000000524F574E554D01000000000005000000464B5F49
      4401000000000009000000464B5F5452454249440100000000000A000000464B
      5F4D45444943494401000000000006000000464E5F4B4F4C0100000000000800
      000046435F4D454449430100000000000800000046435F4544495A4D01000000
      000008000000464B5F4450434944010000000000060000004B41525449440100
      0000000009000000464E5F4B4F4C4F535401000000000010000000464B5F4E41
      5A4D45444C4543485F49440100000000000F000000464B5F4352454154455F4D
      4F5F49440100000000000900000046445F4352454154450100000000000D0000
      00464B5F454449545F4D4F5F49440100000000000700000046445F4544495401
      00000000000A000000464E5F4B4F4C5F4F4C440100000000000B00000046435F
      4E414D455F4C4154010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    CommitOnPost = False
    Session = dmMain.os
    AfterScroll = odsMedicAfterScroll
    Left = 44
    Top = 446
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmTrebManual\'
    StoredProps.Strings = (
      'grbMinZapas.Height'
      'cxGrid1DBTableView1FD_CREATE.Visible'
      'cxGrid1DBTableView1FD_CREATE.Width'
      'cxGrid1DBTableView1_FC_EDIZM.Visible'
      'cxGrid1DBTableView1_FC_EDIZM.Width'
      'cxGrid1DBTableView1_FC_MEDIC.Visible'
      'cxGrid1DBTableView1_FC_MEDIC.Width'
      'cxGrid1DBTableView1_FN_KOL.Visible'
      'cxGrid1DBTableView1_FN_KOL.Width'
      'cxGrid1DBTableView1_ROWNUM.Visible'
      'cxGrid1DBTableView1_ROWNUM.Width'
      'cxGrid1DBTableView1FD_EDIT.Visible'
      'cxGrid1DBTableView1FD_EDIT.Width'
      'cxGrid1DBTableView1FK_CREATE_MO_ID.Visible'
      'cxGrid1DBTableView1FK_CREATE_MO_ID.Width'
      'cxGrid1DBTableView1FK_EDIT_MO_ID.Visible'
      'cxGrid1DBTableView1FK_EDIT_MO_ID.Width'
      'cxGrid1DBTableView1FN_KOLOST.Visible'
      'cxGrid1DBTableView1FN_KOLOST.Width'
      'cxGridMinZapasDBTableView1COLVO.Visible'
      'cxGridMinZapasDBTableView1COLVO.Width'
      'cxGridMinZapasDBTableView1FC_EDIZM.Visible'
      'cxGridMinZapasDBTableView1FC_EDIZM.Width'
      'cxGridMinZapasDBTableView1NAMEKART.Visible'
      'cxGridMinZapasDBTableView1NAMEKART.Width'
      'cxGridMinZapasDBTableView1OSTMEDIC.Visible'
      'cxGridMinZapasDBTableView1OSTMEDIC.Width'
      'cxGridMinZapasDBTableView1ROWNUM.Visible'
      'cxGridMinZapasDBTableView1ROWNUM.Width'
      'cxGrid1DBTableView1FC_NAME_LAT.Visible'
      'cxGrid1DBTableView1FC_NAME_LAT.Width'
      'miUseShtrihcode.Checked'
      'cxGrid1DBTableView1FC_INTERNATIONAL_NAME.Visible'
      'cxGrid1DBTableView1FC_INTERNATIONAL_NAME.Width')
    StoredValues = <>
    Left = 282
    Top = 255
  end
  object odsNameTo: TOracleDataSet
    SQL.Strings = (
      
        'SELECT TMO.MOID, TMO.FC_NAME, MIG.FK_GROUP FK_CURMOGROUPID, TMO.' +
        'FL_DEL, tmo.FK_SOTRID'
      '  FROM MED.TMO, MED.TMO_IN_GROUP MIG'
      ' WHERE TMO.MOID = MIG.FK_MO'
      '   AND MIG.FL_DEL = 0'
      ' ORDER BY TMO.FC_NAME'
      ''
      '/*SELECT TMO.*'
      'FROM MED.TMO'
      'ORDER BY TMO.FC_NAME */'
      '--WHERE  TMO.FL_TREB = 1'
      ''
      
        '/*'#1074#1099#1073#1080#1088#1072#1077#1084' '#1090#1077#1093' '#1083#1080#1094' '#1082#1090#1086' '#1088#1072#1073#1086#1090#1072#1077#1090' '#1089' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103#1084#1080' '#1080' '#1090#1080#1087#1086#1084' '#1091#1095' '#1075#1088' '#1090#1077#1082 +
        #1091#1097#1077#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      '-------------------------------------'
      'SELECT TMO.MOID,TMO.FC_NAME '
      'FROM MED.TMO, MED.TMO_TUCHGRTYPE TT'
      'WHERE  TMO.FL_TREB = 1'
      '  AND TMO.MOID = TT.MOID'
      '  AND TT.FK_TUCHGRTYPE IN '
      '('
      'SELECT TT.FK_TUCHGRTYPE FROM '
      'MED.TMO M, MED.TMO_TUCHGRTYPE TT'
      'WHERE M.MOID = TT.MOID'
      '  AND M.MOID = PKG_MEDSES.GET_CURMO'
      ')'
      'GROUP BY TMO.MOID,TMO.FC_NAME'
      'ORDER BY FC_NAME'
      '*/'
      ''
      '/*'#1090#1088#1077#1073#1091#1077#1084' '#1091' '#1052#1054', '#1085#1072' '#1091#1088#1086#1074#1077#1085#1100' '#1074#1099#1096#1077
      ''
      'SELECT MOID, FC_NAME FROM MED.TMO M'
      'WHERE LEVEL = 2'
      'START WITH MOID = :MOID'
      'CONNECT BY MOID = PRIOR FK_PARENT */')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0400000002000000040000004D4F49440100000000000700000046435F4E414D
      45010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 152
    Top = 106
  end
  object dsNameTo: TDataSource
    DataSet = odsNameTo
    Left = 208
    Top = 112
  end
  object odsNameFrom: TOracleDataSet
    SQL.Strings = (
      
        'SELECT TMO.MOID, TMO.FC_NAME, MIG.FK_GROUP FK_CURMOGROUPID, TMO.' +
        'FL_DEL, tmo.FK_SOTRID'
      '  FROM MED.TMO, MED.TMO_IN_GROUP MIG'
      ' WHERE TMO.MOID = MIG.FK_MO'
      '   AND MIG.FL_DEL = 0'
      ' ORDER BY TMO.FC_NAME'
      ''
      '/*SELECT TMO.MOID,TMO.FC_NAME, fk_curmogroupid, fl_del'
      'FROM MED.TMO'
      'ORDER BY TMO.FC_NAME*/'
      ''
      
        '/*SELECT MOID,LPAD('#39' '#39',LEVEL*2,'#39' '#39')||FC_NAME AS FC_NAME,PKG_HIER' +
        'ARCHY.BRANCH(LEVEL,TRIM(FC_NAME),'#39'/'#39') FROM MED.TMO'
      'START WITH MOID = MED.PKG_MEDSES.GET_CURMO'
      'CONNECT BY PRIOR MOID = FK_PARENT'
      'ORDER BY 3'
      '*/')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0400000002000000040000004D4F49440100000000000700000046435F4E414D
      45010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 94
    Top = 62
  end
  object dsNameFrom: TDataSource
    DataSet = odsNameFrom
    Left = 142
    Top = 64
  end
  object odsMO_GroupFrom: TOracleDataSet
    SQL.Strings = (
      'SELECT gr.*'
      '  FROM med.tmo_group gr'
      'where '
      '  gr.fl_del = 0'
      'ORDER BY LOWER(fc_group)'
      ''
      ''
      '/*'
      'SELECT groupid, gr.fc_group'
      '  FROM med.TMO_IN_GROUP mgr,  med.tmo_group gr'
      'where '
      '  mgr.fl_del = 0  and'
      '  gr.fl_del = 0  and  '
      '  mgr.fk_mo = :MOID AND'
      '  mgr.fk_group = gr.groupid'
      'ORDER BY fc_group'
      '*/')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000047524F555049440100000000000800000046435F
      47524F5550010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 316
    Top = 66
  end
  object dsMO_GroupFrom: TDataSource
    DataSet = odsMO_GroupFrom
    Left = 394
    Top = 70
  end
  object odsMO_GroupTo: TOracleDataSet
    SQL.Strings = (
      'SELECT gr.*,'
      '       nvl(cp.fn_value,1) as fn_value'
      ''
      '  FROM med.tmo_group gr, '
      
        '       (select c.*, p.* from med.tcross_table_check c, med.tcros' +
        's_table_params p'
      '        where (c.fk_key2 = med.pkg_medses.get_cur_mogroup) and'
      
        '              (c.fk_cross_params_id = p.fk_id) and p.fc_synonim ' +
        '= '#39'TREB_SKLAD_MO_GROUP'#39') cp'
      'where '
      '   gr.fl_del = 0'
      ' and(gr.fk_sklad_id = cp.fk_key1(+))'
      ''
      'ORDER BY LOWER(fc_group)'
      ''
      '/*'
      'SELECT groupid, gr.fc_group'
      '  FROM med.TMO_IN_GROUP mgr,  med.tmo_group gr'
      'where '
      '  mgr.fl_del = 0  and'
      '  gr.fl_del = 0  and  '
      '  mgr.fk_mo = :MOID AND'
      '  mgr.fk_group = gr.groupid'
      'ORDER BY fc_group'
      '*/')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000047524F555049440100000000000800000046435F
      47524F5550010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 300
    Top = 118
  end
  object dsMO_GroupTo: TDataSource
    DataSet = odsMO_GroupTo
    Left = 358
    Top = 120
  end
  object odsMinZapas: TOracleDataSet
    SQL.Strings = (
      
        'select ROWNUM, a.*, (nvl(a.colvo,0) - nvl(OstMedic,0)) as NeedKo' +
        'lvo from'
      '('
      'SELECT mz.*,'
      '       M.FC_NAME as FC_MEDICNAME,'
      '       EI.FC_NAME as FC_EDIZM,'
      
        '  NVL(MED.PKGMEDKART.GetOstMedic(mz.medicid, SYSDATE, MED.PKG_ME' +
        'DSES.GET_CUR_MOGROUP_BY_CUR_MO),0) as OstMedic'
      '  FROM med.tminzapas mz, MED.TMEDIC M, MED.TEI EI'
      'where mz.MOGROUPID = MED.PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO'
      '  AND MZ.MEDICID = M.MEDICID'
      '  AND M.EIID = EI.eiid(+)'
      'ORDER BY LOWER(M.FC_NAME)'
      ') a'
      'Where (a.colvo - OstMedic) > 0'
      ''
      ''
      ''
      '/*SELECT   ROWNUM,'
      '         t.fk_dpid AS dpid,'
      '         td.fk_id,'
      '         td.fk_medicid AS medicid,'
      '         td.fn_kol AS fn_trebkol,'
      '         m.fc_name AS NAMEKART,'
      '         e.fc_name AS fc_edizm,'
      '         '
      '         ( select nvl(sum(TDPC.FN_KOL),0)'
      '           FROM med.TDPC, med.TKART, med.TMEDIC'
      '           WHERE'
      '            TDPC.kartid = TKART.kartid AND'
      '            TKART.medicid = m.medicid AND'
      '            TMEDIC.medicid = TKART.medicid AND'
      '            TDPC.dpid = :ADPID  ) as FN_KOL'
      '         '
      
        '       FROM MED.TTreb t, MED.TTreb_Dpc td, MED.TMedic m, MED.Tei' +
        ' e'
      '       WHERE '
      '             t.fk_dpid = :ADPID        AND'
      '             td.fk_trebid = t.fk_id    AND '
      '             td.fk_medicid = m.medicid AND'
      '             e.eiid = m.eiid           '
      '*/')
    ReadBuffer = 50
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0400000009000000070000004D45444943494401000000000006000000524F57
      4E554D010000000000020000004944010000000000040000004D4F4944010000
      00000005000000434F4C564F010000000000080000004F53544D454449430100
      00000000090000004E4545444B4F4C564F0100000000000C00000046435F4D45
      4449434E414D450100000000000800000046435F4544495A4D010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 24
    Top = 208
  end
  object dsMinZapas: TDataSource
    DataSet = odsMinZapas
    Left = 108
    Top = 210
  end
  object pmAdd: TPopupMenu
    Left = 80
    Top = 387
    object miUseShtrihcode: TMenuItem
      Caption = #1056#1072#1073#1086#1090#1072' '#1089#1086' '#1096#1090#1088#1080#1093'-'#1082#1086#1076#1072#1084#1080
      OnClick = miUseShtrihcodeClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Action = acInsert
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1079' '#1072#1089#1089#1086#1088#1090#1080#1084#1077#1085#1090#1072
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090
    end
    object N5: TMenuItem
      Action = acInsFromOst
    end
    object N1: TMenuItem
      Action = acInsBySkladOst
    end
  end
  object odsCheckQuota: TOracleDataSet
    SQL.Strings = (
      'select '
      'nvl((SELECT SUM (dp.fn_kol) AS fn_polucheno_po_treb_kol'
      '       '
      'FROM   med.tdocs d,'
      '       med.tdpc dp, '
      '       med.tkart k,'
      '       med.ttreb_dpc td'
      'WHERE d.fp_vidmove = 2 and d.fk_mogroupid_to = :mo_group'
      '  and d.dpid = dp.dpid'
      '  and dp.kartid = k.kartid '
      '  and dp.fk_trebdpc = td.fk_id'
      ''
      '  AND k.medicid = td.fk_medicid  '
      '  and td.fk_medicid = :medicid'
      '  and d.fd_data between tq.fd_date1_min AND tq.fd_date2_max'
      '  GROUP BY td.fk_medicid),0) fn_polucheno_po_treb_kol,'
      '  '
      '  tq.fn_quota_kol'
      'FROM'
      
        '       -- '#1087#1086#1083#1091#1095#1072#1077#1084' '#1089#1087#1080#1089#1086#1082' '#1082#1074#1086#1090' '#1087#1086' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1091', '#1087#1086#1087#1072#1076#1072#1102#1097#1080#1093' '#1074' '#1076#1080#1072#1087 +
        #1072#1079#1086#1085' '#1076#1072#1090
      
        '       (select  sum(tq2.fn_kol) as fn_quota_kol, TRUNC(MIN(tq2.f' +
        'd_date1)) as fd_date1_min, TRUNC(max(tq2.fd_date2)) as fd_date2_' +
        'max,'
      '                tq2.fk_medic_id'
      '        from med.ttreb_quota tq2 '
      
        '        where tq2.fk_mo_group_id = :mo_group and tq2.fk_medic_id' +
        ' = :medicid'
      '          and :pDATE between tq2.fd_date1 and tq2.fd_date2 '
      '        GROUP BY tq2.fk_medic_id ) tq')
    Optimize = False
    Variables.Data = {
      0300000003000000090000003A4D4F5F47524F55500300000000000000000000
      00080000003A4D454449434944030000000000000000000000060000003A5044
      4154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000047524F555049440100000000000800000046435F
      47524F5550010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 348
    Top = 342
  end
end
