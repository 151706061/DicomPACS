object frmMain: TfrmMain
  Left = 254
  Top = 108
  Caption = #1042#1086#1079#1088#1072#1089#1090#1085#1086#1081' '#1086#1090#1095#1077#1090' '#1087#1086' '#1092#1083#1102#1086#1088#1086#1075#1088#1072#1092#1080#1080
  ClientHeight = 473
  ClientWidth = 963
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 957
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object paParam: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 957
    Height = 93
    Margins.Top = 0
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    Visible = False
    object Splitter1: TSplitter
      Left = 603
      Top = 2
      Height = 89
      Color = clBlack
      ParentColor = False
      Visible = False
      ExplicitLeft = 376
      ExplicitTop = 16
      ExplicitHeight = 100
    end
    object paMainParam: TPanel
      Left = 2
      Top = 2
      Width = 601
      Height = 89
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object cxLabel1: TcxLabel
        Left = 11
        Top = 27
        Caption = #1042#1086#1079#1088#1072#1089#1090' '#1089':'
      end
      object cxLabel2: TcxLabel
        Left = 11
        Top = 4
        Caption = #1055#1077#1088#1080#1086#1076' c:'
      end
      object lbDateBeg: TcxLabel
        Left = 93
        Top = 4
        Caption = 'DateBeg'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object cxLabel3: TcxLabel
        Left = 161
        Top = 4
        Caption = #1087#1086':'
      end
      object lbDateEnd: TcxLabel
        Left = 186
        Top = 4
        Caption = 'DateEnd'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object lbAgeStart: TcxLabel
        Left = 93
        Top = 27
        Caption = 'AgeStart'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object cxLabel8: TcxLabel
        Left = 161
        Top = 27
        Caption = #1087#1086':'
      end
      object lbAgeEnd: TcxLabel
        Left = 186
        Top = 27
        Caption = 'AgeEnd'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object cxLabel7: TcxLabel
        Left = 262
        Top = 27
        Caption = #1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100':'
      end
      object cxLabel9: TcxLabel
        Left = 262
        Top = 4
        Caption = #1055#1088#1086#1078#1080#1074#1072#1077#1090':'
      end
      object lbProj: TcxLabel
        Left = 356
        Top = 4
        Caption = 'Proj'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object lbNat: TcxLabel
        Left = 356
        Top = 27
        Caption = 'National'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object cxLabel10: TcxLabel
        Left = 11
        Top = 50
        Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099':'
      end
      object lbWork: TcxLabel
        Left = 93
        Top = 50
        Caption = 'Work'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object cxLabel11: TcxLabel
        Left = 11
        Top = 70
        Caption = #1059#1095#1072#1089#1090#1086#1082':'
      end
      object lbUch: TcxLabel
        Left = 93
        Top = 70
        Caption = 'Uch'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
    end
    object paSubParam: TPanel
      Left = 606
      Top = 2
      Width = 349
      Height = 89
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      Visible = False
      object Animator1: TJvGIFAnimator
        Left = 6
        Top = 4
        Width = 50
        Height = 46
        Image.Data = {
          8905000047494638396132002E00B30000FFFFFFEFEFEFD6D6D65A5A5A4A4A4A
          3939392929291010108C948C636B63ADBDB5BDCEC69CA5A57B84846B73730000
          0021FF0B4E45545343415045322E300301E8030021F90400070000002C000000
          0032002E000004FB10C849672085E814AAFF60F8098622088BD1896C2B0502A5
          10F0A95A48ECEE409018880982B35808080BC94243D0F14401C7004170042E0D
          9431D108280CD946C1F9F4F8068A85C28129988A020693711238C6E50FA2A056
          A411086F45466A8446016E791E02050C7E7E8391835A700D348A1E0C258F8F93
          94930C78981E969C697E8E8E925F0AA31F298E907414010C915F2BAE57010BA5
          0AA9B93285470969578A766D04080B0C8E64B469456B091A7C79290DB17E81AD
          21A7D283A24FACA6DA492102A68F06E8E425CECE0A0D6922E09C0BE33C29EB0E
          8E22B6200DD2E48E8780031BE8CD43C02018AD58CD06142860A0804317BC1420
          10538CFB81033F2052F9A962E2A2A200061C3528B62098975FA86EB8AA90A2DB
          808E0A32FE62F88800839914487C94E72001A07808FC710A050DD3119FF15249
          4990C041375352729974B1C7194F79A838F184A9A0000218F5262C60E6824483
          3E7B0C2CFB956A40C5AB03682C1890558280010D06140C51534083035912A021
          DAE44BB19B1DF66AE4E0235082C184E526025096EE8C9F3D7E5C02B0D7D9CA06
          DA1424684AD881932FF1CA923161210103860EFC315C3D0AA53C4DD0D49DD87B
          342A830101FF95A9C8BC40850003A253B59D543AEEAA0E0263863289B68C650D
          0001428E820197A8AA41037D41800B6A048269193D4A756BEFD3491B78283D89
          84C37A3DCBD86646237CFDF7412D5314B3C83245D9A70B55A865478A55802868
          2000C43490DB4AEAD5025E78F079F3DF0C1B45B8926DE61180DA7BE6A9B7DE05
          4CE4955D6E1B524140747939884C1A025CB0E18AD935D1C331173EA7629005AC
          185F91201CA1215F72A08606934D9A555507960CE1229516E435402E965CC6E5
          812DD1D2E398FF45000021F90400070000002C0000000032002E000004FB10C8
          496550553051BBFFA0B52084814D0D51244A10BEF0A2368B62B88052284B530C
          1C98B0635B040481410310203404C8852138AC02048685402B4534805B818260
          2D03088AAD169168A417DA86C36C95ABB550385CB0A3E0E8160E1B120309777A
          880B0508010B0C2954740C050404032A3C899A3A9409080308804C040C358FA5
          7A5B0AAB70990AA80208057F6563ABACB7A648018D3CACAD3C7D744A35B7C691
          1262C5C60B09647409050CC6B91FD4BE0E06A1800C060ED40CB415A5AC080603
          0BA2C9033BAFAB21D4060CEA7EF20A08EF20C6DDE28001E6D3F09DF8306D9A0E
          07FDAAB810C04E208269F0181854106D60997F2BF6B949E7A1FB86C05BB210D2
          21F04DA244050E1E22BB72EF232B070312C298F4EAE4AB04065DF05AC5E0DBB5
          1D325F60F968904102413C5739F0E9655A8F01EA60A6306040DA2B0704DAC06C
          C3B36A014A8BD449F1D4C281B48208BC089C469289A32713FEB9B1428BA6C97D
          2795E8C3191350D69AF79CB939F9C50F8506F8BEC50D9A6191C96E9EE43DBEE1
          F668BA0038197861621488101B132FB9C07AB21B86269A8F2210F450C9D1D442
          0494F099259901C4030C10E080D9249B06261B7892E86089900BD1BC51E856C0
          0192090A06687EA819B1C4B424560A65E4279C870688D31692E329AD277A163E
          0460408A0D15866985A1EFA021C16B7415C6AC56DD9562BE04F6E57931470549
          60E7051AFE01208717E0C9D141120D3E749E7F3A1CD5605F7E28E1450203E097
          A018C2B5215D05C291000A470952101D782CF022C017E01580628A712D254788
          8514D7600234E6E744713A36085E7108F6C8C4003A9A8524912BEC68E491F639
          21C38D048C60C9518CA9231B0D121CE5401BC92096253DB4E83780454F821000
          25048C9926003568574104003B}
      end
      object cxLabel6: TcxLabel
        Left = 67
        Top = 4
        Caption = '_'
      end
      object cxLabel5: TcxLabel
        Left = 67
        Top = 27
        Caption = '_'
      end
      object cxLabel4: TcxLabel
        Left = 119
        Top = 4
        Caption = #1042#1099#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1079#1072#1087#1088#1086#1089' '#1082' '#1041#1072#1079#1077' '#1044#1072#1085#1085#1099#1093'...'
      end
    end
  end
  object cxGr: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 135
    Width = 957
    Height = 335
    Margins.Top = 0
    Align = alClient
    PopupMenu = pmTV
    TabOrder = 6
    LookAndFeel.Kind = lfFlat
    object TV: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = VFIOPAC
        end
        item
          Kind = skSum
        end
        item
          Kind = skSum
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object VFIOPAC: TcxGridColumn
        Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
        VisibleForCustomization = False
      end
      object VFD_ROJD: TcxGridColumn
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
      end
      object VAGE: TcxGridColumn
        Caption = #1042#1086#1079#1088#1072#1089#1090
      end
      object VFD_RUN: TcxGridColumn
        Caption = #1044#1072#1090#1072' '#1074#1099#1087'.'
        VisibleForCustomization = False
      end
      object VNUM: TcxGridColumn
        Caption = #8470' '#1080#1089#1089#1083'.'
      end
      object VNAME: TcxGridColumn
        Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
        VisibleForCustomization = False
      end
      object VFK_ID: TcxGridColumn
        Visible = False
        VisibleForCustomization = False
      end
      object VFK_NAZSOSID: TcxGridColumn
        Visible = False
        VisibleForCustomization = False
      end
      object VFD_RUN_TIME: TcxGridColumn
        Visible = False
        VisibleForCustomization = False
      end
      object VREGION: TcxGridColumn
        Caption = #1055#1088#1086#1078#1080#1074#1072#1077#1090
      end
      object VNATIONAL: TcxGridColumn
        Caption = #1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100
      end
      object VDOZA: TcxGridColumn
        Caption = #1044#1086#1079#1072
        Visible = False
        VisibleForCustomization = False
      end
      object VMED: TcxGridColumn
        Caption = #1052#1077#1076#1088#1072#1073#1086#1090#1085#1080#1082
      end
      object VUCH: TcxGridColumn
        Caption = #1059#1095#1072#1089#1090#1086#1082
        Width = 35
      end
    end
    object cxGrLevel1: TcxGridLevel
      GridView = TV
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 127
    Width = 963
    Height = 8
    HotZoneClassName = 'TcxXPTaskBarStyle'
    HotZone.SizePercent = 59
    AlignSplitter = salTop
    Control = paParam
    Visible = False
    ExplicitWidth = 8
  end
  object os: TOracleSession
    DesignConnection = True
    LogonUsername = 'PRIHODKO'
    LogonPassword = 'AHIMAS'
    LogonDatabase = 'ASU'
    ThreadSafe = True
    Left = 568
    Top = 176
  end
  object dsJournal: TDataSource
    DataSet = dxMemData1
    Left = 504
    Top = 176
  end
  object oqThread: TOracleQuery
    SQL.Strings = (
      'SELECT FK_ID,'
      '       FD_RUN, -- '#1076#1072#1090#1072' '#1074#1099#1087'.'
      '       TO_CHAR(FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN_TIME,'
      '       FK_NAZSOSID,'
      
        '       ASU.GET_NAME_RGISSL(FK_SMID) AS FC_NAME, -- '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' ' +
        #1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
      
        '       ASU.PKG_REGIST_PACFUNC.GET_PAC_FIO(FK_PACID) FIOPAC, --'#1060#1048 +
        #1054
      
        '       (SELECT FD_ROJD FROM ASU.TPEOPLES WHERE FK_ID = (SELECT F' +
        'K_PEPLID FROM ASU.TKARTA WHERE FK_ID = TNAZIS.FK_PACID '
      
        '                                                         UNION A' +
        'LL '
      
        '                                                        SELECT F' +
        'K_PEPLID FROM ASU.TAMBULANCE WHERE FK_ID = TNAZIS.FK_PACID)) FD_' +
        'ROJD, --'#1044#1072#1090#1072' '#1088#1086#1078#1076'.'
      
        '       ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TNAZIS.FK_PACID) A' +
        'S AGE, -- '#1074#1086#1079#1088#1072#1089#1090'                                               ' +
        '                                                '
      '       (SELECT ASU.GET_SMIDNAME(max(FK_SMID)) '
      '          FROM ASU.TIB '
      '         WHERE FK_PACID = TNAZIS.FK_PACID '
      '           AND (FK_SMID IN (SELECT FK_ID '
      '                              FROM ASU.TSMID '
      
        '                             WHERE FK_OWNER = (SELECT MAX(FK_ID)' +
        ' '
      '                                                 FROM ASU.TSMID '
      
        '                                                WHERE FC_SYNONIM' +
        ' = '#39'PD_MZ'#39')) '
      
        '               OR FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE F' +
        'C_SYNONIM = '#39'LIVEIN_SELO'#39'))) AS REGIONAL, -- '#1055#1088#1086#1078#1080#1074#1072#1077#1090
      '       (SELECT MAX(FC_CHAR) '
      '          FROM ASU.TIB '
      '         WHERE FK_PACID = TNAZIS.FK_ID '
      
        '           AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_' +
        'SYNONIM = '#39'NUMBER_ISSL'#39' OR FC_SYNONIM = '#39'XRAY_FLU_NUMBER'#39')) AS N' +
        'UMBER_ISSL, -- '#1053#1086#1084#1077#1088' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103'              '
      '       (SELECT ASU.GET_SMIDNAME(FK_SMID)'
      '          FROM ASU.TIB'
      '         WHERE FK_PACID = ASU.GET_PEPLID(TNAZIS.FK_PACID)'
      
        '           AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_' +
        'OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = '#39'LD_NARO' +
        'D'#39')) ) AS NATIONALITY, -- '#1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100'   '
      
        '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = TNAZIS.' +
        'FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      
        '       decode((select 1 from asu.tpeplid_med where fk_peplid = a' +
        'su.get_peplid(tnazis.fk_pacid)), null, '#39#39', 1, '#39#1044#1040#39') as MEDRAB,'
      
        '       asu.get_area_for_xray(asu.get_peplid(tnazis.fk_pacid)) as' +
        ' uch                                                      '
      'FROM ASU.TNAZIS'
      ' WHERE FD_RUN >= :PFD_DATE1 '
      '   AND FD_RUN <= :PFD_DATE2'
      '   AND FK_NAZSOSID = ASU.GET_VIPNAZ'
      
        '   AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = ' +
        'ASU.GET_XRAY_FLU)'
      'ORDER BY FD_RUN'
      ''
      ''
      '')
    Session = os
    Optimize = False
    Variables.Data = {
      03000000020000000A0000003A5046445F44415445310C000000000000000000
      00000A0000003A5046445F44415445320C0000000000000000000000}
    Cursor = crSQLWait
    Threaded = True
    OnThreadRecord = oqThreadThreadRecord
    OnThreadFinished = oqThreadThreadFinished
    OnThreadError = oqThreadThreadError
    Left = 568
    Top = 224
  end
  object dxMemData1: TdxMemData
    Indexes = <>
    Persistent.Option = poLoad
    SortOptions = []
    SortedField = 'FIOPAC'
    Left = 568
    Top = 280
    object dxMemData1FK_ID: TIntegerField
      FieldName = 'FK_ID'
    end
    object dxMemData1FD_RUN: TStringField
      FieldName = 'FD_RUN'
      Size = 100
    end
    object dxMemData1FIOPAC: TStringField
      FieldName = 'FIOPAC'
      Size = 100
    end
    object dxMemData1ISSLNAME: TStringField
      FieldName = 'ISSLNAME'
      Size = 100
    end
    object dxMemData1FD_RUN_TIME: TStringField
      FieldName = 'FD_RUN_TIME'
      Size = 100
    end
    object dxMemData1FK_NAZSOSID: TIntegerField
      FieldName = 'FK_NAZSOSID'
    end
    object dxMemData1AGE: TIntegerField
      FieldName = 'AGE'
    end
    object dxMemData1REGIONAL: TStringField
      FieldName = 'REGIONAL'
      Size = 200
    end
    object dxMemData1NUMBER_ISSL: TStringField
      FieldName = 'NUMBER_ISSL'
      Size = 50
    end
    object dxMemData1NATIONALITY: TStringField
      FieldName = 'NATIONALITY'
      Size = 200
    end
    object dxMemData1FD_ROJD: TDateField
      FieldName = 'FD_ROJD'
    end
    object dxMemData1DOZA: TFloatField
      FieldName = 'DOZA'
    end
    object dxMemData1MEDRAB: TStringField
      FieldName = 'MEDRAB'
      Size = 2
    end
    object dxMemData1uch: TStringField
      FieldName = 'uch'
      Size = 100
    end
  end
  object frxDBPrint: TfrxDBDataset
    UserName = 'frxDBPrint'
    CloseDataSource = False
    DataSet = dxMemData1
    BCDToCurrency = False
    Left = 328
    Top = 256
  end
  object frxRepPrint: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39715.680351134260000000
    ReportOptions.LastChange = 41224.566251712960000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepPrintGetValue
    Left = 328
    Top = 208
    Datasets = <
      item
        DataSet = frxDBPrint
        DataSetName = 'frxDBPrint'
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
      LeftMargin = 5.000000000000000000
      RightMargin = 8.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 119.417440000000000000
        Top = 18.897650000000000000
        Width = 1073.386520000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 1073.386520000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 952.441560000000000000
          Top = 57.354360000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109':')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 100.519790000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 53.078850000000000000
          Top = 100.519790000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1030#1057#8249#1056#1111'.')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 480.000310000000000000
          Top = 100.519790000000000000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 129.283550000000000000
          Top = 100.519790000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#152#1056#1115' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 1003.575450000000000000
          Top = 57.354360000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VSEGO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Align = baWidth
          Top = 34.015770000000000000
          Width = 1073.386520000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1056#1115#1057#8218#1057#8225#1056#181#1057#8218' '#1056#1111#1056#1109' '#1057#8222#1056#187#1057#1035#1056#1109#1057#1026#1056#1109#1056#1110#1057#1026#1056#176#1057#8222#1056#1105#1056#1105'. '#1056#1119#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027': [DATE' +
              '1] '#1056#1111#1056#1109': [DATE2]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 3.779530000000000000
          Top = 56.692950000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#1026#1056#176#1056#1112#1056#181#1057#8218#1057#1026#1057#8249' '#1057#1027#1056#177#1056#1109#1057#1026#1056#1108#1056#1105':')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 132.283550000000000000
          Top = 56.692950000000000000
          Width = 812.598950000000000000
          Height = 37.795300000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PARAMS]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 336.378170000000000000
          Top = 100.519790000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169'.')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 415.748300000000000000
          Top = 100.519790000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1056#1109#1056#183#1057#1026#1056#176#1057#1027#1057#8218)
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 839.055660000000000000
          Top = 100.519790000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1056#182#1056#1105#1056#1030#1056#176#1056#181#1057#8218)
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 952.441560000000000000
          Top = 100.519790000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#176#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034)
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Align = baWidth
          Top = 16.118120000000000000
          Width = 1073.386520000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[OTDELNAME]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 200.315090000000000000
        Width = 1073.386520000000000000
        DataSet = frxDBPrint
        DataSetName = 'frxDBPrint'
        RowCount = 0
        Stretched = True
        object Memo11: TfrxMemoView
          Left = 3.779530000000000000
          Width = 49.133890000000000000
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
            '[Line]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 53.078850000000000000
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
            '[frxDBPrint."FD_RUN"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 480.000310000000000000
          Width = 359.055350000000000000
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
            '[frxDBPrint."ISSLNAME"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 129.283550000000000000
          Width = 207.874150000000000000
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
            '[frxDBPrint."FIOPAC"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 336.377940550000000000
          Width = 79.370054330000000000
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
            '[frxDBPrint."FD_ROJD"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 415.748300000000000000
          Width = 64.252010000000000000
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
            '[frxDBPrint."AGE"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 839.055660000000000000
          Width = 113.385900000000000000
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
            '[frxDBPrint."REGIONAL"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 952.441560000000000000
          Width = 117.165430000000000000
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
            '[frxDBPrint."NATIONALITY"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 15.118120000000000000
        Top = 279.685220000000000000
        Width = 1073.386520000000000000
        object Memo17: TfrxMemoView
          Left = 933.543910000000000000
          Width = 136.063080000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.TopLine.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 3.779530000000000000
          Width = 929.764380000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADESIGN], [SYSDATE] [SOTRNAME]')
          ParentFont = False
        end
      end
    end
  end
  object frxRepProtocol: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39299.753055555600000000
    ReportOptions.LastChange = 41224.601106203710000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepProtocolGetValue
    Left = 178
    Top = 235
    Datasets = <>
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
      object ReportTitle1: TfrxReportTitle
        Height = 230.551330000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        StartNewPage = True
        Stretched = True
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 7.559060000000000000
          Top = 56.692950000000000000
          Width = 64.267050000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 7.559060000000000000
          Top = 81.149660000000000000
          Width = 105.070810000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 570.709030000000000000
          Top = 56.692913385826770000
          Width = 45.359270000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1114#1056#1113)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baWidth
          Top = 34.015770000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1057#8218#1056#1109#1056#1108#1056#1109#1056#187' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039' '#1074#8222#8211' [NUMISSL]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baWidth
          Top = 109.606370000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[NAMEISSL]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Align = baWidth
          Top = 133.504020000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Memo.UTF8 = (
            '[TEXTISSL]')
          WordBreak = True
        end
        object Memo9: TfrxMemoView
          Left = 7.559060000000000000
          Top = 173.858380000000000000
          Width = 109.760000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#173#1056#8221' = [DOZA] '#1056#1112#1056#8212#1056#1030)
        end
        object Memo10: TfrxMemoView
          Left = 7.559060000000000000
          Top = 200.315090000000000000
          Width = 112.640000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176': [DATEISSL]')
        end
        object Memo12: TfrxMemoView
          Left = 457.323130000000000000
          Top = 200.315090000000000000
          Width = 86.240000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#8217#1057#1026#1056#176#1057#8225': [SOTR]')
        end
        object Memo11: TfrxMemoView
          Align = baWidth
          Top = 16.118120000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[OTDELNAME]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 75.590600000000000000
          Top = 56.692950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PACFIO]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 120.944960000000000000
          Top = 81.259842519685040000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DATE_ROJD]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 619.842920000000000000
          Top = 56.692950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[NUMIB]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 15.118120000000000000
        Top = 309.921460000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Left = 555.590910000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Width = 551.811380000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADESIGN]')
          ParentFont = False
        end
      end
    end
  end
  object sdPopUp: TSaveDialog
    Left = 241
    Top = 379
  end
  object alMain: TActionList
    Images = ilMain
    Left = 288
    Top = 376
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
      ImageIndex = 0
      ShortCut = 32883
      OnExecute = aCloseExecute
    end
    object aParam: TAction
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      Hint = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1073#1086#1088#1082#1080' '#1078#1091#1088#1085#1072#1083#1072
      ImageIndex = 2
      ShortCut = 118
      OnExecute = aParamExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1078#1091#1088#1085#1072#1083#1072
      ImageIndex = 4
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aResult: TAction
      Caption = #1055#1088#1086#1090#1086#1082#1086#1083
      Hint = 
        #1055#1088#1086#1089#1084#1086#1090#1088' '#1087#1088#1086#1090#1086#1082#1086#1083#1072'. '#13#10#1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1084#1086#1078#1085#1086' '#1090#1086#1083#1100#1082#1086' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103', '#1074#1099#1087 +
        #1086#1083#1085#1077#1085#1085#1099#1077' '#1074#1088#1072#1095#1086#1084'-'#1088#1077#1085#1090#1075#1077#1085#1086#1083#1086#1075#1086#1084'.'
      ImageIndex = 5
      ShortCut = 114
      OnExecute = aResultExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1078#1091#1088#1085#1072#1083' '#1084#1077#1090#1086#1076#1080#1082
      ImageIndex = 6
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
      Hint = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
      ImageIndex = 8
      OnExecute = aTextExecute
    end
    object aWeb: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 9
      OnExecute = aWebExecute
    end
    object aXML: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 10
      OnExecute = aXMLExecute
    end
    object aXLS: TAction
      Caption = 'Excel '#1092#1072#1081#1083
      Hint = 'Excel '#1092#1072#1081#1083
      ImageIndex = 11
      OnExecute = aXLSExecute
    end
    object acEnable: TAction
      Caption = 'acEnable'
    end
    object aLaborant: TAction
      Caption = #1051#1072#1073#1086#1088#1072#1085#1090'(-'#1099')'
      ImageIndex = 13
    end
  end
  object pmTV: TPopupMenu
    Images = ilMain
    Left = 240
    Top = 330
    object N1: TMenuItem
      Action = aPrint
    end
    object MenuItem1: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 7
      object MenuItem2: TMenuItem
        Action = aText
      end
      object MenuItem3: TMenuItem
        Action = aWeb
      end
      object MenuItem4: TMenuItem
        Action = aXML
      end
      object MenuItem5: TMenuItem
        Action = aXLS
      end
    end
    object N2: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 12
      OnClick = N2Click
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
    ImageOptions.Images = ilMain
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 288
    Top = 328
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
      Caption = 'Main'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 220
      FloatTop = 74
      FloatClientWidth = 86
      FloatClientHeight = 122
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbParam'
        end
        item
          Visible = True
          ItemName = 'bbRefresh'
        end
        item
          Visible = True
          ItemName = 'bbResult'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPrint'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbClose'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbClose: TdxBarButton
      Action = aClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbParam: TdxBarButton
      Action = aParam
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPrint: TdxBarButton
      Action = aPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefresh: TdxBarButton
      Action = aRefresh
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbResult: TdxBarButton
      Action = aResult
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object ilMain: TImageList
    Left = 328
    Top = 328
    Bitmap = {
      494C01010E001000100010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000540000005400000054
      0000005400000054000000540000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B00000000000000000000000000000000000000620000007200000078
      0000017F030003880A0000740000005400000054000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FDF1E500FDF1E500FFED
      D500FFE9CE00FFE3C500FEDEBC00FFDAB100FFD5A600FFD19F00FFCC9800FFD8
      A100BC4B00000000000000000000000000000000000000650000007901001FBD
      4D0021C6580053C450008CDE9000007800000074000068321400E3453000E052
      3000EA5B3700F0493500E34530006E2D13000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FBF3EA00FBF3EA00FFEF
      DC00FFEDD500FEE5CA00FFE3C500FFDAB100FFDAB100FFD5A600FFCC9800FFD8
      A100BC4B000000000000000000000000000000000000005400000997180021C0
      54000EAA320095E59300CCFFC90003880A000073010056290900CB5F3E00DA86
      6800D34C2200FA624400E74A32006E2D13000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FCF6F000FBF3EA00FDF1
      E500FFEDD500FFE9CE00FFE3C500FEDEBC00FFDAB100FED7AB00FFD5A600FFD5
      A600BC4B000000000000000000000000000000000000000000000000000016A6
      360028833D00A5C6C2008CDE90000A99200007821300A1371800CC7A5900FFFF
      FF00FACFC700EA5B3700FB724D006E2D13000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FCF8F700FCF8F700FBF3
      EA00FDF1E500FFEDD500FEE5CA00FFE3C500FEDEBC00FFDAB100FFD8A100FED7
      AB00BC4B00000000000000000000000000000000000000000000000000000D2C
      1D0013287000112D8800194670000000000000000000E9502C00CB755300FFFF
      FF00FFFFFF00D34C2200EF664100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FCF8F700FCF8F700FCF8
      F700FDF1E500FFEFDC00FFEDD500FEE5CA00FFE9C200DEC2B100DEBDA600FFE9
      B200BC4B00000000000000000000000000000000000001010100000000000D30
      8F000C36A5000C36A0000B34A3000930B10000000000000000001C7A9F000550
      C6000653C1001E5CB5001F5F7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FCF8F700FCF8F700FCF8
      F700FCF8F700FBF3EA00FDF1E500FFF2D700D9C2C100090A9000090A9000D5BB
      AC00BC4B000000000000090A900000028F000B0A0C0000000000020100000D43
      BA000D40B1000D40B1000D40B1000D3FB1000F43B6001368A5000F68E1001A70
      EE00196EE900125EDE000C5FCA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FAEFE500FBF3EA00FBF3
      EA00FDF1E500FAE7D400FEE5CA00FFE3C500C1A5A700090A9000112DEA00090A
      900065416600090A90000622EB0000039200050506000000000003020100125E
      DE00145CD500145CD500145CD500145CD5001463D0002287FB00268EFB002891
      FA002890FA002388FA001F7EFA000A6F96000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000EF90370097543D00090A90001933
      E200090A9000122DE50000039200000000000908090000000000050303001C78
      FA001A70EE00196EE900196EE9001A75F3001875E1002790FB002B95FB002D98
      FA002D98FA002890FA002589FF000A6F96000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B000045265800090A
      90003C66FF00090A90000000000000000000000000001D1C1C00505050001B26
      3300143C6F001A5FAD001C67BF00132A4B00000000002D98FA0035A5FF0039AC
      FF0039ACFF0035A5FF00309EFF0002375C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000090A9000354C
      E000090A90002C46E700090A900000000000000000004040410040404100423E
      3A001D1C1C00070A110004070F0005030300000000000A5B9800277FC4000237
      5C0002375C001573B8001877C40002375C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000090A90004F65E7000609
      900000000000090A90002C46E700060990000000000000000000000000003535
      360018181800100F1100000000000000000000000000000000000B5484003981
      AA002A75A100004A810000447700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000090A9000090A90000000
      000000000000000000000609900000028F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000C5B
      8F000C5B8F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00FF000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000007777
      7700555555005555550055555500555555005555550055555500555555005555
      55005555550055555500555555000000000086868600FFFFFF00F1F1F100FFFF
      FF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFF
      FF00F1F1F100FFFFFF0000000000FF00FF000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000007777
      7700CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00555555000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1
      F100FFFFFF00F1F1F10000000000FF00FF000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000CC3333007777
      7700FFFFFF00EAEAEA00EAEAEA00D6E7E700D6E7E700EAEAEA00D6E7E700D6E7
      E700D6E7E700CCCCCC00555555000000000086868600FFFFFF00F1F1F1009966
      3300996633009966330099663300996633009966330099663300996633009966
      3300F1F1F100FFFFFF0000000000FF00FF000000000000000000000000008484
      8400FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C0000000000000000000000000000000000000000000CC333300000000000404
      040004040400996600009966000099660000EAEAEA00D6E7E700EAEAEA00D6E7
      E700D6E7E700CCCCCC00555555000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1
      F100FFFFFF00F1F1F10000000000FF00FF000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C6000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C0000000000000000000000000000000000000808000CC33330066333300CC33
      3300FF663300FF663300FF663300FF66330099660000EAEAEA00D6E7E700EAEA
      EA00D6E7E700CCCCCC00555555000000000086868600FFFFFF00F1F1F1009966
      3300996633009966330099663300996633009966330099663300996633009966
      3300F1F1F100FFFFFF0000000000FF00FF0000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C6000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000005F5F5F006699990099330000FF66
      3300FF663300C0C0C000C0C0C000CC333300FF66330099660000EAEAEA00D6E7
      E700D6E7E700CCCCCC00555555000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1
      F100FFFFFF00F1F1F10000000000FF00FF0000840000FFFFFF00008400000084
      0000008400000084000000840000008400000084000000840000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00000000000000000000000000000000000777777006699CC00CC663300FF66
      3300CC660000F0FBFF00F0FBFF00F1F1F100F0FBFF00EAEAEA00D6E7E700EAEA
      EA00D6E7E700CCCCCC00555555000000000086868600FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF00800000008000000080000000FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF0000000000FF00FF0000840000FFFFFF00008400000084
      000000840000C6C6C60000840000008400000084000000840000C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C00000000000000000000000000000000000000000007777770099CCFF00FF66
      3300CC660000CC660000CC660000CC660000CC660000CC660000EAEAEA00D6E7
      E700D6E7E700CCCCCC00555555000000000086868600FFFFFF00F0CAA6009900
      0000FFFFFF00FF663300FF99330000993300FF00000080000000FFFFFF009900
      0000F0CAA600F1F1F10000000000FF00FF0000840000FFFFFF00FFFFFF000084
      0000C6C6C600008400000084000000840000FFFFFF0000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C6000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C0000000000000000000000000000000000000000000800000006699990099FF
      FF00CC660000F0FBFF00F0FBFF00CC333300FFCC0000CC660000F1F1F100EAEA
      EA00D6E7E700CCCCCC00555555000000000086868600F0CAA60099000000FFFF
      FF00F1F1F10080800000FFFF3300FFCC33000099330080000000F1F1F100FFFF
      FF0099000000F0CAA60000000000FF00FF0000840000FFFFFF0000840000C6C6
      C600008400000084000000840000FFFFFF00FFFFFF0000840000C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000800000009999
      6600CCCC9900CC333300CC333300FFFF6600CC660000F1F1F100F0FBFF00EAEA
      EA00CCCCCC0099999900555555000000000086868600FFFFFF00F0CAA6009900
      0000FFFFFF0080800000FFFFFF00FFFF3300FF99330080000000FFFFFF009900
      0000F0CAA600F1F1F10000000000FF00FF0000840000FFFFFF00C6C6C6000084
      000000840000008400000084000000840000FFFFFF0000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C6000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000008000
      0000CC660000CC660000CC660000CC660000F0FBFF00FF663300F1F1F100CCCC
      CC009999990077777700555555000000000086868600FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF008080000080800000FF663300FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF0000000000FF00FF0000840000FFFFFF00008400000084
      0000FFFFFF00FFFFFF000084000000840000FFFFFF0000840000C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000008686
      8600FFFFFF00F0FBFF00F0FBFF00CC660000CC660000F0FBFF00F0FBFF005555
      55003333330033333300333333000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF000000
      0000000000000000000000000000FF00FF0000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFF
      FF000000000000000000000000000000000080808000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000008686
      8600FFFFFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF009999
      9900FFFFFF0055555500000000000000000086868600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F100FFFFFF00F1F1F100C0C0
      C000FFFFFF0086868600FF00FF00FF00FF000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000FFFFFF00FFFF
      FF0084848400FFFFFF0000000000000000000000000000000000FFFFFF008080
      8000FFFFFF0080808000FFFFFF0080808000FFFFFF0080808000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008686
      8600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009999
      99005555550000000000000000000000000086868600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00086868600FF00FF00FF00FF00FF00FF000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008686
      8600868686008686860086868600868686008686860086868600868686008686
      8600000000000000000000000000000000008686860086868600868686008686
      8600868686008686860086868600868686008686860086868600868686008686
      8600FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE8400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000008484
      84008484840084848400FFCE8400FF0000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000084848400FF00
      0000FF000000FF000000FF000000FF000000FF00000084848400848484000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000008484840000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFDEAD00FF000000FF00
      0000FFCE8400FFCE8400FF000000FF000000FF000000FF000000848484000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000FF0084848400000000000000
      0000848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      000000000000000000000000000000000000FFDEAD00FF000000FF000000FF00
      00000000000000000000FFCE8400FF000000FF00000084848400000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000000000008484
      8400000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000FFDEAD00FF000000848484000000
      00000000000000000000FFCE8400FF000000848484000000000000000000FF00
      0000848484000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000008484840000000000000000000000000084848400000000000000
      000000000000000000000000000000000000FFFFFF0000000000848484000000
      000000000000000000000000000000000000FFDEAD00FF000000848484000000
      00000000000000000000FFCE840084848400000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000084848400000000000000
      000000000000000000000000000000000000FFDEAD00FF000000848484000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFDEAD00FF000000848484000000
      00000000000000000000FF00000084848400000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFA5A500FF0000000000
      000000000000FF000000FF000000848484000000000000000000FF000000FF00
      0000848484000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000808000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000848484008484840084848400FF000000FF00
      0000848484000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000008484840000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000848484000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      8400FF000000FF000000FF000000FF000000FF000000FF000000FF0000008484
      8400000000000000000000000000000000000000000000000000008080000000
      0000000000000000000080800000000000008080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFCE8400FF000000FF000000FFCE8400FFCE8400FFCE8400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080800000FFFFFF00000000000000000080800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE8400FF000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080800000FFFFFF00FFFFFF00000000000000000080800000808000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE8400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000B78A700158EBB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000043E9000043E9000043E9000043E9000043E9000043E90000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B009C4B4C00B64B4C009F4B4C004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000229C
      C7001693C100056695000777A7000A78A7001893C100096D9C00056695002E98
      BF003AA7CF00000000000000000000000000000000000000000000000000034B
      B400034BB4000C5DCF004586CF006392C7005E8CBF003D73B40008479F00003A
      9900043E90000000000000000000000000000000000000000000824B4B009A4D
      4E00AF4E4F00C04D4E00BF4C4D009F4B4C004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000000000000000
      0000000000000000000000000000008000000080000000800000000000000000
      00000000000000000000000000000000000000000000000000000000000027A4
      CE001EA7D5000BACE200099ACE0012C9FE002FD1FE001C8AB50058CBEA004EB8
      D9002D9AC2000000000000000000000000000000000000000000034BB400045B
      DE0077B1F000F6F4F600D9E6F000B7D3F000B5D0EE00CFDAE600DED9D5005580
      B0000141A400043E900000000000000000000000000000000000824B4B00CC57
      5800CB565700C9545500C7535400A34E4F004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000800000008000000080000000800000000000000000
      000000000000000000000000000000000000000000000B6D9C00208AB5005CCE
      F0007BE2FB0045C6EA0035CEF7000CC6FE0018CAFE005CDDFF0067CCEA00BAF2
      FF00BAF2FF001179A900056695000000000000000000034BB400045BDE009ECA
      F800FEFEFF00599EEF001069E500025CE200025CE2001069E5005CA0EF00F8F4
      EF00809EBC000141A400043E9000000000000000000000000000824B4B00D05A
      5B00CF595A00CC575800CB565700A55050004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000080000000800000008000000080000000800000008000000000
      0000000000000000000000000000000000000000000093EAFF005ECAEA0051C6
      EE006FDCF70062E1FF0043D9FF0012C9FE000FC7FE004DD9FE0075E3FF0083E6
      FF0052DAFF0040BAE7002CA9DC000000000000000000034BB4007AB5F600FEFE
      FF00287BE700025CE2000055E000025CE2000055E000025CE2000055E0003688
      ED00F8FAF6005E8CBF00043E9000000000000000000000000000824B4B00D962
      6300D8606200D55E5F00D45D5E00A95354004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B00000000000000000000000000000000000000
      0000008000000080000000800000008000000000000000800000008000000000
      000000000000000000000000000000000000000000001496D3001699D7003BB7
      E60058CBEF0079E7FF005DD1ED004893A6005589970010BAEB0006C4FE0006C4
      FE0006C4FE0006C4FE0006C4FE00000000000F6ADE001169DE00FEFEFF00599E
      EF00025CE200E9F3FD0088BCF3000055E000025CE200C4DDF900C4DDF900025C
      E20064A6F200EEEAE700094FAF00043E90000000000000000000824B4B00DD65
      6600DC646500D9626300D8606200AB5555004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B00000000000000000000000000000000000080
      0000008000000080000000800000000000000000000000800000008000000080
      000000000000000000000000000000000000000000000A75A9001699D70032B0
      E2004DC4ED007DBBC900898989009696960090898900888A8E0028A6C90006C4
      FE0006C4FE0006C4FE0006ABE200000000000F6ADE005DA5F200E6F2FD001674
      E7000565E500C4DDF900FEFEFF0088BCF300C4DDF900FEFEFF0088BCF3000055
      E0000D67E200E3EEF7004787D100043E90000000000000000000824B4B00E66C
      6D00E56B6C00EEA6A700FFFFFF00AF5859004E1E1F00B7EBAA005ED3770045CA
      670045CA6700F7B5B600824B4B00000000000000000000000000008000000080
      0000008000000080000000000000000000000000000000000000008000000080
      000000000000000000000000000000000000000000000D7FB5001699D7001FA1
      DA0038B5E50096969600E9E7E7009696960090898900D5A9A900AF9595007AE3
      FF00A5EEFF00BAF2FF0051A9C900000000000F6ADE0088BCF300C6E1FA001176
      EA00096DE9001176EA00C9E2FB00FEFEFF00FEFEFF0088BCF300025CE2000055
      E000025CE200C4DDF90070A9E600043E90000000000000000000824B4B00EA6F
      7000E96E6F00F2A9AA00FFFFFF00B15A5A004E1E1F00FFFFD300FFFFD300FFFF
      D300D9F6BD00F7B5B600824B4B00000000000000000000000000008000000080
      0000008000000000000000000000000000000000000000000000008000000080
      000000800000000000000000000000000000000000000B78AC00128FCA00189C
      D8002EADE10096969600E9E7E7009696960090898900D5A9A900AF9595006AE1
      FF0095EAFF0090D5EA00459FC100000000000F6ADE0089C4F700C9E2FB001A82
      EE00117AED001A82EE00C9E2FB00FEFEFF00FEFEFF0088BCF3000055E000025C
      E2000055E000C4DDF9007AB5F600043E90000000000000000000824B4B00F377
      7800F2767700EF747500EE737400B55D5D004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B00000000000000000000000000008000000080
      0000000000000000000000000000000000000000000000000000000000000080
      0000008000000000000000000000000000000000000000000000000000001699
      D7001C9FD90096969600E9E7E7009696960090898900D5A9A900AF9595004DD9
      FE0074E3FF000000000000000000000000000F6ADE0076BDF900E9F3FD003599
      F3001E89F000C9E2FB00FEFEFF0096C7F700C6E1FA00FEFEFF0088BCF300004F
      E0001069E500E9F3FD00529EF400043E90000000000000000000824B4B00F77A
      7B00F6797A00F3777800F2767700B75F5F004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      0000008000000080000000000000000000000000000000000000000000000973
      A5000A73A50096969600E9E7E7009696960090898900D5A9A900AF9595001180
      AD001882AD000000000000000000000000000F6ADE003599F300FEFEFF007FC5
      FA002996F400EFF8FF009ECAF800117AED00117AED00C9E2FB00C4DDF900004F
      E00066A7EF00FEFEFF000D67E200043E90000000000000000000824B4B00FF81
      8200FE808100FC7F8000FB7E7F00BB6363004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008000000080000000000000000000000000000000000000000000000000
      00000000000096969600E9E7E7009696960090898900D5A9A900AF9595000000
      000000000000000000000000000000000000000000000F6ADE00A5DDFD00FEFE
      FF005AB6F8002A99F4001E89F0001A82EE000B70E9000768E700025CE2003688
      ED00FEFEFF0070AFF400034BB400000000000000000000000000824B4B00FF81
      8200FF818200FF818200FE808100BD6565004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008000000080000000800000000000000000000000000000000000000000
      00000000000096969600AFAFAF007E7E7E007D7B7B00998A8A00A79090000000
      000000000000000000000000000000000000000000000F6ADE0041AFFC00C5ED
      FF00FEFEFF0081C7FA003599F3001E89F000117AED001878E9005CA0EF00FEFE
      FF009ECAF800045BDE00034BB400000000000000000000000000824B4B00AF5E
      5F00D56F7000FF818200FF818200BF6666004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000800000000000000000000000000000000000000000
      0000000000008E8E8E00F3F2F200B2B2B20093939300A5929200938787000000
      00000000000000000000000000000000000000000000000000000F6ADE0045B4
      FE00A5DDFD00FEFEFF00E9F3FD00C9E2FB00C9E2FB00E6F2FD00FEFEFF0070AF
      F400045BDE00034BB4000000000000000000000000000000000000000000824B
      4B00824B4B00B6626300EE7A7B00BF6666004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000800000000000000000000000000000000000000000
      00000000000087878700F2F0F000C9C7C700A9A9A900938A8A00898282000000
      0000000000000000000000000000000000000000000000000000000000000F6A
      DE001169DE003AA0F60076BDF9008EC7F80087C0F6005DA5F2000F6AE000034B
      B400034BB4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000777777007777770000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000F6ADE000F6ADE000F6ADE000F6ADE000F6ADE000F6ADE000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFF81FF00000000
      0007807F00000000000780000000000000078000000000000007E00000000000
      0007E18100000000000780C10000000000040001000000000000000000000000
      00010000000000008003808000000000FFC1808000000000FF88E3C100000000
      FF9CFFE700000000FFFFFFFF00000000800FFFFFFFFEE0000007E0010002E000
      0007E0010002E0000007C0010002E0000007A001000200000007000100020000
      0007000100020000000700010002000000078001000200000007800100020000
      0007C001000200000007E001000200000007E001001E00000007E00300000001
      800FE0070000E003D55FE00F0000E007C00FFFFFFFFFC001C007FFF7FC7F8031
      8003FFE7E03F8031BFF3FFC7C01F8031BFF3F00F801F8001BE31E61F0C3F8001
      8001CE3F1C67800180019F1F1CE38FF1C0019F9F1FE38FF1E001BFDF1CE38C71
      F003AFDF98C78C71F00FAF9FF0078C71F00F879FE00F8935F00FC3BFF03F8181
      F007E77FF8FFE18FF807F07FFCFFE00FFE7FFFFFFE7FF81FE07FFF7FE007E007
      C001FE3FE007C003C001FC3F80018001C001F81F80018001C001F09F80010000
      C001E18F80010000C001C3CF80010000C001C7C780010000C001CFE7E0070000
      C001FFE3E0070000C001FFF3F81F8001C001FFF1F81F8001C001FFF9F81FC003
      E001FFF9F81FE007FE7FFFFFFE7FF81F00000000000000000000000000000000
      000000000000}
  end
end
