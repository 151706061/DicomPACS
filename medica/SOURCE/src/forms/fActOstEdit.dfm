object frmActOstEdit: TfrmActOstEdit
  Left = 147
  Top = 203
  Width = 708
  Height = 451
  BorderIcons = [biSystemMenu]
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1086#1089#1090#1072#1090#1082#1086#1074
  Color = clBtnFace
  Constraints.MinHeight = 330
  Constraints.MinWidth = 450
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'StMedsestra.chm'
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 104
    Top = 204
    Width = 29
    Height = 13
    Caption = #1050#1086#1084#1091':'
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 700
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 40
        Width = 696
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 683
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 60
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Images = dmMain.ilMain
      ShowCaptions = True
      TabOrder = 0
      object btnSave: TToolButton
        Left = 0
        Top = 0
        Action = actSave
        ParentShowHint = False
        ShowHint = True
      end
      object btnCancel: TToolButton
        Left = 60
        Top = 0
        Action = acesc
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 44
    Width = 700
    Height = 131
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      700
      131)
    object Label1: TLabel
      Left = 54
      Top = 10
      Width = 59
      Height = 13
      Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077':'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 18
      Top = 34
      Width = 96
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080':'
    end
    object Label4: TLabel
      Left = 44
      Top = 82
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = #1040#1082#1090' '#1089#1086#1089#1090#1072#1074#1080#1083':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 42
      Top = 105
      Width = 73
      Height = 13
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    end
    object Label8: TLabel
      Left = 7
      Top = 58
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
    object lbInvoice: TLabel
      Left = 122
      Top = 10
      Width = 135
      Height = 13
      Alignment = taRightJustify
      Caption = #1040#1082#1090' '#1074#1074#1086#1076#1072' '#1086#1089#1090#1072#1090#1082#1086#1074' '#8470
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbFrom: TLabel
      Left = 530
      Top = 10
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
    end
    object eNumDoc: TEdit
      Left = 260
      Top = 6
      Width = 262
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnChange = eNumDocChange
    end
    object lcbActMaker: TDBLookupComboBox
      Left = 120
      Top = 78
      Width = 289
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'MOID'
      ListField = 'FC_NAME'
      ListSource = dsActMaker
      TabOrder = 3
    end
    object cePriceDoc: TJvValidateEdit
      Left = 120
      Top = 54
      Width = 518
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfCurrency
      DecimalPlaces = 2
      Enabled = False
      MaxValue = 1E19
      TabOrder = 2
    end
    object deRegistrTime: TDateTimePicker
      Left = 553
      Top = 30
      Width = 85
      Height = 21
      Hint = 'Home - '#1042' '#1085#1072#1095#1072#1083#1086'; End - '#1042' '#1082#1086#1085#1077#1094
      Anchors = [akTop, akRight]
      BiDiMode = bdLeftToRight
      Date = 38678.619581354200000000
      Time = 38678.619581354200000000
      Kind = dtkTime
      ParseInput = True
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object lcbMO_GROUP_TO: TDBLookupComboBox
      Left = 426
      Top = 78
      Width = 213
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'GROUPID'
      ListField = 'FC_GROUP'
      ListSource = dsMO_GroupTo
      TabOrder = 4
    end
    object mComment: TEdit
      Left = 120
      Top = 102
      Width = 518
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 5
    end
    object deRegistrDate: TcxDateEdit
      Left = 120
      Top = 30
      EditValue = 0d
      Properties.DateButtons = [btnNow, btnToday]
      Properties.InputKind = ikMask
      Properties.ShowTime = False
      Style.BorderStyle = ebs3D
      TabOrder = 6
      Width = 403
    end
    object deInvoiceDate: TcxDateEdit
      Left = 553
      Top = 6
      EditValue = 0d
      Properties.DateButtons = [btnNow, btnToday]
      Properties.InputKind = ikMask
      Properties.ShowTime = False
      Style.BorderStyle = ebs3D
      TabOrder = 7
      Width = 85
    end
  end
  object CoolBar2: TCoolBar
    Left = 0
    Top = 175
    Width = 700
    Height = 28
    AutoSize = True
    Bands = <
      item
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 26
        Width = 696
      end>
    EdgeBorders = [ebLeft, ebTop, ebRight]
    object ToolBar2: TToolBar
      Left = 9
      Top = 0
      Width = 683
      Height = 26
      AutoSize = True
      BorderWidth = 1
      ButtonWidth = 104
      Caption = 'ToolBar2'
      EdgeBorders = []
      Flat = True
      Images = dmMain.ilMain
      List = True
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object btnAdd: TToolButton
        Left = 0
        Top = 0
        Action = actAdd
        ParentShowHint = False
        ShowHint = True
      end
      object btnEdit: TToolButton
        Left = 104
        Top = 0
        Action = acedit
        ParentShowHint = False
        ShowHint = True
      end
      object btnDel: TToolButton
        Left = 208
        Top = 0
        Action = actDelete
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 203
    Width = 700
    Height = 221
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object cxGridPrihKart: TcxGrid
      Left = 0
      Top = 0
      Width = 700
      Height = 221
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      object cxGridPrihKartDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsKart
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.KeyFieldNames = 'KARTID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = #1057#1091#1084#1084#1072' 0.00'
            Kind = skSum
            FieldName = 'FN_SUMM'
            Column = cxGridPrihKartDBTableView1FN_SUMM
          end>
        DataController.Summary.SummaryGroups = <>
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        OptionsBehavior.IncSearch = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        Preview.AutoHeight = False
        Preview.MaxLineCount = 2
        Styles.ContentEven = dmMain.cxStyleGridEvenRow
        Styles.ContentOdd = dmMain.cxStyleGridOddRow
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        object cxGridPrihKartDBTableView1ROWNUM: TcxGridDBColumn
          Caption = #8470' '#1087'/'#1087
          DataBinding.FieldName = 'ROWNUM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Width = 59
        end
        object cxGridPrihKartDBTableView1NAMEKART: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
          DataBinding.FieldName = 'NAMEKART'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 255
          Properties.ReadOnly = True
          MinWidth = 130
          Options.Editing = False
          Width = 169
        end
        object cxGridPrihKartDBTableView1FN_PARTY_NUM: TcxGridDBColumn
          Caption = #8470' '#1087#1072#1088#1090#1080#1080
          DataBinding.FieldName = 'FN_PARTY_NUM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Width = 74
        end
        object cxGridPrihKartDBTableView1FC_SERIAL: TcxGridDBColumn
          DataBinding.FieldName = 'FC_SERIAL'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 50
          Properties.ReadOnly = True
          Width = 101
        end
        object cxGridPrihKartDBTableView1lkeiname: TcxGridDBColumn
          Caption = #1045#1076'. '#1080#1079#1084'.'
          DataBinding.FieldName = 'lkeiname'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 20
          Properties.ReadOnly = True
          Options.Editing = False
          Width = 71
        end
        object cxGridPrihKartDBTableView1FN_KOL: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086':'
          DataBinding.FieldName = 'FN_KOL'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxValue = 100000000.000000000000000000
          Properties.ReadOnly = True
          MinWidth = 53
          Width = 61
        end
        object cxGridPrihKartDBTableView1FN_PRICE: TcxGridDBColumn
          DataBinding.FieldName = 'FN_PRICE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00'#1088#39'.'#39';-,0.00'#1088#39'.'#39
          Properties.Nullable = False
          Properties.ReadOnly = True
          Options.Editing = False
          Width = 79
        end
        object cxGridPrihKartDBTableView1FN_SUMM: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072':'
          DataBinding.FieldName = 'FN_SUMM'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00'#1088#39'.'#39';-,0.00'#1088#39'.'#39
          Properties.Nullable = False
          Properties.ReadOnly = True
          Options.Editing = False
          Width = 84
        end
      end
      object cxGridPrihKartLevel1: TcxGridLevel
        GridView = cxGridPrihKartDBTableView1
      end
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 424
    Top = 24
    object actSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 9
      ShortCut = 113
      OnExecute = actSaveExecute
      OnUpdate = actSaveUpdate
    end
    object acesc: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 8
      ShortCut = 32883
      OnExecute = acescExecute
    end
    object actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091
      ImageIndex = 21
      ShortCut = 115
      OnExecute = actAddExecute
      OnUpdate = actAddUpdate
    end
    object acedit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091
      ImageIndex = 3
      ShortCut = 114
      OnExecute = aceditExecute
      OnUpdate = aceditUpdate
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091
      ImageIndex = 22
      ShortCut = 119
      OnExecute = actDeleteExecute
      OnUpdate = actDeleteUpdate
    end
    object acrefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
    end
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 49232
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 16397
      OnExecute = Action2Execute
    end
  end
  object odsActMaker: TOracleDataSet
    SQL.Strings = (
      'SELECT MOID,FC_NAME FROM MED.TMO'
      'ORDER BY FC_NAME')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000040000004D4F49440100000000000700000046435F4E414D
      45010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 192
    Top = 144
    object odsActMakerMOID: TIntegerField
      FieldName = 'MOID'
      Required = True
    end
    object odsActMakerFC_NAME: TStringField
      FieldName = 'FC_NAME'
      Required = True
      Size = 50
    end
  end
  object dsActMaker: TDataSource
    DataSet = odsActMaker
    Left = 264
    Top = 144
  end
  object odsKart: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWNUM, A.* FROM ('
      'SELECT /*+ RULE*/'
      '  '#9'TDPC.ROWID,'
      #9'TDPC.DPCID,'
      
        #9'TMedic.fc_name as NAMEKART, -- '#1087#1086#1076#1089#1090#1072#1074#1072'. '#1088#1072#1085#1100#1096#1077' '#1079#1076#1077#1089#1100' '#1086#1090#1086#1073#1088#1072#1078#1072#1083 +
        #1072#1089#1100' '#1080#1084#1103' '#1082#1072#1088#1090#1086#1095#1082#1080', '#1090#1077#1087#1077#1088#1100' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
      #9'TKART.MEDICID,'
      #9'TKART.FN_PARTY_NUM,'
      '       TKART.FD_GODEN,'
      #9'TDPC.FN_KOL, (TKART.FN_PRICE*TDPC.FN_KOL) as FN_SUMM,'
      #9'--TDPC.FN_SUMM,'
      
        '--  DECODE(TDPC.FN_KOL,0,0,ROUND(TDPC.FN_SUMM / TDPC.FN_KOL,2)) ' +
        'AS FN_PRICE,'
      '       TKART.FN_PRICE,'#9
      '       TKART.KARTID,'
      '--'#9'TKART.FC_NAME AS NAMEKART,'
      '       TKART.FC_SERIAL '
      'FROM'
      #9'MED.TDPC, MED.TKART, MED.TMedic'
      'WHERE'
      #9'DPID = :ADPID AND'
      '    TDPC.KARTID = TKART.KARTID'
      #9'AND TKART.FL_DEL = 0'
      #9'and tmedic.medicid = TKART.medicid'
      'ORDER BY TDPC.DPCID'
      '/*ORDER BY NAMEKART*/) A')
    Variables.Data = {0300000001000000060000003A4144504944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B000000080000004E414D454B415254010000000000060000004B41
      5254494401000000000006000000464E5F4B4F4C010000000000070000004D45
      444943494401000000000005000000445043494401000000000007000000464E
      5F53554D4D01000000000006000000524F574E554D0100000000000900000046
      435F53455249414C01000000000008000000464E5F5052494345010000000000
      0C000000464E5F50415254595F4E554D0100000000000800000046445F474F44
      454E010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 56
    Top = 248
    object odsKartDPCID: TFloatField
      FieldName = 'DPCID'
      Required = True
    end
    object odsKartMEDICID: TIntegerField
      FieldName = 'MEDICID'
      Required = True
    end
    object odsKartFN_KOL: TFloatField
      FieldName = 'FN_KOL'
    end
    object odsKartFN_SUMM: TFloatField
      FieldName = 'FN_SUMM'
    end
    object odsKartKARTID: TIntegerField
      FieldName = 'KARTID'
      Required = True
    end
    object odsKartNAMEKART: TStringField
      FieldName = 'NAMEKART'
      Size = 255
    end
    object odsKartlkeiname: TStringField
      FieldKind = fkLookup
      FieldName = 'lkeiname'
      LookupDataSet = odsMedic
      LookupKeyFields = 'MEDICID'
      LookupResultField = 'FC_NAME'
      KeyFields = 'MEDICID'
      Lookup = True
    end
    object odsKartROWNUM: TFloatField
      DisplayLabel = #8470
      FieldName = 'ROWNUM'
    end
    object odsKartFC_SERIAL: TStringField
      DisplayLabel = #1057#1077#1088'. '#8470
      FieldName = 'FC_SERIAL'
      Size = 50
    end
    object odsKartFN_PRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072':'
      FieldName = 'FN_PRICE'
    end
    object odsKartFN_PARTY_NUM: TFloatField
      FieldName = 'FN_PARTY_NUM'
    end
  end
  object dsKart: TDataSource
    DataSet = odsKart
    Left = 8
    Top = 248
  end
  object odsMedic: TOracleDataSet
    SQL.Strings = (
      'select /*+rule*/'
      '    tmedic.medicid,'
      '    tei.fc_name'
      '  from MED.tmedic, MED.tei'
      '  where tei.eiid=tmedic.eiid'
      '    AND TMEDIC.FL_VISIBLE = 1')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000046435F4E414D45010000000000070000004D4544
      49434944010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 104
    Top = 248
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmActOstEdit\'
    StoredValues = <>
    Left = 416
    Top = 308
  end
  object dsMO_GroupTo: TDataSource
    DataSet = odsMO_GroupTo
    Left = 652
    Top = 142
  end
  object odsMO_GroupTo: TOracleDataSet
    SQL.Strings = (
      'SELECT gr.groupid, gr.fc_group'
      '  FROM med.tmo_group gr'
      'where '
      '  gr.fl_del = 0'
      'ORDER BY LOWER(gr.fc_group)')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000047524F555049440100000000000800000046435F
      47524F5550010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 600
    Top = 140
  end
end
