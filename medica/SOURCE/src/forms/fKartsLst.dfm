object frmKartsLst: TfrmKartsLst
  Left = 327
  Top = 308
  Width = 885
  Height = 353
  Caption = #1057#1087#1080#1089#1086#1082' '#1082#1072#1088#1090#1086#1095#1077#1082' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074
  Color = clBtnFace
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 296
    Width = 877
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    AutoSnap = False
    MinSize = 100
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 877
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 40
        Width = 877
      end>
    EdgeBorders = [ebTop]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 864
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 56
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton8: TToolButton
        Left = 0
        Top = 0
        Action = acSelect
      end
      object ToolButton9: TToolButton
        Left = 56
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton6: TToolButton
        Left = 64
        Top = 0
        Action = acRefresh
      end
      object ToolButton7: TToolButton
        Left = 120
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 128
        Top = 0
        Action = acClose
      end
    end
  end
  object paMedKart: TPanel
    Left = 0
    Top = 42
    Width = 877
    Height = 254
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object dbg: TcxGrid
      Left = 0
      Top = 0
      Width = 877
      Height = 254
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      object dbgDBTableView1: TcxGridDBTableView
        OnDblClick = dbgDblClick
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsMedKart
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.OnChanged = cxGrid1DBTableView1DataControllerFilterChanged
        DataController.Filter.Active = True
        DataController.KeyFieldNames = 'KARTID'
        DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        Preview.MaxLineCount = 2
        Styles.ContentEven = dmMain.cxStyleGridEvenRow
        Styles.ContentOdd = dmMain.cxStyleGridOddRow
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        object dbgDBTableView1FC_NAME1: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_NAME'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 255
          Properties.ReadOnly = True
          SortIndex = 0
          SortOrder = soAscending
          Width = 225
        end
        object dbgDBTableView1FC_EANCODE1: TcxGridDBColumn
          Caption = #1050#1086#1076' EAN'
          DataBinding.FieldName = 'FC_EANCODE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 100
          Properties.ReadOnly = True
          Visible = False
          Width = 20
        end
        object dbgDBTableView1FC_SERIAL1: TcxGridDBColumn
          Caption = #1057#1077#1088'. '#8470
          DataBinding.FieldName = 'FC_SERIAL'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 50
          Properties.ReadOnly = True
          Width = 38
        end
        object dbgDBTableView1FD_GODEN1: TcxGridDBColumn
          Caption = #1043#1086#1076#1077#1085' '#1076#1086
          DataBinding.FieldName = 'FD_GODEN'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Width = 55
        end
        object dbgDBTableView1FC_UEDIZM1: TcxGridDBColumn
          Caption = #1059#1087'.'#1077#1076'.'#1080#1079#1084
          DataBinding.FieldName = 'FC_UEDIZM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 1024
          Properties.ReadOnly = True
          Width = 51
        end
        object dbgDBTableView1FC_MEDICTYPENAME1: TcxGridDBColumn
          Caption = #1058#1080#1087' '#1086#1073#1098#1077#1082#1090#1072' '#1091#1095#1077#1090#1072
          DataBinding.FieldName = 'FC_MEDICTYPENAME'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 100
          Properties.ReadOnly = True
          Width = 52
        end
        object dbgDBTableView1FC_PAYTYPE1: TcxGridDBColumn
          Caption = #1058#1080#1087' '#1086#1087#1083#1072#1090#1099
          DataBinding.FieldName = 'FC_PAYTYPE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 100
          Properties.ReadOnly = True
          Width = 58
        end
        object dbgDBTableView1FC_MEDIC1: TcxGridDBColumn
          Caption = #1052#1077#1076#1080#1082#1072#1084#1077#1085#1090
          DataBinding.FieldName = 'FC_MEDIC'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 255
          Properties.ReadOnly = True
          Width = 57
        end
        object dbgDBTableView1FC_MONAME1: TcxGridDBColumn
          Caption = #1052#1072#1090'. '#1086#1090#1074'.'
          DataBinding.FieldName = 'FC_MONAME'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 50
          Properties.ReadOnly = True
          Width = 61
        end
        object dbgDBTableView1FN_FPACKINUPACK1: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086' '#1092#1072#1089'. '#1074' '#1091#1087#1072#1082'.'
          DataBinding.FieldName = 'FN_FPACKINUPACK'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Width = 50
        end
        object dbgDBTableView1FC_FEDIZM1: TcxGridDBColumn
          Caption = #1060#1072#1089'.'#1077#1076'.'#1080#1079#1084
          DataBinding.FieldName = 'FC_FEDIZM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 1024
          Properties.ReadOnly = True
          Width = 26
        end
        object dbgDBTableView1KARTID1: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1082#1072#1088#1090'.'
          DataBinding.FieldName = 'KARTID'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Width = 20
        end
      end
      object dbgLevel1: TcxGridLevel
        GridView = dbgDBTableView1
      end
    end
  end
  object paOst: TPanel
    Left = 0
    Top = 301
    Width = 877
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      877
      25)
    object StaticText1: TStaticText
      Left = 0
      Top = 0
      Width = 58
      Height = 17
      Hint = #1042' '#1091#1087#1072#1091#1082#1086#1074#1086#1095#1085#1099#1093' '#1077#1076'. '#1080#1079#1084'. ('#1074' '#1092#1072#1089#1086#1074#1086#1095#1085#1099#1093' '#1077#1076'. '#1080#1079#1084'.)'
      Caption = 'StaticText1'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object cbShowNulls: TCheckBox
      Left = 699
      Top = -1
      Width = 174
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1085#1091#1083#1077#1074#1099#1077' '#1086#1089#1090#1072#1090#1082#1080
      TabOrder = 0
      OnClick = cbShowNullsClick
    end
  end
  object al: TActionList
    Left = 312
    Top = 112
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      ImageIndex = 1
      ShortCut = 16499
      OnExecute = acCloseExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 15
      ShortCut = 116
      OnExecute = acRefreshExecute
    end
    object acSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 30
      ShortCut = 13
      OnExecute = acSelectExecute
    end
  end
  object odsMedKart: TOracleDataSet
    SQL.Strings = (
      '/*run time*/'
      'SELECT  '
      '    KARTID,'
      '    fn_party_num,'
      '    FC_SERIAL,  '
      '    trunc(FD_GODEN) as FD_GODEN,  '
      '    FC_UEDIZM,  '
      '    1  AS FN_KOL,  '
      '    MOID  AS M,  '
      '    TRUNC(SYSDATE + 1) AS D,  '
      '/*'#9'1      AS FN_PRICE,  */'
      '    FC_MEDIC,  '
      '    FC_NAME,  '
      '    MEDICID,  '
      '    FC_MONAME,'
      '    FC_EANCODE,'
      '    FK_MEDICTYPENAME,'
      '    FC_MEDICTYPENAME,'
      '    FK_PAYTYPE,'
      '    FC_PAYTYPE,'
      '    FN_FPACKINUPACK,'
      '    FK_FPACKID,'
      '    FC_FEDIZM,'
      '    FN_KOLOST,'
      '    FN_PRICE  '
      '  FROM MED.VMEDKART_VS_OST'
      '/*VALLMEDKART*/'
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000150000000700000046435F4E414D450100000000000800000046435F
      4D454449430100000000000800000046445F474F44454E010000000000090000
      0046435F53455249414C01000000000006000000464E5F4B4F4C010000000000
      060000004B4152544944010000000000070000004D4544494349440100000000
      0008000000464E5F5052494345010000000000010000004D0100000000000100
      0000440100000000000900000046435F4D4F4E414D450100000000000A000000
      46435F45414E434F444501000000000010000000464B5F4D4544494354595045
      4E414D450100000000001000000046435F4D45444943545950454E414D450100
      000000000A000000464B5F504159545950450100000000000A00000046435F50
      4159545950450100000000000900000046435F554544495A4D0100000000000F
      000000464E5F465041434B494E555041434B0100000000000A000000464B5F46
      5041434B49440100000000000900000046435F464544495A4D01000000000009
      000000464E5F4B4F4C4F5354010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 192
    Top = 112
    object odsMedKartKARTID: TFloatField
      FieldName = 'KARTID'
    end
    object odsMedKartFC_SERIAL: TStringField
      FieldName = 'FC_SERIAL'
      Size = 50
    end
    object odsMedKartFD_GODEN: TDateTimeField
      FieldName = 'FD_GODEN'
    end
    object odsMedKartFC_UEDIZM: TStringField
      FieldName = 'FC_UEDIZM'
      Size = 1024
    end
    object odsMedKartFN_KOL: TFloatField
      FieldName = 'FN_KOL'
    end
    object odsMedKartM: TFloatField
      FieldName = 'M'
    end
    object odsMedKartD: TDateTimeField
      FieldName = 'D'
    end
    object odsMedKartFC_MEDIC: TStringField
      FieldName = 'FC_MEDIC'
      Size = 255
    end
    object odsMedKartFC_NAME: TStringField
      FieldName = 'FC_NAME'
      Size = 255
    end
    object odsMedKartMEDICID: TFloatField
      FieldName = 'MEDICID'
    end
    object odsMedKartFC_MONAME: TStringField
      FieldName = 'FC_MONAME'
      Size = 50
    end
    object odsMedKartFC_EANCODE: TStringField
      FieldName = 'FC_EANCODE'
      Size = 100
    end
    object odsMedKartFK_MEDICTYPENAME: TFloatField
      FieldName = 'FK_MEDICTYPENAME'
    end
    object odsMedKartFC_MEDICTYPENAME: TStringField
      FieldName = 'FC_MEDICTYPENAME'
      Size = 100
    end
    object odsMedKartFK_PAYTYPE: TFloatField
      FieldName = 'FK_PAYTYPE'
    end
    object odsMedKartFC_PAYTYPE: TStringField
      FieldName = 'FC_PAYTYPE'
      Size = 100
    end
    object odsMedKartFN_FPACKINUPACK: TFloatField
      FieldName = 'FN_FPACKINUPACK'
    end
    object odsMedKartFK_FPACKID: TFloatField
      FieldName = 'FK_FPACKID'
    end
    object odsMedKartFC_FEDIZM: TStringField
      FieldName = 'FC_FEDIZM'
      Size = 1024
    end
    object odsMedKartFN_KOLOST: TFloatField
      FieldName = 'FN_KOLOST'
    end
    object odsMedKartFN_PRICE: TFloatField
      FieldName = 'FN_PRICE'
    end
  end
  object dsMedKart: TDataSource
    DataSet = odsMedKart
    Left = 336
    Top = 200
  end
end
