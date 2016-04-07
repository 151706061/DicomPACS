object frmNazParamRegist: TfrmNazParamRegist
  Left = 425
  Top = 132
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
  ClientHeight = 435
  ClientWidth = 531
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 525
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 525
    Height = 117
    Margins.Top = 0
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label3: TLabel
      Left = 7
      Top = 82
      Width = 41
      Height = 16
      Caption = #1042#1088#1077#1084#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 7
      Top = 6
      Width = 53
      Height = 16
      Caption = #1050#1072#1073#1080#1085#1077#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 7
      Top = 40
      Width = 34
      Height = 16
      Caption = #1044#1072#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cxteTime: TcxTimeEdit
      Left = 72
      Top = 82
      EditValue = 0.000000000000000000
      Properties.TimeFormat = tfHourMin
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 0
      Width = 69
    end
    object cxlcRoom: TcxLookupComboBox
      Left = 72
      Top = 5
      Hint = #1043#1088#1091#1087#1087#1099' '#1076#1080#1072#1075#1085#1086#1079#1086#1074
      Properties.AutoSelect = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.HideSelection = False
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsKab
      Properties.ReadOnly = False
      Properties.OnChange = cxlcRoomPropertiesChange
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      Width = 215
    end
    object Panel3: TPanel
      Left = 72
      Top = 32
      Width = 327
      Height = 40
      AutoSize = True
      BevelInner = bvLowered
      TabOrder = 2
      object p1: TPanel
        Left = 52
        Top = 21
        Width = 17
        Height = 17
        BevelInner = bvLowered
        TabOrder = 0
        OnClick = p1Click
      end
      object p2: TPanel
        Left = 69
        Top = 21
        Width = 17
        Height = 17
        BevelInner = bvLowered
        TabOrder = 1
        OnClick = p2Click
      end
      object p3: TPanel
        Left = 86
        Top = 21
        Width = 17
        Height = 17
        BevelInner = bvLowered
        TabOrder = 2
        OnClick = p3Click
      end
      object p4: TPanel
        Left = 103
        Top = 21
        Width = 17
        Height = 17
        BevelInner = bvLowered
        TabOrder = 3
        OnClick = p4Click
      end
      object p5: TPanel
        Left = 120
        Top = 21
        Width = 17
        Height = 17
        BevelInner = bvLowered
        TabOrder = 4
        OnClick = p5Click
      end
      object p6: TPanel
        Left = 137
        Top = 21
        Width = 17
        Height = 17
        BevelInner = bvLowered
        TabOrder = 5
        OnClick = p6Click
      end
      object p7: TPanel
        Left = 154
        Top = 21
        Width = 17
        Height = 17
        BevelInner = bvLowered
        TabOrder = 6
        OnClick = p7Click
      end
      object blWeeks: TButton
        Left = 27
        Top = 21
        Width = 25
        Height = 17
        Hint = #1053#1072' '#1076#1077#1085#1100' '#1085#1072#1079#1072#1076
        Caption = '<'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = blWeeksClick
      end
      object blMon: TButton
        Left = 2
        Top = 21
        Width = 25
        Height = 17
        Hint = #1053#1072' '#1084#1077#1089#1103#1094' '#1085#1072#1079#1072#1076
        Caption = '<<'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = blMonClick
      end
      object brWeeks: TButton
        Left = 171
        Top = 21
        Width = 25
        Height = 17
        Hint = #1053#1072' '#1076#1077#1085#1100' '#1074#1087#1077#1088#1105#1076
        Caption = '>'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = brWeeksClick
      end
      object brMon: TButton
        Left = 196
        Top = 21
        Width = 25
        Height = 17
        Hint = #1053#1072' '#1084#1077#1089#1103#1094' '#1074#1087#1077#1088#1105#1076
        Caption = '>>'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = brMonClick
      end
      object pMonth: TPanel
        Left = 2
        Top = 2
        Width = 219
        Height = 19
        BevelInner = bvLowered
        Color = clSkyBlue
        ParentBackground = False
        TabOrder = 11
      end
      object cxdeDate: TcxDateEdit
        Left = 223
        Top = 7
        ParentFont = False
        Properties.ButtonGlyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000F00A0000F00A00000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000000A6
          3300A43400000000000000000000000000000000000000000000000000000000
          000000000000000000000000AB3300E07700E47B00AB32000000000000000000
          00000000000000000000000000000000000000000000000000B03800CC6300FC
          9600FF9C00D46C00B13600000000000000000000000000000000000000000000
          000000000000BE4100C4610AEB8806E98200EE8800FA9400CF6600BC40000000
          00000000000000000000000000000000000000C64800C06015E08928DE7D10CE
          6902D16B00E88200F48E00C86100C74B00000000000000000000000000000000
          CE5000C1631BD98F46D68330CD7119A94400A64200D16B00E17B00EB8500C95E
          00CE5300000000000000000000C95200C36821D89A66D38C4FCC7C34B94E00BA
          3800CC5100B64E00D06D05DC7807E4830AC66106CA5600000000000000BA5300
          D8A987D39A72CE884FBF5500D15D00000000000000DE5000BE5600D17419DA81
          21E08B28B95200000000000000D25B00CA6D18D29B75C65D00EB6C0000000000
          0000000000000000E65D00C55D00D38232CB650BD45F00000000000000000000
          DD6A00C75E00D76B00000000000000000000000000000000000000DC6500C762
          00E06C0000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnChange = cxdeDatePropertiesChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 12
        Width = 102
      end
    end
    object cbKonsult: TcxCheckBox
      Left = 343
      Top = 5
      Caption = #1050#1086#1085#1089#1091#1083#1100#1090#1072#1090#1080#1074#1085#1072#1103' '#1091#1089#1083#1091#1075#1072
      Properties.ImmediatePost = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 3
      Width = 161
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 154
    Width = 531
    Height = 281
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 6
    object cxGrid1: TcxGrid
      AlignWithMargins = True
      Left = 3
      Top = 0
      Width = 525
      Height = 278
      Margins.Top = 0
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      object TVTIME: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsTime
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnSorting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object VTIMENAZ: TcxGridDBColumn
          Caption = #1042#1088#1077#1084#1103
          DataBinding.FieldName = 'TIMENAZ'
          Options.Editing = False
          Width = 45
        end
        object VFIO: TcxGridDBColumn
          Caption = #1060#1048#1054
          DataBinding.FieldName = 'FIOPAC'
          Width = 144
        end
        object VNAMEISSL: TcxGridDBColumn
          Caption = #1052#1077#1090#1086#1076#1080#1082#1072
          DataBinding.FieldName = 'FC_NAME'
          Width = 269
        end
        object VTIMEISSL: TcxGridDBColumn
          Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100'('#1084#1080#1085'.)'
          DataBinding.FieldName = 'TIMEISL'
          Options.Editing = False
          Width = 117
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = TVTIME
      end
    end
  end
  object BM: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102)
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 72
    Top = 208
    DockControlHeights = (
      0
      0
      0
      0)
    object BMBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'OKCancel'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 404
      FloatTop = 344
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbSave'
        end
        item
          Visible = True
          ItemName = 'bbCancel'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'OKCancel'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbSave: TdxBarButton
      Action = acOk
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbCancel: TdxBarButton
      Action = acCancel
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object alOkCancel: TActionList
    Images = frmMain.ilMain
    Left = 128
    Top = 194
    object acOk: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 23
      ShortCut = 113
      OnExecute = acOkExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 22
      ShortCut = 27
      OnExecute = acCancelExecute
    end
  end
  object dsKab: TDataSource
    DataSet = odsKab
    Left = 246
    Top = 153
  end
  object odsKab: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT KAB.FK_ID, KAB.FC_NAME, KAB.FN_ORDER '
      '  FROM TNAZVRACH NAZ, TKABINET KAB'
      'WHERE FK_SOTRID = :PSOTR'
      '  AND NAZ.FK_KABINETID = KAB.FK_ID'
      'ORDER BY KAB.FN_ORDER'
      ''
      ''
      '')
    Optimize = False
    Variables.Data = {0300000001000000060000003A50534F5452030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsKabBeforeOpen
    Left = 210
    Top = 153
  end
  object odsTime: TOracleDataSet
    SQL.Strings = (
      'SELECT TO_CHAR(FD_RUN, '#39'HH24:MI'#39') AS TIMENAZ,'
      
        '       (SELECT FC_TIME FROM TSMID WHERE FK_ID = ISL.FK_SMID) AS ' +
        'TIMEISL,'
      '       PKG_REGIST_PACFUNC.GET_PAC_FIO(FK_PACID) FIOPAC,'
      '       GET_NAME_RGISSL(ISL.FK_SMID) AS FC_NAME '
      '  FROM TNAZIS ISL'
      ' WHERE FK_ROOMID = :PFK_ROOMID'
      '   AND FD_RUN >= :PFD_DATE AND FD_RUN < TO_DATE(:PFD_DATE)+1'
      '   AND FK_NAZSOSID <> GET_NAZCANCEL'
      'ORDER BY TIMENAZ')
    Optimize = False
    Variables.Data = {
      03000000020000000B0000003A50464B5F524F4F4D4944030000000000000000
      000000090000003A5046445F444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000700000054494D4549534C0100000000000700000054494D
      454E415A0100000000000600000046494F504143010000000000070000004643
      5F4E414D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 248
    Top = 241
  end
  object dsTime: TDataSource
    DataSet = odsTime
    Left = 248
    Top = 193
  end
end
