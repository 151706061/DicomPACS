object frmSvodVed: TfrmSvodVed
  Left = 287
  Top = 92
  Caption = #1057#1074#1086#1076#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
  ClientHeight = 541
  ClientWidth = 946
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object paLeft: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 374
    Height = 535
    Margins.Right = 0
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object vGrParam: TcxVerticalGrid
      Left = 0
      Top = 0
      Width = 374
      Height = 468
      Margins.Right = 0
      Align = alClient
      Images = ilSmall
      LookAndFeel.SkinName = ''
      OptionsView.RowHeaderWidth = 108
      TabOrder = 0
      object catMain: TcxCategoryRow
        Options.Focusing = False
        Options.Moving = False
        Options.TabStop = False
        Properties.Caption = #1043#1083#1072#1074#1085#1086#1077
      end
      object rowDate1: TcxEditorRow
        Properties.Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
        Properties.ImageIndex = 0
        Properties.EditPropertiesClassName = 'TcxDateEditProperties'
        Properties.EditProperties.DateButtons = [btnToday]
        Properties.EditProperties.ImmediatePost = True
        Properties.EditProperties.PostPopupValueOnTab = True
        Properties.EditProperties.SaveTime = False
        Properties.EditProperties.ShowTime = False
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.ShowEditButtons = eisbAlways
        Properties.Value = Null
      end
      object rowTime1: TcxEditorRow
        Properties.Caption = #1042#1088#1077#1084#1103
        Properties.ImageIndex = 11
        Properties.EditPropertiesClassName = 'TcxTimeEditProperties'
        Properties.EditProperties.ImmediatePost = True
        Properties.EditProperties.TimeFormat = tfHourMin
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.ShowEditButtons = eisbAlways
        Properties.Value = Null
      end
      object rowDate2: TcxEditorRow
        Properties.Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
        Properties.ImageIndex = 0
        Properties.EditPropertiesClassName = 'TcxDateEditProperties'
        Properties.EditProperties.DateButtons = [btnToday]
        Properties.EditProperties.ImmediatePost = True
        Properties.EditProperties.PostPopupValueOnTab = True
        Properties.EditProperties.SaveTime = False
        Properties.EditProperties.ShowTime = False
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.ShowEditButtons = eisbAlways
        Properties.Value = Null
      end
      object rowTime2: TcxEditorRow
        Properties.Caption = #1042#1088#1077#1084#1103
        Properties.ImageIndex = 11
        Properties.EditPropertiesClassName = 'TcxTimeEditProperties'
        Properties.EditProperties.ImmediatePost = True
        Properties.EditProperties.TimeFormat = tfHourMin
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.ShowEditButtons = eisbAlways
        Properties.Value = Null
      end
      object rowTaxi: TcxEditorRow
        Properties.Caption = #1058#1072#1082#1089#1080
        Properties.ImageIndex = 8
        Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.EditProperties.DropDownListStyle = lsFixedList
        Properties.EditProperties.DropDownSizeable = True
        Properties.EditProperties.GridMode = True
        Properties.EditProperties.ImmediatePost = True
        Properties.EditProperties.KeyFieldNames = 'fk_id'
        Properties.EditProperties.ListColumns = <
          item
            FieldName = 'fc_name'
          end>
        Properties.EditProperties.ListOptions.ShowHeader = False
        Properties.EditProperties.ListSource = dsTaxi
        Properties.EditProperties.PostPopupValueOnTab = True
        Properties.EditProperties.OnChange = rowTaxiEditPropertiesChange
        Properties.DataBinding.ValueType = 'Integer'
        Properties.Options.ShowEditButtons = eisbAlways
        Properties.Value = -1
      end
      object catPer: TcxCategoryRow
        Options.Focusing = False
        Options.Moving = False
        Options.TabStop = False
        Properties.Caption = #1055#1088#1086#1094#1077#1085#1090#1099' (%)'
        Visible = False
      end
      object rowAll: TcxEditorRow
        Properties.Caption = #1042#1089#1077
        Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditProperties.MaskKind = emkRegExpr
        Properties.EditProperties.EditMask = '\d+'
        Properties.DataBinding.ValueType = 'String'
        Properties.Value = Null
        Visible = False
      end
      object rowMG: TcxEditorRow
        Properties.Caption = #1052#1077#1078#1075#1086#1088#1086#1076
        Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditProperties.MaskKind = emkRegExpr
        Properties.EditProperties.EditMask = '\d+'
        Properties.DataBinding.ValueType = 'String'
        Properties.Value = Null
        Visible = False
      end
      object rowFree: TcxEditorRow
        Properties.Caption = #1057#1074#1086#1073#1086#1076#1085#1099#1077
        Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditProperties.MaskKind = emkRegExpr
        Properties.EditProperties.EditMask = '\d+'
        Properties.DataBinding.ValueType = 'String'
        Properties.Value = Null
        Visible = False
      end
      object rowDop: TcxCategoryRow
        Options.Focusing = False
        Options.Moving = False
        Options.TabStop = False
        Properties.Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      end
      object rowStatus: TcxEditorRow
        Properties.Caption = #1057#1090#1072#1090#1091#1089
        Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
        Properties.EditProperties.DropDownListStyle = lsFixedList
        Properties.EditProperties.DropDownSizeable = True
        Properties.EditProperties.ImmediatePost = True
        Properties.EditProperties.ImmediateUpdateText = True
        Properties.EditProperties.Items.Strings = (
          #1042#1089#1077
          #1047#1072#1082#1088#1099#1090#1099#1077
          #1053#1077#1086#1087#1083#1072#1095#1077#1085#1085#1099#1077)
        Properties.EditProperties.PostPopupValueOnTab = True
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.ShowEditButtons = eisbAlways
        Properties.Value = Null
      end
    end
    object paSubParam: TPanel
      Left = 0
      Top = 476
      Width = 374
      Height = 59
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      Constraints.MaxHeight = 59
      Constraints.MinHeight = 59
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
      object cxLabel1: TcxLabel
        Left = 67
        Top = 4
        Caption = '_'
      end
      object cxLabel2: TcxLabel
        Left = 67
        Top = 27
        Caption = '_'
      end
      object cxLabel3: TcxLabel
        Left = 119
        Top = 4
        Caption = #1042#1099#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1079#1072#1087#1088#1086#1089' '#1082' '#1041#1072#1079#1077' '#1044#1072#1085#1085#1099#1093'...'
      end
    end
    object cxSplitter2: TcxSplitter
      Left = 0
      Top = 468
      Width = 374
      Height = 8
      HotZoneClassName = 'TcxXPTaskBarStyle'
      HotZone.SizePercent = 59
      AlignSplitter = salBottom
      Control = paSubParam
      Visible = False
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 377
    Top = 0
    Width = 8
    Height = 541
    HotZoneClassName = 'TcxXPTaskBarStyle'
    HotZone.SizePercent = 61
    Control = paLeft
  end
  object paClient: TPanel
    AlignWithMargins = True
    Left = 385
    Top = 3
    Width = 558
    Height = 535
    Margins.Left = 0
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 6
    object dxBarDockControl1: TdxBarDockControl
      AlignWithMargins = True
      Left = 0
      Top = 3
      Width = 558
      Height = 52
      Margins.Left = 0
      Margins.Right = 0
      Align = dalTop
      BarManager = BM
      SunkenBorder = True
      UseOwnSunkenBorder = True
    end
    object pcMain: TcxPageControl
      Left = 0
      Top = 58
      Width = 558
      Height = 477
      ActivePage = cxTabSheet2
      Align = alClient
      HideTabs = True
      TabOrder = 1
      ExplicitLeft = 168
      ExplicitTop = 72
      ExplicitWidth = 289
      ExplicitHeight = 193
      ClientRectBottom = 477
      ClientRectRight = 558
      ClientRectTop = 0
      object cxTabSheet1: TcxTabSheet
        Caption = #1054#1073#1097#1077#1077
        ImageIndex = 0
        ExplicitWidth = 289
        ExplicitHeight = 169
        object grList: TcxGrid
          Left = 0
          Top = 0
          Width = 558
          Height = 453
          Align = alClient
          PopupMenu = pmVIEW
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          LookAndFeel.SkinName = ''
          ExplicitTop = -24
          ExplicitHeight = 477
          object tvList: TcxGridTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skSum
                Column = tvListSumAll
              end
              item
                Kind = skSum
                Column = tvListSumMG
              end
              item
                Kind = skSum
                Column = tvListSumFree
              end
              item
                Kind = skSum
                Column = tvListSumPer
              end
              item
                Kind = skSum
                Column = tvListSumPen
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
            OptionsSelection.CellSelect = False
            OptionsSelection.InvertSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object tvListKod: TcxGridColumn
              Caption = #1055#1086#1079#1099#1074#1085#1086#1081
              DataBinding.ValueType = 'Integer'
              Width = 107
            end
            object tvListSotr: TcxGridColumn
              Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
              Width = 107
            end
            object tvListSumAll: TcxGridColumn
              Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1075#1086#1088#1086#1076#1091
              DataBinding.ValueType = 'Float'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              Width = 107
            end
            object tvListSumAllPer: TcxGridColumn
              Caption = '% '#1087#1086' '#1075#1086#1088#1086#1076#1091
              DataBinding.ValueType = 'Float'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 107
            end
            object tvListSumMG: TcxGridColumn
              Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1084#1077#1078#1075#1086#1088#1086#1076#1091
              DataBinding.ValueType = 'Float'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              Width = 118
            end
            object tvListSumMGPer: TcxGridColumn
              Caption = '% '#1087#1086' '#1084#1077#1078#1075#1086#1088#1086#1076#1091
              DataBinding.ValueType = 'Float'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 105
            end
            object tvListSumFree: TcxGridColumn
              Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1089#1074#1086#1073#1086#1076#1085#1086#1084#1091
              DataBinding.ValueType = 'Float'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              Width = 104
            end
            object tvListSumFreePer: TcxGridColumn
              Caption = '% '#1087#1086' '#1089#1074#1086#1073#1086#1076#1085#1086#1084#1091
              DataBinding.ValueType = 'Float'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              GroupSummaryAlignment = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 105
            end
            object tvListSumPen: TcxGridColumn
              Caption = #1064#1090#1088#1072#1092#1099
              DataBinding.ValueType = 'Float'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
            end
            object tvListSumPenPer: TcxGridColumn
              Caption = '% '#1087#1086' '#1096#1090#1088#1072#1092#1072#1084
              DataBinding.ValueType = 'Float'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
            end
            object tvListSumPer: TcxGridColumn
              Caption = #1057#1091#1084#1084#1072' %'
              DataBinding.ValueType = 'Float'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 104
            end
            object tvListDrvID: TcxGridColumn
              Caption = 'DrvID'
              Visible = False
              VisibleForCustomization = False
            end
          end
          object grListLevel1: TcxGridLevel
            GridView = tvList
          end
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = #1048#1090#1086#1075
        ImageIndex = 1
        ExplicitTop = 24
        ExplicitHeight = 453
        object cxGrid1: TcxGrid
          Left = 0
          Top = 0
          Width = 558
          Height = 477
          Align = alClient
          PopupMenu = pmVIEW
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          LookAndFeel.SkinName = ''
          ExplicitHeight = 453
          object cxGridTableView1: TcxGridTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skSum
              end
              item
                Kind = skSum
              end
              item
                Kind = skSum
              end
              item
                Kind = skSum
                Column = cxGridColumn11
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
            OptionsSelection.CellSelect = False
            OptionsSelection.InvertSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object cxGridColumn1: TcxGridColumn
              Caption = #1055#1086#1079#1099#1074#1085#1086#1081
              DataBinding.ValueType = 'Integer'
              Width = 107
            end
            object cxGridColumn2: TcxGridColumn
              Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
              Width = 107
            end
            object cxGridTableView1Column1: TcxGridColumn
              Caption = #1056#1072#1094#1080#1103
            end
            object cxGridTableView1Column2: TcxGridColumn
              Caption = #1055#1091#1090#1077#1074#1082#1080
            end
            object cxGridColumn11: TcxGridColumn
              Caption = #1057#1091#1084#1084#1072' %'
              DataBinding.ValueType = 'Float'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 104
            end
            object cxGridColumn12: TcxGridColumn
              Caption = 'DrvID'
              Visible = False
              VisibleForCustomization = False
            end
            object cxGridTableView1Column3: TcxGridColumn
              Caption = #1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridTableView1
          end
        end
      end
    end
  end
  object dsTaxi: TDataSource
    DataSet = odsTaxi
    Left = 417
    Top = 123
  end
  object odsTaxi: TOracleDataSet
    SQL.Strings = (
      'select -1 as fk_id, '#39' '#39' as fc_name '
      '  from dual'
      ''
      'union all'
      ''
      'select fk_id, fc_name '
      '  from taxi.ts_taxi'
      ' where fl_del = 0')
    Optimize = False
    Session = frmMain.os
    Left = 465
    Top = 123
  end
  object frxRep: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41125.467140231500000000
    ReportOptions.LastChange = 41349.621361030090000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepGetValue
    Left = 417
    Top = 187
    Datasets = <
      item
        DataSet = frxDB
        DataSetName = 'frxDBDataset1'
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
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 83.149660000000000000
        Top = 18.897650000000000000
        Width = 1084.725110000000000000
        object Memo1: TfrxMemoView
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            #1056#1038#1056#1030#1056#1109#1056#1169#1056#1029#1056#176#1057#1039' '#1056#1030#1056#181#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1057#1034)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 136.063080000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8 = (
            '[TAXI]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 18.897650000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            #1057#1027' [DATE1] '#1056#1111#1056#1109' [DATE2]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 45.354360000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169
            #1057#1027#1056#1109#1057#8218#1057#1026#1057#1107#1056#1169#1056#1029#1056#1105#1056#1108#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 75.590600000000000000
          Top = 45.354360000000000000
          Width = 151.181200000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1109#1057#8218#1057#1026#1057#1107#1056#1169#1056#1029#1056#1105#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 226.771800000000000000
          Top = 45.354360000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '
            #1056#1111#1056#1109' '#1056#1110#1056#1109#1057#1026#1056#1109#1056#1169#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 302.362400000000000000
          Top = 45.354360000000000000
          Width = 64.252010000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '% '#1056#1111#1056#1109' '
            #1056#1110#1056#1109#1057#1026#1056#1109#1056#1169#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 366.614410000000000000
          Top = 45.354360000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1056#1111#1056#1109
            #1056#1112#1056#181#1056#182#1056#1110#1056#1109#1057#1026#1056#1109#1056#1169#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 442.205010000000000000
          Top = 45.354360000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '% '#1056#1111#1056#1109
            #1056#1112#1056#181#1056#182#1056#1110#1056#1109#1057#1026#1056#1109#1056#1169#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 517.795610000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1056#1111#1056#1109
            #1057#1027#1056#1030#1056#1109#1056#177#1056#1109#1056#1169#1056#1029#1056#1109#1056#1112#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 597.165740000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '% '#1056#1111#1056#1109
            #1057#1027#1056#1030#1056#1109#1056#177#1056#1109#1056#1169#1056#1029#1056#1109#1056#1112#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 835.276130000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' %')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 676.535870000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1025#1057#8218#1057#1026#1056#176#1057#8222#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 755.906000000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '% '#1056#1111#1056#1109
            #1057#8364#1057#8218#1057#1026#1056#176#1057#8222#1056#176#1056#1112)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 162.519790000000000000
        Width = 1084.725110000000000000
        DataSet = frxDB
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo8: TfrxMemoView
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."Kod"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 75.590600000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."Name"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 226.771800000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SumAll"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 302.362400000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SumAllPer"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 366.614410000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SumMG"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 442.205010000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SumMGPer"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 517.795610000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SumFree"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 597.165740000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SumFreePer"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 835.276130000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SumPer"]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 676.535870000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SumPenalty"]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 755.906000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SumPenaltyPer"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 15.118120000000000000
        Top = 321.260050000000000000
        Width = 1084.725110000000000000
        object Memo16: TfrxMemoView
          Width = 789.921770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1038#1056#187#1057#1107#1056#182#1056#177#1056#176' '#1057#8218#1056#176#1056#1108#1057#1027#1056#1105', [DATESYS]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 789.921770000000000000
          Width = 294.803340000000000000
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
      end
      object Footer1: TfrxFooter
        Height = 56.692950000000000000
        Top = 204.094620000000000000
        Width = 1084.725110000000000000
        object Memo12: TfrxMemoView
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#152#1056#1118#1056#1115#1056#8220#1056#1115' '#1056#1038#1056#1032#1056#1114#1056#1114#1056#1106':')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 226.771800000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUMALL]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 366.614410000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUMMG]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 517.795610000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUMFREE]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 835.276130000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUMPER]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 302.362400000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 442.205010000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 597.165740000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Top = 37.795300000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1113#1056#1115#1056#8250#1056#152#1056#167#1056#8226#1056#1038#1056#1118#1056#8217#1056#1115' '#1056#8212#1056#1106#1056#1113#1056#1106#1056#8212#1056#1115#1056#8217':')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 226.771800000000000000
          Top = 37.795300000000000000
          Width = 687.874460000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUMALL_ZAKAZ]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Top = 18.897650000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#152#1056#1118#1056#1115#1056#8220#1056#1115' '#1056#8212#1056#1106#1056#1113#1056#1106#1056#8212#1056#1115#1056#8217':')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 226.771800000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUMALL_Z]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 366.614410000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUMMG_Z]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 517.795610000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUMFREE_Z]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 835.276130000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 302.362400000000000000
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 442.205010000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 597.165740000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 676.535870000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUMPENALTY]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 755.906000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 676.535870000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 755.906000000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
        end
      end
    end
  end
  object sdPopUp: TSaveDialog
    Left = 529
    Top = 283
  end
  object dxMemData1: TdxMemData
    Indexes = <>
    Persistent.Option = poLoad
    SortOptions = []
    SortedField = 'Kod'
    Left = 528
    Top = 336
    object dxMemData1Kod: TIntegerField
      FieldName = 'Kod'
    end
    object dxMemData1Name: TStringField
      FieldName = 'Name'
      Size = 150
    end
    object dxMemData1SumAll: TFloatField
      FieldName = 'SumAll'
    end
    object dxMemData1SumAllPer: TFloatField
      FieldName = 'SumAllPer'
    end
    object dxMemData1SumMG: TFloatField
      FieldName = 'SumMG'
    end
    object dxMemData1SumMGPer: TFloatField
      FieldName = 'SumMGPer'
    end
    object dxMemData1SumFree: TFloatField
      FieldName = 'SumFree'
    end
    object dxMemData1SumFreePer: TFloatField
      FieldName = 'SumFreePer'
    end
    object dxMemData1SumPer: TFloatField
      FieldName = 'SumPer'
    end
    object dxMemData1DrvID: TIntegerField
      FieldName = 'DrvID'
    end
    object dxMemData1SumPenalty: TFloatField
      FieldName = 'SumPenalty'
    end
    object dxMemData1SumPenaltyPer: TFloatField
      FieldName = 'SumPenaltyPer'
    end
  end
  object pmVIEW: TPopupMenu
    Images = ilSmall
    Left = 529
    Top = 392
    object N1: TMenuItem
      Action = aPrint
    end
    object Excel1: TMenuItem
      Action = aXLS
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
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
      OnClick = N3Click
    end
  end
  object frxDB: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'RecId=RecId'
      'Kod=Kod'
      'Name=Name'
      'SumAll=SumAll'
      'SumAllPer=SumAllPer'
      'SumMG=SumMG'
      'SumMGPer=SumMGPer'
      'SumFree=SumFree'
      'SumFreePer=SumFreePer'
      'SumPer=SumPer'
      'DrvID=DrvID'
      'SumPenalty=SumPenalty'
      'SumPenaltyPer=SumPenaltyPer')
    DataSet = dxMemData1
    BCDToCurrency = False
    Left = 417
    Top = 243
  end
  object ilSmall: TcxImageList
    FormatVersion = 1
    DesignInfo = 16253696
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000A477
          77E6B38989F8A67D7DEE9A7272E28F6666D6835D5DCA765151BF6D4848B36744
          44A76040409B5A3C3C90533737844E343378422D2C640000000000000000B683
          83F7F7DEDEFFFFEEEEFFFFEAEAFFFDE3E3FFFFEFEFFFFADEDEFFFFE9E9FFF1D1
          D1FFF2D7D7FFE5C2C2FFDFBBBCFFA1ABCEFF9A777EF80000000000000000B784
          84F7F4DBDBFFFDE8E8FFFBE4E4FFF8DEDEFFFCE7E7FFF6D9D9FFFAE4E4FFF4D7
          D7FFFBE6E6FFF3D4D4FFF0D2D2FFB2C8F0FFA07D84F80000000000000000B987
          87F7F5DEDEFFFEEBEBFFFCE7E7FFFBE1E0FFFFEFECFFF9DEDDFFFFEDEAFFF9DB
          D8FFFFE9E5FFF6D7D4FFEFD0D0FFBBCDEEFFA17D84F80000000000000000BA88
          88F7F7E6E6FFFFFBFBFFFFF8F7FFF7F2F6FFBDCAF4FFFDF0F1FFD3D2EFFFC0C3
          EEFFBFBEECFFB5B4EBFFF4DFE4FFFFEAE7FFB08381F80000000000000000BC89
          89F7F8E9E9FFFFFEFEFFFFFDFAFFEDF1FAFF0053FFFFF5F3F8FF95B0FAFF003E
          FFFF1F57FEFF2E5BFDFFEFEAF5FFFFF8F7FFB08787F70000000000000000BF8B
          8BF7F9EAEAFFFFFFFEFFFFFFFBFFF3F4FBFF0667FFFFF4F5F9FFFFFEF8FF8BA8
          FAFF0247FFFFC9D1F8FFFFFAF0FFFFF7F7FFB08787F70000000000000000C18C
          8CF7FBECECFFFFFFFFFF88BCFDFF58A2FDFF1275FFFFF6F6F9FFECEFF9FFEAEE
          F9FFBBC6F9FF002AFFFFF9F2F6FFFFF9F7FFB08787F70000000000000000C28F
          8FF7FCEDEDFFFFFFFFFFF2F7FFFF75B7FFFF0A77FFFFF4F6FCFFC8D7FBFF085B
          FFFF0951FFFF5B83FFFFFFFFF7FFFFFFFFFFB18989F70000000000000000C48F
          8FF7FEF1F1FFFFFFFFFFFFFFFFFFF7F1EDFFDBECFFFFC4C3C3FFFFFFFFFFA7A0
          95FFFFF4E8FF979088FFD2CBCAFF918F8FFFB78E8EF70000000000000000C891
          91F7FFF8F8FF9B9E9EFFA0A2A2FF909291FFB6B4B3FF8B8C8BFFC6C6C6FF8989
          89FFD0C7C7FF746D6DFFDCC9C9FF655D5DFFA27676F50000000000000000C290
          90F6DCB7B7FFD6B6B6FF595252FEC8A0A0FD544B4BF9946E6EE14B3E3EE46549
          49D2473A3AC14F4040CA3A2A2A87403838B61E16163D00000000000000002F21
          2139443E3EC21C11112E3F4141E20D0C0C243C3E3ECD1E1E1E5D3F3F3FB83334
          349D434545AD424242C0474949B13D3E3EA30000000000000000000000000000
          00003535355D414343B94041419D3D3E3EAB3232326E2D2D2D811F1F1F451818
          18430E0E0E27060606120505050F000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000030303031414141E3C3C3C5861616180818181A0949494AF949494AF8080
          809E626262784040405010101013000000000000000000000000000000001919
          192A828282B0DFDFDFF4DFDFDFFFF3F3F3FFF2F2F2FFF1F1F1FFE2E2E2FFE7E7
          E7FFF3F3F3FFF3F3F3FFDCDCDCF27D7D7DA00A0A0A0C000000000707070B8181
          81BAEFEFEFFFE5E5E5FFD2D2D2FFDFDFDFFFD3D3D3FFD4D4D4FFD9CDC4FFCFC0
          B4FFDDDDDDFFDFDFDFFFE1E1E1FFD6D6D6FF5353536500000000030303045B5B
          5B97ECECECFFDEDEDEFFD4D4D4FFBFBFBFFFE5E5E5FFF0EDEAFFBA6A27FFAB79
          4FFFF4F4F5FFD5D5D5FFD8D8D8FFD1D1D1FF4D4D4D5F00000000000000002D2D
          2D56E7E7E7FCE4E4E4FFDBDBDBFFBDBDBDFFDFE0E0FFCD915CFFC76001FFAB58
          0DFFEEEEEEFFE0E0E0FFDBDBDBFFE6E6E6FF2626263100000000000000001212
          121EA6A6A6D9EFEFEFFFD6D6D6FFD5D5D5FFDDC5AEFFD66B04FFD76A01FFC460
          01FFD8CFC5FFDADADAFFE8E8E8FFAAAAAACD0202020100000000000000000202
          02023B3B3B68E4E4E4F7D5D5D5FFEEEEEEFFC69765FF96957EFF7E9C9BFF9C71
          3AFFD6D1C8FFECECECFFDCDCDCF02A2A2A350000000000000000000000000000
          00000606060836363660A6A6A6DCDCDCDCFF4294BFFF52B1E4FF4EB5EBFF2E87
          B6FFEDEDECFFACADAED428292934000000000000000000000000000000000000
          000000000000000000000B0C0C1D303A44AB3E9AE2FF60BDF5FF63C2F1FF4AB8
          EFFF376D8CBA0406060700000000000000000000000000000000000000000000
          00000000000000000000030304311F6AADDF44ABFDFF65C1F9FF64C3F2FF4ABA
          F1FF24A8EEFD0E32465D00000000000000000000000000000000000000000000
          00000000000001010209040D157D61B0F9FE77C3FFFF7FCFFEFF68C7F6FF4ABA
          F1FF24AAF1FF075D8FB900000000000000000000000000000000000000000000
          000000000000010102270A335ADB89BFF1FFADD8FBFFBBE6FFFF78D1FBFF4BBA
          F1FF24AAF1FF07679FCA00000000000000000000000000000000000000000000
          00000101010101010239064D8BF91D5B9AFF2B69A9FF98CCEDFF76D0FBFF4CBC
          F3FF24AAF1FF0744688B00000000000000000000000000000000000000000000
          0000000000000101021E043053BD1772BDFF246EB8FF2F6FAFFF337AB2FF277B
          B3FF208BD0FF0C467CD702060A0E000000000000000000000000000000000000
          000000000000010102040103043B0E4C7CD4267FCBFF2469B3FF165397FF0944
          82FF1C5FA4F207253F6900000000000000000000000000000000000000000000
          00000000000000000000010202040103042105121D700C2845A5071F3890061C
          3261020A111D0000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00C0070000800100000001000000010000800100008001000080030000C007
          0000F00F0000F00F0000E00F0000E00F0000C00F0000E0070000E00F0000F01F
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000010101050101
          01130101012001010123010101200101011A010101130101010A010101040101
          01050101010D0101011301010118010101170101010E01010104010101120101
          0140010101640101016C010101660101015C0101014D0101013A0101012B0101
          012F010101400101014D01010156010101540101013701010110561D0493AA40
          17F2B9562AFAA3532BEE86411EE15A260CC8321201AB0101017A030510810815
          39A70C1C4EC00F2566D40F2371DE070F37B60101015B0101011C9E350EE2D05B
          2FFFDD7D50FFEC9B6EFFE39161FFDC8051FFCF5D29FF6D2E2BF0133AAEF91D5C
          D6FF2773E6FF2870E8FF1C52D8FF102895EF0101015E0101011C782909B5D05F
          33FFDF8256FFEDA271FFD2926BFFD47F53FFDB6A38FF9C4236FF194BCDFF3965
          C5FF3D79D2FF2A7EF2FF1F58D9FF0F2684E10101014401010111270D0141BE52
          25FBE37E4EFFD7804DFFE8C3A7FFDF8D63FFD65E26FF633348F4063CCCFF9695
          B8FF9D9BAFFF1D62DAFF1C51D4FF091548B00101012601010105000000003C13
          015D994D2AF04B6B85FF4693C7FF8E7064FE852901D70D07095B061E67B7495D
          84FF4B6985FF1C438EFF0C1B52D0010204630101012001010102000000000101
          01030A4266AC2593E6FF2592E9FF2079BAFA0A09098E020201420B172B8B2264
          A3FF266BAEFF26425EFF181515D7020202740101012C01010105000000000109
          0E19298ACFF140A6F9FF3DA2F3FF38A0F2FF042B44B20202024B213D5BE72D7C
          CAFF2F81D2FF2A5580FF262120FF0707088B0101012E01010105000000000111
          1A302E82C5FB41A5F3FF4CB3FFFF48B0FFFF124161BB0101013B143455AA3086
          DEFF2D77C2FF2A4A6CFF262323FD0707077A0101012001010102000000000109
          0D1F244B70F82B6194FF3B99DEFF3B98DDFF06223490010101220E1C2B80304E
          6DFF414347FF3B3837FF222225E6030303400101010E00000000000000000102
          0202103752AE4A6F98FF4E7CA6FF194264D9010406300101010A090807393632
          32E6656261FF3F3E40F10B0C0D66010101110101010200000000000000000000
          00000105070E0B2639750D293C8002080C250101010601010101000000000404
          04150E0E0F500606062601010105010101010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF000000000000000000000000000000000000000000000000
          0000800000008000000080000000800000008001000080010000C0830000FFFF
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FB5100000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000C1560500DE5A
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000C2641400B85E
          1100E15B00000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000BD611300C98B
          4700B9621800E75F000000000000000000000000000000000000000000000000
          0000A7440000AB530600AC550B00AC580F00AC5B1300AC5B1500B6682200ECA0
          5200CE945500BC6A2000E9650000000000000000000000000000000000000000
          0000B4560B00D8781300D87C1C00DC842900E08C3400E3934000E5984A00E9A0
          5400F1AA6200D5A06700BD712C00F17000000000000000000000000000000000
          0000B3560C00DB852C00D77D2000DA842D00DE8D3800E3934400E59A4E00EAA1
          5900EFAB6400F6B67600E0AE7C00C07D3F00E875020000000000000000000000
          0000B4560D00E1934300D97D2100DD873000E08E3D00E4974600E79E5200EBA6
          5E00EFAE6C00F6B87A00FFCD9600C7844700E777050000000000000000000000
          0000B75B1100EBB47400E6A15900E9A96900EBB17400EEB67D00F0BC8600F0B4
          7800F2B37400FBC68F00DC8D4500F67100000000000000000000000000000000
          0000B6530900C6712600C6722900C9772E00CB7B3300CC7D3400E7A86B00F6C3
          8E00FCC38A00D7843800F1690000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000CA752B00FFCB
          9500D07B2B00EE67000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000DB813100CE75
          2500E35F00000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000CB620500E25C
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF3E00000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        MaskColor = clBlack
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000472B
          0047FF9900FFFF9900FFFF9900FFFF9900FFFF9900FFFF9900FFFF9900FFFF99
          00FFFF9900FFFF9900FFFF9900FFFF9900FF472B00470000000000000000FF99
          00FF7DE3FFFFA7E8FFFFA2E3FFFF9DDFFFFFFF9900FFD9BFBFFFFFDEDEFFFFDB
          DBFFFFD7D7FFFFD4D4FFFFCFCFFFFFCCCCFFFF9900FF0000000000000000FF99
          00FF6AC1D9FF337FFFFF1959FFFFA2E3FFFFFF9900FFD9C3C3FFFFE1E1FFFFDE
          DEFFFFDBDBFFFFD6D6FFFFD2D2FFFFCFCFFFFF9900FF0000000000000000FF99
          00FF6CC3D9FF66CCFFFF337FFFFFA7E8FFFFFF9900FFD9C5C5FFFFE5E5FFFFE1
          E1FFFFDEDEFFFFD9D9FFFFD6D6FFFFD1D1FFFF9900FF0000000000000000FF99
          00FF6FC5D9FF7FE5FFFF7DE3FFFFABEDFFFFFF9900FFD9CBCBFFFFE8E8FFFFE5
          E5FFFFE0E0FFFFDCDCFFFFD7D7FFFFD2D2FFFF9900FF0000000000000000FF99
          00FF73CAD9FF337FFFFF1959FFFFAFF0FFFFFF9900FFD9CCCCFFFFECECFFFFE6
          E6FFFFE3E3FFFFDEDEFFFFD9D9FFFFD4D4FFFF9900FF0000000000000000FF99
          00FF76CDD9FF66CCFFFF337FFFFFB2F4FFFFFF9900FFD9CFCFFFFFEEEEFFFFEA
          EAFFFFE5E5FFFFE0E0FFFFDBDBFFFFD6D6FFFF9900FF0000000000000000FF99
          00FF7BD1D9FF8DF3FFFF8DF3FFFFB6F7FFFFFF9900FFD9D0D0FFFFF0F0FFFFEA
          EAFFFFE5E5FFFFE0E0FFFFDBDBFFFFD6D6FFFF9900FF0000000000000000FF99
          00FF7ED5D9FF337FFFFF1959FFFFB9FAFFFFFF9900FFD9D0D0FFFFF0F0FFFFEA
          EAFFFFE5E5FFFFE0E0FFFFDBDBFFFFD6D6FFFF9900FF0000000000000000FF99
          00FF82D9D9FF66CCFFFF337FFFFFBCFDFFFFFF9900FFD9D0D0FFFFF0F0FFFFEA
          EAFFFFE5E5FFFFE0E0FFFFDBDBFFFFD6D6FFFF9900FF0000000000000000FF99
          00FF82D9D9FF82D9D9FF82D9D9FF99FFFFFFFF9900FFD6CECEFFD6CBCBFFD6C7
          C7FFD6C3C3FFD6BFBFFFD6BABAFFD6B6B6FFFF9900FF0000000000000000FF99
          00FFFF9900FFEB8500FFEB8500FFEB8500FFEB8500FFEB8500FFEB8500FFEB85
          00FFEB8500FFEB8500FFEB8500FFF79100FFFF9900FF0000000000000000FF99
          00FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC
          99FFFFCC99FFFFCC99FFFFCC99FFFFAD3DFFFF9900FF0000000000000000472B
          0047FF9900FFFF9900FFFF9900FFFF9900FFFF9900FFFF9900FFFF9900FFFF99
          00FFFF9900FFFF9900FFFF9900FFFF9900FF472B004700000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000472B
          0047FF9900FFFF9900FFFF9900FFFF9900FFFF9900FFFF9900FFFF9900FFFFD5
          97FF007500FF007000FF006D00FFFFCA7DFF472B00470000000000000000FF99
          00FFFFE5E5FFFFE5E5FFFFE5E5FFFFE5E5FFFFE3E3FFFFECECFFFFEFEFFFFFEB
          EBFF007D00FF44DD77FF007200FFFFCCCCFFFFCA7DFF0000000000000000FF99
          00FFFFEAEAFFFFEAEAFFFFEAEAFFFFEAEAFFFFE6E6FFFFF1F1FF008700FF0085
          00FF008100FF48E17BFF007A00FF007500FF007000FF0000000000000000FF99
          00FFFFF0F0FFFFF0F0FFFFF0F0FFFFEEEEFFFFECECFFFFF5F5FF008D00FF5EF7
          91FF5AF38DFF53EC86FF48E17BFF45DE78FF007800FF0000000000000000FF99
          00FFFFF5F5FFFFF5F5FFFFF5F5FFFFF3F3FFFFF0F0FFFFF6F6FF009100FF008D
          00FF008B00FF5AF38DFF008300FF008100FF007D00FF0000000000000000FF99
          00FFFFFBFBFFFFFBFBFFFFFBFBFFFFF9F9FFFFF5F5FFFFF7F7FFFFF5F5FFFFF1
          F1FF008F00FF5EF791FF008900FFFFE7E7FFFFD597FF0000000000000000FF99
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFFFFF9F9FFFFF3F3FFFFEEEEFFFFF3
          F3FF009300FF009100FF008D00FFFFEBEBFFFF9900FF0000000000000000FF99
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFFFFF5F5FFFFF0F0FFFFF3
          F3FFFFF1F1FFFFEEEEFFFFEDEDFFFFE6E6FFFF9900FF0000000000000000FF99
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFFFFF5F5FFFFF0F0FFFFEA
          EAFFFFE5E5FFFFE0E0FFFFDBDBFFFFD6D6FFFF9900FF0000000000000000FF99
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFFFFF5F5FFFFF0F0FFFFEA
          EAFFFFE5E5FFFFE0E0FFFFDBDBFFFFD6D6FFFF9900FF0000000000000000FF99
          00FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D3D3FFD6CECEFFD6CBCBFFD6C7
          C7FFD6C3C3FFD6BFBFFFD6BABAFFD6B6B6FFFF9900FF0000000000000000FF99
          00FFFF9900FFEB8500FFEB8500FFEB8500FFEB8500FFEB8500FFEB8500FFEB85
          00FFEB8500FFEB8500FFEB8500FFF79100FFFF9900FF0000000000000000FF99
          00FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC
          99FFFFCC99FFFFCC99FFFFCC99FFFFAD3DFFFF9900FF0000000000000000472B
          0047FF9900FFFF9900FFFF9900FFFF9900FFFF9900FFFF9900FFFF9900FFFF99
          00FFFF9900FFFF9900FFFF9900FFFF9900FF472B004700000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000294202076096091A8CCC0C22A2EA0B21A9F4091DA2EE07138FD80309
          70B100004878696979830C2C6B6B837E76E83B39357E0000000000000000050D
          79AE0F2EB8FE226AE0FF2062DAFF1D5CD7FF1C53D2FF194ACCFF1440C5FF1134
          BCFF747DCEFF6B8EECFF337DFBFD7FDEFFFF8D857BEC00000000000000000D2C
          A5E42572E5FF246FE3FF236CE0FF2065DDFF779DE7FF94AEE9FF9AAFE7FF96A8
          E3FF6E93E4FF2E7DFDFF71E1FFFF2F83F6F61136808200000000000000000A1D
          87C12B84F1FF2A7FEDFF2879EAFF9BBEF3FF8A93A3FF73777DFF727273FF7375
          7DFF8D8C8BFF8CC5D6FF3284FCFD1A3E81810000000000000000000000000000
          497C308EF8FF2F8EF8FF85BAF9FF8E96A6FFBBAB93FFFFD184FFFED085FFFED6
          98FF9A948BFF8D8D8BFF6989CDDB000000000000000000000000000000000000
          0B13123AB4E736A6FFFF9AA9E2FF7E7B7BFFFFDD97FFF2D598FFEFCD90FFF1C8
          82FFFED99DFF73747BF700000000000000000000000000000000000000000000
          000000001E2D0B2199D3A5ABDDFF7B7873FFFFEEBDFFF8E8BBFFF4DDA9FFF0D0
          94FFFFD590FF737372F800000000000000000000000000000000000000000000
          00000000000002080D0DA8CDF4F581817EFFFFFFEAFFFFFEEFFFF9EDC2FFF6DA
          A0FFFFDA96FF5D5D5ED700000000000000000000000000000000000000000000
          00000000000016456B6BB2DDFFFF9EA5ABFFDEDAC4FFFFFFF2FFFFF7CBFFFFE7
          A6FFA69A88EE505050A400000000000000000000000000000000000000000000
          0000000000002B6FA1A183CCFFFFCEECFFFFA0A7ABFF7F7F7EFF7A7975FF7879
          7AFB5C5C5CB00000000000000000000000000000000000000000000000000000
          0000000000001576AFE38CD1FFFF96D6FFFFC3E7FFFFC5E5FEFF9BC5DBFF8CBE
          D5FE6A6D6F710000000000000000000000000000000000000000000000000000
          00000000000000598AD972BFFCFF88CFFFFF89D0FFFF469AD3FF0087BAFF007F
          B2FE0006090E0000000000000000000000000000000000000000000000000000
          000000000000004160930271A4FF2D8DC5FF278BC2FF007EB2FF0099CCFF0063
          8EC9000000000000000000000000000000000000000000000000000000000000
          0000000000000005090E004566A5006A9AEC006796E3006A96DF005980C10010
          1927000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000A600000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000880000008F
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000139B2400159A
          2800009A00000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001194200046CC
          7D00189C2B0000A0000000000000000000000000000000000000000000000000
          00000D811B00168F2A00158E2700158F2800178E2800178E2700209D37004FEB
          850049CE7A001DA0340000A40000000000000000000000000000000000000000
          00001690240044E27E0042DD780046E07B0049E37E004BE681004BE681004DE7
          810051EE86004FD5800023A53C0000AF00000000000000000000000000000000
          0000148E220051E1850040DA730043DD760046E0790049E27C004CE6800050E9
          830052EC850057F38C0056DF89002CAB490000AD020000000000000000000000
          0000148F220061E791003BDB700043DF770045E27A0048E57D004CE8800051EB
          850055EF88005AF38D0067FFA00035C2540004B0050000000000000000000000
          0000169326008CF5B4006AEA980073EE9F0077F1A3007BF3A5007EF4A70067F2
          960059F58E0067FFA00037D4550000B400000000000000000000000000000000
          0000139423002BAB43002BAB40002EAD44002FB145002EAF440041BD58007AFA
          A70067FFA10031CB4C0000AE0000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000022A52E0074FF
          B10029C23F0000AA000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000021B6340025BF
          3A0000A300000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000A60000009D
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000C900000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        MaskColor = clBlack
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9FB
          FC00BED5E20083AFCD00FCFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DAE9F2004D8CB7002874A8000763
          A000237DB0000E7BBD009FCAB600FAFEFA00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00F1F6F900AFC9DC00207AAD00226FA6001677A500AED4E200DFF2F600FFFF
          FD00FFFDFD00268E3B0019B11500BDE7BD00FFFFFF00FFFFFF00FFFFFF006FA2
          C4000654870027709F00C6DAE100F2F0ED00F1EFEB00C8DCE2009FC7D8000878
          A7000073B100006DB4004CEB5D0086CF8600FFFFFF00FFFFFF00FFFFFF000667
          A000D6D1CF00BFD6DE0098C7D8000B85B5000089BC000796C5000B9CC90008A3
          D300009ED2000082C5000A8022004FAB7000FFFFFF00FFFFFF00FFFFFF004FAB
          CF000C95C00017A4CC0023AED2003DC6E40036BFDF002EB8DB0021AFD70015A7
          D20009A0CF000090C700009ECF000BBDF000F9FCFD00FFFFFF00FFFFFF00D8EF
          F8001E99C0005ED9ED0052D0E70048C9E30041C5E00037BEDD002CB5D9001EAD
          D50011A4D100049CCE00008EB90000D6EB00C2E7F100FFFFFF00FFFFFF00FFFF
          FF006DC3E50052C2D30064DDEF0057D3E9004CCBE40040C4E0002DB9DC001CAF
          D70010A6D20009A2D200007DAB000043BC0088A4EE00FFFFFF00FFFFFF00FFFF
          FF00EBF8FD00209DC50078E7F00065DDEF0053D2E80045CBE6005FD3E800C1EE
          F600B3E6F30005A1D000008BB9004BADEF004D5EE900FFFFFF00FFFFFF00FFFF
          FF00FFFFFF008BD3EF0054BDD00075EAF50058CDE500F3FFFF00EDFBFD00E8F8
          FC00D9FBFE0006A3D100019AC8001672C3001E3DE800FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00F8FDFE0028A2CB007CE5EC0056D6EA00D7EDF400D9F0F60067BC
          D8003AB3D80012A7D40005A4D3001B85AF00DBDDFD00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00A9E4FB003BB0C90070E8F30050D5E90042CEE7002DBB
          DC0019A7CF000B95C4000389BD001E95C200F8FCFE00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FEFEFE003EB6E0001FA5CF0022AFE1003EB3DF006ABD
          E10097D1EA00C3E3F300EEF8FB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00F8FDFE00EAF7FC00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        MaskColor = clWhite
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008484840000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF0084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000FF00FF00FF00
          FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00
          FF00FF00FF0084848400FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600FFFF
          FF00C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C60000000000008400000084
          0000008400000084000000840000008400000084000000840000008400000084
          0000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000840000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000084
          0000FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000840000FFFF
          FF00008400000084000000840000008400000084000000840000008400000084
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000840000FFFF
          FF00008400000084000000840000C6C6C6000084000000840000008400000084
          0000C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C6000000000000840000FFFF
          FF00FFFFFF0000840000C6C6C600008400000084000000840000FFFFFF000084
          0000FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000840000FFFF
          FF0000840000C6C6C600008400000084000000840000FFFFFF00FFFFFF000084
          0000C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C6000000000000840000FFFF
          FF00C6C6C6000084000000840000008400000084000000840000FFFFFF000084
          0000FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000840000FFFF
          FF000084000000840000FFFFFF00FFFFFF000084000000840000FFFFFF000084
          0000C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C6000000000000840000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000084
          0000FFFFFF00FFFFFF0000000000000000000000000000000000008400000084
          0000008400000084000000840000008400000084000000840000008400000084
          0000FFFFFF00FFFFFF0084848400FFFFFF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF008484840000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF008484840084848400848484008484840084848400848484008484
          8400848484008484840084848400FF00FF00FF00FF00FF00FF00}
        MaskColor = clFuchsia
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00848484000000000000000000000000000000000000000000000000000000
          00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00000000008484840084848400848484008484840084848400848484008484
          8400848484000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000008484840000000000FF00FF00FF00FF00FF00FF000000
          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF000000
          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF000000
          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00848484000000FF008484
          8400FF00FF00FF00FF00848484000000000084848400FF00FF00FF00FF000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000848484008484840000000000FF00FF00FF00FF000000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000000000000000008484840000000000FF00FF00FF00FF00FF00
          FF00000000000000000000000000000000000000000000000000000000000000
          000000000000FFFFFF00FFFFFF000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF000000000000000000FFFFFF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FFFFFF00000000000000000000000000000000000000
          0000FFFFFF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000FFFFFF000000000000000000000000000000
          000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
          0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
        MaskColor = clFuchsia
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00F8F8F800BBB9B900888B8B00797C7E0077797C008A8C
          8D00BCBDBD00F8F8F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00E2DDDD008983860090949A00B5ACA400C8B6A300C6B29E00AAA1
          9B007C818700797B7E00DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00E3DFDF00938C8F00BCB7B100FED8AC00FFE8B600FFE8BE00FFE9BE00FFE7
          B500FCD2A300A39D970073777A00DEDEDE00FFFFFF00FFFFFF00FFFFFF00F8F7
          F7009D8F9100C7C1BA00FFE4B100FFE4B800FFE1B500FFE0B400FFE0B600FFE6
          C300FFEDCC00FFE1AD00A69E97007A7D7E00F8F8F800FFFFFF00FFFFFF00C9BC
          BC00B2B2B800FFE0B100FFE8BC00FFE4BB00FFE5BD00FFE9BE00FFE6BB00FFE0
          B500FFE1B900FFEECF00FFD5A6007D838800BCBCBD00FFFFFF00FFFFFF00AF9A
          9C00DCD2C600FFECBD00FFE8BF00FFEAC200FFF2C800EAD4AF00E2CDA700FFEE
          C100FFE1B600FFE7C300FFEBBD00B6A89C00898B8D00FFFFFF00FFFFFF00AD97
          9B00EEDEC500FFF6DB00FFEECB00FFF3CA00FFF8D000464850003D434900F9E1
          B800FFEDC100FFE3B800FFECC700D3BCA30077797C00FFFFFF00FFFFFF00B29C
          9F00F4E5C900FFF8E000FFF8DD00FFFFDD00B3AB9200383C43002E3038008B81
          6D00F8E0B800FFE8BB00FFEDC700D8BFA700787A7D00FFFFFF00FFFFFF00BBA1
          A200F5E9D900FFFBDF00FFFFF100CFCBB20001030B00DFD7B600F7EAC6000E11
          1800726A5C00FFEFC100FFEDC200C5B7A70087868900FFFFFF00FFFFFF00D4C0
          C000E4E0E500FFF4CB00E6E5D70000000500C3C0AB00FFFFE400FFFFD800F2E3
          BF00A0948000FFF3C600FFE4B30095979B00B9B9B900FFFFFF00FFFFFF00F9F6
          F600C7ABAD00FFFFF400D7CDAF00A2A49D00FFFFF900FFFCE000FFF7D500FFF4
          CC00FFF4C900FFEFBD00CBC1B5008A858700F8F8F800FFFFFF00FFFFFF00FFFF
          FF00F2E1E100D5BFC300FFFFF800FFFBD200FFFFE600FFFDE300FFF9DE00FFF7
          D000FFE8B800D5CABF00948E9100E1DCDC00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00F2E1E100CAACAE00EAE7E800FBF0DF00FAEBD000F6E5CA00E7DA
          CA00BCB8BC009E8F9200E4DDDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00F9F6F600D3BFC000BBA2A400B59EA200AE9A9E00AF9A
          9C00C9BCBD00F8F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        MaskColor = clWhite
      end>
  end
  object al: TActionList
    Images = ilSmall
    Left = 761
    Top = 187
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Enabled = False
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1091
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1089#1074#1086#1076#1085#1091#1102' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aXLS: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1089#1087#1080#1089#1082#1072' '#1074' Excel'
      ImageIndex = 9
      OnExecute = aXLSExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Enabled = False
      Hint = #1055#1077#1095#1072#1090#1100
      ImageIndex = 10
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      Enabled = False
      Hint = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1087#1086' '#1079#1072#1082#1072#1079#1072#1084
      ShortCut = 16452
      OnExecute = aDetailExecute
    end
    object aPrintShort: TAction
      Caption = #1055#1077#1095#1072#1090#1100' ('#1082#1088#1072#1090#1082#1086')'
      OnExecute = aPrintShortExecute
    end
  end
  object BM: TdxBarManager
    AllowReset = False
    AutoDockColor = False
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
    DockColor = clBtnFace
    LookAndFeel.Kind = lfFlat
    LookAndFeel.SkinName = ''
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 760
    Top = 128
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
      FloatLeft = 195
      FloatTop = 10
      FloatClientWidth = 70
      FloatClientHeight = 154
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbDetail'
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
    object bbRefresh: TdxBarLargeButton
      Action = aRefresh
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDE4C4A8
        C47F4BC06922C0651ABC6B2FCC9575F5E8E0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
        E8DCC87D36DF8227FFA43FFFA33BFFA036FFA030F48B21BF5D11DFAE90FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF7E2CFC8731EFEA74DFFAA4CFFA344FFA13FFFA33BFF9D33FD9429FF
        9F29DC7314D99E7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFB0
        DB9857F4D4B4FFFFFFFBEEE3C97720FFB05BFFAD56FFA94EFFA94CF39839C86D
        18CD8852D4976DC9804DC76513BF5908EAC7B1FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFCB7A23FFCA8DD07E24F6E7D8CF893EFBB468FFB366FFAD5AFFAF5A
        E48E33C99054FAF1EAFFFFFFFFFFFFFFFFFFFAF0EACC895BBD6328FEFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFD08632FFCF9AFDC285C16C13E8A053FFC487FF
        BA74FFB567EE9B43CF9B61FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DE9F77FBEFE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD39048FFD4A4FFCD9BF6BB
        7EFFCB95FFC58BFFC283FFBA73CE8231FDFBF9FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCA870
        FCCC9BFFD1A2FFD0A0FFCC99FFC991FFC990DA8E34F4DFC8FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFE8C398F2BF87FFD7AEFFD2A5FFD0A0FFCA98FDC488C67521F2DDC6
        FEFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF2DCC0E7AD65FFE4C8FFD5ACFFD1A3FFCD9AFF
        C993F4B26CE29339D08329FBF2E8FFFFFFFFFFFFFFFFFFFCF6F3F3E2D7E9CAB8
        DDB29AD3997DCE8E70F6E7DFFFFFFFFFFFFFFFFFFFFBF2E7E39C40FFF3E4FFDC
        BAFFD3A6FFCF9FFFCC97FFC990FFC583EA9841EBD0B1FCF7F3D1864BCD752AC6
        7230CF8447DB9862E6AE7FF3C599FACC9FBF6D3BFFFFFFFFFFFFFFFFFFFFFFFF
        EAA137FEDBB6FAD6ADF3C388EDAE62E39D46DC8D2EE48D26E19B49FDF7F3E6C5
        ADE89F5BFFD397FFD19BFFD4A3FFD7ABFFD9B0FFD8B1FFDFB6C06E35F9F0ECFF
        FFFFFFFFFFFFFFFFFEEFDBEFB76AF1BD78F4CC97F6DAB5F9E8D3FEF7F0FFFFFF
        FFFFFFFFFFFFFAEEE4C67225DB9350F2B67DFFCE9BFFD0A0FFD3A6FFD4A9FFDA
        AED08850E8D1C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBF9ECD2C0B1571DFDC791FFCC9A
        FFCF9EFFD0A0FFD4A3E3A36AD9B19DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D9C6D3
        8339FFCB92FFC78FFFCA95FFCC97FFCC96F5B981C89075FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFEFAF8C5782FFFBB77FFC383FFC588FFC98FF4B578FFCA8FFFCC8EBA734DFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF2E5F4BF7FFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFED09B61EC9A44FFB567FFBA72FFC381DF914BAA4D11FEC5
        8DFFC987BA6832FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDD88722E8AD62FD
        F6EDFFFFFFFFFFFFFFFFFFFCF4ECCE9855E79033FFAF59FFAC57FFB362FBAF63
        C37A3FF2E0D4C16A24FFCF8AB86022FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF9D6AADD7F0ADE8415E3A454E7B475E0A057D37D18F69838FFA84BFFA64BFF
        AA50FFAC54C36D20F9ECE3FFFFFFECC6AEC97F50E6C3AFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF4BE72EF8B15FF982BFB9427FF9A31FF9F38FFA0
        3BFFA13FFFA84CFDAA55C7701DF6E1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C789DE8313FB9832
        FFA94AFFA94EFFAF58FFB15EE5903ACA7D34F9EADCFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF9ECDBDEAC6ED48727D47D17D27C1CCE8A45E6C5A4FEFDFCFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      AutoGrayScale = False
      HotGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDE4C4A8
        C47F4BC06922C0651ABC6B2FCC9575F5E8E0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
        E8DCC87D36DF8227FFA43FFFA33BFFA036FFA030F48B21BF5D11DFAE90FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF7E2CFC8731EFEA74DFFAA4CFFA344FFA13FFFA33BFF9D33FD9429FF
        9F29DC7314D99E7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFB0
        DB9857F4D4B4FFFFFFFBEEE3C97720FFB05BFFAD56FFA94EFFA94CF39839C86D
        18CD8852D4976DC9804DC76513BF5908EAC7B1FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFCB7A23FFCA8DD07E24F6E7D8CF893EFBB468FFB366FFAD5AFFAF5A
        E48E33C99054FAF1EAFFFFFFFFFFFFFFFFFFFAF0EACC895BBD6328FEFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFD08632FFCF9AFDC285C16C13E8A053FFC487FF
        BA74FFB567EE9B43CF9B61FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DE9F77FBEFE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD39048FFD4A4FFCD9BF6BB
        7EFFCB95FFC58BFFC283FFBA73CE8231FDFBF9FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCA870
        FCCC9BFFD1A2FFD0A0FFCC99FFC991FFC990DA8E34F4DFC8FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFE8C398F2BF87FFD7AEFFD2A5FFD0A0FFCA98FDC488C67521F2DDC6
        FEFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF2DCC0E7AD65FFE4C8FFD5ACFFD1A3FFCD9AFF
        C993F4B26CE29339D08329FBF2E8FFFFFFFFFFFFFFFFFFFCF6F3F3E2D7E9CAB8
        DDB29AD3997DCE8E70F6E7DFFFFFFFFFFFFFFFFFFFFBF2E7E39C40FFF3E4FFDC
        BAFFD3A6FFCF9FFFCC97FFC990FFC583EA9841EBD0B1FCF7F3D1864BCD752AC6
        7230CF8447DB9862E6AE7FF3C599FACC9FBF6D3BFFFFFFFFFFFFFFFFFFFFFFFF
        EAA137FEDBB6FAD6ADF3C388EDAE62E39D46DC8D2EE48D26E19B49FDF7F3E6C5
        ADE89F5BFFD397FFD19BFFD4A3FFD7ABFFD9B0FFD8B1FFDFB6C06E35F9F0ECFF
        FFFFFFFFFFFFFFFFFEEFDBEFB76AF1BD78F4CC97F6DAB5F9E8D3FEF7F0FFFFFF
        FFFFFFFFFFFFFAEEE4C67225DB9350F2B67DFFCE9BFFD0A0FFD3A6FFD4A9FFDA
        AED08850E8D1C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBF9ECD2C0B1571DFDC791FFCC9A
        FFCF9EFFD0A0FFD4A3E3A36AD9B19DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D9C6D3
        8339FFCB92FFC78FFFCA95FFCC97FFCC96F5B981C89075FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFEFAF8C5782FFFBB77FFC383FFC588FFC98FF4B578FFCA8FFFCC8EBA734DFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF2E5F4BF7FFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFED09B61EC9A44FFB567FFBA72FFC381DF914BAA4D11FEC5
        8DFFC987BA6832FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDD88722E8AD62FD
        F6EDFFFFFFFFFFFFFFFFFFFCF4ECCE9855E79033FFAF59FFAC57FFB362FBAF63
        C37A3FF2E0D4C16A24FFCF8AB86022FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF9D6AADD7F0ADE8415E3A454E7B475E0A057D37D18F69838FFA84BFFA64BFF
        AA50FFAC54C36D20F9ECE3FFFFFFECC6AEC97F50E6C3AFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF4BE72EF8B15FF982BFB9427FF9A31FF9F38FFA0
        3BFFA13FFFA84CFDAA55C7701DF6E1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C789DE8313FB9832
        FFA94AFFA94EFFAF58FFB15EE5903ACA7D34F9EADCFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF9ECDBDEAC6ED48727D47D17D27C1CCE8A45E6C5A4FEFDFCFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object bbClose: TdxBarLargeButton
      Action = aClose
      Category = 0
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF004E1E1F00BF4C4D00BD4B4C00C04D4E00C14E4F00C4505100C24F
        5000C5515200B64B4C00C9545500C7535400C6525300CA555600CB565700CE58
        5900CC575800C5545500D05A5B00CF595A00D35C5D00D15B5C00D55E5F00D45D
        5E00D8606200D75F6000AF4E4F00D9626300DD656600DC646500DA636400E067
        6800DE666700E2696A00E1686900E56B6C00E36A6B00E96E6F00E76D6E00E66C
        6D009F4B4C00EA6F7000A04C4D00EB707200A34E4F00EE737400ED7273009C4B
        4C00F2767700F0757600EF747500E06D6E00A6515200F6797A00F4787900F377
        7800A9535400F87B7D00F77A7B00FB7E7F00FA7D7E00AF585900AC5657009A4D
        4E00FF818200FE808100FC7F8000F77E7F00B25B5C00EE7A7B00D56F7000B860
        6200B6626300AF5E5F00FE8B8C0091515200FC929300EF909100FB9A9C00E690
        9100EB959600FAA3A400F8AAAB00F2A9AA00EEA6A700F7B5B600A5505000994B
        4B00AB555500B15A5A00B55D5D00B75F5F00914B4B00BB636300BF666600BD65
        65008C4B4B00894B4B009F58580098555500824B4B00EB9C9C00F7B1B100EECE
        AF00FFFFD300D9F6BD00B7EBAA0058A55B003F9E4C005ED3770045CA67001EBC
        4C00000000000000000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000020202020202
        02020202026603020202020202020202020202020202020202026666625E0302
        020202020202020202020202020202666663310B052A03020202020202020202
        02020202026666411C070604042A03596666666666666666020202020266130C
        0D0E0A08092C034C4E505354685757660202020202661112100F0C0D0E2E036E
        71717171717157660202020202661714151112100F58036E7171717171715766
        0202020202661818191617141536036E7171717171715766020202020266201D
        1A1B1819163A036E7171717171715766020202020266221E1F201D1A1B5A036E
        71717171717157660202020202662324212235511F40036D7171717171715766
        020202020266282925265601673F03696C6F6F70707057660202020202662D2B
        27285501525B03696A6A6A6A6B6B5766020202020266342F302D2B4F28460369
        6A6A6A6A6A6A576602020202026639393233342F305C03696A6A6A6A6A6A5766
        0202020202663B3C37383932335D03696A6A6A6A6A6A5766020202020266443D
        3E3B3C37384903696A6A6A6A6A6A576602020202026642424344443D3E5F0369
        6A6A6A6A6A6A5766020202020266424242424243436103696A6A6A6A6A6A5766
        020202020266454242424242426003696A6A6A6A6A6A5766020202020266664B
        48424242426003696A6A6A6A6A6A57660202020202020266664D4A474260035E
        6666666666666666020202020202020202026666656403020202020202020202
        0202020202020202020202020266030202020202020202020202}
      AutoGrayScale = False
      HotGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF00FF00FF004E1E1F00BF4C4D00BD4B4C00C04D4E00C14E4F00C4505100C24F
        5000C5515200B64B4C00C9545500C7535400C6525300CA555600CB565700CE58
        5900CC575800C5545500D05A5B00CF595A00D35C5D00D15B5C00D55E5F00D45D
        5E00D8606200D75F6000AF4E4F00D9626300DD656600DC646500DA636400E067
        6800DE666700E2696A00E1686900E56B6C00E36A6B00E96E6F00E76D6E00E66C
        6D009F4B4C00EA6F7000A04C4D00EB707200A34E4F00EE737400ED7273009C4B
        4C00F2767700F0757600EF747500E06D6E00A6515200F6797A00F4787900F377
        7800A9535400F87B7D00F77A7B00FB7E7F00FA7D7E00AF585900AC5657009A4D
        4E00FF818200FE808100FC7F8000F77E7F00B25B5C00EE7A7B00D56F7000B860
        6200B6626300AF5E5F00FE8B8C0091515200FC929300EF909100FB9A9C00E690
        9100EB959600FAA3A400F8AAAB00F2A9AA00EEA6A700F7B5B600A5505000994B
        4B00AB555500B15A5A00B55D5D00B75F5F00914B4B00BB636300BF666600BD65
        65008C4B4B00894B4B009F58580098555500824B4B00EB9C9C00F7B1B100EECE
        AF00FFFFD300D9F6BD00B7EBAA0058A55B003F9E4C005ED3770045CA67001EBC
        4C00000000000000000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000020202020202
        02020202026603020202020202020202020202020202020202026666625E0302
        020202020202020202020202020202666663310B052A03020202020202020202
        02020202026666411C070604042A03596666666666666666020202020266130C
        0D0E0A08092C034C4E505354685757660202020202661112100F0C0D0E2E036E
        71717171717157660202020202661714151112100F58036E7171717171715766
        0202020202661818191617141536036E7171717171715766020202020266201D
        1A1B1819163A036E7171717171715766020202020266221E1F201D1A1B5A036E
        71717171717157660202020202662324212235511F40036D7171717171715766
        020202020266282925265601673F03696C6F6F70707057660202020202662D2B
        27285501525B03696A6A6A6A6B6B5766020202020266342F302D2B4F28460369
        6A6A6A6A6A6A576602020202026639393233342F305C03696A6A6A6A6A6A5766
        0202020202663B3C37383932335D03696A6A6A6A6A6A5766020202020266443D
        3E3B3C37384903696A6A6A6A6A6A576602020202026642424344443D3E5F0369
        6A6A6A6A6A6A5766020202020266424242424243436103696A6A6A6A6A6A5766
        020202020266454242424242426003696A6A6A6A6A6A5766020202020266664B
        48424242426003696A6A6A6A6A6A57660202020202020266664D4A474260035E
        6666666666666666020202020202020202026666656403020202020202020202
        0202020202020202020202020266030202020202020202020202}
    end
    object bbPrint: TdxBarLargeButton
      Action = aPrint
      Category = 0
      ButtonStyle = bsDropDown
      DropDownMenu = dxBarPopupMenu1
      AutoGrayScale = False
      HotGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9B4B4B4
        979797A9A9A9DADADAFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCD3D3D3A4
        A4A4AFAFAFE4E4E4E0E0E08282827D7D7D858585B3B3B3E5E5E5FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFBEBE
        BEA3A3A3C9C9C9F7F7F7FEFEFEFBFBFBDEDEDE8989898282828383838080807B
        7B7B8C8C8CBEBEBEF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDD
        AEAEAEB3B3B3E2E2E2FEFEFEFEFEFEFBFBFBF8F8F8F5F5F5DBDBDB8F8F8F7979
        796D6D6D7575757E7E7E8484847E7E7E787878959595C8C8C8F7F7F7FFFFFFFF
        FFFFFFFFFFA6A6A6F5F5F5FEFEFEFEFEFEFBFBFBF8F8F8F5F5F5F2F2F2DEDEDE
        B1B1B18585858C8C8C8585857575756868686969697474747F7F7F8484847C7C
        7C787878A3A3A3FFFFFFFFFFFFADADADFEFEFEFBFBFBF8F8F8F5F5F5E9E9E9CD
        CDCDB6B6B6C0C0C0C7C7C78F8F8F7A7A7A7272727D7D7D8A8A8A838383717171
        636363676767747474868686777777FFFFFFFFFFFFADADADF9F9F9F1F1F1DBDB
        DBC5C5C5C6C6C6D9D9D9E7E7E7E5E5E5D5D5D5A8A8A8A2A2A29D9D9D8E8E8E7B
        7B7B7272727C7C7C8989898080806D6D6D8A8A8A797979FFFFFFFFFFFFA8A8A8
        D4D4D4CFCFCFDBDBDBE8E8E8E7E7E7E5E5E5E2E2E2DFDFDFD7D7D7C3C3C3B9B9
        B9B0B0B0A8A8A8A2A2A29E9E9E8F8F8F7D7D7D7272727B7B7B8A8A8A7C7C7CFF
        FFFFFFFFFFAAAAAAEAEAEAEAEAEAE8E8E8E5E5E5E2E2E2DFDFDFDBDBDBD9D9D9
        E4E4E4E2E2E2D9D9D9CECECEC4C4C4BABABAB1B1B1A9A9A9A3A3A39F9F9F9191
        917E7E7E747474FFFFFFFFFFFFADADADE8E8E8E5E5E5E2E2E2DFDFDFDCDCDCD8
        D8D8D6D6D6E6E6E6EDEDEDECECECEBEBEBE8E8E8E2E2E2D9D9D9CFCFCFC4C4C4
        A6AEA888B18EA2B0A4A4A4A4818181FFFFFFFFFFFFADADADE2E2E2DFDFDFDCDC
        DCD8D8D8D4D4D4DADADAE8E8E8F0F0F0F0F0F0EFEFEFEEEEEEEDEDEDECECECEB
        EBEBE8E8E8E3E3E375AF833BD4592DBF3FB5BFB68B8B8BFFFFFFFFFFFFAFAFAF
        CBCBCBD8D8D8D6D6D6DFDFDFC3C3C39E9E9EA1A1A1B6B6B6CBCBCBDDDDDDEAEA
        EAF0F0F0EFEFEFEEEEEEEDEDEDECECECDADADAA6BFACAECCB2ACACACBEBEBEFF
        FFFFFFFFFFF5F5F5C4C4C4ACACACB4B4B4CBCBCB8B8988AD9E8F88807971706F
        7C7C7C8F8F8FA6A6A6BBBBBBD0D0D0E1E1E1EDEDEDEFEFEFEEEEEEE7E7E7A9A9
        A9B2B2B2FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8E0E0E0928C87FF
        E2C6FFE0C2F8D9BBD7BDA5B2A08F8E847B7674737F7F7F9B9B9BD9D9D9D9D9D9
        B1B1B19E9E9EDADADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFECECECACA39AFFE6CEFFE4CBFFE2C7FFE0C4FFDEC0FFDDBCFAD8B6DCBFA397
        8D85A2A2A2BABABAE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFC8C8C8D4C7BCFFEAD7FFE8D3FFE6D0FFE5CCFFE3C9FFE1
        C5FFDFC1FFDDBDC5BDB5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2A0FAEDE0FFEFE0FFEDDCFFEBD9
        FFE9D5FFE7D1FFE5CDFFE4CAF9DDC3CCCAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEDEBFBBB8FFF5ECFF
        F3E9FFF1E5FFEFE1FFEDDEFFECDAFFEAD6FFE8D2CFBEB0F3F3F3FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCA9A9
        A9F7F4F2FFFAF5FFF8F1FFF6EEFFF4EAFFF2E6FFF0E3FFEEDFFDEBDAC1BDB9FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFBFBFBFDDDDDDFFFEFEFFFEFDFFFCFAFFFAF7FFF8F3FFF6EFFFF4EBFFF3
        E8CAC3BBF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF5F5F5BDBDBDD5D5D5D7D7D7E5E5E5F6F6F6FEFEFEFFFDFB
        FFFBF8FFF9F4DDD7D3D7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCECECECD9
        D9D9CFCFCFCDCDCDCACACAC6C5C4D1D0D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object bbDetail: TdxBarLargeButton
      Action = aDetail
      Category = 0
      AutoGrayScale = False
      HotGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFDCCFD0DFCEC7F2CCA5DFBD9FBFC9ABA1D6B4ADDCBDD0D4D2F4EAE2
        F0DFCEE2D7CEDCE1DDE1EAE4E9E9E9EDEDEDFBFBFBF7F7F7F2F2F2F3F3F3F5F5
        F5F7F7F7FBFBFBFFFFFFFFFFFFAF918EE79646E39343F0944776AA3D29CF6327
        D25F9D8575E29145E99A4CFA9A4E49BB4433D76C39E171999280F5AF6DF5AF67
        FDAB6857CE6D60D7877FE19FD7D7D7FFFFFFFFFFFFB19691EEA150DF8E3BE98C
        3B70A23323C5571CC551CBB08FE89543E39344F2914635AC302CC95E22CA5AC8
        AC7CE89443E39344F4914524B83C2AC75845D86FD9D9D9FFFFFFFFFFFFB19694
        F1A85CDC8833E685326F9F301FC14E18C047C9B090E79648E0903FEF8E4131A8
        2929C65A1DC654C4AB7EE69647E08F3EF18C3F22B53924BF4B40CF64DADADAFF
        FFFFFFFFFFB39995F5B068DA8029E37F2A709D2F19BC4311BA3BCBB594E89A4C
        DF8D39EF8C3B30A72726C3531AC24DC5AF82E89749DE8B38EF883720B6381DB8
        3D3ACB58DCDCDCFFFFFFFFFFFFB39C9AFAB976D67B1FDF7A21719D2C14B7390C
        B432CAB494EC9C53DD8833EC87362EA92823BF4D16BE46C8B287E7984DDC872F
        ED833123BB3917B13234C54EDDDDDDFFFFFFFFFFFFB29C9BFEC383D47515DC73
        17719D2A10B33109B12AC2AD8FEB9F56DB852DEA843030AB2B1FBC4613BB40C0
        AC83E9994EDA8129E97E2B25BC3C10AB2731BF42DEDEDEFFFFFFFFFFFFB3A09D
        FFC98FCF6D0CDA6D0D719D2A09AD2602AB1DD1BB9EEEA35ADA8028E97F2B33AE
        2F1BB83F0FB738CAB88EEB9B52D77C21E6792328BF3F0BA61929BA38DDDDDDFF
        FFFFFFFFFFB6A4A1FFD097C95E00D75D0075992507A91D00A713D0BD9FEFA55D
        D77D22E77C2636B13318B43A0CB433CCBA91EA9F56D4781AE4751B2AC23F009C
        0622B52ADCDCDCFFFFFFFFFFFFB4A3A2FFE6D1F8D7C0D3D1A23FCC4E039F1000
        A109D2BD9FF0A764D5781CE4772039B43616B3330AB22CCEBC95EC9F59D27213
        DF6F1241D36425C2404EBC51F3F3F3FFFFFFFFFFFFB3A5A6FCF4F7F8ECF2CBEF
        D435DC5E009700009900CDBC9EF1AB67D57516E4731A3BB73913AF2D07AF25CE
        BF98ECA15CD06E0BD46B04D2B7C2FCDCE8C599A0FFFFFFFFFFFFFFFFFFB3A6A6
        DCD5D5DBCFD1B9DDC03FE26D13B72C2EBC41D7C3A9F1AD6BD17210E171143FB9
        3D0FAC2804AC20CABD96ECA35ECE6904D06700BCAEB0DFD1D1BC9A9AFFFFFFFF
        FFFFFFFFFFB3A8A8FFF9F9F9F1F1FDEFF2FFF0F9FDE5F1F6E1EDFCDFCEF1B16E
        CF6C0ADE6B0F40BF410CA92000A818D5C7A0EFA25ACA5D00CB5B00CBBDBDF2E1
        E1BC9B9BFFFFFFFFFFFFFFFFFFB5A8A8FFF7F7F7EFEFF7EFEFF9F1F1ECE4E4E7
        E0E3FAE0CDF3B474CE6804DE680942C14808A51900A410C3C3ADE1C2AEEAC1A1
        E6BB9CF0E0E1F5E5E5BC9B9BFFFFFFFFFFFFFFFFFFB5AAAAFFFAFAF9F2F2F9F2
        F2F9F2F2EDE6E6E8E1E4FBE2D0F4B678CB6500DA650346C44A04A21300A109BB
        C2B3D3C6CBF1E4E7F2E3E6F0DFDFF6E6E6BC9B9BFFFFFFFFFFFFFFFFFFB4ACAC
        FFFCFCFBF5F5FAF4F4F9F2F2EDE6E6E5DFE1F9E0CEF6B575C85700DB56004AC6
        4C03A00C00A003B4BBACCCBEBFE6D8D8E6D6D6E4D4D4E9DADABB9B9BFFFFFFFF
        FFFFFFFFFFB7B0B0DBD7D7D9D6D6DAD7D7DCD7D7D5CFCFD1CCCCE5DCDBEBDED7
        EDD9D4B2E1B139DA5D009A05009C00B0B7A7C9BCBEE6D7D7E6D7D7E6D7D7EEDE
        DEBC9E9EFFFFFFFFFFFFFFFFFFB7B0B0FFFFFFFDF9F9FDF9F9FEF9F9F1ECECEB
        E5E5FBF4F4F9F1F2FDF1F6B6F7C934DE5D009200009400B9C2AFD6C9CAF1E3E3
        F2E3E3F0E0E0F6E6E6BC9C9CFFFFFFFFFFFFFFFFFFB8B3B3FFFCFCFBF8F8FBF7
        F7FBF7F7F0ECECEAE6E6F9F4F4F7F0F0FBF0F2D6E8D7A8E2B29BD0989CCF97F0
        E8E4DED0D1F0E1E1F0E1E1EFDFDFF5E6E6BB9E9EFFFFFFFFFFFFFFFFFFB8B5B5
        FFFDFDFCFBFBFBF9F9FDF8F8F1EDEDEAE5E5FAF4F4F9F2F2F9F1F1ECE2E3F0E2
        E6FFEFF4FDECF1F9EBECDED2D2F3E5E5F3E5E5F2E2E2FAEAEABD9F9FFFFFFFFF
        FFFFFFFFFFBBB8B8FFFFFFFFFFFFFFFFFFFFFFFFFAF7F7F1ECECFFFCFCFDF6F6
        F9F2F2E8DFDFE4DBDBECE1E1E6DADAE4D6D6CDBEBEDAC9C9D6C3C3D3BDBDD3BC
        BCBB9C9CFFFFFFFFFFFFFFFFFFC4C2C2B3B1B1B3AFAFB2ADADB1AAAAB1ABABB3
        AAAAB3AAAAB6ACACBAB0B0BEB3B3C1B6B6C6B9B9C9BCBCCCC0C0D1C5C5D4C9C9
        D7CCCCDBCFCFDED3D3ECE3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object dxBarButton3: TdxBarButton
      Action = aPrint
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = aPrintShort
      Category = 0
    end
  end
  object oqThread: TOracleQuery
    SQL.Strings = (
      'select max(tt.fk_drvid) as fk_drvid, '
      '       max(tt.fc_fio) as fc_fio,'
      '       max(tt.fc_name) as fc_name,'
      '       sum(tt.sumall) as sumall,'
      '       sum(tt.sumall_per) as sumall_per,'
      '       sum(tt.summg) as summg,'
      '       sum(tt.summg_per) as summg_per,'
      '       sum(tt.sumfree) as sumfree,'
      '       sum(tt.sumfree_per) as sumfree_per,'
      '       sum(tt.sumPenalty) as sumPenalty,'
      '       sum(tt.sumPenalty_per) as sumPenalty_per,'
      '       sum(tt.sum_per) as sum_per'
      '  from (select t.*, '
      
        '       (select fc_fio from taxi.ts_drivers where fk_id = t.fk_dr' +
        'vid) as fc_fio,'
      
        '       to_number((select fc_name from taxi.ts_drivers where fk_i' +
        'd = t.fk_drvid)) as fc_name '
      '  from (select fk_drvid,'
      '               decode(max(fl_peregon),'
      
        '                      1, (sum(decode(fl_free, 0, decode(fn_sumf,' +
        ' 0, fn_sumgorod, fn_sumf), 0))) / 2,'
      
        '                      0, sum(decode(fl_free, 0, decode(fn_sumf, ' +
        '0, fn_sumgorod, fn_sumf), 0))) as sumall,'
      '               decode(max(fl_peregon),'
      
        '                      1, ((sum(decode(fl_free, 0, decode(fn_sumf' +
        ', 0, fn_sumgorod, fn_sumf), 0))*:pPerAll)/100) / 2, '
      
        '                      0, (sum(decode(fl_free, 0, decode(fn_sumf,' +
        ' 0, fn_sumgorod, fn_sumf), 0))*:pPerAll)/100) as sumall_per,'
      '               decode(max(fl_peregon),'
      
        '                      1, (sum(decode(fn_sumfmg, 0, fn_summg, fn_' +
        'sumfmg))) / 2,'
      
        '                      0, sum(decode(fn_sumfmg, 0, fn_summg, fn_s' +
        'umfmg))) as summg,'
      '               decode(max(fl_peregon),'
      
        '                      1, ((sum(decode(fn_sumfmg, 0, fn_summg, fn' +
        '_sumfmg))*:pPerMG)/100) / 2,'
      
        '                      0, (sum(decode(fn_sumfmg, 0, fn_summg, fn_' +
        'sumfmg))*:pPerMG)/100) as summg_per,'
      '               decode(max(fl_peregon),'
      
        '                      1, (sum(decode(fl_free, 1, decode(fn_sumf,' +
        ' 0, fn_sumgorod, fn_sumf), 0))) / 2,'
      
        '                      0, sum(decode(fl_free, 1, decode(fn_sumf, ' +
        '0, fn_sumgorod, fn_sumf), 0))) as sumfree,'
      '               decode(max(fl_peregon),'
      
        '                      1, ((sum(decode(fl_free, 1, decode(fn_sumf' +
        ', 0, fn_sumgorod, fn_sumf), 0))*:pPerFree)/100) / 2,'
      
        '                      0, (sum(decode(fl_free, 1, decode(fn_sumf,' +
        ' 0, fn_sumgorod, fn_sumf), 0))*:pPerFree)/100) as sumfree_per,'
      '               '
      
        '               (select nvl(sum(fn_sumpen), 0) from taxi.tpenalty' +
        ' where fd_datepen >= :pdate1 and fd_datepen <= :pdate2 and fk_dr' +
        'vid = tjournal.fk_drvid) as sumPenalty,'
      
        '               (((select nvl(sum(fn_sumpen), 0) from taxi.tpenal' +
        'ty where fd_datepen >= :pdate1 and fd_datepen <= :pdate2 and fk_' +
        'drvid = tjournal.fk_drvid)*:pPerAll)/100) as SumPenalty_per,'
      '               '
      '               decode(max(fl_peregon),'
      
        '                      1, ((sum(decode(fl_free, 0, decode(fn_sumf' +
        ', 0, fn_sumgorod, fn_sumf), 0))*:pPerAll)/100) / 2, '
      
        '                      0, (sum(decode(fl_free, 0, decode(fn_sumf,' +
        ' 0, fn_sumgorod, fn_sumf), 0))*:pPerAll)/100)+'
      '               decode(max(fl_peregon),'
      
        '                      1, ((sum(decode(fn_sumfmg, 0, fn_summg, fn' +
        '_sumfmg))*:pPerMG)/100) / 2,'
      
        '                      0, (sum(decode(fn_sumfmg, 0, fn_summg, fn_' +
        'sumfmg))*:pPerMG)/100)+    '
      '               decode(max(fl_peregon),'
      
        '                      1, ((sum(decode(fl_free, 1, decode(fn_sumf' +
        ', 0, fn_sumgorod, fn_sumf), 0))*:pPerFree)/100) / 2,'
      
        '                      0, (sum(decode(fl_free, 1, decode(fn_sumf,' +
        ' 0, fn_sumgorod, fn_sumf), 0))*:pPerFree)/100)+'
      
        '                      (((select nvl(sum(fn_sumpen), 0) from taxi' +
        '.tpenalty where fd_datepen >= :pdate1 and fd_datepen <= :pdate2 ' +
        'and fk_drvid = tjournal.fk_drvid)*:pPerAll)/100) as sum_per'
      ''
      '          from taxi.tjournal'
      '         where fn_sos in (:psos)'
      '           and fd_datein >= :pdate1'
      '           and fd_datein <= :pdate2'
      '           and fk_taxiid = :pfk_taxiid'
      '        group by fk_drvid'
      '        order by fk_drvid) t'
      '        '
      'union all         '
      ''
      'select t.*, '
      
        '       (select fc_fio from taxi.ts_drivers where fk_id = t.fk_dr' +
        'vid2) as fc_fio,'
      
        '       to_number((select fc_name from taxi.ts_drivers where fk_i' +
        'd = t.fk_drvid2)) as fc_name '
      '  from (select fk_drvid2,'
      '               decode(max(fl_peregon),'
      
        '                      1, (sum(decode(fl_free, 0, decode(fn_sumf,' +
        ' 0, fn_sumgorod, fn_sumf), 0))) / 2,'
      
        '                      0, sum(decode(fl_free, 0, decode(fn_sumf, ' +
        '0, fn_sumgorod, fn_sumf), 0))) as sumall,'
      '               decode(max(fl_peregon),'
      
        '                      1, ((sum(decode(fl_free, 0, decode(fn_sumf' +
        ', 0, fn_sumgorod, fn_sumf), 0))*:pPerAll)/100) / 2, '
      
        '                      0, (sum(decode(fl_free, 0, decode(fn_sumf,' +
        ' 0, fn_sumgorod, fn_sumf), 0))*:pPerAll)/100) as sumall_per,'
      '               decode(max(fl_peregon),'
      
        '                      1, (sum(decode(fn_sumfmg, 0, fn_summg, fn_' +
        'sumfmg))) / 2,'
      
        '                      0, sum(decode(fn_sumfmg, 0, fn_summg, fn_s' +
        'umfmg))) as summg,'
      '               decode(max(fl_peregon),'
      
        '                      1, ((sum(decode(fn_sumfmg, 0, fn_summg, fn' +
        '_sumfmg))*:pPerMG)/100) / 2,'
      
        '                      0, (sum(decode(fn_sumfmg, 0, fn_summg, fn_' +
        'sumfmg))*:pPerMG)/100) as summg_per,'
      '               decode(max(fl_peregon),'
      
        '                      1, (sum(decode(fl_free, 1, decode(fn_sumf,' +
        ' 0, fn_sumgorod, fn_sumf), 0))) / 2,'
      
        '                      0, sum(decode(fl_free, 1, decode(fn_sumf, ' +
        '0, fn_sumgorod, fn_sumf), 0))) as sumfree,'
      '               decode(max(fl_peregon),'
      
        '                      1, ((sum(decode(fl_free, 1, decode(fn_sumf' +
        ', 0, fn_sumgorod, fn_sumf), 0))*:pPerFree)/100) / 2,'
      
        '                      0, (sum(decode(fl_free, 1, decode(fn_sumf,' +
        ' 0, fn_sumgorod, fn_sumf), 0))*:pPerFree)/100) as sumfree_per,'
      '                      '
      
        '               (select nvl(sum(fn_sumpen), 0) from taxi.tpenalty' +
        ' where fd_datepen >= :pdate1 and fd_datepen <= :pdate2 and fk_dr' +
        'vid = tjournal.fk_drvid2) as sumPenalty,'
      
        '               (((select nvl(sum(fn_sumpen), 0) from taxi.tpenal' +
        'ty where fd_datepen >= :pdate1 and fd_datepen <= :pdate2 and fk_' +
        'drvid = tjournal.fk_drvid2)*:pPerAll)/100) as SumPenalty_per,   ' +
        '  '
      ''
      '               decode(max(fl_peregon),'
      
        '                      1, ((sum(decode(fl_free, 0, decode(fn_sumf' +
        ', 0, fn_sumgorod, fn_sumf), 0))*:pPerAll)/100) / 2, '
      
        '                      0, (sum(decode(fl_free, 0, decode(fn_sumf,' +
        ' 0, fn_sumgorod, fn_sumf), 0))*:pPerAll)/100)+'
      '               decode(max(fl_peregon),'
      
        '                      1, ((sum(decode(fn_sumfmg, 0, fn_summg, fn' +
        '_sumfmg))*:pPerMG)/100) / 2,'
      
        '                      0, (sum(decode(fn_sumfmg, 0, fn_summg, fn_' +
        'sumfmg))*:pPerMG)/100)+    '
      '               decode(max(fl_peregon),'
      
        '                      1, ((sum(decode(fl_free, 1, decode(fn_sumf' +
        ', 0, fn_sumgorod, fn_sumf), 0))*:pPerFree)/100) / 2,'
      
        '                      0, (sum(decode(fl_free, 1, decode(fn_sumf,' +
        ' 0, fn_sumgorod, fn_sumf), 0))*:pPerFree)/100)+'
      
        '               (((select nvl(sum(fn_sumpen), 0) from taxi.tpenal' +
        'ty where fd_datepen >= :pdate1 and fd_datepen <= :pdate2 and fk_' +
        'drvid = tjournal.fk_drvid2)*:pPerAll)/100) as sum_per'
      '          from taxi.tjournal'
      '         where fn_sos in (:psos)'
      '           and fd_datein >= :pdate1'
      '           and fd_datein <= :pdate2'
      '           and fk_taxiid = :pfk_taxiid'
      '           and fk_drvid2 <> 0 '
      '        group by fk_drvid2'
      '        order by fk_drvid2) t) tt'
      '        '
      'group by tt.fk_drvid  '
      'order by fc_name')
    Session = frmMain.os
    ReadBuffer = 1
    Optimize = False
    Variables.Data = {
      0300000007000000070000003A5044415445310C000000000000000000000007
      0000003A5044415445320C00000000000000000000000B0000003A50464B5F54
      4158494944030000000000000000000000080000003A50504552414C4C030000
      000000000000000000070000003A505045524D47030000000000000000000000
      090000003A5050455246524545030000000000000000000000050000003A5053
      4F53010000000000000000000000}
    Threaded = True
    OnThreadRecord = oqThreadThreadRecord
    OnThreadFinished = oqThreadThreadFinished
    OnThreadError = oqThreadThreadError
    Left = 824
    Top = 184
  end
  object odsCntZakaz: TOracleDataSet
    SQL.Strings = (
      'select count(*) as cnt'
      '  from taxi.tjournal'
      ' where fn_sos = 1'
      '   and fd_datein >= :pdate1'
      '   and fd_datein <= :pdate2'
      '   and fk_taxiid = :pfk_taxiid')
    Optimize = False
    Variables.Data = {
      0300000003000000070000003A5044415445310C000000000000000000000007
      0000003A5044415445320C00000000000000000000000B0000003A50464B5F54
      4158494944030000000000000000000000}
    Session = frmMain.os
    Left = 577
    Top = 163
  end
  object odsCntCity: TOracleDataSet
    SQL.Strings = (
      'select count(*) as cnt'
      '  from taxi.tjournal'
      ' where fn_sos = 1'
      '   and fd_datein >= :pdate1'
      '   and fd_datein <= :pdate2'
      '   and fk_taxiid = :pfk_taxiid'
      '   and fl_free = 0')
    Optimize = False
    Variables.Data = {
      0300000003000000070000003A5044415445310C000000000000000000000007
      0000003A5044415445320C00000000000000000000000B0000003A50464B5F54
      4158494944030000000000000000000000}
    Session = frmMain.os
    Left = 649
    Top = 163
  end
  object odsCntFree: TOracleDataSet
    SQL.Strings = (
      'select count(*) as cnt'
      '  from taxi.tjournal'
      ' where fn_sos = 1'
      '   and fd_datein >= :pdate1'
      '   and fd_datein <= :pdate2'
      '   and fk_taxiid = :pfk_taxiid'
      '   and fl_free = 1')
    Optimize = False
    Variables.Data = {
      0300000003000000070000003A5044415445310C000000000000000000000007
      0000003A5044415445320C00000000000000000000000B0000003A50464B5F54
      4158494944030000000000000000000000}
    Session = frmMain.os
    Left = 649
    Top = 259
  end
  object odsCntMG: TOracleDataSet
    SQL.Strings = (
      'select count(*) as cnt'
      '  from taxi.tjournal'
      ' where fn_sos = 1'
      '   and fd_datein >= :pdate1'
      '   and fd_datein <= :pdate2'
      '   and fk_taxiid = :pfk_taxiid'
      '   and fl_free = 0'
      '   and ((fn_summg <> 0) or (fn_sumfmg <> 0))')
    Optimize = False
    Variables.Data = {
      0300000003000000070000003A5044415445310C000000000000000000000007
      0000003A5044415445320C00000000000000000000000B0000003A50464B5F54
      4158494944030000000000000000000000}
    Session = frmMain.os
    Left = 649
    Top = 211
  end
  object dxBarPopupMenu1: TdxBarPopupMenu
    BarManager = BM
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton3'
      end
      item
        Visible = True
        ItemName = 'dxBarButton4'
      end>
    UseOwnFont = False
    Left = 513
    Top = 219
  end
  object frxRepSh: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41125.467140231500000000
    ReportOptions.LastChange = 41349.621361030090000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepGetValue
    Left = 465
    Top = 187
    Datasets = <
      item
        DataSet = frxDB
        DataSetName = 'frxDBDataset1'
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
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 83.149660000000000000
        Top = 18.897650000000000000
        Width = 1084.725110000000000000
        object Memo1: TfrxMemoView
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            #1056#1038#1056#1030#1056#1109#1056#1169#1056#1029#1056#176#1057#1039' '#1056#1030#1056#181#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1057#1034)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 136.063080000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8 = (
            '[TAXI]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 18.897650000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            #1057#1027' [DATE1] '#1056#1111#1056#1109' [DATE2]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 45.354360000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#183#1057#8249#1056#1030'.'
            #1057#1027#1056#1109#1057#8218#1057#1026#1057#1107#1056#1169#1056#1029#1056#1105#1056#1108#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 75.590600000000000000
          Top = 45.354360000000000000
          Width = 151.181200000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1109#1057#8218#1057#1026#1057#1107#1056#1169#1056#1029#1056#1105#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 226.771800000000000000
          Top = 45.354360000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '
            #1056#1111#1056#1109' '#1056#1110#1056#1109#1057#1026#1056#1109#1056#1169#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 302.362400000000000000
          Top = 45.354360000000000000
          Width = 64.252010000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '% '#1056#1111#1056#1109' '
            #1056#1110#1056#1109#1057#1026#1056#1109#1056#1169#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 366.614410000000000000
          Top = 45.354360000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1056#1111#1056#1109
            #1056#1112#1056#181#1056#182#1056#1110#1056#1109#1057#1026#1056#1109#1056#1169#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 442.205010000000000000
          Top = 45.354360000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '% '#1056#1111#1056#1109
            #1056#1112#1056#181#1056#182#1056#1110#1056#1109#1057#1026#1056#1109#1056#1169#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 517.795610000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1056#1111#1056#1109
            #1057#1027#1056#1030#1056#1109#1056#177#1056#1109#1056#1169#1056#1029#1056#1109#1056#1112#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 597.165740000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '% '#1056#1111#1056#1109
            #1057#1027#1056#1030#1056#1109#1056#177#1056#1109#1056#1169#1056#1029#1056#1109#1056#1112#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 835.276130000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' %')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 676.535870000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1025#1057#8218#1057#1026#1056#176#1057#8222#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 755.906000000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '% '#1056#1111#1056#1109
            #1057#8364#1057#8218#1057#1026#1056#176#1057#8222#1056#176#1056#1112)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 162.519790000000000000
        Width = 1084.725110000000000000
        DataSet = frxDB
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo8: TfrxMemoView
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."Kod"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 75.590600000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."Name"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 226.771800000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SumAll"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 302.362400000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SumAllPer"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 366.614410000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SumMG"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 442.205010000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SumMGPer"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 517.795610000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SumFree"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 597.165740000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SumFreePer"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 835.276130000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SumPer"]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 676.535870000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SumPenalty"]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 755.906000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SumPenaltyPer"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 15.118120000000000000
        Top = 321.260050000000000000
        Width = 1084.725110000000000000
        object Memo16: TfrxMemoView
          Width = 789.921770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1038#1056#187#1057#1107#1056#182#1056#177#1056#176' '#1057#8218#1056#176#1056#1108#1057#1027#1056#1105', [DATESYS]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 789.921770000000000000
          Width = 294.803340000000000000
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
      end
      object Footer1: TfrxFooter
        Height = 56.692950000000000000
        Top = 204.094620000000000000
        Width = 1084.725110000000000000
        object Memo12: TfrxMemoView
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#152#1056#1118#1056#1115#1056#8220#1056#1115' '#1056#1038#1056#1032#1056#1114#1056#1114#1056#1106':')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 226.771800000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUMALL]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 366.614410000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUMMG]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 517.795610000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUMFREE]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 835.276130000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUMPER]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 302.362400000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 442.205010000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 597.165740000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Top = 37.795300000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1113#1056#1115#1056#8250#1056#152#1056#167#1056#8226#1056#1038#1056#1118#1056#8217#1056#1115' '#1056#8212#1056#1106#1056#1113#1056#1106#1056#8212#1056#1115#1056#8217':')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 226.771800000000000000
          Top = 37.795300000000000000
          Width = 687.874460000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUMALL_ZAKAZ]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Top = 18.897650000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#152#1056#1118#1056#1115#1056#8220#1056#1115' '#1056#8212#1056#1106#1056#1113#1056#1106#1056#8212#1056#1115#1056#8217':')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 226.771800000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUMALL_Z]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 366.614410000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUMMG_Z]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 517.795610000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUMFREE_Z]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 835.276130000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 302.362400000000000000
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 442.205010000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 597.165740000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 676.535870000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUMPENALTY]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 755.906000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 676.535870000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 755.906000000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
        end
      end
    end
  end
end
