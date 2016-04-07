object frmSprav: TfrmSprav
  Left = 228
  Top = 88
  BorderStyle = bsNone
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
  ClientHeight = 553
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TcxPageControl
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 778
    Height = 506
    Margins.Top = 0
    ActivePage = cxTabSheet5
    Align = alClient
    LookAndFeel.Kind = lfFlat
    LookAndFeel.SkinName = ''
    TabOrder = 0
    OnChange = pcMainChange
    ExplicitLeft = 208
    ExplicitTop = 136
    ExplicitWidth = 769
    ExplicitHeight = 537
    ClientRectBottom = 505
    ClientRectLeft = 1
    ClientRectRight = 777
    ClientRectTop = 21
    object cxTabSheet1: TcxTabSheet
      Caption = '1. '#1052#1045#1046#1043#1054#1056#1054#1044
      ImageIndex = 0
      object grMG: TcxGrid
        Left = 0
        Top = 41
        Width = 776
        Height = 443
        Align = alClient
        PopupMenu = pmMG
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.SkinName = ''
        object tvMG: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsMG
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object tvMGName: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_NAME'
            Width = 207
          end
          object tvMGKM: TcxGridDBColumn
            Caption = #1050#1080#1083#1086#1084#1077#1090#1088#1072#1078
            DataBinding.FieldName = 'FN_KM'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Width = 112
          end
          object tvMGComment: TcxGridDBColumn
            Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
            DataBinding.FieldName = 'FC_REMARK'
            Width = 344
          end
          object tvMGSum: TcxGridDBColumn
            Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100'('#1088#1091#1073'.)'
            DataBinding.FieldName = 'SUM1'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Width = 117
          end
          object tvMGSumO: TcxGridDBColumn
            Caption = #1058#1091#1076#1072'/'#1086#1073#1088#1072#1090#1085#1086' ('#1088#1091#1073'.)'
            DataBinding.FieldName = 'SUM2'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Width = 133
          end
        end
        object grMGLevel1: TcxGridLevel
          GridView = tvMG
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 41
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object cxLabel1: TcxLabel
          Left = 14
          Top = 10
          Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' 1 '#1082#1084' '#1087#1086' '#1084'/'#1075' ('#1088#1091#1073'.) = '
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.TextColor = clBlack
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
          Transparent = True
        end
        object lbCost: TcxLabel
          Left = 203
          Top = 6
          Caption = 'Cost '
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -16
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.TextColor = clBlack
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel2: TcxLabel
          Left = 365
          Top = 10
          Caption = #1060#1080#1083#1100#1090#1088':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.TextColor = clBlack
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
          Transparent = True
        end
        object teF: TcxTextEdit
          Left = 422
          Top = 10
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 119
          Style.LookAndFeel.SkinName = 'Office2007Green'
          Style.TextColor = clNavy
          Style.TextStyle = [fsBold]
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 3
          OnClick = teFClick
          OnEnter = teFEnter
          OnKeyUp = teFKeyUp
          Width = 211
        end
        object bF: TcxButton
          Left = 639
          Top = 7
          Width = 26
          Height = 25
          Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = bFClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000206B0030AAE0000A600000000000000
            00000000000000000000A700009A0000A70000000000000000000000000000A9
            1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
            B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
            00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
            1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
            F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
            52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
            0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
            AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
            5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
            0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
            A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
            6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
            0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
            C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
            13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
            000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
            FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
            00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
            0000000000000000CF0000C00000CE0000000000000000000000000000C40001
            B80000B500000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          LookAndFeel.SkinName = 'Office2007Green'
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = '2. '#1055#1056#1045#1044#1042#1040#1056#1048#1058#1045#1051#1068#1053#1067#1045' '#1047#1040#1050#1040#1047#1067
      ImageIndex = 1
      object grPred: TcxGrid
        Left = 0
        Top = 0
        Width = 585
        Height = 484
        Align = alClient
        PopupMenu = pmPred
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.SkinName = ''
        object tvPred: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnCustomDrawCell = tvPredCustomDrawCell
          DataController.DataSource = dsPred
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object tvPredAdr: TcxGridDBColumn
            Caption = #1040#1076#1088#1077#1089' '#1082#1083#1080#1077#1085#1090#1072
            DataBinding.FieldName = 'ADR'
            Options.Editing = False
            Width = 165
          end
          object tvPredAdr2: TcxGridDBColumn
            Caption = #1040#1076#1088#1077#1089' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
            DataBinding.FieldName = 'ADR2'
            Options.Editing = False
            Width = 156
          end
          object tvPredTime: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103
            DataBinding.FieldName = 'FD_DATE_STR'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Options.Editing = False
            Width = 124
          end
          object tvPredDel: TcxGridDBColumn
            DataBinding.FieldName = 'FL_DEL'
            Visible = False
            VisibleForCustomization = False
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = tvPred
        end
      end
      object paChange: TPanel
        AlignWithMargins = True
        Left = 588
        Top = 0
        Width = 185
        Height = 481
        Margins.Top = 0
        Align = alRight
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        Visible = False
        object cxLabel6: TcxLabel
          Left = 15
          Top = 9
          Caption = #1044#1072#1090#1072':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.TextColor = clBlack
          Style.IsFontAssigned = True
        end
        object deDate: TcxDateEdit
          Left = 72
          Top = 9
          ParentFont = False
          Properties.DateButtons = [btnToday]
          Properties.DateOnError = deToday
          Properties.ImmediatePost = True
          Properties.PostPopupValueOnTab = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.SkinName = 'Office2007Green'
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 1
          Width = 105
        end
        object cxLabel7: TcxLabel
          Left = 15
          Top = 38
          Caption = #1042#1088#1077#1084#1103':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.TextColor = clBlack
          Style.IsFontAssigned = True
        end
        object teTime: TcxTimeEdit
          Left = 72
          Top = 38
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.ImmediatePost = True
          Properties.TimeFormat = tfHourMin
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.SkinName = 'Office2007Green'
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 3
          Width = 81
        end
        object bEnter: TcxButton
          Left = 5
          Top = 71
          Width = 84
          Height = 34
          Action = aOkChange
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Colors.NormalText = clTeal
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4E5C4339D331D931F80C480FEFEFEFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDE6BD0D951114B02B14B129
            0B9B156FC36FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEE9BE0F9A1317
            B22F13AD2B12AB2613AF270A9A1471C371FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0EA
            C00F9E1419B53516B03015AE2C14AD2914AD2713AF290A9A1473C473FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFC2EDC210A1151BB63B1AB43518B13116AF2F13AE2A13AD2913AD2814B0
            280A9A1476C676FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFC3EEC310A51520B9411CB53A1AB33619B23417B1323DBE52
            27B43C0EAC2613AC2814B02A0A9A1478C778FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFC6EECA16AB1F22BB451FB8401DB63B1DB6391B
            B53A17B0310E9F1776D18641BF560EAC2514AE2914B0290A99147AC87AFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2CB23944C7651FBA431FB8
            411EB73E1FB8401AB33632AA32B6E1B6129B1272D1843FBF530EAC2614AD2916
            B12B0A99147CC97CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1FB132
            76D89117B83D1FBA4321BB441CB63931AD31EDF9EDFFFFFFC9ECC90F9A0F74D2
            853DBF530EAC2614AD2A15B12D0A99147FCA7FFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF85CE9046C1616FD58B38C45B26BA462FB131EAF8EAFFFFFFFFFFFF
            FFFFFFC6ECC60E9B0E74D2853ABD5010AE2714AD2B15B12C0A991481CB81FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFD77D5842ABB4041BF5735B53EE9FAEAFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFC5ECC50C9A0C76D2883ABD5010AE2815AF2B
            17B32E0A991483CC83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2FAE4C0ED
            C4F6FDF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0E9C00C9D0D77
            D38938BC4E10AE2915AE2C17B32F0A991386CE86FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFBFE9BF0B9C0D79D48B35BB4C11AF2A15AE2D17B22F0A991392CD92FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAE8BA099D0C77D58B35BB4C11AF2B16B0
            2D17B4321C951EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8E7B8099D0E
            79D48C34BA4C11AF2B18B4342F9D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFB4E7B4079E0E74D58954CA6C089D13ADDDADFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5E3B521A121259F25A6DBA6FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object bCancel: TcxButton
          Left = 95
          Top = 71
          Width = 84
          Height = 34
          Action = aCancelChange
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          Colors.NormalText = clTeal
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFC6C6EE2626B51515AF5959C4D0D0F1FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3FA6464C3A7A7DCFCFCFEFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFF2F2FA191AB91542F01545E80E2CC8070BAB74
            74D4F8F8FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1FB3B3BB50520C60312AC
            2929AB5D5DC5E4E4F6FFFFFFFFFFFFFFFFFFFFFFFF9494DC0E27D81B4FFF194A
            FB1948F51643E3091CB73434BAE1E1F8FFFFFFFFFFFFFFFFFFEEEEFA3636B30A
            29D60D3EF40B39E6072ED4041CB92525AAE6E6F7FFFFFFFFFFFFFFFFFF3939BF
            2554FC2356FF1D4FFF1C4DFE1A4BFB1947F0102DC61818B1CACAF1FFFFFFEEEE
            FA3232B30C2DDA1142F80E3FF40D3CF20B39EE0A37E8041FBB3939B3FBFBFDFF
            FFFFFFFFFF9898E30F10BB2957F92456FF2051FF1F51FF1D4EFD1B4BF41338CE
            0E0EADAAAAE53333B60F31DE1446FC1243F81040F50E3EF40D3DF40B3AEF0A36
            E50212ACA1A1DBFFFFFFFFFFFFFFFFFF3636C62D5DFE2859FF2657FF2455FF23
            55FF2051FF1D4CF7153DD60202A71131DE184CFE1547F91444F81243F71040F5
            0E3EF40C3DF30C3CF2072CD55757BEFFFFFFFFFFFFFFFFFF1214C73C71FF2F61
            FF2B5BFF295AFF2859FF2758FF2455FF1D4EF81B4BF31C4EFD1B4AFD1848FB15
            46F91444F81243F71040F50F41F80B34E70D10AFA4A4E1FFFFFFFFFFFFFDFDFE
            3333C92239DA4275FF3769FF2F60FF2C5DFF2A5AFF285AFF2657FF2152FE1E4F
            FF1C4DFF1A4BFD1849FB1546F91544F91347FB0B29D92A2AB0D5D5F3FFFFFFFF
            FFFFFFFFFFFFFFFFF9F9FE8080DF0F14C13B63F44273FF3565FF2F60FF2B5CFF
            295AFF2859FF2354FF1F50FE1C4EFE1A4BFE1949FC164AFF0920CC4949BEF1F1
            FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3F63535C12338D748
            7AFF3A6BFF3162FF2D5EFF2A5AFF2758FF2354FF1F50FE1D4EFE1C4FFF0A1CC8
            6464CFFBFBFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFBFBFE8080D90F14C0406CFB3768FF3262FF2E5FFF2A5BFF2758FF2455FE1D
            4FFB091AC66B6BD1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFEFEFFB1011BB4273FF3A6AFF3565FF3262FF2E5F
            FF2A5AFF2657FE1E4EF8102DCA3E3EC0FBFBFDFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8787E12740DF4576FF3D6DFF
            3969FF3565FF3262FF2D5EFF295BFF2555FE1C4CEF0A1AB87B7BDAFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFF1A1AC04D
            7DFF4675FF406FFF3D6EFF396AFF3A6BFF3565FF2C5CFF295AFF2252FD1947E3
            060BB1C0C0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFA8A8EC2337D85183FF4877FF4372FF406EFF3D6FFF243FE04375FF3364FF2A
            5BFF2657FF1D4FF9143AD11F1FB8F0F0FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF4545D54D76F85280FF4B79FF4877FF4374FF2342E52929
            BC1420C84274FF3062FF2859FF2353FE1B4BF30C23BF6060D3FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E2FA121ACD6091FF5280FF4D7BFF497AFF
            3C69FA2020C2F1F1FC8989E11522CD4071FF2D5DFF2455FE1F4FFC1847E7050D
            B4B2B2EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8DEA3750E45E8EFF54
            82FF507EFF4B7EFF0F1BCCB9B9F2FFFFFFFFFFFF7C7CE4182AD23B6DFF2859FF
            2051FF1B4AF8133AD31A1AB8EEEEFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F
            DC6893FC6491FF5885FF5281FF3252ED5858DAFFFFFFFFFFFFFFFFFFFFFFFF66
            66D91D35DA3367FF2454FF1C4EFD1948F20B24C36060CEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF9B9BF21E28D3719EFF6A9AFF5485FF0F11C9E4E4FBFFFFFFFFFF
            FFFFFFFFFFFFFFFBFBFE4A4ACA2341E52C60FF2053FF1C52FF1032E11010B8FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABABF52828D7212ED62637DA8686E8
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2FC3131C42246EB102ADC0F11
            C06868D8DBDBF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5
            C5F56969DCF8F8FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6F9
            3737C69292E0F2F2FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.SkinName = 'Office2007Green'
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = '3. '#1058#1072#1082#1089#1080#1089#1090#1099
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 41
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object cxLabel3: TcxLabel
          Left = 12
          Top = 11
          Caption = #1058#1072#1082#1089#1080':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.TextColor = clBlack
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
        object lcbTaxi: TcxLookupComboBox
          Left = 58
          Top = 11
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownSizeable = True
          Properties.GridMode = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'fk_id'
          Properties.ListColumns = <
            item
              FieldName = 'fc_name'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsTaxi
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbTaxiPropertiesChange
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 1
          Width = 145
        end
        object cxLabel4: TcxLabel
          Left = 236
          Top = 11
          Caption = #1060#1080#1083#1100#1090#1088':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.TextColor = clBlack
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
        object teFilter: TcxTextEdit
          Left = 289
          Top = 11
          Properties.CharCase = ecUpperCase
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 3
          OnClick = teFilterClick
          OnEnter = teFilterEnter
          OnKeyUp = teFilterKeyUp
          Width = 224
        end
        object cbFilter: TcxComboBox
          Left = 553
          Top = 11
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownSizeable = True
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items.Strings = (
            #1087#1086#1079#1099#1074#1085#1086#1084#1091
            #1092#1080#1086
            #1084#1072#1096#1080#1085#1077)
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = cbFilterPropertiesChange
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.SkinName = 'Office2007Green'
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 4
          Width = 152
        end
        object cxLabel5: TcxLabel
          Left = 526
          Top = 12
          Caption = #1087#1086':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.TextColor = clBlack
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
      end
      object grDrv: TcxGrid
        AlignWithMargins = True
        Left = 0
        Top = 44
        Width = 776
        Height = 440
        Margins.Left = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        PopupMenu = pmDrv
        TabOrder = 1
        LookAndFeel.Kind = lfFlat
        LookAndFeel.SkinName = ''
        object tvDrv: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsDrv
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = tvDrvDrvNum
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
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
          object tvDrvDrvNum: TcxGridDBColumn
            Caption = #1055#1086#1079#1099#1074#1085#1086#1081
            DataBinding.FieldName = 'FC_NAME'
          end
          object tvDrvFIO: TcxGridDBColumn
            Caption = #1060#1048#1054
            DataBinding.FieldName = 'FC_FIO'
          end
          object tvDrvAuto: TcxGridDBColumn
            Caption = #1052#1072#1096#1080#1085#1072
            DataBinding.FieldName = 'FC_AUTO'
          end
          object tvDrvBag: TcxGridDBColumn
            Caption = #1041#1072#1075#1072#1078#1085#1080#1082
            DataBinding.FieldName = 'FC_BAG'
          end
          object tvDrvTros: TcxGridDBColumn
            Caption = #1058#1088#1086#1089
            DataBinding.FieldName = 'FC_TROS'
          end
          object tvDrvComment: TcxGridDBColumn
            Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
            DataBinding.FieldName = 'FC_COMMENT'
          end
        end
        object grDrvLevel1: TcxGridLevel
          GridView = tvDrv
        end
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = '4. '#1047#1072#1082#1072#1079#1099' '#1087#1086' '#1084'/'#1075
      ImageIndex = 3
      object Panel4: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 770
        Height = 41
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object cxLabel8: TcxLabel
          Left = 12
          Top = 11
          Caption = #1044#1072#1090#1072':'
        end
        object deDateMG: TcxDateEdit
          Left = 51
          Top = 11
          Properties.DateButtons = [btnToday]
          Properties.ImmediatePost = True
          Properties.PostPopupValueOnTab = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.OnChange = deDateMGPropertiesChange
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 1
          Width = 86
        end
        object bPrev: TcxButton
          Left = 146
          Top = 8
          Width = 26
          Height = 25
          Hint = #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1076#1077#1085#1100
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = bPrevClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB
            FCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFEDF7ED53B053FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1F1E130A84424
            A535FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFD2E9D22CA94150F48F1D9229FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2E4C22CB24552EF8B49E4801B
            9032178F29179029159027158E2717902B20902AFFFFFFFFFFFFFFFFFFFFFFFF
            ACDEAC2FBC4C57F3904DE7814BE57F4BE67F4BE58049E37E47E17C45E07A45E5
            811A8F28FFFFFFFFFFFFFFFFFF95D89742CA6265FA9B52ED864FE8824DE6804B
            E47E49E27C47E07A45DE7844DD7747E37F1A9326FFFFFFFFFFFFFFFFFF91D793
            4BCE6A98FFC153F18953ED8751EA844EE8824AE67E48E47C46E27A44E07949E7
            811A9828FFFFFFFFFFFFFFFFFFFFFFFFA8E1A840C45A9FFFC658F38E53F08860
            F0927FF5A979F3A674F2A071EE9E67F29C1C9F2DFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFBEE9BE3AC153A5FFCC6CFA9F34BD5034B54832B54931B3472FB24531B4
            4825AC34FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFCF37BE4BB2FFDC24
            AD34FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFDEF3DE39BD4D20A82CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBF9EB4F
            CD4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFEFAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object bNext: TcxButton
          Left = 178
          Top = 8
          Width = 26
          Height = 25
          Hint = #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#1076#1077#1085#1100
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = bNextClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFBFEFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF36A136EEF8EEFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF21A13130A540E2F4E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF3FAF3FFFFFF1E9A2C46CC7D29A33BD4EFD4FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D892A168F2A158E27158F28178E2817
            8E27209D374FEB8549CE7A28A43EC3EAC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            1F942D44E27E42DD7846E07B49E37E4BE6814BE6814DE78151EE864FD58029A7
            41AFE6AFFFFFFFFFFFFFFFFFFFFFFFFF1C922A51E18540DA7343DD7646E07949
            E27C4CE68050E98352EC8557F38C56DF892EAC4B98DE99FFFFFFFFFFFFFFFFFF
            1A922861E7913BDB7043DF7745E27A48E57D4CE88051EB8555EF885AF38D67FF
            A037C25595DE95FFFFFFFFFFFFFFFFFF1C962C8CF5B46AEA9873EE9F77F1A37B
            F3A57EF4A767F29659F58E67FFA03BD558AAE6AAFFFFFFFFFFFFFFFFFFFFFFFF
            219A302BAB432BAB402EAD442FB1452EAF4441BD587AFAA767FFA13ACD54C0EB
            C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF2DAA3974FFB137C64CD1F0D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EBA403CC64FDFF3DFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF4EC14EECF8ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFEFAFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object bRefresh: TcxButton
          Left = 210
          Top = 8
          Width = 26
          Height = 25
          Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = bRefreshClick
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FFCE84008484840084848400FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00848484008484840084848400FFCE8400FF000000848484008484
            8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0084848400FF000000FF000000FF000000FF000000FF000000FF0000008484
            840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFDE
            AD00FF000000FF000000FFCE8400FFCE8400FF000000FF000000FF000000FF00
            000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFDEAD00FF00
            0000FF000000FF000000FF00FF00FF00FF00FFCE8400FF000000FF0000008484
            8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFDEAD00FF00
            000084848400FF00FF00FF00FF00FF00FF00FFCE8400FF00000084848400FF00
            FF00FF00FF00FF00000084848400FF00FF00FF00FF00FF00FF00FFDEAD00FF00
            000084848400FF00FF00FF00FF00FF00FF00FFCE840084848400FF00FF00FF00
            FF00FF00FF00FFCE8400FF00000084848400FF00FF00FF00FF00FFDEAD00FF00
            000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FFCE8400FF00000084848400FF00FF00FF00FF00FFDEAD00FF00
            000084848400FF00FF00FF00FF00FF00FF00FF00000084848400FF00FF00FF00
            FF00FF00FF00FFCE8400FF00000084848400FF00FF00FF00FF00FF00FF00FFA5
            A500FF000000FF00FF00FF00FF00FF000000FF00000084848400FF00FF00FF00
            FF00FF000000FF00000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF000000FF000000FF00000084848400848484008484
            8400FF000000FF00000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FFCE8400FF000000FF000000FF000000FF000000FF000000FF00
            0000FF00000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FFCE8400FF000000FF000000FFCE8400FFCE8400FFCE
            8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FFCE8400FF00000084848400FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FFCE840084848400FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object bDown: TcxButton
          Left = 242
          Top = 8
          Width = 26
          Height = 25
          Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1079#1072#1082#1072#1079#1091
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = bDownClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2
            BD8FF2C094FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF9CDA9C47E3CCC8139F8CEADFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9C1E08835FF
            D09BD3A779C87325FADCC5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFCE5D4D87C2BFEC991F7BA7DF7B776C99864C86E21FAE6D7FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEDE3D4792AFAC289F4B577F0
            AF6CF0AB67EEA962C58C50C76F25FCEEE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FDF6F0D48239FDC58AF8C48DF0B579EBA660EAA35AE99F55EBA052C28440C775
            34FDF5F2FFFFFFFFFFFFFFFFFFFEFAF8D28441CA7020CB7831DD9656F2C18DE8
            9D53E69A4EDD9348BA6B24B45B12B4570ECB7F45FDFBFAFFFFFFFFFFFFFEFDFD
            FEF8F4FDF7F4FFFFFFCE782FF1BB84E49647E49445DC8F3EAA5511FFFFFFFCF7
            F4FCF8F4FEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC762EEFB77AE0
            8E3CE08E39D98834AA5410FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFC9712AECAF70DD8630DB852ED68229A9500AFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC46C24E7A760D9
            7E21D87D21D37A1CA74D07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFC46B20F0BC7EE49A4BE08B33D57B17A74A03FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD4909B14E0CAE
            4908AB4B0CAF4D0CA6430AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          LookAndFeel.SkinName = 'Office2007Green'
        end
      end
      object grListMG: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 47
        Width = 770
        Height = 434
        Margins.Top = 0
        Align = alClient
        PopupMenu = pmListMG
        TabOrder = 1
        LookAndFeel.Kind = lfFlat
        object tvListMG: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsListMG
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
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
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object tvListMG_Date: TcxGridDBColumn
            Caption = #1042#1088#1077#1084#1103
            DataBinding.FieldName = 'FD_DATEIN'
            PropertiesClassName = 'TcxTimeEditProperties'
            Properties.ImmediatePost = True
            Properties.TimeFormat = tfHourMin
            VisibleForCustomization = False
          end
          object tvListMG_Adr1: TcxGridDBColumn
            Caption = #1040#1076#1088#1077#1089' 1'
            DataBinding.FieldName = 'FC_ADR1'
          end
          object tvListMG_Adr2: TcxGridDBColumn
            Caption = #1040#1076#1088#1077#1089' 2'
            DataBinding.FieldName = 'FC_ADR2'
          end
          object tvListMG_Num: TcxGridDBColumn
            Caption = #8470
            DataBinding.FieldName = 'NUMDRV'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object tvListMG_Avto: TcxGridDBColumn
            Caption = #1052#1072#1096#1080#1085#1072
            DataBinding.FieldName = 'NAMEDRV'
          end
          object tvListMG_F: TcxGridDBColumn
            Caption = #1060#1080#1082#1089#1072#1094#1080#1103
            DataBinding.FieldName = 'FD_DATEF_STR'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object tvListMG_R: TcxGridDBColumn
            Caption = #1056#1072#1089#1095#1077#1090
            DataBinding.FieldName = 'SUM_RAS'
          end
        end
        object grListMGLevel1: TcxGridLevel
          GridView = tvListMG
        end
      end
    end
    object cxTabSheet5: TcxTabSheet
      Caption = '5. '#1064#1090#1088#1072#1092#1099
      ImageIndex = 4
      object grPen: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 47
        Width = 770
        Height = 434
        Margins.Top = 0
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object tvPen: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsPen
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = tvPenColumn1
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
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object tvPenColumn1: TcxGridDBColumn
            Caption = #1044#1072#1090#1072
            DataBinding.FieldName = 'FD_DATEPEN'
          end
          object tvPenColumn2: TcxGridDBColumn
            Caption = #1055#1086#1079#1099#1074#1085#1086#1081
            DataBinding.FieldName = 'FC_NAME'
          end
          object tvPenColumn3: TcxGridDBColumn
            Caption = #1064#1090#1088#1072#1092
            DataBinding.FieldName = 'FN_SUMPEN'
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = tvPen
        end
      end
      object Panel5: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 770
        Height = 41
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object cxLabel9: TcxLabel
          Left = 12
          Top = 11
          Caption = #1055#1077#1088#1080#1086#1076' '#1089':'
        end
        object deBegPen: TcxDateEdit
          Left = 72
          Top = 11
          Properties.DateButtons = [btnToday]
          Properties.ImmediatePost = True
          Properties.PostPopupValueOnTab = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 1
          Width = 86
        end
        object bRefreshPen: TcxButton
          Left = 379
          Top = 8
          Width = 26
          Height = 25
          Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = bRefreshPenClick
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FFCE84008484840084848400FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00848484008484840084848400FFCE8400FF000000848484008484
            8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0084848400FF000000FF000000FF000000FF000000FF000000FF0000008484
            840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFDE
            AD00FF000000FF000000FFCE8400FFCE8400FF000000FF000000FF000000FF00
            000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFDEAD00FF00
            0000FF000000FF000000FF00FF00FF00FF00FFCE8400FF000000FF0000008484
            8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFDEAD00FF00
            000084848400FF00FF00FF00FF00FF00FF00FFCE8400FF00000084848400FF00
            FF00FF00FF00FF00000084848400FF00FF00FF00FF00FF00FF00FFDEAD00FF00
            000084848400FF00FF00FF00FF00FF00FF00FFCE840084848400FF00FF00FF00
            FF00FF00FF00FFCE8400FF00000084848400FF00FF00FF00FF00FFDEAD00FF00
            000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FFCE8400FF00000084848400FF00FF00FF00FF00FFDEAD00FF00
            000084848400FF00FF00FF00FF00FF00FF00FF00000084848400FF00FF00FF00
            FF00FF00FF00FFCE8400FF00000084848400FF00FF00FF00FF00FF00FF00FFA5
            A500FF000000FF00FF00FF00FF00FF000000FF00000084848400FF00FF00FF00
            FF00FF000000FF00000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF000000FF000000FF00000084848400848484008484
            8400FF000000FF00000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FFCE8400FF000000FF000000FF000000FF000000FF000000FF00
            0000FF00000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FFCE8400FF000000FF000000FFCE8400FFCE8400FFCE
            8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FFCE8400FF00000084848400FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FFCE840084848400FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object cxLabel10: TcxLabel
          Left = 164
          Top = 11
          Caption = #1087#1086':'
        end
        object deEndPen: TcxDateEdit
          Left = 187
          Top = 11
          Properties.DateButtons = [btnToday]
          Properties.ImmediatePost = True
          Properties.PostPopupValueOnTab = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 4
          Width = 86
        end
        object bAddPen: TcxButton
          Left = 284
          Top = 8
          Width = 26
          Height = 25
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1096#1090#1088#1072#1092
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = bAddPenClick
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
            C600C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00C6C6C6008484840084848400848484008484
            8400C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00C6C6C6008484840000840000008400008484
            8400C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00C6C6C6008484840000840000008400008484
            8400C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00C6C6C6008484840000840000008400008484
            8400C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C6C6C600C6C6
            C600C6C6C600C6C6C600C6C6C600C6C6C6008484840000840000008400008484
            8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
            8400848484008484840084848400848484008484840000840000008400008484
            84008484840084848400848484008484840084848400C6C6C600C6C6C6000084
            0000008400000084000000840000008400000084000000840000008400000084
            00000084000000840000008400000084000000840000C6C6C60000FF00000084
            0000008400000084000000840000008400000084000000840000008400000084
            0000008400000084000000840000008400000084000000FF000000FF00000084
            0000008400000084000000840000008400000084000000840000008400000084
            0000008400000084000000840000008400000084000000FF000000FF000000FF
            000000FF000000FF000000FF000000FF00000084000000840000008400000084
            000000FF000000FF000000FF000000FF000000FF000000FF0000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF0000FF00000084000000840000008400000084
            000000FF0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF0000FF00000084000000840000008400000084
            000000FF0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF0000FF00000084000000840000008400000084
            000000FF0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF0000FF00000084000000840000008400000084
            000000FF0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF0000FF000000FF000000FF000000FF000000FF
            000000FF0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object bEditPen: TcxButton
          Left = 316
          Top = 8
          Width = 26
          Height = 25
          Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1096#1090#1088#1072#1092
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = bEditPenClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            8484848484848484848484848484848484848484848484848484848484848484
            84848484848484FF00FFFF00FF00000000000000000000000000000000000000
            0000000000000000000000000000000000000000848484FF00FFFF00FF000000
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF000000848484FF00FFFF00FF000000FFFFFF00000000000000000000000000
            0000000000000000000000000000FFFFFF000000848484FF00FFFF00FF000000
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF000000848484FF00FFFF00FF000000FFFFFF00000000000000000000000000
            0000000000000000FFFFFFFFFFFFFFFFFF000000848484FF00FFFF00FF000000
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF000000848484FF00FFFF00FF000000FFFFFF99362F99362F99362F99362F99
            362F99362F99362F99362F99362FFFFFFF000000848484FF00FFFF00FF000000
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF000000848484FF00FFFF00FF000000FFFFFF99362F99362F99362F99362F99
            362F99362F99362FFFFFFFFFFFFFFFFFFF000000848484FF00FFFF00FF000000
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF000000848484FF00FFFF00FF000000FFFFFF00000000000000000000000000
            0000000000000000000000000000FFFFFF000000848484FF00FFFF00FF000000
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF000000848484FF00FFFF00FF00000000000000000000000000000000000000
            0000000000000000000000000000000000000000FF00FFFF00FF}
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object bDelPen: TcxButton
          Left = 348
          Top = 8
          Width = 26
          Height = 25
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1096#1090#1088#1072#1092
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = bDelPenClick
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00848484000000000000000000000000000000000000000000000000000000
            0000000000000000000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF0084848400848484008484
            8400848484008484840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF00FF0000000000FF00FF000000000084848400000000008484
            8400000000008484840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF00FF0000000000FF00FF000000000084848400000000008484
            8400000000008484840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF00FF0000000000FF00FF000000000084848400000000008484
            8400000000008484840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF00FF0000000000FF00FF000000000084848400000000008484
            8400000000008484840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF00FF0000000000FF00FF000000000084848400000000008484
            8400000000008484840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF00FF0000000000FF00FF000000000084848400000000008484
            8400000000008484840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF00FF0000000000FF00FF0000000000FF00FF00000000008484
            8400000000008484840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
            8400848484008484840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00848484000000000000000000000000000000000000000000000000000000
            0000000000000000000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00848484008484
            8400848484008484840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00848484000000000000000000000000000000000000000000000000000000
            0000000000000000000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          LookAndFeel.SkinName = 'Office2007Green'
        end
      end
    end
  end
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 778
    Height = 41
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object b1: TcxButton
      Left = 8
      Top = 7
      Width = 75
      Height = 25
      Action = a1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton1: TcxButton
      Left = 89
      Top = 7
      Width = 144
      Height = 25
      Action = a2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton2: TcxButton
      Left = 239
      Top = 7
      Width = 75
      Height = 25
      Action = a3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bMove: TcxButton
      AlignWithMargins = True
      Left = 720
      Top = 1
      Width = 28
      Height = 25
      Hint = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1092#1086#1088#1084#1091
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnMouseDown = bMoveMouseDown
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE3B8FF9900FF9900FF9900FF9900FF9900FF
        9900FF9900FF9900FF9900FF9900FF9900FF9900FFE3B8FFFFFFFFFFFFFF9900
        FFE5E5FFE5E5FFE5E5FFE5E5FFE3E3FFE0E0FFDEDEFFDBDBFFD7D7FFD4D4FFCF
        CFFFCCCCFF9900FFFFFFFFFFFFFF9900FFEAEAFFEAEAFFEAEAFFEAEAFFE6E6FF
        E5E5FFE1E1FFDEDEFFDBDBFFD6D6FFD2D2FFCFCFFF9900FFFFFFFFFFFFFF9900
        FFF0F0FFF0F0FFF0F0FFEEEEFFECECFFE8E8FFE5E5FFE1E1FFDEDEFFD9D9FFD6
        D6FFD1D1FF9900FFFFFFFFFFFFFF9900FFF5F5FFF5F5FFF5F5FFF3F3FFF0F0FF
        EEEEFFE8E8FFE5E5FFE0E0FFDCDCFFD7D7FFD2D2FF9900FFFFFFFFFFFFFF9900
        FFFBFBFFFBFBFFFBFBFFF9F9FFF5F5FFF0F0FFECECFFE6E6FFE3E3FFDEDEFFD9
        D9FFD4D4FF9900FFFFFFFFFFFFFF9900FFFFFFFFFFFFFFFFFFFFFDFDFFF9F9FF
        F3F3FFEEEEFFEAEAFFE5E5FFE0E0FFDBDBFFD6D6FF9900FFFFFFFFFFFFFF9900
        FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFFF5F5FFF0F0FFEAEAFFE5E5FFE0E0FFDB
        DBFFD6D6FF9900FFFFFFFFFFFFFF9900FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFF
        F5F5FFF0F0FFEAEAFFE5E5FFE0E0FFDBDBFFD6D6FF9900FFFFFFFFFFFFFF9900
        FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFFF5F5FFF0F0FFEAEAFFE5E5FFE0E0FFDB
        DBFFD6D6FF9900FFFFFFFFFFFFFF9900D6D6D6D6D6D6D6D6D6D6D6D6D6D3D3D6
        CECED6CBCBD6C7C7D6C3C3D6BFBFD6BABAD6B6B6FF9900FFFFFFFFFFFFFF9900
        FF9900EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB85
        00F79100FF9900FFFFFFFFFFFFFF9900FFCC99FFCC99FFCC99FFCC99FFCC99FF
        CC99FFCC99FFCC99FFCC99FFCC99FFCC99FFAD3DFF9900FFFFFFFFFFFFFFE3B8
        FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF99
        00FF9900FFE3B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bClose: TcxButton
      AlignWithMargins = True
      Left = 748
      Top = 1
      Width = 28
      Height = 25
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = bCloseClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF5251CE0B15AE9E88A4FFDBA53630AC2C29B2DA
        BAA8FFA318FF9900FF9900FF9900FF9900FF9900FFE3B8FFFFFFFFFFFF2E28AC
        2C72FF1534D42135C4174EFF155CFF3639C4FFF0F0FFDBDBFFD7D7FFD4D4FFCF
        CFFFCCCCFF9900FFFFFFFFFFFF9F89B11325C62C67FF255DFF205BFF1522BECD
        C8EDFFEBEBFFDEDEFFDBDBFFD6D6FFD2D2FFCFCFFF9900FFFFFFFFFFFFFFC266
        BEBBE21022BF2D66FF1C49F47876CBFFF6F6FFE5E5FFE1E1FFDEDEFFD9D9FFD6
        D6FFD1D1FF9900FFFFFFFFFFFFFFD0892D2CAF3F7DFF1C3FDD2961FF1323C5E5
        E1F4FFEDEDFFE5E5FFE0E0FFDCDCFFD7D7FFD2D2FF9900FFFFFFFFFFFFFFD89E
        161EC2396DFF8B8BD43A3BB72B6DFF2A2CBFFFF7F7FFE6E6FFE3E3FFDEDEFFD9
        D9FFD4D4FF9900FFFFFFFFFFFFFFAA2BBDBDF14242C4FFFFFFF4F3FC3434BFC4
        C2F1FFF4F4FFEAEAFFE5E5FFE0E0FFDBDBFFD6D6FF9900FFFFFFFFFFFFFF9900
        FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFFF8F8FFF0F0FFEAEAFFE5E5FFE0E0FFDB
        DBFFD6D6FF9900FFFFFFFFFFFFFF9900FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFF
        F5F5FFF0F0FFEAEAFFE5E5FFE0E0FFDBDBFFD6D6FF9900FFFFFFFFFFFFFF9900
        FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFFF5F5FFF0F0FFEAEAFFE5E5FFE0E0FFDB
        DBFFD6D6FF9900FFFFFFFFFFFFFF9900D6D6D6D6D6D6D6D6D6D6D6D6D6D3D3D6
        CECED6CBCBD6C7C7D6C3C3D6BFBFD6BABAD6B6B6FF9900FFFFFFFFFFFFFF9900
        FF9900EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB85
        00F79100FF9900FFFFFFFFFFFFFF9900FFCC99FFCC99FFCC99FFCC99FFCC99FF
        CC99FFCC99FFCC99FFCC99FFCC99FFCC99FFAD3DFF9900FFFFFFFFFFFFFFE3B8
        FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF99
        00FF9900FFE3B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton3: TcxButton
      Left = 320
      Top = 7
      Width = 89
      Height = 25
      Action = a4
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bPen: TcxButton
      Left = 416
      Top = 7
      Width = 89
      Height = 25
      Action = a5
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object odsMG: TOracleDataSet
    SQL.Strings = (
      
        'select fk_id, fc_name, upper(fc_name) as fc_name_up, fn_km, fc_r' +
        'emark, '
      '       fn_km*:pCostKm as sum1,'
      
        '       (fn_km*:pCostKm)+(fn_km*:pCostKm*:pFlObratno) as sum2    ' +
        '    '
      '  from taxi.ts_mg'
      ' where fl_del = 0'
      'order by fc_name')
    Optimize = False
    Variables.Data = {
      0300000002000000080000003A50434F53544B4D030000000000000000000000
      0B0000003A50464C4F425241544E4F040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000005000000464E5F4B4D0100000000000900000046435F5245
      4D41524B0100000000000400000053554D310100000000000400000053554D32
      010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsMGBeforeOpen
    Left = 411
    Top = 179
  end
  object dsMG: TDataSource
    DataSet = odsMG
    Left = 411
    Top = 131
  end
  object pmMG: TPopupMenu
    Left = 35
    Top = 155
    object N1: TMenuItem
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
      OnClick = N1Click
    end
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = frmMain.AppStorage
    AppStoragePath = 'frmSprav\'
    StoredValues = <>
    Left = 38
    Top = 390
  end
  object dsPred: TDataSource
    DataSet = odsPred
    Left = 475
    Top = 131
  end
  object odsPred: TOracleDataSet
    SQL.Strings = (
      'select fk_id, '
      
        '       fd_date, to_char(fd_date, '#39'dd.mm.yyyy hh24:mi'#39') as fd_dat' +
        'e_str,'
      
        '       (select fc_adr1 from taxi.tjournal where fk_id = tpred.fk' +
        '_jurid) as adr,'
      
        '       (select fc_adr2 from taxi.tjournal where fk_id = tpred.fk' +
        '_jurid) as adr2,'
      '       fl_del,'
      '       fk_jurid '
      '  from taxi.tpred'
      ' where fd_date > sysdate'
      '   and fk_taxiid = :pfk_taxiid'
      '   and fl_del = 0'
      'order by fl_del, fd_date')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50464B5F544158494944030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000005000000464B5F49440100000000000700000046445F4441
      5445010000000000030000004144520100000000000B00000046445F44415445
      5F53545201000000000006000000464C5F44454C010000000000040000004144
      5232010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsPredBeforeOpen
    AfterScroll = odsPredAfterScroll
    Left = 475
    Top = 179
  end
  object al: TActionList
    Left = 35
    Top = 443
    object aEsc: TAction
      Caption = #1054#1050
      ShortCut = 27
      OnExecute = aEscExecute
    end
    object aTab: TAction
      Caption = 'aTab'
      ShortCut = 16393
      OnExecute = aTabExecute
    end
    object a1: TAction
      Caption = #1052#1077#1078#1075#1086#1088#1086#1076
      Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1091#1085#1082#1090#1072#1093' '#1084#1077#1078#1075#1086#1088#1086#1076#1072
      ShortCut = 16433
      OnExecute = a1Execute
    end
    object a2: TAction
      Caption = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1077' '#1079#1072#1082#1072#1079#1099
      Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1080' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1087#1086' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1084' '#1079#1072#1082#1072#1079#1072#1084
      ShortCut = 16434
      OnExecute = a2Execute
    end
    object aOkChange: TAction
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1090#1091' '#1080' '#1074#1088#1077#1084#1103' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1086#1075#1086' '#1079#1072#1082#1072#1079#1072
      OnExecute = aOkChangeExecute
    end
    object aCancelChange: TAction
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      OnExecute = aCancelChangeExecute
    end
    object a3: TAction
      Caption = #1058#1072#1082#1089#1080#1089#1090#1099
      Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1090#1072#1082#1089#1080#1089#1090#1072#1084
      ShortCut = 16435
      OnExecute = a3Execute
    end
    object a4: TAction
      Caption = #1047#1072#1082#1072#1079#1099' '#1087#1086' '#1084'/'#1075
      Hint = #1055#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1079#1072#1082#1072#1079#1099' '#1087#1086' '#1084'/'#1075
      ShortCut = 16436
      OnExecute = a4Execute
    end
    object a5: TAction
      Caption = #1064#1090#1088#1072#1092#1099
      Hint = #1064#1090#1088#1072#1092#1099' '#1087#1086' '#1087#1086#1079#1099#1074#1085#1099#1084
      ShortCut = 16437
      OnExecute = a5Execute
    end
  end
  object dsTaxi: TDataSource
    DataSet = odsTaxi
    Left = 179
    Top = 147
  end
  object odsTaxi: TOracleDataSet
    SQL.Strings = (
      'select -1 as fk_id, '#39#1042#1089#1077#39' as fc_name from dual'
      'union all'
      'select fk_id, fc_name from taxi.ts_taxi where fl_del = 0'
      'order by fk_id')
    Optimize = False
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 179
    Top = 195
  end
  object dsDrv: TDataSource
    DataSet = odsDrv
    Left = 171
    Top = 299
  end
  object odsDrvAll: TOracleDataSet
    SQL.Strings = (
      'select fk_id,'
      '       fc_name, upper(fc_name) as fc_name_up,'
      '       fc_fio, upper(fc_fio) as fc_fio_up,'
      '       fc_auto, upper(fc_auto) as fc_auto_up,'
      '       fc_bag,'
      '       fc_tros,'
      '       fc_comment  '
      '  from taxi.ts_drivers'
      ' where fl_del = 0'
      'order by to_number(fc_name)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000700000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000600000046435F46494F0100000000000700000046435F41
      55544F0100000000000600000046435F4241470100000000000700000046435F
      54524F530100000000000A00000046435F434F4D4D454E54010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 171
    Top = 347
  end
  object odsDrv: TOracleDataSet
    SQL.Strings = (
      'select fk_id,'
      '       fc_name, upper(fc_name) as fc_name_up,'
      '       fc_fio, upper(fc_fio) as fc_fio_up,'
      '       fc_auto, upper(fc_auto) as fc_auto_up,'
      '       fc_bag,'
      '       fc_tros,'
      '       fc_comment  '
      '  from taxi.ts_drivers'
      ' where fl_del = 0'
      '   and fk_taxiid = :pfk_taxiid'
      'order by to_number(fc_name)')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50464B5F544158494944030000000000000000
      000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 220
    Top = 347
  end
  object pmPred: TPopupMenu
    Left = 35
    Top = 203
    object nChangeTime: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8BBB9B9888B8B79
        7C7E77797C8A8C8DBCBDBDF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE2DDDD89838690949AB5ACA4C8B6A3C6B29EAAA19B7C8187797B7EDEDE
        DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3DFDF938C8FBCB7B1FED8ACFFE8B6FF
        E8BEFFE9BEFFE7B5FCD2A3A39D9773777ADEDEDEFFFFFFFFFFFFFFFFFFF8F7F7
        9D8F91C7C1BAFFE4B1FFE4B8FFE1B5FFE0B4FFE0B6FFE6C3FFEDCCFFE1ADA69E
        977A7D7EF8F8F8FFFFFFFFFFFFC9BCBCB2B2B8FFE0B1FFE8BCFFE4BBFFE5BDFF
        E9BEFFE6BBFFE0B5FFE1B9FFEECFFFD5A67D8388BCBCBDFFFFFFFFFFFFAF9A9C
        DCD2C6FFECBDFFE8BFFFEAC2FFF2C8EAD4AFE2CDA7FFEEC1FFE1B6FFE7C3FFEB
        BDB6A89C898B8DFFFFFFFFFFFFAD979BEEDEC5FFF6DBFFEECBFFF3CAFFF8D046
        48503D4349F9E1B8FFEDC1FFE3B8FFECC7D3BCA377797CFFFFFFFFFFFFB29C9F
        F4E5C9FFF8E0FFF8DDFFFFDDB3AB92383C432E30388B816DF8E0B8FFE8BBFFED
        C7D8BFA7787A7DFFFFFFFFFFFFBBA1A2F5E9D9FFFBDFFFFFF1CFCBB201030BDF
        D7B6F7EAC60E1118726A5CFFEFC1FFEDC2C5B7A7878689FFFFFFFFFFFFD4C0C0
        E4E0E5FFF4CBE6E5D7000005C3C0ABFFFFE4FFFFD8F2E3BFA09480FFF3C6FFE4
        B395979BB9B9B9FFFFFFFFFFFFF9F6F6C7ABADFFFFF4D7CDAFA2A49DFFFFF9FF
        FCE0FFF7D5FFF4CCFFF4C9FFEFBDCBC1B58A8587F8F8F8FFFFFFFFFFFFFFFFFF
        F2E1E1D5BFC3FFFFF8FFFBD2FFFFE6FFFDE3FFF9DEFFF7D0FFE8B8D5CABF948E
        91E1DCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E1E1CAACAEEAE7E8FBF0DFFA
        EBD0F6E5CAE7DACABCB8BC9E8F92E4DDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF9F6F6D3BFC0BBA2A4B59EA2AE9A9EAF9A9CC9BCBDF8F7F7FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1088#1077#1084#1103
      OnClick = nChangeTimeClick
    end
    object nOtmena: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFEBEBF83639C02127B88484D4F8F8FCFFFFFFFF
        FFFFFFFFFFFFFFFF7A7AD17474C8D5D5F1FFFFFFFFFFFFFFFFFFFFFFFF7272CF
        1844F6194DF81031D23031BADBDBF5FFFFFFFEFEFE6C6CD20928D7092ED70313
        B37070D0FFFFFFFFFFFFFFFFFF3031C12451F91F52FF1D4FFF1744E8171DB6C5
        C5ED6868CE0D2EDD1142F90D3DF50B3BF0041ABCA2A2DEFFFFFFFFFFFFBDBDEA
        1832DB285BFF2456FF2253FF1B4BF10911B20F30DD164AFE1344F91041F60E3E
        F60A3CF04040B7FFFFFFFFFFFFAEAEEA1F37DD3A6FFF2C5EFF295AFF2657FF20
        52FC1C4FFF194AFD1646FA1445FA0F3DF21A21B8BCBCE8FFFFFFFFFFFFFEFEFE
        9999E9202ACB3D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED3436
        BDE5E5F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3F94545CA2E4EE73668FF2E
        5EFF2859FF2254FF163DEA4141BEF4F4FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFB2B2EC253FDF3B6DFF3464FF2E5EFF2759FF1B46EA3031BCF7F7
        FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4040D54B7CFF4170FF3B
        6BFF396CFF2D5EFF2558FF1336D76C6CD5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFD3D3F8273DDB5080FF4575FF3662FA0E15C33C6DFF2A5BFF2053FD0D1F
        C4B8B8EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7474E3527CFA5081FF4B7DFF1F
        26CDBDBDED2329CC386AFF2456FF1A4AF21E22BBF0F0FBFFFFFFFFFFFFFFFFFF
        FFFFFF3038E16A9CFF5788FF2B46E7A3A3EDFFFFFFCDCDF51B27CE3065FF1F51
        FF1439DD6363CFFFFFFFFFFFFFFFFFFFFFFFFF6E6EEC3B53E45782FB3E3EDBFF
        FFFFFFFFFFFFFFFFB8B8F1192AD7265AFF0F2EE33132C5FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFC3C3F45B5BD6CFCFF6FFFFFFFFFFFFFFFFFFFFFFFF9C9CE84344
        CBB6B6EAFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1079#1072#1082#1072#1079
      OnClick = nOtmenaClick
    end
    object nComeBack: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F1C389DC9132D99846EEC99EFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0AA4CFFE2C3F6C694EAA04BE49131E3
        A769FDF6EFFFFFFFFFFFFFFFFFFFFFFFFFF8E4D6FBF6F3FFFFFFFFFFFFFEFEFD
        EA993CFFD8B1FFC790FFC98EFFCA8EEFA658D8842AE6A562FFFFFFFFFFFFFFFF
        FFE6B895DBAD87FFFFFFFFFFFFEAC196E8A150FFD5A9FFC48BFFCC9AFFCC98FF
        C583FFCC87E0882DFEF7F1FFFFFFFFFFFFE6B998C57F49FFFFFFFFFFFFE2B583
        FBCC9AFFC78DFFC286FFCF9BD9872DCF8845DC9751F3C79FFFFFFFFFFFFFFFFF
        FFE2B28FC06623FFFFFFFFFFFFDA9C54FFDAB3FFC284FCC185FFC180FEBB75DC
        9C5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD69461CE6813FFFFFFFFFFFFD69344
        FFDCB2DB9039D98D34FFD9AEFFBE76E19038EFCCAAFFFFFFFFFFFFFFFFFFFFFF
        FFD7803ACF680FFFFFFFFFFFFFD99040FFCA94DFB284DDAC7EFDCF9FFFBF7AFF
        B96CD17D2FF0D1B4FFFFFFFFFFFFE4B590EA8017C8681BFFFFFFFFFFFFEBB781
        E8A258FDFBF9FCF9F6D38434FFE0B9FFB362FFB15CD47A24D2894CD08143DB74
        14FFA222C17A4EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E3D3D4802FFF
        DEB3FFAF58FFA948FFA841FFA132FF9D23E37510E2B99BFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF4DBC7CB792AFFCD99FFD094FFC175FFA93BEA78
        11D8926BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9
        EFE9CC9570C4702BC36821BF6F39DCAC89FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = #1042#1077#1088#1085#1091#1090#1100
      OnClick = nComeBackClick
    end
    object nNow: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF7EF87BA873B8C391B
        78141B771339883784B584ECF3ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFB8DCB81785160888000F8D001388001F7E00327200266D00197313B2D6
        B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9DEB908880A04A008009D0000A30D00
        9A000097000094001E7E00396B00136C04B2D4B2FFFFFFFFFFFFFFFFFFF1F9F1
        1D911E0BA81701A10D38BF54DCF3E97ADD9B009D030099000098001285003A6C
        00187513ECF3ECFFFFFFFFFFFF8CC38C24A82F08A91B2BB43EF6F0F5FCF6FAFF
        FFFF7DDE9C009E07009B02009900217D00266E0083B583FFFFFFFFFFFF41A23F
        39BF4F20AA2AECE6EAF5EEF4FFF7FFFFFBFFFFFFFF7DDD9C009F09009B020294
        00367100368A36FFFFFFFFFFFF279D2C3BBE50AAC9A7FAEAF9D1E1D11EAF33DA
        EFDDFFFFFFFFFFFF7BDD9B009E07009A00297C00187911FFFFFFFFFFFF2AA02E
        5DD27C17A3258EBF8811AB241BB9400BAD27DBEFDFFFFFFFFFFFFF7BDB99009E
        021B8600187A11FFFFFFFFFFFF41A84177DC952CC55A1FBB4529C45626C04F22
        BB450BAC26DAEEDDFFFCFFFFFDFF78DB96138C00399038FFFFFFFFFFFF8FC98F
        53C66C61D8892ECA622FC9612CC55927C04D20B94209AA22DAEDDDFFF9FFCAEC
        D70E8E0886BB86FFFFFFFFFFFFF3FBF328A42D83E5A74CD3792ECB632FC96029
        C35422BB461CB53A0BA81F7ACC8511AD24178516EFF6EFFFFFFFFFFFFFFFFFFF
        BFE8BF28A83181E3A65ED88831CA6327C35321BC471DB63B16B02E0FA920088D
        0BB8DFB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFE8BF28A52D56CA7377E09C59
        D37E43C86636C1541EAA2F1C941CB9DFB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3FBF38FCB8F42AB422CA43127A02E41A6408CC58CF1F8F1FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = '"'#1057#1077#1081#1095#1072#1089'"'
      OnClick = nNowClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MenuItem1: TMenuItem
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
      OnClick = MenuItem1Click
    end
  end
  object pmDrv: TPopupMenu
    Left = 35
    Top = 251
    object MenuItem2: TMenuItem
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
      OnClick = MenuItem2Click
    end
  end
  object odsListMG: TOracleDataSet
    SQL.Strings = (
      'select t1.fk_id,'
      '       fd_datein,'
      
        '       decode(t1.fn_sos, 5, '#39#1053#1045#1042#1067#1061#1054#1044'! '#39'||t1.fc_adr1, t1.fc_adr1)' +
        '||'#39' '#39'||decode(to_char(t1.fn_stop), 0, '#39#39', null, '#39#39', '#39'(+'#39'||to_cha' +
        'r(t1.fn_stop)||'#39')'#39') as fc_adr1,'
      '       t1.fc_adr2||'#39' '#39'||'
      
        '       decode(decode(to_char(t1.fn_km1), 0, '#39#39', to_char(t1.fn_km' +
        '1))||decode(to_char(t1.fn_km2), 0, '#39#39', '#39'/'#39'||to_char(t1.fn_km2)),'
      '              '#39#39','
      
        '              decode(to_char(t1.fn_km1), 0, '#39#39', to_char(t1.fn_km' +
        '1))||decode(to_char(t1.fn_km2), 0, '#39#39', '#39'/'#39'||to_char(t1.fn_km2)),'
      
        '              decode(to_char(t1.fn_km1), 0, '#39#39', to_char(t1.fn_km' +
        '1))||decode(to_char(t1.fn_km2), 0, '#39#39', '#39'/'#39'||to_char(t1.fn_km2))|' +
        '|'#39' '#1082#1084#39') as fc_adr2,'
      '       nvl(decode(t1.fl_bagage_real, '
      
        '                  0, t4.fc_name||decode(fk_drvid2, 0, null, '#39', '#39 +
        '||(select fc_name from taxi.ts_drivers where fk_id = fk_drvid2))' +
        ','
      
        '                  1, t4.fc_name||decode(fk_drvid2, 0, null, '#39', '#39 +
        '||(select fc_name from taxi.ts_drivers where fk_id = fk_drvid2))' +
        '||'#39' ('#1041')'#39'), '#39' '#39') as numdrv,'
      '       decode(t4.fc_name, null, '#39#39', t4.fc_auto||'
      
        '       decode(fk_drvid2, 0, null, '#39', '#39'||(select fc_auto from tax' +
        'i.ts_drivers where fk_id = fk_drvid2))) as namedrv,'
      
        '       to_char(decode(fn_sos2, 0, (select fd_date from taxi.tpre' +
        'd where fk_jurid = t1.fk_id), t1.fd_datef), '#39'hh24:mi'#39') as fd_dat' +
        'ef_str,'
      
        '       round(decode(t1.fn_sumf, null, t1.fn_sumr, 0, t1.fn_sumr,' +
        ' t1.fn_sumf)) as sum_ras'
      ' '
      '  from taxi.tjournal t1, taxi.ts_drivers t4'
      ' where t1.fk_taxiid = :pfk_taxiid'
      '   and t1.fk_adr2id = :pfk_adr2id'
      '   and t1.fd_datein >= :pdate and fd_datein < to_date(:pdate)+1'
      '   and t1.fk_drvid = t4.fk_id(+)'
      'order by fd_datein')
    Optimize = False
    Variables.Data = {
      03000000030000000B0000003A50464B5F544158494944030000000000000000
      0000000B0000003A50464B5F4144523249440300000000000000000000000600
      00003A50444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000005000000464B5F49440100000000000900000046445F4441
      5445494E0100000000000700000046435F414452310100000000000700000046
      435F41445232010000000000060000004E554D44525601000000000007000000
      4E414D454452560100000000000C00000046445F44415445465F535452010000
      0000000700000053554D5F524153010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsListMGBeforeOpen
    AfterOpen = odsListMGAfterOpen
    Left = 540
    Top = 181
  end
  object dsListMG: TDataSource
    DataSet = odsListMG
    Left = 540
    Top = 133
  end
  object pmListMG: TPopupMenu
    Left = 35
    Top = 307
    object MenuItem3: TMenuItem
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
      OnClick = MenuItem3Click
    end
  end
  object odsPen: TOracleDataSet
    SQL.Strings = (
      'select t1.fk_id, t1.fd_datepen, t1.fn_sumpen, t1.fk_drvid,'
      '       t2.fc_name '
      '  from taxi.tpenalty t1, taxi.ts_drivers t2'
      ' where t1.fd_datepen >= :pDate1'
      '   and t1.fd_datepen < :pDate2+1'
      '   and t1.fk_drvid = t2.fk_id'
      '   and t2.fk_taxiid = :pfk_taxiid')
    Optimize = False
    Variables.Data = {
      0300000003000000070000003A5044415445310C000000000000000000000007
      0000003A5044415445320C00000000000000000000000B0000003A50464B5F54
      4158494944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F494401000000000009000000464E5F5355
      4D50454E0100000000000A00000046445F4441544550454E0100000000000700
      000046435F4E414D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsPenBeforeOpen
    AfterOpen = odsPenAfterOpen
    Left = 604
    Top = 181
  end
  object dsPen: TDataSource
    DataSet = odsPen
    Left = 604
    Top = 133
  end
end
